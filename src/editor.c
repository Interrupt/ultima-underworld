/* The level editor. The original UW1 had one (a "Underworld Editor" string survives in UW.EXE, and a screenshot of
   its object mode survives, see editor-research/). Its screen was 320x200 -- the screenshot is a 3.125x upscale --
   which fits the game's own framebuffer, so it is built here as an overlay on the in-game dungeon view:

     3D view (0,0)-(148,124)          mode palette (153,0)-(175,200)       tile map (176,0)-(320,116)
     picked object editor (0,126)-(150,190)      tile object strip (194,119)-(299,141)
     object palette (174,148)-(320,190)          info bar (0,192)-(320,200)

   The 3D pass renders into the fullscreen view's scene buffer (see fullscreen_view.c) and the result is scaled down
   into the 3D pane when the frame is presented (uw_editor_compose). Everything else is drawn into a separate editor
   buffer with the game's own text and sprite decoders; nothing here touches the game's HUD framebuffer. */
#include "headers/editor.h"
#include "headers/uw.h"
#include "headers/options.h"
#include "headers/fullscreen_view.h"
#include "headers/input.h"
#include "headers/interact.h"
#include "headers/automap.h"
#include "headers/objects.h"
#include "headers/3d.h"
#include "headers/ai.h"
#include "headers/debug_ui.h"
#include "headers/saveload.h"
#include "headers/file_io.h"
#include "headers/traps.h"

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

extern short DAT_00201b64;   /* game mode; 0 == in-game 3D dungeon view */
extern short DAT_00201b68;   /* dungeon level, 0-based */
extern char *DAT_0023b82c;   /* the object the camera tracks; 0 == the free camera */
extern unsigned short *uw_fullscreen_scene_pixels(void);
extern int uw_scancode_held(int sc);   /* gx_stub.c */

#define ED_W 320
#define ED_H 200
#define RGB(r, g, b) ((unsigned short)((((r) >> 3) << 11) | (((g) >> 2) << 5) | ((b) >> 3)))

typedef struct { int x0, y0, x1, y1; } ed_rect_t;   /* x1, y1 exclusive */
static const ed_rect_t R_VIEW = { 0, 0, 148, 124 };
static const ed_rect_t R_PALETTE = { 153, 0, 175, 200 };
static const ed_rect_t R_MAP = { 176, 0, 320, 116 };
static const ed_rect_t R_STRIP = { 194, 119, 299, 141 };
static const ed_rect_t R_OBJPAL = { 174, 148, 320, 190 };
static const ed_rect_t R_INFO = { 0, 192, 320, 200 };

#define COL_BLACK 0
#define COL_FRAME RGB(150, 150, 150)
#define COL_ORANGE RGB(224, 120, 24)
#define COL_PINK RGB(236, 168, 176)
#define COL_BLUE RGB(40, 56, 216)
#define COL_GREEN RGB(96, 140, 72)
#define COL_TEXT RGB(232, 224, 160)
#define COL_INFO_BG RGB(8, 8, 56)

static int g_active;
static int g_entered_fullscreen;        /* the editor turned fullscreen on, so it turns it off again */
static unsigned short g_screen[ED_W * ED_H];

/* What is selected: a tile (clicked on the map) and an object on it or in a container (from the strip). */
static int g_sel_tx = -1, g_sel_ty = -1;
static int g_sel_slot;            /* object slot index, 0 == none */
static ushort *g_sel_link;        /* the link field that holds the selected object: its tile's, the previous
                                     object's chain word, or a container's contents word */
static int g_held_slot;           /* Move or Copy in progress: the object picked up, 0 == none ("Mv:" box) */
static int g_tab = -1;            /* the picked-object editor tab shown instead of the position view: 0 Class, 1 Comm, 2 Item */
static int g_held_copy;           /* the held object is copied, not moved, when it is put down */
static int g_palette_brush = 0xc0;   /* the object id the palette has picked to place */
static int g_brush_armed;         /* map clicks place the brush object (a right click still selects) */
static int g_group = 6;           /* the selected object group (decor, as in the screenshot) */
static int g_group_scroll = 3;    /* first group shown in the group bar (the default group is in view) */
static int g_palette_scroll;      /* first row of the group's objects shown in the palette */
static int g_mode = 2;            /* mode palette: the object mode is the one the screenshot shows selected */
static const char *g_status;      /* a transient message on the info bar */

int uw_editor_active(void) { return g_active; }

/* The plain 3D view of a running game: there is a player and the view follows it. */
static int in_dungeon(void)
{
  return DAT_00201b64 == 0 && g_player_object != NULL && DAT_0023b82c == (char *)g_player_object;
}

/* ---- drawing primitives (into g_screen) ---- */

static void put(int x, int y, unsigned short c)
{
  if (x >= 0 && x < ED_W && y >= 0 && y < ED_H) g_screen[y * ED_W + x] = c;
}

static void fill(int x0, int y0, int x1, int y1, unsigned short c)   /* x1, y1 exclusive */
{
  for (int y = y0; y < y1; y++)
    for (int x = x0; x < x1; x++) put(x, y, c);
}

static void frame(int x0, int y0, int x1, int y1, unsigned short c)   /* x1, y1 exclusive */
{
  for (int x = x0; x < x1; x++) { put(x, y0, c); put(x, y1 - 1, c); }
  for (int y = y0; y < y1; y++) { put(x0, y, c); put(x1 - 1, y, c); }
}

/* Text with the game's current font, drawn by the game's own draw_text_string into g_screen. */
static void text(const char *s, int x, int y, unsigned short colour)
{
  int saved_use_pal = g_text_use_palette_color;
  unsigned short saved_flat = (unsigned short)g_text_flat_color;
  g_text_use_palette_color = 0;
  g_text_flat_color = colour;
  draw_text_string((char *)s, (short)x, (short)y);
  g_text_use_palette_color = saved_use_pal;
  g_text_flat_color = saved_flat;
}

/* A .GR entry drawn through the game palette; palette index 0 is transparent. decode_gr_entry_to_buffer gives the
   entry's raw record (type, width, height, aux palette, data), which the game's own sprite path turns into pixels
   the same way (see draw_sprite_by_id in bitmap.c). */
static void sprite(const char *resource, int index, int x, int y)
{
  static unsigned char record[0x10000];
  memset(record, 0, sizeof record);
  decode_gr_entry_to_buffer((char *)resource, index, record);
  int w = record[1], h = record[2];
  const unsigned char *pixels = record[0] == 4 ? record + 5
      : (const unsigned char *)decompress_gr_bitmap((char *)record + 4, &DAT_00202520 + record[3] * 0x10, record[0]);
  if (!pixels || !w || !h) return;
  for (int j = 0; j < h; j++)
    for (int i = 0; i < w; i++)
      if (pixels[j * w + i]) put(x + i, y + j, (unsigned short)(&g_palette_rgb565)[pixels[j * w + i]]);
}

/* ---- panes ---- */

/* The scene buffer (the full 320x200 view) scaled into the 3D pane, cropping the sides to keep the aspect. */
static void draw_view_pane(void)
{
  const unsigned short *scene = uw_fullscreen_scene_pixels();
  int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0;
  fill(R_VIEW.x0, R_VIEW.y0, R_VIEW.x1, R_VIEW.y1, COL_BLACK);
  if (!scene) return;
  /* source rect: full height, width cropped to the pane's aspect, centred */
  int sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
  for (int y = 0; y < h; y++)
    for (int x = 0; x < w; x++)
      put(R_VIEW.x0 + x, R_VIEW.y0 + y, scene[(y * ED_H / h) * ED_W + sx0 + x * sw / w]);
}

static uw_object_hdr_t *object_at(int slot)
{
  return slot > 0 ? get_object_record_by_slot_index((short)slot) : NULL;
}

/* The first object on a tile. */
static int tile_head(int tx, int ty)
{
  const uw_tile_t *t = tx >= 0 && tx < 64 && ty >= 0 && ty < 64 ? (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty) : NULL;
  return t ? t->obj_head : 0;
}

static int is_mobile(const uw_object_hdr_t *o)
{
  return (o->object_id & 0x1c0) == 0x40;   /* critters */
}

/* The camera in world units (256 to a tile): the free camera's position when the view is detached from the player
   (as Far Sight does), otherwise the player's. */
static void camera(int *x, int *y, int *z)
{
  if (DAT_0023b82c == 0) {
    *x = DAT_0023be90; *y = DAT_0023be92; *z = DAT_0023be94;
  }
  else {
    const uw_mobile_object_t *o = g_player_object;
    *x = o->tile_x * 256 + ((const uw_object_hdr_t *)o)->xpos * 32;
    *y = o->tile_y * 256 + ((const uw_object_hdr_t *)o)->ypos * 32;
    *z = ((const uw_object_hdr_t *)o)->zpos * 8;
  }
}

#define MAP_TILE 6

static unsigned short tile_colour(const uw_tile_t *t)
{
  if (t->tile_type == 0) return RGB(124, 64, 16);                 /* solid */
  int shade = 120 + t->floor_height * 8;
  if (shade > 255) shade = 255;
  return RGB(0, shade, 0);
}

static void draw_map_pane(void)
{
  int w = R_MAP.x1 - R_MAP.x0, h = R_MAP.y1 - R_MAP.y0;
  int camx, camy, camz;
  camera(&camx, &camy, &camz);
  int cx = camx >> 8, cy = camy >> 8;
  int tiles_w = w / MAP_TILE + 1, tiles_h = h / MAP_TILE + 1;
  int left = cx - tiles_w / 2, bottom = cy - tiles_h / 2;   /* tile y grows upwards on screen, as in the automap */
  fill(R_MAP.x0, R_MAP.y0, R_MAP.x1, R_MAP.y1, COL_BLACK);
  for (int j = 0; j < tiles_h; j++)
    for (int i = 0; i < tiles_w; i++) {
      int tx = left + i, ty = bottom + j;
      int sx = R_MAP.x0 + i * MAP_TILE, sy = R_MAP.y1 - (j + 1) * MAP_TILE;
      if (tx < 0 || tx > 63 || ty < 0 || ty > 63) continue;
      const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty);
      unsigned short c = t ? tile_colour(t) : COL_BLACK;
      for (int y = 0; y < MAP_TILE; y++)
        for (int x = 0; x < MAP_TILE; x++)
          if (sx + x >= R_MAP.x0 && sx + x < R_MAP.x1 && sy + y >= R_MAP.y0 && sy + y < R_MAP.y1) put(sx + x, sy + y, c);
    }
  /* objects: a dot on each tile that has any, red for critters */
  for (int j = 0; j < tiles_h; j++)
    for (int i = 0; i < tiles_w; i++) {
      int tx = left + i, ty = bottom + j, slot = tile_head(tx, ty);
      for (int n = 0; slot && n < 64; n++) {
        const uw_object_hdr_t *o = object_at(slot);
        if (!o) break;
        int sx = R_MAP.x0 + i * MAP_TILE + o->xpos * MAP_TILE / 8, sy = R_MAP.y1 - (j + 1) * MAP_TILE + (7 - o->ypos) * MAP_TILE / 8;
        if (sx >= R_MAP.x0 && sx < R_MAP.x1 - 1 && sy >= R_MAP.y0 && sy < R_MAP.y1 - 1)
          fill(sx, sy, sx + 2, sy + 2, is_mobile(o) ? RGB(255, 60, 60) : RGB(255, 255, 80));
        slot = o->next;
      }
    }
  if (g_sel_tx >= 0) {
    int sx = R_MAP.x0 + (g_sel_tx - left) * MAP_TILE, sy = R_MAP.y1 - (g_sel_ty - bottom + 1) * MAP_TILE;
    frame(sx, sy, sx + MAP_TILE, sy + MAP_TILE, RGB(255, 255, 0));
  }
  /* the camera: a dot in its tile */
  {
    int sx = R_MAP.x0 + (cx - left) * MAP_TILE + MAP_TILE / 2, sy = R_MAP.y1 - (cy - bottom) * MAP_TILE - MAP_TILE / 2;
    fill(sx - 1, sy - 1, sx + 1, sy + 1, RGB(255, 255, 255));
  }
}

/* BUTTONS.GR frames of the mode palette, top to bottom (14x14 each). */
static const int g_mode_frames[8] = { 3, 4, 5, 7, 8, 9, 10, 14 };   /* the last is the paint bucket (fill) */

static void draw_palette_pane(void)
{
  fill(R_PALETTE.x0, R_PALETTE.y0, R_PALETTE.x1, R_PALETTE.y1, COL_BLACK);
  sprite("buttons", 15, 153, 1);
  for (int i = 0; i < 8; i++) {
    int y = 26 + 16 * i;
    sprite("buttons", g_mode_frames[i], 157, y);
    if (i == g_mode) frame(156, y - 1, 172, y + 15, COL_BLUE);
  }
  sprite("buttons", 16, 157, 176);
}

/* The group bar above the palette: the object groups, each shown by a representative icon; the selected group's
   objects fill the palette below. The bar and the palette scroll. The groups are by object id range (a guess from
   the object classes; the original's are not known), and the icon is the object in the group that shows it best. */
typedef struct { int first, count, icon; } ed_group_t;
static const ed_group_t g_groups[] = {
  { 0x00, 0x20, 0x00 },   /* weapons */
  { 0x20, 0x20, 0x20 },   /* armour */
  { 0x40, 0x40, 0x40 },   /* critters */
  { 0x80, 0x10, 0x80 },   /* containers */
  { 0x90, 0x10, 0x90 },   /* lights, wands */
  { 0xa0, 0x20, 0xa0 },   /* treasure, food */
  { 0xc0, 0x20, 0xc2 },   /* decor: scenery, bones, plants, debris */
  { 0xe0, 0x20, 0xe0 },   /* runes, bits */
  { 0x100, 0x40, 0x100 }, /* keys, books, scrolls */
  { 0x140, 0x40, 0x157 }, /* special objects, shrines */
  { 0x180, 0x40, 0x180 }, /* traps */
  { 0x1c0, 0x40, 0x1c0 }, /* triggers */
};
#define GROUP_COUNT ((int)(sizeof g_groups / sizeof g_groups[0]))
#define GROUPS_SHOWN 5
#define GROUP_CELL 18
#define GROUP_X0 (R_STRIP.x0 + 8)
#define PAL_COLS 8
#define PAL_ROWS 2
#define PAL_CELL_W 17
#define PAL_CELL_H 19

static int palette_rows(void)
{
  return (g_groups[g_group].count + PAL_COLS - 1) / PAL_COLS;
}

static void clamp_scrolls(void)
{
  int max_group = GROUP_COUNT - GROUPS_SHOWN, max_row = palette_rows() - PAL_ROWS;
  if (g_group_scroll > max_group) g_group_scroll = max_group;
  if (g_group_scroll < 0) g_group_scroll = 0;
  if (max_row < 0) max_row = 0;
  if (g_palette_scroll > max_row) g_palette_scroll = max_row;
  if (g_palette_scroll < 0) g_palette_scroll = 0;
}

/* a small triangle pointing left, right, up or down (dir 0 to 3) */
static void arrow(int x, int y, int dir, unsigned short c)
{
  for (int i = 0; i < 4; i++)
    for (int j = -i; j <= i; j++) {
      switch (dir) {
        case 0: put(x + i, y + 3 + j, c); break;
        case 1: put(x + 3 - i, y + 3 + j, c); break;
        case 2: put(x + 3 + j, y + i, c); break;
        default: put(x + 3 + j, y + 3 - i, c); break;
      }
    }
}

static void draw_strip_pane(void)
{
  frame(R_STRIP.x0, R_STRIP.y0, R_STRIP.x1, R_STRIP.y1, COL_FRAME);
  fill(R_STRIP.x0 + 1, R_STRIP.y0 + 1, R_STRIP.x1 - 1, R_STRIP.y1 - 1, COL_BLACK);
  arrow(R_STRIP.x0 + 2, R_STRIP.y0 + 8, 0, g_group_scroll > 0 ? COL_TEXT : COL_FRAME);
  arrow(R_STRIP.x1 - 6, R_STRIP.y0 + 8, 1, g_group_scroll < GROUP_COUNT - GROUPS_SHOWN ? COL_TEXT : COL_FRAME);
  for (int i = 0; i < GROUPS_SHOWN && g_group_scroll + i < GROUP_COUNT; i++) {
    int g = g_group_scroll + i, x = GROUP_X0 + i * GROUP_CELL, y = R_STRIP.y0 + 3;
    sprite("objects", g_groups[g].icon, x, y);
    if (g == g_group) frame(x - 2, y - 2, x + 16, y + 17, COL_BLUE);
  }
}

static void draw_object_palette(void)
{
  const ed_group_t *g = &g_groups[g_group];
  fill(R_OBJPAL.x0, R_OBJPAL.y0, R_OBJPAL.x1, R_OBJPAL.y1, COL_BLACK);
  frame(R_OBJPAL.x0, R_OBJPAL.y0, R_OBJPAL.x1, R_OBJPAL.y1, COL_FRAME);
  for (int i = 0; i < PAL_COLS * PAL_ROWS; i++) {
    int n = (g_palette_scroll * PAL_COLS) + i;
    int x = R_OBJPAL.x0 + 4 + (i % PAL_COLS) * PAL_CELL_W, y = R_OBJPAL.y0 + 3 + (i / PAL_COLS) * PAL_CELL_H;
    if (n >= g->count) break;
    sprite("objects", g->first + n, x, y);
    if (g->first + n == g_palette_brush) frame(x - 2, y - 2, x + 16, y + 17, g_brush_armed ? COL_ORANGE : COL_BLUE);
  }
  arrow(R_OBJPAL.x1 - 8, R_OBJPAL.y0 + 3, 2, g_palette_scroll > 0 ? COL_TEXT : COL_FRAME);
  arrow(R_OBJPAL.x1 - 8, R_OBJPAL.y1 - 8, 3, g_palette_scroll < palette_rows() - PAL_ROWS ? COL_TEXT : COL_FRAME);
}

/* The tab pages of the picked-object editor: a row of "- value +" per field. They edit the object in place. */
typedef struct { const char *name; int min, max; } ed_field_t;
enum { TAB_CLASS, TAB_COMM, TAB_ITEM };
static const ed_field_t g_class_fields[] = { { "Type", 0, 0x1ff } };
static const ed_field_t g_comm_fields[] = { { "HP", 0, 255 }, { "Goal", 0, 15 }, { "Target", 0, 255 }, { "Level", 0, 15 }, { "Attit", 0, 3 }, { "Talked", 0, 1 } };
static const ed_field_t g_item_fields[] = { { "Qual", 0, 63 }, { "Owner", 0, 63 }, { "Ench", 0, 1 }, { "Invis", 0, 1 }, { "Door", 0, 1 } };

static const ed_field_t *tab_fields(int tab, int *count)
{
  switch (tab) {
    case TAB_CLASS: *count = (int)(sizeof g_class_fields / sizeof *g_class_fields); return g_class_fields;
    case TAB_COMM: *count = (int)(sizeof g_comm_fields / sizeof *g_comm_fields); return g_comm_fields;
    default: *count = (int)(sizeof g_item_fields / sizeof *g_item_fields); return g_item_fields;
  }
}

static int slot_is_mobile(const uw_object_hdr_t *o)
{
  return is_mobile(o) && encode_object_slot_index(o) < 0x100;
}

/* A field's value for the selected object; *shown is 0 when the object has no such field (a static's mobile fields). */
static int field_get(int tab, int row, const uw_object_hdr_t *o, int *shown)
{
  const uw_mobile_object_t *m = (const uw_mobile_object_t *)o;
  *shown = 1;
  if (tab == TAB_CLASS) return o->object_id;
  if (tab == TAB_COMM) {
    if (!slot_is_mobile(o)) { *shown = 0; return 0; }
    switch (row) {
      case 0: return m->npc_hp;
      case 1: return m->npc_goal;
      case 2: return m->npc_gtarg;
      case 3: return m->npc_level;
      case 4: return m->npc_attitude;
      default: return m->npc_talkedto;
    }
  }
  switch (row) {
    case 0: return o->quality;
    case 1: if (o->is_quant) { *shown = 0; return 0; } return o->owner;   /* a quantity takes the owner's place */
    case 2: return o->enchanted;
    case 3: return o->invisible;
    default: return o->doordir;
  }
}

static void field_set(int tab, int row, uw_object_hdr_t *o, int v)
{
  uw_mobile_object_t *m = (uw_mobile_object_t *)o;
  if (tab == TAB_CLASS) {
    /* a type stays on its side of the static / mobile boundary, and a container with contents stays a container */
    int old = o->object_id;
    if (((v & 0x1c0) == 0x40) != ((old & 0x1c0) == 0x40)) { g_status = "static and mobile differ"; return; }
    if (((v & 0x1f0) == 0x80) != ((old & 0x1f0) == 0x80) && !o->is_quant && o->link) { g_status = "it holds things"; return; }
    o->object_id = (unsigned)v;
  }
  else if (tab == TAB_COMM) {
    switch (row) {
      case 0: m->npc_hp = (byte)v; break;
      case 1: m->npc_goal = (unsigned)v; break;
      case 2: m->npc_gtarg = (unsigned)v; break;
      case 3: m->npc_level = (unsigned)v; break;
      case 4: m->npc_attitude = (unsigned)v; break;
      default: m->npc_talkedto = (unsigned)v; break;
    }
  }
  else {
    switch (row) {
      case 0: o->quality = (unsigned)v; break;
      case 1: o->owner = (unsigned)v; break;
      case 2: o->enchanted = (unsigned)v; break;
      case 3: o->invisible = (unsigned)v; break;
      default: o->doordir = (unsigned)v; break;
    }
  }
  set_pending_update_flags(2);
}

static void draw_field_page(const uw_object_hdr_t *o)
{
  int count, shown;
  const ed_field_t *f = tab_fields(g_tab, &count);
  char line[16];
  for (int i = 0; i < count; i++) {
    int y = 129 + i * 8;
    int v = o ? field_get(g_tab, i, o, &shown) : 0;
    if (!o) shown = 0;
    text(f[i].name, 4, y, shown ? COL_ORANGE : RGB(120, 60, 16));
    if (!shown) continue;
    arrow(38, y + 1, 0, COL_BLUE);
    arrow(77, y + 1, 1, COL_BLUE);
    snprintf(line, sizeof line, "%d", v);
    text(line, 48, y, COL_TEXT);
  }
  if (g_tab == TAB_CLASS && o) text(slot_is_mobile(o) ? "mobile" : "static", 4, 140, COL_FRAME);
  if (g_tab == TAB_COMM && o && !slot_is_mobile(o)) text("not mobile", 4, 130, RGB(120, 60, 16));
}

/* The picked object's editor: the sub-tile position grid, height spinner, heading rose, icon box, "Mv:" box,
   the Head/Next/Link/Show/Move/Copy/Delete buttons and the Class/Comm/Item tabs. */
static const char *const g_editor_buttons[7] = { "Head", "Next", "Link", "Show", "Move", "Copy", "Delete" };
#define BUTTON_X 113
#define BUTTON_Y 128
#define BUTTON_H 9

static void draw_object_editor(void)
{
  static const char *const tabs[3] = { "Class", "Comm", "Item" };
  const uw_object_hdr_t *o = object_at(g_sel_slot);
  char line[16];
  if (g_tab >= 0) {
    frame(3, 128, 85, 177, COL_ORANGE);
    draw_field_page(o);
  }
  else {
    /* 8x8 grid of 6px cells with the object's position marked */
    for (int i = 0; i <= 8; i++) {
      for (int k = 0; k <= 48; k++) { put(3 + i * 6, 128 + k, COL_PINK); put(3 + k, 128 + i * 6, COL_PINK); }
    }
    frame(53, 128, 85, 144, COL_ORANGE);
    frame(53, 146, 85, 178, COL_ORANGE);
    if (o) {
      fill(3 + o->xpos * 6 + 2, 128 + (7 - o->ypos) * 6 + 2, 3 + o->xpos * 6 + 4, 128 + (7 - o->ypos) * 6 + 4, COL_ORANGE);
      const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)g_sel_tx, (short)g_sel_ty);
      int off = t ? o->zpos - t->floor_height * 8 : 0;
      snprintf(line, sizeof line, "%d", o->zpos);
      text(line, 56, 130, COL_BLUE);
      snprintf(line, sizeof line, "%+d", off);
      text(line, 56, 137, COL_BLUE);
      arrow(77, 130, 2, COL_BLUE);
      arrow(77, 137, 3, COL_BLUE);
      /* the heading rose: eight rays from the centre, the object's heading marked */
      for (int d = 0; d < 8; d++) {
        static const int dx[8] = { 0, 1, 1, 1, 0, -1, -1, -1 }, dy[8] = { -1, -1, 0, 1, 1, 1, 0, -1 };
        for (int r = 3; r <= 12; r++) put(69 + dx[d] * r, 162 + dy[d] * r, COL_ORANGE);
        if (d == o->heading) fill(69 + dx[d] * 13 - 1, 162 + dy[d] * 13 - 1, 69 + dx[d] * 13 + 1, 162 + dy[d] * 13 + 1, COL_BLUE);
      }
    }
  }
  frame(86, 134, 105, 150, COL_GREEN);
  frame(94, 166, 112, 188, COL_FRAME);
  /* "Mv:" (the screenshot's label, dimmed there with nothing in the box): probably the object a Move in progress
     holds; not wired yet, so the box stays empty. */
  text("Mv:", 96, 160, g_held_slot ? COL_ORANGE : RGB(120, 60, 16));
  if (object_at(g_held_slot)) sprite("objects", object_at(g_held_slot)->object_id, 95, 169);
  if (o) {
    sprite("objects", o->object_id, 88, 135);
  }
  for (int i = 0; i < 7; i++) {
    int y = BUTTON_Y + i * BUTTON_H;
    unsigned short c = i == 6 ? RGB(232, 64, 64) : COL_ORANGE;
    frame(BUTTON_X, y, 150, y + BUTTON_H, c);
    text(g_editor_buttons[i], 116, y + 1, c);
  }
  for (int i = 0; i < 3; i++) {
    int x = 3 + i * 31;
    unsigned short c = i < 2 ? COL_BLUE : COL_GREEN;
    if (i == g_tab) fill(x + 1, 178, x + 29, 189, RGB(24, 24, 88));
    frame(x, 177, x + 30, 190, c);
    text(tabs[i], x + 3, 179, c);
  }
}

static void draw_info_bar(void)
{
  char line[96];
  int x, y, z;
  camera(&x, &y, &z);
  fill(R_INFO.x0, R_INFO.y0, R_INFO.x1, R_INFO.y1, COL_INFO_BG);
  snprintf(line, sizeof line, "P:%d.%d %d.%d %d", x >> 8, (x & 255) * 10 / 256, y >> 8, (y & 255) * 10 / 256, z >> 3);
  text(line, 2, 193, COL_TEXT);
  snprintf(line, sizeof line, "Map= Lvl %d %d,%d", DAT_00201b68, x >> 8, y >> 8);
  if (g_status) text(g_status, 70, 193, RGB(255, 140, 140));   /* replaces the map position while it shows */
  else text(line, 150, 193, COL_TEXT);
  {
    time_t now = time(NULL);
    strftime(line, sizeof line, "%a %d %H:%M", localtime(&now));
    text(line, 262, 193, COL_TEXT);
  }
}

/* ---- compose ---- */

int uw_editor_compose(unsigned short *display)
{
  static int started;
  if (g_opts.editor && !started && in_dungeon()) { started = 1; uw_editor_set(1); }
  if (!g_active || DAT_00201b64 != 0) return 0;
  void *saved = g_uw_framebuffer;
  g_uw_framebuffer = g_screen;
  select_active_font(s_font5x6p_sys_0008430c);
  fill(0, 0, ED_W, ED_H, COL_BLACK);
  draw_view_pane();
  draw_map_pane();
  draw_palette_pane();
  draw_strip_pane();
  draw_object_palette();
  draw_object_editor();
  draw_info_bar();
  g_uw_framebuffer = saved;
  {
    /* the debug panel or console (drawn by the game into its own framebuffer) stays on top */
    const unsigned short *hud = (const unsigned short *)saved;
    int x0, y0, x1, y1;
    if (hud && dbgui_overlay_rect(&x0, &y0, &x1, &y1)) {
      x0 = x0 < 0 ? 0 : x0; y0 = y0 < 0 ? 0 : y0; x1 = x1 > ED_W ? ED_W : x1; y1 = y1 > ED_H ? ED_H : y1;
      for (int y = y0; y < y1 && x1 > x0; y++) memcpy(g_screen + y * ED_W + x0, hud + y * ED_W + x0, (size_t)(x1 - x0) * sizeof *g_screen);
    }
  }
  memcpy(display, g_screen, sizeof g_screen);
  return 1;
}

/* ---- input ---- */

static int in_rect(const ed_rect_t *r, int x, int y)
{
  return x >= r->x0 && x < r->x1 && y >= r->y0 && y < r->y1;
}

/* The map pane's tile under a screen point; the same mapping draw_map_pane uses. */
static int g_map_click_sub_x = 4, g_map_click_sub_y = 4;   /* set by map_tile_at */

static int map_tile_at(int px, int py, int *tx, int *ty)
{
  int camx, camy, camz;
  camera(&camx, &camy, &camz);
  int w = R_MAP.x1 - R_MAP.x0, h = R_MAP.y1 - R_MAP.y0;
  int tiles_w = w / MAP_TILE + 1, tiles_h = h / MAP_TILE + 1;
  int left = (camx >> 8) - tiles_w / 2, bottom = (camy >> 8) - tiles_h / 2;
  *tx = left + (px - R_MAP.x0) / MAP_TILE;
  *ty = bottom + (R_MAP.y1 - 1 - py) / MAP_TILE;
  /* where in the tile the point is, in the object's eighths (y grows up the screen) */
  g_map_click_sub_x = (px - R_MAP.x0) % MAP_TILE * 8 / MAP_TILE;
  g_map_click_sub_y = 7 - (R_MAP.y1 - 1 - py) % MAP_TILE * 8 / MAP_TILE;
  return *tx >= 0 && *tx < 64 && *ty >= 0 && *ty < 64;
}

static ushort *tile_link(int tx, int ty)
{
  return (ushort *)((char *)tilemap_lookup((short)tx, (short)ty) + 2);   /* the tile's second word: its first object */
}

static void select_tile(int tx, int ty)
{
  g_sel_tx = tx;
  g_sel_ty = ty;
  g_sel_slot = tile_head(tx, ty);
  g_sel_link = tile_link(tx, ty);
}

/* Select an object known to be on a tile's chain, remembering the link field that holds it. */
static void select_object_on_tile(int tx, int ty, const uw_object_hdr_t *o)
{
  select_tile(tx, ty);
  for (int n = 0; n < 1024 && g_sel_slot; n++) {
    uw_object_hdr_t *c = object_at(g_sel_slot);
    if (!c) break;
    if (c == o) return;
    g_sel_link = &c->chain_word;
    g_sel_slot = c->next;
  }
  g_sel_slot = 0;
}

/* ---- object operations ---- */

/* The editor edits a live level, so every operation leaves the object lists consistent: validate walks every
   tile's chain (and the containers on them) and counts objects reachable twice, chains that never end, and
   mobiles whose tile word names another tile. It returns the number of problems and reports them on stderr. */
#define VALIDATE_MAX_OBJECTS 1024

static int validate_chain(int slot, int tx, int ty, unsigned char *seen, int depth, int *problems)
{
  int count = 0;
  for (int n = 0; slot && n < VALIDATE_MAX_OBJECTS; n++) {
    const uw_object_hdr_t *o = object_at(slot);
    if (!o) { fprintf(stderr, "[editor] validate: slot %d does not resolve\n", slot); (*problems)++; break; }
    if (seen[slot]++) { fprintf(stderr, "[editor] validate: slot %d reachable twice\n", slot); (*problems)++; break; }
    count++;
    if (depth == 0 && slot < 0x100 && is_mobile(o)) {
      const uw_mobile_object_t *m = (const uw_mobile_object_t *)o;
      if (m->tile_x != tx || m->tile_y != ty) {
        fprintf(stderr, "[editor] validate: mobile %d is linked on (%d,%d) but its tile word says (%d,%d)\n", slot, tx, ty, m->tile_x, m->tile_y);
        (*problems)++;
      }
    }
    if ((o->object_id & 0x1f0) == 0x80 && !o->is_quant && o->link && depth < 8)
      count += validate_chain(o->link, tx, ty, seen, depth + 1, problems);
    slot = o->next;
    if (n == VALIDATE_MAX_OBJECTS - 1 && slot) { fprintf(stderr, "[editor] validate: a chain does not end\n"); (*problems)++; }
  }
  return count;
}

int uw_editor_validate(void)
{
  static unsigned char seen[0x400];
  int problems = 0, objects = 0;
  memset(seen, 0, sizeof seen);
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) objects += validate_chain(tile_head(tx, ty), tx, ty, seen, 0, &problems);
  fprintf(stderr, "[editor] validate level %d: %d objects reachable, %d problems\n", DAT_00201b68, objects, problems);
  return problems;
}

/* The link field that holds an object, found by searching every tile's chain and the containers on them. */
static ushort *find_link_in(ushort *link, int slot, int depth)
{
  for (int n = 0; n < VALIDATE_MAX_OBJECTS; n++) {
    uw_object_hdr_t *c = resolve_object_link(link);
    if (!c) return NULL;
    if (encode_object_slot_index(c) == slot) return link;
    if ((c->object_id & 0x1f0) == 0x80 && !c->is_quant && c->link && depth < 8) {
      ushort *in = find_link_in(&c->link_word, slot, depth + 1);
      if (in) return in;
    }
    link = &c->chain_word;
  }
  return NULL;
}

static ushort *find_link(int slot)
{
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) {
      ushort *l = find_link_in(tile_link(tx, ty), slot, 0);
      if (l) return l;
    }
  return NULL;
}

/* The object the player is (never edited: it lives in slot 1 and is only moved by the game). */
static int is_player(const uw_object_hdr_t *o)
{
  return o == (const uw_object_hdr_t *)g_player_object;
}

static int tile_is_open(int tx, int ty)
{
  const uw_tile_t *t = tx >= 0 && tx < 64 && ty >= 0 && ty < 64 ? (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty) : NULL;
  return t && t->tile_type != 0;
}

/* Put an object at the head of a tile's chain, standing on the floor, at a sub-tile position (negative: keep its own). Mobiles also record the tile. */
static void put_on_tile(uw_object_hdr_t *o, int tx, int ty, int sub_x, int sub_y)
{
  const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty);
  object_list_insert_head(tile_link(tx, ty), o);
  o->zpos = (unsigned)t->floor_height * 8;
  if (sub_x >= 0) { o->xpos = (unsigned)sub_x & 7; o->ypos = (unsigned)sub_y & 7; }
  if (is_mobile(o) && encode_object_slot_index(o) < 0x100) {
    ((uw_mobile_object_t *)o)->tile_x = (unsigned)tx;
    ((uw_mobile_object_t *)o)->tile_y = (unsigned)ty;
  }
}

/* A free object slot to allocate from. alloc_object_slot makes room by deleting objects across the level when its
   list is empty, so check first. */
static int have_free_slot(int mobile)
{
  return mobile ? DAT_002046a8 >= DAT_002046a4 : DAT_0020469c >= DAT_002046bc;
}

/* Create a new object of the palette's type on a tile at a sub-tile position, standing on the floor. */
static void op_place(int id, int tx, int ty, int sub_x, int sub_y)
{
  int mobile = (id & 0x1c0) == 0x40;
  if (!tile_is_open(tx, ty)) { g_status = "that tile is solid"; return; }
  if (!have_free_slot(mobile)) { g_status = "no free object slots"; return; }
  uw_object_hdr_t *o = spawn_new_object((uint)id, mobile ? 1 : 0);
  if (!o) { g_status = "no free object slots"; return; }
  if (mobile) {
    /* a mobile slot is reused with whatever its last object left in it */
    memset((char *)o + sizeof(uw_object_hdr_t), 0, sizeof(uw_mobile_object_t) - sizeof(uw_object_hdr_t));
    ((uw_mobile_object_t *)o)->npc_hp = g_monster_type_props[id & 0x3f].max_hp;
  }
  put_on_tile(o, tx, ty, sub_x, sub_y);
  select_object_on_tile(tx, ty, o);
  g_status = "placed";
  uw_editor_validate();
}

static void op_delete(void)
{
  uw_object_hdr_t *o = object_at(g_sel_slot);
  if (!o || !g_sel_link) { g_status = "nothing selected"; return; }
  if (is_player(o)) { g_status = "that is you"; return; }
  if (g_held_slot == g_sel_slot) g_held_slot = 0;
  if ((o->object_id & 0x1c0) == 0x180)
    free_trap_class_object(g_sel_link, o);   /* traps clean up their chain markers */
  else
    discard_misplaced_object(g_sel_link, (ushort *)o, 1);   /* the game's own delete: drops a trigger's timer, frees contents */
  int tx = g_sel_tx, ty = g_sel_ty;
  select_tile(tx, ty);
  g_status = "deleted";
  uw_editor_validate();
}

/* Move or Copy picks the selected object up; the next map click (or a click on an object in the 3D pane) puts it
   on that tile. The same button again puts it back. */
static void op_pick_up(int copy)
{
  uw_object_hdr_t *o = object_at(g_sel_slot);
  if (g_held_slot && g_held_slot == g_sel_slot && g_held_copy == copy) { g_held_slot = 0; g_status = "cancelled"; return; }
  if (!o || !g_sel_link) { g_status = "nothing selected"; return; }
  if (is_player(o)) { g_status = "that is you"; return; }
  g_held_slot = g_sel_slot;
  g_held_copy = copy;
  g_status = copy ? "click a tile to copy it" : "click a tile to move it";
}

static void op_put_down(int tx, int ty, int sub_x, int sub_y)
{
  uw_object_hdr_t *src = object_at(g_held_slot);
  if (!src) { g_held_slot = 0; return; }
  if (!tile_is_open(tx, ty)) { g_status = "that tile is solid"; return; }
  if (g_held_copy) {
    /* a copy takes a slot of its own; check the free list first, because allocating from an empty one makes the
       game delete objects far from the player */
    int mobile = g_held_slot < 0x100;
    if (!have_free_slot(mobile)) { g_status = "no free object slots"; return; }
    uw_object_hdr_t *copy = alloc_object_slot(mobile ? 1 : 0);
    if (!copy) { g_status = "no free object slots"; return; }
    memcpy(copy, src, mobile ? sizeof(uw_mobile_object_t) : sizeof(uw_object_hdr_t));
    copy->next = 0;
    if (!copy->is_quant) copy->link = 0;   /* a shallow copy: the contents stay with the original */
    put_on_tile(copy, tx, ty, sub_x, sub_y);
    select_object_on_tile(tx, ty, copy);
    g_status = "copied";
  }
  else {
    ushort *link = find_link(g_held_slot);   /* the selection may have moved on since it was picked up */
    if (!link) { g_status = "lost the object"; g_held_slot = 0; return; }
    object_list_unlink(link, src);
    put_on_tile(src, tx, ty, sub_x, sub_y);
    select_object_on_tile(tx, ty, src);
    g_status = "moved";
  }
  g_held_slot = 0;
  uw_editor_validate();
}

/* Save the level being edited into the working save (SAVE0\\LEV.ARK), with the game's own level commit: it writes the
   level's tile map and objects (and the texture map and automap reveal) and takes the player out of the level and back,
   as when the player leaves a level. The edited level is read back from there when the level is next entered. The edits
   are the level as it is now in memory, so creatures keep whatever the simulation did to them before the editor was
   turned on. */
void uw_editor_save(void)
{
  if (!g_active) return;
  if (g_held_slot) { g_status = "put the object down first"; return; }
  if (uw_editor_validate() != 0) { g_status = "object lists are damaged, not saved"; return; }
  int ok = commit_level_to_save_slot((int)DAT_00201b68);
  g_status = ok ? "level saved" : "save failed";
  fprintf(stderr, "[editor] save level %d: %s\n", DAT_00201b68, ok ? "ok" : "failed");
}

/* Write the level being edited into an edited copy of the game's level archive, DATA\\LEV_EDIT.ARK: a copy of
   DATA\\LEV.ARK the first time, then updated in place, so the edits to several levels collect in the one file. Rename it
   LEV.ARK to play it. The player's automap is not written into it. As with the save, this is the level as it is in
   memory now. */
void uw_editor_export(void)
{
  static char path[] = "\\DATA\\LEV_EDIT.ARK";
  if (!g_active) return;
  if (g_held_slot) { g_status = "put the object down first"; return; }
  if (uw_editor_validate() != 0) { g_status = "object lists are damaged, not saved"; return; }
  int have = uw_file_open_read(path);
  if (have != -1) uw_file_close(have);
  else if (!uw_file_copy("\\DATA\\LEV.ARK", path)) { g_status = "could not copy LEV.ARK"; return; }
  int ok = commit_level_to_archive((int)DAT_00201b68, path, 0);
  g_status = ok ? "exported to LEV_EDIT.ARK" : "export failed";
  fprintf(stderr, "[editor] export level %d to LEV_EDIT.ARK: %s\n", DAT_00201b68, ok ? "ok" : "failed");
}

/* Show: bring the camera next to the selected object's tile, looking at it. */
static void op_show(void)
{
  if (g_sel_tx < 0) return;
  int cx = g_sel_tx * 256 + 128, cy = g_sel_ty * 256 + 128;
  short sn, cs;
  angle_to_screen_delta((ushort)DAT_0023bf00, &sn, &cs);
  int bx = cx - ((sn * 300) >> 15), by = cy - ((cs * 300) >> 15);
  if (tile_is_open(bx >> 8, by >> 8)) { cx = bx; cy = by; }
  if (!tile_is_open(cx >> 8, cy >> 8)) return;
  DAT_0023be90 = (short)cx;
  DAT_0023be92 = (short)cy;
  set_pending_update_flags(2);
}

static void button_pressed(int i)
{
  const uw_object_hdr_t *o = object_at(g_sel_slot);
  g_status = NULL;
  switch (i) {
    case 0: g_sel_slot = tile_head(g_sel_tx, g_sel_ty); g_sel_link = tile_link(g_sel_tx, g_sel_ty); break;   /* Head */
    case 1: if (o && o->next) { g_sel_link = &((uw_object_hdr_t *)o)->chain_word; g_sel_slot = o->next; } break;   /* Next */
    case 2: if (o && !o->is_quant && o->link) { g_sel_link = &((uw_object_hdr_t *)o)->link_word; g_sel_slot = o->link; } break;   /* Link: into a container */
    case 3: op_show(); break;
    case 4: op_pick_up(0); break;
    case 5: op_pick_up(1); break;
    default: op_delete(); break;
  }
}

/* Where a point of the 3D view looks at the floor. The point is in scene coordinates; the ray inverts the
   projection the renderer uses (x = cx + scale * eye_x / eye_z, y = cy - 0.9 * scale * eye_y / eye_z, see
   raster_textured_span), turns it by the camera's facing and pitch, and walks it over the tiles in steps of 1/32
   tile until it goes below a floor (the hit, refined by bisection) or into a solid tile or out of the map. The
   floors are taken as flat at their tile's height. World units are 1/256 of a tile, and a floor height step is 64. */
static int floor_under_view_point(int scene_x, int scene_y, int *hit_x, int *hit_y)
{
  const double cx = UW_FULLSCREEN_PROJ_CX, cy = uw_fullscreen_proj_cy(), scale = UW_FULLSCREEN_PROJ_SCALE;
  double rx = (scene_x + 0.5 - cx) / scale, ry = -(scene_y + 0.5 - cy) / (scale * 0.9);
  short sn, cs;
  angle_to_screen_delta((ushort)DAT_0023bf00, &sn, &cs);
  double fx = sn / 32768.0, fy = cs / 32768.0;                  /* the facing, on the ground */
  double pitch = -DAT_0023beb4 / 256.0 * (M_PI / 180.0);         /* up is positive */
  double cp = cos(pitch), sp = sin(pitch);
  /* forward, right and up in the world */
  double dx = fx * cp + fy * rx - fx * sp * ry, dy = fy * cp - fx * rx - fy * sp * ry, dz = sp + cp * ry;
  double px = DAT_0023be90, py = DAT_0023be92, pz = DAT_0023be94;
  const double step = 8.0;
  double len = sqrt(dx * dx + dy * dy + dz * dz);
  dx = dx / len * step; dy = dy / len * step; dz = dz / len * step;
  for (int i = 0; i < 1600; i++) {
    double nx = px + dx, ny = py + dy, nz = pz + dz;
    int tx = (int)floor(nx / 256.0), ty = (int)floor(ny / 256.0);
    if (tx < 0 || tx > 63 || ty < 0 || ty > 63 || nz > 1100) return 0;
    const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty);
    if (!t || t->tile_type == 0) return 0;   /* a wall was hit first */
    if (nz <= t->floor_height * 64.0) {
      double lo = 0.0, hi = 1.0;   /* the crossing between this step's start and end */
      for (int k = 0; k < 8; k++) {
        double m = (lo + hi) / 2;
        double mx = px + dx * m, my = py + dy * m, mz = pz + dz * m;
        int mtx = (int)floor(mx / 256.0), mty = (int)floor(my / 256.0);
        const uw_tile_t *mt = mtx >= 0 && mtx < 64 && mty >= 0 && mty < 64 ? (const uw_tile_t *)tilemap_lookup((short)mtx, (short)mty) : NULL;
        if (mt && mt->tile_type != 0 && mz <= mt->floor_height * 64.0) hi = m; else lo = m;
      }
      *hit_x = (int)floor(px + dx * hi);
      *hit_y = (int)floor(py + dy * hi);
      return 1;
    }
    px = nx; py = ny; pz = nz;
  }
  return 0;
}

/* A click in the 3D pane. Holding an object (Move, Copy) or an armed palette brush puts it on the floor under the
   click, at that spot. Otherwise it selects the object under the click, found with the game's own per-pixel pick
   buffer, or else the floor tile. */
static void pick_in_view(int px, int py)
{
  int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0;
  int sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
  int scene_x = sx0 + (px - R_VIEW.x0) * sw / w, scene_y = (py - R_VIEW.y0) * ED_H / h;
  int hx = 0, hy = 0;
  int on_floor = floor_under_view_point(scene_x, scene_y, &hx, &hy);
  int tx = hx >> 8, ty = hy >> 8, sub_x = (hx & 255) >> 5, sub_y = (hy & 255) >> 5;
  if (g_held_slot || g_brush_armed) {
    if (!on_floor) { g_status = "no floor there"; return; }
    if (g_held_slot) op_put_down(tx, ty, sub_x, sub_y);
    else op_place(g_palette_brush, tx, ty, sub_x, sub_y);
    return;
  }
  g_mouse_x = (short)scene_x;
  g_mouse_y = (short)scene_y;
  set_pending_update_flags(2);   /* the pick re-renders the view only when it is marked stale; the editor freezes redraws */
  uw_object_hdr_t *o = (uw_object_hdr_t *)pick_object_under_cursor(2);
  if (o) {
    int tile = (int)(((intptr_t)DAT_002020b0 - (intptr_t)tilemap_lookup(0, 0)) / 4);
    select_object_on_tile(tile & 63, tile >> 6, o);
  }
  else if (on_floor) select_tile(tx, ty);
  else g_status = "nothing there";
}

static int clamp_int(int v, int lo, int hi)
{
  return v < lo ? lo : v > hi ? hi : v;
}

/* A click in the picked-object editor's left block: a field page's - and + (right click steps by 8), or the position
   view's grid, height spinner and heading rose. */
static void edit_click(int x, int y, int button)
{
  uw_object_hdr_t *o = object_at(g_sel_slot);
  int step = button == SDL_BUTTON_RIGHT ? 8 : 1;
  if (!o) return;
  if (g_tab >= 0) {
    int count, shown, row = (y - 129) / 8;
    const ed_field_t *f = tab_fields(g_tab, &count);
    if (y < 129 || row >= count) return;
    int v = field_get(g_tab, row, o, &shown);
    if (!shown) return;
    int delta = x < 46 ? -step : x >= 72 ? step : 0;
    if (delta) field_set(g_tab, row, o, clamp_int(v + delta, f[row].min, f[row].max));
  }
  else if (x < 51 && y < 177) {
    o->xpos = (unsigned)clamp_int((x - 3) / 6, 0, 7);
    o->ypos = (unsigned)clamp_int(7 - (y - 128) / 6, 0, 7);
    set_pending_update_flags(2);
  }
  else if (x >= 53 && y < 145) {
    if (x >= 76) { o->zpos = (unsigned)clamp_int((int)o->zpos + (y < 136 ? step : -step), 0, 127); set_pending_update_flags(2); }
  }
  else if (x >= 53 && y >= 146) {
    int dx = x - 69, dy = y - 162;
    if (dx * dx + dy * dy < 9) return;
    int h = (int)lround(atan2((double)dx, (double)-dy) / (M_PI / 4)) & 7;
    o->heading = (unsigned)h;
    if (slot_is_mobile(o)) {
      ((uw_mobile_object_t *)o)->full_heading = (unsigned char)(h * 32);
      ((uw_mobile_object_t *)o)->npc_heading = (unsigned)(h * 4);
    }
    set_pending_update_flags(2);
  }
}

void uw_editor_click(int x, int y, int button)
{
  int tx, ty;
  g_status = NULL;
  if (in_rect(&R_VIEW, x, y)) {
    pick_in_view(x, y);
  }
  else if (in_rect(&R_MAP, x, y)) {
    if (map_tile_at(x, y, &tx, &ty)) {
      if (button == SDL_BUTTON_RIGHT) select_tile(tx, ty);   /* a right click always selects */
      else if (g_held_slot) op_put_down(tx, ty, g_map_click_sub_x, g_map_click_sub_y);
      else if (g_brush_armed) op_place(g_palette_brush, tx, ty, g_map_click_sub_x, g_map_click_sub_y);
      else select_tile(tx, ty);
    }
  }
  else if (in_rect(&R_PALETTE, x, y) && y >= 175 && x >= 156 && x < 172) {
    uw_editor_save();   /* the orange button below the modes (a guess; see editor-research) */
  }
  else if (in_rect(&R_PALETTE, x, y)) {
    int i = (y - 26) / 16;
    if (y >= 26 && i < 8 && x >= 156 && x < 172) g_mode = i;
  }
  else if (in_rect(&R_STRIP, x, y)) {
    if (x < GROUP_X0 - 1) g_group_scroll--;
    else if (x >= GROUP_X0 + GROUPS_SHOWN * GROUP_CELL) g_group_scroll++;
    else {
      int g = g_group_scroll + (x - GROUP_X0) / GROUP_CELL;
      if (g < GROUP_COUNT) { g_group = g; g_palette_scroll = 0; g_palette_brush = g_groups[g].first; }
    }
    clamp_scrolls();
  }
  else if (in_rect(&R_OBJPAL, x, y)) {
    if (x >= R_OBJPAL.x1 - 9) {
      g_palette_scroll += y < (R_OBJPAL.y0 + R_OBJPAL.y1) / 2 ? -1 : 1;
      clamp_scrolls();
    }
    else {
      int col = (x - R_OBJPAL.x0 - 2) / PAL_CELL_W, row = (y - R_OBJPAL.y0 - 1) / PAL_CELL_H;
      int n = (g_palette_scroll + row) * PAL_COLS + col;
      if (col >= 0 && col < PAL_COLS && row >= 0 && row < PAL_ROWS && n < g_groups[g_group].count) {
        int id = g_groups[g_group].first + n;
        /* the picked icon is armed for placing; picking the armed one again puts the brush away */
        g_brush_armed = !(g_brush_armed && id == g_palette_brush);
        g_palette_brush = id;
        g_status = g_brush_armed ? "left click a tile to place" : NULL;
      }
    }
  }
  else if (y >= 177 && y < 190 && x >= 3 && x < 96) {
    int i = (x - 3) / 31;
    if (i < 3) g_tab = g_tab == i ? -1 : i;   /* a tab replaces the position view; again goes back */
  }
  else if (x >= 3 && x < 86 && y >= 128 && y < 177) {
    edit_click(x, y, button);
  }
  else if (x >= BUTTON_X && x < 150 && y >= BUTTON_Y && y < BUTTON_Y + 7 * BUTTON_H) {
    button_pressed((y - BUTTON_Y) / BUTTON_H);
  }
}

/* The mouse wheel over the group bar or the palette scrolls it. */
void uw_editor_wheel(int x, int y, int dy)
{
  if (in_rect(&R_STRIP, x, y)) g_group_scroll -= dy;
  else if (in_rect(&R_OBJPAL, x, y)) g_palette_scroll -= dy;
  clamp_scrolls();
}

/* The free camera: arrows turn and move, A/D strafe, Q/E change height. It stays out of solid tiles so the
   visibility pass always starts from an open one. */
#define FLY_SPEED 14
#define FLY_TURN 0x180
#define FLY_LIFT 6

static void try_move(int dx, int dy)
{
  int nx = DAT_0023be90 + dx, ny = DAT_0023be92 + dy;
  const uw_tile_t *t = nx < 0 || ny < 0 || (nx >> 8) > 63 || (ny >> 8) > 63 ? NULL
                     : (const uw_tile_t *)tilemap_lookup((short)(nx >> 8), (short)(ny >> 8));
  if (!t || t->tile_type == 0) return;
  DAT_0023be90 = (short)nx;
  DAT_0023be92 = (short)ny;
}

void uw_editor_tick(void)
{
  if (!g_active || DAT_00201b64 != 0 || DAT_0023b82c != 0 || dbgui_visible()) return;   /* typing in the console is not flying */
#define KEY(sc) uw_scancode_held(sc)
  int fwd = (KEY(SDL_SCANCODE_UP) || KEY(SDL_SCANCODE_W)) - (KEY(SDL_SCANCODE_DOWN) || KEY(SDL_SCANCODE_S));
  int strafe = KEY(SDL_SCANCODE_D) - KEY(SDL_SCANCODE_A);
  int turn = KEY(SDL_SCANCODE_RIGHT) - KEY(SDL_SCANCODE_LEFT);
  int lift = KEY(SDL_SCANCODE_E) - KEY(SDL_SCANCODE_Q);
  if (!fwd && !strafe && !turn && !lift) return;
  short sn, cs;
  DAT_0023bf00 = (ushort)(DAT_0023bf00 + turn * FLY_TURN);
  angle_to_screen_delta((ushort)DAT_0023bf00, &sn, &cs);
  /* sine and cosine are 1.15 fixed point; the facing's sine points along +x and its cosine along +y */
  try_move(((sn * fwd) >> 15) * FLY_SPEED + ((cs * strafe) >> 15) * FLY_SPEED, ((cs * fwd) >> 15) * FLY_SPEED - ((sn * strafe) >> 15) * FLY_SPEED);
  DAT_0023be94 = (short)(DAT_0023be94 + lift * FLY_LIFT);
  set_pending_update_flags(2);
}

/* ---- on / off ---- */

void uw_editor_set(int on)
{
  if (on == g_active) return;
  if (on && !in_dungeon()) return;
  g_active = on;
  if (on) {
    /* detach the view from the player: Far Sight's free camera (DAT_0023b82c == 0), seeded at the player */
    int x, y, z;
    camera(&x, &y, &z);
    DAT_0023be90 = (short)x; DAT_0023be92 = (short)y; DAT_0023be94 = (short)(z + 0x16 * 8);
    DAT_0023bf00 = (ushort)((((const uw_object_hdr_t *)g_player_object)->position_word & 0xff80) * 0x40
                            + (((const uw_mobile_object_t *)g_player_object)->heading_flags & 0x1f) * 0x100);
    DAT_0023bf02 = DAT_0023bf04 = 0;
    DAT_0023b82c = 0;
    select_tile(x >> 8, y >> 8);
    g_entered_fullscreen = !g_view_fullscreen;
    if (g_entered_fullscreen) uw_toggle_fullscreen_view(0);
  }
  else {
    DAT_0023b82c = (char *)g_player_object;
    if (g_entered_fullscreen && g_view_fullscreen) uw_toggle_fullscreen_view(0);
  }
  if (g_view_fullscreen) {
    dirty_rect_union(0, 200, 0, 0x140);
    set_pending_update_flags(2);
  }
  fprintf(stderr, "[editor] %s\n", on ? "on" : "off");
}

void uw_editor_toggle(int unused)
{
  (void)unused;
  uw_editor_set(!g_active);
}

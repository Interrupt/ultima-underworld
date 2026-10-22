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

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
static int g_palette_brush = 0xc0;   /* the object id the palette has picked to place */
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

/* a small triangle: dir 0 left, 1 right, 2 up, 3 down */
static void arrow(int x, int y, int dir, unsigned short c)
{
  for (int i = 0; i < 4; i++)
    for (int j = -i; j <= i; j++) {
      int a = 3 - i;
      switch (dir) {
        case 0: put(x + a, y + 3 + j, c); break;
        case 1: put(x + 3 - a, y + 3 + j, c); break;
        case 2: put(x + 3 + j, y + a, c); break;
        default: put(x + 3 + j, y + 3 - a, c); break;
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
    if (g->first + n == g_palette_brush) frame(x - 2, y - 2, x + 16, y + 17, COL_BLUE);
  }
  arrow(R_OBJPAL.x1 - 8, R_OBJPAL.y0 + 3, 2, g_palette_scroll > 0 ? COL_TEXT : COL_FRAME);
  arrow(R_OBJPAL.x1 - 8, R_OBJPAL.y1 - 8, 3, g_palette_scroll < palette_rows() - PAL_ROWS ? COL_TEXT : COL_FRAME);
}

/* The picked object's editor: the sub-tile position grid, height spinner, heading rose, icon box, "My:" box,
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
  /* 8x8 grid of 6px cells with the object's position marked */
  for (int i = 0; i <= 8; i++) {
    for (int k = 0; k <= 48; k++) { put(3 + i * 6, 128 + k, COL_PINK); put(3 + k, 128 + i * 6, COL_PINK); }
  }
  frame(53, 128, 85, 144, COL_ORANGE);
  frame(53, 146, 85, 178, COL_ORANGE);
  frame(86, 134, 105, 150, COL_GREEN);
  frame(94, 166, 112, 188, COL_FRAME);
  text("My:", 96, 160, COL_ORANGE);
  if (o) {
    fill(3 + o->xpos * 6 + 2, 128 + (7 - o->ypos) * 6 + 2, 3 + o->xpos * 6 + 4, 128 + (7 - o->ypos) * 6 + 4, COL_ORANGE);
    snprintf(line, sizeof line, "%d", o->zpos);
    text(line, 56, 130, COL_BLUE);
    text("+0", 56, 137, COL_BLUE);
    /* the heading rose: eight rays from the centre, the object's heading marked */
    for (int d = 0; d < 8; d++) {
      static const int dx[8] = { 0, 1, 1, 1, 0, -1, -1, -1 }, dy[8] = { -1, -1, 0, 1, 1, 1, 0, -1 };
      for (int r = 3; r <= 12; r++) put(69 + dx[d] * r, 162 + dy[d] * r, COL_ORANGE);
      if (d == o->heading) fill(69 + dx[d] * 13 - 1, 162 + dy[d] * 13 - 1, 69 + dx[d] * 13 + 1, 162 + dy[d] * 13 + 1, COL_BLUE);
    }
    sprite("objects", o->object_id, 88, 135);
    if (is_mobile(o)) {
      snprintf(line, sizeof line, "%d", ((const uw_mobile_object_t *)o)->npc_whoami);
      text(line, 97, 170, COL_TEXT);
    }
  }
  for (int i = 0; i < 7; i++) {
    int y = BUTTON_Y + i * BUTTON_H;
    unsigned short c = i == 6 ? RGB(232, 64, 64) : COL_ORANGE;
    frame(BUTTON_X, y, 150, y + BUTTON_H, c);
    text(g_editor_buttons[i], 116, y + 1, c);
  }
  for (int i = 0; i < 3; i++) {
    int x = 3 + i * 31;
    frame(x, 177, x + 30, 190, i < 2 ? COL_BLUE : COL_GREEN);
    text(tabs[i], x + 3, 179, i < 2 ? COL_BLUE : COL_GREEN);
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
  snprintf(line, sizeof line, "Map= Lvl %d %d,%d", DAT_00201b68 + 1, x >> 8, y >> 8);
  text(line, 150, 193, COL_TEXT);
  if (g_status) text(g_status, 70, 193, RGB(255, 140, 140));
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
  memcpy(display, g_screen, sizeof g_screen);
  return 1;
}

/* ---- input ---- */

static int in_rect(const ed_rect_t *r, int x, int y)
{
  return x >= r->x0 && x < r->x1 && y >= r->y0 && y < r->y1;
}

/* The map pane's tile under a screen point; the same mapping draw_map_pane uses. */
static int map_tile_at(int px, int py, int *tx, int *ty)
{
  int camx, camy, camz;
  camera(&camx, &camy, &camz);
  int w = R_MAP.x1 - R_MAP.x0, h = R_MAP.y1 - R_MAP.y0;
  int tiles_w = w / MAP_TILE + 1, tiles_h = h / MAP_TILE + 1;
  int left = (camx >> 8) - tiles_w / 2, bottom = (camy >> 8) - tiles_h / 2;
  *tx = left + (px - R_MAP.x0) / MAP_TILE;
  *ty = bottom + (R_MAP.y1 - 1 - py) / MAP_TILE;
  return *tx >= 0 && *tx < 64 && *ty >= 0 && *ty < 64;
}

static void select_tile(int tx, int ty)
{
  g_sel_tx = tx;
  g_sel_ty = ty;
  g_sel_slot = tile_head(tx, ty);
}

static void button_pressed(int i)
{
  const uw_object_hdr_t *o = object_at(g_sel_slot);
  g_status = NULL;
  switch (i) {
    case 0: g_sel_slot = tile_head(g_sel_tx, g_sel_ty); break;   /* Head */
    case 1: if (o && o->next) g_sel_slot = o->next; break;       /* Next */
    case 2: if (o && !o->is_quant && o->link) g_sel_slot = o->link; break;   /* Link: into a container */
    default: g_status = "not yet"; break;                       /* Show, Move, Copy, Delete */
  }
}

/* Pick the object under a point of the 3D pane with the game's own per-pixel pick buffer, which is in scene
   coordinates, and select it with its tile. */
static void pick_in_view(int px, int py)
{
  int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0;
  int sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
  g_mouse_x = (short)(sx0 + (px - R_VIEW.x0) * sw / w);
  g_mouse_y = (short)((py - R_VIEW.y0) * ED_H / h);
  uw_object_hdr_t *o = (uw_object_hdr_t *)pick_object_under_cursor(2);
  if (!o) { g_status = "nothing there"; return; }
  int tile = (int)(((intptr_t)DAT_002020b0 - (intptr_t)tilemap_lookup(0, 0)) / 4);
  select_tile(tile & 63, tile >> 6);
  for (int slot = tile_head(g_sel_tx, g_sel_ty); slot; ) {
    uw_object_hdr_t *c = object_at(slot);
    if (!c) break;
    if (c == o) { g_sel_slot = slot; break; }
    slot = c->next;
  }
}

void uw_editor_click(int x, int y, int button)
{
  int tx, ty;
  (void)button;
  g_status = NULL;
  if (in_rect(&R_VIEW, x, y)) {
    pick_in_view(x, y);
  }
  else if (in_rect(&R_MAP, x, y)) {
    if (map_tile_at(x, y, &tx, &ty)) select_tile(tx, ty);
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
      if (col >= 0 && col < PAL_COLS && row >= 0 && row < PAL_ROWS && n < g_groups[g_group].count)
        g_palette_brush = g_groups[g_group].first + n;
    }
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
  if (!g_active || DAT_00201b64 != 0 || DAT_0023b82c != 0) return;
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

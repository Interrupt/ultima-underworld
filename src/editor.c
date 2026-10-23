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
#include "headers/player.h"
#include "headers/debug_ui.h"
#include "headers/debug_shim.h"
#include "headers/saveload.h"
#include "headers/level.h"
#include "headers/scheduler.h"
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
#define COL_ORANGE RGB(255, 142, 27)
#define COL_PINK RGB(255, 186, 186)
#define COL_BLUE RGB(60, 60, 255)
#define COL_GREEN RGB(182, 203, 154)
#define COL_DIM_ORANGE RGB(166, 81, 0)   /* the object editor's button frames */
#define COL_YELLOW RGB(243, 223, 121)
#define COL_OLIVE RGB(80, 89, 0)
#define COL_RED RGB(255, 57, 76)
#define COL_PANEL RGB(36, 36, 36)   /* the lower left panel's ground */
#define COL_INFO_TEXT RGB(231, 178, 158)
#define COL_TEXT RGB(232, 224, 160)
#define COL_INFO_BG RGB(0, 0, 24)

static int g_active;
static int g_prev_farsight;               /* g_debug_farsight before the editor turned it on */
static int g_entered_fullscreen;        /* the editor turned fullscreen on, so it turns it off again */
static unsigned short g_screen[ED_W * ED_H];

/* What is selected: a tile (clicked on the map) and an object on it or in a container (from the strip). */
static int g_sel_tx = -1, g_sel_ty = -1;
static int g_sel_slot;            /* object slot index, 0 == none */
static ushort *g_sel_link;        /* the link field that holds the selected object: its tile's, the previous
                                     object's chain word, or a container's contents word */
static int g_held_slot;           /* Move or Copy in progress: the object picked up, 0 == none ("Mv:" box) */
enum { VIEW_PREVIEW, VIEW_TRIGGERS, VIEW_MARKERS, VIEW_MODES };
static int g_view_mode = VIEW_PREVIEW;   /* the Eye button's view mode, kept while the editor is closed */
static int g_dirty;               /* the level has edits that are not saved in the master archive */
static int g_tab = -1;            /* the picked-object editor tab shown instead of the position view: 0 Class, 1 Comm, 2 Item */
static int g_held_copy;           /* the held object is copied, not moved, when it is put down */
static int g_palette_brush = 0xc0;   /* the object id the palette has picked to place */
static int g_brush_armed;         /* map clicks place the brush object (a right click still selects) */
static int g_group = 6;           /* the selected object group (decor, as in the screenshot) */
static int g_group_scroll = 3;    /* first group shown in the group bar (the default group is in view) */
static int g_palette_scroll;      /* first row of the group's objects shown in the palette */
/* The mode column's eight buttons, top to bottom. */
enum { M_TILE, M_TEXTURE, M_OBJECT, M_VIEW, M_FIND, M_CUTCOPY, M_PASTE, M_FILL, MODE_COUNT };
static const char *const g_mode_names[MODE_COUNT] = { "Tile", "Texture", "Object", "View", "Find", "Cut/Copy", "Paste", "Fill" };
static int g_mode = 2;            /* the mode column's selected button: object mode (M_OBJECT) is the one the screenshot shows */
static const char *g_status;      /* a transient message on the info bar */
static void draw_menu(void);
static void draw_mode(void);
static void draw_fill_overlay(void);
static void draw_cc_overlay(void);
static int menu_open(void);

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

/* A floor's colour from its height: the real height, 0 to 15, from dark green to light green, so every step reads on the map. */
static unsigned short height_colour(double h)
{
  int g = (int)floor(40 + h * 14 + 0.5);   /* rounded, so a ramp and its mirror image band at mirrored pixels */
  return RGB(0, g > 255 ? 255 : g < 0 ? 0 : g, 0);
}

static unsigned short tile_colour(const uw_tile_t *t)
{
  if (t->tile_type == 0) return RGB(124, 64, 16);                 /* solid */
  return height_colour(t->floor_height);
}

/* The angled tiles. The mode palette's swatches (BUTTONS.GR frames 33 to 42, 8x8) draw each tile type, so a diagonal tile's map pixels come
   from its swatch: where the swatch is the solid colour the pixel is wall, elsewhere it is floor shaded by height; a slope takes its swatch's
   gradient, scaled by the height. */
static const unsigned char *tile_swatch(int type)
{
  static unsigned char pixels[10][64];
  static int have[10];
  if (type < 0 || type > 9) return NULL;
  if (!have[type]) {
    static unsigned char record[0x400];
    memset(record, 0, sizeof record);
    decode_gr_entry_to_buffer((char *)"buttons", 33 + type, record);
    const unsigned char *p = record[0] == 4 ? record + 5
        : (const unsigned char *)decompress_gr_bitmap((char *)record + 4, &DAT_00202520 + record[3] * 0x10, record[0]);
    if (p && record[1] == 8 && record[2] == 8) memcpy(pixels[type], p, 64);
    have[type] = 1;
  }
  return pixels[type];
}

/* The angled tiles. A diagonal's map pixels come from its swatch (BUTTONS.GR frames 33 to 42, 8x8): where the swatch is the solid colour the pixel
   is wall, elsewhere it is floor. A slope shows its real height: the colour ramps along the slope from the tile's floor height to that of the
   higher of its two neighbours along the slope (one step up if they are level). */
static uw_tile_t *tile_at(int tx, int ty);

/* Which corner of the tile a diagonal's wall fills (its right-angle corner), found from its swatch: the corner that is solid with the opposite corner open.
   0 top left, 1 top right, 2 bottom left, 3 bottom right. */
static int diagonal_wall_corner(int type)
{
  const unsigned char *sw = tile_swatch(type), *solid = tile_swatch(0);
  int c[4] = { sw[0] == solid[0], sw[7] == solid[0], sw[56] == solid[0], sw[63] == solid[0] };   /* the corners, as solid or not */
  for (int k = 0; k < 4; k++) if (c[k] && !c[3 - k]) return k;
  return 3;
}

static unsigned short tile_pixel(const uw_tile_t *t, int tx, int ty, int x, int y)
{
  if (t->tile_type < 2 || t->tile_type > 9) return tile_colour(t);
  if (t->tile_type <= 5) {
    /* a diagonal: the line between the open half and the wall half is drawn geometrically, not sampled, so it is a clean one pixel staircase
       and mirrored diagonals match; the pixels on the line itself are floor, whichever side the wall is on */
    int corner = diagonal_wall_corner(t->tile_type);
    int on_wall_side;
    switch (corner) {
      case 0: on_wall_side = x + y < MAP_TILE - 1; break;          /* wall top left: the line runs bottom left to top right */
      case 3: on_wall_side = x + y > MAP_TILE - 1; break;          /* wall bottom right */
      case 1: on_wall_side = x > y; break;                         /* wall top right: the line runs top left to bottom right */
      default: on_wall_side = x < y; break;                        /* wall bottom left */
    }
    return on_wall_side ? RGB(124, 64, 16) : height_colour(t->floor_height);
  }
  static const int dx[4] = { 0, 0, 1, -1 }, dy[4] = { 1, -1, 0, 0 };   /* slope N, S, E, W: the line it climbs along */
  int k = t->tile_type - 6;
  const uw_tile_t *a = tile_at(tx + dx[k], ty + dy[k]), *b = tile_at(tx - dx[k], ty - dy[k]);
  int ha = a && a->tile_type != 0 ? a->floor_height : t->floor_height, hb = b && b->tile_type != 0 ? b->floor_height : t->floor_height;
  int up = ha >= hb ? 1 : -1;                           /* which neighbour is higher: the slope climbs towards it */
  int rise = ha == hb ? 1 : (ha > hb ? ha : hb) - t->floor_height;
  if (rise < 1) rise = 1;
  /* position along the slope, 0 at the low end, 1 at the high end; the pixel's y runs down the screen while the tile's y runs up */
  double along = dx[k] ? (x + 0.5) / MAP_TILE : 1.0 - (y + 0.5) / MAP_TILE;
  if ((dx[k] ? up * dx[k] : up * dy[k]) < 0) along = 1.0 - along;
  return height_colour(t->floor_height + rise * along);
}

/* The map pane can be panned (right drag): the pan is in screen pixels, added to the layout that puts the camera's tile at
   (MAP_ORIGIN_X, MAP_ORIGIN_Y) in the pane (a tile's left edge and the top of its row). */
static int g_map_pan_x, g_map_pan_y;
static int g_map_dragging, g_map_drag_x, g_map_drag_y;   /* a right drag in progress */
#define MAP_ORIGIN_X 248
#define MAP_ORIGIN_Y 50

static void map_tile_origin(int tx, int ty, int cam_tx, int cam_ty, int *sx, int *sy)
{
  *sx = MAP_ORIGIN_X + (tx - cam_tx) * MAP_TILE + g_map_pan_x;
  *sy = MAP_ORIGIN_Y - (ty - cam_ty) * MAP_TILE + g_map_pan_y;   /* tile y grows upwards on screen, as in the automap */
}

static void draw_map_pane(void)
{
  int camx, camy, camz;
  camera(&camx, &camy, &camz);
  int cx = camx >> 8, cy = camy >> 8;
  fill(R_MAP.x0, R_MAP.y0, R_MAP.x1, R_MAP.y1, COL_BLACK);
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) {
      int sx, sy;
      map_tile_origin(tx, ty, cx, cy, &sx, &sy);
      if (sx + MAP_TILE <= R_MAP.x0 || sx >= R_MAP.x1 || sy + MAP_TILE <= R_MAP.y0 || sy >= R_MAP.y1) continue;
      const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty);
      unsigned short c = t ? tile_colour(t) : COL_BLACK;
      for (int y = 0; y < MAP_TILE; y++)
        for (int x = 0; x < MAP_TILE; x++)
          if (sx + x >= R_MAP.x0 && sx + x < R_MAP.x1 && sy + y >= R_MAP.y0 && sy + y < R_MAP.y1)
            put(sx + x, sy + y, t ? tile_pixel(t, tx, ty, x, y) : c);
    }
  /* objects: a dot for each, red for critters */
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) {
      int sx, sy, slot = tile_head(tx, ty);
      map_tile_origin(tx, ty, cx, cy, &sx, &sy);
      if (!slot || sx + MAP_TILE <= R_MAP.x0 || sx >= R_MAP.x1 || sy + MAP_TILE <= R_MAP.y0 || sy >= R_MAP.y1) continue;
      for (int n = 0; slot && n < 64; n++) {
        const uw_object_hdr_t *o = object_at(slot);
        if (!o) break;
        int dx = sx + o->xpos * MAP_TILE / 8, dy = sy + (7 - o->ypos) * MAP_TILE / 8;
        if (dx >= R_MAP.x0 && dx < R_MAP.x1 - 1 && dy >= R_MAP.y0 && dy < R_MAP.y1 - 1)
          fill(dx, dy, dx + 2, dy + 2, is_mobile(o) ? RGB(255, 60, 60) : RGB(255, 255, 80));
        slot = o->next;
      }
    }
  if (g_sel_tx >= 0) {
    int sx, sy;
    map_tile_origin(g_sel_tx, g_sel_ty, cx, cy, &sx, &sy);
    for (int x = sx; x < sx + MAP_TILE; x++) { if (x >= R_MAP.x0 && x < R_MAP.x1) { if (sy >= R_MAP.y0 && sy < R_MAP.y1) put(x, sy, RGB(255, 255, 0)); if (sy + MAP_TILE - 1 >= R_MAP.y0 && sy + MAP_TILE - 1 < R_MAP.y1) put(x, sy + MAP_TILE - 1, RGB(255, 255, 0)); } }
    for (int y = sy; y < sy + MAP_TILE; y++) { if (y >= R_MAP.y0 && y < R_MAP.y1) { if (sx >= R_MAP.x0 && sx < R_MAP.x1) put(sx, y, RGB(255, 255, 0)); if (sx + MAP_TILE - 1 >= R_MAP.x0 && sx + MAP_TILE - 1 < R_MAP.x1) put(sx + MAP_TILE - 1, y, RGB(255, 255, 0)); } }
  }
  /* the camera: a dot at its position in its tile */
  {
    int sx, sy;
    map_tile_origin(cx, cy, cx, cy, &sx, &sy);
    int dx = sx + (camx & 255) * MAP_TILE / 256, dy = sy + (255 - (camy & 255)) * MAP_TILE / 256;
    if (dx - 1 >= R_MAP.x0 && dx + 1 <= R_MAP.x1 && dy - 1 >= R_MAP.y0 && dy + 1 <= R_MAP.y1) fill(dx - 1, dy - 1, dx + 1, dy + 1, RGB(255, 255, 255));
  }
}

/* BUTTONS.GR frames of the mode palette, top to bottom (14x14 each). */
static const int g_mode_frames[8] = { 3, 4, 5, 7, 8, 9, 10, 14 };
/* The mode each button opens: the first icon (the grid) is the texture painter and the second (the swatch) is tile mode. */
static const int g_button_mode[8] = { M_TEXTURE, M_TILE, M_OBJECT, M_VIEW, M_FIND, M_CUTCOPY, M_PASTE, M_FILL };   /* the last is the paint bucket (fill) */

static void draw_palette_pane(void)
{
  fill(R_PALETTE.x0, R_PALETTE.y0, R_PALETTE.x1, R_PALETTE.y1, COL_BLACK);
  sprite("buttons", 15, 153, 1);
  for (int i = 0; i < 8; i++) {
    int y = 26 + 16 * i;
    sprite("buttons", g_mode_frames[i], 157, y);
    if (g_button_mode[i] == g_mode) frame(156, y - 1, 172, y + 15, COL_BLUE);
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
  { 0x180, 0x20, 0x180 }, /* traps */
  { 0x1a0, 0x20, 0x1a0 }, /* triggers */
  { 0x1c0, 0x40, 0x1c0 }, /* decals and effects: blood, smoke, explosions, a sound source */
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

/* a smaller triangle (3 wide, 5 high) for the field pages, whose rows are only 7 pixels apart */
static void arrow_small(int x, int y, int dir, unsigned short c)
{
  for (int i = 0; i < 3; i++)
    for (int j = -i; j <= i; j++) {
      switch (dir) {
        case 0: put(x + i, y + 2 + j, c); break;
        default: put(x + 2 - i, y + 2 + j, c); break;
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

/* The tab pages of the picked-object editor: a row of "- value +" per field, seven visible, scrolling when there are more.
     Item   this object's own fields (an item's quality, owner and flags; a creature's hit points, goal, attitude...)
     Comm   the object's type, from COMOBJ.DAT: height, radius, weight, value, ... (game-wide)
     Class  the object's type, from OBJECTS.DAT: a weapon's damage, armour values, a creature's stats, ... (game-wide)
   Comm and Class edit every object of that type, so their pages are framed red and the status bar says so; they are
   written back to the data files when the level is saved. */
/* An instance field: which part of the object it is, and its range. */
enum { K_QUAL, K_OWNER, K_ZPOS, K_ENCH, K_INVIS, K_DOOR, K_HP, K_GOAL, K_TARGET, K_LEVEL, K_ATTIT, K_TALKED, K_SET_TARGET };
typedef struct { const char *name; int kind, max; } ed_field_t;
enum { TAB_CLASS, TAB_COMM, TAB_ITEM };
#define PAGE_ROWS 7
#define PAGE_ROW_H 7
static const ed_field_t g_crit_fields[] = { { "HP", K_HP, 255 }, { "Goal", K_GOAL, 15 }, { "Target", K_TARGET, 255 }, { "Level", K_LEVEL, 15 }, { "Attit", K_ATTIT, 3 }, { "Talked", K_TALKED, 1 } };
static const ed_field_t g_item_fields[] = { { "Qual", K_QUAL, 63 }, { "Owner", K_OWNER, 63 }, { "Ench", K_ENCH, 1 }, { "Invis", K_INVIS, 1 }, { "Door", K_DOOR, 1 } };
/* Traps (0x180-0x19F) pack their parameters into the quality, owner and height fields; what they mean comes from the game's own trap
   dispatch (traps.c). Types not listed have the generic page. Triggers (0x1A0-0x1BF) keep a target tile in quality and owner; that is
   the plan's guess, not confirmed. */
static const ed_field_t g_trap_damage[] = { { "Damage", K_QUAL, 63 }, { "Sign", K_OWNER, 1 }, { "Invis", K_INVIS, 1 } };                          /* 0x180 */
static const ed_field_t g_trap_teleport[] = { { "TileX", K_QUAL, 63 }, { "TileY", K_OWNER, 63 }, { "Level", K_ZPOS, 127 }, { "Invis", K_INVIS, 1 }, { "Set Target", K_SET_TARGET, 0 } };   /* 0x181 */
static const ed_field_t g_trap_spawn[] = { { "Chance", K_QUAL, 63 }, { "Invis", K_INVIS, 1 } };                                                   /* 0x187 */
static const ed_field_t g_trap_door[] = { { "Action", K_QUAL, 3 }, { "Invis", K_INVIS, 1 } };                                                     /* 0x188: 1 close, 2 open, 3 toggle */
static const ed_field_t g_trap_remove[] = { { "TileX", K_QUAL, 63 }, { "TileY", K_OWNER, 63 }, { "Invis", K_INVIS, 1 }, { "Set Target", K_SET_TARGET, 0 } };   /* 0x18B */
static const ed_field_t g_trap_generic[] = { { "Qual", K_QUAL, 63 }, { "Owner", K_OWNER, 63 }, { "Height", K_ZPOS, 127 }, { "Invis", K_INVIS, 1 } };
static const ed_field_t g_trigger_fields[] = { { "TileX", K_QUAL, 63 }, { "TileY", K_OWNER, 63 }, { "Height", K_ZPOS, 127 }, { "Invis", K_INVIS, 1 }, { "Set Target", K_SET_TARGET, 0 } };

/* A field in a table of fixed-size records: where it is in the record, and which bits of it. */
typedef struct { const char *name; unsigned char off, bytes, shift, bits; } ed_fdesc_t;
static const ed_fdesc_t fd_comobj[] = {   /* a COMOBJ.DAT record as the game holds it (13 bytes) */
  { "Height", 0, 1, 0, 8 }, { "Radius", 1, 2, 0, 3 }, { "Weight", 1, 2, 4, 12 }, { "Value", 5, 2, 0, 16 },
  { "QType", 11, 1, 0, 4 }, { "Look", 11, 1, 4, 1 }, { "Owner", 8, 1, 7, 1 },
};
static const ed_fdesc_t fd_melee[] = { { "Slash", 0, 1, 0, 8 }, { "Bash", 1, 1, 0, 8 }, { "Stab", 2, 1, 0, 8 }, { "MinChg", 3, 1, 0, 8 },
  { "ChgSpd", 4, 1, 0, 8 }, { "MaxChg", 5, 1, 0, 8 }, { "Skill", 6, 1, 0, 8 }, { "Durab", 7, 1, 0, 8 } };
static const ed_fdesc_t fd_ranged[] = { { "Damage", 0, 1, 0, 8 }, { "Speed", 1, 1, 0, 8 }, { "Ammo", 2, 1, 0, 8 } };
static const ed_fdesc_t fd_armor[] = { { "Protect", 0, 1, 0, 8 }, { "Durab", 1, 1, 0, 8 }, { "Slot", 3, 1, 0, 8 } };
static const ed_fdesc_t fd_monster[] = { { "Armor1", 0, 1, 0, 8 }, { "Armor2", 1, 1, 0, 8 }, { "Armor3", 2, 1, 0, 8 }, { "Armor4", 3, 1, 0, 8 },
  { "HP", 4, 1, 0, 8 }, { "Str", 5, 1, 0, 8 }, { "Dex", 6, 1, 0, 8 }, { "Int", 7, 1, 0, 8 }, { "Magic", 11, 1, 0, 8 }, { "Speed", 12, 1, 0, 8 },
  { "TrdLvl", 13, 1, 0, 8 }, { "TrdPat", 14, 1, 0, 8 }, { "Poison", 15, 1, 0, 8 }, { "Defense", 18, 1, 0, 8 }, { "XP", 40, 2, 0, 16 } };
static const ed_fdesc_t fd_container[] = { { "Capacity", 0, 1, 0, 8 }, { "Accepts", 1, 2, 0, 16 } };
static const ed_fdesc_t fd_light[] = { { "Decay", 0, 1, 0, 8 }, { "Bright", 1, 1, 0, 8 } };

/* The OBJECTS.DAT class tables, by object id; file offsets are the order OBJECTS.DAT is read in (a 2 byte header, then these). */
typedef struct { const ed_fdesc_t *fields; int count; unsigned char *base; int recsize, first_id, records, file_offset; } ed_table_t;
#define TABLE(f, base, size, first, n, off) { f, (int)(sizeof f / sizeof *f), (unsigned char *)(base), size, first, n, off }
static ed_table_t g_class_tables[6];
static void class_tables_init(void)
{
  static int done;
  if (done) return;
  done = 1;
  ed_table_t t[6] = {
    TABLE(fd_melee, g_melee_type_props, 8, 0x00, 16, 2),
    TABLE(fd_ranged, g_ranged_type_props, 3, 0x10, 16, 130),
    TABLE(fd_armor, g_armor_type_props, 4, 0x20, 32, 178),
    TABLE(fd_monster, g_monster_type_props, 48, 0x40, 64, 306),
    TABLE(fd_container, g_container_type_props, 3, 0x80, 16, 3378),
    TABLE(fd_light, g_light_type_props, 2, 0x90, 16, 3426),
  };
  memcpy(g_class_tables, t, sizeof t);
}

static const ed_table_t *class_table_for(int id)
{
  class_tables_init();
  for (int i = 0; i < 6; i++)
    if (id >= g_class_tables[i].first_id && id < g_class_tables[i].first_id + g_class_tables[i].records) return &g_class_tables[i];
  return NULL;
}

static int fdesc_max(const ed_fdesc_t *f) { return (1 << f->bits) - 1; }

static int fdesc_get(const unsigned char *rec, const ed_fdesc_t *f)
{
  unsigned v = 0;
  for (int i = f->bytes - 1; i >= 0; i--) v = (v << 8) | rec[f->off + i];
  return (int)((v >> f->shift) & ((1u << f->bits) - 1));
}

static void fdesc_set(unsigned char *rec, const ed_fdesc_t *f, int value)
{
  unsigned v = 0, mask = ((1u << f->bits) - 1) << f->shift;
  for (int i = f->bytes - 1; i >= 0; i--) v = (v << 8) | rec[f->off + i];
  v = (v & ~mask) | (((unsigned)value << f->shift) & mask);
  for (int i = 0; i < f->bytes; i++) rec[f->off + i] = (unsigned char)(v >> (8 * i));
}

static int slot_is_mobile(const uw_object_hdr_t *o)
{
  return is_mobile(o) && encode_object_slot_index(o) < 0x100;
}

static int g_types_dirty;   /* type tables were edited since they were last written to COMOBJ.DAT / OBJECTS.DAT */
static int g_tab_scroll;    /* the first row shown on a page with more than seven */

/* The Item page's fields for an object: a creature's, a trap's or trigger's, or an item's. */
static const ed_field_t *item_fields(const uw_object_hdr_t *o, int *count)
{
  int id = o->object_id;
  if (slot_is_mobile(o)) { *count = (int)(sizeof g_crit_fields / sizeof *g_crit_fields); return g_crit_fields; }
  if ((id & 0x1e0) == 0x1a0) { *count = (int)(sizeof g_trigger_fields / sizeof *g_trigger_fields); return g_trigger_fields; }
  if ((id & 0x1e0) == 0x180) {
    switch (id & 0x3f) {
      case 0: *count = (int)(sizeof g_trap_damage / sizeof *g_trap_damage); return g_trap_damage;
      case 1: *count = (int)(sizeof g_trap_teleport / sizeof *g_trap_teleport); return g_trap_teleport;
      case 7: *count = (int)(sizeof g_trap_spawn / sizeof *g_trap_spawn); return g_trap_spawn;
      case 8: *count = (int)(sizeof g_trap_door / sizeof *g_trap_door); return g_trap_door;
      case 0xb: *count = (int)(sizeof g_trap_remove / sizeof *g_trap_remove); return g_trap_remove;
      default: *count = (int)(sizeof g_trap_generic / sizeof *g_trap_generic); return g_trap_generic;
    }
  }
  *count = (int)(sizeof g_item_fields / sizeof *g_item_fields);
  return g_item_fields;
}

/* Type view: a right click on a palette icon shows that type's Comm and Class pages with no object selected, so tuning a type never
   needs a temporary instance. */
static int g_type_view;
static uw_object_hdr_t g_type_dummy;   /* stands in for an object of the viewed type */
static int g_target_mode;   /* the next click on a tile sets the selected trap's or trigger's target to it */

/* A page's fields for the selected object: how many, and for each its name, value and range. */
static int page_count(int tab, const uw_object_hdr_t *o)
{
  if (tab == TAB_ITEM) { int n; item_fields(o, &n); return n; }
  if (tab == TAB_COMM) return (int)(sizeof fd_comobj / sizeof *fd_comobj);
  const ed_table_t *t = class_table_for(o->object_id);
  return 1 + (t ? t->count : 0);   /* row 0 is the type's own id */
}

static const char *page_name(int tab, int row, const uw_object_hdr_t *o)
{
  if (tab == TAB_ITEM) { int n; return item_fields(o, &n)[row].name; }
  if (tab == TAB_COMM) return fd_comobj[row].name;
  if (row == 0) return "Type";
  return class_table_for(o->object_id)->fields[row - 1].name;
}

static unsigned char *type_record(int tab, const uw_object_hdr_t *o, const ed_fdesc_t **f, int row)
{
  if (tab == TAB_COMM) { *f = &fd_comobj[row]; return (unsigned char *)&g_object_type_props[o->object_id]; }
  const ed_table_t *t = class_table_for(o->object_id);
  *f = &t->fields[row - 1];
  return t->base + (o->object_id - t->first_id) * t->recsize;
}

static int kind_get(int kind, const uw_object_hdr_t *o, int *shown)
{
  const uw_mobile_object_t *m = (const uw_mobile_object_t *)o;
  switch (kind) {
    case K_QUAL: return o->quality;
    case K_OWNER: if (o->is_quant) { *shown = 0; return 0; } return o->owner;   /* a quantity takes the owner's place */
    case K_ZPOS: return o->zpos;
    case K_ENCH: return o->enchanted;
    case K_INVIS: return o->invisible;
    case K_DOOR: return o->doordir;
    case K_HP: return m->npc_hp;
    case K_GOAL: return m->npc_goal;
    case K_TARGET: return m->npc_gtarg;
    case K_LEVEL: return m->npc_level;
    case K_ATTIT: return m->npc_attitude;
    case K_TALKED: return m->npc_talkedto;
    default: return 0;
  }
}

static void kind_set(int kind, uw_object_hdr_t *o, int v)
{
  uw_mobile_object_t *m = (uw_mobile_object_t *)o;
  switch (kind) {
    case K_QUAL: o->quality = (unsigned)v; break;
    case K_OWNER: o->owner = (unsigned)v; break;
    case K_ZPOS: o->zpos = (unsigned)v; break;
    case K_ENCH: o->enchanted = (unsigned)v; break;
    case K_INVIS: o->invisible = (unsigned)v; break;
    case K_DOOR: o->doordir = (unsigned)v; break;
    case K_HP: m->npc_hp = (byte)v; break;
    case K_GOAL: m->npc_goal = (unsigned)v; break;
    case K_TARGET: m->npc_gtarg = (unsigned)v; break;
    case K_LEVEL: m->npc_level = (unsigned)v; break;
    case K_ATTIT: m->npc_attitude = (unsigned)v; break;
    case K_TALKED: m->npc_talkedto = (unsigned)v; break;
    default: break;
  }
}

static int page_get(int tab, int row, const uw_object_hdr_t *o, int *shown, int *lo, int *hi)
{
  *shown = 1; *lo = 0;
  if (tab == TAB_ITEM) {
    int n;
    const ed_field_t *f = item_fields(o, &n);
    *hi = f[row].max;
    return kind_get(f[row].kind, o, shown);
  }
  if (tab == TAB_CLASS && row == 0) { *hi = 0; return o->object_id; }   /* shown, not edited: Replace changes it */
  const ed_fdesc_t *f;
  unsigned char *rec = type_record(tab, o, &f, row);
  *hi = fdesc_max(f);
  return fdesc_get(rec, f);
}

static void remember_type_edit(int tab, int id, int row);

static void page_set(int tab, int row, uw_object_hdr_t *o, int v)
{
  if (tab == TAB_ITEM) {
    int n;
    kind_set(item_fields(o, &n)[row].kind, o, v);
  }
  else {
    static char note[48];
    const ed_fdesc_t *f;
    unsigned char *rec = type_record(tab, o, &f, row);
    fdesc_set(rec, f, v);
    g_types_dirty = 1;
    remember_type_edit(tab, o->object_id, row);
    snprintf(note, sizeof note, "changes every object 0x%x", o->object_id);
    g_status = note;
  }
  set_pending_update_flags(2);
}

static void draw_field_page(const uw_object_hdr_t *o)
{
  char line[16];
  if (!o) return;
  int count = page_count(g_tab, o);
  if (g_tab_scroll > count - PAGE_ROWS) g_tab_scroll = count - PAGE_ROWS;
  if (g_tab_scroll < 0) g_tab_scroll = 0;
  for (int i = 0; i < PAGE_ROWS && g_tab_scroll + i < count; i++) {
    int row = g_tab_scroll + i, y = 129 + i * PAGE_ROW_H, shown, lo, hi;
    int v = page_get(g_tab, row, o, &shown, &lo, &hi);
    if (g_tab == TAB_ITEM) {
      int n;
      if (item_fields(o, &n)[row].kind == K_SET_TARGET) {   /* a button, not a value */
        text(page_name(g_tab, row, o), 4, y, g_target_mode ? COL_TEXT : COL_ORANGE);
        if (g_target_mode) text("click a tile", 40, y, COL_TEXT);
        continue;
      }
    }
    text(page_name(g_tab, row, o), 4, y, shown ? COL_ORANGE : RGB(120, 60, 16));
    if (!shown) continue;
    if (hi > lo) { arrow_small(38, y, 0, COL_BLUE); arrow_small(70, y, 1, COL_BLUE); }
    snprintf(line, sizeof line, "%d", v);
    text(line, 46, y, COL_TEXT);
  }
  if (count > PAGE_ROWS) {   /* scroll arrows at the right edge */
    arrow(78, 129, 2, g_tab_scroll > 0 ? COL_TEXT : COL_FRAME);
    arrow(78, 166, 3, g_tab_scroll < count - PAGE_ROWS ? COL_TEXT : COL_FRAME);
  }
  if (g_tab == TAB_CLASS && !class_table_for(o->object_id)) text("no class table", 4, 138, COL_FRAME);
}

/* The picked object's editor, laid out pixel for pixel from the screenshot of the original: the sub-tile position grid (8 columns of 6
   by 8 rows of 5), the height spinner, the heading rose, the icon box, the "Mv:" box, the Head/Next/Link/Show/Move/Copy/Delete buttons
   (9 high, text at x 121) and the Class/Comm/Item tabs. */
#define BUTTON_COUNT 9
static const char *const g_editor_buttons[BUTTON_COUNT] = { "Head", "Next", "Link", "Back", "Show", "Move", "Copy", "Replace", "Delete" };
#define BUTTON_X 113
#define BUTTON_Y 127
#define BUTTON_H 9
#define SHOWN_BUTTONS 7
/* The buttons the screenshot has, as indices into g_editor_buttons. */
static const int g_shown_button[SHOWN_BUTTONS] = { 0, 1, 2, 4, 5, 6, 8 };
/* HACK: not original behaviour -- Back (out of a container, to the object that holds it) and Replace (the selected object becomes the palette's)
   have no buttons in the screenshot, so they are keys: Backspace and Ctrl+R (see uw_editor_command). */

/* The height spinner's up and down arrows, one 8x15 picture at (75, 129) copied from the screenshot. */
static void draw_spinner_arrows(void)
{
  static const char *const rows[15] = { "aaabcaaa", "aabdbcaa", "aabdbeaa", "abfdfbca", "abdddbea", "bfdddfbg", "bdbhbdbe", "abbbcbaa",
                                       "aabdbeaa", "abbdbbaa", "bdbhbdbe", "bfdddfbg", "abdddbea", "abfdfbca", "aabdbeaa" };
  for (int y = 0; y < 15; y++)
    for (int x = 0; x < 8; x++) {
      unsigned short c;
      switch (rows[y][x]) {
        case 'b': c = RGB(0, 0, 4); break;
        case 'c': c = RGB(151, 89, 36); break;
        case 'd': c = RGB(186, 186, 207); break;
        case 'e': c = RGB(178, 97, 56); break;
        case 'f': c = RGB(101, 101, 125); break;
        case 'g': c = RGB(150, 89, 36); break;
        case 'h': c = RGB(142, 142, 170); break;
        default: continue;
      }
      put(75 + x, 129 + y, c);
    }
}

static void draw_object_editor(void)
{
  static const char *const tabs[3] = { "Class", "Comm", "Item" };
  const uw_object_hdr_t *o = object_at(g_sel_slot);
  char line[16];
  if (g_tab >= 0) {
    const uw_object_hdr_t *po = o;
    if (g_type_view) { g_type_dummy.object_id = (unsigned)g_palette_brush; po = g_tab == TAB_ITEM ? NULL : &g_type_dummy; }
    frame(3, 128, 85, 177, g_tab == TAB_ITEM ? COL_ORANGE : COL_RED);   /* red: a type page, edits every object of the type */
    draw_field_page(po);
  }
  else {
    /* 8x8 grid of 6x5 cells with the object's position marked */
    for (int i = 0; i <= 8; i++) {
      for (int k = 0; k <= 40; k++) put(3 + i * 6, 128 + k, COL_PINK);
      for (int k = 0; k <= 48; k++) put(3 + k, 128 + i * 5, COL_PINK);
    }
    frame(53, 128, 84, 145, COL_DIM_ORANGE);
    frame(53, 146, 84, 174, COL_ORANGE);
    if (o) {
      fill(3 + o->xpos * 6 + 2, 128 + (7 - o->ypos) * 5 + 2, 3 + o->xpos * 6 + 4, 128 + (7 - o->ypos) * 5 + 4, COL_YELLOW);
      const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)g_sel_tx, (short)g_sel_ty);
      int off = t ? o->zpos - t->floor_height * 8 : 0;
      snprintf(line, sizeof line, "%d", o->zpos);
      text(line, 55, 130, COL_BLUE);
      snprintf(line, sizeof line, "%+d", off);
      text(line, 55, 138, COL_BLUE);
      draw_spinner_arrows();
      /* the heading rose: a grey square with eight rays from its centre, the object's heading drawn white */
      fill(61, 153, 75, 167, RGB(89, 89, 109));
      for (int d = 0; d < 8; d++) {
        static const int dx[8] = { 0, 1, 1, 1, 0, -1, -1, -1 }, dy[8] = { -1, -1, 0, 1, 1, 1, 0, -1 };
        for (int r = 1; r <= 7; r++) put(68 + dx[d] * r, 160 + dy[d] * r, d == o->heading ? RGB(255, 255, 255) : COL_YELLOW);
      }
    }
  }
  frame(86, 134, 104, 152, COL_GREEN);
  frame(94, 171, 112, 189, RGB(125, 125, 125));
  /* "Mv:" (the screenshot's label, dimmed there with nothing in the box): probably the object a Move in progress
     holds; not wired yet, so the box stays empty. */
  text("Mv:", 97, 165, g_held_slot ? COL_ORANGE : RGB(97, 32, 0));
  if (object_at(g_held_slot)) sprite("objects", object_at(g_held_slot)->object_id, 95, 172);
  if (g_type_view) sprite("objects", g_palette_brush, 88, 136);
  else if (o) sprite("objects", o->object_id, 88, 136);
  for (int i = 0; i < SHOWN_BUTTONS; i++) {
    int y = BUTTON_Y + i * BUTTON_H;
    unsigned short c = i == SHOWN_BUTTONS - 1 ? COL_RED : COL_ORANGE;
    frame(BUTTON_X, y, BUTTON_X + 36, y + BUTTON_H + 1, COL_DIM_ORANGE);
    text(g_editor_buttons[g_shown_button[i]], i == SHOWN_BUTTONS - 1 ? 115 : 121, y + 2, c);
  }
  /* Class and Comm share a divider at x 33; Item is dim olive */
  static const int tab_x0[3] = { 2, 33, 65 }, tab_x1[3] = { 34, 64, 93 }, tab_text[3] = { 8, 38, 71 };
  for (int i = 0; i < 3; i++) {
    unsigned short c = i < 2 ? COL_BLUE : COL_OLIVE;
    if (i == g_tab) fill(tab_x0[i] + 1, 178, tab_x1[i] - 2, 186, RGB(24, 24, 88));
    frame(tab_x0[i], 177, tab_x1[i], 188, c);
    text(tabs[i], tab_text[i], 180, c);
  }
}

static void draw_info_bar(void)
{
  char line[96];
  int x, y, z;
  camera(&x, &y, &z);
  fill(R_INFO.x0, R_INFO.y0, R_INFO.x1, R_INFO.y1, COL_INFO_BG);
  snprintf(line, sizeof line, "P:%d.%d %d.%d %d", x >> 8, (x & 255) * 10 / 256, y >> 8, (y & 255) * 10 / 256, z >> 3);
  if (!g_status) text(line, 80, 194, COL_INFO_TEXT);
  snprintf(line, sizeof line, "Map= Lvl %d%s%s %d,%d", DAT_00201b68, g_dirty ? "*" : "", g_view_mode ? (g_view_mode == 1 ? " [trig]" : " [mark]") : "", x >> 8, y >> 8);
  if (g_status) text(g_status, 80, 194, RGB(255, 140, 140));   /* replaces the map position while it shows */
  else text(line, 160, 194, COL_INFO_TEXT);
  {
    time_t now = time(NULL);
    strftime(line, sizeof line, "%a %b %d, %I:%M%p", localtime(&now));
    for (char *c = line; *c; c++) if (*c == 'A' || *c == 'P') if (c[1] == 'M' && !c[2]) c[0] = c[0] == 'A' ? 'a' : 'p', c[1] = 'm';
    text(line, 238, 194, COL_INFO_TEXT);
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
  fill(1, 126, 151, 191, COL_PANEL);
  frame(1, 126, 151, 191, RGB(52, 52, 52));   /* the panel's light 1px outline */
  draw_view_pane();
  draw_map_pane();
  draw_palette_pane();
  draw_mode();
  draw_fill_overlay();
  draw_cc_overlay();
  draw_info_bar();
  draw_menu();
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

/* The tile under a point of the map pane (the inverse of map_tile_origin), and where in it, in eighths. */
static int map_tile_at(int px, int py, int *tx, int *ty)
{
  int camx, camy, camz;
  camera(&camx, &camy, &camz);
  int cx = camx >> 8, cy = camy >> 8;
  int u = px - MAP_ORIGIN_X - g_map_pan_x, v = py - g_map_pan_y;
  int col = (int)floor(u / (double)MAP_TILE), row = (int)floor((MAP_ORIGIN_Y + MAP_TILE - 1 - v) / (double)MAP_TILE);
  *tx = cx + col;
  *ty = cy + row;
  g_map_click_sub_x = (u - col * MAP_TILE) * 8 / MAP_TILE;
  g_map_click_sub_y = 7 - (v - (MAP_ORIGIN_Y - row * MAP_TILE)) * 8 / MAP_TILE;
  return *tx >= 0 && *tx < 64 && *ty >= 0 && *ty < 64;
}

static ushort *tile_link(int tx, int ty)
{
  return (ushort *)((char *)tilemap_lookup((short)tx, (short)ty) + 2);   /* the tile's second word: its first object */
}

#define BACK_DEPTH 8
static int g_back_slot[BACK_DEPTH];
static ushort *g_back_link[BACK_DEPTH];
static int g_back_depth;

static void select_tile(int tx, int ty)
{
  g_target_mode = 0;   /* a fresh selection ends a Set Target */
  g_type_view = 0;
  g_back_depth = 0;   /* a fresh selection starts at the top again */
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

/* ---- undo ---- */

/* Everything an edit can change is in the level arena (the tile map, the object tables and both free lists, the active
   mobile list), the scheduler table and the level's texture map, so an undo step is a copy of those, taken before
   each edit. Nothing needs a per-operation inverse. */
#define UNDO_DEPTH 64
#define ARENA_BYTES 0x7c08
#define SCHEDULER_BYTES 0x180

typedef struct {
  unsigned char arena[ARENA_BYTES];
  unsigned char scheduler[SCHEDULER_BYTES];
  unsigned char scheduler_count;
  unsigned char texture_walls[sizeof DAT_0023ae58_backing], texture_floors[sizeof DAT_0023adb8_backing], texture_misc[sizeof DAT_0023b840_backing];
  long a8, c8, f9c;   /* the free list and active-mobile list ends, as offsets from the arena */
  /* the type tables the Comm and Class pages edit */
  unsigned char types_comobj[sizeof g_object_type_props], types_melee[sizeof g_melee_type_props], types_ranged[sizeof g_ranged_type_props],
                types_armor[sizeof g_armor_type_props], types_monster[sizeof g_monster_type_props],
                types_container[sizeof g_container_type_props], types_light[sizeof g_light_type_props];
} ed_snapshot_t;

static ed_snapshot_t g_undo[UNDO_DEPTH], g_redo[UNDO_DEPTH];
static int g_undo_count, g_redo_count;

static void snapshot_take(ed_snapshot_t *s)
{
  char *arena = DAT_002029cc;
  /* the list ends are written into the arena's tail the way a level save does it, then the arena is copied whole */
  *(short *)(arena + 0x7c00) = (short)(DAT_002046c8 - DAT_002046c0);
  *(short *)(arena + 0x7c02) = (short)((DAT_002046a8 - DAT_002046a4) >> 1);
  *(short *)(arena + 0x7c04) = (short)((DAT_0020469c - DAT_002046bc) >> 1);
  *(short *)(arena + 0x7c06) = 0x7577;
  memcpy(s->arena, arena, ARENA_BYTES);
  memcpy(s->scheduler, g_scheduler_table, SCHEDULER_BYTES);
  s->scheduler_count = g_scheduler_count;
  memcpy(s->texture_walls, DAT_0023ae58_backing, sizeof s->texture_walls);
  memcpy(s->texture_floors, DAT_0023adb8_backing, sizeof s->texture_floors);
  memcpy(s->texture_misc, DAT_0023b840_backing, sizeof s->texture_misc);
  memcpy(s->types_comobj, g_object_type_props, sizeof g_object_type_props);
  memcpy(s->types_melee, g_melee_type_props, sizeof g_melee_type_props);
  memcpy(s->types_ranged, g_ranged_type_props, sizeof g_ranged_type_props);
  memcpy(s->types_armor, g_armor_type_props, sizeof g_armor_type_props);
  memcpy(s->types_monster, g_monster_type_props, sizeof g_monster_type_props);
  memcpy(s->types_container, g_container_type_props, sizeof g_container_type_props);
  memcpy(s->types_light, g_light_type_props, sizeof g_light_type_props);
  s->a8 = DAT_002046a8 - arena; s->c8 = (char *)DAT_002046c8 - arena; s->f9c = DAT_0020469c - arena;
}

static void snapshot_restore(const ed_snapshot_t *s)
{
  char *arena = DAT_002029cc;
  memcpy(arena, s->arena, ARENA_BYTES);
  DAT_002046a8 = arena + s->a8;
  DAT_002046c8 = (byte *)(arena + s->c8);
  DAT_0020469c = arena + s->f9c;
  memcpy(g_scheduler_table, s->scheduler, SCHEDULER_BYTES);
  g_scheduler_count = s->scheduler_count;
  memcpy(DAT_0023ae58_backing, s->texture_walls, sizeof s->texture_walls);
  memcpy(DAT_0023adb8_backing, s->texture_floors, sizeof s->texture_floors);
  memcpy(DAT_0023b840_backing, s->texture_misc, sizeof s->texture_misc);
  memcpy(g_object_type_props, s->types_comobj, sizeof g_object_type_props);
  memcpy(g_melee_type_props, s->types_melee, sizeof g_melee_type_props);
  memcpy(g_ranged_type_props, s->types_ranged, sizeof g_ranged_type_props);
  memcpy(g_armor_type_props, s->types_armor, sizeof g_armor_type_props);
  memcpy(g_monster_type_props, s->types_monster, sizeof g_monster_type_props);
  memcpy(g_container_type_props, s->types_container, sizeof g_container_type_props);
  memcpy(g_light_type_props, s->types_light, sizeof g_light_type_props);
}

/* Call before an edit: remember the level as it is. A new edit forgets what could have been redone. */
static void checkpoint(void)
{
  if (g_undo_count == UNDO_DEPTH) {
    memmove(&g_undo[0], &g_undo[1], sizeof g_undo[0] * (UNDO_DEPTH - 1));
    g_undo_count--;
  }
  snapshot_take(&g_undo[g_undo_count++]);
  g_redo_count = 0;
  g_dirty = 1;
}

static void undo_redo(int redo)
{
  ed_snapshot_t *from = redo ? g_redo : g_undo, *to = redo ? g_undo : g_redo;
  int *from_n = redo ? &g_redo_count : &g_undo_count, *to_n = redo ? &g_undo_count : &g_redo_count;
  if (g_held_slot) g_held_slot = 0;
  if (*from_n == 0) { g_status = redo ? "nothing to redo" : "nothing to undo"; return; }
  if (*to_n == UNDO_DEPTH) {
    memmove(&to[0], &to[1], sizeof to[0] * (UNDO_DEPTH - 1));
    (*to_n)--;
  }
  snapshot_take(&to[(*to_n)++]);
  int tex_before = memcmp(DAT_0023ae58_backing, from[*from_n - 1].texture_walls, sizeof DAT_0023ae58_backing) != 0 ||
                   memcmp(DAT_0023adb8_backing, from[*from_n - 1].texture_floors, sizeof DAT_0023adb8_backing) != 0;
  snapshot_restore(&from[--(*from_n)]);
  if (tex_before) { load_terrain_texture_props((char *)DAT_0023ae58_backing, (char *)DAT_0023adb8_backing); load_dungeon_texture_arenas(); }
  g_dirty = 1;
  /* the selected object may no longer exist: keep the tile, drop the object */
  if (g_sel_tx >= 0) { g_sel_slot = 0; g_sel_link = NULL; }
  set_pending_update_flags(0x7ffe);
  full_dungeon_redraw();
  dirty_rect_union(0, 200, 0, 0x140);   /* the editor screen shows the status and the object lists too */
  g_status = redo ? "redone" : "undone";
}

void uw_editor_undo(void) { if (g_active) undo_redo(0); }
void uw_editor_redo(void) { if (g_active) undo_redo(1); }

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
  checkpoint();
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
  checkpoint();
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
    checkpoint();
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
    checkpoint();
    object_list_unlink(link, src);
    put_on_tile(src, tx, ty, sub_x, sub_y);
    select_object_on_tile(tx, ty, src);
    g_status = "moved";
  }
  g_held_slot = 0;
  uw_editor_validate();
}

/* ---- the type tables on disk ---- */

/* Write bytes into a data file at an offset, keeping the rest; the first time, the original is copied to NAME.BAK. */
static int patch_data_file(char *path, char *backup, long offset, const unsigned char *data, long length)
{
  int h = uw_file_open_read(path);
  if (h == -1) return 0;
  unsigned int size = uw_file_size(h, NULL);
  unsigned char *buf = malloc(size > (unsigned long)(offset + length) ? size : (unsigned long)(offset + length));
  if (!buf) { uw_file_close(h); return 0; }
  int ok = uw_file_read(h, buf, size) == (int)size;
  uw_file_close(h);
  if (!ok) { free(buf); return 0; }
  memcpy(buf + offset, data, (size_t)length);
  int have = uw_file_open_read(backup);
  if (have != -1) uw_file_close(have);
  else if (!uw_file_copy(path, backup)) { free(buf); return 0; }
  h = uw_file_open_write(path, 1);
  ok = h != -1 && uw_file_write(h, buf, size) == (int)size;
  if (h != -1) uw_file_close(h);
  free(buf);
  return ok;
}

/* The game changes some type records while it runs (collision.c raises a height), so saving writes only the fields the editor edited,
   never whole records or tables: each edit is remembered here and the field's bytes are patched into the file on Save. */
typedef struct { int tab, id, row; } ed_type_edit_t;
static ed_type_edit_t g_type_edits[256];
static int g_type_edit_count;

static void remember_type_edit(int tab, int id, int row)
{
  for (int i = 0; i < g_type_edit_count; i++)
    if (g_type_edits[i].tab == tab && g_type_edits[i].id == id && g_type_edits[i].row == row) return;
  if (g_type_edit_count < (int)(sizeof g_type_edits / sizeof *g_type_edits))
    g_type_edits[g_type_edit_count++] = (ed_type_edit_t){ tab, id, row };
}

/* COMOBJ.DAT holds 512 records of 11 bytes after a 2 byte header; the game keeps them as 13 byte records with two alignment gaps
   (after the flags byte, and at the end), so a field's place in the file is one earlier from the value on. */
static int save_type_tables(void)
{
  static char comobj[] = "\\DATA\\COMOBJ.DAT", comobj_bak[] = "\\DATA\\COMOBJ.DAT.BAK";
  static char objects[] = "\\DATA\\OBJECTS.DAT", objects_bak[] = "\\DATA\\OBJECTS.DAT.BAK";
  class_tables_init();
  for (int i = 0; i < g_type_edit_count; i++) {
    const ed_type_edit_t *e = &g_type_edits[i];
    if (e->tab == TAB_COMM) {
      const ed_fdesc_t *f = &fd_comobj[e->row];
      const unsigned char *rec = (const unsigned char *)&g_object_type_props[e->id];
      int disk = f->off <= 3 ? f->off : f->off - 1;
      if (!patch_data_file(comobj, comobj_bak, 2 + e->id * 11 + disk, rec + f->off, f->bytes)) return 0;
    }
    else {
      const ed_table_t *t = class_table_for(e->id);
      const ed_fdesc_t *f = &t->fields[e->row - 1];
      const unsigned char *rec = t->base + (e->id - t->first_id) * t->recsize;
      if (!patch_data_file(objects, objects_bak, t->file_offset + (e->id - t->first_id) * t->recsize + f->off, rec + f->off, f->bytes)) return 0;
    }
  }
  g_type_edit_count = 0;
  g_types_dirty = 0;
  return 1;
}

/* Back to what is on disk (Revert, Discard, and entering the editor drop edits to the types too). */
static void reload_type_tables(void)
{
  load_object_catalog_data();
  g_type_edit_count = 0;
  g_types_dirty = 0;
}

/* The master level archive, DATA\\LEV.ARK, is the source of truth. The editor does not work on it directly but on a copy in its own
   folder, EDITOR\\LEV.ARK, alongside the save slots, the way a save slot is a copy: the first time the editor opens, the master is
   copied there; the level is loaded from the copy (so play-session state is thrown away); Play writes the level into the copy and copies
   that over SAVE0; and only a real Save writes the copy over the master (the first one makes a one-time LEV.ARK.BAK of the pristine
   archive). Revert and Discard copy the master over the working copy again. */
static char g_master_ark[] = "\\DATA\\LEV.ARK";
static char g_master_backup[] = "\\DATA\\LEV.ARK.BAK";
static char g_work_ark[] = "\\EDITOR\\LEV.ARK";
static char g_save0_ark[] = "\\SAVE0\\LEV.ARK";
static int g_work_ready;   /* the working copy exists and holds this session's edits (it survives leaving and reopening the editor) */

/* Reload the level being edited from the working copy. With fresh, the master is copied over the working copy first (the edits, the
   type edits too, are dropped); without it a working copy from earlier in the session is kept, and one is made if there is none.
   The player is put back on its tile afterwards, as when the game changes level. */
static int reload_level(int fresh)
{
  int tx = ((const uw_mobile_object_t *)g_player_object)->tile_x, ty = ((const uw_mobile_object_t *)g_player_object)->tile_y;
  if (fresh || !g_work_ready) {
    if (!uw_file_copy(g_master_ark, g_work_ark)) return 0;
    g_work_ready = 1;
    fresh = 1;
    reload_type_tables();
  }
  if (!load_level_from_archive((int)DAT_00201b68, g_work_ark)) return 0;
  set_player_tile_position((uint)tx, (uint)ty, 1);
  g_sel_tx = g_sel_ty = -1;
  g_sel_slot = 0;
  g_sel_link = NULL;
  g_held_slot = 0;
  g_undo_count = g_redo_count = 0;
  if (fresh) g_dirty = 0;
  full_dungeon_redraw();
  set_pending_update_flags(0x7ffe);
  fprintf(stderr, "[editor] level %d loaded from EDITOR\\LEV.ARK%s\n", DAT_00201b68, fresh ? " (a fresh copy of the master)" : "");
  return 1;
}

/* Write the level being edited into the working copy, with the game's own level commit: it writes the level's tile map and objects and its
   texture map (not the automap), and takes the player out of the level and back, as when the player leaves a level. Returns nonzero on success. */
static int commit_to_work(void)
{
  if (g_held_slot) { g_status = "put the object down first"; return 0; }
  if (uw_editor_validate() != 0) { g_status = "object lists are damaged, not saved"; return 0; }
  if (!commit_level_to_archive((int)DAT_00201b68, g_work_ark, 0)) { g_status = "could not write EDITOR\\LEV.ARK"; return 0; }
  g_work_ready = 1;
  return 1;
}

/* A real save: the working copy over the master archive (and the type tables). */
void uw_editor_save(void)
{
  if (!g_active) return;
  int ok = 0;
  if (commit_to_work()) {
    int have = uw_file_open_read(g_master_backup);
    if (have != -1) uw_file_close(have);
    else if (!uw_file_copy(g_master_ark, g_master_backup)) g_status = "could not back up LEV.ARK";
    if (g_status && !strcmp(g_status, "could not back up LEV.ARK")) ;
    else if (g_types_dirty && !save_type_tables()) g_status = "could not write the type tables";
    else if (!uw_file_copy(g_work_ark, g_master_ark)) g_status = "could not write LEV.ARK";
    else ok = 1;
  }
  if (ok) { g_status = "level saved"; g_dirty = 0; }
  else if (!g_status) g_status = "save failed";
  fprintf(stderr, "[editor] save level %d to LEV.ARK: %s\n", DAT_00201b68, ok ? "ok" : "failed");
}

/* Set Target: the clicked tile becomes the selected trap's or trigger's target (quality is its x, owner its y). */
static int apply_target(int tx, int ty)
{
  uw_object_hdr_t *o = object_at(g_sel_slot);
  if (!g_target_mode) return 0;
  g_target_mode = 0;
  if (!o) { g_status = "nothing selected"; return 1; }
  checkpoint();
  o->quality = (unsigned)tx & 63;
  o->owner = (unsigned)ty & 63;
  g_status = "target set";
  set_pending_update_flags(2);
  return 1;
}

static void button_pressed(int i);
static void op_replace(void);
static int apply_target(int tx, int ty);

/* What a point of the 3D view looks at: the floor of a tile, a face of a solid tile (its wall), the ceiling, or nothing. */
enum { HIT_NONE, HIT_FLOOR, HIT_WALL, HIT_CEILING };
enum { FACE_WEST, FACE_EAST, FACE_SOUTH, FACE_NORTH };   /* the side of the solid tile that was hit, named by where it faces */
typedef struct { int kind, tx, ty, face, x, y, z; } ed_hit_t;
#define CEILING_Z 1024   /* the level's ceiling, in 1/256 tiles */

static int view_ray_hit(int scene_x, int scene_y, ed_hit_t *hit)
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
  memset(hit, 0, sizeof *hit);
  dx = dx / len * step; dy = dy / len * step; dz = dz / len * step;
  for (int i = 0; i < 1600; i++) {
    double nx = px + dx, ny = py + dy, nz = pz + dz;
    int tx = (int)floor(nx / 256.0), ty = (int)floor(ny / 256.0);
    int solid = 0, below = 0;
    if (tx < 0 || tx > 63 || ty < 0 || ty > 63) return 0;
    const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)tx, (short)ty);
    if (!t) return 0;
    solid = t->tile_type == 0;
    below = !solid && nz <= t->floor_height * 64.0;
    if (solid || below || nz >= CEILING_Z) {
      double lo = 0.0, hi = 1.0;   /* the crossing between this step's start and end */
      for (int k = 0; k < 8; k++) {
        double m = (lo + hi) / 2;
        double mx = px + dx * m, my = py + dy * m, mz = pz + dz * m;
        int mtx = (int)floor(mx / 256.0), mty = (int)floor(my / 256.0);
        const uw_tile_t *mt = mtx >= 0 && mtx < 64 && mty >= 0 && mty < 64 ? (const uw_tile_t *)tilemap_lookup((short)mtx, (short)mty) : NULL;
        int hit_here = !mt || mt->tile_type == 0 || mz <= mt->floor_height * 64.0 || mz >= CEILING_Z;
        if (hit_here) hi = m; else lo = m;
      }
      hit->x = (int)floor(px + dx * hi); hit->y = (int)floor(py + dy * hi); hit->z = (int)floor(pz + dz * hi);
      if (solid) {
        /* the face is the side the ray came in by: the axis whose tile changed between the last open point and the solid one */
        int ltx = (int)floor((px + dx * lo) / 256.0), lty = (int)floor((py + dy * lo) / 256.0);
        hit->kind = HIT_WALL; hit->tx = tx; hit->ty = ty;
        if (ltx != tx) hit->face = ltx < tx ? FACE_WEST : FACE_EAST;
        else hit->face = lty < ty ? FACE_SOUTH : FACE_NORTH;
      }
      else if (below) { hit->kind = HIT_FLOOR; hit->tx = hit->x >> 8; hit->ty = hit->y >> 8; }
      else { hit->kind = HIT_CEILING; hit->tx = hit->x >> 8; hit->ty = hit->y >> 8; }
      return 1;
    }
    px = nx; py = ny; pz = nz;
  }
  return 0;
}

/* Where a point of the 3D view looks at the floor (the placing and moving of objects), if it does. */
static int floor_under_view_point(int scene_x, int scene_y, int *hit_x, int *hit_y)
{
  ed_hit_t h;
  if (!view_ray_hit(scene_x, scene_y, &h) || h.kind != HIT_FLOOR) return 0;
  *hit_x = h.x;
  *hit_y = h.y;
  return 1;
}

/* ---- tile and terrain mode ---- */

/* The brush: a tile type and a floor height, the door and no-magic flags, and a scope saying which of those a stroke sets. Strokes
   paint tiles on the map or the 3D floor: a click, a drag, a Shift-drag for a rectangle; Ctrl-click is an eyedropper that copies a tile
   into the brush. One undo step per stroke. */
enum { SC_TYPE = 1, SC_HEIGHT = 2, SC_FLAGS = 4 };
static int g_brush_type = 1, g_brush_height, g_brush_door, g_brush_nomagic, g_brush_scope = SC_TYPE | SC_HEIGHT;
static int g_stroke;                         /* 0 none, 1 painting freehand, 2 dragging a rectangle */
static int g_stroke_x0, g_stroke_y0, g_stroke_x1, g_stroke_y1;
static char g_tile_warning[72];              /* what the last stroke left inconsistent */
static const char *const g_tile_type_names[10] = { "solid", "open", "diag SE", "diag SW", "diag NE", "diag NW", "slope N", "slope S", "slope E", "slope W" };

static uw_tile_t *tile_at(int tx, int ty)
{
  return tx >= 0 && tx < 64 && ty >= 0 && ty < 64 ? (uw_tile_t *)tilemap_lookup((short)tx, (short)ty) : NULL;
}

static int tile_object_count(int tx, int ty)
{
  int n = 0;
  for (int slot = tile_head(tx, ty); slot && n < 1024; n++) {
    const uw_object_hdr_t *o = object_at(slot);
    if (!o) break;
    slot = o->next;
  }
  return n;
}

static int is_door_object(const uw_object_hdr_t *o)
{
  return (o->object_id & 0x1f0) == 0x140;   /* doors */
}

static int tile_has_door_object(int tx, int ty)
{
  for (int slot = tile_head(tx, ty), n = 0; slot && n < 1024; n++) {
    const uw_object_hdr_t *o = object_at(slot);
    if (!o) break;
    if (is_door_object(o)) return 1;
    slot = o->next;
  }
  return 0;
}

/* Set a tile from the brush; returns nonzero if it changed. */
static int paint_tile(int tx, int ty)
{
  uw_tile_t *t = tile_at(tx, ty);
  if (!t) return 0;
  uw_tile_t before = *t;
  if (g_brush_scope & SC_TYPE) t->tile_type = (unsigned)g_brush_type;
  if (g_brush_scope & SC_HEIGHT) t->floor_height = (unsigned)g_brush_height;
  if (g_brush_scope & SC_FLAGS) { t->door_bit = (unsigned)g_brush_door; t->no_magic = (unsigned)g_brush_nomagic; }
  return memcmp(&before, t, sizeof before) != 0;
}

static void note_warning(const char *text_in)
{
  snprintf(g_tile_warning, sizeof g_tile_warning, "%s", text_in);
}

/* The consistency checks after a stroke over a region (and the tiles around it): warn, never block. Returns the number of problems. */
static int tile_checks(int x0, int y0, int x1, int y1)
{
  int on_solid = 0, below_floor = 0, door_flag = 0, diag_solid = 0, slope_flat = 0, cam_solid = 0;
  g_tile_warning[0] = 0;
  for (int ty = y0 - 1; ty <= y1 + 1; ty++)
    for (int tx = x0 - 1; tx <= x1 + 1; tx++) {
      const uw_tile_t *t = tile_at(tx, ty);
      if (!t) continue;
      int n = tile_object_count(tx, ty);
      if (t->tile_type == 0 && n) on_solid += n;
      for (int slot = tile_head(tx, ty), k = 0; slot && t->tile_type != 0 && k < 1024; k++) {
        const uw_object_hdr_t *o = object_at(slot);
        if (!o) break;
        if (o->zpos < (unsigned)t->floor_height * 8 && !slot_is_mobile(o)) below_floor++;
        slot = o->next;
      }
      if (t->tile_type != 0 && t->door_bit != (unsigned)tile_has_door_object(tx, ty)) door_flag++;
      if (t->tile_type >= 2 && t->tile_type <= 5) {   /* a diagonal needs an open neighbour on its open side */
        static const int open_dx[4][2] = { { 1, 0 }, { -1, 0 }, { 1, 0 }, { -1, 0 } }, open_dy[4][2] = { { 0, -1 }, { 0, -1 }, { 0, 1 }, { 0, 1 } };
        int k = t->tile_type - 2;
        if (!tile_is_open(tx + open_dx[k][0], ty) && !tile_is_open(tx, ty + open_dy[k][1])) diag_solid++;
      }
      if (t->tile_type >= 6 && t->tile_type <= 9) {   /* a slope should climb to something: its two ends differ in height */
        static const int dx[4] = { 0, 0, 1, -1 }, dy[4] = { 1, -1, 0, 0 };
        int k = t->tile_type - 6;
        const uw_tile_t *a = tile_at(tx + dx[k], ty + dy[k]), *b = tile_at(tx - dx[k], ty - dy[k]);
        if (a && b && a->tile_type != 0 && b->tile_type != 0 && a->floor_height == b->floor_height) slope_flat++;
      }
    }
  {
    int x, y, z;
    camera(&x, &y, &z);
    cam_solid = !tile_is_open(x >> 8, y >> 8);
  }
  int total = on_solid + below_floor + door_flag + diag_solid + slope_flat + cam_solid;
  char line[72];
  line[0] = 0;
  if (on_solid) snprintf(line + strlen(line), sizeof line - strlen(line), "%d on solid ", on_solid);
  if (below_floor) snprintf(line + strlen(line), sizeof line - strlen(line), "%d below floor ", below_floor);
  if (door_flag) snprintf(line + strlen(line), sizeof line - strlen(line), "%d door flag ", door_flag);
  if (diag_solid) snprintf(line + strlen(line), sizeof line - strlen(line), "%d diag ", diag_solid);
  if (slope_flat) snprintf(line + strlen(line), sizeof line - strlen(line), "%d flat slope ", slope_flat);
  if (cam_solid) snprintf(line + strlen(line), sizeof line - strlen(line), "camera in wall ");
  note_warning(line);
  return total;
}

/* Offer to fix them (the Fix button): lift objects that are below a raised floor, and move objects off a solid tile to the nearest open one. */
static void fix_tile_problems(int x0, int y0, int x1, int y1)
{
  checkpoint();
  for (int ty = y0 - 1; ty <= y1 + 1; ty++)
    for (int tx = x0 - 1; tx <= x1 + 1; tx++) {
      uw_tile_t *t = tile_at(tx, ty);
      if (!t) continue;
      if (t->tile_type != 0) {
        for (int slot = tile_head(tx, ty), k = 0; slot && k < 1024; k++) {
          uw_object_hdr_t *o = object_at(slot);
          if (!o) break;
          if (o->zpos < (unsigned)t->floor_height * 8 && !slot_is_mobile(o)) o->zpos = (unsigned)t->floor_height * 8;
          slot = o->next;
        }
        continue;
      }
      /* a solid tile: its objects go to an open neighbour */
      static const int dx[4] = { 1, -1, 0, 0 }, dy[4] = { 0, 0, 1, -1 };
      int to = -1;
      for (int k = 0; k < 4 && to < 0; k++) if (tile_is_open(tx + dx[k], ty + dy[k])) to = k;
      for (int guard = 0; to >= 0 && tile_head(tx, ty) && guard < 1024; guard++) {
        uw_object_hdr_t *o = object_at(tile_head(tx, ty));
        if (!o || is_player(o)) break;
        object_list_unlink(tile_link(tx, ty), o);
        put_on_tile(o, tx + dx[to], ty + dy[to], -1, -1);
      }
    }
  tile_checks(x0, y0, x1, y1);
  set_pending_update_flags(0x7ffe);
  full_dungeon_redraw();
}

/* The renderer builds a tile's geometry from the tile word each frame, so a redraw is all a changed tile needs; the path cache and the
   visibility pass start from the new map. */
static void tiles_changed(int x0, int y0, int x1, int y1)
{
  tile_checks(x0, y0, x1, y1);
  reset_npc_path_cache();
  set_pending_update_flags(0x7ffe);
  full_dungeon_redraw();
  dirty_rect_union(0, 200, 0, 0x140);
}

static void paint_region(int x0, int y0, int x1, int y1)
{
  int lo_x = x0 < x1 ? x0 : x1, hi_x = x0 < x1 ? x1 : x0, lo_y = y0 < y1 ? y0 : y1, hi_y = y0 < y1 ? y1 : y0;
  for (int ty = lo_y; ty <= hi_y; ty++)
    for (int tx = lo_x; tx <= hi_x; tx++) paint_tile(tx, ty);
  tiles_changed(lo_x, lo_y, hi_x, hi_y);
}

static int key_ctrl(void) { return uw_scancode_held(SDL_SCANCODE_LCTRL) || uw_scancode_held(SDL_SCANCODE_RCTRL); }
static int key_shift(void) { return uw_scancode_held(SDL_SCANCODE_LSHIFT) || uw_scancode_held(SDL_SCANCODE_RSHIFT); }

/* A press on a tile of the map or the 3D floor in tile mode: the eyedropper, a rectangle's start, or the start of a freehand stroke. */
static void tile_mode_press(int tx, int ty)
{
  uw_tile_t *t = tile_at(tx, ty);
  if (!t) return;
  select_tile(tx, ty);
  if (key_ctrl()) {   /* eyedropper: the tile becomes the brush */
    g_brush_type = t->tile_type; g_brush_height = t->floor_height; g_brush_door = t->door_bit; g_brush_nomagic = t->no_magic;
    g_status = "brush picked";
  }
  else if (key_shift()) { g_stroke = 2; g_stroke_x0 = g_stroke_x1 = tx; g_stroke_y0 = g_stroke_y1 = ty; }
  else {
    checkpoint();
    g_stroke = 1;
    g_stroke_x0 = g_stroke_x1 = tx; g_stroke_y0 = g_stroke_y1 = ty;
    paint_tile(tx, ty);
    tiles_changed(tx, ty, tx, ty);
  }
}

static void tile_mode_drag(int tx, int ty)
{
  if (g_stroke == 1 && (tx != g_stroke_x1 || ty != g_stroke_y1) && tile_at(tx, ty)) {
    g_stroke_x1 = tx; g_stroke_y1 = ty;
    paint_tile(tx, ty);
    tiles_changed(tx, ty, tx, ty);
  }
  else if (g_stroke == 2 && tile_at(tx, ty)) { g_stroke_x1 = tx; g_stroke_y1 = ty; }
}

static void tile_mode_release(void)
{
  if (g_stroke == 2) {
    checkpoint();
    paint_region(g_stroke_x0, g_stroke_y0, g_stroke_x1, g_stroke_y1);
  }
  g_stroke = 0;
}

/* Raise or lower the selected tile's floor by steps (the panel's buttons). */
static void tile_step_height(int delta)
{
  uw_tile_t *t = tile_at(g_sel_tx, g_sel_ty);
  if (!t) { g_status = "select a tile"; return; }
  int h = (int)t->floor_height + delta;
  if (h < 0 || h > 15) { g_status = "floor height is 0 to 15"; return; }
  checkpoint();
  t->floor_height = (unsigned)h;
  tiles_changed(g_sel_tx, g_sel_ty, g_sel_tx, g_sel_ty);
}

/* ---- the panels ---- */

static const ed_rect_t R_TILE_PAL = { 174, 119, 320, 190 };
#define TILE_ICON 16
#define TILE_ICON_X0 (R_TILE_PAL.x0 + 6)
#define TILE_ICON_Y0 (R_TILE_PAL.y0 + 6)

/* a BUTTONS.GR swatch drawn at twice its size */
static void sprite_2x(const char *resource, int index, int x, int y)
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
      if (pixels[j * w + i]) {
        unsigned short c = (unsigned short)(&g_palette_rgb565)[pixels[j * w + i]];
        put(x + i * 2, y + j * 2, c); put(x + i * 2 + 1, y + j * 2, c); put(x + i * 2, y + j * 2 + 1, c); put(x + i * 2 + 1, y + j * 2 + 1, c);
      }
}

static void checkbox(int x, int y, const char *label, int on, unsigned short c)
{
  frame(x, y, x + 7, y + 7, c);
  if (on) fill(x + 2, y + 2, x + 5, y + 5, COL_TEXT);
  text(label, x + 10, y, c);
}

static void draw_tile_mode(void)
{
  char line[64];
  const uw_tile_t *t = tile_at(g_sel_tx, g_sel_ty);
  /* palette: one icon per tile type (BUTTONS.GR frames 33 to 42), the brush's framed */
  frame(R_TILE_PAL.x0, R_TILE_PAL.y0, R_TILE_PAL.x1, R_TILE_PAL.y1, COL_FRAME);
  for (int i = 0; i < 10; i++) {
    int x = TILE_ICON_X0 + (i % 5) * 26, y = TILE_ICON_Y0 + (i / 5) * 24;
    sprite_2x("buttons", 33 + i, x, y);
    if (i == g_brush_type) frame(x - 2, y - 2, x + TILE_ICON + 2, y + TILE_ICON + 2, COL_BLUE);
  }
  snprintf(line, sizeof line, "brush: %s", g_tile_type_names[g_brush_type]);
  text(line, R_TILE_PAL.x0 + 6, R_TILE_PAL.y0 + 56, COL_TEXT);
  /* panel */
  frame(0, 126, 150, 190, COL_FRAME);
  if (t) {
    snprintf(line, sizeof line, "Tile %d,%d  %s", g_sel_tx, g_sel_ty, g_tile_type_names[t->tile_type < 10 ? t->tile_type : 0]);
    text(line, 4, 128, COL_TEXT);
    snprintf(line, sizeof line, "h%d%s%s  fl%d wl%d  %d obj", t->floor_height, t->door_bit ? " door" : "", t->no_magic ? " nomag" : "", t->floor_tex, t->wall_tex, tile_object_count(g_sel_tx, g_sel_ty));
    text(line, 4, 135, COL_ORANGE);
  }
  else text("select a tile", 4, 128, COL_FRAME);
  /* brush: height, scope, flags */
  snprintf(line, sizeof line, "Height %d", g_brush_height);
  text(line, 4, 145, COL_ORANGE);
  arrow_small(50, 145, 0, COL_BLUE); arrow_small(66, 145, 1, COL_BLUE);
  checkbox(4, 155, "Type", g_brush_scope & SC_TYPE, COL_ORANGE);
  checkbox(40, 155, "Height", g_brush_scope & SC_HEIGHT, COL_ORANGE);
  checkbox(86, 155, "Flags", g_brush_scope & SC_FLAGS, COL_ORANGE);
  checkbox(4, 165, "Door", g_brush_door, COL_BLUE);
  checkbox(40, 165, "NoMagic", g_brush_nomagic, COL_BLUE);
  /* buttons */
  frame(4, 177, 34, 186, COL_ORANGE); text("Raise", 7, 178, COL_ORANGE);
  frame(38, 177, 68, 186, COL_ORANGE); text("Lower", 41, 178, COL_ORANGE);
  frame(72, 177, 98, 186, COL_ORANGE); text("Fix", 79, 178, COL_ORANGE);
  /* side view: the floor heights along the row of the selected tile, nine tiles wide */
  if (t) {
    for (int i = -4; i <= 4; i++) {
      const uw_tile_t *n = tile_at(g_sel_tx + i, g_sel_ty);
      int x = 112 + (i + 4) * 4;
      int bar = n && n->tile_type != 0 ? n->floor_height * 2 + 1 : 0;
      fill(x, 160 - bar, x + 3, 161, i == 0 ? COL_TEXT : (n && n->tile_type == 0 ? RGB(124, 64, 16) : RGB(0, 150, 0)));
    }
    text("side", 112, 163, COL_FRAME);
  }
  if (g_tile_warning[0]) text(g_tile_warning, 4, 118, RGB(255, 140, 140));
  /* a rectangle being dragged shows on the map */
  if (g_stroke == 2) {
    int camx, camy, camz;
    camera(&camx, &camy, &camz);
    int lo_x = g_stroke_x0 < g_stroke_x1 ? g_stroke_x0 : g_stroke_x1, hi_x = g_stroke_x0 < g_stroke_x1 ? g_stroke_x1 : g_stroke_x0;
    int lo_y = g_stroke_y0 < g_stroke_y1 ? g_stroke_y0 : g_stroke_y1, hi_y = g_stroke_y0 < g_stroke_y1 ? g_stroke_y1 : g_stroke_y0;
    int sx0, sy0, sx1, sy1;
    map_tile_origin(lo_x, hi_y, camx >> 8, camy >> 8, &sx0, &sy0);
    map_tile_origin(hi_x, lo_y, camx >> 8, camy >> 8, &sx1, &sy1);
    for (int x = sx0; x <= sx1 + MAP_TILE; x++) { if (x >= R_MAP.x0 && x < R_MAP.x1) { put(x, sy0, COL_TEXT); put(x, sy1 + MAP_TILE, COL_TEXT); } }
    for (int y = sy0; y <= sy1 + MAP_TILE; y++) { if (y >= R_MAP.y0 && y < R_MAP.y1) { put(sx0, y, COL_TEXT); put(sx1 + MAP_TILE, y, COL_TEXT); } }
  }
}

static int tile_mode_click(int x, int y, int button)
{
  (void)button;
  if (in_rect(&R_TILE_PAL, x, y)) {
    for (int i = 0; i < 10; i++) {
      int ix = TILE_ICON_X0 + (i % 5) * 26, iy = TILE_ICON_Y0 + (i / 5) * 24;
      if (x >= ix - 2 && x < ix + TILE_ICON + 2 && y >= iy - 2 && y < iy + TILE_ICON + 2) { g_brush_type = i; return 1; }
    }
    return 1;
  }
  if (x >= 4 && x < 100 && y >= 145 && y < 152) {   /* height */
    if (x < 58) g_brush_height = g_brush_height > 0 ? g_brush_height - 1 : 0;
    else if (x >= 62) g_brush_height = g_brush_height < 15 ? g_brush_height + 1 : 15;
    return 1;
  }
  if (y >= 155 && y < 163) {
    if (x >= 4 && x < 38) g_brush_scope ^= SC_TYPE;
    else if (x >= 40 && x < 84) g_brush_scope ^= SC_HEIGHT;
    else if (x >= 86 && x < 130) g_brush_scope ^= SC_FLAGS;
    return 1;
  }
  if (y >= 165 && y < 173) {
    if (x >= 4 && x < 38) g_brush_door = !g_brush_door;
    else if (x >= 40 && x < 90) g_brush_nomagic = !g_brush_nomagic;
    return 1;
  }
  if (y >= 177 && y < 187) {
    if (x >= 4 && x < 34) tile_step_height(1);
    else if (x >= 38 && x < 68) tile_step_height(-1);
    else if (x >= 72 && x < 98) { if (g_sel_tx >= 0) fix_tile_problems(g_sel_tx, g_sel_ty, g_sel_tx, g_sel_ty); }
    return 1;
  }
  return 0;
}

/* ---- texture painter mode ---- */

/* Each tile has a floor texture slot (floor_tex, 0 to 9) and a wall texture slot (wall_tex, 0 to 47); the level's texture map says which global
   texture each slot shows (48 wall slots into W64.TR's 210 textures, 10 floor slots into F32.TR's 52). The ceiling is the last floor slot (9). Painting
   a tile changes only that tile; editing a slot changes every tile that uses it, so it asks first. */
#define WALL_SLOTS 48
#define FLOOR_SLOTS 10
#define CEILING_SLOT 9
#define GLOBAL_WALLS 210
#define GLOBAL_FLOORS 52
enum { TT_WALL_SLOTS, TT_FLOOR_SLOTS, TT_WALL_TEXTURES, TT_FLOOR_TEXTURES };
static int g_tex_tab = TT_WALL_SLOTS;
static int g_tex_slot[2];                    /* the active slot: [0] wall, [1] floor */
static int g_tex_page;                       /* the first row shown in the palette */
static int g_tex_confirm;                    /* a slot edit waiting for a second click, because tiles use the slot */
static const ed_rect_t R_TEX_PAL = { 174, 119, 320, 190 };
#define TEX_COLS 8
#define TEX_CELL_W 17
#define TEX_CELL_H 22
#define TEX_ROWS 2

static short *tex_list(int floor) { return floor ? (short *)DAT_0023adb8_backing : (short *)DAT_0023ae58_backing; }
static int tex_slots(int floor) { return floor ? FLOOR_SLOTS : WALL_SLOTS; }

/* How many tiles use a slot. */
static int tex_usage(int floor, int slot)
{
  int n = 0;
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) {
      const uw_tile_t *t = tile_at(tx, ty);
      if (t && (floor ? (int)t->floor_tex : (int)t->wall_tex) == slot) n++;
    }
  return n;
}

/* A thumbnail (16x16) of a texture, taken from the low resolution files, cached the first time. */
static const unsigned char *tex_thumb(int floor, int id)
{
  static unsigned char cache[2][GLOBAL_WALLS][256];
  static unsigned char have[2][GLOBAL_WALLS];
  int count = floor ? GLOBAL_FLOORS : GLOBAL_WALLS;
  if (id < 0 || id >= count) return NULL;
  if (!have[floor][id]) {
    static char walls[] = "\\DATA\\W16.TR", floors[] = "\\DATA\\F16.TR";
    int h = uw_file_open_read(floor ? floors : walls);
    unsigned int off = 0;
    if (h == -1) return NULL;
    uw_file_seek(h, 4 + 4 * id, 0);
    if (uw_file_read(h, &off, 4) == 4 && uw_file_seek(h, (int)off, 0) == (int)off) uw_file_read(h, cache[floor][id], 256);
    uw_file_close(h);
    have[floor][id] = 1;
  }
  return cache[floor][id];
}

static void draw_thumb(const unsigned char *pixels, int x, int y, int size, int step)
{
  if (!pixels) return;
  for (int j = 0; j < size; j++)
    for (int i = 0; i < size; i++) put(x + i, y + j, (unsigned short)(&g_palette_rgb565)[pixels[(j * step) * (size * step) + i * step]]);
}

/* The texture a slot shows now, from the arena the game draws from: 64x64 for a wall slot, 32x32 for a floor slot. */
static void draw_slot_texture(int floor, int slot, int x, int y, int size)
{
  const unsigned char *a = (const unsigned char *)(floor ? DAT_0023ae34 : DAT_0023ae38);
  if (!a) return;
  int native = floor ? 32 : 64, step = native / size;
  a += (floor ? 0x400 : 0x1000) * slot;
  for (int j = 0; j < size; j++)
    for (int i = 0; i < size; i++) put(x + i, y + j, (unsigned short)(&g_palette_rgb565)[a[(j * step) * native + i * step]]);
}

/* After the texture lists change (a slot edit, the ceiling, an undo): the textures the game draws from are loaded again. */
static void textures_changed(void)
{
  load_terrain_texture_props((char *)DAT_0023ae58_backing, (char *)DAT_0023adb8_backing);
  load_dungeon_texture_arenas();
  set_pending_update_flags(0x7ffe);
  full_dungeon_redraw();
  dirty_rect_union(0, 200, 0, 0x140);
}

/* Paint a tile's floor or wall slot. Returns nonzero if it changed. */
static int paint_texture(int tx, int ty, int floor)
{
  uw_tile_t *t = tile_at(tx, ty);
  if (!t) return 0;
  int slot = g_tex_slot[floor], before = floor ? (int)t->floor_tex : (int)t->wall_tex;
  if (floor) t->floor_tex = (unsigned)slot; else t->wall_tex = (unsigned)slot;
  return slot != before;
}

static int g_tex_stroke;   /* painting freehand: 1 floor, 2 wall */

static void texture_mode_press(int tx, int ty, int hit_kind)
{
  const uw_tile_t *t = tile_at(tx, ty);
  if (!t) return;
  int floor_tab = g_tex_tab == TT_FLOOR_SLOTS || g_tex_tab == TT_FLOOR_TEXTURES;
  select_tile(tx, ty);
  if (hit_kind == HIT_FLOOR && !floor_tab) { g_status = "pick the Floor tab to paint floors"; return; }
  if (hit_kind == HIT_WALL && floor_tab) { g_status = "pick the Wall tab to paint walls"; return; }
  if (key_ctrl()) {   /* eyedropper: the tile's slot becomes the active one */
    g_tex_slot[floor_tab] = floor_tab ? t->floor_tex : t->wall_tex;
    g_status = "slot picked";
    return;
  }
  checkpoint();
  g_tex_stroke = floor_tab ? 1 : 2;
  paint_texture(tx, ty, floor_tab);
  textures_changed();
}

static void texture_mode_drag(int tx, int ty, int hit_kind)
{
  if (!g_tex_stroke || !tile_at(tx, ty)) return;
  if (hit_kind == HIT_FLOOR && g_tex_stroke == 2) return;
  if (hit_kind == HIT_WALL && g_tex_stroke == 1) return;
  if (paint_texture(tx, ty, g_tex_stroke == 1)) { set_pending_update_flags(0x7ffe); full_dungeon_redraw(); dirty_rect_union(0, 200, 0, 0x140); }
}

static void texture_mode_release(void) { g_tex_stroke = 0; }

/* Change what a slot shows (or the ceiling). A slot that tiles use asks first. */
static void tex_edit_slot(int floor, int slot, int new_id)
{
  int count = floor ? GLOBAL_FLOORS : GLOBAL_WALLS;
  short *list = tex_list(floor);
  if (new_id < 0 || new_id >= count || list[slot] == new_id) return;
  int used = tex_usage(floor, slot);
  if (floor && slot == CEILING_SLOT) used = 0;   /* the ceiling is not on any tile */
  if (used > 0 && !g_tex_confirm) {
    static char msg[48];
    snprintf(msg, sizeof msg, "%d tiles use it: click again", used);
    g_status = msg;
    g_tex_confirm = 1;
    return;
  }
  g_tex_confirm = 0;
  checkpoint();
  list[slot] = (short)new_id;
  textures_changed();
}

/* A global texture picked from the lists: a slot that already shows it becomes the active slot; otherwise a free slot (no tile uses it) is given it. */
static void tex_pick_global(int floor, int id)
{
  short *list = tex_list(floor);
  for (int i = 0; i < tex_slots(floor); i++)
    if (list[i] == id && !(floor && i == CEILING_SLOT)) { g_tex_slot[floor] = i; g_status = "already a slot"; g_tex_tab = floor ? TT_FLOOR_SLOTS : TT_WALL_SLOTS; return; }
  for (int i = 0; i < tex_slots(floor) - (floor ? 1 : 0); i++)
    if (tex_usage(floor, i) == 0) {
      checkpoint();
      list[i] = (short)id;
      g_tex_slot[floor] = i;
      textures_changed();
      g_status = "given a free slot";
      g_tex_tab = floor ? TT_FLOOR_SLOTS : TT_WALL_SLOTS;
      return;
    }
  g_status = "no free slot";
}

static int tex_cells(void)
{
  switch (g_tex_tab) {
    case TT_WALL_SLOTS: return WALL_SLOTS;
    case TT_FLOOR_SLOTS: return FLOOR_SLOTS - 1;   /* the last floor slot is the ceiling, not a floor */
    case TT_WALL_TEXTURES: return GLOBAL_WALLS;
    default: return GLOBAL_FLOORS;
  }
}

/* The texture palette's grid of cells for the current g_tex_tab (slots with their usage, or the global textures), and its page arrows. */
static void draw_texture_grid(void)
{
  char line[64];
  int floor_tab = g_tex_tab == TT_FLOOR_SLOTS || g_tex_tab == TT_FLOOR_TEXTURES;
  int cells = tex_cells(), rows = (cells + TEX_COLS - 1) / TEX_COLS;
  if (g_tex_page > rows - TEX_ROWS) g_tex_page = rows - TEX_ROWS;
  if (g_tex_page < 0) g_tex_page = 0;
  for (int i = 0; i < TEX_COLS * TEX_ROWS; i++) {
    int n = g_tex_page * TEX_COLS + i, x = R_TEX_PAL.x0 + 4 + (i % TEX_COLS) * TEX_CELL_W, y = R_TEX_PAL.y0 + 15 + (i / TEX_COLS) * TEX_CELL_H;
    if (n >= cells) break;
    if (g_tex_tab == TT_WALL_SLOTS || g_tex_tab == TT_FLOOR_SLOTS) {
      draw_slot_texture(floor_tab, n, x, y, 16);
      snprintf(line, sizeof line, "%d", tex_usage(floor_tab, n));
      text(line, x, y + 16, tex_usage(floor_tab, n) ? COL_TEXT : RGB(120, 60, 16));   /* usage: empty slots stand out */
      if (n == g_tex_slot[floor_tab]) frame(x - 1, y - 1, x + 16, y + 17, COL_BLUE);
    }
    else {
      draw_thumb(tex_thumb(floor_tab, n), x, y, 16, 1);
      snprintf(line, sizeof line, "%d", n);
      text(line, x, y + 16, COL_FRAME);
    }
  }
  if (rows > TEX_ROWS) {
    arrow(R_TEX_PAL.x1 - 8, R_TEX_PAL.y0 + 16, 2, g_tex_page > 0 ? COL_TEXT : COL_FRAME);
    arrow(R_TEX_PAL.x1 - 8, R_TEX_PAL.y1 - 8, 3, g_tex_page < rows - TEX_ROWS ? COL_TEXT : COL_FRAME);
  }
}

static void draw_texture_mode(void)
{
  static const char *const tabs[4] = { "Wall", "Floor", "W tex", "F tex" };
  char line[64];
  int floor_tab = g_tex_tab == TT_FLOOR_SLOTS || g_tex_tab == TT_FLOOR_TEXTURES;
  frame(R_TEX_PAL.x0, R_TEX_PAL.y0, R_TEX_PAL.x1, R_TEX_PAL.y1, COL_FRAME);
  for (int i = 0; i < 4; i++) {
    int x = R_TEX_PAL.x0 + 2 + i * 35;
    if (i == g_tex_tab) fill(x + 1, R_TEX_PAL.y0 + 2, x + 33, R_TEX_PAL.y0 + 11, RGB(24, 24, 88));
    frame(x, R_TEX_PAL.y0 + 1, x + 34, R_TEX_PAL.y0 + 12, i < 2 ? COL_ORANGE : COL_BLUE);
    text(tabs[i], x + 3, R_TEX_PAL.y0 + 3, i < 2 ? COL_ORANGE : COL_BLUE);
  }
  draw_texture_grid();
  /* panel: the active slot, its texture, the ceiling, the selected tile */
  frame(0, 126, 150, 190, COL_FRAME);
  int slot = g_tex_slot[floor_tab];
  short *list = tex_list(floor_tab);
  snprintf(line, sizeof line, "%s slot %d: texture %d", floor_tab ? "Floor" : "Wall", slot, list[slot]);
  text(line, 4, 128, COL_TEXT);
  draw_slot_texture(floor_tab, slot, 4, 138, 32);
  snprintf(line, sizeof line, "%d tiles", tex_usage(floor_tab, slot));
  text(line, 42, 138, COL_ORANGE);
  text("texture", 42, 148, COL_ORANGE);
  arrow_small(78, 148, 0, COL_BLUE); arrow_small(92, 148, 1, COL_BLUE);
  snprintf(line, sizeof line, "Ceiling: %d", tex_list(1)[CEILING_SLOT]);
  text(line, 42, 160, COL_ORANGE);
  arrow_small(100, 160, 0, COL_BLUE); arrow_small(114, 160, 1, COL_BLUE);
  const uw_tile_t *t = tile_at(g_sel_tx, g_sel_ty);
  if (t) {
    snprintf(line, sizeof line, "Tile %d,%d: fl %d wl %d", g_sel_tx, g_sel_ty, t->floor_tex, t->wall_tex);
    text(line, 4, 180, COL_FRAME);
  }
}

static void texture_grid_click(int x, int y)
{
  int floor_tab = g_tex_tab == TT_FLOOR_SLOTS || g_tex_tab == TT_FLOOR_TEXTURES;
    int cells = tex_cells(), rows = (cells + TEX_COLS - 1) / TEX_COLS;
    if (x >= R_TEX_PAL.x1 - 9) { g_tex_page += y < (R_TEX_PAL.y0 + R_TEX_PAL.y1) / 2 ? -1 : 1; if (g_tex_page > rows - TEX_ROWS) g_tex_page = rows - TEX_ROWS; if (g_tex_page < 0) g_tex_page = 0; return; }
    int col = (x - R_TEX_PAL.x0 - 4) / TEX_CELL_W, row = (y - R_TEX_PAL.y0 - 15) / TEX_CELL_H;
    int n = (g_tex_page + row) * TEX_COLS + col;
    if (col >= 0 && col < TEX_COLS && row >= 0 && row < TEX_ROWS && n < cells) {
      if (g_tex_tab == TT_WALL_SLOTS || g_tex_tab == TT_FLOOR_SLOTS) { g_tex_slot[floor_tab] = n; g_tex_confirm = 0; }
      else tex_pick_global(floor_tab, n);
    }
}

static int texture_mode_click(int x, int y, int button)
{
  int floor_tab = g_tex_tab == TT_FLOOR_SLOTS || g_tex_tab == TT_FLOOR_TEXTURES;
  int step = button == SDL_BUTTON_RIGHT ? 8 : 1;
  if (in_rect(&R_TEX_PAL, x, y)) {
    if (y < R_TEX_PAL.y0 + 13) {
      int i = (x - R_TEX_PAL.x0 - 2) / 35;
      if (i >= 0 && i < 4) { g_tex_tab = i; g_tex_page = 0; g_tex_confirm = 0; }
      return 1;
    }
    texture_grid_click(x, y);
    return 1;
  }
  if (y >= 148 && y < 156 && x >= 76 && x < 100) {   /* the active slot's texture */
    int slot = g_tex_slot[floor_tab];
    tex_edit_slot(floor_tab, slot, tex_list(floor_tab)[slot] + (x < 90 ? -step : step));
    return 1;
  }
  if (y >= 160 && y < 168 && x >= 98 && x < 124) {   /* the ceiling */
    int id = tex_list(1)[CEILING_SLOT] + (x < 112 ? -step : step);
    if (id >= 0 && id < GLOBAL_FLOORS) { checkpoint(); tex_list(1)[CEILING_SLOT] = (short)id; textures_changed(); }
    return 1;
  }
  return 0;
}

/* ---- fill tool ---- */

/* Click a seed tile and the active brush floods outward through the connected tiles that match it: it paints the floor texture, the wall texture,
   both or the tile type (from the texture painter's slots and the tile brush), spreading over tiles with the same floor texture, wall texture,
   height or type, or over any connected open tile. A tile with the door bit stops it unless "through doors" is on (a stopped door tile is not
   painted). Diagonal and slope tiles are painted but do not spread further, so a fill cannot leak round a corner. Shift-drag fills inside a rectangle. */
enum { FT_FLOOR_TEX, FT_WALL_TEX, FT_BOTH_TEX, FT_TYPE, FILL_TARGETS };
enum { FS_FLOOR_TEX, FS_WALL_TEX, FS_HEIGHT, FS_TYPE, FS_OPEN, FILL_SPREADS };
static int g_fill_target = FT_FLOOR_TEX, g_fill_spread = FS_FLOOR_TEX, g_fill_doors;
static unsigned char g_fill_mask[64 * 64];   /* the tiles a fill would paint (the preview) or just painted (the flash) */
static unsigned g_fill_flash_until;
static int g_fill_hover_x = -1, g_fill_hover_y = -1;
static int g_fill_tab;                       /* the palette shows: 0 wall slots, 1 floor slots, 2 tile types */
static int g_fill_rect;                      /* dragging a rectangle: its first corner is in g_stroke_x0/y0 */
static const char *const g_fill_target_names[FILL_TARGETS] = { "Floor tex", "Wall tex", "Both tex", "Tile type" };
static const char *const g_fill_spread_names[FILL_SPREADS] = { "Same floor", "Same wall", "Same height", "Same type", "Any open" };

static int fill_matches(const uw_tile_t *seed, const uw_tile_t *t)
{
  switch (g_fill_spread) {
    case FS_FLOOR_TEX: return t->floor_tex == seed->floor_tex;
    case FS_WALL_TEX: return t->wall_tex == seed->wall_tex;
    case FS_HEIGHT: return t->floor_height == seed->floor_height;
    case FS_TYPE: return t->tile_type == seed->tile_type;
    default: return t->tile_type != 0;
  }
}

/* The tiles a fill from a seed would paint, in g_fill_mask (limited to a rectangle if given); returns how many. */
static int fill_collect(int sx, int sy, const int *rect)
{
  static int queue[64 * 64];
  int head = 0, tail = 0, count = 0;
  const uw_tile_t *seed = tile_at(sx, sy);
  memset(g_fill_mask, 0, sizeof g_fill_mask);
  if (!seed || (seed->door_bit && !g_fill_doors)) return 0;
  int solid_ok = g_fill_spread == FS_WALL_TEX || g_fill_spread == FS_TYPE;
  g_fill_mask[sy * 64 + sx] = 1;
  queue[tail++] = sy * 64 + sx;
  count = 1;
  while (head < tail) {
    int cur = queue[head++], cx = cur & 63, cy = cur >> 6;
    const uw_tile_t *c = tile_at(cx, cy);
    if (c->tile_type >= 2 && c->tile_type <= 9) continue;   /* diagonals and slopes are painted but do not spread */
    static const int dx[4] = { 1, -1, 0, 0 }, dy[4] = { 0, 0, 1, -1 };
    for (int k = 0; k < 4; k++) {
      int nx = cx + dx[k], ny = cy + dy[k];
      const uw_tile_t *n = tile_at(nx, ny);
      if (!n || g_fill_mask[ny * 64 + nx]) continue;
      if (rect && (nx < rect[0] || nx > rect[2] || ny < rect[1] || ny > rect[3])) continue;
      if (n->tile_type == 0 && !solid_ok) continue;
      if (n->door_bit && !g_fill_doors) continue;
      if (!fill_matches(seed, n)) continue;
      g_fill_mask[ny * 64 + nx] = 1;
      queue[tail++] = ny * 64 + nx;
      count++;
    }
  }
  return count;
}

static void fill_apply(int sx, int sy, const int *rect)
{
  int n = fill_collect(sx, sy, rect);
  if (!n) { g_status = "nothing to fill"; return; }
  checkpoint();
  int x0 = 63, y0 = 63, x1 = 0, y1 = 0;
  for (int i = 0; i < 64 * 64; i++) {
    if (!g_fill_mask[i]) continue;
    uw_tile_t *t = tile_at(i & 63, i >> 6);
    if (g_fill_target == FT_FLOOR_TEX || g_fill_target == FT_BOTH_TEX) t->floor_tex = (unsigned)g_tex_slot[1];
    if (g_fill_target == FT_WALL_TEX || g_fill_target == FT_BOTH_TEX) t->wall_tex = (unsigned)g_tex_slot[0];
    if (g_fill_target == FT_TYPE) t->tile_type = (unsigned)g_brush_type;
    if ((i & 63) < x0) x0 = i & 63;
    if ((i & 63) > x1) x1 = i & 63;
    if ((i >> 6) < y0) y0 = i >> 6;
    if ((i >> 6) > y1) y1 = i >> 6;
  }
  if (g_fill_target == FT_TYPE) tiles_changed(x0, y0, x1, y1);
  else textures_changed();
  g_fill_flash_until = SDL_GetTicks() + 700;   /* the filled tiles flash on the map */
  static char msg[32];
  snprintf(msg, sizeof msg, "filled %d tiles", n);
  g_status = msg;
}

static void fill_mode_press(int tx, int ty)
{
  if (!tile_at(tx, ty)) return;
  select_tile(tx, ty);
  if (key_shift()) { g_fill_rect = 1; g_stroke_x0 = g_stroke_x1 = tx; g_stroke_y0 = g_stroke_y1 = ty; return; }
  fill_apply(tx, ty, NULL);
}

static void fill_mode_release(void)
{
  if (!g_fill_rect) return;
  g_fill_rect = 0;
  int rect[4] = { g_stroke_x0 < g_stroke_x1 ? g_stroke_x0 : g_stroke_x1, g_stroke_y0 < g_stroke_y1 ? g_stroke_y0 : g_stroke_y1,
                  g_stroke_x0 < g_stroke_x1 ? g_stroke_x1 : g_stroke_x0, g_stroke_y0 < g_stroke_y1 ? g_stroke_y1 : g_stroke_y0 };
  fill_apply(g_stroke_x0, g_stroke_y0, rect);
}

static void fill_mode_hover(int tx, int ty)
{
  if (g_fill_rect) { g_stroke_x1 = tx; g_stroke_y1 = ty; }
  if (tx == g_fill_hover_x && ty == g_fill_hover_y) return;
  g_fill_hover_x = tx; g_fill_hover_y = ty;
  if (!g_fill_rect) fill_collect(tx, ty, NULL);   /* the preview */
}

/* the filled or about-to-be-filled tiles, outlined on the map */
static void draw_fill_overlay(void)
{
  int camx, camy, camz;
  unsigned now = SDL_GetTicks();
  int flash = now < g_fill_flash_until;
  if (g_mode != M_FILL && !flash) return;
  camera(&camx, &camy, &camz);
  for (int i = 0; i < 64 * 64; i++) {
    if (!g_fill_mask[i]) continue;
    int sx, sy;
    map_tile_origin(i & 63, i >> 6, camx >> 8, camy >> 8, &sx, &sy);
    if (sx + MAP_TILE <= R_MAP.x0 || sx >= R_MAP.x1 || sy + MAP_TILE <= R_MAP.y0 || sy >= R_MAP.y1) continue;
    for (int d = 1; d < MAP_TILE - 1; d++)   /* a diagonal cross, so the tile's own colour still shows */
      if (sx + d >= R_MAP.x0 && sx + d < R_MAP.x1 && sy + d >= R_MAP.y0 && sy + d < R_MAP.y1) put(sx + d, sy + d, flash ? RGB(255, 255, 255) : RGB(255, 255, 0));
  }
}

static void radio(int x, int y, const char *label, int on, unsigned short c)
{
  frame(x, y, x + 5, y + 5, c);
  if (on) fill(x + 1, y + 1, x + 4, y + 4, COL_TEXT);
  text(label, x + 8, y - 1, c);
}

static void draw_fill_mode(void)
{
  char line[48];
  frame(0, 126, 150, 190, COL_FRAME);
  text("Paint", 4, 128, COL_TEXT);
  for (int i = 0; i < FILL_TARGETS; i++) radio(4, 137 + i * 8, g_fill_target_names[i], g_fill_target == i, COL_ORANGE);
  text("Spread over", 76, 128, COL_TEXT);
  for (int i = 0; i < FILL_SPREADS; i++) radio(76, 137 + i * 8, g_fill_spread_names[i], g_fill_spread == i, COL_BLUE);
  checkbox(4, 176, "Through doors", g_fill_doors, COL_ORANGE);
  /* the brush's palette, like the texture painter's: the wall slots, the floor slots (with their textures), or the tile types */
  frame(R_TEX_PAL.x0, R_TEX_PAL.y0, R_TEX_PAL.x1, R_TEX_PAL.y1, COL_FRAME);
  for (int i = 0; i < 3; i++) {
    static const char *const tabs[3] = { "Wall", "Floor", "Type" };
    int x = R_TEX_PAL.x0 + 2 + i * 35;
    if (i == g_fill_tab) fill(x + 1, R_TEX_PAL.y0 + 2, x + 33, R_TEX_PAL.y0 + 11, RGB(24, 24, 88));
    frame(x, R_TEX_PAL.y0 + 1, x + 34, R_TEX_PAL.y0 + 12, i < 2 ? COL_ORANGE : COL_BLUE);
    text(tabs[i], x + 3, R_TEX_PAL.y0 + 3, i < 2 ? COL_ORANGE : COL_BLUE);
  }
  if (g_fill_tab < 2) { g_tex_tab = g_fill_tab ? TT_FLOOR_SLOTS : TT_WALL_SLOTS; draw_texture_grid(); }
  else {
    for (int i = 0; i < 10; i++) {
      int x = R_TEX_PAL.x0 + 8 + (i % 5) * 26, y = R_TEX_PAL.y0 + 18 + (i / 5) * 24;
      sprite_2x("buttons", 33 + i, x, y);
      if (i == g_brush_type) frame(x - 2, y - 2, x + 18, y + 18, COL_BLUE);
    }
    snprintf(line, sizeof line, "brush: %s", g_tile_type_names[g_brush_type]);
    text(line, R_TEX_PAL.x0 + 6, R_TEX_PAL.y0 + 62, COL_TEXT);
  }
  text("click: fill   Shift-drag: rectangle", 4, 184, COL_FRAME);
  if (g_fill_hover_x >= 0 && !g_fill_rect) {
    int n = 0;
    for (int i = 0; i < 64 * 64; i++) n += g_fill_mask[i];
    snprintf(line, sizeof line, "%d tiles", n);
    text(line, 100, 180, COL_TEXT);
  }
}

static int fill_mode_click(int x, int y, int button)
{
  (void)button;
  if (in_rect(&R_TEX_PAL, x, y)) {
    if (y < R_TEX_PAL.y0 + 13) {
      int i = (x - R_TEX_PAL.x0 - 2) / 35;
      if (i >= 0 && i < 3) { g_fill_tab = i; g_tex_page = 0; }
    }
    else if (g_fill_tab < 2) { g_tex_tab = g_fill_tab ? TT_FLOOR_SLOTS : TT_WALL_SLOTS; texture_grid_click(x, y); }
    else {
      for (int i = 0; i < 10; i++) {
        int bx = R_TEX_PAL.x0 + 8 + (i % 5) * 26, by = R_TEX_PAL.y0 + 18 + (i / 5) * 24;
        if (x >= bx - 2 && x < bx + 18 && y >= by - 2 && y < by + 18) g_brush_type = i;
      }
    }
    g_fill_hover_x = -1;
    return 1;
  }
  if (x >= 4 && x < 72 && y >= 137 && y < 137 + FILL_TARGETS * 8) { g_fill_target = (y - 137) / 8; return 1; }
  if (x >= 76 && x < 148 && y >= 137 && y < 137 + FILL_SPREADS * 8) { g_fill_spread = (y - 137) / 8; g_fill_hover_x = -1; return 1; }
  if (x >= 4 && x < 80 && y >= 176 && y < 184) { g_fill_doors = !g_fill_doors; g_fill_hover_x = -1; return 1; }
  return 0;
}

/* ---- Find ---- */

/* Find looks through every object of the level, containers' contents included, for those that match a criterion: an exact type, a palette
   category, an owner, a whoami, what links to the selected object, what targets the selected tile, or a flag; and four checks of the level
   itself (traps nothing links to, triggers with no trap or a solid target, named creatures with no conversation, owners nobody in the level
   is). Next and Previous step through the matches in tile order and fly the camera to each; All lists them. The scan is the game's own
   find_object_in_world's (tile chains in row order, into containers), made to collect every match instead of the first. */
enum { FC_TYPE, FC_CATEGORY, FC_OWNER, FC_WHOAMI, FC_LINKED, FC_TARGET, FC_FLAGS, FC_ORPHAN_TRAPS, FC_BAD_TRIGGERS, FC_NO_CONVERSATION, FC_OWNER_MISSING, FC_COUNT };
static const char *const g_find_names[FC_COUNT] = { "Type", "Category", "Owner", "Whoami", "Linked to sel", "Targets tile", "Flag", "Orphan traps", "Bad triggers", "No conversation", "Owner missing" };
static int g_find_crit, g_find_value;
typedef struct { int slot, tx, ty, path[8], depth; } ed_found_t;   /* path: the containers it is inside, outermost first */
#define FOUND_MAX 1024
static ed_found_t g_found[FOUND_MAX];
static int g_found_count, g_found_cur = -1, g_found_scroll;

static int find_has_value(int crit) { return crit <= FC_WHOAMI || crit == FC_FLAGS; }
static int find_value_max(int crit)
{
  switch (crit) {
    case FC_TYPE: return 511;
    case FC_CATEGORY: return GROUP_COUNT - 1;
    case FC_OWNER: return 63;
    case FC_WHOAMI: return 255;
    default: return 2;   /* flags: 1 invisible, 2 enchanted */
  }
}

static int group_of(int id)
{
  for (int g = 0; g < GROUP_COUNT; g++)
    if (id >= g_groups[g].first && id < g_groups[g].first + g_groups[g].count) return g;
  return -1;
}

/* What the level looks like to the checks: which slots something links to, and which owners are creatures that exist. */
static unsigned char g_find_linked[0x400], g_find_whoami[256];

static void find_survey_chain(int slot, int depth)
{
  for (int n = 0; slot && n < FOUND_MAX; n++) {
    const uw_object_hdr_t *o = object_at(slot);
    if (!o) return;
    if (!o->is_quant && o->link) g_find_linked[o->link & 0x3ff] = 1;
    if (slot_is_mobile(o)) g_find_whoami[((const uw_mobile_object_t *)o)->npc_whoami] = 1;
    if (!o->is_quant && o->link && (o->object_id & 0x1f0) == 0x80 && depth < 8) find_survey_chain(o->link, depth + 1);
    slot = o->next;
  }
}

static int find_conversation_exists(const uw_object_hdr_t *o)
{
  static char cnv[] = "\\DATA\\cnv.ark";
  int whoami = ((const uw_mobile_object_t *)o)->npc_whoami;
  return probe_archive_entry_exists(cnv, whoami ? (unsigned)whoami : (unsigned)((o->object_id & 0x3f) + 0x100)) > 0;
}

static int find_test(const uw_object_hdr_t *o, int slot)
{
  const uw_mobile_object_t *m = (const uw_mobile_object_t *)o;
  int id = o->object_id;
  switch (g_find_crit) {
    case FC_TYPE: return id == g_find_value;
    case FC_CATEGORY: return group_of(id) == g_find_value;
    case FC_OWNER: return !o->is_quant && o->owner == (unsigned)g_find_value && g_find_value != 0;
    case FC_WHOAMI: return slot_is_mobile(o) && m->npc_whoami == g_find_value;
    case FC_LINKED: return g_sel_slot && !o->is_quant && o->link == (unsigned)g_sel_slot;
    case FC_TARGET: return ((id & 0x1e0) == 0x1a0 || id == 0x181 || id == 0x18b) && o->quality == (unsigned)g_sel_tx && o->owner == (unsigned)g_sel_ty;
    case FC_FLAGS: return g_find_value == 1 ? o->invisible : g_find_value == 2 ? o->enchanted : 0;
    case FC_ORPHAN_TRAPS: return (id & 0x1e0) == 0x180 && !g_find_linked[slot & 0x3ff];
    case FC_BAD_TRIGGERS: {
      if ((id & 0x1e0) != 0x1a0) return 0;
      const uw_object_hdr_t *trap = !o->is_quant && o->link ? object_at(o->link) : NULL;
      return !trap || (trap->object_id & 0x1e0) != 0x180 || !tile_is_open(o->quality, o->owner);
    }
    case FC_NO_CONVERSATION: return slot_is_mobile(o) && m->npc_whoami != 0 && !find_conversation_exists(o);
    case FC_OWNER_MISSING: return !o->is_quant && o->owner && g_object_type_props[id].can_have_owner && !g_find_whoami[o->owner & 255];
    default: return 0;
  }
}

static void find_scan_chain(int slot, int tx, int ty, const int *path, int depth)
{
  for (int n = 0; slot && n < FOUND_MAX; n++) {
    const uw_object_hdr_t *o = object_at(slot);
    if (!o) return;
    if (find_test(o, slot) && g_found_count < FOUND_MAX) {
      ed_found_t *f = &g_found[g_found_count++];
      f->slot = slot; f->tx = tx; f->ty = ty; f->depth = depth;
      memcpy(f->path, path, sizeof(int) * (size_t)depth);
    }
    if (!o->is_quant && o->link && (o->object_id & 0x1f0) == 0x80 && depth < 8) {
      int inner[8];
      memcpy(inner, path, sizeof(int) * (size_t)depth);
      inner[depth] = slot;
      find_scan_chain(o->link, tx, ty, inner, depth + 1);
    }
    slot = o->next;
  }
}

/* Collect every match, in tile order. */
static int find_collect(void)
{
  int path[8] = { 0 };
  g_found_count = 0;
  memset(g_find_linked, 0, sizeof g_find_linked);
  memset(g_find_whoami, 0, sizeof g_find_whoami);
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) find_survey_chain(tile_head(tx, ty), 0);
  for (int ty = 0; ty < 64; ty++)
    for (int tx = 0; tx < 64; tx++) find_scan_chain(tile_head(tx, ty), tx, ty, path, 0);
  return g_found_count;
}

/* Select a found object: through its containers, with the Back stack remembering the way, and fly the camera beside its tile. */
static void find_goto(int index)
{
  if (index < 0 || index >= g_found_count) return;
  const ed_found_t *f = &g_found[index];
  g_found_cur = index;
  select_tile(f->tx, f->ty);
  if (f->depth == 0) select_object_on_tile(f->tx, f->ty, object_at(f->slot));
  else {
    select_object_on_tile(f->tx, f->ty, object_at(f->path[0]));
    for (int d = 0; d < f->depth; d++) {   /* into each container in turn, to the next one or to the object */
      uw_object_hdr_t *box = object_at(g_sel_slot);
      int want = d + 1 < f->depth ? f->path[d + 1] : f->slot;
      if (!box || g_back_depth >= BACK_DEPTH) break;
      g_back_slot[g_back_depth] = g_sel_slot; g_back_link[g_back_depth++] = g_sel_link;
      g_sel_link = &box->link_word;
      g_sel_slot = box->link;
      for (int n = 0; g_sel_slot != want && n < FOUND_MAX; n++) {
        uw_object_hdr_t *c = object_at(g_sel_slot);
        if (!c) break;
        g_sel_link = &c->chain_word;
        g_sel_slot = c->next;
      }
    }
  }
  /* the camera: an open tile beside it, facing it (the tile itself if none is open), at eye height over the floor there */
  static const int dx[4] = { 1, -1, 0, 0 }, dy[4] = { 0, 0, 1, -1 };
  int cx = f->tx, cy = f->ty, from = -1;
  for (int k = 0; k < 4 && from < 0; k++) if (tile_is_open(f->tx + dx[k], f->ty + dy[k])) from = k;
  if (from >= 0) { cx = f->tx + dx[from]; cy = f->ty + dy[from]; }
  if (!tile_is_open(cx, cy)) { g_status = "found, but in a wall"; return; }
  const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)cx, (short)cy);
  DAT_0023be90 = (short)(cx * 256 + 128);
  DAT_0023be92 = (short)(cy * 256 + 128);
  DAT_0023be94 = (short)(t->floor_height * 64 + 176);
  if (from >= 0) DAT_0023bf00 = (ushort)(atan2((double)-dx[from], (double)-dy[from]) * (65536.0 / (2 * M_PI)));   /* looking back at the tile */
  g_map_pan_x = g_map_pan_y = 0;
  set_pending_update_flags(2);
}

static void find_step(int direction)
{
  int n = find_collect();
  static char msg[32];
  snprintf(msg, sizeof msg, "%d found", n);
  g_status = msg;
  if (!n) { g_found_cur = -1; return; }
  /* the next match after the selected object (in tile order), wrapping round */
  int here = g_sel_tx >= 0 ? g_sel_ty * 64 + g_sel_tx : -1, pick = -1;
  if (g_found_cur >= 0 && g_found_cur < n && g_found[g_found_cur].slot == g_sel_slot) pick = (g_found_cur + direction + n) % n;
  else if (direction > 0) { pick = 0; for (int i = 0; i < n; i++) if (g_found[i].ty * 64 + g_found[i].tx > here) { pick = i; break; } }
  else { pick = n - 1; for (int i = n - 1; i >= 0; i--) if (g_found[i].ty * 64 + g_found[i].tx < here) { pick = i; break; } }
  find_goto(pick);
}

static void find_prefill(void)
{
  const uw_object_hdr_t *o = object_at(g_sel_slot);
  if (!o) return;
  switch (g_find_crit) {
    case FC_TYPE: g_find_value = o->object_id; break;
    case FC_CATEGORY: g_find_value = group_of(o->object_id) < 0 ? 0 : group_of(o->object_id); break;
    case FC_OWNER: g_find_value = o->is_quant ? 0 : (int)o->owner; break;
    case FC_WHOAMI: g_find_value = slot_is_mobile(o) ? ((const uw_mobile_object_t *)o)->npc_whoami : 0; break;
    default: break;
  }
}

#define FIND_ROWS 8
#define FIND_ROW_H 8
static const ed_rect_t R_FIND_LIST = { 174, 119, 320, 190 };

static void draw_find_mode(void)
{
  char line[64], name[40];
  frame(0, 126, 150, 190, COL_FRAME);
  text("Find", 4, 128, COL_TEXT);
  snprintf(line, sizeof line, "%s", g_find_names[g_find_crit]);
  text(line, 22, 138, COL_ORANGE);
  arrow_small(4, 138, 0, COL_BLUE); arrow_small(14, 138, 1, COL_BLUE);
  if (find_has_value(g_find_crit)) {
    if (g_find_crit == FC_FLAGS) snprintf(line, sizeof line, "%s", g_find_value == 1 ? "invisible" : g_find_value == 2 ? "enchanted" : "(none)");
    else snprintf(line, sizeof line, "value %d", g_find_value);
    text(line, 22, 148, COL_TEXT);
    arrow_small(4, 148, 0, COL_BLUE); arrow_small(14, 148, 1, COL_BLUE);
    if (g_find_crit == FC_TYPE) { dbgui_object_name(g_find_value, name, sizeof name); text(name, 22, 156, COL_FRAME); }
    frame(100, 146, 146, 155, COL_ORANGE); text("From sel", 103, 147, COL_ORANGE);
  }
  frame(4, 168, 34, 177, COL_ORANGE); text("Prev", 8, 169, COL_ORANGE);
  frame(38, 168, 68, 177, COL_ORANGE); text("Next", 42, 169, COL_ORANGE);
  frame(72, 168, 102, 177, COL_ORANGE); text("All", 80, 169, COL_ORANGE);
  snprintf(line, sizeof line, "%d found", g_found_count);
  text(line, 4, 180, COL_FRAME);
  /* the results: name and tile, with a mark for one inside a container */
  frame(R_FIND_LIST.x0, R_FIND_LIST.y0, R_FIND_LIST.x1, R_FIND_LIST.y1, COL_FRAME);
  if (g_found_scroll > g_found_count - FIND_ROWS) g_found_scroll = g_found_count - FIND_ROWS;
  if (g_found_scroll < 0) g_found_scroll = 0;
  for (int i = 0; i < FIND_ROWS && g_found_scroll + i < g_found_count; i++) {
    const ed_found_t *f = &g_found[g_found_scroll + i];
    const uw_object_hdr_t *o = object_at(f->slot);
    int y = R_FIND_LIST.y0 + 3 + i * FIND_ROW_H;
    if (g_found_scroll + i == g_found_cur) fill(R_FIND_LIST.x0 + 2, y - 1, R_FIND_LIST.x1 - 10, y + FIND_ROW_H - 2, RGB(24, 24, 88));
    if (o) dbgui_object_name(o->object_id, name, sizeof name); else name[0] = 0;
    snprintf(line, sizeof line, "%.18s %d,%d%s", name, f->tx, f->ty, f->depth ? " in" : "");
    text(line, R_FIND_LIST.x0 + 4, y, COL_ORANGE);
  }
  if (g_found_count > FIND_ROWS) {
    arrow(R_FIND_LIST.x1 - 8, R_FIND_LIST.y0 + 3, 2, g_found_scroll > 0 ? COL_TEXT : COL_FRAME);
    arrow(R_FIND_LIST.x1 - 8, R_FIND_LIST.y1 - 8, 3, g_found_scroll < g_found_count - FIND_ROWS ? COL_TEXT : COL_FRAME);
  }
}

static int find_mode_click(int x, int y, int button)
{
  int step = button == SDL_BUTTON_RIGHT ? 8 : 1;
  if (in_rect(&R_FIND_LIST, x, y)) {
    if (x >= R_FIND_LIST.x1 - 9) { g_found_scroll += y < (R_FIND_LIST.y0 + R_FIND_LIST.y1) / 2 ? -1 : 1; return 1; }
    int row = g_found_scroll + (y - R_FIND_LIST.y0 - 3) / FIND_ROW_H;
    if (y >= R_FIND_LIST.y0 + 3 && row < g_found_count) find_goto(row);
    return 1;
  }
  if (y >= 138 && y < 146 && x >= 2 && x < 20) {   /* the criterion */
    g_find_crit = (g_find_crit + (x < 10 ? FC_COUNT - 1 : 1)) % FC_COUNT;
    g_find_value = 0; g_found_count = 0; g_found_cur = -1;
    find_prefill();
    return 1;
  }
  if (find_has_value(g_find_crit) && y >= 148 && y < 156 && x >= 2 && x < 20) {
    int v = g_find_value + (x < 10 ? -step : step);
    g_find_value = v < 0 ? 0 : v > find_value_max(g_find_crit) ? find_value_max(g_find_crit) : v;
    return 1;
  }
  if (find_has_value(g_find_crit) && x >= 100 && x < 146 && y >= 146 && y < 155) { find_prefill(); return 1; }
  if (y >= 168 && y < 178) {
    if (x >= 4 && x < 34) find_step(-1);
    else if (x >= 38 && x < 68) find_step(1);
    else if (x >= 72 && x < 102) { find_collect(); static char msg[32]; snprintf(msg, sizeof msg, "%d found", g_found_count); g_status = msg; g_found_scroll = 0; g_found_cur = -1; }
    return 1;
  }
  return 0;
}

/* ---- cut, copy and paste of tile regions ---- */

/* Cut / Copy mode: drag a rectangle on the map, then Copy or Cut (Cut copies and then makes the region solid). Paste mode: click a tile and
   the clipboard's region goes there with its top left on that tile, after an undo step, then the tile checks run on it. A region is the tiles
   only (type, height, door and no-magic flags, both texture slots), not the objects on them. */
static int g_cc_has_rect, g_cc_dragging;
static int g_cc_x0, g_cc_y0, g_cc_x1, g_cc_y1;     /* the selected rectangle, corners in any order */
static uw_tile_t g_clip[64 * 64];
static int g_clip_w, g_clip_h;
static int g_paste_hover_x = -1, g_paste_hover_y = -1;

static void cc_bounds(int *x0, int *y0, int *x1, int *y1)
{
  *x0 = g_cc_x0 < g_cc_x1 ? g_cc_x0 : g_cc_x1; *x1 = g_cc_x0 < g_cc_x1 ? g_cc_x1 : g_cc_x0;
  *y0 = g_cc_y0 < g_cc_y1 ? g_cc_y0 : g_cc_y1; *y1 = g_cc_y0 < g_cc_y1 ? g_cc_y1 : g_cc_y0;
}

static void cc_copy(void)
{
  int x0, y0, x1, y1;
  if (!g_cc_has_rect) { g_status = "drag a rectangle first"; return; }
  cc_bounds(&x0, &y0, &x1, &y1);
  g_clip_w = x1 - x0 + 1;
  g_clip_h = y1 - y0 + 1;
  for (int j = 0; j < g_clip_h; j++)
    for (int i = 0; i < g_clip_w; i++) {
      g_clip[j * 64 + i] = *tile_at(x0 + i, y0 + j);
      g_clip[j * 64 + i].obj_head = 0;   /* the objects stay where they are */
    }
  static char msg[40];
  snprintf(msg, sizeof msg, "copied %d x %d tiles", g_clip_w, g_clip_h);
  g_status = msg;
}

static void cc_cut(void)
{
  int x0, y0, x1, y1;
  if (!g_cc_has_rect) { g_status = "drag a rectangle first"; return; }
  cc_copy();
  cc_bounds(&x0, &y0, &x1, &y1);
  checkpoint();
  for (int ty = y0; ty <= y1; ty++)
    for (int tx = x0; tx <= x1; tx++) {
      uw_tile_t *t = tile_at(tx, ty);
      t->tile_type = 0; t->floor_height = 0; t->door_bit = 0; t->no_magic = 0;
    }
  tiles_changed(x0, y0, x1, y1);
  static char msg[40];
  snprintf(msg, sizeof msg, "cut %d x %d tiles", g_clip_w, g_clip_h);
  g_status = msg;
}

static void paste_at(int tx, int ty)
{
  if (!g_clip_w) { g_status = "nothing copied"; return; }
  checkpoint();
  int x1 = tx, y1 = ty;
  for (int j = 0; j < g_clip_h; j++)
    for (int i = 0; i < g_clip_w; i++) {
      uw_tile_t *d = tile_at(tx + i, ty + j);
      if (!d) continue;
      const uw_tile_t *c = &g_clip[j * 64 + i];
      d->tile_type = c->tile_type; d->floor_height = c->floor_height; d->door_bit = c->door_bit; d->no_magic = c->no_magic;
      d->floor_tex = c->floor_tex; d->wall_tex = c->wall_tex;
      x1 = tx + i; y1 = ty + j;
    }
  tiles_changed(tx, ty, x1, y1);   /* the checks run on the destination */
  static char msg[48];
  snprintf(msg, sizeof msg, "pasted %d x %d tiles%s", g_clip_w, g_clip_h, g_tile_warning[0] ? " (check the warnings)" : "");
  g_status = msg;
}

static void cc_press(int tx, int ty)
{
  if (!tile_at(tx, ty)) return;
  g_cc_dragging = 1; g_cc_has_rect = 1;
  g_cc_x0 = g_cc_x1 = tx; g_cc_y0 = g_cc_y1 = ty;
  select_tile(tx, ty);
}

static void draw_outline_on_map(int x0, int y0, int x1, int y1, unsigned short c)
{
  int camx, camy, camz, sx0, sy0, sx1, sy1;
  camera(&camx, &camy, &camz);
  map_tile_origin(x0, y1, camx >> 8, camy >> 8, &sx0, &sy0);
  map_tile_origin(x1, y0, camx >> 8, camy >> 8, &sx1, &sy1);
  for (int x = sx0; x <= sx1 + MAP_TILE - 1; x++) if (x >= R_MAP.x0 && x < R_MAP.x1) { if (sy0 >= R_MAP.y0 && sy0 < R_MAP.y1) put(x, sy0, c); if (sy1 + MAP_TILE - 1 >= R_MAP.y0 && sy1 + MAP_TILE - 1 < R_MAP.y1) put(x, sy1 + MAP_TILE - 1, c); }
  for (int y = sy0; y <= sy1 + MAP_TILE - 1; y++) if (y >= R_MAP.y0 && y < R_MAP.y1) { if (sx0 >= R_MAP.x0 && sx0 < R_MAP.x1) put(sx0, y, c); if (sx1 + MAP_TILE - 1 >= R_MAP.x0 && sx1 + MAP_TILE - 1 < R_MAP.x1) put(sx1 + MAP_TILE - 1, y, c); }
}

static void draw_cc_overlay(void)
{
  if (g_mode == M_CUTCOPY && g_cc_has_rect) {
    int x0, y0, x1, y1;
    cc_bounds(&x0, &y0, &x1, &y1);
    draw_outline_on_map(x0, y0, x1, y1, RGB(255, 255, 0));
  }
  if (g_mode == M_PASTE && g_clip_w && g_paste_hover_x >= 0)
    draw_outline_on_map(g_paste_hover_x, g_paste_hover_y, g_paste_hover_x + g_clip_w - 1 < 63 ? g_paste_hover_x + g_clip_w - 1 : 63,
                        g_paste_hover_y + g_clip_h - 1 < 63 ? g_paste_hover_y + g_clip_h - 1 : 63, RGB(255, 255, 255));
}

/* a small picture of the clipboard: its tiles by type and height */
static void draw_clip_preview(int x0, int y0, int w, int h)
{
  frame(x0 - 1, y0 - 1, x0 + w + 1, y0 + h + 1, COL_FRAME);
  fill(x0, y0, x0 + w, y0 + h, COL_BLACK);
  if (!g_clip_w) return;
  int scale = w / (g_clip_w > g_clip_h ? g_clip_w : g_clip_h);
  if (scale < 1) scale = 1;
  for (int j = 0; j < g_clip_h; j++)
    for (int i = 0; i < g_clip_w; i++)
      if (i * scale < w && j * scale < h)
        fill(x0 + i * scale, y0 + (g_clip_h - 1 - j) * scale, x0 + i * scale + scale, y0 + (g_clip_h - 1 - j) * scale + scale, tile_colour(&g_clip[j * 64 + i]));
}

static void draw_cutcopy_mode(int paste)
{
  char line[48];
  frame(0, 126, 150, 190, COL_FRAME);
  text(paste ? "Paste" : "Cut / Copy", 4, 128, COL_TEXT);
  if (!paste) {
    int x0, y0, x1, y1;
    if (g_cc_has_rect) { cc_bounds(&x0, &y0, &x1, &y1); snprintf(line, sizeof line, "%d,%d to %d,%d  (%dx%d)", x0, y0, x1, y1, x1 - x0 + 1, y1 - y0 + 1); }
    else snprintf(line, sizeof line, "drag a rectangle on the map");
    text(line, 4, 140, COL_ORANGE);
    frame(4, 160, 44, 170, COL_ORANGE); text("Copy", 14, 161, COL_ORANGE);
    frame(52, 160, 92, 170, COL_ORANGE); text("Cut", 64, 161, COL_ORANGE);
  }
  else {
    if (g_clip_w) snprintf(line, sizeof line, "%d x %d tiles copied", g_clip_w, g_clip_h);
    else snprintf(line, sizeof line, "nothing copied yet");
    text(line, 4, 140, COL_ORANGE);
    text("click a tile: top left goes there", 4, 152, COL_FRAME);
  }
  frame(R_FIND_LIST.x0, R_FIND_LIST.y0, R_FIND_LIST.x1, R_FIND_LIST.y1, COL_FRAME);
  text("Clipboard", R_FIND_LIST.x0 + 6, R_FIND_LIST.y0 + 4, COL_TEXT);
  draw_clip_preview(R_FIND_LIST.x0 + 8, R_FIND_LIST.y0 + 14, 48, 48);
  if (g_tile_warning[0]) text(g_tile_warning, R_FIND_LIST.x0 + 64, R_FIND_LIST.y0 + 14, RGB(255, 140, 140));
}

static void draw_cutcopy(void) { draw_cutcopy_mode(0); }
static void draw_paste(void) { draw_cutcopy_mode(1); }

static int cutcopy_click(int x, int y, int button)
{
  (void)button;
  if (y >= 160 && y < 171) {
    if (x >= 4 && x < 44) { cc_copy(); return 1; }
    if (x >= 52 && x < 92) { cc_cut(); return 1; }
  }
  return 0;
}

/* ---- the Eye button: view modes ---- */

/* What the 3D view draws as editor sprites (see UW_EDITOR_SPRITE_BASE in editor.h): Preview nothing, as the game would; Triggers the invisible
   objects, traps and triggers; Markers every object. The mode is kept while the editor is closed and opened again. */
static const char *const g_view_names[VIEW_MODES] = { "Preview", "Triggers", "Markers" };
static const char *const g_view_help[VIEW_MODES] = { "as the game would", "invisible things show", "every object shows" };

int uw_editor_view_object(unsigned object_word)
{
  if (!g_active || g_view_mode == VIEW_PREVIEW) return 0;
  if (g_view_mode == VIEW_MARKERS) return 1;
  /* Triggers: an invisible object (bit 14), or a trap (0x180-0x19F) or a trigger (0x1A0-0x1BF), which are class 6 */
  return (object_word & 0x4000) != 0 || (object_word & 0x1c0) == 0x180;
}

/* The sprite an object draws as: its own icon, if the game has one for it; otherwise a diamond coloured for what it is (a trap red, a trigger
   blue, anything else yellow). Palette-index pixels with 0 transparent, cached per object type. */
static unsigned char nearest_palette_index(int r, int g, int b)
{
  int best = 1, best_d = 1 << 30;
  for (int i = 1; i < 256; i++) {
    unsigned short c = (unsigned short)(&g_palette_rgb565)[i];
    int dr = ((c >> 11) & 31) * 255 / 31 - r, dg = ((c >> 5) & 63) * 255 / 63 - g, db = (c & 31) * 255 / 31 - b;
    int d = dr * dr + dg * dg + db * db;
    if (d < best_d) { best_d = d; best = i; }
  }
  return (unsigned char)best;
}

const unsigned char *uw_editor_marker_pixels(int id, int *w, int *h)
{
  static unsigned char cache[512][32 * 32];
  static unsigned char cw[512], ch[512], have[512];
  if (id < 0 || id >= 512) return NULL;
  if (!have[id]) {
    int ok = 0;
    char *rec = (char *)lookup_grtile_by_id((short)resolve_sprite_id_to_frame(id));
    if (rec && rec[1] > 0 && rec[1] <= 32 && rec[2] > 0 && rec[2] <= 32) {
      int sw = (unsigned char)rec[1], sh = (unsigned char)rec[2];
      const unsigned char *px = rec[0] == 4 ? (unsigned char *)rec + 5
          : (const unsigned char *)decompress_gr_bitmap(rec + 4, &DAT_00202520 + (unsigned char)rec[3] * 0x10, rec[0]);
      for (int i = 0; px && i < sw * sh && !ok; i++) if (px[i]) ok = 1;
      if (ok) { memcpy(cache[id], px, (size_t)sw * sh); cw[id] = (unsigned char)sw; ch[id] = (unsigned char)sh; }
    }
    if (!ok) {   /* no icon: a diamond */
      int r = 255, g = 224, b = 64;
      if ((id & 0x1e0) == 0x180) { r = 255; g = 64; b = 64; }
      else if ((id & 0x1e0) == 0x1a0) { r = 64; g = 96; b = 255; }
      unsigned char fill_c = nearest_palette_index(r, g, b), edge = nearest_palette_index(r / 3, g / 3, b / 3);
      memset(cache[id], 0, 12 * 12);
      for (int y = 0; y < 12; y++)
        for (int x = 0; x < 12; x++) {
          int d = abs(x - 5) + abs(y - 5);
          if (d <= 5) cache[id][y * 12 + x] = d == 5 ? edge : fill_c;
        }
      cw[id] = ch[id] = 12;
    }
    have[id] = 1;
  }
  *w = cw[id]; *h = ch[id];
  return cache[id];
}

static void set_view_mode(int mode)
{
  if (mode == g_view_mode) return;
  g_view_mode = mode;
  set_pending_update_flags(0x7ffe);
  full_dungeon_redraw();
  dirty_rect_union(0, 200, 0, 0x140);
}

static void draw_view_mode(void)
{
  frame(0, 126, 150, 190, COL_FRAME);
  text("View", 4, 128, COL_TEXT);
  for (int i = 0; i < VIEW_MODES; i++) {
    int y = 140 + i * 16;
    frame(4, y, 86, y + 13, i == g_view_mode ? COL_BLUE : COL_ORANGE);
    if (i == g_view_mode) fill(5, y + 1, 85, y + 12, RGB(24, 24, 88));
    text(g_view_names[i], 8, y + 1, i == g_view_mode ? COL_TEXT : COL_ORANGE);
    text(g_view_help[i], 8, y + 7, COL_FRAME);
  }
  frame(R_FIND_LIST.x0, R_FIND_LIST.y0, R_FIND_LIST.x1, R_FIND_LIST.y1, COL_FRAME);
  text("Editor sprites", R_FIND_LIST.x0 + 6, R_FIND_LIST.y0 + 4, COL_TEXT);
  static const int legend_ids[3] = { 0x181, 0x1a0, 0xc2 };   /* a trap, a trigger, anything else */
  static const char *const legend[3] = { "trap", "trigger", "invisible object" };
  for (int i = 0; i < 3; i++) {
    int w, h, y = R_FIND_LIST.y0 + 16 + i * 14;
    const unsigned char *px = uw_editor_marker_pixels(legend_ids[i] == 0xc2 ? 0x1ff : legend_ids[i], &w, &h);
    if (px) for (int yy = 0; yy < h; yy++) for (int xx = 0; xx < w; xx++) if (px[yy * w + xx]) put(R_FIND_LIST.x0 + 8 + xx, y + yy, (unsigned short)(&g_palette_rgb565)[px[yy * w + xx]]);
    text(legend[i], R_FIND_LIST.x0 + 28, y + 3, COL_ORANGE);
  }
  text("clickable, like any object", R_FIND_LIST.x0 + 6, R_FIND_LIST.y0 + 60, COL_FRAME);
}

static int view_mode_click(int x, int y, int button)
{
  (void)button;
  for (int i = 0; i < VIEW_MODES; i++)
    if (x >= 4 && x < 86 && y >= 140 + i * 16 && y < 153 + i * 16) { set_view_mode(i); return 1; }
  return 0;
}

static int g_selftest_checks;

/* The 3D view's ray cast: from an open tile with a solid tile to its east, looking east it must hit that tile's west face, looking
   steeply down it must hit the floor of its own tile, and looking up the ceiling. */
static void selftest_picking(void)
{
  int fx = -1, fy = -1;
  for (int ty = 1; ty < 63 && fx < 0; ty++)
    for (int tx = 1; tx < 62; tx++)
      if (tile_is_open(tx, ty) && !tile_is_open(tx + 1, ty) && tile_is_open(tx - 1, ty)) { fx = tx; fy = ty; break; }
  if (fx < 0) { fprintf(stderr, "[editor] selftest: no tile to test the picking from\n"); return; }
  short saved_x = DAT_0023be90, saved_y = DAT_0023be92, saved_z = DAT_0023be94, saved_pitch = DAT_0023beb4;
  ushort saved_facing = (ushort)DAT_0023bf00;
  const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)fx, (short)fy);
  ed_hit_t h;
  DAT_0023be90 = (short)(fx * 256 + 128);
  DAT_0023be92 = (short)(fy * 256 + 128);
  DAT_0023be94 = (short)(t->floor_height * 64 + 176);
  DAT_0023bf00 = 0x4000;   /* facing east */
  DAT_0023beb4 = 0;
  if (!view_ray_hit(160, (int)uw_fullscreen_proj_cy(), &h) || h.kind != HIT_WALL || h.tx != fx + 1 || h.ty != fy || h.face != FACE_WEST) {
    fprintf(stderr, "[editor] selftest FAILED: looking east from (%d,%d) hit kind %d tile (%d,%d) face %d\n", fx, fy, h.kind, h.tx, h.ty, h.face);
    abort();
  }
  DAT_0023beb4 = 80 * 256;   /* steeply down */
  if (!view_ray_hit(160, (int)uw_fullscreen_proj_cy(), &h) || h.kind != HIT_FLOOR || h.tx != fx || h.ty != fy) {
    fprintf(stderr, "[editor] selftest FAILED: looking down from (%d,%d) hit kind %d tile (%d,%d)\n", fx, fy, h.kind, h.tx, h.ty);
    abort();
  }
  DAT_0023beb4 = -80 * 256;   /* up */
  if (!view_ray_hit(160, (int)uw_fullscreen_proj_cy(), &h) || h.kind != HIT_CEILING) {
    fprintf(stderr, "[editor] selftest FAILED: looking up hit kind %d\n", h.kind);
    abort();
  }
  DAT_0023be90 = saved_x; DAT_0023be92 = saved_y; DAT_0023be94 = saved_z; DAT_0023beb4 = saved_pitch; DAT_0023bf00 = saved_facing;
  g_selftest_checks += 3;
}

/* Self-check: run each kind of edit on the camera's tile, undo it, and compare the level with how it was, byte for byte;
   then redo it and compare again. Aborts (so a regression run fails) on any difference. */

static void selftest_expect(const ed_snapshot_t *a, const char *what)
{
  static ed_snapshot_t now;
  snapshot_take(&now);
  g_selftest_checks++;
  if (memcmp(a, &now, sizeof now) != 0) {
    fprintf(stderr, "[editor] selftest FAILED: %s\n", what);
    abort();
  }
  if (uw_editor_validate() != 0) {
    fprintf(stderr, "[editor] selftest FAILED: object lists damaged after %s\n", what);
    abort();
  }
}

void uw_editor_selftest(void)
{
  static ed_snapshot_t before, after;
  int x, y, z;
  if (!g_active) return;
  camera(&x, &y, &z);
  int tx = x >> 8, ty = y >> 8;
  if (!tile_is_open(tx, ty)) { fprintf(stderr, "[editor] selftest: the camera is not over open floor\n"); return; }
  int other_x = tile_is_open(tx + 1, ty) ? tx + 1 : tx - 1;
  g_selftest_checks = 0;
  g_undo_count = g_redo_count = 0;

  /* place a static object, and a critter */
  static const int ids[2] = { 0xc2, 0x44 };
  for (int k = 0; k < 2; k++) {
    snapshot_take(&before);
    op_place(ids[k], tx, ty, 3, 5);
    snapshot_take(&after);
    if (memcmp(&before, &after, sizeof before) == 0) { fprintf(stderr, "[editor] selftest FAILED: placing 0x%x changed nothing\n", ids[k]); abort(); }
    uw_editor_undo();
    selftest_expect(&before, "undoing a placement");
    uw_editor_redo();
    selftest_expect(&after, "redoing a placement");
    uw_editor_undo();
  }

  /* edit the fields of a placed object */
  op_place(0xc2, tx, ty, 3, 5);
  snapshot_take(&before);
  {
    uw_object_hdr_t *o = object_at(g_sel_slot);
    checkpoint();
    page_set(TAB_ITEM, 0, o, 33);
    checkpoint();
    o->zpos = o->zpos + 1;
    checkpoint();
    o->heading = 5;
  }
  uw_editor_undo(); uw_editor_undo(); uw_editor_undo();
  selftest_expect(&before, "undoing three field edits");
  uw_editor_redo(); uw_editor_redo(); uw_editor_redo();
  uw_editor_undo(); uw_editor_undo(); uw_editor_undo();
  selftest_expect(&before, "redoing and undoing three field edits");

  /* copy it to the next tile, then delete the copy, then move the original */
  select_object_on_tile(tx, ty, object_at(tile_head(tx, ty)));
  snapshot_take(&before);
  op_pick_up(1);
  op_put_down(other_x, ty, 2, 2);
  snapshot_take(&after);
  uw_editor_undo();
  selftest_expect(&before, "undoing a copy");
  uw_editor_redo();
  selftest_expect(&after, "redoing a copy");
  select_object_on_tile(other_x, ty, object_at(tile_head(other_x, ty)));
  snapshot_take(&before);
  op_delete();
  snapshot_take(&after);
  if (memcmp(&before, &after, sizeof before) == 0) { fprintf(stderr, "[editor] selftest FAILED: the delete changed nothing\n"); abort(); }
  uw_editor_undo();
  selftest_expect(&before, "undoing a delete");
  uw_editor_redo();
  selftest_expect(&after, "redoing a delete");
  uw_editor_undo();
  select_object_on_tile(tx, ty, object_at(tile_head(tx, ty)));
  snapshot_take(&before);
  op_pick_up(0);
  op_put_down(other_x, ty, 6, 6);
  uw_editor_undo();
  selftest_expect(&before, "undoing a move");

  /* replace with the brush, and put things into a container (then step in and back out with Link and Back) */
  select_object_on_tile(tx, ty, object_at(tile_head(tx, ty)));
  g_palette_brush = 0xc3;
  snapshot_take(&before);
  op_replace();
  uw_editor_undo();
  selftest_expect(&before, "undoing a replace");
  op_place(0x80, other_x, ty, 4, 4);          /* a container */
  int box_slot = g_sel_slot;
  select_object_on_tile(tx, ty, object_at(tile_head(tx, ty)));
  snapshot_take(&before);
  op_pick_up(1);
  select_object_on_tile(other_x, ty, object_at(box_slot));
  button_pressed(2);                           /* Link with an object held: copy it into the container */
  snapshot_take(&after);
  if (g_back_depth != 1 || !object_at(g_sel_slot)) { fprintf(stderr, "[editor] selftest FAILED: not inside the container\n"); abort(); }
  button_pressed(3);                           /* Back out of it */
  if (g_sel_slot != box_slot) { fprintf(stderr, "[editor] selftest FAILED: Back did not return to the container\n"); abort(); }
  button_pressed(0);                           /* Head: into the container's own list */
  if (g_back_depth != 1 || g_sel_slot == box_slot) { fprintf(stderr, "[editor] selftest FAILED: Head did not enter the container's list\n"); abort(); }
  button_pressed(3);
  uw_editor_undo();
  selftest_expect(&before, "undoing a copy into a container (the container's placement is kept)");
  uw_editor_redo();
  selftest_expect(&after, "redoing a copy into a container");
  button_pressed(2); button_pressed(0); button_pressed(3);   /* Link with nothing held, and in and out of the contents */
  selftest_expect(&after, "Link, Head and Back change nothing");

  /* a trap's page (a teleport trap: tile and level) and Set Target on it */
  op_place(0x181, tx, ty, 1, 1);
  {
    uw_object_hdr_t *trap = object_at(g_sel_slot);
    snapshot_take(&before);
    g_target_mode = 1;
    if (!apply_target(other_x, ty)) { fprintf(stderr, "[editor] selftest FAILED: Set Target did nothing\n"); abort(); }
    if (trap->quality != (unsigned)other_x || trap->owner != (unsigned)ty) { fprintf(stderr, "[editor] selftest FAILED: the target is not on the trap\n"); abort(); }
    uw_editor_undo();
    selftest_expect(&before, "undoing Set Target");
    int n; const ed_field_t *tf = item_fields(trap, &n);
    if (n != 5 || tf[0].kind != K_QUAL || tf[4].kind != K_SET_TARGET) { fprintf(stderr, "[editor] selftest FAILED: the teleport trap page\n"); abort(); }
    g_selftest_checks++;
  }

  /* a type edit (the Comm page): undoable like the rest, and written to COMOBJ.DAT and read back */
  select_object_on_tile(tx, ty, object_at(tile_head(tx, ty)));
  {
    uw_object_hdr_t *o = object_at(g_sel_slot);
    int shown, lo, hi, w0 = page_get(TAB_COMM, 2, o, &shown, &lo, &hi);
    snapshot_take(&before);
    checkpoint();
    page_set(TAB_COMM, 2, o, w0 + 1);
    uw_editor_undo();
    selftest_expect(&before, "undoing a type edit");
    checkpoint();
    page_set(TAB_COMM, 2, o, w0 + 1);
    if (!save_type_tables()) { fprintf(stderr, "[editor] selftest FAILED: could not write the type tables\n"); abort(); }
    reload_type_tables();
    g_selftest_checks++;
    if (page_get(TAB_COMM, 2, o, &shown, &lo, &hi) != w0 + 1) { fprintf(stderr, "[editor] selftest FAILED: the type edit was not on disk\n"); abort(); }
    page_set(TAB_COMM, 2, o, w0);   /* and put the file back */
    save_type_tables();
    reload_type_tables();
    if (page_get(TAB_COMM, 2, o, &shown, &lo, &hi) != w0) { fprintf(stderr, "[editor] selftest FAILED: could not restore the type data\n"); abort(); }
    g_selftest_checks++;
  }

  selftest_picking();

  /* tile painting: a stroke over a region (type and height, then flags), undone byte for byte; objects left on a tile that became solid are
     warned about, and Fix moves them off it */
  {
    int px = tx, py = ty;
    int ox = tile_is_open(px + 1, py) ? px + 1 : px - 1;
    op_place(0xc2, ox, py, 3, 3);   /* an object on the tile that is about to become solid */
    snapshot_take(&before);
    g_brush_type = 0; g_brush_scope = SC_TYPE;
    checkpoint();
    paint_region(ox, py, ox, py);
    snapshot_take(&after);
    if (memcmp(&before, &after, sizeof before) == 0) { fprintf(stderr, "[editor] selftest FAILED: painting changed nothing\n"); abort(); }
    if (strstr(g_tile_warning, "on solid") == NULL) { fprintf(stderr, "[editor] selftest FAILED: no warning for an object on a solid tile (%s)\n", g_tile_warning); abort(); }
    fix_tile_problems(ox, py, ox, py);
    if (tile_head(ox, py)) { fprintf(stderr, "[editor] selftest FAILED: Fix left objects on the solid tile\n"); abort(); }
    uw_editor_validate();
    uw_editor_undo(); uw_editor_undo();
    selftest_expect(&before, "undoing a paint stroke and a fix");
    g_brush_type = 1; g_brush_height = 3; g_brush_scope = SC_TYPE | SC_HEIGHT | SC_FLAGS; g_brush_door = 0;
    snapshot_take(&before);
    checkpoint();
    paint_region(ox, py, ox + 1 < 64 ? ox + 1 : ox, py + 1);   /* a rectangle of both */
    uw_editor_undo();
    selftest_expect(&before, "undoing a rectangle stroke");
    g_brush_scope = SC_TYPE | SC_HEIGHT;
    g_selftest_checks += 3;
  }

  /* textures: painting a tile, editing a slot (which asks first when tiles use it), the ceiling and a global texture with no slot, each undone with the
     loaded textures coming back too */
  {
    short *walls = tex_list(0);
    static unsigned char arena_before[WALL_SLOTS * 0x1000];
    int slot = 5, old_id = walls[slot], new_id = (old_id + 7) % GLOBAL_WALLS;
    memcpy(arena_before, DAT_0023ae38, sizeof arena_before);
    snapshot_take(&before);
    g_tex_confirm = 0;
    int used = tex_usage(0, slot);
    tex_edit_slot(0, slot, new_id);
    if (used > 0) {
      if (walls[slot] != old_id) { fprintf(stderr, "[editor] selftest FAILED: a slot in use changed without asking\n"); abort(); }
      tex_edit_slot(0, slot, new_id);   /* the second click confirms */
    }
    if (walls[slot] != new_id || memcmp(arena_before + slot * 0x1000, DAT_0023ae38 + slot * 0x1000, 0x1000) == 0) {
      fprintf(stderr, "[editor] selftest FAILED: the slot edit did not load the texture\n");
      abort();
    }
    uw_editor_undo();
    selftest_expect(&before, "undoing a slot edit");
    if (memcmp(arena_before, DAT_0023ae38, sizeof arena_before) != 0) { fprintf(stderr, "[editor] selftest FAILED: the old texture did not come back\n"); abort(); }
    int ceiling = tex_list(1)[CEILING_SLOT];
    checkpoint();
    tex_list(1)[CEILING_SLOT] = (short)((ceiling + 3) % GLOBAL_FLOORS);
    textures_changed();
    uw_editor_undo();
    selftest_expect(&before, "undoing a ceiling change");
    g_tex_slot[0] = 3;
    checkpoint();
    paint_texture(tx, ty, 0);
    if (tile_at(tx, ty)->wall_tex != 3) { fprintf(stderr, "[editor] selftest FAILED: the tile was not painted\n"); abort(); }
    uw_editor_undo();
    selftest_expect(&before, "undoing a texture stroke");
    g_selftest_checks += 3;
  }

  /* the fill tool: a flood over connected matching tiles (stopping at doors), a rectangle fill, and undo */
  {
    g_fill_target = FT_FLOOR_TEX; g_fill_spread = FS_OPEN; g_fill_doors = 0;
    g_tex_slot[1] = (tile_at(tx, ty)->floor_tex + 1) % (FLOOR_SLOTS - 1);
    int all = fill_collect(tx, ty, NULL);
    if (all < 2) { fprintf(stderr, "[editor] selftest FAILED: the fill found only %d tile(s)\n", all); abort(); }
    /* a door tile next to the seed stops the fill and is not painted; with doors allowed it is */
    int nx = tile_is_open(tx + 1, ty) ? tx + 1 : tx - 1;
    uw_tile_t *door = tile_at(nx, ty);
    unsigned old_door = door->door_bit;
    door->door_bit = 1;
    int with_door_off = fill_collect(tx, ty, NULL);
    if (g_fill_mask[ty * 64 + nx] || with_door_off >= all) { fprintf(stderr, "[editor] selftest FAILED: the fill went through a door\n"); abort(); }
    door->door_bit = old_door;
    g_fill_doors = 1;
    int all_through = fill_collect(tx, ty, NULL);   /* doors allowed: the whole connected area */
    door->door_bit = 1;
    if (fill_collect(tx, ty, NULL) != all_through || !g_fill_mask[ty * 64 + nx]) { fprintf(stderr, "[editor] selftest FAILED: through doors did not reach the door\n"); abort(); }
    g_fill_doors = 0;
    door->door_bit = old_door;
    snapshot_take(&before);
    fill_apply(tx, ty, NULL);
    for (int i = 0; i < 64 * 64; i++)
      if (g_fill_mask[i] && tile_at(i & 63, i >> 6)->floor_tex != (unsigned)g_tex_slot[1]) { fprintf(stderr, "[editor] selftest FAILED: a filled tile was not painted\n"); abort(); }
    uw_editor_undo();
    selftest_expect(&before, "undoing a fill");
    int rect[4] = { tx, ty, tx + 1 < 64 ? tx + 1 : tx, ty + 1 };
    int in_rect_n = fill_collect(tx, ty, rect);
    if (in_rect_n < 1 || in_rect_n > 4) { fprintf(stderr, "[editor] selftest FAILED: a rectangle fill painted %d tiles\n", in_rect_n); abort(); }
    g_fill_spread = FS_FLOOR_TEX;
    g_selftest_checks += 4;
  }

  /* Find: the criteria over every object including container contents, the level checks, and flying to a match through its containers */
  {
    int tiles[5][2], found = 0;
    for (int r = 0; r < 12 && found < 5; r++)
      for (int dy = -r; dy <= r && found < 5; dy++)
        for (int dx = -r; dx <= r && found < 5; dx++) {
          if (r && dx > -r && dx < r && dy > -r && dy < r) continue;
          if (tile_is_open(tx + dx, ty + dy) && (r || (dx == 0 && dy == 0))) { tiles[found][0] = tx + dx; tiles[found][1] = ty + dy; found++; }
        }
    if (found < 5) { fprintf(stderr, "[editor] selftest: too few open tiles to test Find\n"); }
    else {
      op_place(0x80, tiles[0][0], tiles[0][1], 4, 4);   /* a container with a skull in it */
      int box = g_sel_slot;
      op_place(0xc2, tiles[1][0], tiles[1][1], 4, 4);
      select_object_on_tile(tiles[1][0], tiles[1][1], object_at(tile_head(tiles[1][0], tiles[1][1])));
      op_pick_up(0);
      select_object_on_tile(tiles[0][0], tiles[0][1], object_at(box));
      button_pressed(2);
      int skull = g_sel_slot;
      op_place(0x181, tiles[2][0], tiles[2][1], 4, 4);   /* a trap nothing links to */
      int trap = g_sel_slot;
      op_place(0x1a0, tiles[3][0], tiles[3][1], 4, 4);   /* a trigger with no trap */
      int trigger = g_sel_slot;
      op_place(0x44, tiles[4][0], tiles[4][1], 4, 4);    /* a creature whose whoami has no conversation */
      uw_mobile_object_t *critter = (uw_mobile_object_t *)object_at(g_sel_slot);
      critter->npc_whoami = 250;
      int critter_slot = g_sel_slot;
      #define FIND_HAS(slot_) ({ int h_ = 0; for (int i_ = 0; i_ < g_found_count; i_++) if (g_found[i_].slot == (slot_)) h_ = 1; h_; })
      g_find_crit = FC_TYPE; g_find_value = 0xc2;
      find_collect();
      if (!FIND_HAS(skull)) { fprintf(stderr, "[editor] selftest FAILED: Find missed an object inside a container\n"); abort(); }
      g_find_crit = FC_ORPHAN_TRAPS; find_collect();
      if (!FIND_HAS(trap)) { fprintf(stderr, "[editor] selftest FAILED: Find missed an orphan trap\n"); abort(); }
      g_find_crit = FC_BAD_TRIGGERS; find_collect();
      if (!FIND_HAS(trigger)) { fprintf(stderr, "[editor] selftest FAILED: Find missed a trigger with no trap\n"); abort(); }
      g_find_crit = FC_NO_CONVERSATION; find_collect();
      if (!FIND_HAS(critter_slot)) { fprintf(stderr, "[editor] selftest FAILED: Find missed a creature with no conversation\n"); abort(); }
      g_find_crit = FC_WHOAMI; g_find_value = 250; find_collect();
      if (g_found_count != 1 || g_found[0].slot != critter_slot) { fprintf(stderr, "[editor] selftest FAILED: Find by whoami\n"); abort(); }
      g_find_crit = FC_LINKED; g_sel_slot = skull; find_collect();
      if (!FIND_HAS(box)) { fprintf(stderr, "[editor] selftest FAILED: Find missed what links to the selection\n"); abort(); }
      /* going to the skull selects it inside its container (Back returns to the container) and puts the camera beside the container's tile */
      g_find_crit = FC_TYPE; g_find_value = 0xc2; find_collect();
      int idx = -1;
      for (int i = 0; i < g_found_count; i++) if (g_found[i].slot == skull) idx = i;
      find_goto(idx);
      if (g_sel_slot != skull || g_back_depth != 1 || g_back_slot[0] != box) { fprintf(stderr, "[editor] selftest FAILED: Find did not select through the container\n"); abort(); }
      int cx, cy, cz;
      camera(&cx, &cy, &cz);
      if (abs((cx >> 8) - tiles[0][0]) + abs((cy >> 8) - tiles[0][1]) > 1) { fprintf(stderr, "[editor] selftest FAILED: Find put the camera at (%d,%d), not beside (%d,%d)\n", cx >> 8, cy >> 8, tiles[0][0], tiles[0][1]); abort(); }
      #undef FIND_HAS
      g_found_count = 0; g_found_cur = -1;
      g_selftest_checks += 8;
    }
  }

  /* cut, copy and paste of a tile region: the clipboard has the tiles (not the objects), paste puts them with the top left at the clicked tile,
     cut makes the region solid, and each is one undo step */
  {
    int x0 = tx > 1 ? tx - 1 : 0, y0 = ty > 1 ? ty - 1 : 0;
    g_cc_has_rect = 1; g_cc_x0 = x0; g_cc_y0 = y0; g_cc_x1 = x0 + 2; g_cc_y1 = y0 + 2;
    cc_copy();
    if (g_clip_w != 3 || g_clip_h != 3) { fprintf(stderr, "[editor] selftest FAILED: copied %d x %d\n", g_clip_w, g_clip_h); abort(); }
    for (int j = 0; j < 3; j++)
      for (int i = 0; i < 3; i++) {
        const uw_tile_t *src = tile_at(x0 + i, y0 + j), *c = &g_clip[j * 64 + i];
        if (c->tile_type != src->tile_type || c->floor_height != src->floor_height || c->floor_tex != src->floor_tex || c->wall_tex != src->wall_tex || c->obj_head != 0) {
          fprintf(stderr, "[editor] selftest FAILED: the clipboard differs from the region\n"); abort();
        }
      }
    int px = x0 + 8 < 60 ? x0 + 8 : x0 - 8, py = y0;
    snapshot_take(&before);
    paste_at(px, py);
    for (int j = 0; j < 3; j++)
      for (int i = 0; i < 3; i++) {
        const uw_tile_t *d = tile_at(px + i, py + j), *c = &g_clip[j * 64 + i];
        if (d->tile_type != c->tile_type || d->floor_height != c->floor_height || d->floor_tex != c->floor_tex || d->wall_tex != c->wall_tex) {
          fprintf(stderr, "[editor] selftest FAILED: a pasted tile differs\n"); abort();
        }
      }
    uw_editor_undo();
    selftest_expect(&before, "undoing a paste");
    cc_cut();
    for (int j = 0; j < 3; j++) for (int i = 0; i < 3; i++) if (tile_at(x0 + i, y0 + j)->tile_type != 0) { fprintf(stderr, "[editor] selftest FAILED: cut left an open tile\n"); abort(); }
    uw_editor_undo();
    selftest_expect(&before, "undoing a cut");
    g_cc_has_rect = 0;
    g_selftest_checks += 4;
  }

  /* deleting the head of a tile with several objects leaves its siblings; a class-7 object (a decal, which the game keeps in its scheduler)
     deletes cleanly; and with a free list that is empty the editor refuses to place instead of letting the game despawn objects */
  {
    int px = tx, py = ty;
    op_place(0xc2, px, py, 1, 1);
    op_place(0xc3, px, py, 6, 6);   /* now the head of the tile's chain, with the first behind it */
    int before_count = tile_object_count(px, py);
    select_object_on_tile(px, py, object_at(tile_head(px, py)));
    snapshot_take(&before);
    op_delete();
    if (tile_object_count(px, py) != before_count - 1) { fprintf(stderr, "[editor] selftest FAILED: deleting a tile head took its siblings (%d to %d)\n", before_count, tile_object_count(px, py)); abort(); }
    uw_editor_validate();
    uw_editor_undo();
    selftest_expect(&before, "undoing the delete of a tile head");
    op_place(0x1c0, px, py, 3, 3);   /* class 7: blood */
    select_object_on_tile(px, py, object_at(tile_head(px, py)));
    snapshot_take(&before);
    op_delete();
    uw_editor_validate();
    uw_editor_undo();
    selftest_expect(&before, "undoing the delete of a class 7 object");
    char *saved_free = DAT_0020469c;
    DAT_0020469c = DAT_002046bc - 2;   /* no free static slot */
    snapshot_take(&before);
    op_place(0xc2, px, py, 2, 2);
    int refused = g_status && strstr(g_status, "no free") != NULL;
    snapshot_take(&after);
    DAT_0020469c = saved_free;
    if (!refused || memcmp(&before, &after, sizeof before) != 0) { fprintf(stderr, "[editor] selftest FAILED: placing with a full free list\n"); abort(); }
    g_selftest_checks += 5;
  }

  /* leave the level as the test found it: undo everything */
  while (g_undo_count) uw_editor_undo();
  fprintf(stderr, "[editor] selftest: ok, %d checks\n", g_selftest_checks);
}

/* Play from here: write the level into the working copy, copy that over the save slot's archive, leave the editor and drop
   the player where the camera is, facing the way it faces. (The current game and character, not a new one.) */
void uw_editor_play(void)
{
  if (!g_active) return;
  int x, y, z;
  camera(&x, &y, &z);
  int tx = x >> 8, ty = y >> 8;
  if (!tile_is_open(tx, ty)) { g_status = "move the camera over open floor"; return; }
  double floor_z = ((const uw_tile_t *)tilemap_lookup((short)tx, (short)ty))->floor_height * 64.0;
  double yaw = (ushort)DAT_0023bf00 * (360.0 / 65536.0), pitch = DAT_0023beb4 / 256.0;
  g_status = NULL;
  if (!commit_to_work()) return;   /* it said why it could not */
  /* the game plays from the save slot, so it gets the working copy, every level as authored so far; the master is not touched */
  if (!uw_file_copy(g_work_ark, g_save0_ark)) { g_status = "could not copy EDITOR\\LEV.ARK to SAVE0"; return; }
  uw_editor_set(0);
  demo_set_player_pos(x / 256.0, y / 256.0, floor_z, yaw, pitch);
  full_dungeon_redraw();
  set_pending_update_flags(0x7ffe);
  fprintf(stderr, "[editor] playing from (%.2f,%.2f) of level %d\n", x / 256.0, y / 256.0, DAT_00201b68);
}

/* ---- the Escape menu ---- */

/* Escape opens a small popup over the editor: Save, Revert, Change level, Play, Exit. Revert always asks; Change level,
   Play and Exit ask Save / Discard / Cancel when there are unsaved edits. While it is open it takes all the input. The
   selection, the brush and the Mv slot are kept. */
enum { MENU_NONE, MENU_MAIN, MENU_LEVELS, MENU_CONFIRM };
enum { ACT_NONE, ACT_REVERT, ACT_LEVEL, ACT_PLAY, ACT_EXIT, ACT_STARBURST };   /* the starburst asks Save, Discard or Exit */
static int g_menu = MENU_NONE, g_menu_sel;
static int g_menu_action = ACT_NONE, g_menu_arg;   /* what a confirm is for */
static const ed_rect_t R_MENU = { 70, 50, 250, 150 };
#define MENU_ROW 11
#define MENU_LEVELS_COUNT 9

static int menu_open(void) { return g_menu != MENU_NONE; }

/* the first open tile found by spiralling out from the middle of the map (a new level needs somewhere to stand) */
static int find_open_tile(int *ox, int *oy)
{
  for (int r = 0; r < 64; r++)
    for (int dy = -r; dy <= r; dy++)
      for (int dx = -r; dx <= r; dx++) {
        if (r && dx > -r && dx < r && dy > -r && dy < r) continue;
        if (tile_is_open(32 + dx, 32 + dy)) { *ox = 32 + dx; *oy = 32 + dy; return 1; }
      }
  return 0;
}

/* Load another level from the master archive. The player is put on an open tile and the camera over it. */
static void change_level(int n)
{
  int ox, oy;
  if (n < 1 || n > MENU_LEVELS_COUNT || n == DAT_00201b68) return;
  if (!load_level_from_archive(n, g_work_ark)) { g_status = "could not load that level"; return; }
  DAT_00201b68 = (short)n;   /* the level load restores the old number from the player record */
  if (!find_open_tile(&ox, &oy)) { ox = 32; oy = 32; }
  set_player_tile_position((uint)ox, (uint)oy, 1);
  {
    const uw_tile_t *t = (const uw_tile_t *)tilemap_lookup((short)ox, (short)oy);
    DAT_0023be90 = (short)(ox * 256 + 128);
    DAT_0023be92 = (short)(oy * 256 + 128);
    DAT_0023be94 = (short)((t->floor_height * 8 + 0x16) * 8);
  }
  g_sel_slot = 0; g_sel_link = NULL; g_held_slot = 0;
  g_undo_count = g_redo_count = 0;
  g_dirty = 0;
  g_map_pan_x = g_map_pan_y = 0;
  select_tile(ox, oy);
  full_dungeon_redraw();
  set_pending_update_flags(0x7ffe);
  dirty_rect_union(0, 200, 0, 0x140);
  fprintf(stderr, "[editor] now editing level %d\n", n);
}

static void do_action(int action, int arg)
{
  g_menu = MENU_NONE;
  switch (action) {
    case ACT_REVERT: if (reload_level(1)) { g_status = "reverted"; } else g_status = "could not load LEV.ARK"; break;
    case ACT_LEVEL: change_level(arg); break;
    case ACT_PLAY: uw_editor_play(); break;
    case ACT_EXIT: uw_editor_set(0); break;
    default: break;
  }
}

/* Run an action that leaves the level behind, asking first if there are unsaved edits. (Play never asks: it writes the level into the
   EDITOR working copy itself, which is not a save of the master.) */
static void guarded(int action, int arg)
{
  if (action == ACT_REVERT || g_dirty) {
    g_menu = MENU_CONFIRM; g_menu_sel = 0; g_menu_action = action; g_menu_arg = arg;
  }
  else do_action(action, arg);
}

static void menu_choose(int item)
{
  if (g_menu == MENU_MAIN) {
    switch (item) {
      case 0: g_menu = MENU_NONE; uw_editor_save(); break;
      case 1: guarded(ACT_REVERT, 0); break;
      case 2: g_menu = MENU_LEVELS; g_menu_sel = DAT_00201b68 - 1; break;
      case 3: do_action(ACT_PLAY, 0); break;
      case 4: guarded(ACT_EXIT, 0); break;
      default: g_menu = MENU_NONE; break;
    }
  }
  else if (g_menu == MENU_LEVELS) {
    if (item >= 0 && item < MENU_LEVELS_COUNT) guarded(ACT_LEVEL, item + 1);
    else g_menu = MENU_MAIN;
  }
  else if (g_menu == MENU_CONFIRM) {
    int action = g_menu_action, arg = g_menu_arg;
    if (action == ACT_STARBURST) {   /* Save (stay) / Discard (reload from the master, stay) / Exit (leave; the working copy is kept) */
      g_menu = MENU_NONE;
      if (item == 0) uw_editor_save();
      else if (item == 1) g_status = reload_level(1) ? "edits discarded" : "could not load LEV.ARK";
      else uw_editor_set(0);
    }
    else if (action == ACT_REVERT) {   /* Revert / Cancel */
      if (item == 0) do_action(action, arg); else g_menu = MENU_NONE;
    }
    else if (item == 0) {   /* Save, then carry on */
      uw_editor_save();
      if (!g_dirty) do_action(action, arg); else g_menu = MENU_NONE;
    }
    else if (item == 1) {   /* Discard: back to the archive, then carry on */
      reload_level(1);
      do_action(action, arg);
    }
    else g_menu = MENU_NONE;
  }
}

static int menu_item_count(void)
{
  return g_menu == MENU_MAIN ? 6 : g_menu == MENU_LEVELS ? MENU_LEVELS_COUNT + 1 : g_menu_action == ACT_REVERT ? 2 : 3;
}

void uw_editor_escape(void)
{
  if (!g_active) return;
  if (g_menu == MENU_LEVELS) { g_menu = MENU_MAIN; return; }
  if (g_menu != MENU_NONE) { g_menu = MENU_NONE; return; }
  if (g_held_slot) { g_held_slot = 0; g_status = "cancelled"; return; }   /* a pending Move or Copy first */
  g_menu = MENU_MAIN;
  g_menu_sel = 0;
}

int uw_editor_menu_open(void) { return g_active && menu_open(); }

void uw_editor_menu_key(int sym)
{
  int n = menu_item_count();
  switch (sym) {
    case SDLK_UP: g_menu_sel = (g_menu_sel + n - 1) % n; break;
    case SDLK_DOWN: g_menu_sel = (g_menu_sel + 1) % n; break;
    case SDLK_RETURN: case SDLK_KP_ENTER: menu_choose(g_menu_sel); break;
    case SDLK_ESCAPE: uw_editor_escape(); break;
    default: break;
  }
}

/* Page Up and Page Down change level */
void uw_editor_page_level(int delta)
{
  if (!g_active || menu_open()) return;
  int n = DAT_00201b68 + delta;
  if (n >= 1 && n <= MENU_LEVELS_COUNT) guarded(ACT_LEVEL, n);
}

static void menu_click(int x, int y)
{
  int n = menu_item_count();
  int top = R_MENU.y0 + (g_menu == MENU_CONFIRM ? 30 : 14);
  if (!in_rect(&R_MENU, x, y)) { g_menu = MENU_NONE; return; }
  int row = (y - top) / MENU_ROW;
  if (y >= top && row < n) { g_menu_sel = row; menu_choose(row); }
}

static void draw_menu(void)
{
  static const char *const main_items[6] = { "Save", "Revert", "Change level", "Play", "Exit editor", "Close" };
  static const char *const revert_items[2] = { "Revert", "Cancel" };
  static const char *const dirty_items[3] = { "Save", "Discard", "Cancel" };
  static const char *const starburst_items[3] = { "Save", "Discard", "Exit" };
  char line[40];
  if (!menu_open()) return;
  fill(R_MENU.x0, R_MENU.y0, R_MENU.x1, R_MENU.y1, COL_BLACK);
  frame(R_MENU.x0, R_MENU.y0, R_MENU.x1, R_MENU.y1, COL_ORANGE);
  frame(R_MENU.x0 + 2, R_MENU.y0 + 2, R_MENU.x1 - 2, R_MENU.y1 - 2, COL_FRAME);
  int top = R_MENU.y0 + (g_menu == MENU_CONFIRM ? 30 : 14);
  if (g_menu == MENU_CONFIRM) {
    int sb = g_menu_action == ACT_STARBURST;
    text(g_menu_action == ACT_REVERT ? "Discard your edits and reload?" : sb ? (g_dirty ? "This level has unsaved edits." : "No unsaved edits.") : "This level has unsaved edits.", R_MENU.x0 + 8, R_MENU.y0 + 8, COL_TEXT);
    text(g_menu_action == ACT_REVERT ? "from the archive" : sb ? "Save, discard them, or exit?" : "Save them first?", R_MENU.x0 + 8, R_MENU.y0 + 17, COL_TEXT);
  }
  else text(g_menu == MENU_MAIN ? "Level editor" : "Change level", R_MENU.x0 + 8, R_MENU.y0 + 6, COL_TEXT);
  int n = menu_item_count();
  for (int i = 0; i < n; i++) {
    const char *label;
    if (g_menu == MENU_MAIN) label = main_items[i];
    else if (g_menu == MENU_LEVELS) {
      if (i < MENU_LEVELS_COUNT) { snprintf(line, sizeof line, "Level %d%s", i + 1, i + 1 == DAT_00201b68 ? "  (current)" : ""); label = line; }
      else label = "Back";
    }
    else label = g_menu_action == ACT_REVERT ? revert_items[i] : g_menu_action == ACT_STARBURST ? starburst_items[i] : dirty_items[i];
    int y = top + i * MENU_ROW;
    if (i == g_menu_sel) fill(R_MENU.x0 + 6, y - 1, R_MENU.x1 - 6, y + MENU_ROW - 2, RGB(24, 24, 88));
    text(label, R_MENU.x0 + 10, y, i == g_menu_sel ? COL_TEXT : COL_ORANGE);
  }
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
  g_map_pan_x = g_map_pan_y = 0;   /* the map follows the camera again */
  set_pending_update_flags(2);
}

/* With an object held (Move or Copy), Link on a selected container puts the held object into it (at the head of its contents). A creature
   cannot go into a container, nor a container into itself or into something it holds. */
static int contains_slot(const uw_object_hdr_t *o, int slot, int depth)
{
  if (!o || o->is_quant || !o->link || depth > 8) return 0;
  for (int s = o->link, n = 0; s && n < 1024; n++) {
    const uw_object_hdr_t *c = object_at(s);
    if (!c) break;
    if (s == slot || contains_slot(c, slot, depth + 1)) return 1;
    s = c->next;
  }
  return 0;
}

static void op_put_into(int container_slot)
{
  uw_object_hdr_t *box = object_at(container_slot), *src = object_at(g_held_slot);
  if (!box || !src) return;
  if ((box->object_id & 0x1f0) != 0x80 || box->is_quant) { g_status = "that is not a container"; return; }
  if (is_mobile(src) || slot_is_mobile(src)) { g_status = "a creature cannot go in a container"; return; }
  if (g_held_slot == container_slot || contains_slot(src, container_slot, 0)) { g_status = "not into itself"; return; }
  uw_object_hdr_t *placed = src;
  if (g_held_copy) {
    if (!have_free_slot(0)) { g_status = "no free object slots"; return; }
    checkpoint();
    placed = alloc_object_slot(0);
    if (!placed) { g_status = "no free object slots"; return; }
    memcpy(placed, src, sizeof(uw_object_hdr_t));
    placed->next = 0;
    if (!placed->is_quant) placed->link = 0;   /* shallow, as for a copy onto a tile */
  }
  else {
    ushort *link = find_link(g_held_slot);
    if (!link) { g_status = "lost the object"; g_held_slot = 0; return; }
    checkpoint();
    object_list_unlink(link, src);
  }
  object_list_insert_head(&box->link_word, placed);
  g_held_slot = 0;
  g_back_slot[0] = container_slot; g_back_link[0] = g_sel_link; g_back_depth = 1;
  g_sel_link = &box->link_word;
  g_sel_slot = encode_object_slot_index(placed);
  g_status = g_held_copy ? "copied into it" : "moved into it";
  uw_editor_validate();
}

/* Link steps into a container's contents (or a trigger's trap): remember where it came from, so Back can return. */
static void op_back(void)
{
  if (g_back_depth == 0) { g_status = "already at the top"; return; }
  g_back_depth--;
  g_sel_slot = g_back_slot[g_back_depth];
  g_sel_link = g_back_link[g_back_depth];
}

/* Replace with brush: change the selected object's type to the palette's brush. It never crosses between the static and the
   mobile objects (a creature needs a 27-byte slot), and a container holding things stays a container. */
static void op_replace(void)
{
  uw_object_hdr_t *o = object_at(g_sel_slot);
  int id = g_palette_brush;
  if (!o) { g_status = "nothing selected"; return; }
  if (is_player(o)) { g_status = "that is you"; return; }
  if (id == o->object_id) { g_status = "already that type"; return; }
  if (((id & 0x1c0) == 0x40) != ((o->object_id & 0x1c0) == 0x40) || (encode_object_slot_index(o) < 0x100) != ((id & 0x1c0) == 0x40)) {
    g_status = "static and mobile differ";
    return;
  }
  int quant = (g_object_type_props[id].flags & 0xc0) == 0 || (g_object_type_props[id].flags & 0xc0) == 0x80;
  if (!o->is_quant && o->link && (quant || ((id & 0x1f0) != 0x80 && (o->object_id & 0x1f0) == 0x80))) { g_status = "it holds things"; return; }
  checkpoint();
  o->object_id = (unsigned)id;
  if (quant && !o->is_quant) { o->is_quant = 1; o->link = 1; }
  else if (!quant && o->is_quant) { o->is_quant = 0; o->link = 0; }
  if (slot_is_mobile(o)) ((uw_mobile_object_t *)o)->npc_hp = g_monster_type_props[id & 0x3f].max_hp;
  set_pending_update_flags(2);
  g_status = "replaced";
}

static void button_pressed(int i)
{
  const uw_object_hdr_t *o = object_at(g_sel_slot);
  g_status = NULL;
  switch (i) {
    case 0:   /* Head: the head of the selected object's own list (a container's contents, remembering where from), else of the list you are in */
      if (o && !o->is_quant && o->link && g_back_depth < BACK_DEPTH) {
        g_back_slot[g_back_depth] = g_sel_slot;
        g_back_link[g_back_depth++] = g_sel_link;
        g_sel_link = &((uw_object_hdr_t *)o)->link_word;
        g_sel_slot = o->link;
      }
      else if (g_back_depth > 0) {
        uw_object_hdr_t *parent = object_at(g_back_slot[g_back_depth - 1]);
        if (parent) { g_sel_link = &parent->link_word; g_sel_slot = parent->link; }
      }
      else { g_sel_slot = tile_head(g_sel_tx, g_sel_ty); g_sel_link = tile_link(g_sel_tx, g_sel_ty); }
      break;
    case 1: if (o && o->next) { g_sel_link = &((uw_object_hdr_t *)o)->chain_word; g_sel_slot = o->next; } break;   /* Next: along the list you are in */
    case 2:   /* Link: link the held object (from Move or Copy) into the selected object's list, as a sword into a bag */
      if (g_held_slot && o) op_put_into(g_sel_slot);
      else g_status = g_held_slot ? "select a container" : "Move or Copy an object, then Link it into a container";
      break;
    case 3: op_back(); break;
    case 4: op_show(); break;
    case 5: op_pick_up(0); break;
    case 6: op_pick_up(1); break;
    case 7: op_replace(); break;
    default: op_delete(); break;
  }
}

void uw_editor_command(int back)
{
  if (!g_active || g_mode != M_OBJECT || g_tab >= 0) return;
  button_pressed(back ? 3 : 7);
}

/* Where a point of the 3D view looks at the floor. The point is in scene coordinates; the ray inverts the
   projection the renderer uses (x = cx + scale * eye_x / eye_z, y = cy - 0.9 * scale * eye_y / eye_z, see
   raster_textured_span), turns it by the camera's facing and pitch, and walks it over the tiles in steps of 1/32
   tile until it goes below a floor (the hit, refined by bisection) or into a solid tile or out of the map. The
   floors are taken as flat at their tile's height. World units are 1/256 of a tile, and a floor height step is 64. */
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
  if (g_target_mode && on_floor) { apply_target(tx, ty); return; }
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
  else {
    ed_hit_t hit;
    if (view_ray_hit(scene_x, scene_y, &hit) && hit.kind != HIT_CEILING) select_tile(hit.tx, hit.ty);   /* a floor or a wall: its tile */
    else g_status = "nothing there";
  }
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
  if (g_type_view && g_tab != TAB_ITEM && g_tab >= 0) { g_type_dummy.object_id = (unsigned)g_palette_brush; o = &g_type_dummy; }
  if (!o) return;
  if (g_tab >= 0) {
    int count = page_count(g_tab, o), shown, lo, hi;
    if (y < 129) return;
    if (x >= 79 && count > PAGE_ROWS) {   /* the scroll arrows */
      g_tab_scroll += y < 150 ? -1 : 1;
      return;
    }
    int row = g_tab_scroll + (y - 129) / PAGE_ROW_H;
    if (row >= count) return;
    if (g_tab == TAB_ITEM) {
      int n;
      if (item_fields(o, &n)[row].kind == K_SET_TARGET) { g_target_mode = !g_target_mode; g_status = g_target_mode ? "click the target tile" : NULL; return; }
    }
    int v = page_get(g_tab, row, o, &shown, &lo, &hi);
    if (!shown || hi <= lo) return;
    int delta = x < 44 ? -step : x >= 66 && x < 78 ? step : 0;
    if (delta) {
      if (g_tab != TAB_ITEM) step = button == SDL_BUTTON_RIGHT ? (hi > 255 ? 64 : 8) : 1, delta = delta < 0 ? -step : step;
      checkpoint();
      page_set(g_tab, row, o, clamp_int(v + delta, lo, hi));
    }
  }
  else if (x < 52 && y < 169) {
    checkpoint();
    o->xpos = (unsigned)clamp_int((x - 3) / 6, 0, 7);
    o->ypos = (unsigned)clamp_int(7 - (y - 128) / 5, 0, 7);
    set_pending_update_flags(2);
  }
  else if (x >= 53 && y < 145) {
    if (x >= 76) { checkpoint(); o->zpos = (unsigned)clamp_int((int)o->zpos + (y < 136 ? step : -step), 0, 127); set_pending_update_flags(2); }
  }
  else if (x >= 53 && y >= 146) {
    int dx = x - 68, dy = y - 160;
    if (dx * dx + dy * dy < 9) return;
    int h = (int)lround(atan2((double)dx, (double)-dy) / (M_PI / 4)) & 7;
    checkpoint();
    o->heading = (unsigned)h;
    if (slot_is_mobile(o)) {
      ((uw_mobile_object_t *)o)->full_heading = (unsigned char)(h * 32);
      ((uw_mobile_object_t *)o)->npc_heading = (unsigned)(h * 4);
    }
    set_pending_update_flags(2);
  }
}

/* ---- the modes ---- */

/* The mode column's eight buttons, top to bottom. Each mode has its own panels: what the bottom half of the screen shows, and what
   a click there does. The 3D view, the map and the mode column are shared. */

/* Object mode: the group bar and palette, the selected object's editor and its buttons. Returns nonzero if the click was theirs. */
static int object_mode_click(int x, int y, int button)
{
  if (in_rect(&R_STRIP, x, y)) {
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
      if (button == SDL_BUTTON_RIGHT && col >= 0 && col < PAL_COLS && row >= 0 && row < PAL_ROWS && n < g_groups[g_group].count) {
        g_palette_brush = g_groups[g_group].first + n;   /* type view: its Comm and Class pages, no object needed */
        g_type_view = 1;
        if (g_tab < 0 || g_tab == TAB_ITEM) g_tab = TAB_COMM;
        g_tab_scroll = 0;
        g_status = "type pages: edits every object of it";
      }
      else if (col >= 0 && col < PAL_COLS && row >= 0 && row < PAL_ROWS && n < g_groups[g_group].count) {
        int id = g_groups[g_group].first + n;
        /* the picked icon is armed for placing; picking the armed one again puts the brush away */
        g_brush_armed = !(g_brush_armed && id == g_palette_brush);
        g_palette_brush = id;
        g_status = g_brush_armed ? "left click a tile to place" : NULL;
      }
    }
  }
  else if (y >= 177 && y < 189 && x >= 2 && x < 93 && x != 64) {
    int i = x < 33 ? 0 : x < 64 ? 1 : 2;
    if (i < 3) { g_tab = g_tab == i ? -1 : i; g_tab_scroll = 0; }   /* a tab replaces the position view; again goes back */
  }
  else if (x >= 3 && x < 86 && y >= 128 && y < 177) {
    edit_click(x, y, button);
  }
  else if (x >= BUTTON_X && x < BUTTON_X + 36 && y >= BUTTON_Y && y < BUTTON_Y + SHOWN_BUTTONS * BUTTON_H) {
    button_pressed(g_shown_button[(y - BUTTON_Y) / BUTTON_H]);
  }
  else return 0;
  return 1;
}

static void draw_object_mode(void)
{
  draw_strip_pane();
  draw_object_palette();
  draw_object_editor();
}

/* A mode whose panels are not built yet: its name, where they go. */
static void draw_mode_placeholder(void)
{
  char line[48];
  frame(0, 126, 150, 190, COL_FRAME);
  frame(174, 119, 320, 190, COL_FRAME);
  snprintf(line, sizeof line, "%s mode", g_mode_names[g_mode]);
  text(line, 8, 132, COL_TEXT);
  text("not built yet", 8, 142, COL_FRAME);
}

static void draw_mode(void)
{
  switch (g_mode) {
    case M_OBJECT: draw_object_mode(); break;
    case M_TILE: draw_tile_mode(); break;
    case M_TEXTURE: draw_texture_mode(); break;
    case M_FILL: draw_fill_mode(); break;
    case M_FIND: draw_find_mode(); break;
    case M_VIEW: draw_view_mode(); break;
    case M_CUTCOPY: draw_cutcopy(); break;
    case M_PASTE: draw_paste(); break;
    default: draw_mode_placeholder(); break;
  }
}

static int mode_click(int x, int y, int button)
{
  switch (g_mode) {
    case M_OBJECT: return object_mode_click(x, y, button);
    case M_TILE: return tile_mode_click(x, y, button);
    case M_TEXTURE: return texture_mode_click(x, y, button);
    case M_FILL: return fill_mode_click(x, y, button);
    case M_FIND: return find_mode_click(x, y, button);
    case M_VIEW: return view_mode_click(x, y, button);
    case M_CUTCOPY: return cutcopy_click(x, y, button);
    default: return 0;
  }
}

void uw_editor_mouse_motion(int x, int y)
{
  if (g_cc_dragging || g_mode == M_PASTE) {
    int tx = -1, ty = -1;
    if (in_rect(&R_MAP, x, y) && map_tile_at(x, y, &tx, &ty) && tile_at(tx, ty)) {
      if (g_cc_dragging) { g_cc_x1 = tx; g_cc_y1 = ty; }
      g_paste_hover_x = tx; g_paste_hover_y = ty;
    }
  }
  if (g_mode == M_FILL) {   /* the preview of the fill under the pointer */
    int fx = -1, fy = -1;
    if (in_rect(&R_MAP, x, y)) map_tile_at(x, y, &fx, &fy);
    else if (in_rect(&R_VIEW, x, y)) {
      ed_hit_t hit;
      int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0, sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
      if (view_ray_hit(sx0 + (x - R_VIEW.x0) * sw / w, (y - R_VIEW.y0) * ED_H / h, &hit) && hit.kind != HIT_CEILING) { fx = hit.tx; fy = hit.ty; }
    }
    if (fx >= 0 && tile_at(fx, fy)) fill_mode_hover(fx, fy);
  }
  if (g_stroke || g_tex_stroke) {   /* painting: the tile under the pointer, on the map or on the 3D view */
    int tx = -1, ty = -1, kind = -1;
    if (in_rect(&R_MAP, x, y)) map_tile_at(x, y, &tx, &ty);
    else if (in_rect(&R_VIEW, x, y)) {
      ed_hit_t hit;
      int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0, sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
      if (view_ray_hit(sx0 + (x - R_VIEW.x0) * sw / w, (y - R_VIEW.y0) * ED_H / h, &hit) && hit.kind != HIT_CEILING) { tx = hit.tx; ty = hit.ty; kind = hit.kind; }
    }
    if (tx >= 0 && g_stroke) tile_mode_drag(tx, ty);
    if (tx >= 0 && g_tex_stroke) texture_mode_drag(tx, ty, kind);
  }
  if (!g_map_dragging) return;
  g_map_pan_x += x - g_map_drag_x;
  g_map_pan_y += y - g_map_drag_y;
  g_map_drag_x = x;
  g_map_drag_y = y;
}

void uw_editor_mouse_up(int x, int y, int button)
{
  (void)x; (void)y;
  if (button == SDL_BUTTON_RIGHT) g_map_dragging = 0;
  if (button == SDL_BUTTON_LEFT && g_stroke) tile_mode_release();
  if (button == SDL_BUTTON_LEFT && g_tex_stroke) texture_mode_release();
  if (button == SDL_BUTTON_LEFT && g_fill_rect) fill_mode_release();
  if (button == SDL_BUTTON_LEFT && g_cc_dragging) g_cc_dragging = 0;
}

void uw_editor_click(int x, int y, int button)
{
  if (menu_open()) { if (button == SDL_BUTTON_LEFT) menu_click(x, y); return; }
  int tx, ty;
  g_status = NULL;
  if (in_rect(&R_VIEW, x, y)) {
    if (g_mode == M_FILL) {   /* fill from the floor or wall under the click */
      ed_hit_t hit;
      int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0, sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
      if (view_ray_hit(sx0 + (x - R_VIEW.x0) * sw / w, (y - R_VIEW.y0) * ED_H / h, &hit) && hit.kind != HIT_CEILING) fill_mode_press(hit.tx, hit.ty);
    }
    else if (g_mode == M_TEXTURE) {   /* paint the floor or the wall face under the click */
      ed_hit_t hit;
      int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0, sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
      if (view_ray_hit(sx0 + (x - R_VIEW.x0) * sw / w, (y - R_VIEW.y0) * ED_H / h, &hit) && hit.kind != HIT_CEILING) texture_mode_press(hit.tx, hit.ty, hit.kind);
    }
    else if (g_mode == M_TILE) {   /* paint the floor or wall under the click */
      ed_hit_t hit;
      int w = R_VIEW.x1 - R_VIEW.x0, h = R_VIEW.y1 - R_VIEW.y0, sw = ED_H * w / h, sx0 = (ED_W - sw) / 2;
      if (view_ray_hit(sx0 + (x - R_VIEW.x0) * sw / w, (y - R_VIEW.y0) * ED_H / h, &hit) && hit.kind != HIT_CEILING) tile_mode_press(hit.tx, hit.ty);
    }
    else pick_in_view(x, y);
  }
  else if (in_rect(&R_MAP, x, y)) {
    if (button == SDL_BUTTON_RIGHT) {
      g_map_dragging = 1;   /* a right drag pans the map; a right click does nothing else */
      g_map_drag_x = x;
      g_map_drag_y = y;
    }
    else if (g_mode == M_TILE) {
      if (map_tile_at(x, y, &tx, &ty)) tile_mode_press(tx, ty);
    }
    else if (g_mode == M_TEXTURE) {
      if (map_tile_at(x, y, &tx, &ty)) texture_mode_press(tx, ty, -1);
    }
    else if (g_mode == M_FILL) {
      if (map_tile_at(x, y, &tx, &ty)) fill_mode_press(tx, ty);
    }
    else if (g_mode == M_CUTCOPY) {
      if (map_tile_at(x, y, &tx, &ty)) cc_press(tx, ty);
    }
    else if (g_mode == M_PASTE) {
      if (map_tile_at(x, y, &tx, &ty)) paste_at(tx, ty);
    }
    else if (map_tile_at(x, y, &tx, &ty)) {
      if (apply_target(tx, ty)) ;
      else if (g_held_slot) op_put_down(tx, ty, g_map_click_sub_x, g_map_click_sub_y);
      else if (g_brush_armed) op_place(g_palette_brush, tx, ty, g_map_click_sub_x, g_map_click_sub_y);
      else select_tile(tx, ty);
    }
  }
  else if (in_rect(&R_PALETTE, x, y) && y >= 175 && x >= 156 && x < 172) {
    do_action(ACT_PLAY, 0);   /* the orange button below the modes: play from the camera */
  }
  else if (in_rect(&R_PALETTE, x, y) && y < 25) {
    g_menu = MENU_CONFIRM; g_menu_sel = 0; g_menu_action = ACT_STARBURST; g_menu_arg = 0;   /* the starburst: Save, Discard or Exit */
  }
  else if (in_rect(&R_PALETTE, x, y)) {
    int i = (y - 26) / 16;
    if (y >= 26 && i < MODE_COUNT && x >= 156 && x < 172) {
      g_mode = g_button_mode[i];
      g_brush_armed = 0; g_target_mode = 0;
      g_status = g_mode_names[g_mode];
    }
  }
  else mode_click(x, y, button);
}

/* The mouse wheel over the group bar or the palette scrolls it. */
void uw_editor_wheel(int x, int y, int dy)
{
  if (in_rect(&R_STRIP, x, y)) g_group_scroll -= dy;
  else if (in_rect(&R_OBJPAL, x, y)) g_palette_scroll -= dy;
  clamp_scrolls();
}

/* The free camera, with the game's own keys: W or up runs forward, S walks forward slowly, X or down goes back, A or left
   and D or right turn, Z and C sidestep (the game's mouselook swaps the two pairs, but the editor has no mouselook), and
   Q and E change height. */
#define FLY_RUN 14
#define FLY_WALK 5
#define FLY_TURN 0x180
#define FLY_LIFT 6

/* Like the game's Far Sight (move_custom_view_target), the camera flies through walls and only stays on the map. Inside
   a wall the view draws nothing (the visibility pass starts from the camera's tile), as in Far Sight. */
static void try_move(int dx, int dy)
{
  int nx = DAT_0023be90 + dx, ny = DAT_0023be92 + dy;
  DAT_0023be90 = (short)(nx < 0x180 ? 0x180 : nx > 0x3d80 ? 0x3d80 : nx);
  DAT_0023be92 = (short)(ny < 0x180 ? 0x180 : ny > 0x3d80 ? 0x3d80 : ny);
}

void uw_editor_tick(void)
{
  if (!g_active || DAT_00201b64 != 0 || DAT_0023b82c != 0 || dbgui_visible()) return;   /* typing in the console is not flying */
#define KEY(sc) uw_scancode_held(sc)
  int run = KEY(SDL_SCANCODE_W) || KEY(SDL_SCANCODE_UP), walk = KEY(SDL_SCANCODE_S);
  int back = KEY(SDL_SCANCODE_X) || KEY(SDL_SCANCODE_DOWN);
  int turn = (KEY(SDL_SCANCODE_D) || KEY(SDL_SCANCODE_RIGHT)) - (KEY(SDL_SCANCODE_A) || KEY(SDL_SCANCODE_LEFT));
  int strafe = KEY(SDL_SCANCODE_C) - KEY(SDL_SCANCODE_Z);
  int lift = KEY(SDL_SCANCODE_E) - KEY(SDL_SCANCODE_Q);
#undef KEY
  int speed = run ? FLY_RUN : walk ? FLY_WALK : 0;   /* units of 1/256 tile per frame */
  int fwd = run || walk ? 1 : back ? -1 : 0;
  if (back && !run && !walk) speed = FLY_WALK * 2;
  if (!fwd && !strafe && !turn && !lift) return;
  short sn, cs;
  DAT_0023bf00 = (ushort)(DAT_0023bf00 + turn * FLY_TURN);
  angle_to_screen_delta((ushort)DAT_0023bf00, &sn, &cs);
  /* sine and cosine are 1.15 fixed point; the facing is (sine, cosine) in (x, y), and its right is (cosine, -sine) */
  int step = fwd * speed, side = strafe * FLY_WALK;
  try_move((sn * step + cs * side) / 32768, (cs * step - sn * side) / 32768);
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
    /* reload the level from the master archive first: the editor never edits play-session state */
    if (!reload_level(0)) g_status = "could not load LEV.ARK";
    /* detach the view from the player: Far Sight's free camera (DAT_0023b82c == 0), seeded at the player */
    int x, y, z;
    camera(&x, &y, &z);
    DAT_0023be90 = (short)x; DAT_0023be92 = (short)y; DAT_0023be94 = (short)(z + 0x16 * 8);
    DAT_0023bf00 = (ushort)((((const uw_object_hdr_t *)g_player_object)->position_word & 0xff80) * 0x40
                            + (((const uw_mobile_object_t *)g_player_object)->heading_flags & 0x1f) * 0x100);
    DAT_0023bf02 = DAT_0023bf04 = 0;
    DAT_0023b82c = 0;
    /* Far Sight's mode: the view is lit at the Far Sight light level whatever the player carries (the effects refresh
       applies it, the same debug flag the FARSIGHT demo command holds) */
    g_prev_farsight = g_debug_farsight;
    g_debug_farsight = 1;
    refresh_player_equipment_effects();
    g_map_pan_x = g_map_pan_y = 0;
    select_tile(x >> 8, y >> 8);
    g_entered_fullscreen = !g_view_fullscreen;
    if (g_entered_fullscreen) uw_toggle_fullscreen_view(0);
  }
  else {
    DAT_0023b82c = (char *)g_player_object;
    g_debug_farsight = g_prev_farsight;
    refresh_player_equipment_effects();
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
  if (g_active) { if (!menu_open()) guarded(ACT_EXIT, 0); }   /* ask first if there are unsaved edits */
  else uw_editor_set(1);
}

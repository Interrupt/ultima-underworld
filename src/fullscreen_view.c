/* Fullscreen 3D view (toggled with G; not in the original). Like System Shock's fullscreen mode, the
   dungeon view fills the width of the screen down to the message scroll, which stays; the right-hand
   inventory / rune / skills panel is drawn over the scene only while it is shown.

   The 3D and pick passes already draw in screen coordinates into screen-sized buffers, so the view
   itself only changes its rect and projection (see g_view_fullscreen in 3d.c). The game keeps
   drawing the HUD into its own framebuffer as usual; the 3D pass is pointed at a separate scene
   buffer, and the two are combined when the frame is presented (uw_fullscreen_compose). */
#include "headers/fullscreen_view.h"
#include "headers/uw.h"
#include "headers/options.h"
#include "headers/debug_ui.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern short DAT_00201b64;   /* game mode; 0 == in-game 3D dungeon view */

#define FS_W 320
#define FS_H 200

/* HUD areas kept visible over the scene: left, top, right (exclusive), bottom (exclusive), and whether
   the black of the HUD image around the art lets the scene show through. */
static const int g_overlay_rects[][5] = {
  { 236, 7, 320, 121, 1 },    /* inventory / rune / skills panel */
  { 0, 169, 320, 200, 0 },    /* message scroll, below the dragons' claws, on its black backdrop */
};
#define OVERLAY_COUNT ((int)(sizeof g_overlay_rects / sizeof g_overlay_rects[0]))
#define PANEL_OVERLAY 0

/* The panel is hidden until the player shows it (I, R or V), and stays up while an item is held so it
   can be dropped onto it. */
static int g_panel_shown;

static int overlay_visible(int i)
{
  return i != PANEL_OVERLAY || g_panel_shown || g_selected_object != 0;
}

int uw_fullscreen_panel_visible(void)
{
  return overlay_visible(PANEL_OVERLAY);
}

void uw_fullscreen_show_panel(void)
{
  if (g_view_fullscreen) g_panel_shown = 1;
}

void uw_fullscreen_toggle_panel(int unused)
{
  (void)unused;
  if (g_view_fullscreen && DAT_00201b64 == 0) g_panel_shown = !g_panel_shown;
}

/* The health and mana bars stand side by side at the right edge above the message scroll; the selected runes
   and the charge gem are drawn by uw_draw_fullscreen_hud_sprites (hud.c). */
#define BAR_WIDTH 3
#define BAR_GAP 1
#define BAR_RIGHT_MARGIN 2
#define BAR_HEIGHT 30
#define BAR_BOTTOM_GAP 2   /* between the bars and the top of the message scroll */
#define RGB565(r, g, b) ((unsigned short)((((r) >> 3) << 11) | (((g) >> 2) << 5) | ((b) >> 3)))

static unsigned short *g_scene;
static void *g_hud_saved_framebuffer;

int uw_fullscreen_scene_begin(void)
{
  if (!g_view_fullscreen) return 0;
  if (!g_scene) {
    g_scene = calloc(1, 0x25800);   /* same size as the game's framebuffer */
    if (!g_scene) return 0;
  }
  g_hud_saved_framebuffer = g_uw_framebuffer;
  g_uw_framebuffer = g_scene;
  return 1;
}

void uw_fullscreen_scene_end(void)
{
  g_uw_framebuffer = g_hud_saved_framebuffer;
}

/* Which pixels of an overlay rect show the scene through: the black the HUD image has around (or, while a
   panel wipes, inside) the art. They are found by flooding inward from the rect's edge over pure black, so
   black inside the art is kept. */
#define MAX_OVERLAY_PIXELS (FS_W * 64)

static void overlay_transparency(const unsigned short *hud, const int *r, unsigned char *clear)
{
  int w = r[2] - r[0], h = r[3] - r[1];
  static int stack[MAX_OVERLAY_PIXELS];
  int sp = 0;
  memset(clear, 0, (size_t)w * h);
#define SEED(px, py) do { int i_ = (py) * w + (px); \
    if (!clear[i_] && hud[(r[1] + (py)) * FS_W + r[0] + (px)] == 0) { clear[i_] = 1; stack[sp++] = i_; } } while (0)
  for (int x = 0; x < w; x++) { SEED(x, 0); SEED(x, h - 1); }
  for (int y = 0; y < h; y++) { SEED(0, y); SEED(w - 1, y); }
  while (sp) {
    int i = stack[--sp], x = i % w, y = i / w;
    if (x > 0) SEED(x - 1, y);
    if (x < w - 1) SEED(x + 1, y);
    if (y > 0) SEED(x, y - 1);
    if (y < h - 1) SEED(x, y + 1);
  }
#undef SEED
}

/* One bar: black background, the colour filling `fraction` of it from the bottom. */
static void draw_vital_bar(unsigned short *display, int x, int fraction_num, int fraction_den, unsigned short colour)
{
  int bottom = UW_FULLSCREEN_VIEW_HEIGHT + 1 - BAR_BOTTOM_GAP;   /* exclusive; the scroll starts at VIEW_HEIGHT + 1 */
  int top = bottom - BAR_HEIGHT;
  int filled = fraction_den > 0 ? (fraction_num * BAR_HEIGHT + fraction_den / 2) / fraction_den : 0;
  if (filled < 0) filled = 0;
  if (filled > BAR_HEIGHT) filled = BAR_HEIGHT;
  for (int y = top; y < bottom; y++)
    for (int dx = 0; dx < BAR_WIDTH; dx++)
      display[y * FS_W + x + dx] = (y >= bottom - filled) ? colour : 0;
}

static void draw_vitals_and_runes(unsigned short *display)
{
  int mana_x = FS_W - BAR_RIGHT_MARGIN - BAR_WIDTH, health_x = mana_x - BAR_GAP - BAR_WIDTH;
  uw_draw_fullscreen_hud_sprites(display, UW_FULLSCREEN_VIEW_HEIGHT);
  if (g_player_object && DAT_0023be74 && DAT_00086df8) {
    /* poisoned (the same test that picks the poisoned flask): the health bar turns green */
    int poisoned = (*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) != 0;
    draw_vital_bar(display, health_x, g_player_object->npc_hp, *(byte *)(DAT_0023be74 + 4),
                   poisoned ? RGB565(60, 200, 60) : RGB565(220, 40, 40));
    draw_vital_bar(display, mana_x, *(byte *)(DAT_00086df8 + 0x37), *(byte *)(DAT_00086df8 + 0x38), RGB565(60, 90, 235));
  }
}

int uw_fullscreen_compose(unsigned short *display)
{
  const unsigned short *hud = (const unsigned short *)g_uw_framebuffer;
  static unsigned char clear[MAX_OVERLAY_PIXELS];
  if (!g_view_fullscreen || !g_scene || !hud || DAT_00201b64 != 0) return 0;
  memcpy(display, g_scene, (size_t)FS_W * FS_H * sizeof *display);
  /* a one pixel black border between the scene and the message scroll */
  memset(display + UW_FULLSCREEN_VIEW_HEIGHT * FS_W, 0, (size_t)FS_W * sizeof *display);
  for (int i = 0; i < OVERLAY_COUNT; i++) {
    const int *r = g_overlay_rects[i];
    int w = r[2] - r[0];
    if (!overlay_visible(i) || w * (r[3] - r[1]) > MAX_OVERLAY_PIXELS) continue;
    if (r[4]) overlay_transparency(hud, r, clear);
    else memset(clear, 0, (size_t)w * (r[3] - r[1]));
    for (int y = r[1]; y < r[3]; y++)
      for (int x = r[0]; x < r[2]; x++)
        if (!clear[(y - r[1]) * w + (x - r[0])]) display[y * FS_W + x] = hud[y * FS_W + x];
  }
  draw_vitals_and_runes(display);
  {
    /* the debug panel or console stays on top */
    int x0, y0, x1, y1;
    if (dbgui_overlay_rect(&x0, &y0, &x1, &y1)) {
      if (x0 < 0) x0 = 0;
      if (y0 < 0) y0 = 0;
      if (x1 > FS_W) x1 = FS_W;
      if (y1 > FS_H) y1 = FS_H;
      for (int y = y0; y < y1; y++)
        if (x1 > x0) memcpy(display + y * FS_W + x0, hud + y * FS_W + x0, (size_t)(x1 - x0) * sizeof *display);
    }
  }
  return 1;
}

int uw_point_in_game_view(int x, int y)
{
  if (x < DAT_0023be5c || x >= DAT_0023be5c + DAT_0023bd80 ||
      y < (short)(DAT_0023be80 - DAT_0023be88) || y >= DAT_0023be80) return 0;
  return !(g_view_fullscreen && uw_fullscreen_in_overlay(x, y));
}

int uw_fullscreen_in_overlay(int x, int y)
{
  int dx0, dy0, dx1, dy1;
  if (dbgui_overlay_rect(&dx0, &dy0, &dx1, &dy1) && x >= dx0 && x < dx1 && y >= dy0 && y < dy1) return 1;
  for (int i = 0; i < OVERLAY_COUNT; i++) {
    const int *r = g_overlay_rects[i];
    if (overlay_visible(i) && x >= r[0] && x < r[2] && y >= r[1] && y < r[3]) return 1;
  }
  return 0;
}

void uw_toggle_fullscreen_view(int unused)
{
  (void)unused;
  if (DAT_00201b64 != 0) return;

  decrement_cursor_hide_depth();
  g_view_fullscreen = !g_view_fullscreen;
  g_panel_shown = 0;
  unregister_game_view_interact_zones();
  configure_dungeon_viewport(0x34,0x14,0xab,0x70);   /* the fullscreen rect while it is on */
  if (g_view_fullscreen) {
    dirty_rect_union(0,200,0,0x140);
    set_pending_update_flags(2);
  }
  else {
    /* The HUD image in the game's framebuffer was never drawn over (the scene had its own buffer), so only
       the 3D view needs redrawing. Re-running enter_dungeon_view_hud_init here would register the stats
       panel's click regions again on every toggle and eventually fill the click-region table. */
    dirty_rect_union(0,200,0,0x140);
    set_pending_update_flags(0x7dfe);
    full_dungeon_redraw();
    weapon_overlay_and_full_redraw();
  }
  cursor_show_idle_tick();
  fprintf(stderr, "[fullscreen] %s\n", g_view_fullscreen ? "on" : "off");
}

/* Fullscreen 3D view (toggled with G; not in the original). Like System Shock's fullscreen mode, the
   HUD is hidden and the dungeon view fills the whole 320x200 screen. The 3D and pick passes already
   draw in screen coordinates into screen-sized buffers, so this only changes the view's rect and
   projection (see g_view_fullscreen in 3d.c) and keeps the HUD's draw handlers off the screen. */
#include "headers/fullscreen_view.h"
#include "headers/uw.h"
#include "headers/options.h"

#include <stdio.h>
#include <stdlib.h>

extern short DAT_00201b64;   /* game mode; 0 == in-game 3D dungeon view */

static void *g_hud_sink;
static void *g_hud_saved_framebuffer;

int uw_fullscreen_hud_sink_begin(void)
{
  if (!g_view_fullscreen) return 0;
  if (!g_hud_sink) {
    g_hud_sink = calloc(1, 0x25800);   /* same size as the real framebuffer */
    if (!g_hud_sink) return 0;
  }
  g_hud_saved_framebuffer = g_uw_framebuffer;
  g_uw_framebuffer = g_hud_sink;
  return 1;
}

void uw_fullscreen_hud_sink_end(void)
{
  g_uw_framebuffer = g_hud_saved_framebuffer;
}

void uw_toggle_fullscreen_view(int unused)
{
  (void)unused;
  if (DAT_00201b64 != 0) return;

  decrement_cursor_hide_depth();
  g_view_fullscreen = !g_view_fullscreen;
  unregister_game_view_interact_zones();
  if (g_view_fullscreen) {
    configure_dungeon_viewport(0x34,0x14,0xab,0x70);   /* replaced by the full-screen rect */
    dirty_rect_union(0,200,0,0x140);
    set_pending_update_flags(2);
  }
  else {
    configure_dungeon_viewport(0x34,0x14,0xab,0x70);
    draw_dungeon_hud_backdrop();
    enter_dungeon_view_hud_init();
    set_pending_update_flags(0x7dfe);
    refresh_player_equipment_effects();
    full_dungeon_redraw();
    weapon_overlay_and_full_redraw();
  }
  cursor_show_idle_tick();
  fprintf(stderr, "[fullscreen] %s\n", g_view_fullscreen ? "on" : "off");
}

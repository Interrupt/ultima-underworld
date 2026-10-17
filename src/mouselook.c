/* Mouselook (toggled with F, see uw_toggle_mouselook). While active the real pointer is captured
   (SDL relative mode): its motion turns/pitches the player's view directly, and the game's own
   software cursor stays pinned to the middle of the 3D viewport -- where the registered hotspot
   map has no walk arrow, so it shows the default 'X' -- so clicks, E (use/get) and Q (look) all act
   on whatever is under the crosshair. */
#include <SDL.h>
#include "headers/mouselook.h"
#include "headers/gx_stub.h"
#include "headers/options.h"
#include "headers/uw.h"
#include "headers/debug_ui.h"
#include "headers/player.h"

#include <math.h>
#include <stdio.h>

extern short g_mode_handler_row;                                            /* mode handler row; 0 == in-game 3D dungeon view */
extern short DAT_0023beb4;                                            /* view pitch, 1/256 deg; negative looks up */
extern int g_text_input_active;                                       /* a text-entry prompt is reading keys */
extern short DAT_0023be5c, DAT_0023bd80, DAT_0023be80, DAT_0023be88;  /* 3D viewport x, width, bottom y, height */
extern short DAT_00201c70;                                            /* player yaw, 65536 = 360 deg */

static int g_mouselook_enabled = 0;   /* the player's F toggle */
static int g_mouselook_applied = 0;   /* toggle AND the game is in a state where it makes sense */

/* Maximum view pitch in 1/256-degree units (--look-pitch-limit degrees; the original's was 24; default 45). */
int uw_look_pitch_limit(void) {
    float deg = g_opts.look_pitch_limit;
    if (deg < 1.0f) deg = 1.0f;
    if (deg > 89.0f) deg = 89.0f;
    return (int)(deg * 256.0f);
}

int uw_mouselook_active(void) { return g_mouselook_applied; }

void uw_toggle_mouselook(int unused) {
    (void)unused;
    /* The software cursor is what shows the crosshair and receives clicks; the stylus-style
       cursor (--always-show-cursor=0) has no persistent position to pin. */
    if (!uw_always_show_cursor()) return;
    g_mouselook_enabled = !g_mouselook_enabled;
    fprintf(stderr, "[mouselook] %s\n", g_mouselook_enabled ? "on" : "off");
}

/* Centre of the 3D viewport in game (landscape) coordinates; 0 if it isn't registered yet. */
int uw_mouselook_center(int *cx, int *cy) {
    if (DAT_0023bd80 <= 0 || DAT_0023be88 <= 0) return 0;
    *cx = DAT_0023be5c + DAT_0023bd80 / 2;
    *cy = DAT_0023be80 - DAT_0023be88 / 2;
    return 1;
}

/* Called every pump: capture/release the pointer as the toggle and the game state dictate. Only the
   interactive 3D view (no menu, text prompt, or debug UI, window focused) gets mouselook; anywhere
   else the pointer is free so the HUD, inventory and menus stay clickable. */
void uw_mouselook_refresh(void) {
    SDL_Window *win = uw_gx_window();
    SDL_Renderer *ren = uw_gx_renderer();
    int cx, cy;
    int want = g_mouselook_enabled && win && g_mode_handler_row == 0 && !g_text_input_active &&
               !dbgui_visible() && (SDL_GetWindowFlags(win) & SDL_WINDOW_INPUT_FOCUS) &&
               uw_mouselook_center(&cx, &cy);
    if (want == g_mouselook_applied) return;
    g_mouselook_applied = want;
    SDL_SetRelativeMouseMode(want ? SDL_TRUE : SDL_FALSE);
    if (!want && ren) {
        /* Hand the real pointer back where the game cursor is (the viewport centre) so it
           doesn't jump on the next motion. */
        int wx = 0, wy = 0;
        if (uw_mouselook_center(&cx, &cy)) {
            SDL_RenderLogicalToWindow(ren, (float)cx, (float)cy, &wx, &wy);
            SDL_WarpMouseInWindow(win, wx, wy);
        }
    }
    if (want) {
        SDL_GetRelativeMouseState(NULL, NULL);   /* drop motion accumulated before capture */
        uw_gx_post_mouse_motion(cx, cy);
    }
}

/* Relative motion -> view. Right turns right, down looks down (positive pitch).
   SDL divides a real event's xrel/yrel by the renderer's logical-to-window scale, so the same
   physical movement would turn a big window less than a small one; multiply it back out so the
   speed depends only on the device count and --mouselook-speed (deg per count). Injected
   (demo) motion is taken verbatim. */
void uw_mouselook_apply_motion(int xrel, int yrel, int synthetic) {
    SDL_Window *win = uw_gx_window();
    SDL_Renderer *ren = uw_gx_renderer();
    double dx = xrel, dy = yrel;
    if (!synthetic && win && ren) {
        int ww = 0, wh = 0, lw = 0, lh = 0;
        SDL_GetWindowSize(win, &ww, &wh);
        SDL_RenderGetLogicalSize(ren, &lw, &lh);
        if (lw > 0 && lh > 0) {
            double scale = SDL_min((double)ww / lw, (double)wh / lh);
            if (scale > 0) { dx *= scale; dy *= scale; }
        }
    }
    double deg = g_opts.mouselook_speed;
    DAT_00201c70 = (short)(DAT_00201c70 + (int)lround(dx * deg * (65536.0 / 360.0)));
    if (g_player_object) {  /* the heading fields the arrow-key turn keeps in step: door leaves, compass */
        g_player_object->hdr.heading = ((ushort)DAT_00201c70 >> 13) & 7;
        g_player_object->fine_heading = ((ushort)DAT_00201c70 >> 8) & 0x1f;
    }
    int p = (int)DAT_0023beb4 + (int)lround(dy * deg * 256.0);
    const int limit = uw_look_pitch_limit();
    if (p < -limit) p = -limit;
    if (p > limit) p = limit;
    DAT_0023beb4 = (short)p;
}

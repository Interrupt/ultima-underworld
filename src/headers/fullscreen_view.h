#ifndef HEADERS_FULLSCREEN_VIEW_H
#define HEADERS_FULLSCREEN_VIEW_H

/* Declarations for fullscreen_view.c: the G-key fullscreen 3D view, which hides the HUD and renders
   the dungeon view across the whole screen. */

/* Key binding handler for G: flip the fullscreen view (only in the in-game 3D view). */
void uw_toggle_fullscreen_view(int unused);

/* While the fullscreen view is on, the HUD's own draw handlers are pointed at an off-screen buffer
   so they cannot paint over the 3D view. begin returns nonzero if the redirect is active; call end
   only then. */
int uw_fullscreen_hud_sink_begin(void);
void uw_fullscreen_hud_sink_end(void);

#endif

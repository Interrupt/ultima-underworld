#ifndef HEADERS_FULLSCREEN_VIEW_H
#define HEADERS_FULLSCREEN_VIEW_H

/* Declarations for fullscreen_view.c: the G-key fullscreen 3D view, which renders the dungeon view
   across the whole screen and overlays only the message scroll and the right-hand inventory /
   rune / skills panel. */

/* Key binding handler for G: flip the fullscreen view (only in the in-game 3D view). */
void uw_toggle_fullscreen_view(int unused);

/* The right-hand panel is hidden in the fullscreen view until shown. toggle is the key binding handler
   for I; show is for the keys that need the panel (R, V). It also shows whenever an item is held. */
void uw_fullscreen_toggle_panel(int unused);
void uw_fullscreen_show_panel(void);
int uw_fullscreen_panel_visible(void);

/* While the fullscreen view is on, the 3D pass draws into a separate scene buffer so the game's own
   framebuffer keeps the HUD image. begin returns nonzero if the redirect is active; call end only
   then. */
int uw_fullscreen_scene_begin(void);
void uw_fullscreen_scene_end(void);

/* Builds the presented image: the scene with the overlay panels copied over it from the HUD image.
   `display` is the 320-wide landscape RGB565 buffer. Returns nonzero if it composed (the fullscreen
   view is on in the plain 3D view); otherwise `display` is left as the HUD image. */
int uw_fullscreen_compose(unsigned short *display);

/* Nonzero if the screen point lies on one of the overlay panels. */
int uw_fullscreen_in_overlay(int x, int y);

/* Nonzero if the screen point is in the 3D view's rect and not covered by an overlay panel. */
int uw_point_in_game_view(int x, int y);

#endif

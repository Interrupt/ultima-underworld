#ifndef HEADERS_MOUSELOOK_H
#define HEADERS_MOUSELOOK_H

/* Declarations for mouselook.c: the F-key mouselook mode. While active the real pointer is captured
   (SDL relative mode), its motion turns/pitches the player's view, and the game's software cursor
   stays pinned to the middle of the 3D viewport, so clicks and the E/Q hotkeys act on whatever is
   under the crosshair. */

/* Nonzero while mouselook is actually in effect (toggled on AND in the interactive 3D view). */
int uw_mouselook_active(void);
/* Key binding handler for F: flip the player's mouselook toggle. */
void uw_toggle_mouselook(int unused);
/* Called every event pump: capture/release the pointer as the toggle and game state dictate. */
void uw_mouselook_refresh(void);
/* Centre of the 3D viewport in game coordinates; returns 0 if the viewport isn't registered yet. */
int uw_mouselook_center(int *cx, int *cy);
/* Apply relative pointer motion (device counts) to the view's yaw/pitch; `synthetic` marks injected
   demo motion, which is taken verbatim instead of being rescaled for the window size. */
void uw_mouselook_apply_motion(int xrel, int yrel, int synthetic);
/* Maximum view pitch in 1/256-degree units (--look-pitch-limit), shared with the 1/3 look keys. */
int uw_look_pitch_limit(void);

#endif

#ifndef HEADERS_EDITOR_H
#define HEADERS_EDITOR_H

/* The level editor (editor.c): the original UW1 shipped an editor (see editor-research/). It is an overlay on the
   in-game dungeon view, not a new game mode: the 3D scene is rendered into the fullscreen scene buffer and shown,
   scaled down, in a corner of a 320x200 editor screen together with a tile map, a mode palette, the picked
   object's editor, an object palette and an info bar. */

int uw_editor_active(void);
/* Turn the editor on or off (only in the plain 3D dungeon view). */
void uw_editor_set(int on);
void uw_editor_toggle(int unused);

/* Per-frame input: the free camera's keys. */
void uw_editor_tick(void);
/* The mouse moved or a button was released (a right drag pans the map pane). */
void uw_editor_mouse_motion(int x, int y);
void uw_editor_mouse_up(int x, int y, int button);

/* Play from the selected tile: saves the level, leaves the editor and drops the player there. */
void uw_editor_play(void);

/* A mouse button pressed at a screen point (the 320x200 editor screen). */
void uw_editor_click(int x, int y, int button);

/* Save the level being edited into the master level archive, DATA\\LEV.ARK (Ctrl+S, the demo command EDITOR save, or the starburst
   at the top of the mode palette). The first save makes a one-time copy, LEV.ARK.BAK. Entering the editor reloads the
   level from the archive. */
void uw_editor_save(void);
/* Walks every tile chain and checks the object lists are consistent; returns the number of problems (0 == good). */
int uw_editor_validate(void);

/* The mouse wheel turned (dy > 0 is up) with the pointer at a screen point. */
void uw_editor_wheel(int x, int y, int dy);

/* Builds the editor screen into `display` (320-wide landscape RGB565). Returns nonzero if it did. */
int uw_editor_compose(unsigned short *display);

#endif

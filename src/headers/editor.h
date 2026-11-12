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
/* The Escape menu: Escape opens it (a pending Move or Copy is cancelled first), and it takes all input while open. Page Up and
   Page Down change level. */
void uw_editor_escape(void);
int uw_editor_menu_open(void);
void uw_editor_menu_key(int sym);
void uw_editor_page_level(int delta);

/* Undo and redo the last edit (Ctrl+Z, Ctrl+Y or Ctrl+Shift+Z, and EDITOR undo / redo): each step restores the level arena, the
   scheduler table and the texture map byte for byte. The status bar shows * after the level number while there are unsaved edits. */
void uw_editor_undo(void);
void uw_editor_redo(void);
void uw_editor_command(int back);   /* object mode: Back (nonzero) or Replace, which have no buttons */
/* Self-check of the editor's edits: each is undone and the level compared byte for byte (aborts on a difference). */
void uw_editor_selftest(void);

/* Walks every tile chain and checks the object lists are consistent; returns the number of problems (0 == good). */
int uw_editor_validate(void);

/* The mouse wheel turned (dy > 0 is up) with the pointer at a screen point. */
void uw_editor_wheel(int x, int y, int dy);

/* The editor's view modes (the Eye button): what the 3D view draws as editor sprites. In Preview the game draws as it would; in Triggers the
   invisible objects, traps and triggers draw as sprites too; in Markers every object does. They apply only while the editor is on. */
#define UW_EDITOR_SPRITE_BASE 0x6000   /* sprite frames 0x6000 + object id are editor sprites */
int uw_editor_view_object(unsigned object_word);   /* nonzero: draw this object as an editor sprite (and draw it even if invisible) */
const unsigned char *uw_editor_marker_pixels(int object_id, int *width, int *height);   /* its palette-index pixels */

/* Builds the editor screen into `display` (320-wide landscape RGB565). Returns nonzero if it did. */
int uw_editor_compose(unsigned short *display);

#endif

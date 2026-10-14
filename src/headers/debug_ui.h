/* Minimal immediate-mode debug GUI, built on top of this project's own recovered UW1 drawing
   primitives (rect_fill_or_save_restore, set_draw_color, draw_text_string) rather than a separate
   rendering path. General subsystem debug panel: populated once per frame, unconditionally, from
   main_loop_hud_flush (hud.c) with on/off toggles for whole render/simulation subsystems bound
   directly to each subsystem's own global flag. Add a new subsystem toggle at that same call site
   instead of starting a second panel -- there is exactly one field list, rebuilt every frame, live
   at a time. */
#ifndef DEBUG_UI_H
#define DEBUG_UI_H

#ifdef __cplusplus
extern "C" {
#endif

void dbgui_begin(const char *title);
void dbgui_field_double(const char *name, double *value, double step);
void dbgui_field_int(const char *name, int *value, int step);
/* An int field that shows names[*value] instead of the number. LEFT, RIGHT, RETURN and click step
   through the names, wrapping; there is no numeric-edit mode. `names` must outlive the frame. */
void dbgui_field_int_names(const char *name, int *value, const char *const *names, int count);
/* A row with no value -- shown as "[ name ]". Selecting it and pressing
   RETURN (or clicking it) calls on_press() immediately, instead of
   entering the numeric-edit mode double/int fields use. */
void dbgui_field_button(const char *name, void (*on_press)(void));
/* A boolean row, shown as "name: ON"/"name: OFF" (*value treated as
   nonzero == ON). RETURN, LEFT, or RIGHT all just flip it -- no numeric-
   edit mode, unlike double/int fields. */
void dbgui_field_toggle(const char *name, int *value);
/* A read-only "name: value" row for displaying information rather than
   an editable setting (an inspected object's id/type/position/...).
   Selectable (keyboard nav doesn't skip it) but never enters edit mode
   and ignores RETURN/LEFT/RIGHT/click, same as a plain label. `value`
   is copied immediately, truncated to a small fixed buffer -- call
   again next frame with a freshly formatted string for a live
   display, same as every other field kind being rebuilt each frame. */
void dbgui_field_text(const char *name, const char *value);
/* A toggle-styled row ("name: ON"/"name: OFF", same click/RETURN/LEFT/
   RIGHT dispatch as dbgui_field_toggle) for a boolean that's really a
   COMPUTED property with a genuine action behind changing it rather
   than a plain flag to flip (a door's locked state, driven by running
   the real unlock action, not by writing a bit somewhere). `value` is
   the state to display THIS frame, same as dbgui_field_text's value;
   on_toggle is called on activation and decides what (if anything)
   really changes -- see its own doc comment in debug_ui.c for why. */
void dbgui_field_toggle_action(const char *name, int value, void (*on_toggle)(void));
void dbgui_end(void);
/* Actually paints the panel -- call once per frame from the true end of the frame (after the 3D
   view and HUD have drawn), NOT from wherever dbgui_begin/dbgui_field_.../dbgui_end happened to
   run. See its own comment in debug_ui.c for why the two are split. */
void dbgui_draw();
/* The screen rect (left, top, right and bottom exclusive) the panel or console occupies now; returns 0 when
   nothing is shown. */
int dbgui_overlay_rect(int *x0, int *y0, int *x1, int *y1);

/* True once dbgui_begin has been called with a non-NULL title at least once this process and the
   panel is currently shown -- gx_stub.c's event loop checks this to decide whether raw input
   belongs to the debug UI (swallowed, not forwarded to the game) or to the game as normal. */
int dbgui_visible();
/* Backtick always toggles, regardless of current visibility -- call this directly from gx_stub.c's
   SDL_KEYDOWN case for SDLK_BACKQUOTE (96), before checking dbgui_visible(), so the panel can
   always be brought back even while hidden. */
void dbgui_toggle(void);
/* Call when the caller is about to switch the panel's own content
   (toggle panel <-> object inspector <-> texture inspector) while it
   stays open -- puts the real game pixels back behind the panel and
   re-saves them, so the new content's own fill never has to rely on
   covering whatever a previous, possibly-taller/wider draw left behind
   (see its own comment in debug_ui.c for why that's not safe to lean
   on). Do not call this around an actual close/reopen -- dbgui_toggle
   already does the equivalent restore/re-arm pair for that. */
void dbgui_invalidate_region(void);

/* Raw input feed from gx_stub.c's SDL event loop, BEFORE any of the game's own WM_*-message
   translation -- landscape logical pixel coordinates (the same 320x240 space draw_text_string/
   rect_fill_or_save_restore already draw in), not SDL window pixels. */
void dbgui_feed_mouse_down(int lx, int ly);
void dbgui_feed_key(int sdl_keycode);
void dbgui_feed_text(const char *utf8);

/* Quake-style console: a full-width drop-down with scrollback and an input line, entered from the
   panel's "console" button and left with ESC (back to the panel) or backtick (close everything).
   Keyboard, text and mouse input are owned by it while open, through the same dbgui_feed_* calls.
   Submitted lines go to the handler registered here (CLEAR is handled internally); output is added
   to the scrollback with dbgui_console_print, which splits on newlines. */
void dbgui_console_open(void);
int dbgui_console_active(void);
void dbgui_console_print(const char *text);
void dbgui_console_set_handler(void (*handler)(const char *line));
/* Called after the console closes and its saved pixels are put back, so the game can repaint what
   it owns under that region (the inventory panel) instead of leaving the console's black behind. */
/* Scrolls the scrollback by `lines` (positive = older). SHIFT+UP/DOWN call this with +/-1. */
void dbgui_console_scroll(int lines);
void dbgui_console_set_close_hook(void (*hook)(void));

/* Test-only accessors (tests/test_debug_ui.c) -- never called by game
 * code. dbgui_test_reset() clears all panel/selection/edit state back
 * to a fresh process start, so each test case gets a known baseline
 * regardless of what an earlier test left behind (dbgui_begin() itself
 * deliberately does NOT reset selection -- real play wants the cursor
 * to survive from frame to frame). dbgui_test_row_x/row_y expose the
 * real per-field click rect dbgui_draw() just computed, instead of
 * tests duplicating DBGUI_PANEL_X/DBGUI_ROW_H's values by hand (only
 * valid after a dbgui_draw() call this "frame", same as real mouse
 * picking -- returns -1 for an out-of-range index). */
void dbgui_test_reset(void);
int dbgui_test_row_x(void);
int dbgui_test_row_y(int field_index);

#ifdef __cplusplus
}
#endif

#endif

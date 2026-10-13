#ifndef GX_STUB_H
#define GX_STUB_H

/* SDL_Event.*.which value tagging a click injected by uw_inject_mouse_* so uw_pump_events takes the
   event's own coords (the GetGlobalMouseState warp is a no-op under the dummy video driver). */
#define UW_SYNTH_MOUSE 0x55570001u
/* Stamped into keysym.unused (a spare Uint32 that survives SDL's event queue memcpy) on
   keydown/keyup events pushed by uw_inject_key_* so the physical-ESC "abort the running demo" check
   can tell a real keypress from a demo's own SDLHOLD injection. */
#define UW_SYNTH_KEY 0x55570002u

/* The SDL window/renderer, and posting a game mouse-motion message at a game (landscape) position --
   used by mouselook.c, which pins the game cursor without a real pointer event. */
struct SDL_Window;
struct SDL_Renderer;
struct SDL_Window *uw_gx_window(void);
struct SDL_Renderer *uw_gx_renderer(void);
void uw_gx_post_mouse_motion(int landscape_x, int landscape_y);

int GXOpenDisplay(void *hwnd, unsigned int flags);
int uw_save_rgb565_region_bmp(const char *path, const unsigned short *pixels, int w, int h, int stride_pixels);
void uw_debug_mkdir_p(const char *path);
int GXCloseDisplay();
void *GXBeginDraw();
int GXEndDraw();
/* Queue a cursor overlay update through the normal display pacing. */
void uw_request_cursor_present();
/* Batch a gameplay tick's draw requests into one display refresh. Modal
   viewers present immediately while the surrounding tick is suspended. */
void uw_begin_present_batch();
void uw_end_present_batch();
/* Finish one render batch and present the completed frame using SDL vsync,
   bypassing the software deadline. Ordinary flushes remain paced. */
void gfx_finalizedraw();
/* Input handlers may block and run their own redraw/input loops. */
void uw_suspend_present_batch();
void uw_resume_present_batch();
void uw_begin_modal_present();
void uw_end_modal_present();

int GXOpenInput();
int GXCloseInput();
void *GXGetDefaultKeys(void *outBuffer);
void *GXGetDisplayProperties();
int GXSuspend();
int GXResume();

/* Saves the current window contents (post-rotation, what's actually on screen) as a BMP. Returns 1
   on success, 0 on failure (no window yet, or the write failed). */
int uw_save_screenshot(const char *path);

/* Debug tool: while --dump-critter-sheet is set, dumps every critter/NPC sprite frame
   decode_critter_sprite_page produces to a BMP under
   debug/crit/type<N>/tier<T>/dir<D>_frame<F>.bmp... */
void uw_debug_dump_critter_sprite(int type, int tier, int direction, int frame,
                                   const unsigned char *pixels, int width, int height);

/* Debug tool: one-shot capture of every individual 3D face draw for the next 3D render pass, armed
   live from the UW_MODEL_TUNER debug panel's "dump_3d_frame" button rather than an env var.
   uw_debug_request_3d_ frame_dump() arms it... */
void uw_debug_request_3d_frame_dump();
void uw_debug_dump_3d_face(const char *tag);
/* Returns -1 if no capture was pending (the common case -- called unconditionally every
   render_visible_tile_list pass), otherwise the number of faces just captured. */
int uw_debug_3d_frame_dump_finish();
/* Directory the most recent (or in-progress) 3D face capture wrote
   into, e.g. "debug/facedumps/20260927_161447". Valid once the first
   capture this process has started. */
const char *uw_debug_3d_frame_dump_last_dir();

/* Returns 1 and clears the flag if a mouse event (move/click) was processed since the last call, 0
   otherwise. One-shot "was there a pending mouse message" signal for PeekMessageW (PeekMessage) --
   see its comment in ordinal_stubs.c for why this is needed alongside DAT_0023c448. */
int uw_take_mouse_event_pending();


/* For scripted/unattended testing: warps the real cursor to (window_x, window_y) (SDL window
   points) and pushes genuine SDL_MOUSEBUTTONDOWN/UP events, so the click flows through the exact
   same path a real mouse click does... */
int uw_inject_mouse_click(int window_x, int window_y);

/* Right-button click (interact). Down+up queued together. */
int uw_inject_mouse_rclick(int window_x, int window_y);

/* Split halves of uw_inject_mouse_click, for tests that need a real
   multi-poll gap between button-down and button-up (matching an actual
   held click's timing) rather than both queued instantaneously. */
int uw_inject_mouse_down(int window_x, int window_y);
int uw_inject_mouse_up(int window_x, int window_y);

/* Right-button split halves of uw_inject_mouse_rclick, for testing a real right-button DRAG (down
   over one object, hold across a real multi-poll gap, move, then release somewhere else)... */
int uw_inject_mouse_rdown(int window_x, int window_y);
int uw_inject_mouse_rup(int window_x, int window_y);

/* Warp the cursor and push a genuine SDL_MOUSEMOTION event with no button state change -- the "move
   while held" middle of a drag. */
int uw_inject_mouse_motion(int window_x, int window_y);

/* Push a relative-only SDL_MOUSEMOTION (demomode's SDLREL), which steers the view in mouselook. */
int uw_inject_mouse_relmotion(int dx, int dy);

/* Push a genuine SDL_KEYDOWN (+ SDL_TEXTINPUT for a printable key) / SDL_KEYUP for the given
   SDL_Keycode, so scripted tests exercise uw_pump_events()'s real keyboard path (demomode's SDLHOLD
   command). Returns 1, or 0 if there's no window yet. */
int uw_inject_key_down(int sdl_keycode);
int uw_inject_key_up(int sdl_keycode);
void uw_clear_synth_scancode(int sdl_keycode);

unsigned char *uw_get_default_palette(const char *gr_name);

/* Shared helper behind several of the UW_DUMP_* debug tools above: saves a WxH RGB565 region
   (stride pixels per row) as a standalone BMP. Returns 1 on success, 0 on failure. */
int uw_save_rgb565_region_bmp(const char *path, const unsigned short *pixels,
                               int width, int height, int stride);
/* mkdir -p, for the debug dump tools' own output directories. */
void uw_debug_mkdir_p(const char *path);

#endif

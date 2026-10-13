/* GAPI (Windows CE "GX*" Game API) stub, backed by real SDL2 so the game
 * gets an actual window instead of a headless no-op. */
#include "headers/gx_stub.h"
#include "headers/options.h"
#include "headers/ordinal_stubs.h"
#include "headers/uw.h"
#include "headers/input.h"
#include "headers/demomode.h"
#include "headers/democapture.h"
#include "headers/debug_ui.h"
#include "headers/audio.h"
#include "headers/platform_music.h"
#include "headers/platform_sfx.h"
#include "headers/platform_voice.h"

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>

#define GX_W 320
#define GX_H 240
/* Keep the Pocket PC framebuffer/pitches intact; present only the DOS game
   area unless --touchscreen enables the extra 40-row touch input strip. */
static int g_display_height = 200;

/* The game's own screen-flush routines (flush_dirty_rect_to_display/flush_dirty_rect_to_display_240
   in uw.c) always blit by transposing rows<->columns from the software framebuffer into whatever
   GXBeginDraw() returns, using the pitch values from GXGetDisplayProperties()... */
#define HW_W 240
#define HW_H 320

/* Real Microsoft GXDisplayProperties layout (6 x 4-byte fields = 0x18). */
typedef struct {
    unsigned int cxWidth;
    int cyHeight;
    int cbxPitch;
    int cbyPitch;
    int cBPP;
    unsigned int ffFormat;
} GxDisplayProps;

#define KF_DIRECT565 0x10u

/* Real Microsoft GXKeyList layout: 8x (short vk + POINT pt), 12 bytes each after alignment padding
   = 0x60. Only the vk fields are meaningful here. */
typedef struct {
    short vk;
    short pad;
    int ptx, pty;
} GxKeyEntry;

typedef struct {
    GxKeyEntry up, down, left, right, a, b, c, start;
} GxKeyList;

#define VK_UP 0x26
#define VK_DOWN 0x28
#define VK_LEFT 0x25
#define VK_RIGHT 0x27
#define VK_RETURN 0x0D
#define VK_SPACE 0x20
#define VK_CONTROL 0x11
#define VK_ESCAPE 0x1B
/* Win32 VK codes for letter keys are just their uppercase ASCII value, same as the game's own
   register_key_binding(0x4a, 6, 0x1b, move_command_dispatch) jump binding (see poll_input_bindings
   init) already expects -- that binding just never had a real key reach it... */
#define VK_J 0x4A
/* WinCE app-launch button virtual-key. Real GAPI hands the game codes like this for the hardware
   A/B/C/Start buttons -- never ASCII keys -- so mapping "button A" to one keeps the spacebar free
   to type a literal space in the name-entry field. */
#define VK_APP1 0xC1

/* UW_SYNTH_MOUSE/UW_SYNTH_KEY are declared in gx_stub.h (shared with
   democapture.c, which needs to tell a real event from a demo's own
   injected one to avoid recording playback back into a new file). */

/* Dungeon-view (3D) player movement is polled from the physical keyboard state every pump
   (poll_dungeon_movement_keys), DOS-style, rather than driven off discrete key events. */
extern short DAT_00201b64;   /* game mode; 0 == in-game 3D dungeon view */
extern int g_text_input_active;       /* scroll_text_entry_prompt's (was FUN_0007ffa8) text-entry loop is running (save-name field, "Move how many", "Chant the mantra", etc); see its own comment in uw.c */
extern unsigned short DAT_0023c448;   /* latched pending input code */
extern int DAT_000876c8;              /* set by WM_KEYUP; main loop then clears DAT_0023c448 */
extern short DAT_0024af6c;            /* held-key repeat accelerator (turn/move rate scale) */
extern short DAT_0023beb4;            /* view pitch (1/256 deg); sync_camera_from_player -> DAT_000db448 */
extern unsigned int g_uw_frame_clock_units; /* GX elapsed-time sample for movement; see movement.c */
extern short g_movement_mode;             /* pending movement command (6/7 jump) */

/* OR'd into the real SDL_GetKeyboardState() so scripted tests (SDLHOLD /
   uw_inject_key_down/up) can drive the same movement path -- SDL_PushEvent
   does not update SDL's own keyboard-state array. Indexed by SDL scancode. */
static unsigned char g_synth_scancode_held[SDL_NUM_SCANCODES];

static SDL_Window *g_win;
static SDL_Renderer *g_ren;
static SDL_Texture *g_tex;
static unsigned short g_framebuffer[HW_W * HW_H]; /* RGB565, portrait "hardware" buffer */
static unsigned short g_display_buf[GX_W * GX_H]; /* RGB565, rotated landscape buffer for display */
static int g_running = 1;
/* Mouse events (unlike keyboard ones) get handled synchronously and completely inline in
   uw_pump_events -- handle_mouse_message processes and finishes with each one before uw_pump_events
   even returns... */
static int g_mouse_event_pending = 0;

/* A button-up dispatched on the very next poll after its matching button-down leaves
   character_generator_touch_select's position- validation loop... */
static int g_mouseup_deferred = 0;
static int g_mouseup_deferred_lparam = 0;

/* Pending WM_CHAR byte for Enter/Backspace (0 = none), dispatched one full poll cycle after the
   matching WM_KEYDOWN -- same "one message per real poll" deferral as g_mouseup_deferred above.
   handle_keyboard_message's single-slot DAT_0023c448 latch ORs every message it receives into... */
static int g_keychar_deferred = 0;

/* True from a dispatched button-down until the (possibly still-deferred) matching button-up
   actually dispatches. */
static int g_mouse_button_held = 0;

/* The F/E/Q hotkeys must fire once per physical press. They reach the game as WM_CHAR from
   SDL_TEXTINPUT, which SDL repeats along with the auto-repeated SDL_KEYDOWN; a repeated keydown of
   one of them sets this so the text event that follows it is dropped. */
static int g_skip_repeat_hotkey_char = 0;
static int is_hotkey_sym(SDL_Keycode sym) { return sym == SDLK_f || sym == SDLK_e || sym == SDLK_q; }

/* Mouselook (toggled with F, see uw_toggle_mouselook). While active the real pointer is captured
   (SDL relative mode): its motion turns/pitches the player's view directly, and the game's own
   software cursor stays pinned to the middle of the 3D viewport -- where the registered hotspot
   map has no walk arrow, so it shows the default 'X' -- so clicks, E (use/get) and Q (look) all act
   on whatever is under the crosshair. */
extern short DAT_0023be5c, DAT_0023bd80, DAT_0023be80, DAT_0023be88;  /* 3D viewport x, width, bottom y, height */
extern short DAT_00201c70;                                            /* player yaw, 65536 = 360 deg */
/* Maximum view pitch in 1/256-degree units (--look-pitch-limit degrees; the original's was 24; default 45). */
int uw_look_pitch_limit(void) {
    float deg = g_opts.look_pitch_limit;
    if (deg < 1.0f) deg = 1.0f;
    if (deg > 89.0f) deg = 89.0f;
    return (int)(deg * 256.0f);
}
static int g_mouselook_enabled = 0;   /* the player's F toggle */
static int g_mouselook_applied = 0;   /* toggle AND the game is in a state where it makes sense */

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
static int mouselook_center(int *cx, int *cy) {
    if (DAT_0023bd80 <= 0 || DAT_0023be88 <= 0) return 0;
    *cx = DAT_0023be5c + DAT_0023bd80 / 2;
    *cy = DAT_0023be80 - DAT_0023be88 / 2;
    return 1;
}

static void mouselook_post_motion(int landscape_x, int landscape_y) {
    int portrait_x = landscape_y;
    int portrait_y = (HW_H - 1) - landscape_x;
    handle_mouse_message(0, 0x200u, 0, (portrait_y << 16) | (portrait_x & 0xffff));
    uw_request_cursor_present();
}

/* Called every pump: capture/release the pointer as the toggle and the game state dictate. Only the
   interactive 3D view (no menu, text prompt, or debug UI, window focused) gets mouselook; anywhere
   else the pointer is free so the HUD, inventory and menus stay clickable. */
static void mouselook_refresh(void) {
    int cx, cy;
    int want = g_mouselook_enabled && g_win && DAT_00201b64 == 0 && !g_text_input_active &&
               !dbgui_visible() && (SDL_GetWindowFlags(g_win) & SDL_WINDOW_INPUT_FOCUS) &&
               mouselook_center(&cx, &cy);
    if (want == g_mouselook_applied) return;
    g_mouselook_applied = want;
    SDL_SetRelativeMouseMode(want ? SDL_TRUE : SDL_FALSE);
    if (!want && g_ren) {
        /* Hand the real pointer back where the game cursor is (the viewport centre) so it
           doesn't jump on the next motion. */
        int wx = 0, wy = 0;
        if (mouselook_center(&cx, &cy)) {
            SDL_RenderLogicalToWindow(g_ren, (float)cx, (float)cy, &wx, &wy);
            SDL_WarpMouseInWindow(g_win, wx, wy);
        }
    }
    if (want) {
        SDL_GetRelativeMouseState(NULL, NULL);   /* drop motion accumulated before capture */
        mouselook_post_motion(cx, cy);
    }
}

/* Relative motion -> view. Right turns right, down looks down (positive pitch).
   SDL divides a real event's xrel/yrel by the renderer's logical-to-window scale, so the same
   physical movement would turn a big window less than a small one; multiply it back out so the
   speed depends only on the device count and --mouselook-speed (deg per count). Injected
   (demo) motion is taken verbatim. */
static void mouselook_apply_motion(const SDL_MouseMotionEvent *m) {
    double dx = m->xrel, dy = m->yrel;
    if (m->which != UW_SYNTH_MOUSE && g_win) {
        int ww = 0, wh = 0;
        SDL_GetWindowSize(g_win, &ww, &wh);
        double scale = SDL_min((double)ww / GX_W, (double)wh / g_display_height);
        if (scale > 0) { dx *= scale; dy *= scale; }
    }
    double deg = g_opts.mouselook_speed;
    DAT_00201c70 = (short)(DAT_00201c70 + (int)lround(dx * deg * (65536.0 / 360.0)));
    int p = (int)DAT_0023beb4 + (int)lround(dy * deg * 256.0);
    const int limit = uw_look_pitch_limit();
    if (p < -limit) p = -limit;
    if (p > limit) p = limit;
    DAT_0023beb4 = (short)p;
}

static int translate_vk(SDL_Keycode sym) {
    switch (sym) {
        case SDLK_UP: return VK_UP;
        case SDLK_DOWN: return VK_DOWN;
        case SDLK_LEFT: return VK_LEFT;
        case SDLK_RIGHT: return VK_RIGHT;
        case SDLK_RETURN: return VK_RETURN;
        /* SDLK_SPACE is deliberately NOT mapped here: the spacebar must reach the game only as a
           WM_CHAR (0x20) via SDL_TEXTINPUT so it types a literal space in the name-entry field. */
        case SDLK_LCTRL:
        case SDLK_RCTRL: return VK_CONTROL;
        case SDLK_ESCAPE: return VK_ESCAPE;
        /* Jump. Real UW controls bind this to J; the game's own register_key_binding(0x4a, ...)
           table entry already expects it (see VK_J above) -- it just never had a live key mapped to
           it in this port. */
        case SDLK_j: return VK_J;
        default: return 0;
    }
}

/* True while the game is showing the interactive 3D dungeon view and the WASD/1-3 poller should own
   those keys. SHIFT+WASD is excluded so it still drives the game's stepped (tile-based, key-repeat)
   move handler, as in the DOS controls. */
static int in_dungeon_freelook(void) {
    if (DAT_00201b64 != 0) return 0;
    /* A text-entry field (save-name, "Move how many", "Chant the mantra", ...) is a scroll-area
       overlay drawn on top of the dungeon view without ever changing the top-level game mode, so
       DAT_00201b64 alone can't tell them apart... */
    if (g_text_input_active) return 0;
    /* SDL_GetModState() only reflects modifier keys that came through the real OS input backend --
       a demo-injected SDLK_LSHIFT (uw_inject_key_down, which SDL_PushEvent()s the event rather than
       feeding it through SDL's own keyboard backend) never sets it... */
    int shift_held = (SDL_GetModState() & KMOD_SHIFT) != 0 ||
                      g_synth_scancode_held[SDL_SCANCODE_LSHIFT] ||
                      g_synth_scancode_held[SDL_SCANCODE_RSHIFT];
    return !shift_held;
}

/* DOS-style: poll the physical keyboard each pump and drive the analog movement decoder while in
   the 3D dungeon view. plain WASD -> free rotation / forward-back; 1/2/3 -> look up / centre /
   down; released -> stop. SHIFT+WASD and all of this in menus fall through untouched. */
static void poll_dungeon_movement_keys(int game_frame_due)
{
    if (!in_dungeon_freelook()) {     /* menu, or SHIFT held */
        set_held_movement_keys(0);
        return;
    }

    /* With the debug console open, only injected (console command) keys count -- the human is
       typing into the console, not walking. */
    const Uint8 *ks = SDL_GetKeyboardState(NULL);
    const int physical_keys = !dbgui_visible();
    #define UW_HELD(sc) ((physical_keys && ks[(sc)]) || g_synth_scancode_held[(sc)])
    /* Arrow keys: up forward (run), down backward, left/right turn -- the same held-key state as
       WASD/X, so they combine with a jump or each other exactly as those do. */
    /* Mouselook swaps the A/D and Z/C pairs: the mouse turns, so A/D strafe (modern WASD) and
       Z/C take over keyboard turning. */
    const int ml = uw_mouselook_active();
    int left    = UW_HELD(ml ? SDL_SCANCODE_Z : SDL_SCANCODE_A) || UW_HELD(SDL_SCANCODE_LEFT);
    int right   = UW_HELD(ml ? SDL_SCANCODE_C : SDL_SCANCODE_D) || UW_HELD(SDL_SCANCODE_RIGHT);
    int run     = UW_HELD(SDL_SCANCODE_W) || UW_HELD(SDL_SCANCODE_UP);   /* W = run forward  */
    int walk    = UW_HELD(SDL_SCANCODE_S);   /* S = walk forward (slower) */
    int back    = UW_HELD(SDL_SCANCODE_X) || UW_HELD(SDL_SCANCODE_DOWN);
    int strafeL = UW_HELD(ml ? SDL_SCANCODE_A : SDL_SCANCODE_Z);
    int strafeR = UW_HELD(ml ? SDL_SCANCODE_D : SDL_SCANCODE_C);
    int lookUp  = UW_HELD(SDL_SCANCODE_1);
    int lookCtr = UW_HELD(SDL_SCANCODE_2);
    int lookDn  = UW_HELD(SDL_SCANCODE_3);
    #undef UW_HELD

    /* View pitch: keys 1 / 2 / 3. DAT_0023beb4 is a signed 1/256-degree pitch the camera build
       reads; negative looks up. It is never auto-recentred, so ramp it while held and snap on 2.
       Port timing: ramp only when the shared game clock advances, rather than once per input poll. */
    if (lookCtr) {
        DAT_0023beb4 = 0;
    } else if (game_frame_due && lookUp && !lookDn) {
        int p = (int)DAT_0023beb4 - 0x120;
        DAT_0023beb4 = (short)(p < -uw_look_pitch_limit() ? -uw_look_pitch_limit() : p);
    } else if (game_frame_due && lookDn && !lookUp) {
        int p = (int)DAT_0023beb4 + 0x120;
        DAT_0023beb4 = (short)(p > uw_look_pitch_limit() ? uw_look_pitch_limit() : p);
    }

    /* The held movement keys are their own state (DOS key array), decoded by
       decode_movement_command; they never go through the pending-key slot, so a jump or any other
       key pressed meanwhile is not disturbed. */
    set_held_movement_keys((unsigned short)((run ? HELD_MOVE_RUN : 0) | (walk ? HELD_MOVE_WALK : 0) |
        (back ? HELD_MOVE_BACK : 0) | (left ? HELD_MOVE_LEFT : 0) | (right ? HELD_MOVE_RIGHT : 0) |
        (strafeL ? HELD_MOVE_STRAFE_LEFT : 0) | (strafeR ? HELD_MOVE_STRAFE_RIGHT : 0)));
}

struct uw_frame_pacing {
    uint64_t origin_us, next_us, frame_number, grace_us;
    int initialized, pending;
    unsigned rate_hz;
};
static struct uw_frame_pacing g_display_pacing = {0};
static struct uw_frame_pacing g_game_pacing = {0};

void uw_set_present_refresh_rate(unsigned refresh_hz)
{
    /* Port timing deviation: present cursor/HUD changes at monitor refresh,
       while the existing game clock stays at 60Hz. Admit early flushes within
       one eighth of a refresh interval and let SDL wait for vsync. */
    if (refresh_hz == 0) refresh_hz = 60;
    if (g_display_pacing.rate_hz != refresh_hz) {
        /* A display change starts a new presentation cadence, preserving any
           queued flush and leaving the game clock untouched. */
        g_display_pacing.initialized = 0;
        g_display_pacing.next_us = 0;
        g_display_pacing.rate_hz = refresh_hz;
    }
    g_display_pacing.grace_us = 1000000 / ((uint64_t)refresh_hz * 8);
}

void uw_reset_frame_pacing()
{
    memset(&g_display_pacing, 0, sizeof g_display_pacing);
    memset(&g_game_pacing, 0, sizeof g_game_pacing);
    g_uw_frame_clock_units = 0;
    uw_set_present_refresh_rate(60);
}

/* Absolute deadlines avoid drift from rounded millisecond delays. The game
   uses 60Hz; display pacing uses the monitor rate. Multiple flushes within
   one display interval never buy another presentation, except for an explicitly
   finalized complete render. */
int uw_claim_frame(struct uw_frame_pacing *pacing, uint64_t now_us)
{
    unsigned rate_hz = pacing->rate_hz ? pacing->rate_hz : 60;
    if (!pacing->initialized) {
        pacing->origin_us = now_us;
        pacing->initialized = 1;
    } else if (now_us < pacing->next_us) {
        return 0;
    }
    pacing->frame_number = ((now_us - pacing->origin_us + 1) * rate_hz) / 1000000 + 1;
    pacing->next_us = pacing->origin_us + pacing->frame_number * 1000000 / rate_hz;
    return 1;
}

int uw_present_frame_due(uint64_t now_us)
{
    /* Let SDL handle vsync for flushes inside the grace window, without
       sleeping first. Claim the upcoming slot so another flush cannot
       present it again. Earlier requests stay pending and return. */
    if (g_display_pacing.initialized && now_us < g_display_pacing.next_us &&
        g_display_pacing.next_us - now_us <= g_display_pacing.grace_us) {
        now_us = g_display_pacing.next_us;
    }
    if (!uw_claim_frame(&g_display_pacing, now_us)) {
        g_display_pacing.pending = 1;
        return 0;
    }
    g_display_pacing.pending = 0;
    return 1;
}

void uw_record_completed_present(uint64_t now_us)
{
    /* SDL has completed the vsync wait. Start the next cursor/ordinary flush
       deadline here, rather than at the time the completed frame was submitted.
       Keep the game clock independent and consume any older queued flush. */
    unsigned rate = g_display_pacing.rate_hz ? g_display_pacing.rate_hz : 60;
    g_display_pacing.origin_us = now_us;
    g_display_pacing.frame_number = 1;
    g_display_pacing.next_us = now_us + 1000000 / rate;
    g_display_pacing.initialized = 1;
    g_display_pacing.pending = 0;
}

/* Cursor-only changes need a presentation even in a blocking input wait.
   Reuse the pacing queue so the next event poll shows the latest icon and
   position without copying cursor pixels into the hardware framebuffer. */
void uw_request_cursor_present()
{
    g_display_pacing.pending = 1;
}

void uw_service_pending_present(uint64_t now_us)
{
    /* A last flush may be followed only by a blocking input wait.
       Keep it pending and show the latest hardware buffer on a later
       event poll even if the game issues no further drawing command. */
    if (g_display_pacing.pending && now_us >= g_display_pacing.next_us)
        GXEndDraw();
}

int uw_service_game_clock(uint64_t now_us)
{
    /* The original release waits already dispatch normal game handlers.
       Service their clock just like the outer loop, without special item
       or mouse-button checks. Modal views retain ownership of drawing. */
    if (DAT_00201b64 != 0 || DAT_00201c90 != 0) return 0;
    if (!uw_claim_frame(&g_game_pacing, now_us)) return 0;
    g_uw_frame_clock_units = (unsigned int)(g_game_pacing.frame_number * 250 / 60);
    DAT_00201c84 |= 2;
    return 1;
}

uint64_t uw_gx_time_us()
{
    return (uint64_t)((double)SDL_GetPerformanceCounter() * 1000000.0 /
                      (double)SDL_GetPerformanceFrequency());
}

void uw_update_present_refresh_rate()
{
    SDL_DisplayMode mode;
    int display = SDL_GetWindowDisplayIndex(g_win);
    unsigned rate = 0;
    if (display >= 0 && SDL_GetCurrentDisplayMode(display, &mode) == 0 &&
        mode.refresh_rate > 0) rate = (unsigned)mode.refresh_rate;
    uw_set_present_refresh_rate(rate);
}

unsigned int g_uw_pump_events_calls = 0;

void uw_pump_events(void) {
    SDL_Event ev;
    if (!g_win) return;
    uint64_t now_us = uw_gx_time_us();
    int game_frame_due = uw_service_game_clock(now_us);
    uw_service_pending_present(now_us);
    g_uw_pump_events_calls++;
    /* democapture_tick()/demomode_pump() MUST stay universally reachable from here:
       uw_pump_events() is the one call site reachable from EVERY context in the game (chargen,
       menus, dungeon movement, ...)... */
    democapture_tick();
    demomode_pump();
    mouselook_refresh();
    /* poll_dungeon_movement_keys() reads physical keyboard state directly (not the SDL event
       queue), so swallowing key EVENTS below (the dbgui_visible() checks in the
       SDL_KEYDOWN/TEXTINPUT cases) doesn't stop it on its own... */
    if (!dbgui_visible() || dbgui_console_active()) {
        poll_dungeon_movement_keys(game_frame_due);
    } else {
        set_held_movement_keys(0);   /* the debug UI owns the keyboard: nothing is held */
    }

    if (g_mouseup_deferred) {
        /* See g_mouseup_deferred's comment. Dispatch the button-up we
         * held back last call now, one full poll cycle after the
         * matching button-down. */
        g_mouseup_deferred = 0;
        g_mouse_button_held = 0;
        g_mouse_event_pending = 1;
        handle_mouse_message(0, 0x202u, 0, g_mouseup_deferred_lparam);
        return;
    }

    if (g_keychar_deferred) {
        /* See g_keychar_deferred's comment. */
        int c = g_keychar_deferred;
        g_keychar_deferred = 0;
        handle_keyboard_message(0, 0x102u, (unsigned int)c);
        return;
    }

    while (SDL_PollEvent(&ev)) {
        /* Records KEYBOARD events only, before any of the game's own filtering/early-returns below,
           so what gets written matches exactly what a human at the keyboard actually did
           (democapture does its own synthetic-event check and is a no-op if recording is off). */
        democapture_record_event(&ev);
        switch (ev.type) {
            case SDL_QUIT:
                g_running = 0;
                democapture_shutdown();
                SDL_DestroyTexture(g_tex);
                SDL_DestroyRenderer(g_ren);
                SDL_DestroyWindow(g_win);
                SDL_Quit();
                exit(0);
                break;
            case SDL_KEYDOWN:
            case SDL_KEYUP: {
                /* Debug UI toggle: backtick always works, shown or hidden, so the panel can be
                   brought back even while it currently owns no input. Swallowed either way -- no
                   game function is bound to backtick to preserve. */
                if (ev.type == SDL_KEYDOWN && !ev.key.repeat && ev.key.keysym.sym == SDLK_BACKQUOTE) {
                    dbgui_toggle();
                    return;
                }
                /* While the debug UI is visible, it owns ALL keyboard input -- a debug/dev tool,
                   not meant to be driven simultaneously with normal gameplay input. Route and
                   swallow rather than also forwarding to the game. */
                if (dbgui_visible() && !(dbgui_console_active() && ev.key.keysym.unused == UW_SYNTH_KEY)) {
                    if (ev.type == SDL_KEYDOWN && dbgui_console_active() &&
                        (ev.key.keysym.mod & KMOD_SHIFT) &&
                        (ev.key.keysym.sym == SDLK_UP || ev.key.keysym.sym == SDLK_DOWN)) {
                        /* SHIFT+UP/DOWN scroll the console a line (held key repeats). */
                        dbgui_console_scroll(ev.key.keysym.sym == SDLK_UP ? 1 : -1);
                    } else if (ev.type == SDL_KEYDOWN && !ev.key.repeat) {
                        dbgui_feed_key((int)ev.key.keysym.sym);
                    }
                    return;
                }
                /* Physical ESC aborts a running demo file (and is then swallowed -- it does NOT
                   also reach the game). */
                if (ev.type == SDL_KEYDOWN && !ev.key.repeat &&
                    ev.key.keysym.sym == SDLK_ESCAPE &&
                    ev.key.keysym.unused != UW_SYNTH_KEY &&
                    demomode_active()) {
                    demomode_abort("physical ESC key");
                    return;
                }
                /* In the 3D view (no SHIFT) the WASD / ZXC / 1-3 keys are handled by
                   poll_dungeon_movement_keys() from the physical key state, not as discrete events
                   -- swallow their key events... */
                if (in_dungeon_freelook()) {
                    SDL_Keycode msym = ev.key.keysym.sym;
                    if (msym == SDLK_a || msym == SDLK_d || msym == SDLK_w ||
                        msym == SDLK_s || msym == SDLK_x || msym == SDLK_z ||
                        msym == SDLK_c || msym == SDLK_1 || msym == SDLK_2 ||
                        msym == SDLK_3 || msym == SDLK_UP || msym == SDLK_DOWN ||
                        msym == SDLK_LEFT || msym == SDLK_RIGHT) {
                        return;
                    }
                }
                /* Only in the 3D view: in a text prompt, holding the key must keep typing. */
                if (ev.type == SDL_KEYDOWN && ev.key.repeat && is_hotkey_sym(ev.key.keysym.sym) &&
                    DAT_00201b64 == 0 && !g_text_input_active) {
                    g_skip_repeat_hotkey_char = 1;
                }
                /* SDL auto-repeats a held key as a stream of SDL_KEYDOWN events; the game's
                   menu/chargen "wait for one keypress" loops (e.g. wait_for_chargen_field_input)
                   treat every keydown as a fresh confirm/select... */
                if (ev.type == SDL_KEYDOWN && ev.key.repeat) {
                    /* Backspace is the one exception: holding it must keep deleting, so each
                       auto-repeat queues another backspace char exactly like the first press. */
                    if (ev.key.keysym.sym == SDLK_BACKSPACE) {
                        g_keychar_deferred = 0x08;
                        return;
                    }
                    break;
                }
                /* TAB (combat-mode toggle) has no SDL_TEXTINPUT; hand it to the game's key bindings as the
                   WM_CHAR 0x09 they are registered for, once per press, in the 3D view only. */
                if (ev.type == SDL_KEYDOWN && ev.key.keysym.sym == SDLK_TAB &&
                    DAT_00201b64 == 0 && !g_text_input_active) {
                    handle_keyboard_message(0, 0x102u, 9u);
                    return;
                }
                int vk = translate_vk(ev.key.keysym.sym);
                /* The game's arrow codes are the PocketPC D-pad rotated a quarter turn (see
                   GXGetDefaultKeys), which is right for its menus. In the 3D view (SHIFT held, so
                   the stepped movement handler runs) route each arrow to the VK that triggers the
                   movement it names: up forward, down backward, left/right turn. */
                if (DAT_00201b64 == 0 && !g_text_input_active) {
                    switch (vk) {
                        case VK_UP: vk = VK_LEFT; break;     /* forward  */
                        case VK_DOWN: vk = VK_RIGHT; break;  /* backward */
                        case VK_LEFT: vk = VK_UP; break;     /* turn left  */
                        case VK_RIGHT: vk = VK_DOWN; break;  /* turn right */
                    }
                }
                if (vk != 0) {
                    unsigned int msg = (ev.type == SDL_KEYDOWN) ? 0x100u : 0x101u;
                    handle_keyboard_message(0, msg, (unsigned int)vk);
                }
                /* Backspace/Enter don't come through SDL_TEXTINPUT (that event only fires for
                   printable characters), but the game's WM_CHAR handler... */
                if (ev.type == SDL_KEYDOWN) {
                    if (ev.key.keysym.sym == SDLK_BACKSPACE) {
                        g_keychar_deferred = 0x08;
                    } else if (ev.key.keysym.sym == SDLK_RETURN) {
                        g_keychar_deferred = 0x0D;
                    }
                }
                /* Real Windows delivers WM_KEYDOWN and WM_CHAR as separate messages, polled one at
                   a time -- the game's input loop (poll_input_event et al) clears its single
                   pending-input slot (DAT_0023c448) and re-reads it fresh on every poll. */
                return;
            }
            case SDL_TEXTINPUT: {
                if (dbgui_visible() && !(dbgui_console_active() && ev.text.windowID == UW_SYNTH_KEY)) {
                    dbgui_feed_text(ev.text.text);
                    return;
                }
                /* Real typed characters (respects keyboard layout/shift state) -- forwarded as
                   WM_CHAR (0x102), matching handle_keyboard_message's real-text-input path. */
                if (g_skip_repeat_hotkey_char) {
                    g_skip_repeat_hotkey_char = 0;
                    char c0 = ev.text.text[0] | 0x20;
                    if (c0 == 'f' || c0 == 'e' || c0 == 'q') return;
                }
                for (const char *p = ev.text.text; *p; p++) {
                    unsigned char c = (unsigned char)*p;
                    /* In 3D free-look the WASD/ZXC/1-3 keys are polled by
                       poll_dungeon_movement_keys(), not typed. */
                    if (in_dungeon_freelook() &&
                        (c=='a'||c=='d'||c=='w'||c=='s'||c=='x'||c=='z'||c=='c'||
                         c=='1'||c=='2'||c=='3')) {
                        continue;
                    }
                    if (c < 0x80) {
                        handle_keyboard_message(0, 0x102u, (unsigned int)c);
                    }
                }
                return;
            }
            case SDL_MOUSEBUTTONDOWN:
            case SDL_MOUSEBUTTONUP:
            case SDL_MOUSEMOTION: {
                /* The real device's stylus reports taps in the portrait "hardware" framebuffer's
                   own 240x320 coordinate space (see the HW_W/HW_H comment up top), packed as a real
                   Windows lParam (y<<16)|x... */
                int win_x, win_y;
                if (ev.button.which == UW_SYNTH_MOUSE) {
                    /* injected click (uw_inject_mouse_*): these never warp the real OS cursor (see
                       uw_inject_mouse_down's comment), and SDL_GetGlobalMouseState() doesn't
                       reflect a synthetic position anyway... */
                    win_x = (ev.type == SDL_MOUSEMOTION) ? ev.motion.x : ev.button.x;
                    win_y = (ev.type == SDL_MOUSEMOTION) ? ev.motion.y : ev.button.y;
                } else {
                    int gx = 0, gy = 0, wx = 0, wy = 0;
                    SDL_GetGlobalMouseState(&gx, &gy);
                    SDL_GetWindowPosition(g_win, &wx, &wy);
                    win_x = gx - wx;
                    win_y = gy - wy;
                }
                /* Record with the corrected win_x/win_y above, not the raw event fields -- see this
                   block's own comment on why ev.motion.x/y and ev.button.x/y can't be trusted
                   directly (HiDPI half-scale). */
                democapture_record_mouse(ev.type, ev.button.button, ev.button.which, win_x, win_y);
                float lx, ly;
                SDL_RenderWindowToLogical(g_ren, win_x, win_y, &lx, &ly);
                int landscape_x = (int)lx, landscape_y = (int)ly;
                /* Resized windows can have letterboxing. Keep input within
                   the displayed area, including button releases outside it. */
                landscape_x = SDL_clamp(landscape_x, 0, GX_W - 1);
                landscape_y = SDL_clamp(landscape_y, 0, g_display_height - 1);
                if (g_mouselook_applied) {
                    /* Mouselook: motion steers the view; every event (motion or button) is
                       reported at the viewport centre, never at the real pointer position. */
                    int cx, cy;
                    if (ev.type == SDL_MOUSEMOTION)
                        mouselook_apply_motion(&ev.motion);
                    if (mouselook_center(&cx, &cy)) {
                        landscape_x = cx;
                        landscape_y = cy;
                    }
                }
                if (dbgui_visible() && !(dbgui_console_active() && ev.button.which == UW_SYNTH_MOUSE)) {
                    if (ev.type == SDL_MOUSEBUTTONDOWN && ev.button.button == SDL_BUTTON_LEFT && !dbgui_console_active()) {
                        /* A click inside the 3D viewport's own registered
                           rect (the exact bounds pick_object_under_cursor
                           itself guards with -- see its own comment) runs
                           the real object pick and swaps the debug panel
                           into the object inspector; anywhere else (the
                           panel itself, or any other HUD chrome) is a
                           normal panel click as before. */
                        if (landscape_x >= DAT_0023be5c && landscape_x < DAT_0023be5c + DAT_0023bd80 &&
                            landscape_y >= (short)(DAT_0023be80 - DAT_0023be88) && landscape_y < DAT_0023be80) {
                            g_mouse_x = landscape_x;
                            g_mouse_y = landscape_y;
                            dbgui_object_inspector_pick();
                        } else {
                            dbgui_feed_mouse_down(landscape_x, landscape_y);
                        }
                    }
                    /* Clicks belong to the debug UI, but plain motion still goes to the game so its
                       software cursor follows the mouse (nothing else redraws it). */
                    if (ev.type != SDL_MOUSEMOTION) return;
                }
                int portrait_x = landscape_y;
                int portrait_y = (HW_H - 1) - landscape_x;
                int lparam = (portrait_y << 16) | (portrait_x & 0xffff);
                int is_right = (ev.type != SDL_MOUSEMOTION &&
                                ev.button.button == SDL_BUTTON_RIGHT);
                unsigned int msg =
                      (ev.type == SDL_MOUSEMOTION)     ? 0x200u
                    : is_right
                        ? ((ev.type == SDL_MOUSEBUTTONDOWN) ? 0x204u : 0x205u)   /* WM_RBUTTON* */
                        : ((ev.type == SDL_MOUSEBUTTONDOWN) ? 0x201u : 0x202u);  /* WM_LBUTTON* */
                if (ev.type == SDL_MOUSEBUTTONDOWN) {
                    fprintf(stderr, "[mouse] %s click win=(%d,%d) landscape=(%d,%d) portrait=(%d,%d) %s\n",
                            is_right ? "right" : "left",
                            win_x, win_y, landscape_x, landscape_y, portrait_x, portrait_y,
                            (portrait_x > 200 && portrait_x < 0xf0) ? "IN on-screen-keyboard strip" : "outside keyboard strip");
                }
                if (ev.type != SDL_MOUSEMOTION &&
                    ev.button.button != SDL_BUTTON_LEFT &&
                    ev.button.button != SDL_BUTTON_RIGHT) {
                    break;
                }
                /* Hovering a static menu still needs a cursor presentation.
                   Queue the existing GX pacing service, without flushing or
                   changing the game's saved framebuffer. */
                if (uw_always_show_cursor()) uw_request_cursor_present();
                if (is_right) {
                    /* Right-click = interact (handle_game_view_click's right-button branch).
                       Dispatch down and up straight through -- none of the left button's
                       click-hold-to-walk deferral machinery applies. */
                    if (ev.type == SDL_MOUSEBUTTONDOWN)
                        g_mouse_button_held = 1;
                    else
                        g_mouse_button_held = 0;
                    g_mouse_event_pending = 1;
                    handle_mouse_message(0, msg, 0, lparam);
                    return;
                }
                if (ev.type == SDL_MOUSEBUTTONUP) {
                    /* Hold this back one poll cycle -- see g_mouseup_deferred's comment. */
                    g_mouseup_deferred = 1;
                    g_mouseup_deferred_lparam = lparam;
                    g_mouse_event_pending = 1;
                    return;
                }
                if (ev.type == SDL_MOUSEBUTTONDOWN) {
                    g_mouse_button_held = 1;
                }
                g_mouse_event_pending = 1;
                handle_mouse_message(0, msg, 0, lparam);
                return;
            }
            case SDL_WINDOWEVENT:
                if (ev.window.event == SDL_WINDOWEVENT_MOVED ||
#if SDL_VERSION_ATLEAST(2, 0, 18)
                    ev.window.event == SDL_WINDOWEVENT_DISPLAY_CHANGED ||
#endif
                    ev.window.event == SDL_WINDOWEVENT_FOCUS_GAINED)
                    uw_update_present_refresh_rate();
                if (ev.window.event == SDL_WINDOWEVENT_FOCUS_GAINED)
                    handle_keyboard_message(0, 7, 0);
                else if (ev.window.event == SDL_WINDOWEVENT_FOCUS_LOST)
                    handle_keyboard_message(0, 8, 0);
                break;
        }
    }

    /* No new SDL event this call -- see g_mouse_button_held's comment
     * for why we still need to signal "a message is pending" here
     * whenever the button remains physically held. */
    if (g_mouse_button_held) {
        g_mouse_event_pending = 1;
    }
}

int GXOpenDisplay(void *hwnd, unsigned int flags) {
    (void)hwnd;
    (void)flags;
    g_display_height = g_opts.touchscreen ? GX_H : 200;
    uw_reset_frame_pacing();
    fprintf(stderr, "[gx] GXOpenDisplay: opening %dx%d SDL window (game's GAPI display init)\n",
            GX_W, g_display_height);
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "SDL_Init failed: %s\n", SDL_GetError());
        return 0;
    }
    /* Real background-music playback (see audio.c's "Real MOD playback
     * backend" block comment) needs its own SDL subsystem, initialized
     * separately from SDL_INIT_VIDEO above so a sandboxed/CI environment
     * with no audio device still gets a working video/input game --
     * SDL_InitSubSystem's own failure here is reported and otherwise
     * ignored, not fatal. platform_music_init() itself handles
     * "no audio device" (SDL_GetNumAudioDevices()==0) and
     * SDL_OpenAudioDevice failure the same way, leaving the music gate
     * flags at their safe "subsystem not initialized" default.
     *
     * platform_sfx_init() (real one-shot SFX playback, see
     * platform_sfx.c's own block comment) rides the same SDL_INIT_AUDIO
     * subsystem and fails exactly as softly -- no audio device just
     * means SFX stay silent, same as music above.
     *
     * platform_voice_init() (real numbered VOC voice/narration sample
     * playback, see platform_voice.c's own block comment) is the third
     * and last of these, same soft-fail shape. */
    if (SDL_InitSubSystem(SDL_INIT_AUDIO) != 0) {
        fprintf(stderr, "[gx] SDL_InitSubSystem(SDL_INIT_AUDIO) failed: %s -- music/sfx/voice playback disabled\n",
                SDL_GetError());
    } else {
        platform_music_init();
        platform_sfx_init();
        platform_voice_init();
    }
    g_win = SDL_CreateWindow("Ultima Underworld", SDL_WINDOWPOS_CENTERED,
                              SDL_WINDOWPOS_CENTERED, GX_W * 2, g_display_height * 2,
                              SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (!g_win) {
        fprintf(stderr, "SDL_CreateWindow failed: %s\n", SDL_GetError());
        return 0;
    }
    uw_update_present_refresh_rate();
    {
        int wx = 0, wy = 0, ww = 0, wh = 0;
        SDL_GetWindowPosition(g_win, &wx, &wy);
        SDL_GetWindowSize(g_win, &ww, &wh);
        int numDisplays = SDL_GetNumVideoDisplays();
        fprintf(stderr, "[gx] window created at pos=(%d,%d) size=(%d,%d), %d display(s)\n", wx, wy, ww, wh, numDisplays);
        for (int i = 0; i < numDisplays; i++) {
            SDL_Rect bounds;
            float ddpi = 0, hdpi = 0, vdpi = 0;
            SDL_GetDisplayBounds(i, &bounds);
            SDL_GetDisplayDPI(i, &ddpi, &hdpi, &vdpi);
            fprintf(stderr, "[gx] display %d: bounds=(%d,%d,%d,%d) dpi=(%.1f,%.1f,%.1f)\n",
                    i, bounds.x, bounds.y, bounds.w, bounds.h, ddpi, hdpi, vdpi);
        }
    }
    /* The game sprite replaces the native pointer in desktop cursor mode. */
    if (uw_always_show_cursor()) SDL_ShowCursor(SDL_DISABLE);
    SDL_StartTextInput();
    /* VSYNC matters beyond just avoiding tearing here: several original routines (e.g. fade_in's
       fade-in-from-black transition) pace themselves purely by how long each GXEndDraw-equivalent
       present call naturally takes, with no explicit delay of their own... */
    g_ren = SDL_CreateRenderer(g_win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (!g_ren) g_ren = SDL_CreateRenderer(g_win, -1, SDL_RENDERER_PRESENTVSYNC);
    if (!g_ren) g_ren = SDL_CreateRenderer(g_win, -1, 0);
    {
        SDL_RendererInfo info;
        SDL_GetRendererInfo(g_ren, &info);
        fprintf(stderr, "[gx] renderer=%s vsync=%s\n", info.name,
                (info.flags & SDL_RENDERER_PRESENTVSYNC) ? "yes" : "no");
    }
    SDL_RenderSetLogicalSize(g_ren, GX_W, g_display_height);
    g_tex = SDL_CreateTexture(g_ren, SDL_PIXELFORMAT_RGB565,
                               SDL_TEXTUREACCESS_STREAMING, GX_W, g_display_height);
    memset(g_framebuffer, 0, sizeof(g_framebuffer));
    demomode_init();
    democapture_init();
    return 1;
}

int uw_take_mouse_event_pending(void) {
    int had = g_mouse_event_pending;
    g_mouse_event_pending = 0;
    return had;
}

int uw_inject_mouse_relmotion(int dx, int dy) {
    /* Relative pointer motion, as SDL reports it while mouselook has the pointer captured. */
    if (!g_win) return 0;
    SDL_Event e = {0};
    e.type = SDL_MOUSEMOTION;
    e.motion.which = UW_SYNTH_MOUSE;
    e.motion.xrel = dx;
    e.motion.yrel = dy;
    SDL_PushEvent(&e);
    return 1;
}

int uw_inject_mouse_down(int window_x, int window_y) {
    /* For scripted/unattended testing: pushes a genuine SDL_MOUSEBUTTONDOWN event at the given
       point (window points, not logical/portrait coordinates), so this exercises the exact same
       code path a real click does -- unlike demomode's CLICK command... */
    if (!g_win) return 0;
    SDL_Event down = {0};
    down.type = SDL_MOUSEBUTTONDOWN;
    down.button.button = SDL_BUTTON_LEFT;
    down.button.which = UW_SYNTH_MOUSE;
    down.button.x = window_x;
    down.button.y = window_y;
    SDL_PushEvent(&down);
    return 1;
}

int uw_inject_mouse_up(int window_x, int window_y) {
    /* See uw_inject_mouse_down's comment. */
    if (!g_win) return 0;
    SDL_Event up = {0};
    up.type = SDL_MOUSEBUTTONUP;
    up.button.button = SDL_BUTTON_LEFT;
    up.button.which = UW_SYNTH_MOUSE;
    up.button.x = window_x;
    up.button.y = window_y;
    SDL_PushEvent(&up);
    return 1;
}

int uw_inject_mouse_click(int window_x, int window_y) {
    /* Instantaneous down+up, both already queued before the game ever
     * polls -- see uw_inject_mouse_down's comment for why that's not
     * fully representative of a real click's timing. */
    if (!uw_inject_mouse_down(window_x, window_y)) return 0;
    return uw_inject_mouse_up(window_x, window_y);
}

int uw_inject_mouse_rclick(int window_x, int window_y) {
    /* Right-button down+up (interact). See uw_inject_mouse_down. */
    if (!g_win) return 0;
    for (int up = 0; up < 2; up++) {
        SDL_Event e = {0};
        e.type = up ? SDL_MOUSEBUTTONUP : SDL_MOUSEBUTTONDOWN;
        e.button.button = SDL_BUTTON_RIGHT;
        e.button.which = UW_SYNTH_MOUSE;
        e.button.x = window_x;
        e.button.y = window_y;
        SDL_PushEvent(&e);
    }
    return 1;
}

int uw_inject_mouse_rdown(int window_x, int window_y) {
    /* Right-button half of uw_inject_mouse_rdown/rup, split the same way uw_inject_mouse_down/up
       split the left-button click, for testing a real held right-button drag (grab an object, hold,
       move, release elsewhere) instead of an instantaneous click. */
    if (!g_win) return 0;
    SDL_Event down = {0};
    down.type = SDL_MOUSEBUTTONDOWN;
    down.button.button = SDL_BUTTON_RIGHT;
    down.button.which = UW_SYNTH_MOUSE;
    down.button.x = window_x;
    down.button.y = window_y;
    SDL_PushEvent(&down);
    return 1;
}

int uw_inject_mouse_rup(int window_x, int window_y) {
    if (!g_win) return 0;
    SDL_Event up = {0};
    up.type = SDL_MOUSEBUTTONUP;
    up.button.button = SDL_BUTTON_RIGHT;
    up.button.which = UW_SYNTH_MOUSE;
    up.button.x = window_x;
    up.button.y = window_y;
    SDL_PushEvent(&up);
    return 1;
}

int uw_inject_mouse_motion(int window_x, int window_y) {
    if (!g_win) return 0;
    SDL_Event motion = {0};
    motion.type = SDL_MOUSEMOTION;
    motion.motion.which = UW_SYNTH_MOUSE;
    motion.motion.x = window_x;
    motion.motion.y = window_y;
    SDL_PushEvent(&motion);
    return 1;
}

int uw_inject_key_down(int sdl_keycode) {
    /* For scripted testing of the keyboard path: push a genuine SDL_KEYDOWN (repeat=0) and, for a
       printable key, the matching SDL_TEXTINPUT -- exactly what a real key press produces -- so
       uw_pump_events()'s full key handling runs... */
    if (!g_win) return 0;
    SDL_Scancode sc = SDL_GetScancodeFromKey((SDL_Keycode)sdl_keycode);
    if (sc > 0 && sc < SDL_NUM_SCANCODES) g_synth_scancode_held[sc] = 1;
    SDL_Event kd = {0};
    kd.type = SDL_KEYDOWN;
    kd.key.state = SDL_PRESSED;
    kd.key.repeat = 0;
    kd.key.keysym.sym = (SDL_Keycode)sdl_keycode;
    kd.key.keysym.scancode = sc;
    kd.key.keysym.unused = UW_SYNTH_KEY;
    SDL_PushEvent(&kd);
    if (sdl_keycode >= 32 && sdl_keycode < 127) {
        SDL_Event ti = {0};
        ti.type = SDL_TEXTINPUT;
        ti.text.windowID = UW_SYNTH_KEY;
        ti.text.text[0] = (char)sdl_keycode;
        ti.text.text[1] = '\0';
        SDL_PushEvent(&ti);
    }
    return 1;
}

int uw_inject_key_up(int sdl_keycode) {
    /* See uw_inject_key_down. */
    if (!g_win) return 0;
    SDL_Scancode sc = SDL_GetScancodeFromKey((SDL_Keycode)sdl_keycode);
    if (sc > 0 && sc < SDL_NUM_SCANCODES) g_synth_scancode_held[sc] = 0;
    SDL_Event ku = {0};
    ku.type = SDL_KEYUP;
    ku.key.state = SDL_RELEASED;
    ku.key.repeat = 0;
    ku.key.keysym.sym = (SDL_Keycode)sdl_keycode;
    ku.key.keysym.scancode = sc;
    ku.key.keysym.unused = UW_SYNTH_KEY;
    SDL_PushEvent(&ku);
    return 1;
}

void uw_clear_synth_scancode(int sdl_keycode) {
    /* Clear a synthetic "held" scancode without pushing a real KEYUP event -- for demomode_abort(),
       which deliberately skips uw_inject_key_up on an aborted SDLHOLD (see its own comment: the
       synthetic keyup would just re-enter this same event path). */
    if (!g_win) return;
    SDL_Scancode sc = SDL_GetScancodeFromKey((SDL_Keycode)sdl_keycode);
    if (sc > 0 && sc < SDL_NUM_SCANCODES) g_synth_scancode_held[sc] = 0;
}

int uw_save_screenshot(const char *path) {
    if (!g_ren) return 0;
    int w = 0, h = 0;
    SDL_GetRendererOutputSize(g_ren, &w, &h);
    /* RGB24 (no alpha) rather than ARGB8888 -- some BMP readers (macOS's
       `sips` among them) choke on 32bpp BMPs with an alpha channel. */
    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, w, h, 24, SDL_PIXELFORMAT_RGB24);
    if (!surf) {
        fprintf(stderr, "[gx] screenshot: SDL_CreateRGBSurfaceWithFormat failed: %s\n", SDL_GetError());
        return 0;
    }
    if (SDL_RenderReadPixels(g_ren, NULL, SDL_PIXELFORMAT_RGB24, surf->pixels, surf->pitch) != 0) {
        fprintf(stderr, "[gx] screenshot: SDL_RenderReadPixels failed: %s\n", SDL_GetError());
        SDL_FreeSurface(surf);
        return 0;
    }
    int ok = SDL_SaveBMP(surf, path) == 0;
    if (!ok) {
        fprintf(stderr, "[gx] screenshot: SDL_SaveBMP failed: %s\n", SDL_GetError());
    } else {
        fprintf(stderr, "[gx] screenshot saved to %s (%dx%d)\n", path, w, h);
    }
    SDL_FreeSurface(surf);
    return ok;
}

/* Saves a rectangular region of a raw RGB565 buffer (e.g. a slice of g_uw_framebuffer) to a
   standalone 24bpp BMP file -- same technique as uw_save_screenshot above (build an SDL surface,
   SDL_SaveBMP it)... */
int uw_save_rgb565_region_bmp(const char *path, const unsigned short *pixels,
                               int w, int h, int stride_pixels) {
    if (!pixels || w <= 0 || h <= 0) return 0;
    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, w, h, 24, SDL_PIXELFORMAT_RGB24);
    if (!surf) {
        fprintf(stderr, "[gx] sprite-dump: SDL_CreateRGBSurfaceWithFormat failed: %s\n", SDL_GetError());
        return 0;
    }
    for (int y = 0; y < h; y++) {
        unsigned char *row = (unsigned char *)surf->pixels + y * surf->pitch;
        const unsigned short *src = pixels + (size_t)y * stride_pixels;
        for (int x = 0; x < w; x++) {
            unsigned short px = src[x];
            unsigned r = (px >> 11) & 0x1f;
            unsigned g = (px >> 5) & 0x3f;
            unsigned b = px & 0x1f;
            row[x * 3 + 0] = (unsigned char)(r * 255 / 31);
            row[x * 3 + 1] = (unsigned char)(g * 255 / 63);
            row[x * 3 + 2] = (unsigned char)(b * 255 / 31);
        }
    }
    int ok = SDL_SaveBMP(surf, path) == 0;
    if (!ok) {
        fprintf(stderr, "[gx] sprite-dump: SDL_SaveBMP failed for %s: %s\n", path, SDL_GetError());
    } else {
        fprintf(stderr, "[gx] sprite-dump saved to %s (%dx%d)\n", path, w, h);
    }
    SDL_FreeSurface(surf);
    return ok;
}

static void debug_mkdir_p(const char *path) {
    char buf[300];
    size_t len = strlen(path);
    if (len >= sizeof(buf)) return;
    strcpy(buf, path);
    for (char *p = buf + 1; *p; p++) {
        if (*p == '/') {
            *p = '\0';
            mkdir(buf, 0755);
            *p = '/';
        }
    }
    mkdir(buf, 0755);
}

/* Public wrapper so uw.c's own debug tools (e.g. the sprite-by-frame
 * dumper) can ensure their output directory exists without duplicating
 * this logic. */
void uw_debug_mkdir_p(const char *path) {
    debug_mkdir_p(path);
}

void uw_debug_dump_critter_sprite(int type, int tier, int direction, int frame,
                                   const unsigned char *pixels, int width, int height) {
    /* Only used by --dump-critter-sheet (see debug_shim.c). */
    if (!g_opts.dump_critter_sheet) return;
    if (width <= 0 || height <= 0 || !pixels) return;

    /* decode_critter_sprite_page re-decodes the same (type,tier,direction, frame) combo every
       single frame it's on screen -- dedupe by key so a normal play session doesn't rewrite the
       same file thousands of times. */
    static int seen_keys[4096];
    static int seen_count = 0;
    int key = ((type & 0xff) << 24) ^ ((tier & 0xff) << 16) ^ ((direction & 0xff) << 8) ^ (frame & 0xff);
    for (int i = 0; i < seen_count; i++) {
        if (seen_keys[i] == key) return;
    }
    if (seen_count < (int)(sizeof(seen_keys) / sizeof(seen_keys[0]))) {
        seen_keys[seen_count++] = key;
    }

    char dir[280];
    snprintf(dir, sizeof(dir), "debug/crit/type%02d/tier%d", type, tier);
    debug_mkdir_p(dir);

    char path[320];
    snprintf(path, sizeof(path), "%s/dir%d_frame%d.bmp", dir, direction, frame);

    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, width, height, 8, SDL_PIXELFORMAT_INDEX8);
    if (!surf) {
        fprintf(stderr, "[crit-dump] SDL_CreateRGBSurfaceWithFormat failed: %s\n", SDL_GetError());
        return;
    }

    unsigned char *pal = uw_get_default_palette("crit");
    SDL_Color colors[256];
    for (int i = 0; i < 256; i++) {
        colors[i].r = pal[i * 3 + 0];
        colors[i].g = pal[i * 3 + 1];
        colors[i].b = pal[i * 3 + 2];
        colors[i].a = 255;
    }
    SDL_SetPaletteColors(surf->format->palette, colors, 0, 256);

    for (int y = 0; y < height; y++) {
        memcpy((unsigned char *)surf->pixels + y * surf->pitch, pixels + y * width, width);
    }

    if (SDL_SaveBMP(surf, path) != 0) {
        fprintf(stderr, "[crit-dump] SDL_SaveBMP failed for %s: %s\n", path, SDL_GetError());
    } else {
        fprintf(stderr, "[crit-dump] wrote %s (%dx%d)\n", path, width, height);
    }
    SDL_FreeSurface(surf);
}

/* Shared by debug_framebuffer_dump and uw_debug_dump_3d_face below --
   both just want "snapshot g_uw_framebuffer to this path as a BMP",
   differing only in when they're gated/named. */
static void debug_save_framebuffer_bmp(const char *path, const char *log_tag) {
    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, GX_W, GX_H, 16, SDL_PIXELFORMAT_RGB565);
    if (!surf) {
        fprintf(stderr, "[%s] SDL_CreateRGBSurfaceWithFormat failed: %s\n", log_tag, SDL_GetError());
        return;
    }
    memcpy(surf->pixels, g_uw_framebuffer, (size_t)GX_W * GX_H * 2);
    if (SDL_SaveBMP(surf, path) != 0) {
        fprintf(stderr, "[%s] SDL_SaveBMP failed for %s: %s\n", log_tag, path, SDL_GetError());
    }
    SDL_FreeSurface(surf);
}


/* Debug tool: armed by the "dump_3d_frame" button in the UW_MODEL_TUNER debug panel
   (dbgui_field_button, see debug_ui.c) via uw_debug_request_3d_frame_dump() -- captures every
   individual 3D face raster_triangle call for exactly the next render_visible_tile_list() pass... */
static int g_dump_3d_frame_active = 0;
/* -1 = never armed yet this process; otherwise the number of faces the MOST RECENTLY COMPLETED
   capture actually wrote -- surfaced on the debug panel's button row (see uw.c's tuner block) so
   pressing it has a visible result even though the capture itself is silent... */
static int g_dump_3d_frame_last_count = -1;
static unsigned int g_dump_3d_frame_counter = 0;
static char g_dump_3d_frame_run_dir[300];

void uw_debug_dump_3d_face(const char *tag) {
    if (!g_dump_3d_frame_active) return;

    char path[360];
    snprintf(path, sizeof(path), "%s/%06u_%s.bmp", g_dump_3d_frame_run_dir, g_dump_3d_frame_counter++, tag ? tag : "face");
    debug_save_framebuffer_bmp(path, "face-dump");
}

void uw_debug_request_3d_frame_dump(void) {
    static unsigned int capture_index = 0;
    time_t now = time(NULL);
    struct tm tm_now;
    localtime_r(&now, &tm_now);
    char ts[32];
    strftime(ts, sizeof(ts), "%Y%m%d_%H%M%S", &tm_now);
    snprintf(g_dump_3d_frame_run_dir, sizeof(g_dump_3d_frame_run_dir),
             "debug/facedumps/%s_%03u", ts, capture_index++);
    debug_mkdir_p(g_dump_3d_frame_run_dir);
    g_dump_3d_frame_counter = 0;
    g_dump_3d_frame_active = 1;
    fprintf(stderr, "[face-dump] requested -- capturing every 3D face draw for the next render pass into %s\n",
            g_dump_3d_frame_run_dir);
}

int uw_debug_3d_frame_dump_finish(void) {
    if (!g_dump_3d_frame_active) return -1;
    g_dump_3d_frame_last_count = (int)g_dump_3d_frame_counter;
    fprintf(stderr, "[face-dump] frame capture complete -- %d faces written to %s\n",
            g_dump_3d_frame_last_count, g_dump_3d_frame_run_dir);
    g_dump_3d_frame_active = 0;
    return g_dump_3d_frame_last_count;
}

const char *uw_debug_3d_frame_dump_last_dir(void) {
    return g_dump_3d_frame_run_dir;
}

int GXCloseDisplay(void) {
    fprintf(stderr, "[gx] GXCloseDisplay\n");
    if (uw_always_show_cursor()) SDL_ShowCursor(SDL_ENABLE);
    if (g_tex) { SDL_DestroyTexture(g_tex); g_tex = NULL; }
    if (g_ren) { SDL_DestroyRenderer(g_ren); g_ren = NULL; }
    if (g_win) { SDL_DestroyWindow(g_win); g_win = NULL; }
    return 1;
}

void *GXBeginDraw(void) {
    static int logged = 0;
    if (!logged) {
        fprintf(stderr, "[gx] GXBeginDraw: game locking framebuffer for the first time "
                        "(further calls not logged, this runs every frame)\n");
        logged = 1;
    }
    if (!g_running) { democapture_shutdown(); exit(0); }
    return g_framebuffer;
}

struct uw_present_state {
    unsigned batch_depth, modal_depth, suspend_depth;
    int pending, saved_force_flush, completed_frame;
};
static struct uw_present_state g_present_state = {0};

void uw_begin_present_batch()
{
    g_present_state.batch_depth++;
}

void uw_end_present_batch()
{
    if (g_present_state.batch_depth == 0) return;
    if (--g_present_state.batch_depth == 0 && g_present_state.pending) {
        g_present_state.pending = 0;
        GXEndDraw();
    }
}

void gfx_finalizedraw()
{
    /* Port timing deviation: completed frames bypass the software deadline;
       SDL vsync handles their wait. Ordinary cursor/intermediate flushes retain
       pacing. A nested render cannot force its unfinished outer frame out. */
    g_present_state.completed_frame = 1;
    if (g_present_state.batch_depth) {
        g_present_state.pending = 1;
        uw_end_present_batch();
    } else {
        GXEndDraw();
    }
}

int uw_take_completed_frame()
{
    if (g_present_state.batch_depth) return 0;
    int completed = g_present_state.completed_frame;
    g_present_state.completed_frame = 0;
    return completed;
}

void uw_suspend_present_batch()
{
    g_present_state.suspend_depth++;
}

void uw_resume_present_batch()
{
    if (g_present_state.suspend_depth) g_present_state.suspend_depth--;
}

void uw_begin_modal_present()
{
    if (g_present_state.modal_depth++ == 0) {
        g_present_state.saved_force_flush = g_force_flush;
        /* Selected objects and held clicks gate ordinary HUD flushes. */
        g_force_flush = 1;
    }
}

void uw_end_modal_present()
{
    if (g_present_state.modal_depth == 0) return;
    if (--g_present_state.modal_depth == 0)
        g_force_flush = g_present_state.saved_force_flush;
}

int uw_defer_present()
{
    if (g_present_state.batch_depth && !g_present_state.modal_depth &&
        !g_present_state.suspend_depth) {
        g_present_state.pending = 1;
        return 1;
    }
    /* An immediate presentation consumes any earlier pending request. */
    g_present_state.pending = 0;
    return 0;
}

int GXEndDraw(void) {
    if (uw_defer_present()) return 1;
    int completed_frame = uw_take_completed_frame();
    if (!g_tex) return 0;
    if (!completed_frame && !uw_present_frame_due(uw_gx_time_us())) return 1;
    /* Early flushes return above without presenting or waiting on another vsync. */
    /* Un-rotate the portrait "hardware" framebuffer back to a natural landscape image for display
       -- see the HW_W/HW_H comment above. landscape(x,y) = portrait((HW_W-1-x), y), i.e. the
       inverse of the clockwise rotation the game's own blit performs. */
    for (int y = 0; y < GX_H; y++) {
        for (int x = 0; x < GX_W; x++) {
            g_display_buf[y * GX_W + x] = g_framebuffer[(HW_H - 1 - x) * HW_W + y];
        }
    }
    uw_composite_desktop_cursor(g_display_buf);
    SDL_UpdateTexture(g_tex, NULL, g_display_buf, GX_W * sizeof(unsigned short));
    SDL_RenderClear(g_ren);
    SDL_RenderCopy(g_ren, g_tex, NULL, NULL);
    SDL_RenderPresent(g_ren);
    if (completed_frame) uw_record_completed_present(uw_gx_time_us());


    return 1;
}

int GXOpenInput(void) { fprintf(stderr, "[gx] GXOpenInput\n"); return 1; }
int GXCloseInput(void) { fprintf(stderr, "[gx] GXCloseInput\n"); return 1; }
int GXSuspend(void) { fprintf(stderr, "[gx] GXSuspend (window lost focus)\n"); return 1; }
int GXResume(void) { fprintf(stderr, "[gx] GXResume (window gained focus)\n"); return 1; }

void *GXGetDisplayProperties(void) {
    fprintf(stderr, "[gx] GXGetDisplayProperties: reporting %dx%d 16bpp RGB565 (portrait "
                    "hardware framebuffer; presented rotated to a %dx%d landscape window)\n",
            HW_W, HW_H, GX_W, g_display_height);
    static GxDisplayProps props;
    props.cxWidth = HW_W;
    props.cyHeight = HW_H;
    props.cbxPitch = 2;
    props.cbyPitch = HW_W * 2;
    props.cBPP = 16;
    props.ffFormat = KF_DIRECT565;
    return &props;
}

void *GXGetDefaultKeys(void *outBuffer) {
    fprintf(stderr, "[gx] GXGetDefaultKeys: mapping arrows/esc to the game's "
                    "D-pad and B button (A/C/Start left unbound -- see below)\n");
    GxKeyList *kl = (GxKeyList *)outBuffer;
    if (!kl) return outBuffer;
    memset(kl, 0, sizeof(*kl));
    /* Button A was VK_SPACE, which collided with typing a space in the name-entry field (with the
       struct's real field order -- see GxKeyList's own comment -- handle_keyboard_message turns a
       button-A keydown into event 0xd = Enter, not a delete like an earlier)... */
    kl->a.vk = VK_APP1;
    kl->b.vk = VK_ESCAPE;
    kl->c.vk = VK_CONTROL;
    kl->start.vk = VK_RETURN;
    /* Swapped from the "obvious" kl->up.vk=VK_UP/kl->down.vk=VK_DOWN -- confirmed by QA after the
       struct-order fix above that Up/Down felt backwards in the menu (the collision with Enter/Esc
       was gone, but the surviving direction was flipped). */
    kl->up.vk = VK_DOWN;
    kl->down.vk = VK_UP;
    kl->left.vk = VK_LEFT;
    kl->right.vk = VK_RIGHT;
    return outBuffer;
}


/* Side-effect-free PALS.DAT read: raw 6-bit bytes for one palette index, scaled to 8-bit RGB into
   out_rgb (768 bytes). */
static int uw_load_pals_dat_scaled(int pal_index, unsigned char *out_rgb) {
    unsigned char raw[768];
    undefined4 handle = open_file_for_read("\\DATA\\pals.dat");
    seek_file_handle(handle, pal_index * 0x300, 0);
    short got = (short)read_file_handle(handle, raw, 0x300);
    CloseHandle(handle);
    if (got != 0x300) return 0;
    expand_pals_bytes(out_rgb, raw, 0);
    return 1;
}

/* Debug-only accessor for gx_stub.c's GR-entry BMP dumper, keyed by the .GR resource's base name
   (e.g. "chrbtns"). */
unsigned char *uw_get_default_palette(const char *gr_name) {
    static const struct { const char *name; int pal_index; } overrides[] = {
        {"chrbtns", 3},
    };
    static unsigned char rgb[768];

    for (size_t i = 0; i < sizeof(overrides) / sizeof(overrides[0]); i++) {
        if (strcmp(gr_name, overrides[i].name) == 0) {
            if (uw_load_pals_dat_scaled(overrides[i].pal_index, rgb)) {
                return rgb;
            }
            break; /* fall through to the live read if the load failed */
        }
    }

    unsigned short *pal565 = (unsigned short *)g_palette_rgb565_backing;
    for (int i = 0; i < 256; i++) {
        unsigned short p = pal565[i];
        unsigned char r5 = (p >> 11) & 0x1f;
        unsigned char g6 = (p >> 5) & 0x3f;
        unsigned char b5 = p & 0x1f;
        rgb[i * 3 + 0] = (r5 << 3) | (r5 >> 2);
        rgb[i * 3 + 1] = (g6 << 2) | (g6 >> 4);
        rgb[i * 3 + 2] = (b5 << 3) | (b5 >> 2);
    }
    return rgb;
}

/* See demomode.h. */
#include "headers/demomode.h"
#include "headers/debug_ui.h"
#include "headers/options.h"
#include "headers/uw.h"

#include <SDL.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

/* DAT_00110fc0 is a byte-cursor written through directly by other functions too (e.g.
   init_dungeon_rendering: `*DAT_00110fc0 = 0; DAT_00110fc0 = DAT_00110fc0 + 1;`), not just by
   init_glyph_width_table... */
char DAT_00110fc0_scratch[65536];

#define VK_UP 0x26
#define VK_DOWN 0x28
#define VK_LEFT 0x25
#define VK_RIGHT 0x27
#define VK_RETURN 0x0D
#define VK_SPACE 0x20
#define VK_CONTROL 0x11
#define VK_ESCAPE 0x1B
#define VK_BACK 0x08

#define DEMO_DEFAULT_DELAY_MS 250

static FILE *g_demo_file;
static Uint32 g_demo_next_tick;
static int g_demo_delay_ms = DEMO_DEFAULT_DELAY_MS;
static int g_demo_active;
static int g_demo_done;

/* When a "TYPE <text>" line is in progress, feed one character per pump
 * tick (rather than the whole string at once) so it plays back at the
 * same pace as other inputs and interleaves realistically. */
static char g_demo_type_buf[256];
static const char *g_demo_type_pos;

/* HOLD <KEY> <ticks> state: g_demo_hold_vk is the VK code currently "held" (0 = nothing),
   g_demo_hold_ticks is how many more idle pump ticks to wait before releasing it.
   g_demo_hold_is_sdl distinguishes a SDLHOLD... */
static int g_demo_hold_vk;
static int g_demo_hold_ticks;
static int g_demo_hold_is_sdl;

/* Set when the current SDLHOLD is a "SHIFT+<key>" combo (see SDLHOLD parsing below) -- SDLK_LSHIFT
   was injected down alongside g_demo_hold_vk and needs releasing alongside it, in the same up/abort
   paths. */
static int g_demo_hold_shift;

/* WAIT <ticks> state: how many more idle pump ticks to burn with no
 * input at all before reading the next line. */
static int g_demo_wait_ticks;

/* All demo diagnostics go through here: stderr as before, plus the debug console's scrollback so
   a command typed there shows its own output. */
static void demo_printf(const char *fmt, ...) {
    char buf[1024];
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, sizeof(buf), fmt, ap);
    va_end(ap);
    fputs(buf, stderr);
    dbgui_console_print(buf);
}

/* Lines typed into the debug console. They run through the same executor as demofile lines
   (demo_exec_line), paced by the same pump, so every demofile command works there unchanged. */
#define CONSOLE_QUEUE_MAX 32
#define CONSOLE_DELAY_MS 30
static char g_console_queue[CONSOLE_QUEUE_MAX][256];
static int g_console_q_head, g_console_q_count;

static void demomode_console_submit(const char *line) {
    if (g_console_q_count >= CONSOLE_QUEUE_MAX) {
        dbgui_console_print("command queue full, line dropped");
        return;
    }
    char *dst = g_console_queue[(g_console_q_head + g_console_q_count) % CONSOLE_QUEUE_MAX];
    strncpy(dst, line, 255);
    dst[255] = '\0';
    g_console_q_count++;
}

static int demo_console_pop(char *out, size_t n) {
    if (g_console_q_count == 0) return 0;
    strncpy(out, g_console_queue[g_console_q_head], n - 1);
    out[n - 1] = '\0';
    g_console_q_head = (g_console_q_head + 1) % CONSOLE_QUEUE_MAX;
    g_console_q_count--;
    return 1;
}

/* "NAME" or "NAME <arg>" (any case) -> 1 and *arg = the trimmed argument ("" if none). */
static int demo_match_cmd(const char *p, const char *name, const char **arg) {
    size_t n = strlen(name);
    if (strncasecmp(p, name, n) != 0) return 0;
    if (p[n] != '\0' && p[n] != ' ' && p[n] != '\t') return 0;
    p += n;
    while (*p == ' ' || *p == '\t') p++;
    *arg = p;
    return 1;
}

/* Optional on/off argument for the mode commands: none toggles. Returns -1 if unparseable. */
static int demo_parse_onoff(const char *arg, int current) {
    if (*arg == '\0') return !current;
    if (strcasecmp(arg, "on") == 0 || strcmp(arg, "1") == 0) return 1;
    if (strcasecmp(arg, "off") == 0 || strcmp(arg, "0") == 0) return 0;
    return -1;
}

static int demo_translate_vk(const char *name) {
    if (strcasecmp(name, "UP") == 0) return VK_UP;
    if (strcasecmp(name, "DOWN") == 0) return VK_DOWN;
    if (strcasecmp(name, "LEFT") == 0) return VK_LEFT;
    if (strcasecmp(name, "RIGHT") == 0) return VK_RIGHT;
    if (strcasecmp(name, "ENTER") == 0 || strcasecmp(name, "RETURN") == 0) return VK_RETURN;
    if (strcasecmp(name, "SPACE") == 0) return VK_SPACE;
    if (strcasecmp(name, "CTRL") == 0 || strcasecmp(name, "CONTROL") == 0) return VK_CONTROL;
    if (strcasecmp(name, "ESC") == 0 || strcasecmp(name, "ESCAPE") == 0) return VK_ESCAPE;
    if (strcasecmp(name, "BACKSPACE") == 0 || strcasecmp(name, "BACK") == 0) return VK_BACK;
    /* Single letter or digit -> its Windows VK code (VK_A..VK_Z == 'A'..'Z' == 0x41..0x5A,
       VK_0..VK_9 == '0'..'9'). */
    if (name[0] && name[1] == '\0') {
        unsigned char c = (unsigned char)name[0];
        if (c >= 'a' && c <= 'z') return c - 'a' + 'A';
        if ((c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')) return c;
    }
    /* 0xNN / decimal -> raw key/command code, for the GAPI D-pad movement
       codes (0x8d/0x8f/0x91/0x93) and anything else bound directly. */
    if ((name[0] == '0' && (name[1] == 'x' || name[1] == 'X')) ||
        (name[0] >= '0' && name[0] <= '9')) {
        long v = strtol(name, NULL, 0);
        if (v > 0 && v < 0x400) return (int)v;
    }
    return 0;
}

/* Shared SDL_Keycode name parser for SDLHOLD/RAWKEY/SDLKEYDOWN/SDLKEYUP (previously duplicated
   inline in SDLHOLD and RAWKEY separately). */
static int demo_translate_sdlkey(const char *name) {
    if (name[0] && name[1] == '\0') {
        unsigned char c = (unsigned char)name[0];
        if (c >= 'A' && c <= 'Z') c = (unsigned char)(c - 'A' + 'a');
        return c;
    }
    if (strcasecmp(name, "LEFT") == 0)      return SDLK_LEFT;
    if (strcasecmp(name, "RIGHT") == 0)     return SDLK_RIGHT;
    if (strcasecmp(name, "UP") == 0)        return SDLK_UP;
    if (strcasecmp(name, "DOWN") == 0)      return SDLK_DOWN;
    if (strcasecmp(name, "RETURN") == 0 || strcasecmp(name, "ENTER") == 0) return SDLK_RETURN;
    if (strcasecmp(name, "ESCAPE") == 0 || strcasecmp(name, "ESC") == 0)   return SDLK_ESCAPE;
    if (strcasecmp(name, "SPACE") == 0)     return SDLK_SPACE;
    if (strcasecmp(name, "BACKSPACE") == 0 || strcasecmp(name, "BACK") == 0) return SDLK_BACKSPACE;
    if (strcasecmp(name, "TAB") == 0)       return SDLK_TAB;
    if (strcasecmp(name, "SHIFT") == 0 || strcasecmp(name, "LSHIFT") == 0)  return SDLK_LSHIFT;
    if (strcasecmp(name, "RSHIFT") == 0)    return SDLK_RSHIFT;
    if (strcasecmp(name, "CTRL") == 0 || strcasecmp(name, "LCTRL") == 0 || strcasecmp(name, "CONTROL") == 0) return SDLK_LCTRL;
    if (strcasecmp(name, "RCTRL") == 0)     return SDLK_RCTRL;
    if ((name[0] == '0' && (name[1] == 'x' || name[1] == 'X')) ||
        (name[0] >= '0' && name[0] <= '9')) {
        long v = strtol(name, NULL, 0);
        if (v > 0) return (int)v;
    }
    return 0;
}

/* A debug window closing: don't trust its saved pixels (the game redraws the HUD underneath while
   it is open) -- force a full HUD/inventory repaint and flag the whole screen dirty. */
static void demomode_console_closed(void) {
    redraw_hud_panels();
    redraw_active_hud_panel();
    redraw_container_icon_slot();
    set_pending_update_flags(0x7ffe);
    dirty_rect_union(0, 200, 0, 0x140);
}

void demomode_init(void) {
    dbgui_console_set_handler(demomode_console_submit);
    dbgui_console_set_close_hook(demomode_console_closed);
    const char *path = g_opts.demo_file;
    if (!path) return;

    g_demo_file = fopen(path, "r");
    if (!g_demo_file) {
        demo_printf("[cmd] failed to open --demo-file=%s\n", path);
        return;
    }

    if (UW_OPT_ISSET(g_opts.demo_delay_ms)) {
        int v = g_opts.demo_delay_ms;
        /* v==0 is a real, meaningful value (see demomode_pump's own
           comment: no wall-clock gate at all, one line per real pump
           call) -- only reject a negative/malformed value, not zero. */
        if (v >= 0) g_demo_delay_ms = v;
    }

    g_demo_active = 1;
    g_demo_next_tick = SDL_GetTicks() + (Uint32)g_demo_delay_ms;
    demo_printf("[cmd] playing back input from %s (delay=%dms)\n", path, g_demo_delay_ms);
}

int demomode_active(void) {
    return g_demo_active && !g_demo_done;
}

void demomode_abort(const char *reason) {
    if (!g_demo_active || g_demo_done) return;

    /* If a HOLD left a key pressed, release it now so the game doesn't think it's still down after
       playback stops. (A SDLHOLD's KEYUP is skipped -- an abort is an abort, and the synthetic
       keyup would just re-enter this same event path.) */
    if (g_demo_hold_vk != 0 && !g_demo_hold_is_sdl) {
        handle_keyboard_message(0, 0x101u, (unsigned int)g_demo_hold_vk);
    }
    if (g_demo_hold_shift) {
        uw_clear_synth_scancode(SDLK_LSHIFT);
    }
    g_demo_hold_vk = 0;
    g_demo_hold_is_sdl = 0;
    g_demo_hold_shift = 0;
    g_demo_hold_ticks = 0;
    g_demo_type_pos = NULL;
    g_demo_type_buf[0] = '\0';
    g_demo_wait_ticks = 0;

    g_demo_done = 1;
    g_demo_active = 0;
    if (g_demo_file) {
        fclose(g_demo_file);
        g_demo_file = NULL;
    }
    demo_printf("[cmd] aborted (%s) -- playback stopped, window still live\n",
            reason ? reason : "requested");
}

/* True while a HOLD/WAIT/TYPE started by an earlier line is still running out its ticks. */
static int demo_mid_action(void) {
    return g_demo_wait_ticks > 0 || g_demo_hold_vk != 0 || (g_demo_type_pos && *g_demo_type_pos);
}

static void demo_exec_line(char *p, Uint32 now);

void demomode_pump(void) {
    int file_live = g_demo_active && !g_demo_done;
    if (!file_live && g_console_q_count == 0 && !demo_mid_action()) return;
    Uint32 now = SDL_GetTicks();
    /* g_demo_delay_ms == 0 (via a DELAY 0 line or --demo-delay-ms=0) means tick-native playback:
       no wall-clock gate at all, process exactly one line every real uw_pump_events() call -- the
       same tick source democapture.c's recorder counts against (see its own top comment)... */
    if (g_demo_delay_ms > 0 && now < g_demo_next_tick) return;

    /* Mid-WAIT: burn one idle tick with no input at all, letting
     * whatever the game's own idle-tick dispatch does run on its own --
     * unlike HOLD, nothing is pressed during this. */
    if (g_demo_wait_ticks > 0) {
        g_demo_wait_ticks--;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    /* Mid-HOLD: the key's KEYDOWN was already sent when the HOLD line was first read (below); every
       tick until the countdown reaches 0 just idles (no new input fed at all, matching a real held
       key generating no fresh keydown/keyup), then releases on the last one. */
    if (g_demo_hold_vk != 0) {
        if (g_demo_hold_ticks > 0) {
            g_demo_hold_ticks--;
            g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
            return;
        }
        demo_printf("[cmd] releasing held key %s=0x%x\n",
                g_demo_hold_is_sdl ? "sdlkey" : "vk", g_demo_hold_vk);
        if (g_demo_hold_is_sdl) {
            uw_inject_key_up(g_demo_hold_vk);
        } else {
            handle_keyboard_message(0, 0x101u, (unsigned int)g_demo_hold_vk);
        }
        if (g_demo_hold_shift) {
            demo_printf("[cmd] releasing held SHIFT\n");
            uw_inject_key_up(SDLK_LSHIFT);
        }
        g_demo_hold_vk = 0;
        g_demo_hold_is_sdl = 0;
        g_demo_hold_shift = 0;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    /* Mid-TYPE: send the next character (as a real WM_CHAR, matching
     * SDL_TEXTINPUT's forwarding in gx_stub.c) and come back next tick
     * for the rest, rather than dumping the whole string in one frame. */
    if (g_demo_type_pos && *g_demo_type_pos) {
        unsigned char c = (unsigned char)*g_demo_type_pos++;
        demo_printf("[cmd] typing '%c'\n", c);
        handle_keyboard_message(0, 0x102u, (unsigned int)c);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }
    g_demo_type_pos = NULL;

    char line[256];
    if (demo_console_pop(line, sizeof(line))) {
        /* A console line when no demofile is pacing things: type/hold at a usable speed rather than
           the 250ms-per-line playback default. A DELAY line can still change it. */
        if (!file_live) g_demo_delay_ms = CONSOLE_DELAY_MS;
    } else if (!file_live) {
        return;
    } else if (!fgets(line, sizeof(line), g_demo_file)) {
        g_demo_done = 1;
        fclose(g_demo_file);
        g_demo_file = NULL;
        /* Quitting here (instead of idling with the window still open) makes scripted test runs
           self-terminating -- pass --demo-keep-running to keep the window open after playback
           finishes (e.g. to keep manually poking at the resulting state). */
        if (!g_opts.demo_keep_running) {
            demo_printf("[cmd] end of input, exiting\n");
            exit(0);
        }
        demo_printf("[cmd] end of input, stopping playback\n");
        return;
    }

    char *nl = strpbrk(line, "\r\n");
    if (nl) *nl = '\0';
    char *p = line;
    while (*p == ' ' || *p == '\t') p++;
    demo_exec_line(p, now);
}

/* Runs one demofile-syntax line: everything from the command dispatch down. Shared by demofile
   playback and the debug console. Sets g_demo_next_tick for the pump's pacing. */
static void demo_exec_line(char *p, Uint32 now) {
    if (*p == '\0' || *p == '#') {
        /* Blank/comment line -- retry immediately on the next pump
         * instead of burning a full delay slot on nothing. */
        g_demo_next_tick = now;
        return;
    }

    if (strncasecmp(p, "DELAY ", 6) == 0) {
        /* Sets the per-line pacing (same units/effect as --demo-delay-ms) from WITHIN the file
           itself, taking effect immediately (this line's own retry, and every line after it, use
           the new value)... */
        int ms = -1;
        if (sscanf(p + 6, "%d", &ms) != 1 || ms < 0) {
            demo_printf("[cmd] malformed DELAY line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] setting delay=%dms\n", ms);
        g_demo_delay_ms = ms;
        g_demo_next_tick = now;
        return;
    }

    if (strncasecmp(p, "WAIT ", 5) == 0) {
        int ticks = 0;
        if (sscanf(p + 5, "%d", &ticks) != 1 || ticks < 0) {
            demo_printf("[cmd] malformed WAIT line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] waiting %d idle ticks\n", ticks);
        g_demo_wait_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "HOLD ", 5) == 0) {
        char keyname[32];
        int ticks = 0;
        if (sscanf(p + 5, "%31s %d", keyname, &ticks) != 2 || ticks < 0) {
            demo_printf("[cmd] malformed HOLD line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int vk = demo_translate_vk(keyname);
        if (vk == 0) {
            demo_printf("[cmd] HOLD: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] holding %s (vk=0x%x) for %d ticks\n", keyname, vk, ticks);
        handle_keyboard_message(0, 0x100u, (unsigned int)vk);
        g_demo_hold_vk = vk;
        g_demo_hold_is_sdl = 0;
        g_demo_hold_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLHOLD ", 8) == 0) {
        /* Like HOLD, but pushes a real SDL_KEYDOWN (+ SDL_TEXTINPUT for a printable key) now and a
           real SDL_KEYUP after <ticks>, so the whole gx_stub.c key path runs -- unlike HOLD, which
           calls handle_keyboard_message directly. */
        char keyname[32];
        int ticks = 0;
        if (sscanf(p + 8, "%31s %d", keyname, &ticks) != 2 || ticks < 0) {
            demo_printf("[cmd] malformed SDLHOLD line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int want_shift = 0;
        char *plus = strchr(keyname, '+');
        if (plus) {
            *plus = '\0';
            if (strcasecmp(keyname, "SHIFT") != 0) {
                demo_printf("[cmd] SDLHOLD: unrecognized modifier '%s', skipping\n", keyname);
                g_demo_next_tick = now;
                return;
            }
            want_shift = 1;
            memmove(keyname, plus + 1, strlen(plus + 1) + 1);
        }
        int kc = demo_translate_sdlkey(keyname);
        if (kc == 0) {
            demo_printf("[cmd] SDLHOLD: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        if (want_shift) {
            demo_printf("[cmd] SDL-holding SHIFT+%s (sdlkey=0x%x) for %d ticks\n", keyname, kc, ticks);
            uw_inject_key_down(SDLK_LSHIFT);
        } else {
            demo_printf("[cmd] SDL-holding %s (sdlkey=0x%x) for %d ticks\n", keyname, kc, ticks);
        }
        uw_inject_key_down(kc);
        g_demo_hold_vk = kc;
        g_demo_hold_is_sdl = 1;
        g_demo_hold_shift = want_shift;
        g_demo_hold_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "RAWKEY ", 7) == 0) {
        /* Push a single UNTAGGED SDL_KEYDOWN+SDL_KEYUP -- i.e. exactly what a human at the keyboard
           produces, with no UW_SYNTH_KEY stamp. */
        char keyname[32];
        if (sscanf(p + 7, "%31s", keyname) != 1) {
            demo_printf("[cmd] malformed RAWKEY line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int kc = demo_translate_sdlkey(keyname);
        if (kc == 0) {
            demo_printf("[cmd] RAWKEY: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] RAWKEY %s (sdlkey=0x%x)\n", keyname, kc);
        SDL_Event e = {0};
        e.type = SDL_KEYDOWN;
        e.key.state = SDL_PRESSED;
        e.key.repeat = 0;
        e.key.keysym.sym = (SDL_Keycode)kc;
        e.key.keysym.scancode = SDL_GetScancodeFromKey((SDL_Keycode)kc);
        SDL_PushEvent(&e);
        e.type = SDL_KEYUP;
        e.key.state = SDL_RELEASED;
        SDL_PushEvent(&e);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLKEYDOWN ", 11) == 0) {
        /* Independent, real (tagged) SDL_KEYDOWN with no matching-line- declared release -- unlike
           SDLHOLD (which takes its own hold duration up front), the release is a SEPARATE later
           SDLKEYUP line. */
        char keyname[32];
        if (sscanf(p + 11, "%31s", keyname) != 1) {
            demo_printf("[cmd] malformed SDLKEYDOWN line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int kc = demo_translate_sdlkey(keyname);
        if (kc == 0) {
            demo_printf("[cmd] SDLKEYDOWN: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] SDLKEYDOWN %s (sdlkey=0x%x)\n", keyname, kc);
        uw_inject_key_down(kc);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLKEYUP ", 9) == 0) {
        /* See SDLKEYDOWN. */
        char keyname[32];
        if (sscanf(p + 9, "%31s", keyname) != 1) {
            demo_printf("[cmd] malformed SDLKEYUP line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int kc = demo_translate_sdlkey(keyname);
        if (kc == 0) {
            demo_printf("[cmd] SDLKEYUP: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] SDLKEYUP %s (sdlkey=0x%x)\n", keyname, kc);
        uw_inject_key_up(kc);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "TYPE ", 5) == 0) {
        const char *text = p + 5;
        strncpy(g_demo_type_buf, text, sizeof(g_demo_type_buf) - 1);
        g_demo_type_buf[sizeof(g_demo_type_buf) - 1] = '\0';
        demo_printf("[cmd] queued typing '%s'\n", g_demo_type_buf);
        g_demo_type_pos = g_demo_type_buf;
        /* Retry immediately so the first character goes out on the next
         * pump rather than burning a delay slot on the TYPE line itself. */
        g_demo_next_tick = now;
        return;
    }

    if (strncasecmp(p, "TELEPORT ", 9) == 0) {
        /* TELEPORT <x> <y> [level] -- with a level, queues the same level change a teleport trap
           does (teleport_object_to_level_tile: flood-fills a free spot near x,y on the new level
           and runs the real level transition on the next tick). Without one, moves within the
           current level directly. */
        int tx = 0, ty = 0, level = 0;
        int n = sscanf(p + 9, "%d %d %d", &tx, &ty, &level);
        if (n < 2) {
            demo_printf("[cmd] malformed TELEPORT line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        if (n == 3) {
            if (level < 1 || level > 9) {
                demo_printf("[cmd] TELEPORT: level %d out of range 1-9, skipping\n", level);
                g_demo_next_tick = now;
                return;
            }
            demo_printf("[cmd] teleporting to tile (%d,%d) on level %d\n", tx, ty, level);
            teleport_object_to_level_tile(g_player_object, tx, ty, (short)level);
            /* Run the queued transition now (the way player.c's own teleports do) rather than
               waiting for the pending-flag dispatch. */
            dungeon_view_anim_tick();
        } else {
            demo_printf("[cmd] teleporting to tile (%d,%d)\n", tx, ty);
            set_player_tile_position(tx, ty, 1);
        }
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "GOTOLEVEL ", 10) == 0) {
        /* GOTOLEVEL <level> -- load another level and put the player on exactly the same tile.
           Unlike a teleport trap (TELEPORT x y level), which flood-fills for a free spot and kills
           the player if it finds none, this never moves the player; if that tile happens to be
           solid on the new level it just says so. */
        extern short DAT_00201b68;
        int level = 0;
        if (sscanf(p + 10, "%d", &level) != 1 || level < 1 || level > 9) {
            demo_printf("[cmd] GOTOLEVEL: need a level number 1-9, got '%s'\n", p + 10);
        } else if (level == DAT_00201b68) {
            demo_printf("[cmd] already on level %d\n", level);
        } else {
            int tx = g_player_object->tile_x, ty = g_player_object->tile_y;
            demo_printf("[cmd] going to level %d at tile (%d,%d)\n", level, tx, ty);
            if (transition_to_level(DAT_00201b68, level) == 0) {
                demo_printf("[cmd] GOTOLEVEL: level %d failed to load\n", level);
            } else {
                DAT_00201b68 = (short)level;
                set_player_tile_position(tx, ty, 1);
                unsigned char *tile = (unsigned char *)tilemap_lookup(tx, ty);
                if (tile && (tile[0] & 0xf) == 0)
                    demo_printf("[cmd] note: tile (%d,%d) is solid on level %d\n", tx, ty, level);
                full_dungeon_redraw();
                set_pending_update_flags(0x7ffe);
            }
        }
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SETPLAYERPOS ", 13) == 0) {
        double x = 0, y = 0, z = 0, yaw = 0, pitch = 0;
        if (sscanf(p + 13, "%lf %lf %lf %lf %lf", &x, &y, &z, &yaw, &pitch) != 5) {
            demo_printf("[cmd] malformed SETPLAYERPOS line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        demo_printf("[cmd] SETPLAYERPOS tile=(%.3f,%.3f) z=%.0f yaw=%.1f pitch=%.1f\n",
                x, y, z, yaw, pitch);
        demo_set_player_pos(x, y, z, yaw, pitch);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "OPENMAP") == 0) {
        /* set_game_mode(2) is the real mode switch: g_game_mode = 2 maps to game-mode index
           g_mode_handler_row = 1 (the automap), whose entry handler in DAT_00085668's mode-1 row is
           enter_automap_screen. */
        demo_printf("[cmd] switching to automap mode (change_game_mode(2))\n");
        change_game_mode(2);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "REVEAL") == 0) {
        /* Calls full_dungeon_redraw (the "full dungeon redraw" wrapper, directly at the player's
           current position. */
        // was FUN_0005bb5c
        demo_printf("[cmd] forcing a full dungeon redraw (automap reveal update)\n");
        {
            /* Print the player's tile so a scripted TELEPORT/REVEAL sweep
               can be correlated with what's on screen. */
            extern uw_mobile_object_t *g_player_object;
            unsigned short *pl = (unsigned short *)g_player_object;
            if (pl)
                demo_printf("[cmd] player tile = (%d,%d)\n",
                        ((uw_mobile_object_t *)pl)->tile_x,
                        ((uw_mobile_object_t *)pl)->tile_y);
        }
        full_dungeon_redraw();
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "DUMPOBJSLOT ", 12) == 0) {
        /* Diagnostic: print the raw 0x1b-byte record for small-object-table slot N (DAT_002046b8 +
           N*0x1b), the same table resolve_object_link indexes into for link values with (raw>>6) <
           0x100. */
        extern char *DAT_002046b8;
        int slot = atoi(p + 12);
        unsigned char *rec = (unsigned char *)DAT_002046b8 + slot * 0x1b;
        demo_printf("[dumpobjslot] slot=%d addr=%p bytes:", slot, (void *)rec);
        for (int i = 0; i < 0x1b; i++) demo_printf(" %02x", rec[i]);
        demo_printf("\n[dumpobjslot] slot=%d word0=0x%04x word1=0x%04x type=0x%03x\n",
                slot, (unsigned)(rec[0] | (rec[1] << 8)), (unsigned)(rec[2] | (rec[3] << 8)),
                (unsigned)((rec[0] | (rec[1] << 8)) & 0x1ff));
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "CALLMANTRA") == 0) {
        /* Calls handle_mantra_chant() (player.c's "Chant the mantra" feature) directly, bypassing
           the in-world mantra-statue click path (dispatch_world_object_interaction_by_family /
           family 1, low nibble 7)... */
        extern void handle_mantra_chant();
        demo_printf("[callmantra] invoking handle_mantra_chant()\n");
        handle_mantra_chant();
        demo_printf("[callmantra] returned\n");
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SCANOBJTYPE ", 12) == 0) {
        /* Diagnostic: scan BOTH object tables (small: DAT_002046b8, 0x1b bytes/slot, indices
           1-0xff; large: DAT_002046c4, 8 bytes/slot, indices 0x100-0x3fff) for any record whose
           type field (word0 & 0x1ff) equals the given hex type... */
        extern char *DAT_002046b8;
        extern char *DAT_002046c4;
        int want = (int)strtol(p + 12, NULL, 16);
        int found = 0;
        for (int i = 1; i < 0x100; i++) {
            unsigned char *rec = (unsigned char *)DAT_002046b8 + i * 0x1b;
            unsigned type = (rec[0] | (rec[1] << 8)) & 0x1ff;
            if (type == (unsigned)want) {
                demo_printf("[scanobjtype] small-table slot=%d addr=%p word0=0x%04x word1=0x%04x\n",
                        i, (void *)rec, (unsigned)(rec[0] | (rec[1] << 8)), (unsigned)(rec[2] | (rec[3] << 8)));
                found++;
            }
        }
        /* Large table spans DAT_002046c4 .. DAT_002029cc+0x7c08+0x3a (see reset_level_object_arena
           / resolve_object_link's own comment); DAT_002046c4 itself starts at DAT_002029cc+0x5b00,
           so that's (0x7c08+0x3a-0x5b00)/8 =~ 1064 real slots -- stay inside that. */
        for (int i = 0x100; i < 0x100 + 1064; i++) {
            unsigned char *rec = (unsigned char *)DAT_002046c4 + (i - 0x100) * 8;
            unsigned type = (rec[0] | (rec[1] << 8)) & 0x1ff;
            if (type == (unsigned)want) {
                demo_printf("[scanobjtype] large-table slot=%d addr=%p word0=0x%04x word1=0x%04x\n",
                        i, (void *)rec, (unsigned)(rec[0] | (rec[1] << 8)), (unsigned)(rec[2] | (rec[3] << 8)));
                found++;
            }
        }
        demo_printf("[scanobjtype] type=0x%03x total_found=%d\n", want, found);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "FINDOBJ ", 8) == 0) {
        /* Diagnostic: does ANY tile's object chain (across the whole 64x64 map) ever reach the
           object at the given large-table slot index? If not, it's a real, populated record that's
           simply never linked into the world -- an orphaned object, not a rendering/pick bug. */
        extern char *DAT_002046c4;
        int slot = atoi(p + 8);
        void *target = (void *)((char *)DAT_002046c4 + (slot - 0x100) * 8);
        demo_printf("[findobj] searching for slot=%d addr=%p across all tiles\n", slot, target);
        int hits = 0;
        for (int row = 0; row < 64; row++) {
            for (int col = 0; col < 64; col++) {
                void *tile_rec = tilemap_lookup(row, col);
                if (!tile_rec) continue;
                unsigned short *link = (unsigned short *)((char *)tile_rec + 2);
                void *obj;
                int guard = 0;
                while ((obj = resolve_object_link(link)) != NULL && guard++ < 64) {
                    if (obj == target) {
                        demo_printf("[findobj]   FOUND on tile (%d,%d)\n", row, col);
                        hits++;
                    }
                    link = (unsigned short *)obj + 2;
                }
            }
        }
        demo_printf("[findobj] total tile-chain hits=%d\n", hits);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "PICKBUFDRIFT") == 0) {
        /* Diagnostic: how far the shared draw/pick-buffer cursor (DAT_00110fc0) has drifted from
           its 64KB scratch buffer's base, and how much headroom remains before it walks off the end
           into whatever global follows -- testing the theory that this shared... */
        extern long uw_debug_pickbuf_drift(void);
        extern long uw_debug_pickbuf_capacity(void);
        long drift = uw_debug_pickbuf_drift();
        long cap = uw_debug_pickbuf_capacity();
        demo_printf("[pickbufdrift] drift=%ld capacity=%ld headroom=%ld%s\n",
                drift, cap, cap - drift, (drift < 0 || drift >= cap) ? " *** OUT OF BOUNDS ***" : "");
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "DUMPPLAYERINV") == 0) {
        /* Diagnostic: object slot 1 is reserved for the player (real UW1 format doc 4.3: "Entry 1
           is partly used to store the player's information"). */
        extern char *DAT_002046b8;
        unsigned char *slot1 = (unsigned char *)DAT_002046b8 + 1 * 0x1b;
        unsigned word0 = slot1[0] | (slot1[1] << 8);
        int is_quant = (word0 >> 15) & 1;
        demo_printf("[dumpplayerinv] slot1 word0=0x%04x (is_quant=%d) link/special word=0x%02x%02x\n",
                word0, is_quant, slot1[7], slot1[6]);
        unsigned short *link_field = (unsigned short *)(slot1 + 6);
        void *contents = resolve_object_link(link_field);
        if (contents) {
            unsigned short *c = (unsigned short *)contents;
            demo_printf("[dumpplayerinv] sp_link resolves to obj=%p type=0x%03x word0=0x%04x\n",
                    contents, ((uw_object_hdr_t *)c)->object_id,
                    ((uw_object_hdr_t *)c)->type_flags);
            int n = 0;
            unsigned short *next_link = c + 2;
            while (1) {
                void *nx = resolve_object_link(next_link);
                if (!nx) break;
                unsigned short *nc = (unsigned short *)nx;
                demo_printf("[dumpplayerinv]   +sibling #%d obj=%p type=0x%03x word0=0x%04x\n",
                        n, nx, ((uw_object_hdr_t *)nc)->object_id,
                        ((uw_object_hdr_t *)nc)->type_flags);
                next_link = nc + 2;
                if (++n > 32) break;
            }
        } else {
            demo_printf("[dumpplayerinv] sp_link is empty/NULL (no contents linked)\n");
        }
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "TRIGGERSAVE") == 0) {
        /* Diagnostic: calls the real "save to slot 0" flow (commit_level_to_save_slot) directly,
           bypassing pause-menu UI navigation, so a demo script can test the save path without
           reproducing its exact keypress sequence. */
        extern short DAT_00201b68;
        demo_printf("[triggersave] calling commit_level_to_save_slot(%d)\n", (int)DAT_00201b68);
        unsigned int _r = commit_level_to_save_slot((int)DAT_00201b68);
        demo_printf("[triggersave] result=%u\n", _r);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "CASTALLSPELLS") == 0) {
        /* Diagnostic/regression hook for the "Spell crashes - test each" bug report: directly
           drives execute_spell_effect (the real per-spell effect dispatcher
           cast_spell_from_rune_combo calls after its mana/skill checks pass) once for each of... */
        extern uw_mobile_object_t *g_player_object;
        extern undefined DAT_00087530_backing[212];
        int i;
        for (i = 0; i < 48; i++) {
            unsigned char byte0 = DAT_00087530_backing[i * 4];
            unsigned char byte3 = DAT_00087530_backing[i * 4 + 3];
            unsigned int type = byte0 >> 3;
            demo_printf("[castallspells] spell %d: type=%u param=%u\n", i, type, byte3);
            execute_spell_effect(type, byte3, g_player_object, g_player_object);
            demo_printf("[castallspells] spell %d: survived\n", i);
        }
        demo_printf("[castallspells] all 48 spells dispatched\n");
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "DUMPTILEOBJS") == 0) {
        /* Diagnostic: walk the current player tile's raw object chain (the same
           tilemap_lookup(row,col)+2 -> resolve_object_link -> +2 shorts -> resolve_object_link ...
           walk object_chain_max_barrier uses) and print each object's raw type/flags words... */
        extern uw_mobile_object_t *g_player_object;
        unsigned short *pl = (unsigned short *)g_player_object;
        if (pl) {
            int row = ((uw_mobile_object_t *)pl)->tile_x;
            int col = ((uw_mobile_object_t *)pl)->tile_y;
            void *tile_rec = tilemap_lookup(row, col);
            unsigned short *link = (unsigned short *)((char *)tile_rec + 2);
            demo_printf("[dumptileobjs] tile=(%d,%d) tile_rec=%p raw_link_field=0x%04x\n",
                    row, col, tile_rec, *link);
            int n = 0;
            unsigned short *obj;
            while ((obj = (unsigned short *)resolve_object_link(link)) != NULL) {
                demo_printf("[dumptileobjs]   #%d obj=%p type=0x%03x word0=0x%04x word1=0x%04x\n",
                        n, (void *)obj, ((uw_object_hdr_t *)obj)->object_id,
                        ((uw_object_hdr_t *)obj)->type_flags,
                        ((uw_object_hdr_t *)obj)->position_word);
                link = obj + 2;
                n++;
                if (n > 64) { demo_printf("[dumptileobjs]   ...giving up after 64\n"); break; }
            }
            if (n == 0) demo_printf("[dumptileobjs]   (empty chain)\n");
        }
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "REVEALALL") == 0) {
        /* Reveal the entire current level's automap in one pass, with no per-tile teleport or
           dungeon redraw. Much faster than a TELEPORT+REVEAL sweep for exercising the automap
           renderer on a fully-explored map. */
        demo_printf("[cmd] revealing the entire level automap\n");
        automap_reveal_all_tiles();
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "CLICK ", 6) == 0) {
        /* CLICK <portrait_x> <portrait_y> -- injects a synthetic WM_LBUTTONDOWN directly into
           handle_mouse_message (the recovered mouse handler) using portrait "hardware" framebuffer
           coordinates directly, bypassing gx_stub.c's SDL window->portrait transform entirely. */
        int px = 0, py = 0;
        sscanf(p + 6, "%d %d", &px, &py);
        demo_printf("[cmd] CLICK portrait=(%d,%d)\n", px, py);
        int lparam = (py << 16) | (px & 0xffff);
        handle_mouse_message(0, 0x201u, 0, lparam);
        handle_mouse_message(0, 0x202u, 0, lparam);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLCLICK ", 9) == 0) {
        /* SDLCLICK <window_x> <window_y> -- pushes genuine SDL mouse events at the given point (via
           uw_inject_mouse_click), so unlike CLICK above this exercises the actual uw_pump_events()
           path end to end, including g_mouse_event_pending/PeekMessageW. */
        int wx = 0, wy = 0;
        sscanf(p + 9, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLCLICK window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_click(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLRCLICK ", 10) == 0) {
        /* SDLRCLICK <window_x> <window_y> -- right-button click (interact). */
        int wx = 0, wy = 0;
        sscanf(p + 10, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLRCLICK window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_rclick(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLDOWN ", 8) == 0) {
        /* SDLDOWN/SDLUP <window_x> <window_y> -- split halves of SDLCLICK, for testing a click with
           a real multi-tick gap between button-down and button-up (matching an actual held click's
           timing) rather than both queued in the same instant. */
        int wx = 0, wy = 0;
        sscanf(p + 8, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLDOWN window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_down(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLUP ", 6) == 0) {
        int wx = 0, wy = 0;
        sscanf(p + 6, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLUP window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_up(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLRDOWN ", 9) == 0) {
        /* SDLRDOWN/SDLMOVE/SDLRUP -- right-button drag primitives (grab
         * an object, hold, move the cursor, release elsewhere -- e.g.
         * dragging a picked-up item onto the inventory HUD). */
        int wx = 0, wy = 0;
        sscanf(p + 9, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLRDOWN window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_rdown(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLRUP ", 7) == 0) {
        int wx = 0, wy = 0;
        sscanf(p + 7, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLRUP window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_rup(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLREL ", 7) == 0) {
        /* SDLREL <dx> <dy> -- relative pointer motion (mouselook steering). */
        int dx = 0, dy = 0;
        sscanf(p + 7, "%d %d", &dx, &dy);
        demo_printf("[cmd] SDLREL rel=(%d,%d)\n", dx, dy);
        uw_inject_mouse_relmotion(dx, dy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLMOVE ", 8) == 0) {
        int wx = 0, wy = 0;
        sscanf(p + 8, "%d %d", &wx, &wy);
        demo_printf("[cmd] SDLMOVE window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_motion(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SCREENSHOT ", 11) == 0) {
        const char *path = p + 11;
        /* Push the whole software framebuffer to the display before capturing. */
        { extern int g_force_flush; 
          dirty_rect_union(0, 200, 0, 0x140);
          g_force_flush = 1;
          flush_dirty_rect_to_display(1);
          g_force_flush = 0; }
        uw_save_screenshot(path);
        g_demo_next_tick = now;
        return;
    }

    if (strncasecmp(p, "CONSOLE ", 8) == 0) {
        /* CONSOLE <line> -- types <line> into the open debug console and presses Enter, as untagged
           (human-looking) SDL events so they reach the console rather than the game. For scripting
           the console itself; a line typed by hand needs none of this. */
        for (const char *c = p + 8; *c; c++) {
            SDL_Event ti = {0};
            ti.type = SDL_TEXTINPUT;
            ti.text.text[0] = *c;
            SDL_PushEvent(&ti);
        }
        SDL_Event e = {0};
        e.type = SDL_KEYDOWN;
        e.key.state = SDL_PRESSED;
        e.key.keysym.sym = SDLK_RETURN;
        e.key.keysym.scancode = SDL_SCANCODE_RETURN;
        SDL_PushEvent(&e);
        e.type = SDL_KEYUP;
        e.key.state = SDL_RELEASED;
        SDL_PushEvent(&e);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    {
        const char *arg;
        int want;
        if (demo_match_cmd(p, "FLY", &arg)) {
            /* FLY [on|off] -- the player's real hover/fly movement state (the bit a flying effect
               sets in the movement-effect mask: gravity off, K/L fly down/up). */
            if ((want = demo_parse_onoff(arg, g_debug_fly)) < 0) {
                demo_printf("[cmd] usage: FLY [on|off]\n");
            } else {
                g_debug_fly = want;
                refresh_player_equipment_effects();
                demo_printf("[cmd] fly %s\n", want ? "on" : "off");
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "FARSIGHT", &arg)) {
            /* FARSIGHT [on|off] -- the far sight spell's free-camera mode (what dispatch_player_
               command 7 does), held until switched off instead of expiring. */
            if ((want = demo_parse_onoff(arg, g_debug_farsight)) < 0) {
                demo_printf("[cmd] usage: FARSIGHT [on|off]\n");
            } else {
                g_debug_farsight = want;
                if (want) {
                    refresh_player_equipment_effects();
                    set_custom_view_target(0);
                    set_view_subject_by_command(-1);
                } else {
                    set_view_subject_by_command(1);
                    refresh_player_equipment_effects();
                }
                demo_printf("[cmd] farsight %s\n", want ? "on" : "off");
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "OBJIDS", &arg)) {
            /* OBJIDS -- every object type that has a name: id (hex) and name. */
            char nm[96];
            int id, n = 0;
            for (id = 0; id < 0x200; id++) {
                dbgui_object_name(id, nm, sizeof nm);
                if (!nm[0]) continue;
                demo_printf("0x%03x %s\n", id, nm);
                n++;
            }
            demo_printf("[cmd] %d named objects\n", n);
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "SPAWNOBJ", &arg) || demo_match_cmd(p, "GIVEOBJ", &arg)) {
            /* SPAWNOBJ <id> -- new object on a free tile in front of the player.
               GIVEOBJ <id> [quantity] -- new object in the first free top-level backpack slot. */
            int give = (strncasecmp(p, "GIVEOBJ", 7) == 0);
            char *end;
            long id = strtol(arg, &end, 0);
            long qty = 1;
            char nm[96];
            if (give && *end == ' ') qty = strtol(end, &end, 0);
            if (*arg == '\0' || *end != '\0' || id < 0 || id > 0x1ff) {
                demo_printf("[cmd] usage: %s <id 0-0x1ff>%s  (see OBJIDS)\n", give ? "GIVEOBJ" : "SPAWNOBJ", give ? " [quantity]" : "");
            } else {
                dbgui_object_name((int)id, nm, sizeof nm);
                if (give) {
                    int slot = dbgui_give_object((int)id, (int)qty);
                    if (slot >= 0) demo_printf("[cmd] gave 0x%03lx %s (backpack slot %d)\n", id, nm, slot - 0xb);
                    else demo_printf("[cmd] %s\n", slot == -2 ? "no free backpack slot" : "no free object slot");
                } else {
                    int tx = 0, ty = 0;
                    if (dbgui_spawn_object((int)id, &tx, &ty) == 1)
                        demo_printf("[cmd] spawned 0x%03lx %s at tile (%d,%d)\n", id, nm, tx, ty);
                    else demo_printf("[cmd] could not place 0x%03lx %s\n", id, nm);
                }
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "ALLRUNES", &arg)) {
            /* ALLRUNES -- every spell rune, plus a Rune Bag in the backpack if there isn't one. */
            int r = dbgui_all_runes();
            demo_printf("[cmd] all runes set%s\n", r == 1 ? ", rune bag added" :
                        r == -2 ? " (no backpack room for a rune bag)" : "");
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "CASTSPELL", &arg)) {
            /* CASTSPELL [id] -- no id: list the spell ids and names. With an id: cast that spell now,
               ignoring mana cost (and the level / skill-roll checks), via execute_spell_effect. */
            char nm[64];
            int i;
            if (*arg == '\0') {
                for (i = 0; i < dbgui_spell_count(); i++) {
                    dbgui_spell_name(i, nm, sizeof nm);
                    demo_printf("%d %s\n", i, nm);
                }
            } else {
                char *end;
                long id = strtol(arg, &end, 0);
                if (*end != '\0' || id < 0 || id >= dbgui_spell_count()) {
                    demo_printf("[cmd] usage: CASTSPELL [0-%d]  (no id lists spells)\n", dbgui_spell_count() - 1);
                } else {
                    dbgui_spell_name((int)id, nm, sizeof nm);
                    demo_printf("[cmd] casting %ld %s: %s\n", id, nm, dbgui_cast_spell((int)id) ? "ok" : "no effect");
                }
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "GODMODE", &arg)) {
            /* GODMODE [on|off] -- the player can't die (damage never takes the last hit point) and
               spells cost no mana. */
            if ((want = demo_parse_onoff(arg, g_debug_godmode)) < 0) {
                demo_printf("[cmd] usage: GODMODE [on|off]\n");
            } else {
                g_debug_godmode = want;
                demo_printf("[cmd] godmode %s\n", want ? "on" : "off");
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "PLAYERLEVEL", &arg)) {
            /* PLAYERLEVEL <1-16> -- set the character level (and its starting XP), refill hp/mana. */
            char *end;
            long lv = strtol(arg, &end, 10);
            if (*arg == '\0' || *end != '\0') {
                demo_printf("[cmd] usage: PLAYERLEVEL <1-16>\n");
            } else {
                demo_printf("[cmd] player level %d\n", debug_set_player_level((int)lv));
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "SETSKILL", &arg)) {
            /* SETSKILL <skill|all> <0-30> -- skill by name (see usage), or every skill at once. */
            char name[32];
            size_t nl = 0;
            const char *lvl;
            char *end;
            long v = 0;
            int idx = -2, ok = 0, i;
            while (arg[nl] && arg[nl] != ' ' && arg[nl] != '\t' && nl < sizeof name - 1) { name[nl] = arg[nl]; nl++; }
            name[nl] = '\0';
            lvl = arg + nl;
            while (*lvl == ' ' || *lvl == '\t') lvl++;
            if (nl && *lvl) v = strtol(lvl, &end, 10), ok = (*end == '\0');
            if (ok) {
                if (strcasecmp(name, "all") == 0) idx = -1;
                else for (i = 0; i < DEBUG_SKILL_COUNT; i++) if (strcasecmp(name, g_debug_skill_names[i]) == 0) idx = i;
            }
            if (!ok || idx == -2) {
                char list[256] = "";
                for (i = 0; i < DEBUG_SKILL_COUNT; i++) { strcat(list, i ? " " : ""); strcat(list, g_debug_skill_names[i]); }
                demo_printf("[cmd] usage: SETSKILL <all|%s> <0-30>\n", list);
            } else {
                int shown = 0;
                for (i = 0; i < DEBUG_SKILL_COUNT; i++) if (idx == -1 || idx == i) shown = debug_set_skill(i, (int)v);
                debug_skills_changed();
                demo_printf("[cmd] %s skill = %d\n", idx == -1 ? "all" : g_debug_skill_names[idx], shown);
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "LIGHTLEVEL", &arg)) {
            /* LIGHTLEVEL <0-7> -- set_ambient_bias_with_light(n): the light strength a lit light item
               gives, i.e. the SHADES.DAT row. Held until the next equipment refresh recomputes it from
               what is carried (lighting or snuffing a light, ...). */
            char *end;
            long level = strtol(arg, &end, 0);
            if (*arg == '\0' || *end != '\0' || level < 0 || level > 7) {
                demo_printf("[cmd] usage: LIGHTLEVEL <0-7>\n");
            } else {
                set_ambient_bias_with_light((char)level);
                demo_printf("[cmd] light level %d\n", (int)level);
            }
            g_demo_next_tick = now;
            return;
        }
        if (demo_match_cmd(p, "NOCLIP", &arg)) {
            /* NOCLIP [on|off] -- fly mode on, and the player ignores walls/objects. Turning it off
               puts collisions back and drops fly only if NOCLIP was what turned it on. */
            static int fly_was_off_before_noclip;
            if ((want = demo_parse_onoff(arg, g_debug_noclip)) < 0) {
                demo_printf("[cmd] usage: NOCLIP [on|off]\n");
            } else {
                if (want && !g_debug_noclip) fly_was_off_before_noclip = !g_debug_fly;
                g_debug_noclip = want;
                if (want) g_debug_fly = 1;
                else if (fly_was_off_before_noclip) g_debug_fly = 0;
                refresh_player_equipment_effects();
                demo_printf("[cmd] noclip %s (fly %s)\n", want ? "on" : "off", g_debug_fly ? "on" : "off");
            }
            g_demo_next_tick = now;
            return;
        }
    }

    /* Runtime options (options.c): OPTIONS lists them, "<option> [value]" shows or sets one. A bool with
       no value flips; anything else with no value just shows. */
    {
        char val[160], tok[64];
        size_t tl = 0;
        const char *rest;
        int type;
        if (strcasecmp(p, "OPTIONS") == 0) {
            for (size_t i = 0; i < options_count(); i++) {
                const char *nm = options_name_at(i, val, sizeof val);
                demo_printf("[cmd] %s = %s\n", nm, val);
            }
            g_demo_next_tick = now;
            return;
        }
        while (p[tl] && p[tl] != ' ' && p[tl] != '\t' && tl < sizeof tok - 1) { tok[tl] = p[tl]; tl++; }
        tok[tl] = '\0';
        rest = p + tl;
        while (*rest == ' ' || *rest == '\t') rest++;
        if ((type = options_get(tok, val, sizeof val)) >= 0) {
            if (*rest == '\0' && type != 0) {
                demo_printf("[cmd] %s = %s\n", tok, val);
            } else {
                const char *v = rest;
                if (*rest == '\0') v = strcmp(val, "on") == 0 ? "0" : "1";
                if (options_set(tok, v) != 0) {
                    demo_printf("[cmd] bad value '%s' for %s\n", v, tok);
                } else {
                    options_get(tok, val, sizeof val);
                    demo_printf("[cmd] %s = %s\n", tok, val);
                }
            }
            g_demo_next_tick = now;
            return;
        }
    }

    if (strcasecmp(p, "HELP") == 0) {
        /* Mainly for the debug console; harmless in a demofile. */
        demo_printf(
                    "debug: DUMPOBJSLOT <n> | SCANOBJTYPE <hex> | FINDOBJ <n>\n"
                    "  DUMPTILEOBJS | DUMPPLAYERINV | PICKBUFDRIFT\n"
                    "  SCREENSHOT <path>\n"
                    "world: TELEPORT <x> <y> [level] | GOTOLEVEL <level>\n"
                    "  OPENMAP | REVEAL | REVEALALL\n"
                    "  FLY | FARSIGHT | NOCLIP | GODMODE  (each takes optional on/off)\n"
                    "  PLAYERLEVEL <1-16> | SETSKILL <skill|all> <0-30>\n"
                    "  OBJIDS | SPAWNOBJ <id> | GIVEOBJ <id> [qty] | ALLRUNES\n"
                    "  CASTSPELL [id]  (no id lists spells)\n"
                    "  OPTIONS | <option> [value]\n"
                    "  LIGHTLEVEL <0-7>\n"
                    "  SETPLAYERPOS <x> <y> <z> <yaw> <pitch>\n"
                    "  CALLMANTRA | CASTALLSPELLS | TRIGGERSAVE\n"
                    "console: CLEAR | HELP | PgUp/PgDn/Shift+Up/Down scroll | Up/Down history\n"
                    "  ESC back to panel | ` close\n");
        g_demo_next_tick = now;
        return;
    }

    /* Was a direct handle_keyboard_message(WM_KEYDOWN)+(WM_KEYUP) pair, on the theory (see the
       removed comment's own explanation) that Enter's WM_KEYDOWN alone was enough once
       GXGetDefaultKeys's "start" button field really held VK_RETURN -- true at the time... */
    int sdlkey = demo_translate_sdlkey(p);
    if (sdlkey == 0) {
        demo_printf("[cmd] unrecognized input '%s', skipping\n", p);
    } else {
        demo_printf("[cmd] sending %s\n", p);
        uw_inject_key_down(sdlkey);
        uw_inject_key_up(sdlkey);
    }
    g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
}


/* Diagnostic accessor (DAT_00110fc0_scratch is static, so demomode.c can't read it directly): how
   far the shared draw/pick-buffer write cursor has drifted from its scratch buffer's base, and how
   much headroom is left before it walks off the end into whatever global happens to follow... */
long uw_debug_pickbuf_drift(void) {
  return (long)(DAT_00110fc0 - DAT_00110fc0_scratch);
}
long uw_debug_pickbuf_capacity(void) {
  return (long)sizeof(DAT_00110fc0_scratch);
}


void uw_debug_dump_inventory_state(void) {
  int occupied = 0;
  if (g_backpack_slot_table) {
    for (int i = 0; i < 28; i++)
      if (*(unsigned short *)&g_backpack_slot_table[i*2] & 0xffc0) occupied++;
  }
  demo_printf("[cmd] post-screenshot state: g_cursor_holding_state(holding)=%d occupied_slots=%d g_current_container_record=%p\n",
          (int)g_cursor_holding_state, occupied, (void *)g_current_container_record);
}

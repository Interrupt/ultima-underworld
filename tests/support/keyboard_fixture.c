#include "keyboard_fixture.h"

/* Local service declarations; handle_keyboard_message's own body links
 * these mocks (only reached via the msg==7/8 GXResume/GXSuspend branches,
 * which these tests never exercise, but the whole function body still has
 * to link). */
int GXResume(void);
int GXSuspend(void);
uint read_realtime_clock_units(void);

int GXResume(void) { return 1; }
int GXSuspend(void) { return 1; }
uint read_realtime_clock_units(void) { return 0; }

/* Storage for every global handle_keyboard_message's real body (game.c/
 * input.c, normally) touches, but which aren't part of this isolated
 * build -- see each global's own header (src/headers/game.h,
 * src/headers/input.h, src/headers/hud.h) for where the real definition
 * normally lives. */
int DAT_0024af60;              /* "command-input mode" -- game.c */
ushort DAT_0023c448;           /* latched pending input code -- game.c */
short DAT_0024af6c;            /* held-key repeat accelerator -- game.c */
ushort g_held_move_keys;
int DAT_000876c8;              /* set by WM_KEYUP -- game.c */
undefined1 DAT_0023ce10_backing[128]; /* GXGetDefaultKeys() VK-code table -- input.c */
int g_text_input_active;       /* scroll_text_entry_prompt's raw-text-field flag -- hud.c */
undefined4 DAT_0023c648;       /* last keydown timestamp, WM_KEYDOWN branch only -- game.c */

void keyboard_fixture_reset(void)
{
    DAT_0024af60 = 0;
    DAT_0023c448 = 0;
    DAT_0024af6c = 0;
    DAT_000876c8 = 0;
    memset(DAT_0023ce10_backing, 0, sizeof(DAT_0023ce10_backing));
    g_text_input_active = 0;
}

void keyboard_fixture_dispose(void) {}

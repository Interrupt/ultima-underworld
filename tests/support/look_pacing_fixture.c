#include "unity.h"
#include "look_pacing_test_api.h"

unsigned char g_synth_scancode_held[SDL_NUM_SCANCODES];
Uint8 keyboard[SDL_NUM_SCANCODES];
unsigned int g_uw_frame_clock_units;
short DAT_00201b64, DAT_00201c84, DAT_0023beb4, DAT_0024af6c;
undefined2 DAT_00201c90;
ushort DAT_0023c448;
int DAT_000876c8;
short g_movement_mode;
ushort g_held_move_keys;
int freelook;

const Uint8 *SDL_GetKeyboardState(int *count)
{
    if (count) *count = SDL_NUM_SCANCODES;
    return keyboard;
}
int in_dungeon_freelook(void) { return freelook; }
int dbgui_visible(void) { return 0; }
int GXEndDraw(void) { return 1; }

/* Exercise the static port poller without changing its linkage in the game. */
#include "uw_test_look_pacing_functions.c"

void look_pacing_fixture_reset(void)
{
    memset(keyboard, 0, sizeof keyboard);
    memset(g_synth_scancode_held, 0, sizeof g_synth_scancode_held);
    uw_reset_frame_pacing();
    freelook = 1;
    DAT_00201b64 = DAT_00201c90 = DAT_00201c84 = DAT_0023beb4 = 0;
    DAT_0023c448 = DAT_000876c8 = 0;
    poll_dungeon_movement_keys(0); /* Release any movement from the previous test. */
}
void look_pacing_fixture_dispose(void) {}

void poll_at(uint64_t time_us)
{
    poll_dungeon_movement_keys(uw_service_game_clock(time_us));
}


void look_pacing_poll(int frame_due) { poll_dungeon_movement_keys(frame_due); }

#include "src/headers/uw.h"
extern ushort object[4];
extern char *g_selected_object;
extern undefined2 g_cursor_holding_state;
extern undefined1 g_active_hud_panel;
extern unsigned char g_backpack_widget_to_slot_backing[0x17];
extern undefined4 DAT_00204844;
extern short DAT_0023c63c, DAT_00086968, DAT_0008696e, DAT_00204850;
extern undefined2 DAT_0008696a, DAT_0008696c;
extern short g_mouse_x, g_mouse_y;
extern int DAT_0020485c;
extern short driver_present;
extern short *DAT_000876c4;
extern char DAT_002506aa, DAT_002506ab;
extern int polls, redraws, drops, backpack_drops, release_poll, target_widget, held_key_code;
extern int game_ticks, world_frames, presents, displayed_world_frames;
extern uint64_t now_us;
extern int movement_ticks, scheduler_steps;
extern char character[256];
extern char *DAT_00086df8;
extern unsigned int g_uw_frame_clock_units;
extern undefined4 DAT_0023bf54, DAT_002020d4;
extern byte DAT_0023bf58;
extern int DAT_000879ac;
extern short g_movement_mode, DAT_0023bf4c;
extern ushort DAT_0023c448;
extern short DAT_00201b64;
extern short DAT_00201c84;
extern undefined2 DAT_00201c90;
extern int g_force_flush;
#include "gx_pacing_test_api.h"
#include <math.h>
#include <math.h>

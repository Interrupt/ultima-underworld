#include "unity.h"
#include "gx_pacing_test_api.h"

/* Exercise the actual pickup/release path. The OS polls move the cursor
   while the button is held, then release it over the world or backpack. */
ushort object[4];
char *g_selected_object;
undefined2 g_cursor_holding_state;
undefined1 g_active_hud_panel;
unsigned char g_backpack_widget_to_slot_backing[0x17];
undefined4 DAT_00204844;
short DAT_0023c63c, DAT_00086968, DAT_0008696e, DAT_00204850;
undefined2 DAT_0008696a, DAT_0008696c;
short g_mouse_x, g_mouse_y;
int DAT_0020485c;
short driver_present = 1;
short *DAT_000876c4 = &driver_present;
char DAT_002506aa, DAT_002506ab;
int polls, redraws, drops, backpack_drops, release_poll, target_widget;
int game_ticks, world_frames, presents, displayed_world_frames;
uint64_t now_us;
int movement_ticks, scheduler_steps;
char character[256];
char *DAT_00086df8 = character;
unsigned int g_uw_frame_clock_units;
undefined4 DAT_0023bf54, DAT_002020d4;
byte DAT_0023bf58;
int DAT_000879ac;
short g_movement_mode, DAT_0023bf4c;
ushort DAT_0023c448;
int DAT_000876c8;
int held_key_code;
short DAT_00201b64;
short DAT_00201c84;
undefined2 DAT_00201c90;
int g_force_flush;

uint read_realtime_clock_units(void) { return polls * 5; } /* 20ms per OS poll */
long GetTickCount(void) { return polls * 20; }
unsigned int uw_frame_clock_ms(void) { return g_uw_frame_clock_units; }
void movement_tick(int elapsed, int bob, int mode)
{
    TEST_ASSERT_NOT_NULL(g_selected_object);
    TEST_ASSERT_GREATER_THAN_UINT(0, elapsed);
    movement_ticks++;
}
void scheduler_tick(int elapsed)
{
    TEST_ASSERT_NOT_NULL(g_selected_object);
    scheduler_steps += elapsed;
}
int GXEndDraw(void)
{
    if (uw_present_frame_due(now_us)) {
        presents++;
        displayed_world_frames = world_frames;
    }
    return 1;
}

void push_cursor_icon(int type) { TEST_ASSERT_EQUAL_HEX16(0x82, type); }
void get_mouse_position(ushort *x, ushort *y) { *x = g_mouse_x; *y = g_mouse_y; }
int hit_test_inventory_widget(short x, short y)
{
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_INT(100 + release_poll, x);
    TEST_ASSERT_EQUAL_INT(50 + release_poll, y);
    return target_widget;
}
int erase_cursor_icon(void) { return 1; }
void pop_cursor_icon(ushort mode) { TEST_ASSERT_EQUAL_INT(3, mode); }
void handle_object_drop_target(short widget)
{
    TEST_ASSERT_EQUAL_INT(0x17, widget);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_INT(0, poll_mouse_button_flags());
    drops++;
    g_selected_object = NULL;
    g_cursor_holding_state = 0;
}
void handle_backpack_slot_click(short slot)
{
    TEST_ASSERT_EQUAL_INT(4, slot);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    backpack_drops++;
    g_selected_object = NULL;
}
void update_mouse_state(void) { if (g_selected_object) GXEndDraw(); }
void noop_key_handler(void) {}
uint process_pending_keyboard_scan_code(int peek) { (void)peek; return 0; }
int peek_input_event(void)
{
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(100, ++polls, "Pickup never noticed release");
    g_mouse_x = 100 + polls;
    g_mouse_y = 50 + polls;
    if (polls == release_poll) {
        DAT_0023c63c = 0;
        DAT_002506ab = 0;
    }
    now_us = (uint64_t)polls * 20000;
    unsigned previous_clock = g_uw_frame_clock_units;
    uw_service_game_clock(now_us);
    if (g_uw_frame_clock_units != previous_clock) game_ticks++;
    uw_service_pending_present(now_us);
    update_mouse_state();
    int buttons = poll_mouse_button_flags();
    /* A held movement key latches its code, which then hides the button state from the poll. */
    if (held_key_code) {
        DAT_0023c448 = held_key_code;
        return held_key_code;
    }
    return buttons ? buttons : -1;
}
void dispatch_sticky_mode_handlers(void)
{
    TEST_ASSERT_LESS_THAN_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_PTR(object, g_selected_object);
    TEST_ASSERT_EQUAL_INT(0, drops + backpack_drops);
    /* draw_dungeon_view calls this while the pickup's release wait runs. */
    handle_mouse_button_message(0);
    movement_pacing_handler();
    redraws++;
    if (DAT_00201c84 & 2) {
        TEST_ASSERT_GREATER_THAN_INT(0, game_ticks);
        world_frames++;
        DAT_00201c84 &= ~2;
    }
}

void inventory_drag_fixture_reset(void)
{
    memset(object, 0, sizeof(object));
    object[0] = 0x82;
    g_selected_object = NULL;
    g_cursor_holding_state = 1;
    g_active_hud_panel = 0;
    DAT_00204844 = 1;
    DAT_0023c63c = DAT_002506aa = DAT_002506ab = 0;
    DAT_00086968 = DAT_0008696e = -1;
    DAT_00204850 = DAT_0020485c = 0;
    g_mouse_x = 100; g_mouse_y = 50;
    polls = redraws = drops = backpack_drops = 0;
    release_poll = 5;
    target_widget = 0x17;
    g_backpack_widget_to_slot_backing[4] = 4;
    game_ticks = world_frames = presents = displayed_world_frames = 0;
    now_us = 0;
    uw_reset_frame_pacing();
    movement_ticks = scheduler_steps = 0;
    memset(character, 0, sizeof(character));
    g_uw_frame_clock_units = DAT_0023bf54 = DAT_002020d4 = DAT_0023bf58 = 0;
    DAT_000879ac = 1;
    held_key_code = DAT_000876c8 = 0;
    DAT_00201b64 = DAT_00201c90 = DAT_00201c84 = g_force_flush = 0;
}
void inventory_drag_fixture_dispose(void) {}

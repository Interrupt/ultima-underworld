#ifndef UW_TEST_INVENTORY_DRAG_FIXTURE_H
#define UW_TEST_INVENTORY_DRAG_FIXTURE_H
#include "unity.h"
#include "../inventory_drag_test_globals.h"
uint read_realtime_clock_units(void);
long GetTickCount(void);
unsigned int uw_frame_clock_ms(void);
void movement_tick(int elapsed, int bob, int mode);
void scheduler_tick(int elapsed);
int GXEndDraw(void);
void push_cursor_icon(int type);
void get_mouse_position(short *x, short *y);
int hit_test_inventory_widget(short x, short y);
int erase_cursor_icon(void);
void pop_cursor_icon(ushort mode);
void handle_object_drop_target(short widget);
void handle_backpack_slot_click(short slot);
void update_mouse_state(void);
void noop_key_handler(void);
uint process_pending_keyboard_scan_code(int peek);
int peek_input_event(void);
void dispatch_sticky_mode_handlers(void);
void inventory_drag_fixture_reset(void);
void inventory_drag_fixture_dispose(void);
#endif

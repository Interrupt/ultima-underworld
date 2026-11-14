#ifndef UW_TEST_INVENTORY_FIXTURE_H
#define UW_TEST_INVENTORY_FIXTURE_H
/* Fixture state and controlled services for reusable inventory tests. */
#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/inventory.h"
#include "src/headers/ordinal_stubs.h"
extern ushort objects[5][4];
extern ushort slots[29];
extern char *g_backpack_slot_table;
extern unsigned char g_backpack_widget_to_slot_backing[0x17];
extern char *g_current_container_record;
extern ushort *DAT_002046b4;
extern int message_lookups, printed_messages, other_actions;
extern uint last_message_id;
extern char key_description[];
extern char *available_message;
extern ushort *last_action_object;
extern short last_action_mode;
extern short click_state[16];
extern short *DAT_00085a6c;
extern undefined2 g_cursor_mode, g_cursor_holding_state;
extern uw_mobile_object_t *g_player_object;
extern ushort *g_interact_target;
extern char *g_selected_object, *DAT_00202098, *DAT_002020b0;
extern short DAT_000858c4, DAT_002020ac;
extern code *DAT_002020b8;
extern char DAT_000878ec_backing[64];
extern char s_UNNAMED_00084f24[];
extern char s_on_what__000878e0[];
extern void (*const PTR_FUN_000858c8_table[5])(void);
extern ushort *picked_target, *combined_target;
extern int prompt_prints, combination_calls, released_clicks, reset_cursor;
extern uint scroll_message;
extern int target_reachable, target_obstructed;
extern byte level_one[0x7c08];
ushort *level_object(unsigned slot);
void load_key_from_level_one_sack(void);
void inventory_fixture_reset(void);
void inventory_fixture_dispose(void);
extern int container_grid_redraws, container_arrow_redraws;
extern int lit_widget_redraws[0x16];
#endif

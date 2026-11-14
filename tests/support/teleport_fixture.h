#ifndef UW_TEST_TELEPORT_FIXTURE_H
#define UW_TEST_TELEPORT_FIXTURE_H
/* Fixture state and controlled services for reusable teleport tests. */
#include "unity.h"
#include "src/headers/level.h"
extern ushort player[16], other_object[16];
extern uw_mobile_object_t *g_player_object;
extern short DAT_00201b68, DAT_00201c7c;
extern undefined2 DAT_00201c90, DAT_00201c8c, g_cursor_holding_state;
extern char *g_selected_object;
extern byte DAT_00085730;
extern short g_visibility_max_ring_passes;
extern code *DAT_00201c9c;
extern int commit_result, load_result, placement_result[2];
extern int commits, loads, placements, positions, cancelled_swings;
extern int saved_level, loaded_level, restored_level, placed_x, placed_y;
extern int resolved_x, resolved_y, notifications, cursor_updates;
extern int redraws, overlay_holds, overlay_restores, callback_calls;
extern char character_record[256];
extern char *DAT_00086df8;
extern undefined4 DAT_0023bea8, DAT_002020d0, DAT_000858a0;
extern undefined2 DAT_0023be98;
extern char DAT_00086e84, DAT_0023bf60;
extern byte DAT_0023bf18;
extern uint DAT_0023bf5c;
extern int DAT_0023bf64, g_npc_tick_enabled;
extern short g_movement_mode;
extern undefined1 DAT_00204880_backing[128];
extern int destination_ticks;
int find_placement_via_tile_flood_fill(uw_unaligned_word_t *object, short x, short y, short *out_x, short *out_y, int fallback);
void after_level_change(void);
void teleport_fixture_reset(void);
void teleport_fixture_dispose(void);
#endif

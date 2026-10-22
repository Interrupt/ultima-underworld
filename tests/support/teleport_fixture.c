#include "teleport_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
void decode_movement_command(void);
void tick_mobile_objects(char elapsed);
void apply_movement_tick(int elapsed);
void trigger_view_transition(void);
void stop_movement_sound_handle(void);
uint read_realtime_clock_units(void);
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias);
void cancel_weapon_swing(void);
void pop_cursor_icon(ushort state);
int commit_level_to_save_slot(int level);
int load_level(int level);
void set_player_tile_position(uint tile_x, uint tile_y, int flag);
void set_pending_update_flags(ushort flags);
void report_fatal_error_and_exit(ushort error_code);
void full_dungeon_redraw(void);
void weapon_overlay_flash_hold(int passes);
void weapon_overlay_flash_restore(int passes);

ushort player[16], other_object[16];

uw_mobile_object_t *g_player_object = (uw_mobile_object_t *)player;

short DAT_00201b68, DAT_00201c7c;

undefined2 DAT_00201c90, DAT_00201c8c, g_cursor_holding_state;

char *g_selected_object;

byte DAT_00085730;

short g_visibility_max_ring_passes;

code *DAT_00201c9c;

int commit_result, load_result, placement_result[2];

int commits, loads, placements, positions, cancelled_swings;

int saved_level, loaded_level, restored_level, placed_x, placed_y;

int resolved_x, resolved_y, notifications, cursor_updates;

int redraws, overlay_holds, overlay_restores, callback_calls;

char character_record[256];

char *DAT_00086df8 = character_record;

undefined4 DAT_0023bea8, DAT_002020d0, DAT_000858a0;

undefined2 DAT_0023be98;

char DAT_00086e84, DAT_0023bf60;
byte DAT_0023bf18;

uint DAT_0023bf5c;

int DAT_0023bf64, g_npc_tick_enabled;

short g_movement_mode;

undefined1 DAT_00204880_backing[128];

int destination_ticks;

void decode_movement_command(void) {}

void tick_mobile_objects(char elapsed)
{
    TEST_ASSERT_EQUAL_INT(1, elapsed);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_GREATER_THAN_UINT8(0, ((byte *)g_player_object)[8]);
    destination_ticks++;
}

void apply_movement_tick(int elapsed)
{
    TEST_FAIL_MESSAGE("Stationary player unexpectedly entered movement physics");
}

void trigger_view_transition(void)
{
    TEST_FAIL_MESSAGE("Stationary player unexpectedly triggered a view transition");
}

void stop_movement_sound_handle(void) {}

uint read_realtime_clock_units(void) { return 0; }

divmod_result ordint_divmod(int divisor, int dividend)
{
    TEST_FAIL_MESSAGE("Stationary tick unexpectedly needed jump timing");
    divmod_result result = {0, 0};
    return result;
}

int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias)
{
    TEST_FAIL_MESSAGE("Stationary tick unexpectedly played a movement sound");
    return 0;
}

void cancel_weapon_swing(void) { cancelled_swings++; }

void pop_cursor_icon(ushort state)
{
    TEST_ASSERT_EQUAL_INT(3, state);
    cursor_updates++;
}

void save_or_restore_level_special_state(short level, short save)
{
    if (save) {
        TEST_ASSERT_EQUAL_INT(0, commits);
        saved_level = level;
    } else {
        TEST_ASSERT_EQUAL_INT(1, loads);
        restored_level = level;
    }
}

int commit_level_to_save_slot(int level)
{
    TEST_ASSERT_EQUAL_INT(saved_level, level);
    commits++;
    return commit_result;
}

int load_level(int level)
{
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_TRUE(commit_result);
    loaded_level = level;
    loads++;
    return load_result;
}

int find_placement_via_tile_flood_fill(uw_unaligned_word_t *object, short x, short y, short *out_x, short *out_y, int fallback)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, object);
    TEST_ASSERT_EQUAL_INT(resolved_x, x);
    TEST_ASSERT_EQUAL_INT(resolved_y, y);
    TEST_ASSERT_TRUE(fallback == 0 || fallback == 1);
    placements++;
    *out_x = resolved_x + 1; /* placement can adjust a blocked destination */
    *out_y = resolved_y + 1;
    return placement_result[fallback];
}

void set_player_tile_position(uint x, uint y, int flag)
{
    placed_x = x;
    placed_y = y;
    positions++;
}

void set_pending_update_flags(ushort flags)
{
    TEST_ASSERT_TRUE(flags == 0x20 || flags == 0x7ffe);
    notifications++;
}

void report_fatal_error_and_exit(ushort error_code)
{
    TEST_FAIL_MESSAGE("Teleport unexpectedly reached a fatal-error path");
}

void full_dungeon_redraw(void) { redraws++; }

void weapon_overlay_flash_hold(int passes)
{
    TEST_ASSERT_EQUAL_INT(g_visibility_max_ring_passes, passes);
    overlay_holds++;
}

void weapon_overlay_flash_restore(int passes)
{
    TEST_ASSERT_EQUAL_INT(g_visibility_max_ring_passes, passes);
    overlay_restores++;
}

void after_level_change(void)
{
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(2, restored_level);
    callback_calls++;
}

void teleport_fixture_reset(void)
{
    memset(player, 0, sizeof(player));
    memset(other_object, 0, sizeof(other_object));
    ((byte *)player)[8] = 30;
    DAT_00201b68 = DAT_00201c7c = 1;
    DAT_00201c90 = DAT_00201c8c = 0;
    g_cursor_holding_state = 0;
    g_selected_object = NULL;
    DAT_00085730 = 0;
    DAT_00201c9c = NULL;
    g_visibility_max_ring_passes = 4;
    commit_result = load_result = 1;
    placement_result[0] = placement_result[1] = 1;
    resolved_x = 10;
    resolved_y = 20;
    commits = loads = placements = positions = cancelled_swings = 0;
    saved_level = loaded_level = restored_level = placed_x = placed_y = -1;
    notifications = cursor_updates = redraws = 0;
    overlay_holds = overlay_restores = callback_calls = 0;
    memset(character_record, 0, sizeof(character_record));
    memset(DAT_00204880_backing, 0, sizeof(DAT_00204880_backing));
    DAT_0023bea8 = DAT_0023be98 = DAT_0023bf18 = 0;
    DAT_002020d0 = DAT_000858a0 = 0;
    DAT_00086e84 = -1;
    DAT_0023bf60 = DAT_0023bf5c = DAT_0023bf64 = 0;
    g_movement_mode = 0;
    g_npc_tick_enabled = 1;
    destination_ticks = 0;
}

void teleport_fixture_dispose(void) {}

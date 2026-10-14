/* The success paths (level change, same-level move, non-player rejection) run in the real game: see
   test_teleport_game.c. These cases need a mocked failure (no placement, failed commit or load). */
#include "teleport_fixture.h"

void setUp(void) { teleport_fixture_reset(); }
void tearDown(void) { teleport_fixture_dispose(); }

static void test_blocked_same_level_destination_is_not_queued(void)
{
    placement_result[0] = 0;
    TEST_ASSERT_EQUAL_UINT32(2,
        teleport_object_to_level_tile(g_player_object, 10, 20, 1));
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00201c90);
    TEST_ASSERT_EQUAL_INT(0, notifications);
}

static void test_new_level_placement_retries_with_fallback(void)
{
    placement_result[0] = 0;
    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, 10, 20, 2));
    TEST_ASSERT_EQUAL_UINT32(1, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(2, placements);
    TEST_ASSERT_EQUAL_INT(1, positions);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201b68);
}

static void test_unplaceable_player_clears_pending_teleport(void)
{
    placement_result[0] = placement_result[1] = 0;
    TEST_ASSERT_EQUAL_UINT32(0x10,
        teleport_object_to_level_tile(g_player_object, 10, 20, 2));
    TEST_ASSERT_EQUAL_UINT32(0, dungeon_view_anim_tick());
    TEST_ASSERT_EQUAL_INT(2, placements);
    TEST_ASSERT_EQUAL_INT(0, positions);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00201c90);
    TEST_ASSERT_EQUAL_UINT8(0, ((byte *)player)[8]);
}

static void test_failed_commit_does_not_load_destination(void)
{
    commit_result = 0;
    TEST_ASSERT_EQUAL_INT(0, transition_to_level(1, 2));
    TEST_ASSERT_EQUAL_INT(1, saved_level);
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_EQUAL_INT(0, loads);
    TEST_ASSERT_EQUAL_INT(-1, restored_level);
}

static void test_failed_load_does_not_restore_destination_state(void)
{
    load_result = 0;
    TEST_ASSERT_EQUAL_INT(0, transition_to_level(1, 2));
    TEST_ASSERT_EQUAL_INT(1, commits);
    TEST_ASSERT_EQUAL_INT(1, loads);
    TEST_ASSERT_EQUAL_INT(2, loaded_level);
    TEST_ASSERT_EQUAL_INT(-1, restored_level);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_blocked_same_level_destination_is_not_queued);
    RUN_TEST(test_new_level_placement_retries_with_fallback);
    RUN_TEST(test_unplaceable_player_clears_pending_teleport);
    RUN_TEST(test_failed_commit_does_not_load_destination);
    RUN_TEST(test_failed_load_does_not_restore_destination_state);
    return UNITY_END();
}

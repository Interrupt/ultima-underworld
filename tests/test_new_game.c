/* The success path runs in the real game: see test_new_game_game.c. These cases need a mocked failure. */
#include "new_game_fixture.h"

void setUp(void) { new_game_fixture_reset(); }
void tearDown(void) { new_game_fixture_dispose(); }

static void test_cancelled_character_does_not_load_or_start_game(void)
{
    accept_character = false;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(0, saves);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, g_game_mode);
}

static void test_failed_world_copy_does_not_load_or_spawn(void)
{
    TEST_ASSERT_EQUAL_INT(0, unlink(data_link));
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(0, seeds);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, g_game_mode);
}

static void test_missing_level_archive_does_not_start_game(void)
{
    archive_ok = false;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_INT(0, closes);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, g_game_mode);
}

static void test_failed_level_load_closes_archive_without_spawning(void)
{
    scheduler_result = 0;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(0, textures);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, g_game_mode);
}

int main(void)
{
    UNITY_BEGIN();
    new_game_fixture_begin();
    RUN_TEST(test_cancelled_character_does_not_load_or_start_game);
    RUN_TEST(test_failed_world_copy_does_not_load_or_spawn);
    RUN_TEST(test_missing_level_archive_does_not_start_game);
    RUN_TEST(test_failed_level_load_closes_archive_without_spawning);
    new_game_fixture_end();
    return UNITY_END();
}

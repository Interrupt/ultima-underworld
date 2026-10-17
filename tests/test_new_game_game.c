/* Starting a new game in the real game: the shared new-game sequence (start_game_with_current_character)
   saves the character, seeds \SAVE0\lev.ark, loads level 1, places the player and enters gameplay.
   The character itself comes from the harness (no chargen UI), so chargen is not covered here. */
#include "unity.h"
#include "game_test_runner.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/level.h"

void setUp(void) {}
void tearDown(void) {}

static struct {
    int level, tile_x, tile_y, player_tile_index, mode, mode_dispatch, hp;
    unsigned short arena_marker;
    int level_loads, first_loaded_level;
} seen;

static void note_level_load(int level)
{
    if (seen.level_loads++ == 0) seen.first_loaded_level = level;
}

static void snapshot_new_game(void)
{
    seen.level = DAT_00201b68;
    seen.tile_x = g_player_object->tile_x;
    seen.tile_y = g_player_object->tile_y;
    seen.player_tile_index = DAT_00202080;
    seen.mode = g_game_mode;
    seen.mode_dispatch = g_mode_handler_row;
    seen.hp = g_player_object->npc_hp;
    seen.arena_marker = *(unsigned short *)(DAT_002029cc + 0x7c06);
    test_game_request_exit();
}

static void test_new_game_loads_level_one_and_enters_gameplay(void)
{
    uw_test_hooks hooks = { .pre_level_load = note_level_load, .on_game_start = snapshot_new_game };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_EQUAL_INT(1, seen.level_loads);
    TEST_ASSERT_EQUAL_INT(1, seen.first_loaded_level);
    TEST_ASSERT_EQUAL_HEX16(0x7577, seen.arena_marker); /* a real level block is in the arena */
    TEST_ASSERT_EQUAL_INT(1, seen.level);
    TEST_ASSERT_EQUAL_INT(32, seen.tile_x);
    TEST_ASSERT_EQUAL_INT(2, seen.tile_y);
    TEST_ASSERT_EQUAL_INT(160, seen.player_tile_index); /* spawn tile (32, 2) */
    TEST_ASSERT_EQUAL_INT(1, seen.mode);                /* gameplay mode */
    TEST_ASSERT_EQUAL_INT(0, seen.mode_dispatch);
    TEST_ASSERT_GREATER_THAN_INT(0, seen.hp);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_new_game_loads_level_one_and_enters_gameplay);
    return UNITY_END();
}

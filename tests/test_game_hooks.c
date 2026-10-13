/* Boots the real game headless through start_test_game and checks every lifecycle hook fires, in order. */
#include "unity.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/level.h"
#include "game_test_runner.h"
#include <string.h>

#define TICKS_TO_RUN 5

static char order[16];
static int ticks_pre, ticks_post, player_hp;

static void note(char c) { size_t n = strlen(order); if (n < sizeof order - 1) order[n] = c; }
static void pre_game_start(void) { note('P'); }
static const unsigned char marker_tile[4] = { 0x11, 0x22, 0x33, 0x44 };
static int levels_loaded, patch_result;
static void pre_level_load(int level)
{
    if (++levels_loaded == 1) {
        note('L');
        TEST_ASSERT_EQUAL_INT(1, level);
        patch_result = uw_test_patch_level_tile(level, 63, 63, marker_tile);
    }
}
static void on_game_start(void) { note('S'); player_hp = g_player_object->npc_hp; }
static void pre_game_tick(void) { ticks_pre++; }
static void post_game_tick(void) { if (++ticks_post == TICKS_TO_RUN) test_game_request_exit(); }
static void on_game_exit(void) { note('X'); }

void setUp(void) {}
void tearDown(void) {}

static void test_lifecycle(void)
{
    uw_test_hooks hooks = {
        .pre_game_start = pre_game_start, .pre_level_load = pre_level_load,
        .on_game_start = on_game_start, .pre_game_tick = pre_game_tick,
        .post_game_tick = post_game_tick, .on_game_exit = on_game_exit };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_EQUAL_STRING("PLSX", order);
    TEST_ASSERT_EQUAL_INT(0, patch_result);
    TEST_ASSERT_EQUAL_MEMORY(marker_tile, DAT_002029cc + UW_TEST_LEVEL_TILE_OFFSET(63, 63), 4);
    TEST_ASSERT_EQUAL_INT(TICKS_TO_RUN, ticks_post);
    TEST_ASSERT_EQUAL_INT(TICKS_TO_RUN, ticks_pre);
    TEST_ASSERT_GREATER_THAN_INT(0, player_hp);
}

static void test_null_hooks_boot_and_exit(void)
{
    TEST_ASSERT_EQUAL_INT(0, start_test_game(NULL));
}

static int skill_seen_at_start;
static void set_attack_skill(void) { ((unsigned char *)DAT_00086df8)[0x21] = 7; }
static void read_attack_skill(void) { skill_seen_at_start = ((unsigned char *)DAT_00086df8)[0x21]; test_game_request_exit(); }

static void test_pre_game_start_sets_up_the_player(void)
{
    uw_test_hooks hooks = { .pre_game_start = set_attack_skill, .on_game_start = read_attack_skill };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_EQUAL_INT(7, skill_seen_at_start);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_lifecycle);
    RUN_GAME_TEST(test_null_hooks_boot_and_exit);
    RUN_GAME_TEST(test_pre_game_start_sets_up_the_player);
    return UNITY_END();
}

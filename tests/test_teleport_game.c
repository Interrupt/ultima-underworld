/* Teleporting the player, run in the real game: real level archive, real placement, real level load. */
#include "unity.h"
#include "game_test_runner.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/level.h"

void setUp(void) {}
void tearDown(void) {}

#define MAX_LEVEL_LOADS 8
static int loaded_levels[MAX_LEVEL_LOADS], level_loads;
static int target_x, target_y, target_level;
static int final_level, final_x, final_y, final_hp, start_hp, teleport_result;
static int queued_after_request, request_pending_at_end;

static void record_level_load(int level)
{
    if (level_loads < MAX_LEVEL_LOADS) loaded_levels[level_loads] = level;
    level_loads++;
}

/* An open floor tile (type 1) of `level` at least `min_distance` tiles from the spawn (32, 2). */
static void find_open_tile(int level, int min_distance, int *x, int *y)
{
    static unsigned char block[UW_TEST_LEVEL_BLOCK_SIZE];
    TEST_ASSERT_EQUAL_INT(0, uw_test_read_level_block(level, block));
    for (int ty = 63; ty >= 0; ty--)
        for (int tx = 0; tx < 64; tx++) {
            int far_enough = abs(tx - 32) >= min_distance || abs(ty - 2) >= min_distance;
            if ((block[UW_TEST_LEVEL_TILE_OFFSET(tx, ty)] & 0xf) == 1 && far_enough) {
                *x = tx;
                *y = ty;
                return;
            }
        }
    TEST_FAIL_MESSAGE("no open tile found");
}

static void pre_level_load_find_target(int level)
{
    record_level_load(level);
    if (level_loads == 1) find_open_tile(target_level, target_level == 1 ? 8 : 0, &target_x, &target_y);
}

static void request_player_teleport(void)
{
    start_hp = g_player_object->npc_hp;
    teleport_result = teleport_object_to_level_tile(g_player_object, target_x, target_y, target_level);
    queued_after_request = DAT_00201c90;
}

static void finish_when_teleport_done(void)
{
    if (DAT_00201c90 != 0) return; /* request still pending */
    final_level = DAT_00201b68;
    final_x = g_player_object->tile_x;
    final_y = g_player_object->tile_y;
    final_hp = g_player_object->npc_hp;
    test_game_request_exit();
}

static void run_teleport(int level)
{
    target_level = level;
    uw_test_hooks hooks = {
        .pre_level_load = pre_level_load_find_target,
        .on_game_start = request_player_teleport,
        .post_game_tick = finish_when_teleport_done,
        .max_ticks = 500,
    };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    request_pending_at_end = DAT_00201c90;
}

static void test_player_changes_level_and_tile(void)
{
    run_teleport(2);
    TEST_ASSERT_EQUAL_INT(0x10, teleport_result);
    TEST_ASSERT_EQUAL_INT(target_x, queued_after_request); /* the request holds the destination tile */
    TEST_ASSERT_EQUAL_INT(0, request_pending_at_end);
    TEST_ASSERT_EQUAL_INT(2, level_loads);
    TEST_ASSERT_EQUAL_INT(1, loaded_levels[0]);
    TEST_ASSERT_EQUAL_INT(2, loaded_levels[1]);
    TEST_ASSERT_EQUAL_INT(2, final_level);
    TEST_ASSERT_EQUAL_INT(target_x, final_x);
    TEST_ASSERT_EQUAL_INT(target_y, final_y);
    TEST_ASSERT_GREATER_THAN_INT(0, final_hp);
    TEST_ASSERT_EQUAL_INT(start_hp, final_hp);
}

static void test_same_level_teleport_repositions_without_reloading(void)
{
    run_teleport(1);
    TEST_ASSERT_EQUAL_INT(0x10, teleport_result);
    TEST_ASSERT_EQUAL_INT(1, level_loads); /* only the initial load */
    TEST_ASSERT_EQUAL_INT(1, final_level);
    TEST_ASSERT_EQUAL_INT(target_x, final_x);
    TEST_ASSERT_EQUAL_INT(target_y, final_y);
}

static void try_teleporting_another_object(void)
{
    static ushort other_object[16];
    teleport_result = teleport_object_to_level_tile(other_object, 10, 20, 2);
    queued_after_request = DAT_00201c90;
    test_game_request_exit();
}

static void test_non_player_cannot_teleport_to_another_level(void)
{
    uw_test_hooks hooks = { .on_game_start = try_teleporting_another_object };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_EQUAL_INT(2, teleport_result);
    TEST_ASSERT_EQUAL_INT(0, queued_after_request);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_player_changes_level_and_tile);
    RUN_GAME_TEST(test_same_level_teleport_repositions_without_reloading);
    RUN_GAME_TEST(test_non_player_cannot_teleport_to_another_level);
    return UNITY_END();
}

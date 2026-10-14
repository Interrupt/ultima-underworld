/* Walking into walls and up steps, run in the real game: the player holds the real run key and the real
   movement and collision code decides where they end up on a patched stretch of level 1. */
#include "unity.h"
#include "game_test_runner.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/gx_stub.h"
#include <SDL.h>

void setUp(void) {}
void tearDown(void) {}

#define WALK_PASSES 240
#define START_X 32
#define START_Y 2
#define TILE_OPEN 1
#define TILE_SOLID 0

static int final_x, final_y, passes;
static double heading_deg;
static void (*build_course)(void);

static void set_tile(int x, int y, int type, int floor_height)
{
    unsigned char *tile = uw_test_live_tile(x, y);
    TEST_ASSERT_NOT_NULL(tile);
    tile[0] = (tile[0] & 0x00) | (type & 0xf) | ((floor_height & 0xf) << 4);
}

static void start_walking(void)
{
    build_course();
    demo_set_player_pos(START_X + 0.5, START_Y + 0.5, 640, heading_deg, 0);
    uw_inject_key_down(SDLK_w);
}

static void watch_walk(void)
{
    if (++passes < WALK_PASSES) return;
    final_x = DAT_00204880;
    final_y = DAT_00204882;
    test_game_request_exit();
}

static void walk_course(void (*course)(void), double heading)
{
    build_course = course;
    heading_deg = heading;
    uw_test_hooks hooks = { .on_game_start = start_walking, .post_game_tick = watch_walk, .max_ticks = WALK_PASSES + 50 };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
}

/* A flat open room (floor height 4) around the start, with walls where each course puts them. */
static void flat_room(void)
{
    for (int y = START_Y; y <= START_Y + 6; y++)
        for (int x = START_X - 6; x <= START_X + 6; x++) set_tile(x, y, TILE_OPEN, 4);
}

static void wall_across_row_five(void)
{
    flat_room();
    for (int x = START_X - 6; x <= START_X + 6; x++) set_tile(x, 5, TILE_SOLID, 4);
}

static void test_walking_head_on_into_a_wall_stops_short_of_it(void)
{
    walk_course(wall_across_row_five, 0); /* yaw 0 runs down +Y */
    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(START_Y * 256 + 128 + 256, final_y, "player should have walked forward");
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(5 * 256, final_y, "player should be stopped by the wall at row 5");
    TEST_ASSERT_INT_WITHIN_MESSAGE(40, START_X * 256 + 128, final_x, "a head-on walk should not drift sideways");
}

static void test_walking_into_a_wall_at_45_degrees_slides_along_it(void)
{
    walk_course(wall_across_row_five, 45);
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(5 * 256, final_y, "player should not pass through the wall");
    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(4 * 256, final_y, "player should have run up against the wall");
    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(256, abs(final_x - (START_X * 256 + 128)), "player should slide along the wall");
}

/* The start room, with a step of `rise` height units at row 4 across the whole room. */
static int step_rise;
static void room_with_step(void)
{
    flat_room();
    for (int x = START_X - 6; x <= START_X + 6; x++) set_tile(x, 4, TILE_OPEN, 4 + step_rise);
}

static void test_player_walks_up_a_one_unit_step(void)
{
    step_rise = 1; /* 8 world units: exactly the player's step limit */
    walk_course(room_with_step, 0);
    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(4 * 256 + 128, final_y, "player should have climbed onto the step");
}

static void test_player_is_stopped_by_a_two_unit_step(void)
{
    step_rise = 2; /* 16 world units: over the step limit */
    walk_course(room_with_step, 0);
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(4 * 256, final_y, "player should not climb a step over the limit");
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_walking_head_on_into_a_wall_stops_short_of_it);
    RUN_GAME_TEST(test_walking_into_a_wall_at_45_degrees_slides_along_it);
    RUN_GAME_TEST(test_player_walks_up_a_one_unit_step);
    RUN_GAME_TEST(test_player_is_stopped_by_a_two_unit_step);
    return UNITY_END();
}

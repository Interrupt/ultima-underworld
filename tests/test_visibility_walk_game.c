/* The visibility flood on the real level 1, run in the real game: the player is placed with the game's own
   demo_set_player_pos, the camera is set up by the game's own build_frame_draw_list, and the flood reads the
   real level in the game's tile arena. */
#include "unity.h"
#include "game_test_runner.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/visibility.h"
#include "src/headers/tmap.h"
#include <stdio.h>
#include <string.h>

void setUp(void) {}
void tearDown(void) {}

#define RING_BYTES 0x42 * 17

/* Place the player at a fixed-point (256 per tile) position facing a 16-bit angle, and run the game's flood. */
static void flood_at(int x_fixed, int y_fixed, int angle)
{
    demo_set_player_pos(x_fixed / 256.0, y_fixed / 256.0, 640, angle * 360.0 / 65536, 0);
    build_frame_draw_list();
    seed_visibility_queue();
    run_visibility_flood();
}

static unsigned char ring_cell(int depth, int side)
{
    return g_visibility_ring_buffer_backing[depth * 0x42 + (side + 16) * 2];
}

/* Visibility byte of a world tile as seen from the player's tile, undoing the view's quadrant rotation. */
static unsigned char visible_world_tile(int player_x, int player_y, int tile_x, int tile_y)
{
    int side_step = *(const short *)(DAT_00086a00_region + DAT_0023b4a0 * 6);
    int depth_step = *(const short *)(DAT_00086a00_region + DAT_0023b4a0 * 6 + 2);
    int dx = tile_x - player_x, dy = tile_y - player_y;
    int side = side_step == 1 ? dx : side_step == -1 ? -dx : side_step == 64 ? dy : -dy;
    int depth = depth_step == 1 ? dx : depth_step == -1 ? -dx : depth_step == 64 ? dy : -dy;
    if (depth < 0 || depth > g_visibility_ring_depth || side < -16 || side > 16) return 0;
    return ring_cell(depth, side);
}

/* Run `check` in the first pass, when the game is fully up, then end the game. */
static void (*check)(void);
static void run_check_then_exit(void)
{
    check();
    test_game_request_exit();
}
static void run_in_game(void (*fn)(void))
{
    check = fn;
    uw_test_hooks hooks = { .post_game_tick = run_check_then_exit };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
}

static void starting_hallway_is_contained(void)
{
    /* The new-game spawn (32,2) facing south down the starting hallway, flooding 8 rows. The hallway's real
       open width per depth, as [min_side, max_side]; anything outside, including the side rooms that branch
       off and the wider room past y=8, must stay unrevealed. */
    static const struct { int min_side, max_side; } hallway[9] = {
        {-1, 1}, {-2, 1}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-2, 1}, {-2, 0}, {-2, 0},
    };
    memset(g_visibility_ring_buffer_backing, 0, sizeof g_visibility_ring_buffer_backing);
    g_visibility_max_ring_passes = 8;
    flood_at(32 * 256 + 128, 2 * 256 + 128, 0);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(8, g_visibility_ring_depth);
    for (int depth = 0; depth <= 8; depth++)
        for (int side = -16; side <= 16; side++) {
            char msg[96];
            snprintf(msg, sizeof msg, "depth=%d (y=%d) side=%d (x=%d)", depth, 2 + depth, side, 32 + side);
            if (side >= hallway[depth].min_side && side <= hallway[depth].max_side)
                TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(depth, side), msg);
            else
                TEST_ASSERT_EQUAL_INT_MESSAGE(0, ring_cell(depth, side), msg);
        }
}

static void test_real_level_one_starting_hallway_is_contained(void) { run_in_game(starting_hallway_is_contained); }

static void westward_walk_has_no_previous_frame_visibility(void)
{
    g_visibility_max_ring_passes = 8;
    /* Reported route near (16.60,6.49), heading 276 degrees, four tiles west. */
    for (int x = 16; x >= 12; --x) {
        flood_at(x * 256 + 128, 6 * 256 + 128, 0xc444);
        unsigned char previous[sizeof g_visibility_ring_buffer_backing];
        memcpy(previous, g_visibility_ring_buffer_backing, sizeof previous);
        /* Clear only the visibility bytes: the odd bytes hold the real light grid the flood reads. */
        for (int cell = 0; cell < 17 * 33; ++cell) g_visibility_ring_buffer_backing[cell * 2] = 0;
        flood_at(x * 256 + 128, 6 * 256 + 128, 0xc444);
        for (int cell = 0; cell < 17 * 33; ++cell)
            TEST_ASSERT_EQUAL_HEX8(previous[cell * 2], g_visibility_ring_buffer_backing[cell * 2]);
    }
}

static void test_level_one_westward_walk_has_no_previous_frame_visibility(void)
{
    run_in_game(westward_walk_has_no_previous_frame_visibility);
}

static void adjacent_tiles_stay_visible_through_each_yaw_increment(void)
{
    g_visibility_max_ring_passes = 8;
    /* (26.36,4.07), z=640, pitch=0. Sweep +/-30 degrees around yaw 326 at EVERY 16-bit angle increment
       (~0.0055 degrees). Whole-degree samples miss the original dropout: angle 57281 = 314.65 degrees. */
    const int first_angle = (296 * 65536 + 180) / 360;
    const int last_angle = (356 * 65536 + 180) / 360;
    static const int adjacent[][2] = {{25, 4}, {25, 5}, {26, 5}};
    for (int pass = 0; pass < 2; ++pass) {
        int direction = pass == 0 ? 1 : -1;
        for (int sample = first_angle; sample <= last_angle; ++sample) {
            int angle = direction > 0 ? sample : first_angle + last_angle - sample;
            flood_at(6748, 1042, angle);
            for (unsigned i = 0; i < sizeof adjacent / sizeof adjacent[0]; ++i) {
                char message[128];
                snprintf(message, sizeof message, "tile=(%d,%d) yaw=%.9f angle=%d direction=%d",
                         adjacent[i][0], adjacent[i][1], angle * 360.0 / 65536, angle, direction);
                TEST_ASSERT_BITS_HIGH_MESSAGE(0x80, visible_world_tile(26, 4, adjacent[i][0], adjacent[i][1]), message);
            }
        }
    }
}

static void test_level_one_adjacent_tiles_stay_visible_through_each_yaw_increment(void)
{
    run_in_game(adjacent_tiles_stay_visible_through_each_yaw_increment);
}

static void tile_26_5_stays_visible_at_the_right_edge(void)
{
    /* The game's own level-1 shading grid, including its distance cutoff (no override). */
    const int first_angle = (81 * 65536 + 180) / 360;
    const int last_angle = (87 * 65536 + 180) / 360;
    for (int pass = 0; pass < 2; ++pass)
        for (int sample = first_angle; sample <= last_angle; ++sample) {
            int angle = pass == 0 ? sample : first_angle + last_angle - sample;
            flood_at(6111, 1715, angle); /* (23.87,6.70), z=640, pitch=0; visibility state kept between turns */
            char message[128];
            snprintf(message, sizeof message, "tile=(26,5) yaw=%.9f angle=%d direction=%d",
                     angle * 360.0 / 65536, angle, pass == 0 ? 1 : -1);
            TEST_ASSERT_BITS_HIGH_MESSAGE(0x80, visible_world_tile(23, 6, 26, 5), message);
        }
}

static void test_level_one_tile_26_5_stays_visible_at_the_right_edge(void)
{
    run_in_game(tile_26_5_stays_visible_at_the_right_edge);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_real_level_one_starting_hallway_is_contained);
    RUN_GAME_TEST(test_level_one_westward_walk_has_no_previous_frame_visibility);
    RUN_GAME_TEST(test_level_one_adjacent_tiles_stay_visible_through_each_yaw_increment);
    RUN_GAME_TEST(test_level_one_tile_26_5_stays_visible_at_the_right_edge);
    return UNITY_END();
}

#include "visibility_walk_fixture.h"
#include "src/headers/options.h"

void setUp(void) { visibility_walk_fixture_reset(); }
void tearDown(void) { visibility_walk_fixture_dispose(); }

static void test_open_room_reveals_the_player_and_tiles_ahead(void)
{
    run_flood(32, 32, 0);

    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(0, g_visibility_ring_depth,
        "expected the flood to expand past the player's own row in an open room");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(0, 0),
        "the player's own tile should be visible");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(1, 0),
        "the open tile straight ahead should be visible");
}

static void test_wall_blocks_tiles_behind_it(void)
{
    /* A full-width wall row 4 tiles straight ahead of the player at
       (32,32) -- wide enough that no diagonal path through a
       neighboring open tile can route around it (a single 1-tile wall
       in an open room legitimately doesn't block every ray to the
       tiles behind it, since the player can see around a lone
       obstacle; this is a real wall spanning the whole reachable
       width at that depth, confirmed empirically against this exact
       setup: the flood's own ring_depth stops at 3, one row short of
       the wall, every time). */
    for (int x = 10; x <= 54; x++) set_tile(x, 36, 0);
    /* Open, walkable rooms on the far side of the wall -- one straight
       ahead, one off to the side -- so this test also proves the flood
       doesn't walk INTO reachable-looking space just because it's open,
       not merely that it stops at some default depth. Both are already
       open floor by setUp's default fill; set_room just makes that
       intent explicit at this test's own coordinates. */
    set_room(28, 38, 36, 42);  /* straight ahead, depth 6-10 */
    set_room(16, 38, 22, 44);  /* off to the side, depth 6-12 */
    run_flood(32, 32, 0);

    TEST_ASSERT_EQUAL_INT_MESSAGE(3, g_visibility_ring_depth,
        "the flood should stop one row short of a full wall, not walk through it");
    TEST_ASSERT_NOT_EQUAL_MESSAGE(0, ring_cell(3, 0),
        "the open tile just short of the wall should still be visible");

    for (int y = 38; y <= 42; y++) {
        for (int x = 28; x <= 36; x++) {
            TEST_ASSERT_TRUE_MESSAGE(ring_cell_untouched(y - 32, x - 32),
                "the open room straight ahead, beyond the wall, should never be walked");
        }
    }
    for (int y = 38; y <= 44; y++) {
        for (int x = 16; x <= 22; x++) {
            TEST_ASSERT_TRUE_MESSAGE(ring_cell_untouched(y - 32, x - 32),
                "the open room to the side, beyond the wall, should never be walked");
        }
    }
}

static void test_flood_uses_the_original_16_row_bound(void)
{
    /* SHADES.DAT field 3 must not prematurely terminate the geometric flood. */
    g_visibility_max_ring_passes = 3;
    run_flood(32, 32, 0);
    TEST_ASSERT_EQUAL_INT_MESSAGE(16, g_visibility_ring_depth,
        "ARM FUN_0005c70c uses a literal 16-row bound independent of shading distance");
}

static void test_repeated_frames_clear_walls_outside_the_current_visibility_fan(void)
{
    /* Move and turn through an open room, retaining the old grid as the game does. Comparing
       the visibility byte against a fresh flood catches skipped clearing;
       the second byte contains lighting/edge metadata and is separate. */
    memset(g_visibility_ring_buffer_backing, 0, sizeof(g_visibility_ring_buffer_backing));
    g_visibility_max_ring_passes = 8;
    for (int frame = 0; frame < 64; ++frame) {
        int x = 28 + frame % 8, y = 28 + frame / 8;
        int facing = -0x1800 + (frame % 7) * 0x800;
        repeat_flood_on(tilemap, x, y, facing);
        int depth = g_visibility_ring_depth;
        unsigned char reused[33 * 17];
        for (int row = 0; row <= depth; ++row)
            for (int side = -16; side <= 16; ++side)
                reused[row * 33 + side + 16] = ring_cell(row, side);
        memset(g_visibility_ring_buffer_backing, 0, sizeof(g_visibility_ring_buffer_backing));
        repeat_flood_on(tilemap, x, y, facing);
        TEST_ASSERT_EQUAL_INT(depth, g_visibility_ring_depth);
        for (int row = 0; row <= depth; ++row)
            for (int side = -16; side <= 16; ++side)
            {
                char msg[96]; snprintf(msg, sizeof msg, "frame=%d row=%d side=%d", frame, row, side);
                TEST_ASSERT_EQUAL_HEX8_MESSAGE(reused[row * 33 + side + 16], ring_cell(row, side), msg);
            }
    }
}

static void test_visibility_reset_preserves_the_adjacent_light_grid(void)
{
    g_visibility_max_ring_passes = 3;
    /* The terminal row interior is not visited at this heading: lighting
       survives, stale visibility does not. */
    int offset = 16 * 0x42 + 32;
    g_visibility_ring_buffer_backing[offset] = 0x80;
    g_visibility_ring_buffer_backing[offset + 1] = 7;
    repeat_flood_on(tilemap, 32, 32, 0);
    TEST_ASSERT_EQUAL_HEX8(0, g_visibility_ring_buffer_backing[offset]);
    TEST_ASSERT_EQUAL_HEX8(7, g_visibility_ring_buffer_backing[offset + 1]);
}

static void test_right_frustum_edge_keeps_its_negative_y_direction(void)
{
    load_real_level_one();
    flood_at(level_one, 6748, 1042, 57281);
    /* Exact first failing angle: the right edge has just passed 90 degrees
       in quadrant-relative coordinates. Its signed Y delta must be -1. */
    short y_delta;
    /* The flood advances/recalculates rays, so inspect the seed directly. */
    seed_visibility_queue();
    memcpy(&y_delta, g_visibility_ray_table_backing + 0x18, sizeof y_delta);
    TEST_ASSERT_EQUAL_INT(-1, y_delta);
}

static void test_visibility_flood_reads_the_real_tile_light_grid(void)
{
    load_visibility_light_config(0); /* Level 1 without an active light: radius 3. */
    TEST_ASSERT_EQUAL_HEX8(0xf, g_visibility_ring_buffer_backing[4 * 66 + 33] & 0xf);
    flood_at(tilemap, 32 * 256 + 128, 32 * 256 + 128, 0);
    TEST_ASSERT_TRUE(visible_world_tile(32,32,32,33) & 0x80);
    TEST_ASSERT_EQUAL_HEX8(0, visible_world_tile(32,32,32,38));
    TEST_ASSERT_LESS_OR_EQUAL_INT(3, g_visibility_ring_depth);
}

static void test_stronger_light_expands_the_visible_automap_area(void)
{
    load_visibility_light_config(0);
    flood_at(tilemap, 32 * 256 + 128, 32 * 256 + 128, 0);
    TEST_ASSERT_EQUAL_HEX8(0, visible_world_tile(32,32,32,37));
    load_visibility_light_config(6); /* Bright light record: radius 7. */
    flood_at(tilemap, 32 * 256 + 128, 32 * 256 + 128, 0);
    TEST_ASSERT_TRUE(visible_world_tile(32,32,32,37) & 0x80);
    TEST_ASSERT_LESS_THAN_INT(8, g_visibility_ring_buffer_backing[2 * 66 + 33] & 0xf);
    TEST_ASSERT_EQUAL_HEX8(0, visible_world_tile(32,32,32,41));
}

static void test_arm_torch_updates_automap_light_and_extinguishing_restores_darkness(void)
{
    options_unset("light-mode"); /* Default ARM rendering. */
    refresh_player_equipment_effects();
    TEST_ASSERT_EQUAL_INT(0, visibility_light_config_record);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(8, g_visibility_ring_buffer_backing[66 + 33] & 0xf);
    equip_visibility_test_torch(1);
    refresh_player_equipment_effects();
    TEST_ASSERT_EQUAL_INT(4, visibility_light_config_record);
    TEST_ASSERT_EQUAL_INT(4, visibility_ambient_strength); /* the light level passed to set_ambient_bias_with_light */
    TEST_ASSERT_LESS_THAN_INT(8, g_visibility_ring_buffer_backing[66 + 33] & 0xf);
    flood_at(tilemap,32 * 256 + 128,32 * 256 + 128,0);
    TEST_ASSERT_TRUE(visible_world_tile(32,32,32,36) & 0x80);
    equip_visibility_test_torch(0);
    refresh_player_equipment_effects();
    TEST_ASSERT_EQUAL_INT(0, visibility_light_config_record);
    TEST_ASSERT_EQUAL_INT(0, visibility_ambient_strength);
    flood_at(tilemap,32 * 256 + 128,32 * 256 + 128,0);
    TEST_ASSERT_EQUAL_HEX8(0, visible_world_tile(32,32,32,36));
}

static void test_dos_torch_updates_the_same_automap_light_table(void)
{
    options_set("light-mode", "dos");
    equip_visibility_test_torch(1);
    refresh_player_equipment_effects();
    options_unset("light-mode");
    TEST_ASSERT_EQUAL_INT(4, visibility_light_config_record);
    TEST_ASSERT_EQUAL_INT(4, visibility_ambient_strength); /* DOS passes the same level */
    TEST_ASSERT_LESS_THAN_INT(8, g_visibility_ring_buffer_backing[66 + 33] & 0xf);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_open_room_reveals_the_player_and_tiles_ahead);
    RUN_TEST(test_wall_blocks_tiles_behind_it);
    RUN_TEST(test_flood_uses_the_original_16_row_bound);
    RUN_TEST(test_repeated_frames_clear_walls_outside_the_current_visibility_fan);
    RUN_TEST(test_visibility_reset_preserves_the_adjacent_light_grid);
    RUN_TEST(test_right_frustum_edge_keeps_its_negative_y_direction);
    RUN_TEST(test_visibility_flood_reads_the_real_tile_light_grid);
    RUN_TEST(test_stronger_light_expands_the_visible_automap_area);
    RUN_TEST(test_arm_torch_updates_automap_light_and_extinguishing_restores_darkness);
    RUN_TEST(test_dos_torch_updates_the_same_automap_light_table);
    return UNITY_END();
}

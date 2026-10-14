#include "unity.h"
#include "support/movement_fixture.h"

#define fx movement_fixture
void setUp(void) { movement_fixture_reset(); }
void tearDown(void) {}

static void test_wall_hit_at_45_degrees_left_turns_left_along_wall(void)
{
    const ushort incoming = 0x2000; /* 45 degrees left of head-on */
    movement_fixture_set_heading(incoming);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_HEX16(0, DAT_002049ce);
    TEST_ASSERT_EQUAL_HEX16(0, movement_fixture_read_short(0x21));
    TEST_ASSERT_EQUAL_INT16(-0x2000, (short)(DAT_002049ce - incoming));
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(1, fx.restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(2, DAT_002049bc);
    TEST_ASSERT_EQUAL_INT(100, fx.x);
    TEST_ASSERT_EQUAL_INT(200, fx.y);
}

static void test_wall_hit_at_45_degrees_right_turns_right_along_wall(void)
{
    const ushort incoming = 0x6000; /* 45 degrees right of head-on */
    movement_fixture_set_heading(incoming);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_HEX16(0x8000, DAT_002049ce);
    TEST_ASSERT_EQUAL_HEX16(0x8000, movement_fixture_read_short(0x21));
    TEST_ASSERT_EQUAL_INT16(0x2000, (short)(DAT_002049ce - incoming));
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(1, fx.restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(2, DAT_002049bc);
    TEST_ASSERT_EQUAL_INT(100, fx.x);
    TEST_ASSERT_EQUAL_INT(200, fx.y);
}

static void test_hard_block_clears_all_player_velocity(void)
{
    fx.wall_flags = 0x4000;
    movement_fixture_set_heading(0x4000);
    const int velocity_offsets[] = {6, 8, 10, 12, 14, 16, 20};
    for (unsigned i = 0; i < sizeof(velocity_offsets) / sizeof(velocity_offsets[0]); i++)
        movement_fixture_write_short(velocity_offsets[i], 123);
    sweep_apply_collision();
    for (unsigned i = 0; i < sizeof(velocity_offsets) / sizeof(velocity_offsets[0]); i++)
        TEST_ASSERT_EQUAL_INT16(0, movement_fixture_read_short(velocity_offsets[i]));
    TEST_ASSERT_EQUAL_INT(DAT_00086990 + 1, DAT_00086996);
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, fx.restarted_sweeps);
}

static void test_open_floor_does_not_stop_or_turn_player(void)
{
    fx.wall_flags = 4;
    movement_fixture_set_heading(0x2000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_HEX16(0x2000, movement_fixture_read_short(0x21));
    TEST_ASSERT_EQUAL_INT(0, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, fx.restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(1, DAT_00086996);
}

static void assert_step_allowed(byte destination_height)
{
    movement_fixture_prepare_stair(destination_height);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(destination_height, fx.foot_position[2]);
    TEST_ASSERT_BITS_HIGH(4, DAT_002049d4); /* walkable */
    TEST_ASSERT_EQUAL_INT(1, DAT_00204870); /* step resolved */
    TEST_ASSERT_EQUAL_INT16(0, movement_fixture_read_short(0x10)); /* no fall armed */
    TEST_ASSERT_EQUAL_INT(0, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, fx.restarted_sweeps);
    TEST_ASSERT_EQUAL_INT(101, fx.x);
    TEST_ASSERT_EQUAL_INT(201, fx.y);
    TEST_ASSERT_EQUAL_INT(1, fx.sampled_tiles);
}

static void test_walking_up_short_stair_succeeds(void)
{
    assert_step_allowed(36); /* rise 4, limit 8 */
}

static void assert_step_blocked(byte destination_height)
{
    movement_fixture_prepare_stair(destination_height);
    uint flags = sweep_collision_flags();
    TEST_ASSERT_BITS_HIGH(0x1000, flags);
    TEST_ASSERT_BITS_LOW(4, flags);
    TEST_ASSERT_EQUAL_INT16(32, fx.foot_position[2]);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(32, fx.foot_position[2]);
    TEST_ASSERT_EQUAL_INT(0, DAT_00204870);
    TEST_ASSERT_EQUAL_INT(1, fx.restarted_sweeps); /* blocked resolution */
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps); /* raised face rolls movement back */
    TEST_ASSERT_EQUAL_HEX16(0x4000, movement_fixture_read_short(0x21));
}

static void test_walking_from_low_tile_to_much_higher_tile_is_blocked(void)
{
    assert_step_blocked(64); /* rise 32, limit 8 */
}

static void test_player_cannot_auto_step_onto_high_footprint_floor(void)
{
    fx.foot_position[2] = 32;
    fx.destination_floor = 64;
    fx.wall_flags = 4; /* center is walkable, footprint overlaps a high face */
    fx.envelope_flags = 0x100;
    fx.response_mask[5] = 1; /* 16-bit geometry mask at +4 includes 0x100 */
    movement_fixture_set_heading(0x4000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(32, fx.foot_position[2]);
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(100, fx.x);
}

static void test_closed_door_candidate_preserves_full_object_link(void)
{
    fx.door_fixture = true;
    fx.wall_flags = 4;
    fx.destination_floor = 32;
    fx.foot_position[2] = 32;
    movement_fixture_set_heading((fx.door[1] & 0x100) != 0 ? 0x4000 : 0);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_UINT16(300, *(ushort *)(&DAT_00202c3a) >> 6);
    TEST_ASSERT_GREATER_THAN_INT(0, fx.door_contacts);
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(100, fx.x);
    TEST_ASSERT_EQUAL_INT16(32, fx.foot_position[2]);
}

static void test_open_door_does_not_block_player(void)
{
    fx.door_fixture = true;
    fx.door[0] = 0x148;
    fx.door[1] |= 96; /* fully lifted leaf, above the player's head */
    fx.destination_floor = 32;
    fx.foot_position[2] = 32;
    fx.wall_flags = 4;
    movement_fixture_set_heading(0x4000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(0, fx.door_contacts);
    TEST_ASSERT_EQUAL_INT(0, fx.reverted_steps);
}

static void test_jump_wall_rebound_rebuilds_floor_at_restored_position(void)
{
    fx.setup_fixture = true;
    /* Jump from tile (1,2) into the wall at (2,2). */
    fx.foot_position[0] = 16;
    fx.foot_position[1] = 16;
    fx.foot_position[2] = 50;
    fx.wall_flags = 0x200;
    movement_fixture_write_short(0x0a, 256);
    movement_fixture_write_short(0x10, -4);
    movement_fixture_set_heading(0x2000); /* bounce/slide along the wall */
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT16(8, fx.foot_position[0]);
    TEST_ASSERT_EQUAL_INT16(50, fx.foot_position[2]);
    TEST_ASSERT_EQUAL_INT16(8, DAT_002049c8); /* rollback updates collision XYZ too */

    movement_fixture_write_short(0x12, 64);
    TEST_ASSERT_EQUAL_INT(1, movement_sweep_setup(0, 1));
    sweep_step_vertical(0, 1);
    TEST_ASSERT_EQUAL_INT(0, fx.surface_landings);
    TEST_ASSERT_LESS_THAN_INT(50, fx.foot_position[2]);
    TEST_ASSERT_GREATER_THAN_INT(0, fx.foot_position[2]);
    TEST_ASSERT_EQUAL_INT16(8, DAT_002049c8);
    TEST_ASSERT_EQUAL_INT16(16, DAT_002049ca);
    TEST_ASSERT_EQUAL_INT16(0, (short)_DAT_0008699b);
    /* Subsequent sweeps continue the gravity arc all the way to the floor. */
    for (int tick = 0; tick < 10 && fx.surface_landings == 0; tick++) {
        short previous_height = fx.foot_position[2];
        TEST_ASSERT_EQUAL_INT(1, movement_sweep_setup(0, 1));
        sweep_step_vertical(0, 1);
        TEST_ASSERT_LESS_THAN_INT(previous_height, fx.foot_position[2]);
        TEST_ASSERT_GREATER_OR_EQUAL_INT(0, fx.foot_position[2]);
    }
    TEST_ASSERT_EQUAL_INT(1, fx.surface_landings);
    TEST_ASSERT_EQUAL_INT16(0, fx.foot_position[2]);
}

static void test_closed_door_blocks_in_opposite_orientation(void)
{
    fx.door[1] |= 0x100; /* heading 2: a quarter turn */
    test_closed_door_candidate_preserves_full_object_link();
}

static void test_airborne_floor_flags_do_not_revert_jump(void)
{
    fx.foot_position[2] = 50;
    fx.destination_floor = 32;
    fx.wall_flags = 0x100;
    movement_fixture_write_short(0x0a, 256);
    movement_fixture_write_short(0x10, -4);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT16(50, fx.foot_position[2]);
    TEST_ASSERT_EQUAL_INT16(256, movement_fixture_read_short(0x0a));
    TEST_ASSERT_EQUAL_INT(0, fx.reverted_steps);
}

static void test_collision_ignore_mask_keeps_high_bits(void)
{
    fx.wall_flags = 0x1000;
    fx.response_mask[1] = 0x10; /* short at +0, not just its low byte */
    movement_fixture_set_heading(0x4000);
    sweep_apply_collision();
    TEST_ASSERT_EQUAL_INT(0, fx.reverted_steps);
    TEST_ASSERT_EQUAL_INT(0, fx.restarted_sweeps);
    TEST_ASSERT_EQUAL_INT16(0, movement_fixture_read_short(0x10));
}

static void test_candidate_sort_keeps_heights_links_and_offsets_together(void)
{
    const byte unsorted[] = {90, 70, 9, 75, 1, 0,
                            60, 40, 9, 75, 2, 0};
    memcpy(DAT_00202c38_backing, unsorted, sizeof(unsorted));
    DAT_002049dc = 2;
    DAT_002049cc = 32;
    DAT_002049d1 = 16;
    sort_collision_candidates();
    TEST_ASSERT_EQUAL_UINT8(60, (&DAT_00202c38)[0]);
    TEST_ASSERT_EQUAL_UINT8(40, (&DAT_00202c39)[0]);
    TEST_ASSERT_EQUAL_UINT16(300, *(ushort *)&DAT_00202c3a >> 6);
    TEST_ASSERT_EQUAL_UINT16(2, *(ushort *)&DAT_00202c3c);
    TEST_ASSERT_EQUAL_UINT8(90, (&DAT_00202c38)[6]);
    TEST_ASSERT_EQUAL_UINT16(1, *(ushort *)(&DAT_00202c3c + 6));
    TEST_ASSERT_EQUAL_UINT8(1, DAT_002049dd); /* one object overlaps the head */
}

static void test_static_door_contact_builds_snapshot_without_moving_door(void)
{
    ushort before[16];
    memcpy(before, fx.door, sizeof(before));
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(fx.player, fx.door));
    TEST_ASSERT_EQUAL_INT(1, fx.door_contacts);
    TEST_ASSERT_EQUAL_INT(0, fx.obstacle_syncs); /* zero mass, fixed door */
    TEST_ASSERT_EQUAL_MEMORY(before, fx.door, sizeof(before));
}

static void test_contact_snapshot_updates_contiguous_velocity_speed_and_heading(void)
{
    byte *row = ((byte *)g_object_type_props) + 0x140 * 13;
    row[1] = 0x43; /* mass 4, radius 3 */
    row[2] = 0;
    movement_fixture_write_short(0x18, 4); /* moving object's mass */
    movement_fixture_write_short(0x0a, -256);
    movement_fixture_set_heading(0x2345);
    DAT_002046d8 = 7;
    DAT_002046dc = 9;
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(fx.player, fx.door));
    TEST_ASSERT_EQUAL_INT(1, fx.door_contacts);
    TEST_ASSERT_EQUAL_INT(1, fx.obstacle_syncs);
    TEST_ASSERT_EQUAL_INT16(-256, *(short *)(fx.last_obstacle_snapshot + 0x0a));
    TEST_ASSERT_EQUAL_UINT16(235, *(ushort *)(fx.last_obstacle_snapshot + 0x14));
    TEST_ASSERT_EQUAL_UINT16(0x2345, *(ushort *)(fx.last_obstacle_snapshot + 0x21));
    TEST_ASSERT_EQUAL_UINT16(300, *(ushort *)(fx.last_obstacle_snapshot + 0x23));
    TEST_ASSERT_EQUAL_INT16(7, DAT_0010144c);
    TEST_ASSERT_EQUAL_INT16(9, DAT_00101454);
}

static void test_contact_mass_ratio_caps_transferred_velocity(void)
{
    byte *row = ((byte *)g_object_type_props) + 0x140 * 13;
    row[1] = 0x13; /* mass 1 */
    row[2] = 0;
    movement_fixture_write_short(0x18, 4);
    movement_fixture_write_short(0x0a, -256);
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(fx.player, fx.door));
    TEST_ASSERT_EQUAL_INT(1, fx.obstacle_syncs);
    TEST_ASSERT_EQUAL_INT16(-512, *(short *)(fx.last_obstacle_snapshot + 0x0a));
}

static void test_contact_without_obstacle_returns_blocking_flag(void)
{
    TEST_ASSERT_EQUAL_UINT(4, apply_object_collision_scatter(fx.player, NULL));
    TEST_ASSERT_EQUAL_INT(0, fx.door_contacts);
    TEST_ASSERT_EQUAL_INT(0, fx.obstacle_syncs);
}

static void test_real_door_types_use_collision_radius_three_not_shape_four(void)
{
    /* "Door collision box seems too large and misplaced" investigation:
       collision_add_candidate_object (src/collision.c) special-cases
       local_40[1]&7 == 4 into a fixed FULL-TILE box instead of a
       radius-centered one. movement_fixture_reset already loads the
       real data/DATA/COMOBJ.DAT (via uw_test_load_object_properties,
       not synthetic data) into ((byte *)g_object_type_props), so this reads the
       real per-door-type byte directly: every one of the 8 door type
       ids (0x140-0x147 -- "7 door skins/types + secret", confirmed by
       src/tmap.c's emit_anim_object_frames comment) has collision_radius
       == 3, never 4, ruling out the full-tile branch for doors. */
    for (int door_type = 0x140; door_type <= 0x147; door_type++) {
        byte *row = ((byte *)g_object_type_props) + door_type * 13;
        TEST_ASSERT_EQUAL_INT_MESSAGE(3, row[1] & 7, "real COMOBJ.DAT door collision_radius");
    }
}

static void assert_door_bounds_use_original_radius_and_packed_position(void)
{
    /* collision_add_candidate_object / ARM 0x516e4..0x51790 uses a square radius. Heading
       does not change it, and packed positions 3 and 4 remain distinct. */
    for (int packed_position = 3; packed_position <= 4; packed_position++) {
        for (int heading = 0; heading < 8; heading += 2) {
            fx.door[1] = (packed_position << 13) | (packed_position << 10) | (heading << 7);
            for (int axis = 0; axis < 2; axis++) {
                for (int position = -2; position <= 9; position++) {
                    DAT_002049dc = 0;
                    DAT_00202c18 = axis == 0 ? position : packed_position;
                    DAT_00202c1c = axis == 1 ? position : packed_position;
                    DAT_00202c20 = DAT_00202c18 - 1;
                    DAT_00202c28 = DAT_00202c18 + 1;
                    DAT_00202c24 = DAT_00202c1c - 1;
                    DAT_00202c2c = DAT_00202c1c + 1;
                    collision_add_candidate_object(fx.door, 300, 0, 0, 0);
                    TEST_ASSERT_EQUAL_INT(position >= packed_position - 4 &&
                                          position <= packed_position + 4, DAT_002049dc);
                }
            }
        }
    }
}

static void test_door_bounds_use_original_radius_and_packed_position(void)
{
    /* All eight shipped closed-door types use COMOBJ radius 3. Keep the
       ARM square bounds and the packed position, rather than estimating
       collision extents from the leaf's currently rotated mesh. */
    for (int skin = 0; skin < 8; skin++) {
        fx.door[0] = 0x140 + skin;
        TEST_ASSERT_EQUAL_UINT8(3, ((byte *)g_object_type_props)[(0x140 + skin) * 13 + 1] & 7);
        assert_door_bounds_use_original_radius_and_packed_position();
    }
}

static void test_object_slide_uses_original_movement_axis(void)
{
    for (int heading = 0; heading < 4; heading += 2) {
        for (int axis = 0; axis < 2; axis++) {
            movement_fixture_reset();
            fx.door_fixture = true;
            fx.wall_flags = 4;
            fx.door[1] |= heading << 7;
            DAT_0008698c = axis;
            movement_fixture_set_heading(0x2000);
            sweep_apply_collision();
            TEST_ASSERT_EQUAL_HEX16(axis == 0 ? 0 : 0x4000, movement_fixture_read_short(0x21));
            TEST_ASSERT_EQUAL_INT(1, fx.reverted_steps);
            TEST_ASSERT_EQUAL_INT(1, fx.restarted_sweeps);
        }
    }
}

static void test_copied_collision_links_resolve_like_arena_links(void)
{
    /* These are real calls to FUN_00053514, not an unrestricted lookup stub. */
    *(ushort *)(fx.object_arena + 2) = (300 << 6) | 0x19;
    TEST_ASSERT_EQUAL_PTR(fx.door, resolve_object_link((ushort *)(fx.object_arena + 2)));
    for (int i = 0; i < 9; i++) {
        ushort *link = (ushort *)(&DAT_00202c3a + i * 6);
        *link = (300 << 6) | 0x39;
        TEST_ASSERT_EQUAL_PTR(fx.door, resolve_object_link(link));
        *link = (1 << 6) | 0x19;
        TEST_ASSERT_EQUAL_PTR(fx.player, resolve_object_link(link));
        *link = 0x19;
        TEST_ASSERT_NULL(resolve_object_link(link));
    }
}

static void test_door_contact_lookup_returns_full_pointer_and_tile(void)
{
    DAT_002049dc = DAT_002049dd = 1;
    DAT_002049de = 0;
    *(ushort *)(&DAT_00202c3a) = (300 << 6) | 0x39;
    *(short *)(&DAT_00202c3c) = 0; /* door is in the current tile */
    byte tile_x = 0, tile_y = 0;
    void *found_door = find_nearby_door_in_candidates(&tile_x, &tile_y);
    TEST_ASSERT_EQUAL_PTR(fx.door, found_door);
    TEST_ASSERT_EQUAL_UINT8(1, tile_x);
    TEST_ASSERT_EQUAL_UINT8(2, tile_y);
    TEST_ASSERT_EQUAL_PTR(fx.door, get_first_nearby_candidate_object());
    fx.door[0] = 0x148;
    TEST_ASSERT_NULL(find_nearby_door_in_candidates(&tile_x, &tile_y));
    DAT_002049dd = 0;
    TEST_ASSERT_NULL(get_first_nearby_candidate_object());
}

static void test_sweep_initialization_and_rollback_share_collision_xyz(void)
{
    movement_fixture_write_short(0, 12 * 32 + 7);
    movement_fixture_write_short(2, 20 * 32 + 9);
    movement_fixture_write_short(4, 80 * 8 + 3);
    sweep_init_position();
    TEST_ASSERT_EQUAL_PTR(DAT_00202c6c, g_sweep_foot_pos);
    TEST_ASSERT_EQUAL_INT16(12, DAT_002049c8);
    TEST_ASSERT_EQUAL_INT16(20, DAT_002049ca);
    TEST_ASSERT_EQUAL_INT16(80, DAT_002049cc);
    DAT_0008698c = 0;
    DAT_0008698e = 1;
    DAT_00086996 = 0;
    DAT_00086990 = 3;
    *(short *)(&DAT_00086986) = 0x2000;
    *(short *)(&DAT_00086986 + 2) = 0;
    sweep_integrate_substep(0, 1);
    TEST_ASSERT_EQUAL_INT16(13, DAT_002049c8);
    sweep_integrate_substep(0, -1);
    TEST_ASSERT_EQUAL_INT16(12, DAT_002049c8);
    TEST_ASSERT_EQUAL_INT16(20, DAT_002049ca);
    TEST_ASSERT_EQUAL_INT16(80, DAT_002049cc);
}

static void test_real_substep_rollback_restores_fractional_position_on_both_axes(void)
{
    for (int axis = 0; axis < 2; axis++) {
        for (int direction = -1; direction <= 1; direction += 2) {
            fx.foot_position[0] = 8;
            fx.foot_position[1] = 16;
            DAT_00086980 = 0x1000;
            DAT_00086982 = 0x1800;
            DAT_0008698c = axis;
            DAT_0008698e = 1 - axis;
            DAT_00086996 = 0;
            DAT_00086990 = 3;
            *(short *)(&DAT_00086986 + axis * 2) = direction * 0x20;
            *(short *)(&DAT_00086986 + (1 - axis) * 2) = direction * 0x1200;
            TEST_ASSERT_EQUAL_INT(1, sweep_integrate_substep(0, 1));
            const int fraction = (axis == 0 ? 0x1800 : 0x1000) + direction * 0x1200;
            const int carry = fraction < 0 ? -1 : fraction >= 0x2000 ? 1 : 0;
            TEST_ASSERT_EQUAL_INT16(8 + (axis == 0 ? direction : carry), fx.foot_position[0]);
            TEST_ASSERT_EQUAL_INT16(16 + (axis == 1 ? direction : carry), fx.foot_position[1]);
            TEST_ASSERT_EQUAL_HEX16(axis == 0 ? 0x1000 : fraction & 0x1fff, DAT_00086980);
            TEST_ASSERT_EQUAL_HEX16(axis == 1 ? 0x1800 : fraction & 0x1fff, DAT_00086982);
            TEST_ASSERT_EQUAL_INT(1, sweep_integrate_substep(0, -1));
            TEST_ASSERT_EQUAL_INT16(8, fx.foot_position[0]);
            TEST_ASSERT_EQUAL_INT16(16, fx.foot_position[1]);
            TEST_ASSERT_EQUAL_HEX16(0x1000, DAT_00086980);
            TEST_ASSERT_EQUAL_HEX16(0x1800, DAT_00086982);
            TEST_ASSERT_EQUAL_INT(0, DAT_00086996);
        }
    }
}

static void test_unchanged_signed_travel_heading_does_not_turn_camera_again(void)
{
    for (int reverse = 0; reverse < 2; reverse++) {
        ushort tangent = 0x4000 + reverse * 0x8000;
        ushort yaw = 0x2400 + reverse * 0x8000;
        DAT_00201c70 = (short)yaw;
        DAT_00201c78 = tangent;
        movement_fixture_set_heading(tangent);
        for (int tick = 0; tick < 10; tick++) {
            commit_player_move();
            TEST_ASSERT_EQUAL_HEX16(yaw, DAT_00201c70);
        }
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_wall_hit_at_45_degrees_left_turns_left_along_wall);
    RUN_TEST(test_wall_hit_at_45_degrees_right_turns_right_along_wall);
    RUN_TEST(test_hard_block_clears_all_player_velocity);
    RUN_TEST(test_open_floor_does_not_stop_or_turn_player);
    RUN_TEST(test_walking_up_short_stair_succeeds);
    RUN_TEST(test_walking_from_low_tile_to_much_higher_tile_is_blocked);
    RUN_TEST(test_player_cannot_auto_step_onto_high_footprint_floor);
    RUN_TEST(test_closed_door_candidate_preserves_full_object_link);
    RUN_TEST(test_open_door_does_not_block_player);
    RUN_TEST(test_jump_wall_rebound_rebuilds_floor_at_restored_position);
    RUN_TEST(test_closed_door_blocks_in_opposite_orientation);
    RUN_TEST(test_airborne_floor_flags_do_not_revert_jump);
    RUN_TEST(test_collision_ignore_mask_keeps_high_bits);
    RUN_TEST(test_candidate_sort_keeps_heights_links_and_offsets_together);
    RUN_TEST(test_static_door_contact_builds_snapshot_without_moving_door);
    RUN_TEST(test_contact_snapshot_updates_contiguous_velocity_speed_and_heading);
    RUN_TEST(test_contact_mass_ratio_caps_transferred_velocity);
    RUN_TEST(test_contact_without_obstacle_returns_blocking_flag);
    RUN_TEST(test_real_door_types_use_collision_radius_three_not_shape_four);
    RUN_TEST(test_door_bounds_use_original_radius_and_packed_position);
    RUN_TEST(test_object_slide_uses_original_movement_axis);
    RUN_TEST(test_copied_collision_links_resolve_like_arena_links);
    RUN_TEST(test_door_contact_lookup_returns_full_pointer_and_tile);
    RUN_TEST(test_sweep_initialization_and_rollback_share_collision_xyz);
    RUN_TEST(test_real_substep_rollback_restores_fractional_position_on_both_axes);
    RUN_TEST(test_unchanged_signed_travel_heading_does_not_turn_camera_again);
    return UNITY_END();
}

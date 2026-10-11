#include "npc_ai_fixture.h"

void setUp(void) { npc_ai_fixture_reset(); }
void tearDown(void) { npc_ai_fixture_dispose(); }

static void test_loaded_perception_and_health_fields_share_monster_table(void)
{
    TEST_ASSERT_EQUAL_PTR(((byte *)g_monster_type_props) + 4,
                          &g_monster_type_props[0].max_hp);
    TEST_ASSERT_EQUAL_PTR(((byte *)g_monster_type_props) + 0x1d,
                          &g_monster_type_props[0].detection_ranges);
    TEST_ASSERT_EQUAL_UINT8(g_monster_type_props[8].detection_ranges,
                            ((byte *)g_monster_type_props)[8 * 0x30 + 0x1d]);
}
static void test_hostile_npc_notices_nearby_player_and_chases(void)
{
    for (int tick = 0; tick < 8 && chase_steps == 0; tick++)
        npc_ai_tick();
    TEST_ASSERT_EQUAL_UINT8(5, npc_bytes()[0xb] & 0xf);
    TEST_ASSERT_EQUAL_UINT16(1, (*(ushort *)(npc_bytes() + 0xb) >> 4) & 0xff);
    TEST_ASSERT_GREATER_THAN_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(10, last_chase_x);
    TEST_ASSERT_EQUAL_INT(13, last_chase_y);
}
static void test_line_walk_records_waypoints_without_corrupting_ai_globals(void)
{
    byte profile[8] = {0};
    DAT_00101438 = (char *)profile;
    TEST_ASSERT_EQUAL_INT(1, try_direct_line_walk(10, 10, 10, 13));
    TEST_ASSERT_EQUAL_UINT8(4, DAT_0010142c);
    for (int step = 0; step < 4; step++) {
        TEST_ASSERT_EQUAL_UINT8(10, (&DAT_00101740)[step * 7]);
        TEST_ASSERT_EQUAL_UINT8(10 + step, (&DAT_00101741)[step * 7]);
    }
    TEST_ASSERT_EQUAL_PTR(npc, DAT_0010190c);
    TEST_ASSERT_EQUAL_PTR(profile, DAT_00101438);
    TEST_ASSERT_EQUAL_INT(1, DAT_00101734);
}
static void test_repeated_walking_preserves_npc_position_and_ai_pointers(void)
{
    byte profile[8] = {0};
    DAT_00101438 = (char *)profile;
    npc_set_goal(5, 1);
    for (int tick = 0; tick < 128; tick++) {
        npc_walk_toward_tile(10, 13, 0);
        TEST_ASSERT_EQUAL_PTR(npc, DAT_0010190c);
        TEST_ASSERT_EQUAL_PTR(profile, DAT_00101438);
        TEST_ASSERT_EQUAL_INT(1, DAT_00101734);
        TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
        TEST_ASSERT_EQUAL_UINT8(5, npc_bytes()[0xb] & 0xf);
        TEST_ASSERT_EQUAL_UINT8(0x2c, npc_bytes()[0x15] & 0x3f);
        TEST_ASSERT_EQUAL_UINT8((byte)*(char *)&DAT_00101404->movement_speed,
                                npc_bytes()[0x13] & 0x7f);
    }
    TEST_ASSERT_GREATER_THAN_INT(0, chase_steps);
}
static void test_hostile_npc_in_melee_range_completes_an_attack(void)
{
    set_position(player, 10, 11);
    for (int tick = 0; tick < 64 && attacks == 0; tick++)
        npc_ai_tick();
    TEST_ASSERT_GREATER_THAN_INT(0, attacks);
    TEST_ASSERT_EQUAL_UINT8(5, npc_bytes()[0xb] & 0xf);
    TEST_ASSERT_EQUAL_UINT8(30, ((byte *)player)[8]);
}
static void test_ready_melee_attack_uses_every_arm_charge_scale(void)
{
    for (unsigned charge = 0; charge < 16; charge++) {
        npc_ai_fixture_reset();
        set_position(player, 10, 11);
        ushort ready_goal = 0x4015; /* attack frame 4, target player 1, goal 5 */
        memcpy(npc_bytes() + 0xb, &ready_goal, sizeof ready_goal);
        npc_bytes()[0x15] = 1; /* first melee style */
        npc_bytes()[0x10] = charge << 4;
        npc_ai_tick();
        /* The attack fixture checks the actual strength argument against ARM
           values, not merely that an attack callback was invoked. */
        TEST_ASSERT_EQUAL_INT(1, attacks);
    }
}

static void test_wide_engage_goal_completes_a_melee_attack(void)
{
    npc_set_goal(9, 1);
    set_position(player, 10, 11);
    for (int tick = 0; tick < 64 && attacks == 0; tick++) npc_ai_tick();
    TEST_ASSERT_GREATER_THAN_INT(0, attacks);
    TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
}
static void test_wide_engage_goal_advances_stance_without_corrupting_tile_position(void)
{
    npc_set_goal(9, 1);
    set_position(player, 10, 12);
    npc_ai_tick();
    TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
    TEST_ASSERT_EQUAL_UINT8(1, npc_bytes()[0xc] >> 4);
    TEST_ASSERT_EQUAL_UINT8(0, npc_bytes()[0x15] & 0x3f);
}
static void test_target_delta_preserves_signed_full_tile_distance(void)
{
    npc_set_goal(5, 1);
    set_position(player, 52, 1);
    TEST_ASSERT_EQUAL_INT(1, refresh_npc_target_delta());
    TEST_ASSERT_EQUAL_INT(42 * 8, DAT_00101444);
    TEST_ASSERT_EQUAL_INT(-9 * 8, DAT_00101448);
}
static void test_alert_npc_attacks_from_each_direction_without_changing_position(void)
{
    const int positions[4][2] = {{11, 10}, {9, 10}, {10, 11}, {10, 9}};
    for (int direction = 0; direction < 4; direction++) {
        npc_set_goal(5, 1);
        npc_bytes()[0x15] = 0x20;
        npc_bytes()[0xc] &= 0xf;
        random_index = 0;
        attacks = 0;
        set_position(player, positions[direction][0], positions[direction][1]);
        for (int tick = 0; tick < 64 && attacks == 0; tick++) npc_ai_tick();
        TEST_ASSERT_GREATER_THAN_INT(0, attacks);
        TEST_ASSERT_EQUAL_UINT16((10 << 10) | (10 << 4), npc[0xb]);
        TEST_ASSERT_EQUAL_UINT16((4 << 10) | (4 << 13), npc[1] & 0xfc7f);
    }
}
static void test_hostile_npc_cannot_notice_player_through_a_wall(void)
{
    los_clear = 0;
    for (int tick = 0; tick < 16; tick++) npc_ai_tick();
    TEST_ASSERT_EQUAL_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_NOT_EQUAL(5, npc_bytes()[0xb] & 0xf);
}
static void test_hostile_npc_does_not_notice_player_outside_detection_range(void)
{
    set_position(player, 10, 16);
    for (int tick = 0; tick < 16; tick++) npc_ai_tick();
    TEST_ASSERT_EQUAL_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_NOT_EQUAL(5, npc_bytes()[0xb] & 0xf);
}
static void test_friendly_npc_does_not_start_a_chase_or_attack(void)
{
    npc_bytes()[0xe] = 0xc0;
    for (int tick = 0; tick < 16; tick++) npc_ai_tick();
    TEST_ASSERT_EQUAL_INT(0, chase_steps);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_NOT_EQUAL(5, npc_bytes()[0xb] & 0xf);
}
/* Critter 0x4d is a goblin with a ranged weapon (weapon_loot[0] bit pattern 0x21). */
static void become_ranged_goblin(void)
{
    npc[0] = 0x4d;
    DAT_00101404 = &g_monster_type_props[13];
    npc_bytes()[8] = g_monster_type_props[13].max_hp;
}
static void test_ranged_goblin_throws_its_weapon_at_a_player_in_range(void)
{
    become_ranged_goblin();
    ranged_allowed = 1;
    npc_set_goal(5, 1);
    set_position(player, 10, 12);
    for (int tick = 0; tick < 128 && thrown_weapons == 0; tick++) npc_ai_tick();
    TEST_ASSERT_GREATER_THAN_INT(0, thrown_weapons);
    TEST_ASSERT_EQUAL_INT(0, attacks);
    TEST_ASSERT_EQUAL_INT(0, thrown_offset); /* ranged type 0: the sling stone */
    TEST_ASSERT_EQUAL_INT(g_ranged_type_props[0].projectile_speed, thrown_speed);
}
static void test_ranged_line_of_sight_aims_at_the_players_actual_height(void)
{
    /* The ARM reads the target's Z from the position word at byte 2 (bits 0-6). */
    become_ranged_goblin();
    g_object_type_props[0x4d].height = 10;
    g_object_type_props[0x7f].height = 20;
    npc[1] |= 30;    /* goblin standing at z = 30 */
    player[1] |= 40; /* player at z = 40 */
    npc_set_goal(5, 1);
    set_position(player, 10, 12);
    player[1] |= 40;
    TEST_ASSERT_EQUAL_INT(1, refresh_npc_target_delta());
    try_npc_special_ability_alt();
    TEST_ASSERT_GREATER_THAN_INT(0, los_calls);
    TEST_ASSERT_EQUAL_INT(10 + 30, los_from_z);
    TEST_ASSERT_EQUAL_INT(20 + 40, los_to_z);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_loaded_perception_and_health_fields_share_monster_table);
    RUN_TEST(test_hostile_npc_notices_nearby_player_and_chases);
    RUN_TEST(test_line_walk_records_waypoints_without_corrupting_ai_globals);
    RUN_TEST(test_repeated_walking_preserves_npc_position_and_ai_pointers);
    RUN_TEST(test_hostile_npc_in_melee_range_completes_an_attack);
    RUN_TEST(test_ready_melee_attack_uses_every_arm_charge_scale);
    RUN_TEST(test_wide_engage_goal_completes_a_melee_attack);
    RUN_TEST(test_wide_engage_goal_advances_stance_without_corrupting_tile_position);
    RUN_TEST(test_target_delta_preserves_signed_full_tile_distance);
    RUN_TEST(test_alert_npc_attacks_from_each_direction_without_changing_position);
    RUN_TEST(test_hostile_npc_cannot_notice_player_through_a_wall);
    RUN_TEST(test_hostile_npc_does_not_notice_player_outside_detection_range);
    RUN_TEST(test_friendly_npc_does_not_start_a_chase_or_attack);
    RUN_TEST(test_ranged_goblin_throws_its_weapon_at_a_player_in_range);
    RUN_TEST(test_ranged_line_of_sight_aims_at_the_players_actual_height);
    return UNITY_END();
}

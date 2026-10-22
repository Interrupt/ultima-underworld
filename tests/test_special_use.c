#include "special_use_fixture.h"
void setUp(void) { special_use_fixture_reset(); }
void tearDown(void) { special_use_fixture_dispose(); }

static void test_level_one_fountain_heals_the_player_using_its_real_effect_record(void)
{
    ushort *fountain = special_use_object(667);
    TEST_ASSERT_EQUAL_HEX16(0x12e, fountain[0] & 0x1ff);
    dispatch_use_special_item_by_type((ushort *)g_player_object, fountain, 0);
    TEST_ASSERT_EQUAL_INT(1, special_use_fixture.dice);
    TEST_ASSERT_EQUAL_INT(16, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(1, special_use_fixture.health_refreshes);
    TEST_ASSERT_EQUAL_INT(0xf9, special_use_fixture.message);
    TEST_ASSERT_EQUAL_INT(1, special_use_fixture.messages);
}
static void test_fountain_healing_is_capped_at_player_maximum_health(void)
{
    ((byte *)g_player_object)[8] = special_use_fixture.attributes[4] - 1;
    dispatch_use_special_item_by_type((ushort *)g_player_object, special_use_object(667), 0);
    TEST_ASSERT_EQUAL_INT(special_use_fixture.attributes[4], ((byte *)g_player_object)[8]);
}
static void test_tile_special_action_preserves_actor_and_healing_target_addresses(void)
{
    DAT_00087530_backing[4] = 4 << 3;
    DAT_00087530_backing[7] = 15; /* full heal */
    dispatch_trap_special_or_tile_action(20, 20, g_player_object, g_player_object, 0xffff, 1);
    TEST_ASSERT_EQUAL_INT(special_use_fixture.attributes[4], ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(0, special_use_fixture.dice);
}
static void test_bedroll_scans_safe_area_without_losing_callback_address(void)
{
    ushort *bedroll = special_use_object(640);
    TEST_ASSERT_EQUAL_HEX16(0x121, bedroll[0] & 0x1ff);
    dispatch_use_special_item_by_type((ushort *)g_player_object, bedroll, 1);
    TEST_ASSERT_EQUAL_INT(1, special_use_fixture.rest_checks);
    TEST_ASSERT_EQUAL_INT(0, special_use_fixture.rest_unsafe);
    TEST_ASSERT_EQUAL_INT(10, ((byte *)g_player_object)[8]);
}
static void test_bedroll_detects_nearby_alerted_hostile_monster(void)
{
    special_use_npc(2, 21, 20, 5, 1);
    dispatch_use_special_item_by_type((ushort *)g_player_object, special_use_object(640), 1);
    TEST_ASSERT_EQUAL_INT(1, special_use_fixture.rest_checks);
    TEST_ASSERT_EQUAL_INT(1, special_use_fixture.rest_unsafe);
}
static void test_rest_safety_ignores_unalerted_or_nonhostile_objects(void)
{
    special_use_npc(2, 21, 20, 5, 0);
    special_use_npc(3, 20, 21, 1, 1);
    TEST_ASSERT_EQUAL_INT(0, check_rest_area_unsafe());
    const int hostile_states[] = {4, 5, 9};
    for (unsigned i = 0; i < 3; i++) {
        ((byte *)special_use_object(2))[11] = hostile_states[i];
        ((byte *)special_use_object(2))[25] = 1;
        TEST_ASSERT_EQUAL_INT(1, check_rest_area_unsafe());
    }
}
static void test_rest_safety_ignores_player_and_monsters_outside_scan_radius(void)
{
    ((byte *)g_player_object)[11] = 5;
    ((byte *)g_player_object)[25] = 1;
    special_use_npc(2, 24, 20, 5, 1);
    TEST_ASSERT_EQUAL_INT(0, check_rest_area_unsafe());
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level_one_fountain_heals_the_player_using_its_real_effect_record);
    RUN_TEST(test_fountain_healing_is_capped_at_player_maximum_health);
    RUN_TEST(test_tile_special_action_preserves_actor_and_healing_target_addresses);
    RUN_TEST(test_bedroll_scans_safe_area_without_losing_callback_address);
    RUN_TEST(test_bedroll_detects_nearby_alerted_hostile_monster);
    RUN_TEST(test_rest_safety_ignores_unalerted_or_nonhostile_objects);
    RUN_TEST(test_rest_safety_ignores_player_and_monsters_outside_scan_radius);
    return UNITY_END();
}

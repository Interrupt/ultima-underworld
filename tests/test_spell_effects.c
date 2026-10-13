#include "spell_effects_fixture.h"
#define fx spell_effects_fixture
void setUp(void) { spell_effects_fixture_reset(); }
void tearDown(void) {}

static void test_tile_action_keeps_64_bit_actor_and_context(void)
{
    TEST_ASSERT_TRUE((uintptr_t)fx.target > UINT32_MAX);
    dispatch_tile_special_action(2, fx.target, fx.tile);
    TEST_ASSERT_EQUAL_HEX64((uintptr_t)fx.target, fx.dispatched_actor);
    TEST_ASSERT_EQUAL_HEX64((uintptr_t)fx.tile, fx.dispatched_context);
    TEST_ASSERT_EQUAL_INT(5, fx.dispatched_type);
    TEST_ASSERT_EQUAL_INT(1, fx.dispatched_parameter);
}
static void test_trap_dispatch_preserves_actor_and_context_in_both_branches(void)
{
    for (int branch=0; branch<2; branch++) {
        ushort action=branch ? 5 : 0xffff;
        TEST_ASSERT_EQUAL_INT(2, dispatch_trap_special_or_tile_action(32,2,
            fx.target,fx.tile,action,2));
        TEST_ASSERT_EQUAL_HEX64((uintptr_t)fx.target, fx.dispatched_actor);
        TEST_ASSERT_EQUAL_HEX64((uintptr_t)fx.tile, fx.dispatched_context);
        TEST_ASSERT_EQUAL_INT(5, fx.dispatched_type);
        TEST_ASSERT_EQUAL_UINT8(32, DAT_0023c3dc);
        TEST_ASSERT_EQUAL_UINT8(2, DAT_0023c3d8);
    }
}
static void test_cone_unlock_executes_callback(void)
{
    cast_cone_damage_spell(g_player_object, 1);
    TEST_ASSERT_EQUAL_INT(1, fx.scans);
    TEST_ASSERT_EQUAL_INT(1, fx.unlocks);
}
static void test_cone_tile_spell_uses_second_damage_tier(void)
{
    cast_cone_damage_spell(g_player_object, 2);
    TEST_ASSERT_EQUAL_INT(1, fx.spawns); TEST_ASSERT_EQUAL_INT(1, fx.links);
    TEST_ASSERT_EQUAL_INT(6, fx.dice_count); TEST_ASSERT_EQUAL_INT(5, fx.dice_sides);
    TEST_ASSERT_EQUAL_INT(30, fx.damage); TEST_ASSERT_EQUAL_INT(3, fx.damage_type);
}
static void test_cone_permanent_state_effect_preserves_object_address(void)
{
    fx.resist=1;
    cast_cone_damage_spell(g_player_object, 3);
    TEST_ASSERT_EQUAL_INT(1, fx.effects); TEST_ASSERT_EQUAL_INT(2, fx.goal);
    TEST_ASSERT_EQUAL_INT(0, fx.goal_mode);
    TEST_ASSERT_EQUAL_HEX8(0x40, ((byte *)fx.target)[0x19] & 0x40);
    TEST_ASSERT_EQUAL_HEX8(0xc0, ((byte *)fx.target)[0xe] & 0xc0);
}
static void test_cone_variants_past_the_table_do_not_read_off_its_end(void)
{
    /* Spell 45 (Flame Wind) uses index 4, one past the 4-entry table: the original reads the table
       that follows, so every 6-bit index must resolve to a callback or none, never off the array. */
    for (int index=0; index<0x40; index++) {
        fx.scans=0;
        cast_cone_damage_spell(g_player_object, index);
        TEST_ASSERT_EQUAL_INT(1, fx.scans);
    }
    fx.scans=0; fx.effects=0;
    fx.resist=1;
    cast_cone_damage_spell(g_player_object, 68);
    TEST_ASSERT_EQUAL_INT(1, fx.scans);
}
static void test_search_area_spell_uses_first_damage_tier(void)
{
    cast_targeted_search_effect(g_player_object, 0);
    TEST_ASSERT_EQUAL_INT(1, fx.spawns); TEST_ASSERT_EQUAL_INT(1, fx.links);
    TEST_ASSERT_EQUAL_INT(5, fx.damage_calls);
    TEST_ASSERT_EQUAL_INT(10, fx.dice_count); TEST_ASSERT_EQUAL_INT(6, fx.dice_sides);
    TEST_ASSERT_EQUAL_INT(60, fx.damage); TEST_ASSERT_EQUAL_INT(11, fx.damage_type);
}
static void test_search_morph_variants_execute_on_actual_object(void)
{
    const int parameters[]={1,3,5}, goals[]={6,2,7};
    for (int i=0; i<3; i++) {
        fx.resist=1;
        cast_targeted_search_effect(g_player_object, parameters[i]);
        TEST_ASSERT_EQUAL_INT(4, fx.variant);
        TEST_ASSERT_EQUAL_INT(1, fx.goal_mode);
        TEST_ASSERT_EQUAL_INT(goals[i], fx.goal);
        TEST_ASSERT_EQUAL_INT(i+1, fx.goal_changes);
    }
}
static void test_search_resistance_and_tile_damage_callbacks(void)
{
    cast_targeted_search_effect(g_player_object, 2);
    TEST_ASSERT_EQUAL_INT(255, fx.damage); TEST_ASSERT_EQUAL_INT(3, fx.damage_type);
    cast_targeted_search_effect(g_player_object, 4);
    TEST_ASSERT_EQUAL_INT(20, fx.damage); TEST_ASSERT_EQUAL_INT(0x13, fx.damage_type);
    TEST_ASSERT_EQUAL_INT(4, fx.variant);
}
static void test_cached_path_round_trip_in_all_four_directions(void)
{
    const byte points[][2]={{20,20},{20,21},{21,21},{21,20},{20,20}};
    for (int i=0;i<5;i++) {
        DAT_00101740_backing[i*7]=points[i][0];
        DAT_00101740_backing[i*7+1]=points[i][1];
    }
    DAT_0010142c=4;
    byte cache[28]={0};
    save_walk_path_to_cache_slot(cache);
    TEST_ASSERT_EQUAL_HEX8(0xe4, cache[4]);
    for (int i=1;i<=4;i++) {
        TEST_ASSERT_EQUAL_INT(1, advance_cached_path_step((char *)cache));
        TEST_ASSERT_EQUAL_UINT8(points[i][0],cache[0]);
        TEST_ASSERT_EQUAL_UINT8(points[i][1],cache[1]);
    }
    TEST_ASSERT_EQUAL_INT(0, advance_cached_path_step((char *)cache));
}
static void test_diagonal_tile_lookup_accepts_matching_direction_only(void)
{
    const int dx[]={0,1,0,-1}, dy[]={1,0,-1,0}, types[]={6,8,7,9};
    fx.tile[0]=1; /* open source tile */
    for (int i=0;i<4;i++) {
        fx.los_x=20+dx[i]; fx.los_y=20+dy[i];
        fx.los_tile[0]=0x10|types[i]; /* one unit above the source */
        byte height=0, budget=0;
        TEST_ASSERT_EQUAL_INT(1, tile_pair_los_blocked(0,0,20,20,
            fx.los_x,fx.los_y,0x1000,0,0,&height,&budget));
        fx.los_tile[0]=0x10|types[(i+1)%4];
        TEST_ASSERT_EQUAL_INT(0, tile_pair_los_blocked(0,0,20,20,
            fx.los_x,fx.los_y,0x1000,0,0,&height,&budget));
    }
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_tile_action_keeps_64_bit_actor_and_context);
    RUN_TEST(test_trap_dispatch_preserves_actor_and_context_in_both_branches);
    RUN_TEST(test_cone_unlock_executes_callback);
    RUN_TEST(test_cone_tile_spell_uses_second_damage_tier);
    RUN_TEST(test_cone_permanent_state_effect_preserves_object_address);
    RUN_TEST(test_cone_variants_past_the_table_do_not_read_off_its_end);
    RUN_TEST(test_search_area_spell_uses_first_damage_tier);
    RUN_TEST(test_search_morph_variants_execute_on_actual_object);
    RUN_TEST(test_search_resistance_and_tile_damage_callbacks);
    RUN_TEST(test_cached_path_round_trip_in_all_four_directions);
    RUN_TEST(test_diagonal_tile_lookup_accepts_matching_direction_only);
    return UNITY_END();
}

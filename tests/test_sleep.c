#include "sleep_fixture.h"

void setUp(void) { sleep_fixture_reset(); }
void tearDown(void) { sleep_fixture_dispose(); }

static void test_sleep_using_level_one_bedroll_runs_from_use_through_waking_up(void)
{
    uint before = sleep_game_time();
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_EQUAL_UINT(before + 7 * 0xe1000, sleep_game_time());
    TEST_ASSERT_EQUAL_INT(27, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(76, (byte)DAT_00086df8[0x39]);
    TEST_ASSERT_EQUAL_INT(0, (byte)DAT_00086df8[0x3a]);
    TEST_ASSERT_EQUAL_INT(20, (byte)DAT_00086df8[0x37]);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.sleeps);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
    TEST_ASSERT_EQUAL_INT(2, sleep_fixture.redraws);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.ambient_ticks);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.interruption_checks);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.mobile_ticks);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.resources_flushed);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.stat_redraws);
    TEST_ASSERT_EQUAL_INT(0x12, special_use_fixture.message);
    TEST_ASSERT_GREATER_THAN_INT(0, ((byte *)g_player_object)[8]);
}

static void test_sleep_can_be_used_again_without_losing_player_or_world_links(void)
{
    uint before = sleep_game_time();
    ushort *bedroll = sleep_bedroll();
    dispatch_use_special_item_by_type((ushort *)g_player_object, bedroll, 1);
    dispatch_use_special_item_by_type((ushort *)g_player_object, bedroll, 1);
    TEST_ASSERT_EQUAL_UINT(before + 14 * 0xe1000, sleep_game_time());
    TEST_ASSERT_EQUAL_INT(30, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(52, (byte)DAT_00086df8[0x39]);
    TEST_ASSERT_EQUAL_INT(2, sleep_fixture.sleeps);
    TEST_ASSERT_EQUAL_INT(2, sleep_fixture.wakes);
    TEST_ASSERT_EQUAL_HEX16(0x121, bedroll[0] & 0x1ff);
    TEST_ASSERT_EQUAL_PTR(g_player_object, resolve_object_link(uw_tile_chain_word_ptr(tilemap_lookup(18, 5))));
}

static void test_interrupted_sleep_advances_partial_time_and_wakes_player_alive(void)
{
    uint before = sleep_game_time();
    sleep_fixture.interrupted = 1;
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_EQUAL_UINT(before + 2 * 0xe1000, sleep_game_time());
    TEST_ASSERT_EQUAL_INT(10, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(88, (byte)DAT_00086df8[0x39]);
    TEST_ASSERT_EQUAL_INT(0, (byte)DAT_00086df8[0x3a]);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.mobile_ticks);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.resources_flushed);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
    TEST_ASSERT_EQUAL_INT(0x15, special_use_fixture.message);
}

static void test_hostile_monster_prevents_sleep_before_time_or_cleanup_advances(void)
{
    uint before = sleep_game_time();
    special_use_npc(2, 19, 5, 5, 1);
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_EQUAL_UINT(before, sleep_game_time());
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.sleeps);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.wakes);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.ambient_ticks);
    TEST_ASSERT_EQUAL_INT(0x0e, special_use_fixture.message);
    TEST_ASSERT_EQUAL_INT(10, ((byte *)g_player_object)[8]);
}

static void test_sleep_cleanup_frees_distant_objects_and_preserves_nearby_objects(void)
{
    ushort *bedroll = sleep_bedroll();
    sleep_fixture_cleanup_chain();
    dispatch_use_special_item_by_type((ushort *)g_player_object, bedroll, 1);
    TEST_ASSERT_EQUAL_INT(3, (DAT_0020469c - (char *)sleep_fixture.static_free) / 2);
    TEST_ASSERT_EQUAL_INT(700, sleep_fixture.static_free[1]);
    TEST_ASSERT_EQUAL_INT(701, sleep_fixture.static_free[2]);
    TEST_ASSERT_EQUAL_INT(702, sleep_fixture.static_free[3]);
    TEST_ASSERT_EQUAL_HEX16(0x2b, ((ushort *)tilemap_lookup(35, 20))[1]);
    TEST_ASSERT_EQUAL_PTR(special_use_object(703), resolve_object_link(uw_tile_chain_word_ptr(tilemap_lookup(19, 5))));
    TEST_ASSERT_EQUAL_PTR(g_player_object, resolve_object_link(uw_tile_chain_word_ptr(tilemap_lookup(18, 5))));
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
    TEST_ASSERT_GREATER_THAN_INT(0, ((byte *)g_player_object)[8]);
}

static void test_cleanup_stops_at_limit_and_keeps_the_unvisited_chain(void)
{
    sleep_fixture_cleanup_chain();
    despawn_objects_outside_radius(1, 2);
    TEST_ASSERT_EQUAL_INT(2, (DAT_0020469c - (char *)sleep_fixture.static_free) / 2);
    TEST_ASSERT_EQUAL_INT(700, sleep_fixture.static_free[1]);
    TEST_ASSERT_EQUAL_INT(701, sleep_fixture.static_free[2]);
    TEST_ASSERT_EQUAL_HEX16((702 << 6) | 0x2b, ((ushort *)tilemap_lookup(35, 20))[1]);
    TEST_ASSERT_EQUAL_PTR(special_use_object(702), resolve_object_link(uw_tile_chain_word_ptr(tilemap_lookup(35, 20))));
    TEST_ASSERT_EQUAL_PTR(special_use_object(703), resolve_object_link(uw_tile_chain_word_ptr(tilemap_lookup(19, 5))));
}

static void test_stack_copied_links_resolve_and_return_the_destruction_roll(void)
{
    sleep_fixture_cleanup_chain();
    ushort copy = (700 << 6) | 0x2a;
    TEST_ASSERT_EQUAL_PTR(special_use_object(700), resolve_object_link(&copy));
    TEST_ASSERT_EQUAL_INT(1, should_destroy_linked_object(1, &copy));
    sleep_fixture.random_low = 0;
    TEST_ASSERT_EQUAL_INT(0, should_destroy_linked_object(1, &copy));
    copy = 0x2a;
    TEST_ASSERT_NULL(resolve_object_link(&copy));
    TEST_ASSERT_EQUAL_INT(0, should_destroy_linked_object(1, &copy));
}

static void test_full_sleep_burns_equipped_torch_fuel_for_all_elapsed_hours(void)
{
    sleep_fixture.torch[0] = 0x8094;
    sleep_fixture.torch[2] = 63;
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    /* The real torch period is 10. Two hours burn 37 units, then the
       remaining five hours exhaust the 26 units left in the torch. */
    TEST_ASSERT_EQUAL_HEX16(0x90, sleep_fixture.torch[0] & 0x1ff);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.torch[2] & 0x3f);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.light_slot_redraws);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.light_updates);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
}

static void test_interrupted_sleep_only_burns_fuel_for_its_elapsed_hours(void)
{
    sleep_fixture.torch[0] = 0x8094;
    sleep_fixture.torch[2] = 63;
    sleep_fixture.interrupted = 1;
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_EQUAL_HEX16(0x94, sleep_fixture.torch[0] & 0x1ff);
    TEST_ASSERT_EQUAL_INT(26, sleep_fixture.torch[2] & 0x3f);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.light_slot_redraws);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.light_updates);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
}

static void test_sleep_checks_spawn_trap_near_reported_position_and_wakes_up(void)
{
    ushort *npc = sleep_fixture_spawn_trap(1);
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_BITS_HIGH(1, ((byte *)npc)[14]);
    TEST_ASSERT_EQUAL_INT(0, sleep_fixture.spawn_attempts);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
    TEST_ASSERT_GREATER_THAN_INT(0, ((byte *)g_player_object)[8]);
}

static void test_unblocked_spawn_scan_ignores_player_and_its_own_marked_template(void)
{
    ushort *npc = sleep_fixture_spawn_trap(0);
    object_list_insert_head(uw_tile_chain_word_ptr(tilemap_lookup(18, 4)), (uw_object_hdr_t *)npc);
    ((byte *)g_player_object)[14] |= 1;
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_BITS_HIGH(1, ((byte *)npc)[14]);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.spawn_attempts);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
}

static void test_wake_transition_preserves_full_snapshot_addresses_and_pixels(void)
{
    for (unsigned i = 0; i < sizeof sleep_fixture.screen; i++)
        sleep_fixture.screen[i] = (byte)(i ^ (i >> 8));
    weapon_overlay_flash_restore(5);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.snapshot_count);
    TEST_ASSERT_EQUAL_INT(13, sleep_fixture.overlay_copies);
    TEST_ASSERT_EQUAL_MEMORY(sleep_fixture.screen, sleep_fixture.snapshots[0], sizeof sleep_fixture.screen);
    TEST_ASSERT_EQUAL_INT(1, g_weapon_overlay_enabled);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.cursor_hides);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.cursor_shows);
}

static void test_sleep_at_reported_level_one_tile_runs_real_background_traps(void)
{
    object_list_unlink(uw_tile_chain_word_ptr(tilemap_lookup(18, 5)), &g_player_object->hdr);
    ((ushort *)g_player_object)[11] = (18 << 10) | (4 << 4);
    DAT_002020a0 = DAT_0023c3dc = 18;
    DAT_002020a4 = DAT_0023c3d8 = 4;
    object_list_insert_head(uw_tile_chain_word_ptr(tilemap_lookup(18, 4)), &g_player_object->hdr);
    uint before = sleep_game_time();
    dispatch_use_special_item_by_type((ushort *)g_player_object, sleep_bedroll(), 1);
    TEST_ASSERT_EQUAL_UINT(before + 7 * 0xe1000, sleep_game_time());
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.wakes);
    TEST_ASSERT_EQUAL_INT(1, sleep_fixture.snapshot_count);
    TEST_ASSERT_EQUAL_INT(13, sleep_fixture.overlay_copies);
    TEST_ASSERT_EQUAL_INT(1, g_weapon_overlay_enabled);
    TEST_ASSERT_GREATER_THAN_INT(0, ((byte *)g_player_object)[8]);
}

static void test_spawn_block_result_is_reset_and_only_marked_nearby_npcs_block(void)
{
    ushort *npc = sleep_fixture_spawn_trap(1);
    TEST_ASSERT_EQUAL_INT(1, check_object_area_for_spawn_block(npc));
    TEST_ASSERT_EQUAL_PTR(npc, DAT_0024cfd4);
    ((byte *)special_use_object(3))[14] &= (byte)~1;
    TEST_ASSERT_EQUAL_INT(0, check_object_area_for_spawn_block(npc));
    ((byte *)npc)[14] |= 1;
    TEST_ASSERT_EQUAL_INT(0, detect_spawn_blocking_object_callback(18, 4, (char *)npc));
    ((byte *)g_player_object)[14] |= 1;
    TEST_ASSERT_EQUAL_INT(0, detect_spawn_blocking_object_callback(18, 4, (char *)g_player_object));
    ((byte *)special_use_object(3))[14] |= 1;
    object_list_unlink(uw_tile_chain_word_ptr(tilemap_lookup(19, 4)), (uw_object_hdr_t *)special_use_object(3));
    ushort *far = special_use_npc(3, 24, 4, 1, 0);
    ((byte *)far)[14] |= 1;
    TEST_ASSERT_EQUAL_INT(0, check_object_area_for_spawn_block(npc));
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_sleep_checks_spawn_trap_near_reported_position_and_wakes_up);
    RUN_TEST(test_unblocked_spawn_scan_ignores_player_and_its_own_marked_template);
    RUN_TEST(test_wake_transition_preserves_full_snapshot_addresses_and_pixels);
    RUN_TEST(test_sleep_at_reported_level_one_tile_runs_real_background_traps);
    RUN_TEST(test_spawn_block_result_is_reset_and_only_marked_nearby_npcs_block);
    RUN_TEST(test_sleep_using_level_one_bedroll_runs_from_use_through_waking_up);
    RUN_TEST(test_sleep_can_be_used_again_without_losing_player_or_world_links);
    RUN_TEST(test_interrupted_sleep_advances_partial_time_and_wakes_player_alive);
    RUN_TEST(test_hostile_monster_prevents_sleep_before_time_or_cleanup_advances);
    RUN_TEST(test_sleep_cleanup_frees_distant_objects_and_preserves_nearby_objects);
    RUN_TEST(test_cleanup_stops_at_limit_and_keeps_the_unvisited_chain);
    RUN_TEST(test_stack_copied_links_resolve_and_return_the_destruction_roll);
    RUN_TEST(test_full_sleep_burns_equipped_torch_fuel_for_all_elapsed_hours);
    RUN_TEST(test_interrupted_sleep_only_burns_fuel_for_its_elapsed_hours);
    return UNITY_END();
}

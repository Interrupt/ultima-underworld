#include "inventory_fixture.h"

void setUp(void) { inventory_fixture_reset(); }
void tearDown(void) { inventory_fixture_dispose(); }

static void test_picked_up_sack_has_inventory_widget(void)
{
    TEST_ASSERT_EQUAL_INT(4, find_or_assign_object_widget(objects[1]));
}

static void test_open_sack_finds_contents_through_inventory_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
}

static void test_lookup_returns_object_and_owning_link(void)
{
    TEST_ASSERT_EQUAL_PTR(objects[2], find_object_by_encoded_slot_in_chain(objects[1] + 3, 1, 2));
    TEST_ASSERT_EQUAL_PTR(objects[1] + 3, DAT_002046b4);
}

static void test_nested_container_finds_inner_object(void)
{
    objects[2][0] = 0x15f;
    objects[2][3] = 3 << 6;
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[3]));
    TEST_ASSERT_EQUAL_PTR(objects[2] + 3, DAT_002046b4);
}

static void test_lookup_follows_sibling_link(void)
{
    objects[2][2] = 3 << 6;
    TEST_ASSERT_EQUAL_PTR(objects[3], find_object_by_encoded_slot_in_chain(objects[1] + 3, 1, 3));
    TEST_ASSERT_EQUAL_PTR(objects[1] + 3, DAT_002046b4);
}

static void test_missing_object_has_no_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-1, find_or_assign_object_widget(objects[4]));
}

static void test_empty_container_returns_null(void)
{
    objects[1][3] = 0;
    TEST_ASSERT_NULL(find_object_by_encoded_slot_in_chain(objects[1] + 3, 1, 2));
}

static void test_quantity_field_is_not_traversed_as_contents(void)
{
    objects[2][3] = 4 << 6;
    TEST_ASSERT_EQUAL_INT(-1, find_or_assign_object_widget(objects[4]));
}

static void test_using_key_from_level_one_sack_at_23_6_prints_description(void)
{
    load_key_from_level_one_sack();
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
    TEST_ASSERT_EQUAL_HEX16(0x106, objects[2][0] & 0x1ff);
    TEST_ASSERT_EQUAL_UINT16(1, objects[2][3] & 0x3f);
    describe_special_object_property(objects[2], 1);
    TEST_ASSERT_EQUAL_INT(1, message_lookups);
    TEST_ASSERT_EQUAL_HEX16(0xa65, last_message_id);
    TEST_ASSERT_EQUAL_INT(1, printed_messages);
    TEST_ASSERT_EQUAL_INT(0, other_actions);
}

static void test_key_action_with_zero_mode_does_not_print(void)
{
    load_key_from_level_one_sack();
    describe_special_object_property(objects[2], 0);
    TEST_ASSERT_EQUAL_INT(0, message_lookups);
    TEST_ASSERT_EQUAL_INT(0, printed_messages);
}

static void test_key_action_with_missing_message_does_not_print(void)
{
    load_key_from_level_one_sack();
    available_message = NULL;
    describe_special_object_property(objects[2], 3);
    TEST_ASSERT_EQUAL_INT(1, message_lookups);
    TEST_ASSERT_EQUAL_HEX16(0xa65, last_message_id);
    TEST_ASSERT_EQUAL_INT(0, printed_messages);
}

static void test_action_dispatch_forwards_object_and_mode_to_related_helpers(void)
{
    objects[2][0] = 0xc2;
    describe_special_object_property(objects[2], 2);
    TEST_ASSERT_EQUAL_PTR(objects[2], last_action_object);
    TEST_ASSERT_EQUAL_INT16(2, last_action_mode);
    objects[2][0] = 0x130;
    describe_special_object_property(objects[2], 3);
    TEST_ASSERT_EQUAL_PTR(objects[2], last_action_object);
    TEST_ASSERT_EQUAL_INT16(3, last_action_mode);
    TEST_ASSERT_EQUAL_INT(2, other_actions);
}

static void test_key_from_sack_can_target_door_at_22_5(void)
{
    load_key_from_level_one_sack();
    ushort *tile = (ushort *)(level_one + (22 + 5 * 64) * 4);
    ushort *door = level_object(tile[1] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x141, *door & 0x1ff);
    picked_target = door;
    arm_use_item_on_player_prompt(objects[2], 1);
    TEST_ASSERT_EQUAL_INT(1, prompt_prints);
    TEST_ASSERT_EQUAL_PTR(complete_use_item_on_player, DAT_002020b8);
    TEST_ASSERT_EQUAL_PTR(objects[2], DAT_00202098);
    TEST_ASSERT_EQUAL_INT(2, g_cursor_holding_state);
    click_state[8] = 1; /* view click mode at short offset 8 */
    click_state[6] = 2; /* released interaction click at short offset 6 */
    handle_game_view_click();
    TEST_ASSERT_EQUAL_INT(1, combination_calls);
    TEST_ASSERT_EQUAL_PTR(door, combined_target);
    TEST_ASSERT_EQUAL_UINT(5, scroll_message);
    TEST_ASSERT_NULL(g_selected_object);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
    TEST_ASSERT_EQUAL_INT(1, reset_cursor);
    TEST_ASSERT_EQUAL_INT(1, released_clicks);
}

/* Exercise opening and refreshing the real level-one sack, rather than only
   asking which inventory widget owns its contents. */
static void test_open_level_one_sack_populates_container_view(void)
{
    load_key_from_level_one_sack();
    g_current_container_record = NULL;
    open_backpack_container(4);
    TEST_ASSERT_NOT_NULL(g_open_container_list);
    TEST_ASSERT_EQUAL_HEX16(1 << 6, g_current_container_link);
    TEST_ASSERT_EQUAL_HEX16(1 << 6, slots[19]);
    TEST_ASSERT_EQUAL_HEX16(2 << 6, slots[20]);
    for (int slot = 21; slot < 28; slot++) TEST_ASSERT_EQUAL_HEX16(0, slots[slot]);
    TEST_ASSERT_EQUAL_HEX16(0x83, objects[1][0] & 0x1ff);
    TEST_ASSERT_EQUAL_INT(2, container_grid_redraws);
    TEST_ASSERT_EQUAL_INT(2, container_arrow_redraws);
    for (int widget = 12; widget < 20; widget++)
        TEST_ASSERT_EQUAL_INT(widget + 8, g_backpack_widget_to_slot_backing[widget]);
}

static void test_open_empty_sack_refreshes_without_contents(void)
{
    objects[1][0] = 0x82;
    objects[1][3] = 0;
    open_backpack_container(4);
    for (int slot = 20; slot < 28; slot++) TEST_ASSERT_EQUAL_HEX16(0, slots[slot]);
    TEST_ASSERT_EQUAL_UINT(0, DAT_002029a0);
    TEST_ASSERT_EQUAL_UINT(0, DAT_0020299c);
    TEST_ASSERT_EQUAL_INT(2, container_arrow_redraws);
}

static void test_open_sack_skips_hidden_contents_when_refreshing(void)
{
    objects[1][0] = 0x82;
    objects[2][0] = 0x4000 | 0x106;
    objects[2][2] = 3 << 6;
    objects[3][0] = 0x106;
    open_backpack_container(4);
    TEST_ASSERT_EQUAL_HEX16(3 << 6, slots[20]);
    TEST_ASSERT_EQUAL_HEX16(0, slots[21]);
    /* Refresh traverses the hidden head's sibling link (+4), not contents (+6). */
    slots[20] = 3 << 6;
    refresh_container_view();
    TEST_ASSERT_EQUAL_UINT(0, DAT_002029a0);
}

static void test_open_nested_sack_refreshes_inner_contents(void)
{
    objects[1][0] = objects[2][0] = 0x82;
    objects[2][3] = 3 << 6;
    objects[3][0] = 0x106;
    open_backpack_container(4);
    char *parent = g_current_container_record;
    open_backpack_container(20);
    TEST_ASSERT_NOT_EQUAL(parent, g_current_container_record);
    TEST_ASSERT_EQUAL_HEX16(2 << 6, g_current_container_link);
    TEST_ASSERT_EQUAL_HEX16(3 << 6, slots[20]);
    TEST_ASSERT_EQUAL_HEX16(2 << 6, slots[19]);
    TEST_ASSERT_EQUAL_INT(4, container_arrow_redraws);
}

static void test_palette_cycle_redraws_only_lit_light_source_icons(void)
{
    objects[1][0] = 0x95;  /* lit torch */
    objects[2][0] = 0x91;  /* unlit torch */
    objects[3][0] = 0x80;  /* ordinary item */
    slots[7] = 1 << 6;
    slots[8] = 2 << 6;
    slots[9] = 3 << 6;
    redraw_lit_light_source_widgets();
    TEST_ASSERT_EQUAL_INT(1, lit_widget_redraws[7]);
    TEST_ASSERT_EQUAL_INT(0, lit_widget_redraws[8]);
    TEST_ASSERT_EQUAL_INT(0, lit_widget_redraws[9]);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_palette_cycle_redraws_only_lit_light_source_icons);
    RUN_TEST(test_picked_up_sack_has_inventory_widget);
    RUN_TEST(test_open_sack_finds_contents_through_inventory_widget);
    RUN_TEST(test_lookup_returns_object_and_owning_link);
    RUN_TEST(test_nested_container_finds_inner_object);
    RUN_TEST(test_lookup_follows_sibling_link);
    RUN_TEST(test_missing_object_has_no_widget);
    RUN_TEST(test_empty_container_returns_null);
    RUN_TEST(test_quantity_field_is_not_traversed_as_contents);
    RUN_TEST(test_using_key_from_level_one_sack_at_23_6_prints_description);
    RUN_TEST(test_key_action_with_zero_mode_does_not_print);
    RUN_TEST(test_key_action_with_missing_message_does_not_print);
    RUN_TEST(test_action_dispatch_forwards_object_and_mode_to_related_helpers);
    RUN_TEST(test_key_from_sack_can_target_door_at_22_5);
    RUN_TEST(test_open_level_one_sack_populates_container_view);
    RUN_TEST(test_open_empty_sack_refreshes_without_contents);
    RUN_TEST(test_open_sack_skips_hidden_contents_when_refreshing);
    RUN_TEST(test_open_nested_sack_refreshes_inner_contents);
    return UNITY_END();
}

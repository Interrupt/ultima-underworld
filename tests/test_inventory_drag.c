#include "inventory_drag_fixture.h"

void setUp(void) { inventory_drag_fixture_reset(); }
void tearDown(void) { inventory_drag_fixture_dispose(); }

static void test_right_pickup_stays_held_while_mouse_moves_and_world_redraws(void)
{
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, redraws);
    TEST_ASSERT_EQUAL_INT(1, drops);
    TEST_ASSERT_NULL(g_selected_object);
}
static void test_right_pickup_can_drag_to_backpack_before_release(void)
{
    DAT_002506ab = 1;
    target_widget = 4;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, redraws);
    TEST_ASSERT_EQUAL_INT(1, backpack_drops);
    TEST_ASSERT_EQUAL_INT(0, drops);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
}
static void test_left_pickup_still_waits_for_release(void)
{
    DAT_0023c63c = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, redraws);
    TEST_ASSERT_EQUAL_INT(1, drops);
}
static void test_pickup_after_release_keeps_object_on_cursor(void)
{
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_PTR(object, g_selected_object);
    TEST_ASSERT_EQUAL_INT(0, polls);
    TEST_ASSERT_EQUAL_INT(0, drops + backpack_drops);
}
static void test_drag_ticks_and_presents_the_world_before_release(void)
{
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll, game_ticks);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, world_frames);
    TEST_ASSERT_EQUAL_INT(world_frames, movement_ticks);
    TEST_ASSERT_EQUAL_INT(world_frames, displayed_world_frames);
    TEST_ASSERT_LESS_OR_EQUAL_INT(world_frames + 1, presents);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
}
static void test_long_drag_continues_scheduled_world_animation(void)
{
    release_poll = 20;
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, movement_ticks);
    TEST_ASSERT_GREATER_THAN_INT(0, scheduler_steps);
    TEST_ASSERT_EQUAL_INT(movement_ticks, world_frames);
    TEST_ASSERT_EQUAL_INT(world_frames, displayed_world_frames);
}
static void test_release_wait_in_a_modal_view_does_not_tick_the_world(void)
{
    DAT_002506ab = 1;
    DAT_00204850 = 2;
    g_selected_object = (char *)object;
    DAT_00201c90 = 1;
    wait_for_click_release(0);
    TEST_ASSERT_EQUAL_INT(0, game_ticks);
    TEST_ASSERT_EQUAL_INT(0, world_frames);
}

static void test_a_held_movement_key_does_not_drop_the_dragged_item(void)
{
    held_key_code = 0x8d;                   /* walking forward while the item is dragged */
    release_poll = 8;
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);   /* ended by the button release only */
    TEST_ASSERT_EQUAL_INT(1, drops);
    TEST_ASSERT_GREATER_THAN_INT(0, movement_ticks);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_right_pickup_stays_held_while_mouse_moves_and_world_redraws);
    RUN_TEST(test_right_pickup_can_drag_to_backpack_before_release);
    RUN_TEST(test_left_pickup_still_waits_for_release);
    RUN_TEST(test_pickup_after_release_keeps_object_on_cursor);
    RUN_TEST(test_drag_ticks_and_presents_the_world_before_release);
    RUN_TEST(test_long_drag_continues_scheduled_world_animation);
    RUN_TEST(test_release_wait_in_a_modal_view_does_not_tick_the_world);
    RUN_TEST(test_a_held_movement_key_does_not_drop_the_dragged_item);
    return UNITY_END();
}

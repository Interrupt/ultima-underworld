#include "jump_walking_fixture.h"

/* The polled movement keys are their own held-key state (DOS's key array), not a code in the one
   pending-key slot a typed key lands in. Holding forward and pressing jump used to OR 'j' into the
   forward code (0x8d | 0x6a = 0xef), which no key binding matches. */
void setUp(void) { jump_walking_fixture_reset(); }
void tearDown(void) {}

static void type_char(unsigned c) { handle_keyboard_message(0, 0x102 /* WM_CHAR */, c); }
static void key_up(void) { handle_keyboard_message(0, 0x101 /* WM_KEYUP */, 'j'); }

static void test_held_movement_never_touches_the_pending_key_slot(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    set_held_movement_keys(HELD_MOVE_RUN);
    TEST_ASSERT_EQUAL_HEX16(0, DAT_0023c448);
}
static void test_a_typed_jump_arrives_untouched_while_forward_is_held(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    type_char('j');
    TEST_ASSERT_EQUAL_HEX16('j', DAT_0023c448);
    set_held_movement_keys(HELD_MOVE_RUN);   /* the next frame's poll */
    TEST_ASSERT_EQUAL_HEX16('j', DAT_0023c448);
}
static void test_jump_with_forward_held_is_a_running_jump(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    type_char('j');
    move_command_dispatch(7);
    TEST_ASSERT_EQUAL_INT(7, g_movement_mode);   /* the jump is pending */
    TEST_ASSERT_TRUE(DAT_0023bf48 > 0);          /* with the walk's forward rate kept */
}
static void test_jump_without_movement_is_a_standing_jump(void)
{
    move_command_dispatch(7);
    TEST_ASSERT_EQUAL_INT(7, g_movement_mode);
    TEST_ASSERT_EQUAL_INT(0, DAT_0023bf48);
}
static void test_releasing_another_key_does_not_stall_the_walk(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    key_up();
    TEST_ASSERT_TRUE(DAT_0024af6c > 0);
    TEST_ASSERT_EQUAL_INT(0, DAT_000876c8);
}
static void test_a_released_jump_key_is_not_repeated_while_walking(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    DAT_0023c448 = 0x4a;                /* the jump key's pending code */
    key_up();
    TEST_ASSERT_EQUAL_HEX16(0, DAT_0023c448);
    TEST_ASSERT_TRUE(DAT_0024af6c > 0); /* and the walk carries on */
    TEST_ASSERT_EQUAL_INT(0, DAT_000876c8);
}
static void test_releasing_every_movement_key_stops_the_walk(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    set_held_movement_keys(0);
    TEST_ASSERT_EQUAL_INT(1, DAT_000876c8);
    key_up();
    TEST_ASSERT_EQUAL_INT(0, DAT_0024af6c);
}
static void test_pressing_forward_restarts_the_accelerator(void)
{
    DAT_0024af6c = 0;
    set_held_movement_keys(HELD_MOVE_RUN);
    TEST_ASSERT_EQUAL_INT(0x14, DAT_0024af6c);
}
static void test_forward_and_turn_make_a_diagonal(void)
{
    set_held_movement_keys(HELD_MOVE_RUN | HELD_MOVE_LEFT);
    decode_movement_command();
    TEST_ASSERT_EQUAL_INT(1, g_movement_mode);
    TEST_ASSERT_TRUE(DAT_0023bf48 > 0);
    TEST_ASSERT_TRUE(DAT_0023bf4c < 0);
}
static void test_turning_alone_has_no_forward_rate(void)
{
    set_held_movement_keys(HELD_MOVE_RIGHT);
    decode_movement_command();
    TEST_ASSERT_EQUAL_INT(1, g_movement_mode);
    TEST_ASSERT_EQUAL_INT(0, DAT_0023bf48);
    TEST_ASSERT_TRUE(DAT_0023bf4c > 0);
}
static void test_walk_key_is_slower_than_run(void)
{
    set_held_movement_keys(HELD_MOVE_RUN);
    DAT_0024af6c = 0x100;
    decode_movement_command();
    short run_rate = DAT_0023bf48;
    g_movement_mode = 0;
    set_held_movement_keys(HELD_MOVE_WALK);
    DAT_0024af6c = 0x100;
    decode_movement_command();
    TEST_ASSERT_TRUE(DAT_0023bf48 > 0);
    TEST_ASSERT_TRUE(DAT_0023bf48 < run_rate);
}
static void test_back_and_sidestep_modes(void)
{
    set_held_movement_keys(HELD_MOVE_BACK);
    decode_movement_command();
    TEST_ASSERT_EQUAL_INT(8, g_movement_mode);
    g_movement_mode = 0;
    set_held_movement_keys(HELD_MOVE_STRAFE_LEFT);
    decode_movement_command();
    TEST_ASSERT_EQUAL_INT(9, g_movement_mode);
    g_movement_mode = 0;
    set_held_movement_keys(HELD_MOVE_STRAFE_RIGHT);
    decode_movement_command();
    TEST_ASSERT_EQUAL_INT(10, g_movement_mode);
}
static void test_a_slot_code_still_moves_when_no_key_is_polled(void)
{
    DAT_0023c448 = 0x8d;   /* a hardware-button style forward code */
    decode_movement_command();
    TEST_ASSERT_EQUAL_INT(1, g_movement_mode);
}
static void test_typed_character_is_unchanged(void)
{
    type_char('a');
    TEST_ASSERT_EQUAL_HEX16('a', DAT_0023c448);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_held_movement_never_touches_the_pending_key_slot);
    RUN_TEST(test_a_typed_jump_arrives_untouched_while_forward_is_held);
    RUN_TEST(test_jump_with_forward_held_is_a_running_jump);
    RUN_TEST(test_jump_without_movement_is_a_standing_jump);
    RUN_TEST(test_releasing_another_key_does_not_stall_the_walk);
    RUN_TEST(test_a_released_jump_key_is_not_repeated_while_walking);
    RUN_TEST(test_releasing_every_movement_key_stops_the_walk);
    RUN_TEST(test_pressing_forward_restarts_the_accelerator);
    RUN_TEST(test_forward_and_turn_make_a_diagonal);
    RUN_TEST(test_turning_alone_has_no_forward_rate);
    RUN_TEST(test_walk_key_is_slower_than_run);
    RUN_TEST(test_back_and_sidestep_modes);
    RUN_TEST(test_a_slot_code_still_moves_when_no_key_is_polled);
    RUN_TEST(test_typed_character_is_unchanged);
    return UNITY_END();
}

#include "weapon_charge_fixture.h"

/* The weapon charge builds one step per 16 clock units while the attack button is held, and the
   HUD charge gem (status slot 3) follows it: charge / 12 + 1, i.e. 1..9. */
void setUp(void) { weapon_charge_fixture_reset(); }
void tearDown(void) {}

static void test_charge_builds_one_step_per_16_clock_units(void)
{
    weapon_charge_start();
    weapon_charge_tick();                   /* first held tick only records the time */
    TEST_ASSERT_EQUAL_INT(0, weapon_charge_value());
    for (int step = 1; step <= 5; step++) {
        weapon_charge_clock += 17;
        weapon_charge_tick();
        TEST_ASSERT_EQUAL_INT(step * 5, weapon_charge_value());
    }
}
static void test_charge_gem_advances_smoothly_not_straight_to_full(void)
{
    weapon_charge_start();
    gem_updates = 0;
    weapon_charge_tick();
    for (int tick = 0; tick < 8; tick++) {
        weapon_charge_clock += 17;
        weapon_charge_tick();
    }
    TEST_ASSERT_EQUAL_INT(8, gem_updates);
    for (int i = 0; i < gem_updates; i++) {
        TEST_ASSERT_EQUAL_UINT16((5 * (i + 1)) / 12 + 1, gem_values[i]);
        if (i) TEST_ASSERT_TRUE(gem_values[i] - gem_values[i - 1] <= 1);
    }
    TEST_ASSERT_EQUAL_UINT16(4, gem_values[gem_updates - 1]);
}
static void test_a_slow_frame_catches_up_by_whole_steps(void)
{
    weapon_charge_start();
    weapon_charge_tick();
    weapon_charge_clock += 40;              /* 40 units = two whole 16-unit steps, 8 left over */
    weapon_charge_tick();
    TEST_ASSERT_EQUAL_INT(10, weapon_charge_value());
    weapon_charge_clock += 9;               /* the leftover 8 plus 9 more passes the 16-unit threshold */
    weapon_charge_tick();
    TEST_ASSERT_EQUAL_INT(15, weapon_charge_value());
}
static void test_charge_is_capped_at_100(void)
{
    weapon_charge_start();
    weapon_charge_tick();
    for (int tick = 0; tick < 40; tick++) {
        weapon_charge_clock += 17;
        weapon_charge_tick();
    }
    TEST_ASSERT_EQUAL_INT(100, weapon_charge_value());
    TEST_ASSERT_EQUAL_UINT16(9, gem_values[gem_updates - 1]);
}
static void test_the_clock_wrapping_past_16_bits_keeps_the_step_size(void)
{
    weapon_charge_clock = 0xfff8;
    weapon_charge_start();
    weapon_charge_tick();
    weapon_charge_clock = 0x10008;          /* 16 units later, across the 16-bit wrap */
    weapon_charge_tick();
    TEST_ASSERT_EQUAL_INT(0, weapon_charge_value()); /* exactly 16 is not yet past the threshold */
    weapon_charge_clock += 1;
    weapon_charge_tick();
    TEST_ASSERT_EQUAL_INT(5, weapon_charge_value());
}
static void test_releasing_swings_with_the_charge_built_so_far(void)
{
    weapon_charge_start();
    weapon_charge_tick();
    for (int tick = 0; tick < 4; tick++) {
        weapon_charge_clock += 17;
        weapon_charge_tick();
    }
    weapon_charge_button_held = 0;
    DAT_000870e4 = 6;                       /* the swing's release frame */
    DAT_0010062c = -5;
    weapon_charge_tick();
    TEST_ASSERT_EQUAL_INT(1, melee_swings);
    /* base 10 + (max 90 - base 10) * 20% charge */
    TEST_ASSERT_EQUAL_INT(26, swing_charge_at_release);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_charge_builds_one_step_per_16_clock_units);
    RUN_TEST(test_charge_gem_advances_smoothly_not_straight_to_full);
    RUN_TEST(test_a_slow_frame_catches_up_by_whole_steps);
    RUN_TEST(test_charge_is_capped_at_100);
    RUN_TEST(test_the_clock_wrapping_past_16_bits_keeps_the_step_size);
    RUN_TEST(test_releasing_swings_with_the_charge_built_so_far);
    return UNITY_END();
}

#include "look_pacing_fixture.h"

void setUp(void) { look_pacing_fixture_reset(); }
void tearDown(void) { look_pacing_fixture_dispose(); }

static void test_repeated_polls_ramp_pitch_once_per_game_frame(void)
{
    const SDL_Scancode keys[] = {SDL_SCANCODE_1, SDL_SCANCODE_3};
    for (unsigned i = 0; i < 2; i++) {
        setUp();
        keyboard[keys[i]] = 1;
        short step = i == 0 ? -0x120 : 0x120;
        poll_at(0);
        TEST_ASSERT_EQUAL_INT16(step, DAT_0023beb4);
        for (uint64_t time = 0; time < 16666; time += 100)
            poll_at(time);
        TEST_ASSERT_EQUAL_INT16(step, DAT_0023beb4);
        poll_at(16666);
        TEST_ASSERT_EQUAL_INT16(step * 2, DAT_0023beb4);
        poll_at(16666);
        TEST_ASSERT_EQUAL_INT16(step * 2, DAT_0023beb4);
    }
}

static void test_look_speed_is_independent_of_fast_polling_rates(void)
{
    const unsigned rates[] = {60, 120, 144, 240, 1000};
    for (unsigned i = 0; i < sizeof rates / sizeof *rates; i++) {
        setUp();
        keyboard[SDL_SCANCODE_3] = 1;
        /* Ten game frames, ending before the eleventh frame is due. */
        for (uint64_t sample = 0; sample * 1000000 / rates[i] < 166666; sample++)
            poll_at(sample * 1000000 / rates[i]);
        TEST_ASSERT_EQUAL_INT16(10 * 0x120, DAT_0023beb4);
    }
}

static void test_release_and_center_are_observed_between_frames(void)
{
    keyboard[SDL_SCANCODE_1] = 1;
    poll_at(0);
    keyboard[SDL_SCANCODE_1] = 0;
    poll_at(16666);
    TEST_ASSERT_EQUAL_INT16(-0x120, DAT_0023beb4);
    keyboard[SDL_SCANCODE_2] = 1;
    poll_at(16667);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
}

static void test_pitch_limits_and_opposed_keys_are_preserved(void)
{
    keyboard[SDL_SCANCODE_1] = keyboard[SDL_SCANCODE_3] = 1;
    poll_at(0);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
    keyboard[SDL_SCANCODE_3] = 0;
    DAT_0023beb4 = -0x17ff;
    poll_at(16666);
    TEST_ASSERT_EQUAL_INT16(-0x1800, DAT_0023beb4);
    keyboard[SDL_SCANCODE_1] = 0;
    g_synth_scancode_held[SDL_SCANCODE_3] = 1;
    DAT_0023beb4 = 0x17ff;
    poll_at(33333);
    TEST_ASSERT_EQUAL_INT16(0x1800, DAT_0023beb4);
}

extern ushort g_held_move_keys;

static void test_arrow_keys_hold_the_same_movement_state_as_wasd(void)
{
    const struct { SDL_Scancode arrow, letter; ushort held; } pairs[] = {
        {SDL_SCANCODE_UP, SDL_SCANCODE_W, HELD_MOVE_RUN},
        {SDL_SCANCODE_DOWN, SDL_SCANCODE_X, HELD_MOVE_BACK},
        {SDL_SCANCODE_LEFT, SDL_SCANCODE_A, HELD_MOVE_LEFT},
        {SDL_SCANCODE_RIGHT, SDL_SCANCODE_D, HELD_MOVE_RIGHT},
    };
    for (unsigned i = 0; i < 4; i++) {
        setUp();
        keyboard[pairs[i].arrow] = 1;
        look_pacing_poll(0);
        TEST_ASSERT_EQUAL_HEX16(pairs[i].held, g_held_move_keys);
        keyboard[pairs[i].arrow] = 0;
        keyboard[pairs[i].letter] = 1;
        look_pacing_poll(0);
        TEST_ASSERT_EQUAL_HEX16(pairs[i].held, g_held_move_keys);
    }
}
static void test_arrow_keys_combine_and_release(void)
{
    keyboard[SDL_SCANCODE_UP] = keyboard[SDL_SCANCODE_LEFT] = 1;
    look_pacing_poll(0);
    TEST_ASSERT_EQUAL_HEX16(HELD_MOVE_RUN | HELD_MOVE_LEFT, g_held_move_keys);
    keyboard[SDL_SCANCODE_UP] = keyboard[SDL_SCANCODE_LEFT] = 0;
    look_pacing_poll(0);
    TEST_ASSERT_EQUAL_HEX16(0, g_held_move_keys);
}
static void test_arrow_keys_do_nothing_outside_the_3d_view(void)
{
    freelook = 0;
    keyboard[SDL_SCANCODE_UP] = 1;
    look_pacing_poll(0);
    TEST_ASSERT_EQUAL_HEX16(0, g_held_move_keys);
}

static void test_modal_input_does_not_ramp_pitch(void)
{
    keyboard[SDL_SCANCODE_1] = 1;
    DAT_00201c90 = 1;
    poll_at(0);
    poll_at(16666);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
    DAT_00201c90 = 0;
    freelook = 0;
    poll_at(33333);
    TEST_ASSERT_EQUAL_INT16(0, DAT_0023beb4);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_repeated_polls_ramp_pitch_once_per_game_frame);
    RUN_TEST(test_look_speed_is_independent_of_fast_polling_rates);
    RUN_TEST(test_release_and_center_are_observed_between_frames);
    RUN_TEST(test_pitch_limits_and_opposed_keys_are_preserved);
    RUN_TEST(test_arrow_keys_hold_the_same_movement_state_as_wasd);
    RUN_TEST(test_arrow_keys_combine_and_release);
    RUN_TEST(test_arrow_keys_do_nothing_outside_the_3d_view);
    RUN_TEST(test_modal_input_does_not_ramp_pitch);
    return UNITY_END();
}

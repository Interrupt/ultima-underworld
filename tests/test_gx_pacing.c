#include "gx_pacing_fixture.h"

void setUp(void) { gx_pacing_fixture_reset(); }
void tearDown(void) { gx_pacing_fixture_dispose(); }

static void test_early_cursor_flushes_do_not_present_another_frame(void)
{
    GXEndDraw();
    for (int i = 0; i < 20; i++) {
        now_us = 100 + i * 500;
        framebuffer_version++;
        GXEndDraw();
    }
    TEST_ASSERT_EQUAL_INT(1, presents);
    now_us = 16666;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(framebuffer_version, displayed_version);
}
static void test_last_flush_reaches_display_during_an_input_wait(void)
{
    GXEndDraw();
    now_us = 5000;
    framebuffer_version = 42;
    GXEndDraw();
    now_us = 16000;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(1, presents);
    now_us = 17000;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    now_us = 40000;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
}
static void test_refresh_rates_do_not_change_game_time(void)
{
    const unsigned rates[] = {30, 60, 120, 144, 240};
    for (unsigned rate = 0; rate < sizeof rates / sizeof *rates; rate++) {
        uw_reset_frame_pacing();
        uw_service_game_clock(0);
        uw_set_present_refresh_rate(rates[rate]);
        unsigned start = g_uw_frame_clock_units;
        for (unsigned sample = 1; sample <= rates[rate]; sample++) {
            uint64_t time = (uint64_t)sample * 1000000 / rates[rate];
            uw_service_game_clock(time);
            uw_service_game_clock(time); /* extra input/flush calls */
        }
        TEST_ASSERT_EQUAL_UINT(250, g_uw_frame_clock_units - start);
    }
}
static void test_display_cadence_matches_monitor_without_speeding_up_logic(void)
{
    const unsigned rates[] = {60, 120, 144, 240};
    for (unsigned i = 0; i < sizeof rates / sizeof *rates; i++) {
        uw_reset_frame_pacing();
        uw_set_present_refresh_rate(rates[i]);
        unsigned displays = 0, game_ticks = 0;
        for (uint64_t time = 0; time < 1000000; time += 100) {
            displays += uw_present_frame_due(time);
            game_ticks += uw_service_game_clock(time);
        }
        /* The grace window can admit the first slot of the next second. */
        TEST_ASSERT_EQUAL_UINT(rates[i] + 1, displays);
        TEST_ASSERT_EQUAL_UINT(60, game_ticks);
    }
}
static void test_deadlines_do_not_drift_after_a_late_present(void)
{
    TEST_ASSERT_TRUE(uw_present_frame_due(0));
    TEST_ASSERT_TRUE(uw_present_frame_due(25000));
    TEST_ASSERT_FALSE(uw_present_frame_due(31249));
    TEST_ASSERT_TRUE(uw_present_frame_due(33333));
}
static void test_near_deadline_flush_is_admitted_without_advancing_time(void)
{
    GXEndDraw();
    now_us = 15666;
    framebuffer_version = 42;
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    TEST_ASSERT_EQUAL_UINT64(15666, now_us);
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    now_us = 16666; /* The upcoming slot was already consumed. */
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    now_us = 33333;
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(3, presents);
}
static void test_grace_window_is_bounded_and_does_not_advance_game_time(void)
{
    GXEndDraw();
    uw_service_game_clock(0);
    unsigned clock = g_uw_frame_clock_units;
    now_us = 14582; /* beyond one eighth of a 60Hz refresh interval */
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    now_us = 14583; /* exactly inside the 2083us grace window */
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_UINT(clock, g_uw_frame_clock_units);
    TEST_ASSERT_FALSE(uw_present_frame_due(31249));
    TEST_ASSERT_TRUE(uw_present_frame_due(33333));
}
static void test_grace_window_tracks_monitor_refresh_rate(void)
{
    const unsigned rates[] = {30, 60, 120, 144, 240, 0};
    for (unsigned i = 0; i < sizeof rates / sizeof *rates; i++) {
        uw_reset_frame_pacing();
        uw_set_present_refresh_rate(rates[i]);
        unsigned rate = rates[i] ? rates[i] : 60;
        uint64_t grace = 1000000 / ((uint64_t)rate * 8);
        uint64_t first = 1000000 / rate;
        uint64_t second = 2000000 / rate;
        TEST_ASSERT_TRUE(uw_present_frame_due(0));
        TEST_ASSERT_FALSE(uw_present_frame_due(first - grace - 1));
        TEST_ASSERT_TRUE(uw_present_frame_due(first - grace));
        TEST_ASSERT_FALSE(uw_present_frame_due(first - grace));
        TEST_ASSERT_FALSE(uw_present_frame_due(first));
        TEST_ASSERT_TRUE(uw_present_frame_due(second - grace));
    }
}
static void test_changing_display_rate_preserves_pending_flush_and_game_clock(void)
{
    GXEndDraw();
    uw_service_game_clock(0);
    unsigned clock = g_uw_frame_clock_units;
    now_us = 1000;
    framebuffer_version = 42;
    GXEndDraw(); /* queued at 60Hz */
    uw_set_present_refresh_rate(120);
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    TEST_ASSERT_EQUAL_UINT(clock, g_uw_frame_clock_units);
    TEST_ASSERT_FALSE(uw_present_frame_due(1000 + 8333 - 1041 - 1));
    TEST_ASSERT_TRUE(uw_present_frame_due(1000 + 8333 - 1041));
}
static void test_cursor_updates_at_120hz_between_60hz_game_ticks(void)
{
    uw_set_present_refresh_rate(120);
    GXEndDraw();
    uw_service_game_clock(0);
    unsigned clock = g_uw_frame_clock_units;
    DAT_00201c84 = 0;
    now_us = 8333;
    framebuffer_version = 42;
    uw_request_cursor_present();
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    TEST_ASSERT_FALSE(uw_service_game_clock(now_us));
    TEST_ASSERT_EQUAL_UINT(clock, g_uw_frame_clock_units);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
    now_us = 16666;
    uw_request_cursor_present();
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(3, presents);
    TEST_ASSERT_TRUE(uw_service_game_clock(now_us));
}
static void test_input_wait_uses_the_same_clock_as_the_normal_game_loop(void)
{
    uw_service_game_clock(0);
    DAT_00201c84 = 0;
    uw_service_game_clock(8333);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
    uw_service_game_clock(16666);
    TEST_ASSERT_EQUAL_INT(2, DAT_00201c84);
    TEST_ASSERT_EQUAL_UINT(8, g_uw_frame_clock_units);
    DAT_00201c84 = 0;
    uw_service_game_clock(16666);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
}
static void test_modal_views_do_not_advance_game_time_or_request_dungeon_redraw(void)
{
    uw_service_game_clock(0);
    unsigned start = g_uw_frame_clock_units;
    DAT_00201c84 = 0;
    DAT_00201c90 = 1;
    uw_service_game_clock(1000000);
    TEST_ASSERT_EQUAL_UINT(start, g_uw_frame_clock_units);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
    DAT_00201c90 = 0;
    g_mode_handler_row = 1;
    uw_service_game_clock(1000000);
    TEST_ASSERT_EQUAL_UINT(start, g_uw_frame_clock_units);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201c84);
}
static void test_finalized_render_presents_without_an_intermediate_flush(void)
{
    uw_begin_present_batch();
    framebuffer_version = 42;
    TEST_ASSERT_EQUAL_INT(0, presents);
    gfx_finalizedraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
}
static void test_finalized_render_bypasses_deadline_and_uses_vsync_completion_time(void)
{
    uw_set_present_refresh_rate(120);
    GXEndDraw(); /* Earlier cursor presentation. */
    uw_service_game_clock(0);
    unsigned clock = g_uw_frame_clock_units;
    now_us = 1000;
    present_wait_us = 7333; /* SDL waits for the next refresh. */
    uw_begin_present_batch();
    framebuffer_version = 42;
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    gfx_finalizedraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
    TEST_ASSERT_EQUAL_UINT64(8333, now_us);
    TEST_ASSERT_EQUAL_UINT(clock, g_uw_frame_clock_units);
    present_wait_us = 0;
    uw_service_pending_present(now_us); /* Final presentation consumed the queue. */
    GXEndDraw(); /* Cursor flush immediately afterward stays queued. */
    TEST_ASSERT_EQUAL_INT(2, presents);
    now_us = 16666;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(3, presents);
}
static void test_nested_render_finalization_waits_for_outer_render(void)
{
    uw_begin_present_batch();
    uw_begin_present_batch();
    gfx_finalizedraw();
    TEST_ASSERT_EQUAL_INT(0, presents);
    framebuffer_version = 42;
    gfx_finalizedraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    TEST_ASSERT_EQUAL_INT(42, displayed_version);
}
static void test_unbatched_finalization_always_presents_but_cursor_flushes_stay_paced(void)
{
    gfx_finalizedraw();
    gfx_finalizedraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
    now_us = 16666;
    uw_service_pending_present(now_us);
    TEST_ASSERT_EQUAL_INT(3, presents);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_finalized_render_presents_without_an_intermediate_flush);
    RUN_TEST(test_finalized_render_bypasses_deadline_and_uses_vsync_completion_time);
    RUN_TEST(test_nested_render_finalization_waits_for_outer_render);
    RUN_TEST(test_unbatched_finalization_always_presents_but_cursor_flushes_stay_paced);
    RUN_TEST(test_early_cursor_flushes_do_not_present_another_frame);
    RUN_TEST(test_last_flush_reaches_display_during_an_input_wait);
    RUN_TEST(test_refresh_rates_do_not_change_game_time);
    RUN_TEST(test_display_cadence_matches_monitor_without_speeding_up_logic);
    RUN_TEST(test_deadlines_do_not_drift_after_a_late_present);
    RUN_TEST(test_input_wait_uses_the_same_clock_as_the_normal_game_loop);
    RUN_TEST(test_modal_views_do_not_advance_game_time_or_request_dungeon_redraw);
    RUN_TEST(test_near_deadline_flush_is_admitted_without_advancing_time);
    RUN_TEST(test_grace_window_is_bounded_and_does_not_advance_game_time);
    RUN_TEST(test_grace_window_tracks_monitor_refresh_rate);
    RUN_TEST(test_changing_display_rate_preserves_pending_flush_and_game_clock);
    RUN_TEST(test_cursor_updates_at_120hz_between_60hz_game_ticks);
    return UNITY_END();
}

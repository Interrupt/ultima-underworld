#include "throw_fixture.h"
#include "src/headers/options.h"
int physics_subtick_units(void);
void build_object_placement_snapshot(ushort *object, byte *snapshot);
int sync_object_tile_position(ushort *object, void *position);
void tick_physics_objects(int elapsed_units);

/* How often does a thrown item actually run physics (mobile_object_tick)?

   Chain under test, all original code: uw_service_game_clock (60Hz frames -> 4ms clock units)
   -> movement_pacing_handler (clock delta >> 4 = 64ms game ticks) -> tick_mobile_objects (16-slot
   phase counter) -> object_tick_is_due -> mobile_object_tick.

   The ARM UU.exe versions of movement_pacing_handler (0x689a0), read_realtime_clock_units
   (0x2294c: GetTickCount >> 2), tick_mobile_objects (0x349bc), object_tick_is_due (0x3495c) and
   mobile_object_tick (0x2b47c) were disassembled and match these. Steps are counted from the item's
   tick phase (see thrown_count_steps), since one step is subdivided into several collision sweeps. */

void setUp(void) { throw_fixture_reset(); }
void tearDown(void) { throw_fixture_dispose(); }

static void set_speed_class(int speed)
{ ((byte *)thrown)[0x14] = (((byte *)thrown)[0x14] & ~7) | speed; }

static void test_thrown_item_has_speed_class_one(void)
{
    launch();
    TEST_ASSERT_EQUAL_UINT8(1, ((byte *)thrown)[0x14] & 7);
}
static void test_a_successful_step_advances_the_phase_by_the_speed_class(void)
{
    launch();
    for (int speed = 1; speed <= 3; speed++) {
        set_speed_class(speed);
        thrown_set_phase(4);
        tick();
        TEST_ASSERT_EQUAL_UINT8(4 + speed, ((byte *)thrown)[10] & 0xf);
    }
}
static void test_each_game_tick_runs_one_step_for_speed_class_one(void)
{
    launch();
    thrown_set_phase(0);
    DAT_00101928 = DAT_00101948 = 1;
    tick_mobile_objects(1);  /* catch up from the arbitrary starting phase */
    thrown_count_steps();
    for (int i = 0; i < 12; i++) {
        int before = thrown_steps;
        tick_mobile_objects(1);
        thrown_count_steps();
        TEST_ASSERT_EQUAL_INT(1, thrown_steps - before);
    }
}
static void test_speed_class_n_runs_one_step_every_n_game_ticks(void)
{
    for (int speed = 1; speed <= 4; speed++) {
        throw_fixture_reset();
        launch();
        set_speed_class(speed);
        thrown_set_phase(0);
        DAT_00101928 = DAT_00101948 = 1;
        tick_mobile_objects(1);  /* settle the initial phase offset */
        thrown_count_steps();
        int before = thrown_steps;
        for (int i = 0; i < 12; i++) { tick_mobile_objects(1); thrown_count_steps(); }
        char message[40];
        snprintf(message, sizeof message, "speed class %d", speed);
        TEST_ASSERT_INT_WITHIN_MESSAGE(1, 12 / speed, thrown_steps - before, message);
    }
}
static void test_a_late_object_pass_catches_up_with_every_missed_game_tick(void)
{
    launch();
    thrown_set_phase(0);
    DAT_00101928 = DAT_00101948 = 1;
    tick_mobile_objects(1);
    thrown_count_steps();
    int before = thrown_steps;
    tick_mobile_objects(3);  /* e.g. a slow frame covering 3 game ticks */
    thrown_count_steps();
    TEST_ASSERT_EQUAL_INT(3, thrown_steps - before);
}
static void test_no_object_pass_runs_when_the_game_tick_has_not_advanced(void)
{
    launch();
    for (int i = 0; i < 4; i++) tick_mobile_objects(1);
    char counter = DAT_00101928;
    movement_tick(0, 0, 0);  /* tick_flags == 0: movement_tick never calls the object pass */
    TEST_ASSERT_EQUAL_INT8(counter, DAT_00101928);
}
static void test_sixty_hz_frames_make_about_15_6_game_ticks_a_second(void)
{
    DAT_002046c8 = DAT_002046c0;  /* no mobile objects: only the clock is under test */
    for (int i = 0; i < 60; i++) run_game_frame();
    TEST_ASSERT_INT_WITHIN(1, 16, pacing_tick_flags_total);  /* 1000ms / 64ms = 15.6 */
    TEST_ASSERT_EQUAL_INT(60, pacing_movement_ticks);
}
static void test_flight_steps_at_the_game_tick_rate_from_any_starting_phase(void)
{
    for (int phase = 0; phase < 16; phase++) {
        throw_fixture_reset();
        launch();
        thrown_set_phase(phase);
        int first = -1, last = -1, previous = 0;
        while (frame_number < 600 && !static_allocations) {
            run_game_frame();
            if (thrown_steps != previous) {
                if (first < 0) first = frame_number;
                last = frame_number;
                previous = thrown_steps;
            }
        }
        char message[80];
        TEST_ASSERT_TRUE_MESSAGE(thrown_steps > 8, "flight too short to measure");
        double rate = (thrown_steps - 1) / ((last - first) / 60.0);
        snprintf(message, sizeof message, "phase %d: %.2f steps/s over %d steps", phase, rate, thrown_steps);
        TEST_MESSAGE(message);
        /* One step per 64ms game tick: 15.6 per second. */
        TEST_ASSERT_FLOAT_WITHIN_MESSAGE(2.0f, 15.6f, (float)rate, message);
    }
}

/* --physics-fps: finer physics ticks for thrown items, same flight. */
static void fly(double *rate, double *seconds, short *x, short *y, short *z)
{
    launch();
    int first = -1, last = -1, previous = 0;
    while (frame_number < 600 && !static_allocations) {
        run_game_frame();
        if (thrown_steps != previous) {
            if (first < 0) first = frame_number;
            last = frame_number;
            previous = thrown_steps;
        }
    }
    TEST_ASSERT_TRUE_MESSAGE(static_allocations, "item never landed");
    *rate = (thrown_steps - 1) / ((last - first) / 60.0);
    *seconds = (last - first) / 60.0;
    *x = fine(thrown, 11); *y = fine(thrown, 13); *z = fine(thrown, 15);
}
static void test_physics_fps_maps_to_whole_clock_unit_subticks(void)
{
    const struct { const char *fps; int units; } cases[] = {
        {"15.625", 0}, {"10", 0}, {"16", 0}, {"20", 13}, {"25", 10}, {"31.25", 8},
        {"50", 5}, {"60", 4}, {"125", 2}, {"1000", 1}};
    for (unsigned i = 0; i < sizeof cases / sizeof *cases; i++) {
        options_set("physics-fps", cases[i].fps);
        char message[40];
        snprintf(message, sizeof message, "--physics-fps=%s", cases[i].fps);
        TEST_ASSERT_EQUAL_INT_MESSAGE(cases[i].units, physics_subtick_units(), message);
    }
}
static void test_physics_fps_is_off_by_default(void)
{
    TEST_ASSERT_EQUAL_INT(0, physics_subtick_units());
}
static void test_a_60fps_flight_steps_four_times_as_often_and_covers_the_same_path(void)
{
    double base_rate, base_seconds, rate, seconds;
    short bx, by, bz, x, y, z;
    fly(&base_rate, &base_seconds, &bx, &by, &bz);
    throw_fixture_reset();
    options_set("physics-fps", "62.5");  /* 4 clock units: 250 / 4 */
    fly(&rate, &seconds, &x, &y, &z);
    char message[120];
    snprintf(message, sizeof message, "base %.1f steps/s %.2fs (%d,%d,%d); fast %.1f steps/s %.2fs (%d,%d,%d)",
             base_rate, base_seconds, bx, by, bz, rate, seconds, x, y, z);
    TEST_MESSAGE(message);
    TEST_ASSERT_FLOAT_WITHIN_MESSAGE(3.0f, 62.5f, (float)rate, message);
    /* Same horizontal speed and the same arc. The original keeps vertical velocity only to 64-unit
       resolution and rounds each step's gravity gain toward zero, so its arc is a little floatier
       (about 0.3s longer here) than the exact integration at finer ticks. */
    TEST_ASSERT_FLOAT_WITHIN_MESSAGE(0.4f, (float)base_seconds, (float)seconds, message);
    TEST_ASSERT_INT_WITHIN_MESSAGE(100, by, y, message);
    TEST_ASSERT_TRUE_MESSAGE(seconds < base_seconds + 0.05, "finer ticks must not make the item float longer");
}
static void test_default_flight_is_unchanged_by_the_option_being_present_but_default(void)
{
    double rate, seconds;
    short x, y, z;
    options_set("physics-fps", "15.625");
    fly(&rate, &seconds, &x, &y, &z);
    TEST_ASSERT_FLOAT_WITHIN(0.5f, 15.65f, (float)rate);
}

/* A projectile with no gravity (a magic missile) that hits something has its horizontal velocity
   zeroed but keeps a bounce velocity far below the 64 units its 5-bit pitch can store. The original
   rounds that to zero, so the spent projectile settles and is destroyed; --physics-fps's sub-pitch
   remainder must not leave it drifting slowly down to the floor instead. */
static void test_a_spent_projectile_with_a_leftover_vertical_velocity_settles(void)
{
    const short leftovers[] = {-5, 23, -37};
    for (unsigned i = 0; i < sizeof leftovers / sizeof *leftovers; i++) {
        throw_fixture_reset();
        options_set("physics-fps", "62.5");
        launch();
        for (int frame = 0; frame < 30 && !static_allocations; frame++) run_game_frame();
        TEST_ASSERT_EQUAL_INT_MESSAGE(0, static_allocations, "the item landed before the test could hit it");
        byte snapshot[0x80];
        build_object_placement_snapshot(thrown, snapshot);
        /* What the sweep leaves behind after a hit: no horizontal speed, no gravity, a tiny vertical
           velocity. */
        *(short *)(snapshot + 0x14) = 0;
        *(short *)(snapshot + 0x10) = 0;
        *(short *)(snapshot + 10) = leftovers[i];
        sync_object_tile_position(thrown, snapshot);
        char message[40];
        snprintf(message, sizeof message, "leftover velocity %d", leftovers[i]);
        TEST_ASSERT_EQUAL_INT_MESSAGE(1, static_allocations, message);
    }
}
static void test_gravity_alone_keeps_the_remainder_between_steps(void)
{
    options_set("physics-fps", "62.5");
    launch();
    /* Falling under gravity only: at 4 clock units a step adds 16 to the velocity, a quarter of the
       64 its pitch can hold, so velocity only builds up if the remainder is carried. */
    short z = fine(thrown, 15);
    int rising_then_falling = 0;
    for (int frame = 0; frame < 200 && !static_allocations; frame++) {
        run_game_frame();
        if (fine(thrown, 15) < z) rising_then_falling = 1;
        z = fine(thrown, 15);
    }
    TEST_ASSERT_TRUE(rising_then_falling);
    TEST_ASSERT_EQUAL_INT_MESSAGE(1, static_allocations, "the item never landed");
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_a_spent_projectile_with_a_leftover_vertical_velocity_settles);
    RUN_TEST(test_gravity_alone_keeps_the_remainder_between_steps);
    RUN_TEST(test_thrown_item_has_speed_class_one);
    RUN_TEST(test_a_successful_step_advances_the_phase_by_the_speed_class);
    RUN_TEST(test_each_game_tick_runs_one_step_for_speed_class_one);
    RUN_TEST(test_speed_class_n_runs_one_step_every_n_game_ticks);
    RUN_TEST(test_a_late_object_pass_catches_up_with_every_missed_game_tick);
    RUN_TEST(test_no_object_pass_runs_when_the_game_tick_has_not_advanced);
    RUN_TEST(test_sixty_hz_frames_make_about_15_6_game_ticks_a_second);
    RUN_TEST(test_flight_steps_at_the_game_tick_rate_from_any_starting_phase);
    RUN_TEST(test_physics_fps_is_off_by_default);
    RUN_TEST(test_physics_fps_maps_to_whole_clock_unit_subticks);
    RUN_TEST(test_a_60fps_flight_steps_four_times_as_often_and_covers_the_same_path);
    RUN_TEST(test_default_flight_is_unchanged_by_the_option_being_present_but_default);
    return UNITY_END();
}

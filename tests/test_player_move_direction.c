#include "throw_fixture.h"
#include <math.h>

/* Walking at any heading must move the player along that heading, however slowly. The movement
   sweep stores the player's position in whole 1/256-tile units and works in whole velocity units,
   so rounding used to push slow movement toward -x/-y and off the camera's heading (about 5 degrees
   at 45 degrees and a fast walk, far more at a crawl). */

void setUp(void) { throw_fixture_reset(); real_angles = true; }
void tearDown(void) { throw_fixture_dispose(); }

#define START (10 * 256 + 128)

static void start_walk(ushort heading, short speed)
{
    byte *movement = DAT_00204880_backing;
    memset(movement, 0, sizeof DAT_00204880_backing);
    *(short *)(movement + 0) = START;
    *(short *)(movement + 2) = START;
    *(short *)(movement + 0x12) = 16;          /* one full original tick */
    *(short *)(movement + 0x14) = speed;
    *(short *)(movement + 0x21) = (short)heading;
    *(short *)(movement + 0x23) = 1;           /* player slot */
    movement[0x16] = 5;
    movement[0x17] = 0x80;
    movement[0x25] = 8;
    movement[0x26] = 23;
    movement[0x27] = 8;
    movement[0x28] = 0x10;
    DAT_00202084 = 0x10; DAT_0020208c = 0;
}
static void walk(ushort heading, short speed, int ticks, double *dx, double *dy)
{
    byte *movement = DAT_00204880_backing;
    start_walk(heading, speed);
    for (int tick = 0; tick < ticks; tick++) {
        /* The game re-seeds these every tick (apply_heading_turn / resolve_move_vector). */
        *(short *)(movement + 0x12) = 16;
        *(short *)(movement + 0x14) = speed;
        *(short *)(movement + 0x21) = (short)heading;
        movement_collision_sweep(movement, (char *)DAT_002049a0_backing);
        set_locomotion_state(movement[0x28], 0);
    }
    *dx = *(short *)(movement + 0) - START;
    *dy = *(short *)(movement + 2) - START;
}
static double angle_error_degrees(ushort heading, double dx, double dy)
{
    double want = atan2(cos(heading * 6.283185307179586 / 65536.0), sin(heading * 6.283185307179586 / 65536.0));
    double error = (atan2(dy, dx) - want) * 180.0 / 3.141592653589793;
    return fmod(error + 540.0, 360.0) - 180.0;
}

static void test_the_player_moves_along_every_diagonal_heading_at_any_speed(void)
{
    const ushort diagonals[] = {0x2000, 0x6000, 0xa000, 0xe000};
    const short speeds[] = {6, 12, 24, 48, 96, 192, 480};
    for (unsigned h = 0; h < 4; h++) {
        for (unsigned s = 0; s < sizeof speeds / sizeof *speeds; s++) {
            double dx, dy;
            walk(diagonals[h], speeds[s], 60, &dx, &dy);
            char message[80];
            snprintf(message, sizeof message, "heading 0x%04x speed %d moved (%.0f,%.0f)",
                     diagonals[h], speeds[s], dx, dy);
            TEST_ASSERT_TRUE_MESSAGE(fabs(dx) + fabs(dy) > 8, message);
            /* The total is a whole number of units, which alone limits the angle to about 1/distance. */
            float tolerance = 1.0f + (float)(atan(1.5 / hypot(dx, dy)) * 180.0 / 3.141592653589793);
            TEST_ASSERT_FLOAT_WITHIN_MESSAGE(tolerance, 0.0f, (float)angle_error_degrees(diagonals[h], dx, dy), message);
        }
    }
}
static void test_the_player_moves_along_arbitrary_headings_at_a_crawl(void)
{
    for (ushort heading = 0x0400; heading < 0xfc00; heading += 0x0b00) {
        double dx, dy;
        walk(heading, 24, 120, &dx, &dy);
        char message[80];
        snprintf(message, sizeof message, "heading 0x%04x moved (%.0f,%.0f)", heading, dx, dy);
        TEST_ASSERT_FLOAT_WITHIN_MESSAGE(1.5f, 0.0f, (float)angle_error_degrees(heading, dx, dy), message);
    }
}
static void test_opposite_headings_travel_the_same_distance(void)
{
    for (short speed = 12; speed <= 192; speed *= 2) {
        double dx, dy, opposite_dx, opposite_dy;
        walk(0x2000, speed, 60, &dx, &dy);
        walk(0xa000, speed, 60, &opposite_dx, &opposite_dy);
        char message[80];
        snprintf(message, sizeof message, "speed %d: %.0f vs %.0f", speed, hypot(dx, dy),
                 hypot(opposite_dx, opposite_dy));
        TEST_ASSERT_FLOAT_WITHIN_MESSAGE(2.0f + 0.03f * (float)hypot(dx, dy), (float)hypot(dx, dy), (float)hypot(opposite_dx, opposite_dy), message);
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_the_player_moves_along_every_diagonal_heading_at_any_speed);
    RUN_TEST(test_the_player_moves_along_arbitrary_headings_at_a_crawl);
    RUN_TEST(test_opposite_headings_travel_the_same_distance);
    return UNITY_END();
}

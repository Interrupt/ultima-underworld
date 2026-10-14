/* Level-1 traps, run in the real game: the trap chains come from the real level, and their effects are
   read back from the real tile map and message scroll. */
#include "unity.h"
#include "game_test_runner.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/level.h"

int dispatch_trap_type_effect(unsigned short *trap_record, int tile_x, int tile_y);
extern unsigned int DAT_00250720; /* message scroll: clock stamp of the last line added */
extern unsigned short *DAT_0024cff0;

void setUp(void) {}
void tearDown(void) {}

static int effect_result, scroll_stamp_before, scroll_stamp_after, clock_after;
static unsigned char floor_height_at_position[8];

/* Level 1 (58,13): orb 0x117 -> trigger 0x1a3 -> text trap 0x190. */
static unsigned short *orb_text_trap(void)
{
    unsigned short *orb = uw_test_find_object_on_tile(58, 13, 0x117);
    TEST_ASSERT_NOT_NULL_MESSAGE(orb, "orb at (58,13)");
    unsigned short *trigger = uw_test_live_object(orb[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x1a3, *trigger & 0x1ff);
    unsigned short *trap = uw_test_live_object(trigger[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x190, *trap & 0x1ff);
    return trap;
}

/* The message scroll is set up by the dungeon view's entry handler, which runs in the first pass; so
   wait for the first post_game_tick (see unit_test_hooks.h) before printing anything. */
static void fire_orb_text_trap(void)
{
    unsigned short *trap = orb_text_trap();
    scroll_stamp_before = DAT_00250720;
    effect_result = dispatch_trap_type_effect(trap, 58, 13);
    scroll_stamp_after = DAT_00250720;
    clock_after = read_realtime_clock_units();
    test_game_request_exit();
}

static void test_level_one_orb_text_trap_prints_its_message(void)
{
    uw_test_hooks hooks = { .post_game_tick = fire_orb_text_trap };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_EQUAL_INT(2, effect_result);
    /* The message scroll stamps the clock when it takes a line: a message was added just now. */
    TEST_ASSERT_NOT_EQUAL_INT(scroll_stamp_before, scroll_stamp_after);
    TEST_ASSERT_EQUAL_INT(clock_after, scroll_stamp_after);
}

/* Level 1 (56,45): eight-position dial switch 0x161 -> use trigger 0x1a2 -> "do trap" 0x183. The dial's
   position is word0 bits 9-12 of the switch; each position must set its own floor height at (43,44). */
static void turn_dial_through_every_position(void)
{
    unsigned short *dial = uw_test_find_object_on_tile(56, 45, 0x161);
    TEST_ASSERT_NOT_NULL_MESSAGE(dial, "dial switch at (56,45)");
    unsigned short *trigger = uw_test_live_object(dial[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x1a2, *trigger & 0x1ff);
    unsigned short *trap = uw_test_live_object(trigger[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x183, *trap & 0x1ff);
    DAT_0024cff0 = dial;
    for (int position = 0; position < 8; position++) {
        *dial = (*dial & ~0x1e00) | (position << 9);
        effect_result = dispatch_trap_type_effect(trap, 43, 44);
        TEST_ASSERT_EQUAL_INT(2, effect_result);
        floor_height_at_position[position] = (uw_test_live_tile(43, 44)[0] >> 4) & 0xf;
    }
    test_game_request_exit();
}

static void test_level_one_dial_selects_distinct_height_per_position(void)
{
    uw_test_hooks hooks = { .on_game_start = turn_dial_through_every_position };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    for (int position = 0; position < 8; position++)
        TEST_ASSERT_EQUAL_INT_MESSAGE(2 + position, floor_height_at_position[position], "dial position -> height");
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_level_one_orb_text_trap_prints_its_message);
    RUN_GAME_TEST(test_level_one_dial_selects_distinct_height_per_position);
    return UNITY_END();
}

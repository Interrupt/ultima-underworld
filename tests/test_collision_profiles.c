#include "unity.h"
#include "src/headers/uw.h"
#include "collision_profiles_test_globals.h"

void init_collision_response_profiles(void);
int collision_response_default(ushort *), collision_response_alt_locomotion(ushort *),
    collision_response_mobile_object(ushort *), collision_response_other_locomotion(ushort *);

void setUp(void)
{
    memset(DAT_002048c0_backing, 0, sizeof DAT_002048c0_backing);
    memset(DAT_002048f0_backing, 0, sizeof DAT_002048f0_backing);
    memset(DAT_00204950_backing, 0, sizeof DAT_00204950_backing);
    memset(DAT_00204920_backing, 0, sizeof DAT_00204920_backing);
    memset(DAT_00204980_backing, 0, sizeof DAT_00204980_backing);
    memset(DAT_00204990_backing, 0, sizeof DAT_00204990_backing);
    memset(DAT_002049a0_backing, 0, sizeof DAT_002049a0_backing);
    memset(DAT_002049b0_backing, 0, sizeof DAT_002049b0_backing);
    init_collision_response_profiles();
}
void tearDown(void) {}

static unsigned short field(const void *profile, int offset)
{
    return *(const unsigned short *)((const char *)profile + offset);
}

/* NPC movement hands one of these four structs to the collision sweep: +2 selects which
   collision flags run the response callback, +4 which flags block the move. They were
   being written to unrelated variables, leaving every NPC profile empty, so land
   walkers waded into water and swimmers could leave it. Values are from ARM 0x2b63c. */
static void test_walker_profile_blocks_and_responds_to_terrain_flags(void)
{
    TEST_ASSERT_EQUAL_HEX16(0x0000, field(DAT_00204980_backing, 0));
    TEST_ASSERT_EQUAL_HEX16(0x1f30, field(DAT_00204980_backing, 2));
    TEST_ASSERT_EQUAL_HEX16(0x1010, field(DAT_00204980_backing, 4));
    TEST_ASSERT_EQUAL_HEX16(0x0020, field(DAT_00204980_backing, 6));
    TEST_ASSERT_TRUE(DAT_00204988 == collision_response_default);
}
static void test_swimmer_profile_blocks_and_responds_to_terrain_flags(void)
{
    TEST_ASSERT_EQUAL_HEX16(0x0010, field(DAT_002049b0_backing, 0));
    TEST_ASSERT_EQUAL_HEX16(0x1728, field(DAT_002049b0_backing, 2));
    TEST_ASSERT_EQUAL_HEX16(0x10a8, field(DAT_002049b0_backing, 4));
    TEST_ASSERT_EQUAL_HEX16(0x0000, field(DAT_002049b0_backing, 6));
    TEST_ASSERT_TRUE(DAT_002049b8 == collision_response_other_locomotion);
}
static void test_flyer_and_mobile_object_profiles(void)
{
    TEST_ASSERT_EQUAL_HEX16(0x1000, field(DAT_00204990_backing, 0));
    TEST_ASSERT_EQUAL_HEX16(0x0700, field(DAT_00204990_backing, 2));
    TEST_ASSERT_EQUAL_HEX16(0x0080, field(DAT_00204990_backing, 4));
    TEST_ASSERT_EQUAL_HEX16(0x0000, field(DAT_00204990_backing, 6));
    TEST_ASSERT_TRUE(DAT_00204998 == collision_response_alt_locomotion);
    for (int offset = 0; offset < 8; offset += 2)
        TEST_ASSERT_EQUAL_HEX16(0, field(DAT_002049a0_backing, offset));
    TEST_ASSERT_TRUE(DAT_002049a8 == collision_response_mobile_object);
}
static void test_snapshot_buffers_start_with_their_flag_byte(void)
{
    TEST_ASSERT_EQUAL_HEX8(0x80, ((byte *)DAT_002048c0_backing)[0x17]);
    TEST_ASSERT_EQUAL_HEX8(0x80, DAT_002048f0_backing[0x17]);
    TEST_ASSERT_EQUAL_HEX8(0x00, DAT_00204920_backing[0x17]);
    TEST_ASSERT_EQUAL_HEX8(0x80, DAT_00204950_backing[0x17]);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_walker_profile_blocks_and_responds_to_terrain_flags);
    RUN_TEST(test_swimmer_profile_blocks_and_responds_to_terrain_flags);
    RUN_TEST(test_flyer_and_mobile_object_profiles);
    RUN_TEST(test_snapshot_buffers_start_with_their_flag_byte);
    return UNITY_END();
}

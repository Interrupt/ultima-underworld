/* The orb text trap and the dial trap run in the real game: see test_traps_game.c. Only the "message
   missing" guard needs a mock, because the real message table has no gaps for a trap to hit. */
#include "traps_fixture.h"

void setUp(void) { traps_fixture_reset(); }
void tearDown(void) { traps_fixture_dispose(); }

static void test_level_one_orb_missing_message_is_not_printed(void)
{
    available_message = NULL;
    TEST_ASSERT_EQUAL_INT(2, dispatch_trap_type_effect(orb_text_trap(), 58, 13));
    TEST_ASSERT_EQUAL_INT(1, lookups);
    TEST_ASSERT_EQUAL_HEX16(0x1201, message_id);
    TEST_ASSERT_EQUAL_INT(0, prints);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_level_one_orb_missing_message_is_not_printed);
    return UNITY_END();
}

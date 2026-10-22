#include "scheduler_fixture.h"

void setUp(void) { scheduler_fixture_reset(); }
void tearDown(void) { scheduler_fixture_dispose(); }

void test_damage_spark_animates_then_disappears(void)
{
    add_spark(1, 8);
    TEST_ASSERT_EQUAL_UINT16(45, objects[1][3] & 0x3f);
    TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
    scheduler_tick(1);
    TEST_ASSERT_EQUAL_UINT16(46, objects[1][3] & 0x3f);
    TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
    TEST_ASSERT_EQUAL_INT(0, freed[1]);
    scheduler_tick(1);
    TEST_ASSERT_EQUAL_UINT8(1, freed[1]);
    TEST_ASSERT_EQUAL_UINT8(0, g_scheduler_count);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)(tiles[1] + 2) >> 6);
}

void test_expired_sparks_all_disappear(void)
{
    add_spark(1, 8);
    add_spark(2, 9);
    scheduler_tick(2);
    TEST_ASSERT_EQUAL_INT(1, freed[1]);
    scheduler_tick(2); /* The original queue defers the swapped-in entry. */
    TEST_ASSERT_EQUAL_INT(1, freed[2]);
    TEST_ASSERT_EQUAL_UINT8(0, g_scheduler_count);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)(tiles[1] + 2) >> 6);
    TEST_ASSERT_EQUAL_UINT16(0, *(ushort *)(tiles[2] + 2) >> 6);
}

void test_spark_animation_wraps_with_an_indefinite_delay(void)
{
    objects[1][0] = 0x1cb;
    scheduler_add_entry(1, -1, 0, 12, 8);
    for (int tick = 1; tick <= 8; tick++) {
        scheduler_tick(1);
        TEST_ASSERT_EQUAL_UINT16(45 + tick % 5, objects[1][3] & 0x3f);
        TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
        TEST_ASSERT_EQUAL_INT(0, freed[1]);
    }
}

void test_initial_frame_uses_intensity_modulo_animation_length(void)
{
    objects[1][0] = 0x1cb;
    objects[1][3] = 0xaac0;
    scheduler_add_entry(1, 1, 12, 12, 8);
    TEST_ASSERT_EQUAL_UINT16(47, objects[1][3] & 0x3f); /* 45 + 12 % 5. */
    TEST_ASSERT_EQUAL_HEX16(0xaac0, objects[1][3] & 0xffc0);
}

void test_removing_an_entry_preserves_the_other_pending_effect(void)
{
    add_spark(1, 8);
    add_spark(2, 9);
    scheduler_remove_entry(1);
    TEST_ASSERT_EQUAL_UINT8(1, g_scheduler_count);
    TEST_ASSERT_EQUAL_UINT16(2, *(ushort *)queue >> 6);
    scheduler_tick(2);
    TEST_ASSERT_EQUAL_INT(0, freed[1]);
    TEST_ASSERT_EQUAL_INT(1, freed[2]);
    TEST_ASSERT_EQUAL_UINT8(0, g_scheduler_count);
}

void test_scheduler_rejects_entries_after_its_64_slot_capacity(void)
{
    objects[1][0] = 0x1cb;
    for (int count = 1; count <= 64; count++)
        TEST_ASSERT_EQUAL_UINT(count, scheduler_add_entry(1, 1, 0, 12, 8));
    TEST_ASSERT_EQUAL_UINT((uint)-1, scheduler_add_entry(1, 1, 0, 12, 8));
    TEST_ASSERT_EQUAL_UINT8(64, g_scheduler_count);
}

void test_critter_death_animation_finishes_and_leaves_a_corpse(void)
{
    byte *critter = (byte *)objects[2];
    objects[2][0] = 0x40; /* Rat, whose data record drops a rat corpse (0xd9). */
    objects[2][0xb] = (12 << 10) | (9 << 4);
    *(ushort *)(tiles[2] + 2) = 2 << 6;
    critter[8] = 10;
    critter[0x14] = 4;
    DAT_0010190c = scheduler_mobile_object(2);
    DAT_00101938 = 12;
    DAT_0010193c = 9;
    TEST_ASSERT_EQUAL_UINT(1, initiate_npc_death((char *)critter));
    for (int frame = 1; frame <= 3; frame++) {
        TEST_ASSERT_EQUAL_UINT(1, npc_ai_tick());
        TEST_ASSERT_EQUAL_UINT8(frame, critter[0xc] >> 4);
        TEST_ASSERT_EQUAL_INT(0, corpses_spawned);
        TEST_ASSERT_EQUAL_INT(0, freed[2]);
    }
    TEST_ASSERT_EQUAL_UINT(0, npc_ai_tick());
    TEST_ASSERT_EQUAL_INT(1, freed[2]);
    TEST_ASSERT_EQUAL_INT(1, corpses_spawned);
    TEST_ASSERT_EQUAL_INT(1, corpses_placed);
    TEST_ASSERT_EQUAL_HEX16(0xd9, corpse_type);
    TEST_ASSERT_EQUAL_UINT16(3, *(ushort *)(tiles[2] + 2) >> 6);
    TEST_ASSERT_EQUAL_UINT16(0, corpse[2] >> 6);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_damage_spark_animates_then_disappears);
    RUN_TEST(test_expired_sparks_all_disappear);
    RUN_TEST(test_spark_animation_wraps_with_an_indefinite_delay);
    RUN_TEST(test_initial_frame_uses_intensity_modulo_animation_length);
    RUN_TEST(test_removing_an_entry_preserves_the_other_pending_effect);
    RUN_TEST(test_scheduler_rejects_entries_after_its_64_slot_capacity);
    RUN_TEST(test_critter_death_animation_finishes_and_leaves_a_corpse);
    return UNITY_END();
}

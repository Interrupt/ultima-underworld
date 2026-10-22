#include "game_fixture.h"
#include "src/headers/chargen.h"

void uw_test_create_character(char *record, char *attributes, uw_unaligned_word_t *object)
{
    memset(record, 0, UW_TEST_CHARACTER_SIZE);
    memset(attributes, 0, UW_TEST_CHARACTER_SIZE);
    memset(object, 0, 0x1b);
    DAT_00086df8 = record;
    DAT_0023be74 = attributes;
    g_player_object = (uw_mobile_object_t *)object;
    object[0] = 0x7f;
    attributes[4] = 40;
    uw_test_creating_character = true;
    init_new_character_record(1); /* Real defaults; skip class dice rolls/UI. */
    uw_test_creating_character = false;
    strcpy(record, "Test Avatar");
    record[0x35] = ((byte *)object)[8];
    record[0x36] = attributes[4];
}

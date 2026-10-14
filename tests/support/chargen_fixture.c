#include "game_fixture.h"
#include "chargen_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
long ce_rand(void);
void configure_texture_detail_functions(void);
void refresh_player_equipment_effects(void);

undefined1 DAT_0023bca8_backing[256];
char attributes[16];

ushort player_object[16];

char *DAT_00086df8 = record;

char *DAT_0023be74 = attributes;

uw_mobile_object_t *g_player_object = (uw_mobile_object_t *)player_object;

short DAT_00201b68;

undefined1 DAT_000fb860_backing[32];

undefined1 DAT_000fb8f0_backing[1680];

int random_values[64], random_count, random_index;

int dice_calls, equipment_calls, reset_calls;

int trained[6], trained_count;

long ce_rand(void)
{
    TEST_ASSERT_LESS_THAN_INT(random_count, random_index);
    return random_values[random_index++];
}

int roll_dice_sum(int count, short sides)
{
    /* Deterministic roll totals distinguish skills from attributes. */
    if (dice_calls < 20) {
        TEST_ASSERT_EQUAL_INT(3, count);
        TEST_ASSERT_EQUAL_INT(4, sides);
        dice_calls++;
        return 6;
    }
    TEST_ASSERT_EQUAL_INT(2, count);
    TEST_ASSERT_EQUAL_INT(10, sides);
    dice_calls++;
    return 11;
}

void configure_texture_detail_functions(void) { reset_calls++; }

void refresh_player_equipment_effects(void) { equipment_calls++; }

void advance_skill_training(short skill)
{
    TEST_ASSERT_LESS_THAN_INT(6, trained_count);
    trained[trained_count++] = skill;
}

void chargen_fixture_reset(void)
{
    memset(record, 0xa5, sizeof(record));
    memset(attributes, 0, sizeof(attributes));
    memset(player_object, 0, sizeof(player_object));
    /* Match character_generator_start's SKILLS.DAT load without its UI. */
    memset(DAT_000fb8f0_backing, 0, sizeof DAT_000fb8f0_backing);
    FILE *skills = uw_test_open_data("DATA/SKILLS.DAT");
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(0x28,
        fread(DAT_000fb8f0_backing, 1, 0x348, skills));
    TEST_ASSERT_EQUAL_INT(0, fclose(skills));
    memcpy(DAT_000fb860_backing, DAT_000fb8f0_backing, 0x20);
    memset(random_values, 0, sizeof(random_values));
    random_count = random_index = dice_calls = 0;
    equipment_calls = reset_calls = trained_count = 0;
    DAT_00201b68 = 0;
    attributes[4] = 40;
}

void chargen_fixture_dispose(void)
{
    TEST_ASSERT_EQUAL_INT(random_count, random_index);
}

void prepare_initial_randomness(void)
{
    random_values[0] = 4; /* portrait */
    random_values[1] = 1; /* sex */
    random_values[2] = 5; /* initial object stat adjustment */
    random_count = 3;
}

/* Isolate the storage/encoding boundary while testing the real status pack
   and unpack functions. No HUD or audio initialization is needed. */
undefined1 DAT_00204880_backing[128];
uw_armor_type_props_t g_armor_type_props[32];
short DAT_00201c70;
static byte saved_status[0xd2], saved_key;
int is_sound_effects_enabled(void) { return 0; }
int is_music_playing(void) { return 0; }
void set_sound_effects_enabled(int enabled) {}
void set_music_enabled(int enabled) {}
void apply_movement_mode_profile(byte mode) {}
int write_file_handle(int handle, const void *buffer, uint size)
{
    TEST_ASSERT_EQUAL_UINT(1, size);
    saved_key = *(const byte *)buffer;
    return size;
}
int read_file_handle(int handle, void *buffer, uint size)
{
    TEST_ASSERT_EQUAL_UINT(1, size);
    *(byte *)buffer = saved_key;
    return size;
}
int write_xor_scrambled_block(int handle, byte key, char *buffer, short size)
{
    TEST_ASSERT_EQUAL_UINT(sizeof saved_status, size);
    memcpy(saved_status, buffer, size);
    return size;
}
short read_xor_scrambled_block(int handle, byte key, char *buffer, short size)
{
    TEST_ASSERT_EQUAL_UINT(sizeof saved_status, size);
    memcpy(buffer, saved_status, size);
    return size;
}

undefined1 DAT_0010060c_backing[8];
byte DAT_0020330c, DAT_002046cc, DAT_0020208c;
int g_debug_fly, g_debug_farsight, g_debug_noclip;
char DAT_00086db0, DAT_00086db1;
int DAT_00086db8_backing[256], DAT_0023bc94;
undefined4 DAT_0023bc9c, DAT_0023bc98, DAT_002020dc;
undefined4 DAT_002020d0, DAT_002020d4, DAT_002020d8;
short DAT_000858c4;
void reduce_item_quality_on_use(ushort *object, char dice_count) { (void)object; (void)dice_count; TEST_FAIL_MESSAGE("Unexpected quality decay"); }
uint calculate_object_weight(uw_object_hdr_t *object) { return 25; }

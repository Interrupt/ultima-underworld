#include "head_bob_fixture.h"

static char character[256], attributes[256];
static ushort player[16];
static unsigned random_value;
unsigned int g_uw_frame_clock_units;
char *DAT_00086df8, *DAT_0023be74, *DAT_0023b82c, *DAT_002046b8;
uw_mobile_object_t *g_player_object;
short DAT_00201b68, DAT_00202078, DAT_00201c70;
short g_movement_mode, DAT_0023beb4;
undefined1 DAT_00204880_backing[128], DAT_00086e6c_backing[64];
undefined2 DAT_002048b0_backing[16];
uw_object_type_props_t g_object_type_props[512];
undefined4 DAT_0023bea8, DAT_002020d0, DAT_000858a0, DAT_0023bc98;
undefined2 DAT_0023be98, DAT_0023be9a, DAT_0023be9c, DAT_0023be9e, DAT_0023beb8;
char DAT_00086e84, DAT_0023bf60, DAT_0023bf14;
byte DAT_0023bf18;
byte DAT_0023bf10, DAT_0023beb0, DAT_0023beac;
uint DAT_0023bf5c;
int DAT_0023bf64, g_npc_tick_enabled;
short DAT_0023be90, DAT_0023be92, DAT_0023be94, DAT_0023bf00, DAT_0023bea4, DAT_0023bf08;
undefined2 DAT_0023bf02, DAT_0023bf04, DAT_0023bea0;
undefined4 DAT_000d9930_arr[361], DAT_000d9ed8_arr[361], DAT_000c8ac0_mtx[16];
undefined4 DAT_000db438, DAT_000db43c, DAT_000db440;
int DAT_000db448, DAT_000db44c, DAT_000db450;

void head_bob_fixture_reset(void)
{
    uw_test_create_character(character, attributes, player);
    DAT_0023b82c = (char *)g_player_object;
    memset(DAT_00204880_backing, 0, sizeof DAT_00204880_backing);
    memset(DAT_00086e6c_backing, 0, sizeof DAT_00086e6c_backing);
    DAT_00204880 = 0x2080;
    DAT_00204882 = 0x2080;
    DAT_00204884 = 768;
    DAT_00201c70 = 0x2000;
    DAT_00202078 = 400;
    DAT_0023beb4 = DAT_0023beb8 = 0;
    DAT_0023be98 = DAT_0023be9a = DAT_0023be9c = DAT_0023be9e = 0;
    DAT_0023bea8 = 0;
    DAT_0023bf18 = 0;
    g_movement_mode = 0;
    g_npc_tick_enabled = DAT_002020d0 = DAT_000858a0 = 0;
    DAT_00086e84 = -1;
    DAT_0023bf5c = ~0u; /* Keep footstep audio outside these camera tests. */
    DAT_000db438 = DAT_000db43c = DAT_000db440 = 0;
    DAT_000db448 = DAT_000db44c = DAT_000db450 = 0;
    g_uw_frame_clock_units = 0;
    random_value = 0x40;
}

float head_bob_fixture_matrix_element(unsigned index)
{
    float value;
    TEST_ASSERT_LESS_THAN_UINT(16, index);
    memcpy(&value, &DAT_000c8ac0_mtx[index], sizeof value);
    return value;
}

void head_bob_fixture_tick(int mode, int speed, unsigned elapsed)
{
    g_uw_frame_clock_units += elapsed;
    g_movement_mode = mode;
    g_jump_ascent_timer = speed;
    movement_tick(elapsed, 0, 0);
    update_current_view_from_subject();
}

void head_bob_fixture_set_random(unsigned value) { random_value = value; }

/* Physics and audio are boundaries: the actual movement tick, animation
   calculations, and camera-record updates run unmodified. */
void decode_movement_command(void) {}
void apply_heading_turn(int elapsed) {}
void movement_collision_sweep(void *position, void *snapshot) {}
void commit_player_move(void) {}
void set_pending_update_flags(ushort flags) {}
void tick_mobile_objects(char elapsed) { TEST_FAIL_MESSAGE("Unexpected NPC tick"); }
void stop_movement_sound_handle(void) {}
int play_sound_effect_with_pan(uint sound, byte pan, uint volume) { return 0; }
uint read_realtime_clock_units(void) { return 0; }
unsigned int uw_frame_clock_ms(void) { return g_uw_frame_clock_units; }
long ce_rand(void) { return random_value; }
int apply_typed_damage_to_object(uw_unaligned_word_t *target, uw_unaligned_word_t *attacker, int tile_x, short tile_y, byte damage, byte damage_type) { (void)target; (void)attacker; (void)tile_x; (void)tile_y; (void)damage; (void)damage_type; TEST_FAIL_MESSAGE("Unexpected hazard damage"); return 0; }
void angle_to_screen_delta(uint angle, void *x, void *y)
{ TEST_FAIL_MESSAGE("Unexpected alternate camera subject"); }

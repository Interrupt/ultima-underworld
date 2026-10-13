#include "unity.h"
#include "movement_fixture.h"
#include "game_fixture.h"

MovementFixture movement_fixture;

/* Tile heights and wall contact are supplied at the map-sampling boundary.
 * Step limits, collision flags, response, and heading deflection are real. */
undefined1 DAT_00204880_backing[128];
#define movement DAT_00204880_backing
char *DAT_00204874 = (char *)movement;
char *DAT_002048bc = movement_fixture.response_mask;
unsigned char DAT_002049c8_backing[64];
undefined1 DAT_00204980_backing[32];
undefined2 DAT_00204990_backing[16];
undefined2 DAT_002049a0_backing[16];
undefined2 DAT_002049b0_backing[16];
int (*DAT_00204988)(ushort *), (*DAT_00204998)(ushort *), (*DAT_002049a8)(ushort *), (*DAT_002049b8)(ushort *);
undefined1 DAT_002049c0;
char DAT_002049bc;
short DAT_00086980, DAT_00086982, DAT_00086990, DAT_00086996;
ushort DAT_0008698c;
/* Recovered compass octants, matching the game table. */
unsigned char DAT_000869a8_backing[16] = {
    0, 0, 0, 0xe0, 0, 0xc0, 0, 0xa0,
    0, 0x80, 0, 0x60, 0, 0x40, 0, 0x20
};
short *g_sweep_foot_pos = (short *)DAT_002049c8_backing;
byte *DAT_00202c6c = DAT_002049c8_backing;
unsigned char DAT_00086998_backing[16];
undefined1 DAT_00202c70_backing[64];
uw_object_type_props_t g_object_type_props[512];
undefined1 DAT_00202c38_backing[1536];
int DAT_00204870;
int g_debug_noclip;
int uw_wall_turn_step(void) { return 0x400; }  /* original wall-turn step (--wall-turn 1.0) */
undefined4 DAT_00204878;
char *DAT_002046b8 = (char *)movement_fixture.object_arena + 0x4000;
short DAT_00201c70, DAT_00202080, DAT_00202088;
undefined2 DAT_00201c78;
undefined4 DAT_000858a0;
char *DAT_002029cc;
uint read_realtime_clock_units(void) { return 0; }
void object_list_unlink(ushort *link_field, uw_object_hdr_t *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Unexpected tile change"); }
void object_list_insert_head(ushort *link_field, uw_object_hdr_t *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Unexpected tile change"); }
void set_locomotion_state(ushort state, int flags) { (void)state; (void)flags; }
int roll_skill_check(int skill, int difficulty) { (void)skill; (void)difficulty; TEST_FAIL_MESSAGE("Unexpected fall damage"); return 0; }
int apply_typed_damage_to_object(ushort *target, ushort *attacker, int tile_x, short tile_y, byte damage, byte damage_type) { (void)target; (void)attacker; (void)tile_x; (void)tile_y; (void)damage; (void)damage_type; TEST_FAIL_MESSAGE("Unexpected damage"); return 0; }
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias) { (void)sound_id; (void)pan; (void)volume_bias; TEST_FAIL_MESSAGE("Unexpected landing sound"); return 0; }

short movement_fixture_read_short(int offset)
{
    short value;
    memcpy(&value, movement + offset, sizeof(value));
    return value;
}
void movement_fixture_write_short(int offset, short value)
{
    memcpy(movement + offset, &value, sizeof(value));
}

void *tilemap_lookup(short tile_x, short tile_y)
{
    if (!movement_fixture.setup_fixture) {
        TEST_ASSERT_EQUAL_INT(1, tile_x);
        TEST_ASSERT_EQUAL_INT(2, tile_y);
    }
    movement_fixture.sampled_tiles++;
    return &movement_fixture.destination_floor;
}
uint collision_sample_floor_height(uint sample, undefined4 *status)
{
    TEST_ASSERT_EQUAL_INT(4, sample);
    *status = 0;
    return movement_fixture.destination_floor;
}
void collision_build_height_field(uint step_limit)
{
    if (movement_fixture.setup_fixture) movement_fixture.destination_floor = DAT_002049c8 == 16 ? 128 : 0;
    if (movement_fixture.stair_fixture) {
        TEST_ASSERT_EQUAL_INT(8, step_limit);
        collision_corner_flags(step_limit);
    } else {
        DAT_002049d4 = movement_fixture.wall_flags;
    }
}
void collision_height_envelope(int mode, int collision)
{
    DAT_002049d6 = movement_fixture.envelope_flags;
    DAT_002049d8 = DAT_002049d9 = movement_fixture.destination_floor;
    if (movement_fixture.door_fixture) {
        DAT_00202c18 = DAT_00202c1c = 4;
        DAT_00202c20 = DAT_00202c24 = 0;
        DAT_00202c28 = DAT_00202c2c = 7;
        collision_add_candidate_object(movement_fixture.door, 300, 0, 0, 0);
    }
}

undefined DAT_00202c32;
short *g_sweep_velocity = (short *)(movement + 6);
short DAT_00086984, DAT_0008698a, DAT_0008698e, DAT_00086994;
ushort DAT_00086992;
undefined1 DAT_00086986_backing[64];
char DAT_00202c18, DAT_00202c1c, DAT_00202c20, DAT_00202c24;
char DAT_00202c28, DAT_00202c2c;
byte DAT_002046d8, DAT_002046e0, DAT_002046e4;
byte DAT_002046dc;
int DAT_002046e8;
ushort DAT_002020a0, DAT_002020a4;

uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    if (slot == 1) return movement_fixture.player;
    if (slot == 300) return movement_fixture.door;
    return NULL;
}
char *DAT_002046c4 = (char *)movement_fixture.object_arena + 0x5b00;
short DAT_0010144c, DAT_00101454;
int encode_object_slot_index(const uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(movement_fixture.door, object);
    movement_fixture.door_contacts++;
    return 300;
}
int sync_object_tile_position(ushort *object, void *snapshot)
{
    TEST_ASSERT_EQUAL_PTR(movement_fixture.door, object);
    memcpy(movement_fixture.last_obstacle_snapshot, snapshot, sizeof(movement_fixture.last_obstacle_snapshot));
    movement_fixture.obstacle_syncs++;
    return 1;
}
uint resolve_skill_gated_unlock_or_use(void *object, void *key_item, void *lock_link, ushort key_id)
{ TEST_FAIL_MESSAGE("Unexpected unlock trigger"); return 0; }
ushort *use_object_on_target(ushort *actor, ushort *used_object, int flag)
{ TEST_FAIL_MESSAGE("Unexpected use trigger"); return 0; }
void angle_to_screen_delta(uint heading, void *dx_, void *dy_)
{ short *dx = (short *)dx_; short *dy = (short *)dy_;
    (void)heading;
    *dx = 0;
    *dy = 0;
}

void sweep_land_on_surface(void)
{
    movement_fixture.surface_landings++;
    movement_fixture.foot_position[2] = (short)_DAT_0008699b;
}
int sweep_step(int direction)
{
    TEST_ASSERT_EQUAL_INT(-1, direction);
    /* Revert the attempted blocked sub-step to its pre-contact position. */
    movement_fixture.x = 100;
    movement_fixture.y = 200;
    if (movement_fixture.setup_fixture) {
        movement_fixture.foot_position[0] = 8; /* restore the tile before the wall */
        movement_fixture.foot_position[1] = 16;
    }
    movement_fixture.reverted_steps++;
    return 1;
}
void sweep_restart_remaining(int slide)
{
    TEST_ASSERT_EQUAL_INT(1, slide);
    movement_fixture.restarted_sweeps++;
}
void resolve_wall_slide_corner(void)
{
    DAT_002049da = 9; /* flat raised face uses the movement-axis tangent */
}
long ce_rand(void)
{
    if (uw_test_creating_character) return 0;
    /* Static placement snapshots jitter their sub-tile coordinates. */
    if (movement_fixture.door_contacts == 0)
        TEST_FAIL_MESSAGE("Wall response unexpectedly used random deflection");
    return 0;
}

void movement_fixture_reset(void)
{
    movement_fixture.state = movement;
    movement_fixture.foot_position = (short *)DAT_002049c8_backing;
    movement_fixture.player = (ushort *)(movement_fixture.object_arena + 0x401b);
    movement_fixture.door = (ushort *)(movement_fixture.object_arena + 0x5b00 + (300 - 256) * 8);
    g_sweep_foot_pos = movement_fixture.foot_position;
    DAT_00202c6c = DAT_002049c8_backing;
    DAT_002029cc = (char *)movement_fixture.object_arena;
    memset(movement, 0, sizeof(movement));
    memset(movement_fixture.response_mask, 0, sizeof(movement_fixture.response_mask));
    memset(DAT_002049c8_backing, 0, sizeof(DAT_002049c8_backing));
    DAT_00204988 = DAT_00204998 = DAT_002049a8 = DAT_002049b8 = NULL;
    DAT_002049bc = DAT_002049c0 = 0;
    DAT_00086980 = DAT_00086982 = 0;
    DAT_00086990 = 3;
    DAT_00086996 = 1;
    DAT_0008698c = 0; /* flat wall's tangent heading is 0 (or opposite, 0x8000) */
    movement[0x16] = 5;
    movement[0x17] = 0x80; /* grounded player's deflection flags */
    movement_fixture_write_short(0x14, 256); /* remaining horizontal movement */
    movement_fixture.wall_flags = 0x404; /* wall obstruction with a floor underneath */
    movement_fixture.reverted_steps = movement_fixture.restarted_sweeps = 0;
    movement_fixture.x = 101;
    movement_fixture.y = 201;
    memset(movement_fixture.foot_position, 0, 3 * sizeof(short));
    movement_fixture.foot_position[0] = 8;
    movement_fixture.foot_position[1] = 16;
    memset(DAT_00086998_backing, 0, sizeof(DAT_00086998_backing));
    memset(DAT_00202c70_backing, 0, sizeof(DAT_00202c70_backing));
    movement_fixture.stair_fixture = false;
    movement_fixture.destination_floor = 0;
    movement_fixture.sampled_tiles = 0;
    movement_fixture.envelope_flags = 0;
    movement_fixture.door_fixture = movement_fixture.setup_fixture = false;
    DAT_00201c70 = DAT_00201c78 = DAT_00202080 = DAT_00202088 = 0;
    movement_fixture.door_contacts = movement_fixture.surface_landings = movement_fixture.obstacle_syncs = 0;
    memset(movement_fixture.last_obstacle_snapshot, 0, sizeof(movement_fixture.last_obstacle_snapshot));
    DAT_00086984 = DAT_0008698a = DAT_0008698e = DAT_00086994 = 0;
    DAT_00086992 = 0;
    uw_test_load_map(movement_fixture.object_arena, sizeof movement_fixture.object_arena, 1);
    /* Collision scenarios control map sampling and use isolated actors. */
    memset(movement_fixture.object_arena + 0x4000, 0,
           sizeof movement_fixture.object_arena - 0x4000);
    uw_test_create_character(movement_fixture.character, movement_fixture.attributes,
                             movement_fixture.player);
    memset(DAT_00202c38_backing, 0, sizeof(DAT_00202c38_backing));
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    movement_fixture.door[0] = 0x140;
    movement_fixture.door[1] = (4 << 13) | (4 << 10); /* centered on the tile */
    DAT_002049d2 = 1;
    movement[0x25] = movement[0x27] = 8;
    movement[0x26] = 16;
}

void movement_fixture_set_heading(ushort heading)
{
    DAT_002049ce = heading;
    movement_fixture_write_short(0x21, (short)heading);
}
void movement_fixture_prepare_stair(byte height)
{
    movement_fixture.stair_fixture = true;
    movement_fixture.foot_position[2] = 32;
    movement_fixture.destination_floor = height;
    DAT_00202c78 = 1;
    movement_fixture_set_heading(0x4000);
}

#include "game_fixture.h"
#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>
#include <math.h>
#include "throw_test_globals.h"

/* Real cursor input, throw aiming, placement refinement and object creation.
   The fixture supplies an empty world and the original quantized sin/cos. */
short g_mouse_x, g_mouse_y;
ushort arena[0x4000], held[4];
short click[16];
char character[256];
ushort *thrown;
int freed, allocations;
short world_x(ushort *object)
{ return (object[0xb] >> 10) * 8 + (object[1] >> 13); }
short world_y(ushort *object)
{ return (object[0xb] >> 4 & 63) * 8 + (object[1] >> 10 & 7); }
short fine(ushort *object, int offset)
{ short value; memcpy(&value, (byte *)object + offset, 2); return value; }
uw_object_hdr_t *alloc_object_slot(int mobile)
{
    TEST_ASSERT_EQUAL_INT(1, mobile);
    allocations++;
    return thrown;
}
void free_object_slot(uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(held, object);
    freed++;
}
int encode_object_slot_index(const uw_object_hdr_t *object)
{ return ((char *)object - DAT_002046b8) / 27; }
void *tilemap_lookup(short x, short y)
{
    TEST_ASSERT_TRUE(x >= 0 && x < 64 && y >= 0 && y < 64);
    return (byte *)arena + (y * 64 + x) * 4;
}
uw_object_hdr_t *resolve_object_link(ushort *head_)
{ ushort *head = (ushort *)head_; return (*head >> 6) ? DAT_002046b8 + (*head >> 6) * 27 : NULL; }
void heading_to_sine_cosine(uint heading, short *sine, short *cosine)
{
    double radians = (heading >> 8 & 255) * (2.0 * M_PI / 256.0);
    *sine = (short)lround(32767 * sin(radians));
    *cosine = (short)lround(32767 * cos(radians));
}
void collision_height_envelope(int unused, int mode)
{
    /* ARM placement record offsets: radius=8, object slot=10,
       tile flags=12/14, object candidate count=20. */
    TEST_ASSERT_EQUAL_INT(2, *(ushort *)(DAT_00202c6c + 10));
    TEST_ASSERT_EQUAL_UINT(((byte *)g_object_type_props)[0x80 * 13 + 1] & 7, DAT_00202c6c[8]);
    memset(DAT_00202c6c + 12, 0, 12);
}
void collision_build_height_field(uint step_limit) {}
void sort_collision_candidates(void) { TEST_FAIL_MESSAGE("Empty world has no object contacts"); }
int play_sound_effect_at_object(int sound_id, ushort *object, int volume_bias) { (void)sound_id; (void)object; (void)volume_bias; return 1; }
int object_is_mobile(const uw_object_hdr_t *object) { (void)object; return 1; }
ushort *discard_misplaced_object(void *list, ushort *object, int destroy)
{ return NULL; }
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias) { (void)sound_id; (void)pan; (void)volume_bias; return 1; }
uw_object_hdr_t *reallocate_object_to_arena(ushort *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected ground drop"); return NULL; }
uw_object_hdr_t *settle_dropped_object(void *object, short tile_x,
				       short tile_y, int force) { (void)object; (void)tile_x; (void)tile_y; (void)force; TEST_FAIL_MESSAGE("Unexpected ground drop"); return NULL; }
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit) { (void)catalog_type; (void)ignore_slot; (void)position_x; (void)position_y; (void)height; (void)check_mode; (void)step_limit; TEST_FAIL_MESSAGE("Unexpected ground drop"); return 0; }
void object_list_append_tail(ushort *link_field, uw_object_hdr_t *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Unexpected ground drop"); }
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias) { (void)sound_id; (void)world_x; (void)world_y; (void)volume_bias; return 1; }
void print_scroll_message_by_id(uint message_id) { (void)message_id;}
void set_ambient_bias_without_light(char light_level) { (void)light_level;}
void throw_cursor_fixture_reset(void)
{
    memset(arena, 0, sizeof arena);
    memset(held, 0, sizeof held);
    memset(click, 0, sizeof click);
    memset(character, 0, sizeof character);
    DAT_002046b8 = (char *)arena + 0x4000;
    DAT_002046c4 = (char *)arena + 0x5b00;
    g_player_object = (uw_mobile_object_t *)(ushort *)(DAT_002046b8 + 27);
    thrown = (ushort *)(DAT_002046b8 + 2 * 27);
    ((ushort *)g_player_object)[0] = 0x7f;
    ((ushort *)g_player_object)[1] = 48 | (4 << 13) | (4 << 10);
    ((ushort *)g_player_object)[0xb] = (36 << 10) | (32 << 4);
    held[0] = 0x80;
    held[2] = 20;
    DAT_00085a6c = click;
    click[8] = 1;
    DAT_00086df8 = character;
    DAT_0023beb4 = 0;
    g_mouse_x = 141; g_mouse_y = 55;
    allocations = freed = 0;
    memset(((byte *)g_object_type_props), 0, sizeof g_object_type_props);
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
}
void throw_cursor_fixture_dispose(void) {}
void launch(void)
{
    TEST_ASSERT_EQUAL_UINT(1, drop_held_object_near_player(held, 1));
    TEST_ASSERT_EQUAL_INT(1, allocations);
    TEST_ASSERT_EQUAL_INT(1, freed);
    TEST_ASSERT_EQUAL_UINT(0x80, thrown[0] & 0x1ff);
}

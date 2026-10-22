#include "game_fixture.h"
#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>
#include "src/headers/debug.h"
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {}

/* The actual level-1 goblin and data tables. Allocation and placement are
   fixtures; sprite association, loot rolls, object creation and links are real. */
ushort arena[0x4000];
byte original_goblin[27], page_header[2];
ushort *goblin;
char *DAT_002046b8, *DAT_002046c4, *g_despawn_creature_record;
uw_monster_type_props_t g_monster_type_props[64];
uw_object_type_props_t g_object_type_props[512];
undefined1 DAT_0023ce70_backing[128];
uw_ranged_type_props_t g_ranged_type_props[16];
short DAT_00201b68, DAT_0010144c, DAT_00101454;
undefined2 DAT_002020a0, DAT_002020a4;
uw_mobile_object_t *g_player_object;
ushort *DAT_00202a44;
char *DAT_00086df8;
short DAT_00202a38, DAT_00202a3c, DAT_00202a40;
ushort DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54;
char DAT_00101928;
ushort *projectile;
unsigned rng_state, spawned, placed, palette_used;
ushort *drops[16];
int types[16];
unsigned rolls[32], roll_count, roll_index;

void read_data(const char *name, long offset, void *buffer, size_t count)
{
    uw_test_read_data(name, buffer, count, offset, SEEK_SET);
}
long ce_rand(void)
{
    if (roll_index < roll_count) return rolls[roll_index++];
    rng_state = rng_state * 1664525u + 1013904223u;
    return (rng_state >> 1) & 0x7fffffff;
}
int roll_dice_sum(int count, short sides)
{
    int sum = 0;
    while (count--) sum += 1 + ce_rand() % sides;
    return sum;
}
byte *uw_load_critter_page_cached(int page, int tier)
{
    TEST_ASSERT_EQUAL_INT(0, page); /* Goblin variants share page 0. */
    return tier == 0 ? page_header : NULL;
}
int decode_critter_sprite_page(int page, int tier, short direction, short palette, short frame)
{
    TEST_ASSERT_EQUAL_INT(0, page);
    palette_used = palette;
    return 1;
}
/* Objects live as raw records inside the map arena; this is the single
 * boundary where a record address is viewed as a game object header. */
static uw_object_hdr_t *as_object(void *record)
{ return (uw_object_hdr_t *)record; }

uw_object_hdr_t *alloc_object_slot(int mobile)
{
    if (mobile) return as_object(projectile);
    TEST_ASSERT_LESS_THAN_UINT(16, spawned);
    drops[spawned] = (ushort *)(DAT_002046c4 + (1000 - spawned - 256) * 8);
    return as_object(drops[spawned++]);
}
void *tilemap_lookup(short x, short y)
{
    TEST_ASSERT_EQUAL_INT(36, x);
    TEST_ASSERT_EQUAL_INT(28, y);
    return (byte *)arena + (y * 64 + x) * 4;
}
uw_object_hdr_t *resolve_object_link(uw_link_word_t *link)
{
    unsigned slot = *link >> 6;
    return !slot ? NULL : slot < 256 ? as_object(DAT_002046b8 + slot * 27)
        : as_object(DAT_002046c4 + (slot - 256) * 8);
}
int object_ptr_in_arena(const uw_object_hdr_t *object) { (void)object; return 1; }
void record_placement(ushort *object)
{
    TEST_ASSERT_LESS_THAN_UINT(16, placed);
    types[placed++] = object[0] & 0x1ff;
    TEST_ASSERT_NOT_EQUAL(0x157, object[0] & 0x1ff); /* Shrine */
}
uw_object_hdr_t *settle_dropped_object(void *object, short x, short y,
				       int mode)
{ record_placement(object); return object; }
int drop_object_near_target(void *target, void *object, short distance, uint mode)
{ record_placement(object); return 1; }
int place_object_in_world(uint x, uint y, int z, void *object, short distance, int mode)
{ record_placement(object); return 1; }

void free_object_slot(uw_object_hdr_t *object) {}
int check_object_drop_height(uw_unaligned_word_t *object, ushort *source) { return 1; }
int encode_object_slot_index(const uw_object_hdr_t *object) { (void)object; return 225; }
int play_sound_effect_at_object(int sound, uw_unaligned_word_t *object, int mode) { return 1; }
int spawn_scheduled_effect_object(uw_unaligned_word_t *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y) { (void)source_object; (void)effect_group; (void)delay; (void)animation_offset; (void)heading_adjust; (void)tile_x; (void)tile_y; return 0; }
int roll_object_destroy_chance(short base_chance, void *object) { (void)base_chance; (void)object; return 0; }
void print_scroll_message_by_id(uint message_id) { (void)message_id;}
void set_pending_update_flags(ushort flags) { (void)flags;}
void spawn_effect_debris_burst(void *template, uint tile_x, int tile_y) { (void)template; (void)tile_x; (void)tile_y;}
void scheduler_relink_entry(void *new_object, void *old_object) { (void)new_object; (void)old_object;}
void set_ambient_bias_without_light(char light_level) { (void)light_level;}
int activate_area_hazard_object(uw_unaligned_word_t *hazard, uint tile_x, int tile_y, int damage) { (void)hazard; (void)tile_x; (void)tile_y; (void)damage; return 1; }
ushort *discard_misplaced_object(void *list, uw_unaligned_word_t *object, int release) { return NULL; }

void creatures_fixture_reset(void)
{
    memset(arena, 0, sizeof arena);
    uw_test_load_map((byte *)arena, sizeof arena, 1);
    DAT_002046b8 = (char *)arena + 0x4000;
    DAT_002046c4 = (char *)arena + 0x5b00;
    ushort *tile = (ushort *)((byte *)arena + (28 * 64 + 36) * 4);
    goblin = (uw_unaligned_word_t *)resolve_object_link(tile + 1); /* raw word view for the tests */
    TEST_ASSERT_NOT_NULL(goblin);
    TEST_ASSERT_EQUAL_UINT16(0x4d, goblin[0] & 0x1ff);
    memcpy(original_goblin, goblin, sizeof original_goblin);
    read_data("DATA/OBJECTS.DAT", 2 + 0x80, ((byte *)g_ranged_type_props),
              0x30);
    read_data("DATA/OBJECTS.DAT", 2 + 0x80 + 0x30 + 0x80,
              ((byte *)g_monster_type_props), 0xc00);
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    read_data("CRIT/ASSOC.ANM", 0x100, DAT_0023ce70_backing, 0x80);
    read_data("CRIT/CR00PAGE.N00", 0, page_header, sizeof page_header);
    DAT_00201b68 = 1;
    DAT_0010144c = 36;
    DAT_00101454 = 28;
    rng_state = 1;
    spawned = placed = palette_used = roll_count = roll_index = 0;
}
void creatures_fixture_dispose(void) {}

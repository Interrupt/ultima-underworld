#include "game_fixture.h"
#include "scheduler_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
uw_object_hdr_t *resolve_object_link(uw_link_word_t *link);
void *tilemap_lookup(short x, short y);
void free_object_slot(uw_object_hdr_t *object);
void set_pending_update_flags(ushort flags);
long ce_rand(void);
int encode_object_slot_index(const uw_object_hdr_t *object);
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit);
void adjust_door_close_animation_delay(uw_unaligned_word_t *object);
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias);
int scheduler_advance_effect(short entry_slot, int elapsed);
uw_object_hdr_t *get_object_record_by_slot_index(short slot);
void build_object_placement_snapshot(uw_unaligned_word_t *object, byte *snapshot);
int build_collision_height_field_for_object(uw_unaligned_word_t *object);
int apply_placement_collision_sweep(void *snapshot, void *sweep_flags);
int sync_object_tile_position(uw_unaligned_word_t *object, void *position);
void npc_ai_default_tick(void);
int resolve_unique_npc_special_behavior(void *npc, int event_mode);
void spawn_creature_death_loot(uw_unaligned_word_t *creature);
void drop_creature_inventory_on_death(void *creature);
int compute_vertical_aim_offset(short has_target, int target);
void spawn_npc_thrown_weapon(void *attacker, short launch_offset, short launch_flags);
void dispatch_tile_special_action(uint tile_type, void *actor, void *target);
byte get_current_music_track(void);
void set_pending_music_track(byte track);
uint read_realtime_clock_units(void);
int resolve_npc_melee_attack(void *npc, short tile_x, byte tile_y, short offset_x, short offset_y);
uw_object_hdr_t *spawn_new_object(uint type, int mobile);
void object_list_insert_head(uw_link_word_t *head, uw_object_hdr_t *object);
uw_object_hdr_t *settle_dropped_object(void *object, short x, short y,
				       int mode);
int drop_object_near_target(void *actor, void *object, short mode, uint flags);

uw_animation_type_props_t g_animation_type_props[16];

char *g_scheduler_table;

undefined1 g_scheduler_count;

undefined4 DAT_0023b804;

int DAT_002508fc;

short DAT_0010144c, DAT_00101454;

undefined1 DAT_002048f0_backing[128];

undefined1 DAT_00204950_backing[128];

char queue[64 * 6];

ushort objects[3][16];

char tiles[3][8];

int freed[3];

ushort corpse[4];

int corpses_spawned, corpses_placed, corpse_type;

uw_mobile_object_t *DAT_0010190c;

uw_monster_type_props_t *DAT_00101404;
byte *DAT_00101438;

void *DAT_0010172c;

uw_monster_type_props_t g_monster_type_props[64];
uw_object_type_props_t g_object_type_props[512];

undefined2 DAT_002048c0_backing[64];

undefined1 DAT_002048f0_backing[128], DAT_00204950_backing[128];

undefined1 DAT_00204980_backing[32];

undefined2 DAT_00204990_backing[16], DAT_002049b0_backing[16];

uw_ranged_type_props_t g_ranged_type_props[16];



ushort DAT_000853b8, DAT_00101414, DAT_0010141c, DAT_00101910;

short DAT_00101938, DAT_0010193c, DAT_00202a3c;

byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_00101458;

byte DAT_001018fc, DAT_00101434, DAT_00101730;

char DAT_0010143c, DAT_0010173c;

undefined1 DAT_00101738;

undefined4 DAT_00101924, DAT_0010191c, DAT_001013fc;

undefined4 DAT_00101734_backing[1];

undefined4 DAT_00101560, DAT_00101914, DAT_00101944;

int DAT_00101430;

/* The fixture lays objects out as raw words; these are the single boundary
 * where that storage is viewed as the game's object records. */
uw_mobile_object_t *scheduler_mobile_object(unsigned slot)
{ return (uw_mobile_object_t *)objects[slot]; }

static uw_object_hdr_t *corpse_object(void)
{ return (uw_object_hdr_t *)corpse; }

uw_object_hdr_t *resolve_object_link(uw_link_word_t *link)
{
    unsigned slot = *link >> 6;
    if (slot == 3) return corpse_object();
    return slot < 3 && slot > 0 && !freed[slot] ? &scheduler_mobile_object(slot)->hdr : NULL;
}

void *tilemap_lookup(short x, short y)
{
    TEST_ASSERT_EQUAL_INT(12, x);
    TEST_ASSERT_TRUE_MESSAGE(y == 8 || y == 9, "scheduler used an unexpected tile y");
    return tiles[y - 8 + 1];
}

void free_object_slot(uw_object_hdr_t *object)
{
    int slot = object == &scheduler_mobile_object(1)->hdr ? 1 : 2;
    TEST_ASSERT_EQUAL_PTR(objects[slot], object);
    freed[slot]++;
}

void set_pending_update_flags(ushort flags) { (void)flags; }

long ce_rand(void) { return 15; }

int encode_object_slot_index(const uw_object_hdr_t *object)
{
    if (object == &scheduler_mobile_object(1)->hdr) return 1;
    if (object == &scheduler_mobile_object(2)->hdr) return 2;
    TEST_ASSERT_EQUAL_PTR(corpse, object);
    return 3;
}

int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit) { (void)catalog_type; (void)ignore_slot; (void)position_x; (void)position_y; (void)height; (void)check_mode; (void)step_limit; TEST_FAIL_MESSAGE("Unexpected door sweep"); return 0; }

void adjust_door_close_animation_delay(uw_unaligned_word_t *object) { (void)object; }

int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias) { (void)sound_id; (void)world_x; (void)world_y; (void)volume_bias; return 0; }

int scheduler_advance_effect(short entry_slot, int elapsed) { (void)entry_slot; (void)elapsed; TEST_FAIL_MESSAGE("Unexpected directional effect"); return 0; }

uw_object_hdr_t *get_object_record_by_slot_index(short slot) { TEST_ASSERT_EQUAL_INT(1, slot); return &scheduler_mobile_object(1)->hdr; }

void build_object_placement_snapshot(uw_unaligned_word_t *object, byte *snapshot) { (void)object; (void)snapshot;}

int build_collision_height_field_for_object(uw_unaligned_word_t *object) { (void)object; return 0; }

int apply_placement_collision_sweep(void *snapshot, void *sweep_flags) { (void)snapshot; (void)sweep_flags; return 0; }

int sync_object_tile_position(uw_unaligned_word_t *object, void *position) { (void)object; (void)position; return 0; }

void npc_ai_default_tick(void) { TEST_FAIL_MESSAGE("Unexpected live NPC behavior"); }

int resolve_unique_npc_special_behavior(void *npc, int event_mode) { (void)npc; (void)event_mode; return 1; }

void spawn_creature_death_loot(uw_unaligned_word_t *creature) { (void)creature;}

void drop_creature_inventory_on_death(void *creature) { (void)creature;}

int compute_vertical_aim_offset(short has_target, int target) { (void)has_target; (void)target; TEST_FAIL_MESSAGE("Unexpected NPC missile"); return 0; }

void spawn_npc_thrown_weapon(void *attacker, short launch_offset, short launch_flags) { (void)attacker; (void)launch_offset; (void)launch_flags; TEST_FAIL_MESSAGE("Unexpected NPC missile"); }

void dispatch_tile_special_action(uint tile_type, void *actor, void *target) { (void)tile_type; (void)actor; (void)target; TEST_FAIL_MESSAGE("Unexpected NPC special action"); }

byte get_current_music_track(void) { return 0; }

void set_pending_music_track(byte track) { (void)track;}

uint read_realtime_clock_units(void) { return 0; }

int resolve_npc_melee_attack(void *npc, short tile_x, byte tile_y, short offset_x, short offset_y) { (void)npc; (void)tile_x; (void)tile_y; (void)offset_x; (void)offset_y; TEST_FAIL_MESSAGE("Unexpected NPC attack"); return 0; }

uw_object_hdr_t *spawn_new_object(uint type, int mobile)
{
    TEST_ASSERT_EQUAL_INT(0, mobile);
    corpses_spawned++;
    corpse_type = type;
    corpse[0] = type;
    return corpse_object();
}

void object_list_insert_head(uw_link_word_t *head, uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(tiles[2] + 2, head);
    TEST_ASSERT_EQUAL_PTR(corpse, object);
    TEST_ASSERT_EQUAL_UINT16(0, *head >> 6);
    *head = 3 << 6;
}

uw_object_hdr_t *settle_dropped_object(void *object, short x, short y,
                                       int mode)
{
    TEST_ASSERT_EQUAL_PTR(corpse, object);
    TEST_ASSERT_EQUAL_INT(12, x);
    TEST_ASSERT_EQUAL_INT(9, y);
    TEST_ASSERT_EQUAL_INT(1, mode);
    corpses_placed++;
    return object;
}

int drop_object_near_target(void *actor, void *object, short mode, uint flags) { (void)actor; (void)object; (void)mode; (void)flags; TEST_FAIL_MESSAGE("Unexpected random treasure"); return 0; }

void scheduler_fixture_reset(void)
{
    memset(queue, 0, sizeof queue);
    memset(objects, 0, sizeof objects);
    memset(tiles, 0, sizeof tiles);
    memset(freed, 0, sizeof freed);
    memset(corpse, 0, sizeof corpse);
    corpses_spawned = corpses_placed = corpse_type = 0;
    memset(((byte *)g_animation_type_props), 0, sizeof g_animation_type_props);
    g_scheduler_table = queue;
    g_scheduler_count = 0;
    DAT_0023b804 = 0;
    DAT_002508fc = 0;
    /* Armor/weapon tables precede monster records; effects occupy the tail. */
    uw_test_read_data("DATA/OBJECTS.DAT", ((byte *)g_monster_type_props),
                      0xc00, 2 + 0x80 + 0x30 + 0x80, SEEK_SET);
    uw_test_read_data("DATA/OBJECTS.DAT", ((byte *)g_animation_type_props),
                      64, -64, SEEK_END);
}

void scheduler_fixture_dispose(void) {}

void add_spark(int slot, int y)
{
    objects[slot][0] = 0x1cb;
    *(ushort *)(tiles[y - 8 + 1] + 2) = slot << 6;
    TEST_ASSERT_NOT_EQUAL((uint)-1, scheduler_add_entry(slot, 1, 0, 12, y));
}

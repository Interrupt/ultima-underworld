#include "game_fixture.h"
#include "combat_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
int encode_object_slot_index(const uw_object_hdr_t *object);
void refresh_experience_display(void);
void set_pending_music_track(byte track);
uint read_realtime_clock_units(void);
void attempt_talk_interaction(void *object);
void cancel_weapon_swing(void);
void trigger_quest_milestone_cleanup_event(void);
void other_panel_tick(int index);
void flush_sprite_list_compositor(void);
int sprite_list_set_frame_id(short slot, int frame);
int resolve_weapon_hit_skill_check(short attacker, int target);
int roll_dice_sum(int count, short sides);
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias);
int play_positional_sound_effect(uint sound, short x, short y, uint volume);
void set_movement_animation_timer(byte timer_id, byte ticks);
int play_weapon_impact_sound(short result);
long ce_rand(void);
void project_position_by_heading(int heading, short distance, void *x, void *y);
void collision_height_envelope(int mode, int collision);
void collision_build_height_field(uint step_limit);
void sort_collision_candidates(void);
uw_object_hdr_t *get_object_record_by_slot_index(short slot);
int object_ptr_in_arena(const uw_object_hdr_t *object);
uw_object_hdr_t *spawn_new_object(uint type, int mobile);
uint scheduler_add_entry(uint slot, int delay, byte frame, byte x, byte y);
void * tilemap_lookup(short x, short y);
void object_list_append_tail(uw_link_word_t *head, uw_object_hdr_t *object);
void free_object_slot(uw_object_hdr_t *object);
int read_file_handle(int handle, void *destination, uint count);

byte mobile_objects[256 * 27];
uw_ranged_type_props_t g_ranged_type_props[16];
uw_melee_type_props_t g_melee_type_props[16];
uw_armor_type_props_t g_armor_type_props[32];
uw_container_type_props_t g_container_type_props[16];
uw_light_type_props_t g_light_type_props[16];
uw_animation_type_props_t g_animation_type_props[16];
undefined1 DAT_00202a28_backing[256];
byte DAT_002046d8, DAT_002046dc;
int DAT_002046e8;
undefined1 DAT_002046e0, DAT_002046e4;


char *DAT_002046b8 = (char *)mobile_objects;

byte *DAT_00202c6c;

uw_object_type_props_t g_object_type_props[512];

undefined1 DAT_00202c38_backing[1536];

short DAT_001005f4, DAT_001005f8, DAT_0023beb4;

char DAT_001005dc;

short DAT_00100610;
ushort DAT_00100620, DAT_00100604;

undefined2 DAT_00100600, DAT_00100624;

int candidate_count, lookup_count;

ushort lookup_slots[32];

int wall_collision;

int wall_in_front;

ushort wall_effect[4];

byte wall_tile[4];

byte DAT_00100628, DAT_001005fc;

short DAT_0010061c, DAT_00100608;
undefined1 DAT_0010060c_backing[8];

undefined4 DAT_001005d8;

char DAT_00084f18_backing[5] = {5, 3, 1, 7, 0};

uw_monster_type_props_t g_monster_type_props[64];

static uw_monster_type_props_t empty_monster_template;

byte player_stats[256];

char *DAT_00086df8 = (char *)player_stats;

char *DAT_0023b82c;

int skill_result, skill_checks, effects, impact_sounds;

int effect_types[2], effect_heights[2];

int talks, death_sounds, positional_impacts;
int level_stat_recalculations;
char level_message[16];
short DAT_00201b68;
bool uw_test_creating_character;
static char character_attributes[256];

const void *expected_effect_target; /* identity only */

uw_mobile_object_t *g_player_object;

char *DAT_0023be74;
uw_monster_type_props_t *DAT_00101404;


char DAT_000853d0, DAT_0010194c;

byte DAT_0010192c, DAT_00101930;

undefined1 DAT_00101934;

int DAT_00101940;

undefined4 DAT_00101944;

ushort DAT_00101910, DAT_0010141c;

uint music_track;

/* The fixture lays objects out as raw words/bytes; these are the single
 * boundary where that storage is viewed as the game's object records. */
static uw_object_hdr_t *wall_effect_object(void)
{ return (uw_object_hdr_t *)wall_effect; }

static uw_mobile_object_t *mobile_object(unsigned slot)
{ return (uw_mobile_object_t *)(mobile_objects + slot * 27); }

int encode_object_slot_index(const uw_object_hdr_t *object)
{
    if (object == wall_effect_object()) return 0x100;
    for (int slot = 1; slot < 256; slot++)
        if (object == &mobile_object(slot)->hdr) return slot;
    TEST_FAIL_MESSAGE("Expected an actual mobile object pointer");
    return 0;
}

void refresh_experience_display(void) {}

void set_pending_music_track(byte track) { music_track = track; }

uint clock_units;

uint read_realtime_clock_units(void) { return clock_units; }

uint combat_player_experience(void)
{
    uint xp;
    memcpy(&xp, player_stats + 0x4e, sizeof xp);
    return xp;
}
void combat_set_player_experience(uint xp, byte level)
{
    memcpy(player_stats + 0x4e, &xp, sizeof xp);
    player_stats[0x3d] = level;
}
void combat_create_character(void)
{
    uw_test_create_character((char *)player_stats, character_attributes, object_at(1));
}
int recalculate_player_stats(int refill_mana) { level_stat_recalculations++; return 0; }
void refresh_stats_panel_if_active(void) {}
void print_scroll_message_by_id(uint id) { TEST_ASSERT_EQUAL_HEX16(0x93,id); }
int message_scroll_print_wrapped(char *text)
{
    snprintf(level_message,sizeof level_message,"%s",text);
    return 0;
}
void configure_texture_detail_functions(void) {}
void refresh_player_equipment_effects(void) {}

void attempt_talk_interaction(void *object)
{ TEST_ASSERT_EQUAL_PTR(mobile_objects + 2 * 27, object); talks++; }

void cancel_weapon_swing(void) {}

void trigger_quest_milestone_cleanup_event(void) { TEST_FAIL_MESSAGE("Unexpected quest cleanup"); }

undefined1 DAT_0023c118_arr[9], DAT_0023c128_arr[9];

unsigned char DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];

ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;

byte DAT_0023c150, DAT_0023c12a, DAT_0023c25c;

int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;

undefined1 DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];

undefined1 DAT_0023c1f0_backing[64], DAT_0023c1f8_backing[64];

undefined1 DAT_0023c11a;

undefined1 g_active_hud_panel;

undefined1 DAT_0023c11b;

char DAT_000870d8, DAT_000870dc;

short DAT_0023c21c;

undefined2 DAT_0023c220;

undefined1 DAT_0023c1f0_backing[64], DAT_0023c1f8_backing[64];

int hud_flushes, wipe_frames;

uint frames[32];

void other_panel_tick(int index)
{ DAT_0023c1d8 &= ~(1 << index); }

void (*const g_hud_panel_handlers_table[13])(void) = {
    0, 0, 0, 0,
    (void (*)(void))other_panel_tick, (void (*)(void))other_panel_tick,
    (void (*)(void))other_panel_tick, (void (*)(void))other_panel_tick,
    (void (*)(void))other_panel_tick, (void (*)(void))other_panel_tick,
    (void (*)(void))other_panel_tick, hud_panel_wipe_transition_tick,
    (void (*)(void))other_panel_tick
};

void flush_sprite_list_compositor(void) { hud_flushes++; }

int sprite_list_set_frame_id(short slot, int frame)
{
    TEST_ASSERT_EQUAL_INT(7, slot);
    TEST_ASSERT_LESS_THAN_INT(32, wipe_frames);
    frames[wipe_frames++] = frame;
    return 0;
}

#ifndef UW_TEST_NPC_COMBAT
int resolve_weapon_hit_skill_check(short attacker, int target)
{
    TEST_ASSERT_EQUAL_UINT16(DAT_00100610, attacker);
    TEST_ASSERT_EQUAL_UINT16(DAT_00100620, target);
    skill_checks++;
    return skill_result;
}

int roll_dice_sum(int count, short sides) { return count * sides; }
int roll_skill_check(int skill, int difficulty)
{ TEST_FAIL_MESSAGE("Magic Arrow does not use the ranged weapon skill check"); return 0; }
#endif

int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias) { (void)sound_id; (void)pan; (void)volume_bias; return 0; }

int play_positional_sound_effect(uint sound, short x, short y, uint volume)
{ (void)x; (void)y; (void)volume; if (sound == 6) death_sounds++; if (sound == 4) positional_impacts++; return 0; }

#ifdef UW_TEST_NPC_COMBAT
void set_movement_animation_timer(byte mode, byte duration)
{ TEST_ASSERT_EQUAL_INT(0x20, mode); TEST_ASSERT_TRUE(duration >= 0 && duration <= 15); }
void weapon_overlay_flash_once(int colour) { TEST_ASSERT_EQUAL_HEX16(0xb8, colour); }
int damage_equipped_item_in_slot(int slot, byte damage, byte type, short critical, int mode)
{ (void)slot; (void)damage; TEST_ASSERT_EQUAL_INT(4, type); (void)critical; TEST_ASSERT_EQUAL_INT(1, mode); return 0; }
#else
void set_movement_animation_timer(byte timer_id, byte ticks) { TEST_FAIL_MESSAGE("Unexpected player hit animation"); }
#endif

int spawn_scheduled_effect_object(ushort *target, int type, int mode, byte intensity, short height, short x, short y)
{
    TEST_ASSERT_EQUAL_PTR(expected_effect_target, target);
    TEST_ASSERT_LESS_THAN_INT(2, effects);
    effect_types[effects] = type;
    effect_heights[effects] = height;
    (void)mode; (void)intensity; (void)x; (void)y;
    effects++;
    return 0;
}

int play_weapon_impact_sound(short result)
{
    impact_sounds++;
#ifdef UW_TEST_NPC_COMBAT
    (void)result;
    return 0; /* Original sound service returns zero on a missed/blocked swing. */
#else
    return result;
#endif
}

int door_triggers, door_scheduled, discarded_links;
undefined2 DAT_002020a0, DAT_002020a4;
char *DAT_002046c4;
void trigger_object_trap_or_use_action(void *actor, void *target, int action, int x, short y)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor);
    TEST_ASSERT_EQUAL_PTR(wall_effect, target);
    TEST_ASSERT_EQUAL_INT(door_triggers == 0 ? 4 : 7, action);
    TEST_ASSERT_EQUAL_INT(10, x);
    TEST_ASSERT_EQUAL_INT(10, y);
    door_triggers++;
}
int play_sound_effect_at_object(int sound, ushort *object, int mode)
{
    TEST_ASSERT_EQUAL_INT(4, sound);
    TEST_ASSERT_EQUAL_PTR(wall_effect, object);
    TEST_ASSERT_EQUAL_INT(0, mode);
    impact_sounds++;
    return 0;
}

/* Other destruction branches must not run for a door. */
void try_combine_or_stow_object(void *actor, ushort *object, int stow) { (void)actor; (void)object; (void)stow; TEST_FAIL_MESSAGE("Unexpected container combination"); }
#ifndef UW_TEST_NPC_COMBAT
uint rand_below(int limit) { (void)limit; TEST_FAIL_MESSAGE("Unexpected random destruction"); return 0; }
#endif
void try_empty_container(uw_object_hdr_t *container, int owned_by_player) { (void)container; (void)owned_by_player; TEST_FAIL_MESSAGE("Unexpected container emptying"); }
int roll_object_destroy_chance(short base_chance, void *object) { (void)base_chance; (void)object; TEST_FAIL_MESSAGE("Unexpected destroy chance"); return 0; }
int reset_burnt_out_item_state(char *tile_link, void *object) { (void)tile_link; (void)object; TEST_FAIL_MESSAGE("Unexpected burnt item"); return 0; }
void free_linked_object_recursive(uw_link_word_t *link_field) { (void)link_field; TEST_FAIL_MESSAGE("Unexpected recursive cleanup"); }
uw_object_hdr_t *settle_dropped_object(void *object, short tile_x,
				       short tile_y, int force) { (void)object; (void)tile_x; (void)tile_y; (void)force; TEST_FAIL_MESSAGE("Unexpected settling"); return 0; }
void adjust_door_close_animation_delay(ushort *door) { (void)door; TEST_FAIL_MESSAGE("Unexpected closing door"); }
uw_object_hdr_t *find_object_in_chain(uw_link_word_t **head, int recurse,
                                      int category, int family, short subtype)
{
    TEST_ASSERT_EQUAL_PTR(wall_effect+3, *head);
    TEST_ASSERT_EQUAL_INT(1, recurse);
    TEST_ASSERT_EQUAL_INT(4, category);
    TEST_ASSERT_EQUAL_INT(0, family);
    TEST_ASSERT_EQUAL_INT(15, subtype);
    return (**head & 0xffc0) ? &mobile_object(4)->hdr : NULL;
}
void object_list_unlink(uw_link_word_t *head, uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(wall_effect+3, head);
    TEST_ASSERT_EQUAL_PTR(object_at(4), object);
    *head &= 0x3f;
}

long combat_random_roll = 1;
long ce_rand(void) { return combat_random_roll; }

void project_position_by_heading(int heading, short distance, void *x, void *y)
{ (void)heading; (void)distance; (void)x; (void)y; }

void collision_height_envelope(int mode, int collision)
{
    TEST_ASSERT_EQUAL_INT(0, mode);
    TEST_ASSERT_EQUAL_INT(1, collision);
    DAT_00202c6c[0x14] = candidate_count;
}

void collision_build_height_field(uint step_limit)
{
    TEST_ASSERT_EQUAL_INT(0, step_limit);
    if (wall_in_front) {
        ushort flags = 0x100;
        memcpy(DAT_00202c6c + 0xc, &flags, sizeof flags);
    }
}

void sort_collision_candidates(void)
{
    DAT_00202c6c[0x15] = candidate_count;
    DAT_00202c6c[0x16] = 0;
}

uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    if (slot == 0x100) return wall_effect_object();
    TEST_ASSERT_GREATER_THAN_INT(0, slot);
    TEST_ASSERT_LESS_THAN_INT(256, slot);
    TEST_ASSERT_LESS_THAN_INT(32, lookup_count);
    lookup_slots[lookup_count++] = slot;
    return &mobile_object(slot)->hdr;
}

int object_ptr_in_arena(const uw_object_hdr_t *object)
{ TEST_ASSERT_NOT_NULL(object); return object != wall_effect_object(); }

uw_object_hdr_t *spawn_new_object(uint type, int mobile)
{
    TEST_ASSERT_EQUAL_HEX16(0x1cb, type);
    TEST_ASSERT_EQUAL_INT(0, mobile);
    wall_effect[0] = type;
    return wall_effect_object();
}

uint scheduler_add_entry(uint slot, int delay, byte frame, byte x, byte y)
{
    TEST_ASSERT_EQUAL_UINT(0x100, slot);
    if ((wall_effect[0] & 0x1ff) == 0x1cf) {
        TEST_ASSERT_EQUAL_INT(5, delay);
        door_scheduled++;
    } else TEST_ASSERT_EQUAL_INT(2, delay);
    TEST_ASSERT_EQUAL_INT(0, frame);
    TEST_ASSERT_EQUAL_INT(10, x);
    TEST_ASSERT_EQUAL_INT(10, y);
    return 1;
}

void * tilemap_lookup(short x, short y)
{
    TEST_ASSERT_EQUAL_INT(10, x);
    TEST_ASSERT_EQUAL_INT(10, y);
    return wall_tile;
}

void object_list_append_tail(uw_link_word_t *head, uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(wall_tile + 2, head);
    TEST_ASSERT_EQUAL_PTR(wall_effect, object);
    wall_collision++;
}

void free_object_slot(uw_object_hdr_t *object)
{ TEST_ASSERT_EQUAL_PTR(object_at(4), object); discarded_links++; }

FILE *monster_data;

int read_file_handle(int handle, void *destination, uint count)
{
    TEST_ASSERT_EQUAL_INT(1, handle);
    TEST_ASSERT_NOT_NULL(monster_data);
    size_t bytes = fread(destination, 1, count, monster_data);
    TEST_ASSERT_EQUAL_UINT(count, bytes);
    return bytes;
}

void load_real_monster_data(void)
{
    monster_data = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_NOT_NULL(monster_data);
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 2 + 0x80 + 0x30 + 0x80, SEEK_SET));
    load_monster_combat_stats(1);
    fclose(monster_data);
    monster_data = NULL;
}

ushort *object_at(unsigned slot)
{ return (ushort *)mobile_object(slot); }

void candidate(unsigned index, unsigned slot, short displacement)
{
    byte *record = DAT_00202c38_backing + index * 6;
    record[0] = 0;
    record[1] = 100;
    ushort link = slot << 6;
    memcpy(record + 2, &link, 2);
    memcpy(record + 4, &displacement, 2);
    candidate_count = index + 1;
}

void combat_fixture_reset(void)
{
    memset(DAT_0010060c_backing, 0, sizeof DAT_0010060c_backing);
    DAT_00100608 = 0;
    combat_random_roll = 1;
    memset(mobile_objects, 0, sizeof(mobile_objects));
    memset(((byte *)g_ranged_type_props), 0, sizeof g_ranged_type_props);
    DAT_002046d8=DAT_002046dc=DAT_002046e0=DAT_002046e4=0;
    DAT_002046e8=0;
    door_triggers=door_scheduled=discarded_links=0;
    DAT_002020a0=DAT_002020a4=0;
    DAT_002046c4=(char *)wall_effect;
    memset(((byte *)g_object_type_props), 0, sizeof(g_object_type_props));
    memset(DAT_00202c38_backing, 0, sizeof(DAT_00202c38_backing));
    DAT_00100610 = 1;
    DAT_00100620 = 0;
    DAT_00100624 = 0xffff;
    DAT_00100600 = DAT_00100604 = 0;
    DAT_001005f4 = DAT_001005f8 = DAT_0023beb4 = 0;
    DAT_001005dc = DAT_00084f1c = 0;
    candidate_count = lookup_count = wall_collision = wall_in_front = 0;
    memset(wall_effect, 0, sizeof wall_effect);
    memset(wall_tile, 0, sizeof wall_tile);
    DAT_00100628 = DAT_001005fc = DAT_001005d8 = 0;
    DAT_0010061c = 6;
    skill_result = skill_checks = effects = impact_sounds = 0;
    talks = death_sounds = positional_impacts = 0;
    memset(player_stats,0,sizeof player_stats);
    player_stats[0x3d] = 1;
    DAT_00201b68 = 1;
    level_stat_recalculations = 0;
    level_message[0] = 0;
    music_track = 0;
    clock_units = 0;
    hud_flushes = wipe_frames = 0;
    memset(DAT_0023c118_arr, 0, sizeof(DAT_0023c118_arr));
    memset(DAT_0023c128_arr, 0, sizeof(DAT_0023c128_arr));
    memset(DAT_0023c11c_arr, 0, sizeof(DAT_0023c11c_arr));
    memset(DAT_0023c12c_arr, 0, sizeof(DAT_0023c12c_arr));
    memset(DAT_0023c1f0_backing, 0, sizeof(DAT_0023c1f0_backing));
    memset(DAT_0023c1f8_backing, 0, sizeof(DAT_0023c1f8_backing));
    DAT_0023c1d8 = DAT_0023c1dc = DAT_0023c1e0 = 0;
    DAT_0023c150 = DAT_0023c220 = DAT_0023c25c = 0;
    DAT_0023c21c = 7;
    g_player_object = (uw_mobile_object_t *)object_at(1);
    DAT_0023be74 = (char *)object_at(1);
    DAT_00101404 = &empty_monster_template;
    memset(((byte *)g_monster_type_props), 0,
           sizeof g_monster_type_props);
    memset(&empty_monster_template, 0, sizeof empty_monster_template);
    expected_effect_target = object_at(2);
    DAT_0023b82c = (char *)mobile_objects;
    object_at(1)[0] = 0x40;
    object_at(1)[1] = 40;
    object_at(1)[0xb] = (10 << 10) | (10 << 4);
    object_at(2)[0] = 0x45; /* critter */
    object_at(3)[0] = 0x46; /* another critter */
    object_at(1)[4] = object_at(2)[4] = object_at(3)[4] = 100;
}

void combat_fixture_dispose(void) {}

ushort wall_spark_height(short pitch)
{
    DAT_0023beb4 = pitch;
    wall_in_front = 1;
    TEST_ASSERT_EQUAL_UINT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(1, wall_collision);
    TEST_ASSERT_EQUAL_HEX16(0x1cb, wall_effect[0]);
    return wall_effect[1] & 0x7f;
}

int g_debug_godmode;

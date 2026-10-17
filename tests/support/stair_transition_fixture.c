#include "unity.h"
#include "src/headers/uw.h"

ushort player[16], resurrection_object[4];
byte level_map[64 * 64 * 4], character[256];
uw_mobile_object_t *g_player_object = (uw_mobile_object_t *)player;
char *DAT_002029cc = (char *)level_map;
char *DAT_00086df8 = (char *)character;
undefined1 DAT_000878d0_backing[256];
uw_object_type_props_t g_object_type_props[512];
short DAT_00201b68, DAT_00201c7c, g_visibility_max_ring_passes;
undefined2 DAT_00201c90, DAT_00201c8c, g_cursor_holding_state;
char *g_selected_object;
byte DAT_00085730;
code *DAT_00201c9c;
byte DAT_001013a4;
uint DAT_002020e4;
byte DAT_002020e8;
char s_At__d__d_00087360[] = "At %d %d";
int loads, positions, deaths, first_x, first_y, probes, hud_hp;
int open_x, open_y;
uint clock_units;
int scan_calls;

void cancel_weapon_swing(void) {}
void pop_cursor_icon(ushort state) {}
void save_or_restore_level_special_state(short level, short save) {}
int commit_level_to_save_slot(int level) { return 1; }
int load_level(int level)
{
    TEST_ASSERT_EQUAL_INT(2, level);
    loads++;
    return 1;
}
void set_player_tile_position(uint x, uint y, int flag)
{
    TEST_ASSERT_EQUAL_INT(open_x, x);
    TEST_ASSERT_EQUAL_INT(open_y, y);
    positions++;
}
void set_pending_update_flags(ushort flags) {}
void report_fatal_error_and_exit(ushort error_code) { (void)error_code; TEST_FAIL_MESSAGE("Stair transition failed"); }
void full_dungeon_redraw(void) {}
void weapon_overlay_flash_hold(int passes) {}
void weapon_overlay_flash_restore(int passes) {}
void *ce_memset(void *buffer, int value, unsigned size)
{ return memset(buffer, value, size); }
void *tilemap_lookup(short x, short y)
{
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, x);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, y);
    TEST_ASSERT_LESS_THAN_INT(64, x);
    TEST_ASSERT_LESS_THAN_INT(64, y);
    if (probes++ == 0) { first_x = x; first_y = y; }
    return level_map + (x + y * 64) * 4;
}
int encode_object_slot_index(const uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(player, object);
    return 1;
}
int check_object_placement_clearance(short type, short slot, short x, short y, short z, int flag, byte radius)
{
    TEST_ASSERT_EQUAL_INT(0x7f, type);
    TEST_ASSERT_EQUAL_INT(1, slot);
    return x == open_x * 8 + 3 && y == open_y * 8 + 3;
}
uw_object_hdr_t *resolve_object_link(ushort *link) { return NULL; }
int object_is_mobile(const uw_object_hdr_t *object) { return 0; }
ushort *discard_misplaced_object(void *head, ushort *object, int flag) { return NULL; }
void tick_weapon_swing_state(short flag) {}
void set_hud_status_value(byte slot, ushort value) { if (slot == 0) hud_hp = value; }
void handle_starvation_penalty(void) { deaths++; }
uint read_realtime_clock_units(void) { return clock_units; }
void update_ingame_music_track(void) {}
void update_player_tick_effects(void) {}
long ce_rand(void) { return 1; }
void apply_level9_random_hazard_tick(void) {}
void debug_print(char *format, ...) {}
uw_object_hdr_t *find_object_in_chain(ushort **link, int recursive, int group,
                                      int subclass, short type)
{
    TEST_ASSERT_EQUAL_INT(7, group);
    TEST_ASSERT_EQUAL_INT(0, subclass);
    TEST_ASSERT_EQUAL_INT(10, type);
    scan_calls++;
    return resurrection_object;
}

void stair_transition_fixture_reset(void)
{
    memset(player, 0, sizeof player);
    memset(character, 0, sizeof character);
    memset(level_map, 0, sizeof level_map);
    memset(DAT_000878d0_backing, 0, sizeof DAT_000878d0_backing);
    memset(((byte *)g_object_type_props), 0, sizeof g_object_type_props);
    player[0] = 0x7f;
    ((byte *)player)[8] = 30;
    character[0x39] = 200; /* Hunger lives in the character record, not HP. */
    character[0x3d] = 3;
    character[0x4e] = 42;
    DAT_00201b68 = DAT_00201c7c = 1;
    DAT_00201c90 = DAT_00201c8c = 0;
    DAT_00201c9c = NULL;
    g_selected_object = NULL;
    g_cursor_holding_state = 0;
    DAT_00085730 = 3;
    g_visibility_max_ring_passes = 4;
    DAT_001013a4 = DAT_002020e4 = DAT_002020e8 = 0;
    clock_units = 0;
    loads = positions = deaths = probes = scan_calls = 0;
    first_x = first_y = hud_hp = -1;
    open_x = 10;
    open_y = 20;
}
void stair_transition_fixture_dispose(void) {}

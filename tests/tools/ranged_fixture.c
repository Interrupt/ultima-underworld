#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][48], player[40];
uw_mobile_object_t *g_player_object = (uw_mobile_object_t *)(player + 4);
uw_ranged_type_props_t g_ranged_type_props[16];
uw_object_type_props_t g_object_type_props[512];
ushort *DAT_00202a44;
short DAT_00202a38;
ushort DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54;
static unsigned seed, mode, mutation, aims, spawns, extracts, frees, messages, sounds;
static short weapon;
static uint64_t events;
static uw_object_hdr_t *ammo(void) { return (uw_object_hdr_t *)(records[0] + 4); }
static uw_projectile_object_t *projectile(void) { return (uw_projectile_object_t *)(records[1] + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof records; ++i) events = events * 31 + ((byte *)records)[i];
    for (unsigned i = 0; i < sizeof player; ++i) events = events * 31 + player[i];
    events = events * 31 + DAT_00202a38; events = events * 31 + DAT_00202a48;
    events = events * 31 + DAT_00202a4c; events = events * 31 + DAT_00202a50;
    events = events * 31 + DAT_00202a54;
    events = events * 31 + (DAT_00202a44 == (ushort *)g_player_object);
}
int find_and_consume_ammo(short type)
{
    assert(type == weapon); observe(1);
    if (mutation) g_player_object->hdr.position_word ^= 0xaaaa;
    return mode == 0 ? -1 : mode == 3 ? 0x8000 : mode == 4 ? 0x10000 : 42;
}
bool compute_drop_aim_from_cursor(void)
{
    observe(2); ++aims;
    if (mutation) ammo()->link_word ^= 0xa5a5;
    return mode != 2; /* Caller still launches after a false aim result. */
}
uw_object_hdr_t *spawn_object_near_player(void)
{
    observe(3); ++spawns;
    if (mutation) { projectile()->hdr.type_flags ^= 0x5555; ammo()->type_flags ^= 0xaaaa; }
    return mode == 1 ? NULL : &projectile()->hdr;
}
ushort *extract_ammo_and_refresh(int category, int subcategory, int selector, short slot)
{
    assert(category == 0 && subcategory == 1 && selector == g_ranged_type_props[weapon].ammo_damage_selector);
    assert(slot == (mode == 4 ? 0 : 42)); observe(4); ++extracts;
    if (mutation) { ammo()->type_flags ^= 0x5555; projectile()->hdr.link_word ^= 0xaaaa; }
    return (ushort *)ammo();
}
void free_object_slot(uw_object_hdr_t *object) { assert(object == ammo()); observe(5); ++frees; }
void print_scroll_message_by_id(uint id) { assert(id == 0xfe); observe(6); ++messages; }
int play_sound_effect_with_pan(uint id, byte pan, uint volume)
{ assert(id == 9 && pan == 64 && volume == 0); observe(7); ++sounds; return 0; }
#include "ranged_functions.c"

struct result { byte records[96], player[40]; ushort globals[6]; unsigned counts[6]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(player, 0x5a, sizeof player);
    ammo()->type_flags = seed; ammo()->position_word = seed * 37;
    ammo()->chain_word = seed ^ 0xaaaa; ammo()->link_word = seed * 17;
    projectile()->hdr.type_flags = seed ^ 0xffff; projectile()->hdr.link_word = seed ^ 0x5555;
    g_player_object->hdr.position_word = seed ^ 0x3333;
    g_player_object->tile_word = seed;
    for (unsigned i = 0; i < 16; ++i) {
        g_ranged_type_props[i].ammo_damage_selector = (seed + i) & 15;
        g_ranged_type_props[i].projectile_speed = seed ^ i;
    }
    DAT_00202a38 = 77; DAT_00202a48 = 78; DAT_00202a4c = 79;
    DAT_00202a50 = 80; DAT_00202a54 = 81; DAT_00202a44 = NULL;
    aims = spawns = extracts = frees = messages = sounds = 0; events = 0;
    if (reference) reference_fire_ranged_weapon(weapon); else fire_ranged_weapon(weapon);
    struct result result = {0};
    memcpy(result.records, records, sizeof records); memcpy(result.player, player, sizeof player);
    ushort globals[] = {DAT_00202a38, DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54, DAT_00202a44 == (ushort *)g_player_object};
    memcpy(result.globals, globals, sizeof globals);
    unsigned counts[] = {aims, spawns, extracts, frees, messages, sounds};
    memcpy(result.counts, counts, sizeof counts); result.events = events; return result;
}
int main(void)
{
    const short weapons[] = {0, 9, 10, 15}; unsigned cases = 0;
    for (unsigned i = 0; i < 512; ++i) g_object_type_props[i].class_flags = i & 3;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 5; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (unsigned i = 0; i < 4; ++i) {
                    weapon = weapons[i]; struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof records) == 0);
                    assert(memcmp(before.player, after.player, sizeof player) == 0);
                    assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(before.events == after.events); ++cases;
                }
    printf("%u ranged-launch cases preserve projectile/header/guard bytes and callbacks\n", cases);
    return 0;
}

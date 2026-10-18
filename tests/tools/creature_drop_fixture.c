#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][32];
static uw_monster_type_props_t properties[2];
char *g_despawn_creature_record;
short DAT_00201b68;
uw_ranged_type_props_t g_ranged_type_props[16];
static unsigned seed, mode, mutation, which, spawns, randoms, divisions, inserts;
static unsigned saved_next[3], saved_owner[3];
static uint64_t events;
static uw_object_hdr_t *object(unsigned i) { return (uw_object_hdr_t *)(records[i] + 8); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void save_fields(void)
{
    for (unsigned i = 0; i < 3; ++i) { saved_next[i] = object(i)->next; saved_owner[i] = object(i)->owner; }
}
static void observe(unsigned kind)
{
    argument(kind); argument(DAT_00201b68); argument(g_despawn_creature_record == (char *)&properties[1]);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof properties; ++i) argument(((byte *)properties)[i]);
}
static void change(unsigned kind)
{
    if (mutation) {
        for (unsigned i = 0; i < 3; ++i) {
            object(i)->type_flags ^= mode == 6 ? 0x100 : 0x5555;
            object(i)->position_word ^= 0xaaaa;
            object(i)->chain_word ^= 0xa5a5; object(i)->link_word ^= 0x5555;
        }
        if (kind == 2 || kind == 4) g_despawn_creature_record = (char *)&properties[1];
        properties[1].weapon_loot[1] ^= 1;
        properties[1].item_loot[1] ^= 0xf;
        properties[0].food_loot ^= 0xff; properties[1].food_loot ^= 0xff;
        DAT_00201b68 ^= 0x5555;
    }
    save_fields();
}
uw_object_hdr_t *spawn_new_object(uint id, int region)
{
    assert(region == 0 && spawns < 2); observe(1); argument(id);
    uw_object_hdr_t *p = object(mode == 7 ? 0 : spawns + 1); ++spawns;
    p->object_id = mode == 6 ? 0x10 : id & 511;
    change(1); return p;
}
long ce_rand(void)
{
    observe(2); ++randoms; change(2);
    switch (mode) {
    case 0: return 15;
    case 3: return 1;
    case 4: return 0;
    case 5: return -1;
    case 6: return randoms % 3 == 1 ? 1 : 0;
    case 7: return -7;
    default: return (short)(seed * 37 + randoms * 13);
    }
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    observe(3); argument(divisor); argument(dividend); ++divisions; change(3);
    return divisor ? (divmod_result){dividend/divisor, dividend%divisor} : (divmod_result){0,0};
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{
    assert(link == &object(0)->link_word); assert(p == object(0) || p == object(1) || p == object(2));
    unsigned index = p == object(0) ? 0 : p == object(1) ? 1 : 2;
    if (which != 2) assert(p->next == saved_next[index]);
    if (which == 0) assert(p->owner == saved_owner[index]);
    if (!mutation && which != 2 && mode == 3) assert(p->quality == 1);
    if (!mutation && which != 2 && mode == 4) assert(p->quality == 4);
    if (!mutation && which != 2 && mode == 5) assert(p->quality == 63);
    if (!mutation && which != 2 && mode == 7) assert(p->quality == 57);
    if (!mutation && which == 0 && (p->object_id & 0x30) == 0x10 &&
        g_ranged_type_props[p->object_id & 15].ammo_damage_selector == 0xc0) {
        if (mode == 5) assert(p->link == 3);
        if (mode == 7) assert(p->link == 1021);
    }
    observe(4); ++inserts;
    p->next = *link >> 6; *link = (*link & 63) | (257 << 6);
    change(4);
}
#include "creature_drop_functions.c"

struct result { byte records[96], properties[96]; unsigned counts[4]; short level; unsigned redirected; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(properties, 0, sizeof properties);
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->type_flags = seed + i * 19; object(i)->position_word = seed * 37 + i * 17;
        object(i)->chain_word = seed * 53 + i * 19; object(i)->link_word = seed * 11 + i * 37;
    }
    for (unsigned i = 0; i < 2; ++i) {
        properties[i].weapon_loot[0] = seed;
        properties[i].weapon_loot[1] = seed >> 8;
        properties[i].item_loot[0] = seed;
        properties[i].item_loot[1] = seed * 37;
        properties[i].food_loot = seed;
        if (mode >= 3) {
            properties[i].weapon_loot[0] |= 1; properties[i].weapon_loot[1] |= 1;
            properties[i].item_loot[0] |= 15; properties[i].item_loot[1] |= 15;
        }
    }
    for (unsigned i = 0; i < 16; ++i) g_ranged_type_props[i].ammo_damage_selector = mode == 6 ? 0xc0 : seed;
    g_despawn_creature_record = (char *)&properties[0]; DAT_00201b68 = mode == 4 ? 1 : (short)seed;
    spawns = randoms = divisions = inserts = 0; events = 0; save_fields();
    if (which == 0) {
        if (reference) reference_spawn_creature_equipment_drop(object(0)); else spawn_creature_equipment_drop(object(0));
    } else if (which == 1) {
        if (reference) reference_spawn_creature_misc_item_drop(object(0)); else spawn_creature_misc_item_drop(object(0));
    } else {
        if (reference) reference_spawn_creature_special_item_drop(object(0)); else spawn_creature_special_item_drop(object(0));
    }
    assert(inserts == spawns);
    if (mode == 0 && which != 0) assert(spawns == 0);
    if (!mutation && mode >= 3 && which != 2) assert(spawns == 2);
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.properties, properties, sizeof properties);
    unsigned counts[] = {spawns, randoms, divisions, inserts}; memcpy(result.counts, counts, sizeof counts);
    result.level = DAT_00201b68; result.redirected = g_despawn_creature_record == (char *)&properties[1];
    result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 8; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (which = 0; which < 3; ++which) {
                    struct result before = run(1), after = run(0);
                    if (memcmp(&before, &after, sizeof before)) {
                        fprintf(stderr, "drop mismatch seed=%u mode=%u mutation=%u function=%u\n", seed, mode, mutation, which); return 1;
                    }
                    ++cases;
                }
    printf("%u creature-drop cases preserve quality, quantities, links, captures and callbacks\n", cases);
}

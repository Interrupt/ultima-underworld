#include "src/headers/uw.h"
#include <assert.h>
#include <limits.h>

static _Alignas(8) byte records[3][40];
uw_monster_type_props_t g_monster_type_props[64];
uw_object_type_props_t g_object_type_props[512];
#define DAT_001007d0 g_monster_type_props[0].armor[0]
#define DAT_002034b5 ((byte *)g_object_type_props)[0x825]
char *g_despawn_creature_record;
short DAT_00201b68;
static unsigned seed, mode, mutation, which, counts[6], owner_at_spawn, next_at_spawn;
static int last_divisor;
static uw_object_hdr_t *spawned;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static unsigned row(void) { return (g_despawn_creature_record - (char *)g_monster_type_props) / 48; }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); argument(row()); argument(DAT_00201b68);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < 48; ++i) argument((byte)g_despawn_creature_record[i]);
    argument(g_object_type_props[160].monetary_value);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->hdr.type_flags ^= 0x5555; object(i)->status_word ^= 0xa5a5;
        object(i)->hdr.chain_word ^= 0xaaaa; object(i)->hdr.link_word ^= 0x5a5a;
    }
    g_monster_type_props[row()].coin_loot ^= 0xff;
    g_object_type_props[160].monetary_value ^= 0xa555; DAT_00201b68 ^= 0x5555;
    if (kind == 1 || kind >= 6) g_despawn_creature_record = (char *)&g_monster_type_props[(seed + 13) & 63];
}
long ce_rand(void)
{
    if (which == 1 && !counts[0]) assert(row() == (seed & 63));
    observe(1); ++counts[0]; change(1);
    if (mode == 0) return 15;
    if (mode == 2 || mode == 7) return -1;
    if (mode == 8) return -63;
    if (mode == 3) return (short)seed;
    if (mode == 11) return (short)(seed * 37 + counts[0] * 13);
    return 0;
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    observe(2); argument(divisor); argument(dividend); ++counts[1]; last_divisor = divisor; change(2);
    return divisor ? (divmod_result){dividend/divisor, dividend%divisor} : (divmod_result){0,0};
}
int roll_dice_sum(int base, short sides)
{
    assert(base == 4); observe(3); argument(sides); ++counts[2]; change(3);
    if (mode == 5) return 0;
    if (mode == 6) return -1;
    if (mode == 8) return 512;
    if (mode == 9) return 508;
    if (mode == 4 || mode == 7 || mode == 10) return 4;
    if (mode == 1) return 16;
    return (short)seed;
}
uw_object_hdr_t *spawn_new_object(uint id, int arena)
{
    assert(arena == 0 && id >= 160 + CHAR_MIN && id <= 160 + CHAR_MAX && !counts[3]); observe(4); argument(id); ++counts[3];
    spawned = &object(mode == 7 ? 0 : 1)->hdr; spawned->object_id = id; change(4);
    owner_at_spawn = spawned->owner; next_at_spawn = spawned->next;
    if (!mutation && mode == 4) assert(id == 163);
    if (!mutation && (mode == 9 || mode == 10)) assert(id == 160);
    return spawned;
}
void object_list_insert_head(ushort *head, uw_object_hdr_t *p)
{
    assert(head == &object(0)->hdr.link_word && p == spawned);
    assert(p->owner == owner_at_spawn && p->next == next_at_spawn);
    if (!mutation && mode == 9) assert(p->link == 127);
    if (!mutation && (mode == 4 || mode == 10)) assert(p->link == 1);
    if (!mutation && mode == 10) assert(last_divisor == -128);
    observe(5); ++counts[4]; p->next = *head >> 6; *head = (*head & 63) | (257 << 6); change(5);
}
void spawn_creature_special_item_drop(void *p) { assert(p == object(0)); observe(6); ++counts[5]; change(6); }
void spawn_creature_equipment_drop(void *p) { assert(p == object(0)); observe(7); ++counts[5]; change(7); }
void spawn_creature_misc_item_drop(void *p) { assert(p == object(0)); observe(8); ++counts[5]; change(8); }
#include "treasure_functions.c"

struct result { byte records[120], monsters[3072], items[6656]; unsigned counts[6], row; short level; int last_divisor; uint64_t events; };
static struct result expected, actual;
static void run(int reference, struct result *out)
{
    memset(records, 0xa5, sizeof records); memset(g_monster_type_props, 0x55, sizeof g_monster_type_props);
    memset(g_object_type_props, 0xaa, sizeof g_object_type_props); memset(out, 0, sizeof *out);
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->hdr.type_flags = seed + i * 17; object(i)->hdr.position_word = seed * 37 + i * 19;
        object(i)->hdr.chain_word = seed * 11 + i * 37; object(i)->hdr.link_word = seed * 53 + i * 17;
        object(i)->status_word = seed * 13 + i * 17;
    }
    object(0)->npc_loot_spawned = mode == 7;
    for (unsigned i = 0; i < 64; ++i) g_monster_type_props[i].coin_loot = mode >= 3 ? 255 : seed + i * 13;
    const ushort fixed[] = {0,0,0,0,4,8,12,7,127,256,0xff80,0};
    for (int subtype = CHAR_MIN; subtype <= CHAR_MAX; ++subtype)
        g_object_type_props[160 + subtype].monetary_value =
            mode >= 3 && mode <= 10 ? fixed[mode] : seed + (subtype - CHAR_MIN) * 17;
    g_despawn_creature_record = (char *)&g_monster_type_props[7];
    DAT_00201b68 = mode == 4 ? 12 : mode == 9 ? 0 :
        mode == 1 || mode == 5 || mode == 6 || mode == 8 || mode == 10 ? 11 : (short)seed;
    memset(counts, 0, sizeof counts); events = 0; last_divisor = 0; spawned = NULL;
    if (which == 0) {
        if (reference) reference_spawn_creature_treasure_drop(object(0)); else spawn_creature_treasure_drop(object(0));
    } else {
        if (reference) reference_spawn_creature_death_loot((ushort *)object(0)); else spawn_creature_death_loot((ushort *)object(0));
        assert(object(0)->npc_loot_spawned);
        assert(counts[5] == (mode == 7 ? 0 : 3));
        if (mode == 7) assert(!counts[0] && !counts[3] && row() == 7);
    }
    assert(counts[3] == counts[4]);
    if (mode == 0 || (!mutation && (mode == 5 || mode == 6))) assert(!counts[3]);
    _Static_assert(sizeof out->monsters == sizeof g_monster_type_props, "monster snapshots");
    _Static_assert(sizeof out->items == sizeof g_object_type_props, "object snapshots");
    _Static_assert(sizeof(uw_object_type_props_t) == 13 && offsetof(uw_object_type_props_t, monetary_value) == 5, "legacy value address");
    memcpy(out->records, records, sizeof records); memcpy(out->monsters, g_monster_type_props, sizeof g_monster_type_props);
    memcpy(out->items, g_object_type_props, sizeof g_object_type_props); memcpy(out->counts, counts, sizeof counts);
    out->row = row(); out->level = DAT_00201b68; out->last_divisor = last_divisor; out->events = events;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 12; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (which = 0; which < 2; ++which) {
                    run(1, &expected); run(0, &actual);
                    if (memcmp(&expected, &actual, sizeof actual)) {
                        fprintf(stderr,"treasure mismatch seed=%u mode=%u mutation=%u function=%u\n",seed,mode,mutation,which); return 1;
                    }
                    ++cases;
                }
    printf("%u treasure/dispatch cases preserve quantities, signed prices, row selection and callbacks\n", cases);
}

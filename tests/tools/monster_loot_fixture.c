#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][40], tile[4];
short DAT_0010144c, DAT_00101454;
static unsigned seed, mode, mutation, spawns, randoms, inserts, settles, drops;
static ushort gold, item;
static uint64_t events;
static uw_object_hdr_t *object(unsigned i) { return (uw_object_hdr_t *)(records[i] + 4); }
static uw_mobile_object_t *monster(void) { return (uw_mobile_object_t *)object(0); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof records; ++i) events = events * 31 + ((byte *)records)[i];
    for (unsigned i = 0; i < sizeof tile; ++i) events = events * 31 + tile[i];
    events = events * 31 + (ushort)DAT_0010144c; events = events * 31 + (ushort)DAT_00101454;
}
static void argument(int value) { events = events * 31 + (uint)value; }
void *tilemap_lookup(short x, short y)
{
    observe(1); argument(x); argument(y);
    if (mutation) monster()->tile_word ^= 0xaaaa;
    return tile;
}
uw_object_hdr_t *spawn_new_object(uint id, int region)
{
    bool is_gold = spawns == 0 && (gold & 255) != 0; ++spawns;
    assert(region == 0 && id == (is_gold ? (gold & 255) + 0xd8 : (item & 255) + 0xc0));
    observe(2); argument(id);
    uw_object_hdr_t *p = object(is_gold ? 1 : 2);
    if (mutation) {
        p->position_word ^= 0xa5a5; p->chain_word ^= 0x5555; p->link_word ^= 0xaaaa;
        monster()->hdr.position_word ^= 0x3333; monster()->hdr.type_flags ^= 0x5555;
        DAT_0010144c ^= 7; DAT_00101454 ^= 3;
    }
    return mode == 3 || (mode == 1 && is_gold) || (mode == 2 && !is_gold) ? NULL : p;
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == tile + 2 && p == object(1)); observe(3); ++inserts;
    p->next = *link >> 6; *link = (*link & 63) | (257 << 6);
    if (mutation) p->position_word ^= 0xaaaa;
}
uw_object_hdr_t *settle_dropped_object(void *p, short x, short y, int skip)
{
    assert(p == object(1) && skip == 1); observe(4); ++settles; argument(x); argument(y);
    if (mutation) monster()->hdr.type_flags ^= 0xa5a5;
    return p;
}
long ce_rand(void)
{
    observe(5); ++randoms;
    if (mutation) { monster()->hdr.type_flags ^= 0xaaaa; object(2)->link_word ^= 0x5555; }
    return mode == 4 ? (short)seed : seed;
}
int drop_object_near_target(void *source, void *p, short kind, uint flags)
{
    assert(source == monster() && p == object(2) && kind == 4 && flags == 0);
    observe(6); ++drops;
    if (mutation) object(2)->position_word ^= 0x5555;
    return 1;
}
#include "monster_loot_functions.c"

struct result { byte records[120], tile[4]; short globals[2]; unsigned counts[5]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(tile, 0x3c, sizeof tile);
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->type_flags = seed ^ (i * 0x5555);
        object(i)->position_word = seed * (1 + i * 12);
        object(i)->chain_word = seed ^ (i * 0xaaaa); object(i)->link_word = seed * (1 + i * 16);
    }
    monster()->tile_word = seed;
    DAT_0010144c = seed & 63; DAT_00101454 = (seed >> 6) & 63;
    spawns = randoms = inserts = settles = drops = 0; events = 0;
    if (reference) reference_drop_monster_loot(monster(), gold, item); else drop_monster_loot(monster(), gold, item);
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.tile, tile, sizeof tile);
    result.globals[0] = DAT_0010144c; result.globals[1] = DAT_00101454;
    unsigned counts[] = {spawns, randoms, inserts, settles, drops}; memcpy(result.counts, counts, sizeof counts);
    result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 6; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                gold = mode == 5 ? 0 : seed; item = mode == 5 ? seed : seed >> 8;
                struct result before = run(1), after = run(0);
                assert(memcmp(before.records, after.records, sizeof records) == 0);
                assert(memcmp(before.tile, after.tile, sizeof tile) == 0);
                assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                assert(before.events == after.events); ++cases;
            }
    printf("%u monster-loot cases preserve placement, header/guard bytes and callbacks\n", cases);
    return 0;
}

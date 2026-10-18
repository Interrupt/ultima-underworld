#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40], tiles[2][8];
uw_mobile_object_t *DAT_0010190c;
undefined4 DAT_00101734_backing[1];
ushort DAT_00101900;
short DAT_00101444, DAT_00101448;
char DAT_00101408, DAT_00101410;
undefined1 DAT_00101420;
byte DAT_00101918, DAT_001013f8;
static unsigned seed, mode, mutation, alias, headings, walks, roots, divisions, lookups, unlinks, inserts;
static uint64_t events;
static uw_mobile_object_t *object(unsigned index) { return (uw_mobile_object_t *)(records[index] + 4); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof tiles; ++i) argument(((byte *)tiles)[i]);
    argument(DAT_0010190c == object(1)); argument(DAT_00101900); argument(DAT_00101734);
    argument(DAT_00101444); argument(DAT_00101448); argument(DAT_00101408); argument(DAT_00101410);
    argument(DAT_00101420); argument(DAT_00101918); argument(DAT_001013f8);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    if (kind == 1 || kind == 7) DAT_0010190c = object(1);
    DAT_0010190c->goal_word ^= 0xaaaa; DAT_0010190c->tile_word ^= 0x5555;
    DAT_0010190c->hdr.position_word ^= 0xa5a5;
    DAT_0010190c->motion_flags ^= 0xff; DAT_0010190c->attack_pitch ^= 0x55;
    tiles[0][0] ^= 0x5a; tiles[1][0] ^= 0xa5;
    DAT_00101918 ^= 0x5a; DAT_001013f8 ^= 0xa5;
}
int compute_movement_heading(int dx, int dy)
{
    observe(1); argument(dx); argument(dy); ++headings; change(1);
    return (short)(seed ^ 0xa555);
}
void npc_walk_toward_tile(uint goal, char target, byte attitude)
{
    observe(2); argument(goal); argument(target); argument(attitude); ++walks; change(2);
}
int integer_sqrt(int value)
{
    observe(3); argument(value); ++roots; change(3); return seed & 255;
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    observe(4); argument(divisor); argument(dividend); ++divisions; change(4);
    int base = divisions == 1 ? DAT_00101408 : DAT_00101410;
    int coordinate = (signed char)(divisions == 1 ? seed >> 8 : seed);
    return (divmod_result){.quot = coordinate - base, .rem = (short)(seed ^ 0x5555)};
}
void *tilemap_lookup(short x, short y)
{
    observe(5); argument(x); argument(y); ++lookups; change(5);
    if (alias && lookups == 2) return records[0] + 4 + (alias == 1 ? 2 : 22);
    return tiles[lookups - 1];
}
void object_list_unlink(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == tiles[0] + 2 && p == (uw_object_hdr_t *)DAT_0010190c);
    observe(6); ++unlinks; argument(*link); change(6);
    *link ^= 0x4444; p->chain_word ^= 0x3333;
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{
    assert(p == (uw_object_hdr_t *)DAT_0010190c);
    observe(7); ++inserts; argument(*link); change(7);
    *link ^= 0x8888; p->link_word ^= 0x5555;
}
#include "approach_functions.c"

struct result {
    byte records[80], tiles[16]; unsigned counts[7]; int globals[10]; uint64_t events;
};
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(tiles, 0x3c, sizeof tiles);
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.type_flags = seed ^ (i * 0x5555);
        object(i)->hdr.position_word = seed ^ (i * 0xaaaa);
        object(i)->goal_word = seed * 37 + i * 17;
        object(i)->tile_word = seed * 13 + i * 19;
        object(i)->motion_flags = seed + i * 7;
        object(i)->animation_flags = (seed >> 8) + i * 13;
        object(i)->attack_pitch = seed * 17 + i * 23;
        tiles[i][0] = seed + i * 37;
    }
    DAT_0010190c = object(0); DAT_00101734 = mode & 1;
    const ushort distances[] = {0, 2, 3, 64, 65, 65535}; DAT_00101900 = distances[mode / 2];
    DAT_00101444 = (short)seed; DAT_00101448 = (short)(seed ^ 0xaaaa);
    DAT_00101408 = (char)(seed >> 8); DAT_00101410 = (char)seed;
    DAT_00101420 = seed * 7; DAT_00101918 = seed * 3; DAT_001013f8 = seed * 5;
    headings = walks = roots = divisions = lookups = unlinks = inserts = 0; events = 0;
    if (reference) reference_npc_combat_approach_tick(); else npc_combat_approach_tick();
    if (mode < 4) assert(headings == (mode & 1) && walks == 0 && roots == 0);
    else if (mode < 8) assert(walks == (mode & 1) && headings == 0 && roots == 0);
    else assert(roots == 1 && divisions == 2 && lookups == 2 && unlinks == 1 && inserts == 1);
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.tiles, tiles, sizeof tiles);
    unsigned counts[] = {headings, walks, roots, divisions, lookups, unlinks, inserts};
    memcpy(result.counts, counts, sizeof counts);
    int globals[] = {DAT_0010190c == object(1), DAT_00101734, DAT_00101900, DAT_00101444,
        DAT_00101448, DAT_00101408, DAT_00101410, DAT_00101420, DAT_00101918, DAT_001013f8};
    memcpy(result.globals, globals, sizeof globals); result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 12; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (alias = 0; alias < 3; ++alias) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
                    assert(memcmp(before.tiles, after.tiles, sizeof before.tiles) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                    assert(before.events == after.events); ++cases;
                }
    printf("%u NPC approach cases preserve frames, positions, home tiles and callback order\n", cases);
    return 0;
}

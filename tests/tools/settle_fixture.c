#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][40], tile[8], stats[2][160];
static uw_mobile_object_t player;
uw_mobile_object_t *g_player_object;
uw_object_type_props_t g_object_type_props[512];
char *DAT_00086df8;
short DAT_0010144c, DAT_00101454, DAT_00201b68;
static unsigned seed, mode, mutation, alias, randoms, debris, allocations, frees, relinks, lights, inserts, hazards, messages, updates, lookups, rolls, schedules;
static uint64_t events;
static uw_object_hdr_t *object(unsigned index) { return (uw_object_hdr_t *)(records[index] + 4); }
static uw_object_hdr_t *destination(void) { return object(alias ? 0 : 1); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void pointer(const void *p)
{
    int index = p == NULL ? 0 : p == object(0) ? 1 : p == object(1) ? 2 : p == object(2) ? 3 : 4;
    argument(index);
}
static void observe(unsigned kind)
{
    argument(kind);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof tile; ++i) argument(tile[i]);
    for (unsigned i = 0; i < sizeof stats; ++i) argument(((byte *)stats)[i]);
    argument(DAT_00086df8 == (char *)stats[1]); argument(DAT_0010144c); argument(DAT_00101454);
    argument(DAT_00201b68); argument(player.npc_hp);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    object(0)->position_word ^= 0x5555; object(0)->chain_word ^= 0xa5a5;
    records[0][12] ^= 0xaa; records[0][28] ^= 0x55; records[0][22] ^= 0xa5;
    object(1)->type_flags ^= 0x5a5a; object(1)->chain_word ^= 0x3333;
    DAT_0010144c += 1; DAT_00101454 -= 1;
    if (kind == 6 || kind == 11) DAT_00086df8 = (char *)stats[1];
    DAT_00086df8[0x6e] ^= 0x55;
}
long ce_rand(void)
{
    observe(1); ++randoms; change(1); return (short)(seed * 37 + randoms * 13);
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    assert(divisor == 3); observe(2); argument(dividend); change(2);
    return (divmod_result){.quot = dividend / divisor, .rem = dividend % divisor};
}
void spawn_effect_debris_burst(void *p, uint x, int y)
{
    assert(p == object(0)); observe(3); argument(x); argument(y); ++debris; change(3);
}
int spawn_scheduled_effect_object(ushort *p, int group, int delay, byte frame, short heading, short x, short y)
{
    assert((void *)p == object(0) && group == 6 && delay == 3 && frame == 0 && heading == 0);
    observe(4); argument(x); argument(y); ++schedules; change(4); return -1;
}
int roll_object_destroy_chance(short chance, void *p)
{
    assert(chance == 10 && p == object(0)); observe(5); ++rolls; change(5);
    return mode == 12 ? 1 : 0;
}
void print_scroll_message_by_id(uint id) { assert(id == 0x116); observe(6); ++messages; change(6); }
void set_pending_update_flags(ushort flags) { assert(flags == 0x400); observe(7); ++updates; change(7); }
void *tilemap_lookup(short x, short y)
{
    observe(8); argument(x); argument(y); ++lookups; change(8);
    return mode == 10 ? NULL : alias ? (void *)records[0] : tile;
}
uw_object_hdr_t *alloc_object_slot(int region)
{
    assert(region == 0); observe(9); ++allocations; change(9); return mode == 11 ? NULL : destination();
}
void scheduler_relink_entry(void *new_object, void *old_object)
{
    assert(new_object == destination() && old_object == object(0)); observe(10); ++relinks; change(10);
    destination()->type_flags ^= 0xaaaa; records[0][28] ^= 0x55;
}
void set_ambient_bias_without_light(char level)
{
    assert(level == 0); observe(11); ++lights; change(11); destination()->type_flags ^= 0x5555;
}
ushort *discard_misplaced_object(void *link, ushort *p, int skip)
{
    observe(12); pointer(p); argument(skip); argument(link != NULL); ++frees; change(12);
    if (p) ((uw_object_hdr_t *)p)->link_word ^= 0xaaaa;
    return skip ? p : alias ? (ushort *)object(2) : NULL;
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == (alias ? records[0] : tile) + 2 && p == destination());
    observe(13); pointer(p); ++inserts; argument(*link); change(13);
    p->next = *link >> 6; *link = (*link & 63) | (257 << 6);
}
int activate_area_hazard_object(ushort *p, uint x, int y, int damage)
{
    observe(14); pointer(p); argument(x); argument(y); argument(damage); ++hazards; change(14);
    return mode == 14 ? 0 : 1;
}
#include "settle_functions.c"

struct result { byte records[120], tile[8], stats[320]; unsigned counts[14]; int globals[5], returned; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(tile, 0x3c, sizeof tile); memset(stats, 0x5a, sizeof stats);
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->type_flags = seed ^ (i * 0x5555); object(i)->position_word = seed * 37 + i * 13;
        object(i)->chain_word = seed * 13 + i * 17; object(i)->link_word = seed * 17 + i * 19;
        records[i][12] = seed + i * 37; records[i][28] = (seed >> 8) + i * 13; records[i][22] = seed * 7;
        ((uw_mobile_object_t *)object(i))->movement_mode = mode == 1 ? 1 : (mode >= 2 && mode <= 8) || mode >= 21 ? 2 : 0;
    }
    if (mode == 16) object(0)->object_id = 0x94 + seed % 3;
    if (mode == 17) object(0)->object_id = 0x1c0 | (seed & 63);
    if (mode == 18) object(0)->object_id = 0x140 | (seed & 63);
    if (mode == 19) object(0)->object_id = 0x180 | (seed & 63);
    for (unsigned i = 0; i < 512; ++i) {
        unsigned chance = (mode >= 2 && mode <= 8) || mode >= 21 ? 10 : mode == 13 || mode == 14 ? 9 : mode == 15 ? 0 : i & 15;
        g_object_type_props[i].owner_flags = (chance << 1) | (seed & 0xe1);
        g_object_type_props[i].class_flags = mode == 20 ? 2 : i & 3;
    }
    DAT_00086df8 = (char *)stats[0]; g_player_object = &player;
    memset(&player, 0x5a, sizeof player); player.npc_hp = mode == 7 ? 0 : seed | 1;
    DAT_0010144c = mode == 8 || mode == 23 ? 38 : mode == 22 ? 37 : 32; DAT_00101454 = 32;
    DAT_00201b68 = mode == 9 ? 9 : 8;
    for (unsigned i = 0; i < 2; ++i) {
        stats[i][0x62] = mode == 2 ? 0 : 4;
        stats[i][0x6d] = mode == 3 ? 1 : mode == 4 ? 2 + seed % 7 : mode == 5 ? 9 : mode == 6 ? 10 : mode == 21 ? 0 : 2;
        stats[i][0x6e] = seed; stats[i][0x6f] = seed >> 8;
    }
    randoms = debris = allocations = frees = relinks = lights = inserts = hazards = messages = updates = lookups = rolls = schedules = 0; events = 0;
    ushort *returned = reference ? reference_settle_mobile_to_immobile((ushort *)object(0)) : settle_mobile_to_immobile((ushort *)object(0));
    assert(lookups == 1 && frees >= 1);
    if (mode == 1) assert(schedules == 1);
    if (mode == 3) assert(messages == 1 && updates == 1);
    if (mode == 4 || mode == 5) assert(debris != 0);
    if (mode == 9 || mode == 10) assert(allocations == 0 && returned == NULL);
    if (mode == 13 || mode == 14) assert(hazards == 1);
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.tile, tile, sizeof tile); memcpy(result.stats, stats, sizeof stats);
    unsigned counts[] = {randoms, debris, allocations, frees, relinks, lights, inserts, hazards, messages, updates, lookups, rolls, schedules, 0};
    memcpy(result.counts, counts, sizeof counts);
    int globals[] = {DAT_00086df8 == (char *)stats[1], DAT_0010144c, DAT_00101454, DAT_00201b68, player.npc_hp};
    memcpy(result.globals, globals, sizeof globals); result.events = events;
    result.returned = returned == NULL ? 0 : (void *)returned == object(0) ? 1 : (void *)returned == object(1) ? 2 : (void *)returned == object(2) ? 3 : 4;
    return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 24; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (alias = 0; alias < 2; ++alias) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
                    assert(memcmp(before.tile, after.tile, sizeof before.tile) == 0);
                    assert(memcmp(before.stats, after.stats, sizeof before.stats) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                    assert(before.returned == after.returned && before.events == after.events); ++cases;
                }
    printf("%u settling cases preserve guarded records, callbacks, hazards and returned pointers\n", cases);
    return 0;
}

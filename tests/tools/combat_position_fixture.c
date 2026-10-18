#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40], targets[2][8];
static uw_monster_type_props_t properties[2];
uw_mobile_object_t *DAT_0010190c;
uw_monster_type_props_t *DAT_00101404;
char *DAT_00101400;
undefined4 DAT_00101734_backing[1], DAT_00101924;
int DAT_00101430;
ushort DAT_00101900;
short DAT_00101444, DAT_00101448;
static unsigned seed, mode, mutation, alias, headings, randoms, specials, adjustments, goals;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof targets; ++i) argument(((byte *)targets)[i]);
    for (unsigned i = 0; i < sizeof properties; ++i) argument(((byte *)properties)[i]);
    argument(DAT_0010190c == object(1)); argument(DAT_00101404 == &properties[1]);
    argument(DAT_00101400 == (char *)targets[1]); argument(DAT_00101900);
    argument(DAT_00101924); argument(DAT_00101430); argument(DAT_00101444); argument(DAT_00101448);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    if (kind == 1 || kind == 4) {
        DAT_0010190c = object(1); DAT_00101404 = &properties[1]; DAT_00101400 = (char *)targets[1];
    }
    DAT_0010190c->goal_word ^= 0xa5a5; DAT_0010190c->hdr.position_word ^= 0x5555;
    DAT_0010190c->motion_flags ^= 0xaa; DAT_0010190c->attack_pitch ^= 0x5a;
    DAT_0010190c->heading_flags ^= 0xa5; DAT_0010190c->full_heading ^= 0x55;
    DAT_00101404->magic_power ^= 0xff; DAT_00101404->movement_speed ^= 0x55;
    DAT_00101404->morale_flags ^= 8; DAT_00101404->missile_wander_flags ^= 15;
    targets[0][2] ^= 0x5a; targets[1][2] ^= 0xa5;
}
int compute_movement_heading(int dx, int dy)
{
    observe(1); argument(dx); argument(dy); ++headings; change(1); return (short)(seed ^ 0xa555);
}
long ce_rand(void)
{
    observe(2); ++randoms; change(2);
    if (mode == 3) return 0;
    if (mode == 20) return -1;
    if (mode == 21) return 1;
    if (mode == 13) return 0;
    if (mode == 23) return -63;
    return (short)(seed * 37 + randoms * 13);
}
int try_npc_special_ability_no_los(void)
{
    observe(3); ++specials; change(3); return mode == 12;
}
uint adjust_heading_away_from_player(uint heading, uint distance)
{
    assert(distance == 24); observe(4); argument(heading); ++adjustments; change(4);
    return (uint)(short)(seed ^ 0xaa55);
}
void npc_set_goal(byte goal, uint target)
{
    assert(goal == 9); observe(5); argument(target); ++goals; change(5);
    DAT_0010190c->npc_goal = goal; DAT_0010190c->npc_gtarg = target;
}
#include "combat_position_functions.c"

struct result { byte records[80], targets[16], properties[96]; unsigned counts[5]; int globals[7]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(targets, 0x5a, sizeof targets);
    memset(properties, 0, sizeof properties);
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.position_word = seed + i * 19; object(i)->goal_word = seed * 37 + i * 17;
        object(i)->motion_flags = seed + i * 13; object(i)->attack_pitch = seed * 13 + i * 17;
        object(i)->heading_flags = seed * 17 + i * 19; object(i)->full_heading = (seed >> 8) + i * 37;
        object(i)->animation_flags = seed * 7 + i * 11; object(i)->npc_ai_flags = seed * 11 + i * 23;
        if (mode == 6) object(i)->npc_goal = 9;
        if (mode == 7) object(i)->npc_goal = 3;
        if (mode == 18) object(i)->hdr.zpos = 110;
        if (mode == 19) object(i)->hdr.zpos = 111;
        properties[i].movement_flags = mode == 18 || mode == 19 || (seed & 256) ? 0x80 : 0;
        properties[i].morale_flags = mode == 3 ? 8 : mode == 21 ? 0 : seed;
        properties[i].magic_power = mode == 4 ? 255 : seed + i * 13;
        properties[i].movement_speed = (seed >> 8) + i * 17;
        properties[i].missile_wander_flags = seed * 7 + i * 19;
        unsigned gap = mode == 16 ? 16 : mode == 17 ? 15 : 0;
        targets[i][2] = (object(i)->hdr.zpos + gap) & 127;
    }
    DAT_0010190c = object(0); DAT_00101404 = &properties[0];
    DAT_00101400 = alias ? (char *)object(0) : (char *)targets[0];
    DAT_00101734 = mode != 0;
    DAT_00101924 = mode >= 5 && mode <= 11 ? 1 : 0;
    DAT_00101430 = mode == 15 ? 1 : 0;
    const ushort distances[] = {0,0,3,3,3,3,5,8,9,63,64,65535,4,4,65,9,3,3,4,4,3,3,64,4};
    DAT_00101900 = distances[mode]; DAT_00101444 = (short)seed; DAT_00101448 = (short)(seed ^ 0xaaaa);
    unsigned initial_frame = object(0)->npc_animation_frame;
    headings = randoms = specials = adjustments = goals = 0; events = 0;
    if (reference) reference_npc_combat_position_tick(); else npc_combat_position_tick();
    assert(headings == (mode != 0));
    if (!mutation && !alias && (mode == 6 || mode == 10 || mode == 21))
        assert(object(0)->npc_animation_frame == (initial_frame + 1) % 4);
    if (mode == 12) assert(specials == 1 && goals == 0 && adjustments == 0);
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.targets, targets, sizeof targets);
    _Static_assert(sizeof properties == sizeof result.properties, "property snapshots");
    memcpy(result.properties, properties, sizeof properties);
    unsigned counts[] = {headings, randoms, specials, adjustments, goals}; memcpy(result.counts, counts, sizeof counts);
    int globals[] = {DAT_0010190c == object(1), DAT_00101404 == &properties[1], DAT_00101400 == (char *)targets[1],
        DAT_00101900, DAT_00101924, DAT_00101430, DAT_00101734}; memcpy(result.globals, globals, sizeof globals);
    result.events = events; return result;
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
                    assert(memcmp(before.targets, after.targets, sizeof before.targets) == 0);
                    assert(memcmp(before.properties, after.properties, sizeof before.properties) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                    assert(before.events == after.events); ++cases;
                }
    printf("%u positioning cases preserve frames, speed, pitch, headings and callbacks\n", cases);
    return 0;
}

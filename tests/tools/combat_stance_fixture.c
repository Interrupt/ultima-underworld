#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40], targets[2][8];
static uw_monster_type_props_t properties[2];
uw_mobile_object_t *DAT_0010190c;
uw_monster_type_props_t *DAT_00101404;
char *DAT_00101400;
short DAT_00101444, DAT_00101448;
static unsigned seed, mode, mutation, alias, headings, randoms, divisions;
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
    argument(DAT_00101400 == (char *)targets[1]); argument(DAT_00101444); argument(DAT_00101448);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    if (kind == 1 || kind == 3) {
        DAT_0010190c = object(kind == 1); DAT_00101404 = &properties[kind == 1];
        DAT_00101400 = (char *)targets[kind == 1];
    }
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->goal_word ^= 0xa5a5; object(i)->hdr.position_word ^= 0x5555;
        object(i)->motion_flags ^= 0xaa; object(i)->attack_pitch ^= 0x5a;
        object(i)->heading_flags ^= 0xa5; object(i)->full_heading ^= 0x55;
        object(i)->target_word ^= 0x7777; object(i)->animation_flags ^= 0x33;
        properties[i].magic_power ^= 0xff; properties[i].dexterity ^= 0xaa;
        properties[i].attacks[0].probability ^= 0xff;
        targets[i][2] ^= 0x5a;
    }
}
int compute_movement_heading(int dx, int dy)
{
    observe(1); argument(dx); argument(dy); ++headings; change(1); return (short)(seed ^ 0xa555);
}
long ce_rand(void)
{
    observe(2); ++randoms; change(2);
    switch (mode) {
    case 0: case 4: case 8: case 11: return 0;
    case 1: case 9: return 1;
    case 2: case 12: return -1;
    case 3: return randoms == 2 ? 1 : 0;
    case 6: return randoms == 2 ? 7 : randoms == 3 ? 1 : 0;
    case 10: return -63;
    case 14: return randoms == 1 ? 1 : 99;
    case 15: return 63;
    default: return (short)(seed * 37 + randoms * 13);
    }
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    assert(divisor == 3 && dividend >= 0 && dividend <= 510);
    observe(3); argument(divisor); argument(dividend); ++divisions; change(3);
    return (divmod_result){dividend/divisor, dividend%divisor};
}
#include "combat_stance_functions.c"

struct result { byte records[80], targets[16], properties[96]; unsigned counts[3]; int globals[6]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(targets, 0x5a, sizeof targets);
    memset(properties, 0, sizeof properties);
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.position_word = seed * 11 + i * 19; object(i)->goal_word = seed + i * 17;
        object(i)->target_word = seed * 37 + i * 13;
        object(i)->motion_flags = seed + i * 13; object(i)->attack_pitch = seed * 13 + i * 17;
        object(i)->heading_flags = seed * 17 + i * 19; object(i)->full_heading = (seed >> 8) + i * 37;
        object(i)->animation_flags = seed * 7 + i * 11;
        properties[i].movement_flags = mode >= 8 ? 0x80 : 0;
        properties[i].magic_power = seed >> 8;
        properties[i].dexterity = mode == 4 ? 0 : mode == 6 ? 255 : seed;
        properties[i].attacks[0].probability = mode == 11 ? 0 : mode == 12 ? 255 : seed;
        properties[i].attacks[1].probability = mode == 11 ? 0 : seed >> 8;
        properties[i].attacks[2].probability = seed * 13;
        ((uw_object_hdr_t *)targets[i])->position_word = seed * 53 + i * 17;
    }
    DAT_0010190c = object(0); DAT_00101404 = &properties[0];
    DAT_00101400 = alias ? (char *)object(0) : (char *)targets[0];
    DAT_00101444 = (short)seed; DAT_00101448 = (short)(seed ^ 0xaaaa);
    const ushort distances[] = {0,1,48,49,81,82,100,101,65535,49,49,0,0,101,100,49};
    unsigned old_charge = object(0)->npc_swing_charge, old_frame = object(0)->npc_animation_frame;
    unsigned old_target = object(0)->target_word & 4095, old_goal = object(0)->goal_word & 4095;
    headings = randoms = divisions = 0; events = 0;
    int returned = reference ? reference_npc_combat_set_stance(distances[mode]) : npc_combat_set_stance(distances[mode]);
    assert(returned == 1 && headings == 1);
    if (!mutation) {
        assert((object(0)->target_word & 4095) == old_target);
        assert((object(0)->goal_word & 4095) == old_goal);
        if (distances[mode] >= 101) {
            assert(object(0)->npc_animation_frame == (old_frame + 1) % 4);
            assert(object(0)->npc_swing_charge == old_charge);
        }
        if (mode == 1 || mode == 2 || mode == 9 || mode == 10 || mode == 15)
            assert(object(0)->npc_swing_charge == (old_charge == 15 ? 15 : old_charge + 1));
        if (mode == 0 || mode == 4 || mode == 11)
            assert(object(0)->npc_animation_frame == 0);
    }
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.targets, targets, sizeof targets);
    _Static_assert(sizeof properties == sizeof result.properties, "property snapshots");
    memcpy(result.properties, properties, sizeof properties);
    unsigned counts[] = {headings, randoms, divisions}; memcpy(result.counts, counts, sizeof counts);
    int globals[] = {DAT_0010190c == object(1), DAT_00101404 == &properties[1], DAT_00101400 == (char *)targets[1],
        DAT_00101444, DAT_00101448, returned}; memcpy(result.globals, globals, sizeof globals);
    result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 16; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (alias = 0; alias < 2; ++alias) {
                    struct result before = run(1), after = run(0);
                    if (memcmp(&before, &after, sizeof before)) {
                        fprintf(stderr, "stance mismatch seed=%u mode=%u mutation=%u alias=%u\n", seed, mode, mutation, alias); return 1;
                    }
                    ++cases;
                }
    printf("%u stance cases preserve frames, charge, speed, pitch, captures and callbacks\n", cases);
}

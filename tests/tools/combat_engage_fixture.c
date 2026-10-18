#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40], stats[2][128];
static uw_monster_type_props_t properties[2];
uw_mobile_object_t *DAT_0010190c;
uw_monster_type_props_t *DAT_00101404;
char *DAT_00086df8;
undefined4 DAT_00101734_backing[1];
short DAT_00201b68, DAT_00101444, DAT_00101448;
byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_00101420;
char DAT_00101408, DAT_00101410, DAT_0010143c, DAT_0010173c;
ushort DAT_00101900, DAT_00101908, DAT_00101910, DAT_00101418, DAT_0010141c;
static unsigned seed, mode, mutation, which, counts[10];
static ushort heading_position;
static int heading_result;
static uw_mobile_object_t *heading_actor;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); ++counts[kind];
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof properties; ++i) argument(((byte *)properties)[i]);
    argument(DAT_0010190c == object(1)); argument(DAT_00101404 == &properties[1]); argument(DAT_00101734);
    argument(DAT_00086df8 == (char *)stats[1]); argument(stats[0][96]); argument(stats[1][96]);
    argument(DAT_00101444); argument(DAT_00101448); argument(DAT_00101408); argument(DAT_00101410);
    argument(DAT_00101900); argument(DAT_00101908); argument(DAT_00101910); argument(DAT_00101418); argument(DAT_0010141c);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    if (kind >= 2 && kind <= 5) { DAT_0010190c = object(1); DAT_00101404 = &properties[1]; DAT_00086df8 = (char *)stats[1]; }
    DAT_0010190c->goal_word ^= 0xa5a5; DAT_0010190c->hdr.position_word ^= 0x5555;
    DAT_0010190c->motion_flags ^= 0xaa; DAT_0010190c->attack_pitch ^= 0x5a;
    DAT_0010190c->status_word ^= 0x3333; DAT_0010190c->animation_flags ^= 0x33;
    DAT_0010190c->heading_flags ^= 0xa5; DAT_0010190c->npc_ai_flags ^= 3;
    DAT_00101404->spell_flags ^= 3; DAT_00101404->movement_flags ^= 0x80;
    DAT_00101404->morale_flags ^= 0xf0; DAT_00101404->weapon_loot[0] ^= 0x20;
    DAT_00101408 ^= 3; DAT_00101410 ^= 5; DAT_00101900 ^= 7;
    DAT_00101908 ^= 0x55aa; DAT_00101418 ^= 0xaa55; DAT_00101444 ^= 0x55aa;
    DAT_00101734 ^= 1; stats[0][96] ^= 0x20; stats[1][96] ^= 0x20;
}
int npc_combat_set_stance(ushort distance) { observe(1); argument(distance); change(1); return -1; }
int try_npc_special_ability_no_los(void) { observe(2); change(2); return mode == 14 ? 1 : 0; }
int try_npc_special_ability_alt(void)
{
    observe(3); change(3); return mode == 4 || mode == 11 || mode == 15 || mode == 16 || mode == 17 || mode == 18;
}
int try_npc_special_ability_ranged(void) { observe(4); change(4); return mode == 13 ? 1 : 0; }
int compute_movement_heading(int dx, int dy)
{
    observe(5); argument(dx); argument(dy); change(5);
    heading_actor = DAT_0010190c; heading_position = DAT_0010190c->hdr.position_word;
    const int fixed[] = {0,7,8,-1,-128,127};
    heading_result = mode < 6 ? fixed[mode] : mode == 21 ? 65535 : mode == 22 ? -65533 : (short)(seed ^ 0xa555);
    return heading_result;
}
void npc_combat_position_tick(void) { observe(6); change(6); }
void npc_wander_reposition(uint x, uint y, uint flag) { observe(7); argument(x); argument(y); argument(flag); change(7); }
void npc_set_goal(byte goal, uint target)
{
    assert(goal == 4 && target == 0); observe(8); change(8); DAT_0010190c->npc_goal = goal; DAT_0010190c->npc_gtarg = target;
}
int check_npc_fine_facing_alignment(char dx, char dy)
{
    observe(9); argument(dx); argument(dy); change(9);
    return mode == 18 ? 0 : mode == 19 ? -1 : mode == 20 ? 32768 : mode == 21 ? 65536 : (short)seed;
}
#include "combat_engage_functions.c"

struct result { byte records[80], props[96], stats[256]; unsigned counts[10]; int globals[16]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(properties, 0, sizeof properties); memset(stats, 0x5a, sizeof stats);
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.position_word = seed * 17 + i * 19; object(i)->goal_word = seed * 37 + i * 17;
        object(i)->motion_flags = seed + i * 13; object(i)->attack_pitch = seed * 13 + i * 17;
        object(i)->status_word = seed * 11 + i * 23; object(i)->npc_level = 4;
        object(i)->animation_flags = 2; object(i)->npc_ai_flags = seed & ~0x20;
        if (mode == 15) object(i)->animation_flags = 5;
        if (mode == 16) object(i)->animation_flags = 13;
        if (mode == 17) object(i)->animation_flags = 1;
        if (mode == 18) object(i)->animation_flags = 6;
        object(i)->heading_flags = seed * 23; object(i)->full_heading = seed >> 8;
        properties[i].race_flags = 0x13; properties[i].spell_flags = mode == 12 ? 2 : mode == 13 || mode == 14 ? 3 : 1;
        properties[i].weapon_loot[0] = mode == 4 || mode == 11 || (mode >= 15 && mode <= 20) ? 0x20 : 0;
        properties[i].movement_flags = mode == 10 ? 0x80 : 0; properties[i].morale_flags = 0;
    }
    DAT_0010190c = object(0); DAT_00101404 = &properties[0]; DAT_00086df8 = (char *)stats[0];
    stats[0][96] = mode == 20 ? 0x20 : 0; DAT_00101734 = mode != 0; DAT_00201b68 = mode == 19 || mode == 20 ? 7 : 1;
    const short dx[] = {0,0,9,10,12,16,17,20,9,9,9,20,20,20,20,20,20,20,20,20,20,256,-32768,32767};
    DAT_00101444 = dx[mode]; DAT_00101448 = 0;
    DAT_00101918 = 1; DAT_001013f8 = 2; DAT_00101408 = mode == 7 ? 1 : 3; DAT_00101410 = mode == 7 ? 2 : 4;
    DAT_0010143c = 64; DAT_0010173c = 32; DAT_0010140c = mode == 8 ? 3 : mode == 9 || mode == 10 ? 4 : 0;
    DAT_00101420 = 0; DAT_00101900 = mode == 4 ? 4 : 5;
    DAT_00101908 = seed; DAT_00101910 = seed >> 8; DAT_00101418 = seed * 37; DAT_0010141c = seed ^ 0xaaaa;
    unsigned old_frame = object(0)->npc_animation_frame, old_gravity = object(0)->gravity_flag;
    ushort old_goal = object(0)->goal_word;
    memset(counts, 0, sizeof counts); events = 0; heading_actor = NULL; heading_position = 0; heading_result = 0;
    int returned = 0, alignment_mode = mode < 18 ? 0 : mode == 22 ? -1 : mode == 23 ? (-2147483647 - 1) : 1;
    if (which == 0) { if (reference) reference_npc_combat_engage_close_tick(); else npc_combat_engage_close_tick(); }
    else if (which == 1) { if (reference) reference_npc_combat_engage_wide_tick(); else npc_combat_engage_wide_tick(); }
    else returned = reference ? reference_check_npc_target_alignment(alignment_mode) : check_npc_target_alignment(alignment_mode);
    if (which < 2 && mode == 0) for (unsigned i = 0; i < 10; ++i) assert(!counts[i]);
    if (!mutation && which == 0 && (mode == 11 || mode == 18)) {
        assert(counts[3] == 1 && object(0)->npc_animation_frame == (old_frame + 1) % 4);
        assert(object(0)->speed == 0 && object(0)->gravity_flag == old_gravity);
    }
    if (!mutation && which == 0 && mode >= 15 && mode <= 17) assert(object(0)->goal_word == old_goal);
    if (!mutation && which == 1 && mode == 4) {
        assert(counts[5] == 1 && object(0)->npc_animation_frame == (old_frame + 1) % 4);
        assert(object(0)->speed == 0 && object(0)->gravity_flag == old_gravity);
    }
    if (!mutation && which == 0 && mode == 6) assert(counts[8] == 1 && !counts[7]);
    if (which == 2 && alignment_mode == 0) {
        assert(counts[5] == 1 && !counts[9]);
        assert((heading_actor->hdr.position_word & 0xfc7f) == (heading_position & 0xfc7f));
        unsigned old_heading = (heading_position >> 7) & 7, new_heading = heading_actor->hdr.heading;
        if (((unsigned)(char)heading_result & 7) == old_heading) {
            assert(returned == 1 && heading_actor->hdr.position_word == heading_position);
        } else {
            unsigned turn = (new_heading + 8 - old_heading) % 8; assert(returned == 0 && (turn == 1 || turn == 7));
        }
    }
    struct result out = {0}; memcpy(out.records, records, sizeof records); memcpy(out.props, properties, sizeof properties);
    memcpy(out.stats, stats, sizeof stats); memcpy(out.counts, counts, sizeof counts);
    int globals[] = {returned,DAT_0010190c == object(1),DAT_00101404 == &properties[1],DAT_00086df8 == (char *)stats[1],
        DAT_00101734,DAT_00101444,DAT_00101448,DAT_00101408,DAT_00101410,DAT_00101900,DAT_00101908,DAT_00101910,
        DAT_00101418,DAT_0010141c,DAT_00201b68,heading_result};
    memcpy(out.globals, globals, sizeof globals); out.events = events; return out;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 24; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (which = 0; which < 3; ++which) {
                    struct result before = run(1), after = run(0);
                    if (memcmp(&before, &after, sizeof before)) {
                        fprintf(stderr,"engage mismatch seed=%u mode=%u mutation=%u function=%u\n",seed,mode,mutation,which); return 1;
                    }
                    ++cases;
                }
    printf("%u engage/alignment cases preserve frames, headings, gravity and callbacks\n", cases);
}

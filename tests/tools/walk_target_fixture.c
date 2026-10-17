#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40], targets[2][40];
static uw_monster_type_props_t properties[2];
uw_mobile_object_t *DAT_0010190c;
uw_monster_type_props_t *DAT_00101404;
char *DAT_00101904;
undefined4 DAT_00101734_backing[1], DAT_00101924, DAT_001013fc, DAT_00101560, DAT_00101914, DAT_00101920;
int DAT_00101430;
byte DAT_00101918, DAT_001013f8;
ushort DAT_000853b8;
static byte cache[448];
#define DAT_00101568 cache[0]
#define DAT_00101569 cache[1]
static unsigned seed, mode, mutation, counts[15], last_slot, saved_slot, pitch_cases, coverage[2][15];
static uint goal_arg;
static char target_arg;
static byte attitude_arg, *live_out;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static byte *target_bytes(unsigned i) { return targets[i] + 4; }
static void argument(int value) { events = events * 31 + (uint)value; }
static unsigned cache_slot(const void *p)
{
    ptrdiff_t offset = (const byte *)p - cache;
    assert(offset >= 0 && offset < 448 && offset % 28 == 0); return offset / 28;
}
static void observe(unsigned kind)
{
    argument(kind); ++counts[kind];
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof targets; ++i) argument(((byte *)targets)[i]);
    for (unsigned i = 0; i < sizeof properties; ++i) argument(((byte *)properties)[i]);
    for (unsigned i = 0; i < sizeof cache; ++i) argument(cache[i]);
    argument(DAT_0010190c == object(1)); argument(DAT_00101404 == &properties[1]); argument(DAT_00101904 == (char *)target_bytes(1));
    argument(DAT_00101734); argument(DAT_00101924); argument(DAT_001013fc); argument(DAT_00101560);
    argument(DAT_00101918); argument(DAT_001013f8); argument(DAT_00101914); argument(DAT_00101920); argument(DAT_000853b8);
    if (live_out) for (unsigned i = 0; i < 4; ++i) argument(live_out[i]);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    if (kind == 1 || kind == 5 || kind == 6 || kind == 7 || kind == 8 || kind == 11 || kind == 13) {
        unsigned next = DAT_0010190c == object(0); DAT_0010190c = object(next); DAT_00101404 = &properties[next];
        DAT_00101904 = (char *)target_bytes(next);
    }
    DAT_0010190c->goal_word ^= 0xa5a5; DAT_0010190c->tile_word ^= 0x5a5a;
    DAT_0010190c->hdr.position_word ^= 0x5555; DAT_0010190c->motion_flags ^= 0xaa;
    DAT_0010190c->attack_pitch ^= 0x5a;
    if (kind != 1) { DAT_0010190c->heading_flags ^= 0x80; DAT_0010190c->animation_flags ^= 0x80; } DAT_0010190c->status_word ^= 0x3333;
    DAT_00101404->movement_speed ^= 0x55; DAT_00101404->magic_power ^= 0xff; DAT_00101404->movement_flags ^= 0x80;
    if (kind != 1) { DAT_00101924 ^= 1; DAT_001013fc ^= 1; }
    DAT_00101918 ^= 1; DAT_001013f8 ^= 3;
    if (kind == 5 || kind == 6) DAT_00101920 ^= 1;
    target_bytes(0)[0] ^= 0x55; target_bytes(1)[11] ^= 0x0f;
    cache[(seed & 15) * 28 + 2] ^= 0x5a;
    if (live_out && (kind == 11 || kind == 12 || kind == 13)) {
        live_out[0] = (live_out[0] + 1) & 15; last_slot = live_out[0];
    }
}
void npc_set_walk_target(byte x, uint y, byte attitude)
{
    assert(x == (byte)goal_arg && y == (uint)(int)target_arg && attitude == attitude_arg);
    observe(1); argument(x); argument(y); argument(attitude); change(1);
    if (mutation && (mode == 0 || mode == 1)) {
        DAT_00101918 = 1; DAT_001013f8 = 2; DAT_0010190c->npc_goal = mode == 1 ? 1 : 2;
    }
    if (mutation && mode == 2) {
        unsigned slot = DAT_0010190c->npc_path_slot;
        cache[slot * 28] = DAT_0010190c->npc_xhome; cache[slot * 28 + 1] = DAT_0010190c->npc_yhome;
    }
}
void npc_set_goal(byte goal, uint target)
{
    assert(goal == 8 && target == 0); observe(2); change(2); DAT_0010190c->npc_goal = goal; DAT_0010190c->npc_gtarg = target;
}
int advance_cached_path_step(char *p) { unsigned slot = cache_slot(p); observe(3); argument(slot); change(3); return 65536; }
long ce_rand(void) { observe(4); change(4); return mode == 11 || mode == 24 ? 0 : mode == 26 ? -1 : 1; }
void npc_arrival_interaction(void *p) { assert(p == DAT_00101904); observe(5); change(5); }
int walk_using_cached_path(byte *p)
{
    unsigned slot = cache_slot(p); assert(slot == DAT_0010190c->npc_path_slot);
    if (counts[13]) assert(slot == last_slot);
    observe(6); argument(slot); change(6); return mode == 6 ? 0 : 1;
}
int compute_movement_heading(int x, int y)
{
    observe(7); argument(x); argument(y); change(7); return mode == 15 ? 65535 : mode == 31 ? -65533 : (short)(seed ^ 0xa555);
}
void set_npc_altitude_state(byte x, byte y) { observe(8); argument(x); argument(y); change(8); }
int try_direct_line_walk(byte x, byte y, short tx, short ty)
{
    observe(9); argument(x); argument(y); argument(tx); argument(ty); change(9);
    return mode == 13 ? 1 : mode == 15 ? 65537 : mode == 14 ? 257 : mode == 29 ? -1 : 0;
}
int pop_pending_path_cache_slot(byte *out)
{
    observe(10); out[0] = mode == 17 ? 15 : seed & 15; out[1] = seed; out[2] = seed >> 8; out[3] = seed ^ 0xa5;
    live_out = out; last_slot = out[0]; change(10); return mode == 12 ? 0 : 1;
}
int compute_pathfind_search_radius(void) { observe(11); change(11); return mode == 31 ? 0x12345 : seed >> 8; }
int creature_find_path_to_tile(int x, char y, byte size, char tx, char ty, char attitude, byte radius)
{
    observe(12); argument(x); argument(y); argument(size); argument(tx); argument(ty); argument(attitude); argument(radius); change(12);
    return mode == 14 || mode == 29 ? 0 : 1;
}
void save_walk_path_to_cache_slot(byte *p)
{
    saved_slot = cache_slot(p); assert(live_out && saved_slot == live_out[0]);
    assert((DAT_000853b8 & (1U << saved_slot)) == 0); observe(13); argument(saved_slot);
    p[2] ^= 0x55; change(13);
}
void npc_idle_behavior_tick(void) { observe(14); change(14); }
#include "walk_target_functions.c"

struct result { byte records[80], targets[80], props[96], cache[448]; unsigned counts[15], pointers[3], slot[2]; int globals[10]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(targets, 0x5a, sizeof targets); memset(properties, 0, sizeof properties);
    for (unsigned i = 0; i < sizeof cache; ++i) cache[i] = seed + i * 37;
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.type_flags = seed + i * 17; object(i)->hdr.position_word = seed * 37 + i * 19;
        object(i)->goal_word = seed * 37 + i * 17; object(i)->tile_word = seed * (i ? 53 : 17) + (i ? 0x1001 : 0);
        object(i)->motion_flags = seed + i * 13; object(i)->attack_pitch = seed * 13 + i * 17;
        object(i)->animation_flags = mode <= 3 || (mode >= 5 && mode <= 7) || mode == 28 ? 0x80 : 0;
        object(i)->heading_flags = mode == 0 || mode == 28 ? 0x20 : mode == 8 || mode == 9 ? 0x80 : mode == 10 || mode == 11 ? 0x40 : 0;
        object(i)->npc_goal = mode == 1 ? 1 : mode == 19 || mode == 20 ? 5 : 2;
        object(i)->status_word = seed * 11 + i * 23; object(i)->npc_attitude = mode == 27 ? 1 : 0;
        properties[i].movement_speed = seed + i * 17; properties[i].magic_power = seed >> 8;
        properties[i].movement_flags = mode == 8 ? 0x80 : 0;
        ((uw_object_hdr_t *)target_bytes(i))->type_flags = seed + i * 17;
        if (mode >= 19 && mode <= 23) {
            const ushort ids[] = {0x40,0x140,0x148,0x7f,0x80};
            ((uw_object_hdr_t *)target_bytes(i))->object_id = ids[mode-19];
        }
        target_bytes(i)[11] = (target_bytes(i)[11] & 0xf0) | (mode == 21 ? 3 : 5);
        unsigned slot = object(i)->npc_path_slot;
        cache[slot * 28] = object(i)->npc_xhome; cache[slot * 28 + 1] = (object(i)->npc_yhome + (mode == 3)) & 63;
    }
    DAT_0010190c = object(0); DAT_00101404 = &properties[0]; DAT_00101904 = mode == 31 ? (char *)object(0) : (char *)target_bytes(0);
    DAT_00101918 = mode == 30 ? 255 : 1; DAT_001013f8 = mode == 30 ? 255 : 2;
    goal_arg = mode == 0 || mode == 1 ? 1 : mode == 30 ? 0xffffffffU : mode == 31 ? 0x12340000U | (seed & 255) : 3;
    target_arg = mode == 0 || mode == 1 ? 2 : mode == 30 ? -1 : mode == 31 ? seed >> 8 : 4;
    attitude_arg = seed; DAT_00101734 = mode >= 1 && mode <= 4 ? 0 : 1;
    DAT_00101924 = mode >= 18 && mode <= 27; DAT_00101430 = 0;
    DAT_001013fc = mode >= 19 && mode <= 27; DAT_00101560 = mode >= 24 && mode <= 27;
    DAT_00101914 = 0; DAT_00101920 = mode == 7 || mode == 17; DAT_000853b8 = seed;
    ushort old_goal = object(0)->goal_word; byte old_motion = object(0)->motion_flags;
    memset(counts, 0, sizeof counts); events = 0; live_out = NULL; last_slot = saved_slot = 0;
    if (reference) reference_npc_walk_toward_tile(goal_arg,target_arg,attitude_arg); else npc_walk_toward_tile(goal_arg,target_arg,attitude_arg);
    if (!mutation && mode == 0) assert(object(0)->speed == 0 && object(0)->gravity_flag == (old_motion >> 7) && object(0)->goal_word == old_goal);
    if (!mutation && mode == 1) assert(counts[2] == 1 && object(0)->npc_goal == 8);
    if (!mutation && mode == 2) assert(counts[3] == 1);
    if (!mutation && mode == 3) assert(counts[3] == 0);
    if (!mutation && (mode == 5 || mode == 6)) {
        assert(counts[6] == 1 && object(0)->npc_animation_frame == (((old_goal >> 12) + 1) % 4));
        assert(object(0)->gravity_flag == (old_motion >> 7) && object(0)->speed == (properties[0].magic_power & 127));
        assert((object(0)->goal_word & 4095) == (old_goal & 4095));
    }
    if (!mutation && mode == 7) assert(object(0)->goal_word == old_goal && object(0)->motion_flags == old_motion);
    struct result out = {0}; memcpy(out.records, records, sizeof records); memcpy(out.targets, targets, sizeof targets);
    memcpy(out.props, properties, sizeof properties); memcpy(out.cache, cache, sizeof cache); memcpy(out.counts, counts, sizeof counts);
    out.pointers[0] = DAT_0010190c == object(1); out.pointers[1] = DAT_00101404 == &properties[1];
    out.pointers[2] = DAT_00101904 == (char *)target_bytes(1) ? 1 : DAT_00101904 == (char *)object(0) ? 2 : 0;
    out.slot[0] = last_slot; out.slot[1] = saved_slot;
    int globals[] = {DAT_00101734,DAT_00101924,DAT_00101430,DAT_001013fc,DAT_00101560,DAT_00101914,DAT_00101920,DAT_00101918,DAT_001013f8,DAT_000853b8};
    memcpy(out.globals, globals, sizeof globals); out.events = events; live_out = NULL; return out;
}
int main(void)
{
    for (unsigned value = 0; value < 256; ++value) {
        memset(records, 0xa5, sizeof records); DAT_0010190c = object(0); object(0)->attack_pitch = value;
        reference_pitch_write(); byte before[80]; memcpy(before, records, sizeof before);
        memset(records, 0xa5, sizeof records); object(0)->attack_pitch = value; converted_pitch_write();
        assert(!memcmp(before, records, sizeof before) && object(0)->pitch == 14 && (object(0)->attack_pitch & 7) == (value & 7)); ++pitch_cases;
    }
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed) for (mode = 0; mode < 32; ++mode) for (mutation = 0; mutation < 2; ++mutation) {
        struct result before = run(1), after = run(0);
        if (memcmp(&before,&after,sizeof before)) { fprintf(stderr,"walk target mismatch seed=%u mode=%u mutation=%u\n",seed,mode,mutation); return 1; }
        for (unsigned kind = 1; kind < 15; ++kind) coverage[mutation][kind] += after.counts[kind];
        ++cases;
    }
    for (unsigned variant = 0; variant < 2; ++variant) for (unsigned kind = 1; kind < 15; ++kind) assert(coverage[variant][kind] != 0);
    printf("%u walk-target cases and %u isolated pitch writes preserve fields, cache slots and callbacks\n",cases,pitch_cases);
}

#include "src/headers/scheduler.h"
#include <assert.h>

static _Alignas(8) byte records[32];
static char queues[2][24];
char *g_scheduler_table;
uw_animation_type_props_t g_animation_type_props[16];
static unsigned seed, mode, mutation, randoms, divisions, advances, captured_link;
static uint64_t events;
static uw_object_hdr_t *object(void) { return (uw_object_hdr_t *)(records + 8); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); argument(g_scheduler_table == queues[1]);
    for (unsigned i = 0; i < sizeof records; ++i) argument(records[i]);
    for (unsigned i = 0; i < sizeof g_animation_type_props; ++i) argument(((byte *)g_animation_type_props)[i]);
    for (unsigned i = 0; i < sizeof queues; ++i) argument(((byte *)queues)[i]);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    object()->type_flags ^= 0xaaaa; object()->position_word ^= 0xa5a5; object()->link_word ^= 0x5555;
    g_scheduler_table = queues[1];
    for (unsigned i = 0; i < 16; ++i) {
        g_animation_type_props[i].flags ^= 0x5555;
        g_animation_type_props[i].start_frame ^= 0x5a;
        g_animation_type_props[i].frame_count ^= 0xa5;
    }
    queues[1][kind] ^= 0x55;
}
uw_object_hdr_t *resolve_object_link(ushort *p)
{
    assert((void *)p == (void *)(queues[0] + (mode % 2) * 6)); observe(1);
    return mode == 0 ? NULL : object();
}
long ce_rand(void)
{
    observe(2); ++randoms; change(2);
    if (mode == 10) return -1;
    if (mode == 11) return -32768;
    return (short)(seed * 37);
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    assert(divisor >= 0 && divisor <= 255); observe(3); argument(divisor); argument(dividend); ++divisions;
    captured_link = object()->link; change(3);
    return divisor ? (divmod_result){dividend/divisor, dividend%divisor} : (divmod_result){0,0};
}
int scheduler_advance_effect(short slot, int elapsed)
{
    assert(slot == (int)(mode % 2)); observe(4); argument(elapsed); ++advances; change(4); return 0;
}
#include "scheduler_step_functions.c"

struct result { byte records[32], props[64]; char queues[2][24]; unsigned counts[3], redirected; uint64_t events; };
static struct result run(int reference)
{
    for (unsigned i = 0; i < sizeof records; ++i) records[i] = seed + i * 37;
    for (unsigned i = 0; i < sizeof queues; ++i) ((byte *)queues)[i] = seed * 13 + i * 29;
    object()->type_flags = mode == 1 ? seed : (seed & 0xfe0f) | 0x1c0;
    object()->position_word = seed * 37; object()->chain_word = seed * 11; object()->link_word = seed * 53;
    if (mode == 4 || mode == 9) { object()->owner = 6; object()->enchanted = mode == 9; }
    const ushort flags[] = {0,0,1,2,4,7,65535,0,0x84,4,3,6};
    for (unsigned i = 0; i < 16; ++i) {
        g_animation_type_props[i].flags = mode == 1 ? seed : flags[mode];
        g_animation_type_props[i].start_frame = mode == 2 ? 10 : seed >> 8;
        g_animation_type_props[i].frame_count = mode == 2 ? 5 : seed;
    }
    const int ticks[] = {0,1,-1,32767,1,-32768,65535,65536,-65536,1,128,-129};
    byte before[32]; memcpy(before, records, sizeof before);
    unsigned old_z = object()->zpos, old_flags = object()->flags_res, old_owner = object()->owner;
    g_scheduler_table = queues[0]; randoms = divisions = advances = 0; events = 0; captured_link = 0;
    if (reference) reference_scheduler_step_entry(mode % 2, ticks[mode]); else scheduler_step_entry(mode % 2, ticks[mode]);
    if (mode == 0 || mode == 7) { assert(!randoms && !divisions && !advances); assert(!memcmp(before, records, sizeof before)); }
    if (mode == 3) assert(object()->link == captured_link);
    if (!mutation && mode == 2) assert(object()->owner == (old_owner < 14 ? old_owner + 1 : 10));
    if (!mutation && mode == 3 && !(seed & 255)) assert(object()->owner == ((seed >> 8) & 63));
    if (!mutation && mode == 4) {
        assert(object()->zpos == (old_z + 6) % 128); assert(advances == (old_flags == 7));
    }
    if (!mutation && mode == 9) {
        assert(object()->zpos == (old_z + 122) % 128); assert(advances == (old_flags != 0));
    }
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.queues, queues, sizeof queues);
    _Static_assert(sizeof result.props == sizeof g_animation_type_props, "animation snapshot");
    memcpy(result.props, g_animation_type_props, sizeof result.props);
    result.counts[0] = randoms; result.counts[1] = divisions; result.counts[2] = advances;
    result.redirected = g_scheduler_table == queues[1]; result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 12; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                struct result before = run(1), after = run(0);
                if (memcmp(&before, &after, sizeof before)) {
                    fprintf(stderr,"scheduler step mismatch seed=%u mode=%u mutation=%u\n",seed,mode,mutation); return 1;
                }
                ++cases;
            }
    printf("%u scheduler-step cases preserve owners, links, heights, flags and callbacks\n", cases);
}

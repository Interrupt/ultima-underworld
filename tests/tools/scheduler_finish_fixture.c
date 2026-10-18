#include "src/headers/scheduler.h"
#include <assert.h>

static _Alignas(8) byte records[32];
static char queues[2][24];
char *g_scheduler_table;
undefined1 g_scheduler_count;
uw_animation_type_props_t g_animation_type_props[16];
short DAT_0010144c, DAT_00101454;
static unsigned seed, mode, mutation, steps, sweeps, delays, sounds, despawns;
static uint64_t events;
static uw_object_hdr_t *object(void) { return (uw_object_hdr_t *)(records + 8); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); argument(g_scheduler_count); argument(g_scheduler_table == queues[1]);
    argument(DAT_0010144c); argument(DAT_00101454);
    for (unsigned i = 0; i < sizeof records; ++i) argument(records[i]);
    for (unsigned i = 0; i < sizeof queues; ++i) argument(((byte *)queues)[i]);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    object()->type_flags ^= 0xaaaa;
    object()->position_word ^= 0xa5a5;
    object()->link_word ^= 0x5555;
    if (mode == 9 || mode == 10) g_scheduler_table = queues[1];
    if (kind == 4) { DAT_0010144c ^= 0x1234; DAT_00101454 ^= 0x4321; }
}
uw_object_hdr_t *resolve_object_link(ushort *p)
{
    assert((void *)p == (void *)(queues[0] + (mode % 2) * 6));
    observe(1); return mode == 0 ? NULL : object();
}
void scheduler_step_entry(int slot, int elapsed)
{
    assert(slot == (int)(mode % 2) && elapsed == 1); observe(2); ++steps; change(2);
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p == object()); observe(3); change(3); return (short)seed;
}
int check_object_placement_clearance(short catalog, short slot, short x, short y,
                                    short height, int check, byte limit)
{
    observe(4); argument(catalog); argument(slot); argument(x); argument(y); argument(height);
    assert(check == 1 && limit == 8); ++sweeps; change(4); return mode == 4 || mode == 10 ? 0 : 1;
}
void adjust_door_close_animation_delay(ushort *p)
{
    assert((void *)p == (void *)object()); observe(5); ++delays; change(5);
}
int play_positional_sound_effect(uint sound, short x, short y, uint bias)
{
    assert(sound == 12 && bias == 0); observe(6); argument(x); argument(y); ++sounds; change(6); return 0;
}
void scheduler_despawn_entry(short slot)
{
    assert(slot == (int)(mode % 2)); observe(7); ++despawns; change(7);
}
#include "scheduler_finish_functions.c"

typedef struct {
    byte records[32]; char queues[2][24];
    unsigned count, redirected, steps, sweeps, delays, sounds, despawns;
    short x, y; uint64_t events;
} Result;
static void setup(void)
{
    for (unsigned i = 0; i < sizeof records; ++i) records[i] = seed + i * 37;
    for (unsigned i = 0; i < sizeof queues; ++i) ((byte *)queues)[i] = seed * 13 + i * 29;
    object()->type_flags = mode == 1 ? seed : (seed & 0xfff0) | 15;
    object()->position_word = seed * 37;
    object()->chain_word = seed * 11;
    object()->link_word = seed * 53;
    /* Even modes open, odd modes close, with two explicit blocked closing modes. */
    if (mode != 1) object()->enchanted = mode % 2 || mode == 4 || mode == 10;
    unsigned slot = mode % 2;
    if (mode == 2 || mode == 8) queues[0][slot * 6 + 2] = queues[0][slot * 6 + 3] = 0;
    for (unsigned i = 0; i < 16; ++i) g_animation_type_props[i].flags =
        (mode >= 8 || mode == 2 ? 0x80 : 0) | (mode == 6 || mode == 7 || mode == 11 ? 0x20 : 0);
    g_scheduler_table = queues[0];
    g_scheduler_count = mode == 2 ? 1 : mode == 3 ? 2 : 3;
    DAT_0010144c = (short)seed; DAT_00101454 = (short)~seed;
    steps = sweeps = delays = sounds = despawns = 0; events = 0;
}
static Result run(int reference)
{
    setup();
    if (reference) reference_scheduler_finish_entry(mode % 2);
    else scheduler_finish_entry(mode % 2);
    Result result = {0};
    memcpy(result.records, records, sizeof records); memcpy(result.queues, queues, sizeof queues);
    result.count = g_scheduler_count; result.redirected = g_scheduler_table == queues[1];
    result.steps = steps; result.sweeps = sweeps; result.delays = delays;
    result.sounds = sounds; result.despawns = despawns;
    result.x = DAT_0010144c; result.y = DAT_00101454; result.events = events;
    if (mode == 0) assert(g_scheduler_count == 3 && !steps && !sweeps && !despawns);
    if (mode == 2 || mode == 8) assert(!steps);
    if (mode == 2) assert(g_scheduler_count == 0);
    if (!mutation && (mode == 4 || mode == 10)) {
        assert(delays == 1 && !sounds && g_scheduler_count == 3);
        assert(object()->owner == ((seed * 53 & 15) % 8));
        assert(object()->link == ((ushort)(seed * 53) >> 6));
    }
    if (!mutation && mode != 0 && mode != 1 && mode != 4 && mode != 10) {
        assert(object()->owner == 0);
        assert(object()->link == ((ushort)(seed * 53) >> 6));
    }
    return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 12; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                Result reference = run(1), actual = run(0);
                if (memcmp(&reference, &actual, sizeof actual)) {
                    fprintf(stderr, "scheduler mismatch seed=%u mode=%u mutation=%u\n", seed, mode, mutation); return 1;
                }
                ++cases;
            }
    printf("%u original/current scheduler finalization cases pass\n", cases);
}

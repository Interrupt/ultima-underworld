#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][32];
unsigned char DAT_00085ac8_backing[16];
uw_light_type_props_t g_light_type_props[16];
static unsigned seed, mode, mutation, get_calls, divisions, redraws, ambient;
static uint64_t events;
static uw_object_hdr_t *current;
static short elapsed;
static byte phase;
static uw_object_hdr_t *object(unsigned i) { return (uw_object_hdr_t *)(records[i] + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof records; ++i) events = events * 31 + ((byte *)records)[i];
}
static void argument(int value) { events = events * 31 + (uint)value; }
uw_object_hdr_t *get_equipped_item_at_slot(short slot)
{
    assert(slot == (short)(2 + get_calls)); observe(1); ++get_calls;
    if ((mode == 1 && get_calls != 2) || get_calls == 4) return NULL;
    current = object(mode == 2 ? 0 : get_calls - 1);
    if (mutation) current->chain_word ^= 0xa5a5;
    return current;
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    assert(divisor != 0); observe(2); ++divisions; argument(divisor); argument(dividend);
    if (mutation) { current->type_flags ^= 0xa000; current->chain_word ^= 0x5555; }
    return (divmod_result){dividend / divisor, dividend % divisor};
}
void redraw_backpack_slot_widget(short slot)
{
    observe(3); ++redraws; argument(slot);
    if (mutation) object(1)->type_flags ^= 0x0400;
}
void set_ambient_bias_without_light(char value)
{
    assert(value == 0); observe(4); ++ambient;
    if (mutation) object(2)->chain_word ^= 0xaaaa;
}
#include "light_decay_functions.c"

struct result { byte records[96]; unsigned counts[4]; uint64_t events; int value; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(g_light_type_props, 0, sizeof g_light_type_props);
    for (unsigned i = 0; i < 4; ++i) DAT_00085ac8_backing[i] = 2 + i;
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->type_flags = i == 0 ? seed : (seed & 0xfe00) | (0x94 + i);
        object(i)->position_word = seed ^ 0xaaaa;
        object(i)->chain_word = seed; object(i)->link_word = seed ^ 0x5555;
    }
    static const byte intervals[] = {1, 2, 7, 127, 128, 255};
    for (unsigned i = 4; i < 8; ++i)
        g_light_type_props[i].decay_interval = mode == 3 ? 0 : intervals[mode];
    get_calls = divisions = redraws = ambient = 0; events = 0; current = NULL;
    struct result result = {0};
    result.value = reference ? reference_decay_equipped_light_sources(elapsed, phase)
        : decay_equipped_light_sources(elapsed, phase);
    memcpy(result.records, records, sizeof records);
    unsigned counts[] = {get_calls, divisions, redraws, ambient}; memcpy(result.counts, counts, sizeof counts);
    result.events = events; return result;
}
static void compare(void)
{
    struct result before = run(1), after = run(0);
    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
    assert(before.events == after.events && before.value == after.value);
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 6; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                elapsed = (short)(seed ^ 0x55aa); phase = seed; compare(); ++cases;
            }
    for (unsigned quality = 0; quality < 64; ++quality)
        for (unsigned ticks = 0; ticks < 257; ++ticks) {
            seed = 0xffc0 | quality; elapsed = ticks; phase = ticks; mode = 0; mutation = 0;
            compare(); ++cases;
        }
    printf("%u light-decay cases preserve records/guards, flags, returns and callbacks\n", cases);
    return 0;
}

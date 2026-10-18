#include "src/headers/uw.h"
#include <assert.h>

/* Compare the real function with its pre-conversion body, including services
   that mutate the object before the function reads it again. */
static _Alignas(8) byte records[2][24];
unsigned char DAT_00085ac8_backing[16];
#define g_light_source_slots DAT_00085ac8_backing[0]
uw_object_hdr_t *g_scratch_object_ptr;
static uw_light_type_props_t light;
static unsigned seed, variant, mode, turn_on, calls;
static uint64_t events;
static ushort *object(void) { return (ushort *)(records[0] + 4); }
static void observe(unsigned event, int argument)
{
    ++calls;
    events = events * 31 + event;
    events = events * 31 + (unsigned)argument;
    for (unsigned i = 0; i < sizeof records; ++i)
        events = events * 31 + ((byte *)records)[i];
}
int find_or_assign_object_widget(void *p)
{
    assert(p == object()); observe(1, 0);
    if (mode == 2) {
        ((uw_object_hdr_t *)p)->type_flags ^= 0xa105;
        ((uw_object_hdr_t *)p)->chain_word ^= 0x55aa;
        ((uw_object_hdr_t *)p)->link_word ^= 0xaaaa;
    }
    return mode == 0 ? 5 : 9;
}
uw_object_hdr_t *get_equipped_item_at_slot(short slot)
{
    observe(2, slot);
    if (mode == 4) return NULL;
    /* Non-null records make the decompiler's extraout_r3 scratch dead. */
    return (uw_object_hdr_t *)(slot == 6 ? (byte *)object() : records[1] + 4);
}
void decrement_object_count(ushort *p)
{
    assert(p == object()); observe(3, 0);
    if (mode == 3) p[0] ^= 0xc003;
}
int place_object_in_backpack_slot(ushort *p, short slot)
{
    assert(p == object()); observe(4, slot);
    if (mode == 3) p[0] ^= 0x3008;
    return 1;
}
void redraw_container_icon_slot(void) { observe(5, 0); }
void *get_scanned_object_class_effect_ptr(void)
{
    assert(g_scratch_object_ptr == (uw_object_hdr_t *)object());
    observe(6, 0); return &light;
}
void set_ambient_bias_with_light(char brightness) { observe(7, brightness); }
void set_ambient_bias_without_light(char value) { observe(8, value); }
void refresh_player_equipment_effects(void) { observe(9, 0); }
void redraw_backpack_slot_widget(short slot) { observe(10, slot); }
void print_scroll_message_by_id(uint id) { observe(11, id); }
#include "light_use_functions.c"

struct result { byte records[sizeof records]; unsigned calls; uint64_t events; int scratch; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records);
    ushort *p = object();
    p[0] = seed; p[1] = seed ^ 0xaaaa;
    p[2] = (seed & 0xffc0) | ((variant & 1) ? 63 : 0);
    static const ushort links[] = {0, 1, 2, 511, 512, 1023};
    p[3] = (seed & 63) | (links[variant / 2] << 6);
    for (unsigned i = 0; i < 4; ++i) DAT_00085ac8_backing[i] = 5 + i;
    light.brightness = seed;
    calls = 0; events = 0; g_scratch_object_ptr = NULL;
    if (reference) reference_use_light_source(p, turn_on);
    else use_light_source(p, turn_on);
    struct result result = {0};
    memcpy(result.records, records, sizeof records);
    result.calls = calls; result.events = events;
    result.scratch = g_scratch_object_ptr == (uw_object_hdr_t *)p;
    return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (variant = 0; variant < 12; ++variant)
            for (mode = 0; mode < 5; ++mode)
                for (turn_on = 0; turn_on < 2; ++turn_on) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
                    assert(before.calls == after.calls && before.events == after.events);
                    assert(before.scratch == after.scratch);
                    if (mode == 0) {
                        uw_object_hdr_t *header = (uw_object_hdr_t *)(after.records + 4);
                        unsigned id = seed & 511;
                        unsigned quantity_case = variant / 2;
                        int single = !(seed & 0x8000) || quantity_case == 1 || quantity_case >= 4;
                        /* Unequipped stacks of the four unlit types report an
                           error before toggling; mode 0 only has widget 5 lit. */
                        int rejected_stack = id >= 0x90 && id <= 0x93 && !single;
                        if (turn_on && (variant & 1) && !rejected_stack)
                            id += (id & 15) < 4 ? 4 : -4;
                        assert(header->object_id == id);
                        assert((header->type_flags & 0xfe00) == (seed & 0xfe00));
                        assert(header->quality == ((variant & 1) ? 63 : 0));
                    }
                    ++cases;
                }
    printf("%u light-use cases preserve records/guards, flags, quantities and callbacks\n", cases);
    return 0;
}

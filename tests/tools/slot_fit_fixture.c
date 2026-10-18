#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][40], containers[3][32], tables[2][64], status[128];
static uw_mobile_object_t player;
static uw_armor_type_props_t effect;
char *g_backpack_slot_table, *g_current_container_record, *DAT_00086df8;
uw_mobile_object_t *g_player_object;
uw_object_hdr_t *g_scratch_object_ptr;
uw_object_type_props_t g_object_type_props[512];
uw_container_type_props_t g_container_type_props[16];
unsigned char DAT_00085ac8_backing[16];
undefined1 DAT_00085c88_backing[128];
char s_UNNAMED_00084f24[] = "UNNAMED";
static char s_is_too_full__00085c78[] = " is too full.\n";
static unsigned seed, variant, slot_index, mutation, resolves, foods, effects, lights, weights, sums, names, messages, scrolls;
static uint64_t events;
static uw_object_hdr_t *object(unsigned index) { return (uw_object_hdr_t *)(records[index] + 4); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof containers; ++i) argument(((byte *)containers)[i]);
    for (unsigned i = 0; i < sizeof tables; ++i) argument(((byte *)tables)[i]);
    for (unsigned i = 0; i < sizeof status; ++i) argument(status[i]);
    argument(g_backpack_slot_table == (char *)tables[1]);
    argument(g_current_container_record == NULL ? -1 : g_current_container_record == (char *)containers[0] ? 0 : g_current_container_record == (char *)containers[1] ? 1 : 2);
    argument(g_scratch_object_ptr == object(0) ? 0 : g_scratch_object_ptr == object(1) ? 1 : 2);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    object(0)->type_flags ^= 0xab00; object(0)->link_word ^= 0x5555;
    object(1)->type_flags ^= 0x5500; object(2)->chain_word ^= 0xa5a5;
    status[100] ^= 1; g_scratch_object_ptr = object(2);
    if (kind == 1) g_backpack_slot_table = (char *)tables[1];
    if (kind == 5 && g_current_container_record) g_current_container_record = (char *)containers[2];
}
uw_object_hdr_t *resolve_object_link(ushort *link)
{
    observe(1); argument(*(ushort *)link); ++resolves;
    bool current = link == &g_current_container_link; change(1);
    if (variant == 0 || (*(ushort *)link >> 6) == 0) return NULL;
    return variant == 7 ? object(0) : object(current ? 2 : 1);
}
int use_food_item(void *actor, ushort *p, int consume)
{
    assert(actor == g_player_object && (void *)p == object(0) && consume == 0); observe(2); ++foods; change(2);
    return variant == 0 ? 0 : variant == 1 ? 1 : variant == 2 ? -1 : variant == 3 ? -32768 : (short)seed;
}
void *get_scanned_object_class_effect_ptr(void) { observe(3); ++effects; change(3); return &effect; }
void set_ambient_bias_without_light(char level)
{
    assert(level == 0); observe(4); ++lights; assert(lights == 1); change(4);
    if (mutation) object(0)->object_id = 0x100 | (seed & 63);
}
uint calculate_object_weight(uw_object_hdr_t *p)
{
    assert(p == object(0)); observe(5); ++weights; change(5); return (uint)(short)(seed * 13);
}
void sum_container_weight(ushort *link, short *weight)
{
    assert(link == &object(0)->link_word || link == &object(1)->link_word || link == &object(2)->link_word);
    observe(6); argument(*link); argument(*weight); ++sums; change(6);
    *weight = (short)(*weight + (short)(seed * 17)); *link ^= 0xaaaa;
}
int build_object_display_name(char *text, void *p, int a, int b)
{
    assert((p == object(0) || p == object(1) || p == object(2)) && a == 0 && b == 0);
    observe(7); ++names; change(7); bool empty = variant == 6 && (seed & 1) == 0;
    strcpy(text, empty ? "" : "bag"); return !empty;
}
void print_scroll_message_by_id(uint id) { observe(8); argument(id); ++messages; change(8); }
int message_scroll_print_wrapped(char *text)
{
    observe(9); ++scrolls;
    for (unsigned i = 0; text[i]; ++i) { assert(i < 128); argument((byte)text[i]); }
    change(9); return 0;
}
#include "slot_fit_functions.c"

struct result { byte records[120], containers[96], tables[128], status[128]; unsigned counts[9]; int globals[3]; uint returned; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(containers, 0, sizeof containers); memset(tables, 0, sizeof tables);
    memset(status, 0x5a, sizeof status); memset(DAT_00085ac8_backing, 0, sizeof DAT_00085ac8_backing);
    object(0)->type_flags = seed; object(0)->link_word = seed * 37; object(0)->chain_word = seed * 13;
    const unsigned quantities[] = {0,1,2,511,512,1023};
    if (variant >= 4) object(0)->link_word = (seed & 63) | (quantities[(seed >> 9) % 6] << 6);
    object(1)->object_id = variant == 1 && (seed & 1) ? 0x40 : 0x80 | (seed & 15);
    object(2)->object_id = 0x80 | ((seed >> 4) & 15);
    const short masks[] = {0,0,-1,1,0x200,0x201,0x202,0x203};
    for (unsigned i = 0; i < 16; ++i) {
        g_container_type_props[i].capacity = variant == 2 ? 0 : variant == 3 || variant == 6 ? 64 : 255;
        g_container_type_props[i].acceptance_mask = variant == 3 ? seed & 511 : masks[variant];
    }
    for (unsigned i = 0; i < 3; ++i) {
        char *previous = i < 2 && variant >= 3 ? (char *)containers[i + 1] : NULL;
        memcpy(containers[i] + 20, &previous, sizeof previous);
        ushort link = (259 + i) << 6; short weight = seed * 29 + i * 17;
        memcpy(containers[i] + 8, &link, 2); memcpy(containers[i] + 10, &weight, 2);
    }
    for (unsigned t = 0; t < 2; ++t) for (unsigned i = 0; i < 32; ++i) {
        ushort link = variant == 1 && (seed & 1) && i == 11 ? 0 : (257 << 6) | ((seed + i + t) & 63);
        memcpy(tables[t] + 2 * i, &link, 2);
    }
    byte light_slots[] = {7,8,18,20}; memcpy(DAT_00085ac8_backing, light_slots, 4);
    const byte effect_slots[] = {8,1,4,3,5,9,0,255}; effect.equipment_slot = effect_slots[seed & 7];
    DAT_00086df8 = (char *)status; status[100] = seed & 1;
    g_backpack_slot_table = (char *)tables[0]; g_current_container_record = variant == 0 ? NULL : (char *)containers[0];
    g_player_object = &player; g_scratch_object_ptr = NULL;
    resolves = foods = effects = lights = weights = sums = names = messages = scrolls = 0; events = 0;
    const int slots[] = {0,1,2,3,4,7,8,9,10,11,18,19,20,25};
    uint returned = reference ? reference_check_object_fits_in_slot((ushort *)object(0),slots[slot_index]) : check_object_fits_in_slot((ushort *)object(0),slots[slot_index]);
    assert(returned == 0 || returned == 1 || returned == 0xffffffff);
    if (lights && returned == 0 && !mutation) assert((object(0)->object_id & 15) == (seed & 15));
    if (slot_index == 11 && variant == 0) assert(returned == 0 && resolves == 0);
    if (!mutation && variant >= 4 && variant <= 6 && (seed & 511) < 16
            && slots[slot_index] == 8 - (seed & 1)) {
        unsigned quantity = quantities[(seed >> 9) % 6];
        bool blocked = (seed & 0x8000) && quantity > 1 && quantity < 512;
        assert(weights == !blocked);
        if (blocked) assert(returned == 0 && sums == 0);
    }
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.containers, containers, sizeof containers);
    memcpy(result.tables, tables, sizeof tables); memcpy(result.status, status, sizeof status);
    unsigned counts[] = {resolves, foods, effects, lights, weights, sums, names, messages, scrolls}; memcpy(result.counts, counts, sizeof counts);
    int globals[] = {g_backpack_slot_table == (char *)tables[1],
        g_current_container_record == NULL ? -1 : g_current_container_record == (char *)containers[0] ? 0 : g_current_container_record == (char *)containers[1] ? 1 : 2,
        g_scratch_object_ptr == object(0) ? 0 : g_scratch_object_ptr == object(1) ? 1 : 2}; memcpy(result.globals, globals, sizeof globals);
    result.returned = returned; result.events = events; return result;
}
int main(void)
{
    strcpy((char *)DAT_00085c88_backing, "The ");
    for (unsigned i = 0; i < 512; ++i) g_object_type_props[i].flags = i & 1 ? 0x20 : 0;
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (variant = 0; variant < 8; ++variant)
            for (slot_index = 0; slot_index < 14; ++slot_index)
                for (mutation = 0; mutation < 2; ++mutation) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
                    assert(memcmp(before.containers, after.containers, sizeof before.containers) == 0);
                    assert(memcmp(before.tables, after.tables, sizeof before.tables) == 0);
                    assert(memcmp(before.status, after.status, sizeof before.status) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                    assert(before.returned == after.returned && before.events == after.events); ++cases;
                }
    printf("%u slot-fit cases preserve stack gates, recursive IDs, container swaps and callbacks\n", cases);
    return 0;
}

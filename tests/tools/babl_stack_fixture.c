#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[6][40];
static short slots[8], arguments[4];
uw_mobile_object_t *DAT_00100674;
char *g_selected_object;
static unsigned seed, mode, mutation, which, counts[11], saved_next, target_owner, target_next, freed;
static int value_returned, slot_arg, side_arg, last_encoded;
static uw_object_hdr_t *fresh, *target;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static uw_object_hdr_t *header(unsigned i) { return &object(i)->hdr; }
static unsigned index_of(const void *p)
{
    for (unsigned i = 0; i < 6; ++i) if (p == header(i)) return i;
    assert(p == NULL); return 6;
}
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); ++counts[kind];
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < 8; ++i) argument(slots[i]);
    for (unsigned i = 0; i < 4; ++i) argument(arguments[i]);
    argument(index_of(DAT_00100674)); argument(index_of(g_selected_object)); argument(freed);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    for (unsigned i = 0; i < 6; ++i) {
        header(i)->type_flags ^= 0x100; header(i)->position_word ^= 0x5555;
        header(i)->quality ^= 0x15; header(i)->owner ^= 0x2a;
        if (i >= 2) header(i)->link ^= 0x20;
        if (kind == 3 && i == 3 && (seed & 1)) header(i)->is_quant ^= 1;
    }
    if (kind == 2) DAT_00100674 = object(0);
    if (kind >= 3 && kind <= 5) DAT_00100674 = object(1);
    if (kind == 4) g_selected_object = (char *)header(5);
    if (kind == 7) g_selected_object = (char *)header(4);
    if (kind == 8) g_selected_object = (char *)header(3);
    if (kind == 4 || kind == 7 || kind == 8) slots[2 + (seed & 3)] ^= 0x55;
    if (kind == 1) arguments[1] ^= 0x5555;
}
int babl_read_var_word(short index)
{
    assert(index == (short)seed); observe(1); argument(index); change(1); return value_returned;
}
uw_object_hdr_t *spawn_new_object(uint id, int region)
{
    assert(id == (uint)value_returned && region == 0); observe(2); argument(id); change(2);
    saved_next = fresh->next; return mode == 0 ? NULL : fresh;
}
uw_object_hdr_t *resolve_object_link(ushort *head)
{
    if (counts[3] == 0) assert(fresh->quality == 63 && fresh->next == saved_next);
    assert(++counts[0] <= 3);
    int selected = *head >> 6; unsigned cursor = 99;
    for (unsigned i = 0; i < 6; ++i) {
        if (head == &header(i)->link_word) cursor = i * 2;
        if (head == &header(i)->chain_word) cursor = i * 2 + 1;
    }
    assert(cursor != 99); observe(3); argument(cursor); argument(selected); change(3);
    target = selected == 3 || selected == 4 ? header(selected) : NULL;
    if (target) { target_owner = target->owner; target_next = target->next; }
    return target;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    assert(slot == (mode == 12 ? 4 : 3)); observe(4); argument(slot); change(4);
    target = header(slot); target_owner = target->owner; target_next = target->next; return target;
}
void free_object_slot(uw_object_hdr_t *p)
{
    assert(p == fresh && target && target->owner == target_owner && target->next == target_next);
    if (!mutation && mode == 9) assert(target->link == 998);
    observe(5); argument(index_of(p)); freed |= 1U << index_of(p); change(5);
}
void object_list_insert_head(ushort *head, uw_object_hdr_t *p)
{
    assert(head == &DAT_00100674->hdr.link_word && p == fresh); observe(6); argument(index_of(p));
    p->next = *head >> 6; *head = (*head & 63) | (index_of(p) << 6); change(6);
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    observe(7); argument(index_of(p)); last_encoded = p ? index_of(p) + (mode == 15 ? 65536 : 0) : 0;
    change(7); return last_encoded;
}
void pick_up_barter_slot_item(short slot, char *array, int all)
{
    assert(slot == (short)slot_arg && array == (char *)&slots[2] && all == 0); observe(8); change(8);
}
void redraw_barter_slot_icon(short side, short slot)
{
    assert(side == (short)side_arg && slot == (short)slot_arg);
    if (counts[8]) assert(slots[2 + (seed & 3)] == (short)last_encoded);
    observe(9); change(9);
}
int debug_noop_checkpoint(void) { observe(10); change(10); return -1; }
#include "babl_stack_functions.c"

struct result { byte records[240]; short slots[8], arguments[4]; unsigned counts[11], freed, npc, selected; int returned, last_encoded; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records);
    for (unsigned i = 0; i < 6; ++i) {
        header(i)->type_flags = (seed & 0xfe00) | 0x80a1; header(i)->position_word = seed * 37 + i * 19;
        header(i)->chain_word = seed * 11 + i * 37; header(i)->link_word = seed * 53 + i * 17;
    }
    fresh = header(mode == 13 ? 3 : mode == 14 ? 1 : 2);
    header(0)->link = 3; header(1)->link = 4; header(3)->next = 4; header(4)->next = 0;
    if (mode == 1) fresh->is_quant = 0;
    if (mode == 2) { header(3)->is_quant = 0; header(4)->is_quant = 0; }
    if (mode == 3) fresh->link = 512;
    if (mode == 4) { header(0)->link = 0; header(1)->link = 0; }
    if (mode == 6) { header(3)->link = 512; header(4)->link = 512; }
    if (mode == 7) { header(3)->object_id = 0xa2; header(4)->object_id = 0xa2; }
    if (mode == 8) header(3)->object_id = 0x80;
    if (mode == 9 || mode == 10 || mode == 11) {
        fresh->link = mode == 11 ? 500 : 499; header(3)->link = mode == 9 ? 499 : 500;
        header(4)->link = header(3)->link;
    }
    if (mode == 12) { header(3)->object_id = 0xa2; fresh->link = 2; header(4)->link = 3; }
    if (mode == 15) fresh->object_id = 0x1a1;
    for (unsigned i = 0; i < 8; ++i) slots[i] = seed + i * 37;
    for (unsigned i = 0; i < 4; ++i) arguments[i] = seed + i * 13;
    arguments[1] = seed; slots[2 + (seed & 3)] = mode == 12 ? 4 : 3;
    DAT_00100674 = object(0); g_selected_object = (char *)header(2);
    value_returned = mode == 15 ? -1 : (short)(seed ^ 0xa555);
    slot_arg = (mode == 14 ? 65536 : 0) + (seed & 3); side_arg = mode & 1 ? -1 : 65537;
    memset(counts, 0, sizeof counts); events = 0; freed = 0; last_encoded = 0; target = NULL;
    int returned;
    if (which == 0) returned = reference ? reference_babl_builtin_do_inv_create((char *)&arguments[2]) : babl_builtin_do_inv_create((char *)&arguments[2]);
    else returned = reference ? reference_merge_or_swap_barter_slot_item((ushort *)fresh,side_arg,slot_arg,&slots[2]) : merge_or_swap_barter_slot_item((ushort *)fresh,side_arg,slot_arg,&slots[2]);
    if (which == 0 && mode == 0) assert(returned == 0 && !counts[3] && !counts[5] && !counts[6] && !counts[7]);
    if (!mutation && mode == 9) assert(counts[5] == 1 && !counts[6] && !counts[8] && returned == (int)which);
    if (!mutation && (mode == 10 || mode == 11)) assert(!counts[5] && counts[which ? 8 : 6] == 1);
    if (!mutation && which == 1 && mode == 8) assert(returned == 0 && !counts[5] && !counts[7] && !counts[8] && !counts[9] && !counts[10]);
    struct result out = {0}; memcpy(out.records, records, sizeof records); memcpy(out.slots, slots, sizeof slots);
    memcpy(out.arguments, arguments, sizeof arguments); memcpy(out.counts, counts, sizeof counts);
    out.freed = freed; out.npc = index_of(DAT_00100674); out.selected = index_of(g_selected_object);
    out.returned = returned; out.last_encoded = last_encoded; out.events = events; return out;
}
int main(void)
{
    _Static_assert(sizeof(intptr_t) == sizeof DAT_00100674, "legacy NPC pointer cell width");
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 16; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (which = 0; which < 2; ++which) {
                    struct result before = run(1), after = run(0);
                    if (memcmp(&before, &after, sizeof before)) {
                        fprintf(stderr,"BABL stack mismatch seed=%u mode=%u mutation=%u function=%u\n",seed,mode,mutation,which); return 1;
                    }
                    ++cases;
                }
    printf("%u BABL inventory/barter cases preserve quantities, owner bits, traversal and callbacks\n", cases);
}

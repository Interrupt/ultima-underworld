#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[8][40];
static short offers[4];
static uint included[4], backgrounds[4];
#define DAT_000bbfd0 offers[0]
#define DAT_000bbf98 included[0]
#define DAT_000bc028 backgrounds[0]
uw_mobile_object_t *DAT_00100674;
static unsigned seed, mode, mutation, counts[11], active_slot, processed, accepted, freed, target_owner, target_next;
static uw_object_hdr_t *source_object, *target;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static uw_object_hdr_t *header(unsigned i) { return &object(i)->hdr; }
static unsigned index_of(const void *p) { for (unsigned i = 0; i < 8; ++i) if (p == header(i)) return i; assert(!p); return 8; }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); ++counts[kind]; argument(index_of(DAT_00100674));
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < 4; ++i) { argument(offers[i]); argument(included[i]); argument(backgrounds[i]); }
    argument(active_slot); argument(freed);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    for (unsigned i = 0; i < 8; ++i) {
        header(i)->type_flags ^= 0x2000; header(i)->position_word ^= 0x5555;
        header(i)->quality ^= 0x15; header(i)->owner ^= 0x2a; if (i >= 2) header(i)->link ^= 0x20;
    }
    if (kind == 3) DAT_00100674 = object(0);
    if (kind == 4 || kind == 5 || kind == 7) DAT_00100674 = object(1);
    if (kind == 2 && active_slot < 3) {
        unsigned j = active_slot + 1;
        while (j < 4 && offers[j] <= 0) ++j;
        if (j < 4) { short tmp = offers[active_slot]; offers[active_slot] = offers[j]; offers[j] = tmp; }
    }
    if (kind == 7) { offers[active_slot] = 32767; included[active_slot] = 123; backgrounds[active_slot] ^= 0xa5; }
}
void decrement_cursor_hide_depth(void) { observe(1); change(1); }
int check_npc_item_preference(short id)
{
    active_slot = 4; for (unsigned i = 0; i < 4; ++i) if (offers[i] == id) { active_slot = i; break; }
    assert(active_slot < 4); observe(2); change(2);
    int result = mode == 5 ? -1 : mode == 7 ? 65535 : mode == 8 ? 65536 : mode == 14 ? -32768 : 0;
    if ((short)result != -1) ++accepted;
    return result;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    assert(slot == offers[active_slot] && slot >= 2 && slot < 8); observe(3); argument(slot); change(3);
    source_object = header(slot); return source_object;
}
uw_object_hdr_t *resolve_object_link(ushort *head)
{
    assert(counts[4] < 24); int index = *head >> 6, cursor = -1;
    for (unsigned i = 0; i < 8; ++i) {
        if (head == &header(i)->link_word) cursor = i * 2;
        if (head == &header(i)->chain_word) cursor = i * 2 + 1;
    }
    assert(cursor >= 0 && (index == 0 || (index >= 2 && index < 8)));
    observe(4); argument(cursor); argument(index); change(4); target = index ? header(index) : NULL;
    if (target) { target_owner = target->owner; target_next = target->next; }
    return target;
}
void free_object_slot(uw_object_hdr_t *p)
{
    assert(p == source_object && target && target->owner == target_owner && target->next == target_next);
    if (!mutation && mode == 9) assert(target->link == 998);
    observe(5); argument(index_of(p)); freed |= 1U << index_of(p); change(5);
}
void object_list_insert_head(ushort *head, uw_object_hdr_t *p)
{
    assert(head == &DAT_00100674->hdr.link_word && p == source_object); observe(6); argument(index_of(p));
    p->next = *head >> 6; *head = (*head & 63) | (index_of(p) << 6); change(6);
}
int restore_captured_grtile_backdrop(uint key)
{
    assert(key == backgrounds[active_slot]); observe(7); argument(key); processed |= 1U << active_slot; change(7); return -1;
}
void draw_hotspot_crosshair_marker(short side, short slot)
{
    assert(side == 1 && slot == active_slot && !offers[slot] && !included[slot]); observe(8); argument(slot); change(8);
}
int cursor_show_idle_tick(void) { observe(9); change(9); return 0; }
int debug_noop_checkpoint(void) { observe(10); change(10); return 0; }
#include "barter_finalize_functions.c"

struct result { byte records[320]; short offers[4]; uint included[4], backgrounds[4]; unsigned counts[11], npc, freed, processed; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records);
    for (unsigned i = 0; i < 8; ++i) {
        header(i)->type_flags = (seed & 0xfe00) | 0x80a1; header(i)->position_word = seed * 37 + i * 19;
        header(i)->chain_word = seed * 11 + i * 37; header(i)->link_word = seed * 53 + i * 17;
        if (mode == 2 && i != 3 && i != 4) header(i)->object_id = 0x90;
        if (mode == 3 && i != 3 && i != 4) header(i)->is_quant = 0;
        if (mode == 4 && (i == 3 || i == 4)) header(i)->is_quant = 0;
        if (mode == 11 && (i == 3 || i == 4)) header(i)->object_id = 0xa2;
        if (mode == 14 && (i == 3 || i == 4)) header(i)->object_id = 0x1a1;
        if (mode == 12) header(i)->link = 512;
    }
    header(0)->link = mode == 4 ? 0 : 3; header(1)->link = 4; header(3)->next = 4; header(4)->next = 0;
    const short ids[] = {2,5,6,7};
    for (unsigned i = 0; i < 4; ++i) {
        offers[i] = mode == 0 ? 0 : mode == 1 ? -1 : ids[i]; included[i] = mode == 13 ? (seed >> i) & 1 : 1U << (seed & 31);
        backgrounds[i] = seed * 37 + i * 17;
    }
    if (mode == 9 || mode == 10 || mode == 15) {
        for (unsigned i = 1; i < 4; ++i) offers[i] = 0;
        if (mode == 15) offers[0] = 3;
        else { header(2)->link = 499; header(3)->link = mode == 9 ? 499 : 500; header(4)->link = header(3)->link; }
    }
    DAT_00100674 = object(0); memset(counts, 0, sizeof counts); events = 0;
    active_slot = 4; processed = accepted = freed = 0; source_object = target = NULL;
    if (reference) reference_finalize_player_barter_items(); else finalize_player_barter_items();
    assert(counts[1] == 1 && counts[9] == 1 && counts[10] == 1);
    assert(counts[3] == accepted && counts[7] == accepted && counts[8] == accepted);
    for (unsigned i = 0; i < 4; ++i) if (processed & (1U << i)) assert(!offers[i] && !included[i]);
    if (mode == 0 || mode == 1 || mode == 5 || mode == 7) assert(!counts[3] && !counts[5] && !counts[6]);
    if (!mutation && mode == 9) assert(counts[5] == 1 && !counts[6]);
    if (!mutation && mode == 10) assert(!counts[5] && counts[6] == 1);
    struct result out = {0}; memcpy(out.records, records, sizeof records); memcpy(out.offers, offers, sizeof offers);
    memcpy(out.included, included, sizeof included); memcpy(out.backgrounds, backgrounds, sizeof backgrounds); memcpy(out.counts, counts, sizeof counts);
    out.npc = DAT_00100674 == object(1); out.freed = freed; out.processed = processed; out.events = events; return out;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed) for (mode = 0; mode < 16; ++mode) for (mutation = 0; mutation < 2; ++mutation) {
        struct result expected = run(1), actual = run(0);
        if (memcmp(&expected, &actual, sizeof actual)) { fprintf(stderr,"finalize mismatch seed=%u mode=%u mutation=%u\n",seed,mode,mutation); return 1; }
        ++cases;
    }
    printf("%u barter-finalization cases preserve quantities, lists, slot clearing and callbacks\n", cases);
}

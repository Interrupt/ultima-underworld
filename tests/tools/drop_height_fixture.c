#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][96], shadow[64], last_local[64], last_scratch[64];
static byte *local_record;
byte *DAT_00202c6c;
uw_object_type_props_t g_object_type_props[512];
static unsigned seed, mode, mutation, alias, encodes, projections, envelopes, fields, sorts;
static uint64_t events;
static uw_projectile_object_t *object(unsigned index) { return (uw_projectile_object_t *)(records[index] + 8); }
static void argument(int value) { events = events * 31 + (uint)value; }
static int scratch_index(void)
{
    return DAT_00202c6c == local_record ? 0 : DAT_00202c6c == shadow ? 1 : DAT_00202c6c == (byte *)object(0) ? 2 : 3;
}
static void observe(unsigned kind)
{
    argument(kind); argument(scratch_index());
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < 64; ++i) { argument(local_record[i]); argument(DAT_00202c6c[i]); argument(shadow[i]); }
}
static void change(unsigned kind)
{
    if (!mutation) return;
    object(0)->hdr.type_flags ^= 0x5555; object(0)->hdr.position_word ^= 0xa5a5;
    object(0)->tile_position ^= 0xaaaa; object(0)->fine_heading ^= 0x1f;
    object(1)->hdr.type_flags ^= 0xaaaa;
    shadow[4] ^= 0x5a; local_record[6] ^= 0xa5;
    argument(kind);
}
static void redirect(unsigned kind)
{
    if ((mode == 6 && kind == 2) || (mode == 7 && kind == 3) || (mode == 8 && kind == 4) ||
        ((mode == 9 || mode == 14) && kind == 5)) DAT_00202c6c = shadow;
    if ((mode == 10 && kind == 2) || (mode == 12 && kind == 3) || (mode == 13 && kind == 5))
        DAT_00202c6c = (byte *)object(0);
    if (mode == 11 && kind == 2) DAT_00202c6c = (byte *)object(0) + 20;
}
static void snapshot(void)
{
    memcpy(last_local, local_record, 64); memcpy(last_scratch, DAT_00202c6c, 64);
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p == &object(0)->hdr); local_record = DAT_00202c6c; memset(local_record, 0x3c, 64);
    observe(1); ++encodes; change(1); return 0x10000 | seed;
}
void project_position_by_heading(int heading, short distance, void *x, void *y)
{
    assert(x == DAT_00202c6c && y == DAT_00202c6c + 2 && distance >= 4 && distance <= 18);
    observe(2); argument(heading); argument(distance); argument(*(short *)x); argument(*(short *)y); ++projections;
    short new_x = seed * 37, new_y = seed * 13; memcpy(x, &new_x, 2); memcpy(y, &new_y, 2);
    change(2); redirect(2);
}
void collision_height_envelope(int shape, int collision)
{
    assert(shape == 0 && collision == 1); observe(3); ++envelopes; change(3); redirect(3);
    ushort a = mode == 1 ? 0x300 : 0, b = mode == 2 ? 0x300 : 0;
    memcpy(local_record + 12, &a, 2); memcpy(local_record + 14, &b, 2);
}
void collision_build_height_field(uint limit)
{
    assert(limit == 0); observe(4); ++fields; change(4); redirect(4);
    DAT_00202c6c[20] = mode == 3 || mode == 4 || mode == 9 || mode == 13 || mode == 14 || mode == 15;
    DAT_00202c6c[21] = mode == 4 || mode == 5;
    snapshot();
}
void sort_collision_candidates(void)
{
    observe(5); ++sorts; change(5); redirect(5);
    DAT_00202c6c[21] = mode == 4 || mode == 9;
    if (mode == 15) { ushort flags = 0x300; memcpy(local_record + 12, &flags, 2); }
    snapshot();
}
#include "drop_height_functions.c"

struct result { byte records[192], shadow[64], local[64], scratch[64]; unsigned counts[5]; int returned, scratch_index; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(shadow, 0x5a, sizeof shadow);
    memset(last_local, 0, sizeof last_local); memset(last_scratch, 0, sizeof last_scratch);
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.type_flags = seed ^ (i * 0x5555); object(i)->hdr.position_word = seed + i * 19;
        object(i)->tile_position = seed * 37 + i * 17; object(i)->fine_heading = seed + i * 13;
    }
    ushort x = seed * 17, y = seed * 29; memcpy(shadow, &x, 2); memcpy(shadow + 2, &y, 2);
    encodes = projections = envelopes = fields = sorts = 0; events = 0; local_record = DAT_00202c6c = NULL;
    ushort *p = (ushort *)object(0), *q = (ushort *)object(alias ? 0 : 1);
    int returned = reference ? reference_check_object_drop_height(p,q) : check_object_drop_height(p,q);
    assert(encodes == 1 && projections == 1 && envelopes == 1 && fields == 1);
    if (mode == 1 || mode == 2 || mode == 4 || mode == 9) assert(returned == 0);
    if (mode == 0 || mode == 3 || mode == 5 || mode == 14 || mode == 15) assert(returned == 1);
    assert(sorts == (mode == 3 || mode == 4 || mode == 9 || mode == 13 || mode == 14 || mode == 15));
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.shadow, shadow, sizeof shadow);
    memcpy(result.local, last_local, 64);
    memcpy(result.scratch, DAT_00202c6c == local_record ? last_scratch : DAT_00202c6c, 64);
    unsigned counts[] = {encodes, projections, envelopes, fields, sorts}; memcpy(result.counts, counts, sizeof counts);
    result.returned = returned; result.scratch_index = scratch_index(); result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (unsigned i = 0; i < 512; ++i) { g_object_type_props[i].collision_radius = i & 7; g_object_type_props[i].height = i * 13; }
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 16; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (alias = 0; alias < 2; ++alias) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
                    assert(memcmp(before.shadow, after.shadow, sizeof shadow) == 0);
                    assert(memcmp(before.local, after.local, 64) == 0);
                    assert(memcmp(before.scratch, after.scratch, 64) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(before.returned == after.returned && before.scratch_index == after.scratch_index && before.events == after.events); ++cases;
                }
    printf("%u drop-height cases preserve guarded coordinates, scratch aliases and collision callbacks\n", cases);
    return 0;
}

#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte record[32], args[32];
static short variables[16];
uw_object_type_props_t g_object_type_props[512];
static unsigned seed, aliases, mutation, operation, addresses, reads, lookups;
static uint64_t events;
static uw_object_hdr_t *object(void) { return (uw_object_hdr_t *)(record + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof record; ++i) events = events * 31 + record[i];
    for (unsigned i = 0; i < sizeof variables; ++i) events = events * 31 + ((byte *)variables)[i];
}
intptr_t babl_var_word_addr(short index)
{
    assert(index == (short)addresses && index < 7); observe(1); ++addresses;
    if (mutation) { object()->type_flags ^= 0x5555; variables[index] ^= 0x3333; }
    if (aliases == 1) return (intptr_t)&variables[0];
    if (aliases == 2) return (intptr_t)((byte *)object() + 2 * (index % 4));
    if (aliases == 3) return (intptr_t)&variables[index % 2];
    return (intptr_t)&variables[index];
}
int babl_read_var_word(short index)
{
    assert(index == 8 || index == 9); observe(2); ++reads;
    if (mutation) { object()->position_word ^= 0xa5a5; variables[2] ^= 0x5555; }
    return index == 8 ? 37 : operation ? (short)(seed | 1) : 0;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    assert(slot == 37); observe(3); ++lookups;
    if (mutation) { object()->link_word ^= 0xaaaa; variables[4] ^= 0xa5a5; }
    return object();
}
#include "babl_stuff_functions.c"

struct result { byte record[32], args[32]; short variables[16]; unsigned counts[3]; uint64_t events; };
static struct result run(int reference)
{
    memset(record, 0xa5, sizeof record); memset(args, 0x3c, sizeof args);
    object()->type_flags = seed; object()->position_word = seed * 37;
    object()->chain_word = seed * 13; object()->link_word = seed * 17;
    for (unsigned i = 0; i < 16; ++i) variables[i] = seed ^ (i * 0x5555);
    if (aliases == 4)
        for (unsigned i = 0; i < 7; ++i) if (seed & (1 << i)) variables[i] = -1;
    for (unsigned i = 0; i < 7; ++i) {
        short index = i; memcpy(args + 6 + 2 * i, &index, 2);
    }
    short slot_index = 8, operation_index = 9;
    memcpy(args + 2, &slot_index, 2); memcpy(args + 4, &operation_index, 2);
    addresses = reads = lookups = 0; events = 0;
    if (reference) reference_babl_builtin_x_obj_stuff((char *)args + 20);
    else babl_builtin_x_obj_stuff((char *)args + 20);
    assert(addresses == 7 && reads == 2 && lookups == 1);
    struct result result = {0}; memcpy(result.record, record, sizeof record); memcpy(result.args, args, sizeof args);
    memcpy(result.variables, variables, sizeof variables);
    result.counts[0] = addresses; result.counts[1] = reads; result.counts[2] = lookups; result.events = events;
    return result;
}
int main(void)
{
    unsigned cases = 0;
    for (unsigned i = 0; i < 512; ++i) g_object_type_props[i].class_flags = i & 3;
    for (seed = 0; seed < 65536; ++seed)
        for (aliases = 0; aliases < 5; ++aliases)
            for (mutation = 0; mutation < 2; ++mutation)
                for (operation = 0; operation < 2; ++operation) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.record, after.record, sizeof record) == 0);
                    assert(memcmp(before.args, after.args, sizeof args) == 0);
                    assert(memcmp(before.variables, after.variables, sizeof variables) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(before.events == after.events); ++cases;
                }
    printf("%u BABL header cases preserve getter values, setter bits, aliasing and callbacks\n", cases);
    return 0;
}

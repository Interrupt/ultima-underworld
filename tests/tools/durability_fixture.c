#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte record[40], actor[40];
uw_object_type_props_t g_object_type_props[512];
static unsigned seed, route, mutation, arena_calls, trap_calls;
static uint64_t events;
static short damage;
static int tile_x;
static uw_object_hdr_t *header(void) { return (uw_object_hdr_t *)(record + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof record; ++i) events = events * 31 + record[i];
    for (unsigned i = 0; i < sizeof actor; ++i) events = events * 31 + actor[i];
}
int object_is_mobile(const uw_object_hdr_t *object)
{
    assert(object == header()); ++arena_calls; observe(1);
    if (mutation) {
        header()->chain_word ^= 0xa5a5;
        header()->link_word ^= 0x5555;
        ((uw_mobile_object_t *)header())->hit_points ^= 0x5a;
    }
    return route == 2 || route == 7;
}
void trigger_object_trap_or_use_action(void *attacker, void *object, int action, int x, short y)
{
    assert(attacker == actor + 4 && object == header());
    assert(action == 4 && x == tile_x && y == -13);
    ++trap_calls; observe(2);
    if (mutation) header()->type_flags ^= 0xaaaa;
}
#include "durability_functions.c"

struct result { byte record[40], actor[40]; unsigned arena, trap; uint64_t events; bool value; };
static struct result run(int reference)
{
    memset(record, 0xa5, sizeof record); memset(actor, 0x5a, sizeof actor);
    memset(g_object_type_props, 0, sizeof g_object_type_props);
    header()->type_flags = seed;
    header()->object_id = route == 1 ? 0x140 + (seed & 7) : route == 6 ? 0x13f : 0x50;
    header()->doordir = route == 3;
    header()->chain_word = seed;
    header()->link_word = seed;
    ((uw_mobile_object_t *)header())->hit_points = seed;
    g_object_type_props[header()->object_id].quality_flags = route == 4 ? 12 : (seed & 3) << 2;
    arena_calls = trap_calls = 0; events = 0;
    struct result result = {0};
    result.value = reference ? reference_apply_object_durability_damage((ushort *)header(), (ushort *)(actor+4), damage, tile_x, -13)
        : apply_object_durability_damage((ushort *)header(), (ushort *)(actor+4), damage, tile_x, -13);
    memcpy(result.record, record, sizeof record); memcpy(result.actor, actor, sizeof actor);
    result.arena = arena_calls; result.trap = trap_calls; result.events = events;
    return result;
}
static void compare(void)
{
    struct result before = run(1), after = run(0);
    assert(memcmp(before.record, after.record, sizeof record) == 0);
    assert(memcmp(before.actor, after.actor, sizeof actor) == 0);
    assert(before.arena == after.arena && before.trap == after.trap);
    assert(before.events == after.events && before.value == after.value);
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (route = 0; route < 8; ++route)
            for (mutation = 0; mutation < 2; ++mutation) {
                damage = (short)(seed ^ 0x55aa); tile_x = route == 5 ? -1 : 17;
                compare(); ++cases;
            }
    /* Independent small damage/quality combinations cover depletion edges. */
    for (unsigned quality = 0; quality < 64; ++quality)
        for (unsigned amount = 0; amount < 256; ++amount)
            for (route = 0; route < 8; ++route) {
                seed = 0xffc0 | quality; damage = amount; mutation = 0;
                tile_x = route == 5 ? -1 : 17; compare(); ++cases;
            }
    printf("%u durability cases preserve header/extension/guard bytes, returns and callbacks\n", cases);
    return 0;
}

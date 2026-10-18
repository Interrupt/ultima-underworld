#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40], players[2][40];
uw_mobile_object_t *DAT_0010190c, *g_player_object;
undefined4 DAT_00101734_backing[1];
short DAT_00101444, DAT_00101448;
undefined1 DAT_0023bf0c;
static unsigned seed, mode, mutation, alias, refreshes, detects, randoms, headings, cursors, talks;
static uint64_t events;
static uw_mobile_object_t *object(unsigned index) { return (uw_mobile_object_t *)(records[index] + 4); }
static uw_mobile_object_t *player(unsigned index) { return (uw_mobile_object_t *)(players[index] + 4); }
static int player_index(void)
{
    return g_player_object == player(0) ? 0 : g_player_object == player(1) ? 1 : g_player_object == object(0) ? 2 : 3;
}
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind);
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof players; ++i) argument(((byte *)players)[i]);
    argument(DAT_0010190c == object(1)); argument(player_index()); argument(DAT_00101734);
    argument(DAT_00101444); argument(DAT_00101448); argument(DAT_0023bf0c);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    if (kind == 1 || kind == 3) DAT_0010190c = object(kind == 1);
    if (kind == 4 || kind == 5) { DAT_0010190c = object(1); g_player_object = player(1); }
    DAT_0010190c->goal_word ^= 0xa5a5; DAT_0010190c->hdr.position_word ^= 0x5555;
    DAT_0010190c->motion_flags ^= 0xaa; DAT_0010190c->attack_pitch ^= 0x5a;
    DAT_0010190c->heading_flags ^= 0xa5; DAT_0010190c->full_heading ^= 0x55;
    DAT_0010190c->animation_flags ^= 0x33; g_player_object->hdr.position_word ^= 0xaaaa;
}
int refresh_npc_target_delta(void)
{
    assert(DAT_0010190c->npc_gtarg == 1); observe(1); ++refreshes; change(1);
    const short deltas[][2] = {{0,0},{0,0},{11,4},{12,0},{19,6},{20,0},{19,7},{0,0},{0,0},
        {-11,-4},{-20,0},{256,0},{257,0},{32767,0},{-32768,0}};
    DAT_00101444 = mode < 15 ? deltas[mode][0] : mode == 15 ? (short)seed : 0;
    DAT_00101448 = mode < 15 ? deltas[mode][1] : 0;
    return mode & 1;
}
int detect_npc_wander_proximity(void *near, void *far)
{
    observe(2); ++detects; change(2);
    byte values[] = {seed, seed >> 8, seed ^ 0xa5}; memcpy(near, values, 3); *(byte *)far = seed ^ 0x5a;
    if (mutation) { DAT_00101444 ^= 0x55aa; DAT_00101448 ^= 0x33cc; }
    return mode == 7 ? 1 : mode == 16 ? 257 : mode == 17 ? -255 : mode == 18 ? 256 : mode == 19 ? -1 : 0;
}
long ce_rand(void)
{
    observe(3); ++randoms; change(3);
    return mode == 20 || mode == 23 ? 0 : mode == 21 ? -1 : mode == 22 ? -2 : (short)(seed * 37 + 13);
}
int compute_movement_heading(int dx, int dy)
{
    observe(4); argument(dx); argument(dy); ++headings; change(4);
    return mode == 23 ? 3 : mode == 24 ? 65535 : mode == 25 ? -65533 : (short)(seed ^ 0xa555);
}
void reset_cursor_confine_rect(void)
{
    assert(DAT_0023bf0c == 0); observe(5); ++cursors; change(5);
}
void attempt_talk_interaction(void *target)
{
    assert(target == DAT_0010190c); observe(6); ++talks; argument(target == object(1)); change(6);
}
#include "disengage_functions.c"

struct result { byte records[80], players[80]; unsigned counts[6]; int globals[6]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(players, 0x5a, sizeof players);
    for (unsigned i = 0; i < 2; ++i) {
        object(i)->hdr.position_word = seed + i * 19; object(i)->goal_word = seed * 37 + i * 17;
        object(i)->motion_flags = seed + i * 13; object(i)->attack_pitch = seed * 13 + i * 17;
        object(i)->heading_flags = seed * 17 + i * 19; object(i)->full_heading = (seed >> 8) + i * 37;
        object(i)->animation_flags = seed * 7 + i * 11; player(i)->hdr.position_word = seed * 13 + i * 17;
        if (mode == 23) player(i)->hdr.heading = 7;
    }
    DAT_0010190c = object(0); g_player_object = alias ? object(0) : player(0);
    DAT_00101734 = mode != 0; DAT_00101444 = (short)seed; DAT_00101448 = (short)(seed ^ 0xaaaa);
    DAT_0023bf0c = seed; refreshes = detects = randoms = headings = cursors = talks = 0; events = 0;
    unsigned goal = object(0)->npc_goal, frame = object(0)->npc_animation_frame;
    if (reference) reference_npc_combat_disengage_tick(); else npc_combat_disengage_tick();
    assert(refreshes == (mode != 0) && detects == refreshes && randoms == refreshes && cursors == talks);
    if (!mutation && mode != 0) {
        int odd = mode == 20 || mode == 22 || mode == 23 ? 0 : mode == 21 ? 1 : ((short)(seed * 37 + 13) % 2 != 0);
        assert(object(0)->npc_goal == goal && object(0)->npc_gtarg == 1);
        assert(object(0)->npc_animation_frame == (odd ? (frame + 1) % 4 : frame));
        if (mode == 23 && !alias) assert(talks == 1);
        if (mode == 5 || mode == 7 || mode == 10 || mode == 12 || mode == 16 || mode == 17) assert(headings == 0);
        if (mode == 1 || mode == 2 || mode == 3 || mode == 4 || mode == 9 || mode == 11 || mode == 13 || mode == 14) assert(headings == 1);
    }
    struct result result = {0}; memcpy(result.records, records, sizeof records); memcpy(result.players, players, sizeof players);
    unsigned counts[] = {refreshes, detects, randoms, headings, cursors, talks}; memcpy(result.counts, counts, sizeof counts);
    int globals[] = {DAT_0010190c == object(1), player_index(), DAT_00101734, DAT_00101444, DAT_00101448, DAT_0023bf0c};
    memcpy(result.globals, globals, sizeof globals); result.events = events; return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 26; ++mode)
            for (mutation = 0; mutation < 2; ++mutation)
                for (alias = 0; alias < 2; ++alias) {
                    struct result before = run(1), after = run(0);
                    assert(memcmp(before.records, after.records, sizeof before.records) == 0);
                    assert(memcmp(before.players, after.players, sizeof before.players) == 0);
                    assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                    assert(memcmp(before.globals, after.globals, sizeof before.globals) == 0);
                    assert(before.events == after.events); ++cases;
                }
    printf("%u disengagement cases preserve targets, frames, distance snapshots and talk callbacks\n", cases);
    return 0;
}

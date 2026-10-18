#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte record[40], player[40], selected[32], status[256];
uw_mobile_object_t *g_player_object = (uw_mobile_object_t *)(player + 4);
char *DAT_00086df8 = (char *)status;
undefined1 DAT_00204880_backing[128];
char *g_selected_object;
undefined2 g_cursor_holding_state;
short DAT_00201b68;
code *DAT_00201c9c;
static byte DAT_00085730;
static unsigned seed, mode, mutation, random_calls, spawns;
static uint64_t events;
static uw_object_hdr_t *object(void) { return (uw_object_hdr_t *)(record + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof record; ++i) events = events * 31 + record[i];
    for (unsigned i = 0; i < sizeof player; ++i) events = events * 31 + player[i];
    for (unsigned i = 0; i < sizeof status; ++i) events = events * 31 + status[i];
    events = events * 31 + g_cursor_holding_state;
    events = events * 31 + (g_selected_object != NULL);
    events = events * 31 + DAT_00085730;
    events = events * 31 + (DAT_00201c9c != NULL);
}
static void argument(int value) { events = events * 31 + (uint)value; }
void stop_current_audio_handle_dup(void) { observe(1); }
int play_music_track(byte track, int flags) { assert(track == 10 && flags == 1); observe(2); return 0; }
void grant_experience_points(short value) { observe(3); argument(value); }
void full_dungeon_redraw(void) { observe(4); }
void weapon_overlay_flash_hold(int value) { assert(value == 5); observe(5); }
void cancel_weapon_swing(void) { observe(6); }
int drop_object_near_target(void *actor, void *held, short kind, uint flags)
{ assert(actor == g_player_object && held == selected + 4 && kind == 6 && flags == 0); observe(7); return 1; }
void pop_cursor_icon(ushort flags) { assert(flags == 3); observe(8); }
long ce_rand(void) { observe(9); ++random_calls; return seed & 0x7fff; }
uw_object_hdr_t *spawn_new_object(uint id, int region)
{
    assert(id == (seed & 0x7fff) % 5 + 0xc2 && region == 0); observe(10); ++spawns;
    if (mutation) { object()->position_word ^= 0xa5a5; g_player_object->hdr.position_word ^= 0x5555; }
    return mode == 8 ? NULL : object();
}
int place_object_in_world(uint x, uint y, int z, void *p, short radius, int skip)
{
    assert(p == (mode == 8 ? NULL : object()) && radius == 0 && skip == 1);
    observe(11); argument(x); argument(y); argument(z);
    if (mutation) { object()->position_word ^= 0x3333; g_player_object->hdr.position_word ^= 0xaaaa; }
    return mode == 1 || mode == 8 ? 0 : 1;
}
uw_object_hdr_t *settle_dropped_object(void *p, short x, short y, int skip)
{
    assert(p == object() && skip == 1); observe(12); argument(x); argument(y);
    if (mutation) object()->link_word ^= 0xa5a5;
    return p;
}
int teleport_object_to_level_tile(void *p, int x, int y, short level)
{
    assert(p == g_player_object && x == 63 && y == 63 && level == 3); observe(13);
    if (mutation) g_player_object->hdr.position_word ^= 0xaaaa;
    return 1;
}
void apply_special_object_use_effect(void) { observe(14); }
int dungeon_view_anim_tick(void)
{
    observe(15); assert(DAT_00201c9c == apply_special_object_use_effect && DAT_00085730 == 0);
    return mode == 4;
}
void display_book_or_scroll_page(uint page) { assert(page == 0x102); observe(16); }
void show_error_dialog_stub_thunk(void) { observe(17); }
void msg_scroll_panel_reset(int redraw) { assert(redraw == 1); observe(18); }
void handle_player_death_and_menu_transition(short reason) { assert(reason == 1); observe(19); }
#include "starvation_functions.c"

struct result { byte record[40], player[40], status[256]; uint64_t events; unsigned random, spawns; };
static struct result run(int reference)
{
    memset(record, 0xa5, sizeof record); memset(player, 0x5a, sizeof player); memset(status, 0, sizeof status);
    object()->type_flags = seed ^ 0xaaaa; object()->position_word = seed;
    object()->chain_word = seed ^ 0x3333; object()->link_word = seed ^ 0x5555;
    g_player_object->hdr.position_word = seed ^ 0xffff;
    status[0x6d] = mode == 0 ? 0 : 1; status[0x4e] = seed; status[0x4f] = seed >> 8;
    status[0x5e] = mode == 3 || mode == 4 || mode == 7 ? 0x30 : 0;
    DAT_00204880 = seed; DAT_00204882 = seed ^ 0x5555; DAT_00204884 = seed ^ 0xaaaa;
    DAT_00201b68 = mode == 7 ? 9 : 1; DAT_00201c9c = NULL; DAT_00085730 = 9;
    g_selected_object = mode == 6 ? NULL : (char *)(selected + 4);
    g_cursor_holding_state = mode == 2 ? 2 : mode == 5 ? 3 : mode & 1;
    events = 0; random_calls = spawns = 0;
    if (reference) reference_handle_starvation_penalty(); else handle_starvation_penalty();
    struct result result = {0};
    memcpy(result.record, record, sizeof record); memcpy(result.player, player, sizeof player);
    memcpy(result.status, status, sizeof status); result.events = events;
    result.random = random_calls; result.spawns = spawns;
    return result;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 9; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                struct result before = run(1), after = run(0);
                assert(memcmp(before.record, after.record, sizeof record) == 0);
                assert(memcmp(before.player, after.player, sizeof player) == 0);
                assert(memcmp(before.status, after.status, sizeof status) == 0);
                assert(before.events == after.events && before.random == after.random && before.spawns == after.spawns);
                ++cases;
            }
    printf("%u starvation cases preserve header/guard/player bytes and callback behavior\n", cases);
    return 0;
}

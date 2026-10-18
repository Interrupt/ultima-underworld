#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][40], stats[2][128], ui[2][32], tiles[2][16];
static char base_path[128];
#define DAT_0023cca8 base_path[0]
static char s__DATA_win1_byt_00087350[] = "\\DATA\\win1.byt";
static char s__DATA_win2_byt_00087340[] = "\\DATA\\win2.byt";
char *DAT_00086df8;
short *DAT_00085a6c;
uw_mobile_object_t *g_player_object;
char DAT_0023c27c;
byte DAT_00085730;
ushort DAT_000868d8;
static unsigned seed, mode, mutation, counts[23], tile_index;
static uw_object_hdr_t *spawned;
static ushort spawn_flags, spawn_position, spawn_chain, spawn_owner;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void string_argument(const char *p) { do { argument((byte)*p); } while (*p++); }
static void observe(unsigned kind)
{
    argument(kind); ++counts[kind];
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof tiles; ++i) argument(((byte *)tiles)[i]);
    for (unsigned i = 0; i < sizeof ui; ++i) argument(((byte *)ui)[i]);
    argument(stats[0][109]); argument(stats[1][109]); argument(DAT_0023c27c);
    argument(DAT_00085730); argument(DAT_000868d8); argument(g_player_object == object(2));
    argument(DAT_00086df8 == (char *)stats[1]); argument(DAT_00085a6c == (short *)ui[1]);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->hdr.type_flags ^= 0x5555; object(i)->hdr.position_word ^= 0xaaaa;
        object(i)->hdr.chain_word ^= 0xa5a5; object(i)->hdr.link_word ^= 0x5a5a;
    }
    DAT_00085730 ^= 0x55;
    if (kind == 1 || kind == 6) g_player_object = object(2);
    if (kind == 8) DAT_00086df8 = (char *)stats[1];
    if (kind == 10) DAT_00085a6c = (short *)ui[1];
    if (kind == 21) DAT_0023c27c = 0x55;
}
uw_object_hdr_t *spawn_new_object(uint id, int region)
{
    assert(id == 0x15a && region == 0); observe(1);
    spawned = mode == 7 ? &object(1)->hdr : &object(0)->hdr;
    change(1); spawn_flags = spawned->type_flags; spawn_position = spawned->position_word;
    spawn_chain = spawned->chain_word; spawn_owner = spawned->owner;
    return mode == 2 ? NULL : spawned;
}
void *tilemap_lookup(short x, short y)
{
    assert(x == 32 && y == 32 && spawned);
    assert(spawned->type_flags == (spawn_flags | 0x8000)); assert(spawned->link == 704);
    assert(spawned->owner == spawn_owner && spawned->position_word == spawn_position && spawned->chain_word == spawn_chain);
    observe(2); change(2); tile_index = seed & 1; return tiles[tile_index] + 4;
}
void object_list_append_tail(ushort *head, uw_object_hdr_t *p)
{
    assert((void *)head == (void *)(tiles[tile_index] + 6) && p == spawned); observe(3);
    p->next = *head >> 6; *head = (*head & 63) | (23 << 6); change(3);
}
void object_list_unlink(ushort *head, uw_object_hdr_t *p)
{
    assert((void *)head == (void *)(tiles[tile_index] + 6) && p == spawned); observe(7); *head &= 63; change(7);
}
void free_object_slot(uw_object_hdr_t *p) { assert(p == spawned); observe(22); change(22); }
void print_scroll_message_by_id(uint id) { assert(id == 0x117 || id == 0x118); observe(4); argument(id); change(4); }
void spin_view_full_rotation(int unused) { assert(unused == -1); observe(5); change(5); }
void weapon_overlay_flash_hold(int code) { assert(code == 5); observe(6); change(6); }
int teleport_object_to_level_tile(void *p, int x, int y, short level)
{
    assert(p == g_player_object && x == 27 && y == 23 && level == 9); observe(8); change(8); return 1;
}
int dungeon_view_anim_tick(void) { observe(9); change(9); return 0; }
void dirty_rect_union(int a, int b, int c, int d) { assert(a == 0 && b == 200 && c == 0 && d == 320); observe(10); change(10); }
void display_book_or_scroll_page(uint page)
{
    assert(page == 1 && DAT_000868d8 == 2);
    assert(!*((byte *)DAT_00085a6c + 16) && !*((byte *)DAT_00085a6c + 18) && !DAT_00085a6c[4]);
    observe(11); change(11);
}
void decrement_cursor_hide_depth(void) { observe(12); change(12); }
void clear_screen_and_restore_cursor(void) { observe(13); change(13); }
void *ce_memset(void *p, int v, unsigned int n) { assert(v == 0 && n == 260); observe(14); memset(p,v,n); change(14); return p; }
char *ce_strcat(char *dest, char *src) { observe(15); string_argument(dest); string_argument(src); change(15); return strcat(dest,src); }
int blit_fullscreen_bitmap_file(int bank, char *path, int show)
{
    assert(show == 1 && (bank == 7 || bank == -1)); observe(16); argument(bank); string_argument(path); change(16); return 1;
}
long Sleep(unsigned int ms) { assert(ms == 3000); observe(17); change(17); return 0; }
void render_endgame_character_stats(void) { observe(18); change(18); }
int next_input_event(void)
{
    observe(19); change(19);
    if (mode == 5) return counts[19] == 1 ? 32768 : counts[19] == 2 ? 65535 : 65536;
    return counts[19] == 1 ? -1 : 0;
}
void handle_player_death_and_menu_transition(short reason) { assert(reason == 0); observe(21); change(21); }
#include "victory_functions.c"

struct result { byte records[120], stats[256], ui[64], tiles[32]; unsigned counts[23]; int globals[7]; uint64_t events; };
static struct result run(int reference)
{
    memset(records, 0xa5, sizeof records); memset(stats, 0x5a, sizeof stats); memset(ui, 0x55, sizeof ui); memset(tiles, 0xaa, sizeof tiles);
    for (unsigned i = 0; i < 3; ++i) {
        object(i)->hdr.type_flags = seed + i * 17; object(i)->hdr.position_word = seed * 37 + i * 19;
        object(i)->hdr.chain_word = seed * 11 + i * 37; object(i)->hdr.link_word = seed * 53 + i * 17;
    }
    unsigned length = mode == 5 ? 0 : mode == 6 ? 100 : 8;
    for (unsigned i = 0; i < length; ++i) base_path[i] = 'a' + ((seed + i) % 26);
    base_path[length] = 0;
    DAT_00086df8 = (char *)stats[0]; stats[0][109] = mode == 1 ? 1 : 0;
    DAT_00085a6c = (short *)ui[0]; g_player_object = object(1);
    DAT_0023c27c = mode >= 4 && mode <= 6 ? 1 : 0; DAT_00085730 = seed; DAT_000868d8 = seed;
    memset(counts, 0, sizeof counts); events = 0; spawned = NULL; tile_index = 0;
    if (reference) reference_handle_game_victory_sequence(); else handle_game_victory_sequence();
    if (mode == 1) for (unsigned i = 0; i < 23; ++i) assert(counts[i] == 0);
    else if (mode >= 4 && mode <= 6) {
        assert(!counts[1] && counts[16] == 2 && counts[17] == 1 && counts[21] == 1);
        assert(counts[19] == (mode == 5 ? 3 : 2)); assert(DAT_0023c27c == 0);
    } else {
        assert(counts[1] == 1 && counts[2] == (mode != 2) && counts[22] == (mode != 2));
        assert(counts[4] == 2 && counts[8] == 1 && counts[9] == 1);
        if (!mutation) assert(stats[0][109] == 255 && (DAT_00085730 & 1));
    }
    struct result out = {0}; memcpy(out.records, records, sizeof records); memcpy(out.stats, stats, sizeof stats);
    memcpy(out.ui, ui, sizeof ui); memcpy(out.tiles, tiles, sizeof tiles); memcpy(out.counts, counts, sizeof counts);
    int globals[] = {DAT_0023c27c,DAT_00085730,DAT_000868d8,g_player_object == object(2),
        DAT_00086df8 == (char *)stats[1],DAT_00085a6c == (short *)ui[1],tile_index};
    memcpy(out.globals, globals, sizeof globals); out.events = events; return out;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 8; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                struct result before = run(1), after = run(0);
                if (memcmp(&before, &after, sizeof before)) {
                    fprintf(stderr,"victory mismatch seed=%u mode=%u mutation=%u\n",seed,mode,mutation); return 1;
                }
                ++cases;
            }
    printf("%u victory cases preserve quantities, objects, UI branches and callback ordering\n", cases);
}

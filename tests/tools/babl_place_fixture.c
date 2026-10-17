#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[5][40], players[2][40], tiles[2][16];
static short arguments[6];
uw_mobile_object_t *DAT_00100674, *g_player_object;
uw_object_type_props_t g_object_type_props[512];
uint DAT_00202c84;
static unsigned seed, mode, mutation, counts[10], tile_index;
static int x_value, y_value;
static ushort position_at_tile;
static uint64_t events;
static uw_mobile_object_t *object(unsigned i) { return (uw_mobile_object_t *)(records[i] + 4); }
static uw_mobile_object_t *player(unsigned i) { return (uw_mobile_object_t *)(players[i] + 4); }
static uw_tile_t *tile(unsigned i) { return (uw_tile_t *)(tiles[i] + 4); }
static void argument(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    argument(kind); ++counts[kind];
    for (unsigned i = 0; i < sizeof records; ++i) argument(((byte *)records)[i]);
    for (unsigned i = 0; i < sizeof players; ++i) argument(((byte *)players)[i]);
    for (unsigned i = 0; i < sizeof tiles; ++i) argument(((byte *)tiles)[i]);
    for (unsigned i = 0; i < 6; ++i) argument(arguments[i]);
    argument(DAT_00100674 == object(1)); argument(g_player_object == player(1)); argument(g_player_object == object(2));
    argument(DAT_00202c84);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    for (unsigned i = 0; i < 5; ++i) {
        object(i)->hdr.type_flags ^= 0x100; object(i)->hdr.position_word ^= 0xa5a5; object(i)->hdr.quality ^= 0x15;
    }
    for (unsigned i = 0; i < 2; ++i) { player(i)->tile_word ^= 0x5555; player(i)->hdr.position_word ^= 0xaaaa; tile(i)->floor_height ^= 7; }
    g_player_object = player(1);
    if (kind == 3 || kind == 4) DAT_00100674 = object(1);
    g_object_type_props[object(2)->hdr.object_id].collision_radius ^= 7;
    arguments[1] ^= 0x5555; arguments[2] ^= 0x5555; arguments[3] ^= 0x5555; DAT_00202c84 ^= 0xa5;
}
int babl_read_var_word(short index)
{
    assert(counts[1] < 3 && index == arguments[counts[1] + 1]); observe(1); argument(index); change(1);
    return counts[1] == 1 ? (mode == 13 ? 65538 : 2) : counts[1] == 2 ? x_value : y_value;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    assert(slot == 2); observe(2); change(2); return &object(2)->hdr;
}
uw_object_hdr_t *resolve_object_link(ushort *head)
{
    assert(counts[3] < 3); int index = *head >> 6, cursor = -1;
    for (unsigned i = 0; i < 5; ++i) {
        if (head == &object(i)->hdr.link_word) cursor = i * 2;
        if (head == &object(i)->hdr.chain_word) cursor = i * 2 + 1;
    }
    assert(cursor >= 0 && (index == 3 || index == 4)); observe(3); argument(cursor); argument(index); change(3);
    return &object(index)->hdr;
}
void object_list_unlink(ushort *head, uw_object_hdr_t *p)
{
    assert(head == &DAT_00100674->hdr.link_word && p == &object(2)->hdr); observe(4); *head &= 63; change(4);
}
int place_object_in_world(uint x, uint y, int z, void *p, short radius, int skip)
{
    assert(x == g_player_object->tile_x * 8U && y == g_player_object->tile_y * 8U && z == g_player_object->hdr.zpos);
    assert(p == &object(2)->hdr && radius == 6 && skip == 1 && DAT_00202c84 == 1);
    observe(5); argument(x); argument(y); argument(z); change(5); return 0;
}
void *tilemap_lookup(short x, short y)
{
    assert(x == (short)x_value && y == (short)y_value); observe(6); argument(x); argument(y); change(6);
    tile_index = seed & 1; position_at_tile = object(2)->hdr.position_word; return tile(tile_index);
}
int check_object_placement_clearance(short id, short ignore, short x, short y, short z, int check, byte radius)
{
    assert(id == object(2)->hdr.object_id && ignore == 2 && x == (short)x_value * 8 && y == (short)y_value * 8);
    assert(z == tile(tile_index)->floor_height * 8 && check == 1 && radius == g_object_type_props[id].collision_radius + 4);
    assert(object(2)->hdr.zpos == z && (object(2)->hdr.position_word & 0xff80) == (position_at_tile & 0xff80));
    observe(7); argument(id); argument(ignore); argument(x); argument(y); argument(z); argument(radius); change(7);
    return mode == 11 ? 0 : mode == 12 ? -1 : mode == 13 ? 65536 : 1;
}
void object_list_append_tail(ushort *head, uw_object_hdr_t *p)
{
    assert((void *)head == (void *)((byte *)tile(tile_index) + 2) && p == &object(2)->hdr);
    observe(8); p->next = *head >> 6; *head = (*head & 63) | (2 << 6); change(8);
}
uw_object_hdr_t *settle_dropped_object(void *p, short x, short y, int skip)
{
    assert(p == &object(2)->hdr && x == (short)x_value && y == (short)y_value && skip == 1);
    observe(9); argument(x); argument(y); change(9); return &object(4)->hdr;
}
#include "babl_place_functions.c"

struct result { byte records[200], players[80], tiles[32], props[6656]; short arguments[6]; unsigned counts[10], flag, npc, player; int returned; uint64_t events; };
static struct result expected, actual;
static void run(int reference, struct result *out)
{
    memset(records, 0xa5, sizeof records); memset(players, 0x5a, sizeof players); memset(tiles, 0xaa, sizeof tiles);
    memset(g_object_type_props, 0x55, sizeof g_object_type_props); memset(out, 0, sizeof *out);
    for (unsigned i = 0; i < 5; ++i) {
        object(i)->hdr.type_flags = seed + i * 17; object(i)->hdr.position_word = seed * 37 + i * 19;
        object(i)->hdr.chain_word = seed * 11 + i * 37; object(i)->hdr.link_word = seed * 53 + i * 17;
        object(i)->tile_word = seed * 13 + i * 19;
    }
    for (unsigned i = 0; i < 2; ++i) {
        player(i)->tile_word = seed * 17 + i * 37; player(i)->hdr.position_word = seed * 53 + i * 13;
        ushort a = seed + i * 17, b = seed * 37 + i * 13; memcpy(tile(i), &a, 2); memcpy((byte *)tile(i) + 2, &b, 2);
    }
    for (unsigned i = 0; i < 512; ++i) g_object_type_props[i].size_weight = seed * 37 + i;
    object(0)->hdr.link = mode == 2 ? 0 : mode == 3 ? 2 : 3; object(1)->hdr.link = 4;
    object(3)->hdr.next = mode == 1 ? 4 : 2; object(2)->hdr.next = 4; object(4)->hdr.next = 0;
    DAT_00100674 = mode == 15 ? object(2) : object(0); if (mode == 15) object(2)->hdr.link = 3;
    g_player_object = mode == 14 ? object(2) : player(0); DAT_00202c84 = seed;
    const int x[] = {-1,0,1,1,63,64,1,1,-32768,65535,65537,63,1,1,-1,1};
    const int y[] = {1,1,0,1,63,1,64,-1,63,1,1,1,63,1,1,63};
    x_value = x[mode]; y_value = y[mode];
    for (unsigned i = 0; i < 6; ++i) arguments[i] = seed + i * 13;
    memset(counts, 0, sizeof counts); events = 0; tile_index = 0; position_at_tile = 0;
    int returned = reference ? reference_babl_builtin_place_object((char *)&arguments[4]) : babl_builtin_place_object((char *)&arguments[4]);
    if ((short)x_value < 0) assert(returned == 1 && counts[5] == 1 && !counts[6] && DAT_00202c84 == 0);
    else if (!(0 < (short)x_value && (short)x_value < 64 && 0 < (short)y_value && (short)y_value < 64))
        assert(returned == 0 && !counts[5] && !counts[6] && !counts[7]);
    else assert(counts[6] == 1 && counts[7] == 1 && counts[8] == (mode != 11) && counts[9] == counts[8] && returned == (mode != 11));
    _Static_assert(sizeof out->props == sizeof g_object_type_props, "property snapshot");
    memcpy(out->records, records, sizeof records); memcpy(out->players, players, sizeof players); memcpy(out->tiles, tiles, sizeof tiles);
    memcpy(out->props, g_object_type_props, sizeof g_object_type_props); memcpy(out->arguments, arguments, sizeof arguments); memcpy(out->counts, counts, sizeof counts);
    out->flag = DAT_00202c84; out->npc = DAT_00100674 == object(1) ? 1 : DAT_00100674 == object(2) ? 2 : 0;
    out->player = g_player_object == player(1) ? 1 : g_player_object == object(2) ? 2 : 0; out->returned = returned; out->events = events;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed) for (mode = 0; mode < 16; ++mode) for (mutation = 0; mutation < 2; ++mutation) {
        run(1, &expected); run(0, &actual);
        if (memcmp(&expected, &actual, sizeof actual)) { fprintf(stderr,"placement mismatch seed=%u mode=%u mutation=%u\n",seed,mode,mutation); return 1; }
        ++cases;
    }
    printf("%u placement cases preserve tile/player fields, chains, coordinates and callbacks\n", cases);
}

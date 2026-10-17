#include "src/headers/uw.h"
#include <assert.h>

#define ARENA_SIZE 0x8000
static _Alignas(8) byte storage[ARENA_SIZE + 32], shadow[ARENA_SIZE + 32], player[40];
char *DAT_002029cc;
char *DAT_002046b8, *DAT_002046c4, *DAT_002046a4, *DAT_002046a8;
char *DAT_002046bc, *DAT_0020469c, *DAT_002046ac, *DAT_002046a0;
char *g_backpack_slot_table, *g_scheduler_table;
byte *DAT_002046c0, *DAT_002046c8;
byte g_scheduler_count;
uw_mobile_object_t *g_player_object;
static unsigned seed, mode, mutation, resets;
static byte *arena(void) { return storage + 8; }
static byte *other(void) { return shadow + 8; }
struct result {
    byte storage[ARENA_SIZE + 32], shadow[ARENA_SIZE + 32], player[40];
    byte at_callback[ARENA_SIZE + 32];
    uintptr_t pointers[14], callback_pointers[14];
    unsigned count, resets, callback_count;
};
static struct result expected, actual, *current;
static ushort read_word(const byte *p) { ushort value; memcpy(&value, p, 2); return value; }
static void putword(byte *p, ushort value) { memcpy(p, &value, 2); }
static void pointers(uintptr_t *out)
{
    void *values[] = {DAT_002029cc, DAT_002046b8, DAT_002046c4, DAT_002046a4, DAT_002046a8,
        DAT_002046bc, DAT_0020469c, DAT_002046ac, DAT_002046a0, g_backpack_slot_table,
        g_scheduler_table, DAT_002046c0, DAT_002046c8, g_player_object};
    for (unsigned i = 0; i < 14; ++i) out[i] = (uintptr_t)values[i];
}
static void verify_arena(void)
{
    if (mode != 2) for (unsigned i = 0; i < 4096; ++i) {
        assert(read_word(arena() + i * 4) == (ushort)(seed * 4096 + i));
        assert(read_word(arena() + i * 4 + 2) == ((seed * 53 + i * 17) & 63));
    }
    if (mode != 3) for (unsigned i = 2; i < 1024; ++i)
        assert(read_word(arena() + 0x7300 + (i - 2) * 2) == i);
    assert(DAT_002046b8 == (char *)arena() + 0x4000);
    assert(DAT_002046c4 == (char *)arena() + 0x5b00);
    assert(DAT_002046a4 == (char *)arena() + 0x7300);
    assert(DAT_002046ac == (char *)arena() + 0x74fa);
    assert(DAT_002046bc == (char *)arena() + 0x74fc);
    assert(DAT_002046a0 == (char *)arena() + 0x7afa);
    assert(DAT_0020469c == (char *)arena() + 0x7afa);
    assert(g_backpack_slot_table == (char *)arena() + 0x7c08);
    assert(g_scheduler_table == (char *)arena() + 0x7c42);
}
void reset_equipment_and_container_state(void)
{
    assert(g_player_object && !g_player_object->hdr.next && !g_player_object->hdr.link);
    if (mode != 3) {
        assert(g_player_object->hdr.quality == ((seed * 17) & 63));
        assert(g_player_object->hdr.owner == ((seed * 53) & 63));
    }
    verify_arena(); ++resets;
    memcpy(current->at_callback, storage, sizeof storage); pointers(current->callback_pointers);
    current->callback_count = g_scheduler_count;
    memset(g_backpack_slot_table, 0, 0x3a);
    if (mutation) {
        g_player_object->hdr.type_flags ^= 0xaaaa; g_player_object->hdr.chain_word ^= 0x5555;
        g_player_object->hdr.link_word ^= 0xa5a5;
        DAT_002029cc = (char *)other(); DAT_002046a0 = (char *)other() + 0x120;
        DAT_002046b8 = (char *)other() + 99; DAT_002046a4 = (char *)other() + 0x7344;
        g_player_object = (uw_mobile_object_t *)(other() + 0x401b);
        other()[0x100] ^= 0x55; g_scheduler_count = 255;
    }
}
#include "arena_reset_functions.c"

static void run(int reference, struct result *out)
{
    current = out; memset(out, 0, sizeof *out);
    byte poison = seed * 37;
    memset(storage, poison, sizeof storage); memset(shadow, poison ^ 0xa5, sizeof shadow); memset(player, poison, sizeof player);
    for (unsigned i = 0; i < 4096; ++i) {
        putword(arena() + i * 4, seed * 4096 + i);
        putword(arena() + i * 4 + 2, seed * 53 + i * 17);
    }
    switch (mode) {
    case 0: g_player_object = (uw_mobile_object_t *)(player + 8); break;
    case 1: g_player_object = (uw_mobile_object_t *)(arena() + 0x4000 + (1 + seed % 255) * 27); break;
    case 2: g_player_object = (uw_mobile_object_t *)(arena() + (seed % 4096) * 4); break;
    case 3: g_player_object = (uw_mobile_object_t *)(arena() + 0x7300 + (2 + seed % 1000) * 2); break;
    case 4: g_player_object = NULL; break;
    default: g_player_object = (uw_mobile_object_t *)(arena() + 0x7c08); break;
    }
    if (g_player_object) {
        g_player_object->hdr.type_flags = seed * 11; g_player_object->hdr.position_word = seed * 37;
        g_player_object->hdr.chain_word = seed * 17; g_player_object->hdr.link_word = seed * 53;
    }
    DAT_002029cc = (char *)arena();
    DAT_002046b8 = DAT_002046c4 = DAT_002046a4 = DAT_002046a8 = NULL;
    DAT_002046bc = DAT_0020469c = DAT_002046ac = DAT_002046a0 = NULL;
    g_backpack_slot_table = g_scheduler_table = NULL; DAT_002046c0 = DAT_002046c8 = NULL;
    g_scheduler_count = seed; resets = 0;
    if (reference) reference_reset_level_object_arena(); else reset_level_object_arena();
    assert(resets == (mode != 4) && g_scheduler_count == 0);
    if (mode == 4) verify_arena();
    assert(DAT_002046c0 == (byte *)DAT_002046a0 + 2 && DAT_002046c8 == DAT_002046c0);
    for (unsigned i = 0; i < 8; ++i) { assert(storage[i] == poison); assert(shadow[i] == (byte)(poison ^ 0xa5)); }
    for (unsigned i = ARENA_SIZE + 8; i < sizeof storage; ++i) {
        assert(storage[i] == poison); assert(shadow[i] == (byte)(poison ^ 0xa5));
    }
    memcpy(out->storage, storage, sizeof storage); memcpy(out->shadow, shadow, sizeof shadow); memcpy(out->player, player, sizeof player);
    pointers(out->pointers); out->count = g_scheduler_count; out->resets = resets;
}
int main(void)
{
    unsigned cases = 0;
    for (seed = 0; seed < 4096; ++seed)
        for (mode = 0; mode < 6; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                run(1, &expected); run(0, &actual);
                if (memcmp(&expected, &actual, sizeof actual)) {
                    fprintf(stderr,"arena reset mismatch seed=%u mode=%u mutation=%u\n",seed,mode,mutation); return 1;
                }
                ++cases;
            }
    printf("%u arena-reset cases preserve tile textures, links, free lists, buffers and callbacks\n", cases);
}

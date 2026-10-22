/* Isolated services and independent byte expectations for the actual sync function. */
#include "src/headers/uw.h"
#include <assert.h>
#include <limits.h>
static _Alignas(2) byte arena[192], snapshot[64], modes[256], tile[4];
#define DAT_000868c0 modes[0]
char *DAT_002046c4 = (char *)arena + 96;
short DAT_0010144c, DAT_00101454;
uw_object_type_props_t g_object_type_props[512];
static unsigned scenario;
static uint64_t events;
static unsigned read16(const byte *p) { return p[0] | p[1] * 256u; }
static void write16(byte *p, unsigned v) { p[0] = v; p[1] = v >> 8; }
static void event(unsigned code) {
    events = events * 31 + code;
    for (unsigned j = 0; j < sizeof arena; ++j) events = events * 31 + arena[j];
}
void *tilemap_lookup(short x, short y) { event(1 + (unsigned)(ushort)x * 256 + (ushort)y); return scenario == 6 ? NULL : tile; }
void object_list_unlink(ushort *p, uw_object_hdr_t *obj) { (void)p; (void)obj; event(2); }
void object_list_insert_head(ushort *p, uw_object_hdr_t *obj) { (void)p; (void)obj; event(3); }
divmod_result ordint_divmod(int d, int n) { return (divmod_result){n/d, n%d}; }
int play_sound_effect_at_object(int sound, uw_unaligned_word_t *obj, int bias) { (void)obj; event(100 + sound + (unsigned)bias); return 0; }
int apply_typed_damage_to_object(uw_unaligned_word_t *obj, uw_unaligned_word_t *attacker, int x, short y, byte damage, byte type) {
    (void)attacker; (void)x; (void)y; event(200 + damage + type * 256u);
    if (scenario == 7) { ((byte *)obj)[8] ^= 0x73; ((byte *)obj)[4] ^= 0x55; }
    return 0;
}
long ce_rand(void) { event(4); return scenario == 7 ? 0 : 1; }
uw_object_hdr_t *reallocate_object_to_arena(uw_unaligned_word_t *obj) { event(5); memcpy(arena + 64, obj, 8); return (uw_object_hdr_t *)(arena + 64); }
ushort *settle_mobile_to_immobile(uw_unaligned_word_t *obj) { event(6); if (scenario == 2) return NULL; memcpy(arena + 128, obj, 8); return (ushort *)(arena + 128); }
uw_object_hdr_t *settle_dropped_object(void *obj, short x, short y, int mode) {
    (void)x; (void)y; (void)mode; event(7);
    if (scenario == 3) return NULL;
    if (scenario == 5) { memcpy(arena + 64, obj, 8); return (uw_object_hdr_t *)(arena + 64); }
    return obj;
}
void randomize_settled_snapshot_position(void *p) { event(8); write16(p, read16(p) ^ 0x127); write16((byte *)p+2, read16((byte *)p+2) ^ 0x2e3); }

#include "sync_functions.c"

static void setup(unsigned seed, unsigned cls, int mobile, unsigned mode) {
    scenario = mode; events = 0;
    unsigned state = seed + 1;
    for (unsigned j = 0; j < sizeof arena; ++j) { state = state * 1664525u + 1013904223u; arena[j] = state >> 24; }
    for (unsigned j = 0; j < sizeof snapshot; ++j) { state = state * 1664525u + 1013904223u; snapshot[j] = state >> 24; }
    for (unsigned j = 0; j < sizeof modes; ++j) modes[j] = j * 13u + seed;
    byte *obj = arena + (mobile ? 16 : 128);
    write16(obj, (read16(obj) & 0xfe00) | cls);
    write16(obj+2, seed); write16(obj+22, seed ^ 0x5a5a);
    write16(snapshot, seed ^ 0x1234); write16(snapshot+2, seed ^ 0x8521); write16(snapshot+4, seed);
    write16(snapshot+10, seed); write16(snapshot+16, seed ? seed : -4); write16(snapshot+20, seed ^ 0x6ac3);
    write16(snapshot+30, seed ^ 0x8765);
    snapshot[41] = snapshot[42] = 0;
    if ((!mobile && mode == 0) || (mobile && mode >= 2 && mode <= 5)) {
        write16(snapshot+10, 0); write16(snapshot+16, 0); write16(snapshot+20, 0);
    }
    if (mode == 7) { write16(snapshot+41, 0x3ff); write16(snapshot+40, read16(snapshot+40) | 4); }
    DAT_0010144c = 3; DAT_00101454 = 7;
    memset(g_object_type_props, 0, sizeof g_object_type_props);
    g_object_type_props[cls].unit_weight = seed & 0xfff;
}

static void independent_expected(byte expected[192], const byte pos[64], unsigned offset, int mobile, unsigned cls) {
    memcpy(expected, arena, sizeof arena);
    byte *obj = expected + offset;
    unsigned packed = (read16(obj+2) & 0x380) | ((read16(pos+4) & 0x3f8) >> 3)
        | ((read16(pos) & 0xe0) << 8) | ((read16(pos+2) & 0xe0) << 5);
    write16(obj+2, packed);
    if (mobile) {
        obj[8] = pos[30]; obj[9] = pos[34];
        int x = (char)pos[1], y = (char)pos[3];
        write16(obj+22, (read16(obj+22) & 15) | ((unsigned)x & 63) << 10 | ((unsigned)y & 63) << 4);
        int pitch = (short)read16(pos+10);
        if (pitch < 0) pitch += 63;
        pitch = (pitch >> 6) + 16;
        if (pitch < 0) pitch = 0; if (pitch > 31) pitch = 31;
        obj[20] = (obj[20] & 7) | pitch << 3;
        obj[19] = ((short)read16(pos+20) / 47 & 127) | ((short)read16(pos+16) == -4 ? 128 : 0);
        obj[10] = (obj[10] & 0x8f) | (modes[pos[40]] & 7) << 4;
        if ((cls & 0x1c0) != 0x40) { memcpy(obj+11, pos, 2); memcpy(obj+13, pos+2, 2); memcpy(obj+15, pos+4, 2); }
    } else {
        write16(obj+4, (read16(obj+4) & 0xffc0) | (pos[30] & 63));
        if ((cls & 0x1c0) == 0x140) write16(obj+2, (read16(obj+2) & 0xfc7f) | (read16(pos+33) >> 13) << 7);
    }
}

int main(void) {
    const unsigned classes[] = {0x40, 0x80, 0x140, 0x180};
    unsigned cases = 0;
    for (unsigned seed = 0; seed < 65536; ++seed)
        for (unsigned c = 0; c < 4; ++c)
            for (unsigned mobile = 0; mobile < 2; ++mobile) {
                setup(seed, classes[c], mobile, 0);
                byte expected[192], original_pos[64]; memcpy(original_pos, snapshot, 64);
                unsigned offset = mobile ? 16 : 128;
                independent_expected(expected, snapshot, offset, mobile, classes[c]);
                int result = sync_object_tile_position((ushort *)(arena+offset), snapshot);
                assert(result == (int)mobile);
                assert(memcmp(expected, arena, sizeof arena) == 0);
                assert(memcmp(original_pos, snapshot, sizeof snapshot) == 0);
                ++cases;
#ifdef REFERENCE_AVAILABLE
                for (unsigned mode = 0; mode < 8; ++mode) {
                    setup(seed, classes[c], mobile, mode);
                    int actual = sync_object_tile_position((ushort *)(arena+offset), snapshot);
                    byte saved_arena[192], saved_pos[64];
                    memcpy(saved_arena, arena, sizeof arena); memcpy(saved_pos, snapshot, 64);
                    uint64_t saved_events = events;
                    short x = DAT_0010144c, y = DAT_00101454;
                    setup(seed, classes[c], mobile, mode);
                    assert(reference_sync_object_tile_position((ushort *)(arena+offset), snapshot) == actual);
                    assert(memcmp(saved_arena, arena, sizeof arena) == 0);
                    assert(memcmp(saved_pos, snapshot, sizeof snapshot) == 0);
                    assert(saved_events == events && DAT_0010144c == x && DAT_00101454 == y);
                }
#endif
            }
    printf("Position synchronization: %u independent NPC/projectile/static layout cases passed\n", cases);
#ifdef REFERENCE_AVAILABLE
    puts("Original and converted synchronization: 4,194,304 relocation/landing/damage cases agree");
#endif
}

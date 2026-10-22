#include "unity.h"
#include "src/headers/uw.h"

/* Exercise light toggling, equipment selection, real shading data and pixels.
   Inventory/UI services are fixtures; the game functions stay in their files. */
char *DAT_00086df8, *DAT_0023be74, *DAT_0024fa2c, *DAT_0023cca0;
uw_object_hdr_t *g_scratch_object_ptr;
unsigned char g_fullbright_palette_mask[256];
uw_extra_light_t g_extra_lights[UW_MAX_EXTRA_LIGHTS];
int g_extra_light_count;
int g_view_fullscreen;
double uw_fullscreen_proj_cy(void) { return 84.0; }
byte lighting_span_shade = 88;
char *g_selected_object;
undefined1 DAT_00086da8;
uw_melee_type_props_t g_melee_type_props[16];
undefined1 DAT_0023b039_backing[4096];
undefined4 DAT_000b5638_backing[160];
char DAT_0023cca8_backing[1024];
unsigned char DAT_00085ac8_backing[16] = {5,6,7,8};
undefined4 DAT_0023bc98, DAT_002020d8;
char DAT_000872a0, DAT_000842b0, DAT_0023b830;
short DAT_00201b68, DAT_0025063c, DAT_0025064c, DAT_002506dc;
short g_visibility_max_ring_passes, DAT_00086b28, DAT_00086b24;
undefined2 DAT_000da47c, g_palette_rgb565_backing[32768];
char s__DATA_light_dat_000872c8[] = "\\DATA\\LIGHT.DAT";
char s__DATA_mono_dat_000872b8[] = "\\DATA\\MONO.DAT";
char s__DATA_shades_dat_000872a4[] = "\\DATA\\SHADES.DAT";
char player[256], stats[256], mappings[4096], stencil[16];
ushort lights[4][4], *slots[11];
byte light_records[32];
int rebuilds, message;
int g_ambient_bias_reduction;
/* slots hold raw 8-byte light records; view one as a game object header. */
uw_object_hdr_t *get_equipped_item_at_slot(short slot) { return (uw_object_hdr_t *)slots[slot]; }
void *get_scanned_object_class_effect_ptr(void)
{
    return light_records + (g_scratch_object_ptr->type_flags & 15) * 2;
}
int compute_object_weight(ushort *object) { (void)object; return 0; }
void request_weapon_swing_graphic(char category) {}
void reset_player_derived_state(void) {}
int is_valid_equipment_slot_item(ushort id, short slot) { return 0; }
int resolve_object_variant_or_special_link(void *o, void *a, void *b, void *c) { return 0; }
void clear_object_pending_special_flag(void *o) {}
int apply_equipped_item_effect(byte effect, byte level, ushort *flags, int slot)
{
    /* Fixture for the intrinsic light effect, independent of physical lamps. */
    TEST_ASSERT_EQUAL_INT(0, effect);
    if ((byte)player[99] >> 4 < level) player[99] = level << 4;
    return 0;
}
void apply_equipment_effect_penalties(uint flags) {}
void update_screen_flicker_effect(int active) {}
void force_locomotion_state_refresh(void) {}
void apply_movement_mode_profile(byte mode) {}
int find_or_assign_object_widget(void *object) { return 5; }
void decrement_object_count(uw_unaligned_word_t *object) { TEST_FAIL_MESSAGE("Unexpected auto-equip"); }
int place_object_in_backpack_slot(uw_unaligned_word_t *object, short slot) { return 1; }
void redraw_container_icon_slot(void) {}
void redraw_backpack_slot_widget(short slot) {}
void print_scroll_message_by_id(uint id) { message = id; }
void set_pending_update_flags(ushort mode) { rebuilds++; }
/* Use real platform file I/O, including Windows path translation. */
int open_file_for_read(const char *path)
{
    const char *prefix = (char *)DAT_0023cca8_backing;
    if (*prefix) TEST_ASSERT_EQUAL_MEMORY(prefix, path, strlen(prefix));
    return uw_file_open_read(path);
}
int read_file_handle(int h, void *buf, unsigned n) { return uw_file_read(h, buf, n); }
int seek_file_handle(int h, int offset, int whence) { return uw_file_seek(h, offset, whence); }
long CloseHandle(int h) { return uw_file_close(h); }
void *ce_memset(void *p, int value, unsigned n) { return memset(p, value, n); }
char *ce_strcat(char *p, char *s) { return strcat(p, s); }
/* The camera: the view matrix and the camera offset the eye transform of --light-depth-rounding inverts. */
undefined4 DAT_000c8ac0_mtx[16];
uw_geom_arena_t g_geom_arena;
void lighting_fixture_set_camera(const float m[16], const float cam_offset[3])
{
    memcpy(DAT_000c8ac0_mtx, m, 16 * sizeof(float));
    memcpy(&g_geom_arena.cam_offset, cam_offset, 3 * sizeof(float));
    light_pass_prepare(); /* the game does this once per frame, before shading */
}
void lighting_fixture_reset(void)
{
    static const float identity[16] = {1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1};
    static const float no_offset[3] = {0, 0, 0};
    lighting_fixture_set_camera(identity, no_offset);
    options_unset("light-depth-rounding");
    options_set("data-dir", UW_TEST_DATA_DIR);
    options_unset("light-mode");
    options_unset("fullbright");
    options_unset("extralights");
    extra_lights_reset();
    lighting_span_shade = 88;
    options_set("dither", "0"); /* Isolate undithered falloff assertions. */
    options_unset("ambient-bias-reduction");
    g_ambient_bias_reduction = 0;
    memset(player, 0, sizeof player); memset(stats, 0, sizeof stats);
    memset(slots, 0, sizeof slots); memset(lights, 0, sizeof lights);
    memset(DAT_0023cca8_backing, 0, sizeof DAT_0023cca8_backing);
    DAT_00086df8 = player; DAT_0023be74 = stats;
    DAT_0024fa2c = mappings; DAT_0023cca0 = stencil;
    DAT_000872a0 = -1; DAT_000842b0 = 8;
    DAT_002020d8 = DAT_0023bc98 = 0; g_selected_object = NULL;
    DAT_0023b830 = 0; rebuilds = message = 0;
    build_shade_lut();
    int h = uw_file_open_read("\\DATA\\OBJECTS.DAT");
    TEST_ASSERT_NOT_EQUAL(-1, h);
    TEST_ASSERT_EQUAL_INT(3426, uw_file_seek(h, 3426, 0));
    TEST_ASSERT_EQUAL_INT(32, uw_file_read(h, light_records, 32)); uw_file_close(h);
    h = uw_file_open_read("\\DATA\\LIGHT.DAT"); TEST_ASSERT_NOT_EQUAL(-1, h);
    TEST_ASSERT_EQUAL_INT(4096, uw_file_read(h, mappings, 4096)); uw_file_close(h);
    /* Distinct RGB565 entries let assertions identify the exact palette index. */
    for (int i = 0; i < 256; i++) g_palette_rgb565_backing[i] = i + 0x100;
    update_fullbright_palette_mask();
}
void lighting_fixture_dispose(void)
{
    options_unset("light-mode");
    options_unset("dither");
    options_unset("ambient-bias-reduction");
    options_unset("fullbright");
    options_unset("extralights");
}
void assert_mode(int mode, int falloff, int initial, int offset)
{
    TEST_ASSERT_EQUAL_INT(mode, DAT_000872a0);
    TEST_ASSERT_EQUAL_INT(falloff, DAT_0025063c);
    TEST_ASSERT_EQUAL_INT(initial, DAT_0025064c);
    TEST_ASSERT_EQUAL_INT(offset, DAT_002506dc);
}

/* Draw actual raster spans at dungeon projection coordinates. Keep buffer and
   edge setup here so lighting tests specify points and expected colours. */
void lighting_draw_span(int reciprocal_w, int x, int y, int count, int clip_left, ushort *pixels)
{
    static ushort framebuffer[320 * 200];
    int gradients[32] = {0}, left[32] = {0}, right[32] = {0};
    int clip[] = {clip_left, 0, x + count, 200};
    memset(framebuffer, 0, sizeof framebuffer);
    left[8/4] = y;
    left[0x28/4] = x << 14;
    left[0x30/4] = reciprocal_w;
    right[0x28/4] = (x + count) << 14;
    raster_textured_span(320, (char *)framebuffer, (byte *)gradients,
                        (byte *)left, (byte *)right, 1, 1, 0, clip, lighting_span_shade);
    memcpy(pixels, framebuffer + y * 320 + x, count * sizeof *pixels);
}
ushort lighting_draw_texel(int reciprocal_w, int x, int y)
{
    ushort pixel;
    lighting_draw_span(reciprocal_w, x, y, 1, x, &pixel);
    return pixel;
}

#include "lighting_fixture.h"
#include "src/headers/options.h"
#include <stdio.h>

void setUp(void) { lighting_fixture_reset(); }
void tearDown(void) { lighting_fixture_dispose(); }

static void test_each_light_selects_its_data_mode_and_extinguishes(void)
{
    options_set("light-mode", "dos");
    const int modes[] = {4,2,1,3}, falloffs[] = {28,39,46,30};
    const int initial[] = {0,2,4,1}, offset[] = {0,-2,-3,0};
    slots[5] = lights[0]; lights[0][2] = 63;
    for (int i = 0; i < 4; i++) {
        lights[0][0] = 0x90 + i;
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x94 + i, lights[0][0]);
        assert_mode(modes[i], falloffs[i], initial[i], offset[i]);
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x90 + i, lights[0][0]);
        assert_mode(0,56,5,-3);
    }
    TEST_ASSERT_EQUAL_INT(0, message);
}
static void test_extinguishing_one_source_keeps_the_other_source(void)
{
    options_set("light-mode", "dos");
    slots[5] = lights[0]; slots[8] = lights[1];
    lights[0][0] = 0x94; lights[0][2] = 63; lights[1][0] = 0x95;
    refresh_player_equipment_effects(); assert_mode(4,28,0,0);
    use_light_source(lights[0], 1); assert_mode(2,39,2,-2);
    TEST_ASSERT_EQUAL_HEX8(0x23, (byte)player[99]); /* source slot index 3 */
}
static void test_held_light_and_intrinsic_light_compete_by_strength(void)
{
    options_set("light-mode", "dos");
    lights[0][0] = 0x96; g_selected_object = (char *)lights[0];
    refresh_player_equipment_effects(); assert_mode(1,46,4,-3);
    player[0x5f] = 0x40; player[0x3e] = 0x30; /* one light effect, mode 3 */
    refresh_player_equipment_effects(); assert_mode(3,30,1,0);
    g_selected_object = NULL;
    refresh_player_equipment_effects(); assert_mode(3,30,1,0);
}
static void test_night_vision_transition_reloads_palette_and_shades(void)
{
    /* A nonempty install prefix must survive both path constructions. */
    strcpy((char *)DAT_0023cca8_backing, "\\DATA\\..");
    load_shading_level_config(5); assert_mode(5,21,0,0);
    byte mono[4096], normal[4096];
    int h = uw_file_open_read("\\DATA\\MONO.DAT");
    TEST_ASSERT_EQUAL_INT(4096, uw_file_read(h, mono, 4096)); uw_file_close(h);
    TEST_ASSERT_EQUAL_MEMORY(mono, mappings, 4096);
    load_shading_level_config(2); assert_mode(2,39,2,-2);
    h = uw_file_open_read("\\DATA\\LIGHT.DAT");
    TEST_ASSERT_EQUAL_INT(4096, uw_file_read(h, normal, 4096)); uw_file_close(h);
    TEST_ASSERT_EQUAL_MEMORY(normal, mappings, 4096);
    TEST_ASSERT_EQUAL_INT(2, rebuilds);
    load_shading_level_config(2); TEST_ASSERT_EQUAL_INT(2, rebuilds);
}
static ushort draw_one_texel(int inverse_depth)
{
    return lighting_draw_texel((0x1000000 / inverse_depth) * 4, 140, 80);
}
/* The fixture's distinct-per-index palette has no brightness ordering, so the shade-table row
   brightness (derived from the palette's luminance) needs the game's real colours. */
static void use_real_palette(void)
{
    unsigned char pals[768];
    FILE *f = fopen(UW_TEST_DATA_DIR "/DATA/PALS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(f);
    TEST_ASSERT_EQUAL_INT(768, (int)fread(pals, 1, sizeof pals, f));
    fclose(f);
    for (int i = 0; i < 256; i++)
        g_palette_rgb565_backing[i] = (pals[i * 3] >> 1 & 31) << 11 | (pals[i * 3 + 1] & 63) << 5 | (pals[i * 3 + 2] >> 1 & 31);
    update_fullbright_palette_mask();
}

static void test_textured_surfaces_use_palette_mapping_and_light_strength(void)
{
    options_set("dither", "1");
    options_set("light-mode", "dos");
    load_shading_level_config(0);
    /* Fractional distance gives shade 7 (no light), shade 2 (lantern). */
    ushort dark = draw_one_texel(512); /* 187.5 world units, ~0.73 tile */
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[7*256+88]], dark);
    load_shading_level_config(4);
    ushort lit = draw_one_texel(512);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[2*256+88]], lit);
    TEST_ASSERT_NOT_EQUAL(dark, lit);
    DAT_000842b0 = -80; TEST_ASSERT_EQUAL_HEX16(lit, draw_one_texel(512));
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[15*256+88]], draw_one_texel(8192));
}
static ushort draw_at_world_point(float depth, int x, int y)
{
    /* tmap supplies w = depth/1500; edge setup stores 16384/w. */
    return lighting_draw_texel((int)(16384.0f / (depth / 1500.0f)), x, y);
}
static ushort draw_at_world_depth(float depth)
{
    return draw_at_world_point(depth, 140, 80);
}
static void test_wall_light_falloff_at_known_world_distances(void)
{
    options_set("dither", "1");
    options_set("light-mode", "dos");
    /* One tile is 256 world units. Offset samples by 16 units to avoid
       integer perspective rounding at an exact eighth-tile boundary. */
    const float depths[] = {144,272,528,784};
    const int modes[] = {2,4}; /* torch, lantern */
    const int shades[2][4] = {{2,5,10,15}, {2,3,7,10}};
    for (int light = 0; light < 2; light++) {
        load_shading_level_config(modes[light]);
        for (int distance = 0; distance < 4; distance++) {
            ushort expected = g_palette_rgb565_backing[
                (byte)mappings[shades[light][distance]*256+88]];
            TEST_ASSERT_EQUAL_HEX16(expected, draw_at_world_depth(depths[distance]));
        }
    }
}
static void test_spent_light_does_not_change_shading(void)
{
    load_shading_level_config(0);
    slots[5] = lights[0]; lights[0][0] = 0x91; lights[0][2] = 0;
    use_light_source(lights[0], 1);
    TEST_ASSERT_EQUAL_HEX16(0x91, lights[0][0]);
    TEST_ASSERT_EQUAL_INT(0x7c, message);
    assert_mode(0,56,5,-3);
}
static void test_daylight_override_is_preserved(void)
{
    DAT_002020d8 = 1; refresh_player_equipment_effects(); assert_mode(6,18,0,0);
}
static void test_arm_mode_toggles_rgb_bias_and_updates_automap_light_grid(void)
{
    /* ARM renders through RGB bias; both modes still update automap discovery. */
    for (int explicit_mode = 0; explicit_mode < 2; explicit_mode++) {
        if (explicit_mode) options_set("light-mode", "arm");
        slots[5] = lights[0]; lights[0][2] = 63; lights[0][0] = 0x91;
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x95, lights[0][0]);
        TEST_ASSERT_EQUAL_INT(-24, DAT_000842b0);
        TEST_ASSERT_EQUAL_HEX8(0x20, (byte)player[99]);
        TEST_ASSERT_EQUAL_INT(2, DAT_000872a0);
        TEST_ASSERT_GREATER_THAN_INT(0, rebuilds);
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x91, lights[0][0]);
        TEST_ASSERT_EQUAL_INT(8, DAT_000842b0);
    }
}
static void test_arm_surfaces_scale_rgb_by_the_dos_shade(void)
{
    use_real_palette();
    /* ARM mode takes the DOS brightness and light distance (SHADES.DAT strength, LIGHT.DAT rows) but
       scales the colour smoothly instead of snapping to a table row. */
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(0);
    ushort near_clamp = draw_one_texel(128), mid = draw_one_texel(512), far_mid = draw_one_texel(1024);
    ushort far_clamp = draw_one_texel(8192);
    TEST_ASSERT_LESS_THAN_UINT16(near_clamp, mid);
    TEST_ASSERT_LESS_THAN_UINT16(mid, far_mid);
    TEST_ASSERT_TRUE(far_clamp <= far_mid);
    TEST_ASSERT_EQUAL_HEX16(0, far_clamp); /* the fade reaches black instead of stopping at a dim value */
    load_shading_level_config(4);
    TEST_ASSERT_GREATER_THAN_UINT16(mid, draw_one_texel(512)); /* a lit light is brighter at the same distance */
    load_shading_level_config(0);
    DAT_000842b0 = -80; /* the old RGB bias no longer matters */
    TEST_ASSERT_EQUAL_HEX16(mid, draw_one_texel(512));
    options_set("light-mode", "arm");
    TEST_ASSERT_EQUAL_HEX16(mid, draw_one_texel(512));
    options_set("light-mode", "unknown");
    TEST_ASSERT_EQUAL_HEX16(mid, draw_one_texel(512));
}
static void test_arm_falloff_never_brightens_with_distance_and_ends_in_black(void)
{
    use_real_palette();
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(4);
    ushort last = 0xffff;
    int first_black = -1;
    for (int depth = 128; depth < 20000; depth += 16) {
        ushort c = draw_one_texel(depth);
        TEST_ASSERT_TRUE(c <= last);
        if (c == 0 && first_black < 0) first_black = depth;
        last = c;
    }
    TEST_ASSERT_TRUE(first_black > 0);
}
static void test_arm_falloffs_are_monotone_and_reach_black_at_the_same_distance(void)
{
    use_real_palette();
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(2);
    int black[2];
    for (int mode = 0; mode <= 1; mode++) {
        options_set("light-mode", mode == 0 ? "smooth" : "inv-square");
        ushort last = 0xffff;
        black[mode] = -1;
        for (int depth = 128; depth < 30000; depth += 16) {
            ushort c = draw_one_texel(depth);
            TEST_ASSERT_TRUE(c <= last);
            if (c == 0 && black[mode] < 0) black[mode] = depth;
            last = c;
        }
        TEST_ASSERT_TRUE(black[mode] > 0);
    }
    options_unset("light-mode");
    TEST_ASSERT_INT_WITHIN(600, black[0], black[1]);
}
static void test_arm_surfaces_are_smoother_than_dos_rows(void)
{
    use_real_palette();
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(0);
    int distinct = 0;
    ushort last = 0;
    for (int depth = 512; depth < 2048; depth += 8) {
        ushort c = draw_one_texel(depth);
        if (c != last) distinct++;
        last = c;
    }
    options_set("light-mode", "dos");
    int rows = 0;
    last = 0;
    for (int depth = 512; depth < 2048; depth += 8) {
        ushort c = draw_one_texel(depth);
        if (c != last) rows++;
        last = c;
    }
    TEST_ASSERT_GREATER_THAN_INT(rows, distinct);
}
static void test_ambient_bias_calibration_restores_default_and_env_override(void)
{
    g_ambient_bias_reduction = 64;
    set_ambient_bias_with_light(0); TEST_ASSERT_EQUAL_INT(32, DAT_000842b0);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(72, DAT_000842b0);
    options_set("ambient-bias-reduction", "0");
    set_ambient_bias_with_light(0); TEST_ASSERT_EQUAL_INT(-32, DAT_000842b0);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(8, DAT_000842b0);
    options_set("ambient-bias-reduction", "-8");
    set_ambient_bias_with_light(0); TEST_ASSERT_EQUAL_INT(-40, DAT_000842b0);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(0, DAT_000842b0);
    options_set("ambient-bias-reduction", "8");
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(16, DAT_000842b0);
}
static void test_arm_light_types_step_bias_by_sixteen_and_keep_calibration(void)
{
    const int strengths[] = {4,2,1,3}; /* lantern, torch, candle, taper */
    slots[5] = lights[0]; lights[0][2] = 63;
    g_ambient_bias_reduction = 64;
    for (int type = 0; type < 4; type++) {
        lights[0][0] = 0x90 + type;
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_INT(72 - strengths[type]*16, DAT_000842b0);
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_INT(72, DAT_000842b0);
    }
    /* Source index 3 must not affect the strength calculation. */
    slots[5] = NULL; slots[8] = lights[1]; lights[1][0] = 0x95;
    refresh_player_equipment_effects();
    TEST_ASSERT_EQUAL_HEX8(0x23, (byte)player[99]);
    TEST_ASSERT_EQUAL_INT(40, DAT_000842b0);
    /* An intrinsic light stronger than the torch wins, using the same steps. */
    player[0x5f] = 0x40; player[0x3e] = 0x30;
    refresh_player_equipment_effects(); TEST_ASSERT_EQUAL_INT(24, DAT_000842b0);
    options_set("ambient-bias-reduction", "0");
    refresh_player_equipment_effects(); TEST_ASSERT_EQUAL_INT(-40, DAT_000842b0);
}
static void test_dos_shading_uses_radial_distance_horizontally_and_vertically(void)
{
    options_set("dither", "1");
    options_set("light-mode", "dos");
    load_shading_level_config(2); /* torch */
    ushort center = g_palette_rgb565_backing[(byte)mappings[10*256+88]];
    ushort side = g_palette_rgb565_backing[(byte)mappings[11*256+88]];
    ushort corner = g_palette_rgb565_backing[(byte)mappings[13*256+88]];
    TEST_ASSERT_EQUAL_HEX16(center, draw_at_world_point(528, 140, 80));
    TEST_ASSERT_EQUAL_HEX16(side, draw_at_world_point(528, 190, 80));
    TEST_ASSERT_EQUAL_HEX16(side, draw_at_world_point(528, 90, 80));
    /* y projection is compressed by 0.9: 45 vertical pixels = 50 horizontal. */
    TEST_ASSERT_EQUAL_HEX16(side, draw_at_world_point(528, 140, 125));
    TEST_ASSERT_EQUAL_HEX16(side, draw_at_world_point(528, 140, 35));
    TEST_ASSERT_EQUAL_HEX16(corner, draw_at_world_point(528, 190, 125));
    TEST_ASSERT_EQUAL_HEX16(side, draw_at_world_depth(592));
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[12*256+88]],
                            draw_at_world_depth(656));
}
static void test_arm_shading_uses_the_same_radial_distance(void)
{
    use_real_palette();
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(0);
    const char *modes[] = {"arm", "unknown"};
    for (int i = 0; i < 2; i++) {
        options_set("light-mode", modes[i]);
        int reciprocal = (0x1000000 / 512) * 4;
        ushort center = lighting_draw_texel(reciprocal, 140, 80);
        ushort side = lighting_draw_texel(reciprocal, 190, 80);
        TEST_ASSERT_LESS_THAN_UINT(center, side);
        TEST_ASSERT_EQUAL_HEX16(side, lighting_draw_texel(reciprocal, 90, 80));
        TEST_ASSERT_EQUAL_HEX16(side, lighting_draw_texel(reciprocal, 140, 125));
        TEST_ASSERT_EQUAL_HEX16(side, lighting_draw_texel(reciprocal, 140, 35));
        TEST_ASSERT_EQUAL_HEX16(draw_one_texel(572), side);
        ushort corner = lighting_draw_texel(reciprocal, 190, 125);
        TEST_ASSERT_LESS_THAN_UINT(side, corner);
        TEST_ASSERT_EQUAL_HEX16(draw_one_texel(627), corner);
    }
}
static void test_span_advances_radial_distance_and_respects_left_clipping(void)
{
    use_real_palette();
    const char *modes[] = {"dos", "arm"};
    for (int i = 0; i < 2; i++) {
        options_set("light-mode", modes[i]);
        load_shading_level_config(2);
        g_palette_rgb565_backing[88] = 0xffff;
        ushort span[111];
        int reciprocal = (int)(16384.0f / (528.0f / 1500.0f));
        lighting_draw_span(reciprocal, 85, 80, 111, 85, span);
        TEST_ASSERT_EQUAL_HEX16(lighting_draw_texel(reciprocal, 85, 80), span[0]);
        TEST_ASSERT_EQUAL_HEX16(lighting_draw_texel(reciprocal, 140, 80), span[55]);
        TEST_ASSERT_EQUAL_HEX16(span[0], span[110]);
        TEST_ASSERT_NOT_EQUAL(span[0], span[55]);
        lighting_draw_span(reciprocal, 180, 80, 11, 190, span);
        for (int pixel = 0; pixel < 10; pixel++) TEST_ASSERT_EQUAL_HEX16(0, span[pixel]);
        TEST_ASSERT_EQUAL_HEX16(lighting_draw_texel(reciprocal, 190, 80), span[10]);
    }
}
static void test_dos_fractional_shades_alternate_like_the_original_span_accumulators(void)
{
    options_set("dither", "1");
    options_set("light-mode", "dos");
    DAT_0025063c = 64;
    DAT_002506dc = DAT_0025064c = 0;
    /* 272/32 = 8.5: +0.25 chooses shade 8, +0.75 chooses shade 9.
       Moving one pixel changes radial distance negligibly here. */
    ushort low = g_palette_rgb565_backing[(byte)mappings[8*256+88]];
    ushort high = g_palette_rgb565_backing[(byte)mappings[9*256+88]];
    TEST_ASSERT_NOT_EQUAL(low, high);
    TEST_ASSERT_EQUAL_HEX16(low, draw_at_world_point(272, 140, 80));
    TEST_ASSERT_EQUAL_HEX16(high, draw_at_world_point(272, 141, 80));
    TEST_ASSERT_EQUAL_HEX16(high, draw_at_world_point(272, 140, 81));
    TEST_ASSERT_EQUAL_HEX16(low, draw_at_world_point(272, 141, 81));
    /* Above the upper threshold both phases choose the next shade. */
    TEST_ASSERT_EQUAL_HEX16(high, draw_at_world_point(282, 140, 80));
    TEST_ASSERT_EQUAL_HEX16(high, draw_at_world_point(282, 141, 80));
}
static void test_dos_dither_keeps_its_phase_across_spans_and_clipping(void)
{
    options_set("dither", "1");
    options_set("light-mode", "dos");
    DAT_0025063c = 64;
    DAT_002506dc = DAT_0025064c = 0;
    int reciprocal = (int)(16384.0f / (272.0f / 1500.0f));
    ushort whole[4], clipped[4];
    lighting_draw_span(reciprocal, 139, 80, 4, 139, whole);
    for (int i = 0; i < 4; i++) {
        TEST_ASSERT_EQUAL_HEX16(lighting_draw_texel(reciprocal, 139 + i, 80), whole[i]);
    }
    lighting_draw_span(reciprocal, 139, 80, 4, 140, clipped);
    TEST_ASSERT_EQUAL_HEX16(0, clipped[0]);
    for (int i = 1; i < 4; i++) TEST_ASSERT_EQUAL_HEX16(whole[i], clipped[i]);
}
static void test_dos_bias_clamps_before_initial_shade_and_uses_all_sixteen_rows(void)
{
    options_set("dither", "1");
    options_set("light-mode", "dos");
    DAT_0025063c = 64;
    DAT_002506dc = -20;
    DAT_0025064c = 2;
    ushort near = g_palette_rgb565_backing[(byte)mappings[2*256+88]];
    TEST_ASSERT_EQUAL_HEX16(near, draw_at_world_point(272, 140, 80));
    TEST_ASSERT_EQUAL_HEX16(near, draw_at_world_point(272, 141, 80));
    DAT_002506dc = 0;
    DAT_0025064c = 0;
    ushort far = g_palette_rgb565_backing[(byte)mappings[15*256+88]];
    TEST_ASSERT_EQUAL_HEX16(far, draw_at_world_point(1200, 140, 80));
    TEST_ASSERT_EQUAL_HEX16(far, draw_at_world_point(1200, 141, 80));
}
/* A distance at which the shade falls between two brightness steps, so the two dither thresholds
   round the RGB channels differently. */
static int fractional_shade_reciprocal(void)
{
    const char *dither = "1";
    options_set("dither", dither);
    for (int depth = 100; depth < 4000; depth += 4) {
        int reciprocal = (int)(16384.0f / (depth / 1500.0f));
        if (lighting_draw_texel(reciprocal, 140, 80) != lighting_draw_texel(reciprocal, 141, 80))
            return reciprocal;
    }
    TEST_FAIL_MESSAGE("no distance dithers");
    return 0;
}

static void test_dither_defaults_on_and_zero_or_empty_disables_it_in_both_modes(void)
{
    use_real_palette();
    const char *modes[] = {"dos", "arm"};
    for (int i = 0; i < 2; i++) {
        options_set("light-mode", modes[i]);
        g_palette_rgb565_backing[88] = 0xffff;
        DAT_0025063c = 64;
        DAT_002506dc = DAT_0025064c = 0;
        int reciprocal = fractional_shade_reciprocal();
        options_set("dither", "0");
        ushort first = lighting_draw_texel(reciprocal, 140, 80);
        ushort second = lighting_draw_texel(reciprocal, 141, 80);
        TEST_ASSERT_EQUAL_HEX16(first, second);
        options_set("dither", "0");
        TEST_ASSERT_EQUAL_HEX16(first, lighting_draw_texel(reciprocal, 140, 80));
        TEST_ASSERT_EQUAL_HEX16(second, lighting_draw_texel(reciprocal, 141, 80));
        options_set("dither", "");
        TEST_ASSERT_EQUAL_HEX16(second, lighting_draw_texel(reciprocal, 141, 80));
        options_unset("dither");
        ushort default_first = lighting_draw_texel(reciprocal, 140, 80);
        ushort default_second = lighting_draw_texel(reciprocal, 141, 80);
        TEST_ASSERT_NOT_EQUAL(default_first, default_second);
        options_set("dither", "1");
        TEST_ASSERT_EQUAL_HEX16(default_first, lighting_draw_texel(reciprocal, 140, 80));
        TEST_ASSERT_EQUAL_HEX16(default_second, lighting_draw_texel(reciprocal, 141, 80));
    }
}
static void test_arm_dithers_rgb565_fractional_channels_with_stable_row_parity(void)
{
    use_real_palette();
    options_set("light-mode", "arm");
    options_set("dither", "1");
    g_palette_rgb565_backing[88] = 0xffff;
    DAT_0025063c = 64;
    DAT_002506dc = DAT_0025064c = 0;
    /* A fractional shade gives fractional RGB channels, so the two thresholds disagree. */
    int reciprocal = fractional_shade_reciprocal();
    ushort a = lighting_draw_texel(reciprocal, 140, 80);
    ushort b = lighting_draw_texel(reciprocal, 141, 80);
    TEST_ASSERT_NOT_EQUAL(a, b);
    TEST_ASSERT_EQUAL_HEX16(b, lighting_draw_texel(reciprocal, 140, 81));
    TEST_ASSERT_EQUAL_HEX16(a, lighting_draw_texel(reciprocal, 141, 81));
    ushort whole[4], clipped[4];
    lighting_draw_span(reciprocal, 139, 80, 4, 139, whole);
    lighting_draw_span(reciprocal, 139, 80, 4, 140, clipped);
    TEST_ASSERT_EQUAL_HEX16(0, clipped[0]);
    for (int i = 1; i < 4; i++) TEST_ASSERT_EQUAL_HEX16(whole[i], clipped[i]);
    /* Full brightness must not overflow any RGB channel. */
    int near_reciprocal = 1 << 28;
    TEST_ASSERT_EQUAL_HEX16(0xffff, lighting_draw_texel(near_reciprocal, 140, 80));
    TEST_ASSERT_EQUAL_HEX16(0xffff, lighting_draw_texel(near_reciprocal, 141, 80));
    g_palette_rgb565_backing[88] = 0;
    TEST_ASSERT_EQUAL_HEX16(0, lighting_draw_texel(reciprocal, 141, 80));
}
static void test_dos_mode_is_case_insensitive_for_equipment_and_surface_shading(void)
{
    const char *modes[] = {"dos", "DOS", "Dos", "dOs"};
    slots[5] = lights[0];
    for (int i = 0; i < 4; i++) {
        options_set("light-mode", modes[i]);
        lights[0][0] = 0x95;
        lights[0][2] = 63;
        DAT_000842b0 = 37;
        refresh_player_equipment_effects();
        assert_mode(2, 39, 2, -2);
        /* Original light scanning sets -32. ARM-only strength calibration
           would overwrite that with -24; DOS must skip that final step. */
        TEST_ASSERT_EQUAL_INT(-32, DAT_000842b0);
        ushort expected = g_palette_rgb565_backing[(byte)mappings[5*256+88]];
        TEST_ASSERT_EQUAL_HEX16(expected, draw_at_world_depth(272));
        /* DOS ignores ARM brightness calibration, regardless of spelling. */
        DAT_000842b0 = -80;
        TEST_ASSERT_EQUAL_HEX16(expected, draw_at_world_depth(272));
        lights[0][0] = 0x91;
        refresh_player_equipment_effects();
        assert_mode(0, 56, 5, -3);
        TEST_ASSERT_EQUAL_INT(-80, DAT_000842b0);
    }
}
static void test_fullbright_mask_is_the_indices_light_dat_never_changes(void)
{
    for (int i = 0; i < 0x18; i++) TEST_ASSERT_EQUAL_INT_MESSAGE(1, g_fullbright_palette_mask[i], "0x00-0x17");
    for (int i = 0xf0; i < 0x100; i++) TEST_ASSERT_EQUAL_INT_MESSAGE(1, g_fullbright_palette_mask[i], "0xf0-0xff");
    TEST_ASSERT_EQUAL_INT(0, g_fullbright_palette_mask[88]);
    TEST_ASSERT_EQUAL_INT(0, g_fullbright_palette_mask[0x30]); /* water ramp is shaded */
    mappings[5 * 256 + 0x10] = 0x40; /* a shaded row mapping lava elsewhere ... */
    update_fullbright_palette_mask();
    TEST_ASSERT_EQUAL_INT(0, g_fullbright_palette_mask[0x10]);
    mappings[0 * 256 + 0x11] = 0;    /* ... but the flicker-zeroed row 0 does not count */
    update_fullbright_palette_mask();
    TEST_ASSERT_EQUAL_INT(1, g_fullbright_palette_mask[0x11]);
}

static void test_arm_fullbright_colours_skip_distance_falloff_unless_disabled(void)
{
    set_ambient_bias_without_light(0);
    lighting_span_shade = 0x12; /* lava ramp */
    TEST_ASSERT_EQUAL_HEX16(0x112, draw_one_texel(4096)); /* fullbright by default */
    lighting_span_shade = 88; /* an ordinary colour still falls off */
    TEST_ASSERT_NOT_EQUAL(0x158, draw_one_texel(4096));
    lighting_span_shade = 0x12;
    options_set("fullbright", "0");
    TEST_ASSERT_NOT_EQUAL(0x112, draw_one_texel(4096)); /* explicit 0 restores the falloff */
    options_set("fullbright", "");
    TEST_ASSERT_NOT_EQUAL(0x112, draw_one_texel(4096));
    options_set("fullbright", "1");
    TEST_ASSERT_EQUAL_HEX16(0x112, draw_one_texel(4096));
    options_set("light-mode", "dos");
    lighting_span_shade = 0x12;
    TEST_ASSERT_EQUAL_HEX16(0x112, draw_one_texel(4096)); /* DOS table already leaves it alone */
}

/* Eye-space light at the pixel `shade_span_pixel(88, 2000, 0, 0, ...)` draws: straight ahead, depth 2000. */
static void put_light_at_pixel(float radius, float intensity)
{
    extra_light_add(0, 0, 0, radius, intensity);
    g_extra_lights[g_extra_light_count - 1].eye[0] = 0;
    g_extra_lights[g_extra_light_count - 1].eye[1] = 0;
    g_extra_lights[g_extra_light_count - 1].eye[2] = 2000;
}

static void test_extra_lights_are_ignored_unless_enabled(void)
{
    use_real_palette();
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(0);
    ushort lit_by_player = shade_span_pixel(88, 2000, 0, 0, 0, false, false);
    TEST_ASSERT_NOT_EQUAL(0xffff, lit_by_player);
    put_light_at_pixel(256, 1.0f);
    TEST_ASSERT_EQUAL_HEX16(lit_by_player, shade_span_pixel(88, 2000, 0, 0, 0, false, false));
    options_set("extralights", "1");
    TEST_ASSERT_EQUAL_HEX16(0xffff, shade_span_pixel(88, 2000, 0, 0, 0, false, false));
}

static void test_extra_light_falls_off_with_distance_and_stops_at_its_radius(void)
{
    use_real_palette();
    g_palette_rgb565_backing[88] = 0xffff;
    load_shading_level_config(0);
    options_set("extralights", "1");
    ushort player_only = shade_span_pixel(88, 2000, 0, 0, 0, false, false);
    put_light_at_pixel(256, 1.0f);
    float reach = 256 * (4096.0f / 1500.0f);
    g_extra_lights[0].eye[2] = 2000 - reach * 0.5f; /* half way out: dimmer than at the centre */
    ushort half = shade_span_pixel(88, 2000, 0, 0, 0, false, false);
    TEST_ASSERT_GREATER_THAN_UINT16(player_only, half);
    TEST_ASSERT_LESS_THAN_UINT16(0xffff, half);
    g_extra_lights[0].eye[2] = 2000 - reach * 1.01f; /* outside the radius: no effect */
    TEST_ASSERT_EQUAL_HEX16(player_only, shade_span_pixel(88, 2000, 0, 0, 0, false, false));
}

static void test_extra_lights_light_the_dos_shade_table_rows_too(void)
{
    options_set("light-mode", "dos");
    options_set("extralights", "1");
    load_shading_level_config(1); /* unlit shading level: the player's row at depth 2000 is dark */
    ushort dark = shade_span_pixel(88, 40000, 0, 0, 0, true, false);
    put_light_at_pixel(256, 1.0f);
    g_extra_lights[0].eye[2] = 40000;
    ushort lit = shade_span_pixel(88, 40000, 0, 0, 0, true, false);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[88], lit); /* row 0 leaves the colour alone */
    TEST_ASSERT_NOT_EQUAL(lit, dark);
}

static void test_light_list_holds_eight_lights_and_drops_the_rest(void)
{
    for (int i = 0; i < UW_MAX_EXTRA_LIGHTS; i++) TEST_ASSERT_EQUAL_INT(1, extra_light_add(i, 0, 0, 100, 1));
    TEST_ASSERT_EQUAL_INT(0, extra_light_add(99, 0, 0, 100, 1));
    TEST_ASSERT_EQUAL_INT(UW_MAX_EXTRA_LIGHTS, g_extra_light_count);
    TEST_ASSERT_EQUAL_FLOAT(0, g_extra_lights[0].world[0]);
    TEST_ASSERT_EQUAL_FLOAT(7, g_extra_lights[7].world[0]);
    extra_lights_reset();
    TEST_ASSERT_EQUAL_INT(0, g_extra_light_count);
}

static void test_light_sources_are_recognised_by_object_id(void)
{
    extra_lights_consider_object(0x12a, 100, 200, 300); /* campfire, but --extralights is off */
    TEST_ASSERT_EQUAL_INT(0, g_extra_light_count);
    options_set("extralights", "1");
    extra_lights_consider_object(0x12a, 100, 200, 300);
    TEST_ASSERT_EQUAL_INT(1, g_extra_light_count);
    TEST_ASSERT_EQUAL_FLOAT(100, g_extra_lights[0].world[0]);
    TEST_ASSERT_EQUAL_FLOAT(320, g_extra_lights[0].world[1]); /* height + the flame's rise */
    TEST_ASSERT_EQUAL_FLOAT(200, g_extra_lights[0].world[2]);
    extra_lights_consider_object(0x0017, 1, 2, 3);            /* magic missile */
    extra_lights_consider_object(0x8000 | 0x014, 1, 2, 3);    /* fireball; flag bits are ignored */
    TEST_ASSERT_EQUAL_INT(3, g_extra_light_count);
    extra_lights_consider_object(0x0123, 1, 2, 3);            /* ordinary scenery */
    extra_lights_consider_object(0x0004, 1, 2, 3);            /* a sword */
    TEST_ASSERT_EQUAL_INT(3, g_extra_light_count);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_dos_mode_is_case_insensitive_for_equipment_and_surface_shading);
    RUN_TEST(test_dither_defaults_on_and_zero_or_empty_disables_it_in_both_modes);
    RUN_TEST(test_arm_dithers_rgb565_fractional_channels_with_stable_row_parity);
    RUN_TEST(test_dos_fractional_shades_alternate_like_the_original_span_accumulators);
    RUN_TEST(test_dos_dither_keeps_its_phase_across_spans_and_clipping);
    RUN_TEST(test_dos_bias_clamps_before_initial_shade_and_uses_all_sixteen_rows);
    RUN_TEST(test_dos_shading_uses_radial_distance_horizontally_and_vertically);
    RUN_TEST(test_arm_shading_uses_the_same_radial_distance);
    RUN_TEST(test_span_advances_radial_distance_and_respects_left_clipping);
    RUN_TEST(test_each_light_selects_its_data_mode_and_extinguishes);
    RUN_TEST(test_extinguishing_one_source_keeps_the_other_source);
    RUN_TEST(test_held_light_and_intrinsic_light_compete_by_strength);
    RUN_TEST(test_night_vision_transition_reloads_palette_and_shades);
    RUN_TEST(test_textured_surfaces_use_palette_mapping_and_light_strength);
    RUN_TEST(test_wall_light_falloff_at_known_world_distances);
    RUN_TEST(test_spent_light_does_not_change_shading);
    RUN_TEST(test_daylight_override_is_preserved);
    RUN_TEST(test_arm_mode_toggles_rgb_bias_and_updates_automap_light_grid);
    RUN_TEST(test_arm_surfaces_scale_rgb_by_the_dos_shade);
    RUN_TEST(test_arm_surfaces_are_smoother_than_dos_rows);
    RUN_TEST(test_arm_falloffs_are_monotone_and_reach_black_at_the_same_distance);
    RUN_TEST(test_arm_falloff_never_brightens_with_distance_and_ends_in_black);
    RUN_TEST(test_ambient_bias_calibration_restores_default_and_env_override);
    RUN_TEST(test_arm_light_types_step_bias_by_sixteen_and_keep_calibration);
    RUN_TEST(test_fullbright_mask_is_the_indices_light_dat_never_changes);
    RUN_TEST(test_arm_fullbright_colours_skip_distance_falloff_unless_disabled);
    RUN_TEST(test_extra_lights_are_ignored_unless_enabled);
    RUN_TEST(test_extra_light_falls_off_with_distance_and_stops_at_its_radius);
    RUN_TEST(test_extra_lights_light_the_dos_shade_table_rows_too);
    RUN_TEST(test_light_list_holds_eight_lights_and_drops_the_rest);
    RUN_TEST(test_light_sources_are_recognised_by_object_id);
    return UNITY_END();
}

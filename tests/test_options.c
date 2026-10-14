#include "unity.h"
#include "src/headers/options.h"
#include <stdlib.h>
#include <string.h>

void setUp(void)
{
    unsetenv("UW_DISABLE_3D_OBJECTS");
    unsetenv("UW_LIGHT_MODE");
    unsetenv("UW_WALK_ACCEL");
    options_reset();
}
void tearDown(void)
{
    unsetenv("UW_DISABLE_3D_OBJECTS");
    unsetenv("UW_LIGHT_MODE");
    unsetenv("UW_WALK_ACCEL");
}

static void test_defaults(void)
{
    TEST_ASSERT_EQUAL_INT(1, g_opts.dither);
    TEST_ASSERT_EQUAL_INT(1, g_opts.fullbright);
    TEST_ASSERT_EQUAL_INT(1, g_opts.always_show_cursor);
    TEST_ASSERT_EQUAL_INT(0, g_opts.disable_3d_objects);
    TEST_ASSERT_EQUAL_FLOAT(1.0f, g_opts.brightness);
    TEST_ASSERT_EQUAL_INT(250, g_opts.palette_cycle_ms);
    TEST_ASSERT_EQUAL_INT(0x30, g_opts.walk_accel);
    TEST_ASSERT_NULL(g_opts.data_dir);
    TEST_ASSERT_FALSE(UW_OPT_ISSET(g_opts.hack_pitch));
}

static void test_command_line_sets_each_type(void)
{
    char *argv[] = {"uw", "--disable-3d-objects", "--light-mode=dos", "--walk-accel", "64", "--no-dither",
                    "--brightness", "1.5", "--data-dir", "/some/dir", "--hack-pitch=-3"};
    options_init((int)(sizeof argv / sizeof *argv), argv);
    TEST_ASSERT_EQUAL_INT(1, g_opts.disable_3d_objects);
    TEST_ASSERT_EQUAL_STRING("dos", g_opts.light_mode);
    TEST_ASSERT_EQUAL_INT(64, g_opts.walk_accel);
    TEST_ASSERT_EQUAL_INT(0, g_opts.dither);
    TEST_ASSERT_EQUAL_FLOAT(1.5f, g_opts.brightness);
    TEST_ASSERT_EQUAL_STRING("/some/dir", g_opts.data_dir);
    TEST_ASSERT_EQUAL_INT(-3, g_opts.hack_pitch);
    TEST_ASSERT_TRUE(UW_OPT_ISSET(g_opts.hack_pitch));
    TEST_ASSERT_EQUAL_INT(1, g_opts.fullbright); /* untouched options keep their defaults */
}

static void test_boolean_values(void)
{
    TEST_ASSERT_EQUAL_INT(0, options_set("fullbright", "0"));
    TEST_ASSERT_EQUAL_INT(0, g_opts.fullbright);
    TEST_ASSERT_EQUAL_INT(0, options_set("fullbright", "yes"));
    TEST_ASSERT_EQUAL_INT(1, g_opts.fullbright);
    TEST_ASSERT_EQUAL_INT(0, options_set("fullbright", ""));
    TEST_ASSERT_EQUAL_INT(0, g_opts.fullbright);
    TEST_ASSERT_EQUAL_INT(0, options_set("fullbright", "off"));
    TEST_ASSERT_EQUAL_INT(0, g_opts.fullbright);
    TEST_ASSERT_EQUAL_INT(0, options_set("fullbright", NULL));
    TEST_ASSERT_EQUAL_INT(1, g_opts.fullbright);
}

static void test_set_and_unset_by_name(void)
{
    TEST_ASSERT_EQUAL_INT(-1, options_set("no-such-option", "1"));
    TEST_ASSERT_EQUAL_INT(-1, options_unset("no-such-option"));
    TEST_ASSERT_EQUAL_INT(-2, options_set("walk-accel", "fast"));
    TEST_ASSERT_EQUAL_INT(0, options_set("walk_accel", "0x10")); /* underscores and hex accepted */
    TEST_ASSERT_EQUAL_INT(16, g_opts.walk_accel);
    TEST_ASSERT_EQUAL_INT(0, options_unset("walk-accel"));
    TEST_ASSERT_EQUAL_INT(0x30, g_opts.walk_accel);
    options_set("light-mode", "dos");
    options_unset("light-mode");
    TEST_ASSERT_EQUAL_STRING("linear", g_opts.light_mode);
}

static void test_environment_is_a_fallback_the_command_line_overrides(void)
{
    char *argv[] = {"uw", "--light-mode=dos"};
    setenv("UW_DISABLE_3D_OBJECTS", "1", 1);
    setenv("UW_LIGHT_MODE", "arm", 1);
    setenv("UW_WALK_ACCEL", "99", 1);
    options_init(2, argv);
    TEST_ASSERT_EQUAL_INT(1, g_opts.disable_3d_objects);
    TEST_ASSERT_EQUAL_INT(99, g_opts.walk_accel);
    TEST_ASSERT_EQUAL_STRING("dos", g_opts.light_mode);
}

static void test_reset_restores_every_default(void)
{
    options_set("disable-3d-objects", NULL);
    options_set("data-dir", "/x");
    options_set("brightness", "2");
    options_reset();
    TEST_ASSERT_EQUAL_INT(0, g_opts.disable_3d_objects);
    TEST_ASSERT_NULL(g_opts.data_dir);
    TEST_ASSERT_EQUAL_FLOAT(1.0f, g_opts.brightness);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_defaults);
    RUN_TEST(test_command_line_sets_each_type);
    RUN_TEST(test_boolean_values);
    RUN_TEST(test_set_and_unset_by_name);
    RUN_TEST(test_environment_is_a_fallback_the_command_line_overrides);
    RUN_TEST(test_reset_restores_every_default);
    return UNITY_END();
}

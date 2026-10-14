/* Debug panel picking/dispatch: keyboard UP/DOWN selection, RETURN/
 * LEFT/RIGHT dispatch, and mouse-click dispatch, all through the real
 * public dbgui_* API (src/debug_ui.c) -- no decompiled game code
 * involved, so this suite links that file directly rather than going
 * through the extract_functions.py pipeline (see tests/CMakeLists.txt).
 */
#include "unity.h"
#include "src/headers/debug_ui.h"
#include <string.h>
#include <stdio.h>

#define DBGUI_KEY_RETURN 13
#define DBGUI_KEY_UP     0x40000052
#define DBGUI_KEY_DOWN   0x40000051
#define DBGUI_KEY_LEFT   0x40000050
#define DBGUI_KEY_RIGHT  0x4000004F

#define N_FIELDS 10

static int vals[N_FIELDS];

void setUp(void)
{
    int i;
    for (i = 0; i < N_FIELDS; i++) vals[i] = 0;
    dbgui_test_reset();
    dbgui_toggle(); /* panel starts hidden; open it */
}
void tearDown(void) {}

static void build_fields(void)
{
    char name[16];
    int i;
    dbgui_begin("Test Panel");
    for (i = 0; i < N_FIELDS; i++) {
        snprintf(name, sizeof(name), "f%d", i);
        dbgui_field_toggle(name, &vals[i]);
    }
    dbgui_end();
}

/* Only field `want` may have changed since `before` was snapshotted. */
static void assert_only_field_toggled(const int *before, int want)
{
    int i;
    for (i = 0; i < N_FIELDS; i++) {
        if (i == want) {
            TEST_ASSERT_NOT_EQUAL_INT_MESSAGE(before[i], vals[i], "expected field did not toggle");
        } else {
            TEST_ASSERT_EQUAL_INT_MESSAGE(before[i], vals[i], "an unrelated field changed");
        }
    }
}

/* Regression test for the reported bug: repeatedly pressing DOWN then
 * dispatching (RETURN) should walk every field in order, 0..N-1, with
 * no field skipped or the walk stalling partway through -- QA reported
 * selection appearing "stuck" and unable to reach fields past index
 * 3 or 4 in a longer list. */
static void test_down_then_return_walks_every_field_in_order(void)
{
    int i;
    build_fields();
    for (i = 0; i < N_FIELDS; i++) {
        int before[N_FIELDS];
        memcpy(before, vals, sizeof(vals));
        dbgui_feed_key(DBGUI_KEY_RETURN);
        assert_only_field_toggled(before, i);
        dbgui_feed_key(DBGUI_KEY_DOWN);
    }
}

static void test_up_then_return_walks_every_field_in_reverse(void)
{
    int i;
    build_fields();
    /* Selection starts at 0; one UP wraps to the last field first. */
    for (i = N_FIELDS - 1; i >= 0; i--) {
        int before[N_FIELDS];
        dbgui_feed_key(DBGUI_KEY_UP);
        memcpy(before, vals, sizeof(vals));
        dbgui_feed_key(DBGUI_KEY_RETURN);
        assert_only_field_toggled(before, i);
    }
}

static void test_down_wraps_from_last_field_to_first(void)
{
    int i, before[N_FIELDS];
    build_fields();
    for (i = 0; i < N_FIELDS - 1; i++) dbgui_feed_key(DBGUI_KEY_DOWN);
    /* Now on the last field (N_FIELDS-1); one more DOWN should wrap to 0. */
    dbgui_feed_key(DBGUI_KEY_DOWN);
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_RETURN);
    assert_only_field_toggled(before, 0);
}

static void test_left_and_right_also_dispatch_toggle_fields(void)
{
    int before[N_FIELDS];
    build_fields();
    dbgui_feed_key(DBGUI_KEY_DOWN);
    dbgui_feed_key(DBGUI_KEY_DOWN);
    dbgui_feed_key(DBGUI_KEY_DOWN); /* selected = field 3 */
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_RIGHT);
    assert_only_field_toggled(before, 3);
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_LEFT);
    assert_only_field_toggled(before, 3);
}

static void test_hidden_panel_ignores_keyboard_input(void)
{
    int before[N_FIELDS];
    build_fields();
    dbgui_toggle(); /* close it */
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_DOWN);
    dbgui_feed_key(DBGUI_KEY_RETURN);
    assert_only_field_toggled(before, -1); /* -1: nothing should change */
}

/* Mouse picking: click through every field's real, just-drawn row rect
 * (dbgui_test_row_y, populated by dbgui_draw() the same way a live
 * frame populates it) and confirm each click dispatches that exact
 * field, including rows past index 3/4 -- the same scenario as the
 * keyboard regression test, through the other input path. */
static void test_mouse_click_dispatches_the_clicked_row(void)
{
    int i;
    build_fields();
    dbgui_draw();
    for (i = 0; i < N_FIELDS; i++) {
        int before[N_FIELDS];
        int ry = dbgui_test_row_y(i);
        TEST_ASSERT_GREATER_OR_EQUAL_INT_MESSAGE(0, ry, "row_y not populated for this field");
        memcpy(before, vals, sizeof(vals));
        dbgui_feed_mouse_down(dbgui_test_row_x(), ry);
        assert_only_field_toggled(before, i);
    }
}

static void test_mouse_click_outside_panel_dispatches_nothing(void)
{
    int before[N_FIELDS];
    build_fields();
    dbgui_draw();
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_mouse_down(dbgui_test_row_x(), dbgui_test_row_y(0) + 1000);
    assert_only_field_toggled(before, -1);
}

/* A read-only text row must never enter edit mode or change its bound
 * toggle neighbors -- just select cleanly and leave every value alone,
 * for both click and RETURN. */
static void test_text_field_is_read_only(void)
{
    int before[N_FIELDS];
    dbgui_begin("Test Panel");
    dbgui_field_toggle("f0", &vals[0]);
    dbgui_field_text("id", "0x145");
    dbgui_field_toggle("f1", &vals[1]);
    dbgui_end();
    dbgui_draw();

    memcpy(before, vals, sizeof(vals));
    /* Clicking the text row (index 1) selects it (for highlight/nav
       consistency) but must not touch either neighboring toggle. */
    dbgui_feed_mouse_down(dbgui_test_row_x(), dbgui_test_row_y(1));
    TEST_ASSERT_EQUAL_INT_MESSAGE(before[0], vals[0], "click on text row changed a toggle");
    TEST_ASSERT_EQUAL_INT_MESSAGE(before[1], vals[1], "click on text row changed a toggle");

    dbgui_feed_key(DBGUI_KEY_RETURN); /* still on the text row */
    TEST_ASSERT_EQUAL_INT_MESSAGE(before[0], vals[0], "RETURN on text row changed a toggle");
    TEST_ASSERT_EQUAL_INT_MESSAGE(before[1], vals[1], "RETURN on text row changed a toggle");

    /* Selection must still pass through it to reach the field after. */
    dbgui_feed_key(DBGUI_KEY_DOWN); /* text row -> f1 */
    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_NOT_EQUAL_INT_MESSAGE(before[1], vals[1], "selection did not pass through the text row to f1");
}

/* When the drawn panel's size changes between frames (any cause: panel switch, an inspector whose
 * row count varies per object), dbgui_draw must invalidate -- restore + have the game repaint the HUD
 * via the close hook -- and then fill only the new size. An unchanged size must not invalidate. */
extern int g_last_bg_fill_y1;
static int g_inval_hook_calls;
static void count_inval_hook(void) { g_inval_hook_calls++; }

static void draw_panel_with_fields(int n)
{
    dbgui_begin("Panel");
    for (int i = 0; i < n; i++) dbgui_field_toggle("f", &vals[i]);
    dbgui_end();
    dbgui_draw();
}

static void test_panel_size_change_invalidates_and_fills_own_size(void)
{
    g_inval_hook_calls = 0;
    dbgui_console_set_close_hook(count_inval_hook);
    draw_panel_with_fields(4);
    int tall_y1 = g_last_bg_fill_y1;
    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(0, tall_y1, "background fill never ran");
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, g_inval_hook_calls, "first draw invalidated");

    draw_panel_with_fields(4);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, g_inval_hook_calls, "same-size redraw invalidated");

    draw_panel_with_fields(1);
    TEST_ASSERT_EQUAL_INT_MESSAGE(1, g_inval_hook_calls, "shrinking did not invalidate");
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(tall_y1, g_last_bg_fill_y1, "fill still covers the old height");

    draw_panel_with_fields(4);
    TEST_ASSERT_EQUAL_INT_MESSAGE(2, g_inval_hook_calls, "growing did not invalidate");
    dbgui_console_set_close_hook(0);
}

/* A toggle-action row (debug panel's door "locked" field, in real
 * usage) must call its on_toggle callback on click/RETURN/LEFT/RIGHT,
 * display whatever value the caller passed this frame (not flip an
 * owned bit itself -- the real state lives in the caller, same as
 * dbgui_field_text), and never enter numeric-edit mode. */
static int g_action_calls;
static void count_action_call(void) { g_action_calls++; }

static void test_toggle_action_field_calls_its_callback(void)
{
    int before[N_FIELDS];
    g_action_calls = 0;
    dbgui_begin("Test Panel");
    dbgui_field_toggle("f0", &vals[0]);
    dbgui_field_toggle_action("locked", 1, count_action_call);
    dbgui_field_toggle("f1", &vals[1]);
    dbgui_end();
    dbgui_draw();
    memcpy(before, vals, sizeof(vals));

    dbgui_feed_mouse_down(dbgui_test_row_x(), dbgui_test_row_y(1));
    TEST_ASSERT_EQUAL_INT_MESSAGE(1, g_action_calls, "click did not call on_toggle");
    TEST_ASSERT_EQUAL_INT_MESSAGE(before[0], vals[0], "click on action row changed a toggle");
    TEST_ASSERT_EQUAL_INT_MESSAGE(before[1], vals[1], "click on action row changed a toggle");

    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_EQUAL_INT_MESSAGE(2, g_action_calls, "RETURN did not call on_toggle");
    dbgui_feed_key(DBGUI_KEY_LEFT);
    TEST_ASSERT_EQUAL_INT_MESSAGE(3, g_action_calls, "LEFT did not call on_toggle");
    dbgui_feed_key(DBGUI_KEY_RIGHT);
    TEST_ASSERT_EQUAL_INT_MESSAGE(4, g_action_calls, "RIGHT did not call on_toggle");

    /* Selection must still pass through it to reach the field after. */
    dbgui_feed_key(DBGUI_KEY_DOWN); /* locked row -> f1 */
    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_NOT_EQUAL_INT_MESSAGE(before[1], vals[1], "selection did not pass through the action row to f1");
}

/* ---- console ---- */
#define DBGUI_KEY_ESCAPE    27
#define DBGUI_KEY_BACKSPACE 8

static char g_con_lines[8][64];
static int g_con_line_count;
static void record_console_line(const char *line)
{
    if (g_con_line_count < 8) {
        strncpy(g_con_lines[g_con_line_count], line, 63);
        g_con_lines[g_con_line_count][63] = 0;
    }
    g_con_line_count++;
}

static void open_console(void)
{
    g_con_line_count = 0;
    dbgui_console_set_handler(record_console_line);
    build_fields();
    dbgui_draw();
    dbgui_console_open();
}

static void type_line(const char *text)
{
    dbgui_feed_text(text);
    dbgui_feed_key(DBGUI_KEY_RETURN);
}

static int g_close_hook_calls;
static void count_close_hook(void) { g_close_hook_calls++; }

void test_console_close_calls_redraw_hook_for_esc_and_toggle(void)
{
    g_close_hook_calls = 0;
    dbgui_console_set_close_hook(count_close_hook);
    open_console();
    dbgui_feed_key(DBGUI_KEY_ESCAPE);
    TEST_ASSERT_EQUAL_INT(1, g_close_hook_calls);
    dbgui_console_open();
    dbgui_toggle();
    TEST_ASSERT_EQUAL_INT(2, g_close_hook_calls);
    dbgui_console_set_close_hook(0);
}

void test_console_scroll_api_clamps_and_moves(void)
{
    int i;
    char buf[16];
    open_console();
    for (i = 0; i < 30; i++) { snprintf(buf, sizeof(buf), "line %d", i); dbgui_console_print(buf); }
    dbgui_console_scroll(-1);   /* already at the newest line: no underflow */
    dbgui_console_scroll(1000); /* clamps to the oldest page */
    dbgui_console_scroll(-1);
    dbgui_draw();
    TEST_ASSERT_TRUE(dbgui_console_active());
}

void test_console_button_style_open_makes_console_active(void)
{
    TEST_ASSERT_FALSE(dbgui_console_active());
    open_console();
    TEST_ASSERT_TRUE(dbgui_console_active());
    TEST_ASSERT_TRUE_MESSAGE(dbgui_visible(), "console must keep owning input via dbgui_visible()");
}

void test_console_submits_typed_line_to_handler(void)
{
    open_console();
    type_line("TELEPORT 56 45");
    TEST_ASSERT_EQUAL_INT(1, g_con_line_count);
    TEST_ASSERT_EQUAL_STRING("TELEPORT 56 45", g_con_lines[0]);
}

void test_console_backspace_edits_the_line(void)
{
    open_console();
    dbgui_feed_text("OPENMAPP");
    dbgui_feed_key(DBGUI_KEY_BACKSPACE);
    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_EQUAL_STRING("OPENMAP", g_con_lines[0]);
}

void test_console_empty_line_and_clear_do_not_reach_handler(void)
{
    open_console();
    dbgui_feed_key(DBGUI_KEY_RETURN);
    type_line("clear");
    TEST_ASSERT_EQUAL_INT(0, g_con_line_count);
}

void test_console_up_recalls_previous_commands(void)
{
    open_console();
    type_line("REVEAL");
    type_line("OPENMAP");
    dbgui_feed_key(DBGUI_KEY_UP);
    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_EQUAL_STRING("OPENMAP", g_con_lines[2]);
    dbgui_feed_key(DBGUI_KEY_UP);
    dbgui_feed_key(DBGUI_KEY_UP);
    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_EQUAL_STRING("REVEAL", g_con_lines[3]);
}

void test_console_ignores_backtick_text_and_does_not_edit_panel_fields(void)
{
    open_console();
    dbgui_feed_text("`W");
    dbgui_feed_key(DBGUI_KEY_RETURN);
    TEST_ASSERT_EQUAL_STRING("W", g_con_lines[0]);
    /* Panel rows must not react to clicks or keys while the console owns input. */
    dbgui_feed_mouse_down(dbgui_test_row_x(), dbgui_test_row_y(0));
    TEST_ASSERT_EQUAL_INT(0, vals[0]);
}

void test_console_escape_returns_to_panel_and_backtick_closes_all(void)
{
    open_console();
    dbgui_feed_key(DBGUI_KEY_ESCAPE);
    TEST_ASSERT_FALSE(dbgui_console_active());
    TEST_ASSERT_TRUE(dbgui_visible());

    dbgui_console_open();
    TEST_ASSERT_TRUE(dbgui_console_active());
    dbgui_toggle();
    TEST_ASSERT_FALSE(dbgui_console_active());
    TEST_ASSERT_FALSE(dbgui_visible());
}

void test_console_open_requires_visible_panel(void)
{
    dbgui_toggle(); /* hide */
    dbgui_console_open();
    TEST_ASSERT_FALSE(dbgui_console_active());
}

void test_console_draw_does_not_crash_with_long_output(void)
{
    int i;
    open_console();
    for (i = 0; i < 400; i++) dbgui_console_print("a long line of output that keeps scrolling the log around\nsecond");
    dbgui_feed_key(0x4000004B); /* PageUp */
    dbgui_draw();
    dbgui_feed_key(0x4000004E); /* PageDown */
    dbgui_draw();
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_down_then_return_walks_every_field_in_order);
    RUN_TEST(test_up_then_return_walks_every_field_in_reverse);
    RUN_TEST(test_down_wraps_from_last_field_to_first);
    RUN_TEST(test_left_and_right_also_dispatch_toggle_fields);
    RUN_TEST(test_hidden_panel_ignores_keyboard_input);
    RUN_TEST(test_mouse_click_dispatches_the_clicked_row);
    RUN_TEST(test_mouse_click_outside_panel_dispatches_nothing);
    RUN_TEST(test_text_field_is_read_only);
    RUN_TEST(test_panel_size_change_invalidates_and_fills_own_size);
    RUN_TEST(test_toggle_action_field_calls_its_callback);
    RUN_TEST(test_console_button_style_open_makes_console_active);
    RUN_TEST(test_console_submits_typed_line_to_handler);
    RUN_TEST(test_console_backspace_edits_the_line);
    RUN_TEST(test_console_empty_line_and_clear_do_not_reach_handler);
    RUN_TEST(test_console_up_recalls_previous_commands);
    RUN_TEST(test_console_ignores_backtick_text_and_does_not_edit_panel_fields);
    RUN_TEST(test_console_escape_returns_to_panel_and_backtick_closes_all);
    RUN_TEST(test_console_open_requires_visible_panel);
    RUN_TEST(test_console_scroll_api_clamps_and_moves);
    RUN_TEST(test_console_close_calls_redraw_hook_for_esc_and_toggle);
    RUN_TEST(test_console_draw_does_not_crash_with_long_output);
    return UNITY_END();
}

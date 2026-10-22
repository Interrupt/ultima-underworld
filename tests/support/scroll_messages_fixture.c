#include "scroll_messages_fixture.h"
static short panel[12], font[6];
static char lines[128][256];
static byte draw_color, text_mode;
static char character[256];
char *DAT_00086df8 = character;
undefined *DAT_00250704;
char *DAT_000879b0;
byte *g_draw_color_index = &draw_color;
undefined1 *DAT_00084298 = &text_mode;
ushort DAT_00201b60;
int DAT_00250718;
undefined4 DAT_00250708, DAT_0025071c, DAT_00250720, g_scroll_control_codes_enabled;
undefined2 DAT_00250714;
short DAT_00250710;
char *g_selected_object;
undefined2 g_cursor_holding_state;
char *DAT_00202098;
code *DAT_002020b8;
uw_object_type_props_t g_object_type_props[512];
undefined2 DAT_0023ae58_backing[48];
undefined2 DAT_0023adb8_backing[16];

void scroll_messages_fixture_reset(void)
{
    memset(panel, 0, sizeof panel);
    memset(font, 0, sizeof font);
    memset(lines, 0, sizeof lines);
    memset(character, 0, sizeof character);
    memset(((byte *)g_object_type_props), 0, sizeof g_object_type_props);
    g_object_type_props[0x80].has_look_description = 1;
    g_object_type_props[0x81].has_look_description = 1;
    g_object_type_props[0x40].has_look_description = 1;
    DAT_0023ae58_backing[0] = 5;
    DAT_0023ae58_backing[1] = 6;
    DAT_0023adb8_backing[0] = 0x1f8;
    DAT_0023adb8_backing[9] = 0x1f7;
    character[0x3d] = 1;
    DAT_00250704 = (undefined *)panel;
    DAT_000879b0 = (char *)font;
    panel[1] = 127; /* Room for text without the modal MORE prompt. */
    panel[3] = 240;
    font[3] = 1;
    DAT_00201b60 = 1;
    DAT_00250718 = DAT_00250708 = DAT_0025071c = DAT_00250720 = 0;
    DAT_00250714 = DAT_00250710 = 0;
    g_scroll_control_codes_enabled = 1;
    g_selected_object = NULL;
    g_cursor_holding_state = 0;
}
void scroll_messages_fixture_width(unsigned columns) { panel[3] = columns; }
void scroll_messages_fixture_print(unsigned address)
{
    for (size_t i = 0; i < uw_test_static_string_count; i++) {
        if (uw_test_static_strings[i].address == address) {
            message_scroll_print_wrapped((char *)uw_test_static_strings[i].actual);
            return;
        }
    }
    TEST_FAIL_MESSAGE("Unverified static string address");
}
const char *scroll_messages_fixture_line(unsigned line)
{
    TEST_ASSERT_LESS_THAN_UINT(128, line);
    return lines[line];
}

/* Exercise the actual scroll parser/wrapper and cursor state. Only font
   measurement and drawing are replaced by a one-cell character canvas. */
int measure_text_width(char *text) { return strlen(text); }
void draw_text_string(char *text, short x, short y)
{
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, x);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, y);
    TEST_ASSERT_LESS_THAN_INT(128, y);
    size_t length = strlen(text), used = strlen(lines[y]);
    TEST_ASSERT_LESS_THAN_UINT(256, x + length);
    if ((unsigned)x > used) memset(lines[y] + used, ' ', x - used);
    memcpy(lines[y] + x, text, length + 1);
}
void check_mouse_over_msg_scroll_panel() {}
void decrement_cursor_hide_depth(void) { TEST_FAIL_MESSAGE("Unexpected cursor hide"); }
int cursor_show_idle_tick(void) { TEST_FAIL_MESSAGE("Unexpected cursor show"); return 0; }
void msg_scroll_panel_reset(int mode) { TEST_FAIL_MESSAGE("Unexpected scroll reset"); }
void msg_scroll_more_prompt(void) { TEST_FAIL_MESSAGE("Unexpected MORE prompt"); }
void msg_scroll_scroll_up_line(int bottom) { TEST_FAIL_MESSAGE("Unexpected scrolling"); }
void wait_for_click_to_continue(short delay, uint mode) { TEST_FAIL_MESSAGE("Unexpected input wait"); }
uint read_realtime_clock_units(void) { return 0; }
void push_cursor_icon(int icon) {}
void print_scroll_message_by_id(unsigned id)
{
    TEST_ASSERT_EQUAL_HEX(0x93, id);
    message_scroll_print_wrapped("You have attained experience level");
}
int recalculate_player_stats(int refill) { return 0; }
void refresh_stats_panel_if_active(void) {}
int build_object_display_name(char *buffer, void *object_, int article, int mode)
{ ushort *object = (ushort *)object_;
    strcpy(buffer, (*object & 0x1ff) == 0x80 ? "a sack" :
                   (*object & 0x1ff) == 0x81 ? "a torch" : "iron key");
    return 1;
}
char *get_message_string(ushort id)
{
    switch (id) {
        case 0xa00: case 0xa60: return NULL; /* No quality adjective. */
        case 0x840: return "goblin";
        case 0x1405: return "a stone wall";
        case 0x1406: return "a stone floor";
        case 0x1407: return "a tiled floor";
        default: TEST_FAIL_MESSAGE("Unexpected message ID"); return NULL;
    }
}
int append_object_property_tag(ushort *object, short mode, char *buffer) { return 0; }
int append_object_special_name(void *object, short mode, char *buffer) { return 0; }
void describe_special_object_property(ushort *object, short mode) {}
int identify_mushroom_type(ushort *object, const uw_object_type_props_t *properties) { return 0; }
void look_at_inscribed_object(ushort *object, short mode) { TEST_FAIL_MESSAGE("Unexpected inscription"); }
char *format_object_display_name(char *name, int article, int mode)
{
    TEST_ASSERT_EQUAL_STRING("goblin", name);
    TEST_ASSERT_EQUAL_INT(1, article);
    return (char *)"a goblin";
}
long _isctype(int value, int flags) { TEST_FAIL_MESSAGE("Unexpected named creature"); return 0; }
char *_itoa(long value, char *buffer, long radix) { TEST_FAIL_MESSAGE("Unexpected quantity"); return buffer; }

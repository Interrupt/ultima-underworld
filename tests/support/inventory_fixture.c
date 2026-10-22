#include "game_fixture.h"
#include "inventory_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
uw_object_hdr_t *resolve_object_link(ushort *link_);
int encode_object_slot_index(const uw_object_hdr_t *object);
int build_object_display_name(char *text, void *object, int a, int b);
void push_cursor_icon(int type);
void pop_cursor_icon(ushort mode);
ushort *pick_object_under_cursor(int mode);
int target_in_range(short actor, void *target, char *range);
int target_line_of_sight(short actor, void *target);
int check_object_combination(void *actor, ushort *target, short key_id);
void handle_game_view_click_hold(void);
void interact_use(void);
void describe_picked_terrain(byte mode, short tile);
void handle_object_drop_target(short slot);
void complete_cast_spell_on_target(void);
void wait_for_click_release(int mode);
void complete_use_reagent_on_player(ushort *target, int clicked);
char *get_message_string(ushort id);
int message_scroll_print_wrapped(char *text);
void print_scroll_message_by_id(uint id);
void describe_object_owner(ushort *object, short mode);
void read_object_text(ushort *object, short mode);

ushort objects[5][4];

ushort slots[29];

char *g_backpack_slot_table = (char *)slots;

unsigned char g_backpack_widget_to_slot_backing[0x17];

char *g_current_container_record;

ushort *DAT_002046b4;

/* objects are raw 8-byte records; this is the single boundary where one is
 * viewed as a game object header. */
static uw_object_hdr_t *object_record(unsigned slot)
{ return (uw_object_hdr_t *)objects[slot]; }

uw_object_hdr_t *resolve_object_link(uw_link_word_t *link)
{
    unsigned slot = *link >> 6;
    if (slot == 0) return NULL;
    TEST_ASSERT_LESS_THAN_UINT(5, slot);
    return object_record(slot);
}

int encode_object_slot_index(const uw_object_hdr_t *object)
{
    if (object == NULL) return 0;
    for (int i = 1; i < 5; i++)
        if (object == object_record(i)) return i;
    TEST_FAIL_MESSAGE("Lookup must pass the actual object pointer to slot encoding");
    return 0;
}

int message_lookups, printed_messages, other_actions;

uint last_message_id;

char key_description[] = "Key information";

char *available_message;

ushort *last_action_object;

short last_action_mode;

short click_state[16];

short *DAT_00085a6c = click_state;

undefined2 g_cursor_mode, g_cursor_holding_state;

uw_mobile_object_t *g_player_object;
ushort *g_interact_target;

char *g_selected_object, *DAT_00202098, *DAT_002020b0;

short DAT_000858c4, DAT_002020ac;

code *DAT_002020b8;

char DAT_000878ec_backing[64];

char s_UNNAMED_00084f24[] = "UNNAMED";

char s_on_what__000878e0[] = " on what?";

void (*const PTR_FUN_000858c8_table[5])(void) = {0};

ushort *picked_target, *combined_target;

int prompt_prints, combination_calls, released_clicks, reset_cursor;

uint scroll_message;

int target_reachable = 1, target_obstructed;

int build_object_display_name(char *text, void *object, int a, int b)
{
    TEST_ASSERT_EQUAL_PTR(objects[2], object);
    (void)a; (void)b;
    strcpy(text, "key");
    return 1;
}

void push_cursor_icon(int type) { TEST_ASSERT_EQUAL_HEX16(0x106, type); }

void pop_cursor_icon(ushort mode) { TEST_ASSERT_EQUAL_INT(3, mode); reset_cursor++; }

ushort *pick_object_under_cursor(int mode)
{ TEST_ASSERT_EQUAL_INT(2, mode); return picked_target; }

int target_in_range(short actor, void *target, char *range)
{ (void)actor; (void)range; TEST_ASSERT_EQUAL_PTR(picked_target, target); return target_reachable; }

int target_line_of_sight(short actor, void *target)
{ (void)actor; TEST_ASSERT_EQUAL_PTR(picked_target, target); return target_obstructed; }

int check_object_combination(void *actor, ushort *target, short key_id)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor);
    TEST_ASSERT_EQUAL_INT(1, key_id);
    combined_target = target;
    combination_calls++;
    return 3;
}

void handle_game_view_click_hold(void) { TEST_FAIL_MESSAGE("Unexpected held click"); }

void interact_use(void) { TEST_FAIL_MESSAGE("Unexpected direct use"); }

void describe_picked_terrain(byte mode, short tile) { (void)mode; (void)tile; TEST_FAIL_MESSAGE("Unexpected terrain action"); }

void handle_object_drop_target(short slot) { (void)slot; TEST_FAIL_MESSAGE("Unexpected drop"); }

void complete_cast_spell_on_target(void) { TEST_FAIL_MESSAGE("Unexpected spell"); }

void wait_for_click_release(int mode) { TEST_ASSERT_EQUAL_INT(1, mode); released_clicks++; }

void complete_use_reagent_on_player(ushort *target, int clicked) { (void)target; (void)clicked; TEST_FAIL_MESSAGE("Unexpected reagent"); }

char *get_message_string(ushort id)
{
    message_lookups++;
    last_message_id = id;
    return available_message;
}

int message_scroll_print_wrapped(char *text)
{
    if (g_cursor_holding_state == 0 && picked_target != NULL) {
        TEST_ASSERT_EQUAL_STRING("Use key on what?", text);
        prompt_prints++;
        return 1;
    }
    TEST_ASSERT_EQUAL_PTR(available_message, text);
    TEST_ASSERT_EQUAL_STRING(key_description, text);
    printed_messages++;
    return 1;
}

void print_scroll_message_by_id(uint id)
{ TEST_ASSERT_NOT_NULL(picked_target); scroll_message = id; }

void describe_object_owner(ushort *object, short mode)
{ last_action_object = object; last_action_mode = mode; other_actions++; }

void read_object_text(ushort *object, short mode)
{ last_action_object = object; last_action_mode = mode; other_actions++; }

byte level_one[0x7c08];

ushort *level_object(unsigned slot)
{
    return uw_test_level_object(level_one, sizeof level_one, slot);
}

void load_key_from_level_one_sack(void)
{
    uw_test_load_map(level_one, sizeof level_one, 1);
    ushort *tile = (ushort *)(level_one + (23 + 6 * 64) * 4);
    ushort *sack = NULL, *key = NULL;
    unsigned slot = tile[1] >> 6;
    for (int count = 0; slot != 0 && count < 1024; count++) {
        ushort *object = level_object(slot);
        if ((*object & 0x1ff) == 0x82) { sack = object; break; }
        slot = object[2] >> 6;
    }
    TEST_ASSERT_NOT_NULL_MESSAGE(sack, "Expected the sack at level 1 tile (23,6)");
    slot = sack[3] >> 6;
    for (int count = 0; slot != 0 && count < 1024; count++) {
        ushort *object = level_object(slot);
        if ((*object & 0x1f0) == 0x100) { key = object; break; }
        slot = object[2] >> 6;
    }
    TEST_ASSERT_NOT_NULL_MESSAGE(key, "Expected a key inside the sack");
    memcpy(objects[1], sack, 8);
    memcpy(objects[2], key, 8);
    objects[1][3] = 2 << 6; /* put the real contents into fixture slot 2 */
    objects[2][2] &= 0x3f;
    g_current_container_record = (char *)objects[1];
}

static void reset_container_services(void);
static int cursor_hide_calls, cursor_show_calls;

void inventory_fixture_reset(void)
{
    reset_container_services();
    memset(click_state, 0, sizeof(click_state));
    g_cursor_mode = g_cursor_holding_state = 0;
    g_selected_object = DAT_00202098 = NULL;
    DAT_002020b8 = NULL;
    picked_target = combined_target = NULL;
    prompt_prints = combination_calls = released_clicks = reset_cursor = 0;
    scroll_message = 0;
    target_reachable = 1; target_obstructed = 0;
    g_player_object = (uw_mobile_object_t *)objects[4];
    strcpy((char *)DAT_000878ec_backing, "Use ");
    memset(objects, 0, sizeof(objects));
    memset(slots, 0, sizeof(slots));
    for (int i = 0; i < 20; i++) g_backpack_widget_to_slot_backing[i] = i;
    g_current_container_record = NULL;
    DAT_002046b4 = 0;
    message_lookups = printed_messages = other_actions = 0;
    last_message_id = 0;
    available_message = key_description;
    last_action_object = NULL;
    last_action_mode = 0;
    objects[1][0] = 0x15f; /* sack */
    objects[1][3] = 2 << 6; /* contents */
    objects[2][0] = 0x8000 | 0x80; /* quantity object, not a container */
    slots[4] = 1 << 6;
}

void inventory_fixture_dispose(void)
{
    char *record = g_open_container_list;
    while (record != NULL) {
        char *next;
        memcpy(&next, record + 0xc, sizeof next);
        free(record);
        record = next;
    }
    g_open_container_list = g_current_container_record = NULL;
    TEST_ASSERT_EQUAL_INT(cursor_hide_calls, cursor_show_calls);
}

/* Drawing is a boundary service; the real open/refresh/weight functions run. */
undefined4 DAT_002028a0_backing[16], DAT_002028e8_backing[32];
undefined4 DAT_00202938, DAT_0020299c, DAT_002029a0;
undefined2 DAT_00201b60;
undefined1 g_active_hud_panel;
unsigned char g_inventory_hotspot_table[0x17 * 0xe + 2];
unsigned char g_backpack_slot_to_widget_backing[0x1c];
uw_object_type_props_t g_object_type_props[512];
char *g_open_container_list;
int container_grid_redraws, container_arrow_redraws;

void decrement_cursor_hide_depth(void) { cursor_hide_calls++; }
int cursor_show_idle_tick(void) { cursor_show_calls++; return 0; }
void redraw_inventory_widget_range(int first, short last)
{
    if (first == 12 && last == 19) container_grid_redraws++;
    else { TEST_ASSERT_EQUAL_INT(20, first); TEST_ASSERT_EQUAL_INT(20, last); }
}
int lit_widget_redraws[0x16];
void redraw_inventory_widget(int widget)
{
    if (widget >= 0 && widget < 0x16) lit_widget_redraws[widget]++;
    if (widget == 21 || widget == 22) container_arrow_redraws++;
    else TEST_ASSERT_LESS_THAN_INT(11, widget);
}
uint grtile_alloc_registered(uint width, uint height)
{ (void)width; (void)height; return 1; }
int capture_framebuffer_rect_to_grtile(uint tile, int x, int y, int w, short h)
{ (void)tile; (void)x; (void)y; (void)w; (void)h; return 1; }
void draw_sprite_by_id(int tile, int x, int y, int w, short h)
{ (void)tile; (void)x; (void)y; (void)w; (void)h; }
void set_hud_status_value(byte field, ushort value)
{ (void)field; (void)value; TEST_FAIL_MESSAGE("Unexpected special container"); }
void *ce_malloc(unsigned int size)
{
    TEST_ASSERT_EQUAL_UINT(0x1c, size);
    void *record = calloc(1, size);
    TEST_ASSERT_NOT_NULL(record);
    return record;
}
void close_backpack_container(void) { TEST_FAIL_MESSAGE("Unexpected container close"); }
void free_open_container_chain(void) { TEST_FAIL_MESSAGE("Unexpected container root switch"); }

static void reset_container_services(void)
{
    memset(DAT_002028a0_backing, 0, sizeof DAT_002028a0_backing);
    memset(DAT_002028e8_backing, 0, sizeof DAT_002028e8_backing);
    memset(((byte *)g_object_type_props), 0, sizeof g_object_type_props);
    memset(g_inventory_hotspot_table, 0, sizeof g_inventory_hotspot_table);
    memset(g_backpack_slot_to_widget_backing, 0, sizeof g_backpack_slot_to_widget_backing);
    DAT_00202938 = DAT_0020299c = DAT_002029a0 = 0;
    DAT_00201b60 = g_active_hud_panel = 0;
    g_open_container_list = NULL;
    g_backpack_widget_to_slot_backing[20] = 19;
    container_grid_redraws = container_arrow_redraws = 0;
    memset(lit_widget_redraws, 0, sizeof lit_widget_redraws);
    cursor_hide_calls = cursor_show_calls = 0;
}

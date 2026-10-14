#include "babl_vm_fixture.h"
/* Real interpreter/menu/barter functions are extracted from babl.c. This
   fixture supplies storage, text, input, drawing and object-list services. */
intptr_t DAT_000bbf14;
short DAT_000bbf84;
intptr_t DAT_000bbf0c;
undefined2 DAT_000bbf88;
intptr_t DAT_000bbf70;
intptr_t DAT_000bbf00;
short DAT_000bbf78;
short DAT_000bbf2c;
short DAT_000bbf74;
short DAT_000bbf1c;
short DAT_000bbf08;
undefined2 DAT_000bbfe8_backing[8];
undefined2 DAT_000bbfd0_backing[8];
undefined4 DAT_000bc010_backing[4];
undefined4 DAT_000bc028_backing[4];
short DAT_0010078c, DAT_001006d0;
short DAT_00100794;
undefined1 DAT_00100680_backing[8192];
undefined2 DAT_00100790;
short DAT_00100788;
undefined1 DAT_001006d8_backing[8192];
short DAT_00100770_backing[1024];
undefined1 DAT_001007a0_backing[2048];
char *DAT_000bbf80;
uw_mobile_object_t *DAT_00100674;
uw_mobile_object_t *g_player_object;
char *DAT_00086df8;
uw_object_type_props_t g_object_type_props[512];
short babl_words[1024];
static short script_words[1024];
static unsigned char symbols[32 * 48];
static intptr_t natives[16];
static int printed_lines;
static char character[256];
static ushort player[32], npc[32];
unsigned babl_coverage[42];
int babl_saves, babl_steps, babl_frees, babl_expand_owned;
char babl_speech[128], babl_reply[128];
static int speak(intptr_t text) { strcpy(babl_speech, (char *)text); return 0; }
static int reply(intptr_t text) { strcpy(babl_reply, (char *)text); return 0; }
void babl_symbol(int record, const char *name, int slot, int count, int type, int category)
{
    unsigned char *symbol = symbols + record * 32;
    memset(symbol, 0, 32);
    strcpy((char *)symbol, name);
    ((short *)symbol)[12] = count;
    ((short *)symbol)[13] = slot;
    ((short *)symbol)[14] = type;
    ((short *)symbol)[15] = category;
}
void babl_fixture_reset(void)
{
    memset(babl_words, 0, sizeof babl_words);
    memset(symbols, 0, sizeof symbols);
    memset(natives, 0, sizeof natives);
    memset(character, 0, sizeof character);
    memset(player, 0, sizeof player);
    memset(npc, 0, sizeof npc);
    memset(DAT_000bbfd0_backing, 0, sizeof DAT_000bbfd0_backing);
    memset(DAT_000bbfe8_backing, 0, sizeof DAT_000bbfe8_backing);
    DAT_000bbf14 = (intptr_t)babl_words;
    DAT_000bbf84 = 64;
    DAT_000bbf0c = (intptr_t)(babl_words + 64);
    DAT_000bbf70 = (intptr_t)symbols;
    DAT_000bbf00 = (intptr_t)natives;
    DAT_000bbf80 = (char *)script_words;
    DAT_000bbf1c = DAT_000bbf78 = DAT_000bbf2c = DAT_000bbf74 = 0;
    DAT_00086df8 = character;
    DAT_00100674 = (uw_mobile_object_t *)npc;
    g_player_object = (uw_mobile_object_t *)player;
    memset(babl_items, 0, sizeof babl_items);
    memset(((byte *)g_object_type_props), 0, sizeof g_object_type_props);
    babl_drop_count = babl_loot_calls = printed_lines = 0;
    babl_input_polls = babl_invalid_first_choice = 0; babl_next_choice = 1;
    DAT_000bc020 = DAT_000bc000 = NULL;
    DAT_000bc004 = 10; DAT_000bc024 = 0;
    DAT_000bc008 = DAT_000bbfbc = DAT_000bbfb8 = 0;
    memset(DAT_000bbf98_backing, 0, sizeof DAT_000bbf98_backing);
    memset(DAT_000bbff0_backing, 0, sizeof DAT_000bbff0_backing);
    memset(DAT_000bbfa8_backing, 0xff, sizeof DAT_000bbfa8_backing);
    memset(DAT_000bbfc0_backing, 0xff, sizeof DAT_000bbfc0_backing);
    babl_saves = babl_steps = babl_frees = babl_expand_owned = 0;
    babl_speech[0] = babl_reply[0] = 0;
    babl_symbol(0, "say", 0, 1, 0, 0x111);
    babl_symbol(1, "respond", 1, 1, 0, 0x111);
    babl_register_builtin("say", (void *)speak);
    babl_register_builtin("respond", (void *)reply);
}
void babl_run(const short *script, size_t count)
{
    TEST_ASSERT_LESS_OR_EQUAL_UINT(sizeof script_words / sizeof *script_words, count);
    memcpy(script_words, script, count * sizeof *script);
    babl_steps = 0;
    TEST_ASSERT_EQUAL_UINT32(1, run_babl_bytecode_interpreter());
}
short babl_top(void) { return ((short *)DAT_000bbf0c)[DAT_000bbf78]; }
void flush_dirty_rect_to_display(int timed)
{
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(4096, ++babl_steps, "Conversation failed to terminate");
    short opcode = ((short *)DAT_000bbf80)[DAT_000bbf74];
    if (opcode >= 0 && opcode < 42) babl_coverage[opcode]++;
}
void save_npc_conversation_variables(void) { babl_saves++; }
char *get_message_string(ushort id)
{
    static char *messages[] = {"", "Hello", "Hello", "Goodbye", "Trade", "Leave"};
    TEST_ASSERT_LESS_THAN_UINT(6, id);
    return messages[id];
}
char *babl_expand_string_refs(char *text) { return babl_expand_owned ? strdup(text) : text; }
void babl_free(void *ptr) { babl_frees++; free((void *)ptr); }
void *babl_alloc(int size) { return (uint *)calloc(1, size); }
int debug_noop_checkpoint(void) { return 0; }
void decrement_cursor_hide_depth(void) {}
int cursor_show_idle_tick(void) { return 0; }
int restore_captured_grtile_backdrop(uint key) { return 0; }
int invalidate_grtile_by_key(uint key) { return 0; }
void select_msg_scroll_mode_2(void) {}
void select_msg_scroll_mode_normal(void) {}
void select_msg_scroll_mode_conversation(void) {}
void msg_scroll_panel_reset(int clear) {}
void wait_for_click_release(int buttons) {}
void echo_selected_conversation_choice(char *text) { strcpy(babl_reply, text); }
int message_scroll_print_wrapped(char *text) { return printed_lines++; }
short DAT_00201c84;
int babl_input_polls, babl_next_choice, babl_invalid_first_choice;
void advance_menu_music_track(void) {}
void dispatch_sticky_mode_handlers(void) {}
void wait_for_click_to_continue(short delay, uint mode) {}
void poll_input_bindings(void *input)
{
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(16, ++babl_input_polls, "Menu failed to release input wait");
    if (babl_invalid_first_choice && babl_input_polls == 1) {
        select_babl_menu_response(99);
        TEST_ASSERT_EQUAL_INT(1, DAT_0010078c);
        TEST_ASSERT_EQUAL_INT(1, DAT_00100790);
    } else {
        select_babl_menu_response(babl_next_choice);
        printed_lines = 0;
    }
}
void redraw_barter_slot_icon(short side, short slot) {}
void spawn_creature_death_loot(ushort *object)
{
    TEST_ASSERT_EQUAL_PTR(DAT_00100674, object);
    babl_loot_calls++;
    ((byte *)object)[14] |= 0x10;
}
short *DAT_00085a6c;
char *DAT_000879b0;
int DAT_00250718;
undefined s_scroll_newline_0008522c_backing[8192] = "\n";
ushort babl_items[12][4];
ushort *babl_dropped[8], *babl_drop_owner[8];
int babl_drop_count, babl_loot_calls;
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    TEST_ASSERT_GREATER_THAN_INT(0, slot);
    TEST_ASSERT_LESS_THAN_INT(12, slot);
    return babl_items[slot];
}
int encode_object_slot_index(const uw_object_hdr_t *object_) { char *object = (char *)object_; return (int)((object - (char *)babl_items[0]) / 8); }
uw_object_hdr_t *resolve_object_link(ushort *link_)
{ ushort *link = (ushort *)link_;
    if (link == (ushort *)((char *)DAT_00100674 + 6)) return *link ? babl_items[*link] : NULL;
    for (int i = 1; i < 12; i++)
        if (link == babl_items[i] + 2) return *link ? babl_items[*link] : NULL;
    TEST_FAIL_MESSAGE("Inventory link must address the NPC byte offset 6 or an object's link word");
    return NULL;
}
void object_list_unlink(ushort *head_, uw_object_hdr_t *object_)
{ byte *head = (byte *)head_; byte *object = (byte *)object_;
    TEST_ASSERT_EQUAL_PTR((char *)DAT_00100674 + 6, head);
    while (*head && (byte *)babl_items[*head] != object) head = (byte *)(babl_items[*head] + 2);
    TEST_ASSERT_NOT_EQUAL(0, *head);
    *head = object[2]; object[2] = 0;
}
void object_list_insert_head(ushort *head_, uw_object_hdr_t *object_)
{ byte *head = (byte *)head_; char *object = (char *)object_;
    TEST_ASSERT_EQUAL_PTR((char *)DAT_00100674 + 6, head);
    object[2] = *head;
    *head = encode_object_slot_index(object);
}
int drop_object_near_target(void *owner, void *object, short radius, uint flags)
{
    TEST_ASSERT_EQUAL_INT(5, radius);
    TEST_ASSERT_EQUAL_INT(0, flags);
    TEST_ASSERT_LESS_THAN_INT(8, babl_drop_count);
    babl_dropped[babl_drop_count] = object;
    babl_drop_owner[babl_drop_count++] = owner;
    return 1;
}
short *DAT_000bc020, *DAT_000bc000;
short DAT_000bc004, DAT_000bc024;
undefined2 DAT_000bbfbc, DAT_000bbfb8;
undefined1 DAT_000bc008;
undefined4 DAT_000bbf98_backing[8], DAT_000bbff0_backing[8];

void babl_builtin_say(char *text) { strcpy(babl_speech, text); }
void draw_hotspot_crosshair_marker(short side, short slot) {}
void free_object_slot(uw_object_hdr_t *object) { memset(object, 0, 8); }
long ce_srand(long seed) { return 0; }
int randomize_value_pct(short value, short low, short high) { return value; }
void compute_dimension_volume(void) {}

uw_monster_type_props_t g_monster_type_props[64];
short DAT_00201b68, DAT_00201c74;
int babl_awarded_xp;
void grant_experience_points(short xp) { babl_awarded_xp += xp; }
void npc_set_goal_for_object(uw_mobile_object_t *object, int goal, int target)
{
    ushort packed = *(ushort *)(object + 11);
    *(ushort *)(object + 11) = (packed & 0xf000) | (target << 4) | goal;
}
void babl_bind_npc_variables(void)
{
    static const char *names[] = {
        "dungeon_level", "game_days", "game_mins", "game_time", "new_player_exp",
        "npc_arms", "npc_attitude", "npc_goal", "npc_gtarg", "npc_health", "npc_hp",
        "npc_hunger", "npc_level", "npc_name", "npc_power", "npc_talkedto",
        "npc_whoami", "npc_xhome", "npc_yhome", "play_arms", "play_drawn",
        "play_health", "play_hp", "play_hunger", "play_level", "play_mana",
        "play_name", "play_poison", "play_power", "play_sex"
    };
    for (unsigned i=0; i<sizeof names/sizeof *names; i++)
        babl_symbol(i + 2, names[i], i + 2, 1, 0x126, 0);
    DAT_00201b68 = 1; DAT_00201c74 = 2;
    memset(((byte *)g_monster_type_props), 0, sizeof g_monster_type_props);
    babl_awarded_xp = 0;
}
short babl_named_word(char *name)
{
    short value = -1;
    babl_get_variable(name, &value, 1);
    return value;
}

undefined2 DAT_000bbfa8_backing[8], DAT_000bbfc0_backing[8];
undefined2 DAT_000bbfd8, DAT_000bbfdc, DAT_000bbfe0;
undefined1 DAT_000845b8_backing[16], DAT_000845ba_backing[16];
undefined1 DAT_000845d8_backing[16], DAT_000845da_backing[16];

int g_blit_transparent_mode;
uint grtile_alloc_registered(uint width, uint height) { return 1; }
int capture_framebuffer_rect_to_grtile(uint tile, int x, int y, int width, short height) { return 1; }

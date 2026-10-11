#include "babl_conversation_fixture.h"
#include "src/headers/file_io.h"
#include "src/headers/options.h"
#include <sys/stat.h>
#include <unistd.h>

/* Real: start_npc_conversation, the CNV.ARK script loader and builtins,
   bglobals.dat persistence, STRINGS.PAK decoding, menus and barter rules.
   Controlled: drawing, scroll output, input, and the object-world builtins. */

/* ---- storage babl.c keeps as file-local statics ----------------------- */
intptr_t DAT_000bbf14;
short DAT_000bbf84;
intptr_t DAT_000bbf0c;
undefined2 DAT_000bbf88;
intptr_t DAT_000bbf70;
intptr_t DAT_000bbf00;
short DAT_000bbf78, DAT_000bbf2c, DAT_000bbf74, DAT_000bbf1c, DAT_000bbf08;
undefined2 DAT_000bbfe8_backing[8], DAT_000bbfd0_backing[8];
undefined4 DAT_000bc010_backing[4], DAT_000bc028_backing[4];
short DAT_0010078c, DAT_00100794;
undefined1 DAT_00100680_backing[8192], DAT_001006d8_backing[8192];
undefined2 DAT_00100790;
short DAT_00100788;
short DAT_00100770_backing[1024];
undefined1 DAT_001007a0_backing[2048];
char *DAT_000bbf80;
uw_mobile_object_t *DAT_00100674;
short *DAT_000bc020, *DAT_000bc000;
short DAT_000bc004, DAT_000bc024;
undefined2 DAT_000bbfbc, DAT_000bbfb8;
undefined1 DAT_000bc008;
undefined4 DAT_000bbf98_backing[8], DAT_000bbff0_backing[8];
undefined2 DAT_000bbfa8_backing[8], DAT_000bbfc0_backing[8];
undefined2 DAT_000bbfd8, DAT_000bbfdc, DAT_000bbfe0;
int DAT_000bbf10;
undefined2 DAT_000bbf8c;
undefined2 DAT_0024cfac;
short DAT_000bbf24;
char *DAT_000bbf18;
short DAT_000bbf7c;
undefined1 DAT_000bbf30;
char *DAT_000bbf20;
uint *DAT_000bbf04;
char *DAT_00100784, *DAT_00100670, *DAT_001007c0, *DAT_001007b8;
char DAT_001007b4;
short DAT_001007bc;
short DAT_001006d0;
undefined1 DAT_00100678;
short DAT_00201c84;
int DAT_00250718;
char *DAT_00100728_backing[256];
char *DAT_00085a6c_unused;
short *DAT_00085a6c;
char *DAT_000879b0;

/* ---- game-wide globals the real functions touch ----------------------- */
uw_mobile_object_t *g_player_object;
char *DAT_00086df8;
uw_object_type_props_t g_object_type_props[512];
uw_monster_type_props_t g_monster_type_props[64];
short DAT_00201b68, DAT_00201c74;
undefined1 DAT_0023cca8_backing[1024];
char *DAT_00248410;
ushort DAT_001007c4;
undefined s_scroll_newline_0008522c_backing[8192] = "\n";
int g_blit_transparent_mode;
int g_text_use_palette_color;
byte *g_draw_color_index_unused;
undefined *DAT_00250704 = (undefined *)(char[64]){0};
ushort *DAT_00100674_unused;
static char character[256], player_attributes[64];
extern char *DAT_0023be74;
static ushort player[32];
ushort *conv_npc;

/* STRINGS.PAK decoder state (same layout the introduction suite uses). */
undefined1 DAT_0023c698_backing[1024], DAT_00101968_backing[260];
undefined4 DAT_0024bf98;
unsigned short *DAT_0024cfb8;
char *DAT_0024cfa8;
short DAT_0024cfc0, DAT_0024cfb4;
undefined2 DAT_000878bc;
undefined1 DAT_0024af98_backing[4096], DAT_0024bfa0_backing[4096], DAT_0024bfa1_backing[4096];
undefined1 DAT_0024bfa2_backing[8192], DAT_0024bfa3_backing[8192], DAT_0024bfa4_backing[8192], DAT_0024bfa5_backing[8192];
undefined1 DAT_0024c7a2_backing[4096], DAT_0024c7a3_backing[4096];
undefined2 DAT_0024cfbc_backing[4];
char *g_bfa2_real_ptrs[263168];
static ushort strings_tree_count;

/* ---- scripted player --------------------------------------------------- */
conv_line conv_log[1024];
int conv_log_count;
int conv_steps, conv_polls;
static struct { const char *text; void (*before)(void); } queue[64];
static int queue_head, queue_tail, scroll_line;
static char scroll_mode;
static char workspace[64];
static int builtin_calls_n;
static struct { unsigned slot; ushort record[32]; } npcs[4];
static int npc_count;
static struct { const char *name; int calls; } builtin_calls[32];

static void log_line(char kind, const char *text)
{
    TEST_ASSERT_LESS_THAN_INT(1024, conv_log_count);
    conv_line *line = &conv_log[conv_log_count++];
    line->kind = kind;
    snprintf(line->text, sizeof line->text, "%s", text);
}

int conv_log_has(char kind, const char *needle)
{
    for (int i = 0; i < conv_log_count; i++)
        if (conv_log[i].kind == kind && strstr(conv_log[i].text, needle)) return 1;
    return 0;
}

int conv_menu_count(void) { return DAT_00100794 > 1 ? DAT_00100794 - 1 : 0; }
const char *conv_menu_text(int index)
{
    return ((char **)DAT_00100680_backing)[index + 1];
}

void conv_dump(void)
{
    for (int i = 0; i < conv_log_count; i++)
        printf("  %c %s\n", conv_log[i].kind, conv_log[i].text);
}

void conv_pick(const char *text, void (*before)(void))
{
    TEST_ASSERT_LESS_THAN_INT(64, queue_tail);
    queue[queue_tail].text = text;
    queue[queue_tail++].before = before;
}

void conv_expect_finished(void)
{
    char message[200];
    snprintf(message, sizeof message, "unused scripted choice %d: \"%s\"", queue_head,
             queue_head < queue_tail ? queue[queue_head].text : "");
    TEST_ASSERT_EQUAL_INT_MESSAGE(queue_tail, queue_head, message);
}

int conv_builtin_calls(const char *name)
{
    for (int i = 0; i < builtin_calls_n; i++)
        if (!strcmp(builtin_calls[i].name, name)) return builtin_calls[i].calls;
    return 0;
}
static void builtin_called(const char *name)
{
    for (int i = 0; i < builtin_calls_n; i++)
        if (!strcmp(builtin_calls[i].name, name)) { builtin_calls[i].calls++; return; }
    builtin_calls[builtin_calls_n].name = name;
    builtin_calls[builtin_calls_n++].calls = 1;
    log_line(CONV_BUILTIN, name);
}

/* The player: answer the menu the conversation is waiting on. */
void poll_input_bindings(void *input)
{
    (void)input;
    char listing[1200] = "";
    int count = conv_menu_count();
    for (int i = 1; i <= count; i++) {
        char entry[200];
        snprintf(entry, sizeof entry, "\n    %d. %s", i, conv_menu_text(i - 1));
        if (strlen(listing) + strlen(entry) < sizeof listing) strcat(listing, entry);
    }
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(4, ++conv_polls, "Menu failed to take a response");
    char message[1400];
    if (queue_head >= queue_tail) {
        snprintf(message, sizeof message, "Conversation is waiting on a menu with no scripted choice:%s", listing);
        conv_dump();
        TEST_FAIL_MESSAGE(message);
    }
    const char *wanted = queue[queue_head].text;
    int pick = 0;
    for (int i = 1; i <= count && wanted && !pick; i++)
        if (strstr(conv_menu_text(i - 1), wanted)) pick = i;
    if (!wanted) pick = 1;
    if (!pick) {
        snprintf(message, sizeof message, "No menu entry contains \"%s\"; offered:%s", wanted, listing);
        conv_dump();
        TEST_FAIL_MESSAGE(message);
    }
    log_line(CONV_MENU, listing + 1);
    void (*before)(void) = queue[queue_head++].before;
    if (before) before();
    conv_polls = 0;
    select_babl_menu_response(pick);
}

void flush_dirty_rect_to_display(int timed)
{
    (void)timed;
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(20000, ++conv_steps, "Conversation failed to terminate");
}

int message_scroll_print_wrapped(char *text)
{
    char clean[320];
    const char *start = text;
    char kind = CONV_REPLY;
    if (text[0] == '\\' && text[1] == 'P') { kind = CONV_SPEECH; start += 2; }
    else if (text[0] == '\\' && text[1] == '2') start += 2;
    else if (scroll_mode == 'c') kind = CONV_CHOICE;
    snprintf(clean, sizeof clean, "%s", start);
    size_t length = strlen(clean);
    while (length && (clean[length - 1] == '\n' || clean[length - 1] == '0' || clean[length - 1] == '\\')) {
        if (clean[length - 1] == '0' && !(length > 1 && clean[length - 2] == '\\')) break;
        if (clean[length - 1] == '\\') { clean[--length] = 0; continue; }
        clean[--length] = 0;
    }
    if (text[0] >= '1' && text[0] <= '9' && text[1] == '.') return scroll_line++; /* a menu entry */
    log_line(kind, clean);
    return scroll_line++;
}
void select_msg_scroll_mode_2(void) { scroll_mode = '2'; }
void select_msg_scroll_mode_normal(void) { scroll_mode = 'n'; }
void select_msg_scroll_mode_conversation(void) { scroll_mode = 'c'; }
void msg_scroll_panel_reset(int clear) { (void)clear; scroll_line = 0; }
void wait_for_click_release(int buttons) { (void)buttons; }
void wait_for_click_to_continue(short delay, uint mode) { (void)delay; (void)mode; }
void advance_menu_music_track(void) {}
void dispatch_sticky_mode_handlers(void) {}
int debug_noop_checkpoint(void) { return 0; }

/* ---- services ---------------------------------------------------------- */
void babl_free(void *ptr) { free(ptr); }
void *babl_alloc(int size) { return calloc(1, size); }
void *ce_malloc(unsigned size) { return malloc(size); }
void LocalFree(void *ptr) { free(ptr); }
int open_file_for_read(const char *path) { return uw_file_open_read(path); }
int open_existing_file_rw(char *path) { return uw_file_open_write(path, 0); }
int open_existing_file_rw_alt(const char *path) { return uw_file_open_write(path, 0); }
int write_file_handle(int handle, const void *buffer, uint size) { return uw_file_write(handle, buffer, size); }
long CloseHandle(int handle) { return uw_file_close(handle); }
void report_fatal_error_and_exit(ushort code) { (void)code; TEST_FAIL_MESSAGE("Conversation reached a fatal-error path"); }

bool open_level_archive(void *handle, char *path)
{
    int file = uw_file_open_read(path);
    if (file < 0) return false;
    ushort entries;
    TEST_ASSERT_EQUAL_INT(2, uw_file_read(file, &entries, 2));
    TEST_ASSERT_LESS_OR_EQUAL_UINT(sizeof(DAT_000b78b8_backing), entries * 4);
    TEST_ASSERT_EQUAL_INT(entries * 4, uw_file_read(file, DAT_000b78b8_backing, entries * 4));
    memset(handle, 0, 16);
    memcpy(handle, &file, 4);
    memcpy((char *)handle + 8, &entries, 2);
    return true;
}
byte close_level_archive(void *handle)
{
    int file;
    memcpy(&file, handle, 4);
    return uw_file_close(file);
}

short g_mouse_x, g_mouse_y;
ushort *pick_object_under_cursor(int mode) { (void)mode; return NULL; }

uint rand_below(int limit) { return limit > 0 ? ce_rand() % limit : 0; }

void pick_random_pending_music_track(void) {}
undefined1 g_active_hud_panel;

/* ---- presentation (no-ops) -------------------------------------------- */
void decrement_cursor_hide_depth(void) {}
int cursor_show_idle_tick(void) { return 0; }
int restore_captured_grtile_backdrop(uint key) { (void)key; return 0; }
int invalidate_grtile_by_key(uint key) { (void)key; return 0; }
void redraw_barter_slot_icon(short side, short slot) { (void)side; (void)slot; }
void draw_hotspot_crosshair_marker(short side, short slot) { (void)side; (void)slot; }
uint grtile_alloc_registered(uint width, uint height) { (void)width; (void)height; return 1; }
int capture_framebuffer_rect_to_grtile(uint tile, int x, int y, int width, short height)
{ (void)tile; (void)x; (void)y; (void)width; (void)height; return 1; }
void compute_dimension_volume(void) {}
int scroll_text_entry_prompt(char *prompt, char *buffer, char *dest, int all, short max)
{ (void)prompt; (void)buffer; (void)all; (void)max; dest[0] = 0; return 0; }
long ce_srand(long seed) { (void)seed; return 0; }
int randomize_value_pct(short value, short low, short high) { (void)low; (void)high; return value; }
void grant_experience_points(short xp) { (void)xp; }

/* ---- inventory model: 8-byte object records chained through word 2 -----
   Mirrors the packed UW1 layout the barter code relies on: word 2 holds a 6-bit
   quality in bits 0-5 and the next slot in bits 6-15; an NPC's byte-6 word heads
   its inventory chain the same way. */
ushort babl_items[12][4];
ushort *babl_dropped[16], *babl_drop_owner[16];
int babl_drop_count;
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    TEST_ASSERT_GREATER_THAN_INT(0, slot);
    TEST_ASSERT_LESS_THAN_INT(12, slot);
    return (uw_object_hdr_t *)babl_items[slot];
}
int encode_object_slot_index(const uw_object_hdr_t *object_)
{ return (int)(((char *)object_ - (char *)babl_items[0]) / 8); }
uw_object_hdr_t *resolve_object_link(ushort *link)
{
    if (link != (ushort *)((char *)DAT_00100674 + 6)) {
        int owned = 0;
        for (int i = 1; i < 12; i++) owned |= link == babl_items[i] + 2;
        TEST_ASSERT_TRUE_MESSAGE(owned, "Inventory link must be the NPC's byte-6 word or an item's chain word");
    }
    return *link >> 6 ? (uw_object_hdr_t *)babl_items[*link >> 6] : NULL;
}
void object_list_unlink(ushort *head, uw_object_hdr_t *object_)
{
    ushort *object = (ushort *)object_;
    int slot = encode_object_slot_index(object_);
    while (*head >> 6 && *head >> 6 != slot) head = babl_items[*head >> 6] + 2;
    TEST_ASSERT_EQUAL_INT_MESSAGE(slot, *head >> 6, "Unlinked object is not in the list");
    *head = (*head & 0x3f) | (object[2] & ~0x3f);
    object[2] &= 0x3f;
}
void object_list_insert_head(ushort *head, uw_object_hdr_t *object_)
{
    ushort *object = (ushort *)object_;
    object[2] = (object[2] & 0x3f) | (*head & ~0x3f);
    *head = (*head & 0x3f) | (encode_object_slot_index(object_) << 6);
}
int drop_object_near_target(void *owner, void *object, short radius, uint flags)
{
    (void)radius; (void)flags;
    TEST_ASSERT_LESS_THAN_INT(16, babl_drop_count);
    babl_dropped[babl_drop_count] = object;
    babl_drop_owner[babl_drop_count++] = owner;
    return 1;
}
void free_object_slot(uw_object_hdr_t *object) { memset(object, 0, 8); }
void spawn_creature_death_loot(ushort *object) { ((byte *)object)[14] |= 0x10; }
void npc_set_goal_for_object(uw_mobile_object_t *object, int goal, int target)
{
    ushort *packed = (ushort *)((byte *)object + 11);
    *packed = (*packed & 0xf000) | (target << 4) | goal;
}
void conv_set_object_value(int object_id, int value)
{
    *(short *)(((byte *)g_object_type_props) + 5 + object_id * 13) = value;
}
/* Item `slot` (1-11) becomes an object of `object_id` at full quality. */
static void make_item(int slot, int object_id)
{
    memset(babl_items[slot], 0, sizeof babl_items[slot]);
    babl_items[slot][0] = object_id;
    babl_items[slot][2] = 63;
}
ushort *conv_npc_record(unsigned slot);
void conv_npc_add_item(unsigned npc_slot, int slot, int object_id)
{
    make_item(slot, object_id);
    object_list_insert_head(conv_npc_record(npc_slot) + 3, (uw_object_hdr_t *)babl_items[slot]);
}
void conv_set_trade_stats(unsigned npc_slot, int patience, int level)
{
    g_monster_type_props[conv_npc_record(npc_slot)[0] & 0x3f].trade_patience = patience;
    g_monster_type_props[conv_npc_record(npc_slot)[0] & 0x3f].trade_level = level;
}
/* The player has put item `slot` (1-11) in offer position `position` (0-3). */
void conv_player_offers(int position, int slot, int object_id)
{
    make_item(slot, object_id);
    DAT_000bbfd0_backing[position] = slot;
    DAT_000bbf98_backing[position] = 1;
}

/* ---- object-world builtins the level-1 scripts don't need to run ------- */
#define BUILTIN_STUB(type, name, ...) type babl_builtin_##name(__VA_ARGS__)
BUILTIN_STUB(int, ask, void) { builtin_called("ask"); return 0; }
BUILTIN_STUB(int, show_inv, char *a) { (void)a; builtin_called("show_inv"); return 0; }
BUILTIN_STUB(int, give_to_npc, char *a) { (void)a; builtin_called("give_to_npc"); return 0; }
BUILTIN_STUB(int, give_ptr_npc, char *a) { (void)a; builtin_called("give_ptr_npc"); return 0; }
BUILTIN_STUB(void, find_inv, char *a) { (void)a; builtin_called("find_inv"); }
BUILTIN_STUB(void, do_inv_delete, char *a) { (void)a; builtin_called("do_inv_delete"); }
BUILTIN_STUB(int, identify_inv, char *a) { (void)a; builtin_called("identify_inv"); return 0; }
BUILTIN_STUB(int, take_from_npc, char *a) { (void)a; builtin_called("take_from_npc"); return 0; }
BUILTIN_STUB(int, take_id_from_npc, char *a) { (void)a; builtin_called("take_id_from_npc"); return 0; }
BUILTIN_STUB(int, do_inv_create, char *a) { (void)a; builtin_called("do_inv_create"); return 0; }
BUILTIN_STUB(int, gronk_door, char *a) { (void)a; builtin_called("gronk_door"); return 0; }
BUILTIN_STUB(void, set_attitude, char *a) { (void)a; builtin_called("set_attitude"); }
BUILTIN_STUB(void, set_race_attitude, char *a) { (void)a; builtin_called("set_race_attitude"); }
BUILTIN_STUB(ushort, take_from_npc_inv, char *a) { (void)a; builtin_called("take_from_npc_inv"); return 0; }
BUILTIN_STUB(void, add_to_npc_inv, char *a) { (void)a; builtin_called("add_to_npc_inv"); }
BUILTIN_STUB(int, place_object, char *a) { (void)a; builtin_called("place_object"); return 0; }
BUILTIN_STUB(void, remove_talker, void) { builtin_called("remove_talker"); }
BUILTIN_STUB(byte, x_skills, char *a) { (void)a; builtin_called("x_skills"); return 0; }
BUILTIN_STUB(byte, x_traps, char *a) { (void)a; builtin_called("x_traps"); return 0; }
BUILTIN_STUB(void, x_obj_stuff, char *a) { (void)a; builtin_called("x_obj_stuff"); }
BUILTIN_STUB(void, x_obj_pos, char *a) { (void)a; builtin_called("x_obj_pos"); }

/* ---- suite setup ------------------------------------------------------- */
static void open_strings(void)
{
    DAT_0024bf98 = uw_file_open_read("\\DATA\\STRINGS.PAK");
    TEST_ASSERT_GREATER_THAN_INT(0, DAT_0024bf98);
    TEST_ASSERT_EQUAL_INT(2, uw_file_read(DAT_0024bf98, &strings_tree_count, 2));
    DAT_0024cfb8 = &strings_tree_count;
    DAT_0024cfa8 = malloc(strings_tree_count * 4);
    TEST_ASSERT_NOT_NULL(DAT_0024cfa8);
    TEST_ASSERT_EQUAL_INT(strings_tree_count * 4, uw_file_read(DAT_0024bf98, DAT_0024cfa8, strings_tree_count * 4));
    DAT_0024cfc0 = DAT_0024cfb4 = 0;
}

void conv_fixture_begin(void)
{
    snprintf(workspace, sizeof workspace, "/tmp/uw-conversation-XXXXXX");
    TEST_ASSERT_NOT_NULL(mkdtemp(workspace));
    char path[160];
    snprintf(path, sizeof path, "%s/DATA", workspace);
    TEST_ASSERT_EQUAL_INT(0, symlink(UW_TEST_DATA_DIR "/DATA", path));
    snprintf(path, sizeof path, "%s/SAVE0", workspace);
    TEST_ASSERT_EQUAL_INT(0, mkdir(path, 0755));
    options_set("data-dir", workspace);
    open_strings();
}

void conv_fixture_end(void)
{
    uw_file_close(DAT_0024bf98);
    free(DAT_0024cfa8);
    char command[200];
    snprintf(command, sizeof command, "rm -rf %s", workspace);
    TEST_ASSERT_EQUAL_INT(0, system(command));
}

void conv_reset(void)
{
    memset(conv_log, 0, sizeof conv_log);
    conv_log_count = conv_steps = conv_polls = 0;
    queue_head = queue_tail = scroll_line = builtin_calls_n = npc_count = 0;
    scroll_mode = 'n';
    memset(babl_items, 0, sizeof babl_items);
    babl_drop_count = 0;
    memset(g_object_type_props, 0, sizeof g_object_type_props);
    memset(g_monster_type_props, 0, sizeof g_monster_type_props);
    memset(character, 0, sizeof character);
    memset(player, 0, sizeof player);
    memset(DAT_000bbfd0_backing, 0, sizeof DAT_000bbfd0_backing);
    memset(DAT_000bbfe8_backing, 0, sizeof DAT_000bbfe8_backing);
    memset(DAT_000bbf98_backing, 0, sizeof DAT_000bbf98_backing);
    memset(DAT_000bbff0_backing, 0, sizeof DAT_000bbff0_backing);
    DAT_00086df8 = character;
    DAT_0023be74 = player_attributes;
    memset(player_attributes, 0, sizeof player_attributes);
    if (!DAT_00248410) DAT_00248410 = calloc(1, 0x1000);
    g_player_object = (uw_mobile_object_t *)player;
    DAT_0023cca8_backing[0] = 0;
    DAT_000bbf70 = DAT_000bbf00 = 0;
    DAT_000bbf24 = 0;
    DAT_0024cfc0 = 0;
    strcpy(character, "Avatar");
    character[0x30] = 12;
    character[0x33] = 12;
    DAT_00201b68 = 1;
    /* As game.c does at start-up: the player's name is interned on page 0x7d. */
    DAT_00201c74 = register_interned_string(DAT_00086df8, 0x7d);
    /* A fresh game: bglobals.dat is seeded from the shipped BABGLOBS.DAT. */
    char path[160];
    snprintf(path, sizeof path, "%s/SAVE0/BGLOBALS.DAT", workspace);
    FILE *file = fopen(path, "wb");
    TEST_ASSERT_NOT_NULL(file);
    fclose(file);
    TEST_ASSERT_EQUAL_INT(0, seed_conversation_globals_for_new_game());
}

/* NPC records persist between conversations (talked-to flag, attitude), as in a
   running game; conv_reset forgets them. */

ushort *conv_npc_record(unsigned slot)
{
    for (int i = 0; i < npc_count; i++)
        if (npcs[i].slot == slot) return npcs[i].record;
    TEST_ASSERT_LESS_THAN_INT(4, npc_count);
    static byte arena[UW_TEST_LEVEL_SIZE];
    uw_test_load_map(arena, sizeof arena, 1);
    npcs[npc_count].slot = slot;
    memcpy(npcs[npc_count].record, uw_test_level_object(arena, sizeof arena, slot), 27);
    npcs[npc_count].record[3] = 0; /* no inventory unless the test gives some */
    return npcs[npc_count++].record;
}

void conv_talk_as(unsigned slot, unsigned conversation)
{
    ((byte *)conv_npc_record(slot))[0x1a] = conversation;
    conv_talk(slot);
}

void conv_talk(unsigned slot)
{
    conv_npc = conv_npc_record(slot);
    DAT_00100674 = (uw_mobile_object_t *)conv_npc;
    DAT_001007c4 = ((byte *)conv_npc)[0x1a];
    DAT_00100784 = calloc(1, 0x10000);
    DAT_001007c0 = DAT_00100784;
    init_barter_ui();
    conv_steps = 0;
    start_npc_conversation(DAT_001007c4, conv_npc[0] & 0x3f);
    /* Leaving conversation mode, as the game-mode switch does. */
    DAT_00100784 = malloc(1); /* exit_talk_mode releases it with LocalFree */
    exit_talk_mode();
}

#include "game_fixture.h"
#include "src/headers/options.h"
#include "new_game_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
int character_generator_start(void);
int ensure_save_directory_exists(char *path);
bool write_player_save_record(char *path);
char *load_string_resource(char *path);
int seed_conversation_globals_for_new_game(void);
bool open_level_archive(void *handle, char *path);
int seek_file_handle(int handle, int offset, int method);
int read_file_handle(int handle, void *destination, uint size);
int scheduler_load(void *handle, int level);
int load_player_save_record(char *path);
bool load_level_texture_ids(byte *handle, int level);
void clear_automap_reveal_buffer(void);
void reset_npc_path_cache(void);
void clear_last_attacker_record(void);
int load_automap_reveal_from_archive(byte *handle, int level);
byte close_level_archive(void *handle);
void set_player_tile_position(uint tile_x, uint tile_y, int flag);
void debug_print_player_position(const char *label);
void save_or_restore_level_special_state(short restore, short slot);
void pop_cursor_icon(ushort state);
int cursor_show_idle_tick(void);
void set_pending_update_flags(ushort sound);
void reset_cursor_confine_rect(void);
void report_fatal_error_and_exit(ushort error_code);
void uw_debug_dump_tmap(int level, const unsigned char *data);
void *tilemap_lookup(short tile_x, short tile_y);
uw_object_hdr_t *resolve_object_link(ushort *link_field);

unsigned char arena[0x7c08], pristine_level[0x7c08];

char character[256], saved_character[256];

short mode_state[16];

char *DAT_002029cc = (char *)arena;

char *DAT_002046a4, *DAT_002046a8, *DAT_002046bc, *DAT_0020469c;

char *DAT_002046c4;

byte *DAT_002046c0, *DAT_002046c8;

undefined4 DAT_002029d0;

short DAT_00202080;

short *DAT_00085a6c = mode_state;

undefined2 DAT_00201b60, DAT_000868d8;

short DAT_00201b64;

char DAT_0023cca8_backing[1024];

char DAT_000857a0_backing[16];

char s__DATA_lev_ark_00085734[] = "\\DATA\\lev.ark";

char s__SAVE0_lev_ark_000842fc[] = "\\SAVE0\\lev.ark";

bool accept_character, archive_ok;

char workspace[] = "/tmp/uw-new-game-XXXXXX";

char data_link[512], save_path[512], archive_path[1024];

undefined DAT_000b78b8_backing[8192];

int scheduler_result;

int character_calls, saves, seeds, opens, closes;

int restores, textures, automaps, cache_resets, attacker_resets;

int spawn_calls, special_state_calls, cursor_resets;

bool archive_open;

bool g_new_game_entry_pause_pending;

int character_generator_start(void)
{
    character_calls++;
    if (!accept_character) return 0;
    memset(character, 0, sizeof(character));
    strcpy(character, "Test Avatar");
    character[0x21] = 12; /* starting skill */
    character[100] = 2 << 5; /* class */
    return 1;
}

int ensure_save_directory_exists(char *path)
{
    TEST_ASSERT_EQUAL_STRING("\\SAVE0", path);
    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    return 1;
}

bool write_player_save_record(char *path)
{
    if (saves == 0) TEST_ASSERT_EQUAL_STRING("\\SAVE0", path);
    else TEST_ASSERT_NULL(path); /* load_level's snapshot */
    memcpy(saved_character, character, sizeof(character));
    saves++;
    return true;
}

char *load_string_resource(char *path)
{
    static char converted[520];
    MultiByteToWideChar(0, 2, path, -1, converted, 255);
    return converted;
}

int seed_conversation_globals_for_new_game(void)
{
    seeds++;
    return 0;
}

bool open_level_archive(void *handle, char *path)
{
    opens++;
    if (!archive_ok) TEST_ASSERT_EQUAL_INT(0, unlink(archive_path));
    int file = uw_file_open_read(path);
    if (file < 0) return false;
    ushort entries;
    TEST_ASSERT_EQUAL_INT(2, uw_file_read(file, &entries, 2));
    TEST_ASSERT_LESS_OR_EQUAL_UINT(sizeof(DAT_000b78b8_backing), entries * 4);
    TEST_ASSERT_EQUAL_INT(entries * 4,
                         uw_file_read(file, DAT_000b78b8_backing, entries * 4));
    memset(handle, 0, 16);
    memcpy(handle, &file, 4);
    memcpy(handle + 8, &entries, 2);
    archive_open = true;
    return true;
}

int seek_file_handle(int handle, int offset, int method)
{ return uw_file_seek(handle, offset, method); }

int read_file_handle(int handle, void *destination, uint size)
{ return uw_file_read(handle, destination, size); }

int scheduler_load(void *handle, int level)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    return scheduler_result;
}

int load_player_save_record(char *path)
{
    TEST_ASSERT_NULL(path);
    TEST_ASSERT_TRUE(archive_open);
    memcpy(character, saved_character, sizeof(character));
    restores++;
    return 1;
}

bool load_level_texture_ids(byte *handle, int level)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_INT(1, level);
    textures++;
    return true;
}

void clear_automap_reveal_buffer(void) { automaps++; }

void reset_npc_path_cache(void) { cache_resets++; }

void clear_last_attacker_record(void) { attacker_resets++; }

int load_automap_reveal_from_archive(byte *handle, int level)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_INT(1, automaps);
    automaps++;
    return 1;
}

byte close_level_archive(void *handle)
{
    TEST_ASSERT_TRUE(archive_open);
    int file;
    memcpy(&file, handle, 4);
    TEST_ASSERT_EQUAL_INT(1, uw_file_close(file));
    archive_open = false;
    closes++;
    return 1;
}

void set_player_tile_position(uint x, uint y, int flag)
{
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(1, textures);
    TEST_ASSERT_EQUAL_UINT32(32, x);
    TEST_ASSERT_EQUAL_UINT32(2, y);
    DAT_00202080 = y * 64 + x;
    spawn_calls++;
}

void debug_print_player_position(const char *label)
{
    TEST_ASSERT_EQUAL_STRING("chargen-spawn", label);
}


void save_or_restore_level_special_state(short restore, short slot)
{
    TEST_ASSERT_EQUAL_INT(1, spawn_calls);
    TEST_ASSERT_EQUAL_INT(1, restore);
    TEST_ASSERT_EQUAL_INT(0, slot);
    special_state_calls++;
}

void pop_cursor_icon(ushort state) { TEST_ASSERT_EQUAL_INT(3, state); }

int cursor_show_idle_tick(void) { return 0; }

void set_pending_update_flags(ushort sound) { TEST_ASSERT_EQUAL_INT(0x7ffe, sound); }

void reset_cursor_confine_rect(void)
{
    TEST_ASSERT_EQUAL_INT(1, special_state_calls);
    cursor_resets++;
}

void report_fatal_error_and_exit(ushort error_code)
{
    TEST_FAIL_MESSAGE("New game unexpectedly reached a fatal-error path");
}

void uw_debug_dump_tmap(int level, const unsigned char *data)
{
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_PTR(arena, data);
}

void *tilemap_lookup(short tile_x, short tile_y) { (void)tile_x; (void)tile_y; return NULL; }

uw_object_hdr_t *resolve_object_link(ushort *link_field) { (void)link_field; return NULL; }

void new_game_fixture_reset(void)
{
    memset(arena, 0xa5, sizeof(arena));
    memset(character, 0, sizeof(character));
    memset(saved_character, 0, sizeof(saved_character));
    memset(mode_state, 0, sizeof(mode_state));
    DAT_0023cca8_backing[0] = 0;
    strcpy((char *)DAT_000857a0_backing, "\\SAVE0");
    uw_test_load_map(pristine_level, sizeof pristine_level, 1);
    DAT_002046a4 = (char *)arena + 0x7300;
    DAT_002046bc = (char *)arena + 0x74fc;
    DAT_002046c0 = arena + 0x7afa;
    DAT_002046c4 = (char *)arena + 0x5b00;
    DAT_002046a8 = DAT_0020469c = NULL;
    DAT_002046c8 = NULL;
    DAT_002029d0 = 99;
    DAT_00202080 = 42;
    DAT_00201b60 = 0;
    DAT_00201b64 = -1;
    DAT_000868d8 = 99;
    accept_character = archive_ok = true;
    scheduler_result = 1;
    character_calls = saves = seeds = opens = closes = 0;
    restores = textures = automaps = cache_resets = attacker_resets = 0;
    spawn_calls = special_state_calls = cursor_resets = 0;
    archive_open = false;
}

void new_game_fixture_dispose(void)
{
    TEST_ASSERT_FALSE(archive_open);
    if (access(data_link, F_OK) != 0)
        TEST_ASSERT_EQUAL_INT(0, symlink(UW_TEST_DATA_DIR "/DATA", data_link));
    unlink(archive_path);
}

void new_game_fixture_begin(void)
{
    TEST_ASSERT_NOT_NULL(mkdtemp(workspace));
    snprintf(data_link, sizeof(data_link), "%s/DATA", workspace);
    snprintf(save_path, sizeof(save_path), "%s/SAVE0", workspace);
    snprintf(archive_path, sizeof(archive_path), "%s/lev.ark", save_path);
    TEST_ASSERT_EQUAL_INT(0, symlink(UW_TEST_DATA_DIR "/DATA", data_link));
    TEST_ASSERT_EQUAL_INT(0, mkdir(save_path, 0700));
    TEST_ASSERT_EQUAL_INT(0, options_set("data-dir", workspace));
}

void new_game_fixture_end(void)
{
    unlink(data_link);
    rmdir(save_path);
    rmdir(workspace);
}

/* The real game runs unit-test lifecycle hooks from load_level; this fixture has none. */
void uw_test_hook_pre_level_load(int level_number) { (void)level_number; }

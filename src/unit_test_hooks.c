/* Unit-test game harness: see headers/unit_test_hooks.h. */
#include "headers/unit_test_hooks.h"
#include "headers/options.h"
#include "headers/game.h"
#include "headers/file_io.h"
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#ifndef UW_TEST_DATA_DIR
#define UW_TEST_DATA_DIR NULL
#endif

static uw_test_hooks g_hooks;
static int g_active;
static unsigned g_ticks, g_max_ticks;

int uw_test_game_active(void) { return g_active; }

#define CALL_HOOK(name) do { if (g_active && g_hooks.name) g_hooks.name(); } while (0)
void uw_test_hook_pre_game_start(void) { CALL_HOOK(pre_game_start); }
void uw_test_hook_pre_level_load(int level_number)
{
    if (g_active && g_hooks.pre_level_load) g_hooks.pre_level_load(level_number);
}
void uw_test_hook_on_game_start(void)  { CALL_HOOK(on_game_start); }
void uw_test_hook_pre_game_tick(void)  { CALL_HOOK(pre_game_tick); }
void uw_test_hook_post_game_tick(void)
{
    if (!g_active) return;
    CALL_HOOK(post_game_tick);
    if (++g_ticks >= g_max_ticks) test_game_request_exit();
}
void uw_test_hook_on_game_exit(void)   { CALL_HOOK(on_game_exit); }

void test_game_request_exit(void) { request_game_exit(0); }

int start_test_game(const uw_test_hooks *hooks)
{
    g_hooks = hooks ? *hooks : (uw_test_hooks){0};
    g_ticks = 0;
    g_max_ticks = !hooks ? 1 : hooks->max_ticks ? hooks->max_ticks : 100000;
    options_set("headless", NULL);
    options_set("fast-sleep", NULL);
    if (!g_opts.data_dir) {
        if (!UW_TEST_DATA_DIR) return -1;
        options_set("data-dir", UW_TEST_DATA_DIR);
    }
    g_active = 1;
    app_main_loop(0, 0, 0, 0);
    g_active = 0;
    return 0;
}

/* Offset of a level block inside \\SAVE0\\lev.ark: u16 block count, then a u32 offset per block. */
static long level_block_offset(FILE *f, int level_number)
{
    unsigned short count;
    unsigned int offset;
    if (level_number < 1 || fseek(f, 0, SEEK_SET) || fread(&count, 2, 1, f) != 1 || level_number > count)
        return -1;
    if (fseek(f, 2 + 4L * (level_number - 1), SEEK_SET) || fread(&offset, 4, 1, f) != 1 || !offset)
        return -1;
    return (long)offset;
}

static int access_level_block(int level_number, unsigned offset, void *data, unsigned size, int write)
{
    char path[4096];
    if (offset + size > UW_TEST_LEVEL_BLOCK_SIZE || !uw_resolve_win_path("\\SAVE0\\lev.ark", path, sizeof path))
        return -1;
    FILE *f = fopen(path, write ? "r+b" : "rb");
    if (!f) return -1;
    long base = level_block_offset(f, level_number);
    int ok = base >= 0 && !fseek(f, base + offset, SEEK_SET) &&
             (write ? fwrite(data, 1, size, f) : fread(data, 1, size, f)) == size;
    return (fclose(f) == 0 && ok) ? 0 : -1;
}

int uw_test_read_level_block(int level_number, void *block)
{
    return access_level_block(level_number, 0, block, UW_TEST_LEVEL_BLOCK_SIZE, 0);
}

int uw_test_write_level_block(int level_number, const void *block)
{
    return access_level_block(level_number, 0, (void *)block, UW_TEST_LEVEL_BLOCK_SIZE, 1);
}

int uw_test_patch_level_block(int level_number, unsigned offset, const void *data, unsigned size)
{
    return access_level_block(level_number, offset, (void *)data, size, 1);
}

int uw_test_patch_level_tile(int level_number, int x, int y, const unsigned char tile[4])
{
    if (x < 0 || x > 63 || y < 0 || y > 63) return -1;
    return uw_test_patch_level_block(level_number, UW_TEST_LEVEL_TILE_OFFSET(x, y), tile, 4);
}

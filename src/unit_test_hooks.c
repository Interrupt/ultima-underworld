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

/* Virtual game clock. Starts well above zero so "time since 0" never looks like "never". */
#define CLOCK_START_US 1000000ULL
#define DEFAULT_TICK_US 16667 /* 60 Hz: the game clock's frame rate */
#define SPIN_READS_BEFORE_NUDGE 1000
static uint64_t g_clock_us;
static unsigned g_tick_us, g_reads_since_advance;

int uw_test_clock_active(void) { return g_active; }

void uw_test_clock_advance_us(uint64_t microseconds)
{
    g_clock_us += microseconds;
    g_reads_since_advance = 0;
}

/* A loop that polls the clock waiting for time to pass (e.g. busy_wait_ms) would otherwise hang on a
   clock that only moves between passes, so a long run of reads with no advance nudges it by 1 ms. */
uint64_t uw_test_clock_us(void)
{
    if (++g_reads_since_advance > SPIN_READS_BEFORE_NUDGE) uw_test_clock_advance_us(1000);
    return g_clock_us;
}

int uw_test_game_active(void) { return g_active; }

#define CALL_HOOK(name) do { if (g_active && g_hooks.name) g_hooks.name(); } while (0)
void uw_test_hook_pre_game_start(void) { CALL_HOOK(pre_game_start); }
void uw_test_hook_pre_level_load(int level_number)
{
    if (g_active && g_hooks.pre_level_load) g_hooks.pre_level_load(level_number);
}
void uw_test_hook_on_game_start(void)  { CALL_HOOK(on_game_start); }
void uw_test_hook_pre_game_tick(void)
{
    if (!g_active) return;
    uw_test_clock_advance_us(g_tick_us);
    CALL_HOOK(pre_game_tick);
}
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
    g_tick_us = hooks && hooks->tick_us ? hooks->tick_us : DEFAULT_TICK_US;
    g_clock_us = CLOCK_START_US;
    g_reads_since_advance = 0;
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

/* Live level arena (see load_level_object_table): tiles at 0, mobile objects 0x4000 (27 bytes each,
   slots 0-255), static objects 0x5b00 (8 bytes each, slots 256-1023). */
extern char *DAT_002029cc;

unsigned char *uw_test_live_tile(int x, int y)
{
    if (x < 0 || x > 63 || y < 0 || y > 63 || !DAT_002029cc) return NULL;
    return (unsigned char *)DAT_002029cc + UW_TEST_LEVEL_TILE_OFFSET(x, y);
}

unsigned short *uw_test_live_object(unsigned slot)
{
    if (slot == 0 || slot >= 1024 || !DAT_002029cc) return NULL;
    return (unsigned short *)(DAT_002029cc + (slot < 256 ? 0x4000 + slot * 27 : 0x5b00 + (slot - 256) * 8));
}

unsigned short *uw_test_find_object_on_tile(int x, int y, unsigned object_id)
{
    unsigned char *tile = uw_test_live_tile(x, y);
    if (!tile) return NULL;
    unsigned slot = ((unsigned short *)tile)[1] >> 6;
    for (int guard = 0; slot && guard < 1024; guard++) {
        unsigned short *object = uw_test_live_object(slot);
        if (!object) return NULL;
        if ((object[0] & 0x1ff) == object_id) return object;
        slot = object[2] >> 6;
    }
    return NULL;
}

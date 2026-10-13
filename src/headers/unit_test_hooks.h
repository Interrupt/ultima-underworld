/* Unit-test game harness: start the real game headless, straight into a new character on level 1
   (no intro, no title screen, no character-generator UI), with callbacks into the game lifecycle.

       static void on_start(void) { ... inspect/poke the live game ... }
       static void each_tick(void) { if (++ticks == 100) test_game_request_exit(); }

       uw_test_hooks hooks = { .on_game_start = on_start, .post_game_tick = each_tick };
       start_test_game(&hooks);        // returns when the game exits; hooks may be NULL

   Hooks (any may be NULL), in the order they fire:
     pre_game_start   the new character exists with default stats but the level is not loaded yet;
                      set up the player (g_player_object, the DAT_00086df8 player record) here
     on_game_start    level 1 is loaded and gameplay mode is on; the main loop is about to run
     pre_level_load   a level is about to be loaded from \SAVE0\lev.ark: at game start (level 1) and on
                      every later level change or save load. The archive is complete and not yet
                      read, so patch the level here with the uw_test_*_level_* helpers below
     pre_game_tick    top of every main-loop pass
     post_game_tick   end of every main-loop pass (after the world update and redraw)
     on_game_exit     the main loop has ended (after test_game_request_exit or a quit)

   The game keeps its state in process-wide globals, so call start_test_game once per process. To
   run several cases in one executable, use RUN_GAME_TEST (tests/support/game_test_runner.h), which
   forks a fresh process per case. Set options first with options_set(); start_test_game forces
   headless and fast-sleep on, and points data_dir at the repo's data/ folder unless one was set. */
#ifndef UW_UNIT_TEST_HOOKS_H
#define UW_UNIT_TEST_HOOKS_H

typedef struct uw_test_hooks {
    void (*pre_game_start)(void);
    void (*pre_level_load)(int level_number);
    void (*on_game_start)(void);
    void (*pre_game_tick)(void);
    void (*post_game_tick)(void);
    void (*on_game_exit)(void);
    /* Safety stop: leave the main loop after this many passes (0 = 100000), so a test that forgets
       test_game_request_exit fails instead of hanging. With NULL hooks the game runs one pass. */
    unsigned max_ticks;
} uw_test_hooks;

/* Run a complete headless game with the given hooks (NULL = boot, run one pass, exit). Returns 0 on a clean exit, -1 if
   the game could not start (e.g. the data folder is missing). */
int start_test_game(const uw_test_hooks *hooks);

/* Ask the running test game to leave its main loop after the current pass. */
void test_game_request_exit(void);

/* Level-block helpers, for use from pre_level_load. They edit the live \SAVE0\lev.ark (the game's
   working copy, re-seeded from DATA\lev.ark at every new game; the real data file is never touched).
   A level block is UW_TEST_LEVEL_BLOCK_SIZE bytes: 64x64 tiles of 4 bytes at offset 0 (index
   y*64+x), then the mobile object table at 0x4000 (256 x 27 bytes), the static object table at
   0x5b00, the free lists and the 0x7577 marker at 0x7c06. Levels are numbered from 1. All return 0
   on success, -1 on a bad argument or file error. */
#define UW_TEST_LEVEL_BLOCK_SIZE 0x7c08
#define UW_TEST_LEVEL_TILE_OFFSET(x, y) (((y) * 64 + (x)) * 4)
int uw_test_read_level_block(int level_number, void *block /* UW_TEST_LEVEL_BLOCK_SIZE bytes */);
int uw_test_write_level_block(int level_number, const void *block);
/* Overwrite `size` bytes at `offset` inside the level block. */
int uw_test_patch_level_block(int level_number, unsigned offset, const void *data, unsigned size);
/* Overwrite one tile's 4 raw bytes. */
int uw_test_patch_level_tile(int level_number, int x, int y, const unsigned char tile[4]);

/* Used by the game itself (game.c). */
int uw_test_game_active(void);
void uw_test_hook_pre_game_start(void);
void uw_test_hook_pre_level_load(int level_number);
void uw_test_hook_on_game_start(void);
void uw_test_hook_pre_game_tick(void);
void uw_test_hook_post_game_tick(void);
void uw_test_hook_on_game_exit(void);

#endif

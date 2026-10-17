#ifndef UW_TEST_NEW_GAME_FIXTURE_H
#define UW_TEST_NEW_GAME_FIXTURE_H
/* Fixture state and controlled services for reusable new_game tests. */
#include "unity.h"
#include "src/headers/game.h"
#include "src/headers/level.h"
#include <unistd.h>
#include <sys/stat.h>
extern unsigned char arena[0x7c08], pristine_level[0x7c08];
extern char character[256], saved_character[256];
extern short mode_state[16];
extern char *DAT_002029cc;
extern char *DAT_002046a4, *DAT_002046a8, *DAT_002046bc, *DAT_0020469c;
extern char *DAT_002046c4;
extern byte *DAT_002046c0, *DAT_002046c8;
extern undefined4 DAT_002029d0;
extern short DAT_00202080;
extern short *DAT_00085a6c;
extern undefined2 g_game_mode, DAT_000868d8;
extern short g_mode_handler_row;
extern undefined1 DAT_0023cca8_backing[1024];
extern undefined1 DAT_000857a0_backing[16];
extern char s__DATA_lev_ark_00085734[];
extern char s__SAVE0_lev_ark_000842fc[];
extern bool accept_character, archive_ok;
extern char workspace[];
extern char data_link[512], save_path[512], archive_path[512];
extern undefined DAT_000b78b8_backing[8192];
extern int scheduler_result;
extern int character_calls, saves, seeds, opens, closes;
extern int restores, textures, automaps, cache_resets, attacker_resets;
extern int spawn_calls, special_state_calls, cursor_resets;
extern bool archive_open;
extern bool g_new_game_entry_pause_pending;
void new_game_fixture_reset(void);
void new_game_fixture_dispose(void);
void new_game_fixture_begin(void);
void new_game_fixture_end(void);
#endif

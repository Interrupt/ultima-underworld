#ifndef HEADERS_LEVEL_H
#define HEADERS_LEVEL_H

/* Declarations for level.c: level loading (object-table arena, per-
 * level object load, dungeon-view/level entry points). Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

extern short DAT_00201b68;
extern char *DAT_0024cff4;
extern char * g_selected_object;
/* Globals defined in uw.c but also used by functions that now live in
   level.c (level loading) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00088d98_backing[768];
#define DAT_00088d98 DAT_00088d98_backing[0]
extern undefined4 DAT_002029d0;
extern undefined2 DAT_00201c90;
extern undefined2 DAT_00201c8c;
extern short DAT_00201c7c;


/* Port-only timing flag consumed by the first entry after character creation. */
extern bool g_new_game_entry_pause_pending;

int teleport_object_to_level_tile(void *object, int tile_x, int tile_y, short level_number);
void reset_level_arena_and_invalidate(int reserved);
void enter_dungeon_view();
void draw_dungeon_hud_backdrop();
int init_level_object_arena();
void free_level_tile_arena();
int load_level_object_table(byte *archive_handle, int level_number);
void reset_level_object_arena();
int load_level(int level_number);
int transition_to_level(int from_level, int to_level);
void save_or_restore_level_special_state(short level_number, short mode);
int trigger_random_level_special_event(short chance_scale);

#endif

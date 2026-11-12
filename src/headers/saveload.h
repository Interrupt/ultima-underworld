#ifndef HEADERS_SAVELOAD_H
#define HEADERS_SAVELOAD_H

/* Declarations for saveload.c: the save/load slot menu and the actual
 * game save/load. Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

extern char s__SAVE0_lev_ark_000842fc[];
extern char * g_save_record_buffer;
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (save/load) -- extern'd here so both translation units
   see the same storage. */
extern undefined2 DAT_000868dc;
extern short DAT_002046f0;


bool open_level_archive(void *archive_handle, char *path);
byte close_level_archive(void *archive_handle);
bool write_archive_entry(void *archive_handle, uint entry_index, void *data, uint byte_count);
short read_archive_entry(void *archive_handle, uint entry_index, void *buffer);
int probe_archive_entry_exists(char *path, uint entry_index);
bool check_can_save_game();
int check_can_load_game();
int load_player_save_record(char *slot_dir);
int write_level_tilemap_to_archive(byte *archive, int level_number);
void draw_save_load_slot_list();
int write_level_quest_flags_to_archive(byte *archive, int level_number);
int journey_onward_load_slot_menu();
int commit_level_to_save_slot(int level_number);
int commit_level_to_archive(int level_number, char *archive_path, int with_automap);
void probe_save_slots(char *slot_descriptions, ushort *used_mask);
void handle_save_load_menu_action(short action, int slot);
int load_game_from_slot(char slot_digit);
int save_game_to_slot(char slot_digit, char *description);
int ensure_save_directory_exists(char *path);
int copy_save_slot_files(char *dest_dir, char *source_dir);
bool write_buffer_to_file(void *buffer, char *filename, ushort byte_count);

#endif

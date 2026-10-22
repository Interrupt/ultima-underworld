#ifndef HEADERS_TRAPS_H
#define HEADERS_TRAPS_H

/* Declarations for traps.c: tile trap/link "type" effect dispatch.
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

int apply_area_terrain_effect(short tile_x, int tile_y, short wall_texture, short height_value, short height_adjust, short floor_texture, short width, short height_extent, short mode);
int apply_poison_or_damage_trap_effect(int object_slot, uint damage_delta, int unused_a, int unused_b);
int dispatch_trap_special_or_tile_action(byte context_x, byte context_y, void *actor, void *target, ushort action_id, byte argument);
void handle_level4_maze_puzzle_button(short button, int tile_x, int tile_y);
void try_combine_shrine_markers(int unused, int tile_x, int tile_y);
void emit_player_noise_alert(byte noise_type);
void apply_quest_event_numeric_effect(int context_type, char *record, int tile_x, int tile_y);
void trigger_exploding_book_trap();
void trigger_exploding_book_trap_at_tile(int unused, int tile_x, int tile_y);
void trigger_scripted_npc_conversation();
void advance_scheduler_and_show_page3();
int unlink_object_from_tile_callback(char *object);
void trigger_quest_milestone_cleanup_event();
int resolve_lock_difficulty_rating(ushort *lock);
uint attempt_pick_lock(ushort *lock, int skill, ushort *out_difficulty);
void spawn_trap_hazard_object(uw_unaligned_word_t *trap_record, short tile_x, short tile_y);
int dispatch_trap_type_effect(uw_unaligned_word_t *trap_record, int tile_x, int tile_y);
int reset_object_ui_state_callback(char *object);
int dispatch_quest_event_code(void *trap_record, int tile_x, int tile_y);
int create_scripted_trap_pair_at_tile(int tile_x, int tile_y, uint code);
void remove_trap_chain_marker(char *link_field, char *trap_object);
void free_trap_class_object(void *link_field, void *trap_object);
int check_object_area_for_spawn_block(uw_unaligned_word_t *object);
int is_out_of_player_range(int target_present, short tile_x, short tile_y);
void process_nearby_background_traps(int target_present);
void tick_ambient_doors_and_scheduler(int target_present);
int detect_spawn_blocking_object_callback(int scan_x, int scan_y, char *object);

#endif

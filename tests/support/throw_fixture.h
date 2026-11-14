#ifndef UW_TEST_THROW_FIXTURE_H
#define UW_TEST_THROW_FIXTURE_H
#include "unity.h"
#include "../throw_test_globals.h"
short fine(ushort *object, int offset);
int uw_service_game_clock(uint64_t now_us);
void uw_reset_frame_pacing(void);
void movement_pacing_handler(void);
uw_object_hdr_t *alloc_object_slot(int mobile);
void free_object_slot(uw_object_hdr_t *object);
int encode_object_slot_index(const uw_object_hdr_t *object);
void *tilemap_lookup(short x, short y);
uw_object_hdr_t *resolve_object_link(uw_link_word_t *head);
uw_object_hdr_t *get_object_record_by_slot_index(short slot);
void get_mouse_position(short *x, short *y);
long ce_rand(void);
void angle_to_screen_delta(uint heading, void *x, void *y);
void collision_build_height_field(uint step_limit);
void collision_height_envelope(int mode, int collision);
void resolve_wall_slide_corner(void);
int check_object_drop_height(uw_unaligned_word_t *object, uw_unaligned_word_t *reference);
int object_ptr_in_arena(const uw_object_hdr_t *object);
int play_sound_effect_at_object(int sound_id, uw_unaligned_word_t *object, int volume_bias);
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias);
int apply_typed_damage_to_object(uw_unaligned_word_t *target, uw_unaligned_word_t *attacker, int tile_x, short tile_y, byte damage, byte damage_type);
int roll_object_destroy_chance(short base_chance, void *object);
int spawn_scheduled_effect_object(uw_unaligned_word_t *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y);
void print_scroll_message_by_id(uint message_id);
void set_pending_update_flags(ushort flags);
void spawn_effect_debris_burst(void *template, uint tile_x, int tile_y);
void scheduler_relink_entry(void *new_object, void *old_object);
void set_ambient_bias_without_light(char light_level);
int activate_area_hazard_object(uw_unaligned_word_t *hazard, uint tile_x, int tile_y, int damage);
ushort *discard_misplaced_object(void *list, uw_unaligned_word_t *object, int destroy);
uw_object_hdr_t *settle_dropped_object(void *object, short x, short y,
				       int mode);
uw_object_hdr_t *reallocate_object_to_arena(uw_unaligned_word_t *object);
void project_position_by_heading(int heading, short distance, void *x, void *y);
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit);
int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile);
int resolve_collision_candidate_interaction(short contact, int slot);
void randomize_settled_snapshot_position(void *snapshot);
void object_list_append_tail(uw_link_word_t *link_field, uw_object_hdr_t *object);
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias);
bool apply_swim_wade_pose(ushort collision_mask);
void throw_fixture_reset(void);
void throw_fixture_dispose(void);
void launch(void);
void tick(void);
void run_game_frame(void);
void thrown_set_phase(int phase);
void thrown_count_steps(void);
#endif

#ifndef UW_TEST_STAIR_TRANSITION_FIXTURE_H
#define UW_TEST_STAIR_TRANSITION_FIXTURE_H
#include "unity.h"
#include "../stair_transition_test_globals.h"
void cancel_weapon_swing(void);
void pop_cursor_icon(ushort state);
void save_or_restore_level_special_state(short level, short save);
int commit_level_to_save_slot(int level);
int load_level(int level);
void set_player_tile_position(uint x, uint y, int flag);
void set_pending_update_flags(ushort flags);
void report_fatal_error_and_exit(ushort error_code);
void full_dungeon_redraw(void);
void weapon_overlay_flash_hold(int passes);
void weapon_overlay_flash_restore(int passes);
void *ce_memset(void *buffer, int value, unsigned size);
void *tilemap_lookup(short x, short y);
int encode_object_slot_index(const uw_object_hdr_t *object);
int check_object_placement_clearance(short type, short slot, short x, short y, short z, int flag, byte radius);
uw_object_hdr_t *resolve_object_link(ushort *link);
int object_ptr_in_arena(const uw_object_hdr_t *object);
ushort *discard_misplaced_object(void *head, uw_unaligned_word_t *object, int flag);
void tick_weapon_swing_state(short flag);
void set_hud_status_value(byte slot, ushort value);
void handle_starvation_penalty(void);
uint read_realtime_clock_units(void);
void update_ingame_music_track(void);
void update_player_tick_effects(void);
long ce_rand(void);
void apply_level9_random_hazard_tick(void);
void debug_print(char *format, ...);
uw_object_hdr_t *find_object_in_chain(ushort **link, int recursive, int group,
				      int subclass, short type);
void stair_transition_fixture_reset(void);
void stair_transition_fixture_dispose(void);
#endif

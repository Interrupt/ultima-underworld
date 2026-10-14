#ifndef HEADERS_AI_H
#define HEADERS_AI_H

/* Declarations for ai.c: NPC AI (per-tick dispatch, pathfinding,
 * movement, tile-position sync, mobile<->immobile settle). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern ushort DAT_0024fa18;
extern short DAT_0010061c;
extern short DAT_00100608;
/* Globals defined in uw.c but also used by functions that now live in
   ai.c (NPC AI) -- extern'd here so both translation units see the
   same storage. */
extern undefined DAT_00084f20_backing[128];

#define DAT_00084f20 DAT_00084f20_backing[0]
/* UW1 OBJECTS.DAT critter rows, loaded without native expansion. */
extern uw_monster_type_props_t g_monster_type_props[64];
/* Temporary byte-address boundary for the remaining raw row-pointer users. */
#define DAT_001007d0 g_monster_type_props[0].armor[0]
extern undefined4 DAT_001013fc;
extern ushort DAT_00101414;
extern ushort DAT_0010141c;
extern char * DAT_00101438;
extern undefined4 DAT_00101560;
extern void * DAT_0010172c;
extern char * DAT_00101904;
extern ushort DAT_00101910;
extern undefined4 DAT_0010191c;
extern char DAT_00101928;
extern char DAT_00101948;
int physics_subtick_units(void);
extern unsigned g_stat_physics_ticks;
void tick_physics_objects(int elapsed_units);
extern short DAT_00101938;
extern short DAT_0010193c;
extern undefined4 DAT_00101944;
extern undefined2 DAT_00101418;
extern undefined2 DAT_00101908;
/* "Last attacker" record, confirmed via check_npc_morale_flee's own use (src/ai.c ~3230): a saved
   snapshot of who last attacked the current NPC (tile x/y/heading + slot index + class id), with an
   expiry timestamp so the alert reaction only fires while it's still recent. */
extern byte DAT_0010192c; // last attacker's tile x
extern byte DAT_00101930; // last attacker's tile y
extern undefined1 DAT_00101934; // last attacker's heading
extern char DAT_0010194c; // last attacker's object slot index
extern char DAT_000853d0; // last attacker's class id
extern int DAT_00101940; // game-clock timestamp the attack was recorded at
extern undefined1 DAT_0023c460_backing[128];
#define DAT_0023c460 DAT_0023c460_backing[0]


void drop_monster_loot(void *monster, ushort gold_nibble, ushort item_nibble);
int tile_pair_los_blocked(byte tile_a_x, byte tile_a_y, byte tile_b_x, byte tile_b_y, byte tile_c_x, byte tile_c_y, ushort block_mask, ushort wall_mask, byte span, byte *out_a, byte *out_b);
int creature_find_path_to_tile(int start_x, char start_y, byte size_class, char goal_x, char goal_y, char goal_sub_x, byte goal_sub_y);
void reconstruct_path_from_bfs(byte step_count, byte goal_x, byte goal_y);
int try_direct_line_walk(byte start_x, byte start_y, short goal_x, short goal_y);
int check_fine_line_of_sight(uint from_x, uint from_y, uint from_z, short to_x, short to_y, short to_z);
int record_line_walk_step(byte x, byte y);
int pop_pending_path_cache_slot(byte *out_slot);
void reset_npc_path_cache();
void save_walk_path_to_cache_slot(byte *record);
int advance_cached_path_step(char *record);
int check_path_cache_position_match(int cache_flag, short tile_x, short tile_y, short sub_x, short sub_y, short expected_sub_x, short expected_sub_y);
int walk_using_cached_path(byte *cache_record);
void handle_blocked_cached_path(byte *cache_record);
int compute_movement_heading(int dx, int dy);
void npc_set_walk_target(byte goal, uint goal_target, byte attitude);
void npc_walk_toward_tile(uint goal, char goal_target, byte attitude);
void set_npc_altitude_state(byte tile_x, byte tile_y);
void npc_arrival_interaction(void *npc);
void npc_idle_behavior_tick();
void npc_wander_return_home_tick();
void npc_notice_and_idle_tick();
void npc_wander_reposition(uint saved_a, uint saved_b, uint saved_c);
void npc_react_to_nearby_player();
void npc_wander_return_home_exact_tick();
int detect_npc_wander_proximity(void *out_near, void *out_far);
int compute_vertical_aim_offset(short has_target, int target);
void setup_npc_ai_tick_state(uw_mobile_object_t *npc);
void npc_ai_default_tick();
int refresh_npc_target_delta();
int check_npc_morale_flee(uint morale_stat, uint current_hp, uint hp_margin, uint flee_threshold);
int compute_pathfind_search_radius();
void npc_set_goal(byte goal, uint goal_target);
void npc_clear_special_goal();
int initiate_npc_death(char *npc);
int handle_monster_death(void *npc);
void npc_set_goal_for_object(uw_mobile_object_t *npc, int goal,
			     int goal_target);
void randomize_active_npc_flags();
int resolve_tile_entry_offset(char tile_type, byte *out_x, byte *out_y);
void npc_movement_tick(ushort *npc_object, char *scratch);
int settle_misplaced_mobile_object(char *object);
void advance_mobile_objects();
int spawn_rest_interrupt_monster_callback(int scan_x, int scan_y, ushort *object);
int check_rest_interrupted_by_monster();
void load_last_attacker_record();
void save_last_attacker_record();
void clear_last_attacker_record();
int alert_npc_to_noise_callback(int scan_x, int scan_y, ushort *npc);
void emit_noise_alert(ushort *source, byte noise_type);
int resolve_unique_npc_special_behavior(void *npc, int event_mode);
int load_critter_association_tables(int file_handle);
void flush_pending_critter_resource_slots();
void build_creature_look_text(ushort *creature, char *out_text);
void spawn_npc_thrown_weapon(void *attacker, short launch_offset, short launch_flags);
int roll_object_destroy_chance(short base_chance, void *object);
void drop_creature_inventory_on_death(void *creature);
void spawn_creature_treasure_drop(void *creature);
void spawn_creature_special_item_drop(void *creature);
void spawn_creature_equipment_drop(void *creature);
void spawn_creature_misc_item_drop(void *creature);
void spawn_creature_death_loot(ushort *creature);
int activate_area_hazard_object(ushort *hazard, uint tile_x, int tile_y, int damage);
int mobile_object_tick(); // was FUN_0002b47c
int npc_ai_tick(); // was FUN_00032d38
int object_tick_is_due(short period, int phase); // was FUN_0003495c
void tick_mobile_objects(char elapsed); // was FUN_000349bc
void build_object_placement_snapshot(ushort *object, byte *snapshot); // was FUN_00054a00
int sync_object_tile_position(ushort *object, void *position); // was FUN_00054f6c
ushort *settle_mobile_to_immobile(ushort *object); // was FUN_0005596c

#endif

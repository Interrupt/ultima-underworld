#ifndef HEADERS_COMBAT_H
#define HEADERS_COMBAT_H

/* Declarations for combat.c: NPC melee combat AI tick states. Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern char DAT_00202878;
extern unsigned char DAT_00084eff_backing[12];
#define DAT_00084eff DAT_00084eff_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   combat.c (NPC melee combat AI) -- extern'd here so both translation
   units see the same storage. */
extern byte DAT_001013f8;
extern char * DAT_00101400;
extern uw_monster_type_props_t *DAT_00101404;
extern char DAT_00101408;
extern byte DAT_0010140c;
extern char DAT_00101410;
extern undefined1 DAT_00101420;
extern int DAT_00101430;
extern char DAT_0010143c;
extern short DAT_00101444; /* signed fine-coordinate delta; ARM reads 16 bits */
extern short DAT_00101448; /* signed fine-coordinate delta; ARM reads 16 bits */
extern undefined4 DAT_00101734_backing[1];
#define DAT_00101734 DAT_00101734_backing[0]
extern char DAT_0010173c;
extern ushort DAT_00101900;
extern uw_mobile_object_t *DAT_0010190c;
extern byte DAT_00101918;
extern undefined4 DAT_00101924;
extern byte DAT_001005fc;
extern undefined2 DAT_00100630_backing[32];
#define DAT_00100630 DAT_00100630_backing[0]
extern short DAT_00100610;
extern char *DAT_001005e4;
extern char *DAT_001005e0;


int resolve_combat_hit_zone(short zone_min, short zone_max, short hit_min, short hit_max);
int find_nearest_hit_target(short *param_1);
void spawn_blood_splat_object(int object_slot, int step_count, byte *snapshot);
int resolve_melee_swing_hit();
int resolve_weapon_hit_skill_check(short hit_flag, int target_slot);
void apply_melee_damage(byte hit_type);
int play_weapon_impact_sound(short result);
void compute_attack_relative_facing();
int process_melee_attack_swing();
int resolve_equipped_weapon_attack(char * *out_attack_data, char * *out_weapon_object);
void compute_player_weapon_attack_stats(char *weapon_stats, char *weapon_item, short attack_type);
void apply_direct_object_hit(short hit_flag, void *attacker, uw_unaligned_word_t *target, short tile_x, short tile_y, short damage_dice, byte hit_type);
int resolve_npc_melee_attack(void *npc, short tile_x, byte tile_y, short offset_x, short offset_y);
void award_monster_kill_experience(uw_unaligned_word_t *monster);
void load_combat_data_file();
void load_monster_combat_stats(int file_handle);
void npc_combat_approach_tick();
void npc_combat_engage_close_tick();
int npc_combat_set_stance(ushort stance_code);
int try_npc_special_ability_no_los();
int try_npc_special_ability_ranged();
int try_npc_special_ability_alt();
void npc_combat_engage_wide_tick();
void npc_combat_position_tick();
uint adjust_heading_away_from_player(uint heading, uint min_distance_sq);
void npc_combat_disengage_tick();
int check_npc_target_alignment(int mode);
int check_npc_fine_facing_alignment(char delta_x, char delta_y);
int apply_damage_to_object(uw_unaligned_word_t *target, byte damage, uw_unaligned_word_t *attacker);
int resolve_damage_type_resistance(uw_unaligned_word_t *object, int damage, uint damage_type_mask);
int apply_typed_damage_to_object(uw_unaligned_word_t *target, uw_unaligned_word_t *attacker, int tile_x, short tile_y, byte damage, byte damage_type);
bool apply_object_durability_damage(uw_unaligned_word_t *object, uw_unaligned_word_t *attacker, short damage, int tile_x, short tile_y);
int is_valid_equipment_slot_item(ushort object_word, short slot);
int damage_equipped_item_in_slot(int slot, byte damage, byte damage_type, short reaction_mode, int report_flag);
int apply_object_collision_scatter(uw_unaligned_word_t *striker, uw_unaligned_word_t *object);
void apply_trap_type_damage_effect(void *trap_object, uw_unaligned_word_t *target);
int resolve_collision_candidate_interaction(short candidate_index, int mover_slot);

#endif

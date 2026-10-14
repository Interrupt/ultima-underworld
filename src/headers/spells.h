#ifndef HEADERS_SPELLS_H
#define HEADERS_SPELLS_H

/* Declarations for spells.c: the spell-effect dispatcher, individual spell effects and their scan
   callbacks. */
#include "uw.h"

extern int (*const DAT_00087604_backing[10])();
#define DAT_00087604 DAT_00087604_backing[0]
#define PTR_FUN_00087614 DAT_00087604_backing[4]

int execute_spell_effect(uint action_id, uint argument, void *actor, void *target);
int force_unlock_target_object(int unused_a, int unused_b, ushort *object);
int cast_single_tile_spell_effect(uint tile_x, int tile_y, void *unused, void *caster, byte damage);
int cast_area_spell_effect(uint tile_x, int tile_y, void *unused, void *caster, byte damage);
bool trigger_type_flagged_trap_effect(int tile_x, int tile_y, void *object, void *unused, byte attacker_slot);
int trigger_tile_damage_trap_effect(int tile_x, int tile_y, void *object, void *unused, byte attacker_slot);
int morph_tile_object_state(int texture_variant, char state_id, void *object, short tile_x, short tile_y);
int trigger_permanent_object_state_effect(short tile_x, short tile_y, void *object);
int apply_tile_morph_variant_2(int tile_x, short tile_y, void *object);
int apply_tile_morph_variant_6(int tile_x, short tile_y, void *object);
int apply_tile_morph_variant_7(int tile_x, short tile_y, void *object);
void cast_cone_damage_spell(void *caster, uint spell_variant);
void cast_targeted_search_effect(void *caster, uint spell_variant);
void cast_summon_or_spawn_effect(void *caster, char variant);
void report_detected_creatures_in_direction(ushort direction, byte count);
void cast_detect_life_spell(short radius, int skill);
void apply_targeted_spell_effect(ushort *caster, char effect_index);
void complete_cast_spell_on_target();
void *spawn_and_prime_spell_effect_object(int object_type, byte *source);
void dispatch_player_command(ushort *actor, int unused, char command);
void complete_pending_player_command_target(ushort *target);
int spawn_random_variant_object_at_tile(int tile_x, int tile_y);
bool spawn_object_near_actor(ushort *actor, short height_offset);
void trigger_player_jump_if_grounded(char *object);
void apply_healing_effect(ushort *object, char effect_code);
int add_active_light_source(uint light_id, uint duration, char flag);

#endif

#ifndef HEADERS_SPELLS_H
#define HEADERS_SPELLS_H

/* Declarations for spells.c: the spell/special-action dispatcher, the scan-callback table the cone
   and search spells draw from, those callbacks, and the cone/search/summon spell effects. */
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

#endif

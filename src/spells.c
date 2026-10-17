/* Spells: the spell-effect dispatcher driven by the spell table, and the individual spell effects
   and their scan callbacks. */
#include "headers/spells.h"
#include "headers/object_actions.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* ARM 0x87604..0x8762b is one table of 10 native callbacks, not byte data (Ghidra has it as a NULL
   word then pointers, with PTR_FUN_00087614 at entry 4). cast_cone_damage_spell indexes it from the
   start and cast_targeted_search_effect from entry 4. Host-sized pointers are used because casting
   a loaded 32-bit word would truncate them on a 64-bit host. */
int (*const DAT_00087604_backing[10])() = {
  NULL, (int (*)())force_unlock_target_object, (int (*)())cast_single_tile_spell_effect,
  (int (*)())apply_tile_morph_variant_2,
  (int (*)())cast_area_spell_effect, (int (*)())apply_tile_morph_variant_6,
  (int (*)())trigger_type_flagged_trap_effect, (int (*)())trigger_permanent_object_state_effect,
  (int (*)())trigger_tile_damage_trap_effect, (int (*)())apply_tile_morph_variant_7
};
#define PTR_FUN_00087614 DAT_00087604_backing[4]


// was FUN_00073b74 -- the general "SPECIAL" action dispatcher (see the SPECIAL ILLUSTRATED
// BOOK/SCROLL comment elsewhere in this file for one example caller shape). param_1&0xff selects
// the action type (0-0xe, a case switch)...
int execute_spell_effect(uint action_id, uint argument, void *actor, void *target)
{
  undefined2 uVar1;
  int iVar2;

  /* ARM 0x73b74 receives object addresses in r2/r3 and reads the actor's
     position at +0x16. Keep these address-sized on the native host: Ghidra's
     uint/int declarations truncated the player pointer during rune casts. */
  if (((char *)actor < DAT_002046c4) || (0xb < (action_id & 0xff))) {
    iVar2 = tile_is_no_magic(*(ushort *)(actor + 0x16) >> 10,
                         (*(ushort *)(actor + 0x16) & 0x3f0) >> 4);
    if (iVar2 != 0) {
      return 0;
    }
    if (DAT_00201b68 == 9) {
      return 0;
    }
  }
  else {
    iVar2 = tile_is_no_magic(DAT_0023c3dc,DAT_0023c3d8);
    if (iVar2 != 0) {
      return 0;
    }
  }
  switch(action_id & 0xff) {
  case 0:
    goto LAB_00073c90;
  case 1:
    if (((argument & 0x3f) == 3) || ((argument & 0x3f) == 5)) {
      trigger_player_jump_if_grounded((char *)actor);
    }
    goto LAB_00073c90;
  case 2:
    goto LAB_00073c90;
  case 3:
LAB_00073c90:
    if ((actor != g_player_object) ||
       (iVar2 = add_active_light_source(action_id,argument & 0x3f,argument & 0xc0), iVar2 == 0)) {
      return 0;
    }
    break;
  case 4:
    if (target == 0) {
      return 0;
    }
    apply_healing_effect((ushort *)target,argument);
    return 1;
  case 5:
    if (actor == g_player_object) {
      g_cursor_holding_state = 3;
      DAT_00202094 = argument & 0xff;
      DAT_00202098 = (char *)g_player_object;
      push_cursor_icon(0x1075);
    }
    else {
      apply_targeted_spell_effect((ushort *)actor,argument);
    }
    break;
  case 6:
    cast_cone_damage_spell(actor,argument);
    break;
  case 7:
    cast_targeted_search_effect(actor,argument);
    break;
  case 8:
    cast_summon_or_spawn_effect(actor,argument);
    break;
  case 9:
    reduce_item_quality_on_use((ushort *)actor,argument);
    break;
  case 10:
    adjust_level7_hazard_value((void *)actor,argument);
    break;
  case 0xb:
    dispatch_player_command((ushort *)actor,argument & 0xffffffc0,argument & 0x3f);
    break;
  case 0xc:
    break;
  case 0xd:
    if ((argument & 0xff) == 3) {
      handle_level4_maze_puzzle_button(4,0,0);
    }
    else if ((argument & 0xff) == 5) {
      print_scroll_message_by_id(0xe4);
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(byte *)(DAT_00086df8 + 0x61) = (byte)uVar1 | 0xc;
      *(char *)(DAT_00086df8 + 0x62) = (char)((ushort)uVar1 >> 8);
      refresh_player_equipment_effects();
    }
    break;
  case 0xe:
    display_book_or_scroll_page(argument & 0xff);
    scheduler_tick(4);
  }
  return 1;
}


// was FUN_000741f0 -- forcibly unlocks a target object: bails out if the object already has bit
// 0x8000 set, if its "lock" field (offset +3, bits 0xffc0) is zero (nothing to unlock), or if it's
// a disallowed class (0x1c0 == 0x180).
int force_unlock_target_object(int unused_a, int unused_b, ushort *object)
{
  undefined1 uVar1;
  ushort *iVar2;
  ushort *local_14;
  
  if (((((*object & 0x8000) == 0) && (local_14 = object + 3, (*local_14 & 0xffc0) != 0)) &&
      ((*object & 0x1c0) != 0x180)) && (iVar2 = find_object_in_chain(&local_14,0,6,2,3), iVar2 != 0)) {
    uVar1 = *(undefined1 *)(DAT_00086df8 + 0x2c);
    *(undefined1 *)(DAT_00086df8 + 0x2c) = 0x2d;
    resolve_skill_gated_unlock_or_use(g_player_object,object,iVar2,5);
    *(undefined1 *)(DAT_00086df8 + 0x2c) = uVar1;
    return 1;
  }
  return 0;
}



// was FUN_000742c0 -- casts a single-tile spell effect at tile (param_1,param_2): spawns a
// type-0x1c5 effect object via spawn_and_prime_spell_effect_object, applies its damage to just that
// one tile (damage_all_objects_at_tile with damage-tier index 2-1=1)...
int cast_single_tile_spell_effect(uint tile_x, int tile_y, void *unused, void *caster, byte damage)
{
  int uw_ord2005_rem_153 = 0;
  short sVar1;
  char *uVar2;  /* was `undefined4` -- truncated spawn_and_prime_spell_effect_object's pointer */
  undefined4 uVar3;
  undefined4 uVar4;
  uint extraout_r1;
  undefined1 uVar5;

  uVar2 = (char *)spawn_and_prime_spell_effect_object(0x1c5,caster);
  damage_all_objects_at_tile(tile_x,tile_y,2,damage);
  uVar3 = ce_rand();
  uVar4 = encode_object_slot_index(uVar2);
  uVar5 = (undefined1)tile_y;
  uw_ord2005_rem_153 = ((int)(uVar3)) % (4);
  sVar1 = scheduler_add_entry(uVar4,4,uw_ord2005_rem_153 & 0xff,tile_x & 0xff,uVar5);
  if (sVar1 == -1) {
    free_object_slot(uVar2);
  }
  else {
    object_list_insert_head(caster + 2,uVar2);
  }
  return 1;
}



// was FUN_00074380 -- casts an area spell effect centered on tile (param_1,param_2): spawns a
// type-0x1c2 effect object via spawn_and_prime_spell_effect_object, applies damage...
int cast_area_spell_effect(uint tile_x, int tile_y, void *unused, void *caster, byte damage)
{
  short sVar1;
  char *uVar2;  /* was `undefined4` -- truncated spawn_and_prime_spell_effect_object's pointer */
  undefined4 uVar3;

  uVar2 = (char *)spawn_and_prime_spell_effect_object(0x1c2,caster);
  damage_all_objects_at_tile(tile_x,tile_y,1,damage);
  damage_all_objects_at_tile(tile_x + 1,tile_y,1,damage);
  damage_all_objects_at_tile(tile_x - 1,tile_y,1,damage);
  damage_all_objects_at_tile(tile_x,tile_y + 1,1,damage);
  damage_all_objects_at_tile(tile_x,tile_y + -1,1,damage);
  uVar3 = encode_object_slot_index(uVar2);
  sVar1 = scheduler_add_entry(uVar3,4,0,tile_x & 0xff,(char)tile_y);
  if (sVar1 == -1) {
    free_object_slot(uVar2);
  }
  else {
    object_list_insert_head(caster + 2,uVar2);
    spawn_effect_debris_burst(uVar2,tile_x,tile_y);
  }
  return 1;
}





// was FUN_00074474 -- gated trap/effect trigger: resolve_damage_type_resistance (not yet named) is
// the shared per-object-type-flags helper used throughout this cluster...
bool trigger_type_flagged_trap_effect(int tile_x, int tile_y, void *object, void *unused, byte attacker_slot)
{
  char cVar1;
  void *uVar2;
  
  cVar1 = resolve_damage_type_resistance(object,1,0x80);
  if (cVar1 == '\0') {
    uVar2 = get_object_record_by_slot_index(attacker_slot);
    apply_typed_damage_to_object(object,uVar2,tile_x,tile_y,0xff,3);
  }
  return cVar1 == '\0';
}



// was FUN_000744e0 -- unconditional tile-trap damage effect at tile (param_1,param_2): first alters
// the tile's texture/decoration (spawn_scheduled_effect_object, group 7, subtype 4)...
int trigger_tile_damage_trap_effect(int tile_x, int tile_y, void *object, void *unused, byte attacker_slot)
{
  undefined1 uVar1;
  void *uVar2;
  undefined1 uVar3;
  undefined2 uVar4;
  undefined1 uVar5;
  
  uVar3 = 0;
  uVar4 = (undefined2)tile_x;
  spawn_scheduled_effect_object(object,7,4,0,7,uVar4,(short)tile_y);
  uVar5 = (undefined1)((ushort)uVar4 >> 8);
  uVar1 = roll_dice_sum(5,4);
  uVar2 = get_object_record_by_slot_index(attacker_slot);
  apply_typed_damage_to_object(object,uVar2,tile_x,tile_y,CONCAT11(uVar3,uVar1),CONCAT11(uVar5,0x13));
  return 1;
}



// was FUN_0007455c -- resistance-gated object-state morph: runs a real resistance roll via
// resolve_damage_type_resistance (mask 3, i.e. the random partial-resist chance bits) against the
// target object (param_3); if not resisted...
int morph_tile_object_state(int texture_variant, char state_id, void *object, short tile_x, short tile_y)
{
  char cVar1;
  uint uVar2;
  
  cVar1 = resolve_damage_type_resistance(object,1,3);
  if (cVar1 != '\0') {
    spawn_scheduled_effect_object(object,7,4,0,7,tile_x,tile_y);
    npc_set_goal_for_object(object,texture_variant,1);
    if ((int)state_id != 0xffffffff) {
      uVar2 = *(ushort *)(object + 0xd) & 0x3fff;
      *(char *)(object + 0xd) = (char)uVar2;
      *(byte *)(object + 0xe) = (byte)(uVar2 >> 8) | (byte)((((int)state_id & 3U) << 0xe) >> 8);
    }
  }
  return 1;
}





// was FUN_00074614 -- resistance-gated, one-time-effect object-state trigger: like
// morph_tile_object_state, runs a real resistance roll (resolve_damage_type_resistance, mask 3)
// before acting.
int trigger_permanent_object_state_effect(short tile_x, short tile_y, void *object)
{
  char cVar1;
  
  cVar1 = resolve_damage_type_resistance(object,1,3);
  if (cVar1 != '\0') {
    spawn_scheduled_effect_object(object,7,4,0,7,tile_x,tile_y);
    if ((*(byte *)(object + 0x19) & 0x40) == 0) {
      npc_set_goal_for_object(object,2,0);
    }
    *(byte *)(object + 0x19) = *(byte *)(object + 0x19) | 0x40;
    *(undefined1 *)(object + 0xd) = *(undefined1 *)(object + 0xd);
    *(byte *)(object + 0xe) = *(byte *)(object + 0xe) | 0xc0;
  }
  return 1;
}



// was FUN_000746b0 -- thin wrapper: morph_tile_object_state with
// texture/effect variant 2 and object-state id 1.
int apply_tile_morph_variant_2(int tile_x, short tile_y, void *object)
{
  /* ARM leaves the morph result in r0 for the area scanner. */
  return morph_tile_object_state(2,1,object,tile_x,tile_y);
}



// was FUN_000746d4 -- thin wrapper: morph_tile_object_state with texture/effect variant 6 and
// object-state id -1 ("no change" -- this variant only affects the tile's texture/decoration, not
// the target object's quality/link field).
int apply_tile_morph_variant_6(int tile_x, short tile_y, void *object)
{
  /* ARM leaves the morph result in r0 for the area scanner. */
  return morph_tile_object_state(6,-1,object,tile_x,tile_y);
}



// was FUN_000746f8 -- thin wrapper: morph_tile_object_state with
// texture/effect variant 7 and object-state id 1.
int apply_tile_morph_variant_7(int tile_x, short tile_y, void *object)
{
  /* ARM leaves the morph result in r0 for the area scanner. */
  return morph_tile_object_state(7,1,object,tile_x,tile_y);
}


// was FUN_00074c64 -- execute_spell_effect's case 6 handler: rolls 3d4 damage, then scans a
// 4-deep, 2-wide area in front of the caster (scan_area_ahead_of_object) invoking a spell-effect
// callback selected from a function-pointer table...
void cast_cone_damage_spell(void *caster, uint spell_variant)
{
  char cVar1;

  cVar1 = roll_dice_sum(3,4);
  /* Indices past the 10 entries would read non-code data in the original; use no callback. */
  unsigned idx = spell_variant & 0x3f;
  int (*callback)() = idx < 10 ? DAT_00087604_backing[idx] : NULL;
  scan_area_ahead_of_object(caster,(int)cVar1,callback,
               spell_variant & 0xc0,4,2);
}



// was FUN_00074cc8 -- execute_spell_effect's case 7 handler, player-only: same
// scan-ahead-of-object shape as cast_cone_damage_spell, but fixed to a single match and drawing its
// callback from a different function-pointer table...
void cast_targeted_search_effect(void *caster, uint spell_variant)
{
  if (caster == g_player_object) {
    unsigned idx = spell_variant & 0x3f;
    scan_area_ahead_of_object(caster,1,idx + 4 < 10 ? DAT_00087604_backing[idx + 4] : NULL,spell_variant & 0xc0,4,2);
  }
}



// was FUN_00074d20 -- execute_spell_effect's case 8 handler: projects a position in front of the
// caster (project_position_by_ heading) and branches on param_2...
/* ARM passes the caster/actor address unchanged through r0 (execute_spell_effect's case 8, which
   itself already keeps this address-sized -- see that function's own comment on the same
   host-truncation class). param_1 was declared `int`... */
void cast_summon_or_spawn_effect(void *caster, char variant)
{
  int uw_ord2005_rem_154 = 0; int uw_ord2005_rem_155 = 0; int uw_ord2005_rem_156 = 0;
  byte bVar1;
  ushort uVar2;
  short sVar3;
  long uVar4;
  uw_object_hdr_t *saved_scratch;
  byte *pbVar5;
  uint uVar6;
  undefined2 uVar7;
  int extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint extraout_r1_02;
  int iVar8;
  int iVar9;
  uint uVar10;
  undefined4 uVar11;
  uw_object_hdr_t *pObj;  /* was reuse of `iVar8` (int) -- truncated spawn_new_object's
                  real pointer; iVar8 itself stays int for its earlier,
                  unrelated uses above */
  ushort local_34;
  ushort local_32;
  short local_30;
  ushort local_2e;
  ushort local_2c;
  byte *local_28;
  
  uVar11 = 0x115;
  uVar4 = ce_rand();
  uVar2 = ((uw_object_hdr_t *)caster)->position_word;
  bVar1 = ((uw_mobile_object_t *)caster)->heading_flags;
  uw_ord2005_rem_154 = ((int)(uVar4)) % (0x1b);
  uw_ord2005_rem_155 = ((int)((bVar1 & 0x1f) + (uVar2 >> 2 & 0xe0) + uw_ord2005_rem_154 + -0xd)) % (0xff);
  local_34 = ((((uw_mobile_object_t *)caster)->tile_x << 3)) + (uVar2 >> 0xd);
  local_32 = ((((uw_mobile_object_t *)caster)->tile_y << 3)) + (uVar2 >> 10 & 7);
  uVar7 = 0xc;
  if (variant != '\x04') {
    uVar7 = 9;
  }
  project_position_by_heading(uw_ord2005_rem_155 & 0xffff,uVar7,&local_34,&local_32);
  local_2c = (ushort)((int)(short)local_34 >> 3);
  local_2e = (ushort)((int)(short)local_32 >> 3);
  if (variant == '\x03') {
    sVar3 = create_scripted_trap_pair_at_tile((int)(short)local_34 >> 3,(int)(short)local_32 >> 3,9);
    if (sVar3 != 0) {
      uVar11 = 0x114;
    }
    if (caster != g_player_object) {
      return;
    }
  }
  else {
    /* Was `tilemap_lookup()` -- dropped both arguments (the same K&R decompile bug already found
       and fixed at ~30 other call sites in babl.c and ai.c's npc_walk_toward_tile: Ghidra's
       decompiler doesn't show the real ARM r0/r1 setup for some call shapes)... */
    pbVar5 = (byte *)tilemap_lookup(local_2c,local_2e);
    /* tilemap_lookup legitimately returns NULL for an out-of-range tile (its own documented
       contract, see tile_pair_los_blocked's NULL guard for the same reason) -- the projected
       destination here... */
    if (pbVar5 == (byte *)0) {
      if (caster != g_player_object) {
        return;
      }
      print_scroll_message_by_id(0x115);
      return;
    }
    local_30 = (ushort)(*pbVar5 >> 4) << 3;
    local_28 = pbVar5;
    if (variant == '\x01') {
      uVar4 = ce_rand();
      uw_ord2005_rem_156 = ((int)(uVar4)) % (7);
      uVar10 = (uw_ord2005_rem_156 & 0xffff) + 0xb0;
    }
    else if (variant == '\x04') {
      if (caster == g_player_object) {
        uVar6 = (uint)*(byte *)(DAT_00086df8 + 0x2a);
      }
      else {
        uVar6 = (int)DAT_00201b68 << 2;
      }
      uVar6 = uVar6 & 0xff;
      if (uVar6 < 2) {
        uVar6 = 2;
      }
      /* Was `ordint_divmod(uVar6,uVar4); uVar10 = (extraout_r1_01 & 0xffff) + ...` -- the same
         fabricated-remainder bug fixed throughout this session (this port's ordint_divmod never
         populates extraout_r1)... */
      do {
        do {
          uVar4 = ce_rand();
          uVar10 = ((uint)ordint_divmod(uVar6,(int)uVar4).rem & 0xffff) + uVar6 + 0x40;
          iVar8 = (uVar10 & 0xfe3f) * 0x30;
        } while (g_monster_type_props[(iVar8) / 0x30].max_hp == '\0');
      } while (((((g_monster_type_props[(iVar8) / 0x30].movement_flags & 2) != 0) || ((uVar10 & 0xffff) == 0x7b)) ||
                ((uVar10 & 0xffff) == 0x7c)) || ((g_monster_type_props[(iVar8) / 0x30].movement_flags & 0x40) != 0));
    }
    else {
      uVar10 = (uint)local_2c;
    }
    iVar8 = check_object_placement_clearance(uVar10,0,(int)(short)local_34,(int)(short)local_32,local_30,1,8);
    /* HACK: not original behaviour -- spawn_new_object returns NULL once the object table is full
       (a mobile-object slot for variant 4, summon monster); the original dereferenced it. Treat
       a full table like a blocked spot. */
    pObj = NULL;
    if (iVar8 != 0) {
      pObj = spawn_new_object(uVar10, variant == '\x04');
    }
    if (pObj != NULL) {
      uVar2 = pObj->position_word;
      uVar6 = uVar2 & 0x1fff;
      bVar1 = (byte)(((local_34 & 7) << 0xd) >> 8);
      pObj->xpos = local_34 & 7;
      uVar6 = uVar2 & 0x3ff;
      pObj->ypos = local_32 & 7;
      saved_scratch = g_scratch_object_ptr;
      if (variant == '\x04') {
        g_scratch_object_ptr = (uw_object_hdr_t *)pObj;
        init_monster_spawn_defaults();
        uVar6 = local_2e & 0x3f | (local_2c & 0x3ff) << 6;
        g_scratch_object_ptr = saved_scratch;
        ((uw_mobile_object_t *)pObj)->tile_y = local_2e & 0x3f;
        ((uw_mobile_object_t *)pObj)->tile_x = local_2c & 0x3f;
        if ((g_monster_type_props[(uVar10 & 0xfe3f)].movement_flags & 0x80) != 0) {
          iVar9 = local_30 + 0x80;
          if (iVar9 < 0) {
            iVar9 = local_30 + 0x81;
          }
          local_30 = (short)(iVar9 >> 1);
        }
        pbVar5 = local_28;
        if (caster == g_player_object) {
          ((uw_mobile_object_t *)pObj)->npc_ai_flags = ((uw_mobile_object_t *)pObj)->npc_ai_flags | 0x40;
        }
        else {
          uVar10 = ((uw_mobile_object_t *)pObj)->status_word & 0x3fff;
          ((uw_mobile_object_t *)pObj)->npc_attitude = 0;
          ((uw_mobile_object_t *)pObj)->npc_ai_flags = ((uw_mobile_object_t *)pObj)->npc_ai_flags | 1;
          uVar2 = ((uw_mobile_object_t *)pObj)->target_word;
          uVar10 = uVar2 & 0xffc0;
          bVar1 = g_player_object->npc_xhome;
          ((uw_mobile_object_t *)pObj)->npc_target_tile_x = bVar1;
          uVar10 = uVar2 & 0xf000 | (uint)bVar1 | (g_player_object->npc_yhome << 4) << 2;
          ((uw_mobile_object_t *)pObj)->npc_target_tile_y = g_player_object->npc_yhome;
        }
      }
      else {
        uVar7 = pObj->chain_word;
        pObj->quality = 0x3f;
      }
      uVar7 = pObj->position_word;
      bVar1 = (byte)uVar7;
      pObj->zpos = (byte)local_30 & 0x7f;
      object_list_insert_head(pbVar5 + 2,pObj);
      if (variant == '\x04') {
        return;
      }
      settle_dropped_object(pObj,(int)(short)local_2c,(int)(short)local_2e,1);
      return;
    }
    if (caster != g_player_object) {
      return;
    }
    uVar11 = 0x115;
  }
  print_scroll_message_by_id(uVar11);
}


// was FUN_000753a0 -- prints a "creatures detected in this direction" scroll message for
// cast_detect_life_spell below: param_1 is a 0-7 compass-direction bucket, param_2 is how many
// creatures were found there.
void report_detected_creatures_in_direction(ushort direction, byte count)
{
  void *uVar1;
  
  uVar1 = get_message_string((int)(short)(ushort)(4 < count) + (int)(short)(ushort)(1 < count) + 0x3bU
                       | 0x200);
  print_message_with_proximity_qualifier(uVar1,0,0,0,0,0,0,-1 - (direction & 0xff));
}



// was FUN_0007541c -- "Detect Life" spell: walks every active creature (type 0x1c0==0x40) within a
// square radius param_1 of the player, rolls a skill check...
void cast_detect_life_spell(short radius, int skill)
{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  ushort *puVar5;
  uint uVar6;
  byte bVar7;
  int iVar8;
  uint uVar9;
  byte *pbVar10;
  uint uVar11;
  int iVar12;
  uint uVar13;
  byte local_2c [8];
  
  ce_memset(local_2c,0,8);
  uVar2 = g_player_object->tile_word;
  for (pbVar10 = DAT_002046c0; pbVar10 < DAT_002046c8; pbVar10 = pbVar10 + 1) {
    puVar5 = (ushort *)((uint)*pbVar10 * 0x1b + DAT_002046b8);
    uVar13 = (uint)*puVar5;
    if ((uVar13 & 0x1c0) == 0x40) {
      uVar3 = puVar5[0xb];
      iVar8 = (uint)(uVar3 >> 10) - (uint)(uVar2 >> 10);
      iVar12 = (uVar3 >> 4 & 0x3f) - (uVar2 >> 4 & 0x3f);
      iVar1 = iVar8 * 0x1000000;
      uVar6 = iVar1 >> 0x1f;
      if ((((int)((iVar1 >> 0x18 ^ uVar6) - uVar6) < (int)radius) &&
          (iVar1 = iVar12 * 0x1000000, uVar6 = iVar1 >> 0x1f,
          (int)((iVar1 >> 0x18 ^ uVar6) - uVar6) < (int)radius)) &&
         (sVar4 = roll_skill_check(skill,0xf - ((byte) g_monster_type_props[(uVar13 & 0x3f)].detection_ranges & 0xf)),
          0 < sVar4)) {
        sVar4 = compute_compass_direction(iVar8,iVar12);
        local_2c[sVar4] = local_2c[sVar4] + 1;
      }
    }
  }
  uVar13 = 0;
  uVar6 = 0;
  do {
    pbVar10 = local_2c + uVar6;
    uVar6 = uVar6 + 1 & 0xff;
    if (uVar13 < *pbVar10) {
      uVar13 = (uint)*pbVar10;
    }
  } while (uVar6 < 8);
  if (uVar13 == 0) {
    print_scroll_message_by_id(0x3e);
  }
  else {
    uVar6 = 3;
    if (uVar13 < 4) {
      uVar6 = uVar13;
    }
    uVar9 = 0;
    do {
      if (local_2c[uVar9] == uVar13) {
        report_detected_creatures_in_direction(uVar9,local_2c[uVar9]);
        uVar11 = uVar9;
        uVar13 = uVar6;
        break;
      }
      uVar9 = uVar9 + 1 & 0xff;
      uVar11 = uVar6;
    } while (uVar9 < 8);
    uVar6 = ce_rand();
    uVar6 = uVar6 & 7;
    bVar7 = 0;
    do {
      if (((uVar6 & 7) != uVar11) && (uVar13 < local_2c[uVar6 & 7])) {
        report_detected_creatures_in_direction(uVar6 & 7,local_2c[uVar6 & 7]);
        return;
      }
      bVar7 = bVar7 + 1;
      uVar6 = uVar6 + 1 & 0xff;
    } while (bVar7 < 8);
  }
}


// was FUN_000740b0 -- execute_spell_effect's case 5 ("spawn a targeted spell-effect object")
// worker: param_2 (1-4) selects one of four effect-object subtypes {7,5,4,6} and
// spawn_object_near_actor spawns that object near/at param_1's location...
/* ARM passes the actor address unchanged through r0 (0x740e8 and 0x7ca1c).
   Keep it pointer-sized here: an int truncates the queued player's address
   before projectile placement on a 64-bit host. */
void apply_targeted_spell_effect(ushort *caster, char effect_index)
{
  int iVar1;
  undefined1 auStack_d [5];

  auStack_d[1] = 7;
  auStack_d[2] = 5;
  auStack_d[3] = 4;
  auStack_d[4] = 6;
  iVar1 = spawn_object_near_actor(caster,auStack_d[effect_index]);
  if (caster == g_player_object) {
    if (iVar1 == 0) {
      print_scroll_message_by_id(0xff);
    }
    else if (DAT_0023c3e0 != '\0' && !g_debug_godmode) {
      *(char *)(DAT_00086df8 + 0x37) = *(char *)(DAT_00086df8 + 0x37) - DAT_0023c3e0;
    }
    DAT_0023c3e0 = '\0';
  }
}


// was FUN_0007ca0c -- deferred-target-click completion callback that finishes the "cast a spell
// effect on this target" flow: applies the staged targeted spell effect...
void complete_cast_spell_on_target()

{
  apply_targeted_spell_effect((ushort *)DAT_00202098,(int)(char)DAT_00202094);
  g_cursor_holding_state = 0;
  pop_cursor_icon(3);
  wait_for_click_release(1);
  return;
}


// was FUN_00074150
/* Was `int spawn_and_prime_spell_effect_object(...)` -- returned spawn_new_object's real object
   pointer through a 32-bit int, truncated on this host; both callers... */
void *spawn_and_prime_spell_effect_object(int object_type, byte *source)
{
  uint uVar1;
  undefined2 uVar2;
  byte bVar3;
  char *iVar4;
  undefined4 uVar5;
  char extraout_r1;
  byte bVar6;

  iVar4 = (char *)spawn_new_object(object_type,0);
  bVar6 = (*source >> 4) * '\b';
  uVar1 = (int)((uint)(*source >> 4) << 0x13) >> 0x10;
  if (uVar1 < 0x80) {
    uVar5 = ce_rand();
    extraout_r1 = (char)ordint_divmod(0x80 - uVar1,uVar5).rem;
    bVar6 = bVar6 + extraout_r1;
  }
  uVar2 = ((uw_object_hdr_t *)iVar4)->position_word;
  bVar3 = (byte)uVar2;
  ((uw_object_hdr_t *)iVar4)->position_word_low = (bVar3 ^ bVar6) & 0x7f ^ bVar3;
  ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)(char)((ushort)uVar2 >> 8);
  return iVar4;
}


// was FUN_00075808 -- execute_spell_effect's case 0xb handler: a numbered (0-0xc) player-command
// dispatcher, player-only.
void dispatch_player_command(ushort *actor, int unused, char command)
{
  undefined2 uVar1;
  char cVar2;
  undefined4 uVar3;
  uint uVar4;
  
  if (actor != g_player_object) {
    return;
  }
  switch((int)command) {
  case 0:
    uVar3 = 2;
    goto LAB_00075a0c;
  case 1:
    cast_detect_life_spell(10,0x2d);
    break;
  case 2:
    goto LAB_0007588c;
  case 3:
    goto LAB_0007588c;
  case 4:
    goto LAB_0007588c;
  case 5:
LAB_0007588c:
    g_cursor_holding_state = 2;
    DAT_00202098 = (char *)g_player_object;
    DAT_002020b8 = complete_pending_player_command_target;
    DAT_00202094 = (int)command;
    push_cursor_icon(0x1076);
    break;
  case 6:
    uVar4 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar4;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar4 >> 8);
    break;
  case 7:
    add_active_light_source(0xb,1,unused);
    set_custom_view_target(0);
    set_view_subject_by_command(-1);
    break;
  case 8:
    uVar3 = 3;
    goto LAB_00075a0c;
  case 9:
    cVar2 = roll_dice_sum(8,3);
    scan_area_ahead_of_object(actor,(int)cVar2,spawn_random_variant_object_at_tile,0x40,5,3);
    set_movement_animation_timer(0x40,0x28);
    play_sound_effect_at_object(0x12,actor,0);
    break;
  case 10:
    if ((*(byte *)(DAT_00086df8 + 0x5e) & 0xf) == 0) {
      print_scroll_message_by_id(0x111);
    }
    else {
      DAT_00201c9c = &check_scheduled_object_location_callback;
      teleport_object_to_level_tile(g_player_object,0x3f,0x3f,*(byte *)(DAT_00086df8 + 0x5e) & 0xf);
      set_player_tile_position(0,0,0);
      set_pending_update_flags(0x7ffe);
    }
    break;
  case 0xb:
    uVar3 = 0;
LAB_00075a0c:
    add_active_light_source(0xb,uVar3,unused);
    break;
  case 0xc:
    free_player_inventory_chain((char *)g_player_object + 6);
    reset_level_arena_and_invalidate(0);
    clear_rune_bag_contents();
    reset_ready_rune_slots();
    uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
    *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar1 >> 8) | 0x10;
    *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
    g_player_carry_weight = 0;
    refresh_player_equipment_effects();
    redraw_active_hud_panel();
  }
}


// was FUN_000756c8 -- deferred target-click completion callback for dispatch_player_command's cases
// 2-5 (stored into the DAT_002020b8 click-target callback slot, distinct from finish_object_use's
// own DAT_00202098-driven item-use flow).
void complete_pending_player_command_target(ushort *target)
{
  ushort uVar1;
  short sVar2;
  undefined4 uVar3;
  uint uVar4;
  
  if ((short)DAT_00202094 == 3) {
    sVar2 = roll_container_lockpick_check(target,0x2d);
    if (sVar2 != 0) {
      roll_container_trap_disarm_check(target,0x2d);
    }
  }
  else if ((short)DAT_00202094 == 4) {
    dispatch_object_action_dup(target,3);
    uVar4 = ((uw_object_hdr_t *)target)->object_id & 0x1c0;
    if (((uVar4 != 0x140) && (uVar4 != 0x40)) &&
       ((g_object_type_props[(((uw_object_hdr_t *)target)->object_id)].class_flags & 3) != 2)) {
      uVar1 = ((uw_object_hdr_t *)target)->position_word;
      ((uw_object_hdr_t *)target)->position_word = (ushort)(uVar1 | 0x380);
    }
  }
  else if ((short)DAT_00202094 == 5) {
    sVar2 = check_object_combination(g_player_object,target,-45);
    if (sVar2 == 3) {
      uVar3 = 0x10e;
    }
    else {
      uVar3 = 0x10f;
    }
    print_scroll_message_by_id(uVar3);
  }
  pop_cursor_icon(3);
  g_cursor_holding_state = 0;
  wait_for_click_release(1);
}


// was FUN_00075248 -- spawns one of 3 object-id variants (0x154-0x156, chosen at random) centered
// in tile (param_1,param_2), sets its quality field to 0x6e, and places it in the world
// (place_object_in_world).
int spawn_random_variant_object_at_tile(int tile_x, int tile_y)
{
  int uw_ord2005_rem_157 = 0; int uw_ord2005_rem_158 = 0;
  byte bVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  char *iVar4;  /* was `int` -- truncated spawn_new_object's real pointer */
  int iVar5;
  char extraout_r1;
  short extraout_r1_00;
  uint uVar6;

  uVar3 = ce_rand();
  uw_ord2005_rem_157 = ((int)(uVar3)) % (3);
  iVar4 = (char *)spawn_new_object(uw_ord2005_rem_157 + 0x154,0);
  uVar6 = ((uw_object_hdr_t *)iVar4)->position_word & 0xffee;
  ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)uVar6 | 0x6e;
  ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)(char)(uVar6 >> 8);
  iVar5 = place_object_in_world(tile_x * 8 + 3,tile_y * 8 + 3,0x6e,iVar4,0,0);
  if ((iVar5 != 0) && (iVar5 = object_is_mobile(iVar4), iVar5 != 0)) {
    bVar1 = ce_rand();
    ((uw_mobile_object_t *)iVar4)->speed = ((bVar1 & 3) + 2) & 0x7f;
    uVar2 = ce_rand();
    ((uw_mobile_object_t *)iVar4)->full_heading = uVar2;
    bVar1 = ce_rand();
    ((uw_mobile_object_t *)iVar4)->tick_phase = ((bVar1 & 3) + DAT_00101928) & 0xf;
    uVar3 = ce_rand();
    bVar1 = ((uw_mobile_object_t *)iVar4)->attack_pitch;
    uw_ord2005_rem_158 = ((int)(uVar3)) % (3);
    ((uw_mobile_object_t *)iVar4)->attack_pitch = (uw_ord2005_rem_158 + 1U ^ bVar1) & 7 ^ bVar1;
  }
  return 1;
}


// was FUN_0004a588 -- the general "spawn an object near a given actor" helper: if the actor is the
// player, aims from the cursor (compute_drop_aim_from_cursor); otherwise uses the actor's own
// position, falling back to the current tile if the actor is outside the live object arena.
bool spawn_object_near_actor(ushort *actor, short height_offset)
{
  ushort *puVar1; /* ARM 0x4a678 tests the returned object pointer for NULL. */
  
  DAT_00202a38 = height_offset + 0x10;
  DAT_00202a48 = (ushort)(byte) g_ranged_type_props[height_offset].projectile_speed;
  DAT_00202a4c = (ushort)(*((byte *)actor + 0x17) >> 2);
  DAT_00202a50 = (ushort)((actor[11] & 0x3f0) >> 4);
  DAT_00202a54 = 1;
  DAT_00202a44 = actor;
  if (actor == g_player_object) {
    compute_drop_aim_from_cursor();
  }
  else {
    if ((uintptr_t)DAT_002046c4 <= (uintptr_t)actor) {
      DAT_00202a4c = (ushort)DAT_0023c3dc;
      DAT_00202a50 = (ushort)DAT_0023c3d8;
      DAT_00202a3c = 0;
    }
    DAT_00202a54 = (ushort)((uintptr_t)DAT_002046c4 > (uintptr_t)actor);
    DAT_00202a40 = 0;
  }
  puVar1 = spawn_object_near_player();
  return puVar1 != 0;
}


// was FUN_0003dba0 -- execute_spell_effect's case-1 handler for sub-codes 3/5.
void trigger_player_jump_if_grounded(char *object)
{
  if ((void *)object == (void *)g_player_object) {
    if ((DAT_002048a8 & 0x10) == 0) {
      g_vertical_velocity = 0x8d;
    }
    g_fall_accel = 0;
  }
}


// was FUN_00073fc4 -- execute_spell_effect's "healing item" handler (its own case 4): only
// applies if the target object's quality bits match 0x40 (a food/potion-shaped flag), then restores
// HP via restore_stat_capped -- param_2==0xf is a full-heal sentinel (-1)...
void apply_healing_effect(ushort *object, char effect_code)
{
  char cVar1;
  int iVar2;
  
  if ((*object & 0x1c0) == 0x40) {
    if (effect_code == '\x0f') {
      iVar2 = -1;
    }
    else {
      cVar1 = roll_dice_sum((int)effect_code,8);
      iVar2 = (int)cVar1;
    }
    restore_stat_capped(object,iVar2);
  }
}


// was FUN_000542f8 -- grants the player a new active light source: fails (returns 0) if the
// active-light count (DAT_00086df8+0x5f bits 6-9) is already at its cap; otherwise stages a new
// slot with type param_1 and radius param_2...
int add_active_light_source(uint light_id, uint duration, char flag)
{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  uint uVar5;
  byte local_14;
  
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) == 0xc0) {
    uVar1 = 0;
  }
  else {
    uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf;
    iVar2 = (uint)*(byte *)(DAT_00086df8 + uVar5 * 2 + 0x3f) * 0x100 + (duration & 0xff) * 0x10 +
            (light_id & 0xff);
    puVar4 = (undefined1 *)(DAT_00086df8 + (uVar5 + 0x1f) * 2);
    *puVar4 = (char)iVar2;
    puVar4[1] = (char)((uint)iVar2 >> 8);
    if (flag == '\0') {
      uVar5 = roll_dice_sum(2,3);
      uVar5 = uVar5 & 0xff;
    }
    else if (flag == '\x01') {
      uVar5 = 1;
    }
    else if (flag == '@') {
      uVar5 = roll_dice_sum(2,8);
      uVar5 = (uVar5 & 0xff) + 6;
    }
    else if (flag == -0x80) {
      uVar5 = roll_dice_sum(3,0x14);
      uVar5 = (uVar5 & 0xff) + 0x18;
    }
    else {
      uVar5 = (uint)local_14;
    }
    uVar3 = *(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf;
    iVar2 = (uint)*(byte *)(DAT_00086df8 + uVar3 * 2 + 0x3e) + (uVar5 & 0xff) * 0x100;
    puVar4 = (undefined1 *)(DAT_00086df8 + (uVar3 + 0x1f) * 2);
    *puVar4 = (char)iVar2;
    puVar4[1] = (char)((uint)iVar2 >> 8);
    uVar5 = (uint)*(ushort *)(DAT_00086df8 + 0x5f);
    uVar5 = ((uVar5 & 0xffc0) + 0x40 ^ uVar5) & 0x3c0 ^ uVar5;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
    refresh_player_equipment_effects();
    uVar1 = 1;
  }
  return uVar1;
}

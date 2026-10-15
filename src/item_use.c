/* Item use: ready/unready weapon, picking up/dropping objects near the player or a target, light
   sources, food, and combine/stow-into- container logic. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/item_use.h"
#include "headers/options.h"
#include <math.h>
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define _DAT_002035cf (*(uint*)&DAT_002035cf)
char s_UNNAMED_00084f24[] = "UNNAMED";
static char s_objsbecombinable_returns__d_00084f50[] = "objsbecombinable returns %d\n";
static char s_combination__d_is__d_and__d__00084f70[] = "combination %d is %d and %d.\n";
static char s_checking_if__d_and__d_are_combin_00084f90[] = "checking if %d and %d are combinable...\n";
/* Sizing pass: combination-result table, indexed by
   objects_are_combinable's own return (0-9, a fixed "10 entries"
   search loop) at a 6-byte stride -- real max 9*6+2=56 bytes. */
/* ARM field view: use the parent record populated by the loader/runtime. */
#define DAT_00100634 (*(undefined1 *)((char *)DAT_00100630_backing + 4))
/* Sizing-audit pass: sibling high-slot of DAT_00100630 (combat.c), same combination-index param_2
   (0-9) and the same `*3` ushort stride (`&DAT_00100632 + param_2*3` in is_object_consumed_in_
   combination) -- real max 9*3=27, 28 elements (56 bytes), same bound as DAT_00100630's own fix. */
/* ARM field view: use the parent record populated by the loader/runtime. */
#define DAT_00100632 DAT_00100630_backing[1]

/* ARM field view: use the parent record populated by the loader/runtime. */
#define DAT_002035cf ((byte *)g_object_type_props)[0x93f]
// was DAT_0008725c -- gates weapon_swing_draw_tick's blit; temporarily cleared during full-screen
// wipe/dissolve transitions (level loads, screen fades) so the weapon overlay doesn't glitch
// mid-transition, then restored once the transition finishes.
undefined4 g_weapon_overlay_enabled = 1;
/* Sizing-audit pass: sibling of hud.c's DAT_00202988, same loop
   (`iVar4<6`) in the shared paperdoll-overlay refresh code. HARD.
   Down from 16. */
static undefined1 DAT_002028e0_backing[6];
#define DAT_002028e0 DAT_002028e0_backing[0]
static char s_armor_f_00085c60[] = "armor_f";
static ushort DAT_00202962;
static ushort DAT_00202964;
/* Ghidra rendered the embedded space as an underscore and dropped the
   trailing space. Real bytes at 0x85c68 (ARM UU.exe .data):
   "Move how many? ". */
static char s_Move_how_many__00085c68[] = "Move how many? ";
/* Ghidra rendered the embedded space as an underscore, dropped the
   leading space and trailing newline. Real bytes at 0x85c78 (ARM
   UU.exe .data): " is too full.\n". */
static char s_is_too_full__00085c78[] = " is too full.\n";
/* Sizing-audit pass sized this to 32 and marked its content "unrecovered" (single use,
   `ce_strcat(acStack_7c,&DAT_00085ce0)`, 0 writers). */
undefined DAT_00085ce0_backing[32] = "...\n";
/* Ghidra rendered the embedded spaces as underscores and dropped the
   trailing space. Real bytes at 0x85ce8 (ARM UU.exe .data):
   "You read the ". */
char s_You_read_the_00085ce8[] = "You read the ";
// g_food_effect_table was DAT_00202a28: a per-food-type (indexed by the object id's low nibble)
// effect/quality byte table, loaded at runtime (read_file_handle) and read by use_food_item to
// decide a food item's flavor text and whether it's harmful.
 undefined1 DAT_00202a28_backing[256];
/* Was `uint` (4 bytes), truncating the real object pointer stored here (confirmed by its own
   assignments -- `DAT_00202098 = g_player_object;`/ `= param_1;` where param_1 is a real `ushort *`
   object pointer right next to a parallel `g_selected_object = (char *)param_1;` -- and its readers)... */
char *DAT_00202098;
/* Ghidra rendered the embedded space as an underscore, dropped the
   leading space and trailing newline. Real bytes at 0x878e0 (ARM
   UU.exe .data): " on what?\n". */
static char s_on_what__000878e0[] = " on what?\n";
/* Sizing pass sized this to 64 and marked its content "unrecovered" (read-only, `pcVar3 =
   &DAT_000878ec;`, copied into a 40-byte local acStack_34). */
static undefined1 DAT_000878ec_backing[64] = "Use ";
#define DAT_000878ec DAT_000878ec_backing[0]
/* Ghidra dropped the trailing space. Real bytes at 0x878f4 (ARM
   UU.exe .data): "That ". */
static char s_That_000878f4[] = "That ";
/* Ghidra rendered the embedded space as an underscore, dropped the
   leading space and trailing newline. Real bytes at 0x878fc (ARM
   UU.exe .data): " is locked.\n". */
static char s_is_locked__000878fc[] = " is locked.\n";






// was FUN_0003ff10 -- enters combat stance: readies the weapon in the player's hand (called from
// handle_object_drop_target when the weapon-hand paperdoll slot is clicked, via
// toggle_weapon_ready)...
void ready_weapon()

{
  undefined2 uVar1;
  byte bVar2;

  if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 2) && ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0)) {
    if ((g_cursor_mode == 1) || ((g_cursor_mode == 3 || (g_cursor_mode == 4)))) {
      pop_cursor_icon(3);
    }
    if (g_cursor_mode != 0) {
      /* Same dropped-argument bug as cursor_mode_button_click's sites. */
      mode_icon_highlight_off(g_cursor_mode);
    }
    /* Originally decompiled as `g_cursor_mode = 2`. An earlier session changed this to 5, reasoning
       that PTR_FUN_000858c8_table's (then-wrong) declared order put interact_attack at index 4
       (mode 5). */
    g_cursor_mode = 2;
    uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
    *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar1 | 2;
    *(char *)(DAT_00086df8 + 0x60) = (char)((ushort)uVar1 >> 8);
    set_hud_status_value(8,4);
    mode_icon_highlight_on((int)g_cursor_mode);
    bVar2 = get_current_music_track();
    if ((4 < bVar2) && (bVar2 = get_current_music_track(), bVar2 < 8)) {
      return;
    }
    set_pending_music_track(8);
  }
  return;
}



// was FUN_00040004 -- leaves combat stance: requests advance_action_animation_frame lower the
// weapon (DAT_0023c120 = 6, playing the raise animation in reverse over several ticks -- the
// "animation delay as you leave" -- before settling at idle state 6).
void unready_weapon()

{
  uint uVar1;

  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0) {
    set_hud_status_value(8,6);
    uVar1 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar1 >> 8);
    if (DAT_000868d8 == 0) {
      /* Un-highlight needs to name whichever mode ready_weapon actually
         highlighted -- 2 (Attack, see ready_weapon's own comment on why
         it's 2 and not 5). */
      mode_icon_highlight_off(2);
    }
    g_cursor_mode = 0;
    cancel_weapon_swing();
    pick_random_pending_music_track();
  }
  return;
}




// was FUN_00046a94
void attach_picked_up_object_to_cursor(ushort *object)
{
  int iVar1;
  short sVar2;
  short local_14;
  short local_12;
  short local_10 [2];
  
  g_selected_object = (char *)object;
  push_cursor_icon(*object & 0x1ff);
  poll_keyboard_char_input(&local_14);
  if ((local_14 != 0) && (wait_for_click_release(1), g_selected_object != (char *)0x0)) {
    get_mouse_position(local_10,&local_12);
    sVar2 = hit_test_inventory_widget((int)local_10[0],(int)local_12);
    iVar1 = (int)sVar2;
    if (0 < iVar1) {
      g_cursor_holding_state = 1;
      /* User QA report: "dragging and dropping into a paper doll slot does not show the item" --
         confirmed live (also reproduces for an ordinary backpack-grid drop under the same drag
         pattern, so this isn't slot-specific). */
      if (erase_cursor_icon() != 0) {
        DAT_00204844 = 0;
      }
      if ((g_active_hud_panel == '\0') || (iVar1 == 0x17)) {
        /* Widget 20 (the real "leave container" indicator) falls through to
           handle_object_drop_target below same as everywhere else -- see that function's own
           `iVar2==0x14` case for the drop/click logic this used to duplicate here as a... */
        if (iVar1 < 0x14) {
          handle_backpack_slot_click((int)(char)(&g_backpack_widget_to_slot)[iVar1]);
          if (g_selected_object == (char *)0x0) {
            g_cursor_holding_state = 0;
            pop_cursor_icon(3);
          }
        }
        else {
          /* Dropped argument -- every sibling call to handle_object_drop_target elsewhere in this
             file forwards the resolved widget id (see handle_inventory_panel_click's own two
             copies); this bare call left it uninitialized... */
          handle_object_drop_target(iVar1);
        }
      }
    }
  }
}




// was FUN_0004a69c
int drop_held_object_near_player(void *held_object_ptr, int force)
{
  uw_object_hdr_t *held_object = (uw_object_hdr_t *)held_object_ptr;
  byte bVar1;
  ushort uVar2;
  bool bVar3;
  int iVar4;
  uw_projectile_object_t *puVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  char cVar9;
  /* iVar4 is reused earlier in this function as a plain int (return codes from
     compute_drop_aim_from_cursor/check_object_placement_clearance) -- real uses, left alone -- but
     also held tilemap_lookup's real 64-bit pointer return, truncating it to 32 bits on this host. */
  char *pDropTile;
  ushort local_28;
  ushort local_26;
  
  DAT_00202a4c = (ushort)(g_player_object->npc_xhome);
  DAT_00202a50 = (short)(g_player_object->npc_yhome);
  if ((*(short *)(DAT_00085a6c + 8) == 1) && (iVar4 = compute_drop_aim_from_cursor(), iVar4 != 0)) {
    DAT_00202a54 = 1;
    DAT_00202a44 = g_player_object;
    DAT_00202a38 = held_object->object_id;
    DAT_00202a48 = 0xf;
    puVar5 = (uw_projectile_object_t *)spawn_object_near_player();
    if (puVar5 != (uw_projectile_object_t *)0x0) {
      uVar6 = (puVar5->hdr.type_flags ^ held_object->type_flags) & 0x7fff ^ (uint)held_object->type_flags;
      puVar5->hdr.is_quant = (uVar6 >> 15) & 1;
      uVar2 = held_object->link_word;
      bVar1 = (byte)uVar2;
      puVar5->hdr.link = uVar2 >> 6;
      bVar1 = (byte)(held_object->type_flags >> 8);
      puVar5->hdr.flags_res = (bVar1 >> 1) & 7;
      puVar5->hdr.enchanted = (bVar1 >> 4) & 1;
      puVar5->lifetime = held_object->quality;
      puVar5->hdr.owner = held_object->owner;
      bVar1 = (byte)(held_object->type_flags >> 8);
      puVar5->hdr.doordir = (bVar1 >> 5) & 0x1;
      if (((held_object->object_id & 0x1c0) != 0x140) && ((g_object_type_props[(held_object->object_id)].class_flags & 3) != 2)) {
        puVar5->original_heading = held_object->heading;
      }
      free_object_slot(held_object);
      held_object = (uw_object_hdr_t *)0x0;
    }
  }
  if (held_object != (uw_object_hdr_t *)0x0) {
    local_28 = (ushort)(g_player_object->hdr.xpos) + DAT_00202a4c * 8;
    local_26 = (short)(g_player_object->hdr.ypos) + DAT_00202a50 * 8;
    held_object->zpos = g_player_object->hdr.zpos;
    cVar9 = (g_object_type_props[(held_object->object_id)].collision_radius) + (g_object_type_props[(g_player_object->hdr.object_id)].collision_radius) + '\x01';
    project_position_by_heading((g_player_object->npc_heading) + ((g_player_object->hdr.heading << 7) >> 2),
                                cVar9,&local_28
                                ,&local_26);
    iVar4 = check_object_placement_clearance(held_object->object_id,0,(int)(short)local_28,(int)(short)local_26,
                         g_player_object->hdr.zpos,1,cVar9);
    if (iVar4 == 0) {
      bVar3 = true;
    }
    else {
      project_position_by_heading((g_player_object->npc_heading) + ((g_player_object->hdr.heading << 7) >> 2),
                                  3,&local_28,
                                  &local_26);
      iVar4 = check_object_placement_clearance(held_object->object_id,0,(int)(short)local_28,(int)(short)local_26,
                           g_player_object->hdr.zpos,1,
                           cVar9);
      bVar3 = true;
      if (iVar4 != 0) {
        bVar3 = false;
      }
    }
    iVar7 = (int)(short)local_28;
    iVar8 = (int)(short)local_26;
    pDropTile = (char *)tilemap_lookup(iVar7 >> 3,iVar8 >> 3);
    /* tilemap_lookup returns NULL for any tile coordinate outside 0-63 (see its own bounds check)
       -- confirmed live: dragging an item out of an open backpack slot and dropping it back into
       the 3D view crashed in object_list_append_tail(pDropTile+2, ...)... */
    if ((bVar3) || (pDropTile == NULL)) {
      if (force != 0) {
        print_scroll_message_by_id(0xfd);
      }
      play_sound_effect_with_pan(0xf,0x40,0xf6);
      return 0;
    }
    uVar2 = held_object->position_word;
    held_object->xpos = local_28 & 7;
    held_object->ypos = local_26 & 7;
    DEBUG(INFO, "[drop] object id=0x%03x landed at tile=(%d,%d)\n",
          (unsigned)(held_object->object_id), iVar7 >> 3, iVar8 >> 3);
    object_list_append_tail((byte *)(pDropTile + 2),held_object);
    uVar2 = held_object->type_flags;
    if ((((uVar2 & 0x1f0) == 0x90) && (3 < (uVar2 & 0xf))) && ((uVar2 & 0xf) < 7)) {
      bVar1 = (byte)uVar2;
      held_object->object_id = (uVar2 & 0x1ff) - 4;
      set_ambient_bias_without_light(0);
    }
    /* Preserve the original placement path; moving objects settle during
       mobile_object_tick, rather than being grounded synchronously here. */
    settle_dropped_object(held_object,iVar7 >> 3,iVar8 >> 3,1);
  }
  return 1;
}




// was FUN_000523d0
/* Was `void`, discarding place_object_in_world's own tail-call return value (a real 0/1 "did it
   place" result -- see that function's own comment) -- real ARM calling convention leaves a leaf
   tail call's return value in r0 for THIS function's own caller... */
/* param_2 was `undefined4` -- a real object pointer forwarded straight into
   place_object_in_world's own (now char*) param_4, truncated to 32 bits on this host. */
int drop_object_near_target(void *actor_ptr, void *object_ptr, short mode, uint flags)
{
  char *actor = (char *)actor_ptr;
  char *object = (char *)object_ptr;
  ushort uVar1;

  uVar1 = *(ushort *)(actor + 2);
  return place_object_in_world((*(ushort *)(actor + 0x16) >> 7 & 0x1f8) + (uVar1 >> 0xd),
               (*(ushort *)(actor + 0x16) >> 1 & 0x1f8) + ((uVar1 & 0x1c00) >> 10),uVar1 & 0x7f,
               object,mode,flags);
}




// was FUN_0007a990
void use_light_source(ushort *object, int turn_on)
{
  uw_object_hdr_t *header = (uw_object_hdr_t *)object;
  int iVar3;
  ushort uVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *puVar7;
  int iVar8;
  int extraout_r3;
  int iVar9;
  ushort uVar10;
  
  if ((header->is_quant == 0) || (header->link >= 512)) {
    uVar10 = 1;
  }
  else {
    uVar10 = header->link;
  }
  if (turn_on == 0) {
    uVar5 = 0x7b;
  }
  else {
    if (header->quality != 0) {
      iVar6 = find_or_assign_object_widget(object);
      iVar8 = 0;
      do {
        if (((int)(short)iVar6 == (int)(char)(&g_light_source_slots)[iVar8]) && (uVar10 == 1)) break;
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      } while (iVar8 < 4);
      if ((short)iVar8 == 4) {
        uVar4 = header->object_id;
        if ((((uVar4 == 0x91) || (uVar4 == 0x92)) || (uVar4 == 0x90)) || (uVar4 == 0x93)) {
          iVar8 = 5;
          iVar6 = 0;
          do {
            puVar7 = (ushort *)get_equipped_item_at_slot(iVar8);
            iVar9 = extraout_r3;
            if (puVar7 == (ushort *)0x0) {
              iVar9 = iVar6 << 0x10;
            }
            iVar3 = iVar8;
          } while ((((puVar7 == (ushort *)0x0 && iVar9 >> 0x10 == 0) ||
                    (iVar3 = iVar6, puVar7 != object)) || (iVar6 = iVar8, uVar10 != 1)) &&
                  (iVar6 = iVar3, iVar8 = iVar8 + 1, iVar8 * 0x10000 >> 0x10 < 9));
          if ((short)iVar6 == 0) {
            uVar5 = 0xf6;
            goto LAB_0007ab1c;
          }
          decrement_object_count(object);
          place_object_in_backpack_slot(object,iVar6);
          redraw_container_icon_slot();
        }
      }
      uVar10 = header->object_id;
      if ((uVar10 & 0xf) < 4) {
        header->object_id = uVar10 + 4;
        /* HACK: pass the lit light's real brightness (see set_ambient_bias_with_light). */
        g_scratch_object_ptr = (uw_object_hdr_t *)object;
        set_ambient_bias_with_light(((uw_light_type_props_t *)get_scanned_object_class_effect_ptr())->brightness);
      }
      else {
        header->object_id = uVar10 - 4;
        set_ambient_bias_without_light(0);
      }
      refresh_player_equipment_effects();
      redraw_backpack_slot_widget(iVar6);
      return;
    }
    uVar5 = 0x7c;
  }
LAB_0007ab1c:
  print_scroll_message_by_id(uVar5);
}




// was FUN_0007acd4
int use_food_item(void *actor_ptr, ushort *object, int consume)
{
  char *actor = (char *)actor_ptr;
  int iVar1;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  ushort *puVar7;
  uint uVar8;
  ushort uVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  bool bVar13;
  undefined2 uVar14;
  /* Was 76 bytes with a separate 555248-byte `acStackY_87970` "prefix" buffer that a copy loop
     wrote "That " into -- but the very next lines (ce_strlen/build_object_display_name) read and
     append to acStack_7c, which never got that prefix... */
  char acStack_7c [256];
  
  iVar11 = 0;
  iVar12 = 0xff;
  uVar8 = (uint)*object;
  if (((*object & 0x8000) == 0) || ((object[3] & 0x8000) != 0)) {
    uVar9 = 1;
  }
  else {
    uVar9 = object[3] >> 6;
  }
  if ((char *)object == g_selected_object) {
    if (1 < uVar9) {
      print_scroll_message_by_id(0x77);
      return 0xfffffffe;
    }
  }
  else if (consume == 0) {
    return 0xfffffffe;
  }
  uVar10 = uVar8 & 0x1f0;
  bVar13 = uVar10 == 0xb0;
  puVar7 = (ushort *)g_selected_object;
  if (bVar13) {
    puVar7 = (ushort *)&g_food_effect_table;
    uVar10 = uVar8 & 0xf;
  }
  uVar8 = uVar8 & 0x1ff;
  if (bVar13) {
    /* Was `(int)puVar7` -- round-tripping a real pointer (&g_food_effect_table, a static global
       whose real address can be anywhere in this 64-bit process, not just the low 32 bits) through
       a 32-bit int truncates it before the offset is even added back... */
    iVar12 = (int)*(byte *)((char *)puVar7 + uVar10);
  }
  if (uVar8 < 0xbf) {
    if (uVar8 == 0xbe) {
LAB_0007ae18:
      iVar11 = iVar11 + 1;
LAB_0007ae1c:
      iVar11 = iVar11 + 0xed;
    }
    else {
      if (uVar8 != 0x92) {
        if (uVar8 == 0xb8) {
          sVar4 = roll_skill_check(*(undefined1 *)(DAT_0023be74 + 7),0x14);
          if (sVar4 != 0) {
            iVar11 = rand_below(3);
            adjust_level7_hazard_value(g_player_object,iVar11 * -0x1000000 >> 0x18);
          }
          uVar9 = *(ushort *)(DAT_00086df8 + 0x61);
          if ((uVar9 & 0xc) < 0xc) {
            bVar3 = (byte)uVar9;
            *(byte *)(DAT_00086df8 + 0x61) = ((bVar3 & 0xfc) + 4 ^ bVar3) & 0xc ^ bVar3;
            *(char *)(DAT_00086df8 + 0x62) = (char)(uVar9 >> 8);
          }
          refresh_player_equipment_effects();
          iVar11 = 1;
        }
        else if (uVar8 != 0xb9) {
          if (uVar8 == 0xba) {
LAB_0007ae14:
            iVar11 = iVar11 + 1;
            goto LAB_0007ae18;
          }
          if (uVar8 < 0xbb) {
LAB_0007aefc:
            if ((short)iVar12 == 0xff) {
              return 0xffffffff;
            }
            goto LAB_0007af3c;
          }
          if (uVar8 < 0xbd) {
            iVar11 = 1;
            goto LAB_0007ae14;
          }
          if (uVar8 != 0xbd) goto LAB_0007aefc;
          goto LAB_0007ae1c;
        }
        iVar11 = iVar11 + 1;
      }
      iVar11 = iVar11 + 1;
LAB_0007aeb4:
      iVar11 = iVar11 + 0xe5;
    }
    goto LAB_0007af3c;
  }
  if (uVar8 == 0xbf) {
    uVar5 = 0x7f;
    goto LAB_0007b2e0;
  }
  if (uVar8 == 0xce) {
    iVar11 = 0xec;
LAB_0007af38:
    iVar12 = 4;
  }
  else if (uVar8 == 0xcf) {
    iVar11 = 0xe9;
    iVar12 = 0x17;
  }
  else {
    if (uVar8 == 0xd9) {
      iVar11 = 0xea;
      goto LAB_0007af38;
    }
    if (uVar8 != 0x11b) {
      if (uVar8 != 0x125) goto LAB_0007aefc;
      goto LAB_0007aeb4;
    }
    iVar11 = 0xeb;
    iVar12 = 0x40;
  }
LAB_0007af3c:
  iVar1 = (int)(short)iVar12;
  if (iVar1 < 1) {
    if (iVar1 < 0) {
      print_scroll_message_by_id(iVar11);
      if ((iVar1 < -1) && (-0x7f < iVar1)) {
        uVar9 = *(ushort *)(DAT_00086df8 + 0x61);
        if ((int)((uVar9 >> 4 & 0x3f) - iVar1) < 0x40) {
          uVar9 = ((uVar9 & 0xfff0) + (short)iVar12 * -0x10 ^ uVar9) & 0x3f0 ^ uVar9;
        }
        else {
          uVar9 = uVar9 | 0x3f0;
        }
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar9;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar9 >> 8);
        sVar4 = roll_skill_check(*(undefined1 *)(DAT_0023be74 + 5),
                             (*(ushort *)(DAT_00086df8 + 0x61) & 0x3f0) >> 4);
        if (sVar4 == -1) {
          print_scroll_message_by_id(0xf1);
          handle_rest_action(-2);
          if ((char)g_player_object->npc_hp == '\0') goto LAB_0007b254;
          print_scroll_message_by_id(0xf3);
          uVar8 = ordint_divmod(6,*(ushort *)(DAT_00086df8 + 0x61) >> 4 & 0x3f).quot;
          uVar8 = (uVar8 & 0xff) + 10;
        }
        else {
          if (sVar4 != 0) {
            if (sVar4 == 2) {
              print_scroll_message_by_id(0xf2);
              adjust_player_hp(g_player_object,-2);
            }
            goto LAB_0007b254;
          }
          uVar8 = ordint_divmod(6,*(ushort *)(DAT_00086df8 + 0x61) >> 4 & 0x3f).quot;
          uVar8 = uVar8 & 0xff;
        }
        set_movement_animation_timer(0x40,uVar8);
      }
    }
    else {
      print_scroll_message_by_id(iVar11);
    }
  }
  else {
    if ((iVar1 != 0xff) && (iVar12 = adjust_player_hunger(iVar12), iVar12 == 0)) {
      uVar5 = 0x7e;
LAB_0007b2e0:
      print_scroll_message_by_id(uVar5);
      return 0;
    }
    if ((short)iVar11 == 0) {
      acStack_7c[0] = '\0';
      ce_strcat(acStack_7c, s_That_000878f4);
      iVar11 = ce_strlen(acStack_7c);
      sVar4 = build_object_display_name(acStack_7c + iVar11,object,0,0);
      if (sVar4 == 0) {
        ce_strcat(acStack_7c,s_UNNAMED_00084f24);
      }
      iVar11 = rand_below(0x14);
      iVar11 = ((byte)object[2] & 0x3f) + iVar11;
      if (iVar11 < 0) {
        iVar11 = iVar11 + 0xf;
      }
      iVar11 = (int)(short)(iVar11 >> 4);
      if (4 < iVar11) {
        iVar11 = 4;
      }
      message_scroll_print_wrapped(acStack_7c);
      iVar11 = iVar11 + 0xac;
    }
    print_scroll_message_by_id(iVar11);
    if ((*object & 0x1ff) == 0xb9) {
      uVar9 = *(ushort *)(DAT_00086df8 + 0x5f);
      if ((uVar9 & 0x3c) < 0x10) {
        uVar9 = uVar9 & 0xffd3 | 0x10;
      }
      else {
        if (0x33 < (uVar9 & 0x3c)) goto LAB_0007b254;
        uVar9 = ((uVar9 & 0xfc) + 8 ^ uVar9) & 0x3c ^ uVar9;
      }
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar9;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar9 >> 8);
    }
  }
LAB_0007b254:
  uVar14 = 0;
  trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,actor,object,1);
  trigger_object_trap_or_use_action(actor,object,4,(int)DAT_002020a0,CONCAT22(uVar14,DAT_002020a4));
  iVar11 = finish_object_use(object,consume,1);
  if ((iVar11 != 0) && (g_cursor_holding_state == 1)) {
    g_selected_object = (char *)0x0;
  }
  return 1;
}




// was FUN_0007c93c
/* Was `int param_1; undefined4 param_2;` -- both real object pointers (matching
   check_object_combination's own param_1/param_2 types, forwarded to it unchanged just below),
   truncated to 32 bits on this 64-bit host. */
void try_combine_or_stow_object(void *actor_ptr, ushort *object, int stow)
{
  char *actor = (char *)actor_ptr;
  char *wptr_60073;
  char cVar1;
  short sVar2;
  char *pcVar3;
  /* Was 544548 bytes -- same Ghidra stack-frame-size-miscalculation artifact already fixed twice
     this session (check_object_fits_in_slot, dispatch_object_action): a scratch copy of the short
     "UNNAMED" string that's never read back afterward. */
  char acStack_84f48 [64];
  char acStack_24 [20];
  
  sVar2 = check_object_combination(actor,object,0);
  if (sVar2 == 0) {
    sVar2 = build_object_display_name(acStack_24,object,0,0);
    if (sVar2 == 0) {
      pcVar3 = s_UNNAMED_00084f24;
    wptr_60073 = acStack_84f48;
      do {
        cVar1 = *pcVar3;
        *wptr_60073 = cVar1; wptr_60073 = wptr_60073 + 1;
        pcVar3 = pcVar3 + 1;
      } while (cVar1 != '\0');
    }
    message_scroll_print_wrapped(&DAT_00085c88);
    message_scroll_print_wrapped(acStack_24);
    message_scroll_print_wrapped(s_is_locked__000878fc);
  }
  else if (stow == 0) {
    try_empty_container(object,(ushort *)actor == g_player_object);
  }
  else {
    /* Both calls here were bare (no arguments) -- see find_or_assign_object_widget's own fix
       comment and open_backpack_container's declared `short actor`.
       find_or_assign_object_widget(object) finds (or allocates) the grid widget currently... */
    int _widget = find_or_assign_object_widget(object);
    if (-1 < _widget) {
      open_backpack_container(_widget);
    }
  }
}






// was FUN_00079984
/* Was `int param_1` -- every call site passes a real object pointer (g_player_object, the player
   object, at most sites), truncating it to 32 bits on this 64-bit host. Same class as
   handle_object_drop_target's `iVar2` fix just above this function's own callers. */
ushort *use_object_on_target(ushort *actor, ushort *used_object, int flag)
{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  undefined2 *puVar5;
  ushort *puVar6;
  uint uVar7;
  undefined4 in_stack_ffffffe4;
  undefined2 uVar8;
  
  uVar8 = (undefined2)((uint)in_stack_ffffffe4 >> 0x10);
  uVar2 = *used_object;
  uVar7 = (uint)uVar2;
  if (*(short *)(DAT_00085a6c + 8) == 4) {
    if ((uVar7 & 0x1c0) != 0x80) {
      return used_object;
    }
    if ((uVar2 & 0x30) != 0) {
      return used_object;
    }
  }
  uVar3 = uVar2 >> 6 & 7;
  uVar1 = (ushort)((uVar7 & 0x30) >> 4);
  if ((uVar2 >> 6 & 7) == 0) {
    if (((uVar1 == 1) && (flag == 0)) && (actor != 0)) {
      apply_trap_type_damage_effect(used_object,actor);
    }
  }
  else if (uVar3 == 2) {
    if (uVar1 == 0) {
      try_combine_or_stow_object(actor,used_object,flag);
    }
    else if (uVar1 == 1) {
      if (7 < (uVar7 & 0xf)) {
        refuel_light_source_item(used_object,flag);
        return used_object;
      }
      /* Dropped arguments: use_light_source (light/extinguish a light source) declares two params
         it dereferences immediately, but was called bare here -- leftover ARM register garbage
         stood in for the real torch object and mode. */
      use_light_source(used_object,flag);
    }
    else if (uVar1 == 3) {
      use_food_item(actor,used_object,flag);
      return used_object;
    }
  }
  else if (uVar3 == 3) {
    if (uVar1 < 2) {
      arm_use_item_on_target_prompt(used_object,flag);
    }
    else if (((uVar1 == 2) && ((uVar7 & 0x1ff) == 0xe7)) && (flag != 0)) {
      prompt_use_item_on_target(used_object,complete_use_item_on_flagged_tile);
    }
  }
  else {
    if (uVar3 == 4) {
      if (uVar1 == 0) {
        arm_use_item_on_player_prompt(used_object,flag);
        goto LAB_00079cb8;
      }
      if (uVar1 == 1) {
        dispatch_use_held_item_by_type(actor,used_object,flag);
        goto LAB_00079cb8;
      }
      puVar6 = used_object;
      if (uVar1 != 2) {
        if (uVar1 == 3) {
          use_readable_item(used_object,flag);
          return used_object;
        }
        goto LAB_00079cb8;
      }
    }
    else {
      if (uVar3 == 5) {
        dispatch_world_object_interaction_by_family(actor,used_object);
        goto LAB_00079cb8;
      }
      if (uVar3 != 7) goto LAB_00079cb8;
      uVar7 = uVar7 & 0xf;
      if (uVar7 != 9) {
        if (uVar7 == 10) {
          iVar4 = finish_object_use(used_object,flag,1);
          if (iVar4 != 0) {
            print_scroll_message_by_id(9);
            puVar5 = (undefined2 *)begin_holding_object_on_cursor(0,0x122);
            *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
            uVar8 = *puVar5;
            *(char *)puVar5 = (char)uVar8;
            *(byte *)((char *)puVar5 + 1) = (byte)((ushort)uVar8 >> 8) | 0x20;
            return (ushort *)0x0;
          }
        }
        else if (uVar7 == 0xf) {
          if (((byte)used_object[3] & 0xf) < 8) {
            open_door_object(used_object);
          }
          else {
            close_door_object(actor,used_object);
          }
        }
        goto LAB_00079cb8;
      }
      if (((used_object[2] & 0xffc0) == 0) ||
         (puVar6 = (ushort *)resolve_object_link(used_object + 2), (*puVar6 & 0x1ff) != 0x12e)) goto LAB_00079cb8;
    }
    dispatch_use_special_item_by_type(actor,puVar6,flag);
  }
LAB_00079cb8:
  trigger_object_trap_or_use_action(actor,used_object,4,(int)DAT_002020a0,CONCAT22(uVar8,DAT_002020a4));
  trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,actor,used_object,flag);
  return used_object;
}



// was FUN_00079d08
/* Was `undefined4 param_1` -- a real object-record pointer (forwarded to
   decrement_object_count/discard_misplaced_object, which both dereference it), truncated to 32
   bits on this host -- same class as many other fixes this session. */
bool finish_object_use(void *used_object_ptr, int consume, int force_discard)
{
  ushort *used_object = (ushort *)used_object_ptr;
  short sVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's/discard_misplaced_object's real `void *`/`ushort *`
   returns; only ever compared to 0 (find_object_by_encoded_slot_in_chain's plain int return also
   lands here, but is likewise only ever compared to 0, so char* is safe) */
  undefined4 uVar3;
  ushort local_14 [2];

  if (consume == 0) {
    iVar2 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
    uVar3 = encode_object_slot_index(used_object);
    iVar2 = (char *)(intptr_t)find_object_by_encoded_slot_in_chain(iVar2 + 2,1,uVar3);
    if (iVar2 == 0) {
      sVar1 = encode_object_slot_index(used_object);
      local_14[0] = local_14[0] & 0x3f | sVar1 << 6;
      free_linked_object_recursive(local_14);
      iVar2 = 0;
    }
    else {
      iVar2 = (char *)discard_misplaced_object(DAT_002046b4,used_object,force_discard);
      set_pending_update_flags(2);
    }
  }
  else {
    /* Dropped argument: decrement_object_count declares one param (the object)
       and forwards it on -- called bare here, same idiom as its own
       fix. */
    decrement_object_count(used_object);
    iVar2 = (char *)discard_misplaced_object(0,used_object,force_discard);
  }
  return iVar2 == 0;
}





// was FUN_00079dec -- begins holding an object on the cursor for a deferred "use on target"
// interaction, but only if nothing is already selected (g_selected_object == 0; otherwise a no-op
// returning NULL). param_1 is an existing object to hold...
short *begin_holding_object_on_cursor(short *object, uint object_type)
{
  if (g_selected_object == (char *)0x0) {
    if (object == (short *)0x0) {
      object = (short *)spawn_new_object(object_type,0);
    }
    else {
      object_type = (int)((uw_object_hdr_t *)object)->object_id;
    }
    g_cursor_holding_state = 1;
    g_selected_object = (char *)object;
    push_cursor_icon(object_type);
  }
  else {
    object = (short *)0x0;
  }
  return object;
}





// was FUN_00079e64 -- deferred-target-click completion callback for item type 0x101 specifically
// (armed by arm_use_item_on_player_ prompt below): clears the pending-target UI state, then checks
// whether the held item (param_1) combines with the player...
void complete_use_reagent_on_player(ushort *target, int clicked)
{
  short sVar1;
  undefined4 uVar2;

  if (clicked != 0) {
    pop_cursor_icon(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
    sVar1 = check_object_combination(g_player_object,target,
                         (int)((uint)*(byte *)(DAT_00086df8 + 0x31) * -0x10000) >> 0x10);
    if (sVar1 == 0) {
      uVar2 = 0x78;
    }
    else if (sVar1 == 1) {
      uVar2 = 3;
    }
    else if (sVar1 == 4) {
      uVar2 = 0x7a;
    }
    else {
      play_sound_effect_with_pan(0x13,0x40,0);
      uVar2 = 0x79;
    }
    print_scroll_message_by_id(uVar2);
  }
}



// was FUN_00079f1c -- deferred-target-click completion callback for item types 0x102-0x10e (armed
// by arm_use_item_on_player_prompt below): the general case, combining the held item with the
// player using the held item's own quality field...
void complete_use_item_on_player(ushort *target, int clicked)
{
  int iVar1;

  if (clicked != 0) {
    pop_cursor_icon(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
    iVar1 = check_object_combination(g_player_object,target,*(ushort *)(DAT_00202098 + 6) & 0x3f);
    print_scroll_message_by_id(iVar1 + 2);
  }
}



// was FUN_00079f90 -- arms the "use item on target" prompt for a held item whose type falls in
// 0x101-0x10e: picks complete_use_reagent_on_player for the specific type 0x101, or
// complete_use_item_on_player for 0x102-0x10e...
void arm_use_item_on_player_prompt(ushort *item, int confirmed)
{
  code *pcVar1;

  if (confirmed != 0) {
    if ((*item & 0x1ff) == 0x101) {
      pcVar1 = complete_use_reagent_on_player;
    }
    else {
      if (0x10e < (*item & 0x1ff)) {
        return;
      }
      pcVar1 = complete_use_item_on_player;
    }
    prompt_use_item_on_target(item,pcVar1);
  }
}



// was FUN_00079ff0 -- the general "use item on target" prompt setup: builds and prints "<item's
// display name> -- use it on what?" via build_object_display_name, then prompts the player to click
// a target (push_cursor_icon) and arms the deferred-target-click state...
void prompt_use_item_on_target(ushort *item, void (*completion)())
{
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  char acStack_34 [40];
  
  pcVar3 = &DAT_000878ec;
  /* ARM 0x7a000..0x7a020 copies the prefix into the same 40-byte buffer. */
  char *wptr_58645 = acStack_34;
  do {
    cVar1 = *pcVar3;
    *wptr_58645 = cVar1; wptr_58645 = wptr_58645 + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar4 = ce_strlen(acStack_34);
  sVar2 = build_object_display_name(acStack_34 + iVar4,item,0,0);
  if (sVar2 == 0) {
    ce_strcat(acStack_34,s_UNNAMED_00084f24);
  }
  ce_strcat(acStack_34,s_on_what__000878e0);
  message_scroll_print_wrapped(acStack_34);
  push_cursor_icon(*item & 0x1ff);
  g_selected_object = (char *)item;
  g_cursor_holding_state = 2;
  DAT_00202098 = (char *)item;
  /* ARM 0x79ffc/0x7a004/0x7a0a4 preserves and stores the callback pointer. */
  DAT_002020b8 = completion;
}





// was FUN_0007a0cc -- deferred-target-click completion callback for a use-item interaction
// restricted to target types 0x140-0x147: prints a "no effect" message (id 0x80) if the clicked
// target isn't in that range; otherwise prints a success message (id 0x81)...
void complete_use_item_on_special_target(ushort *target)
{
  ushort uVar1;
  
  if (((*target & 0x1ff) < 0x140) || (0x147 < (*target & 0x1ff))) {
    print_scroll_message_by_id(0x80);
  }
  else {
    print_scroll_message_by_id(0x81);
    uVar1 = target[3];
    *(byte *)(target + 3) = (byte)uVar1 | 0x3f;
    *(char *)((char *)target + 7) = (char)(uVar1 >> 8);
    finish_object_use(DAT_00202098,1,1);
  }
  pop_cursor_icon(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
}



// was FUN_0007a180 -- arms the "use item on target" prompt with
// complete_use_item_on_special_target as the completion callback. No
// callers found by grep in the remaining decompile.
void arm_use_item_on_special_target_prompt(ushort *item, int confirmed)
{
  if (confirmed != 0) {
    prompt_use_item_on_target(item,complete_use_item_on_special_target);
  }
}





// was FUN_0007a198 -- deferred-target-click completion callback for a single specific quest
// interaction: requires the clicked target to be object type 0x165 and the held item's quality to
// be exactly 0x3e...
void complete_use_item_on_quest_target(ushort *target, int consume)
{
  undefined2 uVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's/resolve_object_link's
                   real `void *` returns */
  undefined4 uVar3;
  undefined2 local_2c [5];
  ushort local_21;
  byte local_1e;
  undefined1 local_12;
  
  pop_cursor_icon(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((*target & 0x1ff) == 0x165) {
    if ((*(byte *)(DAT_00202098 + 6) & 0x3f) == 0x3e) {
      if ((((*target & 0x8000) == 0) || ((target[3] & 0x8000) == 0)) ||
         ((target[3] & 0x7fc0) != 0x840)) {
        uVar3 = 0x103;
        goto LAB_0007a38c;
      }
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar1;
      *(byte *)(DAT_00086df8 + 0x62) = (byte)((ushort)uVar1 >> 8) | 4;
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x61);
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar1;
      *(byte *)(DAT_00086df8 + 0x62) = (byte)((ushort)uVar1 >> 8) | 8;
      *(byte *)(target + 3) = (byte)target[3] & 0x3f | 0x80;
      *(undefined1 *)((char *)target + 7) = 0x88;
      local_2c[0] = 0x7e;
      local_21 = local_21 & 0xfff7 | 7;
      local_1e = local_1e | 0xc0;
      local_12 = 0x1b;
      attempt_talk_interaction(local_2c);
      iVar2 = (char *)tilemap_lookup(0x36,0x34);
      iVar2 = (char *)resolve_object_link(iVar2 + 2);
      if (iVar2 != 0) {
        resolve_skill_gated_unlock_or_use(g_player_object,0,iVar2,0);
      }
    }
    else {
      print_scroll_message_by_id(0x86);
    }
    finish_object_use(DAT_00202098,consume,1);
  }
  else {
    uVar3 = 0x84;
LAB_0007a38c:
    print_scroll_message_by_id(uVar3);
  }
}





// was FUN_0007a3a8 -- deferred-target-click completion callback: resets DAT_0023bc94 and refreshes
// equipment effects, then if the clicked target is a container-class object (type class 0x1f0==
// 0x170)...
void complete_use_item_on_container(ushort *target)
{
  DAT_0023bc94 = 0;
  refresh_player_equipment_effects();
  if ((*target & 0x1f0) == 0x170) {
    print_scroll_message_by_id(0x9d);
    use_object_on_target(g_player_object,target,0);
  }
  else {
    print_scroll_message_by_id(0x9e);
  }
}





// was FUN_0007a418 -- deferred-target-click completion callback, gated on both param_2 and param_3
// being nonzero: resets the click-target UI state, then runs use_lockpick_on_object...
void complete_use_item_skill_check(ushort *target, int clicked, int confirmed)
{
  if ((clicked != 0) && (confirmed != 0)) {
    pop_cursor_icon(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
    use_lockpick_on_object(target,*(undefined1 *)(DAT_00086df8 + 0x2f),1);
  }
}





// was FUN_0007a478 -- item-type dispatcher for use_object_on_target's class-3 branch: types
// 0xc2-0xc6 arm complete_use_item_on_quest_target (the one-off scripted puzzle); 0xd7 arms
// complete_use_item_skill_check; 0xd8 sets DAT_0023bc94 and arms complete_use_item_on_container...
void arm_use_item_on_target_prompt(ushort *item, int confirmed)
{
  ushort uVar1;
  code *pcVar2;
  
  uVar1 = *item & 0x1ff;
  if ((uVar1 < 0xc2) || (0xc6 < uVar1)) {
    if (uVar1 == 0xd7) {
      pcVar2 = complete_use_item_skill_check;
    }
    else {
      if (uVar1 != 0xd8) {
        if (confirmed == 0) {
          return;
        }
        if (((uVar1 != 0xd9) && (uVar1 != 0xce)) && (uVar1 != 0xcf)) {
          return;
        }
        use_food_item(g_player_object,item,confirmed);
        return;
      }
      DAT_0023bc94 = 1;
      refresh_player_equipment_effects();
      pcVar2 = complete_use_item_on_container;
    }
  }
  else {
    if (confirmed == 0) {
      return;
    }
    pcVar2 = complete_use_item_on_quest_target;
  }
  prompt_use_item_on_target(item,pcVar2);
}





// was FUN_0007a53c -- for_each_object_of_type callback (see that function's own callback contract):
// rolls a random value 0..param_2 against the matched object's own byte at offset +8, adds 1 to
// that byte, and sets a flag bit at offset +0xe (bit 1).
int apply_random_roll_to_matched_object(char *object, short max_roll)
{
  char cVar1;
  
  cVar1 = ordint_divmod((int)max_roll,*(undefined1 *)(object + 8)).quot;
  *(char *)(object + 8) = cVar1 + '\x01';
  *(undefined1 *)(object + 0xd) = *(undefined1 *)(object + 0xd);
  *(byte *)(object + 0xe) = *(byte *)(object + 0xe) | 2;
  return 0;
}



// was FUN_0007a598 -- deferred-target-click completion callback for a single, major scripted quest
// event: only fires for target item type 0x117.
void complete_use_item_special_quest_event(ushort *target, int confirmed, int unused)
{
  undefined2 uVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  if ((*target & 0x1ff) == 0x117) {
    print_scroll_message_by_id(0x85);
    if (confirmed != 0) {
      finish_object_use(DAT_00202098,confirmed,1);
    }
    spawn_scheduled_effect_object(target,4,5,0,0,DAT_002020a0,DAT_002020a4);
    iVar2 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
    discard_misplaced_object(iVar2 + 2,target,1);
    DAT_002020a0 = -1;
    uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
    *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar1 >> 8) | 0x20;
    *(undefined1 *)(DAT_00086df8 + 0x38) = *(undefined1 *)(DAT_00086df8 + 0xb0);
    *(undefined1 *)(DAT_00086df8 + 0x37) = *(undefined1 *)(DAT_00086df8 + 0xb0);
    for_each_object_of_type(0xe7,0,2,(int (*)())apply_random_roll_to_matched_object);
  }
  else if (confirmed != 0) {
    print_scroll_message_by_id(0x84);
  }
  if (g_selected_object != 0) {
    pop_cursor_icon(3);
    g_selected_object = 0;
    g_cursor_holding_state = 0;
  }
}





// was FUN_0007a704 -- deferred-target-click completion callback: only fires for target type 0x16e
// whose quality-indexed tile-flag lookup (DAT_0023add0) equals 0xb; on that match, consumes the
// held item and triggers an effect...
void complete_use_item_on_flagged_tile(ushort *target, int consume)
{
  pop_cursor_icon(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if (((*target & 0x1ff) == 0x16e) && (((&DAT_0023add0)[(byte)target[3] & 0x3f] & 0xff) == 0xb)) {
    finish_object_use(DAT_00202098,consume,1);
    trigger_object_trap_or_use_action(g_player_object,target,7,(int)DAT_002020a0,DAT_002020a4);
    return;
  }
  print_scroll_message_by_id(0x84);
}



// was FUN_0007a7fc -- dispatches by the HELD item's own type (not the target's): type 0x112 either
// directly triggers complete_use_item_special_quest_event...
void dispatch_use_held_item_by_type(ushort *target, ushort *item, int confirmed)
{
  int uw_ord2005_rem_167 = 0;
  byte bVar1;
  undefined4 uVar2;
  ushort uVar3;
  short extraout_r1;
  int iVar4;
  
  uVar3 = *item & 0x1ff;
  if (uVar3 == 0x112) {
    if (confirmed == 0) {
      DAT_00202098 = (char *)item;
      complete_use_item_special_quest_event(target,0,0);
    }
    else {
      prompt_use_item_on_target(item,complete_use_item_special_quest_event);
    }
  }
  else if (uVar3 == 0x114) {
    if (confirmed != 0) {
      trigger_exploding_book_trap();
    }
  }
  else if (uVar3 == 0x115) {
    uVar2 = ce_rand();
    uw_ord2005_rem_167 = ((int)(uVar2)) % (3);
    iVar4 = (int)uw_ord2005_rem_167;
    uVar3 = *(ushort *)(DAT_00086df8 + 0x61);
    if ((uVar3 & 3) < 3) {
      bVar1 = (byte)uVar3;
      *(byte *)(DAT_00086df8 + 0x61) = (bVar1 + 1 ^ bVar1) & 3 ^ bVar1;
      *(char *)(DAT_00086df8 + 0x62) = (char)(uVar3 >> 8);
      iVar4 = 3 - (*(byte *)(DAT_00086df8 + 0x61) & 3);
    }
    display_book_or_scroll_page(iVar4 + 0xb);
    uVar3 = *item;
    *(undefined1 *)item = 0xd5;
    *(byte *)((char *)item + 1) = (byte)(uVar3 >> 8) & 0xfe;
    if (confirmed == 0) {
      set_pending_update_flags(2);
    }
    else {
      redraw_container_icon_slot();
    }
  }
  else if (uVar3 == 0x11b) {
    use_food_item(target,item,confirmed);
  }
}





// was FUN_0007abbc -- refuels a light source item (torch/lamp): gated on the item's low nibble
// being outside 0xc-0xf (a "not already refueled" state check) and its "already used" flag (offset
// +1 bit 0x80) being clear.
void refuel_light_source_item(void *item_ptr, uint refuel)
{
  byte *item = (byte *)item_ptr;
  undefined2 uVar1;
  byte bVar2;
  void *iVar3;
  byte *local_1c;
  
  if ((refuel != 0) && (((*item & 0xf) < 0xc || (0xf < (*item & 0xf))))) {
    trigger_object_trap_or_use_action(g_player_object,item,4,(int)DAT_002020a0,DAT_002020a4);
    trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,g_player_object,item,refuel);
    if ((item[1] & 0x80) == 0) {
      local_1c = item + 6;
      iVar3 = find_object_in_chain(&local_1c,0,4,2,refuel & 0xffff0000);
      if (iVar3 == 0) {
        uVar1 = *(undefined2 *)item;
        bVar2 = (byte)uVar1;
        *item = (bVar2 + 4 ^ bVar2) & 0xf ^ bVar2;
        item[1] = (byte)((ushort)uVar1 >> 8);
        print_scroll_message_by_id(0x7d);
        redraw_backpack_slot_widget(find_or_assign_object_widget(item));  /* r0 passthrough, ARM 0x7acb8-0x7acbc */
      }
    }
  }
}





// was FUN_0007b2f0 -- deferred-target-click completion callback, gated on param_2 != 0 && param_3
// == 0 and the used item not already being held by the player: for target types 0x153-0x156, clones
// the item 1-2 times (each clone's type id nudged by a random die roll toward 0x156)...
void complete_use_item_scatter_spawn(short *target, int clicked, int confirmed)
{
  int uw_ord2005_rem_168 = 0;
  undefined1 uVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *found_item;
  char *iVar7;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  uw_object_hdr_t *puVar8;
  uint uVar9;
  uint uVar10;
  uint extraout_r1;
  uint uVar11;

  pop_cursor_icon(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((clicked != 0) && (confirmed == 0)) {
    uVar5 = encode_object_slot_index(target);
    found_item = find_object_by_encoded_slot_in_chain((char *)g_player_object + 6,1,uVar5);
    if (found_item == 0) {
      uVar11 = ((uw_object_hdr_t *)target)->object_id;
      if (((ushort)uVar11 < 0x153) || (0x156 < (ushort)uVar11)) {
        print_scroll_message_by_id(0x84);
      }
      else {
        print_scroll_message_by_id(0x87);
        iVar7 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
        sVar4 = rand_below(2);
        iVar6 = ((int)sVar4 - uVar11) + 0x156;
        while( true ) {
          iVar6 = iVar6 * 0x10000 >> 0x10;
          if ((iVar6 < 1) || (puVar8 = spawn_new_object(1, 0), puVar8 == (uw_object_hdr_t *)0x0))
            break;
          puVar8->type_flags = ((uw_object_hdr_t *)target)->type_flags;
          puVar8->position_word = ((uw_object_hdr_t *)target)->position_word;
          puVar8->chain_word = ((uw_object_hdr_t *)target)->chain_word;
          puVar8->link_word = ((uw_object_hdr_t *)target)->link_word;
          sVar4 = rand_below(2);
          uVar9 = uVar11 + (int)sVar4 + 1;
          if (0x156 < (int)(uVar9 * 0x10000) >> 0x10) {
            uVar9 = 0x10;
          }
          uVar10 = (puVar8->type_flags ^ uVar9) & 0x1ff ^ (uint)puVar8->type_flags;
          uVar1 = (undefined1)uVar10;
          bVar2 = (byte)(uVar10 >> 8);
          puVar8->object_id = uVar10 & 0x1ff;
          if ((short)uVar9 == 0x10) {
            puVar8->is_quant = 1;
            uVar5 = ce_rand();
            uw_ord2005_rem_168 = ((int)(uVar5)) % (6);
            uVar9 = (uw_ord2005_rem_168 & 0xffff) + 3;
            puVar8->link = uVar9 & 0x3ff;
          }
          uVar3 = ((uw_object_hdr_t *)target)->position_word;
          place_object_in_world(((uw_object_hdr_t *)target)->xpos + DAT_002020a0 * 8,
                                ((uw_object_hdr_t *)target)->ypos + DAT_002020a4 * 8,
                                ((uw_object_hdr_t *)target)->zpos, puVar8, 6,
                                0);
          iVar6 = iVar6 + -1;
        }
        discard_misplaced_object(iVar7 + 2,target,1);
        set_pending_update_flags(2);
      }
    }
  }
}





// was FUN_0007b5a4 -- deferred-target-click completion callback, gated on both param_2 and param_3
// nonzero: for target types 0xcc/0xcd (a fillable source, e.g. a fountain/well), consumes the held
// item and rewrites its type to 0x91...
void complete_use_item_fill_flask(ushort *target, int clicked, int confirmed)
{
  int iVar1;
  ushort uVar2;
  short sVar3;
  int iVar4;
  
  uVar2 = *target & 0x1ff;
  if ((uVar2 == 0x90) || (sVar3 = 4, uVar2 == 0x94)) {
    sVar3 = 0;
  }
  iVar1 = (int)sVar3;
  pop_cursor_icon(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((clicked != 0) && (confirmed != 0)) {
    if ((uVar2 < 0xcc) || (0xcd < uVar2)) {
      if ((uVar2 == 0x90) || (uVar2 == 0x91)) {
        uVar2 = target[2];
        if ((uVar2 & 0x3f) != 0x3f) {
          if ((uVar2 & 0x3f) < 0x20) {
            uVar2 = (uVar2 - 0x20 ^ uVar2) & 0x3f ^ uVar2;
          }
          else {
            uVar2 = uVar2 | 0x3f;
          }
          *(char *)(target + 2) = (char)uVar2;
          *(char *)((char *)target + 5) = (char)(uVar2 >> 8);
          print_scroll_message_by_id(iVar1 + 0xb3);
          finish_object_use(DAT_00202098,clicked,1);
          return;
        }
        iVar4 = iVar1 + 0xb4;
      }
      else if ((uVar2 == 0x94) || (iVar4 = 0xb1, uVar2 == 0x95)) {
        iVar4 = iVar1 + 0xb2;
      }
      print_scroll_message_by_id(iVar4);
    }
    else {
      print_scroll_message_by_id(0xb5);
      finish_object_use(DAT_00202098,clicked,1);
      uVar2 = *target;
      *(undefined1 *)target = 0x91;
      *(byte *)((char *)target + 1) = (byte)(uVar2 >> 8) & 0xfe;
      redraw_backpack_slot_widget(find_or_assign_object_widget(target));  /* r0 passthrough, ARM 0x7b67c-0x7b680 */
    }
  }
}





// was FUN_0007b72c -- the central "use this special/unique item directly" dispatcher for item types
// 0x121-0x12f and 299/300, covering: resting in a bed (0x121, gated on the current UI state);
// door-texture scheduling (0x122); playing one of 2 musical instruments (0x123/0x124)...
/* The actor is an object address, forwarded in r3 to the fountain's special-action dispatcher (ARM
   0x7b99c). */
void dispatch_use_special_item_by_type(ushort *actor, ushort *item, int flag)
{
  char *held_rec;
  ushort uVar1;
  int iVar2;
  int iVar3;
  ushort *puVar4;
  code *pcVar5;
  uint uVar6;
  undefined2 uVar7;
  short local_24;
  short local_22;
  short local_20 [2];
  undefined1 auStack_1c [4];
  
  if (flag == 0) {
    uVar1 = *item & 0x1ff;
    if (uVar1 == 0x129) {
      if (actor != g_player_object) {
        return;
      }
      /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's own identical fix
         comment. 0x129 has its own bit 8 set, so this comparison could never even succeed while
         reading a sign-extended single byte... */
      if ((g_selected_object == (char *)0x0) || ((*(ushort *)g_selected_object & 0x1ff) != 0x129)) {
        puVar4 = (ushort *)find_equipped_item_by_category(4,2,9,2,&local_22);
        if (puVar4 == (ushort *)0x0) {
          puVar4 = (ushort *)find_equipped_item_by_category(4,2,9,4,&local_22);
          if (puVar4 == (ushort *)0x0) {
            puVar4 = (ushort *)0x0;
          }
          else {
            local_20[0] = 2;
          }
        }
        else {
          local_20[0] = 1;
        }
      }
      else {
        local_20[0] = 0;
        puVar4 = (ushort *)g_selected_object;
      }
      if (puVar4 == (ushort *)0x0) {
        return;
      }
      iVar3 = (puVar4[3] & 0xffc0) + (item[3] & 0xffc0);
      *(byte *)(puVar4 + 3) = (byte)iVar3 ^ (byte)puVar4[3] & 0x3f;
      *(char *)((char *)puVar4 + 7) = (char)((uint)iVar3 >> 8);
      if (local_20[0] == 1) {
        redraw_backpack_slot_widget((int)local_22);
      }
      else if (local_20[0] == 2) {
        refresh_container_view();
      }
      finish_object_use(item,0,1);
      return;
    }
    if (uVar1 == 0x12e) {
      iVar3 = resolve_object_variant_or_special_link(item,&local_24,local_20,auStack_1c);
      if (iVar3 != 0) {
        dispatch_trap_special_or_tile_action((int)DAT_002020a0,(int)DAT_002020a4,item,actor,local_24,
                     local_20[0]);
        iVar3 = 0xf9;
        if (local_24 == 4) goto LAB_0007b9b8;
      }
      iVar3 = 0xed;
    }
    else {
      if (uVar1 != 0x12f) {
        return;
      }
      iVar3 = 0x112;
    }
    goto LAB_0007b9b8;
  }
  switch(*item & 0x1ff) {
  case 0x121:
    /* ARM 0x7b7b8..0x7b7c0 reads the mode at byte offset 8. */
    if (*(short *)((char *)DAT_00085a6c + 8) == 1) {
      handle_rest_action(1);
    }
    break;
  case 0x122:
    iVar3 = 9;
    iVar2 = spawn_scheduled_door_texture_object();
    if (iVar2 == -1) {
LAB_0007b894:
      iVar3 = iVar3 + 1;
      finish_object_use(item,flag,1);
    }
    else if (iVar2 != 0) {
      if (iVar2 != 1) goto LAB_0007b9b8;
      iVar3 = 10;
      goto LAB_0007b894;
    }
    iVar3 = iVar3 + 1;
LAB_0007b9b8:
    print_scroll_message_by_id(iVar3);
    return;
  case 0x123:
    goto LAB_0007b7e4;
  case 0x124:
LAB_0007b7e4:
    play_musical_instrument((*item & 0x1ff) - 0x123);
    break;
  case 0x125:
    uVar6 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar6;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar6 >> 8);
    reduce_item_quality_on_use(g_player_object,2);
    finish_object_use(item,flag,1);
    iVar3 = 0xe0;
    goto LAB_0007b9b8;
  case 0x126:
    break;
  case 0x127:
    arm_use_item_on_special_target_prompt(item,flag);
    break;
  case 0x128:
    pcVar5 = complete_use_item_scatter_spawn;
    goto LAB_0007b8b8;
  case 0x129:
    break;
  case 0x12a:
    break;
  case 299:
    iVar3 = try_climb_wall();
    if (iVar3 != 0) {
      held_rec = (char *)begin_holding_object_on_cursor(0,0xb6);
      uVar7 = *(undefined2 *)(held_rec + 4);
      *(byte *)(held_rec + 4) = (byte)uVar7 | 0x3f;
      *(char *)(held_rec + 5) = (char)((ushort)uVar7 >> 8);
    }
    wait_for_click_release(1);
    break;
  case 300:
    break;
  case 0x12d:
    pcVar5 = complete_use_item_fill_flask;
LAB_0007b8b8:
    prompt_use_item_on_target(item,pcVar5);
  }
}





// was FUN_0007baf0 -- "read" a book/sign/scroll-like item: type 0x13b (likely a dedicated
// multi-page book) switches to a reading UI mode (change_game_mode) when the current UI state
// permits.
void use_readable_item(ushort *item, int flag)
{
  ushort uVar2;
  short sVar3;
  int iVar5;
  /* Same split-buffer decompile artifact fixed in use_food_item (see its comment) and in
     build_creature_look_text: the "You read the " prefix was copied into a phantom, oversized
     acStackY_85d64 buffer that nothing else ever reads... */
  char acStack_7c [256];
  
  if (flag != 0) {
    uVar2 = *item;
    if ((uVar2 & 0x1ff) == 0x13b) {
      if (*(short *)(DAT_00085a6c + 8) == 1) {
        change_game_mode(2);
      }
    }
    else if (((uVar2 & 0x1000) == 0) || ((uVar2 & 0x1c0) == 0x140)) {
      if ((uVar2 & 0x400) == 0) {
        if ((item[3] & 0x7fc0) < 0x4000) {
          acStack_7c[0] = '\0';
          ce_strcat(acStack_7c, s_You_read_the_00085ce8);
          iVar5 = ce_strlen(acStack_7c);
          sVar3 = build_object_display_name(acStack_7c + iVar5,item,0,0);
          if (sVar3 == 0) {
            ce_strcat(acStack_7c,s_UNNAMED_00084f24);
          }
          ce_strcat(acStack_7c,&DAT_00085ce0);
          message_scroll_print_wrapped(acStack_7c);
          /* Was `get_message_string(id); message_scroll_print_wrapped();` -- the SAME
             dropped-argument idiom fixed throughout this session (a register-carryover call with no
             explicit args). */
          message_scroll_print_wrapped(get_message_string(item[3] >> 6 | 0x600));
          message_scroll_print_wrapped(&s_scroll_newline_0008522c);
        }
        else {
          check_offering_container_puzzle();
        }
      }
      else {
        display_book_or_scroll_page((item[3] >> 6 & 0x1ff) + 0x100);
      }
    }
    else {
      trigger_object_trap_or_use_action(g_player_object,item,4,(int)DAT_002020a0,DAT_002020a4);
      trigger_object_use_babl_script((int)DAT_002020a0,(int)DAT_002020a4,g_player_object,item,flag);
      finish_object_use(item,flag,0);
    }
  }
}





// was FUN_0007bcdc -- dispatches an interaction with a world object by its own type-id "family"
// bits (bits 4-5): family 0 handles doors (open/close, or a "locked"/"already open" scroll message
// for the player); family 1 handles mantra-chant statues...
void dispatch_world_object_interaction_by_family(ushort *actor, ushort *object)
{
  char *wptr_59681;
  char cVar1;
  short sVar2;
  char *pcVar3;
  ushort uVar4;
  ushort uVar5;
  char acStack_84f44 [544548];
  char acStack_20 [20];
  
  uVar5 = *object;
  uVar4 = uVar5 >> 4 & 3;
  if ((uVar5 >> 4 & 3) == 0) {
    if ((uVar5 & 0xf) < 8) {
      sVar2 = check_object_combination(actor,object,0);
      if (sVar2 == 0) {
        if ((*actor & 0x1ff) == 0x7f) {
          sVar2 = build_object_display_name(acStack_20,object,0,0);
          if (sVar2 == 0) {
            pcVar3 = s_UNNAMED_00084f24;
    wptr_59681 = acStack_84f44;
            do {
              cVar1 = *pcVar3;
              *wptr_59681 = cVar1; wptr_59681 = wptr_59681 + 1;
              pcVar3 = pcVar3 + 1;
            } while (cVar1 != '\0');
          }
          message_scroll_print_wrapped(&DAT_00085c88);
          message_scroll_print_wrapped(acStack_20);
          message_scroll_print_wrapped(s_is_locked__000878fc);
        }
      }
      else if ((actor == g_player_object) || ((object[3] & 1) == 0)) {
        close_door_object(actor,object);
      }
    }
    else {
      open_door_object(object);
    }
  }
  else if (uVar4 == 1) {
    uVar4 = uVar5 & 0xf;
    if (uVar4 == 7) {
      handle_mantra_chant();
    }
    else if (((uVar4 == 0xb) || (uVar4 == 0xd)) && ((uVar5 & 0x8000) == 0)) {
      try_combine_or_stow_object(actor,object,0);
    }
  }
  else {
    if (uVar4 == 2) {
      if (((uVar5 & 0xf) != 1) && ((uVar5 & 0xf) != 2)) {
        look_at_inscribed_object(object,-1);
        return;
      }
      uVar5 = ((uVar5 >> 9) + 1) * 0x200 & 0xe00 | uVar5 & 0xe1ff;
    }
    else {
      if (uVar4 != 3) {
        return;
      }
      play_positional_sound_effect(0x13,DAT_002020a0 * 8 + 3,DAT_002020a4 * 8 + 3,0);
      uVar5 = ((uVar5 & 0xf) - 8 ^ *object) & 0xf ^ *object;
    }
    *(char *)object = (char)uVar5;
    *(char *)((char *)object + 1) = (char)(uVar5 >> 8);
    set_pending_update_flags(2);
  }
}





// was FUN_0007c1bc -- a shared "finalize object use" step called at the end of virtually every
// use-object interaction path (use_object_on_target, use_readable_item, dispatch_world_object_
// interaction_by_family)...
int trigger_object_use_babl_script(int context_x, int context_y, void *actor_ptr, void *object_ptr, int confirmed)
{
  ushort *actor = (ushort *)actor_ptr;
  ushort *object = (ushort *)object_ptr;
  int iVar1;
  ushort *puVar2;
  undefined2 local_1c;
  undefined2 local_1a;
  int local_18;
  
  iVar1 = resolve_object_variant_or_special_link(object,&local_1a,&local_1c,&local_18);
  if ((iVar1 != 0) && (local_18 != 0)) {
    if (confirmed == 0) {
      puVar2 = object;
      if (((actor != g_player_object) || ((*object & 0x1ff) < 0x98)) || (0x9b < (*object & 0x1ff)))
      goto LAB_0007c2b8;
    }
    else {
      if (DAT_0024cfc8 <= *(uint *)(DAT_00086df8 + 0xce)) {
        DAT_0024cfc8 = *(uint *)(DAT_00086df8 + 0xce) + 0x2fd;
        puVar2 = actor;
LAB_0007c2b8:
        dispatch_trap_special_or_tile_action(context_x,context_y,puVar2,actor,local_1a,local_1c);
        consume_linked_special_object_charge(object);
        return 1;
      }
      play_sound_effect_with_pan(0x15,0x40,0);
    }
  }
  return 0;
}



// was FUN_0007c2ec -- another shared "finalize object use/trap check" step, called alongside
// trigger_object_use_babl_script throughout the use-object interaction paths...
/* was int -- the picked object (g_interact_target etc.), deref'd at param_2+1 / param_2+6 */
void trigger_object_trap_or_use_action(void *actor_ptr, void *object_ptr, int action, int tile_x, short tile_y)
{
  char *actor = (char *)actor_ptr;
  char *object = (char *)object_ptr;
  ushort *puVar1;
  ushort *local_1c;
  
  if (((object != 0) && ((*(byte *)(object + 1) & 0x80) == 0)) &&
     (local_1c = (ushort *)(object + 6), (*local_1c & 0xffc0) != 0)) {
    puVar1 = (ushort *)find_object_in_chain(&local_1c,0,6,0xffffffff,0xffff);
    if (puVar1 != (ushort *)0x0) {
      if ((((uw_object_hdr_t *)puVar1)->object_id & 0x30) < 0x20) {
        if (((((uw_object_hdr_t *)puVar1)->type_flags & 0x1e00) == 0) && ((short)action == 4)) {
          apply_trap_or_link_effect(actor,object,puVar1,tile_x,tile_y);
          refresh_object_link_chain(local_1c,puVar1);
        }
      }
      else {
        resolve_skill_gated_unlock_or_use(actor,object,puVar1,action);
      }
    }
  }
}


// was FUN_0002805c -- checks if two objects are combinable: searches the combat/combination data
// table (&DAT_00100630, loaded by load_combat_data_file, 10 entries) for an unordered match of the
// two object ids, returning the combination index or -1 if none matches.
int objects_are_combinable(ushort *object_a, ushort *object_b)
{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  ushort uVar4;
  int iVar5;
  short sVar6;
  ushort *puVar7;
  int iVar8;
  
  uVar2 = *object_a;
  if ((((uVar2 & 0x8000) == 0) || ((object_a[3] & 0xffc0) < 0x41)) &&
     (((uVar2 & 0x8000) != 0 || ((object_a[3] & 0xffc0) == 0)))) {
    uVar1 = *object_b;
    if ((((uVar1 & 0x8000) == 0) || ((object_b[3] & 0xffc0) < 0x41)) &&
       (((uVar1 & 0x8000) != 0 || ((object_b[3] & 0xffc0) == 0)))) {
      uVar1 = uVar1 & 0x1ff;
      uVar2 = uVar2 & 0x1ff;
      debug_print(s_checking_if__d_and__d_are_combin_00084f90,uVar2,uVar1);
      puVar7 = &DAT_00100630;
      iVar8 = 0;
      do {
        uVar3 = *puVar7 & 0x1ff;
        uVar4 = puVar7[1] & 0x1ff;
        debug_print(s_combination__d_is__d_and__d__00084f70,iVar8,uVar3,uVar4);
        if (((*puVar7 | puVar7[1]) & 0x8000) != 0) {
          if (((uVar3 == uVar2) && (uVar4 == uVar1)) || ((uVar3 == uVar1 && (uVar4 == uVar2))))
          break;
          puVar7 = puVar7 + 3;
        }
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      } while (iVar8 < 10);
      sVar6 = (short)iVar8;
      iVar8 = (int)sVar6;
      iVar5 = -1;
      if (iVar8 != 10) {
        iVar5 = iVar8;
      }
      debug_print(s_objsbecombinable_returns__d_00084f50,iVar5);
      if (iVar8 == 10) {
        sVar6 = -1;
      }
      return (int)sVar6;
    }
  }
  return -1;
}



// was FUN_0002822c -- spawns the resulting object for combination
// index param_1 (the id looked up from &DAT_00100634, the same
// combination-table stride objects_are_combinable searches).
void *spawn_combined_object(short combination_index)
{
  /* ARM 0x2824c is a tail call (`b spawn_new_object`): the new object pointer is this function's
     return value. It was decompiled as `...; return 0;`, so combining items always saw NULL. */
  return spawn_new_object((int)*(short *)(&DAT_00100634 + combination_index * 6),0);
}



// was FUN_00028254 -- checks whether object param_1 is the "consumed" ingredient half of
// combination index param_2: picks whichever of the combination table's two id slots matches
// param_1's own id, and returns that slot's own high bit (its "consumed" flag).
bool is_object_consumed_in_combination(ushort *object, short combination_index)
{
  ushort *puVar1;

  puVar1 = &DAT_00100630 + combination_index * 3;
  if (((*puVar1 ^ *object) & 0x1ff) != 0) {
    puVar1 = &DAT_00100632 + combination_index * 3;
  }
  return (*puVar1 & 0x8000) != 0;
}


// was FUN_000282ac -- a specific puzzle/quest handler triggered by "reading" a special item (its
// own caller only reaches here for a message-id field in a reserved high range, not a normal
// book/sign text)...
int check_offering_container_puzzle()

{
  short *psVar1;
  ushort uVar2;
  bool bVar3;
  short sVar4;
  ushort *puVar5;
  undefined4 uVar6;
  ushort *puVar7;
  int iVar8;
  uint uVar9;
  undefined1 auStack_30 [4];
  short local_2c [4];
  short local_24 [4];
  
  local_24[0] = 0xd9;
  local_24[1] = 0xb8;
  local_24[2] = 0xbe;
  local_2c[0] = 0;
  local_2c[1] = 0;
  local_2c[2] = 0;
  puVar5 = (ushort *)find_equipped_item_by_category(2,0,0xe,4,auStack_30);
  if (puVar5 == (ushort *)0x0) {
    uVar6 = 0x96;
  }
  else {
    puVar7 = puVar5 + 3;
    while (puVar7 = (ushort *)resolve_object_link(puVar7), puVar7 != (ushort *)0x0) {
      bVar3 = false;
      uVar2 = *puVar7;
      iVar8 = 0;
      do {
        psVar1 = local_24 + iVar8;
        local_2c[iVar8] = local_2c[iVar8] + (ushort)((uVar2 & 0x1ff) == (int)*psVar1);
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
        bVar3 = (bool)(bVar3 | ((uVar2 & 0x1ff) == (int)*psVar1));
      } while (iVar8 < 3);
      if (!bVar3) goto LAB_000283ec;
      puVar7 = puVar7 + 2;
    }
    bVar3 = true;
    iVar8 = 0;
    do {
      bVar3 = (bool)(bVar3 & (local_2c[iVar8] != 0));
      iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
    } while (iVar8 < 3);
    if (bVar3) {
      sVar4 = encode_object_slot_index(puVar5);
      if ((uint)(*(ushort *)(g_current_container_record + 8) >> 6) == (int)sVar4) {
        leave_nested_container_level();
      }
      free_linked_object_recursive(puVar5 + 3);
      uVar9 = ((uw_object_hdr_t *)puVar5)->type_flags & 0xff1b | 0x11b;
      ((uw_object_hdr_t *)puVar5)->type_flags = (ushort)uVar9;
      redraw_container_icon_slot();
      print_scroll_message_by_id(0x95);
      return 1;
    }
LAB_000283ec:
    uVar6 = 0x94;
  }
  print_scroll_message_by_id(uVar6);
  return 0;
}


// was FUN_00039d78 -- the "climb" command handler: projects a point 11 units ahead of the player
// along their current heading, checks the tile there is a climbable wall/door of a height the
// player's own stat allows (else message 0x65, "can't climb here")...

int try_climb_wall()

{
  int uw_ord2005_rem_103 = 0;
  ushort uVar1;
  ushort *puVar2;
  undefined4 uVar3;
  int extraout_r1;
  short local_8;
  short local_6;
  
  local_6 = DAT_00204880 >> 5;
  local_8 = DAT_00204882 >> 5;
  project_position_by_heading((int)DAT_00201c70 >> 8,0xb,&local_6,&local_8);
  puVar2 = (ushort *)tilemap_lookup((int)local_6 >> 3,(int)local_8 >> 3);
  uVar1 = *puVar2;
  if ((((uVar1 & 0xf) == 0) || (((&DAT_0023ae40)[uVar1 >> 10 & 0xf] & 0xfff0) != 0x10)) ||
     ((int)(g_player_object->hdr.zpos >> 3) <= (int)((uVar1 >> 4 & 0xf) - 1))) {
    uVar3 = 0x65;
  }
  else {
    uVar3 = ce_rand();
    uw_ord2005_rem_103 = ((int)(uVar3)) % (5);
    if (uw_ord2005_rem_103 == 0) {
      if ((uint)(_DAT_002035cf >> 4) + (uint)*(ushort *)(DAT_00086df8 + 0x4a) <
          (uint)*(ushort *)(DAT_00086df8 + 0x4c)) {
        print_scroll_message_by_id(99);
        return 1;
      }
      uVar3 = 0x66;
    }
    else {
      uVar3 = 100;
    }
  }
  print_scroll_message_by_id(uVar3);
  return 0;
}


// was FUN_0003ab90 -- the "use lockpick on this lock" item-use handler: when param_3 is set, first
// prompts the player with a difficulty-flavored confirmation message (via prompt_yes_no_scroll)
// before proceeding...
void use_lockpick_on_object(ushort *lock, int skill, int show_prompt)
{
  short sVar1;
  int iVar2;
  int iVar3;
  short local_6c [2];
  uint local_68;
  undefined1 auStack_64 [80];
  
  local_68 = 1;
  build_object_display_name(auStack_64,lock,0,0);
  if (show_prompt != 0) {
    iVar2 = resolve_lock_difficulty_rating(lock);
    if ((short)iVar2 < 0) {
      print_scroll_message_by_id(0x8e);
      return;
    }
    iVar2 = ((iVar2 - skill) + 0xf) * 0x10000 >> 0x10;
    if (iVar2 < 0) {
      iVar2 = 0;
    }
    else if (iVar2 < 0x1f) {
      sVar1 = ordint_divmod(10,iVar2).quot;  /* dividend dropped; ARM 0x3abe0-0x3ac10 */
      iVar2 = sVar1 + 1;
    }
    else {
      iVar2 = 4;
    }
    print_scroll_message_by_id(0xd8);
    print_scroll_message_by_id(iVar2 + 0xdb);
    print_scroll_message_by_id(0xd9);
    message_scroll_print_wrapped(auStack_64);
    sVar1 = prompt_yes_no_scroll(0,0xda,&local_68);
    if ((sVar1 != 0) && (sVar1 < 4)) {
      local_68 = (uint)(sVar1 == 2);
      /* HACK: was a bare `echo_yes_no_to_scroll();` -- dropped argument, the same class of bug
         fixed repeatedly elsewhere in this file. local_68, just set on the line above from the
         prompt's own answer, is obviously the intended argument here. */
      echo_yes_no_to_scroll(local_68);
    }
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    if (local_68 == 0) {
      return;
    }
  }
  display_book_or_scroll_page(0x104);
  iVar2 = attempt_pick_lock(lock,skill,local_6c);
  if (show_prompt == 0) {
    if ((short)iVar2 == -2) {
      /* was folded into `int iVar2` (reused elsewhere in this function for
         unrelated int values) -- truncated tilemap_lookup's real
         `void *` return */
      char *_tile2 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
      discard_misplaced_object(_tile2 + 2,lock,0);
    }
  }
  else {
    *(byte *)(DAT_0023be74 + 0x1d) = *(byte *)(DAT_0023be74 + 0x1d) | 0xf;
    iVar3 = local_6c[0] * 0x3c00 + *(int *)(DAT_00086df8 + 0xce);
    *(char *)(DAT_00086df8 + 0xce) = (char)iVar3;
    *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar3 >> 8);
    *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar3 >> 0x10);
    *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar3 >> 0x18);
    if ((short)iVar2 == -2) {
      iVar3 = roll_object_destroy_chance(10,lock);
      if (iVar3 == 0) {
        iVar2 = 0;
      }
      else {
        decrement_object_count(lock);
        discard_misplaced_object(0,lock,1);
      }
    }
    print_scroll_message_by_id(iVar2 + 0x8e);
    if ((short)iVar2 != 0) {
      message_scroll_print_wrapped(auStack_64);
      print_scroll_message_by_id(0x53);
    }
    refresh_player_equipment_effects();
    set_pending_update_flags(0x200);
  }
}


// was FUN_00043b78 -- place_object_in_backpack_slot's sibling for equipment slots
// (g_equipped_items, indexed by param_2): walks the container's contents list looking for the item
// currently in that slot, swaps it to the cursor if the new object doesn't fit...
bool place_object_in_equipment_slot(ushort *equip_object, int slot)
{
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  ushort *puVar5;
  ushort *puVar6;
  uint uVar7;
  int iVar8;
  byte *pbVar9;
  ushort *puVar10;
  char *pAncestor;

  /* Was `resolve_object_link(g_current_container_record + 8)` -- a tracking record lives outside
     the level's object arena resolve_object_link bounds-checks against... */
  g_current_container_link = *(undefined2 *)(g_current_container_record + 8);
  puVar10 = (ushort *)((char *)resolve_object_link(&g_current_container_link) + 6);
  iVar4 = (short)slot * 2;
  pbVar9 = &g_equipped_items + iVar4;
  puVar5 = (ushort *)resolve_object_link(pbVar9);
  while( true ) {
    puVar6 = (ushort *)resolve_object_link(puVar10);
    if (puVar5 == puVar6) {
      swap_cursor_and_slot_item(slot,0);
      sVar1 = check_object_fits_in_slot(equip_object,slot);
      if (sVar1 == 0) {
        g_selected_object = (char *)equip_object;
        pop_cursor_icon(3);
        /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
           own identical fix comment. */
        push_cursor_icon(*(ushort *)g_selected_object & 0x1ff);
        equip_object = puVar5;
      }
      object_list_insert_head(puVar10,equip_object);
      uVar7 = encode_object_slot_index(equip_object);
      *pbVar9 = *pbVar9 & 0x3f | (byte)((uVar7 & 0x3ff) << 6);
      (&DAT_00202951)[iVar4] = (char)((uVar7 << 0x16) >> 0x18);
      sVar2 = calculate_object_weight((uw_object_hdr_t *)equip_object);
      sVar3 = calculate_object_weight((uw_object_hdr_t *)puVar5);
      /* Legacy truncated "prev" walk -- same fix as place_object_in_backpack_slot's sibling copy
         (search "still broken for genuine container nesting"); given its own dedicated local
         (pAncestor) since `iVar4` has unrelated plain-int roles elsewhere in this function. */
      for (pAncestor = g_current_container_record; pAncestor != 0;
          pAncestor = *(char **)(pAncestor + 0x14)) {
        iVar8 = (int)*(short *)(pAncestor + 10) + (((int)sVar2 - (int)sVar3) * 0x10000 >> 0x10);
        *(char *)(pAncestor + 10) = (char)iVar8;
        *(char *)(pAncestor + 0xb) = (char)((uint)iVar8 >> 8);
      }
      sVar2 = calculate_object_weight((uw_object_hdr_t *)equip_object);
      g_player_carry_weight = g_player_carry_weight + sVar2;
      refresh_player_equipment_effects();
      repopulate_container_grid_slots();
      redraw_inventory_widget_range((int)(char)(&g_backpack_slot_to_widget)[(short)slot],
                   (int)(char)(&g_backpack_slot_to_widget)[(short)slot]);
      return sVar1 != 0;
    }
    if (puVar6 == (ushort *)0x0) break;
    puVar10 = puVar6 + 2;
  }
  return false;
}


// was FUN_0004503c -- redraws the inventory widget for backpack slot
// param_1, via the slot-to-widget-index lookup table.
void redraw_backpack_slot_widget(short slot)
{
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[slot]);
}


// was FUN_00047b38 -- checks whether two objects can be merged into one stack: same class, both
// stackable (or both non-stacked), not in an excluded category (0xc0 bits), and -- for the "cheap
// goods" class range 0x10-0x12 -- matching quality-family nibbles.
int objects_can_stack(const uw_object_hdr_t *object_a,
                      const uw_object_hdr_t *object_b)
{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  ushort uVar4;
  ushort uVar5;
  uint uVar6;
  
  uVar3 = object_a->type_flags;
  if ((((((object_b->type_flags ^ uVar3) & 0x1ff) == 0) &&
        (((uVar3 & 0x8000) != 0 || (object_a->link == 0)))) &&
       ((object_b->is_quant != 0 || (object_b->link == 0)))) &&
      ((uVar4 = object_a->link_word, (uVar4 & 0x8000) == 0 && (uVar5 = object_b->link_word, (uVar5 & 0x8000) == 0)))) {
    uVar6 = uVar3 & 0x1ff;
    if ((((g_object_type_props[uVar6].flags & 0xc0) != 0x40) &&
         ((g_object_type_props[uVar6].flags & 0xc0) != 0xc0)) &&
        ((((uVar3 & 0x1f0) != 0x100 || (((uVar5 ^ uVar4) & 0x3f) == 0)) &&
          ((ushort)((uVar5 >> 6) + (uVar4 >> 6)) < 999)))) {
      if ((uVar6 < 0x10) || (0x12 < uVar6)) {
        bVar1 = object_a->quality;
        bVar2 = object_b->quality;
        if (((bVar1 ^ bVar2) & 0xf0) != 0) {
          return 0;
        }
        if ((((object_a->quality) == 0) || ((object_b->quality) == 0)) &&
            (bVar1 != bVar2)) {
          return 0;
        }
      }
      return 1;
    }
  }
  return 0;
}


// was FUN_000452dc -- searches equipped items (g_equipped_items, slots 0-0xa quickly, 0-0x12 if
// param_4 isn't 1) for the first one matching category/subcategory/quality filters param_1/param_2/
// param_3 (each <0 = any), returning its slot index via param_5...
ushort *find_equipped_item_by_category(int category, int subcategory, int quality, short full_scan, void *out_slot_ptr)
{
  ushort *out_slot = (ushort *)out_slot_ptr;
  short sVar1;
  ushort *puVar4;
  int iVar5;
  undefined2 uVar6;
  int iVar7;
  /* Was `undefined4 local_74 [2];` -- element [0] holds a real 64-bit object pointer passed by
     address into find_object_in_link_chain (see that function's own fix comment); [1] is unused
     padding from the original 32-bit stack layout. */
  char *local_74 [2];
  char *local_6c [19];  /* was int [19]: stored (and later dereferenced) truncated object pointers */
  char *item_rec;
  ushort uVar2;
  ushort uVar3;
  
  iVar7 = 0;
  do {
    uVar6 = (undefined2)iVar7;
    puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar7 * 2);
    local_6c[iVar7] = (char *)puVar4;
    sVar1 = (short)category;
    uVar2 = (ushort)subcategory;
    uVar3 = (ushort)quality;
    if ((((puVar4 != (ushort *)0x0) && ((sVar1 < 0 || ((*puVar4 >> 6 & 7) == (int)sVar1)))) &&
        (((short)uVar2 < 0 || (((byte)((byte)*puVar4 >> 4) & 3) == uVar2)))) &&
       (((short)uVar3 < 0 || (((byte)*puVar4 & 0xf) == uVar3)))) goto LAB_0004552c;
    iVar5 = (iVar7 + 1) * 0x10000;
    iVar7 = iVar5 >> 0x10;
  } while (iVar7 < 0xb);
  if (full_scan != 1) {
    iVar5 = (int)(short)((uint)iVar5 >> 0x10);
    while (uVar6 = (undefined2)iVar7, iVar5 < 0x13) {
      puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar5 * 2);
      local_6c[iVar5] = (char *)puVar4;
      if (((puVar4 != (ushort *)0x0) && ((sVar1 < 0 || ((*puVar4 >> 6 & 7) == (int)sVar1)))) &&
         ((((short)uVar2 < 0 || (((byte)((byte)*puVar4 >> 4) & 3) == uVar2)) &&
          (((short)uVar3 < 0 || (((byte)*puVar4 & 0xf) == uVar3)))))) goto LAB_0004552c;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
      iVar7 = iVar5;
    }
    if ((full_scan != 2) && (full_scan != 3)) {
      iVar7 = 0;
      do {
        uVar6 = (undefined2)iVar7;
        item_rec = local_6c[iVar7];
        if ((item_rec != 0) && ((*(byte *)(item_rec + 1) & 0x80) == 0)) {
          local_74[0] = resolve_object_link(item_rec + 6);
          puVar4 = (ushort *)find_object_in_link_chain(category,subcategory,quality,local_74);
          local_6c[iVar7] = (char *)puVar4;
          if (puVar4 != (ushort *)0x0) {
LAB_0004552c:
            *out_slot = uVar6;
            return puVar4;
          }
        }
        iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      } while (iVar7 < 0x13);
    }
  }
  return (ushort *)0x0;
}



// was FUN_00045538 -- recursively walks an object's contents link chain (descending into nested
// containers) looking for the first object matching the category/subcategory/quality filters in
// param_1/param_2/ param_3 (each <0 means "any"); param_4 is an in/out cursor...
/* Was `int * param_4;` -- the caller-supplied slot always holds a real 64-bit object-record
   pointer (see find_equipped_item_by_category's own local_74 and
   extract_matching_object_from_slot's own local_28, both fixed alongside this one)... */
char *find_object_in_link_chain(int category, int subcategory, int quality, char **chain)
{
  ushort *puVar1;
  char *iVar2;
  uint uVar3;
  char *local_1c;

  if (*chain != 0) {
    do {
      if ((short)category < 0) {
LAB_00045594:
        if (-1 < (short)subcategory) {
          puVar1 = (ushort *)*chain;
          uVar3 = (uint)*puVar1;
          if ((*puVar1 >> 4 & 3) != (int)(short)subcategory) goto LAB_000455f8;
        }
        if ((short)quality < 0) {
LAB_00045668:
          iVar2 = *chain;
          *chain = 0;
          return iVar2;
        }
        puVar1 = (ushort *)*chain;
        uVar3 = (uint)*puVar1;
        if ((uVar3 & 0xf) == (int)(short)quality) goto LAB_00045668;
      }
      else {
        puVar1 = (ushort *)*chain;
        uVar3 = (uint)*puVar1;
        if ((*puVar1 >> 6 & 7) == (int)(short)category) goto LAB_00045594;
      }
LAB_000455f8:
      if ((((uVar3 & 0x8000) == 0) && (local_1c = resolve_object_link(puVar1 + 3), local_1c != 0)) &&
         (iVar2 = find_object_in_link_chain(category,subcategory,quality,&local_1c), iVar2 != 0)) {
        if (local_1c == 0) {
          return iVar2;
        }
        *chain = local_1c;
        return iVar2;
      }
      iVar2 = resolve_object_link(*chain + 4);
      *chain = iVar2;
    } while (iVar2 != 0);
  }
  return 0;
}



// was FUN_00045678 -- resolves the inventory item under the current click position: hit-tests the
// backpack widget grid, then either directly resolves the equipped slot...
ushort *resolve_clicked_inventory_item(short zone)
{
  int iVar1;
  short sVar2;
  /* Was `undefined4 uVar3;` -- truncated find_object_in_link_chain's/
     get_equipped_item_at_widget_slot's real 64-bit object pointer to 32 bits. */
  ushort *uVar3;

  sVar2 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
  iVar1 = (int)sVar2;
  if ((iVar1 < 0) || (0x13 < iVar1)) {
    uVar3 = 0;
  }
  else if (zone == 2) {
    uVar3 = get_equipped_item_at_widget_slot((int)(char)(&g_backpack_widget_to_slot)[iVar1]);
  }
  else {
    uVar3 = (ushort *)extract_clicked_backpack_item(0xffffffff,0xffffffff,0xffffffff,(int)(char)(&g_backpack_widget_to_slot)[iVar1]);
  }
  return uVar3;
}



// was FUN_00045708 -- resolves the equipped-item link for slot
// param_1. Confirmed used by resolve_clicked_inventory_item for the
// "direct equipped-slot" click case.
ushort *get_equipped_item_at_widget_slot(short slot)
{
  /* Was `resolve_object_link(&g_equipped_items + slot * 2); return 0;` -- confirmed via real ARM
     disassembly (0x45708-0x45718: `mov r3,r0,lsl #0x10; ldr r0,[...]; mov r3,r3,asr #0x10; add
     r0,r0,r3,lsl #0x1; b 0x53514` -- a genuine TAIL CALL straight into resolve_object_link)... */
  return (ushort *)resolve_object_link(&g_equipped_items + slot * 2);
}



// was FUN_00045720
void deplete_object_count(ushort *object)
{
  reduce_object_count(object,0xffffffff);
}



// was FUN_00045728
/* Was `undefined4 param_1` -- a real object-record pointer (forwarded straight to
   reduce_object_count, which dereferences it via
   encode_object_slot_index/calculate_object_weight), truncated to 32 bits on this host -- same
   class as many other fixes this session. */
void decrement_object_count(ushort *object)
{
  reduce_object_count(object,1);
}



// was FUN_00045730
/* Was `undefined4 param_1` -- same truncated-object-pointer bug as decrement_object_count's own
   fix just above it (its only caller here). */
int reduce_object_count(ushort *stack_object, uint amount)
{
  short sVar1;
  ushort uVar2;
  int iVar3;
  undefined4 uVar4;
  uw_object_hdr_t *puVar5;
  uw_object_hdr_t *puVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  char *pObj;

  /* Dropped argument: calculate_object_weight dereferences its own declared stack_object immediately --
     called bare here, same idiom as this whole session's other fixes. */
  iVar3 = calculate_object_weight((uw_object_hdr_t *)stack_object);
  uVar4 = encode_object_slot_index(stack_object);
  iVar7 = 0;
  do {
    if ((uint)(*(ushort *)(&g_equipped_items + iVar7 * 2) >> 6) == (int)(short)uVar4) break;
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 0x1c);
  iVar8 = (int)(short)iVar7;
  sVar1 = (short)amount;
  if (iVar8 < 0x1c) {
    extract_and_refresh_slot_item(0xffffffff,0xffffffff,0xffffffff,iVar7,sVar1);
    if (iVar8 < 0x13) {
      redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar8]);
    }
    else {
      repopulate_container_grid_slots();
      refresh_container_view();
      /* Was `for (iVar7 = g_current_container_record; ...)` -- truncated g_current_container_record
         (a real char* global) into a 32-bit int, then rebuilt a bogus "next" address out of raw
         bytes at iVar7+4..+7 instead of resolving the object's real next-link via... */
      for (pObj = g_current_container_record; pObj != NULL;
          pObj = (*(ushort *)(pObj + 4) & 0xffc0) == 0 ? NULL :
                 (char *)resolve_object_link((ushort *)(pObj + 4))) {
        iVar8 = *(short *)(pObj + 10) - iVar3;
        *(char *)(pObj + 10) = (char)iVar8;
        *(char *)(pObj + 0xb) = (char)((uint)iVar8 >> 8);
      }
    }
  }
  else {
    puVar5 = find_object_by_encoded_slot_in_chain(&g_player_object->hdr.link_word,
                                                  1, uVar4);
    if (puVar5 == (uw_object_hdr_t *)0x0) {
      return 0;
    }
    if (((0 < sVar1) && (puVar5->is_quant != 0)) && ((puVar5->link & 0x200) == 0)) {
      uVar2 = puVar5->link;
      if ((1 < uVar2) && (sVar1 < (short)uVar2)) {
        puVar6 = alloc_object_slot(0);
        puVar6->type_flags = puVar5->type_flags;
        puVar6->position_word = puVar5->position_word;
        puVar6->chain_word = puVar5->chain_word;
        puVar6->link_word = puVar5->link_word;
        uVar9 = (amount & 0xffff) * 0x3ff + (uint)uVar2;
        puVar6->link = uVar9 & 0x3ff;
        puVar5->link = amount & 0x3ff;
        object_list_insert_head(&puVar5->chain_word, puVar6);
      }
    }
    object_list_unlink(DAT_002046b4,puVar5);
    g_player_carry_weight = g_player_carry_weight - (short)iVar3;
    /* This else-branch (reached when the object isn't found among the 28
       direct/open-container-borrowed slots at all, e.g. nested two containers deep) unlinked the
       object but... */
    repopulate_container_grid_slots();
    refresh_container_view();
    redraw_inventory_widget(0x13);
    refresh_player_equipment_effects();
  }
  return 1;
}



// was FUN_000459d8 -- extracts and refreshes the item in slot param_4 via
// extract_and_refresh_slot_item, then updates either the container view or the inventory widget
// depending on what the extracted slot held.
/* Was a bare K&R `()` reading an implicit `short in_r3;` for its 4th arg, and forwarding to
   FUN_00045b20 via a bare `FUN_00045b20()` call with no explicit arguments at all. */
/* `count` is how many of a stack to take: 0 takes the whole object (the original's click path), n splits n off. */
static ushort *extract_backpack_item_count(int category, int subcategory, int quality, short slot, ushort count)
{
  ushort *uVar1;
  ushort *puVar2;

  uVar1 = extract_and_refresh_slot_item(category,subcategory,quality,slot,count);
  puVar2 = (ushort *)resolve_object_link(&g_equipped_items + slot * 2);
  if ((((puVar2 != (ushort *)0x0) && ((((uw_object_hdr_t *)puVar2)->object_id & 0x1c0) == 0x80)) && ((((uw_object_hdr_t *)puVar2)->object_id & 0x30) == 0)) &&
      (g_current_container_record != 0)) {
    repopulate_container_grid_slots();
    refresh_container_view();
    return uVar1;
  }
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[slot]);
  return uVar1;
}



ushort *extract_clicked_backpack_item(int category, int subcategory, int quality, short slot)
{
  return extract_backpack_item_count(category,subcategory,quality,slot,0);
}



// was FUN_00045a7c -- the same extract as extract_clicked_backpack_item, but for firing one piece of
// ammunition. The decompile showed the two as identical because the extra argument (how many to take)
// was lost: with 0 the whole stack was extracted and then fired as a single projectile, so shooting a
// stack of arrows used the entire stack up. Take exactly one, leaving the rest in the slot.
ushort *extract_ammo_and_refresh(int category, int subcategory, int quality, short slot)
{
  return extract_backpack_item_count(category,subcategory,quality,slot,1);
}



// was FUN_00045b20 -- thin wrapper: extracts the object matching param_1/param_2/param_3
// (category/subcategory/quality, <0 = any) from slot param_4 via extract_matching_object_from_slot,
// then refreshes carry-weight/UI state via refresh_player_equipment_effects().
ushort *extract_and_refresh_slot_item(int category, int subcategory, int quality, short slot, ushort flag)
{
  ushort *uVar1;

  uVar1 = extract_matching_object_from_slot(category,subcategory,quality,slot,flag);
  refresh_player_equipment_effects();
  return uVar1;
}



// was FUN_00045b48 -- finds the first object matching the category/ subcategory/quality filters
// (param_1/param_2/param_3, <0 = any) in inventory slot param_4 (searched directly, or via
// find_object_in_link_chain for nested containers)...
ushort *extract_matching_object_from_slot(int category, int subcategory, int quality, short slot, ushort flag)
{
  ushort uVar1;
  short sVar2;
  uw_object_hdr_t *puVar3;
  int iVar4;
  char *iVar5;
  uint uVar6;
  ushort uVar7;
  uint uVar8;
  int iVar9;
  uw_object_hdr_t *pbVar10;
  byte *pbVar11;
  char *local_28;
  
  iVar4 = (int)slot;
  pbVar11 = &g_equipped_items + iVar4 * 2;
  pbVar10 = (uw_object_hdr_t *)0x0;
  puVar3 = resolve_object_link(pbVar11);
  if (puVar3 != (uw_object_hdr_t *)0x0) {
    if (iVar4 < 0x13) {
      local_28 = (char *)g_player_object;
    }
    else {
      /* Was `resolve_object_link(g_current_container_record + 8)` -- g_current_container_record is
         a small (12-byte) ce_malloc heap allocation, nowhere near the object arena buffer
         resolve_object_link's own bounds guard checks against (see its own comment)... */
      local_28 = resolve_object_link(&g_current_container_link);
    }
    uVar6 = (uint)(short)category;
    uVar7 = (ushort)subcategory;
    uVar1 = (ushort)quality;
    if ((((((int)uVar6 < 0) && ((short)uVar7 < 0)) && ((short)uVar1 < 0)) ||
        (((((int)uVar6 < 0 || ((puVar3->object_id >> 6 & 7) == uVar6)) && (((short)uVar7 < 0 || ((puVar3->object_id >> 4 & 3) == uVar7)))) && (((short)uVar1 < 0 || ((puVar3->object_id & 0xf) == uVar1)))))) ||
        (puVar3 = (uw_object_hdr_t *)find_object_in_link_chain(category, subcategory, quality, &local_28), puVar3 != (uw_object_hdr_t *)0x0)
       ) {
      if (((flag != 0) && (puVar3->is_quant != 0)) && ((puVar3->link & 0x200) == 0)) {
        uVar7 = puVar3->link;
        if ((1 < uVar7) && ((short)flag < (short)uVar7)) {
          pbVar10 = alloc_object_slot(0);
          pbVar10->type_flags = puVar3->type_flags;
          pbVar10->position_word = puVar3->position_word;
          pbVar10->chain_word = puVar3->chain_word;
          pbVar10->link_word = puVar3->link_word;
          uVar6 = (uint)flag;
          uVar8 = uVar6 * 0x3ff + (uint)uVar7;
          pbVar10->link = uVar8 & 0x3ff;
          puVar3->link = uVar6 & 0x3ff;
          object_list_insert_head(&puVar3->chain_word, pbVar10);
        }
      }
      if ((local_28 == (char *)g_player_object) || (0x13 < iVar4)) {
        if (pbVar10 == (uw_object_hdr_t *)0x0) {
          uVar7 = *pbVar11 & 0x3f;
        }
        else {
          sVar2 = encode_object_slot_index(pbVar10);
          uVar7 = *pbVar11 & 0x3f | sVar2 << 6;
        }
        *pbVar11 = (byte)uVar7;
        (&DAT_00202951)[iVar4 * 2] = (char)(uVar7 >> 8);
      }
      object_list_unlink(&((uw_object_hdr_t *)local_28)->link_word, puVar3);
      iVar4 = calculate_object_weight(puVar3);
      g_player_carry_weight = g_player_carry_weight - (short)iVar4;
      if (g_current_container_record == 0) {
        return (ushort *)puVar3;
      }
      sVar2 = encode_object_slot_index(local_28);
      if ((uint)(*(ushort *)(g_current_container_record + 8) >> 6) != (int)sVar2) {
        return (ushort *)puVar3;
      }
      sVar2 = encode_object_slot_index(puVar3);
      iVar9 = 0x14;
      do {
        if ((uint)(*(ushort *)(&g_equipped_items + iVar9 * 2) >> 6) == (int)sVar2) {
          if (pbVar10 == (uw_object_hdr_t *)0x0) {
            uVar6 = 0;
          }
          else {
            sVar2 = encode_object_slot_index(pbVar10);
            uVar6 = (uint)sVar2;
          }
          iVar9 = (int)(short)iVar9;
          (&g_equipped_items)[iVar9 * 2] =
               (&g_equipped_items)[iVar9 * 2] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
          iVar5 = g_current_container_record;
          (&DAT_00202951)[iVar9 * 2] = (char)((uVar6 << 0x16) >> 0x18);
          /* Legacy truncated "prev" walk -- same fix as
             place_object_in_backpack_slot's sibling copy above (search
             "still broken for genuine container nesting"). */
          for (; iVar5 != 0; iVar5 = *(char **)(iVar5 + 0x14)) {
            iVar9 = *(short *)(iVar5 + 10) - iVar4;
            *(char *)(iVar5 + 10) = (char)iVar9;
            *(char *)(iVar5 + 0xb) = (char)((uint)iVar9 >> 8);
          }
          return (ushort *)puVar3;
        }
        iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      } while (iVar9 < 0x1c);
      return (ushort *)puVar3;
    }
  }
  return (ushort *)0x0;
}


















/* Was copying "armor_f" into acStack_85c88, a 547936-byte buffer Ghidra misattributed here (the
   same stack-frame-size-miscalculation artifact already fixed in dispatch_object_action's
   acStack_85978 and check_object_fits_in_slot's acStack_84f64)... */
// was FUN_00046b88
int load_armor_overlay_frame(int frame_index, int variant)
{
  char armor_name[8];
  int i;

  for (i = 0; i < 6; i++) {
    armor_name[i] = s_armor_f_00085c60[i];
  }
  armor_name[6] = 0x6d;
  if ((*(byte *)(DAT_00086df8 + 100) & 2) == 2) {
    armor_name[6] = 0x66;
  }
  armor_name[7] = '\0';
  reload_single_grtile_entry(frame_index + 0x2091,armor_name,variant);
  return 1;
}



// was FUN_00046bfc
void redraw_armor_overlay_widgets()

{
  byte *pbVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;

  if (g_active_hud_panel == '\0') {
    decrement_cursor_hide_depth();
    if (DAT_00085c54 != 0) {
      screen_backup_save();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xf0,0xb,0x13b,0x76);
      screen_backup_restore_rect(0xf0,0xb,0x13b,0x76);
    }
    g_blit_transparent_mode = 1;
    draw_sprite_by_id(0x2091,(int)g_inv_hotspot_draw_x,(int)g_inv_hotspot_draw_y,g_inv_hotspot_dirty_h,g_inv_hotspot_dirty_w);
    iVar4 = 1;
    g_blit_transparent_mode = 1;
    do {
      if ((*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar4] * 2) & 0xffc0) != 0) {
        pbVar1 = (byte *)resolve_object_link((ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar4] * 2));
        uVar3 = ((uw_object_hdr_t *)pbVar1)->object_id & 0x1f;
        if ((uint)(int)(short)uVar3 < 0xf) {
          uVar2 = (((uw_object_hdr_t *)pbVar1)->quality & 0x30) >> 4;
        }
        else {
          uVar2 = 3;
        }
        if (((int)(short)uVar3 + 1U != (int)*(char *)((char *)&DAT_00202988 + iVar4)) ||
           ((short)uVar2 + 1 != (int)*(char *)((char *)&DAT_002028e0 + iVar4))) {
          *(char *)((char *)&DAT_00202988 + iVar4) = (char)uVar3 + '\x01';
          *(char *)((char *)&DAT_002028e0 + iVar4) = (char)uVar2 + '\x01';
          load_armor_overlay_frame(iVar4,uVar2 * 0xf + uVar3);
        }
        draw_sprite_by_id(iVar4 + 0x2091,(int)(&g_inv_hotspot_draw_x)[iVar4 * 7],(int)(&g_inv_hotspot_draw_y)[iVar4 * 7],
                     (&g_inv_hotspot_dirty_h)[iVar4 * 0xe],(&g_inv_hotspot_dirty_w)[iVar4 * 0xe]);
      }
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 6);
    g_blit_transparent_mode = 0;
    /* Widgets 10/11 (the finger/ring slots, per g_inventory_hotspot_table's own comment) are
       handled as a one-off pair here instead of folding into the loop above like widgets 1-5 do... */
    capture_framebuffer_rect_to_grtile((&DAT_002028e8)[11],(int)(&g_inv_hotspot_draw_x)[11 * 7],
                 (int)(&g_inv_hotspot_draw_y)[11 * 7],(&g_inv_hotspot_dirty_w)[11 * 0xe] - 5,
                 (&g_inv_hotspot_dirty_h)[11 * 0xe]);
    capture_framebuffer_rect_to_grtile((&DAT_002028e8)[10],(&g_inv_hotspot_draw_x)[10 * 7] + 5,
                 (int)(&g_inv_hotspot_draw_y)[10 * 7],(&g_inv_hotspot_dirty_w)[10 * 0xe] - 5,
                 (&g_inv_hotspot_dirty_h)[10 * 0xe]);
    if (((DAT_00202962 & 0xffc0) != 0) || ((DAT_00202964 & 0xffc0) != 0)) {
      redraw_inventory_widget_range(10,0xb);
    }
    if (DAT_00085c54 != 0) {
      screen_backup_save();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xf0,0xb,0x13b,0x76);
      screen_backup_restore_rect(0xf0,0xb,0x13b,0x76);
    }
    iVar4 = update_carry_weight_display(1);
    if (iVar4 != 0) {
      select_active_font(s_font5x6p_sys_0008430c);
    }
    cursor_show_idle_tick();
  }
  return;
}



// was FUN_00046ff4
void swap_cursor_and_slot_item(int slot, int mode)
{
  int iVar1;
  void *slot_item;
  uint uVar2;
  bool bVar3;
  short local_20;
  
  bVar3 = g_selected_object != (char *)0x0;
  if (mode == 0) {
    uVar2 = (uint)local_20;
  }
  else {
    slot_item = get_equipped_item_at_slot(slot);
    uVar2 = encode_object_slot_index(resolve_object_link((char *)slot_item + 4));  /* ARM 0x47030: r0 passthrough */
  }
  g_selected_object = (char *)extract_matching_object_from_slot(0xffffffff,0xffffffff,0xffffffff,slot,0);
  if (g_selected_object != (char *)0x0) {
    if (mode != 0) {
      iVar1 = (int)(short)slot;
      (&g_equipped_items)[iVar1 * 2] = (&g_equipped_items)[iVar1 * 2] & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
      (&DAT_00202951)[iVar1 * 2] = (char)((uVar2 << 0x16) >> 0x18);
      refresh_player_equipment_effects();
    }
    decrement_cursor_hide_depth();
    if (bVar3) {
      pop_cursor_icon(0);
    }
    /* Was `*g_selected_object & 0x1ff` -- g_selected_object is declared `char *` (a single signed
       byte, used elsewhere in this file for genuine byte-level access), but an object's own id is a
       9-bit field spanning 2 bytes, needing a real `ushort` read. */
    push_cursor_icon(*(ushort *)g_selected_object & 0x1ff);
    cursor_show_idle_tick();
    refresh_player_equipment_effects();
  }
}



// was FUN_000470fc -- prompts "Move how many?" (s_Move_how_many__00085c68) for splitting a stacked
// object (param_1): splits off and returns a new object with the entered quantity (via
// alloc_object_slot), or returns param_1 itself if the whole stack was taken, or NULL on cancel.
byte *prompt_split_object_stack(byte *object)
{
  ushort uVar1;
  short sVar2;
  int iVar3;
  undefined1 *puVar4;
  uint uVar5;
  /* Was two separate locals (`local_1c = 0x31; local_1b = 0;`) passed as `&local_1c` -- a 2-byte "1\0" string
     whose terminator was not guaranteed to follow the '1' on this host's stack, so the prompt could show
     leftover bytes after the default "1" ("Move how many? 12"). */
  char default_text[2] = { '1', '\0' };
  undefined1 auStack_18 [4];
  
  puVar4 = (undefined1 *)0x0;
  uVar1 = ((uw_object_hdr_t *)object)->link;
  sVar2 = scroll_text_entry_prompt(s_Move_how_many__00085c68,default_text,auStack_18,0,3);
  if ((sVar2 != 0x1b) && (sVar2 != 3)) {
    if ((sVar2 == 0) || (3 < sVar2)) {
      sVar2 = ce_atoi(auStack_18);
      uVar5 = (int)sVar2;
      if ((int)(short)uVar1 < (int)sVar2) {
        uVar5 = (uint)uVar1;
      }
    }
    else {
      uVar5 = 1;
      if ((sVar2 != 1) && (sVar2 == 2)) {
        uVar5 = (uint)uVar1;
      }
      echo_number_to_scroll(uVar5);
    }
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    if (((int)(short)uVar5 != 0) &&
       (puVar4 = object, (int)(short)uVar5 != (uint)((uw_object_hdr_t *)object)->link)) {
      uw_object_hdr_t *whole = (uw_object_hdr_t *)object;
      uw_object_hdr_t *split;
      puVar4 = (undefined1 *)alloc_object_slot(0);
      split = (uw_object_hdr_t *)puVar4;
      *split = *whole;
      split->link = whole->link - uVar5;
      whole->link = uVar5;
    }
  }
  wait_for_key_or_mouse_move(1);
  return puVar4;
}


// was FUN_0004506c
/* Was `undefined4 param_1` -- same 64-bit-pointer-truncated-through-a- 32-bit-typedef-parameter
   bug as place_held_item_in_empty_slot's identical fix just above (and sum_container_weight's,
   elsewhere in this file): param_1 is dereferenced further down... */
int place_object_in_backpack_slot(ushort *pack_object, short slot)
{
  int iVar1;
  short sVar2;
  int iVar3;
  char *iVar4;
  /* Was `int iVar5;` -- truncated g_current_container_record's real 64-bit pointer on assignment
     (`iVar5 = g_current_container_record;` just below), then dereferenced the truncated wild value
     at `*(short *)(iVar5 + 10)`. */
  char *iVar5;
  char *container_rec;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;

  iVar4 = (char *)g_player_object;
  iVar1 = (int)slot;
  uVar8 = 0;  /* was `pack_object` (a pointer); sVar2 only matters when iVar1 == -1 (1) -- otherwise it is overwritten below */
  if (iVar1 == -1) {
    uVar8 = 1;
  }
  sVar2 = (short)uVar8;
  uVar8 = 0;
  if (iVar1 != -1) {
    /* Dropped arguments: check_object_fits_in_slot's declared signature is (object, slot_index) and
       dereferences its first argument immediately -- called bare here (same idiom as the
       handle_backpack_slot_click/place_held_item_in_empty_slot chain just above it)... */
    sVar2 = check_object_fits_in_slot(pack_object, slot);
  }
  if (sVar2 < 1) {
    if (sVar2 == -1) {
      uVar8 = 0;
    }
  }
  else {
    iVar3 = calculate_object_weight((uw_object_hdr_t *)pack_object);
    if (-1 < iVar1) {
      if (0x12 < iVar1) {
        /* Was `resolve_object_link(g_current_container_record + 8)` -- same bug, same fix, as
           extract_matching_object_from_slot's and check_object_fits_in_slot's own identical calls
           (see their comments)... */
        iVar4 = resolve_object_link(&g_current_container_link);
        /* Was walking the ancestor chain via the legacy 4-byte "prev" field (CONCAT13/12/11 of
           bytes 4-7) -- only ever a truncated half of a real 64-bit pointer (see
           open_backpack_container's record-widening comment)... */
        for (iVar5 = g_current_container_record; iVar5 != 0;
            iVar5 = *(char **)(iVar5 + 0x14)) {
          iVar7 = *(short *)(iVar5 + 10) + iVar3;
          *(char *)(iVar5 + 10) = (char)iVar7;
          *(char *)(iVar5 + 0xb) = (char)((uint)iVar7 >> 8);
        }
      }
      uVar6 = encode_object_slot_index(pack_object);
      (&g_equipped_items)[iVar1 * 2] = (&g_equipped_items)[iVar1 * 2] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
      (&DAT_00202951)[iVar1 * 2] = (char)((uVar6 << 0x16) >> 0x18);
    }
    object_list_append_tail(iVar4 + 6,pack_object);
    g_player_carry_weight = g_player_carry_weight + (short)iVar3;
    uVar8 = 1;
  }
  refresh_player_equipment_effects();
  return uVar8;
}



// was FUN_000451b0 -- given an object, find which currently-displayed
// backpack-grid widget shows it (or allocate it one if it isn't shown
// yet).
/* Was declared with no parameters at all, and its body called encode_object_slot_index() bare --
   but every one of its 4 real call sites passes a real object pointer, so this silently relied on
   ARM register leftover... */
int find_or_assign_object_widget(void *object_ptr)
{
  ushort *object = (ushort *)object_ptr;
  char cVar1;
  undefined4 uVar2;
  ushort *puVar3;
  ushort *iVar4;
  ushort *puVar5;
  int iVar6;

  uVar2 = encode_object_slot_index((char *)object);
  iVar6 = 0;
  do {
    cVar1 = (&g_backpack_widget_to_slot)[iVar6];
    puVar5 = (ushort *)(&g_equipped_items + (short)cVar1 * 2);
    if ((*puVar5 & 0xffc0) != 0) {
      if ((uint)(*puVar5 >> 6) == (int)(short)uVar2) {
        return (int)cVar1;
      }
      puVar3 = (ushort *)resolve_object_link(puVar5);
      if ((((((uw_object_hdr_t *)puVar3)->is_quant == 0) && (g_current_container_record == 0)) ||
           ((((uw_object_hdr_t *)puVar3)->is_quant == 0 && (((*(ushort *)(g_current_container_record + 8) ^ *puVar5) & 0xffc0) != 0)))
          ) && (iVar4 = find_object_by_encoded_slot_in_chain(puVar3 + 3,1,uVar2), iVar4 != 0)) {
        return (short)cVar1 * -0x10000 >> 0x10;
      }
    }
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    if (0x13 < iVar6) {
      return -1;
    }
  } while( true );
}






// was FUN_000472c4
uint check_object_fits_in_slot(ushort *object, int slot)
{
  char *wptr_31150;
  ushort uVar1;
  uint uVar2;
  char cVar3;
  byte bVar4;
  ushort uVar5;
  byte bVar6;
  byte bVar7;
  uint uVar8;
  short sVar9;
  undefined1 *puVar10;
  uw_object_hdr_t *puVar11;
  uw_object_hdr_t *header = (uw_object_hdr_t *)object;
  int iVar12;
  uw_armor_type_props_t *effect_ptr;
  char *container_rec;
  uw_object_hdr_t *pbVar13;
  char *pcVar14;
  int iVar15;
  bool bVar16;
  /* Was 544528 bytes -- same Ghidra stack-frame-size-miscalculation artifact already fixed in
     dispatch_object_action's acStack_85978 (see its own comment)... */
  char acStack_84f64 [64];
  short local_54 [2];
  int local_50;
  uint local_4c;
  const uw_object_type_props_t *local_48;
  char acStack_40 [28];
  char *_parentRec;
  undefined2 _savedLink;

  local_4c = (uint)(short)header->object_id;
  local_48 = &g_object_type_props[local_4c];
  uVar1 = (header->object_id >> 6) & 7;
  uVar5 = (header->object_id >> 4) & 3;
  bVar4 = header->object_id & 0xf;
  iVar15 = (int)(short)slot;
  g_scratch_object_ptr = header;
  if (iVar15 == 0x13) {
    if (g_current_container_record == 0) {
      return 0;
    }
    /* Both `g_current_container_record + 4` reads below were the legacy 4-byte "prev" field -- only
       ever a truncated half of a real 64-bit pointer (same class as the whole Update-29 sweep --
       search "still broken for genuine container nesting"). */
    _parentRec = *(char **)(g_current_container_record + 0x14);
    if (_parentRec == 0) {
      iVar15 = 0xb;
      do {
        if ((*(ushort *)(&g_equipped_items + iVar15 * 2) & 0xffc0) == 0) break;
        iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
      } while (iVar15 < 0x13);
      if ((short)iVar15 < 0x13) {
        return 1;
      }
      print_scroll_message_by_id(0x102);
      if ((short)iVar15 < 0x13) {
        return 1;
      }
      return 0;
    }
    _savedLink = g_current_container_link;
    g_current_container_link = *(undefined2 *)(_parentRec + 8);
    puVar11 = resolve_object_link(&g_current_container_link);
    g_current_container_link = _savedLink;
  }
  else {
    if (iVar15 < 0x14) {
      puVar10 = &g_equipped_items + iVar15 * 2;
      puVar11 = resolve_object_link(puVar10);
    }
    else {
      puVar11 = resolve_object_link(&g_equipped_items + iVar15 * 2);
      if ((puVar11 == (uw_object_hdr_t *)0x0) || ((puVar11->object_id & 0x1f0) != 0x80)) {
        puVar11 = resolve_object_link(&g_current_container_link);
      }
    }
  }
  if (iVar15 < 5) {
    if (uVar1 != 0) {
      if (iVar15 != 0) {
        return 0;
      }
      sVar9 = use_food_item(g_player_object,object,0);
      if (sVar9 < 1) {
        return 0;
      }
      return 0xffffffff;
    }
    if ((header->object_id & 0x30) < 0x20) {
      return 0;
    }
    effect_ptr = (uw_armor_type_props_t *)get_scanned_object_class_effect_ptr();
    if (iVar15 == 0) {
      bVar16 = (char)effect_ptr->equipment_slot == '\b';
    }
    else if (iVar15 == 1) {
      bVar16 = (char)effect_ptr->equipment_slot == '\x01';
    }
    else if (iVar15 == 2) {
      bVar16 = (char)effect_ptr->equipment_slot == '\x04';
    }
    else if (iVar15 == 3) {
      bVar16 = (char)effect_ptr->equipment_slot == '\x03';
    }
    else {
      if (iVar15 != 4) {
        return 0;
      }
      bVar16 = (char)effect_ptr->equipment_slot == '\x05';
    }
LAB_00047a68:
    if (!bVar16) {
      return 0;
    }
    return 1;
  }
  if ((iVar15 == 9) || (iVar15 == 10)) {
    if (uVar1 != 0) {
      return 0;
    }
    if ((header->object_id & 0x30) < 0x20) {
      return 0;
    }
    effect_ptr = (uw_armor_type_props_t *)get_scanned_object_class_effect_ptr();
    bVar16 = (char)effect_ptr->equipment_slot == '\t';
    goto LAB_00047a68;
  }
  if ((iVar15 == 8 - (*(byte *)(DAT_00086df8 + 100) & 1)) && ((uVar1 == 0 && (uVar5 == 0)))) {
    if ((puVar11 != (uw_object_hdr_t *)0x0) && ((puVar11->object_id) == local_4c)) {
      return 0;
    }
    if (((header->is_quant != 0) && (header->link < 0x200)) &&
       (1 < header->link)) {
      return 0;
    }
  }
  else {
    local_50 = (int)(short)uVar1;
    if ((local_50 == 2) && (((uVar5 == 1 && (3 < bVar4)) && (bVar4 < 8)))) {
      iVar12 = 0;
      do {
        if (iVar15 == (char)(&g_light_source_slots)[iVar12]) {
          return 1;
        }
        iVar12 = (iVar12 + 1) * 0x10000 >> 0x10;
      } while (iVar12 < 4);
      uVar1 = header->type_flags;
      bVar6 = (byte)uVar1;
      header->object_id = (uVar1 & 0x1f0) | ((bVar4 - 4) & 0xf);
      set_ambient_bias_without_light(0);
      sVar9 = check_object_fits_in_slot(object,slot);
      if (sVar9 != 0) {
        return 1;
      }
      uVar1 = header->type_flags;
      bVar6 = (byte)uVar1;
      header->object_id = (uVar1 & 0x1f0) | (bVar4 & 0xf);
      return 0;
    }
  }
  local_50 = (int)(short)uVar1;
  if ((puVar11 == (uw_object_hdr_t *)0x0) || ((puVar11->object_id & 0x1f0) != 0x80)) {
LAB_00047a0c:
    return local_48->flags >> 5 & 1;
  }
  bVar6 = 1;
  local_54[0] = calculate_object_weight(header);
  container_rec = g_current_container_record;
  bVar7 = 1;
  if (0x13 < iVar15) {
    /* Was `container_rec = *(int *)(container_rec + 4)` walking the legacy 4-byte "prev" field (truncated half of
       a real 64-bit pointer, same class as this whole file's Update-29 sweep)... */
    for (; bVar6 = bVar7, container_rec != 0; container_rec = *(char **)(container_rec + 0x14)) {
      _savedLink = g_current_container_link;
      g_current_container_link = *(undefined2 *)(container_rec + 8);
      pbVar13 = resolve_object_link(&g_current_container_link);
      g_current_container_link = _savedLink;
      if (pbVar13 == (uw_object_hdr_t *)0x0) {
        bVar7 = 1;
      }
      else if (((short)(ushort)(byte) g_container_type_props[(pbVar13->object_id & 0xf)].capacity == 0) ||
               (bVar7 = 0,
                (int)*(short *)(container_rec + 10) + (int)local_54[0] <=
                (int)(short)(ushort)(byte) g_container_type_props[(pbVar13->object_id & 0xf)].capacity)) {
        bVar7 = 1;
      }
      bVar7 = bVar6 & bVar7;
    }
  }
  sum_container_weight(&puVar11->link_word,local_54);
  uVar8 = local_4c;
  iVar15 = (puVar11->object_id & 0xf) * 3;
  if (((byte) g_container_type_props[(iVar15) / 3].capacity == 0) ||
      (bVar7 = 0, local_54[0] <= (short)(ushort)(byte) g_container_type_props[(iVar15) / 3].capacity)) {
    bVar7 = 1;
  }
  if (!(bool)(bVar7 & bVar6)) {
    sVar9 = build_object_display_name(acStack_40,puVar11,0,0);
    if (sVar9 == 0) {
      pcVar14 = s_UNNAMED_00084f24;
    wptr_31150 = acStack_84f64;
      do {
        cVar3 = *pcVar14;
        *wptr_31150 = cVar3; wptr_31150 = wptr_31150 + 1;
        pcVar14 = pcVar14 + 1;
      } while (cVar3 != '\0');
    }
    message_scroll_print_wrapped(&DAT_00085c88);
    message_scroll_print_wrapped(acStack_40);
    message_scroll_print_wrapped(s_is_too_full__00085c78);
    return 0;
  }
  uVar2 = (uint)(short)g_container_type_props[(iVar15) / 3].acceptance_mask;
  /* The signed acceptance mask shares the row with capacity;
     load_light_food_effect_tables fills both fields from OBJECTS.DAT. */
  if ((int)uVar2 <= 0) goto LAB_00047a0c;
  if ((int)uVar2 < 0x200) {
    if ((local_4c != uVar2) && (print_scroll_message_by_id(0xf8), uVar8 != uVar2)) {
      return 0;
    }
    return 1;
  }
  if (uVar2 == 0x200) {
    if ((local_50 != 3) || ((uVar5 != 3 && ((uVar5 != 2 || (bVar4 < 8)))))) {
      print_scroll_message_by_id(0xf7);
      return 0;
    }
  }
  else if (uVar2 == 0x201) {
    if (((local_50 != 0) || (uVar5 != 1)) || (2 < bVar4)) goto LAB_000479b4;
  }
  else if (uVar2 == 0x202) {
    if (((local_50 != 4) || (uVar5 != 3)) || (bVar4 < 8)) goto LAB_000479b4;
  }
  else if ((uVar2 != 0x203) ||
          (((local_50 != 2 || (uVar5 != 3)) &&
           ((local_4c != 0xce &&
            ((((local_4c != 0xcf && (local_4c != 0x92)) && (local_4c != 0x125)) &&
             ((local_4c != 0x11b && (local_4c != 0xd9)))))))))) {
LAB_000479b4:
    sVar9 = 0;
    print_scroll_message_by_id(0xf8);
    goto LAB_000479c0;
  }
  sVar9 = 1;
LAB_000479c0:
  return (int)sVar9;
}



// was FUN_00047a7c
void handle_backpack_slot_click(short slot)
{
  int iVar1;

  /* Dropped arguments: both branches call a 2-param function with only one arg --
     place_held_item_in_empty_slot/handle_backpack_slot_interact's own declared signatures take
     (held_object, slot_index)... */
  if ((*(ushort *)(&g_equipped_items + slot * 2) & 0xffc0) == 0) {
    iVar1 = place_held_item_in_empty_slot(g_selected_object, slot);
  }
  else {
    iVar1 = handle_backpack_slot_interact(g_selected_object, slot);
  }
  if (iVar1 != 0) {
    g_selected_object = 0;
  }
}



// was FUN_00047ae0
/* Was `undefined4 param_1` -- a 64-bit pointer truncates to its low 32 bits the moment a caller
   passes it to a function whose own signature declares this narrower type (matches
   sum_container_weight's identical fix elsewhere in this file). */
int place_held_item_in_empty_slot(void *held_object_ptr, short target_slot)
{
  ushort *held_object = (ushort *)held_object_ptr;
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = (int)target_slot;
  uVar3 = 0;
  if (iVar1 == 0x13) {
    uVar3 = 0;
  }
  else {
    /* Dropped argument: place_object_in_backpack_slot's own declared signature takes (object,
       slot_index) and writes the object's link into &g_equipped_items + slot_index*2 -- the real
       "place held item into this backpack slot" primitive... */
    iVar2 = place_object_in_backpack_slot(held_object, target_slot);
    if (iVar2 != 0) {
      if (iVar1 < 0x13) {
        redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar1]);
      }
      else {
        repopulate_container_grid_slots();
        refresh_container_view();
      }
      uVar3 = 1;
    }
  }
  return uVar3;
}






// WARNING: Removing unreachable block (ram,0x00047f40)

// was FUN_00047cfc
int handle_backpack_slot_interact(void *object_ptr, uint slot)
{
  ushort *object = (ushort *)object_ptr;
  int iVar1;
  byte bVar2;
  short sVar3;
  ushort *puVar4;
  int iVar5;
  char *container_rec;
  undefined4 uVar6;
  ushort *puVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  undefined4 uVar11;
  bool bVar12;
  
  iVar1 = (int)(short)slot;
  uVar11 = 0;
  puVar4 = (ushort *)resolve_object_link(&g_equipped_items + iVar1 * 2);
  if (((*puVar4 & 0x1c0) == 0x80) && ((*puVar4 & 0x30) == 0)) {
    uVar11 = auto_place_in_container(object,slot);
    refresh_player_equipment_effects();
    return uVar11;
  }
  iVar5 = objects_can_stack(object,puVar4);
  if (iVar5 == 0) {
    uVar6 = objects_are_combinable(object,puVar4);
    if ((short)uVar6 < 0) {
      if (iVar1 < 0x13) {
        puVar4 = (ushort *)extract_and_refresh_slot_item(0xffffffff,0xffffffff,0xffffffff,slot,0);
        iVar5 = place_held_item_in_empty_slot(object,slot);
        if (iVar5 == 0) {
          place_held_item_in_empty_slot(puVar4,slot);
          puVar4 = (ushort *)g_selected_object;
        }
        g_selected_object = (char *)puVar4;
        if (g_selected_object != (char *)0x0) {
          pop_cursor_icon(0);
          /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
             own identical fix comment. */
          push_cursor_icon(*(ushort *)g_selected_object & 0x1ff);
        }
      }
      else {
        place_object_in_equipment_slot(object,slot);
      }
    }
    else {
      /* Was a dropped argument -- spawn_combined_object's own combination
         index, matching objects_are_combinable's return value (uVar6)
         used at every other call site in this branch. */
      puVar7 = (ushort *)spawn_combined_object(uVar6);
      if (puVar7 == (ushort *)0x0) {
        return 0;
      }
      iVar5 = is_object_consumed_in_combination(object,uVar6);
      if (iVar5 == 1) {
        discard_misplaced_object(0,object,1);
        g_cursor_holding_state = 1;
        g_selected_object = (char *)puVar7;
        pop_cursor_icon(3);
        /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
           own identical fix comment. */
        push_cursor_icon(*(ushort *)g_selected_object & 0x1ff);
      }
      iVar8 = is_object_consumed_in_combination(puVar4,uVar6);
      if (iVar8 != 0) {
        if (iVar5 == 0) {
          place_held_item_in_empty_slot(puVar7,slot);
        }
        deplete_object_count(puVar4);
        discard_misplaced_object(0,puVar4,1);
      }
      uVar11 = 0;
    }
  }
  else {
    sVar3 = check_object_fits_in_slot(object,slot);
    if (sVar3 != 1) {
      return 0;
    }
    uVar9 = (*(byte *)((char *)object + 1) & 0x80) << 8;
    bVar12 = (*(byte *)((char *)object + 1) & 0x80) != 0;
    if (bVar12) {
      uVar9 = (uint)object[3];
    }
    if (bVar12) {
      slot = uVar9 >> 6;
    }
    if (!bVar12) {
      slot = 1;
    }
    if ((*(byte *)((char *)puVar4 + 1) & 0x80) == 0) {
      *(char *)puVar4 = (char)*puVar4;
      *(byte *)((char *)puVar4 + 1) = *(byte *)((char *)puVar4 + 1) | 0x80;
      *(byte *)(puVar4 + 3) = (byte)puVar4[3] & 0x3f | 0x40;
      *(undefined1 *)((char *)puVar4 + 7) = 0;
    }
    iVar8 = (g_object_type_props[(*object & 0x1ff)].unit_weight) * slot;
    container_rec = g_current_container_record;
    /* Legacy truncated "prev" walk -- same fix as
       place_object_in_backpack_slot's sibling copy (search "still
       broken for genuine container nesting"). */
    if (0x13 < iVar1) {
      for (; container_rec != 0; container_rec = *(char **)(container_rec + 0x14)) {
        iVar10 = *(short *)(container_rec + 10) + iVar8;
        *(char *)(container_rec + 10) = (char)iVar10;
        *(char *)(container_rec + 0xb) = (char)((uint)iVar10 >> 8);
      }
    }
    g_player_carry_weight = g_player_carry_weight + (short)iVar8;
    refresh_player_equipment_effects();
    iVar5 = (puVar4[3] & 0xffc0) + slot * 0x40;
    bVar2 = (byte)puVar4[2];
    *(byte *)(puVar4 + 3) = (byte)(uintptr_t)iVar5 ^ (byte)puVar4[3] & 0x3f;
    *(char *)((char *)puVar4 + 7) = (char)((uint)(uintptr_t)iVar5 >> 8);
    *(byte *)(puVar4 + 2) =
         (bVar2 ^ (byte)((int)(((byte)object[2] & 0x3f) +
                              (CONCAT11(*(undefined1 *)((char *)puVar4 + 5),bVar2) & 0x3f)) >> 1)) &
         0x3f ^ bVar2;
    *(undefined1 *)((char *)puVar4 + 5) = *(undefined1 *)((char *)puVar4 + 5);
    free_object_slot(object);
    uVar11 = 1;
  }
  redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar1]);
  return uVar11;
}


// was FUN_00042870
void handle_object_drop_target(short widget)
{
  ushort *puVar1;
  int iVar2;
  ushort *puVar2;
  ushort uVar3;
  bool bVar4;

  bVar4 = g_selected_object != 0;
  iVar2 = (int)widget;
  if (7 < iVar2) {
    if (iVar2 < 10) {
      if (iVar2 == 9 - (*(byte *)(DAT_00086df8 + 100) & 1)) {
        puVar1 = (ushort *)resolve_object_link(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar2] * 2);
        /* Was missing a NULL check -- resolve_object_link legitimately returns 0 for an empty slot
           (its own link word has no object-table bits set, see its own comment), and every fresh
           character's weapon-hand slot IS empty by default (confirmed live). */
        if ((puVar1 != 0) && (uVar3 = ((uw_object_hdr_t *)puVar1)->object_id,
                              ((((((uw_object_hdr_t *)puVar1)->object_id & 0x1f0) == 0) || (uVar3 == 0x18)) || (uVar3 == 0x19)) ||
                              ((uVar3 == 0x1a || (uVar3 == 0x1f))))) {
          toggle_weapon_ready();
          goto LAB_00042a10;
        }
      }
    }
    else {
      if (iVar2 == 0x14) {
        /* Widget 20, the real "leave container" indicator -- see DAT_00085c4c's own comment for the
           display side. */
        if (g_selected_object != (char *)0x0) {
          if (auto_place_in_container(g_selected_object, 0x13) != 0) {
            g_selected_object = (char *)0x0;
            g_cursor_holding_state = 0;
            pop_cursor_icon(3);
          }
          refresh_player_equipment_effects();
          if (g_opts.container_autoclose_on_drag_out) {
            leave_nested_container_level();
          }
          else {
            redraw_inventory_widget_range(0xc,0x13);
          }
        }
        else {
          leave_nested_container_level();
        }
        /* Same "drain the still-pending click" protection the original 3 copies of this logic each
           had -- see their own history: without it, leave_nested_container_level could fire 2-3
           times per real single click and pop more than one level. */
        wait_for_click_release(1);
        goto LAB_00042a10;
      }
      if (iVar2 == 0x15) {
        scroll_container_grid_up();
        goto LAB_00042a10;
      }
      if (iVar2 == 0x16) {
        scroll_container_grid_down();
        goto LAB_00042a10;
      }
      if (iVar2 == 0x17) {
        if ((g_selected_object != 0) && (iVar2 = drop_held_object_near_player(g_selected_object,1), iVar2 != 0)) {
          iVar2 = object_or_contents_has_type(g_selected_object,0x126);
          if (iVar2 != 0) {
            *(byte *)(DAT_00086df8 + 0x5e) =
                 ((byte)DAT_00201b68 ^ *(byte *)(DAT_00086df8 + 0x5e)) & 0xf ^
                 *(byte *)(DAT_00086df8 + 0x5e);
          }
          g_selected_object = 0;
          refresh_player_equipment_effects();
        }
        goto LAB_00042a10;
      }
      if (iVar2 == 0x18) {
        handle_barter_player_slot_drop();
        goto LAB_00042a10;
      }
    }
  }
  /* Was reusing `iVar2` (an `int`) for resolve_object_link's real pointer return, truncating it to
     32 bits on this 64-bit host -- same "narrow local for a pointer" idiom already fixed at several
     call sites this session. */
  puVar2 = (ushort *)resolve_object_link(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar2] * 2);
  if (puVar2 != 0) {
    /* Page 4 of comobj's string data is the base object-name table,
       indexed directly by id (0x800 | id) -- same lookup the
       --dump-objects-file census tool already uses. */
    char *_useName = (char *)get_message_string(0x800 | (((uw_object_hdr_t *)puVar2)->object_id));
    DEBUG(INFO, "[inv] use item: id=0x%03x type=0x%03x name=\"%s\"\n",
          (unsigned)(((uw_object_hdr_t *)puVar2)->object_id),
          (unsigned)(((uw_object_hdr_t *)puVar2)->object_id & 0x1f0),
          (_useName && _useName[0]) ? _useName : "(unnamed)");
    use_object_on_target(g_player_object,puVar2,1);
  }
LAB_00042a10:
  if ((bVar4) && (g_selected_object == 0)) {
    pop_cursor_icon(3);
    g_cursor_holding_state = 0;
  }
}


// was FUN_0004a110 -- read the cursor position, derive an "arc" height/angle pair from it into
// DAT_00202a40/DAT_00202a3c (consumed by spawn_object_near_player when placing the new copy)...
bool compute_drop_aim_from_cursor()

{
  int iVar1;
  int iVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short local_10;
  short local_e;
  
  get_mouse_position(&local_10,&local_e);
  sVar3 = (short)(local_10 + -0x34);
  iVar1 = (local_10 + -0x34) * 0x10000 >> 0x10;
  if (0xac < iVar1) {
    sVar3 = 0xac;
  }
  sVar5 = (short)(0x85 - local_e);
  iVar2 = iVar1 + -0xac;
  if (iVar1 < 0xad) {
    iVar2 = iVar1;
  }
  if (iVar2 < 0) {
    sVar3 = 0;
  }
  iVar1 = (0x85 - local_e) * 0x10000 >> 0x10;
  if (0x71 < iVar1) {
    sVar5 = 0x71;
    iVar1 = iVar1 + -0x71;
  }
  if (iVar1 < 0) {
    sVar5 = 0;
  }
  sVar3 = ordint_divmod(0xd,(sVar3 + -0x56) * 5).quot;
  DAT_00202a40 = sVar3 + -1;
  sVar3 = ordint_divmod(6,sVar5 + -0x38).quot;
  /* Sign fix: DAT_00202a3c is "aim/launch angle, positive = up" -- confirmed by
     compute_vertical_aim_offset (src/ai.c), which assigns it directly from (target_height -
     npc_height), positive when the target is above. */
  sVar4 = -ordint_divmod(0x300,(int)DAT_0023beb4).quot;
  DAT_00202a3c = sVar3 + sVar4;
  return 0x24 < sVar5;
}

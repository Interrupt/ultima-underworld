/* Tile trap/link "type" effect dispatch: the classic-UW trap-type switch fired when a trap/link
   record's chain is triggered. Split out of uw.c (the original monolithic decompile) once its real
   role was confirmed. */
#include "headers/traps.h"
#include "headers/options.h"
#include <stdio.h>
#include <stdlib.h>

/* was a raw `iVar4 + 0x85638` absolute-address literal inside trigger_quest_milestone_cleanup_event
   (no declared global at all -- Ghidra never recovered this one), read as a 9-entry object-type-id
   table. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined1 DAT_00085638[10] = {
  0xde, 0xd1, 0xdb, 0xd2, 0xdc, 0xd5, 0xd8, 0xd4, 0xd3, 0xdd,
}; /* indices 1-9 are the ones actually read (index 0 unused) */
/* Ghidra rendered the embedded spaces as underscores and dropped the
   trailing newline. Real bytes at 0x85644 (ARM UU.exe .data):
   "The book explodes in your face!\n". */
static char s_The_book_explodes_in_your_face__00085644[] = "The book explodes in your face!\n";

/* ARM indexes this loaded four-byte record table with type IDs 32-63. */
/* Ghidra rendered the embedded space as an underscore and dropped
   the trailing newline. Real bytes at 0x87918 (ARM UU.exe .data):
   "Look, it's a text trap\n". */
static char s_Look__it_s_a_text_trap_00087918[] = "Look, it's a text trap\n";
static undefined4 DAT_0024cff8;
/* The spawn template's native record address, compared by FUN_0007e644. */
static char *DAT_0024cfd4;



// was FUN_0007d0b0 -- the tile trap/link "type" effect dispatcher wrapped by
// apply_trap_or_link_effect: param_1 is the trap/link record (its low 6 bits, &0x3f, select one of
// 17 effect types via this switch), param_2/param_3 the tile (x,y) coordinates it fired at.
int dispatch_trap_type_effect(ushort *trap_record, int tile_x, int tile_y)
{
  char *stat_ptr;
  char *msg_text;
  void *linked_obj;
  char *equipped_item;
  ushort uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  uint uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  ushort *puVar8;
  undefined1 *puVar9;
  undefined1 *puVar10;
  int iVar11;
  char *pcMessage;
  /* HACK: case 8's own two find_object_in_chain results (real `ushort *` returns, see that
     function's own signature) were stored into iVar16/iVar11 -- both plain `int`, truncating a real
     64-bit pointer on this host. */
  ushort *_case8_p1;
  ushort *_case8_p2;
  ushort *puVar12;
  undefined2 uVar13;
  uint uVar14;
  ushort *puVar15;
  int iVar16;
  uint uVar17;
  uint uVar18;
  bool bVar19;
  undefined4 in_stack_ffffffb4;
  undefined2 uVar20;
  undefined4 in_stack_ffffffb8;
  undefined2 uVar21;
  undefined1 auStack_38 [4];
  char *local_34;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  int local_30;
  
  uVar20 = (undefined2)((uint)in_stack_ffffffb4 >> 0x10);
  uVar21 = (undefined2)((uint)in_stack_ffffffb8 >> 0x10);
  sVar3 = (short)tile_y;
  iVar16 = 2;
  switch(((uw_object_hdr_t *)trap_record)->object_id & 0x3f) {
  case 0:
    iVar16 = rand_below(10);
    uVar6 = 2;
    if (6 < iVar16) {
      uVar6 = 0;
    }
    sVar3 = -1;
    if ((((uw_object_hdr_t *)trap_record)->owner) == 0) {
      sVar3 = 1;
    }
    uVar7 = encode_object_slot_index(DAT_0024cff4);
    iVar16 = apply_poison_or_damage_trap_effect(uVar7,
                                                (((uw_object_hdr_t *)trap_record)->quality) * (int)sVar3,
                                                4,uVar6);
    break;
  case 1:
    iVar16 = teleport_object_to_level_tile(DAT_0024cff4,
                                           ((uw_object_hdr_t *)trap_record)->quality,
                                           ((uw_object_hdr_t *)trap_record)->owner,
                                           ((uw_object_hdr_t *)trap_record)->zpos);
    break;
  case 2:
    spawn_trap_hazard_object(trap_record,tile_x,tile_y);
    break;
  case 3:
    iVar16 = dispatch_quest_event_code(trap_record,tile_x,tile_y);
    break;
  case 4:
    break;
  case 5:
    uVar4 = ((uw_object_hdr_t *)trap_record)->position_word;
    iVar16 = (uVar4 >> 6 & 0xe) + ((byte)((uw_object_hdr_t *)trap_record)->chain_word & 1);
    uVar13 = (undefined2)iVar16;
    if (iVar16 * 0x10000 >> 0x10 == 0xf) {
      uVar13 = 10;
    }
    iVar16 = apply_area_terrain_effect(tile_x,tile_y,
                                       ((uw_object_hdr_t *)trap_record)->owner,
                                       ((byte)((uw_object_hdr_t *)trap_record)->chain_word & 0x3e) >> 1,
                                       CONCAT22(uVar20,uVar4 >> 3) & 0xffff000f,
                                       CONCAT22(uVar21,uVar13),
                                       uVar4 >> 0xd,uVar4 >> 10 & 7,0);
    break;
  case 6:
    iVar16 = dispatch_trap_special_or_tile_action(tile_x,tile_y,trap_record,DAT_0024cff4,
                          CONCAT22(uVar20,(ushort)(byte)((uw_object_hdr_t *)trap_record)->chain_word) & 0xffff003f,
                          CONCAT22(uVar21,(ushort)(byte)((uw_object_hdr_t *)trap_record)->link_word) & 0xffff003f);
    break;
  case 7:
    iVar16 = rand_below(0x3f);
    if (iVar16 < (int)(((uw_object_hdr_t *)trap_record)->quality)) {
      return 2;
    }
    if (((uw_object_hdr_t *)trap_record)->is_quant != 0) {
      return 2;
    }
    puVar12 = (ushort *)resolve_object_link(trap_record + 3);
    if (puVar12 == (ushort *)0x0) {
      return 2;
    }
    if (((((uw_object_hdr_t *)puVar12)->object_id & 0x1c0) == 0x40) && (iVar16 = check_object_area_for_spawn_block(puVar12), iVar16 != 0)) {
      return 2;
    }
    /* alloc_object_slot's argument is object_is_mobile's return value (ARM 0x7d708-0x7d70c:
       bl object_is_mobile; bl alloc_object_slot with r0 untouched) -- Ghidra dropped it. */
    puVar8 = (ushort *)alloc_object_slot(object_is_mobile(puVar12));
    if (puVar8 != (ushort *)0x0) {
      iVar16 = object_is_mobile(puVar12);
      if (iVar16 == 0) {
        ((uw_object_hdr_t *)puVar8)->type_flags = ((uw_object_hdr_t *)puVar12)->type_flags;
        ((uw_object_hdr_t *)puVar8)->position_word = ((uw_object_hdr_t *)puVar12)->position_word;
        ((uw_object_hdr_t *)puVar8)->chain_word = ((uw_object_hdr_t *)puVar12)->chain_word;
        ((uw_object_hdr_t *)puVar8)->link_word = ((uw_object_hdr_t *)puVar12)->link_word;
      }
      else {
        iVar16 = 0x1b;
        puVar15 = puVar8;
        do {
          iVar11 = iVar16 + -1;
          *(char *)puVar15 = (char)*puVar12;
          bVar19 = 0 < iVar16;
          iVar16 = iVar11;
          puVar15 = (ushort *)((char *)puVar15 + 1);
          puVar12 = (ushort *)((char *)puVar12 + 1);
        } while (iVar11 != 0 && bVar19);
      }
      DAT_00202c84 = 1;
      uVar4 = ((uw_object_hdr_t *)puVar8)->position_word;
      local_30 = place_object_in_world(((uw_object_hdr_t *)puVar8)->xpos + tile_x * 8,
                                       ((uw_object_hdr_t *)puVar8)->ypos + tile_y * 8,
                                       ((uw_object_hdr_t *)puVar8)->zpos,
                                       puVar8, CONCAT22(uVar20, 4), 0);
      DAT_00202c84 = 0;
      if (local_30 != 0) {
        if (((((uw_object_hdr_t *)puVar8)->is_quant == 0) && (((uw_object_hdr_t *)puVar8)->link != 0)) &&
            (puVar9 = (undefined1 *)alloc_object_slot(0), puVar9 != (undefined1 *)0x0)) {
          puVar10 = (undefined1 *)get_object_record_by_slot_index(((uw_object_hdr_t *)puVar8)->link);
          ((uw_object_hdr_t *)puVar9)->type_flags = ((uw_object_hdr_t *)puVar10)->type_flags;
          ((uw_object_hdr_t *)puVar9)->position_word = ((uw_object_hdr_t *)puVar10)->position_word;
          ((uw_object_hdr_t *)puVar9)->chain_word = ((uw_object_hdr_t *)puVar10)->chain_word;
          ((uw_object_hdr_t *)puVar9)->link_word = ((uw_object_hdr_t *)puVar10)->link_word;
          uVar14 = encode_object_slot_index(puVar9);
          ((uw_object_hdr_t *)puVar8)->link = uVar14 & 0x3ff;
          if (((uw_object_hdr_t *)puVar9)->next != 0) {
            ((uw_object_hdr_t *)puVar9)->next = 0;
          }
          if ((((uw_object_hdr_t *)puVar9)->is_quant == 0) && (((uw_object_hdr_t *)puVar9)->link != 0)) {
            ((uw_object_hdr_t *)puVar9)->link = 0;
          }
        }
        if ((((uw_object_hdr_t *)puVar8)->object_id & 0x1c0) == 0x1c0) {
          uVar6 = encode_object_slot_index(puVar8);
          scheduler_add_entry(uVar6,0xffffffff,0,tile_x & 0xff,tile_y & 0xff);
        }
      }
    }
    return 2;
  case 8:
    local_34 = (char *)tilemap_lookup(tile_x,tile_y);
    local_34 = local_34 + 2;
    _case8_p1 = find_object_in_chain(&local_34,0,5,0,CONCAT22(uVar20,0xffff));
    DAT_002020a0 = (undefined2)tile_x;
    DAT_002020a4 = sVar3;
    if (_case8_p1 == (ushort *)0x0) {
      _case8_p1 = find_object_in_chain(&local_34,0,7,0xffffffff,0xf);
      if (_case8_p1 == (ushort *)0x0) {
        return 2;
      }
      uVar4 = ((uw_object_hdr_t *)trap_record)->quality;
      if (7 < (((uw_object_hdr_t *)_case8_p1)->owner & 0xf)) {
        if ((uVar4 != 1) && (uVar4 != 3)) {
          return 2;
        }
        goto LAB_0007dbc0;
      }
      if (uVar4 < 2) {
        return 2;
      }
      if (3 < uVar4) {
        return 2;
      }
    }
    else {
      local_34 = (char *)_case8_p1 + 6;
      _case8_p2 = find_object_in_chain(&local_34,0,4,0,0xf);
      if (_case8_p2 != (ushort *)0x0) {
        object_list_unlink(local_34,_case8_p2);
        free_object_slot(_case8_p2);
      }
      if ((((uw_object_hdr_t *)trap_record)->is_quant == 0) && (((uw_object_hdr_t *)trap_record)->link != 0)) {
        puVar9 = (undefined1 *)resolve_object_link(trap_record + 3);
        puVar10 = (undefined1 *)alloc_object_slot(0);
        if (puVar10 != (undefined1 *)0x0) {
          ((uw_object_hdr_t *)puVar10)->type_flags = ((uw_object_hdr_t *)puVar9)->type_flags;
          ((uw_object_hdr_t *)puVar10)->position_word = ((uw_object_hdr_t *)puVar9)->position_word;
          ((uw_object_hdr_t *)puVar10)->chain_word = ((uw_object_hdr_t *)puVar9)->chain_word;
          ((uw_object_hdr_t *)puVar10)->link_word = ((uw_object_hdr_t *)puVar9)->link_word;
          /* HACK: was a bare `object_list_insert_head(local_34);` -- dropped second argument, same
             class as this file's other Ghidra-decompiled dropped-argument calls. */
          object_list_insert_head(local_34,puVar10);
        }
      }
      uVar4 = ((uw_object_hdr_t *)trap_record)->quality;
      if (uVar4 == 1) {
LAB_0007dbc0:
        /* HACK: was `close_door_object(DAT_0024cff4,iVar16);` -- same truncated-pointer class as
           _case8_p1's own fix a few lines above (see this switch case's top comment). */
        close_door_object(DAT_0024cff4,_case8_p1);
        return 2;
      }
      if (uVar4 != 2) {
        if (uVar4 == 3) {
          toggle_door_object(DAT_0024cff4,_case8_p1);
          return 2;
        }
        return 2;
      }
    }
    open_door_object(_case8_p1);
    return 2;
  case 9:
    goto LAB_0007dce4;
  case 10:
LAB_0007dce4:
    if (DAT_0024cff4 == (char *)0x0) {
      return 2;
    }
    if (((((uw_object_hdr_t *)trap_record)->quality) != 0x3f) && (((((uw_object_hdr_t *)DAT_0024cff4)->object_id & 0xf ^ ((uw_object_hdr_t *)trap_record)->chain_word) & 0x3f) != 0)) {
      return 2;
    }
    sVar3 = rand_below(*(undefined1 *)(DAT_00086df8 + 0x2a));
    msg_text = get_message_string(0x2f5);
    print_message_with_proximity_qualifier(msg_text,
                                           g_player_object->npc_xhome,
                                           g_player_object->npc_yhome,
                                           0,
                                           CONCAT22(uVar20,*(ushort *)(DAT_0024cff4 + 0x16) >> 10),
                                           CONCAT22(uVar21,(*(ushort *)(DAT_0024cff4 + 0x16) & 0x3f0) >> 4),
                                           0,0);
    uVar6 = encode_object_slot_index(DAT_0024cff4);
    iVar16 = apply_poison_or_damage_trap_effect(uVar6,sVar3 + 3,4,0);
    return iVar16;
  case 0xb:
    local_34 = (char *)tilemap_lookup(((uw_object_hdr_t *)trap_record)->quality,
                                      ((uw_object_hdr_t *)trap_record)->owner);
    local_34 = local_34 + 2;
    linked_obj = resolve_object_link(trap_record + 3);
    unlink_and_free_object(local_34,linked_obj);
    set_pending_update_flags(2);
    return 2;
  case 0xc:
    uVar4 = ((uw_object_hdr_t *)trap_record)->owner | (((uw_object_hdr_t *)trap_record)->quality) << 5;
    equipped_item = (char *)find_equipped_item_by_category((short)uVar4 >> 6,(short)uVar4 >> 4 & 3,
                                                           ((uw_object_hdr_t *)trap_record)->owner & 0xf,
                                                           4,
                                                           (ushort *)auStack_38);
    if (equipped_item == 0) {
      return 2;
    }
    if (((((((uw_object_hdr_t *)trap_record)->zpos) != 0) && (((uw_object_hdr_t *)equipped_item)->is_quant != 0)) &&
         ((((uw_object_hdr_t *)equipped_item)->link & 0x200) == 0)) &&
        (((uw_object_hdr_t *)equipped_item)->link < (((uw_object_hdr_t *)trap_record)->zpos))) {
      return 2;
    }
    break;
  case 0xd:
    uVar1 = ((uw_object_hdr_t *)trap_record)->position_word;
    uVar18 = (uint)(byte)((uw_object_hdr_t *)trap_record)->link_word;
    uVar14 = uVar1 >> 10 & 7;
    uVar5 = uVar14 | (uVar18 & 0x3f) << 3;
    uVar4 = uVar1 >> 7 & 7;
    iVar11 = (int)(short)(uVar1 & 0x7f);
    if (iVar11 == 0) {
      uVar14 = (uint)(short)uVar5;
      if (uVar4 == 1) {
        uVar14 = *(uint *)(DAT_00086df8 + 0x65) & ~(1 << (uVar14 & 0xff));
      }
      else if (uVar4 == 5) {
        uVar14 = *(uint *)(DAT_00086df8 + 0x65) ^ 1 << (uVar14 & 0xff);
      }
      else {
        uVar14 = *(uint *)(DAT_00086df8 + 0x65) | 1 << (uVar14 & 0xff);
      }
      *(char *)(DAT_00086df8 + 0x65) = (char)uVar14;
      *(char *)(DAT_00086df8 + 0x66) = (char)(uVar14 >> 8);
      *(char *)(DAT_00086df8 + 0x67) = (char)(uVar14 >> 0x10);
      *(char *)(DAT_00086df8 + 0x68) = (char)(uVar14 >> 0x18);
      break;
    }
    bVar2 = (byte)uVar14;
    if (uVar4 == 0) {
      bVar2 = *(char *)(iVar11 + DAT_00086df8 + 0x70) + (bVar2 | (byte)((uVar18 & 0x1f) << 3));
LAB_0007d45c:
      *(byte *)(iVar11 + DAT_00086df8 + 0x70) = bVar2;
    }
    else {
      if (uVar4 == 1) {
        bVar2 = *(char *)(iVar11 + DAT_00086df8 + 0x70) - (bVar2 | (byte)((uVar18 & 0x1f) << 3));
        goto LAB_0007d45c;
      }
      if (uVar4 != 2) {
        if (uVar4 == 3) {
          bVar2 = *(byte *)(iVar11 + DAT_00086df8 + 0x70) & (bVar2 | (byte)((uVar18 & 0x1f) << 3));
        }
        else if (uVar4 == 4) {
          bVar2 = *(byte *)(iVar11 + DAT_00086df8 + 0x70) | bVar2 | (byte)((uVar18 & 0x1f) << 3);
        }
        else if (uVar4 == 5) {
          bVar2 = *(byte *)(iVar11 + DAT_00086df8 + 0x70) ^ (bVar2 | (byte)((uVar18 & 0x1f) << 3));
        }
        else {
          if (uVar4 != 6) goto LAB_0007d460;
          bVar2 = *(char *)(iVar11 + DAT_00086df8 + 0x70) << (uVar14 | (uVar18 & 0x1f) << 3);
        }
        goto LAB_0007d45c;
      }
      *(char *)(iVar11 + DAT_00086df8 + 0x70) = (char)uVar5;
    }
LAB_0007d460:
    *(byte *)(iVar11 + DAT_00086df8 + 0x70) = *(byte *)(iVar11 + DAT_00086df8 + 0x70) & 0x3f;
    break;
  case 0xe:
    uVar4 = ((uw_object_hdr_t *)trap_record)->position_word;
    uVar5 = (uint)(short)((int)(short)uVar4 & 0x7fU);
    uVar18 = (int)(((uVar4 >> 7 & 7) + ((int)(short)uVar4 & 0x7fU)) * 0x10000) >> 0x10;
    uVar14 = 0;
    if (uVar5 <= uVar18) {
      do {
        bVar19 = (uVar4 & 0xe000) != 0;
        stat_ptr = DAT_00086df8 + uVar5;
        if (bVar19) {
          uVar17 = (uint)*(byte *)(stat_ptr + 0x70);
        }
        if (bVar19) {
          uVar14 = uVar17 + uVar14;
        }
        else {
          uVar17 = *(byte *)(stat_ptr + 0x70) & 7;
          uVar14 = (int)(short)uVar14 << 0x13;
        }
        uVar5 = (int)((uVar5 + 1) * 0x10000) >> 0x10;
        if (!bVar19) {
          uVar14 = uVar17 | (int)uVar14 >> 0x10;
        }
      } while ((int)uVar5 <= (int)uVar18);
      tile_y = (uint)sVar3;
    }
    if (((ushort)uVar14 !=
         (ushort)(uVar4 >> 10 & 7 | (((uw_object_hdr_t *)trap_record)->owner | (((uw_object_hdr_t *)trap_record)->quality) << 5) << 3)) &&
        (((uw_object_hdr_t *)trap_record)->link != 0)) {
      linked_obj = resolve_object_link(trap_record + 3);
      if (((uw_object_hdr_t *)linked_obj)->next == 0) {
        return 2;
      }
      linked_obj = resolve_object_link((char *)linked_obj + 4);
      iVar16 = resolve_skill_gated_unlock_or_use(DAT_0024cff4,DAT_0024cff0,linked_obj,0xffff);
      return iVar16;
    }
    break;
  case 0xf:
    break;
  case 0x10:
    /* ARM 0x7de30..0x7de48 keeps the returned message pointer in r5. */
    pcMessage = get_message_string(((uw_object_hdr_t *)trap_record)->owner | (((uw_object_hdr_t *)trap_record)->quality & 0x2f | 0x90) << 5);
    debug_print(s_Look__it_s_a_text_trap_00087918);
    if (pcMessage != 0) {
      message_scroll_print_wrapped(pcMessage);
    }
  }
  if (((uw_object_hdr_t *)trap_record)->link != 0) {
    puVar12 = (ushort *)resolve_object_link(trap_record + 3);
    if ((((uw_object_hdr_t *)puVar12)->object_id & 0x1c0) == 0x180) {
      if ((((uw_object_hdr_t *)puVar12)->object_id & 0x30) < 0x20) {
        uVar4 = dispatch_trap_type_effect(puVar12,tile_x,tile_y);
      }
      else {
        uVar4 = resolve_skill_gated_unlock_or_use(DAT_0024cff4,DAT_0024cff0,puVar12,0xffff);
      }
      iVar16 = (int)(short)(uVar4 | (ushort)iVar16);
    }
  }
  return iVar16;
}





// was FUN_0007e0d8 -- per-object callback passed to for_each_object_of_type (see
// dispatch_quest_event_code's case 0x32, which sweeps every object of class 0xd8). When the
// object's flags nibble at +0xb is 7, resets it to 1.
int reset_object_ui_state_callback(char *object)
{
  uint uVar1;
  
  if ((*(ushort *)(object + 0xb) & 0xf) == 7) {
    uVar1 = *(ushort *)(object + 0xb) & 0xfff1;
    *(byte *)(object + 0xb) = (byte)uVar1 | 1;
    *(char *)(object + 0xc) = (char)(uVar1 >> 8);
  }
  reset_cursor_confine_rect();
  attempt_talk_interaction(object);
  return 0;
}



// was FUN_0007e12c -- dispatch_trap_type_effect's case 3 handler (called there as
// `FUN_0007e12c(param_1,param_2,param_3)`, the trap/ link record and its tile x,y).
int dispatch_quest_event_code(void *trap_record_ptr, int tile_x, int tile_y)
{
  char *trap_record = (char *)trap_record_ptr;
  uint uVar1;
  
  uVar1 = *(ushort *)(trap_record + 4) & 0x3f;
  if (uVar1 < 0x2a) {
    if (uVar1 == 0x29) {
      trigger_exploding_book_trap_at_tile(0,tile_x,tile_y);
    }
    else if (uVar1 == 2) {
      restore_view_from_object_record(trap_record,tile_x,tile_y);
    }
    else if (2 < uVar1) {
      if (uVar1 < 5) {
        /* DAT_0024cff0 is a ushort *: the activating object's flag nibble is byte 1, so index bytes
           explicitly (`DAT_0024cff0 + 1` is byte 2, the position word -- every dial position then
           read the same constant and the eight-way dial stuck on its highest height). */
        apply_quest_event_numeric_effect((((byte *)DAT_0024cff0)[1] & 0x1e) >> 1,trap_record,tile_x,tile_y);
      }
      else if (uVar1 == 5) {
        emit_player_noise_alert(*(ushort *)(trap_record + 6) & 0x3f);
      }
      else if (uVar1 == 0x18) {
        handle_level4_maze_puzzle_button(*(ushort *)(trap_record + 6) & 0x3f,tile_x,tile_y);  /* ARM 0x7e198: r1/r2 pass straight through from this function's own params */
      }
      else if (uVar1 == 0x28) {
        try_combine_shrine_markers(0,tile_x,tile_y);
      }
    }
  }
  else if (uVar1 == 0x2a) {
    trigger_scripted_npc_conversation();
  }
  else if (uVar1 == 0x32) {
    for_each_object_of_type(0xd8,0,0,reset_object_ui_state_callback);
  }
  else if (uVar1 == 0x39) {
    advance_scheduler_and_show_page3();
  }
  else if (0x3b < uVar1) {
    if (uVar1 < 0x3f) {
      if ((ushort *)DAT_0024cff4 == g_player_object) {
        apply_quest_vertical_effect((*(ushort *)(trap_record + 4) & 0x3f) - 0x3b,*(ushort *)(trap_record + 6) & 0x3f);
      }
    }
    else if (uVar1 == 0x3f) {
      DAT_0023c27c = (*(byte *)(trap_record + 6) & 0x3f) + 1;
      set_pending_update_flags(0x400);
    }
  }
  return 2;
}





// was FUN_0007e2dc -- allocates two new object slots and links both into the tile (param_1,param_2)
// object list at tilemap_lookup's head: the first is initialized with class/flag bits matching
// 0x180-bracket...
int create_scripted_trap_pair_at_tile(int tile_x, int tile_y, uint code)
{
  int iVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  ushort *puVar5;
  byte *pbVar6;
  uint uVar7;
  undefined4 uVar8;
  byte bVar9;
  uint uVar10;
  uint uVar11;

  puVar4 = (ushort *)alloc_object_slot(0);
  if (puVar4 != (ushort *)0x0) {
    puVar5 = (ushort *)alloc_object_slot(0);
    if (puVar5 != (ushort *)0x0) {
      pbVar6 = (byte *)tilemap_lookup(tile_x, tile_y);
      uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
      uVar7 = uVar2 & 0xffa0 | 0x61a0;
      ((uw_object_hdr_t *)puVar4)->object_id = 0x1a0;
      ((uw_object_hdr_t *)puVar4)->doordir = 1;
      ((uw_object_hdr_t *)puVar4)->invisible = 1;
      uVar7 = ((uw_object_hdr_t *)puVar4)->position_word & 0xff80;
      bVar9 = *pbVar6 >> 1 & 0x78;
      ((uw_object_hdr_t *)puVar4)->zpos = bVar9;
      ((uw_object_hdr_t *)puVar4)->heading = 0;
      ((uw_object_hdr_t *)puVar4)->ypos = 3;
      ((uw_object_hdr_t *)puVar4)->xpos = 3;
      uVar7 = uVar2 & 0xf3a0 | 0x61a0;
      ((uw_object_hdr_t *)puVar4)->flags_res = (uVar7 >> 9) & 7;
      ((uw_object_hdr_t *)puVar4)->enchanted = 1;
      ((uw_object_hdr_t *)puVar4)->is_quant = 1;
      ((uw_object_hdr_t *)puVar4)->quality = 0;
      ((uw_object_hdr_t *)puVar4)->next = 0;
      uVar7 = encode_object_slot_index(puVar5);
      iVar1 = (uVar7 & 0x3ff) << 6;
      bVar3 = ((uw_object_hdr_t *)puVar4)->owner | (byte)iVar1;
      uVar2 = ((uw_object_hdr_t *)puVar4)->chain_word;
      bVar9 = (byte)uVar2;
      ((uw_object_hdr_t *)puVar4)->quality = (byte)tile_x & 0x3f;
      ((uw_object_hdr_t *)puVar4)->owner = (byte)tile_y & 0x3f;
      ((uw_object_hdr_t *)puVar4)->link = uVar7 & 0x3ff;
      object_list_insert_head(pbVar6 + 2, puVar4);
      uVar7 = ((uw_object_hdr_t *)puVar5)->type_flags & 0xff8f | 0x180;
      uVar11 = (uVar7 ^ code) & 0xf ^ uVar7;
      ((uw_object_hdr_t *)puVar5)->object_id = 0x180 | (code & 0xf);
      ((uw_object_hdr_t *)puVar5)->doordir = 1;
      ((uw_object_hdr_t *)puVar5)->invisible = 1;
      bVar9 = *pbVar6 >> 1 & 0x78;
      uVar7 = (uint)((uw_object_hdr_t *)puVar5)->position_word;
      uVar10 = uVar7 & 0xff80;
      uVar7 = uVar7 & 0x380;
      ((uw_object_hdr_t *)puVar5)->zpos = bVar9;
      ((uw_object_hdr_t *)puVar5)->ypos = 3;
      ((uw_object_hdr_t *)puVar5)->xpos = 3;
      ((uw_object_hdr_t *)puVar5)->link = 0;
      ((uw_object_hdr_t *)puVar5)->quality = 0x3f;
      ((uw_object_hdr_t *)puVar5)->next = 0;
      uVar11 = uVar11 & 0xe3ff;
      ((uw_object_hdr_t *)puVar5)->flags_res = 1;
      ((uw_object_hdr_t *)puVar5)->enchanted = 0;
      ((uw_object_hdr_t *)puVar5)->is_quant = 1;
      object_list_insert_head(pbVar6 + 2, puVar5);
      uVar8 = encode_object_slot_index(puVar4);
      return uVar8;
    }
    free_object_slot(puVar4);
  }
  return 0;
}





// was FUN_0007e558 -- the special-case cleanup free_trap_class_object defers to for a class-0x180
// (trap) object being deleted: param_2 is the trap object itself, param_1 the link-field address
// it's being unlinked from.
void remove_trap_chain_marker(char *link_field, char *trap_object)
{
  uint uVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  char *iVar5;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  puVar4 = (ushort *)resolve_object_link((char *)&((uw_object_hdr_t *)trap_object)->link_word);
  uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
  uVar1 = (uVar2 & 0x1e00) >> 9;
  if ((short)uVar1 == 1) {
    iVar5 = (char *)tilemap_lookup(((uw_object_hdr_t *)trap_object)->quality,
                                   ((uw_object_hdr_t *)trap_object)->owner);
    refresh_object_link_chain(iVar5 + 2,puVar4);
  }
  else {
    bVar3 = (byte)(uVar2 >> 8);
    ((uw_object_hdr_t *)puVar4)->flags_res = (uVar1 - 1) & 7;
    ((uw_object_hdr_t *)puVar4)->enchanted = ((uVar1 - 1) >> 3) & 1;
    object_list_unlink(link_field,trap_object);
    free_object_slot(trap_object);
  }
}



// was FUN_0007e610 -- confirmed by its own caller's pre-existing comment
// (free_linked_object_recursive, src/objects.c: "param_1== 0x180 class (containers) instead defer
// to FUN_0007e610") as the special-case delete path for a class-0x180 (trap) object...
void free_trap_class_object(void *link_field_ptr, void *trap_object_ptr)
{
  char *link_field = (char *)link_field_ptr;
  byte *trap_object = (byte *)trap_object_ptr;
  if ((*trap_object & 0x30) < 0x11) {
    refresh_object_link_chain(link_field,trap_object);
  }
  else {
    remove_trap_chain_marker(link_field,trap_object);
  }
}





// was FUN_0007e644 -- area-scan callback: another marked NPC blocks the spawn;
// the template itself and player do not. ARM 0x7e644..0x7e688 tests word +0xd
// bit 0x100 and compares the record in r2 against those two native addresses.
int detect_spawn_blocking_object_callback(int scan_x, int scan_y, char *object)
{
  if (((*(byte *)(object + 0xe) & 1) != 0) &&
      (object != DAT_0024cfd4) && (object != (char *)g_player_object)) {
    DAT_0024cff8 = 1;
  }
  return DAT_0024cff8;
}


// was FUN_0007e694 -- checks the spawn template's surrounding NPCs. Called by
// dispatch_trap_type_effect's case 7, which aborts the spawn on a nonzero result.
int check_object_area_for_spawn_block(ushort *object)
{
  DAT_0024cff8 = 0;
  DAT_0024cfd4 = (char *)object;
  /* ARM 0x7e6bc loads code address 0x7e644, not a data buffer. */
  scan_area_ahead_of_object(object,1,detect_spawn_blocking_object_callback,0,0,4);
  return DAT_0024cff8;
}





// was FUN_0007e6e0 -- returns 1 when param_1 is 0, or when the tile (param_2,param_3) is more than
// 7 tiles away from the player's own view tile (g_player_object+0x16, matching the "current view
// tile" field used throughout this file) on either axis...
int is_out_of_player_range(int target_present, short tile_x, short tile_y)
{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  
  if (((target_present == 0) ||
      (uVar3 = (int)(short)(g_player_object->npc_xhome) - (int)tile_x,
       uVar1 = (int)uVar3 >> 0x1f, 7 < (int)((uVar3 ^ uVar1) - uVar1))) ||
      (uVar3 = (int)(short)(g_player_object->npc_yhome) - (int)tile_y,
       uVar1 = (int)uVar3 >> 0x1f, uVar2 = 0, 7 < (int)((uVar3 ^ uVar1) - uVar1))) {
    uVar2 = 1;
  }
  return uVar2;
}





// was FUN_0007e778 -- periodic world-tick helper: scans every type-6 object within 7 tiles
// (find_object_in_world, not yet named) and, for each whose class bits (0x1e at +1) are clear,
// resolves its linked sub-object, sets a flag bit on it, and -- only when is_out_of_player_range...
void process_nearby_background_traps(int target_present)
{
  undefined2 uVar1;
  /* find_object_in_world/resolve_object_link now return real pointers (ushort-pointer /
     void-pointer) -- was `int iVar2`/`iVar3`, truncating them on this 64-bit host exactly like the
     sibling fix in objects.c's find_object_in_world/find_object_in_chain. iVar3 keeps its later... */
  ushort *pObj;
  char *pbVar5;
  int iVar3;
  int iVar4;
  short local_14;
  short local_12;

  local_14 = 0;
  local_12 = 0;
  pObj = find_object_in_world(6,0,7,&local_14,&local_12);
  while (pObj != 0) {
    if ((((uw_object_hdr_t *)pObj)->type_flags_high & 0x1e) == 0) {
      pbVar5 = resolve_object_link((char *)pObj + 6);
      /* HACK: was a bare `object_is_mobile();` -- dropped argument, the same class of bug fixed
         repeatedly elsewhere in this file. object_is_mobile takes exactly one argument at every
         other call site in this codebase... */
      iVar4 = object_is_mobile(pbVar5);
      if (iVar4 != 0) {
        uVar1 = *(undefined2 *)(pbVar5 + 0xd);
        *(char *)(pbVar5 + 0xd) = (char)uVar1;
        *(byte *)(pbVar5 + 0xe) = (byte)((ushort)uVar1 >> 8) | 1;
        iVar3 = is_out_of_player_range(target_present,(int)local_14,(int)local_12);
        if (iVar3 != 0) {
          dispatch_trap_type_effect(pObj,(int)local_14,(int)local_12);
        }
      }
    }
    local_14 = local_14 + 1;
    pObj = find_object_in_world(6,0,7,&local_14,&local_12);
  }
}





// was FUN_0007e85c -- periodic world-tick helper, sibling to process_nearby_background_traps: scans
// every type-5 (door) object world-wide, and for each unlocked (class bit 0x80 clear), non- trivial
// (quality nibble > 7) door...
void tick_ambient_doors_and_scheduler(int target_present)
{
  byte *pbVar1;
  int iVar2;
  short local_1c;
  short local_1a;
  
  local_1c = 0;
  local_1a = 0;
  pbVar1 = (byte *)find_object_in_world(5,0,-1,&local_1c,&local_1a);
  while (pbVar1 != (byte *)0x0) {
    /* was folded into `int iVar2` (reused below for unrelated int
       values) -- truncated tilemap_lookup's real `void *` return */
    char *_tile2 = (char *)tilemap_lookup((int)local_1c,(int)local_1a);
    if ((((*(byte *)(_tile2 + 1) & 0x80) == 0) && (7 < (((uw_object_hdr_t *)pbVar1)->object_id & 0xf))) &&
        (iVar2 = rand_below(10), iVar2 < 3)) {
      DAT_002020a0 = local_1c;
      DAT_002020a4 = local_1a;
      /* HACK: was a bare `FUN_0007e6e0(target_present);` -- dropped arguments, the same class of bug fixed
         repeatedly elsewhere in this file. is_out_of_player_range takes exactly three params (an
         acting object plus a tile x/y)... */
      iVar2 = is_out_of_player_range(target_present,(int)local_1c,(int)local_1a);
      if (iVar2 != 0) {
        open_door_object(pbVar1);
      }
    }
    local_1c = local_1c + 1;
    pbVar1 = (byte *)find_object_in_world(5,0,-1,&local_1c,&local_1a);
  }
  if ((target_present == 0) && (DAT_000879ac != 0)) {
    iVar2 = 0;
    do {
      scheduler_tick(1);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 8);
  }
}





// was FUN_00039790 -- area terrain-modification trap/spell effect: over a param_7 x param_8
// rectangle of tiles starting at (param_1,param_2), adjusts each tile's floor-height nibble (either
// relatively, by param_9, when param_9 is 1 or 3, or set absolutely to param_9 when under 0xe)...
int apply_area_terrain_effect(short tile_x, int tile_y, short wall_texture, short height_value, short height_adjust, short floor_texture, short width, short height_extent, short mode)
{
  int iVar1;
  int iVar2;
  uint uVar3;
  short sVar4;
  ushort uVar5;
  byte bVar6;
  ushort *puVar7;
  ushort *puVar8;
  int iVar9;
  uint uVar10;
  uint extraout_r1;
  uint uVar11;
  int iVar12;
  uint uVar13;
  undefined8 uVar14;
  short local_44;
  
  sVar4 = (short)tile_y;
  iVar1 = ((int)width + (int)tile_x) * 0x10000 >> 0x10;
  if (tile_x <= iVar1) {
    uVar13 = (uint)height_adjust;
    iVar2 = ((int)height_extent + (int)sVar4) * 0x10000 >> 0x10;
    local_44 = tile_x;
    do {
      if (sVar4 <= iVar2) {
        iVar12 = (int)(short)uVar13;
        do {
          puVar7 = (ushort *)tilemap_lookup((int)local_44,tile_y);
          uVar10 = *puVar7 >> 4 & 0xf;
          if ((mode == 1) || (mode == 3)) {
            uVar13 = (uVar10 - (int)mode) + 2;
            iVar12 = (int)(uVar13 * 0x10000) >> 0x10;
            if (-1 < iVar12) goto LAB_0003987c;
          }
          else {
LAB_0003987c:
            if (iVar12 < 0xe) {
              uVar11 = *puVar7 & 0xff0f;
              *(byte *)puVar7 = (byte)uVar11 | (byte)((uVar13 & 0xf) << 4);
              *(byte *)((char *)puVar7 + 1) = (byte)(uVar11 >> 8);
            }
          }
          uVar11 = (uint)(byte)((byte)*puVar7 >> 4);
          uVar3 = (uint)(short)uVar10;
          if (uVar3 < uVar11) {
            for (puVar8 = puVar7 + 1; (*puVar8 & 0xffc0) != 0; puVar8 = puVar8 + 2) {
              puVar8 = (ushort *)resolve_object_link(puVar8);
              if (((*puVar8 & 0x1c0) != 0x180) && ((int)(puVar8[1] & 0x7f) < iVar12 * 8)) {
                uVar10 = puVar8[1] & 0xff80;
                *(byte *)(puVar8 + 1) = (byte)uVar10 | (byte)((uVar13 & 0xf) << 3);
                *(char *)((char *)puVar8 + 3) = (char)(uVar10 >> 8);
                iVar9 = object_is_mobile(puVar8);
                if ((iVar9 == 0) || ((*puVar8 & 0x1c0) == 0x40)) {
                  if (puVar8 == g_player_object) {
                    DAT_00204884 = (undefined2)(iVar12 << 6);
                  }
                }
                else {
                  *(char *)((char *)puVar8 + 0xf) = (char)((uVar13 << 0x16) >> 0x10);
                  *(char *)(puVar8 + 8) = (char)(((uVar13 & 0x3ff) << 6) >> 8);
                }
              }
            }
          }
          else if (uVar11 < uVar3) {
            for (puVar8 = puVar7 + 1; (*puVar8 & 0xffc0) != 0; puVar8 = puVar8 + 2) {
              puVar8 = (ushort *)resolve_object_link(puVar8);
              uVar10 = 0;  /* was the high 32 bits of the (32-bit-ARM) 64-bit r0:r1 return pair */
              if (((*puVar8 & 0x1c0) != 0x180) && ((puVar8[1] & 0x7f) == uVar3 * 8)) {
                uVar10 = puVar8[1] & 0xff80;
                *(byte *)(puVar8 + 1) = (byte)uVar10 | (byte)((uVar13 & 0xf) << 3);
                *(char *)((char *)puVar8 + 3) = (char)(uVar10 >> 8);
                uVar14 = object_is_mobile(puVar8);
                uVar10 = (uint)((ulonglong)uVar14 >> 0x20);
                if (((int)uVar14 == 0) || ((*puVar8 & 0x1c0) == 0x40)) {
                  if (puVar8 == g_player_object) {
                    /* Was `uVar10 = extraout_r1;` -- set_locomotion_state is void (stops/locks the
                       player's movement when a trap hits them), so there's no real second return
                       value to read here... */
                    set_locomotion_state(0x10,1);  /* ARM 0x39aac-0x39ab4: moveq r1,#1; moveq r0,#0x10; bleq */
                  }
                }
                else {
                  *(char *)((char *)puVar8 + 0xf) = (char)((uVar13 << 0x16) >> 0x10);
                  *(char *)(puVar8 + 8) = (char)(((uVar13 & 0x3ff) << 6) >> 8);
                }
              }
            }
          }
          if (height_value < 0xb) {
            uVar5 = *puVar7;
            *(byte *)puVar7 = (byte)(uVar5 & 0xc3ff);
            *(byte *)((char *)puVar7 + 1) =
                 (byte)((uVar5 & 0xc3ff) >> 8) | (byte)((((int)height_value & 0xfU) << 10) >> 8);
          }
          if (wall_texture < 0x30) {
            uVar5 = puVar7[1];
            bVar6 = (byte)uVar5;
            *(byte *)(puVar7 + 1) = (bVar6 ^ (byte)wall_texture) & 0x3f ^ bVar6;
            *(byte *)((char *)puVar7 + 3) = (byte)(uVar5 >> 8);
          }
          if (floor_texture < 10) {
            uVar5 = *puVar7;
            bVar6 = (byte)uVar5;
            *(byte *)puVar7 = (bVar6 ^ (byte)floor_texture) & 0xf ^ bVar6;
            *(byte *)((char *)puVar7 + 1) = (byte)(uVar5 >> 8);
          }
          tile_y = tile_y + 1;
        } while (tile_y * 0x10000 >> 0x10 <= iVar2);
        tile_y = (int)sVar4;
      }
      iVar12 = (int)local_44;
      local_44 = (short)(iVar12 + 1);
    } while ((iVar12 + 1) * 0x10000 >> 0x10 <= iVar1);
  }
  set_pending_update_flags(6);
  return 2;
}


// was FUN_00039bd8 -- confirmed as dispatch_trap_type_effect's case 0 AND case 0xb handler (a
// "poison dart"-style trap): param_2's low 16 bits are a signed delta -- negative poisons the
// player directly...
int apply_poison_or_damage_trap_effect(int object_slot, uint damage_delta, int unused_a, int unused_b)
{
  char cVar1;
  void *iVar2;
  int iVar3;
  short sVar4;
  uint uVar5;
  
  sVar4 = (short)damage_delta;
  iVar2 = get_object_record_by_slot_index(object_slot);
  iVar3 = (int)sVar4;
  if (iVar3 < 0) {
    if (iVar2 == g_player_object) {
      uVar5 = *(byte *)(DAT_00086df8 + 0x5f) >> 2 & 0xf;
      if ((-uVar5 != iVar3 && (int)uVar5 <= -iVar3) &&
         (cVar1 = resolve_damage_type_resistance(g_player_object,1,0x10), cVar1 != '\0')) {
        uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
        *(byte *)(DAT_00086df8 + 0x5f) =
             (byte)uVar5 | (byte)(((damage_delta & 0xffff) * -0x10000 >> 0x10 & 0xf) << 2);
        *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
      }
    }
    else {
      sVar4 = (short)((uint)(iVar3 * -0x10000) >> 0x10);
    }
  }
  if ((0 < sVar4) &&
     (iVar3 = apply_typed_damage_to_object(iVar2,0, ((uw_mobile_object_t *)iVar2)->tile_x,
                                           ((uw_mobile_object_t *)iVar2)->tile_y,(char)sVar4,4), iVar3 != 0)) {
    return 0x10;
  }
  return 2;
}


// was FUN_00039d1c -- shared special-action dispatch helper: stashes two coordinate/context bytes
// (param_1/param_2) into DAT_0023c3dc/DAT_0023c3d8, then dispatches by the sign of param_5 (a
// signed action id): negative runs dispatch_tile_special_action...
/* ARM 0x39d24/0x39d48 keeps the actor address in r2, and r3 carries the target through to
   execute_spell_effect. These are host addresses. */
int dispatch_trap_special_or_tile_action(byte context_x, byte context_y, void *actor, void *target, ushort action_id, byte argument)
{
  DAT_0023c3d8 = context_y;
  DAT_0023c3dc = context_x;
  if ((short)action_id < 0) {
    dispatch_tile_special_action(argument,actor,target);
  }
  else {
    execute_spell_effect(action_id & 0xff,argument,actor,target);  /* 4th arg was dropped: ARM 0x39d50 passes r3 (incoming target) through */
  }
  return 2;
}


// was FUN_00039f04 -- handler for a level-4-exclusive interactive puzzle mechanism (only active
// when DAT_00201b68==4; prints "not here" message 0xbf on any other level)...
void handle_level4_maze_puzzle_button(short button, int tile_x, int tile_y)
{
  byte *pbVar1;
  byte *pbVar2;
  short sVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined2 uVar10;
  undefined2 uVar11;
  
  if (DAT_00201b68 == 4) {
    if (button < 0) {
      return;
    }
    if (button < 2) {
      pbVar1 = (byte *)(DAT_00086df8 + 0x88);
      iVar8 = *pbVar1 + 0x30;
      pbVar2 = (byte *)(DAT_00086df8 + 0x89);
      iVar9 = *pbVar2 + 0x30;
      if (1 < *(byte *)(DAT_00086df8 + 0x8a)) {
        *(byte *)(DAT_00086df8 + 0x8a) = *(byte *)(DAT_00086df8 + 0x8a) - 1;
        iVar6 = *pbVar1 + 0x2f;
        iVar7 = *pbVar2 + 0x2f;
        uVar10 = 2;
        uVar11 = 2;
        iVar4 = iVar8;
        if ((*(char *)(DAT_00086df8 + 0x88) == '\0') ||
           (iVar4 = iVar6, *(char *)(DAT_00086df8 + 0x88) == '\a')) {
          iVar6 = iVar4;
          uVar10 = 1;
        }
        iVar4 = iVar9;
        if ((*(char *)(DAT_00086df8 + 0x89) == '\0') ||
           (iVar4 = iVar7, *(char *)(DAT_00086df8 + 0x89) == '\a')) {
          iVar7 = iVar4;
          uVar11 = 1;
        }
        sVar3 = button * 2 + 1;
        apply_area_terrain_effect(iVar6,iVar7,0x3f,0xf,0xf,0xf,uVar10,uVar11,sVar3);
        apply_area_terrain_effect(iVar8,iVar9,0x3f,0xf,0xf,0xf,0,0,sVar3);
        return;
      }
      print_scroll_message_by_id(0xc0);
      *(undefined1 *)(DAT_00086df8 + 0x8a) = 1;
      return;
    }
    if (button == 2) {
      *(byte *)(DAT_00086df8 + 0x89) = *(char *)(DAT_00086df8 + 0x89) + 1U & 7;
      return;
    }
    if (button == 3) {
      *(byte *)(DAT_00086df8 + 0x88) = *(char *)(DAT_00086df8 + 0x88) + 1U & 7;
      return;
    }
    if (button != 4) {
      return;
    }
    *(undefined1 *)(DAT_00086df8 + 0x8a) = 0x3f;
    apply_area_terrain_effect(0x30,0x30,0x3f,0xf,4,0xf,7,7,0);
    uVar5 = 0xc1;
  }
  else {
    uVar5 = 0xbf;
  }
  print_scroll_message_by_id(uVar5);
}


// was FUN_0003a0e8 -- dispatch_quest_event_code's code 0x28 handler (param_1 unused throughout).
void try_combine_shrine_markers(int unused, int tile_x, int tile_y)
{
  int iVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  char cVar6;
  char cVar7;
  int aiStackY_244 [4];
  int aiStackY_234 [89];
  char acStackY_d0 [4];
  char acStackY_cc [108];
  /* local_34[] / local_44[] / local_54 held 64-bit tile-record and object-list pointers -- Ghidra
     typed them `int`, truncating every one (tilemap_lookup / find_object_in_chain /
     spawn_new_object results are all real pointers). local_54's address is handed to... */
  void *local_54;
  char local_50 [4];
  char local_4c [8];
  void *local_44 [4];
  void *local_34 [4];
  char *pTile;
  char *pNew;

  iVar5 = 0;
  cVar7 = -4;
  iVar1 = -4;
  do {
    cVar6 = -4;
    iVar3 = -4;
    do {
      pTile = (char *)tilemap_lookup(((short)tile_x + iVar1) * 0x10000 >> 0x10,
                           ((short)tile_y + iVar3) * 0x10000 >> 0x10);
      iVar3 = (int)(char)iVar5;
      local_34[iVar3] = pTile;
      local_54 = pTile + 2;
      local_44[iVar3] = find_object_in_chain((ushort **)&local_54,0,2,2,7);
      if (local_44[iVar3] != 0) {
        local_50[iVar3] = cVar7 + (char)tile_x;
        local_4c[iVar3] = cVar6 + (char)tile_y;
        iVar5 = (iVar3 + 1) * 0x1000000 >> 0x18;
      }
      cVar6 = cVar6 + '\b';
      iVar3 = (int)cVar6;
    } while (iVar3 < 5);
    cVar7 = cVar7 + '\b';
    iVar1 = (int)cVar7;
  } while (iVar1 < 5);
  if ((char)iVar5 == '\x04') {
    pNew = (char *)spawn_new_object(0xfd,0);
    pTile = (char *)tilemap_lookup(tile_x,tile_y + 1);
    uVar4 = ((uw_object_hdr_t *)pNew)->heading << 7 | 0x6c40;
    ((uw_object_hdr_t *)pNew)->position_word = (ushort)uVar4;
    object_list_insert_head(pTile + 2,pNew);
    settle_dropped_object(pNew,tile_x,tile_y + 1,1);
    iVar5 = 0;
    do {
      discard_misplaced_object((char *)local_34[iVar5] + 2,local_44[iVar5],1);
      iVar5 = (iVar5 + 1) * 0x1000000 >> 0x18;
    } while (iVar5 < 4);
  }
}


// was FUN_0003a29c -- confirmed as dispatch_quest_event_code's case 5
// handler: emits a noise alert of type param_1 centered on the player.
void emit_player_noise_alert(byte noise_type)
{
  emit_noise_alert(g_player_object,noise_type);
}



// was FUN_0003a2b0 -- confirmed as dispatch_quest_event_code's case 3/4 handler: computes a value
// from param_2's (the quest/trap record) own position byte plus param_1*8 (a context-object type
// nibble from DAT_0024cff0).
void apply_quest_event_numeric_effect(int context_type, char *record, int tile_x, int tile_y)
{
  undefined2 uVar1;
  byte bVar2;
  void *iVar3;
  int iVar4;
  
  iVar4 = (((uw_object_hdr_t *)record)->zpos) + context_type * 8;
  if ((((uw_object_hdr_t *)record)->quality) == 3) {
    if (iVar4 * 0x10000 >> 0x10 < 0x68) {
      apply_area_terrain_effect(tile_x,tile_y,0xff,0xff,(short)(iVar4 * 0x10000 >> 0x13),0xff,0,0,0);
    }
  }
  else {
    iVar3 = get_object_record_by_slot_index(((uw_object_hdr_t *)record)->link & 0x1ff);
    uVar1 = ((uw_object_hdr_t *)iVar3)->position_word;
    bVar2 = (byte)uVar1;
    ((uw_object_hdr_t *)iVar3)->zpos = (byte)iVar4 & 0x7f;
  }
}



// was FUN_0003a398 -- the "booby-trapped book" item-use effect: confirmed by its own message ("The
// book explodes in your face!").
void trigger_exploding_book_trap()
{
  undefined4 uVar1;
  void *iVar2;
  ushort *local_10;   /* was int -- tilemap_lookup()+2 (64-bit ptr) */

  local_10 = (ushort *)((char *)tilemap_lookup(g_player_object->npc_xhome,
                                               g_player_object->npc_yhome) + 2);
  iVar2 = find_object_in_chain(&local_10,1,4,1,4);
  if (iVar2 != 0) {
    message_scroll_print_wrapped(s_The_book_explodes_in_your_face__00085644);
    uVar1 = *(undefined4 *)(DAT_00086df8 + 0x65);
    *(char *)(DAT_00086df8 + 0x65) = (char)uVar1;
    *(byte *)(DAT_00086df8 + 0x66) = (byte)((uint)uVar1 >> 8) | 1;
    *(char *)(DAT_00086df8 + 0x67) = (char)((uint)uVar1 >> 0x10);
    *(char *)(DAT_00086df8 + 0x68) = (char)((uint)uVar1 >> 0x18);
    reduce_item_quality_on_use(g_player_object,3);
    decrement_object_count(iVar2);
    discard_misplaced_object(0,iVar2,1);
    redraw_container_icon_slot();
    refresh_player_equipment_effects();
  }
}


// was FUN_0003a4a0 -- confirmed as dispatch_quest_event_code's case 0x29 handler, a parameterized
// sibling of trigger_exploding_book_trap: the same "book explodes" effect but checking a
// caller-specified tile (param_2,param_3) rather than the player's own position...
void trigger_exploding_book_trap_at_tile(int unused, int tile_x, int tile_y)
{
  undefined4 uVar1;
  void *iVar2;
  ushort *local_c;   /* was int -- tilemap_lookup()+2 (64-bit ptr) */

  local_c = (ushort *)((char *)tilemap_lookup(tile_x,tile_y) + 2);
  iVar2 = find_object_in_chain(&local_c,1,4,1,4);
  if (iVar2 != 0) {
    message_scroll_print_wrapped(s_The_book_explodes_in_your_face__00085644);
    uVar1 = *(undefined4 *)(DAT_00086df8 + 0x65);
    *(char *)(DAT_00086df8 + 0x65) = (char)uVar1;
    *(byte *)(DAT_00086df8 + 0x66) = (byte)((uint)uVar1 >> 8) | 1;
    *(char *)(DAT_00086df8 + 0x67) = (char)((uint)uVar1 >> 0x10);
    *(char *)(DAT_00086df8 + 0x68) = (char)((uint)uVar1 >> 0x18);
    reduce_item_quality_on_use(g_player_object,3);
    decrement_object_count(iVar2);
    discard_misplaced_object(0,iVar2,1);
    redraw_container_icon_slot();
    refresh_player_equipment_effects();
  }
}



// was FUN_0003a57c -- confirmed as dispatch_quest_event_code's case 0x2a handler: spawns a
// temporary NPC object (catalog id 0x40), sets its goal/state fields to force an immediate
// conversation, runs interact_talk_npc() against it, then frees the slot...
void trigger_scripted_npc_conversation()
{
  uw_mobile_object_t *iVar2;  /* was `int` -- truncated spawn_new_object's real pointer */

  iVar2 = (uw_mobile_object_t *)spawn_new_object(0x40, 1);
  iVar2->npc_whoami = 0x19;
  iVar2->npc_attitude = 3;
  iVar2->npc_goal = 10;
  interact_talk_npc();
  free_object_slot(&iVar2->hdr);
}



// was FUN_0003a5ec -- confirmed as dispatch_quest_event_code's case
// 0x39 handler: advances the scheduler by 4 units then displays book/
// scroll page 3.
void advance_scheduler_and_show_page3()
{
  scheduler_tick(4);
  display_book_or_scroll_page(3);
}


// was FUN_0003a604 -- for_each_object_of_type callback: unlinks and frees the given object
// (param_1) from its own current tile. Used by trigger_quest_milestone_cleanup_event to sweep away
// every instance of a set of object types.
int unlink_object_from_tile_callback(char *object)
{
  void *iVar1;

  iVar1 = tilemap_lookup(*(ushort *)(object + 0x16) >> 10,(*(ushort *)(object + 0x16) & 0x3f0) >> 4)
  ;
  unlink_and_free_object(iVar1 + 2,object);
  return 1;
}



// was FUN_0003a654 -- triggered by resolve_unique_npc_special_behavior's dispatch for a specific
// object "special behavior" byte (0x1a) value 0xe7: shows book/scroll page 2, sets a quest-flag bit
// (DAT_00086df8+0x6e)...
void trigger_quest_milestone_cleanup_event()
{
  undefined2 uVar1;
  ushort *puVar2;
  ushort *puVar3;
  int iVar4;
  char *tile_rec;

  display_book_or_scroll_page(2);
  iVar4 = 9;
  uVar1 = *(undefined2 *)(DAT_00086df8 + 0x6e);
  *(byte *)(DAT_00086df8 + 0x6e) = (byte)uVar1 | 4;
  *(char *)(DAT_00086df8 + 0x6f) = (char)((ushort)uVar1 >> 8);
  do {
    for_each_object_of_type(DAT_00085638[iVar4],0,0,unlink_object_from_tile_callback);
    iVar4 = (iVar4 + -1) * 0x1000000 >> 0x18;
  } while (0 < iVar4);
  tile_rec = tilemap_lookup(0x17,0x38);
  puVar3 = (ushort *)resolve_object_link(tile_rec + 2);
  while (puVar2 = puVar3, puVar2 != (ushort *)0x0) {
    puVar3 = (ushort *)resolve_object_link(puVar2 + 2);
    if ((((uw_object_hdr_t *)puVar2)->object_id) == 0x1a0) {
      object_list_unlink(tile_rec + 2,puVar2);
      free_object_slot(puVar2);
    }
  }
}


// was FUN_0003a924 -- resolves a difficulty/rating value for a class-0 (quality bits 0x1c0==0)
// object record param_1 by looking up one of two tables depending on a 2-bit sub-code in its low
// word: sub-code 0 indexes DAT_00202807, sub-codes 2/3 index DAT_002026d1.
int resolve_lock_difficulty_rating(ushort *lock)
{
  ushort uVar1;
  ushort uVar2;

  uVar1 = *lock;
  if ((uVar1 & 0x1c0) == 0) {
    uVar2 = uVar1 >> 4;
    if ((uVar2 & 3) == 0) {
      return (int)(char) g_melee_type_props[(short)(uVar1 & 0xf)].durability;
    }
    if ((((uVar2 & 3) != 1) && ((uVar2 & 3) != 0)) && ((uVar2 & 3) < 4)) {
      return (int)(char) g_armor_type_props[((uVar1 & 0x3f) - 0x20)].durability;
    }
  }
  return -1;
}


// WARNING: Removing unreachable block (ram,0x0003a9ec)

// was FUN_0003a99c -- the lockpicking skill-check resolver: looks up the lock's difficulty
// (resolve_lock_difficulty_rating), writes an estimated difficulty display value to *param_3, then
// rolls a skill check (roll_skill_check) against the player's lockpicking skill (param_2).
uint attempt_pick_lock(ushort *lock, int skill, ushort *out_difficulty)
{
  undefined1 uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  int iVar5;
  uint uVar6;
  undefined2 uVar7;
  ushort uVar9;
  short local_20;
  int iVar8;
  
  iVar5 = resolve_lock_difficulty_rating(lock);
  if ((short)iVar5 == -1) {
    return 0;
  }
  uVar9 = *(byte *)(lock + 4) & 0x3f;
  iVar8 = (iVar5 * 3 - (int)(short)((int)(short)uVar9 >> 1)) - skill;
  uVar7 = (undefined2)iVar8;
  if (iVar8 * 0x10000 >> 0x10 < 0xf) {
    uVar7 = 0xf;
  }
  *out_difficulty = uVar7;
  sVar3 = roll_skill_check(skill,iVar5);
  if (sVar3 == -1) {
    uVar6 = ce_rand();
    if ((int)((*(byte *)(lock + 4) & 0x3f) + (int)(short)skill) < (int)(uVar6 & 0x3f)) {
      return 0xfffffffe;
    }
    uVar4 = ce_rand();
    local_20 = -4 - (uVar4 & 7);
  }
  else {
    if (sVar3 == 0) {
      return 1;
    }
    if (sVar3 == 1) {
      sVar3 = ordint_divmod(5,(int)(short)skill).quot;
      local_20 = sVar3 + 3;
    }
    else if (sVar3 == 2) {
      local_20 = 0x40;
    }
  }
  iVar5 = (int)local_20;
  uVar1 = *(undefined1 *)(lock + 5);
  iVar8 = iVar5 + (short)uVar9;
  if (0x3f < iVar8) {
    *(byte *)(lock + 4) = *(byte *)(lock + 4) | 0x3f;
    *(undefined1 *)(lock + 5) = uVar1;
    return 3;
  }
  if (iVar8 < 1) {
    uVar6 = CONCAT11(uVar1,*(undefined1 *)(lock + 4)) & 0xffc0;
    *(char *)(lock + 4) = (char)uVar6;
    *(char *)(lock + 5) = (char)(uVar6 >> 8);
    return 0xfffffffe;
  }
  bVar2 = *(byte *)(lock + 4);
  uVar6 = (uint)CONCAT11(uVar1,bVar2);
  *(byte *)(lock + 4) = (bVar2 ^ (char)local_20 + (char)uVar9) & 0x3f ^ bVar2;
  if (0 < iVar5) {
    uVar6 = 2;
  }
  *(undefined1 *)(lock + 5) = uVar1;
  if (iVar5 < 1) {
    return 0xffffffff;
  }
  return uVar6;
}


// was FUN_0004ac98 -- dispatch_trap_type_effect's case-2 trap handler: spawns a fixed object class
// (0x14) near the player, aimed from the trap record's own quality bits (+4/+6) and positioned at
// param_2/ param_3 (the trap's tile coordinates)...
void spawn_trap_hazard_object(ushort *trap_record, short tile_x, short tile_y)
{
  DAT_00202a38 = *(byte *)((char *)trap_record + 6) & 0x3f | (*(byte *)((char *)trap_record + 4) & 0x3f) << 5;
  DAT_00202a48 = 0x14;
  DAT_00202a40 = 2;
  DAT_00202a3c = 2;
  DAT_00202a54 = 0;
  DAT_00202a44 = trap_record;
  DAT_00202a4c = tile_x;
  DAT_00202a50 = tile_y;
  spawn_object_near_player();
}

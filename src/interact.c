/* Object interaction dispatch: the default click handler and the per-cursor-mode handlers (talk,
   look, use, attack). Split out of uw.c (the original monolithic decompile) once these functions'
   real roles were confirmed. */
#include "headers/mouselook.h"
#include "headers/interact.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

ushort DAT_001007c4;
char s__DATA_cnv_ark_00084fc8[] = "\\DATA\\cnv.ark";
/* Tilemap byte addresses (DAT_0023b814 + tile*4), not ints -- Ghidra
   typed them `int` and truncated the 64-bit pointer. Set in pick_object_under_cursor
   from the object-pick result, consumed by target_in_range / object_list_unlink. */
char *DAT_002020b0;
static char *DAT_002020a8;
static undefined4 DAT_002020ec;
short DAT_002020ac;

short DAT_000858c4;
static int DAT_002020e0;
void (*const PTR_FUN_000858c8_table[5])(void) = {
  interact_use,        /* 0: use (mode 1, bottommost icon) */
  interact_attack,      /* 1: attack (mode 2) */
  interact_look,        /* 2: look / examine (mode 3) */
  interact_default,     /* 3: get (mode 4) */
  interact_talk_npc,    /* 4: talk (mode 5, topmost icon) */
};
/* These four were all mangled by Ghidra the same way: embedded spaces rendered as underscores, and
   in s_Your_bumbling_attempts_have_set_o's case the tail of the string ("ff the ", plus a trailing
   space) was dropped entirely. */
static char s_Unable_to_defuse_trap__0008736c[] = "Unable to defuse trap.\n";
static char s_Your_bumbling_attempts_have_set_o_00087384[] = "Your bumbling attempts have set off the ";
static char s_was_successfully_dearmed__000873b0[] = " was successfully dearmed.\n";
static char s_on_the_000873cc[] = " on the ";
/* HACK: was `undefined4` -- truncated a real 64-bit object pointer. */
ushort *DAT_0024cff0;
static short DAT_0024cfd0;
static short DAT_0024cfd8;






// was FUN_0003ee90
void interact_default()
{
  int iVar1;
  int iVar2;
  ushort *puVar3;

  puVar3 = (ushort *)0x0;
  iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
  iVar2 = target_line_of_sight((int)DAT_000858c4,g_interact_target);
  if (DAT_002020ec == 0) {
    if (DAT_002020e0 != 0) {
      iVar1 = object_ptr_in_arena(g_interact_target);
      if ((iVar1 != 0) && ((*g_interact_target & 0x1c0) == 0x40)) {
        interact_talk_npc();
        return;
      }
      interact_use();
      return;
    }
    if ((*g_interact_target & 0x1ff) == 0x1ca) {
      if ((iVar1 != 0) && (iVar2 == 0)) {
        use_object_on_target(g_player_object,g_interact_target,0);
      }
      goto LAB_0003f11c;
    }
    iVar1 = 0x60;
  }
  else {
    if ((iVar1 != 0) && (iVar2 == 0)) {
      if (((*g_interact_target & 0x8000) != 0) &&
         (((g_interact_target[3] & 0x8000) == 0 && ((g_interact_target[3] & 0xffc0) != 0x40)))) {
        /* BUG FIX: was `FUN_000470fc();` -- dropped its only argument. g_interact_target (the
           object this whole "grab" handler is operating on throughout this function) is the obvious
           intended argument -- same dropped-argument idiom fixed repeatedly elsewhere this session. */
        puVar3 = (ushort *)prompt_split_object_stack((undefined1 *)g_interact_target);
        if (puVar3 == (ushort *)0x0) {
          return;
        }
        if (puVar3 != g_interact_target) {
          object_list_insert_head(g_interact_target + 2,puVar3);
        }
      }
      iVar1 = check_object_carry_weight(g_interact_target);
      if (iVar1 == 0) {
        if ((puVar3 != (ushort *)0x0) && (puVar3 != g_interact_target)) {
          iVar1 = (g_interact_target[3] & 0xffc0) + (puVar3[3] & 0xffc0);
          *(byte *)(g_interact_target + 3) = (byte)iVar1 ^ (byte)g_interact_target[3] & 0x3f;
          *(char *)((char *)g_interact_target + 7) = (char)((uint)iVar1 >> 8);
          object_list_unlink(g_interact_target + 2,puVar3);
        }
        print_scroll_message_by_id(0x5f);
        return;
      }
      iVar1 = object_or_contents_has_type(g_interact_target,0x126);
      if (iVar1 != 0) {
        *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf0;
      }
      emit_noise_alert(g_interact_target,0);
      finalize_object_pickup(g_interact_target);
      g_cursor_holding_state = 1;
      attach_picked_up_object_to_cursor(g_interact_target);
      return;
    }
    iVar1 = (short)iVar1 + 0x5d;
  }
  print_scroll_message_by_id(iVar1);
LAB_0003f11c:
  wait_for_click_release(1);
}



// was FUN_0003f128
void interact_talk_npc()
{
  wait_for_click_release(1);
  attempt_talk_interaction(g_interact_target);
}




// was FUN_0003f14c
void interact_look()
{
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  uint local_18;

  DEBUG(INFO, "Interact Look");
  
  iVar2 = target_in_range(0x48,g_interact_target,DAT_002020b0);
  if ((iVar2 == 0) || (uVar3 = 1, DAT_002020ec != 0)) {
    uVar3 = 0;
  }
  dispatch_object_action(g_interact_target,uVar3);
  if (g_cursor_mode == 3) {
    sVar1 = roll_container_lockpick_check(g_interact_target,*(undefined1 *)(DAT_00086df8 + 0x2c));
    if (0 < sVar1) {
      local_18 = 1;
      sVar1 = prompt_yes_no_scroll(0,0xf4,&local_18);
      if ((sVar1 != 0) && (sVar1 < 4)) {
        local_18 = (uint)(sVar1 == 2);
        /* HACK: was a bare `echo_yes_no_to_scroll();` -- dropped argument, the same class of bug
           fixed repeatedly elsewhere in this file. local_18, just set on the line above from the
           prompt's own answer, is obviously the intended argument here. */
        echo_yes_no_to_scroll(local_18);
      }
      message_scroll_print_wrapped(&s_scroll_newline_0008522c);
      if (local_18 != 0) {
        roll_container_trap_disarm_check(g_interact_target,*(undefined1 *)(DAT_00086df8 + 0x2b));
      }
    }
  }
  else {
    DAT_002020e0 = 1;
  }
  trigger_object_trap_or_use_action(g_player_object,g_interact_target,5,(int)DAT_002020a0,DAT_002020a4);
  if (g_cursor_mode == 3) {
    wait_for_click_release(1);
  }
  else {
    iVar2 = wait_for_key_or_mouse_move(1);
    if (iVar2 != 0) {
      interact_default();
    }
  }
  DAT_002020e0 = 0;
}



// was FUN_0003f2c4, briefly named interact_converse by an earlier pass.
void interact_use()
{
  int iVar1;

  DEBUG(INFO, "Interact use");

  wait_for_click_release(1);
  iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
  if ((iVar1 == 0) || (iVar1 = target_line_of_sight((int)DAT_000858c4,g_interact_target), iVar1 != 0)) {
    if ((*g_interact_target & 0x1fe) != 0x16e) {
      print_scroll_message_by_id(0xb9);
    }
  }
  else {
    use_object_on_target(g_player_object,g_interact_target,0);
  }
}



/* True when the cursor is inside the 3D viewport's registered rect (the same bounds
   pick_object_under_cursor itself guards with). */
static int cursor_in_game_view(void)
{
  return uw_point_in_game_view(g_mouse_x,g_mouse_y);
}

/* Desktop hotkey Q: Look at whatever is under the cursor, exactly as a plain click does in look
   mode (handle_game_view_click's index-2 dispatch), including the terrain description when the pick
   hits a wall or floor instead of an object. */
void quick_look_at_cursor(int unused)
{
  (void)unused;
  if (g_cursor_holding_state != 0 || !cursor_in_game_view()) return;
  g_interact_target = pick_object_under_cursor(2);
  if (g_interact_target == 0) {
    describe_picked_terrain(2,(int)DAT_002020ac);
    return;
  }
  interact_look();
}

/* Desktop hotkey E: talk to a critter under the cursor; otherwise Use the object, or -- if it is
   something the player can pick up -- grab it into the cursor/inventory instead, the way get mode
   does. Always ends in a Use-mode response, even for terrain. */
void quick_use_object_at_cursor(int unused)
{
  (void)unused;
  if (g_cursor_holding_state != 0 || !cursor_in_game_view()) return;
  g_interact_target = pick_object_under_cursor(2);
  /* Nothing under the cursor (a wall, the floor, the void): exactly what a click does in Use mode
     (handle_game_view_click's dispatch index 0), i.e. the "cannot use that" message. */
  if (g_interact_target == 0) {
    describe_picked_terrain(0,(int)DAT_002020ac);
    return;
  }
  /* A critter (object ids 0x40-0x7f, same test interact_default's talk branch uses): talk to it.
     Mouselook releases itself when the conversation screen takes over the view. */
  if (object_ptr_in_arena(g_interact_target) != 0 && (*g_interact_target & 0x1c0) == 0x40) {
    interact_talk_npc();
    return;
  }
  if (DAT_002020ec != 0) {
    interact_default();
    /* A picked-up item is now on the cursor and needs the free pointer to drag it somewhere
       (inventory, a container, the floor): leave mouselook. */
    if (g_cursor_holding_state != 0 && uw_mouselook_active()) uw_toggle_mouselook(0);
  }
  else {
    interact_use();
  }
}


// was FUN_0003f368
void interact_attack()
{
  short *psVar1;
  short sVar2;
  short sVar3;
  int iVar4;

  DEBUG(INFO, "Interact attack");

  psVar1 = DAT_00085a6c;
  sVar2 = ordint_divmod(DAT_0023be88 + 2,DAT_00085a6c[1] * 3).quot;
  sVar3 = ordint_divmod(DAT_0023bd80 + 2,*psVar1 * 3).quot;
  iVar4 = sVar2 * 3 + (int)sVar3;
  if (iVar4 * 0x10000 >> 0x10 < 2) {
    iVar4 = 2;
  }
  tick_weapon_swing_state(iVar4 + 1);
}







// was FUN_0006fed4 -- triggers the "illustrated book/scroll" full- screen picture feature (via
// record_illustration_discovery_and_display -> display_book_or_scroll_page)...
void trigger_terrain_discovery_illustration()
{
  record_illustration_discovery_and_display(0x100,(int)DAT_00201b68);
}






// was FUN_0006fee8 -- trigger_terrain_discovery_illustration's sibling, illustration index 0x101:
// fired after reading a sign/plaque or gravestone inscription whose text is non-empty (param_1 is
// the inscription's own first character, only used here as a "was there any text at all" guard).
void trigger_inscription_illustration(int first_char)
{
  if ((short)first_char != 0) {
    record_illustration_discovery_and_display(0x101,first_char);
  }
}






// was FUN_00072598 -- rolls a skill check (roll_skill_check(param_2,8)) against the first contained
// item in container param_1, but only if that item's own quality/type field (after resolving
// through a link when a specific bit is set) is below 3...
int roll_container_lockpick_check(void *container_ptr, int skill)
{
  char *container = (char *)container_ptr;
  byte *pbVar1;
  undefined4 uVar2;
  ushort *local_c;
  
  if ((((*(byte *)(container + 1) & 0x80) == 0) &&
      (local_c = (ushort *)(container + 6), (*local_c & 0xffc0) != 0)) &&
     (pbVar1 = (byte *)find_object_in_chain(&local_c,0,6,0xffffffff,0xffff), pbVar1 != (byte *)0x0)) {
    if (0x1f < (((uw_object_hdr_t *)pbVar1)->object_id & 0x30)) {
      pbVar1 = (byte *)resolve_object_link((ushort *)(pbVar1 + 6)); /* confirmed via ARM disassembly, 0x72628 */
    }
    if ((((uw_object_hdr_t *)pbVar1)->object_id & 0x3f) < 3) {
      uVar2 = roll_skill_check(skill,8);
      return uVar2;
    }
  }
  return 0;
}






// was FUN_0007266c -- roll_container_lockpick_check's sibling for the "disarm trap" mechanic: same
// container-contents/quality-gated setup, but rolls a disarm skill check
// (roll_skill_check(param_2,8)) and handles all three outcomes -- critical failure...
int roll_container_trap_disarm_check(void *container_ptr, int skill)
{
  char *container = (char *)container_ptr;
  char *wptr_53920;
  char *wptr_53945;
  char *wptr_53956;
  char cVar1;
  short sVar2;
  byte *pbVar3;
  byte *pbVar4;
  char *pcVar5;
  char *pcVar6;
  byte *pbVar7;
  undefined4 uVar8;
  char acStackY_84f50 [544536];
  ushort *local_34 [2];
  char acStack_2c [20];
  
  uVar8 = 0;
  if (((*(byte *)(container + 1) & 0x80) == 0) &&
     (local_34[0] = (ushort *)(container + 6), (*local_34[0] & 0xffc0) != 0)) {
    pbVar3 = (byte *)find_object_in_chain(local_34,0,6,0xffffffff,0xffff);
    if (pbVar3 != (byte *)0x0) {
      if ((((uw_object_hdr_t *)pbVar3)->object_id & 0x30) < 0x20) {
        pbVar7 = (byte *)0x0;
        pbVar4 = pbVar3;
      }
      else {
        pbVar4 = (byte *)resolve_object_link(pbVar3 + 6);
        pbVar7 = pbVar3;
      }
      if ((((uw_object_hdr_t *)pbVar4)->object_id & 0x3f) < 3) {
        uVar8 = roll_skill_check(skill,8);
        if ((short)uVar8 < 1) {
          if ((short)uVar8 < 0) {
            message_scroll_print_wrapped(s_Your_bumbling_attempts_have_set_o_00087384);
            sVar2 = build_object_display_name(acStack_2c,pbVar4,0,0);
            if (sVar2 == 0) {
              pcVar6 = s_UNNAMED_00084f24;
    wptr_53920 = acStackY_84f50;
              do {
                cVar1 = *pcVar6;
                *wptr_53920 = cVar1; wptr_53920 = wptr_53920 + 1;
                pcVar6 = pcVar6 + 1;
              } while (cVar1 != '\0');
            }
            message_scroll_print_wrapped(acStack_2c);
            message_scroll_print_wrapped(&DAT_00084f20);
            if (pbVar7 == (byte *)0x0) {
              apply_trap_or_link_effect(g_player_object,container,pbVar4,(int)DAT_002020a0,DAT_002020a4);
              refresh_object_link_chain(local_34[0],pbVar4);
            }
            else {
              resolve_skill_gated_unlock_or_use(g_player_object,container,pbVar7,0xffff);
            }
          }
          else {
            message_scroll_print_wrapped(s_Unable_to_defuse_trap__0008736c);
          }
        }
        else {
          sVar2 = build_object_display_name(acStack_2c,pbVar4,0,0);
          pcVar6 = s_UNNAMED_00084f24;
    wptr_53956 = acStackY_84f50;
          if (sVar2 == 0) {
            pcVar5 = pcVar6;
    wptr_53945 = acStackY_84f50;
            do {
              cVar1 = *pcVar5;
              *wptr_53945 = cVar1; wptr_53945 = wptr_53945 + 1;
              pcVar5 = pcVar5 + 1;
            } while (cVar1 != '\0');
          }
          message_scroll_print_wrapped(&DAT_00085c88);
          message_scroll_print_wrapped(acStack_2c);
          message_scroll_print_wrapped(s_on_the_000873cc);
          sVar2 = build_object_display_name(acStack_2c,container,0,0);
          if (sVar2 == 0) {
            do {
              cVar1 = *pcVar6;
              *wptr_53956 = cVar1; wptr_53956 = wptr_53956 + 1;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
          }
          message_scroll_print_wrapped(acStack_2c);
          message_scroll_print_wrapped(s_was_successfully_dearmed__000873b0);
          free_linked_object_recursive(local_34[0]);
        }
      }
    }
  }
  else {
    uVar8 = 0;
  }
  return uVar8;
}


// was FUN_0007cdbc -- confirmed by its callers as the general skill-gated "use item on object"
// resolver behind force_unlock_target_object...
uint resolve_skill_gated_unlock_or_use(void *object_ptr, void *key_item_ptr, void *lock_link_ptr, ushort key_id)
{
  ushort *object = (ushort *)object_ptr;
  ushort *key_item = (ushort *)key_item_ptr;
  ushort *lock_link = (ushort *)lock_link_ptr;
  ushort uVar1;
  short sVar2;
  char *iVar3;  /* was `int` -- truncated resolve_object_link's real `void *` return */
  uint uVar4;
  char *iVar5;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  byte bVar6;
  byte bVar7;
  
  bVar6 = (byte)*lock_link;
  while( true ) {
    if ((bVar6 & 0x30) != 0x20) {
      return 2;
    }
    if ((short)key_id < 0) break;
    if ((((key_item == (ushort *)0x0) || ((*key_item & 0x1f0) != 0x170)) || ((*key_item & 0xf) < 8)) ||
       ((lock_link[2] & 0xffc0) == 0)) {
      if ((byte)(&DAT_0024cfe0)[(short)(bVar6 & 0xf)] != key_id) {
        return 2;
      }
      if (object != (ushort *)0x0) {
        if ((*object & 0x1ff) == 0x7f) {
          if ((*lock_link & 0x800) == 0) {
            return 2;
          }
          if (((key_id == 5) && (((byte)lock_link[1] & 0x7f) != 0)) &&
             (sVar2 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x2c),(byte)lock_link[1] & 0x7f),
             sVar2 < 1)) {
            return 2;
          }
        }
        else if ((*object & 0x1c0) == 0x40) {
          if ((*lock_link & 0x1000) == 0) {
            return 2;
          }
          if ((*lock_link & 0x1c0) == 0x140) {
            return 2;
          }
        }
        else {
          uVar1 = *lock_link;
          if ((((uVar1 & 0x1000) != 0) && ((uVar1 & 0x1c0) != 0x140)) && ((uVar1 & 0x800) == 0)) {
            return 2;
          }
        }
      }
      break;
    }
    lock_link = (ushort *)resolve_object_link(lock_link + 2);
    bVar6 = (byte)*lock_link;
  }
  iVar3 = (char *)resolve_object_link(lock_link + 3);
  bVar6 = (byte)lock_link[2] & 0x3f;
  bVar7 = (byte)lock_link[3] & 0x3f;
  if (iVar3 == 0) {
    return 2;
  }
  uVar4 = apply_trap_or_link_effect(object,key_item,iVar3,bVar6,bVar7);
  if ((*lock_link & 0x400) == 0) {
    if ((lock_link[3] & 0xffc0) != 0) {
      iVar5 = (char *)tilemap_lookup(bVar6,bVar7);
      refresh_object_link_chain(iVar5 + 2,iVar3);
      return uVar4 | 0x20;
    }
    return uVar4;
  }
  return uVar4;
}





/* HACK: param_2 and param_3 were both `undefined4` -- truncated real 64-bit pointers (both are
   `ushort *` at every call site, e.g. resolve_skill_gated_unlock_or_use's own `param_2` and
   `iVar3`/ resolve_object_link's result, in src/interact.c now)... */
// was FUN_0007d074 -- thin re-entrancy-guarded wrapper around the trap/link-effect type dispatcher
// dispatch_trap_type_effect (not yet named, a large switch on the trap/link record's type code).
int apply_trap_or_link_effect(void *trigger_object_ptr, void *trigger_link_ptr, void *trap_record_ptr, int tile_x, int tile_y)
{
  char *trigger_object = (char *)trigger_object_ptr;
  ushort *trigger_link = (ushort *)trigger_link_ptr;
  ushort *trap_record = (ushort *)trap_record_ptr;
  if (DAT_0024cff4 == 0) {
    DAT_0024cff0 = trigger_link;
    DAT_0024cff4 = trigger_object;
  }
  dispatch_trap_type_effect(trap_record,tile_x,(int)tile_y);
  DAT_0024cff4 = 0;
  return 0;
}





// was FUN_0007deec -- recursive helper for refresh_object_link_chain: walks param_1's object link
// chain (resolve_object_link), and for each entry whose class matches 0x1a0 (bits 0x1f0) and whose
// quality/ tag field (bits >>6) equals the shared "current tag" global...
/* was `undefined4` -- truncated the real object-record pointer (passed to resolve_object_link and
   to itself recursively as `puVar1+3`), latent until those calls started actually using their
   arguments */
void purge_tagged_objects_from_chain(void *link_field_ptr)
{
  ushort *link_field = (ushort *)link_field_ptr;
  ushort *puVar1;
  
  for (puVar1 = (ushort *)resolve_object_link(link_field); puVar1 != (ushort *)0x0; /* confirmed via ARM disassembly, 0x7deec */
      puVar1 = (ushort *)resolve_object_link(puVar1 + 2)) {
    if (((((uw_object_hdr_t *)puVar1)->object_id & 0x1f0) == 0x1a0) && ((int)DAT_0024cfd0 == (uint)(((uw_object_hdr_t *)puVar1)->link))) {
      object_list_unlink(link_field,puVar1);
      free_object_slot(puVar1);
      ((uw_object_hdr_t *)puVar1)->link_word_low = ((uw_object_hdr_t *)puVar1)->owner;
      ((uw_object_hdr_t *)puVar1)->link_word_high = 0;
      DAT_0024cfd8 = DAT_0024cfd8 + -1;
    }
    if ((((uw_object_hdr_t *)puVar1)->is_quant == 0) && (((uw_object_hdr_t *)puVar1)->link != 0)) {
      purge_tagged_objects_from_chain(puVar1 + 3); /* was called with no argument; confirmed via ARM disassembly, 0x7dfbc */
    }
  }
}



// was FUN_0007dfd8 -- confirmed by callers' own comments (resolve_skill_gated_unlock_or_use,
// trigger_object_trap_or_use_action) as the "refresh" step run after a lock/link record's own
// use/pull action.
void refresh_object_link_chain(void *chain_link_ptr, void *object_ptr)
{
  char *chain_link = (char *)chain_link_ptr;
  char *object = (char *)object_ptr;
  undefined4 uVar1;
  char *iVar2;
  short sVar3;
  ushort uVar4;
  
  DAT_0024cfd8 = (short)((*(byte *)(object + 1) & 0x1e) >> 1);
  if (DAT_0024cfd8 != 0) {
    DAT_0024cfd0 = encode_object_slot_index(object);
    iVar2 = DAT_002029cc;
    sVar3 = DAT_0024cfd8;
    for (uVar4 = 0; (0 < sVar3 && (uVar4 < 0x1000)); uVar4 = uVar4 + 1) {
      if ((*(ushort *)(iVar2 + 2) & 0xffc0) != 0) {
        purge_tagged_objects_from_chain(iVar2 + 2); /* was called with no argument, same bug class as resolve_object_link's */
        sVar3 = DAT_0024cfd8;
      }
      iVar2 = iVar2 + 4;
    }
  }
  uVar1 = encode_object_slot_index(object);
  iVar2 = (char *)find_object_by_encoded_slot_in_chain(chain_link,1,uVar1);
  if (iVar2 != 0) {
    unlink_and_free_object(DAT_002046b4,iVar2);  /* ARM 0x7e0c0-0x7e0cc: r0 = DAT_002046b4, r1 = the find result */
  }
}





// was FUN_00028488 -- the actual talk-interaction worker: handles the mantra-chant and
// special-lever/statue item ids, then for creatures checks whether a real CNV.ARK conversation
// record exists (probe_archive_entry_exists) and switches to Talk game mode if so...
void attempt_talk_interaction(void *target_ptr)
{
  ushort *target = (ushort *)target_ptr;
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  short sVar2;
  undefined4 uVar3;
  char *pcVar4;
  ushort uVar5;
  ushort uVar6;
  char acStack_114 [260];
  
  uVar6 = *target & 0x1ff;
  if (uVar6 == 0x157) {
    handle_mantra_chant();
    return;
  }
  if (uVar6 == 0x16e) {
    if (((&DAT_0023add0)[(byte)target[3] & 0x3f] & 0xff) != 8) {
      return;
    }
    print_scroll_message_by_id(0x110);
    return;
  }
  if ((*target & 0x1c0) != 0x40) {
    uVar3 = 0xe00;
    goto LAB_0002865c;
  }
  uVar6 = (ushort)(byte)target[0xd];
  DAT_00100674 = target;
  if (((uVar6 == 0x16) || (uVar6 == 0x8e)) || (uVar6 == 0xe7)) {
LAB_000285e4:
    if (uVar6 == 0) {
      uVar6 = ((byte)*target & 0x3f) + 0x100;
    }
    DAT_001007c4 = uVar6;
    ce_memset(acStack_114,0,0x104);
    pcVar4 = &DAT_0023cca8;
    stack0xffdc3244_ptr = acStack_114;
    do {
      cVar1 = *pcVar4;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_cnv_ark_00084fc8);
    sVar2 = probe_archive_entry_exists(acStack_114,uVar6);
    if (0 < sVar2) {
      change_game_mode(4);
      return;
    }
  }
  else {
    uVar5 = *(ushort *)((char *)target + 0xb) & 0xf;
    if ((((((((uVar5 != 5) && (uVar5 != 6)) && (uVar5 != 9)) ||
           ((*(ushort *)((char *)target + 0xb) & 0xff0) != 0x10)) && ((target[7] & 0xc0) != 0)) ||
         ((*(byte *)((char *)target + 0x19) & 0x40) != 0)) && (uVar6 != 0xff)) || (uVar5 == 10))
    goto LAB_000285e4;
  }
  uVar3 = 0xe01;
LAB_0002865c:
  /* Was two separate calls with message_scroll_print_wrapped()'s arg dropped -- same
     register-forwarding hazard already fixed at load_npc_conversation_record's own sVar1<0 branch
     (uw.c ~10987, see its comment) and, unfixed... */
  message_scroll_print_wrapped(get_message_string(uVar3));
}


// was FUN_0003ee10 -- called from interact_default (src/interact.c:90) right before a grabbed
// object is attached to the cursor.
void finalize_object_pickup(void *object_ptr)
{
  char *object = (char *)object_ptr;
  if (DAT_002020ec != 0) {
    trigger_object_trap_or_use_action(g_player_object,object,2,(int)DAT_002020a0,DAT_002020a4);
    object_list_unlink(DAT_002020a8,object);
    set_pending_update_flags(2);
    DAT_002020ec = 0;
  }
}


/* param_2 (the picked object, g_interact_target -- a real ushort*) and param_3 (DAT_002020b0 -- a
   tilemap byte address) were both declared `int`, truncating the 64-bit pointers every caller
   passes... */
// was FUN_0003e694
int target_in_range(short range_squared, void *actor_ptr, char *target)
{
  char *actor = (char *)actor_ptr;
  short sVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  ushort uVar5;
  ushort uVar6;
  undefined4 uVar7;
  uint uVar8;

  sVar1 = (short)((int)(target - (char *)DAT_0023b814) >> 2);
  uVar8 = (int)sVar1 & 0x3f;
  DAT_002020a0 = (undefined2)uVar8;
  iVar3 = (int)sVar1 >> 6;
  DAT_002020a4 = (undefined2)iVar3;
  if (range_squared == 0) {
    uVar7 = 1;
  }
  else {
    uVar5 = g_player_object->hdr.position_word;
    uVar6 = *(ushort *)(actor + 2);
    iVar2 = ((((uint)(uVar6 >> 0xd) + (uint)(g_player_object->npc_xhome) * -8) -
              (uint)(uVar5 >> 0xd)) + uVar8 * 8) * 0x10000;
    uVar8 = iVar2 >> 0x1f;
    iVar3 = (((((uVar6 & 0x1c00) >> 10) + (g_player_object->npc_yhome) * -8) -
              ((uVar5 & 0x1c00) >> 10)) + iVar3 * 8) * 0x10000;
    uVar4 = iVar3 >> 0x1f;
    iVar2 = (int)(((iVar2 >> 0x10 ^ uVar8) - uVar8) * 0x10000) >> 0x10;
    iVar3 = (int)(((iVar3 >> 0x10 ^ uVar4) - uVar4) * 0x10000) >> 0x10;
    if (((iVar2 * iVar2 + iVar3 * iVar3 <= (int)range_squared) &&
        (iVar3 = (int)(((uVar5 & 0x7f) - (uVar6 & 0x7f)) * 0x10000) >> 0x10,
        iVar3 <= (DAT_0023bc94 + 1) * 0xc)) && ((-1 - DAT_0023bc94) * 0x18 <= iVar3)) {
      return 1;
    }
    uVar7 = 0;
  }
  return uVar7;
}



// was FUN_0003e83c
/* was int -- truncated the tile-record pointer target_line_of_sight passes */
uint object_chain_max_barrier(char *tile)
{
  ushort *puVar1;
  uint uVar2;

  uVar2 = 0xffffffff;
  puVar1 = (ushort *)(tile + 2);
  while (puVar1 = (ushort *)resolve_object_link(puVar1), puVar1 != (ushort *)0x0) {
    if ((*puVar1 & 0x1ff) == 0x164) {
      if ((short)uVar2 < (short)(puVar1[1] & 0x7f)) {
        uVar2 = (int)(short)puVar1[1] & 0x7f;
      }
    }
    puVar1 = puVar1 + 2;
  }
  return uVar2;
}



// was FUN_0003e8b0
/* was int -- truncated g_interact_target; deref'd at param_2+2 */
int target_line_of_sight(short target_class, void *target_ptr)
{
  char *target = (char *)target_ptr;
  bool bVar1;
  ushort uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  byte *pbVar6;
  short sVar7;
  short sVar8;
  uint uVar9;
  uint uVar10;
  short sVar11;
  uint uVar12;
  uint uVar13;
  int iVar14;
  
  if (target_class != 0) {
    uVar2 = g_player_object->npc_xhome;
    uVar9 = (uint)uVar2;
    uVar10 = g_player_object->npc_yhome;
    /* tilemap_lookup returns a 64-bit tile-record pointer; `int iVar5`
       truncated it and the very next line dereferenced the result. Use
       the byte* local this function already has for the same call later. */
    pbVar6 = (byte *)tilemap_lookup(uVar9,uVar10);
    uVar13 = (uint)DAT_002020a4;
    sVar4 = (&DAT_0023ae40)[pbVar6[1] >> 2 & 0xf];
    uVar12 = (uint)DAT_002020a0;
    iVar14 = (int)DAT_002020a0;
    iVar5 = (int)(short)uVar2;
    sVar7 = (short)uVar10;
    if ((iVar14 != iVar5) || (DAT_002020a4 != sVar7)) {
      if (iVar14 < iVar5) {
        sVar11 = -1;
      }
      else {
        sVar11 = 1;
        if (iVar14 <= iVar5) {
          sVar11 = 0;
        }
      }
      if (DAT_002020a4 < sVar7) {
        sVar8 = -1;
      }
      else {
        sVar8 = 1;
        if (DAT_002020a4 <= sVar7) {
          sVar8 = 0;
        }
      }
      iVar5 = ((DAT_0023bc94 + 1) * 0x10000 >> 0x10) << 0x13;
      uVar2 = g_player_object->hdr.zpos;
      if (iVar5 >> 0x10 < (int)(short)uVar2) {
        sVar7 = uVar2 - (short)((uint)iVar5 >> 0x10);
      }
      else {
        sVar7 = 0;
      }
      iVar5 = (int)(short)(*(byte *)(target + 2) & 0x7f);
      iVar3 = (int)sVar7;
      if ((iVar3 <= iVar5) &&
         (iVar5 <= iVar3 + ((((DAT_0023bc94 + 1) * 0x10000 >> 0x10) << 0x15) >> 0x10))) {
        do {
          uVar9 = uVar9 + (int)sVar11;
          if (((sVar11 < 0) && ((int)(uVar9 * 0x10000) >> 0x10 < iVar14)) ||
             ((0 < sVar11 && (iVar14 < (int)(uVar9 * 0x10000) >> 0x10)))) {
            uVar9 = uVar12;
          }
          uVar10 = uVar10 + (int)sVar8;
          if (((sVar8 < 0) && ((int)(uVar10 * 0x10000) >> 0x10 < (int)(short)uVar13)) ||
             ((0 < sVar8 && ((int)(short)uVar13 < (int)(uVar10 * 0x10000) >> 0x10)))) {
            uVar10 = uVar13;
          }
          pbVar6 = (byte *)tilemap_lookup(uVar9,uVar10);
          sVar7 = object_chain_max_barrier((char *)pbVar6);  /* arg dropped by Ghidra -- it's the tile just looked up */
          bVar1 = false;
          iVar14 = (int)sVar7;
          if ((((iVar14 < 0) || (iVar5 < iVar14)) || (bVar1 = iVar3 <= iVar14, !bVar1)) &&
             (((int)(uint)(*pbVar6 >> 4) < iVar3 >> 3 && (target_class == 0x90)))) {
            return 1;
          }
          uVar12 = (uint)DAT_002020a0;
          uVar13 = (uint)DAT_002020a4;
          iVar14 = (int)DAT_002020a0;
          if (((short)uVar9 == iVar14) && ((short)uVar10 == DAT_002020a4)) {
            return 0;
          }
        } while ((((0x90 < target_class) || (bVar1)) ||
                 ((ushort)(&DAT_0023ae40)[pbVar6[1] >> 2 & 0xf] == 0)) ||
                ((uint)(ushort)(&DAT_0023ae40)[pbVar6[1] >> 2 & 0xf] == (int)sVar4));
      }
      return 1;
    }
  }
  return 0;
}



// was FUN_0003ec00
ushort *pick_object_under_cursor(int mode)
{
  byte bVar1;
  int iVar2;
  ushort *puVar3;
  uint uVar4;
  /* render_dungeon_view_frame() re-renders the HUD+3D view in "pick" mode so the per-pixel
     object/texture id buffer DAT_0023cca0 this function reads below is fresh for the current cursor
     position. */
  { static int _rr = -1;
    if (_rr < 0) _rr = (!g_opts.disable_pick_rerender);
    if (_rr) render_dungeon_view_frame();
  }
  iVar2 = 0;
  DAT_002020ac = 0;
  /* Guard never present in the decompile: nothing bounds-checked g_mouse_x/g_mouse_y against the 3D
     viewport's own registered rect (DAT_0023be5c/DAT_0023bd80 x-range, DAT_0023be80-DAT_0023be88.. */
  if (!uw_point_in_game_view(g_mouse_x,g_mouse_y)) {
    return (ushort *)0x0;
  }
  bVar1 = *(byte *)(g_mouse_y * 0x140 + (int)g_mouse_x + DAT_0023cca0);
  uVar4 = (uint)bVar1;
  { /* debug: force the object branch */
    if (UW_OPT_ISSET(g_opts.pick_force_slot) && (uint)DAT_0023b830 > 1) { uVar4 = (uint)g_opts.pick_force_slot; if (uVar4 == 0 || uVar4 >= (uint)DAT_0023b830) uVar4 = 1; bVar1 = (byte)uVar4; } }
  int _pick_diag = g_uw_debug_pick_diag || g_opts.pick_diag;
  if (_pick_diag)
    fprintf(stderr, "[pick] mx=%d my=%d stencil=0x%02x nobj=%d\n",
            (int)g_mouse_x, (int)g_mouse_y, uVar4, (int)DAT_0023b830);
  if ((uVar4 == 0) || (DAT_0023b830 <= uVar4)) {
    if ((0xbf < uVar4) && (uVar4 < 0xfb)) {
      DAT_002020ac = bVar1 - 0xbf;
    }
  }
  else {
    iVar2 = (int)*(short *)(&DAT_0023b676 + uVar4 * 2);
    DAT_002020b0 = (char *)(DAT_0023b814 +
        *(short *)((intptr_t)g_pick_tile_off_backing + uVar4 * 2 + 2) * 4);
  }
  if ((short)iVar2 == 0) {
    puVar3 = (ushort *)0x0;
  }
  else {
    puVar3 = (ushort *)get_object_record_by_slot_index(iVar2);

    if(puVar3) {
      DEBUG(INFO, "[pick] found slot=%u -> objid=0x%03x", uVar4,
            (unsigned)(((uw_object_hdr_t *)puVar3)->object_id));
      if (_pick_diag)
        fprintf(stderr, "[pick] found slot=%u -> objid=0x%03x ptr=%p\n", uVar4,
                (unsigned)(((uw_object_hdr_t *)puVar3)->object_id),
                (void *)puVar3);
    }

    DAT_002020a8 = DAT_002020b0 + 2;
    if (((g_object_type_props[(((uw_object_hdr_t *)puVar3)->object_id)].owner_flags & 0x20) != 0) &&
        (iVar2 = object_ptr_in_arena(puVar3), iVar2 == 0)) {
      DAT_002020ec = 1;
      return puVar3;
    }
    DAT_002020ec = 0;
  }
  return puVar3;
}



// was FUN_0003ed6c
/* Resolves a raw terrain pick index (DAT_002020ac -- pick_object_under_
   cursor's own "the pick stencil wasn't an object slot, here's a wall/
   floor texture index instead" output, byte - 0xbf) to a real texture
   id and its message-string description. Factored out of
   describe_picked_terrain's own real "Look" logic below (byte-for-byte
   the same resolution, not a reimplementation) so the debug object
   inspector (hud.c) can show the same wall/floor pick information
   without reaching into this file's own DAT_0023ad58/DAT_0023ae58
   terrain-property tables directly. Returns the resolved texture id;
   *out_desc is get_message_string's own result (NULL/empty are both
   possible, same as every other get_message_string caller). */
int resolve_picked_terrain_texture(short pick, char **out_desc)
{
  int iVar1;
  uint uVar2;

  iVar1 = (pick + -1) * 0x10000 >> 0x10;
  if (iVar1 < 0x30) {
    uVar2 = (uint)(short)(&DAT_0023ae58)[iVar1];
  }
  else if (iVar1 < 0x3a) {
    uVar2 = 0x1fe - (int)(short)(&DAT_0023adb8)[iVar1 - 0x30];
  }
  else {
    uVar2 = 0x1ff;
  }
  *out_desc = get_message_string(uVar2 | 0x1400);
  return (int)uVar2;
}

void describe_picked_terrain(byte terrain_kind, short step_count)
{
  char *desc;

  if ((step_count < 1) || (terrain_kind != 2)) {
    print_scroll_message_by_id(terrain_kind + 0x98);
  }
  else {
    resolve_picked_terrain_texture(step_count,&desc);
    message_scroll_print_wrapped(s_You_see_000858fc);
    message_scroll_print_wrapped(desc);
    message_scroll_print_wrapped(&DAT_00084f20);
  }
}

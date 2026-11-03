/* The inventory panel: click handling/dispatch, widget hit-testing and redraw, and the inventory
   link-chain (de)serialization used by save/load. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/inventory.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

static short DAT_00085a6c_backing[128];
short *DAT_00085a6c = DAT_00085a6c_backing;
undefined2 g_cursor_holding_state;
/* Base address of a 0x1b(27)-byte-stride record table (every use is `offset * 0x1b + DAT_002046b8`,
   cast to a pointer type) -- was `int` despite being assigned a real malloc'd address plus an
   offset (reset_level_object_arena: `DAT_002046b8 = DAT_002029cc + 0x4000;`)... */
char *DAT_002046b8;
char *g_current_container_record;
/* Was `uint`, truncating the real pointer this holds (`DAT_002029cc + 0x5b00`, assigned in
   reset_level_object_arena -- see there) on this 64-bit host. */
char *DAT_002046c4;
ushort *g_interact_target;
short DAT_0023be88;
short DAT_0023bd80;
code *DAT_002020b8;
undefined4 DAT_00204844;
/* .data 0x85c38: widget-id -> g_equipped_items slot-array-index lookup (read as
   `(&g_backpack_widget_to_slot)[widget_id]` for widget ids 0-0x16, i.e. one byte per record of the
   g_inv_hotspot_click_x1 hotspot table). */
 unsigned char g_backpack_widget_to_slot_backing[0x17] = {
  1,3,0,1,2,4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18,19, 0,0,
};
/* g_equipped_items (28 2-byte "backpack/equipment slot" object-link records -- see
   g_backpack_widget_to_slot's own comment) was a bare scalar Ghidra never gave real backing to. */
char *g_backpack_slot_table;
/* Same bug: indexed as `(&DAT_002028e8)[i]` for i up to 0x16 (22) in
   init_inventory_panel_hotspots/free_open_container_chain/etc. -- this is the specific array whose
   overflow was landing on and corrupting g_selected_object (see above). */
/* Sizing-audit pass: real index range is i up to 0x16 (22 elements),
   per the comment above -- 92 bytes real need. Sized to 32 elements
   (128 bytes) for headroom; down from 64 (256 bytes). */
 undefined4 DAT_002028e8_backing[32];
undefined4 DAT_002029a0;
undefined4 DAT_0020299c;
/* .data 0x85ad0: the HUD hotspot / layout table -- 0x17 records of 0xe bytes: [+0..+7] short
   click-rect x1,y1,x2,y2 (read by hit_test_inventory_widget); [+8/+0xa] short draw x,y; [+0xc/+0xd]
   byte dirty w,h. */
/* .data 0x85ad0: recovered directly from the shipped binary (mem.getBytes, same technique as
   g_backpack_widget_to_slot/ g_backpack_slot_to_widget) -- the earlier claim on this table (kept in
   git history) that "UU.exe's .data doesn't map cleanly... file offset lands on 3D-model-parser... */
 unsigned char g_inventory_hotspot_table[0x17 * 0xe + 2] = {
  /* rec 0 (real, degenerate sentinel): click 0,c8,0,c8 ; draw 104,c ; dirty 24,45 */
  0x00,0x00, 0xc8,0x00, 0x00,0x00, 0xc8,0x00,  0x04,0x01, 0x0c,0x00,  0x24,0x45,
  /* rec 1 (real armor-slot rect, LEGS -- confirmed live via
     check_object_fits_in_slot/class2_variant_effect_table_lookup dropping id 0x23 "leather
     leggings" here successfully)... */
  0x0d,0x01, 0x38,0x00, 0x1d,0x01, 0x48,0x00,  0x0c,0x01, 0x19,0x00,  0x13,0x32,
  /* rec 2 (head -- confirmed live, id 0x2c "a leather cap"): click
     10d,9,11e,19 ; draw b,b ; dirty 14,14 */
  0x0d,0x01, 0x09,0x00, 0x1e,0x01, 0x19,0x00,  0x0b,0x01, 0x0b,0x00,  0x14,0x14,
  /* rec 3 (torso/chest -- confirmed live, id 0x20 "a leather vest"):
     click 107,1a,123,2b ; draw 106,18 ; dirty 21,2c */
  0x07,0x01, 0x1a,0x00, 0x23,0x01, 0x2b,0x00,  0x06,0x01, 0x18,0x00,  0x21,0x2c,
  /* rec 4 (HANDS, not legs -- confirmed live, id 0x26 "leather gloves"; the "legs" label was an
     earlier unconfirmed guess, corrected after verifying with a real item): click 107,2c,123,38 ;
     draw 105,2b ; dirty 21,c */
  0x07,0x01, 0x2c,0x00, 0x23,0x01, 0x38,0x00,  0x05,0x01, 0x2b,0x00,  0x21,0x0c,
  /* rec 5 (real armor-slot rect, FEET, not a belt -- confirmed live, id 0x29 "leather boots"; the
     "likely a belt" guess in this comment was wrong -- corrected after verifying with a real item):
     click 107,48,123,51 ; draw 10a,43 ; dirty 15,d */
  0x07,0x01, 0x48,0x00, 0x23,0x01, 0x51,0x00,  0x0a,0x01, 0x43,0x00,  0x15,0x0d,

  /* rec 6 (left shoulder): click f4,d,105,1e ; draw f5,e ; dirty 10,10 */
  0xf4,0x00, 0x0d,0x00, 0x05,0x01, 0x1e,0x00,  0xf5,0x00, 0x0e,0x00,  0x10,0x10,
  /* rec 7 (right shoulder): click 125,d,136,1e ; draw 126,e ; dirty 10,10 */
  0x25,0x01, 0x0d,0x00, 0x36,0x01, 0x1e,0x00,  0x26,0x01, 0x0e,0x00,  0x10,0x10,
  /* rec 8 (left hand): click f1,23,102,36 ; draw f2,24 ; dirty 10,10 */
  0xf1,0x00, 0x23,0x00, 0x02,0x01, 0x36,0x00,  0xf2,0x00, 0x24,0x00,  0x10,0x10,
  /* rec 9 (right hand -- the default/active weapon hand per
     handle_object_drop_target's `9 - lefthand_bit` check): click
     127,23,138,36 ; draw 128,24 ; dirty 10,10 */
  0x27,0x01, 0x23,0x00, 0x38,0x01, 0x36,0x00,  0x28,0x01, 0x24,0x00,  0x10,0x10,
  /* rec 10 (left finger/ring slot): click f1,35,10c,40 ; draw ff,34 ; dirty 10,10 */
  0xf1,0x00, 0x35,0x00, 0x0c,0x01, 0x40,0x00,  0xff,0x00, 0x34,0x00,  0x10,0x10,
  /* rec 11 (right finger/ring slot): click 11e,35,138,46 ; draw 11d,34 ; dirty 10,10 */
  0x1e,0x01, 0x35,0x00, 0x38,0x01, 0x46,0x00,  0x1d,0x01, 0x34,0x00,  0x10,0x10,

  /* rec 12 (row1,col1): click f0,52,101,63 ; draw f1,53 ; dirty 10,10 */
  0xf0,0x00, 0x52,0x00, 0x01,0x01, 0x63,0x00,  0xf1,0x00, 0x53,0x00,  0x10,0x10,
  /* rec 13 (row1,col2): click 103,52,114,63 ; draw 104,53 ; dirty 10,10 */
  0x03,0x01, 0x52,0x00, 0x14,0x01, 0x63,0x00,  0x04,0x01, 0x53,0x00,  0x10,0x10,
  /* rec 14 (row1,col3): click 116,52,127,63 ; draw 117,53 ; dirty 10,10 */
  0x16,0x01, 0x52,0x00, 0x27,0x01, 0x63,0x00,  0x17,0x01, 0x53,0x00,  0x10,0x10,
  /* rec 15 (row1,col4): click 129,52,13a,63 ; draw 12a,53 ; dirty 10,10 */
  0x29,0x01, 0x52,0x00, 0x3a,0x01, 0x63,0x00,  0x2a,0x01, 0x53,0x00,  0x10,0x10,
  /* rec 16 (row2,col1): click f0,64,101,75 ; draw f1,65 ; dirty 10,10 */
  0xf0,0x00, 0x64,0x00, 0x01,0x01, 0x75,0x00,  0xf1,0x00, 0x65,0x00,  0x10,0x10,
  /* rec 17 (row2,col2): click 103,64,114,75 ; draw 104,65 ; dirty 10,10 */
  0x03,0x01, 0x64,0x00, 0x14,0x01, 0x75,0x00,  0x04,0x01, 0x65,0x00,  0x10,0x10,
  /* rec 18 (row2,col3): click 116,64,127,75 ; draw 116,65 ; dirty 10,10 */
  0x16,0x01, 0x64,0x00, 0x27,0x01, 0x75,0x00,  0x16,0x01, 0x65,0x00,  0x10,0x10,
  /* rec 19 (row2,col4): click 129,64,13a,75 ; draw 12a,65 ; dirty 10,10 */
  0x29,0x01, 0x64,0x00, 0x3a,0x01, 0x75,0x00,  0x2a,0x01, 0x65,0x00,  0x10,0x10,

  /* rec 20 (real, previously-unknown left-column slot -- see table
     comment above): click f0,41,101,52 ; draw f1,41 ; dirty 10,10 */
  0xf0,0x00, 0x41,0x00, 0x01,0x01, 0x52,0x00,  0xf1,0x00, 0x41,0x00,  0x10,0x10,
  /* rec 21 (real, small right-side button -- see table comment above):
     click 127,47,130,50 ; draw 128,47 ; dirty 8,a */
  0x27,0x01, 0x47,0x00, 0x30,0x01, 0x50,0x00,  0x28,0x01, 0x47,0x00,  0x08,0x0a,
  /* rec 22 (real, small right-side button -- see table comment above):
     click 131,47,13a,50 ; draw 132,47 ; dirty 8,a */
  0x31,0x01, 0x47,0x00, 0x3a,0x01, 0x50,0x00,  0x32,0x01, 0x47,0x00,  0x08,0x0a,
};
/* .data 0x85c18: array-slot-index -> widget-id lookup, the inverse of g_backpack_widget_to_slot
   (see its own comment) -- read as `(&g_backpack_slot_to_widget)[slot]` to find which
   widget/grid-cell to redraw after a slot's contents change... */
/* CORRECTED with a full re-dump of this table's real .data (0x85c18, 28 bytes, one mem.getBytes
   call covering the whole 0x1c-entry range at once): the previous version of this array below --
   {2,3,4,1,5, 6,7,8,9,10,11, 12,13,14,15,16,17,18,19, 0,0,0,0, 12,13,14,15,16,17, 18,19}... */
 unsigned char g_backpack_slot_to_widget_backing[0x1c] = {
  2,3,4,1,5, 6,7,8,9,10,11, 12,13,14,15,16,17,18,19,20,
  12,13,14,15,16,17,18,19,
};
// was DAT_002028cc
 undefined2 g_save_record_count_backing[8192];
/* DAT_00202938: widget 20's own saved-background grtile handle (the "open container indicator" --
   see g_inventory_hotspot_table's own comment and DAT_00085c4c below), same role as
   (&DAT_002028a0)[i] for widgets 12-19 -- allocated once in open_backpack_container... */
undefined4 DAT_00202938;
short DAT_0023be5c;
short DAT_0023be80;






// was FUN_0003f7e0
void handle_inventory_panel_normal_click()

{
  short sVar1;
  undefined4 uVar2;

  g_interact_target = 0;
  if (g_cursor_holding_state == 0) {
    if ((g_selected_object == 0) && (sVar1 = DAT_00085a6c[3], sVar1 != 1)) {
      if (sVar1 == 2) {
        if ((g_cursor_mode != 1) || (DAT_00085a6c[4] == 4)) {
          uVar2 = 0xfffffffe;
          goto LAB_0003f91c;
        }
      }
      else if (sVar1 != 3) {
        g_interact_target = 0;
        return;
      }
    }
    uVar2 = 0;
  }
  else if (g_cursor_holding_state == 1) {
    uVar2 = 4;
  }
  else {
    if (g_cursor_holding_state != 2) {
      g_interact_target = 0;
      return;
    }
    sVar1 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
    if ((sVar1 != 0x15) && (sVar1 != 0x16)) {
      g_interact_target = resolve_clicked_inventory_item(2);
      if (g_interact_target != 0) {
        ((void (*)(ushort *, int, int))DAT_002020b8)(g_interact_target,1,1);
        wait_for_click_release(1);
        return;
      }
      pop_cursor_icon(3);
      g_cursor_holding_state = 0;
      g_selected_object = 0;
      return;
    }
    uVar2 = 1;
  }
LAB_0003f91c:
  handle_inventory_panel_click(uVar2);
  return;
}



// was FUN_0003f95c
void inventory_panel_click_region()

{
  if (g_active_hud_panel == '\0') {
    handle_inventory_panel_normal_click();
  }
  else if (g_active_hud_panel == '\x01') {
    handle_rune_bag_click();
  }
  else if (g_active_hud_panel == '\x02') {
    handle_stats_panel_skill_scroll_click();
  }
  return;
}




// was FUN_000440d0
void serialize_inventory_link_chain(byte *link_chain, byte *out_link)
{
  uw_object_hdr_t *puVar1;
  uw_object_hdr_t *puVar2;
  uint uVar3;

  puVar1 = resolve_object_link((ushort *)link_chain);
  while (puVar1 != NULL) {
    puVar2 = (uw_object_hdr_t *)alloc_save_record_slot();
    puVar2->type_flags = puVar1->type_flags;
    puVar2->position_word = puVar1->position_word;
    puVar2->chain_word = puVar1->chain_word;
    puVar2->link_word = puVar1->link_word;
    uVar3 = (uint)g_save_record_count;
    *out_link = *out_link & 0x3f | (byte)((uVar3 & 0x3ff) << 6);
    out_link[1] = (byte)((uVar3 << 0x16) >> 0x18);
    encode_equipped_item_index((ushort *)link_chain,(ushort *)out_link);
    link_chain = (byte *)&puVar1->chain_word;
    out_link = (byte *)&puVar2->chain_word;
    if ((puVar1->is_quant == 0) && (puVar1->link != 0)) {
      serialize_inventory_link_chain((byte *)&puVar1->link_word,(byte *)&puVar2->link_word);
    }
    puVar1 = resolve_object_link((ushort *)link_chain);
  }
}




// was FUN_00044398
void deserialize_inventory_link_chain(byte *link_field, void *saved_link_ptr)
{
  ushort *saved_link = (ushort *)saved_link_ptr;
  uw_object_hdr_t *puVar1;
  uint uVar2;
  uw_object_hdr_t *puVar3;
  
  while (puVar3 = (uw_object_hdr_t *)save_record_slot_from_index(*saved_link >> 6), puVar3 != NULL) {
    puVar1 = alloc_object_slot(0);
    puVar1->type_flags = puVar3->type_flags;
    puVar1->position_word = puVar3->position_word;
    puVar1->chain_word = puVar3->chain_word;
    puVar1->link_word = puVar3->link_word;
    uVar2 = encode_object_slot_index(puVar1);
    *link_field = *link_field & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
    link_field[1] = (byte)((uVar2 << 0x16) >> 0x18);
    decode_equipped_item_index((ushort *)link_field,saved_link);
    link_field = (byte *)&puVar1->chain_word;
    saved_link = &puVar3->chain_word;
    if ((puVar3->is_quant == 0) && (puVar3->link != 0)) {
      /* Dropped 2nd argument -- deserialize_inventory_link_chain takes (link_field, saved_link) and every
         other call site (both non-recursive ones, a few lines up this file) passes both; this
         self-recursive call for a nested container's own contents only passed the first. */
      deserialize_inventory_link_chain((byte *)&puVar1->link_word,&puVar3->link_word);
    }
  }
}




// was FUN_00046698
void handle_inventory_panel_click(short slot)
{
  short sVar1;
  char cVar2;
  ushort uVar3;
  char *open_record;
  char *container_record;
  undefined4 uVar5;
  int iVar6;
  ushort *puVar7;
  ushort *puVar8;
  int iVar9;
  ushort *puVar10;
  bool bVar11;
  short local_30;
  short local_2e;
  
  puVar10 = (ushort *)0x0;
  bVar11 = g_selected_object != 0;
  uVar5 = hit_test_inventory_widget(*DAT_00085a6c + 0xf0,0x76 - DAT_00085a6c[1]);
  iVar9 = (int)(short)uVar5;
  /* Permanent (not env-gated) debug line: which real widget got clicked and which
     g_backpack_widget_to_slot/g_equipped_items slot it resolves to -- DEBUG(INFO,...) prints by
     default under normal play (run.sh's own log output)... */
  if ((0 < iVar9) && (iVar9 < 0x17)) {
    DEBUG(INFO, "[inv] widget %d clicked -> slot %d\n", iVar9,
          (int)(char)(&g_backpack_widget_to_slot)[iVar9]);
  }
  /* The old CONTAINER_ICON_WIDGET_ID synthetic dispatch that used to live here (a project-added
     hack, drawn/hit-tested at a guessed screen position) is gone -- widget 20's own real table
     entry covers the "leave container" click now... */
  /* Was `iVar9 < 0x15` -- treated widget 20 (the real "leave container" button, see DAT_00085c4c's
     own comment) as an ordinary placeable backpack slot... */
  if ((0 < iVar9) && (iVar9 < 0x14)) {
    cVar2 = (&g_backpack_widget_to_slot)[iVar9];
    if (g_selected_object == 0) {
      iVar9 = (int)(short)cVar2;
      if ((*(ushort *)(&g_equipped_items + iVar9 * 2) & 0xffc0) == 0) {
        if (iVar9 == 8 - (*(byte *)(DAT_00086df8 + 100) & 1)) {
          toggle_weapon_ready();
        }
        wait_for_click_release(1);
        return;
      }
      if (((iVar9 != -1) && (iVar9 != 0x13)) && (iVar6 = wait_for_key_or_mouse_move(1), iVar6 != 0)) {
        puVar7 = (ushort *)resolve_object_link(&g_equipped_items + iVar9 * 2);
        uVar3 = ((uw_object_hdr_t *)puVar7)->type_flags;
        if (((uVar3 & 0x8000) == 0) || ((((uw_object_hdr_t *)puVar7)->link & 0x200) != 0)) {
          if (((uVar3 & 0x1c0) == 0x80) && ((uVar3 & 0x30) == 0)) {
            open_record = g_open_container_list;
            if ((DAT_00085a6c[4] == 4) && ((uVar3 & 0xf) != 0xf)) {
              print_scroll_message_by_id(0xba);
              return;
            }
            /* Walk the open-container chain via each record's full-width "next" link at +0xc (the
               legacy 4-byte link at +0 only ever held a truncated pointer). */
            for (; open_record != (char *)0x0; open_record = *(char **)(open_record + 0xc)) {
              puVar8 = (ushort *)resolve_object_link(open_record + 8);
              if (puVar8 == puVar7) {
                return;
              }
            }
          }
        }
        else if (((uw_object_hdr_t *)puVar7)->link != 1) {
          puVar10 = (ushort *)prompt_split_object_stack((byte *)puVar7);
          if (puVar10 == (ushort *)0x0) {
            return;
          }
          if (puVar10 != puVar7) {
            object_list_insert_head(puVar7 + 2,puVar10);
          }
        }
        bVar11 = true;
        if ((puVar10 == (ushort *)0x0) || (uVar5 = 1, puVar10 == puVar7)) {
          uVar5 = 0;
        }
        swap_cursor_and_slot_item((int)cVar2,uVar5);
        container_record = g_current_container_record;
        if (iVar9 < 0x14) {
          redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar9]);
        }
        else {
          /* Was walking the "prev" chain (up through every ancestor container, to propagate the
             removed item's weight all the way to the root) via CONCAT13/12/11 of the record's own
             byte-4..7 field... */
          for (; container_record != 0; container_record = *(char **)(container_record + 0x14)) {
            iVar9 = calculate_object_weight((uw_object_hdr_t *)puVar7);
            iVar9 = *(short *)(container_record + 10) - iVar9;
            *(char *)(container_record + 10) = (char)iVar9;
            *(char *)(container_record + 0xb) = (char)((uint)iVar9 >> 8);
          }
          repopulate_container_grid_slots();
          refresh_container_view();
        }
        if (g_selected_object == 0) {
          return;
        }
        if (puVar10 != (ushort *)0x0) {
          g_cursor_holding_state = 1;
          return;
        }
      }
    }
    wait_for_click_release(1);
    get_mouse_position(&local_2e,&local_30);
    uVar5 = hit_test_inventory_widget((int)local_2e,(int)local_30);
  }
  wait_for_click_release(1);
  sVar1 = (short)uVar5;
  if ((g_selected_object == 0) || (g_cursor_holding_state == 2)) {
    if (0 < sVar1) {
      if (-1 < slot) {
        handle_object_drop_target(uVar5);
        return;
      }
      if (slot == -2) {
        perform_object_search_check();
      }
    }
  }
  else {
    g_cursor_holding_state = 1;
    /* Same stale-cursor-icon-erase race as attach_picked_up_object_to_cursor's own copy of this fix
       (see its own comment) -- this function's "release while holding" branch has the identical
       shape... */
    if (erase_cursor_icon() != 0) {
      DAT_00204844 = 0;
    }
    if ((g_active_hud_panel != '\0') && (sVar1 != 0x17)) {
      g_cursor_holding_state = 1;
      return;
    }
    iVar9 = (int)sVar1;
    if (0 < iVar9) {
      /* `sVar1`/`iVar9` here is the actual RELEASE position, freshly hit-tested a few lines up
         (this function's own preceding widget-range block only handles the very first click of a
         drag, when nothing was held yet). */
      /* Same `< 0x15` -> `< 0x14` fix as the top-of-function copy above
         (widget 20 needs handle_object_drop_target's real dispatch,
         not ordinary slot placement). */
      if (iVar9 < 0x14) {
        handle_backpack_slot_click((int)(char)(&g_backpack_widget_to_slot)[iVar9]);
      }
      else {
        handle_object_drop_target(uVar5);
        bVar11 = false;
      }
    }
  }
  if ((bVar11) && (g_selected_object == 0)) {
    pop_cursor_icon(3);
    g_cursor_holding_state = 0;
  }
}




// was FUN_00046eec
void redraw_inventory_widget(int widget_id)
{
  int iVar1;
  undefined4 uVar2;
  
  uVar2 = 0xffffffff;
  if (g_active_hud_panel == '\0') {
    iVar1 = (int)(short)widget_id;
    if (iVar1 < 6) {
      redraw_armor_overlay_widgets();
    }
    else if (iVar1 < 0x15) {
      redraw_inventory_widget_range(widget_id,widget_id);
    }
    else {
      restore_captured_grtile_backdrop((&DAT_002028e8)[iVar1]);
      /* The port's landscape layout shows these two buttons the other way round from how the
         original's flags read: widget 21 is the up arrow (scrolled away from the start), widget 22
         the down arrow (more items ahead). */
      if (iVar1 == 0x15) {
        if (DAT_002029a0 != 0) {
          uVar2 = 0x101b;
        }
      }
      else if (DAT_0020299c != 0) {
        uVar2 = 0x101c;
      }
      if (-1 < (short)uVar2) {
        g_blit_transparent_mode = 1;
        draw_sprite_by_id(uVar2,(int)(short)(&g_inv_hotspot_draw_x)[iVar1 * 7],
                     (int)(short)(&g_inv_hotspot_draw_y)[iVar1 * 7],(&g_inv_hotspot_dirty_h)[iVar1 * 0xe],
                     (&g_inv_hotspot_dirty_w)[iVar1 * 0xe]);
        g_blit_transparent_mode = 0;
      }
    }
  }
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00048198
void redraw_inventory_widget_range(int first_widget, short last_widget)
{
  int iVar1;
  int iVar2;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  int iVar6;
  ushort *puVar7;
  char *count_text;
  undefined1 auStack_60 [12];
  /* Was `ushort auStack_54 [20]` (matching the real ARM binary's own stack layout exactly,
     confirmed via Ghidra decompile of the real FUN_00048198 at 0x48198) -- but
     redraw_container_icon_slot's real call site also matches ours exactly... */
  ushort auStack_54 [23];
  ushort local_2c;

  bVar5 = false;
  decrement_cursor_hide_depth();
  iVar1 = (int)(short)first_widget;
  iVar2 = (int)last_widget;
  g_blit_transparent_mode = 1;
  iVar3 = iVar1;
  do {
    iVar6 = iVar1;
    if (iVar2 < iVar3) {
joined_r0x00048308:
      while (iVar6 <= iVar2) {
        if (iVar6 != 0x14) {
          /* Was called here with g_blit_transparent_mode==1 (set just above this loop, for the
             item-sprite draw further down which genuinely needs it).
             restore_captured_grtile_backdrop restores a saved framebuffer tile pixel-for-pixel... */
          g_blit_transparent_mode = 0;
          restore_captured_grtile_backdrop((&DAT_002028e8)[iVar6]);
          g_blit_transparent_mode = 1;
          auStack_54[iVar6] = 1;
          if (iVar6 < 0x15) {
            if ((*(ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2) & 0xffc0) != 0) {
              puVar7 = (ushort *)resolve_object_link((ushort *)(&g_equipped_items + (char)(&g_backpack_widget_to_slot)[iVar6] * 2));
              if (puVar7 == 0) goto skip_slot_draw_iVar6;
              draw_sprite_by_id(((uw_object_hdr_t *)puVar7)->object_id,
                                (int)(short)(&g_inv_hotspot_draw_x)[iVar6 * 7],
                                (int)(short)(&g_inv_hotspot_draw_y)[iVar6 * 7],
                                (&g_inv_hotspot_dirty_h)[iVar6 * 0xe],
                                (&g_inv_hotspot_dirty_w)[iVar6 * 0xe]);
              if (((((uw_object_hdr_t *)puVar7)->is_quant != 0) && ((((uw_object_hdr_t *)puVar7)->link & 0x200) == 0)) &&
                  (uVar4 = ((uw_object_hdr_t *)puVar7)->link, 1 < uVar4)) {
                auStack_54[iVar6] = uVar4;
                bVar5 = true;
              }
              skip_slot_draw_iVar6:;
            }
          }
          else {
            redraw_inventory_widget(first_widget);
          }
        }
        first_widget = (iVar6 + 1) * 0x10000 >> 0x10;
        iVar6 = first_widget;
      }
      g_blit_transparent_mode = 0;
      if (bVar5) {
        select_active_font(s_font4x5p_sys_0008431c);
        *g_draw_color_index = 0x60;
        for (; iVar1 <= iVar2; iVar1 = (iVar1 + 1) * 0x10000 >> 0x10) {
          if (1 < (short)auStack_54[iVar1]) {
            count_text = _itoa((int)(short)auStack_54[iVar1],auStack_60,10);
            draw_text_string(count_text,(short)(&g_inv_hotspot_draw_x)[iVar1 * 7] + 3,
                         (short)(&g_inv_hotspot_draw_y)[iVar1 * 7] + 1);
          }
        }
        select_active_font(s_font5x6p_sys_0008430c);
      }
      update_carry_weight_display(0);
      cursor_show_idle_tick();
      return;
    }
    if (iVar3 == 0x14) {
      restore_captured_grtile_backdrop(DAT_00202938);
      local_2c = 1;
      if ((*(ushort *)(&g_equipped_items + DAT_00085c4c * 2) & 0xffc0) != 0) {
        puVar7 = (ushort *)resolve_object_link((ushort *)(&g_equipped_items + DAT_00085c4c * 2));
        draw_sprite_by_id(((uw_object_hdr_t *)puVar7)->object_id,
                          (int)_DAT_00085bf0,
                          (int)CONCAT11(DAT_00085bf3,DAT_00085bf2),
                          DAT_00085bf5,DAT_00085bf4);
        if (((((uw_object_hdr_t *)puVar7)->is_quant != 0) && ((((uw_object_hdr_t *)puVar7)->link & 0x200) == 0)) &&
            (uVar4 = ((uw_object_hdr_t *)puVar7)->link, 1 < uVar4)) {
          bVar5 = true;
          local_2c = uVar4;
        }
      }
      goto joined_r0x00048308;
    }
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while( true );
}




// HACK: not in the ARM executable. Redraws every inventory-panel icon holding a lit light source
// (object ids 0x94-0x97, the lit states decay_equipped_light_sources tests for): their sprites use
// the fire colours (palette 0x10-0x17) that dungeon_palette_cycle_tick rotates, and an icon already
// in the framebuffer keeps its old colours until redrawn. Does nothing unless the inventory panel is
// showing (redraw_inventory_widget checks that itself).
void redraw_lit_light_source_widgets()
{
  int widget;

  if (g_active_hud_panel != '\0') return;
  for (widget = 6; widget <= 0x14; widget++) {
    int slot = widget == 0x14 ? (int)(unsigned char)DAT_00085c4c : (int)(char)(&g_backpack_widget_to_slot)[widget];
    ushort *link = (ushort *)(&g_equipped_items + slot * 2);
    ushort *object;
    uint id;

    if ((*link & 0xffc0) == 0) continue;
    object = (ushort *)resolve_object_link(link);
    if (object == 0) continue;
    id = *object & 0x1ff;
    if ((id & 0x1f0) == 0x90 && (id & 0xf) >= 4 && (id & 0xf) < 8) redraw_inventory_widget(widget);
  }
}



// was FUN_000485f4
int hit_test_inventory_widget(short x, short y)
{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = (int)x;
  if (*(short *)(DAT_00085a6c + 8) == 4) {
    if ((((0x8b < iVar1) && (iVar1 < 0xc1)) && (y < 0x30)) && (10 < y)) {
      return 0x18;
    }
  }
  else if ((DAT_0023be5c < iVar1) && (iVar1 < (int)DAT_0023be5c + (int)DAT_0023bd80)) {
    /* HACK: not original behaviour -- the fullscreen view's rect covers the overlaid panels too. */
    if (((int)y < (int)DAT_0023be80) && ((int)DAT_0023be80 - (int)DAT_0023be88 < (int)y) &&
        !(g_view_fullscreen && uw_fullscreen_in_overlay(iVar1,(int)y))) {
      return 0x17;
    }
  }
  /* The "open container"/leave-container click used to be special- cased here at a guessed screen
     position (this project's own CONTAINER_ICON_WIDGET_ID hack, before widget 20's real hotspot
     data was recovered) -- removed now that the real table entry for widget 20... */
  iVar3 = 0;
  while (((iVar2 = iVar3 * 0xe, iVar1 < *(short *)(&g_inv_hotspot_click_x1 + iVar2) ||
          (*(short *)(&g_inv_hotspot_click_x2 + iVar2) < iVar1)) ||
         ((*(short *)(&g_inv_hotspot_click_y2 + iVar2) < y ||
          (y < *(short *)(&g_inv_hotspot_click_y1 + iVar2)))))) {
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    if (0x16 < iVar3) {
      return -1;
    }
  }
  return iVar3;
}



// was FUN_0003f648 -- called from handle_inventory_panel_click's param_1==-2 sentinel case
// (src/inventory.c:324, a distinct interaction gesture on an inventory/container slot).
void perform_object_search_check()

{
  int iVar1;
  uint uVar2;
  uint uVar3;

  trigger_object_trap_or_use_action(g_player_object,g_interact_target,5,(int)DAT_002020a0,DAT_002020a4);
  if (g_interact_target == (ushort *)0x0) {
    g_interact_target = (ushort *)resolve_clicked_inventory_item(2);
    if (g_interact_target != (ushort *)0x0) goto LAB_0003f69c;
  }
  else {
LAB_0003f69c:
    uVar3 = *g_interact_target & 0x1c0;
    if (((uVar3 != 0x140) && (uVar3 != 0x180)) &&
       ((g_object_type_props[(*g_interact_target & 0x1ff)].class_flags & 3) != 2)) {
      uVar3 = (g_interact_target[1] & 0x380) >> 7;
      if ((uVar3 & 4) == 0) {
        iVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x29),10);
        uVar2 = iVar1 + 1;
        if ((int)(uVar2 * 0x10000) >> 0x10 == 0) {
          uVar2 = 1;
        }
        if ((short)uVar2 < (short)((ushort)uVar3 & 3)) {
          uVar2 = uVar3 & 3;
        }
        uVar3 = (ushort)g_interact_target[1] & 0xfe7f |
                (uVar2 & 3 | 4) << 7;
        *(char *)(g_interact_target + 1) = (char)uVar3;
        *(char *)((char *)g_interact_target + 3) = (char)(uVar3 >> 8);
      }
      else {
        uVar2 = uVar3 & 3;
      }
      goto LAB_0003f7cc;
    }
  }
  uVar2 = 1;
LAB_0003f7cc:
  dispatch_object_action(g_interact_target,uVar2);
  handle_inventory_panel_click(-1);
  return;
}


// was FUN_000400a0 -- toggles combat stance on/off; the weapon-hand
// paperdoll slot's click handler (handle_object_drop_target) calls
// this.
void toggle_weapon_ready()

{
  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) {
    ready_weapon();
  }
  else {
    unready_weapon();
  }
  return;
}


/* Was `int` -- g_save_record_base_ptr is a real `undefined1 *` heap pointer (the
   inventory-serialization scratch buffer allocated in write_player_save_record/
   build_player_save_record)... */
// was FUN_00044294
void *alloc_save_record_slot()

{
  g_save_record_count = g_save_record_count + 1;
  return g_save_record_base_ptr + g_save_record_count * 8;
}



/* Same truncated-pointer-return bug as alloc_save_record_slot just above, same
   fix. */
// was FUN_000442bc
void *save_record_slot_from_index(short slot_index)
{
  void *iVar1;

  if (slot_index == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = g_save_record_base_ptr + slot_index * 8;
  }
  return iVar1;
}

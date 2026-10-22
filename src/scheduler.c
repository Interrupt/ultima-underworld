/* The timed-effects queue (System Shock's own term for this shared mechanism -- doors' open/close
   swing, blood splats, combat highlights, ...). Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/scheduler.h"
#include "headers/options.h"
#include <stdio.h>
#include <stdlib.h>

/* Was `undefined2` (unsigned short) -- every real use in tick_weapon_swing_state/
   reset_weapon_swing_state/update_weapon_ready_hud_icon/cancel_weapon_swing (the attack-swing state
   machine) treats this as a signed negative countdown... */
short DAT_0010062c;
// was DAT_00250770: live entry count in g_scheduler_table (max 0x40) --
// see g_scheduler_table's own comment for the whole system this
// belongs to, named to match System Shock's own term for it.
undefined1 g_scheduler_count;
/* was g_queue_link_table, and every scheduler_* function below was a bare FUN_XXXXXXXX -- renamed
   to "scheduler", System Shock's own term for this shared timed-effects system (door swing, blood
   splats, combat highlights, ...), since this decompile never recovered a real name for it. */
char *g_scheduler_table;
static int DAT_002508fc;



// was FUN_0008097c: removes a scheduler entry's own world object (tile unlink + free_object_slot)
// -- named to match System Shock's own term for this shared timed-effects system...
void scheduler_despawn_entry(short entry_index)
{
  /* ARM 0x809a4 keeps the resolved object pointer in r5 and forwards
     it to both object_list_unlink and free_object_slot. */
  uw_object_hdr_t *uVar1;
  int iVar2;
  
  iVar2 = entry_index * 6;
  uVar1 = resolve_object_link((uw_link_word_t *)(&DAT_00250778 + iVar2));
  /* was folded into `int iVar2` (reused above as an index) -- truncated
     tilemap_lookup's real `void *` return */
  {
    void *_tile2 = tilemap_lookup((&DAT_0025077c)[iVar2],(&DAT_0025077d)[iVar2]);
    object_list_unlink((uw_link_word_t *)((char *)_tile2 + 2),uVar1);
  }
  free_object_slot(uVar1);
}



// was FUN_000809cc: finds the scheduler entry whose encoded object link
// matches param_1 and removes it (swap-with-last, decrement count).
void scheduler_remove_entry(short object_link)
{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  ushort *puVar6;
  
  uVar2 = 0;
  puVar6 = (ushort *)&DAT_00250778;
  uVar3 = (uint)g_scheduler_count;
  if (uVar3 != 0) {
    do {
      if ((uint)(*puVar6 >> 6) == (int)object_link) break;
      uVar2 = uVar2 + 1;
      puVar6 = puVar6 + 3;
    } while ((int)uVar2 < (int)uVar3);
  }
  if ((int)uVar2 < (int)uVar3) {
    uVar1 = uVar3 + 0xff & 0xff;
    g_scheduler_count = (byte)(uVar3 + 0xff);
    if ((uVar1 != 0) && (uVar2 != uVar1)) {
      iVar5 = uVar1 * 6;
      iVar4 = uVar2 * 6;
      (&DAT_00250778)[iVar4] = (&DAT_00250778)[iVar5];
      (&DAT_00250779)[iVar4] = (&DAT_00250779)[iVar5];
      (&DAT_0025077a)[iVar4] = (&DAT_0025077a)[iVar5];
      (&DAT_0025077b)[iVar4] = (&DAT_0025077b)[iVar5];
      (&DAT_0025077c)[iVar4] = (&DAT_0025077c)[iVar5];
      (&DAT_0025077d)[iVar4] = (&DAT_0025077d)[iVar5];
    }
  }
}



// was FUN_00080a98: scheduler_tick's finalize step, run once an entry's
// delay has expired -- one last scheduler_step_entry catch-up, then
// (for class 0xf, doors) the actual final open/close quality flip.
void scheduler_finish_entry(int entry_slot)
{
  ushort uVar1;
  ushort uVar2;
  byte bVar3;
  uw_object_hdr_t *puVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  ushort uVar8;
  int iVar9;
  uint uVar10;
  bool bVar11;
  
  iVar9 = (short)entry_slot * 6;
  puVar4 = resolve_object_link((uw_link_word_t *)(&DAT_00250778 + iVar9));
  /* HACK: resolve_object_link legitimately returns NULL (every other resolve_object_link call site
     in this file guards for it -- e.g. scheduler_add_entry's own identical fix a little above this
     function). */
  if (puVar4 == NULL) {
    return;
  }
  uVar5 = puVar4->object_id & 0xf;
  uVar1 = g_animation_type_props[uVar5].flags;
  bVar11 = (uVar1 & 0x80) == 0;
  if (!bVar11) {
    bVar11 = (&DAT_0025077a)[iVar9] == '\0' && (&DAT_0025077b)[iVar9] == '\0';
  }
  if (!bVar11) {
    /* HACK: was a bare `scheduler_step_entry(entry_slot);` -- dropped second argument (elapsed ticks),
       same class as this file's other Ghidra-decompiled dropped-argument calls.
       scheduler_finish_entry has no elapsed value of its own to forward... */
    scheduler_step_entry(entry_slot, 1);
  }
  if (uVar5 == 0xf) {
    uVar10 = (puVar4->owner >> 4) & 3;
    uVar5 = puVar4->owner & 0xf;
    uVar8 = puVar4->zpos;
    if (puVar4->enchanted == 0) {
      uVar5 = uVar5 | 8;
    }
    else {
      if (7 < uVar5) {
        uVar5 = uVar5 - 8;
      }
      DAT_0010144c = (ushort)(byte)(&DAT_0025077c)[iVar9];
      DAT_00101454 = (ushort)(byte)(&DAT_0025077d)[iVar9];
      if ((uVar5 & 7) != 6) {
        uVar8 = uVar8 - 0x18;
      }
      uVar6 = encode_object_slot_index(puVar4);
      iVar7 = check_object_placement_clearance(uVar5 + (uVar10 + 0x14) * 0x10,uVar6,
                           (uint)(puVar4->xpos) + (short)DAT_0010144c * 8,
                           (puVar4->ypos) + (short)DAT_00101454 * 8,
                           uVar8,1,8);
      if (iVar7 == 0) {
        uVar1 = puVar4->link_word;
        bVar3 = (byte)uVar1;
        puVar4->owner = uVar5 & 0x3f;
        adjust_door_close_animation_delay((ushort *)puVar4);
        return;
      }
      play_positional_sound_effect(0xc,
                                   (uint)(puVar4->xpos) + (short)DAT_0010144c * 8,
                                   (puVar4->ypos) + (short)DAT_00101454 * 8,
                                   0);
    }
    uVar2 = puVar4->position_word;
    bVar3 = (byte)uVar2;
    puVar4->zpos = uVar8 & 0x7f;
    uVar10 = puVar4->type_flags & 0xff4f | (uVar10 | 0x14) << 4;
    uVar5 = (uVar10 ^ uVar5) & 0xf ^ uVar10;
    puVar4->object_id = uVar5 & 0x1ff;
    uVar10 = puVar4->link << 6;
    puVar4->owner = 0;
    uVar8 = (ushort)uVar5;
    if ((uVar5 & 0x1000) == 0) {
      uVar8 = ((uVar8 & 0xe00) - 0xe01 ^ uVar8) & 0x1e00 ^ uVar8;
    }
    else {
      uVar8 = uVar8 & 0xefff;
    }
    puVar4->flags_res = (uVar8 >> 9) & 7;
    puVar4->enchanted = (uVar8 >> 12) & 1;
  }
  if ((uVar1 & 0x20) != 0) {
    scheduler_despawn_entry(entry_slot);
  }
  g_scheduler_count = g_scheduler_count - 1;
  uVar5 = (uint)g_scheduler_count;
  if ((uVar5 != 0) && ((int)(short)entry_slot != uVar5)) {
    iVar7 = uVar5 * 6;
    (&DAT_00250778)[iVar9] = (&DAT_00250778)[iVar7];
    (&DAT_00250779)[iVar9] = (&DAT_00250779)[iVar7];
    (&DAT_0025077a)[iVar9] = (&DAT_0025077a)[iVar7];
    (&DAT_0025077b)[iVar9] = (&DAT_0025077b)[iVar7];
    (&DAT_0025077c)[iVar9] = (&DAT_0025077c)[iVar7];
    (&DAT_0025077d)[iVar9] = (&DAT_0025077d)[iVar7];
  }
}



// was FUN_00080e00 -- finds the scheduler entry currently linked to param_2 (an "old" object) and
// re-links it to point at param_1(a "new" object) instead, matching by each entry's encoded
// object-link field.
void scheduler_relink_entry(void *new_object_ptr, void *old_object_ptr)
{
  uw_object_hdr_t *new_object = (uw_object_hdr_t *)new_object_ptr;
  uw_object_hdr_t *old_object = (uw_object_hdr_t *)old_object_ptr;
  short sVar1;
  uint uVar2;
  int iVar3;

  uVar2 = encode_object_slot_index(new_object);
  sVar1 = encode_object_slot_index(old_object);
  iVar3 = 0;
  if (g_scheduler_count != 0) {
    do {
      if ((uint)(*(ushort *)(&DAT_00250778 + iVar3 * 6) >> 6) == (int)sVar1) {
        iVar3 = (short)iVar3 * 6;
        (&DAT_00250778)[iVar3] = (&DAT_00250778)[iVar3] & 0x3f | (byte)((uVar2 & 0x3ff) << 6);
        (&DAT_00250779)[iVar3] = (char)((uVar2 << 0x16) >> 0x18);
        return;
      }
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)g_scheduler_count);
  }
}



// was FUN_00080ed4: pushes a new entry onto the scheduler -- an encoded object link (param_1),
// delay (param_2), initial animation offset (param_3), and tile position (param_4/param_5). The
// object's own subtype selects its animation behavior from OBJECTS.DAT.
uint scheduler_add_entry(uint object_link, int delay, byte animation_offset, byte tile_x, byte tile_y)
{
  char cVar1;
  uint uVar2;
  byte *pbVar3;
  int iVar4;
  ushort uVar5;
  
  if (g_scheduler_count + 1 < 0x41) {
    iVar4 = (uint)g_scheduler_count * 6;
    (&DAT_00250778)[iVar4] = (&DAT_00250778)[iVar4] & 0x3f | (byte)((object_link & 0x3ff) << 6);
    (&DAT_00250779)[iVar4] = (char)((object_link << 0x16) >> 0x18);
    (&DAT_0025077a)[iVar4] = (char)delay;
    (&DAT_0025077b)[iVar4] = (char)((uint)delay >> 8);
    (&DAT_0025077c)[iVar4] = tile_x;
    (&DAT_0025077d)[iVar4] = tile_y;
    pbVar3 = (byte *)resolve_object_link((uw_link_word_t *)(&DAT_00250778 + iVar4)); /* confirmed via ARM disassembly, 0x80f50 */
    /* resolve_object_link legitimately returns NULL (every other one of this file's 140+ call sites
       guards for it -- e.g. the `!= (ushort*)0x0` checks throughout this file). */
    if (pbVar3 != (byte *)0x0) {
      iVar4 = (((uw_object_hdr_t *)pbVar3)->object_id & 0xf) * 4;
      cVar1 = g_animation_type_props[(iVar4) / 4].start_frame;
      if (-1 < cVar1) {
        if (g_animation_type_props[(iVar4) / 4].frame_count == '\0') {
          uVar5 = ((ushort)(byte)((uw_object_hdr_t *)pbVar3)->link_word ^ (short)cVar1) & 0x3f ^
                  ((uw_object_hdr_t *)pbVar3)->link_word;
        }
        else {
          uVar5 = ((uw_object_hdr_t *)pbVar3)->link_word;
          /* ARM 0x80f94..0x80fb4 uses idivmod's remainder in r1; the decompiled extraout_r1 local
             was never initialized. Gets it by name off ordint_divmod's own divmod_result now
             (divisor confirmed nonzero by the enclosing if/else). */
          uVar5 = (cVar1 + ordint_divmod(g_animation_type_props[(iVar4) / 4].frame_count,animation_offset).rem ^ uVar5) & 0x3f ^ uVar5;
        }
        ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)uVar5;
      }
    }
    DAT_0023b804 = 1;
    g_scheduler_count = g_scheduler_count + 1;
    uVar2 = (uint)g_scheduler_count;
  }
  else {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}



// was FUN_00081034: scheduler_tick's per-tick step for one still-pending entry -- per-class
// behavior-flag bits select a gradual quality step toward a target (bit 0, e.g. a door's swing), a
// timed decay (bit 1), or a position/orientation step via scheduler_advance_effect (bit 2).
void scheduler_step_entry(int entry_slot, int elapsed)
{
  int iVar1;
  byte bVar2;
  ushort uVar3;
  uw_object_hdr_t *puVar4;
  uint uVar5;
  undefined4 uVar6;
  short extraout_r1;
  ushort uVar7;
  ushort uVar8;
  
  puVar4 = resolve_object_link((uw_link_word_t *)(&DAT_00250778 + (short)entry_slot * 6));
  /* HACK: same unguarded-NULL class as scheduler_finish_entry's identical fix --
     see its own comment. A stale queue entry resolves to NULL here too. */
  if (puVar4 == NULL) {
    return;
  }
  if ((puVar4->object_id & 0x1f0) == 0x1c0) {
    iVar1 = (puVar4->object_id & 0xf) * 4;
    uVar3 = 1;
    for (uVar7 = (ushort)g_animation_type_props[(iVar1) / 4].flags; uVar7 != 0; uVar7 = uVar7 & uVar8) {
      uVar8 = uVar3 & uVar7;
      if (uVar8 == 1) {
        uVar8 = puVar4->link_word;
        if ((int)puVar4->owner <
            (int)((int)(char) g_animation_type_props[(iVar1) / 4].start_frame + (uint)(byte) g_animation_type_props[(iVar1) / 4].frame_count + -1)) {
          uVar8 = (uVar8 + 1 ^ uVar8) & 0x3f ^ uVar8;
        }
        else {
          uVar8 = ((short)(char) g_animation_type_props[(iVar1) / 4].start_frame ^ uVar8) & 0x3f ^ uVar8;
        }
LAB_00081254:
        puVar4->owner = uVar8 & 0x3f;
        puVar4->link = (uVar8 >> 6) & 0x3ff;
      }
      else {
        if (uVar8 == 2) {
          uVar6 = ce_rand();
          uVar8 = puVar4->link_word;
          /* Dropped-remainder bug, same class as scheduler_finish_entry's own fix above in this
             file -- gets it by name off ordint_divmod's own divmod_result now (which guards the
             zero-divisor case itself, so no separate guard needed here). */
          extraout_r1 = (short)ordint_divmod(g_animation_type_props[(iVar1) / 4].frame_count,
                                             uVar6).rem;
          uVar8 = ((char) g_animation_type_props[(iVar1) / 4].start_frame + extraout_r1 ^ uVar8) & 0x3f ^ uVar8;
          goto LAB_00081254;
        }
        if (uVar8 == 4) {
          int _swing_dirbit_in = puVar4->enchanted != 0;
          int _swing_openbits_in = puVar4->flags_res;
          if (puVar4->enchanted != 0) {
            elapsed = (short)elapsed * -0x10000 >> 0x10;
          }
          if ((puVar4->owner & 0x7) == 6) {
            uVar8 = puVar4->position_word;
            bVar2 = (byte)uVar8;
            puVar4->zpos = ((char)elapsed * '\x06' + bVar2) & 0x7f;
          }
          uVar5 = (uint)puVar4->type_flags;
          uVar5 = ((uVar5 & 0xe00) + (uVar5 & 0xf000) + elapsed * 0x200 ^ uVar5) & 0x1e00 ^ uVar5;
          puVar4->flags_res = (uVar5 >> 9) & 7;
          puVar4->enchanted = (uVar5 >> 12) & 1;
          if ((uVar5 & 0x1000) != 0) {
            scheduler_advance_effect(entry_slot,elapsed);
          }
        }
      }
      uVar8 = ~uVar3;
      uVar3 = uVar3 << 1;
    }
  }
}



// was FUN_0008128c: walks every live scheduler entry, called from ordinary gameplay's own per-tick
// pacing (move_key_directional_step and its per-frame sibling, gated by DAT_000879ac -- see
// init_gameplay_session's own comment) with param_1 = elapsed ticks.
void scheduler_tick(int elapsed)
{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;

  iVar4 = 0;
  if (g_scheduler_count != 0) {
    iVar4 = elapsed;
  }
  if (DAT_0023b804 != 0) {
    set_pending_update_flags(2);
  }
  if (g_scheduler_count != 0) {
    iVar3 = 0;
    do {
      iVar1 = iVar3 * 6;
      if (*(short *)(&DAT_0025077a + iVar1) == -1) {
        scheduler_step_entry(iVar3,iVar4);
      }
      else {
        iVar2 = *(short *)(&DAT_0025077a + iVar1) - iVar4;
        if (iVar2 * 0x10000 >> 0x10 < 0) {
          /* HACK: was a bare `scheduler_finish_entry();` -- dropped argument, same class as dozens
             of other Ghidra-decompiled call sites in this file... */
          scheduler_finish_entry(iVar3);
        }
        else {
          scheduler_step_entry(iVar3,iVar4);
          if (DAT_002508fc == 0) {
            (&DAT_0025077a)[iVar1] = (char)iVar2;
            (&DAT_0025077b)[iVar1] = (char)((uint)iVar2 >> 8);
          }
          else {
            DAT_002508fc = 0;
          }
        }
      }
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)g_scheduler_count);
  }
}





// was FUN_00081814 -- general "spawn a scheduled effect object" primitive: spawns a new object of
// type (0x1c0 + param_2, the "group" -- the same 0x1c0 family cast_area_spell_effect/
// activate_area_hazard_object use for spell/hazard effect ids)...
int spawn_scheduled_effect_object(ushort *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y)
{
  undefined1 uVar1;
  byte bVar2;
  undefined2 uVar3;
  short sVar4;
  uw_object_hdr_t *iVar5;/* was `int` -- truncated spawn_new_object's real pointer */
  uint uVar6;
  undefined4 uVar7;
  char *iVar8;  /* was `int` -- truncated tilemap_lookup's real pointer, same
                   class as iVar5 above; crashed live in the sibling call
                   shape at FUN_0004ad10/settle_mobile_to_immobile (see their comments) */
  byte bVar9;

  iVar5 = spawn_new_object(effect_group + 0x1c0, 0);
  if (iVar5 == (uw_object_hdr_t *)0x0) {
    return 0;
  }
  if (source_object != (ushort *)0x0) {
    uVar6 = (iVar5->position_word ^ ((uw_object_hdr_t *)source_object)->position_word) & 0x1fff ^ (uint)((uw_object_hdr_t *)source_object)->position_word;
    uVar1 = (undefined1)uVar6;
    bVar2 = (byte)(uVar6 >> 8);
    iVar5->xpos = (uVar6 >> 13) & 7;
    bVar9 = (byte)(((uw_object_hdr_t *)source_object)->position_word >> 8);
    iVar5->ypos = (bVar9 >> 2) & 7;
  }
  if ((short)heading_adjust < 0) {
    uVar3 = iVar5->position_word;
    bVar9 = (byte)uVar3 ^ (byte)((uint)heading_adjust * -0x10000 >> 0x10);
  }
  else {
    if (source_object == (ushort *)0x0) goto LAB_00081980;
    bVar9 = (byte) g_object_type_props[(((uw_object_hdr_t *)source_object)->object_id)].height >> 3;
    uVar3 = iVar5->position_word;
    if (bVar9 == 0) {
      bVar9 = 1;
    }
    bVar9 = (char)heading_adjust * bVar9 + (char)((uw_object_hdr_t *)source_object)->position_word ^ (byte)uVar3;
  }
  iVar5->zpos = (bVar9 ^ (byte)uVar3) & 0x7f;
LAB_00081980:
  uVar7 = encode_object_slot_index(iVar5);
  sVar4 = scheduler_add_entry(uVar7,delay,animation_offset,(int)tile_x & 0xff,(char)tile_y);
  if (sVar4 == -1) {
    free_object_slot(iVar5);
    return 0;
  }
  iVar8 = (char *)tilemap_lookup((int)tile_x,(int)tile_y);
  object_list_append_tail((uw_link_word_t *)(iVar8 + 2), iVar5);
  return 1;
}



// was FUN_000819f0: linear-searches the scheduler for the entry whose encoded link matches
// encode_object_slot_index()'s last result...
/* the object/link record whose slot index is searched for (ARM 0x819f0: r0 passes straight into
   encode_object_slot_index) */
int scheduler_find_entry(const uw_object_hdr_t *object)
{
  short sVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  
  sVar1 = encode_object_slot_index(object);
  iVar4 = 0;
  uVar3 = (uint)g_scheduler_count;
  if (uVar3 != 0) {
    do {
      if ((uint)(*(ushort *)(&DAT_00250778 + iVar4 * 6) >> 6) == (int)sVar1) break;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < (int)uVar3);
  }
  iVar2 = -1;
  if ((int)(short)iVar4 != uVar3) {
    iVar2 = iVar4;
  }
  return iVar2;
}



// was FUN_00081a84: reads scheduler_find_entry's result's delay field.
int scheduler_get_delay(void *object_ptr)
{
  uw_object_hdr_t *object = (uw_object_hdr_t *)object_ptr;
  short sVar1;
  int iVar2;

  sVar1 = scheduler_find_entry(object);
  if (sVar1 < 0) {
    iVar2 = -2;
  }
  else {
    iVar2 = (int)*(short *)(&DAT_0025077a + sVar1 * 6);
  }
  return iVar2;
}



// was FUN_00081abc: re-arms scheduler_find_entry's result's delay field.
void scheduler_set_delay(void *object_ptr, int delay)
{
  uw_object_hdr_t *object = (uw_object_hdr_t *)object_ptr;
  short sVar1;
  int iVar2;
  
  sVar1 = scheduler_find_entry(object);
  if (-1 < sVar1) {
    iVar2 = sVar1 * 6;
    (&DAT_0025077a)[iVar2] = (char)delay;
    (&DAT_0025077b)[iVar2] = (char)((uint)delay >> 8);
  }
}



// was FUN_00081af4: scheduler_step_entry's bit-2 sub-handler, called for entries whose per-class
// behavior flags select a positional/ directional step each tick...
int scheduler_advance_effect(short entry_slot, int elapsed)
{
  byte bVar1;
  uw_object_hdr_t *puVar2;
  undefined4 uVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  ushort uVar7;
  int iVar8;
  ushort uVar9;
  int iVar10;
  bool bVar11;
  
  iVar8 = entry_slot * 6;
  iVar10 = 5;
  /* HACK: adds the NULL guard every other resolve_object_link call site in this file has (this one
     had none at all -- a stale queue entry resolving to NULL would dereference puVar2 below
     unconditionally). */
  puVar2 = resolve_object_link((uw_link_word_t *)(&DAT_00250778 + iVar8));
  if (puVar2 == (uw_object_hdr_t *)0x0) {
    return 0;
  }
  uVar7 = (ushort)(byte)puVar2->link_word;
  DAT_0010144c = (ushort)(byte)(&DAT_0025077c)[iVar8];
  uVar9 = puVar2->zpos;
  DAT_00101454 = (ushort)(byte)(&DAT_0025077d)[iVar8];
  if ((uVar7 & 7) != 6) {
    uVar9 = uVar9 - 0x18;
  }
  uVar3 = encode_object_slot_index(puVar2);
  iVar4 = check_object_placement_clearance((uVar7 & 0x30) + (uVar7 & 0xf) + 0x140,uVar3,
                       (uint)(puVar2->xpos) + (short)DAT_0010144c * 8,
                       (puVar2->ypos) + (short)DAT_00101454 * 8,
                       uVar9,1,
                       8);
  if (iVar4 == 0) {
    uVar5 = (uint)puVar2->type_flags;
    if ((((uVar5 & 0x1c0) == 0x140) && ((uVar5 & 7) == 6)) ||
       (((uVar5 & 0x1c0) == 0x1c0 && ((puVar2->owner & 0x7) == 6)))) {
      iVar10 = 4;
    }
    bVar1 = (byte)((uVar5 & 0xefff) >> 8);
    puVar2->type_flags_low = (byte)(char)(uVar5 & 0xefff);
    puVar2->type_flags_high =
        ((byte)(((uVar5 & 0xe00) + (elapsed + 1) * -0x200) >> 8) ^ bVar1) & 0x1e ^ bVar1;
    iVar6 = scheduler_get_delay(puVar2);
    iVar4 = (int)(short)iVar6;
    bVar11 = -1 < iVar4;
    if (bVar11) {
      iVar4 = (iVar10 - iVar6) + 1;
      (&DAT_0025077a)[iVar8] = (char)iVar4;
      DAT_002508fc = 1;
    }
    uVar3 = 0;
    if (bVar11) {
      (&DAT_0025077b)[iVar8] = (char)((uint)iVar4 >> 8);
    }
  }
  else {
    uVar3 = 1;
  }
  return uVar3;
}



// was FUN_00081ce4: loads the whole scheduler table (g_scheduler_table,
// 0x180 bytes = 64 entries * 6) from a save file, then recomputes
// g_scheduler_count by re-scanning for the first empty entry.
/* .ark handle-struct pointer -- was `undefined4`, truncating the stack struct
   load_level_object_table passes and crashing read_archive_entry below. */
int scheduler_load(void *archive_ptr, int level_number)
{
  byte *archive = (byte *)archive_ptr;
  short sVar1;
  undefined4 uVar2;
  int iVar3;
  ushort *puVar4;
  
  puVar4 = (ushort *)&DAT_00250778;
  sVar1 = read_archive_entry(archive,level_number + 8,&DAT_00250778);
  if (sVar1 == 0x180) {
    g_scheduler_count = '\0';
    iVar3 = 0;
    do {
      if ((*puVar4 & 0xffc0) == 0) break;
      iVar3 = iVar3 + 6;
      g_scheduler_count = g_scheduler_count + '\x01';
      puVar4 = puVar4 + 3;
    } while (iVar3 < 0x180);
    uVar2 = 1;
  }
  else {
    g_scheduler_count = '\0';
    uVar2 = 0;
  }
  return uVar2;
}



// was FUN_00081d74: saves the whole scheduler table (g_scheduler_table, 0x180 bytes) to a save
// file, and (if g_scheduler_count < 0x40) blanks out one trailing empty entry first so a stale
// leftover doesn't get misread as real data on the next scheduler_load.
/* Was `undefined4` -- truncated the real 64-bit archive-handle-struct pointer
   (write_level_tilemap_to_archive's own `auStack_20`) write_archive_entry needs as its own
   param_1. */
int scheduler_save(void *archive_ptr, int level_number)
{
  uint *archive = (uint *)archive_ptr;
  int iVar1;
  
  if (g_scheduler_count < 0x40) {
    iVar1 = (uint)g_scheduler_count * 6;
    (&DAT_00250778)[iVar1] = (&DAT_00250778)[iVar1] & 0x3f;
    (&DAT_00250779)[iVar1] = 0;
  }
  /* Was `write_archive_entry(...); return 0;` -- a fabricated `return 0` masking a real result
     (same bug class as the torch/ambient-light fix earlier this session). */
  return write_archive_entry(archive,level_number + 8,&DAT_00250778,0x180);
}

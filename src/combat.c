/* NPC melee combat AI: approach/engage/position/disengage tick states and stance selection. Split
   out of uw.c (the original monolithic decompile) once these functions' real roles were confirmed. */
#include "headers/combat.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

short DAT_00100610;  /* sentinel -1 (set by weapon_swing.c) -- was ushort, which made every `!= -1` test always true */
static undefined2 DAT_00100600;
static ushort DAT_00100604;
static short DAT_001005f4;
static short DAT_001005f8;
static char DAT_001005dc;
static undefined2 DAT_00100624;
static ushort DAT_00100620;
static byte DAT_00100628;
static undefined4 DAT_001005d8;
byte DAT_001005fc;
/* Original blood hit-zone heights at 0x84f18; the fifth entry is set at runtime. */
static char DAT_00084f18_backing[5] = {5, 3, 1, 7, 0};
#define DAT_00084f18 DAT_00084f18_backing[0]
#define DAT_00084f1c DAT_00084f18_backing[4]
/* Sizing-audit pass: was an independent 256-byte array, but both uses
   (`(&DAT_001007e0)[(uVar1&0x3f)*0x30]`, combat.c:1418/1433) index it by the same per-class
   monster-record base as ai.c's DAT_001007d0 -- aliased into DAT_001007d0_backing in ai.h instead. */
static ushort DAT_00202d54;
undefined DAT_00202878;
/* Was a lone `undefined` scalar (1 byte), but tick_weapon_swing_state indexes it as
   `(&DAT_00084eff)[iVar5]` with iVar5 = the swing's own attack-type value... */
unsigned char DAT_00084eff_backing[12] = {
  0x00,0x02,0x02,0x02,0x00,0x00,0x00,0x01,0x01,0x01,0x00,0x00
};
/* Was `undefined4` -- resolve_equipped_weapon_attack writes a real static-global address through
   this (via its own `int *param_1`, truncating with an explicit `(int)`/`(intptr_t)` cast at all 3
   of its assignments)... */
char *DAT_001005e4;
static char DAT_001005e0_backing[128];
char *DAT_001005e0 = DAT_001005e0_backing;
static char s__DATA_cmb_dat_00084f40[] = "\\DATA\\cmb.dat";
/* Sizing pass: units trap -- declared element type is undefined2 (2 bytes), so [32768] was actually
   65536 real bytes, not 32768. */
undefined2 DAT_00100630_backing[32];
/* Current 27-byte mobile slot. NPC routines use this layout; the non-NPC
 * physics path views the same slot as uw_projectile_object_t. */
uw_mobile_object_t *DAT_0010190c;
undefined4 DAT_00101924;
/* Sizing-audit pass: pure scalar (combat-state flag) everywhere,
   including its one pointer-alias use in movement.c (still
   scalar-deref'd there) -- never indexed. Down from 256 elements. */
undefined4 DAT_00101734_backing[1];
#define DAT_00101734 DAT_00101734_backing[0]
uw_monster_type_props_t *DAT_00101404;
byte DAT_001013f8;
byte DAT_00101918;
int DAT_00101430;
byte DAT_0010140c;
short DAT_00101444; /* signed fine-coordinate delta; ARM reads 16 bits */
char DAT_00101408;
char DAT_00101410;
undefined1 DAT_00101420;
ushort DAT_00101900;
short DAT_00101448; /* signed fine-coordinate delta; ARM reads 16 bits */
char DAT_0010143c;
char DAT_0010173c;
char *DAT_00101400;
/* Was a bare scalar, but apply_equipment_degradation_message reads it through &DAT_00085a90 as a C
   string (the "was" half of the was/were pair right before it in memory, see s_were_00085a98 below)
   -- so the first byte being this port's always-zero default made it read as an empty string. */
static char DAT_00085a90[] = " was";
/* Was missing its leading space -- confirmed via the same memory dump that the real bytes are "
   were\0", not "were\0"; apply_equipment_ degradation_message relies on that leading space the same
   way its sibling DAT_00085a90 above does. */
static char s_were_00085a98[] = " were";
/* Was a zero-initialized 32768-byte placeholder (oversized -- nothing else aliases into it and its
   only reader just copies it out as a plain null-terminated string, so it needs no more headroom
   than its own content). */
static char DAT_00085aa0[] = "Your ";
/* Was missing its leading space and trailing newline -- confirmed via a Ghidra memory dump of the
   real UU.exe that the real bytes are " damaged.\n\0", matching the leading-space convention this
   whole was/were/damaged/destroyed cluster uses for inter-word spacing. */
static char s_damaged__00085aa8[] = " damaged.\n";
/* Same leading-space/trailing-newline fix as s_damaged__00085aa8 just
   above; real bytes confirmed " destroyed.\n\0". */
static char s_destroyed__00085ab4[] = " destroyed.\n";
static byte DAT_002046d8;
static byte DAT_002046dc;
static int DAT_002046e8;
static undefined1 DAT_002046e0;
static undefined1 DAT_002046e4;






// was FUN_0002f818 -- goal 3's main handler: distance-tiered response to a detected target (close:
// randomize stance; medium: walk toward the tracked target's own tile via npc_walk_toward_tile,
// i.e. chase; far: random-walk reposition + relink tilemap bucket)
void npc_combat_approach_tick()
{
  int uw_ord2005_rem_40 = 0;
  ushort uVar1;
  char cVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  uw_mobile_object_t *iVar5_rec;
  byte *pbVar6;
  uint extraout_r1;
  uint uVar7;
  int iVar8;
  int iVar9;
  
  if (DAT_00101900 < 3) {
    if (DAT_00101734 != 0) {
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc1 | 1;
      iVar5_rec = DAT_0010190c;
      uVar1 = DAT_0010190c->goal_word;
      uw_ord2005_rem_40 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar7 = uVar1 & 0xfff;
      iVar5_rec->npc_animation_frame = uw_ord2005_rem_40 & 0xf;
      DAT_0010190c->speed = 0;
      uVar7 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      DAT_0010190c->hdr.heading = uVar7 & 0x7;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
    }
  }
  else if (DAT_00101900 < 0x41) {
    if (DAT_00101734 != 0) {
      npc_walk_toward_tile(DAT_00101408,DAT_00101410,DAT_00101420);
    }
  }
  else {
    /* HACK: was a bare `integer_sqrt();` -- dropped argument, the same class of bug fixed
       repeatedly elsewhere in this file. */
    sVar4 = integer_sqrt(DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448);
    cVar3 = DAT_00101918;
    iVar8 = (int)DAT_00101408;
    iVar5 = ordint_divmod((int)sVar4,
                         (((int)DAT_00101918 - (int)(short)DAT_00101408) * 0x10000 >> 0x10) << 2).quot;
    cVar2 = DAT_001013f8;
    iVar5 = ((int)(uintptr_t)iVar5 + (int)iVar8) * 0x1000000;
    iVar9 = (int)DAT_00101410;
    iVar8 = ordint_divmod((int)sVar4,
                         (((int)DAT_001013f8 - (int)(short)DAT_00101410) * 0x10000 >> 0x10) << 2).quot;
    iVar8 = (iVar8 + iVar9) * 0x1000000;
    {
      /* was folded into `int iVar9` (reused above as an unrelated int) --
         truncated tilemap_lookup's real `void *` return */
      char *_tile9 = (char *)tilemap_lookup(cVar3,cVar2);
      pbVar6 = (byte *)tilemap_lookup((int)(iVar5) >> 0x18,iVar8 >> 0x18);
      object_list_unlink(_tile9 + 2,DAT_0010190c);
      object_list_insert_head(pbVar6 + 2,DAT_0010190c);
    }
    uVar7 = DAT_0010190c->tile_word & 0x3ff;
    DAT_0010190c->npc_xhome = (int)(char)((uint)(uintptr_t)iVar5 >> 0x18) & 0x3fU;
    uVar7 = DAT_0010190c->tile_word & 0xfc0f |
            ((int)(char)((uint)iVar8 >> 0x18) & 0x3fU) << 4;
    DAT_0010190c->npc_yhome = (uVar7 >> 4) & 0x3f;
    uVar7 = DAT_0010190c->hdr.position_word & 0x1fff;
    DAT_0010190c->hdr.xpos = 4;
    uVar7 = DAT_0010190c->hdr.position_word & 0xf3ff;
    DAT_0010190c->hdr.ypos = 4;
    uVar7 = DAT_0010190c->hdr.position_word & 0xff80;
    DAT_0010190c->hdr.zpos = *pbVar6 >> 1 & 0x78;
  }
}




// was FUN_0002ff94 -- goal 5: attacks (npc_combat_set_stance) if within dist^2<100 (~10 tiles) of
// the tracked target or already at its tile, else picks a sub-goal (try_npc_special_ability_alt/
// try_npc_special_ability_no_los/try_npc_special_ability_ranged)
void npc_combat_engage_close_tick()
{
  int uw_ord2005_rem_46 = 0;
  char cVar1;
  uint extraout_r1;
  char cVar2;
  byte bVar3;
  ushort uVar4;
  uint uVar5;
  int iVar6;
  char *iVar6_rec;
  bool bVar7;
  undefined1 local_28;
  
  iVar6 = 0;
  local_28 = 4;
  if (DAT_00101734 == 0) {
    return;
  }
  if (DAT_00201b68 == 7) {
    uVar5 = (*(byte *)(DAT_00086df8 + 0x60) & 0x20) << 8;
    bVar7 = (*(byte *)(DAT_00086df8 + 0x60) & 0x20) == 0;
    if (bVar7) {
      uVar5 = (uint) DAT_00101404->race_flags;
    }
    if (bVar7 && uVar5 == 0x13) {
      local_28 = 1;
    }
  }
  uVar4 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
  cVar2 = DAT_0010143c - DAT_00101918;
  cVar1 = DAT_0010173c - DAT_001013f8;
  if (DAT_0010190c->npc_gtarg == 1) {
    DAT_0010190c->npc_attitude = 0x0;
    uVar5 = DAT_0010190c->status_word;
  }
  if (((uVar4 < 100) || ((DAT_00101918 == DAT_00101408 && (DAT_001013f8 == DAT_00101410)))) &&
     ((uVar5 = ((int)DAT_0010140c - (int)DAT_00101420) >> 0x1f,
      (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar5) - uVar5) < 4 ||
      ((DAT_00101404->movement_flags & 0x80) != 0)))) {
    /* ARM 0x301f4 passes the fine-coordinate squared distance in r0. */
    npc_combat_set_stance(uVar4);
  }
  else if ((DAT_00101404->spell_flags & 0xfe) == 0) {
    if ((DAT_00101404->weapon_loot[0] >> 1 & 0xf0) != 0x10) goto LAB_000302bc;
    iVar6 = try_npc_special_ability_alt();
  }
  else {
    iVar6 = try_npc_special_ability_no_los();
    if ((iVar6 != 0) || ((DAT_00101404->spell_flags & 1) == 0)) goto LAB_000302bc;
    iVar6 = try_npc_special_ability_ranged();
  }
  if (iVar6 != 0) {
    bVar3 = DAT_0010190c->animation_flags & 0x3f;
    if (bVar3 == 5) {
      return;
    }
    if (bVar3 == 0xd) {
      return;
    }
    if (bVar3 == 1) {
      return;
    }
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
    iVar6_rec = (char *)DAT_0010190c;
    uVar4 = DAT_0010190c->goal_word;
    uw_ord2005_rem_46 = ((int)((uVar4 >> 0xc) + 1)) % (4);
    uVar5 = uVar4 & 0xfff;
    ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)(char)uVar5;
    DAT_0010190c->goal_word_high = (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_46 & 0xf) << 0xc) >> 8);
    DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
    return;
  }
LAB_000302bc:
  if ((((uVar4 < 0x101) || ((DAT_0010190c->npc_level) != 4)) ||
       ((DAT_0010190c->npc_ai_flags & 0x20) != 0)) ||
      (uVar4 = (ushort)(DAT_00101404->morale_flags >> 4),
       (ushort)((short)cVar2 * (short)cVar2 + (short)cVar1 * (short)cVar1) <=
       (ushort)(uVar4 * uVar4 * 4))) {
    if ((DAT_00101404->spell_flags & 1) == 0) {
      local_28 = 1;
    }
    npc_wander_reposition(DAT_00101408,DAT_00101410,local_28);
  }
  else {
    DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xfe;
    DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xfd;
    npc_set_goal(4,0);
  }
}



// was FUN_00030364 -- the shared attack/stance action called by every
// combat-engage goal handler once in range: sets combat-ready frame
// bits (byte 0x13/9/0x15) based on param_1, squared fine-coordinate distance
int npc_combat_set_stance(ushort stance_code)
{
  int uw_ord2005_rem_47 = 0; int uw_ord2005_rem_48 = 0; int uw_ord2005_rem_49 = 0; int uw_ord2005_rem_50 = 0; int uw_ord2005_rem_51 = 0; int uw_ord2005_rem_52 = 0; int uw_ord2005_rem_53 = 0; int uw_ord2005_rem_54 = 0; int uw_ord2005_rem_55 = 0; int uw_ord2005_rem_56 = 0;
  undefined1 uVar1;
  ushort uVar2;
  byte bVar3;
  uint uVar4;
  undefined4 uVar5;
  char extraout_r1;
  short extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int extraout_r1_03;
  int extraout_r1_04;
  int extraout_r1_05;
  int extraout_r1_06;
  int extraout_r1_07;
  int iVar6;
  uw_mobile_object_t *iVar6_rec;
  uw_object_hdr_t *target_header;
  uint extraout_r1_08;
  int iVar7;
  byte bVar8;
  uint uVar9;
  
  /* The original decompile used word-pointer arithmetic for byte offsets.
     Named fields retain the ARM layout, including the unaligned goal word. */
  uVar4 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar9 = uVar4 & 0xff;
  DAT_0010190c->hdr.heading = uVar4 & 0x7;
  DAT_0010190c->npc_heading = 0;
  uVar1 = (undefined1)(uVar9 << 5);
  DAT_0010190c->full_heading = uVar1;
  DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xbf;
  if (stance_code < 0x31) {
    uVar5 = ce_rand();
    uw_ord2005_rem_47 = ((int)(uVar5)) % (4);
    if (uw_ord2005_rem_47 != 0) {
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 199 | 7;
      uw_ord2005_rem_48 = ((int)(uVar9 + 4)) % (8);
      DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_48 << 5);
LAB_00030534:
      bVar8 = 2;
      goto LAB_000305e4;
    }
    uVar5 = ce_rand();
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
    uw_ord2005_rem_49 = ((int)(uVar5)) % (2);
    uw_ord2005_rem_50 = ((int)(uVar9 + uw_ord2005_rem_49 * 4 + 6)) % (8);
    DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_50 << 5);
    iVar6_rec = DAT_0010190c;
    bVar8 = DAT_0010190c->gravity_flag;
    bVar3 = ordint_divmod(3,(uint) DAT_00101404->magic_power << 1).quot;
    iVar6_rec->speed = bVar3 & 0x7f;
    iVar6_rec->gravity_flag = bVar8;
  }
  else {
    if (0x51 < stance_code) {
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
      DAT_0010190c->full_heading = uVar1;
      goto LAB_00030534;
    }
    uVar5 = ce_rand();
    bVar8 = DAT_00101404->dexterity;
    uw_ord2005_rem_51 = ((int)(uVar5)) % (0x40);
    if (uw_ord2005_rem_51 < (int)(uint)bVar8) {
      uVar5 = ce_rand();
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
      uw_ord2005_rem_52 = ((int)(uVar5)) % (8);
      DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_52 << 5);
      bVar8 = 1;
    }
    else {
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
      DAT_0010190c->full_heading = uVar1;
      bVar8 = 0;
    }
LAB_000305e4:
    DAT_0010190c->speed = bVar8;
  }
  if ((DAT_00101404->movement_flags & 0x80) != 0) {
    target_header = (uw_object_hdr_t *)DAT_00101400;
    iVar6 = (int)((((target_header->zpos) - (DAT_0010190c->hdr.zpos)) +
                   0xe) * 0x1000000) >> 0x18;
    if (iVar6 < 2) {
      if (iVar6 < -1) {
        bVar8 = 14;
      }
      else {
        uVar5 = ce_rand();
        uw_ord2005_rem_53 = ((int)(uVar5)) % (3);
        bVar8 = uw_ord2005_rem_53 + 15;
      }
    }
    else {
      bVar8 = 18;
    }
    DAT_0010190c->pitch = bVar8;
  }
  if (stance_code < 0x65) {
    uVar5 = ce_rand();
    uw_ord2005_rem_54 = ((int)(uVar5)) % (4);
    if (uw_ord2005_rem_54 == 0) {
      uVar5 = ce_rand();
      uw_ord2005_rem_55 = ((int)(uVar5)) % (100);
      iVar6 = (int)uw_ord2005_rem_55;
      iVar7 = 0;
      if ((int)(uint) DAT_00101404->attacks[0].probability <= iVar6) {
        do {
          if (1 < iVar7) break;
          iVar6 = iVar6 - (uint) DAT_00101404->attacks[iVar7].probability;
          iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
        } while ((int)(uint) DAT_00101404->attacks[iVar7].probability <= (int)(iVar6) * 0x10000 >> 0x10);
      }
      DAT_0010190c->animation_flags =
        ((char)iVar7 + 1U ^ DAT_0010190c->animation_flags) & 0x3f ^
         DAT_0010190c->animation_flags;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
      uVar4 = 0;
      goto LAB_00030860;
    }
    uVar4 = DAT_0010190c->npc_swing_charge;
    if (uVar4 < 0xf) {
      DAT_0010190c->npc_swing_charge = uVar4 + 1;
    }
  }
  DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
  uVar2 = DAT_0010190c->npc_animation_frame;
  uw_ord2005_rem_56 = ((int)(uVar2 + 1)) % (4);
  uVar4 = uw_ord2005_rem_56;
LAB_00030860:
  DAT_0010190c->npc_animation_frame = uVar4;
  return 1;
}




// was FUN_00030fe8 -- goal 9: same shape as npc_combat_engage_close_tick
// but a wider dist^2<0x90 (~12 tile) engage radius; otherwise positions
// via npc_combat_position_tick or picks a sub-goal
void npc_combat_engage_wide_tick()
{
  int uw_ord2005_rem_63 = 0;
  ushort uVar1;
  ushort distance_squared;
  int iVar2;
  char *iVar2_rec;
  uint uVar3;
  uint extraout_r1;
  
  if (DAT_00101734 != 0) {
    distance_squared = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
    if ((distance_squared < 0x90) ||
       ((DAT_00101408 == DAT_00101918 && (DAT_001013f8 == DAT_00101410)))) {
      /* ARM 0x3120c retains the squared distance in r0 from 0x31034. */
      npc_combat_set_stance(distance_squared);
    }
    else if (DAT_00101900 < 5) {
      uVar3 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->full_heading = (byte)((uVar3 & 0xff) << 5);
      DAT_0010190c->hdr.heading = uVar3 & 0x7;
      DAT_0010190c->npc_heading = 0;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
      iVar2_rec = (char *)DAT_0010190c;
      uVar1 = DAT_0010190c->goal_word;
      uw_ord2005_rem_63 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar3 = uVar1 & 0xfff;
      ((uw_mobile_object_t *)iVar2_rec)->goal_word_low = (byte)(char)uVar3;
      DAT_0010190c->goal_word_high = (byte)(uVar3 >> 8) | (byte)(((uw_ord2005_rem_63 & 0xf) << 0xc) >> 8)
        ;
    }
    else {
      iVar2 = try_npc_special_ability_no_los();
      if (iVar2 == 0) {
        if ((DAT_00101404->spell_flags & 0xfe) == 0) {
          if ((DAT_00101404->weapon_loot[0] >> 1 & 0xf0) == 0x10) {
            try_npc_special_ability_alt();
          }
          else {
            npc_combat_position_tick();
          }
        }
        else {
          try_npc_special_ability_ranged();
        }
      }
    }
  }
}



// WARNING: Removing unreachable block (ram,0x000314a0)

// was FUN_00031214 -- goal 6, also called as a sub-step from the
// combat-engage handlers: fine facing/frame adjustment relative to
// the target's heading and distance (flanking/circling in melee range)
void npc_combat_position_tick()
{
  int uw_ord2005_rem_64 = 0; int uw_ord2005_rem_65 = 0; int uw_ord2005_rem_66 = 0; int uw_ord2005_rem_67 = 0; int uw_ord2005_rem_68 = 0; int uw_ord2005_rem_69 = 0; int uw_ord2005_rem_70 = 0; int uw_ord2005_rem_71 = 0; int uw_ord2005_rem_72 = 0; int uw_ord2005_rem_73 = 0; int uw_ord2005_rem_74 = 0; int uw_ord2005_rem_75 = 0; int uw_ord2005_rem_76 = 0;
  uint uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  uint extraout_r1;
  uint extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint extraout_r1_04;
  int extraout_r1_05;
  int extraout_r1_06;
  int extraout_r1_07;
  uint extraout_r1_08;
  int extraout_r1_09;
  uint extraout_r1_10;
  uint extraout_r1_11;
  byte bVar4;
  byte bVar5;
  ushort uVar6;
  int iVar7;
  uw_mobile_object_t *iVar7_rec;
  uint uVar8;
  uw_object_hdr_t *target_header;
  
  if (DAT_00101734 == 0) {
    return;
  }
  uVar1 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar6 = DAT_0010190c->hdr.position_word;
  target_header = (uw_object_hdr_t *)DAT_00101400;
  bVar4 = target_header->position_word_low;
  if ((DAT_00101404->movement_flags & 0x80) != 0) {
    if ((uVar6 & 0x7f) < 0x6f) {
      uVar2 = ce_rand();
      uw_ord2005_rem_64 = ((int)(uVar2)) % (5);
      iVar7 = (uw_ord2005_rem_64 & 0xff) + 0xf;
    }
    else {
      uVar2 = ce_rand();
      uw_ord2005_rem_65 = ((int)(uVar2)) % (5);
      iVar7 = (uw_ord2005_rem_65 & 0xff) + 0xd;
    }
    DAT_0010190c->pitch = iVar7 & 0x1f;
  }
  if ((DAT_00101900 < 4) &&
     (iVar7 = ((bVar4 & 0x7f) - (uVar6 & 0x7f)) * 0x1000000, uVar8 = (int)(iVar7) >> 0x1f,
     (int)(((int)(iVar7) >> 0x18 ^ uVar8) - uVar8) < 0x10)) {
    uVar2 = ce_rand();
    bVar4 = DAT_00101404->morale_flags;
    uw_ord2005_rem_66 = ((int)(uVar2)) % (0x100);
    if (((int)(bVar4 >> 3 & 1) <= uw_ord2005_rem_66) && ((DAT_00101924 == 0 || (DAT_00101430 != 0)))) {
      uw_ord2005_rem_67 = ((int)((uVar1 & 0xff) + 4)) % (8);
      DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_67 << 5);
      DAT_0010190c->hdr.heading = uVar1 & 0x7;
      DAT_0010190c->npc_heading = 0;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 199 | 7;
      iVar7_rec = DAT_0010190c;
      uVar6 = DAT_0010190c->goal_word;
      uw_ord2005_rem_68 = ((int)((uVar6 >> 0xc) + 1)) % (4);
      uVar1 = uVar6 & 0xfff;
      iVar7_rec->npc_animation_frame = uw_ord2005_rem_68 & 0xf;
      DAT_0010190c->speed = ((int)(DAT_00101404->magic_power + 1) >> 1) & 0x7f;
      return;
    }
LAB_000314d0:
    DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 0x10;
    npc_set_goal(9, DAT_0010190c->npc_gtarg);
  }
  else {
    if ((DAT_00101924 == 0) || (DAT_00101430 != 0)) {
      iVar7 = try_npc_special_ability_no_los();
      if (iVar7 != 0) {
        return;
      }
      uVar2 = ce_rand();
      bVar4 = DAT_00101404->missile_wander_flags;
      uw_ord2005_rem_69 = ((int)(uVar2)) % (0x40);
      if ((uw_ord2005_rem_69 & 0xff) < (bVar4 & 0xf) + 8) {
        uVar2 = ce_rand();
        iVar7_rec = DAT_0010190c;
        bVar4 = DAT_0010190c->full_heading;
        uw_ord2005_rem_70 = ((int)(uVar2)) % (0x40);
        uw_ord2005_rem_71 = ((int)(uw_ord2005_rem_70 + (uint)bVar4 + 0xe0)) % (0x100);
        uVar1 = uw_ord2005_rem_71 & 0xff;
      }
      else {
        uVar1 = (uint) DAT_0010190c->full_heading;
        iVar7_rec = DAT_0010190c;
      }
      if (DAT_00101430 == 0) {
        uVar1 = adjust_heading_away_from_player(uVar1,0x18);
        iVar7_rec = DAT_0010190c;
      }
      iVar7_rec->full_heading = (byte)uVar1;
      DAT_0010190c->hdr.heading = (uVar1 >> 5) & 7;
      bVar4 = DAT_0010190c->heading_flags;
      bVar5 = bVar4 ^ (byte)uVar1;
    }
    else {
      if (DAT_00101900 < 9) {
        if ((DAT_0010190c->npc_goal) == 9) {
          DAT_0010190c->speed = 0;
          DAT_0010190c->full_heading = (byte)((uVar1 & 0xff) << 5);
          DAT_0010190c->hdr.heading = uVar1 & 0x7;
          DAT_0010190c->npc_heading = 0;
          DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
          DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
          iVar7_rec = DAT_0010190c;
          uVar6 = DAT_0010190c->goal_word;
          uw_ord2005_rem_72 = ((int)((uVar6 >> 0xc) + 1)) % (4);
          uVar1 = uVar6 & 0xfff;
          iVar7_rec->npc_animation_frame = uw_ord2005_rem_72 & 0xf;
          return;
        }
        goto LAB_000314d0;
      }
      uVar2 = ce_rand();
      uVar3 = ce_rand();
      iVar7_rec = DAT_0010190c;
      bVar4 = DAT_0010190c->full_heading;
      uw_ord2005_rem_73 = ((int)(uVar2)) % (2);
      uw_ord2005_rem_74 = ((int)((uint)(bVar4 >> 5) + uw_ord2005_rem_73 * 4 + 6)) % (8);
      uw_ord2005_rem_75 = ((int)(uVar3)) % (0x20);
      uVar1 = uw_ord2005_rem_74 + uw_ord2005_rem_75 * 0x20;
      bVar5 = (byte)uVar1;
      iVar7_rec->full_heading = bVar5;
      DAT_0010190c->hdr.heading = (uVar1 >> 5) & 7;
      bVar4 = DAT_0010190c->heading_flags;
      bVar5 = bVar5 ^ bVar4;
    }
    DAT_0010190c->npc_heading = (bVar5 ^ bVar4) & 0x1f;
    uVar6 = DAT_00101900;
    if (DAT_00101900 < 0x40) {
      uVar6 = (ushort) DAT_00101404->movement_speed;
    }
    bVar4 = (byte)uVar6;
    if (DAT_00101900 >= 0x40) {
      bVar4 = DAT_00101404->magic_power;
    }
    DAT_0010190c->speed = bVar4 & 0x7f;
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
    iVar7_rec = DAT_0010190c;
    uVar6 = DAT_0010190c->goal_word;
    uw_ord2005_rem_76 = ((int)((uVar6 >> 0xc) + 1)) % (4);
    uVar1 = uVar6 & 0xfff;
    iVar7_rec->npc_animation_frame = uw_ord2005_rem_76 & 0xf;
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
  }
}




// was FUN_00031a94 -- goal 10: checks line-of-sight/distance
// (detect_npc_wander_proximity, dist^2>399); if lost, reverts straight to idle state
// 0x20, otherwise continues closing on the target
void npc_combat_disengage_tick()
{
  int uw_ord2005_rem_77 = 0; int uw_ord2005_rem_78 = 0; int uw_ord2005_rem_79 = 0; int uw_ord2005_rem_80 = 0; int uw_ord2005_rem_81 = 0;
  ushort uVar1;
  uw_mobile_object_t *iVar2;
  char cVar3;
  undefined4 uVar4;
  char extraout_r1;
  int extraout_r1_00;
  uint extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint uVar5;
  ushort uVar6;
  uint uVar7;
  undefined1 uStack_1c;
  undefined1 auStack_1b [3];
  
  if (DAT_00101734 != 0) {
    uVar7 = DAT_0010190c->goal_word & 0xf01f;
    DAT_0010190c->npc_gtarg = 1;
    refresh_npc_target_delta();
    uVar6 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
    cVar3 = detect_npc_wander_proximity(auStack_1b,&uStack_1c);
    if ((cVar3 == '\x01') || (399 < uVar6)) {
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
      DAT_0010190c->speed = 0;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
      uVar4 = ce_rand();
      uw_ord2005_rem_77 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_77 != 0) {
        uVar6 = DAT_0010190c->goal_word;
        uw_ord2005_rem_78 = ((int)((uVar6 >> 0xc) + 1)) % (4);
        uVar7 = uVar6 & 0xfff;
        iVar2->npc_animation_frame = uw_ord2005_rem_78 & 0xf;
      }
    }
    else {
      uVar7 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      DAT_0010190c->speed = 0;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
      uVar4 = ce_rand();
      uw_ord2005_rem_79 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_79 != 0) {
        uVar1 = DAT_0010190c->goal_word;
        uw_ord2005_rem_80 = ((int)((uVar1 >> 0xc) + 1)) % (4);
        uVar5 = uVar1 & 0xfff;
        iVar2->npc_animation_frame = uw_ord2005_rem_80 & 0xf;
      }
      DAT_0010190c->full_heading = (byte)((uVar7 & 0xff) << 5);
      DAT_0010190c->hdr.heading = uVar7 & 0x7;
      DAT_0010190c->npc_heading = 0;
      if (uVar6 < 0x90) {
        uw_ord2005_rem_81 = ((int)((g_player_object->hdr.heading - (uVar7 & 0xff)) + 8)) % (8);
        if (('\x02' < uw_ord2005_rem_81) && (uw_ord2005_rem_81 < '\x06')) {
          DAT_0023bf0c = 0;
          reset_cursor_confine_rect();
          attempt_talk_interaction(DAT_0010190c);
        }
      }
    }
  }
}



// was FUN_00025a98 -- part of the combat hit-test flow (called from resolve_melee_swing_hit's own
// "[hit-test]" trace): given a target's hit-zone span [param_1,param_2] and an impact span
// [param_3,param_4]...
int resolve_combat_hit_zone(short zone_min, short zone_max, short hit_min, short hit_max)
{
  int uw_ord2005_rem_3 = 0; int uw_ord2005_rem_4 = 0; int uw_ord2005_rem_5 = 0;
  int iVar1;
  undefined4 uVar2;
  int extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  
  iVar1 = (int)(short)(((int)hit_min + (int)hit_max) >> 1);
  if (iVar1 < zone_min + 1) {
    return 2;
  }
  if (zone_max + -1 < iVar1) {
LAB_00025aec:
    uVar2 = 3;
  }
  else {
    if (iVar1 < (short)(((int)zone_max + (int)zone_min) >> 1)) {
      uVar2 = ce_rand();
      uw_ord2005_rem_3 = ((int)(uVar2)) % (2);
      if (uw_ord2005_rem_3 != 0) {
        return 2;
      }
    }
    else {
      uVar2 = ce_rand();
      uw_ord2005_rem_4 = ((int)(uVar2)) % (3);
      if (uw_ord2005_rem_4 == 0) goto LAB_00025aec;
    }
    uVar2 = ce_rand();
    uw_ord2005_rem_5 = ((int)(uVar2)) % (3);
    uVar2 = 0;
    if (uw_ord2005_rem_5 == 0) {
      uVar2 = 1;
    }
  }
  return uVar2;
}



// was FUN_00025b84 -- part of the combat hit-test flow: scans nearby object records (&DAT_00202c3a
// family) for the one closest, in projected screen space, to a target ray/point described by
// param_1...
int find_nearest_hit_target(short *screen_pos)
{
  byte bVar1;
  char cVar2;
  ushort uVar3;
  ushort uVar4;
  int iVar5;
  char *pcAttacker;
  ushort *puVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  short local_34;
  short local_32;
  
  cVar2 = (char)screen_pos[0xb];
  iVar12 = -1;
  local_32 = -1;
  iVar11 = 100000;
  local_34 = (short)cVar2;
  iVar9 = (int)(((int)cVar2 + (uint)*(byte *)((char *)screen_pos + 0x15)) * 0x10000) >> 0x10;
  iVar10 = (int)(short)cVar2;
  /* ARM 0x25bdc..0x25bf4 retains the attacker record as a pointer. */
  pcAttacker = (short)DAT_00100610 * 0x1b + DAT_002046b8;
  uVar3 = *(ushort *)(pcAttacker + 0x16);
  bVar1 = *(byte *)(pcAttacker + 3);
  if (iVar10 < iVar9) {
    do {
      uVar4 = *(ushort *)(&DAT_00202c3a + iVar10 * 6);
      /* BUG FIX (unit-testing-framework): was called bare -- dropped argument. ARM 0x25c84..0x25c8c
         passes the candidate link's slot index, confirmed by the identical `uVar4 >> 6` value used
         right below in this same loop. */
      puVar6 = (ushort *)get_object_record_by_slot_index(uVar4 >> 6);
      if ((((((uw_object_hdr_t *)puVar6)->object_id & 0x1c0) != 0x180) && (uVar4 >> 6 != DAT_00100610)) &&
          (((DAT_00100610 != 1 ||
             ((iVar5 = object_ptr_in_arena(puVar6), iVar5 == 0 ||
               ((*(byte *)((char *)puVar6 + 0x19) & 0x40) == 0)))) ||
            ((iVar10 == iVar9 + -1 && (iVar11 == 100000)))))) {
        uVar7 = (int)*(short *)(&DAT_00202c3c + iVar10 * 6) + (((int)*screen_pos << 0x10) >> 0x13) &
                0x3f;
        DAT_00100600 = (undefined2)uVar7;
        iVar5 = (int)*(short *)(&DAT_00202c3c + iVar10 * 6) -
                ((int)((uVar7 - (((int)*screen_pos << 0x10) >> 0x13)) * 0x10000) >> 0x10);
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0x3f;
        }
        uVar8 = (int)(short)(iVar5 >> 6) + (((int)screen_pos[1] << 0x10) >> 0x13) & 0x3f;
        DAT_00100604 = (ushort)uVar8;
        iVar5 = (int)(((uVar7 * -8 - (uint)(((uw_object_hdr_t *)puVar6)->xpos)) +
                       (int)(short)((uVar3 >> 7 & 0x1f8) + (ushort)(bVar1 >> 5))) * 0x10000) >> 0x10;
        iVar12 = (int)(((uVar8 * -8 - (((uw_object_hdr_t *)puVar6)->ypos)) +
                        (int)(short)((uVar3 >> 1 & 0x1f8) + (short)((bVar1 & 0x1c) >> 2))) * 0x10000)
                 >> 0x10;
        iVar5 = iVar5 * iVar5 + iVar12 * iVar12;
        if (iVar5 < iVar11) {
          local_32 = local_34;
          iVar11 = iVar5;
        }
      }
      iVar5 = (iVar10 + 1) * 0x10000;
      iVar10 = iVar5 >> 0x10;
      local_34 = (short)((uint)iVar5 >> 0x10);
    } while (iVar10 < iVar9);
    iVar12 = (int)local_32;
  }
  if (-1 < (short)iVar12) {
    uVar7 = (int)*(short *)(&DAT_00202c3c + (short)iVar12 * 6) + (((int)*screen_pos << 0x10) >> 0x13) &
            0x3f;
    DAT_00100600 = (undefined2)uVar7;
    iVar9 = (int)*(short *)(&DAT_00202c3c + (short)iVar12 * 6) -
            ((int)((uVar7 - (((int)*screen_pos << 0x10) >> 0x13)) * 0x10000) >> 0x10);
    if (iVar9 < 0) {
      iVar9 = iVar9 + 0x3f;
    }
    DAT_00100604 = (short)(iVar9 >> 6) + (screen_pos[1] >> 3) & 0x3f;
  }
  return iVar12;
}



// was FUN_00025ed8 -- part of the combat hit-test flow (own "[blood-splat]" trace): walks outward
// from the impact point along param_1's heading until it finds a floor/ceiling boundary, then
// spawns a blood-splat decal object (id 0x1cb) there...
void spawn_blood_splat_object(int object_slot, int step_count, byte *snapshot)
{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short sVar6;

  /* was `int` -- truncated spawn_new_object's real object
      pointer, latent while that function always returned 0 */
  uw_object_hdr_t *iVar7;
  undefined4 uVar8;
  char *iVar9;  /* was `int` -- truncated tilemap_lookup's real `void *` return (same class as iVar7 above and this
   whole file's dominant bug). */
  uint uVar10;
  short local_18;
  short local_16;

  step_count = step_count + 1;
  DAT_00202c6c = snapshot;
  snapshot[8] = 1;
  DAT_00202c6c[10] = 0;
  DAT_00202c6c[0xb] = 0;
  local_18 = (short)((uint)((int)*(short *)DAT_00202c6c << 0x14) >> 0x10);
  local_16 = (short)((uint)((int)*(short *)(DAT_00202c6c + 2) << 0x14) >> 0x10);
  while (collision_build_height_field(0),
        ((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
    project_position_by_heading(object_slot,0x10,&local_18,&local_16);
    step_count = step_count + -1;
    *DAT_00202c6c = (byte)((int)local_18 >> 4);
    DAT_00202c6c[1] = (byte)((uint)((int)local_18 >> 4) >> 8);
    DAT_00202c6c[2] = (byte)((int)local_16 >> 4);
    DAT_00202c6c[3] = (byte)((uint)((int)local_16 >> 4) >> 8);
    if (step_count * 0x10000 >> 0x10 < 1) {
      return;
    }
  }
  iVar7 = spawn_new_object(0x1cb, 0);
  if (iVar7 == (uw_object_hdr_t *)0x0) {
    return;
  }
  uVar3 = iVar7->position_word;
  uVar10 = uVar3 & 0x1fff;
  bVar1 = (byte)(((*DAT_00202c6c & 7) << 0xd) >> 8);
  iVar7->xpos = bVar1 >> 5;
  uVar10 = uVar3 & 0x3ff;
  bVar1 = (byte)(uVar10 >> 8) | bVar1 | (byte)(((DAT_00202c6c[2] & 7) << 10) >> 8);
  bVar2 = (byte)uVar10;
  iVar7->ypos = (bVar1 >> 2) & 7;
  sVar4 = *(short *)DAT_00202c6c;
  sVar5 = *(short *)(DAT_00202c6c + 2);
  iVar7->zpos = (DAT_00202c6c[4] + 8) & 0x7f;
  if (DAT_00100610 == 1) {
    play_positional_sound_effect(7,*(undefined2 *)DAT_00202c6c,*(undefined2 *)(DAT_00202c6c + 2),0);
  }
  uVar8 = encode_object_slot_index(iVar7);
  sVar6 = scheduler_add_entry(uVar8,2,0,(int)sVar4 >> 3 & 0xff,(char)((int)sVar5 >> 3));
  if (sVar6 == -1) {
    free_object_slot(iVar7);
    return;
  }
  iVar9 = tilemap_lookup((int)sVar4 >> 3,(int)sVar5 >> 3);
  object_list_append_tail(iVar9 + 2,iVar7);
}


// was FUN_00026194 -- resolves a melee weapon swing's hit test: computes the swing's attack
// direction/position, checks for a wall collision (spawning a blood-splat decal on the wall via
// spawn_blood_splat_object if so) versus a creature collision...
int resolve_melee_swing_hit()
{
  byte bVar1;
  char cVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  ushort *puVar6;
  uint uVar7;
  /* Same "6 independent locals treated as one contiguous record via DAT_00202c6c" bug already fixed
     in resolve_collision_candidate_interaction's own sibling collision-envelope caller (see its own
     comment, uw.c ~46514)... */
  undefined1 local_pos_record[0x20];
#define local_3c (*(short *)(local_pos_record + 0))
#define local_3a (*(short *)(local_pos_record + 2))
#define local_38 (*(short *)(local_pos_record + 4))
#define local_34 (local_pos_record[8])
#define local_33 (local_pos_record[9])
#define local_32 (*(short *)(local_pos_record + 0xa))

  ce_memset(local_pos_record, 0, sizeof(local_pos_record));
  DAT_00202c6c = local_pos_record;
  uVar7 = (uint)DAT_001005f4;
  local_34 = (char)DAT_001005f4 + '\x01';
  local_32 = DAT_00100610;
  local_33 = (char)((uVar7 & 0xff) << 3) + '\x04';
  iVar5 = (int)DAT_00100610;
  puVar6 = (ushort *)(iVar5 * 0x1b + DAT_002046b8);
  bVar1 = g_object_type_props[(*puVar6 & 0x1ff)].height;
  iVar4 = ordint_divmod(3,(int)DAT_001005f8).quot;
  sVar3 = ordint_divmod(3,(uint)bVar1 * iVar4).quot;
  sVar3 = ((byte)puVar6[1] & 0x7f) + sVar3;
  if (iVar5 == 1) {
    iVar5 = (int)DAT_0023beb4;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 0x1ff;
    }
    /* The original adds pitch. SDL look controls use negative pitch for up,
       so invert its contribution to the world-space strike height here. */
    sVar3 = sVar3 - (short)(iVar5 >> 9);
  }
  local_38 = sVar3;
  cVar2 = ordint_divmod(6,g_object_type_props[(*puVar6 & 0x1ff)].height).quot;
  DAT_001005dc = cVar2 + (char)sVar3;
  local_3c = (short)((puVar6[0xb] & 0xfc00) >> 7) + (ushort)(*(byte *)((char *)puVar6 + 3) >> 5);
  local_3a = (short)((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2) + ((puVar6[0xb] & 0x3f0) >> 1);
  iVar5 = ((byte)puVar6[0xc] & 0x1f) + ((puVar6[1] & 0x380) >> 2);
  project_position_by_heading(iVar5,uVar7 + 3,&local_3c,&local_3a);
  collision_height_envelope(0,1);
  if (*(char *)((char *)DAT_00202c6c + 0x14) == '\0') {
    collision_build_height_field(0);
    if (((*(ushort *)((char *)DAT_00202c6c + 0xe) | *(ushort *)((char *)DAT_00202c6c + 0xc)) & 0x300) != 0
       ) {
      iVar4 = ((puVar6[0xb] & 0xfc00) >> 7) + (uint)(*(byte *)((char *)puVar6 + 3) >> 5);
      *(char *)DAT_00202c6c = (char)iVar4;
      *(char *)((char *)DAT_00202c6c + 1) = (char)((uint)iVar4 >> 8);
      iVar4 = ((*(byte *)((char *)puVar6 + 3) & 0x1c) >> 2) + ((puVar6[0xb] & 0x3f0) >> 1);
      *(char *)((char *)DAT_00202c6c + 2) = (char)iVar4;
      *(char *)((char *)DAT_00202c6c + 3) = (char)((uint)iVar4 >> 8);
      spawn_blood_splat_object(iVar5,DAT_001005f4 + 3,DAT_00202c6c);
    }
  }
  else {
    sort_collision_candidates();
    if (*(char *)((char *)DAT_00202c6c + 0x15) != '\0') {
      /* ARM 0x263c0..0x263d0 passes the current collision record in r0. */
      sVar3 = find_nearest_hit_target((short *)DAT_00202c6c);
      if (-1 < sVar3) {
        iVar5 = sVar3 * 6;
        DAT_00100624 = resolve_combat_hit_zone((&DAT_00202c39)[iVar5],(&DAT_00202c38)[iVar5],
                                    (int)*(short *)((char *)DAT_00202c6c + 4),
                                    (uint)*(byte *)((char *)DAT_00202c6c + 9) +
                                    (int)*(short *)((char *)DAT_00202c6c + 4));
        DAT_00100620 = *(ushort *)(&DAT_00202c3a + iVar5) >> 6;
        return 1;
      }
    }
  }
  return 0;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32


// was FUN_00026570 -- resolves whether a confirmed hit actually penetrates: rolls a skill check
// (weapon skill + facing modifier vs the target's armor-class-shaped table at &DAT_001007e2)...
int resolve_weapon_hit_skill_check(short hit_flag, int target_slot)
{
  int uw_ord2005_rem_6 = 0;
  byte bVar1;
  ushort *puVar2;
  int iVar3;
  undefined4 uVar4;
  byte *pbVar5;
  int extraout_r1;
  uint uVar6;
  uint uVar7;
  ushort uVar8;
  
  puVar2 = (ushort *)get_object_record_by_slot_index(target_slot);
  uVar6 = (uint)((uw_object_hdr_t *)puVar2)->type_flags;
  if ((uVar6 & 0x1c0) == 0x40) {
    uVar7 = uVar6 & 0x3f;
    if (DAT_00100620 == 1) {
      uVar6 = (int)DAT_00100608 - (int)(char)(&DAT_0010060c)[DAT_00100624];
    }
    if (DAT_00100620 == 1) {
      DAT_00100608 = (short)uVar6;
    }
    else {
      uVar6 = (uint)DAT_00100608;
    }
    iVar3 = roll_skill_check(DAT_00100628 + uVar6,
                             (int)(char) g_monster_type_props[uVar7].defense);
    DAT_001005d8 = 0;
    if ((short)iVar3 != 2) {
      if ((((short)iVar3 == -1) && (hit_flag == 1)) &&
         (pbVar5 = (byte *)get_object_record_by_slot_index((int)DAT_00100620),
         (g_monster_type_props[(((uw_object_hdr_t *)pbVar5)->object_id & 0x3f)].movement_flags & 1) == 0)) {
        bVar1 = *(byte *)(DAT_00086df8 + 100);
        uVar4 = roll_dice_sum(2,3);
        damage_equipped_item_in_slot(8 - (bVar1 & 1),uVar4,4,0,1);
      }
      return 1 - iVar3;
    }
    DAT_001005d8 = 1;
    uVar6 = ce_rand();
    DAT_0010061c = (short)((int)((uVar6 & 0x1f) + 0x30) >> 5) * DAT_0010061c;
    if ((short)target_slot == 1) {
      weapon_overlay_flash_once(0xb8);
      uVar8 = DAT_00100624 + 1U & 3;
      if (uVar8 == 3) {
        uVar4 = ce_rand();
        uw_ord2005_rem_6 = ((int)(uVar4)) % (5);
        uVar8 = (uw_ord2005_rem_6 == 0) + 3;
      }
      else if ((uVar8 != 0) && (uVar8 < 3)) {
        uVar8 = (*(byte *)(DAT_00086df8 + 100) & 1) + 7;
      }
      uVar4 = roll_dice_sum(2,4);
      damage_equipped_item_in_slot(uVar8,uVar4,4,1,1);
    }
  }
  else if (((hit_flag == 1) && ((uVar6 & 0x1f0) == 0x140)) &&
          (iVar3 = rand_below(0xc), iVar3 < (int)((((uw_object_hdr_t *)puVar2)->object_id & 0x7) * 2))) {
    bVar1 = *(byte *)(DAT_00086df8 + 100);
    uVar4 = roll_dice_sum(2,4);
    damage_equipped_item_in_slot(8 - (bVar1 & 1),uVar4,4,0,1);
  }
  return 0;
}



// was FUN_00026858 -- applies a landed melee hit's damage: rolls a damage dice pool, reduces it by
// the target's armor value (looked up from &DAT_001007d0), plays the impact sound...
void apply_melee_damage(byte hit_type)
{
  int uw_ord2005_rem_7 = 0; int uw_ord2005_rem_8 = 0;
  uint uVar1;
  short sVar2;
  short sVar3;
  ushort uVar4;
  ushort uVar5;
  ushort *puVar6;
  ushort *uVar7; /* ARM 0x26b58..0x26b80 forwards the attacker pointer in r1. */
  short extraout_r1;
  int extraout_r1_00;
  ushort uVar8;
  uint uVar9;
  char cVar10;
  int iVar11;
  undefined2 in_stack_ffffffbc;
  undefined1 uVar12;
  undefined2 in_stack_ffffffc0;
  undefined1 uVar13;
  short local_38;
  
  uVar13 = (undefined1)((ushort)in_stack_ffffffc0 >> 8);
  uVar12 = (undefined1)((ushort)in_stack_ffffffbc >> 8);
  puVar6 = (ushort *)get_object_record_by_slot_index((int)DAT_00100620);
  uVar5 = ((uw_object_hdr_t *)puVar6)->type_flags;
  sVar3 = DAT_0010061c;
  if (DAT_0010061c < 2) {
    sVar3 = 2;
  }
  sVar2 = ordint_divmod(6,(int)sVar3).quot;
  uw_ord2005_rem_7 = ((int)((int)sVar3)) % (6);
  DAT_0010061c = 0;
  if (sVar2 != 0) {
    DAT_0010061c = roll_dice_sum((int)sVar2,6);
  }
  if (uw_ord2005_rem_7 != 0) {
    sVar3 = roll_dice_sum(1,(int)uw_ord2005_rem_7);
    DAT_0010061c = sVar3 + DAT_0010061c;
  }
  uVar9 = (uint)DAT_00100628 + (int)(short)((int)((uint)DAT_001005fc * (int)DAT_0010061c) >> 7);
  sVar3 = (short)uVar9;
  if (DAT_00100620 == 1) {
    play_sound_effect_with_pan(3,0x40,(uVar9 & 0xff) << 2);
  }
  else {
    play_positional_sound_effect(4,
                                 (uint)(((uw_object_hdr_t *)puVar6)->xpos) + DAT_00100600 * 8,
                                 (((uw_object_hdr_t *)puVar6)->ypos) + DAT_00100604 * 8,
                                 (uVar9 & 0xff) << 2);
  }
  uVar8 = DAT_00100624;
  sVar2 = DAT_00100620;
  uVar1 = (uint)(short)(uVar5 & 0x1ff);
  uVar5 = uVar5 & 0x1c0;
  if (uVar5 == 0x40) {
    iVar11 = (uVar1 & 0x3f) * 0x30;
    uw_ord2005_rem_8 = ((int)((int)(short)DAT_00100624)) % (4);
    uVar4 = (ushort)(byte) g_monster_type_props[iVar11 / 0x30].armor[uw_ord2005_rem_8];
    if (uVar4 == 0xff) {
      DAT_00100624 = uVar8 & 4;
      uVar4 = (ushort)(byte) g_monster_type_props[iVar11 / 0x30].armor[0];
    }
    if ((sVar2 != 1) && ((((uw_mobile_object_t *)puVar6)->status_word_high & 4) != 0)) {
      uVar4 = ordint_divmod(3,(short)uVar4 * 5).quot;
    }
    if ((int)(uVar9 * 0x10000) >> 0x10 < (int)(short)uVar4) {
      sVar3 = 0;
    }
    else {
      sVar3 = (short)(uVar9 * 0x10000 >> 0x10) - uVar4;
    }
  }
  iVar11 = (int)sVar3;
  if (iVar11 < 0) {
    iVar11 = iVar11 + 3;
  }
  local_38 = (short)(iVar11 >> 2);
  if (3 < local_38) {
    local_38 = 3;
  }
  if ((sVar2 == 1) && (*(char *)(DAT_00086df8 + 0xb4) != '\0')) {
    sVar3 = sVar3 >> 1;
  }
  uVar7 = get_object_record_by_slot_index((int)DAT_00100610);
  iVar11 = apply_typed_damage_to_object(puVar6,uVar7,(int)DAT_00100600,(int)DAT_00100604,
                        CONCAT11(uVar12,(char)sVar3),CONCAT11(uVar13,hit_type));
  sVar2 = DAT_00100610;
  cVar10 = DAT_001005dc;
  if ((sVar3 != 0) && (DAT_00100610 != -1)) {
    if (3 < (short)DAT_00100624) {
      DAT_00084f1c = -DAT_001005dc;
      DAT_00100624 = 4;
    }
    uVar8 = DAT_00100624;
    sVar3 = ordint_divmod(0x1b,DAT_0023b82c - DAT_002046b8).quot;
    if (DAT_00100620 == sVar3) {
      set_movement_animation_timer(0x20,(uint)(byte)local_38 * 5);
    }
    else {
      if (uVar5 == 0x40) {
        if (sVar2 == 1) {
          if (g_monster_type_props[(uVar1 & 0x3f)].max_hp == '\0') {
            iVar11 = 0;
          }
          else {
            sVar3 = ordint_divmod(g_monster_type_props[(uVar1 & 0x3f)].max_hp,
                                  (uint)((uw_mobile_object_t *)puVar6)->hit_points * 3).quot;
            iVar11 = (int)sVar3;
          }
          if (2 < (short)iVar11) {
            iVar11 = 2;
          }
          set_hud_status_value(7,3 - iVar11);
          uVar8 = DAT_00100624;
          cVar10 = DAT_001005dc;
        }
        if ((g_monster_type_props[(uVar1 & 0x3f)].effects_flags & 0x18) != 0) {
          spawn_scheduled_effect_object(puVar6,0,1,(int)local_38,(short)(&DAT_00084f18)[(short)uVar8],
                       DAT_00100600,DAT_00100604);
          if (DAT_001005d8 == 0) {
            return;
          }
          if (DAT_00100610 != 1) {
            return;
          }
          uVar5 = ce_rand();
          spawn_scheduled_effect_object(puVar6,0,1,(int)local_38,
                       (uVar5 & 1) * 5 + (short)(&DAT_00084f18)[(short)DAT_00100624] + -2,
                       DAT_00100600,DAT_00100604);
          return;
        }
        iVar11 = 0;
      }
      if (iVar11 != 0) {
        puVar6 = (ushort *)0x0;
      }
      if (((uVar1 & 0x1f0) == 0x140) || (uVar1 == 0x1cf)) {
        if ((int)cVar10 < (int)(((uw_object_hdr_t *)puVar6)->zpos)) {
          cVar10 = (((uw_object_hdr_t *)puVar6)->zpos) + 2;
          DAT_001005dc = cVar10;
        }
        spawn_scheduled_effect_object(puVar6,0xb,1,(int)local_38,-(short)cVar10,DAT_00100600,DAT_00100604);
      }
      else {
        spawn_scheduled_effect_object(puVar6,0xb,1,(int)local_38,-(short)cVar10,DAT_00100600,DAT_00100604);
      }
    }
  }
}



// was FUN_00026eb4 -- picks and plays a combat impact sound effect: id
// 10 for a whiffed/no-target swing (result==0), else id 7 or 8
// depending on whether the attacker's weapon type and the target's
// armor/shield type both indicate a "blocked" match (a metal-on-metal
// clang vs a duller impact).
//
// BUG FIX (real crash, same class as play_sound_effect_at_object's own
// fix in audio.c): the hit branch (result != 0) dereferenced
// get_object_record_by_slot_index(DAT_00100610)'s result unconditionally
// (`DAT_00100610 = *puVar6 & 0x1ff;`) with no NULL check -- confirmed
// byte-for-byte against a live Ghidra decompile of the real FUN_00026eb4,
// so this is a genuine latent bug in the original compiled game, not a
// decompile artifact, same as every other bug on this branch: never
// reachable before the SFX subsystem flags were fixed to their real
// nonzero default. get_object_record_by_slot_index legitimately returns
// NULL for an empty slot (already documented at its own definition in
// objects.c, already guarded at several other call sites in
// movement.c/tmap.c) -- added the same guard here, matching this
// function's own existing "nothing to do, return 0" exit (the shared
// tail below already does this for every other path).
//
// BUG FIX (real crash, SECOND pointer truncation, one level up from the
// play_sound_effect_at_object fix): uVar4 -- which holds
// get_object_record_by_slot_index's real pointer result on BOTH paths
// that reach play_sound_effect_at_object(uVar5,uVar4,0) below -- was
// `undefined4` (32-bit), truncating the real 64-bit object pointer
// right here, before the already-fixed object-pointer type on the callee
// side ever gets a chance to matter. Confirmed via a live Ghidra decompile
// of the real FUN_00026eb4 that this `undefined4 uVar4;` is genuinely how
// the original compiled game typed it too (same unrecovered-32-bit-
// pointer-width class as every other fix on this branch). Live repro
// (the user's own attack-crash.txt, replayed under lldb): confirmed the
// first fix alone didn't resolve the crash because of this exact
// truncation still happening one call frame earlier. Widened to a real
// pointer type.
int play_weapon_impact_sound(short result)
{
  uint uVar1;
  byte bVar2;
  ushort uVar3;
  void *uVar4;
  undefined4 uVar5;
  ushort *puVar6;
  byte bVar7;

  if (result == 0) {
    uVar4 = get_object_record_by_slot_index((int)(short)DAT_00100610);
    uVar5 = 10;
    goto LAB_0002701c;
  }
  puVar6 = (ushort *)get_object_record_by_slot_index((int)(short)DAT_00100610);
  if (puVar6 == (ushort *)0x0) {
    return 0;
  }
  DAT_00100610 = ((uw_object_hdr_t *)puVar6)->object_id;
  uVar1 = (uint)(short)DAT_00100610;
  if ((uVar1 == 1) || (0xff < uVar1)) {
    bVar7 = 1;
  }
  else {
    bVar7 = (byte) g_monster_type_props[(uVar1 & 0x3f)].category >> 6;
  }
  if (DAT_00100620 == 1) {
    puVar6 = (ushort *)get_equipped_item_at_slot((char)DAT_00100624 + 1U & 3);
    if (((((puVar6 == (ushort *)0x0) || (uVar3 = ((uw_object_hdr_t *)puVar6)->object_id, uVar3 == 0x20)) || (uVar3 == 0x23)
         ) || ((uVar3 == 0x26 || (uVar3 == 0x29)))) || (uVar3 == 0x2c)) {
LAB_00026fe8:
      bVar2 = 0;
    }
    else {
      bVar2 = 1;
    }
  }
  else {
    if (0xff < DAT_00100620) goto LAB_00026fe8;
    bVar2 = (byte) g_monster_type_props[(uVar1 & 0x3f)].category >> 4 & 3;
  }
  if ((bVar7 != 1) || (uVar5 = 7, bVar2 != 1)) {
    uVar5 = 8;
  }
  uVar4 = get_object_record_by_slot_index((int)DAT_00100620);
LAB_0002701c:
  play_sound_effect_at_object(uVar5,uVar4,0);
  return 0;
}



// was FUN_0002702c -- computes the attacker's facing relative to the target (DAT_00100628, a
// mirrored 0-4 octant offset from the two objects' own heading fields)...
void compute_attack_relative_facing()
{
  int uw_ord2005_rem_9 = 0;
  /* ARM 0x27038..0x27068 reads both returned object pointers directly. */
  char *iVar1;
  char *iVar2;
  uint extraout_r1;
  
  iVar1 = get_object_record_by_slot_index((int)DAT_00100620);
  iVar2 = get_object_record_by_slot_index((int)DAT_00100610);
  uw_ord2005_rem_9 = ((int)(((((uw_object_hdr_t *)iVar1)->heading) - (((uw_object_hdr_t *)iVar2)->heading)) + 0xc)) % (8);
  DAT_00100628 = (char)uw_ord2005_rem_9;
  if (4 < (uw_ord2005_rem_9 & 0xff)) {
    DAT_00100628 = '\b' - DAT_00100628;
  }
}



// was FUN_000270d0 -- top-level melee swing resolution: calls resolve_melee_swing_hit to hit-test
// the swing, then (if a creature was struck and isn't already excluded by a same-faction/arena
// check) computes relative facing, resolves the weapon-vs-armor skill check...
int process_melee_attack_swing()
{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  /* ARM 0x27174..0x271a8 keeps attacker/target pointers for damage dispatch. */
  ushort *uVar4;
  ushort *uVar5;
  ushort *puTarget;
  ushort *puAttacker;
  
  iVar1 = resolve_melee_swing_hit();
  if (iVar1 == 0) {
    uVar2 = 0;
  }
  else {
    if ((DAT_00100610 != 1) && (iVar1 = (int)DAT_00100620, DAT_00100620 != 1)) {
      /* BUG FIX (unit-testing-framework): both calls were bare -- dropped arguments. ARM
         0x27110..0x27114 forwards the resolved target pointer; same dropped-argument idiom fixed
         repeatedly elsewhere in this project. */
      puTarget = get_object_record_by_slot_index((int)DAT_00100620);
      iVar3 = object_ptr_in_arena(puTarget);
      iVar1 = 0;
      if (iVar3 != 0) {
        puTarget = get_object_record_by_slot_index((int)DAT_00100620);
        puAttacker = get_object_record_by_slot_index((int)DAT_00100610);
        if (((*(byte *)((char *)puTarget + 0x19) ^ *(byte *)((char *)puAttacker + 0x19)) & 0x40) == 0) {
          return 0;
        }
      }
    }
    compute_attack_relative_facing();
    uVar2 = resolve_weapon_hit_skill_check((int)DAT_00100610,(int)DAT_00100620);
    if ((short)uVar2 == 0) {
      apply_melee_damage(4);
      return 1;
    }
    uVar4 = get_object_record_by_slot_index((int)DAT_00100610);
    uVar5 = get_object_record_by_slot_index((int)DAT_00100620);
    apply_typed_damage_to_object(uVar5,uVar4,(int)DAT_00100600,(int)DAT_00100604,0,4);
  }
  uVar2 = play_weapon_impact_sound(uVar2);
  return uVar2;
}


// was FUN_000272c0 -- resolves the player's currently equipped weapon (the item in the off-hand
// slot, 8-handedness) into an attack-data record pointer (*param_1) and outputs the raw item
// pointer itself (*param_2): if it's a ranged weapon (category 0x10) with a valid ammo type...
int resolve_equipped_weapon_attack(char * *out_attack_data, char * *out_weapon_object)
{
  uint uVar1;
  ushort uVar2;
  short sVar3;
  ushort *puVar4;
  int iVar5;

  *out_attack_data = 0;
  puVar4 = (ushort *)get_equipped_item_at_slot(8 - (*(byte *)(DAT_00086df8 + 100) & 1));
  *out_weapon_object = (char *)puVar4;
  if (puVar4 != (ushort *)0x0) {
    uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
    uVar1 = (uint)(short)(uVar2 & 0x1ff);
    if ((uVar2 & 0x1f0) == 0x10) {
      iVar5 = (uVar1 & 0xf) * 3;
      if ((-1 < (char) g_ranged_type_props[(iVar5) / 3].ammo_damage_selector) && ((char) g_ranged_type_props[(iVar5) / 3].ammo_damage_selector < '\x10')) {
        sVar3 = find_and_consume_ammo(uVar2 & 0xf);
        if (sVar3 < 0) {
          wait_for_click_release(1);
          return 0xffffffff;
        }
        *out_attack_data = (char *)&g_ranged_type_props[(iVar5) / 3];
        return 0;
      }
    }
    else if ((uVar2 & 0x1f0) == 0) {
      *out_attack_data = (char *)&g_melee_type_props[(uVar1 & 0xf)];
      DAT_001005f4 = (byte)((byte)g_object_type_props[uVar1].size_weight) & 7;
    }
  }
  if (*out_attack_data == 0) {
    *out_attack_data = &DAT_00202878;
    DAT_001005f4 = DAT_00202d54 & 7;
  }
  return 1;
}



// was FUN_000273f8 -- computes the player's own weapon-swing attack stats: to-hit base
// (DAT_00100608, from the player's own weapon skill plus a strength-derived bonus, +7 more if a
// "berserk"-shaped flag at DAT_00086df8+0xb4 is set) and damage dice pool...
void compute_player_weapon_attack_stats(char *weapon_stats, char *weapon_item, short attack_type)
{
  byte bVar1;
  char *iVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short local_2c;
  ushort local_2a;
  int local_28;
  
  iVar2 = DAT_00086df8;
  bVar1 = *(byte *)(weapon_stats + 6);
  uVar3 = (ushort)bVar1;
  if ((5 < bVar1) || (bVar1 < 2)) {
    uVar3 = 2;
  }
  sVar5 = (ushort)*(byte *)((short)uVar3 + DAT_00086df8 + 0x21) +
          (ushort)(*(byte *)(DAT_00086df8 + 0x21) >> 1);
  DAT_00100608 = sVar5;
  sVar4 = ordint_divmod(7,*(undefined1 *)(DAT_00086df8 + 0x1f)).quot;
  DAT_00100608 = sVar5 + sVar4;
  if (*(char *)(iVar2 + 0xb4) != '\0') {
    DAT_00100608 = DAT_00100608 + 7;
  }
  if ((short)uVar3 == 2) {
    sVar4 = ordint_divmod(6,
                          g_monster_type_props[(g_player_object->hdr.object_id & 0x3f)].strength).quot;  /* dividend dropped by Ghidra; ARM 0x2749c-0x274bc, same table lookup as the else branch below */
    sVar5 = ordint_divmod(5,(uint)*(byte *)(iVar2 + 0x23) << 1).quot;
    DAT_0010061c = sVar4 + sVar5 + 4;
  }
  else {
    sVar4 = ordint_divmod(9,
                          g_monster_type_props[(g_player_object->hdr.object_id & 0x3f)].strength).quot;
    DAT_0010061c = (ushort)*(byte *)(weapon_stats + (uint)(byte)(&DAT_00084eff)[attack_type]) + sVar4;
  }
  DAT_00100610 = 1;
  DAT_001005f8 = attack_type;
  if (((weapon_item != 0) && (resolve_object_variant_or_special_link(weapon_item,&local_2c,&local_2a,&local_28), local_28 == 0)) &&
     (local_2c == 0xc)) {
    if ((local_2a & 8) == 0) {
      DAT_00100608 = (local_2a & 7) + DAT_00100608 + 1;
    }
    else {
      DAT_0010061c = (local_2a & 7) + DAT_0010061c + 1;
    }
  }
}


// was FUN_00027b3c -- a general-purpose "attacker object directly hits target object"
// damage-application entry point (parallel to, but independent of, the player's own
// tick_weapon_swing_state chain)...
void apply_direct_object_hit(short hit_flag, void *attacker_ptr, ushort *target, short tile_x, short tile_y, short damage_dice, byte hit_type)
{
  ushort *attacker = (ushort *)attacker_ptr;
  short sVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  DAT_00100604 = tile_y;
  DAT_001005d8 = 0;
  DAT_00100628 = 0;
  DAT_001005dc = ((byte)attacker[1] & 0x7f) + ((byte) g_object_type_props[(*attacker & 0x1ff)].height >> 1);
  DAT_001005fc = 0x80;
  DAT_00100600 = tile_x;
  DAT_00100610 = hit_flag;
  DAT_00100620 = encode_object_slot_index(target);
  uVar4 = (byte)attacker[1] & 0x7f;
  uVar2 = ((uw_object_hdr_t *)target)->zpos;
  sVar1 = resolve_combat_hit_zone(uVar2,
                                  (byte) g_object_type_props[(((uw_object_hdr_t *)target)->object_id)].height + uVar2,
                                  uVar4,
                                  (byte) g_object_type_props[(*attacker & 0x1ff)].height + uVar4);
  DAT_00100624 = sVar1 + 4;
  DAT_0010061c = damage_dice;
  if (target == g_player_object) {
    play_sound_effect_with_pan(3,0,0);
  }
  else {
    iVar3 = object_ptr_in_arena(target);
    if (iVar3 != 0) {
      play_sound_effect_at_object(4,target,0);
    }
  }
  apply_melee_damage(hit_type);
}


// was FUN_00027ce0 -- resolves an NPC's melee attack: computes its to-hit base (DAT_00100608) and
// damage dice pool (DAT_0010061c) from its own monster-stat table
// (&DAT_001007d0/&DAT_001007d5/&DAT_001007e1)...
int resolve_npc_melee_attack(void *npc_ptr, short tile_x, byte tile_y, short offset_x, short offset_y)
{
  byte *npc = (byte *)npc_ptr;
  byte bVar1;
  char cVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  short extraout_r1;
  short extraout_r1_00;
  int iVar6;
  uint uVar7;
  
  DAT_001005f4 = 2;
  DAT_00100610 = encode_object_slot_index(npc);
  iVar6 = (*npc & 0x3f) * 0x30;
  iVar5 = offset_x * 3 + iVar6;
  bVar1 = g_monster_type_props[iVar6 / 0x30].attacks[offset_x].damage;
  DAT_0010061c = (ushort)bVar1;
  DAT_001005f8 = tile_x;
  DAT_001005fc = tile_y;
  sVar3 = ordint_divmod(5,
                        g_monster_type_props[(*npc & 0x3f)].strength).quot;
  DAT_0010061c = (ushort)bVar1 + sVar3;
  DAT_00100608 = (short)(char) g_monster_type_props[iVar6 / 0x30].attacks[offset_x].skill +
                 (short)((int)(char) g_monster_type_props[(iVar6) / 0x30].equipment_damage >> 1);
  if ((npc[0xe] & 4) != 0) {
    /* Both ordint_divmod calls below were the same fabricated-remainder bug fixed elsewhere this
       session (this port's ordint_divmod never populates extraout_r1/extraout_r1_00); computed each
       remainder directly instead. */
    uVar4 = ce_rand();
    DAT_00100608 = DAT_00100608 + (short)(uVar4 % 6) + 7;
    uVar4 = ce_rand();
    DAT_0010061c = DAT_0010061c + (short)(uVar4 % 0xc) + 4;
  }
  iVar5 = process_melee_attack_swing();
  if ((iVar5 != 0) && (DAT_00100620 == 1)) {
    if (((short)(*(byte *)(DAT_00086df8 + 0x5f) >> 2 & 0xf) < offset_y) &&
       (cVar2 = resolve_damage_type_resistance(g_player_object,1,0x10), cVar2 != '\0')) {
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
      *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar7 | (byte)(((int)offset_y & 0xfU) << 2);
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    }
  }
  return iVar5;
}


// was FUN_00027f14 -- grants the player experience for killing param_1 (a monster object, category
// 0x40): plays a HUD update and music sting, rolls XP from the monster's own stat table
// (&DAT_001007f8), with a random spread when a specific stat flag bit is set...
void award_monster_kill_experience(ushort *monster)
{
  int uw_ord2005_rem_10 = 0;
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  int extraout_r1;
  
  if ((*monster & 0x1c0) == 0x40) {
    set_hud_status_value(4,2);
    set_pending_music_track(9);
    sVar1 = (short) g_monster_type_props[((byte)*monster & 0x3f)].experience;
    iVar2 = roll_dice_sum(2,(int)sVar1);
    iVar2 = iVar2 + sVar1 * 4;
    if ((monster[7] & 4) != 0) {
      uVar3 = ce_rand();
      uw_ord2005_rem_10 = ((int)(uVar3)) % (0x18);
      iVar2 = (uw_ord2005_rem_10 + 0x18) * (iVar2 * 0x10000 >> 0x10);
      if (iVar2 < 0) {
        iVar2 = iVar2 + 0xf;
      }
      iVar2 = (int)(short)(iVar2 >> 4);
    }
    grant_experience_points(iVar2);
  }
}



// was FUN_00028004 -- loads the combat data file (\DATA\cmb.dat,
// s__DATA_cmb_dat_00084f40) relative to the game data path
// (DAT_0023cca8) into the &DAT_00100630 buffer (0x3c bytes).
void load_combat_data_file()
{
  char stack0xffdc3250_buf [256];
  char *stack0xffdc3250_ptr;
  char cVar1;
  char *pcVar2;
  char acStack_108 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3250_ptr = acStack_108;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3250_ptr = cVar1; stack0xffdc3250_ptr = stack0xffdc3250_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_108,s__DATA_cmb_dat_00084f40);
  read_buffer_from_file(acStack_108,&DAT_00100630,0x3c);
}


// was FUN_0002a2c8 -- reads a fixed 0xc00-byte block from file handle param_1 into &DAT_001007d0
// (the monster combat-stat table apply_melee_damage/ resolve_npc_melee_attack read armor/attack
// values from).
void load_monster_combat_stats(int file_handle)
{
  read_file_handle(file_handle, g_monster_type_props,
                   sizeof g_monster_type_props);
}


// was FUN_00030aac -- an NPC combat sub-goal attempt (one of 3 confirmed sibling sub-goals
// npc_combat_engage_close_tick picks between when not yet close enough to attack, per its own
// comment).
int try_npc_special_ability_no_los()
{
  int uw_ord2005_rem_59 = 0;
  byte bVar1;
  undefined4 uVar2;
  int iVar3;
  int extraout_r1;
  uint uVar4;
  
  if (*(char *)&DAT_00101404->spells[2] != -1) {
    uVar2 = ce_rand();
    bVar1 = DAT_00101404->spell_flags;
    uw_ord2005_rem_59 = ((int)(uVar2)) % (0x100);
    if (((uw_ord2005_rem_59 < (int)(uint)(bVar1 >> 1)) &&
        (iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar3 == 0)) &&
       ((DAT_00201b68 != 7 ||
        (((*(byte *)(DAT_00086df8 + 0x60) & 0x20) != 0 || (*(char *)&DAT_00101404->race_flags != '\x13'))))
       )) {
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xcd | 0xd;
      DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 0xc;
      DAT_0010190c->npc_animation_frame = 0x0;
      uVar4 = DAT_0010190c->goal_word;
      return 1;
    }
  }
  return 0;
}



// was FUN_00030be0 -- an NPC combat sub-goal attempt (sibling of try_npc_special_ability_no_los):
// requires a clear line of sight (check_fine_line_of_sight) and a resource check
// (check_npc_target_alignment(1), likely "can afford this ability's cost")...
int try_npc_special_ability_ranged()
{
  int uw_ord2005_rem_60 = 0; int uw_ord2005_rem_61 = 0;
  byte bVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  short extraout_r1;
  int extraout_r1_00;
  uint uVar5;
  
  iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8);
  if ((((iVar3 == 0) &&
       (((DAT_00201b68 != 7 || ((*(byte *)(DAT_00086df8 + 0x60) & 0x20) != 0)) ||
        (*(char *)&DAT_00101404->race_flags != '\x13')))) &&
       (((DAT_00101900 < 0x40 && (iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar3 == 0)) &&
         (iVar3 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,
                                           (uint)(byte) g_object_type_props[(DAT_0010190c->hdr.object_id)].height +
                                           (DAT_0010190c->hdr.zpos),DAT_00101908,DAT_00101418,
                                           (ushort)(byte) g_object_type_props[(*(ushort *)DAT_00101400 & 0x1ff)].height +
                                           (((byte)DAT_00101400[2]) & 0x7f)), iVar3 != 0)))) &&
      (iVar3 = check_npc_target_alignment(1), iVar3 != 0)) {
    uVar4 = ce_rand();
    bVar1 = DAT_00101404->spell_flags;
    uw_ord2005_rem_60 = ((int)(uVar4)) % (0x80);
    if (uw_ord2005_rem_60 < (short)(ushort)(bVar1 >> 1)) {
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xcd | 0xd;
      uVar4 = ce_rand();
      uw_ord2005_rem_61 = ((int)(uVar4)) % (0x10);
      cVar2 = '\x01';
      if (10 < uw_ord2005_rem_61) {
        cVar2 = '\x02';
      }
      DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xf3 | cVar2 << 2;
      DAT_0010190c->npc_animation_frame = 0x0;
      uVar5 = DAT_0010190c->goal_word;
    }
    return 1;
  }
  return 0;
}



// was FUN_00030e50 -- an NPC combat sub-goal attempt (third sibling of
// try_npc_special_ability_no_los/_ranged): also requires line of sight and the same resource
// check...
int try_npc_special_ability_alt()
{
  int uw_ord2005_rem_62 = 0;
  byte bVar1;
  int iVar2;
  undefined4 uVar3;
  int extraout_r1;
  uint uVar4;
  
  /* The target's Z is the position word's low 7 bits (ARM 0x30e50 reads bytes 2-3 of the target);
     this was `DAT_00101400[1]` on a `char *`, i.e. byte 1 of the object-id word -- always 0 for the
     player -- so the sight line ran 20-odd units under the floor and every ranged attack was
     blocked (same bug at the other two sight checks, here and in npc_ai_tick). */
  if (((DAT_00101900 < 0x10) &&
      (iVar2 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,
                            (uint)(byte) g_object_type_props[(DAT_0010190c->hdr.object_id)].height +
                            (DAT_0010190c->hdr.zpos),DAT_00101908,DAT_00101418,
                            (ushort)(byte) g_object_type_props[(*(ushort *)DAT_00101400 & 0x1ff)].height +
                            (((byte)DAT_00101400[2]) & 0x7f)), iVar2 != 0)) &&
     (iVar2 = check_npc_target_alignment(1), iVar2 != 0)) {
    uVar3 = ce_rand();
    bVar1 = DAT_00101404->dexterity;
    uw_ord2005_rem_62 = ((int)(uVar3)) % (0xc0);
    if (uw_ord2005_rem_62 <= (int)(uint)bVar1) {
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc5 | 5;
      DAT_0010190c->npc_animation_frame = 0x0;
      uVar4 = DAT_0010190c->goal_word;
    }
    return 1;
  }
  return 0;
}


// was FUN_000318d8 -- adjusts an NPC's current heading (param_1) to swerve away from the player
// when the player is within param_2 tiles (distance squared): if closer than threshold, computes
// the heading toward the player and...
uint adjust_heading_away_from_player(uint heading, uint min_distance_sq)
{
  /* Was `int`, truncating the real 64-bit pointer get_object_record_by_slot_index(1) returns --
     same class of bug fixed repeatedly elsewhere this session. Confirmed live crashing on the very
     first dereference (the first time this newly-reachable NPC AI path called it). */
  intptr_t iVar1;
  uint uVar2;
  uint extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint extraout_r1_02;
  uint extraout_r1_03;
  uint extraout_r1_04;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  
  iVar1 = (intptr_t)get_object_record_by_slot_index(1);
  uVar3 = ((*(ushort *)(iVar1 + 0x16) >> 7 & 0x1f8) + (uint)(*(byte *)(iVar1 + 3) >> 5)) -
          (uint)DAT_00101910;
  uVar5 = ((*(ushort *)(iVar1 + 0x16) >> 1 & 0x1f8) + ((*(byte *)(iVar1 + 3) & 0x1c) >> 2)) -
          (uint)DAT_0010141c;
  uVar2 = uVar5 & 0xffff;
  uVar4 = uVar3 & 0xffff;
  if ((int)(uVar4 * uVar4 + uVar2 * uVar2 & 0xffff) < (int)((min_distance_sq & 0xffff) * (min_distance_sq & 0xffff))
     ) {
    uVar2 = compute_movement_heading((int)(uVar3 * 0x1000000) >> 0x18,(int)(uVar5 * 0x1000000) >> 0x18);
    /* All 5 ordint_divmod calls below were the same fabricated-remainder bug fixed elsewhere this
       session (this port's ordint_divmod never populates extraout_r1/extraout_r1_NN) -- computed
       each remainder directly instead. */
    iVar1 = (((uVar2 & 0xff) + 4) % 8) * 0x20;
    uVar4 = heading & 0xff;
    uVar2 = ((iVar1 - uVar4) + 0x100) & 0xff;
    if ((0x3f < uVar2) && (uVar2 < 0xc1)) {
      if (uVar2 < 0x60) {
        heading = (iVar1 + 0xe0) & 0xff;
      }
      else if (uVar2 < 0x80) {
        heading = (uVar4 + 0x20) & 0xff;
      }
      else if (uVar2 < 0xa1) {
        heading = (uVar4 + 0xe0) & 0xff;
      }
      else {
        heading = (iVar1 + 0x20) & 0xff;
      }
      heading = heading & 0xff;
    }
  }
  return heading;
}


// was FUN_00032410 -- checks/adjusts an NPC's 8-way facing toward a target position
// (DAT_00101908/0x1c minus DAT_00101910/0x1c, the same aim-point delta check_fine_line_of_sight's
// own callers compute): param_1==0 checks the coarse 8-way heading via compute_movement_heading...
int check_npc_target_alignment(int mode)
{
  int uw_ord2005_rem_87 = 0; int uw_ord2005_rem_88 = 0; int uw_ord2005_rem_89 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  char *iVar4;
  char cVar5;
  undefined4 uVar6;
  char extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint uVar7;
  
  iVar1 = (int)(((uint)DAT_00101908 - (uint)DAT_00101910) * 0x1000000) >> 0x18;
  iVar2 = (int)(((uint)DAT_00101418 - (uint)DAT_0010141c) * 0x1000000) >> 0x18;
  cVar5 = compute_movement_heading(iVar1,iVar2);
  iVar4 = (char *)DAT_0010190c;
  uVar3 = DAT_0010190c->hdr.position_word;
  uw_ord2005_rem_87 = ((int)(((int)cVar5 - ((int)(char)(uVar3 >> 7) & 7U)) + 8)) % (8);
  if (mode == 0) {
    if (uw_ord2005_rem_87 == '\0') {
      uVar6 = 1;
    }
    else {
      uVar7 = uVar3 >> 7 & 7;
      if (uw_ord2005_rem_87 < '\x05') {
        uw_ord2005_rem_88 = ((int)(uVar7 + 1)) % (8);
        uVar7 = uw_ord2005_rem_88;
      }
      else {
        uw_ord2005_rem_89 = ((int)(uVar7 - 1)) % (8);
        uVar7 = uw_ord2005_rem_89;
      }
      uVar7 = uVar3 & 0xfc7f | (uVar7 & 7) << 7;
      ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)(char)uVar7;
      DAT_0010190c->hdr.position_word_high = (byte)(char)(uVar7 >> 8);
      uVar6 = 0;
    }
  }
  else {
    uVar6 = check_npc_fine_facing_alignment(iVar1,iVar2);
  }
  return uVar6;
}



// was FUN_0003276c -- checks/adjusts an NPC's fine-grained facing toward a target delta
// (param_1,param_2): computes the precise angle via slope ratios fed through
// compute_angle_from_slope (an atan2-shaped helper, not yet named)...
int check_npc_fine_facing_alignment(char delta_x, char delta_y)
{
  int uw_ord2005_rem_90 = 0; int uw_ord2005_rem_91 = 0; int uw_ord2005_rem_92 = 0;
  uint uVar1;
  short sVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint extraout_r1;
  uint extraout_r1_00;
  uint extraout_r1_01;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;
  
  uVar8 = 0;
  uVar4 = DAT_0010190c->hdr.position_word >> 2 & 0xff;
  uVar4 = (uVar4 ^ DAT_0010190c->heading_flags) & 0x1f ^ uVar4;
  uVar3 = integer_sqrt((int)DAT_00101444 * (int)DAT_00101444 + (int)DAT_00101448 * (int)DAT_00101448
                      );
  uVar6 = (uint)delta_x;
  uVar1 = (uint)delta_y;
  uVar3 = uVar3 & 0xffff;
  if (uVar3 == 0) {
    uVar8 = 1;
  }
  else {
    if (uVar1 == uVar3) {
      iVar7 = 0x7fff;
    }
    else {
      iVar7 = -0x8000;
      if (-uVar3 != uVar1) {
        sVar2 = ordint_divmod(uVar3,uVar1 << 0xf).quot;
        iVar7 = (int)sVar2;
      }
    }
    iVar5 = 0x7fff;
    if ((uVar6 != uVar3) && (iVar5 = -0x8000, -uVar3 != uVar6)) {
      sVar2 = ordint_divmod(uVar3,uVar6 << 0xf).quot;
      iVar5 = (int)sVar2;
    }
    uVar3 = compute_angle_from_slope(iVar7,iVar5);
    uw_ord2005_rem_90 = ((int)(0x140 - ((uVar3 & 0xffff) >> 8))) % (0x100);
    uVar3 = uw_ord2005_rem_90 & 0xff;
    uVar6 = uVar3 - uVar4 & 0xff;
    if ((uVar6 < 0x20) || (0xe0 < uVar6)) {
      uVar8 = 1;
    }
    else {
      if (uVar6 < 0x80) {
        uw_ord2005_rem_91 = ((int)(uVar4 + 0x20)) % (0x100);
        uVar3 = uw_ord2005_rem_91;
      }
      else {
        uw_ord2005_rem_92 = ((int)(uVar4 + 0xe0)) % (0x100);
        uVar3 = uw_ord2005_rem_92;
      }
      uVar3 = uVar3 & 0xff;
    }
    uVar6 = DAT_0010190c->hdr.position_word & 0xfc7f | (uVar3 & 0xffe0) << 2;
    DAT_0010190c->hdr.position_word = (ushort)uVar6;
    DAT_0010190c->heading_flags =
      (DAT_0010190c->heading_flags ^ (byte)uVar3) & 0x1f ^ DAT_0010190c->heading_flags;
  }
  return uVar8;
}


// was FUN_000346a0 -- applies param_2 points of damage to object param_1 from damaging object
// param_3 (NULL if none, e.g. environmental damage).
int apply_damage_to_object(ushort *target, byte damage, ushort *attacker)
{
  short sVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  bool bVar6;
  uint attacker_id = 0;  /* was the `attacker` pointer param itself, reused as an integer id (truncating cast) */

  /* GODMODE: the player takes no damage (every damage path funnels through here). */
  if (g_debug_godmode && target == (ushort *)g_player_object) return 0;
  bVar6 = attacker == (ushort *)0x0;
  iVar5 = (((int)(short)*target & 0xfU) + (short)((*target & 0x30) >> 4) * 0x10) * 0x30;
  *(byte *)((char *)target + 0x11) = *(char *)((char *)target + 0x11) + damage;
  if (!bVar6) {
    if ((*attacker & 0x1c0) == 0x40) {
      sVar1 = encode_object_slot_index(attacker);
      uVar2 = (uint)sVar1;
      if (0xff < (int)uVar2) {
        uVar2 = 0;
      }
      attacker_id = uVar2 & 0xff;
    }
    else {
      attacker_id = (byte)attacker[9];
    }
  }
  uVar2 = attacker_id & 0xff;
  if (uVar2 != 0) {
    *(char *)(target + 9) = (char)attacker_id;
  }
  if ((uVar2 == 1) && ((target[5] & 0x80) == 0)) {
    DAT_000853d0 = g_monster_type_props[(iVar5) / 0x30].race_flags;
    DAT_0010194c = encode_object_slot_index(target);
    DAT_0010192c = *(byte *)((char *)target + 0x17) >> 2;
    DAT_00101930 = (byte)(target[0xb] >> 4) & 0x3f;
    DAT_00101934 = (byte)target[1] >> 3 & 0xf;
    DAT_00101940 = *(undefined4 *)(DAT_00086df8 + 0xce);
  }
  if (damage < (byte)target[4]) {
    *(byte *)(target + 4) = (byte)target[4] - damage;
    if (target == g_player_object) {
      refresh_experience_display();
    }
  }
  else {
    *(undefined1 *)(target + 4) = 0;
    iVar3 = handle_monster_death(target);
    if (iVar3 != 0) {
      if (uVar2 == 1) {
        award_monster_kill_experience(target);
      }
      return 1;
    }
  }
  if (uVar2 == 1) {
    sVar1 = ordint_divmod((byte) g_monster_type_props[(iVar5) / 0x30].max_hp + 1,
                          (uint)(byte)target[4] << 6).quot;
    uVar4 = 5;
  }
  else {
    if (target != g_player_object) {
      return 0;
    }
    if (uVar2 == 0) {
      return 0;
    }
    sVar1 = ordint_divmod(*(byte *)(DAT_0023be74 + 4) + 1,
                          (uint) g_player_object->npc_hp << 6).quot;
    uVar4 = 7;
  }
  if (0xf < sVar1) {
    uVar4 = 6;
  }
  set_pending_music_track(uVar4);
  DAT_00101944 = read_realtime_clock_units();
  return 0;
}


// was FUN_000382cc -- resolves elemental/damage-type resistance for object param_1 against a
// damage-type bitmask (param_3), returning the effective damage to apply: 0 if fully resisted,
// otherwise param_2 (the original damage amount) unchanged.
int resolve_damage_type_resistance(ushort *object, int damage, uint damage_type_mask)
{
  int uw_ord2005_rem_102 = 0;
  undefined4 uVar1;
  int extraout_r1;
  uint uVar2;

  uVar2 = (uint)(byte) g_object_type_props[(((uw_object_hdr_t *)object)->object_id)].scale_flags;
  if ((uVar2 & damage_type_mask & 0xff) != 0) {
    if ((damage_type_mask & 3) != 0) {
      uVar1 = ce_rand();
      uw_ord2005_rem_102 = ((int)(uVar1)) % (3);
      if (uw_ord2005_rem_102 < (int)(uVar2 & 3)) {
        return 0;
      }
      damage_type_mask = damage_type_mask & 0xfc;
    }
    if ((uVar2 & damage_type_mask & 0xff) != 0) {
      return 0;
    }
  }
  return damage;
}


// was FUN_00038374 -- the general-purpose "apply damage/effect to any object" entry point (param_1:
// target; param_2: the damaging object/weapon, or 0; param_3/param_4: tile x/y, when relevant;
// param_5: raw damage amount; param_6: damage-type bitmask).
/* damaging object, forwarded to apply_damage_to_object */
int apply_typed_damage_to_object(ushort *target, ushort *attacker, int tile_x, short tile_y, byte damage, byte damage_type)
{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;

  uVar1 = resolve_damage_type_resistance(target,damage,damage_type);
  if ((*target & 0x1c0) == 0x40) {
    uVar2 = apply_damage_to_object(target,uVar1,attacker);
  }
  else {
    iVar3 = apply_object_durability_damage(target,attacker,uVar1 & 0xff,tile_x,tile_y);
    if (iVar3 == 0) {
      uVar2 = 0;
    }
    else {
      uVar2 = apply_object_destruction_effect(target,attacker,damage_type,tile_x,tile_y);
    }
  }
  return uVar2;
}


// was FUN_00038418 -- applies durability damage (param_3, already shifted right by the object
// type's hardness/resistance divisor from DAT_00202c97) to a non-NPC object param_1, returning
// whether it broke (durability reached 0).
/* damaging actor, forwarded to the destruction trigger */
bool apply_object_durability_damage(ushort *object, ushort *attacker, short damage, int tile_x, short tile_y)
{
  uw_object_hdr_t *object_hdr = (uw_object_hdr_t *)object;
  int iVar1;
  ushort uVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  
  if (((object_hdr->doordir == 0) && (uVar6 = ((byte)g_object_type_props[(object_hdr->object_id)].quality_flags & 0xc) >> 2, (short)uVar6 != 3)) &&
      (iVar5 = (int)damage >> uVar6, 0 < (short)iVar5)) {
    iVar4 = object_ptr_in_arena(object_hdr);
    if (iVar4 == 0) {
      if ((0x13f < (object_hdr->object_id)) && ((object_hdr->object_id) < 0x148)) {
        uVar2 = object_hdr->link_word;
        if (((uVar2 & 1) != 0) && ((uVar2 & 0x3e) != 0)) {
          uVar6 = (uVar2 >> 1 & 0x1f) - iVar5;
          if ((int)(uVar6 * 0x10000) >> 0x10 < 1) {
            uVar6 = 0;
          }
          object_hdr->owner = (uVar2 & 1) | ((uVar6 & 0x1f) << 1);
          return false;
        }
      }
      uVar2 = object_hdr->chain_word;
      iVar5 = ((int)(short)uVar2 & 0x3fU) - iVar5;
      iVar1 = iVar5 * 0x10000 >> 0x10;
      if (iVar1 < 1) {
        iVar5 = 0;
      }
      object_hdr->quality = iVar5 & 0x3f;
    }
    else {
      iVar5 = (uint)((uw_mobile_object_t *)object)->hit_points - iVar5;
      iVar1 = iVar5 * 0x10000 >> 0x10;
      if (iVar1 < 1) {
        iVar5 = 0;
      }
      ((uw_mobile_object_t *)object)->hit_points = (byte)(char)iVar5;
    }
    bVar3 = iVar1 < 1;
    if (((bVar3) && (iVar4 == 0)) && (-1 < (short)tile_x)) {
      trigger_object_trap_or_use_action(attacker,object,4,tile_x,tile_y);
    }
  }
  else {
    bVar3 = false;
  }
  return bVar3;
}


// was FUN_00045f9c -- validates whether an object's class/subtype (param_1, masked to 0x1ff) is a
// valid match for equipment slot param_2: slot 9/10 or the handedness-derived "weapon hand" slot
// (DAT_00086df8+100 bit 0, +7) always pass through to a subtype range check...
int is_valid_equipment_slot_item(ushort object_word, short slot)
{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = (int)slot;
  if (((((iVar1 < 0) || (4 < iVar1)) && (iVar1 != 10)) && (iVar1 != 9)) &&
     (((iVar1 != (*(byte *)(DAT_00086df8 + 100) & 1) + 7 || ((object_word & 0xffc0) != 0)) ||
      (((object_word & 0x30) < 0x20 || (((object_word & 0xf) < 0xb || (0xf < (object_word & 0xf))))))))) {
    uVar2 = 0;
  }
  else {
    uVar2 = 1;
  }
  return uVar2;
}



// was FUN_00046030 -- attempts to damage the player's own equipped item in slot param_1 (combat's
// "extra stagger/sound reaction" trigger, src/combat.c), e.g. a shield or piece of armor absorbing
// a hit...
int damage_equipped_item_in_slot(int slot, byte damage, byte damage_type, short reaction_mode, int report_flag)
{
  char *wptr_30396;
  byte bVar1;
  char cVar2;
  undefined2 uVar3;
  short sVar4;
  undefined2 *puVar5;
  int iVar6;
  undefined4 uVar7;
  char *pcVar8;
  char *pcVar9;
  char *pDropObj;  /* was `uVar7` (undefined4) for this use -- truncated spawn_new_object's real object pointer; uVar7
   itself is only reused as a 0/1 message-select flag right after, so this needed a separate typed
   local */
  char acStackY_85aec [547480];
  char acStack_4d [53];
  
  puVar5 = (undefined2 *)get_equipped_item_at_slot(slot);
  if (puVar5 == (undefined2 *)0x0) {
    return 0xfffffffe;
  }
  if (reaction_mode != 2) {
    if (reaction_mode == 0) {
      if ((((uw_object_hdr_t *)puVar5)->object_id & 0x1f0) != 0) {
        return 0xfffffffe;
      }
    }
    else {
      iVar6 = is_valid_equipment_slot_item(((uw_object_hdr_t *)puVar5)->object_id,
                                           slot);
      if (iVar6 == 0) {
        return 0xfffffffe;
      }
    }
  }
  bVar1 = ((uw_object_hdr_t *)puVar5)->chain_word_low;
  iVar6 = apply_typed_damage_to_object(puVar5,0,0xffffffff,-1,damage,damage_type);
  if (iVar6 == 0) {
    if ((((uw_object_hdr_t *)puVar5)->quality) == (bVar1 & 0x3f)) {
      return 0xffffffff;
    }
    pcVar9 = s_damaged__00085aa8;
    uVar7 = 0;
  }
  else {
    if (report_flag != 0) {
      sVar4 = rand_below(2);
      pDropObj = (char *)spawn_new_object(sVar4 + 0xd5,0);
      drop_object_near_target(g_player_object,pDropObj,6,0);
    }
    decrement_object_count(puVar5);
    discard_misplaced_object(0,puVar5,1);
    refresh_player_equipment_effects();
    pcVar9 = s_destroyed__00085ab4;
    uVar7 = 1;
  }
  pcVar8 = DAT_00085aa0;
    wptr_30396 = acStackY_85aec;
  do {
    cVar2 = *pcVar8;
    *wptr_30396 = cVar2; wptr_30396 = wptr_30396 + 1;
    pcVar8 = pcVar8 + 1;
  } while (cVar2 != '\0');
  if (puVar5 == g_player_object) {
    uVar3 = ((uw_object_hdr_t *)puVar5)->type_flags;
    ((uw_object_hdr_t *)puVar5)->type_flags_low = 0xf;
    ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)((ushort)uVar3 >> 8) & 0xfe;
  }
  iVar6 = ce_strlen(acStack_4d + 1);
  build_object_display_name(acStack_4d + iVar6 + 1,puVar5,0,0);
  iVar6 = ce_strlen(acStack_4d + 1);
  if (acStack_4d[iVar6] == 's') {
    pcVar8 = s_were_00085a98;
  }
  else {
    pcVar8 = DAT_00085a90;
  }
  ce_strcat(acStack_4d + 1,pcVar8);
  ce_strcat(acStack_4d + 1,pcVar9);
  message_scroll_print_wrapped(acStack_4d + 1);
  redraw_backpack_slot_widget(slot);
  return uVar7;
}



// was FUN_0005448c -- default collision outcome for object param_2 when nothing else handles it
// (param_1, the object that struck it, is unused): takes a position snapshot, and if the snapshot's
// velocity-like field is nonzero...
int apply_object_collision_scatter(ushort *striker, ushort *object)
{
  undefined2 uVar1;
  short sVar2;
  char *iVar3;
  int iVar4;
  /* The original ARM stack frame holds one contiguous 0x2c-byte snapshot. */
  undefined1 auStack_48 [0x2c];
  short local_30;

  if (object != 0) {
    DAT_0010144c = (ushort)DAT_002046d8;
    DAT_00101454 = (ushort)DAT_002046dc;
    build_object_placement_snapshot(object,auStack_48);
    local_30 = *(short *)(auStack_48 + 0x18);
    iVar3 = DAT_00204874;
    if (local_30 != 0) {
      sVar2 = ordint_divmod((int)local_30,(int)*(short *)(DAT_00204874 + 0x18) << 6).quot;
      uVar1 = *(undefined2 *)(iVar3 + 0x21);
      if (0x80 < sVar2) {
        sVar2 = 0x80;
      }
      auStack_48[0x21] = (undefined1)uVar1;
      auStack_48[0x22] = (undefined1)((ushort)uVar1 >> 8);
      *(undefined2 *)(auStack_48 + 0x14) = 0xeb;
      DAT_0010144c = (ushort)DAT_002046d8;
      iVar4 = (int)*(short *)(iVar3 + 10) * (int)sVar2;
      DAT_00101454 = (ushort)DAT_002046dc;
      if (iVar4 < 0) {
        iVar4 = iVar4 + 0x3f;
      }
      *(undefined2 *)(auStack_48 + 10) = (undefined2)(iVar4 >> 6);
      sync_object_tile_position(object,auStack_48);
    }
  }
  return 4;
}



// WARNING: Removing unreachable block (ram,0x00054668)

// was FUN_000545ac -- looks up a base damage/flag pair for object param_1's subtype
// (DAT_002027d0/DAT_002027d2, 3 bytes/entry), and when a specific condition holds (param_1[0x12]==1
// and that subtype's flag byte == -0x40) adjusts the damage via a skill check (+0x27) before...
/* ARM 0x545c0 preserves the target in r8 and 0x54698 passes that address
   in r2 to apply_direct_object_hit. undefined4 truncated it on 64-bit hosts. */
void apply_trap_type_damage_effect(void *trap_object_ptr, ushort *target)
{
  byte *trap_object = (byte *)trap_object_ptr;
  byte bVar1;
  undefined1 uVar2;
  short sVar4;
  int iVar5;
  uint uVar6;
  ushort uVar7;
  undefined1 uVar3;
  
  iVar5 = (*trap_object & 0xf) * 3;
  bVar1 = g_ranged_type_props[(iVar5) / 3].damage;
  uVar7 = (ushort)bVar1;
  if ((trap_object[0x12] == 1) && (g_ranged_type_props[(iVar5) / 3].ammo_damage_selector == 0xc0)) {  /* was `== -0x40` on an unsigned byte: never true */
    uVar6 = (*(byte *)(DAT_00086df8 + 0x27) + 0x18) * 8;
    sVar4 = roll_skill_check((uint)*(byte *)(DAT_00086df8 + 0x27),10);
    if (sVar4 == -1) {
      uVar6 = uVar6 - 0x80;
    }
    else if (sVar4 == 2) {
      uVar6 = uVar6 + 0xc0;
    }
    uVar7 = (ushort)((uVar6 & 0xffff) * (uint)bVar1 >> 8);
  }
  uVar2 = DAT_002046d8;
  uVar3 = DAT_002046dc;
  if (DAT_002046e8 == 0) {
    uVar2 = DAT_002046e0;
    uVar3 = DAT_002046e4;
  }
  apply_direct_object_hit(trap_object[0x12],trap_object,target,uVar2,uVar3,uVar7,
                          -g_ranged_type_props[(iVar5) / 3].ammo_damage_selector);
}



// was FUN_000546c4 -- resolves a collision between moving object param_2 (a slot index) and
// collision-candidate param_1 (an index into DAT_00202c38, or -1 for "the player directly"): marks
// the candidate as processed, resolves both the candidate and param_2's own records...
int resolve_collision_candidate_interaction(short candidate_index, int mover_slot)
{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  ushort *puVar4;
  ushort *puVar5;
  undefined4 uVar7;
  ushort uVar8;
  byte bVar9;
  int iVar10;
  ushort *puVar11;
  uint uVar6;
  
  puVar11 = (ushort *)&DAT_00202c38;
  iVar1 = (int)candidate_index;
  if (iVar1 != -1) {
    iVar10 = iVar1 * 6;
    uVar2 = *(ushort *)(&DAT_00202c3a + iVar10);
    if ((uVar2 & 0x20) != 0) {
      return 2;
    }
    (&DAT_00202c3a)[iVar10] = (byte)uVar2 | 0x20;
    (&DAT_00202c3b)[iVar10] = (char)(uVar2 >> 8);
  }
  DAT_002046e0 = (byte)(DAT_002049c8 >> 3);
  DAT_002046e4 = (byte)(DAT_002049ca >> 3);
  puVar4 = (ushort *)get_object_record_by_slot_index(mover_slot);
  /* HACK: get_object_record_by_slot_index legitimately returns NULL for an out-of-range/ empty slot
     (its own established contract, guarded at many other call sites this session) and this
     immediately dereferenced it unconditionally. */
  if (puVar4 == (ushort *)0x0) {
    return 2;
  }
  uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
  if (iVar1 == -1) {
    puVar11 = (ushort *)0x0;
  }
  if (iVar1 == -1) {
    uVar8 = 0xffff;
    bVar9 = 1;
    puVar5 = puVar11;
  }
  else {
    puVar5 = (ushort *)get_object_record_by_slot_index(puVar11[iVar1 * 3 + 1] >> 6);
    /* HACK: same unguarded get_object_record_by_slot_index NULL-return case as the
       puVar4 fix just above -- puVar5 is dereferenced (`*puVar5`)
       a few lines down with no check. Same early-out. */
    if (puVar5 == (ushort *)0x0) {
      return 2;
    }
    uVar6 = (uint)DAT_002046e0 + (int)(short)puVar11[iVar1 * 3 + 2] & 0x3f;
    uVar3 = (ushort)uVar6;
    DAT_002046d8 = (byte)uVar6;
    iVar10 = (int)(short)puVar11[iVar1 * 3 + 2] -
             ((int)((uVar6 - (int)(short)(ushort)DAT_002046e0) * 0x10000) >> 0x10);
    if (iVar10 < 0) {
      iVar10 = iVar10 + 0x3f;
    }
    DAT_002046dc = (char)(iVar10 >> 6) + DAT_002046e4 & 0x3f;
    uVar8 = *puVar5 & 0x1ff;
    bVar9 = g_object_type_props[(short)uVar8].quality_flags & 1;
    if ((0xff < (short)mover_slot) || (0x3fff < (puVar11[iVar1 * 3 + 1] & 0xffc0))) goto LAB_000548b8;
    if (((uVar2 & 0x1c0) != 0x40) && ((((uw_mobile_object_t *)puVar4)->animation_flags & 0x80) != 0)) {
      return 2;
    }
    ((uw_mobile_object_t *)puVar4)->animation_flags = ((uw_mobile_object_t *)puVar4)->animation_flags | 0x80;
  }
  uVar3 = (ushort)DAT_002046d8;
LAB_000548b8:
  if ((short)uVar8 != -1) {
    if ((g_object_type_props[(short)uVar8].quality_flags & 2) == 0) {
      if ((uVar8 & 0xffc0) == 0x180) {
        uVar7 = resolve_skill_gated_unlock_or_use(puVar4,0,puVar5,0);
        return uVar7;
      }
    }
    else {
      DAT_002020a4 = (ushort)DAT_002046dc;
      DAT_002046e8 = 0;
      DAT_002020a0 = uVar3;
      use_object_on_target(puVar4,puVar5,0);
    }
  }
  if (bVar9 == 0) {
    return 2;
  }
  if ((g_object_type_props[(short)(uVar2 & 0x1ff)].quality_flags & 2) != 0) {
    DAT_002020a0 = (ushort)DAT_002046e0;
    DAT_002020a4 = (ushort)DAT_002046e4;
    DAT_002046e8 = 1;
    use_object_on_target(puVar5,puVar4,0);
    if ((short)DAT_002020a0 < 0) {
      return 0x10;
    }
  }
  uVar7 = apply_object_collision_scatter(puVar4,puVar5);
  return uVar7;
}

"""Name NPC walk-target fields while retaining full captures and signed target reads."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'npc_walk_toward_tile'
ORIGINAL = r"""void npc_walk_toward_tile(uint goal, char goal_target, byte attitude)
{
  int uw_ord2005_rem_17 = 0; int uw_ord2005_rem_18 = 0; int uw_ord2005_rem_19 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  undefined1 uVar4;
  short sVar5;
  int iVar6;
  char *npc_bytes;
  undefined4 uVar7;
  int extraout_r1;
  int extraout_r1_00;
  uint extraout_r1_01;
  uint uVar8;
  byte bVar9;
  byte local_40 [4];
  int local_3c;
  int local_38;
@BLANK@
  local_3c = 0;
  local_38 = 0;
  /* Dropped arguments: the real call (0x2e5c0) is made with r0/r1/r2 still holding this function's
     own three incoming parameters (the prologue spills all three, `stmdb sp!,{r0,r1,r2}`), so the
     destination y and the third value were whatever this port's ABI left in those registers... */
  npc_set_walk_target(goal,goal_target,attitude);
  if (((DAT_0010190c->heading_flags & 0x20) != 0) &&
      ((DAT_0010190c->animation_flags & 0x80) != 0)) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
  }
  iVar1 = ((int)(char)goal - (int)DAT_00101918) * 0x1000000 >> 0x18;
  iVar6 = ((int)goal_target - (int)DAT_001013f8) * 0x1000000;
  iVar2 = (int)(iVar6) >> 0x18;
  if ((iVar1 == 0) && ((char)((uint)iVar6 >> 0x18) == '\0')) {
    if ((DAT_0010190c->animation_flags & 0x80) != 0) {
      DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
    }
    if ((DAT_0010190c->npc_goal) != 1) {
      if (DAT_00101734 != 0) {
        DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags | 0x40;
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
        return;
      }
      goto LAB_0002e6fc;
    }
    npc_set_goal(8,0);
  }
  if (DAT_00101734 == 0) {
LAB_0002e6fc:
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;
    if ((DAT_0010190c->animation_flags & 0x80) != 0) {
      uVar3 = DAT_0010190c->tile_word;
      iVar6 = (uVar3 & 0xf) * 0x1c;
      if ((uVar3 >> 10 == (ushort)(byte)(&DAT_00101568)[(int)iVar6]) &&
         ((uVar3 & 0x3f0) >> 4 == (uint)(byte)(&DAT_00101569)[(int)iVar6])) {
        /* Was a dropped argument -- called with no args (`FUN_0002dd4c();` before this rename). */
        advance_cached_path_step(&DAT_00101568 + (int)iVar6);
      }
    }
    return;
  }
  if (((DAT_00101924 != 0) && (DAT_00101430 == 0)) &&
     (bVar9 = DAT_0010190c->heading_flags, (bVar9 & 0x40) == 0)) {
    if (DAT_001013fc != 0) {
      if (DAT_00101560 == 0) {
        uVar3 = *DAT_00101904;
        if (((uVar3 & 0x1c0) == 0x40) && ((uVar3 & 0x1ff) != 0x7f)) {
          if (((DAT_0010190c->npc_goal) == 5) &&
              ((*(byte *)((char *)DAT_00101904 + 0xb) & 0xf) == 5)) {
            goal = goal & 0xff;
            goto LAB_0002e998;
          }
          goal = goal & 0xff;
        }
        if ((((uVar3 & 0x1f0) == 0x140) && (7 < (uVar3 & 0xf))) &&
           ((DAT_00101404->movement_flags & 0x80) != 0)) {
          local_38 = 1;
          DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 | 0x70;
          DAT_00101924 = 0;
          DAT_00101914 = 1;
          goto LAB_0002ea00;
        }
      }
      else {
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
        uVar7 = ce_rand();
        uw_ord2005_rem_17 = ((int)(uVar7)) % (4);
        if ((uw_ord2005_rem_17 != 0) && (DAT_0010190c->npc_attitude == 0)) {
          npc_arrival_interaction(DAT_00101904);
          goto LAB_0002e998;
        }
        bVar9 = DAT_0010190c->heading_flags;
      }
      DAT_0010190c->heading_flags = bVar9 | 0x40;
    }
LAB_0002e998:
    if (DAT_00101924 != 0) {
      if ((DAT_0010190c->animation_flags & 0x80) != 0) {
        DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
      }
      local_3c = 1;
      DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0x7f;
    }
  }
LAB_0002ea00:
  if ((DAT_0010190c->animation_flags & 0x80) != 0) {
    iVar6 = walk_using_cached_path(&DAT_00101568 + (DAT_0010190c->npc_path_slot) * 0x1c);
    if (iVar6 != 0) goto LAB_0002ed50;
LAB_0002ebfc:
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
LAB_0002ed50:
    if (DAT_00101920 != 0) {
      return;
    }
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xbf;
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
    if (local_38 == 0) {
      if ((DAT_0010190c->npc_goal) == 5) {
        bVar9 = DAT_00101404->movement_speed;
      }
      else {
        bVar9 = DAT_00101404->magic_power;
      }
      bVar9 = (DAT_0010190c->motion_flags ^ bVar9) & 0x7f ^ DAT_0010190c->motion_flags;
    }
    else {
      bVar9 = DAT_0010190c->motion_flags & 0x80;
    }
    DAT_0010190c->motion_flags = bVar9;
    npc_bytes = (char *)DAT_0010190c;
    uVar3 = DAT_0010190c->goal_word;
    uw_ord2005_rem_18 = ((int)((uVar3 >> 0xc) + 1)) % (4);
    uVar8 = uVar3 & 0xfff;
    ((uw_mobile_object_t *)npc_bytes)->goal_word_low = (byte)(char)uVar8;
    DAT_0010190c->goal_word_high =
      (byte)(uVar8 >> 8) | (byte)(((uw_ord2005_rem_18 & 0xf) << 0xc) >> 8);
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
    return;
  }
  bVar9 = DAT_0010190c->heading_flags;
  if (((bVar9 & 0x20) == 0) && ((bVar9 & 0x80) != 0)) {
    uVar8 = compute_movement_heading(iVar1,iVar2);
    DAT_0010190c->full_heading = (byte)((uVar8 & 0xff) << 5);
    DAT_0010190c->hdr.heading = uVar8 & 0x7;
    DAT_0010190c->npc_heading = 0;
    if ((DAT_00101404->movement_flags & 0x80) != 0) {
      set_npc_altitude_state(goal,goal_target);
    }
    goto LAB_0002ed50;
  }
  if (((bVar9 & 0x20) == 0) && ((bVar9 & 0x40) != 0)) {
    uVar7 = ce_rand();
    uw_ord2005_rem_19 = ((int)(uVar7)) % (8);
    if (uw_ord2005_rem_19 != 0) goto LAB_0002ee74;
    bVar9 = DAT_0010190c->heading_flags & 0xbf;
  }
  else {
    if ((local_3c == 0) &&
       (sVar5 = try_direct_line_walk(DAT_00101918,DAT_001013f8,goal & 0xff,goal_target), sVar5 == 1)) {
      DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x80;
      uVar8 = compute_movement_heading(iVar1,iVar2);
      DAT_0010190c->full_heading = (byte)((uVar8 & 0xff) << 5);
      DAT_0010190c->hdr.heading = uVar8 & 0x7;
      DAT_0010190c->npc_heading = 0;
      DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
      if ((DAT_0010190c->animation_flags & 0x80) == 0) goto LAB_0002ed50;
      goto LAB_0002ebfc;
    }
    iVar6 = pop_pending_path_cache_slot(local_40);
    if (iVar6 != 0) {
      uVar4 = compute_pathfind_search_radius();
      iVar6 = creature_find_path_to_tile(DAT_00101918,DAT_001013f8,
                                         DAT_0010190c->hdr.zpos >> 3,
                                         goal,
                                         goal_target,attitude,uVar4);
      if (iVar6 != 0) {
        DAT_000853b8 = DAT_000853b8 & ~(ushort)(1 << (uint)local_40[0]);
        save_walk_path_to_cache_slot(&DAT_00101568 + (uint)local_40[0] * 0x1c);
        DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags | 0x80;
        uVar8 = DAT_0010190c->tile_word & 0xfff0;
        DAT_0010190c->tile_word_low = local_40[0] & 0xf | (byte)uVar8;
        DAT_0010190c->tile_word_high = (byte)(char)(uVar8 >> 8);
        walk_using_cached_path(&DAT_00101568 + (DAT_0010190c->npc_path_slot) * 0x1c);
        goto LAB_0002ed50;
      }
    }
    DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x40;
    bVar9 = DAT_0010190c->heading_flags & 0x7f;
  }
  DAT_0010190c->heading_flags = bVar9;
LAB_0002ee74:
  npc_idle_behavior_tick();
}""".replace('@BLANK@', '  ')
REPLACEMENTS = [('char *npc_bytes;', 'uw_mobile_object_t *npc_bytes;\n  uw_object_hdr_t *target_header;'),
 ('DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;', 'DAT_0010190c->speed = 0;'),
 ('iVar6 = (uVar3 & 0xf) * 0x1c;', 'iVar6 = DAT_0010190c->npc_path_slot * 0x1c;'),
 ('uVar3 >> 10 == (ushort)(byte)', 'DAT_0010190c->npc_xhome == (ushort)(byte)'),
 ('(uVar3 & 0x3f0) >> 4 == (uint)(byte)', 'DAT_0010190c->npc_yhome == (uint)(byte)'),
 ('uVar3 = *DAT_00101904;',
  'target_header = (uw_object_hdr_t *)DAT_00101904;\n'
  '        uVar3 = (ushort)(char)(byte)target_header->object_id;'),
 ('DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 | 0x70;', 'DAT_0010190c->pitch = 14;'),
 ('bVar9 = (DAT_0010190c->motion_flags ^ bVar9) & 0x7f ^ DAT_0010190c->motion_flags;',
  'bVar9 = (DAT_0010190c->gravity_flag << 7) | (bVar9 & 0x7f);'),
 ('bVar9 = DAT_0010190c->motion_flags & 0x80;', 'bVar9 = DAT_0010190c->gravity_flag << 7;'),
 ('DAT_0010190c->motion_flags = bVar9;', 'DAT_0010190c->speed = bVar9 & 0x7f;'),
 ('npc_bytes = (char *)DAT_0010190c;', 'npc_bytes = DAT_0010190c;'),
 ('((uw_mobile_object_t *)npc_bytes)->goal_word_low = (byte)(char)uVar8;\n'
  '    DAT_0010190c->goal_word_high =\n'
  '      (byte)(uVar8 >> 8) | (byte)(((uw_ord2005_rem_18 & 0xf) << 0xc) >> 8);',
  'npc_bytes->npc_animation_frame = uw_ord2005_rem_18 & 0xf;'),
 ('DAT_0010190c->tile_word_low = local_40[0] & 0xf | (byte)uVar8;\n'
  '        DAT_0010190c->tile_word_high = (byte)(char)(uVar8 >> 8);',
  'DAT_0010190c->npc_path_slot = local_40[0] & 0xf;')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result

def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'walk-target-fields.json').write_text(generate())

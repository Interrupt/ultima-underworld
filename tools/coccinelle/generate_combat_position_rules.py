"""Name NPC combat positioning frame, speed, pitch and heading writes."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'npc_combat_position_tick'
ORIGINAL = r"""void npc_combat_position_tick()
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
@BLANK@
  if (DAT_00101734 == 0) {
    return;
  }
  uVar1 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
  uVar6 = DAT_0010190c->hdr.position_word;
  bVar4 = *(byte *)(DAT_00101400 + 2);
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
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 ^ (byte)((int)(iVar7) << 3);
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
      iVar7_rec->goal_word_low = (char)uVar1;
      DAT_0010190c->goal_word_high =
        (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_68 & 0xf) << 0xc) >> 8);
      DAT_0010190c->motion_flags =
        ((byte)((int)(DAT_00101404->magic_power + 1) >> 1) ^ DAT_0010190c->motion_flags)
         & 0x7f ^ DAT_0010190c->motion_flags;
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
          DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
          DAT_0010190c->full_heading = (byte)((uVar1 & 0xff) << 5);
          DAT_0010190c->hdr.heading = uVar1 & 0x7;
          DAT_0010190c->npc_heading = 0;
          DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
          DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
          iVar7_rec = DAT_0010190c;
          uVar6 = DAT_0010190c->goal_word;
          uw_ord2005_rem_72 = ((int)((uVar6 >> 0xc) + 1)) % (4);
          uVar1 = uVar6 & 0xfff;
          iVar7_rec->goal_word_low = (char)uVar1;
          DAT_0010190c->goal_word_high =
            (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_72 & 0xf) << 0xc) >> 8);
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
    DAT_0010190c->heading_flags = bVar5 & 0x1f ^ bVar4;
    uVar6 = DAT_00101900;
    if (DAT_00101900 < 0x40) {
      uVar6 = (ushort) DAT_00101404->movement_speed;
    }
    bVar4 = (byte)uVar6;
    if (DAT_00101900 >= 0x40) {
      bVar4 = DAT_00101404->magic_power;
    }
    DAT_0010190c->motion_flags =
      (DAT_0010190c->motion_flags ^ bVar4) & 0x7f ^ DAT_0010190c->motion_flags;
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
    iVar7_rec = DAT_0010190c;
    uVar6 = DAT_0010190c->goal_word;
    uw_ord2005_rem_76 = ((int)((uVar6 >> 0xc) + 1)) % (4);
    uVar1 = uVar6 & 0xfff;
    iVar7_rec->goal_word_low = (char)uVar1;
    DAT_0010190c->goal_word_high =
      (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_76 & 0xf) << 0xc) >> 8);
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
  }
}""".replace("@BLANK@", "  ")
REPLACEMENTS = [('uint uVar8;', 'uint uVar8;\n  uw_object_hdr_t *target_header;'),
 ('bVar4 = *(byte *)(DAT_00101400 + 2);', 'target_header = (uw_object_hdr_t *)DAT_00101400;\n  bVar4 = target_header->position_word_low;'),
 ('iVar7_rec->goal_word_low = (char)uVar1;\n'
  '      DAT_0010190c->goal_word_high =\n'
  '        (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_68 & 0xf) << 0xc) >> 8);',
  'iVar7_rec->npc_animation_frame = uw_ord2005_rem_68 & 0xf;'),
 ('iVar7_rec->goal_word_low = (char)uVar1;\n'
  '          DAT_0010190c->goal_word_high =\n'
  '            (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_72 & 0xf) << 0xc) >> 8);',
  'iVar7_rec->npc_animation_frame = uw_ord2005_rem_72 & 0xf;'),
 ('iVar7_rec->goal_word_low = (char)uVar1;\n'
  '    DAT_0010190c->goal_word_high =\n'
  '      (byte)(uVar1 >> 8) | (byte)(((uw_ord2005_rem_76 & 0xf) << 0xc) >> 8);',
  'iVar7_rec->npc_animation_frame = uw_ord2005_rem_76 & 0xf;'),
 ('DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 ^ (byte)((int)(iVar7) << 3);',
  'DAT_0010190c->pitch = iVar7 & 0x1f;'),
 ('DAT_0010190c->motion_flags =\n'
  '        ((byte)((int)(DAT_00101404->magic_power + 1) >> 1) ^ DAT_0010190c->motion_flags)\n'
  '         & 0x7f ^ DAT_0010190c->motion_flags;',
  'DAT_0010190c->speed = ((int)(DAT_00101404->magic_power + 1) >> 1) & 0x7f;'),
 ('DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;', 'DAT_0010190c->speed = 0;'),
 ('DAT_0010190c->heading_flags = bVar5 & 0x1f ^ bVar4;',
  'DAT_0010190c->npc_heading = (bVar5 ^ bVar4) & 0x1f;'),
 ('DAT_0010190c->motion_flags =\n'
  '      (DAT_0010190c->motion_flags ^ bVar4) & 0x7f ^ DAT_0010190c->motion_flags;',
  'DAT_0010190c->speed = bVar4 & 0x7f;')]


def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result


def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'combat-position-fields.json').write_text(generate())

"""Name NPC approach frame, speed, home tiles and position writes."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'npc_combat_approach_tick'
ORIGINAL = r"""void npc_combat_approach_tick()
{
  int uw_ord2005_rem_40 = 0;
  ushort uVar1;
  char cVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  char *iVar5_rec;
  byte *pbVar6;
  uint extraout_r1;
  uint uVar7;
  int iVar8;
  int iVar9;
@BLANK@
  if (DAT_00101900 < 3) {
    if (DAT_00101734 != 0) {
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc1 | 1;
      iVar5_rec = (char *)DAT_0010190c;
      uVar1 = DAT_0010190c->goal_word;
      uw_ord2005_rem_40 = ((int)((uVar1 >> 0xc) + 1)) % (4);
      uVar7 = uVar1 & 0xfff;
      ((uw_mobile_object_t *)iVar5_rec)->goal_word_low = (byte)(char)uVar7;
      DAT_0010190c->goal_word_high = (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_40 & 0xf) << 0xc) >> 8)
        ;
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
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
    DAT_0010190c->tile_word_low = (byte)(char)uVar7;
    DAT_0010190c->tile_word_high =
      (byte)(uVar7 >> 8) | (byte)((((int)(char)((uint)(uintptr_t)iVar5 >> 0x18) & 0x3fU) << 10) >> 8);
    uVar7 = DAT_0010190c->tile_word & 0xfc0f |
            ((int)(char)((uint)iVar8 >> 0x18) & 0x3fU) << 4;
    DAT_0010190c->tile_word = (ushort)uVar7;
    uVar7 = DAT_0010190c->hdr.position_word & 0x1fff;
    DAT_0010190c->hdr.position_word_low = (byte)(char)uVar7;
    DAT_0010190c->hdr.position_word_high = (byte)(uVar7 >> 8) | 0x80;
    uVar7 = DAT_0010190c->hdr.position_word & 0xf3ff;
    DAT_0010190c->hdr.position_word_low = (byte)(char)uVar7;
    DAT_0010190c->hdr.position_word_high = (byte)(uVar7 >> 8) | 0x10;
    uVar7 = DAT_0010190c->hdr.position_word & 0xff80;
    DAT_0010190c->hdr.position_word_low = *pbVar6 >> 1 & 0x78 | (byte)uVar7;
    DAT_0010190c->hdr.position_word_high = (byte)(char)(uVar7 >> 8);
  }
}""".replace("@BLANK@", "  ")
REPLACEMENTS = [('char *iVar5_rec;', 'uw_mobile_object_t *iVar5_rec;'),
 ('iVar5_rec = (char *)DAT_0010190c;', 'iVar5_rec = DAT_0010190c;'),
 ('((uw_mobile_object_t *)iVar5_rec)->goal_word_low = (byte)(char)uVar7;\n'
  '      DAT_0010190c->goal_word_high = (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_40 & 0xf) << '
  '0xc) >> 8)\n'
  '        ;',
  'iVar5_rec->npc_animation_frame = uw_ord2005_rem_40 & 0xf;'),
 ('DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;', 'DAT_0010190c->speed = 0;'),
 ('DAT_0010190c->tile_word_low = (byte)(char)uVar7;\n'
  '    DAT_0010190c->tile_word_high =\n'
  '      (byte)(uVar7 >> 8) | (byte)((((int)(char)((uint)(uintptr_t)iVar5 >> 0x18) & 0x3fU) << 10) '
  '>> 8);',
  'DAT_0010190c->npc_xhome = (int)(char)((uint)(uintptr_t)iVar5 >> 0x18) & 0x3fU;'),
 ('DAT_0010190c->tile_word = (ushort)uVar7;', 'DAT_0010190c->npc_yhome = (uVar7 >> 4) & 0x3f;'),
 ('DAT_0010190c->hdr.position_word_low = (byte)(char)uVar7;\n'
  '    DAT_0010190c->hdr.position_word_high = (byte)(uVar7 >> 8) | 0x80;',
  'DAT_0010190c->hdr.xpos = 4;'),
 ('DAT_0010190c->hdr.position_word_low = (byte)(char)uVar7;\n'
  '    DAT_0010190c->hdr.position_word_high = (byte)(uVar7 >> 8) | 0x10;',
  'DAT_0010190c->hdr.ypos = 4;'),
 ('DAT_0010190c->hdr.position_word_low = *pbVar6 >> 1 & 0x78 | (byte)uVar7;\n'
  '    DAT_0010190c->hdr.position_word_high = (byte)(char)(uVar7 >> 8);',
  'DAT_0010190c->hdr.zpos = *pbVar6 >> 1 & 0x78;')]


def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result


def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'approach-fields.json').write_text(generate())

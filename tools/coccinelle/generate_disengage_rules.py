"""Name disengagement target, frame and speed updates; keep distance snapshots."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'npc_combat_disengage_tick'
ORIGINAL = r"""void npc_combat_disengage_tick()
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
@BLANK@
  if (DAT_00101734 != 0) {
    uVar7 = DAT_0010190c->goal_word & 0xf01f;
    DAT_0010190c->goal_word_low = (byte)uVar7 | 0x10;
    DAT_0010190c->goal_word_high = (byte)(char)(uVar7 >> 8);
    refresh_npc_target_delta();
    uVar6 = DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448;
    cVar3 = detect_npc_wander_proximity(auStack_1b,&uStack_1c);
    if ((cVar3 == '\x01') || (399 < uVar6)) {
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
      uVar4 = ce_rand();
      uw_ord2005_rem_77 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_77 != 0) {
        uVar6 = DAT_0010190c->goal_word;
        uw_ord2005_rem_78 = ((int)((uVar6 >> 0xc) + 1)) % (4);
        uVar7 = uVar6 & 0xfff;
        iVar2->goal_word_low = (char)uVar7;
        DAT_0010190c->goal_word_high =
          (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_78 & 0xf) << 0xc) >> 8);
      }
    }
    else {
      uVar7 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
      uVar4 = ce_rand();
      uw_ord2005_rem_79 = ((int)(uVar4)) % (2);
      iVar2 = DAT_0010190c;
      if (uw_ord2005_rem_79 != 0) {
        uVar1 = DAT_0010190c->goal_word;
        uw_ord2005_rem_80 = ((int)((uVar1 >> 0xc) + 1)) % (4);
        uVar5 = uVar1 & 0xfff;
        iVar2->goal_word_low = (char)uVar5;
        DAT_0010190c->goal_word_high =
          (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_80 & 0xf) << 0xc) >> 8);
      }
      DAT_0010190c->full_heading = (byte)((uVar7 & 0xff) << 5);
      DAT_0010190c->hdr.heading = uVar7 & 0x7;
      DAT_0010190c->npc_heading = 0;
      if (uVar6 < 0x90) {
        uw_ord2005_rem_81 = ((int)((((uw_mobile_object_t *)g_player_object)->hdr.heading - (uVar7 & 0xff)) + 8)) % (8);
        if (('\x02' < uw_ord2005_rem_81) && (uw_ord2005_rem_81 < '\x06')) {
          DAT_0023bf0c = 0;
          reset_cursor_confine_rect();
          attempt_talk_interaction(DAT_0010190c);
        }
      }
    }
  }
}""".replace("@BLANK@", "  ")
REPLACEMENTS = [('DAT_0010190c->goal_word_low = (byte)uVar7 | 0x10;\n'
  '    DAT_0010190c->goal_word_high = (byte)(char)(uVar7 >> 8);',
  'DAT_0010190c->npc_gtarg = 1;'),
 ('iVar2->goal_word_low = (char)uVar7;\n'
  '        DAT_0010190c->goal_word_high =\n'
  '          (byte)(uVar7 >> 8) | (byte)(((uw_ord2005_rem_78 & 0xf) << 0xc) >> 8);',
  'iVar2->npc_animation_frame = uw_ord2005_rem_78 & 0xf;'),
 ('iVar2->goal_word_low = (char)uVar5;\n'
  '        DAT_0010190c->goal_word_high =\n'
  '          (byte)(uVar5 >> 8) | (byte)(((uw_ord2005_rem_80 & 0xf) << 0xc) >> 8);',
  'iVar2->npc_animation_frame = uw_ord2005_rem_80 & 0xf;'),
 ('((uw_mobile_object_t *)g_player_object)->hdr.heading', 'g_player_object->hdr.heading')]


def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    before = 'DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;'
    assert result.count(before) == 2
    return result.replace(before, 'DAT_0010190c->speed = 0;')


def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'disengage-fields.json').write_text(generate())

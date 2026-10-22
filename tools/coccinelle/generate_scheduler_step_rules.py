"""Name scheduler frame, height and door flags while preserving captured link bits."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'scheduler_step_entry'
ORIGINAL = r"""void scheduler_step_entry(int entry_slot, int elapsed)
{
  int iVar1;
  byte bVar2;
  ushort uVar3;
  ushort *puVar4;
  uint uVar5;
  undefined4 uVar6;
  short extraout_r1;
  ushort uVar7;
  ushort uVar8;
@BLANK@
  puVar4 = (ushort *)resolve_object_link(&DAT_00250778 + (short)entry_slot * 6);
  /* HACK: same unguarded-NULL class as scheduler_finish_entry's identical fix --
     see its own comment. A stale queue entry resolves to NULL here too. */
  if (puVar4 == (ushort *)0x0) {
    return;
  }
  if ((((uw_object_hdr_t *)puVar4)->object_id & 0x1f0) == 0x1c0) {
    iVar1 = (((uw_object_hdr_t *)puVar4)->object_id & 0xf) * 4;
    uVar3 = 1;
    for (uVar7 = (ushort)g_animation_type_props[(iVar1) / 4].flags; uVar7 != 0; uVar7 = uVar7 & uVar8) {
      uVar8 = uVar3 & uVar7;
      if (uVar8 == 1) {
        uVar8 = ((uw_object_hdr_t *)puVar4)->link_word;
        if ((int)(uVar8 & 0x3f) <
            (int)((int)(char) g_animation_type_props[(iVar1) / 4].start_frame + (uint)(byte) g_animation_type_props[(iVar1) / 4].frame_count + -1)) {
          uVar8 = (uVar8 + 1 ^ uVar8) & 0x3f ^ uVar8;
        }
        else {
          uVar8 = ((short)(char) g_animation_type_props[(iVar1) / 4].start_frame ^ uVar8) & 0x3f ^ uVar8;
        }
LAB_00081254:
        ((uw_object_hdr_t *)puVar4)->link_word = (ushort)uVar8;
      }
      else {
        if (uVar8 == 2) {
          uVar6 = ce_rand();
          uVar8 = ((uw_object_hdr_t *)puVar4)->link_word;
          /* Dropped-remainder bug, same class as scheduler_finish_entry's own fix above in this
             file -- gets it by name off ordint_divmod's own divmod_result now (which guards the
             zero-divisor case itself, so no separate guard needed here). */
          extraout_r1 = (short)ordint_divmod(g_animation_type_props[(iVar1) / 4].frame_count,
                                             uVar6).rem;
          uVar8 = ((char) g_animation_type_props[(iVar1) / 4].start_frame + extraout_r1 ^ uVar8) & 0x3f ^ uVar8;
          goto LAB_00081254;
        }
        if (uVar8 == 4) {
          int _swing_dirbit_in = ((uw_object_hdr_t *)puVar4)->enchanted != 0;
          int _swing_openbits_in = ((uw_object_hdr_t *)puVar4)->flags_res;
          if (((uw_object_hdr_t *)puVar4)->enchanted != 0) {
            elapsed = (short)elapsed * -0x10000 >> 0x10;
          }
          if ((((uw_object_hdr_t *)puVar4)->owner & 0x7) == 6) {
            uVar8 = ((uw_object_hdr_t *)puVar4)->position_word;
            bVar2 = (byte)uVar8;
            ((uw_object_hdr_t *)puVar4)->position_word_low = ((char)elapsed * '\x06' + bVar2 ^ bVar2) & 0x7f ^ bVar2;
            ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)(char)(uVar8 >> 8);
          }
          uVar5 = (uint)((uw_object_hdr_t *)puVar4)->type_flags;
          uVar5 = ((uVar5 & 0xe00) + (uVar5 & 0xf000) + elapsed * 0x200 ^ uVar5) & 0x1e00 ^ uVar5;
          ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar4)->type_flags;
          ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(char)(uVar5 >> 8);
          if ((uVar5 & 0x1000) != 0) {
            scheduler_advance_effect(entry_slot,elapsed);
          }
        }
      }
      uVar8 = ~uVar3;
      uVar3 = uVar3 << 1;
    }
  }
}""".replace('@BLANK@', '  ')
REPLACEMENTS = [('(int)(uVar8 & 0x3f)', '(int)((uw_object_hdr_t *)puVar4)->owner'),
 ('resolve_object_link(&DAT_00250778 + (short)entry_slot * 6)',
  'resolve_object_link((uw_link_word_t *)(&DAT_00250778 + (short)entry_slot * 6))'),
 ('ushort *puVar4;', 'uw_object_hdr_t *puVar4;'),
 ('puVar4 = (ushort *)resolve_object_link', 'puVar4 = resolve_object_link'),
 ('puVar4 == (ushort *)0x0', 'puVar4 == NULL'),
 ('((uw_object_hdr_t *)puVar4)->link_word = (ushort)uVar8;',
  '((uw_object_hdr_t *)puVar4)->owner = uVar8 & 0x3f;\n'
  '        ((uw_object_hdr_t *)puVar4)->link = (uVar8 >> 6) & 0x3ff;'),
 ("((uw_object_hdr_t *)puVar4)->position_word_low = ((char)elapsed * '\\x06' + bVar2 ^ bVar2) & 0x7f ^ "
  'bVar2;\n'
  '            ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)(char)(uVar8 >> 8);',
  "((uw_object_hdr_t *)puVar4)->zpos = ((char)elapsed * '\\x06' + bVar2) & 0x7f;"),
 ('((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar4)->type_flags;\n'
  '          ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(char)(uVar5 >> 8);',
  '((uw_object_hdr_t *)puVar4)->flags_res = (uVar5 >> 9) & 7;\n'
  '          ((uw_object_hdr_t *)puVar4)->enchanted = (uVar5 >> 12) & 1;')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result.replace('((uw_object_hdr_t *)puVar4)->', 'puVar4->')

def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'scheduler-step-fields.json').write_text(generate())

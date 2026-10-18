"""Name scheduler finalization fields while retaining captured words and callbacks."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'scheduler_finish_entry'
ORIGINAL = r"""void scheduler_finish_entry(int entry_slot)
{
  ushort uVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  ushort uVar8;
  int iVar9;
  uint uVar10;
  bool bVar11;
@BLANK@
  iVar9 = (short)entry_slot * 6;
  puVar4 = (ushort *)resolve_object_link(&DAT_00250778 + iVar9);
  /* HACK: resolve_object_link legitimately returns NULL (every other resolve_object_link call site
     in this file guards for it -- e.g. scheduler_add_entry's own identical fix a little above this
     function). */
  if (puVar4 == (ushort *)0x0) {
    return;
  }
  uVar5 = ((uw_object_hdr_t *)puVar4)->object_id & 0xf;
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
    uVar10 = (byte)((byte)((uw_object_hdr_t *)puVar4)->link_word >> 4) & 3;
    uVar5 = ((uw_object_hdr_t *)puVar4)->owner & 0xf;
    uVar8 = ((uw_object_hdr_t *)puVar4)->zpos;
    if (((uw_object_hdr_t *)puVar4)->enchanted == 0) {
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
                           (uint)(((uw_object_hdr_t *)puVar4)->xpos) + (short)DAT_0010144c * 8,
                           (((uw_object_hdr_t *)puVar4)->ypos) + (short)DAT_00101454 * 8,
                           uVar8,1,8);
      if (iVar7 == 0) {
        uVar1 = ((uw_object_hdr_t *)puVar4)->link_word;
        bVar3 = (byte)uVar1;
        ((uw_object_hdr_t *)puVar4)->link_word_low = (bVar3 ^ (byte)uVar5) & 0x3f ^ bVar3;
        ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)(uVar1 >> 8);
        adjust_door_close_animation_delay(puVar4);
        return;
      }
      play_positional_sound_effect(0xc,
                                   (uint)(((uw_object_hdr_t *)puVar4)->xpos) + (short)DAT_0010144c * 8,
                                   (((uw_object_hdr_t *)puVar4)->ypos) + (short)DAT_00101454 * 8,
                                   0);
    }
    uVar2 = ((uw_object_hdr_t *)puVar4)->position_word;
    bVar3 = (byte)uVar2;
    ((uw_object_hdr_t *)puVar4)->position_word_low = (bVar3 ^ (byte)uVar8) & 0x7f ^ bVar3;
    ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)(uVar2 >> 8);
    uVar10 = ((uw_object_hdr_t *)puVar4)->type_flags & 0xff4f | (uVar10 | 0x14) << 4;
    uVar5 = (uVar10 ^ uVar5) & 0xf ^ uVar10;
    ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)uVar5;
    ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(uVar10 >> 8);
    uVar10 = ((uw_object_hdr_t *)puVar4)->link << 6;
    ((uw_object_hdr_t *)puVar4)->link_word = (ushort)uVar10;
    uVar8 = (ushort)uVar5;
    if ((uVar5 & 0x1000) == 0) {
      uVar8 = ((uVar8 & 0xe00) - 0xe01 ^ uVar8) & 0x1e00 ^ uVar8;
    }
    else {
      uVar8 = uVar8 & 0xefff;
    }
    ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)uVar8;
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
}""".replace('@BLANK@', '  ')
REPLACEMENTS = [('ushort *puVar4;', 'uw_object_hdr_t *puVar4;'),
 ('puVar4 = (ushort *)resolve_object_link', 'puVar4 = resolve_object_link'),
 ('puVar4 == (ushort *)0x0', 'puVar4 == NULL'),
 ('uVar10 = (byte)((byte)((uw_object_hdr_t *)puVar4)->link_word >> 4) & 3;',
  'uVar10 = (((uw_object_hdr_t *)puVar4)->owner >> 4) & 3;'),
 ('((uw_object_hdr_t *)puVar4)->link_word_low = (bVar3 ^ (byte)uVar5) & 0x3f ^ bVar3;\n'
  '        ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)(uVar1 >> 8);',
  '((uw_object_hdr_t *)puVar4)->owner = uVar5 & 0x3f;'),
 ('adjust_door_close_animation_delay(puVar4);',
  'adjust_door_close_animation_delay((ushort *)puVar4);'),
 ('((uw_object_hdr_t *)puVar4)->position_word_low = (bVar3 ^ (byte)uVar8) & 0x7f ^ bVar3;\n'
  '    ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)(uVar2 >> 8);',
  '((uw_object_hdr_t *)puVar4)->zpos = uVar8 & 0x7f;'),
 ('((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)uVar5;\n'
  '    ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(uVar10 >> 8);',
  '((uw_object_hdr_t *)puVar4)->object_id = uVar5 & 0x1ff;'),
 ('((uw_object_hdr_t *)puVar4)->link_word = (ushort)uVar10;',
  '((uw_object_hdr_t *)puVar4)->owner = 0;'),
 ('((uw_object_hdr_t *)puVar4)->type_flags = (ushort)uVar8;',
  '((uw_object_hdr_t *)puVar4)->flags_res = (uVar8 >> 9) & 7;\n'
  '    ((uw_object_hdr_t *)puVar4)->enchanted = (uVar8 >> 12) & 1;')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result.replace('((uw_object_hdr_t *)puVar4)->', 'puVar4->')

def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'scheduler-finish-fields.json').write_text(generate())

"""Name light decay stores while retaining the captured flags and counters."""
from pathlib import Path
from difflib import SequenceMatcher
HERE = Path(__file__).resolve().parent
FUNCTION = 'decay_equipped_light_sources'
ORIGINAL = r"""int decay_equipped_light_sources(short elapsed, byte tick_phase)
{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  byte bVar4;
  short sVar5;
  ushort *puVar6;
  int extraout_r1;
  uint uVar7;
  ushort uVar8;
  int iVar9;
  undefined4 uVar10;
@BLANK@
  uVar10 = 0;
  iVar9 = 0;
  do {
    puVar6 = (ushort *)get_equipped_item_at_slot((int)(char)(&g_light_source_slots)[iVar9]);
    if (puVar6 != (ushort *)0x0) {
      uVar2 = ((uw_object_hdr_t *)puVar6)->type_flags;
      if (((((uVar2 & 0x1f0) == 0x90) && (uVar7 = (uint)(short)(uVar2 & 0xf), 3 < uVar7)) &&
          (uVar7 < 8)) && (cVar1 = g_light_type_props[uVar7].decay_interval, cVar1 != '\0')) {
        /* ARM 0x540d4 uses the tick phase (tick_phase) for the remainder.
           Before the second division, 0x540ec reloads elapsed ticks
           (elapsed) into r1. Sleep needs that distinct bulk dividend. */
        divmod_result dmr4414 = ordint_divmod(cVar1,tick_phase);
        extraout_r1 = dmr4414.rem;
        uVar8 = (ushort)(extraout_r1 == 0);
        if (1 < elapsed) {
          sVar5 = ordint_divmod(cVar1,elapsed).quot;
          uVar8 = (ushort)(extraout_r1 == 0) + sVar5;
        }
        if ((short)uVar8 != 0) {
          uVar3 = ((uw_object_hdr_t *)puVar6)->chain_word;
          if ((int)(short)uVar8 < (int)(uVar3 & 0x3f)) {
            bVar4 = (byte)uVar3;
            ((uw_object_hdr_t *)puVar6)->chain_word_low = (bVar4 - (char)uVar8 ^ bVar4) & 0x3f ^ bVar4;
            ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)(uVar3 >> 8);
          }
          else {
            uVar7 = uVar3 & 0xffc0;
            ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)uVar7;
            bVar4 = (byte)uVar2;
            ((uw_object_hdr_t *)puVar6)->type_flags_low = (bVar4 - 4 ^ bVar4) & 0xf ^ bVar4;
            ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)(uVar2 >> 8);
            redraw_backpack_slot_widget((int)(char)(&g_light_source_slots)[iVar9]);
            uVar10 = 1;
            set_ambient_bias_without_light(0);
          }
        }
      }
    }
    iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
  } while (iVar9 < 4);
  return uVar10;
}""".replace("@BLANK@", "  ")


def converted():
    result = ORIGINAL
    replacements = [
        ('ushort *puVar6;', 'uw_object_hdr_t *puVar6;'),
        ('puVar6 = (ushort *)get_equipped_item_at_slot', 'puVar6 = get_equipped_item_at_slot'),
        ('puVar6 != (ushort *)0x0', 'puVar6 != (uw_object_hdr_t *)0x0'),
        ("""            ((uw_object_hdr_t *)puVar6)->chain_word_low = (bVar4 - (char)uVar8 ^ bVar4) & 0x3f ^ bVar4;
            ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)(uVar3 >> 8);""",
         '            puVar6->quality = (bVar4 - (char)uVar8) & 0x3f;'),
        ('((uw_object_hdr_t *)puVar6)->chain_word = (ushort)uVar7;', 'puVar6->quality = 0;'),
        ("""            ((uw_object_hdr_t *)puVar6)->type_flags_low = (bVar4 - 4 ^ bVar4) & 0xf ^ bVar4;
            ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)(uVar2 >> 8);""",
         '            puVar6->type_flags = (ushort)(uVar2 - 4);'),
    ]
    for before, after in replacements:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result.replace('((uw_object_hdr_t *)puVar6)->', 'puVar6->')


def generate():
    old, new = ORIGINAL.splitlines(), converted().splitlines()
    patch = []
    for tag, i, j, k, l in SequenceMatcher(a=old, b=new, autojunk=False).get_opcodes():
        if tag == 'equal':
            patch.extend(' '+line if line.strip() else '' for line in old[i:j])
        else:
            patch.extend('- '+line if line else '-' for line in old[i:j])
            patch.extend('+ '+line if line else '+' for line in new[k:l])
    return ('@light_decay_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
        'typedef byte, ushort, uint, undefined4, divmod_result, uw_object_hdr_t;\n@@\n'
        + '\n'.join(patch) + '\n')


if __name__ == '__main__':
    (HERE/'light-decay-fields.cocci').write_text(generate())

"""Name durability header stores; retain arithmetic and callback captures."""
from pathlib import Path
from difflib import SequenceMatcher
HERE = Path(__file__).resolve().parent
FUNCTION = 'apply_object_durability_damage'
ORIGINAL = """bool apply_object_durability_damage(ushort *object, ushort *attacker, short damage, int tile_x, short tile_y)
{
  int iVar1;
  ushort uVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
@BLANK@
  if (((((uw_object_hdr_t *)object)->doordir == 0) &&
       (uVar6 = ((byte) g_object_type_props[(((uw_object_hdr_t *)object)->object_id)].quality_flags & 0xc) >> 2, (short)uVar6 != 3)) &&
      (iVar5 = (int)damage >> uVar6, 0 < (short)iVar5)) {
    iVar4 = object_is_mobile(object);
    if (iVar4 == 0) {
      if ((0x13f < (((uw_object_hdr_t *)object)->object_id)) && ((((uw_object_hdr_t *)object)->object_id) < 0x148)) {
        uVar2 = ((uw_object_hdr_t *)object)->link_word;
        if (((uVar2 & 1) != 0) && ((uVar2 & 0x3e) != 0)) {
          uVar6 = (uVar2 >> 1 & 0x1f) - iVar5;
          if ((int)(uVar6 * 0x10000) >> 0x10 < 1) {
            uVar6 = 0;
          }
          ((uw_object_hdr_t *)object)->link_word_low = (byte)(uVar2 & 0xffc1) | (byte)((uVar6 & 0x1f) << 1);
          ((uw_object_hdr_t *)object)->link_word_high = (byte)(char)((uVar2 & 0xffc1) >> 8);
          return false;
        }
      }
      uVar2 = ((uw_object_hdr_t *)object)->chain_word;
      iVar5 = ((int)(short)uVar2 & 0x3fU) - iVar5;
      iVar1 = iVar5 * 0x10000 >> 0x10;
      if (iVar1 < 1) {
        iVar5 = 0;
      }
      ((uw_object_hdr_t *)object)->chain_word_low = ((byte)uVar2 ^ (byte)iVar5) & 0x3f ^ (byte)uVar2;
      ((uw_object_hdr_t *)object)->chain_word_high = (byte)(char)(uVar2 >> 8);
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
}""".replace("@BLANK@", "  ")


def converted():
    result = ORIGINAL.replace('  int iVar1;',
        '  uw_object_hdr_t *object_hdr = (uw_object_hdr_t *)object;\n  int iVar1;', 1)
    replacements = [
        ("""          ((uw_object_hdr_t *)object)->link_word_low = (byte)(uVar2 & 0xffc1) | (byte)((uVar6 & 0x1f) << 1);
          ((uw_object_hdr_t *)object)->link_word_high = (byte)(char)((uVar2 & 0xffc1) >> 8);""",
         '          object_hdr->owner = (uVar2 & 1) | ((uVar6 & 0x1f) << 1);'),
        ("""      ((uw_object_hdr_t *)object)->chain_word_low = ((byte)uVar2 ^ (byte)iVar5) & 0x3f ^ (byte)uVar2;
      ((uw_object_hdr_t *)object)->chain_word_high = (byte)(char)(uVar2 >> 8);""",
         '      object_hdr->quality = iVar5 & 0x3f;'),
    ]
    for before, after in replacements:
        assert result.count(before) == 1
        result = result.replace(before, after)
    result = result.replace('((uw_object_hdr_t *)object)->', 'object_hdr->').replace(
        'object_is_mobile(object)', 'object_is_mobile(object_hdr)')
    return result.replace('if (((object_hdr->doordir == 0) &&\n       (uVar6 = ((byte) g_object_type_props[(object_hdr->object_id)].quality_flags & 0xc) >> 2, (short)uVar6 != 3)) &&',
        'if (((object_hdr->doordir == 0) && (uVar6 = ((byte)g_object_type_props[(object_hdr->object_id)].quality_flags & 0xc) >> 2, (short)uVar6 != 3)) &&')


def generate():
    old, new = ORIGINAL.splitlines(), converted().splitlines()
    patch = []
    for tag, i, j, k, l in SequenceMatcher(a=old, b=new, autojunk=False).get_opcodes():
        if tag == 'equal':
            patch.extend(' '+line if line.strip() else '' for line in old[i:j])
        else:
            patch.extend('- '+line if line else '-' for line in old[i:j])
            patch.extend('+ '+line if line else '+' for line in new[k:l])
    return ('@durability_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
        'typedef bool, byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t;\n@@\n'
        + '\n'.join(patch) + '\n')


if __name__ == '__main__':
    (HERE/'durability-fields.cocci').write_text(generate())

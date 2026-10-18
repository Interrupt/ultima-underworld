"""Name BABL object header getters/setters while retaining word captures."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
FUNCTION = 'babl_builtin_x_obj_stuff'
ORIGINAL = r"""void babl_builtin_x_obj_stuff(char *args)
{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  short *psVar4;
  ushort *puVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  short *psVar9;
  ushort *puVar10;

  ushort *puVar11_rec;
  uint uVar12;
@BLANK@
  psVar4 = (short *)babl_var_word_addr((int)*(short *)(args + -0xe));
  puVar5 = (ushort *)babl_var_word_addr((int)*(short *)(args + -0xc));
  psVar6 = (short *)babl_var_word_addr((int)*(short *)(args + -10));
  psVar7 = (short *)babl_var_word_addr((int)*(short *)(args + -8));
  psVar8 = (short *)babl_var_word_addr((int)*(short *)(args + -6));
  psVar9 = (short *)babl_var_word_addr((int)*(short *)(args + -4));
  puVar10 = (ushort *)babl_var_word_addr((int)*(short *)(args + -2));
  puVar11_rec = (ushort *)get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -0x12)));  /* r0 passthrough */
  sVar3 = babl_read_var_word((int)*(short *)(args + -0x10));
  if (sVar3 == 0) {
    if (((*psVar4 != -1) && ((((uw_object_hdr_t *)puVar11_rec)->object_id & 0x1c0) != 0x140)) &&
        ((g_object_type_props[(((uw_object_hdr_t *)puVar11_rec)->object_id)].class_flags & 3) != 2)) {
      *psVar4 = (short)(((uw_object_hdr_t *)puVar11_rec)->heading);
    }
    if (*puVar5 != 0xffff) {
      *puVar5 = ((uw_object_hdr_t *)puVar11_rec)->owner;
    }
    if (*psVar6 != -1) {
      *psVar6 = (short)((((uw_object_hdr_t *)puVar11_rec)->type_flags_high & 0x1e) >> 1);
    }
    if (*psVar7 != -1) {
      *psVar7 = (short)(((((uw_object_hdr_t *)puVar11_rec)->link & 0x1ff) << 6) >> 6);
    }
    if (*psVar8 != -1) {
      *psVar8 = ((short)(char)((uw_object_hdr_t *)puVar11_rec)->type_flags_high & 4U) << 8;
    }
    if (*psVar9 != -1) {
      *psVar9 = ((short)(char)((uw_object_hdr_t *)puVar11_rec)->type_flags_high & 2U) << 8;
    }
    if (*puVar10 != 0xffff) {
      *puVar10 = ((uw_object_hdr_t *)puVar11_rec)->quality;
    }
  }
  else {
    if ((((int)*psVar4 != 0xffffffff) && ((((uw_object_hdr_t *)puVar11_rec)->object_id & 0x1c0) != 0x140)) &&
        ((g_object_type_props[(((uw_object_hdr_t *)puVar11_rec)->object_id)].class_flags & 3) != 2)) {
      uVar12 = ((uw_object_hdr_t *)puVar11_rec)->position_word & 0xfc7f | ((int)*psVar4 & 7U) << 7;
      ((uw_object_hdr_t *)puVar11_rec)->position_word = (ushort)uVar12;
    }
    if (*puVar5 != 0xffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->link_word;
      bVar2 = (byte)uVar1;
      ((uw_object_hdr_t *)puVar11_rec)->link_word_low = (bVar2 ^ (byte)*puVar5) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)puVar11_rec)->link_word_high = (byte)(char)(uVar1 >> 8);
    }
    sVar3 = *psVar6;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->type_flags;
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_low = (byte)(char)(uVar1 & 0xe1ff);
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_high =
          (byte)((uVar1 & 0xe1ff) >> 8) | (byte)((((int)sVar3 & 0xfU) << 9) >> 8);
    }
    uVar12 = (uint)*psVar7;
    if (uVar12 != 0xffffffff) {
      ((uw_object_hdr_t *)puVar11_rec)->link_word_low = ((uw_object_hdr_t *)puVar11_rec)->owner | (byte)(uVar12 << 6);
      ((uw_object_hdr_t *)puVar11_rec)->link_word_high = (byte)(char)((uVar12 & 0x3ffffff | 0xfe00) >> 2);
    }
    sVar3 = *psVar8;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->type_flags;
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_low = (byte)(char)(uVar1 & 0xfbff);
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_high =
          (byte)((uVar1 & 0xfbff) >> 8) | (byte)((((int)sVar3 & 1U) << 10) >> 8);
    }
    sVar3 = *psVar9;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->type_flags;
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_low = (byte)(char)(uVar1 & 0xfdff);
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_high =
          (byte)((uVar1 & 0xfdff) >> 8) | (byte)((((int)sVar3 & 1U) << 9) >> 8);
    }
    if (*puVar10 != 0xffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->chain_word;
      bVar2 = (byte)uVar1;
      ((uw_object_hdr_t *)puVar11_rec)->chain_word_low = (bVar2 ^ (byte)*puVar10) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)puVar11_rec)->chain_word_high = (byte)(char)(uVar1 >> 8);
    }
  }
}""".replace("@BLANK@", "  ")


def converted():
    result = ORIGINAL
    a = '((uw_object_hdr_t *)puVar11_rec)->'
    replacements = [
        ('ushort *puVar11_rec;', 'uw_object_hdr_t *puVar11_rec;'),
        ('puVar11_rec = (ushort *)get_object_record_by_slot_index', 'puVar11_rec = get_object_record_by_slot_index'),
        ('(short)(('+a+'type_flags_high & 0x1e) >> 1)', '(short)('+a+'flags_res | ('+a+'enchanted << 3))'),
        ('(short)((('+a+'link & 0x1ff) << 6) >> 6)', '(short)('+a+'link & 0x1ff)'),
        ('((short)(char)'+a+'type_flags_high & 4U) << 8', '('+a+'flags_res & 2) << 9'),
        ('((short)(char)'+a+'type_flags_high & 2U) << 8', '('+a+'flags_res & 1) << 9'),
        (a+'position_word = (ushort)uVar12;', a+'heading = (uVar12 >> 7) & 7;'),
        (a+'link_word_low = (bVar2 ^ (byte)*puVar5) & 0x3f ^ bVar2;\n      '+a+'link_word_high = (byte)(char)(uVar1 >> 8);',
         a+'owner = *puVar5 & 0x3f;'),
        (a+'type_flags_low = (byte)(char)(uVar1 & 0xe1ff);\n      '+a+'type_flags_high =\n          (byte)((uVar1 & 0xe1ff) >> 8) | (byte)((((int)sVar3 & 0xfU) << 9) >> 8);',
         a+'flags_res = sVar3 & 7;\n      '+a+'enchanted = (sVar3 >> 3) & 1;'),
        (a+'link_word_low = '+a+'owner | (byte)(uVar12 << 6);\n      '+a+'link_word_high = (byte)(char)((uVar12 & 0x3ffffff | 0xfe00) >> 2);',
         a+'link = (uVar12 & 0x1ff) | 0x200;'),
        (a+'type_flags_low = (byte)(char)(uVar1 & 0xfbff);\n      '+a+'type_flags_high =\n          (byte)((uVar1 & 0xfbff) >> 8) | (byte)((((int)sVar3 & 1U) << 10) >> 8);',
         a+'flags_res = ((uVar1 >> 9) & 5) | ((sVar3 & 1) << 1);'),
        (a+'type_flags_low = (byte)(char)(uVar1 & 0xfdff);\n      '+a+'type_flags_high =\n          (byte)((uVar1 & 0xfdff) >> 8) | (byte)((((int)sVar3 & 1U) << 9) >> 8);',
         a+'flags_res = ((uVar1 >> 9) & 6) | (sVar3 & 1);'),
        (a+'chain_word_low = (bVar2 ^ (byte)*puVar10) & 0x3f ^ bVar2;\n      '+a+'chain_word_high = (byte)(char)(uVar1 >> 8);',
         a+'quality = *puVar10 & 0x3f;'),
    ]
    for before, after in replacements:
        count = result.count(before)
        assert count == 1, before
        result = result.replace(before, after)
    return result.replace(a, 'puVar11_rec->')


def generate():
    import json
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'babl-stuff-fields.json').write_text(generate())

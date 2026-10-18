"""Name drop-height tile and header position writes; preserve scratch read order."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'check_object_drop_height'
ORIGINAL = r"""int check_object_drop_height(ushort *object, ushort *reference)
{
  byte bVar1;
  ushort uVar2;
  undefined2 uVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  /* Was three separate C locals (`ushort local_38[6]; ushort local_2c; ushort local_2a;`), but
     collision_height_envelope/collision_build_ height_field write through DAT_00202c6c-relative
     offset arithmetic expecting ONE contiguous struct... */
  unsigned char local_backing[64];
#define local_38 ((ushort *)local_backing)
#define local_2c (*(ushort *)(local_backing + 0xc))
#define local_2a (*(ushort *)(local_backing + 0xe))

  DAT_00202c6c = local_backing;
  uVar2 = ((uw_object_hdr_t *)object)->type_flags;
  uVar3 = encode_object_slot_index(object);
  /* ARM 0x4b2d0/0x4b310: slot at byte 10, radius at byte 8.
     DAT_00202c6c is a byte pointer; Ghidra's word indices need scaling. */
  *(byte *)(DAT_00202c6c + 10) = (byte)uVar3;
  *(byte *)((char *)DAT_00202c6c + 0xb) = (byte)((ushort)uVar3 >> 8);
  iVar5 = (short)(uVar2 & 0x1ff) * 0xd;
  *(byte *)(DAT_00202c6c + 8) = g_object_type_props[iVar5 / 0xd].collision_radius;
  *(undefined *)((char *)DAT_00202c6c + 9) = g_object_type_props[iVar5 / 0xd].height;
  iVar5 = ((((uw_mobile_object_t *)object)->tile_x << 3)) + (uint)(((uw_object_hdr_t *)object)->xpos);
  *(byte *)DAT_00202c6c = (byte)iVar5;
  *(byte *)((char *)DAT_00202c6c + 1) = (byte)((uint)iVar5 >> 8);
  /* Was `DAT_00202c6c + 1` for Y's low byte -- disassembly-confirmed (0x4b288 @ 0x4b3b8: `strb
     r3,[r1,#0x2]`) the real write target is offset+2, not +1. */
  iVar5 = (((uw_object_hdr_t *)object)->ypos) + ((((uw_mobile_object_t *)object)->tile_y << 3));
  *(byte *)((char *)DAT_00202c6c + 2) = (byte)iVar5;
  *(byte *)((char *)DAT_00202c6c + 3) = (byte)((uint)iVar5 >> 8);
  /* Both pointer args below were `DAT_00202c6c`/`DAT_00202c6c + 1` -- the Y output must be `+2` to
     match the real Y storage (offset+2/+3, see the fix just above); `+1` is X's own high byte.
     Disassembly- confirmed (0x4b288 @ 0x4b458's `bl 0x69f2c` args). */
  project_position_by_heading((((uw_mobile_object_t *)object)->fine_heading) + ((((uw_object_hdr_t *)object)->heading << 7) >> 2),
                              (g_object_type_props[(((uw_object_hdr_t *)object)->object_id)].collision_radius) +
                              (g_object_type_props[(((uw_object_hdr_t *)reference)->object_id)].collision_radius) + '\x04',
                              DAT_00202c6c,
                              DAT_00202c6c + 2);
  /* Was `DAT_00202c6c + 2` -- disassembly-confirmed (0x4b288 @ 0x4b474: `strb r3,[r0,#0x4]`) the
     real target is offset+4/+5 (the same "Z" field this function's own later collision calls read
     via `*(short *)(DAT_00202c6c + 4)`), not offset+2... */
  *(byte *)((char *)DAT_00202c6c + 4) = ((uw_object_hdr_t *)object)->zpos;
  *(byte *)((char *)DAT_00202c6c + 5) = 0;
  collision_height_envelope(0,1);
  collision_build_height_field(0);
  if (((local_2a | local_2c) & 0x300) == 0) {
    if ((byte)DAT_00202c6c[20] != 0) {
      sort_collision_candidates();
      if (*(byte *)((char *)DAT_00202c6c + 0x15) != 0) goto LAB_0004b4d4;
    }
    uVar2 = ((uw_mobile_object_t *)object)->tile_position;
    uVar6 = uVar2 & 0x3ff;
    /* ARM 0x4b4e4..0x4b5d0 reads full X/Y words at bytes 0/2;
       byte reads discarded X's high bits and used X's high byte as Y. */
    uVar7 = ((int)(short)(*(ushort *)DAT_00202c6c & 0x1f8) >> 3) << 10;
    ((uw_mobile_object_t *)object)->tile_position_low = (byte)(char)uVar6;
    ((uw_mobile_object_t *)object)->tile_position_high = (byte)(uVar6 >> 8) | (byte)(uVar7 >> 8);
    uVar7 = uVar2 & 0xf | uVar7 | ((int)(short)(*(ushort *)(DAT_00202c6c + 2) & 0x1f8) >> 3) << 4;
    ((uw_mobile_object_t *)object)->tile_position = (ushort)uVar7;
    uVar7 = (uint)((uw_object_hdr_t *)object)->position_word;
    uVar6 = uVar7 & 0x1fff;
    bVar1 = (byte)((((byte)*DAT_00202c6c & 7) << 0xd) >> 8);
    ((uw_object_hdr_t *)object)->position_word_low = (byte)(char)uVar6;
    ((uw_object_hdr_t *)object)->position_word_high = (byte)(uVar6 >> 8) | bVar1;
    uVar2 = *(ushort *)(DAT_00202c6c + 2);
    uVar7 = uVar7 & 0x3ff;
    ((uw_object_hdr_t *)object)->position_word_low = (byte)(char)uVar7;
    uVar4 = 1;
    ((uw_object_hdr_t *)object)->position_word_high =
        (byte)(uVar7 >> 8) | bVar1 | (byte)((((byte)uVar2 & 7) << 10) >> 8);
  }
  else {
LAB_0004b4d4:
    uVar4 = 0;
  }
#undef local_38
#undef local_2c
#undef local_2a
  return uVar4;
}""".replace("@BLANK@", "  ")
REPLACEMENTS = [('uint uVar7;',
  'uint uVar7;\n'
  '  uw_projectile_object_t *projectile = (uw_projectile_object_t *)object;\n'
  '  uw_object_hdr_t *reference_header = (uw_object_hdr_t *)reference;'),
 ('encode_object_slot_index(object)', 'encode_object_slot_index(&projectile->hdr)'),
 ('((uw_mobile_object_t *)object)->tile_position_low = (byte)(char)uVar6;\n'
  '    ((uw_mobile_object_t *)object)->tile_position_high = (byte)(uVar6 >> 8) | (byte)(uVar7 >> '
  '8);',
  '((uw_mobile_object_t *)object)->tile_x = (uVar7 >> 10) & 0x3f;'),
 ('((uw_mobile_object_t *)object)->tile_position = (ushort)uVar7;',
  '((uw_mobile_object_t *)object)->tile_y = (uVar7 >> 4) & 0x3f;'),
 ('((uw_object_hdr_t *)object)->position_word_low = (byte)(char)uVar6;\n'
  '    ((uw_object_hdr_t *)object)->position_word_high = (byte)(uVar6 >> 8) | bVar1;',
  '((uw_object_hdr_t *)object)->xpos = bVar1 >> 5;'),
 ('((uw_object_hdr_t *)object)->position_word_low = (byte)(char)uVar7;\n'
  '    uVar4 = 1;\n'
  '    ((uw_object_hdr_t *)object)->position_word_high =\n'
  '        (byte)(uVar7 >> 8) | bVar1 | (byte)((((byte)uVar2 & 7) << 10) >> 8);',
  'uVar4 = 1;\n    ((uw_object_hdr_t *)object)->ypos = uVar2 & 7;')]


def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    result = result.replace('((uw_mobile_object_t *)object)->', 'projectile->')
    result = result.replace('((uw_object_hdr_t *)object)->', 'projectile->hdr.')
    return result.replace('((uw_object_hdr_t *)reference)->', 'reference_header->')


def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'drop-height-fields.json').write_text(generate())

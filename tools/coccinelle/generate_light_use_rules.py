"""Name light-toggle header fields; keep quantity rules and callback ordering."""
from pathlib import Path
import json
import re
HERE = Path(__file__).resolve().parent
FUNCTION = 'use_light_source'
ORIGINAL = r"""void use_light_source(ushort *object, int turn_on)
{
  byte bVar1;
  byte bVar2;
  int iVar3;
  ushort uVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *puVar7;
  int iVar8;
  int extraout_r3;
  int iVar9;
  ushort uVar10;
  
  if (((*object & 0x8000) == 0) || ((object[3] & 0x8000) != 0)) {
    uVar10 = 1;
  }
  else {
    uVar10 = object[3] >> 6;
  }
  if (turn_on == 0) {
    uVar5 = 0x7b;
  }
  else {
    if ((object[2] & 0x3f) != 0) {
      iVar6 = find_or_assign_object_widget(object);
      iVar8 = 0;
      do {
        if (((int)(short)iVar6 == (int)(char)(&g_light_source_slots)[iVar8]) && (uVar10 == 1)) break;
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      } while (iVar8 < 4);
      if ((short)iVar8 == 4) {
        uVar4 = *object & 0x1ff;
        if ((((uVar4 == 0x91) || (uVar4 == 0x92)) || (uVar4 == 0x90)) || (uVar4 == 0x93)) {
          iVar8 = 5;
          iVar6 = 0;
          do {
            puVar7 = (ushort *)get_equipped_item_at_slot(iVar8);
            iVar9 = extraout_r3;
            if (puVar7 == (ushort *)0x0) {
              iVar9 = iVar6 << 0x10;
            }
            iVar3 = iVar8;
          } while ((((puVar7 == (ushort *)0x0 && iVar9 >> 0x10 == 0) ||
                    (iVar3 = iVar6, puVar7 != object)) || (iVar6 = iVar8, uVar10 != 1)) &&
                  (iVar6 = iVar3, iVar8 = iVar8 + 1, iVar8 * 0x10000 >> 0x10 < 9));
          if ((short)iVar6 == 0) {
            uVar5 = 0xf6;
            goto LAB_0007ab1c;
          }
          decrement_object_count(object);
          place_object_in_backpack_slot(object,iVar6);
          redraw_container_icon_slot();
        }
      }
      uVar10 = *object;
      bVar1 = (byte)(uVar10 >> 8);
      bVar2 = (byte)uVar10;
      if ((uVar10 & 0xf) < 4) {
        *(byte *)object = (bVar2 + 4 ^ bVar2) & 0xf ^ bVar2;
        *(byte *)((char *)object + 1) = bVar1;
        /* HACK: pass the lit light's real brightness (see set_ambient_bias_with_light). */
        g_scratch_object_ptr = (uw_object_hdr_t *)object;
        set_ambient_bias_with_light(((uw_light_type_props_t *)get_scanned_object_class_effect_ptr())->brightness);
      }
      else {
        *(byte *)object = (bVar2 - 4 ^ bVar2) & 0xf ^ bVar2;
        *(byte *)((char *)object + 1) = bVar1;
        set_ambient_bias_without_light(0);
      }
      refresh_player_equipment_effects();
      redraw_backpack_slot_widget(iVar6);
      return;
    }
    uVar5 = 0x7c;
  }
LAB_0007ab1c:
  print_scroll_message_by_id(uVar5);
}"""
REPLACEMENTS = [('  byte bVar1;\n  byte bVar2;', '  uw_object_hdr_t *header = (uw_object_hdr_t *)object;'),
 ('((*object & 0x8000) == 0) || ((object[3] & 0x8000) != 0)',
  '(header->is_quant == 0) || (header->link >= 512)'),
 ('uVar10 = object[3] >> 6;', 'uVar10 = header->link;'),
 ('(object[2] & 0x3f) != 0', 'header->quality != 0'),
 ('uVar4 = *object & 0x1ff;', 'uVar4 = header->object_id;'),
 ('uVar10 = *object;\n      bVar1 = (byte)(uVar10 >> 8);\n      bVar2 = (byte)uVar10;',
  'uVar10 = header->object_id;'),
 ('*(byte *)object = (bVar2 + 4 ^ bVar2) & 0xf ^ bVar2;\n'
  '        *(byte *)((char *)object + 1) = bVar1;',
  'header->object_id = uVar10 + 4;'),
 ('*(byte *)object = (bVar2 - 4 ^ bVar2) & 0xf ^ bVar2;\n'
  '        *(byte *)((char *)object + 1) = bVar1;',
  'header->object_id = uVar10 - 4;')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result

def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'

COMMENTS = re.compile(r'/\*[\s\S]*?\*/|//[^\n]*')

def generate_cocci():
    old = COMMENTS.sub('', ORIGINAL).splitlines()
    new = COMMENTS.sub('', converted()).splitlines()
    patch = ['- ' + line if line.strip() else '-' for line in old]
    patch += ['+ ' + line if line.strip() else '+' for line in new]
    return ('@light_use_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
            'typedef byte, ushort, uint, undefined4, uw_object_hdr_t, uw_light_type_props_t;\n@@\n'
            + '\n'.join(patch).rstrip() + '\n')

if __name__ == '__main__':
    (HERE/'light-use-fields.json').write_text(generate())
    (HERE/'light-use-fields.cocci').write_text(generate_cocci())

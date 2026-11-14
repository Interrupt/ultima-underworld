"""Name scripted trap-pair initialization while retaining every scalar snapshot.

Both allocations are stationary objects with the eight-byte common header.
The complete initializer must match, including all captured words and calls.
Any added callback, changed capture, or escaping temporary prevents conversion.
"""
from pathlib import Path
import re
HERE = Path(__file__).resolve().parent
FUNCTION = 'create_scripted_trap_pair_at_tile'

ORIGINAL = """int create_scripted_trap_pair_at_tile(int tile_x, int tile_y, uint code)
{
  int iVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  ushort *puVar5;
  byte *pbVar6;
  uint uVar7;
  undefined4 uVar8;
  byte bVar9;
  uint uVar10;
  uint uVar11;
  
  puVar4 = (ushort *)alloc_object_slot(0);
  if (puVar4 != (ushort *)0x0) {
    puVar5 = (ushort *)alloc_object_slot(0);
    if (puVar5 != (ushort *)0x0) {
      pbVar6 = (byte *)tilemap_lookup(tile_x,tile_y);
      uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
      uVar7 = uVar2 & 0xffa0 | 0x61a0;
      ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)uVar7;
      uVar7 = ((uw_object_hdr_t *)puVar4)->position_word & 0xff80;
      bVar9 = *pbVar6 >> 1 & 0x78;
      ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)uVar7 | bVar9;
      ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)(char)(uVar7 >> 8);
      ((uw_object_hdr_t *)puVar4)->position_word_low = bVar9;
      ((uw_object_hdr_t *)puVar4)->position_word_high = 0x6c;
      uVar7 = uVar2 & 0xf3a0 | 0x61a0;
      ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar7;
      ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(uVar7 >> 8) | 0x90;
      ((uw_object_hdr_t *)puVar4)->chain_word_low = 0;
      ((uw_object_hdr_t *)puVar4)->chain_word_high = 0;
      uVar7 = encode_object_slot_index(puVar5);
      iVar1 = (uVar7 & 0x3ff) << 6;
      bVar3 = ((uw_object_hdr_t *)puVar4)->owner | (byte)iVar1;
      uVar2 = ((uw_object_hdr_t *)puVar4)->chain_word;
      bVar9 = (byte)uVar2;
      ((uw_object_hdr_t *)puVar4)->chain_word_low = (bVar9 ^ (byte)tile_x) & 0x3f ^ bVar9;
      ((uw_object_hdr_t *)puVar4)->chain_word_high = (byte)(char)(uVar2 >> 8);
      ((uw_object_hdr_t *)puVar4)->link_word_low = (bVar3 ^ (byte)tile_y) & 0x3f ^ bVar3;
      ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)(char)((uint)iVar1 >> 8);
      object_list_insert_head(pbVar6 + 2,puVar4);
      uVar7 = ((uw_object_hdr_t *)puVar5)->type_flags & 0xff8f | 0x180;
      uVar11 = (uVar7 ^ code) & 0xf ^ uVar7;
      ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar11;
      ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)(uVar7 >> 8) | 0x60;
      bVar9 = *pbVar6 >> 1 & 0x78;
      uVar7 = (uint)((uw_object_hdr_t *)puVar5)->position_word;
      uVar10 = uVar7 & 0xff80;
      ((uw_object_hdr_t *)puVar5)->position_word_low = bVar9 | (byte)uVar10;
      ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)(char)(uVar10 >> 8);
      uVar7 = uVar7 & 0x380;
      ((uw_object_hdr_t *)puVar5)->position_word_low = bVar9 | (byte)uVar7;
      ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)(uVar7 >> 8) | 0x6c;
      ((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner;
      ((uw_object_hdr_t *)puVar5)->link_word_high = 0;
      ((uw_object_hdr_t *)puVar5)->chain_word_low = 0x3f;
      ((uw_object_hdr_t *)puVar5)->chain_word_high = 0;
      uVar11 = uVar11 & 0xe3ff;
      ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar11;
      ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)(uVar11 >> 8) | 0xe2;
      object_list_insert_head(pbVar6 + 2,puVar5);
      uVar8 = encode_object_slot_index(puVar4);
      return uVar8;
    }
    free_object_slot(puVar4);
  }
  return 0;
}"""


def changes():
    a = '((uw_object_hdr_t *)puVar4)->'
    b = '((uw_object_hdr_t *)puVar5)->'
    return [
        ('first_type', f'{a}type_flags = (ushort)uVar7;',
         f'{a}object_id = 0x1a0;\n{a}doordir = 1;\n{a}invisible = 1;'),
        ('first_position', f'''{a}position_word_low = (byte)uVar7 | bVar9;
{a}position_word_high = (byte)(char)(uVar7 >> 8);
{a}position_word_low = bVar9;
{a}position_word_high = 0x6c;''',
         f'{a}zpos = bVar9;\n{a}heading = 0;\n{a}ypos = 3;\n{a}xpos = 3;'),
        ('first_flags', f'''{a}type_flags_low = (byte)(char)uVar7;
{a}type_flags_high = (byte)(uVar7 >> 8) | 0x90;''',
         f'{a}flags_res = (uVar7 >> 9) & 7;\n{a}enchanted = 1;\n{a}is_quant = 1;'),
        ('first_chain', f'{a}chain_word_low = 0;\n{a}chain_word_high = 0;',
         f'{a}quality = 0;\n{a}next = 0;'),
        ('first_quality', f'''{a}chain_word_low = (bVar9 ^ (byte)tile_x) & 0x3f ^ bVar9;
{a}chain_word_high = (byte)(char)(uVar2 >> 8);''', f'{a}quality = (byte)tile_x & 0x3f;'),
        ('first_link', f'''{a}link_word_low = (bVar3 ^ (byte)tile_y) & 0x3f ^ bVar3;
{a}link_word_high = (byte)(char)((uint)iVar1 >> 8);''',
         f'{a}owner = (byte)tile_y & 0x3f;\n{a}link = uVar7 & 0x3ff;'),
        ('second_type', f'''{b}type_flags_low = (byte)(char)uVar11;
{b}type_flags_high = (byte)(uVar7 >> 8) | 0x60;''',
         f'{b}object_id = 0x180 | (code & 0xf);\n{b}doordir = 1;\n{b}invisible = 1;'),
        ('second_position', f'''{b}position_word_low = bVar9 | (byte)uVar10;
{b}position_word_high = (byte)(char)(uVar10 >> 8);
uVar7 = uVar7 & 0x380;
{b}position_word_low = bVar9 | (byte)uVar7;
{b}position_word_high = (byte)(uVar7 >> 8) | 0x6c;''',
         f'''uVar7 = uVar7 & 0x380;
{b}zpos = bVar9;
{b}ypos = 3;
{b}xpos = 3;'''),
        ('second_link', f'{b}link_word_low = {b}owner;\n{b}link_word_high = 0;', f'{b}link = 0;'),
        ('second_chain', f'{b}chain_word_low = 0x3f;\n{b}chain_word_high = 0;',
         f'{b}quality = 0x3f;\n{b}next = 0;'),
        ('second_flags', f'''{b}type_flags_low = (byte)(char)uVar11;
{b}type_flags_high = (byte)(uVar11 >> 8) | 0xe2;''',
         f'{b}flags_res = 1;\n{b}enchanted = 0;\n{b}is_quant = 1;'),
        # Both slots are object records and pbVar6 + 2 is the tile's object-chain head word.
        ('first_slot_type', 'ushort *puVar4;', 'uw_object_hdr_t *puVar4;'),
        ('second_slot_type', 'ushort *puVar5;', 'uw_object_hdr_t *puVar5;'),
        ('first_alloc', 'puVar4 = (ushort *)alloc_object_slot(0);', 'puVar4 = alloc_object_slot(0);'),
        ('first_null', 'if (puVar4 != (ushort *)0x0) {', 'if (puVar4 != (uw_object_hdr_t *)0x0) {'),
        ('second_alloc', 'puVar5 = (ushort *)alloc_object_slot(0);', 'puVar5 = alloc_object_slot(0);'),
        ('second_null', 'if (puVar5 != (ushort *)0x0) {', 'if (puVar5 != (uw_object_hdr_t *)0x0) {'),
        ('first_insert', 'object_list_insert_head(pbVar6 + 2,puVar4);',
         'object_list_insert_head((uw_link_word_t *)(pbVar6 + 2), puVar4);'),
        ('second_insert', 'object_list_insert_head(pbVar6 + 2,puVar5);',
         'object_list_insert_head((uw_link_word_t *)(pbVar6 + 2), puVar5);'),
    ]


def generate():
    # All earlier captures and intervening operations form part of the proof.
    # Reject any edited body rather than applying a partially justified recipe.
    final = ORIGINAL
    for key,before,after in changes():
        pattern = re.compile(r'(?m)^([ \t]*)' + r'\s*'.join(re.escape(line) for line in before.splitlines()))
        final,count = pattern.subn(lambda m: m[1] + after.replace('\n','\n'+m[1]), final)
        assert count == 1, key
    return ('@trap_pair_exact disable optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
            'typedef byte, ushort, uint, uw_object_hdr_t, uw_link_word_t;\n@@\n'
            + '\n'.join('- '+line if line else '-' for line in ORIGINAL.splitlines()) + '\n'
            + '\n'.join('+ '+line if line else '+' for line in final.splitlines()) + '\n')


if __name__ == '__main__':
    (HERE / 'trap-pair-fields.cocci').write_text(generate())

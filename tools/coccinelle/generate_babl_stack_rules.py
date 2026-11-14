"""Name BABL inventory/barter stack fields and separate object/link cursor roles."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
ORIGINALS = {'babl_builtin_do_inv_create': 'int babl_builtin_do_inv_create(char *args)\n'
                               '{\n'
                               '  ushort uVar1;\n'
                               '  intptr_t *piVar2;\n'
                               '  ushort *puVar3;\n'
                               '  ushort *puVar4;\n'
                               '  undefined4 uVar5;\n'
                               '  int iVar6;\n'
                               '\n'
                               '  uVar5 = babl_read_var_word((int)*(short *)(args + -2));\n'
                               '  puVar3 = (ushort *)spawn_new_object(uVar5,0);\n'
                               '  piVar2 = (intptr_t *)&DAT_00100674;\n'
                               '  if (puVar3 == (ushort *)0x0) {\n'
                               '    uVar5 = 0;\n'
                               '  }\n'
                               '  else {\n'
                               '    uVar1 = ((uw_object_hdr_t *)puVar3)->chain_word;\n'
                               '    ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)uVar1 | 0x3f;\n'
                               '    ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)(char)(uVar1 '
                               '>> 8);\n'
                               '    puVar4 = (ushort *)(*piVar2 + 6);\n'
                               '    while (puVar4 = (ushort *)resolve_object_link(puVar4), puVar4 != '
                               '(ushort *)0x0) {\n'
                               '      if ((((((uw_object_hdr_t *)puVar3)->is_quant != 0) && ((*puVar4 & '
                               '0x8000) != 0)) && ((((uw_object_hdr_t *)puVar3)->link & 0x200) == 0))\n'
                               '          && ((((puVar4[3] & 0x8000) == 0 && (((*puVar4 ^ '
                               '((uw_object_hdr_t *)puVar3)->type_flags) & 0x1ff) == 0)) &&\n'
                               '               ((ushort)((puVar4[3] >> 6) + (((uw_object_hdr_t '
                               '*)puVar3)->link)) < 999)))) {\n'
                               '        iVar6 = (puVar4[3] & 0xffc0) + (((uw_object_hdr_t '
                               '*)puVar3)->link << 6);\n'
                               '        *(byte *)(puVar4 + 3) = (byte)iVar6 ^ (byte)puVar4[3] & 0x3f;\n'
                               '        *(char *)((char *)puVar4 + 7) = (char)((uint)iVar6 >> 8);\n'
                               '        free_object_slot(puVar3);\n'
                               '        puVar3 = (ushort *)0x0;\n'
                               '        break;\n'
                               '      }\n'
                               '      puVar4 = puVar4 + 2;\n'
                               '    }\n'
                               '    if (puVar3 != (ushort *)0x0) {\n'
                               '      object_list_insert_head((byte *)(*piVar2 + 6),(byte *)puVar3);\n'
                               '    }\n'
                               '    uVar5 = encode_object_slot_index((char *)puVar3);\n'
                               '  }\n'
                               '  return uVar5;\n'
                               '}',
 'merge_or_swap_barter_slot_item': 'int merge_or_swap_barter_slot_item(ushort *held_object, int side, '
                                   'int slot, void *slot_array)\n'
                                   '{\n'
                                   '  ushort uVar1;\n'
                                   '  ushort uVar2;\n'
                                   '  ushort uVar3;\n'
                                   '  short sVar4;\n'
                                   '  ushort *puVar5;\n'
                                   '  int iVar6;\n'
                                   '  short *psVar7;\n'
                                   '  undefined4 uVar8;\n'
                                   '  \n'
                                   '  psVar7 = (short *)(slot_array + (short)slot * 2);\n'
                                   '  uVar8 = 0;\n'
                                   '  puVar5 = (ushort '
                                   '*)get_object_record_by_slot_index((int)*psVar7);\n'
                                   '  uVar1 = ((uw_object_hdr_t *)puVar5)->type_flags;\n'
                                   '  if ((uVar1 & 0x1c0) == 0x80 && (uVar1 & 0x30) == 0) {\n'
                                   '    return 0;\n'
                                   '  }\n'
                                   '  if (((*held_object & 0x8000) != 0) && ((uVar1 & 0x8000) != 0)) {\n'
                                   '    uVar2 = held_object[3];\n'
                                   '    if ((uVar2 & 0x8000) == 0) {\n'
                                   '      uVar3 = ((uw_object_hdr_t *)puVar5)->link_word;\n'
                                   '      if ((((uVar3 & 0x8000) == 0) && (((*held_object ^ uVar1) & '
                                   '0x1ff) == 0)) &&\n'
                                   '         ((ushort)((uVar3 >> 6) + (uVar2 >> 6)) < 999)) {\n'
                                   '        iVar6 = (uVar3 & 0xffc0) + (uVar2 & 0xffc0);\n'
                                   '        ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)iVar6 ^ '
                                   '(byte)uVar3 & 0x3f;\n'
                                   '        ((uw_object_hdr_t *)puVar5)->link_word_high = '
                                   '(byte)(char)((uint)iVar6 >> 8);\n'
                                   '        free_object_slot(held_object);\n'
                                   '        uVar8 = 1;\n'
                                   '        goto LAB_0001c404;\n'
                                   '      }\n'
                                   '    }\n'
                                   '  }\n'
                                   '  sVar4 = encode_object_slot_index(g_selected_object);\n'
                                   '  pick_up_barter_slot_item(slot,(char *)(intptr_t)(slot_array),0);\n'
                                   '  *psVar7 = sVar4;\n'
                                   'LAB_0001c404:\n'
                                   '  redraw_barter_slot_icon(side,slot);\n'
                                   '  debug_noop_checkpoint();\n'
                                   '  return uVar8;\n'
                                   '}'}
REPLACEMENTS = {'babl_builtin_do_inv_create': [('intptr_t *piVar2;', 'uw_mobile_object_t **piVar2;'),
                                ('ushort *puVar3;', 'uw_object_hdr_t *puVar3;'),
                                ('ushort *puVar4;', 'uw_object_hdr_t *puVar4;\n  uw_link_word_t *link_cursor;'),
                                ('(ushort *)spawn_new_object', 'spawn_new_object'),
                                ('piVar2 = (intptr_t *)&DAT_00100674;', 'piVar2 = &DAT_00100674;'),
                                ('(ushort *)0x0', 'NULL'),
                                ('((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)uVar1 | 0x3f;\n'
                                 '    ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)(char)(uVar1 '
                                 '>> 8);',
                                 'puVar3->quality = 0x3f;'),
                                ('puVar4 = (ushort *)(*piVar2 + 6);\n'
                                 '    while (puVar4 = (ushort *)resolve_object_link(puVar4), puVar4 != '
                                 'NULL) {',
                                 'link_cursor = uw_link_word_ptr(&(*piVar2)->hdr);\n'
                                 '    while (puVar4 = resolve_object_link(link_cursor), puVar4 != NULL) '
                                 '{'),
                                ('      if ((((((uw_object_hdr_t *)puVar3)->is_quant != 0) && ((*puVar4 '
                                 '& 0x8000) != 0)) && ((((uw_object_hdr_t *)puVar3)->link & 0x200) == '
                                 '0))\n'
                                 '          && ((((puVar4[3] & 0x8000) == 0 && (((*puVar4 ^ '
                                 '((uw_object_hdr_t *)puVar3)->type_flags) & 0x1ff) == 0)) &&\n'
                                 '               ((ushort)((puVar4[3] >> 6) + (((uw_object_hdr_t '
                                 '*)puVar3)->link)) < 999)))) {\n',
                                 '      if (puVar3->is_quant != 0 && puVar4->is_quant != 0 &&\n'
                                 '          puVar3->link < 512 && puVar4->link < 512 &&\n'
                                 '          puVar4->object_id == puVar3->object_id &&\n'
                                 '          (ushort)(puVar4->link + puVar3->link) < 999) {\n'),
                                ('iVar6 = (puVar4[3] & 0xffc0) + (((uw_object_hdr_t *)puVar3)->link << '
                                 '6);',
                                 'iVar6 = (puVar4->link << 6) + (puVar3->link << 6);'),
                                ('*(byte *)(puVar4 + 3) = (byte)iVar6 ^ (byte)puVar4[3] & 0x3f;\n'
                                 '        *(char *)((char *)puVar4 + 7) = (char)((uint)iVar6 >> 8);',
                                 'puVar4->link = (iVar6 >> 6) & 0x3ff;'),
                                ('puVar4 = puVar4 + 2;', 'link_cursor = uw_chain_word_ptr(puVar4);'),
                                ('object_list_insert_head((byte *)(*piVar2 + 6),(byte *)puVar3);',
                                 'object_list_insert_head(uw_link_word_ptr(&(*piVar2)->hdr),puVar3);'),
                                ('encode_object_slot_index((char *)puVar3)',
                                 'encode_object_slot_index(puVar3)')],
 'merge_or_swap_barter_slot_item': [('free_object_slot(held_object);', 'free_object_slot(held_header);'), ('encode_object_slot_index(g_selected_object)', 'encode_object_slot_index((uw_object_hdr_t *)g_selected_object)'), ('(uVar1 & 0x1c0) == 0x80 && (uVar1 & 0x30) == 0', '(puVar5->object_id & 0x1f0) == 0x80'), ('ushort *puVar5;',
                                     'uw_object_hdr_t *puVar5;\n'
                                     '  uw_object_hdr_t *held_header = (uw_object_hdr_t *)held_object;'),
                                    ('(ushort *)get_object_record_by_slot_index',
                                     'get_object_record_by_slot_index'),
                                    ('((*held_object & 0x8000) != 0) && ((uVar1 & 0x8000) != 0)',
                                     '(held_header->is_quant != 0) && (puVar5->is_quant != 0)'),
                                    ('uVar2 = held_object[3];', 'uVar2 = held_header->link_word;'),
                                    ('(uVar2 & 0x8000) == 0', 'held_header->link < 512'),
                                    ('((uVar3 & 0x8000) == 0) && (((*held_object ^ uVar1) & 0x1ff) == '
                                     '0)',
                                     '(puVar5->link < 512) && (held_header->object_id == '
                                     'puVar5->object_id)'),
                                    ('(ushort)((uVar3 >> 6) + (uVar2 >> 6))',
                                     '(ushort)(puVar5->link + held_header->link)'),
                                    ('iVar6 = (uVar3 & 0xffc0) + (uVar2 & 0xffc0);',
                                     'iVar6 = (puVar5->link << 6) + (held_header->link << 6);'),
                                    ('((uw_object_hdr_t *)puVar5)->link_word_low = (byte)iVar6 ^ '
                                     '(byte)uVar3 & 0x3f;\n'
                                     '        ((uw_object_hdr_t *)puVar5)->link_word_high = '
                                     '(byte)(char)((uint)iVar6 >> 8);',
                                     'puVar5->link = (iVar6 >> 6) & 0x3ff;')]}

def converted(name):
    result = ORIGINALS[name]
    for before, after in REPLACEMENTS[name]:
        assert result.count(before) == (4 if before == '(ushort *)0x0' else 1), before
        result = result.replace(before, after)
    for pointer in ('puVar3', 'puVar5'):
        result = result.replace('((uw_object_hdr_t *)'+pointer+')->', pointer+'->')
    return result

def recipe_path(name):
    return HERE/('babl-inventory-stack-fields.json' if name == 'babl_builtin_do_inv_create' else 'barter-stack-fields.json')

def generate(name):
    return json.dumps(dict(function=name, before=ORIGINALS[name], after=converted(name)), indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS:
        recipe_path(name).write_text(generate(name))

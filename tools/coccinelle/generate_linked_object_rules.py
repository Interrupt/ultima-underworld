"""Name linked-object fields while preserving saved values and live chain cursors."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
SOURCES = {'check_object_combination': 'object_actions.c',
 'consume_linked_special_object_charge': 'object_actions.c',
 'purge_tagged_objects_from_chain': 'interact.c'}
ORIGINALS = {'check_object_combination': 'int check_object_combination(void *actor_ptr, ushort *object, short count)\n'
                             '{\n'
                             '  char *actor = (char *)actor_ptr;\n'
                             '  ushort uVar1;\n'
                             '  ushort uVar2;\n'
                             '  short sVar3;\n'
                             '  ushort *puVar4;\n'
                             '  uint uVar5;\n'
                             '  uint uVar6;\n'
                             '  ushort *local_18;\n'
                             '  \n'
                             '  if ((((*object & 0x8000) != 0) || (local_18 = object + 3, (*local_18 & '
                             '0xffc0) == 0)) ||\n'
                             '     (puVar4 = (ushort *)find_object_in_chain(&local_18,0,4,0,0xf), puVar4 == '
                             '(ushort *)0x0)) {\n'
                             '    return 1;\n'
                             '  }\n'
                             '  uVar1 = ((uw_object_hdr_t *)puVar4)->type_flags;\n'
                             '  if ((uVar1 & 0x200) == 0) {\n'
                             '    if (0 < count) {\n'
                             '      uVar2 = *object;\n'
                             '      if ((((uVar2 & 0x1f0) != 0x140) || ((uVar2 & 0xf) < 8)) &&\n'
                             '         (((uVar2 & 0x1f0) != 0x80 || ((0xb < (uVar2 & 0xf) || ((uVar2 & 1) == '
                             '0)))))) {\n'
                             '        if ((((uw_object_hdr_t *)puVar4)->link & 0x1ff) != (int)count) {\n'
                             '          return 0;\n'
                             '        }\n'
                             '        ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar1;\n'
                             '        ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(uVar1 >> 8) | '
                             '2;\n'
                             '        return 2;\n'
                             '      }\n'
                             '    }\n'
                             '    return 4;\n'
                             '  }\n'
                             '  uVar6 = (uint)count;\n'
                             '  if ((int)uVar6 < 0) {\n'
                             '    uVar5 = ((uw_object_hdr_t *)puVar4)->zpos;\n'
                             '    if (((uVar5 != 0xe) || (0x1e < (int)-uVar6)) &&\n'
                             '       ((uVar5 != 0xf &&\n'
                             '        (sVar3 = roll_skill_check((int)(uVar6 * -0x10000) >> '
                             '0x10,(((uw_object_hdr_t *)puVar4)->zpos) * 3),\n'
                             '         0 < sVar3)))) {\n'
                             'LAB_0007c130:\n'
                             '      '
                             'trigger_object_trap_or_use_action(actor,object,6,(int)DAT_002020a0,DAT_002020a4);\n'
                             '      if ((((uw_object_hdr_t *)puVar4)->flags_res & 0x2) == 0) {\n'
                             '        object_list_unlink(local_18,puVar4);\n'
                             '        free_object_slot(puVar4);\n'
                             '      }\n'
                             '      else {\n'
                             '        uVar6 = ((uw_object_hdr_t *)puVar4)->type_flags & 0xfdff;\n'
                             '        ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)uVar6;\n'
                             '      }\n'
                             '      return 3;\n'
                             '    }\n'
                             '  }\n'
                             '  else if (((0 < (int)uVar6) && ((((uw_object_hdr_t *)puVar4)->link & 0x1ff) '
                             '!= 0)) && ((((uw_object_hdr_t *)puVar4)->link & 0x1ff) == uVar6))\n'
                             '  goto LAB_0007c130;\n'
                             '  return 0;\n'
                             '}',
 'consume_linked_special_object_charge': 'void consume_linked_special_object_charge(void *object_ptr)\n'
                                         '{\n'
                                         '  char *object = (char *)object_ptr;\n'
                                         '  ushort uVar1;\n'
                                         '  byte bVar2;\n'
                                         '  void *iVar3;\n'
                                         '  int iVar4;\n'
                                         '  ushort *local_c;\n'
                                         '  \n'
                                         '  if (((((*(byte *)(object + 1) & 0x80) == 0) &&\n'
                                         '       (local_c = (ushort *)(object + 6), (*local_c & 0xffc0) != '
                                         '0)) &&\n'
                                         '      (iVar3 = find_object_in_chain(&local_c,0,4,2,0), iVar3 != '
                                         '0)) && ((((uw_object_hdr_t *)iVar3)->flags_res & 0x4) != 0)) {\n'
                                         '    uVar1 = ((uw_object_hdr_t *)iVar3)->chain_word;\n'
                                         '    if ((uVar1 & 0x3f) == 0) {\n'
                                         '      iVar4 = rand_below(10);\n'
                                         '      if (iVar4 < 4) {\n'
                                         '        object_list_unlink(local_c,iVar3);\n'
                                         '        free_object_slot(iVar3);\n'
                                         '      }\n'
                                         '    }\n'
                                         '    else {\n'
                                         '      bVar2 = (byte)uVar1;\n'
                                         '      ((uw_object_hdr_t *)iVar3)->chain_word_low = (bVar2 - 1 ^ '
                                         'bVar2) & 0x3f ^ bVar2;\n'
                                         '      ((uw_object_hdr_t *)iVar3)->chain_word_high = '
                                         '(byte)(char)(uVar1 >> 8);\n'
                                         '    }\n'
                                         '  }\n'
                                         '}',
 'purge_tagged_objects_from_chain': 'void purge_tagged_objects_from_chain(void *link_field_ptr)\n'
                                    '{\n'
                                    '  ushort *link_field = (ushort *)link_field_ptr;\n'
                                    '  ushort *puVar1;\n'
                                    '  \n'
                                    '  for (puVar1 = (ushort *)resolve_object_link(link_field); puVar1 != '
                                    '(ushort *)0x0; /* confirmed via ARM disassembly, 0x7deec */\n'
                                    '      puVar1 = (ushort *)resolve_object_link(puVar1 + 2)) {\n'
                                    '    if (((((uw_object_hdr_t *)puVar1)->object_id & 0x1f0) == 0x1a0) && '
                                    '((int)DAT_0024cfd0 == (uint)(((uw_object_hdr_t *)puVar1)->link))) {\n'
                                    '      object_list_unlink(link_field,puVar1);\n'
                                    '      free_object_slot(puVar1);\n'
                                    '      ((uw_object_hdr_t *)puVar1)->link_word_low = ((uw_object_hdr_t '
                                    '*)puVar1)->owner;\n'
                                    '      ((uw_object_hdr_t *)puVar1)->link_word_high = 0;\n'
                                    '      DAT_0024cfd8 = DAT_0024cfd8 + -1;\n'
                                    '    }\n'
                                    '    if ((((uw_object_hdr_t *)puVar1)->is_quant == 0) && '
                                    '(((uw_object_hdr_t *)puVar1)->link != 0)) {\n'
                                    '      purge_tagged_objects_from_chain(puVar1 + 3); /* was called with '
                                    'no argument; confirmed via ARM disassembly, 0x7dfbc */\n'
                                    '    }\n'
                                    '  }\n'
                                    '}'}
REPLACEMENTS = {'check_object_combination': [('ushort *puVar4;',
                               'uw_object_hdr_t *puVar4;\n'
                               '  uw_object_hdr_t *object_header = (uw_object_hdr_t *)object;'),
                              ('(*object & 0x8000) != 0', 'object_header->is_quant != 0'),
                              ('local_18 = object + 3, (*local_18 & 0xffc0) == 0',
                               'local_18 = &object_header->link_word, object_header->link == 0'),
                              ('(ushort *)find_object_in_chain', 'find_object_in_chain'),
                              ('puVar4 == (ushort *)0x0', 'puVar4 == NULL'),
                              ('((uw_object_hdr_t *)puVar4)->', 'puVar4->'),
                              ('(uVar1 & 0x200) == 0', '(puVar4->flags_res & 1) == 0'),
                              ('uVar2 = *object;', 'uVar2 = object_header->type_flags;'),
                              ('puVar4->type_flags_low = (byte)(char)uVar1;\n'
                               '        puVar4->type_flags_high = (byte)(uVar1 >> 8) | 2;',
                               'puVar4->flags_res = puVar4->flags_res | 1;'),
                              ('puVar4->type_flags = (ushort)uVar6;',
                               'puVar4->flags_res = puVar4->flags_res & 6;')],
 'consume_linked_special_object_charge': [('char *object = (char *)object_ptr;',
                                           'uw_object_hdr_t *object = (uw_object_hdr_t *)object_ptr;'),
                                          ('void *iVar3;', 'uw_object_hdr_t *iVar3;'),
                                          ('(*(byte *)(object + 1) & 0x80) == 0', 'object->is_quant == 0'),
                                          ('local_c = (ushort *)(object + 6), (*local_c & 0xffc0) != 0',
                                           'local_c = &object->link_word, object->link != 0'),
                                          ('((uw_object_hdr_t *)iVar3)->', 'iVar3->'),
                                          ('(uVar1 & 0x3f) == 0', 'iVar3->quality == 0'),
                                          ('iVar3->chain_word_low = (bVar2 - 1 ^ bVar2) & 0x3f ^ bVar2;\n'
                                           '      iVar3->chain_word_high = (byte)(char)(uVar1 >> 8);',
                                           'iVar3->quality = (bVar2 - 1) & 0x3f;')],
 'purge_tagged_objects_from_chain': [('ushort *puVar1;', 'uw_object_hdr_t *puVar1;'),
                                     ('(ushort *)resolve_object_link', 'resolve_object_link'),
                                     ('puVar1 != (ushort *)0x0', 'puVar1 != NULL'),
                                     ('resolve_object_link(puVar1 + 2)',
                                      'resolve_object_link(&puVar1->chain_word)'),
                                     ('((uw_object_hdr_t *)puVar1)->', 'puVar1->'),
                                     ('puVar1->link_word_low = puVar1->owner;\n'
                                      '      puVar1->link_word_high = 0;',
                                      'puVar1->link = 0;'),
                                     ('purge_tagged_objects_from_chain(puVar1 + 3)',
                                      'purge_tagged_objects_from_chain(&puVar1->link_word)')]}

def converted(name):
    result = ORIGINALS[name]
    for before, after in REPLACEMENTS[name]:
        assert before in result, (name,before)
        result = result.replace(before,after)
    return result

def recipe_path(name):
    return HERE / (name.replace('_','-')+'-fields.json')

def generate(name):
    return json.dumps(dict(function=name,before=ORIGINALS[name],after=converted(name)),indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS:
        recipe_path(name).write_text(generate(name))

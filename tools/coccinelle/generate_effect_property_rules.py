"""Name effect placement and scheduler properties, preserving packed arithmetic captures."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
SOURCES = {'spawn_and_prime_spell_effect_object': 'spells.c',
 'spawn_random_variant_object_at_tile': 'spells.c',
 'scheduler_advance_effect': 'scheduler.c'}
ORIGINALS = {'spawn_and_prime_spell_effect_object': 'void *spawn_and_prime_spell_effect_object(int object_type, byte '
                                        '*source)\n'
                                        '{\n'
                                        '  uint uVar1;\n'
                                        '  undefined2 uVar2;\n'
                                        '  byte bVar3;\n'
                                        '  char *iVar4;\n'
                                        '  undefined4 uVar5;\n'
                                        '  char extraout_r1;\n'
                                        '  byte bVar6;\n'
                                        '\n'
                                        '  iVar4 = (char *)spawn_new_object(object_type,0);\n'
                                        "  bVar6 = (*source >> 4) * '\\b';\n"
                                        '  uVar1 = (int)((uint)(*source >> 4) << 0x13) >> 0x10;\n'
                                        '  if (uVar1 < 0x80) {\n'
                                        '    uVar5 = ce_rand();\n'
                                        '    extraout_r1 = (char)ordint_divmod(0x80 - uVar1,uVar5).rem;\n'
                                        '    bVar6 = bVar6 + extraout_r1;\n'
                                        '  }\n'
                                        '  uVar2 = ((uw_object_hdr_t *)iVar4)->position_word;\n'
                                        '  bVar3 = (byte)uVar2;\n'
                                        '  ((uw_object_hdr_t *)iVar4)->position_word_low = (bVar3 ^ bVar6) & '
                                        '0x7f ^ bVar3;\n'
                                        '  ((uw_object_hdr_t *)iVar4)->position_word_high = '
                                        '(byte)(char)((ushort)uVar2 >> 8);\n'
                                        '  return iVar4;\n'
                                        '}',
 'spawn_random_variant_object_at_tile': 'int spawn_random_variant_object_at_tile(int tile_x, int tile_y)\n'
                                        '{\n'
                                        '  int uw_ord2005_rem_157 = 0; int uw_ord2005_rem_158 = 0;\n'
                                        '  byte bVar1;\n'
                                        '  undefined1 uVar2;\n'
                                        '  undefined4 uVar3;\n'
                                        "  char *iVar4;  /* was `int` -- truncated spawn_new_object's real "
                                        'pointer */\n'
                                        '  int iVar5;\n'
                                        '  char extraout_r1;\n'
                                        '  short extraout_r1_00;\n'
                                        '  uint uVar6;\n'
                                        '\n'
                                        '  uVar3 = ce_rand();\n'
                                        '  uw_ord2005_rem_157 = ((int)(uVar3)) % (3);\n'
                                        '  iVar4 = (char *)spawn_new_object(uw_ord2005_rem_157 + 0x154,0);\n'
                                        '  uVar6 = ((uw_object_hdr_t *)iVar4)->position_word & 0xffee;\n'
                                        '  ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)uVar6 | '
                                        '0x6e;\n'
                                        '  ((uw_object_hdr_t *)iVar4)->position_word_high = '
                                        '(byte)(char)(uVar6 >> 8);\n'
                                        '  iVar5 = place_object_in_world(tile_x * 8 + 3,tile_y * 8 + '
                                        '3,0x6e,iVar4,0,0);\n'
                                        '  if ((iVar5 != 0) && (iVar5 = object_ptr_in_arena(iVar4), iVar5 != '
                                        '0)) {\n'
                                        '    bVar1 = ce_rand();\n'
                                        '    ((uw_mobile_object_t *)iVar4)->speed = ((bVar1 & 3) + 2) & '
                                        '0x7f;\n'
                                        '    uVar2 = ce_rand();\n'
                                        '    ((uw_mobile_object_t *)iVar4)->full_heading = uVar2;\n'
                                        '    bVar1 = ce_rand();\n'
                                        '    ((uw_mobile_object_t *)iVar4)->tick_phase = ((bVar1 & 3) + '
                                        'DAT_00101928) & 0xf;\n'
                                        '    uVar3 = ce_rand();\n'
                                        '    bVar1 = ((uw_mobile_object_t *)iVar4)->attack_pitch;\n'
                                        '    uw_ord2005_rem_158 = ((int)(uVar3)) % (3);\n'
                                        '    ((uw_mobile_object_t *)iVar4)->attack_pitch = '
                                        '(uw_ord2005_rem_158 + 1U ^ bVar1) & 7 ^ bVar1;\n'
                                        '  }\n'
                                        '  return 1;\n'
                                        '}',
 'scheduler_advance_effect': 'int scheduler_advance_effect(short entry_slot, int elapsed)\n'
                             '{\n'
                             '  byte bVar1;\n'
                             '  ushort *puVar2;\n'
                             '  undefined4 uVar3;\n'
                             '  int iVar4;\n'
                             '  uint uVar5;\n'
                             '  int iVar6;\n'
                             '  ushort uVar7;\n'
                             '  int iVar8;\n'
                             '  ushort uVar9;\n'
                             '  int iVar10;\n'
                             '  bool bVar11;\n'
                             '  \n'
                             '  iVar8 = entry_slot * 6;\n'
                             '  iVar10 = 5;\n'
                             '  /* HACK: adds the NULL guard every other resolve_object_link call site in '
                             'this file has (this one\n'
                             '     had none at all -- a stale queue entry resolving to NULL would '
                             'dereference puVar2 below\n'
                             '     unconditionally). */\n'
                             '  puVar2 = (ushort *)resolve_object_link(&DAT_00250778 + iVar8);\n'
                             '  if (puVar2 == (ushort *)0x0) {\n'
                             '    return 0;\n'
                             '  }\n'
                             '  uVar7 = (ushort)(byte)((uw_object_hdr_t *)puVar2)->link_word;\n'
                             '  DAT_0010144c = (ushort)(byte)(&DAT_0025077c)[iVar8];\n'
                             '  uVar9 = ((uw_object_hdr_t *)puVar2)->zpos;\n'
                             '  DAT_00101454 = (ushort)(byte)(&DAT_0025077d)[iVar8];\n'
                             '  if ((uVar7 & 7) != 6) {\n'
                             '    uVar9 = uVar9 - 0x18;\n'
                             '  }\n'
                             '  uVar3 = encode_object_slot_index(puVar2);\n'
                             '  iVar4 = check_object_placement_clearance((uVar7 & 0x30) + (uVar7 & 0xf) + '
                             '0x140,uVar3,\n'
                             '                       (uint)(((uw_object_hdr_t *)puVar2)->xpos) + '
                             '(short)DAT_0010144c * 8,\n'
                             '                       (((uw_object_hdr_t *)puVar2)->ypos) + '
                             '(short)DAT_00101454 * 8,\n'
                             '                       uVar9,1,\n'
                             '                       8);\n'
                             '  if (iVar4 == 0) {\n'
                             '    uVar5 = (uint)((uw_object_hdr_t *)puVar2)->type_flags;\n'
                             '    if ((((uVar5 & 0x1c0) == 0x140) && ((uVar5 & 7) == 6)) ||\n'
                             '       (((uVar5 & 0x1c0) == 0x1c0 && ((((uw_object_hdr_t *)puVar2)->owner & '
                             '0x7) == 6)))) {\n'
                             '      iVar10 = 4;\n'
                             '    }\n'
                             '    bVar1 = (byte)((uVar5 & 0xefff) >> 8);\n'
                             '    ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)(char)(uVar5 & '
                             '0xefff);\n'
                             '    ((uw_object_hdr_t *)puVar2)->type_flags_high =\n'
                             '        ((byte)(((uVar5 & 0xe00) + (elapsed + 1) * -0x200) >> 8) ^ bVar1) & '
                             '0x1e ^ bVar1;\n'
                             '    iVar6 = scheduler_get_delay(puVar2);\n'
                             '    iVar4 = (int)(short)iVar6;\n'
                             '    bVar11 = -1 < iVar4;\n'
                             '    if (bVar11) {\n'
                             '      iVar4 = (iVar10 - iVar6) + 1;\n'
                             '      (&DAT_0025077a)[iVar8] = (char)iVar4;\n'
                             '      DAT_002508fc = 1;\n'
                             '    }\n'
                             '    uVar3 = 0;\n'
                             '    if (bVar11) {\n'
                             '      (&DAT_0025077b)[iVar8] = (char)((uint)iVar4 >> 8);\n'
                             '    }\n'
                             '  }\n'
                             '  else {\n'
                             '    uVar3 = 1;\n'
                             '  }\n'
                             '  return uVar3;\n'
                             '}'}
REPLACEMENTS = {'spawn_and_prime_spell_effect_object': [('char *iVar4;', 'uw_object_hdr_t *iVar4;'),
                                         ('(char *)spawn_new_object', 'spawn_new_object'),
                                         ('((uw_object_hdr_t *)iVar4)->', 'iVar4->'),
                                         ('iVar4->position_word_low = (bVar3 ^ bVar6) & 0x7f ^ bVar3;\n'
                                          '  iVar4->position_word_high = (byte)(char)((ushort)uVar2 >> 8);',
                                          'iVar4->zpos = bVar6 & 0x7f;')],
 'spawn_random_variant_object_at_tile': [("char *iVar4;  /* was `int` -- truncated spawn_new_object's real "
                                          'pointer */',
                                          'uw_object_hdr_t *iVar4;'),
                                         ('(char *)spawn_new_object', 'spawn_new_object'),
                                         ('((uw_object_hdr_t *)iVar4)->', 'iVar4->'),
                                         ('iVar4->position_word_low = (byte)uVar6 | 0x6e;\n'
                                          '  iVar4->position_word_high = (byte)(char)(uVar6 >> 8);',
                                          'iVar4->zpos = 0x6e;')],
 'scheduler_advance_effect': [('ushort *puVar2;', 'uw_object_hdr_t *puVar2;'),
                              ('uint uVar5;', 'uint uVar5;\n  uint effect_flags;'),
                              ('(ushort *)resolve_object_link', 'resolve_object_link'),
                              ('puVar2 == (ushort *)0x0', 'puVar2 == NULL'),
                              ('((uw_object_hdr_t *)puVar2)->', 'puVar2->'),
                              ('puVar2->type_flags_low = (byte)(char)(uVar5 & 0xefff);\n'
                               '    puVar2->type_flags_high =\n'
                               '        ((byte)(((uVar5 & 0xe00) + (elapsed + 1) * -0x200) >> 8) ^ bVar1) & '
                               '0x1e ^ bVar1;',
                               'effect_flags = (uVar5 & 0xe00) + (elapsed + 1) * -0x200;\n'
                               '    puVar2->flags_res = (effect_flags >> 9) & 7;\n'
                               '    puVar2->enchanted = (effect_flags >> 12) & 1;')]}

def converted(name):
    result = ORIGINALS[name]
    for before,after in REPLACEMENTS[name]:
        assert before in result,(name,before)
        result = result.replace(before,after)
    return result

def recipe_path(name):
    return HERE/(name.replace('_','-')+'-fields.json')

def generate(name):
    return json.dumps(dict(function=name,before=ORIGINALS[name],after=converted(name)),indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS:
        recipe_path(name).write_text(generate(name))

"""Name tracked-target coordinates using proven common and shared mobile fields."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
SOURCES = {'detect_npc_wander_proximity': 'ai.c',
 'compute_vertical_aim_offset': 'ai.c',
 'refresh_npc_target_delta': 'ai.c',
 'try_npc_special_ability_ranged': 'combat.c',
 'try_npc_special_ability_alt': 'combat.c'}
ORIGINALS = {'detect_npc_wander_proximity': 'int detect_npc_wander_proximity(void *out_near_ptr, void *out_far_ptr)\n'
                                '{\n'
                                '  char *out_near = (char *)out_near_ptr;\n'
                                '  char *out_far = (char *)out_far_ptr;\n'
                                '  int uw_ord2005_rem_86 = 0;\n'
                                '  int iVar1;\n'
                                '  int iVar2;\n'
                                '  ushort uVar3;\n'
                                '  char cVar4;\n'
                                '  int iVar5;\n'
                                '  undefined4 uVar6;\n'
                                '  char extraout_r1;\n'
                                '  ushort *puVar7;\n'
                                '  /* Preserved separately from iVar1/iVar2 below, which get overwritten\n'
                                "     with the squared distance before compute_movement_heading's own\n"
                                '     call further down needs them -- see that dropped-argument fix. */\n'
                                '  int deltaX;\n'
                                '  int deltaY;\n'
                                '\n'
                                '  *out_near = DAT_00101408;\n'
                                '  *out_far = DAT_00101410;\n'
                                '  iVar1 = ((int)DAT_00101408 - (int)DAT_00101918) * 0x1000000 >> 0x18;\n'
                                '  iVar2 = ((int)DAT_00101410 - (int)DAT_001013f8) * 0x1000000 >> 0x18;\n'
                                '  deltaX = iVar1;\n'
                                '  deltaY = iVar2;\n'
                                '  iVar2 = (iVar1 * iVar1 + iVar2 * iVar2) * 0x10000 >> 0x10;\n'
                                '  iVar1 = (int)((DAT_00101404->awareness_ranges & 0xf) *\n'
                                '                ((byte) g_monster_type_props[((byte)*DAT_00101400 & '
                                '0x3f)].detection_ranges & 0xf)) >> 4;\n'
                                '  iVar1 = iVar1 * iVar1 * 0x10000;\n'
                                '  if (iVar2 < iVar1 >> 0x12) {\n'
                                'LAB_000323ac:\n'
                                '    uVar6 = 0;\n'
                                '  }\n'
                                '  else {\n'
                                '    iVar5 = (int)((uint)(DAT_00101404->awareness_ranges >> 4) *\n'
                                '                  (uint)((byte) g_monster_type_props[((byte)*DAT_00101400 & '
                                '0x3f)].detection_ranges >> 4)) >> 4;\n'
                                '    puVar7 = DAT_0010190c;\n'
                                '    if (iVar2 <= iVar5 * iVar5 * 0x10000 >> 0x10) {\n'
                                '      /* Was a dropped register-forwarding argument -- was '
                                '`compute_movement_heading();` with no\n'
                                "         args. deltaX/deltaY, preserved above from this function's own "
                                'delta computation (before it\n'
                                '         got squashed into the squared-distance iVar2), are exactly what '
                                'this call needs. */\n'
                                '      cVar4 = compute_movement_heading(deltaX,deltaY);\n'
                                '      puVar7 = DAT_0010190c;\n'
                                '      uVar3 = DAT_0010190c->hdr.position_word;\n'
                                '      uw_ord2005_rem_86 = ((int)(((int)cVar4 - ((int)(char)(uVar3 >> 7) & '
                                '7U)) + 8)) % (8);\n'
                                "      if ((((uw_ord2005_rem_86 == '\\0') || (uw_ord2005_rem_86 == '\\x01')) "
                                "|| (uw_ord2005_rem_86 == '\\a')) &&\n"
                                '         (iVar5 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,\n'
                                '                               (ushort)(byte) '
                                'g_object_type_props[(((uw_object_hdr_t *)puVar7)->object_id)].height +\n'
                                '                               (uVar3 & 0x7f),DAT_00101908,DAT_00101418,\n'
                                '                               (ushort)(byte) g_object_type_props[(*(ushort '
                                '*)DAT_00101400 & 0x1ff)].height +\n'
                                '                               (((byte)DAT_00101400[2]) & 0x7f)), puVar7 = '
                                'DAT_0010190c, iVar5 != 0))\n'
                                '      {\n'
                                '        DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 1;\n'
                                '        goto LAB_000323ac;\n'
                                '      }\n'
                                '    }\n'
                                '    if (iVar2 < (iVar1 >> 0x10) * 4) {\n'
                                '      uVar6 = 2;\n'
                                '    }\n'
                                '    else {\n'
                                '      uVar6 = 1;\n'
                                '      ((uw_mobile_object_t *)puVar7)->npc_ai_flags = ((uw_mobile_object_t '
                                '*)puVar7)->npc_ai_flags & 0xfe;\n'
                                '    }\n'
                                '  }\n'
                                '  return uVar6;\n'
                                '}',
 'compute_vertical_aim_offset': 'int compute_vertical_aim_offset(short has_target, int target)\n'
                                '{\n'
                                '  byte bVar1;\n'
                                '  byte bVar2;\n'
                                '  ushort uVar3;\n'
                                '  short sVar4;\n'
                                '  int iVar5;\n'
                                '  int iVar6;\n'
                                '  \n'
                                '  refresh_npc_target_delta();\n'
                                '  bVar1 = DAT_0010190c->hdr.position_word_low;\n'
                                '  bVar2 = *(byte *)(DAT_00101400 + 2);\n'
                                '  uVar3 = integer_sqrt(DAT_00101728);\n'
                                '  iVar6 = (int)(((bVar2 & 0x7f) - (bVar1 & 0x7f)) * 0x10000) >> 0x10;\n'
                                '  if (uVar3 == 0) {\n'
                                '    iVar5 = 0xf;\n'
                                '    if (iVar6 < 1) {\n'
                                '      iVar5 = -0xf;\n'
                                '    }\n'
                                '    iVar5 = iVar5 << 0x18;\n'
                                '  }\n'
                                '  else {\n'
                                '    sVar4 = ordint_divmod((int)(short)uVar3,iVar6 << 2).quot;\n'
                                '    iVar5 = (int)sVar4;\n'
                                '    if (0xf < iVar5) {\n'
                                '      iVar5 = 0xf;\n'
                                '    }\n'
                                '    if ((short)iVar5 < -0xf) {\n'
                                '      iVar5 = -0xf;\n'
                                '    }\n'
                                '    if ((target == 0) || (has_target == 0)) {\n'
                                '      iVar5 = iVar5 << 0x18;\n'
                                '    }\n'
                                '    else {\n'
                                '      iVar6 = ordint_divmod((int)has_target,(uint)uVar3 * 3).quot;\n'
                                '      iVar5 = (iVar6 + (short)iVar5) * 0x1000000;\n'
                                '    }\n'
                                '  }\n'
                                '  return iVar5 >> 0x18;\n'
                                '}',
 'refresh_npc_target_delta': 'int refresh_npc_target_delta()\n'
                             '\n'
                             '{\n'
                             '  undefined4 uVar1;\n'
                             '  int iVar2;\n'
                             '  int iVar3;\n'
                             '  uint uVar4;\n'
                             '  int iVar5;\n'
                             '  \n'
                             '  DAT_00101400 = get_object_record_by_slot_index(DAT_0010190c->npc_gtarg);\n'
                             "  if ((DAT_00101400 == 0) || (*(char *)(DAT_00101400 + 8) == '\\0')) {\n"
                             '    uVar1 = 0;\n'
                             '  }\n'
                             '  else {\n'
                             '    DAT_00101408 = *(byte *)(DAT_00101400 + 0x17) >> 2;\n'
                             '    uVar4 = *(ushort *)(DAT_00101400 + 0x16) >> 4 & 0x3f;\n'
                             '    DAT_00101410 = (undefined1)uVar4;\n'
                             '    DAT_00101420 = *(byte *)(DAT_00101400 + 2) >> 3 & 0xf;\n'
                             '    iVar3 = (uint)DAT_00101408 * 8 + (uint)(*(byte *)(DAT_00101400 + 3) >> '
                             '5);\n'
                             '    DAT_00101908 = (undefined2)iVar3;\n'
                             '    iVar2 = (*(byte *)(DAT_00101400 + 3) >> 2 & 7) + uVar4 * 8;\n'
                             '    DAT_00101418 = (undefined2)iVar2;\n'
                             '    DAT_00101444 = (short)((uint)(iVar3 * 0x10000) >> 0x10) - DAT_00101910;\n'
                             '    DAT_00101448 = (short)((uint)(iVar2 * 0x10000) >> 0x10) - DAT_0010141c;\n'
                             '    iVar5 = (uint)DAT_00101408 - (uint)DAT_00101918;\n'
                             '    DAT_00101900 = (undefined2)\n'
                             '                   ((iVar5 * iVar5 + (uVar4 - DAT_001013f8) * (uVar4 - '
                             'DAT_001013f8)) * 0x10000 >>\n'
                             '                   0x10);\n'
                             '    DAT_00101728 = (iVar3 - (uint)DAT_00101910) * (iVar3 - (uint)DAT_00101910) '
                             '+\n'
                             '                   (iVar2 - (uint)DAT_0010141c) * (iVar2 - '
                             '(uint)DAT_0010141c);\n'
                             '    uVar1 = 1;\n'
                             '  }\n'
                             '  return uVar1;\n'
                             '}',
 'try_npc_special_ability_ranged': 'int try_npc_special_ability_ranged()\n'
                                   '{\n'
                                   '  int uw_ord2005_rem_60 = 0; int uw_ord2005_rem_61 = 0;\n'
                                   '  byte bVar1;\n'
                                   '  char cVar2;\n'
                                   '  int iVar3;\n'
                                   '  undefined4 uVar4;\n'
                                   '  short extraout_r1;\n'
                                   '  int extraout_r1_00;\n'
                                   '  uint uVar5;\n'
                                   '  \n'
                                   '  iVar3 = tile_is_no_magic(DAT_00101918,DAT_001013f8);\n'
                                   '  if ((((iVar3 == 0) &&\n'
                                   '       (((DAT_00201b68 != 7 || ((*(byte *)(DAT_00086df8 + 0x60) & 0x20) '
                                   '!= 0)) ||\n'
                                   "        (*(char *)&DAT_00101404->race_flags != '\\x13')))) &&\n"
                                   '       (((DAT_00101900 < 0x40 && (iVar3 = '
                                   'tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar3 == 0)) &&\n'
                                   '         (iVar3 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,\n'
                                   '                                           (uint)(byte) '
                                   'g_object_type_props[(DAT_0010190c->hdr.object_id)].height +\n'
                                   '                                           '
                                   '(DAT_0010190c->hdr.zpos),DAT_00101908,DAT_00101418,\n'
                                   '                                           (ushort)(byte) '
                                   'g_object_type_props[(*(ushort *)DAT_00101400 & 0x1ff)].height +\n'
                                   '                                           (((byte)DAT_00101400[2]) & '
                                   '0x7f)), iVar3 != 0)))) &&\n'
                                   '      (iVar3 = check_npc_target_alignment(1), iVar3 != 0)) {\n'
                                   '    uVar4 = ce_rand();\n'
                                   '    bVar1 = DAT_00101404->spell_flags;\n'
                                   '    uw_ord2005_rem_60 = ((int)(uVar4)) % (0x80);\n'
                                   '    if (uw_ord2005_rem_60 < (short)(ushort)(bVar1 >> 1)) {\n'
                                   '      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;\n'
                                   '      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & '
                                   '0xcd | 0xd;\n'
                                   '      uVar4 = ce_rand();\n'
                                   '      uw_ord2005_rem_61 = ((int)(uVar4)) % (0x10);\n'
                                   "      cVar2 = '\\x01';\n"
                                   '      if (10 < uw_ord2005_rem_61) {\n'
                                   "        cVar2 = '\\x02';\n"
                                   '      }\n'
                                   '      DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xf3 | '
                                   'cVar2 << 2;\n'
                                   '      DAT_0010190c->npc_animation_frame = 0x0;\n'
                                   '      uVar5 = DAT_0010190c->goal_word;\n'
                                   '    }\n'
                                   '    return 1;\n'
                                   '  }\n'
                                   '  return 0;\n'
                                   '}',
 'try_npc_special_ability_alt': 'int try_npc_special_ability_alt()\n'
                                '{\n'
                                '  int uw_ord2005_rem_62 = 0;\n'
                                '  byte bVar1;\n'
                                '  int iVar2;\n'
                                '  undefined4 uVar3;\n'
                                '  int extraout_r1;\n'
                                '  uint uVar4;\n'
                                '  \n'
                                "  /* The target's Z is the position word's low 7 bits (ARM 0x30e50 reads "
                                'bytes 2-3 of the target);\n'
                                '     this was `DAT_00101400[1]` on a `char *`, i.e. byte 1 of the object-id '
                                'word -- always 0 for the\n'
                                '     player -- so the sight line ran 20-odd units under the floor and every '
                                'ranged attack was\n'
                                '     blocked (same bug at the other two sight checks, here and in '
                                'npc_ai_tick). */\n'
                                '  if (((DAT_00101900 < 0x10) &&\n'
                                '      (iVar2 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,\n'
                                '                            (uint)(byte) '
                                'g_object_type_props[(DAT_0010190c->hdr.object_id)].height +\n'
                                '                            '
                                '(DAT_0010190c->hdr.zpos),DAT_00101908,DAT_00101418,\n'
                                '                            (ushort)(byte) g_object_type_props[(*(ushort '
                                '*)DAT_00101400 & 0x1ff)].height +\n'
                                '                            (((byte)DAT_00101400[2]) & 0x7f)), iVar2 != 0)) '
                                '&&\n'
                                '     (iVar2 = check_npc_target_alignment(1), iVar2 != 0)) {\n'
                                '    uVar3 = ce_rand();\n'
                                '    bVar1 = DAT_00101404->dexterity;\n'
                                '    uw_ord2005_rem_62 = ((int)(uVar3)) % (0xc0);\n'
                                '    if (uw_ord2005_rem_62 <= (int)(uint)bVar1) {\n'
                                '      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;\n'
                                '      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc5 '
                                '| 5;\n'
                                '      DAT_0010190c->npc_animation_frame = 0x0;\n'
                                '      uVar4 = DAT_0010190c->goal_word;\n'
                                '    }\n'
                                '    return 1;\n'
                                '  }\n'
                                '  return 0;\n'
                                '}'}
REPLACEMENTS = {'detect_npc_wander_proximity': [('*(ushort *)DAT_00101400 & 0x1ff',
                                  '((uw_object_hdr_t *)DAT_00101400)->object_id'),
                                 ('((byte)DAT_00101400[2]) & 0x7f',
                                  '((uw_object_hdr_t *)DAT_00101400)->zpos'),
                                 ('ushort *puVar7;', 'uw_mobile_object_t *puVar7;'),
                                 ('((byte)*DAT_00101400 & 0x3f)',
                                  '(((uw_object_hdr_t *)DAT_00101400)->object_id & 0x3f)'),
                                 ('((uw_object_hdr_t *)puVar7)->object_id', 'puVar7->hdr.object_id'),
                                 ('((uw_mobile_object_t *)puVar7)->npc_ai_flags', 'puVar7->npc_ai_flags'),
                                 ('((int)(char)(uVar3 >> 7) & 7U)', '(uint)puVar7->hdr.heading'),
                                 ('(uVar3 & 0x7f)', '(puVar7->hdr.zpos)')],
 'compute_vertical_aim_offset': [('*(byte *)(DAT_00101400 + 2)',
                                  '((uw_object_hdr_t *)DAT_00101400)->position_word_low')],
 'refresh_npc_target_delta': [('DAT_00101400 = get_object_record_by_slot_index(',
                               'DAT_00101400 = (char *)get_object_record_by_slot_index('),
                              ('uint uVar4;', 'uint uVar4;\n  /* The eight-bit goal slot resolves only mobile records; use shared fields. */\n  uw_mobile_object_t *target_object;'),
                              ('  if ((DAT_00101400 == 0)',
                               '  target_object = (uw_mobile_object_t *)DAT_00101400;\n'
                               '  if ((DAT_00101400 == 0)'),
                              ("*(char *)(DAT_00101400 + 8) == '\\0'", 'target_object->hit_points == 0'),
                              ('*(byte *)(DAT_00101400 + 0x17) >> 2', 'target_object->tile_x'),
                              ('*(ushort *)(DAT_00101400 + 0x16) >> 4 & 0x3f', 'target_object->tile_y'),
                              ('*(byte *)(DAT_00101400 + 2) >> 3 & 0xf', 'target_object->hdr.zpos >> 3'),
                              ('*(byte *)(DAT_00101400 + 3) >> 5', 'target_object->hdr.xpos'),
                              ('*(byte *)(DAT_00101400 + 3) >> 2 & 7', 'target_object->hdr.ypos')],
 'try_npc_special_ability_ranged': [('*(ushort *)DAT_00101400 & 0x1ff',
                                     '((uw_object_hdr_t *)DAT_00101400)->object_id'),
                                    ('((byte)DAT_00101400[2]) & 0x7f',
                                     '((uw_object_hdr_t *)DAT_00101400)->zpos'),
                                    ('DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;',
                                     'DAT_0010190c->speed = 0;')],
 'try_npc_special_ability_alt': [('*(ushort *)DAT_00101400 & 0x1ff',
                                  '((uw_object_hdr_t *)DAT_00101400)->object_id'),
                                 ('((byte)DAT_00101400[2]) & 0x7f',
                                  '((uw_object_hdr_t *)DAT_00101400)->zpos'),
                                 ('DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;',
                                  'DAT_0010190c->speed = 0;')]}

def converted(name):
    result = ORIGINALS[name]
    for before, after in REPLACEMENTS[name]:
        assert before in result, (name, before)
        result = result.replace(before, after)
    return result

def recipe_path(name):
    return HERE / (name.replace('_', '-') + '-fields.json')

def generate(name):
    return json.dumps(dict(function=name, before=ORIGINALS[name], after=converted(name)), indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS:
        recipe_path(name).write_text(generate(name))

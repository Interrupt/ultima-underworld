"""Name creature drop header writes and known loot-table fields."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
ORIGINALS = {'spawn_creature_equipment_drop': 'void spawn_creature_equipment_drop(void *creature_ptr)\n'
                                  '{\n'
                                  '  char *creature = (char *)creature_ptr;\n'
                                  '  int uw_ord2005_rem_161 = 0; int uw_ord2005_rem_162 = 0; int '
                                  'uw_ord2005_rem_163 = 0;\n'
                                  '  undefined2 uVar1;\n'
                                  '  byte bVar2;\n'
                                  '  short sVar3;\n'
                                  '  byte *pbVar4;\n'
                                  '  undefined4 uVar5;\n'
                                  '  char extraout_r1;\n'
                                  '  byte bVar6;\n'
                                  '  byte extraout_r1_00;\n'
                                  '  int extraout_r1_01;\n'
                                  '  uint extraout_r1_02;\n'
                                  '  uint uVar7;\n'
                                  '  uint uVar8;\n'
                                  '  \n'
                                  '  uVar8 = 0;\n'
                                  '  do {\n'
                                  '    bVar6 = *(byte *)(uVar8 + g_despawn_creature_record + 0x20);\n'
                                  '    if ((bVar6 & 1) != 0) {\n'
                                  '      pbVar4 = (byte *)spawn_new_object((bVar6 >> 1 & 0xf) + (bVar6 >> 5 '
                                  "& 3) * '\\x10',0);\n"
                                  '      uVar5 = ce_rand();\n'
                                  '      uw_ord2005_rem_161 = ((int)(uVar5)) % (2);\n'
                                  '      if (uw_ord2005_rem_161 == 0) {\n'
                                  '        uVar5 = ce_rand();\n'
                                  '        sVar3 = DAT_00201b68;\n'
                                  '        extraout_r1 = (char)ordint_divmod((int)DAT_00201b68 << '
                                  '2,uVar5).rem;\n'
                                  "        bVar6 = extraout_r1 + (char)sVar3 * '\\x04';\n"
                                  '      }\n'
                                  '      else {\n'
                                  '        uVar5 = ce_rand();\n'
                                  '        uw_ord2005_rem_162 = ((int)(uVar5)) % (0x40);\n'
                                  '        bVar6 = uw_ord2005_rem_162;\n'
                                  '      }\n'
                                  '      uVar1 = ((uw_object_hdr_t *)pbVar4)->chain_word;\n'
                                  '      bVar2 = (byte)uVar1;\n'
                                  '      ((uw_object_hdr_t *)pbVar4)->chain_word_low = (bVar2 ^ bVar6) & '
                                  '0x3f ^ bVar2;\n'
                                  '      ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)((ushort)uVar1 '
                                  '>> 8);\n'
                                  '      if ((((uw_object_hdr_t *)pbVar4)->object_id & 0x30) == 0x10) {\n'
                                  '        if (g_ranged_type_props[(((uw_object_hdr_t *)pbVar4)->object_id & '
                                  '0xf)].ammo_damage_selector == 0xc0) {  /* byte value 0xc0 (was compared '
                                  'against -0x40, never true for an unsigned byte) */\n'
                                  '          uVar5 = ce_rand();\n'
                                  '          uw_ord2005_rem_163 = ((int)(uVar5)) % (8);\n'
                                  '          uVar7 = (uw_ord2005_rem_163 & 0xffff) + 4;\n'
                                  '          ((uw_object_hdr_t *)pbVar4)->link_word_low = ((uw_object_hdr_t '
                                  "*)pbVar4)->owner ^ (char)uVar7 * '@';\n"
                                  '          ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)(uVar7 >> '
                                  '2);\n'
                                  '        }\n'
                                  '      }\n'
                                  '      object_list_insert_head(creature + 6,pbVar4);\n'
                                  '    }\n'
                                  '    uVar8 = uVar8 + 1 & 0xff;\n'
                                  '  } while (uVar8 < 2);\n'
                                  '}',
 'spawn_creature_misc_item_drop': 'void spawn_creature_misc_item_drop(void *creature_ptr)\n'
                                  '{\n'
                                  '  char *creature = (char *)creature_ptr;\n'
                                  '  int uw_ord2005_rem_164 = 0; int uw_ord2005_rem_165 = 0; int '
                                  'uw_ord2005_rem_166 = 0;\n'
                                  '  ushort uVar1;\n'
                                  '  undefined2 uVar2;\n'
                                  '  byte bVar3;\n'
                                  '  short sVar4;\n'
                                  '  undefined4 uVar5;\n'
                                  "  char *iVar6;  /* was `int` -- truncated spawn_new_object's real pointer "
                                  '*/\n'
                                  '  char extraout_r1;\n'
                                  '  byte bVar7;\n'
                                  '  byte extraout_r1_00;\n'
                                  '  int extraout_r1_01;\n'
                                  '  int extraout_r1_02;\n'
                                  '  uint uVar8;\n'
                                  '\n'
                                  '  uVar8 = 0;\n'
                                  '  do {\n'
                                  '    uVar5 = ce_rand();\n'
                                  '    uVar1 = *(ushort *)(g_despawn_creature_record + uVar8 * 2 + 0x22);\n'
                                  '    uw_ord2005_rem_164 = ((int)(uVar5)) % (0x10);\n'
                                  '    if (uw_ord2005_rem_164 < (int)(uVar1 & 0xf)) {\n'
                                  '      iVar6 = (char *)spawn_new_object(uVar1 >> 4,0);\n'
                                  '      uVar5 = ce_rand();\n'
                                  '      uw_ord2005_rem_165 = ((int)(uVar5)) % (2);\n'
                                  '      if (uw_ord2005_rem_165 == 0) {\n'
                                  '        uVar5 = ce_rand();\n'
                                  '        sVar4 = DAT_00201b68;\n'
                                  '        extraout_r1 = (char)ordint_divmod((int)DAT_00201b68 << '
                                  '2,uVar5).rem;\n'
                                  "        bVar7 = extraout_r1 + (char)sVar4 * '\\x04';\n"
                                  '      }\n'
                                  '      else {\n'
                                  '        uVar5 = ce_rand();\n'
                                  '        uw_ord2005_rem_166 = ((int)(uVar5)) % (0x40);\n'
                                  '        bVar7 = uw_ord2005_rem_166;\n'
                                  '      }\n'
                                  '      uVar2 = ((uw_object_hdr_t *)iVar6)->chain_word;\n'
                                  '      bVar3 = (byte)uVar2;\n'
                                  '      ((uw_object_hdr_t *)iVar6)->chain_word_low = (bVar3 ^ bVar7) & 0x3f '
                                  '^ bVar3;\n'
                                  '      ((uw_object_hdr_t *)iVar6)->chain_word_high = '
                                  '(byte)(char)((ushort)uVar2 >> 8);\n'
                                  '      object_list_insert_head(creature + 6,iVar6);\n'
                                  '    }\n'
                                  '    uVar8 = uVar8 + 1 & 0xff;\n'
                                  '  } while (uVar8 < 2);\n'
                                  '}',
 'spawn_creature_special_item_drop': 'void spawn_creature_special_item_drop(void *creature_ptr)\n'
                                     '{\n'
                                     '  char *creature = (char *)creature_ptr;\n'
                                     '  int uw_ord2005_rem_160 = 0;\n'
                                     '  byte bVar1;\n'
                                     '  undefined4 uVar2;\n'
                                     '  int extraout_r1;\n'
                                     '  char *pObj;  /* was reuse of `uVar2` (undefined4) -- truncated\n'
                                     "                  spawn_new_object's real pointer */\n"
                                     '\n'
                                     '  bVar1 = *(byte *)(g_despawn_creature_record + 0x27);\n'
                                     '  uVar2 = ce_rand();\n'
                                     '  uw_ord2005_rem_160 = ((int)(uVar2)) % (0x10);\n'
                                     '  if (uw_ord2005_rem_160 < (int)(bVar1 & 0xf)) {\n'
                                     '    pObj = (char *)spawn_new_object((bVar1 >> 4) + 0xb0,0);\n'
                                     '    object_list_insert_head(creature + 6,pObj);\n'
                                     '  }\n'
                                     '}'}
REPLACEMENTS = {'spawn_creature_equipment_drop': [('byte *pbVar4;', 'uw_object_hdr_t *pbVar4;'),
                                   ('*(byte *)(uVar8 + g_despawn_creature_record + 0x20)',
                                    '((uw_monster_type_props_t '
                                    '*)g_despawn_creature_record)->weapon_loot[uVar8]'),
                                   ('(byte *)spawn_new_object', 'spawn_new_object'),
                                   ('((uw_object_hdr_t *)pbVar4)->chain_word_low = (bVar2 ^ bVar6) & 0x3f ^ '
                                    'bVar2;\n'
                                    '      ((uw_object_hdr_t *)pbVar4)->chain_word_high = '
                                    '(byte)((ushort)uVar1 >> 8);',
                                    '((uw_object_hdr_t *)pbVar4)->quality = bVar6 & 0x3f;'),
                                   ('((uw_object_hdr_t *)pbVar4)->link_word_low = ((uw_object_hdr_t '
                                    "*)pbVar4)->owner ^ (char)uVar7 * '@';\n"
                                    '          ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)(uVar7 >> '
                                    '2);',
                                    '((uw_object_hdr_t *)pbVar4)->link = uVar7 & 0x3ff;')],
 'spawn_creature_misc_item_drop': [('char *iVar6;', 'uw_object_hdr_t *iVar6;'),
                                   ('*(ushort *)(g_despawn_creature_record + uVar8 * 2 + 0x22)',
                                    '((uw_monster_type_props_t '
                                    '*)g_despawn_creature_record)->item_loot[uVar8]'),
                                   ('(char *)spawn_new_object', 'spawn_new_object'),
                                   ('((uw_object_hdr_t *)iVar6)->chain_word_low = (bVar3 ^ bVar7) & 0x3f ^ '
                                    'bVar3;\n'
                                    '      ((uw_object_hdr_t *)iVar6)->chain_word_high = '
                                    '(byte)(char)((ushort)uVar2 >> 8);',
                                    '((uw_object_hdr_t *)iVar6)->quality = bVar7 & 0x3f;')],
 'spawn_creature_special_item_drop': [('char *pObj;', 'uw_object_hdr_t *pObj;'),
                                      ('*(byte *)(g_despawn_creature_record + 0x27)',
                                       '((uw_monster_type_props_t *)g_despawn_creature_record)->food_loot'),
                                      ('(char *)spawn_new_object', 'spawn_new_object')]}

def converted(name):
    result = ORIGINALS[name]
    result = result.replace('char *creature = (char *)creature_ptr;', 'uw_object_hdr_t *creature = (uw_object_hdr_t *)creature_ptr;')
    result = result.replace('object_list_insert_head(creature + 6,', 'object_list_insert_head(uw_link_word_ptr(creature),')
    for before, after in REPLACEMENTS[name]:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    for pointer in ['pbVar4', 'iVar6', 'pObj']:
        result = result.replace('((uw_object_hdr_t *)'+pointer+')->', pointer+'->')
    return result

def generate(name):
    return json.dumps(dict(function=name, before=ORIGINALS[name], after=converted(name)), indent=2)+'\n'

def recipe_path(name):
    return HERE/(name.replace('spawn_creature_', 'creature-').replace('_', '-')+'.json')

if __name__ == '__main__':
    for name in ORIGINALS:
        recipe_path(name).write_text(generate(name))

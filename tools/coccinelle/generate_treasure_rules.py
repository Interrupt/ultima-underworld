"""Name treasure quantities, coin/value fields and monster-row selection."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
ORIGINALS = {'spawn_creature_death_loot': 'void spawn_creature_death_loot(ushort *creature)\n'
                              '{\n'
                              '  if (!((uw_mobile_object_t *)creature)->npc_loot_spawned) {\n'
                              '    g_despawn_creature_record = &DAT_001007d0 +\n'
                              '                   (((int)(short)*creature & 0xfU) + (short)((*creature '
                              '& 0x30) >> 4) * 0x10) * 0x30;\n'
                              '    spawn_creature_treasure_drop(creature);\n'
                              '    spawn_creature_special_item_drop(creature);\n'
                              '    spawn_creature_equipment_drop(creature);\n'
                              '    spawn_creature_misc_item_drop(creature);\n'
                              '    ((uw_mobile_object_t *)creature)->npc_loot_spawned = 1;\n'
                              '  }\n'
                              '}',
 'spawn_creature_treasure_drop': 'void spawn_creature_treasure_drop(void *creature_ptr)\n'
                                 '{\n'
                                 '  char *creature = (char *)creature_ptr;\n'
                                 '  int uw_ord2005_rem_159 = 0;\n'
                                 '  int iVar1;\n'
                                 '  uint uVar2;\n'
                                 '  byte bVar3;\n'
                                 '  char cVar4;\n'
                                 '  char cVar5;\n'
                                 '  short sVar6;\n'
                                 '  undefined4 uVar7;\n'
                                 '  char extraout_r1;\n'
                                 '  int extraout_r1_00;\n'
                                 '  int extraout_r1_01;\n'
                                 '  int iVar8;\n'
                                 '  char *pObj;  /* was reuse of `iVar8` (int) -- truncated\n'
                                 "                  spawn_new_object's real pointer */\n"
                                 '\n'
                                 '  bVar3 = *(byte *)(g_despawn_creature_record + 0x26);\n'
                                 '  uVar7 = ce_rand();\n'
                                 '  uw_ord2005_rem_159 = ((int)(uVar7)) % (0x10);\n'
                                 '  if (uw_ord2005_rem_159 < (int)(uint)(bVar3 >> 4)) {\n'
                                 '    uVar7 = ce_rand();\n'
                                 '    sVar6 = DAT_00201b68;\n'
                                 '    extraout_r1 = (char)ordint_divmod(DAT_00201b68 * -3 + '
                                 '0x28,uVar7).rem;\n'
                                 '    iVar8 = ((char)sVar6 + -0xb) * 3 + (int)extraout_r1;\n'
                                 '    cVar4 = (char)iVar8;\n'
                                 '    if (iVar8 * 0x1000000 >> 0x18 < 0) {\n'
                                 "      cVar4 = '\\0';\n"
                                 '    }\n'
                                 '    cVar5 = (&DAT_002034b5)[cVar4 * 0xd];\n'
                                 "    if (cVar5 == '\\0') {\n"
                                 "      cVar5 = '\\x01';\n"
                                 '    }\n'
                                 "    if (cVar5 < '\\f') {\n"
                                 "      if (cVar5 < '\\b') {\n"
                                 "        if ('\\x03' < cVar5) {\n"
                                 "          cVar5 = (cVar5 + -2) * '\\x02';\n"
                                 '        }\n'
                                 '      }\n'
                                 '      else {\n'
                                 "        cVar5 = (cVar5 + -5) * '\\x04';\n"
                                 '      }\n'
                                 '    }\n'
                                 '    else {\n'
                                 "      cVar5 = cVar5 * '\\b' + -0x44;\n"
                                 '    }\n'
                                 '    iVar8 = (bVar3 & 0xf) * 4;\n'
                                 '    iVar1 = (int)cVar5;\n'
                                 '    if (iVar8 < iVar1) {\n'
                                 '      uVar7 = ce_rand();\n'
                                 '      extraout_r1_01 = ordint_divmod(iVar1,uVar7).rem;\n'
                                 '      if (iVar8 <= extraout_r1_01) {\n'
                                 '        return;\n'
                                 '      }\n'
                                 "      cVar5 = '\\x01';\n"
                                 '    }\n'
                                 '    else {\n'
                                 '      cVar5 = ordint_divmod(iVar1,iVar8).quot;\n'
                                 '      sVar6 = roll_dice_sum(4,((int)cVar5 << 0x19) >> 0x18);\n'
                                 '      cVar5 = (char)(sVar6 >> 2);\n'
                                 '    }\n'
                                 '    uVar2 = (uint)cVar5;\n'
                                 '    if (0 < (int)uVar2) {\n'
                                 '      pObj = (char *)spawn_new_object((short)cVar4 + 0xa0,0);\n'
                                 '      ((uw_object_hdr_t *)pObj)->link_word_low = ((uw_object_hdr_t '
                                 '*)pObj)->owner | (byte)((uVar2 & 0x3ff) << 6);\n'
                                 '      ((uw_object_hdr_t *)pObj)->link_word_high = (byte)(char)((uVar2 '
                                 '<< 0x16) >> 0x18);\n'
                                 '      object_list_insert_head(creature + 6,pObj);\n'
                                 '    }\n'
                                 '  }\n'
                                 '}'}
REPLACEMENTS = {'spawn_creature_death_loot': [('  if (!((uw_mobile_object_t *)creature)->npc_loot_spawned)',
                                '  uw_mobile_object_t *npc = (uw_mobile_object_t *)creature;\n'
                                '  if (!npc->npc_loot_spawned)'),
                               ('g_despawn_creature_record = &DAT_001007d0 +\n'
                                '                   (((int)(short)*creature & 0xfU) + '
                                '(short)((*creature & 0x30) >> 4) * 0x10) * 0x30;',
                                'g_despawn_creature_record = (char '
                                '*)&g_monster_type_props[npc->hdr.object_id & 0x3f];'),
                               ('((uw_mobile_object_t *)creature)->npc_loot_spawned = 1;',
                                'npc->npc_loot_spawned = 1;')],
 'spawn_creature_treasure_drop': [('char *creature = (char *)creature_ptr;',
                                   'uw_object_hdr_t *creature = (uw_object_hdr_t *)creature_ptr;'),
                                  ('char *pObj;', 'uw_object_hdr_t *pObj;'),
                                  ('*(byte *)(g_despawn_creature_record + 0x26)',
                                   '((uw_monster_type_props_t *)g_despawn_creature_record)->coin_loot'),
                                  ('(&DAT_002034b5)[cVar4 * 0xd]',
                                   '(char)(byte)g_object_type_props[0xa0 + (int)cVar4].monetary_value'),
                                  ('(char *)spawn_new_object', 'spawn_new_object'),
                                  ('((uw_object_hdr_t *)pObj)->link_word_low = ((uw_object_hdr_t '
                                   '*)pObj)->owner | (byte)((uVar2 & 0x3ff) << 6);\n'
                                   '      ((uw_object_hdr_t *)pObj)->link_word_high = '
                                   '(byte)(char)((uVar2 << 0x16) >> 0x18);',
                                   'pObj->link = uVar2 & 0x3ff;'),
                                  ('object_list_insert_head(creature + 6,pObj);',
                                   'object_list_insert_head(uw_link_word_ptr(creature),pObj);')]}

def converted(name):
    result = ORIGINALS[name]
    for before, after in REPLACEMENTS[name]:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result

def recipe_path(name):
    return HERE/('treasure-fields.json' if name == 'spawn_creature_treasure_drop' else 'loot-dispatch-fields.json')

def generate(name):
    return json.dumps(dict(function=name, before=ORIGINALS[name], after=converted(name)), indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS:
        recipe_path(name).write_text(generate(name))

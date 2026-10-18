"""Name BABL placement and barter-finalization fields, retaining callback order."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
ORIGINALS = {'babl_builtin_place_object': 'int babl_builtin_place_object(char *args)\n'
                              '{\n'
                              '  int iVar1;\n'
                              '  ushort uVar2;\n'
                              '  undefined4 uVar3;\n'
                              '  undefined1 *puVar4;\n'
                              '  undefined4 uVar5;\n'
                              '  undefined4 uVar6;\n'
                              '  ushort *puVar7;\n'
                              '  int iVar8;\n'
                              '  void *link_cursor;\n'
                              '  byte *pbVar9;\n'
                              '  \n'
                              '  uVar3 = babl_read_var_word((int)*(short *)(args + -6));\n'
                              '  puVar4 = (undefined1 *)get_object_record_by_slot_index(uVar3);\n'
                              '  uVar5 = babl_read_var_word((int)*(short *)(args + -4));\n'
                              '  uVar6 = babl_read_var_word((int)*(short *)(args + -2));\n'
                              '  puVar7 = (ushort *)((char *)&DAT_00100674->hdr.link_word);\n'
                              '  uVar2 = *puVar7;\n'
                              '  if ((uVar2 & 0xffc0) != 0) {\n'
                              '    do {\n'
                              '      if ((uint)(uVar2 >> 6) == (int)(short)uVar3) break;\n'
                              '      /* Was called with no argument (also true at ~30 other call sites '
                              'throughout this file) --\n'
                              '         verified against real ARM disassembly (Ghidra, UU.exe) that '
                              'every one of them DOES set up a\n'
                              "         real r0 argument in the compiled binary; Ghidra's decompiler "
                              'just failed to show it... */\n'
                              '      link_cursor = resolve_object_link(puVar7);\n'
                              '      puVar7 = (ushort *)((char *)link_cursor + 4);\n'
                              '      uVar2 = *puVar7;\n'
                              '    } while ((uVar2 & 0xffc0) != 0);\n'
                              '  }\n'
                              '  if ((*puVar7 & 0xffc0) != 0) {\n'
                              '    object_list_unlink((char *)&DAT_00100674->hdr.link_word,puVar4);\n'
                              '  }\n'
                              '  iVar8 = (int)(short)uVar5;\n'
                              '  if (iVar8 < 0) {\n'
                              '    DAT_00202c84 = 1;\n'
                              '    place_object_in_world(g_player_object->tile_word >> 7 & 0x1f8,\n'
                              '                          g_player_object->tile_word >> 1 & 0x1f8,\n'
                              '                          g_player_object->hdr.zpos,\n'
                              '                          puVar4,6,1);\n'
                              '    DAT_00202c84 = 0;\n'
                              'LAB_0001818c:\n'
                              '    uVar3 = 1;\n'
                              '  }\n'
                              '  else {\n'
                              '    if ((((0 < iVar8) && (iVar8 < 0x40)) && (iVar1 = (int)(short)uVar6, '
                              '0 < iVar1)) &&\n'
                              '       (iVar1 < 0x40)) {\n'
                              '      pbVar9 = (byte *)tilemap_lookup(uVar5,uVar6);\n'
                              '      uVar2 = ((uw_object_hdr_t *)puVar4)->position_word;\n'
                              '      ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)(uVar2 & '
                              '0xff80) | *pbVar9 >> 1 & 0x78;\n'
                              '      ((uw_object_hdr_t *)puVar4)->position_word_high = (char)((uVar2 & '
                              '0xff80) >> 8);\n'
                              '      iVar8 = check_object_placement_clearance(((uw_object_hdr_t '
                              '*)puVar4)->object_id,\n'
                              '                                               uVar3,(iVar8 << 0x13) >> '
                              '0x10,\n'
                              '                                               (iVar1 << 0x13) >> 0x10,\n'
                              '                                               (ushort)(*pbVar9 >> 4) << '
                              '3,1,\n'
                              '                                               '
                              '(g_object_type_props[(((uw_object_hdr_t '
                              '*)puVar4)->object_id)].collision_radius) + 4);\n'
                              '      if (iVar8 != 0) {\n'
                              '        object_list_append_tail(pbVar9 + 2,puVar4);\n'
                              '        settle_dropped_object(puVar4,uVar5,uVar6,1);\n'
                              '        goto LAB_0001818c;\n'
                              '      }\n'
                              '    }\n'
                              '    uVar3 = 0;\n'
                              '  }\n'
                              '  return uVar3;\n'
                              '}',
 'finalize_player_barter_items': 'void finalize_player_barter_items()\n'
                                 '\n'
                                 '{\n'
                                 '  short sVar1;\n'
                                 '  ushort *puVar2;\n'
                                 '  ushort *puVar3;\n'
                                 '  int iVar4;\n'
                                 '  short *psVar5;\n'
                                 '  short local_2c;\n'
                                 '  int local_28;\n'
                                 '  \n'
                                 '  decrement_cursor_hide_depth();\n'
                                 '  local_2c = 0;\n'
                                 '  local_28 = 0;\n'
                                 '  do {\n'
                                 '    psVar5 = &DAT_000bbfd0 + local_28;\n'
                                 '    if (0 < *psVar5) {\n'
                                 '      /* BUG FIX: was `check_npc_item_preference()` with no '
                                 'arguments, relying on leftover register\n'
                                 '         state (same dropped-argument bug class documented throughout '
                                 'this project) -- *psVar5 (the\n'
                                 "         slot's item-value, already used the very next line) is the "
                                 'value that belongs here... */\n'
                                 '      if (((&DAT_000bbf98)[local_28] != 0) && (sVar1 = '
                                 'check_npc_item_preference(*psVar5), sVar1 != -1)) {\n'
                                 '        puVar2 = (ushort '
                                 '*)get_object_record_by_slot_index((int)*psVar5);\n'
                                 '        puVar3 = (ushort *)resolve_object_link((char '
                                 '*)&DAT_00100674->hdr.link_word);\n'
                                 '        if ((((uw_object_hdr_t *)puVar2)->object_id) == 0xa1) {\n'
                                 '          for (; puVar3 != (ushort *)0x0; puVar3 = (ushort '
                                 '*)resolve_object_link(puVar3 + 2)) {\n'
                                 '            if ((((((uw_object_hdr_t *)puVar2)->is_quant != 0) && '
                                 '(((uw_object_hdr_t *)puVar3)->is_quant != 0)) &&\n'
                                 '                 ((((uw_object_hdr_t *)puVar2)->link & 0x200) == 0)) '
                                 '&&\n'
                                 '                ((((((uw_object_hdr_t *)puVar3)->link & 0x200) == 0 '
                                 '&& (((((uw_object_hdr_t *)puVar3)->type_flags ^ ((uw_object_hdr_t '
                                 '*)puVar2)->type_flags) & 0x1ff) == 0)) &&\n'
                                 '                  ((ushort)((((uw_object_hdr_t *)puVar3)->link) + '
                                 '(((uw_object_hdr_t *)puVar2)->link)) < 999)))) {\n'
                                 '              iVar4 = (((uw_object_hdr_t *)puVar3)->link << 6) + '
                                 '(((uw_object_hdr_t *)puVar2)->link << 6);\n'
                                 '              ((uw_object_hdr_t *)puVar3)->link_word_low = '
                                 '(byte)iVar4 ^ ((uw_object_hdr_t *)puVar3)->owner;\n'
                                 '              ((uw_object_hdr_t *)puVar3)->link_word_high = '
                                 '(byte)(char)((uint)iVar4 >> 8);\n'
                                 '              free_object_slot(puVar2);\n'
                                 '              puVar2 = (ushort *)0x0;\n'
                                 '              break;\n'
                                 '            }\n'
                                 '          }\n'
                                 '        }\n'
                                 '        if (puVar2 != (ushort *)0x0) {\n'
                                 '          object_list_insert_head((char '
                                 '*)&DAT_00100674->hdr.link_word,puVar2);\n'
                                 '        }\n'
                                 '        restore_captured_grtile_backdrop((&DAT_000bc028)[local_28]);\n'
                                 '        (&DAT_000bbf98)[local_28] = 0;\n'
                                 '        *psVar5 = 0;\n'
                                 '        draw_hotspot_crosshair_marker(1,(int)local_2c);\n'
                                 '      }\n'
                                 '    }\n'
                                 '    iVar4 = (local_28 + 1) * 0x10000;\n'
                                 '    local_28 = iVar4 >> 0x10;\n'
                                 '    local_2c = (short)((uint)iVar4 >> 0x10);\n'
                                 '    if (3 < local_28) {\n'
                                 '      cursor_show_idle_tick();\n'
                                 '      debug_noop_checkpoint();\n'
                                 '      return;\n'
                                 '    }\n'
                                 '  } while( true );\n'
                                 '}'}
REPLACEMENTS = {'babl_builtin_place_object': [('undefined1 *puVar4;', 'uw_object_hdr_t *puVar4;'),
                               ('(undefined1 *)get_object_record_by_slot_index',
                                'get_object_record_by_slot_index'),
                               ('void *link_cursor;', 'uw_object_hdr_t *link_cursor;'),
                               ('byte *pbVar9;', 'uw_tile_t *pbVar9;'),
                               ('puVar7 = (ushort *)((char *)&DAT_00100674->hdr.link_word);',
                                'puVar7 = &DAT_00100674->hdr.link_word;'),
                               ('puVar7 = (ushort *)((char *)link_cursor + 4);',
                                'puVar7 = &link_cursor->chain_word;'),
                               ('object_list_unlink((char *)&DAT_00100674->hdr.link_word,puVar4);',
                                'object_list_unlink(&DAT_00100674->hdr.link_word,puVar4);'),
                               ('g_player_object->tile_word >> 7 & 0x1f8',
                                'g_player_object->tile_x << 3'),
                               ('g_player_object->tile_word >> 1 & 0x1f8',
                                'g_player_object->tile_y << 3'),
                               ('pbVar9 = (byte *)tilemap_lookup',
                                'pbVar9 = (uw_tile_t *)tilemap_lookup'),
                               ('((uw_object_hdr_t *)puVar4)->position_word_low = (byte)(uVar2 & '
                                '0xff80) | *pbVar9 >> 1 & 0x78;\n'
                                '      ((uw_object_hdr_t *)puVar4)->position_word_high = (char)((uVar2 '
                                '& 0xff80) >> 8);',
                                'puVar4->zpos = pbVar9->floor_height << 3;'),
                               ('(ushort)(*pbVar9 >> 4) << 3', '(ushort)pbVar9->floor_height << 3'),
                               ('object_list_append_tail(pbVar9 + 2,puVar4);',
                                'object_list_append_tail((ushort *)((byte *)pbVar9 + 2),puVar4);')],
 'finalize_player_barter_items': [('ushort *puVar2;', 'uw_object_hdr_t *puVar2;'),
                                  ('ushort *puVar3;', 'uw_object_hdr_t *puVar3;'),
                                  ('(ushort *)get_object_record_by_slot_index',
                                   'get_object_record_by_slot_index'),
                                  ('(ushort *)resolve_object_link((char *)&DAT_00100674->hdr.link_word)',
                                   'resolve_object_link(&DAT_00100674->hdr.link_word)'),
                                  ('(ushort *)0x0', 'NULL'),
                                  ('(ushort *)resolve_object_link(puVar3 + 2)',
                                   'resolve_object_link(&puVar3->chain_word)'),
                                  ('            if ((((((uw_object_hdr_t *)puVar2)->is_quant != 0) && '
                                   '(((uw_object_hdr_t *)puVar3)->is_quant != 0)) &&\n'
                                   '                 ((((uw_object_hdr_t *)puVar2)->link & 0x200) == '
                                   '0)) &&\n'
                                   '                ((((((uw_object_hdr_t *)puVar3)->link & 0x200) == 0 '
                                   '&& (((((uw_object_hdr_t *)puVar3)->type_flags ^ ((uw_object_hdr_t '
                                   '*)puVar2)->type_flags) & 0x1ff) == 0)) &&\n'
                                   '                  ((ushort)((((uw_object_hdr_t *)puVar3)->link) + '
                                   '(((uw_object_hdr_t *)puVar2)->link)) < 999)))) {\n',
                                   '            if (puVar2->is_quant != 0 && puVar3->is_quant != 0 &&\n'
                                   '                puVar2->link < 512 && puVar3->link < 512 &&\n'
                                   '                puVar3->object_id == puVar2->object_id &&\n'
                                   '                (ushort)(puVar3->link + puVar2->link) < 999) {\n'),
                                  ('((uw_object_hdr_t *)puVar3)->link_word_low = (byte)iVar4 ^ '
                                   '((uw_object_hdr_t *)puVar3)->owner;\n'
                                   '              ((uw_object_hdr_t *)puVar3)->link_word_high = '
                                   '(byte)(char)((uint)iVar4 >> 8);',
                                   'puVar3->link = (iVar4 >> 6) & 0x3ff;'),
                                  ('object_list_insert_head((char '
                                   '*)&DAT_00100674->hdr.link_word,puVar2);',
                                   'object_list_insert_head(&DAT_00100674->hdr.link_word,puVar2);')]}

def converted(name):
    result = ORIGINALS[name]
    for before, after in REPLACEMENTS[name]:
        assert result.count(before) == (3 if before == '(ushort *)0x0' else 1), before
        result = result.replace(before, after)
    for pointer in ('puVar2', 'puVar3', 'puVar4'):
        result = result.replace('((uw_object_hdr_t *)'+pointer+')->', pointer+'->')
    return result

def recipe_path(name):
    return HERE/('babl-placement-fields.json' if name == 'babl_builtin_place_object' else 'barter-finalize-fields.json')

def generate(name):
    return json.dumps(dict(function=name, before=ORIGINALS[name], after=converted(name)), indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS: recipe_path(name).write_text(generate(name))

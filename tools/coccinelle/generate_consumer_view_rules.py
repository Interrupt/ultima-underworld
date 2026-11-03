"""Name reviewed collision, player-coordinate and trap-header byte consumers."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
SOURCES = {'collision_response_default': 'movement.c',
 'debug_print_player_position': 'player.c',
 'process_nearby_background_traps': 'traps.c'}
ORIGINALS = {'collision_response_default': 'int collision_response_default(ushort *object)\n'
                               '{\n'
                               '  ushort uVar1;\n'
                               '  undefined4 *puVar2;\n'
                               '  char *iVar3;\n'
                               '  undefined4 uVar4;\n'
                               '  uint uVar5;\n'
                               '  \n'
                               '  uVar1 = *object;\n'
                               '  if ((uVar1 & 0x1000) != 0) {\n'
                               '    if (DAT_002048d0 == 0) {\n'
                               '      DAT_002048d0 = -4;\n'
                               '    }\n'
                               '    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;\n'
                               '    DAT_00101924 = 1;\n'
                               '    uVar4 = 0;\n'
                               '    puVar2 = &DAT_00101734;\n'
                               'LAB_0002bb2c:\n'
                               '    *puVar2 = uVar4;\n'
                               '    return 0;\n'
                               '  }\n'
                               '  if ((uVar1 & 0x10) != 0) {\n'
                               '    if ((uVar1 & 0xf8) == 0x10) {\n'
                               '      DAT_00101924 = 1;\n'
                               '      DAT_00101734 = 0;\n'
                               '      '
                               'spawn_scheduled_effect_object(DAT_0010190c,6,3,0,0,(short)(char)((ushort)DAT_002048c0 '
                               '>> 8),\n'
                               '                   (short)(char)((ushort)_DAT_002048c2 >> 8));\n'
                               '      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xcc | '
                               '0xc;\n'
                               '      uVar5 = DAT_0010190c->goal_word & 0xfff;\n'
                               '      DAT_0010190c->goal_word_low = (byte)(char)uVar5;\n'
                               '      DAT_0010190c->goal_word_high = (byte)(uVar5 >> 8) | 0x30;\n'
                               '      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;\n'
                               '      return 1;\n'
                               '    }\n'
                               '    if ((DAT_0010190c->animation_flags & 0x80) == 0) {\n'
                               '      DAT_00101924 = 1;\n'
                               '      DAT_002048c6 = 0;\n'
                               '      DAT_002048c8 = 0;\n'
                               '      return 1;\n'
                               '    }\n'
                               '  }\n'
                               '  if ((((uVar1 & 0x800) != 0) && ((DAT_00101414 & 0x800) == 0)) ||\n'
                               '     (((uVar1 & 0x20) != 0 && ((DAT_00101414 & 0x20) == 0)))) {\n'
                               '    if ((DAT_0010190c->animation_flags & 0x80) == 0) {\n'
                               '      DAT_00101924 = 1;\n'
                               '      DAT_002048c6 = 0;\n'
                               '      DAT_002048c8 = 0;\n'
                               '      return 1;\n'
                               '    }\n'
                               '    return 0;\n'
                               '  }\n'
                               '  if ((uVar1 & 0x300) != 0) {\n'
                               '    puVar2 = &DAT_00101924;\n'
                               '    uVar4 = 1;\n'
                               '    goto LAB_0002bb2c;\n'
                               '  }\n'
                               '  if ((uVar1 & 0x400) != 0) {\n'
                               '    iVar3 = find_nearby_door_in_candidates(&DAT_00101424,&DAT_00101428);\n'
                               '    if (iVar3 != 0) {\n'
                               '      DAT_00101560 = 1;\n'
                               '      DAT_00101924 = 1;\n'
                               '      DAT_001013fc = 1;\n'
                               '      DAT_00101904 = iVar3;\n'
                               '      goto LAB_0002bbc4;\n'
                               '    }\n'
                               '    DAT_00101924 = 1;\n'
                               '    DAT_001013fc = 1;\n'
                               '    DAT_00101904 = get_first_nearby_candidate_object();\n'
                               '  }\n'
                               '  if (DAT_00101924 == 0) {\n'
                               '    return 0;\n'
                               '  }\n'
                               'LAB_0002bbc4:\n'
                               '  if (DAT_00101734 != 0) {\n'
                               '    return 1;\n'
                               '  }\n'
                               '  return 0;\n'
                               '}',
 'debug_print_player_position': 'void debug_print_player_position(const char *label)\n'
                                '{\n'
                                '  if (g_opts.debug)\n'
                                '    fprintf(stderr, "[playerpos:%s] fine=(%d,%d)=world(%g,%g) obj_bytes '
                                'tile=(%d,%d)\\n",\n'
                                '            label, (int)DAT_00204880, (int)DAT_00204882,\n'
                                '            (double)DAT_00204880 / 256.0, (double)DAT_00204882 / 256.0,\n'
                                '            (int)((byte) g_player_object->tile_word_high >> 2),\n'
                                '            (int)(g_player_object->npc_yhome));\n'
                                '}',
 'process_nearby_background_traps': 'void process_nearby_background_traps(int target_present)\n'
                                    '{\n'
                                    '  undefined2 uVar1;\n'
                                    '  /* find_object_in_world/resolve_object_link now return real pointers '
                                    '(ushort-pointer /\n'
                                    '     void-pointer) -- was `int iVar2`/`iVar3`, truncating them on this '
                                    '64-bit host exactly like the\n'
                                    "     sibling fix in objects.c's "
                                    'find_object_in_world/find_object_in_chain. iVar3 keeps its later... */\n'
                                    '  ushort *pObj;\n'
                                    '  char *pbVar5;\n'
                                    '  int iVar3;\n'
                                    '  int iVar4;\n'
                                    '  short local_14;\n'
                                    '  short local_12;\n'
                                    '\n'
                                    '  local_14 = 0;\n'
                                    '  local_12 = 0;\n'
                                    '  pObj = find_object_in_world(6,0,7,&local_14,&local_12);\n'
                                    '  while (pObj != 0) {\n'
                                    '    if ((((uw_object_hdr_t *)pObj)->type_flags_high & 0x1e) == 0) {\n'
                                    '      pbVar5 = resolve_object_link((char *)pObj + 6);\n'
                                    '      /* HACK: was a bare `object_ptr_in_arena();` -- dropped argument, '
                                    'the same class of bug fixed\n'
                                    '         repeatedly elsewhere in this file. object_ptr_in_arena takes '
                                    'exactly one argument at every\n'
                                    '         other call site in this codebase... */\n'
                                    '      iVar4 = object_ptr_in_arena(pbVar5);\n'
                                    '      if (iVar4 != 0) {\n'
                                    '        uVar1 = *(undefined2 *)(pbVar5 + 0xd);\n'
                                    '        *(char *)(pbVar5 + 0xd) = (char)uVar1;\n'
                                    '        *(byte *)(pbVar5 + 0xe) = (byte)((ushort)uVar1 >> 8) | 1;\n'
                                    '        iVar3 = '
                                    'is_out_of_player_range(target_present,(int)local_14,(int)local_12);\n'
                                    '        if (iVar3 != 0) {\n'
                                    '          dispatch_trap_type_effect(pObj,(int)local_14,(int)local_12);\n'
                                    '        }\n'
                                    '      }\n'
                                    '    }\n'
                                    '    local_14 = local_14 + 1;\n'
                                    '    pObj = find_object_in_world(6,0,7,&local_14,&local_12);\n'
                                    '  }\n'
                                    '}'}
REPLACEMENTS = {'collision_response_default': [('DAT_0010190c->goal_word_low = (byte)(char)uVar5;\n'
                                 '      DAT_0010190c->goal_word_high = (byte)(uVar5 >> 8) | 0x30;',
                                 'DAT_0010190c->npc_animation_frame = 3;')],
 'debug_print_player_position': [('(int)((byte) g_player_object->tile_word_high >> 2)',
                                  '(int)g_player_object->tile_x'),
                                 ('(int)(g_player_object->npc_yhome)', '(int)g_player_object->tile_y')],
 'process_nearby_background_traps': [('ushort *pObj;', 'uw_object_hdr_t *pObj;'),
                                     ('(((uw_object_hdr_t *)pObj)->type_flags_high & 0x1e) == 0',
                                      '(pObj->flags_res == 0 && pObj->enchanted == 0)'),
                                     ('pbVar5 = resolve_object_link((char *)pObj + 6);',
                                      'pbVar5 = (char *)resolve_object_link(&pObj->link_word);'),
                                     ('dispatch_trap_type_effect(pObj,',
                                      'dispatch_trap_type_effect((ushort *)pObj,')]}

def converted(name):
    result=ORIGINALS[name]
    for before,after in REPLACEMENTS[name]:
        assert before in result,(name,before)
        result=result.replace(before,after)
    return result

def recipe_path(name):
    return HERE/(name.replace('_','-')+'-fields.json')

def generate(name):
    return json.dumps(dict(function=name,before=ORIGINALS[name],after=converted(name)),indent=2)+'\n'

if __name__ == '__main__':
    for name in ORIGINALS:recipe_path(name).write_text(generate(name))

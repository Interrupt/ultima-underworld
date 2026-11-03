"""Name default interaction stack fields while preserving live target rereads."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'interact_default'
ORIGINAL = ('void interact_default()\n'
 '{\n'
 '  int iVar1;\n'
 '  int iVar2;\n'
 '  ushort *puVar3;\n'
 '\n'
 '  puVar3 = (ushort *)0x0;\n'
 '  iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);\n'
 '  iVar2 = target_line_of_sight((int)DAT_000858c4,g_interact_target);\n'
 '  if (DAT_002020ec == 0) {\n'
 '    if (DAT_002020e0 != 0) {\n'
 '      iVar1 = object_ptr_in_arena(g_interact_target);\n'
 '      if ((iVar1 != 0) && ((*g_interact_target & 0x1c0) == 0x40)) {\n'
 '        interact_talk_npc();\n'
 '        return;\n'
 '      }\n'
 '      interact_use();\n'
 '      return;\n'
 '    }\n'
 '    if ((*g_interact_target & 0x1ff) == 0x1ca) {\n'
 '      if ((iVar1 != 0) && (iVar2 == 0)) {\n'
 '        use_object_on_target(g_player_object,g_interact_target,0);\n'
 '      }\n'
 '      goto LAB_0003f11c;\n'
 '    }\n'
 '    iVar1 = 0x60;\n'
 '  }\n'
 '  else {\n'
 '    if ((iVar1 != 0) && (iVar2 == 0)) {\n'
 '      if (((*g_interact_target & 0x8000) != 0) &&\n'
 '         (((g_interact_target[3] & 0x8000) == 0 && ((g_interact_target[3] & 0xffc0) != 0x40)))) {\n'
 '        /* BUG FIX: was `FUN_000470fc();` -- dropped its only argument. g_interact_target (the\n'
 '           object this whole "grab" handler is operating on throughout this function) is the obvious\n'
 '           intended argument -- same dropped-argument idiom fixed repeatedly elsewhere this session. */\n'
 '        puVar3 = (ushort *)prompt_split_object_stack((undefined1 *)g_interact_target);\n'
 '        if (puVar3 == (ushort *)0x0) {\n'
 '          return;\n'
 '        }\n'
 '        if (puVar3 != g_interact_target) {\n'
 '          object_list_insert_head(g_interact_target + 2,puVar3);\n'
 '        }\n'
 '      }\n'
 '      iVar1 = check_object_carry_weight(g_interact_target);\n'
 '      if (iVar1 == 0) {\n'
 '        if ((puVar3 != (ushort *)0x0) && (puVar3 != g_interact_target)) {\n'
 '          iVar1 = (g_interact_target[3] & 0xffc0) + (puVar3[3] & 0xffc0);\n'
 '          *(byte *)(g_interact_target + 3) = (byte)iVar1 ^ (byte)g_interact_target[3] & 0x3f;\n'
 '          *(char *)((char *)g_interact_target + 7) = (char)((uint)iVar1 >> 8);\n'
 '          object_list_unlink(g_interact_target + 2,puVar3);\n'
 '        }\n'
 '        print_scroll_message_by_id(0x5f);\n'
 '        return;\n'
 '      }\n'
 '      iVar1 = object_or_contents_has_type(g_interact_target,0x126);\n'
 '      if (iVar1 != 0) {\n'
 '        *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf0;\n'
 '      }\n'
 '      emit_noise_alert(g_interact_target,0);\n'
 '      finalize_object_pickup(g_interact_target);\n'
 '      g_cursor_holding_state = 1;\n'
 '      attach_picked_up_object_to_cursor(g_interact_target);\n'
 '      return;\n'
 '    }\n'
 '    iVar1 = (short)iVar1 + 0x5d;\n'
 '  }\n'
 '  print_scroll_message_by_id(iVar1);\n'
 'LAB_0003f11c:\n'
 '  wait_for_click_release(1);\n'
 '}')
REPLACEMENTS = [('ushort *puVar3;', 'uw_object_hdr_t *puVar3;'),
 ('puVar3 = (ushort *)0x0;', 'puVar3 = NULL;'),
 ('object_ptr_in_arena(g_interact_target)', 'object_ptr_in_arena((uw_object_hdr_t *)g_interact_target)'),
 ('*g_interact_target & 0x1c0', '((uw_object_hdr_t *)g_interact_target)->object_id & 0x1c0'),
 ('*g_interact_target & 0x1ff', '((uw_object_hdr_t *)g_interact_target)->object_id'),
 ('(*g_interact_target & 0x8000) != 0', '((uw_object_hdr_t *)g_interact_target)->is_quant != 0'),
 ('(g_interact_target[3] & 0x8000) == 0', '((uw_object_hdr_t *)g_interact_target)->link < 512'),
 ('(g_interact_target[3] & 0xffc0) != 0x40', '((uw_object_hdr_t *)g_interact_target)->link != 1'),
 ('(ushort *)prompt_split_object_stack', '(uw_object_hdr_t *)prompt_split_object_stack'),
 ('puVar3 == (ushort *)0x0', 'puVar3 == NULL'),
 ('puVar3 != (ushort *)0x0', 'puVar3 != NULL'),
 ('puVar3 != g_interact_target', 'puVar3 != (uw_object_hdr_t *)g_interact_target'),
 ('g_interact_target[3] & 0xffc0', '((uw_object_hdr_t *)g_interact_target)->link << 6'),
 ('puVar3[3] & 0xffc0', 'puVar3->link << 6'),
 ('*(byte *)(g_interact_target + 3) = (byte)iVar1 ^ (byte)g_interact_target[3] & 0x3f;\n'
  '          *(char *)((char *)g_interact_target + 7) = (char)((uint)iVar1 >> 8);',
  '((uw_object_hdr_t *)g_interact_target)->link = ((uint)iVar1 >> 6) & 0x3ff;'),
 ('object_list_insert_head(g_interact_target + 2,puVar3);',
  'object_list_insert_head(&((uw_object_hdr_t *)g_interact_target)->chain_word,puVar3);'),
 ('object_list_unlink(g_interact_target + 2,puVar3);',
  'object_list_unlink(&((uw_object_hdr_t *)g_interact_target)->chain_word,puVar3);'),
 ('puVar3', 'split_object')]

def converted():
    result=ORIGINAL
    for before,after in REPLACEMENTS:
        assert before in result,before
        result=result.replace(before,after)
    return result

def generate():
    return json.dumps(dict(function=FUNCTION,before=ORIGINAL,after=converted()),indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'interaction-stack-fields.json').write_text(generate())

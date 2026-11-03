"""Name the equipped-player ID write without altering the surrounding message path."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'damage_equipped_item_in_slot'
ORIGINAL = ('int damage_equipped_item_in_slot(int slot, byte damage, byte damage_type, short reaction_mode, int '
 'report_flag)\n'
 '{\n'
 '  char *wptr_30396;\n'
 '  byte bVar1;\n'
 '  char cVar2;\n'
 '  undefined2 uVar3;\n'
 '  short sVar4;\n'
 '  undefined2 *puVar5;\n'
 '  int iVar6;\n'
 '  undefined4 uVar7;\n'
 '  char *pcVar8;\n'
 '  char *pcVar9;\n'
 "  char *pDropObj;  /* was `uVar7` (undefined4) for this use -- truncated spawn_new_object's real object "
 'pointer; uVar7\n'
 '   itself is only reused as a 0/1 message-select flag right after, so this needed a separate typed\n'
 '   local */\n'
 '  char acStackY_85aec [547480];\n'
 '  char acStack_4d [53];\n'
 '  \n'
 '  puVar5 = (undefined2 *)get_equipped_item_at_slot(slot);\n'
 '  if (puVar5 == (undefined2 *)0x0) {\n'
 '    return 0xfffffffe;\n'
 '  }\n'
 '  if (reaction_mode != 2) {\n'
 '    if (reaction_mode == 0) {\n'
 '      if ((((uw_object_hdr_t *)puVar5)->object_id & 0x1f0) != 0) {\n'
 '        return 0xfffffffe;\n'
 '      }\n'
 '    }\n'
 '    else {\n'
 '      iVar6 = is_valid_equipment_slot_item(((uw_object_hdr_t *)puVar5)->object_id,\n'
 '                                           slot);\n'
 '      if (iVar6 == 0) {\n'
 '        return 0xfffffffe;\n'
 '      }\n'
 '    }\n'
 '  }\n'
 '  bVar1 = ((uw_object_hdr_t *)puVar5)->chain_word_low;\n'
 '  iVar6 = apply_typed_damage_to_object(puVar5,0,0xffffffff,-1,damage,damage_type);\n'
 '  if (iVar6 == 0) {\n'
 '    if ((((uw_object_hdr_t *)puVar5)->quality) == (bVar1 & 0x3f)) {\n'
 '      return 0xffffffff;\n'
 '    }\n'
 '    pcVar9 = s_damaged__00085aa8;\n'
 '    uVar7 = 0;\n'
 '  }\n'
 '  else {\n'
 '    if (report_flag != 0) {\n'
 '      sVar4 = rand_below(2);\n'
 '      pDropObj = (char *)spawn_new_object(sVar4 + 0xd5,0);\n'
 '      drop_object_near_target(g_player_object,pDropObj,6,0);\n'
 '    }\n'
 '    decrement_object_count(puVar5);\n'
 '    discard_misplaced_object(0,puVar5,1);\n'
 '    refresh_player_equipment_effects();\n'
 '    pcVar9 = s_destroyed__00085ab4;\n'
 '    uVar7 = 1;\n'
 '  }\n'
 '  pcVar8 = DAT_00085aa0;\n'
 '    wptr_30396 = acStackY_85aec;\n'
 '  do {\n'
 '    cVar2 = *pcVar8;\n'
 '    *wptr_30396 = cVar2; wptr_30396 = wptr_30396 + 1;\n'
 '    pcVar8 = pcVar8 + 1;\n'
 "  } while (cVar2 != '\\0');\n"
 '  if (puVar5 == g_player_object) {\n'
 '    uVar3 = ((uw_object_hdr_t *)puVar5)->type_flags;\n'
 '    ((uw_object_hdr_t *)puVar5)->type_flags_low = 0xf;\n'
 '    ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)((ushort)uVar3 >> 8) & 0xfe;\n'
 '  }\n'
 '  iVar6 = ce_strlen(acStack_4d + 1);\n'
 '  build_object_display_name(acStack_4d + iVar6 + 1,puVar5,0,0);\n'
 '  iVar6 = ce_strlen(acStack_4d + 1);\n'
 "  if (acStack_4d[iVar6] == 's') {\n"
 '    pcVar8 = s_were_00085a98;\n'
 '  }\n'
 '  else {\n'
 '    pcVar8 = DAT_00085a90;\n'
 '  }\n'
 '  ce_strcat(acStack_4d + 1,pcVar8);\n'
 '  ce_strcat(acStack_4d + 1,pcVar9);\n'
 '  message_scroll_print_wrapped(acStack_4d + 1);\n'
 '  redraw_backpack_slot_widget(slot);\n'
 '  return uVar7;\n'
 '}')
BEFORE = ('((uw_object_hdr_t *)puVar5)->type_flags_low = 0xf;\n'
 '    ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)((ushort)uVar3 >> 8) & 0xfe;')
AFTER = '((uw_object_hdr_t *)puVar5)->object_id = 0xf;'

def converted():
    assert ORIGINAL.count(BEFORE)==1
    return ORIGINAL.replace(BEFORE,AFTER)

def player_write(body):
    marker='  if (puVar5 == g_player_object) {'
    assert body.count(marker)==1
    start=body.index(marker)
    end=body.index('\n  }',start)+4
    return body[start:end]

def generate():
    return json.dumps(dict(function=FUNCTION,before=ORIGINAL,after=converted()),indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'equipment-player-id-fields.json').write_text(generate())

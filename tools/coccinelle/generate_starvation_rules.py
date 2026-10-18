"""Name the spawned starvation object header while retaining full captures."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
FUNCTION = 'handle_starvation_penalty'
ORIGINAL = r"""void handle_starvation_penalty()

{
  int uw_ord2005_rem_148 = 0;
  byte bVar1;
  undefined1 uVar2;
  byte bVar3;
  undefined2 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  short extraout_r1;
  char *pNewObj;

  if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
    g_player_object->npc_hp = 4;
    return;
  }
  stop_current_audio_handle_dup();
  play_music_track(10,1);
  grant_experience_points((int)((uint)(*(uint3 *)(DAT_00086df8 + 0x4e) >> 3) * -0x10000) >> 0x10);
  full_dungeon_redraw();
  weapon_overlay_flash_hold(5);
  cancel_weapon_swing();
  if (g_selected_object != 0) {
    if ((g_cursor_holding_state == 1) || (g_cursor_holding_state == 0)) {
      drop_object_near_target(g_player_object,g_selected_object,6,0);
    }
    else if (g_cursor_holding_state != 2) goto LAB_00072374;
    g_cursor_holding_state = 0;
    g_selected_object = 0;
    pop_cursor_icon(3);
  }
LAB_00072374:
  uVar5 = ce_rand();
  uw_ord2005_rem_148 = ((int)(uVar5)) % (5);
  /* Was `iVar6 = spawn_new_object(...)` (plain int) -- spawn_new_object now really returns a fresh
     object pointer (see its fix) instead of always 0, so storing it in a 32-bit int truncates it on
     this 64-bit host. */
  pNewObj = (char *)spawn_new_object(uw_ord2005_rem_148 + 0xc2,0);
  iVar7 = place_object_in_world((int)DAT_00204880 >> 5,(int)DAT_00204882 >> 5,(int)DAT_00204884 >> 3,
                       pNewObj,0,1);
  if (iVar7 != 0) {
    uVar4 = ((uw_object_hdr_t *)pNewObj)->position_word;
    bVar1 = (byte)uVar4;
    ((uw_object_hdr_t *)pNewObj)->position_word_low = (g_player_object->hdr.position_word_low ^ bVar1) & 0x7f ^ bVar1;
    ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)(char)((ushort)uVar4 >> 8);
    ((uw_object_hdr_t *)pNewObj)->owner = 0x3f;
    ((uw_object_hdr_t *)pNewObj)->link_word_high = ((uw_object_hdr_t *)pNewObj)->link_word_high;
    uVar8 = (((uw_object_hdr_t *)pNewObj)->position_word ^ g_player_object->hdr.position_word) & 0x1fff ^
            (uint) g_player_object->hdr.position_word;
    uVar2 = (undefined1)uVar8;
    ((uw_object_hdr_t *)pNewObj)->position_word_low = uVar2;
    bVar3 = (byte)(uVar8 >> 8);
    ((uw_object_hdr_t *)pNewObj)->position_word_high = bVar3;
    bVar1 = g_player_object->hdr.position_word_high;
    ((uw_object_hdr_t *)pNewObj)->position_word_low = uVar2;
    ((uw_object_hdr_t *)pNewObj)->position_word_high = (bVar1 ^ bVar3) & 0x1c ^ bVar3;
    settle_dropped_object(pNewObj,(int)DAT_00204880 >> 8,(int)DAT_00204882 >> 8,1);
  }
  if (((*(byte *)(DAT_00086df8 + 0x5e) & 0xf0) != 0) && (DAT_00201b68 != 9)) {
    teleport_object_to_level_tile(g_player_object,0x3f,0x3f,*(byte *)(DAT_00086df8 + 0x5e) >> 4);
    DAT_00201c9c = apply_special_object_use_effect;
    DAT_00085730 = 0;
    iVar6 = dungeon_view_anim_tick();
    DAT_00085730 = 3;
    if (iVar6 != 0) {
      display_book_or_scroll_page(0x102);
      show_error_dialog_stub_thunk();
      msg_scroll_panel_reset(1);
      return;
    }
  }
  handle_player_death_and_menu_transition(1);
  return;
}"""


def converted():
    result = ORIGINAL
    replacements = [
        ('char *pNewObj;', 'uw_object_hdr_t *pNewObj;'),
        ('pNewObj = (char *)spawn_new_object', 'pNewObj = spawn_new_object'),
        ("""    ((uw_object_hdr_t *)pNewObj)->position_word_low = (g_player_object->hdr.position_word_low ^ bVar1) & 0x7f ^ bVar1;
    ((uw_object_hdr_t *)pNewObj)->position_word_high = (byte)(char)((ushort)uVar4 >> 8);""",
         '    pNewObj->zpos = g_player_object->hdr.zpos;'),
        ('    ((uw_object_hdr_t *)pNewObj)->link_word_high = ((uw_object_hdr_t *)pNewObj)->link_word_high;\n', ''),
        ('    ((uw_object_hdr_t *)pNewObj)->position_word_low = uVar2;\n    bVar3 = (byte)(uVar8 >> 8);\n    ((uw_object_hdr_t *)pNewObj)->position_word_high = bVar3;',
         '    bVar3 = (byte)(uVar8 >> 8);\n    pNewObj->xpos = bVar3 >> 5;'),
        ('bVar1 = g_player_object->hdr.position_word_high;', 'bVar1 = (byte)(g_player_object->hdr.position_word >> 8);'),
        ("""    ((uw_object_hdr_t *)pNewObj)->position_word_low = uVar2;
    ((uw_object_hdr_t *)pNewObj)->position_word_high = (bVar1 ^ bVar3) & 0x1c ^ bVar3;""",
         '    pNewObj->ypos = (bVar1 >> 2) & 7;'),
    ]
    for before, after in replacements:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result.replace('((uw_object_hdr_t *)pNewObj)->', 'pNewObj->')


def generate():
    import json
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'starvation-fields.json').write_text(generate())

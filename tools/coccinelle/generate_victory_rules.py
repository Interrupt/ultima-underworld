"""Name the victory object's quantity fields; preserve sequence and full captures."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'handle_game_victory_sequence'
ORIGINAL = r"""void handle_game_victory_sequence()

{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  char *pcVar4;
  undefined2 *puVar5;
  char *iVar6;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  char *pcVar7;
  char *local_11c;  /* was `int` -- same truncation, derived from iVar6 */
  char acStack_114 [260];
@BLANK@
  if (DAT_0023c27c == '\0') {
    if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
      puVar5 = (undefined2 *)spawn_new_object(0x15a,0);
      if (puVar5 != (undefined2 *)0x0) {
        uVar2 = ((uw_object_hdr_t *)puVar5)->type_flags;
        ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar2;
        ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)((ushort)uVar2 >> 8) | 0x80;
        ((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner;
        ((uw_object_hdr_t *)puVar5)->link_word_high = 0xb0;
        iVar6 = tilemap_lookup(0x20,0x20);
        local_11c = iVar6 + 2;
        object_list_append_tail(local_11c,puVar5);
      }
      print_scroll_message_by_id(0x117);
      spin_view_full_rotation(0xffffffff);
      weapon_overlay_flash_hold(5);
      if (puVar5 != (undefined2 *)0x0) {
        object_list_unlink(local_11c,puVar5);
        free_object_slot(puVar5);
      }
      teleport_object_to_level_tile(g_player_object,0x1b,0x17,9);
      *(undefined1 *)(DAT_00086df8 + 0x6d) = 0xff;
      print_scroll_message_by_id(0x118);
      DAT_00085730 = DAT_00085730 & 0xfe;
      dungeon_view_anim_tick();
      DAT_00085730 = DAT_00085730 | 1;
    }
  }
  else {
    dirty_rect_union(0,200,0,0x140);
    *(undefined1 *)(DAT_00085a6c + 8) = 0;
    *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
    DAT_000868d8 = 2;
    display_book_or_scroll_page(1);
    decrement_cursor_hide_depth();
    clear_screen_and_restore_cursor();
    ce_memset(acStack_114,0,0x104);
    pcVar7 = &DAT_0023cca8;
    stack0xffdc3244_ptr = stack0xffdc3244_buf;
    pcVar4 = pcVar7;
    stack0xffdc3244_ptr = acStack_114;
    do {
      cVar1 = *pcVar4;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_win1_byt_00087350);
    blit_fullscreen_bitmap_file(7,acStack_114,1);
    Sleep(3000);
    dirty_rect_union(0,200,0,0x140);
    ce_memset(acStack_114,0,0x104);
    do {
      cVar1 = *pcVar7;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_win2_byt_00087340);
    blit_fullscreen_bitmap_file(0xffffffff,acStack_114,1);
    dirty_rect_union(0,200,0,0x140);
    render_endgame_character_stats();
    do {
      sVar3 = next_input_event();
    } while (sVar3 < 0);
    handle_player_death_and_menu_transition(0);
    DAT_0023c27c = '\0';
  }
  return;
}""".replace('@BLANK@', '  ')
REPLACEMENTS = [('undefined2 *puVar5;', 'uw_object_hdr_t *puVar5;'),
 ('(undefined2 *)spawn_new_object', 'spawn_new_object'),
 ('(undefined2 *)0x0', 'NULL'),
 ('((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar2;\n'
  '        ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)((ushort)uVar2 >> 8) | 0x80;',
  '((uw_object_hdr_t *)puVar5)->is_quant = 1;'),
 ('((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner;\n'
  '        ((uw_object_hdr_t *)puVar5)->link_word_high = 0xb0;',
  '((uw_object_hdr_t *)puVar5)->link = 0x2c0;'),
 ('char *local_11c;  /* was `int` -- same truncation, derived from iVar6 */',
  'uw_link_word_t *local_11c;  /* was `int` -- same truncation, derived from iVar6 (tile word 1) */'),
 ('local_11c = iVar6 + 2;', 'local_11c = (uw_link_word_t *)(iVar6 + 2);')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == (2 if before == '(undefined2 *)0x0' else 1), before
        result = result.replace(before, after)
    return result.replace('((uw_object_hdr_t *)puVar5)->', 'puVar5->')

def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'victory-fields.json').write_text(generate())

"""Name tile heads and player links during arena reset; preserve allocation layout."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'reset_level_object_arena'
ORIGINAL = r"""void reset_level_object_arena()
{
  ushort *free_list_cursor;
  char *tile_record = DAT_002029cc;
  int index = 0;

  do {
    *(byte *)(tile_record + 2) = *(byte *)(tile_record + 2) & 0x3f;
    *(undefined1 *)(tile_record + 3) = 0;
    index = (index + 1) * 0x10000 >> 0x10;
    tile_record = tile_record + 4;
  } while (index < 0x1000);
  DAT_002046b8 = DAT_002029cc + 0x4000;
  DAT_002046c4 = DAT_002029cc + 0x5b00;
  free_list_cursor = (ushort *)(DAT_002029cc + 0x7300);
  DAT_002046a8 = DAT_002029cc + 0x74fa;
  DAT_002046bc = DAT_002029cc + 0x74fc;
  DAT_0020469c = DAT_002029cc + 0x7afa;
  /* g_backpack_slot_table lives in this same arena buffer, in the 0x38 bytes
     init_level_object_arena added past the buffer's old real end... */
  g_backpack_slot_table = DAT_002029cc + 0x7c08;
  /* g_scheduler_table lives in this same arena buffer too, right after g_backpack_slot_table's own
     0x3a-byte reservation -- see DAT_00250778's own comment for the full explanation... */
  g_scheduler_table = DAT_002029cc + 0x7c08 + 0x3a;
  index = 2;
  DAT_002046a0 = DAT_0020469c;
  DAT_002046a4 = (char *)free_list_cursor;
  DAT_002046ac = DAT_002046a8;
  /* Both allocator free lists contain 16-bit slot IDs. A byte cursor
     left the stationary list uninitialized until a level archive loaded. */
  do {
    *free_list_cursor = (ushort)index;
    index = (index + 1) * 0x10000 >> 0x10;
    free_list_cursor = free_list_cursor + 1;
  } while (index < 0x400);
  if (g_player_object != 0) {
    g_player_object->hdr.chain_word_low = g_player_object->hdr.quality;
    g_player_object->hdr.chain_word_high = 0;
    g_player_object->hdr.link_word_low = g_player_object->hdr.owner;
    g_player_object->hdr.link_word_high = 0;
    reset_equipment_and_container_state();
  }
  g_scheduler_count = 0;
  DAT_002046c0 = DAT_002046a0 + 2;
  DAT_002046c8 = DAT_002046a0 + 2;
}"""
REPLACEMENTS = [('char *tile_record = DAT_002029cc;', 'uw_tile_t *tile_record = (uw_tile_t *)DAT_002029cc;'),
 ('*(byte *)(tile_record + 2) = *(byte *)(tile_record + 2) & 0x3f;\n'
  '    *(undefined1 *)(tile_record + 3) = 0;',
  'tile_record->obj_head = 0;'),
 ('tile_record = tile_record + 4;', 'tile_record = tile_record + 1;'),
 ('g_player_object->hdr.chain_word_low = g_player_object->hdr.quality;\n'
  '    g_player_object->hdr.chain_word_high = 0;',
  'g_player_object->hdr.next = 0;'),
 ('g_player_object->hdr.link_word_low = g_player_object->hdr.owner;\n'
  '    g_player_object->hdr.link_word_high = 0;',
  'g_player_object->hdr.link = 0;')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result

def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'arena-reset-fields.json').write_text(generate())

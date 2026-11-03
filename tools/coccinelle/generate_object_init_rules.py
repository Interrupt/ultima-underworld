"""Name complete common-header initialization and the guarded burnout HP byte."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
ENTRIES = [{'function': 'spawn_new_object', 'before': 'uw_object_hdr_t *spawn_new_object(uint object_type, int region)\n{\n  uw_object_hdr_t *puVar3;\n\n  puVar3 = alloc_object_slot(region);\n  if (puVar3 != NULL) {\n    puVar3->position_word = 0x6c00;\n    puVar3->type_flags = (puVar3->is_quant << 15) ^ (object_type & 0x1ff);\n    puVar3->chain_word = 0x28;\n    puVar3->owner = 0;\n    if (((g_object_type_props[(short)object_type].flags & 0xc0) == 0) || ((g_object_type_props[(short)object_type].flags & 0xc0) == 0x80)) {\n      puVar3->link_word = 0x40;\n      puVar3->is_quant = 1;\n    }\n    else {\n      puVar3->is_quant = 0;\n      puVar3->link_word = 0;\n    }\n  }\n  return puVar3;\n}', 'replacements': [('    puVar3->position_word = 0x6c00;', '    puVar3->zpos = 0;\n    puVar3->heading = 0;\n    puVar3->ypos = 3;\n    puVar3->xpos = 3;'), ('    puVar3->type_flags = (puVar3->is_quant << 15) ^ (object_type & 0x1ff);', '    puVar3->object_id = object_type & 0x1ff;\n    puVar3->flags_res = 0;\n    puVar3->enchanted = 0;\n    puVar3->doordir = 0;\n    puVar3->invisible = 0;'), ('    puVar3->chain_word = 0x28;', '    puVar3->quality = 40;\n    puVar3->next = 0;'), ('      puVar3->link_word = 0x40;', '      puVar3->link = 1;'), ('      puVar3->link_word = 0;', '      puVar3->link = 0;')]}, {'function': 'reset_burnt_out_item_state', 'before': 'int reset_burnt_out_item_state(char *tile_link, void *object_ptr)\n{\n  char *object = (char *)object_ptr;\n  ushort *discarded;\n\n  if (object < DAT_002046c4) {\n    *(undefined1 *)(object + 8) = 0;\n  }\n  else {\n    discarded = discard_misplaced_object(tile_link,(ushort *)object,0);\n    if (discarded == 0) {\n      return 1;\n    }\n  }\n  return 0;\n}', 'replacements': [('  char *object = (char *)object_ptr;', '  uw_object_hdr_t *object = (uw_object_hdr_t *)object_ptr;'), ('  if (object < DAT_002046c4) {', '  if ((char *)object < DAT_002046c4) {'), ('    *(undefined1 *)(object + 8) = 0;', '    ((uw_mobile_object_t *)object)->hit_points = 0;'), ('  ushort *discarded;', '  uw_object_hdr_t *discarded;'), ('discarded = discard_misplaced_object(tile_link,(ushort *)object,0);', 'discarded = (uw_object_hdr_t *)discard_misplaced_object(tile_link,(ushort *)object,0);')]}]

def recipe(entry):
    result = entry['before']
    for before, after in entry['replacements']:
        assert result.count(before) == 1
        result = result.replace(before, after)
    return dict(function=entry['function'],before=entry['before'],after=result)

def generate(entry):
    return json.dumps(recipe(entry),indent=2)+'\n'

if __name__ == '__main__':
    for entry in ENTRIES:
        (HERE/('object-init-'+entry['function']+'.json')).write_text(generate(entry))

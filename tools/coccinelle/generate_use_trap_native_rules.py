"""Name used-object header gates and retain the escaped live link cursor."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'trigger_object_trap_or_use_action'
ORIGINAL = 'void trigger_object_trap_or_use_action(void *actor_ptr, void *object_ptr, int action, int tile_x, short tile_y)\n{\n  char *actor = (char *)actor_ptr;\n  char *object = (char *)object_ptr;\n  ushort *puVar1;\n  ushort *local_1c;\n  \n  if (((object != 0) && ((*(byte *)(object + 1) & 0x80) == 0)) &&\n     (local_1c = (ushort *)(object + 6), (*local_1c & 0xffc0) != 0)) {\n    puVar1 = (ushort *)find_object_in_chain(&local_1c,0,6,0xffffffff,0xffff);\n    if (puVar1 != (ushort *)0x0) {\n      if ((((uw_object_hdr_t *)puVar1)->object_id & 0x30) < 0x20) {\n        if (((((uw_object_hdr_t *)puVar1)->flags_res == 0 && ((uw_object_hdr_t *)puVar1)->enchanted == 0)) && ((short)action == 4)) {\n          apply_trap_or_link_effect(actor,object,puVar1,tile_x,tile_y);\n          refresh_object_link_chain(local_1c,puVar1);\n        }\n      }\n      else {\n        resolve_skill_gated_unlock_or_use(actor,object,puVar1,action);\n      }\n    }\n  }\n}'
REPLACEMENTS = [('  char *object = (char *)object_ptr;', '  uw_object_hdr_t *object = (uw_object_hdr_t *)object_ptr;'), ('  ushort *puVar1;', '  uw_object_hdr_t *puVar1;'), ('((*(byte *)(object + 1) & 0x80) == 0)', '(object->is_quant == 0)'), ('(local_1c = (ushort *)(object + 6), (*local_1c & 0xffc0) != 0)', '(local_1c = &object->link_word, object->link != 0)'), ('puVar1 = (ushort *)find_object_in_chain', 'puVar1 = find_object_in_chain'), ('puVar1 != (ushort *)0x0', 'puVar1 != NULL'), ('((uw_object_hdr_t *)puVar1)->', 'puVar1->'), ('        if (((puVar1->flags_res == 0 && puVar1->enchanted == 0)) && ((short)action == 4)) {', '        if ((puVar1->flags_res == 0) && (puVar1->enchanted == 0) && ((short)action == 4)) {')]

def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert before in result
        result = result.replace(before, after)
    return result

def generate():
    return json.dumps(dict(function=FUNCTION,before=ORIGINAL,after=converted()),indent=2)+'\n'

if __name__ == '__main__':
    (HERE/'use-trap-native-fields.json').write_text(generate())

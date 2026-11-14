"""Name audited common-header reads and writes in trap consumers.

Inputs are common object headers; region-one spawn copies remain whole mobile
records. Scalar snapshots stay unchanged, including cross-property counters.
"""
from pathlib import Path
import re
from difflib import SequenceMatcher
from generate_projectile_spawn_rules import rule
HERE = Path(__file__).resolve().parent
DISPATCH = 'dispatch_trap_type_effect'

REMOVE_ORIGINAL = """void remove_trap_chain_marker(char *link_field, char *trap_object)
{
  uint uVar1;
  ushort uVar2;
  byte bVar3;
  ushort *puVar4;
  char *iVar5;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  puVar4 = (ushort *)resolve_object_link(trap_object + 6);
  uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
  uVar1 = (uVar2 & 0x1e00) >> 9;
  if ((short)uVar1 == 1) {
    iVar5 = (char *)tilemap_lookup(*(byte *)(trap_object + 4) & 0x3f,*(ushort *)(trap_object + 6) & 0x3f);
    refresh_object_link_chain(iVar5 + 2,puVar4);
  }
  else {
    bVar3 = (byte)(uVar2 >> 8);
    ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar2;
    ((uw_object_hdr_t *)puVar4)->type_flags_high = ((byte)((uVar1 * 0x200 + -1) >> 8) ^ bVar3) & 0x1e ^ bVar3;
    object_list_unlink(link_field,trap_object);
    free_object_slot(trap_object);
  }
}"""


def changes():
    result = []
    def add(function, key, before, after):
        result.append(dict(function=function,key=function+"_"+re.sub(r"[^a-zA-Z0-9_]", "_", key),before=before,after=after))
    a = '((uw_object_hdr_t *)trap_record)->'
    for field,index,mask in [('object_id',0,'0x3f'),('quality',2,'0x3f'),('owner',3,'0x3f'),('zpos',1,'0x7f')]:
        for cast in ['', '(byte)']:
            source = '*trap_record' if index == 0 else f'trap_record[{index}]'
            add(DISPATCH,f'{field}_{cast or "word"}',f'{cast}{source} & {mask}',
                f'{a}{field}' + (' & 0x3f' if field == 'object_id' else ''))
    for field,index,mask in [('is_quant',0,'0x8000'),('link',3,'0xffc0')]:
        source = '*trap_record' if index == 0 else f'trap_record[{index}]'
        for operator in ['==','!=']:
            add(DISPATCH,field+('equal' if operator == '==' else 'nonzero'),f'({source} & {mask}) {operator} 0',f'{a}{field} {operator} 0')
    add(DISPATCH,'template_subclass','*puVar12 & 0x30','((uw_object_hdr_t *)puVar12)->object_id & 0x30')
    add(DISPATCH,'template_class','*puVar12 & 0x1c0','((uw_object_hdr_t *)puVar12)->object_id & 0x1c0')
    for field,offset in [('type_flags',0),('position_word',2),('chain_word',4),('link_word',6)]:
        low = '*puVar12' if offset == 0 else f'puVar12[{offset//2}]'
        add(DISPATCH,'template_'+field,
            f'''((uw_object_hdr_t *)puVar8)->{field}_low = (byte)(char){low};
((uw_object_hdr_t *)puVar8)->{field}_high = *(undefined1 *)((char *)puVar12 + {offset+1});''',
            f'((uw_object_hdr_t *)puVar8)->{field} = ((uw_object_hdr_t *)puVar12)->{field};')
    add(DISPATCH,'spawn_coordinates',
        '''uVar4 = ((uw_object_hdr_t *)puVar8)->position_word;
local_30 = place_object_in_world((uint)(uVar4 >> 0xd) + tile_x * 8,
((uVar4 & 0x1c00) >> 10) + tile_y * 8,uVar4 & 0x7f,puVar8,
CONCAT22(uVar20,4),0);''',
        '''uVar4 = ((uw_object_hdr_t *)puVar8)->position_word;
local_30 = place_object_in_world(((uw_object_hdr_t *)puVar8)->xpos + tile_x * 8,
((uw_object_hdr_t *)puVar8)->ypos + tile_y * 8,((uw_object_hdr_t *)puVar8)->zpos,puVar8,
CONCAT22(uVar20,4),0);''')
    add(DISPATCH,'spawn_link', '''((uw_object_hdr_t *)puVar8)->link_word_low = ((uw_object_hdr_t *)puVar8)->owner | (byte)((uVar14 & 0x3ff) << 6);
((uw_object_hdr_t *)puVar8)->link_word_high = (byte)(char)((uVar14 << 0x16) >> 0x18);''',
        '((uw_object_hdr_t *)puVar8)->link = uVar14 & 0x3ff;')
    add(DISPATCH,'spawn_next_clear','''((uw_object_hdr_t *)puVar9)->chain_word_high = 0;
((uw_object_hdr_t *)puVar9)->chain_word_low = ((uw_object_hdr_t *)puVar9)->quality;''',
        '((uw_object_hdr_t *)puVar9)->next = 0;')
    add(DISPATCH,'spawn_link_clear','''((uw_object_hdr_t *)puVar9)->link_word_low = ((uw_object_hdr_t *)puVar9)->owner;
((uw_object_hdr_t *)puVar9)->link_word_high = 0;''',
        '((uw_object_hdr_t *)puVar9)->link = 0;')
    for field,index,mask in [('owner',3,'0xf'),('quality',2,'0x2f')]:
        add(DISPATCH,'slice_'+field,f'(byte)trap_record[{index}] & {mask}',a+field+' & '+mask)
        word = 'link_word' if field == 'owner' else 'chain_word'
        add(DISPATCH,'named_slice_'+field,f'(byte){a}{word} & {mask}',a+field+' & '+mask)
    add(DISPATCH,'actor_nibble','*DAT_0024cff4 & 0xf',
        '((uw_object_hdr_t *)DAT_0024cff4)->object_id & 0xf')
    # Full captured words still serve later computations; do not narrow them.
    for index,field in [(1,'position_word'),(2,'chain_word'),(3,'link_word')]:
        add(DISPATCH,'snapshot_'+field,f'trap_record[{index}]',a+field)
    q = 'apply_quest_event_numeric_effect'
    hdr = '((uw_object_hdr_t *)record)->'
    add(q,'height','*(byte *)(record + 2) & 0x7f',hdr+'zpos')
    add(q,'quality','*(byte *)(record + 4) & 0x3f',hdr+'quality')
    add(q,'link_index','(*(ushort *)(record + 6) & 0x7fc0) >> 6',hdr+'link & 0x1ff')
    add(q,'set_zpos', '''uVar1 = ((uw_object_hdr_t *)iVar3)->position_word;
bVar2 = (byte)uVar1;
((uw_object_hdr_t *)iVar3)->position_word_low = (bVar2 ^ (byte)iVar4) & 0x7f ^ bVar2;
((uw_object_hdr_t *)iVar3)->position_word_high = (byte)(char)((ushort)uVar1 >> 8);''',
        '''uVar1 = ((uw_object_hdr_t *)iVar3)->position_word;
bVar2 = (byte)uVar1;
((uw_object_hdr_t *)iVar3)->zpos = (byte)iVar4 & 0x7f;''')
    q = 'remove_trap_chain_marker'
    hdr = '((uw_object_hdr_t *)trap_object)->'
    add(q,'quality','*(byte *)(trap_object + 4) & 0x3f',hdr+'quality')
    add(q,'owner','*(ushort *)(trap_object + 6) & 0x3f',hdr+'owner')
    add(q,'marker_link','trap_object + 6','uw_link_word_ptr((uw_object_hdr_t *)trap_object)')
    # The char * parameters are this function's fixed historical interface: the unlinked marker
    # is an object record and link_field the address of the chain word that holds it.
    add(q,'unlink_types','object_list_unlink(link_field,trap_object);',
        'object_list_unlink((uw_link_word_t *)link_field, (uw_object_hdr_t *)trap_object);')
    add(q,'free_type','free_object_slot(trap_object);','free_object_slot((uw_object_hdr_t *)trap_object);')
    add(q,'counter_write', '''bVar3 = (byte)(uVar2 >> 8);
((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar2;
((uw_object_hdr_t *)puVar4)->type_flags_high = ((byte)((uVar1 * 0x200 + -1) >> 8) ^ bVar3) & 0x1e ^ bVar3;''',
        '''bVar3 = (byte)(uVar2 >> 8);
((uw_object_hdr_t *)puVar4)->flags_res = (uVar1 - 1) & 7;
((uw_object_hdr_t *)puVar4)->enchanted = ((uVar1 - 1) >> 3) & 1;''')
    return result


def generate():
    rules = [rule(**change) for change in changes() if change['function'] != 'remove_trap_chain_marker']
    final = REMOVE_ORIGINAL
    for change in changes():
        if change['function'] != 'remove_trap_chain_marker': continue
        pattern = re.compile(r'\s*'.join(re.escape(line) for line in change['before'].splitlines()))
        # Preserve indentation within the exact replacement body.
        final,count = pattern.subn(change['after'].replace('\n','\n    '), final)
        assert count == 1, change['key']
    patch = []
    oldlines,newlines = REMOVE_ORIGINAL.splitlines(),final.splitlines()
    for tag,i,j,k,l in SequenceMatcher(a=oldlines,b=newlines,autojunk=False).get_opcodes():
        if tag == 'equal': patch.extend(' '+line for line in oldlines[i:j])
        else:
            patch.extend('- '+line if line else '-' for line in oldlines[i:j])
            patch.extend('+ '+line if line else '+' for line in newlines[k:l])
    rules.append('@marker_exact disable optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
        'typedef byte, ushort, uint, uw_object_hdr_t, uw_link_word_t;\n@@\n'+'\n'.join(patch)+'\n')
    return ''.join(rules).replace('@projectile_spawn_', '@trap_consumer_').replace('typedef byte, ushort, uint,', 'typedef byte, ushort, uint, undefined1, undefined2,')


if __name__ == '__main__':
    (HERE/'trap-consumer-fields.cocci').write_text(generate())

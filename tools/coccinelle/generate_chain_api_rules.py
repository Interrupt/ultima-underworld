"""Retype matching chain API declarations, definitions and fixture doubles."""
from pathlib import Path
rules=[]
for fn in ['object_list_insert_head','object_list_append_tail','object_list_unlink',
           'unlink_and_free_object']:
    for kind, tail in [('definition', '{ ... }'), ('prototype', ';')]:
        rules.append(f'''@{fn}_{kind}@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R {fn}(void *L, void *O)
+ R {fn}(ushort *L, uw_object_hdr_t *O)
 {tail}
''')
for fn, typ in [('free_linked_object_recursive', 'ushort *'),
                ('free_object_slot', 'uw_object_hdr_t *'),
                ('encode_object_slot_index', 'const uw_object_hdr_t *'),
                ('object_is_mobile', 'const uw_object_hdr_t *')]:
    for kind, tail in [('definition', '{ ... }'), ('prototype', ';')]:
        rules.append(f'''@{fn}_{kind}@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R {fn}(void *P)
+ R {fn}({typ}P)
 {tail}
''')
Path(__file__).with_name('object-chain-interfaces.cocci').write_text('\n'.join(rules))

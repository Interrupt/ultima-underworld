"""Prove the equipment player-ID block rewrite without exercising legacy string UB."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_equipment_id_rules import FUNCTION, ORIGINAL, BEFORE, AFTER, converted, player_write, generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual=extract((ROOT/'src/combat.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert actual==ORIGINAL.replace(BEFORE,AFTER)
assert (ROOT/'tools/coccinelle/equipment-player-id-fields.json').read_text()==generate()
recipe=json.loads(generate())
assert apply(ORIGINAL,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in [('undefined2 uVar3;','volatile undefined2 uVar3;'),
    ('uVar3 = ((uw_object_hdr_t *)puVar5)->type_flags;', 'uVar3 = ((uw_object_hdr_t *)puVar5)->type_flags; escape(&uVar3);'),
    ('type_flags_low = 0xf;', 'type_flags_low = 0xe;'),
    ('type_flags_high =', 'observe(); ((uw_object_hdr_t *)puVar5)->type_flags_high =')]:
    assert before in ORIGINAL
    protected=ORIGINAL.replace(before,after,1);assert apply(protected,recipe)==(protected,False)
for protected in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace(FUNCTION,'excluded')]:
    assert apply(protected,recipe)==(protected,False)
# This block has no calls, escapes or intervening observers. Check the actual
# before/after block with the same saved pointer and full-word scratch value.
old_block=player_write(ORIGINAL);new_block=player_write(actual)
assert old_block.replace(BEFORE,AFTER)==new_block
assert 'ce_strlen(acStack_4d + 1)' in actual  # unchanged legacy buffer path
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    blocks=[]
    for name,body in [('original_player_write',old_block),('converted_player_write',new_block)]:
        blocks.append('static ushort '+name+'(uw_object_hdr_t *p) {\nundefined2 *puVar5=(undefined2 *)p;\nundefined2 uVar3=0xa55a;\n'+body+'\nreturn uVar3;\n}')
    (Path(tmp)/'equipment_id_blocks.c').write_text('\n'.join(blocks))
    exe=Path(tmp)/'equipment_id'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/equipment_id_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Equipment ID generation, exact whole-function scope and block/capture guards pass; message path not executed')

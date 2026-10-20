"""Verify default interaction header fields and dynamic target behavior."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_interaction_stack_rules import FUNCTION, ORIGINAL, converted, generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual=extract((ROOT/'src/interact.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert (ROOT/'tools/coccinelle/interaction-stack-fields.json').read_text()==generate()
recipe=json.loads(generate())
assert apply(ORIGINAL,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in [('int iVar1;','volatile int iVar1;'),('0xffc0','0x7fc0'),
    ('object_list_unlink(', 'observe(); object_list_unlink('),
    ('iVar1 = check_object_carry_weight', 'escape(&iVar1); iVar1 = check_object_carry_weight'),
    ('puVar3 != g_interact_target','puVar3 == g_interact_target')]:
    assert before in ORIGINAL
    protected=ORIGINAL.replace(before,after,1);assert apply(protected,recipe)==(protected,False)
for protected in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace(FUNCTION,'excluded')]:
    assert apply(protected,recipe)==(protected,False)
assert 'free_object_slot(' not in actual and 'free_object_slot(' not in ORIGINAL
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'interaction_stack_functions.c').write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'interaction_stack'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/interaction_stack_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Interaction generation, exact conversion, idempotence and live-target/scope guards pass')

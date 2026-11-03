"""Verify barter click quantity conversion and original/current escaped UI state."""
from pathlib import Path
import json
import re
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_barter_click_rules import FUNCTION, ORIGINAL, converted, generate
from apply_exact_source_rules import apply, NONCODE
from extract_functions import extract
from audit_object_roles import ACCESSORS
actual=extract((ROOT/'src/babl.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert (ROOT/'tools/coccinelle/barter-click-fields.json').read_text()==generate()
recipe=json.loads(generate())
assert apply(ORIGINAL,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in [('int iVar3;','volatile int iVar3;'),('0xffc0','0x7fc0'),
    ('object_list_unlink(', 'observe(); object_list_unlink('),
    ('iVar3 = check_object_carry_weight', 'escape(&iVar3); iVar3 = check_object_carry_weight'),
    ('split_rec != obj_rec','split_rec == obj_rec')]:
    assert before in ORIGINAL
    protected=ORIGINAL.replace(before,after,1);assert apply(protected,recipe)==(protected,False)
for protected in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace(FUNCTION,'excluded')]:
    assert apply(protected,recipe)==(protected,False)
# The split helper returns only NULL, its incoming header, or an allocated
# object slot; its public byte-pointer signature does not imply a byte buffer.
body=NONCODE.sub(' ',extract((ROOT/'src/item_use.c').read_text(),'prompt_split_object_stack'))
assert len(re.findall(r'\bpuVar4\s*=(?!=)',body))==3
assert 'puVar4 = (undefined1 *)0x0;' in body and 'puVar4 = object,' in body
assert 'puVar4 = (undefined1 *)alloc_object_slot(0);' in body
assert re.findall(r'\breturn\s+([^;]+);',body)==['puVar4']
assert 'prompt_split_object_stack' in ACCESSORS
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'barter_click_functions.c').write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'barter_click'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/barter_click_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Barter click generation, exact conversion, idempotence and scope/capture guards pass')

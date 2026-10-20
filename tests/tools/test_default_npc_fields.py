"""Verify default NPC field conversion, mixed-role separation and full behavior."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_default_npc_rules import FUNCTION, ORIGINAL, converted, generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual=extract((ROOT/'src/ai.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert (ROOT/'tools/coccinelle/default-npc-movement-fields.json').read_text()==generate()
recipe=json.loads(generate())
assert apply(ORIGINAL,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in [('uint uVar5;','volatile uint uVar5;'),
    ('uVar5 = uVar2 & 0xfc7f', 'escape(&uVar2); uVar5 = uVar2 & 0xfc7f'),
    ('0xfc7f','0xfcff'),('npc_rec = (char *)DAT_0010190c;', 'npc_rec = (char *)DAT_0010190c; observe();')]:
    assert before in ORIGINAL
    protected=ORIGINAL.replace(before,after,1);assert apply(protected,recipe)==(protected,False)
for protected in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace(FUNCTION,'excluded')]:
    assert apply(protected,recipe)==(protected,False)
raw='(*(byte *)(npc_rec + 0x19) & 0x40)'
assert raw in ORIGINAL
assert '(*(byte *)((char *)damage_source_object + 0x19) & 0x40)' in actual
assert 'uw_object_hdr_t *damage_source_object;' in actual
assert 'npc_rec = (char *)DAT_0010190c;' not in actual
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'default_npc_functions.c').write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'default_npc'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/default_npc_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Default NPC generation, exact conversion, scope/capture guards and retained source-byte exception pass')

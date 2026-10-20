"""Verify complete NPC tick conversion and original/current callback behavior."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_npc_tick_animation_rules import FUNCTION, ORIGINAL, converted, generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual=extract((ROOT/'src/ai.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert (ROOT/'tools/coccinelle/npc-tick-animation-fields.json').read_text()==generate()
recipe=json.loads(generate())
assert apply(ORIGINAL,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in [('uint uVar9;','volatile uint uVar9;'),
    ('uVar9 = (uint) DAT_0010190c->goal_word;', 'uVar9 = (uint) DAT_0010190c->goal_word; escape(&uVar9);'),
    ('LAB_000337fc:', 'LAB_000337fc: observe();'),
    ('spawn_npc_thrown_weapon(', 'observe(); spawn_npc_thrown_weapon('),
    ('0x1000 ^ uVar9 & 0xfff', '0x2000 ^ uVar9 & 0xfff')]:
    assert before in ORIGINAL
    protected=ORIGINAL.replace(before,after,1);assert apply(protected,recipe)==(protected,False)
for protected in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace(FUNCTION,'excluded')]:
    assert apply(protected,recipe)==(protected,False)
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'npc_tick_animation_functions.c').write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'npc_tick_animation'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/npc_tick_animation_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('NPC tick generation, exact conversion, idempotence and shared-label/capture guards pass')

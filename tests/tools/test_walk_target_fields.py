"""Verify walk-target conversion, candidate provenance and original/current behavior."""
from pathlib import Path
import json
import re
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_walk_target_rules import FUNCTION, ORIGINAL, converted, generate
from apply_exact_source_rules import apply, NONCODE
from extract_functions import extract
from audit_struct_property_usage import inventory
source = (ROOT/'src/ai.c').read_text(); actual = extract(source, FUNCTION)
assert actual == converted() and actual != ORIGINAL
assert (ROOT/'tools/coccinelle/walk-target-fields.json').read_text() == generate()
recipe = json.loads(generate())
assert apply(ORIGINAL,recipe) == (actual,True) and apply(actual,recipe) == (actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION) == ORIGINAL
for old,new in [('ushort uVar3;','volatile ushort uVar3;'),
                ('uVar3 = DAT_0010190c->goal_word;','uVar3 = DAT_0010190c->goal_word; escape(&uVar3);'),
                ('save_walk_path_to_cache_slot(','observe(); save_walk_path_to_cache_slot('),
                ('local_40[0] & 0xf','local_40[0] & 7'),
                ('npc_bytes = (char *)DAT_0010190c;','npc_bytes = (char *)DAT_0010190c; observe();')]:
    assert old in ORIGINAL
    protected = ORIGINAL.replace(old,new,1); assert apply(protected,recipe) == (protected,False)
for protected in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace(FUNCTION,'excluded',1)]:
    assert apply(protected,recipe) == (protected,False)
# All candidate writers produce common headers through the nearby accessors.
writes = []
for path in sorted((ROOT/'src').glob('*.c')):
    writes += re.findall(r'\bDAT_00101904\s*=(?!=)\s*([^;]+);',NONCODE.sub(' ',path.read_text()))
assert [re.sub(r'\s+','',x) for x in writes] == ['iVar3']+['get_first_nearby_candidate_object()']*3
movement = (ROOT/'src/movement.c').read_text()
collision = extract(movement,'collision_response_default')
assert 'iVar3 = find_nearby_door_in_candidates(&DAT_00101424,&DAT_00101428);' in collision
for name, variable, returns in [('get_first_nearby_candidate_object','uVar1',['uVar1']),
                                ('find_nearby_door_in_candidates','uVar4',['uVar4','0'])]:
    body = NONCODE.sub(' ',extract(movement,name))
    assert variable+' = resolve_object_link(' in body
    assert re.findall(r'\breturn\s+([^;]+);',body) == returns
# Its byte-wide class view cannot prove the NPC extension; retain and audit it.
assert '(ushort)(char)(byte)target_header->object_id' in actual
raw = '(*(byte *)((char *)DAT_00101904 + 0xb) & 0xf)'
assert raw in ORIGINAL and raw in actual
assert any(r['function'] == FUNCTION and r['category'] == 'raw_audited_object_access' and
           r['pointer'] == 'DAT_00101904' and '0xb' in r['code'] for r in inventory())
old_pitch = 'DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 | 0x70;'
new_pitch = 'DAT_0010190c->pitch = 14;'
assert ORIGINAL.count(old_pitch) == 1 and actual.count(new_pitch) == 1
flags = ['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'walk_target_functions.c'
    path.write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1)+
        '\nstatic void reference_pitch_write(void) {'+old_pitch+'}\nstatic void converted_pitch_write(void) {'+new_pitch+'}\n')
    exe = Path(tmp)/'walk_target'
    result = subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/walk_target_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode == 0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Walk-target recipes, provenance, capture/scope guards and retained raw-access audit pass')

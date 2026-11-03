"""Check native placement initialization against original code and an independent byte layout."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_placement_init_rules import FUNCTION,ORIGINAL,REPLACEMENTS,converted,generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual=extract((ROOT/'src/objects.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert (ROOT/'tools/coccinelle/placement-init-fields.json').read_text()==generate()
rule=json.loads(generate())
assert apply(ORIGINAL,rule)==(actual,True) and apply(actual,rule)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in REPLACEMENTS:
    guarded=ORIGINAL.replace(before,before+' observe();',1)
    assert apply(guarded,rule)==(guarded,False)
for guarded in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,
                ORIGINAL.replace('uint uVar7;', 'ushort uVar7;'),
                ORIGINAL.replace('uint uVar6;', 'ushort uVar6;')]:
    assert apply(guarded,rule)==(guarded,False)
assert 'object[' not in actual
for statement in ['uVar6 = (uint)object->hdr.type_flags;', 'uVar7 = (uint)object->hdr.position_word;',
                  'uVar2 = tile_y & 0x3f | (tile_x & 0x3ff) << 6;', 'cVar1 = DAT_00101928;']:
    assert statement in actual
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'placement_init_functions.c').write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'placement_init'
    result=subprocess.run(['cc','-std=c11','-O2',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/placement_init_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    subprocess.run([str(exe)],check=True)
print('Placement initialization generation, observer/width guards and independent full-record checks passed')

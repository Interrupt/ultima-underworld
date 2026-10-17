"""Verify tracked-target recipes, layout provenance and original/current behavior."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_target_coordinate_rules import SOURCES, ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply, NONCODE
from extract_functions import extract
functions=[]
for name,original in ORIGINALS.items():
    actual=extract((ROOT/'src'/SOURCES[name]).read_text(),name)
    assert actual == converted(name) and actual != original
    assert recipe_path(name).read_text() == generate(name)
    recipe=json.loads(generate(name))
    assert apply(original,recipe) == (actual,True) and apply(actual,recipe) == (actual,False)
    if '--reference-dir' in sys.argv:
        prefix=Path(sys.argv[sys.argv.index('--reference-dir')+1])
        assert extract((prefix/('uw-target-coordinates-original-'+SOURCES[name])).read_text(),name) == original
    for old,new in [('int iVar', 'volatile int iVar'),('DAT_00101400', 'other_target'),
                    ('return ', 'observe(); return ')]:
        assert old in original
        protected=original.replace(old,new,1)
        assert apply(protected,recipe) == (protected,False)
    for protected in ['/*\n'+original+'\n*/', original+'\n'+original, original.replace(name,'excluded',1)]:
        assert apply(protected,recipe) == (protected,False)
    current=actual.replace(name+'(',('converted_'+name if name=='refresh_npc_target_delta' else name)+'(',1)
    functions += [current,original.replace(name+'(','reference_'+name+'(',1)]
# Only an eight-bit target slot reaches the extension pointer. Its non-null
# resolver branch addresses a 27-byte mobile slot, and only shared fields are used.
header=(ROOT/'src/headers/uw.h').read_text()
assert 'unsigned short npc_gtarg   : 8;' in header
body=extract((ROOT/'src/objects.c').read_text(),'get_object_record_by_slot_index')
assert 'else if (iVar1 < 0x100)' in body
assert 'iVar1 = iVar1 * 0x1b + (intptr_t)DAT_002046b8;' in body
refresh=converted('refresh_npc_target_delta')
assert 'get_object_record_by_slot_index(DAT_0010190c->npc_gtarg)' in refresh
assert all('target_object->'+field in refresh for field in ['hit_points','tile_x','tile_y','hdr.zpos','hdr.xpos','hdr.ypos'])
assert 'target_object->npc_' not in refresh
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'target_coordinates_functions.c').write_text('\n'.join(functions))
    exe=Path(tmp)/'target_coordinates'
    result=subprocess.run(['cc','-std=c11','-O0' if '--o0' in sys.argv else '-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/target_coordinates_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode == 0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Tracked-target recipes, exact conversion, scope guards and mobile-layout provenance pass')

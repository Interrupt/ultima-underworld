"""Verify the complete placement builder against its previous body and byte oracle."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_placement_class_rules import FUNCTION, ORIGINAL, BEFORE, AFTER, converted, generate
from apply_exact_source_rules import apply
from extract_functions import extract
source=(ROOT/'src/ai.c').read_text()
actual=extract(source,FUNCTION)
assert actual==converted() and actual==ORIGINAL.replace(BEFORE,AFTER)
assert actual.count(AFTER)==4 and BEFORE not in actual
assert (ROOT/'tools/coccinelle/placement-class-fields.json').read_text()==generate()
recipe=json.loads(generate())
assert apply(ORIGINAL,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for guarded in [ORIGINAL.replace('0x1c0','0x3c0',1),
                ORIGINAL.replace(BEFORE,'observe(); '+BEFORE,1),
                '/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL]:
    assert apply(guarded,recipe)==(guarded,False)
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    prefix=extract(source,'@physics_vz_remainder')+'\nstatic struct physics_vz_remainder g_physics_vz_remainder[256];\nchar *DAT_002046b8=(char *)arena;\n#ifndef PLACEMENT_MUTATING\nint physics_subtick_units(void) { return 0; }\n#endif\n'
    (Path(tmp)/'placement_functions.c').write_text(prefix+actual+'\n#define REFERENCE_AVAILABLE\n'+ORIGINAL.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(',1))
    for fixture in ['placement_snapshot_fixture.c','placement_class_fixture.c']:
        exe=Path(tmp)/'placement'
        result=subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types',
            '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools'/fixture),'-o',str(exe)],capture_output=True,text=True)
        assert result.returncode==0,result.stdout+result.stderr
        subprocess.run([str(exe)],check=True)
print('Placement class exact-body guards, byte oracle and complete callback comparisons passed')

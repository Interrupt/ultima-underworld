"""Exercise complete settling bodies without observing expired stack scratch."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_settle_native_rules import FUNCTION,ORIGINAL,REPLACEMENTS,converted,generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual=extract((ROOT/'src/objects.c').read_text(),FUNCTION)
assert actual==converted() and actual!=ORIGINAL
assert (ROOT/'tools/coccinelle/settle-native-fields.json').read_text()==generate()
rule=json.loads(generate())
assert apply(ORIGINAL,rule)==(actual,True) and apply(actual,rule)==(actual,False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)==ORIGINAL
for before,after in REPLACEMENTS:
    if before not in ORIGINAL: continue  # internal alias stage is not a public recipe input
    guarded=ORIGINAL.replace(before,before+' observe();',1)
    assert apply(guarded,rule)==(guarded,False)
for guarded in ['/*\n'+ORIGINAL+'\n*/',ORIGINAL+'\n'+ORIGINAL,ORIGINAL.replace('uint uVar8;', 'ushort uVar8;')]:
    assert apply(guarded,rule)==(guarded,False)
assert 'object[' not in actual and '*object &' not in actual
for capture in ['uVar3 = DAT_00101454;', 'uVar6 = DAT_0010144c;', 'uw_ord2005_rem_119 = ((int)(uVar10)) % (9);']:
    assert capture in actual and capture in ORIGINAL
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'settle_native_functions.c').write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(',1))
    if '--spatch' in sys.argv:
        spatch=sys.argv[sys.argv.index('--spatch')+1]
        scoped=Path(tmp)/'catalog_scope.c'
        scoped.write_text('#include "src/headers/uw.h"\n'+actual+'\n')
        for relative in ['header-fields/objects.cocci','header-words/objects.cocci',
                         'shared-mobile/objects.c.cocci','shared-mobile/objects.c.bits.cocci',
                         'shared-mobile/objects.c.coordinates.cocci']:
            before=scoped.read_text()
            result=subprocess.run([spatch,'--sp-file',str(ROOT/'tools/coccinelle'/relative),str(scoped),
                '--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),'--in-place'],capture_output=True,text=True)
            assert result.returncode==0,result.stdout+result.stderr
            assert scoped.read_text()==before,relative+' changed an already named settling body'
        print('All five scoped header/shared-mobile catalogs are idempotent on the current body')
    exe=Path(tmp)/'settle_native'
    result=subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types','-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/settle_native_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    subprocess.run([str(exe)],check=True)
print('Settling recipes, capture/observer guards, complete before/after traces and independent motion fields passed')

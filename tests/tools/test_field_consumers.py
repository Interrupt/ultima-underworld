"""Test actual consumer functions with live globals, helpers and saved full words."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_field_consumer_rules import ENTRIES,recipe,generate
from apply_exact_source_rules import apply
from extract_functions import extract
bodies=[]
for entry in ENTRIES:
    rule=recipe(entry);name=entry['function'];source=(ROOT/entry['source']).read_text()
    actual=extract(source,name)
    assert actual==rule['after'] and actual!=rule['before']
    assert (ROOT/'tools/coccinelle'/('field-consumer-'+name+'.json')).read_text()==generate(entry)
    assert apply(source,rule)==(source,False)
    assert apply(rule['before'],rule)==(actual,True)
    for guarded in ['/*\n'+rule['before']+'\n*/',rule['before']+'\n'+rule['before'],
                    rule['before'].replace(entry['replacements'][0][0],'observe(); '+entry['replacements'][0][0],1)]:
        assert apply(guarded,rule)==(guarded,False)
    if '--reference-dir' in sys.argv:
        directory=Path(sys.argv[sys.argv.index('--reference-dir')+1]);stem=Path(entry['source']).stem.replace('_','-')
        assert extract((directory/('uw-field-consumers-'+stem+'-original.c')).read_text(),name)==rule['before']
    bodies += [actual,rule['before'].replace(name+'(', 'reference_'+name+'(',1)]
# Check the next-stage typed-pointer recipe against the same actual body.
from generate_use_trap_native_rules import ORIGINAL as NATIVE_BEFORE, converted as native_after, generate as native_generate
import json
native_recipe=json.loads(native_generate())
assert (ROOT/'tools/coccinelle/use-trap-native-fields.json').read_text()==native_generate()
assert extract((ROOT/'src/item_use.c').read_text(),'trigger_object_trap_or_use_action')==native_after()
assert apply(NATIVE_BEFORE,native_recipe)==(native_after(),True)
assert apply(native_after(),native_recipe)==(native_after(),False)
for guarded in [NATIVE_BEFORE.replace('ushort *local_1c;', 'ushort *local_1c; observe(&local_1c);'),
                NATIVE_BEFORE.replace('(object + 6)', '(object + 4)'),
                NATIVE_BEFORE+'\n'+NATIVE_BEFORE]:
    assert apply(guarded,native_recipe)==(guarded,False)
if '--native-reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--native-reference')+1]).read_text(),'trigger_object_trap_or_use_action')==NATIVE_BEFORE
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'field_consumers.c').write_text('\n'.join(bodies))
    exe=Path(tmp)/'consumers'
    result=subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types','-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/field_consumer_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    subprocess.run([str(exe)],check=True)
print('Field consumer generation, exact-body guards and callback comparisons passed')

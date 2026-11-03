"""Verify live recursive traversal and named size properties against actual original bodies."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_object_tree_native_rules import ENTRIES,recipe,generate
from apply_exact_source_rules import apply
from extract_functions import extract
bodies=[]
for entry in ENTRIES:
    rule=recipe(entry);name=entry['function'];actual=extract((ROOT/'src/objects.c').read_text(),name)
    assert actual==rule['after'] and actual!=rule['before']
    assert (ROOT/'tools/coccinelle'/('object-tree-native-'+name+'.json')).read_text()==generate(entry)
    assert apply(rule['before'],rule)==(actual,True) and apply(actual,rule)==(actual,False)
    for old,new in entry['replacements']:
        guarded=rule['before'].replace(old,old+' observe();',1)
        assert apply(guarded,rule)==(guarded,False)
    for guarded in ['/*\n'+rule['before']+'\n*/',rule['before']+'\n'+rule['before']]:
        assert apply(guarded,rule)==(guarded,False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),name)==rule['before']
    bodies += [actual,rule['before'].replace(name+'(','reference_'+name+'(')]
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'object_tree_native_functions.c').write_text('\n'.join(bodies))
    exe=Path(tmp)/'object_tree'
    result=subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types','-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/object_tree_native_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    subprocess.run([str(exe)],check=True)
print('Object tree/size recipes, observer/scope guards, original call trees and independent bytes passed')

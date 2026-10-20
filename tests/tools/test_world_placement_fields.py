"""Compare complete world-placement call trees with mutating helpers and byte invariants."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_world_placement_rules import ENTRIES,recipe,generate
from apply_exact_source_rules import apply
from extract_functions import extract
current=[];previous=[]
for entry in ENTRIES:
    rule=recipe(entry);name=entry['function'];actual=extract((ROOT/'src/objects.c').read_text(),name)
    assert actual==rule['after'] and actual!=rule['before']
    assert (ROOT/'tools/coccinelle'/('world-placement-'+name+'.json')).read_text()==generate(entry)
    assert apply(rule['before'],rule)==(actual,True) and apply(actual,rule)==(actual,False)
    for old,new in entry['replacements']:
        guarded=rule['before'].replace(old,old+' observe();',1)
        assert apply(guarded,rule)==(guarded,False)
    for guarded in ['/*\n'+rule['before']+'\n*/',rule['before']+'\n'+rule['before']]:
        assert apply(guarded,rule)==(guarded,False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),name)==rule['before']
    current.append(actual);previous.append(rule['before'])
assert 'uVar1 = header->position_word;' in current[1]
assert 'bVar3 = (byte)(uVar1 & 0x3ff);' not in current[1]
assert 'bVar3 = bVar3 + 1;' in current[1]
assert 'bVar3' not in current[1].split('  pTile =',1)[1]
old='\n'.join(previous)
for entry in ENTRIES:old=old.replace(entry['function']+'(', 'reference_'+entry['function']+'(')
# Put the inner search definition before both wrappers so their call trees are
# entirely independent and have identical helper services.
functions=current[1]+'\n'+current[0]+'\n'+old
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    # Original wrapper calls its original search, whose definition comes later.
    forward='int reference_find_object_placement(ushort *,uint,uint,short,short);\n'
    (Path(tmp)/'world_placement_functions.c').write_text(forward+functions)
    exe=Path(tmp)/'world_placement'
    result=subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types','-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/world_placement_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    subprocess.run([str(exe)],check=True)
print('World-placement recipes, exact scope, complete call-tree comparisons and independent field checks passed')

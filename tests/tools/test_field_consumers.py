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
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'field_consumers.c').write_text('\n'.join(bodies))
    exe=Path(tmp)/'consumers'
    result=subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types','-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/field_consumer_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    subprocess.run([str(exe)],check=True)
print('Field consumer generation, exact-body guards and callback comparisons passed')

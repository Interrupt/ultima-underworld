"""Verify collision, debug-coordinate and trap-header recipes against original bodies."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_consumer_view_rules import SOURCES, ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply
from extract_functions import extract
functions=[]
for name,original in ORIGINALS.items():
    actual=extract((ROOT/'src'/SOURCES[name]).read_text(),name)
    assert actual==converted(name) and actual!=original
    assert recipe_path(name).read_text()==generate(name)
    recipe=json.loads(generate(name))
    assert apply(original,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
    if '--reference-dir' in sys.argv:
        folder=Path(sys.argv[sys.argv.index('--reference-dir')+1])
        assert extract((folder/('uw-consumer-views-original-'+SOURCES[name])).read_text(),name)==original
    for old in ['spawn_scheduled_effect_object(', 'fprintf(', 'resolve_object_link(', 'dispatch_trap_type_effect(']:
        if old in original:
            protected=original.replace(old,'observe(); '+old,1)
            assert apply(protected,recipe)==(protected,False)
    for protected in ['/*\n'+original+'\n*/',original+'\n'+original,original.replace(name,'excluded')]:
        assert apply(protected,recipe)==(protected,False)
    if name=='collision_response_default':
        capture='uVar5 = DAT_0010190c->goal_word & 0xfff;'
        assert capture in original
        protected=original.replace(capture,capture+' escape(&uVar5);',1)
        assert apply(protected,recipe)==(protected,False)
    if name=='process_nearby_background_traps':
        for raw in ['*(undefined2 *)(pbVar5 + 0xd)','*(char *)(pbVar5 + 0xd)','*(byte *)(pbVar5 + 0xe)']:
            assert raw in original and raw in actual
    functions += [actual,original.replace(name+'(','reference_'+name+'(',1)]
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'consumer_view_functions.c').write_text('\n'.join(functions))
    exe=Path(tmp)/'consumer_view'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/consumer_view_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Consumer generation, exact conversion, scope guards and retained extension exceptions pass')

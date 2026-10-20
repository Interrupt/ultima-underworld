"""Verify effect property recipes and original/current callback behavior."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_effect_property_rules import SOURCES, ORIGINALS, converted, generate, recipe_path
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
        assert extract((folder/('uw-effect-fields-original-'+SOURCES[name])).read_text(),name)==original
    for old in ['ce_rand(', 'spawn_new_object(', 'scheduler_get_delay(', 'place_object_in_world(']:
        if old in original:
            protected=original.replace(old,'observe(); '+old,1)
            assert apply(protected,recipe)==(protected,False)
    variable={'spawn_and_prime_spell_effect_object':'uVar2','spawn_random_variant_object_at_tile':'uVar6','scheduler_advance_effect':'uVar5'}[name]
    protected=original.replace(variable+' =', 'escape(&'+variable+'); '+variable+' =',1)
    assert protected!=original and apply(protected,recipe)==(protected,False)
    for protected in ['/*\n'+original+'\n*/',original+'\n'+original,original.replace(name,'excluded')]:
        assert apply(protected,recipe)==(protected,False)
    functions += [actual,original.replace(name+'(','reference_'+name+'(',1)]
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'effect_property_functions.c').write_text('\n'.join(functions))
    exe=Path(tmp)/'effect_property'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/effect_property_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Effect property generation, exact conversion, idempotence and scope/capture guards pass')

"""Verify guarded container ID recipes and full original/current UI state."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_container_state_rules import ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply
from extract_functions import extract
functions=[]
for name,original in ORIGINALS.items():
    actual=extract((ROOT/'src/containers.c').read_text(),name)
    assert actual==converted(name) and actual!=original
    assert recipe_path(name).read_text()==generate(name)
    recipe=json.loads(generate(name))
    assert apply(original,recipe)==(actual,True) and apply(actual,recipe)==(actual,False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),name)==original
    for old,new in [('< 0xc','< 0x10'),('(uVar1 & 1) != 0','(uVar1 & 1) == 0'),('(uVar3 & 1) == 0','(uVar3 & 1) != 0'),('uVar1 =','escape(&uVar1); uVar1 ='),('uVar3 =','escape(&uVar3); uVar3 ='),('ushort ','volatile ushort ')]:
        if old in original:
            protected=original.replace(old,new,1);assert apply(protected,recipe)==(protected,False)
    for old in ['resolve_object_link(', 'get_object_record_by_slot_index(', 'refresh_container_view(']:
        if old in original:
            protected=original.replace(old,'observe(); '+old,1);assert apply(protected,recipe)==(protected,False)
    for protected in ['/*\n'+original+'\n*/',original+'\n'+original,original.replace(name,'excluded')]:
        assert apply(protected,recipe)==(protected,False)
    functions += [actual,original.replace(name+'(','reference_'+name+'(',1)]
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'container_state_functions.c').write_text('\n'.join(functions))
    exe=Path(tmp)/'container_state'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/container_state_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Container generation, exact conversion, guarded arithmetic and scope/capture refusals pass')

"""Verify linked-object recipes and captured/callback behavior against original bodies."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_linked_object_rules import SOURCES, ORIGINALS, converted, generate, recipe_path
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
        assert extract((folder/('uw-linked-fields-original-'+SOURCES[name])).read_text(),name)==original
    for old,new in [('ushort ', 'volatile ushort ')]:
        assert old in original
        protected=original.replace(old,new,1); assert apply(protected,recipe)==(protected,False)
    capture = {'check_object_combination': 'uVar1 = ((uw_object_hdr_t *)puVar4)->type_flags;',
               'consume_linked_special_object_charge': 'uVar1 = ((uw_object_hdr_t *)iVar3)->chain_word;',
               'purge_tagged_objects_from_chain': 'ushort *link_field = (ushort *)link_field_ptr;'}[name]
    assert capture in original
    escaped = 'link_field' if name=='purge_tagged_objects_from_chain' else 'uVar1'
    protected=original.replace(capture,capture+' escape(&'+escaped+');',1)
    assert apply(protected,recipe)==(protected,False)
    for old in ['free_object_slot(', 'find_object_in_chain(', 'resolve_object_link(']:
        if old in original:
            protected=original.replace(old,'observe(); '+old,1)
            assert apply(protected,recipe)==(protected,False)
    for protected in ['/*\n'+original+'\n*/',original+'\n'+original,original.replace(name,'excluded')]:
        assert apply(protected,recipe)==(protected,False)
    # Rename recursive calls together with the original definition: reference
    # traversal must never dispatch back into the converted implementation.
    functions += [actual,original.replace(name+'(','reference_'+name+'(')]
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    (Path(tmp)/'linked_object_functions.c').write_text('\n'.join(functions))
    exe=Path(tmp)/'linked_object'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/linked_object_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Linked-object generation, exact conversion, idempotence and scope/callback guards pass')

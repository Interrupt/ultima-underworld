"""Check native walkers against prior bodies, mutating helpers and real save regression tests."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_inventory_native_rules import ENTRIES,recipe,generate
from apply_exact_source_rules import apply
from extract_functions import extract
source=(ROOT/'src/inventory.c').read_text()
current={}
previous={}
for entry in ENTRIES:
    rule=recipe(entry);name=entry['function'];current[name]=extract(source,name);previous[name]=rule['before']
    assert current[name]==rule['after'] and current[name]!=previous[name]
    assert (ROOT/'tools/coccinelle'/('inventory-native-'+name+'.json')).read_text()==generate(entry)
    assert apply(previous[name],rule)==(current[name],True) and apply(current[name],rule)==(current[name],False)
    for guarded in [previous[name]+'\n'+previous[name], '/*\n'+previous[name]+'\n*/',
                    previous[name].replace('uint uVar','volatile uint uVar',1)]:
        assert apply(guarded,rule)==(guarded,False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),name)==previous[name]
# These helpers are common-header accessors only. Pin their simple return
# provenance before allowing the pointer-role auditor to seed save-record roles.
from audit_object_roles import ACCESSORS
assert {'alloc_save_record_slot','save_record_slot_from_index'} <= ACCESSORS
allocator=extract(source,'alloc_save_record_slot')
resolver=extract(source,'save_record_slot_from_index')
assert allocator.count('return ') == 1 and 'return g_save_record_base_ptr + g_save_record_count * 8;' in allocator
assert resolver.count('return ') == 1 and 'return iVar1;' in resolver
assert 'iVar1 = 0;' in resolver and 'iVar1 = g_save_record_base_ptr + slot_index * 8;' in resolver
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    functions=list(current.values())
    # Rename recursive self calls as well as definitions to keep both trees isolated.
    functions += [body.replace(name+'(', 'reference_'+name+'(') for name,body in previous.items()]
    (Path(tmp)/'inventory_native_functions.c').write_text('\n'.join(functions))
    def run(parts,exe):
        result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign','-Wno-incompatible-pointer-types',
            '-Wno-address-of-packed-member',*flags,'-I',str(ROOT),'-I',tmp,'-I',str(ROOT/'third_party/unity/src'),
            *map(str,parts),'-o',str(exe)],capture_output=True,text=True)
        assert result.returncode==0,result.stdout+result.stderr
        return subprocess.check_output([str(exe)],text=True)
    print(run([ROOT/'tests/tools/inventory_native_fixture.c'],Path(tmp)/'walkers').strip())
    support=[('level.c','reset_level_object_arena'),('objects.c','alloc_object_slot'),
        ('objects.c','encode_object_slot_index'),('objects.c','resolve_object_link'),
        ('inventory.c','alloc_save_record_slot'),('inventory.c','save_record_slot_from_index'),
        ('containers.c','encode_equipped_item_index'),('containers.c','decode_equipped_item_index'),
        ('player.c','build_player_save_record'),('player.c','restore_player_save_record')]
    common='\n'.join(extract((ROOT/'src'/file).read_text(),name) for file,name in support)
    outputs=[]
    for name,functions in [('previous',previous),('current',current)]:
        path=Path(tmp)/'records.c'
        path.write_text('#include "src/headers/uw.h"\nextern char *DAT_002046ac, *DAT_002046a0;\n'+common+'\n'+'\n'.join(functions.values()))
        outputs.append(run([path,ROOT/'tests/test_save_inventory.c',ROOT/'tests/support/division.c',
            ROOT/'src/options.c',ROOT/'third_party/unity/src/unity.c'],Path(tmp)/name))
    assert outputs[0]==outputs[1]
    print(outputs[-1].strip())
print('Inventory native recipes, full callback comparison and real save regressions passed')

"""Verify placement/finalization recipes and their full original/current behavior."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_babl_transfer_rules import ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply
from extract_functions import extract
source = (ROOT/'src/babl.c').read_text()
flags = ['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
fixtures = {'babl_builtin_place_object': 'babl_place', 'finalize_player_barter_items': 'barter_finalize'}
for name, original in ORIGINALS.items():
    assert recipe_path(name).read_text() == generate(name)
    recipe = json.loads(generate(name)); actual = extract(source, name)
    assert actual == converted(name) and actual != original
    assert apply(original, recipe) == (actual, True) and apply(actual, recipe) == (actual, False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(), name) == original
    variants = [('ushort uVar2;', 'volatile ushort uVar2;'),
                ('uVar2 = ((uw_object_hdr_t *)puVar4)->position_word;', 'uVar2 = ((uw_object_hdr_t *)puVar4)->position_word; escape(&uVar2);'),
                ('pbVar9 = (byte *)tilemap_lookup', 'observe(); pbVar9 = (byte *)tilemap_lookup'),
                ('& 0xff80', '& 0xffc0'), ('puVar7 = (ushort *)((char *)link_cursor + 4);', 'observe();')] if name == 'babl_builtin_place_object' else [
                ('int iVar4;', 'volatile int iVar4;'), ('iVar4 = ', 'escape(&iVar4); iVar4 = '),
                ('< 999', '< 1000'), ('free_object_slot(puVar2);', 'observe(); free_object_slot(puVar2);'),
                ('*psVar5 = 0;', '*psVar5 = observe();')]
    for before, after in variants:
        assert before in original
        protected = original.replace(before, after, 1); assert apply(protected, recipe) == (protected, False)
    for protected in ['/*\n'+original+'\n*/', original+'\n'+original, original.replace(name,'excluded',1)]:
        assert apply(protected, recipe) == (protected, False)
    with tempfile.TemporaryDirectory() as tmp:
        fixture = fixtures[name]
        assert original.count(name+'(') == 1
        (Path(tmp)/(fixture+'_functions.c')).write_text(actual+'\n'+original.replace(name+'(', 'reference_'+name+'(', 1))
        exe = Path(tmp)/fixture
        result = subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
            str(ROOT/'tests/tools'/(fixture+'_fixture.c')),'-o',str(exe)],capture_output=True,text=True)
        assert result.returncode == 0, result.stdout+result.stderr
        print(subprocess.check_output([str(exe)],text=True).strip())
print('BABL transfer generation, exact conversion, idempotence and capture/scope guards pass')

"""Verify BABL stack recipes and compare their actual original/current functions."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_babl_stack_rules import ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply
from extract_functions import extract
source = (ROOT/'src/babl.c').read_text()
for name, original in ORIGINALS.items():
    assert recipe_path(name).read_text() == generate(name)
    recipe = json.loads(generate(name)); actual = extract(source, name)
    assert actual == converted(name) and actual != original
    assert apply(original, recipe) == (actual, True)
    assert apply(actual, recipe) == (actual, False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(), name) == original
    variants = [('ushort uVar1;', 'volatile ushort uVar1;'), ('< 999', '< 1000'),
                ('iVar6 = ', 'escape(&iVar6); iVar6 = '),
                ('free_object_slot(', 'observe(); free_object_slot('),
                ('puVar4 = puVar4 + 2;' if name == 'babl_builtin_do_inv_create' else '*psVar7 = sVar4;',
                 'observe();')]
    for before, after in variants:
        assert before in original
        protected = original.replace(before, after, 1)
        assert apply(protected, recipe) == (protected, False)
    for protected in ['/*\n'+original+'\n*/', original+'\n'+original, original.replace(name, 'excluded', 1)]:
        assert apply(protected, recipe) == (protected, False)
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    reference = []
    for name, original in ORIGINALS.items():
        assert original.count(name+'(') == 1
        reference.append(original.replace(name+'(', 'reference_'+name+'(', 1))
    path = Path(tmp)/'babl_stack_functions.c'
    path.write_text('\n'.join(converted(name) for name in ORIGINALS)+'\n'+'\n'.join(reference))
    exe = Path(tmp)/'babl_stack'
    result = subprocess.run(['cc','-std=c11','-O0' if '--o0' in sys.argv else '-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/babl_stack_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode == 0, result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('BABL stack generation, exact conversion, idempotence and capture/scope guards pass')

"""Check exact creature-drop rules, exclusions and original/current behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_creature_drop_rules import ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply
from extract_functions import extract
import json
source = (ROOT/'src/ai.c').read_text()
for name, original in ORIGINALS.items():
    assert recipe_path(name).read_text() == generate(name)
    recipe = json.loads(generate(name))
    actual = extract(source, name)
    assert actual == converted(name) and actual != original
    result, changed = apply(original, recipe)
    assert changed and result == actual
    assert apply(result, recipe) == (result, False)
    if '--reference' in sys.argv:
        reference = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
        assert extract(reference, name) == original
    for before, after in [('undefined4 ', 'volatile undefined4 '),
                          ('uVar5 = ce_rand();' if 'uVar5 = ce_rand();' in original else 'uVar2 = ce_rand();', 'observe(); ce_rand();'),
                          ('object_list_insert_head(creature + 6,', 'escape(&creature); object_list_insert_head(creature + 6,'),
                          ('& 0x3f' if '& 0x3f' in original else '& 0xf', '& 7')]:
        assert before in original
        protected = original.replace(before, after, 1)
        assert apply(protected, recipe) == (protected, False)
    for protected in ['/*\n'+original+'\n*/', original+'\n'+original, original.replace(name, 'excluded', 1)]:
        assert apply(protected, recipe) == (protected, False)
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'creature_drop_functions.c'
    path.write_text('\n'.join(converted(name)+'\n'+original.replace(name+'(', 'reference_'+name+'(', 1)
                              for name, original in ORIGINALS.items()))
    exe = Path(tmp)/'creature_drop'
    result = subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
                            str(ROOT/'tests/tools/creature_drop_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode == 0, result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Creature-drop generation, exact conversion, idempotence and scope/capture guards pass')

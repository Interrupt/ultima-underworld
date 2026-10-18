"""Verify engage/alignment conversions and compare their actual full functions."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_engage_rules import ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply
from extract_functions import extract
source = (ROOT/'src/combat.c').read_text()
for name, original in ORIGINALS.items():
    assert recipe_path(name).read_text() == generate(name)
    recipe = json.loads(generate(name)); actual = extract(source, name)
    assert actual == converted(name) and actual != original
    assert apply(original, recipe) == (actual, True)
    assert apply(actual, recipe) == (actual, False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(), name) == original
    for before, after in [('int uw_ord2005_rem_', 'volatile int uw_ord2005_rem_'),
                          ('(char *)DAT_0010190c;', '(char *)DAT_0010190c; observe();'),
                          ('& 0xfff' if '& 0xfff' in original else '& 0xfc7f', '& 0xff'),
                          ('uVar3 = DAT_0010190c->hdr.position_word;' if name == 'check_npc_target_alignment' else
                           'uVar1 = DAT_0010190c->goal_word;' if 'wide' in name else 'uVar4 = DAT_0010190c->goal_word;',
                           'escape(&DAT_0010190c);'),
                          ('position_word_high =' if name == 'check_npc_target_alignment' else 'goal_word_high =',
                           'position_word_high = observe(),' if name == 'check_npc_target_alignment' else 'goal_word_high = observe(),')]:
        assert before in original, (name, before)
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
    path = Path(tmp)/'combat_engage_functions.c'
    path.write_text('\n'.join(converted(name) for name in ORIGINALS)+'\n'+'\n'.join(reference))
    exe = Path(tmp)/'combat_engage'
    result = subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/combat_engage_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode == 0, result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Engage/alignment generation, exact conversion, idempotence and capture/scope guards pass')

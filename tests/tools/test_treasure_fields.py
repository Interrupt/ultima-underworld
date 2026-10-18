"""Verify treasure and dispatcher recipes against their actual original functions."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_treasure_rules import ORIGINALS, converted, generate, recipe_path
from apply_exact_source_rules import apply, NONCODE
from extract_functions import extract
source = (ROOT/'src/ai.c').read_text()
assert 'DAT_002034b5' not in NONCODE.sub(' ', source)
for name, original in ORIGINALS.items():
    assert recipe_path(name).read_text() == generate(name)
    recipe = json.loads(generate(name)); actual = extract(source, name)
    assert actual == converted(name) and actual != original
    assert apply(original, recipe) == (actual, True)
    assert apply(actual, recipe) == (actual, False)
    if '--reference' in sys.argv:
        assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(), name) == original
    variants = [('npc_loot_spawned = 1;', 'npc_loot_spawned = observe();'),
                ('*creature & 0x30', '*creature & 0x70'),
                ('spawn_creature_special_item_drop(creature);', 'observe(); spawn_creature_special_item_drop(creature);')] if name.endswith('death_loot') else [
                ('uint uVar2;', 'volatile uint uVar2;'),
                ('sVar6 = DAT_00201b68;', 'sVar6 = DAT_00201b68; escape(&sVar6);'),
                ('uVar7 = ce_rand();', 'observe(); uVar7 = ce_rand();'),
                ('cVar4 * 0xd', 'cVar4 * 0xc'),
                ('& 0x3ff', '& 0x1ff')]
    for before, after in variants:
        assert before in original
        protected = original.replace(before, after, 1)
        assert apply(protected, recipe) == (protected, False)
    for protected in ['/*\n'+original+'\n*/', original+'\n'+original, original.replace(name, 'excluded', 1)]:
        assert apply(protected, recipe) == (protected, False)
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    names = ['spawn_creature_treasure_drop', 'spawn_creature_death_loot']
    reference = '\n'.join(ORIGINALS[name] for name in names)
    assert reference.count('spawn_creature_treasure_drop(') == 2
    for name in ORIGINALS: reference = reference.replace(name+'(', 'reference_'+name+'(')
    assert 'reference_spawn_creature_treasure_drop(creature);' in reference
    path = Path(tmp)/'treasure_functions.c'
    path.write_text('\n'.join(converted(name) for name in names)+'\n'+reference)
    exe = Path(tmp)/'treasure'
    result = subprocess.run(['cc','-std=c11','-O0' if '--o0' in sys.argv else '-O2','-Wno-pointer-sign',*flags,'-I',str(ROOT),'-I',tmp,
        str(ROOT/'tests/tools/treasure_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode == 0, result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Treasure/dispatch generation, exact conversion, idempotence and capture/scope guards pass')

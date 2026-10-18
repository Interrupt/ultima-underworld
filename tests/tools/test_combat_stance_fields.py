"""Verify the guarded rule and original/current combat_stance behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile
import re
import shutil

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_combat_stance_rules import FUNCTION, ORIGINAL, converted, generate, generate_cocci
from extract_functions import extract
from apply_exact_source_rules import NONCODE

# The target alias is a common header because its sole source assignment is
# the object-slot accessor. Check that provenance before accepting the rule.
target_assignments = []
for path in sorted((ROOT/'src').glob('*.c')):
    code = NONCODE.sub(' ', path.read_text())
    target_assignments.extend(re.findall(r'\bDAT_00101400\s*=(?!=)\s*([^;]+);', code))
assert [re.sub(r'\s+', '', value) for value in target_assignments] == [
    'get_object_record_by_slot_index(DAT_0010190c->npc_gtarg)']

PATCH = ROOT/'tools/coccinelle/combat-stance-fields.json'
assert PATCH.read_text() == generate()
assert (PATCH.with_suffix('.cocci')).read_text() == generate_cocci()
spatch = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith('--') else shutil.which('spatch')
assert spatch, 'Coccinelle is required for the stance conversion test'
actual = extract((ROOT/'src/combat.c').read_text(), FUNCTION)
assert actual != ORIGINAL, 'stance conversion has not been applied'
code = NONCODE.sub(' ', actual)
for member in ['goal_word', 'target_word', 'motion_flags']:
    assert not re.search(r'->' + member + r'\b', code), member
for field in ['npc_animation_frame', 'npc_swing_charge', 'speed', 'gravity_flag', 'pitch']:
    assert '->' + field in code, field
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'combat_stance_functions.c'
    def apply():
        result = subprocess.run([sys.executable, '-B', str(ROOT/'tools/coccinelle/apply_combat_stance_rules.py'),
            str(path), '--spatch', spatch], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert extract(path.read_text(), FUNCTION) == converted()
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('ushort uVar2;', 'volatile ushort uVar2;'),
        ('uVar9 = uVar2 & 0xfff;', 'uVar9 = uVar2 & 0xfff; observe();'),
        ('uVar2 = DAT_0010190c->goal_word;', 'uVar2 = DAT_0010190c->goal_word; escape(&uVar9);'),
        ('uVar5 = ce_rand();', 'observe(uVar2); uVar5 = ce_rand();'),
        ('& 0x7f ^ bVar8;', '& 0x3f ^ bVar8;'),
        ('->goal_word_high =', '->goal_word_high = observe_byte(),')]:
        assert old in ORIGINAL
        protected = ORIGINAL.replace(old, new, 1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(), FUNCTION) == protected, old
    excluded = ORIGINAL.replace(FUNCTION, 'excluded', 1)
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(), 'excluded') == excluded
    quoted = '/* Example only:\n'+ORIGINAL+'\n*/\n'
    path.write_text(quoted); apply(); assert path.read_text() == quoted
    ambiguous = ORIGINAL+'\n'+ORIGINAL
    path.write_text(ambiguous); apply(); assert path.read_text() == ambiguous
    path.write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(', 1))
    exe = Path(tmp)/'combat_stance'
    result = subprocess.run(['cc', '-std=c11', '-O2', '-Wno-pointer-sign', *flags, '-I', str(ROOT),
        '-I', tmp, str(ROOT/'tests/tools/combat_stance_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Coccinelle stance conversion, idempotence and callback/capture/scope guards pass')

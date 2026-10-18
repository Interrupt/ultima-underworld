"""Verify the guarded rule and original/current drop_height behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile
import re

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_drop_height_rules import FUNCTION, ORIGINAL, converted, generate
from extract_functions import extract
from apply_exact_source_rules import NONCODE

# The sole caller constructs a projectile in the mobile arena. Preserve that
# provenance when selecting its extension layout rather than guessing NPC fields.
caller = extract((ROOT/'src/objects.c').read_text(), 'spawn_object_near_player')
assert 'uw_projectile_object_t *puVar6;' in caller
assert 'puVar6 = (uw_projectile_object_t *)alloc_object_slot(1);' in caller
calls = []
for path in sorted((ROOT/'src').glob('*.c')):
    code = NONCODE.sub(' ', path.read_text())
    calls.extend(re.findall(r'\bcheck_object_drop_height\s*\(([^;{}]*)\)\s*;', code))
assert [re.sub(r'\s+', '', value) for value in calls] == ['(ushort*)puVar6,DAT_00202a44']

PATCH = ROOT/'tools/coccinelle/drop-height-fields.json'
assert PATCH.read_text() == generate()
actual = extract((ROOT/'src/object_actions.c').read_text(), FUNCTION)
assert actual == converted() and actual != ORIGINAL
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'drop_height_functions.c'
    def apply():
        result = subprocess.run([sys.executable, '-B', str(ROOT/'tools/coccinelle/apply_exact_source_rules.py'),
            str(PATCH), str(path)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert extract(path.read_text(), FUNCTION) == actual
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('ushort uVar2;', 'volatile ushort uVar2;'),
        ('uVar6 = uVar2 & 0x3ff;', 'uVar6 = uVar2 & 0x3ff; observe();'),
        ('uVar7 = uVar7 & 0x3ff;', 'uVar7 = uVar7 & 0x3ff; escape(&uVar7);'),
        ('collision_build_height_field(0);', 'observe(uVar2); collision_build_height_field(0);'),
        ('& 0x1fff', '& 0x3fff'),
        ('->position_word_high =', '->position_word_high = observe_byte(),')]:
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
    exe = Path(tmp)/'drop_height'
    result = subprocess.run(['cc', '-std=c11', '-O2', '-Wno-pointer-sign', *flags, '-I', str(ROOT),
        '-I', tmp, str(ROOT/'tests/tools/drop_height_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Exact drop_height conversion, idempotence and callback/capture/scope guards pass')

"""Verify light-use migration and original/current behavior without freezing production text."""
from pathlib import Path
import subprocess
import sys
import tempfile
import re
import shutil

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_light_use_rules import FUNCTION, ORIGINAL, converted, generate, generate_cocci
from extract_functions import extract
from apply_exact_source_rules import NONCODE

PATCH = ROOT/'tools/coccinelle/light-use-fields.json'
assert PATCH.read_text() == generate()
assert PATCH.with_suffix('.cocci').read_text() == generate_cocci()
spatch = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith('--') else shutil.which('spatch')
assert spatch, 'Coccinelle is required'
actual = extract((ROOT/'src/item_use.c').read_text(), FUNCTION)
code = NONCODE.sub(' ', actual)
for field in ['is_quant', 'link', 'quality', 'object_id']:
    assert '->' + field in code, field
assert not re.search(r'\bobject\s*\[', code)
assert not re.search(r'->(?:type_flags|chain_word|link_word)\b', code)
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'light_use_functions.c'
    def apply():
        result = subprocess.run([sys.executable, '-B', str(ROOT/'tools/coccinelle/apply_light_use_rules.py'),
            str(path), '--spatch', spatch], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert extract(path.read_text(), FUNCTION) == converted()
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('ushort uVar10;', 'volatile ushort uVar10;'),
        ('bVar2 = (byte)uVar10;', 'bVar2 = (byte)uVar10; observe();'),
        ('uVar10 = *object;', 'uVar10 = *object; escape(&uVar10);'),
        ('& 0xf ^ bVar2;', '& 0x7 ^ bVar2;'),
        ('uVar10 == 1', 'uVar10 == 2'),
        ('object[3] >> 6', 'object[3] >> 5')]:
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
    exe = Path(tmp)/'light_use'
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT),
        '-I', tmp, str(ROOT/'tests/tools/light_use_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Light-use Coccinelle conversion, idempotence and capture/scope guards pass')

"""Verify the guarded rule and original/current light_decay behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_light_decay_rules import FUNCTION, ORIGINAL, converted, generate
from extract_functions import extract

PATCH = ROOT/'tools/coccinelle/light-decay-fields.cocci'
assert PATCH.read_text() == generate()
actual = extract((ROOT/'src/player.c').read_text(), FUNCTION)
assert actual == converted() and actual != ORIGINAL
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'light_decay_functions.c'
    def apply():
        result = subprocess.run([sys.argv[1], '--sp-file', str(PATCH), str(path),
            '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
            '-I', str(ROOT/'src'), '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert extract(path.read_text(), FUNCTION) == actual
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('ushort uVar3;', 'volatile ushort uVar3;'),
        ('bVar4 = (byte)uVar3;', 'bVar4 = (byte)uVar3; observe();'),
        ('uVar7 = uVar3 & 0xffc0;', 'uVar7 = uVar3 & 0xffc0; escape(&uVar3);'),
        ('uVar10 = 1;', 'observe(uVar2); uVar10 = 1;'),
        ('& 0x3f ^ bVar4', '& 0x1f ^ bVar4'),
        ('uVar7 < 8', 'uVar7 < 9')]:
        assert old in ORIGINAL
        protected = ORIGINAL.replace(old, new, 1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(), FUNCTION) == protected, old
    excluded = ORIGINAL.replace(FUNCTION, 'excluded', 1)
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(), 'excluded') == excluded
    path.write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(', 1))
    exe = Path(tmp)/'light_decay'
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT),
        '-I', tmp, str(ROOT/'tests/tools/light_decay_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Exact light_decay conversion, idempotence and callback/capture/scope guards pass')

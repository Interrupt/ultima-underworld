"""Verify the guarded rule and original/current arena_reset behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_arena_reset_rules import FUNCTION, ORIGINAL, converted, generate
from extract_functions import extract

PATCH = ROOT/'tools/coccinelle/arena-reset-fields.json'
assert PATCH.read_text() == generate()
actual = extract((ROOT/'src/level.c').read_text(), FUNCTION)
assert actual == converted() and actual != ORIGINAL
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
# The fixture's external player covers every preserved low field and every
# cleared ten-bit link value. The first sixteen tile rows cover every word-0
# pattern; the tile sweep also covers every wall texture and head value.
for multiplier in (17, 53):
    values = [(seed * multiplier) & 65535 for seed in range(4096)]
    assert {value & 63 for value in values} == set(range(64))
    assert {value >> 6 for value in values} == set(range(1024))
assert {(seed * 4096 + tile) & 65535 for seed in range(16) for tile in range(4096)} == set(range(65536))
assert {(tile * 17 & 65535) >> 6 for tile in range(4096)} == set(range(1024))
assert {tile * 17 & 63 for tile in range(4096)} == set(range(64))
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'arena_reset_functions.c'
    def apply():
        result = subprocess.run([sys.executable, '-B', str(ROOT/'tools/coccinelle/apply_exact_source_rules.py'),
            str(PATCH), str(path)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert extract(path.read_text(), FUNCTION) == actual
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('ushort *free_list_cursor;', 'volatile ushort *free_list_cursor;'),
        ('index = 2;', 'index = 2; observe();'),
        ('char *tile_record = DAT_002029cc;', 'char *tile_record = DAT_002029cc; escape(&tile_record);'),
        ('reset_equipment_and_container_state();', 'observe(); reset_equipment_and_container_state();'),
        ('& 0x3f;', '& 0x1f;'),
        ('->hdr.chain_word_high = 0;', '->hdr.chain_word_high = observe_byte();')]:
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
    exe = Path(tmp)/'arena_reset'
    result = subprocess.run(['cc', '-std=c11', '-O2', '-Wno-pointer-sign', *flags, '-I', str(ROOT),
        '-I', tmp, str(ROOT/'tests/tools/arena_reset_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Exact arena_reset conversion, idempotence and callback/capture/scope guards pass')

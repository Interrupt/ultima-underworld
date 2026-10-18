"""Verify the guarded rule and original/current monster_loot behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_monster_loot_rules import FUNCTION, ORIGINAL, converted, generate
from extract_functions import extract

PATCH = ROOT/'tools/coccinelle/monster-loot-fields.json'
assert PATCH.read_text() == generate()
actual = extract((ROOT/'src/ai.c').read_text(), FUNCTION)
assert actual == converted() and actual != ORIGINAL
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'monster_loot_functions.c'
    def apply():
        result = subprocess.run([sys.executable, '-B', str(ROOT/'tools/coccinelle/apply_exact_source_rules.py'),
            str(PATCH), str(path)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert extract(path.read_text(), FUNCTION) == actual
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('uint uVar6;', 'volatile uint uVar6;'),
        ('bVar1 = (byte)uVar6;', 'bVar1 = (byte)uVar6; observe();'),
        ('uVar3 = ((uw_object_hdr_t *)pDropObj)->link_word;',
         'uVar3 = ((uw_object_hdr_t *)pDropObj)->link_word; escape(&bVar1);'),
        ('object_list_insert_head(iVar4 + 2,pDropObj);',
         'observe(uVar6); object_list_insert_head(iVar4 + 2,pDropObj);'),
        ('& 0xffe8', '& 0xffe0'),
        ('->position_word_high = bVar2;', '->position_word_high = observe_byte(), bVar2;')]:
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
    exe = Path(tmp)/'monster_loot'
    result = subprocess.run(['cc', '-std=c11', '-O2', '-Wno-pointer-sign', *flags, '-I', str(ROOT),
        '-I', tmp, str(ROOT/'tests/tools/monster_loot_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Exact monster_loot conversion, idempotence and callback/capture/scope guards pass')

"""Verify special-link and narrowed signed header reads over all packed words."""
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_special_header_read_rules import forms, generate
from extract_functions import extract
PATCH = ROOT/'tools/coccinelle/special-header-reads.cocci'
assert PATCH.read_text() == generate()
spatch = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith('--') else shutil.which('spatch')
assert spatch
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
expressions = []
for member, obj in [('.', 'header'), ('->', '(&header)')]:
    expressions += [(before.replace('B', obj), field) for before, _, field in forms(member)]
negatives = '''
int excluded_mask(void) { return (short)(header.type_flags_signed & -0x4000) == 0; }
int excluded_sign(void) { return (short)header.link_word_signed >> 6; }
int excluded_offset(void) { return (ushort)header.link_word_signed >> 5; }
int excluded_link_bit(void) { return (header.link_word_signed & 0x4000U) != 0; }
'''
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'special_reads.c'
    source = '#include "src/headers/uw.h"\nuw_object_hdr_t header;\n'+ '\n'.join(
        f'int read_{i}(void) {{ return {expr}; }}' for i, (expr, _) in enumerate(expressions))+negatives+'''
static int calls;
static uw_object_hdr_t *once(void) { ++calls; return &header; }
int read_once(void) { return (short)(once()->type_flags_signed & -0x8000) == 0; }
'''
    path.write_text(source)
    def transform():
        result = subprocess.run([spatch, '--sp-file', str(PATCH), str(path), '--no-includes', '--in-place'],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    transform(); result = path.read_text()
    converted = []
    for i, (_, field) in enumerate(expressions):
        body = extract(result, f'read_{i}')
        assert re.search(r'(?:->|\.)'+field+r'\b', body), body
        converted.append(re.search(r'return\s+(.*?);', body, re.S).group(1))
    for function in ['excluded_mask', 'excluded_sign', 'excluded_offset', 'excluded_link_bit']:
        assert extract(result, function) == extract(source, function), function
    assert 'once()->is_quant' in extract(result, 'read_once')
    transform(); assert path.read_text() == result
    probes = []
    for (original, _), actual in zip(expressions, converted):
        probes += [f'assert(({original}) == ({actual}));',
                   f'assert((({original}) < -1) == (({actual}) < -1));',
                   f'assert(_Generic(({original}), int: 0, default: 1) == _Generic(({actual}), int: 0, default: 1));']
    path.write_text(result+'\n#include <assert.h>\nint main(void) {\n'
        'for (unsigned input = 0; input < 65536; ++input) {\n'
        'header.type_flags = input; header.link_word = input;\n'+ '\n'.join(probes)+
        '\ncalls = 0; assert(read_once() == !(input & 0x8000)); assert(calls == 1);\n}\nreturn 0;\n}\n')
    exe = Path(tmp)/'special_reads'
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), str(path), '-o', str(exe)],
                            capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    subprocess.run([str(exe)], check=True)
print('Special header reads: 6 expressions x 65,536 inputs, signedness, exclusions, single evaluation and idempotence pass')

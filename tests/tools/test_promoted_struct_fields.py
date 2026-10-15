"""Differentially test promoted masked reads, including integer sign extension."""
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_promoted_field_read_rules import generate
from struct_field_catalog import WORDS
from extract_functions import extract
PATCH = ROOT/'tools/coccinelle/promoted-field-reads.cocci'
assert PATCH.read_text() == generate()
spatch = sys.argv[1] if len(sys.argv) > 1 and not sys.argv[1].startswith('--') else shutil.which('spatch')
assert spatch
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []


def receiver(word):
    if word in ['type_flags', 'position_word', 'chain_word', 'link_word']:
        return 'mobile.hdr'
    if word == 'size_weight': return 'props'
    return 'mobile'


expressions, setters = [], []
for word, fields in WORDS.items():
    obj = receiver(word)
    setters.append(f'{obj}.{word} = input;')
    for shift, width, field in fields:
        mask = (1 << width) - 1
        for member, base in [('.', obj), ('->', f'(&{obj})')]:
            for suffix in ['', '_signed']:
                for cast in ['int', 'uint']:
                    value = f'({cast}){base}{member}{word}{suffix}'
                    for unsigned in ['', 'U']:
                        expressions += [(f'({value} >> {shift}) & {hex(mask)}{unsigned}', field),
                                        (f'({value} & {hex(mask << shift)}{unsigned}) >> {shift}', field),
                                        (f'{value} & {hex(mask << shift)}{unsigned}', field)]
expressions.append(('(int)mobile.hdr.type_flags_signed & 0x1ffU', 'object_id'))
header = '''#include "src/headers/uw.h"
extern uw_mobile_object_t mobile;
extern uw_object_type_props_t props;
'''
negatives = '''
int excluded_sign(void) { return (int)mobile.hdr.position_word_signed >> 13; }
int excluded_cross(void) { return (int)mobile.hdr.position_word & 0x1ff0; }
int excluded_short(void) { return (short)mobile.hdr.position_word & 0x1ff; }
int excluded_copy(void) { return (int)mobile.hdr.position_word; }
'''
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'reads.c'
    source = header+'\n'.join(f'int read_{i}(void) {{ return {expr}; }}'
                               for i, (expr, _) in enumerate(expressions))+'\n'+negatives+'''
static int receiver_calls;
static uw_object_hdr_t *header_once(void) { ++receiver_calls; return &mobile.hdr; }
int pointer_once(void) { return (int)header_once()->position_word_signed & 0x380; }
int check_once(void) { receiver_calls = 0; int v = pointer_once(); return receiver_calls == 1 && v == (mobile.hdr.heading << 7); }
'''
    path.write_text(source)
    reference = Path(tmp)/'reference.c'
    reference.write_text(header+'\n'.join(
        f'int reference_read_{i}(void) {{ return {expr}; }}\n'
        f'int reference_signed_{i}(void) {{ return ({expr}) < -1; }}\n'
        f'int reference_type_{i}(void) {{ return _Generic(({expr}), int: 0, unsigned int: 1, default: 2); }}'
        for i, (expr, _) in enumerate(expressions)))
    def transform():
        result = subprocess.run([spatch, '--sp-file', str(PATCH), str(path), '--no-includes', '--in-place'],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    transform()
    result = path.read_text()
    converted_expressions = []
    for i, (_, field) in enumerate(expressions):
        body = extract(result, f'read_{i}')
        assert re.search(r'(?:->|\.)'+field+r'\b', body), (i, expressions[i])
        converted_expressions.append(re.search(r'return\s+(.*?);', body, re.S).group(1))
    for function in ['excluded_sign', 'excluded_cross', 'excluded_short', 'excluded_copy']:
        assert extract(result, function) == extract(source, function), function
    assert 'header_once()->heading' in extract(result, 'pointer_once')
    transform(); assert path.read_text() == result, 'not idempotent'
    # Check the type and surrounding signed comparison of the exact expressions
    # emitted by Coccinelle, without making it repeatedly parse these probes.
    path.write_text(result+'\n'+'\n'.join(
        f'int signed_{i}(void) {{ return ({expr}) < -1; }}\n'
        f'int type_{i}(void) {{ return _Generic(({expr}), int: 0, unsigned int: 1, default: 2); }}'
        for i, expr in enumerate(converted_expressions)))
    driver = Path(tmp)/'main.c'
    driver.write_text(header+'''#include <assert.h>
uw_mobile_object_t mobile;
uw_object_type_props_t props;
int check_once(void);
'''+ '\n'.join(f'int read_{i}(void); int reference_read_{i}(void); int signed_{i}(void); int reference_signed_{i}(void); int type_{i}(void); int reference_type_{i}(void);' for i in range(len(expressions)))+'''
int main(void) {
    for (unsigned input = 0; input < 65536; ++input) {
'''+ '\n'.join(setters)+ '\n'+ '\n'.join(f'assert(read_{i}() == reference_read_{i}()); assert(signed_{i}() == reference_signed_{i}()); assert(type_{i}() == reference_type_{i}());' for i in range(len(expressions)))+'''
        assert(check_once());
    }
    return 0;
}
''')
    exe = Path(tmp)/'promoted_reads'
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT),
                             str(driver), str(path), str(reference), '-o', str(exe)], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    subprocess.run([str(exe)], check=True)
print(f'Promoted UW1 reads: {len(expressions)} expressions x 65,536 inputs with signed comparisons and expression types, exclusions, single receiver evaluation and idempotence pass')

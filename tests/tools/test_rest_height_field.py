"""Compare the actual path-height expression over all packed player positions."""
from pathlib import Path
import json
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_rest_height_rules import FUNCTION, ORIGINAL, BEFORE, AFTER, converted, generate
from apply_exact_source_rules import apply
from extract_functions import extract
actual = extract((ROOT/'src/ai.c').read_text(), FUNCTION)
assert actual == converted() and actual == ORIGINAL.replace(BEFORE, AFTER)
assert (ROOT/'tools/coccinelle/rest-player-height-field.json').read_text() == generate()
recipe = json.loads(generate())
assert apply(ORIGINAL, recipe) == (actual, True)
assert apply(actual, recipe) == (actual, False)
if '--reference' in sys.argv:
    assert extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(), FUNCTION) == ORIGINAL
for protected in [ORIGINAL.replace('0xffffff0f', '0xffffffff'),
                  ORIGINAL.replace(BEFORE, 'observe(); '+BEFORE),
                  '/*\n'+ORIGINAL+'\n*/', ORIGINAL+'\n'+ORIGINAL]:
    assert apply(protected, recipe) == (protected, False)
# Extract the complete actual argument, retaining CONCAT31, its mask, and the
# arbitrary upper stack bits. Do not execute the parent's uninitialized locals.
def expression(body):
    start = body.index('CONCAT31(')
    end = body.index(',0),', start)
    return body[start:end]
old, new = expression(ORIGINAL), expression(actual)
assert old.replace(BEFORE, AFTER) == new
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    source = Path(tmp)/'rest_height.c'
    source.write_text('''#include "src/headers/uw.h"
#include <assert.h>
static uw_mobile_object_t player;
uw_mobile_object_t *g_player_object = &player;
static uint original(uint in_stack_ffffffd0) { return '''+old+'''; }
static uint converted(uint in_stack_ffffffd0) { return '''+new+'''; }
int main(void) {
    unsigned long total = 0;
    for (unsigned position=0; position<65536; position++) {
        player.hdr.position_word = position;
        /* Every upper-bit basis vector plus mixed/boundary patterns. The
           upper component is an independent OR operand in both expressions. */
        for (unsigned mode=0; mode<28; mode++) {
            uint upper = mode<24 ? (1u << (mode+8)) :
                mode==24 ? 0 : mode==25 ? 0xffffffffu :
                mode==26 ? 0xaaaaaaaa : 0x55555555;
            uw_mobile_object_t saved = player;
            uint before = original(upper), after = converted(upper);
            assert(before == after);
            assert(after == ((upper & 0xffffff00u) | ((position & 127u) >> 3)));
            assert(memcmp(&saved, &player, sizeof player) == 0);
            total++;
        }
    }
    printf("%lu rest-height expression comparisons passed\\n", total);
}
''')
    exe = Path(tmp)/'rest_height'
    subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), str(source), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('Rest-height exact-body guards and expression checks passed; parent stack temporaries not executed')

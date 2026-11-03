"""Verify common-header save copies against real byte-copy game functions."""
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_inventory_record_rules import generate, changes
from extract_functions import extract
from generate_inventory_native_rules import ENTRIES as NATIVE_ENTRIES, recipe as native_recipe
from apply_exact_source_rules import apply as apply_native
PATCH = ROOT / 'tools/coccinelle/inventory-record-words.cocci'
assert PATCH.read_text() == generate()
SITES = {
    'serialize_inventory_link_chain': 'inventory.c',
    'deserialize_inventory_link_chain': 'inventory.c',
    'build_player_save_record': 'player.c',
    'restore_player_save_record': 'player.c',
}
current = {name: extract((ROOT / 'src' / source).read_text(), name)
           for name, source in SITES.items()}
original = dict(current)
for entry in NATIVE_ENTRIES:
    original[entry["function"]] = entry["before"]
for change in changes():
    function = change['function']
    after, before = change['after'], change['before']
    assert after in original[function], change['key']
    if '\n' in before:
        pattern = re.compile(r'(?m)^([ \t]*)' + re.escape(after))
        original[function], count = pattern.subn(
            lambda m: m[1] + before.replace('\n', '\n' + m[1]), original[function])
        assert count == 1
    else:
        original[function] = original[function].replace(after, before, 1)
if '--reference-dir' in sys.argv:
    directory = Path(sys.argv[sys.argv.index('--reference-dir') + 1])
    original = {name: extract((directory / source).read_text(), name)
                for name, source in SITES.items()}

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'records.c'
    def apply():
        result = subprocess.run([sys.argv[1], '--sp-file', str(PATCH), str(path),
            '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
            '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        # Compose the legacy byte-copy recipe with the separately reviewed
        # native-pointer stage; retain both original conversion oracles.
        text = path.read_text()
        for entry in NATIVE_ENTRIES:
            text, _ = apply_native(text, native_recipe(entry))
        path.write_text(text)
    path.write_text('#include "src/headers/uw.h"\n' + '\n'.join(original.values()))
    apply()
    for name in SITES:
        assert extract(path.read_text(), name) == current[name], name
    before = path.read_text(); apply(); assert path.read_text() == before
    # An intervening callback must keep the first byte pair separate.
    for name in list(SITES)[:2]:
        body = original[name]
        change = next(c for c in changes() if c['function'] == name)
        first, second = change['before'].splitlines()
        protected = body.replace(first, first + '\n    observe();', 1)
        path.write_text('#include "src/headers/uw.h"\n' + protected)
        apply()
        assert first in path.read_text() and second in path.read_text()
        assert 'observe();' in path.read_text()
        excluded = body.replace(name, 'excluded', 1)
        path.write_text('#include "src/headers/uw.h"\n' + excluded)
        apply(); assert extract(path.read_text(), 'excluded') == excluded

    # Run the same real cold-restore/nested/equipment/cursor fixture using
    # original and converted game bodies. Compare all arena and save bytes.
    support = [('level.c', 'reset_level_object_arena'),
        ('objects.c', 'alloc_object_slot'), ('objects.c', 'encode_object_slot_index'),
        ('objects.c', 'resolve_object_link'), ('inventory.c', 'alloc_save_record_slot'),
        ('inventory.c', 'save_record_slot_from_index'),
        ('containers.c', 'encode_equipped_item_index'),
        ('containers.c', 'decode_equipped_item_index')]
    common = '\n'.join(extract((ROOT / 'src' / file).read_text(), name)
                       for file, name in support)
    flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
    outputs = []
    for name, functions in [('original', original), ('current', current)]:
        path.write_text('#include "src/headers/uw.h"\nextern char *DAT_002046ac, *DAT_002046a0;\n'
                        + common + '\n' + '\n'.join(functions.values()))
        executable = Path(tmp) / name
        result = subprocess.run(['cc', '-std=c11', '-O2', '-Wno-pointer-sign',
            '-Wno-address-of-packed-member', *flags, '-I', str(ROOT), '-I',
            str(ROOT / 'third_party/unity/src'), str(path),
            str(ROOT / 'tests/test_save_inventory.c'),
            str(ROOT / 'tests/support/division.c'), str(ROOT / 'src/options.c'),
            str(ROOT / 'third_party/unity/src/unity.c'), '-o', str(executable)],
            capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        outputs.append(subprocess.check_output([str(executable)], text=True))
    assert outputs[0] == outputs[1], outputs
    print(outputs[1].strip())
print('Exact save-copy conversion, idempotence, callback/scope guards and original/current oracle pass')

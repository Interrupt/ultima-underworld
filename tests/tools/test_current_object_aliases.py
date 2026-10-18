"""Verify Clang alias evidence, original pointer identity, and offset scaling."""
from pathlib import Path
import subprocess
import shutil
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from audit_object_roles import inspect
from generate_current_alias_rules import generate

clang = sys.argv[2] if len(sys.argv) > 2 else shutil.which('clang')
assert clang, 'Clang is required for the pointer-role AST regression'

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'aliases.c'
    path.write_text('''#include "src/headers/uw.h"
#include <assert.h>
uw_mobile_object_t first, second;
uw_mobile_object_t *DAT_0010190c;
uw_object_hdr_t *get_object_record_by_slot_index(short slot) { return &second.hdr; }
int npc_saved(void)
{
    char *saved = (char *)DAT_0010190c;
    ushort *word_alias = (ushort *)saved;
    DAT_0010190c = &second;
    *(char *)(saved + 8) = (char)0x91;
    *(ushort *)(saved + 0xb) = 0x8234;
    return *(char *)(saved + 8) + word_alias[1] + *(short *)(saved + 0xb)
        + *(byte *)(word_alias + 5) + (byte)word_alias[10];
}
int projectile_saved(void)
{
    char *projectile = (char *)DAT_0010190c;
    return *(char *)(projectile + 11);
}
int npc_mixed(int pick)
{
    char *mixed = (char *)DAT_0010190c;
    if (pick) mixed = (char *)get_object_record_by_slot_index(1);
    return *(char *)(mixed + 8);
}
int npc_unrelated(char *buffer)
{
    char *reused = (char *)DAT_0010190c;
    reused = buffer;
    return *(char *)(reused + 8) + ((uw_mobile_object_t *)reused)->npc_hp;
}
int typed_parameters(ushort *object, ushort *reference)
{
    uw_projectile_object_t *projectile = (uw_projectile_object_t *)object;
    uw_object_hdr_t *header = (uw_object_hdr_t *)reference;
    return projectile->hdr.object_id + header->object_id;
}
int reused_parameter(ushort *object, char *buffer)
{
    uw_projectile_object_t *projectile = (uw_projectile_object_t *)object;
    object = (ushort *)buffer;
    return projectile->hdr.object_id;
}
int main(void) {
    uint64_t hash = 0;
    for (unsigned input = 0; input < 65536; ++input) {
        memset(&first, 0xa5, sizeof(first));
        memset(&second, 0x5a, sizeof(second));
        first.hdr.position_word = input;
        DAT_0010190c = &first;
        hash = hash * 31 + (unsigned)npc_saved();
        assert(DAT_0010190c == &second);
        assert(first.npc_hp == 0x91 && first.goal_word == 0x8234);
        for (unsigned i = 0; i < sizeof(second); ++i)
            assert(((byte *)&second)[i] == 0x5a);
    }
    printf("%llu\\n", (unsigned long long)hash);
}
''')
    roles = inspect({'file': str(path), 'directory': str(ROOT),
                     'arguments': [clang, '-std=c11', '-I', str(ROOT), '-c', str(path)]})
    assert 'error' not in roles, roles
    functions = {f['function']: f for f in roles['functions']}
    saved = {r['name']: r for r in functions['npc_saved']['roles']}
    assert saved['saved']['current_mobile_alias']
    assert saved['word_alias']['current_mobile_alias']
    mixed = {r['name']: r for r in functions['npc_mixed']['roles']}
    assert not mixed['mixed']['current_mobile_alias']
    assert 'reused' in functions['npc_unrelated']['requires_review']
    incoming = {r['name']: r for r in functions['typed_parameters']['roles']}
    assert set(incoming) == {'object', 'reference', 'projectile', 'header'}
    assert not any(r['current_mobile_alias'] for r in incoming.values())
    assert functions['typed_parameters']['requires_review'] == []
    assert functions['reused_parameter']['roles'] == []
    assert set(functions['reused_parameter']['requires_review']) == {'object', 'projectile'}
    patch = Path(tmp) / 'aliases.cocci'
    patch.write_text(generate(roles))
    def execute():
        program = Path(tmp) / 'aliases'
        result = subprocess.run(['cc', '-std=c11', '-O2', '-I', str(ROOT), str(path),
                                 '-o', str(program)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)
    def transform():
        result = subprocess.run([sys.argv[1], '--sp-file', str(patch), str(path),
                                 '--no-includes', '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    original = execute()
    transform()
    converted = path.read_text()
    assert '((uw_mobile_object_t *)saved)->npc_hp = (byte)' in converted
    assert '((uw_mobile_object_t *)word_alias)->hdr.position_word' in converted
    assert '*(char *)(projectile + 11)' in converted
    assert '*(char *)(mixed + 8)' in converted
    assert '*(char *)(reused + 8)' in converted
    assert execute() == original
    transform()
    assert path.read_text() == converted
    print('Current NPC aliases: AST evidence, saved identity, signed views and scaling passed')

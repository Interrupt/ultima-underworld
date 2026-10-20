"""Find object-pointer roles from Clang ASTs, without guessing from variable names.

Seeds: UW1 object accessors, the typed player, and COMOBJ indexing by the
first object word. Alias propagation is conservative: a local assigned an
interior pointer, an unrelated buffer or an unproven result is reported for
review rather than included in an automatic field sweep.
"""
import argparse
from concurrent.futures import ThreadPoolExecutor
import json
from pathlib import Path
import shlex
import subprocess

ROOT = Path(__file__).resolve().parents[2]
ACCESSORS = {'alloc_object_slot', 'resolve_object_link', 'get_object_record_by_slot_index',
             'spawn_new_object', 'spawn_object_near_player', 'find_object_in_world',
             'find_object_in_chain', 'find_object_by_encoded_slot_in_chain',
             'reallocate_object_to_arena', 'settle_dropped_object',
             'get_equipped_item_at_slot', 'find_equipped_item_by_category',
             'discard_misplaced_object', 'prompt_split_object_stack',
             'alloc_save_record_slot', 'save_record_slot_from_index'}
# The save-record accessors return eight-byte common-header records, not mobile
# extensions. alloc_save_record_slot advances the record count at an 8-byte
# stride; save_record_slot_from_index returns NULL for zero or the same stride.
# Their only callers are the audited inventory walkers.
# prompt_split_object_stack returns only NULL, its incoming object header,
# or a new alloc_object_slot(0) record. Its byte-pointer API does not return UI data.
# refresh_npc_target_delta is the sole writer of DAT_00101400 in src: it
# assigns get_object_record_by_slot_index(npc_gtarg). This proves a common
# header, without proving an NPC/projectile extension for the target.
# DAT_00101904 is assigned only by nearby-candidate accessors whose non-null
# results come from resolve_object_link; this proves the common header only.
OBJECT_GLOBALS = {'g_player_object', 'DAT_0010190c', 'g_scratch_object_ptr', 'DAT_00101400', 'DAT_00101904'}
WRAPPERS = {'ImplicitCastExpr', 'CStyleCastExpr', 'ParenExpr', 'ConstantExpr'}


def walk(node):
    yield node
    for child in node.get('inner', []):
        yield from walk(child)


def unwrap(node):
    while node.get('kind') in WRAPPERS and node.get('inner'):
        node = node['inner'][-1]
    return node


def decl(node):
    node = unwrap(node)
    return node.get('referencedDecl') if node.get('kind') == 'DeclRefExpr' else None


def callee(node):
    if node.get('kind') != 'CallExpr' or not node.get('inner'):
        return None
    ref = decl(node['inner'][0])
    return ref.get('name') if ref and ref.get('kind') == 'FunctionDecl' else None


def first_word_base(node):
    node = unwrap(node)
    children = node.get('inner', [])
    if node.get('kind') == 'UnaryOperator' and node.get('opcode') == '*':
        return decl(children[0])
    if node.get('kind') == 'ArraySubscriptExpr' and len(children) == 2:
        index = unwrap(children[1])
        if index.get('kind') == 'IntegerLiteral' and index.get('value') == '0':
            return decl(children[0])
    return None


def pointer(node):
    return '*' in node.get('type', {}).get('qualType', '')


def inspect(entry):
    filename = Path(entry['file']).resolve()
    display_name = str(filename.relative_to(ROOT)) if filename.is_relative_to(ROOT) else str(filename)
    args = entry.get('arguments') or shlex.split(entry['command'])
    clean = []
    skip = False
    for arg in args:
        if skip:
            skip = False
            continue
        if arg == '-o':
            skip = True
        elif arg != '-c':
            clean.append(arg)
    run = subprocess.run(clean + ['-fsyntax-only', '-Xclang', '-ast-dump=json'],
                         cwd=entry['directory'], capture_output=True, text=True)
    if run.returncode:
        return {'source': display_name, 'error': run.stderr}
    tree = json.loads(run.stdout)
    results = []
    for function in tree.get('inner', []):
        if function.get('kind') != 'FunctionDecl':
            continue
        bodies = [n for n in function.get('inner', []) if n.get('kind') == 'CompoundStmt']
        if not bodies or function.get('loc', {}).get('includedFrom'):
            continue
        nodes = list(walk(bodies[0]))
        declarations = {n['id']: n for n in function.get('inner', []) if n.get('kind') == 'ParmVarDecl'}
        declarations.update({n['id']: n for n in nodes if n.get('kind') == 'VarDecl'})
        seeds = {}
        assignments = {}
        # Struct field accesses remain useful evidence after the first raw
        # offset sweep. Unwrap casts to recover the original local/parameter.
        for n in nodes:
            if n.get('kind') != 'MemberExpr' or not n.get('inner'):
                continue
            base = n['inner'][0]
            base_type = base.get('type', {}).get('qualType', '')
            if any(t in base_type for t in ('uw_object_hdr_t', 'uw_mobile_object_t',
                                           'uw_projectile_object_t')):
                ref = decl(base)
                if ref and ref['id'] in declarations and pointer(declarations[ref['id']]):
                    seeds[ref['id']] = 'UW1 object struct member access'
        for ident, declaration in declarations.items():
            typ = declaration.get('type', {}).get('qualType', '')
            if '*' in typ and '**' not in typ and any(t in typ for t in (
                    'uw_object_hdr_t', 'uw_mobile_object_t', 'uw_projectile_object_t')):
                seeds[ident] = 'typed UW1 object pointer declaration'
        # A typed alias initializer carries the same incoming-pointer evidence
        # as a cast directly followed by a struct member access. Seed only
        # parameters here; locals with unproven buffer origins still need review.
        # Later assignment checks also reject a parameter reused for a buffer.
        for n in nodes:
            if n.get('kind') != 'CStyleCastExpr' or not n.get('inner'):
                continue
            typ = n.get('type', {}).get('qualType', '')
            if '*' in typ and '**' not in typ and any(t in typ for t in (
                    'uw_object_hdr_t', 'uw_mobile_object_t', 'uw_projectile_object_t')):
                ref = decl(n['inner'][-1])
                if (ref and ref['id'] in declarations
                        and declarations[ref['id']]['kind'] == 'ParmVarDecl'
                        and pointer(declarations[ref['id']])
                        and '**' not in declarations[ref['id']]['type']['qualType']):
                    seeds.setdefault(ref['id'], 'incoming UW1 object pointer cast')
        for n in nodes:
            if n.get('kind') == 'VarDecl' and n.get('init') and pointer(n):
                assignments.setdefault(n['id'], []).append(n['inner'][-1])
            if n.get('kind') == 'BinaryOperator' and n.get('opcode') == '=':
                ref = decl(n['inner'][0])
                if ref and ref['id'] in declarations and pointer(declarations[ref['id']]):
                    assignments.setdefault(ref['id'], []).append(n['inner'][1])
            if n.get('kind') == 'ArraySubscriptExpr' and n.get('inner'):
                ref = decl(n['inner'][0])
                if ref and ref.get('name') == 'g_object_type_props':
                    for part in walk(n['inner'][1]):
                        if part.get('kind') == 'BinaryOperator' and part.get('opcode') == '&':
                            rhs = unwrap(part['inner'][1])
                            if rhs.get('value') == '511':
                                base = first_word_base(part['inner'][0])
                                if base and base['id'] in declarations and pointer(declarations[base['id']]):
                                    seeds[base['id']] = 'COMOBJ index from object header object_id'
        roles = dict(seeds)

        def object_value(value):
            value = unwrap(value)
            ref = decl(value)
            if ref:
                return ref.get('name') in OBJECT_GLOBALS or ref['id'] in roles
            if callee(value) in ACCESSORS:
                return True
            if value.get('kind') == 'ConditionalOperator':
                return all(object_value(c) or null(c) for c in value.get('inner', [])[1:])
            return False

        def null(value):
            return unwrap(value).get('value') == '0'

        for _ in range(len(declarations) + 1):
            added = False
            for ident, values in assignments.items():
                if ident in roles:
                    continue
                if any(object_value(v) for v in values) and all(object_value(v) or null(v) for v in values):
                    roles[ident] = 'object accessor / proven object alias'
                    added = True
            if not added:
                break
        # Even a seeded local can be reused for a non-object later in a large
        # decompiled function. Exclude it and all aliases depending on it.
        removed = True
        excluded = []
        while removed:
            removed = False
            for ident in list(roles):
                if any(not object_value(v) and not null(v) for v in assignments.get(ident, [])):
                    excluded.append(declarations[ident].get('name'))
                    del roles[ident]
                    removed = True
        # A saved current-slot alias keeps its own pointer when the global
        # changes. Record the evidence so NPC-only byte/word rules can name
        # its fields without replacing it with a fresh global lookup.
        current_aliases = set()
        for _ in range(len(roles) + 1):
            added = False
            for ident in roles:
                values = assignments.get(ident, [])
                if not values or ident in current_aliases:
                    continue
                refs = [decl(value) for value in values if not null(value)]
                if refs and all(ref and (ref.get('name') == 'DAT_0010190c' or
                                       ref['id'] in current_aliases) for ref in refs):
                    current_aliases.add(ident)
                    added = True
            if not added:
                break
        if roles or excluded:
            results.append({'function': function['name'], 'roles': [
                {'name': declarations[ident]['name'], 'type': declarations[ident]['type']['qualType'],
                 'parameter': declarations[ident]['kind'] == 'ParmVarDecl', 'evidence': evidence,
                 'current_mobile_alias': ident in current_aliases}
                for ident, evidence in roles.items()], 'requires_review': excluded})
    return {'source': display_name, 'functions': results}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--build', type=Path, default=ROOT / 'build')
    p.add_argument('--output', type=Path, required=True)
    args = p.parse_args()
    entries = json.loads((args.build / 'compile_commands.json').read_text())
    unique = {}
    for entry in entries:
        path = Path(entry['file']).resolve()
        if path.parent == ROOT / 'src':
            unique.setdefault(str(path), entry)
    with ThreadPoolExecutor(max_workers=4) as pool:
        records = list(pool.map(inspect, unique.values()))
    args.output.write_text(json.dumps({'method': __doc__, 'sources': records}, indent=2) + '\n')
    errors = [r['source'] for r in records if 'error' in r]
    total = sum(len(f['roles']) for r in records for f in r.get('functions', []))
    print(f'{len(records)} sources parsed; {total} proven pointer roles; errors: {errors}')
    if errors:
        raise SystemExit(1)

if __name__ == '__main__':
    main()

"""Inventory remaining packed views and raw accesses at audited UW1 object sites.

This conservative source inventory is a work list, not proof of completion.
It does not infer unrecorded local aliases or classify every packed copy as safe.
"""
import argparse
from bisect import bisect_right
from collections import Counter
import json
from pathlib import Path
import re

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
from struct_field_catalog import WORDS
from audit_object_roles import OBJECT_GLOBALS

FUNCTION = re.compile(r'^\w[^\n;{}]*?\b(\w+)\([^;{}]*?\)\s*\{', re.M)
NONCODE = re.compile(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'')
PACKED_VIEWS = set(WORDS) | {'tile_position'}  # shared mobile/projectile alias
MEMBER = re.compile(r'(?:->|\.)\s*(' + '|'.join(sorted(PACKED_VIEWS)) + r')(_low|_high|_signed)?\b')


def inventory():
    result = []
    roles = json.loads((HERE / 'object-pointer-roles.json').read_text())
    by_source = {entry['source']: entry for entry in roles['sources']}
    for path in sorted((ROOT / 'src').glob('*.c')):
        source = path.read_text()
        code = NONCODE.sub(lambda m: re.sub(r'[^\n]', ' ', m.group()), source)
        relative = str(path.relative_to(ROOT))
        functions = []
        for match in FUNCTION.finditer(code):
            name = match.group(1)
            depth = 1
            end = match.end()
            while depth and end < len(code):
                depth += (code[end] == '{') - (code[end] == '}')
                end += 1
            functions.append((match.start(), end, name))
        starts = [start for start, _, _ in functions]
        def context(offset):
            index = bisect_right(starts, offset) - 1
            return functions[index][2] if index >= 0 and offset < functions[index][1] else None
        def add(match, category, member=None, pointer=None):
            line_start = source.rfind('\n', 0, match.start()) + 1
            line_end = source.find('\n', match.end())
            result.append(dict(source=relative, function=context(match.start()),
                               line=source.count('\n', 0, match.start()) + 1,
                               category=category, member=member, pointer=pointer,
                               code=source[line_start:line_end if line_end >= 0 else len(source)].strip()))
        for match in MEMBER.finditer(code):
            suffix = match.group(2)
            add(match, 'byte_view' if suffix in ['_low', '_high'] else
                'signed_word_view' if suffix == '_signed' else 'packed_word', match.group(1))
        # Existing role audit proves common-header object identity at these
        # functions. Do not treat another same-named variable as an object.
        audited = {}
        for function in by_source.get(relative, {}).get('functions', []):
            audited[function['function']] = {role['name'] for role in function['roles']
                                            if '**' not in role['type']}
        names = set(OBJECT_GLOBALS)
        names |= set().union(*audited.values()) if audited else set()
        for name in sorted(names):
            # Includes byte/word casts and indexing; context validation below
            # rejects unrelated same-named locals. Offsets remain evidence for
            # review rather than guessed fields (NPC/projectile layouts overlap).
            pattern = re.compile(r'\b' + re.escape(name) + r'\s*\[[^\]\n]+\]|'
                                 r'\*\s*\([^()\n]+\*\)\s*\(\s*'
                                 r'(?:\([^()\n]+\*\)\s*)?' + re.escape(name) +
                                 r'\s*\+\s*[^)\n]+\)')
            for match in pattern.finditer(code):
                function = context(match.start())
                if name in OBJECT_GLOBALS or name in audited.get(function, set()):
                    add(match, 'raw_audited_object_access', pointer=name)
    return sorted(result, key=lambda item: (item['source'], item['line'], item['category'], item['member'] or '', item['pointer'] or ''))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--json', type=Path)
    args = parser.parse_args()
    records = inventory()
    report = dict(scope='Named packed views and existing audited object-pointer roles in src/*.c; '
                       'unrecorded aliases and other structures still require independent auditing.',
                  counts=dict(sorted(Counter(record['category'] for record in records).items())),
                  records=records)
    if args.json:
        args.json.write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report['counts'], sort_keys=True))


if __name__ == '__main__':
    main()

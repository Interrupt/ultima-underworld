"""Validate curated packed-operation exceptions against current source accesses.

Only exact, explicitly reviewed common-header transfers and live word-cursor
addresses and explicitly reviewed scalar snapshots qualify.
All other accesses remain unreviewed, even in a function containing a transfer.
"""
import argparse
import hashlib
from collections import Counter
import json
from pathlib import Path
import re

from audit_struct_property_usage import inventory, ROOT, HERE
from apply_exact_source_rules import apply

WORDS = ('type_flags', 'position_word', 'chain_word', 'link_word')


def report(manifest):
    records = inventory()
    accepted = set()
    transfers = []
    for entry in manifest['transfers']:
        if not entry['reason'].strip():
            raise ValueError('An exception needs a reviewed reason')
        path = ROOT / entry['source']
        if path.parent != ROOT / 'src' or path.suffix != '.c':
            raise ValueError('Exception source must be a top-level src/*.c file')
        statements = [f"{entry['destination']}->{word} = {entry['origin']}->{word};" for word in WORDS]
        # Exactly four consecutive assignments in their original order. Only
        # indentation may vary; comments, observers, masks and other operations
        # change the reviewed block and require review rather than auto-approval.
        pattern = re.compile(r'^[ \t]*' + r'\n[ \t]*'.join(map(re.escape, statements)) + r'[ \t]*$', re.M)
        source = path.read_text()
        matches = list(pattern.finditer(source))
        if len(matches) != 1:
            raise ValueError(f"Expected one reviewed transfer in {entry['source']}:{entry['function']}; found {len(matches)}")
        first_line = source.count('\n', 0, matches[0].start()) + 1
        indexes = []
        for offset, (word, statement) in enumerate(zip(WORDS, statements)):
            found = [i for i, record in enumerate(records)
                     if record['source'] == entry['source'] and record['function'] == entry['function']
                     and record['line'] == first_line + offset and record['category'] == 'packed_word'
                     and record['member'] == word and record['code'] == statement]
            # Both read and write are inventoried. Never approve a masked
            # expression, an out-of-function text match, or a partial transfer.
            if len(found) != 2 or any(i in accepted for i in found):
                raise ValueError(f"Stale or duplicate reviewed access: {entry['function']}:{first_line + offset}")
            accepted.update(found)
            indexes.extend(found)
        transfers.append(dict(entry, first_line=first_line, statements=statements, access_count=len(indexes)))
    cursors = []
    for entry in manifest.get('cursor_uses', []):
        if not entry['reason'].strip():
            raise ValueError('A cursor exception needs a reviewed reason')
        path = ROOT / entry['source']
        if path.parent != ROOT / 'src' or path.suffix != '.c':
            raise ValueError('Cursor source must be a top-level src/*.c file')
        statement = entry['statement']
        matches = list(re.finditer(r'^[ \t]*' + re.escape(statement) + r'[ \t]*$', path.read_text(), re.M))
        if len(matches) != 1:
            raise ValueError('Expected exactly one reviewed cursor statement: ' + statement)
        line = path.read_text().count('\n', 0, matches[0].start()) + 1
        fields = re.findall(r'&[A-Za-z_]\w*->(?:hdr\.)?(' + '|'.join(WORDS) + r')\b', statement)
        found = [i for i, record in enumerate(records)
                 if record['source'] == entry['source'] and record['function'] == entry['function']
                 and record['line'] == line and record['code'] == statement and record['category'] == 'packed_word']
        if not fields or Counter(fields) != Counter(records[i]['member'] for i in found) or any(i in accepted for i in found):
            raise ValueError('Stale, mixed or duplicate cursor exception: ' + statement)
        accepted.update(found)
        cursors.append(dict(entry, line=line, access_count=len(found)))
    snapshots = []
    for entry in manifest.get('snapshots', []):
        if not entry['reason'].strip():
            raise ValueError('A snapshot exception needs a reviewed reason')
        source_path, recipe_path = ROOT / entry['source'], ROOT / entry['recipe']
        if source_path.parent != ROOT / 'src' or recipe_path.parent != ROOT / 'tools/coccinelle':
            raise ValueError('Snapshot source/recipe path is outside its reviewed scope')
        recipe = json.loads(recipe_path.read_text())
        body = recipe['after']
        if recipe['function'] != entry['function'] or hashlib.sha256(body.encode()).hexdigest() != entry['reviewed_body_sha256']:
            raise ValueError('Snapshot function context changed; review its full-width consumers')
        _, matches = apply(source_path.read_text(), dict(function=entry['function'], before=body, after=''))
        if not matches:
            raise ValueError('Current snapshot function differs from its reviewed body')
        statement = entry['statement']
        pattern = r'[A-Za-z_]\w* = (?:\((?:uint|ushort)\))?[A-Za-z_]\w*->(?:hdr\.)?(' + '|'.join(WORDS) + r')(?: & (0x[0-9a-fA-F]+))?;'
        match = re.fullmatch(pattern, statement)
        found = [i for i, record in enumerate(records)
                 if record['source'] == entry['source'] and record['function'] == entry['function']
                 and record['code'] == statement and record['category'] == 'packed_word']
        if not match or len(found) != 1 or found[0] in accepted or records[found[0]]['member'] != match[1] or match[2] != entry.get('mask'):
            raise ValueError('Stale, altered or duplicate scalar snapshot: ' + statement)
        accepted.update(found)
        snapshots.append(dict(entry, line=records[found[0]]['line'], access_count=1))
    remaining = [record for i, record in enumerate(records) if i not in accepted]
    return dict(scope=manifest['scope'], policy=manifest['policy'],
                summary=dict(inventory_accesses=len(records), reviewed_transfer_blocks=len(transfers),
                             justified_transfer_accesses=sum(t["access_count"] for t in transfers),
                             justified_cursor_accesses=sum(c["access_count"] for c in cursors),
                             justified_snapshot_accesses=len(snapshots),
                             justified_accesses=len(accepted), unreviewed_accesses=len(remaining),
                             unreviewed_by_category=dict(sorted(Counter(r['category'] for r in remaining).items()))),
                justified_transfers=transfers, justified_cursor_uses=cursors, justified_snapshots=snapshots, unreviewed=remaining)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest', type=Path, default=HERE/'struct-property-exceptions.json')
    parser.add_argument('--json', type=Path)
    parser.add_argument('--check', type=Path, help='Require the saved report to equal the current validated report')
    args = parser.parse_args()
    try:
        result = report(json.loads(args.manifest.read_text()))
        if args.check and json.loads(args.check.read_text()) != result:
            raise ValueError('Saved exception report is stale; inspect changes and regenerate')
    except (ValueError, KeyError) as error:
        parser.error(str(error))
    if args.json:
        args.json.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result['summary'], sort_keys=True))


if __name__ == '__main__':
    main()

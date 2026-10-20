"""Validate curated packed-operation exceptions against current source accesses.

Only exact, explicitly reviewed four-word common-header transfers qualify.
All other accesses remain unreviewed, even in a function containing a transfer.
"""
import argparse
from collections import Counter
import json
from pathlib import Path
import re

from audit_struct_property_usage import inventory, ROOT, HERE

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
    remaining = [record for i, record in enumerate(records) if i not in accepted]
    return dict(scope=manifest['scope'], policy=manifest['policy'],
                summary=dict(inventory_accesses=len(records), reviewed_transfer_blocks=len(transfers),
                             justified_transfer_accesses=len(accepted), unreviewed_accesses=len(remaining),
                             unreviewed_by_category=dict(sorted(Counter(r['category'] for r in remaining).items()))),
                justified_transfers=transfers, unreviewed=remaining)


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

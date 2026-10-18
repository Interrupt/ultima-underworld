"""Apply the stance semantic patch only to the audited, unambiguous original.

Coccinelle must produce the recipe's C tokens. Keep the canonical formatting
and historical comment update after that independent rewrite is verified.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess
import tempfile
from apply_exact_source_rules import apply
from generate_combat_stance_rules import COMMENTS

HERE = Path(__file__).resolve().parent


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('source', type=Path)
    parser.add_argument('--spatch', default='spatch')
    args = parser.parse_args()
    source = args.source.read_text()
    expected, changed = apply(source, json.loads((HERE/'combat-stance-fields.json').read_text()))
    if not changed:
        print('No matching original stance body')
        return
    with tempfile.TemporaryDirectory() as tmp:
        path = Path(tmp)/args.source.name
        path.write_text(source)
        result = subprocess.run([args.spatch, '--sp-file', str(HERE/'combat-stance-fields.cocci'),
                                 str(path), '--no-includes', '--in-place'], capture_output=True, text=True)
        if result.returncode:
            raise RuntimeError(result.stdout + result.stderr)
        # This body has no string literals or whitespace character constants.
        # Outside it, Coccinelle's untouched source is retained in both texts.
        tokens = lambda text: re.sub(r'\s+', '', COMMENTS.sub('', text))
        if tokens(path.read_text()) != tokens(expected):
            raise RuntimeError('Coccinelle did not produce the audited stance conversion')
    args.source.write_text(expected)
    print('Converted stance body with Coccinelle')


if __name__ == '__main__':
    main()

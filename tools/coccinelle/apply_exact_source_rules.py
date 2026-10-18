"""Apply a complete-function JSON recipe only to its exact original body."""
import argparse
import json
from pathlib import Path
import re

NONCODE = re.compile(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'')


def apply(source, recipe):
    code = NONCODE.sub(lambda match: re.sub(r'[^\n]', ' ', match.group()), source)
    pattern = re.compile(r'^\w[^\n;{}]*\b' + re.escape(recipe['function'])
        + r'\([^;{}]*?\)\s*\{', re.M)
    matches = list(pattern.finditer(code))
    if len(matches) != 1:
        return source, False
    start, end, depth = matches[0].start(), matches[0].end(), 1
    while depth and end < len(code):
        depth += (code[end] == '{') - (code[end] == '}')
        end += 1
    if depth or source[start:end] != recipe['before']:
        return source, False
    return source[:start] + recipe['after'] + source[end:], True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('recipe', type=Path)
    parser.add_argument('source', type=Path)
    args = parser.parse_args()
    result, changed = apply(args.source.read_text(), json.loads(args.recipe.read_text()))
    if changed:
        args.source.write_text(result)
    print('Converted original body' if changed else 'No matching original body')


if __name__ == '__main__':
    main()

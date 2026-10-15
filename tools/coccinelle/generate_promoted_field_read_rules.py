"""Name masked UW1 fields even when Ghidra explicitly promotes a word first.

A cast to int/uint preserves a word's low 16 bits. Keep an explicit mask on
shifted reads, including unsigned sources: an unmasked signed shift can retain
sign bits and is deliberately outside this rule.
"""
from pathlib import Path
from struct_field_catalog import WORDS
HERE = Path(__file__).resolve().parent


def generate():
    rules = []
    for member, kind in [('->', 'ptr'), ('.', 'value')]:
        for word, fields in WORDS.items():
            for shift, width, field in fields:
                mask = (1 << width) - 1
                forms = []
                for suffix in ['', '_signed']:
                    for cast in ['int', 'uint']:
                        base = f'({cast})B{member}{word}{suffix}'
                        for unsigned in ['', 'U']:
                            # The mask's suffix and explicit promotion determine
                            # signedness in surrounding comparisons/arithmetic.
                            result_type = 'uint' if cast == 'uint' or unsigned else 'int'
                            result = f'({result_type})B{member}{field}'
                            forms += [(f'({base} >> {shift}) & {hex(mask)}{unsigned}', result),
                                      (f'({base} & {hex(mask << shift)}{unsigned}) >> {shift}', result),
                                      (f'{base} & {hex(mask << shift)}{unsigned}',
                                       f'({result} << {shift})' if shift else result)]
                rules.append(f'''@promoted_{word}_{field}_{kind} disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
''' + '\n|\n'.join(f'- {before}\n+ {after}'
                        for before, after in dict.fromkeys(forms)) + '\n)\n')
    return '\n'.join(rules)


if __name__ == '__main__':
    (HERE/'promoted-field-reads.cocci').write_text(generate())

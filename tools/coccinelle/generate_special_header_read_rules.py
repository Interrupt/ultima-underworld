"""Name three ARM header reads with explicit narrowing or special-link tests."""
from pathlib import Path
HERE = Path(__file__).resolve().parent


def forms(member):
    return [
        (f'(short)(B{member}type_flags_signed & -0x8000) == 0', f'B{member}is_quant == 0', 'is_quant'),
        (f'(B{member}link_word_signed & 0x8000U) != 0', f'B{member}link >= 512', 'link'),
        (f'(ushort)B{member}link_word_signed >> 6', f'(int)B{member}link', 'link'),
    ]


def generate():
    rules = []
    for member, kind in [('->', 'ptr'), ('.', 'value')]:
        for index, (before, after, _) in enumerate(forms(member)):
            rules.append(f'''@special_header_{kind}_{index} disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- {before}
+ {after}
''')
    return '\n'.join(rules)


if __name__ == '__main__':
    (HERE/'special-header-reads.cocci').write_text(generate())

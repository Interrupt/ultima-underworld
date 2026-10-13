"""Turn the four-byte stores into the geometry arena (src/headers/geom_arena.h) back into one
member store, e.g.

    (&DAT_000a85d8)[iVar34] = (char)V;  (&DAT_000a85d9)[iVar34] = (char)((uint)V >> 8);  ...
 -> UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->x) = V;

The index is still the byte offset of the vertex (vertex * 0xc) or record (record * 0x60) that the
decompiler computed. A temporary holding a shifted byte (`T = (undefined1)((uint)V >> 8);
(&N)[I] = T;`) is first folded into the store; the assignment to T stays, as a dead store.
"""
from pathlib import Path

HERE = Path(__file__).resolve().parent

# (first byte macro address, accessor expression for the word; I is the byte index metavariable)
VERT = 'UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->%s)'
REC = 'UW_REC_AT(I)->%s'
FIELDS = []
FIELDS = [(0xa85d8, VERT % 'x'), (0xa85dc, VERT % 'y'), (0xa85e0, VERT % 'z')]
FIELDS.append((0xacde4, REC % 'vert_count'))
for k in range(4):
    FIELDS.append((0xacde8 + 4 * k, REC % ('vert_idx[%d]' % k)))
for k in range(3):
    FIELDS.append((0xacdfc + 4 * k, REC % ('attr[%d]' % k)))
for k in range(8):
    FIELDS.append((0xace08 + 4 * k, REC % ('uv[%d]' % k)))
FIELDS.append((0xace30, REC % 'tex[0]'))

U8 = ['(char)((uint)V >> 8)', '(char)((ushort)V >> 8)', '(char)(V >> 8)']
U16 = ['(char)((uint)V >> 0x10)', '(char)(V >> 0x10)']
U24 = ['(char)((uint)V >> 0x18)', '(char)(V >> 0x18)']
TEMP_SHIFT = {0: ['V'], 8: ['(uint)V >> 8', '(ushort)V >> 8'], 16: ['(uint)V >> 0x10'], 24: ['(uint)V >> 0x18']}


def name(addr):
    return 'DAT_000%x' % addr


def store_rules():
    rules = []
    for base, word in FIELDS:
        variants = []
        for a in U8:
            for b in U16:
                for c in U24:
                    variants.append('''- (&%s)[I] = (char)V;
  ... when != I
      when != V
- (&%s)[I] = %s;
  ... when != I
      when != V
- (&%s)[I] = %s;
  ... when != I
      when != V
- (&%s)[I] = %s;
+ %s = V;''' % (name(base), name(base + 1), a, name(base + 2), b, name(base + 3), c, word))
        rules.append('''@arena_store_%x disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
%s
)
''' % (base, '\n|\n'.join(variants)))
    return rules


def temp_rules(drop=False):
    """`T = (undefined1)(SHIFT); ... (&N)[I] = T;` -> `(&N)[I] = (char)(SHIFT);`, provided V is not
    assigned in between (the decompiler reuses these temporaries across several stores, so the value
    the temporary holds must still be the value of the expression). SmPL matches the first use only;
    run the file until it stops changing anything. With drop=True the assignment to T is removed
    where T is never mentioned again in the function, so a reused temporary keeps its assignment."""
    rules = []
    for shift, forms in TEMP_SHIFT.items():
        for k, sh in enumerate(forms):
            stored = '(char)V' if shift == 0 else '(char)(%s)' % sh
            kind = 'identifier' if shift == 0 else 'expression'
            if drop:
                rules.append('''@arena_temp_drop_%d_%d@
identifier fn, T;
expression V;
typedef uint, ushort, undefined1;
@@
fn(...) {
  ...
- T = (undefined1)(%s);
  ... when != T
}
''' % (shift, k, sh))
            else:
                rules.append('''@arena_temp_fold_%d_%d@
identifier T;
identifier N =~ "^DAT_000\\(a85[de]\\|acd\\|ace\\)";
expression I, E;
%s V;
typedef uint, ushort, undefined1;
@@
  T = (undefined1)(%s);
  ... when != V = E
      when != T = E
- (&N)[I] = T;
+ (&N)[I] = %s;
''' % (shift, k, kind, sh, stored))
    return rules


def zero_rules():
    """A byte stored with its three upper bytes zeroed is a word holding the zero-extended byte."""
    rules = []
    for base, word in FIELDS:
        rules.append('''@arena_zero_%x disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&%s)[I] = V;
  ... when != I
      when != V
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
+ %s = (byte)V;

@arena_const_%x@
expression I;
constant C;
@@
- (&%s)[I] = C;
  ... when != I
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
+ %s = C;

@arena_clear_%x@
expression I;
@@
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
  ... when != I
- (&%s)[I] = 0;
+ %s = 0;
''' % (base, name(base), name(base + 1), name(base + 2), name(base + 3), word,
       base, name(base), name(base + 1), name(base + 2), name(base + 3), word,
       base, name(base), name(base + 1), name(base + 2), name(base + 3), word))
    return rules


if __name__ == '__main__':
    (HERE / 'geom-arena-temps.cocci').write_text('\n'.join(temp_rules()).rstrip() + '\n')
    (HERE / 'geom-arena-dead-temps.cocci').write_text('\n'.join(temp_rules(drop=True)).rstrip() + '\n')
    (HERE / 'geom-arena.cocci').write_text('\n'.join(store_rules() + zero_rules()).rstrip() + '\n')

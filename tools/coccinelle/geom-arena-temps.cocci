@arena_temp_fold_0_0@
identifier T;
identifier N =~ "^DAT_000\(a85[de]\|acd\|ace\)";
expression I, E;
identifier V;
typedef uint, ushort, undefined1;
@@
  T = (undefined1)(V);
  ... when != V = E
      when != T = E
- (&N)[I] = T;
+ (&N)[I] = (char)V;

@arena_temp_fold_8_0@
identifier T;
identifier N =~ "^DAT_000\(a85[de]\|acd\|ace\)";
expression I, E;
expression V;
typedef uint, ushort, undefined1;
@@
  T = (undefined1)((uint)V >> 8);
  ... when != V = E
      when != T = E
- (&N)[I] = T;
+ (&N)[I] = (char)((uint)V >> 8);

@arena_temp_fold_8_1@
identifier T;
identifier N =~ "^DAT_000\(a85[de]\|acd\|ace\)";
expression I, E;
expression V;
typedef uint, ushort, undefined1;
@@
  T = (undefined1)((ushort)V >> 8);
  ... when != V = E
      when != T = E
- (&N)[I] = T;
+ (&N)[I] = (char)((ushort)V >> 8);

@arena_temp_fold_16_0@
identifier T;
identifier N =~ "^DAT_000\(a85[de]\|acd\|ace\)";
expression I, E;
expression V;
typedef uint, ushort, undefined1;
@@
  T = (undefined1)((uint)V >> 0x10);
  ... when != V = E
      when != T = E
- (&N)[I] = T;
+ (&N)[I] = (char)((uint)V >> 0x10);

@arena_temp_fold_24_0@
identifier T;
identifier N =~ "^DAT_000\(a85[de]\|acd\|ace\)";
expression I, E;
expression V;
typedef uint, ushort, undefined1;
@@
  T = (undefined1)((uint)V >> 0x18);
  ... when != V = E
      when != T = E
- (&N)[I] = T;
+ (&N)[I] = (char)((uint)V >> 0x18);

@arena_temp_drop_0_0@
identifier fn, T;
expression V;
typedef uint, ushort, undefined1;
@@
fn(...) {
  ...
- T = (undefined1)(V);
  ... when != T
}

@arena_temp_drop_8_0@
identifier fn, T;
expression V;
typedef uint, ushort, undefined1;
@@
fn(...) {
  ...
- T = (undefined1)((uint)V >> 8);
  ... when != T
}

@arena_temp_drop_8_1@
identifier fn, T;
expression V;
typedef uint, ushort, undefined1;
@@
fn(...) {
  ...
- T = (undefined1)((ushort)V >> 8);
  ... when != T
}

@arena_temp_drop_16_0@
identifier fn, T;
expression V;
typedef uint, ushort, undefined1;
@@
fn(...) {
  ...
- T = (undefined1)((uint)V >> 0x10);
  ... when != T
}

@arena_temp_drop_24_0@
identifier fn, T;
expression V;
typedef uint, ushort, undefined1;
@@
fn(...) {
  ...
- T = (undefined1)((uint)V >> 0x18);
  ... when != T
}

@receiver_0_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_0_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_0_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((undefined2 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_0_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- ((short *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((short *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
)
...>
}


@receiver_0_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((byte *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (byte)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((undefined1 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (undefined1)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_0_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((byte *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &((char *)puVar6)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((ushort *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)puVar6
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_0_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- ((char *)puVar6)[0x0] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)puVar6 = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((byte *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((char *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((ushort *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (char)((ushort *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)puVar6
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_0_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(byte *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((byte *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_0_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(undefined1 *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((undefined1 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_0_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &*(char *)((byte *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &((char *)puVar6)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_0_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- ((char *)puVar6)[0x1] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
)
...>
}


@receiver_0_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(char *)((byte *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((char *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_0_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_0_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_0_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((undefined2 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_0_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- ((short *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((short *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
)
...>
}


@receiver_0_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((byte *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (byte)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((undefined1 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (undefined1)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_0_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((byte *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &((char *)puVar6)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((ushort *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_0_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- ((char *)puVar6)[0x2] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((byte *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((char *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((ushort *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- (char)((ushort *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_0_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(byte *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((byte *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_0_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((undefined1 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_0_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &*(char *)((byte *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &((char *)puVar6)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_0_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- ((char *)puVar6)[0x3] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
)
...>
}


@receiver_0_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(char *)((byte *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((char *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_0_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_0_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_0_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((undefined2 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_0_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- ((short *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((short *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
)
...>
}


@receiver_0_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((byte *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (byte)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((undefined1 *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (undefined1)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_0_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((byte *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &((char *)puVar6)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((ushort *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_0_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- ((char *)puVar6)[0x4] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((byte *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((char *)puVar6)[0x4]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((ushort *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (char)((ushort *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_0_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(byte *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((byte *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_0_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((undefined1 *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_0_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &*(char *)((byte *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &((char *)puVar6)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_0_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- ((char *)puVar6)[0x5] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
)
...>
}


@receiver_0_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(char *)((byte *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((char *)puVar6)[0x5]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_0_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_0_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_0_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((undefined2 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_0_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- ((short *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((short *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
)
...>
}


@receiver_0_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((byte *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (byte)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((undefined1 *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (undefined1)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_0_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((byte *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &((char *)puVar6)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((ushort *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_0_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- ((char *)puVar6)[0x6] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((byte *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((char *)puVar6)[0x6]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((ushort *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- (char)((ushort *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_0_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(byte *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((byte *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_0_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((undefined1 *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_0_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &*(char *)((byte *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &((char *)puVar6)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_0_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- ((char *)puVar6)[0x7] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
)
...>
}


@receiver_0_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(char *)((byte *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((char *)puVar6)[0x7]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_1_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x0) = (char)V;
- *(char *)((char *)object_ptr + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x0) = (char)V;
- *(byte *)((char *)object_ptr + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x0) = (byte)V;
- *(char *)((char *)object_ptr + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x0) = (byte)V;
- *(byte *)((char *)object_ptr + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_1_w_0_0_word_ushort@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(ushort *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- ((ushort *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(ushort *)((ushort *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
)
...>
}


@receiver_1_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(undefined2 *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- ((undefined2 *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
)
...>
}


@receiver_1_w_0_0_word_short@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
|
- *(short *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
|
- ((short *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
|
- *(short *)((short *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
)
...>
}


@receiver_1_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(byte *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- ((byte *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(byte *)((ushort *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- (byte)((ushort *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(byte *)object_ptr
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(undefined1 *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- ((undefined1 *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- (undefined1)((ushort *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(undefined1 *)object_ptr
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_1_w_0_0_address_0@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &*(char *)((byte *)object_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &((char *)object_ptr)[0x0]
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &*(char *)((ushort *)object_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &*(char *)object_ptr
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_1_w_0_0_store_0@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- ((char *)object_ptr)[0x0] = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- *(char *)object_ptr = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x0)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(char *)((byte *)object_ptr + 0x0)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- ((char *)object_ptr)[0x0]
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(char *)((ushort *)object_ptr + 0x0)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- (char)((ushort *)object_ptr)[0x0]
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(char *)object_ptr
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_1_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- *(byte *)((byte *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- ((byte *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_1_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- *(undefined1 *)((byte *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- ((undefined1 *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_1_w_0_0_address_1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- &*(char *)((byte *)object_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- &((char *)object_ptr)[0x1]
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_1_w_0_0_store_1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high = (byte)E;
|
- ((char *)object_ptr)[0x1] = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high = (byte)E;
)
...>
}


@receiver_1_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x1)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- *(char *)((byte *)object_ptr + 0x1)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- ((char *)object_ptr)[0x1]
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_1_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x2) = (char)V;
- *(char *)((char *)object_ptr + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x2) = (char)V;
- *(byte *)((char *)object_ptr + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x2) = (byte)V;
- *(char *)((char *)object_ptr + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x2) = (byte)V;
- *(byte *)((char *)object_ptr + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_1_w_2_17_word_ushort@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(ushort *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- ((ushort *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(ushort *)((ushort *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word
)
...>
}


@receiver_1_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(undefined2 *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- ((undefined2 *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word
)
...>
}


@receiver_1_w_2_17_word_short@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
|
- *(short *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
|
- ((short *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
|
- *(short *)((short *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
)
...>
}


@receiver_1_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(byte *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- ((byte *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(byte *)((ushort *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- (byte)((ushort *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(undefined1 *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- ((undefined1 *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- (undefined1)((ushort *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_1_w_2_17_address_2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
|
- &*(char *)((byte *)object_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
|
- &((char *)object_ptr)[0x2]
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
|
- &*(char *)((ushort *)object_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_1_w_2_17_store_2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
|
- ((char *)object_ptr)[0x2] = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x2)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(char *)((byte *)object_ptr + 0x2)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- ((char *)object_ptr)[0x2]
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(char *)((ushort *)object_ptr + 0x1)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- (char)((ushort *)object_ptr)[0x1]
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_1_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- *(byte *)((byte *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- ((byte *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_1_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- *(undefined1 *)((byte *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- ((undefined1 *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_1_w_2_17_address_3@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_high
|
- &*(char *)((byte *)object_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_high
|
- &((char *)object_ptr)[0x3]
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_1_w_2_17_store_3@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_high = (byte)E;
|
- ((char *)object_ptr)[0x3] = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_high = (byte)E;
)
...>
}


@receiver_1_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x3)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_high
|
- *(char *)((byte *)object_ptr + 0x3)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_high
|
- ((char *)object_ptr)[0x3]
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_1_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x4) = (char)V;
- *(char *)((char *)object_ptr + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x4) = (char)V;
- *(byte *)((char *)object_ptr + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x4) = (byte)V;
- *(char *)((char *)object_ptr + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x4) = (byte)V;
- *(byte *)((char *)object_ptr + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_1_w_4_34_word_ushort@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(ushort *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- ((ushort *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(ushort *)((ushort *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
)
...>
}


@receiver_1_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(undefined2 *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- ((undefined2 *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
)
...>
}


@receiver_1_w_4_34_word_short@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
|
- *(short *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
|
- ((short *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
|
- *(short *)((short *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
)
...>
}


@receiver_1_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(byte *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- ((byte *)object_ptr)[0x4]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(byte *)((ushort *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- (byte)((ushort *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(undefined1 *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- ((undefined1 *)object_ptr)[0x4]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- (undefined1)((ushort *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_1_w_4_34_address_4@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x4)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- &*(char *)((byte *)object_ptr + 0x4)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- &((char *)object_ptr)[0x4]
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- &*(char *)((ushort *)object_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_1_w_4_34_store_4@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x4) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x4) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
|
- ((char *)object_ptr)[0x4] = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x4)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(char *)((byte *)object_ptr + 0x4)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- ((char *)object_ptr)[0x4]
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(char *)((ushort *)object_ptr + 0x2)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- (char)((ushort *)object_ptr)[0x2]
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_1_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- *(byte *)((byte *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- ((byte *)object_ptr)[0x5]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_1_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- *(undefined1 *)((byte *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- ((undefined1 *)object_ptr)[0x5]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_1_w_4_34_address_5@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x5)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- &*(char *)((byte *)object_ptr + 0x5)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- &((char *)object_ptr)[0x5]
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_1_w_4_34_store_5@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x5) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x5) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high = (byte)E;
|
- ((char *)object_ptr)[0x5] = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high = (byte)E;
)
...>
}


@receiver_1_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x5)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- *(char *)((byte *)object_ptr + 0x5)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- ((char *)object_ptr)[0x5]
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_1_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x6) = (char)V;
- *(char *)((char *)object_ptr + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x6) = (char)V;
- *(byte *)((char *)object_ptr + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x6) = (byte)V;
- *(char *)((char *)object_ptr + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x6) = (byte)V;
- *(byte *)((char *)object_ptr + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_1_w_6_51_word_ushort@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(ushort *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- ((ushort *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(ushort *)((ushort *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word
)
...>
}


@receiver_1_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(undefined2 *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- ((undefined2 *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word
)
...>
}


@receiver_1_w_6_51_word_short@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
|
- *(short *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
|
- ((short *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
|
- *(short *)((short *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
)
...>
}


@receiver_1_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(byte *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- ((byte *)object_ptr)[0x6]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(byte *)((ushort *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- (byte)((ushort *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(undefined1 *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- ((undefined1 *)object_ptr)[0x6]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- (undefined1)((ushort *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_1_w_6_51_address_6@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x6)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
|
- &*(char *)((byte *)object_ptr + 0x6)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
|
- &((char *)object_ptr)[0x6]
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
|
- &*(char *)((ushort *)object_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_1_w_6_51_store_6@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x6) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x6) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
|
- ((char *)object_ptr)[0x6] = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x6)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(char *)((byte *)object_ptr + 0x6)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- ((char *)object_ptr)[0x6]
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(char *)((ushort *)object_ptr + 0x3)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- (char)((ushort *)object_ptr)[0x3]
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_1_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- *(byte *)((byte *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- ((byte *)object_ptr)[0x7]
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_1_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- *(undefined1 *)((byte *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- ((undefined1 *)object_ptr)[0x7]
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_1_w_6_51_address_7@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x7)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_high
|
- &*(char *)((byte *)object_ptr + 0x7)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_high
|
- &((char *)object_ptr)[0x7]
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_1_w_6_51_store_7@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x7) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x7) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_high = (byte)E;
|
- ((char *)object_ptr)[0x7] = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_high = (byte)E;
)
...>
}


@receiver_1_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x7)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_high
|
- *(char *)((byte *)object_ptr + 0x7)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_high
|
- ((char *)object_ptr)[0x7]
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_2_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_2_w_0_0_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_2_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((undefined2 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((undefined2 *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_2_w_0_0_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- ((short *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((short *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
)
...>
}


@receiver_2_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((byte *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((undefined1 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_2_w_0_0_address_0@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((byte *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &((char *)object)[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((ushort *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)(object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &object[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_2_w_0_0_store_0@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- ((char *)object)[0x0] = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)object = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)(object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- object[0x0] = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *object = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((byte *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- ((char *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((ushort *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)((ushort *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)object
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)(object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- object[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *object
+ (char)((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_2_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(byte *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((byte *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(byte *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_2_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(undefined1 *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((undefined1 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(undefined1 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_2_w_0_0_address_1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)((byte *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &((char *)object)[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)(object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &object[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_2_w_0_0_store_1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- ((char *)object)[0x1] = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- *(char *)(object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- object[0x1] = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
)
...>
}


@receiver_2_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- *(char *)((byte *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- ((char *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- *(char *)(object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- object[0x1]
+ (char)((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_2_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_2_w_2_17_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_2_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((undefined2 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((undefined2 *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_2_w_2_17_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- ((short *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((short *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
)
...>
}


@receiver_2_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((byte *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((undefined1 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_2_w_2_17_address_2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((byte *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &((char *)object)[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((ushort *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)(object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &object[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_2_w_2_17_store_2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- ((char *)object)[0x2] = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)(object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- object[0x2] = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((byte *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- ((char *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((ushort *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)((ushort *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)(object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- object[0x2]
+ (char)((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_2_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(byte *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((byte *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(byte *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_2_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(undefined1 *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((undefined1 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(undefined1 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_2_w_2_17_address_3@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)((byte *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &((char *)object)[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)(object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &object[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_2_w_2_17_store_3@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- ((char *)object)[0x3] = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- *(char *)(object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- object[0x3] = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
)
...>
}


@receiver_2_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- *(char *)((byte *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- ((char *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- *(char *)(object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- object[0x3]
+ (char)((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_2_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_2_w_4_34_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)(object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_2_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((undefined2 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((undefined2 *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)(object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_2_w_4_34_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- ((short *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((short *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)(object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
)
...>
}


@receiver_2_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((byte *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)(object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((undefined1 *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)(object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_2_w_4_34_address_4@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((byte *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &((char *)object)[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((ushort *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)(object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &object[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_2_w_4_34_store_4@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- ((char *)object)[0x4] = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)(object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- object[0x4] = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((byte *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- ((char *)object)[0x4]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((ushort *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)((ushort *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)(object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- object[0x4]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_2_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(byte *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((byte *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(byte *)(object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_2_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(undefined1 *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((undefined1 *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(undefined1 *)(object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_2_w_4_34_address_5@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)((byte *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &((char *)object)[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)(object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &object[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_2_w_4_34_store_5@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- ((char *)object)[0x5] = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- *(char *)(object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- object[0x5] = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
)
...>
}


@receiver_2_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- *(char *)((byte *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- ((char *)object)[0x5]
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- *(char *)(object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- object[0x5]
+ (char)((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_2_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_2_w_6_51_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)(object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_2_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((undefined2 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((undefined2 *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)(object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_2_w_6_51_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- ((short *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((short *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)(object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
)
...>
}


@receiver_2_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((byte *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)(object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((undefined1 *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)(object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_2_w_6_51_address_6@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((byte *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &((char *)object)[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((ushort *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)(object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &object[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_2_w_6_51_store_6@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- ((char *)object)[0x6] = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)(object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- object[0x6] = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((byte *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- ((char *)object)[0x6]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((ushort *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)((ushort *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)(object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- object[0x6]
+ (char)((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_2_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(byte *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((byte *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(byte *)(object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_2_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(undefined1 *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((undefined1 *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(undefined1 *)(object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_2_w_6_51_address_7@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)((byte *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &((char *)object)[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)(object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &object[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_2_w_6_51_store_7@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- ((char *)object)[0x7] = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- *(char *)(object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- object[0x7] = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
)
...>
}


@receiver_2_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- *(char *)((byte *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- ((char *)object)[0x7]
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- *(char *)(object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- object[0x7]
+ (char)((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_3_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_3_w_0_0_word_ushort@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_3_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((undefined2 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((undefined2 *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_3_w_0_0_word_short@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- ((short *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((short *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
)
...>
}


@receiver_3_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((byte *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((undefined1 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_3_w_0_0_address_0@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((byte *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &((char *)object)[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((ushort *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_3_w_0_0_store_0@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- ((char *)object)[0x0] = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)object = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((byte *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- ((char *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((ushort *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)((ushort *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)object
+ (char)((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_3_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(byte *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((byte *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_3_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(undefined1 *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((undefined1 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_3_w_0_0_address_1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)((byte *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &((char *)object)[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_3_w_0_0_store_1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- ((char *)object)[0x1] = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
)
...>
}


@receiver_3_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- *(char *)((byte *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- ((char *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_3_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_3_w_2_17_word_ushort@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_3_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((undefined2 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((undefined2 *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_3_w_2_17_word_short@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- ((short *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((short *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
)
...>
}


@receiver_3_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((byte *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((undefined1 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_3_w_2_17_address_2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((byte *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &((char *)object)[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((ushort *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_3_w_2_17_store_2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- ((char *)object)[0x2] = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((byte *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- ((char *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((ushort *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)((ushort *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_3_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(byte *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((byte *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_3_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(undefined1 *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((undefined1 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_3_w_2_17_address_3@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)((byte *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &((char *)object)[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_3_w_2_17_store_3@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- ((char *)object)[0x3] = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
)
...>
}


@receiver_3_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- *(char *)((byte *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- ((char *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_3_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_3_w_4_34_word_ushort@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_3_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((undefined2 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((undefined2 *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_3_w_4_34_word_short@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- ((short *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((short *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
)
...>
}


@receiver_3_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((byte *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((undefined1 *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_3_w_4_34_address_4@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((byte *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &((char *)object)[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((ushort *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_3_w_4_34_store_4@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- ((char *)object)[0x4] = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((byte *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- ((char *)object)[0x4]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((ushort *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)((ushort *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_3_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(byte *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((byte *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_3_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(undefined1 *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((undefined1 *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_3_w_4_34_address_5@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)((byte *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &((char *)object)[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_3_w_4_34_store_5@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- ((char *)object)[0x5] = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
)
...>
}


@receiver_3_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- *(char *)((byte *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- ((char *)object)[0x5]
+ (char)((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_3_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_3_w_6_51_word_ushort@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_3_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((undefined2 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((undefined2 *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_3_w_6_51_word_short@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- ((short *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((short *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
)
...>
}


@receiver_3_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((byte *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((undefined1 *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_3_w_6_51_address_6@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((byte *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &((char *)object)[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((ushort *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_3_w_6_51_store_6@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- ((char *)object)[0x6] = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((byte *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- ((char *)object)[0x6]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((ushort *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)((ushort *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_3_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(byte *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((byte *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_3_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(undefined1 *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((undefined1 *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_3_w_6_51_address_7@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)((byte *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &((char *)object)[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_3_w_6_51_store_7@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- ((char *)object)[0x7] = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
)
...>
}


@receiver_3_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- *(char *)((byte *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- ((char *)object)[0x7]
+ (char)((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_4_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x0) = (char)V;
- *(char *)((char *)pbVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x0) = (char)V;
- *(byte *)((char *)pbVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x0) = (byte)V;
- *(char *)((char *)pbVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->type_flags = (ushort)V;

...>
}

@receiver_4_w_0_0_word_ushort@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- *(ushort *)((byte *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- ((ushort *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- *(ushort *)((ushort *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
)
...>
}


@receiver_4_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- *(undefined2 *)((byte *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- ((undefined2 *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
)
...>
}


@receiver_4_w_0_0_word_short@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_signed
|
- *(short *)((byte *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_signed
|
- ((short *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_signed
|
- *(short *)((short *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_signed
)
...>
}


@receiver_4_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(byte *)((byte *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- ((byte *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(byte *)((ushort *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- (byte)((ushort *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(byte *)pbVar2
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- ((undefined1 *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar2 + 0x0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- (undefined1)((ushort *)pbVar2)[0x0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(undefined1 *)pbVar2
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_address_0@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- &*(char *)((byte *)pbVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- &((char *)pbVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- &*(char *)((ushort *)pbVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- &*(char *)pbVar2
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_store_0@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low = (byte)E;
|
- ((char *)pbVar2)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low = (byte)E;
|
- *(char *)pbVar2 = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(char *)((byte *)pbVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- ((char *)pbVar2)[0x0]
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(char *)((ushort *)pbVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- (char)((ushort *)pbVar2)[0x0]
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_low
|
- *(char *)pbVar2
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_low
)
...>
}


@receiver_4_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- *(byte *)((byte *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- ((byte *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high
)
...>
}


@receiver_4_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- ((undefined1 *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high
)
...>
}


@receiver_4_w_0_0_address_1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- &*(char *)((byte *)pbVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- &((char *)pbVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar2)->type_flags_high
)
...>
}


@receiver_4_w_0_0_store_1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high = (byte)E;
|
- ((char *)pbVar2)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_4_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- *(char *)((byte *)pbVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_high
|
- ((char *)pbVar2)[0x1]
+ (char)((uw_object_hdr_t *)pbVar2)->type_flags_high
)
...>
}


@receiver_4_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x2) = (char)V;
- *(char *)((char *)pbVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x2) = (char)V;
- *(byte *)((char *)pbVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x2) = (byte)V;
- *(char *)((char *)pbVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->position_word = (ushort)V;

...>
}

@receiver_4_w_2_17_word_ushort@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- *(ushort *)((byte *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- ((ushort *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- *(ushort *)((ushort *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->position_word
)
...>
}


@receiver_4_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- *(undefined2 *)((byte *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- ((undefined2 *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->position_word
)
...>
}


@receiver_4_w_2_17_word_short@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word_signed
|
- *(short *)((byte *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word_signed
|
- ((short *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->position_word_signed
|
- *(short *)((short *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->position_word_signed
)
...>
}


@receiver_4_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- *(byte *)((byte *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- ((byte *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- *(byte *)((ushort *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- (byte)((ushort *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- *(undefined1 *)((byte *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- ((undefined1 *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar2 + 0x1)
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
|
- (undefined1)((ushort *)pbVar2)[0x1]
+ ((uw_object_hdr_t *)pbVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_address_2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_low
|
- &*(char *)((byte *)pbVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_low
|
- &((char *)pbVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_low
|
- &*(char *)((ushort *)pbVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_store_2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_low = (byte)E;
|
- ((char *)pbVar2)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_low
|
- *(char *)((byte *)pbVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_low
|
- ((char *)pbVar2)[0x2]
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_low
|
- *(char *)((ushort *)pbVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_low
|
- (char)((ushort *)pbVar2)[0x1]
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_low
)
...>
}


@receiver_4_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->position_word_high
|
- *(byte *)((byte *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->position_word_high
|
- ((byte *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->position_word_high
)
...>
}


@receiver_4_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->position_word_high
|
- *(undefined1 *)((byte *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->position_word_high
|
- ((undefined1 *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->position_word_high
)
...>
}


@receiver_4_w_2_17_address_3@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_high
|
- &*(char *)((byte *)pbVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_high
|
- &((char *)pbVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar2)->position_word_high
)
...>
}


@receiver_4_w_2_17_store_3@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_high = (byte)E;
|
- ((char *)pbVar2)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_4_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_high
|
- *(char *)((byte *)pbVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_high
|
- ((char *)pbVar2)[0x3]
+ (char)((uw_object_hdr_t *)pbVar2)->position_word_high
)
...>
}


@receiver_4_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x4) = (char)V;
- *(char *)((char *)pbVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x4) = (char)V;
- *(byte *)((char *)pbVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x4) = (byte)V;
- *(char *)((char *)pbVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->chain_word = (ushort)V;

...>
}

@receiver_4_w_4_34_word_ushort@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- *(ushort *)((byte *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- ((ushort *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- *(ushort *)((ushort *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
)
...>
}


@receiver_4_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- *(undefined2 *)((byte *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- ((undefined2 *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
)
...>
}


@receiver_4_w_4_34_word_short@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_signed
|
- *(short *)((byte *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_signed
|
- ((short *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_signed
|
- *(short *)((short *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_signed
)
...>
}


@receiver_4_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- *(byte *)((byte *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- ((byte *)pbVar2)[0x4]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- *(byte *)((ushort *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- (byte)((ushort *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar2 + 0x4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- ((undefined1 *)pbVar2)[0x4]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar2 + 0x2)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- (undefined1)((ushort *)pbVar2)[0x2]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_address_4@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- &*(char *)((byte *)pbVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- &((char *)pbVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- &*(char *)((ushort *)pbVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_store_4@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low = (byte)E;
|
- ((char *)pbVar2)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- *(char *)((byte *)pbVar2 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- ((char *)pbVar2)[0x4]
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- *(char *)((ushort *)pbVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_low
|
- (char)((ushort *)pbVar2)[0x2]
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_low
)
...>
}


@receiver_4_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x5)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- *(byte *)((byte *)pbVar2 + 0x5)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- ((byte *)pbVar2)[0x5]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high
)
...>
}


@receiver_4_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x5)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar2 + 0x5)
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- ((undefined1 *)pbVar2)[0x5]
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high
)
...>
}


@receiver_4_w_4_34_address_5@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- &*(char *)((byte *)pbVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- &((char *)pbVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar2)->chain_word_high
)
...>
}


@receiver_4_w_4_34_store_5@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high = (byte)E;
|
- ((char *)pbVar2)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_4_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- *(char *)((byte *)pbVar2 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_high
|
- ((char *)pbVar2)[0x5]
+ (char)((uw_object_hdr_t *)pbVar2)->chain_word_high
)
...>
}


@receiver_4_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x6) = (char)V;
- *(char *)((char *)pbVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar2 + 0x6) = (char)V;
- *(byte *)((char *)pbVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x6) = (byte)V;
- *(char *)((char *)pbVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar2 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar2)->link_word = (ushort)V;

...>
}

@receiver_4_w_6_51_word_ushort@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- *(ushort *)((byte *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- ((ushort *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- *(ushort *)((ushort *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->link_word
)
...>
}


@receiver_4_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- *(undefined2 *)((byte *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- ((undefined2 *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->link_word
)
...>
}


@receiver_4_w_6_51_word_short@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word_signed
|
- *(short *)((byte *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word_signed
|
- ((short *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->link_word_signed
|
- *(short *)((short *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->link_word_signed
)
...>
}


@receiver_4_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- *(byte *)((byte *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- ((byte *)pbVar2)[0x6]
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- *(byte *)((ushort *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- (byte)((ushort *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- *(undefined1 *)((byte *)pbVar2 + 0x6)
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- ((undefined1 *)pbVar2)[0x6]
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar2 + 0x3)
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
|
- (undefined1)((ushort *)pbVar2)[0x3]
+ ((uw_object_hdr_t *)pbVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_address_6@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_low
|
- &*(char *)((byte *)pbVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_low
|
- &((char *)pbVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_low
|
- &*(char *)((ushort *)pbVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_store_6@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_low = (byte)E;
|
- ((char *)pbVar2)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_low
|
- *(char *)((byte *)pbVar2 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_low
|
- ((char *)pbVar2)[0x6]
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_low
|
- *(char *)((ushort *)pbVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_low
|
- (char)((ushort *)pbVar2)[0x3]
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_low
)
...>
}


@receiver_4_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar2 + 0x7)
+ ((uw_object_hdr_t *)pbVar2)->link_word_high
|
- *(byte *)((byte *)pbVar2 + 0x7)
+ ((uw_object_hdr_t *)pbVar2)->link_word_high
|
- ((byte *)pbVar2)[0x7]
+ ((uw_object_hdr_t *)pbVar2)->link_word_high
)
...>
}


@receiver_4_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar2 + 0x7)
+ ((uw_object_hdr_t *)pbVar2)->link_word_high
|
- *(undefined1 *)((byte *)pbVar2 + 0x7)
+ ((uw_object_hdr_t *)pbVar2)->link_word_high
|
- ((undefined1 *)pbVar2)[0x7]
+ ((uw_object_hdr_t *)pbVar2)->link_word_high
)
...>
}


@receiver_4_w_6_51_address_7@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_high
|
- &*(char *)((byte *)pbVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_high
|
- &((char *)pbVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar2)->link_word_high
)
...>
}


@receiver_4_w_6_51_store_7@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_high = (byte)E;
|
- ((char *)pbVar2)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_4_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar2 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_high
|
- *(char *)((byte *)pbVar2 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_high
|
- ((char *)pbVar2)[0x7]
+ (char)((uw_object_hdr_t *)pbVar2)->link_word_high
)
...>
}


@receiver_5_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x0) = (char)V;
- *(char *)((char *)pbVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x0) = (char)V;
- *(byte *)((char *)pbVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x0) = (byte)V;
- *(char *)((char *)pbVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->type_flags = (ushort)V;

...>
}

@receiver_5_w_0_0_word_ushort@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}


@receiver_5_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(undefined2 *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((undefined2 *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}


@receiver_5_w_0_0_word_short@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- ((short *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
|
- *(short *)((short *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_signed
)
...>
}


@receiver_5_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((byte *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (byte)((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(byte *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((undefined1 *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (undefined1)((ushort *)pbVar4)[0x0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(undefined1 *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_5_w_0_0_address_0@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)((byte *)pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &((char *)pbVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)((ushort *)pbVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- &*(char *)pbVar4
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_5_w_0_0_store_0@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- ((char *)pbVar4)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
|
- *(char *)pbVar4 = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)((byte *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- ((char *)pbVar4)[0x0]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)((ushort *)pbVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- (char)((ushort *)pbVar4)[0x0]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
|
- *(char *)pbVar4
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_low
)
...>
}


@receiver_5_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(byte *)((byte *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((byte *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_5_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((undefined1 *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_5_w_0_0_address_1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- &*(char *)((byte *)pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- &((char *)pbVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_5_w_0_0_store_1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
|
- ((char *)pbVar4)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_5_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- *(char *)((byte *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
|
- ((char *)pbVar4)[0x1]
+ (char)((uw_object_hdr_t *)pbVar4)->type_flags_high
)
...>
}


@receiver_5_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x2) = (char)V;
- *(char *)((char *)pbVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x2) = (char)V;
- *(byte *)((char *)pbVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x2) = (byte)V;
- *(char *)((char *)pbVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->position_word = (ushort)V;

...>
}

@receiver_5_w_2_17_word_ushort@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}


@receiver_5_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(undefined2 *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((undefined2 *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}


@receiver_5_w_2_17_word_short@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- ((short *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
|
- *(short *)((short *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_signed
)
...>
}


@receiver_5_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((byte *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (byte)((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((undefined1 *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x1)
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (undefined1)((ushort *)pbVar4)[0x1]
+ ((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_5_w_2_17_address_2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &*(char *)((byte *)pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &((char *)pbVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
|
- &*(char *)((ushort *)pbVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_5_w_2_17_store_2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- ((char *)pbVar4)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)((byte *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- ((char *)pbVar4)[0x2]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- *(char *)((ushort *)pbVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
|
- (char)((ushort *)pbVar4)[0x1]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_low
)
...>
}


@receiver_5_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(byte *)((byte *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((byte *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_5_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((undefined1 *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_5_w_2_17_address_3@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
|
- &*(char *)((byte *)pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
|
- &((char *)pbVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_5_w_2_17_store_3@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
|
- ((char *)pbVar4)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_5_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- *(char *)((byte *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
|
- ((char *)pbVar4)[0x3]
+ (char)((uw_object_hdr_t *)pbVar4)->position_word_high
)
...>
}


@receiver_5_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x4) = (char)V;
- *(char *)((char *)pbVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x4) = (char)V;
- *(byte *)((char *)pbVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x4) = (byte)V;
- *(char *)((char *)pbVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->chain_word = (ushort)V;

...>
}

@receiver_5_w_4_34_word_ushort@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}


@receiver_5_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(undefined2 *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((undefined2 *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}


@receiver_5_w_4_34_word_short@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- ((short *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
|
- *(short *)((short *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_signed
)
...>
}


@receiver_5_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((byte *)pbVar4)[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (byte)((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((undefined1 *)pbVar4)[0x4]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x2)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (undefined1)((ushort *)pbVar4)[0x2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_5_w_4_34_address_4@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &*(char *)((byte *)pbVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &((char *)pbVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- &*(char *)((ushort *)pbVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_5_w_4_34_store_4@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- ((char *)pbVar4)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)((byte *)pbVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- ((char *)pbVar4)[0x4]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- *(char *)((ushort *)pbVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
|
- (char)((ushort *)pbVar4)[0x2]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_low
)
...>
}


@receiver_5_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(byte *)((byte *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((byte *)pbVar4)[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_5_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x5)
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((undefined1 *)pbVar4)[0x5]
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_5_w_4_34_address_5@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- &*(char *)((byte *)pbVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- &((char *)pbVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_5_w_4_34_store_5@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
|
- ((char *)pbVar4)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_5_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- *(char *)((byte *)pbVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
|
- ((char *)pbVar4)[0x5]
+ (char)((uw_object_hdr_t *)pbVar4)->chain_word_high
)
...>
}


@receiver_5_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x6) = (char)V;
- *(char *)((char *)pbVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar4 + 0x6) = (char)V;
- *(byte *)((char *)pbVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x6) = (byte)V;
- *(char *)((char *)pbVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar4 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar4)->link_word = (ushort)V;

...>
}

@receiver_5_w_6_51_word_ushort@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}


@receiver_5_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(undefined2 *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((undefined2 *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}


@receiver_5_w_6_51_word_short@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- ((short *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
|
- *(short *)((short *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_signed
)
...>
}


@receiver_5_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((byte *)pbVar4)[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(byte *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (byte)((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)((byte *)pbVar4 + 0x6)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((undefined1 *)pbVar4)[0x6]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar4 + 0x3)
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (undefined1)((ushort *)pbVar4)[0x3]
+ ((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_5_w_6_51_address_6@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &*(char *)((byte *)pbVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &((char *)pbVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
|
- &*(char *)((ushort *)pbVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_5_w_6_51_store_6@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- ((char *)pbVar4)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)((byte *)pbVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- ((char *)pbVar4)[0x6]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- *(char *)((ushort *)pbVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
|
- (char)((ushort *)pbVar4)[0x3]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_low
)
...>
}


@receiver_5_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(byte *)((byte *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((byte *)pbVar4)[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_5_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(undefined1 *)((byte *)pbVar4 + 0x7)
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((undefined1 *)pbVar4)[0x7]
+ ((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_5_w_6_51_address_7@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
|
- &*(char *)((byte *)pbVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
|
- &((char *)pbVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_5_w_6_51_store_7@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
|
- ((char *)pbVar4)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_5_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- *(char *)((byte *)pbVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
|
- ((char *)pbVar4)[0x7]
+ (char)((uw_object_hdr_t *)pbVar4)->link_word_high
)
...>
}


@receiver_6_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x0) = (char)V;
- *(char *)((char *)puVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x0) = (char)V;
- *(byte *)((char *)puVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x0) = (byte)V;
- *(char *)((char *)puVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x0) = (byte)V;
- *(byte *)((char *)puVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->type_flags = (ushort)V;

...>
}

@receiver_6_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(ushort *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- ((ushort *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(ushort *)((ushort *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_6_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(undefined2 *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- ((undefined2 *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}


@receiver_6_w_0_0_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
|
- *(short *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
|
- ((short *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
|
- *(short *)((short *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_signed
)
...>
}


@receiver_6_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(byte *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- ((byte *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(byte *)((ushort *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- (byte)((ushort *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(byte *)puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(undefined1 *)((byte *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- ((undefined1 *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x0)
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- (undefined1)((ushort *)puVar1)[0x0]
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(undefined1 *)puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_6_w_0_0_address_0@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)((byte *)puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &((char *)puVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)((ushort *)puVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
|
- &*(char *)puVar1
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_6_w_0_0_store_0@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- ((char *)puVar1)[0x0] = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
|
- *(char *)puVar1 = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(char *)((byte *)puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- ((char *)puVar1)[0x0]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(char *)((ushort *)puVar1 + 0x0)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- (char)((ushort *)puVar1)[0x0]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
|
- *(char *)puVar1
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_low
)
...>
}


@receiver_6_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- *(byte *)((byte *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- ((byte *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_6_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- *(undefined1 *)((byte *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
|
- ((undefined1 *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_6_w_0_0_address_1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
|
- &*(char *)((byte *)puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
|
- &((char *)puVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_6_w_0_0_store_1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
|
- ((char *)puVar1)[0x1] = E;
+ ((uw_object_hdr_t *)puVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_6_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
|
- *(char *)((byte *)puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
|
- ((char *)puVar1)[0x1]
+ (char)((uw_object_hdr_t *)puVar1)->type_flags_high
)
...>
}


@receiver_6_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x2) = (char)V;
- *(char *)((char *)puVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x2) = (char)V;
- *(byte *)((char *)puVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x2) = (byte)V;
- *(char *)((char *)puVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x2) = (byte)V;
- *(byte *)((char *)puVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->position_word = (ushort)V;

...>
}

@receiver_6_w_2_17_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(ushort *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- ((ushort *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(ushort *)((ushort *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_6_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(undefined2 *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- ((undefined2 *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}


@receiver_6_w_2_17_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
|
- *(short *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
|
- ((short *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
|
- *(short *)((short *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_signed
)
...>
}


@receiver_6_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(byte *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- ((byte *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(byte *)((ushort *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- (byte)((ushort *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(undefined1 *)((byte *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- ((undefined1 *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x1)
+ ((uw_object_hdr_t *)puVar1)->position_word_low
|
- (undefined1)((ushort *)puVar1)[0x1]
+ ((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_6_w_2_17_address_2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &*(char *)((byte *)puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &((char *)puVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
|
- &*(char *)((ushort *)puVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_6_w_2_17_store_2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
|
- ((char *)puVar1)[0x2] = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(char *)((byte *)puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- ((char *)puVar1)[0x2]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- *(char *)((ushort *)puVar1 + 0x1)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
|
- (char)((ushort *)puVar1)[0x1]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_low
)
...>
}


@receiver_6_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- *(byte *)((byte *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- ((byte *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_6_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- *(undefined1 *)((byte *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->position_word_high
|
- ((undefined1 *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_6_w_2_17_address_3@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
|
- &*(char *)((byte *)puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
|
- &((char *)puVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_6_w_2_17_store_3@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
|
- ((char *)puVar1)[0x3] = E;
+ ((uw_object_hdr_t *)puVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_6_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
|
- *(char *)((byte *)puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
|
- ((char *)puVar1)[0x3]
+ (char)((uw_object_hdr_t *)puVar1)->position_word_high
)
...>
}


@receiver_6_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x4) = (char)V;
- *(char *)((char *)puVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x4) = (char)V;
- *(byte *)((char *)puVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x4) = (byte)V;
- *(char *)((char *)puVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x4) = (byte)V;
- *(byte *)((char *)puVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->chain_word = (ushort)V;

...>
}

@receiver_6_w_4_34_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(ushort *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- ((ushort *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(ushort *)((ushort *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_6_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(undefined2 *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- ((undefined2 *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}


@receiver_6_w_4_34_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
|
- *(short *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
|
- ((short *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
|
- *(short *)((short *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_signed
)
...>
}


@receiver_6_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(byte *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- ((byte *)puVar1)[0x4]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(byte *)((ushort *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (byte)((ushort *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(undefined1 *)((byte *)puVar1 + 0x4)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- ((undefined1 *)puVar1)[0x4]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x2)
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (undefined1)((ushort *)puVar1)[0x2]
+ ((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_6_w_4_34_address_4@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &*(char *)((byte *)puVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &((char *)puVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
|
- &*(char *)((ushort *)puVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_6_w_4_34_store_4@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
|
- ((char *)puVar1)[0x4] = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x4)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(char *)((byte *)puVar1 + 0x4)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- ((char *)puVar1)[0x4]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- *(char *)((ushort *)puVar1 + 0x2)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
|
- (char)((ushort *)puVar1)[0x2]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_low
)
...>
}


@receiver_6_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- *(byte *)((byte *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- ((byte *)puVar1)[0x5]
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_6_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- *(undefined1 *)((byte *)puVar1 + 0x5)
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
|
- ((undefined1 *)puVar1)[0x5]
+ ((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_6_w_4_34_address_5@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
|
- &*(char *)((byte *)puVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
|
- &((char *)puVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_6_w_4_34_store_5@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
|
- ((char *)puVar1)[0x5] = E;
+ ((uw_object_hdr_t *)puVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_6_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x5)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
|
- *(char *)((byte *)puVar1 + 0x5)
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
|
- ((char *)puVar1)[0x5]
+ (char)((uw_object_hdr_t *)puVar1)->chain_word_high
)
...>
}


@receiver_6_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x6) = (char)V;
- *(char *)((char *)puVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar1 + 0x6) = (char)V;
- *(byte *)((char *)puVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x6) = (byte)V;
- *(char *)((char *)puVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar1 + 0x6) = (byte)V;
- *(byte *)((char *)puVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar1)->link_word = (ushort)V;

...>
}

@receiver_6_w_6_51_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(ushort *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- ((ushort *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(ushort *)((ushort *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_6_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(undefined2 *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- ((undefined2 *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- *(undefined2 *)((undefined2 *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}


@receiver_6_w_6_51_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
|
- *(short *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
|
- ((short *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
|
- *(short *)((short *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_signed
)
...>
}


@receiver_6_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(byte *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- ((byte *)puVar1)[0x6]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(byte *)((ushort *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- (byte)((ushort *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(undefined1 *)((byte *)puVar1 + 0x6)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- ((undefined1 *)puVar1)[0x6]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(undefined1 *)((ushort *)puVar1 + 0x3)
+ ((uw_object_hdr_t *)puVar1)->link_word_low
|
- (undefined1)((ushort *)puVar1)[0x3]
+ ((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_6_w_6_51_address_6@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &*(char *)((byte *)puVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &((char *)puVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
|
- &*(char *)((ushort *)puVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_6_w_6_51_store_6@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
|
- ((char *)puVar1)[0x6] = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x6)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(char *)((byte *)puVar1 + 0x6)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- ((char *)puVar1)[0x6]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- *(char *)((ushort *)puVar1 + 0x3)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
|
- (char)((ushort *)puVar1)[0x3]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_low
)
...>
}


@receiver_6_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- *(byte *)((byte *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- ((byte *)puVar1)[0x7]
+ ((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_6_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- *(undefined1 *)((byte *)puVar1 + 0x7)
+ ((uw_object_hdr_t *)puVar1)->link_word_high
|
- ((undefined1 *)puVar1)[0x7]
+ ((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_6_w_6_51_address_7@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
|
- &*(char *)((byte *)puVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
|
- &((char *)puVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_6_w_6_51_store_7@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
|
- ((char *)puVar1)[0x7] = E;
+ ((uw_object_hdr_t *)puVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_6_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar1 + 0x7)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
|
- *(char *)((byte *)puVar1 + 0x7)
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
|
- ((char *)puVar1)[0x7]
+ (char)((uw_object_hdr_t *)puVar1)->link_word_high
)
...>
}


@receiver_7_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x0) = (char)V;
- *(char *)((char *)object_ptr + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x0) = (char)V;
- *(byte *)((char *)object_ptr + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x0) = (byte)V;
- *(char *)((char *)object_ptr + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x0) = (byte)V;
- *(byte *)((char *)object_ptr + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->type_flags = (ushort)V;

...>
}

@receiver_7_w_0_0_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(ushort *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- ((ushort *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(ushort *)((ushort *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
)
...>
}


@receiver_7_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(undefined2 *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- ((undefined2 *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
)
...>
}


@receiver_7_w_0_0_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
|
- *(short *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
|
- ((short *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
|
- *(short *)((short *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_signed
)
...>
}


@receiver_7_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(byte *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- ((byte *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(byte *)((ushort *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- (byte)((ushort *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(byte *)object_ptr
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(undefined1 *)((byte *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- ((undefined1 *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- (undefined1)((ushort *)object_ptr)[0x0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(undefined1 *)object_ptr
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_7_w_0_0_address_0@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &*(char *)((byte *)object_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &((char *)object_ptr)[0x0]
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &*(char *)((ushort *)object_ptr + 0x0)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- &*(char *)object_ptr
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_7_w_0_0_store_0@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- ((char *)object_ptr)[0x0] = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x0) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
|
- *(char *)object_ptr = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_low = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x0)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(char *)((byte *)object_ptr + 0x0)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- ((char *)object_ptr)[0x0]
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(char *)((ushort *)object_ptr + 0x0)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- (char)((ushort *)object_ptr)[0x0]
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
|
- *(char *)object_ptr
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_low
)
...>
}


@receiver_7_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- *(byte *)((byte *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- ((byte *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_7_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- *(undefined1 *)((byte *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- ((undefined1 *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_7_w_0_0_address_1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- &*(char *)((byte *)object_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- &((char *)object_ptr)[0x1]
+ (char *)&((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_7_w_0_0_store_1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high = (byte)E;
|
- ((char *)object_ptr)[0x1] = E;
+ ((uw_object_hdr_t *)object_ptr)->type_flags_high = (byte)E;
)
...>
}


@receiver_7_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x1)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- *(char *)((byte *)object_ptr + 0x1)
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_high
|
- ((char *)object_ptr)[0x1]
+ (char)((uw_object_hdr_t *)object_ptr)->type_flags_high
)
...>
}


@receiver_7_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x2) = (char)V;
- *(char *)((char *)object_ptr + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x2) = (char)V;
- *(byte *)((char *)object_ptr + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x2) = (byte)V;
- *(char *)((char *)object_ptr + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x2) = (byte)V;
- *(byte *)((char *)object_ptr + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->position_word = (ushort)V;

...>
}

@receiver_7_w_2_17_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(ushort *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- ((ushort *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(ushort *)((ushort *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word
)
...>
}


@receiver_7_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(undefined2 *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- ((undefined2 *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word
)
...>
}


@receiver_7_w_2_17_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
|
- *(short *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
|
- ((short *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
|
- *(short *)((short *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word_signed
)
...>
}


@receiver_7_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(byte *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- ((byte *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(byte *)((ushort *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- (byte)((ushort *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_7_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(undefined1 *)((byte *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- ((undefined1 *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x1)
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
|
- (undefined1)((ushort *)object_ptr)[0x1]
+ ((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_7_w_2_17_address_2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
|
- &*(char *)((byte *)object_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
|
- &((char *)object_ptr)[0x2]
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
|
- &*(char *)((ushort *)object_ptr + 0x1)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_7_w_2_17_store_2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
|
- ((char *)object_ptr)[0x2] = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x1) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_low = (byte)E;
)
...>
}


@receiver_7_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x2)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(char *)((byte *)object_ptr + 0x2)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- ((char *)object_ptr)[0x2]
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- *(char *)((ushort *)object_ptr + 0x1)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
|
- (char)((ushort *)object_ptr)[0x1]
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_low
)
...>
}


@receiver_7_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- *(byte *)((byte *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- ((byte *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_7_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- *(undefined1 *)((byte *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
|
- ((undefined1 *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_7_w_2_17_address_3@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_high
|
- &*(char *)((byte *)object_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_high
|
- &((char *)object_ptr)[0x3]
+ (char *)&((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_7_w_2_17_store_3@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_high = (byte)E;
|
- ((char *)object_ptr)[0x3] = E;
+ ((uw_object_hdr_t *)object_ptr)->position_word_high = (byte)E;
)
...>
}


@receiver_7_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x3)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_high
|
- *(char *)((byte *)object_ptr + 0x3)
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_high
|
- ((char *)object_ptr)[0x3]
+ (char)((uw_object_hdr_t *)object_ptr)->position_word_high
)
...>
}


@receiver_7_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x4) = (char)V;
- *(char *)((char *)object_ptr + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x4) = (char)V;
- *(byte *)((char *)object_ptr + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x4) = (byte)V;
- *(char *)((char *)object_ptr + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x4) = (byte)V;
- *(byte *)((char *)object_ptr + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->chain_word = (ushort)V;

...>
}

@receiver_7_w_4_34_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(ushort *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- ((ushort *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(ushort *)((ushort *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
)
...>
}


@receiver_7_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(undefined2 *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- ((undefined2 *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
)
...>
}


@receiver_7_w_4_34_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
|
- *(short *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
|
- ((short *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
|
- *(short *)((short *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_signed
)
...>
}


@receiver_7_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(byte *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- ((byte *)object_ptr)[0x4]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(byte *)((ushort *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- (byte)((ushort *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_7_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(undefined1 *)((byte *)object_ptr + 0x4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- ((undefined1 *)object_ptr)[0x4]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x2)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- (undefined1)((ushort *)object_ptr)[0x2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_7_w_4_34_address_4@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x4)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- &*(char *)((byte *)object_ptr + 0x4)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- &((char *)object_ptr)[0x4]
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- &*(char *)((ushort *)object_ptr + 0x2)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_7_w_4_34_store_4@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x4) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x4) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
|
- ((char *)object_ptr)[0x4] = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x2) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_low = (byte)E;
)
...>
}


@receiver_7_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x4)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(char *)((byte *)object_ptr + 0x4)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- ((char *)object_ptr)[0x4]
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- *(char *)((ushort *)object_ptr + 0x2)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
|
- (char)((ushort *)object_ptr)[0x2]
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_low
)
...>
}


@receiver_7_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- *(byte *)((byte *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- ((byte *)object_ptr)[0x5]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_7_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- *(undefined1 *)((byte *)object_ptr + 0x5)
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- ((undefined1 *)object_ptr)[0x5]
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_7_w_4_34_address_5@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x5)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- &*(char *)((byte *)object_ptr + 0x5)
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- &((char *)object_ptr)[0x5]
+ (char *)&((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_7_w_4_34_store_5@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x5) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x5) = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high = (byte)E;
|
- ((char *)object_ptr)[0x5] = E;
+ ((uw_object_hdr_t *)object_ptr)->chain_word_high = (byte)E;
)
...>
}


@receiver_7_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x5)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- *(char *)((byte *)object_ptr + 0x5)
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_high
|
- ((char *)object_ptr)[0x5]
+ (char)((uw_object_hdr_t *)object_ptr)->chain_word_high
)
...>
}


@receiver_7_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x6) = (char)V;
- *(char *)((char *)object_ptr + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object_ptr + 0x6) = (char)V;
- *(byte *)((char *)object_ptr + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x6) = (byte)V;
- *(char *)((char *)object_ptr + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object_ptr + 0x6) = (byte)V;
- *(byte *)((char *)object_ptr + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object_ptr)->link_word = (ushort)V;

...>
}

@receiver_7_w_6_51_word_ushort@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(ushort *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- ((ushort *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(ushort *)((ushort *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word
)
...>
}


@receiver_7_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(undefined2 *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- ((undefined2 *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- *(undefined2 *)((undefined2 *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word
)
...>
}


@receiver_7_w_6_51_word_short@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
|
- *(short *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
|
- ((short *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
|
- *(short *)((short *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word_signed
)
...>
}


@receiver_7_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(byte *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- ((byte *)object_ptr)[0x6]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(byte *)((ushort *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- (byte)((ushort *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_7_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(undefined1 *)((byte *)object_ptr + 0x6)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- ((undefined1 *)object_ptr)[0x6]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(undefined1 *)((ushort *)object_ptr + 0x3)
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
|
- (undefined1)((ushort *)object_ptr)[0x3]
+ ((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_7_w_6_51_address_6@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x6)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
|
- &*(char *)((byte *)object_ptr + 0x6)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
|
- &((char *)object_ptr)[0x6]
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
|
- &*(char *)((ushort *)object_ptr + 0x3)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_7_w_6_51_store_6@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x6) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x6) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
|
- ((char *)object_ptr)[0x6] = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object_ptr + 0x3) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_low = (byte)E;
)
...>
}


@receiver_7_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x6)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(char *)((byte *)object_ptr + 0x6)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- ((char *)object_ptr)[0x6]
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- *(char *)((ushort *)object_ptr + 0x3)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
|
- (char)((ushort *)object_ptr)[0x3]
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_low
)
...>
}


@receiver_7_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- *(byte *)((byte *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- ((byte *)object_ptr)[0x7]
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_7_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- *(undefined1 *)((byte *)object_ptr + 0x7)
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
|
- ((undefined1 *)object_ptr)[0x7]
+ ((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_7_w_6_51_address_7@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object_ptr + 0x7)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_high
|
- &*(char *)((byte *)object_ptr + 0x7)
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_high
|
- &((char *)object_ptr)[0x7]
+ (char *)&((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_7_w_6_51_store_7@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x7) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_high = (byte)E;
|
- *(char *)((byte *)object_ptr + 0x7) = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_high = (byte)E;
|
- ((char *)object_ptr)[0x7] = E;
+ ((uw_object_hdr_t *)object_ptr)->link_word_high = (byte)E;
)
...>
}


@receiver_7_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_is_mobile\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object_ptr + 0x7)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_high
|
- *(char *)((byte *)object_ptr + 0x7)
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_high
|
- ((char *)object_ptr)[0x7]
+ (char)((uw_object_hdr_t *)object_ptr)->link_word_high
)
...>
}


@receiver_8_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x0) = (char)V;
- *(char *)((char *)puVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x0) = (char)V;
- *(byte *)((char *)puVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x0) = (byte)V;
- *(char *)((char *)puVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x0) = (byte)V;
- *(byte *)((char *)puVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->type_flags = (ushort)V;

...>
}

@receiver_8_w_0_0_word_ushort@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@receiver_8_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((undefined2 *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}


@receiver_8_w_0_0_word_short@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- ((short *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
|
- *(short *)((short *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_signed
)
...>
}


@receiver_8_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((byte *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (byte)((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(byte *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)((byte *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((undefined1 *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x0)
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (undefined1)((ushort *)puVar3)[0x0]
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(undefined1 *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_8_w_0_0_address_0@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)((byte *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &((char *)puVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)((ushort *)puVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
|
- &*(char *)puVar3
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_8_w_0_0_store_0@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- ((char *)puVar3)[0x0] = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
|
- *(char *)puVar3 = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)((byte *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- ((char *)puVar3)[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)((ushort *)puVar3 + 0x0)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- (char)((ushort *)puVar3)[0x0]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
|
- *(char *)puVar3
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_low
)
...>
}


@receiver_8_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(byte *)((byte *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((byte *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_8_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(undefined1 *)((byte *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((undefined1 *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_8_w_0_0_address_1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
|
- &*(char *)((byte *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
|
- &((char *)puVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_8_w_0_0_store_1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
|
- ((char *)puVar3)[0x1] = E;
+ ((uw_object_hdr_t *)puVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_8_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
|
- *(char *)((byte *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
|
- ((char *)puVar3)[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->type_flags_high
)
...>
}


@receiver_8_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x2) = (char)V;
- *(char *)((char *)puVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x2) = (char)V;
- *(byte *)((char *)puVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x2) = (byte)V;
- *(char *)((char *)puVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x2) = (byte)V;
- *(byte *)((char *)puVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->position_word = (ushort)V;

...>
}

@receiver_8_w_2_17_word_ushort@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(ushort *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@receiver_8_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((undefined2 *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}


@receiver_8_w_2_17_word_short@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- ((short *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
|
- *(short *)((short *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_signed
)
...>
}


@receiver_8_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((byte *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(byte *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (byte)((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_8_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((undefined1 *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x1)
+ ((uw_object_hdr_t *)puVar3)->position_word_low
|
- (undefined1)((ushort *)puVar3)[0x1]
+ ((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_8_w_2_17_address_2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)((byte *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &((char *)puVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
|
- &*(char *)((ushort *)puVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_8_w_2_17_store_2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- ((char *)puVar3)[0x2] = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_8_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)((byte *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- ((char *)puVar3)[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- *(char *)((ushort *)puVar3 + 0x1)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
|
- (char)((ushort *)puVar3)[0x1]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_low
)
...>
}


@receiver_8_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(byte *)((byte *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((byte *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_8_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((undefined1 *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_8_w_2_17_address_3@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
|
- &*(char *)((byte *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
|
- &((char *)puVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_8_w_2_17_store_3@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
|
- ((char *)puVar3)[0x3] = E;
+ ((uw_object_hdr_t *)puVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_8_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
|
- *(char *)((byte *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
|
- ((char *)puVar3)[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->position_word_high
)
...>
}


@receiver_8_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x4) = (char)V;
- *(char *)((char *)puVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x4) = (char)V;
- *(byte *)((char *)puVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x4) = (byte)V;
- *(char *)((char *)puVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x4) = (byte)V;
- *(byte *)((char *)puVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->chain_word = (ushort)V;

...>
}

@receiver_8_w_4_34_word_ushort@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(ushort *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@receiver_8_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((undefined2 *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}


@receiver_8_w_4_34_word_short@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- ((short *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
|
- *(short *)((short *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_signed
)
...>
}


@receiver_8_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((byte *)puVar3)[0x4]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(byte *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (byte)((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_8_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x4)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((undefined1 *)puVar3)[0x4]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x2)
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (undefined1)((ushort *)puVar3)[0x2]
+ ((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_8_w_4_34_address_4@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)((byte *)puVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &((char *)puVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
|
- &*(char *)((ushort *)puVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_8_w_4_34_store_4@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- ((char *)puVar3)[0x4] = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_8_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x4)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)((byte *)puVar3 + 0x4)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- ((char *)puVar3)[0x4]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- *(char *)((ushort *)puVar3 + 0x2)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
|
- (char)((ushort *)puVar3)[0x2]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_low
)
...>
}


@receiver_8_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(byte *)((byte *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((byte *)puVar3)[0x5]
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_8_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x5)
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((undefined1 *)puVar3)[0x5]
+ ((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_8_w_4_34_address_5@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
|
- &*(char *)((byte *)puVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
|
- &((char *)puVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_8_w_4_34_store_5@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
|
- ((char *)puVar3)[0x5] = E;
+ ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_8_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x5)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
|
- *(char *)((byte *)puVar3 + 0x5)
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
|
- ((char *)puVar3)[0x5]
+ (char)((uw_object_hdr_t *)puVar3)->chain_word_high
)
...>
}


@receiver_8_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x6) = (char)V;
- *(char *)((char *)puVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar3 + 0x6) = (char)V;
- *(byte *)((char *)puVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x6) = (byte)V;
- *(char *)((char *)puVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar3 + 0x6) = (byte)V;
- *(byte *)((char *)puVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar3)->link_word = (ushort)V;

...>
}

@receiver_8_w_6_51_word_ushort@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(ushort *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@receiver_8_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((undefined2 *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- *(undefined2 *)((undefined2 *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}


@receiver_8_w_6_51_word_short@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- ((short *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
|
- *(short *)((short *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_signed
)
...>
}


@receiver_8_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((byte *)puVar3)[0x6]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(byte *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (byte)((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_8_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)((byte *)puVar3 + 0x6)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((undefined1 *)puVar3)[0x6]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(undefined1 *)((ushort *)puVar3 + 0x3)
+ ((uw_object_hdr_t *)puVar3)->link_word_low
|
- (undefined1)((ushort *)puVar3)[0x3]
+ ((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_8_w_6_51_address_6@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)((byte *)puVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &((char *)puVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
|
- &*(char *)((ushort *)puVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_8_w_6_51_store_6@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- ((char *)puVar3)[0x6] = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_8_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x6)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)((byte *)puVar3 + 0x6)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- ((char *)puVar3)[0x6]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- *(char *)((ushort *)puVar3 + 0x3)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
|
- (char)((ushort *)puVar3)[0x3]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_low
)
...>
}


@receiver_8_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(byte *)((byte *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((byte *)puVar3)[0x7]
+ ((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_8_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(undefined1 *)((byte *)puVar3 + 0x7)
+ ((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((undefined1 *)puVar3)[0x7]
+ ((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_8_w_6_51_address_7@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
|
- &*(char *)((byte *)puVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
|
- &((char *)puVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_8_w_6_51_store_7@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
|
- ((char *)puVar3)[0x7] = E;
+ ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_8_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(spawn_new_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar3 + 0x7)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
|
- *(char *)((byte *)puVar3 + 0x7)
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
|
- ((char *)puVar3)[0x7]
+ (char)((uw_object_hdr_t *)puVar3)->link_word_high
)
...>
}


@receiver_9_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x0) = (char)V;
- *(char *)((char *)discarded + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x0) = (char)V;
- *(byte *)((char *)discarded + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x0) = (byte)V;
- *(char *)((char *)discarded + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x0) = (byte)V;
- *(byte *)((char *)discarded + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->type_flags = (ushort)V;

...>
}

@receiver_9_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(ushort *)((byte *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- ((ushort *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(ushort *)((ushort *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(ushort *)(discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- discarded[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *discarded
+ ((uw_object_hdr_t *)discarded)->type_flags
)
...>
}


@receiver_9_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(undefined2 *)((byte *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- ((undefined2 *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(undefined2 *)((undefined2 *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(undefined2 *)(discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- discarded[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *discarded
+ ((uw_object_hdr_t *)discarded)->type_flags
)
...>
}


@receiver_9_w_0_0_word_short@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_signed
|
- *(short *)((byte *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_signed
|
- ((short *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_signed
|
- *(short *)((short *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_signed
|
- *(short *)(discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_signed
)
...>
}


@receiver_9_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(byte *)((byte *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- ((byte *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(byte *)((ushort *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- (byte)((ushort *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(byte *)discarded
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(byte *)(discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- (byte)discarded[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(undefined1 *)((byte *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- ((undefined1 *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(undefined1 *)((ushort *)discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- (undefined1)((ushort *)discarded)[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(undefined1 *)discarded
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(undefined1 *)(discarded + 0x0)
+ ((uw_object_hdr_t *)discarded)->type_flags_low
|
- (undefined1)discarded[0x0]
+ ((uw_object_hdr_t *)discarded)->type_flags_low
)
...>
}


@receiver_9_w_0_0_address_0@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x0)
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_low
|
- &*(char *)((byte *)discarded + 0x0)
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_low
|
- &((char *)discarded)[0x0]
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_low
|
- &*(char *)((ushort *)discarded + 0x0)
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_low
|
- &*(char *)discarded
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_low
|
- &*(char *)(discarded + 0x0)
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_low
)
...>
}


@receiver_9_w_0_0_store_0@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x0) = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_low = (byte)E;
|
- *(char *)((byte *)discarded + 0x0) = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_low = (byte)E;
|
- ((char *)discarded)[0x0] = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)discarded + 0x0) = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_low = (byte)E;
|
- *(char *)discarded = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_low = (byte)E;
|
- *(char *)(discarded + 0x0) = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_low = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x0)
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(char *)((byte *)discarded + 0x0)
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- ((char *)discarded)[0x0]
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(char *)((ushort *)discarded + 0x0)
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- (char)((ushort *)discarded)[0x0]
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(char *)discarded
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- *(char *)(discarded + 0x0)
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
|
- (char)discarded[0x0]
+ (char)((uw_object_hdr_t *)discarded)->type_flags_low
)
...>
}


@receiver_9_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->type_flags_high
|
- *(byte *)((byte *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->type_flags_high
|
- ((byte *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->type_flags_high
)
...>
}


@receiver_9_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->type_flags_high
|
- *(undefined1 *)((byte *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->type_flags_high
|
- ((undefined1 *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->type_flags_high
)
...>
}


@receiver_9_w_0_0_address_1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x1)
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_high
|
- &*(char *)((byte *)discarded + 0x1)
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_high
|
- &((char *)discarded)[0x1]
+ (char *)&((uw_object_hdr_t *)discarded)->type_flags_high
)
...>
}


@receiver_9_w_0_0_store_1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x1) = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_high = (byte)E;
|
- *(char *)((byte *)discarded + 0x1) = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_high = (byte)E;
|
- ((char *)discarded)[0x1] = E;
+ ((uw_object_hdr_t *)discarded)->type_flags_high = (byte)E;
)
...>
}


@receiver_9_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x1)
+ (char)((uw_object_hdr_t *)discarded)->type_flags_high
|
- *(char *)((byte *)discarded + 0x1)
+ (char)((uw_object_hdr_t *)discarded)->type_flags_high
|
- ((char *)discarded)[0x1]
+ (char)((uw_object_hdr_t *)discarded)->type_flags_high
)
...>
}


@receiver_9_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x2) = (char)V;
- *(char *)((char *)discarded + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x2) = (char)V;
- *(byte *)((char *)discarded + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x2) = (byte)V;
- *(char *)((char *)discarded + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x2) = (byte)V;
- *(byte *)((char *)discarded + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->position_word = (ushort)V;

...>
}

@receiver_9_w_2_17_word_ushort@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- *(ushort *)((byte *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- ((ushort *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word
|
- *(ushort *)((ushort *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- *(ushort *)(discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- discarded[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word
)
...>
}


@receiver_9_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- *(undefined2 *)((byte *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- ((undefined2 *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word
|
- *(undefined2 *)((undefined2 *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- *(undefined2 *)(discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- discarded[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word
)
...>
}


@receiver_9_w_2_17_word_short@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word_signed
|
- *(short *)((byte *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word_signed
|
- ((short *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word_signed
|
- *(short *)((short *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word_signed
|
- *(short *)(discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word_signed
)
...>
}


@receiver_9_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- *(byte *)((byte *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- ((byte *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- *(byte *)((ushort *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- (byte)((ushort *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- *(byte *)(discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- (byte)discarded[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- *(undefined1 *)((byte *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- ((undefined1 *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- *(undefined1 *)((ushort *)discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- (undefined1)((ushort *)discarded)[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- *(undefined1 *)(discarded + 0x1)
+ ((uw_object_hdr_t *)discarded)->position_word_low
|
- (undefined1)discarded[0x1]
+ ((uw_object_hdr_t *)discarded)->position_word_low
)
...>
}


@receiver_9_w_2_17_address_2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x2)
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_low
|
- &*(char *)((byte *)discarded + 0x2)
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_low
|
- &((char *)discarded)[0x2]
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_low
|
- &*(char *)((ushort *)discarded + 0x1)
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_low
|
- &*(char *)(discarded + 0x1)
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_low
)
...>
}


@receiver_9_w_2_17_store_2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x2) = E;
+ ((uw_object_hdr_t *)discarded)->position_word_low = (byte)E;
|
- *(char *)((byte *)discarded + 0x2) = E;
+ ((uw_object_hdr_t *)discarded)->position_word_low = (byte)E;
|
- ((char *)discarded)[0x2] = E;
+ ((uw_object_hdr_t *)discarded)->position_word_low = (byte)E;
|
- *(char *)((ushort *)discarded + 0x1) = E;
+ ((uw_object_hdr_t *)discarded)->position_word_low = (byte)E;
|
- *(char *)(discarded + 0x1) = E;
+ ((uw_object_hdr_t *)discarded)->position_word_low = (byte)E;
)
...>
}


@receiver_9_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x2)
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
|
- *(char *)((byte *)discarded + 0x2)
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
|
- ((char *)discarded)[0x2]
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
|
- *(char *)((ushort *)discarded + 0x1)
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
|
- (char)((ushort *)discarded)[0x1]
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
|
- *(char *)(discarded + 0x1)
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
|
- (char)discarded[0x1]
+ (char)((uw_object_hdr_t *)discarded)->position_word_low
)
...>
}


@receiver_9_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->position_word_high
|
- *(byte *)((byte *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->position_word_high
|
- ((byte *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->position_word_high
)
...>
}


@receiver_9_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->position_word_high
|
- *(undefined1 *)((byte *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->position_word_high
|
- ((undefined1 *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->position_word_high
)
...>
}


@receiver_9_w_2_17_address_3@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x3)
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_high
|
- &*(char *)((byte *)discarded + 0x3)
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_high
|
- &((char *)discarded)[0x3]
+ (char *)&((uw_object_hdr_t *)discarded)->position_word_high
)
...>
}


@receiver_9_w_2_17_store_3@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x3) = E;
+ ((uw_object_hdr_t *)discarded)->position_word_high = (byte)E;
|
- *(char *)((byte *)discarded + 0x3) = E;
+ ((uw_object_hdr_t *)discarded)->position_word_high = (byte)E;
|
- ((char *)discarded)[0x3] = E;
+ ((uw_object_hdr_t *)discarded)->position_word_high = (byte)E;
)
...>
}


@receiver_9_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x3)
+ (char)((uw_object_hdr_t *)discarded)->position_word_high
|
- *(char *)((byte *)discarded + 0x3)
+ (char)((uw_object_hdr_t *)discarded)->position_word_high
|
- ((char *)discarded)[0x3]
+ (char)((uw_object_hdr_t *)discarded)->position_word_high
)
...>
}


@receiver_9_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x4) = (char)V;
- *(char *)((char *)discarded + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x4) = (char)V;
- *(byte *)((char *)discarded + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x4) = (byte)V;
- *(char *)((char *)discarded + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x4) = (byte)V;
- *(byte *)((char *)discarded + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->chain_word = (ushort)V;

...>
}

@receiver_9_w_4_34_word_ushort@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- *(ushort *)((byte *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- ((ushort *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- *(ushort *)((ushort *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- *(ushort *)(discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- discarded[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word
)
...>
}


@receiver_9_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- *(undefined2 *)((byte *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- ((undefined2 *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- *(undefined2 *)((undefined2 *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- *(undefined2 *)(discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- discarded[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word
)
...>
}


@receiver_9_w_4_34_word_short@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word_signed
|
- *(short *)((byte *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word_signed
|
- ((short *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word_signed
|
- *(short *)((short *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word_signed
|
- *(short *)(discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word_signed
)
...>
}


@receiver_9_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(byte *)((byte *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- ((byte *)discarded)[0x4]
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(byte *)((ushort *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- (byte)((ushort *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(byte *)(discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- (byte)discarded[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(undefined1 *)((byte *)discarded + 0x4)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- ((undefined1 *)discarded)[0x4]
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(undefined1 *)((ushort *)discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- (undefined1)((ushort *)discarded)[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(undefined1 *)(discarded + 0x2)
+ ((uw_object_hdr_t *)discarded)->chain_word_low
|
- (undefined1)discarded[0x2]
+ ((uw_object_hdr_t *)discarded)->chain_word_low
)
...>
}


@receiver_9_w_4_34_address_4@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x4)
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_low
|
- &*(char *)((byte *)discarded + 0x4)
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_low
|
- &((char *)discarded)[0x4]
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_low
|
- &*(char *)((ushort *)discarded + 0x2)
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_low
|
- &*(char *)(discarded + 0x2)
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_low
)
...>
}


@receiver_9_w_4_34_store_4@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x4) = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_low = (byte)E;
|
- *(char *)((byte *)discarded + 0x4) = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_low = (byte)E;
|
- ((char *)discarded)[0x4] = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)discarded + 0x2) = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_low = (byte)E;
|
- *(char *)(discarded + 0x2) = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_low = (byte)E;
)
...>
}


@receiver_9_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x4)
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(char *)((byte *)discarded + 0x4)
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
|
- ((char *)discarded)[0x4]
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(char *)((ushort *)discarded + 0x2)
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
|
- (char)((ushort *)discarded)[0x2]
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
|
- *(char *)(discarded + 0x2)
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
|
- (char)discarded[0x2]
+ (char)((uw_object_hdr_t *)discarded)->chain_word_low
)
...>
}


@receiver_9_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x5)
+ ((uw_object_hdr_t *)discarded)->chain_word_high
|
- *(byte *)((byte *)discarded + 0x5)
+ ((uw_object_hdr_t *)discarded)->chain_word_high
|
- ((byte *)discarded)[0x5]
+ ((uw_object_hdr_t *)discarded)->chain_word_high
)
...>
}


@receiver_9_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x5)
+ ((uw_object_hdr_t *)discarded)->chain_word_high
|
- *(undefined1 *)((byte *)discarded + 0x5)
+ ((uw_object_hdr_t *)discarded)->chain_word_high
|
- ((undefined1 *)discarded)[0x5]
+ ((uw_object_hdr_t *)discarded)->chain_word_high
)
...>
}


@receiver_9_w_4_34_address_5@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x5)
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_high
|
- &*(char *)((byte *)discarded + 0x5)
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_high
|
- &((char *)discarded)[0x5]
+ (char *)&((uw_object_hdr_t *)discarded)->chain_word_high
)
...>
}


@receiver_9_w_4_34_store_5@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x5) = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_high = (byte)E;
|
- *(char *)((byte *)discarded + 0x5) = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_high = (byte)E;
|
- ((char *)discarded)[0x5] = E;
+ ((uw_object_hdr_t *)discarded)->chain_word_high = (byte)E;
)
...>
}


@receiver_9_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x5)
+ (char)((uw_object_hdr_t *)discarded)->chain_word_high
|
- *(char *)((byte *)discarded + 0x5)
+ (char)((uw_object_hdr_t *)discarded)->chain_word_high
|
- ((char *)discarded)[0x5]
+ (char)((uw_object_hdr_t *)discarded)->chain_word_high
)
...>
}


@receiver_9_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x6) = (char)V;
- *(char *)((char *)discarded + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)discarded + 0x6) = (char)V;
- *(byte *)((char *)discarded + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x6) = (byte)V;
- *(char *)((char *)discarded + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)discarded + 0x6) = (byte)V;
- *(byte *)((char *)discarded + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)discarded)->link_word = (ushort)V;

...>
}

@receiver_9_w_6_51_word_ushort@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- *(ushort *)((byte *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- ((ushort *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word
|
- *(ushort *)((ushort *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- *(ushort *)(discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- discarded[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word
)
...>
}


@receiver_9_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- *(undefined2 *)((byte *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- ((undefined2 *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word
|
- *(undefined2 *)((undefined2 *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- *(undefined2 *)(discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- discarded[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word
)
...>
}


@receiver_9_w_6_51_word_short@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word_signed
|
- *(short *)((byte *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word_signed
|
- ((short *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word_signed
|
- *(short *)((short *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word_signed
|
- *(short *)(discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word_signed
)
...>
}


@receiver_9_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- *(byte *)((byte *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- ((byte *)discarded)[0x6]
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- *(byte *)((ushort *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- (byte)((ushort *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- *(byte *)(discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- (byte)discarded[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- *(undefined1 *)((byte *)discarded + 0x6)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- ((undefined1 *)discarded)[0x6]
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- *(undefined1 *)((ushort *)discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- (undefined1)((ushort *)discarded)[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- *(undefined1 *)(discarded + 0x3)
+ ((uw_object_hdr_t *)discarded)->link_word_low
|
- (undefined1)discarded[0x3]
+ ((uw_object_hdr_t *)discarded)->link_word_low
)
...>
}


@receiver_9_w_6_51_address_6@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x6)
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_low
|
- &*(char *)((byte *)discarded + 0x6)
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_low
|
- &((char *)discarded)[0x6]
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_low
|
- &*(char *)((ushort *)discarded + 0x3)
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_low
|
- &*(char *)(discarded + 0x3)
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_low
)
...>
}


@receiver_9_w_6_51_store_6@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x6) = E;
+ ((uw_object_hdr_t *)discarded)->link_word_low = (byte)E;
|
- *(char *)((byte *)discarded + 0x6) = E;
+ ((uw_object_hdr_t *)discarded)->link_word_low = (byte)E;
|
- ((char *)discarded)[0x6] = E;
+ ((uw_object_hdr_t *)discarded)->link_word_low = (byte)E;
|
- *(char *)((ushort *)discarded + 0x3) = E;
+ ((uw_object_hdr_t *)discarded)->link_word_low = (byte)E;
|
- *(char *)(discarded + 0x3) = E;
+ ((uw_object_hdr_t *)discarded)->link_word_low = (byte)E;
)
...>
}


@receiver_9_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x6)
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
|
- *(char *)((byte *)discarded + 0x6)
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
|
- ((char *)discarded)[0x6]
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
|
- *(char *)((ushort *)discarded + 0x3)
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
|
- (char)((ushort *)discarded)[0x3]
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
|
- *(char *)(discarded + 0x3)
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
|
- (char)discarded[0x3]
+ (char)((uw_object_hdr_t *)discarded)->link_word_low
)
...>
}


@receiver_9_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)discarded + 0x7)
+ ((uw_object_hdr_t *)discarded)->link_word_high
|
- *(byte *)((byte *)discarded + 0x7)
+ ((uw_object_hdr_t *)discarded)->link_word_high
|
- ((byte *)discarded)[0x7]
+ ((uw_object_hdr_t *)discarded)->link_word_high
)
...>
}


@receiver_9_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)discarded + 0x7)
+ ((uw_object_hdr_t *)discarded)->link_word_high
|
- *(undefined1 *)((byte *)discarded + 0x7)
+ ((uw_object_hdr_t *)discarded)->link_word_high
|
- ((undefined1 *)discarded)[0x7]
+ ((uw_object_hdr_t *)discarded)->link_word_high
)
...>
}


@receiver_9_w_6_51_address_7@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)discarded + 0x7)
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_high
|
- &*(char *)((byte *)discarded + 0x7)
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_high
|
- &((char *)discarded)[0x7]
+ (char *)&((uw_object_hdr_t *)discarded)->link_word_high
)
...>
}


@receiver_9_w_6_51_store_7@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x7) = E;
+ ((uw_object_hdr_t *)discarded)->link_word_high = (byte)E;
|
- *(char *)((byte *)discarded + 0x7) = E;
+ ((uw_object_hdr_t *)discarded)->link_word_high = (byte)E;
|
- ((char *)discarded)[0x7] = E;
+ ((uw_object_hdr_t *)discarded)->link_word_high = (byte)E;
)
...>
}


@receiver_9_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)discarded + 0x7)
+ (char)((uw_object_hdr_t *)discarded)->link_word_high
|
- *(char *)((byte *)discarded + 0x7)
+ (char)((uw_object_hdr_t *)discarded)->link_word_high
|
- ((char *)discarded)[0x7]
+ (char)((uw_object_hdr_t *)discarded)->link_word_high
)
...>
}


@receiver_10_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x0) = (char)V;
- *(char *)((char *)settled + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x0) = (char)V;
- *(byte *)((char *)settled + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x0) = (byte)V;
- *(char *)((char *)settled + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x0) = (byte)V;
- *(byte *)((char *)settled + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->type_flags = (ushort)V;

...>
}

@receiver_10_w_0_0_word_ushort@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(ushort *)((byte *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- ((ushort *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(ushort *)((ushort *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(ushort *)(settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- settled[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *settled
+ ((uw_object_hdr_t *)settled)->type_flags
)
...>
}


@receiver_10_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(undefined2 *)((byte *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- ((undefined2 *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(undefined2 *)((undefined2 *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(undefined2 *)(settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- settled[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *settled
+ ((uw_object_hdr_t *)settled)->type_flags
)
...>
}


@receiver_10_w_0_0_word_short@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_signed
|
- *(short *)((byte *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_signed
|
- ((short *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_signed
|
- *(short *)((short *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_signed
|
- *(short *)(settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_signed
)
...>
}


@receiver_10_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(byte *)((byte *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- ((byte *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(byte *)((ushort *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- (byte)((ushort *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(byte *)settled
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(byte *)(settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- (byte)settled[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(undefined1 *)((byte *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- ((undefined1 *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(undefined1 *)((ushort *)settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- (undefined1)((ushort *)settled)[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(undefined1 *)settled
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- *(undefined1 *)(settled + 0x0)
+ ((uw_object_hdr_t *)settled)->type_flags_low
|
- (undefined1)settled[0x0]
+ ((uw_object_hdr_t *)settled)->type_flags_low
)
...>
}


@receiver_10_w_0_0_address_0@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x0)
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_low
|
- &*(char *)((byte *)settled + 0x0)
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_low
|
- &((char *)settled)[0x0]
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_low
|
- &*(char *)((ushort *)settled + 0x0)
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_low
|
- &*(char *)settled
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_low
|
- &*(char *)(settled + 0x0)
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_low
)
...>
}


@receiver_10_w_0_0_store_0@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x0) = E;
+ ((uw_object_hdr_t *)settled)->type_flags_low = (byte)E;
|
- *(char *)((byte *)settled + 0x0) = E;
+ ((uw_object_hdr_t *)settled)->type_flags_low = (byte)E;
|
- ((char *)settled)[0x0] = E;
+ ((uw_object_hdr_t *)settled)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)settled + 0x0) = E;
+ ((uw_object_hdr_t *)settled)->type_flags_low = (byte)E;
|
- *(char *)settled = E;
+ ((uw_object_hdr_t *)settled)->type_flags_low = (byte)E;
|
- *(char *)(settled + 0x0) = E;
+ ((uw_object_hdr_t *)settled)->type_flags_low = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x0)
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- *(char *)((byte *)settled + 0x0)
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- ((char *)settled)[0x0]
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- *(char *)((ushort *)settled + 0x0)
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- (char)((ushort *)settled)[0x0]
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- *(char *)settled
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- *(char *)(settled + 0x0)
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
|
- (char)settled[0x0]
+ (char)((uw_object_hdr_t *)settled)->type_flags_low
)
...>
}


@receiver_10_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->type_flags_high
|
- *(byte *)((byte *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->type_flags_high
|
- ((byte *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->type_flags_high
)
...>
}


@receiver_10_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->type_flags_high
|
- *(undefined1 *)((byte *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->type_flags_high
|
- ((undefined1 *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->type_flags_high
)
...>
}


@receiver_10_w_0_0_address_1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x1)
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_high
|
- &*(char *)((byte *)settled + 0x1)
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_high
|
- &((char *)settled)[0x1]
+ (char *)&((uw_object_hdr_t *)settled)->type_flags_high
)
...>
}


@receiver_10_w_0_0_store_1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x1) = E;
+ ((uw_object_hdr_t *)settled)->type_flags_high = (byte)E;
|
- *(char *)((byte *)settled + 0x1) = E;
+ ((uw_object_hdr_t *)settled)->type_flags_high = (byte)E;
|
- ((char *)settled)[0x1] = E;
+ ((uw_object_hdr_t *)settled)->type_flags_high = (byte)E;
)
...>
}


@receiver_10_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x1)
+ (char)((uw_object_hdr_t *)settled)->type_flags_high
|
- *(char *)((byte *)settled + 0x1)
+ (char)((uw_object_hdr_t *)settled)->type_flags_high
|
- ((char *)settled)[0x1]
+ (char)((uw_object_hdr_t *)settled)->type_flags_high
)
...>
}


@receiver_10_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x2) = (char)V;
- *(char *)((char *)settled + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x2) = (char)V;
- *(byte *)((char *)settled + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x2) = (byte)V;
- *(char *)((char *)settled + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x2) = (byte)V;
- *(byte *)((char *)settled + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->position_word = (ushort)V;

...>
}

@receiver_10_w_2_17_word_ushort@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word
|
- *(ushort *)((byte *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word
|
- ((ushort *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->position_word
|
- *(ushort *)((ushort *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word
|
- *(ushort *)(settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word
|
- settled[0x1]
+ ((uw_object_hdr_t *)settled)->position_word
)
...>
}


@receiver_10_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word
|
- *(undefined2 *)((byte *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word
|
- ((undefined2 *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->position_word
|
- *(undefined2 *)((undefined2 *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word
|
- *(undefined2 *)(settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word
|
- settled[0x1]
+ ((uw_object_hdr_t *)settled)->position_word
)
...>
}


@receiver_10_w_2_17_word_short@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word_signed
|
- *(short *)((byte *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word_signed
|
- ((short *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->position_word_signed
|
- *(short *)((short *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word_signed
|
- *(short *)(settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word_signed
)
...>
}


@receiver_10_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- *(byte *)((byte *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- ((byte *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- *(byte *)((ushort *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- (byte)((ushort *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- *(byte *)(settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- (byte)settled[0x1]
+ ((uw_object_hdr_t *)settled)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- *(undefined1 *)((byte *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- ((undefined1 *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- *(undefined1 *)((ushort *)settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- (undefined1)((ushort *)settled)[0x1]
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- *(undefined1 *)(settled + 0x1)
+ ((uw_object_hdr_t *)settled)->position_word_low
|
- (undefined1)settled[0x1]
+ ((uw_object_hdr_t *)settled)->position_word_low
)
...>
}


@receiver_10_w_2_17_address_2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x2)
+ (char *)&((uw_object_hdr_t *)settled)->position_word_low
|
- &*(char *)((byte *)settled + 0x2)
+ (char *)&((uw_object_hdr_t *)settled)->position_word_low
|
- &((char *)settled)[0x2]
+ (char *)&((uw_object_hdr_t *)settled)->position_word_low
|
- &*(char *)((ushort *)settled + 0x1)
+ (char *)&((uw_object_hdr_t *)settled)->position_word_low
|
- &*(char *)(settled + 0x1)
+ (char *)&((uw_object_hdr_t *)settled)->position_word_low
)
...>
}


@receiver_10_w_2_17_store_2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x2) = E;
+ ((uw_object_hdr_t *)settled)->position_word_low = (byte)E;
|
- *(char *)((byte *)settled + 0x2) = E;
+ ((uw_object_hdr_t *)settled)->position_word_low = (byte)E;
|
- ((char *)settled)[0x2] = E;
+ ((uw_object_hdr_t *)settled)->position_word_low = (byte)E;
|
- *(char *)((ushort *)settled + 0x1) = E;
+ ((uw_object_hdr_t *)settled)->position_word_low = (byte)E;
|
- *(char *)(settled + 0x1) = E;
+ ((uw_object_hdr_t *)settled)->position_word_low = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x2)
+ (char)((uw_object_hdr_t *)settled)->position_word_low
|
- *(char *)((byte *)settled + 0x2)
+ (char)((uw_object_hdr_t *)settled)->position_word_low
|
- ((char *)settled)[0x2]
+ (char)((uw_object_hdr_t *)settled)->position_word_low
|
- *(char *)((ushort *)settled + 0x1)
+ (char)((uw_object_hdr_t *)settled)->position_word_low
|
- (char)((ushort *)settled)[0x1]
+ (char)((uw_object_hdr_t *)settled)->position_word_low
|
- *(char *)(settled + 0x1)
+ (char)((uw_object_hdr_t *)settled)->position_word_low
|
- (char)settled[0x1]
+ (char)((uw_object_hdr_t *)settled)->position_word_low
)
...>
}


@receiver_10_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->position_word_high
|
- *(byte *)((byte *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->position_word_high
|
- ((byte *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->position_word_high
)
...>
}


@receiver_10_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->position_word_high
|
- *(undefined1 *)((byte *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->position_word_high
|
- ((undefined1 *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->position_word_high
)
...>
}


@receiver_10_w_2_17_address_3@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x3)
+ (char *)&((uw_object_hdr_t *)settled)->position_word_high
|
- &*(char *)((byte *)settled + 0x3)
+ (char *)&((uw_object_hdr_t *)settled)->position_word_high
|
- &((char *)settled)[0x3]
+ (char *)&((uw_object_hdr_t *)settled)->position_word_high
)
...>
}


@receiver_10_w_2_17_store_3@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x3) = E;
+ ((uw_object_hdr_t *)settled)->position_word_high = (byte)E;
|
- *(char *)((byte *)settled + 0x3) = E;
+ ((uw_object_hdr_t *)settled)->position_word_high = (byte)E;
|
- ((char *)settled)[0x3] = E;
+ ((uw_object_hdr_t *)settled)->position_word_high = (byte)E;
)
...>
}


@receiver_10_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x3)
+ (char)((uw_object_hdr_t *)settled)->position_word_high
|
- *(char *)((byte *)settled + 0x3)
+ (char)((uw_object_hdr_t *)settled)->position_word_high
|
- ((char *)settled)[0x3]
+ (char)((uw_object_hdr_t *)settled)->position_word_high
)
...>
}


@receiver_10_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x4) = (char)V;
- *(char *)((char *)settled + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x4) = (char)V;
- *(byte *)((char *)settled + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x4) = (byte)V;
- *(char *)((char *)settled + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x4) = (byte)V;
- *(byte *)((char *)settled + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->chain_word = (ushort)V;

...>
}

@receiver_10_w_4_34_word_ushort@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- *(ushort *)((byte *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- ((ushort *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word
|
- *(ushort *)((ushort *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- *(ushort *)(settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- settled[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word
)
...>
}


@receiver_10_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- *(undefined2 *)((byte *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- ((undefined2 *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word
|
- *(undefined2 *)((undefined2 *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- *(undefined2 *)(settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- settled[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word
)
...>
}


@receiver_10_w_4_34_word_short@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word_signed
|
- *(short *)((byte *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word_signed
|
- ((short *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word_signed
|
- *(short *)((short *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word_signed
|
- *(short *)(settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word_signed
)
...>
}


@receiver_10_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- *(byte *)((byte *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- ((byte *)settled)[0x4]
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- *(byte *)((ushort *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- (byte)((ushort *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- *(byte *)(settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- (byte)settled[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- *(undefined1 *)((byte *)settled + 0x4)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- ((undefined1 *)settled)[0x4]
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- *(undefined1 *)((ushort *)settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- (undefined1)((ushort *)settled)[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- *(undefined1 *)(settled + 0x2)
+ ((uw_object_hdr_t *)settled)->chain_word_low
|
- (undefined1)settled[0x2]
+ ((uw_object_hdr_t *)settled)->chain_word_low
)
...>
}


@receiver_10_w_4_34_address_4@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x4)
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_low
|
- &*(char *)((byte *)settled + 0x4)
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_low
|
- &((char *)settled)[0x4]
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_low
|
- &*(char *)((ushort *)settled + 0x2)
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_low
|
- &*(char *)(settled + 0x2)
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_low
)
...>
}


@receiver_10_w_4_34_store_4@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x4) = E;
+ ((uw_object_hdr_t *)settled)->chain_word_low = (byte)E;
|
- *(char *)((byte *)settled + 0x4) = E;
+ ((uw_object_hdr_t *)settled)->chain_word_low = (byte)E;
|
- ((char *)settled)[0x4] = E;
+ ((uw_object_hdr_t *)settled)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)settled + 0x2) = E;
+ ((uw_object_hdr_t *)settled)->chain_word_low = (byte)E;
|
- *(char *)(settled + 0x2) = E;
+ ((uw_object_hdr_t *)settled)->chain_word_low = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x4)
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
|
- *(char *)((byte *)settled + 0x4)
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
|
- ((char *)settled)[0x4]
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
|
- *(char *)((ushort *)settled + 0x2)
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
|
- (char)((ushort *)settled)[0x2]
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
|
- *(char *)(settled + 0x2)
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
|
- (char)settled[0x2]
+ (char)((uw_object_hdr_t *)settled)->chain_word_low
)
...>
}


@receiver_10_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x5)
+ ((uw_object_hdr_t *)settled)->chain_word_high
|
- *(byte *)((byte *)settled + 0x5)
+ ((uw_object_hdr_t *)settled)->chain_word_high
|
- ((byte *)settled)[0x5]
+ ((uw_object_hdr_t *)settled)->chain_word_high
)
...>
}


@receiver_10_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x5)
+ ((uw_object_hdr_t *)settled)->chain_word_high
|
- *(undefined1 *)((byte *)settled + 0x5)
+ ((uw_object_hdr_t *)settled)->chain_word_high
|
- ((undefined1 *)settled)[0x5]
+ ((uw_object_hdr_t *)settled)->chain_word_high
)
...>
}


@receiver_10_w_4_34_address_5@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x5)
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_high
|
- &*(char *)((byte *)settled + 0x5)
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_high
|
- &((char *)settled)[0x5]
+ (char *)&((uw_object_hdr_t *)settled)->chain_word_high
)
...>
}


@receiver_10_w_4_34_store_5@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x5) = E;
+ ((uw_object_hdr_t *)settled)->chain_word_high = (byte)E;
|
- *(char *)((byte *)settled + 0x5) = E;
+ ((uw_object_hdr_t *)settled)->chain_word_high = (byte)E;
|
- ((char *)settled)[0x5] = E;
+ ((uw_object_hdr_t *)settled)->chain_word_high = (byte)E;
)
...>
}


@receiver_10_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x5)
+ (char)((uw_object_hdr_t *)settled)->chain_word_high
|
- *(char *)((byte *)settled + 0x5)
+ (char)((uw_object_hdr_t *)settled)->chain_word_high
|
- ((char *)settled)[0x5]
+ (char)((uw_object_hdr_t *)settled)->chain_word_high
)
...>
}


@receiver_10_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x6) = (char)V;
- *(char *)((char *)settled + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)settled + 0x6) = (char)V;
- *(byte *)((char *)settled + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x6) = (byte)V;
- *(char *)((char *)settled + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)settled)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)settled + 0x6) = (byte)V;
- *(byte *)((char *)settled + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)settled)->link_word = (ushort)V;

...>
}

@receiver_10_w_6_51_word_ushort@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word
|
- *(ushort *)((byte *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word
|
- ((ushort *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->link_word
|
- *(ushort *)((ushort *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word
|
- *(ushort *)(settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word
|
- settled[0x3]
+ ((uw_object_hdr_t *)settled)->link_word
)
...>
}


@receiver_10_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word
|
- *(undefined2 *)((byte *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word
|
- ((undefined2 *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->link_word
|
- *(undefined2 *)((undefined2 *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word
|
- *(undefined2 *)(settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word
|
- settled[0x3]
+ ((uw_object_hdr_t *)settled)->link_word
)
...>
}


@receiver_10_w_6_51_word_short@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word_signed
|
- *(short *)((byte *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word_signed
|
- ((short *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->link_word_signed
|
- *(short *)((short *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word_signed
|
- *(short *)(settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word_signed
)
...>
}


@receiver_10_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- *(byte *)((byte *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- ((byte *)settled)[0x6]
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- *(byte *)((ushort *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- (byte)((ushort *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- *(byte *)(settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- (byte)settled[0x3]
+ ((uw_object_hdr_t *)settled)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- *(undefined1 *)((byte *)settled + 0x6)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- ((undefined1 *)settled)[0x6]
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- *(undefined1 *)((ushort *)settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- (undefined1)((ushort *)settled)[0x3]
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- *(undefined1 *)(settled + 0x3)
+ ((uw_object_hdr_t *)settled)->link_word_low
|
- (undefined1)settled[0x3]
+ ((uw_object_hdr_t *)settled)->link_word_low
)
...>
}


@receiver_10_w_6_51_address_6@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x6)
+ (char *)&((uw_object_hdr_t *)settled)->link_word_low
|
- &*(char *)((byte *)settled + 0x6)
+ (char *)&((uw_object_hdr_t *)settled)->link_word_low
|
- &((char *)settled)[0x6]
+ (char *)&((uw_object_hdr_t *)settled)->link_word_low
|
- &*(char *)((ushort *)settled + 0x3)
+ (char *)&((uw_object_hdr_t *)settled)->link_word_low
|
- &*(char *)(settled + 0x3)
+ (char *)&((uw_object_hdr_t *)settled)->link_word_low
)
...>
}


@receiver_10_w_6_51_store_6@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x6) = E;
+ ((uw_object_hdr_t *)settled)->link_word_low = (byte)E;
|
- *(char *)((byte *)settled + 0x6) = E;
+ ((uw_object_hdr_t *)settled)->link_word_low = (byte)E;
|
- ((char *)settled)[0x6] = E;
+ ((uw_object_hdr_t *)settled)->link_word_low = (byte)E;
|
- *(char *)((ushort *)settled + 0x3) = E;
+ ((uw_object_hdr_t *)settled)->link_word_low = (byte)E;
|
- *(char *)(settled + 0x3) = E;
+ ((uw_object_hdr_t *)settled)->link_word_low = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x6)
+ (char)((uw_object_hdr_t *)settled)->link_word_low
|
- *(char *)((byte *)settled + 0x6)
+ (char)((uw_object_hdr_t *)settled)->link_word_low
|
- ((char *)settled)[0x6]
+ (char)((uw_object_hdr_t *)settled)->link_word_low
|
- *(char *)((ushort *)settled + 0x3)
+ (char)((uw_object_hdr_t *)settled)->link_word_low
|
- (char)((ushort *)settled)[0x3]
+ (char)((uw_object_hdr_t *)settled)->link_word_low
|
- *(char *)(settled + 0x3)
+ (char)((uw_object_hdr_t *)settled)->link_word_low
|
- (char)settled[0x3]
+ (char)((uw_object_hdr_t *)settled)->link_word_low
)
...>
}


@receiver_10_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)settled + 0x7)
+ ((uw_object_hdr_t *)settled)->link_word_high
|
- *(byte *)((byte *)settled + 0x7)
+ ((uw_object_hdr_t *)settled)->link_word_high
|
- ((byte *)settled)[0x7]
+ ((uw_object_hdr_t *)settled)->link_word_high
)
...>
}


@receiver_10_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)settled + 0x7)
+ ((uw_object_hdr_t *)settled)->link_word_high
|
- *(undefined1 *)((byte *)settled + 0x7)
+ ((uw_object_hdr_t *)settled)->link_word_high
|
- ((undefined1 *)settled)[0x7]
+ ((uw_object_hdr_t *)settled)->link_word_high
)
...>
}


@receiver_10_w_6_51_address_7@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)settled + 0x7)
+ (char *)&((uw_object_hdr_t *)settled)->link_word_high
|
- &*(char *)((byte *)settled + 0x7)
+ (char *)&((uw_object_hdr_t *)settled)->link_word_high
|
- &((char *)settled)[0x7]
+ (char *)&((uw_object_hdr_t *)settled)->link_word_high
)
...>
}


@receiver_10_w_6_51_store_7@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x7) = E;
+ ((uw_object_hdr_t *)settled)->link_word_high = (byte)E;
|
- *(char *)((byte *)settled + 0x7) = E;
+ ((uw_object_hdr_t *)settled)->link_word_high = (byte)E;
|
- ((char *)settled)[0x7] = E;
+ ((uw_object_hdr_t *)settled)->link_word_high = (byte)E;
)
...>
}


@receiver_10_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)settled + 0x7)
+ (char)((uw_object_hdr_t *)settled)->link_word_high
|
- *(char *)((byte *)settled + 0x7)
+ (char)((uw_object_hdr_t *)settled)->link_word_high
|
- ((char *)settled)[0x7]
+ (char)((uw_object_hdr_t *)settled)->link_word_high
)
...>
}


@receiver_11_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x0) = (char)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(char *)((char *)object + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x0) = (byte)V;
- *(byte *)((char *)object + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->type_flags = (ushort)V;

...>
}

@receiver_11_w_0_0_word_ushort@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_11_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((undefined2 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)((undefined2 *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(undefined2 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}


@receiver_11_w_0_0_word_short@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- ((short *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)((short *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
|
- *(short *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_signed
)
...>
}


@receiver_11_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((byte *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(byte *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (byte)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((byte *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- ((undefined1 *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)((ushort *)object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)((ushort *)object)[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)object
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- *(undefined1 *)(object + 0x0)
+ ((uw_object_hdr_t *)object)->type_flags_low
|
- (undefined1)object[0x0]
+ ((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_11_w_0_0_address_0@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((byte *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &((char *)object)[0x0]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)((ushort *)object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)object
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
|
- &*(char *)(object + 0x0)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_11_w_0_0_store_0@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((byte *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- ((char *)object)[0x0] = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)object = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
|
- *(char *)(object + 0x0) = E;
+ ((uw_object_hdr_t *)object)->type_flags_low = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((byte *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- ((char *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)((ushort *)object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)((ushort *)object)[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)object
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- *(char *)(object + 0x0)
+ (char)((uw_object_hdr_t *)object)->type_flags_low
|
- (char)object[0x0]
+ (char)((uw_object_hdr_t *)object)->type_flags_low
)
...>
}


@receiver_11_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(byte *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((byte *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_11_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- *(undefined1 *)((byte *)object + 0x1)
+ ((uw_object_hdr_t *)object)->type_flags_high
|
- ((undefined1 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_11_w_0_0_address_1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &*(char *)((byte *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
|
- &((char *)object)[0x1]
+ (char *)&((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_11_w_0_0_store_1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- *(char *)((byte *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
|
- ((char *)object)[0x1] = E;
+ ((uw_object_hdr_t *)object)->type_flags_high = (byte)E;
)
...>
}


@receiver_11_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- *(char *)((byte *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->type_flags_high
|
- ((char *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->type_flags_high
)
...>
}


@receiver_11_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x2) = (char)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(char *)((char *)object + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x2) = (byte)V;
- *(byte *)((char *)object + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->position_word = (ushort)V;

...>
}

@receiver_11_w_2_17_word_ushort@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(ushort *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_11_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((undefined2 *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)((undefined2 *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- *(undefined2 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word
|
- object[0x1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}


@receiver_11_w_2_17_word_short@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- ((short *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)((short *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
|
- *(short *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_signed
)
...>
}


@receiver_11_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((byte *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(byte *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (byte)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_11_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((byte *)object + 0x2)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- ((undefined1 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)((ushort *)object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)((ushort *)object)[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
|
- *(undefined1 *)(object + 0x1)
+ ((uw_object_hdr_t *)object)->position_word_low
|
- (undefined1)object[0x1]
+ ((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_11_w_2_17_address_2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((byte *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &((char *)object)[0x2]
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)((ushort *)object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
|
- &*(char *)(object + 0x1)
+ (char *)&((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_11_w_2_17_store_2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- ((char *)object)[0x2] = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
|
- *(char *)(object + 0x1) = E;
+ ((uw_object_hdr_t *)object)->position_word_low = (byte)E;
)
...>
}


@receiver_11_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((byte *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- ((char *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)((ushort *)object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)((ushort *)object)[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- *(char *)(object + 0x1)
+ (char)((uw_object_hdr_t *)object)->position_word_low
|
- (char)object[0x1]
+ (char)((uw_object_hdr_t *)object)->position_word_low
)
...>
}


@receiver_11_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(byte *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((byte *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_11_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- *(undefined1 *)((byte *)object + 0x3)
+ ((uw_object_hdr_t *)object)->position_word_high
|
- ((undefined1 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_11_w_2_17_address_3@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &*(char *)((byte *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
|
- &((char *)object)[0x3]
+ (char *)&((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_11_w_2_17_store_3@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
|
- ((char *)object)[0x3] = E;
+ ((uw_object_hdr_t *)object)->position_word_high = (byte)E;
)
...>
}


@receiver_11_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- *(char *)((byte *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->position_word_high
|
- ((char *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->position_word_high
)
...>
}


@receiver_11_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x4) = (char)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(char *)((char *)object + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x4) = (byte)V;
- *(byte *)((char *)object + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->chain_word = (ushort)V;

...>
}

@receiver_11_w_4_34_word_ushort@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(ushort *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_11_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((undefined2 *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)((undefined2 *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- *(undefined2 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}


@receiver_11_w_4_34_word_short@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- ((short *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)((short *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
|
- *(short *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_signed
)
...>
}


@receiver_11_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((byte *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(byte *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (byte)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_11_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((byte *)object + 0x4)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- ((undefined1 *)object)[0x4]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)((ushort *)object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)((ushort *)object)[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- *(undefined1 *)(object + 0x2)
+ ((uw_object_hdr_t *)object)->chain_word_low
|
- (undefined1)object[0x2]
+ ((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_11_w_4_34_address_4@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((byte *)object + 0x4)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &((char *)object)[0x4]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)((ushort *)object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
|
- &*(char *)(object + 0x2)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_11_w_4_34_store_4@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x4) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- ((char *)object)[0x4] = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
|
- *(char *)(object + 0x2) = E;
+ ((uw_object_hdr_t *)object)->chain_word_low = (byte)E;
)
...>
}


@receiver_11_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((byte *)object + 0x4)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- ((char *)object)[0x4]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)((ushort *)object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)((ushort *)object)[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- *(char *)(object + 0x2)
+ (char)((uw_object_hdr_t *)object)->chain_word_low
|
- (char)object[0x2]
+ (char)((uw_object_hdr_t *)object)->chain_word_low
)
...>
}


@receiver_11_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(byte *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((byte *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_11_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- *(undefined1 *)((byte *)object + 0x5)
+ ((uw_object_hdr_t *)object)->chain_word_high
|
- ((undefined1 *)object)[0x5]
+ ((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_11_w_4_34_address_5@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &*(char *)((byte *)object + 0x5)
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
|
- &((char *)object)[0x5]
+ (char *)&((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_11_w_4_34_store_5@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x5) = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
|
- ((char *)object)[0x5] = E;
+ ((uw_object_hdr_t *)object)->chain_word_high = (byte)E;
)
...>
}


@receiver_11_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- *(char *)((byte *)object + 0x5)
+ (char)((uw_object_hdr_t *)object)->chain_word_high
|
- ((char *)object)[0x5]
+ (char)((uw_object_hdr_t *)object)->chain_word_high
)
...>
}


@receiver_11_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)object + 0x6) = (char)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(char *)((char *)object + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)object + 0x6) = (byte)V;
- *(byte *)((char *)object + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)object)->link_word = (ushort)V;

...>
}

@receiver_11_w_6_51_word_ushort@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(ushort *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_11_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((undefined2 *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)((undefined2 *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- *(undefined2 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word
|
- object[0x3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}


@receiver_11_w_6_51_word_short@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- ((short *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)((short *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
|
- *(short *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_signed
)
...>
}


@receiver_11_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((byte *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(byte *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (byte)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_11_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((byte *)object + 0x6)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- ((undefined1 *)object)[0x6]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)((ushort *)object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)((ushort *)object)[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
|
- *(undefined1 *)(object + 0x3)
+ ((uw_object_hdr_t *)object)->link_word_low
|
- (undefined1)object[0x3]
+ ((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_11_w_6_51_address_6@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((byte *)object + 0x6)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &((char *)object)[0x6]
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)((ushort *)object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
|
- &*(char *)(object + 0x3)
+ (char *)&((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_11_w_6_51_store_6@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((byte *)object + 0x6) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- ((char *)object)[0x6] = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)((ushort *)object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
|
- *(char *)(object + 0x3) = E;
+ ((uw_object_hdr_t *)object)->link_word_low = (byte)E;
)
...>
}


@receiver_11_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((byte *)object + 0x6)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- ((char *)object)[0x6]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)((ushort *)object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)((ushort *)object)[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- *(char *)(object + 0x3)
+ (char)((uw_object_hdr_t *)object)->link_word_low
|
- (char)object[0x3]
+ (char)((uw_object_hdr_t *)object)->link_word_low
)
...>
}


@receiver_11_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(byte *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((byte *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_11_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- *(undefined1 *)((byte *)object + 0x7)
+ ((uw_object_hdr_t *)object)->link_word_high
|
- ((undefined1 *)object)[0x7]
+ ((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_11_w_6_51_address_7@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &*(char *)((byte *)object + 0x7)
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
|
- &((char *)object)[0x7]
+ (char *)&((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_11_w_6_51_store_7@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- *(char *)((byte *)object + 0x7) = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
|
- ((char *)object)[0x7] = E;
+ ((uw_object_hdr_t *)object)->link_word_high = (byte)E;
)
...>
}


@receiver_11_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- *(char *)((byte *)object + 0x7)
+ (char)((uw_object_hdr_t *)object)->link_word_high
|
- ((char *)object)[0x7]
+ (char)((uw_object_hdr_t *)object)->link_word_high
)
...>
}


@receiver_12_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x0) = (char)V;
- *(char *)((char *)contents + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_12_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x0) = (char)V;
- *(byte *)((char *)contents + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_12_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x0) = (byte)V;
- *(char *)((char *)contents + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_12_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x0) = (byte)V;
- *(byte *)((char *)contents + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->type_flags = (ushort)V;

...>
}

@receiver_12_w_0_0_word_ushort@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- ((ushort *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)((ushort *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)(contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
)
...>
}


@receiver_12_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(undefined2 *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- ((undefined2 *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(undefined2 *)((undefined2 *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(undefined2 *)(contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags
)
...>
}


@receiver_12_w_0_0_word_short@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- *(short *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- ((short *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- *(short *)((short *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
|
- *(short *)(contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_signed
)
...>
}


@receiver_12_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- ((byte *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)((ushort *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- (byte)((ushort *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)contents
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(byte *)(contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_12_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)((byte *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- ((undefined1 *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)((ushort *)contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- (undefined1)((ushort *)contents)[0x0]
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)contents
+ ((uw_object_hdr_t *)contents)->type_flags_low
|
- *(undefined1 *)(contents + 0x0)
+ ((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_12_w_0_0_address_0@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x0)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_low
|
- &*(char *)((byte *)contents + 0x0)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_low
|
- &((char *)contents)[0x0]
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_low
|
- &*(char *)((ushort *)contents + 0x0)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_low
|
- &*(char *)contents
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_low
|
- &*(char *)(contents + 0x0)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_12_w_0_0_store_0@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)((byte *)contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- ((char *)contents)[0x0] = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)contents = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
|
- *(char *)(contents + 0x0) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_low = (byte)E;
)
...>
}


@receiver_12_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)((byte *)contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- ((char *)contents)[0x0]
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)((ushort *)contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- (char)((ushort *)contents)[0x0]
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)contents
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
|
- *(char *)(contents + 0x0)
+ (char)((uw_object_hdr_t *)contents)->type_flags_low
)
...>
}


@receiver_12_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- *(byte *)((byte *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- ((byte *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- *(byte *)(contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_12_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- *(undefined1 *)((byte *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- ((undefined1 *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->type_flags_high
|
- *(undefined1 *)(contents + 0x1)
+ ((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_12_w_0_0_address_1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x1)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_high
|
- &*(char *)((byte *)contents + 0x1)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_high
|
- &((char *)contents)[0x1]
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_high
|
- &*(char *)(contents + 0x1)
+ (char *)&((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_12_w_0_0_store_1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
|
- *(char *)((byte *)contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
|
- ((char *)contents)[0x1] = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
|
- *(char *)(contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->type_flags_high = (byte)E;
)
...>
}


@receiver_12_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
|
- *(char *)((byte *)contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
|
- ((char *)contents)[0x1]
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
|
- *(char *)(contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->type_flags_high
)
...>
}


@receiver_12_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x2) = (char)V;
- *(char *)((char *)contents + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_12_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x2) = (char)V;
- *(byte *)((char *)contents + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_12_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x2) = (byte)V;
- *(char *)((char *)contents + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_12_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x2) = (byte)V;
- *(byte *)((char *)contents + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->position_word = (ushort)V;

...>
}

@receiver_12_w_2_17_word_ushort@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(ushort *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- ((ushort *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(ushort *)((ushort *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(ushort *)(contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
)
...>
}


@receiver_12_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(undefined2 *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- ((undefined2 *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(undefined2 *)((undefined2 *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(undefined2 *)(contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word
)
...>
}


@receiver_12_w_2_17_word_short@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- *(short *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- ((short *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- *(short *)((short *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word_signed
|
- *(short *)(contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_signed
)
...>
}


@receiver_12_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(byte *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- ((byte *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(byte *)((ushort *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- (byte)((ushort *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(byte *)(contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_12_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(undefined1 *)((byte *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- ((undefined1 *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(undefined1 *)((ushort *)contents + 0x1)
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- (undefined1)((ushort *)contents)[0x1]
+ ((uw_object_hdr_t *)contents)->position_word_low
|
- *(undefined1 *)(contents + 0x2)
+ ((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_12_w_2_17_address_2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x2)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_low
|
- &*(char *)((byte *)contents + 0x2)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_low
|
- &((char *)contents)[0x2]
+ (char *)&((uw_object_hdr_t *)contents)->position_word_low
|
- &*(char *)((ushort *)contents + 0x1)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_low
|
- &*(char *)(contents + 0x2)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_12_w_2_17_store_2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- *(char *)((byte *)contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- ((char *)contents)[0x2] = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x1) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
|
- *(char *)(contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->position_word_low = (byte)E;
)
...>
}


@receiver_12_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- *(char *)((byte *)contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- ((char *)contents)[0x2]
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- *(char *)((ushort *)contents + 0x1)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- (char)((ushort *)contents)[0x1]
+ (char)((uw_object_hdr_t *)contents)->position_word_low
|
- *(char *)(contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->position_word_low
)
...>
}


@receiver_12_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- *(byte *)((byte *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- ((byte *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- *(byte *)(contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_12_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- *(undefined1 *)((byte *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- ((undefined1 *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->position_word_high
|
- *(undefined1 *)(contents + 0x3)
+ ((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_12_w_2_17_address_3@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x3)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_high
|
- &*(char *)((byte *)contents + 0x3)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_high
|
- &((char *)contents)[0x3]
+ (char *)&((uw_object_hdr_t *)contents)->position_word_high
|
- &*(char *)(contents + 0x3)
+ (char *)&((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_12_w_2_17_store_3@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
|
- *(char *)((byte *)contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
|
- ((char *)contents)[0x3] = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
|
- *(char *)(contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->position_word_high = (byte)E;
)
...>
}


@receiver_12_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->position_word_high
|
- *(char *)((byte *)contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->position_word_high
|
- ((char *)contents)[0x3]
+ (char)((uw_object_hdr_t *)contents)->position_word_high
|
- *(char *)(contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->position_word_high
)
...>
}


@receiver_12_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x4) = (char)V;
- *(char *)((char *)contents + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_12_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x4) = (char)V;
- *(byte *)((char *)contents + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_12_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x4) = (byte)V;
- *(char *)((char *)contents + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_12_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x4) = (byte)V;
- *(byte *)((char *)contents + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->chain_word = (ushort)V;

...>
}

@receiver_12_w_4_34_word_ushort@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(ushort *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- ((ushort *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(ushort *)((ushort *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(ushort *)(contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
)
...>
}


@receiver_12_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(undefined2 *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- ((undefined2 *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(undefined2 *)((undefined2 *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(undefined2 *)(contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word
)
...>
}


@receiver_12_w_4_34_word_short@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- *(short *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- ((short *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- *(short *)((short *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
|
- *(short *)(contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_signed
)
...>
}


@receiver_12_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(byte *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- ((byte *)contents)[0x4]
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(byte *)((ushort *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- (byte)((ushort *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(byte *)(contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_12_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(undefined1 *)((byte *)contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- ((undefined1 *)contents)[0x4]
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(undefined1 *)((ushort *)contents + 0x2)
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- (undefined1)((ushort *)contents)[0x2]
+ ((uw_object_hdr_t *)contents)->chain_word_low
|
- *(undefined1 *)(contents + 0x4)
+ ((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_12_w_4_34_address_4@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x4)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_low
|
- &*(char *)((byte *)contents + 0x4)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_low
|
- &((char *)contents)[0x4]
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_low
|
- &*(char *)((ushort *)contents + 0x2)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_low
|
- &*(char *)(contents + 0x4)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_12_w_4_34_store_4@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x4) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- *(char *)((byte *)contents + 0x4) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- ((char *)contents)[0x4] = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x2) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
|
- *(char *)(contents + 0x4) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_low = (byte)E;
)
...>
}


@receiver_12_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x4)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- *(char *)((byte *)contents + 0x4)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- ((char *)contents)[0x4]
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- *(char *)((ushort *)contents + 0x2)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- (char)((ushort *)contents)[0x2]
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
|
- *(char *)(contents + 0x4)
+ (char)((uw_object_hdr_t *)contents)->chain_word_low
)
...>
}


@receiver_12_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- *(byte *)((byte *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- ((byte *)contents)[0x5]
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- *(byte *)(contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_12_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- *(undefined1 *)((byte *)contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- ((undefined1 *)contents)[0x5]
+ ((uw_object_hdr_t *)contents)->chain_word_high
|
- *(undefined1 *)(contents + 0x5)
+ ((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_12_w_4_34_address_5@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x5)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_high
|
- &*(char *)((byte *)contents + 0x5)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_high
|
- &((char *)contents)[0x5]
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_high
|
- &*(char *)(contents + 0x5)
+ (char *)&((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_12_w_4_34_store_5@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x5) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
|
- *(char *)((byte *)contents + 0x5) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
|
- ((char *)contents)[0x5] = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
|
- *(char *)(contents + 0x5) = E;
+ ((uw_object_hdr_t *)contents)->chain_word_high = (byte)E;
)
...>
}


@receiver_12_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x5)
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
|
- *(char *)((byte *)contents + 0x5)
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
|
- ((char *)contents)[0x5]
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
|
- *(char *)(contents + 0x5)
+ (char)((uw_object_hdr_t *)contents)->chain_word_high
)
...>
}


@receiver_12_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x6) = (char)V;
- *(char *)((char *)contents + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_12_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)contents + 0x6) = (char)V;
- *(byte *)((char *)contents + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_12_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x6) = (byte)V;
- *(char *)((char *)contents + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_12_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)contents + 0x6) = (byte)V;
- *(byte *)((char *)contents + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)contents)->link_word = (ushort)V;

...>
}

@receiver_12_w_6_51_word_ushort@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(ushort *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- ((ushort *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(ushort *)((ushort *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(ushort *)(contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
)
...>
}


@receiver_12_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(undefined2 *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- ((undefined2 *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(undefined2 *)((undefined2 *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(undefined2 *)(contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word
)
...>
}


@receiver_12_w_6_51_word_short@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- *(short *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- ((short *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- *(short *)((short *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word_signed
|
- *(short *)(contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_signed
)
...>
}


@receiver_12_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(byte *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- ((byte *)contents)[0x6]
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(byte *)((ushort *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- (byte)((ushort *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(byte *)(contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_12_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(undefined1 *)((byte *)contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- ((undefined1 *)contents)[0x6]
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(undefined1 *)((ushort *)contents + 0x3)
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- (undefined1)((ushort *)contents)[0x3]
+ ((uw_object_hdr_t *)contents)->link_word_low
|
- *(undefined1 *)(contents + 0x6)
+ ((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_12_w_6_51_address_6@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x6)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_low
|
- &*(char *)((byte *)contents + 0x6)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_low
|
- &((char *)contents)[0x6]
+ (char *)&((uw_object_hdr_t *)contents)->link_word_low
|
- &*(char *)((ushort *)contents + 0x3)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_low
|
- &*(char *)(contents + 0x6)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_12_w_6_51_store_6@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x6) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- *(char *)((byte *)contents + 0x6) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- ((char *)contents)[0x6] = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- *(char *)((ushort *)contents + 0x3) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
|
- *(char *)(contents + 0x6) = E;
+ ((uw_object_hdr_t *)contents)->link_word_low = (byte)E;
)
...>
}


@receiver_12_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x6)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- *(char *)((byte *)contents + 0x6)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- ((char *)contents)[0x6]
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- *(char *)((ushort *)contents + 0x3)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- (char)((ushort *)contents)[0x3]
+ (char)((uw_object_hdr_t *)contents)->link_word_low
|
- *(char *)(contents + 0x6)
+ (char)((uw_object_hdr_t *)contents)->link_word_low
)
...>
}


@receiver_12_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- *(byte *)((byte *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- ((byte *)contents)[0x7]
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- *(byte *)(contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_12_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- *(undefined1 *)((byte *)contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- ((undefined1 *)contents)[0x7]
+ ((uw_object_hdr_t *)contents)->link_word_high
|
- *(undefined1 *)(contents + 0x7)
+ ((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_12_w_6_51_address_7@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)contents + 0x7)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_high
|
- &*(char *)((byte *)contents + 0x7)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_high
|
- &((char *)contents)[0x7]
+ (char *)&((uw_object_hdr_t *)contents)->link_word_high
|
- &*(char *)(contents + 0x7)
+ (char *)&((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_12_w_6_51_store_7@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x7) = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
|
- *(char *)((byte *)contents + 0x7) = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
|
- ((char *)contents)[0x7] = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
|
- *(char *)(contents + 0x7) = E;
+ ((uw_object_hdr_t *)contents)->link_word_high = (byte)E;
)
...>
}


@receiver_12_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)contents + 0x7)
+ (char)((uw_object_hdr_t *)contents)->link_word_high
|
- *(char *)((byte *)contents + 0x7)
+ (char)((uw_object_hdr_t *)contents)->link_word_high
|
- ((char *)contents)[0x7]
+ (char)((uw_object_hdr_t *)contents)->link_word_high
|
- *(char *)(contents + 0x7)
+ (char)((uw_object_hdr_t *)contents)->link_word_high
)
...>
}


@receiver_13_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x0) = (char)V;
- *(char *)((char *)iVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x0) = (char)V;
- *(byte *)((char *)iVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x0) = (byte)V;
- *(char *)((char *)iVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x0) = (byte)V;
- *(byte *)((char *)iVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->type_flags = (ushort)V;

...>
}

@receiver_13_w_0_0_word_ushort@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@receiver_13_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((undefined2 *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(undefined2 *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}


@receiver_13_w_0_0_word_short@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- ((short *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)((short *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
|
- *(short *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_signed
)
...>
}


@receiver_13_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((byte *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (byte)((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(byte *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)((byte *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((undefined1 *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (undefined1)((ushort *)iVar1)[0x0]
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(undefined1 *)(iVar1 + 0x0)
+ ((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_13_w_0_0_address_0@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)((byte *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &((char *)iVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)((ushort *)iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)iVar1
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*(char *)(iVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &iVar1[0x0]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
|
- &*iVar1
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_13_w_0_0_store_0@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- ((char *)iVar1)[0x0] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)iVar1 = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *(char *)(iVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- iVar1[0x0] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
|
- *iVar1 = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)((byte *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- ((char *)iVar1)[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)((ushort *)iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- (char)((ushort *)iVar1)[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)iVar1
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *(char *)(iVar1 + 0x0)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- iVar1[0x0]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
|
- *iVar1
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_low
)
...>
}


@receiver_13_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(byte *)((byte *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((byte *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(byte *)(iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_13_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(undefined1 *)((byte *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((undefined1 *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(undefined1 *)(iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_13_w_0_0_address_1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &*(char *)((byte *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &((char *)iVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &*(char *)(iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
|
- &iVar1[0x1]
+ (char *)&((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_13_w_0_0_store_1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- ((char *)iVar1)[0x1] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- *(char *)(iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
|
- iVar1[0x1] = E;
+ ((uw_object_hdr_t *)iVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_13_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(char *)((byte *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- ((char *)iVar1)[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- *(char *)(iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
|
- iVar1[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->type_flags_high
)
...>
}


@receiver_13_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x2) = (char)V;
- *(char *)((char *)iVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x2) = (char)V;
- *(byte *)((char *)iVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x2) = (byte)V;
- *(char *)((char *)iVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x2) = (byte)V;
- *(byte *)((char *)iVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->position_word = (ushort)V;

...>
}

@receiver_13_w_2_17_word_ushort@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@receiver_13_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((undefined2 *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(undefined2 *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}


@receiver_13_w_2_17_word_short@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- ((short *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)((short *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
|
- *(short *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_signed
)
...>
}


@receiver_13_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((byte *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- (byte)((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(byte *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_13_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((undefined1 *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x1)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- (undefined1)((ushort *)iVar1)[0x1]
+ ((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(undefined1 *)(iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_13_w_2_17_address_2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)((byte *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &((char *)iVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)((ushort *)iVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &*(char *)(iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
|
- &iVar1[0x2]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_13_w_2_17_store_2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- ((char *)iVar1)[0x2] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- *(char *)(iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
|
- iVar1[0x2] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_13_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)((byte *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- ((char *)iVar1)[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)((ushort *)iVar1 + 0x1)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- (char)((ushort *)iVar1)[0x1]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- *(char *)(iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
|
- iVar1[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_low
)
...>
}


@receiver_13_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(byte *)((byte *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((byte *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(byte *)(iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_13_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((undefined1 *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(undefined1 *)(iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_13_w_2_17_address_3@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &*(char *)((byte *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &((char *)iVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &*(char *)(iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
|
- &iVar1[0x3]
+ (char *)&((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_13_w_2_17_store_3@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- ((char *)iVar1)[0x3] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- *(char *)(iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
|
- iVar1[0x3] = E;
+ ((uw_object_hdr_t *)iVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_13_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(char *)((byte *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- ((char *)iVar1)[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- *(char *)(iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
|
- iVar1[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->position_word_high
)
...>
}


@receiver_13_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x4) = (char)V;
- *(char *)((char *)iVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x4) = (char)V;
- *(byte *)((char *)iVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x4) = (byte)V;
- *(char *)((char *)iVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x4) = (byte)V;
- *(byte *)((char *)iVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->chain_word = (ushort)V;

...>
}

@receiver_13_w_4_34_word_ushort@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@receiver_13_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((undefined2 *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(undefined2 *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}


@receiver_13_w_4_34_word_short@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- ((short *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)((short *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
|
- *(short *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_signed
)
...>
}


@receiver_13_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((byte *)iVar1)[0x4]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (byte)((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(byte *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_13_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((undefined1 *)iVar1)[0x4]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x2)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (undefined1)((ushort *)iVar1)[0x2]
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(undefined1 *)(iVar1 + 0x4)
+ ((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_13_w_4_34_address_4@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)((byte *)iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &((char *)iVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)((ushort *)iVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &*(char *)(iVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
|
- &iVar1[0x4]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_13_w_4_34_store_4@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- ((char *)iVar1)[0x4] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- *(char *)(iVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
|
- iVar1[0x4] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_13_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)((byte *)iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- ((char *)iVar1)[0x4]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)((ushort *)iVar1 + 0x2)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- (char)((ushort *)iVar1)[0x2]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- *(char *)(iVar1 + 0x4)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
|
- iVar1[0x4]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_low
)
...>
}


@receiver_13_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(byte *)((byte *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((byte *)iVar1)[0x5]
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(byte *)(iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_13_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((undefined1 *)iVar1)[0x5]
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(undefined1 *)(iVar1 + 0x5)
+ ((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_13_w_4_34_address_5@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &*(char *)((byte *)iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &((char *)iVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &*(char *)(iVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
|
- &iVar1[0x5]
+ (char *)&((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_13_w_4_34_store_5@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- ((char *)iVar1)[0x5] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- *(char *)(iVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
|
- iVar1[0x5] = E;
+ ((uw_object_hdr_t *)iVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_13_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(char *)((byte *)iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- ((char *)iVar1)[0x5]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- *(char *)(iVar1 + 0x5)
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
|
- iVar1[0x5]
+ (char)((uw_object_hdr_t *)iVar1)->chain_word_high
)
...>
}


@receiver_13_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x6) = (char)V;
- *(char *)((char *)iVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar1 + 0x6) = (char)V;
- *(byte *)((char *)iVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x6) = (byte)V;
- *(char *)((char *)iVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar1 + 0x6) = (byte)V;
- *(byte *)((char *)iVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar1)->link_word = (ushort)V;

...>
}

@receiver_13_w_6_51_word_ushort@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@receiver_13_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((undefined2 *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)((undefined2 *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(undefined2 *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}


@receiver_13_w_6_51_word_short@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- ((short *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)((short *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
|
- *(short *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_signed
)
...>
}


@receiver_13_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((byte *)iVar1)[0x6]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- (byte)((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(byte *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_13_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)((byte *)iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((undefined1 *)iVar1)[0x6]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)((ushort *)iVar1 + 0x3)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- (undefined1)((ushort *)iVar1)[0x3]
+ ((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(undefined1 *)(iVar1 + 0x6)
+ ((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_13_w_6_51_address_6@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)((byte *)iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &((char *)iVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)((ushort *)iVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &*(char *)(iVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
|
- &iVar1[0x6]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_13_w_6_51_store_6@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- ((char *)iVar1)[0x6] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- *(char *)(iVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
|
- iVar1[0x6] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_13_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)((byte *)iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- ((char *)iVar1)[0x6]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)((ushort *)iVar1 + 0x3)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- (char)((ushort *)iVar1)[0x3]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- *(char *)(iVar1 + 0x6)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
|
- iVar1[0x6]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_low
)
...>
}


@receiver_13_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(byte *)((byte *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((byte *)iVar1)[0x7]
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(byte *)(iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_13_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(undefined1 *)((byte *)iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((undefined1 *)iVar1)[0x7]
+ ((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(undefined1 *)(iVar1 + 0x7)
+ ((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_13_w_6_51_address_7@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &*(char *)((byte *)iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &((char *)iVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &*(char *)(iVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
|
- &iVar1[0x7]
+ (char *)&((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_13_w_6_51_store_7@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- ((char *)iVar1)[0x7] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- *(char *)(iVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
|
- iVar1[0x7] = E;
+ ((uw_object_hdr_t *)iVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_13_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(char *)((byte *)iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- ((char *)iVar1)[0x7]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- *(char *)(iVar1 + 0x7)
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
|
- iVar1[0x7]
+ (char)((uw_object_hdr_t *)iVar1)->link_word_high
)
...>
}


@receiver_14_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x0) = (char)V;
- *(char *)((char *)pcVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x0) = (char)V;
- *(byte *)((char *)pcVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x0) = (byte)V;
- *(char *)((char *)pcVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x0) = (byte)V;
- *(byte *)((char *)pcVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->type_flags = (ushort)V;

...>
}

@receiver_14_w_0_0_word_ushort@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(ushort *)((byte *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- ((ushort *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(ushort *)((ushort *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(ushort *)(pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
)
...>
}


@receiver_14_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(undefined2 *)((byte *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- ((undefined2 *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(undefined2 *)(pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
)
...>
}


@receiver_14_w_0_0_word_short@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_signed
|
- *(short *)((byte *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_signed
|
- ((short *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_signed
|
- *(short *)((short *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_signed
|
- *(short *)(pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_signed
)
...>
}


@receiver_14_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(byte *)((byte *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- ((byte *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(byte *)((ushort *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- (byte)((ushort *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(byte *)pcVar2
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(byte *)(pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
)
...>
}


@receiver_14_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(undefined1 *)((byte *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- ((undefined1 *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- (undefined1)((ushort *)pcVar2)[0x0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(undefined1 *)pcVar2
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(undefined1 *)(pcVar2 + 0x0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low
)
...>
}


@receiver_14_w_0_0_address_0@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &*(char *)((byte *)pcVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &((char *)pcVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &*(char *)((ushort *)pcVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &*(char *)pcVar2
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &*(char *)(pcVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &pcVar2[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- &*pcVar2
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_low
)
...>
}


@receiver_14_w_0_0_store_0@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- ((char *)pcVar2)[0x0] = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pcVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- *(char *)pcVar2 = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- *(char *)(pcVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- pcVar2[0x0] = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
|
- *pcVar2 = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_14_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(char *)((byte *)pcVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- ((char *)pcVar2)[0x0]
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(char *)((ushort *)pcVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- (char)((ushort *)pcVar2)[0x0]
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(char *)pcVar2
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *(char *)(pcVar2 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- pcVar2[0x0]
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
|
- *pcVar2
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_low
)
...>
}


@receiver_14_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- *(byte *)((byte *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- ((byte *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- *(byte *)(pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
)
...>
}


@receiver_14_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- *(undefined1 *)((byte *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- ((undefined1 *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- *(undefined1 *)(pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high
)
...>
}


@receiver_14_w_0_0_address_1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- &*(char *)((byte *)pcVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- &((char *)pcVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- &*(char *)(pcVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- &pcVar2[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar2)->type_flags_high
)
...>
}


@receiver_14_w_0_0_store_1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high = (byte)E;
|
- ((char *)pcVar2)[0x1] = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high = (byte)E;
|
- *(char *)(pcVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high = (byte)E;
|
- pcVar2[0x1] = E;
+ ((uw_object_hdr_t *)pcVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_14_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- *(char *)((byte *)pcVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- ((char *)pcVar2)[0x1]
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- *(char *)(pcVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_high
|
- pcVar2[0x1]
+ (char)((uw_object_hdr_t *)pcVar2)->type_flags_high
)
...>
}


@receiver_14_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x2) = (char)V;
- *(char *)((char *)pcVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x2) = (char)V;
- *(byte *)((char *)pcVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x2) = (byte)V;
- *(char *)((char *)pcVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x2) = (byte)V;
- *(byte *)((char *)pcVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->position_word = (ushort)V;

...>
}

@receiver_14_w_2_17_word_ushort@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(ushort *)((byte *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- ((ushort *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(ushort *)((ushort *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(ushort *)(pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
)
...>
}


@receiver_14_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(undefined2 *)((byte *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- ((undefined2 *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(undefined2 *)((undefined2 *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(undefined2 *)(pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
)
...>
}


@receiver_14_w_2_17_word_short@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_signed
|
- *(short *)((byte *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_signed
|
- ((short *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->position_word_signed
|
- *(short *)((short *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->position_word_signed
|
- *(short *)(pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_signed
)
...>
}


@receiver_14_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(byte *)((byte *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- ((byte *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(byte *)((ushort *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- (byte)((ushort *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(byte *)(pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
)
...>
}


@receiver_14_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(undefined1 *)((byte *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- ((undefined1 *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(undefined1 *)((ushort *)pcVar2 + 0x1)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- (undefined1)((ushort *)pcVar2)[0x1]
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(undefined1 *)(pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->position_word_low
)
...>
}


@receiver_14_w_2_17_address_2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_low
|
- &*(char *)((byte *)pcVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_low
|
- &((char *)pcVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_low
|
- &*(char *)((ushort *)pcVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_low
|
- &*(char *)(pcVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_low
|
- &pcVar2[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_low
)
...>
}


@receiver_14_w_2_17_store_2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_low = (byte)E;
|
- ((char *)pcVar2)[0x2] = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_low = (byte)E;
|
- *(char *)(pcVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_low = (byte)E;
|
- pcVar2[0x2] = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_14_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(char *)((byte *)pcVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
|
- ((char *)pcVar2)[0x2]
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(char *)((ushort *)pcVar2 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
|
- (char)((ushort *)pcVar2)[0x1]
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
|
- *(char *)(pcVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
|
- pcVar2[0x2]
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_low
)
...>
}


@receiver_14_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
|
- *(byte *)((byte *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
|
- ((byte *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
|
- *(byte *)(pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
)
...>
}


@receiver_14_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
|
- *(undefined1 *)((byte *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
|
- ((undefined1 *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
|
- *(undefined1 *)(pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->position_word_high
)
...>
}


@receiver_14_w_2_17_address_3@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_high
|
- &*(char *)((byte *)pcVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_high
|
- &((char *)pcVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_high
|
- &*(char *)(pcVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_high
|
- &pcVar2[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar2)->position_word_high
)
...>
}


@receiver_14_w_2_17_store_3@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_high = (byte)E;
|
- ((char *)pcVar2)[0x3] = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_high = (byte)E;
|
- *(char *)(pcVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_high = (byte)E;
|
- pcVar2[0x3] = E;
+ ((uw_object_hdr_t *)pcVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_14_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_high
|
- *(char *)((byte *)pcVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_high
|
- ((char *)pcVar2)[0x3]
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_high
|
- *(char *)(pcVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_high
|
- pcVar2[0x3]
+ (char)((uw_object_hdr_t *)pcVar2)->position_word_high
)
...>
}


@receiver_14_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x4) = (char)V;
- *(char *)((char *)pcVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x4) = (char)V;
- *(byte *)((char *)pcVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x4) = (byte)V;
- *(char *)((char *)pcVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x4) = (byte)V;
- *(byte *)((char *)pcVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->chain_word = (ushort)V;

...>
}

@receiver_14_w_4_34_word_ushort@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(ushort *)((byte *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- ((ushort *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(ushort *)((ushort *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(ushort *)(pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
)
...>
}


@receiver_14_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(undefined2 *)((byte *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- ((undefined2 *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(undefined2 *)(pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
)
...>
}


@receiver_14_w_4_34_word_short@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_signed
|
- *(short *)((byte *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_signed
|
- ((short *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_signed
|
- *(short *)((short *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_signed
|
- *(short *)(pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_signed
)
...>
}


@receiver_14_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(byte *)((byte *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- ((byte *)pcVar2)[0x4]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(byte *)((ushort *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- (byte)((ushort *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(byte *)(pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
)
...>
}


@receiver_14_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(undefined1 *)((byte *)pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- ((undefined1 *)pcVar2)[0x4]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)pcVar2 + 0x2)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- (undefined1)((ushort *)pcVar2)[0x2]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(undefined1 *)(pcVar2 + 0x4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low
)
...>
}


@receiver_14_w_4_34_address_4@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- &*(char *)((byte *)pcVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- &((char *)pcVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- &*(char *)((ushort *)pcVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- &*(char *)(pcVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- &pcVar2[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_low
)
...>
}


@receiver_14_w_4_34_store_4@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low = (byte)E;
|
- ((char *)pcVar2)[0x4] = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low = (byte)E;
|
- *(char *)(pcVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low = (byte)E;
|
- pcVar2[0x4] = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_14_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(char *)((byte *)pcVar2 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- ((char *)pcVar2)[0x4]
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(char *)((ushort *)pcVar2 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- (char)((ushort *)pcVar2)[0x2]
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- *(char *)(pcVar2 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
|
- pcVar2[0x4]
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_low
)
...>
}


@receiver_14_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x5)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- *(byte *)((byte *)pcVar2 + 0x5)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- ((byte *)pcVar2)[0x5]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- *(byte *)(pcVar2 + 0x5)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
)
...>
}


@receiver_14_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x5)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- *(undefined1 *)((byte *)pcVar2 + 0x5)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- ((undefined1 *)pcVar2)[0x5]
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- *(undefined1 *)(pcVar2 + 0x5)
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high
)
...>
}


@receiver_14_w_4_34_address_5@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- &*(char *)((byte *)pcVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- &((char *)pcVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- &*(char *)(pcVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- &pcVar2[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar2)->chain_word_high
)
...>
}


@receiver_14_w_4_34_store_5@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high = (byte)E;
|
- ((char *)pcVar2)[0x5] = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high = (byte)E;
|
- *(char *)(pcVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high = (byte)E;
|
- pcVar2[0x5] = E;
+ ((uw_object_hdr_t *)pcVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_14_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- *(char *)((byte *)pcVar2 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- ((char *)pcVar2)[0x5]
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- *(char *)(pcVar2 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_high
|
- pcVar2[0x5]
+ (char)((uw_object_hdr_t *)pcVar2)->chain_word_high
)
...>
}


@receiver_14_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x6) = (char)V;
- *(char *)((char *)pcVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar2 + 0x6) = (char)V;
- *(byte *)((char *)pcVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x6) = (byte)V;
- *(char *)((char *)pcVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar2 + 0x6) = (byte)V;
- *(byte *)((char *)pcVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar2)->link_word = (ushort)V;

...>
}

@receiver_14_w_6_51_word_ushort@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(ushort *)((byte *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- ((ushort *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(ushort *)((ushort *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(ushort *)(pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
)
...>
}


@receiver_14_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(undefined2 *)((byte *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- ((undefined2 *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(undefined2 *)((undefined2 *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(undefined2 *)(pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
)
...>
}


@receiver_14_w_6_51_word_short@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_signed
|
- *(short *)((byte *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_signed
|
- ((short *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->link_word_signed
|
- *(short *)((short *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->link_word_signed
|
- *(short *)(pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_signed
)
...>
}


@receiver_14_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(byte *)((byte *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- ((byte *)pcVar2)[0x6]
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(byte *)((ushort *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- (byte)((ushort *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(byte *)(pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
)
...>
}


@receiver_14_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(undefined1 *)((byte *)pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- ((undefined1 *)pcVar2)[0x6]
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(undefined1 *)((ushort *)pcVar2 + 0x3)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- (undefined1)((ushort *)pcVar2)[0x3]
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(undefined1 *)(pcVar2 + 0x6)
+ ((uw_object_hdr_t *)pcVar2)->link_word_low
)
...>
}


@receiver_14_w_6_51_address_6@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_low
|
- &*(char *)((byte *)pcVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_low
|
- &((char *)pcVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_low
|
- &*(char *)((ushort *)pcVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_low
|
- &*(char *)(pcVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_low
|
- &pcVar2[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_low
)
...>
}


@receiver_14_w_6_51_store_6@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_low = (byte)E;
|
- ((char *)pcVar2)[0x6] = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_low = (byte)E;
|
- *(char *)(pcVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_low = (byte)E;
|
- pcVar2[0x6] = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_14_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(char *)((byte *)pcVar2 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
|
- ((char *)pcVar2)[0x6]
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(char *)((ushort *)pcVar2 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
|
- (char)((ushort *)pcVar2)[0x3]
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
|
- *(char *)(pcVar2 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
|
- pcVar2[0x6]
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_low
)
...>
}


@receiver_14_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar2 + 0x7)
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
|
- *(byte *)((byte *)pcVar2 + 0x7)
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
|
- ((byte *)pcVar2)[0x7]
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
|
- *(byte *)(pcVar2 + 0x7)
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
)
...>
}


@receiver_14_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar2 + 0x7)
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
|
- *(undefined1 *)((byte *)pcVar2 + 0x7)
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
|
- ((undefined1 *)pcVar2)[0x7]
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
|
- *(undefined1 *)(pcVar2 + 0x7)
+ ((uw_object_hdr_t *)pcVar2)->link_word_high
)
...>
}


@receiver_14_w_6_51_address_7@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_high
|
- &*(char *)((byte *)pcVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_high
|
- &((char *)pcVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_high
|
- &*(char *)(pcVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_high
|
- &pcVar2[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar2)->link_word_high
)
...>
}


@receiver_14_w_6_51_store_7@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)pcVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_high = (byte)E;
|
- ((char *)pcVar2)[0x7] = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_high = (byte)E;
|
- *(char *)(pcVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_high = (byte)E;
|
- pcVar2[0x7] = E;
+ ((uw_object_hdr_t *)pcVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_14_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar2 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_high
|
- *(char *)((byte *)pcVar2 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_high
|
- ((char *)pcVar2)[0x7]
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_high
|
- *(char *)(pcVar2 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_high
|
- pcVar2[0x7]
+ (char)((uw_object_hdr_t *)pcVar2)->link_word_high
)
...>
}


@receiver_15_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x0) = (char)V;
- *(char *)((char *)pcVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x0) = (char)V;
- *(byte *)((char *)pcVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x0) = (byte)V;
- *(char *)((char *)pcVar1 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x0) = (byte)V;
- *(byte *)((char *)pcVar1 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->type_flags = (ushort)V;

...>
}

@receiver_15_w_0_0_word_ushort@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(ushort *)((byte *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- ((ushort *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(ushort *)((ushort *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(ushort *)(pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
)
...>
}


@receiver_15_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(undefined2 *)((byte *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- ((undefined2 *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(undefined2 *)((undefined2 *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(undefined2 *)(pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
)
...>
}


@receiver_15_w_0_0_word_short@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_signed
|
- *(short *)((byte *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_signed
|
- ((short *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_signed
|
- *(short *)((short *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_signed
|
- *(short *)(pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_signed
)
...>
}


@receiver_15_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(byte *)((byte *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- ((byte *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(byte *)((ushort *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- (byte)((ushort *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(byte *)pcVar1
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(byte *)(pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(undefined1 *)((byte *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- ((undefined1 *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(undefined1 *)((ushort *)pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- (undefined1)((ushort *)pcVar1)[0x0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(undefined1 *)pcVar1
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(undefined1 *)(pcVar1 + 0x0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low
)
...>
}


@receiver_15_w_0_0_address_0@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &*(char *)((byte *)pcVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &((char *)pcVar1)[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &*(char *)((ushort *)pcVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &*(char *)pcVar1
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &*(char *)(pcVar1 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &pcVar1[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- &*pcVar1
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_low
)
...>
}


@receiver_15_w_0_0_store_0@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- ((char *)pcVar1)[0x0] = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pcVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- *(char *)pcVar1 = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- *(char *)(pcVar1 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- pcVar1[0x0] = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
|
- *pcVar1 = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_low = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(char *)((byte *)pcVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- ((char *)pcVar1)[0x0]
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(char *)((ushort *)pcVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- (char)((ushort *)pcVar1)[0x0]
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(char *)pcVar1
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *(char *)(pcVar1 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- pcVar1[0x0]
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
|
- *pcVar1
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_low
)
...>
}


@receiver_15_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- *(byte *)((byte *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- ((byte *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- *(byte *)(pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
)
...>
}


@receiver_15_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- *(undefined1 *)((byte *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- ((undefined1 *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- *(undefined1 *)(pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high
)
...>
}


@receiver_15_w_0_0_address_1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- &*(char *)((byte *)pcVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- &((char *)pcVar1)[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- &*(char *)(pcVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- &pcVar1[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar1)->type_flags_high
)
...>
}


@receiver_15_w_0_0_store_1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high = (byte)E;
|
- ((char *)pcVar1)[0x1] = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high = (byte)E;
|
- *(char *)(pcVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high = (byte)E;
|
- pcVar1[0x1] = E;
+ ((uw_object_hdr_t *)pcVar1)->type_flags_high = (byte)E;
)
...>
}


@receiver_15_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- *(char *)((byte *)pcVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- ((char *)pcVar1)[0x1]
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- *(char *)(pcVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_high
|
- pcVar1[0x1]
+ (char)((uw_object_hdr_t *)pcVar1)->type_flags_high
)
...>
}


@receiver_15_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x2) = (char)V;
- *(char *)((char *)pcVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x2) = (char)V;
- *(byte *)((char *)pcVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x2) = (byte)V;
- *(char *)((char *)pcVar1 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x2) = (byte)V;
- *(byte *)((char *)pcVar1 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->position_word = (ushort)V;

...>
}

@receiver_15_w_2_17_word_ushort@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(ushort *)((byte *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- ((ushort *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(ushort *)((ushort *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(ushort *)(pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
)
...>
}


@receiver_15_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(undefined2 *)((byte *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- ((undefined2 *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(undefined2 *)((undefined2 *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(undefined2 *)(pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
)
...>
}


@receiver_15_w_2_17_word_short@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_signed
|
- *(short *)((byte *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_signed
|
- ((short *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->position_word_signed
|
- *(short *)((short *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->position_word_signed
|
- *(short *)(pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_signed
)
...>
}


@receiver_15_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(byte *)((byte *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- ((byte *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(byte *)((ushort *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- (byte)((ushort *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(byte *)(pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(undefined1 *)((byte *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- ((undefined1 *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(undefined1 *)((ushort *)pcVar1 + 0x1)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- (undefined1)((ushort *)pcVar1)[0x1]
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(undefined1 *)(pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->position_word_low
)
...>
}


@receiver_15_w_2_17_address_2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_low
|
- &*(char *)((byte *)pcVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_low
|
- &((char *)pcVar1)[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_low
|
- &*(char *)((ushort *)pcVar1 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_low
|
- &*(char *)(pcVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_low
|
- &pcVar1[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_low
)
...>
}


@receiver_15_w_2_17_store_2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_low = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_low = (byte)E;
|
- ((char *)pcVar1)[0x2] = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar1 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_low = (byte)E;
|
- *(char *)(pcVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_low = (byte)E;
|
- pcVar1[0x2] = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_low = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(char *)((byte *)pcVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
|
- ((char *)pcVar1)[0x2]
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(char *)((ushort *)pcVar1 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
|
- (char)((ushort *)pcVar1)[0x1]
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
|
- *(char *)(pcVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
|
- pcVar1[0x2]
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_low
)
...>
}


@receiver_15_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
|
- *(byte *)((byte *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
|
- ((byte *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
|
- *(byte *)(pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
)
...>
}


@receiver_15_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
|
- *(undefined1 *)((byte *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
|
- ((undefined1 *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
|
- *(undefined1 *)(pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->position_word_high
)
...>
}


@receiver_15_w_2_17_address_3@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_high
|
- &*(char *)((byte *)pcVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_high
|
- &((char *)pcVar1)[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_high
|
- &*(char *)(pcVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_high
|
- &pcVar1[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar1)->position_word_high
)
...>
}


@receiver_15_w_2_17_store_3@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_high = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_high = (byte)E;
|
- ((char *)pcVar1)[0x3] = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_high = (byte)E;
|
- *(char *)(pcVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_high = (byte)E;
|
- pcVar1[0x3] = E;
+ ((uw_object_hdr_t *)pcVar1)->position_word_high = (byte)E;
)
...>
}


@receiver_15_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_high
|
- *(char *)((byte *)pcVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_high
|
- ((char *)pcVar1)[0x3]
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_high
|
- *(char *)(pcVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_high
|
- pcVar1[0x3]
+ (char)((uw_object_hdr_t *)pcVar1)->position_word_high
)
...>
}


@receiver_15_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x4) = (char)V;
- *(char *)((char *)pcVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x4) = (char)V;
- *(byte *)((char *)pcVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x4) = (byte)V;
- *(char *)((char *)pcVar1 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x4) = (byte)V;
- *(byte *)((char *)pcVar1 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->chain_word = (ushort)V;

...>
}

@receiver_15_w_4_34_word_ushort@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(ushort *)((byte *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- ((ushort *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(ushort *)((ushort *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(ushort *)(pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
)
...>
}


@receiver_15_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(undefined2 *)((byte *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- ((undefined2 *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(undefined2 *)((undefined2 *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(undefined2 *)(pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
)
...>
}


@receiver_15_w_4_34_word_short@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_signed
|
- *(short *)((byte *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_signed
|
- ((short *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_signed
|
- *(short *)((short *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_signed
|
- *(short *)(pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_signed
)
...>
}


@receiver_15_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(byte *)((byte *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- ((byte *)pcVar1)[0x4]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(byte *)((ushort *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- (byte)((ushort *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(byte *)(pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(undefined1 *)((byte *)pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- ((undefined1 *)pcVar1)[0x4]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(undefined1 *)((ushort *)pcVar1 + 0x2)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- (undefined1)((ushort *)pcVar1)[0x2]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(undefined1 *)(pcVar1 + 0x4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low
)
...>
}


@receiver_15_w_4_34_address_4@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- &*(char *)((byte *)pcVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- &((char *)pcVar1)[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- &*(char *)((ushort *)pcVar1 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- &*(char *)(pcVar1 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- &pcVar1[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_low
)
...>
}


@receiver_15_w_4_34_store_4@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low = (byte)E;
|
- ((char *)pcVar1)[0x4] = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar1 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low = (byte)E;
|
- *(char *)(pcVar1 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low = (byte)E;
|
- pcVar1[0x4] = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_low = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(char *)((byte *)pcVar1 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- ((char *)pcVar1)[0x4]
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(char *)((ushort *)pcVar1 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- (char)((ushort *)pcVar1)[0x2]
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- *(char *)(pcVar1 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
|
- pcVar1[0x4]
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_low
)
...>
}


@receiver_15_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x5)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- *(byte *)((byte *)pcVar1 + 0x5)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- ((byte *)pcVar1)[0x5]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- *(byte *)(pcVar1 + 0x5)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
)
...>
}


@receiver_15_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x5)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- *(undefined1 *)((byte *)pcVar1 + 0x5)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- ((undefined1 *)pcVar1)[0x5]
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- *(undefined1 *)(pcVar1 + 0x5)
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high
)
...>
}


@receiver_15_w_4_34_address_5@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- &*(char *)((byte *)pcVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- &((char *)pcVar1)[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- &*(char *)(pcVar1 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- &pcVar1[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar1)->chain_word_high
)
...>
}


@receiver_15_w_4_34_store_5@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high = (byte)E;
|
- ((char *)pcVar1)[0x5] = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high = (byte)E;
|
- *(char *)(pcVar1 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high = (byte)E;
|
- pcVar1[0x5] = E;
+ ((uw_object_hdr_t *)pcVar1)->chain_word_high = (byte)E;
)
...>
}


@receiver_15_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- *(char *)((byte *)pcVar1 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- ((char *)pcVar1)[0x5]
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- *(char *)(pcVar1 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_high
|
- pcVar1[0x5]
+ (char)((uw_object_hdr_t *)pcVar1)->chain_word_high
)
...>
}


@receiver_15_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x6) = (char)V;
- *(char *)((char *)pcVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar1 + 0x6) = (char)V;
- *(byte *)((char *)pcVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x6) = (byte)V;
- *(char *)((char *)pcVar1 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar1 + 0x6) = (byte)V;
- *(byte *)((char *)pcVar1 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar1)->link_word = (ushort)V;

...>
}

@receiver_15_w_6_51_word_ushort@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(ushort *)((byte *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- ((ushort *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(ushort *)((ushort *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(ushort *)(pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
)
...>
}


@receiver_15_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(undefined2 *)((byte *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- ((undefined2 *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(undefined2 *)((undefined2 *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(undefined2 *)(pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
)
...>
}


@receiver_15_w_6_51_word_short@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_signed
|
- *(short *)((byte *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_signed
|
- ((short *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->link_word_signed
|
- *(short *)((short *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->link_word_signed
|
- *(short *)(pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_signed
)
...>
}


@receiver_15_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(byte *)((byte *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- ((byte *)pcVar1)[0x6]
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(byte *)((ushort *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- (byte)((ushort *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(byte *)(pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(undefined1 *)((byte *)pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- ((undefined1 *)pcVar1)[0x6]
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(undefined1 *)((ushort *)pcVar1 + 0x3)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- (undefined1)((ushort *)pcVar1)[0x3]
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(undefined1 *)(pcVar1 + 0x6)
+ ((uw_object_hdr_t *)pcVar1)->link_word_low
)
...>
}


@receiver_15_w_6_51_address_6@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_low
|
- &*(char *)((byte *)pcVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_low
|
- &((char *)pcVar1)[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_low
|
- &*(char *)((ushort *)pcVar1 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_low
|
- &*(char *)(pcVar1 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_low
|
- &pcVar1[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_low
)
...>
}


@receiver_15_w_6_51_store_6@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_low = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_low = (byte)E;
|
- ((char *)pcVar1)[0x6] = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar1 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_low = (byte)E;
|
- *(char *)(pcVar1 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_low = (byte)E;
|
- pcVar1[0x6] = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_low = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(char *)((byte *)pcVar1 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
|
- ((char *)pcVar1)[0x6]
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(char *)((ushort *)pcVar1 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
|
- (char)((ushort *)pcVar1)[0x3]
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
|
- *(char *)(pcVar1 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
|
- pcVar1[0x6]
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_low
)
...>
}


@receiver_15_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar1 + 0x7)
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
|
- *(byte *)((byte *)pcVar1 + 0x7)
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
|
- ((byte *)pcVar1)[0x7]
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
|
- *(byte *)(pcVar1 + 0x7)
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
)
...>
}


@receiver_15_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar1 + 0x7)
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
|
- *(undefined1 *)((byte *)pcVar1 + 0x7)
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
|
- ((undefined1 *)pcVar1)[0x7]
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
|
- *(undefined1 *)(pcVar1 + 0x7)
+ ((uw_object_hdr_t *)pcVar1)->link_word_high
)
...>
}


@receiver_15_w_6_51_address_7@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_high
|
- &*(char *)((byte *)pcVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_high
|
- &((char *)pcVar1)[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_high
|
- &*(char *)(pcVar1 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_high
|
- &pcVar1[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar1)->link_word_high
)
...>
}


@receiver_15_w_6_51_store_7@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_high = (byte)E;
|
- *(char *)((byte *)pcVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_high = (byte)E;
|
- ((char *)pcVar1)[0x7] = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_high = (byte)E;
|
- *(char *)(pcVar1 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_high = (byte)E;
|
- pcVar1[0x7] = E;
+ ((uw_object_hdr_t *)pcVar1)->link_word_high = (byte)E;
)
...>
}


@receiver_15_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar1 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_high
|
- *(char *)((byte *)pcVar1 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_high
|
- ((char *)pcVar1)[0x7]
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_high
|
- *(char *)(pcVar1 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_high
|
- pcVar1[0x7]
+ (char)((uw_object_hdr_t *)pcVar1)->link_word_high
)
...>
}


@receiver_16_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x0) = (char)V;
- *(char *)((char *)pcVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x0) = (char)V;
- *(byte *)((char *)pcVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x0) = (byte)V;
- *(char *)((char *)pcVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x0) = (byte)V;
- *(byte *)((char *)pcVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->type_flags = (ushort)V;

...>
}

@receiver_16_w_0_0_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(ushort *)((byte *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- ((ushort *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(ushort *)((ushort *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(ushort *)(pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
)
...>
}


@receiver_16_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(undefined2 *)((byte *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- ((undefined2 *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(undefined2 *)(pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
)
...>
}


@receiver_16_w_0_0_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_signed
|
- *(short *)((byte *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_signed
|
- ((short *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_signed
|
- *(short *)((short *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_signed
|
- *(short *)(pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_signed
)
...>
}


@receiver_16_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(byte *)((byte *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- ((byte *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(byte *)((ushort *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- (byte)((ushort *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(byte *)pcVar4
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(byte *)(pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(undefined1 *)((byte *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- ((undefined1 *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- (undefined1)((ushort *)pcVar4)[0x0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(undefined1 *)pcVar4
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(undefined1 *)(pcVar4 + 0x0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low
)
...>
}


@receiver_16_w_0_0_address_0@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &*(char *)((byte *)pcVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &((char *)pcVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &*(char *)((ushort *)pcVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &*(char *)pcVar4
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &*(char *)(pcVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &pcVar4[0x0]
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- &*pcVar4
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_low
)
...>
}


@receiver_16_w_0_0_store_0@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- ((char *)pcVar4)[0x0] = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pcVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- *(char *)pcVar4 = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- *(char *)(pcVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- pcVar4[0x0] = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
|
- *pcVar4 = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_16_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(char *)((byte *)pcVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- ((char *)pcVar4)[0x0]
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(char *)((ushort *)pcVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- (char)((ushort *)pcVar4)[0x0]
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(char *)pcVar4
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *(char *)(pcVar4 + 0x0)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- pcVar4[0x0]
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
|
- *pcVar4
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_low
)
...>
}


@receiver_16_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- *(byte *)((byte *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- ((byte *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- *(byte *)(pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
)
...>
}


@receiver_16_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- *(undefined1 *)((byte *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- ((undefined1 *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- *(undefined1 *)(pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high
)
...>
}


@receiver_16_w_0_0_address_1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- &*(char *)((byte *)pcVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- &((char *)pcVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- &*(char *)(pcVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- &pcVar4[0x1]
+ (char *)&((uw_object_hdr_t *)pcVar4)->type_flags_high
)
...>
}


@receiver_16_w_0_0_store_1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high = (byte)E;
|
- ((char *)pcVar4)[0x1] = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high = (byte)E;
|
- *(char *)(pcVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high = (byte)E;
|
- pcVar4[0x1] = E;
+ ((uw_object_hdr_t *)pcVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_16_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- *(char *)((byte *)pcVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- ((char *)pcVar4)[0x1]
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- *(char *)(pcVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_high
|
- pcVar4[0x1]
+ (char)((uw_object_hdr_t *)pcVar4)->type_flags_high
)
...>
}


@receiver_16_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x2) = (char)V;
- *(char *)((char *)pcVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x2) = (char)V;
- *(byte *)((char *)pcVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x2) = (byte)V;
- *(char *)((char *)pcVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x2) = (byte)V;
- *(byte *)((char *)pcVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->position_word = (ushort)V;

...>
}

@receiver_16_w_2_17_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(ushort *)((byte *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- ((ushort *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(ushort *)((ushort *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(ushort *)(pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
)
...>
}


@receiver_16_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(undefined2 *)((byte *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- ((undefined2 *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(undefined2 *)((undefined2 *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(undefined2 *)(pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
)
...>
}


@receiver_16_w_2_17_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_signed
|
- *(short *)((byte *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_signed
|
- ((short *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->position_word_signed
|
- *(short *)((short *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->position_word_signed
|
- *(short *)(pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_signed
)
...>
}


@receiver_16_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(byte *)((byte *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- ((byte *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(byte *)((ushort *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- (byte)((ushort *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(byte *)(pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
)
...>
}


@receiver_16_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(undefined1 *)((byte *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- ((undefined1 *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(undefined1 *)((ushort *)pcVar4 + 0x1)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- (undefined1)((ushort *)pcVar4)[0x1]
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(undefined1 *)(pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->position_word_low
)
...>
}


@receiver_16_w_2_17_address_2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_low
|
- &*(char *)((byte *)pcVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_low
|
- &((char *)pcVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_low
|
- &*(char *)((ushort *)pcVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_low
|
- &*(char *)(pcVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_low
|
- &pcVar4[0x2]
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_low
)
...>
}


@receiver_16_w_2_17_store_2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_low = (byte)E;
|
- ((char *)pcVar4)[0x2] = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_low = (byte)E;
|
- *(char *)(pcVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_low = (byte)E;
|
- pcVar4[0x2] = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_16_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(char *)((byte *)pcVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
|
- ((char *)pcVar4)[0x2]
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(char *)((ushort *)pcVar4 + 0x1)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
|
- (char)((ushort *)pcVar4)[0x1]
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
|
- *(char *)(pcVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
|
- pcVar4[0x2]
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_low
)
...>
}


@receiver_16_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
|
- *(byte *)((byte *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
|
- ((byte *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
|
- *(byte *)(pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
)
...>
}


@receiver_16_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
|
- *(undefined1 *)((byte *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
|
- ((undefined1 *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
|
- *(undefined1 *)(pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->position_word_high
)
...>
}


@receiver_16_w_2_17_address_3@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_high
|
- &*(char *)((byte *)pcVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_high
|
- &((char *)pcVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_high
|
- &*(char *)(pcVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_high
|
- &pcVar4[0x3]
+ (char *)&((uw_object_hdr_t *)pcVar4)->position_word_high
)
...>
}


@receiver_16_w_2_17_store_3@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_high = (byte)E;
|
- ((char *)pcVar4)[0x3] = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_high = (byte)E;
|
- *(char *)(pcVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_high = (byte)E;
|
- pcVar4[0x3] = E;
+ ((uw_object_hdr_t *)pcVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_16_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_high
|
- *(char *)((byte *)pcVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_high
|
- ((char *)pcVar4)[0x3]
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_high
|
- *(char *)(pcVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_high
|
- pcVar4[0x3]
+ (char)((uw_object_hdr_t *)pcVar4)->position_word_high
)
...>
}


@receiver_16_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x4) = (char)V;
- *(char *)((char *)pcVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x4) = (char)V;
- *(byte *)((char *)pcVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x4) = (byte)V;
- *(char *)((char *)pcVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x4) = (byte)V;
- *(byte *)((char *)pcVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->chain_word = (ushort)V;

...>
}

@receiver_16_w_4_34_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(ushort *)((byte *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- ((ushort *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(ushort *)((ushort *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(ushort *)(pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
)
...>
}


@receiver_16_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(undefined2 *)((byte *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- ((undefined2 *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(undefined2 *)(pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
)
...>
}


@receiver_16_w_4_34_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_signed
|
- *(short *)((byte *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_signed
|
- ((short *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_signed
|
- *(short *)((short *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_signed
|
- *(short *)(pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_signed
)
...>
}


@receiver_16_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(byte *)((byte *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- ((byte *)pcVar4)[0x4]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(byte *)((ushort *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- (byte)((ushort *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(byte *)(pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
)
...>
}


@receiver_16_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(undefined1 *)((byte *)pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- ((undefined1 *)pcVar4)[0x4]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)pcVar4 + 0x2)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- (undefined1)((ushort *)pcVar4)[0x2]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(undefined1 *)(pcVar4 + 0x4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low
)
...>
}


@receiver_16_w_4_34_address_4@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- &*(char *)((byte *)pcVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- &((char *)pcVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- &*(char *)((ushort *)pcVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- &*(char *)(pcVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- &pcVar4[0x4]
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_low
)
...>
}


@receiver_16_w_4_34_store_4@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low = (byte)E;
|
- ((char *)pcVar4)[0x4] = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low = (byte)E;
|
- *(char *)(pcVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low = (byte)E;
|
- pcVar4[0x4] = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_16_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(char *)((byte *)pcVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- ((char *)pcVar4)[0x4]
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(char *)((ushort *)pcVar4 + 0x2)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- (char)((ushort *)pcVar4)[0x2]
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- *(char *)(pcVar4 + 0x4)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
|
- pcVar4[0x4]
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_low
)
...>
}


@receiver_16_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x5)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- *(byte *)((byte *)pcVar4 + 0x5)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- ((byte *)pcVar4)[0x5]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- *(byte *)(pcVar4 + 0x5)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
)
...>
}


@receiver_16_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x5)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- *(undefined1 *)((byte *)pcVar4 + 0x5)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- ((undefined1 *)pcVar4)[0x5]
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- *(undefined1 *)(pcVar4 + 0x5)
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high
)
...>
}


@receiver_16_w_4_34_address_5@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- &*(char *)((byte *)pcVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- &((char *)pcVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- &*(char *)(pcVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- &pcVar4[0x5]
+ (char *)&((uw_object_hdr_t *)pcVar4)->chain_word_high
)
...>
}


@receiver_16_w_4_34_store_5@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high = (byte)E;
|
- ((char *)pcVar4)[0x5] = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high = (byte)E;
|
- *(char *)(pcVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high = (byte)E;
|
- pcVar4[0x5] = E;
+ ((uw_object_hdr_t *)pcVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_16_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- *(char *)((byte *)pcVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- ((char *)pcVar4)[0x5]
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- *(char *)(pcVar4 + 0x5)
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_high
|
- pcVar4[0x5]
+ (char)((uw_object_hdr_t *)pcVar4)->chain_word_high
)
...>
}


@receiver_16_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x6) = (char)V;
- *(char *)((char *)pcVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pcVar4 + 0x6) = (char)V;
- *(byte *)((char *)pcVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x6) = (byte)V;
- *(char *)((char *)pcVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pcVar4 + 0x6) = (byte)V;
- *(byte *)((char *)pcVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pcVar4)->link_word = (ushort)V;

...>
}

@receiver_16_w_6_51_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(ushort *)((byte *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- ((ushort *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(ushort *)((ushort *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(ushort *)(pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
)
...>
}


@receiver_16_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(undefined2 *)((byte *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- ((undefined2 *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(undefined2 *)((undefined2 *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(undefined2 *)(pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
)
...>
}


@receiver_16_w_6_51_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_signed
|
- *(short *)((byte *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_signed
|
- ((short *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->link_word_signed
|
- *(short *)((short *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->link_word_signed
|
- *(short *)(pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_signed
)
...>
}


@receiver_16_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(byte *)((byte *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- ((byte *)pcVar4)[0x6]
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(byte *)((ushort *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- (byte)((ushort *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(byte *)(pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
)
...>
}


@receiver_16_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(undefined1 *)((byte *)pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- ((undefined1 *)pcVar4)[0x6]
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(undefined1 *)((ushort *)pcVar4 + 0x3)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- (undefined1)((ushort *)pcVar4)[0x3]
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(undefined1 *)(pcVar4 + 0x6)
+ ((uw_object_hdr_t *)pcVar4)->link_word_low
)
...>
}


@receiver_16_w_6_51_address_6@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_low
|
- &*(char *)((byte *)pcVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_low
|
- &((char *)pcVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_low
|
- &*(char *)((ushort *)pcVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_low
|
- &*(char *)(pcVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_low
|
- &pcVar4[0x6]
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_low
)
...>
}


@receiver_16_w_6_51_store_6@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_low = (byte)E;
|
- ((char *)pcVar4)[0x6] = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pcVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_low = (byte)E;
|
- *(char *)(pcVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_low = (byte)E;
|
- pcVar4[0x6] = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_16_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(char *)((byte *)pcVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
|
- ((char *)pcVar4)[0x6]
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(char *)((ushort *)pcVar4 + 0x3)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
|
- (char)((ushort *)pcVar4)[0x3]
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
|
- *(char *)(pcVar4 + 0x6)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
|
- pcVar4[0x6]
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_low
)
...>
}


@receiver_16_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pcVar4 + 0x7)
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
|
- *(byte *)((byte *)pcVar4 + 0x7)
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
|
- ((byte *)pcVar4)[0x7]
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
|
- *(byte *)(pcVar4 + 0x7)
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
)
...>
}


@receiver_16_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pcVar4 + 0x7)
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
|
- *(undefined1 *)((byte *)pcVar4 + 0x7)
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
|
- ((undefined1 *)pcVar4)[0x7]
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
|
- *(undefined1 *)(pcVar4 + 0x7)
+ ((uw_object_hdr_t *)pcVar4)->link_word_high
)
...>
}


@receiver_16_w_6_51_address_7@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pcVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_high
|
- &*(char *)((byte *)pcVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_high
|
- &((char *)pcVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_high
|
- &*(char *)(pcVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_high
|
- &pcVar4[0x7]
+ (char *)&((uw_object_hdr_t *)pcVar4)->link_word_high
)
...>
}


@receiver_16_w_6_51_store_7@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)pcVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_high = (byte)E;
|
- ((char *)pcVar4)[0x7] = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_high = (byte)E;
|
- *(char *)(pcVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_high = (byte)E;
|
- pcVar4[0x7] = E;
+ ((uw_object_hdr_t *)pcVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_16_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pcVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_high
|
- *(char *)((byte *)pcVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_high
|
- ((char *)pcVar4)[0x7]
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_high
|
- *(char *)(pcVar4 + 0x7)
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_high
|
- pcVar4[0x7]
+ (char)((uw_object_hdr_t *)pcVar4)->link_word_high
)
...>
}


@receiver_17_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x0) = (char)V;
- *(char *)((char *)pvVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x0) = (char)V;
- *(byte *)((char *)pvVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x0) = (byte)V;
- *(char *)((char *)pvVar5 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x0) = (byte)V;
- *(byte *)((char *)pvVar5 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->type_flags = (ushort)V;

...>
}

@receiver_17_w_0_0_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(ushort *)((byte *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- ((ushort *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(ushort *)((ushort *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(ushort *)(pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
)
...>
}


@receiver_17_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(undefined2 *)((byte *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- ((undefined2 *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(undefined2 *)((undefined2 *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(undefined2 *)(pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
)
...>
}


@receiver_17_w_0_0_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_signed
|
- *(short *)((byte *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_signed
|
- ((short *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_signed
|
- *(short *)((short *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_signed
|
- *(short *)(pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_signed
)
...>
}


@receiver_17_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(byte *)((byte *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- ((byte *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(byte *)((ushort *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- (byte)((ushort *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(byte *)pvVar5
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(byte *)(pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
)
...>
}


@receiver_17_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(undefined1 *)((byte *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- ((undefined1 *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(undefined1 *)((ushort *)pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- (undefined1)((ushort *)pvVar5)[0x0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(undefined1 *)pvVar5
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(undefined1 *)(pvVar5 + 0x0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low
)
...>
}


@receiver_17_w_0_0_address_0@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- &*(char *)((byte *)pvVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- &((char *)pvVar5)[0x0]
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- &*(char *)((ushort *)pvVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- &*(char *)pvVar5
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- &*(char *)(pvVar5 + 0x0)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_low
)
...>
}


@receiver_17_w_0_0_store_0@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low = (byte)E;
|
- ((char *)pvVar5)[0x0] = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pvVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low = (byte)E;
|
- *(char *)pvVar5 = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low = (byte)E;
|
- *(char *)(pvVar5 + 0x0) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_low = (byte)E;
)
...>
}


@receiver_17_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(char *)((byte *)pvVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- ((char *)pvVar5)[0x0]
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(char *)((ushort *)pvVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- (char)((ushort *)pvVar5)[0x0]
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(char *)pvVar5
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
|
- *(char *)(pvVar5 + 0x0)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_low
)
...>
}


@receiver_17_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- *(byte *)((byte *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- ((byte *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- *(byte *)(pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
)
...>
}


@receiver_17_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- *(undefined1 *)((byte *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- ((undefined1 *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- *(undefined1 *)(pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high
)
...>
}


@receiver_17_w_0_0_address_1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- &*(char *)((byte *)pvVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- &((char *)pvVar5)[0x1]
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- &*(char *)(pvVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pvVar5)->type_flags_high
)
...>
}


@receiver_17_w_0_0_store_1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high = (byte)E;
|
- ((char *)pvVar5)[0x1] = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high = (byte)E;
|
- *(char *)(pvVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pvVar5)->type_flags_high = (byte)E;
)
...>
}


@receiver_17_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- *(char *)((byte *)pvVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- ((char *)pvVar5)[0x1]
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_high
|
- *(char *)(pvVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pvVar5)->type_flags_high
)
...>
}


@receiver_17_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x2) = (char)V;
- *(char *)((char *)pvVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x2) = (char)V;
- *(byte *)((char *)pvVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x2) = (byte)V;
- *(char *)((char *)pvVar5 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x2) = (byte)V;
- *(byte *)((char *)pvVar5 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->position_word = (ushort)V;

...>
}

@receiver_17_w_2_17_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(ushort *)((byte *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- ((ushort *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(ushort *)((ushort *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(ushort *)(pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
)
...>
}


@receiver_17_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(undefined2 *)((byte *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- ((undefined2 *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(undefined2 *)((undefined2 *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(undefined2 *)(pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
)
...>
}


@receiver_17_w_2_17_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_signed
|
- *(short *)((byte *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_signed
|
- ((short *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->position_word_signed
|
- *(short *)((short *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->position_word_signed
|
- *(short *)(pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_signed
)
...>
}


@receiver_17_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(byte *)((byte *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- ((byte *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(byte *)((ushort *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- (byte)((ushort *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(byte *)(pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
)
...>
}


@receiver_17_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(undefined1 *)((byte *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- ((undefined1 *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(undefined1 *)((ushort *)pvVar5 + 0x1)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- (undefined1)((ushort *)pvVar5)[0x1]
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(undefined1 *)(pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->position_word_low
)
...>
}


@receiver_17_w_2_17_address_2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_low
|
- &*(char *)((byte *)pvVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_low
|
- &((char *)pvVar5)[0x2]
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_low
|
- &*(char *)((ushort *)pvVar5 + 0x1)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_low
|
- &*(char *)(pvVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_low
)
...>
}


@receiver_17_w_2_17_store_2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_low = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_low = (byte)E;
|
- ((char *)pvVar5)[0x2] = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pvVar5 + 0x1) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_low = (byte)E;
|
- *(char *)(pvVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_low = (byte)E;
)
...>
}


@receiver_17_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(char *)((byte *)pvVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_low
|
- ((char *)pvVar5)[0x2]
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(char *)((ushort *)pvVar5 + 0x1)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_low
|
- (char)((ushort *)pvVar5)[0x1]
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_low
|
- *(char *)(pvVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_low
)
...>
}


@receiver_17_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
|
- *(byte *)((byte *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
|
- ((byte *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
|
- *(byte *)(pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
)
...>
}


@receiver_17_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
|
- *(undefined1 *)((byte *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
|
- ((undefined1 *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
|
- *(undefined1 *)(pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->position_word_high
)
...>
}


@receiver_17_w_2_17_address_3@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_high
|
- &*(char *)((byte *)pvVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_high
|
- &((char *)pvVar5)[0x3]
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_high
|
- &*(char *)(pvVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pvVar5)->position_word_high
)
...>
}


@receiver_17_w_2_17_store_3@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_high = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_high = (byte)E;
|
- ((char *)pvVar5)[0x3] = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_high = (byte)E;
|
- *(char *)(pvVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pvVar5)->position_word_high = (byte)E;
)
...>
}


@receiver_17_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_high
|
- *(char *)((byte *)pvVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_high
|
- ((char *)pvVar5)[0x3]
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_high
|
- *(char *)(pvVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pvVar5)->position_word_high
)
...>
}


@receiver_17_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x4) = (char)V;
- *(char *)((char *)pvVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x4) = (char)V;
- *(byte *)((char *)pvVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x4) = (byte)V;
- *(char *)((char *)pvVar5 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x4) = (byte)V;
- *(byte *)((char *)pvVar5 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->chain_word = (ushort)V;

...>
}

@receiver_17_w_4_34_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(ushort *)((byte *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- ((ushort *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(ushort *)((ushort *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(ushort *)(pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
)
...>
}


@receiver_17_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(undefined2 *)((byte *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- ((undefined2 *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(undefined2 *)((undefined2 *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(undefined2 *)(pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
)
...>
}


@receiver_17_w_4_34_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_signed
|
- *(short *)((byte *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_signed
|
- ((short *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_signed
|
- *(short *)((short *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_signed
|
- *(short *)(pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_signed
)
...>
}


@receiver_17_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(byte *)((byte *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- ((byte *)pvVar5)[0x4]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(byte *)((ushort *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- (byte)((ushort *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(byte *)(pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
)
...>
}


@receiver_17_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(undefined1 *)((byte *)pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- ((undefined1 *)pvVar5)[0x4]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(undefined1 *)((ushort *)pvVar5 + 0x2)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- (undefined1)((ushort *)pvVar5)[0x2]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(undefined1 *)(pvVar5 + 0x4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low
)
...>
}


@receiver_17_w_4_34_address_4@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- &*(char *)((byte *)pvVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- &((char *)pvVar5)[0x4]
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- &*(char *)((ushort *)pvVar5 + 0x2)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- &*(char *)(pvVar5 + 0x4)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_low
)
...>
}


@receiver_17_w_4_34_store_4@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low = (byte)E;
|
- ((char *)pvVar5)[0x4] = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pvVar5 + 0x2) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low = (byte)E;
|
- *(char *)(pvVar5 + 0x4) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_low = (byte)E;
)
...>
}


@receiver_17_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x4)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(char *)((byte *)pvVar5 + 0x4)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- ((char *)pvVar5)[0x4]
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(char *)((ushort *)pvVar5 + 0x2)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- (char)((ushort *)pvVar5)[0x2]
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_low
|
- *(char *)(pvVar5 + 0x4)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_low
)
...>
}


@receiver_17_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x5)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- *(byte *)((byte *)pvVar5 + 0x5)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- ((byte *)pvVar5)[0x5]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- *(byte *)(pvVar5 + 0x5)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
)
...>
}


@receiver_17_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x5)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- *(undefined1 *)((byte *)pvVar5 + 0x5)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- ((undefined1 *)pvVar5)[0x5]
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- *(undefined1 *)(pvVar5 + 0x5)
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high
)
...>
}


@receiver_17_w_4_34_address_5@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- &*(char *)((byte *)pvVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- &((char *)pvVar5)[0x5]
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- &*(char *)(pvVar5 + 0x5)
+ (char *)&((uw_object_hdr_t *)pvVar5)->chain_word_high
)
...>
}


@receiver_17_w_4_34_store_5@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high = (byte)E;
|
- ((char *)pvVar5)[0x5] = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high = (byte)E;
|
- *(char *)(pvVar5 + 0x5) = E;
+ ((uw_object_hdr_t *)pvVar5)->chain_word_high = (byte)E;
)
...>
}


@receiver_17_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x5)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- *(char *)((byte *)pvVar5 + 0x5)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- ((char *)pvVar5)[0x5]
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_high
|
- *(char *)(pvVar5 + 0x5)
+ (char)((uw_object_hdr_t *)pvVar5)->chain_word_high
)
...>
}


@receiver_17_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x6) = (char)V;
- *(char *)((char *)pvVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pvVar5 + 0x6) = (char)V;
- *(byte *)((char *)pvVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x6) = (byte)V;
- *(char *)((char *)pvVar5 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pvVar5 + 0x6) = (byte)V;
- *(byte *)((char *)pvVar5 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pvVar5)->link_word = (ushort)V;

...>
}

@receiver_17_w_6_51_word_ushort@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(ushort *)((byte *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- ((ushort *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(ushort *)((ushort *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(ushort *)(pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
)
...>
}


@receiver_17_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(undefined2 *)((byte *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- ((undefined2 *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(undefined2 *)((undefined2 *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(undefined2 *)(pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
)
...>
}


@receiver_17_w_6_51_word_short@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_signed
|
- *(short *)((byte *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_signed
|
- ((short *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->link_word_signed
|
- *(short *)((short *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->link_word_signed
|
- *(short *)(pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_signed
)
...>
}


@receiver_17_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(byte *)((byte *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- ((byte *)pvVar5)[0x6]
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(byte *)((ushort *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- (byte)((ushort *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(byte *)(pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
)
...>
}


@receiver_17_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(undefined1 *)((byte *)pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- ((undefined1 *)pvVar5)[0x6]
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(undefined1 *)((ushort *)pvVar5 + 0x3)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- (undefined1)((ushort *)pvVar5)[0x3]
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(undefined1 *)(pvVar5 + 0x6)
+ ((uw_object_hdr_t *)pvVar5)->link_word_low
)
...>
}


@receiver_17_w_6_51_address_6@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_low
|
- &*(char *)((byte *)pvVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_low
|
- &((char *)pvVar5)[0x6]
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_low
|
- &*(char *)((ushort *)pvVar5 + 0x3)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_low
|
- &*(char *)(pvVar5 + 0x6)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_low
)
...>
}


@receiver_17_w_6_51_store_6@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_low = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_low = (byte)E;
|
- ((char *)pvVar5)[0x6] = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pvVar5 + 0x3) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_low = (byte)E;
|
- *(char *)(pvVar5 + 0x6) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_low = (byte)E;
)
...>
}


@receiver_17_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x6)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(char *)((byte *)pvVar5 + 0x6)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_low
|
- ((char *)pvVar5)[0x6]
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(char *)((ushort *)pvVar5 + 0x3)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_low
|
- (char)((ushort *)pvVar5)[0x3]
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_low
|
- *(char *)(pvVar5 + 0x6)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_low
)
...>
}


@receiver_17_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pvVar5 + 0x7)
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
|
- *(byte *)((byte *)pvVar5 + 0x7)
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
|
- ((byte *)pvVar5)[0x7]
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
|
- *(byte *)(pvVar5 + 0x7)
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
)
...>
}


@receiver_17_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pvVar5 + 0x7)
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
|
- *(undefined1 *)((byte *)pvVar5 + 0x7)
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
|
- ((undefined1 *)pvVar5)[0x7]
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
|
- *(undefined1 *)(pvVar5 + 0x7)
+ ((uw_object_hdr_t *)pvVar5)->link_word_high
)
...>
}


@receiver_17_w_6_51_address_7@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pvVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_high
|
- &*(char *)((byte *)pvVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_high
|
- &((char *)pvVar5)[0x7]
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_high
|
- &*(char *)(pvVar5 + 0x7)
+ (char *)&((uw_object_hdr_t *)pvVar5)->link_word_high
)
...>
}


@receiver_17_w_6_51_store_7@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_high = (byte)E;
|
- *(char *)((byte *)pvVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_high = (byte)E;
|
- ((char *)pvVar5)[0x7] = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_high = (byte)E;
|
- *(char *)(pvVar5 + 0x7) = E;
+ ((uw_object_hdr_t *)pvVar5)->link_word_high = (byte)E;
)
...>
}


@receiver_17_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pvVar5 + 0x7)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_high
|
- *(char *)((byte *)pvVar5 + 0x7)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_high
|
- ((char *)pvVar5)[0x7]
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_high
|
- *(char *)(pvVar5 + 0x7)
+ (char)((uw_object_hdr_t *)pvVar5)->link_word_high
)
...>
}


@receiver_18_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x0) = (char)V;
- *(char *)((char *)iVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_18_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x0) = (char)V;
- *(byte *)((char *)iVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_18_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x0) = (byte)V;
- *(char *)((char *)iVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_18_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x0) = (byte)V;
- *(byte *)((char *)iVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->type_flags = (ushort)V;

...>
}

@receiver_18_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- ((ushort *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)((ushort *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}


@receiver_18_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(undefined2 *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- ((undefined2 *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}


@receiver_18_w_0_0_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
|
- *(short *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
|
- ((short *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
|
- *(short *)((short *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_signed
)
...>
}


@receiver_18_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(byte *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- ((byte *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(byte *)((ushort *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- (byte)((ushort *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(byte *)iVar3
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_18_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(undefined1 *)((byte *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- ((undefined1 *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x0)
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- (undefined1)((ushort *)iVar3)[0x0]
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(undefined1 *)iVar3
+ ((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_18_w_0_0_address_0@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*(char *)((byte *)iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &((char *)iVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*(char *)((ushort *)iVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
|
- &*(char *)iVar3
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_18_w_0_0_store_0@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- ((char *)iVar3)[0x0] = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
|
- *(char *)iVar3 = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_18_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(char *)((byte *)iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- ((char *)iVar3)[0x0]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(char *)((ushort *)iVar3 + 0x0)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- (char)((ushort *)iVar3)[0x0]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
|
- *(char *)iVar3
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_low
)
...>
}


@receiver_18_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- *(byte *)((byte *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- ((byte *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_18_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- *(undefined1 *)((byte *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
|
- ((undefined1 *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_18_w_0_0_address_1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
|
- &*(char *)((byte *)iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
|
- &((char *)iVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_18_w_0_0_store_1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
|
- ((char *)iVar3)[0x1] = E;
+ ((uw_object_hdr_t *)iVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_18_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
|
- *(char *)((byte *)iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
|
- ((char *)iVar3)[0x1]
+ (char)((uw_object_hdr_t *)iVar3)->type_flags_high
)
...>
}


@receiver_18_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x2) = (char)V;
- *(char *)((char *)iVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_18_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x2) = (char)V;
- *(byte *)((char *)iVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_18_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x2) = (byte)V;
- *(char *)((char *)iVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_18_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x2) = (byte)V;
- *(byte *)((char *)iVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->position_word = (ushort)V;

...>
}

@receiver_18_w_2_17_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(ushort *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- ((ushort *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(ushort *)((ushort *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}


@receiver_18_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(undefined2 *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- ((undefined2 *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}


@receiver_18_w_2_17_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
|
- *(short *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
|
- ((short *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
|
- *(short *)((short *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word_signed
)
...>
}


@receiver_18_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(byte *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- ((byte *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(byte *)((ushort *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- (byte)((ushort *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_18_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(undefined1 *)((byte *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- ((undefined1 *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x1)
+ ((uw_object_hdr_t *)iVar3)->position_word_low
|
- (undefined1)((ushort *)iVar3)[0x1]
+ ((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_18_w_2_17_address_2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &*(char *)((byte *)iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &((char *)iVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
|
- &*(char *)((ushort *)iVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_18_w_2_17_store_2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- ((char *)iVar3)[0x2] = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_18_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(char *)((byte *)iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- ((char *)iVar3)[0x2]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- *(char *)((ushort *)iVar3 + 0x1)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
|
- (char)((ushort *)iVar3)[0x1]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_low
)
...>
}


@receiver_18_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- *(byte *)((byte *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- ((byte *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_18_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- *(undefined1 *)((byte *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->position_word_high
|
- ((undefined1 *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_18_w_2_17_address_3@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
|
- &*(char *)((byte *)iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
|
- &((char *)iVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_18_w_2_17_store_3@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
|
- ((char *)iVar3)[0x3] = E;
+ ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_18_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
|
- *(char *)((byte *)iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
|
- ((char *)iVar3)[0x3]
+ (char)((uw_object_hdr_t *)iVar3)->position_word_high
)
...>
}


@receiver_18_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x4) = (char)V;
- *(char *)((char *)iVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_18_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x4) = (char)V;
- *(byte *)((char *)iVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_18_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x4) = (byte)V;
- *(char *)((char *)iVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_18_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x4) = (byte)V;
- *(byte *)((char *)iVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->chain_word = (ushort)V;

...>
}

@receiver_18_w_4_34_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(ushort *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- ((ushort *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(ushort *)((ushort *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}


@receiver_18_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(undefined2 *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- ((undefined2 *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}


@receiver_18_w_4_34_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
|
- *(short *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
|
- ((short *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
|
- *(short *)((short *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word_signed
)
...>
}


@receiver_18_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(byte *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- ((byte *)iVar3)[0x4]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(byte *)((ushort *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- (byte)((ushort *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_18_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(undefined1 *)((byte *)iVar3 + 0x4)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- ((undefined1 *)iVar3)[0x4]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x2)
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
|
- (undefined1)((ushort *)iVar3)[0x2]
+ ((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_18_w_4_34_address_4@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &*(char *)((byte *)iVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &((char *)iVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
|
- &*(char *)((ushort *)iVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_18_w_4_34_store_4@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- ((char *)iVar3)[0x4] = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_18_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x4)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(char *)((byte *)iVar3 + 0x4)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- ((char *)iVar3)[0x4]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- *(char *)((ushort *)iVar3 + 0x2)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
|
- (char)((ushort *)iVar3)[0x2]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_low
)
...>
}


@receiver_18_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- *(byte *)((byte *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- ((byte *)iVar3)[0x5]
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_18_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- *(undefined1 *)((byte *)iVar3 + 0x5)
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
|
- ((undefined1 *)iVar3)[0x5]
+ ((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_18_w_4_34_address_5@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
|
- &*(char *)((byte *)iVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
|
- &((char *)iVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_18_w_4_34_store_5@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
|
- ((char *)iVar3)[0x5] = E;
+ ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_18_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x5)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
|
- *(char *)((byte *)iVar3 + 0x5)
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
|
- ((char *)iVar3)[0x5]
+ (char)((uw_object_hdr_t *)iVar3)->chain_word_high
)
...>
}


@receiver_18_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x6) = (char)V;
- *(char *)((char *)iVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_18_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar3 + 0x6) = (char)V;
- *(byte *)((char *)iVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_18_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x6) = (byte)V;
- *(char *)((char *)iVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_18_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar3 + 0x6) = (byte)V;
- *(byte *)((char *)iVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar3)->link_word = (ushort)V;

...>
}

@receiver_18_w_6_51_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(ushort *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- ((ushort *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(ushort *)((ushort *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}


@receiver_18_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(undefined2 *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- ((undefined2 *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(undefined2 *)((undefined2 *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}


@receiver_18_w_6_51_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
|
- *(short *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
|
- ((short *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
|
- *(short *)((short *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word_signed
)
...>
}


@receiver_18_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(byte *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- ((byte *)iVar3)[0x6]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(byte *)((ushort *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- (byte)((ushort *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_18_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(undefined1 *)((byte *)iVar3 + 0x6)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- ((undefined1 *)iVar3)[0x6]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(undefined1 *)((ushort *)iVar3 + 0x3)
+ ((uw_object_hdr_t *)iVar3)->link_word_low
|
- (undefined1)((ushort *)iVar3)[0x3]
+ ((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_18_w_6_51_address_6@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &*(char *)((byte *)iVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &((char *)iVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
|
- &*(char *)((ushort *)iVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_18_w_6_51_store_6@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- ((char *)iVar3)[0x6] = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_18_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x6)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(char *)((byte *)iVar3 + 0x6)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- ((char *)iVar3)[0x6]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- *(char *)((ushort *)iVar3 + 0x3)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
|
- (char)((ushort *)iVar3)[0x3]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_low
)
...>
}


@receiver_18_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- *(byte *)((byte *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- ((byte *)iVar3)[0x7]
+ ((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_18_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- *(undefined1 *)((byte *)iVar3 + 0x7)
+ ((uw_object_hdr_t *)iVar3)->link_word_high
|
- ((undefined1 *)iVar3)[0x7]
+ ((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_18_w_6_51_address_7@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
|
- &*(char *)((byte *)iVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
|
- &((char *)iVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_18_w_6_51_store_7@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
|
- ((char *)iVar3)[0x7] = E;
+ ((uw_object_hdr_t *)iVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_18_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar3 + 0x7)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
|
- *(char *)((byte *)iVar3 + 0x7)
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
|
- ((char *)iVar3)[0x7]
+ (char)((uw_object_hdr_t *)iVar3)->link_word_high
)
...>
}


@receiver_19_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x0) = (char)V;
- *(char *)((char *)iVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_19_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x0) = (char)V;
- *(byte *)((char *)iVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_19_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x0) = (byte)V;
- *(char *)((char *)iVar4 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_19_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x0) = (byte)V;
- *(byte *)((char *)iVar4 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->type_flags = (ushort)V;

...>
}

@receiver_19_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(ushort *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- ((ushort *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(ushort *)((ushort *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}


@receiver_19_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(undefined2 *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- ((undefined2 *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}


@receiver_19_w_0_0_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
|
- *(short *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
|
- ((short *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
|
- *(short *)((short *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_signed
)
...>
}


@receiver_19_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(byte *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- ((byte *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(byte *)((ushort *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- (byte)((ushort *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(byte *)iVar4
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_19_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(undefined1 *)((byte *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- ((undefined1 *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x0)
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- (undefined1)((ushort *)iVar4)[0x0]
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(undefined1 *)iVar4
+ ((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_19_w_0_0_address_0@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)((byte *)iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &((char *)iVar4)[0x0]
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)((ushort *)iVar4 + 0x0)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
|
- &*(char *)iVar4
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_19_w_0_0_store_0@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- ((char *)iVar4)[0x0] = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x0) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
|
- *(char *)iVar4 = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_low = (byte)E;
)
...>
}


@receiver_19_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(char *)((byte *)iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- ((char *)iVar4)[0x0]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(char *)((ushort *)iVar4 + 0x0)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- (char)((ushort *)iVar4)[0x0]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
|
- *(char *)iVar4
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_low
)
...>
}


@receiver_19_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- *(byte *)((byte *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- ((byte *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_19_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- *(undefined1 *)((byte *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
|
- ((undefined1 *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_19_w_0_0_address_1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
|
- &*(char *)((byte *)iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
|
- &((char *)iVar4)[0x1]
+ (char *)&((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_19_w_0_0_store_1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
|
- ((char *)iVar4)[0x1] = E;
+ ((uw_object_hdr_t *)iVar4)->type_flags_high = (byte)E;
)
...>
}


@receiver_19_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
|
- *(char *)((byte *)iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
|
- ((char *)iVar4)[0x1]
+ (char)((uw_object_hdr_t *)iVar4)->type_flags_high
)
...>
}


@receiver_19_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x2) = (char)V;
- *(char *)((char *)iVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_19_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x2) = (char)V;
- *(byte *)((char *)iVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_19_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x2) = (byte)V;
- *(char *)((char *)iVar4 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_19_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x2) = (byte)V;
- *(byte *)((char *)iVar4 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->position_word = (ushort)V;

...>
}

@receiver_19_w_2_17_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(ushort *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- ((ushort *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(ushort *)((ushort *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}


@receiver_19_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(undefined2 *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- ((undefined2 *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}


@receiver_19_w_2_17_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
|
- *(short *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
|
- ((short *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
|
- *(short *)((short *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word_signed
)
...>
}


@receiver_19_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(byte *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- ((byte *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(byte *)((ushort *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- (byte)((ushort *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_19_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(undefined1 *)((byte *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- ((undefined1 *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x1)
+ ((uw_object_hdr_t *)iVar4)->position_word_low
|
- (undefined1)((ushort *)iVar4)[0x1]
+ ((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_19_w_2_17_address_2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &*(char *)((byte *)iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &((char *)iVar4)[0x2]
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
|
- &*(char *)((ushort *)iVar4 + 0x1)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_19_w_2_17_store_2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- ((char *)iVar4)[0x2] = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x1) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_low = (byte)E;
)
...>
}


@receiver_19_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(char *)((byte *)iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- ((char *)iVar4)[0x2]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- *(char *)((ushort *)iVar4 + 0x1)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
|
- (char)((ushort *)iVar4)[0x1]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_low
)
...>
}


@receiver_19_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- *(byte *)((byte *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- ((byte *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_19_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- *(undefined1 *)((byte *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->position_word_high
|
- ((undefined1 *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_19_w_2_17_address_3@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
|
- &*(char *)((byte *)iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
|
- &((char *)iVar4)[0x3]
+ (char *)&((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_19_w_2_17_store_3@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
|
- ((char *)iVar4)[0x3] = E;
+ ((uw_object_hdr_t *)iVar4)->position_word_high = (byte)E;
)
...>
}


@receiver_19_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
|
- *(char *)((byte *)iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
|
- ((char *)iVar4)[0x3]
+ (char)((uw_object_hdr_t *)iVar4)->position_word_high
)
...>
}


@receiver_19_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x4) = (char)V;
- *(char *)((char *)iVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_19_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x4) = (char)V;
- *(byte *)((char *)iVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_19_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x4) = (byte)V;
- *(char *)((char *)iVar4 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_19_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x4) = (byte)V;
- *(byte *)((char *)iVar4 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->chain_word = (ushort)V;

...>
}

@receiver_19_w_4_34_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(ushort *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- ((ushort *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(ushort *)((ushort *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}


@receiver_19_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(undefined2 *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- ((undefined2 *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}


@receiver_19_w_4_34_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
|
- *(short *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
|
- ((short *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
|
- *(short *)((short *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word_signed
)
...>
}


@receiver_19_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(byte *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- ((byte *)iVar4)[0x4]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(byte *)((ushort *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- (byte)((ushort *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_19_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(undefined1 *)((byte *)iVar4 + 0x4)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- ((undefined1 *)iVar4)[0x4]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x2)
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
|
- (undefined1)((ushort *)iVar4)[0x2]
+ ((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_19_w_4_34_address_4@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &*(char *)((byte *)iVar4 + 0x4)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &((char *)iVar4)[0x4]
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
|
- &*(char *)((ushort *)iVar4 + 0x2)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_19_w_4_34_store_4@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x4) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- ((char *)iVar4)[0x4] = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x2) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_low = (byte)E;
)
...>
}


@receiver_19_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x4)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(char *)((byte *)iVar4 + 0x4)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- ((char *)iVar4)[0x4]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- *(char *)((ushort *)iVar4 + 0x2)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
|
- (char)((ushort *)iVar4)[0x2]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_low
)
...>
}


@receiver_19_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- *(byte *)((byte *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- ((byte *)iVar4)[0x5]
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_19_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- *(undefined1 *)((byte *)iVar4 + 0x5)
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
|
- ((undefined1 *)iVar4)[0x5]
+ ((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_19_w_4_34_address_5@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
|
- &*(char *)((byte *)iVar4 + 0x5)
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
|
- &((char *)iVar4)[0x5]
+ (char *)&((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_19_w_4_34_store_5@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x5) = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
|
- ((char *)iVar4)[0x5] = E;
+ ((uw_object_hdr_t *)iVar4)->chain_word_high = (byte)E;
)
...>
}


@receiver_19_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x5)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
|
- *(char *)((byte *)iVar4 + 0x5)
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
|
- ((char *)iVar4)[0x5]
+ (char)((uw_object_hdr_t *)iVar4)->chain_word_high
)
...>
}


@receiver_19_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x6) = (char)V;
- *(char *)((char *)iVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_19_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)iVar4 + 0x6) = (char)V;
- *(byte *)((char *)iVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_19_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x6) = (byte)V;
- *(char *)((char *)iVar4 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_19_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)iVar4 + 0x6) = (byte)V;
- *(byte *)((char *)iVar4 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)iVar4)->link_word = (ushort)V;

...>
}

@receiver_19_w_6_51_word_ushort@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(ushort *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- ((ushort *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(ushort *)((ushort *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}


@receiver_19_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(undefined2 *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- ((undefined2 *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- *(undefined2 *)((undefined2 *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}


@receiver_19_w_6_51_word_short@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
|
- *(short *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
|
- ((short *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
|
- *(short *)((short *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word_signed
)
...>
}


@receiver_19_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(byte *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- ((byte *)iVar4)[0x6]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(byte *)((ushort *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- (byte)((ushort *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_19_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(undefined1 *)((byte *)iVar4 + 0x6)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- ((undefined1 *)iVar4)[0x6]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(undefined1 *)((ushort *)iVar4 + 0x3)
+ ((uw_object_hdr_t *)iVar4)->link_word_low
|
- (undefined1)((ushort *)iVar4)[0x3]
+ ((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_19_w_6_51_address_6@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &*(char *)((byte *)iVar4 + 0x6)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &((char *)iVar4)[0x6]
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
|
- &*(char *)((ushort *)iVar4 + 0x3)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_19_w_6_51_store_6@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x6) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- ((char *)iVar4)[0x6] = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
|
- *(char *)((ushort *)iVar4 + 0x3) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_low = (byte)E;
)
...>
}


@receiver_19_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x6)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(char *)((byte *)iVar4 + 0x6)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- ((char *)iVar4)[0x6]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- *(char *)((ushort *)iVar4 + 0x3)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
|
- (char)((ushort *)iVar4)[0x3]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_low
)
...>
}


@receiver_19_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- *(byte *)((byte *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- ((byte *)iVar4)[0x7]
+ ((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_19_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- *(undefined1 *)((byte *)iVar4 + 0x7)
+ ((uw_object_hdr_t *)iVar4)->link_word_high
|
- ((undefined1 *)iVar4)[0x7]
+ ((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_19_w_6_51_address_7@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)iVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
|
- &*(char *)((byte *)iVar4 + 0x7)
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
|
- &((char *)iVar4)[0x7]
+ (char *)&((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_19_w_6_51_store_7@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
|
- *(char *)((byte *)iVar4 + 0x7) = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
|
- ((char *)iVar4)[0x7] = E;
+ ((uw_object_hdr_t *)iVar4)->link_word_high = (byte)E;
)
...>
}


@receiver_19_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar4 + 0x7)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
|
- *(char *)((byte *)iVar4 + 0x7)
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
|
- ((char *)iVar4)[0x7]
+ (char)((uw_object_hdr_t *)iVar4)->link_word_high
)
...>
}


@receiver_20_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x0) = (char)V;
- *(char *)((char *)puVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x0) = (char)V;
- *(byte *)((char *)puVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x0) = (byte)V;
- *(char *)((char *)puVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x0) = (byte)V;
- *(byte *)((char *)puVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_20_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_20_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((undefined2 *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_20_w_0_0_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- ((short *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)((short *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
)
...>
}


@receiver_20_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((byte *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (byte)((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_20_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((undefined1 *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (undefined1)((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_20_w_0_0_address_0@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)((byte *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &((char *)puVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)((ushort *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)puVar2
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_20_w_0_0_store_0@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- ((char *)puVar2)[0x0] = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)puVar2 = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_20_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)((byte *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((char *)puVar2)[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)((ushort *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (char)((ushort *)puVar2)[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)puVar2
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_20_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(byte *)((byte *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((byte *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_20_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(undefined1 *)((byte *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((undefined1 *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_20_w_0_0_address_1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
|
- &*(char *)((byte *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
|
- &((char *)puVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_20_w_0_0_store_1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
|
- ((char *)puVar2)[0x1] = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_20_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(char *)((byte *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((char *)puVar2)[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_20_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x2) = (char)V;
- *(char *)((char *)puVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x2) = (char)V;
- *(byte *)((char *)puVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x2) = (byte)V;
- *(char *)((char *)puVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x2) = (byte)V;
- *(byte *)((char *)puVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_20_w_2_17_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_20_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((undefined2 *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_20_w_2_17_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- ((short *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)((short *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
)
...>
}


@receiver_20_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((byte *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (byte)((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_20_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((undefined1 *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (undefined1)((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_20_w_2_17_address_2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)((byte *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &((char *)puVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)((ushort *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_20_w_2_17_store_2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- ((char *)puVar2)[0x2] = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_20_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)((byte *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((char *)puVar2)[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)((ushort *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- (char)((ushort *)puVar2)[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_20_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(byte *)((byte *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((byte *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_20_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((undefined1 *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_20_w_2_17_address_3@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
|
- &*(char *)((byte *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
|
- &((char *)puVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_20_w_2_17_store_3@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
|
- ((char *)puVar2)[0x3] = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_20_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(char *)((byte *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((char *)puVar2)[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_20_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x4) = (char)V;
- *(char *)((char *)puVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x4) = (char)V;
- *(byte *)((char *)puVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x4) = (byte)V;
- *(char *)((char *)puVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x4) = (byte)V;
- *(byte *)((char *)puVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_20_w_4_34_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_20_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((undefined2 *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_20_w_4_34_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- ((short *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)((short *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
)
...>
}


@receiver_20_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((byte *)puVar2)[0x4]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (byte)((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_20_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((undefined1 *)puVar2)[0x4]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (undefined1)((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_20_w_4_34_address_4@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)((byte *)puVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &((char *)puVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)((ushort *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_20_w_4_34_store_4@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- ((char *)puVar2)[0x4] = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_20_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x4)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)((byte *)puVar2 + 0x4)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((char *)puVar2)[0x4]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)((ushort *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (char)((ushort *)puVar2)[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_20_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(byte *)((byte *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((byte *)puVar2)[0x5]
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_20_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((undefined1 *)puVar2)[0x5]
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_20_w_4_34_address_5@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
|
- &*(char *)((byte *)puVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
|
- &((char *)puVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_20_w_4_34_store_5@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
|
- ((char *)puVar2)[0x5] = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_20_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x5)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(char *)((byte *)puVar2 + 0x5)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((char *)puVar2)[0x5]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_20_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x6) = (char)V;
- *(char *)((char *)puVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x6) = (char)V;
- *(byte *)((char *)puVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x6) = (byte)V;
- *(char *)((char *)puVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x6) = (byte)V;
- *(byte *)((char *)puVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_20_w_6_51_word_ushort@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_20_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((undefined2 *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_20_w_6_51_word_short@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- ((short *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)((short *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
)
...>
}


@receiver_20_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((byte *)puVar2)[0x6]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (byte)((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_20_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((undefined1 *)puVar2)[0x6]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (undefined1)((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_20_w_6_51_address_6@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)((byte *)puVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &((char *)puVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)((ushort *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_20_w_6_51_store_6@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- ((char *)puVar2)[0x6] = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_20_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x6)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)((byte *)puVar2 + 0x6)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((char *)puVar2)[0x6]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)((ushort *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- (char)((ushort *)puVar2)[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_20_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(byte *)((byte *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((byte *)puVar2)[0x7]
+ ((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_20_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((undefined1 *)puVar2)[0x7]
+ ((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_20_w_6_51_address_7@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
|
- &*(char *)((byte *)puVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
|
- &((char *)puVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_20_w_6_51_store_7@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
|
- ((char *)puVar2)[0x7] = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_20_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x7)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(char *)((byte *)puVar2 + 0x7)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((char *)puVar2)[0x7]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_21_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x0) = (char)V;
- *(char *)((char *)found + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x0) = (char)V;
- *(byte *)((char *)found + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x0) = (byte)V;
- *(char *)((char *)found + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x0) = (byte)V;
- *(byte *)((char *)found + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->type_flags = (ushort)V;

...>
}

@receiver_21_w_0_0_word_ushort@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(ushort *)((byte *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- ((ushort *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(ushort *)((ushort *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(ushort *)(found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- found[0x0]
+ ((uw_object_hdr_t *)found)->type_flags
|
- *found
+ ((uw_object_hdr_t *)found)->type_flags
)
...>
}


@receiver_21_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(undefined2 *)((byte *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- ((undefined2 *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(undefined2 *)((undefined2 *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(undefined2 *)(found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- found[0x0]
+ ((uw_object_hdr_t *)found)->type_flags
|
- *found
+ ((uw_object_hdr_t *)found)->type_flags
)
...>
}


@receiver_21_w_0_0_word_short@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_signed
|
- *(short *)((byte *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_signed
|
- ((short *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_signed
|
- *(short *)((short *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_signed
|
- *(short *)(found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_signed
)
...>
}


@receiver_21_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(byte *)((byte *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- ((byte *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(byte *)((ushort *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- (byte)((ushort *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(byte *)found
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(byte *)(found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- (byte)found[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_low
)
...>
}


@receiver_21_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(undefined1 *)((byte *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- ((undefined1 *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(undefined1 *)((ushort *)found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- (undefined1)((ushort *)found)[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(undefined1 *)found
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- *(undefined1 *)(found + 0x0)
+ ((uw_object_hdr_t *)found)->type_flags_low
|
- (undefined1)found[0x0]
+ ((uw_object_hdr_t *)found)->type_flags_low
)
...>
}


@receiver_21_w_0_0_address_0@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x0)
+ (char *)&((uw_object_hdr_t *)found)->type_flags_low
|
- &*(char *)((byte *)found + 0x0)
+ (char *)&((uw_object_hdr_t *)found)->type_flags_low
|
- &((char *)found)[0x0]
+ (char *)&((uw_object_hdr_t *)found)->type_flags_low
|
- &*(char *)((ushort *)found + 0x0)
+ (char *)&((uw_object_hdr_t *)found)->type_flags_low
|
- &*(char *)found
+ (char *)&((uw_object_hdr_t *)found)->type_flags_low
|
- &*(char *)(found + 0x0)
+ (char *)&((uw_object_hdr_t *)found)->type_flags_low
)
...>
}


@receiver_21_w_0_0_store_0@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x0) = E;
+ ((uw_object_hdr_t *)found)->type_flags_low = (byte)E;
|
- *(char *)((byte *)found + 0x0) = E;
+ ((uw_object_hdr_t *)found)->type_flags_low = (byte)E;
|
- ((char *)found)[0x0] = E;
+ ((uw_object_hdr_t *)found)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)found + 0x0) = E;
+ ((uw_object_hdr_t *)found)->type_flags_low = (byte)E;
|
- *(char *)found = E;
+ ((uw_object_hdr_t *)found)->type_flags_low = (byte)E;
|
- *(char *)(found + 0x0) = E;
+ ((uw_object_hdr_t *)found)->type_flags_low = (byte)E;
)
...>
}


@receiver_21_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x0)
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- *(char *)((byte *)found + 0x0)
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- ((char *)found)[0x0]
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- *(char *)((ushort *)found + 0x0)
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- (char)((ushort *)found)[0x0]
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- *(char *)found
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- *(char *)(found + 0x0)
+ (char)((uw_object_hdr_t *)found)->type_flags_low
|
- (char)found[0x0]
+ (char)((uw_object_hdr_t *)found)->type_flags_low
)
...>
}


@receiver_21_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x1)
+ ((uw_object_hdr_t *)found)->type_flags_high
|
- *(byte *)((byte *)found + 0x1)
+ ((uw_object_hdr_t *)found)->type_flags_high
|
- ((byte *)found)[0x1]
+ ((uw_object_hdr_t *)found)->type_flags_high
)
...>
}


@receiver_21_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x1)
+ ((uw_object_hdr_t *)found)->type_flags_high
|
- *(undefined1 *)((byte *)found + 0x1)
+ ((uw_object_hdr_t *)found)->type_flags_high
|
- ((undefined1 *)found)[0x1]
+ ((uw_object_hdr_t *)found)->type_flags_high
)
...>
}


@receiver_21_w_0_0_address_1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x1)
+ (char *)&((uw_object_hdr_t *)found)->type_flags_high
|
- &*(char *)((byte *)found + 0x1)
+ (char *)&((uw_object_hdr_t *)found)->type_flags_high
|
- &((char *)found)[0x1]
+ (char *)&((uw_object_hdr_t *)found)->type_flags_high
)
...>
}


@receiver_21_w_0_0_store_1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x1) = E;
+ ((uw_object_hdr_t *)found)->type_flags_high = (byte)E;
|
- *(char *)((byte *)found + 0x1) = E;
+ ((uw_object_hdr_t *)found)->type_flags_high = (byte)E;
|
- ((char *)found)[0x1] = E;
+ ((uw_object_hdr_t *)found)->type_flags_high = (byte)E;
)
...>
}


@receiver_21_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x1)
+ (char)((uw_object_hdr_t *)found)->type_flags_high
|
- *(char *)((byte *)found + 0x1)
+ (char)((uw_object_hdr_t *)found)->type_flags_high
|
- ((char *)found)[0x1]
+ (char)((uw_object_hdr_t *)found)->type_flags_high
)
...>
}


@receiver_21_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x2) = (char)V;
- *(char *)((char *)found + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x2) = (char)V;
- *(byte *)((char *)found + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x2) = (byte)V;
- *(char *)((char *)found + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x2) = (byte)V;
- *(byte *)((char *)found + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->position_word = (ushort)V;

...>
}

@receiver_21_w_2_17_word_ushort@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word
|
- *(ushort *)((byte *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word
|
- ((ushort *)found)[0x1]
+ ((uw_object_hdr_t *)found)->position_word
|
- *(ushort *)((ushort *)found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word
|
- *(ushort *)(found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word
|
- found[0x1]
+ ((uw_object_hdr_t *)found)->position_word
)
...>
}


@receiver_21_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word
|
- *(undefined2 *)((byte *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word
|
- ((undefined2 *)found)[0x1]
+ ((uw_object_hdr_t *)found)->position_word
|
- *(undefined2 *)((undefined2 *)found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word
|
- *(undefined2 *)(found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word
|
- found[0x1]
+ ((uw_object_hdr_t *)found)->position_word
)
...>
}


@receiver_21_w_2_17_word_short@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word_signed
|
- *(short *)((byte *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word_signed
|
- ((short *)found)[0x1]
+ ((uw_object_hdr_t *)found)->position_word_signed
|
- *(short *)((short *)found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word_signed
|
- *(short *)(found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word_signed
)
...>
}


@receiver_21_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- *(byte *)((byte *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- ((byte *)found)[0x2]
+ ((uw_object_hdr_t *)found)->position_word_low
|
- *(byte *)((ushort *)found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- (byte)((ushort *)found)[0x1]
+ ((uw_object_hdr_t *)found)->position_word_low
|
- *(byte *)(found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- (byte)found[0x1]
+ ((uw_object_hdr_t *)found)->position_word_low
)
...>
}


@receiver_21_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- *(undefined1 *)((byte *)found + 0x2)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- ((undefined1 *)found)[0x2]
+ ((uw_object_hdr_t *)found)->position_word_low
|
- *(undefined1 *)((ushort *)found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- (undefined1)((ushort *)found)[0x1]
+ ((uw_object_hdr_t *)found)->position_word_low
|
- *(undefined1 *)(found + 0x1)
+ ((uw_object_hdr_t *)found)->position_word_low
|
- (undefined1)found[0x1]
+ ((uw_object_hdr_t *)found)->position_word_low
)
...>
}


@receiver_21_w_2_17_address_2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x2)
+ (char *)&((uw_object_hdr_t *)found)->position_word_low
|
- &*(char *)((byte *)found + 0x2)
+ (char *)&((uw_object_hdr_t *)found)->position_word_low
|
- &((char *)found)[0x2]
+ (char *)&((uw_object_hdr_t *)found)->position_word_low
|
- &*(char *)((ushort *)found + 0x1)
+ (char *)&((uw_object_hdr_t *)found)->position_word_low
|
- &*(char *)(found + 0x1)
+ (char *)&((uw_object_hdr_t *)found)->position_word_low
)
...>
}


@receiver_21_w_2_17_store_2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x2) = E;
+ ((uw_object_hdr_t *)found)->position_word_low = (byte)E;
|
- *(char *)((byte *)found + 0x2) = E;
+ ((uw_object_hdr_t *)found)->position_word_low = (byte)E;
|
- ((char *)found)[0x2] = E;
+ ((uw_object_hdr_t *)found)->position_word_low = (byte)E;
|
- *(char *)((ushort *)found + 0x1) = E;
+ ((uw_object_hdr_t *)found)->position_word_low = (byte)E;
|
- *(char *)(found + 0x1) = E;
+ ((uw_object_hdr_t *)found)->position_word_low = (byte)E;
)
...>
}


@receiver_21_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x2)
+ (char)((uw_object_hdr_t *)found)->position_word_low
|
- *(char *)((byte *)found + 0x2)
+ (char)((uw_object_hdr_t *)found)->position_word_low
|
- ((char *)found)[0x2]
+ (char)((uw_object_hdr_t *)found)->position_word_low
|
- *(char *)((ushort *)found + 0x1)
+ (char)((uw_object_hdr_t *)found)->position_word_low
|
- (char)((ushort *)found)[0x1]
+ (char)((uw_object_hdr_t *)found)->position_word_low
|
- *(char *)(found + 0x1)
+ (char)((uw_object_hdr_t *)found)->position_word_low
|
- (char)found[0x1]
+ (char)((uw_object_hdr_t *)found)->position_word_low
)
...>
}


@receiver_21_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x3)
+ ((uw_object_hdr_t *)found)->position_word_high
|
- *(byte *)((byte *)found + 0x3)
+ ((uw_object_hdr_t *)found)->position_word_high
|
- ((byte *)found)[0x3]
+ ((uw_object_hdr_t *)found)->position_word_high
)
...>
}


@receiver_21_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x3)
+ ((uw_object_hdr_t *)found)->position_word_high
|
- *(undefined1 *)((byte *)found + 0x3)
+ ((uw_object_hdr_t *)found)->position_word_high
|
- ((undefined1 *)found)[0x3]
+ ((uw_object_hdr_t *)found)->position_word_high
)
...>
}


@receiver_21_w_2_17_address_3@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x3)
+ (char *)&((uw_object_hdr_t *)found)->position_word_high
|
- &*(char *)((byte *)found + 0x3)
+ (char *)&((uw_object_hdr_t *)found)->position_word_high
|
- &((char *)found)[0x3]
+ (char *)&((uw_object_hdr_t *)found)->position_word_high
)
...>
}


@receiver_21_w_2_17_store_3@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x3) = E;
+ ((uw_object_hdr_t *)found)->position_word_high = (byte)E;
|
- *(char *)((byte *)found + 0x3) = E;
+ ((uw_object_hdr_t *)found)->position_word_high = (byte)E;
|
- ((char *)found)[0x3] = E;
+ ((uw_object_hdr_t *)found)->position_word_high = (byte)E;
)
...>
}


@receiver_21_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x3)
+ (char)((uw_object_hdr_t *)found)->position_word_high
|
- *(char *)((byte *)found + 0x3)
+ (char)((uw_object_hdr_t *)found)->position_word_high
|
- ((char *)found)[0x3]
+ (char)((uw_object_hdr_t *)found)->position_word_high
)
...>
}


@receiver_21_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x4) = (char)V;
- *(char *)((char *)found + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x4) = (char)V;
- *(byte *)((char *)found + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x4) = (byte)V;
- *(char *)((char *)found + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x4) = (byte)V;
- *(byte *)((char *)found + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->chain_word = (ushort)V;

...>
}

@receiver_21_w_4_34_word_ushort@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word
|
- *(ushort *)((byte *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word
|
- ((ushort *)found)[0x2]
+ ((uw_object_hdr_t *)found)->chain_word
|
- *(ushort *)((ushort *)found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word
|
- *(ushort *)(found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word
|
- found[0x2]
+ ((uw_object_hdr_t *)found)->chain_word
)
...>
}


@receiver_21_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word
|
- *(undefined2 *)((byte *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word
|
- ((undefined2 *)found)[0x2]
+ ((uw_object_hdr_t *)found)->chain_word
|
- *(undefined2 *)((undefined2 *)found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word
|
- *(undefined2 *)(found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word
|
- found[0x2]
+ ((uw_object_hdr_t *)found)->chain_word
)
...>
}


@receiver_21_w_4_34_word_short@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word_signed
|
- *(short *)((byte *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word_signed
|
- ((short *)found)[0x2]
+ ((uw_object_hdr_t *)found)->chain_word_signed
|
- *(short *)((short *)found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word_signed
|
- *(short *)(found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word_signed
)
...>
}


@receiver_21_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- *(byte *)((byte *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- ((byte *)found)[0x4]
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- *(byte *)((ushort *)found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- (byte)((ushort *)found)[0x2]
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- *(byte *)(found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- (byte)found[0x2]
+ ((uw_object_hdr_t *)found)->chain_word_low
)
...>
}


@receiver_21_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- *(undefined1 *)((byte *)found + 0x4)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- ((undefined1 *)found)[0x4]
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- *(undefined1 *)((ushort *)found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- (undefined1)((ushort *)found)[0x2]
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- *(undefined1 *)(found + 0x2)
+ ((uw_object_hdr_t *)found)->chain_word_low
|
- (undefined1)found[0x2]
+ ((uw_object_hdr_t *)found)->chain_word_low
)
...>
}


@receiver_21_w_4_34_address_4@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x4)
+ (char *)&((uw_object_hdr_t *)found)->chain_word_low
|
- &*(char *)((byte *)found + 0x4)
+ (char *)&((uw_object_hdr_t *)found)->chain_word_low
|
- &((char *)found)[0x4]
+ (char *)&((uw_object_hdr_t *)found)->chain_word_low
|
- &*(char *)((ushort *)found + 0x2)
+ (char *)&((uw_object_hdr_t *)found)->chain_word_low
|
- &*(char *)(found + 0x2)
+ (char *)&((uw_object_hdr_t *)found)->chain_word_low
)
...>
}


@receiver_21_w_4_34_store_4@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x4) = E;
+ ((uw_object_hdr_t *)found)->chain_word_low = (byte)E;
|
- *(char *)((byte *)found + 0x4) = E;
+ ((uw_object_hdr_t *)found)->chain_word_low = (byte)E;
|
- ((char *)found)[0x4] = E;
+ ((uw_object_hdr_t *)found)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)found + 0x2) = E;
+ ((uw_object_hdr_t *)found)->chain_word_low = (byte)E;
|
- *(char *)(found + 0x2) = E;
+ ((uw_object_hdr_t *)found)->chain_word_low = (byte)E;
)
...>
}


@receiver_21_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x4)
+ (char)((uw_object_hdr_t *)found)->chain_word_low
|
- *(char *)((byte *)found + 0x4)
+ (char)((uw_object_hdr_t *)found)->chain_word_low
|
- ((char *)found)[0x4]
+ (char)((uw_object_hdr_t *)found)->chain_word_low
|
- *(char *)((ushort *)found + 0x2)
+ (char)((uw_object_hdr_t *)found)->chain_word_low
|
- (char)((ushort *)found)[0x2]
+ (char)((uw_object_hdr_t *)found)->chain_word_low
|
- *(char *)(found + 0x2)
+ (char)((uw_object_hdr_t *)found)->chain_word_low
|
- (char)found[0x2]
+ (char)((uw_object_hdr_t *)found)->chain_word_low
)
...>
}


@receiver_21_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x5)
+ ((uw_object_hdr_t *)found)->chain_word_high
|
- *(byte *)((byte *)found + 0x5)
+ ((uw_object_hdr_t *)found)->chain_word_high
|
- ((byte *)found)[0x5]
+ ((uw_object_hdr_t *)found)->chain_word_high
)
...>
}


@receiver_21_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x5)
+ ((uw_object_hdr_t *)found)->chain_word_high
|
- *(undefined1 *)((byte *)found + 0x5)
+ ((uw_object_hdr_t *)found)->chain_word_high
|
- ((undefined1 *)found)[0x5]
+ ((uw_object_hdr_t *)found)->chain_word_high
)
...>
}


@receiver_21_w_4_34_address_5@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x5)
+ (char *)&((uw_object_hdr_t *)found)->chain_word_high
|
- &*(char *)((byte *)found + 0x5)
+ (char *)&((uw_object_hdr_t *)found)->chain_word_high
|
- &((char *)found)[0x5]
+ (char *)&((uw_object_hdr_t *)found)->chain_word_high
)
...>
}


@receiver_21_w_4_34_store_5@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x5) = E;
+ ((uw_object_hdr_t *)found)->chain_word_high = (byte)E;
|
- *(char *)((byte *)found + 0x5) = E;
+ ((uw_object_hdr_t *)found)->chain_word_high = (byte)E;
|
- ((char *)found)[0x5] = E;
+ ((uw_object_hdr_t *)found)->chain_word_high = (byte)E;
)
...>
}


@receiver_21_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x5)
+ (char)((uw_object_hdr_t *)found)->chain_word_high
|
- *(char *)((byte *)found + 0x5)
+ (char)((uw_object_hdr_t *)found)->chain_word_high
|
- ((char *)found)[0x5]
+ (char)((uw_object_hdr_t *)found)->chain_word_high
)
...>
}


@receiver_21_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x6) = (char)V;
- *(char *)((char *)found + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)found + 0x6) = (char)V;
- *(byte *)((char *)found + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x6) = (byte)V;
- *(char *)((char *)found + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)found)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)found + 0x6) = (byte)V;
- *(byte *)((char *)found + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)found)->link_word = (ushort)V;

...>
}

@receiver_21_w_6_51_word_ushort@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word
|
- *(ushort *)((byte *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word
|
- ((ushort *)found)[0x3]
+ ((uw_object_hdr_t *)found)->link_word
|
- *(ushort *)((ushort *)found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word
|
- *(ushort *)(found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word
|
- found[0x3]
+ ((uw_object_hdr_t *)found)->link_word
)
...>
}


@receiver_21_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word
|
- *(undefined2 *)((byte *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word
|
- ((undefined2 *)found)[0x3]
+ ((uw_object_hdr_t *)found)->link_word
|
- *(undefined2 *)((undefined2 *)found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word
|
- *(undefined2 *)(found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word
|
- found[0x3]
+ ((uw_object_hdr_t *)found)->link_word
)
...>
}


@receiver_21_w_6_51_word_short@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word_signed
|
- *(short *)((byte *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word_signed
|
- ((short *)found)[0x3]
+ ((uw_object_hdr_t *)found)->link_word_signed
|
- *(short *)((short *)found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word_signed
|
- *(short *)(found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word_signed
)
...>
}


@receiver_21_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- *(byte *)((byte *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- ((byte *)found)[0x6]
+ ((uw_object_hdr_t *)found)->link_word_low
|
- *(byte *)((ushort *)found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- (byte)((ushort *)found)[0x3]
+ ((uw_object_hdr_t *)found)->link_word_low
|
- *(byte *)(found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- (byte)found[0x3]
+ ((uw_object_hdr_t *)found)->link_word_low
)
...>
}


@receiver_21_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- *(undefined1 *)((byte *)found + 0x6)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- ((undefined1 *)found)[0x6]
+ ((uw_object_hdr_t *)found)->link_word_low
|
- *(undefined1 *)((ushort *)found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- (undefined1)((ushort *)found)[0x3]
+ ((uw_object_hdr_t *)found)->link_word_low
|
- *(undefined1 *)(found + 0x3)
+ ((uw_object_hdr_t *)found)->link_word_low
|
- (undefined1)found[0x3]
+ ((uw_object_hdr_t *)found)->link_word_low
)
...>
}


@receiver_21_w_6_51_address_6@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x6)
+ (char *)&((uw_object_hdr_t *)found)->link_word_low
|
- &*(char *)((byte *)found + 0x6)
+ (char *)&((uw_object_hdr_t *)found)->link_word_low
|
- &((char *)found)[0x6]
+ (char *)&((uw_object_hdr_t *)found)->link_word_low
|
- &*(char *)((ushort *)found + 0x3)
+ (char *)&((uw_object_hdr_t *)found)->link_word_low
|
- &*(char *)(found + 0x3)
+ (char *)&((uw_object_hdr_t *)found)->link_word_low
)
...>
}


@receiver_21_w_6_51_store_6@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x6) = E;
+ ((uw_object_hdr_t *)found)->link_word_low = (byte)E;
|
- *(char *)((byte *)found + 0x6) = E;
+ ((uw_object_hdr_t *)found)->link_word_low = (byte)E;
|
- ((char *)found)[0x6] = E;
+ ((uw_object_hdr_t *)found)->link_word_low = (byte)E;
|
- *(char *)((ushort *)found + 0x3) = E;
+ ((uw_object_hdr_t *)found)->link_word_low = (byte)E;
|
- *(char *)(found + 0x3) = E;
+ ((uw_object_hdr_t *)found)->link_word_low = (byte)E;
)
...>
}


@receiver_21_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x6)
+ (char)((uw_object_hdr_t *)found)->link_word_low
|
- *(char *)((byte *)found + 0x6)
+ (char)((uw_object_hdr_t *)found)->link_word_low
|
- ((char *)found)[0x6]
+ (char)((uw_object_hdr_t *)found)->link_word_low
|
- *(char *)((ushort *)found + 0x3)
+ (char)((uw_object_hdr_t *)found)->link_word_low
|
- (char)((ushort *)found)[0x3]
+ (char)((uw_object_hdr_t *)found)->link_word_low
|
- *(char *)(found + 0x3)
+ (char)((uw_object_hdr_t *)found)->link_word_low
|
- (char)found[0x3]
+ (char)((uw_object_hdr_t *)found)->link_word_low
)
...>
}


@receiver_21_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)found + 0x7)
+ ((uw_object_hdr_t *)found)->link_word_high
|
- *(byte *)((byte *)found + 0x7)
+ ((uw_object_hdr_t *)found)->link_word_high
|
- ((byte *)found)[0x7]
+ ((uw_object_hdr_t *)found)->link_word_high
)
...>
}


@receiver_21_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)found + 0x7)
+ ((uw_object_hdr_t *)found)->link_word_high
|
- *(undefined1 *)((byte *)found + 0x7)
+ ((uw_object_hdr_t *)found)->link_word_high
|
- ((undefined1 *)found)[0x7]
+ ((uw_object_hdr_t *)found)->link_word_high
)
...>
}


@receiver_21_w_6_51_address_7@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)found + 0x7)
+ (char *)&((uw_object_hdr_t *)found)->link_word_high
|
- &*(char *)((byte *)found + 0x7)
+ (char *)&((uw_object_hdr_t *)found)->link_word_high
|
- &((char *)found)[0x7]
+ (char *)&((uw_object_hdr_t *)found)->link_word_high
)
...>
}


@receiver_21_w_6_51_store_7@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x7) = E;
+ ((uw_object_hdr_t *)found)->link_word_high = (byte)E;
|
- *(char *)((byte *)found + 0x7) = E;
+ ((uw_object_hdr_t *)found)->link_word_high = (byte)E;
|
- ((char *)found)[0x7] = E;
+ ((uw_object_hdr_t *)found)->link_word_high = (byte)E;
)
...>
}


@receiver_21_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)found + 0x7)
+ (char)((uw_object_hdr_t *)found)->link_word_high
|
- *(char *)((byte *)found + 0x7)
+ (char)((uw_object_hdr_t *)found)->link_word_high
|
- ((char *)found)[0x7]
+ (char)((uw_object_hdr_t *)found)->link_word_high
)
...>
}


@receiver_22_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_22_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x0) = (char)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_22_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(char *)((char *)puVar6 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_22_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x0) = (byte)V;
- *(byte *)((char *)puVar6 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)V;

...>
}

@receiver_22_w_0_0_word_ushort@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_22_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((undefined2 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}


@receiver_22_w_0_0_word_short@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- ((short *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
|
- *(short *)((short *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_signed
)
...>
}


@receiver_22_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((byte *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (byte)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(byte *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_22_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((byte *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((undefined1 *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x0)
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (undefined1)((ushort *)puVar6)[0x0]
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(undefined1 *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_22_w_0_0_address_0@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((byte *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &((char *)puVar6)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)((ushort *)puVar6 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
|
- &*(char *)puVar6
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_22_w_0_0_store_0@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- ((char *)puVar6)[0x0] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
|
- *(char *)puVar6 = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)E;
)
...>
}


@receiver_22_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((byte *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- ((char *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)((ushort *)puVar6 + 0x0)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- (char)((ushort *)puVar6)[0x0]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
|
- *(char *)puVar6
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_low
)
...>
}


@receiver_22_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(byte *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((byte *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_22_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(undefined1 *)((byte *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((undefined1 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_22_w_0_0_address_1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &*(char *)((byte *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
|
- &((char *)puVar6)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_22_w_0_0_store_1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
|
- ((char *)puVar6)[0x1] = E;
+ ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)E;
)
...>
}


@receiver_22_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- *(char *)((byte *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
|
- ((char *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->type_flags_high
)
...>
}


@receiver_22_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_22_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x2) = (char)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_22_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(char *)((char *)puVar6 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_22_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x2) = (byte)V;
- *(byte *)((char *)puVar6 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->position_word = (ushort)V;

...>
}

@receiver_22_w_2_17_word_ushort@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(ushort *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_22_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((undefined2 *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}


@receiver_22_w_2_17_word_short@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- ((short *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
|
- *(short *)((short *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_signed
)
...>
}


@receiver_22_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((byte *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(byte *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (byte)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_22_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((undefined1 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x1)
+ ((uw_object_hdr_t *)puVar6)->position_word_low
|
- (undefined1)((ushort *)puVar6)[0x1]
+ ((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_22_w_2_17_address_2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((byte *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &((char *)puVar6)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
|
- &*(char *)((ushort *)puVar6 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_22_w_2_17_store_2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- ((char *)puVar6)[0x2] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)E;
)
...>
}


@receiver_22_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((byte *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- ((char *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- *(char *)((ushort *)puVar6 + 0x1)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
|
- (char)((ushort *)puVar6)[0x1]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_low
)
...>
}


@receiver_22_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(byte *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((byte *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_22_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((undefined1 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_22_w_2_17_address_3@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &*(char *)((byte *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
|
- &((char *)puVar6)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_22_w_2_17_store_3@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
|
- ((char *)puVar6)[0x3] = E;
+ ((uw_object_hdr_t *)puVar6)->position_word_high = (byte)E;
)
...>
}


@receiver_22_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- *(char *)((byte *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
|
- ((char *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->position_word_high
)
...>
}


@receiver_22_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_22_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x4) = (char)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_22_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(char *)((char *)puVar6 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_22_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x4) = (byte)V;
- *(byte *)((char *)puVar6 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->chain_word = (ushort)V;

...>
}

@receiver_22_w_4_34_word_ushort@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(ushort *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_22_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((undefined2 *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}


@receiver_22_w_4_34_word_short@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- ((short *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
|
- *(short *)((short *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_signed
)
...>
}


@receiver_22_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((byte *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(byte *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (byte)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_22_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x4)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((undefined1 *)puVar6)[0x4]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x2)
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (undefined1)((ushort *)puVar6)[0x2]
+ ((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_22_w_4_34_address_4@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((byte *)puVar6 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &((char *)puVar6)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
|
- &*(char *)((ushort *)puVar6 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_22_w_4_34_store_4@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- ((char *)puVar6)[0x4] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_low = (byte)E;
)
...>
}


@receiver_22_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((byte *)puVar6 + 0x4)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- ((char *)puVar6)[0x4]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- *(char *)((ushort *)puVar6 + 0x2)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
|
- (char)((ushort *)puVar6)[0x2]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_low
)
...>
}


@receiver_22_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(byte *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((byte *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_22_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x5)
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((undefined1 *)puVar6)[0x5]
+ ((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_22_w_4_34_address_5@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &*(char *)((byte *)puVar6 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
|
- &((char *)puVar6)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_22_w_4_34_store_5@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
|
- ((char *)puVar6)[0x5] = E;
+ ((uw_object_hdr_t *)puVar6)->chain_word_high = (byte)E;
)
...>
}


@receiver_22_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- *(char *)((byte *)puVar6 + 0x5)
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
|
- ((char *)puVar6)[0x5]
+ (char)((uw_object_hdr_t *)puVar6)->chain_word_high
)
...>
}


@receiver_22_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_22_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar6 + 0x6) = (char)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_22_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(char *)((char *)puVar6 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_22_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar6 + 0x6) = (byte)V;
- *(byte *)((char *)puVar6 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar6)->link_word = (ushort)V;

...>
}

@receiver_22_w_6_51_word_ushort@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(ushort *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_22_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((undefined2 *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- *(undefined2 *)((undefined2 *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}


@receiver_22_w_6_51_word_short@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- ((short *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
|
- *(short *)((short *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_signed
)
...>
}


@receiver_22_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((byte *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(byte *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (byte)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_22_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((byte *)puVar6 + 0x6)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((undefined1 *)puVar6)[0x6]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(undefined1 *)((ushort *)puVar6 + 0x3)
+ ((uw_object_hdr_t *)puVar6)->link_word_low
|
- (undefined1)((ushort *)puVar6)[0x3]
+ ((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_22_w_6_51_address_6@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((byte *)puVar6 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &((char *)puVar6)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
|
- &*(char *)((ushort *)puVar6 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_22_w_6_51_store_6@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- ((char *)puVar6)[0x6] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar6 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)E;
)
...>
}


@receiver_22_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((byte *)puVar6 + 0x6)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- ((char *)puVar6)[0x6]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- *(char *)((ushort *)puVar6 + 0x3)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
|
- (char)((ushort *)puVar6)[0x3]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_low
)
...>
}


@receiver_22_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(byte *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((byte *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_22_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(undefined1 *)((byte *)puVar6 + 0x7)
+ ((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((undefined1 *)puVar6)[0x7]
+ ((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_22_w_6_51_address_7@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &*(char *)((byte *)puVar6 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
|
- &((char *)puVar6)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_22_w_6_51_store_7@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar6 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
|
- ((char *)puVar6)[0x7] = E;
+ ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)E;
)
...>
}


@receiver_22_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(find_object_in_world\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- *(char *)((byte *)puVar6 + 0x7)
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
|
- ((char *)puVar6)[0x7]
+ (char)((uw_object_hdr_t *)puVar6)->link_word_high
)
...>
}


@receiver_23_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x0) = (char)V;
- *(char *)((char *)psVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->type_flags = (ushort)V;

...>
}

@receiver_23_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x0) = (char)V;
- *(byte *)((char *)psVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->type_flags = (ushort)V;

...>
}

@receiver_23_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x0) = (byte)V;
- *(char *)((char *)psVar7 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->type_flags = (ushort)V;

...>
}

@receiver_23_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x0) = (byte)V;
- *(byte *)((char *)psVar7 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->type_flags = (ushort)V;

...>
}

@receiver_23_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(ushort *)((byte *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- ((ushort *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(ushort *)((ushort *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(ushort *)(psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
)
...>
}


@receiver_23_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(undefined2 *)((byte *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- ((undefined2 *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(undefined2 *)((undefined2 *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(undefined2 *)(psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
)
...>
}


@receiver_23_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
|
- *(short *)((byte *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
|
- ((short *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
|
- *(short *)((short *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
|
- *(short *)(psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
|
- psVar7[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
|
- *psVar7
+ ((uw_object_hdr_t *)psVar7)->type_flags_signed
)
...>
}


@receiver_23_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(byte *)((byte *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- ((byte *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(byte *)((ushort *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- (byte)((ushort *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(byte *)psVar7
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(byte *)(psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- (byte)psVar7[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
)
...>
}


@receiver_23_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(undefined1 *)((byte *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- ((undefined1 *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(undefined1 *)((ushort *)psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- (undefined1)((ushort *)psVar7)[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(undefined1 *)psVar7
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(undefined1 *)(psVar7 + 0x0)
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
|
- (undefined1)psVar7[0x0]
+ ((uw_object_hdr_t *)psVar7)->type_flags_low
)
...>
}


@receiver_23_w_0_0_address_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_low
|
- &*(char *)((byte *)psVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_low
|
- &((char *)psVar7)[0x0]
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_low
|
- &*(char *)((ushort *)psVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_low
|
- &*(char *)psVar7
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_low
|
- &*(char *)(psVar7 + 0x0)
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_low
)
...>
}


@receiver_23_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_low = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_low = (byte)E;
|
- ((char *)psVar7)[0x0] = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)psVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_low = (byte)E;
|
- *(char *)psVar7 = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_low = (byte)E;
|
- *(char *)(psVar7 + 0x0) = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_low = (byte)E;
)
...>
}


@receiver_23_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x0)
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(char *)((byte *)psVar7 + 0x0)
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- ((char *)psVar7)[0x0]
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(char *)((ushort *)psVar7 + 0x0)
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- (char)((ushort *)psVar7)[0x0]
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(char *)psVar7
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- *(char *)(psVar7 + 0x0)
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
|
- (char)psVar7[0x0]
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_low
)
...>
}


@receiver_23_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->type_flags_high
|
- *(byte *)((byte *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->type_flags_high
|
- ((byte *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->type_flags_high
)
...>
}


@receiver_23_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->type_flags_high
|
- *(undefined1 *)((byte *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->type_flags_high
|
- ((undefined1 *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->type_flags_high
)
...>
}


@receiver_23_w_0_0_address_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_high
|
- &*(char *)((byte *)psVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_high
|
- &((char *)psVar7)[0x1]
+ (char *)&((uw_object_hdr_t *)psVar7)->type_flags_high
)
...>
}


@receiver_23_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_high = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_high = (byte)E;
|
- ((char *)psVar7)[0x1] = E;
+ ((uw_object_hdr_t *)psVar7)->type_flags_high = (byte)E;
)
...>
}


@receiver_23_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x1)
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_high
|
- *(char *)((byte *)psVar7 + 0x1)
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_high
|
- ((char *)psVar7)[0x1]
+ (char)((uw_object_hdr_t *)psVar7)->type_flags_high
)
...>
}


@receiver_23_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x2) = (char)V;
- *(char *)((char *)psVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->position_word = (ushort)V;

...>
}

@receiver_23_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x2) = (char)V;
- *(byte *)((char *)psVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->position_word = (ushort)V;

...>
}

@receiver_23_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x2) = (byte)V;
- *(char *)((char *)psVar7 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->position_word = (ushort)V;

...>
}

@receiver_23_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x2) = (byte)V;
- *(byte *)((char *)psVar7 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->position_word = (ushort)V;

...>
}

@receiver_23_w_2_17_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- *(ushort *)((byte *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- ((ushort *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- *(ushort *)((ushort *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- *(ushort *)(psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word
)
...>
}


@receiver_23_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- *(undefined2 *)((byte *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- ((undefined2 *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- *(undefined2 *)((undefined2 *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- *(undefined2 *)(psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word
)
...>
}


@receiver_23_w_2_17_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word_signed
|
- *(short *)((byte *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word_signed
|
- ((short *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word_signed
|
- *(short *)((short *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word_signed
|
- *(short *)(psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word_signed
|
- psVar7[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word_signed
)
...>
}


@receiver_23_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(byte *)((byte *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- ((byte *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(byte *)((ushort *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- (byte)((ushort *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(byte *)(psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- (byte)psVar7[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word_low
)
...>
}


@receiver_23_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(undefined1 *)((byte *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- ((undefined1 *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(undefined1 *)((ushort *)psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- (undefined1)((ushort *)psVar7)[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(undefined1 *)(psVar7 + 0x1)
+ ((uw_object_hdr_t *)psVar7)->position_word_low
|
- (undefined1)psVar7[0x1]
+ ((uw_object_hdr_t *)psVar7)->position_word_low
)
...>
}


@receiver_23_w_2_17_address_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_low
|
- &*(char *)((byte *)psVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_low
|
- &((char *)psVar7)[0x2]
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_low
|
- &*(char *)((ushort *)psVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_low
|
- &*(char *)(psVar7 + 0x1)
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_low
)
...>
}


@receiver_23_w_2_17_store_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_low = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_low = (byte)E;
|
- ((char *)psVar7)[0x2] = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_low = (byte)E;
|
- *(char *)((ushort *)psVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_low = (byte)E;
|
- *(char *)(psVar7 + 0x1) = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_low = (byte)E;
)
...>
}


@receiver_23_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x2)
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(char *)((byte *)psVar7 + 0x2)
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
|
- ((char *)psVar7)[0x2]
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(char *)((ushort *)psVar7 + 0x1)
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
|
- (char)((ushort *)psVar7)[0x1]
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
|
- *(char *)(psVar7 + 0x1)
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
|
- (char)psVar7[0x1]
+ (char)((uw_object_hdr_t *)psVar7)->position_word_low
)
...>
}


@receiver_23_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->position_word_high
|
- *(byte *)((byte *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->position_word_high
|
- ((byte *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->position_word_high
)
...>
}


@receiver_23_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->position_word_high
|
- *(undefined1 *)((byte *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->position_word_high
|
- ((undefined1 *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->position_word_high
)
...>
}


@receiver_23_w_2_17_address_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_high
|
- &*(char *)((byte *)psVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_high
|
- &((char *)psVar7)[0x3]
+ (char *)&((uw_object_hdr_t *)psVar7)->position_word_high
)
...>
}


@receiver_23_w_2_17_store_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_high = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_high = (byte)E;
|
- ((char *)psVar7)[0x3] = E;
+ ((uw_object_hdr_t *)psVar7)->position_word_high = (byte)E;
)
...>
}


@receiver_23_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x3)
+ (char)((uw_object_hdr_t *)psVar7)->position_word_high
|
- *(char *)((byte *)psVar7 + 0x3)
+ (char)((uw_object_hdr_t *)psVar7)->position_word_high
|
- ((char *)psVar7)[0x3]
+ (char)((uw_object_hdr_t *)psVar7)->position_word_high
)
...>
}


@receiver_23_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x4) = (char)V;
- *(char *)((char *)psVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->chain_word = (ushort)V;

...>
}

@receiver_23_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x4) = (char)V;
- *(byte *)((char *)psVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->chain_word = (ushort)V;

...>
}

@receiver_23_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x4) = (byte)V;
- *(char *)((char *)psVar7 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->chain_word = (ushort)V;

...>
}

@receiver_23_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x4) = (byte)V;
- *(byte *)((char *)psVar7 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->chain_word = (ushort)V;

...>
}

@receiver_23_w_4_34_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- *(ushort *)((byte *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- ((ushort *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- *(ushort *)((ushort *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- *(ushort *)(psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word
)
...>
}


@receiver_23_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- *(undefined2 *)((byte *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- ((undefined2 *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- *(undefined2 *)((undefined2 *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- *(undefined2 *)(psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word
)
...>
}


@receiver_23_w_4_34_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word_signed
|
- *(short *)((byte *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word_signed
|
- ((short *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word_signed
|
- *(short *)((short *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word_signed
|
- *(short *)(psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word_signed
|
- psVar7[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word_signed
)
...>
}


@receiver_23_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(byte *)((byte *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- ((byte *)psVar7)[0x4]
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(byte *)((ushort *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- (byte)((ushort *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(byte *)(psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- (byte)psVar7[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
)
...>
}


@receiver_23_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(undefined1 *)((byte *)psVar7 + 0x4)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- ((undefined1 *)psVar7)[0x4]
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(undefined1 *)((ushort *)psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- (undefined1)((ushort *)psVar7)[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(undefined1 *)(psVar7 + 0x2)
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
|
- (undefined1)psVar7[0x2]
+ ((uw_object_hdr_t *)psVar7)->chain_word_low
)
...>
}


@receiver_23_w_4_34_address_4@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x4)
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_low
|
- &*(char *)((byte *)psVar7 + 0x4)
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_low
|
- &((char *)psVar7)[0x4]
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_low
|
- &*(char *)((ushort *)psVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_low
|
- &*(char *)(psVar7 + 0x2)
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_low
)
...>
}


@receiver_23_w_4_34_store_4@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_low = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x4) = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_low = (byte)E;
|
- ((char *)psVar7)[0x4] = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)psVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_low = (byte)E;
|
- *(char *)(psVar7 + 0x2) = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_low = (byte)E;
)
...>
}


@receiver_23_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x4)
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(char *)((byte *)psVar7 + 0x4)
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
|
- ((char *)psVar7)[0x4]
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(char *)((ushort *)psVar7 + 0x2)
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
|
- (char)((ushort *)psVar7)[0x2]
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
|
- *(char *)(psVar7 + 0x2)
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
|
- (char)psVar7[0x2]
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_low
)
...>
}


@receiver_23_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x5)
+ ((uw_object_hdr_t *)psVar7)->chain_word_high
|
- *(byte *)((byte *)psVar7 + 0x5)
+ ((uw_object_hdr_t *)psVar7)->chain_word_high
|
- ((byte *)psVar7)[0x5]
+ ((uw_object_hdr_t *)psVar7)->chain_word_high
)
...>
}


@receiver_23_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x5)
+ ((uw_object_hdr_t *)psVar7)->chain_word_high
|
- *(undefined1 *)((byte *)psVar7 + 0x5)
+ ((uw_object_hdr_t *)psVar7)->chain_word_high
|
- ((undefined1 *)psVar7)[0x5]
+ ((uw_object_hdr_t *)psVar7)->chain_word_high
)
...>
}


@receiver_23_w_4_34_address_5@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x5)
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_high
|
- &*(char *)((byte *)psVar7 + 0x5)
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_high
|
- &((char *)psVar7)[0x5]
+ (char *)&((uw_object_hdr_t *)psVar7)->chain_word_high
)
...>
}


@receiver_23_w_4_34_store_5@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_high = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x5) = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_high = (byte)E;
|
- ((char *)psVar7)[0x5] = E;
+ ((uw_object_hdr_t *)psVar7)->chain_word_high = (byte)E;
)
...>
}


@receiver_23_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x5)
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_high
|
- *(char *)((byte *)psVar7 + 0x5)
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_high
|
- ((char *)psVar7)[0x5]
+ (char)((uw_object_hdr_t *)psVar7)->chain_word_high
)
...>
}


@receiver_23_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x6) = (char)V;
- *(char *)((char *)psVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->link_word = (ushort)V;

...>
}

@receiver_23_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)psVar7 + 0x6) = (char)V;
- *(byte *)((char *)psVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->link_word = (ushort)V;

...>
}

@receiver_23_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x6) = (byte)V;
- *(char *)((char *)psVar7 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->link_word = (ushort)V;

...>
}

@receiver_23_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)psVar7 + 0x6) = (byte)V;
- *(byte *)((char *)psVar7 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)psVar7)->link_word = (ushort)V;

...>
}

@receiver_23_w_6_51_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- *(ushort *)((byte *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- ((ushort *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- *(ushort *)((ushort *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- *(ushort *)(psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word
)
...>
}


@receiver_23_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- *(undefined2 *)((byte *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- ((undefined2 *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- *(undefined2 *)((undefined2 *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- *(undefined2 *)(psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word
)
...>
}


@receiver_23_w_6_51_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word_signed
|
- *(short *)((byte *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word_signed
|
- ((short *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word_signed
|
- *(short *)((short *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word_signed
|
- *(short *)(psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word_signed
|
- psVar7[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word_signed
)
...>
}


@receiver_23_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(byte *)((byte *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- ((byte *)psVar7)[0x6]
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(byte *)((ushort *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- (byte)((ushort *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(byte *)(psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- (byte)psVar7[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word_low
)
...>
}


@receiver_23_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(undefined1 *)((byte *)psVar7 + 0x6)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- ((undefined1 *)psVar7)[0x6]
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(undefined1 *)((ushort *)psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- (undefined1)((ushort *)psVar7)[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(undefined1 *)(psVar7 + 0x3)
+ ((uw_object_hdr_t *)psVar7)->link_word_low
|
- (undefined1)psVar7[0x3]
+ ((uw_object_hdr_t *)psVar7)->link_word_low
)
...>
}


@receiver_23_w_6_51_address_6@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x6)
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_low
|
- &*(char *)((byte *)psVar7 + 0x6)
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_low
|
- &((char *)psVar7)[0x6]
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_low
|
- &*(char *)((ushort *)psVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_low
|
- &*(char *)(psVar7 + 0x3)
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_low
)
...>
}


@receiver_23_w_6_51_store_6@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_low = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x6) = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_low = (byte)E;
|
- ((char *)psVar7)[0x6] = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_low = (byte)E;
|
- *(char *)((ushort *)psVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_low = (byte)E;
|
- *(char *)(psVar7 + 0x3) = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_low = (byte)E;
)
...>
}


@receiver_23_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x6)
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(char *)((byte *)psVar7 + 0x6)
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
|
- ((char *)psVar7)[0x6]
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(char *)((ushort *)psVar7 + 0x3)
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
|
- (char)((ushort *)psVar7)[0x3]
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
|
- *(char *)(psVar7 + 0x3)
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
|
- (char)psVar7[0x3]
+ (char)((uw_object_hdr_t *)psVar7)->link_word_low
)
...>
}


@receiver_23_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)psVar7 + 0x7)
+ ((uw_object_hdr_t *)psVar7)->link_word_high
|
- *(byte *)((byte *)psVar7 + 0x7)
+ ((uw_object_hdr_t *)psVar7)->link_word_high
|
- ((byte *)psVar7)[0x7]
+ ((uw_object_hdr_t *)psVar7)->link_word_high
)
...>
}


@receiver_23_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)psVar7 + 0x7)
+ ((uw_object_hdr_t *)psVar7)->link_word_high
|
- *(undefined1 *)((byte *)psVar7 + 0x7)
+ ((uw_object_hdr_t *)psVar7)->link_word_high
|
- ((undefined1 *)psVar7)[0x7]
+ ((uw_object_hdr_t *)psVar7)->link_word_high
)
...>
}


@receiver_23_w_6_51_address_7@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)psVar7 + 0x7)
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_high
|
- &*(char *)((byte *)psVar7 + 0x7)
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_high
|
- &((char *)psVar7)[0x7]
+ (char *)&((uw_object_hdr_t *)psVar7)->link_word_high
)
...>
}


@receiver_23_w_6_51_store_7@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_high = (byte)E;
|
- *(char *)((byte *)psVar7 + 0x7) = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_high = (byte)E;
|
- ((char *)psVar7)[0x7] = E;
+ ((uw_object_hdr_t *)psVar7)->link_word_high = (byte)E;
)
...>
}


@receiver_23_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)psVar7 + 0x7)
+ (char)((uw_object_hdr_t *)psVar7)->link_word_high
|
- *(char *)((byte *)psVar7 + 0x7)
+ (char)((uw_object_hdr_t *)psVar7)->link_word_high
|
- ((char *)psVar7)[0x7]
+ (char)((uw_object_hdr_t *)psVar7)->link_word_high
)
...>
}


@receiver_24_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x0) = (char)V;
- *(char *)((char *)puVar9 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_24_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x0) = (char)V;
- *(byte *)((char *)puVar9 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_24_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x0) = (byte)V;
- *(char *)((char *)puVar9 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_24_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x0) = (byte)V;
- *(byte *)((char *)puVar9 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->type_flags = (ushort)V;

...>
}

@receiver_24_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- ((ushort *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)((ushort *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}


@receiver_24_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(undefined2 *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- ((undefined2 *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(undefined2 *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}


@receiver_24_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- *(short *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- ((short *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- *(short *)((short *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
|
- *(short *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_signed
)
...>
}


@receiver_24_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- ((byte *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)((ushort *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (byte)((ushort *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(byte *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (byte)puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_24_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)((byte *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- ((undefined1 *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (undefined1)((ushort *)puVar9)[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(undefined1 *)(puVar9 + 0x0)
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (undefined1)puVar9[0x0]
+ ((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_24_w_0_0_address_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)((byte *)puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &((char *)puVar9)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)((ushort *)puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)puVar9
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
|
- &*(char *)(puVar9 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_24_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- ((char *)puVar9)[0x0] = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)puVar9 = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
|
- *(char *)(puVar9 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_low = (byte)E;
)
...>
}


@receiver_24_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)((byte *)puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- ((char *)puVar9)[0x0]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)((ushort *)puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (char)((ushort *)puVar9)[0x0]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)puVar9
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- *(char *)(puVar9 + 0x0)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
|
- (char)puVar9[0x0]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_low
)
...>
}


@receiver_24_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(byte *)((byte *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- ((byte *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_24_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(undefined1 *)((byte *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
|
- ((undefined1 *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_24_w_0_0_address_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
|
- &*(char *)((byte *)puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
|
- &((char *)puVar9)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_24_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
|
- ((char *)puVar9)[0x1] = E;
+ ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)E;
)
...>
}


@receiver_24_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
|
- *(char *)((byte *)puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
|
- ((char *)puVar9)[0x1]
+ (char)((uw_object_hdr_t *)puVar9)->type_flags_high
)
...>
}


@receiver_24_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x2) = (char)V;
- *(char *)((char *)puVar9 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_24_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x2) = (char)V;
- *(byte *)((char *)puVar9 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_24_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x2) = (byte)V;
- *(char *)((char *)puVar9 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_24_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x2) = (byte)V;
- *(byte *)((char *)puVar9 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->position_word = (ushort)V;

...>
}

@receiver_24_w_2_17_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(ushort *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- ((ushort *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(ushort *)((ushort *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(ushort *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}


@receiver_24_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(undefined2 *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- ((undefined2 *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- *(undefined2 *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}


@receiver_24_w_2_17_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- *(short *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- ((short *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- *(short *)((short *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
|
- *(short *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_signed
)
...>
}


@receiver_24_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(byte *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- ((byte *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(byte *)((ushort *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (byte)((ushort *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(byte *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (byte)puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_24_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(undefined1 *)((byte *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- ((undefined1 *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (undefined1)((ushort *)puVar9)[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(undefined1 *)(puVar9 + 0x1)
+ ((uw_object_hdr_t *)puVar9)->position_word_low
|
- (undefined1)puVar9[0x1]
+ ((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_24_w_2_17_address_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &*(char *)((byte *)puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &((char *)puVar9)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &*(char *)((ushort *)puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
|
- &*(char *)(puVar9 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_24_w_2_17_store_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- ((char *)puVar9)[0x2] = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
|
- *(char *)(puVar9 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_low = (byte)E;
)
...>
}


@receiver_24_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(char *)((byte *)puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- ((char *)puVar9)[0x2]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(char *)((ushort *)puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- (char)((ushort *)puVar9)[0x1]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- *(char *)(puVar9 + 0x1)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
|
- (char)puVar9[0x1]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_low
)
...>
}


@receiver_24_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(byte *)((byte *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- ((byte *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_24_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(undefined1 *)((byte *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->position_word_high
|
- ((undefined1 *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_24_w_2_17_address_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
|
- &*(char *)((byte *)puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
|
- &((char *)puVar9)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_24_w_2_17_store_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
|
- ((char *)puVar9)[0x3] = E;
+ ((uw_object_hdr_t *)puVar9)->position_word_high = (byte)E;
)
...>
}


@receiver_24_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
|
- *(char *)((byte *)puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
|
- ((char *)puVar9)[0x3]
+ (char)((uw_object_hdr_t *)puVar9)->position_word_high
)
...>
}


@receiver_24_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x4) = (char)V;
- *(char *)((char *)puVar9 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_24_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x4) = (char)V;
- *(byte *)((char *)puVar9 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_24_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x4) = (byte)V;
- *(char *)((char *)puVar9 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_24_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x4) = (byte)V;
- *(byte *)((char *)puVar9 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->chain_word = (ushort)V;

...>
}

@receiver_24_w_4_34_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(ushort *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- ((ushort *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(ushort *)((ushort *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(ushort *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}


@receiver_24_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(undefined2 *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- ((undefined2 *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- *(undefined2 *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}


@receiver_24_w_4_34_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- *(short *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- ((short *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- *(short *)((short *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
|
- *(short *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_signed
)
...>
}


@receiver_24_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(byte *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- ((byte *)puVar9)[0x4]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(byte *)((ushort *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (byte)((ushort *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(byte *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (byte)puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_24_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(undefined1 *)((byte *)puVar9 + 0x4)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- ((undefined1 *)puVar9)[0x4]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (undefined1)((ushort *)puVar9)[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(undefined1 *)(puVar9 + 0x2)
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (undefined1)puVar9[0x2]
+ ((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_24_w_4_34_address_4@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &*(char *)((byte *)puVar9 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &((char *)puVar9)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &*(char *)((ushort *)puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
|
- &*(char *)(puVar9 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_24_w_4_34_store_4@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- ((char *)puVar9)[0x4] = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
|
- *(char *)(puVar9 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_low = (byte)E;
)
...>
}


@receiver_24_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x4)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(char *)((byte *)puVar9 + 0x4)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- ((char *)puVar9)[0x4]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(char *)((ushort *)puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (char)((ushort *)puVar9)[0x2]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- *(char *)(puVar9 + 0x2)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
|
- (char)puVar9[0x2]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_low
)
...>
}


@receiver_24_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(byte *)((byte *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- ((byte *)puVar9)[0x5]
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_24_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(undefined1 *)((byte *)puVar9 + 0x5)
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
|
- ((undefined1 *)puVar9)[0x5]
+ ((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_24_w_4_34_address_5@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
|
- &*(char *)((byte *)puVar9 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
|
- &((char *)puVar9)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_24_w_4_34_store_5@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
|
- ((char *)puVar9)[0x5] = E;
+ ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)E;
)
...>
}


@receiver_24_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x5)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
|
- *(char *)((byte *)puVar9 + 0x5)
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
|
- ((char *)puVar9)[0x5]
+ (char)((uw_object_hdr_t *)puVar9)->chain_word_high
)
...>
}


@receiver_24_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x6) = (char)V;
- *(char *)((char *)puVar9 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_24_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar9 + 0x6) = (char)V;
- *(byte *)((char *)puVar9 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_24_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x6) = (byte)V;
- *(char *)((char *)puVar9 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_24_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar9 + 0x6) = (byte)V;
- *(byte *)((char *)puVar9 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar9)->link_word = (ushort)V;

...>
}

@receiver_24_w_6_51_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(ushort *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- ((ushort *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(ushort *)((ushort *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(ushort *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}


@receiver_24_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(undefined2 *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- ((undefined2 *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(undefined2 *)((undefined2 *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- *(undefined2 *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}


@receiver_24_w_6_51_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- *(short *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- ((short *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- *(short *)((short *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
|
- *(short *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_signed
)
...>
}


@receiver_24_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(byte *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- ((byte *)puVar9)[0x6]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(byte *)((ushort *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (byte)((ushort *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(byte *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (byte)puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_24_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(undefined1 *)((byte *)puVar9 + 0x6)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- ((undefined1 *)puVar9)[0x6]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(undefined1 *)((ushort *)puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (undefined1)((ushort *)puVar9)[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(undefined1 *)(puVar9 + 0x3)
+ ((uw_object_hdr_t *)puVar9)->link_word_low
|
- (undefined1)puVar9[0x3]
+ ((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_24_w_6_51_address_6@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &*(char *)((byte *)puVar9 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &((char *)puVar9)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &*(char *)((ushort *)puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
|
- &*(char *)(puVar9 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_24_w_6_51_store_6@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- ((char *)puVar9)[0x6] = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
|
- *(char *)(puVar9 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_low = (byte)E;
)
...>
}


@receiver_24_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x6)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(char *)((byte *)puVar9 + 0x6)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- ((char *)puVar9)[0x6]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(char *)((ushort *)puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- (char)((ushort *)puVar9)[0x3]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- *(char *)(puVar9 + 0x3)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
|
- (char)puVar9[0x3]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_low
)
...>
}


@receiver_24_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(byte *)((byte *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- ((byte *)puVar9)[0x7]
+ ((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_24_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(undefined1 *)((byte *)puVar9 + 0x7)
+ ((uw_object_hdr_t *)puVar9)->link_word_high
|
- ((undefined1 *)puVar9)[0x7]
+ ((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_24_w_6_51_address_7@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
|
- &*(char *)((byte *)puVar9 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
|
- &((char *)puVar9)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_24_w_6_51_store_7@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar9 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
|
- ((char *)puVar9)[0x7] = E;
+ ((uw_object_hdr_t *)puVar9)->link_word_high = (byte)E;
)
...>
}


@receiver_24_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar9 + 0x7)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
|
- *(char *)((byte *)puVar9 + 0x7)
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
|
- ((char *)puVar9)[0x7]
+ (char)((uw_object_hdr_t *)puVar9)->link_word_high
)
...>
}


@receiver_25_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x0) = (char)V;
- *(char *)((char *)pbVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_25_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x0) = (char)V;
- *(byte *)((char *)pbVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_25_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x0) = (byte)V;
- *(char *)((char *)pbVar3 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_25_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x0) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->type_flags = (ushort)V;

...>
}

@receiver_25_w_0_0_word_ushort@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- ((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
)
...>
}


@receiver_25_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(undefined2 *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- ((undefined2 *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
)
...>
}


@receiver_25_w_0_0_word_short@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- ((short *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
|
- *(short *)((short *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_signed
)
...>
}


@receiver_25_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((byte *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (byte)((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(byte *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_25_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((undefined1 *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (undefined1)((ushort *)pbVar3)[0x0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(undefined1 *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_25_w_0_0_address_0@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)((byte *)pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &((char *)pbVar3)[0x0]
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)((ushort *)pbVar3 + 0x0)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- &*(char *)pbVar3
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_25_w_0_0_store_0@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- ((char *)pbVar3)[0x0] = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x0) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
|
- *(char *)pbVar3 = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_low = (byte)E;
)
...>
}


@receiver_25_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)((byte *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- ((char *)pbVar3)[0x0]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)((ushort *)pbVar3 + 0x0)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- (char)((ushort *)pbVar3)[0x0]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
|
- *(char *)pbVar3
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_low
)
...>
}


@receiver_25_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(byte *)((byte *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((byte *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_25_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((undefined1 *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_25_w_0_0_address_1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- &*(char *)((byte *)pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- &((char *)pbVar3)[0x1]
+ (char *)&((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_25_w_0_0_store_1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
|
- ((char *)pbVar3)[0x1] = E;
+ ((uw_object_hdr_t *)pbVar3)->type_flags_high = (byte)E;
)
...>
}


@receiver_25_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- *(char *)((byte *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
|
- ((char *)pbVar3)[0x1]
+ (char)((uw_object_hdr_t *)pbVar3)->type_flags_high
)
...>
}


@receiver_25_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x2) = (char)V;
- *(char *)((char *)pbVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_25_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x2) = (char)V;
- *(byte *)((char *)pbVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_25_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x2) = (byte)V;
- *(char *)((char *)pbVar3 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_25_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x2) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->position_word = (ushort)V;

...>
}

@receiver_25_w_2_17_word_ushort@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- ((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word
)
...>
}


@receiver_25_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(undefined2 *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- ((undefined2 *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word
)
...>
}


@receiver_25_w_2_17_word_short@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- ((short *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
|
- *(short *)((short *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_signed
)
...>
}


@receiver_25_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((byte *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (byte)((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_25_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((undefined1 *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x1)
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (undefined1)((ushort *)pbVar3)[0x1]
+ ((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_25_w_2_17_address_2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &*(char *)((byte *)pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &((char *)pbVar3)[0x2]
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
|
- &*(char *)((ushort *)pbVar3 + 0x1)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_25_w_2_17_store_2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- ((char *)pbVar3)[0x2] = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x1) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_low = (byte)E;
)
...>
}


@receiver_25_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)((byte *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- ((char *)pbVar3)[0x2]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- *(char *)((ushort *)pbVar3 + 0x1)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
|
- (char)((ushort *)pbVar3)[0x1]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_low
)
...>
}


@receiver_25_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(byte *)((byte *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((byte *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_25_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((undefined1 *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_25_w_2_17_address_3@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
|
- &*(char *)((byte *)pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
|
- &((char *)pbVar3)[0x3]
+ (char *)&((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_25_w_2_17_store_3@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
|
- ((char *)pbVar3)[0x3] = E;
+ ((uw_object_hdr_t *)pbVar3)->position_word_high = (byte)E;
)
...>
}


@receiver_25_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- *(char *)((byte *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
|
- ((char *)pbVar3)[0x3]
+ (char)((uw_object_hdr_t *)pbVar3)->position_word_high
)
...>
}


@receiver_25_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x4) = (char)V;
- *(char *)((char *)pbVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_25_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x4) = (char)V;
- *(byte *)((char *)pbVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_25_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x4) = (byte)V;
- *(char *)((char *)pbVar3 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_25_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x4) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->chain_word = (ushort)V;

...>
}

@receiver_25_w_4_34_word_ushort@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- ((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
)
...>
}


@receiver_25_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(undefined2 *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- ((undefined2 *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
)
...>
}


@receiver_25_w_4_34_word_short@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- ((short *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
|
- *(short *)((short *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_signed
)
...>
}


@receiver_25_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((byte *)pbVar3)[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (byte)((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_25_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((undefined1 *)pbVar3)[0x4]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x2)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (undefined1)((ushort *)pbVar3)[0x2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_25_w_4_34_address_4@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &*(char *)((byte *)pbVar3 + 0x4)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &((char *)pbVar3)[0x4]
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- &*(char *)((ushort *)pbVar3 + 0x2)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_25_w_4_34_store_4@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x4) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- ((char *)pbVar3)[0x4] = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x2) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_low = (byte)E;
)
...>
}


@receiver_25_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)((byte *)pbVar3 + 0x4)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- ((char *)pbVar3)[0x4]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- *(char *)((ushort *)pbVar3 + 0x2)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
|
- (char)((ushort *)pbVar3)[0x2]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_low
)
...>
}


@receiver_25_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(byte *)((byte *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((byte *)pbVar3)[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_25_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x5)
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((undefined1 *)pbVar3)[0x5]
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_25_w_4_34_address_5@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- &*(char *)((byte *)pbVar3 + 0x5)
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- &((char *)pbVar3)[0x5]
+ (char *)&((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_25_w_4_34_store_5@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x5) = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
|
- ((char *)pbVar3)[0x5] = E;
+ ((uw_object_hdr_t *)pbVar3)->chain_word_high = (byte)E;
)
...>
}


@receiver_25_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- *(char *)((byte *)pbVar3 + 0x5)
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
|
- ((char *)pbVar3)[0x5]
+ (char)((uw_object_hdr_t *)pbVar3)->chain_word_high
)
...>
}


@receiver_25_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x6) = (char)V;
- *(char *)((char *)pbVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_25_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pbVar3 + 0x6) = (char)V;
- *(byte *)((char *)pbVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_25_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x6) = (byte)V;
- *(char *)((char *)pbVar3 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_25_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pbVar3 + 0x6) = (byte)V;
- *(byte *)((char *)pbVar3 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pbVar3)->link_word = (ushort)V;

...>
}

@receiver_25_w_6_51_word_ushort@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- ((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word
)
...>
}


@receiver_25_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(undefined2 *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- ((undefined2 *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(undefined2 *)((undefined2 *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word
)
...>
}


@receiver_25_w_6_51_word_short@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- ((short *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
|
- *(short *)((short *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_signed
)
...>
}


@receiver_25_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((byte *)pbVar3)[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(byte *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (byte)((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_25_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)((byte *)pbVar3 + 0x6)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((undefined1 *)pbVar3)[0x6]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(undefined1 *)((ushort *)pbVar3 + 0x3)
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (undefined1)((ushort *)pbVar3)[0x3]
+ ((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_25_w_6_51_address_6@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &*(char *)((byte *)pbVar3 + 0x6)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &((char *)pbVar3)[0x6]
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
|
- &*(char *)((ushort *)pbVar3 + 0x3)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_25_w_6_51_store_6@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x6) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- ((char *)pbVar3)[0x6] = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pbVar3 + 0x3) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_low = (byte)E;
)
...>
}


@receiver_25_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)((byte *)pbVar3 + 0x6)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- ((char *)pbVar3)[0x6]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- *(char *)((ushort *)pbVar3 + 0x3)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
|
- (char)((ushort *)pbVar3)[0x3]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_low
)
...>
}


@receiver_25_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(byte *)((byte *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((byte *)pbVar3)[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_25_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(undefined1 *)((byte *)pbVar3 + 0x7)
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((undefined1 *)pbVar3)[0x7]
+ ((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_25_w_6_51_address_7@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pbVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
|
- &*(char *)((byte *)pbVar3 + 0x7)
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
|
- &((char *)pbVar3)[0x7]
+ (char *)&((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_25_w_6_51_store_7@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- *(char *)((byte *)pbVar3 + 0x7) = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
|
- ((char *)pbVar3)[0x7] = E;
+ ((uw_object_hdr_t *)pbVar3)->link_word_high = (byte)E;
)
...>
}


@receiver_25_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- *(char *)((byte *)pbVar3 + 0x7)
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
|
- ((char *)pbVar3)[0x7]
+ (char)((uw_object_hdr_t *)pbVar3)->link_word_high
)
...>
}


@receiver_26_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x0) = (char)V;
- *(char *)((char *)pWalk + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->type_flags = (ushort)V;

...>
}

@receiver_26_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x0) = (char)V;
- *(byte *)((char *)pWalk + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->type_flags = (ushort)V;

...>
}

@receiver_26_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x0) = (byte)V;
- *(char *)((char *)pWalk + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->type_flags = (ushort)V;

...>
}

@receiver_26_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x0) = (byte)V;
- *(byte *)((char *)pWalk + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->type_flags = (ushort)V;

...>
}

@receiver_26_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *(ushort *)((byte *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- ((ushort *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *(ushort *)((ushort *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *(ushort *)(pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- pWalk[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *pWalk
+ ((uw_object_hdr_t *)pWalk)->type_flags
)
...>
}


@receiver_26_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *(undefined2 *)((byte *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- ((undefined2 *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *(undefined2 *)((undefined2 *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *(undefined2 *)(pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- pWalk[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags
|
- *pWalk
+ ((uw_object_hdr_t *)pWalk)->type_flags
)
...>
}


@receiver_26_w_0_0_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_signed
|
- *(short *)((byte *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_signed
|
- ((short *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_signed
|
- *(short *)((short *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_signed
|
- *(short *)(pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_signed
)
...>
}


@receiver_26_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(byte *)((byte *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- ((byte *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(byte *)((ushort *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- (byte)((ushort *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(byte *)pWalk
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(byte *)(pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- (byte)pWalk[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
)
...>
}


@receiver_26_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(undefined1 *)((byte *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- ((undefined1 *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(undefined1 *)((ushort *)pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- (undefined1)((ushort *)pWalk)[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(undefined1 *)pWalk
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(undefined1 *)(pWalk + 0x0)
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
|
- (undefined1)pWalk[0x0]
+ ((uw_object_hdr_t *)pWalk)->type_flags_low
)
...>
}


@receiver_26_w_0_0_address_0@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x0)
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_low
|
- &*(char *)((byte *)pWalk + 0x0)
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_low
|
- &((char *)pWalk)[0x0]
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_low
|
- &*(char *)((ushort *)pWalk + 0x0)
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_low
|
- &*(char *)pWalk
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_low
|
- &*(char *)(pWalk + 0x0)
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_low
)
...>
}


@receiver_26_w_0_0_store_0@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x0) = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_low = (byte)E;
|
- *(char *)((byte *)pWalk + 0x0) = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_low = (byte)E;
|
- ((char *)pWalk)[0x0] = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)pWalk + 0x0) = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_low = (byte)E;
|
- *(char *)pWalk = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_low = (byte)E;
|
- *(char *)(pWalk + 0x0) = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_low = (byte)E;
)
...>
}


@receiver_26_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x0)
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(char *)((byte *)pWalk + 0x0)
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- ((char *)pWalk)[0x0]
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(char *)((ushort *)pWalk + 0x0)
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- (char)((ushort *)pWalk)[0x0]
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(char *)pWalk
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- *(char *)(pWalk + 0x0)
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
|
- (char)pWalk[0x0]
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_low
)
...>
}


@receiver_26_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->type_flags_high
|
- *(byte *)((byte *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->type_flags_high
|
- ((byte *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->type_flags_high
)
...>
}


@receiver_26_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->type_flags_high
|
- *(undefined1 *)((byte *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->type_flags_high
|
- ((undefined1 *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->type_flags_high
)
...>
}


@receiver_26_w_0_0_address_1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x1)
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_high
|
- &*(char *)((byte *)pWalk + 0x1)
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_high
|
- &((char *)pWalk)[0x1]
+ (char *)&((uw_object_hdr_t *)pWalk)->type_flags_high
)
...>
}


@receiver_26_w_0_0_store_1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x1) = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_high = (byte)E;
|
- *(char *)((byte *)pWalk + 0x1) = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_high = (byte)E;
|
- ((char *)pWalk)[0x1] = E;
+ ((uw_object_hdr_t *)pWalk)->type_flags_high = (byte)E;
)
...>
}


@receiver_26_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x1)
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_high
|
- *(char *)((byte *)pWalk + 0x1)
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_high
|
- ((char *)pWalk)[0x1]
+ (char)((uw_object_hdr_t *)pWalk)->type_flags_high
)
...>
}


@receiver_26_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x2) = (char)V;
- *(char *)((char *)pWalk + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->position_word = (ushort)V;

...>
}

@receiver_26_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x2) = (char)V;
- *(byte *)((char *)pWalk + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->position_word = (ushort)V;

...>
}

@receiver_26_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x2) = (byte)V;
- *(char *)((char *)pWalk + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->position_word = (ushort)V;

...>
}

@receiver_26_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x2) = (byte)V;
- *(byte *)((char *)pWalk + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->position_word = (ushort)V;

...>
}

@receiver_26_w_2_17_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- *(ushort *)((byte *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- ((ushort *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- *(ushort *)((ushort *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- *(ushort *)(pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- pWalk[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word
)
...>
}


@receiver_26_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- *(undefined2 *)((byte *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- ((undefined2 *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- *(undefined2 *)((undefined2 *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- *(undefined2 *)(pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word
|
- pWalk[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word
)
...>
}


@receiver_26_w_2_17_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word_signed
|
- *(short *)((byte *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word_signed
|
- ((short *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word_signed
|
- *(short *)((short *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word_signed
|
- *(short *)(pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word_signed
)
...>
}


@receiver_26_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(byte *)((byte *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- ((byte *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(byte *)((ushort *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- (byte)((ushort *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(byte *)(pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- (byte)pWalk[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word_low
)
...>
}


@receiver_26_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(undefined1 *)((byte *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- ((undefined1 *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(undefined1 *)((ushort *)pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- (undefined1)((ushort *)pWalk)[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(undefined1 *)(pWalk + 0x1)
+ ((uw_object_hdr_t *)pWalk)->position_word_low
|
- (undefined1)pWalk[0x1]
+ ((uw_object_hdr_t *)pWalk)->position_word_low
)
...>
}


@receiver_26_w_2_17_address_2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x2)
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_low
|
- &*(char *)((byte *)pWalk + 0x2)
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_low
|
- &((char *)pWalk)[0x2]
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_low
|
- &*(char *)((ushort *)pWalk + 0x1)
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_low
|
- &*(char *)(pWalk + 0x1)
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_low
)
...>
}


@receiver_26_w_2_17_store_2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x2) = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_low = (byte)E;
|
- *(char *)((byte *)pWalk + 0x2) = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_low = (byte)E;
|
- ((char *)pWalk)[0x2] = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_low = (byte)E;
|
- *(char *)((ushort *)pWalk + 0x1) = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_low = (byte)E;
|
- *(char *)(pWalk + 0x1) = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_low = (byte)E;
)
...>
}


@receiver_26_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x2)
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(char *)((byte *)pWalk + 0x2)
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
|
- ((char *)pWalk)[0x2]
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(char *)((ushort *)pWalk + 0x1)
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
|
- (char)((ushort *)pWalk)[0x1]
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
|
- *(char *)(pWalk + 0x1)
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
|
- (char)pWalk[0x1]
+ (char)((uw_object_hdr_t *)pWalk)->position_word_low
)
...>
}


@receiver_26_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->position_word_high
|
- *(byte *)((byte *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->position_word_high
|
- ((byte *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->position_word_high
)
...>
}


@receiver_26_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->position_word_high
|
- *(undefined1 *)((byte *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->position_word_high
|
- ((undefined1 *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->position_word_high
)
...>
}


@receiver_26_w_2_17_address_3@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x3)
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_high
|
- &*(char *)((byte *)pWalk + 0x3)
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_high
|
- &((char *)pWalk)[0x3]
+ (char *)&((uw_object_hdr_t *)pWalk)->position_word_high
)
...>
}


@receiver_26_w_2_17_store_3@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x3) = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_high = (byte)E;
|
- *(char *)((byte *)pWalk + 0x3) = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_high = (byte)E;
|
- ((char *)pWalk)[0x3] = E;
+ ((uw_object_hdr_t *)pWalk)->position_word_high = (byte)E;
)
...>
}


@receiver_26_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x3)
+ (char)((uw_object_hdr_t *)pWalk)->position_word_high
|
- *(char *)((byte *)pWalk + 0x3)
+ (char)((uw_object_hdr_t *)pWalk)->position_word_high
|
- ((char *)pWalk)[0x3]
+ (char)((uw_object_hdr_t *)pWalk)->position_word_high
)
...>
}


@receiver_26_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x4) = (char)V;
- *(char *)((char *)pWalk + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->chain_word = (ushort)V;

...>
}

@receiver_26_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x4) = (char)V;
- *(byte *)((char *)pWalk + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->chain_word = (ushort)V;

...>
}

@receiver_26_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x4) = (byte)V;
- *(char *)((char *)pWalk + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->chain_word = (ushort)V;

...>
}

@receiver_26_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x4) = (byte)V;
- *(byte *)((char *)pWalk + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->chain_word = (ushort)V;

...>
}

@receiver_26_w_4_34_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- *(ushort *)((byte *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- ((ushort *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- *(ushort *)((ushort *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- *(ushort *)(pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- pWalk[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word
)
...>
}


@receiver_26_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- *(undefined2 *)((byte *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- ((undefined2 *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- *(undefined2 *)((undefined2 *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- *(undefined2 *)(pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word
|
- pWalk[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word
)
...>
}


@receiver_26_w_4_34_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word_signed
|
- *(short *)((byte *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word_signed
|
- ((short *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word_signed
|
- *(short *)((short *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word_signed
|
- *(short *)(pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word_signed
)
...>
}


@receiver_26_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(byte *)((byte *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- ((byte *)pWalk)[0x4]
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(byte *)((ushort *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- (byte)((ushort *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(byte *)(pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- (byte)pWalk[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
)
...>
}


@receiver_26_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(undefined1 *)((byte *)pWalk + 0x4)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- ((undefined1 *)pWalk)[0x4]
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(undefined1 *)((ushort *)pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- (undefined1)((ushort *)pWalk)[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(undefined1 *)(pWalk + 0x2)
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
|
- (undefined1)pWalk[0x2]
+ ((uw_object_hdr_t *)pWalk)->chain_word_low
)
...>
}


@receiver_26_w_4_34_address_4@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x4)
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_low
|
- &*(char *)((byte *)pWalk + 0x4)
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_low
|
- &((char *)pWalk)[0x4]
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_low
|
- &*(char *)((ushort *)pWalk + 0x2)
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_low
|
- &*(char *)(pWalk + 0x2)
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_low
)
...>
}


@receiver_26_w_4_34_store_4@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x4) = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_low = (byte)E;
|
- *(char *)((byte *)pWalk + 0x4) = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_low = (byte)E;
|
- ((char *)pWalk)[0x4] = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)pWalk + 0x2) = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_low = (byte)E;
|
- *(char *)(pWalk + 0x2) = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_low = (byte)E;
)
...>
}


@receiver_26_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x4)
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(char *)((byte *)pWalk + 0x4)
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
|
- ((char *)pWalk)[0x4]
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(char *)((ushort *)pWalk + 0x2)
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
|
- (char)((ushort *)pWalk)[0x2]
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
|
- *(char *)(pWalk + 0x2)
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
|
- (char)pWalk[0x2]
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_low
)
...>
}


@receiver_26_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x5)
+ ((uw_object_hdr_t *)pWalk)->chain_word_high
|
- *(byte *)((byte *)pWalk + 0x5)
+ ((uw_object_hdr_t *)pWalk)->chain_word_high
|
- ((byte *)pWalk)[0x5]
+ ((uw_object_hdr_t *)pWalk)->chain_word_high
)
...>
}


@receiver_26_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x5)
+ ((uw_object_hdr_t *)pWalk)->chain_word_high
|
- *(undefined1 *)((byte *)pWalk + 0x5)
+ ((uw_object_hdr_t *)pWalk)->chain_word_high
|
- ((undefined1 *)pWalk)[0x5]
+ ((uw_object_hdr_t *)pWalk)->chain_word_high
)
...>
}


@receiver_26_w_4_34_address_5@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x5)
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_high
|
- &*(char *)((byte *)pWalk + 0x5)
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_high
|
- &((char *)pWalk)[0x5]
+ (char *)&((uw_object_hdr_t *)pWalk)->chain_word_high
)
...>
}


@receiver_26_w_4_34_store_5@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x5) = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_high = (byte)E;
|
- *(char *)((byte *)pWalk + 0x5) = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_high = (byte)E;
|
- ((char *)pWalk)[0x5] = E;
+ ((uw_object_hdr_t *)pWalk)->chain_word_high = (byte)E;
)
...>
}


@receiver_26_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x5)
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_high
|
- *(char *)((byte *)pWalk + 0x5)
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_high
|
- ((char *)pWalk)[0x5]
+ (char)((uw_object_hdr_t *)pWalk)->chain_word_high
)
...>
}


@receiver_26_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x6) = (char)V;
- *(char *)((char *)pWalk + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->link_word = (ushort)V;

...>
}

@receiver_26_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)pWalk + 0x6) = (char)V;
- *(byte *)((char *)pWalk + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->link_word = (ushort)V;

...>
}

@receiver_26_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x6) = (byte)V;
- *(char *)((char *)pWalk + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->link_word = (ushort)V;

...>
}

@receiver_26_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)pWalk + 0x6) = (byte)V;
- *(byte *)((char *)pWalk + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)pWalk)->link_word = (ushort)V;

...>
}

@receiver_26_w_6_51_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- *(ushort *)((byte *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- ((ushort *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- *(ushort *)((ushort *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- *(ushort *)(pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- pWalk[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word
)
...>
}


@receiver_26_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- *(undefined2 *)((byte *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- ((undefined2 *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- *(undefined2 *)((undefined2 *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- *(undefined2 *)(pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word
|
- pWalk[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word
)
...>
}


@receiver_26_w_6_51_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word_signed
|
- *(short *)((byte *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word_signed
|
- ((short *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word_signed
|
- *(short *)((short *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word_signed
|
- *(short *)(pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word_signed
)
...>
}


@receiver_26_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(byte *)((byte *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- ((byte *)pWalk)[0x6]
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(byte *)((ushort *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- (byte)((ushort *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(byte *)(pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- (byte)pWalk[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word_low
)
...>
}


@receiver_26_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(undefined1 *)((byte *)pWalk + 0x6)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- ((undefined1 *)pWalk)[0x6]
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(undefined1 *)((ushort *)pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- (undefined1)((ushort *)pWalk)[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(undefined1 *)(pWalk + 0x3)
+ ((uw_object_hdr_t *)pWalk)->link_word_low
|
- (undefined1)pWalk[0x3]
+ ((uw_object_hdr_t *)pWalk)->link_word_low
)
...>
}


@receiver_26_w_6_51_address_6@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x6)
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_low
|
- &*(char *)((byte *)pWalk + 0x6)
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_low
|
- &((char *)pWalk)[0x6]
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_low
|
- &*(char *)((ushort *)pWalk + 0x3)
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_low
|
- &*(char *)(pWalk + 0x3)
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_low
)
...>
}


@receiver_26_w_6_51_store_6@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x6) = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_low = (byte)E;
|
- *(char *)((byte *)pWalk + 0x6) = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_low = (byte)E;
|
- ((char *)pWalk)[0x6] = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_low = (byte)E;
|
- *(char *)((ushort *)pWalk + 0x3) = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_low = (byte)E;
|
- *(char *)(pWalk + 0x3) = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_low = (byte)E;
)
...>
}


@receiver_26_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x6)
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(char *)((byte *)pWalk + 0x6)
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
|
- ((char *)pWalk)[0x6]
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(char *)((ushort *)pWalk + 0x3)
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
|
- (char)((ushort *)pWalk)[0x3]
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
|
- *(char *)(pWalk + 0x3)
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
|
- (char)pWalk[0x3]
+ (char)((uw_object_hdr_t *)pWalk)->link_word_low
)
...>
}


@receiver_26_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)pWalk + 0x7)
+ ((uw_object_hdr_t *)pWalk)->link_word_high
|
- *(byte *)((byte *)pWalk + 0x7)
+ ((uw_object_hdr_t *)pWalk)->link_word_high
|
- ((byte *)pWalk)[0x7]
+ ((uw_object_hdr_t *)pWalk)->link_word_high
)
...>
}


@receiver_26_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)pWalk + 0x7)
+ ((uw_object_hdr_t *)pWalk)->link_word_high
|
- *(undefined1 *)((byte *)pWalk + 0x7)
+ ((uw_object_hdr_t *)pWalk)->link_word_high
|
- ((undefined1 *)pWalk)[0x7]
+ ((uw_object_hdr_t *)pWalk)->link_word_high
)
...>
}


@receiver_26_w_6_51_address_7@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)pWalk + 0x7)
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_high
|
- &*(char *)((byte *)pWalk + 0x7)
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_high
|
- &((char *)pWalk)[0x7]
+ (char *)&((uw_object_hdr_t *)pWalk)->link_word_high
)
...>
}


@receiver_26_w_6_51_store_7@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x7) = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_high = (byte)E;
|
- *(char *)((byte *)pWalk + 0x7) = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_high = (byte)E;
|
- ((char *)pWalk)[0x7] = E;
+ ((uw_object_hdr_t *)pWalk)->link_word_high = (byte)E;
)
...>
}


@receiver_26_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)pWalk + 0x7)
+ (char)((uw_object_hdr_t *)pWalk)->link_word_high
|
- *(char *)((byte *)pWalk + 0x7)
+ (char)((uw_object_hdr_t *)pWalk)->link_word_high
|
- ((char *)pWalk)[0x7]
+ (char)((uw_object_hdr_t *)pWalk)->link_word_high
)
...>
}


@receiver_27_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x0) = (char)V;
- *(char *)((char *)puVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_27_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x0) = (char)V;
- *(byte *)((char *)puVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_27_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x0) = (byte)V;
- *(char *)((char *)puVar2 + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_27_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x0) = (byte)V;
- *(byte *)((char *)puVar2 + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->type_flags = (ushort)V;

...>
}

@receiver_27_w_0_0_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_27_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((undefined2 *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(undefined2 *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}


@receiver_27_w_0_0_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- ((short *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)((short *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
|
- *(short *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_signed
)
...>
}


@receiver_27_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((byte *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (byte)((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(byte *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (byte)puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_27_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)((byte *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((undefined1 *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (undefined1)((ushort *)puVar2)[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(undefined1 *)(puVar2 + 0x0)
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (undefined1)puVar2[0x0]
+ ((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_27_w_0_0_address_0@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)((byte *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &((char *)puVar2)[0x0]
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)((ushort *)puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)puVar2
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
|
- &*(char *)(puVar2 + 0x0)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_27_w_0_0_store_0@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- ((char *)puVar2)[0x0] = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)puVar2 = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
|
- *(char *)(puVar2 + 0x0) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_low = (byte)E;
)
...>
}


@receiver_27_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)((byte *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- ((char *)puVar2)[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)((ushort *)puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (char)((ushort *)puVar2)[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)puVar2
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- *(char *)(puVar2 + 0x0)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
|
- (char)puVar2[0x0]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_low
)
...>
}


@receiver_27_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(byte *)((byte *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((byte *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_27_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(undefined1 *)((byte *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((undefined1 *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_27_w_0_0_address_1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
|
- &*(char *)((byte *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
|
- &((char *)puVar2)[0x1]
+ (char *)&((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_27_w_0_0_store_1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
|
- ((char *)puVar2)[0x1] = E;
+ ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)E;
)
...>
}


@receiver_27_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
|
- *(char *)((byte *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
|
- ((char *)puVar2)[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->type_flags_high
)
...>
}


@receiver_27_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x2) = (char)V;
- *(char *)((char *)puVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_27_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x2) = (char)V;
- *(byte *)((char *)puVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_27_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x2) = (byte)V;
- *(char *)((char *)puVar2 + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_27_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x2) = (byte)V;
- *(byte *)((char *)puVar2 + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->position_word = (ushort)V;

...>
}

@receiver_27_w_2_17_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(ushort *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_27_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((undefined2 *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- *(undefined2 *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}


@receiver_27_w_2_17_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- ((short *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)((short *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
|
- *(short *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_signed
)
...>
}


@receiver_27_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((byte *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (byte)((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(byte *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (byte)puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_27_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((undefined1 *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (undefined1)((ushort *)puVar2)[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(undefined1 *)(puVar2 + 0x1)
+ ((uw_object_hdr_t *)puVar2)->position_word_low
|
- (undefined1)puVar2[0x1]
+ ((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_27_w_2_17_address_2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)((byte *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &((char *)puVar2)[0x2]
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)((ushort *)puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
|
- &*(char *)(puVar2 + 0x1)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_27_w_2_17_store_2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- ((char *)puVar2)[0x2] = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
|
- *(char *)(puVar2 + 0x1) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_low = (byte)E;
)
...>
}


@receiver_27_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)((byte *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- ((char *)puVar2)[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)((ushort *)puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- (char)((ushort *)puVar2)[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- *(char *)(puVar2 + 0x1)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
|
- (char)puVar2[0x1]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_low
)
...>
}


@receiver_27_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(byte *)((byte *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((byte *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_27_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((undefined1 *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_27_w_2_17_address_3@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
|
- &*(char *)((byte *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
|
- &((char *)puVar2)[0x3]
+ (char *)&((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_27_w_2_17_store_3@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
|
- ((char *)puVar2)[0x3] = E;
+ ((uw_object_hdr_t *)puVar2)->position_word_high = (byte)E;
)
...>
}


@receiver_27_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
|
- *(char *)((byte *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
|
- ((char *)puVar2)[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->position_word_high
)
...>
}


@receiver_27_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x4) = (char)V;
- *(char *)((char *)puVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_27_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x4) = (char)V;
- *(byte *)((char *)puVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_27_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x4) = (byte)V;
- *(char *)((char *)puVar2 + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_27_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x4) = (byte)V;
- *(byte *)((char *)puVar2 + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->chain_word = (ushort)V;

...>
}

@receiver_27_w_4_34_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(ushort *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_27_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((undefined2 *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- *(undefined2 *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}


@receiver_27_w_4_34_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- ((short *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)((short *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
|
- *(short *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_signed
)
...>
}


@receiver_27_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((byte *)puVar2)[0x4]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (byte)((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(byte *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (byte)puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_27_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x4)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((undefined1 *)puVar2)[0x4]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (undefined1)((ushort *)puVar2)[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(undefined1 *)(puVar2 + 0x2)
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (undefined1)puVar2[0x2]
+ ((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_27_w_4_34_address_4@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)((byte *)puVar2 + 0x4)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &((char *)puVar2)[0x4]
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)((ushort *)puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
|
- &*(char *)(puVar2 + 0x2)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_27_w_4_34_store_4@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x4) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- ((char *)puVar2)[0x4] = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
|
- *(char *)(puVar2 + 0x2) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_low = (byte)E;
)
...>
}


@receiver_27_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x4)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)((byte *)puVar2 + 0x4)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- ((char *)puVar2)[0x4]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)((ushort *)puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (char)((ushort *)puVar2)[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- *(char *)(puVar2 + 0x2)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
|
- (char)puVar2[0x2]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_low
)
...>
}


@receiver_27_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(byte *)((byte *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((byte *)puVar2)[0x5]
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_27_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x5)
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((undefined1 *)puVar2)[0x5]
+ ((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_27_w_4_34_address_5@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
|
- &*(char *)((byte *)puVar2 + 0x5)
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
|
- &((char *)puVar2)[0x5]
+ (char *)&((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_27_w_4_34_store_5@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x5) = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
|
- ((char *)puVar2)[0x5] = E;
+ ((uw_object_hdr_t *)puVar2)->chain_word_high = (byte)E;
)
...>
}


@receiver_27_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x5)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
|
- *(char *)((byte *)puVar2 + 0x5)
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
|
- ((char *)puVar2)[0x5]
+ (char)((uw_object_hdr_t *)puVar2)->chain_word_high
)
...>
}


@receiver_27_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x6) = (char)V;
- *(char *)((char *)puVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_27_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x6) = (char)V;
- *(byte *)((char *)puVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_27_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x6) = (byte)V;
- *(char *)((char *)puVar2 + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_27_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x6) = (byte)V;
- *(byte *)((char *)puVar2 + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)puVar2)->link_word = (ushort)V;

...>
}

@receiver_27_w_6_51_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(ushort *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_27_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((undefined2 *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)((undefined2 *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- *(undefined2 *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}


@receiver_27_w_6_51_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- ((short *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)((short *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
|
- *(short *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_signed
)
...>
}


@receiver_27_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((byte *)puVar2)[0x6]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (byte)((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(byte *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (byte)puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_27_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)((byte *)puVar2 + 0x6)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((undefined1 *)puVar2)[0x6]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)((ushort *)puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (undefined1)((ushort *)puVar2)[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(undefined1 *)(puVar2 + 0x3)
+ ((uw_object_hdr_t *)puVar2)->link_word_low
|
- (undefined1)puVar2[0x3]
+ ((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_27_w_6_51_address_6@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)((byte *)puVar2 + 0x6)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &((char *)puVar2)[0x6]
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)((ushort *)puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
|
- &*(char *)(puVar2 + 0x3)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_27_w_6_51_store_6@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x6) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- ((char *)puVar2)[0x6] = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
|
- *(char *)(puVar2 + 0x3) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_low = (byte)E;
)
...>
}


@receiver_27_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x6)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)((byte *)puVar2 + 0x6)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- ((char *)puVar2)[0x6]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)((ushort *)puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- (char)((ushort *)puVar2)[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- *(char *)(puVar2 + 0x3)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
|
- (char)puVar2[0x3]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_low
)
...>
}


@receiver_27_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(byte *)((byte *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((byte *)puVar2)[0x7]
+ ((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_27_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(undefined1 *)((byte *)puVar2 + 0x7)
+ ((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((undefined1 *)puVar2)[0x7]
+ ((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_27_w_6_51_address_7@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
|
- &*(char *)((byte *)puVar2 + 0x7)
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
|
- &((char *)puVar2)[0x7]
+ (char *)&((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}


@receiver_27_w_6_51_store_7@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x7) = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
|
- ((char *)puVar2)[0x7] = E;
+ ((uw_object_hdr_t *)puVar2)->link_word_high = (byte)E;
)
...>
}


@receiver_27_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x7)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
|
- *(char *)((byte *)puVar2 + 0x7)
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
|
- ((char *)puVar2)[0x7]
+ (char)((uw_object_hdr_t *)puVar2)->link_word_high
)
...>
}

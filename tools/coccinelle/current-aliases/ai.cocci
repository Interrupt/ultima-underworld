@npc_walk_toward_tile_npc_bytes_word_0_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags
|
- *(ushort *)(npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags
|
- *(ushort *)npc_bytes
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_0_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags
|
- *(undefined2 *)(npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags
|
- *(undefined2 *)npc_bytes
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_0_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_signed
|
- *(short *)(npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_signed
|
- *(short *)npc_bytes
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_2_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word
|
- *(ushort *)(npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_2_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word
|
- *(undefined2 *)(npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_2_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_signed
|
- *(short *)(npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_4_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word
|
- *(ushort *)(npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_4_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word
|
- *(undefined2 *)(npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_4_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_signed
|
- *(short *)(npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_6_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word
|
- *(ushort *)(npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_6_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word
|
- *(undefined2 *)(npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_6_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_signed
|
- *(short *)(npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_11_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word
|
- *(ushort *)(npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_11_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word
|
- *(undefined2 *)(npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_11_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_signed
|
- *(short *)(npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_13_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word
|
- *(ushort *)(npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_13_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word
|
- *(undefined2 *)(npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_13_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_signed
|
- *(short *)(npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_15_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word
|
- *(ushort *)(npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_15_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word
|
- *(undefined2 *)(npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_15_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_signed
|
- *(short *)(npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_22_ushort@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word
|
- *(ushort *)(npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_22_undefined2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word
|
- *(undefined2 *)(npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word
)
...>
}

@npc_walk_toward_tile_npc_bytes_word_22_short@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_signed
|
- *(short *)(npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_signed
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_0_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- *(byte *)(npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- *(byte *)npc_bytes
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- *(undefined1 *)(npc_bytes + 0)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- *(undefined1 *)npc_bytes
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_0_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 0)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- &*(char *)(npc_bytes + 0)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- &*(char *)npc_bytes
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- &npc_bytes[0]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_0_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low = (byte)E;
|
- *(char *)(npc_bytes + 0) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low = (byte)E;
|
- *(char *)npc_bytes = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low = (byte)E;
|
- npc_bytes[0] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_0_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 0)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- *(char *)(npc_bytes + 0)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- *(char *)npc_bytes
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
|
- npc_bytes[0]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_1_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 1)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
|
- *(byte *)(npc_bytes + 1)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 1)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
|
- *(undefined1 *)(npc_bytes + 1)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_1_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 1)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
|
- &*(char *)(npc_bytes + 1)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
|
- &npc_bytes[1]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_1_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 1) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high = (byte)E;
|
- *(char *)(npc_bytes + 1) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high = (byte)E;
|
- npc_bytes[1] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_1_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 1)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
|
- *(char *)(npc_bytes + 1)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
|
- npc_bytes[1]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.type_flags_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_2_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
|
- *(byte *)(npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
|
- *(undefined1 *)(npc_bytes + 2)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_2_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 2)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
|
- &*(char *)(npc_bytes + 2)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
|
- &npc_bytes[2]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_2_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 2) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low = (byte)E;
|
- *(char *)(npc_bytes + 2) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low = (byte)E;
|
- npc_bytes[2] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_2_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 2)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
|
- *(char *)(npc_bytes + 2)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
|
- npc_bytes[2]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.position_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_3_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 3)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
|
- *(byte *)(npc_bytes + 3)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 3)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
|
- *(undefined1 *)(npc_bytes + 3)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_3_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 3)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
|
- &*(char *)(npc_bytes + 3)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
|
- &npc_bytes[3]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_3_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 3) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high = (byte)E;
|
- *(char *)(npc_bytes + 3) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high = (byte)E;
|
- npc_bytes[3] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_3_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 3)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
|
- *(char *)(npc_bytes + 3)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
|
- npc_bytes[3]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.position_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_4_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
|
- *(byte *)(npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
|
- *(undefined1 *)(npc_bytes + 4)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_4_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 4)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
|
- &*(char *)(npc_bytes + 4)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
|
- &npc_bytes[4]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_4_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 4) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low = (byte)E;
|
- *(char *)(npc_bytes + 4) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low = (byte)E;
|
- npc_bytes[4] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_4_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 4)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
|
- *(char *)(npc_bytes + 4)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
|
- npc_bytes[4]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_5_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 5)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
|
- *(byte *)(npc_bytes + 5)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 5)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
|
- *(undefined1 *)(npc_bytes + 5)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_5_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 5)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
|
- &*(char *)(npc_bytes + 5)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
|
- &npc_bytes[5]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_5_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 5) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high = (byte)E;
|
- *(char *)(npc_bytes + 5) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high = (byte)E;
|
- npc_bytes[5] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_5_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 5)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
|
- *(char *)(npc_bytes + 5)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
|
- npc_bytes[5]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.chain_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_6_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
|
- *(byte *)(npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
|
- *(undefined1 *)(npc_bytes + 6)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_6_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 6)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
|
- &*(char *)(npc_bytes + 6)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
|
- &npc_bytes[6]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_6_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 6) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low = (byte)E;
|
- *(char *)(npc_bytes + 6) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low = (byte)E;
|
- npc_bytes[6] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_6_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 6)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
|
- *(char *)(npc_bytes + 6)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
|
- npc_bytes[6]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.link_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_7_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 7)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
|
- *(byte *)(npc_bytes + 7)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 7)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
|
- *(undefined1 *)(npc_bytes + 7)
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_7_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 7)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
|
- &*(char *)(npc_bytes + 7)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
|
- &npc_bytes[7]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_7_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 7) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high = (byte)E;
|
- *(char *)(npc_bytes + 7) = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high = (byte)E;
|
- npc_bytes[7] = E;
+ ((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_7_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 7)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
|
- *(char *)(npc_bytes + 7)
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
|
- npc_bytes[7]
+ (char)((uw_mobile_object_t *)npc_bytes)->hdr.link_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_8_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 8)
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp
|
- *(byte *)(npc_bytes + 8)
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 8)
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp
|
- *(undefined1 *)(npc_bytes + 8)
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_8_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 8)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_hp
|
- &*(char *)(npc_bytes + 8)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_hp
|
- &npc_bytes[8]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_hp
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_8_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 8) = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp = (byte)E;
|
- *(char *)(npc_bytes + 8) = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp = (byte)E;
|
- npc_bytes[8] = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_hp = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_8_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 8)
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_hp
|
- *(char *)(npc_bytes + 8)
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_hp
|
- npc_bytes[8]
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_hp
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_9_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 9)
+ ((uw_mobile_object_t *)npc_bytes)->full_heading
|
- *(byte *)(npc_bytes + 9)
+ ((uw_mobile_object_t *)npc_bytes)->full_heading
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 9)
+ ((uw_mobile_object_t *)npc_bytes)->full_heading
|
- *(undefined1 *)(npc_bytes + 9)
+ ((uw_mobile_object_t *)npc_bytes)->full_heading
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_9_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 9)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->full_heading
|
- &*(char *)(npc_bytes + 9)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->full_heading
|
- &npc_bytes[9]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->full_heading
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_9_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 9) = E;
+ ((uw_mobile_object_t *)npc_bytes)->full_heading = (byte)E;
|
- *(char *)(npc_bytes + 9) = E;
+ ((uw_mobile_object_t *)npc_bytes)->full_heading = (byte)E;
|
- npc_bytes[9] = E;
+ ((uw_mobile_object_t *)npc_bytes)->full_heading = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_9_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 9)
+ (char)((uw_mobile_object_t *)npc_bytes)->full_heading
|
- *(char *)(npc_bytes + 9)
+ (char)((uw_mobile_object_t *)npc_bytes)->full_heading
|
- npc_bytes[9]
+ (char)((uw_mobile_object_t *)npc_bytes)->full_heading
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_10_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 10)
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags
|
- *(byte *)(npc_bytes + 10)
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 10)
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags
|
- *(undefined1 *)(npc_bytes + 10)
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_10_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 10)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->movement_flags
|
- &*(char *)(npc_bytes + 10)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->movement_flags
|
- &npc_bytes[10]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->movement_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_10_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 10) = E;
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags = (byte)E;
|
- *(char *)(npc_bytes + 10) = E;
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags = (byte)E;
|
- npc_bytes[10] = E;
+ ((uw_mobile_object_t *)npc_bytes)->movement_flags = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_10_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 10)
+ (char)((uw_mobile_object_t *)npc_bytes)->movement_flags
|
- *(char *)(npc_bytes + 10)
+ (char)((uw_mobile_object_t *)npc_bytes)->movement_flags
|
- npc_bytes[10]
+ (char)((uw_mobile_object_t *)npc_bytes)->movement_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_11_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low
|
- *(byte *)(npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low
|
- *(undefined1 *)(npc_bytes + 11)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_11_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 11)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->goal_word_low
|
- &*(char *)(npc_bytes + 11)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->goal_word_low
|
- &npc_bytes[11]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->goal_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_11_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 11) = E;
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low = (byte)E;
|
- *(char *)(npc_bytes + 11) = E;
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low = (byte)E;
|
- npc_bytes[11] = E;
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_11_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 11)
+ (char)((uw_mobile_object_t *)npc_bytes)->goal_word_low
|
- *(char *)(npc_bytes + 11)
+ (char)((uw_mobile_object_t *)npc_bytes)->goal_word_low
|
- npc_bytes[11]
+ (char)((uw_mobile_object_t *)npc_bytes)->goal_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_12_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 12)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high
|
- *(byte *)(npc_bytes + 12)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 12)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high
|
- *(undefined1 *)(npc_bytes + 12)
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_12_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 12)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->goal_word_high
|
- &*(char *)(npc_bytes + 12)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->goal_word_high
|
- &npc_bytes[12]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->goal_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_12_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 12) = E;
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high = (byte)E;
|
- *(char *)(npc_bytes + 12) = E;
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high = (byte)E;
|
- npc_bytes[12] = E;
+ ((uw_mobile_object_t *)npc_bytes)->goal_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_12_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 12)
+ (char)((uw_mobile_object_t *)npc_bytes)->goal_word_high
|
- *(char *)(npc_bytes + 12)
+ (char)((uw_mobile_object_t *)npc_bytes)->goal_word_high
|
- npc_bytes[12]
+ (char)((uw_mobile_object_t *)npc_bytes)->goal_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_13_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low
|
- *(byte *)(npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low
|
- *(undefined1 *)(npc_bytes + 13)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_13_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 13)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->status_word_low
|
- &*(char *)(npc_bytes + 13)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->status_word_low
|
- &npc_bytes[13]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->status_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_13_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 13) = E;
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low = (byte)E;
|
- *(char *)(npc_bytes + 13) = E;
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low = (byte)E;
|
- npc_bytes[13] = E;
+ ((uw_mobile_object_t *)npc_bytes)->status_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_13_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 13)
+ (char)((uw_mobile_object_t *)npc_bytes)->status_word_low
|
- *(char *)(npc_bytes + 13)
+ (char)((uw_mobile_object_t *)npc_bytes)->status_word_low
|
- npc_bytes[13]
+ (char)((uw_mobile_object_t *)npc_bytes)->status_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_14_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 14)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high
|
- *(byte *)(npc_bytes + 14)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 14)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high
|
- *(undefined1 *)(npc_bytes + 14)
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_14_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 14)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->status_word_high
|
- &*(char *)(npc_bytes + 14)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->status_word_high
|
- &npc_bytes[14]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->status_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_14_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 14) = E;
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high = (byte)E;
|
- *(char *)(npc_bytes + 14) = E;
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high = (byte)E;
|
- npc_bytes[14] = E;
+ ((uw_mobile_object_t *)npc_bytes)->status_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_14_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 14)
+ (char)((uw_mobile_object_t *)npc_bytes)->status_word_high
|
- *(char *)(npc_bytes + 14)
+ (char)((uw_mobile_object_t *)npc_bytes)->status_word_high
|
- npc_bytes[14]
+ (char)((uw_mobile_object_t *)npc_bytes)->status_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_15_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low
|
- *(byte *)(npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low
|
- *(undefined1 *)(npc_bytes + 15)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_15_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 15)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->target_word_low
|
- &*(char *)(npc_bytes + 15)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->target_word_low
|
- &npc_bytes[15]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->target_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_15_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 15) = E;
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low = (byte)E;
|
- *(char *)(npc_bytes + 15) = E;
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low = (byte)E;
|
- npc_bytes[15] = E;
+ ((uw_mobile_object_t *)npc_bytes)->target_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_15_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 15)
+ (char)((uw_mobile_object_t *)npc_bytes)->target_word_low
|
- *(char *)(npc_bytes + 15)
+ (char)((uw_mobile_object_t *)npc_bytes)->target_word_low
|
- npc_bytes[15]
+ (char)((uw_mobile_object_t *)npc_bytes)->target_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_16_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 16)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high
|
- *(byte *)(npc_bytes + 16)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 16)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high
|
- *(undefined1 *)(npc_bytes + 16)
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_16_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 16)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->target_word_high
|
- &*(char *)(npc_bytes + 16)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->target_word_high
|
- &npc_bytes[16]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->target_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_16_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 16) = E;
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high = (byte)E;
|
- *(char *)(npc_bytes + 16) = E;
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high = (byte)E;
|
- npc_bytes[16] = E;
+ ((uw_mobile_object_t *)npc_bytes)->target_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_16_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 16)
+ (char)((uw_mobile_object_t *)npc_bytes)->target_word_high
|
- *(char *)(npc_bytes + 16)
+ (char)((uw_mobile_object_t *)npc_bytes)->target_word_high
|
- npc_bytes[16]
+ (char)((uw_mobile_object_t *)npc_bytes)->target_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_17_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 17)
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage
|
- *(byte *)(npc_bytes + 17)
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 17)
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage
|
- *(undefined1 *)(npc_bytes + 17)
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_17_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 17)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->recent_damage
|
- &*(char *)(npc_bytes + 17)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->recent_damage
|
- &npc_bytes[17]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->recent_damage
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_17_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 17) = E;
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage = (byte)E;
|
- *(char *)(npc_bytes + 17) = E;
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage = (byte)E;
|
- npc_bytes[17] = E;
+ ((uw_mobile_object_t *)npc_bytes)->recent_damage = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_17_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 17)
+ (char)((uw_mobile_object_t *)npc_bytes)->recent_damage
|
- *(char *)(npc_bytes + 17)
+ (char)((uw_mobile_object_t *)npc_bytes)->recent_damage
|
- npc_bytes[17]
+ (char)((uw_mobile_object_t *)npc_bytes)->recent_damage
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_18_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 18)
+ ((uw_mobile_object_t *)npc_bytes)->damage_source
|
- *(byte *)(npc_bytes + 18)
+ ((uw_mobile_object_t *)npc_bytes)->damage_source
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 18)
+ ((uw_mobile_object_t *)npc_bytes)->damage_source
|
- *(undefined1 *)(npc_bytes + 18)
+ ((uw_mobile_object_t *)npc_bytes)->damage_source
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_18_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 18)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->damage_source
|
- &*(char *)(npc_bytes + 18)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->damage_source
|
- &npc_bytes[18]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->damage_source
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_18_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 18) = E;
+ ((uw_mobile_object_t *)npc_bytes)->damage_source = (byte)E;
|
- *(char *)(npc_bytes + 18) = E;
+ ((uw_mobile_object_t *)npc_bytes)->damage_source = (byte)E;
|
- npc_bytes[18] = E;
+ ((uw_mobile_object_t *)npc_bytes)->damage_source = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_18_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 18)
+ (char)((uw_mobile_object_t *)npc_bytes)->damage_source
|
- *(char *)(npc_bytes + 18)
+ (char)((uw_mobile_object_t *)npc_bytes)->damage_source
|
- npc_bytes[18]
+ (char)((uw_mobile_object_t *)npc_bytes)->damage_source
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_19_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 19)
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags
|
- *(byte *)(npc_bytes + 19)
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 19)
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags
|
- *(undefined1 *)(npc_bytes + 19)
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_19_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 19)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->motion_flags
|
- &*(char *)(npc_bytes + 19)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->motion_flags
|
- &npc_bytes[19]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->motion_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_19_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 19) = E;
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags = (byte)E;
|
- *(char *)(npc_bytes + 19) = E;
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags = (byte)E;
|
- npc_bytes[19] = E;
+ ((uw_mobile_object_t *)npc_bytes)->motion_flags = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_19_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 19)
+ (char)((uw_mobile_object_t *)npc_bytes)->motion_flags
|
- *(char *)(npc_bytes + 19)
+ (char)((uw_mobile_object_t *)npc_bytes)->motion_flags
|
- npc_bytes[19]
+ (char)((uw_mobile_object_t *)npc_bytes)->motion_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_20_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 20)
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch
|
- *(byte *)(npc_bytes + 20)
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 20)
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch
|
- *(undefined1 *)(npc_bytes + 20)
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_20_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 20)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->attack_pitch
|
- &*(char *)(npc_bytes + 20)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->attack_pitch
|
- &npc_bytes[20]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->attack_pitch
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_20_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 20) = E;
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch = (byte)E;
|
- *(char *)(npc_bytes + 20) = E;
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch = (byte)E;
|
- npc_bytes[20] = E;
+ ((uw_mobile_object_t *)npc_bytes)->attack_pitch = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_20_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 20)
+ (char)((uw_mobile_object_t *)npc_bytes)->attack_pitch
|
- *(char *)(npc_bytes + 20)
+ (char)((uw_mobile_object_t *)npc_bytes)->attack_pitch
|
- npc_bytes[20]
+ (char)((uw_mobile_object_t *)npc_bytes)->attack_pitch
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_21_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 21)
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags
|
- *(byte *)(npc_bytes + 21)
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 21)
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags
|
- *(undefined1 *)(npc_bytes + 21)
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_21_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 21)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->animation_flags
|
- &*(char *)(npc_bytes + 21)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->animation_flags
|
- &npc_bytes[21]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->animation_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_21_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 21) = E;
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags = (byte)E;
|
- *(char *)(npc_bytes + 21) = E;
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags = (byte)E;
|
- npc_bytes[21] = E;
+ ((uw_mobile_object_t *)npc_bytes)->animation_flags = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_21_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 21)
+ (char)((uw_mobile_object_t *)npc_bytes)->animation_flags
|
- *(char *)(npc_bytes + 21)
+ (char)((uw_mobile_object_t *)npc_bytes)->animation_flags
|
- npc_bytes[21]
+ (char)((uw_mobile_object_t *)npc_bytes)->animation_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_22_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low
|
- *(byte *)(npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low
|
- *(undefined1 *)(npc_bytes + 22)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_22_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 22)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->tile_word_low
|
- &*(char *)(npc_bytes + 22)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->tile_word_low
|
- &npc_bytes[22]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->tile_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_22_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 22) = E;
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low = (byte)E;
|
- *(char *)(npc_bytes + 22) = E;
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low = (byte)E;
|
- npc_bytes[22] = E;
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_low = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_22_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 22)
+ (char)((uw_mobile_object_t *)npc_bytes)->tile_word_low
|
- *(char *)(npc_bytes + 22)
+ (char)((uw_mobile_object_t *)npc_bytes)->tile_word_low
|
- npc_bytes[22]
+ (char)((uw_mobile_object_t *)npc_bytes)->tile_word_low
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_23_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 23)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high
|
- *(byte *)(npc_bytes + 23)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 23)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high
|
- *(undefined1 *)(npc_bytes + 23)
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_23_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 23)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->tile_word_high
|
- &*(char *)(npc_bytes + 23)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->tile_word_high
|
- &npc_bytes[23]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->tile_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_23_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 23) = E;
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high = (byte)E;
|
- *(char *)(npc_bytes + 23) = E;
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high = (byte)E;
|
- npc_bytes[23] = E;
+ ((uw_mobile_object_t *)npc_bytes)->tile_word_high = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_23_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 23)
+ (char)((uw_mobile_object_t *)npc_bytes)->tile_word_high
|
- *(char *)(npc_bytes + 23)
+ (char)((uw_mobile_object_t *)npc_bytes)->tile_word_high
|
- npc_bytes[23]
+ (char)((uw_mobile_object_t *)npc_bytes)->tile_word_high
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_24_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 24)
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags
|
- *(byte *)(npc_bytes + 24)
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 24)
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags
|
- *(undefined1 *)(npc_bytes + 24)
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_24_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 24)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->heading_flags
|
- &*(char *)(npc_bytes + 24)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->heading_flags
|
- &npc_bytes[24]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->heading_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_24_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 24) = E;
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags = (byte)E;
|
- *(char *)(npc_bytes + 24) = E;
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags = (byte)E;
|
- npc_bytes[24] = E;
+ ((uw_mobile_object_t *)npc_bytes)->heading_flags = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_24_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 24)
+ (char)((uw_mobile_object_t *)npc_bytes)->heading_flags
|
- *(char *)(npc_bytes + 24)
+ (char)((uw_mobile_object_t *)npc_bytes)->heading_flags
|
- npc_bytes[24]
+ (char)((uw_mobile_object_t *)npc_bytes)->heading_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_25_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 25)
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
|
- *(byte *)(npc_bytes + 25)
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 25)
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
|
- *(undefined1 *)(npc_bytes + 25)
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_25_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 25)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
|
- &*(char *)(npc_bytes + 25)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
|
- &npc_bytes[25]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_25_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 25) = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags = (byte)E;
|
- *(char *)(npc_bytes + 25) = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags = (byte)E;
|
- npc_bytes[25] = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_ai_flags = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_25_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 25)
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
|
- *(char *)(npc_bytes + 25)
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
|
- npc_bytes[25]
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_ai_flags
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_26_byte@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)npc_bytes + 26)
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami
|
- *(byte *)(npc_bytes + 26)
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)npc_bytes + 26)
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami
|
- *(undefined1 *)(npc_bytes + 26)
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_26_char_address@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)npc_bytes + 26)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_whoami
|
- &*(char *)(npc_bytes + 26)
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_whoami
|
- &npc_bytes[26]
+ (char *)&((uw_mobile_object_t *)npc_bytes)->npc_whoami
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_26_char_store@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 26) = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami = (byte)E;
|
- *(char *)(npc_bytes + 26) = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami = (byte)E;
|
- npc_bytes[26] = E;
+ ((uw_mobile_object_t *)npc_bytes)->npc_whoami = (byte)E;
)
...>
}

@npc_walk_toward_tile_npc_bytes_byte_26_char@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)npc_bytes + 26)
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_whoami
|
- *(char *)(npc_bytes + 26)
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_whoami
|
- npc_bytes[26]
+ (char)((uw_mobile_object_t *)npc_bytes)->npc_whoami
)
...>
}

@npc_set_goal_for_object_saved_npc_word_0_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_word_0_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 0)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_word_0_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 0)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_2_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 2)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_2_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 2)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_2_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 2)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_4_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 4)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_4_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 4)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_4_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 4)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_6_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 6)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_6_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 6)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_6_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 6)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_11_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 11)
+ ((uw_mobile_object_t *)saved_npc)->goal_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_11_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 11)
+ ((uw_mobile_object_t *)saved_npc)->goal_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_11_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 11)
+ ((uw_mobile_object_t *)saved_npc)->goal_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_13_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 13)
+ ((uw_mobile_object_t *)saved_npc)->status_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_13_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 13)
+ ((uw_mobile_object_t *)saved_npc)->status_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_13_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 13)
+ ((uw_mobile_object_t *)saved_npc)->status_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_15_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 15)
+ ((uw_mobile_object_t *)saved_npc)->target_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_15_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 15)
+ ((uw_mobile_object_t *)saved_npc)->target_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_15_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 15)
+ ((uw_mobile_object_t *)saved_npc)->target_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_word_22_ushort@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 22)
+ ((uw_mobile_object_t *)saved_npc)->tile_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_22_undefined2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)saved_npc + 22)
+ ((uw_mobile_object_t *)saved_npc)->tile_word
)
...>
}

@npc_set_goal_for_object_saved_npc_word_22_short@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)saved_npc + 22)
+ ((uw_mobile_object_t *)saved_npc)->tile_word_signed
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_0_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 0)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 0)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_0_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 0)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.type_flags_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_0_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_0_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 0)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.type_flags_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_1_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 1)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 1)
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_1_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 1)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.type_flags_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_1_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 1) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_1_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 1)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.type_flags_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_2_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 2)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 2)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_2_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 2)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.position_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_2_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 2) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_2_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 2)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.position_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_3_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 3)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 3)
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_3_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 3)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.position_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_3_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 3) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_3_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 3)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.position_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_4_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 4)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 4)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_4_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 4)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.chain_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_4_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 4) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_4_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 4)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.chain_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_5_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 5)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 5)
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_5_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 5)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.chain_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_5_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 5) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_5_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 5)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.chain_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_6_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 6)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 6)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_6_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 6)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.link_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_6_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 6) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_6_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 6)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.link_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_7_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 7)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 7)
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_7_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 7)
+ (char *)&((uw_mobile_object_t *)saved_npc)->hdr.link_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_7_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 7) = E;
+ ((uw_mobile_object_t *)saved_npc)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_7_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 7)
+ (char)((uw_mobile_object_t *)saved_npc)->hdr.link_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_8_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 8)
+ ((uw_mobile_object_t *)saved_npc)->npc_hp
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 8)
+ ((uw_mobile_object_t *)saved_npc)->npc_hp
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_8_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 8)
+ (char *)&((uw_mobile_object_t *)saved_npc)->npc_hp
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_8_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 8) = E;
+ ((uw_mobile_object_t *)saved_npc)->npc_hp = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_8_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 8)
+ (char)((uw_mobile_object_t *)saved_npc)->npc_hp
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_9_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 9)
+ ((uw_mobile_object_t *)saved_npc)->full_heading
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 9)
+ ((uw_mobile_object_t *)saved_npc)->full_heading
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_9_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 9)
+ (char *)&((uw_mobile_object_t *)saved_npc)->full_heading
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_9_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 9) = E;
+ ((uw_mobile_object_t *)saved_npc)->full_heading = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_9_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 9)
+ (char)((uw_mobile_object_t *)saved_npc)->full_heading
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_10_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 10)
+ ((uw_mobile_object_t *)saved_npc)->movement_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 10)
+ ((uw_mobile_object_t *)saved_npc)->movement_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_10_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 10)
+ (char *)&((uw_mobile_object_t *)saved_npc)->movement_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_10_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 10) = E;
+ ((uw_mobile_object_t *)saved_npc)->movement_flags = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_10_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 10)
+ (char)((uw_mobile_object_t *)saved_npc)->movement_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_11_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 11)
+ ((uw_mobile_object_t *)saved_npc)->goal_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 11)
+ ((uw_mobile_object_t *)saved_npc)->goal_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_11_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 11)
+ (char *)&((uw_mobile_object_t *)saved_npc)->goal_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_11_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 11) = E;
+ ((uw_mobile_object_t *)saved_npc)->goal_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_11_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 11)
+ (char)((uw_mobile_object_t *)saved_npc)->goal_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_12_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 12)
+ ((uw_mobile_object_t *)saved_npc)->goal_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 12)
+ ((uw_mobile_object_t *)saved_npc)->goal_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_12_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 12)
+ (char *)&((uw_mobile_object_t *)saved_npc)->goal_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_12_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 12) = E;
+ ((uw_mobile_object_t *)saved_npc)->goal_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_12_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 12)
+ (char)((uw_mobile_object_t *)saved_npc)->goal_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_13_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 13)
+ ((uw_mobile_object_t *)saved_npc)->status_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 13)
+ ((uw_mobile_object_t *)saved_npc)->status_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_13_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 13)
+ (char *)&((uw_mobile_object_t *)saved_npc)->status_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_13_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 13) = E;
+ ((uw_mobile_object_t *)saved_npc)->status_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_13_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 13)
+ (char)((uw_mobile_object_t *)saved_npc)->status_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_14_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 14)
+ ((uw_mobile_object_t *)saved_npc)->status_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 14)
+ ((uw_mobile_object_t *)saved_npc)->status_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_14_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 14)
+ (char *)&((uw_mobile_object_t *)saved_npc)->status_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_14_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 14) = E;
+ ((uw_mobile_object_t *)saved_npc)->status_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_14_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 14)
+ (char)((uw_mobile_object_t *)saved_npc)->status_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_15_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 15)
+ ((uw_mobile_object_t *)saved_npc)->target_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 15)
+ ((uw_mobile_object_t *)saved_npc)->target_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_15_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 15)
+ (char *)&((uw_mobile_object_t *)saved_npc)->target_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_15_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 15) = E;
+ ((uw_mobile_object_t *)saved_npc)->target_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_15_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 15)
+ (char)((uw_mobile_object_t *)saved_npc)->target_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_16_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 16)
+ ((uw_mobile_object_t *)saved_npc)->target_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 16)
+ ((uw_mobile_object_t *)saved_npc)->target_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_16_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 16)
+ (char *)&((uw_mobile_object_t *)saved_npc)->target_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_16_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 16) = E;
+ ((uw_mobile_object_t *)saved_npc)->target_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_16_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 16)
+ (char)((uw_mobile_object_t *)saved_npc)->target_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_17_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 17)
+ ((uw_mobile_object_t *)saved_npc)->recent_damage
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 17)
+ ((uw_mobile_object_t *)saved_npc)->recent_damage
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_17_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 17)
+ (char *)&((uw_mobile_object_t *)saved_npc)->recent_damage
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_17_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 17) = E;
+ ((uw_mobile_object_t *)saved_npc)->recent_damage = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_17_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 17)
+ (char)((uw_mobile_object_t *)saved_npc)->recent_damage
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_18_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 18)
+ ((uw_mobile_object_t *)saved_npc)->damage_source
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 18)
+ ((uw_mobile_object_t *)saved_npc)->damage_source
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_18_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 18)
+ (char *)&((uw_mobile_object_t *)saved_npc)->damage_source
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_18_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 18) = E;
+ ((uw_mobile_object_t *)saved_npc)->damage_source = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_18_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 18)
+ (char)((uw_mobile_object_t *)saved_npc)->damage_source
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_19_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 19)
+ ((uw_mobile_object_t *)saved_npc)->motion_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 19)
+ ((uw_mobile_object_t *)saved_npc)->motion_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_19_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 19)
+ (char *)&((uw_mobile_object_t *)saved_npc)->motion_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_19_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 19) = E;
+ ((uw_mobile_object_t *)saved_npc)->motion_flags = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_19_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 19)
+ (char)((uw_mobile_object_t *)saved_npc)->motion_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_20_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 20)
+ ((uw_mobile_object_t *)saved_npc)->attack_pitch
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 20)
+ ((uw_mobile_object_t *)saved_npc)->attack_pitch
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_20_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 20)
+ (char *)&((uw_mobile_object_t *)saved_npc)->attack_pitch
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_20_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 20) = E;
+ ((uw_mobile_object_t *)saved_npc)->attack_pitch = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_20_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 20)
+ (char)((uw_mobile_object_t *)saved_npc)->attack_pitch
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_21_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 21)
+ ((uw_mobile_object_t *)saved_npc)->animation_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 21)
+ ((uw_mobile_object_t *)saved_npc)->animation_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_21_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 21)
+ (char *)&((uw_mobile_object_t *)saved_npc)->animation_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_21_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 21) = E;
+ ((uw_mobile_object_t *)saved_npc)->animation_flags = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_21_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 21)
+ (char)((uw_mobile_object_t *)saved_npc)->animation_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_22_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 22)
+ ((uw_mobile_object_t *)saved_npc)->tile_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 22)
+ ((uw_mobile_object_t *)saved_npc)->tile_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_22_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 22)
+ (char *)&((uw_mobile_object_t *)saved_npc)->tile_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_22_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 22) = E;
+ ((uw_mobile_object_t *)saved_npc)->tile_word_low = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_22_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 22)
+ (char)((uw_mobile_object_t *)saved_npc)->tile_word_low
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_23_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 23)
+ ((uw_mobile_object_t *)saved_npc)->tile_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 23)
+ ((uw_mobile_object_t *)saved_npc)->tile_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_23_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 23)
+ (char *)&((uw_mobile_object_t *)saved_npc)->tile_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_23_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 23) = E;
+ ((uw_mobile_object_t *)saved_npc)->tile_word_high = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_23_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 23)
+ (char)((uw_mobile_object_t *)saved_npc)->tile_word_high
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_24_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 24)
+ ((uw_mobile_object_t *)saved_npc)->heading_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 24)
+ ((uw_mobile_object_t *)saved_npc)->heading_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_24_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 24)
+ (char *)&((uw_mobile_object_t *)saved_npc)->heading_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_24_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 24) = E;
+ ((uw_mobile_object_t *)saved_npc)->heading_flags = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_24_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 24)
+ (char)((uw_mobile_object_t *)saved_npc)->heading_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_25_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 25)
+ ((uw_mobile_object_t *)saved_npc)->npc_ai_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 25)
+ ((uw_mobile_object_t *)saved_npc)->npc_ai_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_25_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 25)
+ (char *)&((uw_mobile_object_t *)saved_npc)->npc_ai_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_25_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 25) = E;
+ ((uw_mobile_object_t *)saved_npc)->npc_ai_flags = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_25_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 25)
+ (char)((uw_mobile_object_t *)saved_npc)->npc_ai_flags
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_26_byte@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)saved_npc + 26)
+ ((uw_mobile_object_t *)saved_npc)->npc_whoami
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)saved_npc + 26)
+ ((uw_mobile_object_t *)saved_npc)->npc_whoami
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_26_char_address@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)saved_npc + 26)
+ (char *)&((uw_mobile_object_t *)saved_npc)->npc_whoami
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_26_char_store@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 26) = E;
+ ((uw_mobile_object_t *)saved_npc)->npc_whoami = (byte)E;
)
...>
}

@npc_set_goal_for_object_saved_npc_byte_26_char@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)saved_npc + 26)
+ (char)((uw_mobile_object_t *)saved_npc)->npc_whoami
)
...>
}

@npc_idle_behavior_tick_iVar9_word_0_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags
|
- *(ushort *)(iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags
|
- *(ushort *)iVar9
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_word_0_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags
|
- *(undefined2 *)(iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags
|
- *(undefined2 *)iVar9
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_word_0_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_signed
|
- *(short *)(iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_signed
|
- *(short *)iVar9
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_2_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word
|
- *(ushort *)(iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_2_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word
|
- *(undefined2 *)(iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_2_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_signed
|
- *(short *)(iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_4_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word
|
- *(ushort *)(iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_4_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word
|
- *(undefined2 *)(iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_4_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_signed
|
- *(short *)(iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_6_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word
|
- *(ushort *)(iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_6_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word
|
- *(undefined2 *)(iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_6_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_signed
|
- *(short *)(iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_11_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word
|
- *(ushort *)(iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_11_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word
|
- *(undefined2 *)(iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_11_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word_signed
|
- *(short *)(iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_13_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word
|
- *(ushort *)(iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_13_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word
|
- *(undefined2 *)(iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_13_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word_signed
|
- *(short *)(iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_15_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word
|
- *(ushort *)(iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_15_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word
|
- *(undefined2 *)(iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_15_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word_signed
|
- *(short *)(iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_word_22_ushort@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word
|
- *(ushort *)(iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_22_undefined2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word
|
- *(undefined2 *)(iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word
)
...>
}

@npc_idle_behavior_tick_iVar9_word_22_short@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word_signed
|
- *(short *)(iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word_signed
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_0_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- *(byte *)(iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- *(byte *)iVar9
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- *(undefined1 *)(iVar9 + 0)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- *(undefined1 *)iVar9
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_0_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 0)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- &*(char *)(iVar9 + 0)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- &*(char *)iVar9
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- &iVar9[0]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_0_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar9 + 0) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar9 = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low = (byte)E;
|
- iVar9[0] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_0_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 0)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- *(char *)(iVar9 + 0)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- *(char *)iVar9
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
|
- iVar9[0]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_1_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 1)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
|
- *(byte *)(iVar9 + 1)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 1)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
|
- *(undefined1 *)(iVar9 + 1)
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_1_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 1)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
|
- &*(char *)(iVar9 + 1)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
|
- &iVar9[1]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_1_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 1) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar9 + 1) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high = (byte)E;
|
- iVar9[1] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_1_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 1)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
|
- *(char *)(iVar9 + 1)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
|
- iVar9[1]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.type_flags_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_2_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low
|
- *(byte *)(iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low
|
- *(undefined1 *)(iVar9 + 2)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_2_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 2)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.position_word_low
|
- &*(char *)(iVar9 + 2)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.position_word_low
|
- &iVar9[2]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.position_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_2_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 2) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar9 + 2) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low = (byte)E;
|
- iVar9[2] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_2_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 2)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.position_word_low
|
- *(char *)(iVar9 + 2)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.position_word_low
|
- iVar9[2]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.position_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_3_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 3)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high
|
- *(byte *)(iVar9 + 3)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 3)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high
|
- *(undefined1 *)(iVar9 + 3)
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_3_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 3)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.position_word_high
|
- &*(char *)(iVar9 + 3)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.position_word_high
|
- &iVar9[3]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.position_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_3_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 3) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar9 + 3) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high = (byte)E;
|
- iVar9[3] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_3_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 3)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.position_word_high
|
- *(char *)(iVar9 + 3)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.position_word_high
|
- iVar9[3]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.position_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_4_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
|
- *(byte *)(iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
|
- *(undefined1 *)(iVar9 + 4)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_4_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 4)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
|
- &*(char *)(iVar9 + 4)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
|
- &iVar9[4]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_4_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 4) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar9 + 4) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low = (byte)E;
|
- iVar9[4] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_4_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 4)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
|
- *(char *)(iVar9 + 4)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
|
- iVar9[4]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.chain_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_5_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 5)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
|
- *(byte *)(iVar9 + 5)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 5)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
|
- *(undefined1 *)(iVar9 + 5)
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_5_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 5)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
|
- &*(char *)(iVar9 + 5)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
|
- &iVar9[5]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_5_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 5) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar9 + 5) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high = (byte)E;
|
- iVar9[5] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_5_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 5)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
|
- *(char *)(iVar9 + 5)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
|
- iVar9[5]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.chain_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_6_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low
|
- *(byte *)(iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low
|
- *(undefined1 *)(iVar9 + 6)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_6_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 6)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.link_word_low
|
- &*(char *)(iVar9 + 6)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.link_word_low
|
- &iVar9[6]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.link_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_6_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 6) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar9 + 6) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low = (byte)E;
|
- iVar9[6] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_6_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 6)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.link_word_low
|
- *(char *)(iVar9 + 6)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.link_word_low
|
- iVar9[6]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.link_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_7_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 7)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high
|
- *(byte *)(iVar9 + 7)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 7)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high
|
- *(undefined1 *)(iVar9 + 7)
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_7_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 7)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.link_word_high
|
- &*(char *)(iVar9 + 7)
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.link_word_high
|
- &iVar9[7]
+ (char *)&((uw_mobile_object_t *)iVar9)->hdr.link_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_7_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 7) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar9 + 7) = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high = (byte)E;
|
- iVar9[7] = E;
+ ((uw_mobile_object_t *)iVar9)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_7_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 7)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.link_word_high
|
- *(char *)(iVar9 + 7)
+ (char)((uw_mobile_object_t *)iVar9)->hdr.link_word_high
|
- iVar9[7]
+ (char)((uw_mobile_object_t *)iVar9)->hdr.link_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_8_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 8)
+ ((uw_mobile_object_t *)iVar9)->npc_hp
|
- *(byte *)(iVar9 + 8)
+ ((uw_mobile_object_t *)iVar9)->npc_hp
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 8)
+ ((uw_mobile_object_t *)iVar9)->npc_hp
|
- *(undefined1 *)(iVar9 + 8)
+ ((uw_mobile_object_t *)iVar9)->npc_hp
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_8_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 8)
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_hp
|
- &*(char *)(iVar9 + 8)
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_hp
|
- &iVar9[8]
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_hp
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_8_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 8) = E;
+ ((uw_mobile_object_t *)iVar9)->npc_hp = (byte)E;
|
- *(char *)(iVar9 + 8) = E;
+ ((uw_mobile_object_t *)iVar9)->npc_hp = (byte)E;
|
- iVar9[8] = E;
+ ((uw_mobile_object_t *)iVar9)->npc_hp = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_8_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 8)
+ (char)((uw_mobile_object_t *)iVar9)->npc_hp
|
- *(char *)(iVar9 + 8)
+ (char)((uw_mobile_object_t *)iVar9)->npc_hp
|
- iVar9[8]
+ (char)((uw_mobile_object_t *)iVar9)->npc_hp
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_9_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 9)
+ ((uw_mobile_object_t *)iVar9)->full_heading
|
- *(byte *)(iVar9 + 9)
+ ((uw_mobile_object_t *)iVar9)->full_heading
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 9)
+ ((uw_mobile_object_t *)iVar9)->full_heading
|
- *(undefined1 *)(iVar9 + 9)
+ ((uw_mobile_object_t *)iVar9)->full_heading
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_9_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 9)
+ (char *)&((uw_mobile_object_t *)iVar9)->full_heading
|
- &*(char *)(iVar9 + 9)
+ (char *)&((uw_mobile_object_t *)iVar9)->full_heading
|
- &iVar9[9]
+ (char *)&((uw_mobile_object_t *)iVar9)->full_heading
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_9_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 9) = E;
+ ((uw_mobile_object_t *)iVar9)->full_heading = (byte)E;
|
- *(char *)(iVar9 + 9) = E;
+ ((uw_mobile_object_t *)iVar9)->full_heading = (byte)E;
|
- iVar9[9] = E;
+ ((uw_mobile_object_t *)iVar9)->full_heading = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_9_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 9)
+ (char)((uw_mobile_object_t *)iVar9)->full_heading
|
- *(char *)(iVar9 + 9)
+ (char)((uw_mobile_object_t *)iVar9)->full_heading
|
- iVar9[9]
+ (char)((uw_mobile_object_t *)iVar9)->full_heading
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_10_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 10)
+ ((uw_mobile_object_t *)iVar9)->movement_flags
|
- *(byte *)(iVar9 + 10)
+ ((uw_mobile_object_t *)iVar9)->movement_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 10)
+ ((uw_mobile_object_t *)iVar9)->movement_flags
|
- *(undefined1 *)(iVar9 + 10)
+ ((uw_mobile_object_t *)iVar9)->movement_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_10_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 10)
+ (char *)&((uw_mobile_object_t *)iVar9)->movement_flags
|
- &*(char *)(iVar9 + 10)
+ (char *)&((uw_mobile_object_t *)iVar9)->movement_flags
|
- &iVar9[10]
+ (char *)&((uw_mobile_object_t *)iVar9)->movement_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_10_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 10) = E;
+ ((uw_mobile_object_t *)iVar9)->movement_flags = (byte)E;
|
- *(char *)(iVar9 + 10) = E;
+ ((uw_mobile_object_t *)iVar9)->movement_flags = (byte)E;
|
- iVar9[10] = E;
+ ((uw_mobile_object_t *)iVar9)->movement_flags = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_10_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 10)
+ (char)((uw_mobile_object_t *)iVar9)->movement_flags
|
- *(char *)(iVar9 + 10)
+ (char)((uw_mobile_object_t *)iVar9)->movement_flags
|
- iVar9[10]
+ (char)((uw_mobile_object_t *)iVar9)->movement_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_11_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word_low
|
- *(byte *)(iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word_low
|
- *(undefined1 *)(iVar9 + 11)
+ ((uw_mobile_object_t *)iVar9)->goal_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_11_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 11)
+ (char *)&((uw_mobile_object_t *)iVar9)->goal_word_low
|
- &*(char *)(iVar9 + 11)
+ (char *)&((uw_mobile_object_t *)iVar9)->goal_word_low
|
- &iVar9[11]
+ (char *)&((uw_mobile_object_t *)iVar9)->goal_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_11_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 11) = E;
+ ((uw_mobile_object_t *)iVar9)->goal_word_low = (byte)E;
|
- *(char *)(iVar9 + 11) = E;
+ ((uw_mobile_object_t *)iVar9)->goal_word_low = (byte)E;
|
- iVar9[11] = E;
+ ((uw_mobile_object_t *)iVar9)->goal_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_11_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 11)
+ (char)((uw_mobile_object_t *)iVar9)->goal_word_low
|
- *(char *)(iVar9 + 11)
+ (char)((uw_mobile_object_t *)iVar9)->goal_word_low
|
- iVar9[11]
+ (char)((uw_mobile_object_t *)iVar9)->goal_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_12_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 12)
+ ((uw_mobile_object_t *)iVar9)->goal_word_high
|
- *(byte *)(iVar9 + 12)
+ ((uw_mobile_object_t *)iVar9)->goal_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 12)
+ ((uw_mobile_object_t *)iVar9)->goal_word_high
|
- *(undefined1 *)(iVar9 + 12)
+ ((uw_mobile_object_t *)iVar9)->goal_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_12_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 12)
+ (char *)&((uw_mobile_object_t *)iVar9)->goal_word_high
|
- &*(char *)(iVar9 + 12)
+ (char *)&((uw_mobile_object_t *)iVar9)->goal_word_high
|
- &iVar9[12]
+ (char *)&((uw_mobile_object_t *)iVar9)->goal_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_12_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 12) = E;
+ ((uw_mobile_object_t *)iVar9)->goal_word_high = (byte)E;
|
- *(char *)(iVar9 + 12) = E;
+ ((uw_mobile_object_t *)iVar9)->goal_word_high = (byte)E;
|
- iVar9[12] = E;
+ ((uw_mobile_object_t *)iVar9)->goal_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_12_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 12)
+ (char)((uw_mobile_object_t *)iVar9)->goal_word_high
|
- *(char *)(iVar9 + 12)
+ (char)((uw_mobile_object_t *)iVar9)->goal_word_high
|
- iVar9[12]
+ (char)((uw_mobile_object_t *)iVar9)->goal_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_13_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word_low
|
- *(byte *)(iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word_low
|
- *(undefined1 *)(iVar9 + 13)
+ ((uw_mobile_object_t *)iVar9)->status_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_13_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 13)
+ (char *)&((uw_mobile_object_t *)iVar9)->status_word_low
|
- &*(char *)(iVar9 + 13)
+ (char *)&((uw_mobile_object_t *)iVar9)->status_word_low
|
- &iVar9[13]
+ (char *)&((uw_mobile_object_t *)iVar9)->status_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_13_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 13) = E;
+ ((uw_mobile_object_t *)iVar9)->status_word_low = (byte)E;
|
- *(char *)(iVar9 + 13) = E;
+ ((uw_mobile_object_t *)iVar9)->status_word_low = (byte)E;
|
- iVar9[13] = E;
+ ((uw_mobile_object_t *)iVar9)->status_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_13_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 13)
+ (char)((uw_mobile_object_t *)iVar9)->status_word_low
|
- *(char *)(iVar9 + 13)
+ (char)((uw_mobile_object_t *)iVar9)->status_word_low
|
- iVar9[13]
+ (char)((uw_mobile_object_t *)iVar9)->status_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_14_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 14)
+ ((uw_mobile_object_t *)iVar9)->status_word_high
|
- *(byte *)(iVar9 + 14)
+ ((uw_mobile_object_t *)iVar9)->status_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 14)
+ ((uw_mobile_object_t *)iVar9)->status_word_high
|
- *(undefined1 *)(iVar9 + 14)
+ ((uw_mobile_object_t *)iVar9)->status_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_14_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 14)
+ (char *)&((uw_mobile_object_t *)iVar9)->status_word_high
|
- &*(char *)(iVar9 + 14)
+ (char *)&((uw_mobile_object_t *)iVar9)->status_word_high
|
- &iVar9[14]
+ (char *)&((uw_mobile_object_t *)iVar9)->status_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_14_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 14) = E;
+ ((uw_mobile_object_t *)iVar9)->status_word_high = (byte)E;
|
- *(char *)(iVar9 + 14) = E;
+ ((uw_mobile_object_t *)iVar9)->status_word_high = (byte)E;
|
- iVar9[14] = E;
+ ((uw_mobile_object_t *)iVar9)->status_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_14_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 14)
+ (char)((uw_mobile_object_t *)iVar9)->status_word_high
|
- *(char *)(iVar9 + 14)
+ (char)((uw_mobile_object_t *)iVar9)->status_word_high
|
- iVar9[14]
+ (char)((uw_mobile_object_t *)iVar9)->status_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_15_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word_low
|
- *(byte *)(iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word_low
|
- *(undefined1 *)(iVar9 + 15)
+ ((uw_mobile_object_t *)iVar9)->target_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_15_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 15)
+ (char *)&((uw_mobile_object_t *)iVar9)->target_word_low
|
- &*(char *)(iVar9 + 15)
+ (char *)&((uw_mobile_object_t *)iVar9)->target_word_low
|
- &iVar9[15]
+ (char *)&((uw_mobile_object_t *)iVar9)->target_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_15_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 15) = E;
+ ((uw_mobile_object_t *)iVar9)->target_word_low = (byte)E;
|
- *(char *)(iVar9 + 15) = E;
+ ((uw_mobile_object_t *)iVar9)->target_word_low = (byte)E;
|
- iVar9[15] = E;
+ ((uw_mobile_object_t *)iVar9)->target_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_15_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 15)
+ (char)((uw_mobile_object_t *)iVar9)->target_word_low
|
- *(char *)(iVar9 + 15)
+ (char)((uw_mobile_object_t *)iVar9)->target_word_low
|
- iVar9[15]
+ (char)((uw_mobile_object_t *)iVar9)->target_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_16_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 16)
+ ((uw_mobile_object_t *)iVar9)->target_word_high
|
- *(byte *)(iVar9 + 16)
+ ((uw_mobile_object_t *)iVar9)->target_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 16)
+ ((uw_mobile_object_t *)iVar9)->target_word_high
|
- *(undefined1 *)(iVar9 + 16)
+ ((uw_mobile_object_t *)iVar9)->target_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_16_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 16)
+ (char *)&((uw_mobile_object_t *)iVar9)->target_word_high
|
- &*(char *)(iVar9 + 16)
+ (char *)&((uw_mobile_object_t *)iVar9)->target_word_high
|
- &iVar9[16]
+ (char *)&((uw_mobile_object_t *)iVar9)->target_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_16_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 16) = E;
+ ((uw_mobile_object_t *)iVar9)->target_word_high = (byte)E;
|
- *(char *)(iVar9 + 16) = E;
+ ((uw_mobile_object_t *)iVar9)->target_word_high = (byte)E;
|
- iVar9[16] = E;
+ ((uw_mobile_object_t *)iVar9)->target_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_16_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 16)
+ (char)((uw_mobile_object_t *)iVar9)->target_word_high
|
- *(char *)(iVar9 + 16)
+ (char)((uw_mobile_object_t *)iVar9)->target_word_high
|
- iVar9[16]
+ (char)((uw_mobile_object_t *)iVar9)->target_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_17_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 17)
+ ((uw_mobile_object_t *)iVar9)->recent_damage
|
- *(byte *)(iVar9 + 17)
+ ((uw_mobile_object_t *)iVar9)->recent_damage
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 17)
+ ((uw_mobile_object_t *)iVar9)->recent_damage
|
- *(undefined1 *)(iVar9 + 17)
+ ((uw_mobile_object_t *)iVar9)->recent_damage
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_17_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 17)
+ (char *)&((uw_mobile_object_t *)iVar9)->recent_damage
|
- &*(char *)(iVar9 + 17)
+ (char *)&((uw_mobile_object_t *)iVar9)->recent_damage
|
- &iVar9[17]
+ (char *)&((uw_mobile_object_t *)iVar9)->recent_damage
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_17_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 17) = E;
+ ((uw_mobile_object_t *)iVar9)->recent_damage = (byte)E;
|
- *(char *)(iVar9 + 17) = E;
+ ((uw_mobile_object_t *)iVar9)->recent_damage = (byte)E;
|
- iVar9[17] = E;
+ ((uw_mobile_object_t *)iVar9)->recent_damage = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_17_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 17)
+ (char)((uw_mobile_object_t *)iVar9)->recent_damage
|
- *(char *)(iVar9 + 17)
+ (char)((uw_mobile_object_t *)iVar9)->recent_damage
|
- iVar9[17]
+ (char)((uw_mobile_object_t *)iVar9)->recent_damage
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_18_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 18)
+ ((uw_mobile_object_t *)iVar9)->damage_source
|
- *(byte *)(iVar9 + 18)
+ ((uw_mobile_object_t *)iVar9)->damage_source
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 18)
+ ((uw_mobile_object_t *)iVar9)->damage_source
|
- *(undefined1 *)(iVar9 + 18)
+ ((uw_mobile_object_t *)iVar9)->damage_source
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_18_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 18)
+ (char *)&((uw_mobile_object_t *)iVar9)->damage_source
|
- &*(char *)(iVar9 + 18)
+ (char *)&((uw_mobile_object_t *)iVar9)->damage_source
|
- &iVar9[18]
+ (char *)&((uw_mobile_object_t *)iVar9)->damage_source
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_18_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 18) = E;
+ ((uw_mobile_object_t *)iVar9)->damage_source = (byte)E;
|
- *(char *)(iVar9 + 18) = E;
+ ((uw_mobile_object_t *)iVar9)->damage_source = (byte)E;
|
- iVar9[18] = E;
+ ((uw_mobile_object_t *)iVar9)->damage_source = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_18_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 18)
+ (char)((uw_mobile_object_t *)iVar9)->damage_source
|
- *(char *)(iVar9 + 18)
+ (char)((uw_mobile_object_t *)iVar9)->damage_source
|
- iVar9[18]
+ (char)((uw_mobile_object_t *)iVar9)->damage_source
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_19_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 19)
+ ((uw_mobile_object_t *)iVar9)->motion_flags
|
- *(byte *)(iVar9 + 19)
+ ((uw_mobile_object_t *)iVar9)->motion_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 19)
+ ((uw_mobile_object_t *)iVar9)->motion_flags
|
- *(undefined1 *)(iVar9 + 19)
+ ((uw_mobile_object_t *)iVar9)->motion_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_19_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 19)
+ (char *)&((uw_mobile_object_t *)iVar9)->motion_flags
|
- &*(char *)(iVar9 + 19)
+ (char *)&((uw_mobile_object_t *)iVar9)->motion_flags
|
- &iVar9[19]
+ (char *)&((uw_mobile_object_t *)iVar9)->motion_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_19_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 19) = E;
+ ((uw_mobile_object_t *)iVar9)->motion_flags = (byte)E;
|
- *(char *)(iVar9 + 19) = E;
+ ((uw_mobile_object_t *)iVar9)->motion_flags = (byte)E;
|
- iVar9[19] = E;
+ ((uw_mobile_object_t *)iVar9)->motion_flags = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_19_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 19)
+ (char)((uw_mobile_object_t *)iVar9)->motion_flags
|
- *(char *)(iVar9 + 19)
+ (char)((uw_mobile_object_t *)iVar9)->motion_flags
|
- iVar9[19]
+ (char)((uw_mobile_object_t *)iVar9)->motion_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_20_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 20)
+ ((uw_mobile_object_t *)iVar9)->attack_pitch
|
- *(byte *)(iVar9 + 20)
+ ((uw_mobile_object_t *)iVar9)->attack_pitch
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 20)
+ ((uw_mobile_object_t *)iVar9)->attack_pitch
|
- *(undefined1 *)(iVar9 + 20)
+ ((uw_mobile_object_t *)iVar9)->attack_pitch
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_20_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 20)
+ (char *)&((uw_mobile_object_t *)iVar9)->attack_pitch
|
- &*(char *)(iVar9 + 20)
+ (char *)&((uw_mobile_object_t *)iVar9)->attack_pitch
|
- &iVar9[20]
+ (char *)&((uw_mobile_object_t *)iVar9)->attack_pitch
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_20_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 20) = E;
+ ((uw_mobile_object_t *)iVar9)->attack_pitch = (byte)E;
|
- *(char *)(iVar9 + 20) = E;
+ ((uw_mobile_object_t *)iVar9)->attack_pitch = (byte)E;
|
- iVar9[20] = E;
+ ((uw_mobile_object_t *)iVar9)->attack_pitch = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_20_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 20)
+ (char)((uw_mobile_object_t *)iVar9)->attack_pitch
|
- *(char *)(iVar9 + 20)
+ (char)((uw_mobile_object_t *)iVar9)->attack_pitch
|
- iVar9[20]
+ (char)((uw_mobile_object_t *)iVar9)->attack_pitch
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_21_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 21)
+ ((uw_mobile_object_t *)iVar9)->animation_flags
|
- *(byte *)(iVar9 + 21)
+ ((uw_mobile_object_t *)iVar9)->animation_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 21)
+ ((uw_mobile_object_t *)iVar9)->animation_flags
|
- *(undefined1 *)(iVar9 + 21)
+ ((uw_mobile_object_t *)iVar9)->animation_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_21_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 21)
+ (char *)&((uw_mobile_object_t *)iVar9)->animation_flags
|
- &*(char *)(iVar9 + 21)
+ (char *)&((uw_mobile_object_t *)iVar9)->animation_flags
|
- &iVar9[21]
+ (char *)&((uw_mobile_object_t *)iVar9)->animation_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_21_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 21) = E;
+ ((uw_mobile_object_t *)iVar9)->animation_flags = (byte)E;
|
- *(char *)(iVar9 + 21) = E;
+ ((uw_mobile_object_t *)iVar9)->animation_flags = (byte)E;
|
- iVar9[21] = E;
+ ((uw_mobile_object_t *)iVar9)->animation_flags = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_21_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 21)
+ (char)((uw_mobile_object_t *)iVar9)->animation_flags
|
- *(char *)(iVar9 + 21)
+ (char)((uw_mobile_object_t *)iVar9)->animation_flags
|
- iVar9[21]
+ (char)((uw_mobile_object_t *)iVar9)->animation_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_22_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word_low
|
- *(byte *)(iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word_low
|
- *(undefined1 *)(iVar9 + 22)
+ ((uw_mobile_object_t *)iVar9)->tile_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_22_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 22)
+ (char *)&((uw_mobile_object_t *)iVar9)->tile_word_low
|
- &*(char *)(iVar9 + 22)
+ (char *)&((uw_mobile_object_t *)iVar9)->tile_word_low
|
- &iVar9[22]
+ (char *)&((uw_mobile_object_t *)iVar9)->tile_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_22_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 22) = E;
+ ((uw_mobile_object_t *)iVar9)->tile_word_low = (byte)E;
|
- *(char *)(iVar9 + 22) = E;
+ ((uw_mobile_object_t *)iVar9)->tile_word_low = (byte)E;
|
- iVar9[22] = E;
+ ((uw_mobile_object_t *)iVar9)->tile_word_low = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_22_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 22)
+ (char)((uw_mobile_object_t *)iVar9)->tile_word_low
|
- *(char *)(iVar9 + 22)
+ (char)((uw_mobile_object_t *)iVar9)->tile_word_low
|
- iVar9[22]
+ (char)((uw_mobile_object_t *)iVar9)->tile_word_low
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_23_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 23)
+ ((uw_mobile_object_t *)iVar9)->tile_word_high
|
- *(byte *)(iVar9 + 23)
+ ((uw_mobile_object_t *)iVar9)->tile_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 23)
+ ((uw_mobile_object_t *)iVar9)->tile_word_high
|
- *(undefined1 *)(iVar9 + 23)
+ ((uw_mobile_object_t *)iVar9)->tile_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_23_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 23)
+ (char *)&((uw_mobile_object_t *)iVar9)->tile_word_high
|
- &*(char *)(iVar9 + 23)
+ (char *)&((uw_mobile_object_t *)iVar9)->tile_word_high
|
- &iVar9[23]
+ (char *)&((uw_mobile_object_t *)iVar9)->tile_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_23_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 23) = E;
+ ((uw_mobile_object_t *)iVar9)->tile_word_high = (byte)E;
|
- *(char *)(iVar9 + 23) = E;
+ ((uw_mobile_object_t *)iVar9)->tile_word_high = (byte)E;
|
- iVar9[23] = E;
+ ((uw_mobile_object_t *)iVar9)->tile_word_high = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_23_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 23)
+ (char)((uw_mobile_object_t *)iVar9)->tile_word_high
|
- *(char *)(iVar9 + 23)
+ (char)((uw_mobile_object_t *)iVar9)->tile_word_high
|
- iVar9[23]
+ (char)((uw_mobile_object_t *)iVar9)->tile_word_high
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_24_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 24)
+ ((uw_mobile_object_t *)iVar9)->heading_flags
|
- *(byte *)(iVar9 + 24)
+ ((uw_mobile_object_t *)iVar9)->heading_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 24)
+ ((uw_mobile_object_t *)iVar9)->heading_flags
|
- *(undefined1 *)(iVar9 + 24)
+ ((uw_mobile_object_t *)iVar9)->heading_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_24_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 24)
+ (char *)&((uw_mobile_object_t *)iVar9)->heading_flags
|
- &*(char *)(iVar9 + 24)
+ (char *)&((uw_mobile_object_t *)iVar9)->heading_flags
|
- &iVar9[24]
+ (char *)&((uw_mobile_object_t *)iVar9)->heading_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_24_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 24) = E;
+ ((uw_mobile_object_t *)iVar9)->heading_flags = (byte)E;
|
- *(char *)(iVar9 + 24) = E;
+ ((uw_mobile_object_t *)iVar9)->heading_flags = (byte)E;
|
- iVar9[24] = E;
+ ((uw_mobile_object_t *)iVar9)->heading_flags = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_24_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 24)
+ (char)((uw_mobile_object_t *)iVar9)->heading_flags
|
- *(char *)(iVar9 + 24)
+ (char)((uw_mobile_object_t *)iVar9)->heading_flags
|
- iVar9[24]
+ (char)((uw_mobile_object_t *)iVar9)->heading_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_25_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 25)
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags
|
- *(byte *)(iVar9 + 25)
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 25)
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags
|
- *(undefined1 *)(iVar9 + 25)
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_25_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 25)
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_ai_flags
|
- &*(char *)(iVar9 + 25)
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_ai_flags
|
- &iVar9[25]
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_ai_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_25_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 25) = E;
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar9 + 25) = E;
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags = (byte)E;
|
- iVar9[25] = E;
+ ((uw_mobile_object_t *)iVar9)->npc_ai_flags = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_25_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 25)
+ (char)((uw_mobile_object_t *)iVar9)->npc_ai_flags
|
- *(char *)(iVar9 + 25)
+ (char)((uw_mobile_object_t *)iVar9)->npc_ai_flags
|
- iVar9[25]
+ (char)((uw_mobile_object_t *)iVar9)->npc_ai_flags
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_26_byte@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar9 + 26)
+ ((uw_mobile_object_t *)iVar9)->npc_whoami
|
- *(byte *)(iVar9 + 26)
+ ((uw_mobile_object_t *)iVar9)->npc_whoami
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar9 + 26)
+ ((uw_mobile_object_t *)iVar9)->npc_whoami
|
- *(undefined1 *)(iVar9 + 26)
+ ((uw_mobile_object_t *)iVar9)->npc_whoami
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_26_char_address@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar9 + 26)
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_whoami
|
- &*(char *)(iVar9 + 26)
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_whoami
|
- &iVar9[26]
+ (char *)&((uw_mobile_object_t *)iVar9)->npc_whoami
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_26_char_store@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 26) = E;
+ ((uw_mobile_object_t *)iVar9)->npc_whoami = (byte)E;
|
- *(char *)(iVar9 + 26) = E;
+ ((uw_mobile_object_t *)iVar9)->npc_whoami = (byte)E;
|
- iVar9[26] = E;
+ ((uw_mobile_object_t *)iVar9)->npc_whoami = (byte)E;
)
...>
}

@npc_idle_behavior_tick_iVar9_byte_26_char@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar9 + 26)
+ (char)((uw_mobile_object_t *)iVar9)->npc_whoami
|
- *(char *)(iVar9 + 26)
+ (char)((uw_mobile_object_t *)iVar9)->npc_whoami
|
- iVar9[26]
+ (char)((uw_mobile_object_t *)iVar9)->npc_whoami
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_0_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(ushort *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(ushort *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_0_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(undefined2 *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(undefined2 *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_0_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
|
- *(short *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
|
- *(short *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_2_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
|
- *(ushort *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_2_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
|
- *(undefined2 *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_2_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_signed
|
- *(short *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_4_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
|
- *(ushort *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_4_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
|
- *(undefined2 *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_4_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_signed
|
- *(short *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_6_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
|
- *(ushort *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_6_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
|
- *(undefined2 *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_6_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_signed
|
- *(short *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_11_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(ushort *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_11_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(undefined2 *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_11_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
|
- *(short *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_13_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(ushort *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_13_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(undefined2 *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_13_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
|
- *(short *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_15_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
|
- *(ushort *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_15_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
|
- *(undefined2 *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_15_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_signed
|
- *(short *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_22_ushort@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
|
- *(ushort *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_22_undefined2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
|
- *(undefined2 *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
)
...>
}

@npc_notice_and_idle_tick_iVar2_word_22_short@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_signed
|
- *(short *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_signed
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_0_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(byte *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(byte *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(undefined1 *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(undefined1 *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_0_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- &*(char *)(iVar2 + 0)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- &*(char *)iVar2
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- &iVar2[0]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_0_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar2 + 0) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar2 = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
|
- iVar2[0] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_0_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(char *)(iVar2 + 0)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(char *)iVar2
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- iVar2[0]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_1_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- *(byte *)(iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- *(undefined1 *)(iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_1_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 1)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- &*(char *)(iVar2 + 1)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- &iVar2[1]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_1_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 1) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar2 + 1) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
|
- iVar2[1] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_1_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 1)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- *(char *)(iVar2 + 1)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- iVar2[1]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_2_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- *(byte *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- *(undefined1 *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_2_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 2)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- &*(char *)(iVar2 + 2)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- &iVar2[2]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_2_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 2) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar2 + 2) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
|
- iVar2[2] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_2_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 2)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- *(char *)(iVar2 + 2)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- iVar2[2]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_3_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- *(byte *)(iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- *(undefined1 *)(iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_3_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 3)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- &*(char *)(iVar2 + 3)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- &iVar2[3]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_3_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 3) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar2 + 3) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
|
- iVar2[3] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_3_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 3)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- *(char *)(iVar2 + 3)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- iVar2[3]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_4_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- *(byte *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- *(undefined1 *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_4_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 4)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- &*(char *)(iVar2 + 4)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- &iVar2[4]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_4_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 4) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar2 + 4) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
|
- iVar2[4] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_4_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 4)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- *(char *)(iVar2 + 4)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- iVar2[4]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_5_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- *(byte *)(iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- *(undefined1 *)(iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_5_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 5)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- &*(char *)(iVar2 + 5)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- &iVar2[5]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_5_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 5) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar2 + 5) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
|
- iVar2[5] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_5_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 5)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- *(char *)(iVar2 + 5)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- iVar2[5]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_6_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- *(byte *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- *(undefined1 *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_6_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 6)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- &*(char *)(iVar2 + 6)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- &iVar2[6]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_6_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 6) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar2 + 6) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
|
- iVar2[6] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_6_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 6)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- *(char *)(iVar2 + 6)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- iVar2[6]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_7_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- *(byte *)(iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- *(undefined1 *)(iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_7_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 7)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- &*(char *)(iVar2 + 7)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- &iVar2[7]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_7_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 7) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar2 + 7) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
|
- iVar2[7] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_7_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 7)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- *(char *)(iVar2 + 7)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- iVar2[7]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_8_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
|
- *(byte *)(iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
|
- *(undefined1 *)(iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_8_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 8)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
|
- &*(char *)(iVar2 + 8)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
|
- &iVar2[8]
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_8_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 8) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
|
- *(char *)(iVar2 + 8) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
|
- iVar2[8] = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_8_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 8)
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
|
- *(char *)(iVar2 + 8)
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
|
- iVar2[8]
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_9_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
|
- *(byte *)(iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
|
- *(undefined1 *)(iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_9_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 9)
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
|
- &*(char *)(iVar2 + 9)
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
|
- &iVar2[9]
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_9_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 9) = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
|
- *(char *)(iVar2 + 9) = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
|
- iVar2[9] = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_9_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 9)
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
|
- *(char *)(iVar2 + 9)
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
|
- iVar2[9]
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_10_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
|
- *(byte *)(iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
|
- *(undefined1 *)(iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_10_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 10)
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
|
- &*(char *)(iVar2 + 10)
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
|
- &iVar2[10]
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_10_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 10) = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
|
- *(char *)(iVar2 + 10) = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
|
- iVar2[10] = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_10_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 10)
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
|
- *(char *)(iVar2 + 10)
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
|
- iVar2[10]
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_11_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(byte *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(undefined1 *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_11_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 11)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &*(char *)(iVar2 + 11)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &iVar2[11]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_11_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 11) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- *(char *)(iVar2 + 11) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- iVar2[11] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_11_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 11)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(char *)(iVar2 + 11)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- iVar2[11]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_12_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(byte *)(iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(undefined1 *)(iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_12_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 12)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &*(char *)(iVar2 + 12)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &iVar2[12]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_12_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 12) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- *(char *)(iVar2 + 12) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- iVar2[12] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_12_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 12)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(char *)(iVar2 + 12)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- iVar2[12]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_13_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(byte *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(undefined1 *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_13_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 13)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &*(char *)(iVar2 + 13)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &iVar2[13]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_13_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 13) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- *(char *)(iVar2 + 13) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- iVar2[13] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_13_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 13)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(char *)(iVar2 + 13)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- iVar2[13]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_14_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(byte *)(iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(undefined1 *)(iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_14_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 14)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &*(char *)(iVar2 + 14)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &iVar2[14]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_14_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 14) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- *(char *)(iVar2 + 14) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- iVar2[14] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_14_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 14)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(char *)(iVar2 + 14)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- iVar2[14]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_15_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
|
- *(byte *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
|
- *(undefined1 *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_15_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 15)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
|
- &*(char *)(iVar2 + 15)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
|
- &iVar2[15]
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_15_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 15) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
|
- *(char *)(iVar2 + 15) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
|
- iVar2[15] = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_15_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 15)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
|
- *(char *)(iVar2 + 15)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
|
- iVar2[15]
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_16_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
|
- *(byte *)(iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
|
- *(undefined1 *)(iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_16_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 16)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
|
- &*(char *)(iVar2 + 16)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
|
- &iVar2[16]
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_16_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 16) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
|
- *(char *)(iVar2 + 16) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
|
- iVar2[16] = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_16_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 16)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
|
- *(char *)(iVar2 + 16)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
|
- iVar2[16]
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_17_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
|
- *(byte *)(iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
|
- *(undefined1 *)(iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_17_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 17)
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
|
- &*(char *)(iVar2 + 17)
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
|
- &iVar2[17]
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_17_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 17) = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
|
- *(char *)(iVar2 + 17) = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
|
- iVar2[17] = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_17_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 17)
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
|
- *(char *)(iVar2 + 17)
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
|
- iVar2[17]
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_18_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
|
- *(byte *)(iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
|
- *(undefined1 *)(iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_18_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 18)
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
|
- &*(char *)(iVar2 + 18)
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
|
- &iVar2[18]
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_18_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 18) = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
|
- *(char *)(iVar2 + 18) = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
|
- iVar2[18] = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_18_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 18)
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
|
- *(char *)(iVar2 + 18)
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
|
- iVar2[18]
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_19_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
|
- *(byte *)(iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
|
- *(undefined1 *)(iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_19_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 19)
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
|
- &*(char *)(iVar2 + 19)
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
|
- &iVar2[19]
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_19_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 19) = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
|
- *(char *)(iVar2 + 19) = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
|
- iVar2[19] = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_19_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 19)
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
|
- *(char *)(iVar2 + 19)
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
|
- iVar2[19]
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_20_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
|
- *(byte *)(iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
|
- *(undefined1 *)(iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_20_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 20)
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
|
- &*(char *)(iVar2 + 20)
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
|
- &iVar2[20]
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_20_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 20) = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
|
- *(char *)(iVar2 + 20) = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
|
- iVar2[20] = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_20_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 20)
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
|
- *(char *)(iVar2 + 20)
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
|
- iVar2[20]
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_21_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
|
- *(byte *)(iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
|
- *(undefined1 *)(iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_21_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 21)
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
|
- &*(char *)(iVar2 + 21)
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
|
- &iVar2[21]
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_21_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 21) = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
|
- *(char *)(iVar2 + 21) = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
|
- iVar2[21] = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_21_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 21)
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
|
- *(char *)(iVar2 + 21)
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
|
- iVar2[21]
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_22_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
|
- *(byte *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
|
- *(undefined1 *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_22_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 22)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
|
- &*(char *)(iVar2 + 22)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
|
- &iVar2[22]
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_22_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 22) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
|
- *(char *)(iVar2 + 22) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
|
- iVar2[22] = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_22_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 22)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
|
- *(char *)(iVar2 + 22)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
|
- iVar2[22]
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_23_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
|
- *(byte *)(iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
|
- *(undefined1 *)(iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_23_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 23)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
|
- &*(char *)(iVar2 + 23)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
|
- &iVar2[23]
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_23_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 23) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
|
- *(char *)(iVar2 + 23) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
|
- iVar2[23] = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_23_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 23)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
|
- *(char *)(iVar2 + 23)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
|
- iVar2[23]
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_24_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
|
- *(byte *)(iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
|
- *(undefined1 *)(iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_24_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 24)
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
|
- &*(char *)(iVar2 + 24)
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
|
- &iVar2[24]
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_24_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 24) = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
|
- *(char *)(iVar2 + 24) = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
|
- iVar2[24] = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_24_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 24)
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
|
- *(char *)(iVar2 + 24)
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
|
- iVar2[24]
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_25_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- *(byte *)(iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- *(undefined1 *)(iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_25_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 25)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- &*(char *)(iVar2 + 25)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- &iVar2[25]
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_25_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 25) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar2 + 25) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
|
- iVar2[25] = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_25_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 25)
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- *(char *)(iVar2 + 25)
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- iVar2[25]
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_26_byte@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
|
- *(byte *)(iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
|
- *(undefined1 *)(iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_26_char_address@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 26)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
|
- &*(char *)(iVar2 + 26)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
|
- &iVar2[26]
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_26_char_store@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 26) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
|
- *(char *)(iVar2 + 26) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
|
- iVar2[26] = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
)
...>
}

@npc_notice_and_idle_tick_iVar2_byte_26_char@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 26)
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
|
- *(char *)(iVar2 + 26)
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
|
- iVar2[26]
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_0_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(ushort *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(ushort *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_0_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(undefined2 *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
|
- *(undefined2 *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_0_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
|
- *(short *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
|
- *(short *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_2_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
|
- *(ushort *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_2_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
|
- *(undefined2 *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_2_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_signed
|
- *(short *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_4_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
|
- *(ushort *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_4_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
|
- *(undefined2 *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_4_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_signed
|
- *(short *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_6_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
|
- *(ushort *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_6_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
|
- *(undefined2 *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_6_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_signed
|
- *(short *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_11_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(ushort *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_11_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
|
- *(undefined2 *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_11_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
|
- *(short *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_13_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(ushort *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_13_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
|
- *(undefined2 *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_13_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
|
- *(short *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_15_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
|
- *(ushort *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_15_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
|
- *(undefined2 *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_15_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_signed
|
- *(short *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_22_ushort@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
|
- *(ushort *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_22_undefined2@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
|
- *(undefined2 *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_word_22_short@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_signed
|
- *(short *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_signed
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_0_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(byte *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(byte *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(undefined1 *)(iVar2 + 0)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(undefined1 *)iVar2
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_0_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 0)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- &*(char *)(iVar2 + 0)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- &*(char *)iVar2
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- &iVar2[0]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_0_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
|
- *(char *)(iVar2 + 0) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
|
- *(char *)iVar2 = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
|
- iVar2[0] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_0_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 0)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(char *)(iVar2 + 0)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- *(char *)iVar2
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
|
- iVar2[0]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_1_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- *(byte *)(iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- *(undefined1 *)(iVar2 + 1)
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_1_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 1)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- &*(char *)(iVar2 + 1)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- &iVar2[1]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_1_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 1) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
|
- *(char *)(iVar2 + 1) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
|
- iVar2[1] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_1_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 1)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- *(char *)(iVar2 + 1)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
|
- iVar2[1]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.type_flags_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_2_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- *(byte *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- *(undefined1 *)(iVar2 + 2)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_2_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 2)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- &*(char *)(iVar2 + 2)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- &iVar2[2]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_2_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 2) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
|
- *(char *)(iVar2 + 2) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
|
- iVar2[2] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_2_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 2)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- *(char *)(iVar2 + 2)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
|
- iVar2[2]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_3_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- *(byte *)(iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- *(undefined1 *)(iVar2 + 3)
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_3_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 3)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- &*(char *)(iVar2 + 3)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- &iVar2[3]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_3_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 3) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
|
- *(char *)(iVar2 + 3) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
|
- iVar2[3] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_3_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 3)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- *(char *)(iVar2 + 3)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
|
- iVar2[3]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.position_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_4_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- *(byte *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- *(undefined1 *)(iVar2 + 4)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_4_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 4)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- &*(char *)(iVar2 + 4)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- &iVar2[4]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_4_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 4) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
|
- *(char *)(iVar2 + 4) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
|
- iVar2[4] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_4_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 4)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- *(char *)(iVar2 + 4)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
|
- iVar2[4]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_5_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- *(byte *)(iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- *(undefined1 *)(iVar2 + 5)
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_5_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 5)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- &*(char *)(iVar2 + 5)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- &iVar2[5]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_5_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 5) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
|
- *(char *)(iVar2 + 5) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
|
- iVar2[5] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_5_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 5)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- *(char *)(iVar2 + 5)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
|
- iVar2[5]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.chain_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_6_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- *(byte *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- *(undefined1 *)(iVar2 + 6)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_6_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 6)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- &*(char *)(iVar2 + 6)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- &iVar2[6]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_6_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 6) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
|
- *(char *)(iVar2 + 6) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
|
- iVar2[6] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_6_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 6)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- *(char *)(iVar2 + 6)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
|
- iVar2[6]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_7_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- *(byte *)(iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- *(undefined1 *)(iVar2 + 7)
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_7_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 7)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- &*(char *)(iVar2 + 7)
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- &iVar2[7]
+ (char *)&((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_7_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 7) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
|
- *(char *)(iVar2 + 7) = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
|
- iVar2[7] = E;
+ ((uw_mobile_object_t *)iVar2)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_7_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 7)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- *(char *)(iVar2 + 7)
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
|
- iVar2[7]
+ (char)((uw_mobile_object_t *)iVar2)->hdr.link_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_8_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
|
- *(byte *)(iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
|
- *(undefined1 *)(iVar2 + 8)
+ ((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_8_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 8)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
|
- &*(char *)(iVar2 + 8)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
|
- &iVar2[8]
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_8_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 8) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
|
- *(char *)(iVar2 + 8) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
|
- iVar2[8] = E;
+ ((uw_mobile_object_t *)iVar2)->npc_hp = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_8_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 8)
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
|
- *(char *)(iVar2 + 8)
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
|
- iVar2[8]
+ (char)((uw_mobile_object_t *)iVar2)->npc_hp
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_9_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
|
- *(byte *)(iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
|
- *(undefined1 *)(iVar2 + 9)
+ ((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_9_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 9)
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
|
- &*(char *)(iVar2 + 9)
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
|
- &iVar2[9]
+ (char *)&((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_9_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 9) = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
|
- *(char *)(iVar2 + 9) = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
|
- iVar2[9] = E;
+ ((uw_mobile_object_t *)iVar2)->full_heading = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_9_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 9)
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
|
- *(char *)(iVar2 + 9)
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
|
- iVar2[9]
+ (char)((uw_mobile_object_t *)iVar2)->full_heading
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_10_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
|
- *(byte *)(iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
|
- *(undefined1 *)(iVar2 + 10)
+ ((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_10_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 10)
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
|
- &*(char *)(iVar2 + 10)
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
|
- &iVar2[10]
+ (char *)&((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_10_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 10) = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
|
- *(char *)(iVar2 + 10) = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
|
- iVar2[10] = E;
+ ((uw_mobile_object_t *)iVar2)->movement_flags = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_10_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 10)
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
|
- *(char *)(iVar2 + 10)
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
|
- iVar2[10]
+ (char)((uw_mobile_object_t *)iVar2)->movement_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_11_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(byte *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(undefined1 *)(iVar2 + 11)
+ ((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_11_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 11)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &*(char *)(iVar2 + 11)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
|
- &iVar2[11]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_11_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 11) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- *(char *)(iVar2 + 11) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
|
- iVar2[11] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_11_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 11)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- *(char *)(iVar2 + 11)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
|
- iVar2[11]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_12_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(byte *)(iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(undefined1 *)(iVar2 + 12)
+ ((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_12_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 12)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &*(char *)(iVar2 + 12)
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
|
- &iVar2[12]
+ (char *)&((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_12_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 12) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- *(char *)(iVar2 + 12) = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
|
- iVar2[12] = E;
+ ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_12_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 12)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- *(char *)(iVar2 + 12)
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
|
- iVar2[12]
+ (char)((uw_mobile_object_t *)iVar2)->goal_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_13_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(byte *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(undefined1 *)(iVar2 + 13)
+ ((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_13_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 13)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &*(char *)(iVar2 + 13)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
|
- &iVar2[13]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_13_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 13) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- *(char *)(iVar2 + 13) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
|
- iVar2[13] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_13_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 13)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- *(char *)(iVar2 + 13)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
|
- iVar2[13]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_14_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(byte *)(iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(undefined1 *)(iVar2 + 14)
+ ((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_14_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 14)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &*(char *)(iVar2 + 14)
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
|
- &iVar2[14]
+ (char *)&((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_14_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 14) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- *(char *)(iVar2 + 14) = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
|
- iVar2[14] = E;
+ ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_14_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 14)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- *(char *)(iVar2 + 14)
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
|
- iVar2[14]
+ (char)((uw_mobile_object_t *)iVar2)->status_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_15_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
|
- *(byte *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
|
- *(undefined1 *)(iVar2 + 15)
+ ((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_15_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 15)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
|
- &*(char *)(iVar2 + 15)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
|
- &iVar2[15]
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_15_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 15) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
|
- *(char *)(iVar2 + 15) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
|
- iVar2[15] = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_15_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 15)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
|
- *(char *)(iVar2 + 15)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
|
- iVar2[15]
+ (char)((uw_mobile_object_t *)iVar2)->target_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_16_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
|
- *(byte *)(iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
|
- *(undefined1 *)(iVar2 + 16)
+ ((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_16_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 16)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
|
- &*(char *)(iVar2 + 16)
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
|
- &iVar2[16]
+ (char *)&((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_16_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 16) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
|
- *(char *)(iVar2 + 16) = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
|
- iVar2[16] = E;
+ ((uw_mobile_object_t *)iVar2)->target_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_16_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 16)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
|
- *(char *)(iVar2 + 16)
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
|
- iVar2[16]
+ (char)((uw_mobile_object_t *)iVar2)->target_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_17_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
|
- *(byte *)(iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
|
- *(undefined1 *)(iVar2 + 17)
+ ((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_17_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 17)
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
|
- &*(char *)(iVar2 + 17)
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
|
- &iVar2[17]
+ (char *)&((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_17_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 17) = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
|
- *(char *)(iVar2 + 17) = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
|
- iVar2[17] = E;
+ ((uw_mobile_object_t *)iVar2)->recent_damage = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_17_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 17)
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
|
- *(char *)(iVar2 + 17)
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
|
- iVar2[17]
+ (char)((uw_mobile_object_t *)iVar2)->recent_damage
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_18_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
|
- *(byte *)(iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
|
- *(undefined1 *)(iVar2 + 18)
+ ((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_18_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 18)
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
|
- &*(char *)(iVar2 + 18)
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
|
- &iVar2[18]
+ (char *)&((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_18_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 18) = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
|
- *(char *)(iVar2 + 18) = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
|
- iVar2[18] = E;
+ ((uw_mobile_object_t *)iVar2)->damage_source = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_18_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 18)
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
|
- *(char *)(iVar2 + 18)
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
|
- iVar2[18]
+ (char)((uw_mobile_object_t *)iVar2)->damage_source
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_19_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
|
- *(byte *)(iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
|
- *(undefined1 *)(iVar2 + 19)
+ ((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_19_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 19)
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
|
- &*(char *)(iVar2 + 19)
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
|
- &iVar2[19]
+ (char *)&((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_19_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 19) = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
|
- *(char *)(iVar2 + 19) = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
|
- iVar2[19] = E;
+ ((uw_mobile_object_t *)iVar2)->motion_flags = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_19_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 19)
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
|
- *(char *)(iVar2 + 19)
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
|
- iVar2[19]
+ (char)((uw_mobile_object_t *)iVar2)->motion_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_20_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
|
- *(byte *)(iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
|
- *(undefined1 *)(iVar2 + 20)
+ ((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_20_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 20)
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
|
- &*(char *)(iVar2 + 20)
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
|
- &iVar2[20]
+ (char *)&((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_20_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 20) = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
|
- *(char *)(iVar2 + 20) = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
|
- iVar2[20] = E;
+ ((uw_mobile_object_t *)iVar2)->attack_pitch = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_20_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 20)
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
|
- *(char *)(iVar2 + 20)
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
|
- iVar2[20]
+ (char)((uw_mobile_object_t *)iVar2)->attack_pitch
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_21_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
|
- *(byte *)(iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
|
- *(undefined1 *)(iVar2 + 21)
+ ((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_21_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 21)
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
|
- &*(char *)(iVar2 + 21)
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
|
- &iVar2[21]
+ (char *)&((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_21_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 21) = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
|
- *(char *)(iVar2 + 21) = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
|
- iVar2[21] = E;
+ ((uw_mobile_object_t *)iVar2)->animation_flags = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_21_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 21)
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
|
- *(char *)(iVar2 + 21)
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
|
- iVar2[21]
+ (char)((uw_mobile_object_t *)iVar2)->animation_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_22_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
|
- *(byte *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
|
- *(undefined1 *)(iVar2 + 22)
+ ((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_22_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 22)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
|
- &*(char *)(iVar2 + 22)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
|
- &iVar2[22]
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_22_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 22) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
|
- *(char *)(iVar2 + 22) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
|
- iVar2[22] = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_low = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_22_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 22)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
|
- *(char *)(iVar2 + 22)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
|
- iVar2[22]
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_low
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_23_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
|
- *(byte *)(iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
|
- *(undefined1 *)(iVar2 + 23)
+ ((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_23_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 23)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
|
- &*(char *)(iVar2 + 23)
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
|
- &iVar2[23]
+ (char *)&((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_23_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 23) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
|
- *(char *)(iVar2 + 23) = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
|
- iVar2[23] = E;
+ ((uw_mobile_object_t *)iVar2)->tile_word_high = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_23_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 23)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
|
- *(char *)(iVar2 + 23)
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
|
- iVar2[23]
+ (char)((uw_mobile_object_t *)iVar2)->tile_word_high
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_24_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
|
- *(byte *)(iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
|
- *(undefined1 *)(iVar2 + 24)
+ ((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_24_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 24)
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
|
- &*(char *)(iVar2 + 24)
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
|
- &iVar2[24]
+ (char *)&((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_24_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 24) = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
|
- *(char *)(iVar2 + 24) = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
|
- iVar2[24] = E;
+ ((uw_mobile_object_t *)iVar2)->heading_flags = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_24_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 24)
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
|
- *(char *)(iVar2 + 24)
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
|
- iVar2[24]
+ (char)((uw_mobile_object_t *)iVar2)->heading_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_25_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- *(byte *)(iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- *(undefined1 *)(iVar2 + 25)
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_25_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 25)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- &*(char *)(iVar2 + 25)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- &iVar2[25]
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_25_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 25) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
|
- *(char *)(iVar2 + 25) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
|
- iVar2[25] = E;
+ ((uw_mobile_object_t *)iVar2)->npc_ai_flags = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_25_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 25)
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- *(char *)(iVar2 + 25)
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
|
- iVar2[25]
+ (char)((uw_mobile_object_t *)iVar2)->npc_ai_flags
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_26_byte@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
|
- *(byte *)(iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
|
- *(undefined1 *)(iVar2 + 26)
+ ((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_26_char_address@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)iVar2 + 26)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
|
- &*(char *)(iVar2 + 26)
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
|
- &iVar2[26]
+ (char *)&((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_26_char_store@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 26) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
|
- *(char *)(iVar2 + 26) = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
|
- iVar2[26] = E;
+ ((uw_mobile_object_t *)iVar2)->npc_whoami = (byte)E;
)
...>
}

@npc_wander_return_home_exact_tick_iVar2_byte_26_char@
type R;
identifier F =~ "^\(npc_wander_return_home_exact_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)iVar2 + 26)
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
|
- *(char *)(iVar2 + 26)
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
|
- iVar2[26]
+ (char)((uw_mobile_object_t *)iVar2)->npc_whoami
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_0_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_0_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 0)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_0_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 0)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_2_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 2)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_2_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 2)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_2_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 2)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_4_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 4)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_4_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 4)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_4_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 4)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_6_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 6)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_6_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 6)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_6_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 6)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_11_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 11)
+ ((uw_mobile_object_t *)puVar11)->goal_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_11_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 11)
+ ((uw_mobile_object_t *)puVar11)->goal_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_11_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 11)
+ ((uw_mobile_object_t *)puVar11)->goal_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_13_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 13)
+ ((uw_mobile_object_t *)puVar11)->status_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_13_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 13)
+ ((uw_mobile_object_t *)puVar11)->status_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_13_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 13)
+ ((uw_mobile_object_t *)puVar11)->status_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_15_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 15)
+ ((uw_mobile_object_t *)puVar11)->target_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_15_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 15)
+ ((uw_mobile_object_t *)puVar11)->target_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_15_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 15)
+ ((uw_mobile_object_t *)puVar11)->target_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_22_ushort@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 22)
+ ((uw_mobile_object_t *)puVar11)->tile_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_22_undefined2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar11 + 22)
+ ((uw_mobile_object_t *)puVar11)->tile_word
)
...>
}

@npc_tick_npc_ai_tick_puVar11_word_22_short@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(short *)((char *)puVar11 + 22)
+ ((uw_mobile_object_t *)puVar11)->tile_word_signed
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_0_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 0)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_0_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 0)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_0_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 0)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.type_flags_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_0_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_0_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 0)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.type_flags_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_1_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 1)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_1_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 1)
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_1_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 1)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.type_flags_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_1_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 1) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.type_flags_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_1_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 1)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.type_flags_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_2_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 2)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_2_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 2)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_2_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 2)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.position_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_2_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 2) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_2_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 2)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.position_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_3_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 3)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_3_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 3)
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_3_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 3)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.position_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_3_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 3) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.position_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_3_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 3)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.position_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_4_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 4)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_4_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 4)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_4_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 4)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.chain_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_4_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 4) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_4_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 4)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.chain_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_5_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 5)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_5_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 5)
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_5_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 5)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.chain_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_5_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 5) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.chain_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_5_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 5)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.chain_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_6_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 6)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_6_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 6)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_6_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 6)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.link_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_6_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 6) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_6_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 6)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.link_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_7_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 7)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_7_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 7)
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_7_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 7)
+ (char *)&((uw_mobile_object_t *)puVar11)->hdr.link_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_7_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 7) = E;
+ ((uw_mobile_object_t *)puVar11)->hdr.link_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_7_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 7)
+ (char)((uw_mobile_object_t *)puVar11)->hdr.link_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_8_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 8)
+ ((uw_mobile_object_t *)puVar11)->npc_hp
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_8_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 8)
+ ((uw_mobile_object_t *)puVar11)->npc_hp
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_8_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 8)
+ (char *)&((uw_mobile_object_t *)puVar11)->npc_hp
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_8_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 8) = E;
+ ((uw_mobile_object_t *)puVar11)->npc_hp = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_8_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 8)
+ (char)((uw_mobile_object_t *)puVar11)->npc_hp
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_9_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 9)
+ ((uw_mobile_object_t *)puVar11)->full_heading
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_9_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 9)
+ ((uw_mobile_object_t *)puVar11)->full_heading
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_9_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 9)
+ (char *)&((uw_mobile_object_t *)puVar11)->full_heading
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_9_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 9) = E;
+ ((uw_mobile_object_t *)puVar11)->full_heading = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_9_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 9)
+ (char)((uw_mobile_object_t *)puVar11)->full_heading
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_10_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 10)
+ ((uw_mobile_object_t *)puVar11)->movement_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_10_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 10)
+ ((uw_mobile_object_t *)puVar11)->movement_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_10_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 10)
+ (char *)&((uw_mobile_object_t *)puVar11)->movement_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_10_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 10) = E;
+ ((uw_mobile_object_t *)puVar11)->movement_flags = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_10_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 10)
+ (char)((uw_mobile_object_t *)puVar11)->movement_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_11_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 11)
+ ((uw_mobile_object_t *)puVar11)->goal_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_11_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 11)
+ ((uw_mobile_object_t *)puVar11)->goal_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_11_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 11)
+ (char *)&((uw_mobile_object_t *)puVar11)->goal_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_11_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 11) = E;
+ ((uw_mobile_object_t *)puVar11)->goal_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_11_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 11)
+ (char)((uw_mobile_object_t *)puVar11)->goal_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_12_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 12)
+ ((uw_mobile_object_t *)puVar11)->goal_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_12_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 12)
+ ((uw_mobile_object_t *)puVar11)->goal_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_12_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 12)
+ (char *)&((uw_mobile_object_t *)puVar11)->goal_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_12_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 12) = E;
+ ((uw_mobile_object_t *)puVar11)->goal_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_12_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 12)
+ (char)((uw_mobile_object_t *)puVar11)->goal_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_13_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 13)
+ ((uw_mobile_object_t *)puVar11)->status_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_13_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 13)
+ ((uw_mobile_object_t *)puVar11)->status_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_13_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 13)
+ (char *)&((uw_mobile_object_t *)puVar11)->status_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_13_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 13) = E;
+ ((uw_mobile_object_t *)puVar11)->status_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_13_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 13)
+ (char)((uw_mobile_object_t *)puVar11)->status_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_14_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 14)
+ ((uw_mobile_object_t *)puVar11)->status_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_14_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 14)
+ ((uw_mobile_object_t *)puVar11)->status_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_14_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 14)
+ (char *)&((uw_mobile_object_t *)puVar11)->status_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_14_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 14) = E;
+ ((uw_mobile_object_t *)puVar11)->status_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_14_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 14)
+ (char)((uw_mobile_object_t *)puVar11)->status_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_15_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 15)
+ ((uw_mobile_object_t *)puVar11)->target_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_15_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 15)
+ ((uw_mobile_object_t *)puVar11)->target_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_15_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 15)
+ (char *)&((uw_mobile_object_t *)puVar11)->target_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_15_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 15) = E;
+ ((uw_mobile_object_t *)puVar11)->target_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_15_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 15)
+ (char)((uw_mobile_object_t *)puVar11)->target_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_16_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 16)
+ ((uw_mobile_object_t *)puVar11)->target_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_16_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 16)
+ ((uw_mobile_object_t *)puVar11)->target_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_16_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 16)
+ (char *)&((uw_mobile_object_t *)puVar11)->target_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_16_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 16) = E;
+ ((uw_mobile_object_t *)puVar11)->target_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_16_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 16)
+ (char)((uw_mobile_object_t *)puVar11)->target_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_17_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 17)
+ ((uw_mobile_object_t *)puVar11)->recent_damage
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_17_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 17)
+ ((uw_mobile_object_t *)puVar11)->recent_damage
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_17_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 17)
+ (char *)&((uw_mobile_object_t *)puVar11)->recent_damage
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_17_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 17) = E;
+ ((uw_mobile_object_t *)puVar11)->recent_damage = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_17_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 17)
+ (char)((uw_mobile_object_t *)puVar11)->recent_damage
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_18_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 18)
+ ((uw_mobile_object_t *)puVar11)->damage_source
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_18_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 18)
+ ((uw_mobile_object_t *)puVar11)->damage_source
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_18_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 18)
+ (char *)&((uw_mobile_object_t *)puVar11)->damage_source
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_18_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 18) = E;
+ ((uw_mobile_object_t *)puVar11)->damage_source = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_18_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 18)
+ (char)((uw_mobile_object_t *)puVar11)->damage_source
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_19_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 19)
+ ((uw_mobile_object_t *)puVar11)->motion_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_19_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 19)
+ ((uw_mobile_object_t *)puVar11)->motion_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_19_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 19)
+ (char *)&((uw_mobile_object_t *)puVar11)->motion_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_19_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 19) = E;
+ ((uw_mobile_object_t *)puVar11)->motion_flags = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_19_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 19)
+ (char)((uw_mobile_object_t *)puVar11)->motion_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_20_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 20)
+ ((uw_mobile_object_t *)puVar11)->attack_pitch
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_20_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 20)
+ ((uw_mobile_object_t *)puVar11)->attack_pitch
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_20_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 20)
+ (char *)&((uw_mobile_object_t *)puVar11)->attack_pitch
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_20_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 20) = E;
+ ((uw_mobile_object_t *)puVar11)->attack_pitch = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_20_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 20)
+ (char)((uw_mobile_object_t *)puVar11)->attack_pitch
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_21_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 21)
+ ((uw_mobile_object_t *)puVar11)->animation_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_21_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 21)
+ ((uw_mobile_object_t *)puVar11)->animation_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_21_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 21)
+ (char *)&((uw_mobile_object_t *)puVar11)->animation_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_21_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 21) = E;
+ ((uw_mobile_object_t *)puVar11)->animation_flags = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_21_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 21)
+ (char)((uw_mobile_object_t *)puVar11)->animation_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_22_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 22)
+ ((uw_mobile_object_t *)puVar11)->tile_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_22_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 22)
+ ((uw_mobile_object_t *)puVar11)->tile_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_22_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 22)
+ (char *)&((uw_mobile_object_t *)puVar11)->tile_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_22_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 22) = E;
+ ((uw_mobile_object_t *)puVar11)->tile_word_low = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_22_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 22)
+ (char)((uw_mobile_object_t *)puVar11)->tile_word_low
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_23_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 23)
+ ((uw_mobile_object_t *)puVar11)->tile_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_23_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 23)
+ ((uw_mobile_object_t *)puVar11)->tile_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_23_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 23)
+ (char *)&((uw_mobile_object_t *)puVar11)->tile_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_23_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 23) = E;
+ ((uw_mobile_object_t *)puVar11)->tile_word_high = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_23_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 23)
+ (char)((uw_mobile_object_t *)puVar11)->tile_word_high
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_24_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 24)
+ ((uw_mobile_object_t *)puVar11)->heading_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_24_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 24)
+ ((uw_mobile_object_t *)puVar11)->heading_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_24_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 24)
+ (char *)&((uw_mobile_object_t *)puVar11)->heading_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_24_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 24) = E;
+ ((uw_mobile_object_t *)puVar11)->heading_flags = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_24_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 24)
+ (char)((uw_mobile_object_t *)puVar11)->heading_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_25_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 25)
+ ((uw_mobile_object_t *)puVar11)->npc_ai_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_25_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 25)
+ ((uw_mobile_object_t *)puVar11)->npc_ai_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_25_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 25)
+ (char *)&((uw_mobile_object_t *)puVar11)->npc_ai_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_25_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 25) = E;
+ ((uw_mobile_object_t *)puVar11)->npc_ai_flags = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_25_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 25)
+ (char)((uw_mobile_object_t *)puVar11)->npc_ai_flags
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_26_byte@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar11 + 26)
+ ((uw_mobile_object_t *)puVar11)->npc_whoami
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_26_undefined1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar11 + 26)
+ ((uw_mobile_object_t *)puVar11)->npc_whoami
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_26_char_address@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar11 + 26)
+ (char *)&((uw_mobile_object_t *)puVar11)->npc_whoami
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_26_char_store@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 26) = E;
+ ((uw_mobile_object_t *)puVar11)->npc_whoami = (byte)E;
)
...>
}

@npc_tick_npc_ai_tick_puVar11_byte_26_char@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar11 + 26)
+ (char)((uw_mobile_object_t *)puVar11)->npc_whoami
)
...>
}

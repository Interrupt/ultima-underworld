@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- ((ushort *)puVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- *(ushort *)puVar5 & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- puVar5[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
|
- *puVar5 & 0x1ff
+ ((uw_object_hdr_t *)puVar5)->object_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (((ushort *)puVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (((ushort *)puVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)puVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(ushort *)puVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (puVar5[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (puVar5[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*puVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*puVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar5)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (((ushort *)puVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (((ushort *)puVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)puVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(ushort *)puVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (puVar5[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (puVar5[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*puVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*puVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar5)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (((ushort *)puVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (((ushort *)puVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)puVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(ushort *)puVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (puVar5[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (puVar5[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*puVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*puVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar5)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (((ushort *)puVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (((ushort *)puVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)puVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(ushort *)puVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (puVar5[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (puVar5[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*puVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*puVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar5)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)((char *)puVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(ushort *)((char *)puVar5 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- ((ushort *)puVar5)[0] >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(ushort *)puVar5 >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (puVar5[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (puVar5[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- puVar5[0] >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*puVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *puVar5 >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(byte *)((char *)puVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- *(byte *)((char *)puVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar5)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- ((ushort *)puVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- puVar5[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- *(byte *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
|
- (byte)puVar5[1] & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (((ushort *)puVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (((ushort *)puVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (puVar5[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar5)->heading
|
- (puVar5[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar5)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (((ushort *)puVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (((ushort *)puVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (puVar5[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (puVar5[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar5)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(ushort *)((char *)puVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- *(ushort *)((char *)puVar5 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- ((ushort *)puVar5)[1] >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (puVar5[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (puVar5[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- puVar5[1] >> 13
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(byte *)((char *)puVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- *(byte *)((char *)puVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar5)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- ((ushort *)puVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- puVar5[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- *(byte *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
|
- (byte)puVar5[2] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (*(ushort *)((char *)puVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- *(ushort *)((char *)puVar5 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- ((ushort *)puVar5)[2] >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- (puVar5[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (puVar5[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
|
- puVar5[2] >> 6
+ ((uw_object_hdr_t *)puVar5)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- ((ushort *)puVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- puVar5[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- *(byte *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
|
- (byte)puVar5[3] & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (*(ushort *)((char *)puVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- *(ushort *)((char *)puVar5 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- ((ushort *)puVar5)[3] >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- (puVar5[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (puVar5[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
|
- puVar5[3] >> 6
+ ((uw_object_hdr_t *)puVar5)->link
)
...>
}

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- ((ushort *)puVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *(ushort *)puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *(ushort *)(puVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- CONCAT11(puVar4[1], *puVar4) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- CONCAT11(puVar4[1], puVar4[0]) & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (((ushort *)puVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (((ushort *)puVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)puVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)puVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)(puVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(ushort *)(puVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (CONCAT11(puVar4[1], *puVar4) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (CONCAT11(puVar4[1], *puVar4) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (CONCAT11(puVar4[1], puVar4[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (CONCAT11(puVar4[1], puVar4[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)(puVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)(puVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar4)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (((ushort *)puVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (((ushort *)puVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)puVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)puVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)(puVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(ushort *)(puVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (CONCAT11(puVar4[1], *puVar4) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (CONCAT11(puVar4[1], *puVar4) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (CONCAT11(puVar4[1], puVar4[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (CONCAT11(puVar4[1], puVar4[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)(puVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)(puVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar4)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (((ushort *)puVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (((ushort *)puVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)puVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)puVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)(puVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(ushort *)(puVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (CONCAT11(puVar4[1], *puVar4) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (CONCAT11(puVar4[1], *puVar4) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (CONCAT11(puVar4[1], puVar4[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (CONCAT11(puVar4[1], puVar4[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)(puVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)(puVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar4)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (((ushort *)puVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (((ushort *)puVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)puVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)puVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)(puVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(ushort *)(puVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (CONCAT11(puVar4[1], *puVar4) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (CONCAT11(puVar4[1], *puVar4) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (CONCAT11(puVar4[1], puVar4[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (CONCAT11(puVar4[1], puVar4[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)(puVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)(puVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar4)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)((char *)puVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)(puVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)(puVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (CONCAT11(puVar4[1], *puVar4) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (CONCAT11(puVar4[1], *puVar4) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (CONCAT11(puVar4[1], puVar4[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (CONCAT11(puVar4[1], puVar4[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(byte *)((char *)puVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)(puVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)(puVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(byte *)(puVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- ((ushort *)puVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- *(ushort *)(puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- *(byte *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- puVar4[2] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- *(byte *)(puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (((ushort *)puVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (((ushort *)puVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (*(ushort *)(puVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (*(ushort *)(puVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (((ushort *)puVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (((ushort *)puVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(ushort *)(puVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(ushort *)(puVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)(puVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)(puVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar4)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(ushort *)((char *)puVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(ushort *)(puVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(ushort *)(puVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- *(byte *)((char *)puVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)(puVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)(puVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- *(byte *)(puVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- ((ushort *)puVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- *(ushort *)(puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- *(byte *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- puVar4[4] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- *(byte *)(puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (*(ushort *)((char *)puVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (*(ushort *)(puVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (*(ushort *)(puVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- ((ushort *)puVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- *(ushort *)(puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- *(byte *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- puVar4[6] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- *(byte *)(puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_features\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (*(ushort *)((char *)puVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (*(ushort *)(puVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (*(ushort *)(puVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
)
...>
}

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_rec)->object_id
|
- ((ushort *)_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)_rec)->object_id
|
- *(ushort *)_rec & 0x1ff
+ ((uw_object_hdr_t *)_rec)->object_id
|
- _rec[0] & 0x1ff
+ ((uw_object_hdr_t *)_rec)->object_id
|
- *_rec & 0x1ff
+ ((uw_object_hdr_t *)_rec)->object_id
)
...>
}

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*(ushort *)((char *)_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (((ushort *)_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (((ushort *)_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*(ushort *)_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*(ushort *)_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (_rec[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (_rec[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*(byte *)((char *)_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_rec)->flags_res
|
- (*(byte *)((char *)_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_rec)->flags_res
)
...>
}

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*(ushort *)((char *)_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (((ushort *)_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (((ushort *)_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*(ushort *)_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*(ushort *)_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (_rec[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (_rec[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*(byte *)((char *)_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_rec)->enchanted
|
- (*(byte *)((char *)_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_rec)->enchanted
)
...>
}

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*(ushort *)((char *)_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (((ushort *)_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (((ushort *)_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*(ushort *)_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*(ushort *)_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (_rec[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (_rec[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*(byte *)((char *)_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_rec)->doordir
|
- (*(byte *)((char *)_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_rec)->doordir
)
...>
}

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*(ushort *)((char *)_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (((ushort *)_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (((ushort *)_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*(ushort *)_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*(ushort *)_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (_rec[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (_rec[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*(byte *)((char *)_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_rec)->invisible
|
- (*(byte *)((char *)_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_rec)->invisible
)
...>
}

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*(ushort *)((char *)_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- *(ushort *)((char *)_rec + 0x0) >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (((ushort *)_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (((ushort *)_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- ((ushort *)_rec)[0] >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*(ushort *)_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*(ushort *)_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- *(ushort *)_rec >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (_rec[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (_rec[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- _rec[0] >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- *_rec >> 15
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*(byte *)((char *)_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- (*(byte *)((char *)_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_rec)->is_quant
|
- *(byte *)((char *)_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)_rec)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_rec)->zpos
|
- ((ushort *)_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)_rec)->zpos
|
- _rec[1] & 0x7f
+ ((uw_object_hdr_t *)_rec)->zpos
|
- *(byte *)((char *)_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_rec)->zpos
|
- (byte)_rec[1] & 0x7f
+ ((uw_object_hdr_t *)_rec)->zpos
)
...>
}

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_rec)->heading
|
- (*(ushort *)((char *)_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_rec)->heading
|
- (((ushort *)_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_rec)->heading
|
- (((ushort *)_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_rec)->heading
|
- (_rec[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_rec)->heading
|
- (_rec[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_rec)->heading
)
...>
}

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (*(ushort *)((char *)_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (((ushort *)_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (((ushort *)_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (_rec[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (_rec[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (*(byte *)((char *)_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_rec)->ypos
|
- (*(byte *)((char *)_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_rec)->ypos
)
...>
}

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (*(ushort *)((char *)_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_rec)->xpos
|
- *(ushort *)((char *)_rec + 0x2) >> 13
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (((ushort *)_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (((ushort *)_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_rec)->xpos
|
- ((ushort *)_rec)[1] >> 13
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (_rec[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (_rec[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_rec)->xpos
|
- _rec[1] >> 13
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (*(byte *)((char *)_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_rec)->xpos
|
- (*(byte *)((char *)_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_rec)->xpos
|
- *(byte *)((char *)_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)_rec)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_rec)->quality
|
- ((ushort *)_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)_rec)->quality
|
- _rec[2] & 0x3f
+ ((uw_object_hdr_t *)_rec)->quality
|
- *(byte *)((char *)_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_rec)->quality
|
- (byte)_rec[2] & 0x3f
+ ((uw_object_hdr_t *)_rec)->quality
)
...>
}

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_rec)->next
|
- (*(ushort *)((char *)_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_rec)->next
|
- *(ushort *)((char *)_rec + 0x4) >> 6
+ ((uw_object_hdr_t *)_rec)->next
|
- (((ushort *)_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_rec)->next
|
- (((ushort *)_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_rec)->next
|
- ((ushort *)_rec)[2] >> 6
+ ((uw_object_hdr_t *)_rec)->next
|
- (_rec[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_rec)->next
|
- (_rec[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_rec)->next
|
- _rec[2] >> 6
+ ((uw_object_hdr_t *)_rec)->next
)
...>
}

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_rec)->owner
|
- ((ushort *)_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)_rec)->owner
|
- _rec[3] & 0x3f
+ ((uw_object_hdr_t *)_rec)->owner
|
- *(byte *)((char *)_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_rec)->owner
|
- (byte)_rec[3] & 0x3f
+ ((uw_object_hdr_t *)_rec)->owner
)
...>
}

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_rec)->link
|
- (*(ushort *)((char *)_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_rec)->link
|
- *(ushort *)((char *)_rec + 0x6) >> 6
+ ((uw_object_hdr_t *)_rec)->link
|
- (((ushort *)_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_rec)->link
|
- (((ushort *)_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_rec)->link
|
- ((ushort *)_rec)[3] >> 6
+ ((uw_object_hdr_t *)_rec)->link
|
- (_rec[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_rec)->link
|
- (_rec[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_rec)->link
|
- _rec[3] >> 6
+ ((uw_object_hdr_t *)_rec)->link
)
...>
}

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)_item)->object_id
|
- ((ushort *)_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)_item)->object_id
|
- *(ushort *)_item & 0x1ff
+ ((uw_object_hdr_t *)_item)->object_id
|
- _item[0] & 0x1ff
+ ((uw_object_hdr_t *)_item)->object_id
|
- *_item & 0x1ff
+ ((uw_object_hdr_t *)_item)->object_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*(ushort *)((char *)_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (((ushort *)_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (((ushort *)_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*(ushort *)_item >> 9) & 0x7
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*(ushort *)_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (_item[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (_item[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*_item >> 9) & 0x7
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*(byte *)((char *)_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)_item)->flags_res
|
- (*(byte *)((char *)_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)_item)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*(ushort *)((char *)_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (((ushort *)_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (((ushort *)_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*(ushort *)_item >> 12) & 0x1
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*(ushort *)_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (_item[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (_item[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*_item >> 12) & 0x1
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*(byte *)((char *)_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)_item)->enchanted
|
- (*(byte *)((char *)_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)_item)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*(ushort *)((char *)_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)_item)->doordir
|
- (((ushort *)_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_item)->doordir
|
- (((ushort *)_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*(ushort *)_item >> 13) & 0x1
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*(ushort *)_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)_item)->doordir
|
- (_item[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)_item)->doordir
|
- (_item[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*_item >> 13) & 0x1
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*(byte *)((char *)_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)_item)->doordir
|
- (*(byte *)((char *)_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)_item)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*(ushort *)((char *)_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)_item)->invisible
|
- (((ushort *)_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_item)->invisible
|
- (((ushort *)_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*(ushort *)_item >> 14) & 0x1
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*(ushort *)_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)_item)->invisible
|
- (_item[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)_item)->invisible
|
- (_item[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*_item >> 14) & 0x1
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*(byte *)((char *)_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)_item)->invisible
|
- (*(byte *)((char *)_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)_item)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*(ushort *)((char *)_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- *(ushort *)((char *)_item + 0x0) >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (((ushort *)_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (((ushort *)_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- ((ushort *)_item)[0] >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*(ushort *)_item >> 15) & 0x1
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*(ushort *)_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- *(ushort *)_item >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (_item[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (_item[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- _item[0] >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*_item >> 15) & 0x1
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- *_item >> 15
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*(byte *)((char *)_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)_item)->is_quant
|
- (*(byte *)((char *)_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)_item)->is_quant
|
- *(byte *)((char *)_item + 0x1) >> 7
+ ((uw_object_hdr_t *)_item)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_item)->zpos
|
- ((ushort *)_item)[1] & 0x7f
+ ((uw_object_hdr_t *)_item)->zpos
|
- _item[1] & 0x7f
+ ((uw_object_hdr_t *)_item)->zpos
|
- *(byte *)((char *)_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)_item)->zpos
|
- (byte)_item[1] & 0x7f
+ ((uw_object_hdr_t *)_item)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)_item)->heading
|
- (*(ushort *)((char *)_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)_item)->heading
|
- (((ushort *)_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_item)->heading
|
- (((ushort *)_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_item)->heading
|
- (_item[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)_item)->heading
|
- (_item[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)_item)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)_item)->ypos
|
- (*(ushort *)((char *)_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_item)->ypos
|
- (((ushort *)_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_item)->ypos
|
- (((ushort *)_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_item)->ypos
|
- (_item[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)_item)->ypos
|
- (_item[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)_item)->ypos
|
- (*(byte *)((char *)_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)_item)->ypos
|
- (*(byte *)((char *)_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)_item)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)_item)->xpos
|
- (*(ushort *)((char *)_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)_item)->xpos
|
- *(ushort *)((char *)_item + 0x2) >> 13
+ ((uw_object_hdr_t *)_item)->xpos
|
- (((ushort *)_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_item)->xpos
|
- (((ushort *)_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_item)->xpos
|
- ((ushort *)_item)[1] >> 13
+ ((uw_object_hdr_t *)_item)->xpos
|
- (_item[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)_item)->xpos
|
- (_item[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)_item)->xpos
|
- _item[1] >> 13
+ ((uw_object_hdr_t *)_item)->xpos
|
- (*(byte *)((char *)_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)_item)->xpos
|
- (*(byte *)((char *)_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)_item)->xpos
|
- *(byte *)((char *)_item + 0x3) >> 5
+ ((uw_object_hdr_t *)_item)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_item)->quality
|
- ((ushort *)_item)[2] & 0x3f
+ ((uw_object_hdr_t *)_item)->quality
|
- _item[2] & 0x3f
+ ((uw_object_hdr_t *)_item)->quality
|
- *(byte *)((char *)_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)_item)->quality
|
- (byte)_item[2] & 0x3f
+ ((uw_object_hdr_t *)_item)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_item)->next
|
- (*(ushort *)((char *)_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_item)->next
|
- *(ushort *)((char *)_item + 0x4) >> 6
+ ((uw_object_hdr_t *)_item)->next
|
- (((ushort *)_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_item)->next
|
- (((ushort *)_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_item)->next
|
- ((ushort *)_item)[2] >> 6
+ ((uw_object_hdr_t *)_item)->next
|
- (_item[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_item)->next
|
- (_item[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_item)->next
|
- _item[2] >> 6
+ ((uw_object_hdr_t *)_item)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_item)->owner
|
- ((ushort *)_item)[3] & 0x3f
+ ((uw_object_hdr_t *)_item)->owner
|
- _item[3] & 0x3f
+ ((uw_object_hdr_t *)_item)->owner
|
- *(byte *)((char *)_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)_item)->owner
|
- (byte)_item[3] & 0x3f
+ ((uw_object_hdr_t *)_item)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_item)->link
|
- (*(ushort *)((char *)_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_item)->link
|
- *(ushort *)((char *)_item + 0x6) >> 6
+ ((uw_object_hdr_t *)_item)->link
|
- (((ushort *)_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_item)->link
|
- (((ushort *)_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_item)->link
|
- ((ushort *)_item)[3] >> 6
+ ((uw_object_hdr_t *)_item)->link
|
- (_item[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)_item)->link
|
- (_item[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)_item)->link
|
- _item[3] >> 6
+ ((uw_object_hdr_t *)_item)->link
)
...>
}

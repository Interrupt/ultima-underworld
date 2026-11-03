@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- ((ushort *)puVar9)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- *(ushort *)puVar9 & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- puVar9[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
|
- *puVar9 & 0x1ff
+ ((uw_object_hdr_t *)puVar9)->object_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (((ushort *)puVar9)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (((ushort *)puVar9)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)puVar9 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(ushort *)puVar9 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (puVar9[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (puVar9[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*puVar9 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*puVar9 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)((char *)puVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)((char *)puVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar9)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (((ushort *)puVar9)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (((ushort *)puVar9)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)puVar9 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(ushort *)puVar9 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (puVar9[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (puVar9[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*puVar9 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*puVar9 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)((char *)puVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar9)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (((ushort *)puVar9)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (((ushort *)puVar9)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)puVar9 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(ushort *)puVar9 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (puVar9[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (puVar9[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*puVar9 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*puVar9 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)((char *)puVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar9)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (((ushort *)puVar9)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (((ushort *)puVar9)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)puVar9 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(ushort *)puVar9 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (puVar9[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (puVar9[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*puVar9 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*puVar9 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)((char *)puVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar9)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)((char *)puVar9 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- *(ushort *)((char *)puVar9 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (((ushort *)puVar9)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (((ushort *)puVar9)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- ((ushort *)puVar9)[0] >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)puVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)puVar9 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- *(ushort *)puVar9 >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (puVar9[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (puVar9[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- puVar9[0] >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*puVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*puVar9 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- *puVar9 >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(byte *)((char *)puVar9 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- *(byte *)((char *)puVar9 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar9)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- ((ushort *)puVar9)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- puVar9[1] & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- *(byte *)((char *)puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
|
- (byte)puVar9[1] & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (*(ushort *)((char *)puVar9 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (((ushort *)puVar9)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (((ushort *)puVar9)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (puVar9[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar9)->heading
|
- (puVar9[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar9)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(ushort *)((char *)puVar9 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (((ushort *)puVar9)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (((ushort *)puVar9)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (puVar9[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (puVar9[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)((char *)puVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)((char *)puVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar9)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(ushort *)((char *)puVar9 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- *(ushort *)((char *)puVar9 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (((ushort *)puVar9)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (((ushort *)puVar9)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- ((ushort *)puVar9)[1] >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (puVar9[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (puVar9[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- puVar9[1] >> 13
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(byte *)((char *)puVar9 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (*(byte *)((char *)puVar9 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- *(byte *)((char *)puVar9 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar9)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- ((ushort *)puVar9)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- puVar9[2] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- *(byte *)((char *)puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
|
- (byte)puVar9[2] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (*(ushort *)((char *)puVar9 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- *(ushort *)((char *)puVar9 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- (((ushort *)puVar9)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (((ushort *)puVar9)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- ((ushort *)puVar9)[2] >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- (puVar9[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (puVar9[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
|
- puVar9[2] >> 6
+ ((uw_object_hdr_t *)puVar9)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- ((ushort *)puVar9)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- puVar9[3] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- *(byte *)((char *)puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
|
- (byte)puVar9[3] & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar9 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (*(ushort *)((char *)puVar9 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- *(ushort *)((char *)puVar9 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- (((ushort *)puVar9)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (((ushort *)puVar9)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- ((ushort *)puVar9)[3] >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- (puVar9[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (puVar9[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
|
- puVar9[3] >> 6
+ ((uw_object_hdr_t *)puVar9)->link
)
...>
}

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- ((ushort *)puVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- *(ushort *)puVar3 & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (((ushort *)puVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (((ushort *)puVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)puVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(ushort *)puVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(byte *)((char *)puVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*(byte *)((char *)puVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar3)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (((ushort *)puVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (((ushort *)puVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)puVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(ushort *)puVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(byte *)((char *)puVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar3)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (((ushort *)puVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (((ushort *)puVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)puVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(ushort *)puVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(byte *)((char *)puVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar3)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (((ushort *)puVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (((ushort *)puVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)puVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(ushort *)puVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(byte *)((char *)puVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar3)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)((char *)puVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(byte *)((char *)puVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(byte *)((char *)puVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(byte *)((char *)puVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar3)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- ((ushort *)puVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- *(byte *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (((ushort *)puVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (((ushort *)puVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (((ushort *)puVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (((ushort *)puVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(byte *)((char *)puVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (*(byte *)((char *)puVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar3)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(ushort *)((char *)puVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(byte *)((char *)puVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (*(byte *)((char *)puVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- *(byte *)((char *)puVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar3)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- ((ushort *)puVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- *(byte *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (*(ushort *)((char *)puVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- ((ushort *)puVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- *(byte *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (*(ushort *)((char *)puVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
)
...>
}

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
)
...>
}

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar4)->flags_res
)
...>
}

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar4)->enchanted
)
...>
}

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar4)->doordir
)
...>
}

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar4)->invisible
)
...>
}

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(byte *)((char *)puVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar4)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- *(byte *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
)
...>
}

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
)
...>
}

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar4)->ypos
)
...>
}

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- (*(byte *)((char *)puVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- *(byte *)((char *)puVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar4)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- *(byte *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
)
...>
}

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
)
...>
}

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
- *(byte *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
)
...>
}

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
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
)
...>
}

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
|
- ((ushort *)puVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
|
- *(ushort *)puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar7)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar7)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar7)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar7)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(byte *)((char *)puVar7 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- ((ushort *)puVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- *(byte *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar7)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- *(byte *)((char *)puVar7 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- ((ushort *)puVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- *(byte *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (*(ushort *)((char *)puVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- ((ushort *)puVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- *(byte *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (*(ushort *)((char *)puVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
)
...>
}

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)link_cursor)->object_id
|
- ((ushort *)link_cursor)[0] & 0x1ff
+ ((uw_object_hdr_t *)link_cursor)->object_id
|
- *(ushort *)link_cursor & 0x1ff
+ ((uw_object_hdr_t *)link_cursor)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (*(ushort *)((char *)link_cursor + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (((ushort *)link_cursor)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (((ushort *)link_cursor)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (*(ushort *)link_cursor >> 9) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (*(ushort *)link_cursor & 0xe00) >> 9
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (*(byte *)((char *)link_cursor + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->flags_res
|
- (*(byte *)((char *)link_cursor + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)link_cursor)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (*(ushort *)((char *)link_cursor + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (((ushort *)link_cursor)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (((ushort *)link_cursor)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (*(ushort *)link_cursor >> 12) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (*(ushort *)link_cursor & 0x1000) >> 12
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (*(byte *)((char *)link_cursor + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->enchanted
|
- (*(byte *)((char *)link_cursor + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)link_cursor)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (*(ushort *)((char *)link_cursor + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (((ushort *)link_cursor)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (((ushort *)link_cursor)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (*(ushort *)link_cursor >> 13) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (*(ushort *)link_cursor & 0x2000) >> 13
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (*(byte *)((char *)link_cursor + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->doordir
|
- (*(byte *)((char *)link_cursor + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)link_cursor)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (*(ushort *)((char *)link_cursor + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (((ushort *)link_cursor)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (((ushort *)link_cursor)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (*(ushort *)link_cursor >> 14) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (*(ushort *)link_cursor & 0x4000) >> 14
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (*(byte *)((char *)link_cursor + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->invisible
|
- (*(byte *)((char *)link_cursor + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)link_cursor)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (*(ushort *)((char *)link_cursor + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (((ushort *)link_cursor)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (((ushort *)link_cursor)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (*(ushort *)link_cursor >> 15) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (*(ushort *)link_cursor & 0x8000) >> 15
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (*(byte *)((char *)link_cursor + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- (*(byte *)((char *)link_cursor + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)link_cursor)->is_quant
|
- *(byte *)((char *)link_cursor + 0x1) >> 7
+ ((uw_object_hdr_t *)link_cursor)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 0x2) & 0x7f
+ ((uw_object_hdr_t *)link_cursor)->zpos
|
- ((ushort *)link_cursor)[1] & 0x7f
+ ((uw_object_hdr_t *)link_cursor)->zpos
|
- *(byte *)((char *)link_cursor + 0x2) & 0x7f
+ ((uw_object_hdr_t *)link_cursor)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->heading
|
- (*(ushort *)((char *)link_cursor + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)link_cursor)->heading
|
- (((ushort *)link_cursor)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->heading
|
- (((ushort *)link_cursor)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)link_cursor)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->ypos
|
- (*(ushort *)((char *)link_cursor + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)link_cursor)->ypos
|
- (((ushort *)link_cursor)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->ypos
|
- (((ushort *)link_cursor)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)link_cursor)->ypos
|
- (*(byte *)((char *)link_cursor + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->ypos
|
- (*(byte *)((char *)link_cursor + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)link_cursor)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->xpos
|
- (*(ushort *)((char *)link_cursor + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)link_cursor)->xpos
|
- (((ushort *)link_cursor)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->xpos
|
- (((ushort *)link_cursor)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)link_cursor)->xpos
|
- (*(byte *)((char *)link_cursor + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)link_cursor)->xpos
|
- (*(byte *)((char *)link_cursor + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)link_cursor)->xpos
|
- *(byte *)((char *)link_cursor + 0x3) >> 5
+ ((uw_object_hdr_t *)link_cursor)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 0x4) & 0x3f
+ ((uw_object_hdr_t *)link_cursor)->quality
|
- ((ushort *)link_cursor)[2] & 0x3f
+ ((uw_object_hdr_t *)link_cursor)->quality
|
- *(byte *)((char *)link_cursor + 0x4) & 0x3f
+ ((uw_object_hdr_t *)link_cursor)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)link_cursor)->next
|
- (*(ushort *)((char *)link_cursor + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)link_cursor)->next
|
- (((ushort *)link_cursor)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)link_cursor)->next
|
- (((ushort *)link_cursor)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)link_cursor)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 0x6) & 0x3f
+ ((uw_object_hdr_t *)link_cursor)->owner
|
- ((ushort *)link_cursor)[3] & 0x3f
+ ((uw_object_hdr_t *)link_cursor)->owner
|
- *(byte *)((char *)link_cursor + 0x6) & 0x3f
+ ((uw_object_hdr_t *)link_cursor)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)link_cursor + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)link_cursor)->link
|
- (*(ushort *)((char *)link_cursor + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)link_cursor)->link
|
- (((ushort *)link_cursor)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)link_cursor)->link
|
- (((ushort *)link_cursor)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)link_cursor)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- ((ushort *)iVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- *(ushort *)iVar3 & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- *(ushort *)(iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
)
...>
}

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)(iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)(iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)(iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)(iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
)
...>
}

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)(iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)(iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)(iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)(iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
)
...>
}

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)(iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)(iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)(iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)(iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
)
...>
}

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)(iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)(iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)(iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)(iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
)
...>
}

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)(iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)(iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- *(byte *)((char *)iVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)(iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)(iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- *(byte *)(iVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
)
...>
}

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- ((ushort *)iVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(ushort *)(iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)(iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
)
...>
}

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)(iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)(iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
)
...>
}

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)(iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)(iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)(iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)(iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
)
...>
}

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)(iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)(iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- *(byte *)((char *)iVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)(iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)(iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- *(byte *)(iVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
)
...>
}

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- ((ushort *)iVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(ushort *)(iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)(iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
)
...>
}

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)((char *)iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)(iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)(iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
)
...>
}

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- ((ushort *)iVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(ushort *)(iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)(iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
)
...>
}

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)((char *)iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)(iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)(iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
)
...>
}

@field_6_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- ((ushort *)uVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- *(ushort *)uVar1 & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- *(ushort *)(uVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (((ushort *)uVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (((ushort *)uVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)uVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)uVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)(uVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)(uVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)((char *)uVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)((char *)uVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)(uVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)(uVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar1)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (((ushort *)uVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (((ushort *)uVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)uVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)uVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)(uVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)(uVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)((char *)uVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)(uVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)(uVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar1)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (((ushort *)uVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (((ushort *)uVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)uVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)uVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)(uVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)(uVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)((char *)uVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)(uVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)(uVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar1)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (((ushort *)uVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (((ushort *)uVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)uVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)uVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)(uVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)(uVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)((char *)uVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)(uVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)(uVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar1)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (((ushort *)uVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (((ushort *)uVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)uVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)uVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)(uVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)(uVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)((char *)uVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(byte *)((char *)uVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)(uVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)(uVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(byte *)(uVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
)
...>
}

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- ((ushort *)uVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(ushort *)(uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(byte *)((char *)uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(byte *)(uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (((ushort *)uVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (((ushort *)uVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)(uVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)(uVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (((ushort *)uVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (((ushort *)uVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)(uVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)(uVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)((char *)uVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)((char *)uVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)(uVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)(uVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar1)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (((ushort *)uVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (((ushort *)uVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)(uVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)(uVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)((char *)uVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)((char *)uVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- *(byte *)((char *)uVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)(uVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)(uVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- *(byte *)(uVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
)
...>
}

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- ((ushort *)uVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(ushort *)(uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(byte *)((char *)uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(byte *)(uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)((char *)uVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- (((ushort *)uVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (((ushort *)uVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)(uVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)(uVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- ((ushort *)uVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(ushort *)(uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(byte *)((char *)uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(byte *)(uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)((char *)uVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- (((ushort *)uVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (((ushort *)uVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)(uVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)(uVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
)
...>
}

@field_7_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->object_id
|
- ((ushort *)iVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->object_id
|
- *(ushort *)iVar6 & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->object_id
|
- iVar6[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->object_id
|
- *iVar6 & 0x1ff
+ ((uw_object_hdr_t *)iVar6)->object_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (((ushort *)iVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (((ushort *)iVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)iVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(ushort *)iVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (iVar6[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (iVar6[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*iVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*iVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(byte *)((char *)iVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(byte *)((char *)iVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar6)->flags_res
)
...>
}

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (((ushort *)iVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (((ushort *)iVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)iVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(ushort *)iVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (iVar6[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (iVar6[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*iVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*iVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(byte *)((char *)iVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar6)->enchanted
)
...>
}

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (((ushort *)iVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (((ushort *)iVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)iVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(ushort *)iVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (iVar6[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (iVar6[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*iVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*iVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(byte *)((char *)iVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar6)->doordir
)
...>
}

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (((ushort *)iVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (((ushort *)iVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)iVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(ushort *)iVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (iVar6[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (iVar6[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*iVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*iVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(byte *)((char *)iVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar6)->invisible
)
...>
}

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)((char *)iVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- *(ushort *)((char *)iVar6 + 0x0) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (((ushort *)iVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (((ushort *)iVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- ((ushort *)iVar6)[0] >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)iVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)iVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- *(ushort *)iVar6 >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (iVar6[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (iVar6[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- iVar6[0] >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*iVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*iVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- *iVar6 >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(byte *)((char *)iVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- *(byte *)((char *)iVar6 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar6)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- ((ushort *)iVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- iVar6[1] & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- *(byte *)((char *)iVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
|
- (byte)iVar6[1] & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
)
...>
}

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (*(ushort *)((char *)iVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (((ushort *)iVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (((ushort *)iVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (iVar6[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6)->heading
|
- (iVar6[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6)->heading
)
...>
}

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(ushort *)((char *)iVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (((ushort *)iVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (((ushort *)iVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (iVar6[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (iVar6[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(byte *)((char *)iVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(byte *)((char *)iVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar6)->ypos
)
...>
}

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(ushort *)((char *)iVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- *(ushort *)((char *)iVar6 + 0x2) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (((ushort *)iVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (((ushort *)iVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- ((ushort *)iVar6)[1] >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (iVar6[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (iVar6[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- iVar6[1] >> 13
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(byte *)((char *)iVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (*(byte *)((char *)iVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- *(byte *)((char *)iVar6 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar6)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- ((ushort *)iVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- iVar6[2] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- *(byte *)((char *)iVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
|
- (byte)iVar6[2] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
)
...>
}

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (*(ushort *)((char *)iVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- *(ushort *)((char *)iVar6 + 0x4) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- (((ushort *)iVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (((ushort *)iVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- ((ushort *)iVar6)[2] >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- (iVar6[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (iVar6[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
|
- iVar6[2] >> 6
+ ((uw_object_hdr_t *)iVar6)->next
)
...>
}

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- ((ushort *)iVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- iVar6[3] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- *(byte *)((char *)iVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
|
- (byte)iVar6[3] & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
)
...>
}

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (*(ushort *)((char *)iVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- *(ushort *)((char *)iVar6 + 0x6) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- (((ushort *)iVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (((ushort *)iVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- ((ushort *)iVar6)[3] >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- (iVar6[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (iVar6[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
|
- iVar6[3] >> 6
+ ((uw_object_hdr_t *)iVar6)->link
)
...>
}

@field_8_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar11_rec)->object_id
|
- ((ushort *)puVar11_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar11_rec)->object_id
|
- *(ushort *)puVar11_rec & 0x1ff
+ ((uw_object_hdr_t *)puVar11_rec)->object_id
)
...>
}

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (*(ushort *)((char *)puVar11_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (((ushort *)puVar11_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (((ushort *)puVar11_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (*(ushort *)puVar11_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (*(ushort *)puVar11_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (*(byte *)((char *)puVar11_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
|
- (*(byte *)((char *)puVar11_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar11_rec)->flags_res
)
...>
}

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (*(ushort *)((char *)puVar11_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (((ushort *)puVar11_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (((ushort *)puVar11_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (*(ushort *)puVar11_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (*(ushort *)puVar11_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (*(byte *)((char *)puVar11_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
|
- (*(byte *)((char *)puVar11_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar11_rec)->enchanted
)
...>
}

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (*(ushort *)((char *)puVar11_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (((ushort *)puVar11_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (((ushort *)puVar11_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (*(ushort *)puVar11_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (*(ushort *)puVar11_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (*(byte *)((char *)puVar11_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
|
- (*(byte *)((char *)puVar11_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar11_rec)->doordir
)
...>
}

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (*(ushort *)((char *)puVar11_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (((ushort *)puVar11_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (((ushort *)puVar11_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (*(ushort *)puVar11_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (*(ushort *)puVar11_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (*(byte *)((char *)puVar11_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
|
- (*(byte *)((char *)puVar11_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar11_rec)->invisible
)
...>
}

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (*(ushort *)((char *)puVar11_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (((ushort *)puVar11_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (((ushort *)puVar11_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (*(ushort *)puVar11_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (*(ushort *)puVar11_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (*(byte *)((char *)puVar11_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- (*(byte *)((char *)puVar11_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
|
- *(byte *)((char *)puVar11_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar11_rec)->is_quant
)
...>
}

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar11_rec)->zpos
|
- ((ushort *)puVar11_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar11_rec)->zpos
|
- *(byte *)((char *)puVar11_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar11_rec)->zpos
)
...>
}

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->heading
|
- (*(ushort *)((char *)puVar11_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11_rec)->heading
|
- (((ushort *)puVar11_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->heading
|
- (((ushort *)puVar11_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11_rec)->heading
)
...>
}

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->ypos
|
- (*(ushort *)((char *)puVar11_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11_rec)->ypos
|
- (((ushort *)puVar11_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->ypos
|
- (((ushort *)puVar11_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11_rec)->ypos
|
- (*(byte *)((char *)puVar11_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->ypos
|
- (*(byte *)((char *)puVar11_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar11_rec)->ypos
)
...>
}

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
|
- (*(ushort *)((char *)puVar11_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
|
- (((ushort *)puVar11_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
|
- (((ushort *)puVar11_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
|
- (*(byte *)((char *)puVar11_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
|
- (*(byte *)((char *)puVar11_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
|
- *(byte *)((char *)puVar11_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar11_rec)->xpos
)
...>
}

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar11_rec)->quality
|
- ((ushort *)puVar11_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar11_rec)->quality
|
- *(byte *)((char *)puVar11_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar11_rec)->quality
)
...>
}

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11_rec)->next
|
- (*(ushort *)((char *)puVar11_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11_rec)->next
|
- (((ushort *)puVar11_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11_rec)->next
|
- (((ushort *)puVar11_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11_rec)->next
)
...>
}

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar11_rec)->owner
|
- ((ushort *)puVar11_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar11_rec)->owner
|
- *(byte *)((char *)puVar11_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar11_rec)->owner
)
...>
}

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11_rec)->link
|
- (*(ushort *)((char *)puVar11_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11_rec)->link
|
- (((ushort *)puVar11_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11_rec)->link
|
- (((ushort *)puVar11_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11_rec)->link
)
...>
}

@field_9_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- ((ushort *)iVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- *(ushort *)iVar5 & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
)
...>
}

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (((ushort *)iVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (((ushort *)iVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)iVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)iVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(byte *)((char *)iVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(byte *)((char *)iVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar5)->flags_res
)
...>
}

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (((ushort *)iVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (((ushort *)iVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)iVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)iVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(byte *)((char *)iVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar5)->enchanted
)
...>
}

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (((ushort *)iVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (((ushort *)iVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)iVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)iVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(byte *)((char *)iVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar5)->doordir
)
...>
}

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (((ushort *)iVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (((ushort *)iVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)iVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)iVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(byte *)((char *)iVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar5)->invisible
)
...>
}

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (((ushort *)iVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (((ushort *)iVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)iVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)iVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(byte *)((char *)iVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- *(byte *)((char *)iVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar5)->is_quant
)
...>
}

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- ((ushort *)iVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- *(byte *)((char *)iVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
)
...>
}

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (*(ushort *)((char *)iVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (((ushort *)iVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (((ushort *)iVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5)->heading
)
...>
}

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(ushort *)((char *)iVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (((ushort *)iVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (((ushort *)iVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(byte *)((char *)iVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(byte *)((char *)iVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar5)->ypos
)
...>
}

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(ushort *)((char *)iVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (((ushort *)iVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (((ushort *)iVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(byte *)((char *)iVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(byte *)((char *)iVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- *(byte *)((char *)iVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar5)->xpos
)
...>
}

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- ((ushort *)iVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- *(byte *)((char *)iVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
)
...>
}

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->next
|
- (*(ushort *)((char *)iVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->next
|
- (((ushort *)iVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->next
|
- (((ushort *)iVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->next
)
...>
}

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- ((ushort *)iVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- *(byte *)((char *)iVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
)
...>
}

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->link
|
- (*(ushort *)((char *)iVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->link
|
- (((ushort *)iVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->link
|
- (((ushort *)iVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->link
)
...>
}

@field_10_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- ((ushort *)iVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
|
- *(ushort *)iVar3 & 0x1ff
+ ((uw_object_hdr_t *)iVar3)->object_id
)
...>
}

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (((ushort *)iVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(ushort *)iVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar3)->flags_res
|
- (*(byte *)((char *)iVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar3)->flags_res
)
...>
}

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (((ushort *)iVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(ushort *)iVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar3)->enchanted
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar3)->enchanted
)
...>
}

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (((ushort *)iVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(ushort *)iVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar3)->doordir
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar3)->doordir
)
...>
}

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (((ushort *)iVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(ushort *)iVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar3)->invisible
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar3)->invisible
)
...>
}

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)((char *)iVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (((ushort *)iVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(ushort *)iVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- (*(byte *)((char *)iVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
|
- *(byte *)((char *)iVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar3)->is_quant
)
...>
}

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- ((ushort *)iVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
|
- *(byte *)((char *)iVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar3)->zpos
)
...>
}

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar3)->heading
|
- (((ushort *)iVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar3)->heading
)
...>
}

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (((ushort *)iVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar3)->ypos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar3)->ypos
)
...>
}

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(ushort *)((char *)iVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (((ushort *)iVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- (*(byte *)((char *)iVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
|
- *(byte *)((char *)iVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar3)->xpos
)
...>
}

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- ((ushort *)iVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
|
- *(byte *)((char *)iVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->quality
)
...>
}

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (*(ushort *)((char *)iVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->next
|
- (((ushort *)iVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->next
)
...>
}

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- ((ushort *)iVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
|
- *(byte *)((char *)iVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar3)->owner
)
...>
}

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (*(ushort *)((char *)iVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar3)->link
|
- (((ushort *)iVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar3)->link
)
...>
}

@field_11_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)item_rec)->object_id
|
- ((ushort *)item_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)item_rec)->object_id
|
- *(ushort *)item_rec & 0x1ff
+ ((uw_object_hdr_t *)item_rec)->object_id
|
- *(ushort *)(item_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)item_rec)->object_id
|
- CONCAT11(item_rec[1], *item_rec) & 0x1ff
+ ((uw_object_hdr_t *)item_rec)->object_id
|
- CONCAT11(item_rec[1], item_rec[0]) & 0x1ff
+ ((uw_object_hdr_t *)item_rec)->object_id
)
...>
}

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(ushort *)((char *)item_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (((ushort *)item_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (((ushort *)item_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(ushort *)item_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(ushort *)item_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(ushort *)(item_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(ushort *)(item_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (CONCAT11(item_rec[1], *item_rec) >> 9) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (CONCAT11(item_rec[1], *item_rec) & 0xe00) >> 9
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (CONCAT11(item_rec[1], item_rec[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (CONCAT11(item_rec[1], item_rec[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(byte *)((char *)item_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(byte *)((char *)item_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(byte *)(item_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)item_rec)->flags_res
|
- (*(byte *)(item_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)item_rec)->flags_res
)
...>
}

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(ushort *)((char *)item_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (((ushort *)item_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (((ushort *)item_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(ushort *)item_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(ushort *)item_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(ushort *)(item_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(ushort *)(item_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (CONCAT11(item_rec[1], *item_rec) >> 12) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (CONCAT11(item_rec[1], *item_rec) & 0x1000) >> 12
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (CONCAT11(item_rec[1], item_rec[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (CONCAT11(item_rec[1], item_rec[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(byte *)((char *)item_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(byte *)((char *)item_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(byte *)(item_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)item_rec)->enchanted
|
- (*(byte *)(item_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)item_rec)->enchanted
)
...>
}

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(ushort *)((char *)item_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (((ushort *)item_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (((ushort *)item_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(ushort *)item_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(ushort *)item_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(ushort *)(item_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(ushort *)(item_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (CONCAT11(item_rec[1], *item_rec) >> 13) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (CONCAT11(item_rec[1], *item_rec) & 0x2000) >> 13
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (CONCAT11(item_rec[1], item_rec[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (CONCAT11(item_rec[1], item_rec[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(byte *)((char *)item_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(byte *)((char *)item_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(byte *)(item_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)item_rec)->doordir
|
- (*(byte *)(item_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)item_rec)->doordir
)
...>
}

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(ushort *)((char *)item_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (((ushort *)item_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (((ushort *)item_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(ushort *)item_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(ushort *)item_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(ushort *)(item_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(ushort *)(item_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (CONCAT11(item_rec[1], *item_rec) >> 14) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (CONCAT11(item_rec[1], *item_rec) & 0x4000) >> 14
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (CONCAT11(item_rec[1], item_rec[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (CONCAT11(item_rec[1], item_rec[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(byte *)((char *)item_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(byte *)((char *)item_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(byte *)(item_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)item_rec)->invisible
|
- (*(byte *)(item_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)item_rec)->invisible
)
...>
}

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(ushort *)((char *)item_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (((ushort *)item_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (((ushort *)item_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(ushort *)item_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(ushort *)item_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(ushort *)(item_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(ushort *)(item_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (CONCAT11(item_rec[1], *item_rec) >> 15) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (CONCAT11(item_rec[1], *item_rec) & 0x8000) >> 15
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (CONCAT11(item_rec[1], item_rec[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (CONCAT11(item_rec[1], item_rec[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(byte *)((char *)item_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(byte *)((char *)item_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- *(byte *)((char *)item_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(byte *)(item_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- (*(byte *)(item_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)item_rec)->is_quant
|
- *(byte *)(item_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)item_rec)->is_quant
)
...>
}

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)item_rec)->zpos
|
- ((ushort *)item_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)item_rec)->zpos
|
- *(ushort *)(item_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)item_rec)->zpos
|
- *(byte *)((char *)item_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)item_rec)->zpos
|
- item_rec[2] & 0x7f
+ ((uw_object_hdr_t *)item_rec)->zpos
|
- *(byte *)(item_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)item_rec)->zpos
)
...>
}

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)item_rec)->heading
|
- (*(ushort *)((char *)item_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)item_rec)->heading
|
- (((ushort *)item_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)item_rec)->heading
|
- (((ushort *)item_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)item_rec)->heading
|
- (*(ushort *)(item_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)item_rec)->heading
|
- (*(ushort *)(item_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)item_rec)->heading
)
...>
}

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(ushort *)((char *)item_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (((ushort *)item_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (((ushort *)item_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(ushort *)(item_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(ushort *)(item_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(byte *)((char *)item_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(byte *)((char *)item_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(byte *)(item_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)item_rec)->ypos
|
- (*(byte *)(item_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)item_rec)->ypos
)
...>
}

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(ushort *)((char *)item_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (((ushort *)item_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (((ushort *)item_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(ushort *)(item_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(ushort *)(item_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(byte *)((char *)item_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(byte *)((char *)item_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- *(byte *)((char *)item_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(byte *)(item_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- (*(byte *)(item_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)item_rec)->xpos
|
- *(byte *)(item_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)item_rec)->xpos
)
...>
}

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->quality
|
- ((ushort *)item_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)item_rec)->quality
|
- *(ushort *)(item_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->quality
|
- *(byte *)((char *)item_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->quality
|
- item_rec[4] & 0x3f
+ ((uw_object_hdr_t *)item_rec)->quality
|
- *(byte *)(item_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->quality
)
...>
}

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)item_rec)->next
|
- (*(ushort *)((char *)item_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)item_rec)->next
|
- (((ushort *)item_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)item_rec)->next
|
- (((ushort *)item_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)item_rec)->next
|
- (*(ushort *)(item_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)item_rec)->next
|
- (*(ushort *)(item_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)item_rec)->next
)
...>
}

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->owner
|
- ((ushort *)item_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)item_rec)->owner
|
- *(ushort *)(item_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->owner
|
- *(byte *)((char *)item_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->owner
|
- item_rec[6] & 0x3f
+ ((uw_object_hdr_t *)item_rec)->owner
|
- *(byte *)(item_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)item_rec)->owner
)
...>
}

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)item_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)item_rec)->link
|
- (*(ushort *)((char *)item_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)item_rec)->link
|
- (((ushort *)item_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)item_rec)->link
|
- (((ushort *)item_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)item_rec)->link
|
- (*(ushort *)(item_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)item_rec)->link
|
- (*(ushort *)(item_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)item_rec)->link
)
...>
}

@field_12_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- ((ushort *)iVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- *(ushort *)iVar5 & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- *(ushort *)(iVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- CONCAT11(iVar5[1], *iVar5) & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
|
- CONCAT11(iVar5[1], iVar5[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar5)->object_id
)
...>
}

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (((ushort *)iVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (((ushort *)iVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)iVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)iVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)(iVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(ushort *)(iVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (CONCAT11(iVar5[1], *iVar5) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (CONCAT11(iVar5[1], *iVar5) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (CONCAT11(iVar5[1], iVar5[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (CONCAT11(iVar5[1], iVar5[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(byte *)((char *)iVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(byte *)((char *)iVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(byte *)(iVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar5)->flags_res
|
- (*(byte *)(iVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar5)->flags_res
)
...>
}

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (((ushort *)iVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (((ushort *)iVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)iVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)iVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)(iVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(ushort *)(iVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (CONCAT11(iVar5[1], *iVar5) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (CONCAT11(iVar5[1], *iVar5) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (CONCAT11(iVar5[1], iVar5[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (CONCAT11(iVar5[1], iVar5[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(byte *)((char *)iVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(byte *)(iVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar5)->enchanted
|
- (*(byte *)(iVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar5)->enchanted
)
...>
}

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (((ushort *)iVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (((ushort *)iVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)iVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)iVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)(iVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(ushort *)(iVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (CONCAT11(iVar5[1], *iVar5) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (CONCAT11(iVar5[1], *iVar5) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (CONCAT11(iVar5[1], iVar5[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (CONCAT11(iVar5[1], iVar5[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(byte *)((char *)iVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(byte *)(iVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar5)->doordir
|
- (*(byte *)(iVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar5)->doordir
)
...>
}

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (((ushort *)iVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (((ushort *)iVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)iVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)iVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)(iVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(ushort *)(iVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (CONCAT11(iVar5[1], *iVar5) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (CONCAT11(iVar5[1], *iVar5) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (CONCAT11(iVar5[1], iVar5[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (CONCAT11(iVar5[1], iVar5[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(byte *)((char *)iVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(byte *)(iVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar5)->invisible
|
- (*(byte *)(iVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar5)->invisible
)
...>
}

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)((char *)iVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (((ushort *)iVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (((ushort *)iVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)iVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)iVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)(iVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(ushort *)(iVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (CONCAT11(iVar5[1], *iVar5) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (CONCAT11(iVar5[1], *iVar5) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (CONCAT11(iVar5[1], iVar5[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (CONCAT11(iVar5[1], iVar5[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(byte *)((char *)iVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(byte *)((char *)iVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- *(byte *)((char *)iVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(byte *)(iVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- (*(byte *)(iVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar5)->is_quant
|
- *(byte *)(iVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar5)->is_quant
)
...>
}

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- ((ushort *)iVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- *(ushort *)(iVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- *(byte *)((char *)iVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- iVar5[2] & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
|
- *(byte *)(iVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5)->zpos
)
...>
}

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (*(ushort *)((char *)iVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (((ushort *)iVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (((ushort *)iVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (*(ushort *)(iVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5)->heading
|
- (*(ushort *)(iVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5)->heading
)
...>
}

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(ushort *)((char *)iVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (((ushort *)iVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (((ushort *)iVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(ushort *)(iVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(ushort *)(iVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(byte *)((char *)iVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(byte *)((char *)iVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(byte *)(iVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar5)->ypos
|
- (*(byte *)(iVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar5)->ypos
)
...>
}

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(ushort *)((char *)iVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (((ushort *)iVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (((ushort *)iVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(ushort *)(iVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(ushort *)(iVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(byte *)((char *)iVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(byte *)((char *)iVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- *(byte *)((char *)iVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(byte *)(iVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- (*(byte *)(iVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar5)->xpos
|
- *(byte *)(iVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar5)->xpos
)
...>
}

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- ((ushort *)iVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- *(ushort *)(iVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- *(byte *)((char *)iVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- iVar5[4] & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
|
- *(byte *)(iVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->quality
)
...>
}

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->next
|
- (*(ushort *)((char *)iVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->next
|
- (((ushort *)iVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->next
|
- (((ushort *)iVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->next
|
- (*(ushort *)(iVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->next
|
- (*(ushort *)(iVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->next
)
...>
}

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- ((ushort *)iVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- *(ushort *)(iVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- *(byte *)((char *)iVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- iVar5[6] & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
|
- *(byte *)(iVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5)->owner
)
...>
}

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->link
|
- (*(ushort *)((char *)iVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->link
|
- (((ushort *)iVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->link
|
- (((ushort *)iVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->link
|
- (*(ushort *)(iVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5)->link
|
- (*(ushort *)(iVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5)->link
)
...>
}

@field_13_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- ((ushort *)iVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- *(ushort *)iVar2 & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
)
...>
}

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (((ushort *)iVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (((ushort *)iVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)iVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)iVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2)->flags_res
)
...>
}

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (((ushort *)iVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (((ushort *)iVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)iVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)iVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2)->enchanted
)
...>
}

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (((ushort *)iVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (((ushort *)iVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)iVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)iVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2)->doordir
)
...>
}

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (((ushort *)iVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (((ushort *)iVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)iVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)iVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2)->invisible
)
...>
}

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)((char *)iVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (((ushort *)iVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)iVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)((char *)iVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *(byte *)((char *)iVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
)
...>
}

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- ((ushort *)iVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
)
...>
}

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (((ushort *)iVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (((ushort *)iVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
)
...>
}

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (((ushort *)iVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (((ushort *)iVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2)->ypos
)
...>
}

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(ushort *)((char *)iVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (((ushort *)iVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- *(byte *)((char *)iVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
)
...>
}

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- ((ushort *)iVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
)
...>
}

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (*(ushort *)((char *)iVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (((ushort *)iVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
)
...>
}

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- ((ushort *)iVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
)
...>
}

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (*(ushort *)((char *)iVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (((ushort *)iVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
)
...>
}

@field_14_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->object_id
|
- ((ushort *)iVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->object_id
|
- *(ushort *)iVar1 & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->object_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (((ushort *)iVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (((ushort *)iVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)iVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)iVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar1)->flags_res
)
...>
}

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (((ushort *)iVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (((ushort *)iVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)iVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)iVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar1)->enchanted
)
...>
}

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (((ushort *)iVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (((ushort *)iVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)iVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)iVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar1)->doordir
)
...>
}

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (((ushort *)iVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (((ushort *)iVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)iVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)iVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar1)->invisible
)
...>
}

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)((char *)iVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (((ushort *)iVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (((ushort *)iVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)iVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)iVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)((char *)iVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- *(byte *)((char *)iVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
)
...>
}

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- ((ushort *)iVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(byte *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
)
...>
}

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (((ushort *)iVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (((ushort *)iVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
)
...>
}

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (((ushort *)iVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (((ushort *)iVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar1)->ypos
)
...>
}

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)((char *)iVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (((ushort *)iVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (((ushort *)iVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- *(byte *)((char *)iVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
)
...>
}

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- ((ushort *)iVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(byte *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
)
...>
}

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)((char *)iVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
|
- (((ushort *)iVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (((ushort *)iVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
)
...>
}

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- ((ushort *)iVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(byte *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
)
...>
}

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)((char *)iVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
|
- (((ushort *)iVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (((ushort *)iVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
)
...>
}

@field_15_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
|
- ((ushort *)iVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
|
- *(ushort *)iVar4 & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (((ushort *)iVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)iVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (((ushort *)iVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)iVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (((ushort *)iVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)iVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (((ushort *)iVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)iVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)((char *)iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(byte *)((char *)iVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- ((ushort *)iVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (((ushort *)iVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (((ushort *)iVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)((char *)iVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- *(byte *)((char *)iVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- ((ushort *)iVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)((char *)iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- ((ushort *)iVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)((char *)iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
)
...>
}

@field_16_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- ((ushort *)puVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- *(ushort *)puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- puVar6[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
|
- *puVar6 & 0x1ff
+ ((uw_object_hdr_t *)puVar6)->object_id
)
...>
}

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (((ushort *)puVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(ushort *)puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (puVar6[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (puVar6[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*puVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*puVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar6)->flags_res
)
...>
}

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (((ushort *)puVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(ushort *)puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (puVar6[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (puVar6[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*puVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*puVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar6)->enchanted
)
...>
}

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (((ushort *)puVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(ushort *)puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (puVar6[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (puVar6[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*puVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*puVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar6)->doordir
)
...>
}

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (((ushort *)puVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(ushort *)puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (puVar6[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (puVar6[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*puVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*puVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar6)->invisible
)
...>
}

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)((char *)puVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(ushort *)((char *)puVar6 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- ((ushort *)puVar6)[0] >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(ushort *)puVar6 >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (puVar6[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (puVar6[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- puVar6[0] >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*puVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *puVar6 >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- *(byte *)((char *)puVar6 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar6)->is_quant
)
...>
}

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- ((ushort *)puVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- puVar6[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- *(byte *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
|
- (byte)puVar6[1] & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
)
...>
}

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (((ushort *)puVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (puVar6[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar6)->heading
|
- (puVar6[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar6)->heading
)
...>
}

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (((ushort *)puVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (puVar6[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (puVar6[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar6)->ypos
)
...>
}

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(ushort *)((char *)puVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- *(ushort *)((char *)puVar6 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- ((ushort *)puVar6)[1] >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (puVar6[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (puVar6[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- puVar6[1] >> 13
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- *(byte *)((char *)puVar6 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar6)->xpos
)
...>
}

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- ((ushort *)puVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- puVar6[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- *(byte *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
|
- (byte)puVar6[2] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
)
...>
}

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (*(ushort *)((char *)puVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- *(ushort *)((char *)puVar6 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- ((ushort *)puVar6)[2] >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- (puVar6[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (puVar6[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
|
- puVar6[2] >> 6
+ ((uw_object_hdr_t *)puVar6)->next
)
...>
}

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- ((ushort *)puVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- puVar6[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- *(byte *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
|
- (byte)puVar6[3] & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
)
...>
}

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (*(ushort *)((char *)puVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- *(ushort *)((char *)puVar6 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- ((ushort *)puVar6)[3] >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- (puVar6[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (puVar6[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
|
- puVar6[3] >> 6
+ ((uw_object_hdr_t *)puVar6)->link
)
...>
}

@field_17_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->object_id
|
- ((ushort *)puVar14)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->object_id
|
- *(ushort *)puVar14 & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->object_id
|
- puVar14[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->object_id
|
- *puVar14 & 0x1ff
+ ((uw_object_hdr_t *)puVar14)->object_id
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (((ushort *)puVar14)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (((ushort *)puVar14)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(ushort *)puVar14 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(ushort *)puVar14 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (puVar14[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (puVar14[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*puVar14 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*puVar14 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(byte *)((char *)puVar14 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar14)->flags_res
|
- (*(byte *)((char *)puVar14 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar14)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (((ushort *)puVar14)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (((ushort *)puVar14)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(ushort *)puVar14 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(ushort *)puVar14 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (puVar14[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (puVar14[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*puVar14 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*puVar14 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(byte *)((char *)puVar14 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar14)->enchanted
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar14)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (((ushort *)puVar14)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (((ushort *)puVar14)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(ushort *)puVar14 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(ushort *)puVar14 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (puVar14[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (puVar14[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*puVar14 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*puVar14 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(byte *)((char *)puVar14 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar14)->doordir
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar14)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (((ushort *)puVar14)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (((ushort *)puVar14)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(ushort *)puVar14 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(ushort *)puVar14 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (puVar14[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (puVar14[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*puVar14 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*puVar14 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(byte *)((char *)puVar14 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar14)->invisible
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar14)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(ushort *)((char *)puVar14 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *(ushort *)((char *)puVar14 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (((ushort *)puVar14)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (((ushort *)puVar14)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- ((ushort *)puVar14)[0] >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(ushort *)puVar14 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(ushort *)puVar14 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *(ushort *)puVar14 >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (puVar14[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (puVar14[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- puVar14[0] >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*puVar14 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*puVar14 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *puVar14 >> 15
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(byte *)((char *)puVar14 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- (*(byte *)((char *)puVar14 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar14)->is_quant
|
- *(byte *)((char *)puVar14 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar14)->is_quant
)
...>
}

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- ((ushort *)puVar14)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- puVar14[1] & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- *(byte *)((char *)puVar14 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
|
- (byte)puVar14[1] & 0x7f
+ ((uw_object_hdr_t *)puVar14)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (*(ushort *)((char *)puVar14 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (((ushort *)puVar14)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (((ushort *)puVar14)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (puVar14[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar14)->heading
|
- (puVar14[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar14)->heading
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (*(ushort *)((char *)puVar14 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (((ushort *)puVar14)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (((ushort *)puVar14)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (puVar14[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (puVar14[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (*(byte *)((char *)puVar14 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar14)->ypos
|
- (*(byte *)((char *)puVar14 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar14)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (*(ushort *)((char *)puVar14 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- *(ushort *)((char *)puVar14 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (((ushort *)puVar14)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (((ushort *)puVar14)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- ((ushort *)puVar14)[1] >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (puVar14[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (puVar14[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- puVar14[1] >> 13
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (*(byte *)((char *)puVar14 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- (*(byte *)((char *)puVar14 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar14)->xpos
|
- *(byte *)((char *)puVar14 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar14)->xpos
)
...>
}

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- ((ushort *)puVar14)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- puVar14[2] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- *(byte *)((char *)puVar14 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
|
- (byte)puVar14[2] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->next
|
- (*(ushort *)((char *)puVar14 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- *(ushort *)((char *)puVar14 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- (((ushort *)puVar14)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->next
|
- (((ushort *)puVar14)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- ((ushort *)puVar14)[2] >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- (puVar14[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->next
|
- (puVar14[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->next
|
- puVar14[2] >> 6
+ ((uw_object_hdr_t *)puVar14)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- ((ushort *)puVar14)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- puVar14[3] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- *(byte *)((char *)puVar14 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
|
- (byte)puVar14[3] & 0x3f
+ ((uw_object_hdr_t *)puVar14)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar14 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->link
|
- (*(ushort *)((char *)puVar14 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- *(ushort *)((char *)puVar14 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- (((ushort *)puVar14)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->link
|
- (((ushort *)puVar14)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- ((ushort *)puVar14)[3] >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- (puVar14[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar14)->link
|
- (puVar14[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar14)->link
|
- puVar14[3] >> 6
+ ((uw_object_hdr_t *)puVar14)->link
)
...>
}

@field_18_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
|
- ((ushort *)puVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
|
- *(ushort *)puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
|
- puVar7[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
|
- *puVar7 & 0x1ff
+ ((uw_object_hdr_t *)puVar7)->object_id
)
...>
}

@field_18_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (((ushort *)puVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(ushort *)puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (puVar7[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (puVar7[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*puVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*puVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar7)->flags_res
|
- (*(byte *)((char *)puVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar7)->flags_res
)
...>
}

@field_18_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (((ushort *)puVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(ushort *)puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (puVar7[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (puVar7[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*puVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*puVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar7)->enchanted
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar7)->enchanted
)
...>
}

@field_18_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (((ushort *)puVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(ushort *)puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (puVar7[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (puVar7[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*puVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*puVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar7)->doordir
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar7)->doordir
)
...>
}

@field_18_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (((ushort *)puVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(ushort *)puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (puVar7[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (puVar7[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*puVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*puVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar7)->invisible
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar7)->invisible
)
...>
}

@field_18_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)((char *)puVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(ushort *)((char *)puVar7 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (((ushort *)puVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- ((ushort *)puVar7)[0] >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(ushort *)puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(ushort *)puVar7 >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (puVar7[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (puVar7[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- puVar7[0] >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*puVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*puVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *puVar7 >> 15
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- (*(byte *)((char *)puVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
|
- *(byte *)((char *)puVar7 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar7)->is_quant
)
...>
}

@field_18_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- ((ushort *)puVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- puVar7[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- *(byte *)((char *)puVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
|
- (byte)puVar7[1] & 0x7f
+ ((uw_object_hdr_t *)puVar7)->zpos
)
...>
}

@field_18_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (((ushort *)puVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (puVar7[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar7)->heading
|
- (puVar7[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar7)->heading
)
...>
}

@field_18_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (((ushort *)puVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (puVar7[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (puVar7[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar7)->ypos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar7)->ypos
)
...>
}

@field_18_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(ushort *)((char *)puVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- *(ushort *)((char *)puVar7 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (((ushort *)puVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- ((ushort *)puVar7)[1] >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (puVar7[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (puVar7[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- puVar7[1] >> 13
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- (*(byte *)((char *)puVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
|
- *(byte *)((char *)puVar7 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar7)->xpos
)
...>
}

@field_18_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- ((ushort *)puVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- puVar7[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- *(byte *)((char *)puVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
|
- (byte)puVar7[2] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->quality
)
...>
}

@field_18_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (*(ushort *)((char *)puVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- *(ushort *)((char *)puVar7 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (((ushort *)puVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- ((ushort *)puVar7)[2] >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- (puVar7[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->next
|
- (puVar7[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->next
|
- puVar7[2] >> 6
+ ((uw_object_hdr_t *)puVar7)->next
)
...>
}

@field_18_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- ((ushort *)puVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- puVar7[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- *(byte *)((char *)puVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
|
- (byte)puVar7[3] & 0x3f
+ ((uw_object_hdr_t *)puVar7)->owner
)
...>
}

@field_18_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (*(ushort *)((char *)puVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- *(ushort *)((char *)puVar7 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (((ushort *)puVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- ((ushort *)puVar7)[3] >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- (puVar7[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar7)->link
|
- (puVar7[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar7)->link
|
- puVar7[3] >> 6
+ ((uw_object_hdr_t *)puVar7)->link
)
...>
}

@field_19_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar9)->object_id
|
- ((ushort *)uVar9)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar9)->object_id
|
- *(ushort *)uVar9 & 0x1ff
+ ((uw_object_hdr_t *)uVar9)->object_id
|
- uVar9[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar9)->object_id
|
- *uVar9 & 0x1ff
+ ((uw_object_hdr_t *)uVar9)->object_id
)
...>
}

@field_19_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*(ushort *)((char *)uVar9 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (((ushort *)uVar9)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (((ushort *)uVar9)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*(ushort *)uVar9 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*(ushort *)uVar9 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (uVar9[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (uVar9[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*uVar9 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*uVar9 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*(byte *)((char *)uVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar9)->flags_res
|
- (*(byte *)((char *)uVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar9)->flags_res
)
...>
}

@field_19_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*(ushort *)((char *)uVar9 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (((ushort *)uVar9)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (((ushort *)uVar9)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*(ushort *)uVar9 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*(ushort *)uVar9 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (uVar9[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (uVar9[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*uVar9 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*uVar9 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*(byte *)((char *)uVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar9)->enchanted
|
- (*(byte *)((char *)uVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar9)->enchanted
)
...>
}

@field_19_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*(ushort *)((char *)uVar9 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (((ushort *)uVar9)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (((ushort *)uVar9)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*(ushort *)uVar9 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*(ushort *)uVar9 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (uVar9[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (uVar9[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*uVar9 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*uVar9 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*(byte *)((char *)uVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar9)->doordir
|
- (*(byte *)((char *)uVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar9)->doordir
)
...>
}

@field_19_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*(ushort *)((char *)uVar9 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (((ushort *)uVar9)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (((ushort *)uVar9)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*(ushort *)uVar9 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*(ushort *)uVar9 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (uVar9[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (uVar9[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*uVar9 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*uVar9 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*(byte *)((char *)uVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar9)->invisible
|
- (*(byte *)((char *)uVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar9)->invisible
)
...>
}

@field_19_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*(ushort *)((char *)uVar9 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- *(ushort *)((char *)uVar9 + 0x0) >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (((ushort *)uVar9)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (((ushort *)uVar9)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- ((ushort *)uVar9)[0] >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*(ushort *)uVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*(ushort *)uVar9 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- *(ushort *)uVar9 >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (uVar9[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (uVar9[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- uVar9[0] >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*uVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*uVar9 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- *uVar9 >> 15
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*(byte *)((char *)uVar9 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- (*(byte *)((char *)uVar9 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar9)->is_quant
|
- *(byte *)((char *)uVar9 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar9)->is_quant
)
...>
}

@field_19_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar9)->zpos
|
- ((ushort *)uVar9)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar9)->zpos
|
- uVar9[1] & 0x7f
+ ((uw_object_hdr_t *)uVar9)->zpos
|
- *(byte *)((char *)uVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar9)->zpos
|
- (byte)uVar9[1] & 0x7f
+ ((uw_object_hdr_t *)uVar9)->zpos
)
...>
}

@field_19_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar9)->heading
|
- (*(ushort *)((char *)uVar9 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar9)->heading
|
- (((ushort *)uVar9)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar9)->heading
|
- (((ushort *)uVar9)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar9)->heading
|
- (uVar9[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar9)->heading
|
- (uVar9[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar9)->heading
)
...>
}

@field_19_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (*(ushort *)((char *)uVar9 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (((ushort *)uVar9)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (((ushort *)uVar9)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (uVar9[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (uVar9[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (*(byte *)((char *)uVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar9)->ypos
|
- (*(byte *)((char *)uVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar9)->ypos
)
...>
}

@field_19_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (*(ushort *)((char *)uVar9 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- *(ushort *)((char *)uVar9 + 0x2) >> 13
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (((ushort *)uVar9)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (((ushort *)uVar9)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- ((ushort *)uVar9)[1] >> 13
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (uVar9[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (uVar9[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- uVar9[1] >> 13
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (*(byte *)((char *)uVar9 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- (*(byte *)((char *)uVar9 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar9)->xpos
|
- *(byte *)((char *)uVar9 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar9)->xpos
)
...>
}

@field_19_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar9)->quality
|
- ((ushort *)uVar9)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar9)->quality
|
- uVar9[2] & 0x3f
+ ((uw_object_hdr_t *)uVar9)->quality
|
- *(byte *)((char *)uVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar9)->quality
|
- (byte)uVar9[2] & 0x3f
+ ((uw_object_hdr_t *)uVar9)->quality
)
...>
}

@field_19_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar9)->next
|
- (*(ushort *)((char *)uVar9 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar9)->next
|
- *(ushort *)((char *)uVar9 + 0x4) >> 6
+ ((uw_object_hdr_t *)uVar9)->next
|
- (((ushort *)uVar9)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar9)->next
|
- (((ushort *)uVar9)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar9)->next
|
- ((ushort *)uVar9)[2] >> 6
+ ((uw_object_hdr_t *)uVar9)->next
|
- (uVar9[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar9)->next
|
- (uVar9[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar9)->next
|
- uVar9[2] >> 6
+ ((uw_object_hdr_t *)uVar9)->next
)
...>
}

@field_19_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar9)->owner
|
- ((ushort *)uVar9)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar9)->owner
|
- uVar9[3] & 0x3f
+ ((uw_object_hdr_t *)uVar9)->owner
|
- *(byte *)((char *)uVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar9)->owner
|
- (byte)uVar9[3] & 0x3f
+ ((uw_object_hdr_t *)uVar9)->owner
)
...>
}

@field_19_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar9 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar9)->link
|
- (*(ushort *)((char *)uVar9 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar9)->link
|
- *(ushort *)((char *)uVar9 + 0x6) >> 6
+ ((uw_object_hdr_t *)uVar9)->link
|
- (((ushort *)uVar9)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar9)->link
|
- (((ushort *)uVar9)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar9)->link
|
- ((ushort *)uVar9)[3] >> 6
+ ((uw_object_hdr_t *)uVar9)->link
|
- (uVar9[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar9)->link
|
- (uVar9[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar9)->link
|
- uVar9[3] >> 6
+ ((uw_object_hdr_t *)uVar9)->link
)
...>
}

@field_20_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- ((ushort *)uVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- *(ushort *)uVar1 & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- uVar1[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
|
- *uVar1 & 0x1ff
+ ((uw_object_hdr_t *)uVar1)->object_id
)
...>
}

@field_20_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (((ushort *)uVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (((ushort *)uVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)uVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(ushort *)uVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (uVar1[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (uVar1[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*uVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*uVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)((char *)uVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar1)->flags_res
|
- (*(byte *)((char *)uVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar1)->flags_res
)
...>
}

@field_20_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (((ushort *)uVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (((ushort *)uVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)uVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(ushort *)uVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (uVar1[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (uVar1[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*uVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*uVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)((char *)uVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar1)->enchanted
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar1)->enchanted
)
...>
}

@field_20_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (((ushort *)uVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (((ushort *)uVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)uVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(ushort *)uVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (uVar1[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (uVar1[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*uVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*uVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)((char *)uVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar1)->doordir
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar1)->doordir
)
...>
}

@field_20_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (((ushort *)uVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (((ushort *)uVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)uVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(ushort *)uVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (uVar1[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (uVar1[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*uVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*uVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)((char *)uVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar1)->invisible
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar1)->invisible
)
...>
}

@field_20_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)((char *)uVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(ushort *)((char *)uVar1 + 0x0) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (((ushort *)uVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (((ushort *)uVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- ((ushort *)uVar1)[0] >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)uVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(ushort *)uVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(ushort *)uVar1 >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (uVar1[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (uVar1[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- uVar1[0] >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*uVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*uVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *uVar1 >> 15
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)((char *)uVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- (*(byte *)((char *)uVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
|
- *(byte *)((char *)uVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar1)->is_quant
)
...>
}

@field_20_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- ((ushort *)uVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- uVar1[1] & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- *(byte *)((char *)uVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
|
- (byte)uVar1[1] & 0x7f
+ ((uw_object_hdr_t *)uVar1)->zpos
)
...>
}

@field_20_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (((ushort *)uVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (((ushort *)uVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (uVar1[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar1)->heading
|
- (uVar1[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar1)->heading
)
...>
}

@field_20_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (((ushort *)uVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (((ushort *)uVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (uVar1[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (uVar1[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)((char *)uVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar1)->ypos
|
- (*(byte *)((char *)uVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar1)->ypos
)
...>
}

@field_20_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(ushort *)((char *)uVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- *(ushort *)((char *)uVar1 + 0x2) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (((ushort *)uVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (((ushort *)uVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- ((ushort *)uVar1)[1] >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (uVar1[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (uVar1[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- uVar1[1] >> 13
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)((char *)uVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- (*(byte *)((char *)uVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
|
- *(byte *)((char *)uVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar1)->xpos
)
...>
}

@field_20_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- ((ushort *)uVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- uVar1[2] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- *(byte *)((char *)uVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
|
- (byte)uVar1[2] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->quality
)
...>
}

@field_20_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (*(ushort *)((char *)uVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- *(ushort *)((char *)uVar1 + 0x4) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- (((ushort *)uVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (((ushort *)uVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- ((ushort *)uVar1)[2] >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- (uVar1[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->next
|
- (uVar1[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->next
|
- uVar1[2] >> 6
+ ((uw_object_hdr_t *)uVar1)->next
)
...>
}

@field_20_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- ((ushort *)uVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- uVar1[3] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- *(byte *)((char *)uVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
|
- (byte)uVar1[3] & 0x3f
+ ((uw_object_hdr_t *)uVar1)->owner
)
...>
}

@field_20_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (*(ushort *)((char *)uVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- *(ushort *)((char *)uVar1 + 0x6) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- (((ushort *)uVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (((ushort *)uVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- ((ushort *)uVar1)[3] >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- (uVar1[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar1)->link
|
- (uVar1[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar1)->link
|
- uVar1[3] >> 6
+ ((uw_object_hdr_t *)uVar1)->link
)
...>
}

@field_23_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)psVar6)->object_id
|
- ((ushort *)psVar6)[0] & 0x1ff
+ ((uw_object_hdr_t *)psVar6)->object_id
|
- *(ushort *)psVar6 & 0x1ff
+ ((uw_object_hdr_t *)psVar6)->object_id
|
- psVar6[0] & 0x1ff
+ ((uw_object_hdr_t *)psVar6)->object_id
|
- *psVar6 & 0x1ff
+ ((uw_object_hdr_t *)psVar6)->object_id
)
...>
}

@field_23_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*(ushort *)((char *)psVar6 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (((ushort *)psVar6)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (((ushort *)psVar6)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*(ushort *)psVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*(ushort *)psVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (psVar6[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (psVar6[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*psVar6 >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*psVar6 & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*(byte *)((char *)psVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)psVar6)->flags_res
|
- (*(byte *)((char *)psVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)psVar6)->flags_res
)
...>
}

@field_23_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*(ushort *)((char *)psVar6 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (((ushort *)psVar6)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (((ushort *)psVar6)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*(ushort *)psVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*(ushort *)psVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (psVar6[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (psVar6[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*psVar6 >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*psVar6 & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*(byte *)((char *)psVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)psVar6)->enchanted
|
- (*(byte *)((char *)psVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)psVar6)->enchanted
)
...>
}

@field_23_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*(ushort *)((char *)psVar6 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (((ushort *)psVar6)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (((ushort *)psVar6)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*(ushort *)psVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*(ushort *)psVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (psVar6[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (psVar6[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*psVar6 >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*psVar6 & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*(byte *)((char *)psVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)psVar6)->doordir
|
- (*(byte *)((char *)psVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)psVar6)->doordir
)
...>
}

@field_23_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*(ushort *)((char *)psVar6 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (((ushort *)psVar6)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (((ushort *)psVar6)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*(ushort *)psVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*(ushort *)psVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (psVar6[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (psVar6[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*psVar6 >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*psVar6 & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*(byte *)((char *)psVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)psVar6)->invisible
|
- (*(byte *)((char *)psVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)psVar6)->invisible
)
...>
}

@field_23_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*(ushort *)((char *)psVar6 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (((ushort *)psVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (((ushort *)psVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*(ushort *)psVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*(ushort *)psVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (psVar6[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (psVar6[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*psVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*psVar6 & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*(byte *)((char *)psVar6 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- (*(byte *)((char *)psVar6 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)psVar6)->is_quant
|
- *(byte *)((char *)psVar6 + 0x1) >> 7
+ ((uw_object_hdr_t *)psVar6)->is_quant
)
...>
}

@field_23_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)psVar6)->zpos
|
- ((ushort *)psVar6)[1] & 0x7f
+ ((uw_object_hdr_t *)psVar6)->zpos
|
- psVar6[1] & 0x7f
+ ((uw_object_hdr_t *)psVar6)->zpos
|
- *(byte *)((char *)psVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)psVar6)->zpos
|
- (byte)psVar6[1] & 0x7f
+ ((uw_object_hdr_t *)psVar6)->zpos
)
...>
}

@field_23_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar6)->heading
|
- (*(ushort *)((char *)psVar6 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar6)->heading
|
- (((ushort *)psVar6)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar6)->heading
|
- (((ushort *)psVar6)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar6)->heading
|
- (psVar6[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar6)->heading
|
- (psVar6[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar6)->heading
)
...>
}

@field_23_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (*(ushort *)((char *)psVar6 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (((ushort *)psVar6)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (((ushort *)psVar6)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (psVar6[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (psVar6[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (*(byte *)((char *)psVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)psVar6)->ypos
|
- (*(byte *)((char *)psVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)psVar6)->ypos
)
...>
}

@field_23_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (*(ushort *)((char *)psVar6 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (((ushort *)psVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (((ushort *)psVar6)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (psVar6[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (psVar6[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (*(byte *)((char *)psVar6 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- (*(byte *)((char *)psVar6 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)psVar6)->xpos
|
- *(byte *)((char *)psVar6 + 0x3) >> 5
+ ((uw_object_hdr_t *)psVar6)->xpos
)
...>
}

@field_23_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)psVar6)->quality
|
- ((ushort *)psVar6)[2] & 0x3f
+ ((uw_object_hdr_t *)psVar6)->quality
|
- psVar6[2] & 0x3f
+ ((uw_object_hdr_t *)psVar6)->quality
|
- *(byte *)((char *)psVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)psVar6)->quality
|
- (byte)psVar6[2] & 0x3f
+ ((uw_object_hdr_t *)psVar6)->quality
)
...>
}

@field_23_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar6)->next
|
- (*(ushort *)((char *)psVar6 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar6)->next
|
- (((ushort *)psVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar6)->next
|
- (((ushort *)psVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar6)->next
|
- (psVar6[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar6)->next
|
- (psVar6[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar6)->next
)
...>
}

@field_23_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)psVar6)->owner
|
- ((ushort *)psVar6)[3] & 0x3f
+ ((uw_object_hdr_t *)psVar6)->owner
|
- psVar6[3] & 0x3f
+ ((uw_object_hdr_t *)psVar6)->owner
|
- *(byte *)((char *)psVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)psVar6)->owner
|
- (byte)psVar6[3] & 0x3f
+ ((uw_object_hdr_t *)psVar6)->owner
)
...>
}

@field_23_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar6 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar6)->link
|
- (*(ushort *)((char *)psVar6 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar6)->link
|
- (((ushort *)psVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar6)->link
|
- (((ushort *)psVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar6)->link
|
- (psVar6[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar6)->link
|
- (psVar6[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar6)->link
)
...>
}

@field_24_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
)
...>
}

@field_24_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (*(byte *)((char *)puVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar5)->flags_res
|
- (*(byte *)((char *)puVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar5)->flags_res
)
...>
}

@field_24_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (*(byte *)((char *)puVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar5)->enchanted
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar5)->enchanted
)
...>
}

@field_24_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (*(byte *)((char *)puVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar5)->doordir
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar5)->doordir
)
...>
}

@field_24_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (*(byte *)((char *)puVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar5)->invisible
|
- (*(byte *)((char *)puVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar5)->invisible
)
...>
}

@field_24_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (((ushort *)puVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (((ushort *)puVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar5)->is_quant
|
- (*(ushort *)puVar5 & 0x8000) >> 15
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

@field_24_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- *(byte *)((char *)puVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar5)->zpos
)
...>
}

@field_24_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
)
...>
}

@field_24_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (*(byte *)((char *)puVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar5)->ypos
|
- (*(byte *)((char *)puVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar5)->ypos
)
...>
}

@field_24_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (((ushort *)puVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar5)->xpos
|
- (((ushort *)puVar5)[1] & 0xe000) >> 13
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

@field_24_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- *(byte *)((char *)puVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->quality
)
...>
}

@field_24_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (((ushort *)puVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->next
|
- (((ushort *)puVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->next
)
...>
}

@field_24_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- *(byte *)((char *)puVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar5)->owner
)
...>
}

@field_24_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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
- (((ushort *)puVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar5)->link
|
- (((ushort *)puVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar5)->link
)
...>
}

@field_25_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)held_header)->object_id
|
- ((ushort *)held_header)[0] & 0x1ff
+ ((uw_object_hdr_t *)held_header)->object_id
|
- *(ushort *)held_header & 0x1ff
+ ((uw_object_hdr_t *)held_header)->object_id
)
...>
}

@field_25_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (*(ushort *)((char *)held_header + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (((ushort *)held_header)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (((ushort *)held_header)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (*(ushort *)held_header >> 9) & 0x7
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (*(ushort *)held_header & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (*(byte *)((char *)held_header + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)held_header)->flags_res
|
- (*(byte *)((char *)held_header + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)held_header)->flags_res
)
...>
}

@field_25_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (*(ushort *)((char *)held_header + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (((ushort *)held_header)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (((ushort *)held_header)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (*(ushort *)held_header >> 12) & 0x1
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (*(ushort *)held_header & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (*(byte *)((char *)held_header + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)held_header)->enchanted
|
- (*(byte *)((char *)held_header + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)held_header)->enchanted
)
...>
}

@field_25_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (*(ushort *)((char *)held_header + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (((ushort *)held_header)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (((ushort *)held_header)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (*(ushort *)held_header >> 13) & 0x1
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (*(ushort *)held_header & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (*(byte *)((char *)held_header + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)held_header)->doordir
|
- (*(byte *)((char *)held_header + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)held_header)->doordir
)
...>
}

@field_25_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (*(ushort *)((char *)held_header + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (((ushort *)held_header)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (((ushort *)held_header)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (*(ushort *)held_header >> 14) & 0x1
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (*(ushort *)held_header & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (*(byte *)((char *)held_header + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)held_header)->invisible
|
- (*(byte *)((char *)held_header + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)held_header)->invisible
)
...>
}

@field_25_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (*(ushort *)((char *)held_header + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (((ushort *)held_header)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (((ushort *)held_header)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (*(ushort *)held_header >> 15) & 0x1
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (*(ushort *)held_header & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (*(byte *)((char *)held_header + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- (*(byte *)((char *)held_header + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)held_header)->is_quant
|
- *(byte *)((char *)held_header + 0x1) >> 7
+ ((uw_object_hdr_t *)held_header)->is_quant
)
...>
}

@field_25_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_header)->zpos
|
- ((ushort *)held_header)[1] & 0x7f
+ ((uw_object_hdr_t *)held_header)->zpos
|
- *(byte *)((char *)held_header + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_header)->zpos
)
...>
}

@field_25_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)held_header)->heading
|
- (*(ushort *)((char *)held_header + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)held_header)->heading
|
- (((ushort *)held_header)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)held_header)->heading
|
- (((ushort *)held_header)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)held_header)->heading
)
...>
}

@field_25_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)held_header)->ypos
|
- (*(ushort *)((char *)held_header + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_header)->ypos
|
- (((ushort *)held_header)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)held_header)->ypos
|
- (((ushort *)held_header)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_header)->ypos
|
- (*(byte *)((char *)held_header + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)held_header)->ypos
|
- (*(byte *)((char *)held_header + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)held_header)->ypos
)
...>
}

@field_25_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)held_header)->xpos
|
- (*(ushort *)((char *)held_header + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_header)->xpos
|
- (((ushort *)held_header)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)held_header)->xpos
|
- (((ushort *)held_header)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_header)->xpos
|
- (*(byte *)((char *)held_header + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)held_header)->xpos
|
- (*(byte *)((char *)held_header + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)held_header)->xpos
|
- *(byte *)((char *)held_header + 0x3) >> 5
+ ((uw_object_hdr_t *)held_header)->xpos
)
...>
}

@field_25_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_header)->quality
|
- ((ushort *)held_header)[2] & 0x3f
+ ((uw_object_hdr_t *)held_header)->quality
|
- *(byte *)((char *)held_header + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_header)->quality
)
...>
}

@field_25_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_header)->next
|
- (*(ushort *)((char *)held_header + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_header)->next
|
- (((ushort *)held_header)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_header)->next
|
- (((ushort *)held_header)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_header)->next
)
...>
}

@field_25_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_header)->owner
|
- ((ushort *)held_header)[3] & 0x3f
+ ((uw_object_hdr_t *)held_header)->owner
|
- *(byte *)((char *)held_header + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_header)->owner
)
...>
}

@field_25_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_header + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_header)->link
|
- (*(ushort *)((char *)held_header + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_header)->link
|
- (((ushort *)held_header)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_header)->link
|
- (((ushort *)held_header)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_header)->link
)
...>
}

@field_26_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)held_object)->object_id
|
- ((ushort *)held_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)held_object)->object_id
|
- *(ushort *)held_object & 0x1ff
+ ((uw_object_hdr_t *)held_object)->object_id
|
- held_object[0] & 0x1ff
+ ((uw_object_hdr_t *)held_object)->object_id
|
- *held_object & 0x1ff
+ ((uw_object_hdr_t *)held_object)->object_id
)
...>
}

@field_26_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*(ushort *)((char *)held_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (((ushort *)held_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (((ushort *)held_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*(ushort *)held_object >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*(ushort *)held_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (held_object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (held_object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*held_object >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*held_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*(byte *)((char *)held_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*(byte *)((char *)held_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)held_object)->flags_res
)
...>
}

@field_26_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*(ushort *)((char *)held_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (((ushort *)held_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (((ushort *)held_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*(ushort *)held_object >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*(ushort *)held_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (held_object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (held_object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*held_object >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*held_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*(byte *)((char *)held_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*(byte *)((char *)held_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)held_object)->enchanted
)
...>
}

@field_26_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*(ushort *)((char *)held_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (((ushort *)held_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (((ushort *)held_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*(ushort *)held_object >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*(ushort *)held_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (held_object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (held_object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*held_object >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*held_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*(byte *)((char *)held_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*(byte *)((char *)held_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)held_object)->doordir
)
...>
}

@field_26_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*(ushort *)((char *)held_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (((ushort *)held_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (((ushort *)held_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*(ushort *)held_object >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*(ushort *)held_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (held_object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (held_object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*held_object >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*held_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*(byte *)((char *)held_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*(byte *)((char *)held_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)held_object)->invisible
)
...>
}

@field_26_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(ushort *)((char *)held_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- *(ushort *)((char *)held_object + 0x0) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (((ushort *)held_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (((ushort *)held_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- ((ushort *)held_object)[0] >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(ushort *)held_object >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(ushort *)held_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- *(ushort *)held_object >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (held_object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (held_object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- held_object[0] >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*held_object >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*held_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- *held_object >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(byte *)((char *)held_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(byte *)((char *)held_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- *(byte *)((char *)held_object + 0x1) >> 7
+ ((uw_object_hdr_t *)held_object)->is_quant
)
...>
}

@field_26_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object)->zpos
|
- ((ushort *)held_object)[1] & 0x7f
+ ((uw_object_hdr_t *)held_object)->zpos
|
- held_object[1] & 0x7f
+ ((uw_object_hdr_t *)held_object)->zpos
|
- *(byte *)((char *)held_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object)->zpos
|
- (byte)held_object[1] & 0x7f
+ ((uw_object_hdr_t *)held_object)->zpos
)
...>
}

@field_26_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)held_object)->heading
|
- (*(ushort *)((char *)held_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)held_object)->heading
|
- (((ushort *)held_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)held_object)->heading
|
- (((ushort *)held_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)held_object)->heading
|
- (held_object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)held_object)->heading
|
- (held_object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)held_object)->heading
)
...>
}

@field_26_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (*(ushort *)((char *)held_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (((ushort *)held_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (((ushort *)held_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (held_object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (held_object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (*(byte *)((char *)held_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (*(byte *)((char *)held_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)held_object)->ypos
)
...>
}

@field_26_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (*(ushort *)((char *)held_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_object)->xpos
|
- *(ushort *)((char *)held_object + 0x2) >> 13
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (((ushort *)held_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (((ushort *)held_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_object)->xpos
|
- ((ushort *)held_object)[1] >> 13
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (held_object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (held_object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_object)->xpos
|
- held_object[1] >> 13
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (*(byte *)((char *)held_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (*(byte *)((char *)held_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)held_object)->xpos
|
- *(byte *)((char *)held_object + 0x3) >> 5
+ ((uw_object_hdr_t *)held_object)->xpos
)
...>
}

@field_26_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object)->quality
|
- ((ushort *)held_object)[2] & 0x3f
+ ((uw_object_hdr_t *)held_object)->quality
|
- held_object[2] & 0x3f
+ ((uw_object_hdr_t *)held_object)->quality
|
- *(byte *)((char *)held_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object)->quality
|
- (byte)held_object[2] & 0x3f
+ ((uw_object_hdr_t *)held_object)->quality
)
...>
}

@field_26_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->next
|
- (*(ushort *)((char *)held_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->next
|
- *(ushort *)((char *)held_object + 0x4) >> 6
+ ((uw_object_hdr_t *)held_object)->next
|
- (((ushort *)held_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->next
|
- (((ushort *)held_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->next
|
- ((ushort *)held_object)[2] >> 6
+ ((uw_object_hdr_t *)held_object)->next
|
- (held_object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->next
|
- (held_object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->next
|
- held_object[2] >> 6
+ ((uw_object_hdr_t *)held_object)->next
)
...>
}

@field_26_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object)->owner
|
- ((ushort *)held_object)[3] & 0x3f
+ ((uw_object_hdr_t *)held_object)->owner
|
- held_object[3] & 0x3f
+ ((uw_object_hdr_t *)held_object)->owner
|
- *(byte *)((char *)held_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object)->owner
|
- (byte)held_object[3] & 0x3f
+ ((uw_object_hdr_t *)held_object)->owner
)
...>
}

@field_26_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->link
|
- (*(ushort *)((char *)held_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->link
|
- *(ushort *)((char *)held_object + 0x6) >> 6
+ ((uw_object_hdr_t *)held_object)->link
|
- (((ushort *)held_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->link
|
- (((ushort *)held_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->link
|
- ((ushort *)held_object)[3] >> 6
+ ((uw_object_hdr_t *)held_object)->link
|
- (held_object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->link
|
- (held_object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->link
|
- held_object[3] >> 6
+ ((uw_object_hdr_t *)held_object)->link
)
...>
}

@field_27_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- ((ushort *)puVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- *(ushort *)puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
)
...>
}

@field_27_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar2)->flags_res
)
...>
}

@field_27_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar2)->enchanted
)
...>
}

@field_27_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar2)->doordir
)
...>
}

@field_27_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar2)->invisible
)
...>
}

@field_27_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(byte *)((char *)puVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
)
...>
}

@field_27_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- ((ushort *)puVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- *(byte *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
)
...>
}

@field_27_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
)
...>
}

@field_27_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar2)->ypos
)
...>
}

@field_27_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- *(byte *)((char *)puVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
)
...>
}

@field_27_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- ((ushort *)puVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- *(byte *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
)
...>
}

@field_27_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (*(ushort *)((char *)puVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
)
...>
}

@field_27_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- ((ushort *)puVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- *(byte *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
)
...>
}

@field_27_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (*(ushort *)((char *)puVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
)
...>
}

@field_28_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- puVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
|
- *puVar4 & 0x1ff
+ ((uw_object_hdr_t *)puVar4)->object_id
)
...>
}

@field_28_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- (puVar4[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (puVar4[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*puVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*puVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar4)->flags_res
|
- (*(byte *)((char *)puVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar4)->flags_res
)
...>
}

@field_28_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- (puVar4[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (puVar4[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*puVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*puVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar4)->enchanted
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar4)->enchanted
)
...>
}

@field_28_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- (puVar4[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (puVar4[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*puVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*puVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar4)->doordir
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar4)->doordir
)
...>
}

@field_28_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- (puVar4[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (puVar4[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*puVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*puVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar4)->invisible
|
- (*(byte *)((char *)puVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar4)->invisible
)
...>
}

@field_28_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- *(ushort *)((char *)puVar4 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (((ushort *)puVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- ((ushort *)puVar4)[0] >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*(ushort *)puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *(ushort *)puVar4 >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (puVar4[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (puVar4[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- puVar4[0] >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*puVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- (*puVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar4)->is_quant
|
- *puVar4 >> 15
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
)
...>
}

@field_28_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- puVar4[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- *(byte *)((char *)puVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
|
- (byte)puVar4[1] & 0x7f
+ ((uw_object_hdr_t *)puVar4)->zpos
)
...>
}

@field_28_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- (puVar4[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar4)->heading
|
- (puVar4[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar4)->heading
)
...>
}

@field_28_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- (puVar4[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (puVar4[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar4)->ypos
|
- (*(byte *)((char *)puVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar4)->ypos
)
...>
}

@field_28_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- *(ushort *)((char *)puVar4 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (((ushort *)puVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- ((ushort *)puVar4)[1] >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (puVar4[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- (puVar4[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar4)->xpos
|
- puVar4[1] >> 13
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
)
...>
}

@field_28_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- puVar4[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- *(byte *)((char *)puVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
|
- (byte)puVar4[2] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->quality
)
...>
}

@field_28_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- *(ushort *)((char *)puVar4 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (((ushort *)puVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- ((ushort *)puVar4)[2] >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- (puVar4[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->next
|
- (puVar4[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->next
|
- puVar4[2] >> 6
+ ((uw_object_hdr_t *)puVar4)->next
)
...>
}

@field_28_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- puVar4[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- *(byte *)((char *)puVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
|
- (byte)puVar4[3] & 0x3f
+ ((uw_object_hdr_t *)puVar4)->owner
)
...>
}

@field_28_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
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
- *(ushort *)((char *)puVar4 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (((ushort *)puVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- ((ushort *)puVar4)[3] >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- (puVar4[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar4)->link
|
- (puVar4[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar4)->link
|
- puVar4[3] >> 6
+ ((uw_object_hdr_t *)puVar4)->link
)
...>
}

@field_29_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->object_id
|
- ((ushort *)puVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->object_id
|
- *(ushort *)puVar1 & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->object_id
|
- puVar1[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->object_id
|
- *puVar1 & 0x1ff
+ ((uw_object_hdr_t *)puVar1)->object_id
)
...>
}

@field_29_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (((ushort *)puVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (((ushort *)puVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)puVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(ushort *)puVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (puVar1[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (puVar1[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*puVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*puVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar1)->flags_res
)
...>
}

@field_29_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (((ushort *)puVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (((ushort *)puVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)puVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(ushort *)puVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (puVar1[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (puVar1[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*puVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*puVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar1)->enchanted
)
...>
}

@field_29_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (((ushort *)puVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (((ushort *)puVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)puVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(ushort *)puVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (puVar1[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (puVar1[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*puVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*puVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar1)->doordir
)
...>
}

@field_29_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (((ushort *)puVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (((ushort *)puVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)puVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(ushort *)puVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (puVar1[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (puVar1[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*puVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*puVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar1)->invisible
)
...>
}

@field_29_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)((char *)puVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(ushort *)((char *)puVar1 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- ((ushort *)puVar1)[0] >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(ushort *)puVar1 >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (puVar1[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (puVar1[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- puVar1[0] >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*puVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *puVar1 >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- *(byte *)((char *)puVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar1)->is_quant
)
...>
}

@field_29_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- ((ushort *)puVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- puVar1[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- *(byte *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
|
- (byte)puVar1[1] & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
)
...>
}

@field_29_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (((ushort *)puVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (((ushort *)puVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (puVar1[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar1)->heading
|
- (puVar1[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar1)->heading
)
...>
}

@field_29_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (((ushort *)puVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (((ushort *)puVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (puVar1[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (puVar1[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar1)->ypos
)
...>
}

@field_29_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(ushort *)((char *)puVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- *(ushort *)((char *)puVar1 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- ((ushort *)puVar1)[1] >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (puVar1[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (puVar1[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- puVar1[1] >> 13
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- *(byte *)((char *)puVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar1)->xpos
)
...>
}

@field_29_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- ((ushort *)puVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- puVar1[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- *(byte *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
|
- (byte)puVar1[2] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
)
...>
}

@field_29_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (*(ushort *)((char *)puVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- *(ushort *)((char *)puVar1 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- ((ushort *)puVar1)[2] >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- (puVar1[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (puVar1[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
|
- puVar1[2] >> 6
+ ((uw_object_hdr_t *)puVar1)->next
)
...>
}

@field_29_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- ((ushort *)puVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- puVar1[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- *(byte *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
|
- (byte)puVar1[3] & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
)
...>
}

@field_29_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (*(ushort *)((char *)puVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- *(ushort *)((char *)puVar1 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- ((ushort *)puVar1)[3] >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- (puVar1[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (puVar1[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
|
- puVar1[3] >> 6
+ ((uw_object_hdr_t *)puVar1)->link
)
...>
}

@field_30_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pvItem)->object_id
|
- ((ushort *)pvItem)[0] & 0x1ff
+ ((uw_object_hdr_t *)pvItem)->object_id
|
- *(ushort *)pvItem & 0x1ff
+ ((uw_object_hdr_t *)pvItem)->object_id
|
- *(ushort *)(pvItem + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pvItem)->object_id
)
...>
}

@field_30_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(ushort *)((char *)pvItem + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (((ushort *)pvItem)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (((ushort *)pvItem)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(ushort *)pvItem >> 9) & 0x7
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(ushort *)pvItem & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(ushort *)(pvItem + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(ushort *)(pvItem + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(byte *)((char *)pvItem + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(byte *)((char *)pvItem + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(byte *)(pvItem + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pvItem)->flags_res
|
- (*(byte *)(pvItem + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pvItem)->flags_res
)
...>
}

@field_30_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(ushort *)((char *)pvItem + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (((ushort *)pvItem)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (((ushort *)pvItem)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(ushort *)pvItem >> 12) & 0x1
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(ushort *)pvItem & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(ushort *)(pvItem + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(ushort *)(pvItem + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(byte *)((char *)pvItem + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(byte *)((char *)pvItem + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(byte *)(pvItem + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pvItem)->enchanted
|
- (*(byte *)(pvItem + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pvItem)->enchanted
)
...>
}

@field_30_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(ushort *)((char *)pvItem + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (((ushort *)pvItem)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (((ushort *)pvItem)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(ushort *)pvItem >> 13) & 0x1
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(ushort *)pvItem & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(ushort *)(pvItem + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(ushort *)(pvItem + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(byte *)((char *)pvItem + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(byte *)((char *)pvItem + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(byte *)(pvItem + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pvItem)->doordir
|
- (*(byte *)(pvItem + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pvItem)->doordir
)
...>
}

@field_30_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(ushort *)((char *)pvItem + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (((ushort *)pvItem)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (((ushort *)pvItem)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(ushort *)pvItem >> 14) & 0x1
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(ushort *)pvItem & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(ushort *)(pvItem + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(ushort *)(pvItem + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(byte *)((char *)pvItem + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(byte *)((char *)pvItem + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(byte *)(pvItem + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pvItem)->invisible
|
- (*(byte *)(pvItem + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pvItem)->invisible
)
...>
}

@field_30_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(ushort *)((char *)pvItem + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (((ushort *)pvItem)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (((ushort *)pvItem)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(ushort *)pvItem >> 15) & 0x1
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(ushort *)pvItem & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(ushort *)(pvItem + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(ushort *)(pvItem + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(byte *)((char *)pvItem + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(byte *)((char *)pvItem + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- *(byte *)((char *)pvItem + 0x1) >> 7
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(byte *)(pvItem + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- (*(byte *)(pvItem + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pvItem)->is_quant
|
- *(byte *)(pvItem + 0x1) >> 7
+ ((uw_object_hdr_t *)pvItem)->is_quant
)
...>
}

@field_30_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvItem)->zpos
|
- ((ushort *)pvItem)[1] & 0x7f
+ ((uw_object_hdr_t *)pvItem)->zpos
|
- *(ushort *)(pvItem + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvItem)->zpos
|
- *(byte *)((char *)pvItem + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvItem)->zpos
|
- *(byte *)(pvItem + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvItem)->zpos
)
...>
}

@field_30_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pvItem)->heading
|
- (*(ushort *)((char *)pvItem + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pvItem)->heading
|
- (((ushort *)pvItem)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pvItem)->heading
|
- (((ushort *)pvItem)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pvItem)->heading
|
- (*(ushort *)(pvItem + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pvItem)->heading
|
- (*(ushort *)(pvItem + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pvItem)->heading
)
...>
}

@field_30_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(ushort *)((char *)pvItem + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (((ushort *)pvItem)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (((ushort *)pvItem)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(ushort *)(pvItem + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(ushort *)(pvItem + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(byte *)((char *)pvItem + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(byte *)((char *)pvItem + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(byte *)(pvItem + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pvItem)->ypos
|
- (*(byte *)(pvItem + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pvItem)->ypos
)
...>
}

@field_30_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(ushort *)((char *)pvItem + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (((ushort *)pvItem)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (((ushort *)pvItem)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(ushort *)(pvItem + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(ushort *)(pvItem + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(byte *)((char *)pvItem + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(byte *)((char *)pvItem + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- *(byte *)((char *)pvItem + 0x3) >> 5
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(byte *)(pvItem + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- (*(byte *)(pvItem + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pvItem)->xpos
|
- *(byte *)(pvItem + 0x3) >> 5
+ ((uw_object_hdr_t *)pvItem)->xpos
)
...>
}

@field_30_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->quality
|
- ((ushort *)pvItem)[2] & 0x3f
+ ((uw_object_hdr_t *)pvItem)->quality
|
- *(ushort *)(pvItem + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->quality
|
- *(byte *)((char *)pvItem + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->quality
|
- *(byte *)(pvItem + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->quality
)
...>
}

@field_30_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvItem)->next
|
- (*(ushort *)((char *)pvItem + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvItem)->next
|
- (((ushort *)pvItem)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvItem)->next
|
- (((ushort *)pvItem)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvItem)->next
|
- (*(ushort *)(pvItem + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvItem)->next
|
- (*(ushort *)(pvItem + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvItem)->next
)
...>
}

@field_30_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->owner
|
- ((ushort *)pvItem)[3] & 0x3f
+ ((uw_object_hdr_t *)pvItem)->owner
|
- *(ushort *)(pvItem + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->owner
|
- *(byte *)((char *)pvItem + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->owner
|
- *(byte *)(pvItem + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvItem)->owner
)
...>
}

@field_30_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvItem + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvItem)->link
|
- (*(ushort *)((char *)pvItem + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvItem)->link
|
- (((ushort *)pvItem)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvItem)->link
|
- (((ushort *)pvItem)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvItem)->link
|
- (*(ushort *)(pvItem + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvItem)->link
|
- (*(ushort *)(pvItem + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvItem)->link
)
...>
}

@field_31_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- ((ushort *)puVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- *(ushort *)puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- puVar2[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
|
- *puVar2 & 0x1ff
+ ((uw_object_hdr_t *)puVar2)->object_id
)
...>
}

@field_31_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (((ushort *)puVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(ushort *)puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (puVar2[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (puVar2[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*puVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*puVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar2)->flags_res
|
- (*(byte *)((char *)puVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar2)->flags_res
)
...>
}

@field_31_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (((ushort *)puVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(ushort *)puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (puVar2[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (puVar2[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*puVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*puVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar2)->enchanted
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar2)->enchanted
)
...>
}

@field_31_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (((ushort *)puVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(ushort *)puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (puVar2[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (puVar2[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*puVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*puVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar2)->doordir
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar2)->doordir
)
...>
}

@field_31_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (((ushort *)puVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(ushort *)puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (puVar2[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (puVar2[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*puVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*puVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar2)->invisible
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar2)->invisible
)
...>
}

@field_31_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)((char *)puVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(ushort *)((char *)puVar2 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (((ushort *)puVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- ((ushort *)puVar2)[0] >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(ushort *)puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(ushort *)puVar2 >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (puVar2[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (puVar2[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- puVar2[0] >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*puVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*puVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *puVar2 >> 15
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- (*(byte *)((char *)puVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
|
- *(byte *)((char *)puVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar2)->is_quant
)
...>
}

@field_31_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- ((ushort *)puVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- puVar2[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- *(byte *)((char *)puVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
|
- (byte)puVar2[1] & 0x7f
+ ((uw_object_hdr_t *)puVar2)->zpos
)
...>
}

@field_31_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (((ushort *)puVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (puVar2[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar2)->heading
|
- (puVar2[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar2)->heading
)
...>
}

@field_31_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (((ushort *)puVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (puVar2[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (puVar2[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar2)->ypos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar2)->ypos
)
...>
}

@field_31_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(ushort *)((char *)puVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- *(ushort *)((char *)puVar2 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (((ushort *)puVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- ((ushort *)puVar2)[1] >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (puVar2[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (puVar2[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- puVar2[1] >> 13
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- (*(byte *)((char *)puVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
|
- *(byte *)((char *)puVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar2)->xpos
)
...>
}

@field_31_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- ((ushort *)puVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- puVar2[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- *(byte *)((char *)puVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
|
- (byte)puVar2[2] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->quality
)
...>
}

@field_31_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (*(ushort *)((char *)puVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- *(ushort *)((char *)puVar2 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (((ushort *)puVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- ((ushort *)puVar2)[2] >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- (puVar2[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->next
|
- (puVar2[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->next
|
- puVar2[2] >> 6
+ ((uw_object_hdr_t *)puVar2)->next
)
...>
}

@field_31_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- ((ushort *)puVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- puVar2[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- *(byte *)((char *)puVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
|
- (byte)puVar2[3] & 0x3f
+ ((uw_object_hdr_t *)puVar2)->owner
)
...>
}

@field_31_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (*(ushort *)((char *)puVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- *(ushort *)((char *)puVar2 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (((ushort *)puVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- ((ushort *)puVar2)[3] >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- (puVar2[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar2)->link
|
- (puVar2[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar2)->link
|
- puVar2[3] >> 6
+ ((uw_object_hdr_t *)puVar2)->link
)
...>
}

@barter_click_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)obj_rec)->object_id
|
- ((ushort *)obj_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)obj_rec)->object_id
|
- *(ushort *)obj_rec & 0x1ff
+ ((uw_object_hdr_t *)obj_rec)->object_id
)
...>
}

@barter_click_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (*(ushort *)((char *)obj_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (((ushort *)obj_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (((ushort *)obj_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (*(ushort *)obj_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (*(ushort *)obj_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (*(byte *)((char *)obj_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->flags_res
|
- (*(byte *)((char *)obj_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)obj_rec)->flags_res
)
...>
}

@barter_click_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (*(ushort *)((char *)obj_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (((ushort *)obj_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (((ushort *)obj_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (*(ushort *)obj_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (*(ushort *)obj_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (*(byte *)((char *)obj_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->enchanted
|
- (*(byte *)((char *)obj_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)obj_rec)->enchanted
)
...>
}

@barter_click_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (*(ushort *)((char *)obj_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (((ushort *)obj_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (((ushort *)obj_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (*(ushort *)obj_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (*(ushort *)obj_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (*(byte *)((char *)obj_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->doordir
|
- (*(byte *)((char *)obj_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)obj_rec)->doordir
)
...>
}

@barter_click_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (*(ushort *)((char *)obj_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (((ushort *)obj_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (((ushort *)obj_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (*(ushort *)obj_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (*(ushort *)obj_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (*(byte *)((char *)obj_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->invisible
|
- (*(byte *)((char *)obj_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)obj_rec)->invisible
)
...>
}

@barter_click_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (*(ushort *)((char *)obj_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (((ushort *)obj_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (((ushort *)obj_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (*(ushort *)obj_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (*(ushort *)obj_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (*(byte *)((char *)obj_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- (*(byte *)((char *)obj_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)obj_rec)->is_quant
|
- *(byte *)((char *)obj_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)obj_rec)->is_quant
)
...>
}

@barter_click_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj_rec)->zpos
|
- ((ushort *)obj_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)obj_rec)->zpos
|
- *(byte *)((char *)obj_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj_rec)->zpos
)
...>
}

@barter_click_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->heading
|
- (*(ushort *)((char *)obj_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)obj_rec)->heading
|
- (((ushort *)obj_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->heading
|
- (((ushort *)obj_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)obj_rec)->heading
)
...>
}

@barter_click_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->ypos
|
- (*(ushort *)((char *)obj_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj_rec)->ypos
|
- (((ushort *)obj_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->ypos
|
- (((ushort *)obj_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj_rec)->ypos
|
- (*(byte *)((char *)obj_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->ypos
|
- (*(byte *)((char *)obj_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)obj_rec)->ypos
)
...>
}

@barter_click_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->xpos
|
- (*(ushort *)((char *)obj_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj_rec)->xpos
|
- (((ushort *)obj_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->xpos
|
- (((ushort *)obj_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj_rec)->xpos
|
- (*(byte *)((char *)obj_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)obj_rec)->xpos
|
- (*(byte *)((char *)obj_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)obj_rec)->xpos
|
- *(byte *)((char *)obj_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)obj_rec)->xpos
)
...>
}

@barter_click_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj_rec)->quality
|
- ((ushort *)obj_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)obj_rec)->quality
|
- *(byte *)((char *)obj_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj_rec)->quality
)
...>
}

@barter_click_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_rec)->next
|
- (*(ushort *)((char *)obj_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_rec)->next
|
- (((ushort *)obj_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_rec)->next
|
- (((ushort *)obj_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_rec)->next
)
...>
}

@barter_click_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj_rec)->owner
|
- ((ushort *)obj_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)obj_rec)->owner
|
- *(byte *)((char *)obj_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj_rec)->owner
)
...>
}

@barter_click_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_rec)->link
|
- (*(ushort *)((char *)obj_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_rec)->link
|
- (((ushort *)obj_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_rec)->link
|
- (((ushort *)obj_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_rec)->link
)
...>
}

@barter_click_field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)split_rec)->object_id
|
- ((ushort *)split_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)split_rec)->object_id
|
- *(ushort *)split_rec & 0x1ff
+ ((uw_object_hdr_t *)split_rec)->object_id
)
...>
}

@barter_click_field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (*(ushort *)((char *)split_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (((ushort *)split_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (((ushort *)split_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (*(ushort *)split_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (*(ushort *)split_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (*(byte *)((char *)split_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)split_rec)->flags_res
|
- (*(byte *)((char *)split_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)split_rec)->flags_res
)
...>
}

@barter_click_field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (*(ushort *)((char *)split_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (((ushort *)split_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (((ushort *)split_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (*(ushort *)split_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (*(ushort *)split_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (*(byte *)((char *)split_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)split_rec)->enchanted
|
- (*(byte *)((char *)split_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)split_rec)->enchanted
)
...>
}

@barter_click_field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (*(ushort *)((char *)split_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (((ushort *)split_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (((ushort *)split_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (*(ushort *)split_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (*(ushort *)split_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (*(byte *)((char *)split_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)split_rec)->doordir
|
- (*(byte *)((char *)split_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)split_rec)->doordir
)
...>
}

@barter_click_field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (*(ushort *)((char *)split_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (((ushort *)split_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (((ushort *)split_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (*(ushort *)split_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (*(ushort *)split_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (*(byte *)((char *)split_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)split_rec)->invisible
|
- (*(byte *)((char *)split_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)split_rec)->invisible
)
...>
}

@barter_click_field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (*(ushort *)((char *)split_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (((ushort *)split_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (((ushort *)split_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (*(ushort *)split_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (*(ushort *)split_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (*(byte *)((char *)split_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- (*(byte *)((char *)split_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)split_rec)->is_quant
|
- *(byte *)((char *)split_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)split_rec)->is_quant
)
...>
}

@barter_click_field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)split_rec)->zpos
|
- ((ushort *)split_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)split_rec)->zpos
|
- *(byte *)((char *)split_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)split_rec)->zpos
)
...>
}

@barter_click_field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)split_rec)->heading
|
- (*(ushort *)((char *)split_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)split_rec)->heading
|
- (((ushort *)split_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)split_rec)->heading
|
- (((ushort *)split_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)split_rec)->heading
)
...>
}

@barter_click_field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)split_rec)->ypos
|
- (*(ushort *)((char *)split_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)split_rec)->ypos
|
- (((ushort *)split_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)split_rec)->ypos
|
- (((ushort *)split_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)split_rec)->ypos
|
- (*(byte *)((char *)split_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)split_rec)->ypos
|
- (*(byte *)((char *)split_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)split_rec)->ypos
)
...>
}

@barter_click_field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)split_rec)->xpos
|
- (*(ushort *)((char *)split_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)split_rec)->xpos
|
- (((ushort *)split_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)split_rec)->xpos
|
- (((ushort *)split_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)split_rec)->xpos
|
- (*(byte *)((char *)split_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)split_rec)->xpos
|
- (*(byte *)((char *)split_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)split_rec)->xpos
|
- *(byte *)((char *)split_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)split_rec)->xpos
)
...>
}

@barter_click_field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)split_rec)->quality
|
- ((ushort *)split_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)split_rec)->quality
|
- *(byte *)((char *)split_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)split_rec)->quality
)
...>
}

@barter_click_field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)split_rec)->next
|
- (*(ushort *)((char *)split_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)split_rec)->next
|
- (((ushort *)split_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)split_rec)->next
|
- (((ushort *)split_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)split_rec)->next
)
...>
}

@barter_click_field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)split_rec)->owner
|
- ((ushort *)split_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)split_rec)->owner
|
- *(byte *)((char *)split_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)split_rec)->owner
)
...>
}

@barter_click_field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)split_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)split_rec)->link
|
- (*(ushort *)((char *)split_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)split_rec)->link
|
- (((ushort *)split_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)split_rec)->link
|
- (((ushort *)split_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)split_rec)->link
)
...>
}

@barter_click_field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)obj_ptr)->object_id
|
- ((ushort *)obj_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)obj_ptr)->object_id
|
- *(ushort *)obj_ptr & 0x1ff
+ ((uw_object_hdr_t *)obj_ptr)->object_id
)
...>
}

@barter_click_field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (*(ushort *)((char *)obj_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (((ushort *)obj_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (((ushort *)obj_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (*(ushort *)obj_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (*(ushort *)obj_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (*(byte *)((char *)obj_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
|
- (*(byte *)((char *)obj_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)obj_ptr)->flags_res
)
...>
}

@barter_click_field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (*(ushort *)((char *)obj_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (((ushort *)obj_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (((ushort *)obj_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (*(ushort *)obj_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (*(ushort *)obj_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (*(byte *)((char *)obj_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
|
- (*(byte *)((char *)obj_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)obj_ptr)->enchanted
)
...>
}

@barter_click_field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (*(ushort *)((char *)obj_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (((ushort *)obj_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (((ushort *)obj_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (*(ushort *)obj_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (*(ushort *)obj_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (*(byte *)((char *)obj_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->doordir
|
- (*(byte *)((char *)obj_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)obj_ptr)->doordir
)
...>
}

@barter_click_field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (*(ushort *)((char *)obj_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (((ushort *)obj_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (((ushort *)obj_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (*(ushort *)obj_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (*(ushort *)obj_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (*(byte *)((char *)obj_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->invisible
|
- (*(byte *)((char *)obj_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)obj_ptr)->invisible
)
...>
}

@barter_click_field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (*(ushort *)((char *)obj_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (((ushort *)obj_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (((ushort *)obj_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (*(ushort *)obj_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (*(ushort *)obj_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (*(byte *)((char *)obj_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- (*(byte *)((char *)obj_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
|
- *(byte *)((char *)obj_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)obj_ptr)->is_quant
)
...>
}

@barter_click_field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj_ptr)->zpos
|
- ((ushort *)obj_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)obj_ptr)->zpos
|
- *(byte *)((char *)obj_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)obj_ptr)->zpos
)
...>
}

@barter_click_field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->heading
|
- (*(ushort *)((char *)obj_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)obj_ptr)->heading
|
- (((ushort *)obj_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->heading
|
- (((ushort *)obj_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)obj_ptr)->heading
)
...>
}

@barter_click_field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->ypos
|
- (*(ushort *)((char *)obj_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj_ptr)->ypos
|
- (((ushort *)obj_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->ypos
|
- (((ushort *)obj_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)obj_ptr)->ypos
|
- (*(byte *)((char *)obj_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->ypos
|
- (*(byte *)((char *)obj_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)obj_ptr)->ypos
)
...>
}

@barter_click_field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->xpos
|
- (*(ushort *)((char *)obj_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj_ptr)->xpos
|
- (((ushort *)obj_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->xpos
|
- (((ushort *)obj_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)obj_ptr)->xpos
|
- (*(byte *)((char *)obj_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)obj_ptr)->xpos
|
- (*(byte *)((char *)obj_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)obj_ptr)->xpos
|
- *(byte *)((char *)obj_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)obj_ptr)->xpos
)
...>
}

@barter_click_field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj_ptr)->quality
|
- ((ushort *)obj_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)obj_ptr)->quality
|
- *(byte *)((char *)obj_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)obj_ptr)->quality
)
...>
}

@barter_click_field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_ptr)->next
|
- (*(ushort *)((char *)obj_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_ptr)->next
|
- (((ushort *)obj_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_ptr)->next
|
- (((ushort *)obj_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_ptr)->next
)
...>
}

@barter_click_field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj_ptr)->owner
|
- ((ushort *)obj_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)obj_ptr)->owner
|
- *(byte *)((char *)obj_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)obj_ptr)->owner
)
...>
}

@barter_click_field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)obj_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_ptr)->link
|
- (*(ushort *)((char *)obj_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_ptr)->link
|
- (((ushort *)obj_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)obj_ptr)->link
|
- (((ushort *)obj_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)obj_ptr)->link
)
...>
}

@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (*(byte *)((char *)held_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)held_object)->flags_res
|
- (*(byte *)((char *)held_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)held_object)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (*(byte *)((char *)held_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)held_object)->enchanted
|
- (*(byte *)((char *)held_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)held_object)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (*(byte *)((char *)held_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)held_object)->doordir
|
- (*(byte *)((char *)held_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)held_object)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (*(byte *)((char *)held_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)held_object)->invisible
|
- (*(byte *)((char *)held_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)held_object)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (((ushort *)held_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (((ushort *)held_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(ushort *)held_object >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object)->is_quant
|
- (*(ushort *)held_object & 0x8000) >> 15
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

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- *(byte *)((char *)held_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (*(byte *)((char *)held_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)held_object)->ypos
|
- (*(byte *)((char *)held_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)held_object)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (((ushort *)held_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object)->xpos
|
- (((ushort *)held_object)[1] & 0xe000) >> 13
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

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- *(byte *)((char *)held_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (((ushort *)held_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->next
|
- (((ushort *)held_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- *(byte *)((char *)held_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
- (((ushort *)held_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object)->link
|
- (((ushort *)held_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object)->link
)
...>
}

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)held_object_ptr)->object_id
|
- ((ushort *)held_object_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)held_object_ptr)->object_id
|
- *(ushort *)held_object_ptr & 0x1ff
+ ((uw_object_hdr_t *)held_object_ptr)->object_id
|
- *(ushort *)(held_object_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)held_object_ptr)->object_id
)
...>
}

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(ushort *)((char *)held_object_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (((ushort *)held_object_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (((ushort *)held_object_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(ushort *)held_object_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(ushort *)held_object_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(ushort *)(held_object_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(ushort *)(held_object_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(byte *)((char *)held_object_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(byte *)((char *)held_object_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(byte *)(held_object_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
|
- (*(byte *)(held_object_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)held_object_ptr)->flags_res
)
...>
}

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(ushort *)((char *)held_object_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (((ushort *)held_object_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (((ushort *)held_object_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(ushort *)held_object_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(ushort *)held_object_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(ushort *)(held_object_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(ushort *)(held_object_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(byte *)((char *)held_object_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(byte *)((char *)held_object_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(byte *)(held_object_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
|
- (*(byte *)(held_object_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)held_object_ptr)->enchanted
)
...>
}

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(ushort *)((char *)held_object_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (((ushort *)held_object_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (((ushort *)held_object_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(ushort *)held_object_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(ushort *)held_object_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(ushort *)(held_object_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(ushort *)(held_object_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(byte *)((char *)held_object_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(byte *)((char *)held_object_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(byte *)(held_object_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
|
- (*(byte *)(held_object_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)held_object_ptr)->doordir
)
...>
}

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(ushort *)((char *)held_object_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (((ushort *)held_object_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (((ushort *)held_object_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(ushort *)held_object_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(ushort *)held_object_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(ushort *)(held_object_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(ushort *)(held_object_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(byte *)((char *)held_object_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(byte *)((char *)held_object_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(byte *)(held_object_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
|
- (*(byte *)(held_object_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->invisible
)
...>
}

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(ushort *)((char *)held_object_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (((ushort *)held_object_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (((ushort *)held_object_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(ushort *)held_object_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(ushort *)held_object_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(ushort *)(held_object_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(ushort *)(held_object_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(byte *)((char *)held_object_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(byte *)((char *)held_object_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- *(byte *)((char *)held_object_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(byte *)(held_object_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- (*(byte *)(held_object_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
|
- *(byte *)(held_object_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object_ptr)->zpos
|
- ((ushort *)held_object_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)held_object_ptr)->zpos
|
- *(ushort *)(held_object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object_ptr)->zpos
|
- *(byte *)((char *)held_object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object_ptr)->zpos
|
- *(byte *)(held_object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)held_object_ptr)->zpos
)
...>
}

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->heading
|
- (*(ushort *)((char *)held_object_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->heading
|
- (((ushort *)held_object_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->heading
|
- (((ushort *)held_object_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->heading
|
- (*(ushort *)(held_object_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->heading
|
- (*(ushort *)(held_object_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)held_object_ptr)->heading
)
...>
}

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(ushort *)((char *)held_object_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (((ushort *)held_object_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (((ushort *)held_object_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(ushort *)(held_object_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(ushort *)(held_object_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(byte *)((char *)held_object_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(byte *)((char *)held_object_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(byte *)(held_object_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
|
- (*(byte *)(held_object_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)held_object_ptr)->ypos
)
...>
}

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(ushort *)((char *)held_object_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (((ushort *)held_object_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (((ushort *)held_object_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(ushort *)(held_object_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(ushort *)(held_object_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(byte *)((char *)held_object_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(byte *)((char *)held_object_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- *(byte *)((char *)held_object_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(byte *)(held_object_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- (*(byte *)(held_object_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
|
- *(byte *)(held_object_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)held_object_ptr)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->quality
|
- ((ushort *)held_object_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->quality
|
- *(ushort *)(held_object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->quality
|
- *(byte *)((char *)held_object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->quality
|
- *(byte *)(held_object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->quality
)
...>
}

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object_ptr)->next
|
- (*(ushort *)((char *)held_object_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->next
|
- (((ushort *)held_object_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object_ptr)->next
|
- (((ushort *)held_object_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->next
|
- (*(ushort *)(held_object_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object_ptr)->next
|
- (*(ushort *)(held_object_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->next
)
...>
}

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->owner
|
- ((ushort *)held_object_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->owner
|
- *(ushort *)(held_object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->owner
|
- *(byte *)((char *)held_object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->owner
|
- *(byte *)(held_object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)held_object_ptr)->owner
)
...>
}

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)held_object_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object_ptr)->link
|
- (*(ushort *)((char *)held_object_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->link
|
- (((ushort *)held_object_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object_ptr)->link
|
- (((ushort *)held_object_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->link
|
- (*(ushort *)(held_object_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)held_object_ptr)->link
|
- (*(ushort *)(held_object_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)held_object_ptr)->link
)
...>
}

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- ((ushort *)object)[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- *(ushort *)object & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- object[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- *object & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)((char *)object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)((char *)object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)((char *)object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)((char *)object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)((char *)object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(byte *)((char *)object + 0x1) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- ((ushort *)object)[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- *(byte *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- (byte)object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (*(ushort *)((char *)object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(ushort *)((char *)object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(ushort *)((char *)object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object)->xpos
|
- *(byte *)((char *)object + 0x3) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- ((ushort *)object)[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- *(byte *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- (byte)object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (*(ushort *)((char *)object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- ((ushort *)object)[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- *(byte *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- (byte)object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (*(ushort *)((char *)object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)target)->object_id
|
- ((ushort *)target)[0] & 0x1ff
+ ((uw_object_hdr_t *)target)->object_id
|
- *(ushort *)target & 0x1ff
+ ((uw_object_hdr_t *)target)->object_id
|
- target[0] & 0x1ff
+ ((uw_object_hdr_t *)target)->object_id
|
- *target & 0x1ff
+ ((uw_object_hdr_t *)target)->object_id
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(ushort *)((char *)target + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (((ushort *)target)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (((ushort *)target)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(ushort *)target >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(ushort *)target & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (target[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (target[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*target >> 9) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*target & 0xe00) >> 9
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(byte *)((char *)target + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)target)->flags_res
|
- (*(byte *)((char *)target + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)target)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(ushort *)((char *)target + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (((ushort *)target)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (((ushort *)target)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(ushort *)target >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(ushort *)target & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (target[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (target[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*target >> 12) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*target & 0x1000) >> 12
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(byte *)((char *)target + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)target)->enchanted
|
- (*(byte *)((char *)target + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)target)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(ushort *)((char *)target + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (((ushort *)target)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (((ushort *)target)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(ushort *)target >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(ushort *)target & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (target[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (target[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (*target >> 13) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*target & 0x2000) >> 13
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(byte *)((char *)target + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)target)->doordir
|
- (*(byte *)((char *)target + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)target)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(ushort *)((char *)target + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (((ushort *)target)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (((ushort *)target)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(ushort *)target >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(ushort *)target & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (target[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (target[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (*target >> 14) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*target & 0x4000) >> 14
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(byte *)((char *)target + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)target)->invisible
|
- (*(byte *)((char *)target + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)target)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)((char *)target + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (((ushort *)target)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (((ushort *)target)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)target >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)target & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (target[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (target[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*target >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*target & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(byte *)((char *)target + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(byte *)((char *)target + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)target)->is_quant
|
- *(byte *)((char *)target + 0x1) >> 7
+ ((uw_object_hdr_t *)target)->is_quant
)
...>
}

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- ((ushort *)target)[1] & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- target[1] & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- *(byte *)((char *)target + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
|
- (byte)target[1] & 0x7f
+ ((uw_object_hdr_t *)target)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)target)->heading
|
- (*(ushort *)((char *)target + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)target)->heading
|
- (((ushort *)target)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)target)->heading
|
- (((ushort *)target)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)target)->heading
|
- (target[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)target)->heading
|
- (target[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)target)->heading
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (*(ushort *)((char *)target + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target)->ypos
|
- (((ushort *)target)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (((ushort *)target)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target)->ypos
|
- (target[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (target[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target)->ypos
|
- (*(byte *)((char *)target + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)target)->ypos
|
- (*(byte *)((char *)target + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)target)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (*(ushort *)((char *)target + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (((ushort *)target)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (((ushort *)target)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (target[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (target[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (*(byte *)((char *)target + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (*(byte *)((char *)target + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)target)->xpos
|
- *(byte *)((char *)target + 0x3) >> 5
+ ((uw_object_hdr_t *)target)->xpos
)
...>
}

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- ((ushort *)target)[2] & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- target[2] & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- *(byte *)((char *)target + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target)->quality
|
- (byte)target[2] & 0x3f
+ ((uw_object_hdr_t *)target)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (*(ushort *)((char *)target + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- (((ushort *)target)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (((ushort *)target)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- (target[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (target[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- ((ushort *)target)[3] & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- target[3] & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- *(byte *)((char *)target + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target)->owner
|
- (byte)target[3] & 0x3f
+ ((uw_object_hdr_t *)target)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (*(ushort *)((char *)target + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- (((ushort *)target)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (((ushort *)target)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- (target[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (target[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
)
...>
}

@field_7_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- ((ushort *)puVar8)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- *(ushort *)puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (((ushort *)puVar8)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (((ushort *)puVar8)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)puVar8 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(ushort *)puVar8 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(byte *)((char *)puVar8 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*(byte *)((char *)puVar8 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar8)->flags_res
)
...>
}

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (((ushort *)puVar8)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (((ushort *)puVar8)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)puVar8 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(ushort *)puVar8 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(byte *)((char *)puVar8 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar8)->enchanted
)
...>
}

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (((ushort *)puVar8)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (((ushort *)puVar8)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)puVar8 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(ushort *)puVar8 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(byte *)((char *)puVar8 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar8)->doordir
)
...>
}

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (((ushort *)puVar8)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (((ushort *)puVar8)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)puVar8 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(ushort *)puVar8 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(byte *)((char *)puVar8 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar8)->invisible
)
...>
}

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)((char *)puVar8 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(byte *)((char *)puVar8 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(byte *)((char *)puVar8 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(byte *)((char *)puVar8 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar8)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- ((ushort *)puVar8)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- *(byte *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
)
...>
}

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (((ushort *)puVar8)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (((ushort *)puVar8)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
)
...>
}

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (((ushort *)puVar8)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (((ushort *)puVar8)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(byte *)((char *)puVar8 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (*(byte *)((char *)puVar8 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar8)->ypos
)
...>
}

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(ushort *)((char *)puVar8 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(byte *)((char *)puVar8 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (*(byte *)((char *)puVar8 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- *(byte *)((char *)puVar8 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar8)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- ((ushort *)puVar8)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- *(byte *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
)
...>
}

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (*(ushort *)((char *)puVar8 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
)
...>
}

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- ((ushort *)puVar8)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- *(byte *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
)
...>
}

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar8 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (*(ushort *)((char *)puVar8 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
)
...>
}

@field_8_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)found_item)->object_id
|
- ((ushort *)found_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)found_item)->object_id
|
- *(ushort *)found_item & 0x1ff
+ ((uw_object_hdr_t *)found_item)->object_id
|
- found_item[0] & 0x1ff
+ ((uw_object_hdr_t *)found_item)->object_id
|
- *found_item & 0x1ff
+ ((uw_object_hdr_t *)found_item)->object_id
)
...>
}

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(ushort *)((char *)found_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (((ushort *)found_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (((ushort *)found_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(ushort *)found_item >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(ushort *)found_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (found_item[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (found_item[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*found_item >> 9) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*found_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(byte *)((char *)found_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)found_item)->flags_res
|
- (*(byte *)((char *)found_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)found_item)->flags_res
)
...>
}

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(ushort *)((char *)found_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (((ushort *)found_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (((ushort *)found_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(ushort *)found_item >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(ushort *)found_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (found_item[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (found_item[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*found_item >> 12) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*found_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(byte *)((char *)found_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)found_item)->enchanted
|
- (*(byte *)((char *)found_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)found_item)->enchanted
)
...>
}

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(ushort *)((char *)found_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (((ushort *)found_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (((ushort *)found_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(ushort *)found_item >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(ushort *)found_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (found_item[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (found_item[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*found_item >> 13) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*found_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(byte *)((char *)found_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)found_item)->doordir
|
- (*(byte *)((char *)found_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)found_item)->doordir
)
...>
}

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(ushort *)((char *)found_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (((ushort *)found_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (((ushort *)found_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(ushort *)found_item >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(ushort *)found_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (found_item[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (found_item[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*found_item >> 14) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*found_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(byte *)((char *)found_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)found_item)->invisible
|
- (*(byte *)((char *)found_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)found_item)->invisible
)
...>
}

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(ushort *)((char *)found_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *(ushort *)((char *)found_item + 0x0) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (((ushort *)found_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (((ushort *)found_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- ((ushort *)found_item)[0] >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(ushort *)found_item >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(ushort *)found_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *(ushort *)found_item >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (found_item[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (found_item[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- found_item[0] >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*found_item >> 15) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*found_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *found_item >> 15
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(byte *)((char *)found_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- (*(byte *)((char *)found_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)found_item)->is_quant
|
- *(byte *)((char *)found_item + 0x1) >> 7
+ ((uw_object_hdr_t *)found_item)->is_quant
)
...>
}

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- ((ushort *)found_item)[1] & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- found_item[1] & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- *(byte *)((char *)found_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
|
- (byte)found_item[1] & 0x7f
+ ((uw_object_hdr_t *)found_item)->zpos
)
...>
}

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (*(ushort *)((char *)found_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (((ushort *)found_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (((ushort *)found_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (found_item[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)found_item)->heading
|
- (found_item[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)found_item)->heading
)
...>
}

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (*(ushort *)((char *)found_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (((ushort *)found_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (((ushort *)found_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (found_item[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (found_item[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (*(byte *)((char *)found_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)found_item)->ypos
|
- (*(byte *)((char *)found_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)found_item)->ypos
)
...>
}

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (*(ushort *)((char *)found_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- *(ushort *)((char *)found_item + 0x2) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (((ushort *)found_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (((ushort *)found_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- ((ushort *)found_item)[1] >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (found_item[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (found_item[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- found_item[1] >> 13
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (*(byte *)((char *)found_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)found_item)->xpos
|
- (*(byte *)((char *)found_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)found_item)->xpos
|
- *(byte *)((char *)found_item + 0x3) >> 5
+ ((uw_object_hdr_t *)found_item)->xpos
)
...>
}

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- ((ushort *)found_item)[2] & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- found_item[2] & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- *(byte *)((char *)found_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
|
- (byte)found_item[2] & 0x3f
+ ((uw_object_hdr_t *)found_item)->quality
)
...>
}

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->next
|
- (*(ushort *)((char *)found_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- *(ushort *)((char *)found_item + 0x4) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- (((ushort *)found_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->next
|
- (((ushort *)found_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- ((ushort *)found_item)[2] >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- (found_item[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->next
|
- (found_item[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->next
|
- found_item[2] >> 6
+ ((uw_object_hdr_t *)found_item)->next
)
...>
}

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- ((ushort *)found_item)[3] & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- found_item[3] & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- *(byte *)((char *)found_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
|
- (byte)found_item[3] & 0x3f
+ ((uw_object_hdr_t *)found_item)->owner
)
...>
}

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->link
|
- (*(ushort *)((char *)found_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- *(ushort *)((char *)found_item + 0x6) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- (((ushort *)found_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->link
|
- (((ushort *)found_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- ((ushort *)found_item)[3] >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- (found_item[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found_item)->link
|
- (found_item[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found_item)->link
|
- found_item[3] >> 6
+ ((uw_object_hdr_t *)found_item)->link
)
...>
}

@field_9_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@field_10_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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

@field_11_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->object_id
|
- ((ushort *)equip_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->object_id
|
- *(ushort *)equip_object & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->object_id
|
- equip_object[0] & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->object_id
|
- *equip_object & 0x1ff
+ ((uw_object_hdr_t *)equip_object)->object_id
)
...>
}

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(ushort *)((char *)equip_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (((ushort *)equip_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (((ushort *)equip_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(ushort *)equip_object >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(ushort *)equip_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (equip_object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (equip_object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*equip_object >> 9) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*equip_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(byte *)((char *)equip_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)equip_object)->flags_res
|
- (*(byte *)((char *)equip_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)equip_object)->flags_res
)
...>
}

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (((ushort *)equip_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (((ushort *)equip_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(ushort *)equip_object >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(ushort *)equip_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (equip_object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (equip_object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*equip_object >> 12) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*equip_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(byte *)((char *)equip_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)equip_object)->enchanted
|
- (*(byte *)((char *)equip_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)equip_object)->enchanted
)
...>
}

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (((ushort *)equip_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (((ushort *)equip_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(ushort *)equip_object >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(ushort *)equip_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (equip_object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (equip_object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*equip_object >> 13) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*equip_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(byte *)((char *)equip_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)equip_object)->doordir
|
- (*(byte *)((char *)equip_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)equip_object)->doordir
)
...>
}

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (((ushort *)equip_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (((ushort *)equip_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(ushort *)equip_object >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(ushort *)equip_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (equip_object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (equip_object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*equip_object >> 14) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*equip_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(byte *)((char *)equip_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)equip_object)->invisible
|
- (*(byte *)((char *)equip_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)equip_object)->invisible
)
...>
}

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(ushort *)((char *)equip_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *(ushort *)((char *)equip_object + 0x0) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (((ushort *)equip_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (((ushort *)equip_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- ((ushort *)equip_object)[0] >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(ushort *)equip_object >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(ushort *)equip_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *(ushort *)equip_object >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (equip_object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (equip_object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- equip_object[0] >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*equip_object >> 15) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*equip_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *equip_object >> 15
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(byte *)((char *)equip_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- (*(byte *)((char *)equip_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)equip_object)->is_quant
|
- *(byte *)((char *)equip_object + 0x1) >> 7
+ ((uw_object_hdr_t *)equip_object)->is_quant
)
...>
}

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- ((ushort *)equip_object)[1] & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- equip_object[1] & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- *(byte *)((char *)equip_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
|
- (byte)equip_object[1] & 0x7f
+ ((uw_object_hdr_t *)equip_object)->zpos
)
...>
}

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (*(ushort *)((char *)equip_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (((ushort *)equip_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (((ushort *)equip_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (equip_object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)equip_object)->heading
|
- (equip_object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)equip_object)->heading
)
...>
}

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (*(ushort *)((char *)equip_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (((ushort *)equip_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (((ushort *)equip_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (equip_object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (equip_object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (*(byte *)((char *)equip_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)equip_object)->ypos
|
- (*(byte *)((char *)equip_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)equip_object)->ypos
)
...>
}

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (*(ushort *)((char *)equip_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- *(ushort *)((char *)equip_object + 0x2) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (((ushort *)equip_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (((ushort *)equip_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- ((ushort *)equip_object)[1] >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (equip_object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (equip_object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- equip_object[1] >> 13
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (*(byte *)((char *)equip_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- (*(byte *)((char *)equip_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)equip_object)->xpos
|
- *(byte *)((char *)equip_object + 0x3) >> 5
+ ((uw_object_hdr_t *)equip_object)->xpos
)
...>
}

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- ((ushort *)equip_object)[2] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- equip_object[2] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- *(byte *)((char *)equip_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
|
- (byte)equip_object[2] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->quality
)
...>
}

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->next
|
- (*(ushort *)((char *)equip_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- *(ushort *)((char *)equip_object + 0x4) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- (((ushort *)equip_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->next
|
- (((ushort *)equip_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- ((ushort *)equip_object)[2] >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- (equip_object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->next
|
- (equip_object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->next
|
- equip_object[2] >> 6
+ ((uw_object_hdr_t *)equip_object)->next
)
...>
}

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- ((ushort *)equip_object)[3] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- equip_object[3] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- *(byte *)((char *)equip_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
|
- (byte)equip_object[3] & 0x3f
+ ((uw_object_hdr_t *)equip_object)->owner
)
...>
}

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)equip_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->link
|
- (*(ushort *)((char *)equip_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- *(ushort *)((char *)equip_object + 0x6) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- (((ushort *)equip_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->link
|
- (((ushort *)equip_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- ((ushort *)equip_object)[3] >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- (equip_object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)equip_object)->link
|
- (equip_object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)equip_object)->link
|
- equip_object[3] >> 6
+ ((uw_object_hdr_t *)equip_object)->link
)
...>
}

@field_12_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@field_13_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_a)->object_id
|
- ((ushort *)object_a)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_a)->object_id
|
- *(ushort *)object_a & 0x1ff
+ ((uw_object_hdr_t *)object_a)->object_id
)
...>
}

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(ushort *)((char *)object_a + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (((ushort *)object_a)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (((ushort *)object_a)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(ushort *)object_a >> 9) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(ushort *)object_a & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(byte *)((char *)object_a + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_a)->flags_res
|
- (*(byte *)((char *)object_a + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_a)->flags_res
)
...>
}

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(ushort *)((char *)object_a + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (((ushort *)object_a)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (((ushort *)object_a)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(ushort *)object_a >> 12) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(ushort *)object_a & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(byte *)((char *)object_a + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_a)->enchanted
|
- (*(byte *)((char *)object_a + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_a)->enchanted
)
...>
}

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(ushort *)((char *)object_a + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (((ushort *)object_a)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (((ushort *)object_a)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(ushort *)object_a >> 13) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(ushort *)object_a & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(byte *)((char *)object_a + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_a)->doordir
|
- (*(byte *)((char *)object_a + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_a)->doordir
)
...>
}

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(ushort *)((char *)object_a + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (((ushort *)object_a)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (((ushort *)object_a)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(ushort *)object_a >> 14) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(ushort *)object_a & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(byte *)((char *)object_a + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_a)->invisible
|
- (*(byte *)((char *)object_a + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_a)->invisible
)
...>
}

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(ushort *)((char *)object_a + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (((ushort *)object_a)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (((ushort *)object_a)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(ushort *)object_a >> 15) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(ushort *)object_a & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(byte *)((char *)object_a + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- (*(byte *)((char *)object_a + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_a)->is_quant
|
- *(byte *)((char *)object_a + 0x1) >> 7
+ ((uw_object_hdr_t *)object_a)->is_quant
)
...>
}

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_a)->zpos
|
- ((ushort *)object_a)[1] & 0x7f
+ ((uw_object_hdr_t *)object_a)->zpos
|
- *(byte *)((char *)object_a + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_a)->zpos
)
...>
}

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_a)->heading
|
- (*(ushort *)((char *)object_a + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_a)->heading
|
- (((ushort *)object_a)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_a)->heading
|
- (((ushort *)object_a)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_a)->heading
)
...>
}

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (*(ushort *)((char *)object_a + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (((ushort *)object_a)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (((ushort *)object_a)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (*(byte *)((char *)object_a + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_a)->ypos
|
- (*(byte *)((char *)object_a + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_a)->ypos
)
...>
}

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (*(ushort *)((char *)object_a + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (((ushort *)object_a)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (((ushort *)object_a)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (*(byte *)((char *)object_a + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_a)->xpos
|
- (*(byte *)((char *)object_a + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_a)->xpos
|
- *(byte *)((char *)object_a + 0x3) >> 5
+ ((uw_object_hdr_t *)object_a)->xpos
)
...>
}

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_a)->quality
|
- ((ushort *)object_a)[2] & 0x3f
+ ((uw_object_hdr_t *)object_a)->quality
|
- *(byte *)((char *)object_a + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_a)->quality
)
...>
}

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->next
|
- (*(ushort *)((char *)object_a + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->next
|
- (((ushort *)object_a)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->next
|
- (((ushort *)object_a)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->next
)
...>
}

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_a)->owner
|
- ((ushort *)object_a)[3] & 0x3f
+ ((uw_object_hdr_t *)object_a)->owner
|
- *(byte *)((char *)object_a + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_a)->owner
)
...>
}

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_a + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->link
|
- (*(ushort *)((char *)object_a + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->link
|
- (((ushort *)object_a)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_a)->link
|
- (((ushort *)object_a)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_a)->link
)
...>
}

@field_14_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_b)->object_id
|
- ((ushort *)object_b)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_b)->object_id
|
- *(ushort *)object_b & 0x1ff
+ ((uw_object_hdr_t *)object_b)->object_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(ushort *)((char *)object_b + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (((ushort *)object_b)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (((ushort *)object_b)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(ushort *)object_b >> 9) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(ushort *)object_b & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(byte *)((char *)object_b + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_b)->flags_res
|
- (*(byte *)((char *)object_b + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_b)->flags_res
)
...>
}

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(ushort *)((char *)object_b + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (((ushort *)object_b)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (((ushort *)object_b)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(ushort *)object_b >> 12) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(ushort *)object_b & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(byte *)((char *)object_b + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_b)->enchanted
|
- (*(byte *)((char *)object_b + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_b)->enchanted
)
...>
}

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(ushort *)((char *)object_b + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (((ushort *)object_b)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (((ushort *)object_b)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(ushort *)object_b >> 13) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(ushort *)object_b & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(byte *)((char *)object_b + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_b)->doordir
|
- (*(byte *)((char *)object_b + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_b)->doordir
)
...>
}

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(ushort *)((char *)object_b + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (((ushort *)object_b)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (((ushort *)object_b)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(ushort *)object_b >> 14) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(ushort *)object_b & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(byte *)((char *)object_b + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_b)->invisible
|
- (*(byte *)((char *)object_b + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_b)->invisible
)
...>
}

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(ushort *)((char *)object_b + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (((ushort *)object_b)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (((ushort *)object_b)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(ushort *)object_b >> 15) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(ushort *)object_b & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(byte *)((char *)object_b + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- (*(byte *)((char *)object_b + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_b)->is_quant
|
- *(byte *)((char *)object_b + 0x1) >> 7
+ ((uw_object_hdr_t *)object_b)->is_quant
)
...>
}

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_b)->zpos
|
- ((ushort *)object_b)[1] & 0x7f
+ ((uw_object_hdr_t *)object_b)->zpos
|
- *(byte *)((char *)object_b + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_b)->zpos
)
...>
}

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_b)->heading
|
- (*(ushort *)((char *)object_b + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_b)->heading
|
- (((ushort *)object_b)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_b)->heading
|
- (((ushort *)object_b)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_b)->heading
)
...>
}

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (*(ushort *)((char *)object_b + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (((ushort *)object_b)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (((ushort *)object_b)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (*(byte *)((char *)object_b + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_b)->ypos
|
- (*(byte *)((char *)object_b + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_b)->ypos
)
...>
}

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (*(ushort *)((char *)object_b + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (((ushort *)object_b)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (((ushort *)object_b)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (*(byte *)((char *)object_b + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_b)->xpos
|
- (*(byte *)((char *)object_b + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_b)->xpos
|
- *(byte *)((char *)object_b + 0x3) >> 5
+ ((uw_object_hdr_t *)object_b)->xpos
)
...>
}

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_b)->quality
|
- ((ushort *)object_b)[2] & 0x3f
+ ((uw_object_hdr_t *)object_b)->quality
|
- *(byte *)((char *)object_b + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_b)->quality
)
...>
}

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->next
|
- (*(ushort *)((char *)object_b + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->next
|
- (((ushort *)object_b)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->next
|
- (((ushort *)object_b)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->next
)
...>
}

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_b)->owner
|
- ((ushort *)object_b)[3] & 0x3f
+ ((uw_object_hdr_t *)object_b)->owner
|
- *(byte *)((char *)object_b + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_b)->owner
)
...>
}

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_b + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->link
|
- (*(ushort *)((char *)object_b + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->link
|
- (((ushort *)object_b)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_b)->link
|
- (((ushort *)object_b)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_b)->link
)
...>
}

@field_15_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->object_id
|
- ((ushort *)local_1c)[0] & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->object_id
|
- *(ushort *)local_1c & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->object_id
|
- *(ushort *)(local_1c + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->object_id
|
- CONCAT11(local_1c[1], *local_1c) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->object_id
|
- CONCAT11(local_1c[1], local_1c[0]) & 0x1ff
+ ((uw_object_hdr_t *)local_1c)->object_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)((char *)local_1c + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (((ushort *)local_1c)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (((ushort *)local_1c)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)local_1c >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)local_1c & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)(local_1c + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(ushort *)(local_1c + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], *local_1c) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], *local_1c) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(byte *)((char *)local_1c + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(byte *)((char *)local_1c + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(byte *)(local_1c + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)local_1c)->flags_res
|
- (*(byte *)(local_1c + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)local_1c)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (((ushort *)local_1c)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (((ushort *)local_1c)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)local_1c >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)local_1c & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)(local_1c + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(ushort *)(local_1c + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], *local_1c) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], *local_1c) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(byte *)((char *)local_1c + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(byte *)((char *)local_1c + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(byte *)(local_1c + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)local_1c)->enchanted
|
- (*(byte *)(local_1c + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)local_1c)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (((ushort *)local_1c)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (((ushort *)local_1c)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)local_1c >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)local_1c & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)(local_1c + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(ushort *)(local_1c + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], *local_1c) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], *local_1c) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(byte *)((char *)local_1c + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(byte *)((char *)local_1c + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(byte *)(local_1c + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)local_1c)->doordir
|
- (*(byte *)(local_1c + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)local_1c)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (((ushort *)local_1c)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (((ushort *)local_1c)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)local_1c >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)local_1c & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)(local_1c + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(ushort *)(local_1c + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], *local_1c) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], *local_1c) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(byte *)((char *)local_1c + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(byte *)((char *)local_1c + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(byte *)(local_1c + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)local_1c)->invisible
|
- (*(byte *)(local_1c + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)local_1c)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)((char *)local_1c + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (((ushort *)local_1c)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (((ushort *)local_1c)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)local_1c >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)local_1c & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)(local_1c + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(ushort *)(local_1c + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], *local_1c) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], *local_1c) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], local_1c[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (CONCAT11(local_1c[1], local_1c[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(byte *)((char *)local_1c + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(byte *)((char *)local_1c + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- *(byte *)((char *)local_1c + 0x1) >> 7
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(byte *)(local_1c + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- (*(byte *)(local_1c + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)local_1c)->is_quant
|
- *(byte *)(local_1c + 0x1) >> 7
+ ((uw_object_hdr_t *)local_1c)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- ((ushort *)local_1c)[1] & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- *(ushort *)(local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- *(byte *)((char *)local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- local_1c[2] & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
|
- *(byte *)(local_1c + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_1c)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (*(ushort *)((char *)local_1c + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (((ushort *)local_1c)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (((ushort *)local_1c)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (*(ushort *)(local_1c + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_1c)->heading
|
- (*(ushort *)(local_1c + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_1c)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(ushort *)((char *)local_1c + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (((ushort *)local_1c)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (((ushort *)local_1c)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(ushort *)(local_1c + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(ushort *)(local_1c + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(byte *)((char *)local_1c + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(byte *)((char *)local_1c + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(byte *)(local_1c + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)local_1c)->ypos
|
- (*(byte *)(local_1c + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)local_1c)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(ushort *)((char *)local_1c + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (((ushort *)local_1c)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (((ushort *)local_1c)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(ushort *)(local_1c + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(ushort *)(local_1c + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(byte *)((char *)local_1c + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(byte *)((char *)local_1c + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- *(byte *)((char *)local_1c + 0x3) >> 5
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(byte *)(local_1c + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- (*(byte *)(local_1c + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)local_1c)->xpos
|
- *(byte *)(local_1c + 0x3) >> 5
+ ((uw_object_hdr_t *)local_1c)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- ((ushort *)local_1c)[2] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- *(ushort *)(local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- *(byte *)((char *)local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- local_1c[4] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
|
- *(byte *)(local_1c + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->next
|
- (*(ushort *)((char *)local_1c + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->next
|
- (((ushort *)local_1c)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->next
|
- (((ushort *)local_1c)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->next
|
- (*(ushort *)(local_1c + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->next
|
- (*(ushort *)(local_1c + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- ((ushort *)local_1c)[3] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- *(ushort *)(local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- *(byte *)((char *)local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- local_1c[6] & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
|
- *(byte *)(local_1c + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_1c)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_1c + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->link
|
- (*(ushort *)((char *)local_1c + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->link
|
- (((ushort *)local_1c)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->link
|
- (((ushort *)local_1c)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->link
|
- (*(ushort *)(local_1c + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_1c)->link
|
- (*(ushort *)(local_1c + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_1c)->link
)
...>
}

@field_16_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@field_17_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(byte *)((char *)puVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar6)->flags_res
|
- (*(byte *)((char *)puVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar6)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(byte *)((char *)puVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar6)->enchanted
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar6)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(byte *)((char *)puVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar6)->doordir
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar6)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(byte *)((char *)puVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar6)->invisible
|
- (*(byte *)((char *)puVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar6)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (((ushort *)puVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (((ushort *)puVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar6)->is_quant
|
- (*(ushort *)puVar6 & 0x8000) >> 15
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

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- *(byte *)((char *)puVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar6)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (*(byte *)((char *)puVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar6)->ypos
|
- (*(byte *)((char *)puVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar6)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (((ushort *)puVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar6)->xpos
|
- (((ushort *)puVar6)[1] & 0xe000) >> 13
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

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- *(byte *)((char *)puVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (((ushort *)puVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->next
|
- (((ushort *)puVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- *(byte *)((char *)puVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar6)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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
- (((ushort *)puVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar6)->link
|
- (((ushort *)puVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar6)->link
)
...>
}

@field_18_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)stack_object)->object_id
|
- ((ushort *)stack_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)stack_object)->object_id
|
- *(ushort *)stack_object & 0x1ff
+ ((uw_object_hdr_t *)stack_object)->object_id
|
- stack_object[0] & 0x1ff
+ ((uw_object_hdr_t *)stack_object)->object_id
|
- *stack_object & 0x1ff
+ ((uw_object_hdr_t *)stack_object)->object_id
)
...>
}

@field_18_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*(ushort *)((char *)stack_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (((ushort *)stack_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (((ushort *)stack_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*(ushort *)stack_object >> 9) & 0x7
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*(ushort *)stack_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (stack_object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (stack_object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*stack_object >> 9) & 0x7
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*stack_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*(byte *)((char *)stack_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)stack_object)->flags_res
|
- (*(byte *)((char *)stack_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)stack_object)->flags_res
)
...>
}

@field_18_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*(ushort *)((char *)stack_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (((ushort *)stack_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (((ushort *)stack_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*(ushort *)stack_object >> 12) & 0x1
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*(ushort *)stack_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (stack_object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (stack_object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*stack_object >> 12) & 0x1
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*stack_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*(byte *)((char *)stack_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)stack_object)->enchanted
|
- (*(byte *)((char *)stack_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)stack_object)->enchanted
)
...>
}

@field_18_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*(ushort *)((char *)stack_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (((ushort *)stack_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (((ushort *)stack_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*(ushort *)stack_object >> 13) & 0x1
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*(ushort *)stack_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (stack_object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (stack_object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*stack_object >> 13) & 0x1
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*stack_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*(byte *)((char *)stack_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)stack_object)->doordir
|
- (*(byte *)((char *)stack_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)stack_object)->doordir
)
...>
}

@field_18_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*(ushort *)((char *)stack_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (((ushort *)stack_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (((ushort *)stack_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*(ushort *)stack_object >> 14) & 0x1
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*(ushort *)stack_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (stack_object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (stack_object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*stack_object >> 14) & 0x1
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*stack_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*(byte *)((char *)stack_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)stack_object)->invisible
|
- (*(byte *)((char *)stack_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)stack_object)->invisible
)
...>
}

@field_18_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*(ushort *)((char *)stack_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- *(ushort *)((char *)stack_object + 0x0) >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (((ushort *)stack_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (((ushort *)stack_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- ((ushort *)stack_object)[0] >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*(ushort *)stack_object >> 15) & 0x1
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*(ushort *)stack_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- *(ushort *)stack_object >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (stack_object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (stack_object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- stack_object[0] >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*stack_object >> 15) & 0x1
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*stack_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- *stack_object >> 15
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*(byte *)((char *)stack_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- (*(byte *)((char *)stack_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)stack_object)->is_quant
|
- *(byte *)((char *)stack_object + 0x1) >> 7
+ ((uw_object_hdr_t *)stack_object)->is_quant
)
...>
}

@field_18_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)stack_object)->zpos
|
- ((ushort *)stack_object)[1] & 0x7f
+ ((uw_object_hdr_t *)stack_object)->zpos
|
- stack_object[1] & 0x7f
+ ((uw_object_hdr_t *)stack_object)->zpos
|
- *(byte *)((char *)stack_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)stack_object)->zpos
|
- (byte)stack_object[1] & 0x7f
+ ((uw_object_hdr_t *)stack_object)->zpos
)
...>
}

@field_18_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)stack_object)->heading
|
- (*(ushort *)((char *)stack_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)stack_object)->heading
|
- (((ushort *)stack_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)stack_object)->heading
|
- (((ushort *)stack_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)stack_object)->heading
|
- (stack_object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)stack_object)->heading
|
- (stack_object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)stack_object)->heading
)
...>
}

@field_18_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (*(ushort *)((char *)stack_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (((ushort *)stack_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (((ushort *)stack_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (stack_object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (stack_object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (*(byte *)((char *)stack_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)stack_object)->ypos
|
- (*(byte *)((char *)stack_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)stack_object)->ypos
)
...>
}

@field_18_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (*(ushort *)((char *)stack_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- *(ushort *)((char *)stack_object + 0x2) >> 13
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (((ushort *)stack_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (((ushort *)stack_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- ((ushort *)stack_object)[1] >> 13
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (stack_object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (stack_object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- stack_object[1] >> 13
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (*(byte *)((char *)stack_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- (*(byte *)((char *)stack_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)stack_object)->xpos
|
- *(byte *)((char *)stack_object + 0x3) >> 5
+ ((uw_object_hdr_t *)stack_object)->xpos
)
...>
}

@field_18_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)stack_object)->quality
|
- ((ushort *)stack_object)[2] & 0x3f
+ ((uw_object_hdr_t *)stack_object)->quality
|
- stack_object[2] & 0x3f
+ ((uw_object_hdr_t *)stack_object)->quality
|
- *(byte *)((char *)stack_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)stack_object)->quality
|
- (byte)stack_object[2] & 0x3f
+ ((uw_object_hdr_t *)stack_object)->quality
)
...>
}

@field_18_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)stack_object)->next
|
- (*(ushort *)((char *)stack_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)stack_object)->next
|
- *(ushort *)((char *)stack_object + 0x4) >> 6
+ ((uw_object_hdr_t *)stack_object)->next
|
- (((ushort *)stack_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)stack_object)->next
|
- (((ushort *)stack_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)stack_object)->next
|
- ((ushort *)stack_object)[2] >> 6
+ ((uw_object_hdr_t *)stack_object)->next
|
- (stack_object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)stack_object)->next
|
- (stack_object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)stack_object)->next
|
- stack_object[2] >> 6
+ ((uw_object_hdr_t *)stack_object)->next
)
...>
}

@field_18_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)stack_object)->owner
|
- ((ushort *)stack_object)[3] & 0x3f
+ ((uw_object_hdr_t *)stack_object)->owner
|
- stack_object[3] & 0x3f
+ ((uw_object_hdr_t *)stack_object)->owner
|
- *(byte *)((char *)stack_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)stack_object)->owner
|
- (byte)stack_object[3] & 0x3f
+ ((uw_object_hdr_t *)stack_object)->owner
)
...>
}

@field_18_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)stack_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)stack_object)->link
|
- (*(ushort *)((char *)stack_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)stack_object)->link
|
- *(ushort *)((char *)stack_object + 0x6) >> 6
+ ((uw_object_hdr_t *)stack_object)->link
|
- (((ushort *)stack_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)stack_object)->link
|
- (((ushort *)stack_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)stack_object)->link
|
- ((ushort *)stack_object)[3] >> 6
+ ((uw_object_hdr_t *)stack_object)->link
|
- (stack_object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)stack_object)->link
|
- (stack_object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)stack_object)->link
|
- stack_object[3] >> 6
+ ((uw_object_hdr_t *)stack_object)->link
)
...>
}

@field_19_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_19_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@field_20_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->object_id
|
- ((ushort *)pbVar10)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->object_id
|
- *(ushort *)pbVar10 & 0x1ff
+ ((uw_object_hdr_t *)pbVar10)->object_id
)
...>
}

@field_20_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (((ushort *)pbVar10)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (((ushort *)pbVar10)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)pbVar10 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(ushort *)pbVar10 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->flags_res
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar10)->flags_res
)
...>
}

@field_20_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (((ushort *)pbVar10)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (((ushort *)pbVar10)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)pbVar10 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(ushort *)pbVar10 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->enchanted
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar10)->enchanted
)
...>
}

@field_20_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (((ushort *)pbVar10)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (((ushort *)pbVar10)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)pbVar10 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(ushort *)pbVar10 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->doordir
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar10)->doordir
)
...>
}

@field_20_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (((ushort *)pbVar10)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (((ushort *)pbVar10)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)pbVar10 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(ushort *)pbVar10 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->invisible
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar10)->invisible
)
...>
}

@field_20_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)((char *)pbVar10 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (((ushort *)pbVar10)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (((ushort *)pbVar10)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)pbVar10 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(ushort *)pbVar10 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(byte *)((char *)pbVar10 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- (*(byte *)((char *)pbVar10 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar10)->is_quant
|
- *(byte *)((char *)pbVar10 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar10)->is_quant
)
...>
}

@field_20_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
|
- ((ushort *)pbVar10)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
|
- *(byte *)((char *)pbVar10 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar10)->zpos
)
...>
}

@field_20_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (*(ushort *)((char *)pbVar10 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (((ushort *)pbVar10)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->heading
|
- (((ushort *)pbVar10)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar10)->heading
)
...>
}

@field_20_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(ushort *)((char *)pbVar10 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (((ushort *)pbVar10)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (((ushort *)pbVar10)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(byte *)((char *)pbVar10 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->ypos
|
- (*(byte *)((char *)pbVar10 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar10)->ypos
)
...>
}

@field_20_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(ushort *)((char *)pbVar10 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (((ushort *)pbVar10)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (((ushort *)pbVar10)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(byte *)((char *)pbVar10 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- (*(byte *)((char *)pbVar10 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar10)->xpos
|
- *(byte *)((char *)pbVar10 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar10)->xpos
)
...>
}

@field_20_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
|
- ((ushort *)pbVar10)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
|
- *(byte *)((char *)pbVar10 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->quality
)
...>
}

@field_20_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (*(ushort *)((char *)pbVar10 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (((ushort *)pbVar10)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->next
|
- (((ushort *)pbVar10)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->next
)
...>
}

@field_20_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
|
- ((ushort *)pbVar10)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
|
- *(byte *)((char *)pbVar10 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar10)->owner
)
...>
}

@field_20_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar10 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (*(ushort *)((char *)pbVar10 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (((ushort *)pbVar10)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar10)->link
|
- (((ushort *)pbVar10)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar10)->link
)
...>
}

@field_21_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->object_id
|
- ((ushort *)local_28)[0] & 0x1ff
+ ((uw_object_hdr_t *)local_28)->object_id
|
- *(ushort *)local_28 & 0x1ff
+ ((uw_object_hdr_t *)local_28)->object_id
|
- *(ushort *)(local_28 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->object_id
|
- CONCAT11(local_28[1], *local_28) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->object_id
|
- CONCAT11(local_28[1], local_28[0]) & 0x1ff
+ ((uw_object_hdr_t *)local_28)->object_id
)
...>
}

@field_21_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)((char *)local_28 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (((ushort *)local_28)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (((ushort *)local_28)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)local_28 >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)local_28 & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)(local_28 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(ushort *)(local_28 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], *local_28) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], *local_28) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], local_28[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (CONCAT11(local_28[1], local_28[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(byte *)((char *)local_28 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(byte *)((char *)local_28 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(byte *)(local_28 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)local_28)->flags_res
|
- (*(byte *)(local_28 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)local_28)->flags_res
)
...>
}

@field_21_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (((ushort *)local_28)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (((ushort *)local_28)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)local_28 >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)local_28 & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)(local_28 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(ushort *)(local_28 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], *local_28) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], *local_28) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], local_28[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (CONCAT11(local_28[1], local_28[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(byte *)((char *)local_28 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(byte *)((char *)local_28 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(byte *)(local_28 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)local_28)->enchanted
|
- (*(byte *)(local_28 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)local_28)->enchanted
)
...>
}

@field_21_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (((ushort *)local_28)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (((ushort *)local_28)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)local_28 >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)local_28 & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)(local_28 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(ushort *)(local_28 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], *local_28) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], *local_28) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], local_28[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (CONCAT11(local_28[1], local_28[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(byte *)((char *)local_28 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(byte *)((char *)local_28 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(byte *)(local_28 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)local_28)->doordir
|
- (*(byte *)(local_28 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)local_28)->doordir
)
...>
}

@field_21_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (((ushort *)local_28)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (((ushort *)local_28)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)local_28 >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)local_28 & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)(local_28 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(ushort *)(local_28 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], *local_28) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], *local_28) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], local_28[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (CONCAT11(local_28[1], local_28[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(byte *)((char *)local_28 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(byte *)((char *)local_28 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(byte *)(local_28 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)local_28)->invisible
|
- (*(byte *)(local_28 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)local_28)->invisible
)
...>
}

@field_21_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)((char *)local_28 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (((ushort *)local_28)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (((ushort *)local_28)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)local_28 >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)local_28 & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)(local_28 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(ushort *)(local_28 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], *local_28) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], *local_28) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], local_28[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (CONCAT11(local_28[1], local_28[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(byte *)((char *)local_28 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(byte *)((char *)local_28 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- *(byte *)((char *)local_28 + 0x1) >> 7
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(byte *)(local_28 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- (*(byte *)(local_28 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)local_28)->is_quant
|
- *(byte *)(local_28 + 0x1) >> 7
+ ((uw_object_hdr_t *)local_28)->is_quant
)
...>
}

@field_21_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- ((ushort *)local_28)[1] & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- *(ushort *)(local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- *(byte *)((char *)local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- local_28[2] & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
|
- *(byte *)(local_28 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)local_28)->zpos
)
...>
}

@field_21_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (*(ushort *)((char *)local_28 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (((ushort *)local_28)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (((ushort *)local_28)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (*(ushort *)(local_28 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)local_28)->heading
|
- (*(ushort *)(local_28 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)local_28)->heading
)
...>
}

@field_21_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(ushort *)((char *)local_28 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (((ushort *)local_28)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (((ushort *)local_28)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(ushort *)(local_28 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(ushort *)(local_28 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(byte *)((char *)local_28 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(byte *)((char *)local_28 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(byte *)(local_28 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)local_28)->ypos
|
- (*(byte *)(local_28 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)local_28)->ypos
)
...>
}

@field_21_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(ushort *)((char *)local_28 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (((ushort *)local_28)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (((ushort *)local_28)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(ushort *)(local_28 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(ushort *)(local_28 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(byte *)((char *)local_28 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(byte *)((char *)local_28 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)local_28)->xpos
|
- *(byte *)((char *)local_28 + 0x3) >> 5
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(byte *)(local_28 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)local_28)->xpos
|
- (*(byte *)(local_28 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)local_28)->xpos
|
- *(byte *)(local_28 + 0x3) >> 5
+ ((uw_object_hdr_t *)local_28)->xpos
)
...>
}

@field_21_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- ((ushort *)local_28)[2] & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- *(ushort *)(local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- *(byte *)((char *)local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- local_28[4] & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
|
- *(byte *)(local_28 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)local_28)->quality
)
...>
}

@field_21_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->next
|
- (*(ushort *)((char *)local_28 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->next
|
- (((ushort *)local_28)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->next
|
- (((ushort *)local_28)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->next
|
- (*(ushort *)(local_28 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->next
|
- (*(ushort *)(local_28 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->next
)
...>
}

@field_21_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- ((ushort *)local_28)[3] & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- *(ushort *)(local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- *(byte *)((char *)local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- local_28[6] & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
|
- *(byte *)(local_28 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)local_28)->owner
)
...>
}

@field_21_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)local_28 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->link
|
- (*(ushort *)((char *)local_28 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->link
|
- (((ushort *)local_28)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->link
|
- (((ushort *)local_28)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->link
|
- (*(ushort *)(local_28 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)local_28)->link
|
- (*(ushort *)(local_28 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)local_28)->link
)
...>
}

@field_22_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- ((ushort *)pbVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- *(ushort *)pbVar1 & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- *(ushort *)(pbVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- CONCAT11(pbVar1[1], *pbVar1) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
|
- CONCAT11(pbVar1[1], pbVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar1)->object_id
)
...>
}

@field_22_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (((ushort *)pbVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (((ushort *)pbVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)pbVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)pbVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)(pbVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(ushort *)(pbVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)(pbVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->flags_res
|
- (*(byte *)(pbVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar1)->flags_res
)
...>
}

@field_22_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (((ushort *)pbVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (((ushort *)pbVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)pbVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)pbVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)(pbVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(ushort *)(pbVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)(pbVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->enchanted
|
- (*(byte *)(pbVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar1)->enchanted
)
...>
}

@field_22_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (((ushort *)pbVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (((ushort *)pbVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)pbVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)pbVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)(pbVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(ushort *)(pbVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)(pbVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->doordir
|
- (*(byte *)(pbVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar1)->doordir
)
...>
}

@field_22_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (((ushort *)pbVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (((ushort *)pbVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)pbVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)pbVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)(pbVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(ushort *)(pbVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)(pbVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->invisible
|
- (*(byte *)(pbVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar1)->invisible
)
...>
}

@field_22_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)((char *)pbVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (((ushort *)pbVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (((ushort *)pbVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)pbVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)pbVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)(pbVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(ushort *)(pbVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], *pbVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], *pbVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], pbVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (CONCAT11(pbVar1[1], pbVar1[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)((char *)pbVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)((char *)pbVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- *(byte *)((char *)pbVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)(pbVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- (*(byte *)(pbVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
|
- *(byte *)(pbVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar1)->is_quant
)
...>
}

@field_22_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- ((ushort *)pbVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(ushort *)(pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(byte *)((char *)pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- pbVar1[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
|
- *(byte *)(pbVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar1)->zpos
)
...>
}

@field_22_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (((ushort *)pbVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (((ushort *)pbVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)(pbVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->heading
|
- (*(ushort *)(pbVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar1)->heading
)
...>
}

@field_22_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (((ushort *)pbVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (((ushort *)pbVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)(pbVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(ushort *)(pbVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)((char *)pbVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)((char *)pbVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)(pbVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->ypos
|
- (*(byte *)(pbVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar1)->ypos
)
...>
}

@field_22_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)((char *)pbVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (((ushort *)pbVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (((ushort *)pbVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)(pbVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(ushort *)(pbVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)((char *)pbVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)((char *)pbVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- *(byte *)((char *)pbVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)(pbVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- (*(byte *)(pbVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
|
- *(byte *)(pbVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar1)->xpos
)
...>
}

@field_22_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- ((ushort *)pbVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(ushort *)(pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(byte *)((char *)pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- pbVar1[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
|
- *(byte *)(pbVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->quality
)
...>
}

@field_22_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)((char *)pbVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (((ushort *)pbVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (((ushort *)pbVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)(pbVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->next
|
- (*(ushort *)(pbVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->next
)
...>
}

@field_22_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- ((ushort *)pbVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(ushort *)(pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(byte *)((char *)pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- pbVar1[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
|
- *(byte *)(pbVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar1)->owner
)
...>
}

@field_22_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)((char *)pbVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (((ushort *)pbVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (((ushort *)pbVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)(pbVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar1)->link
|
- (*(ushort *)(pbVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar1)->link
)
...>
}

@field_23_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->object_id
|
- ((ushort *)slot_item)[0] & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->object_id
|
- *(ushort *)slot_item & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->object_id
|
- *(ushort *)(slot_item + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)slot_item)->object_id
)
...>
}

@field_23_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)((char *)slot_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (((ushort *)slot_item)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (((ushort *)slot_item)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)slot_item >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)slot_item & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)(slot_item + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(ushort *)(slot_item + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(byte *)((char *)slot_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(byte *)((char *)slot_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(byte *)(slot_item + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)slot_item)->flags_res
|
- (*(byte *)(slot_item + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)slot_item)->flags_res
)
...>
}

@field_23_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (((ushort *)slot_item)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (((ushort *)slot_item)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)slot_item >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)slot_item & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)(slot_item + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(ushort *)(slot_item + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(byte *)((char *)slot_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(byte *)((char *)slot_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(byte *)(slot_item + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)slot_item)->enchanted
|
- (*(byte *)(slot_item + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)slot_item)->enchanted
)
...>
}

@field_23_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (((ushort *)slot_item)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (((ushort *)slot_item)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)slot_item >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)slot_item & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)(slot_item + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(ushort *)(slot_item + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(byte *)((char *)slot_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(byte *)((char *)slot_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(byte *)(slot_item + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)slot_item)->doordir
|
- (*(byte *)(slot_item + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)slot_item)->doordir
)
...>
}

@field_23_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (((ushort *)slot_item)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (((ushort *)slot_item)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)slot_item >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)slot_item & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)(slot_item + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(ushort *)(slot_item + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(byte *)((char *)slot_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(byte *)((char *)slot_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(byte *)(slot_item + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)slot_item)->invisible
|
- (*(byte *)(slot_item + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)slot_item)->invisible
)
...>
}

@field_23_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)((char *)slot_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (((ushort *)slot_item)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (((ushort *)slot_item)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)slot_item >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)slot_item & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)(slot_item + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(ushort *)(slot_item + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(byte *)((char *)slot_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(byte *)((char *)slot_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- *(byte *)((char *)slot_item + 0x1) >> 7
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(byte *)(slot_item + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- (*(byte *)(slot_item + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)slot_item)->is_quant
|
- *(byte *)(slot_item + 0x1) >> 7
+ ((uw_object_hdr_t *)slot_item)->is_quant
)
...>
}

@field_23_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
|
- ((ushort *)slot_item)[1] & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
|
- *(ushort *)(slot_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
|
- *(byte *)((char *)slot_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
|
- *(byte *)(slot_item + 0x2) & 0x7f
+ ((uw_object_hdr_t *)slot_item)->zpos
)
...>
}

@field_23_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (*(ushort *)((char *)slot_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (((ushort *)slot_item)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (((ushort *)slot_item)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (*(ushort *)(slot_item + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)slot_item)->heading
|
- (*(ushort *)(slot_item + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)slot_item)->heading
)
...>
}

@field_23_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(ushort *)((char *)slot_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (((ushort *)slot_item)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (((ushort *)slot_item)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(ushort *)(slot_item + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(ushort *)(slot_item + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(byte *)((char *)slot_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(byte *)((char *)slot_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(byte *)(slot_item + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)slot_item)->ypos
|
- (*(byte *)(slot_item + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)slot_item)->ypos
)
...>
}

@field_23_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(ushort *)((char *)slot_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (((ushort *)slot_item)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (((ushort *)slot_item)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(ushort *)(slot_item + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(ushort *)(slot_item + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(byte *)((char *)slot_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(byte *)((char *)slot_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- *(byte *)((char *)slot_item + 0x3) >> 5
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(byte *)(slot_item + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- (*(byte *)(slot_item + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)slot_item)->xpos
|
- *(byte *)(slot_item + 0x3) >> 5
+ ((uw_object_hdr_t *)slot_item)->xpos
)
...>
}

@field_23_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
|
- ((ushort *)slot_item)[2] & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
|
- *(ushort *)(slot_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
|
- *(byte *)((char *)slot_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
|
- *(byte *)(slot_item + 0x4) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->quality
)
...>
}

@field_23_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->next
|
- (*(ushort *)((char *)slot_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->next
|
- (((ushort *)slot_item)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->next
|
- (((ushort *)slot_item)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->next
|
- (*(ushort *)(slot_item + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->next
|
- (*(ushort *)(slot_item + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->next
)
...>
}

@field_23_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
|
- ((ushort *)slot_item)[3] & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
|
- *(ushort *)(slot_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
|
- *(byte *)((char *)slot_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
|
- *(byte *)(slot_item + 0x6) & 0x3f
+ ((uw_object_hdr_t *)slot_item)->owner
)
...>
}

@field_23_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)slot_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->link
|
- (*(ushort *)((char *)slot_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->link
|
- (((ushort *)slot_item)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->link
|
- (((ushort *)slot_item)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->link
|
- (*(ushort *)(slot_item + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)slot_item)->link
|
- (*(ushort *)(slot_item + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)slot_item)->link
)
...>
}

@field_24_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pack_object)->object_id
|
- ((ushort *)pack_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)pack_object)->object_id
|
- *(ushort *)pack_object & 0x1ff
+ ((uw_object_hdr_t *)pack_object)->object_id
|
- pack_object[0] & 0x1ff
+ ((uw_object_hdr_t *)pack_object)->object_id
|
- *pack_object & 0x1ff
+ ((uw_object_hdr_t *)pack_object)->object_id
)
...>
}

@field_24_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*(ushort *)((char *)pack_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (((ushort *)pack_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (((ushort *)pack_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*(ushort *)pack_object >> 9) & 0x7
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*(ushort *)pack_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (pack_object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (pack_object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*pack_object >> 9) & 0x7
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*pack_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*(byte *)((char *)pack_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pack_object)->flags_res
|
- (*(byte *)((char *)pack_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pack_object)->flags_res
)
...>
}

@field_24_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*(ushort *)((char *)pack_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (((ushort *)pack_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (((ushort *)pack_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*(ushort *)pack_object >> 12) & 0x1
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*(ushort *)pack_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (pack_object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (pack_object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*pack_object >> 12) & 0x1
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*pack_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*(byte *)((char *)pack_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pack_object)->enchanted
|
- (*(byte *)((char *)pack_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pack_object)->enchanted
)
...>
}

@field_24_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*(ushort *)((char *)pack_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (((ushort *)pack_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (((ushort *)pack_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*(ushort *)pack_object >> 13) & 0x1
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*(ushort *)pack_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (pack_object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (pack_object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*pack_object >> 13) & 0x1
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*pack_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*(byte *)((char *)pack_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pack_object)->doordir
|
- (*(byte *)((char *)pack_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pack_object)->doordir
)
...>
}

@field_24_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*(ushort *)((char *)pack_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (((ushort *)pack_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (((ushort *)pack_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*(ushort *)pack_object >> 14) & 0x1
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*(ushort *)pack_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (pack_object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (pack_object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*pack_object >> 14) & 0x1
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*pack_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*(byte *)((char *)pack_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pack_object)->invisible
|
- (*(byte *)((char *)pack_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pack_object)->invisible
)
...>
}

@field_24_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*(ushort *)((char *)pack_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- *(ushort *)((char *)pack_object + 0x0) >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (((ushort *)pack_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (((ushort *)pack_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- ((ushort *)pack_object)[0] >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*(ushort *)pack_object >> 15) & 0x1
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*(ushort *)pack_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- *(ushort *)pack_object >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (pack_object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (pack_object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- pack_object[0] >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*pack_object >> 15) & 0x1
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*pack_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- *pack_object >> 15
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*(byte *)((char *)pack_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- (*(byte *)((char *)pack_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pack_object)->is_quant
|
- *(byte *)((char *)pack_object + 0x1) >> 7
+ ((uw_object_hdr_t *)pack_object)->is_quant
)
...>
}

@field_24_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pack_object)->zpos
|
- ((ushort *)pack_object)[1] & 0x7f
+ ((uw_object_hdr_t *)pack_object)->zpos
|
- pack_object[1] & 0x7f
+ ((uw_object_hdr_t *)pack_object)->zpos
|
- *(byte *)((char *)pack_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pack_object)->zpos
|
- (byte)pack_object[1] & 0x7f
+ ((uw_object_hdr_t *)pack_object)->zpos
)
...>
}

@field_24_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pack_object)->heading
|
- (*(ushort *)((char *)pack_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pack_object)->heading
|
- (((ushort *)pack_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pack_object)->heading
|
- (((ushort *)pack_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pack_object)->heading
|
- (pack_object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pack_object)->heading
|
- (pack_object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pack_object)->heading
)
...>
}

@field_24_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (*(ushort *)((char *)pack_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (((ushort *)pack_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (((ushort *)pack_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (pack_object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (pack_object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (*(byte *)((char *)pack_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pack_object)->ypos
|
- (*(byte *)((char *)pack_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pack_object)->ypos
)
...>
}

@field_24_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (*(ushort *)((char *)pack_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- *(ushort *)((char *)pack_object + 0x2) >> 13
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (((ushort *)pack_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (((ushort *)pack_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- ((ushort *)pack_object)[1] >> 13
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (pack_object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (pack_object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- pack_object[1] >> 13
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (*(byte *)((char *)pack_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- (*(byte *)((char *)pack_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pack_object)->xpos
|
- *(byte *)((char *)pack_object + 0x3) >> 5
+ ((uw_object_hdr_t *)pack_object)->xpos
)
...>
}

@field_24_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pack_object)->quality
|
- ((ushort *)pack_object)[2] & 0x3f
+ ((uw_object_hdr_t *)pack_object)->quality
|
- pack_object[2] & 0x3f
+ ((uw_object_hdr_t *)pack_object)->quality
|
- *(byte *)((char *)pack_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pack_object)->quality
|
- (byte)pack_object[2] & 0x3f
+ ((uw_object_hdr_t *)pack_object)->quality
)
...>
}

@field_24_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pack_object)->next
|
- (*(ushort *)((char *)pack_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pack_object)->next
|
- *(ushort *)((char *)pack_object + 0x4) >> 6
+ ((uw_object_hdr_t *)pack_object)->next
|
- (((ushort *)pack_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pack_object)->next
|
- (((ushort *)pack_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pack_object)->next
|
- ((ushort *)pack_object)[2] >> 6
+ ((uw_object_hdr_t *)pack_object)->next
|
- (pack_object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pack_object)->next
|
- (pack_object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pack_object)->next
|
- pack_object[2] >> 6
+ ((uw_object_hdr_t *)pack_object)->next
)
...>
}

@field_24_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pack_object)->owner
|
- ((ushort *)pack_object)[3] & 0x3f
+ ((uw_object_hdr_t *)pack_object)->owner
|
- pack_object[3] & 0x3f
+ ((uw_object_hdr_t *)pack_object)->owner
|
- *(byte *)((char *)pack_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pack_object)->owner
|
- (byte)pack_object[3] & 0x3f
+ ((uw_object_hdr_t *)pack_object)->owner
)
...>
}

@field_24_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pack_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pack_object)->link
|
- (*(ushort *)((char *)pack_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pack_object)->link
|
- *(ushort *)((char *)pack_object + 0x6) >> 6
+ ((uw_object_hdr_t *)pack_object)->link
|
- (((ushort *)pack_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pack_object)->link
|
- (((ushort *)pack_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pack_object)->link
|
- ((ushort *)pack_object)[3] >> 6
+ ((uw_object_hdr_t *)pack_object)->link
|
- (pack_object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pack_object)->link
|
- (pack_object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pack_object)->link
|
- pack_object[3] >> 6
+ ((uw_object_hdr_t *)pack_object)->link
)
...>
}

@field_25_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- *(ushort *)(iVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
|
- CONCAT11(iVar4[1], *iVar4) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
|
- CONCAT11(iVar4[1], iVar4[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
)
...>
}

@field_25_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(ushort *)(iVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], *iVar4) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], *iVar4) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)((char *)iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)(iVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*(byte *)(iVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar4)->flags_res
)
...>
}

@field_25_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(ushort *)(iVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], *iVar4) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], *iVar4) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)(iVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*(byte *)(iVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar4)->enchanted
)
...>
}

@field_25_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(ushort *)(iVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], *iVar4) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], *iVar4) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)(iVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*(byte *)(iVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar4)->doordir
)
...>
}

@field_25_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(ushort *)(iVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], *iVar4) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], *iVar4) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)((char *)iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)(iVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*(byte *)(iVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar4)->invisible
)
...>
}

@field_25_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)(iVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], *iVar4) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], *iVar4) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], iVar4[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (CONCAT11(iVar4[1], iVar4[0]) & 0x8000) >> 15
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
|
- (*(byte *)(iVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(byte *)(iVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(byte *)(iVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar4)->is_quant
)
...>
}

@field_25_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- *(ushort *)(iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- iVar4[2] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)(iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
)
...>
}

@field_25_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- (*(ushort *)(iVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (*(ushort *)(iVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
)
...>
}

@field_25_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(ushort *)(iVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)((char *)iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)(iVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (*(byte *)(iVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar4)->ypos
)
...>
}

@field_25_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- (*(ushort *)(iVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(ushort *)(iVar4 + 0x2) & 0xe000) >> 13
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
|
- (*(byte *)(iVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (*(byte *)(iVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- *(byte *)(iVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar4)->xpos
)
...>
}

@field_25_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- *(ushort *)(iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- iVar4[4] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)(iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
)
...>
}

@field_25_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- (*(ushort *)(iVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (*(ushort *)(iVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
)
...>
}

@field_25_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
- *(ushort *)(iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- iVar4[6] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)(iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
)
...>
}

@field_25_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- (*(ushort *)(iVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (*(ushort *)(iVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
)
...>
}

@field_26_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- puVar3[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
|
- *puVar3 & 0x1ff
+ ((uw_object_hdr_t *)puVar3)->object_id
)
...>
}

@field_26_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (puVar3[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (puVar3[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*puVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar3)->flags_res
|
- (*puVar3 & 0xe00) >> 9
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

@field_26_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (puVar3[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (puVar3[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*puVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar3)->enchanted
|
- (*puVar3 & 0x1000) >> 12
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

@field_26_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (puVar3[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (puVar3[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*puVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar3)->doordir
|
- (*puVar3 & 0x2000) >> 13
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

@field_26_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (puVar3[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (puVar3[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*puVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar3)->invisible
|
- (*puVar3 & 0x4000) >> 14
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

@field_26_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)puVar3 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (((ushort *)puVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- ((ushort *)puVar3)[0] >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*(ushort *)puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *(ushort *)puVar3 >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (puVar3[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (puVar3[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- puVar3[0] >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*puVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- (*puVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar3)->is_quant
|
- *puVar3 >> 15
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

@field_26_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- puVar3[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- *(byte *)((char *)puVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
|
- (byte)puVar3[1] & 0x7f
+ ((uw_object_hdr_t *)puVar3)->zpos
)
...>
}

@field_26_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- (puVar3[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar3)->heading
|
- (puVar3[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar3)->heading
)
...>
}

@field_26_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (puVar3[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar3)->ypos
|
- (puVar3[1] & 0x1c00) >> 10
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

@field_26_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)puVar3 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (((ushort *)puVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- ((ushort *)puVar3)[1] >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (puVar3[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- (puVar3[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar3)->xpos
|
- puVar3[1] >> 13
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

@field_26_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- puVar3[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- *(byte *)((char *)puVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
|
- (byte)puVar3[2] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->quality
)
...>
}

@field_26_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)puVar3 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (((ushort *)puVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- ((ushort *)puVar3)[2] >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- (puVar3[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->next
|
- (puVar3[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->next
|
- puVar3[2] >> 6
+ ((uw_object_hdr_t *)puVar3)->next
)
...>
}

@field_26_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- puVar3[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- *(byte *)((char *)puVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
|
- (byte)puVar3[3] & 0x3f
+ ((uw_object_hdr_t *)puVar3)->owner
)
...>
}

@field_26_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)puVar3 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (((ushort *)puVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- ((ushort *)puVar3)[3] >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- (puVar3[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar3)->link
|
- (puVar3[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar3)->link
|
- puVar3[3] >> 6
+ ((uw_object_hdr_t *)puVar3)->link
)
...>
}

@field_27_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- iVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
|
- *iVar4 & 0x1ff
+ ((uw_object_hdr_t *)iVar4)->object_id
)
...>
}

@field_27_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (iVar4[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (iVar4[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*iVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar4)->flags_res
|
- (*iVar4 & 0xe00) >> 9
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

@field_27_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (iVar4[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (iVar4[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*iVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar4)->enchanted
|
- (*iVar4 & 0x1000) >> 12
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

@field_27_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (iVar4[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (iVar4[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*iVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar4)->doordir
|
- (*iVar4 & 0x2000) >> 13
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

@field_27_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (iVar4[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (iVar4[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*iVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar4)->invisible
|
- (*iVar4 & 0x4000) >> 14
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

@field_27_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)iVar4 + 0x0) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (((ushort *)iVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- ((ushort *)iVar4)[0] >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*(ushort *)iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *(ushort *)iVar4 >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (iVar4[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (iVar4[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- iVar4[0] >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*iVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- (*iVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar4)->is_quant
|
- *iVar4 >> 15
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

@field_27_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- iVar4[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- *(byte *)((char *)iVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
|
- (byte)iVar4[1] & 0x7f
+ ((uw_object_hdr_t *)iVar4)->zpos
)
...>
}

@field_27_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- (iVar4[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar4)->heading
|
- (iVar4[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar4)->heading
)
...>
}

@field_27_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- (iVar4[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar4)->ypos
|
- (iVar4[1] & 0x1c00) >> 10
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

@field_27_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)iVar4 + 0x2) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (((ushort *)iVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- ((ushort *)iVar4)[1] >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (iVar4[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- (iVar4[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar4)->xpos
|
- iVar4[1] >> 13
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

@field_27_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- iVar4[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- *(byte *)((char *)iVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
|
- (byte)iVar4[2] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->quality
)
...>
}

@field_27_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)iVar4 + 0x4) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (((ushort *)iVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- ((ushort *)iVar4)[2] >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- (iVar4[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->next
|
- (iVar4[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->next
|
- iVar4[2] >> 6
+ ((uw_object_hdr_t *)iVar4)->next
)
...>
}

@field_27_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- iVar4[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- *(byte *)((char *)iVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
|
- (byte)iVar4[3] & 0x3f
+ ((uw_object_hdr_t *)iVar4)->owner
)
...>
}

@field_27_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
- *(ushort *)((char *)iVar4 + 0x6) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (((ushort *)iVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- ((ushort *)iVar4)[3] >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- (iVar4[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar4)->link
|
- (iVar4[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar4)->link
|
- iVar4[3] >> 6
+ ((uw_object_hdr_t *)iVar4)->link
)
...>
}

@field_28_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)header)->object_id
|
- ((ushort *)header)[0] & 0x1ff
+ ((uw_object_hdr_t *)header)->object_id
|
- *(ushort *)header & 0x1ff
+ ((uw_object_hdr_t *)header)->object_id
)
...>
}

@field_28_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)header)->flags_res
|
- (*(ushort *)((char *)header + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)header)->flags_res
|
- (((ushort *)header)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)header)->flags_res
|
- (((ushort *)header)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)header)->flags_res
|
- (*(ushort *)header >> 9) & 0x7
+ ((uw_object_hdr_t *)header)->flags_res
|
- (*(ushort *)header & 0xe00) >> 9
+ ((uw_object_hdr_t *)header)->flags_res
|
- (*(byte *)((char *)header + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)header)->flags_res
|
- (*(byte *)((char *)header + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)header)->flags_res
)
...>
}

@field_28_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)header)->enchanted
|
- (*(ushort *)((char *)header + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)header)->enchanted
|
- (((ushort *)header)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)header)->enchanted
|
- (((ushort *)header)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)header)->enchanted
|
- (*(ushort *)header >> 12) & 0x1
+ ((uw_object_hdr_t *)header)->enchanted
|
- (*(ushort *)header & 0x1000) >> 12
+ ((uw_object_hdr_t *)header)->enchanted
|
- (*(byte *)((char *)header + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)header)->enchanted
|
- (*(byte *)((char *)header + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)header)->enchanted
)
...>
}

@field_28_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)header)->doordir
|
- (*(ushort *)((char *)header + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)header)->doordir
|
- (((ushort *)header)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)header)->doordir
|
- (((ushort *)header)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)header)->doordir
|
- (*(ushort *)header >> 13) & 0x1
+ ((uw_object_hdr_t *)header)->doordir
|
- (*(ushort *)header & 0x2000) >> 13
+ ((uw_object_hdr_t *)header)->doordir
|
- (*(byte *)((char *)header + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)header)->doordir
|
- (*(byte *)((char *)header + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)header)->doordir
)
...>
}

@field_28_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)header)->invisible
|
- (*(ushort *)((char *)header + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)header)->invisible
|
- (((ushort *)header)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)header)->invisible
|
- (((ushort *)header)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)header)->invisible
|
- (*(ushort *)header >> 14) & 0x1
+ ((uw_object_hdr_t *)header)->invisible
|
- (*(ushort *)header & 0x4000) >> 14
+ ((uw_object_hdr_t *)header)->invisible
|
- (*(byte *)((char *)header + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)header)->invisible
|
- (*(byte *)((char *)header + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)header)->invisible
)
...>
}

@field_28_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)header)->is_quant
|
- (*(ushort *)((char *)header + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)header)->is_quant
|
- (((ushort *)header)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)header)->is_quant
|
- (((ushort *)header)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)header)->is_quant
|
- (*(ushort *)header >> 15) & 0x1
+ ((uw_object_hdr_t *)header)->is_quant
|
- (*(ushort *)header & 0x8000) >> 15
+ ((uw_object_hdr_t *)header)->is_quant
|
- (*(byte *)((char *)header + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)header)->is_quant
|
- (*(byte *)((char *)header + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)header)->is_quant
|
- *(byte *)((char *)header + 0x1) >> 7
+ ((uw_object_hdr_t *)header)->is_quant
)
...>
}

@field_28_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 0x2) & 0x7f
+ ((uw_object_hdr_t *)header)->zpos
|
- ((ushort *)header)[1] & 0x7f
+ ((uw_object_hdr_t *)header)->zpos
|
- *(byte *)((char *)header + 0x2) & 0x7f
+ ((uw_object_hdr_t *)header)->zpos
)
...>
}

@field_28_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)header)->heading
|
- (*(ushort *)((char *)header + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)header)->heading
|
- (((ushort *)header)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)header)->heading
|
- (((ushort *)header)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)header)->heading
)
...>
}

@field_28_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)header)->ypos
|
- (*(ushort *)((char *)header + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)header)->ypos
|
- (((ushort *)header)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)header)->ypos
|
- (((ushort *)header)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)header)->ypos
|
- (*(byte *)((char *)header + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)header)->ypos
|
- (*(byte *)((char *)header + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)header)->ypos
)
...>
}

@field_28_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)header)->xpos
|
- (*(ushort *)((char *)header + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)header)->xpos
|
- (((ushort *)header)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)header)->xpos
|
- (((ushort *)header)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)header)->xpos
|
- (*(byte *)((char *)header + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)header)->xpos
|
- (*(byte *)((char *)header + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)header)->xpos
|
- *(byte *)((char *)header + 0x3) >> 5
+ ((uw_object_hdr_t *)header)->xpos
)
...>
}

@field_28_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 0x4) & 0x3f
+ ((uw_object_hdr_t *)header)->quality
|
- ((ushort *)header)[2] & 0x3f
+ ((uw_object_hdr_t *)header)->quality
|
- *(byte *)((char *)header + 0x4) & 0x3f
+ ((uw_object_hdr_t *)header)->quality
)
...>
}

@field_28_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)header)->next
|
- (*(ushort *)((char *)header + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)header)->next
|
- (((ushort *)header)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)header)->next
|
- (((ushort *)header)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)header)->next
)
...>
}

@field_28_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 0x6) & 0x3f
+ ((uw_object_hdr_t *)header)->owner
|
- ((ushort *)header)[3] & 0x3f
+ ((uw_object_hdr_t *)header)->owner
|
- *(byte *)((char *)header + 0x6) & 0x3f
+ ((uw_object_hdr_t *)header)->owner
)
...>
}

@field_28_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)header + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)header)->link
|
- (*(ushort *)((char *)header + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)header)->link
|
- (((ushort *)header)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)header)->link
|
- (((ushort *)header)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)header)->link
)
...>
}

@field_29_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->object_id
|
- ((ushort *)puVar11)[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->object_id
|
- *(ushort *)puVar11 & 0x1ff
+ ((uw_object_hdr_t *)puVar11)->object_id
)
...>
}

@field_29_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (((ushort *)puVar11)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (((ushort *)puVar11)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(ushort *)puVar11 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(ushort *)puVar11 & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(byte *)((char *)puVar11 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar11)->flags_res
|
- (*(byte *)((char *)puVar11 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar11)->flags_res
)
...>
}

@field_29_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (((ushort *)puVar11)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (((ushort *)puVar11)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(ushort *)puVar11 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(ushort *)puVar11 & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(byte *)((char *)puVar11 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar11)->enchanted
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar11)->enchanted
)
...>
}

@field_29_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (((ushort *)puVar11)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (((ushort *)puVar11)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(ushort *)puVar11 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(ushort *)puVar11 & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(byte *)((char *)puVar11 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar11)->doordir
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar11)->doordir
)
...>
}

@field_29_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (((ushort *)puVar11)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (((ushort *)puVar11)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(ushort *)puVar11 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(ushort *)puVar11 & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(byte *)((char *)puVar11 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar11)->invisible
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar11)->invisible
)
...>
}

@field_29_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(ushort *)((char *)puVar11 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (((ushort *)puVar11)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (((ushort *)puVar11)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(ushort *)puVar11 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(ushort *)puVar11 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(byte *)((char *)puVar11 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- (*(byte *)((char *)puVar11 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puVar11)->is_quant
|
- *(byte *)((char *)puVar11 + 0x1) >> 7
+ ((uw_object_hdr_t *)puVar11)->is_quant
)
...>
}

@field_29_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
|
- ((ushort *)puVar11)[1] & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
|
- *(byte *)((char *)puVar11 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar11)->zpos
)
...>
}

@field_29_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (*(ushort *)((char *)puVar11 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (((ushort *)puVar11)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar11)->heading
|
- (((ushort *)puVar11)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar11)->heading
)
...>
}

@field_29_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (*(ushort *)((char *)puVar11 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (((ushort *)puVar11)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (((ushort *)puVar11)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (*(byte *)((char *)puVar11 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar11)->ypos
|
- (*(byte *)((char *)puVar11 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar11)->ypos
)
...>
}

@field_29_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (*(ushort *)((char *)puVar11 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (((ushort *)puVar11)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (((ushort *)puVar11)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (*(byte *)((char *)puVar11 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- (*(byte *)((char *)puVar11 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puVar11)->xpos
|
- *(byte *)((char *)puVar11 + 0x3) >> 5
+ ((uw_object_hdr_t *)puVar11)->xpos
)
...>
}

@field_29_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
|
- ((ushort *)puVar11)[2] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
|
- *(byte *)((char *)puVar11 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->quality
)
...>
}

@field_29_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->next
|
- (*(ushort *)((char *)puVar11 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->next
|
- (((ushort *)puVar11)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->next
|
- (((ushort *)puVar11)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->next
)
...>
}

@field_29_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
|
- ((ushort *)puVar11)[3] & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
|
- *(byte *)((char *)puVar11 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar11)->owner
)
...>
}

@field_29_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puVar11 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->link
|
- (*(ushort *)((char *)puVar11 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->link
|
- (((ushort *)puVar11)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar11)->link
|
- (((ushort *)puVar11)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar11)->link
)
...>
}

@field_30_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->object_id
|
- ((ushort *)pbVar13)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->object_id
|
- *(ushort *)pbVar13 & 0x1ff
+ ((uw_object_hdr_t *)pbVar13)->object_id
)
...>
}

@field_30_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (((ushort *)pbVar13)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (((ushort *)pbVar13)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)pbVar13 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(ushort *)pbVar13 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->flags_res
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar13)->flags_res
)
...>
}

@field_30_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (((ushort *)pbVar13)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (((ushort *)pbVar13)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)pbVar13 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(ushort *)pbVar13 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->enchanted
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar13)->enchanted
)
...>
}

@field_30_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (((ushort *)pbVar13)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (((ushort *)pbVar13)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)pbVar13 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(ushort *)pbVar13 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->doordir
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar13)->doordir
)
...>
}

@field_30_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (((ushort *)pbVar13)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (((ushort *)pbVar13)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)pbVar13 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(ushort *)pbVar13 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->invisible
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar13)->invisible
)
...>
}

@field_30_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)((char *)pbVar13 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (((ushort *)pbVar13)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (((ushort *)pbVar13)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)pbVar13 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(ushort *)pbVar13 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(byte *)((char *)pbVar13 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- (*(byte *)((char *)pbVar13 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar13)->is_quant
|
- *(byte *)((char *)pbVar13 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar13)->is_quant
)
...>
}

@field_30_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
|
- ((ushort *)pbVar13)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
|
- *(byte *)((char *)pbVar13 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar13)->zpos
)
...>
}

@field_30_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (*(ushort *)((char *)pbVar13 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (((ushort *)pbVar13)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->heading
|
- (((ushort *)pbVar13)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar13)->heading
)
...>
}

@field_30_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(ushort *)((char *)pbVar13 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (((ushort *)pbVar13)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (((ushort *)pbVar13)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(byte *)((char *)pbVar13 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->ypos
|
- (*(byte *)((char *)pbVar13 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar13)->ypos
)
...>
}

@field_30_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(ushort *)((char *)pbVar13 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (((ushort *)pbVar13)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (((ushort *)pbVar13)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(byte *)((char *)pbVar13 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- (*(byte *)((char *)pbVar13 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar13)->xpos
|
- *(byte *)((char *)pbVar13 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar13)->xpos
)
...>
}

@field_30_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
|
- ((ushort *)pbVar13)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
|
- *(byte *)((char *)pbVar13 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->quality
)
...>
}

@field_30_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (*(ushort *)((char *)pbVar13 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (((ushort *)pbVar13)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->next
|
- (((ushort *)pbVar13)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->next
)
...>
}

@field_30_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
|
- ((ushort *)pbVar13)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
|
- *(byte *)((char *)pbVar13 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar13)->owner
)
...>
}

@field_30_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar13 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (*(ushort *)((char *)pbVar13 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (((ushort *)pbVar13)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar13)->link
|
- (((ushort *)pbVar13)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar13)->link
)
...>
}

@field_31_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- ((ushort *)object)[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- *(ushort *)object & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- object[0] & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- *object & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
)
...>
}

@field_31_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)((char *)object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (((ushort *)object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*object & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
)
...>
}

@field_31_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)((char *)object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (((ushort *)object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*object & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
)
...>
}

@field_31_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)((char *)object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (((ushort *)object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*object & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
)
...>
}

@field_31_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)((char *)object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (((ushort *)object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*object & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
)
...>
}

@field_31_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)((char *)object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(ushort *)((char *)object + 0x0) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (((ushort *)object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- ((ushort *)object)[0] >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(ushort *)object >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- object[0] >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*object & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- *object >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)((char *)object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(byte *)((char *)object + 0x1) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@field_31_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- ((ushort *)object)[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- *(byte *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- (byte)object[1] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
)
...>
}

@field_31_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (*(ushort *)((char *)object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (((ushort *)object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
)
...>
}

@field_31_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(ushort *)((char *)object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (((ushort *)object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
)
...>
}

@field_31_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(ushort *)((char *)object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- *(ushort *)((char *)object + 0x2) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (((ushort *)object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- ((ushort *)object)[1] >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- object[1] >> 13
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)((char *)object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object)->xpos
|
- *(byte *)((char *)object + 0x3) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@field_31_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- ((ushort *)object)[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- *(byte *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- (byte)object[2] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
)
...>
}

@field_31_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (*(ushort *)((char *)object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- *(ushort *)((char *)object + 0x4) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (((ushort *)object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- ((ushort *)object)[2] >> 6
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
|
- object[2] >> 6
+ ((uw_object_hdr_t *)object)->next
)
...>
}

@field_31_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- ((ushort *)object)[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- *(byte *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- (byte)object[3] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
)
...>
}

@field_31_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (*(ushort *)((char *)object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- *(ushort *)((char *)object + 0x6) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (((ushort *)object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- ((ushort *)object)[3] >> 6
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
|
- object[3] >> 6
+ ((uw_object_hdr_t *)object)->link
)
...>
}

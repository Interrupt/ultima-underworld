@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->object_id
|
- ((ushort *)pbVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->object_id
|
- *(ushort *)pbVar3 & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->object_id
|
- *(ushort *)(pbVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->object_id
|
- CONCAT11(pbVar3[1], *pbVar3) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->object_id
|
- CONCAT11(pbVar3[1], pbVar3[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar3)->object_id
)
...>
}

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (((ushort *)pbVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (((ushort *)pbVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)pbVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)pbVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)(pbVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(ushort *)(pbVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)(pbVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)(pbVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar3)->flags_res
)
...>
}

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (((ushort *)pbVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (((ushort *)pbVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)pbVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)pbVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)(pbVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(ushort *)(pbVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)(pbVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)(pbVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar3)->enchanted
)
...>
}

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (((ushort *)pbVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (((ushort *)pbVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)pbVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)pbVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)(pbVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(ushort *)(pbVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)(pbVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)(pbVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar3)->doordir
)
...>
}

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (((ushort *)pbVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (((ushort *)pbVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)pbVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)pbVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)(pbVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(ushort *)(pbVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)(pbVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)(pbVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar3)->invisible
)
...>
}

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)((char *)pbVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (((ushort *)pbVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (((ushort *)pbVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)pbVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)pbVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)(pbVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(ushort *)(pbVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], *pbVar3) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], *pbVar3) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], pbVar3[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (CONCAT11(pbVar3[1], pbVar3[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)((char *)pbVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- *(byte *)((char *)pbVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)(pbVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)(pbVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- *(byte *)(pbVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- ((ushort *)pbVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- *(ushort *)(pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- *(byte *)((char *)pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- pbVar3[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
|
- *(byte *)(pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
)
...>
}

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (*(ushort *)((char *)pbVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (((ushort *)pbVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (((ushort *)pbVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (*(ushort *)(pbVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->heading
|
- (*(ushort *)(pbVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar3)->heading
)
...>
}

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(ushort *)((char *)pbVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (((ushort *)pbVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (((ushort *)pbVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(ushort *)(pbVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(ushort *)(pbVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)((char *)pbVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)((char *)pbVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)(pbVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)(pbVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar3)->ypos
)
...>
}

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(ushort *)((char *)pbVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (((ushort *)pbVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (((ushort *)pbVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(ushort *)(pbVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(ushort *)(pbVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)((char *)pbVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)((char *)pbVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- *(byte *)((char *)pbVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)(pbVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)(pbVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- *(byte *)(pbVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- ((ushort *)pbVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- *(ushort *)(pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- *(byte *)((char *)pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- pbVar3[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
|
- *(byte *)(pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
)
...>
}

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (*(ushort *)((char *)pbVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (((ushort *)pbVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (((ushort *)pbVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (*(ushort *)(pbVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->next
|
- (*(ushort *)(pbVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->next
)
...>
}

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- ((ushort *)pbVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- *(ushort *)(pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- *(byte *)((char *)pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- pbVar3[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
|
- *(byte *)(pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
)
...>
}

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (*(ushort *)((char *)pbVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (((ushort *)pbVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (((ushort *)pbVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (*(ushort *)(pbVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar3)->link
|
- (*(ushort *)(pbVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar3)->link
)
...>
}

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)source_object)->object_id
|
- ((ushort *)source_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)source_object)->object_id
|
- *(ushort *)source_object & 0x1ff
+ ((uw_object_hdr_t *)source_object)->object_id
|
- source_object[0] & 0x1ff
+ ((uw_object_hdr_t *)source_object)->object_id
|
- *source_object & 0x1ff
+ ((uw_object_hdr_t *)source_object)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*(ushort *)((char *)source_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (((ushort *)source_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (((ushort *)source_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*(ushort *)source_object >> 9) & 0x7
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*(ushort *)source_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (source_object[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (source_object[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*source_object >> 9) & 0x7
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*source_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*(byte *)((char *)source_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)source_object)->flags_res
|
- (*(byte *)((char *)source_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)source_object)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*(ushort *)((char *)source_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (((ushort *)source_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (((ushort *)source_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*(ushort *)source_object >> 12) & 0x1
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*(ushort *)source_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (source_object[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (source_object[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*source_object >> 12) & 0x1
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*source_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*(byte *)((char *)source_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)source_object)->enchanted
|
- (*(byte *)((char *)source_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)source_object)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*(ushort *)((char *)source_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (((ushort *)source_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (((ushort *)source_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*(ushort *)source_object >> 13) & 0x1
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*(ushort *)source_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (source_object[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (source_object[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*source_object >> 13) & 0x1
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*source_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*(byte *)((char *)source_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)source_object)->doordir
|
- (*(byte *)((char *)source_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)source_object)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*(ushort *)((char *)source_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (((ushort *)source_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (((ushort *)source_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*(ushort *)source_object >> 14) & 0x1
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*(ushort *)source_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (source_object[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (source_object[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*source_object >> 14) & 0x1
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*source_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*(byte *)((char *)source_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)source_object)->invisible
|
- (*(byte *)((char *)source_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)source_object)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*(ushort *)((char *)source_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- *(ushort *)((char *)source_object + 0x0) >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (((ushort *)source_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (((ushort *)source_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- ((ushort *)source_object)[0] >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*(ushort *)source_object >> 15) & 0x1
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*(ushort *)source_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- *(ushort *)source_object >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (source_object[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (source_object[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- source_object[0] >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*source_object >> 15) & 0x1
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*source_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- *source_object >> 15
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*(byte *)((char *)source_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- (*(byte *)((char *)source_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)source_object)->is_quant
|
- *(byte *)((char *)source_object + 0x1) >> 7
+ ((uw_object_hdr_t *)source_object)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)source_object)->zpos
|
- ((ushort *)source_object)[1] & 0x7f
+ ((uw_object_hdr_t *)source_object)->zpos
|
- source_object[1] & 0x7f
+ ((uw_object_hdr_t *)source_object)->zpos
|
- *(byte *)((char *)source_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)source_object)->zpos
|
- (byte)source_object[1] & 0x7f
+ ((uw_object_hdr_t *)source_object)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)source_object)->heading
|
- (*(ushort *)((char *)source_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)source_object)->heading
|
- (((ushort *)source_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)source_object)->heading
|
- (((ushort *)source_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)source_object)->heading
|
- (source_object[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)source_object)->heading
|
- (source_object[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)source_object)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (*(ushort *)((char *)source_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (((ushort *)source_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (((ushort *)source_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (source_object[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (source_object[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (*(byte *)((char *)source_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)source_object)->ypos
|
- (*(byte *)((char *)source_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)source_object)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (*(ushort *)((char *)source_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)source_object)->xpos
|
- *(ushort *)((char *)source_object + 0x2) >> 13
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (((ushort *)source_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (((ushort *)source_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)source_object)->xpos
|
- ((ushort *)source_object)[1] >> 13
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (source_object[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (source_object[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)source_object)->xpos
|
- source_object[1] >> 13
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (*(byte *)((char *)source_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)source_object)->xpos
|
- (*(byte *)((char *)source_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)source_object)->xpos
|
- *(byte *)((char *)source_object + 0x3) >> 5
+ ((uw_object_hdr_t *)source_object)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)source_object)->quality
|
- ((ushort *)source_object)[2] & 0x3f
+ ((uw_object_hdr_t *)source_object)->quality
|
- source_object[2] & 0x3f
+ ((uw_object_hdr_t *)source_object)->quality
|
- *(byte *)((char *)source_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)source_object)->quality
|
- (byte)source_object[2] & 0x3f
+ ((uw_object_hdr_t *)source_object)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source_object)->next
|
- (*(ushort *)((char *)source_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source_object)->next
|
- *(ushort *)((char *)source_object + 0x4) >> 6
+ ((uw_object_hdr_t *)source_object)->next
|
- (((ushort *)source_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source_object)->next
|
- (((ushort *)source_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source_object)->next
|
- ((ushort *)source_object)[2] >> 6
+ ((uw_object_hdr_t *)source_object)->next
|
- (source_object[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source_object)->next
|
- (source_object[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source_object)->next
|
- source_object[2] >> 6
+ ((uw_object_hdr_t *)source_object)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)source_object)->owner
|
- ((ushort *)source_object)[3] & 0x3f
+ ((uw_object_hdr_t *)source_object)->owner
|
- source_object[3] & 0x3f
+ ((uw_object_hdr_t *)source_object)->owner
|
- *(byte *)((char *)source_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)source_object)->owner
|
- (byte)source_object[3] & 0x3f
+ ((uw_object_hdr_t *)source_object)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source_object)->link
|
- (*(ushort *)((char *)source_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source_object)->link
|
- *(ushort *)((char *)source_object + 0x6) >> 6
+ ((uw_object_hdr_t *)source_object)->link
|
- (((ushort *)source_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source_object)->link
|
- (((ushort *)source_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source_object)->link
|
- ((ushort *)source_object)[3] >> 6
+ ((uw_object_hdr_t *)source_object)->link
|
- (source_object[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source_object)->link
|
- (source_object[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source_object)->link
|
- source_object[3] >> 6
+ ((uw_object_hdr_t *)source_object)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

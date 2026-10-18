@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_ptr)->object_id
|
- ((ushort *)object_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_ptr)->object_id
|
- *(ushort *)object_ptr & 0x1ff
+ ((uw_object_hdr_t *)object_ptr)->object_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (((ushort *)object_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (((ushort *)object_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(ushort *)object_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(ushort *)object_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(byte *)((char *)object_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(byte *)((char *)object_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_ptr)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (((ushort *)object_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (((ushort *)object_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(ushort *)object_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(ushort *)object_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(byte *)((char *)object_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_ptr)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (((ushort *)object_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (((ushort *)object_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(ushort *)object_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(ushort *)object_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(byte *)((char *)object_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_ptr)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (((ushort *)object_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (((ushort *)object_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(ushort *)object_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(ushort *)object_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(byte *)((char *)object_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_ptr)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (((ushort *)object_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (((ushort *)object_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(ushort *)object_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(ushort *)object_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(byte *)((char *)object_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- *(byte *)((char *)object_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)object_ptr)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_ptr)->zpos
|
- ((ushort *)object_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)object_ptr)->zpos
|
- *(byte *)((char *)object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_ptr)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->heading
|
- (*(ushort *)((char *)object_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_ptr)->heading
|
- (((ushort *)object_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->heading
|
- (((ushort *)object_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_ptr)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (*(ushort *)((char *)object_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (((ushort *)object_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (((ushort *)object_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (*(byte *)((char *)object_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (*(byte *)((char *)object_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_ptr)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (*(ushort *)((char *)object_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (((ushort *)object_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (((ushort *)object_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (*(byte *)((char *)object_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (*(byte *)((char *)object_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- *(byte *)((char *)object_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)object_ptr)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->quality
|
- ((ushort *)object_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->quality
|
- *(byte *)((char *)object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->next
|
- (*(ushort *)((char *)object_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->next
|
- (((ushort *)object_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->next
|
- (((ushort *)object_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->owner
|
- ((ushort *)object_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->owner
|
- *(byte *)((char *)object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->link
|
- (*(ushort *)((char *)object_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->link
|
- (((ushort *)object_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->link
|
- (((ushort *)object_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->link
)
...>
}

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- CONCAT11(object[1], *object) & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
|
- CONCAT11(object[1], object[0]) & 0x1ff
+ ((uw_object_hdr_t *)object)->object_id
)
...>
}

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(ushort *)(object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (CONCAT11(object[1], *object) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (CONCAT11(object[1], *object) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (CONCAT11(object[1], object[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (CONCAT11(object[1], object[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)(object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)(object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
)
...>
}

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(ushort *)(object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (CONCAT11(object[1], *object) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (CONCAT11(object[1], *object) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (CONCAT11(object[1], object[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (CONCAT11(object[1], object[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)(object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)(object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
)
...>
}

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(ushort *)(object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (CONCAT11(object[1], *object) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (CONCAT11(object[1], *object) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (CONCAT11(object[1], object[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (CONCAT11(object[1], object[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)(object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)(object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
)
...>
}

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(ushort *)(object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (CONCAT11(object[1], *object) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (CONCAT11(object[1], *object) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (CONCAT11(object[1], object[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (CONCAT11(object[1], object[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)(object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)(object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
)
...>
}

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(ushort *)(object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (CONCAT11(object[1], *object) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (CONCAT11(object[1], *object) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object)->is_quant
|
- (CONCAT11(object[1], object[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (CONCAT11(object[1], object[0]) & 0x8000) >> 15
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
|
- (*(byte *)(object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object)->is_quant
|
- (*(byte *)(object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
|
- *(byte *)(object + 0x1) >> 7
+ ((uw_object_hdr_t *)object)->is_quant
)
...>
}

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- *(byte *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- object[2] & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
|
- *(byte *)(object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
)
...>
}

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object)->heading
|
- (*(ushort *)(object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object)->heading
)
...>
}

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(ushort *)(object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)(object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)(object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
)
...>
}

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(ushort *)(object + 0x2) & 0xe000) >> 13
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
|
- (*(byte *)(object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object)->xpos
|
- (*(byte *)(object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object)->xpos
|
- *(byte *)(object + 0x3) >> 5
+ ((uw_object_hdr_t *)object)->xpos
)
...>
}

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- *(byte *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- object[4] & 0x3f
+ ((uw_object_hdr_t *)object)->quality
|
- *(byte *)(object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
)
...>
}

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->next
|
- (*(ushort *)(object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->next
)
...>
}

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- *(byte *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- object[6] & 0x3f
+ ((uw_object_hdr_t *)object)->owner
|
- *(byte *)(object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
)
...>
}

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- (*(ushort *)(object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object)->link
|
- (*(ushort *)(object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object)->link
)
...>
}

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- (*(byte *)((char *)object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object)->flags_res
|
- (*(byte *)((char *)object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- (*(byte *)((char *)object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object)->enchanted
|
- (*(byte *)((char *)object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- (*(byte *)((char *)object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object)->doordir
|
- (*(byte *)((char *)object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- (*(byte *)((char *)object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object)->invisible
|
- (*(byte *)((char *)object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- *(byte *)((char *)object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- (*(byte *)((char *)object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object)->ypos
|
- (*(byte *)((char *)object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- *(byte *)((char *)object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
- *(byte *)((char *)object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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
)
...>
}

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar2)->object_id
|
- ((ushort *)pbVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar2)->object_id
|
- *(ushort *)pbVar2 & 0x1ff
+ ((uw_object_hdr_t *)pbVar2)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (*(ushort *)((char *)pbVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (((ushort *)pbVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (((ushort *)pbVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (*(ushort *)pbVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (*(ushort *)pbVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (*(byte *)((char *)pbVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->flags_res
|
- (*(byte *)((char *)pbVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar2)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (*(ushort *)((char *)pbVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (((ushort *)pbVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (((ushort *)pbVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (*(ushort *)pbVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (*(ushort *)pbVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (*(byte *)((char *)pbVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->enchanted
|
- (*(byte *)((char *)pbVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar2)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (*(ushort *)((char *)pbVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (((ushort *)pbVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (((ushort *)pbVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (*(ushort *)pbVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (*(ushort *)pbVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (*(byte *)((char *)pbVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->doordir
|
- (*(byte *)((char *)pbVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar2)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (*(ushort *)((char *)pbVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (((ushort *)pbVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (((ushort *)pbVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (*(ushort *)pbVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (*(ushort *)pbVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (*(byte *)((char *)pbVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->invisible
|
- (*(byte *)((char *)pbVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar2)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (*(ushort *)((char *)pbVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (((ushort *)pbVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (((ushort *)pbVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (*(ushort *)pbVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (*(ushort *)pbVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (*(byte *)((char *)pbVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- (*(byte *)((char *)pbVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar2)->is_quant
|
- *(byte *)((char *)pbVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar2)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar2)->zpos
|
- ((ushort *)pbVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar2)->zpos
|
- *(byte *)((char *)pbVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar2)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->heading
|
- (*(ushort *)((char *)pbVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar2)->heading
|
- (((ushort *)pbVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->heading
|
- (((ushort *)pbVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar2)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->ypos
|
- (*(ushort *)((char *)pbVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar2)->ypos
|
- (((ushort *)pbVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->ypos
|
- (((ushort *)pbVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar2)->ypos
|
- (*(byte *)((char *)pbVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->ypos
|
- (*(byte *)((char *)pbVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar2)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->xpos
|
- (*(ushort *)((char *)pbVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar2)->xpos
|
- (((ushort *)pbVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->xpos
|
- (((ushort *)pbVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar2)->xpos
|
- (*(byte *)((char *)pbVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar2)->xpos
|
- (*(byte *)((char *)pbVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar2)->xpos
|
- *(byte *)((char *)pbVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar2)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar2)->quality
|
- ((ushort *)pbVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar2)->quality
|
- *(byte *)((char *)pbVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar2)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar2)->next
|
- (*(ushort *)((char *)pbVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar2)->next
|
- (((ushort *)pbVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar2)->next
|
- (((ushort *)pbVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar2)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar2)->owner
|
- ((ushort *)pbVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar2)->owner
|
- *(byte *)((char *)pbVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar2)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar2)->link
|
- (*(ushort *)((char *)pbVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar2)->link
|
- (((ushort *)pbVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar2)->link
|
- (((ushort *)pbVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar2)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->object_id
|
- ((ushort *)pbVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->object_id
|
- *(ushort *)pbVar4 & 0x1ff
+ ((uw_object_hdr_t *)pbVar4)->object_id
)
...>
}

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (((ushort *)pbVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (((ushort *)pbVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)pbVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(ushort *)pbVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->flags_res
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar4)->flags_res
)
...>
}

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (((ushort *)pbVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (((ushort *)pbVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)pbVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(ushort *)pbVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->enchanted
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar4)->enchanted
)
...>
}

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (((ushort *)pbVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (((ushort *)pbVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)pbVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(ushort *)pbVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->doordir
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar4)->doordir
)
...>
}

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (((ushort *)pbVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (((ushort *)pbVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)pbVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(ushort *)pbVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->invisible
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar4)->invisible
)
...>
}

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)((char *)pbVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (((ushort *)pbVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (((ushort *)pbVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)pbVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(ushort *)pbVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(byte *)((char *)pbVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- (*(byte *)((char *)pbVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar4)->is_quant
|
- *(byte *)((char *)pbVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar4)->is_quant
)
...>
}

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
|
- ((ushort *)pbVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
|
- *(byte *)((char *)pbVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar4)->zpos
)
...>
}

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (*(ushort *)((char *)pbVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (((ushort *)pbVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->heading
|
- (((ushort *)pbVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar4)->heading
)
...>
}

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(ushort *)((char *)pbVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (((ushort *)pbVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (((ushort *)pbVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(byte *)((char *)pbVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->ypos
|
- (*(byte *)((char *)pbVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar4)->ypos
)
...>
}

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(ushort *)((char *)pbVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (((ushort *)pbVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (((ushort *)pbVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(byte *)((char *)pbVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- (*(byte *)((char *)pbVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar4)->xpos
|
- *(byte *)((char *)pbVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar4)->xpos
)
...>
}

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
|
- ((ushort *)pbVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
|
- *(byte *)((char *)pbVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->quality
)
...>
}

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (*(ushort *)((char *)pbVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (((ushort *)pbVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->next
|
- (((ushort *)pbVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->next
)
...>
}

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
|
- ((ushort *)pbVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
|
- *(byte *)((char *)pbVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar4)->owner
)
...>
}

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_list_unlink\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (*(ushort *)((char *)pbVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (((ushort *)pbVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar4)->link
|
- (((ushort *)pbVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar4)->link
)
...>
}

@field_6_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar1)->flags_res
|
- (*(byte *)((char *)puVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar1)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar1)->enchanted
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar1)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar1)->doordir
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar1)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (*(byte *)((char *)puVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar1)->invisible
|
- (*(byte *)((char *)puVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar1)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (((ushort *)puVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (((ushort *)puVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar1)->is_quant
|
- (*(ushort *)puVar1 & 0x8000) >> 15
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

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- *(byte *)((char *)puVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar1)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (*(byte *)((char *)puVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar1)->ypos
|
- (*(byte *)((char *)puVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar1)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (((ushort *)puVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar1)->xpos
|
- (((ushort *)puVar1)[1] & 0xe000) >> 13
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

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- *(byte *)((char *)puVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (((ushort *)puVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->next
|
- (((ushort *)puVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- *(byte *)((char *)puVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar1)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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
- (((ushort *)puVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar1)->link
|
- (((ushort *)puVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar1)->link
)
...>
}

@field_7_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_ptr)->object_id
|
- ((ushort *)object_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_ptr)->object_id
|
- *(ushort *)object_ptr & 0x1ff
+ ((uw_object_hdr_t *)object_ptr)->object_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (((ushort *)object_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (((ushort *)object_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(ushort *)object_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(ushort *)object_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(byte *)((char *)object_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->flags_res
|
- (*(byte *)((char *)object_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_ptr)->flags_res
)
...>
}

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (((ushort *)object_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (((ushort *)object_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(ushort *)object_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(ushort *)object_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(byte *)((char *)object_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->enchanted
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_ptr)->enchanted
)
...>
}

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (((ushort *)object_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (((ushort *)object_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(ushort *)object_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(ushort *)object_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(byte *)((char *)object_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->doordir
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_ptr)->doordir
)
...>
}

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (((ushort *)object_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (((ushort *)object_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(ushort *)object_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(ushort *)object_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(byte *)((char *)object_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->invisible
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_ptr)->invisible
)
...>
}

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(ushort *)((char *)object_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (((ushort *)object_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (((ushort *)object_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(ushort *)object_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(ushort *)object_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(byte *)((char *)object_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- (*(byte *)((char *)object_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_ptr)->is_quant
|
- *(byte *)((char *)object_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)object_ptr)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_ptr)->zpos
|
- ((ushort *)object_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)object_ptr)->zpos
|
- *(byte *)((char *)object_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_ptr)->zpos
)
...>
}

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->heading
|
- (*(ushort *)((char *)object_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_ptr)->heading
|
- (((ushort *)object_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->heading
|
- (((ushort *)object_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_ptr)->heading
)
...>
}

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (*(ushort *)((char *)object_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (((ushort *)object_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (((ushort *)object_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (*(byte *)((char *)object_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->ypos
|
- (*(byte *)((char *)object_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_ptr)->ypos
)
...>
}

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (*(ushort *)((char *)object_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (((ushort *)object_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (((ushort *)object_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (*(byte *)((char *)object_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- (*(byte *)((char *)object_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_ptr)->xpos
|
- *(byte *)((char *)object_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)object_ptr)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->quality
|
- ((ushort *)object_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->quality
|
- *(byte *)((char *)object_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->quality
)
...>
}

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->next
|
- (*(ushort *)((char *)object_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->next
|
- (((ushort *)object_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->next
|
- (((ushort *)object_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->next
)
...>
}

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->owner
|
- ((ushort *)object_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->owner
|
- *(byte *)((char *)object_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_ptr)->owner
)
...>
}

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->link
|
- (*(ushort *)((char *)object_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->link
|
- (((ushort *)object_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_ptr)->link
|
- (((ushort *)object_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_ptr)->link
)
...>
}

@field_8_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@field_9_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)discarded)->object_id
|
- ((ushort *)discarded)[0] & 0x1ff
+ ((uw_object_hdr_t *)discarded)->object_id
|
- *(ushort *)discarded & 0x1ff
+ ((uw_object_hdr_t *)discarded)->object_id
|
- discarded[0] & 0x1ff
+ ((uw_object_hdr_t *)discarded)->object_id
|
- *discarded & 0x1ff
+ ((uw_object_hdr_t *)discarded)->object_id
)
...>
}

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*(ushort *)((char *)discarded + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (((ushort *)discarded)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (((ushort *)discarded)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*(ushort *)discarded >> 9) & 0x7
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*(ushort *)discarded & 0xe00) >> 9
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (discarded[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (discarded[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*discarded >> 9) & 0x7
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*discarded & 0xe00) >> 9
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*(byte *)((char *)discarded + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)discarded)->flags_res
|
- (*(byte *)((char *)discarded + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)discarded)->flags_res
)
...>
}

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*(ushort *)((char *)discarded + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (((ushort *)discarded)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (((ushort *)discarded)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*(ushort *)discarded >> 12) & 0x1
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*(ushort *)discarded & 0x1000) >> 12
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (discarded[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (discarded[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*discarded >> 12) & 0x1
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*discarded & 0x1000) >> 12
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*(byte *)((char *)discarded + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)discarded)->enchanted
|
- (*(byte *)((char *)discarded + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)discarded)->enchanted
)
...>
}

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*(ushort *)((char *)discarded + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (((ushort *)discarded)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (((ushort *)discarded)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*(ushort *)discarded >> 13) & 0x1
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*(ushort *)discarded & 0x2000) >> 13
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (discarded[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (discarded[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*discarded >> 13) & 0x1
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*discarded & 0x2000) >> 13
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*(byte *)((char *)discarded + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)discarded)->doordir
|
- (*(byte *)((char *)discarded + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)discarded)->doordir
)
...>
}

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*(ushort *)((char *)discarded + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (((ushort *)discarded)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (((ushort *)discarded)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*(ushort *)discarded >> 14) & 0x1
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*(ushort *)discarded & 0x4000) >> 14
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (discarded[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (discarded[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*discarded >> 14) & 0x1
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*discarded & 0x4000) >> 14
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*(byte *)((char *)discarded + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)discarded)->invisible
|
- (*(byte *)((char *)discarded + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)discarded)->invisible
)
...>
}

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*(ushort *)((char *)discarded + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- *(ushort *)((char *)discarded + 0x0) >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (((ushort *)discarded)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (((ushort *)discarded)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- ((ushort *)discarded)[0] >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*(ushort *)discarded >> 15) & 0x1
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*(ushort *)discarded & 0x8000) >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- *(ushort *)discarded >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (discarded[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (discarded[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- discarded[0] >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*discarded >> 15) & 0x1
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*discarded & 0x8000) >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- *discarded >> 15
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*(byte *)((char *)discarded + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- (*(byte *)((char *)discarded + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)discarded)->is_quant
|
- *(byte *)((char *)discarded + 0x1) >> 7
+ ((uw_object_hdr_t *)discarded)->is_quant
)
...>
}

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x2) & 0x7f
+ ((uw_object_hdr_t *)discarded)->zpos
|
- ((ushort *)discarded)[1] & 0x7f
+ ((uw_object_hdr_t *)discarded)->zpos
|
- discarded[1] & 0x7f
+ ((uw_object_hdr_t *)discarded)->zpos
|
- *(byte *)((char *)discarded + 0x2) & 0x7f
+ ((uw_object_hdr_t *)discarded)->zpos
|
- (byte)discarded[1] & 0x7f
+ ((uw_object_hdr_t *)discarded)->zpos
)
...>
}

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)discarded)->heading
|
- (*(ushort *)((char *)discarded + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)discarded)->heading
|
- (((ushort *)discarded)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)discarded)->heading
|
- (((ushort *)discarded)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)discarded)->heading
|
- (discarded[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)discarded)->heading
|
- (discarded[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)discarded)->heading
)
...>
}

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (*(ushort *)((char *)discarded + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (((ushort *)discarded)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (((ushort *)discarded)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (discarded[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (discarded[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (*(byte *)((char *)discarded + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)discarded)->ypos
|
- (*(byte *)((char *)discarded + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)discarded)->ypos
)
...>
}

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (*(ushort *)((char *)discarded + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)discarded)->xpos
|
- *(ushort *)((char *)discarded + 0x2) >> 13
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (((ushort *)discarded)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (((ushort *)discarded)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)discarded)->xpos
|
- ((ushort *)discarded)[1] >> 13
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (discarded[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (discarded[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)discarded)->xpos
|
- discarded[1] >> 13
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (*(byte *)((char *)discarded + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)discarded)->xpos
|
- (*(byte *)((char *)discarded + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)discarded)->xpos
|
- *(byte *)((char *)discarded + 0x3) >> 5
+ ((uw_object_hdr_t *)discarded)->xpos
)
...>
}

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x4) & 0x3f
+ ((uw_object_hdr_t *)discarded)->quality
|
- ((ushort *)discarded)[2] & 0x3f
+ ((uw_object_hdr_t *)discarded)->quality
|
- discarded[2] & 0x3f
+ ((uw_object_hdr_t *)discarded)->quality
|
- *(byte *)((char *)discarded + 0x4) & 0x3f
+ ((uw_object_hdr_t *)discarded)->quality
|
- (byte)discarded[2] & 0x3f
+ ((uw_object_hdr_t *)discarded)->quality
)
...>
}

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)discarded)->next
|
- (*(ushort *)((char *)discarded + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)discarded)->next
|
- *(ushort *)((char *)discarded + 0x4) >> 6
+ ((uw_object_hdr_t *)discarded)->next
|
- (((ushort *)discarded)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)discarded)->next
|
- (((ushort *)discarded)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)discarded)->next
|
- ((ushort *)discarded)[2] >> 6
+ ((uw_object_hdr_t *)discarded)->next
|
- (discarded[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)discarded)->next
|
- (discarded[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)discarded)->next
|
- discarded[2] >> 6
+ ((uw_object_hdr_t *)discarded)->next
)
...>
}

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0x6) & 0x3f
+ ((uw_object_hdr_t *)discarded)->owner
|
- ((ushort *)discarded)[3] & 0x3f
+ ((uw_object_hdr_t *)discarded)->owner
|
- discarded[3] & 0x3f
+ ((uw_object_hdr_t *)discarded)->owner
|
- *(byte *)((char *)discarded + 0x6) & 0x3f
+ ((uw_object_hdr_t *)discarded)->owner
|
- (byte)discarded[3] & 0x3f
+ ((uw_object_hdr_t *)discarded)->owner
)
...>
}

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)discarded + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)discarded)->link
|
- (*(ushort *)((char *)discarded + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)discarded)->link
|
- *(ushort *)((char *)discarded + 0x6) >> 6
+ ((uw_object_hdr_t *)discarded)->link
|
- (((ushort *)discarded)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)discarded)->link
|
- (((ushort *)discarded)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)discarded)->link
|
- ((ushort *)discarded)[3] >> 6
+ ((uw_object_hdr_t *)discarded)->link
|
- (discarded[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)discarded)->link
|
- (discarded[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)discarded)->link
|
- discarded[3] >> 6
+ ((uw_object_hdr_t *)discarded)->link
)
...>
}

@field_10_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)settled)->object_id
|
- ((ushort *)settled)[0] & 0x1ff
+ ((uw_object_hdr_t *)settled)->object_id
|
- *(ushort *)settled & 0x1ff
+ ((uw_object_hdr_t *)settled)->object_id
|
- settled[0] & 0x1ff
+ ((uw_object_hdr_t *)settled)->object_id
|
- *settled & 0x1ff
+ ((uw_object_hdr_t *)settled)->object_id
)
...>
}

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*(ushort *)((char *)settled + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (((ushort *)settled)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (((ushort *)settled)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*(ushort *)settled >> 9) & 0x7
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*(ushort *)settled & 0xe00) >> 9
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (settled[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (settled[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*settled >> 9) & 0x7
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*settled & 0xe00) >> 9
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*(byte *)((char *)settled + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)settled)->flags_res
|
- (*(byte *)((char *)settled + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)settled)->flags_res
)
...>
}

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*(ushort *)((char *)settled + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (((ushort *)settled)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (((ushort *)settled)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*(ushort *)settled >> 12) & 0x1
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*(ushort *)settled & 0x1000) >> 12
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (settled[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (settled[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*settled >> 12) & 0x1
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*settled & 0x1000) >> 12
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*(byte *)((char *)settled + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)settled)->enchanted
|
- (*(byte *)((char *)settled + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)settled)->enchanted
)
...>
}

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*(ushort *)((char *)settled + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)settled)->doordir
|
- (((ushort *)settled)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)settled)->doordir
|
- (((ushort *)settled)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*(ushort *)settled >> 13) & 0x1
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*(ushort *)settled & 0x2000) >> 13
+ ((uw_object_hdr_t *)settled)->doordir
|
- (settled[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)settled)->doordir
|
- (settled[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*settled >> 13) & 0x1
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*settled & 0x2000) >> 13
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*(byte *)((char *)settled + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)settled)->doordir
|
- (*(byte *)((char *)settled + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)settled)->doordir
)
...>
}

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*(ushort *)((char *)settled + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)settled)->invisible
|
- (((ushort *)settled)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)settled)->invisible
|
- (((ushort *)settled)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*(ushort *)settled >> 14) & 0x1
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*(ushort *)settled & 0x4000) >> 14
+ ((uw_object_hdr_t *)settled)->invisible
|
- (settled[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)settled)->invisible
|
- (settled[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*settled >> 14) & 0x1
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*settled & 0x4000) >> 14
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*(byte *)((char *)settled + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)settled)->invisible
|
- (*(byte *)((char *)settled + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)settled)->invisible
)
...>
}

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*(ushort *)((char *)settled + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- *(ushort *)((char *)settled + 0x0) >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (((ushort *)settled)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (((ushort *)settled)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- ((ushort *)settled)[0] >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*(ushort *)settled >> 15) & 0x1
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*(ushort *)settled & 0x8000) >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- *(ushort *)settled >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (settled[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (settled[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- settled[0] >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*settled >> 15) & 0x1
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*settled & 0x8000) >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- *settled >> 15
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*(byte *)((char *)settled + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)settled)->is_quant
|
- (*(byte *)((char *)settled + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)settled)->is_quant
|
- *(byte *)((char *)settled + 0x1) >> 7
+ ((uw_object_hdr_t *)settled)->is_quant
)
...>
}

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x2) & 0x7f
+ ((uw_object_hdr_t *)settled)->zpos
|
- ((ushort *)settled)[1] & 0x7f
+ ((uw_object_hdr_t *)settled)->zpos
|
- settled[1] & 0x7f
+ ((uw_object_hdr_t *)settled)->zpos
|
- *(byte *)((char *)settled + 0x2) & 0x7f
+ ((uw_object_hdr_t *)settled)->zpos
|
- (byte)settled[1] & 0x7f
+ ((uw_object_hdr_t *)settled)->zpos
)
...>
}

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)settled)->heading
|
- (*(ushort *)((char *)settled + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)settled)->heading
|
- (((ushort *)settled)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)settled)->heading
|
- (((ushort *)settled)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)settled)->heading
|
- (settled[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)settled)->heading
|
- (settled[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)settled)->heading
)
...>
}

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)settled)->ypos
|
- (*(ushort *)((char *)settled + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)settled)->ypos
|
- (((ushort *)settled)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)settled)->ypos
|
- (((ushort *)settled)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)settled)->ypos
|
- (settled[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)settled)->ypos
|
- (settled[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)settled)->ypos
|
- (*(byte *)((char *)settled + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)settled)->ypos
|
- (*(byte *)((char *)settled + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)settled)->ypos
)
...>
}

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)settled)->xpos
|
- (*(ushort *)((char *)settled + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)settled)->xpos
|
- *(ushort *)((char *)settled + 0x2) >> 13
+ ((uw_object_hdr_t *)settled)->xpos
|
- (((ushort *)settled)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)settled)->xpos
|
- (((ushort *)settled)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)settled)->xpos
|
- ((ushort *)settled)[1] >> 13
+ ((uw_object_hdr_t *)settled)->xpos
|
- (settled[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)settled)->xpos
|
- (settled[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)settled)->xpos
|
- settled[1] >> 13
+ ((uw_object_hdr_t *)settled)->xpos
|
- (*(byte *)((char *)settled + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)settled)->xpos
|
- (*(byte *)((char *)settled + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)settled)->xpos
|
- *(byte *)((char *)settled + 0x3) >> 5
+ ((uw_object_hdr_t *)settled)->xpos
)
...>
}

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x4) & 0x3f
+ ((uw_object_hdr_t *)settled)->quality
|
- ((ushort *)settled)[2] & 0x3f
+ ((uw_object_hdr_t *)settled)->quality
|
- settled[2] & 0x3f
+ ((uw_object_hdr_t *)settled)->quality
|
- *(byte *)((char *)settled + 0x4) & 0x3f
+ ((uw_object_hdr_t *)settled)->quality
|
- (byte)settled[2] & 0x3f
+ ((uw_object_hdr_t *)settled)->quality
)
...>
}

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)settled)->next
|
- (*(ushort *)((char *)settled + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)settled)->next
|
- *(ushort *)((char *)settled + 0x4) >> 6
+ ((uw_object_hdr_t *)settled)->next
|
- (((ushort *)settled)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)settled)->next
|
- (((ushort *)settled)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)settled)->next
|
- ((ushort *)settled)[2] >> 6
+ ((uw_object_hdr_t *)settled)->next
|
- (settled[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)settled)->next
|
- (settled[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)settled)->next
|
- settled[2] >> 6
+ ((uw_object_hdr_t *)settled)->next
)
...>
}

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0x6) & 0x3f
+ ((uw_object_hdr_t *)settled)->owner
|
- ((ushort *)settled)[3] & 0x3f
+ ((uw_object_hdr_t *)settled)->owner
|
- settled[3] & 0x3f
+ ((uw_object_hdr_t *)settled)->owner
|
- *(byte *)((char *)settled + 0x6) & 0x3f
+ ((uw_object_hdr_t *)settled)->owner
|
- (byte)settled[3] & 0x3f
+ ((uw_object_hdr_t *)settled)->owner
)
...>
}

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)settled + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)settled)->link
|
- (*(ushort *)((char *)settled + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)settled)->link
|
- *(ushort *)((char *)settled + 0x6) >> 6
+ ((uw_object_hdr_t *)settled)->link
|
- (((ushort *)settled)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)settled)->link
|
- (((ushort *)settled)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)settled)->link
|
- ((ushort *)settled)[3] >> 6
+ ((uw_object_hdr_t *)settled)->link
|
- (settled[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)settled)->link
|
- (settled[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)settled)->link
|
- settled[3] >> 6
+ ((uw_object_hdr_t *)settled)->link
)
...>
}

@field_11_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@field_12_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)contents)->object_id
|
- ((ushort *)contents)[0] & 0x1ff
+ ((uw_object_hdr_t *)contents)->object_id
|
- *(ushort *)contents & 0x1ff
+ ((uw_object_hdr_t *)contents)->object_id
|
- *(ushort *)(contents + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)contents)->object_id
)
...>
}

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)((char *)contents + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (((ushort *)contents)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (((ushort *)contents)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)contents >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)contents & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)(contents + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(ushort *)(contents + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)((char *)contents + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)((char *)contents + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)(contents + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)contents)->flags_res
|
- (*(byte *)(contents + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)contents)->flags_res
)
...>
}

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)((char *)contents + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (((ushort *)contents)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (((ushort *)contents)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)contents >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)contents & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)(contents + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(ushort *)(contents + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)((char *)contents + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)((char *)contents + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)(contents + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)contents)->enchanted
|
- (*(byte *)(contents + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)contents)->enchanted
)
...>
}

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)((char *)contents + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (((ushort *)contents)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (((ushort *)contents)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)contents >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)contents & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)(contents + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(ushort *)(contents + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)((char *)contents + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)((char *)contents + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)(contents + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)contents)->doordir
|
- (*(byte *)(contents + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)contents)->doordir
)
...>
}

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)((char *)contents + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (((ushort *)contents)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (((ushort *)contents)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)contents >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)contents & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)(contents + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(ushort *)(contents + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)((char *)contents + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)((char *)contents + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)(contents + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)contents)->invisible
|
- (*(byte *)(contents + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)contents)->invisible
)
...>
}

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)((char *)contents + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (((ushort *)contents)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (((ushort *)contents)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)contents >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)contents & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)(contents + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(ushort *)(contents + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)((char *)contents + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)((char *)contents + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
|
- *(byte *)((char *)contents + 0x1) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)(contents + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)contents)->is_quant
|
- (*(byte *)(contents + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
|
- *(byte *)(contents + 0x1) >> 7
+ ((uw_object_hdr_t *)contents)->is_quant
)
...>
}

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- ((ushort *)contents)[1] & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- *(ushort *)(contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- *(byte *)((char *)contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
|
- *(byte *)(contents + 0x2) & 0x7f
+ ((uw_object_hdr_t *)contents)->zpos
)
...>
}

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)contents)->heading
|
- (*(ushort *)((char *)contents + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)contents)->heading
|
- (((ushort *)contents)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)contents)->heading
|
- (((ushort *)contents)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)contents)->heading
|
- (*(ushort *)(contents + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)contents)->heading
|
- (*(ushort *)(contents + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)contents)->heading
)
...>
}

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(ushort *)((char *)contents + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)contents)->ypos
|
- (((ushort *)contents)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (((ushort *)contents)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(ushort *)(contents + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(ushort *)(contents + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)((char *)contents + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)((char *)contents + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)(contents + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)contents)->ypos
|
- (*(byte *)(contents + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)contents)->ypos
)
...>
}

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(ushort *)((char *)contents + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)contents)->xpos
|
- (((ushort *)contents)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (((ushort *)contents)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(ushort *)(contents + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(ushort *)(contents + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)((char *)contents + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)((char *)contents + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
|
- *(byte *)((char *)contents + 0x3) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)(contents + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)contents)->xpos
|
- (*(byte *)(contents + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
|
- *(byte *)(contents + 0x3) >> 5
+ ((uw_object_hdr_t *)contents)->xpos
)
...>
}

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- ((ushort *)contents)[2] & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- *(ushort *)(contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- *(byte *)((char *)contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
|
- *(byte *)(contents + 0x4) & 0x3f
+ ((uw_object_hdr_t *)contents)->quality
)
...>
}

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->next
|
- (*(ushort *)((char *)contents + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->next
|
- (((ushort *)contents)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->next
|
- (((ushort *)contents)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->next
|
- (*(ushort *)(contents + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->next
|
- (*(ushort *)(contents + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->next
)
...>
}

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- ((ushort *)contents)[3] & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- *(ushort *)(contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- *(byte *)((char *)contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
|
- *(byte *)(contents + 0x6) & 0x3f
+ ((uw_object_hdr_t *)contents)->owner
)
...>
}

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)contents + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->link
|
- (*(ushort *)((char *)contents + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->link
|
- (((ushort *)contents)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->link
|
- (((ushort *)contents)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->link
|
- (*(ushort *)(contents + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)contents)->link
|
- (*(ushort *)(contents + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)contents)->link
)
...>
}

@field_13_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- *(ushort *)(iVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->object_id
|
- CONCAT11(iVar1[1], *iVar1) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->object_id
|
- CONCAT11(iVar1[1], iVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar1)->object_id
)
...>
}

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(ushort *)(iVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], *iVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], *iVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)((char *)iVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)(iVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar1)->flags_res
|
- (*(byte *)(iVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar1)->flags_res
)
...>
}

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(ushort *)(iVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], *iVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], *iVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)(iVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar1)->enchanted
|
- (*(byte *)(iVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar1)->enchanted
)
...>
}

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(ushort *)(iVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], *iVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], *iVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)(iVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar1)->doordir
|
- (*(byte *)(iVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar1)->doordir
)
...>
}

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(ushort *)(iVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], *iVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], *iVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)((char *)iVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)(iVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar1)->invisible
|
- (*(byte *)(iVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar1)->invisible
)
...>
}

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(ushort *)(iVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], *iVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], *iVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], iVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (CONCAT11(iVar1[1], iVar1[0]) & 0x8000) >> 15
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
|
- (*(byte *)(iVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- (*(byte *)(iVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
|
- *(byte *)(iVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar1)->is_quant
)
...>
}

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- *(ushort *)(iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(byte *)((char *)iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- iVar1[2] & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
|
- *(byte *)(iVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar1)->zpos
)
...>
}

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- (*(ushort *)(iVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar1)->heading
|
- (*(ushort *)(iVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar1)->heading
)
...>
}

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(ushort *)(iVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)((char *)iVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)(iVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar1)->ypos
|
- (*(byte *)(iVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar1)->ypos
)
...>
}

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- (*(ushort *)(iVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(ushort *)(iVar1 + 0x2) & 0xe000) >> 13
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
|
- (*(byte *)(iVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- (*(byte *)(iVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
|
- *(byte *)(iVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar1)->xpos
)
...>
}

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- *(ushort *)(iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(byte *)((char *)iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- iVar1[4] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
|
- *(byte *)(iVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->quality
)
...>
}

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- (*(ushort *)(iVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->next
|
- (*(ushort *)(iVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->next
)
...>
}

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
- *(ushort *)(iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(byte *)((char *)iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- iVar1[6] & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
|
- *(byte *)(iVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar1)->owner
)
...>
}

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- (*(ushort *)(iVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar1)->link
|
- (*(ushort *)(iVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar1)->link
)
...>
}

@field_14_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar2)->object_id
|
- ((ushort *)pcVar2)[0] & 0x1ff
+ ((uw_object_hdr_t *)pcVar2)->object_id
|
- *(ushort *)pcVar2 & 0x1ff
+ ((uw_object_hdr_t *)pcVar2)->object_id
|
- *(ushort *)(pcVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar2)->object_id
|
- CONCAT11(pcVar2[1], *pcVar2) & 0x1ff
+ ((uw_object_hdr_t *)pcVar2)->object_id
|
- CONCAT11(pcVar2[1], pcVar2[0]) & 0x1ff
+ ((uw_object_hdr_t *)pcVar2)->object_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(ushort *)((char *)pcVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (((ushort *)pcVar2)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (((ushort *)pcVar2)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(ushort *)pcVar2 >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(ushort *)pcVar2 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(ushort *)(pcVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(ushort *)(pcVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (CONCAT11(pcVar2[1], *pcVar2) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (CONCAT11(pcVar2[1], *pcVar2) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (CONCAT11(pcVar2[1], pcVar2[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (CONCAT11(pcVar2[1], pcVar2[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(byte *)((char *)pcVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(byte *)((char *)pcVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(byte *)(pcVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->flags_res
|
- (*(byte *)(pcVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar2)->flags_res
)
...>
}

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(ushort *)((char *)pcVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (((ushort *)pcVar2)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (((ushort *)pcVar2)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(ushort *)pcVar2 >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(ushort *)pcVar2 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(ushort *)(pcVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(ushort *)(pcVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (CONCAT11(pcVar2[1], *pcVar2) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (CONCAT11(pcVar2[1], *pcVar2) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (CONCAT11(pcVar2[1], pcVar2[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (CONCAT11(pcVar2[1], pcVar2[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(byte *)((char *)pcVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(byte *)((char *)pcVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(byte *)(pcVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->enchanted
|
- (*(byte *)(pcVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar2)->enchanted
)
...>
}

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(ushort *)((char *)pcVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (((ushort *)pcVar2)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (((ushort *)pcVar2)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(ushort *)pcVar2 >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(ushort *)pcVar2 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(ushort *)(pcVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(ushort *)(pcVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (CONCAT11(pcVar2[1], *pcVar2) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (CONCAT11(pcVar2[1], *pcVar2) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (CONCAT11(pcVar2[1], pcVar2[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (CONCAT11(pcVar2[1], pcVar2[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(byte *)((char *)pcVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(byte *)((char *)pcVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(byte *)(pcVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->doordir
|
- (*(byte *)(pcVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar2)->doordir
)
...>
}

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(ushort *)((char *)pcVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (((ushort *)pcVar2)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (((ushort *)pcVar2)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(ushort *)pcVar2 >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(ushort *)pcVar2 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(ushort *)(pcVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(ushort *)(pcVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (CONCAT11(pcVar2[1], *pcVar2) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (CONCAT11(pcVar2[1], *pcVar2) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (CONCAT11(pcVar2[1], pcVar2[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (CONCAT11(pcVar2[1], pcVar2[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(byte *)((char *)pcVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(byte *)((char *)pcVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(byte *)(pcVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->invisible
|
- (*(byte *)(pcVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar2)->invisible
)
...>
}

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(ushort *)((char *)pcVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (((ushort *)pcVar2)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (((ushort *)pcVar2)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(ushort *)pcVar2 >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(ushort *)pcVar2 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(ushort *)(pcVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(ushort *)(pcVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (CONCAT11(pcVar2[1], *pcVar2) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (CONCAT11(pcVar2[1], *pcVar2) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (CONCAT11(pcVar2[1], pcVar2[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (CONCAT11(pcVar2[1], pcVar2[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(byte *)((char *)pcVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(byte *)((char *)pcVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- *(byte *)((char *)pcVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(byte *)(pcVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- (*(byte *)(pcVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar2)->is_quant
|
- *(byte *)(pcVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar2)->is_quant
)
...>
}

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar2)->zpos
|
- ((ushort *)pcVar2)[1] & 0x7f
+ ((uw_object_hdr_t *)pcVar2)->zpos
|
- *(ushort *)(pcVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar2)->zpos
|
- *(byte *)((char *)pcVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar2)->zpos
|
- pcVar2[2] & 0x7f
+ ((uw_object_hdr_t *)pcVar2)->zpos
|
- *(byte *)(pcVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar2)->zpos
)
...>
}

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->heading
|
- (*(ushort *)((char *)pcVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar2)->heading
|
- (((ushort *)pcVar2)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->heading
|
- (((ushort *)pcVar2)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar2)->heading
|
- (*(ushort *)(pcVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->heading
|
- (*(ushort *)(pcVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar2)->heading
)
...>
}

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(ushort *)((char *)pcVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (((ushort *)pcVar2)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (((ushort *)pcVar2)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(ushort *)(pcVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(ushort *)(pcVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(byte *)((char *)pcVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(byte *)((char *)pcVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(byte *)(pcVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->ypos
|
- (*(byte *)(pcVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar2)->ypos
)
...>
}

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(ushort *)((char *)pcVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (((ushort *)pcVar2)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (((ushort *)pcVar2)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(ushort *)(pcVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(ushort *)(pcVar2 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(byte *)((char *)pcVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(byte *)((char *)pcVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- *(byte *)((char *)pcVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(byte *)(pcVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- (*(byte *)(pcVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar2)->xpos
|
- *(byte *)(pcVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar2)->xpos
)
...>
}

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->quality
|
- ((ushort *)pcVar2)[2] & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->quality
|
- *(ushort *)(pcVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->quality
|
- *(byte *)((char *)pcVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->quality
|
- pcVar2[4] & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->quality
|
- *(byte *)(pcVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->quality
)
...>
}

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar2)->next
|
- (*(ushort *)((char *)pcVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar2)->next
|
- (((ushort *)pcVar2)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar2)->next
|
- (((ushort *)pcVar2)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar2)->next
|
- (*(ushort *)(pcVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar2)->next
|
- (*(ushort *)(pcVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar2)->next
)
...>
}

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->owner
|
- ((ushort *)pcVar2)[3] & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->owner
|
- *(ushort *)(pcVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->owner
|
- *(byte *)((char *)pcVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->owner
|
- pcVar2[6] & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->owner
|
- *(byte *)(pcVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar2)->owner
)
...>
}

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar2)->link
|
- (*(ushort *)((char *)pcVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar2)->link
|
- (((ushort *)pcVar2)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar2)->link
|
- (((ushort *)pcVar2)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar2)->link
|
- (*(ushort *)(pcVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar2)->link
|
- (*(ushort *)(pcVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar2)->link
)
...>
}

@field_15_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar1)->object_id
|
- ((ushort *)pcVar1)[0] & 0x1ff
+ ((uw_object_hdr_t *)pcVar1)->object_id
|
- *(ushort *)pcVar1 & 0x1ff
+ ((uw_object_hdr_t *)pcVar1)->object_id
|
- *(ushort *)(pcVar1 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar1)->object_id
|
- CONCAT11(pcVar1[1], *pcVar1) & 0x1ff
+ ((uw_object_hdr_t *)pcVar1)->object_id
|
- CONCAT11(pcVar1[1], pcVar1[0]) & 0x1ff
+ ((uw_object_hdr_t *)pcVar1)->object_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(ushort *)((char *)pcVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (((ushort *)pcVar1)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (((ushort *)pcVar1)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(ushort *)pcVar1 >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(ushort *)pcVar1 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(ushort *)(pcVar1 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(ushort *)(pcVar1 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (CONCAT11(pcVar1[1], *pcVar1) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (CONCAT11(pcVar1[1], *pcVar1) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (CONCAT11(pcVar1[1], pcVar1[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (CONCAT11(pcVar1[1], pcVar1[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(byte *)((char *)pcVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(byte *)((char *)pcVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(byte *)(pcVar1 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->flags_res
|
- (*(byte *)(pcVar1 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar1)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(ushort *)((char *)pcVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (((ushort *)pcVar1)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (((ushort *)pcVar1)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(ushort *)pcVar1 >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(ushort *)pcVar1 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(ushort *)(pcVar1 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(ushort *)(pcVar1 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (CONCAT11(pcVar1[1], *pcVar1) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (CONCAT11(pcVar1[1], *pcVar1) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (CONCAT11(pcVar1[1], pcVar1[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (CONCAT11(pcVar1[1], pcVar1[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(byte *)((char *)pcVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(byte *)((char *)pcVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(byte *)(pcVar1 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->enchanted
|
- (*(byte *)(pcVar1 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar1)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(ushort *)((char *)pcVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (((ushort *)pcVar1)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (((ushort *)pcVar1)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(ushort *)pcVar1 >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(ushort *)pcVar1 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(ushort *)(pcVar1 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(ushort *)(pcVar1 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (CONCAT11(pcVar1[1], *pcVar1) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (CONCAT11(pcVar1[1], *pcVar1) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (CONCAT11(pcVar1[1], pcVar1[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (CONCAT11(pcVar1[1], pcVar1[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(byte *)((char *)pcVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(byte *)((char *)pcVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(byte *)(pcVar1 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->doordir
|
- (*(byte *)(pcVar1 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar1)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(ushort *)((char *)pcVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (((ushort *)pcVar1)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (((ushort *)pcVar1)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(ushort *)pcVar1 >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(ushort *)pcVar1 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(ushort *)(pcVar1 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(ushort *)(pcVar1 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (CONCAT11(pcVar1[1], *pcVar1) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (CONCAT11(pcVar1[1], *pcVar1) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (CONCAT11(pcVar1[1], pcVar1[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (CONCAT11(pcVar1[1], pcVar1[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(byte *)((char *)pcVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(byte *)((char *)pcVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(byte *)(pcVar1 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->invisible
|
- (*(byte *)(pcVar1 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar1)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(ushort *)((char *)pcVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (((ushort *)pcVar1)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (((ushort *)pcVar1)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(ushort *)pcVar1 >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(ushort *)pcVar1 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(ushort *)(pcVar1 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(ushort *)(pcVar1 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (CONCAT11(pcVar1[1], *pcVar1) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (CONCAT11(pcVar1[1], *pcVar1) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (CONCAT11(pcVar1[1], pcVar1[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (CONCAT11(pcVar1[1], pcVar1[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(byte *)((char *)pcVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(byte *)((char *)pcVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- *(byte *)((char *)pcVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(byte *)(pcVar1 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- (*(byte *)(pcVar1 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar1)->is_quant
|
- *(byte *)(pcVar1 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar1)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar1)->zpos
|
- ((ushort *)pcVar1)[1] & 0x7f
+ ((uw_object_hdr_t *)pcVar1)->zpos
|
- *(ushort *)(pcVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar1)->zpos
|
- *(byte *)((char *)pcVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar1)->zpos
|
- pcVar1[2] & 0x7f
+ ((uw_object_hdr_t *)pcVar1)->zpos
|
- *(byte *)(pcVar1 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar1)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->heading
|
- (*(ushort *)((char *)pcVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar1)->heading
|
- (((ushort *)pcVar1)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->heading
|
- (((ushort *)pcVar1)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar1)->heading
|
- (*(ushort *)(pcVar1 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->heading
|
- (*(ushort *)(pcVar1 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar1)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(ushort *)((char *)pcVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (((ushort *)pcVar1)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (((ushort *)pcVar1)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(ushort *)(pcVar1 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(ushort *)(pcVar1 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(byte *)((char *)pcVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(byte *)((char *)pcVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(byte *)(pcVar1 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->ypos
|
- (*(byte *)(pcVar1 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar1)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(ushort *)((char *)pcVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (((ushort *)pcVar1)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (((ushort *)pcVar1)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(ushort *)(pcVar1 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(ushort *)(pcVar1 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(byte *)((char *)pcVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(byte *)((char *)pcVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- *(byte *)((char *)pcVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(byte *)(pcVar1 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- (*(byte *)(pcVar1 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar1)->xpos
|
- *(byte *)(pcVar1 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar1)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->quality
|
- ((ushort *)pcVar1)[2] & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->quality
|
- *(ushort *)(pcVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->quality
|
- *(byte *)((char *)pcVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->quality
|
- pcVar1[4] & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->quality
|
- *(byte *)(pcVar1 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar1)->next
|
- (*(ushort *)((char *)pcVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar1)->next
|
- (((ushort *)pcVar1)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar1)->next
|
- (((ushort *)pcVar1)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar1)->next
|
- (*(ushort *)(pcVar1 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar1)->next
|
- (*(ushort *)(pcVar1 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar1)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->owner
|
- ((ushort *)pcVar1)[3] & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->owner
|
- *(ushort *)(pcVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->owner
|
- *(byte *)((char *)pcVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->owner
|
- pcVar1[6] & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->owner
|
- *(byte *)(pcVar1 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar1)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar1)->link
|
- (*(ushort *)((char *)pcVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar1)->link
|
- (((ushort *)pcVar1)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar1)->link
|
- (((ushort *)pcVar1)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar1)->link
|
- (*(ushort *)(pcVar1 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar1)->link
|
- (*(ushort *)(pcVar1 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar1)->link
)
...>
}

@field_16_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar4)->object_id
|
- ((ushort *)pcVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)pcVar4)->object_id
|
- *(ushort *)pcVar4 & 0x1ff
+ ((uw_object_hdr_t *)pcVar4)->object_id
|
- *(ushort *)(pcVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar4)->object_id
|
- CONCAT11(pcVar4[1], *pcVar4) & 0x1ff
+ ((uw_object_hdr_t *)pcVar4)->object_id
|
- CONCAT11(pcVar4[1], pcVar4[0]) & 0x1ff
+ ((uw_object_hdr_t *)pcVar4)->object_id
)
...>
}

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(ushort *)((char *)pcVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (((ushort *)pcVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (((ushort *)pcVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(ushort *)pcVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(ushort *)pcVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(ushort *)(pcVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(ushort *)(pcVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (CONCAT11(pcVar4[1], *pcVar4) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (CONCAT11(pcVar4[1], *pcVar4) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (CONCAT11(pcVar4[1], pcVar4[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (CONCAT11(pcVar4[1], pcVar4[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(byte *)((char *)pcVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(byte *)((char *)pcVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(byte *)(pcVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->flags_res
|
- (*(byte *)(pcVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar4)->flags_res
)
...>
}

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(ushort *)((char *)pcVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (((ushort *)pcVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (((ushort *)pcVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(ushort *)pcVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(ushort *)pcVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(ushort *)(pcVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(ushort *)(pcVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (CONCAT11(pcVar4[1], *pcVar4) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (CONCAT11(pcVar4[1], *pcVar4) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (CONCAT11(pcVar4[1], pcVar4[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (CONCAT11(pcVar4[1], pcVar4[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(byte *)((char *)pcVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(byte *)((char *)pcVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(byte *)(pcVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->enchanted
|
- (*(byte *)(pcVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar4)->enchanted
)
...>
}

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(ushort *)((char *)pcVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (((ushort *)pcVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (((ushort *)pcVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(ushort *)pcVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(ushort *)pcVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(ushort *)(pcVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(ushort *)(pcVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (CONCAT11(pcVar4[1], *pcVar4) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (CONCAT11(pcVar4[1], *pcVar4) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (CONCAT11(pcVar4[1], pcVar4[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (CONCAT11(pcVar4[1], pcVar4[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(byte *)((char *)pcVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(byte *)((char *)pcVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(byte *)(pcVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->doordir
|
- (*(byte *)(pcVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar4)->doordir
)
...>
}

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(ushort *)((char *)pcVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (((ushort *)pcVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (((ushort *)pcVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(ushort *)pcVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(ushort *)pcVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(ushort *)(pcVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(ushort *)(pcVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (CONCAT11(pcVar4[1], *pcVar4) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (CONCAT11(pcVar4[1], *pcVar4) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (CONCAT11(pcVar4[1], pcVar4[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (CONCAT11(pcVar4[1], pcVar4[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(byte *)((char *)pcVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(byte *)((char *)pcVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(byte *)(pcVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->invisible
|
- (*(byte *)(pcVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar4)->invisible
)
...>
}

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(ushort *)((char *)pcVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (((ushort *)pcVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (((ushort *)pcVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(ushort *)pcVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(ushort *)pcVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(ushort *)(pcVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(ushort *)(pcVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (CONCAT11(pcVar4[1], *pcVar4) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (CONCAT11(pcVar4[1], *pcVar4) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (CONCAT11(pcVar4[1], pcVar4[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (CONCAT11(pcVar4[1], pcVar4[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(byte *)((char *)pcVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(byte *)((char *)pcVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- *(byte *)((char *)pcVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(byte *)(pcVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- (*(byte *)(pcVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar4)->is_quant
|
- *(byte *)(pcVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar4)->is_quant
)
...>
}

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar4)->zpos
|
- ((ushort *)pcVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)pcVar4)->zpos
|
- *(ushort *)(pcVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar4)->zpos
|
- *(byte *)((char *)pcVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar4)->zpos
|
- pcVar4[2] & 0x7f
+ ((uw_object_hdr_t *)pcVar4)->zpos
|
- *(byte *)(pcVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar4)->zpos
)
...>
}

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->heading
|
- (*(ushort *)((char *)pcVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar4)->heading
|
- (((ushort *)pcVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->heading
|
- (((ushort *)pcVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar4)->heading
|
- (*(ushort *)(pcVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->heading
|
- (*(ushort *)(pcVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar4)->heading
)
...>
}

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(ushort *)((char *)pcVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (((ushort *)pcVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (((ushort *)pcVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(ushort *)(pcVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(ushort *)(pcVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(byte *)((char *)pcVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(byte *)((char *)pcVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(byte *)(pcVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->ypos
|
- (*(byte *)(pcVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar4)->ypos
)
...>
}

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(ushort *)((char *)pcVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (((ushort *)pcVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (((ushort *)pcVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(ushort *)(pcVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(ushort *)(pcVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(byte *)((char *)pcVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(byte *)((char *)pcVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- *(byte *)((char *)pcVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(byte *)(pcVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- (*(byte *)(pcVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar4)->xpos
|
- *(byte *)(pcVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar4)->xpos
)
...>
}

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->quality
|
- ((ushort *)pcVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->quality
|
- *(ushort *)(pcVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->quality
|
- *(byte *)((char *)pcVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->quality
|
- pcVar4[4] & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->quality
|
- *(byte *)(pcVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->quality
)
...>
}

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar4)->next
|
- (*(ushort *)((char *)pcVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar4)->next
|
- (((ushort *)pcVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar4)->next
|
- (((ushort *)pcVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar4)->next
|
- (*(ushort *)(pcVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar4)->next
|
- (*(ushort *)(pcVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar4)->next
)
...>
}

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->owner
|
- ((ushort *)pcVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->owner
|
- *(ushort *)(pcVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->owner
|
- *(byte *)((char *)pcVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->owner
|
- pcVar4[6] & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->owner
|
- *(byte *)(pcVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar4)->owner
)
...>
}

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar4)->link
|
- (*(ushort *)((char *)pcVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar4)->link
|
- (((ushort *)pcVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar4)->link
|
- (((ushort *)pcVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar4)->link
|
- (*(ushort *)(pcVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar4)->link
|
- (*(ushort *)(pcVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar4)->link
)
...>
}

@field_17_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pvVar5)->object_id
|
- ((ushort *)pvVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)pvVar5)->object_id
|
- *(ushort *)pvVar5 & 0x1ff
+ ((uw_object_hdr_t *)pvVar5)->object_id
|
- *(ushort *)(pvVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pvVar5)->object_id
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(ushort *)((char *)pvVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (((ushort *)pvVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (((ushort *)pvVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(ushort *)pvVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(ushort *)pvVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(ushort *)(pvVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(ushort *)(pvVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(byte *)((char *)pvVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(byte *)((char *)pvVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(byte *)(pvVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->flags_res
|
- (*(byte *)(pvVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pvVar5)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(ushort *)((char *)pvVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (((ushort *)pvVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (((ushort *)pvVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(ushort *)pvVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(ushort *)pvVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(ushort *)(pvVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(ushort *)(pvVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(byte *)((char *)pvVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(byte *)((char *)pvVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(byte *)(pvVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->enchanted
|
- (*(byte *)(pvVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pvVar5)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(ushort *)((char *)pvVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (((ushort *)pvVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (((ushort *)pvVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(ushort *)pvVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(ushort *)pvVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(ushort *)(pvVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(ushort *)(pvVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(byte *)((char *)pvVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(byte *)((char *)pvVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(byte *)(pvVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->doordir
|
- (*(byte *)(pvVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pvVar5)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(ushort *)((char *)pvVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (((ushort *)pvVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (((ushort *)pvVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(ushort *)pvVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(ushort *)pvVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(ushort *)(pvVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(ushort *)(pvVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(byte *)((char *)pvVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(byte *)((char *)pvVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(byte *)(pvVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->invisible
|
- (*(byte *)(pvVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pvVar5)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(ushort *)((char *)pvVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (((ushort *)pvVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (((ushort *)pvVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(ushort *)pvVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(ushort *)pvVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(ushort *)(pvVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(ushort *)(pvVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(byte *)((char *)pvVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(byte *)((char *)pvVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- *(byte *)((char *)pvVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(byte *)(pvVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- (*(byte *)(pvVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pvVar5)->is_quant
|
- *(byte *)(pvVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)pvVar5)->is_quant
)
...>
}

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvVar5)->zpos
|
- ((ushort *)pvVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)pvVar5)->zpos
|
- *(ushort *)(pvVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvVar5)->zpos
|
- *(byte *)((char *)pvVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvVar5)->zpos
|
- *(byte *)(pvVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pvVar5)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->heading
|
- (*(ushort *)((char *)pvVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pvVar5)->heading
|
- (((ushort *)pvVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->heading
|
- (((ushort *)pvVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pvVar5)->heading
|
- (*(ushort *)(pvVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->heading
|
- (*(ushort *)(pvVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pvVar5)->heading
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(ushort *)((char *)pvVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (((ushort *)pvVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (((ushort *)pvVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(ushort *)(pvVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(ushort *)(pvVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(byte *)((char *)pvVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(byte *)((char *)pvVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(byte *)(pvVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->ypos
|
- (*(byte *)(pvVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pvVar5)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(ushort *)((char *)pvVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (((ushort *)pvVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (((ushort *)pvVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(ushort *)(pvVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(ushort *)(pvVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(byte *)((char *)pvVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(byte *)((char *)pvVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- *(byte *)((char *)pvVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(byte *)(pvVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- (*(byte *)(pvVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pvVar5)->xpos
|
- *(byte *)(pvVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)pvVar5)->xpos
)
...>
}

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->quality
|
- ((ushort *)pvVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->quality
|
- *(ushort *)(pvVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->quality
|
- *(byte *)((char *)pvVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->quality
|
- *(byte *)(pvVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvVar5)->next
|
- (*(ushort *)((char *)pvVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvVar5)->next
|
- (((ushort *)pvVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvVar5)->next
|
- (((ushort *)pvVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvVar5)->next
|
- (*(ushort *)(pvVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvVar5)->next
|
- (*(ushort *)(pvVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvVar5)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->owner
|
- ((ushort *)pvVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->owner
|
- *(ushort *)(pvVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->owner
|
- *(byte *)((char *)pvVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->owner
|
- *(byte *)(pvVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pvVar5)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pvVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvVar5)->link
|
- (*(ushort *)((char *)pvVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvVar5)->link
|
- (((ushort *)pvVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvVar5)->link
|
- (((ushort *)pvVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvVar5)->link
|
- (*(ushort *)(pvVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pvVar5)->link
|
- (*(ushort *)(pvVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pvVar5)->link
)
...>
}

@field_18_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_18_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_19_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@field_20_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_20_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@field_21_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)found)->object_id
|
- ((ushort *)found)[0] & 0x1ff
+ ((uw_object_hdr_t *)found)->object_id
|
- *(ushort *)found & 0x1ff
+ ((uw_object_hdr_t *)found)->object_id
|
- found[0] & 0x1ff
+ ((uw_object_hdr_t *)found)->object_id
|
- *found & 0x1ff
+ ((uw_object_hdr_t *)found)->object_id
)
...>
}

@field_21_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*(ushort *)((char *)found + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)found)->flags_res
|
- (((ushort *)found)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)found)->flags_res
|
- (((ushort *)found)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*(ushort *)found >> 9) & 0x7
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*(ushort *)found & 0xe00) >> 9
+ ((uw_object_hdr_t *)found)->flags_res
|
- (found[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)found)->flags_res
|
- (found[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*found >> 9) & 0x7
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*found & 0xe00) >> 9
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*(byte *)((char *)found + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)found)->flags_res
|
- (*(byte *)((char *)found + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)found)->flags_res
)
...>
}

@field_21_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*(ushort *)((char *)found + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)found)->enchanted
|
- (((ushort *)found)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)found)->enchanted
|
- (((ushort *)found)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*(ushort *)found >> 12) & 0x1
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*(ushort *)found & 0x1000) >> 12
+ ((uw_object_hdr_t *)found)->enchanted
|
- (found[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)found)->enchanted
|
- (found[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*found >> 12) & 0x1
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*found & 0x1000) >> 12
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*(byte *)((char *)found + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)found)->enchanted
|
- (*(byte *)((char *)found + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)found)->enchanted
)
...>
}

@field_21_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)found)->doordir
|
- (*(ushort *)((char *)found + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)found)->doordir
|
- (((ushort *)found)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)found)->doordir
|
- (((ushort *)found)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)found)->doordir
|
- (*(ushort *)found >> 13) & 0x1
+ ((uw_object_hdr_t *)found)->doordir
|
- (*(ushort *)found & 0x2000) >> 13
+ ((uw_object_hdr_t *)found)->doordir
|
- (found[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)found)->doordir
|
- (found[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)found)->doordir
|
- (*found >> 13) & 0x1
+ ((uw_object_hdr_t *)found)->doordir
|
- (*found & 0x2000) >> 13
+ ((uw_object_hdr_t *)found)->doordir
|
- (*(byte *)((char *)found + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)found)->doordir
|
- (*(byte *)((char *)found + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)found)->doordir
)
...>
}

@field_21_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)found)->invisible
|
- (*(ushort *)((char *)found + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)found)->invisible
|
- (((ushort *)found)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)found)->invisible
|
- (((ushort *)found)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)found)->invisible
|
- (*(ushort *)found >> 14) & 0x1
+ ((uw_object_hdr_t *)found)->invisible
|
- (*(ushort *)found & 0x4000) >> 14
+ ((uw_object_hdr_t *)found)->invisible
|
- (found[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)found)->invisible
|
- (found[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)found)->invisible
|
- (*found >> 14) & 0x1
+ ((uw_object_hdr_t *)found)->invisible
|
- (*found & 0x4000) >> 14
+ ((uw_object_hdr_t *)found)->invisible
|
- (*(byte *)((char *)found + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)found)->invisible
|
- (*(byte *)((char *)found + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)found)->invisible
)
...>
}

@field_21_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*(ushort *)((char *)found + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- *(ushort *)((char *)found + 0x0) >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- (((ushort *)found)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)found)->is_quant
|
- (((ushort *)found)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- ((ushort *)found)[0] >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*(ushort *)found >> 15) & 0x1
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*(ushort *)found & 0x8000) >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- *(ushort *)found >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- (found[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)found)->is_quant
|
- (found[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- found[0] >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*found >> 15) & 0x1
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*found & 0x8000) >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- *found >> 15
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*(byte *)((char *)found + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)found)->is_quant
|
- (*(byte *)((char *)found + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)found)->is_quant
|
- *(byte *)((char *)found + 0x1) >> 7
+ ((uw_object_hdr_t *)found)->is_quant
)
...>
}

@field_21_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x2) & 0x7f
+ ((uw_object_hdr_t *)found)->zpos
|
- ((ushort *)found)[1] & 0x7f
+ ((uw_object_hdr_t *)found)->zpos
|
- found[1] & 0x7f
+ ((uw_object_hdr_t *)found)->zpos
|
- *(byte *)((char *)found + 0x2) & 0x7f
+ ((uw_object_hdr_t *)found)->zpos
|
- (byte)found[1] & 0x7f
+ ((uw_object_hdr_t *)found)->zpos
)
...>
}

@field_21_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)found)->heading
|
- (*(ushort *)((char *)found + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)found)->heading
|
- (((ushort *)found)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)found)->heading
|
- (((ushort *)found)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)found)->heading
|
- (found[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)found)->heading
|
- (found[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)found)->heading
)
...>
}

@field_21_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)found)->ypos
|
- (*(ushort *)((char *)found + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found)->ypos
|
- (((ushort *)found)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)found)->ypos
|
- (((ushort *)found)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found)->ypos
|
- (found[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)found)->ypos
|
- (found[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)found)->ypos
|
- (*(byte *)((char *)found + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)found)->ypos
|
- (*(byte *)((char *)found + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)found)->ypos
)
...>
}

@field_21_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)found)->xpos
|
- (*(ushort *)((char *)found + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)found)->xpos
|
- *(ushort *)((char *)found + 0x2) >> 13
+ ((uw_object_hdr_t *)found)->xpos
|
- (((ushort *)found)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)found)->xpos
|
- (((ushort *)found)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)found)->xpos
|
- ((ushort *)found)[1] >> 13
+ ((uw_object_hdr_t *)found)->xpos
|
- (found[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)found)->xpos
|
- (found[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)found)->xpos
|
- found[1] >> 13
+ ((uw_object_hdr_t *)found)->xpos
|
- (*(byte *)((char *)found + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)found)->xpos
|
- (*(byte *)((char *)found + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)found)->xpos
|
- *(byte *)((char *)found + 0x3) >> 5
+ ((uw_object_hdr_t *)found)->xpos
)
...>
}

@field_21_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x4) & 0x3f
+ ((uw_object_hdr_t *)found)->quality
|
- ((ushort *)found)[2] & 0x3f
+ ((uw_object_hdr_t *)found)->quality
|
- found[2] & 0x3f
+ ((uw_object_hdr_t *)found)->quality
|
- *(byte *)((char *)found + 0x4) & 0x3f
+ ((uw_object_hdr_t *)found)->quality
|
- (byte)found[2] & 0x3f
+ ((uw_object_hdr_t *)found)->quality
)
...>
}

@field_21_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found)->next
|
- (*(ushort *)((char *)found + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found)->next
|
- *(ushort *)((char *)found + 0x4) >> 6
+ ((uw_object_hdr_t *)found)->next
|
- (((ushort *)found)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found)->next
|
- (((ushort *)found)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found)->next
|
- ((ushort *)found)[2] >> 6
+ ((uw_object_hdr_t *)found)->next
|
- (found[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found)->next
|
- (found[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found)->next
|
- found[2] >> 6
+ ((uw_object_hdr_t *)found)->next
)
...>
}

@field_21_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0x6) & 0x3f
+ ((uw_object_hdr_t *)found)->owner
|
- ((ushort *)found)[3] & 0x3f
+ ((uw_object_hdr_t *)found)->owner
|
- found[3] & 0x3f
+ ((uw_object_hdr_t *)found)->owner
|
- *(byte *)((char *)found + 0x6) & 0x3f
+ ((uw_object_hdr_t *)found)->owner
|
- (byte)found[3] & 0x3f
+ ((uw_object_hdr_t *)found)->owner
)
...>
}

@field_21_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)found + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found)->link
|
- (*(ushort *)((char *)found + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found)->link
|
- *(ushort *)((char *)found + 0x6) >> 6
+ ((uw_object_hdr_t *)found)->link
|
- (((ushort *)found)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found)->link
|
- (((ushort *)found)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found)->link
|
- ((ushort *)found)[3] >> 6
+ ((uw_object_hdr_t *)found)->link
|
- (found[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)found)->link
|
- (found[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)found)->link
|
- found[3] >> 6
+ ((uw_object_hdr_t *)found)->link
)
...>
}

@field_22_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_22_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@field_23_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)psVar7)->object_id
|
- ((ushort *)psVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)psVar7)->object_id
|
- *(ushort *)psVar7 & 0x1ff
+ ((uw_object_hdr_t *)psVar7)->object_id
|
- psVar7[0] & 0x1ff
+ ((uw_object_hdr_t *)psVar7)->object_id
|
- *psVar7 & 0x1ff
+ ((uw_object_hdr_t *)psVar7)->object_id
)
...>
}

@field_23_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*(ushort *)((char *)psVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (((ushort *)psVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (((ushort *)psVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*(ushort *)psVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*(ushort *)psVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (psVar7[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (psVar7[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*psVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*psVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*(byte *)((char *)psVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)psVar7)->flags_res
|
- (*(byte *)((char *)psVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)psVar7)->flags_res
)
...>
}

@field_23_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*(ushort *)((char *)psVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (((ushort *)psVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (((ushort *)psVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*(ushort *)psVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*(ushort *)psVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (psVar7[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (psVar7[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*psVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*psVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*(byte *)((char *)psVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)psVar7)->enchanted
|
- (*(byte *)((char *)psVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)psVar7)->enchanted
)
...>
}

@field_23_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*(ushort *)((char *)psVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (((ushort *)psVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (((ushort *)psVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*(ushort *)psVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*(ushort *)psVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (psVar7[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (psVar7[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*psVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*psVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*(byte *)((char *)psVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)psVar7)->doordir
|
- (*(byte *)((char *)psVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)psVar7)->doordir
)
...>
}

@field_23_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*(ushort *)((char *)psVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (((ushort *)psVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (((ushort *)psVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*(ushort *)psVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*(ushort *)psVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (psVar7[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (psVar7[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*psVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*psVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*(byte *)((char *)psVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)psVar7)->invisible
|
- (*(byte *)((char *)psVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)psVar7)->invisible
)
...>
}

@field_23_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*(ushort *)((char *)psVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (((ushort *)psVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (((ushort *)psVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*(ushort *)psVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*(ushort *)psVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (psVar7[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (psVar7[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*psVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*psVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*(byte *)((char *)psVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- (*(byte *)((char *)psVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)psVar7)->is_quant
|
- *(byte *)((char *)psVar7 + 0x1) >> 7
+ ((uw_object_hdr_t *)psVar7)->is_quant
)
...>
}

@field_23_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)psVar7)->zpos
|
- ((ushort *)psVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)psVar7)->zpos
|
- psVar7[1] & 0x7f
+ ((uw_object_hdr_t *)psVar7)->zpos
|
- *(byte *)((char *)psVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)psVar7)->zpos
|
- (byte)psVar7[1] & 0x7f
+ ((uw_object_hdr_t *)psVar7)->zpos
)
...>
}

@field_23_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar7)->heading
|
- (*(ushort *)((char *)psVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar7)->heading
|
- (((ushort *)psVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar7)->heading
|
- (((ushort *)psVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar7)->heading
|
- (psVar7[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)psVar7)->heading
|
- (psVar7[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)psVar7)->heading
)
...>
}

@field_23_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (*(ushort *)((char *)psVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (((ushort *)psVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (((ushort *)psVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (psVar7[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (psVar7[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (*(byte *)((char *)psVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)psVar7)->ypos
|
- (*(byte *)((char *)psVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)psVar7)->ypos
)
...>
}

@field_23_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (*(ushort *)((char *)psVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (((ushort *)psVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (((ushort *)psVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (psVar7[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (psVar7[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (*(byte *)((char *)psVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- (*(byte *)((char *)psVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)psVar7)->xpos
|
- *(byte *)((char *)psVar7 + 0x3) >> 5
+ ((uw_object_hdr_t *)psVar7)->xpos
)
...>
}

@field_23_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)psVar7)->quality
|
- ((ushort *)psVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)psVar7)->quality
|
- psVar7[2] & 0x3f
+ ((uw_object_hdr_t *)psVar7)->quality
|
- *(byte *)((char *)psVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)psVar7)->quality
|
- (byte)psVar7[2] & 0x3f
+ ((uw_object_hdr_t *)psVar7)->quality
)
...>
}

@field_23_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar7)->next
|
- (*(ushort *)((char *)psVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar7)->next
|
- (((ushort *)psVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar7)->next
|
- (((ushort *)psVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar7)->next
|
- (psVar7[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar7)->next
|
- (psVar7[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar7)->next
)
...>
}

@field_23_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)psVar7)->owner
|
- ((ushort *)psVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)psVar7)->owner
|
- psVar7[3] & 0x3f
+ ((uw_object_hdr_t *)psVar7)->owner
|
- *(byte *)((char *)psVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)psVar7)->owner
|
- (byte)psVar7[3] & 0x3f
+ ((uw_object_hdr_t *)psVar7)->owner
)
...>
}

@field_23_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)psVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar7)->link
|
- (*(ushort *)((char *)psVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar7)->link
|
- (((ushort *)psVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar7)->link
|
- (((ushort *)psVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar7)->link
|
- (psVar7[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)psVar7)->link
|
- (psVar7[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)psVar7)->link
)
...>
}

@field_24_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_24_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@field_25_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@field_25_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->flags_res
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar3)->flags_res
)
...>
}

@field_25_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->enchanted
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar3)->enchanted
)
...>
}

@field_25_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->doordir
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar3)->doordir
)
...>
}

@field_25_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->invisible
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar3)->invisible
)
...>
}

@field_25_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- (*(byte *)((char *)pbVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
|
- *(byte *)((char *)pbVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar3)->is_quant
)
...>
}

@field_25_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- *(byte *)((char *)pbVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar3)->zpos
)
...>
}

@field_25_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@field_25_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->ypos
|
- (*(byte *)((char *)pbVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar3)->ypos
)
...>
}

@field_25_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- (*(byte *)((char *)pbVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- (*(byte *)((char *)pbVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
|
- *(byte *)((char *)pbVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar3)->xpos
)
...>
}

@field_25_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- *(byte *)((char *)pbVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->quality
)
...>
}

@field_25_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@field_25_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
- *(byte *)((char *)pbVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar3)->owner
)
...>
}

@field_25_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@field_26_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@field_26_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

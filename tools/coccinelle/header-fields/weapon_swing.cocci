@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

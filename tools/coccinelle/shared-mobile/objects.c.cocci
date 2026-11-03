@site_0_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x16) = (char)V;
- *(char *)((char *)mobile + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)mobile)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x16) = (char)V;
- *(byte *)((char *)mobile + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)mobile)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x16) = (byte)V;
- *(char *)((char *)mobile + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)mobile)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x16) = (byte)V;
- *(byte *)((char *)mobile + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)mobile)->tile_position = (ushort)V;

...>
}

@site_0_w_22_0_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position
|
- *(ushort *)((byte *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position
|
- ((ushort *)mobile)[0xb]
+ ((uw_mobile_object_t *)mobile)->tile_position
|
- *(ushort *)((ushort *)mobile + 0xb)
+ ((uw_mobile_object_t *)mobile)->tile_position
)
...>
}


@site_0_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position
|
- *(undefined2 *)((byte *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position
|
- ((undefined2 *)mobile)[0xb]
+ ((uw_mobile_object_t *)mobile)->tile_position
|
- *(undefined2 *)((undefined2 *)mobile + 0xb)
+ ((uw_mobile_object_t *)mobile)->tile_position
)
...>
}


@site_0_w_22_0_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position_signed
|
- *(short *)((byte *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position_signed
|
- ((short *)mobile)[0xb]
+ ((uw_mobile_object_t *)mobile)->tile_position_signed
|
- *(short *)((short *)mobile + 0xb)
+ ((uw_mobile_object_t *)mobile)->tile_position_signed
)
...>
}


@site_0_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- *(byte *)((byte *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- ((byte *)mobile)[0x16]
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- *(byte *)((ushort *)mobile + 0xb)
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- (byte)((ushort *)mobile)[0xb]
+ ((uw_mobile_object_t *)mobile)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- *(undefined1 *)((byte *)mobile + 0x16)
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- ((undefined1 *)mobile)[0x16]
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- *(undefined1 *)((ushort *)mobile + 0xb)
+ ((uw_mobile_object_t *)mobile)->tile_position_low
|
- (undefined1)((ushort *)mobile)[0xb]
+ ((uw_mobile_object_t *)mobile)->tile_position_low
)
...>
}


@site_0_w_22_0_address_22@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x16)
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_low
|
- &*(char *)((byte *)mobile + 0x16)
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_low
|
- &((char *)mobile)[0x16]
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_low
|
- &*(char *)((ushort *)mobile + 0xb)
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_low
)
...>
}


@site_0_w_22_0_store_22@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x16) = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_low = (byte)E;
|
- *(char *)((byte *)mobile + 0x16) = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_low = (byte)E;
|
- ((char *)mobile)[0x16] = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)mobile + 0xb) = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_low = (byte)E;
)
...>
}


@site_0_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x16)
+ (char)((uw_mobile_object_t *)mobile)->tile_position_low
|
- *(char *)((byte *)mobile + 0x16)
+ (char)((uw_mobile_object_t *)mobile)->tile_position_low
|
- ((char *)mobile)[0x16]
+ (char)((uw_mobile_object_t *)mobile)->tile_position_low
|
- *(char *)((ushort *)mobile + 0xb)
+ (char)((uw_mobile_object_t *)mobile)->tile_position_low
|
- (char)((ushort *)mobile)[0xb]
+ (char)((uw_mobile_object_t *)mobile)->tile_position_low
)
...>
}


@site_0_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x17)
+ ((uw_mobile_object_t *)mobile)->tile_position_high
|
- *(byte *)((byte *)mobile + 0x17)
+ ((uw_mobile_object_t *)mobile)->tile_position_high
|
- ((byte *)mobile)[0x17]
+ ((uw_mobile_object_t *)mobile)->tile_position_high
)
...>
}


@site_0_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x17)
+ ((uw_mobile_object_t *)mobile)->tile_position_high
|
- *(undefined1 *)((byte *)mobile + 0x17)
+ ((uw_mobile_object_t *)mobile)->tile_position_high
|
- ((undefined1 *)mobile)[0x17]
+ ((uw_mobile_object_t *)mobile)->tile_position_high
)
...>
}


@site_0_w_22_0_address_23@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x17)
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_high
|
- &*(char *)((byte *)mobile + 0x17)
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_high
|
- &((char *)mobile)[0x17]
+ (char *)&((uw_mobile_object_t *)mobile)->tile_position_high
)
...>
}


@site_0_w_22_0_store_23@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x17) = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_high = (byte)E;
|
- *(char *)((byte *)mobile + 0x17) = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_high = (byte)E;
|
- ((char *)mobile)[0x17] = E;
+ ((uw_mobile_object_t *)mobile)->tile_position_high = (byte)E;
)
...>
}


@site_0_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x17)
+ (char)((uw_mobile_object_t *)mobile)->tile_position_high
|
- *(char *)((byte *)mobile + 0x17)
+ (char)((uw_mobile_object_t *)mobile)->tile_position_high
|
- ((char *)mobile)[0x17]
+ (char)((uw_mobile_object_t *)mobile)->tile_position_high
)
...>
}


@site_0_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)mobile)->object_id
|
- ((ushort *)mobile)[0] & 0x1ff
+ ((uw_object_hdr_t *)mobile)->object_id
|
- *(ushort *)mobile & 0x1ff
+ ((uw_object_hdr_t *)mobile)->object_id
)
...>
}

@site_0_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (*(ushort *)((char *)mobile + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (((ushort *)mobile)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (((ushort *)mobile)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (*(ushort *)mobile >> 9) & 0x7
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (*(ushort *)mobile & 0xe00) >> 9
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (*(byte *)((char *)mobile + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)mobile)->flags_res
|
- (*(byte *)((char *)mobile + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)mobile)->flags_res
)
...>
}

@site_0_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (*(ushort *)((char *)mobile + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (((ushort *)mobile)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (((ushort *)mobile)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (*(ushort *)mobile >> 12) & 0x1
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (*(ushort *)mobile & 0x1000) >> 12
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (*(byte *)((char *)mobile + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)mobile)->enchanted
|
- (*(byte *)((char *)mobile + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)mobile)->enchanted
)
...>
}

@site_0_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (*(ushort *)((char *)mobile + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (((ushort *)mobile)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (((ushort *)mobile)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (*(ushort *)mobile >> 13) & 0x1
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (*(ushort *)mobile & 0x2000) >> 13
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (*(byte *)((char *)mobile + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)mobile)->doordir
|
- (*(byte *)((char *)mobile + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)mobile)->doordir
)
...>
}

@site_0_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (*(ushort *)((char *)mobile + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (((ushort *)mobile)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (((ushort *)mobile)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (*(ushort *)mobile >> 14) & 0x1
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (*(ushort *)mobile & 0x4000) >> 14
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (*(byte *)((char *)mobile + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)mobile)->invisible
|
- (*(byte *)((char *)mobile + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)mobile)->invisible
)
...>
}

@site_0_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (*(ushort *)((char *)mobile + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (((ushort *)mobile)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (((ushort *)mobile)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (*(ushort *)mobile >> 15) & 0x1
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (*(ushort *)mobile & 0x8000) >> 15
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (*(byte *)((char *)mobile + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- (*(byte *)((char *)mobile + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)mobile)->is_quant
|
- *(byte *)((char *)mobile + 0x1) >> 7
+ ((uw_object_hdr_t *)mobile)->is_quant
)
...>
}

@site_0_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x2) & 0x7f
+ ((uw_object_hdr_t *)mobile)->zpos
|
- ((ushort *)mobile)[1] & 0x7f
+ ((uw_object_hdr_t *)mobile)->zpos
|
- *(byte *)((char *)mobile + 0x2) & 0x7f
+ ((uw_object_hdr_t *)mobile)->zpos
)
...>
}

@site_0_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)mobile)->heading
|
- (*(ushort *)((char *)mobile + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)mobile)->heading
|
- (((ushort *)mobile)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)mobile)->heading
|
- (((ushort *)mobile)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)mobile)->heading
)
...>
}

@site_0_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)mobile)->ypos
|
- (*(ushort *)((char *)mobile + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)mobile)->ypos
|
- (((ushort *)mobile)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)mobile)->ypos
|
- (((ushort *)mobile)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)mobile)->ypos
|
- (*(byte *)((char *)mobile + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)mobile)->ypos
|
- (*(byte *)((char *)mobile + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)mobile)->ypos
)
...>
}

@site_0_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)mobile)->xpos
|
- (*(ushort *)((char *)mobile + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)mobile)->xpos
|
- (((ushort *)mobile)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)mobile)->xpos
|
- (((ushort *)mobile)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)mobile)->xpos
|
- (*(byte *)((char *)mobile + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)mobile)->xpos
|
- (*(byte *)((char *)mobile + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)mobile)->xpos
|
- *(byte *)((char *)mobile + 0x3) >> 5
+ ((uw_object_hdr_t *)mobile)->xpos
)
...>
}

@site_0_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x4) & 0x3f
+ ((uw_object_hdr_t *)mobile)->quality
|
- ((ushort *)mobile)[2] & 0x3f
+ ((uw_object_hdr_t *)mobile)->quality
|
- *(byte *)((char *)mobile + 0x4) & 0x3f
+ ((uw_object_hdr_t *)mobile)->quality
)
...>
}

@site_0_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)mobile)->next
|
- (*(ushort *)((char *)mobile + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)mobile)->next
|
- (((ushort *)mobile)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)mobile)->next
|
- (((ushort *)mobile)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)mobile)->next
)
...>
}

@site_0_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x6) & 0x3f
+ ((uw_object_hdr_t *)mobile)->owner
|
- ((ushort *)mobile)[3] & 0x3f
+ ((uw_object_hdr_t *)mobile)->owner
|
- *(byte *)((char *)mobile + 0x6) & 0x3f
+ ((uw_object_hdr_t *)mobile)->owner
)
...>
}

@site_0_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)mobile + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)mobile)->link
|
- (*(ushort *)((char *)mobile + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)mobile)->link
|
- (((ushort *)mobile)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)mobile)->link
|
- (((ushort *)mobile)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)mobile)->link
)
...>
}

@site_0_header_w_0_0_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x0) = (char)V;
- *(char *)((char *)mobile + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x0) = (char)V;
- *(byte *)((char *)mobile + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x0) = (byte)V;
- *(char *)((char *)mobile + 0x1) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x0) = (byte)V;
- *(byte *)((char *)mobile + 0x1) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->type_flags = (ushort)V;

...>
}

@site_0_header_w_0_0_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags
|
- *(ushort *)((byte *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags
|
- ((ushort *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags
|
- *(ushort *)((ushort *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags
)
...>
}


@site_0_header_w_0_0_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags
|
- *(undefined2 *)((byte *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags
|
- ((undefined2 *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags
|
- *(undefined2 *)((undefined2 *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags
)
...>
}


@site_0_header_w_0_0_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_signed
|
- *(short *)((byte *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_signed
|
- ((short *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags_signed
|
- *(short *)((short *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_signed
)
...>
}


@site_0_header_w_0_0_byte_0_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(byte *)((byte *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- ((byte *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(byte *)((ushort *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- (byte)((ushort *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(byte *)mobile
+ ((uw_object_hdr_t *)mobile)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_0_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(undefined1 *)((byte *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- ((undefined1 *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(undefined1 *)((ushort *)mobile + 0x0)
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- (undefined1)((ushort *)mobile)[0x0]
+ ((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(undefined1 *)mobile
+ ((uw_object_hdr_t *)mobile)->type_flags_low
)
...>
}


@site_0_header_w_0_0_address_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x0)
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_low
|
- &*(char *)((byte *)mobile + 0x0)
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_low
|
- &((char *)mobile)[0x0]
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_low
|
- &*(char *)((ushort *)mobile + 0x0)
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_low
|
- &*(char *)mobile
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_low
)
...>
}


@site_0_header_w_0_0_store_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x0) = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_low = (byte)E;
|
- *(char *)((byte *)mobile + 0x0) = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_low = (byte)E;
|
- ((char *)mobile)[0x0] = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_low = (byte)E;
|
- *(char *)((ushort *)mobile + 0x0) = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_low = (byte)E;
|
- *(char *)mobile = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_low = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_0_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x0)
+ (char)((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(char *)((byte *)mobile + 0x0)
+ (char)((uw_object_hdr_t *)mobile)->type_flags_low
|
- ((char *)mobile)[0x0]
+ (char)((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(char *)((ushort *)mobile + 0x0)
+ (char)((uw_object_hdr_t *)mobile)->type_flags_low
|
- (char)((ushort *)mobile)[0x0]
+ (char)((uw_object_hdr_t *)mobile)->type_flags_low
|
- *(char *)mobile
+ (char)((uw_object_hdr_t *)mobile)->type_flags_low
)
...>
}


@site_0_header_w_0_0_byte_1_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->type_flags_high
|
- *(byte *)((byte *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->type_flags_high
|
- ((byte *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->type_flags_high
)
...>
}


@site_0_header_w_0_0_byte_1_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->type_flags_high
|
- *(undefined1 *)((byte *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->type_flags_high
|
- ((undefined1 *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->type_flags_high
)
...>
}


@site_0_header_w_0_0_address_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x1)
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_high
|
- &*(char *)((byte *)mobile + 0x1)
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_high
|
- &((char *)mobile)[0x1]
+ (char *)&((uw_object_hdr_t *)mobile)->type_flags_high
)
...>
}


@site_0_header_w_0_0_store_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x1) = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_high = (byte)E;
|
- *(char *)((byte *)mobile + 0x1) = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_high = (byte)E;
|
- ((char *)mobile)[0x1] = E;
+ ((uw_object_hdr_t *)mobile)->type_flags_high = (byte)E;
)
...>
}


@site_0_header_w_0_0_byte_1_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x1)
+ (char)((uw_object_hdr_t *)mobile)->type_flags_high
|
- *(char *)((byte *)mobile + 0x1)
+ (char)((uw_object_hdr_t *)mobile)->type_flags_high
|
- ((char *)mobile)[0x1]
+ (char)((uw_object_hdr_t *)mobile)->type_flags_high
)
...>
}


@site_0_header_w_2_17_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x2) = (char)V;
- *(char *)((char *)mobile + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x2) = (char)V;
- *(byte *)((char *)mobile + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x2) = (byte)V;
- *(char *)((char *)mobile + 0x3) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x2) = (byte)V;
- *(byte *)((char *)mobile + 0x3) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->position_word = (ushort)V;

...>
}

@site_0_header_w_2_17_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word
|
- *(ushort *)((byte *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word
|
- ((ushort *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->position_word
|
- *(ushort *)((ushort *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->position_word
)
...>
}


@site_0_header_w_2_17_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word
|
- *(undefined2 *)((byte *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word
|
- ((undefined2 *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->position_word
|
- *(undefined2 *)((undefined2 *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->position_word
)
...>
}


@site_0_header_w_2_17_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word_signed
|
- *(short *)((byte *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word_signed
|
- ((short *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->position_word_signed
|
- *(short *)((short *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->position_word_signed
)
...>
}


@site_0_header_w_2_17_byte_2_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- *(byte *)((byte *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- ((byte *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- *(byte *)((ushort *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- (byte)((ushort *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_2_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- *(undefined1 *)((byte *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- ((undefined1 *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- *(undefined1 *)((ushort *)mobile + 0x1)
+ ((uw_object_hdr_t *)mobile)->position_word_low
|
- (undefined1)((ushort *)mobile)[0x1]
+ ((uw_object_hdr_t *)mobile)->position_word_low
)
...>
}


@site_0_header_w_2_17_address_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x2)
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_low
|
- &*(char *)((byte *)mobile + 0x2)
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_low
|
- &((char *)mobile)[0x2]
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_low
|
- &*(char *)((ushort *)mobile + 0x1)
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_low
)
...>
}


@site_0_header_w_2_17_store_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x2) = E;
+ ((uw_object_hdr_t *)mobile)->position_word_low = (byte)E;
|
- *(char *)((byte *)mobile + 0x2) = E;
+ ((uw_object_hdr_t *)mobile)->position_word_low = (byte)E;
|
- ((char *)mobile)[0x2] = E;
+ ((uw_object_hdr_t *)mobile)->position_word_low = (byte)E;
|
- *(char *)((ushort *)mobile + 0x1) = E;
+ ((uw_object_hdr_t *)mobile)->position_word_low = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_2_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x2)
+ (char)((uw_object_hdr_t *)mobile)->position_word_low
|
- *(char *)((byte *)mobile + 0x2)
+ (char)((uw_object_hdr_t *)mobile)->position_word_low
|
- ((char *)mobile)[0x2]
+ (char)((uw_object_hdr_t *)mobile)->position_word_low
|
- *(char *)((ushort *)mobile + 0x1)
+ (char)((uw_object_hdr_t *)mobile)->position_word_low
|
- (char)((ushort *)mobile)[0x1]
+ (char)((uw_object_hdr_t *)mobile)->position_word_low
)
...>
}


@site_0_header_w_2_17_byte_3_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->position_word_high
|
- *(byte *)((byte *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->position_word_high
|
- ((byte *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->position_word_high
)
...>
}


@site_0_header_w_2_17_byte_3_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->position_word_high
|
- *(undefined1 *)((byte *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->position_word_high
|
- ((undefined1 *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->position_word_high
)
...>
}


@site_0_header_w_2_17_address_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x3)
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_high
|
- &*(char *)((byte *)mobile + 0x3)
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_high
|
- &((char *)mobile)[0x3]
+ (char *)&((uw_object_hdr_t *)mobile)->position_word_high
)
...>
}


@site_0_header_w_2_17_store_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x3) = E;
+ ((uw_object_hdr_t *)mobile)->position_word_high = (byte)E;
|
- *(char *)((byte *)mobile + 0x3) = E;
+ ((uw_object_hdr_t *)mobile)->position_word_high = (byte)E;
|
- ((char *)mobile)[0x3] = E;
+ ((uw_object_hdr_t *)mobile)->position_word_high = (byte)E;
)
...>
}


@site_0_header_w_2_17_byte_3_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x3)
+ (char)((uw_object_hdr_t *)mobile)->position_word_high
|
- *(char *)((byte *)mobile + 0x3)
+ (char)((uw_object_hdr_t *)mobile)->position_word_high
|
- ((char *)mobile)[0x3]
+ (char)((uw_object_hdr_t *)mobile)->position_word_high
)
...>
}


@site_0_header_w_4_34_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x4) = (char)V;
- *(char *)((char *)mobile + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x4) = (char)V;
- *(byte *)((char *)mobile + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x4) = (byte)V;
- *(char *)((char *)mobile + 0x5) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x4) = (byte)V;
- *(byte *)((char *)mobile + 0x5) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->chain_word = (ushort)V;

...>
}

@site_0_header_w_4_34_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word
|
- *(ushort *)((byte *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word
|
- ((ushort *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->chain_word
|
- *(ushort *)((ushort *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->chain_word
)
...>
}


@site_0_header_w_4_34_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word
|
- *(undefined2 *)((byte *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word
|
- ((undefined2 *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->chain_word
|
- *(undefined2 *)((undefined2 *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->chain_word
)
...>
}


@site_0_header_w_4_34_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word_signed
|
- *(short *)((byte *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word_signed
|
- ((short *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->chain_word_signed
|
- *(short *)((short *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->chain_word_signed
)
...>
}


@site_0_header_w_4_34_byte_4_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- *(byte *)((byte *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- ((byte *)mobile)[0x4]
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- *(byte *)((ushort *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- (byte)((ushort *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_4_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- *(undefined1 *)((byte *)mobile + 0x4)
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- ((undefined1 *)mobile)[0x4]
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- *(undefined1 *)((ushort *)mobile + 0x2)
+ ((uw_object_hdr_t *)mobile)->chain_word_low
|
- (undefined1)((ushort *)mobile)[0x2]
+ ((uw_object_hdr_t *)mobile)->chain_word_low
)
...>
}


@site_0_header_w_4_34_address_4@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x4)
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_low
|
- &*(char *)((byte *)mobile + 0x4)
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_low
|
- &((char *)mobile)[0x4]
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_low
|
- &*(char *)((ushort *)mobile + 0x2)
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_low
)
...>
}


@site_0_header_w_4_34_store_4@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x4) = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_low = (byte)E;
|
- *(char *)((byte *)mobile + 0x4) = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_low = (byte)E;
|
- ((char *)mobile)[0x4] = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_low = (byte)E;
|
- *(char *)((ushort *)mobile + 0x2) = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_low = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_4_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x4)
+ (char)((uw_object_hdr_t *)mobile)->chain_word_low
|
- *(char *)((byte *)mobile + 0x4)
+ (char)((uw_object_hdr_t *)mobile)->chain_word_low
|
- ((char *)mobile)[0x4]
+ (char)((uw_object_hdr_t *)mobile)->chain_word_low
|
- *(char *)((ushort *)mobile + 0x2)
+ (char)((uw_object_hdr_t *)mobile)->chain_word_low
|
- (char)((ushort *)mobile)[0x2]
+ (char)((uw_object_hdr_t *)mobile)->chain_word_low
)
...>
}


@site_0_header_w_4_34_byte_5_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x5)
+ ((uw_object_hdr_t *)mobile)->chain_word_high
|
- *(byte *)((byte *)mobile + 0x5)
+ ((uw_object_hdr_t *)mobile)->chain_word_high
|
- ((byte *)mobile)[0x5]
+ ((uw_object_hdr_t *)mobile)->chain_word_high
)
...>
}


@site_0_header_w_4_34_byte_5_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x5)
+ ((uw_object_hdr_t *)mobile)->chain_word_high
|
- *(undefined1 *)((byte *)mobile + 0x5)
+ ((uw_object_hdr_t *)mobile)->chain_word_high
|
- ((undefined1 *)mobile)[0x5]
+ ((uw_object_hdr_t *)mobile)->chain_word_high
)
...>
}


@site_0_header_w_4_34_address_5@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x5)
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_high
|
- &*(char *)((byte *)mobile + 0x5)
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_high
|
- &((char *)mobile)[0x5]
+ (char *)&((uw_object_hdr_t *)mobile)->chain_word_high
)
...>
}


@site_0_header_w_4_34_store_5@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x5) = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_high = (byte)E;
|
- *(char *)((byte *)mobile + 0x5) = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_high = (byte)E;
|
- ((char *)mobile)[0x5] = E;
+ ((uw_object_hdr_t *)mobile)->chain_word_high = (byte)E;
)
...>
}


@site_0_header_w_4_34_byte_5_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x5)
+ (char)((uw_object_hdr_t *)mobile)->chain_word_high
|
- *(char *)((byte *)mobile + 0x5)
+ (char)((uw_object_hdr_t *)mobile)->chain_word_high
|
- ((char *)mobile)[0x5]
+ (char)((uw_object_hdr_t *)mobile)->chain_word_high
)
...>
}


@site_0_header_w_6_51_pair_char_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x6) = (char)V;
- *(char *)((char *)mobile + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_char_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)mobile + 0x6) = (char)V;
- *(byte *)((char *)mobile + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x6) = (byte)V;
- *(char *)((char *)mobile + 0x7) = (char)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_pair_byte_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)mobile + 0x6) = (byte)V;
- *(byte *)((char *)mobile + 0x7) = (byte)(V >> 8);
+ ((uw_object_hdr_t *)mobile)->link_word = (ushort)V;

...>
}

@site_0_header_w_6_51_word_ushort@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word
|
- *(ushort *)((byte *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word
|
- ((ushort *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->link_word
|
- *(ushort *)((ushort *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->link_word
)
...>
}


@site_0_header_w_6_51_word_undefined2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word
|
- *(undefined2 *)((byte *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word
|
- ((undefined2 *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->link_word
|
- *(undefined2 *)((undefined2 *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->link_word
)
...>
}


@site_0_header_w_6_51_word_short@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, undefined2, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(short *)((char *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word_signed
|
- *(short *)((byte *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word_signed
|
- ((short *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->link_word_signed
|
- *(short *)((short *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->link_word_signed
)
...>
}


@site_0_header_w_6_51_byte_6_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- *(byte *)((byte *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- ((byte *)mobile)[0x6]
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- *(byte *)((ushort *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- (byte)((ushort *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_6_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- *(undefined1 *)((byte *)mobile + 0x6)
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- ((undefined1 *)mobile)[0x6]
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- *(undefined1 *)((ushort *)mobile + 0x3)
+ ((uw_object_hdr_t *)mobile)->link_word_low
|
- (undefined1)((ushort *)mobile)[0x3]
+ ((uw_object_hdr_t *)mobile)->link_word_low
)
...>
}


@site_0_header_w_6_51_address_6@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x6)
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_low
|
- &*(char *)((byte *)mobile + 0x6)
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_low
|
- &((char *)mobile)[0x6]
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_low
|
- &*(char *)((ushort *)mobile + 0x3)
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_low
)
...>
}


@site_0_header_w_6_51_store_6@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x6) = E;
+ ((uw_object_hdr_t *)mobile)->link_word_low = (byte)E;
|
- *(char *)((byte *)mobile + 0x6) = E;
+ ((uw_object_hdr_t *)mobile)->link_word_low = (byte)E;
|
- ((char *)mobile)[0x6] = E;
+ ((uw_object_hdr_t *)mobile)->link_word_low = (byte)E;
|
- *(char *)((ushort *)mobile + 0x3) = E;
+ ((uw_object_hdr_t *)mobile)->link_word_low = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_6_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x6)
+ (char)((uw_object_hdr_t *)mobile)->link_word_low
|
- *(char *)((byte *)mobile + 0x6)
+ (char)((uw_object_hdr_t *)mobile)->link_word_low
|
- ((char *)mobile)[0x6]
+ (char)((uw_object_hdr_t *)mobile)->link_word_low
|
- *(char *)((ushort *)mobile + 0x3)
+ (char)((uw_object_hdr_t *)mobile)->link_word_low
|
- (char)((ushort *)mobile)[0x3]
+ (char)((uw_object_hdr_t *)mobile)->link_word_low
)
...>
}


@site_0_header_w_6_51_byte_7_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x7)
+ ((uw_object_hdr_t *)mobile)->link_word_high
|
- *(byte *)((byte *)mobile + 0x7)
+ ((uw_object_hdr_t *)mobile)->link_word_high
|
- ((byte *)mobile)[0x7]
+ ((uw_object_hdr_t *)mobile)->link_word_high
)
...>
}


@site_0_header_w_6_51_byte_7_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x7)
+ ((uw_object_hdr_t *)mobile)->link_word_high
|
- *(undefined1 *)((byte *)mobile + 0x7)
+ ((uw_object_hdr_t *)mobile)->link_word_high
|
- ((undefined1 *)mobile)[0x7]
+ ((uw_object_hdr_t *)mobile)->link_word_high
)
...>
}


@site_0_header_w_6_51_address_7@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x7)
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_high
|
- &*(char *)((byte *)mobile + 0x7)
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_high
|
- &((char *)mobile)[0x7]
+ (char *)&((uw_object_hdr_t *)mobile)->link_word_high
)
...>
}


@site_0_header_w_6_51_store_7@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, ushort, uw_object_hdr_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x7) = E;
+ ((uw_object_hdr_t *)mobile)->link_word_high = (byte)E;
|
- *(char *)((byte *)mobile + 0x7) = E;
+ ((uw_object_hdr_t *)mobile)->link_word_high = (byte)E;
|
- ((char *)mobile)[0x7] = E;
+ ((uw_object_hdr_t *)mobile)->link_word_high = (byte)E;
)
...>
}


@site_0_header_w_6_51_byte_7_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x7)
+ (char)((uw_object_hdr_t *)mobile)->link_word_high
|
- *(char *)((byte *)mobile + 0x7)
+ (char)((uw_object_hdr_t *)mobile)->link_word_high
|
- ((char *)mobile)[0x7]
+ (char)((uw_object_hdr_t *)mobile)->link_word_high
)
...>
}


@settle_dropped_object_mobile_typed_header_receiver@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

identifier M;
@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)mobile)->M
+ mobile->hdr.M
)
...>
}

@settle_dropped_object_mobile_hit_points_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x8)
+ ((uw_mobile_object_t *)mobile)->hit_points
)
...>
}

@settle_dropped_object_mobile_hit_points_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x8)
+ ((uw_mobile_object_t *)mobile)->hit_points
)
...>
}

@settle_dropped_object_mobile_hit_points_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x8)
+ (char *)&((uw_mobile_object_t *)mobile)->hit_points
)
...>
}

@settle_dropped_object_mobile_hit_points_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x8) = E;
+ ((uw_mobile_object_t *)mobile)->hit_points = (byte)E;
)
...>
}

@settle_dropped_object_mobile_hit_points_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x8)
+ (char)((uw_mobile_object_t *)mobile)->hit_points
)
...>
}

@settle_dropped_object_mobile_full_heading_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x9)
+ ((uw_mobile_object_t *)mobile)->full_heading
)
...>
}

@settle_dropped_object_mobile_full_heading_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x9)
+ ((uw_mobile_object_t *)mobile)->full_heading
)
...>
}

@settle_dropped_object_mobile_full_heading_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x9)
+ (char *)&((uw_mobile_object_t *)mobile)->full_heading
)
...>
}

@settle_dropped_object_mobile_full_heading_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x9) = E;
+ ((uw_mobile_object_t *)mobile)->full_heading = (byte)E;
)
...>
}

@settle_dropped_object_mobile_full_heading_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x9)
+ (char)((uw_mobile_object_t *)mobile)->full_heading
)
...>
}

@settle_dropped_object_mobile_movement_flags_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0xa)
+ ((uw_mobile_object_t *)mobile)->movement_flags
)
...>
}

@settle_dropped_object_mobile_movement_flags_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0xa)
+ ((uw_mobile_object_t *)mobile)->movement_flags
)
...>
}

@settle_dropped_object_mobile_movement_flags_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0xa)
+ (char *)&((uw_mobile_object_t *)mobile)->movement_flags
)
...>
}

@settle_dropped_object_mobile_movement_flags_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0xa) = E;
+ ((uw_mobile_object_t *)mobile)->movement_flags = (byte)E;
)
...>
}

@settle_dropped_object_mobile_movement_flags_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0xa)
+ (char)((uw_mobile_object_t *)mobile)->movement_flags
)
...>
}

@settle_dropped_object_mobile_motion_flags_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x13)
+ ((uw_mobile_object_t *)mobile)->motion_flags
)
...>
}

@settle_dropped_object_mobile_motion_flags_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x13)
+ ((uw_mobile_object_t *)mobile)->motion_flags
)
...>
}

@settle_dropped_object_mobile_motion_flags_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x13)
+ (char *)&((uw_mobile_object_t *)mobile)->motion_flags
)
...>
}

@settle_dropped_object_mobile_motion_flags_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x13) = E;
+ ((uw_mobile_object_t *)mobile)->motion_flags = (byte)E;
)
...>
}

@settle_dropped_object_mobile_motion_flags_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x13)
+ (char)((uw_mobile_object_t *)mobile)->motion_flags
)
...>
}

@settle_dropped_object_mobile_attack_pitch_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x14)
+ ((uw_mobile_object_t *)mobile)->attack_pitch
)
...>
}

@settle_dropped_object_mobile_attack_pitch_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x14)
+ ((uw_mobile_object_t *)mobile)->attack_pitch
)
...>
}

@settle_dropped_object_mobile_attack_pitch_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x14)
+ (char *)&((uw_mobile_object_t *)mobile)->attack_pitch
)
...>
}

@settle_dropped_object_mobile_attack_pitch_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x14) = E;
+ ((uw_mobile_object_t *)mobile)->attack_pitch = (byte)E;
)
...>
}

@settle_dropped_object_mobile_attack_pitch_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x14)
+ (char)((uw_mobile_object_t *)mobile)->attack_pitch
)
...>
}

@settle_dropped_object_mobile_animation_flags_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x15)
+ ((uw_mobile_object_t *)mobile)->animation_flags
)
...>
}

@settle_dropped_object_mobile_animation_flags_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x15)
+ ((uw_mobile_object_t *)mobile)->animation_flags
)
...>
}

@settle_dropped_object_mobile_animation_flags_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x15)
+ (char *)&((uw_mobile_object_t *)mobile)->animation_flags
)
...>
}

@settle_dropped_object_mobile_animation_flags_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x15) = E;
+ ((uw_mobile_object_t *)mobile)->animation_flags = (byte)E;
)
...>
}

@settle_dropped_object_mobile_animation_flags_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x15)
+ (char)((uw_mobile_object_t *)mobile)->animation_flags
)
...>
}

@settle_dropped_object_mobile_heading_flags_byte@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)mobile + 0x18)
+ ((uw_mobile_object_t *)mobile)->heading_flags
)
...>
}

@settle_dropped_object_mobile_heading_flags_undefined1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)mobile + 0x18)
+ ((uw_mobile_object_t *)mobile)->heading_flags
)
...>
}

@settle_dropped_object_mobile_heading_flags_address@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)mobile + 0x18)
+ (char *)&((uw_mobile_object_t *)mobile)->heading_flags
)
...>
}

@settle_dropped_object_mobile_heading_flags_store@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x18) = E;
+ ((uw_mobile_object_t *)mobile)->heading_flags = (byte)E;
)
...>
}

@settle_dropped_object_mobile_heading_flags_char@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)mobile + 0x18)
+ (char)((uw_mobile_object_t *)mobile)->heading_flags
)
...>
}

@site_1_w_22_0_pair_char_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x16) = (char)V;
- *(char *)((char *)puVar2 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar2)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_char_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(char *)((char *)puVar2 + 0x16) = (char)V;
- *(byte *)((char *)puVar2 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar2)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_byte_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x16) = (byte)V;
- *(char *)((char *)puVar2 + 0x17) = (char)(V >> 8);
+ ((uw_mobile_object_t *)puVar2)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_pair_byte_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
- *(byte *)((char *)puVar2 + 0x16) = (byte)V;
- *(byte *)((char *)puVar2 + 0x17) = (byte)(V >> 8);
+ ((uw_mobile_object_t *)puVar2)->tile_position = (ushort)V;

...>
}

@site_1_w_22_0_word_ushort@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- *(ushort *)((byte *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- ((ushort *)puVar2)[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- *(ushort *)((ushort *)puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- *(ushort *)(puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- puVar2[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position
)
...>
}


@site_1_w_22_0_word_undefined2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined2 *)((char *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- *(undefined2 *)((byte *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- ((undefined2 *)puVar2)[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- *(undefined2 *)((undefined2 *)puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- *(undefined2 *)(puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position
|
- puVar2[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position
)
...>
}


@site_1_w_22_0_word_short@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef ushort, undefined2, byte, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(short *)((char *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position_signed
|
- *(short *)((byte *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position_signed
|
- ((short *)puVar2)[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position_signed
|
- *(short *)((short *)puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position_signed
|
- *(short *)(puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position_signed
)
...>
}


@site_1_w_22_0_byte_22_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(byte *)((byte *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- ((byte *)puVar2)[0x16]
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(byte *)((ushort *)puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- (byte)((ushort *)puVar2)[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(byte *)(puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- (byte)puVar2[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
)
...>
}


@site_1_w_22_0_byte_22_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(undefined1 *)((byte *)puVar2 + 0x16)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- ((undefined1 *)puVar2)[0x16]
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(undefined1 *)((ushort *)puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- (undefined1)((ushort *)puVar2)[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(undefined1 *)(puVar2 + 0xb)
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
|
- (undefined1)puVar2[0xb]
+ ((uw_mobile_object_t *)puVar2)->tile_position_low
)
...>
}


@site_1_w_22_0_address_22@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_low
|
- &*(char *)((byte *)puVar2 + 0x16)
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_low
|
- &((char *)puVar2)[0x16]
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_low
|
- &*(char *)((ushort *)puVar2 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_low
|
- &*(char *)(puVar2 + 0xb)
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_low
)
...>
}


@site_1_w_22_0_store_22@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_low = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x16) = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_low = (byte)E;
|
- ((char *)puVar2)[0x16] = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_low = (byte)E;
|
- *(char *)((ushort *)puVar2 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_low = (byte)E;
|
- *(char *)(puVar2 + 0xb) = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_low = (byte)E;
)
...>
}


@site_1_w_22_0_byte_22_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x16)
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(char *)((byte *)puVar2 + 0x16)
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
|
- ((char *)puVar2)[0x16]
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(char *)((ushort *)puVar2 + 0xb)
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
|
- (char)((ushort *)puVar2)[0xb]
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
|
- *(char *)(puVar2 + 0xb)
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
|
- (char)puVar2[0xb]
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_low
)
...>
}


@site_1_w_22_0_byte_23_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x17)
+ ((uw_mobile_object_t *)puVar2)->tile_position_high
|
- *(byte *)((byte *)puVar2 + 0x17)
+ ((uw_mobile_object_t *)puVar2)->tile_position_high
|
- ((byte *)puVar2)[0x17]
+ ((uw_mobile_object_t *)puVar2)->tile_position_high
)
...>
}


@site_1_w_22_0_byte_23_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x17)
+ ((uw_mobile_object_t *)puVar2)->tile_position_high
|
- *(undefined1 *)((byte *)puVar2 + 0x17)
+ ((uw_mobile_object_t *)puVar2)->tile_position_high
|
- ((undefined1 *)puVar2)[0x17]
+ ((uw_mobile_object_t *)puVar2)->tile_position_high
)
...>
}


@site_1_w_22_0_address_23@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_high
|
- &*(char *)((byte *)puVar2 + 0x17)
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_high
|
- &((char *)puVar2)[0x17]
+ (char *)&((uw_mobile_object_t *)puVar2)->tile_position_high
)
...>
}


@site_1_w_22_0_store_23@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_high = (byte)E;
|
- *(char *)((byte *)puVar2 + 0x17) = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_high = (byte)E;
|
- ((char *)puVar2)[0x17] = E;
+ ((uw_mobile_object_t *)puVar2)->tile_position_high = (byte)E;
)
...>
}


@site_1_w_22_0_byte_23_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, ushort, uw_mobile_object_t;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x17)
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_high
|
- *(char *)((byte *)puVar2 + 0x17)
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_high
|
- ((char *)puVar2)[0x17]
+ (char)((uw_mobile_object_t *)puVar2)->tile_position_high
)
...>
}


@site_1_field_0_object_id disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_doordir disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_invisible disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_zpos disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_heading disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_ypos disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_xpos disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_quality disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_next disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_owner disable drop_cast, is_zero, isnt_zero@
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

@site_1_field_0_link disable drop_cast, is_zero, isnt_zero@
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

@site_1_header_w_0_0_pair_char_char@
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

@site_1_header_w_0_0_pair_char_byte@
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

@site_1_header_w_0_0_pair_byte_char@
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

@site_1_header_w_0_0_pair_byte_byte@
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

@site_1_header_w_0_0_word_ushort@
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


@site_1_header_w_0_0_word_undefined2@
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


@site_1_header_w_0_0_word_short@
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


@site_1_header_w_0_0_byte_0_byte@
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


@site_1_header_w_0_0_byte_0_undefined1@
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


@site_1_header_w_0_0_address_0@
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


@site_1_header_w_0_0_store_0@
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


@site_1_header_w_0_0_byte_0_char@
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


@site_1_header_w_0_0_byte_1_byte@
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


@site_1_header_w_0_0_byte_1_undefined1@
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


@site_1_header_w_0_0_address_1@
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


@site_1_header_w_0_0_store_1@
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


@site_1_header_w_0_0_byte_1_char@
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


@site_1_header_w_2_17_pair_char_char@
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

@site_1_header_w_2_17_pair_char_byte@
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

@site_1_header_w_2_17_pair_byte_char@
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

@site_1_header_w_2_17_pair_byte_byte@
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

@site_1_header_w_2_17_word_ushort@
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


@site_1_header_w_2_17_word_undefined2@
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


@site_1_header_w_2_17_word_short@
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


@site_1_header_w_2_17_byte_2_byte@
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


@site_1_header_w_2_17_byte_2_undefined1@
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


@site_1_header_w_2_17_address_2@
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


@site_1_header_w_2_17_store_2@
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


@site_1_header_w_2_17_byte_2_char@
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


@site_1_header_w_2_17_byte_3_byte@
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


@site_1_header_w_2_17_byte_3_undefined1@
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


@site_1_header_w_2_17_address_3@
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


@site_1_header_w_2_17_store_3@
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


@site_1_header_w_2_17_byte_3_char@
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


@site_1_header_w_4_34_pair_char_char@
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

@site_1_header_w_4_34_pair_char_byte@
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

@site_1_header_w_4_34_pair_byte_char@
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

@site_1_header_w_4_34_pair_byte_byte@
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

@site_1_header_w_4_34_word_ushort@
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


@site_1_header_w_4_34_word_undefined2@
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


@site_1_header_w_4_34_word_short@
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


@site_1_header_w_4_34_byte_4_byte@
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


@site_1_header_w_4_34_byte_4_undefined1@
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


@site_1_header_w_4_34_address_4@
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


@site_1_header_w_4_34_store_4@
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


@site_1_header_w_4_34_byte_4_char@
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


@site_1_header_w_4_34_byte_5_byte@
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


@site_1_header_w_4_34_byte_5_undefined1@
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


@site_1_header_w_4_34_address_5@
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


@site_1_header_w_4_34_store_5@
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


@site_1_header_w_4_34_byte_5_char@
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


@site_1_header_w_6_51_pair_char_char@
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

@site_1_header_w_6_51_pair_char_byte@
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

@site_1_header_w_6_51_pair_byte_char@
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

@site_1_header_w_6_51_pair_byte_byte@
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

@site_1_header_w_6_51_word_ushort@
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


@site_1_header_w_6_51_word_undefined2@
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


@site_1_header_w_6_51_word_short@
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


@site_1_header_w_6_51_byte_6_byte@
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


@site_1_header_w_6_51_byte_6_undefined1@
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


@site_1_header_w_6_51_address_6@
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


@site_1_header_w_6_51_store_6@
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


@site_1_header_w_6_51_byte_6_char@
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


@site_1_header_w_6_51_byte_7_byte@
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


@site_1_header_w_6_51_byte_7_undefined1@
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


@site_1_header_w_6_51_address_7@
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


@site_1_header_w_6_51_store_7@
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


@site_1_header_w_6_51_byte_7_char@
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


@reallocate_object_to_arena_puVar2_hit_points_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x8)
+ ((uw_mobile_object_t *)puVar2)->hit_points
|
- *(byte *)(puVar2 + 0x4)
+ ((uw_mobile_object_t *)puVar2)->hit_points
|
- (byte)puVar2[0x4]
+ ((uw_mobile_object_t *)puVar2)->hit_points
)
...>
}

@reallocate_object_to_arena_puVar2_hit_points_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x8)
+ ((uw_mobile_object_t *)puVar2)->hit_points
|
- *(undefined1 *)(puVar2 + 0x4)
+ ((uw_mobile_object_t *)puVar2)->hit_points
|
- (undefined1)puVar2[0x4]
+ ((uw_mobile_object_t *)puVar2)->hit_points
)
...>
}

@reallocate_object_to_arena_puVar2_hit_points_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x8)
+ (char *)&((uw_mobile_object_t *)puVar2)->hit_points
|
- &*(char *)(puVar2 + 0x4)
+ (char *)&((uw_mobile_object_t *)puVar2)->hit_points
)
...>
}

@reallocate_object_to_arena_puVar2_hit_points_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x8) = E;
+ ((uw_mobile_object_t *)puVar2)->hit_points = (byte)E;
|
- *(char *)(puVar2 + 0x4) = E;
+ ((uw_mobile_object_t *)puVar2)->hit_points = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_hit_points_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x8)
+ (char)((uw_mobile_object_t *)puVar2)->hit_points
|
- *(char *)(puVar2 + 0x4)
+ (char)((uw_mobile_object_t *)puVar2)->hit_points
|
- (char)puVar2[0x4]
+ (char)((uw_mobile_object_t *)puVar2)->hit_points
)
...>
}

@reallocate_object_to_arena_puVar2_full_heading_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x9)
+ ((uw_mobile_object_t *)puVar2)->full_heading
)
...>
}

@reallocate_object_to_arena_puVar2_full_heading_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x9)
+ ((uw_mobile_object_t *)puVar2)->full_heading
)
...>
}

@reallocate_object_to_arena_puVar2_full_heading_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x9)
+ (char *)&((uw_mobile_object_t *)puVar2)->full_heading
)
...>
}

@reallocate_object_to_arena_puVar2_full_heading_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x9) = E;
+ ((uw_mobile_object_t *)puVar2)->full_heading = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_full_heading_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x9)
+ (char)((uw_mobile_object_t *)puVar2)->full_heading
)
...>
}

@reallocate_object_to_arena_puVar2_movement_flags_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0xa)
+ ((uw_mobile_object_t *)puVar2)->movement_flags
|
- *(byte *)(puVar2 + 0x5)
+ ((uw_mobile_object_t *)puVar2)->movement_flags
|
- (byte)puVar2[0x5]
+ ((uw_mobile_object_t *)puVar2)->movement_flags
)
...>
}

@reallocate_object_to_arena_puVar2_movement_flags_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0xa)
+ ((uw_mobile_object_t *)puVar2)->movement_flags
|
- *(undefined1 *)(puVar2 + 0x5)
+ ((uw_mobile_object_t *)puVar2)->movement_flags
|
- (undefined1)puVar2[0x5]
+ ((uw_mobile_object_t *)puVar2)->movement_flags
)
...>
}

@reallocate_object_to_arena_puVar2_movement_flags_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar2)->movement_flags
|
- &*(char *)(puVar2 + 0x5)
+ (char *)&((uw_mobile_object_t *)puVar2)->movement_flags
)
...>
}

@reallocate_object_to_arena_puVar2_movement_flags_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar2)->movement_flags = (byte)E;
|
- *(char *)(puVar2 + 0x5) = E;
+ ((uw_mobile_object_t *)puVar2)->movement_flags = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_movement_flags_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0xa)
+ (char)((uw_mobile_object_t *)puVar2)->movement_flags
|
- *(char *)(puVar2 + 0x5)
+ (char)((uw_mobile_object_t *)puVar2)->movement_flags
|
- (char)puVar2[0x5]
+ (char)((uw_mobile_object_t *)puVar2)->movement_flags
)
...>
}

@reallocate_object_to_arena_puVar2_motion_flags_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x13)
+ ((uw_mobile_object_t *)puVar2)->motion_flags
)
...>
}

@reallocate_object_to_arena_puVar2_motion_flags_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x13)
+ ((uw_mobile_object_t *)puVar2)->motion_flags
)
...>
}

@reallocate_object_to_arena_puVar2_motion_flags_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x13)
+ (char *)&((uw_mobile_object_t *)puVar2)->motion_flags
)
...>
}

@reallocate_object_to_arena_puVar2_motion_flags_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x13) = E;
+ ((uw_mobile_object_t *)puVar2)->motion_flags = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_motion_flags_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x13)
+ (char)((uw_mobile_object_t *)puVar2)->motion_flags
)
...>
}

@reallocate_object_to_arena_puVar2_attack_pitch_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x14)
+ ((uw_mobile_object_t *)puVar2)->attack_pitch
|
- *(byte *)(puVar2 + 0xa)
+ ((uw_mobile_object_t *)puVar2)->attack_pitch
|
- (byte)puVar2[0xa]
+ ((uw_mobile_object_t *)puVar2)->attack_pitch
)
...>
}

@reallocate_object_to_arena_puVar2_attack_pitch_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x14)
+ ((uw_mobile_object_t *)puVar2)->attack_pitch
|
- *(undefined1 *)(puVar2 + 0xa)
+ ((uw_mobile_object_t *)puVar2)->attack_pitch
|
- (undefined1)puVar2[0xa]
+ ((uw_mobile_object_t *)puVar2)->attack_pitch
)
...>
}

@reallocate_object_to_arena_puVar2_attack_pitch_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x14)
+ (char *)&((uw_mobile_object_t *)puVar2)->attack_pitch
|
- &*(char *)(puVar2 + 0xa)
+ (char *)&((uw_mobile_object_t *)puVar2)->attack_pitch
)
...>
}

@reallocate_object_to_arena_puVar2_attack_pitch_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x14) = E;
+ ((uw_mobile_object_t *)puVar2)->attack_pitch = (byte)E;
|
- *(char *)(puVar2 + 0xa) = E;
+ ((uw_mobile_object_t *)puVar2)->attack_pitch = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_attack_pitch_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x14)
+ (char)((uw_mobile_object_t *)puVar2)->attack_pitch
|
- *(char *)(puVar2 + 0xa)
+ (char)((uw_mobile_object_t *)puVar2)->attack_pitch
|
- (char)puVar2[0xa]
+ (char)((uw_mobile_object_t *)puVar2)->attack_pitch
)
...>
}

@reallocate_object_to_arena_puVar2_animation_flags_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x15)
+ ((uw_mobile_object_t *)puVar2)->animation_flags
)
...>
}

@reallocate_object_to_arena_puVar2_animation_flags_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x15)
+ ((uw_mobile_object_t *)puVar2)->animation_flags
)
...>
}

@reallocate_object_to_arena_puVar2_animation_flags_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x15)
+ (char *)&((uw_mobile_object_t *)puVar2)->animation_flags
)
...>
}

@reallocate_object_to_arena_puVar2_animation_flags_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x15) = E;
+ ((uw_mobile_object_t *)puVar2)->animation_flags = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_animation_flags_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x15)
+ (char)((uw_mobile_object_t *)puVar2)->animation_flags
)
...>
}

@reallocate_object_to_arena_puVar2_heading_flags_byte@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)((char *)puVar2 + 0x18)
+ ((uw_mobile_object_t *)puVar2)->heading_flags
|
- *(byte *)(puVar2 + 0xc)
+ ((uw_mobile_object_t *)puVar2)->heading_flags
|
- (byte)puVar2[0xc]
+ ((uw_mobile_object_t *)puVar2)->heading_flags
)
...>
}

@reallocate_object_to_arena_puVar2_heading_flags_undefined1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)((char *)puVar2 + 0x18)
+ ((uw_mobile_object_t *)puVar2)->heading_flags
|
- *(undefined1 *)(puVar2 + 0xc)
+ ((uw_mobile_object_t *)puVar2)->heading_flags
|
- (undefined1)puVar2[0xc]
+ ((uw_mobile_object_t *)puVar2)->heading_flags
)
...>
}

@reallocate_object_to_arena_puVar2_heading_flags_address@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)((char *)puVar2 + 0x18)
+ (char *)&((uw_mobile_object_t *)puVar2)->heading_flags
|
- &*(char *)(puVar2 + 0xc)
+ (char *)&((uw_mobile_object_t *)puVar2)->heading_flags
)
...>
}

@reallocate_object_to_arena_puVar2_heading_flags_store@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x18) = E;
+ ((uw_mobile_object_t *)puVar2)->heading_flags = (byte)E;
|
- *(char *)(puVar2 + 0xc) = E;
+ ((uw_mobile_object_t *)puVar2)->heading_flags = (byte)E;
)
...>
}

@reallocate_object_to_arena_puVar2_heading_flags_char@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)((char *)puVar2 + 0x18)
+ (char)((uw_mobile_object_t *)puVar2)->heading_flags
|
- *(char *)(puVar2 + 0xc)
+ (char)((uw_mobile_object_t *)puVar2)->heading_flags
|
- (char)puVar2[0xc]
+ (char)((uw_mobile_object_t *)puVar2)->heading_flags
)
...>
}

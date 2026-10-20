@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)target_header)->object_id
|
- ((ushort *)target_header)[0] & 0x1ff
+ ((uw_object_hdr_t *)target_header)->object_id
|
- *(ushort *)target_header & 0x1ff
+ ((uw_object_hdr_t *)target_header)->object_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (*(ushort *)((char *)target_header + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (((ushort *)target_header)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (((ushort *)target_header)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (*(ushort *)target_header >> 9) & 0x7
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (*(ushort *)target_header & 0xe00) >> 9
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (*(byte *)((char *)target_header + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)target_header)->flags_res
|
- (*(byte *)((char *)target_header + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)target_header)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (*(ushort *)((char *)target_header + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (((ushort *)target_header)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (((ushort *)target_header)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (*(ushort *)target_header >> 12) & 0x1
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (*(ushort *)target_header & 0x1000) >> 12
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (*(byte *)((char *)target_header + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)target_header)->enchanted
|
- (*(byte *)((char *)target_header + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)target_header)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (*(ushort *)((char *)target_header + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (((ushort *)target_header)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (((ushort *)target_header)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (*(ushort *)target_header >> 13) & 0x1
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (*(ushort *)target_header & 0x2000) >> 13
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (*(byte *)((char *)target_header + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)target_header)->doordir
|
- (*(byte *)((char *)target_header + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)target_header)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (*(ushort *)((char *)target_header + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (((ushort *)target_header)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (((ushort *)target_header)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (*(ushort *)target_header >> 14) & 0x1
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (*(ushort *)target_header & 0x4000) >> 14
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (*(byte *)((char *)target_header + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)target_header)->invisible
|
- (*(byte *)((char *)target_header + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)target_header)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (*(ushort *)((char *)target_header + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (((ushort *)target_header)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (((ushort *)target_header)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (*(ushort *)target_header >> 15) & 0x1
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (*(ushort *)target_header & 0x8000) >> 15
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (*(byte *)((char *)target_header + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- (*(byte *)((char *)target_header + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)target_header)->is_quant
|
- *(byte *)((char *)target_header + 0x1) >> 7
+ ((uw_object_hdr_t *)target_header)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target_header)->zpos
|
- ((ushort *)target_header)[1] & 0x7f
+ ((uw_object_hdr_t *)target_header)->zpos
|
- *(byte *)((char *)target_header + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target_header)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)target_header)->heading
|
- (*(ushort *)((char *)target_header + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)target_header)->heading
|
- (((ushort *)target_header)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)target_header)->heading
|
- (((ushort *)target_header)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)target_header)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)target_header)->ypos
|
- (*(ushort *)((char *)target_header + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target_header)->ypos
|
- (((ushort *)target_header)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)target_header)->ypos
|
- (((ushort *)target_header)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target_header)->ypos
|
- (*(byte *)((char *)target_header + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)target_header)->ypos
|
- (*(byte *)((char *)target_header + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)target_header)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)target_header)->xpos
|
- (*(ushort *)((char *)target_header + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)target_header)->xpos
|
- (((ushort *)target_header)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target_header)->xpos
|
- (((ushort *)target_header)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target_header)->xpos
|
- (*(byte *)((char *)target_header + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)target_header)->xpos
|
- (*(byte *)((char *)target_header + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)target_header)->xpos
|
- *(byte *)((char *)target_header + 0x3) >> 5
+ ((uw_object_hdr_t *)target_header)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target_header)->quality
|
- ((ushort *)target_header)[2] & 0x3f
+ ((uw_object_hdr_t *)target_header)->quality
|
- *(byte *)((char *)target_header + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target_header)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_header)->next
|
- (*(ushort *)((char *)target_header + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_header)->next
|
- (((ushort *)target_header)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_header)->next
|
- (((ushort *)target_header)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_header)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target_header)->owner
|
- ((ushort *)target_header)[3] & 0x3f
+ ((uw_object_hdr_t *)target_header)->owner
|
- *(byte *)((char *)target_header + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target_header)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_header + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_header)->link
|
- (*(ushort *)((char *)target_header + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_header)->link
|
- (((ushort *)target_header)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_header)->link
|
- (((ushort *)target_header)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_header)->link
)
...>
}

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc_bytes)->object_id
|
- ((ushort *)npc_bytes)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc_bytes)->object_id
|
- *(ushort *)npc_bytes & 0x1ff
+ ((uw_object_hdr_t *)npc_bytes)->object_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (*(ushort *)((char *)npc_bytes + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (((ushort *)npc_bytes)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (((ushort *)npc_bytes)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (*(ushort *)npc_bytes >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (*(ushort *)npc_bytes & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (*(byte *)((char *)npc_bytes + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
|
- (*(byte *)((char *)npc_bytes + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc_bytes)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (*(ushort *)((char *)npc_bytes + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (((ushort *)npc_bytes)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (((ushort *)npc_bytes)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (*(ushort *)npc_bytes >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (*(ushort *)npc_bytes & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (*(byte *)((char *)npc_bytes + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
|
- (*(byte *)((char *)npc_bytes + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc_bytes)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (*(ushort *)((char *)npc_bytes + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (((ushort *)npc_bytes)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (((ushort *)npc_bytes)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (*(ushort *)npc_bytes >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (*(ushort *)npc_bytes & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (*(byte *)((char *)npc_bytes + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->doordir
|
- (*(byte *)((char *)npc_bytes + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc_bytes)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (*(ushort *)((char *)npc_bytes + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (((ushort *)npc_bytes)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (((ushort *)npc_bytes)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (*(ushort *)npc_bytes >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (*(ushort *)npc_bytes & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (*(byte *)((char *)npc_bytes + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->invisible
|
- (*(byte *)((char *)npc_bytes + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc_bytes)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (*(ushort *)((char *)npc_bytes + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (((ushort *)npc_bytes)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (((ushort *)npc_bytes)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (*(ushort *)npc_bytes >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (*(ushort *)npc_bytes & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (*(byte *)((char *)npc_bytes + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- (*(byte *)((char *)npc_bytes + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
|
- *(byte *)((char *)npc_bytes + 0x1) >> 7
+ ((uw_object_hdr_t *)npc_bytes)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_bytes)->zpos
|
- ((ushort *)npc_bytes)[1] & 0x7f
+ ((uw_object_hdr_t *)npc_bytes)->zpos
|
- *(byte *)((char *)npc_bytes + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_bytes)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->heading
|
- (*(ushort *)((char *)npc_bytes + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_bytes)->heading
|
- (((ushort *)npc_bytes)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->heading
|
- (((ushort *)npc_bytes)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_bytes)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->ypos
|
- (*(ushort *)((char *)npc_bytes + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_bytes)->ypos
|
- (((ushort *)npc_bytes)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->ypos
|
- (((ushort *)npc_bytes)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_bytes)->ypos
|
- (*(byte *)((char *)npc_bytes + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->ypos
|
- (*(byte *)((char *)npc_bytes + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc_bytes)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->xpos
|
- (*(ushort *)((char *)npc_bytes + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_bytes)->xpos
|
- (((ushort *)npc_bytes)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->xpos
|
- (((ushort *)npc_bytes)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_bytes)->xpos
|
- (*(byte *)((char *)npc_bytes + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc_bytes)->xpos
|
- (*(byte *)((char *)npc_bytes + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc_bytes)->xpos
|
- *(byte *)((char *)npc_bytes + 0x3) >> 5
+ ((uw_object_hdr_t *)npc_bytes)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_bytes)->quality
|
- ((ushort *)npc_bytes)[2] & 0x3f
+ ((uw_object_hdr_t *)npc_bytes)->quality
|
- *(byte *)((char *)npc_bytes + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_bytes)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_bytes)->next
|
- (*(ushort *)((char *)npc_bytes + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_bytes)->next
|
- (((ushort *)npc_bytes)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_bytes)->next
|
- (((ushort *)npc_bytes)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_bytes)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_bytes)->owner
|
- ((ushort *)npc_bytes)[3] & 0x3f
+ ((uw_object_hdr_t *)npc_bytes)->owner
|
- *(byte *)((char *)npc_bytes + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_bytes)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_bytes + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_bytes)->link
|
- (*(ushort *)((char *)npc_bytes + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_bytes)->link
|
- (((ushort *)npc_bytes)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_bytes)->link
|
- (((ushort *)npc_bytes)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_bytes)->link
)
...>
}

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->object_id
|
- ((ushort *)pcVar3)[0] & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->object_id
|
- *(ushort *)pcVar3 & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->object_id
|
- *(ushort *)(pcVar3 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->object_id
|
- CONCAT11(pcVar3[1], *pcVar3) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->object_id
|
- CONCAT11(pcVar3[1], pcVar3[0]) & 0x1ff
+ ((uw_object_hdr_t *)pcVar3)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (((ushort *)pcVar3)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (((ushort *)pcVar3)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)pcVar3 >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)pcVar3 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)(pcVar3 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(ushort *)(pcVar3 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(byte *)(pcVar3 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->flags_res
|
- (*(byte *)(pcVar3 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pcVar3)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (((ushort *)pcVar3)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (((ushort *)pcVar3)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)pcVar3 >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)pcVar3 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)(pcVar3 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(ushort *)(pcVar3 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(byte *)(pcVar3 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->enchanted
|
- (*(byte *)(pcVar3 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pcVar3)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (((ushort *)pcVar3)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (((ushort *)pcVar3)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)pcVar3 >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)pcVar3 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)(pcVar3 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(ushort *)(pcVar3 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(byte *)(pcVar3 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->doordir
|
- (*(byte *)(pcVar3 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pcVar3)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (((ushort *)pcVar3)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (((ushort *)pcVar3)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)pcVar3 >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)pcVar3 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)(pcVar3 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(ushort *)(pcVar3 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(byte *)(pcVar3 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->invisible
|
- (*(byte *)(pcVar3 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pcVar3)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)((char *)pcVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (((ushort *)pcVar3)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (((ushort *)pcVar3)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)pcVar3 >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)pcVar3 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)(pcVar3 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(ushort *)(pcVar3 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], *pcVar3) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], *pcVar3) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], pcVar3[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (CONCAT11(pcVar3[1], pcVar3[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(byte *)((char *)pcVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(byte *)((char *)pcVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- *(byte *)((char *)pcVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(byte *)(pcVar3 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- (*(byte *)(pcVar3 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pcVar3)->is_quant
|
- *(byte *)(pcVar3 + 0x1) >> 7
+ ((uw_object_hdr_t *)pcVar3)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- ((ushort *)pcVar3)[1] & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- *(ushort *)(pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- *(byte *)((char *)pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- pcVar3[2] & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
|
- *(byte *)(pcVar3 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pcVar3)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (*(ushort *)((char *)pcVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (((ushort *)pcVar3)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (((ushort *)pcVar3)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (*(ushort *)(pcVar3 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->heading
|
- (*(ushort *)(pcVar3 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pcVar3)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(ushort *)((char *)pcVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (((ushort *)pcVar3)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (((ushort *)pcVar3)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(ushort *)(pcVar3 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(ushort *)(pcVar3 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(byte *)((char *)pcVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(byte *)((char *)pcVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(byte *)(pcVar3 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->ypos
|
- (*(byte *)(pcVar3 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pcVar3)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(ushort *)((char *)pcVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (((ushort *)pcVar3)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (((ushort *)pcVar3)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(ushort *)(pcVar3 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(ushort *)(pcVar3 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(byte *)((char *)pcVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(byte *)((char *)pcVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- *(byte *)((char *)pcVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(byte *)(pcVar3 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- (*(byte *)(pcVar3 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pcVar3)->xpos
|
- *(byte *)(pcVar3 + 0x3) >> 5
+ ((uw_object_hdr_t *)pcVar3)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- ((ushort *)pcVar3)[2] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- *(ushort *)(pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- *(byte *)((char *)pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- pcVar3[4] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
|
- *(byte *)(pcVar3 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (*(ushort *)((char *)pcVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (((ushort *)pcVar3)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (((ushort *)pcVar3)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (*(ushort *)(pcVar3 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->next
|
- (*(ushort *)(pcVar3 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- ((ushort *)pcVar3)[3] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- *(ushort *)(pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- *(byte *)((char *)pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- pcVar3[6] & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
|
- *(byte *)(pcVar3 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pcVar3)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pcVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (*(ushort *)((char *)pcVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (((ushort *)pcVar3)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (((ushort *)pcVar3)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (*(ushort *)(pcVar3 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pcVar3)->link
|
- (*(ushort *)(pcVar3 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pcVar3)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@field_6_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)projectile)->object_id
|
- ((ushort *)projectile)[0] & 0x1ff
+ ((uw_object_hdr_t *)projectile)->object_id
|
- *(ushort *)projectile & 0x1ff
+ ((uw_object_hdr_t *)projectile)->object_id
)
...>
}

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (*(ushort *)((char *)projectile + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (((ushort *)projectile)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (((ushort *)projectile)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (*(ushort *)projectile >> 9) & 0x7
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (*(ushort *)projectile & 0xe00) >> 9
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (*(byte *)((char *)projectile + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)projectile)->flags_res
|
- (*(byte *)((char *)projectile + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)projectile)->flags_res
)
...>
}

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (*(ushort *)((char *)projectile + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (((ushort *)projectile)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (((ushort *)projectile)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (*(ushort *)projectile >> 12) & 0x1
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (*(ushort *)projectile & 0x1000) >> 12
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (*(byte *)((char *)projectile + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)projectile)->enchanted
|
- (*(byte *)((char *)projectile + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)projectile)->enchanted
)
...>
}

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (*(ushort *)((char *)projectile + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (((ushort *)projectile)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (((ushort *)projectile)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (*(ushort *)projectile >> 13) & 0x1
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (*(ushort *)projectile & 0x2000) >> 13
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (*(byte *)((char *)projectile + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)projectile)->doordir
|
- (*(byte *)((char *)projectile + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)projectile)->doordir
)
...>
}

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (*(ushort *)((char *)projectile + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (((ushort *)projectile)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (((ushort *)projectile)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (*(ushort *)projectile >> 14) & 0x1
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (*(ushort *)projectile & 0x4000) >> 14
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (*(byte *)((char *)projectile + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)projectile)->invisible
|
- (*(byte *)((char *)projectile + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)projectile)->invisible
)
...>
}

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (*(ushort *)((char *)projectile + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (((ushort *)projectile)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (((ushort *)projectile)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (*(ushort *)projectile >> 15) & 0x1
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (*(ushort *)projectile & 0x8000) >> 15
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (*(byte *)((char *)projectile + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- (*(byte *)((char *)projectile + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)projectile)->is_quant
|
- *(byte *)((char *)projectile + 0x1) >> 7
+ ((uw_object_hdr_t *)projectile)->is_quant
)
...>
}

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x2) & 0x7f
+ ((uw_object_hdr_t *)projectile)->zpos
|
- ((ushort *)projectile)[1] & 0x7f
+ ((uw_object_hdr_t *)projectile)->zpos
|
- *(byte *)((char *)projectile + 0x2) & 0x7f
+ ((uw_object_hdr_t *)projectile)->zpos
)
...>
}

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)projectile)->heading
|
- (*(ushort *)((char *)projectile + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)projectile)->heading
|
- (((ushort *)projectile)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)projectile)->heading
|
- (((ushort *)projectile)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)projectile)->heading
)
...>
}

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)projectile)->ypos
|
- (*(ushort *)((char *)projectile + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)projectile)->ypos
|
- (((ushort *)projectile)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)projectile)->ypos
|
- (((ushort *)projectile)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)projectile)->ypos
|
- (*(byte *)((char *)projectile + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)projectile)->ypos
|
- (*(byte *)((char *)projectile + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)projectile)->ypos
)
...>
}

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)projectile)->xpos
|
- (*(ushort *)((char *)projectile + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)projectile)->xpos
|
- (((ushort *)projectile)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)projectile)->xpos
|
- (((ushort *)projectile)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)projectile)->xpos
|
- (*(byte *)((char *)projectile + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)projectile)->xpos
|
- (*(byte *)((char *)projectile + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)projectile)->xpos
|
- *(byte *)((char *)projectile + 0x3) >> 5
+ ((uw_object_hdr_t *)projectile)->xpos
)
...>
}

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x4) & 0x3f
+ ((uw_object_hdr_t *)projectile)->quality
|
- ((ushort *)projectile)[2] & 0x3f
+ ((uw_object_hdr_t *)projectile)->quality
|
- *(byte *)((char *)projectile + 0x4) & 0x3f
+ ((uw_object_hdr_t *)projectile)->quality
)
...>
}

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)projectile)->next
|
- (*(ushort *)((char *)projectile + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)projectile)->next
|
- (((ushort *)projectile)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)projectile)->next
|
- (((ushort *)projectile)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)projectile)->next
)
...>
}

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0x6) & 0x3f
+ ((uw_object_hdr_t *)projectile)->owner
|
- ((ushort *)projectile)[3] & 0x3f
+ ((uw_object_hdr_t *)projectile)->owner
|
- *(byte *)((char *)projectile + 0x6) & 0x3f
+ ((uw_object_hdr_t *)projectile)->owner
)
...>
}

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)projectile + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)projectile)->link
|
- (*(ushort *)((char *)projectile + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)projectile)->link
|
- (((ushort *)projectile)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)projectile)->link
|
- (((ushort *)projectile)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)projectile)->link
)
...>
}

@field_7_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@field_8_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (*(byte *)((char *)puVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puVar9)->flags_res
|
- (*(byte *)((char *)puVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puVar9)->flags_res
)
...>
}

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (*(byte *)((char *)puVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puVar9)->enchanted
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puVar9)->enchanted
)
...>
}

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (*(byte *)((char *)puVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puVar9)->doordir
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puVar9)->doordir
)
...>
}

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (*(byte *)((char *)puVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puVar9)->invisible
|
- (*(byte *)((char *)puVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puVar9)->invisible
)
...>
}

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (((ushort *)puVar9)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (((ushort *)puVar9)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)puVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar9)->is_quant
|
- (*(ushort *)puVar9 & 0x8000) >> 15
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

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(byte *)((char *)puVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar9)->zpos
)
...>
}

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (*(byte *)((char *)puVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puVar9)->ypos
|
- (*(byte *)((char *)puVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puVar9)->ypos
)
...>
}

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (((ushort *)puVar9)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar9)->xpos
|
- (((ushort *)puVar9)[1] & 0xe000) >> 13
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

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(byte *)((char *)puVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->quality
)
...>
}

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (((ushort *)puVar9)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->next
|
- (((ushort *)puVar9)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->next
)
...>
}

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- *(byte *)((char *)puVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar9)->owner
)
...>
}

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
- (((ushort *)puVar9)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar9)->link
|
- (((ushort *)puVar9)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar9)->link
)
...>
}

@field_9_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
|
- ((ushort *)pObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
|
- *(ushort *)pObj & 0x1ff
+ ((uw_object_hdr_t *)pObj)->object_id
)
...>
}

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)((char *)pObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (((ushort *)pObj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (((ushort *)pObj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)pObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(ushort *)pObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pObj)->flags_res
|
- (*(byte *)((char *)pObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pObj)->flags_res
)
...>
}

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)((char *)pObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (((ushort *)pObj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (((ushort *)pObj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)pObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(ushort *)pObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pObj)->enchanted
|
- (*(byte *)((char *)pObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pObj)->enchanted
)
...>
}

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)((char *)pObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (((ushort *)pObj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (((ushort *)pObj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)pObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(ushort *)pObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pObj)->doordir
|
- (*(byte *)((char *)pObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pObj)->doordir
)
...>
}

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)((char *)pObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (((ushort *)pObj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (((ushort *)pObj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)pObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(ushort *)pObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pObj)->invisible
|
- (*(byte *)((char *)pObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pObj)->invisible
)
...>
}

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)((char *)pObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (((ushort *)pObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(ushort *)pObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(byte *)((char *)pObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- (*(byte *)((char *)pObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pObj)->is_quant
|
- *(byte *)((char *)pObj + 0x1) >> 7
+ ((uw_object_hdr_t *)pObj)->is_quant
)
...>
}

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- ((ushort *)pObj)[1] & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
|
- *(byte *)((char *)pObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pObj)->zpos
)
...>
}

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (*(ushort *)((char *)pObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (((ushort *)pObj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pObj)->heading
|
- (((ushort *)pObj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pObj)->heading
)
...>
}

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(ushort *)((char *)pObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (((ushort *)pObj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (((ushort *)pObj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pObj)->ypos
|
- (*(byte *)((char *)pObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pObj)->ypos
)
...>
}

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(ushort *)((char *)pObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (((ushort *)pObj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(byte *)((char *)pObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pObj)->xpos
|
- (*(byte *)((char *)pObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pObj)->xpos
|
- *(byte *)((char *)pObj + 0x3) >> 5
+ ((uw_object_hdr_t *)pObj)->xpos
)
...>
}

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- ((ushort *)pObj)[2] & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
|
- *(byte *)((char *)pObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pObj)->quality
)
...>
}

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (*(ushort *)((char *)pObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->next
|
- (((ushort *)pObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->next
)
...>
}

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- ((ushort *)pObj)[3] & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
|
- *(byte *)((char *)pObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pObj)->owner
)
...>
}

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (*(ushort *)((char *)pObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pObj)->link
|
- (((ushort *)pObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pObj)->link
)
...>
}

@field_10_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
|
- ((ushort *)creature)[0] & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
|
- *(ushort *)creature & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
)
...>
}

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(ushort *)((char *)creature + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (((ushort *)creature)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (((ushort *)creature)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(ushort *)creature >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(ushort *)creature & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(byte *)((char *)creature + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(byte *)((char *)creature + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)creature)->flags_res
)
...>
}

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(ushort *)((char *)creature + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (((ushort *)creature)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (((ushort *)creature)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(ushort *)creature >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(ushort *)creature & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(byte *)((char *)creature + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(byte *)((char *)creature + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)creature)->enchanted
)
...>
}

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(ushort *)((char *)creature + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (((ushort *)creature)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (((ushort *)creature)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(ushort *)creature >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(ushort *)creature & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(byte *)((char *)creature + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(byte *)((char *)creature + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)creature)->doordir
)
...>
}

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(ushort *)((char *)creature + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (((ushort *)creature)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (((ushort *)creature)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(ushort *)creature >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(ushort *)creature & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(byte *)((char *)creature + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(byte *)((char *)creature + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)creature)->invisible
)
...>
}

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(ushort *)((char *)creature + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (((ushort *)creature)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (((ushort *)creature)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(ushort *)creature >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(ushort *)creature & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(byte *)((char *)creature + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(byte *)((char *)creature + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)creature)->is_quant
|
- *(byte *)((char *)creature + 0x1) >> 7
+ ((uw_object_hdr_t *)creature)->is_quant
)
...>
}

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
|
- ((ushort *)creature)[1] & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
|
- *(byte *)((char *)creature + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
)
...>
}

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)creature)->heading
|
- (*(ushort *)((char *)creature + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)creature)->heading
|
- (((ushort *)creature)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)creature)->heading
|
- (((ushort *)creature)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)creature)->heading
)
...>
}

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (*(ushort *)((char *)creature + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature)->ypos
|
- (((ushort *)creature)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (((ushort *)creature)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature)->ypos
|
- (*(byte *)((char *)creature + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (*(byte *)((char *)creature + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)creature)->ypos
)
...>
}

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (*(ushort *)((char *)creature + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- (((ushort *)creature)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (((ushort *)creature)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- (*(byte *)((char *)creature + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (*(byte *)((char *)creature + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)creature)->xpos
|
- *(byte *)((char *)creature + 0x3) >> 5
+ ((uw_object_hdr_t *)creature)->xpos
)
...>
}

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
|
- ((ushort *)creature)[2] & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
|
- *(byte *)((char *)creature + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
)
...>
}

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->next
|
- (*(ushort *)((char *)creature + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->next
|
- (((ushort *)creature)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->next
|
- (((ushort *)creature)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->next
)
...>
}

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
|
- ((ushort *)creature)[3] & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
|
- *(byte *)((char *)creature + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
)
...>
}

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->link
|
- (*(ushort *)((char *)creature + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->link
|
- (((ushort *)creature)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->link
|
- (((ushort *)creature)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->link
)
...>
}

@field_11_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)creature_ptr)->object_id
|
- ((ushort *)creature_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)creature_ptr)->object_id
|
- *(ushort *)creature_ptr & 0x1ff
+ ((uw_object_hdr_t *)creature_ptr)->object_id
|
- *(ushort *)(creature_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)creature_ptr)->object_id
)
...>
}

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(ushort *)((char *)creature_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (((ushort *)creature_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (((ushort *)creature_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(ushort *)creature_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(ushort *)creature_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(ushort *)(creature_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(ushort *)(creature_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(byte *)((char *)creature_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(byte *)((char *)creature_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(byte *)(creature_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
|
- (*(byte *)(creature_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)creature_ptr)->flags_res
)
...>
}

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(ushort *)((char *)creature_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (((ushort *)creature_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (((ushort *)creature_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(ushort *)creature_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(ushort *)creature_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(ushort *)(creature_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(ushort *)(creature_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(byte *)((char *)creature_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(byte *)((char *)creature_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(byte *)(creature_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
|
- (*(byte *)(creature_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)creature_ptr)->enchanted
)
...>
}

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(ushort *)((char *)creature_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (((ushort *)creature_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (((ushort *)creature_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(ushort *)creature_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(ushort *)creature_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(ushort *)(creature_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(ushort *)(creature_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(byte *)((char *)creature_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(byte *)((char *)creature_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(byte *)(creature_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->doordir
|
- (*(byte *)(creature_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)creature_ptr)->doordir
)
...>
}

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(ushort *)((char *)creature_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (((ushort *)creature_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (((ushort *)creature_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(ushort *)creature_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(ushort *)creature_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(ushort *)(creature_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(ushort *)(creature_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(byte *)((char *)creature_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(byte *)((char *)creature_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(byte *)(creature_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->invisible
|
- (*(byte *)(creature_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->invisible
)
...>
}

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(ushort *)((char *)creature_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (((ushort *)creature_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (((ushort *)creature_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(ushort *)creature_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(ushort *)creature_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(ushort *)(creature_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(ushort *)(creature_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(byte *)((char *)creature_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(byte *)((char *)creature_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- *(byte *)((char *)creature_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(byte *)(creature_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- (*(byte *)(creature_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
|
- *(byte *)(creature_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->is_quant
)
...>
}

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature_ptr)->zpos
|
- ((ushort *)creature_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)creature_ptr)->zpos
|
- *(ushort *)(creature_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature_ptr)->zpos
|
- *(byte *)((char *)creature_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature_ptr)->zpos
|
- *(byte *)(creature_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature_ptr)->zpos
)
...>
}

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->heading
|
- (*(ushort *)((char *)creature_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->heading
|
- (((ushort *)creature_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->heading
|
- (((ushort *)creature_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->heading
|
- (*(ushort *)(creature_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->heading
|
- (*(ushort *)(creature_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)creature_ptr)->heading
)
...>
}

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(ushort *)((char *)creature_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (((ushort *)creature_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (((ushort *)creature_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(ushort *)(creature_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(ushort *)(creature_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(byte *)((char *)creature_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(byte *)((char *)creature_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(byte *)(creature_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->ypos
|
- (*(byte *)(creature_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)creature_ptr)->ypos
)
...>
}

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(ushort *)((char *)creature_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (((ushort *)creature_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (((ushort *)creature_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(ushort *)(creature_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(ushort *)(creature_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(byte *)((char *)creature_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(byte *)((char *)creature_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- *(byte *)((char *)creature_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(byte *)(creature_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- (*(byte *)(creature_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)creature_ptr)->xpos
|
- *(byte *)(creature_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)creature_ptr)->xpos
)
...>
}

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->quality
|
- ((ushort *)creature_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->quality
|
- *(ushort *)(creature_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->quality
|
- *(byte *)((char *)creature_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->quality
|
- *(byte *)(creature_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->quality
)
...>
}

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature_ptr)->next
|
- (*(ushort *)((char *)creature_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->next
|
- (((ushort *)creature_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature_ptr)->next
|
- (((ushort *)creature_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->next
|
- (*(ushort *)(creature_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature_ptr)->next
|
- (*(ushort *)(creature_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->next
)
...>
}

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->owner
|
- ((ushort *)creature_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->owner
|
- *(ushort *)(creature_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->owner
|
- *(byte *)((char *)creature_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->owner
|
- *(byte *)(creature_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature_ptr)->owner
)
...>
}

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature_ptr)->link
|
- (*(ushort *)((char *)creature_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->link
|
- (((ushort *)creature_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature_ptr)->link
|
- (((ushort *)creature_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->link
|
- (*(ushort *)(creature_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature_ptr)->link
|
- (*(ushort *)(creature_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature_ptr)->link
)
...>
}

@field_12_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@field_13_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
)
...>
}

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (*(byte *)((char *)iVar6 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar6)->flags_res
|
- (*(byte *)((char *)iVar6 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar6)->flags_res
)
...>
}

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (*(byte *)((char *)iVar6 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar6)->enchanted
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar6)->enchanted
)
...>
}

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (*(byte *)((char *)iVar6 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar6)->doordir
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar6)->doordir
)
...>
}

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (*(byte *)((char *)iVar6 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar6)->invisible
|
- (*(byte *)((char *)iVar6 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar6)->invisible
)
...>
}

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (((ushort *)iVar6)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (((ushort *)iVar6)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)iVar6 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6)->is_quant
|
- (*(ushort *)iVar6 & 0x8000) >> 15
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

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- *(byte *)((char *)iVar6 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6)->zpos
)
...>
}

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
)
...>
}

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (*(byte *)((char *)iVar6 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar6)->ypos
|
- (*(byte *)((char *)iVar6 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar6)->ypos
)
...>
}

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (((ushort *)iVar6)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6)->xpos
|
- (((ushort *)iVar6)[1] & 0xe000) >> 13
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

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- *(byte *)((char *)iVar6 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->quality
)
...>
}

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (((ushort *)iVar6)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->next
|
- (((ushort *)iVar6)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->next
)
...>
}

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- *(byte *)((char *)iVar6 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6)->owner
)
...>
}

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
- (((ushort *)iVar6)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6)->link
|
- (((ushort *)iVar6)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6)->link
)
...>
}

@field_14_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- ((ushort *)npc)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- *(ushort *)npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)((char *)npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc)->flags_res
)
...>
}

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)((char *)npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc)->enchanted
)
...>
}

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)((char *)npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc)->doordir
)
...>
}

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)((char *)npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc)->invisible
)
...>
}

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)((char *)npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(byte *)((char *)npc + 0x1) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
)
...>
}

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- ((ushort *)npc)[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(byte *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
)
...>
}

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)((char *)npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
)
...>
}

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)((char *)npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc)->ypos
)
...>
}

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)((char *)npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(byte *)((char *)npc + 0x3) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
)
...>
}

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- ((ushort *)npc)[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(byte *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
)
...>
}

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)((char *)npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
)
...>
}

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- ((ushort *)npc)[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(byte *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
)
...>
}

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)((char *)npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
)
...>
}

@field_15_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
|
- ((ushort *)creature)[0] & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
|
- *(ushort *)creature & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
|
- creature[0] & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
|
- *creature & 0x1ff
+ ((uw_object_hdr_t *)creature)->object_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(ushort *)((char *)creature + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (((ushort *)creature)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (((ushort *)creature)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(ushort *)creature >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(ushort *)creature & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (creature[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (creature[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*creature >> 9) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*creature & 0xe00) >> 9
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(byte *)((char *)creature + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)creature)->flags_res
|
- (*(byte *)((char *)creature + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)creature)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(ushort *)((char *)creature + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (((ushort *)creature)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (((ushort *)creature)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(ushort *)creature >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(ushort *)creature & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (creature[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (creature[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*creature >> 12) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*creature & 0x1000) >> 12
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(byte *)((char *)creature + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)creature)->enchanted
|
- (*(byte *)((char *)creature + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)creature)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(ushort *)((char *)creature + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (((ushort *)creature)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (((ushort *)creature)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(ushort *)creature >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(ushort *)creature & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (creature[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (creature[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*creature >> 13) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*creature & 0x2000) >> 13
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(byte *)((char *)creature + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)creature)->doordir
|
- (*(byte *)((char *)creature + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)creature)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(ushort *)((char *)creature + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (((ushort *)creature)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (((ushort *)creature)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(ushort *)creature >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(ushort *)creature & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (creature[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (creature[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*creature >> 14) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*creature & 0x4000) >> 14
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(byte *)((char *)creature + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)creature)->invisible
|
- (*(byte *)((char *)creature + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)creature)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(ushort *)((char *)creature + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- *(ushort *)((char *)creature + 0x0) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (((ushort *)creature)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (((ushort *)creature)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- ((ushort *)creature)[0] >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(ushort *)creature >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(ushort *)creature & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- *(ushort *)creature >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (creature[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (creature[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- creature[0] >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*creature >> 15) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*creature & 0x8000) >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- *creature >> 15
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(byte *)((char *)creature + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)creature)->is_quant
|
- (*(byte *)((char *)creature + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)creature)->is_quant
|
- *(byte *)((char *)creature + 0x1) >> 7
+ ((uw_object_hdr_t *)creature)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
|
- ((ushort *)creature)[1] & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
|
- creature[1] & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
|
- *(byte *)((char *)creature + 0x2) & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
|
- (byte)creature[1] & 0x7f
+ ((uw_object_hdr_t *)creature)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)creature)->heading
|
- (*(ushort *)((char *)creature + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)creature)->heading
|
- (((ushort *)creature)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)creature)->heading
|
- (((ushort *)creature)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)creature)->heading
|
- (creature[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)creature)->heading
|
- (creature[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)creature)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (*(ushort *)((char *)creature + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature)->ypos
|
- (((ushort *)creature)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (((ushort *)creature)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature)->ypos
|
- (creature[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (creature[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)creature)->ypos
|
- (*(byte *)((char *)creature + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)creature)->ypos
|
- (*(byte *)((char *)creature + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)creature)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (*(ushort *)((char *)creature + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- *(ushort *)((char *)creature + 0x2) >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- (((ushort *)creature)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (((ushort *)creature)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- ((ushort *)creature)[1] >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- (creature[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (creature[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- creature[1] >> 13
+ ((uw_object_hdr_t *)creature)->xpos
|
- (*(byte *)((char *)creature + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)creature)->xpos
|
- (*(byte *)((char *)creature + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)creature)->xpos
|
- *(byte *)((char *)creature + 0x3) >> 5
+ ((uw_object_hdr_t *)creature)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
|
- ((ushort *)creature)[2] & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
|
- creature[2] & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
|
- *(byte *)((char *)creature + 0x4) & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
|
- (byte)creature[2] & 0x3f
+ ((uw_object_hdr_t *)creature)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->next
|
- (*(ushort *)((char *)creature + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->next
|
- *(ushort *)((char *)creature + 0x4) >> 6
+ ((uw_object_hdr_t *)creature)->next
|
- (((ushort *)creature)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->next
|
- (((ushort *)creature)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->next
|
- ((ushort *)creature)[2] >> 6
+ ((uw_object_hdr_t *)creature)->next
|
- (creature[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->next
|
- (creature[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->next
|
- creature[2] >> 6
+ ((uw_object_hdr_t *)creature)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
|
- ((ushort *)creature)[3] & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
|
- creature[3] & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
|
- *(byte *)((char *)creature + 0x6) & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
|
- (byte)creature[3] & 0x3f
+ ((uw_object_hdr_t *)creature)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)creature + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->link
|
- (*(ushort *)((char *)creature + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->link
|
- *(ushort *)((char *)creature + 0x6) >> 6
+ ((uw_object_hdr_t *)creature)->link
|
- (((ushort *)creature)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->link
|
- (((ushort *)creature)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->link
|
- ((ushort *)creature)[3] >> 6
+ ((uw_object_hdr_t *)creature)->link
|
- (creature[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)creature)->link
|
- (creature[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)creature)->link
|
- creature[3] >> 6
+ ((uw_object_hdr_t *)creature)->link
)
...>
}

@field_16_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)monster)->object_id
|
- ((ushort *)monster)[0] & 0x1ff
+ ((uw_object_hdr_t *)monster)->object_id
|
- *(ushort *)monster & 0x1ff
+ ((uw_object_hdr_t *)monster)->object_id
)
...>
}

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (*(ushort *)((char *)monster + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (((ushort *)monster)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (((ushort *)monster)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (*(ushort *)monster >> 9) & 0x7
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (*(ushort *)monster & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (*(byte *)((char *)monster + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)monster)->flags_res
|
- (*(byte *)((char *)monster + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)monster)->flags_res
)
...>
}

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (*(ushort *)((char *)monster + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (((ushort *)monster)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (((ushort *)monster)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (*(ushort *)monster >> 12) & 0x1
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (*(ushort *)monster & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (*(byte *)((char *)monster + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)monster)->enchanted
|
- (*(byte *)((char *)monster + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)monster)->enchanted
)
...>
}

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)monster)->doordir
|
- (*(ushort *)((char *)monster + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster)->doordir
|
- (((ushort *)monster)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)monster)->doordir
|
- (((ushort *)monster)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster)->doordir
|
- (*(ushort *)monster >> 13) & 0x1
+ ((uw_object_hdr_t *)monster)->doordir
|
- (*(ushort *)monster & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster)->doordir
|
- (*(byte *)((char *)monster + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)monster)->doordir
|
- (*(byte *)((char *)monster + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)monster)->doordir
)
...>
}

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)monster)->invisible
|
- (*(ushort *)((char *)monster + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster)->invisible
|
- (((ushort *)monster)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)monster)->invisible
|
- (((ushort *)monster)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster)->invisible
|
- (*(ushort *)monster >> 14) & 0x1
+ ((uw_object_hdr_t *)monster)->invisible
|
- (*(ushort *)monster & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster)->invisible
|
- (*(byte *)((char *)monster + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)monster)->invisible
|
- (*(byte *)((char *)monster + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)monster)->invisible
)
...>
}

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (*(ushort *)((char *)monster + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (((ushort *)monster)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (((ushort *)monster)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (*(ushort *)monster >> 15) & 0x1
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (*(ushort *)monster & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (*(byte *)((char *)monster + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)monster)->is_quant
|
- (*(byte *)((char *)monster + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)monster)->is_quant
|
- *(byte *)((char *)monster + 0x1) >> 7
+ ((uw_object_hdr_t *)monster)->is_quant
)
...>
}

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)monster)->zpos
|
- ((ushort *)monster)[1] & 0x7f
+ ((uw_object_hdr_t *)monster)->zpos
|
- *(byte *)((char *)monster + 0x2) & 0x7f
+ ((uw_object_hdr_t *)monster)->zpos
)
...>
}

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)monster)->heading
|
- (*(ushort *)((char *)monster + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)monster)->heading
|
- (((ushort *)monster)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)monster)->heading
|
- (((ushort *)monster)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)monster)->heading
)
...>
}

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)monster)->ypos
|
- (*(ushort *)((char *)monster + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)monster)->ypos
|
- (((ushort *)monster)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)monster)->ypos
|
- (((ushort *)monster)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)monster)->ypos
|
- (*(byte *)((char *)monster + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)monster)->ypos
|
- (*(byte *)((char *)monster + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)monster)->ypos
)
...>
}

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)monster)->xpos
|
- (*(ushort *)((char *)monster + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)monster)->xpos
|
- (((ushort *)monster)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)monster)->xpos
|
- (((ushort *)monster)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)monster)->xpos
|
- (*(byte *)((char *)monster + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)monster)->xpos
|
- (*(byte *)((char *)monster + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)monster)->xpos
|
- *(byte *)((char *)monster + 0x3) >> 5
+ ((uw_object_hdr_t *)monster)->xpos
)
...>
}

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)monster)->quality
|
- ((ushort *)monster)[2] & 0x3f
+ ((uw_object_hdr_t *)monster)->quality
|
- *(byte *)((char *)monster + 0x4) & 0x3f
+ ((uw_object_hdr_t *)monster)->quality
)
...>
}

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster)->next
|
- (*(ushort *)((char *)monster + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster)->next
|
- (((ushort *)monster)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster)->next
|
- (((ushort *)monster)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster)->next
)
...>
}

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)monster)->owner
|
- ((ushort *)monster)[3] & 0x3f
+ ((uw_object_hdr_t *)monster)->owner
|
- *(byte *)((char *)monster + 0x6) & 0x3f
+ ((uw_object_hdr_t *)monster)->owner
)
...>
}

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster)->link
|
- (*(ushort *)((char *)monster + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster)->link
|
- (((ushort *)monster)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster)->link
|
- (((ushort *)monster)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster)->link
)
...>
}

@field_17_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->object_id
|
- ((ushort *)pDropObj)[0] & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->object_id
|
- *(ushort *)pDropObj & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->object_id
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (((ushort *)pDropObj)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (((ushort *)pDropObj)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)pDropObj >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)pDropObj & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)((char *)pDropObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)((char *)pDropObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pDropObj)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (((ushort *)pDropObj)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (((ushort *)pDropObj)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)pDropObj >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)pDropObj & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)((char *)pDropObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pDropObj)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (((ushort *)pDropObj)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (((ushort *)pDropObj)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)pDropObj >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)pDropObj & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)((char *)pDropObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pDropObj)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (((ushort *)pDropObj)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (((ushort *)pDropObj)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)pDropObj >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)pDropObj & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)((char *)pDropObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pDropObj)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)((char *)pDropObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (((ushort *)pDropObj)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (((ushort *)pDropObj)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)pDropObj >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)pDropObj & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(byte *)((char *)pDropObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- *(byte *)((char *)pDropObj + 0x1) >> 7
+ ((uw_object_hdr_t *)pDropObj)->is_quant
)
...>
}

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- ((ushort *)pDropObj)[1] & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- *(byte *)((char *)pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (*(ushort *)((char *)pDropObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (((ushort *)pDropObj)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (((ushort *)pDropObj)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pDropObj)->heading
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(ushort *)((char *)pDropObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (((ushort *)pDropObj)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (((ushort *)pDropObj)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)((char *)pDropObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)((char *)pDropObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pDropObj)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(ushort *)((char *)pDropObj + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (((ushort *)pDropObj)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (((ushort *)pDropObj)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(byte *)((char *)pDropObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(byte *)((char *)pDropObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- *(byte *)((char *)pDropObj + 0x3) >> 5
+ ((uw_object_hdr_t *)pDropObj)->xpos
)
...>
}

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- ((ushort *)pDropObj)[2] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- *(byte *)((char *)pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (*(ushort *)((char *)pDropObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (((ushort *)pDropObj)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (((ushort *)pDropObj)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- ((ushort *)pDropObj)[3] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- *(byte *)((char *)pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pDropObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (*(ushort *)((char *)pDropObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (((ushort *)pDropObj)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (((ushort *)pDropObj)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->link
)
...>
}

@field_18_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)monster_ptr)->object_id
|
- ((ushort *)monster_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)monster_ptr)->object_id
|
- *(ushort *)monster_ptr & 0x1ff
+ ((uw_object_hdr_t *)monster_ptr)->object_id
|
- *(ushort *)(monster_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)monster_ptr)->object_id
)
...>
}

@field_18_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(ushort *)((char *)monster_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (((ushort *)monster_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (((ushort *)monster_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(ushort *)monster_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(ushort *)monster_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(ushort *)(monster_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(ushort *)(monster_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(byte *)((char *)monster_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(byte *)((char *)monster_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(byte *)(monster_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
|
- (*(byte *)(monster_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)monster_ptr)->flags_res
)
...>
}

@field_18_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(ushort *)((char *)monster_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (((ushort *)monster_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (((ushort *)monster_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(ushort *)monster_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(ushort *)monster_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(ushort *)(monster_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(ushort *)(monster_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(byte *)((char *)monster_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(byte *)((char *)monster_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(byte *)(monster_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
|
- (*(byte *)(monster_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)monster_ptr)->enchanted
)
...>
}

@field_18_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(ushort *)((char *)monster_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (((ushort *)monster_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (((ushort *)monster_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(ushort *)monster_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(ushort *)monster_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(ushort *)(monster_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(ushort *)(monster_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(byte *)((char *)monster_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(byte *)((char *)monster_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(byte *)(monster_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->doordir
|
- (*(byte *)(monster_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)monster_ptr)->doordir
)
...>
}

@field_18_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(ushort *)((char *)monster_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (((ushort *)monster_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (((ushort *)monster_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(ushort *)monster_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(ushort *)monster_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(ushort *)(monster_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(ushort *)(monster_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(byte *)((char *)monster_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(byte *)((char *)monster_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(byte *)(monster_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->invisible
|
- (*(byte *)(monster_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->invisible
)
...>
}

@field_18_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(ushort *)((char *)monster_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (((ushort *)monster_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (((ushort *)monster_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(ushort *)monster_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(ushort *)monster_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(ushort *)(monster_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(ushort *)(monster_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(byte *)((char *)monster_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(byte *)((char *)monster_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- *(byte *)((char *)monster_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(byte *)(monster_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- (*(byte *)(monster_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
|
- *(byte *)(monster_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->is_quant
)
...>
}

@field_18_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)monster_ptr)->zpos
|
- ((ushort *)monster_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)monster_ptr)->zpos
|
- *(ushort *)(monster_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)monster_ptr)->zpos
|
- *(byte *)((char *)monster_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)monster_ptr)->zpos
|
- *(byte *)(monster_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)monster_ptr)->zpos
)
...>
}

@field_18_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->heading
|
- (*(ushort *)((char *)monster_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->heading
|
- (((ushort *)monster_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->heading
|
- (((ushort *)monster_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->heading
|
- (*(ushort *)(monster_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->heading
|
- (*(ushort *)(monster_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)monster_ptr)->heading
)
...>
}

@field_18_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(ushort *)((char *)monster_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (((ushort *)monster_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (((ushort *)monster_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(ushort *)(monster_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(ushort *)(monster_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(byte *)((char *)monster_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(byte *)((char *)monster_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(byte *)(monster_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->ypos
|
- (*(byte *)(monster_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)monster_ptr)->ypos
)
...>
}

@field_18_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(ushort *)((char *)monster_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (((ushort *)monster_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (((ushort *)monster_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(ushort *)(monster_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(ushort *)(monster_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(byte *)((char *)monster_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(byte *)((char *)monster_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- *(byte *)((char *)monster_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(byte *)(monster_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- (*(byte *)(monster_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)monster_ptr)->xpos
|
- *(byte *)(monster_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)monster_ptr)->xpos
)
...>
}

@field_18_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->quality
|
- ((ushort *)monster_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->quality
|
- *(ushort *)(monster_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->quality
|
- *(byte *)((char *)monster_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->quality
|
- *(byte *)(monster_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->quality
)
...>
}

@field_18_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster_ptr)->next
|
- (*(ushort *)((char *)monster_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->next
|
- (((ushort *)monster_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster_ptr)->next
|
- (((ushort *)monster_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->next
|
- (*(ushort *)(monster_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster_ptr)->next
|
- (*(ushort *)(monster_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->next
)
...>
}

@field_18_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->owner
|
- ((ushort *)monster_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->owner
|
- *(ushort *)(monster_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->owner
|
- *(byte *)((char *)monster_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->owner
|
- *(byte *)(monster_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)monster_ptr)->owner
)
...>
}

@field_18_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)monster_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster_ptr)->link
|
- (*(ushort *)((char *)monster_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->link
|
- (((ushort *)monster_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster_ptr)->link
|
- (((ushort *)monster_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->link
|
- (*(ushort *)(monster_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)monster_ptr)->link
|
- (*(ushort *)(monster_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)monster_ptr)->link
)
...>
}

@field_19_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_19_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@field_20_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_20_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@field_21_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->object_id
|
- ((ushort *)npc_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->object_id
|
- *(ushort *)npc_rec & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->object_id
|
- *(ushort *)(npc_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->object_id
|
- CONCAT11(npc_rec[1], *npc_rec) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->object_id
|
- CONCAT11(npc_rec[1], npc_rec[0]) & 0x1ff
+ ((uw_object_hdr_t *)npc_rec)->object_id
)
...>
}

@field_21_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (((ushort *)npc_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (((ushort *)npc_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)npc_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)npc_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)(npc_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(ushort *)(npc_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)((char *)npc_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)((char *)npc_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)(npc_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->flags_res
|
- (*(byte *)(npc_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc_rec)->flags_res
)
...>
}

@field_21_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (((ushort *)npc_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (((ushort *)npc_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)npc_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)npc_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)(npc_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(ushort *)(npc_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)((char *)npc_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)(npc_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->enchanted
|
- (*(byte *)(npc_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc_rec)->enchanted
)
...>
}

@field_21_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (((ushort *)npc_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (((ushort *)npc_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)npc_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)npc_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)(npc_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(ushort *)(npc_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)((char *)npc_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)(npc_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->doordir
|
- (*(byte *)(npc_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc_rec)->doordir
)
...>
}

@field_21_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (((ushort *)npc_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (((ushort *)npc_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)npc_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)npc_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)(npc_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(ushort *)(npc_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)((char *)npc_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)(npc_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->invisible
|
- (*(byte *)(npc_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc_rec)->invisible
)
...>
}

@field_21_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)((char *)npc_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (((ushort *)npc_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (((ushort *)npc_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)npc_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)npc_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)(npc_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(ushort *)(npc_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], *npc_rec) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], *npc_rec) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], npc_rec[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (CONCAT11(npc_rec[1], npc_rec[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)((char *)npc_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)((char *)npc_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- *(byte *)((char *)npc_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)(npc_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- (*(byte *)(npc_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
|
- *(byte *)(npc_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)npc_rec)->is_quant
)
...>
}

@field_21_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- ((ushort *)npc_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- *(ushort *)(npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- *(byte *)((char *)npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- npc_rec[2] & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
|
- *(byte *)(npc_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_rec)->zpos
)
...>
}

@field_21_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (*(ushort *)((char *)npc_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (((ushort *)npc_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (((ushort *)npc_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (*(ushort *)(npc_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->heading
|
- (*(ushort *)(npc_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_rec)->heading
)
...>
}

@field_21_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(ushort *)((char *)npc_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (((ushort *)npc_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (((ushort *)npc_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(ushort *)(npc_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(ushort *)(npc_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)((char *)npc_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)((char *)npc_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)(npc_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->ypos
|
- (*(byte *)(npc_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc_rec)->ypos
)
...>
}

@field_21_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(ushort *)((char *)npc_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (((ushort *)npc_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (((ushort *)npc_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(ushort *)(npc_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(ushort *)(npc_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)((char *)npc_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)((char *)npc_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- *(byte *)((char *)npc_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)(npc_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- (*(byte *)(npc_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
|
- *(byte *)(npc_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)npc_rec)->xpos
)
...>
}

@field_21_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- ((ushort *)npc_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- *(ushort *)(npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- *(byte *)((char *)npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- npc_rec[4] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
|
- *(byte *)(npc_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->quality
)
...>
}

@field_21_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (*(ushort *)((char *)npc_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (((ushort *)npc_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (((ushort *)npc_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (*(ushort *)(npc_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->next
|
- (*(ushort *)(npc_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->next
)
...>
}

@field_21_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- ((ushort *)npc_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- *(ushort *)(npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- *(byte *)((char *)npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- npc_rec[6] & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
|
- *(byte *)(npc_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_rec)->owner
)
...>
}

@field_21_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (*(ushort *)((char *)npc_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (((ushort *)npc_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (((ushort *)npc_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (*(ushort *)(npc_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_rec)->link
|
- (*(ushort *)(npc_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_rec)->link
)
...>
}

@field_22_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)target_object)->object_id
|
- ((ushort *)target_object)[0] & 0x1ff
+ ((uw_object_hdr_t *)target_object)->object_id
|
- *(ushort *)target_object & 0x1ff
+ ((uw_object_hdr_t *)target_object)->object_id
)
...>
}

@field_22_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (*(ushort *)((char *)target_object + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (((ushort *)target_object)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (((ushort *)target_object)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (*(ushort *)target_object >> 9) & 0x7
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (*(ushort *)target_object & 0xe00) >> 9
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (*(byte *)((char *)target_object + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)target_object)->flags_res
|
- (*(byte *)((char *)target_object + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)target_object)->flags_res
)
...>
}

@field_22_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (*(ushort *)((char *)target_object + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (((ushort *)target_object)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (((ushort *)target_object)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (*(ushort *)target_object >> 12) & 0x1
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (*(ushort *)target_object & 0x1000) >> 12
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (*(byte *)((char *)target_object + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)target_object)->enchanted
|
- (*(byte *)((char *)target_object + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)target_object)->enchanted
)
...>
}

@field_22_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (*(ushort *)((char *)target_object + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (((ushort *)target_object)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (((ushort *)target_object)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (*(ushort *)target_object >> 13) & 0x1
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (*(ushort *)target_object & 0x2000) >> 13
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (*(byte *)((char *)target_object + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)target_object)->doordir
|
- (*(byte *)((char *)target_object + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)target_object)->doordir
)
...>
}

@field_22_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (*(ushort *)((char *)target_object + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (((ushort *)target_object)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (((ushort *)target_object)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (*(ushort *)target_object >> 14) & 0x1
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (*(ushort *)target_object & 0x4000) >> 14
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (*(byte *)((char *)target_object + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)target_object)->invisible
|
- (*(byte *)((char *)target_object + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)target_object)->invisible
)
...>
}

@field_22_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (*(ushort *)((char *)target_object + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (((ushort *)target_object)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (((ushort *)target_object)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (*(ushort *)target_object >> 15) & 0x1
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (*(ushort *)target_object & 0x8000) >> 15
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (*(byte *)((char *)target_object + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- (*(byte *)((char *)target_object + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)target_object)->is_quant
|
- *(byte *)((char *)target_object + 0x1) >> 7
+ ((uw_object_hdr_t *)target_object)->is_quant
)
...>
}

@field_22_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target_object)->zpos
|
- ((ushort *)target_object)[1] & 0x7f
+ ((uw_object_hdr_t *)target_object)->zpos
|
- *(byte *)((char *)target_object + 0x2) & 0x7f
+ ((uw_object_hdr_t *)target_object)->zpos
)
...>
}

@field_22_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)target_object)->heading
|
- (*(ushort *)((char *)target_object + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)target_object)->heading
|
- (((ushort *)target_object)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)target_object)->heading
|
- (((ushort *)target_object)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)target_object)->heading
)
...>
}

@field_22_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)target_object)->ypos
|
- (*(ushort *)((char *)target_object + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target_object)->ypos
|
- (((ushort *)target_object)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)target_object)->ypos
|
- (((ushort *)target_object)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)target_object)->ypos
|
- (*(byte *)((char *)target_object + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)target_object)->ypos
|
- (*(byte *)((char *)target_object + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)target_object)->ypos
)
...>
}

@field_22_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)target_object)->xpos
|
- (*(ushort *)((char *)target_object + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)target_object)->xpos
|
- (((ushort *)target_object)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target_object)->xpos
|
- (((ushort *)target_object)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target_object)->xpos
|
- (*(byte *)((char *)target_object + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)target_object)->xpos
|
- (*(byte *)((char *)target_object + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)target_object)->xpos
|
- *(byte *)((char *)target_object + 0x3) >> 5
+ ((uw_object_hdr_t *)target_object)->xpos
)
...>
}

@field_22_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target_object)->quality
|
- ((ushort *)target_object)[2] & 0x3f
+ ((uw_object_hdr_t *)target_object)->quality
|
- *(byte *)((char *)target_object + 0x4) & 0x3f
+ ((uw_object_hdr_t *)target_object)->quality
)
...>
}

@field_22_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_object)->next
|
- (*(ushort *)((char *)target_object + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_object)->next
|
- (((ushort *)target_object)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_object)->next
|
- (((ushort *)target_object)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_object)->next
)
...>
}

@field_22_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target_object)->owner
|
- ((ushort *)target_object)[3] & 0x3f
+ ((uw_object_hdr_t *)target_object)->owner
|
- *(byte *)((char *)target_object + 0x6) & 0x3f
+ ((uw_object_hdr_t *)target_object)->owner
)
...>
}

@field_22_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)target_object + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_object)->link
|
- (*(ushort *)((char *)target_object + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_object)->link
|
- (((ushort *)target_object)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target_object)->link
|
- (((ushort *)target_object)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target_object)->link
)
...>
}

@field_23_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- ((ushort *)npc)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- *(ushort *)npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- *(ushort *)(npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- CONCAT11(npc[1], *npc) & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- CONCAT11(npc[1], npc[0]) & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
)
...>
}

@field_23_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)((char *)npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)(npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)(npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (CONCAT11(npc[1], *npc) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (CONCAT11(npc[1], *npc) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (CONCAT11(npc[1], npc[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (CONCAT11(npc[1], npc[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)(npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)(npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc)->flags_res
)
...>
}

@field_23_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)((char *)npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)(npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)(npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (CONCAT11(npc[1], *npc) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (CONCAT11(npc[1], *npc) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (CONCAT11(npc[1], npc[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (CONCAT11(npc[1], npc[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)(npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)(npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc)->enchanted
)
...>
}

@field_23_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)((char *)npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)(npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)(npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (CONCAT11(npc[1], *npc) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (CONCAT11(npc[1], *npc) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (CONCAT11(npc[1], npc[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (CONCAT11(npc[1], npc[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)(npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)(npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc)->doordir
)
...>
}

@field_23_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)((char *)npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)(npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)(npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (CONCAT11(npc[1], *npc) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (CONCAT11(npc[1], *npc) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (CONCAT11(npc[1], npc[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (CONCAT11(npc[1], npc[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)(npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)(npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc)->invisible
)
...>
}

@field_23_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)((char *)npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)(npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)(npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (CONCAT11(npc[1], *npc) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (CONCAT11(npc[1], *npc) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (CONCAT11(npc[1], npc[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (CONCAT11(npc[1], npc[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(byte *)((char *)npc + 0x1) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)(npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)(npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(byte *)(npc + 0x1) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
)
...>
}

@field_23_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- ((ushort *)npc)[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(ushort *)(npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(byte *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- npc[2] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(byte *)(npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
)
...>
}

@field_23_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)((char *)npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)(npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)(npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
)
...>
}

@field_23_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)((char *)npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)(npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)(npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)(npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)(npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc)->ypos
)
...>
}

@field_23_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)((char *)npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)(npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)(npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(byte *)((char *)npc + 0x3) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)(npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)(npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(byte *)(npc + 0x3) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
)
...>
}

@field_23_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- ((ushort *)npc)[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(ushort *)(npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(byte *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- npc[4] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(byte *)(npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
)
...>
}

@field_23_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)((char *)npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)(npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)(npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
)
...>
}

@field_23_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- ((ushort *)npc)[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(ushort *)(npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(byte *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- npc[6] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(byte *)(npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
)
...>
}

@field_23_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)((char *)npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)(npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)(npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
)
...>
}

@field_24_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc_ptr)->object_id
|
- ((ushort *)npc_ptr)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc_ptr)->object_id
|
- *(ushort *)npc_ptr & 0x1ff
+ ((uw_object_hdr_t *)npc_ptr)->object_id
)
...>
}

@field_24_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (*(ushort *)((char *)npc_ptr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (((ushort *)npc_ptr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (((ushort *)npc_ptr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (*(ushort *)npc_ptr >> 9) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (*(ushort *)npc_ptr & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (*(byte *)((char *)npc_ptr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
|
- (*(byte *)((char *)npc_ptr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc_ptr)->flags_res
)
...>
}

@field_24_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (*(ushort *)((char *)npc_ptr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (((ushort *)npc_ptr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (((ushort *)npc_ptr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (*(ushort *)npc_ptr >> 12) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (*(ushort *)npc_ptr & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (*(byte *)((char *)npc_ptr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
|
- (*(byte *)((char *)npc_ptr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc_ptr)->enchanted
)
...>
}

@field_24_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (*(ushort *)((char *)npc_ptr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (((ushort *)npc_ptr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (((ushort *)npc_ptr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (*(ushort *)npc_ptr >> 13) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (*(ushort *)npc_ptr & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (*(byte *)((char *)npc_ptr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->doordir
|
- (*(byte *)((char *)npc_ptr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc_ptr)->doordir
)
...>
}

@field_24_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (*(ushort *)((char *)npc_ptr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (((ushort *)npc_ptr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (((ushort *)npc_ptr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (*(ushort *)npc_ptr >> 14) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (*(ushort *)npc_ptr & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (*(byte *)((char *)npc_ptr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->invisible
|
- (*(byte *)((char *)npc_ptr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc_ptr)->invisible
)
...>
}

@field_24_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (*(ushort *)((char *)npc_ptr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (((ushort *)npc_ptr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (((ushort *)npc_ptr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (*(ushort *)npc_ptr >> 15) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (*(ushort *)npc_ptr & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (*(byte *)((char *)npc_ptr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- (*(byte *)((char *)npc_ptr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
|
- *(byte *)((char *)npc_ptr + 0x1) >> 7
+ ((uw_object_hdr_t *)npc_ptr)->is_quant
)
...>
}

@field_24_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_ptr)->zpos
|
- ((ushort *)npc_ptr)[1] & 0x7f
+ ((uw_object_hdr_t *)npc_ptr)->zpos
|
- *(byte *)((char *)npc_ptr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc_ptr)->zpos
)
...>
}

@field_24_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->heading
|
- (*(ushort *)((char *)npc_ptr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_ptr)->heading
|
- (((ushort *)npc_ptr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->heading
|
- (((ushort *)npc_ptr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc_ptr)->heading
)
...>
}

@field_24_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->ypos
|
- (*(ushort *)((char *)npc_ptr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_ptr)->ypos
|
- (((ushort *)npc_ptr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->ypos
|
- (((ushort *)npc_ptr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc_ptr)->ypos
|
- (*(byte *)((char *)npc_ptr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->ypos
|
- (*(byte *)((char *)npc_ptr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc_ptr)->ypos
)
...>
}

@field_24_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->xpos
|
- (*(ushort *)((char *)npc_ptr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_ptr)->xpos
|
- (((ushort *)npc_ptr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->xpos
|
- (((ushort *)npc_ptr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc_ptr)->xpos
|
- (*(byte *)((char *)npc_ptr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc_ptr)->xpos
|
- (*(byte *)((char *)npc_ptr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc_ptr)->xpos
|
- *(byte *)((char *)npc_ptr + 0x3) >> 5
+ ((uw_object_hdr_t *)npc_ptr)->xpos
)
...>
}

@field_24_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_ptr)->quality
|
- ((ushort *)npc_ptr)[2] & 0x3f
+ ((uw_object_hdr_t *)npc_ptr)->quality
|
- *(byte *)((char *)npc_ptr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc_ptr)->quality
)
...>
}

@field_24_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_ptr)->next
|
- (*(ushort *)((char *)npc_ptr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_ptr)->next
|
- (((ushort *)npc_ptr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_ptr)->next
|
- (((ushort *)npc_ptr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_ptr)->next
)
...>
}

@field_24_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_ptr)->owner
|
- ((ushort *)npc_ptr)[3] & 0x3f
+ ((uw_object_hdr_t *)npc_ptr)->owner
|
- *(byte *)((char *)npc_ptr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc_ptr)->owner
)
...>
}

@field_24_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc_ptr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_ptr)->link
|
- (*(ushort *)((char *)npc_ptr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_ptr)->link
|
- (((ushort *)npc_ptr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc_ptr)->link
|
- (((ushort *)npc_ptr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc_ptr)->link
)
...>
}

@field_25_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)saved_npc)->object_id
|
- ((ushort *)saved_npc)[0] & 0x1ff
+ ((uw_object_hdr_t *)saved_npc)->object_id
|
- *(ushort *)saved_npc & 0x1ff
+ ((uw_object_hdr_t *)saved_npc)->object_id
)
...>
}

@field_25_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (*(ushort *)((char *)saved_npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (((ushort *)saved_npc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (((ushort *)saved_npc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (*(ushort *)saved_npc >> 9) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (*(ushort *)saved_npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (*(byte *)((char *)saved_npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->flags_res
|
- (*(byte *)((char *)saved_npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)saved_npc)->flags_res
)
...>
}

@field_25_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (*(ushort *)((char *)saved_npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (((ushort *)saved_npc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (((ushort *)saved_npc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (*(ushort *)saved_npc >> 12) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (*(ushort *)saved_npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (*(byte *)((char *)saved_npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->enchanted
|
- (*(byte *)((char *)saved_npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)saved_npc)->enchanted
)
...>
}

@field_25_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (*(ushort *)((char *)saved_npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (((ushort *)saved_npc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (((ushort *)saved_npc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (*(ushort *)saved_npc >> 13) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (*(ushort *)saved_npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (*(byte *)((char *)saved_npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->doordir
|
- (*(byte *)((char *)saved_npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)saved_npc)->doordir
)
...>
}

@field_25_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (*(ushort *)((char *)saved_npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (((ushort *)saved_npc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (((ushort *)saved_npc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (*(ushort *)saved_npc >> 14) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (*(ushort *)saved_npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (*(byte *)((char *)saved_npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->invisible
|
- (*(byte *)((char *)saved_npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)saved_npc)->invisible
)
...>
}

@field_25_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (*(ushort *)((char *)saved_npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (((ushort *)saved_npc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (((ushort *)saved_npc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (*(ushort *)saved_npc >> 15) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (*(ushort *)saved_npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (*(byte *)((char *)saved_npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- (*(byte *)((char *)saved_npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)saved_npc)->is_quant
|
- *(byte *)((char *)saved_npc + 0x1) >> 7
+ ((uw_object_hdr_t *)saved_npc)->is_quant
)
...>
}

@field_25_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)saved_npc)->zpos
|
- ((ushort *)saved_npc)[1] & 0x7f
+ ((uw_object_hdr_t *)saved_npc)->zpos
|
- *(byte *)((char *)saved_npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)saved_npc)->zpos
)
...>
}

@field_25_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->heading
|
- (*(ushort *)((char *)saved_npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)saved_npc)->heading
|
- (((ushort *)saved_npc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->heading
|
- (((ushort *)saved_npc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)saved_npc)->heading
)
...>
}

@field_25_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->ypos
|
- (*(ushort *)((char *)saved_npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)saved_npc)->ypos
|
- (((ushort *)saved_npc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->ypos
|
- (((ushort *)saved_npc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)saved_npc)->ypos
|
- (*(byte *)((char *)saved_npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->ypos
|
- (*(byte *)((char *)saved_npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)saved_npc)->ypos
)
...>
}

@field_25_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->xpos
|
- (*(ushort *)((char *)saved_npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)saved_npc)->xpos
|
- (((ushort *)saved_npc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->xpos
|
- (((ushort *)saved_npc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)saved_npc)->xpos
|
- (*(byte *)((char *)saved_npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)saved_npc)->xpos
|
- (*(byte *)((char *)saved_npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)saved_npc)->xpos
|
- *(byte *)((char *)saved_npc + 0x3) >> 5
+ ((uw_object_hdr_t *)saved_npc)->xpos
)
...>
}

@field_25_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)saved_npc)->quality
|
- ((ushort *)saved_npc)[2] & 0x3f
+ ((uw_object_hdr_t *)saved_npc)->quality
|
- *(byte *)((char *)saved_npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)saved_npc)->quality
)
...>
}

@field_25_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_npc)->next
|
- (*(ushort *)((char *)saved_npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_npc)->next
|
- (((ushort *)saved_npc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_npc)->next
|
- (((ushort *)saved_npc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_npc)->next
)
...>
}

@field_25_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)saved_npc)->owner
|
- ((ushort *)saved_npc)[3] & 0x3f
+ ((uw_object_hdr_t *)saved_npc)->owner
|
- *(byte *)((char *)saved_npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)saved_npc)->owner
)
...>
}

@field_25_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)saved_npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_npc)->link
|
- (*(ushort *)((char *)saved_npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_npc)->link
|
- (((ushort *)saved_npc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)saved_npc)->link
|
- (((ushort *)saved_npc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)saved_npc)->link
)
...>
}

@field_26_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
|
- puVar8[0] & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
|
- *puVar8 & 0x1ff
+ ((uw_object_hdr_t *)puVar8)->object_id
)
...>
}

@field_26_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- (puVar8[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (puVar8[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*puVar8 >> 9) & 0x7
+ ((uw_object_hdr_t *)puVar8)->flags_res
|
- (*puVar8 & 0xe00) >> 9
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

@field_26_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- (puVar8[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (puVar8[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*puVar8 >> 12) & 0x1
+ ((uw_object_hdr_t *)puVar8)->enchanted
|
- (*puVar8 & 0x1000) >> 12
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

@field_26_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- (puVar8[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (puVar8[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*puVar8 >> 13) & 0x1
+ ((uw_object_hdr_t *)puVar8)->doordir
|
- (*puVar8 & 0x2000) >> 13
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

@field_26_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- (puVar8[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (puVar8[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*puVar8 >> 14) & 0x1
+ ((uw_object_hdr_t *)puVar8)->invisible
|
- (*puVar8 & 0x4000) >> 14
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

@field_26_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- *(ushort *)((char *)puVar8 + 0x0) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (((ushort *)puVar8)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- ((ushort *)puVar8)[0] >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*(ushort *)puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *(ushort *)puVar8 >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (puVar8[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (puVar8[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- puVar8[0] >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*puVar8 >> 15) & 0x1
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- (*puVar8 & 0x8000) >> 15
+ ((uw_object_hdr_t *)puVar8)->is_quant
|
- *puVar8 >> 15
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

@field_26_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- puVar8[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- *(byte *)((char *)puVar8 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
|
- (byte)puVar8[1] & 0x7f
+ ((uw_object_hdr_t *)puVar8)->zpos
)
...>
}

@field_26_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
|
- (puVar8[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puVar8)->heading
|
- (puVar8[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puVar8)->heading
)
...>
}

@field_26_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- (puVar8[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puVar8)->ypos
|
- (puVar8[1] & 0x1c00) >> 10
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

@field_26_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- *(ushort *)((char *)puVar8 + 0x2) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (((ushort *)puVar8)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- ((ushort *)puVar8)[1] >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (puVar8[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- (puVar8[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puVar8)->xpos
|
- puVar8[1] >> 13
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

@field_26_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- puVar8[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- *(byte *)((char *)puVar8 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
|
- (byte)puVar8[2] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->quality
)
...>
}

@field_26_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- *(ushort *)((char *)puVar8 + 0x4) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (((ushort *)puVar8)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- ((ushort *)puVar8)[2] >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- (puVar8[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->next
|
- (puVar8[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->next
|
- puVar8[2] >> 6
+ ((uw_object_hdr_t *)puVar8)->next
)
...>
}

@field_26_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- puVar8[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- *(byte *)((char *)puVar8 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
|
- (byte)puVar8[3] & 0x3f
+ ((uw_object_hdr_t *)puVar8)->owner
)
...>
}

@field_26_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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
- *(ushort *)((char *)puVar8 + 0x6) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (((ushort *)puVar8)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- ((ushort *)puVar8)[3] >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- (puVar8[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puVar8)->link
|
- (puVar8[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puVar8)->link
|
- puVar8[3] >> 6
+ ((uw_object_hdr_t *)puVar8)->link
)
...>
}

@field_27_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- ((ushort *)npc)[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- *(ushort *)npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- npc[0] & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
|
- *npc & 0x1ff
+ ((uw_object_hdr_t *)npc)->object_id
)
...>
}

@field_27_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)((char *)npc + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (((ushort *)npc)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(ushort *)npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (npc[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (npc[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*npc >> 9) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*npc & 0xe00) >> 9
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)npc)->flags_res
|
- (*(byte *)((char *)npc + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)npc)->flags_res
)
...>
}

@field_27_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)((char *)npc + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (((ushort *)npc)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(ushort *)npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (npc[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (npc[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*npc >> 12) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*npc & 0x1000) >> 12
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)npc)->enchanted
|
- (*(byte *)((char *)npc + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)npc)->enchanted
)
...>
}

@field_27_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)((char *)npc + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (((ushort *)npc)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(ushort *)npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (npc[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (npc[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*npc >> 13) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*npc & 0x2000) >> 13
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)npc)->doordir
|
- (*(byte *)((char *)npc + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)npc)->doordir
)
...>
}

@field_27_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)((char *)npc + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (((ushort *)npc)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(ushort *)npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (npc[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (npc[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*npc >> 14) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*npc & 0x4000) >> 14
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)npc)->invisible
|
- (*(byte *)((char *)npc + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)npc)->invisible
)
...>
}

@field_27_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)((char *)npc + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(ushort *)((char *)npc + 0x0) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (((ushort *)npc)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- ((ushort *)npc)[0] >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(ushort *)npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(ushort *)npc >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (npc[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (npc[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- npc[0] >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*npc >> 15) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*npc & 0x8000) >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *npc >> 15
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)npc)->is_quant
|
- (*(byte *)((char *)npc + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
|
- *(byte *)((char *)npc + 0x1) >> 7
+ ((uw_object_hdr_t *)npc)->is_quant
)
...>
}

@field_27_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- ((ushort *)npc)[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- npc[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- *(byte *)((char *)npc + 0x2) & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
|
- (byte)npc[1] & 0x7f
+ ((uw_object_hdr_t *)npc)->zpos
)
...>
}

@field_27_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (*(ushort *)((char *)npc + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (((ushort *)npc)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
|
- (npc[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)npc)->heading
|
- (npc[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)npc)->heading
)
...>
}

@field_27_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(ushort *)((char *)npc + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (((ushort *)npc)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (npc[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (npc[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)npc)->ypos
|
- (*(byte *)((char *)npc + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)npc)->ypos
)
...>
}

@field_27_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(ushort *)((char *)npc + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(ushort *)((char *)npc + 0x2) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (((ushort *)npc)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- ((ushort *)npc)[1] >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (npc[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (npc[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- npc[1] >> 13
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)npc)->xpos
|
- (*(byte *)((char *)npc + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
|
- *(byte *)((char *)npc + 0x3) >> 5
+ ((uw_object_hdr_t *)npc)->xpos
)
...>
}

@field_27_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- ((ushort *)npc)[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- npc[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- *(byte *)((char *)npc + 0x4) & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
|
- (byte)npc[2] & 0x3f
+ ((uw_object_hdr_t *)npc)->quality
)
...>
}

@field_27_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (*(ushort *)((char *)npc + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- *(ushort *)((char *)npc + 0x4) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (((ushort *)npc)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- ((ushort *)npc)[2] >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- (npc[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->next
|
- (npc[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->next
|
- npc[2] >> 6
+ ((uw_object_hdr_t *)npc)->next
)
...>
}

@field_27_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- ((ushort *)npc)[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- npc[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- *(byte *)((char *)npc + 0x6) & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
|
- (byte)npc[3] & 0x3f
+ ((uw_object_hdr_t *)npc)->owner
)
...>
}

@field_27_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)npc + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (*(ushort *)((char *)npc + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- *(ushort *)((char *)npc + 0x6) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (((ushort *)npc)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- ((ushort *)npc)[3] >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- (npc[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)npc)->link
|
- (npc[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)npc)->link
|
- npc[3] >> 6
+ ((uw_object_hdr_t *)npc)->link
)
...>
}

@field_28_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)source)->object_id
|
- ((ushort *)source)[0] & 0x1ff
+ ((uw_object_hdr_t *)source)->object_id
|
- *(ushort *)source & 0x1ff
+ ((uw_object_hdr_t *)source)->object_id
|
- source[0] & 0x1ff
+ ((uw_object_hdr_t *)source)->object_id
|
- *source & 0x1ff
+ ((uw_object_hdr_t *)source)->object_id
)
...>
}

@field_28_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(ushort *)((char *)source + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (((ushort *)source)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (((ushort *)source)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(ushort *)source >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(ushort *)source & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (source[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (source[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*source >> 9) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*source & 0xe00) >> 9
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(byte *)((char *)source + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)source)->flags_res
|
- (*(byte *)((char *)source + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)source)->flags_res
)
...>
}

@field_28_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(ushort *)((char *)source + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (((ushort *)source)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (((ushort *)source)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(ushort *)source >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(ushort *)source & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (source[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (source[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*source >> 12) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*source & 0x1000) >> 12
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(byte *)((char *)source + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)source)->enchanted
|
- (*(byte *)((char *)source + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)source)->enchanted
)
...>
}

@field_28_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(ushort *)((char *)source + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (((ushort *)source)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (((ushort *)source)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(ushort *)source >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(ushort *)source & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (source[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (source[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (*source >> 13) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*source & 0x2000) >> 13
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(byte *)((char *)source + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)source)->doordir
|
- (*(byte *)((char *)source + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)source)->doordir
)
...>
}

@field_28_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(ushort *)((char *)source + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (((ushort *)source)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (((ushort *)source)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(ushort *)source >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(ushort *)source & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (source[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (source[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (*source >> 14) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*source & 0x4000) >> 14
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(byte *)((char *)source + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)source)->invisible
|
- (*(byte *)((char *)source + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)source)->invisible
)
...>
}

@field_28_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(ushort *)((char *)source + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- *(ushort *)((char *)source + 0x0) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (((ushort *)source)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (((ushort *)source)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- ((ushort *)source)[0] >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(ushort *)source >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(ushort *)source & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- *(ushort *)source >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (source[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (source[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- source[0] >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*source >> 15) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*source & 0x8000) >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- *source >> 15
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(byte *)((char *)source + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)source)->is_quant
|
- (*(byte *)((char *)source + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)source)->is_quant
|
- *(byte *)((char *)source + 0x1) >> 7
+ ((uw_object_hdr_t *)source)->is_quant
)
...>
}

@field_28_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x2) & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- ((ushort *)source)[1] & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- source[1] & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- *(byte *)((char *)source + 0x2) & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
|
- (byte)source[1] & 0x7f
+ ((uw_object_hdr_t *)source)->zpos
)
...>
}

@field_28_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)source)->heading
|
- (*(ushort *)((char *)source + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)source)->heading
|
- (((ushort *)source)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)source)->heading
|
- (((ushort *)source)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)source)->heading
|
- (source[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)source)->heading
|
- (source[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)source)->heading
)
...>
}

@field_28_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (*(ushort *)((char *)source + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source)->ypos
|
- (((ushort *)source)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (((ushort *)source)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source)->ypos
|
- (source[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (source[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)source)->ypos
|
- (*(byte *)((char *)source + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)source)->ypos
|
- (*(byte *)((char *)source + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)source)->ypos
)
...>
}

@field_28_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (*(ushort *)((char *)source + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- *(ushort *)((char *)source + 0x2) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- (((ushort *)source)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (((ushort *)source)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- ((ushort *)source)[1] >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- (source[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (source[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- source[1] >> 13
+ ((uw_object_hdr_t *)source)->xpos
|
- (*(byte *)((char *)source + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)source)->xpos
|
- (*(byte *)((char *)source + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)source)->xpos
|
- *(byte *)((char *)source + 0x3) >> 5
+ ((uw_object_hdr_t *)source)->xpos
)
...>
}

@field_28_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x4) & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- ((ushort *)source)[2] & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- source[2] & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- *(byte *)((char *)source + 0x4) & 0x3f
+ ((uw_object_hdr_t *)source)->quality
|
- (byte)source[2] & 0x3f
+ ((uw_object_hdr_t *)source)->quality
)
...>
}

@field_28_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->next
|
- (*(ushort *)((char *)source + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- *(ushort *)((char *)source + 0x4) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- (((ushort *)source)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->next
|
- (((ushort *)source)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- ((ushort *)source)[2] >> 6
+ ((uw_object_hdr_t *)source)->next
|
- (source[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->next
|
- (source[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->next
|
- source[2] >> 6
+ ((uw_object_hdr_t *)source)->next
)
...>
}

@field_28_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0x6) & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- ((ushort *)source)[3] & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- source[3] & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- *(byte *)((char *)source + 0x6) & 0x3f
+ ((uw_object_hdr_t *)source)->owner
|
- (byte)source[3] & 0x3f
+ ((uw_object_hdr_t *)source)->owner
)
...>
}

@field_28_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)source + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->link
|
- (*(ushort *)((char *)source + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- *(ushort *)((char *)source + 0x6) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- (((ushort *)source)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->link
|
- (((ushort *)source)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- ((ushort *)source)[3] >> 6
+ ((uw_object_hdr_t *)source)->link
|
- (source[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)source)->link
|
- (source[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)source)->link
|
- source[3] >> 6
+ ((uw_object_hdr_t *)source)->link
)
...>
}

@field_29_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar9)->object_id
|
- ((ushort *)iVar9)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar9)->object_id
|
- *(ushort *)iVar9 & 0x1ff
+ ((uw_object_hdr_t *)iVar9)->object_id
|
- *(ushort *)(iVar9 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar9)->object_id
|
- CONCAT11(iVar9[1], *iVar9) & 0x1ff
+ ((uw_object_hdr_t *)iVar9)->object_id
|
- CONCAT11(iVar9[1], iVar9[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar9)->object_id
)
...>
}

@field_29_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(ushort *)((char *)iVar9 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (((ushort *)iVar9)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (((ushort *)iVar9)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(ushort *)iVar9 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(ushort *)iVar9 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(ushort *)(iVar9 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(ushort *)(iVar9 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (CONCAT11(iVar9[1], *iVar9) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (CONCAT11(iVar9[1], *iVar9) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (CONCAT11(iVar9[1], iVar9[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (CONCAT11(iVar9[1], iVar9[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(byte *)((char *)iVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(byte *)((char *)iVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(byte *)(iVar9 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar9)->flags_res
|
- (*(byte *)(iVar9 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar9)->flags_res
)
...>
}

@field_29_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(ushort *)((char *)iVar9 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (((ushort *)iVar9)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (((ushort *)iVar9)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(ushort *)iVar9 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(ushort *)iVar9 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(ushort *)(iVar9 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(ushort *)(iVar9 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (CONCAT11(iVar9[1], *iVar9) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (CONCAT11(iVar9[1], *iVar9) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (CONCAT11(iVar9[1], iVar9[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (CONCAT11(iVar9[1], iVar9[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(byte *)((char *)iVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(byte *)((char *)iVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(byte *)(iVar9 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar9)->enchanted
|
- (*(byte *)(iVar9 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar9)->enchanted
)
...>
}

@field_29_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(ushort *)((char *)iVar9 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (((ushort *)iVar9)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (((ushort *)iVar9)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(ushort *)iVar9 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(ushort *)iVar9 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(ushort *)(iVar9 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(ushort *)(iVar9 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (CONCAT11(iVar9[1], *iVar9) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (CONCAT11(iVar9[1], *iVar9) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (CONCAT11(iVar9[1], iVar9[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (CONCAT11(iVar9[1], iVar9[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(byte *)((char *)iVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(byte *)((char *)iVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(byte *)(iVar9 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar9)->doordir
|
- (*(byte *)(iVar9 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar9)->doordir
)
...>
}

@field_29_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(ushort *)((char *)iVar9 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (((ushort *)iVar9)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (((ushort *)iVar9)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(ushort *)iVar9 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(ushort *)iVar9 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(ushort *)(iVar9 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(ushort *)(iVar9 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (CONCAT11(iVar9[1], *iVar9) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (CONCAT11(iVar9[1], *iVar9) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (CONCAT11(iVar9[1], iVar9[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (CONCAT11(iVar9[1], iVar9[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(byte *)((char *)iVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(byte *)((char *)iVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(byte *)(iVar9 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar9)->invisible
|
- (*(byte *)(iVar9 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar9)->invisible
)
...>
}

@field_29_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(ushort *)((char *)iVar9 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (((ushort *)iVar9)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (((ushort *)iVar9)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(ushort *)iVar9 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(ushort *)iVar9 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(ushort *)(iVar9 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(ushort *)(iVar9 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (CONCAT11(iVar9[1], *iVar9) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (CONCAT11(iVar9[1], *iVar9) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (CONCAT11(iVar9[1], iVar9[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (CONCAT11(iVar9[1], iVar9[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(byte *)((char *)iVar9 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(byte *)((char *)iVar9 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- *(byte *)((char *)iVar9 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(byte *)(iVar9 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- (*(byte *)(iVar9 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar9)->is_quant
|
- *(byte *)(iVar9 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar9)->is_quant
)
...>
}

@field_29_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar9)->zpos
|
- ((ushort *)iVar9)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar9)->zpos
|
- *(ushort *)(iVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar9)->zpos
|
- *(byte *)((char *)iVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar9)->zpos
|
- iVar9[2] & 0x7f
+ ((uw_object_hdr_t *)iVar9)->zpos
|
- *(byte *)(iVar9 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar9)->zpos
)
...>
}

@field_29_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar9)->heading
|
- (*(ushort *)((char *)iVar9 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar9)->heading
|
- (((ushort *)iVar9)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar9)->heading
|
- (((ushort *)iVar9)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar9)->heading
|
- (*(ushort *)(iVar9 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar9)->heading
|
- (*(ushort *)(iVar9 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar9)->heading
)
...>
}

@field_29_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(ushort *)((char *)iVar9 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (((ushort *)iVar9)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (((ushort *)iVar9)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(ushort *)(iVar9 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(ushort *)(iVar9 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(byte *)((char *)iVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(byte *)((char *)iVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(byte *)(iVar9 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar9)->ypos
|
- (*(byte *)(iVar9 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar9)->ypos
)
...>
}

@field_29_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(ushort *)((char *)iVar9 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (((ushort *)iVar9)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (((ushort *)iVar9)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(ushort *)(iVar9 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(ushort *)(iVar9 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(byte *)((char *)iVar9 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(byte *)((char *)iVar9 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- *(byte *)((char *)iVar9 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(byte *)(iVar9 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- (*(byte *)(iVar9 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar9)->xpos
|
- *(byte *)(iVar9 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar9)->xpos
)
...>
}

@field_29_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->quality
|
- ((ushort *)iVar9)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar9)->quality
|
- *(ushort *)(iVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->quality
|
- *(byte *)((char *)iVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->quality
|
- iVar9[4] & 0x3f
+ ((uw_object_hdr_t *)iVar9)->quality
|
- *(byte *)(iVar9 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->quality
)
...>
}

@field_29_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar9)->next
|
- (*(ushort *)((char *)iVar9 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar9)->next
|
- (((ushort *)iVar9)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar9)->next
|
- (((ushort *)iVar9)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar9)->next
|
- (*(ushort *)(iVar9 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar9)->next
|
- (*(ushort *)(iVar9 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar9)->next
)
...>
}

@field_29_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->owner
|
- ((ushort *)iVar9)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar9)->owner
|
- *(ushort *)(iVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->owner
|
- *(byte *)((char *)iVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->owner
|
- iVar9[6] & 0x3f
+ ((uw_object_hdr_t *)iVar9)->owner
|
- *(byte *)(iVar9 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar9)->owner
)
...>
}

@field_29_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar9 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar9)->link
|
- (*(ushort *)((char *)iVar9 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar9)->link
|
- (((ushort *)iVar9)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar9)->link
|
- (((ushort *)iVar9)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar9)->link
|
- (*(ushort *)(iVar9 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar9)->link
|
- (*(ushort *)(iVar9 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar9)->link
)
...>
}

@field_30_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
|
- *(ushort *)(iVar2 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- CONCAT11(iVar2[1], *iVar2) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
|
- CONCAT11(iVar2[1], iVar2[0]) & 0x1ff
+ ((uw_object_hdr_t *)iVar2)->object_id
)
...>
}

@field_30_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(ushort *)(iVar2 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (CONCAT11(iVar2[1], *iVar2) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (CONCAT11(iVar2[1], *iVar2) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (CONCAT11(iVar2[1], iVar2[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (CONCAT11(iVar2[1], iVar2[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)((char *)iVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)(iVar2 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2)->flags_res
|
- (*(byte *)(iVar2 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2)->flags_res
)
...>
}

@field_30_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(ushort *)(iVar2 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (CONCAT11(iVar2[1], *iVar2) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (CONCAT11(iVar2[1], *iVar2) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (CONCAT11(iVar2[1], iVar2[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (CONCAT11(iVar2[1], iVar2[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)(iVar2 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2)->enchanted
|
- (*(byte *)(iVar2 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2)->enchanted
)
...>
}

@field_30_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(ushort *)(iVar2 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (CONCAT11(iVar2[1], *iVar2) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (CONCAT11(iVar2[1], *iVar2) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (CONCAT11(iVar2[1], iVar2[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (CONCAT11(iVar2[1], iVar2[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)(iVar2 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2)->doordir
|
- (*(byte *)(iVar2 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2)->doordir
)
...>
}

@field_30_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(ushort *)(iVar2 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (CONCAT11(iVar2[1], *iVar2) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (CONCAT11(iVar2[1], *iVar2) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (CONCAT11(iVar2[1], iVar2[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (CONCAT11(iVar2[1], iVar2[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)((char *)iVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)(iVar2 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2)->invisible
|
- (*(byte *)(iVar2 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2)->invisible
)
...>
}

@field_30_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(ushort *)(iVar2 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (CONCAT11(iVar2[1], *iVar2) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (CONCAT11(iVar2[1], *iVar2) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (CONCAT11(iVar2[1], iVar2[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (CONCAT11(iVar2[1], iVar2[0]) & 0x8000) >> 15
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
|
- (*(byte *)(iVar2 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- (*(byte *)(iVar2 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
|
- *(byte *)(iVar2 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar2)->is_quant
)
...>
}

@field_30_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- *(ushort *)(iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)((char *)iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- iVar2[2] & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
|
- *(byte *)(iVar2 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2)->zpos
)
...>
}

@field_30_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
|
- (*(ushort *)(iVar2 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2)->heading
|
- (*(ushort *)(iVar2 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2)->heading
)
...>
}

@field_30_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(ushort *)(iVar2 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)((char *)iVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)(iVar2 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2)->ypos
|
- (*(byte *)(iVar2 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2)->ypos
)
...>
}

@field_30_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- (*(ushort *)(iVar2 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(ushort *)(iVar2 + 0x2) & 0xe000) >> 13
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
|
- (*(byte *)(iVar2 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- (*(byte *)(iVar2 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
|
- *(byte *)(iVar2 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar2)->xpos
)
...>
}

@field_30_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- *(ushort *)(iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)((char *)iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- iVar2[4] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
|
- *(byte *)(iVar2 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->quality
)
...>
}

@field_30_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
|
- (*(ushort *)(iVar2 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->next
|
- (*(ushort *)(iVar2 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->next
)
...>
}

@field_30_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
- *(ushort *)(iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)((char *)iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- iVar2[6] & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
|
- *(byte *)(iVar2 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2)->owner
)
...>
}

@field_30_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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
|
- (*(ushort *)(iVar2 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2)->link
|
- (*(ushort *)(iVar2 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2)->link
)
...>
}

@npc_tick_field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->object_id
|
- ((ushort *)player_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->object_id
|
- *(ushort *)player_rec & 0x1ff
+ ((uw_object_hdr_t *)player_rec)->object_id
)
...>
}

@npc_tick_field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)((char *)player_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (((ushort *)player_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (((ushort *)player_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)player_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(ushort *)player_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(byte *)((char *)player_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)player_rec)->flags_res
|
- (*(byte *)((char *)player_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)player_rec)->flags_res
)
...>
}

@npc_tick_field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (((ushort *)player_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (((ushort *)player_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)player_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(ushort *)player_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(byte *)((char *)player_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)player_rec)->enchanted
|
- (*(byte *)((char *)player_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)player_rec)->enchanted
)
...>
}

@npc_tick_field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (((ushort *)player_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (((ushort *)player_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)player_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(ushort *)player_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(byte *)((char *)player_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)player_rec)->doordir
|
- (*(byte *)((char *)player_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)player_rec)->doordir
)
...>
}

@npc_tick_field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (((ushort *)player_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (((ushort *)player_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)player_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(ushort *)player_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(byte *)((char *)player_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)player_rec)->invisible
|
- (*(byte *)((char *)player_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)player_rec)->invisible
)
...>
}

@npc_tick_field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)((char *)player_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (((ushort *)player_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (((ushort *)player_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)player_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(ushort *)player_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(byte *)((char *)player_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- (*(byte *)((char *)player_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)player_rec)->is_quant
|
- *(byte *)((char *)player_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)player_rec)->is_quant
)
...>
}

@npc_tick_field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
|
- ((ushort *)player_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
|
- *(byte *)((char *)player_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)player_rec)->zpos
)
...>
}

@npc_tick_field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (*(ushort *)((char *)player_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (((ushort *)player_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)player_rec)->heading
|
- (((ushort *)player_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)player_rec)->heading
)
...>
}

@npc_tick_field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(ushort *)((char *)player_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (((ushort *)player_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (((ushort *)player_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(byte *)((char *)player_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)player_rec)->ypos
|
- (*(byte *)((char *)player_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)player_rec)->ypos
)
...>
}

@npc_tick_field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(ushort *)((char *)player_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (((ushort *)player_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (((ushort *)player_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(byte *)((char *)player_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- (*(byte *)((char *)player_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)player_rec)->xpos
|
- *(byte *)((char *)player_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)player_rec)->xpos
)
...>
}

@npc_tick_field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
|
- ((ushort *)player_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
|
- *(byte *)((char *)player_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->quality
)
...>
}

@npc_tick_field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->next
|
- (*(ushort *)((char *)player_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->next
|
- (((ushort *)player_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->next
|
- (((ushort *)player_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->next
)
...>
}

@npc_tick_field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
|
- ((ushort *)player_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
|
- *(byte *)((char *)player_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)player_rec)->owner
)
...>
}

@npc_tick_field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)player_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->link
|
- (*(ushort *)((char *)player_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->link
|
- (((ushort *)player_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)player_rec)->link
|
- (((ushort *)player_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)player_rec)->link
)
...>
}

@npc_tick_field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

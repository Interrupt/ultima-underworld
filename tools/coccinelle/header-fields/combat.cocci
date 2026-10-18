@field_0_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar5_rec)->object_id
|
- ((ushort *)iVar5_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar5_rec)->object_id
|
- *(ushort *)iVar5_rec & 0x1ff
+ ((uw_object_hdr_t *)iVar5_rec)->object_id
)
...>
}

@field_0_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (*(ushort *)((char *)iVar5_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (((ushort *)iVar5_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (((ushort *)iVar5_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (*(ushort *)iVar5_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (*(ushort *)iVar5_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (*(byte *)((char *)iVar5_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
|
- (*(byte *)((char *)iVar5_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar5_rec)->flags_res
)
...>
}

@field_0_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (*(ushort *)((char *)iVar5_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (((ushort *)iVar5_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (((ushort *)iVar5_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (*(ushort *)iVar5_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (*(ushort *)iVar5_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (*(byte *)((char *)iVar5_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
|
- (*(byte *)((char *)iVar5_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar5_rec)->enchanted
)
...>
}

@field_0_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (*(ushort *)((char *)iVar5_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (((ushort *)iVar5_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (((ushort *)iVar5_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (*(ushort *)iVar5_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (*(ushort *)iVar5_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (*(byte *)((char *)iVar5_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
|
- (*(byte *)((char *)iVar5_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar5_rec)->doordir
)
...>
}

@field_0_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (*(ushort *)((char *)iVar5_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (((ushort *)iVar5_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (((ushort *)iVar5_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (*(ushort *)iVar5_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (*(ushort *)iVar5_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (*(byte *)((char *)iVar5_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
|
- (*(byte *)((char *)iVar5_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar5_rec)->invisible
)
...>
}

@field_0_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (*(ushort *)((char *)iVar5_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (((ushort *)iVar5_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (((ushort *)iVar5_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (*(ushort *)iVar5_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (*(ushort *)iVar5_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (*(byte *)((char *)iVar5_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- (*(byte *)((char *)iVar5_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
|
- *(byte *)((char *)iVar5_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar5_rec)->is_quant
)
...>
}

@field_0_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5_rec)->zpos
|
- ((ushort *)iVar5_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar5_rec)->zpos
|
- *(byte *)((char *)iVar5_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar5_rec)->zpos
)
...>
}

@field_0_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->heading
|
- (*(ushort *)((char *)iVar5_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5_rec)->heading
|
- (((ushort *)iVar5_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->heading
|
- (((ushort *)iVar5_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar5_rec)->heading
)
...>
}

@field_0_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->ypos
|
- (*(ushort *)((char *)iVar5_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5_rec)->ypos
|
- (((ushort *)iVar5_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->ypos
|
- (((ushort *)iVar5_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar5_rec)->ypos
|
- (*(byte *)((char *)iVar5_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->ypos
|
- (*(byte *)((char *)iVar5_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar5_rec)->ypos
)
...>
}

@field_0_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
|
- (*(ushort *)((char *)iVar5_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
|
- (((ushort *)iVar5_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
|
- (((ushort *)iVar5_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
|
- (*(byte *)((char *)iVar5_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
|
- (*(byte *)((char *)iVar5_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
|
- *(byte *)((char *)iVar5_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar5_rec)->xpos
)
...>
}

@field_0_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5_rec)->quality
|
- ((ushort *)iVar5_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar5_rec)->quality
|
- *(byte *)((char *)iVar5_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar5_rec)->quality
)
...>
}

@field_0_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5_rec)->next
|
- (*(ushort *)((char *)iVar5_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5_rec)->next
|
- (((ushort *)iVar5_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5_rec)->next
|
- (((ushort *)iVar5_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5_rec)->next
)
...>
}

@field_0_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5_rec)->owner
|
- ((ushort *)iVar5_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar5_rec)->owner
|
- *(byte *)((char *)iVar5_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar5_rec)->owner
)
...>
}

@field_0_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar5_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5_rec)->link
|
- (*(ushort *)((char *)iVar5_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5_rec)->link
|
- (((ushort *)iVar5_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar5_rec)->link
|
- (((ushort *)iVar5_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar5_rec)->link
)
...>
}

@field_1_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar6_rec)->object_id
|
- ((ushort *)iVar6_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar6_rec)->object_id
|
- *(ushort *)iVar6_rec & 0x1ff
+ ((uw_object_hdr_t *)iVar6_rec)->object_id
)
...>
}

@field_1_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (*(ushort *)((char *)iVar6_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (((ushort *)iVar6_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (((ushort *)iVar6_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (*(ushort *)iVar6_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (*(ushort *)iVar6_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (*(byte *)((char *)iVar6_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
|
- (*(byte *)((char *)iVar6_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar6_rec)->flags_res
)
...>
}

@field_1_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (*(ushort *)((char *)iVar6_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (((ushort *)iVar6_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (((ushort *)iVar6_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (*(ushort *)iVar6_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (*(ushort *)iVar6_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (*(byte *)((char *)iVar6_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
|
- (*(byte *)((char *)iVar6_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar6_rec)->enchanted
)
...>
}

@field_1_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (*(ushort *)((char *)iVar6_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (((ushort *)iVar6_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (((ushort *)iVar6_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (*(ushort *)iVar6_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (*(ushort *)iVar6_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (*(byte *)((char *)iVar6_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
|
- (*(byte *)((char *)iVar6_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar6_rec)->doordir
)
...>
}

@field_1_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (*(ushort *)((char *)iVar6_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (((ushort *)iVar6_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (((ushort *)iVar6_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (*(ushort *)iVar6_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (*(ushort *)iVar6_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (*(byte *)((char *)iVar6_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
|
- (*(byte *)((char *)iVar6_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar6_rec)->invisible
)
...>
}

@field_1_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (*(ushort *)((char *)iVar6_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (((ushort *)iVar6_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (((ushort *)iVar6_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (*(ushort *)iVar6_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (*(ushort *)iVar6_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (*(byte *)((char *)iVar6_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- (*(byte *)((char *)iVar6_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
|
- *(byte *)((char *)iVar6_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar6_rec)->is_quant
)
...>
}

@field_1_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6_rec)->zpos
|
- ((ushort *)iVar6_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar6_rec)->zpos
|
- *(byte *)((char *)iVar6_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar6_rec)->zpos
)
...>
}

@field_1_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->heading
|
- (*(ushort *)((char *)iVar6_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6_rec)->heading
|
- (((ushort *)iVar6_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->heading
|
- (((ushort *)iVar6_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar6_rec)->heading
)
...>
}

@field_1_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->ypos
|
- (*(ushort *)((char *)iVar6_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6_rec)->ypos
|
- (((ushort *)iVar6_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->ypos
|
- (((ushort *)iVar6_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar6_rec)->ypos
|
- (*(byte *)((char *)iVar6_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->ypos
|
- (*(byte *)((char *)iVar6_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar6_rec)->ypos
)
...>
}

@field_1_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
|
- (*(ushort *)((char *)iVar6_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
|
- (((ushort *)iVar6_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
|
- (((ushort *)iVar6_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
|
- (*(byte *)((char *)iVar6_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
|
- (*(byte *)((char *)iVar6_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
|
- *(byte *)((char *)iVar6_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar6_rec)->xpos
)
...>
}

@field_1_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6_rec)->quality
|
- ((ushort *)iVar6_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar6_rec)->quality
|
- *(byte *)((char *)iVar6_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar6_rec)->quality
)
...>
}

@field_1_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6_rec)->next
|
- (*(ushort *)((char *)iVar6_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6_rec)->next
|
- (((ushort *)iVar6_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6_rec)->next
|
- (((ushort *)iVar6_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6_rec)->next
)
...>
}

@field_1_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6_rec)->owner
|
- ((ushort *)iVar6_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar6_rec)->owner
|
- *(byte *)((char *)iVar6_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar6_rec)->owner
)
...>
}

@field_1_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar6_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6_rec)->link
|
- (*(ushort *)((char *)iVar6_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6_rec)->link
|
- (((ushort *)iVar6_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar6_rec)->link
|
- (((ushort *)iVar6_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar6_rec)->link
)
...>
}

@field_2_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_2_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@field_3_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar2_rec)->object_id
|
- ((ushort *)iVar2_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar2_rec)->object_id
|
- *(ushort *)iVar2_rec & 0x1ff
+ ((uw_object_hdr_t *)iVar2_rec)->object_id
)
...>
}

@field_3_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (*(ushort *)((char *)iVar2_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (((ushort *)iVar2_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (((ushort *)iVar2_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (*(ushort *)iVar2_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (*(ushort *)iVar2_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (*(byte *)((char *)iVar2_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
|
- (*(byte *)((char *)iVar2_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar2_rec)->flags_res
)
...>
}

@field_3_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (*(ushort *)((char *)iVar2_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (((ushort *)iVar2_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (((ushort *)iVar2_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (*(ushort *)iVar2_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (*(ushort *)iVar2_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (*(byte *)((char *)iVar2_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
|
- (*(byte *)((char *)iVar2_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar2_rec)->enchanted
)
...>
}

@field_3_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (*(ushort *)((char *)iVar2_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (((ushort *)iVar2_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (((ushort *)iVar2_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (*(ushort *)iVar2_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (*(ushort *)iVar2_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (*(byte *)((char *)iVar2_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
|
- (*(byte *)((char *)iVar2_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar2_rec)->doordir
)
...>
}

@field_3_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (*(ushort *)((char *)iVar2_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (((ushort *)iVar2_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (((ushort *)iVar2_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (*(ushort *)iVar2_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (*(ushort *)iVar2_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (*(byte *)((char *)iVar2_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
|
- (*(byte *)((char *)iVar2_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar2_rec)->invisible
)
...>
}

@field_3_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (*(ushort *)((char *)iVar2_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (((ushort *)iVar2_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (((ushort *)iVar2_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (*(ushort *)iVar2_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (*(ushort *)iVar2_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (*(byte *)((char *)iVar2_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- (*(byte *)((char *)iVar2_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
|
- *(byte *)((char *)iVar2_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar2_rec)->is_quant
)
...>
}

@field_3_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2_rec)->zpos
|
- ((ushort *)iVar2_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar2_rec)->zpos
|
- *(byte *)((char *)iVar2_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar2_rec)->zpos
)
...>
}

@field_3_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->heading
|
- (*(ushort *)((char *)iVar2_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2_rec)->heading
|
- (((ushort *)iVar2_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->heading
|
- (((ushort *)iVar2_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar2_rec)->heading
)
...>
}

@field_3_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->ypos
|
- (*(ushort *)((char *)iVar2_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2_rec)->ypos
|
- (((ushort *)iVar2_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->ypos
|
- (((ushort *)iVar2_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar2_rec)->ypos
|
- (*(byte *)((char *)iVar2_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->ypos
|
- (*(byte *)((char *)iVar2_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar2_rec)->ypos
)
...>
}

@field_3_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
|
- (*(ushort *)((char *)iVar2_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
|
- (((ushort *)iVar2_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
|
- (((ushort *)iVar2_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
|
- (*(byte *)((char *)iVar2_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
|
- (*(byte *)((char *)iVar2_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
|
- *(byte *)((char *)iVar2_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar2_rec)->xpos
)
...>
}

@field_3_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2_rec)->quality
|
- ((ushort *)iVar2_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar2_rec)->quality
|
- *(byte *)((char *)iVar2_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar2_rec)->quality
)
...>
}

@field_3_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2_rec)->next
|
- (*(ushort *)((char *)iVar2_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2_rec)->next
|
- (((ushort *)iVar2_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2_rec)->next
|
- (((ushort *)iVar2_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2_rec)->next
)
...>
}

@field_3_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2_rec)->owner
|
- ((ushort *)iVar2_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar2_rec)->owner
|
- *(byte *)((char *)iVar2_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar2_rec)->owner
)
...>
}

@field_3_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar2_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2_rec)->link
|
- (*(ushort *)((char *)iVar2_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2_rec)->link
|
- (((ushort *)iVar2_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar2_rec)->link
|
- (((ushort *)iVar2_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar2_rec)->link
)
...>
}

@field_4_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar7_rec)->object_id
|
- ((ushort *)iVar7_rec)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar7_rec)->object_id
|
- *(ushort *)iVar7_rec & 0x1ff
+ ((uw_object_hdr_t *)iVar7_rec)->object_id
)
...>
}

@field_4_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (*(ushort *)((char *)iVar7_rec + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (((ushort *)iVar7_rec)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (((ushort *)iVar7_rec)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (*(ushort *)iVar7_rec >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (*(ushort *)iVar7_rec & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (*(byte *)((char *)iVar7_rec + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
|
- (*(byte *)((char *)iVar7_rec + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar7_rec)->flags_res
)
...>
}

@field_4_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (*(ushort *)((char *)iVar7_rec + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (((ushort *)iVar7_rec)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (((ushort *)iVar7_rec)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (*(ushort *)iVar7_rec >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (*(ushort *)iVar7_rec & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (*(byte *)((char *)iVar7_rec + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
|
- (*(byte *)((char *)iVar7_rec + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar7_rec)->enchanted
)
...>
}

@field_4_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (*(ushort *)((char *)iVar7_rec + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (((ushort *)iVar7_rec)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (((ushort *)iVar7_rec)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (*(ushort *)iVar7_rec >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (*(ushort *)iVar7_rec & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (*(byte *)((char *)iVar7_rec + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
|
- (*(byte *)((char *)iVar7_rec + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar7_rec)->doordir
)
...>
}

@field_4_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (*(ushort *)((char *)iVar7_rec + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (((ushort *)iVar7_rec)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (((ushort *)iVar7_rec)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (*(ushort *)iVar7_rec >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (*(ushort *)iVar7_rec & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (*(byte *)((char *)iVar7_rec + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
|
- (*(byte *)((char *)iVar7_rec + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar7_rec)->invisible
)
...>
}

@field_4_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (*(ushort *)((char *)iVar7_rec + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (((ushort *)iVar7_rec)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (((ushort *)iVar7_rec)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (*(ushort *)iVar7_rec >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (*(ushort *)iVar7_rec & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (*(byte *)((char *)iVar7_rec + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- (*(byte *)((char *)iVar7_rec + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
|
- *(byte *)((char *)iVar7_rec + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar7_rec)->is_quant
)
...>
}

@field_4_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar7_rec)->zpos
|
- ((ushort *)iVar7_rec)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar7_rec)->zpos
|
- *(byte *)((char *)iVar7_rec + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar7_rec)->zpos
)
...>
}

@field_4_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->heading
|
- (*(ushort *)((char *)iVar7_rec + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar7_rec)->heading
|
- (((ushort *)iVar7_rec)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->heading
|
- (((ushort *)iVar7_rec)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar7_rec)->heading
)
...>
}

@field_4_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->ypos
|
- (*(ushort *)((char *)iVar7_rec + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar7_rec)->ypos
|
- (((ushort *)iVar7_rec)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->ypos
|
- (((ushort *)iVar7_rec)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar7_rec)->ypos
|
- (*(byte *)((char *)iVar7_rec + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->ypos
|
- (*(byte *)((char *)iVar7_rec + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar7_rec)->ypos
)
...>
}

@field_4_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
|
- (*(ushort *)((char *)iVar7_rec + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
|
- (((ushort *)iVar7_rec)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
|
- (((ushort *)iVar7_rec)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
|
- (*(byte *)((char *)iVar7_rec + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
|
- (*(byte *)((char *)iVar7_rec + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
|
- *(byte *)((char *)iVar7_rec + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar7_rec)->xpos
)
...>
}

@field_4_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar7_rec)->quality
|
- ((ushort *)iVar7_rec)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar7_rec)->quality
|
- *(byte *)((char *)iVar7_rec + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar7_rec)->quality
)
...>
}

@field_4_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7_rec)->next
|
- (*(ushort *)((char *)iVar7_rec + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7_rec)->next
|
- (((ushort *)iVar7_rec)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7_rec)->next
|
- (((ushort *)iVar7_rec)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7_rec)->next
)
...>
}

@field_4_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar7_rec)->owner
|
- ((ushort *)iVar7_rec)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar7_rec)->owner
|
- *(byte *)((char *)iVar7_rec + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar7_rec)->owner
)
...>
}

@field_4_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7_rec + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7_rec)->link
|
- (*(ushort *)((char *)iVar7_rec + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7_rec)->link
|
- (((ushort *)iVar7_rec)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7_rec)->link
|
- (((ushort *)iVar7_rec)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7_rec)->link
)
...>
}

@field_5_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_5_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@field_6_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_6_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@field_7_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)iVar7)->object_id
|
- ((ushort *)iVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)iVar7)->object_id
|
- *(ushort *)iVar7 & 0x1ff
+ ((uw_object_hdr_t *)iVar7)->object_id
)
...>
}

@field_7_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (*(ushort *)((char *)iVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (((ushort *)iVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (((ushort *)iVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (*(ushort *)iVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (*(ushort *)iVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (*(byte *)((char *)iVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)iVar7)->flags_res
|
- (*(byte *)((char *)iVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)iVar7)->flags_res
)
...>
}

@field_7_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (*(ushort *)((char *)iVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (((ushort *)iVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (((ushort *)iVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (*(ushort *)iVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (*(ushort *)iVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (*(byte *)((char *)iVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)iVar7)->enchanted
|
- (*(byte *)((char *)iVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)iVar7)->enchanted
)
...>
}

@field_7_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (*(ushort *)((char *)iVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (((ushort *)iVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (((ushort *)iVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (*(ushort *)iVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (*(ushort *)iVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (*(byte *)((char *)iVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)iVar7)->doordir
|
- (*(byte *)((char *)iVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)iVar7)->doordir
)
...>
}

@field_7_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (*(ushort *)((char *)iVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (((ushort *)iVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (((ushort *)iVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (*(ushort *)iVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (*(ushort *)iVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (*(byte *)((char *)iVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)iVar7)->invisible
|
- (*(byte *)((char *)iVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)iVar7)->invisible
)
...>
}

@field_7_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (*(ushort *)((char *)iVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (((ushort *)iVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (((ushort *)iVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (*(ushort *)iVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (*(ushort *)iVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (*(byte *)((char *)iVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- (*(byte *)((char *)iVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)iVar7)->is_quant
|
- *(byte *)((char *)iVar7 + 0x1) >> 7
+ ((uw_object_hdr_t *)iVar7)->is_quant
)
...>
}

@field_7_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar7)->zpos
|
- ((ushort *)iVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)iVar7)->zpos
|
- *(byte *)((char *)iVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)iVar7)->zpos
)
...>
}

@field_7_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar7)->heading
|
- (*(ushort *)((char *)iVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar7)->heading
|
- (((ushort *)iVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)iVar7)->heading
|
- (((ushort *)iVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)iVar7)->heading
)
...>
}

@field_7_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar7)->ypos
|
- (*(ushort *)((char *)iVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar7)->ypos
|
- (((ushort *)iVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)iVar7)->ypos
|
- (((ushort *)iVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)iVar7)->ypos
|
- (*(byte *)((char *)iVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)iVar7)->ypos
|
- (*(byte *)((char *)iVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)iVar7)->ypos
)
...>
}

@field_7_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar7)->xpos
|
- (*(ushort *)((char *)iVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar7)->xpos
|
- (((ushort *)iVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)iVar7)->xpos
|
- (((ushort *)iVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)iVar7)->xpos
|
- (*(byte *)((char *)iVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)iVar7)->xpos
|
- (*(byte *)((char *)iVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)iVar7)->xpos
|
- *(byte *)((char *)iVar7 + 0x3) >> 5
+ ((uw_object_hdr_t *)iVar7)->xpos
)
...>
}

@field_7_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar7)->quality
|
- ((ushort *)iVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)iVar7)->quality
|
- *(byte *)((char *)iVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)iVar7)->quality
)
...>
}

@field_7_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7)->next
|
- (*(ushort *)((char *)iVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7)->next
|
- (((ushort *)iVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7)->next
|
- (((ushort *)iVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7)->next
)
...>
}

@field_7_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar7)->owner
|
- ((ushort *)iVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)iVar7)->owner
|
- *(byte *)((char *)iVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)iVar7)->owner
)
...>
}

@field_7_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)iVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7)->link
|
- (*(ushort *)((char *)iVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7)->link
|
- (((ushort *)iVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)iVar7)->link
|
- (((ushort *)iVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)iVar7)->link
)
...>
}

@field_8_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_8_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@field_9_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- ((ushort *)pbVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- *(ushort *)pbVar5 & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- *(ushort *)(pbVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- CONCAT11(pbVar5[1], *pbVar5) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
|
- CONCAT11(pbVar5[1], pbVar5[0]) & 0x1ff
+ ((uw_object_hdr_t *)pbVar5)->object_id
)
...>
}

@field_9_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (((ushort *)pbVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (((ushort *)pbVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)pbVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)pbVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)(pbVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(ushort *)(pbVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)(pbVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->flags_res
|
- (*(byte *)(pbVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pbVar5)->flags_res
)
...>
}

@field_9_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (((ushort *)pbVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (((ushort *)pbVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)pbVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)pbVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)(pbVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(ushort *)(pbVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)(pbVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->enchanted
|
- (*(byte *)(pbVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pbVar5)->enchanted
)
...>
}

@field_9_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (((ushort *)pbVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (((ushort *)pbVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)pbVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)pbVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)(pbVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(ushort *)(pbVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)(pbVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->doordir
|
- (*(byte *)(pbVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pbVar5)->doordir
)
...>
}

@field_9_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (((ushort *)pbVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (((ushort *)pbVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)pbVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)pbVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)(pbVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(ushort *)(pbVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)(pbVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->invisible
|
- (*(byte *)(pbVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pbVar5)->invisible
)
...>
}

@field_9_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)((char *)pbVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (((ushort *)pbVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (((ushort *)pbVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)pbVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)pbVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)(pbVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(ushort *)(pbVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], *pbVar5) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], *pbVar5) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], pbVar5[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (CONCAT11(pbVar5[1], pbVar5[0]) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)((char *)pbVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)((char *)pbVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- *(byte *)((char *)pbVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)(pbVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- (*(byte *)(pbVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
|
- *(byte *)(pbVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)pbVar5)->is_quant
)
...>
}

@field_9_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- ((ushort *)pbVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- *(ushort *)(pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- *(byte *)((char *)pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- pbVar5[2] & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
|
- *(byte *)(pbVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pbVar5)->zpos
)
...>
}

@field_9_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (*(ushort *)((char *)pbVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (((ushort *)pbVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (((ushort *)pbVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (*(ushort *)(pbVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->heading
|
- (*(ushort *)(pbVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pbVar5)->heading
)
...>
}

@field_9_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(ushort *)((char *)pbVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (((ushort *)pbVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (((ushort *)pbVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(ushort *)(pbVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(ushort *)(pbVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)((char *)pbVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)((char *)pbVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)(pbVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->ypos
|
- (*(byte *)(pbVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pbVar5)->ypos
)
...>
}

@field_9_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(ushort *)((char *)pbVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (((ushort *)pbVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (((ushort *)pbVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(ushort *)(pbVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(ushort *)(pbVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)((char *)pbVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)((char *)pbVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- *(byte *)((char *)pbVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)(pbVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- (*(byte *)(pbVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
|
- *(byte *)(pbVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)pbVar5)->xpos
)
...>
}

@field_9_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- ((ushort *)pbVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- *(ushort *)(pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- *(byte *)((char *)pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- pbVar5[4] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
|
- *(byte *)(pbVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->quality
)
...>
}

@field_9_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (*(ushort *)((char *)pbVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (((ushort *)pbVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (((ushort *)pbVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (*(ushort *)(pbVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->next
|
- (*(ushort *)(pbVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->next
)
...>
}

@field_9_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- ((ushort *)pbVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- *(ushort *)(pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- *(byte *)((char *)pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- pbVar5[6] & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
|
- *(byte *)(pbVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pbVar5)->owner
)
...>
}

@field_9_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)pbVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (*(ushort *)((char *)pbVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (((ushort *)pbVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (((ushort *)pbVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (*(ushort *)(pbVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pbVar5)->link
|
- (*(ushort *)(pbVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pbVar5)->link
)
...>
}

@field_10_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar7)->object_id
|
- ((ushort *)uVar7)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar7)->object_id
|
- *(ushort *)uVar7 & 0x1ff
+ ((uw_object_hdr_t *)uVar7)->object_id
|
- uVar7[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar7)->object_id
|
- *uVar7 & 0x1ff
+ ((uw_object_hdr_t *)uVar7)->object_id
)
...>
}

@field_10_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*(ushort *)((char *)uVar7 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (((ushort *)uVar7)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (((ushort *)uVar7)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*(ushort *)uVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*(ushort *)uVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (uVar7[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (uVar7[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*uVar7 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*uVar7 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*(byte *)((char *)uVar7 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar7)->flags_res
|
- (*(byte *)((char *)uVar7 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar7)->flags_res
)
...>
}

@field_10_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*(ushort *)((char *)uVar7 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (((ushort *)uVar7)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (((ushort *)uVar7)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*(ushort *)uVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*(ushort *)uVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (uVar7[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (uVar7[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*uVar7 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*uVar7 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*(byte *)((char *)uVar7 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar7)->enchanted
|
- (*(byte *)((char *)uVar7 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar7)->enchanted
)
...>
}

@field_10_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*(ushort *)((char *)uVar7 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (((ushort *)uVar7)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (((ushort *)uVar7)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*(ushort *)uVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*(ushort *)uVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (uVar7[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (uVar7[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*uVar7 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*uVar7 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*(byte *)((char *)uVar7 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar7)->doordir
|
- (*(byte *)((char *)uVar7 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar7)->doordir
)
...>
}

@field_10_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*(ushort *)((char *)uVar7 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (((ushort *)uVar7)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (((ushort *)uVar7)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*(ushort *)uVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*(ushort *)uVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (uVar7[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (uVar7[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*uVar7 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*uVar7 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*(byte *)((char *)uVar7 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar7)->invisible
|
- (*(byte *)((char *)uVar7 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar7)->invisible
)
...>
}

@field_10_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*(ushort *)((char *)uVar7 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- *(ushort *)((char *)uVar7 + 0x0) >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (((ushort *)uVar7)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (((ushort *)uVar7)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- ((ushort *)uVar7)[0] >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*(ushort *)uVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*(ushort *)uVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- *(ushort *)uVar7 >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (uVar7[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (uVar7[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- uVar7[0] >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*uVar7 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*uVar7 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- *uVar7 >> 15
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*(byte *)((char *)uVar7 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- (*(byte *)((char *)uVar7 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar7)->is_quant
|
- *(byte *)((char *)uVar7 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar7)->is_quant
)
...>
}

@field_10_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar7)->zpos
|
- ((ushort *)uVar7)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar7)->zpos
|
- uVar7[1] & 0x7f
+ ((uw_object_hdr_t *)uVar7)->zpos
|
- *(byte *)((char *)uVar7 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar7)->zpos
|
- (byte)uVar7[1] & 0x7f
+ ((uw_object_hdr_t *)uVar7)->zpos
)
...>
}

@field_10_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar7)->heading
|
- (*(ushort *)((char *)uVar7 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar7)->heading
|
- (((ushort *)uVar7)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar7)->heading
|
- (((ushort *)uVar7)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar7)->heading
|
- (uVar7[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar7)->heading
|
- (uVar7[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar7)->heading
)
...>
}

@field_10_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (*(ushort *)((char *)uVar7 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (((ushort *)uVar7)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (((ushort *)uVar7)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (uVar7[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (uVar7[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (*(byte *)((char *)uVar7 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar7)->ypos
|
- (*(byte *)((char *)uVar7 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar7)->ypos
)
...>
}

@field_10_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (*(ushort *)((char *)uVar7 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- *(ushort *)((char *)uVar7 + 0x2) >> 13
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (((ushort *)uVar7)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (((ushort *)uVar7)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- ((ushort *)uVar7)[1] >> 13
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (uVar7[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (uVar7[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- uVar7[1] >> 13
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (*(byte *)((char *)uVar7 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- (*(byte *)((char *)uVar7 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar7)->xpos
|
- *(byte *)((char *)uVar7 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar7)->xpos
)
...>
}

@field_10_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar7)->quality
|
- ((ushort *)uVar7)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar7)->quality
|
- uVar7[2] & 0x3f
+ ((uw_object_hdr_t *)uVar7)->quality
|
- *(byte *)((char *)uVar7 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar7)->quality
|
- (byte)uVar7[2] & 0x3f
+ ((uw_object_hdr_t *)uVar7)->quality
)
...>
}

@field_10_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar7)->next
|
- (*(ushort *)((char *)uVar7 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar7)->next
|
- *(ushort *)((char *)uVar7 + 0x4) >> 6
+ ((uw_object_hdr_t *)uVar7)->next
|
- (((ushort *)uVar7)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar7)->next
|
- (((ushort *)uVar7)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar7)->next
|
- ((ushort *)uVar7)[2] >> 6
+ ((uw_object_hdr_t *)uVar7)->next
|
- (uVar7[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar7)->next
|
- (uVar7[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar7)->next
|
- uVar7[2] >> 6
+ ((uw_object_hdr_t *)uVar7)->next
)
...>
}

@field_10_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar7)->owner
|
- ((ushort *)uVar7)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar7)->owner
|
- uVar7[3] & 0x3f
+ ((uw_object_hdr_t *)uVar7)->owner
|
- *(byte *)((char *)uVar7 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar7)->owner
|
- (byte)uVar7[3] & 0x3f
+ ((uw_object_hdr_t *)uVar7)->owner
)
...>
}

@field_10_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar7 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar7)->link
|
- (*(ushort *)((char *)uVar7 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar7)->link
|
- *(ushort *)((char *)uVar7 + 0x6) >> 6
+ ((uw_object_hdr_t *)uVar7)->link
|
- (((ushort *)uVar7)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar7)->link
|
- (((ushort *)uVar7)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar7)->link
|
- ((ushort *)uVar7)[3] >> 6
+ ((uw_object_hdr_t *)uVar7)->link
|
- (uVar7[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar7)->link
|
- (uVar7[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar7)->link
|
- uVar7[3] >> 6
+ ((uw_object_hdr_t *)uVar7)->link
)
...>
}

@field_11_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- ((ushort *)uVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- *(ushort *)uVar4 & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- *(ushort *)(uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
)
...>
}

@field_11_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)(uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)(uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)(uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)(uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
)
...>
}

@field_11_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)(uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)(uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)(uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)(uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
)
...>
}

@field_11_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)(uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)(uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)(uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)(uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
)
...>
}

@field_11_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)(uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)(uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)(uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)(uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
)
...>
}

@field_11_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)(uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)(uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)((char *)uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)(uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)(uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)(uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
)
...>
}

@field_11_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- ((ushort *)uVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(ushort *)(uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)(uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
)
...>
}

@field_11_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)(uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)(uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
)
...>
}

@field_11_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)(uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)(uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)(uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)(uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
)
...>
}

@field_11_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)(uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)(uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)((char *)uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)(uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)(uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)(uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
)
...>
}

@field_11_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- ((ushort *)uVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(ushort *)(uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)(uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
)
...>
}

@field_11_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)((char *)uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)(uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)(uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
)
...>
}

@field_11_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- ((ushort *)uVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(ushort *)(uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)(uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
)
...>
}

@field_11_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)((char *)uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)(uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)(uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
)
...>
}

@field_12_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_12_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_13_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@field_14_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puTarget)->object_id
|
- ((ushort *)puTarget)[0] & 0x1ff
+ ((uw_object_hdr_t *)puTarget)->object_id
|
- *(ushort *)puTarget & 0x1ff
+ ((uw_object_hdr_t *)puTarget)->object_id
|
- puTarget[0] & 0x1ff
+ ((uw_object_hdr_t *)puTarget)->object_id
|
- *puTarget & 0x1ff
+ ((uw_object_hdr_t *)puTarget)->object_id
)
...>
}

@field_14_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*(ushort *)((char *)puTarget + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (((ushort *)puTarget)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (((ushort *)puTarget)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*(ushort *)puTarget >> 9) & 0x7
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*(ushort *)puTarget & 0xe00) >> 9
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (puTarget[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (puTarget[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*puTarget >> 9) & 0x7
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*puTarget & 0xe00) >> 9
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*(byte *)((char *)puTarget + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puTarget)->flags_res
|
- (*(byte *)((char *)puTarget + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puTarget)->flags_res
)
...>
}

@field_14_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*(ushort *)((char *)puTarget + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (((ushort *)puTarget)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (((ushort *)puTarget)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*(ushort *)puTarget >> 12) & 0x1
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*(ushort *)puTarget & 0x1000) >> 12
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (puTarget[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (puTarget[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*puTarget >> 12) & 0x1
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*puTarget & 0x1000) >> 12
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*(byte *)((char *)puTarget + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puTarget)->enchanted
|
- (*(byte *)((char *)puTarget + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puTarget)->enchanted
)
...>
}

@field_14_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*(ushort *)((char *)puTarget + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (((ushort *)puTarget)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (((ushort *)puTarget)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*(ushort *)puTarget >> 13) & 0x1
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*(ushort *)puTarget & 0x2000) >> 13
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (puTarget[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (puTarget[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*puTarget >> 13) & 0x1
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*puTarget & 0x2000) >> 13
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*(byte *)((char *)puTarget + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puTarget)->doordir
|
- (*(byte *)((char *)puTarget + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puTarget)->doordir
)
...>
}

@field_14_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*(ushort *)((char *)puTarget + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (((ushort *)puTarget)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (((ushort *)puTarget)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*(ushort *)puTarget >> 14) & 0x1
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*(ushort *)puTarget & 0x4000) >> 14
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (puTarget[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (puTarget[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*puTarget >> 14) & 0x1
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*puTarget & 0x4000) >> 14
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*(byte *)((char *)puTarget + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puTarget)->invisible
|
- (*(byte *)((char *)puTarget + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puTarget)->invisible
)
...>
}

@field_14_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*(ushort *)((char *)puTarget + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- *(ushort *)((char *)puTarget + 0x0) >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (((ushort *)puTarget)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (((ushort *)puTarget)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- ((ushort *)puTarget)[0] >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*(ushort *)puTarget >> 15) & 0x1
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*(ushort *)puTarget & 0x8000) >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- *(ushort *)puTarget >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (puTarget[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (puTarget[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- puTarget[0] >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*puTarget >> 15) & 0x1
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*puTarget & 0x8000) >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- *puTarget >> 15
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*(byte *)((char *)puTarget + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- (*(byte *)((char *)puTarget + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puTarget)->is_quant
|
- *(byte *)((char *)puTarget + 0x1) >> 7
+ ((uw_object_hdr_t *)puTarget)->is_quant
)
...>
}

@field_14_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puTarget)->zpos
|
- ((ushort *)puTarget)[1] & 0x7f
+ ((uw_object_hdr_t *)puTarget)->zpos
|
- puTarget[1] & 0x7f
+ ((uw_object_hdr_t *)puTarget)->zpos
|
- *(byte *)((char *)puTarget + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puTarget)->zpos
|
- (byte)puTarget[1] & 0x7f
+ ((uw_object_hdr_t *)puTarget)->zpos
)
...>
}

@field_14_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puTarget)->heading
|
- (*(ushort *)((char *)puTarget + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puTarget)->heading
|
- (((ushort *)puTarget)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puTarget)->heading
|
- (((ushort *)puTarget)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puTarget)->heading
|
- (puTarget[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puTarget)->heading
|
- (puTarget[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puTarget)->heading
)
...>
}

@field_14_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (*(ushort *)((char *)puTarget + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (((ushort *)puTarget)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (((ushort *)puTarget)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (puTarget[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (puTarget[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (*(byte *)((char *)puTarget + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puTarget)->ypos
|
- (*(byte *)((char *)puTarget + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puTarget)->ypos
)
...>
}

@field_14_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (*(ushort *)((char *)puTarget + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- *(ushort *)((char *)puTarget + 0x2) >> 13
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (((ushort *)puTarget)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (((ushort *)puTarget)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- ((ushort *)puTarget)[1] >> 13
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (puTarget[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (puTarget[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- puTarget[1] >> 13
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (*(byte *)((char *)puTarget + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- (*(byte *)((char *)puTarget + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puTarget)->xpos
|
- *(byte *)((char *)puTarget + 0x3) >> 5
+ ((uw_object_hdr_t *)puTarget)->xpos
)
...>
}

@field_14_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puTarget)->quality
|
- ((ushort *)puTarget)[2] & 0x3f
+ ((uw_object_hdr_t *)puTarget)->quality
|
- puTarget[2] & 0x3f
+ ((uw_object_hdr_t *)puTarget)->quality
|
- *(byte *)((char *)puTarget + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puTarget)->quality
|
- (byte)puTarget[2] & 0x3f
+ ((uw_object_hdr_t *)puTarget)->quality
)
...>
}

@field_14_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puTarget)->next
|
- (*(ushort *)((char *)puTarget + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puTarget)->next
|
- *(ushort *)((char *)puTarget + 0x4) >> 6
+ ((uw_object_hdr_t *)puTarget)->next
|
- (((ushort *)puTarget)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puTarget)->next
|
- (((ushort *)puTarget)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puTarget)->next
|
- ((ushort *)puTarget)[2] >> 6
+ ((uw_object_hdr_t *)puTarget)->next
|
- (puTarget[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puTarget)->next
|
- (puTarget[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puTarget)->next
|
- puTarget[2] >> 6
+ ((uw_object_hdr_t *)puTarget)->next
)
...>
}

@field_14_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puTarget)->owner
|
- ((ushort *)puTarget)[3] & 0x3f
+ ((uw_object_hdr_t *)puTarget)->owner
|
- puTarget[3] & 0x3f
+ ((uw_object_hdr_t *)puTarget)->owner
|
- *(byte *)((char *)puTarget + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puTarget)->owner
|
- (byte)puTarget[3] & 0x3f
+ ((uw_object_hdr_t *)puTarget)->owner
)
...>
}

@field_14_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puTarget + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puTarget)->link
|
- (*(ushort *)((char *)puTarget + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puTarget)->link
|
- *(ushort *)((char *)puTarget + 0x6) >> 6
+ ((uw_object_hdr_t *)puTarget)->link
|
- (((ushort *)puTarget)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puTarget)->link
|
- (((ushort *)puTarget)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puTarget)->link
|
- ((ushort *)puTarget)[3] >> 6
+ ((uw_object_hdr_t *)puTarget)->link
|
- (puTarget[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puTarget)->link
|
- (puTarget[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puTarget)->link
|
- puTarget[3] >> 6
+ ((uw_object_hdr_t *)puTarget)->link
)
...>
}

@field_15_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)puAttacker)->object_id
|
- ((ushort *)puAttacker)[0] & 0x1ff
+ ((uw_object_hdr_t *)puAttacker)->object_id
|
- *(ushort *)puAttacker & 0x1ff
+ ((uw_object_hdr_t *)puAttacker)->object_id
|
- puAttacker[0] & 0x1ff
+ ((uw_object_hdr_t *)puAttacker)->object_id
|
- *puAttacker & 0x1ff
+ ((uw_object_hdr_t *)puAttacker)->object_id
)
...>
}

@field_15_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*(ushort *)((char *)puAttacker + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (((ushort *)puAttacker)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (((ushort *)puAttacker)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*(ushort *)puAttacker >> 9) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*(ushort *)puAttacker & 0xe00) >> 9
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (puAttacker[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (puAttacker[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*puAttacker >> 9) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*puAttacker & 0xe00) >> 9
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*(byte *)((char *)puAttacker + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->flags_res
|
- (*(byte *)((char *)puAttacker + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)puAttacker)->flags_res
)
...>
}

@field_15_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*(ushort *)((char *)puAttacker + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (((ushort *)puAttacker)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (((ushort *)puAttacker)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*(ushort *)puAttacker >> 12) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*(ushort *)puAttacker & 0x1000) >> 12
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (puAttacker[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (puAttacker[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*puAttacker >> 12) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*puAttacker & 0x1000) >> 12
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*(byte *)((char *)puAttacker + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->enchanted
|
- (*(byte *)((char *)puAttacker + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)puAttacker)->enchanted
)
...>
}

@field_15_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*(ushort *)((char *)puAttacker + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (((ushort *)puAttacker)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (((ushort *)puAttacker)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*(ushort *)puAttacker >> 13) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*(ushort *)puAttacker & 0x2000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (puAttacker[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (puAttacker[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*puAttacker >> 13) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*puAttacker & 0x2000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*(byte *)((char *)puAttacker + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->doordir
|
- (*(byte *)((char *)puAttacker + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)puAttacker)->doordir
)
...>
}

@field_15_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*(ushort *)((char *)puAttacker + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (((ushort *)puAttacker)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (((ushort *)puAttacker)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*(ushort *)puAttacker >> 14) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*(ushort *)puAttacker & 0x4000) >> 14
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (puAttacker[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (puAttacker[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*puAttacker >> 14) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*puAttacker & 0x4000) >> 14
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*(byte *)((char *)puAttacker + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->invisible
|
- (*(byte *)((char *)puAttacker + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)puAttacker)->invisible
)
...>
}

@field_15_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*(ushort *)((char *)puAttacker + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- *(ushort *)((char *)puAttacker + 0x0) >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (((ushort *)puAttacker)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (((ushort *)puAttacker)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- ((ushort *)puAttacker)[0] >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*(ushort *)puAttacker >> 15) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*(ushort *)puAttacker & 0x8000) >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- *(ushort *)puAttacker >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (puAttacker[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (puAttacker[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- puAttacker[0] >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*puAttacker >> 15) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*puAttacker & 0x8000) >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- *puAttacker >> 15
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*(byte *)((char *)puAttacker + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- (*(byte *)((char *)puAttacker + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)puAttacker)->is_quant
|
- *(byte *)((char *)puAttacker + 0x1) >> 7
+ ((uw_object_hdr_t *)puAttacker)->is_quant
)
...>
}

@field_15_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puAttacker)->zpos
|
- ((ushort *)puAttacker)[1] & 0x7f
+ ((uw_object_hdr_t *)puAttacker)->zpos
|
- puAttacker[1] & 0x7f
+ ((uw_object_hdr_t *)puAttacker)->zpos
|
- *(byte *)((char *)puAttacker + 0x2) & 0x7f
+ ((uw_object_hdr_t *)puAttacker)->zpos
|
- (byte)puAttacker[1] & 0x7f
+ ((uw_object_hdr_t *)puAttacker)->zpos
)
...>
}

@field_15_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->heading
|
- (*(ushort *)((char *)puAttacker + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)puAttacker)->heading
|
- (((ushort *)puAttacker)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->heading
|
- (((ushort *)puAttacker)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puAttacker)->heading
|
- (puAttacker[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->heading
|
- (puAttacker[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)puAttacker)->heading
)
...>
}

@field_15_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (*(ushort *)((char *)puAttacker + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (((ushort *)puAttacker)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (((ushort *)puAttacker)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (puAttacker[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (puAttacker[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (*(byte *)((char *)puAttacker + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->ypos
|
- (*(byte *)((char *)puAttacker + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)puAttacker)->ypos
)
...>
}

@field_15_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (*(ushort *)((char *)puAttacker + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- *(ushort *)((char *)puAttacker + 0x2) >> 13
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (((ushort *)puAttacker)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (((ushort *)puAttacker)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- ((ushort *)puAttacker)[1] >> 13
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (puAttacker[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (puAttacker[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- puAttacker[1] >> 13
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (*(byte *)((char *)puAttacker + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- (*(byte *)((char *)puAttacker + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)puAttacker)->xpos
|
- *(byte *)((char *)puAttacker + 0x3) >> 5
+ ((uw_object_hdr_t *)puAttacker)->xpos
)
...>
}

@field_15_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->quality
|
- ((ushort *)puAttacker)[2] & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->quality
|
- puAttacker[2] & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->quality
|
- *(byte *)((char *)puAttacker + 0x4) & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->quality
|
- (byte)puAttacker[2] & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->quality
)
...>
}

@field_15_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puAttacker)->next
|
- (*(ushort *)((char *)puAttacker + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puAttacker)->next
|
- *(ushort *)((char *)puAttacker + 0x4) >> 6
+ ((uw_object_hdr_t *)puAttacker)->next
|
- (((ushort *)puAttacker)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puAttacker)->next
|
- (((ushort *)puAttacker)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puAttacker)->next
|
- ((ushort *)puAttacker)[2] >> 6
+ ((uw_object_hdr_t *)puAttacker)->next
|
- (puAttacker[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puAttacker)->next
|
- (puAttacker[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puAttacker)->next
|
- puAttacker[2] >> 6
+ ((uw_object_hdr_t *)puAttacker)->next
)
...>
}

@field_15_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->owner
|
- ((ushort *)puAttacker)[3] & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->owner
|
- puAttacker[3] & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->owner
|
- *(byte *)((char *)puAttacker + 0x6) & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->owner
|
- (byte)puAttacker[3] & 0x3f
+ ((uw_object_hdr_t *)puAttacker)->owner
)
...>
}

@field_15_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)puAttacker + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puAttacker)->link
|
- (*(ushort *)((char *)puAttacker + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puAttacker)->link
|
- *(ushort *)((char *)puAttacker + 0x6) >> 6
+ ((uw_object_hdr_t *)puAttacker)->link
|
- (((ushort *)puAttacker)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puAttacker)->link
|
- (((ushort *)puAttacker)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puAttacker)->link
|
- ((ushort *)puAttacker)[3] >> 6
+ ((uw_object_hdr_t *)puAttacker)->link
|
- (puAttacker[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)puAttacker)->link
|
- (puAttacker[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)puAttacker)->link
|
- puAttacker[3] >> 6
+ ((uw_object_hdr_t *)puAttacker)->link
)
...>
}

@field_16_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- ((ushort *)uVar4)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- *(ushort *)uVar4 & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- uVar4[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
|
- *uVar4 & 0x1ff
+ ((uw_object_hdr_t *)uVar4)->object_id
)
...>
}

@field_16_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (((ushort *)uVar4)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(ushort *)uVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (uVar4[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (uVar4[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*uVar4 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*uVar4 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar4)->flags_res
|
- (*(byte *)((char *)uVar4 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar4)->flags_res
)
...>
}

@field_16_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (((ushort *)uVar4)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(ushort *)uVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (uVar4[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (uVar4[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*uVar4 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*uVar4 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar4)->enchanted
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar4)->enchanted
)
...>
}

@field_16_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (((ushort *)uVar4)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(ushort *)uVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (uVar4[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (uVar4[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*uVar4 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*uVar4 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar4)->doordir
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar4)->doordir
)
...>
}

@field_16_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (((ushort *)uVar4)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(ushort *)uVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (uVar4[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (uVar4[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*uVar4 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*uVar4 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar4)->invisible
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar4)->invisible
)
...>
}

@field_16_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)((char *)uVar4 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(ushort *)((char *)uVar4 + 0x0) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (((ushort *)uVar4)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- ((ushort *)uVar4)[0] >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(ushort *)uVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(ushort *)uVar4 >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (uVar4[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (uVar4[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- uVar4[0] >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*uVar4 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*uVar4 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *uVar4 >> 15
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- (*(byte *)((char *)uVar4 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
|
- *(byte *)((char *)uVar4 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar4)->is_quant
)
...>
}

@field_16_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- ((ushort *)uVar4)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- uVar4[1] & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- *(byte *)((char *)uVar4 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
|
- (byte)uVar4[1] & 0x7f
+ ((uw_object_hdr_t *)uVar4)->zpos
)
...>
}

@field_16_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (((ushort *)uVar4)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (uVar4[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar4)->heading
|
- (uVar4[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar4)->heading
)
...>
}

@field_16_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (((ushort *)uVar4)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (uVar4[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (uVar4[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar4)->ypos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar4)->ypos
)
...>
}

@field_16_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(ushort *)((char *)uVar4 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(ushort *)((char *)uVar4 + 0x2) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (((ushort *)uVar4)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- ((ushort *)uVar4)[1] >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (uVar4[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (uVar4[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- uVar4[1] >> 13
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- (*(byte *)((char *)uVar4 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
|
- *(byte *)((char *)uVar4 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar4)->xpos
)
...>
}

@field_16_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- ((ushort *)uVar4)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- uVar4[2] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- *(byte *)((char *)uVar4 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
|
- (byte)uVar4[2] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->quality
)
...>
}

@field_16_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (*(ushort *)((char *)uVar4 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- *(ushort *)((char *)uVar4 + 0x4) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (((ushort *)uVar4)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- ((ushort *)uVar4)[2] >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- (uVar4[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->next
|
- (uVar4[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->next
|
- uVar4[2] >> 6
+ ((uw_object_hdr_t *)uVar4)->next
)
...>
}

@field_16_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- ((ushort *)uVar4)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- uVar4[3] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- *(byte *)((char *)uVar4 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
|
- (byte)uVar4[3] & 0x3f
+ ((uw_object_hdr_t *)uVar4)->owner
)
...>
}

@field_16_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar4 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (*(ushort *)((char *)uVar4 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- *(ushort *)((char *)uVar4 + 0x6) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (((ushort *)uVar4)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- ((ushort *)uVar4)[3] >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- (uVar4[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar4)->link
|
- (uVar4[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar4)->link
|
- uVar4[3] >> 6
+ ((uw_object_hdr_t *)uVar4)->link
)
...>
}

@field_17_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)uVar5)->object_id
|
- ((ushort *)uVar5)[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar5)->object_id
|
- *(ushort *)uVar5 & 0x1ff
+ ((uw_object_hdr_t *)uVar5)->object_id
|
- uVar5[0] & 0x1ff
+ ((uw_object_hdr_t *)uVar5)->object_id
|
- *uVar5 & 0x1ff
+ ((uw_object_hdr_t *)uVar5)->object_id
)
...>
}

@field_17_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*(ushort *)((char *)uVar5 + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (((ushort *)uVar5)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (((ushort *)uVar5)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*(ushort *)uVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*(ushort *)uVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (uVar5[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (uVar5[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*uVar5 >> 9) & 0x7
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*uVar5 & 0xe00) >> 9
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*(byte *)((char *)uVar5 + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)uVar5)->flags_res
|
- (*(byte *)((char *)uVar5 + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)uVar5)->flags_res
)
...>
}

@field_17_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*(ushort *)((char *)uVar5 + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (((ushort *)uVar5)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (((ushort *)uVar5)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*(ushort *)uVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*(ushort *)uVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (uVar5[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (uVar5[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*uVar5 >> 12) & 0x1
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*uVar5 & 0x1000) >> 12
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*(byte *)((char *)uVar5 + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)uVar5)->enchanted
|
- (*(byte *)((char *)uVar5 + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)uVar5)->enchanted
)
...>
}

@field_17_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*(ushort *)((char *)uVar5 + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (((ushort *)uVar5)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (((ushort *)uVar5)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*(ushort *)uVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*(ushort *)uVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (uVar5[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (uVar5[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*uVar5 >> 13) & 0x1
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*uVar5 & 0x2000) >> 13
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*(byte *)((char *)uVar5 + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)uVar5)->doordir
|
- (*(byte *)((char *)uVar5 + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)uVar5)->doordir
)
...>
}

@field_17_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*(ushort *)((char *)uVar5 + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (((ushort *)uVar5)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (((ushort *)uVar5)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*(ushort *)uVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*(ushort *)uVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (uVar5[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (uVar5[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*uVar5 >> 14) & 0x1
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*uVar5 & 0x4000) >> 14
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*(byte *)((char *)uVar5 + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)uVar5)->invisible
|
- (*(byte *)((char *)uVar5 + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)uVar5)->invisible
)
...>
}

@field_17_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*(ushort *)((char *)uVar5 + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- *(ushort *)((char *)uVar5 + 0x0) >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (((ushort *)uVar5)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (((ushort *)uVar5)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- ((ushort *)uVar5)[0] >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*(ushort *)uVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*(ushort *)uVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- *(ushort *)uVar5 >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (uVar5[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (uVar5[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- uVar5[0] >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*uVar5 >> 15) & 0x1
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*uVar5 & 0x8000) >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- *uVar5 >> 15
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*(byte *)((char *)uVar5 + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- (*(byte *)((char *)uVar5 + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)uVar5)->is_quant
|
- *(byte *)((char *)uVar5 + 0x1) >> 7
+ ((uw_object_hdr_t *)uVar5)->is_quant
)
...>
}

@field_17_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar5)->zpos
|
- ((ushort *)uVar5)[1] & 0x7f
+ ((uw_object_hdr_t *)uVar5)->zpos
|
- uVar5[1] & 0x7f
+ ((uw_object_hdr_t *)uVar5)->zpos
|
- *(byte *)((char *)uVar5 + 0x2) & 0x7f
+ ((uw_object_hdr_t *)uVar5)->zpos
|
- (byte)uVar5[1] & 0x7f
+ ((uw_object_hdr_t *)uVar5)->zpos
)
...>
}

@field_17_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar5)->heading
|
- (*(ushort *)((char *)uVar5 + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar5)->heading
|
- (((ushort *)uVar5)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar5)->heading
|
- (((ushort *)uVar5)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar5)->heading
|
- (uVar5[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)uVar5)->heading
|
- (uVar5[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)uVar5)->heading
)
...>
}

@field_17_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (*(ushort *)((char *)uVar5 + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (((ushort *)uVar5)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (((ushort *)uVar5)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (uVar5[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (uVar5[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (*(byte *)((char *)uVar5 + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)uVar5)->ypos
|
- (*(byte *)((char *)uVar5 + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)uVar5)->ypos
)
...>
}

@field_17_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (*(ushort *)((char *)uVar5 + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- *(ushort *)((char *)uVar5 + 0x2) >> 13
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (((ushort *)uVar5)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (((ushort *)uVar5)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- ((ushort *)uVar5)[1] >> 13
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (uVar5[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (uVar5[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- uVar5[1] >> 13
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (*(byte *)((char *)uVar5 + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- (*(byte *)((char *)uVar5 + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)uVar5)->xpos
|
- *(byte *)((char *)uVar5 + 0x3) >> 5
+ ((uw_object_hdr_t *)uVar5)->xpos
)
...>
}

@field_17_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar5)->quality
|
- ((ushort *)uVar5)[2] & 0x3f
+ ((uw_object_hdr_t *)uVar5)->quality
|
- uVar5[2] & 0x3f
+ ((uw_object_hdr_t *)uVar5)->quality
|
- *(byte *)((char *)uVar5 + 0x4) & 0x3f
+ ((uw_object_hdr_t *)uVar5)->quality
|
- (byte)uVar5[2] & 0x3f
+ ((uw_object_hdr_t *)uVar5)->quality
)
...>
}

@field_17_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar5)->next
|
- (*(ushort *)((char *)uVar5 + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar5)->next
|
- *(ushort *)((char *)uVar5 + 0x4) >> 6
+ ((uw_object_hdr_t *)uVar5)->next
|
- (((ushort *)uVar5)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar5)->next
|
- (((ushort *)uVar5)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar5)->next
|
- ((ushort *)uVar5)[2] >> 6
+ ((uw_object_hdr_t *)uVar5)->next
|
- (uVar5[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar5)->next
|
- (uVar5[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar5)->next
|
- uVar5[2] >> 6
+ ((uw_object_hdr_t *)uVar5)->next
)
...>
}

@field_17_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar5)->owner
|
- ((ushort *)uVar5)[3] & 0x3f
+ ((uw_object_hdr_t *)uVar5)->owner
|
- uVar5[3] & 0x3f
+ ((uw_object_hdr_t *)uVar5)->owner
|
- *(byte *)((char *)uVar5 + 0x6) & 0x3f
+ ((uw_object_hdr_t *)uVar5)->owner
|
- (byte)uVar5[3] & 0x3f
+ ((uw_object_hdr_t *)uVar5)->owner
)
...>
}

@field_17_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)uVar5 + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar5)->link
|
- (*(ushort *)((char *)uVar5 + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar5)->link
|
- *(ushort *)((char *)uVar5 + 0x6) >> 6
+ ((uw_object_hdr_t *)uVar5)->link
|
- (((ushort *)uVar5)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar5)->link
|
- (((ushort *)uVar5)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar5)->link
|
- ((ushort *)uVar5)[3] >> 6
+ ((uw_object_hdr_t *)uVar5)->link
|
- (uVar5[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)uVar5)->link
|
- (uVar5[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)uVar5)->link
|
- uVar5[3] >> 6
+ ((uw_object_hdr_t *)uVar5)->link
)
...>
}

@field_18_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_18_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@field_19_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
- *(ushort *)((char *)target + 0x0) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (((ushort *)target)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (((ushort *)target)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- ((ushort *)target)[0] >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)target >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*(ushort *)target & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- *(ushort *)target >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (target[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (target[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- target[0] >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*target >> 15) & 0x1
+ ((uw_object_hdr_t *)target)->is_quant
|
- (*target & 0x8000) >> 15
+ ((uw_object_hdr_t *)target)->is_quant
|
- *target >> 15
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

@field_19_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
- *(ushort *)((char *)target + 0x2) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (((ushort *)target)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (((ushort *)target)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- ((ushort *)target)[1] >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- (target[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)target)->xpos
|
- (target[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)target)->xpos
|
- target[1] >> 13
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

@field_19_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
- *(ushort *)((char *)target + 0x4) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- (((ushort *)target)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (((ushort *)target)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- ((ushort *)target)[2] >> 6
+ ((uw_object_hdr_t *)target)->next
|
- (target[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->next
|
- (target[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->next
|
- target[2] >> 6
+ ((uw_object_hdr_t *)target)->next
)
...>
}

@field_19_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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

@field_19_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
- *(ushort *)((char *)target + 0x6) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- (((ushort *)target)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (((ushort *)target)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- ((ushort *)target)[3] >> 6
+ ((uw_object_hdr_t *)target)->link
|
- (target[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)target)->link
|
- (target[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)target)->link
|
- target[3] >> 6
+ ((uw_object_hdr_t *)target)->link
)
...>
}

@field_20_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_20_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@field_21_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_21_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@field_22_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)object_hdr)->object_id
|
- ((ushort *)object_hdr)[0] & 0x1ff
+ ((uw_object_hdr_t *)object_hdr)->object_id
|
- *(ushort *)object_hdr & 0x1ff
+ ((uw_object_hdr_t *)object_hdr)->object_id
)
...>
}

@field_22_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (*(ushort *)((char *)object_hdr + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (((ushort *)object_hdr)[0] >> 9) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (((ushort *)object_hdr)[0] & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (*(ushort *)object_hdr >> 9) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (*(ushort *)object_hdr & 0xe00) >> 9
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (*(byte *)((char *)object_hdr + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->flags_res
|
- (*(byte *)((char *)object_hdr + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)object_hdr)->flags_res
)
...>
}

@field_22_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (*(ushort *)((char *)object_hdr + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (((ushort *)object_hdr)[0] >> 12) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (((ushort *)object_hdr)[0] & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (*(ushort *)object_hdr >> 12) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (*(ushort *)object_hdr & 0x1000) >> 12
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (*(byte *)((char *)object_hdr + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->enchanted
|
- (*(byte *)((char *)object_hdr + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)object_hdr)->enchanted
)
...>
}

@field_22_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (*(ushort *)((char *)object_hdr + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (((ushort *)object_hdr)[0] >> 13) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (((ushort *)object_hdr)[0] & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (*(ushort *)object_hdr >> 13) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (*(ushort *)object_hdr & 0x2000) >> 13
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (*(byte *)((char *)object_hdr + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->doordir
|
- (*(byte *)((char *)object_hdr + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)object_hdr)->doordir
)
...>
}

@field_22_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (*(ushort *)((char *)object_hdr + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (((ushort *)object_hdr)[0] >> 14) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (((ushort *)object_hdr)[0] & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (*(ushort *)object_hdr >> 14) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (*(ushort *)object_hdr & 0x4000) >> 14
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (*(byte *)((char *)object_hdr + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->invisible
|
- (*(byte *)((char *)object_hdr + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)object_hdr)->invisible
)
...>
}

@field_22_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (*(ushort *)((char *)object_hdr + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (((ushort *)object_hdr)[0] >> 15) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (((ushort *)object_hdr)[0] & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (*(ushort *)object_hdr >> 15) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (*(ushort *)object_hdr & 0x8000) >> 15
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (*(byte *)((char *)object_hdr + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- (*(byte *)((char *)object_hdr + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)object_hdr)->is_quant
|
- *(byte *)((char *)object_hdr + 0x1) >> 7
+ ((uw_object_hdr_t *)object_hdr)->is_quant
)
...>
}

@field_22_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_hdr)->zpos
|
- ((ushort *)object_hdr)[1] & 0x7f
+ ((uw_object_hdr_t *)object_hdr)->zpos
|
- *(byte *)((char *)object_hdr + 0x2) & 0x7f
+ ((uw_object_hdr_t *)object_hdr)->zpos
)
...>
}

@field_22_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->heading
|
- (*(ushort *)((char *)object_hdr + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)object_hdr)->heading
|
- (((ushort *)object_hdr)[1] >> 7) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->heading
|
- (((ushort *)object_hdr)[1] & 0x380) >> 7
+ ((uw_object_hdr_t *)object_hdr)->heading
)
...>
}

@field_22_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->ypos
|
- (*(ushort *)((char *)object_hdr + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_hdr)->ypos
|
- (((ushort *)object_hdr)[1] >> 10) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->ypos
|
- (((ushort *)object_hdr)[1] & 0x1c00) >> 10
+ ((uw_object_hdr_t *)object_hdr)->ypos
|
- (*(byte *)((char *)object_hdr + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->ypos
|
- (*(byte *)((char *)object_hdr + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)object_hdr)->ypos
)
...>
}

@field_22_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->xpos
|
- (*(ushort *)((char *)object_hdr + 0x2) & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_hdr)->xpos
|
- (((ushort *)object_hdr)[1] >> 13) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->xpos
|
- (((ushort *)object_hdr)[1] & 0xe000) >> 13
+ ((uw_object_hdr_t *)object_hdr)->xpos
|
- (*(byte *)((char *)object_hdr + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)object_hdr)->xpos
|
- (*(byte *)((char *)object_hdr + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)object_hdr)->xpos
|
- *(byte *)((char *)object_hdr + 0x3) >> 5
+ ((uw_object_hdr_t *)object_hdr)->xpos
)
...>
}

@field_22_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_hdr)->quality
|
- ((ushort *)object_hdr)[2] & 0x3f
+ ((uw_object_hdr_t *)object_hdr)->quality
|
- *(byte *)((char *)object_hdr + 0x4) & 0x3f
+ ((uw_object_hdr_t *)object_hdr)->quality
)
...>
}

@field_22_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_hdr)->next
|
- (*(ushort *)((char *)object_hdr + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_hdr)->next
|
- (((ushort *)object_hdr)[2] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_hdr)->next
|
- (((ushort *)object_hdr)[2] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_hdr)->next
)
...>
}

@field_22_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_hdr)->owner
|
- ((ushort *)object_hdr)[3] & 0x3f
+ ((uw_object_hdr_t *)object_hdr)->owner
|
- *(byte *)((char *)object_hdr + 0x6) & 0x3f
+ ((uw_object_hdr_t *)object_hdr)->owner
)
...>
}

@field_22_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, byte, uw_object_hdr_t;
@@
R F(...) {
<...
(
- (*(ushort *)((char *)object_hdr + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_hdr)->link
|
- (*(ushort *)((char *)object_hdr + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_hdr)->link
|
- (((ushort *)object_hdr)[3] >> 6) & 0x3ff
+ ((uw_object_hdr_t *)object_hdr)->link
|
- (((ushort *)object_hdr)[3] & 0xffc0) >> 6
+ ((uw_object_hdr_t *)object_hdr)->link
)
...>
}

@field_23_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_23_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@field_24_object_id disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- *(ushort *)(pDropObj + 0x0) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->object_id
|
- CONCAT11(pDropObj[1], *pDropObj) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->object_id
|
- CONCAT11(pDropObj[1], pDropObj[0]) & 0x1ff
+ ((uw_object_hdr_t *)pDropObj)->object_id
)
...>
}

@field_24_flags_res disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x0) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(ushort *)(pDropObj + 0x0) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 9) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0xe00) >> 9
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)((char *)pDropObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)((char *)pDropObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)(pDropObj + 0x1) >> 1) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->flags_res
|
- (*(byte *)(pDropObj + 0x1) & 0xe) >> 1
+ ((uw_object_hdr_t *)pDropObj)->flags_res
)
...>
}

@field_24_enchanted disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x0) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(ushort *)(pDropObj + 0x0) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 12) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x1000) >> 12
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)((char *)pDropObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)(pDropObj + 0x1) >> 4) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->enchanted
|
- (*(byte *)(pDropObj + 0x1) & 0x10) >> 4
+ ((uw_object_hdr_t *)pDropObj)->enchanted
)
...>
}

@field_24_doordir disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x0) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(ushort *)(pDropObj + 0x0) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 13) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x2000) >> 13
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)((char *)pDropObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)(pDropObj + 0x1) >> 5) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->doordir
|
- (*(byte *)(pDropObj + 0x1) & 0x20) >> 5
+ ((uw_object_hdr_t *)pDropObj)->doordir
)
...>
}

@field_24_invisible disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x0) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(ushort *)(pDropObj + 0x0) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 14) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x4000) >> 14
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)((char *)pDropObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)((char *)pDropObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)(pDropObj + 0x1) >> 6) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->invisible
|
- (*(byte *)(pDropObj + 0x1) & 0x40) >> 6
+ ((uw_object_hdr_t *)pDropObj)->invisible
)
...>
}

@field_24_is_quant disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x0) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(ushort *)(pDropObj + 0x0) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], *pDropObj) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], *pDropObj) & 0x8000) >> 15
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], pDropObj[0]) >> 15) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (CONCAT11(pDropObj[1], pDropObj[0]) & 0x8000) >> 15
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
|
- (*(byte *)(pDropObj + 0x1) >> 7) & 0x1
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- (*(byte *)(pDropObj + 0x1) & 0x80) >> 7
+ ((uw_object_hdr_t *)pDropObj)->is_quant
|
- *(byte *)(pDropObj + 0x1) >> 7
+ ((uw_object_hdr_t *)pDropObj)->is_quant
)
...>
}

@field_24_zpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- *(ushort *)(pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- *(byte *)((char *)pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- pDropObj[2] & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
|
- *(byte *)(pDropObj + 0x2) & 0x7f
+ ((uw_object_hdr_t *)pDropObj)->zpos
)
...>
}

@field_24_heading disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- (*(ushort *)(pDropObj + 0x2) >> 7) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->heading
|
- (*(ushort *)(pDropObj + 0x2) & 0x380) >> 7
+ ((uw_object_hdr_t *)pDropObj)->heading
)
...>
}

@field_24_ypos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x2) >> 10) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(ushort *)(pDropObj + 0x2) & 0x1c00) >> 10
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)((char *)pDropObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)((char *)pDropObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)(pDropObj + 0x3) >> 2) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->ypos
|
- (*(byte *)(pDropObj + 0x3) & 0x1c) >> 2
+ ((uw_object_hdr_t *)pDropObj)->ypos
)
...>
}

@field_24_xpos disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- (*(ushort *)(pDropObj + 0x2) >> 13) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(ushort *)(pDropObj + 0x2) & 0xe000) >> 13
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
|
- (*(byte *)(pDropObj + 0x3) >> 5) & 0x7
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- (*(byte *)(pDropObj + 0x3) & 0xe0) >> 5
+ ((uw_object_hdr_t *)pDropObj)->xpos
|
- *(byte *)(pDropObj + 0x3) >> 5
+ ((uw_object_hdr_t *)pDropObj)->xpos
)
...>
}

@field_24_quality disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- *(ushort *)(pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- *(byte *)((char *)pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- pDropObj[4] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
|
- *(byte *)(pDropObj + 0x4) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->quality
)
...>
}

@field_24_next disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- (*(ushort *)(pDropObj + 0x4) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->next
|
- (*(ushort *)(pDropObj + 0x4) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->next
)
...>
}

@field_24_owner disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
- *(ushort *)(pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- *(byte *)((char *)pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- pDropObj[6] & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
|
- *(byte *)(pDropObj + 0x6) & 0x3f
+ ((uw_object_hdr_t *)pDropObj)->owner
)
...>
}

@field_24_link disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- (*(ushort *)(pDropObj + 0x6) >> 6) & 0x3ff
+ ((uw_object_hdr_t *)pDropObj)->link
|
- (*(ushort *)(pDropObj + 0x6) & 0xffc0) >> 6
+ ((uw_object_hdr_t *)pDropObj)->link
)
...>
}

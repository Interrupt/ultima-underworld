@word_0_0@
type R;
identifier F =~ "^\(build_player_save_record\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)out_record + 0)
+ ((uw_object_hdr_t *)out_record)->type_flags
|
- ((ushort *)out_record)[0]
+ ((uw_object_hdr_t *)out_record)->type_flags
|
- *(ushort *)out_record
+ ((uw_object_hdr_t *)out_record)->type_flags
|
- *(ushort *)(out_record + 0)
+ ((uw_object_hdr_t *)out_record)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(build_player_save_record\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)out_record + 2)
+ ((uw_object_hdr_t *)out_record)->position_word
|
- ((ushort *)out_record)[1]
+ ((uw_object_hdr_t *)out_record)->position_word
|
- *(ushort *)(out_record + 2)
+ ((uw_object_hdr_t *)out_record)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(build_player_save_record\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)out_record + 4)
+ ((uw_object_hdr_t *)out_record)->chain_word
|
- ((ushort *)out_record)[2]
+ ((uw_object_hdr_t *)out_record)->chain_word
|
- *(ushort *)(out_record + 4)
+ ((uw_object_hdr_t *)out_record)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(build_player_save_record\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)out_record + 6)
+ ((uw_object_hdr_t *)out_record)->link_word
|
- ((ushort *)out_record)[3]
+ ((uw_object_hdr_t *)out_record)->link_word
|
- *(ushort *)(out_record + 6)
+ ((uw_object_hdr_t *)out_record)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 0)
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- ((ushort *)equipped)[0]
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *(ushort *)equipped
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- equipped[0]
+ ((uw_object_hdr_t *)equipped)->type_flags
|
- *equipped
+ ((uw_object_hdr_t *)equipped)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 2)
+ ((uw_object_hdr_t *)equipped)->position_word
|
- ((ushort *)equipped)[1]
+ ((uw_object_hdr_t *)equipped)->position_word
|
- equipped[1]
+ ((uw_object_hdr_t *)equipped)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 4)
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- ((ushort *)equipped)[2]
+ ((uw_object_hdr_t *)equipped)->chain_word
|
- equipped[2]
+ ((uw_object_hdr_t *)equipped)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(refresh_player_equipment_effects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped + 6)
+ ((uw_object_hdr_t *)equipped)->link_word
|
- ((ushort *)equipped)[3]
+ ((uw_object_hdr_t *)equipped)->link_word
|
- equipped[3]
+ ((uw_object_hdr_t *)equipped)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 0)
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- ((ushort *)puVar5)[0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *(ushort *)puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 2)
+ ((uw_object_hdr_t *)puVar5)->position_word
|
- ((ushort *)puVar5)[1]
+ ((uw_object_hdr_t *)puVar5)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 4)
+ ((uw_object_hdr_t *)puVar5)->chain_word
|
- ((ushort *)puVar5)[2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(handle_game_victory_sequence\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar5 + 6)
+ ((uw_object_hdr_t *)puVar5)->link_word
|
- ((ushort *)puVar5)[3]
+ ((uw_object_hdr_t *)puVar5)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 0)
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- ((ushort *)pNewObj)[0]
+ ((uw_object_hdr_t *)pNewObj)->type_flags
|
- *(ushort *)pNewObj
+ ((uw_object_hdr_t *)pNewObj)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 2)
+ ((uw_object_hdr_t *)pNewObj)->position_word
|
- ((ushort *)pNewObj)[1]
+ ((uw_object_hdr_t *)pNewObj)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 4)
+ ((uw_object_hdr_t *)pNewObj)->chain_word
|
- ((ushort *)pNewObj)[2]
+ ((uw_object_hdr_t *)pNewObj)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(handle_starvation_penalty\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNewObj + 6)
+ ((uw_object_hdr_t *)pNewObj)->link_word
|
- ((ushort *)pNewObj)[3]
+ ((uw_object_hdr_t *)pNewObj)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 0)
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- ((ushort *)puVar6)[0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *(ushort *)puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 2)
+ ((uw_object_hdr_t *)puVar6)->position_word
|
- ((ushort *)puVar6)[1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 4)
+ ((uw_object_hdr_t *)puVar6)->chain_word
|
- ((ushort *)puVar6)[2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(decay_equipped_light_sources\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar6 + 6)
+ ((uw_object_hdr_t *)puVar6)->link_word
|
- ((ushort *)puVar6)[3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}

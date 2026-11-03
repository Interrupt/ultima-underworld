@word_0_0@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- ((ushort *)puVar9)[0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *(ushort *)puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- puVar9[0]
+ ((uw_object_hdr_t *)puVar9)->type_flags
|
- *puVar9
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 2)
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- ((ushort *)puVar9)[1]
+ ((uw_object_hdr_t *)puVar9)->position_word
|
- puVar9[1]
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- ((ushort *)puVar9)[2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
|
- puVar9[2]
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc\|babl_builtin_take_id_from_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar9 + 6)
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- ((ushort *)puVar9)[3]
+ ((uw_object_hdr_t *)puVar9)->link_word
|
- puVar9[3]
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 0)
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- ((ushort *)puVar3)[0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *(ushort *)puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 2)
+ ((uw_object_hdr_t *)puVar3)->position_word
|
- ((ushort *)puVar3)[1]
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 4)
+ ((uw_object_hdr_t *)puVar3)->chain_word
|
- ((ushort *)puVar3)[2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar3 + 6)
+ ((uw_object_hdr_t *)puVar3)->link_word
|
- ((ushort *)puVar3)[3]
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- ((ushort *)puVar4)[0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(ushort *)puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- ((ushort *)puVar4)[1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- ((ushort *)puVar4)[2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(babl_builtin_do_inv_create\|babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- ((ushort *)puVar4)[3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- ((ushort *)puVar7)[0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(ushort *)puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- ((ushort *)puVar7)[1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- ((ushort *)puVar7)[2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- ((ushort *)puVar7)[3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 0)
+ ((uw_object_hdr_t *)link_cursor)->type_flags
|
- ((ushort *)link_cursor)[0]
+ ((uw_object_hdr_t *)link_cursor)->type_flags
|
- *(ushort *)link_cursor
+ ((uw_object_hdr_t *)link_cursor)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 2)
+ ((uw_object_hdr_t *)link_cursor)->position_word
|
- ((ushort *)link_cursor)[1]
+ ((uw_object_hdr_t *)link_cursor)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 4)
+ ((uw_object_hdr_t *)link_cursor)->chain_word
|
- ((ushort *)link_cursor)[2]
+ ((uw_object_hdr_t *)link_cursor)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(babl_builtin_place_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)link_cursor + 6)
+ ((uw_object_hdr_t *)link_cursor)->link_word
|
- ((ushort *)link_cursor)[3]
+ ((uw_object_hdr_t *)link_cursor)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- ((ushort *)iVar3)[0]
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)iVar3
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)(iVar3 + 0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}

@word_5_1@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- ((ushort *)iVar3)[1]
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- *(ushort *)(iVar3 + 2)
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}

@word_5_2@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- ((ushort *)iVar3)[2]
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- *(ushort *)(iVar3 + 4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}

@word_5_3@
type R;
identifier F =~ "^\(babl_builtin_take_from_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- ((ushort *)iVar3)[3]
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- *(ushort *)(iVar3 + 6)
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}

@word_6_0@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- ((ushort *)uVar1)[0]
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)uVar1
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)(uVar1 + 0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- ((ushort *)uVar1)[1]
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- *(ushort *)(uVar1 + 2)
+ ((uw_object_hdr_t *)uVar1)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- ((ushort *)uVar1)[2]
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- *(ushort *)(uVar1 + 4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(babl_builtin_add_to_npc_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- ((ushort *)uVar1)[3]
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- *(ushort *)(uVar1 + 6)
+ ((uw_object_hdr_t *)uVar1)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- ((ushort *)iVar6)[0]
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- iVar6[0]
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- ((ushort *)iVar6)[1]
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- iVar6[1]
+ ((uw_object_hdr_t *)iVar6)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- ((ushort *)iVar6)[2]
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- iVar6[2]
+ ((uw_object_hdr_t *)iVar6)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(babl_builtin_gronk_door\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- ((ushort *)iVar6)[3]
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- iVar6[3]
+ ((uw_object_hdr_t *)iVar6)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 0)
+ ((uw_object_hdr_t *)puVar11_rec)->type_flags
|
- ((ushort *)puVar11_rec)[0]
+ ((uw_object_hdr_t *)puVar11_rec)->type_flags
|
- *(ushort *)puVar11_rec
+ ((uw_object_hdr_t *)puVar11_rec)->type_flags
)
...>
}

@word_8_1@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 2)
+ ((uw_object_hdr_t *)puVar11_rec)->position_word
|
- ((ushort *)puVar11_rec)[1]
+ ((uw_object_hdr_t *)puVar11_rec)->position_word
)
...>
}

@word_8_2@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 4)
+ ((uw_object_hdr_t *)puVar11_rec)->chain_word
|
- ((ushort *)puVar11_rec)[2]
+ ((uw_object_hdr_t *)puVar11_rec)->chain_word
)
...>
}

@word_8_3@
type R;
identifier F =~ "^\(babl_builtin_x_obj_stuff\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11_rec + 6)
+ ((uw_object_hdr_t *)puVar11_rec)->link_word
|
- ((ushort *)puVar11_rec)[3]
+ ((uw_object_hdr_t *)puVar11_rec)->link_word
)
...>
}

@word_9_0@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- ((ushort *)iVar5)[0]
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(ushort *)iVar5
+ ((uw_object_hdr_t *)iVar5)->type_flags
)
...>
}

@word_9_1@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 2)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- ((ushort *)iVar5)[1]
+ ((uw_object_hdr_t *)iVar5)->position_word
)
...>
}

@word_9_2@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- ((ushort *)iVar5)[2]
+ ((uw_object_hdr_t *)iVar5)->chain_word
)
...>
}

@word_9_3@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 6)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- ((ushort *)iVar5)[3]
+ ((uw_object_hdr_t *)iVar5)->link_word
)
...>
}

@word_10_0@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 0)
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- ((ushort *)iVar3)[0]
+ ((uw_object_hdr_t *)iVar3)->type_flags
|
- *(ushort *)iVar3
+ ((uw_object_hdr_t *)iVar3)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 2)
+ ((uw_object_hdr_t *)iVar3)->position_word
|
- ((ushort *)iVar3)[1]
+ ((uw_object_hdr_t *)iVar3)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 4)
+ ((uw_object_hdr_t *)iVar3)->chain_word
|
- ((ushort *)iVar3)[2]
+ ((uw_object_hdr_t *)iVar3)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar3 + 6)
+ ((uw_object_hdr_t *)iVar3)->link_word
|
- ((ushort *)iVar3)[3]
+ ((uw_object_hdr_t *)iVar3)->link_word
)
...>
}

@word_11_0@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 0)
+ ((uw_object_hdr_t *)item_rec)->type_flags
|
- ((ushort *)item_rec)[0]
+ ((uw_object_hdr_t *)item_rec)->type_flags
|
- *(ushort *)item_rec
+ ((uw_object_hdr_t *)item_rec)->type_flags
|
- *(ushort *)(item_rec + 0)
+ ((uw_object_hdr_t *)item_rec)->type_flags
)
...>
}

@word_11_1@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 2)
+ ((uw_object_hdr_t *)item_rec)->position_word
|
- ((ushort *)item_rec)[1]
+ ((uw_object_hdr_t *)item_rec)->position_word
|
- *(ushort *)(item_rec + 2)
+ ((uw_object_hdr_t *)item_rec)->position_word
)
...>
}

@word_11_2@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 4)
+ ((uw_object_hdr_t *)item_rec)->chain_word
|
- ((ushort *)item_rec)[2]
+ ((uw_object_hdr_t *)item_rec)->chain_word
|
- *(ushort *)(item_rec + 4)
+ ((uw_object_hdr_t *)item_rec)->chain_word
)
...>
}

@word_11_3@
type R;
identifier F =~ "^\(babl_builtin_give_ptr_npc\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)item_rec + 6)
+ ((uw_object_hdr_t *)item_rec)->link_word
|
- ((ushort *)item_rec)[3]
+ ((uw_object_hdr_t *)item_rec)->link_word
|
- *(ushort *)(item_rec + 6)
+ ((uw_object_hdr_t *)item_rec)->link_word
)
...>
}

@word_12_0@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- ((ushort *)iVar5)[0]
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(ushort *)iVar5
+ ((uw_object_hdr_t *)iVar5)->type_flags
|
- *(ushort *)(iVar5 + 0)
+ ((uw_object_hdr_t *)iVar5)->type_flags
)
...>
}

@word_12_1@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 2)
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- ((ushort *)iVar5)[1]
+ ((uw_object_hdr_t *)iVar5)->position_word
|
- *(ushort *)(iVar5 + 2)
+ ((uw_object_hdr_t *)iVar5)->position_word
)
...>
}

@word_12_2@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- ((ushort *)iVar5)[2]
+ ((uw_object_hdr_t *)iVar5)->chain_word
|
- *(ushort *)(iVar5 + 4)
+ ((uw_object_hdr_t *)iVar5)->chain_word
)
...>
}

@word_12_3@
type R;
identifier F =~ "^\(babl_builtin_identify_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5 + 6)
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- ((ushort *)iVar5)[3]
+ ((uw_object_hdr_t *)iVar5)->link_word
|
- *(ushort *)(iVar5 + 6)
+ ((uw_object_hdr_t *)iVar5)->link_word
)
...>
}

@word_13_0@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- ((ushort *)iVar2)[0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *(ushort *)iVar2
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}

@word_13_1@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 2)
+ ((uw_object_hdr_t *)iVar2)->position_word
|
- ((ushort *)iVar2)[1]
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}

@word_13_2@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
|
- ((ushort *)iVar2)[2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}

@word_13_3@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2 + 6)
+ ((uw_object_hdr_t *)iVar2)->link_word
|
- ((ushort *)iVar2)[3]
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}

@word_14_0@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((ushort *)iVar1)[0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}

@word_14_1@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((ushort *)iVar1)[1]
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}

@word_14_2@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((ushort *)iVar1)[2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}

@word_14_3@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((ushort *)iVar1)[3]
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}

@word_15_0@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- ((ushort *)iVar4)[0]
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *(ushort *)iVar4
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}

@word_15_1@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 2)
+ ((uw_object_hdr_t *)iVar4)->position_word
|
- ((ushort *)iVar4)[1]
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}

@word_15_2@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
|
- ((ushort *)iVar4)[2]
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}

@word_15_3@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar4 + 6)
+ ((uw_object_hdr_t *)iVar4)->link_word
|
- ((ushort *)iVar4)[3]
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}

@word_16_0@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
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
|
- puVar6[0]
+ ((uw_object_hdr_t *)puVar6)->type_flags
|
- *puVar6
+ ((uw_object_hdr_t *)puVar6)->type_flags
)
...>
}

@word_16_1@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
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
|
- puVar6[1]
+ ((uw_object_hdr_t *)puVar6)->position_word
)
...>
}

@word_16_2@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
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
|
- puVar6[2]
+ ((uw_object_hdr_t *)puVar6)->chain_word
)
...>
}

@word_16_3@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
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
|
- puVar6[3]
+ ((uw_object_hdr_t *)puVar6)->link_word
)
...>
}

@word_17_0@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 0)
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- ((ushort *)puVar14)[0]
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *(ushort *)puVar14
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- puVar14[0]
+ ((uw_object_hdr_t *)puVar14)->type_flags
|
- *puVar14
+ ((uw_object_hdr_t *)puVar14)->type_flags
)
...>
}

@word_17_1@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 2)
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- ((ushort *)puVar14)[1]
+ ((uw_object_hdr_t *)puVar14)->position_word
|
- puVar14[1]
+ ((uw_object_hdr_t *)puVar14)->position_word
)
...>
}

@word_17_2@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 4)
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- ((ushort *)puVar14)[2]
+ ((uw_object_hdr_t *)puVar14)->chain_word
|
- puVar14[2]
+ ((uw_object_hdr_t *)puVar14)->chain_word
)
...>
}

@word_17_3@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar14 + 6)
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- ((ushort *)puVar14)[3]
+ ((uw_object_hdr_t *)puVar14)->link_word
|
- puVar14[3]
+ ((uw_object_hdr_t *)puVar14)->link_word
)
...>
}

@word_18_0@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 0)
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- ((ushort *)puVar7)[0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *(ushort *)puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- puVar7[0]
+ ((uw_object_hdr_t *)puVar7)->type_flags
|
- *puVar7
+ ((uw_object_hdr_t *)puVar7)->type_flags
)
...>
}

@word_18_1@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 2)
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- ((ushort *)puVar7)[1]
+ ((uw_object_hdr_t *)puVar7)->position_word
|
- puVar7[1]
+ ((uw_object_hdr_t *)puVar7)->position_word
)
...>
}

@word_18_2@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 4)
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- ((ushort *)puVar7)[2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
|
- puVar7[2]
+ ((uw_object_hdr_t *)puVar7)->chain_word
)
...>
}

@word_18_3@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar7 + 6)
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- ((ushort *)puVar7)[3]
+ ((uw_object_hdr_t *)puVar7)->link_word
|
- puVar7[3]
+ ((uw_object_hdr_t *)puVar7)->link_word
)
...>
}

@word_19_0@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 0)
+ ((uw_object_hdr_t *)uVar9)->type_flags
|
- ((ushort *)uVar9)[0]
+ ((uw_object_hdr_t *)uVar9)->type_flags
|
- *(ushort *)uVar9
+ ((uw_object_hdr_t *)uVar9)->type_flags
|
- uVar9[0]
+ ((uw_object_hdr_t *)uVar9)->type_flags
|
- *uVar9
+ ((uw_object_hdr_t *)uVar9)->type_flags
)
...>
}

@word_19_1@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 2)
+ ((uw_object_hdr_t *)uVar9)->position_word
|
- ((ushort *)uVar9)[1]
+ ((uw_object_hdr_t *)uVar9)->position_word
|
- uVar9[1]
+ ((uw_object_hdr_t *)uVar9)->position_word
)
...>
}

@word_19_2@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 4)
+ ((uw_object_hdr_t *)uVar9)->chain_word
|
- ((ushort *)uVar9)[2]
+ ((uw_object_hdr_t *)uVar9)->chain_word
|
- uVar9[2]
+ ((uw_object_hdr_t *)uVar9)->chain_word
)
...>
}

@word_19_3@
type R;
identifier F =~ "^\(babl_builtin_setup_to_barter\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar9 + 6)
+ ((uw_object_hdr_t *)uVar9)->link_word
|
- ((ushort *)uVar9)[3]
+ ((uw_object_hdr_t *)uVar9)->link_word
|
- uVar9[3]
+ ((uw_object_hdr_t *)uVar9)->link_word
)
...>
}

@word_20_0@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 0)
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- ((ushort *)uVar1)[0]
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *(ushort *)uVar1
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- uVar1[0]
+ ((uw_object_hdr_t *)uVar1)->type_flags
|
- *uVar1
+ ((uw_object_hdr_t *)uVar1)->type_flags
)
...>
}

@word_20_1@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 2)
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- ((ushort *)uVar1)[1]
+ ((uw_object_hdr_t *)uVar1)->position_word
|
- uVar1[1]
+ ((uw_object_hdr_t *)uVar1)->position_word
)
...>
}

@word_20_2@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 4)
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- ((ushort *)uVar1)[2]
+ ((uw_object_hdr_t *)uVar1)->chain_word
|
- uVar1[2]
+ ((uw_object_hdr_t *)uVar1)->chain_word
)
...>
}

@word_20_3@
type R;
identifier F =~ "^\(end_barter_ui\|finalize_npc_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar1 + 6)
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- ((ushort *)uVar1)[3]
+ ((uw_object_hdr_t *)uVar1)->link_word
|
- uVar1[3]
+ ((uw_object_hdr_t *)uVar1)->link_word
)
...>
}

@word_23_0@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 0)
+ ((uw_object_hdr_t *)psVar6)->type_flags
|
- ((ushort *)psVar6)[0]
+ ((uw_object_hdr_t *)psVar6)->type_flags
|
- *(ushort *)psVar6
+ ((uw_object_hdr_t *)psVar6)->type_flags
)
...>
}

@word_23_1@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 2)
+ ((uw_object_hdr_t *)psVar6)->position_word
|
- ((ushort *)psVar6)[1]
+ ((uw_object_hdr_t *)psVar6)->position_word
)
...>
}

@word_23_2@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 4)
+ ((uw_object_hdr_t *)psVar6)->chain_word
|
- ((ushort *)psVar6)[2]
+ ((uw_object_hdr_t *)psVar6)->chain_word
)
...>
}

@word_23_3@
type R;
identifier F =~ "^\(redraw_barter_slot_icon\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar6 + 6)
+ ((uw_object_hdr_t *)psVar6)->link_word
|
- ((ushort *)psVar6)[3]
+ ((uw_object_hdr_t *)psVar6)->link_word
)
...>
}

@word_24_0@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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

@word_24_1@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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

@word_24_2@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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

@word_24_3@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
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

@word_25_0@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 0)
+ ((uw_object_hdr_t *)held_header)->type_flags
|
- ((ushort *)held_header)[0]
+ ((uw_object_hdr_t *)held_header)->type_flags
|
- *(ushort *)held_header
+ ((uw_object_hdr_t *)held_header)->type_flags
)
...>
}

@word_25_1@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 2)
+ ((uw_object_hdr_t *)held_header)->position_word
|
- ((ushort *)held_header)[1]
+ ((uw_object_hdr_t *)held_header)->position_word
)
...>
}

@word_25_2@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 4)
+ ((uw_object_hdr_t *)held_header)->chain_word
|
- ((ushort *)held_header)[2]
+ ((uw_object_hdr_t *)held_header)->chain_word
)
...>
}

@word_25_3@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_header + 6)
+ ((uw_object_hdr_t *)held_header)->link_word
|
- ((ushort *)held_header)[3]
+ ((uw_object_hdr_t *)held_header)->link_word
)
...>
}

@word_26_0@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 0)
+ ((uw_object_hdr_t *)held_object)->type_flags
|
- ((ushort *)held_object)[0]
+ ((uw_object_hdr_t *)held_object)->type_flags
|
- *(ushort *)held_object
+ ((uw_object_hdr_t *)held_object)->type_flags
|
- held_object[0]
+ ((uw_object_hdr_t *)held_object)->type_flags
|
- *held_object
+ ((uw_object_hdr_t *)held_object)->type_flags
)
...>
}

@word_26_1@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 2)
+ ((uw_object_hdr_t *)held_object)->position_word
|
- ((ushort *)held_object)[1]
+ ((uw_object_hdr_t *)held_object)->position_word
|
- held_object[1]
+ ((uw_object_hdr_t *)held_object)->position_word
)
...>
}

@word_26_2@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 4)
+ ((uw_object_hdr_t *)held_object)->chain_word
|
- ((ushort *)held_object)[2]
+ ((uw_object_hdr_t *)held_object)->chain_word
|
- held_object[2]
+ ((uw_object_hdr_t *)held_object)->chain_word
)
...>
}

@word_26_3@
type R;
identifier F =~ "^\(merge_or_swap_barter_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object + 6)
+ ((uw_object_hdr_t *)held_object)->link_word
|
- ((ushort *)held_object)[3]
+ ((uw_object_hdr_t *)held_object)->link_word
|
- held_object[3]
+ ((uw_object_hdr_t *)held_object)->link_word
)
...>
}

@word_27_0@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((ushort *)puVar2)[0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}

@word_27_1@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((ushort *)puVar2)[1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}

@word_27_2@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((ushort *)puVar2)[2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}

@word_27_3@
type R;
identifier F =~ "^\(finalize_player_barter_items\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((ushort *)puVar2)[3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}

@word_28_0@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- ((ushort *)puVar4)[0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *(ushort *)puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- puVar4[0]
+ ((uw_object_hdr_t *)puVar4)->type_flags
|
- *puVar4
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}

@word_28_1@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 2)
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- ((ushort *)puVar4)[1]
+ ((uw_object_hdr_t *)puVar4)->position_word
|
- puVar4[1]
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}

@word_28_2@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- ((ushort *)puVar4)[2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
|
- puVar4[2]
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}

@word_28_3@
type R;
identifier F =~ "^\(compute_barter_item_value\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar4 + 6)
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- ((ushort *)puVar4)[3]
+ ((uw_object_hdr_t *)puVar4)->link_word
|
- puVar4[3]
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}

@word_29_0@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- ((ushort *)puVar1)[0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *(ushort *)puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- puVar1[0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}

@word_29_1@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 2)
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- ((ushort *)puVar1)[1]
+ ((uw_object_hdr_t *)puVar1)->position_word
|
- puVar1[1]
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}

@word_29_2@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- ((ushort *)puVar1)[2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
|
- puVar1[2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}

@word_29_3@
type R;
identifier F =~ "^\(collect_included_player_barter_items\|remove_item_from_npc_inventory_by_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar1 + 6)
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- ((ushort *)puVar1)[3]
+ ((uw_object_hdr_t *)puVar1)->link_word
|
- puVar1[3]
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}

@word_30_0@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 0)
+ ((uw_object_hdr_t *)pvItem)->type_flags
|
- ((ushort *)pvItem)[0]
+ ((uw_object_hdr_t *)pvItem)->type_flags
|
- *(ushort *)pvItem
+ ((uw_object_hdr_t *)pvItem)->type_flags
|
- *(ushort *)(pvItem + 0)
+ ((uw_object_hdr_t *)pvItem)->type_flags
)
...>
}

@word_30_1@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 2)
+ ((uw_object_hdr_t *)pvItem)->position_word
|
- ((ushort *)pvItem)[1]
+ ((uw_object_hdr_t *)pvItem)->position_word
|
- *(ushort *)(pvItem + 2)
+ ((uw_object_hdr_t *)pvItem)->position_word
)
...>
}

@word_30_2@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 4)
+ ((uw_object_hdr_t *)pvItem)->chain_word
|
- ((ushort *)pvItem)[2]
+ ((uw_object_hdr_t *)pvItem)->chain_word
|
- *(ushort *)(pvItem + 4)
+ ((uw_object_hdr_t *)pvItem)->chain_word
)
...>
}

@word_30_3@
type R;
identifier F =~ "^\(give_barter_item_by_item_id\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvItem + 6)
+ ((uw_object_hdr_t *)pvItem)->link_word
|
- ((ushort *)pvItem)[3]
+ ((uw_object_hdr_t *)pvItem)->link_word
|
- *(ushort *)(pvItem + 6)
+ ((uw_object_hdr_t *)pvItem)->link_word
)
...>
}

@word_31_0@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 0)
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- ((ushort *)puVar2)[0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *(ushort *)puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- puVar2[0]
+ ((uw_object_hdr_t *)puVar2)->type_flags
|
- *puVar2
+ ((uw_object_hdr_t *)puVar2)->type_flags
)
...>
}

@word_31_1@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 2)
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- ((ushort *)puVar2)[1]
+ ((uw_object_hdr_t *)puVar2)->position_word
|
- puVar2[1]
+ ((uw_object_hdr_t *)puVar2)->position_word
)
...>
}

@word_31_2@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 4)
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- ((ushort *)puVar2)[2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
|
- puVar2[2]
+ ((uw_object_hdr_t *)puVar2)->chain_word
)
...>
}

@word_31_3@
type R;
identifier F =~ "^\(check_npc_item_preference\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar2 + 6)
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- ((ushort *)puVar2)[3]
+ ((uw_object_hdr_t *)puVar2)->link_word
|
- puVar2[3]
+ ((uw_object_hdr_t *)puVar2)->link_word
)
...>
}

@barter_click_word_0_0@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 0)
+ ((uw_object_hdr_t *)obj_rec)->type_flags
|
- ((ushort *)obj_rec)[0]
+ ((uw_object_hdr_t *)obj_rec)->type_flags
|
- *(ushort *)obj_rec
+ ((uw_object_hdr_t *)obj_rec)->type_flags
)
...>
}

@barter_click_word_0_1@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 2)
+ ((uw_object_hdr_t *)obj_rec)->position_word
|
- ((ushort *)obj_rec)[1]
+ ((uw_object_hdr_t *)obj_rec)->position_word
)
...>
}

@barter_click_word_0_2@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 4)
+ ((uw_object_hdr_t *)obj_rec)->chain_word
|
- ((ushort *)obj_rec)[2]
+ ((uw_object_hdr_t *)obj_rec)->chain_word
)
...>
}

@barter_click_word_0_3@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_rec + 6)
+ ((uw_object_hdr_t *)obj_rec)->link_word
|
- ((ushort *)obj_rec)[3]
+ ((uw_object_hdr_t *)obj_rec)->link_word
)
...>
}

@barter_click_word_1_0@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 0)
+ ((uw_object_hdr_t *)split_rec)->type_flags
|
- ((ushort *)split_rec)[0]
+ ((uw_object_hdr_t *)split_rec)->type_flags
|
- *(ushort *)split_rec
+ ((uw_object_hdr_t *)split_rec)->type_flags
)
...>
}

@barter_click_word_1_1@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 2)
+ ((uw_object_hdr_t *)split_rec)->position_word
|
- ((ushort *)split_rec)[1]
+ ((uw_object_hdr_t *)split_rec)->position_word
)
...>
}

@barter_click_word_1_2@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 4)
+ ((uw_object_hdr_t *)split_rec)->chain_word
|
- ((ushort *)split_rec)[2]
+ ((uw_object_hdr_t *)split_rec)->chain_word
)
...>
}

@barter_click_word_1_3@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)split_rec + 6)
+ ((uw_object_hdr_t *)split_rec)->link_word
|
- ((ushort *)split_rec)[3]
+ ((uw_object_hdr_t *)split_rec)->link_word
)
...>
}

@barter_click_word_2_0@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 0)
+ ((uw_object_hdr_t *)obj_ptr)->type_flags
|
- ((ushort *)obj_ptr)[0]
+ ((uw_object_hdr_t *)obj_ptr)->type_flags
|
- *(ushort *)obj_ptr
+ ((uw_object_hdr_t *)obj_ptr)->type_flags
)
...>
}

@barter_click_word_2_1@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 2)
+ ((uw_object_hdr_t *)obj_ptr)->position_word
|
- ((ushort *)obj_ptr)[1]
+ ((uw_object_hdr_t *)obj_ptr)->position_word
)
...>
}

@barter_click_word_2_2@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 4)
+ ((uw_object_hdr_t *)obj_ptr)->chain_word
|
- ((ushort *)obj_ptr)[2]
+ ((uw_object_hdr_t *)obj_ptr)->chain_word
)
...>
}

@barter_click_word_2_3@
type R;
identifier F =~ "^\(handle_barter_slot_click\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)obj_ptr + 6)
+ ((uw_object_hdr_t *)obj_ptr)->link_word
|
- ((ushort *)obj_ptr)[3]
+ ((uw_object_hdr_t *)obj_ptr)->link_word
)
...>
}

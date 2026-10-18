@word_0_0@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@word_1_1@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@word_1_2@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@word_1_3@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
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

@word_2_0@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 0)
+ ((uw_object_hdr_t *)held_object_ptr)->type_flags
|
- ((ushort *)held_object_ptr)[0]
+ ((uw_object_hdr_t *)held_object_ptr)->type_flags
|
- *(ushort *)held_object_ptr
+ ((uw_object_hdr_t *)held_object_ptr)->type_flags
|
- *(ushort *)(held_object_ptr + 0)
+ ((uw_object_hdr_t *)held_object_ptr)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 2)
+ ((uw_object_hdr_t *)held_object_ptr)->position_word
|
- ((ushort *)held_object_ptr)[1]
+ ((uw_object_hdr_t *)held_object_ptr)->position_word
|
- *(ushort *)(held_object_ptr + 2)
+ ((uw_object_hdr_t *)held_object_ptr)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 4)
+ ((uw_object_hdr_t *)held_object_ptr)->chain_word
|
- ((ushort *)held_object_ptr)[2]
+ ((uw_object_hdr_t *)held_object_ptr)->chain_word
|
- *(ushort *)(held_object_ptr + 4)
+ ((uw_object_hdr_t *)held_object_ptr)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(drop_held_object_near_player\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)held_object_ptr + 6)
+ ((uw_object_hdr_t *)held_object_ptr)->link_word
|
- ((ushort *)held_object_ptr)[3]
+ ((uw_object_hdr_t *)held_object_ptr)->link_word
|
- *(ushort *)(held_object_ptr + 6)
+ ((uw_object_hdr_t *)held_object_ptr)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@word_3_1@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@word_3_2@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@word_3_3@
type R;
identifier F =~ "^\(use_light_source\)$";
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

@word_4_0@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(begin_holding_object_on_cursor\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(refuel_light_source_item\)$";
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
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 0)
+ ((uw_object_hdr_t *)target)->type_flags
|
- ((ushort *)target)[0]
+ ((uw_object_hdr_t *)target)->type_flags
|
- *(ushort *)target
+ ((uw_object_hdr_t *)target)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 2)
+ ((uw_object_hdr_t *)target)->position_word
|
- ((ushort *)target)[1]
+ ((uw_object_hdr_t *)target)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 4)
+ ((uw_object_hdr_t *)target)->chain_word
|
- ((ushort *)target)[2]
+ ((uw_object_hdr_t *)target)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target + 6)
+ ((uw_object_hdr_t *)target)->link_word
|
- ((ushort *)target)[3]
+ ((uw_object_hdr_t *)target)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- ((ushort *)puVar8)[0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(ushort *)puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 2)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- ((ushort *)puVar8)[1]
+ ((uw_object_hdr_t *)puVar8)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 4)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- ((ushort *)puVar8)[2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 6)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- ((ushort *)puVar8)[3]
+ ((uw_object_hdr_t *)puVar8)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 0)
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- ((ushort *)found_item)[0]
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *(ushort *)found_item
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- found_item[0]
+ ((uw_object_hdr_t *)found_item)->type_flags
|
- *found_item
+ ((uw_object_hdr_t *)found_item)->type_flags
)
...>
}

@word_8_1@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 2)
+ ((uw_object_hdr_t *)found_item)->position_word
|
- ((ushort *)found_item)[1]
+ ((uw_object_hdr_t *)found_item)->position_word
|
- found_item[1]
+ ((uw_object_hdr_t *)found_item)->position_word
)
...>
}

@word_8_2@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 4)
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- ((ushort *)found_item)[2]
+ ((uw_object_hdr_t *)found_item)->chain_word
|
- found_item[2]
+ ((uw_object_hdr_t *)found_item)->chain_word
)
...>
}

@word_8_3@
type R;
identifier F =~ "^\(complete_use_item_scatter_spawn\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found_item + 6)
+ ((uw_object_hdr_t *)found_item)->link_word
|
- ((ushort *)found_item)[3]
+ ((uw_object_hdr_t *)found_item)->link_word
|
- found_item[3]
+ ((uw_object_hdr_t *)found_item)->link_word
)
...>
}

@word_9_0@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@word_9_1@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@word_9_2@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@word_9_3@
type R;
identifier F =~ "^\(handle_object_drop_target\|trigger_object_trap_or_use_action\)$";
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

@word_10_0@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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
|
- puVar5[0]
+ ((uw_object_hdr_t *)puVar5)->type_flags
|
- *puVar5
+ ((uw_object_hdr_t *)puVar5)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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
|
- puVar5[1]
+ ((uw_object_hdr_t *)puVar5)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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
|
- puVar5[2]
+ ((uw_object_hdr_t *)puVar5)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(check_offering_container_puzzle\|place_object_in_equipment_slot\)$";
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
|
- puVar5[3]
+ ((uw_object_hdr_t *)puVar5)->link_word
)
...>
}

@word_11_0@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 0)
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- ((ushort *)equip_object)[0]
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- *(ushort *)equip_object
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- equip_object[0]
+ ((uw_object_hdr_t *)equip_object)->type_flags
|
- *equip_object
+ ((uw_object_hdr_t *)equip_object)->type_flags
)
...>
}

@word_11_1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 2)
+ ((uw_object_hdr_t *)equip_object)->position_word
|
- ((ushort *)equip_object)[1]
+ ((uw_object_hdr_t *)equip_object)->position_word
|
- equip_object[1]
+ ((uw_object_hdr_t *)equip_object)->position_word
)
...>
}

@word_11_2@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 4)
+ ((uw_object_hdr_t *)equip_object)->chain_word
|
- ((ushort *)equip_object)[2]
+ ((uw_object_hdr_t *)equip_object)->chain_word
|
- equip_object[2]
+ ((uw_object_hdr_t *)equip_object)->chain_word
)
...>
}

@word_11_3@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equip_object + 6)
+ ((uw_object_hdr_t *)equip_object)->link_word
|
- ((ushort *)equip_object)[3]
+ ((uw_object_hdr_t *)equip_object)->link_word
|
- equip_object[3]
+ ((uw_object_hdr_t *)equip_object)->link_word
)
...>
}

@word_12_0@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@word_12_1@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@word_12_2@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@word_12_3@
type R;
identifier F =~ "^\(place_object_in_equipment_slot\)$";
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

@word_13_0@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 0)
+ ((uw_object_hdr_t *)object_a)->type_flags
|
- ((ushort *)object_a)[0]
+ ((uw_object_hdr_t *)object_a)->type_flags
|
- *(ushort *)object_a
+ ((uw_object_hdr_t *)object_a)->type_flags
)
...>
}

@word_13_1@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 2)
+ ((uw_object_hdr_t *)object_a)->position_word
|
- ((ushort *)object_a)[1]
+ ((uw_object_hdr_t *)object_a)->position_word
)
...>
}

@word_13_2@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 4)
+ ((uw_object_hdr_t *)object_a)->chain_word
|
- ((ushort *)object_a)[2]
+ ((uw_object_hdr_t *)object_a)->chain_word
)
...>
}

@word_13_3@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_a + 6)
+ ((uw_object_hdr_t *)object_a)->link_word
|
- ((ushort *)object_a)[3]
+ ((uw_object_hdr_t *)object_a)->link_word
)
...>
}

@word_14_0@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 0)
+ ((uw_object_hdr_t *)object_b)->type_flags
|
- ((ushort *)object_b)[0]
+ ((uw_object_hdr_t *)object_b)->type_flags
|
- *(ushort *)object_b
+ ((uw_object_hdr_t *)object_b)->type_flags
)
...>
}

@word_14_1@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 2)
+ ((uw_object_hdr_t *)object_b)->position_word
|
- ((ushort *)object_b)[1]
+ ((uw_object_hdr_t *)object_b)->position_word
)
...>
}

@word_14_2@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 4)
+ ((uw_object_hdr_t *)object_b)->chain_word
|
- ((ushort *)object_b)[2]
+ ((uw_object_hdr_t *)object_b)->chain_word
)
...>
}

@word_14_3@
type R;
identifier F =~ "^\(objects_can_stack\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_b + 6)
+ ((uw_object_hdr_t *)object_b)->link_word
|
- ((ushort *)object_b)[3]
+ ((uw_object_hdr_t *)object_b)->link_word
)
...>
}

@word_15_0@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 0)
+ ((uw_object_hdr_t *)local_1c)->type_flags
|
- ((ushort *)local_1c)[0]
+ ((uw_object_hdr_t *)local_1c)->type_flags
|
- *(ushort *)local_1c
+ ((uw_object_hdr_t *)local_1c)->type_flags
|
- *(ushort *)(local_1c + 0)
+ ((uw_object_hdr_t *)local_1c)->type_flags
)
...>
}

@word_15_1@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 2)
+ ((uw_object_hdr_t *)local_1c)->position_word
|
- ((ushort *)local_1c)[1]
+ ((uw_object_hdr_t *)local_1c)->position_word
|
- *(ushort *)(local_1c + 2)
+ ((uw_object_hdr_t *)local_1c)->position_word
)
...>
}

@word_15_2@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 4)
+ ((uw_object_hdr_t *)local_1c)->chain_word
|
- ((ushort *)local_1c)[2]
+ ((uw_object_hdr_t *)local_1c)->chain_word
|
- *(ushort *)(local_1c + 4)
+ ((uw_object_hdr_t *)local_1c)->chain_word
)
...>
}

@word_15_3@
type R;
identifier F =~ "^\(find_object_in_link_chain\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_1c + 6)
+ ((uw_object_hdr_t *)local_1c)->link_word
|
- ((ushort *)local_1c)[3]
+ ((uw_object_hdr_t *)local_1c)->link_word
|
- *(ushort *)(local_1c + 6)
+ ((uw_object_hdr_t *)local_1c)->link_word
)
...>
}

@word_16_0@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_16_1@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_16_2@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_16_3@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_17_0@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_17_1@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_17_2@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_17_3@
type R;
identifier F =~ "^\(reduce_object_count\)$";
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

@word_18_0@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 0)
+ ((uw_object_hdr_t *)stack_object)->type_flags
|
- ((ushort *)stack_object)[0]
+ ((uw_object_hdr_t *)stack_object)->type_flags
|
- *(ushort *)stack_object
+ ((uw_object_hdr_t *)stack_object)->type_flags
|
- stack_object[0]
+ ((uw_object_hdr_t *)stack_object)->type_flags
|
- *stack_object
+ ((uw_object_hdr_t *)stack_object)->type_flags
)
...>
}

@word_18_1@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 2)
+ ((uw_object_hdr_t *)stack_object)->position_word
|
- ((ushort *)stack_object)[1]
+ ((uw_object_hdr_t *)stack_object)->position_word
|
- stack_object[1]
+ ((uw_object_hdr_t *)stack_object)->position_word
)
...>
}

@word_18_2@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 4)
+ ((uw_object_hdr_t *)stack_object)->chain_word
|
- ((ushort *)stack_object)[2]
+ ((uw_object_hdr_t *)stack_object)->chain_word
|
- stack_object[2]
+ ((uw_object_hdr_t *)stack_object)->chain_word
)
...>
}

@word_18_3@
type R;
identifier F =~ "^\(reduce_object_count\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)stack_object + 6)
+ ((uw_object_hdr_t *)stack_object)->link_word
|
- ((ushort *)stack_object)[3]
+ ((uw_object_hdr_t *)stack_object)->link_word
|
- stack_object[3]
+ ((uw_object_hdr_t *)stack_object)->link_word
)
...>
}

@word_19_0@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@word_19_1@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@word_19_2@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@word_19_3@
type R;
identifier F =~ "^\(extract_clicked_backpack_item\|handle_object_drop_target\)$";
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

@word_20_0@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 0)
+ ((uw_object_hdr_t *)pbVar10)->type_flags
|
- ((ushort *)pbVar10)[0]
+ ((uw_object_hdr_t *)pbVar10)->type_flags
|
- *(ushort *)pbVar10
+ ((uw_object_hdr_t *)pbVar10)->type_flags
)
...>
}

@word_20_1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 2)
+ ((uw_object_hdr_t *)pbVar10)->position_word
|
- ((ushort *)pbVar10)[1]
+ ((uw_object_hdr_t *)pbVar10)->position_word
)
...>
}

@word_20_2@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 4)
+ ((uw_object_hdr_t *)pbVar10)->chain_word
|
- ((ushort *)pbVar10)[2]
+ ((uw_object_hdr_t *)pbVar10)->chain_word
)
...>
}

@word_20_3@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar10 + 6)
+ ((uw_object_hdr_t *)pbVar10)->link_word
|
- ((ushort *)pbVar10)[3]
+ ((uw_object_hdr_t *)pbVar10)->link_word
)
...>
}

@word_21_0@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 0)
+ ((uw_object_hdr_t *)local_28)->type_flags
|
- ((ushort *)local_28)[0]
+ ((uw_object_hdr_t *)local_28)->type_flags
|
- *(ushort *)local_28
+ ((uw_object_hdr_t *)local_28)->type_flags
|
- *(ushort *)(local_28 + 0)
+ ((uw_object_hdr_t *)local_28)->type_flags
)
...>
}

@word_21_1@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 2)
+ ((uw_object_hdr_t *)local_28)->position_word
|
- ((ushort *)local_28)[1]
+ ((uw_object_hdr_t *)local_28)->position_word
|
- *(ushort *)(local_28 + 2)
+ ((uw_object_hdr_t *)local_28)->position_word
)
...>
}

@word_21_2@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 4)
+ ((uw_object_hdr_t *)local_28)->chain_word
|
- ((ushort *)local_28)[2]
+ ((uw_object_hdr_t *)local_28)->chain_word
|
- *(ushort *)(local_28 + 4)
+ ((uw_object_hdr_t *)local_28)->chain_word
)
...>
}

@word_21_3@
type R;
identifier F =~ "^\(extract_matching_object_from_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)local_28 + 6)
+ ((uw_object_hdr_t *)local_28)->link_word
|
- ((ushort *)local_28)[3]
+ ((uw_object_hdr_t *)local_28)->link_word
|
- *(ushort *)(local_28 + 6)
+ ((uw_object_hdr_t *)local_28)->link_word
)
...>
}

@word_22_0@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- ((ushort *)pbVar1)[0]
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(ushort *)pbVar1
+ ((uw_object_hdr_t *)pbVar1)->type_flags
|
- *(ushort *)(pbVar1 + 0)
+ ((uw_object_hdr_t *)pbVar1)->type_flags
)
...>
}

@word_22_1@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- ((ushort *)pbVar1)[1]
+ ((uw_object_hdr_t *)pbVar1)->position_word
|
- *(ushort *)(pbVar1 + 2)
+ ((uw_object_hdr_t *)pbVar1)->position_word
)
...>
}

@word_22_2@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- ((ushort *)pbVar1)[2]
+ ((uw_object_hdr_t *)pbVar1)->chain_word
|
- *(ushort *)(pbVar1 + 4)
+ ((uw_object_hdr_t *)pbVar1)->chain_word
)
...>
}

@word_22_3@
type R;
identifier F =~ "^\(redraw_armor_overlay_widgets\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar1 + 6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- ((ushort *)pbVar1)[3]
+ ((uw_object_hdr_t *)pbVar1)->link_word
|
- *(ushort *)(pbVar1 + 6)
+ ((uw_object_hdr_t *)pbVar1)->link_word
)
...>
}

@word_23_0@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 0)
+ ((uw_object_hdr_t *)slot_item)->type_flags
|
- ((ushort *)slot_item)[0]
+ ((uw_object_hdr_t *)slot_item)->type_flags
|
- *(ushort *)slot_item
+ ((uw_object_hdr_t *)slot_item)->type_flags
|
- *(ushort *)(slot_item + 0)
+ ((uw_object_hdr_t *)slot_item)->type_flags
)
...>
}

@word_23_1@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 2)
+ ((uw_object_hdr_t *)slot_item)->position_word
|
- ((ushort *)slot_item)[1]
+ ((uw_object_hdr_t *)slot_item)->position_word
|
- *(ushort *)(slot_item + 2)
+ ((uw_object_hdr_t *)slot_item)->position_word
)
...>
}

@word_23_2@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 4)
+ ((uw_object_hdr_t *)slot_item)->chain_word
|
- ((ushort *)slot_item)[2]
+ ((uw_object_hdr_t *)slot_item)->chain_word
|
- *(ushort *)(slot_item + 4)
+ ((uw_object_hdr_t *)slot_item)->chain_word
)
...>
}

@word_23_3@
type R;
identifier F =~ "^\(swap_cursor_and_slot_item\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)slot_item + 6)
+ ((uw_object_hdr_t *)slot_item)->link_word
|
- ((ushort *)slot_item)[3]
+ ((uw_object_hdr_t *)slot_item)->link_word
|
- *(ushort *)(slot_item + 6)
+ ((uw_object_hdr_t *)slot_item)->link_word
)
...>
}

@word_24_0@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 0)
+ ((uw_object_hdr_t *)pack_object)->type_flags
|
- ((ushort *)pack_object)[0]
+ ((uw_object_hdr_t *)pack_object)->type_flags
|
- *(ushort *)pack_object
+ ((uw_object_hdr_t *)pack_object)->type_flags
|
- pack_object[0]
+ ((uw_object_hdr_t *)pack_object)->type_flags
|
- *pack_object
+ ((uw_object_hdr_t *)pack_object)->type_flags
)
...>
}

@word_24_1@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 2)
+ ((uw_object_hdr_t *)pack_object)->position_word
|
- ((ushort *)pack_object)[1]
+ ((uw_object_hdr_t *)pack_object)->position_word
|
- pack_object[1]
+ ((uw_object_hdr_t *)pack_object)->position_word
)
...>
}

@word_24_2@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 4)
+ ((uw_object_hdr_t *)pack_object)->chain_word
|
- ((ushort *)pack_object)[2]
+ ((uw_object_hdr_t *)pack_object)->chain_word
|
- pack_object[2]
+ ((uw_object_hdr_t *)pack_object)->chain_word
)
...>
}

@word_24_3@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pack_object + 6)
+ ((uw_object_hdr_t *)pack_object)->link_word
|
- ((ushort *)pack_object)[3]
+ ((uw_object_hdr_t *)pack_object)->link_word
|
- pack_object[3]
+ ((uw_object_hdr_t *)pack_object)->link_word
)
...>
}

@word_25_0@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- *(ushort *)(iVar4 + 0)
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}

@word_25_1@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- *(ushort *)(iVar4 + 2)
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}

@word_25_2@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- *(ushort *)(iVar4 + 4)
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}

@word_25_3@
type R;
identifier F =~ "^\(place_object_in_backpack_slot\)$";
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
|
- *(ushort *)(iVar4 + 6)
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}

@word_26_0@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- puVar3[0]
+ ((uw_object_hdr_t *)puVar3)->type_flags
|
- *puVar3
+ ((uw_object_hdr_t *)puVar3)->type_flags
)
...>
}

@word_26_1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- puVar3[1]
+ ((uw_object_hdr_t *)puVar3)->position_word
)
...>
}

@word_26_2@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- puVar3[2]
+ ((uw_object_hdr_t *)puVar3)->chain_word
)
...>
}

@word_26_3@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- puVar3[3]
+ ((uw_object_hdr_t *)puVar3)->link_word
)
...>
}

@word_27_0@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- iVar4[0]
+ ((uw_object_hdr_t *)iVar4)->type_flags
|
- *iVar4
+ ((uw_object_hdr_t *)iVar4)->type_flags
)
...>
}

@word_27_1@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- iVar4[1]
+ ((uw_object_hdr_t *)iVar4)->position_word
)
...>
}

@word_27_2@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- iVar4[2]
+ ((uw_object_hdr_t *)iVar4)->chain_word
)
...>
}

@word_27_3@
type R;
identifier F =~ "^\(find_or_assign_object_widget\)$";
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
|
- iVar4[3]
+ ((uw_object_hdr_t *)iVar4)->link_word
)
...>
}

@word_28_0@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 0)
+ ((uw_object_hdr_t *)header)->type_flags
|
- ((ushort *)header)[0]
+ ((uw_object_hdr_t *)header)->type_flags
|
- *(ushort *)header
+ ((uw_object_hdr_t *)header)->type_flags
)
...>
}

@word_28_1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 2)
+ ((uw_object_hdr_t *)header)->position_word
|
- ((ushort *)header)[1]
+ ((uw_object_hdr_t *)header)->position_word
)
...>
}

@word_28_2@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 4)
+ ((uw_object_hdr_t *)header)->chain_word
|
- ((ushort *)header)[2]
+ ((uw_object_hdr_t *)header)->chain_word
)
...>
}

@word_28_3@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)header + 6)
+ ((uw_object_hdr_t *)header)->link_word
|
- ((ushort *)header)[3]
+ ((uw_object_hdr_t *)header)->link_word
)
...>
}

@word_29_0@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 0)
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- ((ushort *)puVar11)[0]
+ ((uw_object_hdr_t *)puVar11)->type_flags
|
- *(ushort *)puVar11
+ ((uw_object_hdr_t *)puVar11)->type_flags
)
...>
}

@word_29_1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 2)
+ ((uw_object_hdr_t *)puVar11)->position_word
|
- ((ushort *)puVar11)[1]
+ ((uw_object_hdr_t *)puVar11)->position_word
)
...>
}

@word_29_2@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 4)
+ ((uw_object_hdr_t *)puVar11)->chain_word
|
- ((ushort *)puVar11)[2]
+ ((uw_object_hdr_t *)puVar11)->chain_word
)
...>
}

@word_29_3@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar11 + 6)
+ ((uw_object_hdr_t *)puVar11)->link_word
|
- ((ushort *)puVar11)[3]
+ ((uw_object_hdr_t *)puVar11)->link_word
)
...>
}

@word_30_0@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 0)
+ ((uw_object_hdr_t *)pbVar13)->type_flags
|
- ((ushort *)pbVar13)[0]
+ ((uw_object_hdr_t *)pbVar13)->type_flags
|
- *(ushort *)pbVar13
+ ((uw_object_hdr_t *)pbVar13)->type_flags
)
...>
}

@word_30_1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 2)
+ ((uw_object_hdr_t *)pbVar13)->position_word
|
- ((ushort *)pbVar13)[1]
+ ((uw_object_hdr_t *)pbVar13)->position_word
)
...>
}

@word_30_2@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 4)
+ ((uw_object_hdr_t *)pbVar13)->chain_word
|
- ((ushort *)pbVar13)[2]
+ ((uw_object_hdr_t *)pbVar13)->chain_word
)
...>
}

@word_30_3@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar13 + 6)
+ ((uw_object_hdr_t *)pbVar13)->link_word
|
- ((ushort *)pbVar13)[3]
+ ((uw_object_hdr_t *)pbVar13)->link_word
)
...>
}

@word_31_0@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)object
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}

@word_31_1@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[1]
+ ((uw_object_hdr_t *)object)->position_word
|
- object[1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}

@word_31_2@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}

@word_31_3@
type R;
identifier F =~ "^\(check_object_fits_in_slot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[3]
+ ((uw_object_hdr_t *)object)->link_word
|
- object[3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}

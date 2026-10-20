@word_0_0@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
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

@word_0_1@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
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

@word_0_2@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
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

@word_0_3@
type R;
identifier F =~ "^\(roll_container_lockpick_check\)$";
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

@word_1_0@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- ((ushort *)pbVar3)[0]
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)pbVar3
+ ((uw_object_hdr_t *)pbVar3)->type_flags
|
- *(ushort *)(pbVar3 + 0)
+ ((uw_object_hdr_t *)pbVar3)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- ((ushort *)pbVar3)[1]
+ ((uw_object_hdr_t *)pbVar3)->position_word
|
- *(ushort *)(pbVar3 + 2)
+ ((uw_object_hdr_t *)pbVar3)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- ((ushort *)pbVar3)[2]
+ ((uw_object_hdr_t *)pbVar3)->chain_word
|
- *(ushort *)(pbVar3 + 4)
+ ((uw_object_hdr_t *)pbVar3)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar3 + 6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- ((ushort *)pbVar3)[3]
+ ((uw_object_hdr_t *)pbVar3)->link_word
|
- *(ushort *)(pbVar3 + 6)
+ ((uw_object_hdr_t *)pbVar3)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((ushort *)pbVar4)[0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)(pbVar4 + 0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((ushort *)pbVar4)[1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)(pbVar4 + 2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((ushort *)pbVar4)[2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)(pbVar4 + 4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((ushort *)pbVar4)[3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)(pbVar4 + 6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags
|
- ((ushort *)pbVar7)[0]
+ ((uw_object_hdr_t *)pbVar7)->type_flags
|
- *(ushort *)pbVar7
+ ((uw_object_hdr_t *)pbVar7)->type_flags
|
- *(ushort *)(pbVar7 + 0)
+ ((uw_object_hdr_t *)pbVar7)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 2)
+ ((uw_object_hdr_t *)pbVar7)->position_word
|
- ((ushort *)pbVar7)[1]
+ ((uw_object_hdr_t *)pbVar7)->position_word
|
- *(ushort *)(pbVar7 + 2)
+ ((uw_object_hdr_t *)pbVar7)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word
|
- ((ushort *)pbVar7)[2]
+ ((uw_object_hdr_t *)pbVar7)->chain_word
|
- *(ushort *)(pbVar7 + 4)
+ ((uw_object_hdr_t *)pbVar7)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(roll_container_trap_disarm_check\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar7 + 6)
+ ((uw_object_hdr_t *)pbVar7)->link_word
|
- ((ushort *)pbVar7)[3]
+ ((uw_object_hdr_t *)pbVar7)->link_word
|
- *(ushort *)(pbVar7 + 6)
+ ((uw_object_hdr_t *)pbVar7)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
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

@word_4_1@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
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

@word_4_2@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
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

@word_4_3@
type R;
identifier F =~ "^\(resolve_skill_gated_unlock_or_use\)$";
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
identifier F =~ "^\(pick_object_under_cursor\)$";
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

@word_6_1@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
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

@word_6_2@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
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

@word_6_3@
type R;
identifier F =~ "^\(pick_object_under_cursor\)$";
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

@linked_word_0_0@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
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
)
...>
}

@linked_word_0_1@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
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
)
...>
}

@linked_word_0_2@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
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
)
...>
}

@linked_word_0_3@
type R;
identifier F =~ "^\(purge_tagged_objects_from_chain\)$";
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
)
...>
}

@barter_click_word_0_0@
type R;
identifier F =~ "^\(interact_default\)$";
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

@barter_click_word_0_1@
type R;
identifier F =~ "^\(interact_default\)$";
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

@barter_click_word_0_2@
type R;
identifier F =~ "^\(interact_default\)$";
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

@barter_click_word_0_3@
type R;
identifier F =~ "^\(interact_default\)$";
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

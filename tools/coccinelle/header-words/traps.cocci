@word_0_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_record + 0)
+ ((uw_object_hdr_t *)trap_record)->type_flags
|
- ((ushort *)trap_record)[0]
+ ((uw_object_hdr_t *)trap_record)->type_flags
|
- *(ushort *)trap_record
+ ((uw_object_hdr_t *)trap_record)->type_flags
|
- trap_record[0]
+ ((uw_object_hdr_t *)trap_record)->type_flags
|
- *trap_record
+ ((uw_object_hdr_t *)trap_record)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_record + 2)
+ ((uw_object_hdr_t *)trap_record)->position_word
|
- ((ushort *)trap_record)[1]
+ ((uw_object_hdr_t *)trap_record)->position_word
|
- trap_record[1]
+ ((uw_object_hdr_t *)trap_record)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_record + 4)
+ ((uw_object_hdr_t *)trap_record)->chain_word
|
- ((ushort *)trap_record)[2]
+ ((uw_object_hdr_t *)trap_record)->chain_word
|
- trap_record[2]
+ ((uw_object_hdr_t *)trap_record)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_record + 6)
+ ((uw_object_hdr_t *)trap_record)->link_word
|
- ((ushort *)trap_record)[3]
+ ((uw_object_hdr_t *)trap_record)->link_word
|
- trap_record[3]
+ ((uw_object_hdr_t *)trap_record)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
|
- puVar8[0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
|
- puVar8[1]
+ ((uw_object_hdr_t *)puVar8)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
|
- puVar8[2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
|
- puVar8[3]
+ ((uw_object_hdr_t *)puVar8)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
- *(ushort *)(puVar9 + 0)
+ ((uw_object_hdr_t *)puVar9)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
- *(ushort *)(puVar9 + 2)
+ ((uw_object_hdr_t *)puVar9)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
- *(ushort *)(puVar9 + 4)
+ ((uw_object_hdr_t *)puVar9)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
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
- *(ushort *)(puVar9 + 6)
+ ((uw_object_hdr_t *)puVar9)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- ((ushort *)puVar10)[0]
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(ushort *)puVar10
+ ((uw_object_hdr_t *)puVar10)->type_flags
|
- *(ushort *)(puVar10 + 0)
+ ((uw_object_hdr_t *)puVar10)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 2)
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- ((ushort *)puVar10)[1]
+ ((uw_object_hdr_t *)puVar10)->position_word
|
- *(ushort *)(puVar10 + 2)
+ ((uw_object_hdr_t *)puVar10)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- ((ushort *)puVar10)[2]
+ ((uw_object_hdr_t *)puVar10)->chain_word
|
- *(ushort *)(puVar10 + 4)
+ ((uw_object_hdr_t *)puVar10)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar10 + 6)
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- ((ushort *)puVar10)[3]
+ ((uw_object_hdr_t *)puVar10)->link_word
|
- *(ushort *)(puVar10 + 6)
+ ((uw_object_hdr_t *)puVar10)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 0)
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- ((ushort *)_case8_p1)[0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *(ushort *)_case8_p1
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- _case8_p1[0]
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
|
- *_case8_p1
+ ((uw_object_hdr_t *)_case8_p1)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 2)
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- ((ushort *)_case8_p1)[1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word
|
- _case8_p1[1]
+ ((uw_object_hdr_t *)_case8_p1)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 4)
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- ((ushort *)_case8_p1)[2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
|
- _case8_p1[2]
+ ((uw_object_hdr_t *)_case8_p1)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p1 + 6)
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- ((ushort *)_case8_p1)[3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word
|
- _case8_p1[3]
+ ((uw_object_hdr_t *)_case8_p1)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- ((ushort *)equipped_item)[0]
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(ushort *)equipped_item
+ ((uw_object_hdr_t *)equipped_item)->type_flags
|
- *(ushort *)(equipped_item + 0)
+ ((uw_object_hdr_t *)equipped_item)->type_flags
)
...>
}

@word_5_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- ((ushort *)equipped_item)[1]
+ ((uw_object_hdr_t *)equipped_item)->position_word
|
- *(ushort *)(equipped_item + 2)
+ ((uw_object_hdr_t *)equipped_item)->position_word
)
...>
}

@word_5_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- ((ushort *)equipped_item)[2]
+ ((uw_object_hdr_t *)equipped_item)->chain_word
|
- *(ushort *)(equipped_item + 4)
+ ((uw_object_hdr_t *)equipped_item)->chain_word
)
...>
}

@word_5_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)equipped_item + 6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- ((ushort *)equipped_item)[3]
+ ((uw_object_hdr_t *)equipped_item)->link_word
|
- *(ushort *)(equipped_item + 6)
+ ((uw_object_hdr_t *)equipped_item)->link_word
)
...>
}

@word_6_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- ((ushort *)linked_obj)[0]
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- *(ushort *)linked_obj
+ ((uw_object_hdr_t *)linked_obj)->type_flags
|
- *(ushort *)(linked_obj + 0)
+ ((uw_object_hdr_t *)linked_obj)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 2)
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- ((ushort *)linked_obj)[1]
+ ((uw_object_hdr_t *)linked_obj)->position_word
|
- *(ushort *)(linked_obj + 2)
+ ((uw_object_hdr_t *)linked_obj)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- ((ushort *)linked_obj)[2]
+ ((uw_object_hdr_t *)linked_obj)->chain_word
|
- *(ushort *)(linked_obj + 4)
+ ((uw_object_hdr_t *)linked_obj)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)linked_obj + 6)
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- ((ushort *)linked_obj)[3]
+ ((uw_object_hdr_t *)linked_obj)->link_word
|
- *(ushort *)(linked_obj + 6)
+ ((uw_object_hdr_t *)linked_obj)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 0)
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- ((ushort *)_case8_p2)[0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *(ushort *)_case8_p2
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- _case8_p2[0]
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
|
- *_case8_p2
+ ((uw_object_hdr_t *)_case8_p2)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 2)
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- ((ushort *)_case8_p2)[1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word
|
- _case8_p2[1]
+ ((uw_object_hdr_t *)_case8_p2)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 4)
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- ((ushort *)_case8_p2)[2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
|
- _case8_p2[2]
+ ((uw_object_hdr_t *)_case8_p2)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(dispatch_trap_type_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_case8_p2 + 6)
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- ((ushort *)_case8_p2)[3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word
|
- _case8_p2[3]
+ ((uw_object_hdr_t *)_case8_p2)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@word_8_1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@word_8_2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@word_8_3@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\|remove_trap_chain_marker\)$";
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

@word_9_0@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@word_9_1@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@word_9_2@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@word_9_3@
type R;
identifier F =~ "^\(create_scripted_trap_pair_at_tile\)$";
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

@word_10_0@
type R;
identifier F =~ "^\(remove_trap_chain_marker\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_object + 0)
+ ((uw_object_hdr_t *)trap_object)->type_flags
|
- ((ushort *)trap_object)[0]
+ ((uw_object_hdr_t *)trap_object)->type_flags
|
- *(ushort *)trap_object
+ ((uw_object_hdr_t *)trap_object)->type_flags
|
- *(ushort *)(trap_object + 0)
+ ((uw_object_hdr_t *)trap_object)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(remove_trap_chain_marker\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_object + 2)
+ ((uw_object_hdr_t *)trap_object)->position_word
|
- ((ushort *)trap_object)[1]
+ ((uw_object_hdr_t *)trap_object)->position_word
|
- *(ushort *)(trap_object + 2)
+ ((uw_object_hdr_t *)trap_object)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(remove_trap_chain_marker\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_object + 4)
+ ((uw_object_hdr_t *)trap_object)->chain_word
|
- ((ushort *)trap_object)[2]
+ ((uw_object_hdr_t *)trap_object)->chain_word
|
- *(ushort *)(trap_object + 4)
+ ((uw_object_hdr_t *)trap_object)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(remove_trap_chain_marker\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)trap_object + 6)
+ ((uw_object_hdr_t *)trap_object)->link_word
|
- ((ushort *)trap_object)[3]
+ ((uw_object_hdr_t *)trap_object)->link_word
|
- *(ushort *)(trap_object + 6)
+ ((uw_object_hdr_t *)trap_object)->link_word
)
...>
}

@word_13_0@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@word_13_1@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@word_13_2@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@word_13_3@
type R;
identifier F =~ "^\(tick_ambient_doors_and_scheduler\)$";
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

@word_14_0@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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
|
- *(ushort *)(iVar2 + 0)
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}

@word_14_1@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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
|
- *(ushort *)(iVar2 + 2)
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}

@word_14_2@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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
|
- *(ushort *)(iVar2 + 4)
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}

@word_14_3@
type R;
identifier F =~ "^\(apply_poison_or_damage_trap_effect\|trigger_exploding_book_trap\|trigger_exploding_book_trap_at_tile\)$";
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
|
- *(ushort *)(iVar2 + 6)
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}

@word_15_0@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 0)
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- ((ushort *)pNew)[0]
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(ushort *)pNew
+ ((uw_object_hdr_t *)pNew)->type_flags
|
- *(ushort *)(pNew + 0)
+ ((uw_object_hdr_t *)pNew)->type_flags
)
...>
}

@word_15_1@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 2)
+ ((uw_object_hdr_t *)pNew)->position_word
|
- ((ushort *)pNew)[1]
+ ((uw_object_hdr_t *)pNew)->position_word
|
- *(ushort *)(pNew + 2)
+ ((uw_object_hdr_t *)pNew)->position_word
)
...>
}

@word_15_2@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 4)
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- ((ushort *)pNew)[2]
+ ((uw_object_hdr_t *)pNew)->chain_word
|
- *(ushort *)(pNew + 4)
+ ((uw_object_hdr_t *)pNew)->chain_word
)
...>
}

@word_15_3@
type R;
identifier F =~ "^\(try_combine_shrine_markers\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNew + 6)
+ ((uw_object_hdr_t *)pNew)->link_word
|
- ((ushort *)pNew)[3]
+ ((uw_object_hdr_t *)pNew)->link_word
|
- *(ushort *)(pNew + 6)
+ ((uw_object_hdr_t *)pNew)->link_word
)
...>
}

@word_16_0@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)record + 0)
+ ((uw_object_hdr_t *)record)->type_flags
|
- ((ushort *)record)[0]
+ ((uw_object_hdr_t *)record)->type_flags
|
- *(ushort *)record
+ ((uw_object_hdr_t *)record)->type_flags
|
- *(ushort *)(record + 0)
+ ((uw_object_hdr_t *)record)->type_flags
)
...>
}

@word_16_1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)record + 2)
+ ((uw_object_hdr_t *)record)->position_word
|
- ((ushort *)record)[1]
+ ((uw_object_hdr_t *)record)->position_word
|
- *(ushort *)(record + 2)
+ ((uw_object_hdr_t *)record)->position_word
)
...>
}

@word_16_2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)record + 4)
+ ((uw_object_hdr_t *)record)->chain_word
|
- ((ushort *)record)[2]
+ ((uw_object_hdr_t *)record)->chain_word
|
- *(ushort *)(record + 4)
+ ((uw_object_hdr_t *)record)->chain_word
)
...>
}

@word_16_3@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)record + 6)
+ ((uw_object_hdr_t *)record)->link_word
|
- ((ushort *)record)[3]
+ ((uw_object_hdr_t *)record)->link_word
|
- *(ushort *)(record + 6)
+ ((uw_object_hdr_t *)record)->link_word
)
...>
}

@word_17_0@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@word_17_1@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@word_17_2@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@word_17_3@
type R;
identifier F =~ "^\(apply_quest_event_numeric_effect\)$";
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

@word_18_0@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@word_18_1@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@word_18_2@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@word_18_3@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
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

@word_19_0@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@word_20_1@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@word_20_2@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@word_20_3@
type R;
identifier F =~ "^\(trigger_quest_milestone_cleanup_event\)$";
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

@consumer_word_0_0@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- ((ushort *)pObj)[0]
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(ushort *)pObj
+ ((uw_object_hdr_t *)pObj)->type_flags
)
...>
}

@consumer_word_0_1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 2)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- ((ushort *)pObj)[1]
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}

@consumer_word_0_2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 4)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- ((ushort *)pObj)[2]
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}

@consumer_word_0_3@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 6)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- ((ushort *)pObj)[3]
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}

@consumer_word_1_0@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- ((ushort *)pbVar5)[0]
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(ushort *)pbVar5
+ ((uw_object_hdr_t *)pbVar5)->type_flags
|
- *(ushort *)(pbVar5 + 0)
+ ((uw_object_hdr_t *)pbVar5)->type_flags
)
...>
}

@consumer_word_1_1@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- ((ushort *)pbVar5)[1]
+ ((uw_object_hdr_t *)pbVar5)->position_word
|
- *(ushort *)(pbVar5 + 2)
+ ((uw_object_hdr_t *)pbVar5)->position_word
)
...>
}

@consumer_word_1_2@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- ((ushort *)pbVar5)[2]
+ ((uw_object_hdr_t *)pbVar5)->chain_word
|
- *(ushort *)(pbVar5 + 4)
+ ((uw_object_hdr_t *)pbVar5)->chain_word
)
...>
}

@consumer_word_1_3@
type R;
identifier F =~ "^\(process_nearby_background_traps\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar5 + 6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- ((ushort *)pbVar5)[3]
+ ((uw_object_hdr_t *)pbVar5)->link_word
|
- *(ushort *)(pbVar5 + 6)
+ ((uw_object_hdr_t *)pbVar5)->link_word
)
...>
}

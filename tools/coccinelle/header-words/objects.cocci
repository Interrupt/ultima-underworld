@word_0_0@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@word_0_1@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@word_0_2@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@word_0_3@
type R;
identifier F =~ "^\(spawn_object_near_player\)$";
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

@word_1_0@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- ((ushort *)object_ptr)[0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(ushort *)object_ptr
+ ((uw_object_hdr_t *)object_ptr)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- ((ushort *)object_ptr)[1]
+ ((uw_object_hdr_t *)object_ptr)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- ((ushort *)object_ptr)[2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(free_object_slot\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- ((ushort *)object_ptr)[3]
+ ((uw_object_hdr_t *)object_ptr)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 0)
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 2)
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 4)
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(encode_object_slot_index\|free_object_slot\|object_ptr_in_arena\)$";
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
- *(ushort *)(object + 6)
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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

@word_3_1@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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

@word_3_2@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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

@word_3_3@
type R;
identifier F =~ "^\(calculate_object_weight\|object_list_append_tail\|object_list_insert_head\|object_list_unlink\|unlink_and_free_object\)$";
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

@word_4_0@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 0)
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- ((ushort *)pbVar2)[0]
+ ((uw_object_hdr_t *)pbVar2)->type_flags
|
- *(ushort *)pbVar2
+ ((uw_object_hdr_t *)pbVar2)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 2)
+ ((uw_object_hdr_t *)pbVar2)->position_word
|
- ((ushort *)pbVar2)[1]
+ ((uw_object_hdr_t *)pbVar2)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 4)
+ ((uw_object_hdr_t *)pbVar2)->chain_word
|
- ((ushort *)pbVar2)[2]
+ ((uw_object_hdr_t *)pbVar2)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(object_list_append_tail\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar2 + 6)
+ ((uw_object_hdr_t *)pbVar2)->link_word
|
- ((ushort *)pbVar2)[3]
+ ((uw_object_hdr_t *)pbVar2)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(object_list_unlink\)$";
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
)
...>
}

@word_5_1@
type R;
identifier F =~ "^\(object_list_unlink\)$";
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
)
...>
}

@word_5_2@
type R;
identifier F =~ "^\(object_list_unlink\)$";
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
)
...>
}

@word_5_3@
type R;
identifier F =~ "^\(object_list_unlink\)$";
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
)
...>
}

@word_6_0@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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

@word_6_1@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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

@word_6_2@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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

@word_6_3@
type R;
identifier F =~ "^\(find_object_in_chain\|free_linked_object_recursive\)$";
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

@word_7_0@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 0)
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- ((ushort *)object_ptr)[0]
+ ((uw_object_hdr_t *)object_ptr)->type_flags
|
- *(ushort *)object_ptr
+ ((uw_object_hdr_t *)object_ptr)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 2)
+ ((uw_object_hdr_t *)object_ptr)->position_word
|
- ((ushort *)object_ptr)[1]
+ ((uw_object_hdr_t *)object_ptr)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 4)
+ ((uw_object_hdr_t *)object_ptr)->chain_word
|
- ((ushort *)object_ptr)[2]
+ ((uw_object_hdr_t *)object_ptr)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(encode_object_slot_index\|object_ptr_in_arena\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_ptr + 6)
+ ((uw_object_hdr_t *)object_ptr)->link_word
|
- ((ushort *)object_ptr)[3]
+ ((uw_object_hdr_t *)object_ptr)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@word_8_1@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@word_8_2@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@word_8_3@
type R;
identifier F =~ "^\(spawn_new_object\)$";
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

@word_9_0@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 0)
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- ((ushort *)discarded)[0]
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *(ushort *)discarded
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- discarded[0]
+ ((uw_object_hdr_t *)discarded)->type_flags
|
- *discarded
+ ((uw_object_hdr_t *)discarded)->type_flags
)
...>
}

@word_9_1@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 2)
+ ((uw_object_hdr_t *)discarded)->position_word
|
- ((ushort *)discarded)[1]
+ ((uw_object_hdr_t *)discarded)->position_word
|
- discarded[1]
+ ((uw_object_hdr_t *)discarded)->position_word
)
...>
}

@word_9_2@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 4)
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- ((ushort *)discarded)[2]
+ ((uw_object_hdr_t *)discarded)->chain_word
|
- discarded[2]
+ ((uw_object_hdr_t *)discarded)->chain_word
)
...>
}

@word_9_3@
type R;
identifier F =~ "^\(reset_burnt_out_item_state\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)discarded + 6)
+ ((uw_object_hdr_t *)discarded)->link_word
|
- ((ushort *)discarded)[3]
+ ((uw_object_hdr_t *)discarded)->link_word
|
- discarded[3]
+ ((uw_object_hdr_t *)discarded)->link_word
)
...>
}

@word_10_0@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 0)
+ ((uw_object_hdr_t *)settled)->type_flags
|
- ((ushort *)settled)[0]
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *(ushort *)settled
+ ((uw_object_hdr_t *)settled)->type_flags
|
- settled[0]
+ ((uw_object_hdr_t *)settled)->type_flags
|
- *settled
+ ((uw_object_hdr_t *)settled)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 2)
+ ((uw_object_hdr_t *)settled)->position_word
|
- ((ushort *)settled)[1]
+ ((uw_object_hdr_t *)settled)->position_word
|
- settled[1]
+ ((uw_object_hdr_t *)settled)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 4)
+ ((uw_object_hdr_t *)settled)->chain_word
|
- ((ushort *)settled)[2]
+ ((uw_object_hdr_t *)settled)->chain_word
|
- settled[2]
+ ((uw_object_hdr_t *)settled)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(apply_object_destruction_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)settled + 6)
+ ((uw_object_hdr_t *)settled)->link_word
|
- ((ushort *)settled)[3]
+ ((uw_object_hdr_t *)settled)->link_word
|
- settled[3]
+ ((uw_object_hdr_t *)settled)->link_word
)
...>
}

@word_11_0@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@word_11_1@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@word_11_2@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@word_11_3@
type R;
identifier F =~ "^\(clear_object_temp_flag_callback\|reallocate_object_to_arena\)$";
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

@word_12_0@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 0)
+ ((uw_object_hdr_t *)contents)->type_flags
|
- ((ushort *)contents)[0]
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)contents
+ ((uw_object_hdr_t *)contents)->type_flags
|
- *(ushort *)(contents + 0)
+ ((uw_object_hdr_t *)contents)->type_flags
)
...>
}

@word_12_1@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 2)
+ ((uw_object_hdr_t *)contents)->position_word
|
- ((ushort *)contents)[1]
+ ((uw_object_hdr_t *)contents)->position_word
|
- *(ushort *)(contents + 2)
+ ((uw_object_hdr_t *)contents)->position_word
)
...>
}

@word_12_2@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 4)
+ ((uw_object_hdr_t *)contents)->chain_word
|
- ((ushort *)contents)[2]
+ ((uw_object_hdr_t *)contents)->chain_word
|
- *(ushort *)(contents + 4)
+ ((uw_object_hdr_t *)contents)->chain_word
)
...>
}

@word_12_3@
type R;
identifier F =~ "^\(clear_temp_flags_on_all_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)contents + 6)
+ ((uw_object_hdr_t *)contents)->link_word
|
- ((ushort *)contents)[3]
+ ((uw_object_hdr_t *)contents)->link_word
|
- *(ushort *)(contents + 6)
+ ((uw_object_hdr_t *)contents)->link_word
)
...>
}

@word_13_0@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- *(ushort *)(iVar1 + 0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}

@word_13_1@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- *(ushort *)(iVar1 + 2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}

@word_13_2@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- *(ushort *)(iVar1 + 4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}

@word_13_3@
type R;
identifier F =~ "^\(free_player_inventory_chain\)$";
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
|
- *(ushort *)(iVar1 + 6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}

@word_14_0@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- ((ushort *)pcVar2)[0]
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(ushort *)pcVar2
+ ((uw_object_hdr_t *)pcVar2)->type_flags
|
- *(ushort *)(pcVar2 + 0)
+ ((uw_object_hdr_t *)pcVar2)->type_flags
)
...>
}

@word_14_1@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- ((ushort *)pcVar2)[1]
+ ((uw_object_hdr_t *)pcVar2)->position_word
|
- *(ushort *)(pcVar2 + 2)
+ ((uw_object_hdr_t *)pcVar2)->position_word
)
...>
}

@word_14_2@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- ((ushort *)pcVar2)[2]
+ ((uw_object_hdr_t *)pcVar2)->chain_word
|
- *(ushort *)(pcVar2 + 4)
+ ((uw_object_hdr_t *)pcVar2)->chain_word
)
...>
}

@word_14_3@
type R;
identifier F =~ "^\(walk_object_tree\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar2 + 6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- ((ushort *)pcVar2)[3]
+ ((uw_object_hdr_t *)pcVar2)->link_word
|
- *(ushort *)(pcVar2 + 6)
+ ((uw_object_hdr_t *)pcVar2)->link_word
)
...>
}

@word_15_0@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- ((ushort *)pcVar1)[0]
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(ushort *)pcVar1
+ ((uw_object_hdr_t *)pcVar1)->type_flags
|
- *(ushort *)(pcVar1 + 0)
+ ((uw_object_hdr_t *)pcVar1)->type_flags
)
...>
}

@word_15_1@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- ((ushort *)pcVar1)[1]
+ ((uw_object_hdr_t *)pcVar1)->position_word
|
- *(ushort *)(pcVar1 + 2)
+ ((uw_object_hdr_t *)pcVar1)->position_word
)
...>
}

@word_15_2@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- ((ushort *)pcVar1)[2]
+ ((uw_object_hdr_t *)pcVar1)->chain_word
|
- *(ushort *)(pcVar1 + 4)
+ ((uw_object_hdr_t *)pcVar1)->chain_word
)
...>
}

@word_15_3@
type R;
identifier F =~ "^\(should_destroy_linked_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar1 + 6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- ((ushort *)pcVar1)[3]
+ ((uw_object_hdr_t *)pcVar1)->link_word
|
- *(ushort *)(pcVar1 + 6)
+ ((uw_object_hdr_t *)pcVar1)->link_word
)
...>
}

@word_16_0@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- ((ushort *)pcVar4)[0]
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(ushort *)pcVar4
+ ((uw_object_hdr_t *)pcVar4)->type_flags
|
- *(ushort *)(pcVar4 + 0)
+ ((uw_object_hdr_t *)pcVar4)->type_flags
)
...>
}

@word_16_1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- ((ushort *)pcVar4)[1]
+ ((uw_object_hdr_t *)pcVar4)->position_word
|
- *(ushort *)(pcVar4 + 2)
+ ((uw_object_hdr_t *)pcVar4)->position_word
)
...>
}

@word_16_2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- ((ushort *)pcVar4)[2]
+ ((uw_object_hdr_t *)pcVar4)->chain_word
|
- *(ushort *)(pcVar4 + 4)
+ ((uw_object_hdr_t *)pcVar4)->chain_word
)
...>
}

@word_16_3@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar4 + 6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- ((ushort *)pcVar4)[3]
+ ((uw_object_hdr_t *)pcVar4)->link_word
|
- *(ushort *)(pcVar4 + 6)
+ ((uw_object_hdr_t *)pcVar4)->link_word
)
...>
}

@word_17_0@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- ((ushort *)pvVar5)[0]
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(ushort *)pvVar5
+ ((uw_object_hdr_t *)pvVar5)->type_flags
|
- *(ushort *)(pvVar5 + 0)
+ ((uw_object_hdr_t *)pvVar5)->type_flags
)
...>
}

@word_17_1@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- ((ushort *)pvVar5)[1]
+ ((uw_object_hdr_t *)pvVar5)->position_word
|
- *(ushort *)(pvVar5 + 2)
+ ((uw_object_hdr_t *)pvVar5)->position_word
)
...>
}

@word_17_2@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- ((ushort *)pvVar5)[2]
+ ((uw_object_hdr_t *)pvVar5)->chain_word
|
- *(ushort *)(pvVar5 + 4)
+ ((uw_object_hdr_t *)pvVar5)->chain_word
)
...>
}

@word_17_3@
type R;
identifier F =~ "^\(despawn_objects_outside_radius\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pvVar5 + 6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- ((ushort *)pvVar5)[3]
+ ((uw_object_hdr_t *)pvVar5)->link_word
|
- *(ushort *)(pvVar5 + 6)
+ ((uw_object_hdr_t *)pvVar5)->link_word
)
...>
}

@word_18_0@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_18_1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_18_2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_18_3@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_19_0@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_19_1@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_19_2@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_19_3@
type R;
identifier F =~ "^\(find_object_by_encoded_slot_in_chain\)$";
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

@word_20_0@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@word_20_1@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@word_20_2@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@word_20_3@
type R;
identifier F =~ "^\(find_object_in_chain\)$";
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

@word_21_0@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 0)
+ ((uw_object_hdr_t *)found)->type_flags
|
- ((ushort *)found)[0]
+ ((uw_object_hdr_t *)found)->type_flags
|
- *(ushort *)found
+ ((uw_object_hdr_t *)found)->type_flags
|
- found[0]
+ ((uw_object_hdr_t *)found)->type_flags
|
- *found
+ ((uw_object_hdr_t *)found)->type_flags
)
...>
}

@word_21_1@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 2)
+ ((uw_object_hdr_t *)found)->position_word
|
- ((ushort *)found)[1]
+ ((uw_object_hdr_t *)found)->position_word
|
- found[1]
+ ((uw_object_hdr_t *)found)->position_word
)
...>
}

@word_21_2@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 4)
+ ((uw_object_hdr_t *)found)->chain_word
|
- ((ushort *)found)[2]
+ ((uw_object_hdr_t *)found)->chain_word
|
- found[2]
+ ((uw_object_hdr_t *)found)->chain_word
)
...>
}

@word_21_3@
type R;
identifier F =~ "^\(object_or_contents_has_type\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)found + 6)
+ ((uw_object_hdr_t *)found)->link_word
|
- ((ushort *)found)[3]
+ ((uw_object_hdr_t *)found)->link_word
|
- found[3]
+ ((uw_object_hdr_t *)found)->link_word
)
...>
}

@word_22_0@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@word_22_1@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@word_22_2@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@word_22_3@
type R;
identifier F =~ "^\(find_object_in_world\)$";
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

@word_23_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 0)
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- ((ushort *)psVar7)[0]
+ ((uw_object_hdr_t *)psVar7)->type_flags
|
- *(ushort *)psVar7
+ ((uw_object_hdr_t *)psVar7)->type_flags
)
...>
}

@word_23_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 2)
+ ((uw_object_hdr_t *)psVar7)->position_word
|
- ((ushort *)psVar7)[1]
+ ((uw_object_hdr_t *)psVar7)->position_word
)
...>
}

@word_23_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 4)
+ ((uw_object_hdr_t *)psVar7)->chain_word
|
- ((ushort *)psVar7)[2]
+ ((uw_object_hdr_t *)psVar7)->chain_word
)
...>
}

@word_23_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)psVar7 + 6)
+ ((uw_object_hdr_t *)psVar7)->link_word
|
- ((ushort *)psVar7)[3]
+ ((uw_object_hdr_t *)psVar7)->link_word
)
...>
}

@word_24_0@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@word_24_1@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@word_24_2@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@word_24_3@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
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

@word_25_0@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@word_25_1@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@word_25_2@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@word_25_3@
type R;
identifier F =~ "^\(class1_variant_effect_table_lookup\)$";
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
)
...>
}

@word_26_0@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@word_26_1@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@word_26_2@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

@word_26_3@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
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

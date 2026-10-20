@word_1_0@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@word_1_1@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@word_1_2@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@word_1_3@
type R;
identifier F =~ "^\(leave_nested_container_level\)$";
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

@word_2_0@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 0)
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- ((ushort *)pContents)[0]
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(ushort *)pContents
+ ((uw_object_hdr_t *)pContents)->type_flags
|
- *(ushort *)(pContents + 0)
+ ((uw_object_hdr_t *)pContents)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 2)
+ ((uw_object_hdr_t *)pContents)->position_word
|
- ((ushort *)pContents)[1]
+ ((uw_object_hdr_t *)pContents)->position_word
|
- *(ushort *)(pContents + 2)
+ ((uw_object_hdr_t *)pContents)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 4)
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- ((ushort *)pContents)[2]
+ ((uw_object_hdr_t *)pContents)->chain_word
|
- *(ushort *)(pContents + 4)
+ ((uw_object_hdr_t *)pContents)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pContents + 6)
+ ((uw_object_hdr_t *)pContents)->link_word
|
- ((ushort *)pContents)[3]
+ ((uw_object_hdr_t *)pContents)->link_word
|
- *(ushort *)(pContents + 6)
+ ((uw_object_hdr_t *)pContents)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- ((ushort *)_pMatch)[0]
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(ushort *)_pMatch
+ ((uw_object_hdr_t *)_pMatch)->type_flags
|
- *(ushort *)(_pMatch + 0)
+ ((uw_object_hdr_t *)_pMatch)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- ((ushort *)_pMatch)[1]
+ ((uw_object_hdr_t *)_pMatch)->position_word
|
- *(ushort *)(_pMatch + 2)
+ ((uw_object_hdr_t *)_pMatch)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- ((ushort *)_pMatch)[2]
+ ((uw_object_hdr_t *)_pMatch)->chain_word
|
- *(ushort *)(_pMatch + 4)
+ ((uw_object_hdr_t *)_pMatch)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(repopulate_container_grid_slots\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_pMatch + 6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- ((ushort *)_pMatch)[3]
+ ((uw_object_hdr_t *)_pMatch)->link_word
|
- *(ushort *)(_pMatch + 6)
+ ((uw_object_hdr_t *)_pMatch)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@word_7_1@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@word_7_2@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@word_7_3@
type R;
identifier F =~ "^\(empty_container_into_world\|scroll_container_grid_down\)$";
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

@word_8_0@
type R;
identifier F =~ "^\(auto_place_in_container\)$";
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
identifier F =~ "^\(auto_place_in_container\)$";
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
identifier F =~ "^\(auto_place_in_container\)$";
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
identifier F =~ "^\(auto_place_in_container\)$";
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
identifier F =~ "^\(sum_container_weight\)$";
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

@word_9_1@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@word_9_2@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@word_9_3@
type R;
identifier F =~ "^\(sum_container_weight\)$";
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

@word_10_0@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- ((ushort *)pNextLink)[0]
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(ushort *)pNextLink
+ ((uw_object_hdr_t *)pNextLink)->type_flags
|
- *(ushort *)(pNextLink + 0)
+ ((uw_object_hdr_t *)pNextLink)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- ((ushort *)pNextLink)[1]
+ ((uw_object_hdr_t *)pNextLink)->position_word
|
- *(ushort *)(pNextLink + 2)
+ ((uw_object_hdr_t *)pNextLink)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- ((ushort *)pNextLink)[2]
+ ((uw_object_hdr_t *)pNextLink)->chain_word
|
- *(ushort *)(pNextLink + 4)
+ ((uw_object_hdr_t *)pNextLink)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(empty_container_into_world\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pNextLink + 6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- ((ushort *)pNextLink)[3]
+ ((uw_object_hdr_t *)pNextLink)->link_word
|
- *(ushort *)(pNextLink + 6)
+ ((uw_object_hdr_t *)pNextLink)->link_word
)
...>
}

@word_11_0@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 0)
+ ((uw_object_hdr_t *)container)->type_flags
|
- ((ushort *)container)[0]
+ ((uw_object_hdr_t *)container)->type_flags
|
- *(ushort *)container
+ ((uw_object_hdr_t *)container)->type_flags
)
...>
}

@word_11_1@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 2)
+ ((uw_object_hdr_t *)container)->position_word
|
- ((ushort *)container)[1]
+ ((uw_object_hdr_t *)container)->position_word
)
...>
}

@word_11_2@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 4)
+ ((uw_object_hdr_t *)container)->chain_word
|
- ((ushort *)container)[2]
+ ((uw_object_hdr_t *)container)->chain_word
)
...>
}

@word_11_3@
type R;
identifier F =~ "^\(discard_container_contents\|try_empty_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)container + 6)
+ ((uw_object_hdr_t *)container)->link_word
|
- ((ushort *)container)[3]
+ ((uw_object_hdr_t *)container)->link_word
)
...>
}

@word_12_0@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@word_12_1@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@word_12_2@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@word_12_3@
type R;
identifier F =~ "^\(discard_container_contents\)$";
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

@word_13_0@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 0)
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- ((ushort *)rune_object)[0]
+ ((uw_object_hdr_t *)rune_object)->type_flags
|
- *(ushort *)rune_object
+ ((uw_object_hdr_t *)rune_object)->type_flags
)
...>
}

@word_13_1@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 2)
+ ((uw_object_hdr_t *)rune_object)->position_word
|
- ((ushort *)rune_object)[1]
+ ((uw_object_hdr_t *)rune_object)->position_word
)
...>
}

@word_13_2@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 4)
+ ((uw_object_hdr_t *)rune_object)->chain_word
|
- ((ushort *)rune_object)[2]
+ ((uw_object_hdr_t *)rune_object)->chain_word
)
...>
}

@word_13_3@
type R;
identifier F =~ "^\(place_rune_in_bag\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)rune_object + 6)
+ ((uw_object_hdr_t *)rune_object)->link_word
|
- ((ushort *)rune_object)[3]
+ ((uw_object_hdr_t *)rune_object)->link_word
)
...>
}

@container_word_0_0@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@container_word_0_1@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@container_word_0_2@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@container_word_0_3@
type R;
identifier F =~ "^\(release_container_reference\)$";
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

@container_word_1_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@container_word_1_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@container_word_1_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@container_word_1_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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

@container_word_2_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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
)
...>
}

@container_word_2_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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
)
...>
}

@container_word_2_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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
)
...>
}

@container_word_2_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
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
)
...>
}

@container_word_3_0@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 0)
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- ((ushort *)puVar15)[0]
+ ((uw_object_hdr_t *)puVar15)->type_flags
|
- *(ushort *)puVar15
+ ((uw_object_hdr_t *)puVar15)->type_flags
)
...>
}

@container_word_3_1@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 2)
+ ((uw_object_hdr_t *)puVar15)->position_word
|
- ((ushort *)puVar15)[1]
+ ((uw_object_hdr_t *)puVar15)->position_word
)
...>
}

@container_word_3_2@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 4)
+ ((uw_object_hdr_t *)puVar15)->chain_word
|
- ((ushort *)puVar15)[2]
+ ((uw_object_hdr_t *)puVar15)->chain_word
)
...>
}

@container_word_3_3@
type R;
identifier F =~ "^\(open_backpack_container\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar15 + 6)
+ ((uw_object_hdr_t *)puVar15)->link_word
|
- ((ushort *)puVar15)[3]
+ ((uw_object_hdr_t *)puVar15)->link_word
)
...>
}

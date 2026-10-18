@word_0_0@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@word_0_1@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@word_0_2@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@word_0_3@
type R;
identifier F =~ "^\(find_and_consume_ammo\)$";
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

@word_1_0@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@word_1_1@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@word_1_2@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

@word_1_3@
type R;
identifier F =~ "^\(fire_ranged_weapon\)$";
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

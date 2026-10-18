@word_0_0@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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
- *(ushort *)(puVar1 + 0)
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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
- *(ushort *)(puVar1 + 2)
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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
- *(ushort *)(puVar1 + 4)
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(deserialize_inventory_link_chain\|serialize_inventory_link_chain\)$";
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
- *(ushort *)(puVar1 + 6)
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@word_1_1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@word_1_2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@word_1_3@
type R;
identifier F =~ "^\(handle_inventory_panel_click\|redraw_inventory_widget_range\)$";
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

@word_2_0@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@word_2_1@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@word_2_2@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@word_2_3@
type R;
identifier F =~ "^\(handle_inventory_panel_click\)$";
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

@word_3_0@
type R;
identifier F =~ "^\(redraw_lit_light_source_widgets\)$";
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

@word_3_1@
type R;
identifier F =~ "^\(redraw_lit_light_source_widgets\)$";
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

@word_3_2@
type R;
identifier F =~ "^\(redraw_lit_light_source_widgets\)$";
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

@word_3_3@
type R;
identifier F =~ "^\(redraw_lit_light_source_widgets\)$";
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

@word_0_0@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@word_0_1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@word_0_2@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@word_0_3@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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

@word_1_0@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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
- *(ushort *)(puVar4 + 0)
+ ((uw_object_hdr_t *)puVar4)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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
- *(ushort *)(puVar4 + 2)
+ ((uw_object_hdr_t *)puVar4)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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
- *(ushort *)(puVar4 + 4)
+ ((uw_object_hdr_t *)puVar4)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(emit_tile_features\)$";
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
- *(ushort *)(puVar4 + 6)
+ ((uw_object_hdr_t *)puVar4)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 0)
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- ((ushort *)_rec)[0]
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- *(ushort *)_rec
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- _rec[0]
+ ((uw_object_hdr_t *)_rec)->type_flags
|
- *_rec
+ ((uw_object_hdr_t *)_rec)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 2)
+ ((uw_object_hdr_t *)_rec)->position_word
|
- ((ushort *)_rec)[1]
+ ((uw_object_hdr_t *)_rec)->position_word
|
- _rec[1]
+ ((uw_object_hdr_t *)_rec)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 4)
+ ((uw_object_hdr_t *)_rec)->chain_word
|
- ((ushort *)_rec)[2]
+ ((uw_object_hdr_t *)_rec)->chain_word
|
- _rec[2]
+ ((uw_object_hdr_t *)_rec)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_rec + 6)
+ ((uw_object_hdr_t *)_rec)->link_word
|
- ((ushort *)_rec)[3]
+ ((uw_object_hdr_t *)_rec)->link_word
|
- _rec[3]
+ ((uw_object_hdr_t *)_rec)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 0)
+ ((uw_object_hdr_t *)_item)->type_flags
|
- ((ushort *)_item)[0]
+ ((uw_object_hdr_t *)_item)->type_flags
|
- *(ushort *)_item
+ ((uw_object_hdr_t *)_item)->type_flags
|
- _item[0]
+ ((uw_object_hdr_t *)_item)->type_flags
|
- *_item
+ ((uw_object_hdr_t *)_item)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 2)
+ ((uw_object_hdr_t *)_item)->position_word
|
- ((ushort *)_item)[1]
+ ((uw_object_hdr_t *)_item)->position_word
|
- _item[1]
+ ((uw_object_hdr_t *)_item)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 4)
+ ((uw_object_hdr_t *)_item)->chain_word
|
- ((ushort *)_item)[2]
+ ((uw_object_hdr_t *)_item)->chain_word
|
- _item[2]
+ ((uw_object_hdr_t *)_item)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(emit_tile_objects\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)_item + 6)
+ ((uw_object_hdr_t *)_item)->link_word
|
- ((ushort *)_item)[3]
+ ((uw_object_hdr_t *)_item)->link_word
|
- _item[3]
+ ((uw_object_hdr_t *)_item)->link_word
)
...>
}

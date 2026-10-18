@word_0_0@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@word_0_1@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@word_0_2@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@word_0_3@
type R;
identifier F =~ "^\(scheduler_despawn_entry\)$";
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

@word_1_0@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@word_1_1@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@word_1_2@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@word_1_3@
type R;
identifier F =~ "^\(scheduler_finish_entry\|scheduler_step_entry\)$";
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

@word_2_0@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
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

@word_2_1@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
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

@word_2_2@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
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

@word_2_3@
type R;
identifier F =~ "^\(scheduler_add_entry\)$";
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

@word_3_0@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@word_3_1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@word_3_2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@word_3_3@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
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

@word_4_0@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 0)
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- ((ushort *)source_object)[0]
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *(ushort *)source_object
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- source_object[0]
+ ((uw_object_hdr_t *)source_object)->type_flags
|
- *source_object
+ ((uw_object_hdr_t *)source_object)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 2)
+ ((uw_object_hdr_t *)source_object)->position_word
|
- ((ushort *)source_object)[1]
+ ((uw_object_hdr_t *)source_object)->position_word
|
- source_object[1]
+ ((uw_object_hdr_t *)source_object)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 4)
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- ((ushort *)source_object)[2]
+ ((uw_object_hdr_t *)source_object)->chain_word
|
- source_object[2]
+ ((uw_object_hdr_t *)source_object)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(spawn_scheduled_effect_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source_object + 6)
+ ((uw_object_hdr_t *)source_object)->link_word
|
- ((ushort *)source_object)[3]
+ ((uw_object_hdr_t *)source_object)->link_word
|
- source_object[3]
+ ((uw_object_hdr_t *)source_object)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@word_5_1@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@word_5_2@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

@word_5_3@
type R;
identifier F =~ "^\(scheduler_advance_effect\)$";
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

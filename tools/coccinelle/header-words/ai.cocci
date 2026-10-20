@word_0_0@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 0)
+ ((uw_object_hdr_t *)target_header)->type_flags
|
- ((ushort *)target_header)[0]
+ ((uw_object_hdr_t *)target_header)->type_flags
|
- *(ushort *)target_header
+ ((uw_object_hdr_t *)target_header)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 2)
+ ((uw_object_hdr_t *)target_header)->position_word
|
- ((ushort *)target_header)[1]
+ ((uw_object_hdr_t *)target_header)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 4)
+ ((uw_object_hdr_t *)target_header)->chain_word
|
- ((ushort *)target_header)[2]
+ ((uw_object_hdr_t *)target_header)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_header + 6)
+ ((uw_object_hdr_t *)target_header)->link_word
|
- ((ushort *)target_header)[3]
+ ((uw_object_hdr_t *)target_header)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 0)
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- ((ushort *)npc_bytes)[0]
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
|
- *(ushort *)npc_bytes
+ ((uw_object_hdr_t *)npc_bytes)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 2)
+ ((uw_object_hdr_t *)npc_bytes)->position_word
|
- ((ushort *)npc_bytes)[1]
+ ((uw_object_hdr_t *)npc_bytes)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 4)
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
|
- ((ushort *)npc_bytes)[2]
+ ((uw_object_hdr_t *)npc_bytes)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(npc_walk_toward_tile\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_bytes + 6)
+ ((uw_object_hdr_t *)npc_bytes)->link_word
|
- ((ushort *)npc_bytes)[3]
+ ((uw_object_hdr_t *)npc_bytes)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- ((ushort *)pcVar3)[0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)pcVar3
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)(pcVar3 + 0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- ((ushort *)pcVar3)[1]
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)(pcVar3 + 2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- ((ushort *)pcVar3)[2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)(pcVar3 + 4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- ((ushort *)pcVar3)[3]
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)(pcVar3 + 6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@word_5_1@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@word_5_2@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@word_5_3@
type R;
identifier F =~ "^\(build_object_placement_snapshot\|settle_mobile_to_immobile\|sync_object_tile_position\)$";
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

@word_6_0@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 0)
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- ((ushort *)projectile)[0]
+ ((uw_object_hdr_t *)projectile)->type_flags
|
- *(ushort *)projectile
+ ((uw_object_hdr_t *)projectile)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 2)
+ ((uw_object_hdr_t *)projectile)->position_word
|
- ((ushort *)projectile)[1]
+ ((uw_object_hdr_t *)projectile)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 4)
+ ((uw_object_hdr_t *)projectile)->chain_word
|
- ((ushort *)projectile)[2]
+ ((uw_object_hdr_t *)projectile)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)projectile + 6)
+ ((uw_object_hdr_t *)projectile)->link_word
|
- ((ushort *)projectile)[3]
+ ((uw_object_hdr_t *)projectile)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@word_7_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@word_7_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@word_7_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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

@word_8_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}

@word_8_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}

@word_8_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}

@word_8_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\)$";
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
)
...>
}

@word_9_0@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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

@word_9_1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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

@word_9_2@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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

@word_9_3@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
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

@word_10_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0)
+ ((uw_object_hdr_t *)creature)->type_flags
|
- ((ushort *)creature)[0]
+ ((uw_object_hdr_t *)creature)->type_flags
|
- *(ushort *)creature
+ ((uw_object_hdr_t *)creature)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 2)
+ ((uw_object_hdr_t *)creature)->position_word
|
- ((ushort *)creature)[1]
+ ((uw_object_hdr_t *)creature)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 4)
+ ((uw_object_hdr_t *)creature)->chain_word
|
- ((ushort *)creature)[2]
+ ((uw_object_hdr_t *)creature)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 6)
+ ((uw_object_hdr_t *)creature)->link_word
|
- ((ushort *)creature)[3]
+ ((uw_object_hdr_t *)creature)->link_word
)
...>
}

@word_11_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 0)
+ ((uw_object_hdr_t *)creature_ptr)->type_flags
|
- ((ushort *)creature_ptr)[0]
+ ((uw_object_hdr_t *)creature_ptr)->type_flags
|
- *(ushort *)creature_ptr
+ ((uw_object_hdr_t *)creature_ptr)->type_flags
|
- *(ushort *)(creature_ptr + 0)
+ ((uw_object_hdr_t *)creature_ptr)->type_flags
)
...>
}

@word_11_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 2)
+ ((uw_object_hdr_t *)creature_ptr)->position_word
|
- ((ushort *)creature_ptr)[1]
+ ((uw_object_hdr_t *)creature_ptr)->position_word
|
- *(ushort *)(creature_ptr + 2)
+ ((uw_object_hdr_t *)creature_ptr)->position_word
)
...>
}

@word_11_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 4)
+ ((uw_object_hdr_t *)creature_ptr)->chain_word
|
- ((ushort *)creature_ptr)[2]
+ ((uw_object_hdr_t *)creature_ptr)->chain_word
|
- *(ushort *)(creature_ptr + 4)
+ ((uw_object_hdr_t *)creature_ptr)->chain_word
)
...>
}

@word_11_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\|spawn_creature_misc_item_drop\|spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature_ptr + 6)
+ ((uw_object_hdr_t *)creature_ptr)->link_word
|
- ((ushort *)creature_ptr)[3]
+ ((uw_object_hdr_t *)creature_ptr)->link_word
|
- *(ushort *)(creature_ptr + 6)
+ ((uw_object_hdr_t *)creature_ptr)->link_word
)
...>
}

@word_12_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@word_12_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@word_12_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@word_12_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
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

@word_13_0@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
)
...>
}

@word_13_1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
)
...>
}

@word_13_2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
)
...>
}

@word_13_3@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
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
)
...>
}

@word_14_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((ushort *)npc)[0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)npc
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}

@word_14_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((ushort *)npc)[1]
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}

@word_14_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((ushort *)npc)[2]
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}

@word_14_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\|setup_npc_ai_tick_state\|spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((ushort *)npc)[3]
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}

@word_15_0@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 0)
+ ((uw_object_hdr_t *)creature)->type_flags
|
- ((ushort *)creature)[0]
+ ((uw_object_hdr_t *)creature)->type_flags
|
- *(ushort *)creature
+ ((uw_object_hdr_t *)creature)->type_flags
|
- creature[0]
+ ((uw_object_hdr_t *)creature)->type_flags
|
- *creature
+ ((uw_object_hdr_t *)creature)->type_flags
)
...>
}

@word_15_1@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 2)
+ ((uw_object_hdr_t *)creature)->position_word
|
- ((ushort *)creature)[1]
+ ((uw_object_hdr_t *)creature)->position_word
|
- creature[1]
+ ((uw_object_hdr_t *)creature)->position_word
)
...>
}

@word_15_2@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 4)
+ ((uw_object_hdr_t *)creature)->chain_word
|
- ((ushort *)creature)[2]
+ ((uw_object_hdr_t *)creature)->chain_word
|
- creature[2]
+ ((uw_object_hdr_t *)creature)->chain_word
)
...>
}

@word_15_3@
type R;
identifier F =~ "^\(spawn_creature_death_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)creature + 6)
+ ((uw_object_hdr_t *)creature)->link_word
|
- ((ushort *)creature)[3]
+ ((uw_object_hdr_t *)creature)->link_word
|
- creature[3]
+ ((uw_object_hdr_t *)creature)->link_word
)
...>
}

@word_16_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 0)
+ ((uw_object_hdr_t *)monster)->type_flags
|
- ((ushort *)monster)[0]
+ ((uw_object_hdr_t *)monster)->type_flags
|
- *(ushort *)monster
+ ((uw_object_hdr_t *)monster)->type_flags
)
...>
}

@word_16_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 2)
+ ((uw_object_hdr_t *)monster)->position_word
|
- ((ushort *)monster)[1]
+ ((uw_object_hdr_t *)monster)->position_word
)
...>
}

@word_16_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 4)
+ ((uw_object_hdr_t *)monster)->chain_word
|
- ((ushort *)monster)[2]
+ ((uw_object_hdr_t *)monster)->chain_word
)
...>
}

@word_16_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster + 6)
+ ((uw_object_hdr_t *)monster)->link_word
|
- ((ushort *)monster)[3]
+ ((uw_object_hdr_t *)monster)->link_word
)
...>
}

@word_17_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- ((ushort *)pDropObj)[0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(ushort *)pDropObj
+ ((uw_object_hdr_t *)pDropObj)->type_flags
)
...>
}

@word_17_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- ((ushort *)pDropObj)[1]
+ ((uw_object_hdr_t *)pDropObj)->position_word
)
...>
}

@word_17_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- ((ushort *)pDropObj)[2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word
)
...>
}

@word_17_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- ((ushort *)pDropObj)[3]
+ ((uw_object_hdr_t *)pDropObj)->link_word
)
...>
}

@word_18_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 0)
+ ((uw_object_hdr_t *)monster_ptr)->type_flags
|
- ((ushort *)monster_ptr)[0]
+ ((uw_object_hdr_t *)monster_ptr)->type_flags
|
- *(ushort *)monster_ptr
+ ((uw_object_hdr_t *)monster_ptr)->type_flags
|
- *(ushort *)(monster_ptr + 0)
+ ((uw_object_hdr_t *)monster_ptr)->type_flags
)
...>
}

@word_18_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 2)
+ ((uw_object_hdr_t *)monster_ptr)->position_word
|
- ((ushort *)monster_ptr)[1]
+ ((uw_object_hdr_t *)monster_ptr)->position_word
|
- *(ushort *)(monster_ptr + 2)
+ ((uw_object_hdr_t *)monster_ptr)->position_word
)
...>
}

@word_18_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 4)
+ ((uw_object_hdr_t *)monster_ptr)->chain_word
|
- ((ushort *)monster_ptr)[2]
+ ((uw_object_hdr_t *)monster_ptr)->chain_word
|
- *(ushort *)(monster_ptr + 4)
+ ((uw_object_hdr_t *)monster_ptr)->chain_word
)
...>
}

@word_18_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)monster_ptr + 6)
+ ((uw_object_hdr_t *)monster_ptr)->link_word
|
- ((ushort *)monster_ptr)[3]
+ ((uw_object_hdr_t *)monster_ptr)->link_word
|
- *(ushort *)(monster_ptr + 6)
+ ((uw_object_hdr_t *)monster_ptr)->link_word
)
...>
}

@word_19_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@word_19_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@word_19_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@word_19_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
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

@word_20_0@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@word_20_1@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@word_20_2@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@word_20_3@
type R;
identifier F =~ "^\(detect_npc_wander_proximity\)$";
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

@word_21_0@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- ((ushort *)npc_rec)[0]
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)npc_rec
+ ((uw_object_hdr_t *)npc_rec)->type_flags
|
- *(ushort *)(npc_rec + 0)
+ ((uw_object_hdr_t *)npc_rec)->type_flags
)
...>
}

@word_21_1@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- ((ushort *)npc_rec)[1]
+ ((uw_object_hdr_t *)npc_rec)->position_word
|
- *(ushort *)(npc_rec + 2)
+ ((uw_object_hdr_t *)npc_rec)->position_word
)
...>
}

@word_21_2@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- ((ushort *)npc_rec)[2]
+ ((uw_object_hdr_t *)npc_rec)->chain_word
|
- *(ushort *)(npc_rec + 4)
+ ((uw_object_hdr_t *)npc_rec)->chain_word
)
...>
}

@word_21_3@
type R;
identifier F =~ "^\(npc_ai_default_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_rec + 6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- ((ushort *)npc_rec)[3]
+ ((uw_object_hdr_t *)npc_rec)->link_word
|
- *(ushort *)(npc_rec + 6)
+ ((uw_object_hdr_t *)npc_rec)->link_word
)
...>
}

@word_22_0@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 0)
+ ((uw_object_hdr_t *)target_object)->type_flags
|
- ((ushort *)target_object)[0]
+ ((uw_object_hdr_t *)target_object)->type_flags
|
- *(ushort *)target_object
+ ((uw_object_hdr_t *)target_object)->type_flags
)
...>
}

@word_22_1@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 2)
+ ((uw_object_hdr_t *)target_object)->position_word
|
- ((ushort *)target_object)[1]
+ ((uw_object_hdr_t *)target_object)->position_word
)
...>
}

@word_22_2@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 4)
+ ((uw_object_hdr_t *)target_object)->chain_word
|
- ((ushort *)target_object)[2]
+ ((uw_object_hdr_t *)target_object)->chain_word
)
...>
}

@word_22_3@
type R;
identifier F =~ "^\(refresh_npc_target_delta\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)target_object + 6)
+ ((uw_object_hdr_t *)target_object)->link_word
|
- ((ushort *)target_object)[3]
+ ((uw_object_hdr_t *)target_object)->link_word
)
...>
}

@word_23_0@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((ushort *)npc)[0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)npc
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)(npc + 0)
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}

@word_23_1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((ushort *)npc)[1]
+ ((uw_object_hdr_t *)npc)->position_word
|
- *(ushort *)(npc + 2)
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}

@word_23_2@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((ushort *)npc)[2]
+ ((uw_object_hdr_t *)npc)->chain_word
|
- *(ushort *)(npc + 4)
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}

@word_23_3@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((ushort *)npc)[3]
+ ((uw_object_hdr_t *)npc)->link_word
|
- *(ushort *)(npc + 6)
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}

@word_24_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 0)
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- ((ushort *)npc_ptr)[0]
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
|
- *(ushort *)npc_ptr
+ ((uw_object_hdr_t *)npc_ptr)->type_flags
)
...>
}

@word_24_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 2)
+ ((uw_object_hdr_t *)npc_ptr)->position_word
|
- ((ushort *)npc_ptr)[1]
+ ((uw_object_hdr_t *)npc_ptr)->position_word
)
...>
}

@word_24_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 4)
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
|
- ((ushort *)npc_ptr)[2]
+ ((uw_object_hdr_t *)npc_ptr)->chain_word
)
...>
}

@word_24_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc_ptr + 6)
+ ((uw_object_hdr_t *)npc_ptr)->link_word
|
- ((ushort *)npc_ptr)[3]
+ ((uw_object_hdr_t *)npc_ptr)->link_word
)
...>
}

@word_25_0@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 0)
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- ((ushort *)saved_npc)[0]
+ ((uw_object_hdr_t *)saved_npc)->type_flags
|
- *(ushort *)saved_npc
+ ((uw_object_hdr_t *)saved_npc)->type_flags
)
...>
}

@word_25_1@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 2)
+ ((uw_object_hdr_t *)saved_npc)->position_word
|
- ((ushort *)saved_npc)[1]
+ ((uw_object_hdr_t *)saved_npc)->position_word
)
...>
}

@word_25_2@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 4)
+ ((uw_object_hdr_t *)saved_npc)->chain_word
|
- ((ushort *)saved_npc)[2]
+ ((uw_object_hdr_t *)saved_npc)->chain_word
)
...>
}

@word_25_3@
type R;
identifier F =~ "^\(npc_set_goal_for_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_npc + 6)
+ ((uw_object_hdr_t *)saved_npc)->link_word
|
- ((ushort *)saved_npc)[3]
+ ((uw_object_hdr_t *)saved_npc)->link_word
)
...>
}

@word_26_0@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@word_26_1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@word_26_2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@word_26_3@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
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

@word_27_0@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((ushort *)npc)[0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)npc
+ ((uw_object_hdr_t *)npc)->type_flags
|
- npc[0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *npc
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}

@word_27_1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((ushort *)npc)[1]
+ ((uw_object_hdr_t *)npc)->position_word
|
- npc[1]
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}

@word_27_2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((ushort *)npc)[2]
+ ((uw_object_hdr_t *)npc)->chain_word
|
- npc[2]
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}

@word_27_3@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((ushort *)npc)[3]
+ ((uw_object_hdr_t *)npc)->link_word
|
- npc[3]
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}

@word_28_0@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- ((ushort *)source)[0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)source
+ ((uw_object_hdr_t *)source)->type_flags
|
- source[0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *source
+ ((uw_object_hdr_t *)source)->type_flags
)
...>
}

@word_28_1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 2)
+ ((uw_object_hdr_t *)source)->position_word
|
- ((ushort *)source)[1]
+ ((uw_object_hdr_t *)source)->position_word
|
- source[1]
+ ((uw_object_hdr_t *)source)->position_word
)
...>
}

@word_28_2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- ((ushort *)source)[2]
+ ((uw_object_hdr_t *)source)->chain_word
|
- source[2]
+ ((uw_object_hdr_t *)source)->chain_word
)
...>
}

@word_28_3@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 6)
+ ((uw_object_hdr_t *)source)->link_word
|
- ((ushort *)source)[3]
+ ((uw_object_hdr_t *)source)->link_word
|
- source[3]
+ ((uw_object_hdr_t *)source)->link_word
)
...>
}

@word_29_0@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- ((ushort *)iVar9)[0]
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(ushort *)iVar9
+ ((uw_object_hdr_t *)iVar9)->type_flags
|
- *(ushort *)(iVar9 + 0)
+ ((uw_object_hdr_t *)iVar9)->type_flags
)
...>
}

@word_29_1@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 2)
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- ((ushort *)iVar9)[1]
+ ((uw_object_hdr_t *)iVar9)->position_word
|
- *(ushort *)(iVar9 + 2)
+ ((uw_object_hdr_t *)iVar9)->position_word
)
...>
}

@word_29_2@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- ((ushort *)iVar9)[2]
+ ((uw_object_hdr_t *)iVar9)->chain_word
|
- *(ushort *)(iVar9 + 4)
+ ((uw_object_hdr_t *)iVar9)->chain_word
)
...>
}

@word_29_3@
type R;
identifier F =~ "^\(npc_idle_behavior_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar9 + 6)
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- ((ushort *)iVar9)[3]
+ ((uw_object_hdr_t *)iVar9)->link_word
|
- *(ushort *)(iVar9 + 6)
+ ((uw_object_hdr_t *)iVar9)->link_word
)
...>
}

@word_30_0@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@word_30_1@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@word_30_2@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@word_30_3@
type R;
identifier F =~ "^\(npc_notice_and_idle_tick\|npc_wander_return_home_exact_tick\)$";
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

@npc_tick_word_0_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- ((ushort *)player_rec)[0]
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)player_rec
+ ((uw_object_hdr_t *)player_rec)->type_flags
)
...>
}

@npc_tick_word_0_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- ((ushort *)player_rec)[1]
+ ((uw_object_hdr_t *)player_rec)->position_word
)
...>
}

@npc_tick_word_0_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- ((ushort *)player_rec)[2]
+ ((uw_object_hdr_t *)player_rec)->chain_word
)
...>
}

@npc_tick_word_0_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- ((ushort *)player_rec)[3]
+ ((uw_object_hdr_t *)player_rec)->link_word
)
...>
}

@npc_tick_word_1_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_word_1_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_word_1_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@npc_tick_word_1_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
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

@word_0_0@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 0)
+ ((uw_object_hdr_t *)iVar5_rec)->type_flags
|
- ((ushort *)iVar5_rec)[0]
+ ((uw_object_hdr_t *)iVar5_rec)->type_flags
|
- *(ushort *)iVar5_rec
+ ((uw_object_hdr_t *)iVar5_rec)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 2)
+ ((uw_object_hdr_t *)iVar5_rec)->position_word
|
- ((ushort *)iVar5_rec)[1]
+ ((uw_object_hdr_t *)iVar5_rec)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 4)
+ ((uw_object_hdr_t *)iVar5_rec)->chain_word
|
- ((ushort *)iVar5_rec)[2]
+ ((uw_object_hdr_t *)iVar5_rec)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(npc_combat_approach_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar5_rec + 6)
+ ((uw_object_hdr_t *)iVar5_rec)->link_word
|
- ((ushort *)iVar5_rec)[3]
+ ((uw_object_hdr_t *)iVar5_rec)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 0)
+ ((uw_object_hdr_t *)iVar6_rec)->type_flags
|
- ((ushort *)iVar6_rec)[0]
+ ((uw_object_hdr_t *)iVar6_rec)->type_flags
|
- *(ushort *)iVar6_rec
+ ((uw_object_hdr_t *)iVar6_rec)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 2)
+ ((uw_object_hdr_t *)iVar6_rec)->position_word
|
- ((ushort *)iVar6_rec)[1]
+ ((uw_object_hdr_t *)iVar6_rec)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 4)
+ ((uw_object_hdr_t *)iVar6_rec)->chain_word
|
- ((ushort *)iVar6_rec)[2]
+ ((uw_object_hdr_t *)iVar6_rec)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(npc_combat_engage_close_tick\|npc_combat_set_stance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6_rec + 6)
+ ((uw_object_hdr_t *)iVar6_rec)->link_word
|
- ((ushort *)iVar6_rec)[3]
+ ((uw_object_hdr_t *)iVar6_rec)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@word_2_1@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@word_2_2@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@word_2_3@
type R;
identifier F =~ "^\(npc_combat_position_tick\|npc_combat_set_stance\)$";
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

@word_3_0@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 0)
+ ((uw_object_hdr_t *)iVar2_rec)->type_flags
|
- ((ushort *)iVar2_rec)[0]
+ ((uw_object_hdr_t *)iVar2_rec)->type_flags
|
- *(ushort *)iVar2_rec
+ ((uw_object_hdr_t *)iVar2_rec)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 2)
+ ((uw_object_hdr_t *)iVar2_rec)->position_word
|
- ((ushort *)iVar2_rec)[1]
+ ((uw_object_hdr_t *)iVar2_rec)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 4)
+ ((uw_object_hdr_t *)iVar2_rec)->chain_word
|
- ((ushort *)iVar2_rec)[2]
+ ((uw_object_hdr_t *)iVar2_rec)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(npc_combat_engage_wide_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar2_rec + 6)
+ ((uw_object_hdr_t *)iVar2_rec)->link_word
|
- ((ushort *)iVar2_rec)[3]
+ ((uw_object_hdr_t *)iVar2_rec)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 0)
+ ((uw_object_hdr_t *)iVar7_rec)->type_flags
|
- ((ushort *)iVar7_rec)[0]
+ ((uw_object_hdr_t *)iVar7_rec)->type_flags
|
- *(ushort *)iVar7_rec
+ ((uw_object_hdr_t *)iVar7_rec)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 2)
+ ((uw_object_hdr_t *)iVar7_rec)->position_word
|
- ((ushort *)iVar7_rec)[1]
+ ((uw_object_hdr_t *)iVar7_rec)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 4)
+ ((uw_object_hdr_t *)iVar7_rec)->chain_word
|
- ((ushort *)iVar7_rec)[2]
+ ((uw_object_hdr_t *)iVar7_rec)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(npc_combat_position_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7_rec + 6)
+ ((uw_object_hdr_t *)iVar7_rec)->link_word
|
- ((ushort *)iVar7_rec)[3]
+ ((uw_object_hdr_t *)iVar7_rec)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@word_5_1@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@word_5_2@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@word_5_3@
type R;
identifier F =~ "^\(npc_combat_disengage_tick\)$";
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

@word_6_0@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@word_6_1@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@word_6_2@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@word_6_3@
type R;
identifier F =~ "^\(apply_melee_damage\|find_nearest_hit_target\|play_weapon_impact_sound\)$";
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

@word_7_0@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 0)
+ ((uw_object_hdr_t *)iVar7)->type_flags
|
- ((ushort *)iVar7)[0]
+ ((uw_object_hdr_t *)iVar7)->type_flags
|
- *(ushort *)iVar7
+ ((uw_object_hdr_t *)iVar7)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 2)
+ ((uw_object_hdr_t *)iVar7)->position_word
|
- ((ushort *)iVar7)[1]
+ ((uw_object_hdr_t *)iVar7)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 4)
+ ((uw_object_hdr_t *)iVar7)->chain_word
|
- ((ushort *)iVar7)[2]
+ ((uw_object_hdr_t *)iVar7)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(spawn_blood_splat_object\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar7 + 6)
+ ((uw_object_hdr_t *)iVar7)->link_word
|
- ((ushort *)iVar7)[3]
+ ((uw_object_hdr_t *)iVar7)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_8_1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_8_2@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_8_3@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_9_0@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_9_1@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_9_2@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_9_3@
type R;
identifier F =~ "^\(resolve_weapon_hit_skill_check\)$";
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

@word_10_0@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 0)
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- ((ushort *)uVar7)[0]
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- *(ushort *)uVar7
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- uVar7[0]
+ ((uw_object_hdr_t *)uVar7)->type_flags
|
- *uVar7
+ ((uw_object_hdr_t *)uVar7)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 2)
+ ((uw_object_hdr_t *)uVar7)->position_word
|
- ((ushort *)uVar7)[1]
+ ((uw_object_hdr_t *)uVar7)->position_word
|
- uVar7[1]
+ ((uw_object_hdr_t *)uVar7)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 4)
+ ((uw_object_hdr_t *)uVar7)->chain_word
|
- ((ushort *)uVar7)[2]
+ ((uw_object_hdr_t *)uVar7)->chain_word
|
- uVar7[2]
+ ((uw_object_hdr_t *)uVar7)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(apply_melee_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar7 + 6)
+ ((uw_object_hdr_t *)uVar7)->link_word
|
- ((ushort *)uVar7)[3]
+ ((uw_object_hdr_t *)uVar7)->link_word
|
- uVar7[3]
+ ((uw_object_hdr_t *)uVar7)->link_word
)
...>
}

@word_11_0@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- ((ushort *)uVar4)[0]
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)uVar4
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)(uVar4 + 0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
)
...>
}

@word_11_1@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- ((ushort *)uVar4)[1]
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- *(ushort *)(uVar4 + 2)
+ ((uw_object_hdr_t *)uVar4)->position_word
)
...>
}

@word_11_2@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- ((ushort *)uVar4)[2]
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- *(ushort *)(uVar4 + 4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
)
...>
}

@word_11_3@
type R;
identifier F =~ "^\(play_weapon_impact_sound\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- ((ushort *)uVar4)[3]
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- *(ushort *)(uVar4 + 6)
+ ((uw_object_hdr_t *)uVar4)->link_word
)
...>
}

@word_12_0@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_12_1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_12_2@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_12_3@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_13_0@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_13_1@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_13_2@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_13_3@
type R;
identifier F =~ "^\(compute_attack_relative_facing\)$";
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

@word_14_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 0)
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- ((ushort *)puTarget)[0]
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- *(ushort *)puTarget
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- puTarget[0]
+ ((uw_object_hdr_t *)puTarget)->type_flags
|
- *puTarget
+ ((uw_object_hdr_t *)puTarget)->type_flags
)
...>
}

@word_14_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 2)
+ ((uw_object_hdr_t *)puTarget)->position_word
|
- ((ushort *)puTarget)[1]
+ ((uw_object_hdr_t *)puTarget)->position_word
|
- puTarget[1]
+ ((uw_object_hdr_t *)puTarget)->position_word
)
...>
}

@word_14_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 4)
+ ((uw_object_hdr_t *)puTarget)->chain_word
|
- ((ushort *)puTarget)[2]
+ ((uw_object_hdr_t *)puTarget)->chain_word
|
- puTarget[2]
+ ((uw_object_hdr_t *)puTarget)->chain_word
)
...>
}

@word_14_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puTarget + 6)
+ ((uw_object_hdr_t *)puTarget)->link_word
|
- ((ushort *)puTarget)[3]
+ ((uw_object_hdr_t *)puTarget)->link_word
|
- puTarget[3]
+ ((uw_object_hdr_t *)puTarget)->link_word
)
...>
}

@word_15_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 0)
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- ((ushort *)puAttacker)[0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- *(ushort *)puAttacker
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- puAttacker[0]
+ ((uw_object_hdr_t *)puAttacker)->type_flags
|
- *puAttacker
+ ((uw_object_hdr_t *)puAttacker)->type_flags
)
...>
}

@word_15_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 2)
+ ((uw_object_hdr_t *)puAttacker)->position_word
|
- ((ushort *)puAttacker)[1]
+ ((uw_object_hdr_t *)puAttacker)->position_word
|
- puAttacker[1]
+ ((uw_object_hdr_t *)puAttacker)->position_word
)
...>
}

@word_15_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 4)
+ ((uw_object_hdr_t *)puAttacker)->chain_word
|
- ((ushort *)puAttacker)[2]
+ ((uw_object_hdr_t *)puAttacker)->chain_word
|
- puAttacker[2]
+ ((uw_object_hdr_t *)puAttacker)->chain_word
)
...>
}

@word_15_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puAttacker + 6)
+ ((uw_object_hdr_t *)puAttacker)->link_word
|
- ((ushort *)puAttacker)[3]
+ ((uw_object_hdr_t *)puAttacker)->link_word
|
- puAttacker[3]
+ ((uw_object_hdr_t *)puAttacker)->link_word
)
...>
}

@word_16_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 0)
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- ((ushort *)uVar4)[0]
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *(ushort *)uVar4
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- uVar4[0]
+ ((uw_object_hdr_t *)uVar4)->type_flags
|
- *uVar4
+ ((uw_object_hdr_t *)uVar4)->type_flags
)
...>
}

@word_16_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 2)
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- ((ushort *)uVar4)[1]
+ ((uw_object_hdr_t *)uVar4)->position_word
|
- uVar4[1]
+ ((uw_object_hdr_t *)uVar4)->position_word
)
...>
}

@word_16_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 4)
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- ((ushort *)uVar4)[2]
+ ((uw_object_hdr_t *)uVar4)->chain_word
|
- uVar4[2]
+ ((uw_object_hdr_t *)uVar4)->chain_word
)
...>
}

@word_16_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar4 + 6)
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- ((ushort *)uVar4)[3]
+ ((uw_object_hdr_t *)uVar4)->link_word
|
- uVar4[3]
+ ((uw_object_hdr_t *)uVar4)->link_word
)
...>
}

@word_17_0@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 0)
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- ((ushort *)uVar5)[0]
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- *(ushort *)uVar5
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- uVar5[0]
+ ((uw_object_hdr_t *)uVar5)->type_flags
|
- *uVar5
+ ((uw_object_hdr_t *)uVar5)->type_flags
)
...>
}

@word_17_1@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 2)
+ ((uw_object_hdr_t *)uVar5)->position_word
|
- ((ushort *)uVar5)[1]
+ ((uw_object_hdr_t *)uVar5)->position_word
|
- uVar5[1]
+ ((uw_object_hdr_t *)uVar5)->position_word
)
...>
}

@word_17_2@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 4)
+ ((uw_object_hdr_t *)uVar5)->chain_word
|
- ((ushort *)uVar5)[2]
+ ((uw_object_hdr_t *)uVar5)->chain_word
|
- uVar5[2]
+ ((uw_object_hdr_t *)uVar5)->chain_word
)
...>
}

@word_17_3@
type R;
identifier F =~ "^\(process_melee_attack_swing\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar5 + 6)
+ ((uw_object_hdr_t *)uVar5)->link_word
|
- ((ushort *)uVar5)[3]
+ ((uw_object_hdr_t *)uVar5)->link_word
|
- uVar5[3]
+ ((uw_object_hdr_t *)uVar5)->link_word
)
...>
}

@word_18_0@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@word_18_1@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@word_18_2@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@word_18_3@
type R;
identifier F =~ "^\(resolve_collision_candidate_interaction\|resolve_equipped_weapon_attack\)$";
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

@word_19_0@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
|
- target[0]
+ ((uw_object_hdr_t *)target)->type_flags
|
- *target
+ ((uw_object_hdr_t *)target)->type_flags
)
...>
}

@word_19_1@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
|
- target[1]
+ ((uw_object_hdr_t *)target)->position_word
)
...>
}

@word_19_2@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
|
- target[2]
+ ((uw_object_hdr_t *)target)->chain_word
)
...>
}

@word_19_3@
type R;
identifier F =~ "^\(apply_direct_object_hit\)$";
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
|
- target[3]
+ ((uw_object_hdr_t *)target)->link_word
)
...>
}

@word_20_0@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@word_20_1@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@word_20_2@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@word_20_3@
type R;
identifier F =~ "^\(check_npc_target_alignment\)$";
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

@word_21_0@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@word_21_1@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@word_21_2@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@word_21_3@
type R;
identifier F =~ "^\(apply_object_durability_damage\|resolve_damage_type_resistance\)$";
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

@word_22_0@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 0)
+ ((uw_object_hdr_t *)object_hdr)->type_flags
|
- ((ushort *)object_hdr)[0]
+ ((uw_object_hdr_t *)object_hdr)->type_flags
|
- *(ushort *)object_hdr
+ ((uw_object_hdr_t *)object_hdr)->type_flags
)
...>
}

@word_22_1@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 2)
+ ((uw_object_hdr_t *)object_hdr)->position_word
|
- ((ushort *)object_hdr)[1]
+ ((uw_object_hdr_t *)object_hdr)->position_word
)
...>
}

@word_22_2@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 4)
+ ((uw_object_hdr_t *)object_hdr)->chain_word
|
- ((ushort *)object_hdr)[2]
+ ((uw_object_hdr_t *)object_hdr)->chain_word
)
...>
}

@word_22_3@
type R;
identifier F =~ "^\(apply_object_durability_damage\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object_hdr + 6)
+ ((uw_object_hdr_t *)object_hdr)->link_word
|
- ((ushort *)object_hdr)[3]
+ ((uw_object_hdr_t *)object_hdr)->link_word
)
...>
}

@word_23_0@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@word_23_1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@word_23_2@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@word_23_3@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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

@word_24_0@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- *(ushort *)(pDropObj + 0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
)
...>
}

@word_24_1@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- *(ushort *)(pDropObj + 2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
)
...>
}

@word_24_2@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- *(ushort *)(pDropObj + 4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
)
...>
}

@word_24_3@
type R;
identifier F =~ "^\(damage_equipped_item_in_slot\)$";
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
|
- *(ushort *)(pDropObj + 6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
)
...>
}

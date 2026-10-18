@word_0_0@
type R;
identifier F =~ "^\(check_object_carry_weight\|check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@word_0_1@
type R;
identifier F =~ "^\(check_object_carry_weight\|check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@word_0_2@
type R;
identifier F =~ "^\(check_object_carry_weight\|check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@word_0_3@
type R;
identifier F =~ "^\(check_object_carry_weight\|check_object_drop_height\|dispatch_object_action\|dispatch_object_action_dup\)$";
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

@word_1_0@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
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

@word_1_1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
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

@word_1_2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
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

@word_1_3@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
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

@word_2_0@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference_header + 0)
+ ((uw_object_hdr_t *)reference_header)->type_flags
|
- ((ushort *)reference_header)[0]
+ ((uw_object_hdr_t *)reference_header)->type_flags
|
- *(ushort *)reference_header
+ ((uw_object_hdr_t *)reference_header)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference_header + 2)
+ ((uw_object_hdr_t *)reference_header)->position_word
|
- ((ushort *)reference_header)[1]
+ ((uw_object_hdr_t *)reference_header)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference_header + 4)
+ ((uw_object_hdr_t *)reference_header)->chain_word
|
- ((ushort *)reference_header)[2]
+ ((uw_object_hdr_t *)reference_header)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference_header + 6)
+ ((uw_object_hdr_t *)reference_header)->link_word
|
- ((ushort *)reference_header)[3]
+ ((uw_object_hdr_t *)reference_header)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 0)
+ ((uw_object_hdr_t *)reference)->type_flags
|
- ((ushort *)reference)[0]
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *(ushort *)reference
+ ((uw_object_hdr_t *)reference)->type_flags
|
- reference[0]
+ ((uw_object_hdr_t *)reference)->type_flags
|
- *reference
+ ((uw_object_hdr_t *)reference)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 2)
+ ((uw_object_hdr_t *)reference)->position_word
|
- ((ushort *)reference)[1]
+ ((uw_object_hdr_t *)reference)->position_word
|
- reference[1]
+ ((uw_object_hdr_t *)reference)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 4)
+ ((uw_object_hdr_t *)reference)->chain_word
|
- ((ushort *)reference)[2]
+ ((uw_object_hdr_t *)reference)->chain_word
|
- reference[2]
+ ((uw_object_hdr_t *)reference)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(check_object_drop_height\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)reference + 6)
+ ((uw_object_hdr_t *)reference)->link_word
|
- ((ushort *)reference)[3]
+ ((uw_object_hdr_t *)reference)->link_word
|
- reference[3]
+ ((uw_object_hdr_t *)reference)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@word_4_1@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@word_4_2@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@word_4_3@
type R;
identifier F =~ "^\(check_object_combination\)$";
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

@word_5_0@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@word_5_1@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@word_5_2@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@word_5_3@
type R;
identifier F =~ "^\(spawn_and_prime_spell_effect_object\|spawn_random_variant_object_at_tile\)$";
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

@word_6_0@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[0]
+ ((uw_object_hdr_t *)iVar2)->type_flags
|
- *iVar2
+ ((uw_object_hdr_t *)iVar2)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[1]
+ ((uw_object_hdr_t *)iVar2)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[2]
+ ((uw_object_hdr_t *)iVar2)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(force_unlock_target_object\)$";
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
- iVar2[3]
+ ((uw_object_hdr_t *)iVar2)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- ((ushort *)uVar2)[0]
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- *(ushort *)uVar2
+ ((uw_object_hdr_t *)uVar2)->type_flags
|
- *(ushort *)(uVar2 + 0)
+ ((uw_object_hdr_t *)uVar2)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 2)
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- ((ushort *)uVar2)[1]
+ ((uw_object_hdr_t *)uVar2)->position_word
|
- *(ushort *)(uVar2 + 2)
+ ((uw_object_hdr_t *)uVar2)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 4)
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- ((ushort *)uVar2)[2]
+ ((uw_object_hdr_t *)uVar2)->chain_word
|
- *(ushort *)(uVar2 + 4)
+ ((uw_object_hdr_t *)uVar2)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(trigger_tile_damage_trap_effect\|trigger_type_flagged_trap_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)uVar2 + 6)
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- ((ushort *)uVar2)[3]
+ ((uw_object_hdr_t *)uVar2)->link_word
|
- *(ushort *)(uVar2 + 6)
+ ((uw_object_hdr_t *)uVar2)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@word_8_1@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@word_8_2@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@word_8_3@
type R;
identifier F =~ "^\(scan_area_for_matching_objects\)$";
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

@word_9_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 0)
+ ((uw_object_hdr_t *)caster)->type_flags
|
- ((ushort *)caster)[0]
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(ushort *)caster
+ ((uw_object_hdr_t *)caster)->type_flags
|
- *(ushort *)(caster + 0)
+ ((uw_object_hdr_t *)caster)->type_flags
)
...>
}

@word_9_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 2)
+ ((uw_object_hdr_t *)caster)->position_word
|
- ((ushort *)caster)[1]
+ ((uw_object_hdr_t *)caster)->position_word
|
- *(ushort *)(caster + 2)
+ ((uw_object_hdr_t *)caster)->position_word
)
...>
}

@word_9_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 4)
+ ((uw_object_hdr_t *)caster)->chain_word
|
- ((ushort *)caster)[2]
+ ((uw_object_hdr_t *)caster)->chain_word
|
- *(ushort *)(caster + 4)
+ ((uw_object_hdr_t *)caster)->chain_word
)
...>
}

@word_9_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)caster + 6)
+ ((uw_object_hdr_t *)caster)->link_word
|
- ((ushort *)caster)[3]
+ ((uw_object_hdr_t *)caster)->link_word
|
- *(ushort *)(caster + 6)
+ ((uw_object_hdr_t *)caster)->link_word
)
...>
}

@word_10_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@word_10_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@word_10_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@word_10_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
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

@word_11_0@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 0)
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- ((ushort *)saved_scratch)[0]
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
|
- *(ushort *)saved_scratch
+ ((uw_object_hdr_t *)saved_scratch)->type_flags
)
...>
}

@word_11_1@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 2)
+ ((uw_object_hdr_t *)saved_scratch)->position_word
|
- ((ushort *)saved_scratch)[1]
+ ((uw_object_hdr_t *)saved_scratch)->position_word
)
...>
}

@word_11_2@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 4)
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
|
- ((ushort *)saved_scratch)[2]
+ ((uw_object_hdr_t *)saved_scratch)->chain_word
)
...>
}

@word_11_3@
type R;
identifier F =~ "^\(cast_summon_or_spawn_effect\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)saved_scratch + 6)
+ ((uw_object_hdr_t *)saved_scratch)->link_word
|
- ((ushort *)saved_scratch)[3]
+ ((uw_object_hdr_t *)saved_scratch)->link_word
)
...>
}

@word_12_0@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@word_12_1@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@word_12_2@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@word_12_3@
type R;
identifier F =~ "^\(complete_pending_player_command_target\)$";
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

@word_13_0@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_13_1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_13_2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_13_3@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_14_0@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_14_1@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_14_2@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_14_3@
type R;
identifier F =~ "^\(damage_all_objects_at_tile\)$";
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

@word_15_0@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@word_15_1@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@word_15_2@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@word_15_3@
type R;
identifier F =~ "^\(consume_linked_special_object_charge\)$";
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

@word_16_0@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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
)
...>
}

@word_16_1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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
)
...>
}

@word_16_2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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
)
...>
}

@word_16_3@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
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
)
...>
}

@word_17_0@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template + 0)
+ ((uw_object_hdr_t *)template)->type_flags
|
- ((ushort *)template)[0]
+ ((uw_object_hdr_t *)template)->type_flags
|
- *(ushort *)template
+ ((uw_object_hdr_t *)template)->type_flags
)
...>
}

@word_17_1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template + 2)
+ ((uw_object_hdr_t *)template)->position_word
|
- ((ushort *)template)[1]
+ ((uw_object_hdr_t *)template)->position_word
)
...>
}

@word_17_2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template + 4)
+ ((uw_object_hdr_t *)template)->chain_word
|
- ((ushort *)template)[2]
+ ((uw_object_hdr_t *)template)->chain_word
)
...>
}

@word_17_3@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template + 6)
+ ((uw_object_hdr_t *)template)->link_word
|
- ((ushort *)template)[3]
+ ((uw_object_hdr_t *)template)->link_word
)
...>
}

@word_18_0@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template_ptr + 0)
+ ((uw_object_hdr_t *)template_ptr)->type_flags
|
- ((ushort *)template_ptr)[0]
+ ((uw_object_hdr_t *)template_ptr)->type_flags
|
- *(ushort *)template_ptr
+ ((uw_object_hdr_t *)template_ptr)->type_flags
|
- *(ushort *)(template_ptr + 0)
+ ((uw_object_hdr_t *)template_ptr)->type_flags
)
...>
}

@word_18_1@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template_ptr + 2)
+ ((uw_object_hdr_t *)template_ptr)->position_word
|
- ((ushort *)template_ptr)[1]
+ ((uw_object_hdr_t *)template_ptr)->position_word
|
- *(ushort *)(template_ptr + 2)
+ ((uw_object_hdr_t *)template_ptr)->position_word
)
...>
}

@word_18_2@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template_ptr + 4)
+ ((uw_object_hdr_t *)template_ptr)->chain_word
|
- ((ushort *)template_ptr)[2]
+ ((uw_object_hdr_t *)template_ptr)->chain_word
|
- *(ushort *)(template_ptr + 4)
+ ((uw_object_hdr_t *)template_ptr)->chain_word
)
...>
}

@word_18_3@
type R;
identifier F =~ "^\(spawn_effect_debris_burst\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)template_ptr + 6)
+ ((uw_object_hdr_t *)template_ptr)->link_word
|
- ((ushort *)template_ptr)[3]
+ ((uw_object_hdr_t *)template_ptr)->link_word
|
- *(ushort *)(template_ptr + 6)
+ ((uw_object_hdr_t *)template_ptr)->link_word
)
...>
}

@word_19_0@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
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

@word_19_1@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
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

@word_19_2@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
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

@word_19_3@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
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

@word_20_0@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 0)
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- ((ushort *)chain_item)[0]
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *(ushort *)chain_item
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- chain_item[0]
+ ((uw_object_hdr_t *)chain_item)->type_flags
|
- *chain_item
+ ((uw_object_hdr_t *)chain_item)->type_flags
)
...>
}

@word_20_1@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 2)
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- ((ushort *)chain_item)[1]
+ ((uw_object_hdr_t *)chain_item)->position_word
|
- chain_item[1]
+ ((uw_object_hdr_t *)chain_item)->position_word
)
...>
}

@word_20_2@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 4)
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- ((ushort *)chain_item)[2]
+ ((uw_object_hdr_t *)chain_item)->chain_word
|
- chain_item[2]
+ ((uw_object_hdr_t *)chain_item)->chain_word
)
...>
}

@word_20_3@
type R;
identifier F =~ "^\(append_object_special_name\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)chain_item + 6)
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- ((ushort *)chain_item)[3]
+ ((uw_object_hdr_t *)chain_item)->link_word
|
- chain_item[3]
+ ((uw_object_hdr_t *)chain_item)->link_word
)
...>
}

@word_21_0@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- puVar1[0]
+ ((uw_object_hdr_t *)puVar1)->type_flags
|
- *puVar1
+ ((uw_object_hdr_t *)puVar1)->type_flags
)
...>
}

@word_21_1@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- puVar1[1]
+ ((uw_object_hdr_t *)puVar1)->position_word
)
...>
}

@word_21_2@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- puVar1[2]
+ ((uw_object_hdr_t *)puVar1)->chain_word
)
...>
}

@word_21_3@
type R;
identifier F =~ "^\(spawn_object_near_actor\)$";
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
- puVar1[3]
+ ((uw_object_hdr_t *)puVar1)->link_word
)
...>
}

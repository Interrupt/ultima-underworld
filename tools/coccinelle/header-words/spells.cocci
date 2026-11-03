

@effect_word_0_0@
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
)
...>
}

@effect_word_0_1@
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
)
...>
}

@effect_word_0_2@
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
)
...>
}

@effect_word_0_3@
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
)
...>
}

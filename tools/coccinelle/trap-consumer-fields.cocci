@trap_consumer_dispatch_trap_type_effect_object_id_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *trap_record & 0x3f
+ ((uw_object_hdr_t *)trap_record)->object_id & 0x3f
)
...>
}
@trap_consumer_dispatch_trap_type_effect_object_id__byte_ disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)*trap_record & 0x3f
+ ((uw_object_hdr_t *)trap_record)->object_id & 0x3f
)
...>
}
@trap_consumer_dispatch_trap_type_effect_quality_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- trap_record[2] & 0x3f
+ ((uw_object_hdr_t *)trap_record)->quality
)
...>
}
@trap_consumer_dispatch_trap_type_effect_quality__byte_ disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)trap_record[2] & 0x3f
+ ((uw_object_hdr_t *)trap_record)->quality
)
...>
}
@trap_consumer_dispatch_trap_type_effect_owner_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- trap_record[3] & 0x3f
+ ((uw_object_hdr_t *)trap_record)->owner
)
...>
}
@trap_consumer_dispatch_trap_type_effect_owner__byte_ disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)trap_record[3] & 0x3f
+ ((uw_object_hdr_t *)trap_record)->owner
)
...>
}
@trap_consumer_dispatch_trap_type_effect_zpos_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- trap_record[1] & 0x7f
+ ((uw_object_hdr_t *)trap_record)->zpos
)
...>
}
@trap_consumer_dispatch_trap_type_effect_zpos__byte_ disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)trap_record[1] & 0x7f
+ ((uw_object_hdr_t *)trap_record)->zpos
)
...>
}
@trap_consumer_dispatch_trap_type_effect_is_quantequal disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (*trap_record & 0x8000) == 0
+ ((uw_object_hdr_t *)trap_record)->is_quant == 0
)
...>
}
@trap_consumer_dispatch_trap_type_effect_is_quantnonzero disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (*trap_record & 0x8000) != 0
+ ((uw_object_hdr_t *)trap_record)->is_quant != 0
)
...>
}
@trap_consumer_dispatch_trap_type_effect_linkequal disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (trap_record[3] & 0xffc0) == 0
+ ((uw_object_hdr_t *)trap_record)->link == 0
)
...>
}
@trap_consumer_dispatch_trap_type_effect_linknonzero disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (trap_record[3] & 0xffc0) != 0
+ ((uw_object_hdr_t *)trap_record)->link != 0
)
...>
}
@trap_consumer_dispatch_trap_type_effect_template_subclass disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *puVar12 & 0x30
+ ((uw_object_hdr_t *)puVar12)->object_id & 0x30
)
...>
}
@trap_consumer_dispatch_trap_type_effect_template_class disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *puVar12 & 0x1c0
+ ((uw_object_hdr_t *)puVar12)->object_id & 0x1c0
)
...>
}
@trap_consumer_dispatch_trap_type_effect_template_type_flags disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)(char)*puVar12;
- ((uw_object_hdr_t *)puVar8)->type_flags_high = *(undefined1 *)((char *)puVar12 + 1);
+ ((uw_object_hdr_t *)puVar8)->type_flags = ((uw_object_hdr_t *)puVar12)->type_flags;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_template_position_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)puVar12[1];
- ((uw_object_hdr_t *)puVar8)->position_word_high = *(undefined1 *)((char *)puVar12 + 3);
+ ((uw_object_hdr_t *)puVar8)->position_word = ((uw_object_hdr_t *)puVar12)->position_word;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_template_chain_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)(char)puVar12[2];
- ((uw_object_hdr_t *)puVar8)->chain_word_high = *(undefined1 *)((char *)puVar12 + 5);
+ ((uw_object_hdr_t *)puVar8)->chain_word = ((uw_object_hdr_t *)puVar12)->chain_word;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_template_link_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)(char)puVar12[3];
- ((uw_object_hdr_t *)puVar8)->link_word_high = *(undefined1 *)((char *)puVar12 + 7);
+ ((uw_object_hdr_t *)puVar8)->link_word = ((uw_object_hdr_t *)puVar12)->link_word;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_spawn_coordinates disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar4 = ((uw_object_hdr_t *)puVar8)->position_word;
- local_30 = place_object_in_world((uint)(uVar4 >> 0xd) + tile_x * 8,
- ((uVar4 & 0x1c00) >> 10) + tile_y * 8,uVar4 & 0x7f,puVar8,
- CONCAT22(uVar20,4),0);
+ uVar4 = ((uw_object_hdr_t *)puVar8)->position_word;
+ local_30 = place_object_in_world(((uw_object_hdr_t *)puVar8)->xpos + tile_x * 8,
+ ((uw_object_hdr_t *)puVar8)->ypos + tile_y * 8,((uw_object_hdr_t *)puVar8)->zpos,puVar8,
+ CONCAT22(uVar20,4),0);
)
...>
}
@trap_consumer_dispatch_trap_type_effect_spawn_link disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar8)->link_word_low = ((uw_object_hdr_t *)puVar8)->owner | (byte)((uVar14 & 0x3ff) << 6);
- ((uw_object_hdr_t *)puVar8)->link_word_high = (byte)(char)((uVar14 << 0x16) >> 0x18);
+ ((uw_object_hdr_t *)puVar8)->link = uVar14 & 0x3ff;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_spawn_next_clear disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar9)->chain_word_high = 0;
- ((uw_object_hdr_t *)puVar9)->chain_word_low = ((uw_object_hdr_t *)puVar9)->quality;
+ ((uw_object_hdr_t *)puVar9)->next = 0;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_spawn_link_clear disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar9)->link_word_low = ((uw_object_hdr_t *)puVar9)->owner;
- ((uw_object_hdr_t *)puVar9)->link_word_high = 0;
+ ((uw_object_hdr_t *)puVar9)->link = 0;
)
...>
}
@trap_consumer_dispatch_trap_type_effect_slice_owner disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)trap_record[3] & 0xf
+ ((uw_object_hdr_t *)trap_record)->owner & 0xf
)
...>
}
@trap_consumer_dispatch_trap_type_effect_named_slice_owner disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)((uw_object_hdr_t *)trap_record)->link_word & 0xf
+ ((uw_object_hdr_t *)trap_record)->owner & 0xf
)
...>
}
@trap_consumer_dispatch_trap_type_effect_slice_quality disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)trap_record[2] & 0x2f
+ ((uw_object_hdr_t *)trap_record)->quality & 0x2f
)
...>
}
@trap_consumer_dispatch_trap_type_effect_named_slice_quality disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (byte)((uw_object_hdr_t *)trap_record)->chain_word & 0x2f
+ ((uw_object_hdr_t *)trap_record)->quality & 0x2f
)
...>
}
@trap_consumer_dispatch_trap_type_effect_actor_nibble disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *DAT_0024cff4 & 0xf
+ ((uw_object_hdr_t *)DAT_0024cff4)->object_id & 0xf
)
...>
}
@trap_consumer_dispatch_trap_type_effect_snapshot_position_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- trap_record[1]
+ ((uw_object_hdr_t *)trap_record)->position_word
)
...>
}
@trap_consumer_dispatch_trap_type_effect_snapshot_chain_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- trap_record[2]
+ ((uw_object_hdr_t *)trap_record)->chain_word
)
...>
}
@trap_consumer_dispatch_trap_type_effect_snapshot_link_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^dispatch_trap_type_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- trap_record[3]
+ ((uw_object_hdr_t *)trap_record)->link_word
)
...>
}
@trap_consumer_apply_quest_event_numeric_effect_height disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^apply_quest_event_numeric_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(record + 2) & 0x7f
+ ((uw_object_hdr_t *)record)->zpos
)
...>
}
@trap_consumer_apply_quest_event_numeric_effect_quality disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^apply_quest_event_numeric_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(record + 4) & 0x3f
+ ((uw_object_hdr_t *)record)->quality
)
...>
}
@trap_consumer_apply_quest_event_numeric_effect_link_index disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^apply_quest_event_numeric_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (*(ushort *)(record + 6) & 0x7fc0) >> 6
+ ((uw_object_hdr_t *)record)->link & 0x1ff
)
...>
}
@trap_consumer_apply_quest_event_numeric_effect_set_zpos disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^apply_quest_event_numeric_effect$";
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- uVar1 = ((uw_object_hdr_t *)iVar3)->position_word;
- bVar2 = (byte)uVar1;
- ((uw_object_hdr_t *)iVar3)->position_word_low = (bVar2 ^ (byte)iVar4) & 0x7f ^ bVar2;
- ((uw_object_hdr_t *)iVar3)->position_word_high = (byte)(char)((ushort)uVar1 >> 8);
+ uVar1 = ((uw_object_hdr_t *)iVar3)->position_word;
+ bVar2 = (byte)uVar1;
+ ((uw_object_hdr_t *)iVar3)->zpos = (byte)iVar4 & 0x7f;
)
...>
}
@marker_exact disable optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, undefined1, undefined2, uw_object_hdr_t, uw_link_word_t;
@@
 void remove_trap_chain_marker(char *link_field, char *trap_object)
 {
   uint uVar1;
   ushort uVar2;
   byte bVar3;
   ushort *puVar4;
   char *iVar5;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
 
-   puVar4 = (ushort *)resolve_object_link(trap_object + 6);
+   puVar4 = (ushort *)resolve_object_link(uw_link_word_ptr((uw_object_hdr_t *)trap_object));
   uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
   uVar1 = (uVar2 & 0x1e00) >> 9;
   if ((short)uVar1 == 1) {
-     iVar5 = (char *)tilemap_lookup(*(byte *)(trap_object + 4) & 0x3f,*(ushort *)(trap_object + 6) & 0x3f);
+     iVar5 = (char *)tilemap_lookup(((uw_object_hdr_t *)trap_object)->quality,((uw_object_hdr_t *)trap_object)->owner);
     refresh_object_link_chain(iVar5 + 2,puVar4);
   }
   else {
     bVar3 = (byte)(uVar2 >> 8);
-     ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar2;
-     ((uw_object_hdr_t *)puVar4)->type_flags_high = ((byte)((uVar1 * 0x200 + -1) >> 8) ^ bVar3) & 0x1e ^ bVar3;
-     object_list_unlink(link_field,trap_object);
-     free_object_slot(trap_object);
+     ((uw_object_hdr_t *)puVar4)->flags_res = (uVar1 - 1) & 7;
+     ((uw_object_hdr_t *)puVar4)->enchanted = ((uVar1 - 1) >> 3) & 1;
+     object_list_unlink((uw_link_word_t *)link_field, (uw_object_hdr_t *)trap_object);
+     free_object_slot((uw_object_hdr_t *)trap_object);
   }
 }

@durability_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef bool, byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t;
@@
 bool apply_object_durability_damage(ushort *object, ushort *attacker, short damage, int tile_x, short tile_y)
 {
+   uw_object_hdr_t *object_hdr = (uw_object_hdr_t *)object;
   int iVar1;
   ushort uVar2;
   bool bVar3;
   int iVar4;
   int iVar5;
   uint uVar6;

-   if (((((uw_object_hdr_t *)object)->doordir == 0) &&
-        (uVar6 = ((byte) g_object_type_props[(((uw_object_hdr_t *)object)->object_id)].quality_flags & 0xc) >> 2, (short)uVar6 != 3)) &&
+   if (((object_hdr->doordir == 0) && (uVar6 = ((byte)g_object_type_props[(object_hdr->object_id)].quality_flags & 0xc) >> 2, (short)uVar6 != 3)) &&
       (iVar5 = (int)damage >> uVar6, 0 < (short)iVar5)) {
-     iVar4 = object_is_mobile(object);
+     iVar4 = object_is_mobile(object_hdr);
     if (iVar4 == 0) {
-       if ((0x13f < (((uw_object_hdr_t *)object)->object_id)) && ((((uw_object_hdr_t *)object)->object_id) < 0x148)) {
-         uVar2 = ((uw_object_hdr_t *)object)->link_word;
+       if ((0x13f < (object_hdr->object_id)) && ((object_hdr->object_id) < 0x148)) {
+         uVar2 = object_hdr->link_word;
         if (((uVar2 & 1) != 0) && ((uVar2 & 0x3e) != 0)) {
           uVar6 = (uVar2 >> 1 & 0x1f) - iVar5;
           if ((int)(uVar6 * 0x10000) >> 0x10 < 1) {
             uVar6 = 0;
           }
-           ((uw_object_hdr_t *)object)->link_word_low = (byte)(uVar2 & 0xffc1) | (byte)((uVar6 & 0x1f) << 1);
-           ((uw_object_hdr_t *)object)->link_word_high = (byte)(char)((uVar2 & 0xffc1) >> 8);
+           object_hdr->owner = (uVar2 & 1) | ((uVar6 & 0x1f) << 1);
           return false;
         }
       }
-       uVar2 = ((uw_object_hdr_t *)object)->chain_word;
+       uVar2 = object_hdr->chain_word;
       iVar5 = ((int)(short)uVar2 & 0x3fU) - iVar5;
       iVar1 = iVar5 * 0x10000 >> 0x10;
       if (iVar1 < 1) {
         iVar5 = 0;
       }
-       ((uw_object_hdr_t *)object)->chain_word_low = ((byte)uVar2 ^ (byte)iVar5) & 0x3f ^ (byte)uVar2;
-       ((uw_object_hdr_t *)object)->chain_word_high = (byte)(char)(uVar2 >> 8);
+       object_hdr->quality = iVar5 & 0x3f;
     }
     else {
       iVar5 = (uint)((uw_mobile_object_t *)object)->hit_points - iVar5;
       iVar1 = iVar5 * 0x10000 >> 0x10;
       if (iVar1 < 1) {
         iVar5 = 0;
       }
       ((uw_mobile_object_t *)object)->hit_points = (byte)(char)iVar5;
     }
     bVar3 = iVar1 < 1;
     if (((bVar3) && (iVar4 == 0)) && (-1 < (short)tile_x)) {
       trigger_object_trap_or_use_action(attacker,object,4,tile_x,tile_y);
     }
   }
   else {
     bVar3 = false;
   }
   return bVar3;
 }

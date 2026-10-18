@combat_stance_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, undefined1, undefined4, uw_mobile_object_t, uw_object_hdr_t;
@@
- int npc_combat_set_stance(ushort stance_code)
- {
-   int uw_ord2005_rem_47 = 0; int uw_ord2005_rem_48 = 0; int uw_ord2005_rem_49 = 0; int uw_ord2005_rem_50 = 0; int uw_ord2005_rem_51 = 0; int uw_ord2005_rem_52 = 0; int uw_ord2005_rem_53 = 0; int uw_ord2005_rem_54 = 0; int uw_ord2005_rem_55 = 0; int uw_ord2005_rem_56 = 0;
-   undefined1 uVar1;
-   ushort uVar2;
-   byte bVar3;
-   uint uVar4;
-   undefined4 uVar5;
-   char extraout_r1;
-   short extraout_r1_00;
-   int extraout_r1_01;
-   int extraout_r1_02;
-   int extraout_r1_03;
-   int extraout_r1_04;
-   int extraout_r1_05;
-   int extraout_r1_06;
-   int extraout_r1_07;
-   int iVar6;
-   char *iVar6_rec;
-   uint extraout_r1_08;
-   int iVar7;
-   byte bVar8;
-   uint uVar9;
-
-
-   uVar4 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
-   uVar9 = uVar4 & 0xff;
-   DAT_0010190c->hdr.heading = uVar4 & 0x7;
-   DAT_0010190c->npc_heading = 0;
-   uVar1 = (undefined1)(uVar9 << 5);
-   DAT_0010190c->full_heading = uVar1;
-   DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xbf;
-   if (stance_code < 0x31) {
-     uVar5 = ce_rand();
-     uw_ord2005_rem_47 = ((int)(uVar5)) % (4);
-     if (uw_ord2005_rem_47 != 0) {
-       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 199 | 7;
-       uw_ord2005_rem_48 = ((int)(uVar9 + 4)) % (8);
-       DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_48 << 5);
- LAB_00030534:
-       bVar8 = DAT_0010190c->motion_flags & 0x82 | 2;
-       goto LAB_000305e4;
-     }
-     uVar5 = ce_rand();
-     DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
-     uw_ord2005_rem_49 = ((int)(uVar5)) % (2);
-     uw_ord2005_rem_50 = ((int)(uVar9 + uw_ord2005_rem_49 * 4 + 6)) % (8);
-     DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_50 << 5);
-     iVar6_rec = (char *)DAT_0010190c;
-     bVar8 = DAT_0010190c->motion_flags;
-     bVar3 = ordint_divmod(3,(uint) DAT_00101404->magic_power << 1).quot;
-     ((uw_mobile_object_t *)iVar6_rec)->motion_flags = (bVar3 ^ bVar8) & 0x7f ^ bVar8;
-   }
-   else {
-     if (0x51 < stance_code) {
-       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
-       DAT_0010190c->full_heading = uVar1;
-       goto LAB_00030534;
-     }
-     uVar5 = ce_rand();
-     bVar8 = DAT_00101404->dexterity;
-     uw_ord2005_rem_51 = ((int)(uVar5)) % (0x40);
-     if (uw_ord2005_rem_51 < (int)(uint)bVar8) {
-       uVar5 = ce_rand();
-       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
-       uw_ord2005_rem_52 = ((int)(uVar5)) % (8);
-       DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_52 << 5);
-       bVar8 = DAT_0010190c->motion_flags & 0x81 | 1;
-     }
-     else {
-       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
-       DAT_0010190c->full_heading = uVar1;
-       bVar8 = DAT_0010190c->motion_flags & 0x80;
-     }
- LAB_000305e4:
-     DAT_0010190c->motion_flags = bVar8;
-   }
-   if ((DAT_00101404->movement_flags & 0x80) != 0) {
-     iVar6 = (int)((((*(byte *)(DAT_00101400 + 2) & 0x7f) - (DAT_0010190c->hdr.zpos)) +
-                    0xe) * 0x1000000) >> 0x18;
-     if (iVar6 < 2) {
-       if (iVar6 < -1) {
-         bVar8 = DAT_0010190c->attack_pitch & 7 | 0x70;
-       }
-       else {
-         uVar5 = ce_rand();
-         uw_ord2005_rem_53 = ((int)(uVar5)) % (3);
-         bVar8 = DAT_0010190c->attack_pitch & 7 ^ (uw_ord2005_rem_53 + '\x0f') * '\b';
-       }
-     }
-     else {
-       bVar8 = DAT_0010190c->attack_pitch & 7 | 0x90;
-     }
-     DAT_0010190c->attack_pitch = bVar8;
-   }
-   if (stance_code < 0x65) {
-     uVar5 = ce_rand();
-     uw_ord2005_rem_54 = ((int)(uVar5)) % (4);
-     if (uw_ord2005_rem_54 == 0) {
-       uVar5 = ce_rand();
-       uw_ord2005_rem_55 = ((int)(uVar5)) % (100);
-       iVar6 = (int)uw_ord2005_rem_55;
-       iVar7 = 0;
-       if ((int)(uint) DAT_00101404->attacks[0].probability <= iVar6) {
-         do {
-           if (1 < iVar7) break;
-           iVar6 = iVar6 - (uint) DAT_00101404->attacks[iVar7].probability;
-           iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
-         } while ((int)(uint) DAT_00101404->attacks[iVar7].probability <= (int)(iVar6) * 0x10000 >> 0x10);
-       }
-       DAT_0010190c->animation_flags =
-         ((char)iVar7 + 1U ^ DAT_0010190c->animation_flags) & 0x3f ^
-          DAT_0010190c->animation_flags;
-       DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
-       uVar4 = DAT_0010190c->goal_word & 0xfff;
-       DAT_0010190c->goal_word_low = (byte)(char)uVar4;
-       goto LAB_00030860;
-     }
-     uVar4 = (uint) DAT_0010190c->target_word;
-     if ((uVar4 & 0xf000) < 0xf000) {
-       DAT_0010190c->target_word_low = (byte)(char)(uVar4 & 0xfff);
-       DAT_0010190c->target_word_high =
-         (byte)(((uVar4 & 0xf000) + 0x1000) >> 8) ^ (byte)((uVar4 & 0xfff) >> 8);
-     }
-   }
-   DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
-   iVar6_rec = (char *)DAT_0010190c;
-   uVar2 = DAT_0010190c->goal_word;
-   uw_ord2005_rem_56 = ((int)((uVar2 >> 0xc) + 1)) % (4);
-   uVar9 = uVar2 & 0xfff;
-   uVar4 = uVar9 | (uw_ord2005_rem_56 & 0xf) << 0xc;
-   ((uw_mobile_object_t *)iVar6_rec)->goal_word_low = (byte)(char)uVar9;
- LAB_00030860:
-   DAT_0010190c->goal_word_high = (byte)(char)(uVar4 >> 8);
-   return 1;
- }
+ int npc_combat_set_stance(ushort stance_code)
+ {
+   int uw_ord2005_rem_47 = 0; int uw_ord2005_rem_48 = 0; int uw_ord2005_rem_49 = 0; int uw_ord2005_rem_50 = 0; int uw_ord2005_rem_51 = 0; int uw_ord2005_rem_52 = 0; int uw_ord2005_rem_53 = 0; int uw_ord2005_rem_54 = 0; int uw_ord2005_rem_55 = 0; int uw_ord2005_rem_56 = 0;
+   undefined1 uVar1;
+   ushort uVar2;
+   byte bVar3;
+   uint uVar4;
+   undefined4 uVar5;
+   char extraout_r1;
+   short extraout_r1_00;
+   int extraout_r1_01;
+   int extraout_r1_02;
+   int extraout_r1_03;
+   int extraout_r1_04;
+   int extraout_r1_05;
+   int extraout_r1_06;
+   int extraout_r1_07;
+   int iVar6;
+   uw_mobile_object_t *iVar6_rec;
+   uw_object_hdr_t *target_header;
+   uint extraout_r1_08;
+   int iVar7;
+   byte bVar8;
+   uint uVar9;
+
+
+   uVar4 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
+   uVar9 = uVar4 & 0xff;
+   DAT_0010190c->hdr.heading = uVar4 & 0x7;
+   DAT_0010190c->npc_heading = 0;
+   uVar1 = (undefined1)(uVar9 << 5);
+   DAT_0010190c->full_heading = uVar1;
+   DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xbf;
+   if (stance_code < 0x31) {
+     uVar5 = ce_rand();
+     uw_ord2005_rem_47 = ((int)(uVar5)) % (4);
+     if (uw_ord2005_rem_47 != 0) {
+       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 199 | 7;
+       uw_ord2005_rem_48 = ((int)(uVar9 + 4)) % (8);
+       DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_48 << 5);
+ LAB_00030534:
+       bVar8 = 2;
+       goto LAB_000305e4;
+     }
+     uVar5 = ce_rand();
+     DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
+     uw_ord2005_rem_49 = ((int)(uVar5)) % (2);
+     uw_ord2005_rem_50 = ((int)(uVar9 + uw_ord2005_rem_49 * 4 + 6)) % (8);
+     DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_50 << 5);
+     iVar6_rec = DAT_0010190c;
+     bVar8 = DAT_0010190c->gravity_flag;
+     bVar3 = ordint_divmod(3,(uint) DAT_00101404->magic_power << 1).quot;
+     iVar6_rec->speed = bVar3 & 0x7f;
+     iVar6_rec->gravity_flag = bVar8;
+   }
+   else {
+     if (0x51 < stance_code) {
+       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
+       DAT_0010190c->full_heading = uVar1;
+       goto LAB_00030534;
+     }
+     uVar5 = ce_rand();
+     bVar8 = DAT_00101404->dexterity;
+     uw_ord2005_rem_51 = ((int)(uVar5)) % (0x40);
+     if (uw_ord2005_rem_51 < (int)(uint)bVar8) {
+       uVar5 = ce_rand();
+       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
+       uw_ord2005_rem_52 = ((int)(uVar5)) % (8);
+       DAT_0010190c->full_heading = (byte)(uw_ord2005_rem_52 << 5);
+       bVar8 = 1;
+     }
+     else {
+       DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
+       DAT_0010190c->full_heading = uVar1;
+       bVar8 = 0;
+     }
+ LAB_000305e4:
+     DAT_0010190c->speed = bVar8;
+   }
+   if ((DAT_00101404->movement_flags & 0x80) != 0) {
+     target_header = (uw_object_hdr_t *)DAT_00101400;
+     iVar6 = (int)((((target_header->zpos) - (DAT_0010190c->hdr.zpos)) +
+                    0xe) * 0x1000000) >> 0x18;
+     if (iVar6 < 2) {
+       if (iVar6 < -1) {
+         bVar8 = 14;
+       }
+       else {
+         uVar5 = ce_rand();
+         uw_ord2005_rem_53 = ((int)(uVar5)) % (3);
+         bVar8 = uw_ord2005_rem_53 + 15;
+       }
+     }
+     else {
+       bVar8 = 18;
+     }
+     DAT_0010190c->pitch = bVar8;
+   }
+   if (stance_code < 0x65) {
+     uVar5 = ce_rand();
+     uw_ord2005_rem_54 = ((int)(uVar5)) % (4);
+     if (uw_ord2005_rem_54 == 0) {
+       uVar5 = ce_rand();
+       uw_ord2005_rem_55 = ((int)(uVar5)) % (100);
+       iVar6 = (int)uw_ord2005_rem_55;
+       iVar7 = 0;
+       if ((int)(uint) DAT_00101404->attacks[0].probability <= iVar6) {
+         do {
+           if (1 < iVar7) break;
+           iVar6 = iVar6 - (uint) DAT_00101404->attacks[iVar7].probability;
+           iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
+         } while ((int)(uint) DAT_00101404->attacks[iVar7].probability <= (int)(iVar6) * 0x10000 >> 0x10);
+       }
+       DAT_0010190c->animation_flags =
+         ((char)iVar7 + 1U ^ DAT_0010190c->animation_flags) & 0x3f ^
+          DAT_0010190c->animation_flags;
+       DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
+       uVar4 = 0;
+       goto LAB_00030860;
+     }
+     uVar4 = DAT_0010190c->npc_swing_charge;
+     if (uVar4 < 0xf) {
+       DAT_0010190c->npc_swing_charge = uVar4 + 1;
+     }
+   }
+   DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
+   uVar2 = DAT_0010190c->npc_animation_frame;
+   uw_ord2005_rem_56 = ((int)(uVar2 + 1)) % (4);
+   uVar4 = uw_ord2005_rem_56;
+ LAB_00030860:
+   DAT_0010190c->npc_animation_frame = uVar4;
+   return 1;
+ }

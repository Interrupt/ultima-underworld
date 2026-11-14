@trap_pair_exact disable optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_link_word_t;
@@
- int create_scripted_trap_pair_at_tile(int tile_x, int tile_y, uint code)
- {
-   int iVar1;
-   ushort uVar2;
-   byte bVar3;
-   ushort *puVar4;
-   ushort *puVar5;
-   byte *pbVar6;
-   uint uVar7;
-   undefined4 uVar8;
-   byte bVar9;
-   uint uVar10;
-   uint uVar11;
-   
-   puVar4 = (ushort *)alloc_object_slot(0);
-   if (puVar4 != (ushort *)0x0) {
-     puVar5 = (ushort *)alloc_object_slot(0);
-     if (puVar5 != (ushort *)0x0) {
-       pbVar6 = (byte *)tilemap_lookup(tile_x,tile_y);
-       uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
-       uVar7 = uVar2 & 0xffa0 | 0x61a0;
-       ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)uVar7;
-       uVar7 = ((uw_object_hdr_t *)puVar4)->position_word & 0xff80;
-       bVar9 = *pbVar6 >> 1 & 0x78;
-       ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)uVar7 | bVar9;
-       ((uw_object_hdr_t *)puVar4)->position_word_high = (byte)(char)(uVar7 >> 8);
-       ((uw_object_hdr_t *)puVar4)->position_word_low = bVar9;
-       ((uw_object_hdr_t *)puVar4)->position_word_high = 0x6c;
-       uVar7 = uVar2 & 0xf3a0 | 0x61a0;
-       ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar7;
-       ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(uVar7 >> 8) | 0x90;
-       ((uw_object_hdr_t *)puVar4)->chain_word_low = 0;
-       ((uw_object_hdr_t *)puVar4)->chain_word_high = 0;
-       uVar7 = encode_object_slot_index(puVar5);
-       iVar1 = (uVar7 & 0x3ff) << 6;
-       bVar3 = ((uw_object_hdr_t *)puVar4)->owner | (byte)iVar1;
-       uVar2 = ((uw_object_hdr_t *)puVar4)->chain_word;
-       bVar9 = (byte)uVar2;
-       ((uw_object_hdr_t *)puVar4)->chain_word_low = (bVar9 ^ (byte)tile_x) & 0x3f ^ bVar9;
-       ((uw_object_hdr_t *)puVar4)->chain_word_high = (byte)(char)(uVar2 >> 8);
-       ((uw_object_hdr_t *)puVar4)->link_word_low = (bVar3 ^ (byte)tile_y) & 0x3f ^ bVar3;
-       ((uw_object_hdr_t *)puVar4)->link_word_high = (byte)(char)((uint)iVar1 >> 8);
-       object_list_insert_head(pbVar6 + 2,puVar4);
-       uVar7 = ((uw_object_hdr_t *)puVar5)->type_flags & 0xff8f | 0x180;
-       uVar11 = (uVar7 ^ code) & 0xf ^ uVar7;
-       ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar11;
-       ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)(uVar7 >> 8) | 0x60;
-       bVar9 = *pbVar6 >> 1 & 0x78;
-       uVar7 = (uint)((uw_object_hdr_t *)puVar5)->position_word;
-       uVar10 = uVar7 & 0xff80;
-       ((uw_object_hdr_t *)puVar5)->position_word_low = bVar9 | (byte)uVar10;
-       ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)(char)(uVar10 >> 8);
-       uVar7 = uVar7 & 0x380;
-       ((uw_object_hdr_t *)puVar5)->position_word_low = bVar9 | (byte)uVar7;
-       ((uw_object_hdr_t *)puVar5)->position_word_high = (byte)(uVar7 >> 8) | 0x6c;
-       ((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner;
-       ((uw_object_hdr_t *)puVar5)->link_word_high = 0;
-       ((uw_object_hdr_t *)puVar5)->chain_word_low = 0x3f;
-       ((uw_object_hdr_t *)puVar5)->chain_word_high = 0;
-       uVar11 = uVar11 & 0xe3ff;
-       ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar11;
-       ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)(uVar11 >> 8) | 0xe2;
-       object_list_insert_head(pbVar6 + 2,puVar5);
-       uVar8 = encode_object_slot_index(puVar4);
-       return uVar8;
-     }
-     free_object_slot(puVar4);
-   }
-   return 0;
- }
+ int create_scripted_trap_pair_at_tile(int tile_x, int tile_y, uint code)
+ {
+   int iVar1;
+   ushort uVar2;
+   byte bVar3;
+   uw_object_hdr_t *puVar4;
+   uw_object_hdr_t *puVar5;
+   byte *pbVar6;
+   uint uVar7;
+   undefined4 uVar8;
+   byte bVar9;
+   uint uVar10;
+   uint uVar11;
+   
+   puVar4 = alloc_object_slot(0);
+   if (puVar4 != (uw_object_hdr_t *)0x0) {
+     puVar5 = alloc_object_slot(0);
+     if (puVar5 != (uw_object_hdr_t *)0x0) {
+       pbVar6 = (byte *)tilemap_lookup(tile_x,tile_y);
+       uVar2 = ((uw_object_hdr_t *)puVar4)->type_flags;
+       uVar7 = uVar2 & 0xffa0 | 0x61a0;
+       ((uw_object_hdr_t *)puVar4)->object_id = 0x1a0;
+       ((uw_object_hdr_t *)puVar4)->doordir = 1;
+       ((uw_object_hdr_t *)puVar4)->invisible = 1;
+       uVar7 = ((uw_object_hdr_t *)puVar4)->position_word & 0xff80;
+       bVar9 = *pbVar6 >> 1 & 0x78;
+       ((uw_object_hdr_t *)puVar4)->zpos = bVar9;
+       ((uw_object_hdr_t *)puVar4)->heading = 0;
+       ((uw_object_hdr_t *)puVar4)->ypos = 3;
+       ((uw_object_hdr_t *)puVar4)->xpos = 3;
+       uVar7 = uVar2 & 0xf3a0 | 0x61a0;
+       ((uw_object_hdr_t *)puVar4)->flags_res = (uVar7 >> 9) & 7;
+       ((uw_object_hdr_t *)puVar4)->enchanted = 1;
+       ((uw_object_hdr_t *)puVar4)->is_quant = 1;
+       ((uw_object_hdr_t *)puVar4)->quality = 0;
+       ((uw_object_hdr_t *)puVar4)->next = 0;
+       uVar7 = encode_object_slot_index(puVar5);
+       iVar1 = (uVar7 & 0x3ff) << 6;
+       bVar3 = ((uw_object_hdr_t *)puVar4)->owner | (byte)iVar1;
+       uVar2 = ((uw_object_hdr_t *)puVar4)->chain_word;
+       bVar9 = (byte)uVar2;
+       ((uw_object_hdr_t *)puVar4)->quality = (byte)tile_x & 0x3f;
+       ((uw_object_hdr_t *)puVar4)->owner = (byte)tile_y & 0x3f;
+       ((uw_object_hdr_t *)puVar4)->link = uVar7 & 0x3ff;
+       object_list_insert_head((uw_link_word_t *)(pbVar6 + 2), puVar4);
+       uVar7 = ((uw_object_hdr_t *)puVar5)->type_flags & 0xff8f | 0x180;
+       uVar11 = (uVar7 ^ code) & 0xf ^ uVar7;
+       ((uw_object_hdr_t *)puVar5)->object_id = 0x180 | (code & 0xf);
+       ((uw_object_hdr_t *)puVar5)->doordir = 1;
+       ((uw_object_hdr_t *)puVar5)->invisible = 1;
+       bVar9 = *pbVar6 >> 1 & 0x78;
+       uVar7 = (uint)((uw_object_hdr_t *)puVar5)->position_word;
+       uVar10 = uVar7 & 0xff80;
+       uVar7 = uVar7 & 0x380;
+       ((uw_object_hdr_t *)puVar5)->zpos = bVar9;
+       ((uw_object_hdr_t *)puVar5)->ypos = 3;
+       ((uw_object_hdr_t *)puVar5)->xpos = 3;
+       ((uw_object_hdr_t *)puVar5)->link = 0;
+       ((uw_object_hdr_t *)puVar5)->quality = 0x3f;
+       ((uw_object_hdr_t *)puVar5)->next = 0;
+       uVar11 = uVar11 & 0xe3ff;
+       ((uw_object_hdr_t *)puVar5)->flags_res = 1;
+       ((uw_object_hdr_t *)puVar5)->enchanted = 0;
+       ((uw_object_hdr_t *)puVar5)->is_quant = 1;
+       object_list_insert_head((uw_link_word_t *)(pbVar6 + 2), puVar5);
+       uVar8 = encode_object_slot_index(puVar4);
+       return uVar8;
+     }
+     free_object_slot(puVar4);
+   }
+   return 0;
+ }

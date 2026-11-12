/* Sprite blitting and the sprite-list system: raw/remapped sprite blitting, sprite-by-id drawing,
   and the sprite list's own entry allocation/positioning/lifetime management (the moving-object-
   overlay renderer used for HUD icons, thrown/dropped items, and other transient sprites). */
#include "headers/editor.h"
#include "headers/bitmap.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

byte *DAT_000b4628;
byte *DAT_000b461c;
/* Was `int` / `undefined4` -- both hold real pointers (DAT_000b4614 + an offset; a color-remap
   table row) that got truncated to 32 bits on this 64-bit host, so the sprite-blit color-remap read
   (`*(byte *)(DAT_000b4610 + bVar1)` in blit_sprite_row_remapped) dereferenced a wild address. */
byte *DAT_000b4610;
/* Was `undefined4`, silently 0 -- a link-time-initialized pointer constant this decompile never
   writes (holds 0xb45f0 in UU.exe, i.e. the address of a 0x20-byte sprite-row scratch buffer). */
/* Sizing-audit pass: `ce_memset(DAT_000842ac,10,0x20)` -- exact
   32-byte real need. Down from 4096. */
 undefined1 DAT_000842ac_backing[32];
char *DAT_000b4614;
byte *DAT_000b5630;
/* struct-recovery-plan.md's "DAT_0024e090 pointer table" candidate: a large table of
   glyph/resource-pointer slots indexed by font/char/ frame id... */
void *g_grtile_registry[65536];
ushort DAT_00202738;
ushort DAT_00202730;
/* Was `static undefined DAT_000859fc_backing[8192]` -- real bytes spell "lfti\0", matching LFTI.GR.
   See s_optb_000859ac's comment. This is the one loaded right after TMOBJ.GR -- the resource the
   mode-icon highlight (mode_icon_highlight_on/mode_icon_highlight_off) actually indexes into. */
char s_lfti_000859fc[] = "lfti";
/* DAT_00086a18 and DAT_00086a20 are now offsets into DAT_00086a00_region
   (real bytes recovered from UU.exe) -- see its definition further down. */
// Was a lone `int` scalar but used throughout the renderer as a pointer to a ~0x2e-byte "current
// view" record (screen-space player x/y/z/facing, written by update_current_view_from_subject from
// DAT_00204880/82/84 + DAT_00201c70, then read all over the tile/sprite projection code).
 undefined1 DAT_00086e6c_backing[64];
char *DAT_0023c3e8;
/* Was `int`, truncating the real pointer assigned to it (`DAT_0023c3e8 + 0x500`, a genuine 64-bit
   heap pointer on this host) -- every comparison against it (`DAT_0023c3ec <= someRealPointer`)
   then always came out true regardless of the real slot table's size... */
char *DAT_0023c3ec;
char *DAT_0023c40c;
char *DAT_0023c3e4;
undefined2 DAT_0023c41c;
static ushort DAT_0023c400;
static short DAT_0023c3f4;






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_000125a8 -- lowest-level raw (already-decoded, uncompressed) sprite blit primitive: draws
// a pre-decoded pixel buffer...
/* Source-bitmap pointer -- was `int`, truncating the real `char *` the caller
   (blit_object_sprite_by_frame) already reconstructed (iVar4 + 5). */
void blit_raw_sprite_clipped(short x, short y, char *pixels, short height, short width, short src_x, short src_y, int transparent)
{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  short sVar12;
  int iVar13;
  int iVar14;
  short local_3c;
  short local_38;
  short local_34;
  
  iVar13 = (int)src_x;
  sVar1 = (short)((uint)((width - iVar13) * 0x10000) >> 0x10);
  local_38 = 0;
  sVar12 = 0;
  local_3c = 0;
  iVar14 = (int)x;
  if (iVar14 < 0) {
    local_38 = (short)((uint)(iVar14 * -0x10000) >> 0x10);
  }
  iVar6 = (int)y;
  if (iVar6 < 0) {
    local_3c = (short)((uint)(iVar6 * -0x10000) >> 0x10);
  }
  iVar2 = (int)sVar1;
  if (0x140 < iVar14 + iVar2) {
    sVar12 = x + sVar1 + -0x140;
  }
  sVar1 = (short)((uint)(((int)height - (int)src_y) * 0x10000) >> 0x10);
  iVar3 = (int)sVar1;
  if (iVar6 + iVar3 < 0xc9) {
    local_34 = 0;
  }
  else {
    local_34 = y + sVar1 + -200;
  }
  pixels = src_y * iVar2 + iVar13 + pixels;
  /* Same missing-4th-argument K&R-call bug as bitmap_blit_to_framebuffer's own dirty_rect_union
     call (see graphics.c's fix comment) -- this is the more directly relevant instance for
     inventory icons specifically... */
  dirty_rect_union(iVar6,iVar6 + iVar3,iVar14,iVar14 + iVar2);
  if (g_blit_transparent_mode == 0) {
    iVar11 = (int)local_3c;
    iVar4 = iVar3 - local_34;
    if (iVar11 < iVar4) {
      iVar7 = (int)local_38;
      iVar8 = iVar2 * iVar11;
      iVar14 = (iVar6 + iVar11) * 0x140 + iVar14;
      do {
        if (iVar7 < iVar2 - sVar12) {
          iVar5 = iVar8 + iVar7;
          iVar6 = (iVar14 + iVar7) * 2;
          iVar10 = iVar7;
          do {
            *(undefined2 *)(iVar6 + (g_uw_framebuffer)) =
                 (&g_palette_rgb565)[*(byte *)(iVar5 + pixels)];
            if (iVar3 * iVar2 + -5 < iVar5) {
              return;
            }
            iVar10 = iVar10 + 1;
            iVar6 = iVar6 + 2;
            iVar5 = iVar5 + 1;
          } while (iVar10 < iVar2 - sVar12);
        }
        iVar11 = iVar11 + 1;
        iVar14 = iVar14 + 0x140;
        pixels = iVar13 + pixels;
        iVar8 = iVar2 + iVar8;
      } while (iVar11 < iVar4);
    }
  }
  else {
    iVar4 = (int)local_3c;
    iVar11 = iVar3 - local_34;
    if (iVar4 < iVar11) {
      iVar8 = (int)local_38;
      iVar7 = iVar2 * iVar4;
      iVar14 = (iVar6 + iVar4) * 0x140 + iVar14;
      do {
        if (iVar8 < iVar2 - sVar12) {
          iVar10 = iVar7 + iVar8;
          iVar6 = iVar8;
          do {
            uVar9 = (uint)*(byte *)(iVar2 * iVar4 + pixels + iVar6);
            if (uVar9 != 0) {
              *(undefined2 *)((g_uw_framebuffer) + (iVar14 + iVar6) * 2)
                   = (&g_palette_rgb565)[uVar9];
            }
            if (iVar3 * iVar2 + -5 < iVar10) {
              return;
            }
            iVar6 = iVar6 + 1;
            iVar10 = iVar10 + 1;
          } while (iVar6 < iVar2 - sVar12);
        }
        iVar4 = iVar4 + 1;
        iVar7 = iVar2 + iVar7;
        pixels = iVar13 + pixels;
        iVar14 = iVar14 + 0x140;
      } while (iVar4 < iVar11);
    }
  }
}




// was FUN_00013170
void blit_sprite_row_remapped(int unused, uint pixel, uint remap_index, uint shade)
{
  byte bVar1;
  uint uVar2;
  uint uVar3;
  int iVar4;
  
  uVar3 = (shade & 0xffff) >> 8;
  DAT_000b461c = DAT_000842ac;
  DAT_000b4628 = DAT_000842ac;
  if (uVar3 == 0xff) {
    uVar3 = (remap_index & 0xfff) * 0x10;
    uVar2 = remap_index & 0xfff;
    while (uVar2 != 0) {
      *DAT_000b461c = *DAT_000b5630;
      DAT_000b461c = DAT_000b461c + 1;
      DAT_000b5630 = DAT_000b5630 + 1;
      uVar3 = uVar3 - 1;
      uVar2 = uVar3;
    }
  }
  else {
    uVar3 = merge_byte_into_word(pixel & 0xff | uVar3 << 8,0,0);
    DAT_000b4610 = (byte *)(DAT_000b4614 + (uVar3 & 0xffff));
    for (remap_index = remap_index & 0xffff; remap_index != 0; remap_index = remap_index - 1) {
      iVar4 = 0x10;
      do {
        iVar4 = iVar4 + -1;
        bVar1 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        *DAT_000b461c = *(byte *)((char *)DAT_000b4610 + (uint)bVar1);
        DAT_000b461c = DAT_000b461c + 1;
      } while (iVar4 != 0);
    }
  }
  DAT_000b4610 = DAT_000842ac;
}




// was FUN_00040918
void blit_object_sprite_by_frame(short frame, int x, int y, int width, int height)
{
  char cVar1;
  char cVar2;
  char *pcVar3;
  char *iVar4;

  /* g_grtile_registry is a flat pointer array -- see its declaration comment; iVar4 is dereferenced
     as a pointer below (iVar4+5, matching the pcVar3+5 idiom in the branch right above it), so it's
     retyped from int to char* rather than truncated through a 4-byte read. */
  iVar4 = (char *)g_grtile_registry[frame];
  if (iVar4 == (char *)0x0) {
    /* Table slot never populated. */
    static char dummy_sprite[8];
    iVar4 = dummy_sprite;
  }
  if ((int)frame < (int)(uint)DAT_00202738) {
    /* argument dropped by Ghidra here; frame matches the lookup right above */
    pcVar3 = (char *)lookup_grtile_by_id(frame);
    if (pcVar3 != (char *)0x0) {
      cVar1 = pcVar3[1];
      cVar2 = pcVar3[2];
      if (*pcVar3 == '\x04') {
        pcVar3 = pcVar3 + 5;
      }
      else {
        /* Same dropped 3rd argument (the .GR entry's compression mode, 6/8/0xa) already root-caused
           and fixed in decode_tile_object_billboard_texture's identical call (see
           object-rendering-findings.txt's "MILESTONE: objects render" section) -- without it... */
        pcVar3 = (char *)decompress_gr_bitmap(pcVar3 + 4,&DAT_00202520 + (uint)(byte)pcVar3[3] * 0x10,*pcVar3);
      }
      bitmap_blit_to_framebuffer(x,y,pcVar3,cVar2,cVar1,0,0,0);
    }
  }
  else {
    blit_raw_sprite_clipped(x,y,iVar4 + 5,*(undefined1 *)(iVar4 + 2),*(undefined1 *)(iVar4 + 1),0,0
                 ,0);
  }
}




// was FUN_00040b0c
void draw_sprite_by_id(int sprite_id, int x, int y, int width, short height)
{
  bool bVar1;
  undefined4 uVar2;
  
  dirty_rect_union((int)(short)y,(int)(short)y + (int)(short)width,(int)(short)x,
               (int)(short)x + (int)height);
  if (((short)sprite_id < 0x101b) || (0x101e < (short)sprite_id)) {
    bVar1 = false;
  }
  else {
    bVar1 = true;
    g_blit_transparent_mode = 1;
  }
  uVar2 = resolve_sprite_id_to_frame(sprite_id);
  blit_object_sprite_by_frame(uVar2,x,y,width,height);
  if (bVar1) {
    g_blit_transparent_mode = 0;
  }
}




// was FUN_00040be0 -- the sprite-list compositor flush loop's second draw path ("path=FUN_00040be0"
// in --diag-sprlist output, taken for entries with puVar4[5]!=0), a sibling of
// draw_sprite_by_id...
void sprite_list_flush_blit_raw(int sprite_id, int x, int y, short clip_top, short width, short clip_rows)
{
  short sVar1;

  /* Dropped argument (confirmed via disassembly of 0x40be0: `bl 0x40aa8` executes before this
     function's prologue ever touches r0, so the real ARM code passes this function's own sprite_id
     through to resolve_sprite_id_to_frame via register reuse)... */
  sVar1 = resolve_sprite_id_to_frame(sprite_id);
  /* g_grtile_registry is a flat pointer array -- see its declaration
     comment; mirrors the iVar4+5 idiom in blit_object_sprite_by_frame. */
  {
    static char dummy_sprite[8];
    char *spr = (char *)g_grtile_registry[sVar1];
    if (spr == (char *)0x0) spr = dummy_sprite;  /* unregistered slot -- see blit_object_sprite_by_frame */
    blit_raw_sprite_clipped(x,y,spr + 5,
                 ((int)clip_top + (int)clip_rows) * 0x10000 >> 0x10,width,0,clip_rows,1);
  }
}




// was FUN_00064f10
void sprite_partition_step(int condition, short *out_index, short entry_value, short low, short high, short phase)
{
  int iVar1;
  ushort uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_34 [4];
  
  if (condition == 0) {
    local_34[2] = 1;
    local_34[1] = low + -1;
    sVar4 = 0;
    local_34[3] = 0xffff;
  }
  else {
    local_34[2] = 0xffff;
    local_34[1] = 0;
    local_34[3] = 1;
    sVar4 = low + -1;
  }
  local_34[0] = sVar4;
  iVar5 = 0;
  if (0 < low) {
    do {
      iVar1 = (int)(short)iVar5;
      if (iVar1 != entry_value) {
        if (phase == 0) {
          char *_o = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[iVar1]);
          uVar2 = ((uw_object_hdr_t *)_o)->zpos;   /* was `int iVar3` -- truncated the object pointer */
        }
        else {
          uVar2 = (ushort)(char)(&DAT_0023bb98)[(int)phase + iVar1 * 4];
        }
        sVar4 = local_34[(short)(ushort)(high < (short)uVar2)];
        (&DAT_0023b8c8)[sVar4] = (char)iVar5;
        local_34[(short)(ushort)(high < (short)uVar2)] =
             local_34[(short)(ushort)(high < (short)uVar2) + 2] + sVar4;
        sVar4 = local_34[0];
      }
      iVar1 = (iVar1 + 1) * 0x10000;
      iVar5 = iVar1 >> 0x10;
    } while ((short)((uint)iVar1 >> 0x10) < low);
  }
  if ((int)sVar4 == (int)local_34[1]) {
    *out_index = sVar4;
    (&DAT_0023b8c8)[sVar4] = (char)entry_value;
  }
}



// was FUN_0006508c
/* was undefined4 -- sprite_partition_step writes through it (*param_2 = ...) */
void sprite_partition_tmap(int entry_index, short *out_index, int extra)
{
  char *_o;
  byte bVar2;

  _o = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[(short)entry_index]);  /* was `int iVar1` */
  bVar2 = ((uw_object_hdr_t *)_o)->zpos;
  sprite_partition_step((g_player_object->hdr.zpos) < bVar2,out_index,
                        entry_index,extra,bVar2,0);
}



// was FUN_00065128
/* was undefined4 -- sprite_partition_step dereferences it (*param_2 = ...) */
void sprite_partition_by_depth(int entry_index, short *out_index, int extra)
{
  int iVar1;
  char cVar2;
  undefined2 uVar3;
  short sVar4;
  char *_o;   /* was `int iVar5` -- truncated the get_object_record_by_slot_index object pointer */
  undefined4 uVar6;
  short sVar7;
  undefined2 uVar8;

  _o = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[(short)entry_index]);
  iVar1 = (short)entry_index * 4;
  if (((((uw_object_hdr_t *)_o)->position_word >> 7) + DAT_0023b4a0 * -2 & 3) == 0) {
    uVar3 = 2;
    sVar4 = (short)(char)(&DAT_0023bb9a)[iVar1];
LAB_000651b0:
    sVar7 = sVar4;
    uVar8 = uVar3;
    uVar6 = 1;
  }
  else {
    uVar8 = 1;
    cVar2 = (&DAT_0023bb99)[iVar1];
    sVar7 = (short)cVar2;
    if (DAT_0023bb94 != '\x02') {
      uVar3 = 1;
      sVar4 = (short)cVar2;
      if (DAT_0023bb94 == '\x01') goto LAB_000651b0;
      uVar6 = 1;
      if (g_current_view->view_x >> 5 < (short)cVar2) goto LAB_000651ec;
    }
    uVar6 = 0;
  }
LAB_000651ec:
  sprite_partition_step(uVar6,out_index,entry_index,extra,sVar7,uVar8);
}




// was FUN_00075cb8 -- part of the sprite-list compositor family (alongside
// sprite_list_set_rect/set_position/set_frame_id* and sprite_list_set_lifetime, all indexing the
// same DAT_0023c3e8 slot- record array).
void sprite_list_queue_slot_redraw(ushort slot)
{
  uint uVar1;
  ushort *puVar2;
  /* Was `int`, truncating `slot*0x14 + DAT_0023c3e8` -- DAT_0023c3e8 is the real 64-bit sprite-list
     record heap block -- and every deref below (`*(ushort *)(iVar3 + 2)` .. `+ 0xc`) then read a
     bounding box out of a wild address... */
  char *iVar3;
  uint uVar4;
  ushort *puVar5;
  ushort uVar6;
  ushort *puVar7;
  ushort *puVar8;
  short sVar9;
  uint uVar10;
  
  uVar1 = (uint)slot;
  DAT_0023c41c = 1;
  puVar5 = (ushort *)(uVar1 * 0x14 + DAT_0023c3e8);
  puVar2 = (ushort *)(DAT_0023c40c + (uint)puVar5[6] * 0x40);
  puVar7 = puVar2;
  for (uVar6 = *puVar2; puVar7 = puVar7 + 1, uVar6 != 0; uVar6 = uVar6 - 1) {
    if (*puVar7 == uVar1) goto LAB_00075d78;
  }
  *puVar2 = *puVar2 + 1;
  *puVar7 = slot;
LAB_00075d78:
  puVar2 = (ushort *)(DAT_0023c3e4 + (uint)puVar5[6] * 0x40);
  uVar6 = *puVar2;
  uVar10 = (uint)uVar6 << 0x10;
  puVar7 = puVar2;
  do {
    puVar8 = puVar7 + 1;
    if (uVar10 >> 0x10 == 0) {
      if ((*puVar5 & DAT_0008763c) != 0) {
        *puVar2 = uVar6 + 1;
        *puVar8 = slot;
      }
LAB_00075e04:
      uVar10 = (puVar5[6] + 1) * 0x20;
      uVar4 = (puVar5[6] + 1 & 0x7ff) << 5;
      DAT_0023c400 = (ushort)uVar10;
      sVar9 = DAT_0023c3f4;
      do {
        if (0x7f < uVar4) {
          DAT_0023c3f4 = sVar9;
          return;
        }
        DAT_0023c3f4 = *(short *)(DAT_0023c3e4 + uVar4 * 2);
        if (DAT_0023c3f4 != 0) {
          do {
            iVar3 = (uint)*(ushort *)(DAT_0023c3e4 + uVar4 * 2 + 2) * 0x14 + DAT_0023c3e8;
            if ((*(ushort *)(iVar3 + 2) <= (ushort)(puVar5[3] + puVar5[1])) &&
               (puVar5[1] <= (ushort)(*(short *)(iVar3 + 6) + *(ushort *)(iVar3 + 2)))) {
              if ((*(ushort *)(iVar3 + 4) <= (ushort)(puVar5[4] + puVar5[2])) &&
                 (puVar5[2] <= (ushort)(*(short *)(iVar3 + 8) + *(ushort *)(iVar3 + 4)))) {
                uVar4 = (uint)*(ushort *)(iVar3 + 0xc);
                puVar2 = (ushort *)(DAT_0023c40c + uVar4 * 0x40);
                puVar7 = puVar2;
                for (uVar6 = *puVar2; puVar7 = puVar7 + 1, uVar6 != 0; uVar6 = uVar6 - 1) {
                  if (*puVar7 == uVar1) goto LAB_00076038;
                }
                *puVar2 = *puVar2 + 1;
                *puVar7 = slot;
                uVar10 = (uint)DAT_0023c400;
              }
            }
LAB_00076038:
            sVar9 = DAT_0023c3f4 + -1;
            DAT_0023c3f4 = 0;
          } while (sVar9 == 0);
        }
        DAT_0023c3f4 = sVar9;
        uVar10 = uVar10 + 0x20;
        uVar4 = uVar10 & 0xffff;
        DAT_0023c400 = (ushort)uVar10;
        sVar9 = DAT_0023c3f4;
      } while( true );
    }
    if (*puVar8 == uVar1) {
      if ((*puVar5 & DAT_0008763c) == 0) {
        *puVar7 = puVar2[uVar6];
        if (*puVar2 != 0) {
          *puVar2 = *puVar2 - 1;
        }
      }
      goto LAB_00075e04;
    }
    uVar10 = ((uVar10 >> 0x10) + 0xffff) * 0x10000;
    puVar7 = puVar8;
  } while( true );
}



// was FUN_00076078 -- allocates a new sprite-list compositor slot (linear scan of DAT_0023c3e8's
// fixed 0x40-entry array for a free record, matching sprite_list_set_rect/set_position's own
// `param_1 < 0x40` bound), stores param_1 as the slot's resource/frame id...
int sprite_list_alloc_entry(int resource_id)
{
  ushort uVar1;
  uint uVar2;
  short sVar3;
  ushort *puVar4;
  uint uVar5;
  bool bVar6;
  
  puVar4 = (ushort *)DAT_0023c3e8;
  while( true ) {
    if ((ushort *)DAT_0023c3ec <= puVar4) {
      return -1;
    }
    if ((DAT_00087638 & *puVar4) == 0) break;
    puVar4 = puVar4 + 10;
  }
  uVar1 = DAT_00087640 | DAT_00087638;
  *(char *)puVar4 = (char)uVar1;
  *(char *)((char *)puVar4 + 1) = (char)(uVar1 >> 8);
  bVar6 = g_blit_transparent_mode != 0;
  uVar5 = (uint)uVar1;
  uVar2 = 0;
  if (bVar6) {
    uVar5 = (uint)DAT_00087648;
    uVar2 = (uint)uVar1;
  }
  *(char *)(puVar4 + 6) = (char)resource_id;
  if (bVar6) {
    *(char *)puVar4 = (char)(uVar2 | uVar5);
    *(char *)((char *)puVar4 + 1) = (char)((uVar2 | uVar5) >> 8);
  }
  *(char *)((char *)puVar4 + 0xd) = (char)((uint)resource_id >> 8);
  *(undefined1 *)(puVar4 + 8) = 0;
  *(undefined1 *)((char *)puVar4 + 0x11) = 0;
  *(undefined1 *)(puVar4 + 9) = 0;
  *(undefined1 *)((char *)puVar4 + 0x13) = 0;
  *(undefined1 *)(puVar4 + 5) = 0;
  *(undefined1 *)((char *)puVar4 + 0xb) = 0;
  sVar3 = ordint_divmod(0x14,(int)((char *)puVar4 - DAT_0023c3e8)).quot;
  return (int)sVar3;
}



// was FUN_00076194 -- sibling of sprite_list_alloc_entry: allocates a new compositor slot the same
// way, but also allocates a fresh raw pixel buffer for it...
int sprite_list_alloc_raw_entry(int resource_id, int alloc_arg, int pixel_count)
{
  ushort uVar1;
  short sVar2;
  int iVar3;
  undefined1 uVar4;
  ushort *puVar5;
  bool bVar6;
  
  puVar5 = (ushort *)DAT_0023c3e8;
  while( true ) {
    if ((ushort *)DAT_0023c3ec <= puVar5) {
      return -1;
    }
    if ((DAT_00087638 & *puVar5) == 0) break;
    puVar5 = puVar5 + 10;
  }
  uVar1 = DAT_00087640 | DAT_00087638;
  *(char *)puVar5 = (char)uVar1;
  *(char *)((char *)puVar5 + 1) = (char)(uVar1 >> 8);
  bVar6 = g_blit_transparent_mode != 0;
  uVar4 = 0;
  if (bVar6) {
    uVar4 = (undefined1)((uVar1 | DAT_00087648) >> 8);
    *(char *)puVar5 = (char)(uVar1 | DAT_00087648);
  }
  if (bVar6) {
    *(undefined1 *)((char *)puVar5 + 1) = uVar4;
  }
  iVar3 = grtile_alloc_registered(alloc_arg,pixel_count << 1);
  if (iVar3 == 0) {
    return -1;
  }
  *(char *)(puVar5 + 8) = (char)iVar3;
  *(char *)((char *)puVar5 + 0xd) = (char)((uint)resource_id >> 8);
  *(char *)((char *)puVar5 + 0x11) = (char)((uint)iVar3 >> 8);
  *(char *)(puVar5 + 6) = (char)resource_id;
  *(char *)(puVar5 + 9) = (char)((uint)iVar3 >> 0x10);
  *(char *)((char *)puVar5 + 0x13) = (char)((uint)iVar3 >> 0x18);
  *(undefined1 *)(puVar5 + 5) = 0;
  *(undefined1 *)((char *)puVar5 + 0xb) = 0;
  sVar2 = ordint_divmod(0x14,(int)((char *)puVar5 - DAT_0023c3e8)).quot;
  return (int)sVar2;
}



// was FUN_000762c4 -- sets a compositor slot's full geometry (x, y, w, h) in one call, used at
// creation time (redraw_hud_panels calls this right after allocating each
// dragon/compass/status-icon slot to establish its rect).
int sprite_list_set_rect(short slot, int x, int y, int width, short height)
{
  undefined4 uVar1;
  /* Was `int`, truncating the real DAT_0023c3e8 slot-record pointer
     computed here (same bug as its sibling functions sprite_list_set_position and
     sprite_list_set_lifetime below, which compute the identical expression). */
  char * iVar2;

  if (slot < 0x40) {
    iVar2 = slot * 0x14 + DAT_0023c3e8;
    *(char *)(iVar2 + 6) = (char)width;
    *(char *)(iVar2 + 7) = (char)((uint)width >> 8);
    *(char *)(iVar2 + 2) = (char)x;
    *(char *)(iVar2 + 8) = (char)height;
    *(char *)(iVar2 + 4) = (char)y;
    *(char *)(iVar2 + 3) = (char)((uint)x >> 8);
    *(char *)(iVar2 + 5) = (char)((uint)y >> 8);
    *(char *)(iVar2 + 9) = (char)((ushort)height >> 8);
    sprite_list_queue_slot_redraw((ushort)slot);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar1 = 0;
  }
  else {
    uVar1 = 0xffffffff;
  }
  return uVar1;
}



// was FUN_00076338 -- updates an already-allocated compositor slot's x/y position only (its
// width/height, set once by sprite_list_set_rect, are left alone). Called every tick by
// hud_compass_needle_tick to move the needle sprite through its 16-heading ellipse.
int sprite_list_set_position(short slot, int x, int y)
{
  undefined4 uVar1;
  char * iVar2;

  if (slot < 0x40) {
    iVar2 = slot * 0x14 + DAT_0023c3e8;
    *(char *)(iVar2 + 2) = (char)x;
    *(char *)(iVar2 + 4) = (char)y;
    *(char *)(iVar2 + 3) = (char)((uint)x >> 8);
    *(char *)(iVar2 + 5) = (char)((uint)y >> 8);
    sprite_list_queue_slot_redraw((ushort)slot);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar1 = 0;
  }
  else {
    uVar1 = 0xffffffff;
  }
  return uVar1;
}



// was FUN_00076390 -- updates an already-allocated compositor slot's displayed sprite/frame id
// (offset+7/+0xf, separate from whatever resource id sprite_list_alloc_entry stored at creation)
// and ORs DAT_0008763c into the slot's flags word to mark it dirty.
int sprite_list_set_frame_id(short slot, int frame_id)
{
  ushort uVar1;
  undefined4 uVar2;
  ushort *puVar3;

  if (slot < 0x40) {
    puVar3 = (ushort *)(slot * 0x14 + DAT_0023c3e8);
    *(char *)(puVar3 + 7) = (char)frame_id;
    *(char *)((char *)puVar3 + 0xf) = (char)((uint)frame_id >> 8);
    uVar1 = *puVar3 | DAT_0008763c;
    *(char *)puVar3 = (char)uVar1;
    *(char *)((char *)puVar3 + 1) = (char)(uVar1 >> 8);
    sprite_list_queue_slot_redraw((ushort)slot);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar2 = 0;
  }
  else {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}



// was FUN_00076404 -- sprite_list_set_frame_id's transparent-blit
// sibling; see that function's own comment.
int sprite_list_set_frame_id_transparent(short slot, int frame_id)
{
  ushort uVar1;
  undefined4 uVar2;
  ushort *puVar3;

  if (slot < 0x40) {
    puVar3 = (ushort *)(slot * 0x14 + DAT_0023c3e8);
    *(char *)(puVar3 + 7) = (char)frame_id;
    *(char *)((char *)puVar3 + 0xf) = (char)((uint)frame_id >> 8);
    uVar1 = *puVar3 | DAT_00087648 | DAT_0008763c;
    *(char *)puVar3 = (char)uVar1;
    *(char *)((char *)puVar3 + 1) = (char)(uVar1 >> 8);
    sprite_list_queue_slot_redraw((ushort)slot);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar2 = 0;
  }
  else {
    uVar2 = 0xffffffff;
  }
  return uVar2;
}




// was FUN_0007699c
int sprite_list_set_lifetime(short slot, int lifetime)
{
  undefined4 uVar1;
  char * iVar2;
  
  if (slot < 0x40) {
    iVar2 = slot * 0x14 + DAT_0023c3e8;
    *(char *)(iVar2 + 10) = (char)lifetime;
    *(char *)(iVar2 + 0xb) = (char)((uint)lifetime >> 8);
    sprite_list_queue_slot_redraw((ushort)slot);  /* arg dropped by Ghidra -- the slot index; without it the sprite never queued in the compositor (dragon/compass HUD not drawn) */
    uVar1 = 0;
  }
  else {
    uVar1 = 0xffffffff;
  }
  return uVar1;
}



/* param_1 = object sprite id, param_2 = shade -- both were dropped by Ghidra at the
   emit_tile_objects call site AND on the resolve_sprite_id_to_frame / lookup_grtile_by_id calls
   below... */
// was FUN_00040770
int decode_tile_object_billboard_texture(short frame, uint unused)
{
  byte bVar1;
  byte bVar2;
  char *pcVar3;
  void *buf;
  int iVar5;
  int resolved;

  (void)unused;
  /* HACK: not original behaviour -- the level editor (editor.c) draws objects as editor sprites (an object's icon, or a marker for what has none)
     in its Triggers and Markers view modes: frames in this range are those sprites, whose pixels it supplies. */
  const unsigned char *editor_pixels = NULL;
  int editor_w = 0, editor_h = 0;
  if (frame >= UW_EDITOR_SPRITE_BASE && frame < UW_EDITOR_SPRITE_BASE + 0x200)
    editor_pixels = uw_editor_marker_pixels(frame - UW_EDITOR_SPRITE_BASE, &editor_w, &editor_h);
  if (editor_pixels) {
    bVar1 = (byte)editor_w;
    bVar2 = (byte)editor_h;
    pcVar3 = (char *)editor_pixels;
  }
  else {
  if (frame < 0) {
    /* Escape hatch: a negative frame names an ABSOLUTE frame directly (-frame), bypassing
       resolve_sprite_id_to_frame's id-range resolution entirely. */
    resolved = -(int)frame;
  } else {
    resolved = resolve_sprite_id_to_frame(frame);
  }
  pcVar3 = (char *)lookup_grtile_by_id(resolved);
  bVar1 = pcVar3[1];
  bVar2 = pcVar3[2];
  if (*pcVar3 == '\x04') {
    pcVar3 = pcVar3 + 5;
  }
  else {
    /* Ghidra dropped decompress_gr_bitmap's 3rd arg, the .GR entry's compression mode (*pcVar3 --
       6/8/0xa RLE variants). Without it the decoder took its param_3==0 path and produced an
       all-zero (fully transparent) bitmap, so every object billboard sampled nothing. */
    pcVar3 = (char *)decompress_gr_bitmap(pcVar3 + 4,&DAT_00202520 + (uint)(byte)pcVar3[3] * 0x10,
                                  *pcVar3);
  }
  }
  iVar5 = (int)(short)(ushort)bVar2 * (int)(short)(ushort)bVar1;
  /* decode this object's sprite into a fresh per-record buffer (keep the
     full 64-bit pointer -- ce_malloc's result was truncated through the
     `undefined4` DAT_0023c7a0). */
  buf = ce_malloc(iVar5);
  (&DAT_0023c7a0)[DAT_0023b83c] = buf;
  ce_memset(buf,0,iVar5);
  ce_memmove(buf,pcVar3,iVar5);
  DAT_002022fc = (int)(intptr_t)buf;
  DAT_00202508 = (ushort)bVar1;
  DAT_002022f8 = (ushort)bVar2;
  /* render_visible_tile_list reads each record's texture from the g_tile_texptr_out[] side channel
     (the in-record field is 4 bytes and truncates on 64-bit). process_visible_tile_cell writes
     g_tile_texptr_emit[DAT_0023b83c] for tiles... */
  if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) {
    g_tile_texptr_emit[DAT_0023b83c] = buf;
  }
  return 1;
}



// was FUN_000408fc
void *lookup_grtile_by_id(short grtile_id)
{
  /* Glyph/font-resource-by-id lookup (g_grtile_registry is indexed by grtile_id). */
  static undefined1 dummy_glyph[16];
  void *uVar1;

  if (grtile_id == 0) {
    uVar1 = dummy_glyph;
  }
  else {
    /* Fixed: g_grtile_registry is a real pointer array (see its
       declaration comment); this used to be a 4-byte truncated read. */
    uVar1 = g_grtile_registry[grtile_id];
    if (uVar1 == 0) {
      /* Table slot never populated (the resource that would have filled it, e.g. a missing/failed
         auxiliary .SYS load) -- same safe fallback as grtile_id==0 rather than handing callers a NULL
         they don't check. */
      uVar1 = dummy_glyph;
    }
  }
  return uVar1;
}


// was FUN_00040aa8 -- the central symbolic-id -> absolute-frame resolver used throughout the
// HUD/object draw paths: id<0x1000 is already an absolute OBJECTS.GR frame, 0x1000<=id<0x2000
// resolves via DAT_00202730 (BUTTONS.GR's base), id>=0x2000 resolves via DAT_00202738...
uint resolve_sprite_id_to_frame(int sprite_id)
{
  int iVar1;
  uint uVar2;
  
  iVar1 = (int)(short)sprite_id;
  if (iVar1 < 0x2000) {
    if (iVar1 < 0x1000) {
      /* DAT_0024d090 (an object-type -> OBJECTS.GR frame remap) is never
         populated in this decompile. OBJECTS.GR is now registered at
         absolute frame indices (register_objects_gr_entry), so the id IS the frame. */
      uVar2 = (uint)(ushort)sprite_id;
    }
    else {
      uVar2 = ((uint)DAT_00202730 + sprite_id) - 0x1000;
    }
  }
  else {
    uVar2 = ((uint)DAT_00202738 + sprite_id) - 0x2000;
  }
  return uVar2;
}

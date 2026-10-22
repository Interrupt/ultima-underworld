/* The dungeon tile map: the tile-record lookup accessor, the per-frame visible-tile
   walk/collection, per-tile wall/floor/object emission, and the final visible-tile-list
   rasterization pass. */
#include "headers/tmap.h"
#include "headers/options.h"
#include <math.h>
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* The per-frame geometry arena (layout and limits in geom_arena.h). */
uw_geom_arena_t g_geom_arena;
/* Set (0-359) by emit_tile_objects's class-2 TMOBJ/sign branch right before jumping into the shared
   class-0 mesh-quad code, to make a wall-mounted decal extend along the WALL's own fixed facing
   angle instead of the camera's... */
static int g_billboard_angle_override_deg = -1;
/* UW_MODEL_TUNER=1's "hide_walls" toggle (debug panel, dbgui_field_toggle) -- lets wall/floor tile
   geometry be filtered out of the render so a single object's own faces... */
int g_uw_hide_walls = 0;
/* --show-fps: tiles that emitted geometry this frame (reset in walk_visible_tiles). */
int g_stat_tiles_drawn = 0;
/* Recovered from UU.exe .data at 0x8462c: the 3D viewport clip rect {x0=0x34, y0=0x13, w=0xe0,
   h=0x84} == {52, 19, 224, 132}, matching render_dungeon_view's `rect_fill(0x34,0x13,0xe0,0x83)`.
   render_visible_tile_ list copies these into a local passed to raster_triangle as param_8... */
static undefined4 DAT_0008462c = 0x34;
static undefined4 DAT_00084634 = 0xe0;
static undefined4 DAT_00084630 = 0x13;
static undefined4 DAT_00084638 = 0x84;
/* Recovered from UU.exe .data at 0x84610: the perspective/screen scale, integer 100.
   render_visible_tile_list does ordfloat_int_to_float2(DAT_00084610) (int->float) -> 100.0... */
static undefined4 DAT_00084610 = 100u;
/* Sizing-audit pass: wall-texture property table. Loader fills only 48 entries, but every read site
   masks the index with `&0x3f` (0-63) -- the wider read-side mask governs. HARD: 64 elements (128
   bytes). Down from 8192. */
 undefined2 DAT_0023add0_backing[64];
/* Sizing-audit pass: floor-texture property table. Loader fills only 10 entries, but every read
   site masks the index with `&0xf` (0-15) -- the wider read-side mask governs. HARD: 16 elements
   (32 bytes). Down from 8192. */
 undefined2 DAT_0023ae40_backing[16];
/* Was a lone `undefined4` (zero-initialized), but confirmed via a raw Ghidra memory read of the
   real UU.exe's .data section that this address's real static initial value is 1, not 0... */
undefined4 DAT_00086b20 = 1;
byte * DAT_0023b814;
/* SPLIT SYMBOL. */
code *DAT_0023b4f4;
short g_pick_tile_off_backing[0x200];
/* Sizing pass: indexed by the same DAT_0023b830 cursor as g_pick_tile_off_backing right above
   (interact.c:1032, tmap.c:2393), a 2-byte stride -- sized to match that sibling's own real extent
   (0x200 elements * 2 bytes = 1024 bytes), down from 65536. */
undefined1 DAT_0023b676_backing[1024];
int DAT_0023b83c;
/* Were int / undefined4, truncating the real &DAT_002049e0-relative pointers this loader
   (FUN_00042174 area) computes into them: ae38 = &DAT_002049e0 ae34 = ae38 + DAT_0023adb0*0x1000
   (10 x 0x400 shade tables at +0x30..) ae3c = ae34 + DAT_0023aeb8*0x400 ae30 = ae3c + n*0x100... */
char *DAT_0023ae38;
char *DAT_0023ae3c;
undefined2 DAT_00202734;
byte DAT_0023b4a0;
char *DAT_0023aecc;
short DAT_0025063c;
short DAT_002506dc;
short DAT_0025064c;
/* Recovered from UU.exe .data at 0x86a00 (0x60 bytes). */
 const undefined1 DAT_00086a00_region[0xb0] = {
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff,
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xc0,
  0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07, 0x08,0x09,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x04,0x02,0x05,0x03,0x09,0x08, 0x06,0x07,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x05,0x04,0x03,0x02,0x07,0x06, 0x09,0x08,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x03,0x05,0x02,0x04,0x08,0x09, 0x07,0x06,0x00,0x00,0x00,0x00,0x00,0x00,
  /* +0x60  DAT_00086a60 */
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xb8, 0x98,0xb0,0x98,0xb0,0x98,0xb0,0xe4,0xc4,
  0xe4,0xc4,0xe0,0xc4,0xe4,0xcd,0xcd,0xc5, 0xc9,0xc5,0xcd,0xc5,0xd6,0xd2,0x00,0xd6,
  0x00,0xd6,0x00,0xd7,0x00,0xd3,0x00,0xd7, 0x00,0xd7,0xbc,0x9c,0xb4,0x9c,0xb4,0x9c,
  0xb4,0xbd,0x9d,0xb5,0x9d,0xb5,0x9d,0xb5, 0xbe,0x9e,0xb6,0x9e,0xb6,0x9e,0xb6,0xbf,
  0x9f,0xb7,0x9f,0xb7,0x9f,0xb7,0x00,0x00, 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};
short DAT_0023b810;
undefined4 DAT_0023b804;
undefined2 DAT_00086b30;
code *DAT_0023b80c;
code *DAT_0023b4d4;
ushort DAT_00189580;
/* Recovered from UU.exe .data: 0x86b50 .. 0x86bef (0xa0 bytes). A dense cluster of small
   per-view-orientation / per-tile-shape byte tables that process_visible_tile_cell reads while
   building a tile's vertex set for the 3D view. */
 const undefined1 DAT_00086b50_region[0xa0] = {
  0x01,0x00,0x40,0x00,0xc0,0xff,0x01,0x00, 0xff,0xff,0xc0,0xff,0x40,0x00,0xff,0xff,
  0x00,0x01,0x03,0x02,0x02,0x00,0x01,0x03, 0x03,0x02,0x00,0x01,0x01,0x03,0x02,0x00,
  0x00,0x00,0x01,0x01,0x01,0x01,0x00,0x00, 0x00,0x01,0x00,0x01,0x01,0x00,0x01,0x00,
  0x00,0x00,0x00,0x00,0x02,0x00,0x01,0x00, 0x00,0x01,0x03,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x01,0x00,0x00,0x01,0x00,0x00, 0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,
  0x01,0x00,0x01,0x00,0x00,0x01,0x01,0x01, 0x00,0x01,0x01,0x01,0x00,0x00,0x00,0x00,
  0x01,0x01,0x03,0x01,0x00,0x01,0x00,0x01, 0x02,0x01,0x01,0x03,0x00,0x00,0x00,0x00,
  0x01,0x02,0x00,0x00,0x00,0x00,0x00,0x00, 0x00,0x00,0x01,0x01,0x01,0xff,0x00,0x01,
  0x01,0x00,0xff,0xff,0x01,0x00,0x00,0x01, 0x01,0x01,0x01,0x01,0x00,0x00,0xff,0x01,
  0x00,0x04,0xff,0x00,0x04,0x01,0xff,0x04, 0x00,0x01,0x04,0x00,0x00,0x00,0x00,0x00,
};
/* Sizing-audit pass: process_visible_tile_cell's own loop is `} while (local_54 < 3);` -- max index
   2, matching the real recovered content (0,1,2; the rest was always just padding). HARD. Down from
   8. */
static const undefined1 DAT_00086c00_arr[3] = { 0x00,0x01,0x02 };
#define DAT_00086c00 (*(const undefined1 *)DAT_00086c00_arr)
undefined2 DAT_0023bc8c;
undefined2 DAT_0023b8c0;
byte *DAT_0023b4ec;
/* Was a lone `undefined` scalar; walk_visible_tiles/process_visible_tile_cell index it as
   `(&DAT_00086bf0)[tile_type_nibble]`. */
 const unsigned char DAT_00086bf0_real_table[16] = {
  0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x0b, 0x0b,
  0x0b, 0x0b, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
};
undefined1 DAT_0023b818;
char *DAT_0023b4f0;
static char *DAT_0023b808;  /* was `undefined4` (4 bytes) -- would truncate the real `void *` tilemap_lookup returns; currently
   a write-only global (no reader elsewhere in this file), so not a live bug, but fixed for safety */
undefined4 DAT_0023b838;
short DAT_0023b4e8;
short DAT_0023b4e4;
undefined1 *DAT_0023b820;
ushort DAT_0023b828;
undefined2 DAT_0023b824;
/* Was silently zero -- compared against the literal `'d'` at all 4 call sites in this file. */
char DAT_00087938 = 'd';
short DAT_00086b24;
ushort DAT_0023b81c;
ushort DAT_0023b4d8;
static undefined2 DAT_0023b4d0;
byte DAT_0023b4e0;
char DAT_0023b834;
/* DAT_00086b84/b88/bb0..bb5/bc8..bcd/c00 -> DAT_00086b50_region /
   DAT_00086c00_arr, #define'd above. */
static short DAT_0023b8c4;
ushort DAT_0023b904;
ushort DAT_0023b920;
ushort DAT_0023b91c;
byte DAT_0023bc88;
/* .data 0x86c80: real TMOBJ sign-variant -> frame-index table, 32 ushort entries, recovered
   directly from UU.exe (same contiguous dump as DAT_00086c08 above -- see its own comment). */
static unsigned short DAT_00086c80_backing[32] = {
  3,8,8,7,7,6,5,11,24,9,23,27,28,25,26,4,
  10,16,17,0xffff,2,19,18,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,0xffff,
};
#define DAT_00086c80 (*(unsigned char *)&DAT_00086c80_backing[0])
/* .data 0x86cc0: real 32-step -> 8-octant angle-quantization table, recovered in the same dump as
   DAT_00086c08/DAT_00086c80 above. */
static const unsigned char DAT_00086cc0_arr[32] = {
  0,0,0,1,1,1,2,2, 2,2,2,3,3,3,4,4,
  4,4,4,5,5,5,6,6, 6,6,6,7,7,7,0,0,
};
#define DAT_00086cc0 (DAT_00086cc0_arr[0])
/* Sizing pass: every access to this array is bounded to 0x12 (18) bytes (the ce_memmove/ce_memset
   sites just below, and the plain scalar DAT_0023b908 read/write) -- was oversized at 8192 elements
   (16384 bytes) for an 18-byte need. */
static undefined2 DAT_0023b908_backing[32];
#define DAT_0023b908 DAT_0023b908_backing[0]
/* Sizing-audit pass: the "separate, more careful review" flagged above is done.
   update_wall_partition_phase's dynamic write... */
static undefined2 DAT_0023b928_backing[32];
#define DAT_0023b928 DAT_0023b928_backing[0]
char DAT_0023bb94;
/* Sizing-audit pass: only read as a memmove source
   (`ce_memmove(&DAT_0023b928+uVar2+1,&DAT_0023b90a,(uVar1&0xffff)<<1)`) with uVar1 capped at 8
   (same 8-entry window cap as DAT_0023b928) -- max byte count 8*2=16 bytes. */
/* ARM field view: use the parent record populated by the loader/runtime. */
#define DAT_0023b90a (*(undefined1 *)((char *)DAT_0023b908_backing + 2))
/* Sizing pass: `ce_memset(&DAT_0023b940,0,0x252)` -- 594 bytes exact. */
static undefined1 DAT_0023b940_backing[1024];
#define DAT_0023b940 DAT_0023b940_backing[0]
/* Object/feature-draw sort scratch (emit_tile_features and helpers sort_feature_pairs_by_depth/
   ec8/508c/5128/65210/652e8, ~uw.c:49340-49766). */
/* Sizing-audit pass: DAT_0023b848[i] real extent is i in 0..8 (9
   u16 elements, 18 bytes) per the comment above. Sized to 32 elements
   (64 bytes) for headroom; down from 64. */
 undefined2 DAT_0023b848_backing[32];
/* Sizing-audit pass: DAT_0023b8c8[i]/[i+1] real extent is i in 0..8
   too (same object count, max i+1=9, 10 bytes). Sized to 32 for
   headroom; down from 128. */
 undefined1 DAT_0023b8c8_backing[32];
/* Sizing-audit pass: DAT_0023bb98[i*4+0/1/2] real extent is i in
   0..0x3b (per the comment above), max byte 59*4+2=238. Sized to
   256 for headroom; down from 512. */
 undefined1 DAT_0023bb98_backing[256];
/* Recovered from UU.exe .data at 0x86d68 (64 bytes = 32 int16). Per-view- facing corner-index remap
   for a rotating quad: resolve_billboard_corner_offset reads `(&DAT_00086d68)[idx*2]` (low byte)
   and `(&DAT_00086d69)[idx*2]` (high byte) with idx = (corner>>5) + facing*8. */
static const undefined1 DAT_00086d68_region[64] = {
  0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00, 0x04,0x00,0x05,0x00,0x06,0x00,0x07,0x00,
  0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x03, 0x00,0x04,0x00,0x05,0x00,0x06,0x00,0x07,
  0x07,0x00,0x06,0x00,0x05,0x00,0x04,0x00, 0x03,0x00,0x02,0x00,0x01,0x00,0x00,0x00,
  0x00,0x07,0x00,0x06,0x00,0x05,0x00,0x04, 0x00,0x03,0x00,0x02,0x00,0x01,0x00,0x00,
};
#define DAT_00086d68 (*(const undefined1 *)DAT_00086d68_region)
#define DAT_00086d69 (*(const undefined1 *)(DAT_00086d68_region + 1))
/* Was a lone `undefined` (1-byte) scalar -- but emit_tile_features indexes it as a per-tile array
   of 18-byte (0x12) "feature count + up to 8 feature ids" records (`&DAT_0023b92e +
   DAT_0023b4e4*0x12`, DAT_0023b4e4 ranging up to 0x20)... */
static undefined1 g_tile_feature_records_b92e_backing[65536];
#define DAT_0023b92e g_tile_feature_records_b92e_backing[0]






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00020370
void render_visible_tile_list()

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  int *piVar14;
  int iVar15;
  int iVar16;
  int iVar17;
  void **local_98; // was `undefined4 *`, misaligning the DAT_000c4838 pointer-array walk below now that its elements are real 8-byte pointers
  int local_94;
  /* Ghidra named the 4 words of the viewport-clip-rect struct passed to raster_triangle (as
     param_8) as 4 separate locals. */
  undefined4 local_70_rect[4];
#define local_70 (local_70_rect[0])
#define local_6c (local_70_rect[1])
#define local_68 (local_70_rect[2])
#define local_64 (local_70_rect[3])
  /* Same bug as local_70_rect above: Ghidra named the 15 words of the triangle-vertex struct passed
     to raster_triangle as param_3 (three vertices x 5 floats: x, y, w, u, v) as 15 separate locals. */
  undefined4 local_60_arr[15];
#define local_60 (local_60_arr[0])
#define local_5c (local_60_arr[1])
#define local_58 (local_60_arr[2])
#define local_54 (local_60_arr[3])
#define local_50 (local_60_arr[4])
#define local_4c (local_60_arr[5])
#define local_48 (local_60_arr[6])
#define local_44 (local_60_arr[7])
#define local_40 (local_60_arr[8])
#define local_3c (local_60_arr[9])
#define local_38 (local_60_arr[10])
#define local_34 (local_60_arr[11])
#define local_30 (local_60_arr[12])
#define local_2c (local_60_arr[13])
#define local_28 (local_60_arr[14])
  
  local_94 = 0;
  local_70 = DAT_0008462c;
  local_68 = DAT_00084634;
  local_6c = DAT_00084630;
  local_64 = DAT_00084638;
  /* HACK: not original behaviour -- the fullscreen view (see fullscreen_view.c) projects about the
     centre of the whole-width view above the message scroll (the original: 140,80) with the scale raised so the
     horizontal field of view stays the same (the original's 100 over its 171-pixel-wide view). */
  undefined4 proj_cx = 0x430c0000, proj_cy = 0x42a00000;
  int proj_scale = DAT_00084610;
  if (g_view_fullscreen) {
    local_70 = 0; local_6c = 0; local_68 = 0x140; local_64 = uw_fullscreen_scene_height();
    float cy = (float)uw_fullscreen_proj_cy();
    proj_cx = 0x43200000; proj_scale = (int)UW_FULLSCREEN_PROJ_SCALE;  /* 160.0 */
    memcpy(&proj_cy, &cy, sizeof cy);
  }
  if (0 < DAT_000c8c98) {
    local_98 = &DAT_000c4838;
    iVar15 = DAT_000c8c98;
    do {
      piVar14 = (int *)*local_98;
      iVar1 = piVar14[1];
      iVar2 = piVar14[2];
      iVar17 = piVar14[3];
      local_54 = ordfloat_int_to_float2(piVar14[0x10]);
      local_50 = ordfloat_int_to_float2(piVar14[0x11]);
      iVar16 = 1;
      if (1 < *piVar14 + -1) {
        uVar6 = ordfloat_div(0x3f800000,iVar17);
        uVar7 = ordfloat_mul(iVar17,0x3a2ec33e);
        iVar17 = 0xc;
        do {
          uVar11 = *(undefined4 *)((char *)piVar14 + iVar17 + 4);
          uVar12 = *(undefined4 *)((char *)piVar14 + iVar17 + 8);
          uVar3 = *(undefined4 *)((char *)piVar14 + iVar17 + 0xc);
          local_40 = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x10]);
          local_3c = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x11]);
          uVar13 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x10);
          uVar4 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x14);
          uVar5 = *(undefined4 *)((char *)piVar14 + iVar17 + 0x18);
          local_2c = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x12]);
          local_28 = ordfloat_int_to_float2(piVar14[iVar16 * 2 + 0x13]);
          uVar8 = ordfloat_int_to_float2(proj_scale);
          uVar9 = ordfloat_mul(uVar6,uVar8);
          uVar9 = ordfloat_mul(uVar9,iVar1);
          local_60 = ordfloat_add(uVar9,proj_cx);
          uVar9 = ordfloat_mul(uVar6,uVar8);
          uVar9 = ordfloat_mul(uVar9,iVar2);
          uVar9 = ordfloat_mul(uVar9,0x3f666666);
          local_5c = ordfloat_sub(proj_cy,uVar9);
          local_58 = uVar7;
          uVar9 = ordfloat_div(0x3f800000,uVar3);
          uVar10 = ordfloat_mul(uVar9,uVar8);
          uVar11 = ordfloat_mul(uVar10,uVar11);
          local_4c = ordfloat_add(uVar11,proj_cx);
          uVar11 = ordfloat_mul(uVar9,uVar8);
          uVar11 = ordfloat_mul(uVar11,uVar12);
          uVar11 = ordfloat_mul(uVar11,0x3f666666);
          local_48 = ordfloat_sub(proj_cy,uVar11);
          local_44 = ordfloat_mul(uVar3,0x3a2ec33e);
          uVar11 = ordfloat_div(0x3f800000,uVar5);
          uVar12 = ordfloat_mul(uVar11,uVar8);
          uVar13 = ordfloat_mul(uVar12,uVar13);
          local_38 = ordfloat_add(uVar13,proj_cx);
          uVar11 = ordfloat_mul(uVar11,uVar8);
          uVar11 = ordfloat_mul(uVar11,uVar4);
          uVar11 = ordfloat_mul(uVar11,0x3f666666);
          local_34 = ordfloat_sub(proj_cy,uVar11);
          local_30 = ordfloat_mul(uVar5,0x3a2ec33e);
          DAT_000da47c = (undefined2)piVar14[0x1d];
          g_face_shade_rows = piVar14[0x1f];
          raster_triangle(0x140,g_uw_framebuffer,local_60_arr,piVar14[0x1e],
                       piVar14[0x1b],piVar14[0x1c] * piVar14[0x1b],
                       ((unsigned)local_94 < UW_MAX_VIS_TILES)
                         ? (char *)g_tile_texptr_out[local_94]
                         : (char *)(intptr_t)piVar14[0x1a],
                       local_70_rect);
          { char _facetag[32];
            snprintf(_facetag, sizeof(_facetag), "rec%03d_tri%d_tex0x%x", local_94, iVar16, piVar14[0x1e]);
            uw_debug_dump_3d_face(_facetag);
          }
          iVar16 = iVar16 + 1;
          iVar17 = iVar17 + 0xc;
          piVar14 = (int *)*local_98;
          iVar15 = DAT_000c8c98;
        } while (iVar16 < *piVar14 + -1);
      }
      local_94 = local_94 + 1;
      local_98 = local_98 + 1;
    } while (local_94 < iVar15);
  }
  { int _dumped = uw_debug_3d_frame_dump_finish();
    if (_dumped >= 0) {
      char _msg[80];
      snprintf(_msg, sizeof(_msg), "[debug] dumped %d 3D faces to %s\n",
               _dumped, uw_debug_3d_frame_dump_last_dir());
      message_scroll_print_wrapped(_msg);
    }
  }
  return;
}
#undef local_70
#undef local_6c
#undef local_68
#undef local_64
#undef local_60
#undef local_5c
#undef local_58
#undef local_54
#undef local_50
#undef local_4c
#undef local_48
#undef local_44
#undef local_40
#undef local_3c
#undef local_38
#undef local_34
#undef local_30
#undef local_2c
#undef local_28


// was FUN_0005d9cc
void walk_visible_tiles()

{
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  uint uVar6;
  int iVar7;
  byte *pbVar8;
  undefined1 *puVar9;
  
  DAT_0023b818 = 0xe0;
  DAT_0023b4f0 = (char *)(DAT_0023b4a0 * 4 + UW_B50_LIT(0x86b60));
  iVar4 = DAT_0023b4a0 * 6;
  sVar2 = *(short *)(&DAT_00086a00 + iVar4);
  iVar7 = (int)sVar2;
  sVar3 = *(short *)(&DAT_00086a02 + iVar4);
  puVar9 = &g_visibility_ring_buffer + g_visibility_ring_depth * 0x42;
  pbVar8 = (byte *)(DAT_0023aecc + ((int)sVar3 * (int)g_visibility_ring_depth + iVar7 * -0x10) * 4);
  DAT_0023b814 = tilemap_lookup(0,0);
  DAT_0023b808 = tilemap_lookup(0x3f,0x3f);
  DAT_0023b83c = 0;
  extra_lights_reset();
  uVar6 = (uint)(short)(((byte *)pbVar8 - (byte *)DAT_0023b814) >> 2);
  DAT_0023b838 = 0;
  g_stat_tiles_drawn = 0;
  /* Also clear the arena's own count fields (offset 0 = vertex count, offset 4 = record count).
     process_visible_tile_cell normally keeps them in step with DAT_0023b838 / DAT_0023b83c as it
     emits, but a frame where it emits nothing... */
  g_geom_arena.vert_count = 0;
  g_geom_arena.rec_count = 0;
  /* HACK: not original behaviour -- tex[2] carries a DOS model face's shade rows (emit_catalog_object); only
     models set it, so clear whatever an earlier frame left in the other records. */
  for (int _r = 0; _r < UW_ARENA_MAX_RECORDS; _r++) g_geom_arena.records[_r].tex[2] = 0;
  if (0x2000 < (int)uVar6) {
    uVar6 = uVar6 - 0x4000;
  }
  update_wall_partition_phase(-10);
  DAT_0023b4e8 = g_visibility_ring_depth;
  if (-1 < g_visibility_ring_depth) {
    do {
      update_wall_partition_phase(2);
      sVar1 = (short)uVar6;
      DAT_0023b4e4 = 0;
      uVar6 = (uint)sVar1;
      DAT_0023b820 = puVar9;
      DAT_0023b4ec = pbVar8;
      do {
        if ((uVar6 & 0xf000) == 0) {
          process_visible_tile_cell(&DAT_000b99d0 + (short)uVar6);
        }
        DAT_0023b4e4 = DAT_0023b4e4 + 1;
        DAT_0023b4ec = DAT_0023b4ec + iVar7 * 4;
        DAT_0023b820 = DAT_0023b820 + 2;
        uVar6 = ((short)uVar6 + iVar7) * 0x10000 >> 0x10;
      } while (DAT_0023b4e4 < 0x10);
      update_wall_partition_phase(1);
      iVar4 = 0x20;
      DAT_0023b820 = puVar9 + 0x40;
      DAT_0023b4e4 = 0x20;
      DAT_0023b4ec = pbVar8 + iVar7 * 0x80;
      uVar6 = ((int)sVar1 + iVar7 * 0x20) * 0x10000 >> 0x10;
      do {
        if ((uVar6 & 0xf000) == 0) {
          process_visible_tile_cell(&DAT_000b99d0 + (short)uVar6);
          iVar4 = (int)DAT_0023b4e4;
        }
        DAT_0023b4ec = DAT_0023b4ec + iVar7 * -4;
        iVar4 = iVar4 + -1;
        uVar6 = (int)(short)uVar6 - (int)sVar2;
        DAT_0023b4e4 = (short)iVar4;
        DAT_0023b820 = DAT_0023b820 + -2;
      } while (0x10 < iVar4 * 0x10000 >> 0x10);
      update_wall_partition_phase(0);
      if ((uVar6 * 0x10000 & 0xf0000000) == 0) {
        process_visible_tile_cell(&DAT_000b99d0 + ((int)(uVar6 * 0x10000) >> 0x10));
      }
      puVar9 = puVar9 + -0x42;
      *DAT_00110fc0 = 0xb0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      pbVar8 = pbVar8 + sVar3 * -4;
      iVar4 = (int)DAT_0023b4e8;
      uVar6 = (int)sVar1 - (int)sVar3;
      DAT_0023b4e8 = (short)(iVar4 + -1);
    } while (-1 < (iVar4 + -1) * 0x10000 >> 0x10);
  }
  DAT_0023b4ec = pbVar8;
  pcVar5 = &DAT_000b99d0 + (short)uVar6;
  DAT_0023b4e4 = 0;
  do {
// HACK: this trailing one-row sweep (33 tiles wide, confirmed via a recorded repro to land one
    // row "behind" the player -- e.g. dy=-1 at heading 0)...
    if (0) {
      if (((uVar6 & 0xf000) == 0) && (*pcVar5 == '\0')) {
        *pcVar5 = automap_reveal_byte(DAT_0023b4ec);
      }
    }
    DAT_0023b4e4 = DAT_0023b4e4 + 1;
    DAT_0023b4ec = DAT_0023b4ec + iVar7 * 4;
    uVar6 = ((short)uVar6 + iVar7) * 0x10000 >> 0x10;
    pcVar5 = pcVar5 + iVar7;
  } while (DAT_0023b4e4 < 0x21);
  return;
}




/* HACK: not original behaviour. The visibility walk lays the visible tiles out in a window turned by the
   view quadrant (DAT_0023b4a0, 90 degrees per step), and the floor/ceiling quads give their corners the same
   texture coordinates in that turned window, so the tile texture rotated by 90 degrees each time the view
   crossed a quadrant boundary (at yaw 45, 135, 225 and 315). Rotate the four corner coordinates the other way
   so the texture keeps its place in the world. `winding` is -1 for the floor quad (corners listed counter-clockwise)
   and +1 for the ceiling quad (clockwise), which turn the corner order opposite ways. */
static void rotate_flat_quad_uv_for_view(int rec, int winding)
{
  int quadrant = DAT_0023b4a0 & 3, k;
  int uv[8], rotated[8];
  if (quadrant == 0 || rec < 0) return;
  memcpy(uv, g_geom_arena.records[rec].uv, sizeof uv);
  for (k = 0; k < 4; k++) {
    rotated[k * 2] = uv[((k + winding * quadrant) & 3) * 2];
    rotated[k * 2 + 1] = uv[((k + winding * quadrant) & 3) * 2 + 1];
  }
  memcpy(g_geom_arena.records[rec].uv, rotated, sizeof rotated);
}

// was FUN_0005e604
void process_visible_tile_cell(byte *cell)
{
  uint uVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  undefined1 uVar8;
  undefined1 uVar9;
  undefined1 uVar10;
  undefined1 uVar11;
  undefined1 uVar12;
  undefined1 uVar13;
  undefined1 uVar14;
  byte bVar15;
  intptr_t iVar16; /* was int -- also holds the DAT_00086e6c view-record pointer */
  undefined4 uVar17;
  int iVar18;
  int iVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  uint uVar22;
  ushort *puVar23;
  undefined1 uVar24;
  byte bVar25;
  ushort uVar26;
  ushort uVar27;
  uint uVar28;
  short *psVar29;
  int iVar30;
  short sVar31;
  int iVar32;
  int iVar33;
  int iVar34;
  byte *pbVar35;
  int iVar36;
  const char *pcVar37;
  int iVar38;
  bool bVar39;
  byte local_84;
  byte local_83;
  byte local_81;
  byte local_80;
  uint local_54;
  undefined1 auStack_50 [4];
  uint local_4c;
  uint local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  int local_34;
  uint local_30;
  
  bVar25 = *DAT_0023b820;
  local_48 = (uint)(short)(ushort)bVar25;
  if ((local_48 & 0x80) == 0) {
    /* Unreached cells stay unknown. For reached cells without geometry,
       use the tile's shade to distinguish discovered floors from the
       original unknown shapes (10..15) used for boundary walls. */
    if ((*cell == 0) && (bVar25 != 0)) {
      /* Shade indices below 8 are bright enough to discover the floor. */
      *cell = (DAT_0023b820[1] & 0xf) < 8
          ? automap_reveal_byte(DAT_0023b4ec)
          : DAT_00086bf0_real_table[g_current_tile->tile_type];
      DAT_0023b810 = DAT_0023b810 + 1;
    }
    flush_pending_tile_features();
    return;
  }
  /* This branch emits a visible tile's 3D geometry slice for the dungeon viewport. */
  { static int _disabled = -1;
    if (_disabled < 0) _disabled = (g_opts.disable_3d_geometry);
    /* Arena overflow guard. */
    if (_disabled
        || (int)(uint)DAT_0023b838 >= UW_ARENA_MAX_VERTS - 28
        || (int)DAT_0023b83c >= UW_ARENA_MAX_RECORDS - 6) {
      if (*cell == 0) {
        /* Even when geometry storage is full, darkness must not reveal floors. */
        *cell = (DAT_0023b820[1] & 0xf) < 8
            ? automap_reveal_byte(DAT_0023b4ec)
            : DAT_00086bf0_real_table[g_current_tile->tile_type];
        DAT_0023b810 = DAT_0023b810 + 1;
      }
      return;
    }
  }
  g_stat_tiles_drawn++;
  DAT_0023b4d0 = 200;
  bVar15 = g_current_tile->floor_height;
  uVar1 = (uint)bVar15;
  DAT_0023b4e0 = DAT_0023b820[1] & 0xf;
  if (DAT_0023b4e0 < 8) {
    /* `*DAT_0023b4ec >> 10` decompiled from a 16-bit tile-record read but DAT_0023b4ec is a byte*
       here, so as written it always read DAT_0023ae40[0]. floor-tex index is byte 1 bits 2-5.
       Shared helper with walk_visible_tiles's ring-walk. */
    local_84 = automap_reveal_byte(DAT_0023b4ec);
  }
  else {
    local_84 = *cell;
    if (local_84 == 0) {
      local_84 = (&DAT_00086bf0)[g_current_tile->tile_type];
    }
  }
  local_30 = (int)(short)(ushort)bVar25 & 0x44;
  if (local_30 == 4) {
    local_4c = bVar25 & 3;
  }
  else {
    local_4c = 4;
  }
  iVar33 = local_4c * 4;
  pbVar35 = (byte *)(iVar33 + UW_B50_LIT(0x86b70));
  if (local_4c == 4) {
    if (*(short *)(&DAT_00085d20 + uVar1 * 2) < g_current_view->view_elevation) {
LAB_0005e988:
      bVar39 = true;
      goto LAB_0005e7e0;
    }
  }
  else {
    iVar16 = local_4c * 3;
    if (((int)*(short *)(&DAT_00085d20 + (uVar1 + *pbVar35) * 2) -
        (int)g_current_view->view_elevation) * (int)*(char *)(UW_B50_LIT(0x86be1) + iVar16) +
        (DAT_0023b4e8 * 0x100 - (int)g_current_view->view_y) *
        (int)*(char *)(UW_B50_LIT(0x86be2) + iVar16) +
        ((DAT_0023b4e4 + -0x10) * 0x100 - (int)g_current_view->view_x) *
        (int)*(char *)(UW_B50_LIT(0x86be0) + iVar16) < 0) goto LAB_0005e988;
  }
  bVar39 = false;
LAB_0005e7e0:
  DAT_0023b818 = 0xe0;
  iVar16 = DAT_00086e6c;
  if (bVar39) {
    ((void (*)(void *, int, int))DAT_0023b4f4)(auStack_50,DAT_0023b4e0,g_current_tile->floor_tex);
    uVar28 = g_current_tile->floor_tex;
    if ((short)(ushort)DAT_0023b4e0 < DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((DAT_0023b4e0 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      iVar16 = uVar28 + 0x30;
      DAT_0023b4d8 = 0x400;
      uVar24 = 0x20;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
    }
    else {
      iVar16 = uVar28 + 0x6a;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      uVar24 = 0x10;
      DAT_0023b824 = 0x10;
    }
    iVar32 = DAT_0023b83c * 0x60;
    UW_REC_AT(iVar32)->attr[1] = (byte)uVar24;
    UW_REC_AT(iVar32)->attr[2] = (byte)uVar24;
    { void *_tp = get_texture_page(iVar16); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
    iVar32 = DAT_0023b83c;
    iVar30 = DAT_0023b83c * 0x60;
    iVar18 = (int)DAT_0023b4e4;
    UW_REC_AT(iVar30)->attr[0] = uVar17;
    sVar31 = DAT_000da47c;
    UW_REC_AT(iVar30)->tex[0] = (short)DAT_000da47c;
    cVar2 = (char)(sVar31 >> 0xf);
    uVar17 = ordfloat_int_to_float2(iVar18 << 8);
    iVar16 = DAT_0023b838;
    iVar34 = DAT_0023b838 * 0xc;
    iVar19 = (int)DAT_0023b4e8;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->x) = uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    uVar20 = ordfloat_int_to_float2((iVar19 + 1) * 0x100);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->z) = uVar20;
    uVar5 = (undefined1)((uint)uVar20 >> 8);
    uVar6 = (undefined1)((uint)uVar20 >> 0x10);
    uVar7 = (undefined1)((uint)uVar20 >> 0x18);
    uVar21 = ordfloat_int_to_float2((uVar1 + *(byte *)(UW_B50_LIT(0x86b72) + iVar33)) * 0x40);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y) = uVar21;
    UW_REC_AT(iVar30)->vert_idx[0] = iVar16;
    iVar38 = iVar16 + 1;
    DAT_0023b838 = iVar38;
    UW_REC_AT(iVar30)->uv[0] = 0;
    UW_REC_AT(iVar30)->uv[1] = 0;
    iVar34 = iVar38 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->x) = uVar17;
    uVar17 = ordfloat_int_to_float2(iVar19 << 8);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->z) = uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    uVar21 = ordfloat_int_to_float2((uVar1 + *pbVar35) * 0x40);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y) = uVar21;
    iVar34 = iVar16 + 2;
    DAT_0023b838 = iVar34;
    UW_REC_AT(iVar30)->vert_idx[1] = iVar38;
    UW_REC_AT(iVar30)->uv[2] = 0;
    iVar19 = DAT_0023b824 + -1;
    int uv_v = iVar19;
    UW_REC_AT(iVar30)->uv[3] = iVar19;
    uVar21 = ordfloat_int_to_float2((iVar18 + 1) * 0x100);
    iVar18 = iVar34 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->x) = uVar21;
    uVar12 = (undefined1)((uint)uVar21 >> 8);
    uVar13 = (undefined1)((uint)uVar21 >> 0x10);
    uVar14 = (undefined1)((uint)uVar21 >> 0x18);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->z) = uVar17;
    uVar17 = ordfloat_int_to_float2((uVar1 + *(byte *)(UW_B50_LIT(0x86b71) + iVar33)) * 0x40);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->y) = uVar17;
    UW_REC_AT(iVar30)->vert_idx[2] = iVar34;
    UW_REC_AT(iVar30)->uv[4] = uv_v;
    iVar19 = iVar16 + 3;
    DAT_0023b838 = iVar19;
    UW_REC_AT(iVar30)->uv[5] = uv_v;
    iVar18 = iVar19 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->x) = uVar21;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->z) = uVar20;
    uVar17 = ordfloat_int_to_float2((uVar1 + *(byte *)(UW_B50_LIT(0x86b73) + iVar33)) * 0x40);
    DAT_000a85d0 = iVar16 + 4;
    DAT_0023b838 = DAT_000a85d0;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->y) = uVar17;
    UW_REC_AT(iVar30)->vert_idx[3] = iVar19;
    UW_REC_AT(iVar30)->uv[6] = uv_v;
    UW_REC_AT(iVar30)->uv[7] = 0;
    iVar16 = DAT_00086e6c;
    UW_REC_AT(iVar30)->vert_count = 4;
    rotate_flat_quad_uv_for_view(DAT_0023b83c, -1);
    if (!g_uw_hide_walls) {
      DAT_000a85d4 = iVar32 + 1;
      DAT_0023b83c = DAT_000a85d4;
    }
  }
  if (*(short *)(iVar16 + 0xe) < 0x3f5) {
    ((void (*)(void *, int, int))DAT_0023b80c)(auStack_50,DAT_0023b4e0,9);
    if ((short)(ushort)DAT_0023b4e0 < DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((DAT_0023b4e0 != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      DAT_0023b4d8 = 0x400;
      uVar24 = 0x20;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
      uVar17 = 0x39;
    }
    else {
      uVar17 = 0x73;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      uVar24 = 0x10;
      DAT_0023b824 = 0x10;
    }
    iVar33 = DAT_0023b83c * 0x60;
    UW_REC_AT(iVar33)->attr[1] = (byte)uVar24;
    UW_REC_AT(iVar33)->attr[2] = (byte)uVar24;
    { void *_tp = get_texture_page(uVar17); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
    iVar19 = DAT_0023b83c * 0x60;
    UW_REC_AT(iVar19)->attr[0] = uVar17;
    sVar31 = DAT_000da47c;
    UW_REC_AT(iVar19)->tex[0] = (short)DAT_000da47c;
    iVar16 = (int)DAT_0023b4e4;
    cVar2 = (char)(sVar31 >> 0xf);
    uVar17 = ordfloat_int_to_float2(iVar16 << 8);
    iVar18 = DAT_0023b838 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->x) = uVar17;
    iVar32 = (int)DAT_0023b4e8;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    uVar20 = ordfloat_int_to_float2(iVar32 << 8);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->z) = uVar20;
    uVar5 = (undefined1)((uint)uVar20 >> 8);
    uVar6 = (undefined1)((uint)uVar20 >> 0x10);
    uVar7 = (undefined1)((uint)uVar20 >> 0x18);
    iVar33 = DAT_0023b838;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar18)->y) = 0x44800000;
    UW_REC_AT(iVar19)->vert_idx[0] = iVar33;
    iVar18 = iVar33 + 1;
    iVar30 = iVar18 * 0xc;
    UW_REC_AT(iVar19)->uv[0] = 0;
    UW_REC_AT(iVar19)->uv[1] = 0;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->x) = uVar17;
    uVar17 = ordfloat_int_to_float2((iVar32 + 1) * 0x100);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->z) = uVar17;
    uVar24 = (undefined1)((uint)uVar17 >> 8);
    uVar3 = (undefined1)((uint)uVar17 >> 0x10);
    uVar4 = (undefined1)((uint)uVar17 >> 0x18);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y) = 0x44800000;
    UW_REC_AT(iVar19)->vert_idx[1] = iVar18;
    UW_REC_AT(iVar19)->uv[2] = 0;
    iVar32 = DAT_0023b824 + -1;
    int uv_v = iVar32;
    UW_REC_AT(iVar19)->uv[3] = iVar32;
    iVar18 = iVar33 + 2;
    uVar21 = ordfloat_int_to_float2((iVar16 + 1) * 0x100);
    iVar16 = iVar18 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar16)->x) = uVar21;
    uVar12 = (undefined1)((uint)uVar21 >> 8);
    uVar13 = (undefined1)((uint)uVar21 >> 0x10);
    uVar14 = (undefined1)((uint)uVar21 >> 0x18);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar16)->z) = uVar17;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar16)->y) = 0x44800000;
    iVar32 = iVar33 + 3;
    UW_REC_AT(iVar19)->vert_idx[2] = iVar18;
    UW_REC_AT(iVar19)->uv[4] = uv_v;
    UW_REC_AT(iVar19)->uv[5] = uv_v;
    iVar16 = iVar32 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar16)->x) = uVar21;
    DAT_000a85d0 = iVar33 + 4;
    DAT_0023b838 = DAT_000a85d0;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar16)->z) = uVar20;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar16)->y) = 0x44800000;
    iVar16 = DAT_00086e6c;
    UW_REC_AT(iVar19)->vert_idx[3] = iVar32;
    UW_REC_AT(iVar19)->uv[6] = uv_v;
    UW_REC_AT(iVar19)->uv[7] = 0;
    UW_REC_AT(iVar19)->vert_count = 4;
    rotate_flat_quad_uv_for_view(DAT_0023b83c, 1);
    if (!g_uw_hide_walls) {
      DAT_000a85d4 = DAT_0023b83c + 1;
      DAT_0023b83c = DAT_000a85d4;
    }
  }
  DAT_0023b818 = 0;
  local_54 = 0;
  puVar23 = (ushort *)DAT_0023b4ec;
  uVar27 = 0x40;
  local_83 = DAT_0023b4e0;
  bVar25 = DAT_0023b4e0;
  do {
    if (((short)uVar27 >> 1 & (ushort)local_48) != 0) {
      iVar33 = local_54 * 6;
      if ((DAT_0023b820[1] & uVar27) == 0) {
        local_81 = 0x10;
        local_80 = 0x10;
        iVar16 = ((-uVar1 & 0xff) - (uint)*(byte *)(UW_B50_LIT(0x86b90) + local_54 * 5 + local_4c)) + 0x10;
      }
      else {
        local_81 = (byte)puVar23[*(short *)(&DAT_00086a00 +
                                           (DAT_0023b4a0 * 3 + (uint)(byte)(&DAT_00086c00)[local_54]
                                           ) * 2) * 2] >> 4;
        uVar28 = (byte)(&DAT_00086a20)
                       [((byte)puVar23[*(short *)(&DAT_00086a00 +
                                                 (DAT_0023b4a0 * 3 +
                                                 (uint)(byte)(&DAT_00086c00)[local_54]) * 2) * 2] &
                        0xf) + DAT_0023b4a0 * 0x10] - 6;
        if (((&DAT_000878d0)
             [(byte)(&DAT_00086a20)
                    [((byte)puVar23[*(short *)(&DAT_00086a00 +
                                              (DAT_0023b4a0 * 3 +
                                              (uint)(byte)(&DAT_00086c00)[local_54]) * 2) * 2] & 0xf
                     ) + DAT_0023b4a0 * 0x10]] & 0x20) != 0x20) {
          uVar28 = 4;
        }
        uVar28 = uVar28 & 0xff;
        iVar16 = (((uint)*(byte *)(UW_B50_LIT(0x86b90) + (local_54 + 3) * 5 + uVar28) -
                  (uint)*(byte *)(UW_B50_LIT(0x86b90) + local_54 * 5 + local_4c)) - uVar1) + (uint)local_81;
        local_80 = *(char *)((uint)(byte)(&DAT_00086b88)[local_54] + uVar28 * 4 + UW_B50_LIT(0x86b70)) +
                   local_81;
        local_81 = *(char *)((uint)(byte)(&DAT_00086b84)[local_54] + uVar28 * 4 + UW_B50_LIT(0x86b70)) +
                   local_81;
        bVar25 = local_83;
      }
      /* UW1 tile word2 (bytes 2-3) bits 0-5 = wall texture index; word1's high byte (byte 1) holds
         the floor texture / height and was almost always 0 here, so every wall drew arena slot 0
         (plain grey) instead of the level's real -- often mossy -- wall texture. */
      ((void (*)(void *, int, int, int))DAT_0023b4d4)(auStack_50,bVar25,iVar16,(byte)puVar23[2] & 0x3f);
      uVar26 = (ushort)DAT_0023b4e0;
      bVar25 = (byte)g_current_tile->wall_tex;
      if ((short)uVar26 < DAT_00086b24) {
        DAT_0023b81c = 4;
        if ((uVar26 != 0) || (DAT_00087938 != 'd')) {
          DAT_0023b81c = DAT_00086b30 + 4;
        }
        DAT_0023b4d8 = 0x1000;
        DAT_0023b824 = 0x40;
        sVar31 = (ushort)bVar15 << 10;
      }
      else {
        bVar39 = uVar26 != 0;
        DAT_0023b81c = 0;
        bVar25 = bVar25 + 0x3a;
        if (bVar39) {
          DAT_0023b81c = DAT_00086b30;  /* was routed through a bogus `short *psVar29` pointer variable */
        }
        sVar31 = (ushort)bVar15 << 6;
        DAT_0023b4d8 = 0x100;
        DAT_0023b824 = 0x10;
      }
      DAT_0023b828 = sVar31 + -1;
      iVar16 = DAT_0023b83c * 0x60;
      uVar24 = (undefined1)DAT_0023b824;
      UW_REC_AT(iVar16)->attr[1] = (unsigned char)DAT_0023b824;
      UW_REC_AT(iVar16)->attr[2] = (unsigned char)DAT_0023b824;
      { void *_tp = get_texture_page(bVar25); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
      iVar32 = DAT_0023b83c;
      iVar18 = DAT_0023b83c * 0x60;
      UW_REC_AT(iVar18)->attr[0] = uVar17;
      sVar31 = DAT_000da47c;
      UW_REC_AT(iVar18)->tex[0] = (short)DAT_000da47c;
      iVar19 = (int)DAT_0023b4e4;
      cVar2 = (char)(sVar31 >> 0xf);
      local_34 = iVar18;
      local_44 = ordfloat_int_to_float2((iVar19 + (uint)(byte)(&DAT_00086bb0)[iVar33]) * 0x100);
      iVar16 = DAT_0023b838;
      iVar34 = DAT_0023b838 * 0xc;
      iVar30 = (int)DAT_0023b4e8;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->x) = local_44;
      local_40 = ordfloat_int_to_float2((iVar30 + (uint)(byte)(&DAT_00086bb1)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->z) = local_40;
      uVar28 = (uint)local_81 * 0x40;
      uVar22 = 0x400;
      if (local_81 == 0x10 || uVar28 < 0x400) {
        uVar22 = uVar28;
      }
      uVar17 = ordfloat_int_to_float2(uVar22);
      iVar38 = (int)DAT_0023b824;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y) = uVar17;
      UW_REC_AT(iVar18)->vert_idx[0] = iVar16;
      UW_REC_AT(iVar18)->uv[0] = 0;
      uVar17 = ordfloat_int_to_float2(iVar38 + -1);
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      iVar36 = iVar16 + 1;
      DAT_0023b838 = iVar36;
      UW_REC_AT(iVar18)->uv[1] = uVar20;
      iVar34 = iVar36 * 0xc;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->x) = local_44;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->z) = local_40;
      uVar20 = ordfloat_int_to_float2((uVar1 + pbVar35[(byte)(&DAT_00086bb2)[iVar33]]) * 0x40);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y) = uVar20;
      UW_REC_AT(iVar18)->vert_idx[1] = iVar36;
      UW_REC_AT(iVar18)->uv[2] = 0;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      iVar34 = iVar16 + 2;
      DAT_0023b838 = iVar34;
      UW_REC_AT(iVar18)->uv[3] = uVar20;
      local_3c = ordfloat_int_to_float2((iVar19 + (uint)(byte)(&DAT_00086bb3)[iVar33]) * 0x100);
      iVar19 = iVar34 * 0xc;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar19)->x) = local_3c;
      local_38 = ordfloat_int_to_float2((iVar30 + (uint)(byte)(&DAT_00086bb4)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar19)->z) = local_38;
      uVar20 = ordfloat_int_to_float2((uVar1 + pbVar35[(byte)(&DAT_00086bb5)[iVar33]]) * 0x40);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar19)->y) = uVar20;
      UW_REC_AT(iVar18)->vert_idx[2] = iVar34;
      iVar33 = iVar38 + -1;
      UW_REC_AT(iVar18)->uv[4] = iVar33;
      uVar24 = (undefined1)((uint)iVar33 >> 8);
      uVar3 = (undefined1)((uint)iVar33 >> 0x10);
      uVar4 = (undefined1)((uint)iVar33 >> 0x18);
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar19)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      iVar30 = iVar16 + 3;
      UW_REC_AT(iVar18)->uv[5] = uVar20;
      iVar19 = iVar30 * 0xc;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar19)->x) = local_3c;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar19)->z) = local_38;
      uVar28 = (uint)local_80 * 0x40;
      if (local_80 != 0x10 && 0x3ff < uVar28) {
        uVar28 = 0x400;
      }
      uVar20 = ordfloat_int_to_float2(uVar28);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar19)->y) = uVar20;
      UW_REC_AT(iVar18)->vert_idx[3] = iVar30;
      UW_REC_AT(iVar18)->uv[6] = iVar33;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar19)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      UW_REC_AT(iVar18)->uv[7] = uVar17;
      DAT_000a85d0 = iVar16 + 4;
      DAT_0023b838 = DAT_000a85d0;
      while ((UW_REC_AT(local_34)->uv[3] < 0 || (UW_REC_AT(local_34)->uv[5] < 0))) {
        iVar33 = UW_REC_AT(local_34)->uv[1] + iVar38;
        UW_REC_AT(iVar18)->uv[1] = iVar33;
        iVar33 = UW_REC_AT(local_34)->uv[3] + iVar38;
        UW_REC_AT(iVar18)->uv[3] = iVar33;
        iVar33 = UW_REC_AT(local_34)->uv[5] + iVar38;
        UW_REC_AT(iVar18)->uv[5] = iVar33;
        iVar33 = UW_REC_AT(local_34)->uv[7] + iVar38;
        UW_REC_AT(iVar18)->uv[7] = iVar33;
      }
      UW_REC_AT(iVar18)->vert_count = 4;
      if (!g_uw_hide_walls) DAT_000a85d4 = iVar32 + 1;
      local_83 = DAT_0023b4e0;
      puVar23 = (ushort *)DAT_0023b4ec;
      iVar16 = DAT_00086e6c;
      bVar25 = DAT_0023b4e0;
      if (!g_uw_hide_walls) DAT_0023b83c = DAT_000a85d4;
    }
    local_54 = local_54 + 1 & 0xff;
    uVar27 = (short)uVar27 >> 1;
  } while (local_54 < 3);
  if (local_30 == 0x44) {
    iVar33 = (local_48 & 3) * 6;
    pcVar37 = &DAT_00086bc8 + iVar33;
    if ((((int)*pcVar37 + (int)DAT_0023b4e4 + -0x10) * 0x100 - (int)*(short *)(iVar16 + 10)) *
        (int)(char)(&DAT_00086bcc)[iVar33] +
        (((int)(char)(&DAT_00086bc9)[iVar33] + (int)DAT_0023b4e8) * 0x100 -
        (int)*(short *)(iVar16 + 0x12)) * (int)(char)(&DAT_00086bcd)[iVar33] < 0) {
      /* diagonal-wall face: same wall-texture-index byte fix as the
         orthogonal branch above (word2 byte 2 bits 0-5, not byte 1). */
      ((void (*)(void *, int, int, int))DAT_0023b4d4)(auStack_50,bVar25,0x10 - (uint)bVar15,(byte)puVar23[2] & 0x3f);
      uVar27 = (ushort)DAT_0023b4e0;
      bVar25 = (byte)g_current_tile->wall_tex;
      if ((short)uVar27 < DAT_00086b24) {
        DAT_0023b81c = 4;
        if ((uVar27 != 0) || (DAT_00087938 != 'd')) {
          DAT_0023b81c = DAT_00086b30 + 4;
        }
        DAT_0023b4d8 = 0x1000;
        sVar31 = (ushort)bVar15 << 10;
        DAT_0023b824 = 0x40;
      }
      else {
        bVar39 = uVar27 != 0;
        DAT_0023b81c = 0;
        sVar31 = (ushort)bVar15 << 6;
        bVar25 = bVar25 + 0x3a;
        if (bVar39) {
          DAT_0023b81c = DAT_00086b30;  /* was routed through a bogus `short *psVar29` pointer variable */
        }
        DAT_0023b4d8 = 0x100;
        DAT_0023b824 = 0x10;
      }
      DAT_0023b828 = sVar31 + -1;
      iVar16 = DAT_0023b83c * 0x60;
      uVar24 = (undefined1)DAT_0023b824;
      UW_REC_AT(iVar16)->attr[1] = (unsigned char)DAT_0023b824;
      UW_REC_AT(iVar16)->attr[2] = (unsigned char)DAT_0023b824;
      { void *_tp = get_texture_page(bVar25); if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) g_tile_texptr_emit[DAT_0023b83c] = _tp; uVar17 = (undefined4)(uintptr_t)_tp; }
      iVar34 = DAT_0023b83c * 0x60;
      UW_REC_AT(iVar34)->attr[0] = uVar17;
      sVar31 = DAT_000da47c;
      UW_REC_AT(iVar34)->tex[0] = (short)DAT_000da47c;
      iVar38 = (int)DAT_0023b4e4;
      cVar2 = (char)(sVar31 >> 0xf);
      iVar32 = DAT_0023b838 * 0xc;
      uVar17 = ordfloat_int_to_float2((iVar38 + *pcVar37) * 0x100);
      iVar18 = (int)DAT_0023b4e8;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar32)->x) = uVar17;
      uVar17 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bc9)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar32)->z) = uVar17;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar32)->y) = 0x44800000;
      iVar16 = DAT_0023b838;
      UW_REC_AT(iVar34)->vert_idx[0] = iVar16;
      UW_REC_AT(iVar34)->uv[0] = 0;
      iVar19 = DAT_0023b824 + -1;
      /* Ghidra dropped the argument: this is ordfloat_int_to_float2(iVar19), the int->float of
         (texture_size - 1) used as the V-texcoord scale for all four corners of this tile-emit
         branch... */
      uVar17 = ordfloat_int_to_float2(iVar19);
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar32)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      iVar32 = iVar16 + 1;
      DAT_0023b838 = iVar32;
      UW_REC_AT(iVar34)->uv[1] = uVar20;
      iVar30 = iVar32 * 0xc;
      uVar20 = ordfloat_int_to_float2((iVar38 + *pcVar37) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->x) = uVar20;
      uVar20 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bc9)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->z) = uVar20;
      local_30 = ordfloat_int_to_float2(uVar1 << 6);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y) = local_30;
      UW_REC_AT(iVar34)->vert_idx[1] = iVar32;
      UW_REC_AT(iVar34)->uv[2] = 0;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      iVar32 = iVar16 + 2;
      DAT_0023b838 = iVar32;
      UW_REC_AT(iVar34)->uv[3] = uVar20;
      iVar30 = iVar32 * 0xc;
      uVar20 = ordfloat_int_to_float2((iVar38 + (char)(&DAT_00086bca)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->x) = uVar20;
      uVar20 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bcb)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->z) = uVar20;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y) = local_30;
      UW_REC_AT(iVar34)->vert_idx[2] = iVar32;
      UW_REC_AT(iVar34)->uv[4] = iVar19;
      uVar24 = (undefined1)((uint)iVar19 >> 8);
      uVar3 = (undefined1)((uint)iVar19 >> 0x10);
      uVar4 = (undefined1)((uint)iVar19 >> 0x18);
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      iVar32 = iVar16 + 3;
      DAT_0023b838 = iVar32;
      iVar30 = iVar32 * 0xc;
      UW_REC_AT(iVar34)->uv[5] = uVar20;
      uVar20 = ordfloat_int_to_float2((iVar38 + (char)(&DAT_00086bca)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->x) = uVar20;
      uVar20 = ordfloat_int_to_float2((iVar18 + (char)(&DAT_00086bcb)[iVar33]) * 0x100);
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->z) = uVar20;
      UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y) = 0x44800000;
      UW_REC_AT(iVar34)->vert_idx[3] = iVar32;
      UW_REC_AT(iVar34)->uv[6] = iVar19;
      uVar20 = ordfloat_sub(0x44800000,*(undefined4 *)&UW_VERT_AT(g_geom_arena.model_verts, iVar30)->y);
      uVar20 = ordfloat_mul(uVar20,0x3b800000);
      uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
      DAT_000a85d0 = iVar16 + 4;
      DAT_0023b838 = DAT_000a85d0;
      if (!g_uw_hide_walls) {
        DAT_000a85d4 = DAT_0023b83c + 1;
        DAT_0023b83c = DAT_000a85d4;
      }
      UW_REC_AT(iVar34)->uv[7] = uVar17;
      UW_REC_AT(iVar34)->vert_count = 4;
      puVar23 = (ushort *)DAT_0023b4ec;
    }
  }
  /* emit_tile_features renders this tile's animated features and the objects sitting on it (doors,
     switches, bridges, item billboards). */
  {
    static int _tile_features = -1;
    if (_tile_features < 0)
      _tile_features = (!g_opts.disable_tile_features);
    if (_tile_features) {
      emit_tile_features(puVar23 + 1);
    }
  }
  cVar2 = DAT_0023b834;
  if (((puVar23 + 1 != (ushort *)0x0) && (DAT_0023b834 != '\0')) &&
     (DAT_0023b834 = '\0', DAT_0023b4e0 < 8)) {
    local_84 = cVar2 << 6 | local_84;
  }
  if (DAT_00086b20 != 0) {
    *cell = local_84;
  }
}




// Was `int`, truncating the real DAT_002029cc pointer arithmetic result below
// (same pointer-truncation pattern fixed elsewhere this session).
// was FUN_00068100 -- (tileX,tileY) -> 4-byte tile record ptr in the level map, NULL if either coord is outside 0..63
void *tilemap_lookup(short tile_x, short tile_y)
{
  char *iVar1;

  /* DAT_002029cc is set once, early (init_level_object_arena/ reset_level_object_arena, a real
     malloc'd pointer via ce_malloc), but has been separately observed (init_gameplay_session's own
     comment) to no longer hold that pointer by later points in a session... */
  if ((((int)tile_y & 0xffffffc0U) + ((int)tile_x & 0xffffffc0U) == 0) &&
      ((uintptr_t)DAT_002029cc >= 0x10000)) {
    iVar1 = DAT_002029cc + ((int)tile_x + tile_y * 0x40) * 4;
  }
  else {
    iVar1 = 0;
  }
  return iVar1;
}




// was FUN_00064d34 -- tracks which phase of the per-ring wall/tile scan is current (recorded in
// DAT_0023bb94, read back by bitmap.c's sprite-vs-wall depth-partition dispatch) and maintains a
// rolling window of up to 8 recent wall-edge entries (DAT_0023b908/DAT_0023b928) across ring...
void update_wall_partition_phase(char phase)
{
  uint uVar1;
  uint uVar2;

  if (phase == -10) {
    ce_memset(&DAT_0023b940,0,0x252);
  }
  else {
    if (phase == '\0') {
      uVar1 = (uint)DAT_0023b908;
      if (uVar1 == 0) {
        DAT_0023bb94 = phase;
        return;
      }
      uVar2 = (uint)DAT_0023b928;
      if (8 < uVar2 + uVar1) {
        uVar1 = 8 - uVar2;
        DAT_0023b908 = (ushort)uVar1;
      }
      ce_memmove(&DAT_0023b928 + uVar2 + 1,&DAT_0023b90a,(uVar1 & 0xffff) << 1);
      DAT_0023b928 = DAT_0023b928 + (short)uVar1;
      DAT_0023bb94 = phase;
      return;
    }
    if (phase == '\x01') {
      ce_memmove(&DAT_0023b908,&DAT_0023b928,0x12);
      DAT_0023b928 = 0;
      DAT_0023bb94 = phase;
      return;
    }
    if (phase != '\x02') {
      DAT_0023bb94 = phase;
      return;
    }
  }
  ce_memset(&DAT_0023b908,0,0x12);
  ce_memset(&DAT_0023b928,0,0x12);
  DAT_0023bb94 = phase;
}




// was FUN_00064e3c -- bubble-sorts adjacent-index pairs in DAT_0023b8c8/DAT_0023b8c9 (see the
// array-layout comment on their declaration) over [param_1, param_2) by each entry's depth key
// (compute_feature_depth_key's output, cached in DAT_0023bb98).
void sort_feature_pairs_by_depth(short first, int last)
{
  int iVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = (last + -1) * 0x10000 >> 0x10;
  iVar1 = (int)first;
  if (iVar1 <= iVar5) {
    iVar4 = iVar1;
    if (iVar5 < iVar1) goto LAB_00064ea8;
    do {
      do {
        cVar3 = (&DAT_0023b8c8)[iVar4];
        iVar2 = (iVar4 + 1) * 0x10000 >> 0x10;
        if ((char)(&DAT_0023bb98)[cVar3 * 4] <
            (char)(&DAT_0023bb98)[(char)(&DAT_0023b8c9)[iVar4] * 4]) {
          (&DAT_0023b8c8)[iVar4] = (&DAT_0023b8c9)[iVar4];
          (&DAT_0023b8c9)[iVar4] = cVar3;
        }
        iVar4 = iVar2;
      } while (iVar2 <= iVar5);
LAB_00064ea8:
      iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
      iVar4 = iVar1;
    } while (iVar1 <= iVar5);
  }
}



// was FUN_00064ec8 -- initializes DAT_0023b8c8[0..param_1) to the
// identity order (0,1,2,...) before sort_feature_pairs_by_depth
// reorders it.
void init_feature_sort_order(short count)
{
  int iVar1;
  
  iVar1 = 0;
  if (0 < count) {
    do {
      (&DAT_0023b8c8)[iVar1] = (char)iVar1;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < count);
  }
}



/* param_1 (out record) and param_2 (src record) were `int`, truncating
   the real pointers emit_tile_features passes. */
// was FUN_00065210 -- computes a rotated-quad corner's screen X/Y offset (param_1[1]/[2]) from a
// source feature record's facing byte (param_2[3]) via the DAT_00086d68/DAT_00086d69
// per-view-facing corner-index remap table...
void resolve_billboard_corner_offset(byte *corner, void *feature_ptr)
{
  byte *feature = (byte *)feature_ptr;
  *(undefined *)(corner + 1) =
       (&DAT_00086d68)[((uint)(*(byte *)(feature + 3) >> 5) + DAT_0023b4a0 * 8) * 2] +
       (&DAT_00086d68)[((*(byte *)(feature + 3) >> 2 & 7) + ((int)DAT_0023b4a0 + 1U & 3) * 8) * 2];
  *(undefined *)(corner + 2) =
       (&DAT_00086d69)[((uint)(*(byte *)(feature + 3) >> 5) + DAT_0023b4a0 * 8) * 2] +
       (&DAT_00086d69)[((*(byte *)(feature + 3) >> 2 & 7) + ((int)DAT_0023b4a0 + 1U & 3) * 8) * 2];
  *(byte *)(corner + 3) = *(byte *)(feature + 2) & 0x7f;
}



// was FUN_000652e8 -- computes a feature's draw-order depth key (written to param_1[0]) from its
// X/Y offsets (param_1[1]/[2]), combined differently depending on which ring-scan phase is current
// (DAT_0023bb94, see update_wall_partition_phase).
void compute_feature_depth_key(char *feature)
{
  char cVar1;
  
  if (DAT_0023bb94 == '\0') {
    cVar1 = feature[2] << 1;
  }
  else if (DAT_0023bb94 == '\x01') {
    cVar1 = feature[2] + feature[1] + '\x01';
  }
  else {
    if (DAT_0023bb94 != '\x02') {
      return;
    }
    cVar1 = ('\b' - feature[1]) + feature[2];
  }
  *feature = cVar1;
}



// was FUN_00065348 -- flushes any still-pending per-tile feature records (a nonzero feature count
// at the current DAT_0023b940 slot, or a nonzero DAT_0023b928 wall-partition entry) via
// emit_tile_features, so nothing queued gets silently dropped.
void flush_pending_tile_features()

{
  if (*(short *)(&DAT_0023b940 + DAT_0023b4e4 * 0x12) != 0) {
    emit_tile_features(0);
  }
  if (DAT_0023b928 != 0) {
    emit_tile_features(0);
  }
  return;
}



// was FUN_00065394
void emit_tile_features(ushort *tile)
{
  int iVar1;
  uint uVar2;
  short sVar3;
  char *puVar4;  /* was `undefined4 uVar4` -- truncated get_object_record_by_slot_index's real pointer before
   forwarding it into resolve_billboard_corner_offset, which dereferences it (offset+2/+3). */
  ushort *puVar5;
  ushort *puVar6;
  int iVar7;
  char cVar8;
  ushort uVar9;
  uint uVar10;
  ushort uVar11;
  ushort uVar12;
  int iVar13;
  char *pcVar14;
  int iVar15;
  int iVar16;
  short local_38;
  short local_36;
  undefined4 local_34;
  int local_30;

  local_34 = local_34 & 0xffff0000;
  iVar13 = 0;
  local_36 = -1;
  iVar16 = 0;
  iVar7 = 1;
  local_38 = 0;
  iVar15 = (int)DAT_0023b4e4;
  if (*(short *)(&DAT_0023b940 + iVar15 * 0x12) != 0) {
    do {
      iVar1 = (int)(short)iVar13;
      if (8 < iVar1) break;
      uVar9 = *(ushort *)(&DAT_0023b940 + (iVar15 * 9 + (int)(short)iVar7) * 2);
      (&DAT_0023b848)[iVar1] = uVar9 & 0x3ff;
      /* Ghidra dropped the object-slot arg -- with it defaulting to 0,
         get_object_record_by_slot_index returned NULL and resolve_billboard_corner_offset below
         dereferenced it, which is why the whole tile-features/object pass was disabled. */
      puVar4 = (char *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[iVar1]);
      iVar15 = iVar1 * 4;
      pcVar14 = &DAT_0023bb98 + iVar15;
      /* get_object_record_by_slot_index legitimately returns NULL for a slot value that isn't a
         currently-populated object (unlike the dropped-arg bug fixed just above, this is a real
         "nothing here" case, not a truncation/garbage-argument one)... */
      if (puVar4 != NULL) {
        resolve_billboard_corner_offset(pcVar14,puVar4);
      }
      if ((uVar9 & 0x1000) != 0) {
        if ((uVar9 & 0x2000) == 0) {
          cVar8 = (&DAT_0023bb99)[iVar15] + '\b';
        }
        else {
          cVar8 = (&DAT_0023bb99)[iVar15] + -8;
        }
        (&DAT_0023bb99)[iVar15] = cVar8;
      }
      if ((uVar9 & 0x4000) != 0) {
        (&DAT_0023bb9a)[iVar15] = (&DAT_0023bb9a)[iVar15] + '\b';
      }
      compute_feature_depth_key(pcVar14);
      if ((uVar9 & 0x8000) != 0) {
        *pcVar14 = *pcVar14 + -1;
      }
      local_38 = (short)((uint)((iVar1 + 1) * 0x10000) >> 0x10);
      iVar13 = (int)local_38;
      iVar7 = ((short)iVar7 + 1) * 0x10000 >> 0x10;
      iVar15 = (int)DAT_0023b4e4;
    } while (iVar7 <= (int)(uint)*(ushort *)(&DAT_0023b940 + iVar15 * 0x12));
  }
  if (DAT_0023b928 == 0) {
    *(undefined2 *)(&DAT_0023b940 + DAT_0023b4e4 * 0x12) = 0;
  }
  else {
    /* Ghidra dropped the size argument; the zero-branch above writes the
       same destination as a plain `undefined2`, so this is a 2-byte
       copy. */
    ce_memmove(&DAT_0023b940 + DAT_0023b4e4 * 0x12,&DAT_0023b928,2);
  }
  DAT_0023b928 = 0;
  puVar5 = (ushort *)resolve_object_link(tile);
  do {
    sVar3 = (short)iVar13;
    if ((puVar5 == (ushort *)0x0) || (local_30 = (int)(short)iVar16, 0x3b < local_30)) {
      uVar10 = local_34;
      if (((ushort)local_34 == 0) || (uVar10 = (uint)sVar3, (int)uVar10 < 2)) {
        local_34 = uVar10;
        init_feature_sort_order(iVar13);
        local_34 = (uint)sVar3;
        uVar10 = local_34;
        if (1 < (int)local_34) {
          sort_feature_pairs_by_depth(0,iVar13 + -1);
          uVar10 = local_34;
        }
      }
      else {
        uVar9 = (ushort)local_34 & 0x3f;
        local_34 = uVar10;
        if (((ushort)local_34 & 0xffc0) == 0x5900) {
          sprite_partition_tmap(uVar9,&local_36,iVar13);  /* args dropped by Ghidra; mirrors the sprite_partition_by_depth call below */
        }
        else {
          sprite_partition_by_depth(uVar9,&local_36,iVar13);
        }
        iVar15 = (int)local_36;
        if (1 < local_36) {
          sort_feature_pairs_by_depth(0,iVar15 + -1);
          iVar15 = (int)local_36;
        }
        if ((int)(short)iVar15 < (int)(uVar10 - 2)) {
          sort_feature_pairs_by_depth(iVar15 + 1,iVar13 + -1);
        }
      }
      if (0 < (int)uVar10) {
        iVar15 = 0;
        do {
          cVar8 = (&DAT_0023b8c8)[iVar15];
          puVar5 = (ushort *)get_object_record_by_slot_index((int)(short)(&DAT_0023b848)[cVar8]);
          /* Same "get_object_record_by_slot_index can legitimately return NULL for an empty slot"
             case as the fix above -- this loop dereferences puVar5 immediately below (and passes it
             to emit_tile_objects), so skip this index instead of crashing. */
          if (puVar5 == (ushort *)0x0) {
            iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
            continue;
          }
          iVar7 = cVar8 * 4;
          DAT_0023b904 = ((short)(char)(&DAT_0023bb99)[iVar7] +
                         (short)((uint)((int)DAT_0023b4e4 << 0x13) >> 0x10)) * 0x20 + 0x10;
          DAT_0023b920 = ((short)(char)(&DAT_0023bb9a)[iVar7] +
                         (short)((uint)((int)DAT_0023b4e8 << 0x13) >> 0x10)) * 0x20 + 0x10;
          if (((((uw_object_hdr_t *)puVar5)->object_id & 0x1c0) == 0x40) || (iVar16 = object_ptr_in_arena(puVar5), iVar16 == 0)) {
            DAT_0023b91c = (((uw_object_hdr_t *)puVar5)->zpos) << 3;
          }
          else {
            DAT_0023b91c = (short)((uw_projectile_object_t *)puVar5)->precise_z;
          }
          if (DAT_0023b830 == '\0') {
            iVar7 = (int)(short)((int)((int)DAT_0023b904 -
                                      ((int)g_current_view->view_x & 0xffU)) >> 5);
            iVar16 = (int)(short)((int)((int)DAT_0023b920 -
                                       ((int)g_current_view->view_y & 0xffU)) >> 5);
            iVar13 = (int)(short)(((int)DAT_0023b91c - (int)g_current_view->view_elevation) >> 5);
            if (((iVar7 * iVar7 * 0x10000 >> 0x10) + (iVar16 * iVar16 * 0x10000 >> 0x10) +
                (iVar13 * iVar13 * 0x10000 >> 0x10)) * 0x10000 >> 0x10 < 1) {
              sVar3 = 0;
            }
            else {
              /* HACK: was a bare `integer_sqrt();` -- dropped argument, the same class of bug fixed
                 repeatedly elsewhere in this file. */
              sVar3 = integer_sqrt(((iVar7 * iVar7 * 0x10000 >> 0x10) + (iVar16 * iVar16 * 0x10000 >> 0x10) +
                (iVar13 * iVar13 * 0x10000 >> 0x10)) * 0x10000 >> 0x10);
            }
            iVar7 = (int)DAT_002506dc + (int)(short)((int)DAT_0025063c * (int)sVar3 >> 6);
            sVar3 = (short)iVar7;
            if (iVar7 * 0x10000 >> 0x10 < 0) {
              sVar3 = 0;
            }
            DAT_0023bc88 = (undefined1)((int)DAT_0025064c + (int)sVar3);
            if (0xe < ((int)DAT_0025064c + (int)sVar3 & 0xffU)) {
              DAT_0023bc88 = 0xe;
            }
          }
          else {
            iVar16 = (char)(&DAT_0023bb99)[iVar7] + 0x40;
            if (iVar16 < 0) {
              iVar16 = (char)(&DAT_0023bb99)[iVar7] + 0x47;
            }
            iVar7 = (int)(char)(&DAT_0023bb9a)[iVar7];
            if (iVar7 < 0) {
              iVar7 = iVar7 + 7;
            }
            DAT_0023b8c4 = ((short)(iVar16 >> 3) + -8) * DAT_0023bc8c +
                           (short)(iVar7 >> 3) * DAT_0023b8c0;
          }
          emit_tile_objects(puVar5);
          iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
        } while (iVar15 < (int)local_34);
      }
      return;
    }
    uVar10 = (uint)(short)(((uw_object_hdr_t *)puVar5)->object_id);
    if ((uVar10 == 0x164) || (((((uw_object_hdr_t *)puVar5)->object_id & 0x1f0) == 0x140 || (uVar10 == 0x1cf)))) {
      uVar2 = local_34 >> 0x10;
      local_34 = CONCAT22((short)uVar2,sVar3 + (short)((uVar10 << 0x16) >> 0x10));
LAB_0006574c:
      iVar15 = (int)sVar3;
      pcVar14 = &DAT_0023bb98 + iVar15 * 4;
      resolve_billboard_corner_offset(pcVar14,puVar5);
LAB_00065770:
      compute_feature_depth_key(pcVar14);
      if ((uVar10 & 0x1c0) == 0x1c0) {
        cVar8 = *pcVar14 + -1;
LAB_000657b0:
        *pcVar14 = cVar8;
      }
      else if ((uVar10 & 0x1fe) == 0x16e) {
        cVar8 = *pcVar14 + ' ';
        goto LAB_000657b0;
      }
      (&DAT_0023b848)[iVar15] = *tile >> 6;
      if (iVar15 < 0x3c) {
        local_38 = (short)((uint)((iVar15 + 1) * 0x10000) >> 0x10);
        goto LAB_000657f4;
      }
    }
    else {
      if ((((byte)g_object_type_props[uVar10].size_weight) & 8) == 0) goto LAB_0006574c;
      iVar15 = (int)local_38;
      uVar11 = 0;
      iVar7 = iVar15 * 4;
      pcVar14 = &DAT_0023bb98 + iVar7;
      resolve_billboard_corner_offset(pcVar14,puVar5);
      uVar9 = (byte)((byte)g_object_type_props[uVar10].size_weight) & 7;
      if ((int)(char)(&DAT_0023bb9a)[iVar7] - (int)(short)uVar9 < 0) {
        uVar11 = 0x4000;
      }
      if (DAT_0023bb94 == '\x01') {
        uVar9 = (ushort)((uint)((short)uVar9 * -0x10000) >> 0x10);
      }
      uVar12 = uVar11;
      if (((DAT_0023bb94 != '\0') &&
          (((int)(char)(&DAT_0023bb99)[iVar7] + (int)(short)uVar9 & 0xfffffff8U) != 0)) &&
         (uVar12 = uVar11 | 0x1000, DAT_0023bb94 == '\x02')) {
        uVar12 = uVar11 | 0x3000;
      }
      if (uVar12 == 0) {
LAB_0006576c:
        iVar13 = (int)local_38;
        goto LAB_00065770;
      }
      uVar12 = uVar12 | *tile >> 6;
      if ((uVar10 & 0x1c0) == 0x1c0) {
        uVar12 = uVar12 | 0x8000;
      }
      if ((uVar12 & 0x5000) == 0x5000) {
        puVar6 = (ushort *)&DAT_0023b928;
      }
      else {
        if ((uVar12 & 0x4000) == 0) {
          if ((uVar12 & 0x2000) == 0) {
            puVar6 = (ushort *)(&DAT_0023b92e + DAT_0023b4e4 * 0x12);
            goto LAB_0006570c;
          }
          iVar7 = DAT_0023b4e4 + 1;
        }
        else {
          iVar7 = (int)DAT_0023b4e4;
        }
        puVar6 = (ushort *)(&DAT_0023b940 + iVar7 * 0x12);
      }
LAB_0006570c:
      if (8 < *puVar6) goto LAB_0006576c;
      uVar9 = *puVar6 + 1;
      *puVar6 = uVar9;
      puVar6[uVar9] = uVar12;
LAB_000657f4:
      iVar13 = (int)local_38;
    }
    tile = puVar5 + 2;
    /* Ghidra dropped the arg -- advance to the next object in the tile's
       chain via the link field at puVar5+2 (== tile), same as the
       resolve_object_link(tile) call that primes this loop. */
    puVar5 = (ushort *)resolve_object_link(tile);
    iVar16 = (local_30 + 1) * 0x10000 >> 0x10;
  } while( true );
}







// was FUN_00073b18 -- struct-recovery-plan.md: converts a uw_tile_t.no_magic read (was
// `*(byte*)(tile+1) >> 6 & 1`, bit 6 of byte 1 = overall bit 14 = no_magic per uw_tile_t's own
// field- confirmed layout) to the real struct field.
/* was declared with empty parens and called tilemap_lookup() with no explicit args, relying on its
   2 real args still sitting in the same ABI registers/stack slots at the nested call (a K&R
   "dropped-arg" register-forwarding idiom used elsewhere in this file, e.g. the DAT_0023aecc fix). */
byte tile_is_no_magic(int tile_x, int tile_y)
{
  uw_tile_t *tile = (uw_tile_t *)tilemap_lookup(tile_x,tile_y);
  return tile->no_magic;
}


/* Return type was `int`, truncating the real 64-bit pointer every
   caller casts back to (byte *) and dereferences. */
// was FUN_00040c5c
void *get_texture_page(short page_index)
{
  int iVar1;
  char **ppcVar2;

  iVar1 = (int)page_index;
  if (iVar1 < 0x30) {
    return DAT_0023ae38 + iVar1 * 0x1000;
  }
  if (iVar1 < 0x3a) {
    return DAT_0023ae34 + (iVar1 + -0x30) * 0x400;
  }
  if (iVar1 < 0x6a) {
    iVar1 = iVar1 + -0x3a;
    ppcVar2 = &DAT_0023ae3c;
  }
  else {
    if (0x73 < iVar1) {
      return 0;
    }
    iVar1 = iVar1 + -0x6a;
    ppcVar2 = &DAT_0023ae30;
  }
  return *ppcVar2 + iVar1 * 0x100;
}


// was FUN_00060aa0
void emit_tile_objects(ushort *tile)
{
  byte bVar1;
  char cVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  undefined1 uVar7;
  undefined1 uVar8;
  undefined1 uVar9;
  undefined1 uVar10;
  undefined1 uVar11;
  ushort *puVar12;
  byte bVar13;
  bool bVar14;
  undefined2 uVar15;
  ushort uVar16;
  int iVar17;
  undefined4 uVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  undefined4 uVar21;
  undefined4 uVar22;
  int iVar23;
  undefined4 uVar24;
  undefined4 uVar25;
  int extraout_r1;
  uw_vec3 *puVar26;
  uint uVar27;
  int iVar28;
  uint uVar29;
  undefined4 uVar30;
  int iVar31;
  int iVar32;
  int iVar33;
  int iVar34;
  int iVar35;
  ushort local_54;
  
  if (tile == g_player_object) {
    return;
  }
  if ((*tile & 0x4000) == 0x4000) {
    return;
  }
  if (DAT_0023b830 != 0) {
    *(short *)((intptr_t)g_pick_tile_off_backing + (uint)DAT_0023b830 * 2 + 2) =
         DAT_0023b8c4 + (short)((DAT_0023b4ec - DAT_0023b814) >> 2);
    uVar15 = encode_object_slot_index(tile);
    puVar12 = (ushort *)DAT_00110fc0;
    *(undefined2 *)(&DAT_0023b676 + (uint)DAT_0023b830 * 2) = uVar15;
    *puVar12 = 0xae;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_0023b830;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    bVar13 = DAT_0023b830 + 1;
    DAT_000da47c = (ushort)DAT_0023b830;
    DAT_0023b830 = bVar13;
    if (0xbf < bVar13) {
      DAT_0023b830 = 1;
    }
  }
  iVar17 = object_ptr_in_arena(tile);
  if ((iVar17 != 0) && ((*tile & 0x1c0) != 0x40)) {
    bVar13 = *(byte *)((char *)tile + 0xb);
    bVar1 = *(byte *)((char *)tile + 0xd);
    if (DAT_0023b4a0 == '\0') {
      local_54 = (ushort)bVar13;
      uVar16 = (ushort)bVar1;
    }
    else if (DAT_0023b4a0 == '\x01') {
      local_54 = 0xff - bVar1;
      uVar16 = (ushort)bVar13;
    }
    else if (DAT_0023b4a0 == '\x02') {
      local_54 = 0xff - bVar13;
      uVar16 = 0xff - bVar1;
    }
    else {
      uVar16 = local_54;
      if (DAT_0023b4a0 == '\x03') {
        local_54 = (ushort)bVar1;
        uVar16 = 0xff - bVar13;
      }
    }
    DAT_0023b904 = (DAT_0023b904 & 0xff00) + local_54;
    DAT_0023b920 = (DAT_0023b920 & 0xff00) + uVar16;
  }
  /* --extralights: every visible object is checked for being a light source (campfire, magic
     projectile, ...) as the tiles are walked; see extra_lights_consider_object. */
  extra_lights_consider_object(*tile, (short)DAT_0023b904, (short)DAT_0023b920, (short)DAT_0023b91c);
  if (UW_OPT_ISSET(g_opts.look_slot)) {
    static int _done = 0;
    if (!_done) {
      _done = 1;
      int _slot = g_opts.look_slot;
      ushort *_rec = (ushort *)(_slot < 0x100 ? (void *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                               : (void *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8));
      ushort _w0 = ((uw_object_hdr_t *)_rec)->type_flags;
      int _id = _w0 & 0x1ff;
      int _iv = _id * 0xd;
      int _grp = g_object_type_props[_iv / 0xd].quality_type;
      int _qual = ((uw_object_hdr_t *)_rec)->quality;
      int _off = 0;
      if (_qual != 0) {
        _off = ((g_object_type_props[_iv / 0xd].quality_flags & 0xc) == 0xc) ? 5 : ((((uw_object_hdr_t *)_rec)->quality >> 4) + 1);
      }
      char *_nm = (char *)get_message_string(_grp * 6 + _off | 0xa00);
      fprintf(stderr, "[lookslot] slot=%d id=0x%03x flags=0x%04x has_lookbit=%d namegrp=%d name='%s'\n",
              _slot, _id, (unsigned)_w0, g_object_type_props[_id].has_look_description, _grp, _nm ? _nm : "(null)");
    }
  }
  if (g_opts.dump_objects) {
    static int _dumped = 0;
    if (!_dumped) {
      _dumped = 1;
      /* Walk every tile's object chain (tile record = 4 bytes at DAT_002029cc[tile_idx*4], chain
         head = ushort at +2, matching set_player_tile_position's object_list_unlink(DAT_002029cc +
         tile_idx*4 + 2, ...)) so found objects come with real tile coordinates... */
      int _tx, _ty;
      for (_ty = 0; _ty < 0x40; _ty++) {
        for (_tx = 0; _tx < 0x40; _tx++) {
          int _tidx = _tx + _ty * 0x40;
          ushort _head = *(ushort *)((intptr_t)DAT_002029cc + _tidx * 4 + 2);
          int _slot = (_head & 0xffc0) != 0 ? _head >> 6 : 0;
          int _guard = 0;
          while (_slot != 0 && _guard++ < 64) {
            void *_rec = _slot < 0x100 ? (void *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                        : (void *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8);
            ushort _w = ((uw_object_hdr_t *)_rec)->type_flags;
            int _id = _w & 0x1ff;
            if ((_id >= 0x160 && _id <= 0x16f) || _id == 0x140 || _id == 0x141) {
              fprintf(stderr, "[objdump] tile=(%d,%d) slot=%d id=0x%03x flags=0x%04x\n",
                      _tx, _ty, _slot, _id, (unsigned)_w);
            }
            {
              int _rc = g_object_type_props[_id].class_flags & 3;
              if (_rc == 1) {
                unsigned char *_recb = (unsigned char *)_rec;
                fprintf(stderr, "[objdump-critter] tile=(%d,%d) slot=%d id=0x%03x flags=0x%04x b6=0x%02x\n",
                        _tx, _ty, _slot, _id, (unsigned)_w, (unsigned)_recb[6]);
              }
            }
            ushort _nextw = ((uw_object_hdr_t *)_rec)->link_word;
            _slot = (_nextw & 0xffc0) != 0 ? _nextw >> 6 : 0;
          }
        }
      }
      fprintf(stderr, "[objdump] scan complete\n");
    }
  }
  if (g_opts.dump_all_objects) {
    static int _dumped2 = 0;
    if (!_dumped2) {
      _dumped2 = 1;
      int _tx, _ty;
      for (_ty = 0; _ty < 0x40; _ty++) {
        for (_tx = 0; _tx < 0x40; _tx++) {
          int _tidx = _tx + _ty * 0x40;
          ushort _head = *(ushort *)((intptr_t)DAT_002029cc + _tidx * 4 + 2);
          int _slot = (_head & 0xffc0) != 0 ? _head >> 6 : 0;
          int _guard = 0;
          while (_slot != 0 && _guard++ < 64) {
            void *_rec = _slot < 0x100 ? (void *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                        : (void *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8);
            ushort _w = ((uw_object_hdr_t *)_rec)->type_flags;
            int _id = _w & 0x1ff;
            int _iv = _id * 0xd;
            unsigned char *_prop = (unsigned char *)&((byte *)g_object_type_props)[_iv];
            fprintf(stderr, "[objdumpall] tile=(%d,%d) slot=%d id=0x%03x flags=0x%04x rc=%d prop=%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
                    _tx, _ty, _slot, _id, (unsigned)_w, _prop[0] & 3,
                    _prop[0], _prop[1], _prop[2], _prop[3], _prop[4], _prop[5], _prop[6],
                    _prop[7], _prop[8], _prop[9], _prop[0xa], _prop[0xb], _prop[0xc]);
            ushort _nextw = ((uw_object_hdr_t *)_rec)->link_word;
            _slot = (_nextw & 0xffc0) != 0 ? _nextw >> 6 : 0;
          }
        }
      }
      fprintf(stderr, "[objdumpall] scan complete\n");
    }
  }
// Level-load object census for debugging: every placed object's tile position, id, resolved name,
  // render class, and (if applicable) which DATA3D model it now draws as.
  if (g_opts.dump_objects_file) {
    static int _dumped_census = 0;
    if (!_dumped_census) {
      _dumped_census = 1;
      const char *_path = g_opts.dump_objects_file;
      FILE *_f = fopen(_path, "w");
      if (_f == NULL) {
        fprintf(stderr, "[objcensus] failed to open '%s' for writing\n", _path);
      } else {
        fprintf(_f, "tile_x\ttile_y\tid\tname\trenderclass\theading\tquality\tflags\n");
        int _tx, _ty, _count = 0;
        for (_ty = 0; _ty < 0x40; _ty++) {
          for (_tx = 0; _tx < 0x40; _tx++) {
            int _tidx = _tx + _ty * 0x40;
            ushort _head = *(ushort *)((intptr_t)DAT_002029cc + _tidx * 4 + 2);
            int _slot = (_head & 0xffc0) != 0 ? _head >> 6 : 0;
            int _guard = 0;
            while (_slot != 0 && _guard++ < 64) {
              ushort *_rec = _slot < 0x100 ? (ushort *)((intptr_t)_slot * 0x1b + (intptr_t)DAT_002046b8)
                                            : (ushort *)((intptr_t)DAT_002046c4 + (intptr_t)(_slot - 0x100) * 8);
              ushort _w = ((uw_object_hdr_t *)_rec)->type_flags;
              int _id = _w & 0x1ff;
// Same field reads emit_tile_objects itself uses (not the objdumpall hook above,
              // which indexed the wrong property byte for render class -- see its own "rc=" column,
              // offset 0 instead of the real 0xa).
              int _rc = g_object_type_props[_id].class_flags & 3;
              int _heading = (((uw_object_hdr_t *)_rec)->position_word >> 6) & 7;
              int _quality = ((uw_object_hdr_t *)_rec)->owner;
// Page 4 of comobj's string data is the base object-name table, indexed directly by
              // id (see --dump-names/this session's findings) -- not the quality-adjective group
              // table --look-slot resolves via namegrp*6+offset.
              char *_name = (char *)get_message_string(0x800 | _id);
              fprintf(_f, "%d\t%d\t0x%03x\t%s\t%d\t%d\t%d\t0x%04x\n",
                      _tx, _ty, _id, (_name && _name[0]) ? _name : "(unnamed)",
                      _rc, _heading, _quality, (unsigned)_w);
              _count++;
              ushort _nextw = ((uw_object_hdr_t *)_rec)->link_word;
              _slot = (_nextw & 0xffc0) != 0 ? _nextw >> 6 : 0;
            }
          }
        }
        fclose(_f);
        fprintf(stderr, "[objcensus] wrote %d objects to '%s'\n", _count, _path);
      }
    }
  }
// Debug tool (--dump-containers-file): scan every tile's object chain (correctly, via
// resolve_object_link + the real "next" field at offset+4 -- NOT --dump-objects-file's own +6,
// which is actually the "first item inside this container" field)...
  if (g_opts.dump_containers_file) {
    static int _dumped_containers = 0;
    if (!_dumped_containers) {
      _dumped_containers = 1;
      const char *_path = g_opts.dump_containers_file;
      FILE *_f = fopen(_path, "w");
      if (_f == NULL) {
        fprintf(stderr, "[containercensus] failed to open '%s' for writing\n", _path);
      } else {
        fprintf(_f, "tile_x\ttile_y\tid\tname\tnum_items\titems\n");
        int _tx, _ty, _count = 0;
        for (_ty = 0; _ty < 0x40; _ty++) {
          for (_tx = 0; _tx < 0x40; _tx++) {
            int _tidx = _tx + _ty * 0x40;
            ushort *_headp = (ushort *)((char *)DAT_002029cc + _tidx * 4 + 2);
            ushort *_rec = (ushort *)resolve_object_link(_headp);
            int _guard = 0;
            while (_rec != NULL && _guard++ < 64) {
              ushort _w = ((uw_object_hdr_t *)_rec)->type_flags;
              int _id = _w & 0x1ff;
              if ((_w & 0x1c0) == 0x80) {
                ushort *_item = (ushort *)resolve_object_link((ushort *)((char *)_rec + 6));
                char _names[256];
                _names[0] = '\0';
                int _n = 0, _guard2 = 0;
                while (_item != NULL && _guard2++ < 32) {
                  int _iid = ((uw_object_hdr_t *)_item)->object_id;
                  char *_iname = (char *)get_message_string(0x800 | _iid);
                  strncat(_names, (_iname && _iname[0]) ? _iname : "?", sizeof(_names) - strlen(_names) - 2);
                  strncat(_names, ",", sizeof(_names) - strlen(_names) - 1);
                  _n++;
                  _item = (ushort *)resolve_object_link((ushort *)((char *)_item + 4));
                }
                char *_name = (char *)get_message_string(0x800 | _id);
                fprintf(_f, "%d\t%d\t0x%03x\t%s\t%d\t%s\n", _tx, _ty, _id,
                        (_name && _name[0]) ? _name : "(unnamed)", _n, _names);
                _count++;
              }
              _rec = (ushort *)resolve_object_link((ushort *)((char *)_rec + 4));
            }
          }
        }
        fclose(_f);
        fprintf(stderr, "[containercensus] wrote %d containers to '%s'\n", _count, _path);
      }
    }
  }
  if (g_opts.dump_names) {
    static int _dumped3 = 0;
    if (!_dumped3) {
      _dumped3 = 1;
      int _id, _pg;
      for (_pg = 0; _pg < 16; _pg++) {
        for (_id = 0; _id < 0x200; _id++) {
          char *_nm = (char *)get_message_string((_pg << 9) | _id);
          if (_nm && _nm[0]) {
            fprintf(stderr, "[names] page=%d id=0x%03x name='%s'\n", _pg, _id, _nm);
          }
        }
      }
      fprintf(stderr, "[names] scan complete\n");
    }
  }
  uVar27 = (uint)*tile;
  bVar1 = g_object_type_props[(uVar27 & 0x1ff)].class_flags;
  bVar13 = bVar1 & 3;
  if ((uVar27 & 0x1c0) == 0x1c0) {
    DAT_0023b804 = 1;
    uVar27 = (byte)tile[3] & 0x3f;
    if ((bVar1 & 3) == 0) {
      if ((short)uVar27 == 0) {
        uVar27 = (int)(short)*tile & 0x1ff;
      }
      else {
        uVar27 = uVar27 + 0x1c0;
      }
    }
  }
  else {
    uVar27 = uVar27 & 0x1ff;
  }
  if ((bVar1 & 3) == 0) {
    if ((((ushort)uVar27 & 0x1e0) == 0xe0) && ((uVar27 & 0x18) != 0)) {
      uVar27 = 0xe0;
    }
LAB_emit_mesh_sprite_quad:
    /* Same arena-overflow risk as the tile-geometry guard a few hundred lines above this function
       (see its own comment for the full explanation of the ~512-vert/~490-record cap on
       g_geom_arena) -- that guard only accounts for wall/floor geometry... */
    if ((int)(uint)DAT_0023b838 >= UW_ARENA_MAX_VERTS - 4 || (int)DAT_0023b83c >= UW_ARENA_MAX_RECORDS - 1) {
      return;
    }
    if (g_billboard_angle_override_deg >= 0) {
      /* A wall-mounted decal's anchor (DAT_0023b904/920) came out of emit_tile_features' generic
         per-slot floor-object table (DAT_0023bb99/9a[cVar8*4]) -- cVar8 is this object's position
         in a depth-*sorted* list of everything in the tile... */
      DAT_0023b904 = (DAT_0023b904 & ~0x1f) | 0x10;
      DAT_0023b920 = (DAT_0023b920 & ~0x1f) | 0x10;
      double _rad = (g_billboard_angle_override_deg + 90) * (3.14159265358979 / 180.0);
      int _mag = 16;
      int _sign = 1;
      if (UW_OPT_ISSET(g_opts.decal_push)) _mag = g_opts.decal_push;
      _sign = g_opts.decal_push_sign;
      DAT_0023b904 = DAT_0023b904 + (short)lround(_sign * _mag * sin(_rad));
      DAT_0023b920 = DAT_0023b920 + (short)lround(_sign * _mag * cos(_rad));
    }
    *DAT_00110fc0 = 0x7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b904;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b920;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b91c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = -8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    decode_tile_object_billboard_texture(uVar27,(uint)DAT_0023bc88 * (int)DAT_00086b30);
    /* DAT_000d9ed8/DAT_000d9930[angle] = sin/cos(angle degrees) (see build_trig_tables). Normally
       angle = DAT_000db44c, the CAMERA's yaw, which is what makes this quad extend along the
       camera's own right-vector -- i.e. always face the camera, a real billboard. */
    { int _angle_idx = DAT_000db44c;
      int _overridden = (g_billboard_angle_override_deg >= 0);
      if (_overridden) {
        _angle_idx = g_billboard_angle_override_deg;
        g_billboard_angle_override_deg = -1;
      }
      uVar30 = (&DAT_000d9ed8)[_angle_idx];
      uVar18 = ordfloat_negate((&DAT_000d9930)[_angle_idx]);
    }
    iVar32 = (int)DAT_00202508;
    uVar19 = ordfloat_int_to_float2(iVar32 * -6);
    uVar19 = ordfloat_mul(uVar19,0x3f000000);
    uVar20 = ordfloat_negate(uVar19);
    uVar16 = DAT_000da47c;
    iVar28 = DAT_0023b83c * 0x60;
    UW_REC_AT(iVar28)->tex[0] = (short)DAT_000da47c;
    iVar17 = (int)(short)DAT_0023b904;
    cVar2 = (char)((short)uVar16 >> 0xf);
    uVar21 = ordfloat_int_to_float2(iVar17);
    uVar22 = ordfloat_mul(uVar19,uVar30);
    uVar22 = ordfloat_add(uVar22,uVar21);
    uVar22 = ordfloat_add(uVar22,0);
    iVar17 = DAT_0023b838;
    iVar31 = DAT_0023b838 * 0xc;
    iVar23 = (int)(short)DAT_0023b920;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->x) = uVar22;
    uVar3 = (undefined1)((uint)uVar22 >> 8);
    uVar4 = (undefined1)((uint)uVar22 >> 0x10);
    uVar5 = (undefined1)((uint)uVar22 >> 0x18);
    uVar24 = ordfloat_int_to_float2(iVar23);
    uVar19 = ordfloat_mul(uVar19,uVar18);
    uVar19 = ordfloat_add(uVar19,uVar24);
    uVar19 = ordfloat_add(uVar19,0);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->z) = uVar19;
    uVar6 = (undefined1)((uint)uVar19 >> 8);
    iVar33 = (int)DAT_002022f8;
    uVar7 = (undefined1)((uint)uVar19 >> 0x10);
    iVar23 = (int)(short)DAT_0023b91c;
    uVar8 = (undefined1)((uint)uVar19 >> 0x18);
    uVar25 = ordfloat_int_to_float2(iVar33 * 6 + iVar23);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->y) = uVar25;
    UW_REC_AT(iVar28)->vert_idx[0] = iVar17;
    iVar34 = iVar17 + 1;
    UW_REC_AT(iVar28)->uv[0] = 0;
    UW_REC_AT(iVar28)->uv[1] = 0;
    iVar31 = iVar34 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->x) = uVar22;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->z) = uVar19;
    uVar19 = ordfloat_int_to_float2(iVar23);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->y) = uVar19;
    uVar3 = (undefined1)((uint)uVar19 >> 8);
    uVar4 = (undefined1)((uint)uVar19 >> 0x10);
    uVar5 = (undefined1)((uint)uVar19 >> 0x18);
    UW_REC_AT(iVar28)->vert_idx[1] = iVar34;
    iVar23 = iVar33 + -1;
    iVar34 = iVar17 + 2;
    UW_REC_AT(iVar28)->uv[2] = 0;
    UW_REC_AT(iVar28)->uv[3] = iVar23;
    uVar22 = ordfloat_mul(uVar20,uVar30);
    uVar21 = ordfloat_add(uVar22,uVar21);
    uVar21 = ordfloat_add(uVar21,0);
    iVar23 = iVar34 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->x) = uVar21;
    uVar6 = (undefined1)((uint)uVar21 >> 8);
    uVar7 = (undefined1)((uint)uVar21 >> 0x10);
    uVar8 = (undefined1)((uint)uVar21 >> 0x18);
    uVar18 = ordfloat_mul(uVar20,uVar18);
    uVar18 = ordfloat_add(uVar18,uVar24);
    uVar18 = ordfloat_add(uVar18,0);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->z) = uVar18;
    uVar9 = (undefined1)((uint)uVar18 >> 8);
    uVar10 = (undefined1)((uint)uVar18 >> 0x10);
    uVar11 = (undefined1)((uint)uVar18 >> 0x18);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->y) = uVar19;
    iVar31 = iVar32 + -1;
    iVar23 = iVar33 + -1;
    UW_REC_AT(iVar28)->vert_idx[2] = iVar34;
    UW_REC_AT(iVar28)->uv[4] = iVar31;
    UW_REC_AT(iVar28)->uv[5] = iVar23;
    iVar17 = iVar17 + 3;
    iVar23 = iVar17 * 0xc;
    puVar26 = UW_VERT_AT(g_geom_arena.model_verts, iVar23);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->x) = uVar21;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->z) = uVar18;
LAB_00061d34:
    UW_BITS(puVar26->y) = uVar25;
    UW_REC_AT(iVar28)->vert_idx[3] = iVar17;
    DAT_0023b838 = iVar17 + 1;
    UW_REC_AT(iVar28)->uv[6] = iVar31;
    uVar18 = DAT_002022fc;
    UW_REC_AT(iVar28)->uv[7] = 0;
    UW_REC_AT(iVar28)->vert_count = 4;
    UW_REC_AT(iVar28)->attr[1] = iVar32;
    UW_REC_AT(iVar28)->attr[2] = iVar33;
    UW_REC_AT(iVar28)->attr[0] = uVar18;
    DAT_0023b83c = DAT_0023b83c + 1;
    DAT_000a85d4 = DAT_0023b83c;
    DAT_000a85d0 = iVar17 + 1;
    return;
  }
  if (bVar13 == 1) {
    *DAT_00110fc0 = 0x7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b904;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b920;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b91c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = -8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar29 = *(byte *)((char *)tile + 0x15) & 0x3f;
    if (UW_OPT_ISSET(g_opts.force_critter_state)) uVar29 = (uint)g_opts.force_critter_state;
    /* Ghidra modelled the divmod's remainder (ARM r1) as `extraout_r1`, which was never assigned ->
       wild index into the 0x20-entry DAT_00086cc0 direction table (crash when an object first came
       into view down a long hallway). It is (that dividend) % 0x20. */
    {
      short _col_angle = g_current_view->view_facing;
      short _quad_term = *(short *)(&DAT_00086a18 + DAT_0023b4a0 * 2);
      int _dm = ((tile[1] >> 5 & 0x1c) -
                 ((int)((int)_col_angle +
                        (uint)*(ushort *)(&DAT_00086a18 + DAT_0023b4a0 * 2)) >> 0xb)) + 0x20;
      bVar13 = (&DAT_00086cc0)[((_dm % 0x20) + 0x20) % 0x20];
    }
    if ((ushort)uVar29 < 0x20) {
      /* REVERTED (checked against a fresh disassembly of this exact block, real addresses
         0x611ac-0x611cc): an earlier session added an `else { uVar29 = bVar13; }` here, theorizing
         the missing else was a decompiler-dropped branch. It isn't. */
      if ((ushort)uVar29 != 0xc) {
        if (2 < (bVar13 - 3 & 7)) {
          uVar29 = bVar13 + 0x20;
        }
      }
    }
    else {
      uVar29 = (uint)bVar13 + (uVar29 - 0x1c) * 8;
    }
    {
      short _frame_arg = (byte)tile[6] >> 4;
      if (UW_OPT_ISSET(g_opts.force_critter_frame)) _frame_arg = (short)g_opts.force_critter_frame;
      resolve_critter_sprite_tier(uVar27 & 0x3f,uVar29,_frame_arg,(uint)DAT_0023bc88 * (int)DAT_00086b30);
    }
    uVar30 = (&DAT_000d9ed8)[DAT_000db44c];
    uVar18 = ordfloat_negate((&DAT_000d9930)[DAT_000db44c]);
    iVar32 = (int)DAT_00202508;
    uVar19 = ordfloat_int_to_float2(iVar32 * -4);
    uVar19 = ordfloat_mul(uVar19,0x3f000000);
    uVar20 = ordfloat_negate(uVar19);
    uVar16 = DAT_000da47c;
    iVar28 = DAT_0023b83c * 0x60;
    iVar17 = (int)(short)DAT_0023b904;
    UW_REC_AT(iVar28)->tex[0] = (short)DAT_000da47c;
    cVar2 = (char)((short)uVar16 >> 0xf);
    uVar21 = ordfloat_int_to_float2(iVar17);
    uVar22 = ordfloat_mul(uVar19,uVar30);
    uVar22 = ordfloat_add(uVar22,uVar21);
    uVar22 = ordfloat_add(uVar22,0);
    iVar17 = DAT_0023b838;
    iVar31 = DAT_0023b838 * 0xc;
    iVar23 = (int)(short)DAT_0023b920;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->x) = uVar22;
    uVar3 = (undefined1)((uint)uVar22 >> 8);
    uVar4 = (undefined1)((uint)uVar22 >> 0x10);
    uVar5 = (undefined1)((uint)uVar22 >> 0x18);
    uVar24 = ordfloat_int_to_float2(iVar23);
    uVar19 = ordfloat_mul(uVar19,uVar18);
    uVar19 = ordfloat_add(uVar19,uVar24);
    uVar19 = ordfloat_add(uVar19,0);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->z) = uVar19;
    uVar6 = (undefined1)((uint)uVar19 >> 8);
    iVar33 = (int)DAT_002022f8;
    uVar7 = (undefined1)((uint)uVar19 >> 0x10);
    iVar23 = (int)(short)DAT_0023b91c;
    uVar8 = (undefined1)((uint)uVar19 >> 0x18);
    uVar25 = ordfloat_int_to_float2(iVar23 + iVar33 * 4);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->y) = uVar25;
    UW_REC_AT(iVar28)->vert_idx[0] = iVar17;
    iVar34 = iVar17 + 1;
    UW_REC_AT(iVar28)->uv[0] = 0;
    UW_REC_AT(iVar28)->uv[1] = 0;
    iVar31 = iVar34 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->x) = uVar22;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->z) = uVar19;
    uVar19 = ordfloat_int_to_float2(iVar23);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar31)->y) = uVar19;
    iVar23 = iVar33 + -1;
    uVar3 = (undefined1)((uint)uVar19 >> 8);
    uVar4 = (undefined1)((uint)uVar19 >> 0x10);
    uVar5 = (undefined1)((uint)uVar19 >> 0x18);
    iVar35 = iVar17 + 2;
    UW_REC_AT(iVar28)->vert_idx[1] = iVar34;
    UW_REC_AT(iVar28)->uv[2] = 0;
    UW_REC_AT(iVar28)->uv[3] = iVar23;
    uVar22 = ordfloat_mul(uVar20,uVar30);
    uVar21 = ordfloat_add(uVar22,uVar21);
    uVar21 = ordfloat_add(uVar21,0);
    iVar34 = iVar35 * 0xc;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->x) = uVar21;
    uVar6 = (undefined1)((uint)uVar21 >> 8);
    uVar7 = (undefined1)((uint)uVar21 >> 0x10);
    uVar8 = (undefined1)((uint)uVar21 >> 0x18);
    uVar18 = ordfloat_mul(uVar20,uVar18);
    uVar18 = ordfloat_add(uVar18,uVar24);
    uVar18 = ordfloat_add(uVar18,0);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->z) = uVar18;
    iVar31 = iVar32 + -1;
    iVar23 = iVar33 + -1;
    uVar9 = (undefined1)((uint)uVar18 >> 8);
    uVar10 = (undefined1)((uint)uVar18 >> 0x10);
    uVar11 = (undefined1)((uint)uVar18 >> 0x18);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar34)->y) = uVar19;
    UW_REC_AT(iVar28)->vert_idx[2] = iVar35;
    UW_REC_AT(iVar28)->uv[4] = iVar31;
    UW_REC_AT(iVar28)->uv[5] = iVar23;
    iVar17 = iVar17 + 3;
    iVar23 = iVar17 * 0xc;
    puVar26 = UW_VERT_AT(g_geom_arena.model_verts, iVar23);
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->x) = uVar21;
    UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, iVar23)->z) = uVar18;
    goto LAB_00061d34;
  }
  if (bVar13 == 2) {
    if ((uVar27 & 0x30) == 0) {
      /* Doors. emit_anim_object_frames is the real handler for this branch: it draws through
         emit_catalog_object, whose own tick_anim_record helper resolves a "catalog" id to the same
         29 real .E model buffers loaded at startup... */
      emit_anim_object_frames(uVar27 & 7, tile);
      return;
    }
    /* DAT_00086c80 (the real per-sign-variant -> billboard-catalog index table) has now been
       recovered from the real binary -- see its own declaration comment -- replacing the "fill
       every entry with 668" placeholder that used to live here. */
    iVar17 = (int)(((uVar27 & 0x3f) - 0x10) * 0x10000) >> 0x10;
    if ((short)*(ushort *)(&DAT_00086c80 + iVar17 * 2) < 0) {
      return;
    }
    if (0x1f < iVar17) {
      return;
    }
    /* Confirmed correct: calling emit_catalog_object directly with the real table value is right --
       matches the exact 4-argument call shape the two other real callers use... */
    /* frame_or_texid=-1, exactly as the real call site (FUN_00060aa0: `FUN_00061e60(uVar26 & 0xff,
       tile, -1, -1)`): emit_catalog_object's own catalog-2 branch resolves a_bridge's TMOBJ
       30/31 plank frame (or its flags>=2 floor texture) from the object's flags. */
    emit_catalog_object((uint)(unsigned char)*(ushort *)(&DAT_00086c80 + iVar17 * 2),
                        tile, (tile[1] >> 7 & 7) << 1, -1);
    return;
  }
  if (bVar13 != 3) {
    return;
  }
  if ((*tile & 0x30) == 0x30) {
    if (DAT_0023b830 == 0 && DAT_00086b2c == 0) {
      *DAT_00110fc0 = 2;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      uVar16 = get_catalog_sprite_width(8);
      *DAT_00110fc0 = uVar16;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = 0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      DAT_00189580 = 0;
    }
    /* Same heading fix as the generic DAT_00086c80 dispatch above (see its own comment) -- this
       call was ALSO passing heading=-1 (camera-relative billboard angle) unconditionally. */
    emit_catalog_object(0x14,tile,(tile[1] >> 7 & 7) << 1,(uVar27 & 0xf) + (uint)DAT_00202734);
    if (DAT_0023b830 != 0 || DAT_00086b2c != 0) {
      return;
    }
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar16 = get_catalog_sprite_width(8);
    *DAT_00110fc0 = uVar16;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = 1;
    return;
  }
  DAT_0023b818 = 0xe0;
  emit_diagonal_wall_texture_select(0,DAT_0023b4e0,4,(byte)tile[3] & 0x3f);
  *DAT_00110fc0 = 0xb2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b81c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  cVar2 = *(char *)(&DAT_0023add0 + ((byte)tile[3] & 0x3f));
  if ((cVar2 == '\x03') || (cVar2 == '\x04')) {
    DAT_0023b834 = 3;
  }
  else if ((cVar2 != '\b') && (cVar2 != '\v')) {
    bVar14 = false;
    goto LAB_00060f54;
  }
  bVar14 = true;
LAB_00060f54:
  if ((!bVar14) || (bVar14 = true, DAT_0023b830 != 0 || DAT_00086b2c != 0)) {
    bVar14 = false;
  }
  if (bVar14) {
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar16 = get_catalog_sprite_width(8);
    *DAT_00110fc0 = uVar16;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = 0;
  }
  /* Same heading fix as the generic DAT_00086c80 dispatch above (see its
     own comment). Class-3's other sub-branch (force field/special tmap
     obj). */
  emit_catalog_object(0x16,tile,(tile[1] >> 7 & 7) << 1,(byte)tile[3] & 0x3f);
  if (!bVar14) {
    return;
  }
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar16 = get_catalog_sprite_width(8);
  *DAT_00110fc0 = uVar16;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189580 = 1;
}

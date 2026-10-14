/* The 3D transform/rasterization pipeline: vertex math, view matrix construction, camera-space
   transform/projection, near-plane clipping, and the triangle rasterizer (edge setup, perspective-
   correct texture span drawing). */
#include "headers/3d.h"
#include "headers/tmap.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define DAT_000869cc (DAT_000869cc_str[0])
#define DAT_000869d4 (DAT_000869d4_str[0])
#define DAT_000869dc (DAT_000869dc_str[0])
#define DAT_000869e4 (DAT_000869e4_str[0])
 void *g_tile_texptr_emit[UW_MAX_VIS_TILES];
 void *g_tile_texptr_out[UW_MAX_VIS_TILES];
/* Ghidra only saw pointer-walking writes (build_shade_lut) and an indexed read (sVar7 clamped to
   0x9f, i.e. 160 entries -- see its use below), so it declared this as a lone scalar instead of the
   real 160-entry distance/lighting falloff table. */
 undefined4 DAT_000b5638_backing[160];
/* Initial byte at 0x842b0 in the original Pocket PC executable. */
char DAT_000842b0 = 8;
/* HACK: palette indices LIGHT.DAT (the DAT_0024fa2c shade table, 16 rows x 256) leaves unchanged at
   every lit shade -- in DOS terms the fullbright colours (the 0x10-0x17 fire/lava ramp, the
   0x00-0x0f effect colours, 0xf0-0xff). Row 0 is skipped: update_screen_flicker_effect zeroes its
   first entries to flicker the view. Rebuilt whenever the table is (re)loaded. */
unsigned char g_fullbright_palette_mask[256];

void update_fullbright_palette_mask()
{
  int index, row;

  g_shade_rows_dirty = 1;
  for (index = 0; index < 256; index++) {
    g_fullbright_palette_mask[index] = DAT_0024fa2c != 0;
    for (row = 1; row < 16 && g_fullbright_palette_mask[index]; row++)
      if ((unsigned char)DAT_0024fa2c[row * 256 + index] != index) g_fullbright_palette_mask[index] = 0;
  }
}
char DAT_0023b830;
undefined2 DAT_000da47c;
/* build_trig_tables builds these as 361-entry (0..360 degrees) sin / cos tables (float bit
   patterns); every reader indexes `(&DAT_000d99xx)[angle]`. Were lone `undefined4` scalars, so
   build_trig_tables's `[0..360]` writes smashed ~1.4 KB of adjacent globals. */
/* Sizing-audit pass: build_trig_tables's own loop is `iVar2<0x169`
   (361, degrees 0-360) -- HARD exact for both sin/cos tables. Down
   from 512 each. */
 undefined4 DAT_000d9930_arr[361];
 undefined4 DAT_000d9ed8_arr[361];
undefined4 DAT_000db438;
undefined4 DAT_000db43c;
undefined4 DAT_000db440;
int DAT_000db448;
int DAT_000db44c;
static int DAT_000db450;
/* DAT_000c8ac0-family: 12 separately-declared globals that are really the 12 non-translation-column
   elements of one 4x4 (16 x undefined4, 64-byte) view/camera matrix -- build_view_matrix writes the
   whole matrix in one shot via `multiply_matrix4x4(...,...,&DAT_000c8ac0)`... */
undefined4 DAT_000c8ac0_mtx[16];
#define DAT_000c8ac0 DAT_000c8ac0_mtx[0]
#define DAT_000c8ac4 DAT_000c8ac0_mtx[1]
#define DAT_000c8ac8 DAT_000c8ac0_mtx[2]
#define DAT_000c8ad0 DAT_000c8ac0_mtx[4]
#define DAT_000c8ad4 DAT_000c8ac0_mtx[5]
#define DAT_000c8ad8 DAT_000c8ac0_mtx[6]
#define DAT_000c8ae0 DAT_000c8ac0_mtx[8]
#define DAT_000c8ae4 DAT_000c8ac0_mtx[9]
#define DAT_000c8ae8 DAT_000c8ac0_mtx[10]
#define DAT_000c8af0 DAT_000c8ac0_mtx[12]
#define DAT_000c8af4 DAT_000c8ac0_mtx[13]
#define DAT_000c8af8 DAT_000c8ac0_mtx[14]
int DAT_000c8c98;
/* Recovered from UU.exe .data at 0x84608: the near-clip distance, float 5.0 (bit pattern
   0x40a00000). render_visible_tile_list / near_clip_visible_tiles pass it straight to the softfloat
   compare/subtract ordinals as a float bit pattern. */
static undefined4 DAT_00084608 = 0x40a00000u;
/* DAT_000bc038-family: ~40 separately-declared 1-byte globals that are really one
   0x88(136)-byte-stride per-tile record array... */
static undefined DAT_000bc038_backing[0x88 * UW_MAX_VIS_TILES] = {0};
#define DAT_000bc038 DAT_000bc038_backing[0]
#define DAT_000bc039 DAT_000bc038_backing[1]
#define DAT_000bc03a DAT_000bc038_backing[2]
#define DAT_000bc03b DAT_000bc038_backing[3]
#define DAT_000bc044 DAT_000bc038_backing[0xc]
#define DAT_000bc07c DAT_000bc038_backing[0x44]
#define DAT_000bc07d DAT_000bc038_backing[0x45]
#define DAT_000bc07e DAT_000bc038_backing[0x46]
#define DAT_000bc07f DAT_000bc038_backing[0x47]
#define DAT_000bc0a0 DAT_000bc038_backing[0x68]
#define DAT_000bc0a1 DAT_000bc038_backing[0x69]
#define DAT_000bc0a2 DAT_000bc038_backing[0x6a]
#define DAT_000bc0a3 DAT_000bc038_backing[0x6b]
#define DAT_000bc0a4 DAT_000bc038_backing[0x6c]
#define DAT_000bc0a5 DAT_000bc038_backing[0x6d]
#define DAT_000bc0a6 DAT_000bc038_backing[0x6e]
#define DAT_000bc0a7 DAT_000bc038_backing[0x6f]
#define DAT_000bc0a8 DAT_000bc038_backing[0x70]
#define DAT_000bc0a9 DAT_000bc038_backing[0x71]
#define DAT_000bc0aa DAT_000bc038_backing[0x72]
#define DAT_000bc0ab DAT_000bc038_backing[0x73]
#define DAT_000bc0ac DAT_000bc038_backing[0x74]
#define DAT_000bc0ad DAT_000bc038_backing[0x75]
#define DAT_000bc0ae DAT_000bc038_backing[0x76]
#define DAT_000bc0af DAT_000bc038_backing[0x77]
#define DAT_000bc0b0 DAT_000bc038_backing[0x78]
#define DAT_000bc0b1 DAT_000bc038_backing[0x79]
#define DAT_000bc0b2 DAT_000bc038_backing[0x7a]
#define DAT_000bc0b3 DAT_000bc038_backing[0x7b]
#define DAT_000bc0b4 DAT_000bc038_backing[0x7c]
#define DAT_000bc0b5 DAT_000bc038_backing[0x7d]
#define DAT_000bc0b6 DAT_000bc038_backing[0x7e]
#define DAT_000bc0b7 DAT_000bc038_backing[0x7f]
#define DAT_000bc0b8 DAT_000bc038_backing[0x80]
#define DAT_000bc0b9 DAT_000bc038_backing[0x81]
#define DAT_000bc0ba DAT_000bc038_backing[0x82]
#define DAT_000bc0bb DAT_000bc038_backing[0x83]
#define DAT_000bc0bc DAT_000bc038_backing[0x84]
#define DAT_000bc0bd DAT_000bc038_backing[0x85]
#define DAT_000bc0be DAT_000bc038_backing[0x86]
#define DAT_000bc0bf DAT_000bc038_backing[0x87]
/* DAT_000c4838-family: same story, but holding real 8-byte pointers (one per visible-tile record,
   written by near_clip_visible_tiles and read back by render_visible_tile_list) rather than bytes
   -- was a lone `undefined4` (4 bytes)... */
 void *DAT_000c4838_backing[4096];
/* Recovered from UU.exe .data: the four texture-file basenames load_dungeon_texture_arenas appends
   to "\DATA\" and loads into the arena. Were silently-zero 32KB arrays, so every path was just the
   bare "\DATA\" directory -> load_texture_arena failed -> DAT_002049e0 stayed all zero. */
static const char DAT_000869cc_str[] = "f16.tr";
static const char DAT_000869d4_str[] = "w16.tr";
static const char DAT_000869dc_str[] = "f32.tr";
static const char DAT_000869e4_str[] = "w64.tr";
static undefined2 DAT_0023aed8;
static undefined2 DAT_00250650;
static undefined2 DAT_0023b49c;
static ushort DAT_0023b7f8;




// was FUN_000116a4 -- set the active viewport/clip rectangle (DAT_000a85c4/c8 top-left, DAT_000842a4/a8 bottom-right)
void set_viewport_clip_rect(short left, short top, short right, short bottom)
{
  DAT_000a85c4 = left;
  DAT_000a85c8 = top;
  DAT_000842a4 = right;
  DAT_000842a8 = bottom;
}




// was FUN_000137c0 -- elementwise 3-float vector subtract, param_3 = param_2 - param_1.
// was FUN_00020a74
void vec3_sub(void *a_ptr, void *b_ptr, byte *out)
{
  uint *a = (uint *)a_ptr;
  uint *b = (uint *)b_ptr;
  undefined4 uVar1;
  
  uVar1 = ordfloat_sub(*b,*a);
  *out = (char)uVar1;
  out[1] = (char)((uint)uVar1 >> 8);
  out[2] = (char)((uint)uVar1 >> 0x10);
  out[3] = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_sub(b[1],a[1]);
  out[4] = (char)uVar1;
  out[5] = (char)((uint)uVar1 >> 8);
  out[6] = (char)((uint)uVar1 >> 0x10);
  out[7] = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_sub(b[2],a[2]);
  out[8] = (char)uVar1;
  out[9] = (char)((uint)uVar1 >> 8);
  out[10] = (char)((uint)uVar1 >> 0x10);
  out[0xb] = (char)((uint)uVar1 >> 0x18);
}



// was FUN_00013904 -- standard 3-float cross product, param_3 = param_1 x param_2 (confirmed
// component-by-component, including the Y term's sign flip the textbook formula requires).
void vec3_cross(void *a_ptr, void *b_ptr, byte *out)
{
  uint *a = (uint *)a_ptr;
  uint *b = (uint *)b_ptr;
  undefined4 uVar1;
  undefined4 uVar2;
  
  uVar1 = ordfloat_mul(a[1],b[2]);
  uVar2 = ordfloat_mul(a[2],b[1]);
  uVar1 = ordfloat_sub(uVar1,uVar2);
  *out = (char)uVar1;
  out[1] = (char)((uint)uVar1 >> 8);
  out[2] = (char)((uint)uVar1 >> 0x10);
  out[3] = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_mul(b[2],*a);
  uVar2 = ordfloat_mul(a[2],*b);
  uVar1 = ordfloat_negate(ordfloat_sub(uVar1,uVar2));
  out[4] = (char)uVar1;
  out[5] = (char)((uint)uVar1 >> 8);
  out[6] = (char)((uint)uVar1 >> 0x10);
  out[7] = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_mul(b[1],*a);
  uVar2 = ordfloat_mul(a[1],*b);
  uVar1 = ordfloat_sub(uVar1,uVar2);
  out[8] = (char)uVar1;
  out[9] = (char)((uint)uVar1 >> 8);
  out[10] = (char)((uint)uVar1 >> 0x10);
  out[0xb] = (char)((uint)uVar1 >> 0x18);
}




// was FUN_00014350 -- textured-triangle driver: viewport-culls, sorts the 3 verts by Y, builds 3
// edges via raster_edge_setup, walks scanlines stepping edges (raster_edge_step) and emitting spans
// (raster_textured_span).
/* was undefined4 -- the framebuffer base (g_uw_framebuffer) was undefined4 -- the tile's texture
   pixel data pointer */
void raster_triangle(int stride, void *buffer, uint *vertices, int surface, int width, int size, char *texture, int *clip)
{
  undefined4 uVar1;
  int iVar2;
  undefined1 *puVar3;
  undefined4 uVar4;
  undefined1 *puVar5;
  undefined4 uVar6;
  uint uVar7;
  undefined4 uVar8;
  uint uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  /* auStack_c4 / auStack_7c were 12-byte locals but raster_edge_setup (called on each below) writes
     its edge record out to size[10] == byte 0x2b, overflowing them; Ghidra named the tail of
     each overflow `local_b8` / `local_70` (the size[3] scanline-count field, byte 0xc). */
  undefined1 auStack_154 [72];
  undefined1 auStack_10c [72];
  undefined1 auStack_c4 [72];
  undefined1 auStack_7c [72];
#define local_b8 (*(int *)(auStack_c4 + 0xc))
#define local_70 (*(int *)(auStack_7c + 0xc))

  uVar8 = vertices[6];
  uVar10 = vertices[0xb];
  uVar6 = vertices[1];
  uVar1 = ordfloat_int_to_float2(*clip);
  uVar4 = *vertices;
  iVar2 = ordfloat_lt(uVar4,uVar1);
  if (((iVar2 != 0) && (iVar2 = ordfloat_lt(vertices[5],uVar1), iVar2 != 0)) &&
     (iVar2 = ordfloat_ge(vertices[10],uVar1), iVar2 == 0)) {
    return;
  }
  uVar1 = ordfloat_int_to_float2(clip[2]);
  iVar2 = ordfloat_gt(uVar4,uVar1);
  if (((iVar2 != 0) && (iVar2 = ordfloat_gt(vertices[5],uVar1), iVar2 != 0)) &&
     (iVar2 = ordfloat_le(vertices[10],uVar1), iVar2 == 0)) {
    return;
  }
  uVar1 = ordfloat_int_to_float2(clip[1]);
  iVar2 = ordfloat_lt(uVar6,uVar1);
  if (((iVar2 != 0) && (iVar2 = ordfloat_lt(uVar8,uVar1), iVar2 != 0)) &&
     (iVar2 = ordfloat_ge(uVar10,uVar1), iVar2 == 0)) {
    return;
  }
  uVar1 = ordfloat_int_to_float2(clip[3]);
  iVar2 = ordfloat_gt(uVar6,uVar1);
  if (((iVar2 != 0) && (iVar2 = ordfloat_gt(uVar8,uVar1), iVar2 != 0)) &&
     (iVar2 = ordfloat_le(uVar10,uVar1), iVar2 == 0)) {
    return;
  }
  int _uw_span_calls = 0;
  iVar2 = ordfloat_lt(uVar6,uVar8);
  if (iVar2 == 0) {
    iVar2 = ordfloat_lt(uVar10,uVar8);
    if (iVar2 != 0) {
      uVar11 = 2;
      uVar1 = 1;
      uVar4 = 0;
      uVar7 = 1;
      uVar9 = 0;
      goto LAB_00014684;
    }
    uVar11 = 1;
    iVar2 = ordfloat_lt(uVar6,uVar10);
    if (iVar2 == 0) {
      uVar4 = 0;
      uVar9 = 3;
      goto LAB_0001467c;
    }
    uVar1 = 0;
    uVar7 = 3;
  }
  else {
    iVar2 = ordfloat_lt(uVar10,uVar6);
    if (iVar2 != 0) {
      uVar11 = 2;
      uVar1 = 0;
      uVar4 = 1;
      uVar7 = 0;
      uVar9 = 1;
      goto LAB_00014684;
    }
    uVar11 = 0;
    iVar2 = ordfloat_lt(uVar8,uVar10);
    if (iVar2 == 0) {
      uVar4 = 1;
      uVar9 = 1;
LAB_0001467c:
      uVar1 = 2;
      uVar7 = 2;
      goto LAB_00014684;
    }
    uVar1 = 1;
    uVar7 = 1;
  }
  uVar4 = 2;
  uVar9 = 2;
LAB_00014684:
  raster_triangle_perspective_setup(vertices,auStack_10c);
  raster_edge_setup(auStack_10c,(char *)vertices,uVar11,uVar4,clip[1],auStack_154);
  raster_edge_setup(auStack_10c,(char *)vertices,uVar11,uVar1,clip[1],auStack_c4);
  raster_edge_setup(auStack_10c,(char *)vertices,uVar1,uVar4,clip[1],auStack_7c);
  if (uVar9 < uVar7) {
    puVar3 = auStack_154;
    puVar5 = auStack_c4;
  }
  else {
    puVar3 = auStack_c4;
    puVar5 = auStack_154;
  }
  iVar2 = local_b8;
  while( true ) {
    if (iVar2 == 0) {
      if (uVar9 < uVar7) {
        puVar3 = auStack_154;
        puVar5 = auStack_7c;
      }
      else {
        puVar3 = auStack_7c;
        puVar5 = auStack_154;
      }
      /* Second-half (mid vertex -> bottom vertex) scanline walk. */
      iVar2 = local_70;
      while ((iVar2 != 0 && (*(int *)(puVar3 + 8) < clip[3]))) {
        if ((*(int *)(puVar3 + 0x28) >> 0xe < clip[2]) &&
           (*clip < *(int *)(puVar5 + 0x28) >> 0xe)) {
          _uw_span_calls++;
          raster_textured_span(stride,buffer,auStack_10c,puVar3,puVar5,width,size,texture,clip,
                       surface);
        }
        raster_edge_step(auStack_7c);
        raster_edge_step(auStack_154);
        iVar2 = iVar2 + -1;
      }
      return;
    }
    iVar2 = iVar2 + -1;
    if (clip[3] <= *(int *)(puVar3 + 8)) break;
    if ((*(int *)(puVar3 + 0x28) >> 0xe < clip[2]) && (*clip < *(int *)(puVar5 + 0x28) >> 0xe)
       ) {
      _uw_span_calls++;
      raster_textured_span(stride,buffer,auStack_10c,puVar3,puVar5,width,size,texture,clip,surface
                  );
    }
    raster_edge_step(auStack_c4);
    raster_edge_step(auStack_154);
  }
}
#undef local_b8
#undef local_70




// was FUN_00014868 -- advance one scanline down an edge record
/* was int -- edge-walk struct pointer */
int raster_edge_step(char *edge)
{
  int iVar1;

  *(int *)(edge + 8) = *(int *)(edge + 8) + 1;
  iVar1 = *(int *)(edge + 0xc) + -1;
  *(int *)(edge + 0xc) = iVar1;
  *(int *)(edge + 0x28) = *(int *)(edge + 0x2c) + *(int *)(edge + 0x28);
  *(int *)(edge + 0x38) = *(int *)(edge + 0x3c) + *(int *)(edge + 0x38);
  *(int *)(edge + 0x40) = *(int *)(edge + 0x44) + *(int *)(edge + 0x40);
  *(int *)(edge + 0x30) = *(int *)(edge + 0x34) + *(int *)(edge + 0x30);
  return iVar1;
}



// was FUN_000148c8 -- per-triangle perspective setup: 1/w, u/w, v/w per
// vertex plus the screen-space interpolation gradients, into the
// edge-coefficient array raster_edge_setup reads
void raster_triangle_perspective_setup(uint *triangle, void *coefficients_ptr)
{
  uint *coefficients = (uint *)coefficients_ptr;
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  int iVar8;
  undefined4 uVar9;
  
  uVar5 = triangle[0xb];
  uVar4 = triangle[10];
  uVar1 = ordfloat_sub(triangle[1],uVar5);
  uVar2 = ordfloat_sub(triangle[5],uVar4);
  uVar1 = ordfloat_mul(uVar1,uVar2);
  uVar2 = ordfloat_sub(triangle[6],uVar5);
  uVar4 = ordfloat_sub(*triangle,uVar4);
  uVar2 = ordfloat_mul(uVar2,uVar4);
  uVar1 = ordfloat_sub(uVar1,uVar2);
  uVar1 = ordfloat_div(0x3f800000,uVar1);
  uVar2 = ordfloat_negate(uVar1);
  puVar6 = coefficients + 6;
  iVar8 = 3;
  puVar7 = triangle;
  do {
    uVar4 = ordfloat_div(0x3f800000,puVar7[2]);
    puVar6[-6] = uVar4;
    uVar5 = ordfloat_mul(puVar7[3],uVar4);
    puVar6[-3] = uVar5;
    uVar4 = ordfloat_mul(puVar7[4],uVar4);
    iVar8 = iVar8 + -1;
    *puVar6 = uVar4;
    puVar6 = puVar6 + 1;
    puVar7 = puVar7 + 5;
  } while (iVar8 != 0);
  uVar5 = coefficients[2];
  uVar4 = ordfloat_sub(coefficients[1],uVar5);
  uVar9 = triangle[0xb];
  uVar5 = ordfloat_sub(*coefficients,uVar5);
  uVar3 = ordfloat_sub(triangle[1],uVar9);
  uVar3 = ordfloat_mul(uVar3,uVar4);
  uVar9 = ordfloat_sub(triangle[6],uVar9);
  uVar9 = ordfloat_mul(uVar9,uVar5);
  uVar3 = ordfloat_sub(uVar3,uVar9);
  uVar3 = ordfloat_mul(uVar3,uVar1);
  coefficients[9] = uVar3;
  uVar9 = triangle[10];
  uVar3 = ordfloat_sub(*triangle,uVar9);
  uVar4 = ordfloat_mul(uVar3,uVar4);
  uVar3 = ordfloat_sub(triangle[5],uVar9);
  uVar5 = ordfloat_mul(uVar3,uVar5);
  uVar4 = ordfloat_sub(uVar4,uVar5);
  uVar4 = ordfloat_mul(uVar4,uVar2);
  uVar5 = coefficients[5];
  coefficients[10] = uVar4;
  uVar4 = ordfloat_sub(coefficients[4],uVar5);
  uVar9 = triangle[0xb];
  uVar5 = ordfloat_sub(coefficients[3],uVar5);
  uVar3 = ordfloat_sub(triangle[1],uVar9);
  uVar3 = ordfloat_mul(uVar3,uVar4);
  uVar9 = ordfloat_sub(triangle[6],uVar9);
  uVar9 = ordfloat_mul(uVar9,uVar5);
  uVar3 = ordfloat_sub(uVar3,uVar9);
  uVar3 = ordfloat_mul(uVar3,uVar1);
  coefficients[0xb] = uVar3;
  uVar9 = triangle[10];
  uVar3 = ordfloat_sub(*triangle,uVar9);
  uVar4 = ordfloat_mul(uVar3,uVar4);
  uVar3 = ordfloat_sub(triangle[5],uVar9);
  uVar5 = ordfloat_mul(uVar3,uVar5);
  uVar4 = ordfloat_sub(uVar4,uVar5);
  uVar4 = ordfloat_mul(uVar4,uVar2);
  uVar5 = coefficients[8];
  coefficients[0xc] = uVar4;
  uVar4 = ordfloat_sub(coefficients[7],uVar5);
  uVar9 = triangle[0xb];
  uVar5 = ordfloat_sub(coefficients[6],uVar5);
  uVar3 = ordfloat_sub(triangle[1],uVar9);
  uVar3 = ordfloat_mul(uVar3,uVar4);
  uVar9 = ordfloat_sub(triangle[6],uVar9);
  uVar9 = ordfloat_mul(uVar9,uVar5);
  uVar3 = ordfloat_sub(uVar3,uVar9);
  uVar1 = ordfloat_mul(uVar3,uVar1);
  coefficients[0xd] = uVar1;
  uVar3 = triangle[10];
  uVar1 = ordfloat_sub(*triangle,uVar3);
  uVar1 = ordfloat_mul(uVar1,uVar4);
  uVar4 = ordfloat_sub(triangle[5],uVar3);
  uVar4 = ordfloat_mul(uVar4,uVar5);
  uVar1 = ordfloat_sub(uVar1,uVar4);
  uVar1 = ordfloat_mul(uVar1,uVar2);
  coefficients[0xe] = uVar1;
  uVar1 = ordfloat_uint_to_float(ordfloat_mul(coefficients[9],0x45800000));
  coefficients[0xf] = uVar1;
  uVar1 = ordfloat_uint_to_float(ordfloat_mul(coefficients[0xb],0x45800000));
  coefficients[0x10] = uVar1;
  uVar1 = ordfloat_uint_to_float(ordfloat_mul(coefficients[0xd],0x45800000));
  coefficients[0x11] = uVar1;
}



// was FUN_00014ef4 -- per-edge setup: given two vertex indices, the
// starting value and per-scanline step for x, u/w, v/w and 1/w
/* was int -- edge-coeff array pointer was int -- vertex array pointer (stride 0x14) */
void raster_edge_setup(char *coefficients, char *vertices, int vertex_a, int vertex_b, int row_limit, void *edge_ptr)
{
  uint *edge = (uint *)edge_ptr;
  int iVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  undefined4 uVar12;
  int local_34;
  
  puVar11 = (undefined4 *)(vertex_a * 0x14 + vertices);
  uVar2 = ordfloat_uint_to_float(ordfloat_mul(puVar11[1],0x45800000));
  if ((uVar2 & 0xfff) != 0) {
    uVar2 = (uVar2 - (uVar2 & 0xfff)) + 0x1000;
  }
  iVar1 = (int)uVar2 >> 0xc;
  edge[2] = iVar1;
  local_34 = 0;
  if (iVar1 < row_limit) {
    local_34 = row_limit - iVar1;
  }
  puVar10 = (undefined4 *)(vertex_b * 0x14 + vertices);
  uVar2 = ordfloat_uint_to_float(ordfloat_mul(puVar10[1],0x45800000));
  if ((uVar2 & 0xfff) != 0) {
    uVar2 = (uVar2 - (uVar2 & 0xfff)) + 0x1000;
  }
  iVar7 = ((int)uVar2 >> 0xc) - iVar1;
  iVar3 = iVar7 - local_34;
  if (iVar3 < 0) {
    iVar7 = 0;
  }
  edge[3] = iVar3;
  if (iVar3 < 0) {
    edge[3] = iVar7;
  }
  uVar8 = puVar11[1];
  uVar4 = ordfloat_int_to_float2(iVar1);
  uVar4 = ordfloat_sub(uVar4,uVar8);
  uVar8 = ordfloat_sub(puVar10[1],uVar8);
  uVar9 = *puVar11;
  uVar5 = ordfloat_sub(*puVar10,uVar9);
  uVar6 = ordfloat_int_to_float2(local_34);
  uVar4 = ordfloat_add(uVar6,uVar4);
  uVar8 = ordfloat_div(0x3f800000,uVar8);
  uVar6 = ordfloat_mul(uVar4,uVar5);
  uVar6 = ordfloat_mul(uVar6,uVar8);
  uVar6 = ordfloat_add(uVar6,uVar9);
  *edge = uVar6;
  uVar8 = ordfloat_mul(uVar8,uVar5);
  edge[1] = uVar8;
  uVar12 = *edge;
  uVar5 = ordfloat_sub(uVar12,*puVar11);
  edge[2] = iVar1 + local_34;
  uVar6 = ordfloat_mul(*(undefined4 *)(coefficients + 0x28),uVar4);
  uVar9 = ordfloat_mul(*(undefined4 *)(coefficients + 0x24),uVar5);
  uVar6 = ordfloat_add(uVar6,uVar9);
  puVar11 = (undefined4 *)(coefficients + vertex_a * 4);
  uVar6 = ordfloat_add(uVar6,*puVar11);
  edge[4] = uVar6;
  uVar6 = ordfloat_mul(*(undefined4 *)(coefficients + 0x24),uVar8);
  uVar6 = ordfloat_add(uVar6,*(undefined4 *)(coefficients + 0x28));
  edge[5] = uVar6;
  uVar6 = ordfloat_mul(*(undefined4 *)(coefficients + 0x30),uVar4);
  uVar9 = ordfloat_mul(*(undefined4 *)(coefficients + 0x2c),uVar5);
  uVar6 = ordfloat_add(uVar6,uVar9);
  uVar6 = ordfloat_add(uVar6,puVar11[3]);
  edge[6] = uVar6;
  uVar6 = ordfloat_mul(*(undefined4 *)(coefficients + 0x2c),uVar8);
  uVar6 = ordfloat_add(uVar6,*(undefined4 *)(coefficients + 0x30));
  edge[7] = uVar6;
  uVar4 = ordfloat_mul(*(undefined4 *)(coefficients + 0x38),uVar4);
  uVar5 = ordfloat_mul(*(undefined4 *)(coefficients + 0x34),uVar5);
  uVar4 = ordfloat_add(uVar4,uVar5);
  uVar4 = ordfloat_add(uVar4,puVar11[6]);
  edge[8] = uVar4;
  uVar4 = ordfloat_mul(*(undefined4 *)(coefficients + 0x34),uVar8);
  uVar4 = ordfloat_add(uVar4,*(undefined4 *)(coefficients + 0x38));
  edge[9] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(uVar12,0x46800000));
  edge[10] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(edge[4],0x46800000));
  edge[0xc] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(edge[6],0x46800000));
  edge[0xe] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(edge[8],0x46800000));
  edge[0x10] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(uVar8,0x46800000));
  edge[0xb] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(edge[5],0x46800000));
  edge[0xd] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(edge[7],0x46800000));
  edge[0xf] = uVar4;
  uVar4 = ordfloat_uint_to_float(ordfloat_mul(edge[9],0x46800000));
  edge[0x11] = uVar4;
}



// was FUN_0001548c -- the textured span rasterizer: for one scanline span between two edges,
// perspective-divides per pixel, samples the tile texture...
/* framebuffer base edge struct edge struct edge struct texture pixel data */
void raster_textured_span(int row, char *framebuffer, char *gradients, char *left_edge, char *right_edge, int texture_stride, int texture_size, char *texture_pixels, int *depth_limit, byte shade)
{
  byte bVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  short sVar7;
  uint uVar8;
  int iVar9;
  ushort *puVar10;
  int iVar11;
  /* Ghidra merged two different variables into one `char *iVar12`: the DAT_0023cca0-based
     stencil-buffer walker (used up to the puVar13 init) and, inside the span loop, a plain signed
     texel index. */
  intptr_t iVar12;
  undefined1 *puVar13;
  int iVar14;
  int local_38;
  int local_34;
  /* HACK: optional DOS-style surface shading; unset/unknown modes retain
     the original ARM RGB falloff below. Resolve once per span, not texel. */
  const char *light_mode = g_opts.light_mode;
  bool dos_light_mode = light_mode && strcasecmp(light_mode, "dos") == 0;
  /* HACK: ordered dithering defaults on in both lighting modes (--dither=0 disables it). */
  bool dither_enabled = g_opts.dither;
  /* HACK: skip the ARM distance falloff for texels whose palette index LIGHT.DAT treats as
     fullbright (lava, fire, magic colours), like the DOS shade table does. On by default
     (--fullbright=0 disables it). */
  bool fullbright_enabled = g_opts.fullbright;
  char *local_4; /* fb row pointer */

  iVar12 = (intptr_t)DAT_0023cca0;
  uVar2 = *(uint *)(left_edge + 0x28);
  uVar8 = uVar2 & 0x3fff;
  if (uVar8 != 0) {
    uVar2 = (uVar2 - uVar8) + 0x4000;
  }
  iVar6 = (int)uVar2 >> 0xe;
  iVar3 = 0x4000 - uVar8;
  uVar2 = *(uint *)(right_edge + 0x28);
  if (uVar8 == 0) {
    iVar3 = 0;
  }
  uVar8 = uVar2 & 0x3fff;
  iVar3 = iVar3 >> 2;
  if (uVar8 != 0) {
    uVar2 = uVar2 - uVar8;
  }
  if (uVar8 != 0) {
    uVar2 = uVar2 + 0x4000;
  }
  iVar11 = ((int)uVar2 >> 0xe) - iVar6;
  local_38 = (*(int *)(gradients + 0x3c) * iVar3 >> 0xc) + (*(int *)(left_edge + 0x30) >> 2);
  iVar9 = 0;
  iVar14 = (*(int *)(gradients + 0x40) * iVar3 >> 0xc) + (*(int *)(left_edge + 0x38) >> 2);
  local_34 = (*(int *)(gradients + 0x44) * iVar3 >> 0xc) + (*(int *)(left_edge + 0x40) >> 2);
  if (iVar6 < *depth_limit) {
    iVar9 = *depth_limit - iVar6;
  }
  if (depth_limit[2] < iVar11 + iVar6) {
    iVar11 = depth_limit[2] - iVar6;
  }
  local_4 = framebuffer;
  if (iVar9 != 0) {
    uVar4 = ordfloat_int_to_float2(iVar9);
    uVar5 = ordfloat_mul(*(undefined4 *)(gradients + 0x24),uVar4);
    iVar3 = ordfloat_uint_to_float(ordfloat_mul(uVar5,0xc5800000));
    local_38 = local_38 - iVar3;
    uVar5 = ordfloat_mul(*(undefined4 *)(gradients + 0x2c),uVar4);
    iVar3 = ordfloat_uint_to_float(ordfloat_mul(uVar5,0xc5800000));
    iVar14 = iVar14 - iVar3;
    uVar4 = ordfloat_mul(*(undefined4 *)(gradients + 0x34),uVar4);
    iVar3 = ordfloat_uint_to_float(ordfloat_mul(uVar4,0xc5800000));
    iVar12 = iVar12 + iVar9;
    iVar11 = iVar11 - iVar9;
    local_34 = local_34 - iVar3;
    local_4 = framebuffer + iVar9 * 2;
  }
  /* HACK: restore radial eye-to-surface lighting in both modes instead of
     shading whole planes by camera depth. render_visible_tile_list projects
     x = 140 + 100*eye_x/eye_z, y = 80 - 90*eye_y/eye_z (the fullscreen view: see below). Inverting that ray
     gives distance = depth * sqrt(1 + ray_x^2 + ray_y^2). Camera rotations
     preserve this distance. Include the left clip offset and advance x even
     for transparent pixels; texture perspective interpolation stays intact. */
  int light_x = iVar6 + iVar9;
  /* HACK: not original behaviour -- the fullscreen view projects about a different centre and scale
     (see UW_FULLSCREEN_PROJ_* in 3d.h), so the ray must be inverted with the same values. */
  const double proj_cx = g_view_fullscreen ? UW_FULLSCREEN_PROJ_CX : UW_VIEW_PROJ_CX;
  const double proj_cy = g_view_fullscreen ? UW_FULLSCREEN_PROJ_CY : UW_VIEW_PROJ_CY;
  const double proj_scale = g_view_fullscreen ? UW_FULLSCREEN_PROJ_SCALE : UW_VIEW_PROJ_SCALE;
  double light_y = (*(int *)(left_edge + 8) - proj_cy) / (proj_scale * 0.9);
  if (0 < iVar11) {
    iVar6 = *(int *)(left_edge + 8) * row + iVar6;
    puVar13 = (undefined1 *)(iVar6 + iVar12);
    puVar10 = (ushort *)(local_4 + iVar6 * 2);
    do {
      iVar6 = ordint_divmod(local_38,0x1000000).quot;
      // HACK: not original behaviour -- exact texel division replaces the ARM integer-truncated path.
      /* HACK: the original truncates the depth quotient iVar6 = 2^24/(1/w) to an integer and then
         multiplies the (v/w)>>6 / (u/w)>>6 terms by it. Close to a wall w is small, so iVar6 is only
         a handful of units and the texel coordinate steps in coarse, uneven jumps (a repeating
         sawtooth along lines that should be straight). Both products are mathematically (v/w)/(1/w),
         so divide at full precision with floor semantics instead; iVar6 stays for lighting. */
      long long tex_u, tex_v;
      if (local_38 > 0) {
        long long inv = local_38;
        long long nv = local_34, nu = iVar14;
        tex_v = nv >= 0 ? nv / inv : -((-nv + inv - 1) / inv);
        tex_u = nu >= 0 ? nu / inv : -((-nu + inv - 1) / inv);
      } else {
        tex_v = (local_34 >> 6) * iVar6 >> 0x12;
        tex_u = (iVar14 >> 6) * iVar6 >> 0x12;
      }
      iVar12 = (intptr_t)tex_v;
      bVar1 = shade;
      if (texture_pixels != 0 && texture_size > 0) {
        /* HACK: a pixel whose centre lands just outside the polygon's texture rectangle (the edges
           round up to whole scanlines, and axis-aligned views land v/u right on the boundary) used to
           take the flat `shade` colour for a negative row, painting a stripe along the top edge of
           the texture, or read one byte past the end of the texture when the index hit exactly
           texture_size. Clamp to the first texel instead and wrap with `>=`. */
        if (iVar12 < 0) iVar12 = 0;
        for (iVar12 = (int)(iVar12) * texture_stride + (int)tex_u; texture_size <= iVar12;
            iVar12 = iVar12 - texture_size) {
        }
        if (iVar12 < 0) iVar12 = 0;
        bVar1 = *(byte *)(iVar12 + texture_pixels);
      }
      if (bVar1 != 0) {
        double ray_x = (light_x - proj_cx) / proj_scale;
        /* DOS's alternating +0.25/+0.75 thresholds, anchored to the screen.
           ARM applies them at RGB565 quantization rather than palette lookup. */
        int dither_offset = dither_enabled ?
            (((light_x + *(int *)(left_edge + 8)) & 1) ? 0xc0 : 0x40) : 0;
        *puVar10 = shade_span_pixel(bVar1, iVar6, ray_x, light_y, dither_offset, dos_light_mode,
                                    fullbright_enabled);
        if (DAT_0023b830 != '\0') {
          *puVar13 = (char)DAT_000da47c;
        }
      }
      light_x++;
      iVar11 = iVar11 + -1;
      puVar10 = puVar10 + 1;
      puVar13 = puVar13 + 1;
      local_38 = *(int *)(gradients + 0x3c) + local_38;
      iVar14 = *(int *)(gradients + 0x40) + iVar14;
      local_34 = *(int *)(gradients + 0x44) + local_34;
    } while (iVar11 != 0);
  }
}




// was FUN_0001de0c -- build the view/camera matrix into DAT_000c8ac0 from the camera translation (DAT_000db438/43c/440) and 3 axis rotations (DAT_000db448/44c/450)
void build_view_matrix()
{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 negated_sine;
  /* This function's four matrices (local_198.., auStack_158, local_118, auStack_d8) were each
     declared as only as many bytes as this function happens to name individual elements of... */
  undefined4 local_198_mtx [16];
  undefined1 auStack_158 [64];
  undefined4 local_118 [16];
  undefined1 auStack_d8 [64];
  undefined1 auStack_98 [64];
  undefined1 auStack_58 [64];

  /* build_trig_tables fills the per-degree sin/cos tables (DAT_000d9ed8 / DAT_000d9930) this
     function's rotation blocks read from. */
  {
    static int dd2c_done = 0;
    if (!dd2c_done) { dd2c_done = 1; build_trig_tables(); }
  }

  /* Restore water roll to the rendered view. The ARM water animation updates current_view + 0x2a,
     but its matrix roll angle (0xdb450) has no writer. Connect the existing animation to that
     rotation; camera tilt uses 256 units per degree, like the pitch at +0x28. */
  DAT_000db450 = g_current_view->view_shake_y / 256;
  if (DAT_000db450 < 0) DAT_000db450 += 360;

  set_identity_matrix4x4(auStack_d8);
  set_identity_matrix4x4(auStack_158);
  set_identity_matrix4x4(local_118);
  set_identity_matrix4x4(local_198_mtx);
  ((undefined4 *)auStack_d8)[12] = ordfloat_negate(DAT_000db438);
  ((undefined4 *)auStack_d8)[13] = ordfloat_negate(DAT_000db43c);
  ((undefined4 *)auStack_d8)[14] = ordfloat_negate(DAT_000db440);
  uVar1 = (&DAT_000d9ed8)[DAT_000db448];
  uVar3 = (&DAT_000d9930)[DAT_000db448];
  ((undefined4 *)auStack_158)[5] = uVar1;
  ((undefined4 *)auStack_158)[6] = ordfloat_negate(uVar3);
  /* ARM passes the first negate's return in r0 to the second call.
     Ghidra omitted that argument in all three rotation matrices. */
  negated_sine = ordfloat_negate(uVar3);
  ((undefined4 *)auStack_158)[9] = ordfloat_negate(negated_sine);
  uVar2 = (&DAT_000d9ed8)[DAT_000db44c];
  uVar3 = (&DAT_000d9930)[DAT_000db44c];
  ((undefined4 *)auStack_158)[10] = uVar1;
  local_118[0] = uVar2;
  negated_sine = ordfloat_negate(uVar3);
  local_118[2] = ordfloat_negate(negated_sine);
  local_118[8] = ordfloat_negate(uVar3);
  uVar1 = (&DAT_000d9ed8)[DAT_000db450];
  uVar3 = (&DAT_000d9930)[DAT_000db450];
  local_198_mtx[0] = uVar1;
  local_118[10] = uVar2;
  local_198_mtx[1] = ordfloat_negate(uVar3);
  negated_sine = ordfloat_negate(uVar3);
  local_198_mtx[4] = ordfloat_negate(negated_sine);
  local_198_mtx[5] = uVar1;
  multiply_matrix4x4(auStack_d8,local_118,auStack_98);
  multiply_matrix4x4(auStack_98,auStack_158,auStack_58);
  multiply_matrix4x4(auStack_58,local_198_mtx,&DAT_000c8ac0);
}



// was FUN_0001dfe8 -- per visible-tile vertex: subtract the camera position (ordfloat_add) to get camera-relative coords; also clears the per-tile visible flags
void translate_verts_to_camera_space(uw_geom_arena_t *arena)
{
  int i;

  for (i = 0; i < arena->vert_count; i++) {
    undefined4 x = ordfloat_add(*(int *)&arena->model_verts[i].x, *(int *)&arena->cam_offset.x);
    undefined4 y = ordfloat_add(*(int *)&arena->model_verts[i].y, *(int *)&arena->cam_offset.y);
    undefined4 z = ordfloat_add(*(int *)&arena->model_verts[i].z, *(int *)&arena->cam_offset.z);
    memcpy(&arena->camera_verts[i].x, &x, sizeof x);
    memcpy(&arena->camera_verts[i].y, &y, sizeof y);
    memcpy(&arena->camera_verts[i].z, &z, sizeof z);
  }
  for (i = 0; i < arena->rec_count; i++) {
    arena->records[i].visible = 1;
    arena->records[i].clipped = 0;
  }
}



// was FUN_0001e274 -- per vertex: multiply-accumulate the camera-relative coord through the 4x4 view matrix DAT_000c8ac0 (ordfloat_mul mul, ordfloat_add add) -> projected x,y,z,w
void project_verts_through_view_matrix(uw_geom_arena_t *arena)
{
  int i;

  /* The loop runs one past vert_count (`<=`), as in the original. */
  for (i = 0; i <= arena->vert_count && i < UW_ARENA_MAX_VERTS; i++) {
    int cx = *(int *)&arena->camera_verts[i].x;
    int cy = *(int *)&arena->camera_verts[i].y;
    int cz = *(int *)&arena->camera_verts[i].z;
    undefined4 x, y, z, t;

    x = ordfloat_mul(cx,DAT_000c8ac0);
    t = ordfloat_mul(cy,DAT_000c8ad0);
    x = ordfloat_add(x,t);
    t = ordfloat_mul(cz,DAT_000c8ae0);
    x = ordfloat_add(x,t);
    x = ordfloat_add(x,DAT_000c8af0);
    y = ordfloat_mul(cx,DAT_000c8ac4);
    t = ordfloat_mul(cy,DAT_000c8ad4);
    y = ordfloat_add(y,t);
    t = ordfloat_mul(cz,DAT_000c8ae4);
    y = ordfloat_add(y,t);
    y = ordfloat_add(y,DAT_000c8af4);
    z = ordfloat_mul(cx,DAT_000c8ac8);
    t = ordfloat_mul(cy,DAT_000c8ad8);
    z = ordfloat_add(z,t);
    t = ordfloat_mul(cz,DAT_000c8ae8);
    z = ordfloat_add(z,t);
    z = ordfloat_add(z,DAT_000c8af8);
    memcpy(&arena->projected_verts[i].x, &x, sizeof x);
    memcpy(&arena->projected_verts[i].y, &y, sizeof y);
    memcpy(&arena->projected_verts[i].z, &z, sizeof z);
  }
}




/* param_1 (and every local below that's assigned an address derived from it -- iVar5/6/7/12/14,
   local_50) was `int`, truncating the real 64-bit &DAT_000a85d0 pointer this is always called with. */
// was FUN_0001f370 -- near-plane (w=DAT_00084608=5.0) Sutherland-Hodgman clip of
// each visible tile quad; writes clipped positions + interpolated texcoords into
// the 0x88-byte render records at DAT_000bc038 and the DAT_000c4838[] pointer table
void near_clip_visible_tiles(void *tile_list, int clip_mode)
{
  intptr_t tile_base = (intptr_t)tile_list;  /* the tile list is addressed by byte offsets throughout */
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  int iVar4;
  intptr_t iVar5;
  intptr_t iVar6;
  intptr_t iVar7;
  undefined4 *puVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  intptr_t iVar12;
  int iVar13;
  intptr_t iVar14;
  undefined *puVar15;
  undefined *puVar16;
  undefined *puVar17;
  int iVar18;
  int iVar19;
  undefined *puVar20;
  int local_7c;
  int local_78;
  int local_74;
  int local_64;
  intptr_t local_50;
  int local_4c;
  int local_48;

  if (clip_mode == 0) {
    DAT_000c8c98 = 0;
  }
  else {
    local_48 = 0;
    if (0 < *(int *)(tile_base + UW_ARENA_OFF(rec_count))) {
      local_74 = 0;
      local_7c = DAT_000c8c98;
      local_4c = 0;
      iVar14 = tile_base;
      do {
        if ((*(int *)(iVar14 + (UW_REC_OFF(visible))) != 0) && (*(int *)(iVar14 + (UW_REC_OFF(clipped))) == 0)) {
          iVar19 = local_7c * 0x88;
          puVar20 = &DAT_000bc038 + iVar19;
          uVar10 = *(undefined4 *)(iVar14 + (UW_REC_OFF(tex)));
          (&DAT_000bc0ac)[iVar19] = (char)uVar10;
          (&DAT_000bc0ad)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0ae)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0af)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + (UW_REC_OFF(tex) + 4));
          (&DAT_000bc0b0)[iVar19] = (char)uVar10;
          (&DAT_000bc0b1)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0b2)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0b3)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + (UW_REC_OFF(tex) + 8));
          (&DAT_000bc0b4)[iVar19] = (char)uVar10;
          (&DAT_000bc0b5)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0b6)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0b7)[iVar19] = (char)((uint)uVar10 >> 0x18);
          iVar4 = *(int *)(iVar14 + (UW_REC_OFF(visible)));
          (&DAT_000bc0b8)[iVar19] = (char)iVar4;
          (&DAT_000bc0b9)[iVar19] = (char)((uint)iVar4 >> 8);
          (&DAT_000bc0ba)[iVar19] = (char)((uint)iVar4 >> 0x10);
          (&DAT_000bc0bb)[iVar19] = (char)((uint)iVar4 >> 0x18);
          iVar4 = *(int *)(iVar14 + (UW_REC_OFF(clipped)));
          (&DAT_000bc0bc)[iVar19] = (char)iVar4;
          (&DAT_000bc0bd)[iVar19] = (char)((uint)iVar4 >> 8);
          (&DAT_000bc0be)[iVar19] = (char)((uint)iVar4 >> 0x10);
          iVar18 = 0;
          local_78 = 0;
          (&DAT_000bc0bf)[iVar19] = (char)((uint)iVar4 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + (UW_REC_OFF(attr)));
          (&DAT_000bc0a0)[iVar19] = (char)uVar10;
          (&DAT_000bc0a1)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0a2)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0a3)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + (UW_REC_OFF(attr) + 4));
          (&DAT_000bc0a4)[iVar19] = (char)uVar10;
          (&DAT_000bc0a5)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0a6)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0a7)[iVar19] = (char)((uint)uVar10 >> 0x18);
          uVar10 = *(undefined4 *)(iVar14 + (UW_REC_OFF(attr) + 8));
          (&DAT_000bc0a8)[iVar19] = (char)uVar10;
          (&DAT_000bc0a9)[iVar19] = (char)((uint)uVar10 >> 8);
          (&DAT_000bc0aa)[iVar19] = (char)((uint)uVar10 >> 0x10);
          (&DAT_000bc0ab)[iVar19] = (char)((uint)uVar10 >> 0x18);
          iVar4 = *(int *)(iVar14 + (UW_REC_OFF(vert_count)));
          local_64 = iVar4 + -1;
          if (0 < iVar4) {
            puVar16 = &DAT_000bc044 + iVar19;
            puVar15 = puVar20;
            local_50 = iVar14;
            do {
              iVar7 = *(int *)(local_50 + (UW_REC_OFF(vert_idx)));
              iVar5 = *(int *)(local_4c + local_64 * 4 + tile_base + (UW_REC_OFF(vert_idx))) * 0xc + tile_base;
              uVar10 = *(undefined4 *)(iVar5 + (UW_ARENA_OFF(projected_verts) + 8));
              iVar6 = ordfloat_ge(uVar10,DAT_00084608);
              iVar7 = iVar7 * 0xc + tile_base;
              puVar8 = (undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 8));
              uVar11 = *puVar8;
              if (iVar6 == 0) {
                iVar6 = ordfloat_ge(uVar11,DAT_00084608);
                if (iVar6 != 0) {
                  uVar9 = ordfloat_sub(DAT_00084608,uVar10);
                  uVar10 = ordfloat_sub(uVar11,uVar10);
                  uVar11 = ordfloat_div(uVar9,uVar10);
                  uVar10 = *(undefined4 *)(iVar5 + (UW_ARENA_OFF(projected_verts)));
                  uVar9 = ordfloat_sub(*(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts))),uVar10);
                  uVar9 = ordfloat_mul(uVar9,uVar11);
                  uVar10 = ordfloat_add(uVar9,uVar10);
                  puVar15[4] = (char)uVar10;
                  puVar15[5] = (char)((uint)uVar10 >> 8);
                  puVar15[6] = (char)((uint)uVar10 >> 0x10);
                  puVar15[7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar5 + (UW_ARENA_OFF(projected_verts) + 4));
                  uVar9 = ordfloat_sub(*(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 4)),uVar10); /* dropped 2nd arg (vert0 ref coord) */
                  uVar9 = ordfloat_mul(uVar9,uVar11);
                  uVar10 = ordfloat_add(uVar9,uVar10);
                  puVar15[8] = (char)uVar10;
                  puVar15[9] = (char)((uint)uVar10 >> 8);
                  puVar15[10] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0xb] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = DAT_00084608;
                  *puVar16 = (char)DAT_00084608;
                  puVar16[1] = (char)((uint)uVar10 >> 8);
                  puVar16[2] = (char)((uint)uVar10 >> 0x10);
                  puVar16[3] = (char)((uint)uVar10 >> 0x18);
                  iVar6 = tile_base + (local_74 + local_78) * 8;
                  iVar12 = tile_base + (local_74 + local_64) * 8;
                  iVar5 = *(int *)(iVar12 + (UW_REC_OFF(uv)));
                  iVar13 = local_7c * 0x11;
                  uVar10 = ordfloat_int_to_float2(*(int *)(iVar6 + (UW_REC_OFF(uv))) - iVar5);
                  uVar10 = ordfloat_mul(uVar10,uVar11);
                  uVar9 = ordfloat_int_to_float2(iVar5);
                  uVar10 = ordfloat_uint_to_float(ordfloat_add(uVar10,uVar9));
                  iVar5 = (iVar13 + 8 + iVar18) * 8;
                  (&DAT_000bc038)[iVar5] = (char)uVar10;
                  (&DAT_000bc039)[iVar5] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc03a)[iVar5] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc03b)[iVar5] = (char)((uint)uVar10 >> 0x18);
                  iVar5 = *(int *)(iVar12 + (UW_REC_OFF(uv) + 4));
                  uVar10 = ordfloat_int_to_float2(*(int *)(iVar6 + (UW_REC_OFF(uv) + 4)) - iVar5);
                  uVar10 = ordfloat_mul(uVar10,uVar11);
                  uVar11 = ordfloat_int_to_float2(iVar5);
                  uVar10 = ordfloat_uint_to_float(ordfloat_add(uVar10,uVar11));
                  iVar5 = (iVar13 + iVar18) * 8;
                  (&DAT_000bc07c)[iVar5] = (char)uVar10;
                  (&DAT_000bc07d)[iVar5] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc07e)[iVar5] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc07f)[iVar5] = (char)((uint)uVar10 >> 0x18);
                  uVar1 = *(undefined1 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 1));
                  uVar2 = *(undefined1 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 2));
                  uVar3 = *(undefined1 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 3));
                  puVar15[0x10] = *(undefined1 *)(iVar7 + (UW_ARENA_OFF(projected_verts)));
                  puVar15[0x11] = uVar1;
                  puVar15[0x12] = uVar2;
                  puVar15[0x13] = uVar3;
                  uVar10 = *(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 4));
                  puVar15[0x14] = (char)uVar10;
                  puVar15[0x15] = (char)((uint)uVar10 >> 8);
                  puVar15[0x16] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0x17] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *puVar8;
                  puVar17 = puVar16 + 0xc;
                  *puVar17 = (char)uVar10;
                  puVar16[0xd] = (char)((uint)uVar10 >> 8);
                  puVar16[0xe] = (char)((uint)uVar10 >> 0x10);
                  puVar16[0xf] = (char)((uint)uVar10 >> 0x18);
                  iVar7 = (iVar13 + 8 + iVar18 + 1) * 8;
                  iVar5 = (iVar13 + iVar18 + 1) * 8;
                  uVar1 = *(undefined1 *)(iVar6 + (UW_REC_OFF(uv) + 1));
                  uVar2 = *(undefined1 *)(iVar6 + (UW_REC_OFF(uv) + 2));
                  uVar3 = *(undefined1 *)(iVar6 + (UW_REC_OFF(uv) + 3));
                  (&DAT_000bc038)[iVar7] = *(undefined1 *)(iVar6 + (UW_REC_OFF(uv)));
                  (&DAT_000bc039)[iVar7] = uVar1;
                  (&DAT_000bc03a)[iVar7] = uVar2;
                  (&DAT_000bc03b)[iVar7] = uVar3;
                  iVar7 = *(int *)(iVar6 + (UW_REC_OFF(uv) + 4));
                  (&DAT_000bc07c)[iVar5] = (char)iVar7;
                  (&DAT_000bc07d)[iVar5] = (char)((uint)iVar7 >> 8);
                  (&DAT_000bc07e)[iVar5] = (char)((uint)iVar7 >> 0x10);
                  (&DAT_000bc07f)[iVar5] = (char)((uint)iVar7 >> 0x18);
                  iVar18 = iVar18 + 2;
                  puVar15 = puVar15 + 0x18;
                  goto LAB_0002029c;
                }
              }
              else {
                iVar6 = ordfloat_ge(uVar11,DAT_00084608); /* dropped args: is vert1 in front of the near plane? */
                if (iVar6 == 0) {
                  uVar9 = ordfloat_sub(DAT_00084608,uVar10);
                  uVar10 = ordfloat_sub(uVar11,uVar10);
                  uVar11 = ordfloat_div(uVar9,uVar10);
                  uVar10 = *(undefined4 *)(iVar5 + (UW_ARENA_OFF(projected_verts)));
                  uVar9 = ordfloat_sub(*(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts))),uVar10); /* dropped 2nd arg (vert0 ref coord) */
                  uVar9 = ordfloat_mul(uVar9,uVar11);
                  uVar10 = ordfloat_add(uVar9,uVar10);
                  puVar15[4] = (char)uVar10;
                  puVar15[5] = (char)((uint)uVar10 >> 8);
                  puVar15[6] = (char)((uint)uVar10 >> 0x10);
                  puVar15[7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar5 + (UW_ARENA_OFF(projected_verts) + 4));
                  uVar9 = ordfloat_sub(*(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 4)),uVar10); /* dropped 2nd arg (vert0 ref coord) */
                  uVar9 = ordfloat_mul(uVar9,uVar11);
                  uVar10 = ordfloat_add(uVar9,uVar10);
                  puVar15[8] = (char)uVar10;
                  puVar15[9] = (char)((uint)uVar10 >> 8);
                  puVar15[10] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0xb] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = DAT_00084608;
                  *puVar16 = (char)DAT_00084608;
                  puVar16[1] = (char)((uint)uVar10 >> 8);
                  puVar16[2] = (char)((uint)uVar10 >> 0x10);
                  puVar16[3] = (char)((uint)uVar10 >> 0x18);
                  iVar6 = tile_base + (local_74 + local_78) * 8;
                  iVar5 = tile_base + (local_74 + local_64) * 8;
                  iVar7 = *(int *)(iVar5 + (UW_REC_OFF(uv)));
                  uVar10 = ordfloat_int_to_float2(*(int *)(iVar6 + (UW_REC_OFF(uv))) - iVar7);
                  uVar10 = ordfloat_mul(uVar10,uVar11);
                  uVar9 = ordfloat_int_to_float2(iVar7);
                  uVar10 = ordfloat_uint_to_float(ordfloat_add(uVar10,uVar9));
                  iVar7 = (local_7c * 0x11 + iVar18 + 8) * 8;
                  (&DAT_000bc038)[iVar7] = (char)uVar10;
                  (&DAT_000bc039)[iVar7] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc03a)[iVar7] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc03b)[iVar7] = (char)((uint)uVar10 >> 0x18);
                  iVar7 = *(int *)(iVar5 + (UW_REC_OFF(uv) + 4));
                  uVar10 = ordfloat_int_to_float2(*(int *)(iVar6 + (UW_REC_OFF(uv) + 4)) - iVar7);
                  uVar10 = ordfloat_mul(uVar10,uVar11);
                  uVar11 = ordfloat_int_to_float2(iVar7);
                  uVar10 = ordfloat_uint_to_float(ordfloat_add(uVar10,uVar11));
                }
                else {
                  uVar10 = *(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts)));
                  puVar15[4] = (char)uVar10;
                  puVar15[5] = (char)((uint)uVar10 >> 8);
                  puVar15[6] = (char)((uint)uVar10 >> 0x10);
                  puVar15[7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar7 + (UW_ARENA_OFF(projected_verts) + 4));
                  puVar15[8] = (char)uVar10;
                  puVar15[9] = (char)((uint)uVar10 >> 8);
                  puVar15[10] = (char)((uint)uVar10 >> 0x10);
                  puVar15[0xb] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *puVar8;
                  *puVar16 = (char)uVar10;
                  puVar16[1] = (char)((uint)uVar10 >> 8);
                  puVar16[2] = (char)((uint)uVar10 >> 0x10);
                  puVar16[3] = (char)((uint)uVar10 >> 0x18);
                  iVar5 = tile_base + (local_74 + local_78) * 8;
                  iVar7 = (local_7c * 0x11 + iVar18 + 8) * 8;
                  uVar10 = *(undefined4 *)(iVar5 + (UW_REC_OFF(uv)));
                  (&DAT_000bc038)[iVar7] = (char)uVar10;
                  (&DAT_000bc039)[iVar7] = (char)((uint)uVar10 >> 8);
                  (&DAT_000bc03a)[iVar7] = (char)((uint)uVar10 >> 0x10);
                  (&DAT_000bc03b)[iVar7] = (char)((uint)uVar10 >> 0x18);
                  uVar10 = *(undefined4 *)(iVar5 + (UW_REC_OFF(uv) + 4));
                }
                iVar7 = (local_7c * 0x11 + iVar18) * 8;
                (&DAT_000bc07c)[iVar7] = (char)uVar10;
                iVar18 = iVar18 + 1;
                puVar15 = puVar15 + 0xc;
                (&DAT_000bc07d)[iVar7] = (char)((uint)uVar10 >> 8);
                (&DAT_000bc07e)[iVar7] = (char)((uint)uVar10 >> 0x10);
                (&DAT_000bc07f)[iVar7] = (char)((uint)uVar10 >> 0x18);
                puVar17 = puVar16;
LAB_0002029c:
                puVar16 = puVar17 + 0xc;
              }
              local_50 = local_50 + 4;
              local_64 = local_78;
              local_78 = local_78 + 1;
            } while (local_78 < iVar4);
            if (iVar18 != 0) {
              *puVar20 = (char)iVar18;
              (&DAT_000bc039)[iVar19] = (char)((uint)iVar18 >> 8);
              (&DAT_000bc03a)[iVar19] = (char)((uint)iVar18 >> 0x10);
              (&DAT_000c4838)[local_7c] = puVar20;
              /* carry the real texture pointer from emit index to render index */
              if ((unsigned)local_7c < UW_MAX_VIS_TILES && (unsigned)local_48 < UW_MAX_VIS_TILES) {
                g_tile_texptr_out[local_7c] = g_tile_texptr_emit[local_48];
              }
              local_7c = local_7c + 1;
              (&DAT_000bc03b)[iVar19] = (char)((uint)iVar18 >> 0x18);
              DAT_000c8c98 = local_7c;
            }
          }
        }
        local_48 = local_48 + 1;
        local_4c = local_4c + 0x60;
        iVar14 = iVar14 + 0x60;
        local_74 = local_74 + 0xc;
      } while (local_48 < *(int *)(tile_base + UW_ARENA_OFF(rec_count)));
    }
  }
}



// was FUN_00013b8c -- confirmed by two independent pre-existing comments (uw.c's
// DAT_000c8ac0-family global-layout note, and src/3d.c's own build_view_matrix-adjacent comment) as
// a 4x4 (really 4x3-affine, homogeneous) matrix multiply...
void multiply_matrix4x4(void *a_ptr, void *b_ptr, void *out_ptr)
{
  uint *a = (uint *)a_ptr;
  uint *b = (uint *)b_ptr;
  uint *out = (uint *)out_ptr;
  undefined4 uVar1;
  undefined4 uVar2;
  
  uVar1 = ordfloat_mul(b[8],a[2]);
  uVar2 = ordfloat_mul(a[1],b[4]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(*a,*b);
  uVar1 = ordfloat_add(uVar1,uVar2);
  *out = uVar1;
  uVar1 = ordfloat_mul(b[9],a[2]);
  uVar2 = ordfloat_mul(a[1],b[5]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(b[1],*a);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[1] = uVar1;
  uVar1 = ordfloat_mul(b[10],a[2]);
  uVar2 = ordfloat_mul(b[6],a[1]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(b[2],*a);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[2] = uVar1;
  out[3] = 0;
  uVar1 = ordfloat_mul(a[6],b[8]);
  uVar2 = ordfloat_mul(a[5],b[4]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[4],*b);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[4] = uVar1;
  uVar1 = ordfloat_mul(a[6],b[9]);
  uVar2 = ordfloat_mul(a[5],b[5]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[4],b[1]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[5] = uVar1;
  uVar1 = ordfloat_mul(a[6],b[10]);
  uVar2 = ordfloat_mul(a[5],b[6]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[4],b[2]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[6] = uVar1;
  out[7] = 0;
  uVar1 = ordfloat_mul(a[10],b[8]);
  uVar2 = ordfloat_mul(a[9],b[4]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[8],*b);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[8] = uVar1;
  uVar1 = ordfloat_mul(a[10],b[9]);
  uVar2 = ordfloat_mul(a[9],b[5]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[8],b[1]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[9] = uVar1;
  uVar1 = ordfloat_mul(a[10],b[10]);
  uVar2 = ordfloat_mul(a[9],b[6]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[8],b[2]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  out[10] = uVar1;
  out[0xb] = 0;
  uVar1 = ordfloat_mul(a[0xe],b[8]);
  uVar2 = ordfloat_mul(a[0xd],b[4]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[0xc],*b);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar1 = ordfloat_add(uVar1,b[0xc]);
  out[0xc] = uVar1;
  uVar1 = ordfloat_mul(a[0xe],b[9]);
  uVar2 = ordfloat_mul(a[0xd],b[5]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[0xc],b[1]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar1 = ordfloat_add(uVar1,b[0xd]);
  out[0xd] = uVar1;
  uVar1 = ordfloat_mul(a[0xe],b[10]);
  uVar2 = ordfloat_mul(a[0xd],b[6]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar2 = ordfloat_mul(a[0xc],b[2]);
  uVar1 = ordfloat_add(uVar1,uVar2);
  uVar1 = ordfloat_add(uVar1,b[0xe]);
  out[0xe] = uVar1;
  out[0xf] = 0x3f800000;
}


// was FUN_0001422c -- confirmed by src/3d.c's own pre-existing comment ("set_identity_matrix4x4's
// identity-matrix values") as a 4x4 identity matrix setter: zeroes the 16-float (64-byte) buffer,
// then sets the four diagonal elements to 1.0f.
void set_identity_matrix4x4(void *matrix_ptr)
{
  uint *matrix = (uint *)matrix_ptr;
  ce_memset(matrix,0,0x40);
  matrix[0xf] = 0x3f800000;
  matrix[10] = 0x3f800000;
  matrix[5] = 0x3f800000;
  *matrix = 0x3f800000;
}



/* was FUN_00014258 -- copy a 4x4 matrix param_1 -> param_2. param_1 was `int`, and the body
   computed the source address as `(param_1 - (int)param_2) + (int)puVar1` -- a 32-bit byte delta --
   so on a 64-bit host both the source pointer and the delta truncated... */
void copy_matrix4x4(uint *source, uint *dest)
{
  int i;

  for (i = 0; i < 16; i = i + 1) {
    dest[i] = source[i];
  }
}




// was FUN_0001dd2c -- builds the renderer's 361-entry (0..360 degrees) per-degree sin/cos tables:
// for each angle, converts degrees to radians (multiplying by the pi/180 constant folded into the
// ordfloat_double_mul2 call)...
void build_trig_tables()
{
  undefined4 uVar1;
  int iVar2;
  undefined8 uVar3;
  
  iVar2 = 0;
  do {
    /* Preserve the softfloat return-register arguments dropped by
       Ghidra, including the float rounding of degrees -> radians. */
    uVar1 = ordfloat_int_to_float2(iVar2);
    uVar3 = ordfloat_float_to_double(uVar1);
    uVar3 = ordfloat_double_mul2((int)uVar3,(int)((ulonglong)uVar3 >> 0x20),0xa50de271,0x3f91df45);
    uVar1 = ordfloat_double_to_float(uVar3);
    uVar3 = ordfloat_float_to_double(uVar1);
    uVar1 = ordfloat_double_to_float(ordfloat_cos(uVar3));
    (&DAT_000d9ed8)[iVar2] = uVar1;
    uVar1 = ordfloat_double_to_float(
        ordfloat_sin((int)uVar3,(int)((ulonglong)uVar3 >> 0x20)));
    (&DAT_000d9930)[iVar2] = uVar1;
    iVar2 = iVar2 + 1;
  } while (iVar2 < 0x169);
}


// was FUN_0005b36c -- loads the dungeon-view texture/shade/door- frame arenas at game/level
// startup: builds "\DATA\<filename>" paths and calls load_texture_arena four times for the
// wall/floor texture sets, then load_door_frames.
void load_dungeon_texture_arenas()
{
  char *wptr_42257;
  char *wptr_42265;
  char *wptr_42273;
  char *wptr_42281;
  char *stack0xffdc3244_ptr;
  char cVar1;
  const char *pcVar2;
  int iVar3;
  short local_11c [4];
  char acStack_114 [260];
  /* acStack_86af8 / _86af0 / _86ae8 / _86ae0 were four separate stack locals (8, 8, 8, 551364
     bytes), but every use is `<base> + iVar3` where iVar3 is strlen(acStack_114) after the "\DATA\"
     prefix -- i.e. the code appends each texture filename at path + strlen(path). */

  DAT_0023ae38 = &DAT_002049e0;
  ce_memset(acStack_114,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3244_ptr = acStack_114;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_114,s__DATA__00085970);
  iVar3 = ce_strlen(acStack_114);
  pcVar2 = &DAT_000869e4;
    wptr_42257 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42257 = cVar1; wptr_42257 = wptr_42257 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  local_11c[0] = DAT_0023adb0;
  load_texture_arena(acStack_114,&DAT_0023ae58,local_11c,DAT_0023ae38);
  pcVar2 = &DAT_000869dc;
    wptr_42265 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42265 = cVar1; wptr_42265 = wptr_42265 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae34 = DAT_0023ae38 + DAT_0023adb0 * 0x1000;
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae34);
  pcVar2 = &DAT_000869d4;
    wptr_42273 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42273 = cVar1; wptr_42273 = wptr_42273 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae3c = DAT_0023ae34 + DAT_0023aeb8 * 0x400;
  load_texture_arena(acStack_114,&DAT_0023ae58,local_11c,DAT_0023ae3c);
  pcVar2 = &DAT_000869cc;
    wptr_42281 = (acStack_114 + iVar3);
  do {
    cVar1 = *pcVar2;
    *wptr_42281 = cVar1; wptr_42281 = wptr_42281 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  DAT_0023ae30 = DAT_0023ae3c + local_11c[0] * 0x100;
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae30);
  load_door_frames();
}



/* HACK: not original behaviour -- fullscreen 3D view (toggled with G, see fullscreen_view.c). The
   original hard-codes the view's top-left at (0x34,0x13) throughout; these hold it so the view can
   cover the whole 320x200 screen instead. */
int g_view_fullscreen = 0;
short g_view_x0 = 0x34;
short g_view_y0 = 0x13;

/* Clip rect of the dungeon view (the original's set_viewport_clip_rect(0x34,0x13,w+0x33,h+0x12)). */
void set_dungeon_view_clip_rect(void)
{
  set_viewport_clip_rect(g_view_x0,g_view_y0,g_view_x0 + DAT_0023b020 + -1,g_view_y0 + DAT_0023aed4 + -1);
}

// was FUN_0005b758 -- configures the dungeon-view viewport region
// (x=param_1,y=param_2,width=param_3,height=param_4): sets up the view-Y bound, tracked hotspot
// rect, and interact zones for it...
void configure_dungeon_viewport(int x, int y, int width, int height)
{
  /* HACK: not original behaviour -- the fullscreen view keeps its own rect whenever the game
     re-enters the dungeon view. */
  if (g_view_fullscreen) {
    x = 0; y = 1; width = 320; height = 200;
  }
  g_view_x0 = (short)x;
  g_view_y0 = (short)(y - 1);
  g_dungeon_view_active = 0;
  DAT_0023b020 = (undefined2)width;
  DAT_0023aed4 = (undefined2)height;
  /* HACK: was `FUN_000129d4(x);` -- dropped 2 of 3 arguments, the same class of bug fixed
     repeatedly elsewhere in this file. */
  compute_view_y_bound(x,y,width);
  set_tracked_hotspot_rect(x,y,width,height);
  register_game_view_interact_zones(x,y + height + -1,width,height);
  if ((*(ushort *)(DAT_00085a6c + 8) & 8) == 0) {
    if ((*(ushort *)(DAT_00085a6c + 8) & 1) == 0) {
      DAT_0023aed8 = 0x7ed2;
    }
    else {
      g_dungeon_view_active = 1;
      DAT_0023aed8 = 25000;
    }
  }
  else {
    DAT_0023aed8 = 0x6062;
  }
}



// was FUN_0005b828 -- one-time dungeon-view rendering init: resets the viewport, loads the 3D
// object models, initializes the glyph- width table and draw-command cursor, and builds the initial
// visibility light grid. Confirmed called once from game.c's startup sequence.
void init_dungeon_rendering()
{
  reset_viewport_to_fullscreen();
  load_3d_object_models();
  if (g_opts.dump_model_raw) {
    unsigned char *_b = (unsigned char *)&DAT_00123ccc;
    int _k;
    int _npts = *(int *)_b;
    int _nparts = *(int *)(_b + 4);
    fprintf(stderr, "[modelraw] npts=%d nparts=%d\n", _npts, _nparts);
    for (_k = 0; _k < _npts; _k++) {
      float x = *(float *)(_b + 8 + _k*0xc);
      float y = *(float *)(_b + 8 + _k*0xc + 4);
      float z = *(float *)(_b + 8 + _k*0xc + 8);
      fprintf(stderr, "[modelraw] pt[%d] = (%g,%g,%g)\n", _k, x, y, z);
    }
    for (_k = 0; _k < _nparts && _k < 40; _k++) {
      int base = 0xc14 + _k*0x60;
      int vcount = *(int *)(_b + base);
      fprintf(stderr, "[modelraw] part[%d] vcount=%d verts=", _k, vcount);
      int j;
      for (j = 0; j < vcount && j < 8; j++) {
        fprintf(stderr, "%d ", *(int *)(_b + base + 4 + j*4));
      }
      fprintf(stderr, "\n");
    }
  }
  init_glyph_width_table();
  init_draw_command_cursor();
  save_draw_command_cursor();
  DAT_0023aed0 = (undefined2 *)DAT_00110fc0;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  build_visibility_light_grid(8);
  DAT_0023b49c = DAT_00250650;
}



// was FUN_0005bac0 -- renders one dungeon-view frame (HUD draw commands + the 3D render pass)
// within the dungeon viewport's clip rect. Confirmed used both for normal frame rendering and (per
// an existing comment) to re-render in "pick" mode for mouse-object selection (hud.c).
void render_dungeon_view_frame()
{
  draw_command_list_rewind();
  emit_hud_draw_commands();
  finalize_glyph_draw_command(0xa0);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  set_viewport_clip_rect(0,0,DAT_0023b020 + -1,DAT_0023aed4 + -1);
  set_dungeon_view_clip_rect();
  if (DAT_0023b830 != 0 && DAT_0023cca0 != 0) {
    /* HACK: not original behaviour -- the ARM code only zeroes the id buffer once at startup
       (game.c) and its viewport fill in render_dungeon_view clears colour only. A pick pass only writes the id buffer where something is drawn, so anything the pass leaves
       uncovered would keep the previous frame's ids (a hall-of-mirrors smear in the pick view, and
       clicks there picking whatever used to be drawn). Clear the viewport to "nothing" first. */
    int row;
    for (row = 0; row < DAT_0023aed4; row++)
      memset(DAT_0023cca0 + (g_view_y0 + row) * 0x140 + g_view_x0, 0, (size_t)DAT_0023b020);
  }
  render_dungeon_view();
  set_viewport_clip_rect(0,0,0x13f,199);
}


// was FUN_0005dd84 -- flat-shaded (low-detail) texture-select emitter for the "wall" surface slot
// (DAT_00086b38_fnptrs[0], and the dynamic low-detail fallback for slots [1]/[3]): picks either a
// texture-page byte or a hardcoded flat-shade fallback...
void emit_flat_wall_texture_select(byte *tile_record, uint depth_shade, ushort texture_index)
{
  byte *pbVar1;

  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((texture_index & 0xff) + 0x6a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (depth_shade & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = (texture_index & 0xff) + 0xf0;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*tile_record << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
}



// was FUN_0005debc -- flat-shaded (low-detail) texture-select emitter for the "floor-or-ceiling"
// surface slot (DAT_00086b38_fnptrs[2]), structurally identical to emit_flat_wall_texture_select
// but with its own fallback shade (0xfa) and no detailed/textured counterpart of its own.
void emit_flat_floor_texture_select(byte *tile_record, uint depth_shade, uint texture_index)
{
  byte *pbVar1;

  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((texture_index & 0xff) + 0x6a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (depth_shade & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = 0xfa;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*tile_record << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
}



// was FUN_0005dff4 -- flat-shaded (low-detail) texture-select emitter for the "diagonal" surface
// slot (DAT_00086b38_fnptrs[4]), using a different texture-page range (+0x3a) and fallback shade
// (0xc0) from its wall/floor siblings.
void emit_flat_diagonal_texture_select(byte *tile_record, uint depth_shade, int unused, ushort texture_index)
{
  byte *pbVar1;

  if (DAT_0023b830 == '\0') {
    pbVar1 = (byte *)get_texture_page((texture_index & 0xff) + 0x3a);
    DAT_0023b7f8 = (ushort)*(byte *)((uint)*pbVar1 + (int)DAT_00086b30 * (depth_shade & 0xff) * 0x100 +
                                    DAT_0024fa2c);
  }
  else {
    DAT_0023b7f8 = (texture_index & 0xff) + 0xc0;
  }
  *DAT_00110fc0 = 0x2e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b7f8;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x7e;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 4;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)*tile_record << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[1] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[2] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)tile_record[3] << 3;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_000da47c = DAT_0023b7f8;
}



// was emit_floor_texture_select
// was FUN_0005e12c
void emit_floor_texture_select(byte *tile_record, uint depth, short texture_index)
{
  ushort uVar1;
  
  depth = depth & 0xff;
  if (((int)depth < (int)DAT_00086b28) || (tile_record == (byte *)0x0)) {
    if ((int)depth < (int)DAT_00086b24) {
      DAT_0023b81c = 2;
      if ((depth != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 2;
      }
      DAT_0023b4d8 = 0x400;
      uVar1 = texture_index + 0x30;
      DAT_0023b824 = 0x20;
      DAT_0023b828 = 0x3ff;
    }
    else {
      uVar1 = texture_index + 0x6a;
      DAT_0023b81c = DAT_00086b30;
      DAT_0023b4d8 = 0x100;
      DAT_0023b828 = 0xff;
      DAT_0023b824 = 0x10;
    }
    *DAT_00110fc0 = 0x3e;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b81c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = uVar1 & 0xff;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b4d8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b828;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    if (tile_record != (byte *)0x0) {
      *DAT_00110fc0 = 0x36;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*tile_record << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[3];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)tile_record[1] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[2];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)tile_record[2] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023b4f0[1];
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)tile_record[3] << 3;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*DAT_0023b4f0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
  }
  else {
    /* BUG FIX: was `FUN_0005dd84();` -- dropped all 3 arguments. */
    emit_flat_wall_texture_select(tile_record,depth,texture_index);
  }
}



// was FUN_0005e3c0 -- detailed (fully textured) texture-select emitter for the "diagonal" surface
// slot (DAT_00086b38_fnptrs[5]), the detailed counterpart to emit_flat_diagonal_texture_select.
void emit_diagonal_wall_texture_select(byte *tile_record, uint depth, uint orientation, ushort texture_index)
{
  short *psVar1;
  short sVar2;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  
  depth = depth & 0xff;
  if (((int)depth < (int)DAT_00086b28) || (tile_record == (byte *)0x0)) {
    if ((int)depth < (int)DAT_00086b24) {
      DAT_0023b81c = 4;
      if ((depth != 0) || (DAT_00087938 != 'd')) {
        DAT_0023b81c = DAT_00086b30 + 4;
      }
      DAT_0023b4d8 = 0x1000;
      DAT_0023b824 = 0x40;
      sVar2 = (short)((orientation & 0xff) << 10);
    }
    else {
      bVar5 = depth != 0;
      DAT_0023b81c = 0;
      DAT_0023b824 = 0x10;
      sVar2 = (short)((orientation & 0xff) << 6);
      texture_index = texture_index + 0x3a;
      if (bVar5) {
        /* was routed through a bogus `short *psVar1` pointer variable holding (int)DAT_00086b30 */
        DAT_0023b81c = (ushort)DAT_00086b30;
      }
      DAT_0023b4d8 = 0x100;
    }
    DAT_0023b828 = sVar2 - 1;
    iVar3 = (int)DAT_0023b818;
    DAT_0023b818 = (char)((uint)((iVar3 + 1) * 0x1000000) >> 0x18);
    if (iVar3 < 1) {
      *DAT_00110fc0 = 0x3e;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = texture_index & 0xff;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b4d8;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_0023b828;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    if (tile_record != (byte *)0x0) {
      uVar4 = 0xa2;
      if (DAT_0023b4dc == 0) {
        uVar4 = 0xa0;
      }
      *DAT_00110fc0 = uVar4;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = DAT_0023b81c;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)*tile_record + (ushort)tile_record[1] * 0x100;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)tile_record[2] + (ushort)tile_record[3] * 0x100;
      DAT_00110fc0 = DAT_00110fc0 + 1;
    }
  }
  else {
    /* BUG FIX: was `FUN_0005dff4();` -- dropped all 4 arguments, the same bug fixed just above in
       emit_floor_texture_select's own fallback. */
    emit_flat_diagonal_texture_select(tile_record,depth,orientation,texture_index);
  }
}


// was FUN_0005d2b0 -- configures the dynamic entries (indices 1/3, DAT_00086b3c/DAT_00086b44) of
// the tile-surface texture-emit function-pointer table based on the texture detail-level setting...
void configure_texture_detail_functions()
{
  uint uVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  bool bVar6;

  bVar3 = false;
  DAT_00086b2c = 0;
  uVar1 = (uint)(short)(ushort)(*(byte *)(DAT_00086df8 + 0xb5) >> 4);
  bVar4 = false;
  if (uVar1 != 0) {
    bVar6 = SBORROW4(uVar1,1);
    iVar2 = uVar1 - 1;
    bVar5 = uVar1 == 1;
    bVar3 = 1 < uVar1;
    if (1 < uVar1) {
      bVar6 = SBORROW4(uVar1,2);
      iVar2 = uVar1 - 2;
      bVar5 = uVar1 == 2;
    }
    DAT_00086b2c = 1;
    if (!bVar5 && iVar2 < 0 == bVar6) {
      bVar4 = true;
    }
  }
  if (bVar4) {
    DAT_00086b44 = (code *)emit_floor_texture_select;
  }
  else {
    DAT_00086b44 = (code *)emit_flat_wall_texture_select;
  }
  if (bVar3) {
    DAT_00086b3c = (code *)emit_floor_texture_select;
  }
  else {
    DAT_00086b3c = (code *)emit_flat_wall_texture_select;
  }
  DAT_00086b30 = 1;
}


// was FUN_0001e848 -- identity-init then compose up to 3 axis rotation matrices from angle-table indices (DAT_000d9ed8 sin / DAT_000d9930 cos); used by an object/effect transform, not the tile pipeline
void build_euler_rotation_matrix(void *matrix_ptr, int angle_x, int angle_y, int angle_z)
{
  int *matrix = (int *)matrix_ptr;
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 *puVar7;
  uint extraout_r3;
  uint extraout_r3_00;
  uint extraout_r3_01;
  uint extraout_r3_02;
  uint uVar8;
  int *piVar9;
  undefined4 uVar10;
  uint uVar11;
  undefined4 uVar12;
  int iVar13;
  uint uVar14;
  /* This whole local block was a run of individually-named scalars (local_164, local_160, ...
     auStack_124[5], local_a4[2], ...) instead of the real 4x4 (16-`undefined4`/64-byte) matrix
     buffers set_identity_matrix4x4/multiply_matrix4x4/copy_matrix4x4 actually read and write... */
  undefined4 local_164_arr [16];
  undefined4 auStack_124 [16];
  undefined4 local_e4_arr [16];
  undefined4 local_a4 [16];
  undefined4 auStack_64 [16];
#define local_164 local_164_arr[0]
#define local_160 local_164_arr[1]
#define local_15c local_164_arr[2]
#define local_154 local_164_arr[4]
#define local_150 local_164_arr[5]
#define local_14c local_164_arr[6]
#define local_144 local_164_arr[8]
#define local_140 local_164_arr[9]
#define local_13c local_164_arr[10]
#define local_110 auStack_124[5]
#define local_10c auStack_124[6]
#define local_100 auStack_124[9]
#define local_fc auStack_124[10]
#define local_e4 local_e4_arr[0]
#define local_e0 local_e4_arr[1]
#define local_d4 local_e4_arr[4]
#define local_d0 local_e4_arr[5]
#define local_9c local_a4[2]
#define local_84 local_a4[8]
#define local_7c local_a4[10]

  uVar11 = 0;
  uVar14 = 0;
  if (((angle_x == 0) && (angle_y == 0)) && (angle_z == 0)) {
    return;
  }
  set_identity_matrix4x4(local_164_arr);
  uVar8 = extraout_r3;
  if (angle_x != 0) {
    set_identity_matrix4x4(auStack_124);
    uVar10 = (&DAT_000d9ed8)[angle_x];
    local_10c = (&DAT_000d9930)[angle_x];
    local_110 = uVar10;
    local_100 = ordfloat_negate(local_10c);  /* ARM 0x1e8a4-0x1e8bc: arg is DAT_000d9930[angle_x] */
    uVar8 = extraout_r3_00;
    local_fc = uVar10;
  }
  if (angle_y != 0) {
    set_identity_matrix4x4(local_a4);
    uVar10 = (&DAT_000d9ed8)[angle_y];
    uVar12 = (&DAT_000d9930)[angle_y];
    uVar11 = uVar14;
    local_a4[0] = uVar10;
    local_9c = ordfloat_negate(uVar12);
    uVar8 = extraout_r3_01;
    uVar14 = uVar11;
    local_84 = uVar12;
    local_7c = uVar10;
  }
  if (angle_z != 0) {
    set_identity_matrix4x4(local_e4_arr);
    uVar10 = (&DAT_000d9ed8)[angle_z];
    local_e0 = (&DAT_000d9930)[angle_z];
    local_e4 = uVar10;
    local_d4 = ordfloat_negate(local_e0);  /* ARM 0x1e91c-0x1e934 */
    uVar8 = extraout_r3_02;
    local_d0 = uVar10;
  }
  if (angle_x != 0) {
    uVar11 = 4;
    uVar14 = 4;
    uVar8 = uVar11;
  }
  if (angle_y != 0) {
    uVar11 = uVar11 | 2;
    uVar8 = uVar11;
    uVar14 = uVar11;
  }
  if (angle_z != 0) {
    uVar11 = uVar11 | 1;
    uVar8 = uVar11;
    uVar14 = uVar11;
  }
  if (uVar11 == 1) {
    puVar4 = &local_e4;
  }
  else {
    if (uVar11 != 2) {
      if (uVar11 == 3) {
        puVar4 = local_a4;
LAB_0001e9c4:
        puVar7 = &local_e4;
      }
      else {
        if (uVar11 == 4) {
          puVar4 = auStack_124;
          goto LAB_0001ea10;
        }
        if (uVar11 == 5) {
          puVar7 = &local_e4;
        }
        else {
          if (uVar11 != 6) {
            if (uVar11 != 7) goto LAB_0001ea18;
            multiply_matrix4x4(auStack_124,local_a4,auStack_64);
            puVar4 = auStack_64;
            goto LAB_0001e9c4;
          }
          puVar7 = local_a4;
        }
        puVar4 = auStack_124;
      }
      multiply_matrix4x4(puVar4,puVar7,&local_164);
      goto LAB_0001ea18;
    }
    puVar4 = local_a4;
  }
LAB_0001ea10:
  copy_matrix4x4(puVar4,&local_164);
LAB_0001ea18:
  iVar13 = 0;
  piVar9 = matrix;
  if (0 < *matrix) {
    do {
      iVar1 = piVar9[4];
      iVar2 = piVar9[3];
      iVar3 = piVar9[2];
      uVar10 = ordfloat_mul(iVar3,local_160);
      uVar12 = ordfloat_mul(iVar2,local_150);
      uVar10 = ordfloat_add(uVar10,uVar12);
      uVar12 = ordfloat_mul(iVar1,local_140);
      uVar10 = ordfloat_add(uVar10,uVar12);
      uVar12 = ordfloat_mul(iVar3,local_15c);
      uVar5 = ordfloat_mul(iVar2,local_14c);
      uVar12 = ordfloat_add(uVar12,uVar5);
      uVar5 = ordfloat_mul(iVar1,local_13c);
      uVar12 = ordfloat_add(uVar12,uVar5);
      uVar5 = ordfloat_mul(iVar3,local_164);
      uVar6 = ordfloat_mul(iVar2,local_154);
      uVar5 = ordfloat_add(uVar5,uVar6);
      uVar6 = ordfloat_mul(iVar1,local_144);
      uVar5 = ordfloat_add(uVar5,uVar6);
      *(char *)(piVar9 + 2) = (char)uVar5;
      iVar13 = iVar13 + 1;
      *(char *)(piVar9 + 3) = (char)uVar10;
      *(char *)(piVar9 + 4) = (char)uVar12;
      *(char *)((char *)piVar9 + 9) = (char)((uint)uVar5 >> 8);
      *(char *)((char *)piVar9 + 10) = (char)((uint)uVar5 >> 0x10);
      *(char *)((char *)piVar9 + 0xb) = (char)((uint)uVar5 >> 0x18);
      *(char *)((char *)piVar9 + 0xd) = (char)((uint)uVar10 >> 8);
      *(char *)((char *)piVar9 + 0xe) = (char)((uint)uVar10 >> 0x10);
      *(char *)((char *)piVar9 + 0xf) = (char)((uint)uVar10 >> 0x18);
      *(char *)((char *)piVar9 + 0x11) = (char)((uint)uVar12 >> 8);
      *(char *)((char *)piVar9 + 0x12) = (char)((uint)uVar12 >> 0x10);
      *(char *)((char *)piVar9 + 0x13) = (char)((uint)uVar12 >> 0x18);
      piVar9 = piVar9 + 3;
    } while (iVar13 < *matrix);
  }
#undef local_164
#undef local_160
#undef local_15c
#undef local_154
#undef local_150
#undef local_14c
#undef local_144
#undef local_140
#undef local_13c
#undef local_110
#undef local_10c
#undef local_100
#undef local_fc
#undef local_e4
#undef local_e0
#undef local_d4
#undef local_d0
#undef local_9c
#undef local_84
#undef local_7c
}



// was FUN_0001ecb0 -- append a model's vertices and faces (the model scratch `points`: counts, 12-byte
// vertices from +8, a translation at +0xc08, 0x60-byte faces from +0xc14) to the geometry arena,
// offsetting each face's vertex indices by the vertices already there
void transform_points_by_matrix(uw_geom_arena_t *arena, void *points_ptr)
{
  const int *points = (const int *)points_ptr;
  const char *src_faces = (const char *)points + 0xc14;
  int first_vert = arena->vert_count;
  int first_rec = arena->rec_count;
  int i, k;

  for (i = 0; i < points[0]; i++) {
    uw_vec3 *dst = &arena->model_verts[first_vert + i];
    undefined4 x = ordfloat_add(points[2 + i * 3], points[0x302]);
    undefined4 y = ordfloat_add(points[3 + i * 3], points[0x303]);
    undefined4 z = ordfloat_add(points[4 + i * 3], points[0x304]);
    memcpy(&dst->x, &x, sizeof x);
    memcpy(&dst->y, &y, sizeof y);
    memcpy(&dst->z, &z, sizeof z);
  }
  arena->vert_count = first_vert + points[0];

  for (i = 0; i < points[1]; i++) {
    const int *src = (const int *)(src_faces + i * 0x60);
    uw_geom_record_t *dst = &arena->records[first_rec + i];
    int *dst_idx = dst->vert_idx;
    int *dst_uv = dst->uv;

    dst->vert_count = src[0];
    memcpy(dst->attr, src + 6, sizeof dst->attr);
    memcpy(dst->tex, src + 0x13, sizeof dst->tex);
    dst->visible = src[0x16];
    dst->clipped = src[0x17];
    for (k = 0; k < src[0]; k++) {
      dst_idx[k] = src[1 + k] + first_vert;
      dst_uv[k * 2] = src[9 + k * 2];
      dst_uv[k * 2 + 1] = src[10 + k * 2];
    }
  }
  arena->rec_count = first_rec + points[1];
}

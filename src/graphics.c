/* Low-level pixel-primitive functions: color state, rect fill/save/ restore, paletted-bitmap
   blitting into the game's internal software framebuffer, the whole-screen backup/restore save
   state used by transient panels, palette fade in/out... */
#include "headers/graphics.h"
#include "headers/options.h"
#include "headers/gx_stub.h"
#include "headers/debug.h"
#include "headers/visibility.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Ghidra modeled a single 32-bit pointer, stored straddling the byte ranges of two
   separately-declared globals (_DAT_0023c5ac's upper 16 bits + DAT_0023c5b0's lower 16 bits)... */
void *g_uw_framebuffer;
/* Not `static` -- referenced from graphics.c (bitmap_blit_to_framebuffer,
   rect_fill_or_save_restore) as well as here; the extern declaration and g_palette_rgb565 macro
   alias both live in uw.h now so both files see the same thing. */
undefined2 g_palette_rgb565_backing[32768];
/* Was a lone `undefined2` scalar, but used as a full-screen shadow/ backup buffer the same size as
   g_uw_framebuffer (screen_backup_save saves aside every non-transparent pixel across the whole
   320x200 framebuffer into it)... */
static undefined2 DAT_000891b0_backing[64000];
#define DAT_000891b0 DAT_000891b0_backing[0]
undefined2 DAT_000a85c0;
undefined2 DAT_000a85c4;
undefined2 DAT_000a85c8;
undefined2 DAT_000842a4;
undefined2 DAT_000842a8;
int DAT_00204848;
// was DAT_00088960 -- global toggle every sprite/bitmap-blit primitive in this file
// (bitmap_blit_to_framebuffer in graphics.c, and this file's own sibling blit routines, e.g.
// ~uw.c:5244/5591/62096) reads instead of taking a real "transparent mode" parameter...
int g_blit_transparent_mode;
int DAT_0024af70;
void *DAT_0023c430;
/* Sizing pass: a 256-entry palette table read 4 bytes/entry (the
   `pbVar15 = pbVar15 + 4` stride, 0x100 iterations) while building
   g_palette_rgb565 -- exactly 256*4 = 1024 real bytes. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined1 DAT_00084a40_backing[1024] = {
  0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x80, 0x80, 0x00, 0x00,
  0x00, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x80, 0x80, 0x00, 0xc0, 0xc0, 0xc0, 0x00,
  0xc0, 0xdc, 0xc0, 0x00, 0xa6, 0xca, 0xf0, 0x00, 0x2c, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00,
  0x87, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00,
  0x2c, 0x2c, 0x00, 0x00, 0x56, 0x2c, 0x00, 0x00, 0x87, 0x2c, 0x00, 0x00, 0xc0, 0x2c, 0x00, 0x00,
  0xff, 0x2c, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x2c, 0x56, 0x00, 0x00, 0x56, 0x56, 0x00, 0x00,
  0x87, 0x56, 0x00, 0x00, 0xc0, 0x56, 0x00, 0x00, 0xff, 0x56, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00,
  0x2c, 0x87, 0x00, 0x00, 0x56, 0x87, 0x00, 0x00, 0x87, 0x87, 0x00, 0x00, 0xc0, 0x87, 0x00, 0x00,
  0xff, 0x87, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x2c, 0xc0, 0x00, 0x00, 0x56, 0xc0, 0x00, 0x00,
  0x87, 0xc0, 0x00, 0x00, 0xc0, 0xc0, 0x00, 0x00, 0xff, 0xc0, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00,
  0x2c, 0xff, 0x00, 0x00, 0x56, 0xff, 0x00, 0x00, 0x87, 0xff, 0x00, 0x00, 0xc0, 0xff, 0x00, 0x00,
  0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x2c, 0x00, 0x2c, 0x00, 0x56, 0x00, 0x2c, 0x00,
  0x87, 0x00, 0x2c, 0x00, 0xc0, 0x00, 0x2c, 0x00, 0xff, 0x00, 0x2c, 0x00, 0x00, 0x2c, 0x2c, 0x00,
  0x2c, 0x2c, 0x2c, 0x00, 0x56, 0x2c, 0x2c, 0x00, 0x87, 0x2c, 0x2c, 0x00, 0xc0, 0x2c, 0x2c, 0x00,
  0xff, 0x2c, 0x2c, 0x00, 0x00, 0x56, 0x2c, 0x00, 0x2c, 0x56, 0x2c, 0x00, 0x56, 0x56, 0x2c, 0x00,
  0x87, 0x56, 0x2c, 0x00, 0xc0, 0x56, 0x2c, 0x00, 0xff, 0x56, 0x2c, 0x00, 0x00, 0x87, 0x2c, 0x00,
  0x2c, 0x87, 0x2c, 0x00, 0x56, 0x87, 0x2c, 0x00, 0x87, 0x87, 0x2c, 0x00, 0xc0, 0x87, 0x2c, 0x00,
  0xff, 0x87, 0x2c, 0x00, 0x00, 0xc0, 0x2c, 0x00, 0x2c, 0xc0, 0x2c, 0x00, 0x56, 0xc0, 0x2c, 0x00,
  0x87, 0xc0, 0x2c, 0x00, 0xc0, 0xc0, 0x2c, 0x00, 0xff, 0xc0, 0x2c, 0x00, 0x00, 0xff, 0x2c, 0x00,
  0x2c, 0xff, 0x2c, 0x00, 0x56, 0xff, 0x2c, 0x00, 0x87, 0xff, 0x2c, 0x00, 0xc0, 0xff, 0x2c, 0x00,
  0xff, 0xff, 0x2c, 0x00, 0x00, 0x00, 0x56, 0x00, 0x2c, 0x00, 0x56, 0x00, 0x56, 0x00, 0x56, 0x00,
  0x87, 0x00, 0x56, 0x00, 0xc0, 0x00, 0x56, 0x00, 0xff, 0x00, 0x56, 0x00, 0x00, 0x2c, 0x56, 0x00,
  0x2c, 0x2c, 0x56, 0x00, 0x56, 0x2c, 0x56, 0x00, 0x87, 0x2c, 0x56, 0x00, 0xc0, 0x2c, 0x56, 0x00,
  0xff, 0x2c, 0x56, 0x00, 0x00, 0x56, 0x56, 0x00, 0x2c, 0x56, 0x56, 0x00, 0x56, 0x56, 0x56, 0x00,
  0x87, 0x56, 0x56, 0x00, 0xc0, 0x56, 0x56, 0x00, 0xff, 0x56, 0x56, 0x00, 0x00, 0x87, 0x56, 0x00,
  0x2c, 0x87, 0x56, 0x00, 0x56, 0x87, 0x56, 0x00, 0x87, 0x87, 0x56, 0x00, 0xc0, 0x87, 0x56, 0x00,
  0xff, 0x87, 0x56, 0x00, 0x00, 0xc0, 0x56, 0x00, 0x2c, 0xc0, 0x56, 0x00, 0x56, 0xc0, 0x56, 0x00,
  0x87, 0xc0, 0x56, 0x00, 0xc0, 0xc0, 0x56, 0x00, 0xff, 0xc0, 0x56, 0x00, 0x00, 0xff, 0x56, 0x00,
  0x2c, 0xff, 0x56, 0x00, 0x56, 0xff, 0x56, 0x00, 0x87, 0xff, 0x56, 0x00, 0xc0, 0xff, 0x56, 0x00,
  0xff, 0xff, 0x56, 0x00, 0x00, 0x00, 0x87, 0x00, 0x2c, 0x00, 0x87, 0x00, 0x56, 0x00, 0x87, 0x00,
  0x87, 0x00, 0x87, 0x00, 0xc0, 0x00, 0x87, 0x00, 0xff, 0x00, 0x87, 0x00, 0x00, 0x2c, 0x87, 0x00,
  0x2c, 0x2c, 0x87, 0x00, 0x56, 0x2c, 0x87, 0x00, 0x87, 0x2c, 0x87, 0x00, 0xc0, 0x2c, 0x87, 0x00,
  0xff, 0x2c, 0x87, 0x00, 0x00, 0x56, 0x87, 0x00, 0x2c, 0x56, 0x87, 0x00, 0x56, 0x56, 0x87, 0x00,
  0x87, 0x56, 0x87, 0x00, 0xc0, 0x56, 0x87, 0x00, 0xff, 0x56, 0x87, 0x00, 0x00, 0x87, 0x87, 0x00,
  0x2c, 0x87, 0x87, 0x00, 0x56, 0x87, 0x87, 0x00, 0x87, 0x87, 0x87, 0x00, 0xc0, 0x87, 0x87, 0x00,
  0xff, 0x87, 0x87, 0x00, 0x00, 0xc0, 0x87, 0x00, 0x2c, 0xc0, 0x87, 0x00, 0x56, 0xc0, 0x87, 0x00,
  0x87, 0xc0, 0x87, 0x00, 0xc0, 0xc0, 0x87, 0x00, 0xff, 0xc0, 0x87, 0x00, 0x00, 0xff, 0x87, 0x00,
  0x2c, 0xff, 0x87, 0x00, 0x56, 0xff, 0x87, 0x00, 0x87, 0xff, 0x87, 0x00, 0xc0, 0xff, 0x87, 0x00,
  0xff, 0xff, 0x87, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x2c, 0x00, 0xc0, 0x00, 0x56, 0x00, 0xc0, 0x00,
  0x87, 0x00, 0xc0, 0x00, 0xc0, 0x00, 0xc0, 0x00, 0xff, 0x00, 0xc0, 0x00, 0x00, 0x2c, 0xc0, 0x00,
  0x2c, 0x2c, 0xc0, 0x00, 0x56, 0x2c, 0xc0, 0x00, 0x87, 0x2c, 0xc0, 0x00, 0xc0, 0x2c, 0xc0, 0x00,
  0xff, 0x2c, 0xc0, 0x00, 0x00, 0x56, 0xc0, 0x00, 0x2c, 0x56, 0xc0, 0x00, 0x56, 0x56, 0xc0, 0x00,
  0x87, 0x56, 0xc0, 0x00, 0xc0, 0x56, 0xc0, 0x00, 0xff, 0x56, 0xc0, 0x00, 0x00, 0x87, 0xc0, 0x00,
  0x2c, 0x87, 0xc0, 0x00, 0x56, 0x87, 0xc0, 0x00, 0x87, 0x87, 0xc0, 0x00, 0xc0, 0x87, 0xc0, 0x00,
  0xff, 0x87, 0xc0, 0x00, 0x00, 0xc0, 0xc0, 0x00, 0x2c, 0xc0, 0xc0, 0x00, 0x56, 0xc0, 0xc0, 0x00,
  0x87, 0xc0, 0xc0, 0x00, 0xff, 0xc0, 0xc0, 0x00, 0x00, 0xff, 0xc0, 0x00, 0x2c, 0xff, 0xc0, 0x00,
  0x56, 0xff, 0xc0, 0x00, 0x87, 0xff, 0xc0, 0x00, 0xc0, 0xff, 0xc0, 0x00, 0xff, 0xff, 0xc0, 0x00,
  0x00, 0x00, 0xff, 0x00, 0x2c, 0x00, 0xff, 0x00, 0x56, 0x00, 0xff, 0x00, 0x87, 0x00, 0xff, 0x00,
  0xc0, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0x2c, 0xff, 0x00, 0x2c, 0x2c, 0xff, 0x00,
  0x56, 0x2c, 0xff, 0x00, 0x87, 0x2c, 0xff, 0x00, 0xc0, 0x2c, 0xff, 0x00, 0xff, 0x2c, 0xff, 0x00,
  0x00, 0x56, 0xff, 0x00, 0x2c, 0x56, 0xff, 0x00, 0x56, 0x56, 0xff, 0x00, 0x87, 0x56, 0xff, 0x00,
  0xc0, 0x56, 0xff, 0x00, 0xff, 0x56, 0xff, 0x00, 0x00, 0x87, 0xff, 0x00, 0x2c, 0x87, 0xff, 0x00,
  0x56, 0x87, 0xff, 0x00, 0x87, 0x87, 0xff, 0x00, 0xc0, 0x87, 0xff, 0x00, 0xff, 0x87, 0xff, 0x00,
  0x00, 0xc0, 0xff, 0x00, 0x2c, 0xc0, 0xff, 0x00, 0x56, 0xc0, 0xff, 0x00, 0x87, 0xc0, 0xff, 0x00,
  0xc0, 0xc0, 0xff, 0x00, 0xff, 0xc0, 0xff, 0x00, 0x2c, 0xff, 0xff, 0x00, 0x56, 0xff, 0xff, 0x00,
  0x87, 0xff, 0xff, 0x00, 0xc0, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x11, 0x11, 0x11, 0x00,
  0x18, 0x18, 0x18, 0x00, 0x1e, 0x1e, 0x1e, 0x00, 0x25, 0x25, 0x25, 0x00, 0x2c, 0x2c, 0x2c, 0x00,
  0x34, 0x34, 0x34, 0x00, 0x3c, 0x3c, 0x3c, 0x00, 0x44, 0x44, 0x44, 0x00, 0x4d, 0x4d, 0x4d, 0x00,
  0x56, 0x56, 0x56, 0x00, 0x5f, 0x5f, 0x5f, 0x00, 0x69, 0x69, 0x69, 0x00, 0x72, 0x72, 0x72, 0x00,
  0x7d, 0x7d, 0x7d, 0x00, 0x92, 0x92, 0x92, 0x00, 0x9d, 0x9d, 0x9d, 0x00, 0xa8, 0xa8, 0xa8, 0x00,
  0xb4, 0xb4, 0xb4, 0x00, 0xcc, 0xcc, 0xcc, 0x00, 0xd8, 0xd8, 0xd8, 0x00, 0xe5, 0xe5, 0xe5, 0x00,
  0xf2, 0xf2, 0xf2, 0x00, 0xff, 0xff, 0xff, 0x00, 0xff, 0xfb, 0xf0, 0x00, 0xa0, 0xa0, 0xa4, 0x00,
  0x80, 0x80, 0x80, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00,
  0x00, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
};
#define DAT_00084a40 DAT_00084a40_backing[0]
/* Sizing-audit pass: units trap too -- element type is undefined2 (2 bytes), so [32768] was really
   65536 bytes, not 32768. */
undefined2 DAT_00242010_backing[12800];
/* Was a lone `undefined2` scalar, but build_rgb565_palette uses it as the base of a 20-level x
   256-entry faded-palette table (`(ushort*)(&DAT_00248418 + iVar21) + level*0x100`, iVar21 stepping
   by 2 per palette entry, 20 levels stepped by 0x100 ushorts/level)... */
undefined2 DAT_00248418_backing[20 * 256];
static void *DAT_0023c638;
static undefined1 DAT_001005cc;
static undefined1 DAT_001005cd;
static undefined1 DAT_001005ce;
/* Sizing-audit pass: expand_pals_bytes's own loop writes exactly
   256*3=768 bytes (`iVar3<0x100`, 3 bytes/iteration) -- HARD exact
   bound. Down from 8192. */
static undefined DAT_00088640_backing[768];
#define DAT_00088640 DAT_00088640_backing[0]
// HACK: RGB lighting calibration, default 64 when no override is set.
// --ambient-bias-reduction=0 retains the ARM formulas.
static int g_ambient_bias_reduction = 64;

/* Scratch buffer for rect_fill_or_save_restore's save/restore modes -- only ever used within this
   function, so it stays local to this file (unlike g_palette_rgb565_backing, which uw.c also needs
   and is extern'd in uw.h instead). */
static undefined2 DAT_000879b8_backing[4096];
#define DAT_000879b8 DAT_000879b8_backing[0]



// was FUN_00011694
void set_draw_color(short color_index)
{
  DAT_000a85c0 = color_index;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00011774
void rect_fill_or_save_restore(ushort left, uint top, short right, short bottom)
{
  short sVar1;
  uint uVar2;
  uint uVar3;
  void *pvVar_buf25800;
  int iVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  undefined2 *puVar8;
  uint uVar9;
  short sVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  


  iVar14 = (int)(short)left;
  iVar13 = (right - iVar14) * 0x10000;
  iVar11 = iVar13 >> 0x10;
  iVar4 = (int)(short)top;
  iVar15 = (bottom - iVar4) * 0x10000;
  iVar12 = iVar15 >> 0x10;
  dirty_rect_union(top & 0xffff,bottom,left,right);
  if ((int)(short)DAT_000a85c4 <= iVar11 + iVar14 + -1) {
    if (iVar14 < (short)DAT_000a85c4) {
      iVar14 = (int)(short)DAT_000a85c4;
      iVar11 = ((int)(short)DAT_000a85c4 - (int)(short)DAT_000a85c4) +
               (int)(short)((uint)iVar13 >> 0x10);
      left = DAT_000a85c4;
    }
    sVar10 = (short)iVar11;
    if (iVar14 <= DAT_000842a4) {
      if ((DAT_000842a4 - iVar14) + 1 < (int)sVar10) {
        sVar10 = (DAT_000842a4 - left) + 1;
      }
      sVar1 = (short)((uint)iVar15 >> 0x10);
      if ((int)DAT_000a85c8 <= sVar1 + iVar4) {
        if (iVar4 < DAT_000a85c8) {
          iVar12 = ((int)DAT_000a85c8 - (int)(short)top) + (int)sVar1;
          top = (int)DAT_000a85c8;
        }
        if ((int)(short)top <= (int)DAT_000842a8) {
          if (((int)DAT_000842a8 - (int)(short)top) + 1 < (int)(short)iVar12) {
            iVar12 = ((int)DAT_000842a8 - top) + 1;
          }
          uVar2 = (uint)left;
          left = sVar10 + left;
          uVar5 = top & 0xffff;
          uVar9 = iVar12 + (top & 0xffff);
          iVar13 = 0;
          // DAT_00204848 is only ever set by the mouse-cursor code (save_cursor_background sets it to 1 right before deliberately drawing with color 0x14, to save what's under the cursor), so colors 0x14/0x15 only mean save/restore during that specific sequence -- with DAT_00204848 at its default 0 (every other caller), they're ordinary palette colors and this whole block is skipped in favor of the flat fill below. There are 256 real palette entries (0x100, see the palette-conversion loop), so 20/21 aren't reserved from the palette's own perspective either.
          if (DAT_00204848 != 0) {
            if (DAT_000a85c0 == 0x14) {
              // SAVE mode: copy the rect from g_uw_framebuffer into the DAT_000879b8 scratch buffer.
              if ((uVar9 & 0xffff) <= uVar5) {
                return;
              }
              iVar15 = uVar5 * 0x140;
              pvVar_buf25800 = g_uw_framebuffer;
              do {
                if (63999 < iVar15) {
                  /* Sizing-pass instrumentation (NEEDS_LIVE_INSTRUMENTATION): reusing hud.c's
                     save_cursor_background env var -- logs the real pixel count (= elements of
                     DAT_000879b8) written this call... */
                  return;
                }
                if (uVar2 < left) {
                  puVar8 = &DAT_000879b8 + iVar13;
                  uVar7 = uVar2;
                  do {
                    if (0x13f < (int)uVar7) break;
                    iVar14 = iVar15 + uVar7;
                    uVar7 = uVar7 + 1;
                    iVar13 = iVar13 + 1;
                    *puVar8 = *(undefined2 *)((char *)pvVar_buf25800 + iVar14 * 2);
                    puVar8 = puVar8 + 1;
                  } while ((int)uVar7 < (int)(uint)left);
                }
                uVar5 = uVar5 + 1;
                iVar15 = iVar15 + 0x140;
                if ((int)(uVar9 & 0xffff) <= (int)uVar5) {
                  return;
                }
              } while( true );
            }
            if (DAT_000a85c0 == 0x15) {
              // RESTORE mode: copy the rect back from the DAT_000879b8 scratch buffer into g_uw_framebuffer.
              if ((uVar9 & 0xffff) <= uVar5) {
                return;
              }
              iVar15 = uVar5 * 0x140;
              do {
                if (63999 < iVar15) {
                  return;
                }
                if (uVar2 < left) {
                  puVar8 = &DAT_000879b8 + iVar13;
                  uVar6 = uVar2;
                  do {
                    if (0x13f < (int)uVar6) break;
                    iVar14 = iVar15 + uVar6;
                    uVar6 = uVar6 + 1;
                    iVar13 = iVar13 + 1;
                    *(undefined2 *)((g_uw_framebuffer) + iVar14 * 2) =
                         *puVar8;
                    puVar8 = puVar8 + 1;
                  } while ((int)uVar6 < (int)(uint)left);
                }
                uVar5 = uVar5 + 1;
                iVar15 = iVar15 + 0x140;
                if ((int)(uVar9 & 0xffff) <= (int)uVar5) {
                  return;
                }
              } while( true );
            }
          }
          if (uVar5 < (uVar9 & 0xffff)) {
            // FILL mode (default -- reached whenever save/restore isn't active): flood the rect with the current draw color.
            iVar13 = uVar5 * 0x140;
            do {
              if (63999 < iVar13) {
                return;
              }
              for (uVar6 = uVar2; ((int)uVar6 < (int)(uint)left && ((int)uVar6 < 0x140));
                  uVar6 = uVar6 + 1) {
                *(undefined2 *)
                 ((g_uw_framebuffer) + (iVar13 + uVar6) * 2) =
                     (&g_palette_rgb565)[DAT_000a85c0];
              }
              uVar5 = uVar5 + 1;
              iVar13 = iVar13 + 0x140;
            } while ((int)uVar5 < (int)(uVar9 & 0xffff));
          }
        }
      }
    }
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00011e5c
void bitmap_blit_to_framebuffer(ushort x, ushort y, char *pixels, short height, short width, short src_x, short src_y, byte transparent)
{
  short sVar1;
  int iVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  int iVar11;
  short sVar12;
  short sVar13;
  short sVar14;
  short sVar15;
  /* pixels is the source-bitmap pointer (was `int`, truncating it on this 64-bit host -- every
     caller passes a real malloc'd/global pixel-data pointer, e.g. blit_fullscreen_bitmap_file's
     OPSCR.BYT load buffer). */
  intptr_t local_34;
  

  sVar13 = 0;
  iVar11 = (int)src_x;
  sVar12 = 0;
  local_34 = (intptr_t)pixels + (int)src_y * (int)width + iVar11;
  iVar9 = (uint)x << 0x10;
  iVar8 = iVar9 >> 0x10;
  if (iVar8 < 0) {
    iVar9 = iVar8 * -0x10000;
  }
  sVar15 = 0;
  if (iVar8 < 0) {
    sVar15 = (short)((uint)iVar9 >> 0x10);
  }
  iVar9 = (uint)y << 0x10;
  iVar7 = iVar9 >> 0x10;
  if (iVar7 < 0) {
    iVar9 = iVar7 * -0x10000;
  }
  sVar14 = 0;
  if (iVar7 < 0) {
    sVar14 = (short)((uint)iVar9 >> 0x10);
  }
  iVar9 = ((int)width - (int)src_x) * 0x10000 >> 0x10;
  if (0x140 < iVar8 + iVar9) {
    sVar13 = x + (short)((int)width - (int)src_x) + -0x140;
  }
  sVar1 = (short)((uint)(((int)height - (int)src_y) * 0x10000) >> 0x10);
  iVar2 = (int)sVar1;
  if (200 < iVar7 + iVar2) {
    sVar12 = y + sVar1 + -200;
  }
  /* Was a 3-argument call to a K&R-style `dirty_rect_union()` (no prototype, so this compiles
     without error) -- missing its 4th ("right" bound) argument entirely. */
  dirty_rect_union(iVar7,iVar7 + iVar2,iVar8,iVar8 + iVar9);
  iVar5 = (int)sVar14;
  if (g_blit_transparent_mode == 0) {
    if (iVar5 < iVar2 - sVar12) {
      iVar3 = (int)sVar15;
      iVar8 = (iVar7 + iVar5) * 0x140 + iVar8;
      do {
        if (iVar3 < iVar9 - sVar13) {
          iVar7 = (iVar8 + iVar3) * 2;
          iVar6 = iVar3;
          do {
            pbVar4 = (byte *)(iVar9 * iVar5 + local_34 + iVar6);
            iVar6 = iVar6 + 1;
            *(undefined2 *)(iVar7 + (g_uw_framebuffer)) =
                 (&g_palette_rgb565)[*pbVar4];
            iVar7 = iVar7 + 2;
          } while (iVar6 < iVar9 - sVar13);
        }
        iVar5 = iVar5 + 1;
        iVar8 = iVar8 + 0x140;
        local_34 = iVar11 + local_34;
      } while (iVar5 < iVar2 - sVar12);
    }
  }
  else if (iVar5 < iVar2 - sVar12) {
    iVar8 = (iVar7 + iVar5) * 0x140 + iVar8;
    do {
      if ((int)sVar15 < iVar9 - sVar13) {
        iVar7 = (int)sVar15;
        do {
          uVar10 = (uint)*(byte *)(iVar9 * iVar5 + local_34 + iVar7);
          if (uVar10 != 0) {
            *(undefined2 *)((g_uw_framebuffer) + (iVar8 + iVar7) * 2) =
                 (&g_palette_rgb565)[uVar10];
          }
          iVar7 = iVar7 + 1;
        } while (iVar7 < iVar9 - sVar13);
      }
      iVar5 = iVar5 + 1;
      iVar8 = iVar8 + 0x140;
      local_34 = iVar11 + local_34;
    } while (iVar5 < iVar2 - sVar12);
  }
}



/* HACK: not original behaviour -- bitmap_blit_to_framebuffer's transparent mode with the bitmap enlarged
   by `scale` (nearest neighbour) about its top-left corner at (x,y), clipped to the screen. Used for
   the weapon in the fullscreen view. Index 0 is transparent. */
void bitmap_blit_scaled_to_framebuffer(int x, int y, const char *pixels, int height, int width, double scale)
{
  int out_w = (int)(width * scale + 0.5), out_h = (int)(height * scale + 0.5);
  int x0 = x < 0 ? -x : 0, y0 = y < 0 ? -y : 0;
  int x1 = x + out_w > 0x140 ? 0x140 - x : out_w, y1 = y + out_h > 200 ? 200 - y : out_h;
  if (!pixels || width <= 0 || height <= 0 || scale <= 0.0 || x0 >= x1 || y0 >= y1) return;
  dirty_rect_union(y + y0,y + y1,x + x0,x + x1);
  for (int dy = y0; dy < y1; dy++) {
    int sy = (int)(dy / scale);
    if (sy >= height) sy = height - 1;
    for (int dx = x0; dx < x1; dx++) {
      int sx = (int)(dx / scale);
      unsigned px;
      if (sx >= width) sx = width - 1;
      px = (unsigned char)pixels[sy * width + sx];
      if (px != 0) ((ushort *)g_uw_framebuffer)[(y + dy) * 0x140 + x + dx] = (ushort)(&g_palette_rgb565)[px];
    }
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// Snapshots the current 320x200 framebuffer into the DAT_000891b0 backup buffer, skipping any pixel
// already equal to g_transparent_screen_color.
// was FUN_00011478
int screen_backup_save()
{
  short sVar1;
  short *psVar2;
  short *psVar3;
  int iVar4;
  int iVar5;
  
  sVar1 = g_transparent_screen_color;
  iVar5 = 200;
  psVar3 = (short *)(g_uw_framebuffer);
  psVar2 = psVar3;
  do {
    iVar4 = 0x140;
    do {
      iVar4 = iVar4 + -1;
      if (*psVar2 != sVar1) {
        /* `(intptr_t)&DAT_000891b0` fixed globally across the file (17 sites) -- taking a global's
           address then truncating it through `(int)` before pointer arithmetic, same bug class as
           the `(TYPE *)((int)VAR + offset)` pattern fixed much earlier... */
        *(short *)((char *)&DAT_000891b0 + ((char *)psVar2 - (char *)psVar3)) = *psVar2;
      }
      psVar2 = psVar2 + 1;
    } while (iVar4 != 0);
    iVar5 = iVar5 + -1;
  } while (iVar5 != 0);
  return 0;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// Whole-screen composite: every framebuffer pixel still equal to g_transparent_screen_color is
// refilled from the screen_backup_save snapshot (DAT_000891b0), then the frame is presented.
// was FUN_000114e4
void screen_backup_restore()
{
  int iVar1;
  short *psVar2;
  int iVar3;
  
  dirty_rect_union(0,200,0,0x140);
  iVar1 = 0;
  do {
    iVar3 = 0x140;
    do {
      iVar3 = iVar3 + -1;
      psVar2 = (short *)(iVar1 + (g_uw_framebuffer));
      if (*psVar2 == g_transparent_screen_color) {
        *psVar2 = *(short *)((intptr_t)&DAT_000891b0 + iVar1);
      }
      iVar1 = iVar1 + 2;
    } while (iVar3 != 0);
  } while (iVar1 < 0x1f400);
  flush_dirty_rect_to_display(1);
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// screen_backup_restore bounded to the rect (param_1,param_2)-(param_3,
// param_4); unlike the full-screen version it does not present.
// was FUN_0001156c
void screen_backup_restore_rect(uint left, uint top, uint right, uint bottom)
{
  uint uVar1;
  int iVar2;
  short *psVar3;
  int iVar4;
  
  dirty_rect_union(0,200,0,0x140);
  top = top & 0xffff;
  if (top < (bottom & 0xffff)) {
    iVar4 = top * 0x140;
    do {
      if (63999 < iVar4) {
        return;
      }
      uVar1 = left & 0xffff;
      while (((int)uVar1 < (int)(right & 0xffff) && ((int)uVar1 < 0x140))) {
        iVar2 = iVar4 + uVar1;
        uVar1 = uVar1 + 1;
        psVar3 = (short *)(iVar2 * 2 + (g_uw_framebuffer));
        if (*psVar3 == g_transparent_screen_color) {
          *psVar3 = (&DAT_000891b0)[iVar2];
        }
      }
      top = top + 1;
      iVar4 = iVar4 + 0x140;
    } while ((int)top < (int)(bottom & 0xffff));
  }
}




// was FUN_000122d4
/* 768-byte palette buffer to install first, or 0 to keep the current palette passed through to
   apply_palette_buffer/reinstall_active_palette */
void fade_in(ushort *framebuffer, char *palette, int palette_flag)
{
  int iVar1;
  ushort uVar2;
  ushort *puVar3;
  undefined4 uVar4;
  int iVar5;
  ushort *puVar6;
  int iVar7;
  /* iVar8 held a `framebuffer - puVar3` relative offset then re-added to puVar6 to reconstruct a
     destination pointer -- correct as pointer difference* arithmetic... */
  intptr_t iVar8;
  int iVar9;
  /* The original takes 10 args (x,y,buf,h,w,0,0,palette,2,flag) but ARM reads only buf (arg 2), palette
     (arg 7) and flag (arg 9); the rest are dead, so this keeps just those three. */

  /* A fade must present every step even inside a batched gameplay tick
     or while the click that started the transition is still held. */
  uw_begin_modal_present();
  dirty_rect_union(0,200,0,0x140);
  puVar3 = (ushort *)ce_malloc(0x1f400);
  /* A null palette keeps the live LUT (e.g. an LPF palette); the level-entry and dialog fades pass their saved palette. */
  if (palette != 0) apply_palette_buffer(palette,palette_flag);
  ce_memmove(puVar3,framebuffer,0x1f400);
  iVar9 = 1;
  /* Intentional deviation: hold each step for 40 ms instead of the
     original timed palette fade's 32 ms, making the transition slower. */
  uint fade_step_start = (uint)GetTickCount();
  uint fade_step_elapsed;
  do {
    uVar4 = ordfloat_int_to_float2(iVar9);
    uVar4 = ordfloat_mul(uVar4,0x3e000000);
    uVar4 = ordfloat_mul(uVar4,0x45800000);
    /* Ghidra omitted the soft-float result passed to the conversion. */
    iVar5 = ordfloat_uint_to_float(uVar4);
    iVar8 = (intptr_t)framebuffer - (intptr_t)puVar3;
    iVar7 = 64000;
    puVar6 = puVar3;
    do {
      iVar7 = iVar7 + -1;
      iVar1 = ((int)((*puVar6 & 0xf800) << 1) >> 6) * iVar5 >> 0x12;
      *(short *)(iVar8 + (intptr_t)puVar6) = (short)((uint)(iVar1 << 0x1b) >> 0x10);
      uVar2 = (ushort)(iVar1 << 0xb) |
              (ushort)((((int)((*puVar6 & 0x7e0) << 7) >> 6) * iVar5 >> 0x12) << 5);
      *(ushort *)(iVar8 + (intptr_t)puVar6) = uVar2;
      *(ushort *)(iVar8 + (intptr_t)puVar6) =
           uVar2 | (ushort)(((int)((*puVar6 & 0x1f) << 0xc) >> 6) * iVar5 >> 0x12);
      puVar6 = puVar6 + 1;
    } while (iVar7 != 0);
    flush_dirty_rect_to_display(1);
    /* Not under --fast-sleep: that makes Sleep() a no-op, which would leave this a busy-wait. */
    while (!g_opts.fast_sleep && (fade_step_elapsed = (uint)GetTickCount() - fade_step_start) < 40)
      Sleep(40 - fade_step_elapsed);
    fade_step_start = (uint)GetTickCount();
    iVar9 = iVar9 + 1;
  } while (iVar9 < 9);
  iVar9 = 64000;
  puVar6 = puVar3;
  do {
    iVar9 = iVar9 + -1;
    *(ushort *)(((intptr_t)framebuffer - (intptr_t)puVar3) + (intptr_t)puVar6) = *puVar6;
    puVar6 = puVar6 + 1;
  } while (iVar9 != 0);
  flush_dirty_rect_to_display(1);
  LocalFree(puVar3);
  uw_end_modal_present();
}



// was FUN_00012444
/* 768-byte palette buffer to install first, or 0 to keep the current palette passed through to
   apply_palette_buffer/reinstall_active_palette */
void fade_out(ushort *framebuffer, char *palette, int palette_flag)
{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  ushort *puVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *puVar7;
  ushort *puVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  /* Same 3 live args as fade_in (framebuffer, palette, palette_flag); see its comment. */

  /* Use the same presentation scope as fade_in. */
  uw_begin_modal_present();
  dirty_rect_union(0,200,0,0x140);
  puVar4 = (ushort *)ce_malloc(0x1f400);
  /* A null palette keeps the caller's current LUT (e.g. an LPF palette). */
  if (palette != 0) apply_palette_buffer(palette,palette_flag);
  ce_memmove(puVar4,framebuffer,0x1f400);
  iVar11 = 7;
  iVar10 = 64000;
  /* Intentional deviation: use 40 ms per step, like fade_in, rather
     than the original timed palette fade's 32 ms interval. */
  uint fade_step_start = (uint)GetTickCount();
  uint fade_step_elapsed;
  do {
    uVar5 = ordfloat_int_to_float2(iVar11);
    uVar5 = ordfloat_mul(uVar5,0x3e000000);
    uVar5 = ordfloat_mul(uVar5,0x45800000);
    /* Ghidra omitted the soft-float result passed to the conversion. */
    iVar6 = ordfloat_uint_to_float(uVar5);
    iVar9 = 64000;
    puVar7 = puVar4;
    do {
      iVar9 = iVar9 + -1;
      iVar1 = ((int)((*puVar7 & 0xf800) << 1) >> 6) * iVar6 >> 0x12;
      /* Same framebuffer/puVar4/puVar7 offset-reconstruction truncation as
         fade_in right above -- see its comment. */
      puVar8 = (ushort *)(((intptr_t)framebuffer - (intptr_t)puVar4) + (intptr_t)puVar7);
      *puVar8 = (ushort)((uint)(iVar1 << 0x1b) >> 0x10);
      uVar3 = (ushort)(iVar1 << 0xb) |
              (ushort)((((int)((*puVar7 & 0x7e0) << 7) >> 6) * iVar6 >> 0x12) << 5);
      *puVar8 = uVar3;
      uVar2 = *puVar7;
      puVar7 = puVar7 + 1;
      *puVar8 = uVar3 | (ushort)(((int)((uVar2 & 0x1f) << 0xc) >> 6) * iVar6 >> 0x12);
    } while (iVar9 != 0);
    flush_dirty_rect_to_display(1);
    /* Not under --fast-sleep: that makes Sleep() a no-op, which would leave this a busy-wait. */
    while (!g_opts.fast_sleep && (fade_step_elapsed = (uint)GetTickCount() - fade_step_start) < 40)
      Sleep(40 - fade_step_elapsed);
    fade_step_start = (uint)GetTickCount();
    iVar11 = iVar11 + -1;
  } while (0 < iVar11);
  while (iVar10 = iVar10 + -1, -1 < iVar10) {
    *framebuffer = 0;
    framebuffer = framebuffer + 1;
  }
  flush_dirty_rect_to_display(1);
  while (!g_opts.fast_sleep && (fade_step_elapsed = (uint)GetTickCount() - fade_step_start) < 40)
    Sleep(40 - fade_step_elapsed);
  LocalFree(puVar4);
  uw_end_modal_present();
}


// was FUN_0001294c -- render_dungeon_frame_timed's own per-frame screen
// flush step; GX batches presentations during a gameplay tick.
void flush_dungeon_frame()
{
  flush_dirty_rect_to_display(1);
}




// was FUN_00012970 -- 3D dungeon-view frame driver: clears the viewport then runs the whole pipeline (view matrix, visibility walk, vertex transform, near-clip, rasterize, cleanup)
int render_dungeon_view()
{
  /* HACK: not original behaviour -- the fullscreen view draws its scene into a separate buffer so the
     HUD image in the framebuffer survives (see fullscreen_view.c). */
  int scene_redirect = uw_fullscreen_scene_begin();
  set_draw_color(0);
  /* HACK: not original behaviour -- the fullscreen view clears the whole screen. */
  if (g_view_fullscreen) {
    rect_fill_or_save_restore(0,0,0x13f,uw_fullscreen_scene_height() - 1);
  }
  else {
    rect_fill_or_save_restore(0x34,0x13,0xe0,0x83);
  }
  build_view_matrix();
  extra_lights_transform_to_eye();
  /* HACK: not original behaviour -- --light-depth-rounding needs the inverse of this frame's view matrix. */
  if (g_opts.light_depth_rounding > 0) {
    light_pass_prepare();
  }
  near_clip_visible_tiles(0,0);
  translate_verts_to_camera_space(&g_geom_arena);
  project_verts_through_view_matrix(&g_geom_arena);
  near_clip_visible_tiles(&g_geom_arena,1);
  render_visible_tile_list();
  free_frame_geometry_buffers();
  if (scene_redirect) uw_fullscreen_scene_end();
  return 0;
}




// was build_shade_lut -- build the 160-entry distance-shade LUT DAT_000b5638
// was FUN_00014294
void build_shade_lut()
{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  
  puVar3 = &DAT_000b5638;
  iVar2 = 0;
  iVar4 = 0xa0;
  do {
    uVar1 = ordfloat_int_to_float2(iVar2 + 0xa0);
    uVar1 = ordfloat_mul(uVar1,0x3bcccccd);
    /* Preserve the ARM r0 result chain explicitly in native C. */
    uVar1 = ordfloat_mul(uVar1,0x45800000);
    uVar1 = ordfloat_uint_to_float(uVar1);
    iVar4 = iVar4 + -1;
    *puVar3 = uVar1;
    iVar2 = iVar2 + -1;
    puVar3 = puVar3 + 1;
  } while (iVar4 != 0);
}


static int get_ambient_bias_reduction()
{
  int reduction = g_ambient_bias_reduction;
  if (UW_OPT_ISSET(g_opts.ambient_bias_reduction)) reduction = g_opts.ambient_bias_reduction;
  return reduction;
}



// was FUN_00014324. ARM lighting bias: -32 when a light is active.
// HACK: the port makes this the single place the light level is applied. `light_level` is the real
// light strength, 0-7: the brightness byte of the light item (OBJECTS.DAT), which is also the row of
// SHADES.DAT that sets the falloff, start shade and light range for both the ARM and DOS lighting
// modes. It loads that row (a no-op if it is already loaded) before the bias is set. Optional
// project calibration is added to the original formula; default 64; an override of zero preserves
// ARM lighting. Negative values brighten it.
void set_ambient_bias_with_light(char light_level)
{
  if (light_level < 0) light_level = 0;
  if (light_level > 7) light_level = 7;   /* SHADES.DAT has rows 0-7 */
  load_shading_level_config(light_level);
  DAT_000842b0 = -0x20 - light_level + get_ambient_bias_reduction();
}



// was FUN_0001433c
void set_ambient_bias_without_light(char light_level)
{
  DAT_000842b0 = '\b' - light_level + get_ambient_bias_reduction();
}




// was expand_pals_bytes -- expand PALS.DAT 6-bit channel bytes (param_2) to 8-bit into
// param_1; param_3!=0 copies unscaled
// was FUN_00022abc
void expand_pals_bytes(char *out_rgb8, char *pals_6bit, int copy_unscaled)
{
  char *pcVar1;
  char *pcVar2;
  int iVar3;

  /* out_rgb8 was declared `int` despite every caller passing a real pointer (e.g. load_pals_bank:
     `expand_pals_bytes(auStack_318,pals_6bit,0);`) -- truncating it on this 64-bit host. */
  intptr_t offset = (intptr_t)out_rgb8 - (intptr_t)pals_6bit;
  iVar3 = 0;
  if (copy_unscaled == 0) {
    do {
      pcVar2 = pals_6bit + offset;
      *pcVar2 = *pals_6bit << 2;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      pcVar2[1] = pals_6bit[1] << 2;
      pcVar1 = pals_6bit + 2;
      pals_6bit = pals_6bit + 3;
      pcVar2[2] = *pcVar1 << 2;
    } while (iVar3 < 0x100);
  }
  else {
    do {
      pcVar2 = pals_6bit + offset;
      *pcVar2 = *pals_6bit;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      pcVar2[1] = pals_6bit[1];
      pcVar1 = pals_6bit + 2;
      pals_6bit = pals_6bit + 3;
      pcVar2[2] = *pcVar1;
    } while (iVar3 < 0x100);
  }
}



/* The original Pocket PC build multiplies every palette channel by 1.5 (clamped at 255) before
   packing it to RGB565 (ARM 0x22b90/0x22bd8/0x22c20: `mov r1, #0x3fc00000`), presumably to
   compensate for the handheld LCD; the DOS palettes are shown as-is. HACK: --brightness selects the
   multiplier (e.g. --brightness=1.5 restores the Pocket PC look); default 1.0 matches DOS. Returns
   the multiplier as IEEE-754 float bits, the form ordfloat_mul takes. */
unsigned int get_palette_brightness_bits()
{
  float brightness = 1.0f;
  unsigned int bits;
  if (g_opts.brightness >= 0.0f) brightness = g_opts.brightness;
  memcpy(&bits, &brightness, sizeof bits);
  return bits;
}

// was build_rgb565_palette -- build g_palette_rgb565 from an RGB buffer (param_1; NULL =
// built-in default). param_2==0 also builds the 21-level shade ramp DAT_00248418.
// was FUN_00022b54
void build_rgb565_palette(byte *rgb_buffer, short mode)
{
  byte *pbVar1;
  byte *pbVar2;
  byte bVar3;
  short sVar4;
  ushort uVar5;
  ushort uVar6;
  undefined4 uVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  undefined4 uVar13;
  undefined4 uVar14;
  byte *pbVar15;
  undefined2 *puVar16;
  undefined2 *puVar17;
  undefined2 *puVar18;
  undefined2 *puVar19;
  ushort *puVar20;
  int iVar21;

  unsigned int brightness_bits = get_palette_brightness_bits();

  if (rgb_buffer == (undefined1 *)0x0) {
    puVar20 = &g_palette_rgb565;
    iVar21 = 0x100;
    pbVar15 = &DAT_00084a40;
    do {
      pbVar1 = pbVar15 + 1;
      iVar21 = iVar21 + -1;
      pbVar2 = pbVar15 + 2;
      bVar3 = *pbVar15;
      pbVar15 = pbVar15 + 4;
      *puVar20 = (ushort)bVar3 | ((ushort)*pbVar1 | (ushort)*pbVar2 << 6) << 5;
      puVar20 = puVar20 + 1;
    } while (iVar21 != 0);
  }
  else {
    iVar21 = 0;
    do {
      uVar7 = ordfloat_int_to_float2(*rgb_buffer);
      uVar7 = ordfloat_mul(uVar7,brightness_bits);
      /* ordfloat_uint_to_float(); -- Ghidra dropped the preceding return value. */
      iVar8 = ordfloat_uint_to_float(uVar7);
      if (0xff < iVar8) {
        iVar8 = 0xff;
      }
      uVar7 = ordfloat_int_to_float2(rgb_buffer[1]);
      uVar7 = ordfloat_mul(uVar7,brightness_bits);
      /* ordfloat_uint_to_float(); */
      iVar9 = ordfloat_uint_to_float(uVar7);
      if (0xff < iVar9) {
        iVar9 = 0xff;
      }
      uVar7 = ordfloat_int_to_float2(rgb_buffer[2]);
      uVar7 = ordfloat_mul(uVar7,brightness_bits);
      /* ordfloat_uint_to_float(); */
      iVar10 = ordfloat_uint_to_float(uVar7);
      if (0xff < iVar10) {
        iVar10 = 0xff;
      }
      rgb_buffer = rgb_buffer + 3;
      *(ushort *)((intptr_t)&g_palette_rgb565 + iVar21) =
           (ushort)(iVar10 >> 3) | (ushort)((iVar9 >> 2 | (iVar8 >> 3) << 6) << 5);
      if (mode == 0) {
        uVar7 = ordfloat_int_to_float2(iVar8 >> 3);
        uVar11 = ordfloat_int_to_float2(iVar9 >> 2);
        uVar12 = ordfloat_int_to_float2(iVar10 >> 3);
        iVar8 = 0;
        puVar20 = (ushort *)((intptr_t)&DAT_00248418 + iVar21);
        do {
          uVar13 = ordfloat_int_to_float2(iVar8 + 0x14);
          uVar14 = ordfloat_mul(uVar13,uVar7);
          uVar14 = ordfloat_mul(uVar14,0x3d430c31);
          /* ordfloat_int_to_float(); */
          sVar4 = ordfloat_int_to_float(uVar14);
          uVar14 = ordfloat_mul(uVar13,uVar11);
          uVar14 = ordfloat_mul(uVar14,0x3d430c31);
          /* ordfloat_int_to_float(); */
          uVar5 = ordfloat_int_to_float(uVar14);
          uVar13 = ordfloat_mul(uVar13,uVar12);
          uVar13 = ordfloat_mul(uVar13,0x3d430c31);
          /* ordfloat_int_to_float(); */
          uVar6 = ordfloat_int_to_float(uVar13);
          *puVar20 = uVar6 | (uVar5 | sVar4 << 6) << 5;
          iVar8 = iVar8 + -1;
          puVar20 = puVar20 + 0x100;
        } while (-0x14 < iVar8);
      }
      iVar21 = iVar21 + 2;
    } while (iVar21 < 0x200);
  }
  if ((DAT_0024af70 != 0) && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0)) {
    iVar8 = 0x28;
    puVar17 = &DAT_00242010;
    iVar21 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar21 = DAT_0023cdb8 + 1;
    }
    iVar9 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar9 = DAT_0023cdbc + 1;
    }
    /* DAT_0023c430 is the real framebuffer pointer from GXBeginDraw(); `(int)` here truncated it on
       this 64-bit host (missed by the earlier project-wide `(int)VAR + offset` sweep since here the
       pointer is the second operand, "offset + (int)VAR", not the first). */
    puVar18 = (undefined2 *)((iVar21 >> 1) * 400 + (intptr_t)DAT_0023c430);
    do {
      iVar10 = 0x140;
      puVar16 = puVar18;
      puVar19 = puVar17;
      do {
        puVar16 = puVar16 + (iVar9 >> 1);
        iVar10 = iVar10 + -1;
        /* Bounds-guard: this loop's hardcoded `400` initial offset and 320-iteration span don't fit
           within the real GAPI hardware framebuffer's actual size (240x320 RGB565 = 153600 bytes)
           for every geometry this ends up running under... */
        if ((char *)puVar16 >= (char *)DAT_0023c430 &&
            (char *)(puVar16 + 1) <= (char *)DAT_0023c430 + 153600) {
          *puVar16 = *puVar19;
        }
        puVar19 = puVar19 + 0x28;
      } while (iVar10 != 0);
      iVar8 = iVar8 + -1;
      puVar18 = puVar18 + (iVar21 >> 1);
      puVar17 = puVar17 + 1;
    } while (iVar8 != 0);
    GXEndDraw();
  }
}







// was palette_cycle_range -- rotate a contiguous run of DAT_00088d98 palette entries by one.
// was FUN_000259c0
void palette_cycle_range(uint first_index, uint last_index, int reverse)
{
  undefined *puVar1;
  int iVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = (first_index & 0xff) * 3;
  sVar3 = 3;
  puVar1 = &DAT_00088d98 + iVar5;
  if (reverse == 0) {
    sVar3 = -3;
  }
  else {
    /* Was `(undefined *)(... + 0x88d95)` -- a literal original-binary address (0x88d95 =
       &DAT_00088d98's real address there, minus 3) instead of real pointer arithmetic against the
       actual (relocated) global... */
    puVar1 = &DAT_00088d98 + (-3 + (last_index & 0xff) * 3 + iVar5);
  }
  DAT_001005cc = *puVar1;
  iVar4 = 0;
  DAT_001005cd = puVar1[1];
  DAT_001005ce = puVar1[2];
  iVar5 = (last_index & 0xff) - 1;
  if (0 < iVar5) {
    do {
      iVar2 = 0;
      do {
        puVar1[iVar2] = puVar1[iVar2 - sVar3];
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < 3);
      iVar4 = iVar4 + 1;
      puVar1 = puVar1 + -(int)sVar3;
    } while (iVar4 * 0x10000 >> 0x10 < iVar5);
  }
  *puVar1 = DAT_001005cc;
  puVar1[1] = DAT_001005cd;
  puVar1[2] = DAT_001005ce;
}







// was FUN_0006c98c -- loads and displays a raw 320x200 (64000-byte) full-screen bitmap file
// (param_2, a path): optionally selects a palette bank first (param_1, skipped if negative -- used
// for e.g. the copyright screen), blits it to the framebuffer...
int blit_fullscreen_bitmap_file(int palette_bank, char *path, int show_flag)
{
  /* iVar1 was `int`, truncating the ce_malloc (malloc) heap pointer it holds -- it's used both as
     the fread-destination buffer and as the source pointer handed to bitmap_blit_to_framebuffer
     (which now takes a real char*). */
  char *iVar1;
  int iVar2;
  undefined4 uVar3;

  iVar1 = ce_malloc(64000);
  if (iVar1 == 0) {
    uVar3 = 0;
  }
  else {
    iVar2 = read_buffer_from_file(path,iVar1,64000);
    if (iVar2 != 0) {
      if (-1 < (short)palette_bank) {
        clear_screen_and_restore_cursor();
      }
      set_viewport_clip_rect(0,0,0x13f,199);
      if (-1 < (short)palette_bank) {
        set_palette_bank(palette_bank);
      }
      bitmap_blit_to_framebuffer(0,0,iVar1,200,0x140,0,0,0);
      if (show_flag != 0) {
        flush_dirty_rect_to_display(1);
      }
    }
    LocalFree(iVar1);
    uVar3 = 1;
  }
  return uVar3;
}





// was FUN_000778fc -- gated on DAT_0024af70 (likely "GAPI display active"): opens a direct hardware
// framebuffer via GXBeginDraw, blits the DAT_00242010 buffer (the same one
// store_window_extra_data_ptr stashes into the window's extra-data slot) onto it row by row...
int blit_framebuffer_to_gx_display()
{
  undefined2 *puVar1;
  undefined2 *puVar2;
  undefined2 *puVar3;
  int iVar4;
  int iVar5;
  undefined2 *puVar6;
  int iVar7;
  int iVar8;
  
  if (DAT_0024af70 != 0) {
    DAT_0023c430 = GXBeginDraw();
    if (DAT_0023c430 == (void *)0x0) {
      return 0;
    }
    iVar7 = 0x28;
    puVar2 = &DAT_00242010;
    iVar4 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar4 = DAT_0023cdb8 + 1;
    }
    iVar5 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar5 = DAT_0023cdbc + 1;
    }
    /* Same DAT_0023c430 (framebuffer pointer) truncation as build_rgb565_palette
       above -- see its comment. */
    puVar3 = (undefined2 *)((iVar4 >> 1) * 400 + (intptr_t)DAT_0023c430);
    do {
      iVar8 = 0x140;
      puVar1 = puVar3;
      puVar6 = puVar2;
      do {
        puVar1 = puVar1 + (iVar5 >> 1);
        iVar8 = iVar8 + -1;
        /* Bounds-guard: see the identical loop in build_rgb565_palette. */
        if ((char *)puVar1 >= (char *)DAT_0023c430 &&
            (char *)(puVar1 + 1) <= (char *)DAT_0023c430 + 153600) {
          *puVar1 = *puVar6;
        }
        puVar6 = puVar6 + 0x28;
      } while (iVar8 != 0);
      iVar7 = iVar7 + -1;
      puVar3 = puVar3 + (iVar4 >> 1);
      puVar2 = puVar2 + 1;
    } while (iVar7 != 0);
    GXEndDraw();
  }
  dirty_rect_union(0,0xf0,0,0x140);
  return 0;
}


// HACK: not in the ARM executable. DOS UW1 animates water and lava by rotating fixed runs of the
// live palette on a game-clock phase (reference: cimmerianpit/openabyss, src/uw_motion_panel.c
// palette_cycle): the four 4-colour water groups 0x30/0x34/0x38/0x3c one way, the 5+3 colour fire
// ramp 0x10/0x15 the other. SHADES.DAT/LIGHT.DAT map those indices onto each other (shaded water
// stays inside the 0x30-0x3f groups, fire maps to itself), so rotating the palette animates every
// light level without touching the shade tables. The port re-rasterises the 3D view every main-loop
// pass, so a rotate + palette rebuild is all that is needed. The DOS clock rate is not known here:
// one rotation step every --palette-cycle-ms milliseconds (default 250; 0 disables). Returns 1 when
// it rotated, so the caller can redraw already-drawn HUD pixels that use the cycled colours.
int dungeon_palette_cycle_tick()
{
  static uint last_units;
  int ms = g_opts.palette_cycle_ms;
  int interval_units = ms <= 0 ? 0 : (ms + 3) / 4; /* read_realtime_clock_units() counts 4ms units */
  uint now;

  if (interval_units == 0) return 0;
  now = read_realtime_clock_units();
  if ((int)(now - last_units) < interval_units) return 0;
  last_units = now;
  palette_cycle_range(0x30,4,0);
  palette_cycle_range(0x34,4,0);
  palette_cycle_range(0x38,4,0);
  palette_cycle_range(0x3c,4,0);
  palette_cycle_range(0x10,5,1);
  palette_cycle_range(0x15,3,1);
  reinstall_active_palette(0x100,0,0);
  return 1;
}


// was FUN_0007e99c -- re-expand DAT_00088d98 into DAT_00088640 and re-install it as
// g_palette_rgb565 (real light-level/tint args dropped by Ghidra)
void reinstall_active_palette(int entry_count, int first_entry, int flag)
{
  /* expand_pals_bytes's 3rd argument was dropped here -- confirmed via real ARM disassembly: this
     call site (`bl expand_pals_bytes` right after loading only r0/r1) never sets r2 itself... */
  expand_pals_bytes(&DAT_00088640,&DAT_00088d98,0);
  build_rgb565_palette(&DAT_00088640,-1);
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0007e9c4
void plot_pixel(short x, short y, short color_index)
{
  int iVar1;

  iVar1 = (int)y;
  /* No bounds check on (x, iVar1) against the real 320x240 framebuffer (GX_W/GX_H, gx_stub.c)
     before this raw write -- callers that plot a small crosshair/cursor around a point... */
  if ((x < 0) || (0x140 <= x) || (iVar1 < 0) || (0xf0 <= iVar1)) {
    return;
  }
  *(undefined2 *)
   ((g_uw_framebuffer) + (iVar1 * 0x140 + (int)x) * 2) =
       (&g_palette_rgb565)[color_index];
  dirty_rect_union(iVar1,iVar1 + 1,(int)x,(int)x + 1);  /* 4th (right) bound was missing: dirty_rect_union takes (top,bottom,left,right) */
}





// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_000116dc -- draws a horizontal line of pixels at row param_2 from column param_1 to
// param_3, using the current color index (DAT_000a85c0) into g_palette_rgb565, and unions the drawn
// span into the dirty-rect tracker.
void draw_horizontal_line(uint x_start, uint y, uint x_end)
{
  uint uVar1;
  int iVar2;
  int iVar3;

  y = y & 0xffff;
  uVar1 = x_start & 0xffff;
  x_end = x_end & 0xffff;
  dirty_rect_union(y,y,uVar1,x_end);
  if (uVar1 < x_end) {
    iVar3 = x_end - uVar1;
    iVar2 = (y * 0x140 + (x_start & 0xffff)) * 2;
    do {
      iVar3 = iVar3 + -1;
      *(undefined2 *)(iVar2 + (g_uw_framebuffer)) =
           (&g_palette_rgb565)[DAT_000a85c0];
      iVar2 = iVar2 + 2;
    } while (iVar3 != 0);
  }
}


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00011b34 -- fills the current viewport/clip rect (the
// DAT_000842a8/DAT_000842a4/DAT_000a85c4/DAT_000a85c8 bounds set_viewport_clip_rect establishes)
// with the current draw color index into g_palette_rgb565...
void fill_viewport_and_flush()
{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;

  iVar3 = (int)DAT_000842a8;
  iVar4 = 200 - DAT_000a85c8;
  if (iVar4 < 200 - iVar3) {
    iVar5 = iVar4 * 0x140;
    sVar2 = DAT_000842a4;
    do {
      if (63999 < iVar5) break;
      for (iVar1 = (int)DAT_000a85c4; (iVar1 < sVar2 && (iVar1 < 0x140)); iVar1 = iVar1 + 1) {
        *(undefined2 *)((g_uw_framebuffer) + (iVar5 + iVar1) * 2) =
             (&g_palette_rgb565)[DAT_000a85c0];
        sVar2 = DAT_000842a4;
      }
      iVar4 = iVar4 + 1;
      iVar5 = iVar5 + 0x140;
    } while (iVar4 < 200 - iVar3);
  }
  flush_dirty_rect_to_display(1);
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_000120c8 -- a clipped variant of bitmap_blit_to_framebuffer (its own comment already
// cross-references it): blits an 8bpp paletted source bitmap into the framebuffer at
// (param_1,param_2)...
/* Was `int`, truncating the real char* source-bitmap pointer callers pass (e.g. DAT_001005c8) --
   same role/bug as bitmap_blit_to_framebuffer's param_3. */
void blit_bitmap_to_framebuffer_clipped(short x, short y, char *pixels, short height, short width, short src_x, short src_y, int transparent)
{
  int iVar1;
  int iVar2;
  byte bVar3;
  int iVar4;
  byte *pbVar5;
  int iVar6;
  int iVar7;
  
  iVar4 = (int)x;
  if ((int)DAT_000a85c4 <= width + iVar4 + -1) {
    if (iVar4 < DAT_000a85c4) {
      iVar4 = (int)DAT_000a85c4;
    }
    if (iVar4 <= DAT_000842a4) {
      if ((int)DAT_000a85c8 <= (int)height + (int)y) {
        if ((int)y < (int)DAT_000a85c8) {
          height = (DAT_000a85c8 - y) + height;
          y = DAT_000a85c8;
        }
        iVar7 = (int)y;
        if (iVar7 <= DAT_000842a8) {
          if ((DAT_000842a8 - iVar7) + 1 < (int)height) {
            height = (DAT_000842a8 - y) + 1;
          }
          iVar1 = (int)width;
          iVar2 = (int)height;
          dirty_rect_union(iVar7,iVar2 + iVar7,iVar4,iVar1 + iVar4);
          iVar4 = iVar7 * 0x140 + iVar4;
          pbVar5 = (byte *)(src_y * 0x140 + (int)src_x + pixels);
          iVar7 = 0;
          if (0 < iVar2) {
            do {
              if (199 < iVar7) break;
              iVar6 = 0;
              if (0 < iVar1) {
                do {
                  if (0x13f < iVar6) break;
                  bVar3 = *pbVar5;
                  pbVar5 = pbVar5 + 1;
                  if ((g_blit_transparent_mode & (bVar3 == 0)) == 0) {
                    *(undefined2 *)((g_uw_framebuffer) + iVar4 * 2) =
                         (&g_palette_rgb565)[bVar3];
                  }
                  iVar6 = iVar6 + 1;
                  iVar4 = iVar4 + 1;
                } while (iVar6 < iVar1);
              }
              iVar7 = iVar7 + 1;
              if (src_x != 0) {
                pbVar5 = pbVar5 + (0x140 - iVar1);
              }
              iVar4 = (0x140 - iVar1) + iVar4;
            } while (iVar7 < iVar2);
          }
          if (transparent != 0) {
            flush_dirty_rect_to_display(1);
          }
        }
      }
    }
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00012850 -- copies a param_3-wide by param_4-tall rect within the framebuffer from
// (param_5,param_6) to (param_1,param_2), unioning the destination into the dirty-rect tracker and
// always flushing to the display afterward.
void copy_framebuffer_rect(short src_x, short src_y, short width, short height, short dst_x, short dst_y)
{
  int iVar2;
  void *pvVar_buf25800;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  undefined2 *puVar11;

  iVar7 = (int)src_y;
  if (dst_y < iVar7) {
    iVar4 = (int)height;
    iVar5 = (int)width;
    pvVar_buf25800 = g_uw_framebuffer;
    iVar10 = 0x140 - iVar5;
    dirty_rect_union(200 - iVar4,iVar4 + (200 - iVar4),iVar10,iVar7 + iVar10);
    iVar6 = dst_y * 0x140 + (int)dst_x;
    iVar7 = iVar7 * 0x140 + (int)src_x;
    iVar9 = 0;
    if (0 < iVar4) {
      do {
        if (199 < iVar9) break;
        iVar8 = 0;
        if (0 < iVar5) {
          puVar11 = (undefined2 *)((char *)pvVar_buf25800 + iVar7 * 2);
          do {
            if (0x13f < iVar8) break;
            iVar8 = iVar8 + 1;
            iVar7 = iVar7 + 1;
            iVar2 = iVar6 * 2;
            iVar6 = iVar6 + 1;
            *(undefined2 *)((g_uw_framebuffer) + iVar2) = *puVar11;
            puVar11 = puVar11 + 1;
          } while (iVar8 < iVar5);
        }
        iVar9 = iVar9 + 1;
        iVar6 = iVar10 + iVar6;
        iVar7 = iVar10 + iVar7;
      } while (iVar9 < iVar4);
    }
    flush_dirty_rect_to_display(1);
  }
}


// was FUN_00012958 -- resets the viewport/clip rect to the full
// screen (0,0,0x13f,199).
void reset_viewport_to_fullscreen()
{
  set_viewport_clip_rect(0,0,0x13f,199);
}



// was FUN_000129d4 -- computes `((param_1 << 16) >> 18) - param_2 + 199` (a Y-coordinate-ish
// transform; 199 matches the full-screen clip rect's bottom edge used elsewhere)...
uint64_t compute_view_y_bound(int angle, int offset, int passthrough)
{
  return CONCAT44(passthrough,(((angle << 0x10) >> 0x12) - offset) + 199);
}



// was FUN_000232b0 -- ends the active GAPI/GX draw session (GXEndDraw, guarded by DAT_0023c430
// tracking whether one is open) and releases DAT_0023c638 (an offscreen/back-buffer pointer --
// LocalFree is a deliberate no-op/leak stub, see its own comment).
void end_gx_draw_session()
{
  if (DAT_0023c430 != 0) {
    GXEndDraw();
  }
  LocalFree(DAT_0023c638);
}


// was FUN_00035fdc -- converts a 256-entry, 4-bytes-per-entry BGRX/RGBQUAD-style palette (param_1)
// into a packed 3-bytes-per-entry RGB buffer (param_2), reversing each entry's first 3 bytes.
void convert_palette_bgrx_to_rgb(byte *bgrx, byte *rgb)
{
  undefined1 uVar1;
  int iVar2;

  iVar2 = 0;
  do {
    *rgb = bgrx[2];
    rgb[1] = bgrx[1];
    uVar1 = *bgrx;
    bgrx = bgrx + 4;
    rgb[2] = uVar1;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    rgb = rgb + 3;
  } while (iVar2 < 0x100);
}


// was FUN_0003601c
/* NOT a per-tile lava/water/torch tile-shimmer driver, despite looking like one -- traced both of
   its two real call sites (uw.c ~37381 and ~68657) and they're gated on a special object flag right
   where the game prints "You read the..." and dispatches to... */
void tick_book_illustration_palette_cycles(ushort *cycle_record)
{
  undefined2 uVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0x10;
  do {
    if (cycle_record[1] != 0) {
      uVar2 = read_realtime_clock_units();
      iVar3 = ordint_divmod(cycle_record[1],0x38e).quot;
      if (iVar3 <= (int)((uVar2 & 0xffff) - (uint)*cycle_record)) {
        uVar2 = (1 - (uint)(byte)cycle_record[3]) + (uint)*(byte *)((char *)cycle_record + 7);
        palette_cycle_range((uint)(byte)cycle_record[3],uVar2,0);
        reinstall_active_palette(uVar2 & 0xff,(char)cycle_record[3],1);
        uVar1 = read_realtime_clock_units();
        *(char *)cycle_record = (char)uVar1;
        *(char *)((char *)cycle_record + 1) = (char)((ushort)uVar1 >> 8);
      }
    }
    iVar4 = iVar4 + -1;
    cycle_record = cycle_record + 4;
  } while (iVar4 != 0);
}


// was FUN_0003af28 -- loads an embedded BMP resource (param_1/param_2:
// FindResourceW/FindResource-style module+name lookup) and decodes it into an RGB565 buffer
// (param_3): reads the 0x28-byte BITMAPINFOHEADER and 0x400-byte (256-entry RGBQUAD) palette...

int load_bmp_resource_to_rgb565(int module, short resource_name, ushort *out_pixels)
{
  char *iVar1;
  char *src_row;
  byte *pbVar2;
  ushort *puVar3;
  int iVar4;
  byte *pbVar5;
  byte *pbVar6;
  int iVar7;
  undefined1 auStack_654 [4];
  int local_650;
  int local_64c;
  ushort local_62c [256];
  byte local_42c [1024];
  
  iVar1 = (char *)FindResourceW(module,resource_name,2);
  if ((iVar1 != 0) && (iVar1 = (char *)LoadResource(module), iVar1 != 0)) {
    ce_memmove(auStack_654,iVar1,0x28);
    ce_memmove(local_42c,iVar1 + 0x28,0x400);
    puVar3 = local_62c;
    pbVar2 = local_42c;
    iVar4 = 0x100;
    do {
      iVar4 = iVar4 + -1;
      *puVar3 = ((pbVar2[2] & 0xf8) << 3 | (ushort)(pbVar2[1] >> 2)) << 5 | (ushort)(*pbVar2 >> 3);
      pbVar2 = pbVar2 + 4;
      puVar3 = puVar3 + 1;
    } while (iVar4 != 0);
    pbVar2 = (byte *)cpp_operator_new(local_64c * local_650);
    if (pbVar2 != (byte *)0x0) {
      if (0 < local_64c) {
        pbVar6 = pbVar2 + (local_64c + -1) * local_650;
        src_row = iVar1;
        iVar7 = local_64c;
        do {
          ce_memmove(pbVar6,src_row + 0x428,local_650);
          iVar7 = iVar7 + -1;
          src_row = src_row + local_650;
          pbVar6 = pbVar6 + -local_650;
        } while (iVar7 != 0);
        pbVar6 = pbVar2;
        if (0 < local_64c) {
          do {
            puVar3 = out_pixels;
            pbVar5 = pbVar6;
            iVar4 = local_650;
            if (0 < local_650) {
              do {
                iVar4 = iVar4 + -1;
                *puVar3 = local_62c[*pbVar5];
                puVar3 = puVar3 + 1;
                pbVar5 = pbVar5 + 1;
              } while (iVar4 != 0);
            }
            local_64c = local_64c + -1;
            out_pixels = out_pixels + local_650;
            pbVar6 = pbVar6 + local_650;
          } while (local_64c != 0);
        }
      }
      DeleteObject((long)iVar1);
      cpp_operator_delete(pbVar2);
      return 1;
    }
    DeleteObject((long)iVar1);
  }
  return 0;
}


// was FUN_00040df0 -- called from several full-screen UI close paths (automap, babl dialog,
// chargen, graphics, player rest) to tear down the overlay: decrements the cursor hide/show nesting
// depth (decrement_cursor_hide_depth, not yet named), clears the whole viewport to black...
void clear_screen_and_restore_cursor()
{
  decrement_cursor_hide_depth();
  set_viewport_clip_rect(0,0,0x13f,199);
  set_draw_color(0);
  fill_viewport_and_flush();
  cursor_show_idle_tick();
}


// was FUN_00040f34 -- generic "install this 768-byte palette buffer as the active palette" helper,
// shared by set_palette_bank (a specific PALS.DAT bank) and the fade_in/fade_out RGB framebuffer
// crossfades (src/graphics.c)...
/* was undefined4: truncated the real buffer pointer on this 64-bit host */
void apply_palette_buffer(void *palette, int flag)
{
  ce_memmove(&DAT_00088d98,palette,0x300);
  reinstall_active_palette(0x100,0,flag);
}



// was FUN_00040f64 -- fades the active palette down to black over param_2 steps (frame-paced via
// read_realtime_clock_units, at least 10 clock units apart), re-applying the dimmed palette via
// apply_palette_buffer each step; param_2==0 instead snaps straight to black.
void fade_active_palette_to_black(char *palette, short steps)
{
  int iVar1;
  char *iVar2;
  undefined1 uVar3;
  int iVar4;
  int iVar5;
  short *psVar6;
  short sVar7;
  int iVar8;
  char *iVar9;
  
  iVar2 = (char *)DAT_0024af78;
  iVar9 = (char *)DAT_0024af78 + 0x300;
  iVar4 = read_realtime_clock_units();
  if (steps == 0) {
    iVar4 = 0;
    do {
      *(undefined1 *)(iVar4 + iVar2) = 0;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x300);
    apply_palette_buffer(iVar2,0);
  }
  else {
    iVar1 = (int)steps << 0x13;
    iVar5 = 0;
    do {
      *(short *)(iVar9 + iVar5 * 2) =
           (short)((uint)*(byte *)(iVar5 + palette) * (iVar1 >> 0x10 & 0xffffU) * 0x10000 >> 0x10);
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 0x300);
    iVar1 = (int)(short)((uint)iVar1 >> 0x10);
    iVar5 = 0;
    if (0 < iVar1) {
      do {
        iVar8 = 0;
        do {
          psVar6 = (short *)(iVar9 + iVar8 * 2);
          sVar7 = *psVar6 - (ushort)*(byte *)(iVar8 + palette);
          *psVar6 = sVar7;
          uVar3 = ordint_divmod(iVar1,sVar7).quot;
          *(undefined1 *)(iVar8 + iVar2) = uVar3;
          iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
        } while (iVar8 < 0x300);
        /* Intentional deviation: 10 clock units (40 ms) instead of 8
           (32 ms), matching the slower framebuffer fades above. */
        do {
          iVar8 = read_realtime_clock_units();
        } while ((uint)(iVar8 - iVar4) < 10);
        apply_palette_buffer(iVar2,0);
        iVar4 = read_realtime_clock_units();
        iVar5 = iVar5 + 1;
      } while (iVar5 * 0x10000 >> 0x10 < iVar1);
    }
  }
}

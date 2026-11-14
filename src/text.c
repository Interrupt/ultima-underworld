/* Text/font rendering: string draw, width measurement, glyph bitmap unpacking, and font metrics
   loading/selection. Split out of uw.c (the original monolithic decompile) once these functions'
   real roles were confirmed. */
#include "headers/text.h"
#include "headers/options.h"
#include "headers/debug.h"
#include "headers/platform_compat.h"
#include <stdio.h>
#include <stdlib.h>

// was DAT_0024ae20. Flat RGB565 ink color draw_text_string uses when g_text_use_palette_color is 0
// -- never written anywhere, silently 0 (black).
undefined2 g_text_flat_color;
/* Sizing pass: units trap -- declared element type is undefined2 (2 bytes), so [32768] was actually
   65536 real bytes, not 32768. */
static undefined2 DAT_000890b0_backing[256];
#define DAT_000890b0 DAT_000890b0_backing[0]
// was DAT_0008909c. Line height (pixels) of the currently-active font,
// read from its header by load_font_metrics; 0 would make
// draw_text_string allocate/draw nothing.
static ushort g_font_line_height;
// was DAT_0008894c. Per-glyph row stride (bytes) of the currently-active
// font, also from load_font_metrics; selects unpack_glyph_bitmap's 8- vs
// 16-bit-per-row decode.
static short g_font_row_stride;
static short DAT_000a85b8;
/* Was `int`, truncating the real char* pointer (DAT_000890a4) assigned
   into it -- used as a glyph-bitmap-data base address in byte-pointer
   arithmetic passed to unpack_glyph_bitmap. */
static byte *g_font_glyph_data_base;
static undefined2 DAT_000a85b0;
static char s_0123456789ABCDEF_00084a28[] = "0123456789ABCDEF";
static undefined1 DAT_00189588;
/* Was a single `undefined2`/`undefined1` scalar, but init_glyph_width_table (the only function
   anywhere in this decompile that touches any of these 4 globals) indexes each one via
   `(&DAT_xxx)[i]` up to the extents below -- an out-of-bounds scalar-as-array access... */
static short DAT_00110a78[0xa0];  /* 0xffff (-1) = "no entry yet" */
static undefined2 DAT_00110bc0[0x200];
static undefined1 DAT_00110fd0[0x20];
static undefined1 DAT_00201b18[0x20];
static undefined2 DAT_00189572;
static undefined2 DAT_00189574;
char * DAT_00110fc8 = 0;
static undefined1 DAT_00110fc4;
static char *DAT_00110bb8;
/* Was `undefined4` (4 bytes) despite init_draw_command_cursor using it to reset DAT_00110fc0 (`char
   *`) -- truncating on this 64-bit host, and overwriting the DAT_00110fc0_scratch fallback (see
   DAT_00110fc0's own comment) with a truncated garbage/NULL pointer right before... */
static char *DAT_00110fcc = DAT_00110fc0_scratch;
static undefined2 DAT_00201b38;
static undefined2 DAT_00201b10;
static undefined4 DAT_0020250c;






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00011060
void draw_text_string(char *text, short x, short y)
{
  /* Opt-in trace (--diag-text=1): every text draw's calling function (via dladdr on the return
     address), position, and content. Zero cost when unset. */
  if (g_opts.diag_text) {
    Dl_info _dli;
    const char *_caller = "?";
    if (dladdr(__builtin_return_address(0), &_dli) && _dli.dli_sname) {
      _caller = _dli.dli_sname;
    }
    fprintf(stderr, "[diag11060] caller=%s xy=(%d,%d) str=\"%.30s\"\n", _caller, x, y, text ? text : "(null)");
  }
  short sVar1;
  int iVar2;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  char *pcVar8;
  char *pcVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  char *local_48;
  undefined1 auStack_40 [16];

  /* Was `ce_strlen()` -- called with no argument, relying on whatever was left in the
     first-argument register from earlier code (the "dropped argument" idiom used throughout this
     file). */
  iVar2 = ce_strlen(text);
  uVar3 = measure_text_width(text);
  uVar10 = (uint)g_font_line_height;
  if (g_opts.diag_text)
    fprintf(stderr, "[diag11060] measured_width=%u line_height(g_font_line_height)=%u alloc=%u\n",
            uVar3, uVar10, (uVar3 & 0xffff) * uVar10);
  pcVar4 = (char *)ce_malloc((uVar3 & 0xffff) * uVar10);
  iVar11 = 0;
  pcVar8 = pcVar4;
  if (uVar10 != 0) {
    do {
      iVar7 = iVar2;
      pcVar9 = text;
      if (0 < iVar2) {
        do {
          /* char is signed by default on this host; the original ARM ABI treats it as unsigned, so
             bytes >=0x80 (e.g. any extended/high glyph index) went NEGATIVE here and indexed before
             the table -- reading garbage widths... */
          sVar1 = (&DAT_000890b0)[(byte)*pcVar9];
          {
            int _fmt = (int)g_font_row_stride << 3;
            /* Same signed-char bug as the width lookup just above (see its own comment) --
               `*pcVar9` is `char`, signed on this host, so any extended/high glyph index (>=0x80)
               sign- extended to a negative int here... */
            undefined4 _r = unpack_glyph_bitmap(auStack_40,
                       (DAT_000a85b8 + 1) * (int)(byte)*pcVar9 + g_font_row_stride * iVar11 + g_font_glyph_data_base,
                       _fmt);
            if (g_opts.diag_text)
              fprintf(stderr, "[diag11060] glyph '%c' fmt=%d(0x%x) rowbytes(g_font_row_stride)=%d ret=%d width(sVar1)=%d auStack_40[0..3]=%d,%d,%d,%d\n",
                      *pcVar9, _fmt, _fmt, (int)g_font_row_stride, (int)_r, (int)sVar1,
                      (int)auStack_40[0], (int)auStack_40[1], (int)auStack_40[2], (int)auStack_40[3]);
          }
          /* BUG FIX: sVar1 (the glyph's pixel width, from the width table above) was used unclamped
             as this copy's byte count, but unpack_glyph_bitmap only ever fills 8 or 16 bytes of
             auStack_40 (its two handled cases, y==8/0x10)... */
          ce_memmove(pcVar8,auStack_40,(int)sVar1 > (int)sizeof(auStack_40) ? (int)sizeof(auStack_40) : (int)sVar1);
          iVar7 = iVar7 + -1;
          pcVar8 = pcVar8 + sVar1;
          pcVar9 = pcVar9 + 1;
        } while (iVar7 != 0);
      }
      iVar11 = iVar11 + 1;
    } while (iVar11 < (int)uVar10);
  }
  iVar2 = (int)y;
  iVar11 = (int)x;
  iVar7 = uVar10 + iVar2;
  iVar12 = iVar11 + (uVar3 & 0xffff);
  dirty_rect_union(iVar2,iVar7,iVar11,iVar12);
  if (iVar2 < iVar7) {
    iVar6 = iVar2 * 0x140;
    pcVar8 = pcVar4;
    local_48 = pcVar4;
    do {
      iVar5 = iVar11;
      if (63999 < iVar6) break;
      for (; (iVar5 < iVar12 && (iVar5 < 0x140)); iVar5 = iVar5 + 1) {
        if (*pcVar8 == '\x01') {
          if (g_text_use_palette_color == 0) {
            *(undefined2 *)((g_uw_framebuffer) + (iVar6 + iVar5) * 2) =
                 g_text_flat_color;
          }
          else {
            *(undefined2 *)((g_uw_framebuffer) + (iVar6 + iVar5) * 2) =
                 (&g_palette_rgb565)[*g_draw_color_index];
            pcVar8 = local_48;
          }
        }
        pcVar8 = pcVar8 + 1;
        local_48 = pcVar8;
      }
      iVar2 = iVar2 + 1;
      iVar6 = iVar6 + 0x140;
    } while (iVar2 < iVar7);
  }
  if (pcVar4 != (char *)0x0) {
    LocalFree(pcVar4);
  }
}



// was FUN_000112a0
int measure_text_width(char *text)
{
  char cVar1;
  uint uVar2;
  short sVar3;

  /* Was `ce_strlen()` with no argument, relying on register leftovers to still hold text (see
     draw_text_string's matching fix/comment a few lines above -- same root bug)... */
  uVar2 = ce_strlen(text);
  sVar3 = 0;
  for (uVar2 = uVar2 & 0xffff; uVar2 != 0; uVar2 = uVar2 - 1) {
    cVar1 = *text;
    text = text + 1;
    /* Same signed-char-indexing bug as draw_text_string above. */
    sVar3 = sVar3 + (&DAT_000890b0)[(byte)cVar1];
  }
  return (int)sVar3;
}



// was FUN_000112fc
int unpack_glyph_bitmap(byte *out_pixels, byte *glyph_bits, short bits_per_row)
{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  
  if ((glyph_bits == (byte *)0x0) || (out_pixels == (undefined1 *)0x0)) {
    uVar2 = 0;
  }
  else {
    if (bits_per_row == 8) {
      uVar1 = 7;
      do {
        if (((uint)*glyph_bits & 1 << (uVar1 & 0xff)) == 0) {
          *out_pixels = 0;
        }
        else {
          *out_pixels = 1;
        }
        out_pixels = out_pixels + 1;
        uVar1 = uVar1 - 1;
      } while (-1 < (int)uVar1);
    }
    else if (bits_per_row == 0x10) {
      uVar2 = pack_word_byte(0,*glyph_bits,1);
      uVar1 = pack_word_byte(uVar2,glyph_bits[1],0);
      uVar3 = 0xf;
      do {
        if ((uVar1 & 0xffff & 1 << (uVar3 & 0xff)) == 0) {
          *out_pixels = 0;
        }
        else {
          *out_pixels = 1;
        }
        out_pixels = out_pixels + 1;
        uVar3 = uVar3 - 1;
      } while (-1 < (int)uVar3);
    }
    uVar2 = 1;
  }
  return uVar2;
}



// was FUN_000113b4
void load_font_metrics()

{
  int iVar1;
  byte bVar2;
  byte *pbVar3;
  int iVar4;
  ushort *puVar5;
  
  g_font_line_height = *(undefined2 *)(DAT_000879b0 + 6);
  g_font_row_stride = *(undefined2 *)(DAT_000879b0 + 8);
  DAT_000a85b0 = *(undefined2 *)(DAT_000879b0 + 10);
  DAT_000a85b8 = *(short *)(DAT_000879b0 + 2);
  g_font_glyph_data_base = (byte *)DAT_000890a4;
  iVar1 = (int)DAT_000a85b8;
  puVar5 = &DAT_000890b0;
  pbVar3 = (byte *)(DAT_000890a4 + iVar1);
  iVar4 = 0x80;
  do {
    bVar2 = *pbVar3;
    iVar4 = iVar4 + -1;
    pbVar3 = pbVar3 + iVar1 + 1;
    *puVar5 = (ushort)bVar2;
    puVar5 = puVar5 + 1;
  } while (iVar4 != 0);
  return;
}




// was FUN_00040d00
bool select_active_font(char *font_filename)
{
  char stack0xffdc3248_buf [256];
  char *stack0xffdc3248_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char acStack_110 [260];
  
  pcVar2 = (char *)&DAT_0023cca8;
    stack0xffdc3248_ptr = acStack_110;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3248_ptr = cVar1; stack0xffdc3248_ptr = stack0xffdc3248_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_110,s__DATA__00085970);
  ce_strcat(acStack_110,font_filename);
  iVar3 = open_file_for_read(acStack_110);
  if (iVar3 != -1) {
    DAT_0020250c = 1;
    read_file_handle(iVar3,DAT_000879b0,0xc);
    /* Was `((int)DAT_000879b0[1] + (int)*DAT_000879b0) * 0x80` -- reads header bytes 0 and 1 (both
       always 1 and 0 across every font file checked) giving a constant 128-byte read regardless of
       the font. load_font_metrics (called right after) walks this buffer with a real per-glyph... */
    read_file_handle(iVar3,DAT_000890a4,0x1080);
    CloseHandle(iVar3);
    load_font_metrics();
  }
  return iVar3 != -1;
}



// was FUN_000228ac -- sets one byte of a 16-bit word, keeping the other byte from param_1:
// param_3==0 keeps param_1's high byte and sets the low byte from param_2; param_3!=0 keeps
// param_1's low byte and sets the high byte from param_2 (shifted up).
uint pack_word_byte(uint word, uint new_byte, int into_high_byte)
{
  uint uVar1;
  
  if (into_high_byte == 0) {
    uVar1 = word & 0xff00 | new_byte & 0xff;
  }
  else {
    uVar1 = word & 0xff | (new_byte & 0xff) << 8;
  }
  return uVar1;
}





// was FUN_000229e0 -- itoa-style integer-to-string helper: writes param_1's string representation
// in base param_3 into buffer param_2 (via the s_0123456789ABCDEF_00084a28 digit table)...
/* Real arity is 3 (value, buffer, radix): ARM 0x229e0 reads r0-r2 only. Ghidra's param_4 was a
   scratch register (the pad-character local) that all 21 call sites correctly leave unset. */
void itoa_radix(int value, char *buffer, int radix)
{
  undefined1 pad_char;
  char cVar1;
  int extraout_r1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  /* acStack_41[31] and local_22[2] were separate Ghidra locals, but their names encode adjacent
     stack offsets in the original binary (-0x41 to -0x22 is exactly 31 bytes) and the code walks
     backward from `local_22 + 1` straight into acStack_41... */
  char acStack_41 [33];
  /* buffer - pcVar2 offset-reconstruction idiom (same pattern as expand_pals_bytes): `(int)buffer
     - (int)pcVar2` truncated both real pointers before iVar3's later `pcVar2[iVar3]` re-addition.
     iVar3 itself is reused for a plain int digit-counter earlier in this function... */
  intptr_t offset;
  
  bVar5 = value < 0;
  bVar6 = value == 0;
  if (bVar6) {
    pad_char = 0x30;
  }
  acStack_41[32] = 0;
  if (bVar6) {
    *buffer = pad_char;
    buffer[1] = 0;
  }
  iVar3 = 0x1f;
  if (!bVar6) {
    if (bVar5) {
      value = -value;
    }
    if (0 < value) {
      pcVar2 = acStack_41 + 32;
      do {
        iVar3 = iVar3 + -1;
        pcVar2 = pcVar2 + -1;
        /* Original idiom read the divide helper's remainder back via the extraout_r1
           register-leftover trick (see ordint_divmod's comment) -- one real call now... */
        divmod_result dmr478 = ordint_divmod(radix,value);
        *pcVar2 = s_0123456789ABCDEF_00084a28[dmr478.rem];
        value = dmr478.quot;
      } while (0 < value);
    }
    iVar4 = iVar3;
    if (bVar5) {
      iVar4 = iVar3 + -1;
      acStack_41[iVar3] = '-';
    }
    pcVar2 = acStack_41 + iVar4 + 1;
    offset = (intptr_t)buffer - (intptr_t)pcVar2;
    do {
      cVar1 = *pcVar2;
      pcVar2[offset] = cVar1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
  }
}


// was FUN_0003894c -- initializes the glyph-width lookup table (DAT_00110a78, 0xa0/160 entries) for
// the currently-loaded font: the first 0x60 entries default to 0xffff ("no glyph"/fixed-width
// fallback), while entries 0x60-0x9f are read from the real font data...
void init_glyph_width_table()

{
  int iVar1;
  char *iVar2;
  int iVar3;
  ushort uVar4;
  int iVar5;
  uint uVar6;

  /* DAT_00110fc8 (and DAT_00110fcc, used identically a bit further down) are real pointers (`char
     *`) but are never assigned anywhere in this decompile -- whatever originally set them up... */
  if (DAT_00110fc8 == 0) {
    return;
  }
  iVar2 = DAT_00110fc8;
  DAT_00189570 = 99;
  DAT_00189572 = 0x30;
  DAT_00189574 = 0x50;
  DAT_00110fc0 = DAT_00110fc8;
  iVar3 = 0;
  do {
    DAT_00201b18[iVar3] = (char)iVar3;
    DAT_00110bc0[iVar3 * 0x10] = 0xffff;
    DAT_00110fd0[iVar3] = 0;
    iVar1 = (iVar3 + 1) * 0x10000;
    iVar5 = iVar1 >> 0x10;
    DAT_00110a78[iVar3] = 0xffff;
    iVar3 = iVar5;
  } while (iVar5 < 0x20);
  iVar3 = (int)(short)((uint)iVar1 >> 0x10);
  while (iVar3 < 0x60) {
    DAT_00110a78[iVar3] = 0xffff;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    iVar5 = iVar3;
  }
  for (iVar3 = (int)(short)iVar5; iVar3 < 0xa0; iVar3 = (iVar3 + 1) * 0x10000 >> 0x10) {
    uVar4 = *(ushort *)(iVar3 * 2 + iVar2 + -0x158);
    uVar6 = (uint)uVar4;
    if (uVar6 != 0xffffffff) {
      uVar4 = uVar4 >> 1;
    }
    if (uVar6 != 0xffffffff) {
      DAT_00110a78[iVar3] = uVar4;
    }
    else {
      DAT_00110a78[iVar3] = 0xffff;
    }
  }
  DAT_00110fc4 = 0x1f;
  DAT_00189588 = 0x20;
  return;
}


// was FUN_00038a8c -- computes a catalog sprite/texture id's stored width value from the
// glyph/sprite data table (DAT_00110fc8).
int get_catalog_sprite_width(int sprite_id)
{
  return (sprite_id + 0x7ff4) * 2 + (uint)(ushort)(uintptr_t)DAT_00110fc8;
}



// was FUN_00038ab0 -- saves the current draw-command list write
// cursor (DAT_00110fc0) into DAT_00110bb8.
void save_draw_command_cursor()

{
  DAT_00110bb8 = DAT_00110fc0;
  return;
}



// was FUN_00038acc -- one-time bootstrap: resets the draw-command list write cursor (DAT_00110fc0)
// to its buffer base (DAT_00110fcc).
void init_draw_command_cursor()

{
  DAT_00110fc0 = DAT_00110fcc;
  return;
}



// was FUN_00038ae8 -- emits a glyph/sprite reference (param_1, a catalog id; param_2 a value used
// only for the special id 0xa0) into the draw-command list at the write cursor.
void emit_glyph_draw_command(uint glyph_id, short value)
{
  byte bVar1;
  char *psVar2;
  byte *pbVar3;
  
  glyph_id = glyph_id & 0xff;
  if (glyph_id == 0xa0) {
    DAT_00201b38 = (undefined2)((int)(DAT_00110fc0 - DAT_00110fc8) >> 1);
    psVar2 = DAT_00110fc0;
    DAT_00201b10 = value;
  }
  else {
    if (DAT_00110a78[glyph_id] != -1) {
      *DAT_00110fc0 =
           (((short)((int)(DAT_00110fc0 - DAT_00110fc8) >> 1) + 1) * 0x7fff + DAT_00110a78[glyph_id]
           ) * 2;
      goto LAB_00038c04;
    }
    pbVar3 = DAT_00110fd0 + glyph_id;
    if ((*pbVar3 == 0x10) || (0x1f < glyph_id)) {
      terminate_process(0xffffffec);
    }
    psVar2 = DAT_00110fc0;
    bVar1 = *pbVar3;
    DAT_00110bc0[(uint)bVar1 + glyph_id * 0x10] = (short)((int)(DAT_00110fc0 - DAT_00110fc8) >> 1);
    *pbVar3 = bVar1 + 1;
  }
  *psVar2 = 0;
LAB_00038c04:
  DAT_00110fc0 = DAT_00110fc0 + 1;
}



// was FUN_00038c14 -- finalizes a glyph/sprite id's draw-command entry (param_1): computes its
// width from the current cursor delta and records it in DAT_00110a78, then backpatches every
// pending reference emit_glyph_draw_command recorded for it.
void finalize_glyph_draw_command(uint glyph_id)
{
  int iVar1;
  char *iVar2;

  /* Same never-initialized-in-this-decompile DAT_00110fc8 issue documented
     on its sibling function above (see that comment) -- guard this one the
     same way instead of dereferencing NULL. */
  if (DAT_00110fc8 == 0) {
    return;
  }
  iVar2 = DAT_00110fc8;
  glyph_id = glyph_id & 0xff;
  if (glyph_id == 0xa0) {
    *(ushort *)(DAT_00110fc8 + (uint)DAT_00201b38 * 2) =
         ((DAT_00201b10 + DAT_00201b38) * 0x7fff + (short)((DAT_00110fc0 - DAT_00110fc8) >> 1)) * 2;
  }
  else {
    DAT_00110a78[glyph_id] = (short)((DAT_00110fc0 - DAT_00110fc8) >> 1);
    if ((glyph_id < 0x20) && (DAT_00110fd0[glyph_id] != 0)) {
      iVar1 = 0;
      do {
        *(ushort *)(iVar2 + (uint)(ushort)DAT_00110bc0[glyph_id * 0x10 + iVar1] * 2) =
             ((DAT_00110bc0[glyph_id * 0x10 + iVar1] + 1) * 0x7fff + DAT_00110a78[glyph_id]) * 2
        ;
        iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
        iVar2 = DAT_00110fc8;
      } while (iVar1 < (int)(uint)(byte)DAT_00110fd0[glyph_id]);
    }
  }
}

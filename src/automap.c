/* The automap screen: entering/exiting automap mode, and drawing the revealed tile grid (cell
   walls/doors, edges) into the automap view. Split out of uw.c (the original monolithic decompile)
   once these functions' real roles were confirmed. */
#include "headers/automap.h"
#include "headers/options.h"
#include <stdio.h>
#include <stdlib.h>

/* scroll_text_entry_prompt (hud.c)'s "a raw text field is actively reading keystrokes right now"
   flag -- see its own extern/comment in gx_stub.c, its set/clear in hud.c... */
extern int g_text_input_active;

static int DAT_000bbefc;
/* Retain BLNKMAP.BYT's indices while drawing the map. RGB565 loses
   palette identity (some entries share a color), so the DOS tint cannot
   reliably recover the original index from the displayed pixel. */
static byte *g_automap_tint_bitmap;
static undefined2 DAT_000b99c0;
static undefined4 DAT_000b99c4;
/* Sizing-audit pass: `ce_memset(&DAT_000b99d0,0,0x1000)` and
   write_archive_entry's matching 0x1000-byte archive write (64x64
   reveal grid) -- exact HARD bound. Down from 8192. */
 undefined1 DAT_000b99d0_backing[4096];
static short DAT_000ba9d0;
undefined4 DAT_000bbef4;
/* Was a lone `undefined` scalar; draw_automap_tiles indexes it as `(&DAT_000842f0)[shape - 2]`
   (shape 2-5, the diagonal tile types) to pick the base wall-edge direction for a diagonal cell.
   Real 4 bytes from UU.exe .data at 0x842f0. */
static const unsigned char DAT_000842f0_real_table[4] = { 0x01, 0x02, 0x00, 0x03 };
#define DAT_000842f0 (*(undefined1 *)DAT_000842f0_real_table)
/* Was a lone 1-byte scalar, but indexed throughout this file as a tile-type-flags lookup table
   (nibble-masked indices in most call sites, but some -- e.g. advance_visibility_ray -- index it
   with an unmasked byte value read from another table). */
 undefined1 DAT_000878d0_backing[256] = {
  0x1e, 0x00, 0x13, 0x15, 0x0b, 0x0d, 0x20, 0x20,
  0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e,
};
/* Was a lone `undefined1` scalar, but draw_automap_cell indexes it as a real 5x3x3 (45-entry)
   shape-pattern table: `(&DAT_000842c0)[((shape-1)*3+row)*3+col]`, shape=1-5... */
static const unsigned char DAT_000842c0_real_table[64] = {
  1, 1, 1, 1, 1, 1, 1, 1, 1,
  2, 1, 1, 0, 2, 1, 0, 0, 2,
  1, 1, 2, 1, 2, 0, 2, 0, 0,
  0, 0, 2, 0, 2, 1, 2, 1, 1,
  2, 0, 0, 1, 2, 0, 1, 1, 2,
};
#define DAT_000842c0 (*(undefined1 *)DAT_000842c0_real_table)
static char DAT_000ba9d4;
/* Lone-scalar-used-as-4-entry-array, same as DAT_000842f0 above. draw_automap_door_edge indexes
   `(&DAT_000842f4)[dir]` / same for f8 as signed-char dx / dy deltas per direction. Real bytes from
   UU.exe .data at 0x842f4 / 0x842f8. */
static const signed char DAT_000842f4_real_table[4] = { -1, 0, -1, 1 };
#define DAT_000842f4 (*(undefined1 *)DAT_000842f4_real_table)
static const signed char DAT_000842f8_real_table[4] = { 0, -1, -1, -1 };
#define DAT_000842f8 (*(undefined1 *)DAT_000842f8_real_table)
static short DAT_000bbef0;
char s_font4x5p_sys_0008431c[] = "font4x5p.sys";
/* Sizing pass: hard-capped at 100 records (`if (DAT_000bbef0 != 100)` guard) with a 0x36 (54)-byte
   stride, and the literal 0x1518 (5400 = 100*54) total is baked directly into a ce_memmove call on
   this array -- an airtight, exact real size. */
static char DAT_000ba9d8_backing[5400]; /* 100 x {char text[50]; short x, y} note records */
#define DAT_000ba9d8 DAT_000ba9d8_backing[0]
/* DAT_000baa0a/b (and the parallel DAT_000baa0c/d pair below) are a note label's X (resp. Y) screen
   position, written as separate low/high bytes at the same index... */
#define DAT_000baa0a DAT_000ba9d8_backing[50]
#define DAT_000baa0b DAT_000ba9d8_backing[51]
#define DAT_000baa0c DAT_000ba9d8_backing[52]
#define DAT_000baa0d DAT_000ba9d8_backing[53]
static undefined2 DAT_000b99c8;
char s_fontbig_sys_0008432c[] = "fontbig.sys";
static char s__DATA_blnkmap_byt_00084338[] = "\\DATA\\blnkmap.byt";
char *DAT_002029cc;






// was FUN_00016354
void enter_automap_screen()
{
  if (DAT_000bbefc == 0) {
    register_key_binding(0x1b,1,2,change_game_mode);
    DAT_000bbefc = 1;
  }
  set_pending_music_track(0xd);
  update_ingame_music_track();
  save_automap_reveal_to_archive(0,(int)DAT_00201b68);
  draw_automap_screen((int)DAT_00201b68);
  DAT_000b99c0 = register_click_region(0,200,0x13f,1,0,2,handle_automap_note_click);
  set_cursor_confine_rect(0,199,0x13f,0);
  decrement_cursor_hide_depth();
  push_cursor_icon(0x1078);
  cursor_show_idle_tick();
  DAT_000b99c4 = 0;
}




// was FUN_0001651c
void exit_automap_screen()
{
  int iVar1;
  undefined1 auStack_1c [16];
  
  decrement_cursor_hide_depth();
  unregister_key_binding((int)DAT_000b99c0);
  pop_cursor_icon(0);
  save_automap_notes_to_archive((int)DAT_000ba9d0);
  if ((DAT_000ba9d0 != DAT_00201b68) &&
     (iVar1 = open_level_archive(auStack_1c,s__SAVE0_lev_ark_000842fc), iVar1 != 0)) {
    load_automap_reveal_from_archive(auStack_1c,(int)DAT_00201b68);
    close_level_archive(auStack_1c);
  }
  pick_random_pending_music_track();
  clear_screen_and_restore_cursor();
  DAT_000bbef4 = 0;
  reset_cursor_confine_rect();
  cursor_show_idle_tick();
}




// was FUN_000165d0
void draw_automap_tiles()
{
  char cVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int local_3c;
  int local_34 [4];
  
  local_3c = 1;
  do {
    iVar6 = 1;
    do {
      uVar4 = (byte)(&DAT_000b99d0)[local_3c * 0x40 + iVar6] & 0xf;
      uVar5 = (uint)(short)uVar4;
      if ((uVar5 != 0) && (uVar5 < 10)) {
        draw_automap_cell(uVar4,iVar6,local_3c);
        ce_memset(local_34,0,0x10);
        if (((&DAT_000878d0)[uVar5] & 1) == 0) {
          iVar2 = 0;
          do {
            iVar3 = draw_automap_cell_edge(iVar2,iVar6,local_3c);
            local_34[iVar2] = iVar3;
            iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
          } while (iVar2 < 4);
        }
        else {
          cVar1 = (&DAT_000842f0)[(int)((uVar4 - 2) * 0x10000) >> 0x10];
          iVar2 = draw_automap_cell_edge((int)cVar1,iVar6,local_3c);
          local_34[(short)cVar1] = iVar2;
          uVar5 = (int)cVar1 + 1U & 3;
          iVar2 = draw_automap_cell_edge(uVar5,iVar6,local_3c);
          local_34[(short)uVar5] = iVar2;
        }
        uVar5 = 0;
        do {
          if ((local_34[uVar5] != 0) && (local_34[uVar5 + 1 & 3] != 0)) {
            darken_pixel((((int)((uVar5 & 2) * -0x20000) >> 0x10) +
                         ((iVar6 * 3 + 10) * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                         (((int)((uVar5 & 2) * -0x20000) >> 0x10) +
                         ((local_3c * 3 + 7) * 0x10000 >> 0x10)) * 0x10000 >> 0x10,3,2);
          }
          uVar5 = (int)((uVar5 + 1) * 0x10000) >> 0x10;
        } while ((int)uVar5 < 4);
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < 0x3f);
    local_3c = (local_3c + 1) * 0x10000 >> 0x10;
  } while (local_3c < 0x3f);
}



// was FUN_000167d4
int draw_automap_cell_edge(short edge, int x, int y)
{
  byte bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  
  iVar6 = x * 3;
  iVar2 = y * 3;
  iVar3 = iVar6 + 7;
  iVar7 = iVar2 + 4;
  if (edge == 0) {
    y = y + 1;
  }
  else if (edge == 1) {
    x = x + 1;
  }
  else if (edge == 2) {
    y = y + -1;
  }
  else if (edge == 3) {
    x = x + -1;
  }
  bVar1 = (&DAT_000b99d0)[(short)y * 0x40 + (int)(short)x] & 0xf;
  if ((bVar1 != 0) && (bVar1 < 10)) {
    return 0;
  }
  if (bVar1 == 0xb) {
    uVar4 = 0;
    uVar5 = 4;
  }
  else {
    uVar4 = 6;
    uVar5 = 2;
  }
  if (edge == 0) {
    iVar7 = iVar2 + 8;
LAB_000168f8:
    iVar2 = 0;
    do {
      darken_pixel((iVar2 + (iVar3 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,iVar7 + -1,uVar4,uVar5);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
  }
  else {
    if (edge == 1) {
      iVar3 = iVar6 + 0xb;
    }
    else {
      if (edge == 2) goto LAB_000168f8;
      if (edge != 3) {
        return 1;
      }
    }
    iVar2 = 0;
    do {
      darken_pixel(iVar3 + -1,((iVar7 * 0x10000 >> 0x10) + iVar2) * 0x10000 >> 0x10,uVar4,uVar5);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
  }
  return 1;
}




// was FUN_00016948
void draw_automap_cell(int cell_type, int tile_x, int tile_y)
{
  byte bVar1;
  byte bVar2;
  short sVar3;
  short extraout_r1;
  short extraout_r1_00;
  undefined4 uVar4;
  int iVar5;
  ushort uVar6;
  undefined4 uVar7;
  uint uVar8;
  uint uVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  
  if ((short)cell_type != 0) {
    if (5 < (short)cell_type) {
      cell_type = 1;
    }
    bVar1 = (byte)(&DAT_000b99d0)[(short)tile_y * 0x40 + (int)(short)tile_x] >> 4 & 3;
    bVar2 = (byte)(&DAT_000b99d0)[(short)tile_y * 0x40 + (int)(short)tile_x] >> 4 & 0xfc;
    iVar11 = tile_y * 3 + 4;
    iVar10 = tile_x * 3 + 7;
    uVar9 = 0;
    uVar13 = 0;
    do {
      uVar8 = 0;
      uVar12 = 0;
      do {
        if ((&DAT_000842c0)[(((cell_type + -1) * 0x10000 >> 0x10) * 3 + uVar12) * 3 + uVar13] ==
            '\x01') {
          if (bVar1 == 0) {
            /* ARM 0x16a20..0x16acc retains DOS floor tint (2,3). */
            uVar7 = 3;
            uVar4 = 2;
            goto LAB_00016acc;
          }
          if (bVar1 == 1) {
            /* Water fill: (rand % 2) + 0xb1 -> a 2-tone dither between palette 0xb1/0xb2, not a
               flat 0xb1. */
            iVar5 = ordint_divmod(2,(int)ce_rand()).rem + 0xb1;
          }
          else {
            if (bVar1 != 2) goto LAB_00016b00;
            iVar5 = ((int)ce_rand() & 1) + 0xb5;
          }
          plot_pixel(((int)(short)uVar9 + (iVar10 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                       (((iVar11 * 0x10000 >> 0x10) * -0x10000 >> 0x10) - uVar8) + 200,iVar5);
          g_automap_tint_bitmap[(199 - iVar11 - (short)uVar8) * 320 +
                               iVar10 + (short)uVar9] = (byte)iVar5;
        }
        else if ((&DAT_000842c0)[(((cell_type + -1) * 0x10000 >> 0x10) * 3 + uVar12) * 3 + uVar13] ==
                 '\x02') {
          uVar7 = 2;
          uVar4 = 6;
LAB_00016acc:
          darken_pixel(((int)(short)uVar9 + (iVar10 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,
                       ((int)(short)uVar8 + (iVar11 * 0x10000 >> 0x10)) * 0x10000 >> 0x10,uVar4,
                       uVar7);
        }
LAB_00016b00:
        uVar8 = uVar12 + 1 & 0xffff;
        uVar12 = uVar12 + 1 & 0xffff;
      } while (uVar12 < 3);
      uVar9 = uVar13 + 1 & 0xffff;
      uVar13 = uVar13 + 1 & 0xffff;
    } while (uVar13 < 3);
    if (bVar2 == 4) {
      draw_automap_door_edge((int)(short)tile_x,(int)(short)tile_y,iVar10,iVar11);
    }
    else if (bVar2 == 8) {
      uVar9 = 0;
      do {
        uVar13 = 0;
        uVar6 = 0;
        do {
          sVar3 = rand_below(3);
          plot_pixel(uVar13 + (int)(short)((uint)(iVar10 * 0x10000) >> 0x10),
                       (((iVar11 * 0x10000 >> 0x10) * -0x10000 >> 0x10) - uVar9) + 200,sVar3 + 0xe9)
          ;
          g_automap_tint_bitmap[(199 - iVar11 - (short)uVar9) * 320 +
                               iVar10 + (short)uVar13] = (byte)(sVar3 + 0xe9);
          uVar6 = uVar6 + 1;
          uVar13 = (uint)uVar6;
        } while (uVar6 < 3);
        uVar9 = uVar9 + 1;
      } while ((uVar9 & 0xffff) < 3);
    }
    else if ((bVar2 == 0xc) || (bVar2 == 0x10)) {
      uVar9 = 0;
      do {
        uVar13 = 0;
        uVar6 = 0;
        do {
          darken_pixel(uVar9 + (int)(short)((uint)(iVar10 * 0x10000) >> 0x10),
                       uVar13 + (int)(short)((uint)(iVar11 * 0x10000) >> 0x10),6,3);
          uVar6 = uVar6 + 1;
          uVar13 = (uint)uVar6;
        } while (uVar6 < 3);
        uVar9 = uVar9 + 1;
      } while ((uVar9 & 0xffff) < 3);
    }
  }
}



// was FUN_00016c70
void draw_automap_door_edge(short tile_x, short tile_y, int pixel_x, int pixel_y)
{
  int iVar1;
  int iVar2;
  
  pixel_y = pixel_y + 1;
  pixel_x = pixel_x + 1;
  darken_pixel(pixel_x,pixel_y,6,3);
  iVar2 = 0;
  DAT_000ba9d4 = '\0';
  while( true ) {
    if ((((&DAT_000b99d0)
          [(int)tile_x + ((int)tile_y + (int)(char)(&DAT_000842f4)[iVar2]) * 0x40 +
           (int)(char)(&DAT_000842f8)[iVar2]] & 0xf) == 1) ||
       (((&DAT_000b99d0)
         [(((int)tile_y - (int)(char)(&DAT_000842f4)[iVar2]) * 0x40 -
          (int)(char)(&DAT_000842f8)[iVar2]) + (int)tile_x] & 0xf) == 1)) break;
    iVar1 = (iVar2 + 1) * 0x1000000;
    iVar2 = iVar1 >> 0x18;
    DAT_000ba9d4 = (char)((uint)iVar1 >> 0x18);
    if (3 < iVar2) {
      return;
    }
  }
  darken_pixel(pixel_x + (char)(&DAT_000842f4)[(char)iVar2],
               pixel_y + (char)(&DAT_000842f8)[(char)iVar2],6,3);
  darken_pixel(pixel_x - (char)(&DAT_000842f4)[DAT_000ba9d4],
               pixel_y - (char)(&DAT_000842f8)[DAT_000ba9d4],6,3);
}




// was FUN_00017908
/* uVar3 was `undefined4` (4 bytes), truncating ce_malloc's real 64-bit malloc'd pointer on this
   host -- same pointer-truncation pattern fixed repeatedly this session. */
void draw_automap_screen(int level_number)
{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  short sVar2;
  void *uVar3;
  char *pcVar4;
  int iVar5;
  char auStack_124 [8];
  char acStack_11c [260];

  uVar3 = ce_malloc(64000);
  decrement_cursor_hide_depth();
  pcVar4 = (char *)&DAT_0023cca8; /* install-dir string (global typed undefined1[]) */
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_blnkmap_byt_00084338);
  iVar5 = read_buffer_from_file(acStack_11c,uVar3,64000);
  if (iVar5 == 0) {
    cursor_show_idle_tick();
    exit_automap_screen();
  }
  else {
    set_viewport_clip_rect(0,0,0x13f,199);
    set_palette_bank(1);
    bitmap_blit_to_framebuffer(0,1,uVar3,200,0x140,0,0,1);
    g_automap_tint_bitmap = uVar3;
    draw_automap_tiles();
    g_automap_tint_bitmap = NULL;
    iVar5 = (int)(short)level_number;
    if ((iVar5 == DAT_00201b68) && (iVar5 != 9)) {
      g_blit_transparent_mode = 1;
      draw_sprite_by_id(0x103f,((g_player_object->npc_xhome) + 2) * 3,
                        ((g_player_object->npc_yhome) + 3) * -3 + 200,
                        5,8);
      g_blit_transparent_mode = 0;
    }
    DAT_000ba9d0 = (short)level_number;
    set_palette_bank(1);
    screen_backup_save();
    load_automap_notes_from_archive(level_number);
    *g_draw_color_index = 0x2d;
    *DAT_00084298 = 0x2d;
    select_active_font(s_fontbig_sys_0008432c);
    itoa_radix(iVar5,auStack_124,10);
    sVar2 = measure_text_width(auStack_124);
    iVar5 = (int)sVar2;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 1;
    }
    draw_text_string(auStack_124,0x121 - (short)(iVar5 >> 1),6);
    select_active_font(s_font5x6p_sys_0008430c);
  }
  DAT_000bbef4 = 1;
  cursor_show_idle_tick();
  LocalFree(uVar3);
}


/* Reveal every walkable tile of the current level's automap in a single pass -- no ring-walk, no
   dungeon redraw. */
void automap_reveal_all_tiles()
{
  int x;
  int y;
  int shape;
  byte *rec;
  byte *dst;

  for (y = 0; y < 64; y = y + 1) {
    for (x = 0; x < 64; x = x + 1) {
      rec = (byte *)(DAT_002029cc + (x + y * 0x40) * 4);
      shape = *rec & 0xf;
      if ((shape >= 1) && (shape < 10)) {
        dst = (byte *)(&DAT_000b99d0) + (y * 0x40 + x);
        if (*dst == 0) {
          *dst = automap_reveal_byte(rec);
        }
      }
    }
  }
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00016940
void darken_pixel(uint x, int y, int amount, int divisor)
{
  ushort *puVar1;

  puVar1 = (ushort *)
           ((g_uw_framebuffer) +
           ((200U - y & 0xffff) * 0x140 + (x & 0xffff)) * 2);
  /* Restore the DOS palette tint using the shade arguments still passed by ARM callers; ARM
     replaced this with fixed RGB565 halving. The original takes two random draws, discarding the
     first result. ce_rand uses host rand(), so mask to DOS/WinCE's 15-bit range. */
  int step = 0x7fff / divisor;
  (void)ce_rand();
  int roll = (ce_rand() & 0x7fff) / step;
  /* The map bitmap is blitted at screen row 1, whereas darken_pixel's
     coordinates are measured upwards from row 200. Keep the indexed
     pixel updated too, so overlapping strokes tint cumulatively. */
  byte *index = g_automap_tint_bitmap +
      (199 - y) * 320 + (x & 0xffff);
  *index = (byte)(*index + amount + roll);
  *puVar1 = (&g_palette_rgb565)[*index];
}





// was FUN_00016434 -- writes the DAT_000b99d0 automap-reveal buffer (64x64 grid, one nibble/byte
// per tile -- see automap.c's readers) to archive entry param_2+0x1a.
int save_automap_reveal_to_archive(byte *archive, int level_number)
{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined1 *puVar4;
  int iVar5;
  undefined1 *puVar6;
  undefined1 auStack_1c [16];
  
  if (archive == (undefined1 *)0x0) {
    iVar2 = open_level_archive(auStack_1c,s__SAVE0_lev_ark_000842fc);
    if (iVar2 == 0) {
      return 0;
    }
  }
  else {
    iVar2 = 0xf;
    puVar4 = archive;
    puVar6 = auStack_1c;
    do {
      iVar3 = iVar2 + -1;
      *puVar6 = *puVar4;
      bVar1 = 0 < iVar2;
      iVar2 = iVar3;
      puVar4 = puVar4 + 1;
      puVar6 = puVar6 + 1;
    } while (iVar3 != 0 && bVar1);
  }
  iVar2 = write_archive_entry(auStack_1c,level_number + 0x1a,&DAT_000b99d0,0x1000);
  if (archive == (undefined1 *)0x0) {
    close_level_archive(auStack_1c);
  }
  else {
    iVar3 = 0xf;
    puVar4 = auStack_1c;
    do {
      iVar5 = iVar3 + -1;
      *archive = *puVar4;
      bVar1 = 0 < iVar3;
      iVar3 = iVar5;
      puVar4 = puVar4 + 1;
      archive = archive + 1;
    } while (iVar5 != 0 && bVar1);
  }
  if (iVar2 == 0) {
    return 0;
  }
  return 1;
}



// was FUN_000164e4 -- reads archive entry param_2+0x1a back into the
// DAT_000b99d0 automap-reveal buffer (the read-side counterpart to
// save_automap_reveal_to_archive).
/* .ark handle-struct pointer -- was `undefined4`, truncating it before read_archive_entry. */
int load_automap_reveal_from_archive(byte *archive, int level_number)
{
  short sVar1;
  undefined4 uVar2;
  
  sVar1 = read_archive_entry(archive,level_number + 0x1a,&DAT_000b99d0);
  if ((sVar1 == 0) || (uVar2 = 0, sVar1 == 0x1000)) {
    uVar2 = 1;
  }
  return uVar2;
}



// was FUN_000165bc
void clear_automap_reveal_buffer()
{
  ce_memset(&DAT_000b99d0,0,0x1000);
}




// was FUN_00016d7c -- given two note-button label records (param_1, param_2) and a click point
// (param_3,param_4), measures each label's rendered text-box distance to the click and returns
// whichever pointer is closer (used by handle_automap_note_click's hit-testing).
char *pick_closer_note_label(char *label_a, char *label_b, short click_x, short click_y)
{
  uint uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  char cVar5;
  short sVar6;
  char *pcVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  char acStack_50 [52];
  
  pcVar7 = label_b;
  if ((label_a != (char *)0x0) && (pcVar7 = label_a, label_b != (char *)0x0)) {
    do {
      cVar5 = *pcVar7;
      acStack_50[pcVar7 - label_a] = cVar5;
      pcVar7 = pcVar7 + 1;
    } while (cVar5 != '\0');
    sVar6 = measure_text_width(acStack_50);
    iVar8 = (int)sVar6;
    if (iVar8 < 0) {
      iVar8 = iVar8 + 1;
    }
    uVar9 = ((iVar8 >> 1) - (int)click_x) + (int)*(short *)(label_a + 0x32);
    uVar1 = (int)uVar9 >> 0x1f;
    uVar10 = ((int)click_y - (int)*(short *)(label_a + 0x34)) + 0xca;
    uVar2 = (int)uVar10 >> 0x1f;
    pcVar7 = label_b;
    do {
      cVar5 = *pcVar7;
      acStack_50[pcVar7 - label_b] = cVar5;
      pcVar7 = pcVar7 + 1;
    } while (cVar5 != '\0');
    sVar6 = measure_text_width(acStack_50);
    iVar8 = (int)sVar6;
    if (iVar8 < 0) {
      iVar8 = iVar8 + 1;
    }
    uVar11 = ((iVar8 >> 1) - (int)click_x) + (int)*(short *)(label_b + 0x32);
    uVar3 = (int)uVar11 >> 0x1f;
    uVar12 = ((int)click_y - (int)*(short *)(label_b + 0x34)) + 0xca;
    uVar4 = (int)uVar12 >> 0x1f;
    pcVar7 = label_b;
    if (((int)(((uVar12 ^ uVar4) - uVar4) * 0x10000) >> 0x10 <=
         (int)(short)(((uVar10 ^ uVar2) - uVar2) * 0x10000 >> 0x10)) &&
       ((int)(short)(((uVar9 ^ uVar1) - uVar1) * 0x10000 >> 0x10) <=
        (int)(((uVar11 ^ uVar3) - uVar3) * 0x10000) >> 0x10)) {
      pcVar7 = label_a;
    }
  }
  return pcVar7;
}



// was FUN_00016ef8 -- automap "add/edit note" click handler: resolves where the player clicked (map
// area vs. UI chrome), places, edits, or removes a note into the DAT_000ba9d8 note-text array, and
// can invoke switch_automap_level_display for the level-page navigation arrows.
void handle_automap_note_click()
{
  char cVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  int iVar7;
  int iVar8;
  char *pcVar9;
  int iVar10;
  short local_60;
  short local_5e;
  char local_5c [2];
  short local_5a;
  char local_58 [52];
  
  *g_draw_color_index = 0x2d;
  *DAT_00084298 = 0x2d;
  local_5e = *DAT_00085a6c;
  local_60 = 200 - DAT_00085a6c[1];
  if (3 < DAT_00085a6c[3]) {
    return;
  }
  wait_for_click_release(1);
  if ((((local_5e < 0x105) || (0x13f < local_5e)) || (0xb4 < local_60)) || (local_60 < 0x96)) {
    if (((local_5e < 0x105) || (0x13f < local_5e)) || ((0x94 < local_60 || (local_60 < 0x77)))) {
      if (local_5e < 0x114) {
LAB_000170bc:
        sVar2 = 0xfe;
      }
      else if (((local_5e < 0x140) && (local_60 < 0x11)) && (1 < local_60)) {
        sVar2 = 0xfc;
      }
      else if ((((local_5e < 0x114) || (0x13f < local_5e)) || (199 < local_60)) ||
              (sVar2 = 0xfb, local_60 < 0xb7)) goto LAB_000170bc;
    }
    else {
      sVar2 = 0xfd;
      set_cursor_confine_rect(0,199,0x13f,0);
      decrement_cursor_hide_depth();
      push_cursor_icon(0x1079);
      cursor_show_idle_tick();
      do {
        sVar3 = next_input_event();
      } while (sVar3 != 1);
      {
        short mouse_x, mouse_y;
        get_mouse_position(&mouse_x,&mouse_y);
        local_5e = (short)mouse_x;
        local_60 = (short)mouse_y;
      }
      set_cursor_confine_rect(0,199,0x13f,0);
      pop_cursor_icon(1);
    }
  }
  else {
    sVar2 = 0xff;
    change_game_mode(1);
  }
  if (sVar2 == 0xfb) {
    if (0x62 < DAT_000ba9d0) goto LAB_0001764c;
    iVar10 = DAT_000ba9d0 + 1;
  }
  else {
    if (sVar2 != 0xfc) {
      if (sVar2 == 0xfd) {
        if (0 < DAT_000bbef0) {
          pcVar5 = (char *)0x0;
          iVar10 = 0;
          iVar7 = (int)local_5a;
          do {
            iVar8 = iVar10 * 0x36;
            pcVar9 = &DAT_000ba9d8 + iVar8;
            pcVar6 = pcVar9;
            do {
              cVar1 = *pcVar6;
              local_58[pcVar6 - pcVar9] = cVar1;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
            sVar2 = measure_text_width(local_58);
            if (((int)*(short *)(&DAT_000baa0a + iVar8) <= (int)local_5e) &&
               ((int)local_5e <= (int)*(short *)(&DAT_000baa0a + iVar8) + (int)sVar2)) {
              if (((int)local_60 <= *(short *)(&DAT_000baa0c + iVar8) + 5) &&
                 (((int)*(short *)(&DAT_000baa0c + iVar8) <= (int)local_60 &&
                  (pcVar5 = (char *)pick_closer_note_label(pcVar5,pcVar9,local_5e,local_60), pcVar5 == pcVar9)))) {
                iVar7 = iVar10;
              }
            }
            iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
          } while (iVar10 < DAT_000bbef0);
          if (pcVar5 != (char *)0x0) {
            DAT_000b99c4 = 1;
            pcVar6 = pcVar5;
            do {
              cVar1 = *pcVar6;
              local_58[pcVar6 - pcVar5] = cVar1;
              pcVar6 = pcVar6 + 1;
            } while (cVar1 != '\0');
            iVar10 = measure_text_width(local_58);
            set_draw_color(0x1a);
            rect_fill_or_save_restore((uint)*(ushort *)(pcVar5 + 0x32),(uint)*(ushort *)(pcVar5 + 0x34),
                         (uint)*(ushort *)(pcVar5 + 0x32) + iVar10,*(ushort *)(pcVar5 + 0x34) + 5);
            screen_backup_restore_rect((uint)*(ushort *)(pcVar5 + 0x32),(uint)*(ushort *)(pcVar5 + 0x34),
                         (uint)*(ushort *)(pcVar5 + 0x32) + iVar10,*(ushort *)(pcVar5 + 0x34) + 5);
            if ((int)(short)iVar7 == DAT_000bbef0 + -1) {
              DAT_000bbef0 = (short)(DAT_000bbef0 + -1);
            }
            else {
              iVar10 = (short)iVar7 * 0x36;
              (&DAT_000baa0a)[iVar10] = '\xff';
              (&DAT_000baa0b)[iVar10] = '\xff';
            }
            draw_automap_notes();
          }
        }
        cursor_show_idle_tick();
        goto LAB_0001764c;
      }
      if (sVar2 != 0xfe) goto LAB_0001764c;
      DAT_000bbef4 = 1;
      DAT_000bbef8 = 1;
      local_5c[1] = 0;
      if (DAT_000bbef0 != 100) {
        iVar7 = DAT_000bbef0 * 0x36;
        select_active_font(s_font4x5p_sys_0008431c);
        push_cursor_icon(0x107a);
        iVar10 = -1;
        (&DAT_000baa0a)[iVar7] = (char)local_5e;
        (&DAT_000baa0b)[iVar7] = (char)((ushort)local_5e >> 8);
        (&DAT_000baa0c)[iVar7] = (char)(local_60 + -4);
        (&DAT_000baa0d)[iVar7] = (char)((uint)(local_60 + -4) >> 8);
        local_58[0] = '\0';
        iVar8 = *(short *)(&DAT_000baa0a + iVar7) + -1;
        warp_mouse_cursor(*(short *)(&DAT_000baa0a + iVar7) + 9,local_60 + -0x12);
        /* Keep command bindings out of the raw text field. This editor
           uppercases each printable character itself through ce_toupper
           below, matching the automap font's available glyphs. */
        g_text_input_active = 1;
LAB_000171bc:
        sVar2 = poll_input_event(0);
        if (sVar2 < 0) goto LAB_000171a4;
        goto LAB_000171d0;
      }
      iVar8 = (int)local_5a;
      goto LAB_00017404;
    }
    if (DAT_000ba9d0 < 2) goto LAB_0001764c;
    iVar10 = DAT_000ba9d0 + -1;
  }
  switch_automap_level_display(iVar10);
LAB_0001764c:
  wait_for_click_release(1);
  return;
LAB_000171a4:
  sVar2 = poll_keyboard_char_input(&local_5a);
  if (0 < sVar2) {
LAB_000171d0:
    if (((sVar2 == 0xd) || (sVar2 == 0x1b)) || (sVar2 < 4)) goto LAB_0001739c;
    if ((sVar2 < 0x20) || (0x7a < sVar2)) {
      if (sVar2 == 8) {
        iVar10 = iVar10 + -1;
        if (iVar10 * 0x10000 >> 0x10 < -1) {
          iVar10 = -1;
        }
        iVar8 = measure_text_width(local_58);
        if (0 < (short)iVar8) {
          set_draw_color(0x1a);
          rect_fill_or_save_restore((uint)*(ushort *)(&DAT_000baa0a + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0c + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0a + iVar7) + iVar8,
                       *(ushort *)(&DAT_000baa0c + iVar7) + 6);
          screen_backup_restore_rect((uint)*(ushort *)(&DAT_000baa0a + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0c + iVar7),
                       (uint)*(ushort *)(&DAT_000baa0a + iVar7) + iVar8,
                       *(ushort *)(&DAT_000baa0c + iVar7) + 6);
        }
      }
    }
    else {
      local_5c[0] = ce_toupper(sVar2);
      sVar2 = measure_text_width(local_58);
      sVar3 = measure_text_width(local_5c);
      if ((((int)sVar3 + (int)sVar2) * 0x10000 >> 0x10) + (int)*(short *)(&DAT_000baa0a + iVar7) <
          0x13c) {
        iVar8 = (iVar10 + 1) * 0x10000 >> 0x10;
        if (iVar8 < 0x2e) {
          local_58[iVar8] = local_5c[0];
          iVar10 = iVar10 + 1;
        }
        else {
          debug_noop_overflow_hook(300,10);
          iVar10 = 0x2d;
        }
      }
      else {
        debug_noop_overflow_hook(300,10);
      }
    }
    local_58[(short)iVar10 + 1] = '\0';
    iVar4 = measure_text_width(local_58);
    iVar8 = *(short *)(&DAT_000baa0a + iVar7) + iVar4 + -1;
    warp_mouse_cursor(*(short *)(&DAT_000baa0a + iVar7) + iVar4 + 9,local_60 + -0x12);
    draw_text_string(local_58,(int)*(short *)(&DAT_000baa0a + iVar7),
                 (int)*(short *)(&DAT_000baa0c + iVar7));
    flush_dirty_rect_to_display(1);
  }
  goto LAB_000171bc;
LAB_0001739c:
  g_text_input_active = 0;
  select_active_font(s_font5x6p_sys_0008430c);
  if (local_58[0] != '\0') {
    DAT_000b99c4 = 1;
    pcVar5 = local_58;
    do {
      cVar1 = *pcVar5;
      (&DAT_000ba9d8)[iVar7 + (pcVar5 - local_58)] = cVar1;
      pcVar5 = pcVar5 + 1;
    } while (cVar1 != '\0');
    DAT_000bbef0 = DAT_000bbef0 + 1;
  }
  flush_dirty_rect_to_display(1);
LAB_00017404:
  decrement_cursor_hide_depth();
  draw_automap_notes();
  warp_mouse_cursor(iVar8 + 0x16,local_60 + -7);
  pop_cursor_icon(2);
  flush_dirty_rect_to_display(1);
  DAT_000bbef8 = 0;
  DAT_000bbef4 = 1;
  goto LAB_0001764c;
}



// was FUN_0001765c -- redraws every stored automap note (DAT_000bbef0
// count of DAT_000ba9d8 records) as text at its saved screen position.
void draw_automap_notes()
{
  char *wptr_5780;
  char *wptr_5787;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  char *pcVar5;
  short sVar6;
  int iVar7;
  char auStack_48 [52]; /* ARM allocates a single 52-byte text buffer. */
  
  select_active_font(s_font4x5p_sys_0008431c);
  *g_draw_color_index = 0x2d;
  *DAT_00084298 = 0x2d;
  if (0 < DAT_000bbef0) {
    iVar7 = 0;
    sVar6 = DAT_000bbef0;
    do {
      iVar4 = iVar7 * 0x36;
      pcVar3 = &DAT_000ba9d8 + iVar4;
      wptr_5787 = auStack_48;
      pcVar5 = pcVar3;
      wptr_5780 = auStack_48;
      do {
        cVar1 = *pcVar5;
        *wptr_5780 = cVar1; wptr_5780 = wptr_5780 + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      sVar2 = *(short *)(&DAT_000baa0a + iVar4);
      if (-1 < sVar2) {
        do {
          cVar1 = *pcVar3;
          *wptr_5787 = cVar1; wptr_5787 = wptr_5787 + 1;
          pcVar3 = pcVar3 + 1;
        } while (cVar1 != '\0');
        draw_text_string(auStack_48,(int)sVar2,(int)*(short *)(&DAT_000baa0c + iVar4));
        sVar6 = DAT_000bbef0;
      }
      iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
    } while (iVar7 < sVar6);
  }
  select_active_font(s_font5x6p_sys_0008430c);
}



// was FUN_00017768 -- compacts out any deleted (negative-length) note
// records, then writes the remaining DAT_000ba9d8 note array to archive
// entry param_1+0x23.
void save_automap_notes_to_archive(int level_number)
{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined1 auStack_2c [16];
  
  if (DAT_000b99c4 != 0) {
    iVar3 = (int)DAT_000bbef0;
    iVar2 = (int)DAT_000bbef0;
    if (iVar2 != 0) {
      sVar1 = DAT_000bbef0;
      if (0 < iVar2) {
        iVar4 = 0;
        do {
          if (*(short *)(&DAT_000baa0a + iVar4 * 0x36) < 0) {
            ce_memmove(&DAT_000ba9d8 + iVar4 * 0x36,&DAT_000ba9d8 + (iVar4 + 1) * 0x36,
                         iVar4 * -0x36 + 0x1518);
            iVar3 = (iVar2 + -1) * 0x10000 >> 0x10;
            /* Check the record moved into this slot as well. */
            iVar4 = iVar4 - 1;
          }
          iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
          iVar2 = (int)(short)iVar3;
          sVar1 = (short)iVar3;
        } while (iVar4 < iVar2);
      }
      DAT_000bbef0 = sVar1;
    }
    /* A zero-length entry also persists deletion of the last note. */
    iVar2 = open_level_archive(auStack_2c,s__SAVE0_lev_ark_000842fc);
    if (iVar2 != 0) {
      write_archive_entry(auStack_2c,level_number + 0x23,&DAT_000ba9d8,(uint)(DAT_000bbef0 * 0x360000) >> 0x10);
      close_level_archive(auStack_2c);
    }
  }
}



// was FUN_0001786c -- reads archive entry param_1+0x23 back into the
// DAT_000ba9d8 note array (the read-side counterpart to
// save_automap_notes_to_archive), then redraws them.
void load_automap_notes_from_archive(int level_number)
{
  undefined2 uVar1;
  int iVar2;
  undefined1 auStack_20 [16];
  
  DAT_000bbef0 = 0;
  DAT_000b99c8 = 0;
  iVar2 = open_level_archive(auStack_20,s__SAVE0_lev_ark_000842fc);
  if (iVar2 != 0) {
    uVar1 = read_archive_entry(auStack_20,level_number + 0x23,&DAT_000ba9d8);
    DAT_000b99c8 = orduint_divmod(0x36,uVar1).quot;
    DAT_000bbef0 = DAT_000b99c8;
    draw_automap_notes();
    close_level_archive(auStack_20);
  }
}



// was FUN_00017b38 -- switches which level's automap page is on screen: saves the current level's
// notes, clears the reveal buffer, loads the new level's reveal state (if a real dungeon level,
// param_1<9), then draws it.
void switch_automap_level_display(int level_number)
{
  int iVar1;
  undefined1 auStack_18 [16];
  
  save_automap_notes_to_archive((int)DAT_000ba9d0);
  clear_automap_reveal_buffer();
  if (((short)level_number < 9) &&
     (iVar1 = open_level_archive(auStack_18,s__SAVE0_lev_ark_000842fc), iVar1 != 0)) {
    load_automap_reveal_from_archive(auStack_18,level_number);
    close_level_archive(auStack_18);
  }
  draw_automap_screen(level_number);
}



// was FUN_0007edec -- always returns 0 and does nothing else; both confirmed callers
// (src/automap.c's note-text composition, when the wrapped line buffer overflows its 46-char limit
// or a word doesn't fit) pass literal args (300,10) that this decompiled signature takes no...
int debug_noop_overflow_hook(int limit, int word_count)
{
  return 0;
}





/* Compute the automap reveal byte for a just-explored tile. tile_rec points at this tile's 4-byte
   record. */
byte automap_reveal_byte(byte *tile_rec)
{
  return (byte)DAT_0023ae40_backing[tile_rec[1] >> 2 & 0xf] |
         (*tile_rec & 0xf);
}

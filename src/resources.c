/* Graphics resource loading: .GR bitmap decode, resource-file open, the "flip grtile" screen-flip
   capture slots, and door-frame loading. Split out of uw.c (the original monolithic decompile) once
   these functions' real roles were confirmed. */
#include "headers/resources.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define DAT_00202724 DAT_00202724_backing[0]
static byte *DAT_000b4624;
static byte *DAT_000b462c;
static byte *DAT_000b4618;
/* Sizing-audit pass: `MultiByteToWideChar(...,&DAT_000fb650,0xff)`
   -- cchWideChar=0xff(255) counts WCHAR units, not bytes: real need
   510 bytes. Sized to 512. Down from 8192. */
static char DAT_000fb650_backing[512];
#define DAT_000fb650 DAT_000fb650_backing[0]
/* Sizing-audit pass: `WideCharToMultiByte(...,&DAT_000fb550,0xff,...)`
   -- cbMultiByte=0xff(255) bytes exact. Sized to 256. Down from 8192. */
static char DAT_000fb550_backing[256];
#define DAT_000fb550 DAT_000fb550_backing[0]
/* Real string, recovered via Ghidra disassembly of decode_critter_sprite_page (the caching
   "\CRIT\CR<pp>PAGE.N<nn>" per-page critter-animation resource loader): the decompile showed
   DAT_00085928/29/30/31 as four unrelated lone chars... */
static char DAT_00085920_backing[20] = "\\CRIT\\CR00PAGE.N00";
#define DAT_00085920 DAT_00085920_backing[0]
#define DAT_00085928 DAT_00085920_backing[8]
#define DAT_00085929 DAT_00085920_backing[9]
#define DAT_00085930 DAT_00085920_backing[0x10]
#define DAT_00085931 DAT_00085920_backing[0x11]
char s__DATA__00085970[] = "\\DATA\\";
static char s__DATA_pals_dat_00085978[] = "\\DATA\\pals.dat";
static undefined4 DAT_00202514;
static void *DAT_00202720_backing[128];  /* real pointers: were int, truncating malloc results */
static void **DAT_00202720 = DAT_00202720_backing;
/* Sizing-audit pass: `read_file_handle(DAT_00202514,&DAT_00202724,1)`
   -- pure 1-byte scalar (`(uint)DAT_00202724<<5`), never indexed.
   Down from 8192. */
static undefined1 DAT_00202724_backing[4];
static undefined4 DAT_00202728;
static char *DAT_0020274c;
/* Sizing-audit pass: `read_file_handle(DAT_00202514,&DAT_00202518,1)`
   -- pure 1-byte scalar, never indexed. Down from 8192. */
static undefined DAT_00202518_backing[4];
#define DAT_00202518 DAT_00202518_backing[0]
ushort DAT_00202744;
static undefined2 DAT_000859a8;
/* Was `undefined4` -- truncated the real 64-bit destination pointer decode_gr_entry_to_buffer
   assigns here (see that function's own comment on why this global exists at all)... */
static void *DAT_00202510;
static undefined2 DAT_00202748;
static char s_doors_00085a64[] = "doors";
/* Sizing-audit pass: door-type slot table, explicit loop bound
   `while(iVar3<6)` (load_door_frames). HARD. Down from 8192. */
 undefined1 DAT_0023b840_backing[8];
/* UW1 OBJECTS.DAT wearable rows are loaded unchanged (32 * 4 bytes). */
uw_armor_type_props_t g_armor_type_props[32];
static undefined4 *DAT_0023c3fc;  /* grtile registry: 0x11-byte records, first dword = identity key */
static undefined4 *DAT_0023c404;
/* Sizing pass: the "grows unboundedly" claim below was wrong from the moment it was written, not
   just stale -- register_interned_string (this family's ONLY writer) has an unconditional `if (1 <
   iVar2) return 0;` early return that hard-caps the real record/page count (DAT_0024cfc0) at... */
static undefined1 DAT_0024bfa0_backing[4096];
#define DAT_0024bfa0 DAT_0024bfa0_backing[0]
static undefined1 DAT_0024bfa1_backing[4096];
#define DAT_0024bfa1 DAT_0024bfa1_backing[0]
/* Sizing pass: byte-plane index is `(page*0x201 + sub_index) * 4`, page capped at 1 (see
   DAT_0024bfa0's own comment) and sub_index capped at 511 by register_interned_string's own
   zero-init loop (`while (iVar4 < 0x200)`, 512 slots per page)... */
static undefined1 DAT_0024bfa2_backing[8192];
#define DAT_0024bfa2 DAT_0024bfa2_backing[0]
static undefined1 DAT_0024bfa3_backing[8192];
#define DAT_0024bfa3 DAT_0024bfa3_backing[0]
static undefined1 DAT_0024bfa4_backing[8192];
#define DAT_0024bfa4 DAT_0024bfa4_backing[0]
static undefined1 DAT_0024bfa5_backing[8192];
#define DAT_0024bfa5 DAT_0024bfa5_backing[0]
/* The record-registration function (near FUN_00078820, "the string- interning cache") splits a real
   char* pointer byte-by-byte across these FOUR SEPARATE byte-plane arrays at the SAME index (byte0
   in bfa2[i], byte1 in bfa3[i], byte2 in bfa4[i], byte3 in bfa5[i])... */
static char *g_bfa2_real_ptrs[2048];
/* Sizing pass: same real bound as DAT_0024bfa0 above (this pair is indexed identically, `iVar3 *
   0x804`, iVar3 capped at 1 by the same register_interned_string cap) -- the "once more than ~4
   pages register" premise below was never possible... */
static undefined1 DAT_0024c7a2_backing[4096];
#define DAT_0024c7a2 DAT_0024c7a2_backing[0]
static undefined1 DAT_0024c7a3_backing[4096];
#define DAT_0024c7a3 DAT_0024c7a3_backing[0]
static undefined4 DAT_0024bf98;
/* Declared char* despite always being allocated/read/cast as a single 2-byte count (see
   open_strings_pak_file: `(short *)ce_malloc(2)`, a 2-byte read into it, then `*DAT_0024cfb8` used
   as the item count). */
static unsigned short *DAT_0024cfb8;
static char *DAT_0024cfa8;
static short DAT_0024cfc0;
static char s_strings_pak_000878c0[] = "strings.pak";
static short DAT_0024cfb4;
static undefined2 DAT_000878bc;
/* decode_strings_pak_entry's decoded-string ring buffer: DAT_0024cfb4 cycles through offsets 0,
   0x200, 0x400, ... wrapping back to 0 once it would reach 0x1000 (4096), and each slot can hold up
   to a 0x200-byte decoded string. */
static undefined1 DAT_0024af98_backing[4096];
#define DAT_0024af98 DAT_0024af98_backing[0]
/* Sizing-audit pass: `read_file_handle(param_1,&DAT_0024cfbc,1)` --
   pure 1-byte huffman bit-register scalar (shifted/masked), never
   indexed. Down from 8192 elements. */
static undefined2 DAT_0024cfbc_backing[4];
#define DAT_0024cfbc DAT_0024cfbc_backing[0]






// was FUN_000409f8 -- decodes a raw (still-compressed) .GR entry buffer into a real bitmap: entries
// whose own header byte is 4 are already stored raw (just skip the 5-byte header), anything else
// goes through decompress_gr_bitmap's palette-shifted decompressor.
char *decode_gr_entry_bitmap(char *entry)
{
  if (*entry == '\x04') {
    entry = entry + 5;
  }
  else {
    /* Dropped 3rd argument (the .GR entry's own compression-mode byte, entry) -- same bug already
       found and fixed twice elsewhere in this file for this identical decompress_gr_bitmap call
       shape (see object-rendering-findings.txt's "MILESTONE: objects render"). */
    entry = (char *)decompress_gr_bitmap((byte *)entry + 4,&DAT_00202520 + (uint)(byte)entry[3] * 0x10,*entry);
  }
  return entry;
}




// was FUN_00041304
int open_gr_resource_file(char *path, char flag)
{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  uint uVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  byte local_11c [8];
  char local_114 [260];
  
  iVar3 = 0;
  do {
    local_114[iVar3] = '\0';
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 0x41);
  uVar1 = (uint)flag;
  if (uVar1 == 3) {
    pcVar4 = local_114;
    do {
      cVar2 = *path;
      *pcVar4 = cVar2;
      pcVar4 = pcVar4 + 1;
      path = path + 1;
    } while (cVar2 != '\0');
  }
  else {
    pcVar4 = (char *)&DAT_0023cca8; /* install-dir string (global typed undefined1[]) */
    stack0xffdc3244_ptr = local_114;
    do {
      cVar2 = *pcVar4;
      *stack0xffdc3244_ptr = cVar2; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar2 != '\0');
    ce_strcat(local_114,s__DATA__00085970);
    ce_strcat(local_114,path);
    /* Originally `uVar1 * 4 + 0x85990`: an index into a table of string pointers living at a fixed
       address in the original binary's data segment. */
    {
      /* Corrected: the actual data files are QUESTION.GR, VIEWS.GR, OBJECTS.GR, DOORS.GR etc.
         (confirmed present in the real install), not the "P/I/B.SYS" style-suffix guessed earlier
         -- ".GR" is the real extension for all of these regardless of uVar1. */
      ce_strcat(local_114, ".GR");
    }
  }
  DAT_00202514 = open_file_for_read(local_114);
  if (DAT_00202514 != -1) {
    iVar3 = read_file_handle(DAT_00202514,local_11c,1);
    if (((((iVar3 == 1) && (local_11c[0] == uVar1)) &&
         ((uVar1 != 2 || (iVar3 = read_file_handle(DAT_00202514,&DAT_00202518,1), iVar3 == 1)))) &&
        (iVar3 = read_file_handle(DAT_00202514,&DAT_00202728,2), iVar3 == 2)) &&
       (((uVar1 != 3 || (iVar3 = load_gr_format3_extra_table(), iVar3 != 0)) &&
        (DAT_0020274c = ce_malloc(((ushort)DAT_00202728 + 1) * 4), DAT_0020274c != 0)))) {
      iVar3 = read_file_handle(DAT_00202514,DAT_0020274c,((ushort)DAT_00202728 + 1) * 4);
      if (iVar3 == ((ushort)DAT_00202728 + 1) * 4) {
        return 1;
      }
      LocalFree(DAT_0020274c);
      DAT_0020274c = 0;
    }
    CloseHandle(DAT_00202514);
  }
  return 0;
}




// was FUN_00041db0
void load_door_frames()

{
  undefined2 uVar1;
  undefined2 uVar2;
  int iVar3;
  
  uVar2 = DAT_00202748;
  uVar1 = DAT_00202744;
  iVar3 = 0;
  /* Was `DAT_00202734 + 0x30` -- confirmed via real ARM disassembly (0x41dcc: `add r0,r0,#0x30`)
     that this is genuinely what the original binary computes, not a decompiler artifact. */
  DAT_00202744 = 20000;
  do {
    /* Was passed `0` for the post-process/registration callback (param_5) -- with no registrar,
       even a successful allocate+read never stores the decoded buffer into lookup_grtile_by_id's
       DAT_0024e090[] pointer table... */
    uint _ok = load_gr_resource_entries(s_doors_00085a64,(&DAT_0023b840)[iVar3],1,&alloc_door_frame_buffer,&register_gr_group_entry);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    DAT_00202744 = DAT_00202744 + 1;
  } while (iVar3 < 6);
  DAT_00202744 = uVar1;
  DAT_00202748 = uVar2;
  clear_ambient_sound_target();
  return;
}




/* alloc_flip_grtile_slot/resolve_flip_grtile_slot: were real, confirmed `mov r0,#0; cpy pc,lr`
   no-ops in the pristine binary (disassembly- verified at both real addresses, 0x4994c and 0x49954
   -- not a decompilation artifact). */
// was FUN_0004994c
int alloc_flip_grtile_slot()

{
  /* Not decompiled (see above). */
  return grtile_alloc_registered(0x100,0x80);
}



// was FUN_00049954
void *resolve_flip_grtile_slot(int slot)
{
  /* Not decompiled (see above). */
  int iVar1;
  undefined4 *puVar2;

  if (slot == 0) {
    return 0;
  }
  iVar1 = 0;
  puVar2 = DAT_0023c3fc;
  while (slot != *puVar2) {
    iVar1 = iVar1 + 1;
    puVar2 = (undefined4 *)((char *)puVar2 + 0x11);
    if (0x13f < iVar1) {
      return 0;
    }
  }
  return g_grtile_real_ptrs[iVar1];
}


// was FUN_00076a2c -- allocates a param_1 x param_2 raw pixel buffer (real heap pointer, tracked in
// g_grtile_real_ptrs) and registers it into DAT_0023c3fc's 320-record identity-key table...
uint grtile_alloc_registered(uint width, uint height)
{
  /* uVar1 (the malloc'd buffer's real address) is deliberately ALSO packed byte-by-byte into the
     record below as an opaque 4-byte identity key, and *that* truncated key -- not the real
     pointer... */
  void *uVar1;
  undefined4 *puVar2;
  int iVar3;

  puVar2 = DAT_0023c3fc;
  while( true ) {
    if (puVar2 == DAT_0023c404) {
      return 0;
    }
    if (*(char *)(puVar2 + 2) == '\0') break;
    puVar2 = (undefined4 *)((char *)puVar2 + 0x11);
  }
  iVar3 = (width & 0xffff) * (height & 0xffff);
  uVar1 = ce_malloc(iVar3);
  /* capture_framebuffer_rect_to_grtile (one of the "11 other callers" mentioned above) turns out to
     ALSO need the real pointer -- it renders glyph pixels directly into this buffer, not just
     compare-by-key -- so track the real address alongside the truncated key... */
  g_grtile_real_ptrs[((char *)puVar2 - (char *)DAT_0023c3fc) / 0x11] = uVar1;
  *(char *)puVar2 = (char)(uintptr_t)uVar1;
  *(char *)((char *)puVar2 + 1) = (char)((uintptr_t)uVar1 >> 8);
  *(char *)((char *)puVar2 + 2) = (char)((uintptr_t)uVar1 >> 0x10);
  *(char *)((char *)puVar2 + 3) = (char)((uintptr_t)uVar1 >> 0x18);
  ce_memset(uVar1,0,iVar3);
  *(char *)((char *)puVar2 + 0xe) = (char)(width >> 8);
  *(char *)(puVar2 + 4) = (char)(height >> 8);
  *(char *)((char *)puVar2 + 5) = (char)((uint)iVar3 >> 8);
  *(char *)((char *)puVar2 + 0xd) = (char)width;
  *(char *)((char *)puVar2 + 0xf) = (char)height;
  *(char *)((char *)puVar2 + 6) = (char)((uint)iVar3 >> 0x10);
  *(char *)(puVar2 + 1) = (char)iVar3;
  *(char *)((char *)puVar2 + 7) = (char)((uint)iVar3 >> 0x18);
  *(undefined1 *)(puVar2 + 2) = 1;
  DAT_0023c404 = (undefined4 *)((char *)DAT_0023c404 + 0x11);
  return *puVar2;
}

void *uw_alloc_grtile(uint width, uint height)
{
  /* register_grtile_entry needs a real, dereferenceable pointer (it memmoves into the result)
     rather than grtile_alloc_registered's opaque truncated handle -- see the comment there. */
  unsigned int size;
  void *p;
  size = (width & 0xffff) * (height & 0xffff);
  p = ce_malloc(size);
  if (p != 0) {
    ce_memset(p,0,size);
  }
  return p;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00076b8c
int capture_framebuffer_rect_to_grtile(uint key, int left, int top, int right, short bottom)
{
  bool bVar1;
  int iVar2;
  bool bVar3;
  short sVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  int iVar7;
  short sVar8;
  int iVar9;
  short sVar10;
  int iVar11;
  int iVar12;
  /* key is grtile_alloc_registered's opaque truncated identity key (used for the record-table
     search below), not a real pointer -- but this function ALSO renders glyph pixels directly into
     the matched record's buffer... */
  short *psVar_target;

  puVar5 = DAT_0023c3fc;
  sVar10 = (short)right;
  bVar3 = false;
  iVar12 = 0;
  puVar6 = DAT_0023c3fc;
  do {
    if (key == *puVar6) {
      psVar_target = (short *)g_grtile_real_ptrs[iVar12];
      iVar12 = iVar12 * 0x11;
      *(char *)((char *)DAT_0023c3fc + iVar12 + 9) = (char)left;
      *(char *)((char *)puVar5 + iVar12 + 10) = (char)((uint)left >> 8);
      puVar5 = DAT_0023c3fc;
      *(char *)((char *)DAT_0023c3fc + iVar12 + 0xb) = (char)top;
      *(char *)((char *)puVar5 + iVar12 + 0xc) = (char)((uint)top >> 8);
      puVar5 = DAT_0023c3fc;
      sVar8 = *(short *)((char *)DAT_0023c3fc + iVar12 + 0xd);
      if (sVar10 <= sVar8) {
        *(char *)((char *)DAT_0023c3fc + iVar12 + 0xd) = (char)right;
        *(char *)((char *)puVar5 + iVar12 + 0xe) = (char)((uint)right >> 8);
        sVar8 = sVar10;
      }
      sVar10 = sVar8;
      puVar5 = DAT_0023c3fc;
      sVar8 = *(short *)((char *)DAT_0023c3fc + iVar12 + 0xf);
      sVar4 = sVar8;
      if (bottom <= sVar8) {
        *(char *)((char *)DAT_0023c3fc + iVar12 + 0xf) = (char)bottom;
        sVar4 = bottom;
      }
      bVar3 = true;
      bVar1 = bottom <= sVar8;
      bottom = sVar4;
      if (bVar1) {
        *(char *)((char *)puVar5 + iVar12 + 0x10) = (char)((ushort)sVar4 >> 8);
      }
      break;
    }
    iVar12 = iVar12 + 1;
    puVar6 = (undefined4 *)((char *)puVar6 + 0x11);
  } while (iVar12 < 0x140);
  iVar12 = (int)(short)left;
  if ((int)DAT_000a85c4 <= iVar12 + sVar10 + -1) {
    sVar8 = (short)left;
    if (iVar12 < DAT_000a85c4) {
      iVar12 = (int)DAT_000a85c4;
      sVar8 = DAT_000a85c4;
    }
    if (iVar12 <= DAT_000842a4) {
      iVar7 = (DAT_000842a4 - iVar12) + 1;
      iVar9 = (int)sVar10;
      if (iVar7 < iVar9) {
        sVar10 = DAT_000842a4 - sVar8;
      }
      sVar8 = (short)top;
      if (iVar7 < iVar9) {
        sVar10 = sVar10 + 1;
      }
      if ((int)DAT_000a85c8 <= (int)sVar8 + (int)bottom) {
        if ((int)sVar8 < (int)DAT_000a85c8) {
          bottom = (DAT_000a85c8 - sVar8) + bottom;
          sVar8 = DAT_000a85c8;
        }
        iVar9 = (int)sVar8;
        if (iVar9 <= DAT_000842a8) {
          if ((DAT_000842a8 - iVar9) + 1 < (int)bottom) {
            bottom = (DAT_000842a8 - sVar8) + 1;
          }
          if (bVar3) {
            iVar7 = (int)sVar10;
            iVar2 = (int)bottom;
            dirty_rect_union(iVar9,iVar9 + iVar2,iVar12,iVar12 + iVar7);
            iVar12 = iVar9 * 0x140 + iVar12;
            iVar9 = 0;
            if (0 < iVar2) {
              do {
                if (199 < iVar9) {
                  return 1;
                }
                iVar11 = 0;
                if (0 < iVar7) {
                  do {
                    if (0x13f < iVar11) break;
                    iVar11 = iVar11 + 1;
                    sVar10 = *(short *)((g_uw_framebuffer) + iVar12 * 2)
                    ;
                    iVar12 = iVar12 + 1;
                    if ((g_blit_transparent_mode & (sVar10 == 0)) == 0) {
                      *psVar_target = sVar10;
                    }
                    psVar_target = psVar_target + 1;
                  } while (iVar11 < iVar7);
                }
                iVar9 = iVar9 + 1;
                iVar12 = iVar12 + (0x140 - iVar7);
              } while (iVar9 < iVar2);
            }
            return 1;
          }
        }
      }
    }
  }
  return 0;
}






// was FUN_000769e8 -- allocates and zero-initializes the grtile registry's record table
// (DAT_0023c3fc, 0x1540 bytes / 0x11-byte stride = 320 records exactly, matching
// g_grtile_real_ptrs's own 320-entry size), and sets its "end" pointer (DAT_0023c404).
void init_grtile_registry()

{
  DAT_0023c3fc = ce_malloc(0x1540);
  if (DAT_0023c3fc != 0) {
    ce_memset(DAT_0023c3fc,0,0x1540);
    DAT_0023c404 = (undefined4 *)((char *)DAT_0023c3fc + 0x11);
  }
  return;
}




// was FUN_00076b24 -- searches the grtile registry (DAT_0023c3fc) for a record whose key matches
// param_1, and if found, zeroes that record's own key field (marking the slot free/invalid).
// Returns 0xffffffff if no match was found before reaching the table's end (DAT_0023c404).
int invalidate_grtile_by_key(uint key)
{
  undefined4 *piVar1;
  
  piVar1 = DAT_0023c3fc;
  while( true ) {
    if (piVar1 == DAT_0023c404) {
      return 0xffffffff;
    }
    if (*piVar1 == key) break;
    piVar1 = (undefined4 *)((char *)piVar1 + 0x11);
  }
  *(undefined1 *)(piVar1 + 2) = 0;
  return 0;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00076e98 -- looks up a grtile registry record by key (param_1) and blits its
// previously-captured backdrop pixels (tracked via g_grtile_real_ptrs, not the truncated key itself
// -- see param_1's own comment) back into the real framebuffer at the record's stored rect...
int restore_captured_grtile_backdrop(uint key)
{
  int iVar1;
  short sVar2;
  int iVar3;
  undefined4 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  /* key is grtile_alloc_registered's opaque truncated identity key, not a real pointer -- same
     issue as capture_framebuffer_rect_to_grtile above. Read glyph pixels back through the real
     pointer tracked in g_grtile_real_ptrs instead of dereferencing the key directly. */
  short *psVar_target;

  iVar3 = 0;
  puVar4 = DAT_0023c3fc;
  while (key != *puVar4) {
    iVar3 = iVar3 + 1;
    puVar4 = (undefined4 *)((char *)puVar4 + 0x11);
    if (0x13f < iVar3) {
      return 0xffffffff;
    }
  }
  psVar_target = (short *)g_grtile_real_ptrs[iVar3];
  iVar5 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 9);
  iVar7 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 0xb);
  iVar1 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 0xd);
  iVar3 = (int)*(short *)((char *)DAT_0023c3fc + iVar3 * 0x11 + 0xf);
  iVar6 = iVar7 * 0x140 + iVar5;
  dirty_rect_union(iVar7,iVar3 + iVar7,iVar5,iVar1 + iVar5);
  iVar5 = 0;
  if (0 < iVar3) {
    do {
      if (199 < iVar5) {
        return 0;
      }
      iVar7 = 0;
      if (0 < iVar1) {
        do {
          if (0x13f < iVar7) break;
          sVar2 = *psVar_target;
          iVar7 = iVar7 + 1;
          psVar_target = psVar_target + 1;
          if ((g_blit_transparent_mode & (sVar2 == 0)) == 0) {
            *(short *)((g_uw_framebuffer) + iVar6 * 2) = sVar2;
          }
          iVar6 = iVar6 + 1;
        } while (iVar7 < iVar1);
      }
      iVar5 = iVar5 + 1;
      iVar6 = iVar6 + (0x140 - iVar1);
    } while (iVar5 < iVar3);
  }
  return 0;
}





// was FUN_0007856c -- initializes the string-resource page cache (DAT_0024bfa0-family, see that
// global's own comment): clears the first 2 cache-record slots...
int init_string_resource_cache()

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  do {
    iVar3 = iVar4 * 0x804;
    (&DAT_0024bfa0)[iVar3] = 0xff;
    (&DAT_0024bfa1)[iVar3] = 0xff;
    (&DAT_0024c7a2)[iVar3] = 0;
    (&DAT_0024c7a3)[iVar3] = 0;
    iVar3 = 0;
    do {
      iVar1 = (iVar4 * 0x201 + iVar3) * 4;
      (&DAT_0024bfa2)[iVar1] = 0;
      (&DAT_0024bfa3)[iVar1] = 0;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      (&DAT_0024bfa4)[iVar1] = 0;
      (&DAT_0024bfa5)[iVar1] = 0;
    } while (iVar3 < 0x200);
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 2);
  sVar2 = open_strings_pak_file();
  if (sVar2 != 0) {
    /* Was called bare -- dropped argument. open_strings_pak_file's own return values (e.g. 0x1001)
       are already fully-formed error codes in report_categorized_fatal_error's expected
       category*0x1000+subcode shape, confirming sVar2 itself is the intended argument. */
    report_categorized_fatal_error(sVar2);
  }
  return 1;
}



// was thunk_FUN_00078e28 -- byte-identical duplicate body of
// close_strings_pak_file (was FUN_00078e28) at a different address -- same
// split-symbol/naming-collision pattern collapsed elsewhere in this project.
void close_strings_pak_file_thunk()

{
  close_strings_pak_file();
  return;
}





// was FUN_0007863c -- the core message-string lookup used throughout this game: param_1 packs a
// page number (bits 9+) and a sub-index within that page (low 9 bits).
char *get_message_string(ushort message_id)
{
  uint uVar1;
  char *uVar2;
  int iVar3;
  short sVar4;

  uVar1 = (uint)(message_id >> 9);
  iVar3 = 0;
  sVar4 = -1;
  if (0 < DAT_0024cfc0) {
    do {
      sVar4 = (short)iVar3;
      if ((int)*(short *)(&DAT_0024bfa0 + iVar3 * 0x804) == uVar1) break;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      sVar4 = -1;
    } while (iVar3 < DAT_0024cfc0);
  }
  if (sVar4 < 0) {
    if (uVar1 == 0) {
      uVar1 = (uint)DAT_0024cfac;
    }
    /* Was `decode_strings_pak_entry(uVar1)` -- called with only one explicit argument, relying on a
       register-leftover idiom for the second... */
    uVar2 = (char *)decode_strings_pak_entry(uVar1,(uint)(message_id & 0x1ff));
  }
  else {
    /* Was reading 4 consecutive bytes from DAT_0024bfa2 alone, but the register function actually
       splits the pointer across bfa2/3/4/5 at the SAME (un-multiplied-by-4) index -- that read was
       pulling the real low byte plus 3 zero padding bytes, not reconstructing anything real... */
    uVar2 = g_bfa2_real_ptrs[sVar4 * 0x201 + (int)(short)(message_id & 0x1ff)];
  }
  return uVar2;
}





// was FUN_0007873c -- the write-side counterpart to get_message_string: interns a real string
// pointer (param_1) into the string-resource cache under page param_2, creating that page (capped
// to at most 2 distinct pages via this path) if it doesn't exist yet.
int register_interned_string(char *string, int page)
{
  int iVar1;
  int iVar2;
  ushort uVar3;
  int iVar4;
  short sVar5;
  
  iVar4 = 0;
  iVar2 = (int)DAT_0024cfc0;
  sVar5 = -1;
  if (0 < iVar2) {
    do {
      sVar5 = (short)iVar4;
      if (*(short *)(&DAT_0024bfa0 + iVar4 * 0x804) == (short)page) break;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      sVar5 = -1;
    } while (iVar4 < iVar2);
  }
  if (sVar5 < 0) {
    if (1 < iVar2) {
      return 0;
    }
    iVar4 = iVar2 * 0x804;
    (&DAT_0024bfa0)[iVar4] = (char)page;
    (&DAT_0024bfa1)[iVar4] = (char)((uint)page >> 8);
    (&DAT_0024c7a2)[iVar4] = 0;
    (&DAT_0024c7a3)[iVar4] = 0;
    iVar4 = 0;
    do {
      iVar1 = (iVar2 * 0x201 + iVar4) * 4;
      (&DAT_0024bfa2)[iVar1] = 0;
      (&DAT_0024bfa3)[iVar1] = 0;
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      (&DAT_0024bfa4)[iVar1] = 0;
      (&DAT_0024bfa5)[iVar1] = 0;
    } while (iVar4 < 0x200);
    sVar5 = DAT_0024cfc0;
    DAT_0024cfc0 = (short)((uint)((iVar2 + 1) * 0x10000) >> 0x10);
  }
  iVar4 = sVar5 * 0x804;
  uVar3 = *(ushort *)(&DAT_0024c7a2 + iVar4);
  iVar2 = (sVar5 * 0x201 + (int)(short)uVar3) * 4;
  /* Real pointer tracked separately -- see g_bfa2_real_ptrs's comment.
     iVar2 is already the byte-plane index (pre-multiplied by 4); the
     side table uses the un-multiplied slot index. */
  g_bfa2_real_ptrs[iVar2 / 4] = string;
  (&DAT_0024bfa2)[iVar2] = (char)(uintptr_t)string;
  (&DAT_0024bfa3)[iVar2] = (char)((uintptr_t)string >> 8);
  (&DAT_0024bfa4)[iVar2] = (char)((uintptr_t)string >> 0x10);
  (&DAT_0024bfa5)[iVar2] = (char)((uintptr_t)string >> 0x18);
  sVar5 = *(short *)(&DAT_0024c7a2 + iVar4);
  (&DAT_0024c7a2)[iVar4] = (char)(sVar5 + 1);
  (&DAT_0024c7a3)[iVar4] = (char)((uint)(sVar5 + 1) >> 8);
  return (int)(short)((short)page << 9 | uVar3);
}





// was FUN_00078918 -- overwrites an already-interned string in place: param_2 is an existing packed
// message id (page in bits 9+, sub-index in the low 9 bits, same encoding as get_message_string/
// register_interned_string), param_1 is the new real string pointer.
uint overwrite_interned_string(char *string, uint message_id)
{
  int iVar1;
  short sVar2;
  
  iVar1 = 0;
  sVar2 = -1;
  if (0 < DAT_0024cfc0) {
    do {
      sVar2 = (short)iVar1;
      if ((int)*(short *)(&DAT_0024bfa0 + iVar1 * 0x804) == (message_id & 0xffff) >> 9) break;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
      sVar2 = -1;
    } while (iVar1 < DAT_0024cfc0);
  }
  if (sVar2 < 0) {
    message_id = 0;
  }
  else {
    iVar1 = (sVar2 * 0x201 + (int)(short)((ushort)message_id & 0x1ff)) * 4;
    /* Real pointer tracked separately -- see g_bfa2_real_ptrs's comment
       and register_interned_string's identical write above. */
    g_bfa2_real_ptrs[iVar1 / 4] = string;
    (&DAT_0024bfa2)[iVar1] = (char)(uintptr_t)string;
    (&DAT_0024bfa3)[iVar1] = (char)((uintptr_t)string >> 8);
    (&DAT_0024bfa4)[iVar1] = (char)((uintptr_t)string >> 0x10);
    (&DAT_0024bfa5)[iVar1] = (char)((uintptr_t)string >> 0x18);
  }
  return message_id;
}





// was FUN_00078a04 -- finds the string-resource cache page matching param_1 and, if found, clears
// its entire contents: resets its sub-index count (DAT_0024c7a2/3) and nulls out every one of its
// 512 real-pointer/byte-plane slots (g_bfa2_real_ptrs and the DAT_0024bfa2-family arrays).
void reset_string_resource_page(int page)
{
  int iVar1;
  int iVar2;
  int iVar3;
  short sVar4;
  
  iVar3 = 0;
  sVar4 = -1;
  if (0 < DAT_0024cfc0) {
    do {
      sVar4 = (short)iVar3;
      if (*(short *)(&DAT_0024bfa0 + iVar3 * 0x804) == (short)page) break;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      sVar4 = -1;
    } while (iVar3 < DAT_0024cfc0);
  }
  iVar3 = (int)sVar4;
  if (-1 < iVar3) {
    iVar2 = iVar3 * 0x804;
    (&DAT_0024bfa0)[iVar2] = (char)page;
    (&DAT_0024bfa1)[iVar2] = (char)((uint)page >> 8);
    (&DAT_0024c7a2)[iVar2] = 0;
    (&DAT_0024c7a3)[iVar2] = 0;
    iVar2 = 0;
    do {
      iVar1 = (iVar3 * 0x201 + iVar2) * 4;
      g_bfa2_real_ptrs[iVar1 / 4] = 0;
      (&DAT_0024bfa2)[iVar1] = 0;
      (&DAT_0024bfa3)[iVar1] = 0;
      (&DAT_0024bfa4)[iVar1] = 0;
      (&DAT_0024bfa5)[iVar1] = 0;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x200);
  }
}





// was FUN_00078d18 -- opens STRINGS.PAK (built from the install dir + "\DATA\strings.pak"): reads
// its 2-byte item count into DAT_0024cfb8, allocates and reads the offset-index table into
// DAT_0024cfa8...
int open_strings_pak_file()

{
  /* Ghidra couldn't correlate this copy loop's destination with a real stack slot (see
     fix_stack_copy_loops.py); it's actually copying DAT_0023cca8 (the install dir, set up earlier)
     directly into acStack_118... */
  char *stack0xffdc3240_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char acStack_118 [260];

  pcVar2 = (char *)&DAT_0023cca8; /* install-dir string (global typed undefined1[]) */
    stack0xffdc3240_ptr = acStack_118;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3240_ptr = cVar1; stack0xffdc3240_ptr = stack0xffdc3240_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_118,s__DATA__00085970);
  ce_strcat(acStack_118,s_strings_pak_000878c0);
  iVar3 = open_file_for_read(acStack_118);
  if (iVar3 != -1) {
    DAT_0024cfb8 = (unsigned short *)ce_malloc(2);
    read_file_handle(iVar3,DAT_0024cfb8,2);
    DAT_0024cfa8 = ce_malloc((int)*DAT_0024cfb8 << 2);
    if (DAT_0024cfa8 == 0) {
      CloseHandle(iVar3);
      return 0x1001;
    }
    read_file_handle(iVar3,DAT_0024cfa8,(int)*DAT_0024cfb8 << 2);
    CloseHandle(iVar3);
    DAT_0024bf98 = open_file_for_read(acStack_118);
    if (DAT_0024bf98 != -1) {
      return 0;
    }
  }
  return 0x3002;
}



// was FUN_00078e28 -- closes STRINGS.PAK and frees its index/data buffers
// (DAT_0024cfb8/DAT_0024cfa8).
void close_strings_pak_file()

{
  CloseHandle(DAT_0024bf98);
  LocalFree(DAT_0024cfb8);
  LocalFree(DAT_0024cfa8);
  return;
}





// was FUN_00078e60 -- decodes one string out of STRINGS.PAK: seeks the page's offset-table entry
// for param_1, finds param_2's sub-offset within that page's own sub-table...
byte *decode_strings_pak_entry(short page, short index)
{
  int iVar1;
  char cVar2;
  uint uVar3;
  ushort uVar4;
  uint uVar5;
  undefined1 *puVar6;
  ushort local_30;
  ushort local_2e;
  ushort local_2c;
  ushort local_2a;
  undefined4 local_28;
  
  uVar5 = 0;
  puVar6 = &DAT_0024af98 + DAT_0024cfb4;
  seek_file_handle(DAT_0024bf98,*DAT_0024cfb8 * 4 + 2,0);
  /* If this read fails (e.g. DAT_0024bf98 holds a corrupted/invalid handle -- see
     walk_strings_pak_huffman_tree's comment for the known separate bug this guards against)... */
  if (read_file_handle(DAT_0024bf98,&local_30,2) == 0) {
    *puVar6 = 0;
    return puVar6;
  }
  uVar4 = 0;
  if (local_30 != 0) {
    do {
      read_file_handle(DAT_0024bf98,&local_2c,2);
      if ((uint)local_2c == (int)page) break;
      seek_file_handle(DAT_0024bf98,4,1);
      uVar4 = uVar4 + 1;
    } while (uVar4 < local_30);
  }
  if (uVar4 != local_30) {
    read_file_handle(DAT_0024bf98,&local_28,4);
    seek_file_handle(DAT_0024bf98,local_28,0);
    read_file_handle(DAT_0024bf98,&local_2e,2);
    iVar1 = (int)index;
    if (iVar1 < (int)(uint)local_2e) {
      seek_file_handle(DAT_0024bf98,iVar1 << 1,1);
      read_file_handle(DAT_0024bf98,&local_2a,2);
      seek_file_handle(DAT_0024bf98,(((uint)local_2e - iVar1) + -1) * 2 + (uint)local_2a,1);
      DAT_000878bc = 8;
      do {
        cVar2 = walk_strings_pak_huffman_tree(DAT_0024bf98,*DAT_0024cfb8 + -1);
        uVar3 = uVar5 + 1;
        puVar6[uVar5] = cVar2;
        uVar5 = uVar3 & 0xffff;
        if ((cVar2 == -1) || (cVar2 == '|')) break;
      } while ((uVar3 & 0xffff) < 0x200);
      puVar6[(uVar3 & 0xffff) - 1] = 0;
      if ((DAT_0024cfb4 + 0x200) * 0x10000 >> 0x10 < 0x1000) {
        DAT_0024cfb4 = (short)(DAT_0024cfb4 + 0x200);
        return puVar6;
      }
      DAT_0024cfb4 = 0;
      return puVar6;
    }
  }
  *puVar6 = 0;
  return puVar6;
}



// was FUN_0007907c -- walks STRINGS.PAK's per-page Huffman-style decode tree (stored in
// DAT_0024cfa8, 4 bytes/node) one bit at a time (read_strings_pak_bit) starting from tree-node
// param_2, until reaching a leaf (terminator byte != -1), returning the decoded byte.
byte walk_strings_pak_huffman_tree(int file_handle, ushort node)
{
  short sVar1;
  /* Was `int iVar2`, truncating DAT_0024cfa8 (a real char* pointer). */
  char *iVar2;
  /* Guard against a known, separate, not-yet-root-caused bug: under some string IDs the
     compressed-string file handle this receives (traced back to DAT_0024bf98) ends up corrupted
     before reaching here... */
  int iVar3 = 0;
  while (*(char *)((short)node * 4 + DAT_0024cfa8 + 2) != -1) {
    if (256 < iVar3) {
      return '|';
    }
    iVar3 = iVar3 + 1;
    sVar1 = read_strings_pak_bit(file_handle);
    if (sVar1 == -1) {
      return '|';
    }
    iVar2 = (short)node * 4 + DAT_0024cfa8;
    if (sVar1 == 0) {
      node = (ushort)*(byte *)(iVar2 + 2);
    }
    else {
      node = (ushort)*(byte *)(iVar2 + 3);
    }
  }
  return *(undefined1 *)(DAT_0024cfa8 + (short)node * 4);
}



// was FUN_000790e0 -- reads one bit from STRINGS.PAK's compressed bitstream (DAT_0024cfbc, refilled
// from the file one byte at a time via DAT_000878bc as a bit-position counter)...
int read_strings_pak_bit(int file_handle)
{
  ushort uVar1;

  if (DAT_000878bc == 8) {
    if (read_file_handle(file_handle,&DAT_0024cfbc,1) == 0) {
      return -1;
    }
    DAT_000878bc = 0;
  }
  uVar1 = DAT_0024cfbc & 0x80;
  DAT_0024cfbc = DAT_0024cfbc << 1;
  DAT_000878bc = DAT_000878bc + 1;
  return uVar1;
}


// was FUN_0007ee4c -- the mirror-image "read" counterpart to write_buffer_to_file: opens param_1
// for read and reads param_3 bytes into param_2, returning whether the full byte count was read.
bool read_buffer_from_file(char *path, void *buffer, int byte_count)
{
  int iVar1;
  int iVar2;
  bool bVar3;

  iVar1 = open_file_for_read(path);
  if (iVar1 == -1) {
    bVar3 = false;
  }
  else {
    iVar2 = read_file_handle(iVar1,buffer,byte_count);
    bVar3 = iVar2 == byte_count;
    CloseHandle(iVar1);
  }
  return bVar3;
}





// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* Forward declaration: g_grtile_real_ptrs is defined much further down (see its own comment there),
   but blit_grtile_to_framebuffer here -- much earlier in the file -- needs it to resolve a grtile
   registry key to the real pointer the key was only ever a truncated stand-in for. */
 void *g_grtile_real_ptrs[320];

// was FUN_00011c10 -- blits a captured grtile buffer (param_3, a registry key resolved via
// g_grtile_real_ptrs the same way
// capture_framebuffer_rect_to_grtile/restore_captured_grtile_backdrop do) into the framebuffer...
void blit_grtile_to_framebuffer(ushort x, int y, int grtile_key, short height, short width, short src_x, short src_y, int transparent)
{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  short *psVar9;
  short sVar10;
  short sVar11;
  short sVar12;
  int iVar13;
  short local_30;
  /* Was `int local_2c = grtile_key + ...` -- grtile_key is grtile_alloc_registered's opaque truncated
     identity key, not a real pointer... */
  intptr_t local_2c;
  char *_resolvedGrtilePtr;
  {
    int _gi = 0;
    undefined4 *_gp = DAT_0023c3fc;
    _resolvedGrtilePtr = 0;
    while (_gi <= 0x13f) {
      if (grtile_key == (int)*_gp) {
        _resolvedGrtilePtr = (char *)g_grtile_real_ptrs[_gi];
        break;
      }
      _gi = _gi + 1;
      _gp = (undefined4 *)((char *)_gp + 0x11);
    }
  }

  sVar10 = 0;
  iVar8 = (int)src_x;
  local_2c = (intptr_t)_resolvedGrtilePtr + ((int)src_y * (int)width + iVar8) * 2;
  iVar3 = ((int)height - (int)src_y) * 0x10000 >> 0x10;
  local_30 = 0;
  iVar13 = (uint)x << 0x10;
  iVar7 = iVar13 >> 0x10;
  if (iVar7 < 0) {
    iVar13 = iVar7 * -0x10000;
  }
  sVar11 = 0;
  if (iVar7 < 0) {
    sVar11 = (short)((uint)iVar13 >> 0x10);
  }
  iVar13 = (int)(short)y;
  if (iVar13 < 0) {
    local_30 = (short)((uint)(iVar13 * -0x10000) >> 0x10);
  }
  iVar1 = ((int)width - (int)src_x) * 0x10000 >> 0x10;
  if (0x140 < iVar7 + iVar1) {
    sVar10 = x + (short)((int)width - (int)src_x) + -0x140;
  }
  iVar6 = iVar3 << 0x10;
  iVar5 = iVar6 >> 0x10;
  iVar2 = iVar13 + iVar5;
  if (200 < iVar2) {
    iVar6 = y + iVar3;
  }
  sVar12 = 0;
  if (200 < iVar2) {
    sVar12 = (short)iVar6 + -200;
  }
  dirty_rect_union(iVar13,iVar2,iVar7,iVar7 + iVar1);  /* 4th (right) bound was dropped; same (top,bottom,left,right) shape as bitmap.c's blit_raw_sprite_clipped */
  iVar3 = (int)local_30;
  if (g_blit_transparent_mode == 0) {
    iVar5 = iVar5 - sVar12;
    if (iVar3 < iVar5) {
      iVar6 = (int)sVar11;
      iVar2 = iVar1 * iVar3;
      iVar7 = (iVar13 + iVar3) * 0x140 + iVar7;
      iVar5 = iVar5 - iVar3;
      do {
        if (iVar6 < iVar1 - sVar10) {
          iVar13 = (iVar7 + iVar6) * 2;
          puVar4 = (undefined2 *)(local_2c + (iVar2 + iVar6) * 2);
          iVar3 = (iVar1 - sVar10) - iVar6;
          do {
            iVar3 = iVar3 + -1;
            *(undefined2 *)(iVar13 + (g_uw_framebuffer)) = *puVar4;
            puVar4 = puVar4 + 1;
            iVar13 = iVar13 + 2;
          } while (iVar3 != 0);
        }
        iVar5 = iVar5 + -1;
        iVar7 = iVar7 + 0x140;
        iVar2 = iVar1 + iVar2;
        local_2c = local_2c + iVar8 * 2;
      } while (iVar5 != 0);
    }
  }
  else {
    iVar5 = iVar5 - sVar12;
    if (iVar3 < iVar5) {
      iVar6 = (int)sVar11;
      iVar2 = iVar1 * iVar3;
      iVar5 = iVar5 - iVar3;
      iVar7 = (iVar13 + iVar3) * 0x140 + iVar7;
      do {
        if (iVar6 < iVar1 - sVar10) {
          psVar9 = (short *)(local_2c + (iVar2 + iVar6) * 2);
          iVar13 = iVar6;
          do {
            sVar11 = *psVar9;
            psVar9 = psVar9 + 1;
            if (sVar11 != 0) {
              *(short *)((g_uw_framebuffer) + (iVar7 + iVar13) * 2) =
                   sVar11;
            }
            iVar13 = iVar13 + 1;
          } while (iVar13 < iVar1 - sVar10);
        }
        iVar5 = iVar5 + -1;
        iVar2 = iVar1 + iVar2;
        iVar7 = iVar7 + 0x140;
        local_2c = local_2c + iVar8 * 2;
      } while (iVar5 != 0);
    }
  }
}


// was FUN_000129f8 -- confirmed by decode_gr_entry_bitmap's own comment ("decompress_gr_bitmap's
// palette-shifted decompressor") and extensive investigation logged in
// object-rendering-findings.txt as the core .GR resource bitmap decompressor...
byte *decompress_gr_bitmap(byte *source, byte *dest, char mode)
{
  bool bVar1;
  byte bVar2;
  byte bVar3;
  byte *pbVar4;
  byte *pbVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  undefined4 uVar9;
  int iVar10;
  uint uVar11;
  
  pbVar5 = DAT_0024af7c;
  pbVar4 = DAT_0024af78;
  ce_memset(DAT_000842ac,10,0x20);
  DAT_000b4614 = DAT_0024fa2c;
  bVar2 = source[1];
  DAT_000b4618 = source;
  DAT_000b5630 = dest;
  if (mode == '\0') {
LAB_000130d0:
    DAT_000b462c = (byte *)0x0;
  }
  else {
    if (mode == '\x02') {
      DAT_000b462c = source;
      return source;
    }
    DAT_000b462c = source;
    if (mode == '\x04') {
      select_gr_bitmap_remap_table(bVar2,4,dest[1],*source | 0xff00);
      DAT_000b462c = pbVar4;
      DAT_000b4628 = pbVar4;
      DAT_000b461c = pbVar4;
      DAT_000b5630 = DAT_000b4618 + 1;
      uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
      bVar2 = *DAT_000b5630;
      DAT_000b5630 = DAT_000b5630 + 1;
      iVar10 = 0;
      do {
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        *DAT_000b461c = *(byte *)(DAT_000b4610 + (uint)bVar3);
        DAT_000b461c = DAT_000b461c + 1;
        bVar1 = iVar10 < (int)(uVar6 & 0xff | (uint)bVar2 << 8);
        iVar10 = iVar10 + 1;
      } while (bVar1);
      return DAT_000b462c;
    }
    if (mode == '\x06') {
      /* blit_sprite_row_remapped's 4th arg (a shade byte; 0xff means "no remap, plain copy") is
         never set by any of this function's 3 real ARM call sites either... */
      blit_sprite_row_remapped(bVar2,6,2,0xff);
      DAT_000b462c = pbVar4;
      DAT_000b4628 = pbVar4;
      DAT_000b461c = pbVar4;
      DAT_000b5630 = DAT_000b4618 + 1;
      uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
      bVar2 = *DAT_000b5630;
      DAT_000b5630 = DAT_000b5630 + 1;
      uVar8 = uVar6 & 0xff | (uint)bVar2 << 8;
      uVar6 = (uVar8 + 7 & 0xffff) >> 3;
      uVar7 = 0;
      for (uVar11 = uVar6; uVar11 != 0; uVar11 = uVar11 - 1) {
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word(uVar6,bVar2,0);
        uVar6 = (uVar7 & 0xff) >> 3;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word((uVar7 & 0xff) << 0xd | uVar6,bVar2,0);
        uVar6 = (uVar7 & 0xff | ((uVar7 & 0xffff) >> 8 & 0xffe0) << 3) >> 6;
        *DAT_000b461c = (byte)uVar6;
        uVar6 = ((uVar7 & 0x3f) << 10 | uVar6) >> 3;
        DAT_000b461c = DAT_000b461c + 1;
        uVar9 = merge_byte_into_word(uVar6 & 0xff | (uVar6 & 0xff) << 8,(uVar7 & 0x3f) >> 1,0);
        *DAT_000b461c = (byte)uVar9;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word(uVar9,bVar2,0);
        uVar6 = (uVar7 & 0xff | ((uVar7 & 0xffff) >> 8 & 0xff80) << 1) >> 4;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word((uVar7 & 0xff) << 0xc | uVar6,bVar2,0);
        uVar6 = (uVar7 & 0xff | ((uVar7 & 0xffff) >> 8 & 0xfff0) << 4) >> 7;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        uVar6 = merge_byte_into_word((uVar7 & 0xff) << 9 | uVar6,0,0);
        uVar6 = (uVar6 & 0xffff) >> 0xb | (uVar6 & 0x7ff) << 5;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar6 = merge_byte_into_word(uVar6,bVar2,0);
        *DAT_000b461c = (byte)((uVar6 & 0xff | ((uVar6 & 0xffff) >> 8 & 0xffc0) << 2) >> 5);
        uVar6 = uVar6 & 0x1f;
        DAT_000b461c = DAT_000b461c + 1;
        *DAT_000b461c = (byte)uVar6;
        DAT_000b461c = DAT_000b461c + 1;
        uVar7 = uVar6;
      }
    }
    else {
      if (mode != '\b') {
        if (mode == '\n') {
          /* Same dropped-4th-arg / uninitialized-param_4 issue as this
             function's other blit_sprite_row_remapped call site -- see
             that comment (a few dozen lines up, the mode=='\x06' case). */
          blit_sprite_row_remapped(bVar2,10,1,0xff);
          DAT_000b462c = pbVar4;
          DAT_000b4628 = pbVar4;
          DAT_000b461c = pbVar4;
          DAT_000b5630 = DAT_000b4618 + 1;
          uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
          bVar2 = *DAT_000b5630;
          DAT_000b5630 = DAT_000b5630 + 1;
          uVar6 = uVar6 & 0xff | (uint)bVar2 << 8;
          uVar7 = uVar6;
          for (; uVar6 != 0; uVar6 = uVar6 - 1) {
            bVar2 = *DAT_000b5630;
            DAT_000b5630 = DAT_000b5630 + 1;
            uVar7 = merge_byte_into_word(uVar7,bVar2,0);
            uVar7 = merge_byte_into_word(uVar7 & 0xff | (uVar7 & 0xff) << 8,uVar7 & 0xf0,0);
            uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xff) >> 4,0);
            *DAT_000b461c = *(byte *)((uVar7 & 0xff) + DAT_000b4610);
            DAT_000b461c = DAT_000b461c + 1;
            uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xffff) >> 8,0);
            uVar7 = merge_byte_into_word(uVar7,uVar7 & 0xf,0);
            *DAT_000b461c = *(byte *)((uVar7 & 0xff) + DAT_000b4610);
            DAT_000b461c = DAT_000b461c + 1;
          }
          return DAT_000b462c;
        }
        goto LAB_000130d0;
      }
      /* Same dropped-4th-arg / uninitialized-param_4 issue as this
         function's other blit_sprite_row_remapped call site -- see that
         comment (the mode=='\x06' case, above). */
      blit_sprite_row_remapped(bVar2,8,1,0xff);
      DAT_000b462c = pbVar4;
      DAT_000b4628 = pbVar4;
      DAT_000b461c = pbVar4;
      DAT_000b5630 = DAT_000b4618 + 1;
      uVar6 = merge_byte_into_word(bVar2,*DAT_000b4618,0);
      bVar2 = *DAT_000b5630;
      DAT_000b5630 = DAT_000b5630 + 1;
      uVar8 = uVar6 & 0xff | (uint)bVar2 << 8;
      uVar7 = 0;
      for (uVar6 = (uVar8 + 1 & 0xffff) >> 1; uVar6 != 0; uVar6 = uVar6 - 1) {
        bVar2 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar7 = merge_byte_into_word(CONCAT11(bVar2,bVar2),bVar2 & 0xf0,0);
        uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xff) >> 4,0);
        *DAT_000b461c = (byte)uVar7;
        DAT_000b461c = DAT_000b461c + 1;
        uVar7 = merge_byte_into_word(uVar7,(uVar7 & 0xffff) >> 8,0);
        uVar7 = merge_byte_into_word(uVar7,uVar7 & 0xf,0);
        *DAT_000b461c = (byte)uVar7;
        DAT_000b461c = DAT_000b461c + 1;
      }
    }
    DAT_000b4624 = pbVar4;
    DAT_000b5630 = pbVar4;
    DAT_000b4628 = pbVar5;
    DAT_000b461c = pbVar5;
    /* blit_sprite_row_remapped above resets DAT_000b4610 to the scratch DAT_000842ac (memset to
       0x0a) on the way out, but decode_gr_rle_stream's RLE fill looks its run colours up through
       DAT_000b4610... */
    DAT_000b4610 = (byte *)dest;
    decode_gr_rle_stream(uVar7,mode,uVar8);
    DAT_000b462c = DAT_000b4628;
  }
  return DAT_000b462c;
}





// was FUN_000130e0 -- merges param_2's own low byte into either the low half (param_3==0, keeping
// param_1's high byte) or high half (param_3!=0, keeping param_1's low byte) of param_1's 16-bit
// value.
uint merge_byte_into_word(uint word, uint new_byte, int into_high_byte)
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





// was FUN_00013108 -- decompress_gr_bitmap's own private setup helper (its only confirmed caller,
// inside that function's mode-4 branch): computes a table-row offset from param_2...
void select_gr_bitmap_remap_table(int unused_a, uint bank, int unused_b, uint shade)
{
  uint uVar1;
  
  uVar1 = (shade & 0xffff) >> 8;
  if (uVar1 != 0xff) {
    bank = bank & 0xff | uVar1 << 8;
  }
  uVar1 = merge_byte_into_word(bank,0,0);
  DAT_000b4610 = (byte *)(DAT_000b4614 + (uVar1 & 0xffff)); /* same cast as bitmap.c's sibling store */
  DAT_000b4624 = DAT_000b4610;
}


// was FUN_000132c4 -- confirmed by decompress_gr_bitmap's own pre-existing comment ("this
// function's RLE fill looks its run colours up through DAT_000b4610") as the RLE-stream decoder
// behind decompress_gr_bitmap's mode 6/8/0xa branches...
void decode_gr_rle_stream(int unused_a, int unused_b, uint offset)
{
  bool bVar1;
  undefined1 uVar2;
  byte bVar3;
  bool bVar4;
  byte *pbVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  byte *pbVar10;
  uint uVar11;
  
  bVar4 = false;
  DAT_000b4618 = DAT_000b5630 + (offset & 0xffff);
  pbVar10 = DAT_000b5630;
  uVar9 = 0;
LAB_000132fc:
  do {
    if (pbVar10 < DAT_000b4618) {
      DAT_000b5630 = pbVar10 + 1;
      uVar11 = merge_byte_into_word(0,*pbVar10,0);
      uVar8 = uVar11 & 0xff;
      if (2 < uVar8) {
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar2 = *(undefined1 *)(DAT_000b4610 + (uint)bVar3);
        iVar7 = 0;
        do {
          pbVar10 = DAT_000b5630;
          if ((int)(uVar11 & 0xffff) <= iVar7) goto LAB_00013530;
          iVar7 = iVar7 + 1;
          *DAT_000b461c = uVar2;
          DAT_000b461c = DAT_000b461c + 1;
        } while( true );
      }
      if (uVar8 != 2) {
        pbVar10 = DAT_000b5630;
        if (uVar8 == 1) goto LAB_00013530;
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar11 = merge_byte_into_word(uVar11,bVar3,0);
        if ((uVar11 & 0xff) != 0) {
          uVar11 = (uVar11 & 0x7ff) << 4;
          bVar3 = *DAT_000b5630;
          DAT_000b5630 = DAT_000b5630 + 1;
          uVar8 = merge_byte_into_word(uVar11,bVar3,0);
          bVar3 = *DAT_000b5630;
          DAT_000b5630 = DAT_000b5630 + 1;
          uVar6 = merge_byte_into_word(uVar8,bVar3,0);
          uVar2 = *(undefined1 *)(DAT_000b4610 + (uVar6 & 0xffff));
          uVar11 = uVar8 & 0xffff | uVar11;
          pbVar10 = DAT_000b5630;
          do {
            DAT_000b5630 = pbVar10;
            if (uVar11 == 0) goto LAB_00013530;
            uVar11 = uVar11 - 1;
            *DAT_000b461c = uVar2;
            DAT_000b461c = DAT_000b461c + 1;
            pbVar10 = DAT_000b5630;
          } while( true );
        }
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar11 = merge_byte_into_word((uint)bVar3 << 4,(uint)bVar3 << 4 & 0xff | (uint)*DAT_000b5630,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[1] | (uVar11 & 0xf) << 4,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[2] | (uVar11 & 0xf) << 4,0);
        pbVar10 = DAT_000b5630 + 3;
        DAT_000b5630 = DAT_000b5630 + 4;
        uVar8 = merge_byte_into_word(uVar11,*pbVar10,0);
        uVar2 = *(undefined1 *)((uVar8 & 0xff) + DAT_000b4610);
        uVar11 = uVar11 & 0xffff;
        pbVar10 = DAT_000b5630;
        do {
          DAT_000b5630 = pbVar10;
          if (uVar11 == 0) goto LAB_00013530;
          uVar11 = uVar11 - 1;
          *DAT_000b461c = uVar2;
          DAT_000b461c = DAT_000b461c + 1;
          pbVar10 = DAT_000b5630;
        } while( true );
      }
      bVar4 = true;
      uVar9 = (uint)*DAT_000b5630;
      pbVar10 = DAT_000b5630 + 1;
      pbVar5 = pbVar10;
      if (uVar9 == 0) {
        bVar3 = *pbVar10;
        pbVar5 = DAT_000b5630 + 2;
        if (bVar3 == 0) {
          DAT_000b5630 = DAT_000b5630 + 3;
          uVar9 = (uint)*pbVar5 << 4;
          uVar9 = merge_byte_into_word(uVar9,uVar9 & 0xff | (uint)*DAT_000b5630,0);
          uVar9 = merge_byte_into_word((uVar9 & 0x7ff) << 4,(uint)DAT_000b5630[1] | (uVar9 & 0xf) << 4,0);
          uVar9 = merge_byte_into_word((uVar9 & 0x7ff) << 4,(uint)DAT_000b5630[2] | (uVar9 & 0xf) << 4,0);
          pbVar10 = DAT_000b5630 + 3;
          uVar9 = uVar9 & 0xffff;
          pbVar5 = pbVar10;
        }
        else {
          pbVar10 = DAT_000b5630 + 3;
          uVar9 = (uint)*pbVar5 | (uint)bVar3 << 4;
          pbVar5 = pbVar10;
        }
      }
    }
    else {
      pbVar5 = DAT_000b5630;
      if ((int)uVar9 < 1) {
        return;
      }
    }
    do {
      DAT_000b5630 = pbVar5;
      uVar11 = uVar9 - 1;
      bVar1 = 0 < (int)uVar9;
      uVar9 = uVar11;
      if (bVar1) goto LAB_000132fc;
      bVar4 = false;
LAB_00013530:
      pbVar5 = DAT_000b5630;
    } while (bVar4);
    uVar11 = (uint)*pbVar10;
    DAT_000b5630 = pbVar10 + 1;
    if (uVar11 == 0) {
      DAT_000b5630 = pbVar10 + 2;
      uVar11 = merge_byte_into_word(0,pbVar10[1],0);
      if ((uVar11 & 0xff) == 0) {
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar11 = merge_byte_into_word((uint)bVar3 << 4,(uint)bVar3 << 4 & 0xff | (uint)*DAT_000b5630,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[1] | (uVar11 & 0xf) << 4,0);
        uVar11 = merge_byte_into_word((uVar11 & 0x7ff) << 4,(uint)DAT_000b5630[2] | (uVar11 & 0xf) << 4,0);
        uVar11 = uVar11 & 0xff;
        DAT_000b5630 = DAT_000b5630 + 3;
      }
      else {
        uVar11 = (uVar11 & 0x7ff) << 4;
        bVar3 = *DAT_000b5630;
        DAT_000b5630 = DAT_000b5630 + 1;
        uVar8 = merge_byte_into_word(uVar11,bVar3,0);
        uVar11 = uVar8 & 0xffff | uVar11;
      }
    }
    for (; pbVar10 = DAT_000b5630, DAT_000b5630 = pbVar10, uVar11 != 0; uVar11 = uVar11 - 1) {
      DAT_000b5630 = pbVar10 + 1;
      *DAT_000b461c = *(undefined1 *)(DAT_000b4610 + (uint)*pbVar10);
      DAT_000b461c = DAT_000b461c + 1;
    }
  } while( true );
}


// was FUN_00041260 -- called from open_gr_resource_file (src/resources.c:110) only for
// format-type-3 .GR files, right after the frame count (DAT_00202728) is read and before the main
// offset table...
int load_gr_format3_extra_table()

{
  int iVar1;
  undefined4 uVar2;

  iVar1 = read_file_handle(DAT_00202514,&DAT_00202724,1);
  if (iVar1 == 1) {
    if (*DAT_00202720 == (void *)0) {
      seek_file_handle(DAT_00202514,(uint)DAT_00202724 << 5,1);
    }
    else {
      *DAT_00202720 = ce_malloc((uint)DAT_00202724 << 5);
      iVar1 = read_file_handle(DAT_00202514,*DAT_00202720,(uint)DAT_00202724 << 5);
      if (iVar1 != (uint)DAT_00202724 * 0x20) goto LAB_000412d8;
    }
    uVar2 = 1;
  }
  else {
LAB_000412d8:
    uVar2 = 0;
  }
  return uVar2;
}



// was FUN_000414c8 -- closes the .GR resource file opened by
// open_gr_resource_file and frees its offset table, mirroring that
// function's open.
void close_gr_resource_file()

{
  CloseHandle(DAT_00202514);
  if (DAT_0020274c != 0) {
    LocalFree(DAT_0020274c);
  }
  return;
}



// was FUN_000414f4 -- reads one .GR resource record by index (param_1)
// into param_2, using the offset table open_gr_resource_file loaded to
// compute the record's file offset and size.
uint read_gr_resource_record(uint index, void *buffer)
{
  int *piVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  int iVar5;
  uint uVar6;
  
  index = index & 0xffff;
  if (index == (ushort)DAT_00202728 - 1) {
    iVar2 = seek_file_handle(DAT_00202514,0,2);
    iVar5 = *(int *)(DAT_0020274c + index * 4);
    uVar6 = iVar2 - iVar5;
  }
  else {
    piVar1 = (int *)(DAT_0020274c + index * 4);
    iVar5 = *piVar1;
    uVar6 = piVar1[1] - iVar5;
  }
  iVar5 = seek_file_handle(DAT_00202514,iVar5,0);
  if (iVar5 == -1) {
    uVar4 = 0xffffffff;
  }
  else {
    uVar6 = uVar6 & 0xffff;
    if (uVar6 == 0) {
      uVar4 = 0;
    }
    else {
      uVar3 = read_file_handle(DAT_00202514,buffer,uVar6);
      uVar4 = 0xffffffff;
      if (uVar3 == uVar6) {
        uVar4 = uVar6;
      }
    }
  }
  return uVar4;
}


// was FUN_00041708 -- load_gr_resource_entries's post-process callback for the flasks/compass/etc.
// resource group (passed as its param_5 at uw.c's "hud_icon_gr_bump_alloc_entry"-paired call site):
// allocates a fresh grtile buffer sized from the entry's own width/height header bytes...
int register_grtile_entry(void *buffer, uint unused, int index)
{
  void *pvVar1;

  /* buffer (a real buffer pointer, from load_gr_resource_entries's allocator callback) was
     declared int here and silently truncated to 32 bits on dereference... */
  pvVar1 = uw_alloc_grtile(*(undefined1 *)((char *)buffer + 1),*(byte *)((char *)buffer + 2) + 1);
  if (pvVar1 != 0) {
    ce_memmove(pvVar1,buffer,(uint)*(byte *)((char *)buffer + 2) * (uint)*(byte *)((char *)buffer + 1));
    g_grtile_registry[(uint)DAT_00202744 + (int)index] = pvVar1;
  }
  return pvVar1 != 0;
}



// was FUN_00041770 -- register_grtile_entry's "slot may already be populated" sibling, used for
// reload paths (e.g. the save/load menu's level reload)...
int reregister_grtile_entry(void *buffer, uint unused, int index)
{
  /* See register_grtile_entry -- same buffer/g_grtile_registry truncation fix. */
  void *pvVar1 = uw_alloc_grtile(*(byte *)((char *)buffer + 1),
                                  (uint)*(byte *)((char *)buffer + 2) + 1);
  if (pvVar1 == 0) {
    return 0;
  }
  ce_memmove(pvVar1,buffer,
               (uint)*(byte *)((char *)buffer + 2) * (uint)*(byte *)((char *)buffer + 1));
  g_grtile_registry[(uint)DAT_00202744 + (int)index] = pvVar1;
  return 1;
}


// was FUN_00041910 -- the generic .GR resource-group loader: registers every entry at the running
// absolute-frame cursor DAT_00202744 (via register_gr_group_entry -> uw_register_gr_entry) then
// advances the cursor by the file's own entry count.
int load_gr_resource_group(char *path)
{
  undefined4 uVar1;
  short _dbg_before;
  _dbg_before = DAT_00202744;
  uVar1 = load_gr_resource_entries(path,0,-1,&gr_resource_bump_alloc_entry,&register_gr_group_entry);
  DAT_00202744 = (short)DAT_00202728 + DAT_00202744;
  return uVar1;
}



// was FUN_00041960 -- loads OBJECTS.GR specifically: registers each entry at absolute cursor 0
// (register_objects_gr_entry) rather than the running DAT_00202744 cursor, and does NOT advance it
// -- OBJECTS.GR occupies the absolute [0, entry_count) frame range (frame N == object type N)...
int load_objects_gr(char *path)
{
  return load_gr_resource_entries(path,0,-1,&gr_resource_bump_alloc_entry,&register_objects_gr_entry);
}



// was FUN_00041990
int load_tmflat_gr(char *path, short texture_base, int entry_count)
{
  DAT_000859a8 = texture_base;
  return load_gr_resource_entries(path,0,entry_count,&gr_resource_bump_alloc_entry,&register_tmflat_gr_entry);
}



// was FUN_000419c8 -- loads a HUD icon .GR resource (flasks, compass, dragons, power, eyes, chains,
// spells, scroll-edge, etc.) by registering each entry via register_grtile_entry rather than
// uw_register_gr_entry...
int load_hud_icon_gr(char *path)
{
  /* Ghidra dropped load_gr_resource_entries's result and always returned failure
     (see select_default_hud_font for the same pattern); propagate the real result. */
  undefined4 uVar1;
  short _dbg_before;
  _dbg_before = DAT_00202744;
  uVar1 = load_gr_resource_entries(path,0,-1,&hud_icon_gr_bump_alloc_entry,register_grtile_entry);
  DAT_00202744 = (short)DAT_00202728 + DAT_00202744;
  return uVar1;
}



// was FUN_00041a18 -- reloads a SINGLE .GR entry (count=1) into its existing grtile slot via
// reregister_grtile_entry, temporarily repointing the running cursor DAT_00202744 at the entry's
// own absolute frame (derived from param_1, a symbolic sprite id >= 0x2000) for the one call...
/* Was `undefined4`, truncating the real resource-name string pointer callers pass (e.g.
   reload_paperdoll_body_sprite's s_bodies_00085c58) before it reaches load_gr_resource_entries's
   own `char *param_1`, which then crashed dereferencing it. */
void reload_single_grtile_entry(short slot, char *path, int entry_index)
{
  undefined2 uVar1;

  uVar1 = DAT_00202744;
  DAT_00202744 = DAT_00202738 + slot + -0x2000;
  load_gr_resource_entries(path,entry_index,1,&hud_icon_gr_bump_alloc_entry,reregister_grtile_entry);
  DAT_00202744 = uVar1;
}



/* Was `load_gr_resource_entries(...); return 0;` -- a dropped return value (same class as
   FUN_00045054/get_scanned_object_class_effect_ptr elsewhere this session):
   load_gr_resource_entries has a real `uint` return... */
// was FUN_00041a78 -- decodes a single .GR entry directly into a caller-supplied destination buffer
// (param_3, stashed in DAT_00202510 and consumed by uw_copy_gr_entry_to_dest) rather than
// registering it in g_grtile_registry.
int decode_gr_entry_to_buffer(char *path, int entry_index, void *dest)
{
  DAT_00202510 = dest;
  /* Was a hardcoded `0` (no post-process callback) -- see uw_copy_gr_entry_to_dest's own comment:
     without a real callback here, load_gr_resource_entries decodes into its own throwaway buffer
     and DAT_00202510 (this function's whole reason for existing) is never actually consulted... */
  return load_gr_resource_entries(path,entry_index,1,&decode_gr_entry_bump_alloc_entry,&uw_copy_gr_entry_to_dest);
}


// was FUN_0002295c -- a Win32 LoadString-shaped resource-string loader: loads string resource
// param_1 into a fixed static buffer and returns its address. Confirmed as "LoadString-shaped" by
// an existing comment on win_file_exists, one of its callers.
char *load_string_resource(char *text)
{
  MultiByteToWideChar(0,2,text,0xffffffff,(char *)&DAT_000fb650,0xff);
  return &DAT_000fb650;
}



// was FUN_00022998 -- structurally identical to load_string_resource but via a different ordinal
// (WideCharToMultiByte, two extra trailing arguments) and a larger buffer (0x260 vs 0xff) -- likely
// a longer- message variant of the same LoadString-shaped resource loader.
char *load_string_resource_large(char *text)
{
  WideCharToMultiByte(0,0x260,text,0xffffffff,(char *)&DAT_000fb550,0xff,0,0);
  return &DAT_000fb550;
}


// was FUN_000417b4
uint load_gr_resource_entries(char *path, int first_entry, short count, gr_alloc_fn *allocator, gr_entry_fn *post_process)
{
  int iVar1;
  int iVar2;
  uint uVar3;
  int extraout_r2;
  int iVar4;
  int iVar5;
  uint uVar6;
  undefined2 local_8;
  /* allocator is an allocator callback (returns a real buffer pointer, sized by the byte count in
     iVar4) -- Ghidra's 'iVar2' held both the item index (int arithmetic, above) and the allocator's
     return value at different points in the loop... */
  void *pvVar_buf;
  
  uVar6 = 1;
  if (path == 0 || path[0] == '\0') {
    /* A handful of resource-name string constants at this call site's original address were never
       recovered by Ghidra (no content, just a dangling address -- see README "Unrecoverable string
       tables"). */
    DAT_00202728 = 0;
    return uVar6;
  }
  iVar1 = open_gr_resource_file(path,1);
  if (iVar1 == 0) {
    uVar6 = 0;
  }
  else {
    iVar1 = extraout_r2;
    if (count < 0) {
      iVar1 = first_entry << 0x10;
    }
    iVar5 = 0;
    if (count < 0) {
      count = (short)((uint)(((int)(short)(ushort)DAT_00202728 - (iVar1 >> 0x10)) * 0x10000) >>
                       0x10);
    }
    iVar1 = first_entry;
    if (0 < count) {
      while (uVar6 != 0) {
        iVar1 = iVar1 + (short)iVar5;
        iVar2 = iVar1 * 0x10000 >> 0x10;
        if ((int)(uint)(ushort)DAT_00202728 <= iVar2) {
          uVar6 = 0;
          break;
        }
        iVar4 = *(int *)(DAT_0020274c + iVar2 * 4 + 4) - *(int *)(DAT_0020274c + iVar2 * 4);
        pvVar_buf = (*allocator)(iVar4);
        if ((pvVar_buf == 0) || (iVar1 = read_gr_resource_record(iVar1,pvVar_buf), iVar4 != iVar1)) {
          uVar6 = 0;
        }
        else {
          if (post_process != (gr_entry_fn *)0x0) {
            uVar3 = (*post_process)(pvVar_buf,iVar4,iVar5);
            uVar6 = uVar6 & uVar3;
          }
        }
        iVar5 = ((short)iVar5 + 1) * 0x10000 >> 0x10;
        if (count <= iVar5) break;
        local_8 = (short)first_entry;
        iVar1 = (int)local_8;
      }
    }
    close_gr_resource_file();
  }
  return uVar6;
}









// was FUN_00041e40
void load_armor_variant_tables(int file_handle)
{
  read_file_handle(file_handle, g_melee_type_props, sizeof g_melee_type_props);
  read_file_handle(file_handle, g_ranged_type_props,
                   sizeof g_ranged_type_props);
  read_file_handle(file_handle, g_armor_type_props, sizeof g_armor_type_props);
}


// was load_pals_bank -- read PALS.DAT bank param_1 (768 raw bytes) into param_2 and
// install it via build_rgb565_palette
// was FUN_00040e24
bool load_pals_bank(int bank, void *dest)
{
  char stack0xffdc2f38_buf [256];
  char *stack0xffdc2f38_ptr;
  char cVar1;
  short sVar2;
  char *pcVar3;
  undefined4 uVar4;
  char acStack_420 [264];
  undefined1 auStack_318 [768];

  pcVar3 = (char *)&DAT_0023cca8; /* install-dir string (global typed undefined1[]) */
    stack0xffdc2f38_ptr = acStack_420;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc2f38_ptr = cVar1; stack0xffdc2f38_ptr = stack0xffdc2f38_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_420,s__DATA_pals_dat_00085978);
  uVar4 = open_file_for_read(acStack_420);
  seek_file_handle(uVar4,(short)bank * 0x300,0);
  sVar2 = read_file_handle(uVar4,dest,0x300);
  CloseHandle(uVar4);
  if (sVar2 == 0x300) {
    expand_pals_bytes((byte *)auStack_318,dest,0);
    build_rgb565_palette(auStack_318,bank);
  }
  return sVar2 == 0x300;
}



// was set_palette_bank -- switch active palette to PALS.DAT bank param_1 (load into
// DAT_00088d98, install, reinstall_active_palette)
// was FUN_00040efc
bool set_palette_bank(int bank)
{
  int iVar1;
  
  iVar1 = load_pals_bank(bank,&DAT_00088d98);
  if (iVar1 != 0) {
    reinstall_active_palette(0x100,0,0);
  }
  return iVar1 != 0;
}


/* Extracted from decode_critter_sprite_page (was inlined at its top) so resolve_critter_sprite_tier
   can also load/cache a candidate tier's page and inspect its real (base, span) -- see that
   function's own comment for why. */
byte *uw_load_critter_page_cached(int param_1, int param_2) {
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  int iVar1;
  char cVar2;
  char *pcVar4;
  int iVar5;
  byte *pbVar11;

  /* Tracks (page,tier) slots already confirmed to have no file, separate from DAT_00202308 (0=never
     tried, else=a real ce_malloc pointer that shutdown_game_resources unconditionally frees at
     shutdown -- stuffing a sentinel in there instead would make that loop free garbage). */
  static char known_missing[256];

  iVar1 = (param_2 + param_1 * 4) * 0x10000 >> 0x10;
  if ((unsigned)iVar1 < sizeof(known_missing) && known_missing[iVar1]) {
    return (byte *)0;
  }
  pbVar11 = (byte *)(&DAT_00202308)[iVar1];
  if (pbVar11 == (byte *)0x0) {
    DAT_00085928 = (char)((short)param_1 >> 3) + '0';
    DAT_00085929 = ((byte)param_1 & 7) + 0x30;
    DAT_00085930 = (char)((short)param_2 >> 3) + '0';
    DAT_00085931 = ((byte)param_2 & 7) + 0x30;
    pcVar4 = (char *)&DAT_0023cca8; /* install-dir string (global typed undefined1[]) */
    stack0xffdc3238_ptr = stack0xffdc3238_buf;
    do {
      cVar2 = *pcVar4;
      *stack0xffdc3238_ptr = cVar2; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar2 != '\0');
    ce_strcat(stack0xffdc3238_buf, &DAT_00085920);
    iVar5 = open_file_for_read(stack0xffdc3238_buf);
    if (iVar5 == -1) {
      DEBUG(ERR, "[glyphpage] open FAILED, skipping: %s (param_1=%d param_2=%d)\n",
            stack0xffdc3238_buf, param_1, param_2);
      if ((unsigned)iVar1 < sizeof(known_missing)) known_missing[iVar1] = 1;
      return (byte *)0;
    }
    pbVar11 = (byte *)ce_malloc(0x7fff);
    (&DAT_00202308)[iVar1] = pbVar11;
    read_file_handle(iVar5,pbVar11,0x7fff);
    CloseHandle(iVar5);
  }
  return pbVar11;
}


// was FUN_0004a02c
void load_light_food_effect_tables(int file_handle)
{
  read_file_handle(file_handle, g_container_type_props,
                   sizeof g_container_type_props);
  read_file_handle(file_handle, g_light_type_props, sizeof g_light_type_props);
  read_file_handle(file_handle,&g_food_effect_table,0x10);
}


void *gr_resource_bump_alloc_entry(unsigned int byte_count)
{
  /* Ghidra couldn't resolve this address into a proper function (an indirect-jump/jumptable target
     it gave up on). */
  return ce_malloc(byte_count);
}
/* load_gr_resource_entries's post-process callback: (decoded_buffer, byte_size, entry_index). */
#define UW_DAT_0024E090_SLOTS (sizeof(g_grtile_registry) / sizeof(g_grtile_registry[0]))
static void uw_register_gr_entry(unsigned base, void *buf, int idx)
{
  unsigned slot = base + (unsigned)idx;
  if (slot < UW_DAT_0024E090_SLOTS) {
    g_grtile_registry[slot] = buf;
  }
}
int register_gr_group_entry(void *buf, unsigned size, int idx)
{
  /* Caller load_gr_resource_group loads at the running cursor DAT_00202744 and
     advances it by the file's entry count afterwards. */
  (void)size;
  uw_register_gr_entry((unsigned)DAT_00202744, buf, idx);
  return 1;
}
int register_objects_gr_entry(void *buf, unsigned size, int idx)
{
  /* Caller load_objects_gr (OBJECTS.GR) -- does not advance the cursor; the
     next file resets DAT_00202744 to 0x1c0, so OBJECTS.GR occupies the
     absolute [0, entry_count) range (frame N == object type N). */
  (void)size;
  uw_register_gr_entry(0, buf, idx);
  return 1;
}
// was LAB_00041670
int register_tmflat_gr_entry(void *buf, unsigned size, int idx)
{
  /* Caller load_tmflat_gr (TMFLAT.GR) with a fixed id base stashed in DAT_000859a8 (0x170). Real
     ARM (0x41670): registers each entry at the running cursor DAT_00202744 and ADVANCES the cursor
     by one, recording DAT_0024d090[(0x170+idx)*4] = frame as the object-id -> frame remap. */
  (void)size;
  uw_register_gr_entry((unsigned)DAT_000859a8, buf, idx);
  uw_register_gr_entry((unsigned)DAT_00202744, buf, 0);
  DAT_00202744 = DAT_00202744 + 1;
  return 1;
}
void *hud_icon_gr_bump_alloc_entry(unsigned int byte_count)
{
  /* Allocator callback, same role as gr_resource_bump_alloc_entry -- see there. Used by
     load_hud_icon_gr/reload_single_grtile_entry (flasks/compass/dragons/power/chains/
     spells/scrledge and friends). */
  return ce_malloc(byte_count);
}
void *decode_gr_entry_bump_alloc_entry(unsigned int byte_count)
{
  /* Allocator callback, same role as gr_resource_bump_alloc_entry -- see there. Used by
     decode_gr_entry_to_buffer, which passes no post-process callback (param_5 == 0). */
  return ce_malloc(byte_count);
}
/* Not decompiled -- decode_gr_entry_to_buffer's post-process callback. */
int uw_copy_gr_entry_to_dest(void *buf, uint size, int idx)
{
  (void)idx;
  if (DAT_00202510 != 0) {
    memcpy(DAT_00202510, buf, size);
  }
  return 1;
}

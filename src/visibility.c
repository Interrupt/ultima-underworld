/* Dungeon-view visibility and per-frame draw-list build: texture-id list loading, the visibility
   light grid/ray flood-fill, and the top-level per-frame redraw dispatch (full/timed/rebuild). */
#include "headers/visibility.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define _DAT_0023aee1 (*(uint*)&DAT_0023aee1)
#define _DAT_0023aee3 (*(uint*)&DAT_0023aee3)
#define _DAT_0023af02 (*(uint*)&DAT_0023af02)
// was DAT_0023bca0 -- shading distance loaded from SHADES.DAT field 3.
// Keep the historical name; the ARM ray flood has its own fixed 16-row bound.
short g_visibility_max_ring_passes;
/* Sizing-audit pass: wall-tmap-id list. Loader fills 48 entries (`while(iVar4<0x30)`) and
   interact.c's own reader guards `if(iVar1<0x30)` before indexing -- both bounds agree exactly.
   HARD: 48 elements (96 bytes). Down from 8192. */
 undefined2 DAT_0023ae58_backing[48];
/* Both real 0x80-element pointer-cache arrays (per free_frame_geometry_buffers's own comment --
   "DAT_0023c7a0[0x140], DAT_002020f8[0x80]" -- and shutdown_game_resources's matching
   0x80-iteration cleanup loop for DAT_00202308)... */
void *DAT_002020f8_arr[256];
char *DAT_0023ae34;
char *DAT_0023ae30;
/* Parallel array to DAT_0024f090 (0x3a/58 entries) -- see that array's
   own comment. */
static undefined1 DAT_0024f0ca_backing[64];
#define DAT_0024f0ca DAT_0024f0ca_backing[0]
undefined2 DAT_0023adb0;
/* Sizing-audit pass: pure scalar (`DAT_0023aeb8 = 10;`), passed by
   address into load_texture_arena purely as a `short*` count output,
   never indexed. Down from 8192 elements. */
 undefined2 DAT_0023aeb8_backing[4];
/* Was a lone `undefined2` scalar, but it is the per-level floor/ceiling texture-id list --
   reset_texture_id_lists / load_level_texture_ids write (&DAT_0023adb8)[0..9] and
   load_texture_arena reads them to pick which F32.TR / W16.TR entries to load into the 10-slot... */
/* Sizing-audit pass: floor-tmap-id list. Loader fills only 10 entries, but doors.c's own reader
   indexes it with an explicit `&0xf` mask (0-15) -- the wider read-side bound governs. HARD: 16
   elements (32 bytes). Down from 8192. */
 undefined2 DAT_0023adb8_backing[16];
/* Really a 58 (0x3a)-entry byte array, paired with the parallel DAT_0024f0ca array right below --
   reset_texture_id_lists's own loop proves the bound (`for (iVar3 = ...; iVar3 < 0x3a; ...)`
   zeroing both `(&DAT_0024f090)[iVar3]` and `(&DAT_0024f0ca)[iVar3]`). */
static undefined1 DAT_0024f090_backing[64];
#define DAT_0024f090 DAT_0024f090_backing[0]
static char s_bad_tmap_ids_size_000869b7[] = " bad tmap ids size\n";
/* High byte of DAT_0023b840's packed short (write pattern: `(&DAT_0023b840)[i] = low;
   (&DAT_0023b841)[i] = high;`, read back combined via CONCAT11 and via `*(short*)(&DAT_0023b840 +
   offset)` in saveload.c/resources.c)... */
#define DAT_0023b841 DAT_0023b840_backing[1]
/* Was a lone `undefined` scalar. It is the base of the texture / shade / colour-light table arena:
   load_dungeon_texture_arenas sets DAT_0023ae38 = &DAT_002049e0 and loads several .tr/.dat files
   into it, then get_texture_page hands out `&DAT_002049e0 + page*stride` pointers. */
undefined1 DAT_002049e0_backing[0x40000];
static char s__DATA_terrain_dat_000869ec[] = "\\DATA\\terrain.dat";
// was DAT_0023b01c -- set by the 3D-viewport setup function (configure_dungeon_viewport) whenever
// the real in-game dungeon-view mode (game mode bit 0, not a menu/conversation overlay) is active;
// gates weapon_overlay_and_full_redraw's weapon-overlay draw.
undefined4 g_dungeon_view_active;
undefined2 DAT_0023b020;
undefined2 DAT_0023aed4;
undefined2 *DAT_0023aed0;
static short DAT_0023b4cc;
static char s_R__lu_P__lu_S__lu_F__d__d_00086b04[] = "R:%lu P:%lu S:%lu F:%d.%d";
/* Sizing pass: explicit 16-slot ring buffer (`DAT_0023b4c8 = sVar1 +
   1U & 0xf`), 2-byte stride -- real max 15*2+2=32 bytes. */
static undefined1 DAT_0023b4a8_backing[64];
#define DAT_0023b4a8 DAT_0023b4a8_backing[0]
static int DAT_0023aec8;
static ushort DAT_0023b4c8;
static undefined1 DAT_0023b028;
static undefined *DAT_0023b02c;
/* Original 0x23b039 is the light byte immediately after the visibility byte at 0x23b038. Both are
   fields of the same 0x42-byte-stride grid. A separate backing array disconnected the lighting
   writer from the ray flood and automap readers, making every tile appear fully lit. */
#define DAT_0023b039 g_visibility_ring_buffer_backing[1]
static undefined1 g_visibility_ring_done;
/* g_visibility_ray_table-family: ~20 separately-declared globals that are really one 16-entry x
   0x15(21)-byte per-ray record array for the dungeon's geometric beam-trace visibility flood... */
static undefined1 g_visibility_ray_table_backing[1024];
#define g_visibility_ray_table g_visibility_ray_table_backing[0]
/* Real-pointer side table for this record array's "back pointer" field (offsets 9/0xa-0xb/0xc),
   which the original 32-bit binary packed as raw bytes -- see advance_visibility_ray's comment on
   why that can't be reassembled into a real 64-bit pointer on this port. */
static char *g_visibility_ray_realptr[24];
/* Packed offset 0xd is the moving visibility-grid cursor. Offset 0x11 is a snapshot taken by
   advance_visibility_ray before/after advancing, depending on the ray direction. The flood clears
   up to that snapshot, not the moving cursor (ARM FUN_0005d13c reads bytes 0x11..0x14). */
static char *g_visibility_ray_realptr2[24];
static char *g_visibility_ray_clearptr[24];
#define DAT_0023aee1 g_visibility_ray_table_backing[1]
#define DAT_0023aee3 g_visibility_ray_table_backing[3]
#define DAT_0023aee5 g_visibility_ray_table_backing[5]
#define DAT_0023aee6 g_visibility_ray_table_backing[6]
#define DAT_0023aee7 g_visibility_ray_table_backing[7]
#define DAT_0023aee8 g_visibility_ray_table_backing[8]
#define DAT_0023aee9 g_visibility_ray_table_backing[9]
#define DAT_0023aeea (*(undefined2 *)&g_visibility_ray_table_backing[0xa])
#define DAT_0023aeec g_visibility_ray_table_backing[0xc]
#define DAT_0023aeed g_visibility_ray_table_backing[0xd]
#define DAT_0023aeee (*(undefined2 *)&g_visibility_ray_table_backing[0xe])
#define DAT_0023aef0 g_visibility_ray_table_backing[0x10]
#define DAT_0023aef1 g_visibility_ray_table_backing[0x11]
#define DAT_0023aef5 g_visibility_ray_table_backing[0x15]
#define DAT_0023aef6 (*(undefined2 *)&g_visibility_ray_table_backing[0x16])
#define DAT_0023aef8 (*(undefined2 *)&g_visibility_ray_table_backing[0x18])
#define DAT_0023aefa g_visibility_ray_table_backing[0x1a]
#define DAT_0023aefb g_visibility_ray_table_backing[0x1b]
#define DAT_0023aefc g_visibility_ray_table_backing[0x1c]
#define DAT_0023aefd g_visibility_ray_table_backing[0x1d]
#define DAT_0023aefe (*(undefined2 *)&g_visibility_ray_table_backing[0x1e])
#define DAT_0023af00 (*(undefined2 *)&g_visibility_ray_table_backing[0x20])
#define DAT_0023af02 g_visibility_ray_table_backing[0x22]
/* {0x10, 0x00}: compute_visibility_ray_offset reads (&DAT_00086af0)[bool].
   Was a silently-zero undefined4. */
static const undefined1 DAT_00086af0_arr[4] = { 0x10, 0x00, 0x00, 0x00 };
#define DAT_00086af0 (*(undefined1 *)DAT_00086af0_arr)
/* Recovered from UU.exe .data at 0x86af8 (12 bytes = 6 int16). Was two separate silently-zero 64KB
   Ghidra arrays (DAT_00086af8, DAT_00086b00) plus a bare literal `0x86afc` deref in
   advance_visibility_ray. */
static const undefined1 DAT_00086af8_region[12] = {
  0x02,0x00, 0x04,0x00, 0x02,0x00, 0x03,0x00, 0xff,0xff, 0x01,0x00,
};
#define DAT_00086af8 (*(undefined1 *)(DAT_00086af8_region + 0))
#define DAT_00086afc (*(undefined1 *)(DAT_00086af8_region + 4))
#define DAT_00086b00 (*(undefined1 *)(DAT_00086af8_region + 8))
short g_visibility_ring_depth;
undefined1 g_visibility_ring_buffer_backing[32768];
/* Was silently zero -- read into a draw-command opcode and into DAT_00189578 (both widened casts of
   this one byte). Confirmed via a Ghidra memory dump of the real UU.exe that its actual value is 1,
   not zero; no writer anywhere in this decompile. */
static undefined DAT_00086b34 = 1;
undefined2 DAT_00189578;
undefined DAT_0023b4dc;
short DAT_00086b2c;
undefined2 DAT_00189582;
short DAT_00086b28;
ushort DAT_0023adc0;
static char s__DATA_f16_tr_00086dd8[] = "\\DATA\\f16.tr";
static char s__DATA_f32_tr_00086de8[] = "\\DATA\\f32.tr";
static char s__DATA_shades_dat_000872a4[] = "\\DATA\\shades.dat";
char s__DATA_light_dat_000872c8[] = "\\DATA\\light.dat";
static char s__DATA_xfer_dat_000872d8[] = "\\DATA\\xfer.dat";
/* Ghidra rendered the embedded spaces as underscores. Real bytes at
   0x872e8 (ARM UU.exe .data): "cLightTabs allocation error ...". */
static char s_cLightTabs_allocation_error_____000872e8[] = "cLightTabs allocation error ...";
/* Sizing-audit pass: `read_file_handle(iVar3,&DAT_0024fa38,0x600)`
   -- exact 1536 bytes, sole usage. HARD exact. Down from 3072. */
static undefined1 DAT_0024fa38_backing[1536];
#define DAT_0024fa38 DAT_0024fa38_backing[0]

/* Only entries 0 and 1 (the player's own visibility-ray slot, always populated by
   seed_visibility_queue) are ever given a real pointer -- a monster-free dungeon has nothing to
   populate the other 14 with. */
static char g_visibility_ray_fallback[64];
#define VISIBILITY_RAY_REALPTR(table, idx) \
    ((table)[(idx)] != 0 ? (table)[(idx)] : g_visibility_ray_fallback)
/* Slot 16 (past the 0..15 nibble-addressable real entries) is a scratch slot for
   merge_adjacent_visibility_rays's acStack_28 -- a stack-local COPY of a real entry that the
   un-stubbed extend_visibility_ray_row / the spreading branch walk in place. */
#define VISIBILITY_RAY_SCRATCH_IDX 16
static int visibility_ray_idx(const void *p) {
    intptr_t off = (intptr_t)p - (intptr_t)g_visibility_ray_table_backing;
    if (off < 0 || off + 0x15 > (intptr_t)sizeof(g_visibility_ray_table_backing))
        return VISIBILITY_RAY_SCRATCH_IDX;
    return (int)(off / 0x15);
}






// was FUN_0005b054 -- reset texture id lists to identity + default counts (0x30 wall, 10 floor)
int reset_texture_id_lists()
{
  int iVar1;
  int iVar2;
  int iVar3;

  iVar3 = 0;
  do {
    (&DAT_0023ae58)[iVar3] = (short)iVar3;
    (&DAT_0023add0)[iVar3] = 0;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 0x30);
  iVar3 = 0;
  do {
    (&DAT_0023adb8)[iVar3] = (short)iVar3;
    (&DAT_0023ae40)[iVar3] = 0;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 10);
  iVar3 = 0;
  do {
    (&DAT_0023b840)[iVar3] = (char)iVar3;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 6);
  DAT_0023adb0 = 0x30;
  DAT_0023aeb8 = 10;
  load_dungeon_texture_arenas();
  /* Was `puVar4 = &DAT_0024f090 + iVar3; *puVar4 = 0; puVar4[0x3a] = 0;` -- the `[0x3a]` reached
     for DAT_0024f0ca by relying on it sitting exactly 0x3a bytes after DAT_0024f090 in memory (see
     both arrays' own comment). */
  iVar3 = 0;
  do {
    iVar1 = (iVar3 + 1) * 0x10000;
    iVar2 = iVar1 >> 0x10;
    if (iVar3 < 0xc) {
      (&DAT_0024f090)[iVar3] = 0;
      (&DAT_0024f0ca)[iVar3] = 0;
    }
    iVar3 = iVar2;
  } while (iVar2 < 0x30);
  for (iVar3 = (int)(short)((uint)iVar1 >> 0x10); iVar3 < 0x3a;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10) {
    (&DAT_0024f090)[iVar3] = 0;
    (&DAT_0024f0ca)[iVar3] = 0;
  }
  return 1;
}



// was FUN_0005b188 -- read the level's 0x7a-byte tmap-id block (48 wall + 10 floor + 3) from the .ark
/* .ark handle-struct pointer -- was `undefined4`, truncating it before read_archive_entry. */
bool load_level_texture_ids(byte *archive, int level_number)
{
  int iVar1;
  undefined2 uVar2;
  short sVar3;
  int iVar4;
  /* local_90[48] / local_30[10] / local_1c[6] were separate Ghidra locals whose names encode
     adjacent stack offsets (-0x90, -0x30, -0x1c) -- one contiguous 128-byte / 64-short region.
     read_archive_entry reads exactly 0x7a = 122 bytes into it (96 + 20 + 6)... */
  undefined2 local_tmap_buf [64];

  sVar3 = read_archive_entry(archive,level_number + 0x11,local_tmap_buf);
  if (sVar3 != 0x7a) {
    debug_print(s_bad_tmap_ids_size_000869b7 + 1);
  }
  iVar4 = 0;
  do {
    (&DAT_0023add0)[iVar4] = 0;
    iVar1 = (iVar4 + 1) * 0x10000 >> 0x10;
    (&DAT_0023ae58)[iVar4] = local_tmap_buf[iVar4];
    iVar4 = iVar1;
  } while (iVar1 < 0x30);
  iVar4 = 0;
  do {
    (&DAT_0023ae40)[iVar4] = 0;
    iVar1 = (iVar4 + 1) * 0x10000 >> 0x10;
    (&DAT_0023adb8)[iVar4] = local_tmap_buf[48 + iVar4];
    iVar4 = iVar1;
  } while (iVar1 < 10);
  load_terrain_texture_props((char *)&DAT_0023ae58,(char *)&DAT_0023adb8);
  iVar4 = 0;
  do {
    uVar2 = local_tmap_buf[58 + iVar4];
    (&DAT_0023b840)[iVar4 * 2] = (char)uVar2;
    (&DAT_0023b841)[iVar4 * 2] = (char)((ushort)uVar2 >> 8);
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 3);
  load_dungeon_texture_arenas();
  return sVar3 == 0x7a;
}




/* param_2 (a short* remap/index table) and param_4 (the destination arena region) were `int`,
   truncating the real pointers -- fread'ing texture data through a chopped &DAT_002049e0 segfaulted
   the moment the .tr files actually opened. */
// was FUN_0005b514 -- load selected entries of a .tr texture file (ids in list param_2) into an arena
void load_texture_arena(char *path, short *id_list, short *out_count, char *arena)
{
  int iVar1;
  char *iVar2; /* was int -- ce_calloc() offset-table allocation */
  int iVar3;
  int iVar4;
  int iVar5;
  byte local_24 [2];
  short local_22;

  iVar1 = open_file_for_read(path);
  if (iVar1 == -1) {
    /* path is built from "\DATA\" (s__DATA__00085970) with no filename ever appended -- Ghidra
       dropped whatever ce_strcat call(s) would have added the actual texture-LUT filename... */
    *out_count = 0;
    return;
  }
  read_file_handle(iVar1,local_24,1);
  if (local_24[0] != 2) {
    report_fatal_error_and_exit(0x3010);
  }
  read_file_handle(iVar1,local_24,1);
  iVar5 = (uint)local_24[0] * (uint)local_24[0];
  read_file_handle(iVar1,&local_22,2);
  iVar2 = ce_calloc(4,(int)local_22);
  if (iVar2 == 0) {
    report_fatal_error_and_exit(0x1008);
    iVar3 = (int)local_22;
  }
  else {
    read_file_handle(iVar1,iVar2,(int)local_22 << 2);
    iVar3 = 0;
    if (0 < *out_count) {
      iVar3 = 0;
      do {
        /* Ghidra kept a byte *2 scale from the original `*(short*)((char*)base + i*2)` but also
           retyped id_list as short* -- the two compound, so this read every OTHER id (idlist[0],
           idlist[2], idlist[4]...). */
        iVar4 = (int)id_list[iVar3];
        if (iVar4 < 0) break;
        seek_file_handle(iVar1,*(undefined4 *)(iVar2 + iVar4 * 4),0);
        iVar4 = read_file_handle(iVar1,arena,iVar5);
        if (iVar4 != iVar5) {
          report_fatal_error_and_exit(0x3012);
        }
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
        arena = iVar5 + arena;
      } while (iVar3 < *out_count);
    }
  }
  *out_count = (short)iVar3;
  LocalFree(iVar2);
  CloseHandle(iVar1);
}



// was FUN_0005b660 -- load TERRAIN.DAT texture-property words -> DAT_0023add0 (wall) / DAT_0023ae40 (floor)
/* Both are bases into the tmap-id arrays load_level_texture_ids fills (&DAT_0023ae58 and
   &DAT_0023adb8) -- Ghidra dropped both args at the lone call site and typed them `int`, so the
   reads below hit a bogus address and segfaulted level init. */
void load_terrain_texture_props(char *wall_texture_ids, char *floor_texture_ids)
{
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  char acStack_120 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3238_ptr = acStack_120;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3238_ptr = cVar1; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_120,s__DATA_terrain_dat_000869ec);
  iVar3 = open_file_for_read(acStack_120);
  if (iVar3 != 0) {
    iVar4 = 0;
    do {
      seek_file_handle(iVar3,(int)*(short *)(iVar4 * 2 + wall_texture_ids) << 1,0);
      read_file_handle(iVar3,&DAT_0023add0 + iVar4,2);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x30);
    iVar4 = 0;
    do {
      seek_file_handle(iVar3,(*(short *)(iVar4 * 2 + floor_texture_ids) + 0x100) * 2,0);
      read_file_handle(iVar3,&DAT_0023ae40 + iVar4,2);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 10);
    CloseHandle(iVar3);
  }
}




// was FUN_0005b890 -- reset the draw-command list write cursor DAT_00110fc0 back to its base DAT_0023aed0
void draw_command_list_rewind()
{
  DAT_00110fc0 = (char *)DAT_0023aed0;
}



// was FUN_0005b8ac -- per-frame teardown: free the scratch geometry / clip-vertex lists (DAT_0023c7a0[0x140], DAT_002020f8[0x80]) via LocalFree
void free_frame_geometry_buffers()
{
  void **piVar1;
  int iVar2;

  /* DAT_0023c7a0 is now a real void*[] (see its declaration); walk it as one so whole 8-byte slots
     clear (the old int* stride freed/zeroed only the low half of each pointer). */
  {
    int _i;
    for (_i = 0; _i < 0x140; _i++) {
      if (DAT_0023c7a0_arr[_i] != 0) { LocalFree(DAT_0023c7a0_arr[_i]); DAT_0023c7a0_arr[_i] = 0; }
    }
  }
  piVar1 = &DAT_002020f8;
  iVar2 = 0x80;
  do {
    if (*piVar1 != 0) {
      LocalFree(*piVar1);
      *piVar1 = 0;
    }
    iVar2 = iVar2 + -1;
    piVar1 = piVar1 + 1;
  } while (iVar2 != 0);
}




// was FUN_0005bb5c
void full_dungeon_redraw()
{
  build_frame_draw_list();
  draw_command_list_rewind();
  rebuild_dungeon_view();
  finalize_glyph_draw_command(0xa0);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  set_viewport_clip_rect(0x34,0x13,DAT_0023b020 + 0x33,DAT_0023aed4 + 0x12);
  render_dungeon_view();
  set_viewport_clip_rect(0,0,0x13f,199);
}



// was FUN_0005bbe0 -- timed dungeon-view redraw: rebuild the draw list if needed, run render_dungeon_view, measure it (read_realtime_clock_units) and feed an adaptive-quality value
void render_dungeon_frame_timed()
{
  int uw_ord2005_rem_122 = 0;
  short sVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  short extraout_r1;
  short sVar9;
  undefined1 auStack_60 [60];
  
  DAT_0023aec8 = read_realtime_clock_units();
  iVar8 = build_frame_draw_list();
  if (iVar8 != 0) {
    draw_command_list_rewind();
    rebuild_dungeon_view();
    finalize_glyph_draw_command(0xa0);
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
  }
  set_viewport_clip_rect(0x34,0x13,DAT_0023b020 + 0x33,DAT_0023aed4 + 0x12);
  dirty_rect_union(0x13,0x84,0x34,0xe0);
  iVar8 = read_realtime_clock_units();
  iVar8 = iVar8 - DAT_0023aec8;
  iVar4 = render_dungeon_view();
  iVar5 = read_realtime_clock_units();
  if (g_dungeon_view_active != 0) {
    weapon_swing_draw_tick();
  }
  track_hotspot_hover_state();
  flush_dungeon_frame();
  redraw_hotspot_border_cursor();
  set_viewport_clip_rect(0,0,0x13f,199);
  iVar6 = read_realtime_clock_units();
  iVar7 = (iVar6 - iVar5) + iVar4 + iVar8;
  if (iVar7 == 0) {
    sVar2 = 0;
  }
  else {
    sVar2 = orduint_divmod(iVar7,0xa00).quot;
  }
  sVar1 = DAT_0023b4c8;
  iVar7 = (int)(short)DAT_0023b4c8;
  sVar9 = DAT_0023b4cc - *(short *)(&DAT_0023b4a8 + iVar7 * 2);
  sVar3 = ordint_divmod(10,(int)sVar2).quot;
  *(short *)(&DAT_0023b4a8 + iVar7 * 2) = sVar3;
  DAT_0023b4cc = sVar9 + sVar3;
  DAT_0023b4c8 = sVar1 + 1U & 0xf;
  uw_ord2005_rem_122 = ((int)((int)sVar2)) % (10);
  ce_sprintf(auStack_60,s_R__lu_P__lu_S__lu_F__d__d_00086b04,iVar4,iVar8,iVar6 - iVar5,(int)sVar3,
              (int)uw_ord2005_rem_122);
}



// was FUN_0005bc38 -- build the per-frame HUD + world draw-command list (opcodes into DAT_00110fc0) and run the visibility pass walk_visible_tiles; returns nonzero if it rebuilt
int build_frame_draw_list()
{
  short sVar1;
  undefined2 uVar2;
  undefined1 extraout_r1;
  byte bVar3;
  
  update_current_view_from_subject();
  DAT_00101938 = (short)(char)((ushort)g_current_view->view_x >> 8);
  DAT_0010193c = (short)(char)((ushort)g_current_view->view_y >> 8);
  DAT_0023aecc = tilemap_lookup(DAT_00101938,DAT_0010193c); // was called with no args (dropped-arg bug); tile coords computed just above
  bVar3 = (byte)(((short)(g_current_view->view_facing >> 0xd) + 1) >> 1) & 3;
  DAT_0023b02c = &DAT_00086a20 + (char)bVar3 * 0x10;
  /* Dropped-remainder bug, same class fixed elsewhere this session. */
  extraout_r1 = (char)ordint_divmod(2,bVar3).rem;
  DAT_0023b028 = extraout_r1;
  DAT_0023b4a0 = bVar3;
  sync_camera_from_player();
  g_current_view->view_x = g_current_view->view_x & 0xff;
  g_current_view->view_y = g_current_view->view_y & 0xff;
  if (DAT_0023b4a0 == 1) {
    uVar2 = g_current_view->view_x;
    g_current_view->view_x = 0xff - g_current_view->view_y;
    g_current_view->view_y = uVar2;
  }
  else {
    if (DAT_0023b4a0 == 2) {
      g_current_view->view_x = 0xff - g_current_view->view_x;
      sVar1 = g_current_view->view_y;
    }
    else {
      if (DAT_0023b4a0 != 3) goto LAB_0005bd98;
      sVar1 = g_current_view->view_x;
      g_current_view->view_x = g_current_view->view_y;
    }
    g_current_view->view_y = 0xff - sVar1;
  }
LAB_0005bd98:
  g_current_view->view_facing =
       g_current_view->view_facing - *(short *)(&DAT_00086a18 + (char)DAT_0023b4a0 * 2);
  return 1;
}



// was FUN_0005bdcc
void build_visibility_light_grid(short size)
{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  undefined1 local_30 [16];
  
  iVar1 = (int)size;
  if (iVar1 < 0x10) {
    iVar4 = 0;
    do {
      if (iVar1 < iVar4) {
        local_30[iVar4] = 0xf;
      }
      else {
        sVar2 = (short)((iVar4 << 8) >> 5);
        sVar2 = integer_sqrt((int)sVar2 * (int)sVar2 * 0x20000 >> 0x10);
        iVar3 = (int)DAT_002506dc + (int)(short)((int)sVar2 * (int)DAT_0025063c >> 6);
        sVar2 = (short)iVar3;
        if (iVar3 * 0x10000 >> 0x10 < 0) {
          sVar2 = 0;
        }
        iVar3 = ((int)DAT_0025064c + (int)sVar2) * 0x10000 >> 0x10;
        if (0xe < iVar3) {
          iVar3 = 0xe;
        }
        local_30[iVar4] = (char)iVar3;
      }
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x10);
    iVar4 = 0;
    do {
      iVar3 = 0;
      do {
        sVar2 = integer_sqrt((0x10 - iVar3) * (0x10 - iVar3) + iVar4 * iVar4);
        if (iVar1 < sVar2) {
          (&DAT_0023b039)[(iVar4 * 0x21 + iVar3) * 2] = 0xf;
        }
        else {
          (&DAT_0023b039)[(iVar4 * 0x21 + iVar3) * 2] = local_30[sVar2];
        }
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      } while (iVar3 < 0x21);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < 0x11);
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005bf40
void seed_visibility_queue()
{
  /* DAT_0023aecc is the player's current tile record; it is NULL when the player position is
     outside the 64x64 map. */
  if (DAT_0023aecc == (char *)0x0) {
    g_visibility_ring_done = 0xf;
    return;
  }
  if ((*DAT_0023aecc & 0xf) == 0) {
    g_visibility_ring_done = 0xf;
  }
  else {
    g_visibility_ring_done = 0;
    g_visibility_ray_table = 0x81;
    DAT_0023aee5 = 0;
    DAT_0023aee7 = 0;
    DAT_0023aee6 = (undefined1)g_current_view->view_x;
    DAT_0023aee8 = (undefined1)g_current_view->view_y;
    DAT_0023aeea = (undefined2)((uint)(uintptr_t)DAT_0023aecc >> 8);
    DAT_0023aeec = (undefined1)((uint)(uintptr_t)DAT_0023aecc >> 0x18);
    DAT_0023aeed = 0x58;
    DAT_0023aeee = 0x23b0;
    DAT_0023aef0 = 0;
    g_visibility_ray_realptr2[0] = (char *)&g_visibility_ring_buffer_backing[0x20]; // real-pointer side channel for the offset+0xd field -- see g_visibility_ray_realptr2's comment
    DAT_0023aef5 = 0xf;
    DAT_0023aefa = 0;
    DAT_0023aefc = 0;
    DAT_0023aefb = (undefined1)g_current_view->view_x;
    DAT_0023aefd = (undefined1)g_current_view->view_y;
    DAT_0023aefe = (undefined2)(uintptr_t)DAT_0023aecc;
    DAT_0023af00 = (undefined2)((uint)(uintptr_t)DAT_0023aecc >> 0x10);
    _DAT_0023af02 = 0x23b058;
    g_visibility_ray_realptr2[1] = (char *)&g_visibility_ring_buffer_backing[0x20]; // same real-pointer side channel, entry 1
    DAT_0023aee9 = (char)(uintptr_t)DAT_0023aecc;
    g_visibility_ray_realptr[0] = DAT_0023aecc; // real-pointer side channel for advance_visibility_ray -- see g_visibility_ray_realptr's comment
    g_visibility_ray_realptr[1] = DAT_0023aecc; // entry 1's own copy of the same packed pointer (DAT_0023aefe/af00, same source)
    {
      /* Hack (--near-tile-visibility): the flood's +/-45 degree edge rays miss the floor and walls beside
         the player once the camera pitches past the original +/-24 degree limit. Widen them with
         pitch, up to 65 degrees at 90 degrees of pitch; wider pulls in so many tiles that the 512-vertex
         arena fills and the floor near the player disappears. */
      int pitch = (int)DAT_000db448, excess = 0, edge, left, right;
      if (pitch > 180) pitch -= 360;
      if (pitch < 0) pitch = -pitch;
      if (g_opts.near_tile_visibility && pitch > 24) excess = pitch > 90 ? 66 : pitch - 24;
      edge = 0x2040 + excess * (0x2e39 - 0x2040) / 66;
      right = g_current_view->view_facing + edge;
      left = g_current_view->view_facing - edge;
      if (excess) {
        if (right > 0x3fc0) right = 0x3fc0;
        if (left < -0x3fc0) left = -0x3fc0;
      }
      angle_to_screen_delta(right,&DAT_0023aef6,&DAT_0023aef8);
      angle_to_screen_delta(left,&DAT_0023aee1,&DAT_0023aee3);
    }
    /* angle_to_screen_delta writes a 2-byte X delta at DAT_0023aee1 and a 2-byte Y delta at
       DAT_0023aee3, and every downstream reader (advance_visibility_ray's `*(short *)(param_1 + 1)`
       / `+ 3`) treats them as separate signed shorts... */
    *(short *)&g_visibility_ray_table_backing[1] = (short)(*(short *)&g_visibility_ray_table_backing[1] >> 4);
    *(short *)&g_visibility_ray_table_backing[3] = (short)(*(short *)&g_visibility_ray_table_backing[3] >> 4);
    /* The right edge uses signed deltas too (ARM FUN_0005bf40).
       Near a quadrant boundary Y becomes negative; shifting the unsigned
       aliases turns -1 into 4095 and collapses the visibility fan. */
    DAT_0023aef6 = (short)DAT_0023aef6 >> 4;
    DAT_0023aef8 = (short)DAT_0023aef8 >> 4;
  }
}



// Was FUN_0005c0c4. Same param_1-truncation + packed-pointer-arithmetic fix as its mirror-image sibling visibility_ray_step_backward.
// was FUN_0005c0c4
void visibility_ray_step_forward(void *ray_ptr)
{
  char *ray = (char *)ray_ptr;
  int iVar1;
  int entry_idx;

  entry_idx = visibility_ray_idx(ray);
  g_visibility_ray_realptr[entry_idx] =
       VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, entry_idx) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * 4;
  g_visibility_ray_realptr2[entry_idx] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, entry_idx) + 2;
  *(char *)(ray + 5) = *(char *)(ray + 5) + '\x01';
  iVar1 = *(int *)(ray + 9) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * 4;
  *(char *)(ray + 9) = (char)iVar1;
  *(char *)(ray + 10) = (char)((uint)iVar1 >> 8);
  *(char *)(ray + 0xb) = (char)((uint)iVar1 >> 0x10);
  *(char *)(ray + 0xc) = (char)((uint)iVar1 >> 0x18);
  iVar1 = CONCAT13(*(undefined1 *)(ray + 0x10),
                   CONCAT12(*(undefined1 *)(ray + 0xf),
                            CONCAT11(*(undefined1 *)(ray + 0xe),*(undefined1 *)(ray + 0xd)))
                  ) + 2;
  *(char *)(ray + 0xd) = (char)iVar1;
  *(char *)(ray + 0xe) = (char)((uint)iVar1 >> 8);
  *(char *)(ray + 0xf) = (char)((uint)iVar1 >> 0x10);
  *(char *)(ray + 0x10) = (char)((uint)iVar1 >> 0x18);
}



/* Was FUN_0005c16c. param_1 was `int`, truncating the real record pointer (same fix as its siblings
   advance_visibility_ray/compute_visibility_ray_offset). */
// was FUN_0005c16c
void visibility_ray_step_backward(void *ray_ptr)
{
  char *ray = (char *)ray_ptr;
  int iVar1;
  int entry_idx;

  entry_idx = visibility_ray_idx(ray);
  g_visibility_ray_realptr[entry_idx] =
       VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, entry_idx) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * -4;
  g_visibility_ray_realptr2[entry_idx] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, entry_idx) + -2;
  *(char *)(ray + 5) = *(char *)(ray + 5) + -1;
  iVar1 = *(int *)(ray + 9) + *(short *)(&DAT_00086a00 + DAT_0023b4a0 * 6) * -4;
  *(char *)(ray + 9) = (char)iVar1;
  *(char *)(ray + 10) = (char)((uint)iVar1 >> 8);
  *(char *)(ray + 0xb) = (char)((uint)iVar1 >> 0x10);
  *(char *)(ray + 0xc) = (char)((uint)iVar1 >> 0x18);
  iVar1 = CONCAT13(*(undefined1 *)(ray + 0x10),
                   CONCAT12(*(undefined1 *)(ray + 0xf),
                            CONCAT11(*(undefined1 *)(ray + 0xe),*(undefined1 *)(ray + 0xd)))
                  ) + -2;
  *(char *)(ray + 0xd) = (char)iVar1;
  *(char *)(ray + 0xe) = (char)((uint)iVar1 >> 8);
  *(char *)(ray + 0xf) = (char)((uint)iVar1 >> 0x10);
  *(char *)(ray + 0x10) = (char)((uint)iVar1 >> 0x18);
}



/* Was FUN_0005c214. param_1 was `int`, truncating the real record pointer every caller passes --
   same fix as advance_visibility_ray. */
// was FUN_0005c214
int compute_visibility_ray_offset(void *ray_ptr, char step_x, char step_y)
{
  char *ray = (char *)ray_ptr;
  byte bVar1;
  byte *pbVar2;
  byte *pbVar3;
  int iVar4;
  int iVar5;
  byte bVar6;
  byte bVar7;
  undefined1 uVar8;
  short sVar9;
  uint uVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  int entry_idx;

  entry_idx = visibility_ray_idx(ray);
  pbVar2 = (byte *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, entry_idx);
  iVar12 = (int)DAT_0023b4a0;
  bVar7 = pbVar2[1] & 0xf;
  iVar5 = iVar12 * 0x10;
  pbVar3 = (byte *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, entry_idx);
  bVar1 = *pbVar3;
  uVar10 = (uint)*(char *)(ray + 5);
  if (uVar10 == 0) {
    sVar9 = 0;
  }
  else {
    iVar4 = (uVar10 ^ (int)uVar10 >> 0x1f) - ((int)uVar10 >> 0x1f);
    uVar11 = (int)*(char *)(ray + 7) >> 0x1f;
    iVar13 = ((int)*(char *)(ray + 7) ^ uVar11) - uVar11;
    sVar9 = 1;
    if (iVar4 != iVar13 && iVar13 <= iVar4) {
      sVar9 = 3;
    }
    sVar9 = (ushort)(0 < (int)uVar10) + sVar9;
    if (iVar4 == iVar13) {
      sVar9 = sVar9 + 4;
    }
  }
  uVar10 = (uint)(short)(ushort)(byte)(&DAT_00086a20)[(bVar1 & 0xf) + iVar5];
  bVar6 = (&DAT_00086a60)[uVar10 * 7 + (int)sVar9];
  if (bVar6 == 0) {
    *pbVar2 = 0;
  }
  else {
    if ((bVar6 & 0x10) != 0) {
      uVar11 = (uint)(byte)(&DAT_00086a20)
                           [(pbVar3[*(short *)(&DAT_00086a02 + iVar12 * 6) * 4] & 0xf) + iVar5];
      if (((&DAT_000878d0)[uVar11] & 8) == 0) {
        if ((uVar11 != uVar10) || (iVar4 = 1, uVar10 == 1)) {
          iVar4 = 0;
        }
        if ((int)((uint)(bVar1 >> 4) + iVar4 + (uint)(uVar10 == 6)) <
            (int)(((uint)(pbVar3[*(short *)(&DAT_00086a02 + iVar12 * 6) * 4] >> 4) -
                  (uint)(uVar11 == 6)) + (uint)(((&DAT_000878d0)[uVar11] & 0x20) == 0x20))) {
          bVar7 = bVar7 + 0x20;
        }
        else {
          bVar6 = bVar6 - 0x10;
        }
      }
    }
    if ((bVar6 & 0x20) != 0) {
      uVar11 = (uint)(byte)(&DAT_00086a20)
                           [(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * 4] & 0xf) + iVar5];
      if (((&DAT_000878d0)[uVar11] & 2) == 0) {
        if ((uVar11 != uVar10) || (iVar4 = 1, uVar10 == 1)) {
          iVar4 = 0;
        }
        if ((int)((uint)(bVar1 >> 4) + iVar4 + (uint)(uVar10 == 8)) <
            (int)(((uint)(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * 4] >> 4) -
                  (uint)(uVar11 == 8)) + (uint)(((&DAT_000878d0)[uVar11] & 0x20) == 0x20))) {
          bVar7 = bVar7 + 0x40;
        }
        else {
          bVar6 = bVar6 - 0x20;
        }
      }
    }
    if ((bVar6 & 8) != 0) {
      uVar11 = (uint)(byte)(&DAT_00086a20)
                           [(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * -4] & 0xf) + iVar5];
      if (((&DAT_000878d0)[uVar11] & 4) == 0) {
        if ((uVar11 != uVar10) || (iVar5 = 1, uVar10 == 1)) {
          iVar5 = 0;
        }
        if ((int)((uint)(bVar1 >> 4) + iVar5 + (uint)(uVar10 == 9)) <
            (int)(((uint)(pbVar3[*(short *)(&DAT_00086a00 + iVar12 * 6) * -4] >> 4) -
                  (uint)(uVar11 == 9)) + (uint)(((&DAT_000878d0)[uVar11] & 0x20) == 0x20))) {
          bVar7 = bVar7 + 0x10;
        }
        else {
          bVar6 = bVar6 - 8;
        }
      }
    }
    *pbVar2 = bVar6;
    pbVar2[1] = bVar7; // was `*(byte *)(*(int *)(ray + 0xd) + 1)` -- pbVar2 already IS that pointer now
    if ((step_x != '\0') &&
       (((uVar11 = (uint)step_y,
         ((byte)(&DAT_000878d0)
                [(byte)(&DAT_00086a20)
                       [(pbVar3[*(short *)(&DAT_00086a02 + DAT_0023b4a0 * 6) * 4] & 0xf) +
                        DAT_0023b4a0 * 0x10]] & 8) == uVar11 &&
         (((byte)(&DAT_000878d0)[uVar10] & 0x10) == (&DAT_00086af0)[uVar11 == 8])) ||
        ((((byte)(&DAT_000878d0)[uVar10] & 1) == 1 &&
         (((byte)(&DAT_000878d0)[uVar10] & 0x10) == (&DAT_00086af0)[uVar11 == 0])))))) {
      if (step_x == '\x01') {
        visibility_ray_step_forward(ray); // dropped arg; sibling call right below (visibility_ray_step_backward(ray)) shows the intended shape
        uVar8 = 0;
      }
      else {
        visibility_ray_step_backward(ray);
        uVar8 = 0xff;
      }
      *(undefined1 *)(ray + 6) = uVar8;
      return 1;
    }
  }
  return 0;
}



/* Was FUN_0005c70c, and was mis-named `reactions_should_merge` until the un-stub below showed what
   it does. */
// was FUN_0005c70c
int extend_visibility_ray_row(byte *ray_a, byte *ray_b)
{
  uint uVar1;
  uint uVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  int idx1;
  int idx2;
  short row_stride;

  idx1 = visibility_ray_idx(ray_a);
  idx2 = visibility_ray_idx(ray_b);
  row_stride = *(short *)(&DAT_00086a02 + DAT_0023b4a0 * 6);

  iVar5 = *(char *)(ray_a + 7) + 1;
  *(char *)(ray_a + 7) = (char)iVar5;
  /* ARM FUN_0005c70c compares this row counter with the literal 0x11. The shading distance
     (historically named g_visibility_max_ring_passes) is not this bound. Substituting it stops on a
     partially filled row: level 1's value 3 makes tile (26,5) disappear at some headings. */
  if (iVar5 * 0x1000000 >> 0x18 < 0x11) {
    do {
      if ((VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx1)[0x43] & 0xf) != 0xf) {
        cVar3 = *(char *)(ray_a + 7);
        if (('\x01' < cVar3) ||
           (uVar7 = (uint)*(byte *)(ray_a + 6) - (int)g_current_view->view_x,
           uVar1 = (int)uVar7 >> 0x1f,
           uVar6 = (uint)*(byte *)(ray_a + 8) - (int)g_current_view->view_y,
           uVar2 = (int)uVar6 >> 0x1f,
           0x10 < (int)(((uVar6 ^ uVar2) - uVar2) + ((uVar7 ^ uVar1) - uVar1)))) {
          iVar8 = (*(char *)(ray_a + 5) * 0x100 - (int)g_current_view->view_x) +
                  (uint)*(byte *)(ray_a + 6);
          iVar5 = iVar8 * 0x10000;
          uVar1 = iVar5 >> 0x1f;
          sVar4 = ordint_divmod(0x32,(iVar5 >> 0x10 ^ uVar1) - uVar1).quot;
          iVar5 = (iVar8 - sVar4) + -2;
          *(char *)(ray_a + 1) = (char)iVar5;
          *(char *)(ray_a + 2) = (char)((uint)iVar5 >> 8);
          iVar5 = cVar3 * 0x100 - (int)g_current_view->view_y;
          *(char *)(ray_a + 3) = (char)iVar5;
          *(char *)(ray_a + 4) = (char)((uint)iVar5 >> 8);
        }
        *(undefined1 *)(ray_a + 8) = 0;
        /* one row forward: tile-data cursor += row_stride*4, grid cursor += 0x42 */
        g_visibility_ray_realptr[idx1] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, idx1) + row_stride * 4;
        g_visibility_ray_realptr2[idx1] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx1) + 0x42;
        *(char *)(ray_b + 7) = *(char *)(ray_b + 7) + '\x01';
        do {
          if ((VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx2)[0x43] & 0xf) != 0xf) {
            cVar3 = *(char *)(ray_b + 7);
            if (('\x01' < cVar3) ||
               (uVar7 = (uint)*(byte *)(ray_b + 6) - (int)g_current_view->view_x,
               uVar1 = (int)uVar7 >> 0x1f,
               uVar6 = (uint)*(byte *)(ray_b + 8) - (int)g_current_view->view_y,
               uVar2 = (int)uVar6 >> 0x1f,
               0x10 < (int)(((uVar6 ^ uVar2) - uVar2) + ((uVar7 ^ uVar1) - uVar1)))) {
              iVar8 = (*(char *)(ray_b + 5) * 0x100 - (int)g_current_view->view_x) +
                      (uint)*(byte *)(ray_b + 6);
              iVar5 = iVar8 * 0x10000;
              uVar1 = iVar5 >> 0x1f;
              sVar4 = ordint_divmod(0x32,(iVar5 >> 0x10 ^ uVar1) - uVar1).quot;
              iVar5 = iVar8 + sVar4 + 2;
              *(char *)(ray_b + 1) = (char)iVar5;
              *(char *)(ray_b + 2) = (char)((uint)iVar5 >> 8);
              iVar5 = (cVar3 * 0x100 - (int)g_current_view->view_y) + -1;
              *(char *)(ray_b + 3) = (char)iVar5;
              *(char *)(ray_b + 4) = (char)((uint)iVar5 >> 8);
            }
            *(undefined1 *)(ray_b + 8) = 0;
            g_visibility_ray_realptr2[idx2] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, idx2) + 0x42;
            g_visibility_ray_realptr[idx2] = VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, idx2) + row_stride * 4;
            return 1;
          }
          visibility_ray_step_backward(ray_b);
          *(undefined1 *)(ray_b + 6) = 0xff;
          compute_visibility_ray_offset(ray_b,0,0);
        } while (*(char *)(ray_a + 5) <= *(char *)(ray_b + 5));
        return 0;
      }
      visibility_ray_step_forward(ray_a);
      *(undefined1 *)(ray_a + 6) = 0;
      compute_visibility_ray_offset(ray_a,0,0);
    } while (*(char *)(ray_a + 5) <= *(char *)(ray_b + 5));
  }
  return 0;
}



// Was FUN_0005cacc.
// was FUN_0005cacc
void advance_visibility_ray(byte *ray)
{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  byte bVar5;
  short sVar6;
  undefined4 uVar7;
  byte *pbVar8;
  char cVar9;
  short *psVar10;
  int iVar11;
  int iVar12;
  char cVar12;
  int local_atten_step;
  ushort local_32;
  int local_30;
  
  iVar2 = (int)*(short *)(ray + 1);
  cVar12 = -1 < iVar2;
  iVar3 = (int)(short)(ushort)(byte)cVar12;
  local_32 = (ushort)ray[6];
  if (iVar3 == 1) {
    local_32 = 0x100 - ray[6];
  }
  uVar1 = iVar3 << 7;
  if ((*ray & 0x80) == uVar1) {
    g_visibility_ray_clearptr[visibility_ray_idx(ray)] =
        VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, visibility_ray_idx(ray));
    uVar7 = *(undefined4 *)(ray + 0xd);
    ray[0x11] = (byte)uVar7;
    ray[0x12] = (byte)((uint)uVar7 >> 8);
    ray[0x13] = (byte)((uint)uVar7 >> 0x10);
    ray[0x14] = (byte)((uint)uVar7 >> 0x18);
  }
  local_30 = (int)*(short *)(ray + 3);
  if ((local_30 == 0) ||
     ((iVar2 != 0 &&
      ((short)local_32 * local_30 <
       (int)((0x100 - (uint)ray[8]) * (int)*(short *)(&DAT_00086b00 + iVar3 * 2) * iVar2))))) {
    do {
      iVar11 = (int)DAT_0023b4a0;
      /* Was `*(byte **)(ray + 9)` -- reassembling a pointer from raw bytes the original 32-bit
         binary packed at this offset (see seed_visibility_queue's DAT_0023aee9/aeea/aeec writes),
         which only ever captured the low 32 bits even before this port's 64-bit truncation... */
      pbVar8 = (byte *)VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, visibility_ray_idx(ray));
      iVar2 = iVar11 * 0x10;
      cVar9 = (&DAT_00086a20)[(*pbVar8 & 0xf) + iVar2];
      if ((*(ushort *)(&DAT_00086af8 + iVar3 * 2) & (ushort)(byte)(&DAT_000878d0)[cVar9]) != 0) {
LAB_0005cf04:
        ray[8] = 0xff;
        if ((((ushort)(byte)(&DAT_000878d0)[cVar9] & *(ushort *)(&DAT_00086af8 + iVar3 * 2)) ==
             *(ushort *)(&DAT_00086af8 + iVar3 * 2)) &&
           ((int)cVar9 == (int)*(short *)((char *)&DAT_00086afc + iVar3 * 2))) {
          /* Was reading the division helper's remainder back via the extraout_r1 register-leftover
             trick (see ordint_divmod's comment) -- gets it by name off ordint_divmod's own
             divmod_result now, same fix as itoa_radix's identical pattern. */
          cVar12 = (char)ordint_divmod(2,iVar3 + 1).rem;
        }
        ray[6] = -cVar12;
        goto LAB_0005ce50;
      }
      psVar10 = (short *)(&DAT_00086b00 + iVar3 * 2);
      sVar6 = *psVar10;
      /* Was `ordint_divmod(2,iVar3+1);` followed by two extraout_r1_00
         reads of its division remainder -- same register-leftover
         pattern as above, gets it by name off divmod_result now. */
      iVar12 = ordint_divmod(2,iVar3 + 1).rem;
      if ((*(ushort *)(&DAT_00086af8 + iVar12 * 2) &
          (ushort)(byte)(&DAT_000878d0)
                        [(byte)(&DAT_00086a20)
                               [(pbVar8[(int)*(short *)(&DAT_00086a00 + iVar11 * 6) * (int)sVar6 * 4
                                       ] & 0xf) + iVar2]]) != 0) goto LAB_0005cf04;
      /* Was `cVar9 = ordint_divmod(...); ray[8] = cVar9 + ray[8];` -- ray[8] is a 0-255
         accumulated light-attenuation counter... */
      local_atten_step = (int)ordint_divmod((int)*(short *)(ray + 1) * (int)sVar6,
                                            (short)local_32 * local_30).quot;
      local_atten_step = local_atten_step + (int)(byte)ray[8];
      if (local_atten_step < 0) {
        local_atten_step = 0;
      }
      else if (0xff < local_atten_step) {
        local_atten_step = 0xff;
      }
      ray[8] = (byte)local_atten_step;
      ray[6] = -(char)iVar12;
      local_32 = 0x100;
      if ((*ray & 0x80) == uVar1) {
        compute_visibility_ray_offset(ray,0,0);
      }
      if (*psVar10 == 1) {
        visibility_ray_step_forward(ray); // dropped arg; sibling call right below shows the intended shape
      }
      else {
        visibility_ray_step_backward(ray);
      }
      if (((VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, visibility_ray_idx(ray))[1] & 0xf) == 0xf) ||
         (uVar4 = (int)(char)ray[5] >> 0x1f,
         0x10 < (int)(((int)(char)ray[5] ^ uVar4) - uVar4))) {
        /* Same extraout_r1 register-leftover division-remainder pattern
           as above, computed directly instead. */
        if (*(short *)(&DAT_00086b00 + ((iVar3 + 1) % 2) * 2) == 1) {
          visibility_ray_step_forward(ray); // dropped arg; sibling call right below shows the intended shape
        }
        else {
          visibility_ray_step_backward(ray);
        }
        ray[6] = -cVar12;
        ray[8] = 0xff;
        bVar5 = *ray;
        goto LAB_0005ce60;
      }
      local_30 = (int)*(short *)(ray + 3);
    } while ((local_30 == 0) ||
            (local_30 * 0x100 <
             (int)((0x100 - (uint)ray[8]) * (int)*(short *)(ray + 1) * (int)*psVar10)));
  }
  sVar6 = *(short *)(&DAT_00086b00 + iVar3 * 2);
  cVar12 = ordint_divmod((int)*(short *)(ray + 3),
                        (0xff - (uint)ray[8]) * (int)*(short *)(ray + 1) * (int)sVar6).quot;
  ray[6] = cVar12 * (char)sVar6 + ray[6];
  ray[8] = 0xff;
LAB_0005ce50:
  bVar5 = *ray;
LAB_0005ce60:
  if ((bVar5 & 0x80) != uVar1) {
    g_visibility_ray_clearptr[visibility_ray_idx(ray)] =
        VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, visibility_ray_idx(ray));
    uVar7 = *(undefined4 *)(ray + 0xd);
    ray[0x11] = (byte)uVar7;
    ray[0x12] = (byte)((uint)uVar7 >> 8);
    ray[0x13] = (byte)((uint)uVar7 >> 0x10);
    ray[0x14] = (byte)((uint)uVar7 >> 0x18);
  }
}



/* Was FUN_0005cf74. param_1/param_2 were `undefined4 *`/`int *`, truncating the real pointers
   run_visibility_flood always calls this with (`&local_20`/`&local_24`, both real
   `byte*`/`undefined1*` locals)... */
// was FUN_0005cf74
void merge_adjacent_visibility_rays(byte **ray_cursor, byte **out_cursor)
{
  bool bVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char *pcVar7;
  byte *pbVar8;
  char *pcVar9;
  /* acStack_28/local_23 were separate locals sized 5+1=6 bytes, but the copy loop just below writes
     a full 0x15(21)-byte record into acStack_28 (`iVar3 = 0x15; ... *pcVar7 = *pcVar6; ...`) -- a
     genuine stack-buffer overflow... */
  char acStack_28 [0x15];
  int iVar10;

  iVar10 = ((int)*(char *)*ray_cursor & 0xfU) * 0x15;
  pcVar9 = &g_visibility_ray_table + iVar10;
  iVar5 = ((int)*pcVar9 & 0xfU) * 0x15;
  pbVar8 = &g_visibility_ray_table + iVar5;
  *out_cursor = (undefined1 *)(g_visibility_ray_clearptr[iVar5 / 0x15] + 2);
  while( true ) {
    iVar3 = compute_visibility_ray_offset(pcVar9,1,8);
    if (iVar3 == 0) break;
    if ((int)((uint)(byte)(&DAT_0023aee6)[iVar5] + (char)(&DAT_0023aee5)[iVar5] * 0x100) <
        (int)((uint)(byte)(&DAT_0023aee6)[iVar10] + (char)(&DAT_0023aee5)[iVar10] * 0x100))
    goto LAB_0005d064;
  }
  if ((int)(char)(&DAT_0023aee5)[iVar10] < (int)(char)(&DAT_0023aee5)[iVar5]) {
    do {
      iVar3 = compute_visibility_ray_offset(pbVar8,-1,8);
    } while (iVar3 != 0);
  }
  iVar3 = 0x15;
  pcVar6 = pcVar9;
  pcVar7 = acStack_28;
  do {
    iVar4 = iVar3 + -1;
    *pcVar7 = *pcVar6;
    bVar1 = 0 < iVar3;
    iVar3 = iVar4;
    pcVar6 = pcVar6 + 1;
    pcVar7 = pcVar7 + 1;
  } while (iVar4 != 0 && bVar1);
  /* acStack_28 is a byte-copy of entry pcVar9; seed the scratch real-pointer slot (16) from that
     entry so visibility_ray_step_forward / compute_visibility_ray_offset on acStack_28 -- whose
     in-backing-array index would be a wild value... */
  g_visibility_ray_realptr[VISIBILITY_RAY_SCRATCH_IDX]  =
      VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr, iVar10 / 0x15);
  g_visibility_ray_realptr2[VISIBILITY_RAY_SCRATCH_IDX] =
      VISIBILITY_RAY_REALPTR(g_visibility_ray_realptr2, iVar10 / 0x15);
  iVar3 = extend_visibility_ray_row(pcVar9,pbVar8);
  if (iVar3 == 0) {
LAB_0005d064:
    bVar2 = *(byte *)*ray_cursor;
    *(byte *)*ray_cursor = (bVar2 ^ *pbVar8) & 0xf ^ bVar2;
    *pcVar9 = '\0';
    *pbVar8 = 0;
  }
  else {
    /* extend_visibility_ray_row returned "keep spreading". The walk below operates on acStack_28
       (the stack copy) and marks tiles via compute_visibility_ray_offset; its side-table pointers
       live in the scratch slot seeded just above. */
    *ray_cursor = pbVar8;
    if ((&DAT_0023aee5)[iVar10] != (&DAT_0023aee5)[iVar5]) {
      do {
        visibility_ray_step_forward(acStack_28);
        do {
          if ((char)(&DAT_0023aee5)[iVar5] <= acStack_28[5]) {
            return;
          }
          do {
            iVar10 = compute_visibility_ray_offset(acStack_28,1,0);
            if (iVar10 == 0) break;
          } while (acStack_28[5] < (char)(&DAT_0023aee5)[iVar5]);
        } while ((char)(&DAT_0023aee5)[iVar5] <= acStack_28[5]);
        visibility_ray_step_forward(acStack_28);
        do {
          iVar10 = compute_visibility_ray_offset(acStack_28,1,8);
          if (iVar10 == 0) break;
        } while (acStack_28[5] < (char)(&DAT_0023aee5)[iVar5]);
      } while( true );
    }
  }
}



// Was FUN_0005d13c.
// was FUN_0005d13c
void run_visibility_flood()
{
  byte bVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  uint uVar4;
  byte *pbVar5;
  undefined1 *local_24;
  byte *local_20;
  
  /* Visibility bits belong to this frame. A flood that stops at the view distance limit can leave
     the interior of its final row unwritten; retaining those bits draws walls from an earlier
     camera position. Reset only visibility bytes, keeping the adjacent light/edge bytes. */
  for (int cell = 0; cell < 17 * 33; ++cell)
    g_visibility_ring_buffer_backing[cell * 2] = 0;

  puVar3 = &g_visibility_ring_buffer;
  g_visibility_ring_depth = -1;
  local_24 = &g_visibility_ring_buffer;
  do {
    local_20 = &g_visibility_ring_done;
    g_visibility_ring_depth = g_visibility_ring_depth + 1;
    puVar2 = puVar3;
    bVar1 = g_visibility_ring_done;
    while ((bVar1 & 0xf) != 0xf) {
      pbVar5 = &g_visibility_ray_table + ((int)(char)*local_20 & 0xfU) * 0x15;
      advance_visibility_ray(pbVar5);
      puVar2 = local_24;
      local_20 = pbVar5;
      bVar1 = *pbVar5;
    }
    local_20 = &g_visibility_ring_done;
    puVar3 = puVar2;
    bVar1 = g_visibility_ring_done;
    while (uVar4 = (uint)(char)bVar1, (uVar4 & 0xf) != 0xf) {
      /* Offset 0x11 is the saved boundary, not the live offset-0xd cursor. */
      while (puVar3 < (undefined1 *)g_visibility_ray_clearptr[uVar4 & 0xf]) {
        *puVar3 = 0;
        uVar4 = (uint)(char)*local_20;
        puVar3 = local_24 + 2;
        local_24 = puVar3;
      }
      merge_adjacent_visibility_rays(&local_20,&local_24);
      puVar3 = local_24;
      bVar1 = *local_20;
    }
    while (puVar3 < puVar2 + 0x42) {
      *puVar3 = 0;
      puVar3 = local_24 + 2;
      local_24 = puVar3;
    }
  } while (g_visibility_ring_done != 0xf);


  /* Hack - Testing (opt-in via --hack-reveal-depth): g_visibility_ring_depth is the row depth of
     walk_visible_tiles's reveal/visibility walk -- it starts at row &g_visibility_ring_buffer +
     g_visibility_ring_depth*0x42 and sweeps back to row 0... */
  if (g_opts.hack_reveal_depth) {
    if (g_opts.hack_reveal_depth_zero) {
      int hack_row;
      for (hack_row = 0x42; hack_row < 0x42 * 9; hack_row = hack_row + 1) {
        g_visibility_ring_buffer_backing[hack_row] = 0;
      }
    }
    if (g_visibility_ring_depth < 8) g_visibility_ring_depth = 8;
  }
}



// WARNING: Heritage AFTER dead removal. Example location: r0x0023b4dc : 0x0005d664
// WARNING: Restarted to delay deadcode elimination for space: ram

// was FUN_0005d290
void rebuild_dungeon_view()
{
  undefined2 uVar1;
  ushort uVar2;
  short sVar3;
  int iVar4;
  bool bVar5;
  
  seed_visibility_queue();
  /* Re-enabled again: g_visibility_ring_buffer (the buffer walk_visible_tiles's ring-walk reads
     per-tile visibility/occlusion data from via process_visible_tile_cell)... */
  run_visibility_flood();
  handle_mouse_button_message(0);
  uVar1 = DAT_00086b30;
  DAT_0023b804 = 0;
  sVar3 = g_current_view->view_shake_x;
  bVar5 = sVar3 == 0;
  if (bVar5) {
    sVar3 = g_current_view->view_shake_y;
  }
  if (bVar5 && sVar3 == 0) {
    DAT_0023b4dc = 1;
  }
  DAT_0023b830 = 0;
  iVar4 = (int)DAT_00086b2c;
  if (!bVar5 || sVar3 != 0) {
    DAT_0023b4dc = 0;
  }
  DAT_0023b4f4 = (&DAT_00086b38)[iVar4];
  DAT_0023b80c = (&DAT_00086b40)[iVar4];
  DAT_0023b4d4 = (&DAT_00086b48)[iVar4];
  *DAT_00110fc0 = 0x38;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  emit_glyph_draw_command(0xa0,1);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(9);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(8);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)(DAT_00086b2c == 0);
  DAT_00189582 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189580 = (ushort)(DAT_00086b2c == 0);
  bVar5 = DAT_00201b68 == 9;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  if (bVar5) {
    uVar2 = get_catalog_sprite_width(4);
    *DAT_00110fc0 = uVar2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00086b30 = 0;
  }
  else {
    uVar2 = get_catalog_sprite_width(4);
    *DAT_00110fc0 = uVar2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_00086b34;
  }
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189578 = (undefined2)DAT_00086b34;
  *DAT_00110fc0 = 0xd0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)DAT_0023b4dc;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  dungeon_view_prepass_stub(1);
  DAT_0023b810 = 0;
  walk_visible_tiles();
  if ((((*(byte *)(DAT_00086df8 + 0x3d) != 0) && (*(byte *)(DAT_00086df8 + 0x3d) < 0x10)) &&
      (DAT_00201b68 != 9)) &&
     (sVar3 = ordint_divmod(10,(int)DAT_0023b810 * (int)DAT_00201b68).quot, sVar3 != 0)) {
    /* Was disabled: Ghidra dropped this call's argument entirely, so it ran with garbage and
       crashed (walked into the level-up message path with a nonsensical XP amount). */
    grant_experience_points(sVar3);
  }
  if (DAT_00201b68 == 9) {
    DAT_00086b30 = uVar1;
  }
}



// was FUN_0005d2ac -- empty hook called before the visibility walk in build_frame_draw_list (disabled / never recovered)
void dungeon_view_prepass_stub(int phase)
{
}




// was FUN_00065ff0 -- (re)loads the f32.tr/f16.tr floor-texture arenas (the two floor-texture
// resolutions), optionally updating the active "special floor" texture id (DAT_0023adc0) first
// unless param_1 is the sentinel 0xff (keep current).
void load_floor_texture_arenas(byte special_floor_id)
{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  char acStack_114 [260];
  
  if (special_floor_id != 0xff) {
    DAT_0023adc0 = (ushort)special_floor_id;
  }
  ce_memset(acStack_114,0,0x104);
  pcVar3 = &DAT_0023cca8;
    stack0xffdc3244_ptr = stack0xffdc3244_buf;
  pcVar2 = pcVar3;
    stack0xffdc3244_ptr = acStack_114;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_114,s__DATA_f32_tr_00086de8);
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae34);
  ce_memset(acStack_114,0,0x104);
  do {
    cVar1 = *pcVar3;
    *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_114,s__DATA_f16_tr_00086dd8);
  load_texture_arena(acStack_114,&DAT_0023adb8,&DAT_0023aeb8,DAT_0023ae30);
}







// was FUN_0006ff08 -- loads a shading-level configuration (early-outs if param_1 already matches
// the currently-loaded DAT_000872a0): swaps in LIGHT.DAT or MONO.DAT (special-cased around shading
// level 5) into DAT_0024fa2c...
void load_shading_level_config(char shading_level)
{
  char *stack0xffdc323c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  /* Ghidra modelled the 12-byte SHADES.DAT per-level header as six separate `short` locals that
     read_file_handle(&local_12c, 0xc) reads into as one contiguous block -- but the C compiler is
     free to lay them out non-contiguously / reorder them... */
  short _shades_hdr[6];
#define local_12c (_shades_hdr[0])
#define local_12a (_shades_hdr[1])
#define local_128 (_shades_hdr[2])
#define local_126 (_shades_hdr[3])
#define local_124 (_shades_hdr[4])
#define local_122 (_shades_hdr[5])
  char acStack_11c [260];
  
  if (DAT_000872a0 == shading_level) {
    return;
  }
  pcVar4 = &DAT_0023cca8;
  stack0xffdc323c_ptr = acStack_11c;
  if (DAT_000872a0 == '\x05') {
    ce_memset(acStack_11c,0,0x104);
    pcVar2 = pcVar4;
    stack0xffdc323c_ptr = acStack_11c;
    do {
      cVar1 = *pcVar2;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    pcVar2 = s__DATA_light_dat_000872c8;
  }
  else {
    if (shading_level != '\x05') goto LAB_0006fff4;
    ce_memset(acStack_11c,0,0x104);
    pcVar2 = pcVar4;
    stack0xffdc323c_ptr = acStack_11c;
    do {
      cVar1 = *pcVar2;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    pcVar2 = s__DATA_mono_dat_000872b8;
  }
  ce_strcat(acStack_11c,pcVar2);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    read_file_handle(iVar3,DAT_0024fa2c,0x1000);
    CloseHandle(iVar3);
  }
LAB_0006fff4:
  DAT_000872a0 = shading_level;
  update_fullbright_palette_mask();
  ce_memset(acStack_11c,0,0x104);
  /* Reset the walker after any LIGHT.DAT/MONO.DAT path construction. */
  stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_shades_dat_000872a4);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    seek_file_handle(iVar3,shading_level * 0xc0000 >> 0x10,0);
    read_file_handle(iVar3,_shades_hdr,0xc);
    DAT_0025063c = local_12c;
    if (local_12c < 2) {
      DAT_0025063c = 1;
    }
    DAT_0025064c = local_12a;
    DAT_002506dc = local_128;
    g_visibility_max_ring_passes = local_126;
    DAT_00086b28 = local_124;
    DAT_00086b24 = local_122;
    CloseHandle(iVar3);
    build_visibility_light_grid((int)g_visibility_max_ring_passes);
    set_pending_update_flags(2);
  }
}
#undef local_12c
#undef local_12a
#undef local_128
#undef local_126
#undef local_124
#undef local_122






// was FUN_00070118
void load_light_tables()
{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  char acStack_11c [260];
  
  DAT_0024fa2c = ce_malloc(0x1000);
  if (DAT_0024fa2c == 0) {
    report_fatal_error_message_and_exit(s_cLightTabs_allocation_error_____000872e8);
  }
  ce_memset(acStack_11c,0,0x104);
  pcVar4 = &DAT_0023cca8;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
  pcVar2 = pcVar4;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_light_dat_000872c8);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    read_file_handle(iVar3,DAT_0024fa2c,0x1000);
    CloseHandle(iVar3);
  }
  update_fullbright_palette_mask();
  ce_memset(acStack_11c,0,0x104);
  do {
    cVar1 = *pcVar4;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_xfer_dat_000872d8);
  iVar3 = open_file_for_read(acStack_11c);
  if (iVar3 != -1) {
    read_file_handle(iVar3,&DAT_0024fa38,0x600);
    CloseHandle(iVar3);
  }
}

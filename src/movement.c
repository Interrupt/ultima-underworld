/* Movement collision sweep: the substep integrator, wall-slide/ deflect/knockback/land-on-surface
   resolution, and the reticle object pick. Split out of uw.c (the original monolithic decompile)
   once these functions' real roles were confirmed. */
#include "headers/movement.h"
#include "headers/input.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define _DAT_002048c2 (*(uint*)&DAT_002048c2)
/* Sizing pass: one of 4 interchangeable collision-response-profile buffers (siblings
   DAT_00204980/990/9b0 below) -- see their own combined sizing-pass comment a few lines down for
   the full trace. Real max touched offset is 7 (8 bytes); sized to 32 for headroom. */
undefined2 DAT_002049a0_backing[16];
/* Written as a 1-byte scalar but also read/written as a `uint` (4 bytes) via the _DAT_00204982
   macro below -- widened to its own real backing storage so that wider access can't spill into
   whatever global happens to follow (it used to rely on uw.c's own incidental layout). */
/* Same wider-access-than-declared-size issue as DAT_00204982 above (see
   its comment), via the _DAT_00204986 macro below. */
/* Sizing pass: this and its 3 siblings (DAT_00204990/9a0/9b0, and DAT_00204982/84/86/88 right above
   -- all really one struct Ghidra split into separate globals) are the 4 interchangeable collision-
   response-profile buffers npc_ai_tick selects between... */
undefined1 DAT_00204980_backing[32];
static int (*DAT_00204988)(ushort *);
/* Same wider-access-than-declared-size issue as DAT_00204982 above (see
   its comment), via the _DAT_00204992 macro below. */
/* Sizing pass: sibling of DAT_00204980 above -- see its combined
   comment for the full trace. Sized to 16 elements (32 bytes). */
undefined2 DAT_00204990_backing[16];
static int (*DAT_00204998)(ushort *);
static int (*DAT_002049a8)(ushort *);
/* Sizing pass: sibling of DAT_00204980 above -- see its combined
   comment for the full trace. Sized to 16 elements (32 bytes). */
undefined2 DAT_002049b0_backing[16];
static int (*DAT_002049b8)(ushort *);
static short DAT_002048d0;

/* ARM field view: use the parent record populated by the loader/runtime. */
#define DAT_002048c2 (*(undefined1 *)((char *)DAT_002048c0_backing + 2))
/* Was a bare `undefined2` -- same split-symbol class as DAT_002048f0/ DAT_00204950 below (see their
   own comment): build_object_placement_snapshot writes up to offset 0x28 into whichever of these
   three globals DAT_0010172c currently points at... */
undefined2 DAT_002048c0_backing[64];
static undefined2 DAT_002048c8;
static undefined2 DAT_002048c6;
undefined1 DAT_00101424;
/* Sizing-audit pass: find_nearby_door_in_candidates's only use
   (`*param_2 = ...`) is a plain scalar write, overwritten each loop
   iteration, never indexed. Down from 8192. */
undefined1 DAT_00101428_backing[4];
static undefined2 DAT_002048fa;
static undefined2 DAT_00204958;
static undefined2 DAT_00204956;
// was DAT_0023bf1c. Requested movement mode consumed by resolve_move_vector -- see its header
// comment for the full mode list (0 stop, 1 analog move/turn, 6/7 jump, 8 move+face-180, 9/10
// sidestep, 0xc/0xd fly up/down).
short g_movement_mode;
short DAT_0023bf4c;
short DAT_0023bf48;
/* collision_build_height_field's collision height-field: five 5-byte corner records at 0x202bf8,
   laid out `(&DAT_00202bf8)[corner*5 + k]`. collision_build_height_field writes the fields by
   name... */
 undefined1 DAT_00202bf8_backing[32];
/* Wall-slide corner-classification tables, used by resolve_wall_slide_corner (called from
   sweep_slide_along_wall when a wall hit has a specific blocked- corner shape) to pick which of the
   8 candidate headings in DAT_000869a8 to deflect toward. */
static signed char DAT_00086884_backing[4] = {1, -1, -1, 1};
#define DAT_00086884 DAT_00086884_backing[0]
static unsigned char DAT_0008688c_backing[32] = {
  5, 4, 3, 6, 9, 2, 7, 0, 1, 0, 0, 0, 92, 68, 65, 84,
  65, 92, 99, 111, 109, 111, 98, 106, 46, 100, 97, 116, 0, 0, 0, 0
};
#define DAT_0008688c DAT_0008688c_backing[4]
char *DAT_00204874;
/* The movement/collision-sweep working block. Ghidra split this one ~24-byte struct into 14
   separate globals (DAT_002049c8 .. */
 unsigned char DAT_002049c8_backing[64];
/* The reticle/collision "picked tile" record at 0x86998..0x869a2. */
 unsigned char DAT_00086998_backing[16];
static char DAT_0008794c_backing[128];
char *DAT_0008794c = DAT_0008794c_backing;
char *DAT_002048bc;
// was DAT_00086978. The three 16-bit velocity components of the movement block
/* (&DAT_00204886/88/8a). Ghidra typed this `char *`, so movement_sweep_setup's
   `g_sweep_velocity[1]` / `[2]` read single BYTES (offsets 7,8) instead of the shorts at offsets
   2,4 -- and every copy (`psVar11 = g_sweep_velocity`) is already `short *`, confirming the intent. */
static short *g_sweep_velocity;
static undefined1 DAT_002049c0;
/* "Already slid this tick" cooldown, decremented once per ordinary substep in sweep_step
   (`DAT_002049bc = DAT_002049bc + -1;`) and read back in sweep_slide_along_wall's own first line to
   skip re-deflecting mid-slide. */
static char DAT_002049bc;
short DAT_00086990;
static short DAT_00086996;
// was DAT_0008697c_backing/DAT_0008697c -- the swept working foot position (coarse X/Y/Z,
// tile-eighths / eighth-fine units) collision math operates on each sub-step before
// sweep_writeback_position commits it back to the real player position.
/* UU.exe .data at 0x8697c contains 0x2049c8: the swept XYZ and
   collision working XYZ are the same three halfwords, including rollback. */
static short *g_sweep_foot_pos = (short *)DAT_002049c8_backing;
/* X/Y/Z fine sweep position, indexed as a real 3-element array throughout this file
   (`(&DAT_00086980)[axis]` for axis 0/1/2) -- see this block's own comment above. */
static short DAT_00086980_arr[3];
#define DAT_00086980 DAT_00086980_arr[0]
#define DAT_00086982 DAT_00086980_arr[1]
#define DAT_00086984 DAT_00086980_arr[2]
static undefined4 DAT_00204878;
/* Sizing-audit pass: dead -- per the comment at its one real mention (collision height-field
   lookup, ~line 496), the correct access goes through DAT_00202c38 directly; this symbol is never
   actually read/written anywhere in the live decompile. Down from 256. */
static undefined DAT_00202c32_backing[4];
#define DAT_00202c32 DAT_00202c32_backing[0]
static ushort DAT_0008698c;
static short DAT_0008698e;
static ushort DAT_00086992;
static short DAT_00086994;
static short DAT_0008698a;
/* Sizing pass: both aliases are indexed only by DAT_0008698c/ DAT_0008698e (confirmed 0 or 1, the
   "which movement axis is dominant" selector) at a 2-byte stride -- real max byte offset across
   both aliases is 3, +2 for a short read = 8 bytes. */
static undefined1 DAT_00086986_backing[64];
#define DAT_00086986 DAT_00086986_backing[0]
#define DAT_00086987 DAT_00086986_backing[1]
/* Wall-slide deflection candidate-heading table (was a zero-initialized 65536-byte placeholder with
   no writer anywhere in the decompile -- an "orphaned data table" of the same class as the
   TMOBJ/inventory-hotspot tables fixed elsewhere in this project). sweep_slide_along_wall reads... */
static unsigned char DAT_000869a8_backing[16] = {
  0x00, 0x00, /*     0 */  0x00, 0xE0, /* -8192 */  0x00, 0xC0, /* -16384 */
  0x00, 0xA0, /* -24576 */ 0x00, 0x80, /* -32768 */ 0x00, 0x60, /*  24576 */
  0x00, 0x40, /* 16384 */  0x00, 0x20  /*  8192 */
};
#define DAT_000869a8 DAT_000869a8_backing[0]
static int DAT_00204870;
static char DAT_00087944_backing[128];
static char *DAT_00087944 = DAT_00087944_backing;
/* Port clock for movement_pacing_handler, in the original 4ms units. GX input polling samples
   elapsed time at 60Hz, including inside the original blocking input waits. */
unsigned int g_uw_frame_clock_units;
static char DAT_00087950_backing[128];
static char *DAT_00087950 = DAT_00087950_backing;
static char DAT_00087948_backing[128];
static char *DAT_00087948 = DAT_00087948_backing;
undefined4 DAT_0023bf54;
byte DAT_0023bf58;
int DAT_000879ac;
// was DAT_00086dfc. movement_tick's enable gate for tick_mobile_objects (the real per-tick NPC AI +
// mobile-object dispatcher) -- declared but never assigned anywhere in this decompile, a
// permanently-false gate; see init_gameplay_session's own comment for the fix.
int g_npc_tick_enabled;
char DAT_00086e84;
static int DAT_0023bf64;
static char DAT_0023bf60;
static uint DAT_0023bf5c;
/* Real static lookup table (.data, read-only in practice) recovered byte-for-byte from UU.exe via
   Ghidra (bytes at 0x86e38..0x86e47) -- confirmed boundary: the string literal just before it ("Lev
   %d @ ...") ends exactly at 0x86e38... */
static const signed char DAT_00086e38_backing[16] = {
   1,  3,  4,  3,  1, -3,  0,  0,
   1,  3,  4,  3,  1, -3,  0,  0
};
#define DAT_00086e38 DAT_00086e38_backing[0]
/* Real static lookup table, same recovery as DAT_00086e38 just above (bytes at 0x86e48..0x86e57,
   immediately following it in UU.exe's .data). apply_movement_tick indexes this with the same
   `bVar1 >> 4` for the sidestep-move bob curve (g_movement_mode 9/10). Also 16 real entries. */
static const signed char DAT_00086e48_backing[16] = {
   0,  0, -1, -2, -3, -4, -5, -6,
  -6, -4, -3, -2, -1,  0,  0,  0
};
#define DAT_00086e48 DAT_00086e48_backing[0]






/* param_1/param_2 were `int`/`undefined4`, truncating the real pointers this is always called with
   (&DAT_00204880, &DAT_002048b0) -- confirmed crashing (EXC_BAD_ACCESS, param_1 read back truncated
   to ~12MB) on a real run even after widening the callee-side globals... */
// was FUN_0005878c -- per-tick movement + collision sweep (from apply_movement_tick)
void movement_collision_sweep(void *movement_block_ptr, void *snapshot_ptr)
{
  char *movement_block = (char *)movement_block_ptr;
  char *snapshot = (char *)snapshot_ptr;
  int iVar1;
  char cVar2;
  char cVar3;
  
  cVar3 = '\0';
  g_sweep_velocity = (short *)(movement_block + 6);
  DAT_002049c0 = *(undefined1 *)(movement_block + 0x28);
  DAT_002049bc = 0;
  DAT_00204874 = movement_block;
  DAT_002048bc = snapshot;
  // PHYSICS: set up this tick's velocity, sub-step count and target heights
  iVar1 = movement_sweep_setup(1,1);
  if (iVar1 != 0) {
    // PHYSICS: sub-tile sweep -- advance the move DAT_00086990+1 sub-steps,
    // colliding (floor/wall/ceiling) at each one; capped at 16 iterations
    while ((int)DAT_00086996 < DAT_00086990 + 1) {
      cVar2 = cVar3 + '\x01';
      if (cVar3 == '\x10') {
        *(undefined1 *)(DAT_00204874 + 0x10) = 0;
        *(undefined1 *)(DAT_00204874 + 0x11) = 0;
        *(undefined1 *)(DAT_00204874 + 10) = 0;
        *(undefined1 *)(DAT_00204874 + 0xb) = 0;
        *(undefined1 *)(DAT_00204874 + 0x14) = 0;
        *(undefined1 *)(DAT_00204874 + 0x15) = 0;
        return;
      }
      // PHYSICS: integrate one sub-step (horizontal, or vertical if falling/climbing)
      iVar1 = sweep_step(1);
      cVar3 = cVar2;
      if (iVar1 != 0) {
        // PHYSICS: this sub-step crossed a cell boundary -- run collision resolution
        sweep_apply_collision();
      }
    }
    // PHYSICS: commit the swept X/Y/Z back into the player movement block
    sweep_writeback_position();
  }
}



// was FUN_00058878 -- init the per-tick collision-sweep working set from the movement block
void sweep_init_position()
{
  DAT_00202c6c = (byte *)&DAT_002049c8;
  DAT_002049ce = *(undefined2 *)(DAT_00204874 + 0x21);
  DAT_002049d0 = DAT_00204874[0x25];
  DAT_002049d1 = DAT_00204874[0x26];
  DAT_002049d2 = *(undefined2 *)(DAT_00204874 + 0x23);
  *g_sweep_foot_pos = *(short *)DAT_00204874 >> 5;
  g_sweep_foot_pos[1] = *(short *)(DAT_00204874 + 2) >> 5;
  g_sweep_foot_pos[2] = *(short *)(DAT_00204874 + 4) >> 3;
  DAT_00086980 = (*DAT_00204874 & 0x1f) << 8;
  DAT_00086982 = (DAT_00204874[2] & 0x1f) << 8;
  DAT_00086984 = (DAT_00204874[4] & 7) << 8;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005898c -- pick the object under the view reticle (-> DAT_00086998 slot, DAT_00086999/9a tile x/y)
void reticle_object_pick(int mode)
{
  byte bVar1;
  ushort *puVar2;
  short *psVar3;
  int iVar4;
  uint uVar5;
  int iVar6;
  bool bVar7;
  
  DAT_00204878 = 1;
  sort_collision_candidates();
  DAT_00086998 = -1;
  _DAT_0008699f = 0x7f;
  if (*(short *)(DAT_00204874 + 10) < 1) {
    if (*(short *)(DAT_00204874 + 10) == 0) {
      bVar1 = DAT_002049d9;
      if ((int)((uint)*(byte *)(DAT_00204874 + 0x27) + (int)*(short *)((char *)g_sweep_foot_pos + 4)) <
          (int)(uint)DAT_002049d9) {
        bVar1 = DAT_002049d8;
      }
      _DAT_0008699b = (ushort)bVar1;
      if (((DAT_002049dd != 0) || ((char)DAT_002049de < 1)) ||
         (bVar7 = true, (int)(uint)DAT_002049dc < (int)(char)DAT_002049de)) {
        bVar7 = false;
      }
      iVar4 = 0;
      if (DAT_002049dc != 0) {
        do {
          iVar6 = iVar4 * 6;
          puVar2 = (ushort *)get_object_record_by_slot_index(*(ushort *)(&DAT_00202c3a + iVar6) >> 6);
          /* get_object_record_by_slot_index returns NULL for an empty slot (id bits clear).
             Ghidra dropped the guard; with forward movement now working this
             loop runs (via sweep_collision_flags) and hit the NULL deref. */
          if (puVar2 != (ushort *)0x0 && (g_object_type_props[(((uw_object_hdr_t *)puVar2)->object_id)].quality_flags & 1) != 0) {
            if (iVar4 < (char)DAT_002049de) {
              if ((bVar7) &&
                 (bVar1 = (&DAT_00202c38)[iVar6], (short)_DAT_0008699b <= (short)(ushort)bVar1)) {
                _DAT_0008699b = (ushort)bVar1;
                DAT_00086998 = (char)iVar4;
              }
            }
            else {
              if ((int)((byte)(&DAT_00202c39)[iVar6] - 1) < (int)_DAT_0008699f) {
                _DAT_0008699f = (byte)(&DAT_00202c39)[iVar6] - 1;
              }
              if (iVar4 < (int)((uint)DAT_002049dd + (int)(char)DAT_002049de)) {
                bVar1 = (&DAT_00202c38)[iVar6];
                if (((int)(short)_DAT_0008699b < (int)(uint)bVar1) &&
                   ((int)(uint)bVar1 < (int)(0x80 - (uint)*(byte *)(DAT_00204874 + 0x26)))) {
                  _DAT_0008699b = (ushort)bVar1;
                  DAT_00086998 = (char)iVar4;
                }
              }
            }
          }
          iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
        } while (iVar4 < (int)(uint)DAT_002049dc);
      }
    }
    else {
      _DAT_0008699b = (ushort)DAT_002049d9;
      iVar4 = (int)(char)DAT_002049de;
      if (0 < iVar4) {
        uVar5 = (uint)DAT_002049dc;
        bVar7 = SBORROW4(iVar4,uVar5);
        iVar6 = iVar4 - uVar5;
        bVar1 = DAT_002049de;
        if (iVar4 <= (int)uVar5) {
          /* ARM 0x58d78..0x58d84 reads collision_table + count*6 - 6: the highest surface below the
             foot. Ghidra named the base-6 address DAT_00202c32, but its separate C scalar is not
             part of the table, so indexing it could skip bridges entirely. */
          bVar1 = (&DAT_00202c38)[(iVar4 - 1) * 6];
          bVar7 = SBORROW4((int)(short)(ushort)DAT_002049d9,(uint)bVar1);
          iVar6 = (int)(short)(ushort)DAT_002049d9 - (uint)bVar1;
        }
        if (iVar6 < 0 != bVar7) {
          DAT_00086998 = DAT_002049de - 1;
          _DAT_0008699b = (ushort)bVar1;
        }
      }
      DAT_00204878 = 0;
    }
    goto LAB_00058db4;
  }
  if (DAT_002049dc == 0) {
LAB_00058a64:
    /* No slope/step feature at this sub-position. */
    _DAT_0008699b = (ushort)(0x80 - (uint)*(byte *)(DAT_00204874 + 0x26));
  }
  else {
    iVar4 = (uint)DAT_002049dd + (int)(char)DAT_002049de;
    if (((int)(uint)DAT_002049dc <= iVar4) || ((char)DAT_002049de < 0)) goto LAB_00058a64;
    DAT_00086998 = DAT_002049dd + DAT_002049de;
    _DAT_0008699b =
         (ushort)(byte)(&DAT_00202c39)[iVar4 * 6] - (ushort)*(byte *)(DAT_00204874 + 0x26);
  }
  DAT_00204878 = 0;
  if ((int)((uint)*(byte *)(DAT_00204874 + 0x25) + (int)*(short *)((char *)g_sweep_foot_pos + 4)) <
      (int)(uint)DAT_002049d9) {
    _DAT_0008699b = (ushort)DAT_002049d9;
    DAT_00204878 = 1;
  }
LAB_00058db4:
  if (DAT_00086998 != -1) {
    psVar3 = (short *)resolve_object_link(&DAT_00202c3a + DAT_00086998 * 6);
    /* resolve_object_link returns NULL when the picked slot carries no object link (id bits 6..15
       clear). */
    if (psVar3 == (short *)0x0) {
      DAT_00086998 = -1;
    }
    else {
      DAT_00086999 = (undefined1)((int)((uw_object_hdr_t *)psVar3)->type_flags_signed & 0x1ffU);
      DAT_0008699a = (undefined1)(((int)((uw_object_hdr_t *)psVar3)->type_flags_signed & 0x1ffU) >> 8);
    }
  }
}



// was FUN_00058e08 -- set up the movement/collision sweep (screen deltas, step DDA state)
int movement_sweep_setup(int is_initial, int use_remaining)
{
  uint uVar1;
  uint uVar2;
  bool bVar3;
  ushort uVar4;
  undefined1 uVar5;
  undefined4 uVar6;
  short extraout_r1;
  int iVar7;
  int iVar8;
  char *state_rec;
  undefined2 uVar9;
  int iVar10;
  short *psVar11;
  short local_20;
  short local_1e;
  
  angle_to_screen_delta((int)*(short *)(DAT_00204874 + 0x21),&local_20,&local_1e);
  iVar10 = (int)*(short *)(DAT_00204874 + 0x14) * (int)local_20 >> 0xf;
  *(char *)(DAT_00204874 + 6) = (char)iVar10;
  *(char *)(DAT_00204874 + 7) = (char)((uint)iVar10 >> 8);
  iVar10 = (int)*(short *)(DAT_00204874 + 0x14) * (int)local_1e >> 0xf;
  *(char *)(DAT_00204874 + 8) = (char)iVar10;
  *(char *)(DAT_00204874 + 9) = (char)((uint)iVar10 >> 8);
  *g_sweep_velocity = *g_sweep_velocity + *(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0xc);
  g_sweep_velocity[1] =
       g_sweep_velocity[1] + *(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0xe);
  psVar11 = g_sweep_velocity;
  g_sweep_velocity[2] =
       g_sweep_velocity[2] + *(short *)(DAT_00204874 + 0x12) * *(short *)(DAT_00204874 + 0x10);
  if ((g_sweep_velocity[1] == 0 && g_sweep_velocity[2] == 0) && *g_sweep_velocity == 0) {
    return 0;
  }
  if (is_initial != 0) {
    sweep_init_position();
  }
  state_rec = DAT_00204874;
  psVar11 = g_sweep_velocity;
  uVar1 = (int)*(short *)(DAT_00204874 + 6) >> 0x1f;
  uVar2 = (int)*(short *)(DAT_00204874 + 8) >> 0x1f;
  bVar3 = (int)(((int)*(short *)(DAT_00204874 + 6) ^ uVar1) - uVar1) <=
          (int)(((int)*(short *)(DAT_00204874 + 8) ^ uVar2) - uVar2);
  DAT_0008698c = (ushort)bVar3;
  iVar10 = (int)(short)(ushort)bVar3;
  uVar5 = 0x20;
  if (psVar11[iVar10] < 1) {
    uVar5 = 0xe0;
  }
  /* DAT_0008698e is the OTHER movement axis (DAT_0008698c is the dominant one, 0=X or 1=Y). */
  DAT_0008698e = (short)((iVar10 + 1) % 2);
  (&DAT_00086986)[iVar10 * 2] = 0;
  (&DAT_00086987)[iVar10 * 2] = uVar5;
  if (g_sweep_velocity[(short)DAT_0008698c] == 0) {
    iVar10 = (int)DAT_0008698e;
    (&DAT_00086986)[iVar10 * 2] = 1;
    (&DAT_00086987)[iVar10 * 2] = 0;
    iVar10 = (int)(short)DAT_0008698c;
    (&DAT_00086986)[iVar10 * 2] = 1;
    (&DAT_00086987)[iVar10 * 2] = 0;
    DAT_00086990 = 0;
    DAT_00086992 = 0;
    DAT_00086994 = *(short *)(state_rec + 0x12);
    psVar11 = g_sweep_velocity;
  }
  else {
    iVar10 = (int)DAT_0008698e;
    iVar7 = (int)*(short *)(&DAT_00086986 + (short)DAT_0008698c * 2);
    if (iVar7 < 0) {
      iVar7 = iVar7 + 0xff;
    }
    uVar5 = ordint_divmod((int)g_sweep_velocity[(short)DAT_0008698c],
                         (iVar7 >> 8) * (int)g_sweep_velocity[iVar10]).quot;
    iVar10 = iVar10 * 2;
    (&DAT_00086986)[iVar10] = 0;
    (&DAT_00086987)[iVar10] = uVar5;
    psVar11 = g_sweep_velocity;
    iVar10 = (int)*(short *)(state_rec + 0x12) * (int)g_sweep_velocity[(short)DAT_0008698c] * 0x10000;
    uVar1 = iVar10 >> 0x1f;
    iVar10 = (iVar10 >> 0x10 ^ uVar1) - uVar1;
    DAT_00086992 = (ushort)((uint)(iVar10 * 0x10000) >> 0x10) & 0x1fff;
    DAT_00086990 = (undefined2)(iVar10 >> 0xd);
    uVar6 = ordint_divmod((int)g_sweep_velocity[(short)DAT_0008698c],0x2000).quot;
    uVar4 = (ushort)((int)uVar6 >> 0x1f);
    DAT_00086994 = ((ushort)uVar6 ^ uVar4) - uVar4;
  }
  DAT_00086996 = 0;
  // PHYSICS: build the destination tile's floor/ceiling height field for collision
  if (((DAT_002049d2 == 1) || (psVar11[2] != 0)) && (use_remaining != 0)) {
    collision_build_height_field(*(undefined1 *)(state_rec + 0x27));
    collision_height_envelope(0,0);
    psVar11 = g_sweep_velocity;
  }
// PHYSICS: gravity gate -- psVar11[2] is g_sweep_velocity[2], which (g_sweep_velocity ==
  // (short*)(DAT_00204874+6)) is *(short*)(DAT_00204874+0xa) -- the exact same memory as
  // g_vertical_velocity itself, just reached through a different pointer/name.
  if (psVar11[2] == 0) {
    DAT_0008698a = 0;
    return 1;
  }
  /* PHYSICS: seed the vertical direction for the fine sub-integrator from the current velocity's
     sign. */
  DAT_0008698a = 0x800;
  if (psVar11[2] < 1) {
    DAT_0008698a = -0x800;
  }
  reticle_object_pick(use_remaining);
  psVar11 = g_sweep_velocity;
  if (g_sweep_velocity[(short)DAT_0008698c] != 0) {
    iVar10 = (int)*(short *)(&DAT_00086986 + (short)DAT_0008698c * 2);
    if (iVar10 < 0) {
      iVar10 = iVar10 + 0x1fff;
    }
    iVar8 = (int)DAT_0008698a;
    if (iVar8 < 0) {
      iVar8 = iVar8 + 0x7ff;
    }
    iVar10 = ordint_divmod(((int)(iVar8) >> 0xb) * (int)g_sweep_velocity[(short)DAT_0008698c],
                          (iVar10 >> 0xd) * (int)g_sweep_velocity[2] * 0x100).quot;
    if ((iVar10 < 0x8000) && (-0x8001 < iVar10)) {
      uVar9 = (undefined2)iVar10;
      goto LAB_000592f8;
    }
    DAT_00086992 = 0;
  }
  iVar10 = ((int)psVar11[2] >> 1) * (int)*(short *)(DAT_00204874 + 0x12);
  uVar1 = iVar10 >> 0x1f;
  uVar9 = (undefined2)(((iVar10 >> 5 ^ uVar1) - uVar1) * 0x10000 >> 0x10);
LAB_000592f8:
  // PHYSICS: gravity/climb rate -- _DAT_000869a1 (DAT_000869a1/a2) is the vertical
  // speed the integrator (sweep_step_vertical) accelerates by each sub-step this sweep
  DAT_000869a2 = (char)((ushort)uVar9 >> 8);
  DAT_000869a1 = (char)uVar9;
  return 1;
}



// was FUN_0005932c -- re-seed the sweep for the distance still left (after a
// block/redirect): recompute the remaining-distance field (+0x12), re-run
// movement_sweep_setup, and end the tick if nothing is left or setup fails
void sweep_restart_remaining(int steps)
{
  int iVar1;
  
  iVar1 = ((int)*(short *)(DAT_00204874 + 0x12) - (int)DAT_00086996 * (int)DAT_00086994) * 0x10000;
  *(char *)(DAT_00204874 + 0x12) = (char)((uint)iVar1 >> 0x10);
  *(char *)(DAT_00204874 + 0x13) = (char)((uint)iVar1 >> 0x18);
  if ((*(short *)(DAT_00204874 + 0x12) < 1) || (iVar1 = movement_sweep_setup(0,steps), iVar1 == 0)) {
    DAT_00086996 = DAT_00086990 + 1;
  }
}



// was FUN_000593c0 PHYSICS: kill all velocity -- zero the horizontal (+6/+8/+0xc/+0xe) and vertical
// (+0xa/+0x10) velocity/accumulator fields and end the sweep. Called on a hard blocking hit
// (0x4000) so the player stops instead of bouncing.
void sweep_kill_velocity()
{
  *(undefined1 *)(DAT_00204874 + 8) = 0;
  *(undefined1 *)(DAT_00204874 + 9) = 0;
  *(undefined1 *)(DAT_00204874 + 0xe) = 0;
  *(undefined1 *)(DAT_00204874 + 0xf) = 0;
  *(undefined1 *)(DAT_00204874 + 6) = 0;
  *(undefined1 *)(DAT_00204874 + 7) = 0;
  *(undefined1 *)(DAT_00204874 + 0xc) = 0;
  *(undefined1 *)(DAT_00204874 + 0xd) = 0;
  *(undefined1 *)(DAT_00204874 + 10) = 0;
  *(undefined1 *)(DAT_00204874 + 0xb) = 0;
  *(undefined1 *)(DAT_00204874 + 0x10) = 0;
  *(undefined1 *)(DAT_00204874 + 0x11) = 0;
  *(undefined1 *)(DAT_00204874 + 0x14) = 0;
  *(undefined1 *)(DAT_00204874 + 0x15) = 0;
  DAT_00086996 = DAT_00086990 + 1;
}



// was FUN_00059488 -- write the swept X/Y/Z position + heading back into the movement block
void sweep_writeback_position()
{
  uint uVar1;
  undefined2 uVar2;
  int iVar3;
  
  /* Ghidra split three 16-bit stores of the reconstructed player position (X at +0, Y at +2, Z at
     +4 of the movement block) into byte pairs and botched the low-byte offset of the 2nd and 3rd:
     Y-low went to +1 (X's high byte) and Z-low to +2 (Y's low byte)... */
  // PHYSICS: commit swept X (+0), Y (+2) and Z/foot height (+4) to the movement block
  *(short *)(DAT_00204874 + 0) =
       (short)(*g_sweep_foot_pos * 0x20 + (((int)DAT_00086980 << 0x10) >> 0x18));
  *(short *)(DAT_00204874 + 2) =
       (short)(g_sweep_foot_pos[1] * 0x20 + (((int)DAT_00086982 << 0x10) >> 0x18));
  *(short *)(DAT_00204874 + 4) =
       (short)(g_sweep_foot_pos[2] * 8 + (((int)DAT_00086984 << 0x10) >> 0x18));
  if (((((DAT_002049d4 & 0x2000) != 0) &&
       (uVar1 = (int)((int)g_sweep_foot_pos[2] - (uint)DAT_002049d8) >> 0x1f,
       (int)(((int)g_sweep_foot_pos[2] - (uint)DAT_002049d8 ^ uVar1) - uVar1) <=
       (int)(uint)*(byte *)((char *)DAT_00204874 + 0x25))) && (DAT_002049d2 == 1)) &&
     (*(char *)(DAT_00204874 + 5) == 0)) {
    /* re-snap Z (bytes +4..+5) to the floor height. compute_floor_height_at_position wants the
       tile X and Y as halfwords; Ghidra rendered the args as X's two bytes
       and stored the result's low byte to +2 (Y-low) instead of +4. */
    uVar2 = compute_floor_height_at_position(*(short *)(DAT_00204874 + 0),*(short *)(DAT_00204874 + 2));
    *(short *)(DAT_00204874 + 4) = (short)uVar2;
  }
  /* heading is the halfword at +0x21; Ghidra put the high byte at +0x11
     (g_fall_accel's high byte), clobbering the Z-force accumulator. */
  *(short *)(DAT_00204874 + 0x21) = DAT_002049ce;
}



// was FUN_000595d4 -- integrate one sub-tile step of the movement/collision sweep
// PHYSICS: horizontal integrator -- advances the swept X/Y (g_sweep_foot_pos[0/1])
// along the dominant/secondary axes and carries the sub-cell remainders
int sweep_integrate_substep(short sub_step, short axis)
{
  int iVar1;
  int iVar2;
  short sVar3;
  
  iVar2 = (int)axis;
  if ((int)DAT_00086996 < (int)((uint)(iVar2 == -1) + (int)DAT_00086990)) {
    iVar1 = (int)DAT_0008698e;
    sVar3 = *(short *)(&DAT_00086986 + iVar1 * 2);
    if (iVar2 != 1) {
      sVar3 = -sVar3;
    }
    (&DAT_00086980)[iVar1] = sVar3 + (&DAT_00086980)[iVar1];
    iVar1 = (int)DAT_0008698c;
    if (*(short *)(&DAT_00086986 + iVar1 * 2) * iVar2 < 1) {
      sVar3 = g_sweep_foot_pos[iVar1] + -1;
    }
    else {
      sVar3 = g_sweep_foot_pos[iVar1] + 1;
    }
    g_sweep_foot_pos[iVar1] = sVar3;
    iVar2 = (int)DAT_0008698e;
    if (((&DAT_00086980)[iVar2] & 0xe000) != 0) {
      if ((short)(&DAT_00086980)[iVar2] < 1) {
        sVar3 = g_sweep_foot_pos[iVar2] + -1;
      }
      else {
        sVar3 = g_sweep_foot_pos[iVar2] + 1;
      }
      g_sweep_foot_pos[iVar2] = sVar3;
      iVar2 = (int)DAT_0008698e;
      sVar3 = (&DAT_00086980)[iVar2];
      *(char *)(&DAT_00086980 + iVar2) = (char)((int)sVar3 & 0x1fffU);
      *(char *)((intptr_t)&DAT_00086980 + iVar2 * 2 + 1) = (char)(((int)sVar3 & 0x1fffU) >> 8);
    }
    iVar2 = 1;
  }
  else {
    iVar1 = (int)DAT_0008698e;
    sVar3 = (*(short *)(&DAT_00086986 + iVar1 * 2) >> 5) * (short)(char)((ushort)DAT_00086992 >> 8);
    if (iVar2 != 1) {
      sVar3 = -sVar3;
    }
    (&DAT_00086980)[iVar1] = sVar3 + (&DAT_00086980)[iVar1];
    iVar1 = (int)DAT_0008698c;
    sVar3 = DAT_00086992;
    if (*(short *)(&DAT_00086986 + iVar1 * 2) * iVar2 < 1) {
      sVar3 = -DAT_00086992;
    }
    (&DAT_00086980)[iVar1] = (&DAT_00086980)[iVar1] + sVar3;
    if ((DAT_00086980 & 0xe000) != 0) {
      sub_step = 1;
      if ((short)DAT_00086980 < 1) {
        sVar3 = *g_sweep_foot_pos + -1;
      }
      else {
        sVar3 = *g_sweep_foot_pos + 1;
      }
      *g_sweep_foot_pos = sVar3;
      DAT_00086980 = DAT_00086980 & 0x1fff;
    }
    if ((DAT_00086982 & 0xe000) != 0) {
      sub_step = 1;
      if ((short)DAT_00086982 < 1) {
        sVar3 = g_sweep_foot_pos[1] + -1;
      }
      else {
        sVar3 = g_sweep_foot_pos[1] + 1;
      }
      g_sweep_foot_pos[1] = sVar3;
      DAT_00086982 = DAT_00086982 & 0x1fff;
    }
    iVar2 = (int)sub_step;
  }
  DAT_00086996 = DAT_00086996 + axis;
  return iVar2;
}



// was FUN_0005989c -- deflect the move's heading against the wall normal it
// hit (DAT_002049ce) so it slides along the face; returns 0 when the move
// cannot be deflected (dead stop). Used by the slide path.
int sweep_deflect_heading(uint heading)
{
  int uw_ord2005_rem_120 = 0;
  uint uVar1;
  byte bVar2;
  short sVar3;
  undefined2 uVar4;
  undefined4 uVar5;
  uint uVar6;
  int extraout_r1;
  /* Heading differences and velocity arithmetic must stay signed integers.
   * Ghidra merged these with a later record-pointer role; pointer comparisons
   * treated negative heading differences as large positive addresses. */
  int iVar7;
  char *movement_record;
  char *iVar8;
  bool bVar9;
  
  if ((*(byte *)(DAT_00204874 + 0x17) & 0x40) == 0) {
    iVar7 = (int)*(short *)(DAT_00204874 + 10);
    if (iVar7 != 0) {
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0xf;
      }
      iVar7 = (*(byte *)(DAT_00204874 + 0x16) + 1) * (int)(short)((int)(iVar7) >> 4);
      *(char *)(DAT_00204874 + 10) = (char)iVar7;
      *(char *)(DAT_00204874 + 0xb) = (char)((uint)iVar7 >> 8);
    }
    iVar8 = DAT_00204874;
    sVar3 = (short)(heading - (int)DAT_002049ce);
    iVar7 = (int)((heading - (int)DAT_002049ce) * 0x10000) >> 0x10;
    if ((0x4000 < iVar7) || (iVar7 < -0x4000)) {
      heading = heading + 0x8000;
      sVar3 = sVar3 + -0x8000;
    }
    uVar6 = (uint)sVar3;
    uVar1 = (int)uVar6 >> 0x1f;
    if ((*(byte *)(DAT_00204874 + 0x17) & 0x80) == 0) {
      iVar7 = (uVar6 ^ uVar1) - uVar1;
      if ((iVar7 < 0x3001) || (0x4fff < iVar7)) {
        bVar2 = *(byte *)(DAT_00204874 + 0x16);
        /* ARM 0x59a54..0x59a9c keeps the signed angle delta in r1. */
        sVar3 = ordint_divmod(0xf,sVar3).quot;
        sVar3 = (ushort)bVar2 * sVar3;
      }
      sVar3 = (short)heading + sVar3;
    }
    else {
      iVar7 = (uVar6 ^ uVar1) - uVar1;
      if ((0x3000 < iVar7) && (iVar7 < 0x5000)) {
        iVar7 = (uint)*(ushort *)(DAT_00204874 + 0x29) + (uint)*(ushort *)(DAT_00204874 + 0x14);
        *(char *)(DAT_00204874 + 0x29) = (char)((uint)((int)(iVar7) * 0x10000) >> 0x10);
        *(char *)(DAT_00204874 + 0x2a) = (char)((uint)iVar7 >> 8);
        goto LAB_000599b0;
      }
      sVar3 = (short)heading;
      if ((int)DAT_002049ce == (heading & 0xffff)) {
        bVar9 = (heading & 0x4000) != 0;
        uVar5 = ce_rand();
        uw_ord2005_rem_120 = ((int)(uVar5)) % (2);
        if (uw_ord2005_rem_120 != 0) {
          bVar9 = !bVar9;
        }
        DAT_00086980 = (ushort)bVar9 * 0x1f00;
        DAT_00086982 = (ushort)(uw_ord2005_rem_120 == 0) * 0x1f00;
        iVar8 = DAT_00204874;
        sVar3 = DAT_002049ce;
      }
    }
    DAT_002049ce = sVar3;
    if ((*(byte *)(iVar8 + 0x17) & 0x80) == 0) {
      uVar6 = ordint_divmod(0xf,(0xf - (uint)*(byte *)(iVar8 + 0x16)) * (int)*(short *)(iVar8 + 0x14)
                          ).quot;
      iVar7 = (uint)*(ushort *)(iVar8 + 0x29) + (uVar6 & 0xffff);
      *(char *)(iVar8 + 0x29) = (char)iVar7;
      *(char *)(DAT_00204874 + 0x2a) = (char)((uint)iVar7 >> 8);
      movement_record = DAT_00204874;
      uVar4 = ordint_divmod(0xf,(uint)*(byte *)(DAT_00204874 + 0x16) *
                               (int)*(short *)(DAT_00204874 + 0x14)).quot;
      *(char *)(movement_record + 0x14) = (char)uVar4;
      *(char *)(DAT_00204874 + 0x15) = (char)((ushort)uVar4 >> 8);
      iVar8 = DAT_00204874;
    }
    sVar3 = DAT_002049ce;
    *(char *)(iVar8 + 0x21) = (char)DAT_002049ce;
    *(char *)(DAT_00204874 + 0x22) = (char)((ushort)sVar3 >> 8);
    uVar5 = 1;
  }
  else {
LAB_000599b0:
    uVar5 = 0;
  }
  return uVar5;
}



// was FUN_00059b7c -- PHYSICS: wall collision (slide). Reverts the blocked
// sub-step, deflects the heading along the hit face (sweep_deflect_heading)
// and either resumes the remaining move or ends the tick.
void sweep_slide_along_wall(int attempt)
{
  int iVar1;
  ushort uVar2;

  if ('\0' < DAT_002049bc) {
    sweep_step(0xffffffff);
    DAT_00086996 = DAT_00086990 + 1;
    return;
  }
  if (attempt != 0) {
    resolve_wall_slide_corner();
    uVar2 = (ushort)DAT_002049da;
    if (DAT_002049da != 9) goto LAB_00059be4;
  }
  uVar2 = DAT_0008698c << 1;
LAB_00059be4:
  sweep_step(0xffffffff);
  iVar1 = sweep_deflect_heading(*(undefined2 *)(&DAT_000869a8 + (short)uVar2 * 2));
  if (iVar1 == 0) {
    DAT_00086996 = DAT_00086990 + 1;
  }
  else {
    sweep_restart_remaining(1);
    DAT_002049bc = '\x02';
  }
}



// was FUN_00059c38 -- PHYSICS: recoil. Seeds a downward vertical velocity
// (+0xa = -0x15, +0x10 = -4) and shoves the facing (+0x21) back by ~0x3000
// plus a random amount -- the stagger/knockback when a move is hard-blocked.
void sweep_apply_knockback()
{
  int uw_ord2005_rem_121 = 0;
  undefined4 uVar1;
  short extraout_r1;
  int iVar2;
  
  *(undefined1 *)(DAT_00204874 + 10) = 0xeb;
  *(undefined1 *)(DAT_00204874 + 0xb) = 0;
  *(undefined1 *)(DAT_00204874 + 0x10) = 0xfc;
  *(undefined1 *)(DAT_00204874 + 0x11) = 0xff;
  if (*(short *)(DAT_00204874 + 0x14) < 0xeb) {
    *(undefined1 *)(DAT_00204874 + 0x14) = 0xeb;
    *(undefined1 *)(DAT_00204874 + 0x15) = 0;
  }
  *(undefined1 *)(DAT_00204874 + 0x28) = 0x10;
  iVar2 = *(short *)(DAT_00204874 + 0x21) + -0x3000;
  *(char *)(DAT_00204874 + 0x21) = (char)iVar2;
  *(char *)(DAT_00204874 + 0x22) = (char)((uint)iVar2 >> 8);
  uVar1 = ce_rand();
  uw_ord2005_rem_121 = ((int)(uVar1)) % (0x6000);
  iVar2 = (int)*(short *)(DAT_00204874 + 0x21) + (int)uw_ord2005_rem_121;
  *(char *)(DAT_00204874 + 0x21) = (char)iVar2;
  *(char *)(DAT_00204874 + 0x22) = (char)((uint)iVar2 >> 8);
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00059d20 PHYSICS: landing / surface contact -- called when the vertical integrator
// crosses the target height.
void sweep_land_on_surface()
{
  byte *pbVar1;
  ushort uVar2;
  undefined1 uVar3;
  short sVar4;
  undefined2 uVar5;
  short sVar6;
  ushort *puVar7;
  uint uVar8;
  short *psVar9;
  short sVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  
  /* The decompile uses a short-pointer view of the movement record.
     Keep word indexing and raw byte offsets distinct (ARM 0x59d20..0x5a33c). */
  puVar7 = (ushort *)get_object_record_by_slot_index((int)DAT_002049d2);
  uVar2 = g_object_type_props[(((uw_object_hdr_t *)puVar7)->object_id)].size_weight;
  iVar12 = (int)_DAT_000869a1;
  if (iVar12 < 5) {
    sVar4 = 0;
  }
  else {
    uVar11 = (int)*(short *)((char *)g_sweep_foot_pos + 4) - (int)_DAT_0008699b;
    uVar8 = (int)uVar11 >> 0x1f;
    if (iVar12 < 0) {
      iVar12 = iVar12 + 3;
    }
    sVar4 = ordint_divmod(iVar12 >> 2,
                         (((int)(((uVar11 ^ uVar8) - uVar8) * 0x10000) >> 0x10) * (int)DAT_00086994
                          * 0x10000 >> 0x10) << 4).quot;
    sVar4 = ((short *)DAT_00204874)[9] - sVar4;
  }
  *(char *)(DAT_00204874 + 0x12) = (char)sVar4;
  *(char *)((char *)DAT_00204874 + 0x13) = (char)((ushort)sVar4 >> 8);
  // PHYSICS: floor/ceiling collision -- snap the foot exactly onto the surface
  // and zero the vertical sub-unit accumulator so gravity restarts from rest
  *(short *)((char *)g_sweep_foot_pos + 4) = _DAT_0008699b;
  psVar9 = (short *)DAT_00204874;
  DAT_00086984 = 0;
  // BUG FIX (confirmed live: landing in water made no splash). Both landing
  // sounds below test this word -- the object's downward velocity -- and the
  // no-bounce workaround immediately after this line zeroes it for exactly
  // the case that matters, a falling player. With it zeroed, `[5] < 0` is
  // false, the water-landing branch (sound 5) is skipped, and the fall
  // reaches the hard-landing sound 15 instead -- which has no WAVE resource
  // in this port (the 813-815 gap), so the player simply got silence.
  //
  // Captured here, before the workaround, and used by both triggers below.
  // That restores what the original ARM code saw, since the original never
  // zeroed it: the workaround is this port's own addition.
  short landing_velocity = *(short *)((char *)DAT_00204874 + 10);
// HACK: The player-only landing workaround is enabled by default; --player-no-bounce=0 disables
// it. It is absent from the original ARM code. Clear downward velocity, gravity, and airborne state
// before restitution so the player stops on landing. Mobile items retain their normal bounce.
  {
    if ((puVar7 == g_player_object) && (*(short *)(DAT_00204874 + 10) < 0) &&
        g_opts.player_no_bounce) {
      *(short *)(DAT_00204874 + 10) = 0;
      *(short *)(DAT_00204874 + 0x10) = 0;
      if (*(byte *)(DAT_00204874 + 0x28) == 0x10) {
        *(undefined1 *)(DAT_00204874 + 0x28) = 8;
      }
    }
  }
  if ((((DAT_00086998 == -1) && ((DAT_002049d4 & 1) != 0)) &&
      ((int)*(short *)((char *)g_sweep_foot_pos + 4) <= (int)((uint)DAT_002049d0 + (uint)DAT_002049d8))) &&
     (landing_velocity < 0)) {
    sweep_kill_velocity();
    *(undefined1 *)(DAT_00204874 + 0x28) = 2;
    uVar3 = ordint_divmod(0x32,(short)(uVar2 >> 4) + -600).quot;
    play_positional_sound_effect(5,(int)*(short *)DAT_00204874 >> 5,(int)((short *)DAT_00204874)[1] >> 5,uVar3);
    return;
  }
  sVar4 = landing_velocity; /* see landing_velocity's comment above */
  uVar8 = (int)sVar4 >> 0x1f;
  uVar11 = ordint_divmod(0x32,(short)(uVar2 >> 4) + -600).quot;
  uVar8 = ordint_divmod(10,((int)sVar4 ^ uVar8) - uVar8).quot;
  play_positional_sound_effect(0xf,(int)*psVar9 >> 5,(int)psVar9[1] >> 5,(uVar11 & 0xff) + (uVar8 & 0xff) + -0x28);
  uVar8 = resolve_collision_candidate_interaction((int)DAT_00086998,(int)DAT_002049d2);
  psVar9 = (short *)DAT_00204874;
  if ((uVar8 & 0x18) != 0) {
    if ((uVar8 & 0x10) != 0) {
      sweep_kill_velocity();
      return;
    }
    DAT_00086996 = DAT_00086990 + 1;
    return;
  }
  if ((uVar8 & 4) == 0) {
    if (DAT_00086998 != -1) {
      DAT_002049dc = DAT_002049dc - 1;
      iVar13 = (uint)DAT_002049dc * 6;
      iVar12 = DAT_00086998 * 6;
      (&DAT_00202c38)[iVar12] = (&DAT_00202c38)[iVar13];
      (&DAT_00202c39)[iVar12] = (&DAT_00202c39)[iVar13];
      (&DAT_00202c3a)[iVar12] = (&DAT_00202c3a)[iVar13];
      (&DAT_00202c3b)[iVar12] = (&DAT_00202c3b)[iVar13];
      (&DAT_00202c3c)[iVar12] = (&DAT_00202c3c)[iVar13];
      (&DAT_00202c3d)[iVar12] = (&DAT_00202c3d)[iVar13];
    }
    goto LAB_0005a33c;
  }
  sVar4 = ((short *)DAT_00204874)[5];
  /* ARM 0x5a018..0x5a044: divide the signed vertical velocity
     by -15, then multiply by the restitution byte at offset 0x16. */
  uVar5 = ordint_divmod(-15,sVar4).quot;
  *(char *)(psVar9 + 5) = (char)uVar5;
  *(char *)((char *)DAT_00204874 + 0xb) = (char)((ushort)uVar5 >> 8);
  uVar11 = (0xf - (uint)*(byte *)(DAT_00204874 + 0x16)) * (int)((short *)DAT_00204874)[5];
  uVar8 = (int)uVar11 >> 0x1f;
  iVar12 = (uVar11 ^ uVar8) - uVar8;
  *(char *)((char *)DAT_00204874 + 0x29) = (char)((uint)(iVar12 * 0x10000) >> 0x10);
  *(char *)(DAT_00204874 + 0x2a) = (char)((uint)iVar12 >> 8);
  sVar10 = ((short *)DAT_00204874)[5];
  pbVar1 = (byte *)(DAT_00204874 + 0x16);
  *(char *)(DAT_00204874 + 10) = (char)((uint)*pbVar1 * (int)sVar10);
  *(char *)((char *)DAT_00204874 + 0xb) = (char)((uint)*pbVar1 * (int)sVar10 >> 8);
  psVar9 = (short *)DAT_00204874;
  if (*(byte *)(DAT_00204874 + 0x16) == 0) {
    sVar10 = 0;
  }
  else {
    sVar10 = ((short *)DAT_00204874)[10];
    sVar6 = ordint_divmod(0x1e,(0xf - (uint)*(byte *)(DAT_00204874 + 0x16)) * (int)sVar10).quot;
    sVar10 = sVar10 - sVar6;
  }
  *(char *)(psVar9 + 10) = (char)sVar10;
  *(char *)((char *)DAT_00204874 + 0x15) = (char)((ushort)sVar10 >> 8);
  if ((0 < sVar4) || (0x8c < ((short *)DAT_00204874)[5])) goto LAB_0005a33c;
  *(undefined1 *)(DAT_00204874 + 10) = 0;
  *(undefined1 *)((char *)DAT_00204874 + 0xb) = 0;
  *(undefined1 *)(DAT_00204874 + 0x10) = 0;
  *(undefined1 *)((char *)DAT_00204874 + 0x11) = 0;
  if (DAT_00086998 == -1) {
    if ((int)((uint)DAT_002049d0 + (uint)DAT_002049d8) < (int)*(short *)((char *)g_sweep_foot_pos + 4)) {
      puVar7 = (ushort *)get_object_record_by_slot_index((int)*(short *)((char *)DAT_00204874 + 0x23));
      if ((((uw_object_hdr_t *)puVar7)->object_id & 0x1c0) != 0x40) goto LAB_0005a238;
      if ((DAT_002049d6 & 0x10) == 0) {
        if ((DAT_002049d6 & 0x20) == 0) goto LAB_0005a2d0;
        uVar3 = 4;
      }
      else {
        uVar3 = 2;
      }
    }
    else {
      uVar3 = (undefined1)(1 << ((int)(short)DAT_002049d4 & 3U));
    }
    *(undefined1 *)(DAT_00204874 + 0x28) = uVar3;
  }
  else {
    psVar9 = (short *)get_object_record_by_slot_index(*(ushort *)(&DAT_00202c3a + DAT_00086998 * 6) >> 6);
    if (((g_object_type_props[((int)*psVar9 & 0x1ffU)].flags & 2) != 0) ||
        (puVar7 = (ushort *)get_object_record_by_slot_index((int)*(short *)((char *)DAT_00204874 + 0x23)),
         (((uw_object_hdr_t *)puVar7)->object_id & 0x1c0) == 0x40)) {
LAB_0005a2d0:
      *(undefined1 *)(DAT_00204874 + 0x28) = 1;
      goto LAB_0005a33c;
    }
LAB_0005a238:
    sweep_apply_knockback();
  }
LAB_0005a33c:
  sweep_restart_remaining(0);
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005a348 PHYSICS: vertical integrator -- applies gravity/climb to the swept foot Z
// (g_sweep_foot_pos[2]) and resolves floor + ceiling contact.
int sweep_step_vertical(int unused, short step)
{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  short sVar4;
  uint uVar5;
  int iVar6;

  iVar2 = (int)step;
  if ((int)DAT_00086996 < (int)((uint)(iVar2 == -1) + (int)DAT_00086990)) {
    // PHYSICS: gravity -- accelerate the vertical velocity by _DAT_000869a1*32 per
    // sub-step; sign follows the current velocity (downward when falling/resting)
    iVar6 = _DAT_000869a1 * 0x20;
    if (DAT_0008698a * iVar2 < 1) {
      iVar6 = _DAT_000869a1 * -0x20;
    }
  }
  else {
    // PHYSICS: final partial sub-step -- vertical displacement from the current
    // velocity, scaled by the horizontal distance covered (DAT_00086992)
    iVar6 = (int)DAT_0008698a;
    if (DAT_00086992 == 0) {
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0x7ff;
      }
      iVar6 = (iVar6 >> 0xb) * (int)_DAT_000869a1 * iVar2 * 0x40;
    }
    else {
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0x7ff;
      }
      iVar6 = (iVar6 >> 0xb) * (int)_DAT_000869a1 * (int)DAT_00086992 * iVar2;
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0xff;
      }
      iVar6 = iVar6 >> 8;
    }
  }
  uVar3 = iVar6 + (short)DAT_00086984;
  if ((int)uVar3 < 0) {
    iVar6 = (uVar3 ^ (int)uVar3 >> 0x1f) - ((int)uVar3 >> 0x1f);
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0x7ff;
    }
    sVar4 = -1 - (short)(iVar6 >> 0xb);
  }
  else {
    uVar5 = uVar3;
    if ((int)uVar3 < 0) {
      uVar5 = uVar3 + 0x7ff;
    }
    sVar4 = (short)((int)uVar5 >> 0xb);
  }
  DAT_00086984 = (ushort)(uVar3 * 0x10000 >> 0x10) & 0x7ff;
  if (iVar2 == -1) {
    // PHYSICS: revert path -- just back the foot Z out by the computed delta
    *(short *)((char *)g_sweep_foot_pos + 4) = *(short *)((char *)g_sweep_foot_pos + 4) + sVar4;
  }
  else {
    iVar2 = (int)sVar4;
    if (iVar2 < 1) {
      if (-1 < iVar2) goto LAB_0005a4ac;
      *(undefined1 *)(DAT_00204874 + 0x28) = 0x10;
      // PHYSICS: floor collision -- falling; if this step would drop the foot
      // below the target floor height, stop and snap to it (sweep_land_on_surface)
      iVar2 = iVar2 + *(short *)((char *)g_sweep_foot_pos + 4);
      if (iVar2 < _DAT_0008699b) goto LAB_0005a4f8;
    }
    else {
      *(undefined1 *)(DAT_00204874 + 0x28) = 0x10;
      // PHYSICS: ceiling collision -- rising; if this step would push the foot
      // above the target height, stop and snap to it
      iVar2 = iVar2 + *(short *)((char *)g_sweep_foot_pos + 4);
      if (_DAT_0008699b < iVar2) {
LAB_0005a4f8:
        sweep_land_on_surface();
        return 0;
      }
    }
    // PHYSICS: no surface hit this step -- commit the new foot Z
    *(short *)((char *)g_sweep_foot_pos + 4) = (short)iVar2;
  }
LAB_0005a4ac:
  // PHYSICS: after the vertical step, run the horizontal sub-tile integrator for the same direction
  uVar1 = sweep_integrate_substep(0,step);
  return uVar1;
}



// was FUN_0005a550 -- advance the sweep one step (param_1==-1 commits the move)
int sweep_step(int step_command)
{
  bool bVar1;
  undefined1 uVar2;
  undefined4 uVar3;
  
  bVar1 = false;
  if ((short)step_command == -1) {
    collision_height_envelope(0,0);
    reticle_object_pick(0);
    *(undefined1 *)(DAT_00204874 + 0x28) = DAT_002049c0;
    if (DAT_00204870 != 0) {
      bVar1 = true;
    }
  }
  else {
    DAT_002049bc = DAT_002049bc + -1;
  }
  if (*(short *)(DAT_00204874 + 10) == 0) {
    // PHYSICS: no vertical motion this step -> integrate the horizontal sub-tile move only
    uVar3 = sweep_integrate_substep(0,step_command);
  }
  else {
    /* PHYSICS: vertical motion active (falling / climbing a slope) -> run the gravity +
       floor/ceiling integrator. */
    uVar3 = sweep_step_vertical(0,step_command);
  }
  if (bVar1) {
    /* Was `sweep_collision_flags();` with its return discarded, then
       `collision_flags_to_locomotion_code()` called with no argument -- the same dropped- argument
       pattern fixed in sweep_apply_collision just below (see its comment)... */
    ushort uVar4 = sweep_collision_flags();
    DAT_002049c0 = *(undefined1 *)(DAT_00204874 + 0x28);
    uVar2 = collision_flags_to_locomotion_code(uVar4);
    *(undefined1 *)(DAT_00204874 + 0x28) = uVar2;
  }
  return uVar3;
}




// was FUN_0005ad18 -- act on sweep_collision_flags (stop/slide/step the move)
void sweep_apply_collision()
{
  undefined1 uVar1;
  int iVar2;
  bool bVar3;
  ushort local_14 [2];
  
  // PHYSICS: collide this sub-step and act on the result flags
  local_14[0] = sweep_collision_flags();
  DAT_002049c0 = *(undefined1 *)(DAT_00204874 + 0x28);
  /* Was `collision_flags_to_locomotion_code()` with no argument, relying on local_14[0] still
     sitting in the same register collision_flags_to_locomotion_code's declared `short param_1`
     reads it from -- undefined behavior, latent since this line predates any work this session. */
  uVar1 = collision_flags_to_locomotion_code(local_14[0]);
  *(undefined1 *)(DAT_00204874 + 0x28) = uVar1;
  /* Debug noclip: the player ignores wall/object/step blocking. The map border (0x8000) still
     stops the move. */
  if (g_debug_noclip && DAT_00204874 == (char *)&DAT_00204880 && (local_14[0] & 0x8000) == 0) {
    return;
  }
  if ((local_14[0] & 0xc000) == 0) {
    local_14[0] = local_14[0] & ~*(ushort *)DAT_002048bc;
    if (local_14[0] == 0) {
      return;
    }
    /* This branch used to call through a function pointer read via generic offset arithmetic on
       DAT_002048bc (`*(void**))`... */
    {
      int (*_cb)(ushort *) = (int (*)(ushort *))0;
      if (DAT_002048bc == (char *)&DAT_00204980) _cb = DAT_00204988;
      else if (DAT_002048bc == (char *)&DAT_00204990) _cb = DAT_00204998;
      else if (DAT_002048bc == (char *)&DAT_002049a0) _cb = DAT_002049a8;
      else if (DAT_002048bc == (char *)&DAT_002049b0) _cb = DAT_002049b8;
      if (((local_14[0] & *(ushort *)(DAT_002048bc + 2)) == 0) ||
         (_cb == (int (*)(ushort *))0) || (iVar2 = (*_cb)(local_14), iVar2 == 0)) {
      // PHYSICS: wall collision -- 0x700 bits mean "hit an angled/solid face":
      // slide the move along it (sweep_slide_along_wall) instead of stopping dead.
      /* The original mask includes raised faces (0x100), not just rock and object walls (0x600). A
         height flag is a horizontal obstruction only while the footprint floor is above the foot;
         airborne baseline flags must not roll back an otherwise unobstructed vertical jump. */
      bVar3 = ((local_14[0] & 0x600) != 0) ||
              (((local_14[0] & 0x100) != 0) &&
               (g_sweep_foot_pos[2] < (short)DAT_002049d9));
      if (bVar3) {
        sweep_slide_along_wall((local_14[0] & 0x400) == 0);
      }
      // PHYSICS: wall collision -- 0x1000 = fully blocked: end the sub-tile sweep
      if ((local_14[0] & 0x1000) == 0) {
        return;
      }
      if (*(short *)(DAT_00204874 + 0x10) != 0) {
        return;
      }
      // PHYSICS: wall collision -- arm the vertical path (DAT_00204874+0x10) and
      // hand off to sweep_restart_remaining to finish/redirect the blocked move
      *(undefined1 *)(DAT_00204874 + 0x10) = 0xfc;
      *(undefined1 *)(DAT_00204874 + 0x11) = 0xff;
      sweep_restart_remaining(bVar3);
      return;
    }
    }
    // PHYSICS: soft block resolved -- back the sub-step out (sweep_step(-1))
    sweep_step(0xffffffff);
  }
  else {
    // PHYSICS: hard block (0xc000) -- revert the sub-step and, on 0x4000, kill velocity
    sweep_step(0xffffffff);
    if ((local_14[0] & 0x4000) != 0) {
      sweep_kill_velocity();
      return;
    }
  }
  DAT_00086996 = DAT_00086990 + 1;
}




/* Fixed turn-rate accelerator value for decode_movement_command's turn branches -- see that
   function's own comment for why turning was decoupled from DAT_0024af6c (the held-key ramp, still
   used as-is for forward/back). */
int uw_turn_rate_accel(void) {
  return g_opts.turn_accel;
}

/* Port, DOS style (do_player_keyboard): turn the held movement keys into the forward rate
   DAT_0023bf48, turn rate DAT_0023bf4c and movement mode, without going through the pending-key
   slot. Turning wins over the single-direction moves; forward and a turn combine into a diagonal. */
static void decode_held_movement_keys(void)
{
  ushort held = g_held_move_keys;
  int turning = 0;
  int forward = (held & (HELD_MOVE_RUN | HELD_MOVE_WALK)) != 0;
  int walk_slow;
  int accel;

  if ((held & HELD_MOVE_LEFT) && !(held & HELD_MOVE_RIGHT)) {
    turning = -1;
  }
  else if ((held & HELD_MOVE_RIGHT) && !(held & HELD_MOVE_LEFT)) {
    turning = 1;
  }
  /* S walks: pin the accelerator below the step clamp so it is a genuine slow walk. */
  walk_slow = (held & HELD_MOVE_WALK) && (turning != 0 || !(held & HELD_MOVE_RUN));
  accel = walk_slow ? (int)g_opts.walk_accel : (int)DAT_0024af6c;

  if (turning != 0) {
    if (forward) {
      DAT_0023bf48 = ordint_divmod(100,(int)((long long)accel * 0x500000 >> 0x10)).quot;
    }
    DAT_0023bf4c = ordint_divmod(100,(int)((long long)uw_turn_rate_accel() *
                                           (turning < 0 ? -0x5a0000 : 0x5a0000) >> 0x10)).quot;
    g_movement_mode = 1;
  }
  else if (forward) {
    DAT_0023bf48 = ordint_divmod(100,(int)((long long)accel * 0x500000 >> 0x10)).quot;
    g_movement_mode = 1;
  }
  else if (held & HELD_MOVE_BACK) {
    g_movement_mode = 8;
  }
  else if ((held & HELD_MOVE_STRAFE_LEFT) && !(held & HELD_MOVE_STRAFE_RIGHT)) {
    g_movement_mode = 9;
  }
  else if ((held & HELD_MOVE_STRAFE_RIGHT) && !(held & HELD_MOVE_STRAFE_LEFT)) {
    g_movement_mode = 10;
  }
}

// was FUN_000685e8 -- turn the latched input code (DAT_0023c448) into the analog forward rate
// DAT_0023bf48 / turn rate DAT_0023bf4c.
void decode_movement_command()
{
  DAT_0023bf48 = 0;
  DAT_0023bf4c = 0;
  if ((*DAT_00087950 != '\0') || (*DAT_0008794c != '\0')) {
    if (*DAT_00087950 == '\0') {
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (*DAT_0008794c == '\0') {
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
  }
  if (*DAT_00087948 != '\0') {
    DAT_0023bf48 = 0;
    DAT_0023bf4c = 0;
    return;
  }
  if (*DAT_00087944 != '\0') {
    DAT_0023bf48 = 0;
    DAT_0023bf4c = 0;
    return;
  }
  if (g_held_move_keys != 0) {
    decode_held_movement_keys();
    return;
  }
  if (DAT_0023c448 < 0x2f) {
    if (DAT_0023c448 == 0x2e) {
      g_movement_mode = 10;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (DAT_0023c448 < 0x20) {
      if (DAT_0023c448 == 0x1f) {
LAB_000687cc:
        DAT_0023bf48 = ordint_divmod(100,(int)((long long)DAT_0024af6c * 0x500000 >> 0x10)).quot;
        g_movement_mode = 1;
        return;
      }
      if (DAT_0023c448 == 0x10) goto LAB_00068820;
      if (DAT_0023c448 != 0x11) {
        if (DAT_0023c448 != 0x12) {
          if (DAT_0023c448 != 0x1e) {
            DAT_0023bf48 = 0;
            DAT_0023bf4c = 0;
            return;
          }
LAB_000686a8:
          DAT_0023bf4c = ordint_divmod(100,(int)((long long)uw_turn_rate_accel() * -0x5a0000 >> 0x10)).quot;
          g_movement_mode = 1;
          return;
        }
        goto LAB_000687fc;
      }
LAB_00068844:
      DAT_0023bf48 = ordint_divmod(100,(int)((long long)DAT_0024af6c * 0x700000 >> 0x10)).quot;
      g_movement_mode = 1;
      return;
    }
    if (DAT_0023c448 != 0x20) {
      if (DAT_0023c448 == 0x2c) {
        g_movement_mode = 9;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      if (DAT_0023c448 == 0x2d) {
        g_movement_mode = 8;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
  }
  else {
    if (DAT_0023c448 == 0x3f) goto LAB_00068844;
    if (DAT_0023c448 == 0x6b) {
LAB_00068820:
      if ((DAT_0020208c & 0x14) == 0) {
        g_movement_mode = 0;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      g_movement_mode = 0xd;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (DAT_0023c448 == 0x6c) {
LAB_000687fc:
      if ((DAT_0020208c & 0x14) == 0) {
        g_movement_mode = 0;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      g_movement_mode = 0xc;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (DAT_0023c448 == 0x8d) goto LAB_000687cc;
    if (DAT_0023c448 == 0x8f) goto LAB_000686a8;
    if (DAT_0023c448 != 0x91) {
      if (DAT_0023c448 == 0x93) {
        g_movement_mode = 8;
        DAT_0023bf48 = 0;
        DAT_0023bf4c = 0;
        return;
      }
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
  }
  DAT_0023bf4c = ordint_divmod(100,(int)((long long)uw_turn_rate_accel() * 0x5a0000 >> 0x10)).quot;
  g_movement_mode = 1;
}



// was FUN_000689a0
void movement_pacing_handler()
{
  byte bVar1;
  byte bVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  undefined8 uVar7;
  uint uVar_now;

  /* The original reads read_realtime_clock_units() four times. The port uses the latest GX
     elapsed-time sample in the same 4ms-per-unit scale (see g_uw_frame_clock_units). */
  uVar_now = uw_frame_clock_ms();
  iVar3 = uVar_now;
  uVar6 = iVar3 - DAT_0023bf54;
  if (uVar6 < 0x41) {
    uVar5 = uVar_now;
    DAT_0023bf58 = ((char)(uVar5 >> 4) - (char)(DAT_0023bf54 >> 4)) + DAT_0023bf58;
    uVar7 = uVar_now;
    uVar5 = (uint)((ulonglong)uVar7 >> 0x20);
    uVar4 = ((uint)uVar7 >> 6) - (DAT_0023bf54 >> 6) & 0xff;
    if (uVar6 == 0) {
      return;
    }
  }
  else {
    uVar6 = 0x40;
    DAT_0023bf58 = DAT_0023bf58 + 4;
    uVar4 = 1;
    uVar5 = DAT_0023bf54;
  }
  if (uVar4 != 0) {
    uVar5 = DAT_000879ac;
  }
  if (uVar4 != 0 && uVar5 != 0) {
    scheduler_tick(uVar4);
  }
  iVar3 = *(int *)(DAT_00086df8 + 0xce) + uVar6;
  *(char *)(DAT_00086df8 + 0xce) = (char)iVar3;
  *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar3 >> 8);
  *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar3 >> 0x10);
  *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar3 >> 0x18);
  DAT_0023bf54 = uVar_now;
  if (DAT_002020d4 == 0) {
    bVar2 = 0;
  }
  else {
    bVar2 = DAT_0023bf58 & 1;
    DAT_0023bf58 = DAT_0023bf58 >> 1;
  }
  bVar1 = DAT_0023bf58;
  DAT_0023bf58 = bVar2;
  movement_tick(uVar6 & 0xffff,bVar1,0);
}



// was FUN_00068ad4
void movement_tick(int elapsed, int tick_flags, int skip_npc_tick)
{
  short sVar1;
  uint uVar2;
  uint iVar3;
  undefined4 uVar4;
  ushort uVar5;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  undefined4 unaff_r6;
  undefined4 unaff_r7;
  undefined4 unaff_lr;
  undefined1 uVar6;
  undefined8 uVar7;
  
  DAT_0023bea8 = 0;
  DAT_0023be98 = 0;
  DAT_0023bf18 = (char)elapsed + DAT_0023bf18;
  if (g_movement_mode == 0) {
    decode_movement_command();
  }
  if ((((((g_movement_mode != 0) || (g_jump_ascent_timer != 0)) || (g_vertical_velocity != 0)) ||
       ((g_fall_accel != 0 || (DAT_0020488e != 0)))) || ((DAT_0020488c != 0 || (DAT_000858a0 != 0)))
      ) && (skip_npc_tick == 0)) {
    apply_movement_tick(elapsed);
  }
  if (((g_npc_tick_enabled != 0) && (DAT_002020d0 == 0)) && ((short)tick_flags != 0)) {
    tick_mobile_objects(tick_flags);
  }
  if (*(char *)(DAT_00086df8 + 0xb8) != '\0') {
    trigger_view_transition();
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0) {
    if (DAT_00086e84 != -1) {
      stop_movement_sound_handle();
      DAT_00086e84 = -1;
    }
    if (((*(byte *)(DAT_00086df8 + 0xb8) & 8) == 0) && ((DAT_002048a8 & 0x10) == 0)) {
      if (skip_npc_tick == 0) {
        if (g_jump_ascent_timer != 0) {
          uVar7 = read_realtime_clock_units();
          uVar4 = (undefined4)((ulonglong)uVar7 >> 0x20);
          if (DAT_0023bf5c < (uint)uVar7) {
            uVar6 = DAT_0023bf60 != '\0';
            if ((bool)uVar6) {
              uVar4 = 0x48;
            }
            if (!(bool)uVar6) {
              uVar4 = 0x38;
              uVar6 = 2;
            }
            play_sound_effect_with_pan(uVar6,uVar4,((int)g_jump_ascent_timer >> 5 & 0xffU) - 0x10);
            DAT_0023bf60 = DAT_0023bf60 == '\0';
            sVar1 = ordint_divmod(((int)g_jump_ascent_timer >> 2) + 1,6000).quot;
            uVar5 = sVar1 + 0x40;
            if (200 < uVar5) {
              uVar5 = 200;
            }
            iVar3 = read_realtime_clock_units();
            DAT_0023bf5c = iVar3 + (uint)uVar5;
          }
        }
      }
      else {
        uVar6 = DAT_0023bf60 != '\0';
        /* (was `iVar3 = DAT_00086df8;` -- always overwritten just below) */
        if ((bool)uVar6) {
          iVar3 = 0x48;
        }
        uVar2 = (int)g_jump_ascent_timer >> 5 & 0xff;
        if (!(bool)uVar6) {
          iVar3 = 0x38;
          uVar6 = 2;
        }
        play_sound_effect_with_pan(uVar6,iVar3,uVar2 - 0x10);
        DAT_0023bf60 = DAT_0023bf60 == '\0';
        iVar3 = read_realtime_clock_units();
        DAT_0023bf5c = iVar3 + 100;
      }
    }
  }
  else {
    if ((DAT_00086e84 != -1) && (uVar2 = read_realtime_clock_units(), DAT_0023bf64 + 0x1800U <= uVar2)) {
      stop_movement_sound_handle();
      DAT_00086e84 = -1;
    }
    if (DAT_00086e84 == -1) {
      DAT_0023bf64 = read_realtime_clock_units();
      DAT_00086e84 = play_sound_effect_with_pan(0,0x40,0);
    }
  }
}



// was FUN_00068c1c -- forces movement to stop immediately: clears
// g_movement_mode then repeatedly ticks apply_movement_tick(0x40)
// until every pending momentum/fall/landing flag clears.
void settle_movement_to_rest()
{
  g_movement_mode = 0;
  while ((((g_jump_ascent_timer != 0 || (g_vertical_velocity != 0)) || (g_fall_accel != 0)) ||
         (((DAT_0020488e != 0 || (DAT_0020488c != 0)) || (DAT_000858a0 != 0))))) {
    apply_movement_tick(0x40);
  }
}



// was FUN_00068cac
/* Was called with no args from both call sites (movement_tick's real time-delta param_1, and
   settle_movement_to_rest's literal 0x40) -- dropped argument, same pattern as apply_heading_turn
   below (which this function itself calls with no args, same bug one level deeper). */
void apply_movement_tick(int elapsed)
{
  byte bVar1;
  char cVar2;
  char cVar3;
  short sVar4;

  DAT_002048a5 = g_object_type_props[(g_player_object->hdr.object_id)].collision_radius;
  DAT_002048a6 = g_object_type_props[(g_player_object->hdr.object_id)].height;
  DAT_0023be9e = 0;
  DAT_0023be9c = 0;
  DAT_0023be9a = 0;
  apply_heading_turn(elapsed);
  movement_collision_sweep(&DAT_00204880,&DAT_002048b0);
  commit_player_move();
  set_pending_update_flags(10);
  sVar4 = g_movement_mode;
  bVar1 = DAT_0023bf18;
  if ((DAT_002048a8 & 0x10) == 0) {
    if (((int)DAT_00202078 >> 2 < (int)g_jump_ascent_timer) && (g_movement_mode == 1)) {
      cVar2 = ordint_divmod((int)DAT_00202078 >> 1,(int)g_jump_ascent_timer << 2).quot;
      cVar3 = (char)(cVar2 + -1);
      DAT_0023bea8 = 1;
      if ((cVar2 + -1) * 0x1000000 >> 0x18 < 2) {
        cVar3 = '\x02';
      }
      DAT_0023be98 = (short)(char)(&DAT_00086e38)[bVar1 >> 4] * (short)cVar3;
    }
    if (sVar4 == 7) {
      DAT_0023be98 = -0x20;
      DAT_0023be9c = 0xff00;
      sVar4 = 0;
      DAT_0023bea8 = 1;
    }
    if ((sVar4 == 9) || (sVar4 == 10)) {
      DAT_0023bea8 = 1;
      DAT_0023be98 = (short)(char)(&DAT_00086e48)[bVar1 >> 4] << 1;
    }
  }
  g_movement_mode = 0;
}



// was FUN_0002b63c -- initializes 4 collision-response snapshot buffers (DAT_00204980/990/9a0/9b0)
// and their respective callback slots...
void init_collision_response_profiles()
{
  /* The snapshot buffers (DAT_002048c0/f0/204920/950) and the four collision-response profiles
     (DAT_00204980/990/9a0/9b0) are real contiguous structs, but Ghidra split every field into its
     own global and the sizing pass then gave each split-off field its own separate storage -- so
     the writes below used to land in dead variables and the structs npc_ai_tick actually hands to
     the sweep stayed all zero. For NPCs that meant no response masks at all: nothing stopped land
     walkers entering water (and the like) and swimmers never stayed in it. Write the fields into
     the real buffers (offsets confirmed against ARM 0x2b63c). */
#define SNAPSHOT_FIELD16(buffer, offset) (*(ushort *)((char *)(buffer) + (offset)))
#define SNAPSHOT_FIELD8(buffer, offset) (*((byte *)(buffer) + (offset)))
  SNAPSHOT_FIELD16(DAT_002048c0_backing, 0xc) = 0;
  SNAPSHOT_FIELD16(DAT_002048c0_backing, 0xe) = 0;
  SNAPSHOT_FIELD8(DAT_002048c0_backing, 0x17) = 0x80;
  SNAPSHOT_FIELD16(DAT_002048f0_backing, 0xc) = 0;
  SNAPSHOT_FIELD16(DAT_002048f0_backing, 0xe) = 0;
  SNAPSHOT_FIELD8(DAT_002048f0_backing, 0x17) = 0x80;
  SNAPSHOT_FIELD16(DAT_00204920_backing, 0xc) = 0;
  SNAPSHOT_FIELD16(DAT_00204920_backing, 0xe) = 0;
  SNAPSHOT_FIELD8(DAT_00204920_backing, 0x17) = 0;
  SNAPSHOT_FIELD16(DAT_00204950_backing, 0xc) = 0;
  SNAPSHOT_FIELD16(DAT_00204950_backing, 0xe) = 0;
  SNAPSHOT_FIELD8(DAT_00204950_backing, 0x17) = 0x80;

  /* Profile layout: +0 ignored flags, +2 response-callback trigger flags, +4 blocking flags,
     +6 line-of-sight flags; the callback pointer is kept in the separate DAT_002049x8 variables. */
  SNAPSHOT_FIELD16(DAT_00204980_backing, 0) = 0;
  SNAPSHOT_FIELD16(DAT_00204980_backing, 2) = 0x1f30;
  SNAPSHOT_FIELD16(DAT_00204980_backing, 4) = 0x1010;
  SNAPSHOT_FIELD16(DAT_00204980_backing, 6) = 0x20;
  DAT_00204988 = collision_response_default;
  SNAPSHOT_FIELD16(DAT_00204990_backing, 0) = 0x1000;
  SNAPSHOT_FIELD16(DAT_00204990_backing, 2) = 0x700;
  SNAPSHOT_FIELD16(DAT_00204990_backing, 4) = 0x80;
  SNAPSHOT_FIELD16(DAT_00204990_backing, 6) = 0;
  DAT_00204998 = collision_response_alt_locomotion;
  SNAPSHOT_FIELD16(DAT_002049a0_backing, 0) = 0;
  SNAPSHOT_FIELD16(DAT_002049a0_backing, 2) = 0;
  SNAPSHOT_FIELD16(DAT_002049a0_backing, 4) = 0;
  SNAPSHOT_FIELD16(DAT_002049a0_backing, 6) = 0;
  DAT_002049a8 = collision_response_mobile_object;
  SNAPSHOT_FIELD16(DAT_002049b0_backing, 0) = 0x10;
  SNAPSHOT_FIELD16(DAT_002049b0_backing, 2) = 0x1728;
  SNAPSHOT_FIELD16(DAT_002049b0_backing, 4) = 0x10a8;
  SNAPSHOT_FIELD16(DAT_002049b0_backing, 6) = 0;
  DAT_002049b8 = collision_response_other_locomotion;
#undef SNAPSHOT_FIELD16
#undef SNAPSHOT_FIELD8
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* HACK: same ushort-vs-byte pointer-scaling bug as the rest of this NPC-AI cluster this session
   (see [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is `ushort *`, so every bare
   `DAT_0010190c + N` here was scaling N by 2. */
// was FUN_0002b960 -- the default collision-response callback (slot 0, DAT_00204988), used by
// npc_ai_tick for monsters whose stat template doesn't set either of the alt-locomotion flag bits.
int collision_response_default(ushort *object)
{
  ushort uVar1;
  undefined4 *puVar2;
  char *iVar3;
  undefined4 uVar4;
  uint uVar5;
  
  uVar1 = *object;
  if ((uVar1 & 0x1000) != 0) {
    if (DAT_002048d0 == 0) {
      DAT_002048d0 = -4;
    }
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;
    DAT_00101924 = 1;
    uVar4 = 0;
    puVar2 = &DAT_00101734;
LAB_0002bb2c:
    *puVar2 = uVar4;
    return 0;
  }
  if ((uVar1 & 0x10) != 0) {
    if ((uVar1 & 0xf8) == 0x10) {
      DAT_00101924 = 1;
      DAT_00101734 = 0;
      spawn_scheduled_effect_object(DAT_0010190c,6,3,0,0,(short)(char)((ushort)DAT_002048c0 >> 8),
                   (short)(char)((ushort)_DAT_002048c2 >> 8));
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xcc | 0xc;
      uVar5 = DAT_0010190c->goal_word & 0xfff;
      DAT_0010190c->goal_word_low = (byte)(char)uVar5;
      DAT_0010190c->goal_word_high = (byte)(uVar5 >> 8) | 0x30;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;
      return 1;
    }
    if ((DAT_0010190c->animation_flags & 0x80) == 0) {
      DAT_00101924 = 1;
      DAT_002048c6 = 0;
      DAT_002048c8 = 0;
      return 1;
    }
  }
  if ((((uVar1 & 0x800) != 0) && ((DAT_00101414 & 0x800) == 0)) ||
     (((uVar1 & 0x20) != 0 && ((DAT_00101414 & 0x20) == 0)))) {
    if ((DAT_0010190c->animation_flags & 0x80) == 0) {
      DAT_00101924 = 1;
      DAT_002048c6 = 0;
      DAT_002048c8 = 0;
      return 1;
    }
    return 0;
  }
  if ((uVar1 & 0x300) != 0) {
    puVar2 = &DAT_00101924;
    uVar4 = 1;
    goto LAB_0002bb2c;
  }
  if ((uVar1 & 0x400) != 0) {
    iVar3 = find_nearby_door_in_candidates(&DAT_00101424,&DAT_00101428);
    if (iVar3 != 0) {
      DAT_00101560 = 1;
      DAT_00101924 = 1;
      DAT_001013fc = 1;
      DAT_00101904 = iVar3;
      goto LAB_0002bbc4;
    }
    DAT_00101924 = 1;
    DAT_001013fc = 1;
    DAT_00101904 = get_first_nearby_candidate_object();
  }
  if (DAT_00101924 == 0) {
    return 0;
  }
LAB_0002bbc4:
  if (DAT_00101734 != 0) {
    return 1;
  }
  return 0;
}



// was FUN_0002bbec -- the "alt locomotion" collision-response callback
// (slot 1, DAT_00204998), used by npc_ai_tick for monsters whose stat
// template sets flag bit 0x80.
int collision_response_alt_locomotion(ushort *object)
{
  DAT_00101734 = 1;
  if ((*object & 0x200) == 0) {
    if ((*object & 0x100) != 0) {
      DAT_002048fa = 0x80;
      DAT_0010191c = 1;
    }
    if ((*object & 0x400) != 0) {
      DAT_00101924 = 1;
      DAT_001013fc = 1;
      DAT_00101904 = get_first_nearby_candidate_object();
    }
    if ((DAT_00101924 != 0) && (DAT_00101734 != 0)) {
      return 1;
    }
  }
  else {
    DAT_00101924 = 1;
  }
  return 0;
}



// was FUN_0002bc9c -- the "other locomotion" collision-response callback
// (slot 3, DAT_002049b8), used by npc_ai_tick for monsters whose stat
// template sets flag bit 0x40 (and neither bit is 0x80).
int collision_response_other_locomotion(ushort *object)
{
  if ((*object & 0x300) == 0) {
    if ((*object & 0x400) != 0) {
      DAT_00204958 = 0;
      DAT_00204956 = 0;
      DAT_00101924 = 1;
      DAT_001013fc = 1;
      DAT_00101904 = get_first_nearby_candidate_object();
    }
    if ((*object & 8) != 0) {
      DAT_00204958 = 0;
      DAT_00204956 = 0;
      DAT_00101924 = 1;
    }
    if ((DAT_00101924 != 0) && (DAT_00101734 != 0)) {
      return 1;
    }
  }
  else {
    DAT_00204958 = 0;
    DAT_00204956 = 0;
    DAT_00101924 = 1;
  }
  return 0;
}


// was FUN_0002c8e0 -- checks whether movement is blocked stepping from tile (param_3,param_4) to
// adjacent tile (param_5,param_6): tests the per-tile-type wall/door bitmask (&DAT_000878d0,
// indexed by each tile's own type nibble) for a wall on the shared edge in either direction...
int can_step_between_tiles(byte ignore_x, byte ignore_y, byte from_x, byte from_y, byte to_x, byte to_y, byte step_height)
{
  byte bVar1;
  byte *pbVar2;
  ushort *puVar3;
  uint uVar4;
  uint uVar5;
  
  pbVar2 = (byte *)tilemap_lookup(from_x,from_y);
  puVar3 = (ushort *)tilemap_lookup(to_x,to_y);
  uVar5 = *pbVar2 & 0xf;
  uVar4 = *puVar3 & 0xf;
  if ((ignore_x == 0) || ((ignore_x == from_x && (ignore_y == from_y)))) {
    if ((from_x < to_x) && (((&DAT_000878d0)[uVar4] & 2) != 0)) {
      return 0;
    }
    if ((to_x < from_x) && (((&DAT_000878d0)[uVar4] & 4) != 0)) {
      return 0;
    }
    if ((from_y < to_y) && (((&DAT_000878d0)[uVar4] & 8) != 0)) {
      return 0;
    }
    if ((to_y < from_y) && (((&DAT_000878d0)[uVar4] & 0x10) != 0)) {
      return 0;
    }
    if (to_x <= from_x) goto LAB_0002caa4;
    bVar1 = (&DAT_000878d0)[uVar5];
  }
  else {
    if (to_x == 0) {
      return 1;
    }
    if ((from_x < to_x) && (((&DAT_000878d0)[uVar4] & 2) != 0)) {
      return 0;
    }
    if ((to_x < from_x) && (((&DAT_000878d0)[uVar4] & 4) != 0)) {
      return 0;
    }
    if ((from_y < to_y) && (((&DAT_000878d0)[uVar4] & 8) != 0)) {
      return 0;
    }
    if ((to_y < from_y) && (((&DAT_000878d0)[uVar4] & 0x10) != 0)) {
      return 0;
    }
    if (to_x <= from_x) goto LAB_0002caa4;
    bVar1 = (&DAT_000878d0)[uVar5];
  }
  if ((bVar1 & 4) != 0) {
    return 0;
  }
LAB_0002caa4:
  if ((((from_x <= to_x) || (((&DAT_000878d0)[uVar5] & 2) == 0)) &&
      ((to_y <= from_y || (((&DAT_000878d0)[uVar5] & 0x10) == 0)))) &&
     ((from_y <= to_y || (((&DAT_000878d0)[uVar5] & 8) == 0)))) {
    if ((*puVar3 >> 1 & 0x78) <= (step_height & 0xfff8)) {
      return 1;
    }
    return 0;
  }
  return 0;
}


// was FUN_0005aea0 -- scans the nearby collision-candidate list (DAT_002049dd count, base
// DAT_002049de) for a door object (type 0x140-0x147), writing relative tile-offset deltas
// (param_1,param_2) for each candidate as it scans and returning the door object...
void *find_nearby_door_in_candidates(byte *out_dx, byte *out_dy)
{
  ushort uVar1;
  ushort *puVar2;
  uint uVar3;
  void *uVar4;
  int iVar5;
  int iVar6;
  
  iVar6 = 0;
  if (DAT_002049dd != 0) {
    do {
      puVar2 = (ushort *)resolve_object_link(&DAT_00202c3a + (iVar6 + DAT_002049de) * 6);
      uVar1 = ((uw_object_hdr_t *)puVar2)->type_flags;
      uVar3 = (uint)(byte)(&DAT_00202c3c)[(iVar6 + DAT_002049de) * 6] +
              ((int)DAT_002049c8 >> 3 & 0xffU) & 0x3f;
      *out_dx = (char)uVar3;
      iVar5 = (int)*(short *)(&DAT_00202c3c + (iVar6 + DAT_002049de) * 6) -
              ((int)((uVar3 - (((int)DAT_002049c8 << 0x10) >> 0x13)) * 0x10000) >> 0x10);
      if (iVar5 < 0) {
        iVar5 = iVar5 + 0x3f;
      }
      *out_dy = (char)(iVar5 >> 6) + (char)(DAT_002049ca >> 3) & 0x3f;
      if (((uVar1 & 0x1f0) == 0x140) && ((uVar1 & 0xf) < 8)) {
        uVar4 = resolve_object_link(&DAT_00202c3a + ((int)DAT_002049de + (int)(short)iVar6) * 6);
        return uVar4;
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < (int)(uint)DAT_002049dd);
  }
  return 0;
}



// was FUN_0005b010 -- returns the first entry of the nearby collision-candidate list
// (DAT_002049de), or 0 if the list (DAT_002049dd) is empty.
void *get_first_nearby_candidate_object()
{
  void *uVar1;

  if (DAT_002049dd == '\0') {
    uVar1 = 0;
  }
  else {
    uVar1 = resolve_object_link(&DAT_00202c3a + DAT_002049de * 6);
  }
  return uVar1;
}


// was FUN_0003ce04
void apply_heading_turn(int turn_amount)
{
  uint uVar1;
  uint uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_18 [2];
  
  local_18[0] = 0;
  if ((g_fall_accel == 0) && (resolve_move_vector((int)g_movement_mode,turn_amount,local_18), g_fall_accel == 0))
  {
    iVar5 = (int)local_18[0] - (int)g_jump_ascent_timer;
    uVar1 = iVar5 * 0x10000 >> 0x10;
    uVar2 = iVar5 * 0x10000 >> 0x1f;
    if ((int)DAT_00085890 < (int)((uVar1 ^ uVar2) - uVar2)) {
      sVar4 = 1;
      if ((int)uVar1 < 1) {
        sVar4 = -1;
      }
      iVar5 = (int)sVar4 * (int)DAT_00085890;
    }
    iVar5 = g_jump_ascent_timer + iVar5;
    iVar3 = iVar5 * 0x10000 >> 0x10;
    g_jump_ascent_timer = DAT_00202078;
    if ((iVar3 <= DAT_00202078) && (g_jump_ascent_timer = (short)iVar5, iVar3 < 0)) {
      g_jump_ascent_timer = 0;
    }
  }
  if (g_fall_accel != 0) {
    iVar5 = (int)DAT_0023bf4c;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 3;
    }
    iVar5 = (iVar5 >> 2) * (int)DAT_00086e68 * (int)(short)turn_amount;
    if (iVar5 < 0) {
      iVar5 = iVar5 + 3;
    }
    DAT_00201c70 = DAT_00201c70 + (short)(iVar5 >> 2);
  }
  DAT_00204892 = (short)turn_amount;
  DAT_00204896 = 5;
  DAT_00204897 = 0;
  if ((g_fall_accel == 0 && DAT_0020488e == 0) && DAT_0020488c == 0) {
    DAT_00204897 = 0x80;
  }
  sVar4 = DAT_00201c70;
  if (g_jump_ascent_timer != 0) {
    sVar4 = DAT_00201c78;
  }
  DAT_00201c78 = sVar4;
  DAT_002048a1 = (char)DAT_00201c78;
  DAT_002048a2 = (char)((ushort)DAT_00201c78 >> 8);
  DAT_002048b0 = 0;
  if ((DAT_0020208c & 0x14) != 0) {
    DAT_002048b0 = 0x1000;
    DAT_00204897 = 0x80;
  }
  DAT_002048a9 = 0;
  DAT_002048aa = 0;
}


// was FUN_00051320 -- classify the blocked-corner shape of the current wall hit (from the
// DAT_00202bfb corner-flag table) and pick which of the 8 candidate octant headings in DAT_000869a8
// to deflect toward, writing the choice into DAT_00202c6c[0x12].
void resolve_wall_slide_corner()
{
  int uw_ord2005_rem_115 = 0;
  char cVar1;
  byte bVar2;
  int iVar3;
  byte bVar4;
  int extraout_r1;
  short sVar5;
  int iVar6;
  char *rec;
  int iVar7;
  uint uVar8;
  int iVar9;
  short local_28;
  char local_25;
  
  iVar3 = 0;
  sVar5 = 0;
  local_28 = 0;
  iVar7 = 0;
  iVar6 = 0;
  local_25 = '\0';
  iVar9 = 0;
  do {
    if ((*(ushort *)(&DAT_00202bfb + iVar3 * 5) & 0xf8) == 0) {
      iVar9 = ((int)(char)(&DAT_00086884)[iVar3] + (int)(char)iVar9) * 0x1000000 >> 0x18;
      local_25 = (&DAT_00086884)[iVar3 - 1U & 3] + local_25;
      local_28 = local_28 + 1;
    }
    if ((*(ushort *)(&DAT_00202bfb + iVar3 * 5) & 0x300) != 0) {
      sVar5 = sVar5 + 1;
      iVar6 = ((int)(char)(&DAT_00086884)[iVar3] + (int)(char)iVar6) * 0x1000000 >> 0x18;
      iVar7 = ((int)(char)(&DAT_00086884)[iVar3 - 1U & 3] + (int)(char)iVar7) * 0x1000000 >> 0x18;
    }
    iVar3 = (iVar3 + 1) * 0x1000000 >> 0x18;
  } while (iVar3 < 4);
  iVar3 = (int)sVar5;
  if (iVar3 == 0) {
    *(undefined1 *)(DAT_00202c6c + 0x12) = 9;
    rec = DAT_00202c6c;
    goto switchD_000514e0_default;
  }
  iVar6 = ordint_divmod(iVar3,(int)(char)iVar6).quot;
  iVar7 = ordint_divmod(iVar3,(int)(char)iVar7).quot;
  *(undefined *)(DAT_00202c6c + 0x12) = (&DAT_0008688c)[(int)(iVar6) * 3 + iVar7];
  rec = DAT_00202c6c;
  if (iVar3 != 1) goto switchD_000514e0_default;
  bVar2 = *(byte *)(DAT_00202c6c + 0x12);
  uVar8 = (uint)bVar2;
  uw_ord2005_rem_115 = ((int)(uVar8)) % (2);
  if ((uw_ord2005_rem_115 == 0) || (DAT_00202c14 == 0)) goto switchD_000514e0_default;
  switch((uint)(*(byte *)(rec + 7) >> 5) - (1 - uVar8 & 0xff) & 7) {
  case 0:
    break;
  case 1:
    break;
  case 2:
    goto LAB_00051524;
  case 3:
LAB_00051524:
    cVar1 = '\x01';
LAB_000515d8:
    *(byte *)(rec + 0x12) = bVar2 + cVar1 & 7;
    rec = DAT_00202c6c;
    goto switchD_000514e0_default;
  case 4:
    goto LAB_0005152c;
  case 5:
LAB_0005152c:
    uVar8 = (int)(uVar8 - 1) >> 1 & 0xff;
    *(byte *)(rec + 0x12) = bVar2 - 1;
    bVar2 = DAT_00202bf9;
    bVar4 = DAT_00202bfa;
    if (uVar8 != 0) {
      if (uVar8 == 1) {
        bVar4 = 8 - DAT_00202bff;
        bVar2 = DAT_00202bfe;
      }
      else {
        bVar2 = DAT_00202c04;
        bVar4 = DAT_00202c03;
        if (uVar8 != 2) {
          if (uVar8 == 3) {
            bVar2 = 8 - DAT_00202c08;
            bVar4 = DAT_00202c09;
          }
          else {
            bVar2 = (byte)local_28;
            bVar4 = (byte)local_28;
          }
        }
      }
    }
    if (bVar2 < bVar4) {
      *(byte *)(DAT_00202c6c + 0x12) = *(char *)(DAT_00202c6c + 0x12) + 2U & 7;
    }
    rec = DAT_00202c6c;
    if (bVar2 == bVar4) {
      *(char *)(DAT_00202c6c + 0x12) = *(char *)(DAT_00202c6c + 0x12) + '\x01';
      rec = DAT_00202c6c;
    }
    goto switchD_000514e0_default;
  case 6:
    goto LAB_000515d4;
  case 7:
LAB_000515d4:
    cVar1 = -1;
    goto LAB_000515d8;
  default:
    goto switchD_000514e0_default;
  }
  *(undefined1 *)(rec + 0x12) = 9;
  rec = DAT_00202c6c;
switchD_000514e0_default:
  iVar7 = (int)local_28;
  if (iVar7 == 1 || iVar7 == 2) {
    iVar9 = ordint_divmod(iVar7,(int)(char)iVar9).quot;
    iVar7 = ordint_divmod(iVar7,(int)local_25).quot;
    *(undefined *)(rec + 0x13) = (&DAT_0008688c)[iVar9 * -3 - iVar7];
  }
  else {
    *(undefined1 *)(rec + 0x13) = 9;
  }
}


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0005a6bc -- compute blocked/step-up flags for the sweep's current sub-position
uint sweep_collision_flags()
{
  ushort uVar1;
  bool bVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  bool bVar8;
  ushort local_3c;
  
  bVar2 = false;
  bVar7 = (*(ushort *)(DAT_002048bc + 4) & 0x80) == 0;
  uVar1 = *(ushort *)DAT_002048bc;
  DAT_00204870 = 0;
  if (tilemap_lookup((short)((int)g_sweep_foot_pos[0] >> 3),(short)((int)g_sweep_foot_pos[1] >> 3)) ==
      (void *)0x0) {
    /* stepped outside the 64x64 map -- the border is always solid; report a
       hard block so sweep_apply_collision backs the move out. (Also stops
       collision_build_height_field dereferencing a NULL tile pointer.) */
    return 0xffff8000;
  }
  collision_build_height_field(*(undefined1 *)(DAT_00204874 + 0x27));
  collision_height_envelope(0,0);
  reticle_object_pick(0);
  local_3c = DAT_002049d6 | DAT_002049d4;
  /* ARM 0x5a758..0x5a774 reads the geometry mask as a short at +4. */
  bVar8 = (local_3c & *(ushort *)(DAT_002048bc + 4)) == 0;
  if ((DAT_002049dc != '\0') &&
     (iVar6 = (int)DAT_002049de, iVar6 < (int)((uint)DAT_002049dd + (int)DAT_002049de))) {
    do {
      uVar3 = resolve_collision_candidate_interaction(iVar6,(int)DAT_002049d2);
      if ((uVar3 & 4) != 0) {
        local_3c = local_3c | 0x400;
      }
      if ((uVar3 & 0x18) != 0) {
        if ((uVar3 & 0x10) == 0) {
          return (int)(short)local_3c | 0xffff8000;
        }
        return (int)(short)local_3c | 0x4000;
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < (int)((uint)DAT_002049dd + (int)DAT_002049de));
  }
  // PHYSICS: floor collision -- compare the foot Z against the destination
  // tile's floor height _DAT_0008699b to decide level / step-up / step-down / fall
  iVar4 = (int)*(short *)((char *)g_sweep_foot_pos + 4);
  iVar6 = (int)_DAT_0008699b;
  iVar5 = (int)DAT_00086998;
  if (iVar4 == iVar6) {
    if (((iVar5 != -1) && ((g_object_type_props[_DAT_00086999].flags & 2) == 2)) && (bVar7)) {
      local_3c = local_3c & 0xfffb | 0x80;
    }
  }
  else {
    if ((iVar5 == -1) && (bVar8)) {
// PHYSICS: floor step -- if the height change is within the step limit (byte 0x27), OR the
      // tile is a walkable auto-stick floor (DAT_002049d4 & 4) and no vertical motion is active,
      // snap straight to it instead of falling.
      uVar3 = (iVar4 - iVar6) >> 0x1f;
      /* The "within step limit" clause below was unconditional -- unlike the auto-stick clause
         right next to it, which correctly requires g_vertical_velocity==0 (offset 0xa, "no vertical
         motion is active" per the comment above) before snapping. */
      if ((*(short *)(DAT_00204874 + 0x10) == 0 &&
           (int)((iVar4 - iVar6 ^ uVar3) - uVar3) <= (int)(uint)*(byte *)(DAT_00204874 + 0x27)) ||
         (((((*(short *)(DAT_00204874 + 10) == 0 && ((DAT_002049d6 & 0x800) == 0)) &&
            ((DAT_002049d4 & 4) != 0)) &&
           (iVar4 - iVar6 <= (int)(uint)*(byte *)(DAT_00204874 + 0x27)))))) {
LAB_0005a970:
        if ((DAT_00204878 != 0) && ((uVar1 & 0x1000) == 0)) {
          bVar2 = true;
          if (CONCAT11(DAT_000869a0,DAT_0008699f) <= iVar6) {
            local_3c = local_3c & 0xfeff;
          }
          // PHYSICS: ceiling clearance -- target floor + player height (byte 0x26)
          // must fit under the ceiling clearance value; if not, treat as a wall
          iVar6 = iVar6 + (uint)*(byte *)(DAT_00204874 + 0x26);
          if (iVar6 < 0x80) {
            if ((iVar5 != -1) || (iVar6 <= CONCAT11(DAT_000869a0,DAT_0008699f))) {
              if ((((local_3c & 0x400) != 0) || (iVar5 == -1)) ||
                 (((g_object_type_props[_DAT_00086999].flags & 2) != 0 && (bVar7)))) {
                DAT_00204870 = 1;
                // PHYSICS: floor collision -- step resolved: snap the foot Z onto
                // this tile's floor in a single tick (no gravity for small steps)
                *(short *)((char *)g_sweep_foot_pos + 4) = _DAT_0008699b;
                uVar3 = (int)((int)_DAT_0008699b - (uint)DAT_002049d8) >> 0x1f;
                if ((int)(uint)*(byte *)(DAT_00204874 + 0x25) <
                    (int)(((int)_DAT_0008699b - (uint)DAT_002049d8 ^ uVar3) - uVar3)) {
                  local_3c = local_3c & 0xfffb;
                }
                else {
                  local_3c = local_3c | 4;
                }
              }
              else {
                bVar2 = false;
              }
              goto LAB_0005ab5c;
            }
            local_3c = local_3c | 0x400;
          }
          else {
            local_3c = local_3c | 0x200;
          }
          DAT_00204870 = 1;
          goto LAB_0005abe4;
        }
      }
    }
    else if ((bVar7) &&
            (((g_object_type_props[_DAT_00086999].flags & 2) == 2 &&
              (uVar3 = (int)(iVar4 - (uint)(byte)(&DAT_00202c38)[iVar5 * 6]) >> 0x1f,
               (int)((iVar4 - (uint)(byte)(&DAT_00202c38)[iVar5 * 6] ^ uVar3) - uVar3) <=
               (int)(uint)*(byte *)(DAT_00204874 + 0x27))))) {
      local_3c = local_3c | 0x80;
      goto LAB_0005a970;
    }
    bVar2 = false;
    if (iVar4 < (int)(uint)DAT_002049d9) {
      local_3c = local_3c | 0x100;
    }
  }
LAB_0005ab5c:
  if ((DAT_00204870 != 0) && (bVar2)) {
    sort_collision_candidates();
    local_3c = local_3c & 0xfbff;
    if (DAT_002049dd != 0) {
      iVar6 = 0;
      do {
        uVar3 = resolve_collision_candidate_interaction(iVar6,(int)DAT_002049d2);
        if ((uVar3 & 4) != 0) {
          local_3c = local_3c | 0x400;
        }
        iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
      } while (iVar6 < (int)(uint)DAT_002049dd);
    }
  }
LAB_0005abe4:
  if ((((local_3c & 0x80) != 0) && (bVar7)) &&
     ((((&DAT_00202c3a)[DAT_00086998 * 6] & 0x10) != 0 || ((DAT_002049d4 & 4) != 0)))) {
    local_3c = local_3c & 0xf7ff;
  }
  uVar1 = local_3c;
  // PHYSICS: no-feature fallback snap -- pull the foot down onto the flat floor
  // when there is no slope/step feature. Also suppressed once a gravity fall is
  // armed (+0x10) so the fall integrator owns the descent.
  if ((((((DAT_002049d6 & 0x100) != 0) && (bVar8)) && (*(short *)(DAT_00204874 + 10) == 0)) &&
      (*(short *)(DAT_00204874 + 0x10) == 0)) &&
     ((int)(uint)DAT_002049d9 <=
      (int)((uint)*(byte *)(DAT_00204874 + 0x27) + (int)*(short *)((char *)g_sweep_foot_pos + 4)))) {
    *(ushort *)((char *)g_sweep_foot_pos + 4) = (ushort)DAT_002049d9;
    uVar1 = local_3c & 0xfeff | 4;
    if (*(ushort *)((char *)g_sweep_foot_pos + 4) != (ushort)DAT_002049d8) {
      uVar1 = local_3c & 0xfefb;
    }
  }
  local_3c = uVar1;
  // PHYSICS: wall collision -- no floor/step bit resolved this move: mark it
  // blocked (0x1000) so sweep_apply_collision stops the horizontal advance
  if ((local_3c & 0xfc) == 0) {
    local_3c = local_3c | 0x1000;
  }
  // PHYSICS: wall collision -- also blocked if the foot sits far enough above
  // this tile's floor that it is a wall face, not a step
  if (((local_3c & 0x80) == 0) &&
     ((int)(uint)DAT_002049d9 <
      (int)((int)*(short *)((char *)g_sweep_foot_pos + 4) - (uint)*(byte *)(DAT_00204874 + 0x25)))) {
    local_3c = local_3c | 0x1000;
  }
  return (int)(short)local_3c;
}


// small locomotion-state code (1/2/4/8/0x10/0x20) set_locomotion_state reads from the movement
// block's +0x28 byte to pick walk/swim/fly/fall animation and physics.
// was FUN_0005a630
uint collision_flags_to_locomotion_code(short collision_mask)
{
  uint uVar1;
  
  uVar1 = (uint)collision_mask;
  if ((uVar1 & 0x1000) == 0) {
    if ((uVar1 & 4) == 0) {
      if ((uVar1 & 0x88) == 0) {
        if ((uVar1 & 0x10) == 0) {
          if ((uVar1 & 0x20) == 0) {
            uVar1 = 8;
          }
          else {
            uVar1 = 4;
          }
        }
        else {
          uVar1 = 2;
        }
      }
      else {
        uVar1 = 1;
      }
    }
    else if (((DAT_002049d2 == 1) && ((uVar1 & 3) == 1)) && ((uVar1 & 0x68) != 0)) {
      uVar1 = 0x20;
    }
    else {
      uVar1 = 1 << (uVar1 & 3) & 0xff;
    }
  }
  else {
    uVar1 = 0x10;
  }
  return uVar1;
}


// was LAB_0002bbe4 -- the "mobile object" collision-response callback (slot 2, DAT_002049a8), used
// by mobile_object_tick for generic mobile/projectile objects.
int collision_response_mobile_object(ushort *collision_flags)
{
  (void)collision_flags;
  return 0;
}


// was FUN_0003d8e4. Stored into DAT_002048b8 (a movement-state callback slot) right alongside the
// rest of the jump/fall fields' reset in set_player_tile_position and the game-init player setup --
// always with param_1 = the player object.
int check_and_reset_landing_state(ushort *object)
{
  undefined4 uVar2;
  if ((((*object & 0x1000) == 0) || (g_vertical_velocity != 0)) ||
     (DAT_00202078 * 3 <= g_jump_ascent_timer * 10)) {
    uVar2 = 0;
  }
  else {
    DAT_00204888 = 0;
    DAT_00204886 = 0;
    uVar2 = 1;
  }
  return uVar2;
}


/* Return the most recent GX clock sample for this movement dispatch. */
unsigned int uw_frame_clock_ms() {
  return g_uw_frame_clock_units;
}

/* Collision geometry: per-object height field build, placement collision sweep, corner flags, and
   the height envelope query used by movement/pathing. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/collision.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* Sizing pass: this is one of 4 interchangeable object-placement snapshot buffers (siblings
   DAT_002048c0/002048f0/00204950 in movement.c/ai.c) that build_object_placement_snapshot and
   sync_object_tile_position fill/read... */
undefined DAT_00204920_backing[128];
short DAT_00202c68;
short DAT_00202c30;
/* Sizing pass: `ce_memset(&DAT_00202c70,0x11,0x12)` -- 18 bytes exact. */
static undefined1 DAT_00202c70_backing[64];
#define DAT_00202c70 DAT_00202c70_backing[0]
#define DAT_00202c78 (*(unsigned short *)(DAT_00202c70_backing + 8))
static ushort *_DAT_00202c34;
static char DAT_00202c20;
static char DAT_00202c28;
static char DAT_00202c24;
static char DAT_00202c2c;
static char DAT_00202c18;
static char DAT_00202c1c;






// was FUN_0002b7a0. Builds the collision_build_height_field scratch buffer (DAT_00202c6c, a local
// 24-byte struct) for param_1, then returns a combined height/step-limit field.
int build_collision_height_field_for_object(uw_unaligned_word_t *object)
{
  uw_object_hdr_t *record = (uw_object_hdr_t *)object; /* same record, typed for the object API */
  undefined2 slot_index;
  int field;
  undefined1 height_scratch [24];
  
  DAT_00202c6c = height_scratch;
  slot_index = encode_object_slot_index(record);
  DAT_00202c6c[10] = (char)slot_index;
  DAT_00202c6c[0xb] = (char)((ushort)slot_index >> 8);
  DAT_00202c6c[8] = g_object_type_props[(record->object_id)].collision_radius;
  DAT_00202c6c[9] = g_object_type_props[(record->object_id)].height;
  field = ((((uw_mobile_object_t *)object)->tile_x << 3)) + (uint)(record->xpos);
  *DAT_00202c6c = (char)field;
  DAT_00202c6c[1] = (char)((uint)field >> 8);
  field = (record->ypos) + ((((uw_mobile_object_t *)object)->tile_y << 3));
  DAT_00202c6c[2] = (char)field;
  DAT_00202c6c[3] = (char)((uint)field >> 8);
  DAT_00202c6c[4] = record->zpos;
  DAT_00202c6c[5] = 0;
  collision_build_height_field(8);
  return (int)(short)(*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc));
}




// was FUN_0002bd70. Writes a small field into the object-placement
// snapshot buffer (param_1, one of DAT_00204920/DAT_0010172c's chosen
// targets) then runs movement_collision_sweep.
/* Second argument was previously left undeclared, relying on it still sitting in the same ABI
   register (r1) at the tail call to movement_collision_sweep() -- a K&R "dropped-argument" idiom
   already seen (and fixed) elsewhere this session (tile_is_no_magic). */
int apply_placement_collision_sweep(void *snapshot, void *sweep_flags)
{
  /* snapshot was `int`, truncating the real 64-bit pointers callers pass (&DAT_00204920, and
     DAT_0010172c after its own fix above) -- same class of bug as DAT_0010172c's own fix. */
  /* HACK: same ushort-vs-byte pointer-scaling bug as the rest of this NPC-AI cluster this session
     (see [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is `ushort *`... */
  *(char *)(snapshot + 0x12) = (char)(((DAT_0010190c->attack_pitch & 7) << 0x14) >> 0x10);
  /* HACK: not original behaviour -- with --physics-fps a non-NPC mobile object integrates the finer
     tick it is stepped at (speed class * subtick clock units) instead of speed class * 16. */
  if ((DAT_0010190c->hdr.object_id & 0x1c0) != 0x40 && physics_subtick_units() != 0) {
    *(char *)(snapshot + 0x12) = (char)((DAT_0010190c->attack_pitch & 7) * physics_subtick_units());
  }
  *(undefined1 *)(snapshot + 0x13) = 0;
  movement_collision_sweep(snapshot,sweep_flags);
  return 1;
}




// was FUN_00050c18 -- per-corner slope/blocked flag word from the packed tile height DAT_00202c78
bool collision_corner_flags(uint step_limit)
{
  undefined2 flags_word;
  undefined1 sampled_height;
  uint sampled_height_wide;
  ushort corner_flags;
  uint sample_blocked;
  
  *(byte *)(DAT_00202c6c + 0xc) = (byte)(DAT_00202c78 >> 8) & 3;
  *(undefined1 *)(DAT_00202c6c + 0xd) = 0;
  sampled_height = collision_sample_floor_height(4,&sample_blocked);
  *(undefined1 *)(DAT_00202c6c + 0x10) = sampled_height;
  sampled_height_wide = (uint)*(byte *)(DAT_00202c6c + 0x10);
  if (sampled_height_wide == 0x80) {
    corner_flags = *(ushort *)(DAT_00202c6c + 0xc) | 0x200;
  }
  else if ((int)((step_limit & 0xff) + (int)*(short *)(DAT_00202c6c + 4)) < (int)sampled_height_wide) {
    corner_flags = *(ushort *)(DAT_00202c6c + 0xc) | 0x100;
  }
  else {
    corner_flags = *(ushort *)(DAT_00202c6c + 0xc);
    if ((int)sampled_height_wide < (int)((int)*(short *)(DAT_00202c6c + 4) - (step_limit & 0xff))) {
      corner_flags = corner_flags | 0x800;
    }
    else {
      *(byte *)(DAT_00202c6c + 0xc) = (byte)corner_flags | 4;
      *(char *)(DAT_00202c6c + 0xd) = (char)(corner_flags >> 8);
      corner_flags = *(ushort *)(DAT_00202c6c + 0xc) | (ushort)(8 << ((int)(short)DAT_00202c78 >> 8 & 3U));
    }
  }
  *(char *)(DAT_00202c6c + 0xc) = (char)corner_flags;
  *(char *)(DAT_00202c6c + 0xd) = (char)(corner_flags >> 8);
  if (5 < (DAT_00202c78 & 0xf)) {
    flags_word = *(undefined2 *)(DAT_00202c6c + 0xc);
    *(char *)(DAT_00202c6c + 0xc) = (char)flags_word;
    *(byte *)(DAT_00202c6c + 0xd) = (byte)((ushort)flags_word >> 8) | 0x20;
  }
  return sample_blocked == 0;
}


// was FUN_00050d78 -- build the per-corner tile height field the sweep collides against
void collision_build_height_field(uint step_limit)
{
  byte *flags_ptr;
  ushort *tile_ptr;
  ushort tile_word;
  short x_offset;
  int wall_blocked;
  uint neighbor_index;
  int corner;
  uint corner_shape;
  int probe;
  undefined1 *corner_record;
  byte corner_a;
  byte corner_b;
  byte corner_c;
  byte corner_d;
  short y_offset;
  bool differs;
  byte unused_scratch [128];
  byte neighbor_masks [8];
  
  ce_memset(&DAT_00202c70,0x11,0x12);
  corner_record = &DAT_00202bf8;
  corner = 5;
  do {
    corner_record[3] = 0;
    corner = corner + -1;
    corner_record[4] = 0;
    corner_record = corner_record + 5;
  } while (corner != 0);
  _DAT_00202c34 =
       (ushort *)
       tilemap_lookup((int)*(short *)DAT_00202c6c >> 3,(int)*(short *)(DAT_00202c6c + 2) >> 3);
  /* off-map tile -- this function derefs _DAT_00202c34 below and assumes a
     valid record; the sweep collision-revert path can reach here out of
     bounds. */
  if (_DAT_00202c34 == (ushort *)0x0) {
    return;
  }
  corner_a = 4;
  corner_b = *DAT_00202c6c;
  corner_c = DAT_00202c6c[2];
  DAT_00202c0c = 4;
  DAT_00202c0d = (undefined1)(corner_b & 7);
  DAT_00202c0e = (undefined1)(corner_c & 7);
  if (DAT_00202c78 == 0x1111) {
    tile_word = *_DAT_00202c34;
    DAT_00202c78 = (tile_word & 0xf) +
                   (((&DAT_0023ae40)[tile_word >> 10 & 0xf] & 0xff) + (tile_word >> 4 & 0xf)) * 0x10;
  }
  collision_corner_flags(step_limit);
  flags_ptr = DAT_00202c6c + 0xc;
  DAT_00202c6c[0xe] = (byte)*(undefined2 *)flags_ptr;
  DAT_00202c6c[0xf] = (byte)((ushort)*(undefined2 *)flags_ptr >> 8);
  DAT_00202c6c[0x11] = DAT_00202c6c[0x10];
  tile_ptr = _DAT_00202c34;
  tile_word = (ushort)DAT_00202c6c[8];
  if (tile_word != 0) {
    for (y_offset = (corner_c & 7) - tile_word; y_offset < 0; y_offset = y_offset + 8) {
      corner_a = corner_a - 3;
    }
    for (x_offset = (corner_b & 7) - tile_word; x_offset < 0; x_offset = x_offset + 8) {
      corner_a = corner_a - 1;
    }
    DAT_00202bfa = (undefined1)y_offset;
    DAT_00202bf9 = (undefined1)x_offset;
    corner_b = corner_a;
    for (x_offset = x_offset + (ushort)DAT_00202c6c[8] * 2; 7 < x_offset; x_offset = x_offset + -8) {
      corner_b = corner_b + 1;
    }
    DAT_00202bfe = (undefined1)x_offset;
    corner_c = corner_b;
    for (y_offset = y_offset + (ushort)DAT_00202c6c[8] * 2; 7 < y_offset; y_offset = y_offset + -8) {
      corner_c = corner_c + 3;
    }
    DAT_00202c04 = (undefined1)y_offset;
    corner_d = corner_c;
    for (x_offset = x_offset + (ushort)DAT_00202c6c[8] * -2; x_offset < 0; x_offset = x_offset + 8) {
      corner_d = corner_d - 1;
    }
    DAT_00202c08 = (undefined1)x_offset;
    DAT_00202bf8 = corner_a;
    DAT_00202bfd = corner_b;
    DAT_00202bff = DAT_00202bfa;
    DAT_00202c02 = corner_c;
    DAT_00202c03 = DAT_00202bfe;
    DAT_00202c07 = corner_d;
    DAT_00202c09 = DAT_00202c04;
    if (*(short *)(&DAT_00202c70 + (uint)corner_a * 2) == 0x1111) {
      tile_word = collision_neighbor_shade_or_zero(_DAT_00202c34, corner_a);
      *(ushort *)(&DAT_00202c70 + (uint)corner_a * 2) =
           (tile_word & 0xf) + (((&DAT_0023ae40)[tile_word >> 10 & 0xf] & 0xff) + (tile_word >> 4 & 0xf)) * 0x10
      ;
    }
    if (*(short *)(&DAT_00202c70 + (uint)corner_b * 2) == 0x1111) {
      tile_word = collision_neighbor_shade_or_zero(tile_ptr, corner_b);
      *(ushort *)(&DAT_00202c70 + (uint)corner_b * 2) =
           (tile_word & 0xf) + (((&DAT_0023ae40)[tile_word >> 10 & 0xf] & 0xff) + (tile_word >> 4 & 0xf)) * 0x10
      ;
    }
    if (*(short *)(&DAT_00202c70 + (uint)corner_c * 2) == 0x1111) {
      tile_word = collision_neighbor_shade_or_zero(tile_ptr, corner_c);
      *(ushort *)(&DAT_00202c70 + (uint)corner_c * 2) =
           (tile_word & 0xf) + (((&DAT_0023ae40)[tile_word >> 10 & 0xf] & 0xff) + (tile_word >> 4 & 0xf)) * 0x10
      ;
    }
    if (*(short *)(&DAT_00202c70 + (uint)corner_d * 2) == 0x1111) {
      tile_word = collision_neighbor_shade_or_zero(tile_ptr, corner_d);
      *(ushort *)(&DAT_00202c70 + (uint)corner_d * 2) =
           (tile_word & 0xf) + (((&DAT_0023ae40)[tile_word >> 10 & 0xf] & 0xff) + (tile_word >> 4 & 0xf)) * 0x10
      ;
    }
    DAT_00202c14 = 1;
    corner = 0;
    do {
      wall_blocked = collision_classify_corner_wall(corner,step_limit & 0xff);
      if (wall_blocked == 0) {
        wall_blocked = corner * 5;
        if (((&DAT_00202bfc)[wall_blocked] & 3) == 0) {
          neighbor_masks[1] = 0x10;
          neighbor_masks[2] = 2;
          neighbor_masks[3] = 8;
          neighbor_masks[0] = 4;
          probe = 0;
          neighbor_masks[4] = 4;
          do {
            flags_ptr = DAT_00202c6c;
            neighbor_index = (uint)(char)probe;
            corner_shape = (uint)(&DAT_00202bf8)[wall_blocked];
            differs = (&DAT_00202bf8)[(corner + neighbor_index * -2 + 1 & 3) * 5] != corner_shape;
            if (differs) {
              neighbor_index = (uint)neighbor_masks[neighbor_index + corner];
              corner_shape = (uint)(byte)(&DAT_000878d0)[(int)*(short *)(&DAT_00202c70 + corner_shape * 2) & 0xf];
            }
            if (differs && (neighbor_index & corner_shape) != 0) {
              (&DAT_00202bfb)[wall_blocked] = 0;
              (&DAT_00202bfc)[wall_blocked] = 2;
              flags_ptr[0x11] = 0x80;
              probe = 2;
            }
            probe = probe + 1;
          } while (probe * 0x1000000 >> 0x18 < 2);
          DAT_00202c14 = 0;
        }
      }
      tile_word = *(ushort *)(DAT_00202c6c + 0xe) | DAT_00202c0a | _DAT_00202c05 | _DAT_00202c00 |
              _DAT_00202bfb;
      DAT_00202c6c[0xe] = (byte)tile_word;
      DAT_00202c6c[0xf] = (byte)(tile_word >> 8);
      corner = (corner + 1) * 0x1000000 >> 0x18;
    } while (corner < 4);
  }
}




// was FUN_000518c0 -- reduce the height field to floor/ceiling envelope + block flags
void collision_height_envelope(int mode, int collision)
{
  char cVar1;
  int iVar2;
  ushort uVar3;
  byte bVar4;
  char *iVar5;  /* was int -- holds the void* tilemap_lookup returns (a real 64-bit tile-array pointer); truncated
   to 32 bits it made `*(ushort *)(iVar5 + ...)` a wild deref -- the crash the first time a keyboard
   forward step actually dispatched. */
  ushort *puVar6;
  ushort *puVar7;
  short sVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  byte *pbVar13;
  int iVar14;
  int local_3c;
  
  local_3c = 0;
  int _px = (int)*(short *)DAT_00202c6c >> 3;
  int _py = (int)*(short *)(DAT_00202c6c + 2) >> 3;
  iVar5 = tilemap_lookup(_px, _py);
  /* off-map tile (DAT_00202c6c position outside 0..63): this function assumes a valid tile record
     and derefs iVar5 + offsets below. The sweep's collision revert path (sweep_step(-1)) can reach
     here with an out-of- bounds position. */
  if (iVar5 == 0) {
    return;
  }
  if (*(short *)(DAT_00202c6c + 10) != 0) {
    /* Ghidra dropped get_object_record_by_slot_index's argument -- it's the object-slot id this
       branch just tested non-zero (classic `if ((id=..)!=0) rec=f(id)`)... */
    puVar6 = (uw_unaligned_word_t *)get_object_record_by_slot_index((int)*(short *)(DAT_00202c6c + 10));
    if (puVar6 != (ushort *)0x0 && (*puVar6 & 0x1c0) == 0x40) {
      local_3c = 1;
    }
    else {
      local_3c = 0;
    }
  }
  DAT_00202c6c[0x14] = 0;
  DAT_00202c18 = *DAT_00202c6c & 7;
  DAT_00202c1c = DAT_00202c6c[2] & 7;
  if ((mode == 0) || (DAT_00202c6c[9] != 0)) {
    bVar4 = DAT_00202c6c[8];
    if ((local_3c != 0) && (0 < (char)bVar4)) {
      bVar4 = (byte)((uint)(((char)bVar4 + -1) * 0x1000000) >> 0x18);
    }
  }
  else {
    bVar4 = 0;
  }
  DAT_00202c20 = (undefined1)((int)(char)DAT_00202c18 - (int)(char)bVar4);
  iVar11 = ((int)(char)bVar4 + (int)(char)DAT_00202c1c) * 0x1000000;
  iVar9 = ((int)(char)bVar4 + (int)(char)DAT_00202c18) * 0x1000000;
  iVar12 = iVar11 >> 0x18;
  iVar14 = iVar9 >> 0x18;
  DAT_00202c2c = (undefined1)((uint)iVar11 >> 0x18);
  DAT_00202c28 = (undefined1)((uint)iVar9 >> 0x18);
  DAT_00202c24 = (undefined1)((int)(char)DAT_00202c1c - (int)(char)bVar4);
  iVar11 = ((int)(char)DAT_00202c1c - (int)(char)bVar4) * 0x1000000 >> 0x18;
  iVar9 = iVar11 + -0xb;
  iVar10 = iVar14 + 4;
  if (iVar9 < 0) {
    iVar9 = iVar11 + -4;
  }
  iVar11 = iVar12 + 4;
  if (iVar10 < 0) {
    iVar10 = iVar14 + 0xb;
  }
  if (iVar11 < 0) {
    iVar11 = iVar12 + 0xb;
  }
  cVar1 = (char)(iVar9 >> 3);
  iVar9 = ((int)(char)DAT_00202c18 - (int)(char)bVar4) * 0x1000000 >> 0x18;
  iVar12 = iVar9 + -0xb;
  if (iVar12 < 0) {
    iVar12 = iVar9 + -4;
  }
  iVar9 = (int)(char)(iVar10 >> 3);
  iVar12 = (int)(char)(iVar12 >> 3);
  if (iVar12 <= iVar9) {
    iVar11 = (int)(char)(iVar11 >> 3);
    pbVar13 = DAT_00202c6c;
    do {
      iVar14 = (int)cVar1;
      if (cVar1 <= iVar11) {
        do {
          /* Was raw pointer arithmetic straight off iVar5 (the CURRENT tile's own record, from
             tilemap_lookup(_px,_py)): `iVar5 + (dx + dy*0x40)*4 + 2`... */
          void *_ntile = tilemap_lookup(_px + (char)iVar12, _py + (char)iVar14);
          iVar10 = 0;
          sVar8 = 0;
          if (_ntile == 0) {
            puVar6 = 0;
            uVar3 = 0;
          } else {
            puVar6 = (ushort *)((char *)_ntile + 2);
            uVar3 = *puVar6;
          }
          while ((uVar3 & 0xffc0) != 0) {
            sVar8 = (short)iVar10;
            if (0x3f < sVar8) break;
            if ((uint)(uVar3 >> 6) != (int)*(short *)(pbVar13 + 10)) {
              puVar7 = (uw_unaligned_word_t *)resolve_object_link(puVar6);
              /* resolve_object_link can now return NULL for an out-of-range link (see its own
                 comment) where this loop's `while ((uVar3 & 0xffc0) != 0)` condition alone used to
                 guarantee success... */
              if (puVar7 == (ushort *)0x0) break;
              iVar10 = (((uw_object_hdr_t *)puVar7)->object_id) * 0xd;
              if ((((local_3c == 0) || ((g_object_type_props[iVar10 / 0xd].flags & 4) == 0)) &&
                   ((g_object_type_props[iVar10 / 0xd].height != '\0' || ((char *)puVar7 < DAT_002046c4)))) &&
                  ((((DAT_002046c4 <= (char *)puVar7 || ((((uw_object_hdr_t *)puVar7)->object_id & 0x1c0) == 0x40)) ||
                     ((((uw_mobile_object_t *)puVar7)->animation_flags & 0x80) == 0)) &&
                    ((collision == 0 || ((g_object_type_props[iVar10 / 0xd].quality_flags & 1) != 0)))))) {
                collision_add_candidate_object(puVar7,*puVar6 >> 6,iVar12,iVar14,local_3c);
              }
            }
            /* was `iVar10 = resolve_object_link(...); puVar6 = (ushort )(iVar10 + 4);` -- iVar10 is
               `int`, truncating the real 64-bit object-record pointer resolve_object_link
               returns... */
            { intptr_t _objp = (intptr_t)resolve_object_link(puVar6);
              /* Same missing-NULL-guard bug as the first resolve_object_link call above, just on
                 the chain-advance itself instead of the per-object handling: resolve_object_link
                 can return NULL for an out-of-range link... */
              if (_objp == 0) break;
              puVar6 = (ushort *)(_objp + 4); }
            iVar2 = (sVar8 + 1) * 0x10000;
            iVar10 = iVar2 >> 0x10;
            sVar8 = (short)((uint)iVar2 >> 0x10);
            pbVar13 = DAT_00202c6c;
            uVar3 = *puVar6;
          }
          if (sVar8 == 0x40) {
            return;
          }
          iVar14 = iVar14 + 1;
        } while (iVar14 * 0x1000000 >> 0x18 <= iVar11);
      }
      iVar12 = (iVar12 + 1) * 0x1000000 >> 0x18;
    } while (iVar12 <= iVar9);
  }
}



// was FUN_00050aa8 -- computes the floor height at a specific sub-tile X/Y position
// (param_1/param_2, each 0..255 within the tile), using the tile shape's wall-type nibble
// (DAT_00202c78) and diagonal interpolation for shapes 6/7/8/9.
int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile)
{
  ushort axis_position;
  ushort tile_shape;
  int slope_offset;

  slope_offset = 0;
  tile_shape = DAT_00202c78 & 0xf;
  axis_position = y_in_tile & 0xff;
  if (tile_shape == 6) {
LAB_00050b14:
    slope_offset = (int)(short)axis_position;
  }
  else {
    if (tile_shape != 7) {
      axis_position = x_in_tile & 0xff;
      if (tile_shape == 8) goto LAB_00050b14;
      if (tile_shape != 9) goto LAB_00050b18;
    }
    slope_offset = 0xff - (short)axis_position;
  }
LAB_00050b18:
  return ((int)(short)DAT_00202c78 & 0xf0U) * 4 + (int)(short)(slope_offset >> 2);
}



// was FUN_00050b30 -- classifies one corner (param_1) of the collision height-field during
// collision_build_height_field: samples its floor height, derives a wall-type/offset code...
bool collision_classify_corner_wall(uint corner, uint step_limit)
{
  byte *scratch;
  byte floor_height;
  uint floor_height_wide;
  undefined2 wall_flags;
  int corner_offset;
  uint sample_blocked;

  floor_height = collision_sample_floor_height(corner,&sample_blocked);
  scratch = DAT_00202c6c;
  floor_height_wide = (uint)floor_height;
  if (floor_height_wide == 0x80) {
    wall_flags = 0x200;
  }
  else if ((int)((step_limit & 0xff) + (int)*(short *)(DAT_00202c6c + 4)) < (int)floor_height_wide) {
    wall_flags = 0x100;
  }
  else if ((int)floor_height_wide < (int)((int)*(short *)(DAT_00202c6c + 4) - (step_limit & 0xff))) {
    wall_flags = 0x800;
  }
  else {
    wall_flags = (undefined2)
            (8 << ((int)*(short *)(&DAT_00202c70 +
                                  (uint)(byte)(&DAT_00202bf8)[(corner & 0xff) * 5] * 2) >> 8 & 3U))
    ;
  }
  corner_offset = (corner & 0xff) * 5;
  (&DAT_00202bfb)[corner_offset] = (char)wall_flags;
  (&DAT_00202bfc)[corner_offset] = (char)((ushort)wall_flags >> 8);
  if (*(byte *)(scratch + 0x11) < floor_height_wide) {
    *(byte *)(scratch + 0x11) = floor_height;
  }
  return sample_blocked == 0;
}


// was FUN_00051658 -- appends object param_1 to the small (max 9) collision candidate list at
// DAT_00202c38 if its bounding box...
void collision_add_candidate_object(ushort *object, ushort slot_index, char tile_dx, char tile_dy, int is_raised)
{
  undefined1 uVar1;
  ushort object_word;
  uint uVar3;
  byte candidate_count;
  char cVar5;
  undefined *props_src;
  int copy_count;
  byte bVar8;
  char cVar9;
  char cVar10;
  char cVar11;
  char cVar12;
  int tile_offset;
  char *props_dst;
  bool flag;
  uw_object_type_props_t class_props;
  uint slot_value;
  
  slot_value = (uint)slot_index;
  candidate_count = *(byte *)(DAT_00202c6c + 0x14);
  if (candidate_count < 9) {
    object_word = *object;
    props_src = (byte *)&g_object_type_props[object_word & 0x1ff];
    copy_count = 0xd;
    props_dst = (char *)&class_props;
    do {
      tile_offset = copy_count + -1;
      *props_dst = *props_src;
      flag = 0 < copy_count;
      props_src = props_src + 1;
      copy_count = tile_offset;
      props_dst = props_dst + 1;
    } while (tile_offset != 0 && flag);
    if ((class_props.collision_radius) == 4) {
      cVar10 = tile_dx * '\b';
      cVar9 = tile_dy * '\b';
      cVar11 = cVar10 + '\a';
      cVar12 = cVar9 + '\a';
    }
    else {
      cVar10 = (*(byte *)((char *)object + 3) >> 5) + tile_dx * '\b';
      cVar9 = (*(byte *)((char *)object + 3) >> 2 & 7) + tile_dy * '\b';
      bVar8 = class_props.collision_radius;
      if ((((object_word & 0x1c0) == 0x40) && (bVar8 != 0)) && (is_raised != 0)) {
        bVar8 = bVar8 - 1;
      }
      cVar11 = cVar10 + bVar8;
      cVar10 = cVar10 - bVar8;
      cVar12 = cVar9 + bVar8;
      cVar9 = cVar9 - bVar8;
    }
    if (((DAT_00202c20 <= cVar11) && (cVar10 <= DAT_00202c28)) &&
       ((DAT_00202c24 <= cVar12 && (cVar9 <= DAT_00202c2c)))) {
      copy_count = (uint)candidate_count * 6;
      *(byte *)(DAT_00202c6c + 0x14) = candidate_count + 1;
      candidate_count = (byte)object[1] & 0x7f;
      (&DAT_00202c39)[copy_count] = candidate_count;
      flag = class_props.height == '\0';
      cVar5 = candidate_count + class_props.height;
      if (flag) {
        class_props.height = cVar5 + '\x01';
      }
      (&DAT_00202c38)[copy_count] = cVar5;
      if (flag) {
        (&DAT_00202c38)[copy_count] = class_props.height;
      }
      uVar3 = slot_value << 6 & 0xffff;
      (&DAT_00202c3a)[copy_count] = (byte)(slot_value << 6) | 9;
      uVar1 = (undefined1)(uVar3 >> 8);
      (&DAT_00202c3b)[copy_count] = uVar1;
      if (((cVar10 <= DAT_00202c18) && (DAT_00202c18 <= cVar11)) &&
         ((cVar9 <= DAT_00202c1c && (DAT_00202c1c <= cVar12)))) {
        (&DAT_00202c3a)[copy_count] = (byte)uVar3 | 0x19;
        (&DAT_00202c3b)[copy_count] = uVar1;
      }
      tile_offset = tile_dy * 0x40 + (int)tile_dx;
      (&DAT_00202c3c)[copy_count] = (char)tile_offset;
      (&DAT_00202c3d)[copy_count] = (char)((uint)tile_offset >> 8);
    }
  }
}


// was FUN_00051cf8 -- swaps the 6-byte collision-candidate records at index param_1 and param_1+1
// across all six parallel arrays (DAT_00202c38..3d). The swap step sort_collision_candidates' two
// insertion-sort passes call.
void swap_collision_candidates(uint index)
{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  int iVar7;
  int iVar8;
  
  iVar7 = (index & 0xff) * 6;
  uVar1 = (&DAT_00202c38)[iVar7];
  iVar8 = ((index & 0xff) + 1) * 6;
  uVar2 = (&DAT_00202c39)[iVar7];
  uVar3 = (&DAT_00202c3a)[iVar7];
  uVar4 = (&DAT_00202c3b)[iVar7];
  uVar5 = (&DAT_00202c3c)[iVar7];
  uVar6 = (&DAT_00202c3d)[iVar7];
  (&DAT_00202c38)[iVar7] = (&DAT_00202c38)[iVar8];
  (&DAT_00202c39)[iVar7] = (&DAT_00202c39)[iVar8];
  (&DAT_00202c3a)[iVar7] = (&DAT_00202c3a)[iVar8];
  (&DAT_00202c3b)[iVar7] = (&DAT_00202c3b)[iVar8];
  (&DAT_00202c3c)[iVar7] = (&DAT_00202c3c)[iVar8];
  (&DAT_00202c3d)[iVar7] = (&DAT_00202c3d)[iVar8];
  (&DAT_00202c38)[iVar8] = uVar1;
  (&DAT_00202c39)[iVar8] = uVar2;
  (&DAT_00202c3a)[iVar8] = uVar3;
  (&DAT_00202c3b)[iVar8] = uVar4;
  (&DAT_00202c3c)[iVar8] = uVar5;
  (&DAT_00202c3d)[iVar8] = uVar6;
}



// was FUN_00051dd0 -- insertion-sorts collision_add_candidate_object's candidate list (up to the
// count at DAT_00202c6c+0x14) by X position then Y position, each pass swapping out-of-order pairs
// via swap_collision_candidates...
void sort_collision_candidates()
{
  char cVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  byte *iVar5;
  int iVar6;
  int iVar7;
  
  iVar7 = 0;
  cVar1 = *(char *)(DAT_00202c6c + 9);
  uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x14);
  iVar5 = DAT_00202c6c;
  if (uVar2 != 0) {
    do {
      for (iVar3 = uVar2 - 2; iVar3 = iVar3 * 0x1000000 >> 0x18, iVar7 <= iVar3; iVar3 = iVar3 + -1)
      {
        if ((byte)(&DAT_00202c3e)[iVar3 * 6] < (byte)(&DAT_00202c38)[iVar3 * 6]) {
          /* Ghidra dropped the swap index argument: this is an insertion- sort pass over up to 255
             collision candidates, swapping the pair at iVar3/iVar3+1 when out of order. */
          swap_collision_candidates(iVar3);
          iVar5 = DAT_00202c6c;
        }
      }
      if (*(short *)(iVar5 + 4) < (short)(ushort)(byte)(&DAT_00202c38)[iVar7 * 6]) break;
      uVar2 = (uint)*(byte *)(iVar5 + 0x14);
      iVar7 = (iVar7 + 1) * 0x1000000 >> 0x18;
    } while (iVar7 < (int)uVar2);
  }
  uVar2 = (uint)*(byte *)(iVar5 + 0x14);
  iVar3 = (int)(char)iVar7;
  iVar6 = iVar3;
  if (iVar3 < (int)uVar2) {
    do {
      for (iVar4 = uVar2 - 2; iVar4 = iVar4 * 0x1000000 >> 0x18, iVar6 <= iVar4; iVar4 = iVar4 + -1)
      {
        if ((byte)(&DAT_00202c3f)[iVar4 * 6] < (byte)(&DAT_00202c39)[iVar4 * 6]) {
          /* Same dropped-argument fix as the X-axis sort pass above --
             this is the Y-axis pass, swap index is iVar4. */
          swap_collision_candidates(iVar4);
          iVar5 = DAT_00202c6c;
        }
      }
      uVar2 = (uint)*(byte *)(iVar5 + 0x14);
      iVar6 = (iVar6 + 1) * 0x1000000 >> 0x18;
    } while (iVar6 < (int)uVar2);
  }
  *(char *)(iVar5 + 0x16) = (char)iVar7;
  *(undefined1 *)(DAT_00202c6c + 0x15) = 0;
  uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x15);
  iVar7 = uVar2 + iVar3;
  if (iVar7 < (int)(uint)*(byte *)(DAT_00202c6c + 0x14)) {
    do {
      if ((int)((uint)*(byte *)(DAT_00202c6c + 9) + (int)*(short *)(DAT_00202c6c + 4) +
               (int)(cVar1 == '\0')) <= (int)(uint)(byte)(&DAT_00202c39)[iVar7 * 6]) {
        return;
      }
      *(char *)(DAT_00202c6c + 0x15) = (char)uVar2 + '\x01';
      uVar2 = (uint)*(byte *)(DAT_00202c6c + 0x15);
      iVar7 = uVar2 + iVar3;
    } while (iVar7 < (int)(uint)*(byte *)(DAT_00202c6c + 0x14));
  }
}


// was FUN_00051fa0 -- checks whether an object of catalog type param_1 could occupy tile position
// (param_3,param_4) at candidate height param_5 without being blocked by the current collision-
// candidate list...
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit)
{
  byte bVar1;
  byte *uVar2;
  undefined4 uVar3;
  uw_object_hdr_t *puVar4;
  uint uVar5;
  int iVar6;
  short sVar7;
  uint uVar8;
  /* Was 6 independent locals (local_3c/3a/38/34/33/32) with DAT_00202c6c = &local_3c, and every
     DAT_00202c6c[N] access throughout this file... */
  undefined1 local_pos_record[0x20];
#define local_3c (*(undefined2 *)(local_pos_record + 0))
#define local_3a (*(undefined2 *)(local_pos_record + 2))
#define local_38 (*(short *)(local_pos_record + 4))
#define local_34 (local_pos_record[8])
#define local_33 (local_pos_record[9])
#define local_32 (*(short *)(local_pos_record + 0xa))
  int iVar9;

  uVar2 = DAT_00202c6c;
  ce_memset(local_pos_record, 0, sizeof(local_pos_record));
  DAT_00202c6c = local_pos_record;
  local_33 = g_object_type_props[catalog_type].height;
  local_34 = g_object_type_props[catalog_type].collision_radius;
  local_38 = height;
  if ((local_33 == 0x80) || ((int)((uint)local_33 + (int)height) < 0x80)) {
    uVar8 = (uint)step_limit;
    local_3c = position_x;
    local_3a = position_y;
    local_32 = ignore_slot;
    collision_build_height_field(uVar8);
    /* HACK: every offset below this point (0xc, 0xe, 0x10, 0x14, 0x15, 0x16) was wrong --
       DAT_00202c6c is a real `byte *`... */
    if (((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
      bVar1 = *(byte *)(DAT_00202c6c + 0x11);
      if ((int)(uVar8 + (int)*(short *)(DAT_00202c6c + 4)) < (int)(uint)bVar1) {
        bVar1 = *(byte *)(DAT_00202c6c + 0x10);
      }
      DAT_00202c30 = (ushort)bVar1;
      uVar5 = (uint)*(byte *)(DAT_00202c6c + 8);
      if ((uint)(int)(short)(ushort)*(byte *)(DAT_00202c6c + 8) < uVar8) {
        uVar5 = uVar8;
      }
      if ((int)((uint)*(byte *)(DAT_00202c6c + 0x10) + (int)(short)uVar5) < (int)*(short *)(DAT_00202c6c + 4)
         ) {
        DAT_00202c68 = 0x10;
      }
      else {
        DAT_00202c68 = (short)(1 << ((int)*(short *)(DAT_00202c6c + 0xc) & 3U));
      }
      if ((DAT_00202c68 == 0x10) || (uVar3 = 1, ignore_slot < 0x100)) {
        uVar3 = 0;
      }
      collision_height_envelope(uVar3,1);
      if (*(char *)(DAT_00202c6c + 0x14) != '\0') {
        iVar9 = -1;
        sVar7 = -1;
        sort_collision_candidates();
        if (*(char *)(DAT_00202c6c + 0x15) != '\0') {
          DAT_00202c6c = uVar2;
          return 0;
        }
        if ((*(char *)(DAT_00202c6c + 0x14) != '\0') &&
           (iVar6 = 0, '\0' < *(char *)(DAT_00202c6c + 0x16))) {
          do {
            sVar7 = (short)iVar9;
            if ((short)DAT_00202c30 < (short)(ushort)(byte)(&DAT_00202c38)[iVar6 * 6]) {
              sVar7 = (short)iVar6;
              iVar9 = iVar6;
              DAT_00202c30 = (ushort)(byte)(&DAT_00202c38)[iVar6 * 6];
            }
            iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
          } while (iVar6 < *(char *)(DAT_00202c6c + 0x16));
        }
        if (-1 < sVar7) {
          puVar4 = resolve_object_link(collision_candidate_link_ptr(sVar7));
          /* Was an unguarded `*puVar4` -- resolve_object_link legitimately returns NULL when the
             candidate slot (&DAT_00202c3a + sVar7*6) has no object linked there at all... */
          if ((puVar4 != NULL) &&
             ((g_object_type_props[(puVar4->object_id)].flags & 2) == 0)) {
            DAT_00202c6c = uVar2;
            return 0;
          }
          DAT_00202c68 = 1;
        }
      }
      if ((check_mode != 0) ||
         (((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x800) == 0) ||
         ((int)((int)*(short *)(DAT_00202c6c + 4) - uVar8) <= (int)(short)DAT_00202c30)) {
        DAT_00202c6c = uVar2;
        return 1;
      }
      DAT_00202c6c = uVar2;
      return 0;
    }
  }
  DAT_00202c6c = uVar2;
  return 0;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* Recovered from UU.exe .data at 0x86878 (28 real bytes, then the "\DATA\comobj.dat" string
   literal). collision_build_height_field's four `*(char *)(bVarNN + 0x86878)` derefs are a bare
   hardcoded original- 32-bit address -- unmapped on this port... */
static const signed char DAT_00086878_arr[256] = {
  -0x41,-0x40,-0x3f,-1, 0,1,0x3f,0x40, 0x41,0,0,0, 1,-1,-1,1,
  5,4,3,6, 9,2,7,0, 1,0,0,0,
};
#define DAT_00086878_IDX(b) DAT_00086878_arr[(unsigned char)(b)]

/* collision_build_height_field looks at a NEIGHBOR tile's shade value by offsetting its own current
   tile pointer (into the tilemap, the first 0x4000 bytes of the level arena -- see uw-formats.txt)
   by a signed per-direction step from DAT_00086878_arr. */
ushort collision_neighbor_shade_or_zero(ushort *base, byte idx) {
  ptrdiff_t off = (ptrdiff_t)DAT_00086878_IDX(idx) * 2;
  ushort *p = base + off;
  if ((char *)p < DAT_002029cc || (char *)(p + 1) > DAT_002029cc + 0x4000) {
    return 0;
  }
  return *p;
}


// was FUN_00050984 -- sample the floor height at one tile corner (type 0 solid -> 0x80) PHYSICS:
// floor height source -- returns the standable height at corner param_1 of the current tile: 0x80
// (= tile top, "no floor / solid") for a rock tile, height*8 for flat floor...
uint collision_sample_floor_height(uint corner, uint *out_blocked)
{
  byte shape_byte;
  short corner_word;
  uint floor_height;
  int corner_offset;

  corner_offset = (corner & 0xff) * 5;
  corner_word = *(short *)(&DAT_00202c70 + (uint)(byte)(&DAT_00202bf8)[corner_offset] * 2);
  *out_blocked = 0;
  // PHYSICS: floor height -- (corner height nibble) * 8; refined per shape below
  floor_height = (int)corner_word >> 1 & 0x78;
  switch(*(ushort *)(&DAT_00202c70 + (uint)(byte)(&DAT_00202bf8)[corner_offset] * 2) & 0xf) {
  case 0:
    floor_height = 0x80;
    break;
  case 1:
    break;
  case 2:
    if ((byte)(&DAT_00202bf9)[corner_offset] <= (byte)(&DAT_00202bfa)[corner_offset]) {
LAB_00050a64:
      floor_height = 0x80;
    }
    goto LAB_00050a68;
  case 3:
    if (6 < (uint)(byte)(&DAT_00202bf9)[corner_offset] + (uint)(byte)(&DAT_00202bfa)[corner_offset])
    goto LAB_00050a64;
    goto LAB_00050a68;
  case 4:
    if ((uint)(byte)(&DAT_00202bf9)[corner_offset] + (uint)(byte)(&DAT_00202bfa)[corner_offset] < 8)
    goto LAB_00050a64;
    goto LAB_00050a68;
  case 5:
    if ((byte)(&DAT_00202bfa)[corner_offset] <= (byte)(&DAT_00202bf9)[corner_offset]) goto LAB_00050a64;
LAB_00050a68:
    *out_blocked = 1;
    break;
  case 6:
    shape_byte = (&DAT_00202bfa)[corner_offset];
    goto LAB_00050a88;
  case 7:
    shape_byte = (&DAT_00202bfa)[corner_offset];
    goto LAB_00050a98;
  case 8:
    shape_byte = (&DAT_00202bf9)[corner_offset];
LAB_00050a88:
    floor_height = (shape_byte & 7) + floor_height;
    break;
  case 9:
    shape_byte = (&DAT_00202bf9)[corner_offset];
LAB_00050a98:
    floor_height = (floor_height - (shape_byte & 7)) + 7;
  }
  return floor_height;
}

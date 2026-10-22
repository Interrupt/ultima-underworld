#ifndef HEADERS_COLLISION_H
#define HEADERS_COLLISION_H

/* Declarations for collision.c: collision geometry (height field
 * build, placement sweep, corner flags, height envelope). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern short DAT_00202c68;
extern short DAT_00202c30;
extern undefined DAT_00204920_backing[128];
#define DAT_00204920 DAT_00204920_backing[0]


ushort collision_neighbor_shade_or_zero(ushort *base, byte idx);
uint collision_sample_floor_height(uint corner, uint *out_blocked);
int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile);
bool collision_classify_corner_wall(uint corner, uint step_limit);
bool collision_corner_flags(uint step_limit);
void collision_build_height_field(uint step_limit);
void collision_add_candidate_object(ushort *object, ushort slot_index, char tile_dx, char tile_dy, int is_raised);
void collision_height_envelope(int mode, int collision);
void swap_collision_candidates(uint index);
void sort_collision_candidates();
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit);
int build_collision_height_field_for_object(uw_unaligned_word_t *object); // was FUN_0002b7a0
int apply_placement_collision_sweep(void *snapshot, void *sweep_flags); // was FUN_0002bd70

#endif

#ifndef HEADERS_MOVEMENT_H
#define HEADERS_MOVEMENT_H

/* Declarations for movement.c: the movement collision sweep (substep
 * integrator, wall-slide/deflect/knockback/land resolution). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern int g_npc_tick_enabled;
extern char DAT_00086e84;
extern char *DAT_0008794c;
extern undefined2 DAT_002048c0_backing[64];
extern undefined1 DAT_002048f0_backing[128], DAT_00204950_backing[128];
extern undefined DAT_00204920_backing[128];

#define DAT_00086998  (*(signed char *)(DAT_00086998_backing + 0))
#define DAT_00086999  (DAT_00086998_backing[1])
#define DAT_0008699a  (DAT_00086998_backing[2])
#define DAT_0008699b  (DAT_00086998_backing[3])
#define DAT_0008699f  (DAT_00086998_backing[7])
#define DAT_000869a0 (DAT_00086998_backing[8])
#define DAT_000869a1  (DAT_00086998_backing[9])
#define DAT_000869a2  (DAT_00086998_backing[10])
#define DAT_002049c8 (*(short *)(DAT_002049c8_backing + 0x00))
#define DAT_002049ca (*(short *)(DAT_002049c8_backing + 0x02))
#define DAT_002049cc (*(short *)(DAT_002049c8_backing + 0x04))
#define DAT_002049ce (*(undefined2 *)(DAT_002049c8_backing + 0x06))
#define DAT_002049d0 (DAT_002049c8_backing[0x08])
#define DAT_002049d1 (DAT_002049c8_backing[0x09])
#define DAT_002049d2 (*(undefined2 *)(DAT_002049c8_backing + 0x0a))
#define DAT_002049d4 (*(ushort *)(DAT_002049c8_backing + 0x0c))
#define DAT_002049d6 (*(ushort *)(DAT_002049c8_backing + 0x0e))
#define DAT_002049d8 (DAT_002049c8_backing[0x10])
#define DAT_002049d9 (DAT_002049c8_backing[0x11])
#define DAT_002049da (DAT_002049c8_backing[0x12])
#define DAT_002049dc (DAT_002049c8_backing[0x14])
#define DAT_002049dd (DAT_002049c8_backing[0x15])
#define DAT_002049de (DAT_002049c8_backing[0x16])
#define _DAT_00202bfb (*(unsigned short*)(DAT_00202bf8_backing + 0x03))
#define _DAT_00202c00 (*(unsigned short*)(DAT_00202bf8_backing + 0x08))
#define _DAT_00202c05 (*(unsigned short*)(DAT_00202bf8_backing + 0x0d))

#define DAT_002048c0 DAT_002048c0_backing[0]
extern undefined1 DAT_00204980_backing[32];
#define DAT_00204980 DAT_00204980_backing[0]
extern undefined2 DAT_00204990_backing[16];
#define DAT_00204990 DAT_00204990_backing[0]
extern undefined2 DAT_002049a0_backing[16];
#define DAT_002049a0 DAT_002049a0_backing[0]
extern undefined2 DAT_002049b0_backing[16];
#define DAT_002049b0 DAT_002049b0_backing[0]
extern undefined1 DAT_00101424;
extern undefined1 DAT_00101428_backing[4];
#define DAT_00101428 DAT_00101428_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   movement.c (the movement collision sweep) -- extern'd here so both
   translation units see the same storage. */
extern unsigned char DAT_002049c8_backing[64];
extern unsigned char DAT_00086998_backing[16];
extern short DAT_00086990;
extern char * DAT_00204874;
extern char * DAT_002048bc;
/* Globals defined in uw.c but also used by functions that now live in
   collision.c (collision geometry) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 DAT_00202bf8_backing[32];
#define DAT_00202bf8 DAT_00202bf8_backing[0]
#define DAT_00202bf9  (DAT_00202bf8_backing[0x01])
#define DAT_00202bfa  (DAT_00202bf8_backing[0x02])
#define DAT_00202bfb  (DAT_00202bf8_backing[0x03])
#define DAT_00202bfc  (DAT_00202bf8_backing[0x04])
#define DAT_00202bfd  (DAT_00202bf8_backing[0x05])
#define DAT_00202bfe  (DAT_00202bf8_backing[0x06])
#define DAT_00202bff  (DAT_00202bf8_backing[0x07])
#define DAT_00202c02  (DAT_00202bf8_backing[0x0a])
#define DAT_00202c03  (DAT_00202bf8_backing[0x0b])
#define DAT_00202c04  (DAT_00202bf8_backing[0x0c])
#define DAT_00202c07  (DAT_00202bf8_backing[0x0f])
#define DAT_00202c08  (DAT_00202bf8_backing[0x10])
#define DAT_00202c09  (DAT_00202bf8_backing[0x11])
#define DAT_00202c0a  (*(unsigned short *)(DAT_00202bf8_backing + 0x12))
#define DAT_00202c0c  (DAT_00202bf8_backing[0x14])
#define DAT_00202c0d  (DAT_00202bf8_backing[0x15])
#define DAT_00202c0e  (DAT_00202bf8_backing[0x16])
#define DAT_00202c14  (*(unsigned int *)(DAT_00202bf8_backing + 0x1c))
extern int DAT_000879ac;
extern short DAT_0023bf48;
extern short DAT_0023bf4c;
extern undefined4 DAT_0023bf54;
extern byte DAT_0023bf58;
extern short g_movement_mode;
extern unsigned int g_uw_frame_clock_units;


/* --- auto-generated overlap/exref aliases --- */
/* _DAT_00085bf0 dropped from here: superseded by the real, hand-traced definition near the
   inventory.c extern block above... */
#define _DAT_00086999 (*(unsigned short*)&DAT_00086999)
#define _DAT_0008699b (*(unsigned short*)&DAT_0008699b)
#define _DAT_0008699f (*(unsigned short*)&DAT_0008699f)
#define _DAT_000869a1 (*(unsigned short*)&DAT_000869a1)
#define _DAT_00204980 (*(uint*)&DAT_00204980)

int collision_response_mobile_object(ushort *collision_flags);
unsigned int uw_frame_clock_ms();
int check_and_reset_landing_state(ushort *object);
int uw_turn_rate_accel();
void init_collision_response_profiles();
int collision_response_default(ushort *object);
int collision_response_alt_locomotion(ushort *object);
int collision_response_other_locomotion(ushort *object);
int can_step_between_tiles(byte ignore_x, byte ignore_y, byte from_x, byte from_y, byte to_x, byte to_y, byte step_height);
void apply_heading_turn(int turn_amount);
void resolve_wall_slide_corner();
void movement_collision_sweep(void *movement_block, void *snapshot);
void sweep_init_position();
void reticle_object_pick(int mode);
int movement_sweep_setup(int is_initial, int use_remaining);
void sweep_restart_remaining(int steps);
void sweep_kill_velocity();
void sweep_writeback_position();
int sweep_integrate_substep(short sub_step, short axis);
int sweep_deflect_heading(uint heading);
void sweep_slide_along_wall(int attempt);
void sweep_apply_knockback();
void sweep_land_on_surface();
int sweep_step_vertical(int unused, short step);
int sweep_step(int step_command);
uint collision_flags_to_locomotion_code(short collision_mask);
uint sweep_collision_flags();
void sweep_apply_collision();
void *find_nearby_door_in_candidates(byte *out_dx, byte *out_dy);
void *get_first_nearby_candidate_object();
void decode_movement_command();
void movement_pacing_handler();
void movement_tick(int elapsed, int tick_flags, int skip_npc_tick);
void settle_movement_to_rest();
void apply_movement_tick(int elapsed);

#endif

#include "src/headers/uw.h"
extern ushort arena[0x4000], held[4];
extern char character[256], game_mode[32];
extern int cursor_y, mobile_allocations, static_allocations, freed;
extern bool wall, bridge_fixture, real_angles;
extern byte bridge_heights[3];
extern int bridge_count;
extern ushort *thrown;
/* Frame-by-frame driver for the movement clock / mobile object scheduler (throw_fixture.c). */
extern int thrown_steps, pacing_scheduler_ticks, pacing_movement_ticks, pacing_tick_flags_total;
extern int frame_number;
#include <math.h>

/* Isolated storage for the original throw/physics functions. */
extern char *DAT_00086df8;
extern short DAT_00201b68;
extern uw_object_type_props_t g_object_type_props[512];
extern uw_mobile_object_t *g_player_object;
extern char * DAT_002029cc;
extern short * DAT_00085a6c;
extern char * DAT_002046b8;
extern char * DAT_002046c4;
extern uw_mobile_object_t *DAT_0010190c;
extern byte * DAT_00202c6c;
extern short DAT_0023beb4;
extern undefined1 DAT_00204880_backing[128];
extern short DAT_0010144c;
extern short DAT_00101454;
extern short DAT_00202a38;
extern short DAT_00202a3c;
extern short DAT_00202a40;
extern ushort * DAT_00202a44;
extern ushort DAT_00202a48;
extern ushort DAT_00202a4c;
extern undefined2 DAT_00202a50;
extern undefined2 DAT_00202a54;

extern void * DAT_0010172c;
extern char DAT_00101928;
extern undefined DAT_00204920_backing[128];
extern undefined1 DAT_00204980_backing[32];
extern undefined2 DAT_00204990_backing[16];
extern undefined2 DAT_002049a0_backing[16];
extern undefined2 DAT_002049b0_backing[16];
extern unsigned char DAT_002049c8_backing[64];
extern unsigned char DAT_00086998_backing[16];
extern undefined1 DAT_00086986_backing[64];
extern short DAT_00086980;
extern short DAT_00086982;
extern short DAT_00086984;
extern short DAT_0008698a;
extern ushort DAT_0008698c;
extern short DAT_0008698e;
extern short DAT_00086990;
extern ushort DAT_00086992;
extern short DAT_00086994;
extern short DAT_00086996;
extern unsigned char DAT_000869a8_backing[16];
extern undefined DAT_00202c32;
extern char *DAT_002046b8;
extern undefined1 DAT_00202c38_backing[1536];
extern int DAT_00204870;
extern char * DAT_00204874;
extern undefined4 DAT_00204878;
extern char * DAT_002048bc;
extern int (*DAT_00204988)(ushort *);
extern int (*DAT_00204998)(ushort *);
extern int (*DAT_002049a8)(ushort *);
extern int (*DAT_002049b8)(ushort *);
extern char DAT_002049bc;
extern undefined1 DAT_002049c0;
extern short * g_sweep_foot_pos;
extern short * g_sweep_velocity;

extern ushort DAT_00202084;
extern byte DAT_0020208c;
extern short DAT_00085890, DAT_00202074, DAT_00202078, DAT_0020207a, DAT_0020207c;

#define DAT_000868c0 DAT_000868c0_backing[0]
#include <math.h>

#ifndef DAT_002034b5
#define DAT_002034b5 ((byte *)g_object_type_props)[0x825] /* item 0xa0 value, loaded COMOBJ table */
#endif

#ifndef DAT_000868c0
#define DAT_000868c0 DAT_000868c0_backing[0]
#endif

#ifndef DAT_00086986
#define DAT_00086986 DAT_00086986_backing[0]
#endif

#ifndef DAT_000869a8
#define DAT_000869a8 DAT_000869a8_backing[0]
#endif

#ifndef DAT_00086987
#define DAT_00086987 DAT_00086986_backing[1]
#endif
int uw_editor_active(void);

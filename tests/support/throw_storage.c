#include "../throw_test_globals.h"
/* Isolated storage for the original throw/physics functions. */
char *DAT_00086df8;
short DAT_00201b68;
uw_object_type_props_t g_object_type_props[512];
uw_mobile_object_t *g_player_object;
char * DAT_002029cc;
short * DAT_00085a6c;
char * DAT_002046b8;
char * DAT_002046c4;
uw_mobile_object_t *DAT_0010190c;
byte * DAT_00202c6c;
short DAT_0023beb4;
undefined1 DAT_00204880_backing[128];
short DAT_0010144c;
short DAT_00101454;
short DAT_00202a38;
short DAT_00202a3c;
short DAT_00202a40;
ushort * DAT_00202a44;
ushort DAT_00202a48;
ushort DAT_00202a4c;
undefined2 DAT_00202a50;
undefined2 DAT_00202a54;

void * DAT_0010172c;
char DAT_00101928;
undefined DAT_00204920_backing[128];
undefined1 DAT_00204980_backing[32];
undefined2 DAT_00204990_backing[16];
undefined2 DAT_002049a0_backing[16];
undefined2 DAT_002049b0_backing[16];
unsigned char DAT_002049c8_backing[64];
unsigned char DAT_00086998_backing[16];
undefined1 DAT_00086986_backing[64];
short DAT_00086980;
short DAT_00086982;
short DAT_00086984;
short DAT_0008698a;
ushort DAT_0008698c;
short DAT_0008698e;
short DAT_00086990;
ushort DAT_00086992;
short DAT_00086994;
short DAT_00086996;
unsigned char DAT_000869a8_backing[16];
undefined DAT_00202c32;
char *DAT_002046b8;
undefined1 DAT_00202c38_backing[1536];
int DAT_00204870;
char * DAT_00204874;
undefined4 DAT_00204878;
char * DAT_002048bc;
int (*DAT_00204988)(ushort *);
int (*DAT_00204998)(ushort *);
int (*DAT_002049a8)(ushort *);
int (*DAT_002049b8)(ushort *);
char DAT_002049bc;
undefined1 DAT_002049c0;
short * g_sweep_foot_pos;
short * g_sweep_velocity;

ushort DAT_00202084;
byte DAT_0020208c;
int g_debug_noclip;
short DAT_00085890, DAT_00202074, DAT_00202078, DAT_0020207a, DAT_0020207c;

/* Movement clock, object tick scheduler and 60Hz game-frame pacing, so a test can drive the real
   movement_pacing_handler -> tick_mobile_objects -> mobile_object_tick chain frame by frame. */
unsigned int g_uw_frame_clock_units;
undefined4 DAT_0023bf54;
byte DAT_0023bf58;
int DAT_000879ac, g_npc_tick_enabled;
undefined4 DAT_002020d4;
undefined4 DAT_002020d0;
short g_mode_handler_row, DAT_00201c84;
undefined2 DAT_00201c90;
byte * DAT_002046c0;
byte * DAT_002046c8;

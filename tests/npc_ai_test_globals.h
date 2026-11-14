#include "src/headers/uw.h"
extern ushort npc[32], player[32], tile[4];
extern char character[256];
extern uw_mobile_object_t *g_player_object;
extern uw_mobile_object_t *DAT_0010190c;
extern char *DAT_00086df8;
extern uw_monster_type_props_t g_monster_type_props[64];
extern uw_object_type_props_t g_object_type_props[512];
extern undefined2 DAT_002048c0_backing[64];
extern undefined1 DAT_002048f0_backing[128], DAT_00204950_backing[128];
extern undefined1 DAT_00204980_backing[32];
extern undefined2 DAT_00204990_backing[16], DAT_002049b0_backing[16];
extern uw_ranged_type_props_t g_ranged_type_props[16];
#define DAT_000853d8 DAT_000853d8_backing[0]
extern char *DAT_00101400;
extern byte *DAT_00101438;
extern uw_monster_type_props_t *DAT_00101404;
extern void *DAT_0010172c;
extern char DAT_00101408, DAT_00101410, DAT_0010143c, DAT_0010173c;
extern ushort DAT_00101900, DAT_00101910, DAT_0010141c, DAT_00101414;
extern undefined2 DAT_00101908, DAT_00101418;
extern byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_001018fc;
extern byte DAT_00101434, DAT_00101730, DAT_00101458;
extern short DAT_00101444, DAT_00101448;
extern undefined1 DAT_00101420, DAT_00101738;
extern undefined4 DAT_00101924, DAT_00101734_backing[1], DAT_0010191c, DAT_001013fc;
extern undefined4 DAT_00101560, DAT_00101914, DAT_00101920, DAT_00101728;
extern int DAT_00101430, DAT_00101940;
extern byte DAT_0010192c, DAT_00101930;
extern undefined1 DAT_00101934;
extern char DAT_0010194c, DAT_000853d0;
extern ushort DAT_000853b8;
extern short DAT_00101938, DAT_0010193c, DAT_0010144c, DAT_00101454, DAT_00202a3c;
extern short DAT_00201b68;
extern undefined4 DAT_00101944;
extern FILE *monster_data;
extern int chase_steps, attacks, last_chase_x, last_chase_y, los_clear;
extern unsigned random_index;
extern char DAT_00101740_backing[448];
extern undefined1 DAT_00101739, DAT_0010173a;
extern undefined DAT_00101733;
extern undefined DAT_00101732_backing[8192], DAT_00101568_backing[448];
extern undefined1 DAT_0010142c;
extern undefined4 DAT_00101440;
extern byte DAT_00101450;
extern char *DAT_00101904;
#include <math.h>

#ifndef DAT_002034b5
#define DAT_002034b5 ((byte *)g_object_type_props)[0x825] /* item 0xa0 value, loaded COMOBJ table */
#endif


#ifndef DAT_00101568
#define DAT_00101568 DAT_00101568_backing[0]
#endif

#ifndef DAT_00101740
#define DAT_00101740 DAT_00101740_backing[0]
#endif

#ifndef DAT_00101741
#define DAT_00101741 DAT_00101740_backing[1]
#endif

#ifndef DAT_00101743
#define DAT_00101743 DAT_00101740_backing[3]
#endif

#ifndef DAT_00101744
#define DAT_00101744 (*(undefined2 *)&DAT_00101740_backing[4])
#endif

#ifndef DAT_00101746
#define DAT_00101746 DAT_00101740_backing[6]
#endif

#ifndef DAT_00101747
#define DAT_00101747 DAT_00101740_backing[7]
#endif

#ifndef DAT_00101748
#define DAT_00101748 DAT_00101740_backing[8]
#endif

#ifndef DAT_002048f0
#define DAT_002048f0 DAT_002048f0_backing[0]
#endif

#ifndef DAT_00204950
#define DAT_00204950 DAT_00204950_backing[0]
#endif

#ifndef DAT_00101742
#define DAT_00101742 DAT_00101740_backing[2]
#endif

#ifndef DAT_00101732
#define DAT_00101732 DAT_00101732_backing[0]
#endif

#ifndef DAT_00101749
#define DAT_00101749 DAT_00101740_backing[9]
#endif

#ifndef DAT_0010174a
#define DAT_0010174a DAT_00101740_backing[10]
#endif

#ifndef DAT_00101569
#define DAT_00101569 DAT_00101568_backing[1]
#endif
#include <math.h>

#ifndef UW_TEST_SCHEDULER_FIXTURE_H
#define UW_TEST_SCHEDULER_FIXTURE_H
/* Fixture state and controlled services for reusable scheduler tests. */
#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern uw_animation_type_props_t g_animation_type_props[16];
extern char *g_scheduler_table;
extern undefined1 g_scheduler_count;
extern undefined4 DAT_0023b804;
extern int DAT_002508fc;
extern short DAT_0010144c, DAT_00101454;
extern undefined1 DAT_002048f0_backing[128];
extern undefined1 DAT_00204950_backing[128];
extern char queue[64 * 6];
extern ushort objects[3][16];
uw_mobile_object_t *scheduler_mobile_object(unsigned slot);
extern char tiles[3][8];
extern int freed[3];
extern ushort corpse[4];
extern int corpses_spawned, corpses_placed, corpse_type;
extern uw_mobile_object_t *DAT_0010190c;
extern uw_monster_type_props_t *DAT_00101404;
extern byte *DAT_00101438;
extern void *DAT_0010172c;
extern uw_monster_type_props_t g_monster_type_props[64];
extern uw_object_type_props_t g_object_type_props[512];
extern undefined2 DAT_002048c0_backing[64];
extern undefined1 DAT_002048f0_backing[128], DAT_00204950_backing[128];
extern undefined1 DAT_00204980_backing[32];
extern undefined2 DAT_00204990_backing[16], DAT_002049b0_backing[16];
extern uw_ranged_type_props_t g_ranged_type_props[16];

extern ushort DAT_000853b8, DAT_00101414, DAT_0010141c, DAT_00101910;
extern short DAT_00101938, DAT_0010193c, DAT_00202a3c;
extern byte DAT_00101918, DAT_001013f8, DAT_0010140c, DAT_00101458;
extern byte DAT_001018fc, DAT_00101434, DAT_00101730;
extern char DAT_0010143c, DAT_0010173c;
extern undefined1 DAT_00101738;
extern undefined4 DAT_00101924, DAT_0010191c, DAT_001013fc;
extern undefined4 DAT_00101734_backing[1];
extern undefined4 DAT_00101560, DAT_00101914, DAT_00101944;
extern int DAT_00101430;
void scheduler_fixture_reset(void);
void scheduler_fixture_dispose(void);
void add_spark(int slot, int y);
#endif

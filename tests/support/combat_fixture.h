#ifndef UW_TEST_COMBAT_FIXTURE_H
#define UW_TEST_COMBAT_FIXTURE_H
/* Fixture state and controlled services for reusable combat tests. */
#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/ordinal_stubs.h"
#include <stdio.h>
extern byte mobile_objects[256 * 27];
extern char *DAT_002046b8;
extern byte *DAT_00202c6c;
extern uw_object_type_props_t g_object_type_props[512];
extern undefined1 DAT_00202c38_backing[1536];
extern short DAT_001005f4, DAT_001005f8, DAT_0023beb4;
extern char DAT_001005dc;
extern short DAT_00100610;
extern ushort DAT_00100620, DAT_00100604;
extern undefined2 DAT_00100600, DAT_00100624;
extern int candidate_count, lookup_count;
extern ushort lookup_slots[32];
extern int wall_collision;
extern int wall_in_front;
extern ushort wall_effect[4];
extern byte wall_tile[4];
extern byte DAT_00100628, DAT_001005fc;
extern short DAT_0010061c;
extern undefined4 DAT_001005d8;
extern char DAT_00084f18_backing[5];
extern uw_monster_type_props_t g_monster_type_props[64];
extern byte player_stats[256];
extern char *DAT_00086df8;
extern char *DAT_0023b82c;
extern int skill_result, skill_checks, effects, impact_sounds;
extern int effect_types[2], effect_heights[2];
extern int door_triggers, door_scheduled, discarded_links;
extern int talks, death_sounds, positional_impacts;
extern int level_stat_recalculations;
extern char level_message[16];
uint combat_player_experience(void);
void combat_set_player_experience(uint xp, byte level);
void combat_create_character(void);
extern const void *expected_effect_target;
extern uw_mobile_object_t *g_player_object;
extern char *DAT_0023be74;
extern uw_monster_type_props_t *DAT_00101404;
extern char DAT_000853d0, DAT_0010194c;
extern byte DAT_0010192c, DAT_00101930;
extern undefined1 DAT_00101934;
extern int DAT_00101940;
extern undefined4 DAT_00101944;
extern ushort DAT_00101910, DAT_0010141c;
extern uint music_track;
extern uint clock_units;
extern undefined1 DAT_0023c118_arr[9], DAT_0023c128_arr[9];
extern unsigned char DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];
extern ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;
extern byte DAT_0023c150, DAT_0023c12a, DAT_0023c25c;
extern int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
extern undefined1 DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];
extern undefined1 DAT_0023c1f0_backing[64], DAT_0023c1f8_backing[64];
extern undefined1 DAT_0023c11a;
extern undefined1 g_active_hud_panel;
extern undefined1 DAT_0023c11b;
extern char DAT_000870d8, DAT_000870dc;
extern short DAT_0023c21c;
extern undefined2 DAT_0023c220;
extern undefined1 DAT_0023c1f0_backing[64], DAT_0023c1f8_backing[64];
extern int hud_flushes, wipe_frames;
extern uint frames[32];
extern void (*const g_hud_panel_handlers_table[13])(void);
int spawn_scheduled_effect_object(ushort *target, int type, int mode, byte intensity, short height, short x, short y);
extern FILE *monster_data;
void load_real_monster_data(void);
ushort *object_at(unsigned slot);
void candidate(unsigned index, unsigned slot, short displacement);
void combat_fixture_reset(void);
void combat_fixture_dispose(void);
ushort wall_spark_height(short pitch);
extern long combat_random_roll;
#endif

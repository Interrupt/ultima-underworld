#ifndef UW_TEST_CHARGEN_FIXTURE_H
#define UW_TEST_CHARGEN_FIXTURE_H
/* Fixture state and controlled services for reusable chargen tests. */
#include "unity.h"
#include "src/headers/chargen.h"
extern char attributes[16];
#define record (*(char (*)[256])DAT_0023bca8_backing)
extern ushort player_object[16];
extern char *DAT_00086df8;
extern char *DAT_0023be74;
extern uw_mobile_object_t *g_player_object;
extern short DAT_00201b68;
extern undefined1 DAT_000fb860_backing[32];
extern char DAT_000fb8f0_backing[1680];
extern int random_values[64], random_count, random_index;
extern int dice_calls, equipment_calls, reset_calls;
extern int trained[6], trained_count;
void chargen_fixture_reset(void);
void chargen_fixture_dispose(void);
void prepare_initial_randomness(void);
#endif

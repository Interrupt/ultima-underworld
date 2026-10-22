#ifndef UW_TEST_ILLUSTRATIONS_FIXTURE_H
#define UW_TEST_ILLUSTRATIONS_FIXTURE_H
/* Fixture state and controlled services for reusable illustrations tests. */
#include "unity.h"
#include "src/headers/uw.h"
extern short DAT_00201b68;
extern undefined2 DAT_0023add0_backing[64];
extern char DAT_0023c698_backing[1024];
extern char DAT_00085460_backing[11];
extern char DAT_0023cca8_backing[1024];
extern char s__DATA_grave_dat_00085cf8[];
extern char s_scroll_newline_0008522c_backing[8192];
extern byte level_one[0x7c08], script[16];
extern int descriptions, opens, writes, closes, displays, position;
extern int fail_open, fail_write;
extern uint displayed_page;
extern char opened_path[260];
ushort *window_object(void);
void illustrations_fixture_reset(void);
void illustrations_fixture_dispose(void);
#endif

#ifndef UW_TEST_RESTORED_TABLES_FIXTURE_H
#define UW_TEST_RESTORED_TABLES_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
extern int restored_spawn_id, restored_scan_count;
extern int restored_message_kind, restored_message_id, restored_message_lparam;
extern undefined4 restored_message_window, restored_message_wparam;
extern void *restored_scan_objects[4]; /* raw object records handed to the scan callback */
extern undefined4 DAT_0024cff8;
extern char *DAT_0024cfd4;
void restored_tables_fixture_reset(void);
int uw_test_compare_original_tables(void);
#endif

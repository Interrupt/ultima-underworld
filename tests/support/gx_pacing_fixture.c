#include "unity.h"
#include "gx_pacing_test_api.h"

int uw_defer_present(void);
int uw_take_completed_frame(void);
void uw_record_completed_present(uint64_t now_us);

unsigned int g_uw_frame_clock_units;
char *g_selected_object;
undefined2 g_cursor_holding_state, DAT_00201c90;
short g_mode_handler_row, DAT_00201c84, DAT_0023c63c;
char DAT_002506ab;
uint64_t now_us;
int presents, framebuffer_version, displayed_version;
uint64_t present_wait_us;
int GXEndDraw(void)
{
    if (uw_defer_present()) return 1;
    int completed = uw_take_completed_frame();
    if (completed || uw_present_frame_due(now_us)) {
        presents++;
        displayed_version = framebuffer_version;
        now_us += present_wait_us;
        if (completed) uw_record_completed_present(now_us);
    }
    return 1;
}
void gx_pacing_fixture_reset(void)
{
    uw_reset_frame_pacing();
    now_us = present_wait_us = 0;
    presents = framebuffer_version = displayed_version = 0;
    g_selected_object = NULL;
    g_cursor_holding_state = DAT_00201c90 = 0;
    g_mode_handler_row = DAT_00201c84 = DAT_0023c63c = DAT_002506ab = 0;
}
void gx_pacing_fixture_dispose(void) {}

#ifndef UW_TEST_ILLUSTRATION_RENDER_FIXTURE_H
#define UW_TEST_ILLUSTRATION_RENDER_FIXTURE_H
/* Fixture state and controlled services for reusable illustration_render tests. */
#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/file_io.h"
extern undefined1 DAT_00085448_backing[11];
extern undefined1 DAT_0023c698_backing[1024];
extern undefined1 DAT_00101968_backing[260];
extern uintptr_t DAT_00101a70;
extern ushort DAT_00101a6c, DAT_000853f8, DAT_000853fc, DAT_00085400;
extern byte image[64000];
extern int file_handles[4];
extern void *allocations[64];
extern int alloc_count, frees, opens, blits, clicks, dungeon_redraws;
extern uint clock_units;
extern int dismiss_event, missing_resource, opening_click_pending, releases;
extern ushort gameplay_palette[256];
extern char opened[4][260];
extern const babl_render_op_fn PTR_FUN_00085408[16];
long CloseHandle(int handle);
extern uint fake_tick_ms;
extern short DAT_00086968, DAT_0008696e, DAT_00204850;
extern undefined2 DAT_0008696a, DAT_0008696c;
extern short g_mouse_x, g_mouse_y;
extern ushort DAT_0023c448;
extern undefined2 g_game_mode;
extern int DAT_0020484c;
extern undefined4 DAT_00204868;
extern char DAT_002506aa, DAT_002506ab;
extern short mouse_driver;
extern short *DAT_000876c4;
extern char keyboard_case;
extern char *DAT_0008794c;
extern int opening_hold_polls, idle_polls, dismissal_sent;
int PeekMessageW(void *msg, void *hwnd, unsigned int low,
                unsigned int high, unsigned int remove);
extern undefined1 *DAT_00201b40, *DAT_00201b50;
extern int DAT_00201b54, DAT_00201b4c, DAT_00201b58, DAT_00201b3c;
extern ushort DAT_00201b48;
extern short DAT_00201b44;
extern void *g_uw_framebuffer;
extern undefined1 DAT_00088d98_backing[768];
extern byte draw_color;
extern byte *g_draw_color_index;
extern undefined1 *DAT_00084298;
extern char *DAT_000879b0;
extern short DAT_0023c63c;
extern ushort DAT_00101960;
extern int g_text_use_palette_color, DAT_00201c98;
extern undefined2 DAT_0024cfac;
extern short *DAT_00085a6c;
extern char s_FONTBIG_SYS_00085454[];
extern char s_font5x6p_sys_0008430c[];
extern ushort framebuffer[320 * 200], hardware_framebuffer[240 * 320];
extern int presents, testing_game_tick, input_opens_window;
extern int desktop_cursor;
extern int g_force_flush, g_force_redraw_no_xp;
extern unsigned int g_uw_frame_clock_units;
extern char *g_selected_object;
extern short DAT_00084f10;
extern int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
extern short g_mode_handler_row;
extern undefined2 DAT_00201c90;
extern char selected_window;
extern undefined2 g_palette_rgb565_backing[32768];
extern undefined1 DAT_00084a40_backing[1024];
extern undefined2 DAT_00248418_backing[20 * 256], DAT_00242010_backing[12800];
extern undefined2 DAT_000a85c0;
extern int g_blit_transparent_mode, DAT_0024af70;
extern void *DAT_0023c430;
extern undefined1 DAT_0023cdb0_backing[32];
extern short DAT_00201c84;
int GXEndDraw(void);
void illustration_render_fixture_reset(void);
void illustration_render_fixture_dispose(void);
#endif

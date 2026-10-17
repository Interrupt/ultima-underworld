#include "src/headers/uw.h"
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
extern int testing_fade, intro_fade_test, palette_installs, presents;
extern unsigned long long fade_brightness[256];
extern unsigned fade_samples;
extern uint fade_clock_ms, fade_present_ms;
extern bool g_new_game_entry_pause_pending;
extern unsigned entry_pauses, entry_pause_sample;
extern uint fade_present_times[256];
extern ushort fade_pixels[256];
extern int testing_entry_tick, first_dungeon_draw_sample;
extern int testing_menu, menu_polls, menu_dismissal_sent, menu_visible_before_close;
extern int input_opens_prompt, prompt_polls, prompt_event, prompt_visible_before_input;
extern int prompt_start_presents;
extern char prompt_answer[4];
extern ushort framebuffer[320 * 200], hardware_framebuffer[240 * 320];
extern ushort gameplay_palette[256];
extern char opened[4][260];
extern const babl_render_op_fn PTR_FUN_00085408[16];
extern short DAT_00086968, DAT_0008696e, DAT_00204850;
extern undefined2 DAT_0008696a, DAT_0008696c;
extern short g_mouse_x, g_mouse_y;
extern ushort DAT_0023c448;
extern undefined2 g_game_mode;
extern int DAT_0020484c;
extern undefined4 DAT_00204868;
extern char DAT_002506aa, DAT_002506ab;
extern undefined2 g_cursor_holding_state;
extern short mouse_driver;
extern short *DAT_000876c4;
extern char keyboard_case;
extern char *DAT_0008794c;
extern int opening_hold_polls, idle_polls, dismissal_sent;
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
extern int testing_game_tick, input_opens_window;
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
extern char *DAT_001005c4, *DAT_001005c8, *DAT_000fb858;
extern undefined1 DAT_000fb860_backing[32], DAT_000fb8f0_backing[1680];
extern undefined1 DAT_0023cca8_backing[1024];
extern int DAT_00201c98;
extern char s_chrbtns_00084ef8[];
extern char s__DATA_skills_dat_00084ee4[];
extern char s__DATA_chrgen_dat_00084ed0[];
extern char s_FONTCHAR_SYS_00084ec0[];
extern char s_FONT5X6P_SYS_00084e9c[];
extern char s__DATA_CHARGEN_BYT_00084eac[];
extern char s__DATA_main_byt_000857a8[];
extern int character_screen_inputs;
extern undefined2 DAT_000868d8;
extern int DAT_002046f8;
extern int g_text_input_active;
extern undefined4 g_scroll_control_codes_enabled;
extern short DAT_0025070c;
extern undefined *DAT_00250704;
extern undefined s_dash_000879a4_backing[8192];
extern undefined s_scroll_prompt_arrow_000879a8_backing[8192];
extern short prompt_panel[16], prompt_font[8];
#include <math.h>

#ifndef g_palette_rgb565
#define g_palette_rgb565 g_palette_rgb565_backing[0]
#endif

#ifndef g_transparent_screen_color
#define g_transparent_screen_color (*(short *)&g_palette_rgb565_backing[26])
#endif

#ifndef DAT_00084a40
#define DAT_00084a40 DAT_00084a40_backing[0]
#endif

#ifndef DAT_00242010
#define DAT_00242010 DAT_00242010_backing[0]
#endif

#ifndef DAT_00248418
#define DAT_00248418 DAT_00248418_backing[0]
#endif

#ifndef DAT_0023cca8
#define DAT_0023cca8 DAT_0023cca8_backing[0]
#endif

#ifndef DAT_000fb860
#define DAT_000fb860 DAT_000fb860_backing[0]
#endif

#ifndef DAT_000fb863
#define DAT_000fb863 DAT_000fb860_backing[3]
#endif

#ifndef DAT_000fb8f0
#define DAT_000fb8f0 DAT_000fb8f0_backing[0]
#endif

#ifndef s_dash_000879a4
#define s_dash_000879a4 s_dash_000879a4_backing[0]
#endif

#ifndef s_scroll_prompt_arrow_000879a8
#define s_scroll_prompt_arrow_000879a8 s_scroll_prompt_arrow_000879a8_backing[0]
#endif

#ifndef DAT_0023cdb0
#define DAT_0023cdb0 DAT_0023cdb0_backing[0]
#endif

#ifndef DAT_0023c698
#define DAT_0023c698 DAT_0023c698_backing[0]
#endif

#ifndef DAT_00101968
#define DAT_00101968 DAT_00101968_backing[0]
#endif

#ifndef DAT_00085448
#define DAT_00085448 DAT_00085448_backing[0]
#endif

#ifndef DAT_00088d98
#define DAT_00088d98 DAT_00088d98_backing[0]
#endif

#ifndef DAT_0023cdb8
#define DAT_0023cdb8 (*(int *)(DAT_0023cdb0_backing + 8))
#endif

#ifndef DAT_0023cdbc
#define DAT_0023cdbc (*(int *)(DAT_0023cdb0_backing + 0xc))
#endif

#ifndef DAT_0023cdc0
#define DAT_0023cdc0 (*(int *)(DAT_0023cdb0_backing + 0x10))
#endif

#ifndef DAT_00084a40
#define DAT_00084a40 DAT_00084a40_backing[0]
#endif

#ifndef DAT_000fb860
#define DAT_000fb860 DAT_000fb860_backing[0]
#endif

#ifndef DAT_000fb863
#define DAT_000fb863 DAT_000fb860_backing[3]
#endif

#ifndef DAT_000fb8f0
#define DAT_000fb8f0 DAT_000fb8f0_backing[0]
#endif

#ifndef DAT_00101968
#define DAT_00101968 DAT_00101968_backing[0]
#endif

#ifndef DAT_00085448
#define DAT_00085448 DAT_00085448_backing[0]
#endif

#ifndef s_dash_000879a4
#define s_dash_000879a4 s_dash_000879a4_backing[0]
#endif

#ifndef s_scroll_prompt_arrow_000879a8
#define s_scroll_prompt_arrow_000879a8 s_scroll_prompt_arrow_000879a8_backing[0]
#endif

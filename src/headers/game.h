#ifndef HEADERS_GAME_H
#define HEADERS_GAME_H

/* Declarations for game.c: top-level program flow (WinMain's real body
 * and the title/main menu loop). Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in automap.c
   (pick_closer_note_label, handle_automap_note_click, draw_automap_notes,
   save_automap_notes_to_archive, load_automap_notes_from_archive, switch_automap_level_display)... */
/* Globals defined in uw.c but also used by functions that now live in
   game.c (app_main_loop, main_menu_loop) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 *DAT_00084298;
extern byte *g_draw_color_index;
extern char DAT_000857a0_backing[16];
#define DAT_000857a0 DAT_000857a0_backing[0]
extern undefined2 DAT_000868d8;
extern ushort *DAT_000876bc;
extern short *DAT_000876c0;
extern int DAT_000876c8;
extern char *DAT_000879b0;
extern char *DAT_000890a4;
extern int DAT_00201c98;
extern char *g_weapon_swing_current_frame;
extern ushort DAT_0023c448;
extern undefined4 DAT_0023c540;
extern undefined4 DAT_0023c648;
extern void *DAT_0023c7a0_arr[0x140];
#define DAT_0023c7a0 DAT_0023c7a0_arr[0]
extern char *DAT_0023cca0;
extern char *DAT_0023cca4;
extern char DAT_0023cca8_backing[1024];
#define DAT_0023cca8 DAT_0023cca8_backing[0]
extern char *DAT_00248410;
extern int DAT_0024af60;
extern short DAT_0024af6c;
extern int g_text_use_palette_color;
extern byte *DAT_0024af78;
extern byte *DAT_0024af7c;
extern char DAT_0024d000;
extern char DAT_0024fa28;
extern void * DAT_00202308_arr[128];
#define DAT_00202308 DAT_00202308_arr[0]
extern void (*const DAT_00085668_real_table[48])();
#define DAT_00085668_backing ((undefined1 *)DAT_00085668_real_table)
extern char DAT_00241f08_backing[1024];
#define DAT_00241f08 DAT_00241f08_backing[0]


#define DAT_00085668 DAT_00085668_backing[0]
#define DAT_000856a4 (DAT_00085668_backing[15 * 8])

int app_main_loop(int instance, int prev_instance, int command_line, int show_command);
void main_menu_loop(int is_first_entry);
bool prepare_new_game();
bool start_headless_new_game();
bool start_game_with_current_character();
void begin_gameplay();

/* Forward declaration needed because main_menu_loop (now in game.c) takes this LAB_ callback's
   address to pass to load_gr_resource_entries; its own definition stays in uw.c... */
void *opbtn_gr_bump_alloc_entry(unsigned int byte_count);
void debug_adjust_view_heading(int delta);
void debug_force_rest_action();
int print_debug_stat_message(short stat_index);
void show_error_dialog_stub_thunk();
void compute_dimension_volume();
void run_game_startup_sequence();
void run_game_shutdown_sequence(int unused);
void wait_and_show_intro_page();
void init_main_loop_state();
void request_game_exit(int key_code);
void set_game_mode(int mode);
void change_game_mode(int mode);
void show_error_dialog_stub();
void log_categorized_error_message(short error_code);
void report_categorized_fatal_error(short error_code);
void report_fatal_error_and_exit(ushort error_code);
void report_fatal_error_message_and_exit(char *message);
void handle_game_view_click();
int select_default_hud_font();
void play_view_restore_transition();
int load_startup_gr_resources();
void set_pending_update_flags(ushort flags);
void close_panels_before_level_change();
void reset_player_object_record();
void init_gameplay_session();
void print_player_position_debug();
void print_help_message();
void set_custom_view_target(short mode);
void move_custom_view_target(int unused);
void set_view_subject_by_command(short command);
void enter_free_camera_mode(int unused);
void restore_view_from_object_record(char *record, short x, short y);
void spin_view_full_rotation(int unused);
void handle_game_view_click_hold();
int populate_menu_button_bitmap_entry(void *entry, uint success, int index);
void animate_title_palette_cycle();
void update_journey_onward_availability(short check_saves);
void draw_menu_item_list(short item_count, char *rects, char use_text, short selected);
int poll_menu_pointer_selection(int item_count, char *rects, char use_text);
int menu_button_list_navigate(int item_count, void *rects, byte use_text, int selected);
void spawn_message_dispatch_thread(int instance, const void *class_name);
int create_main_window_and_init_display(int instance, int show_command);
int window_message_noop_handler(int window, int message);
void store_window_extra_data_ptr(int module);
void dispatch_window_message(undefined4 window, int message, undefined4 wparam, int lparam);
int shutdown_game_resources();
void debug_print_init();
void debug_print(char *param_1, ...);

#endif

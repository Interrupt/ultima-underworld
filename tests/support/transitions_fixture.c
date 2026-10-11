#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/file_io.h"

/* Real script, LPF page loading, RLE decoding and viewer loop. Stub only the
   display/audio/input services; one click dismisses the static window image. */
undefined1 DAT_00085448_backing[11] = "\\CSXXX.nXX";
undefined1 DAT_0023c698_backing[1024];
undefined1 DAT_00101968_backing[260];
uintptr_t DAT_00101a70;
ushort DAT_00101a6c, DAT_000853f8, DAT_000853fc, DAT_00085400;
byte image[64000];
int file_handles[4];
void *allocations[64];
int alloc_count, frees, opens, blits, clicks, dungeon_redraws;
uint clock_units;
int dismiss_event, missing_resource, opening_click_pending, releases;
int testing_fade, intro_fade_test, palette_installs, presents;
int installed_palette_flags[8];
byte last_installed_palette[768];
unsigned long long fade_brightness[256];
unsigned fade_samples;
uint fade_clock_ms, fade_present_ms;
bool g_new_game_entry_pause_pending;
unsigned entry_pauses, entry_pause_sample;
uint fade_present_times[256];
ushort fade_pixels[256];
int testing_entry_tick, first_dungeon_draw_sample;
int testing_menu, menu_polls, menu_dismissal_sent, menu_visible_before_close;
int input_opens_prompt, prompt_polls, prompt_event, prompt_visible_before_input;
int prompt_start_presents;
char prompt_answer[4];
ushort framebuffer[320 * 200], hardware_framebuffer[240 * 320];
ushort gameplay_palette[256];
char opened[4][260];
const babl_render_op_fn PTR_FUN_00085408[16] = {
    (babl_render_op_fn)babl_render_op_wrap_message, (babl_render_op_fn)FUN_000362e8, (babl_render_op_fn)FUN_00036300, (babl_render_op_fn)FUN_00036308,
    (babl_render_op_fn)FUN_00036394, (babl_render_op_fn)FUN_000363f0, (babl_render_op_fn)FUN_00036404, (babl_render_op_fn)FUN_00036418,
    (babl_render_op_fn)babl_render_op_show_code, (babl_render_op_fn)FUN_000365bc, (babl_render_op_fn)FUN_000365fc, (babl_render_op_fn)FUN_0003663c,
    (babl_render_op_fn)FUN_00036698, (babl_render_op_fn)babl_render_op_say, (babl_render_op_fn)FUN_00036344, (babl_render_op_fn)babl_render_op_play_sound
};
int babl_render_op_wrap_message(byte *op_args, intptr_t render_state) { (void)op_args; (void)render_state; if (intro_fade_test) return 2; TEST_FAIL_MESSAGE("Unexpected text in window script"); return 0; }
int babl_render_op_say(intptr_t op_args, intptr_t render_state) { (void)op_args; (void)render_state; if (intro_fade_test) return 3; TEST_FAIL_MESSAGE("Unexpected voice in window script"); return 0; }
int babl_render_op_play_sound(void) { return 0; }
void *ce_malloc(unsigned int count)
{
    TEST_ASSERT_LESS_THAN_INT(64, alloc_count);
    void *p = calloc(1, count);
    TEST_ASSERT_NOT_NULL(p);
    allocations[alloc_count++] = p;
    return p;
}
void *ce_calloc(unsigned int count, unsigned int size) { return ce_malloc(count * size); }
void *ce_memset(void *p, int value, unsigned int count) { return memset(p, value, count); }
void *ce_memmove(void *p, void *source, unsigned int count) { return memcpy(p, source, count); }
char *ce_strcat(char *p, char *source) { return strcat(p, source); }
void LocalFree(void *p)
{
    for (int i = 0; i < alloc_count; i++) if (allocations[i] == p) {
        free(p); allocations[i] = NULL; frees++; return;
    }
    TEST_FAIL_MESSAGE("Free must receive the complete allocated pointer");
}
long CloseHandle(int handle)
{
    for (int i = 0; i < 4; i++) if (file_handles[i] == handle) file_handles[i] = 0;
    return uw_file_close(handle);
}
long Sleep(unsigned int ms)
{
    if (testing_fade && ms == 500) {
        entry_pauses++;
        entry_pause_sample = fade_samples;
    }
    if (testing_fade) fade_clock_ms += ms;
    return 0;
}
int open_file_for_read(const char *path)
{
    TEST_ASSERT_LESS_THAN_INT(4, opens);
    int slot = opens++;
    strcpy(opened[slot], path);
    if ((!strcmp(path, "\\CUTS\\CS400.n00") && missing_resource == 1) ||
        (!strcmp(path, "\\CUTS\\CS400.n01") && missing_resource == 2)) return -1;
    int handle = uw_file_open_read(path);
    if (handle > 0) file_handles[slot] = handle;
    return handle;
}
int read_file_handle(int handle, void *p, unsigned int count)
{
    unsigned int bytes = uw_file_read(handle, p, count);
    /* Emulate the discovery handler's three script patches in memory. */
    if (bytes == 16) { ((ushort *)p)[2] = 1; ((ushort *)p)[3] = 1; ((ushort *)p)[6] = 1; }
    return bytes;
}
int seek_file_handle(int handle, int offset, int origin) { return uw_file_seek(handle, offset, origin); }
uint read_realtime_clock_units(void)
{
    if (testing_fade) return fade_clock_ms++ >> 2;
    clock_units += 0x100;
    return clock_units;
}
long GetTickCount(void)
{
    if (testing_fade) return fade_clock_ms++;
    clock_units += 0x100;
    return clock_units * 4;
}
/* Run the real input poll/release logic. Only the OS message service is
   scripted: hold the opening right click, release, idle, then click again. */
short DAT_00086968, DAT_0008696e, DAT_00204850;
undefined2 DAT_0008696a, DAT_0008696c;
short g_mouse_x, g_mouse_y;
ushort DAT_0023c448;
int DAT_000876c8;
undefined2 DAT_00201b60;
int DAT_0020484c;
undefined4 DAT_00204868;
char DAT_002506aa, DAT_002506ab;
undefined2 g_cursor_holding_state;
short mouse_driver;
short *DAT_000876c4 = &mouse_driver;
char keyboard_case;
char *DAT_0008794c = &keyboard_case;
int opening_hold_polls, idle_polls, dismissal_sent;
long TranslateMessage(const void *message) { (void)message; return 0; }
long DispatchMessageW(const void *message) { (void)message; return 0; }
long _isctype(int key, int mask) { return input_opens_prompt && key >= '0' && key <= '9'; }
long ce_tolower(long key) { return key; }
long ce_toupper(long key) { return key; }
int PeekMessageW(void *msg, void *hwnd, unsigned int low,
                unsigned int high, unsigned int remove)
{
    (void)msg; (void)hwnd; (void)low; (void)high; (void)remove;
    if (input_opens_prompt && g_text_input_active) {
        ++prompt_polls;
        if (prompt_event == 0 && (presents > prompt_start_presents || prompt_polls >= 8)) {
            prompt_visible_before_input = presents > prompt_start_presents;
            prompt_event = 1;
            DAT_0023c448 = '2';
            return 1;
        }
        if (prompt_event == 1 && (presents > prompt_start_presents + 1 || prompt_polls >= 12)) {
            prompt_event = 2;
            DAT_0023c448 = 0xd;
            return 1;
        }
        return 0;
    }
    if (testing_menu) {
        if (++menu_polls >= 4 && !menu_dismissal_sent) {
            menu_visible_before_close = presents > 0 && hardware_framebuffer[319 * 240] == 0x001f;
            menu_dismissal_sent = 1;
            DAT_0023c448 = 0x1b;
            return 1;
        }
        return 0;
    }
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(1000, ++clicks, "Viewer never presented or dismissed");
    if (opening_click_pending) {
        if (opening_hold_polls-- > 0) return 1;
        opening_click_pending = 0;
        DAT_002506ab = 0;
        releases++;
        return 1;
    }
    if (intro_fade_test && fade_samples && fade_brightness[fade_samples - 1] && !dismissal_sent) {
        dismissal_sent = 1;
        DAT_0023c448 = 0x1b;
        return 1;
    }
    if (!intro_fade_test && blits > 0 && idle_polls++ >= 3 && !dismissal_sent) {
        dismissal_sent = 1;
        if (dismiss_event < 4) {
            DAT_0023c63c = dismiss_event & 1;
            DAT_002506ab = (dismiss_event & 2) != 0;
        } else DAT_0023c448 = dismiss_event;
        return 1;
    }
    return 0;
}
void noop_key_handler(void) {}
void update_mouse_state(void) {}

undefined1 *DAT_00201b40, *DAT_00201b50;
int DAT_00201b54, DAT_00201b4c, DAT_00201b58, DAT_00201b3c;
ushort DAT_00201b48;
short DAT_00201b44;
void *g_uw_framebuffer;
undefined1 DAT_00088d98_backing[768];
byte draw_color;
byte *g_draw_color_index = &draw_color;
undefined1 *DAT_00084298 = &draw_color;
char *DAT_000879b0;
short DAT_0023c63c;
ushort DAT_00101960;
int g_text_use_palette_color, DAT_00201c98;
undefined2 DAT_0024cfac;
short *DAT_00085a6c;
char s_FONTBIG_SYS_00085454[] = "FONTBIG.SYS";
char s_font5x6p_sys_0008430c[] = "font5x6p.sys";
void debug_framebuffer_dump(const char *tag) { (void)tag; }
void apply_palette_buffer(void *palette, int flag)
{
    TEST_ASSERT_NOT_NULL(palette);
    TEST_ASSERT_LESS_THAN_INT(8, palette_installs);
    installed_palette_flags[palette_installs++] = flag;
    memcpy(last_installed_palette, palette, sizeof last_installed_palette);
}
void tick_book_illustration_palette_cycles(ushort *cycle_record) { (void)cycle_record; }
void clear_ambient_sound_target(void) {}
void voice_sample_cluster_stub_1(void) {}
void voice_sample_cluster_stub_2(void) {}
void advance_menu_music_track(void) {}
void stop_voice_sample(void) {}
void clear_screen_and_restore_cursor(void) {}
void thunk_FUN_0007ec1c(void) {}
void draw_text_string(char *text, short x, short y) { (void)text; (void)x; (void)y; if (!input_opens_prompt) TEST_FAIL_MESSAGE("Unexpected window text"); }
int measure_text_width(char *text) { if (!input_opens_prompt) TEST_FAIL_MESSAGE("Unexpected window text"); return strlen(text) * 6; }
static void assert_visible_picture(void);
int get_audio_subsystem_flag(void) { return 0; }
int play_numbered_voice_sample(short sample_number) { (void)sample_number; return 0; }
bool is_voice_sample_finished(void) { return 1; }
int play_music_track(byte track_number, int flags) { (void)track_number; (void)flags; return 0; }
bool select_active_font(char *font_filename) { (void)font_filename; return true; }
bool set_palette_bank(int bank) { (void)bank; return true; }
void decrement_cursor_hide_depth(void) {}
void load_dungeon_texture_arenas(void) {}
void change_game_mode(int mode) { (void)mode;}
int cursor_show_idle_tick(void) { return 0; }

int testing_game_tick, input_opens_window;
int g_force_flush, g_force_redraw_no_xp;
unsigned int g_uw_frame_clock_units;
char *g_selected_object;
short DAT_00084f10;
int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
short DAT_00201b64;
undefined2 DAT_00201c90;
char selected_window;
undefined2 g_palette_rgb565_backing[32768];
undefined1 DAT_00084a40_backing[1024];
undefined2 DAT_00248418_backing[20 * 256], DAT_00242010_backing[12800];
undefined2 DAT_000a85c0;
int g_blit_transparent_mode, DAT_0024af70;
void *DAT_0023c430;
undefined1 DAT_0023cdb0_backing[32];
short DAT_00201c84;
int uw_defer_present(void);
int uw_take_completed_frame(void);
void *GXBeginDraw(void) { return hardware_framebuffer; }
int GXEndDraw(void)
{
    if (uw_defer_present()) return 1;
    uw_take_completed_frame();
    presents++;
    if (testing_fade) fade_clock_ms += fade_present_ms;
    if (testing_fade || intro_fade_test) {
        TEST_ASSERT_LESS_THAN_UINT(256, fade_samples);
        unsigned long long brightness = 0;
        for (unsigned row = 0; row < 200; row++)
            for (unsigned col = 0; col < 320; col++) {
                ushort pixel = hardware_framebuffer[(319 - col) * 240 + row];
                brightness += (pixel >> 11) + ((pixel >> 5) & 63) + (pixel & 31);
            }
        fade_present_times[fade_samples] = fade_clock_ms;
        fade_pixels[fade_samples] = hardware_framebuffer[319 * 240];
        fade_brightness[fade_samples++] = brightness;
    } else if (!testing_game_tick) assert_visible_picture();
    return 1;
}
void assert_visible_picture(void)
{
    unsigned colored_pixels = 0;
    for (int row = 19; row < 131; row++)
        for (int col = 52; col < 224; col++)
            if (framebuffer[row * 320 + col]) {
                TEST_ASSERT_EQUAL_HEX16(framebuffer[row * 320 + col],
                    hardware_framebuffer[(319 - col) * 240 + row]);
                colored_pixels++;
            }
    TEST_ASSERT_GREATER_THAN_UINT(256, colored_pixels);
    TEST_ASSERT_EQUAL_INT(64000, DAT_00201b4c);
    blits++;
}
void render_dungeon_frame_timed(void)
{
    TEST_ASSERT_EQUAL_HEX16_ARRAY(gameplay_palette, g_palette_rgb565_backing, 256);
    dungeon_redraws++;
    if (testing_entry_tick) {
        if (first_dungeon_draw_sample < 0) first_dungeon_draw_sample = fade_samples;
        for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0x07e0;
    }
    if (testing_game_tick) flush_dungeon_frame();
}
int dungeon_view_anim_tick(void) { TEST_FAIL_MESSAGE("Unexpected dungeon_view_anim_tick during picture dismissal"); return 0; }
void refresh_equipment_display_if_visible(void) { TEST_FAIL_MESSAGE("Unexpected refresh_equipment_display_if_visible during picture dismissal"); }
void handle_game_victory_sequence(void) { TEST_FAIL_MESSAGE("Unexpected handle_game_victory_sequence during picture dismissal"); }
void movement_pacing_handler(void) { TEST_FAIL_MESSAGE("Unexpected movement_pacing_handler during picture dismissal"); }
void sync_player_stats_to_hud(void) { TEST_FAIL_MESSAGE("Unexpected sync_player_stats_to_hud during picture dismissal"); }
void hud_panel_redraw_dispatch(void) { TEST_FAIL_MESSAGE("Unexpected hud_panel_redraw_dispatch during picture dismissal"); }
void enter_automap_screen(void) { TEST_FAIL_MESSAGE("Unexpected enter_automap_screen during picture dismissal"); }
void exit_automap_screen(void) { TEST_FAIL_MESSAGE("Unexpected exit_automap_screen during picture dismissal"); }
void enter_conversation_mode_screen(void) { TEST_FAIL_MESSAGE("Unexpected enter_conversation_mode_screen during picture dismissal"); }
void exit_talk_mode(void) { TEST_FAIL_MESSAGE("Unexpected exit_talk_mode during picture dismissal"); }

void transitions_fixture_reset(void)
{
    alloc_count = frees = opens = blits = clicks = dungeon_redraws = 0;
    clock_units = 0;
    dismiss_event = 1;
    missing_resource = 0;
    memset(allocations, 0, sizeof allocations);
    memset(file_handles, 0, sizeof file_handles);
    options_set("data-dir", UW_TEST_DATA_DIR);
    memset(image, 0, sizeof image);
    DAT_00101a70 = (uintptr_t)image;
    g_uw_framebuffer = framebuffer;
    memset(framebuffer, 0, sizeof framebuffer);
    memset(hardware_framebuffer, 0, sizeof hardware_framebuffer);
    presents = testing_game_tick = input_opens_window = 0;
    testing_fade = intro_fade_test = palette_installs = 0;
    memset(installed_palette_flags, 0, sizeof installed_palette_flags);
    memset(last_installed_palette, 0, sizeof last_installed_palette);
    fade_samples = 0;
    fade_clock_ms = 0;
    fade_present_ms = 16;
    g_new_game_entry_pause_pending = false;
    entry_pauses = entry_pause_sample = 0;
    testing_entry_tick = 0;
    first_dungeon_draw_sample = -1;
    testing_menu = menu_polls = menu_dismissal_sent = menu_visible_before_close = 0;
    input_opens_prompt = prompt_polls = prompt_event = prompt_visible_before_input = 0;
    DAT_0023cdb8 = 2; DAT_0023cdbc = 480; DAT_0023cdc0 = 16;
    DAT_00088954 = DAT_00088950 = 0;
    DAT_0008895c = 200; DAT_00088958 = 320;
    g_force_flush = 0;
    g_selected_object = &selected_window;
    DAT_0023c63c = 1;
    DAT_00201b64 = DAT_00201c90 = 0;
    FILE *palette = fopen(UW_TEST_DATA_DIR "/DATA/PALS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(palette);
    TEST_ASSERT_EQUAL_UINT(768, fread(DAT_00088d98_backing, 1, 768, palette));
    TEST_ASSERT_EQUAL_INT(0, fclose(palette));
    byte rgb[768];
    expand_pals_bytes(rgb, DAT_00088d98_backing, 0);
    build_rgb565_palette(rgb, -1);
    memcpy(gameplay_palette, g_palette_rgb565_backing, sizeof gameplay_palette);
    opening_click_pending = 1;
    releases = 0;
    opening_hold_polls = 4;
    idle_polls = dismissal_sent = 0;
    DAT_002506aa = 0;
    DAT_002506ab = 1;
    DAT_0023c63c = 0;
    DAT_00204850 = 2;
    DAT_00086968 = DAT_0008696e = -1;
    DAT_0023c448 = 0;
    DAT_00201c84 = 0;
    strcpy((char *)DAT_0023c698_backing, "\\CUTS");
}
void transitions_fixture_dispose(void)
{
    for (int i = 0; i < 4; i++) if (file_handles[i] > 0) uw_file_close(file_handles[i]);
    for (int i = 0; i < alloc_count; i++) if (allocations[i]) free(allocations[i]);
}

int uw_always_show_cursor(void) { return 0; }
void clear_ambient_sound_target_thunk(void) { clear_ambient_sound_target(); }
void *chrbtns_bump_alloc_entry(uint size) { TEST_FAIL_MESSAGE("Unexpected chargen allocation callback"); return NULL; }
int chrbtns_offset_table_builder(void *index, uint kind, int entry)
{ TEST_FAIL_MESSAGE("Unexpected chargen resource callback"); return 0; }


void dirty_rect_set(int top, int bottom, int left, int right)
{ DAT_00088954 = top; DAT_0008895c = bottom; DAT_00088950 = left; DAT_00088958 = right; }
void dispatch_sticky_mode_handlers(void)
{
    if (DAT_00201c84 & 1) {
        DAT_00201c84 &= ~1;
        DAT_00085668_real_table[0]();
    }
    if (DAT_00201c84 & 2) DAT_00085668_real_table[1]();
    DAT_00201c84 = 0;
    /* Other HUD handlers may request their own intermediate flush. */
    flush_dirty_rect_to_display(1);
}
void uw_debug_blit_pick_buffer(void) {}
void render_dungeon_view_frame(void) {}
void uw_debug_draw_inv_hotspot_positions(void) {}
void dbgui_draw(void) {}
void populate_debug_panel(void) {}
/* Screen-transition fixtures keep the real background files and palette
   data; unrelated character choices and dungeon rendering are stubbed. */
char *DAT_001005c4, *DAT_001005c8, *DAT_000fb858;
undefined1 DAT_000fb860_backing[32], DAT_000fb8f0_backing[1680];
undefined1 DAT_0023cca8_backing[1024];
int DAT_00201c98;
char s_chrbtns_00084ef8[] = "chrbtns";
char s__DATA_skills_dat_00084ee4[] = "\\DATA\\skills.dat";
char s__DATA_chrgen_dat_00084ed0[] = "\\DATA\\chrgen.dat";
char s_FONTCHAR_SYS_00084ec0[] = "FONTCHAR.SYS";
char s_FONT5X6P_SYS_00084e9c[] = "FONT5X6P.SYS";
char s__DATA_CHARGEN_BYT_00084eac[] = "\\DATA\\CHARGEN.BYT";
char s__DATA_main_byt_000857a8[] = "\\DATA\\main.byt";
int character_screen_inputs;
char *LAB_000255b4(void) { return NULL; }
undefined4 LAB_000255d0(void) { return 0; }
uint load_gr_resource_entries(char *path, int first_entry, short count, void *(*allocator)(), int (*post_process)()) { (void)path; (void)first_entry; (void)count; (void)allocator; (void)post_process; return 1; }
int reset_dialogue_speech_state(void) { return 0; }
void chargen_ui_transition_hook(int is_press) { (void)is_press;}
void init_new_character_record(int mode) { (void)mode;}
void report_fatal_error_and_exit(ushort error_code) { (void)error_code; TEST_FAIL_MESSAGE("Screen resources must load"); }
void set_viewport_clip_rect(short left, short top, short right, short bottom) { (void)left; (void)top; (void)right; (void)bottom;}
bool read_buffer_from_file(char *path, void *buffer, int count)
{
    int handle = uw_file_open_read(path);
    TEST_ASSERT_GREATER_THAN_INT(0, handle);
    int bytes = uw_file_read(handle, buffer, count);
    uw_file_close(handle);
    return bytes == count;
}
bool load_pals_bank(int bank, void *buffer)
{
    FILE *file = fopen(UW_TEST_DATA_DIR "/DATA/PALS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, bank * 768, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(768, fread(buffer, 1, 768, file));
    fclose(file);
    byte rgb[768];
    expand_pals_bytes(rgb, buffer, 0);
    build_rgb565_palette(rgb, bank);
    return true;
}
int character_generator_loop(char *tree_data, char *scratch_data, char *field_records)
{
    character_screen_inputs++;
    TEST_ASSERT_EQUAL_UINT(9, fade_samples);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(320, fade_clock_ms);
    TEST_ASSERT_GREATER_THAN_UINT(0, fade_brightness[8]);
    for (unsigned step = 1; step < 8; step++)
        TEST_ASSERT_TRUE(fade_brightness[step] > fade_brightness[step - 1]);
    return 0; /* Cancel after verifying the initial screen. */
}
void unregister_game_view_interact_zones(void) {}
void configure_dungeon_viewport(int x, int y, int width, int height) { (void)x; (void)y; (void)width; (void)height;}
void enter_dungeon_view_hud_init(void) {}
void refresh_player_equipment_effects(void) {}
void full_dungeon_redraw(void)
{
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    flush_dirty_rect_to_display(1);
}
void weapon_overlay_and_full_redraw(void) { flush_dirty_rect_to_display(1); }
undefined2 DAT_000868d8;
int DAT_002046f8;
void enter_pause_menu_state(short state)
{
    TEST_ASSERT_EQUAL_INT(6, state);
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0x001f;
    dirty_rect_union(0, 200, 0, 320);
}
void get_mouse_position(ushort *out_x, ushort *out_y) { (void)out_x; (void)out_y; TEST_FAIL_MESSAGE("Menu regression uses the keyboard"); }
void handle_pause_menu_region_click(int region, short click_y) { (void)region; (void)click_y; TEST_FAIL_MESSAGE("Menu regression uses the keyboard"); }
void handle_pause_menu_dpad_navigation(short key_code) { (void)key_code; TEST_FAIL_MESSAGE("Menu regression closes without taking an action"); }
void close_ui_panel_return_to_game(void) { DAT_000868d8 = 0; DAT_002046f8 = 1; }
int g_text_input_active;
undefined4 g_scroll_control_codes_enabled;
short DAT_0025070c;
undefined *DAT_00250704;
undefined s_dash_000879a4_backing[8192] = "-";
undefined s_scroll_prompt_arrow_000879a8_backing[8192] = ">";
short prompt_panel[16], prompt_font[8];
void select_msg_scroll_mode_normal(void) {}
int message_scroll_print_wrapped(char *text)
{
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0x001f;
    dirty_rect_union(0, 200, 0, 320);
    return 0;
}
void set_draw_color(short color_index) { (void)color_index;}
void rect_fill_or_save_restore(ushort left, uint top, short right, short bottom) { (void)left; (void)top; (void)right; (void)bottom;}
void uw_debug_dump_sprite_frames_once(void) {}
void uw_debug_dump_critter_sheet_once(void) {}
void uw_debug_force_item_id_once(void) {}
void tick_weapon_swing_state(short attack_direction) { (void)attack_direction;}
void poll_input_bindings(void *input_state)
{
    if (input_opens_prompt) {
        prompt_start_presents = presents;
        TEST_ASSERT_EQUAL_INT(0xd, scroll_text_entry_prompt("Move how many?", "1", prompt_answer, 0, 3));
    }
    if (input_opens_window) {
        int saved_presents = presents;
        testing_game_tick = 0;
        display_book_or_scroll_page(0x100);
        testing_game_tick = 1;
        TEST_ASSERT_GREATER_THAN_INT(saved_presents, presents);
        TEST_ASSERT_EQUAL_INT(0, g_force_flush);
    }
}

int dungeon_palette_cycle_tick() { return 0; }
void redraw_lit_light_source_widgets() {}

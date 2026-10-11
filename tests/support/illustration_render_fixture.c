#include "game_fixture.h"
#include "src/headers/options.h"
#include "illustration_render_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
int babl_render_op_wrap_message(byte *op_args, intptr_t render_state);
int babl_render_op_say(intptr_t op_args, intptr_t render_state);
int babl_render_op_play_sound(void);
void *ce_malloc(unsigned int count);
void *ce_calloc(unsigned int count, unsigned int size);
void *ce_memmove(void *p, void *source, unsigned int count);
void apply_palette_buffer(void *palette, int unused);
void LocalFree(void *p);
long GetTickCount(void);
long Sleep(unsigned int ms);
int open_file_for_read(const char *path);
int read_file_handle(int handle, void *p, unsigned int count);
int seek_file_handle(int handle, int offset, int origin);
uint read_realtime_clock_units(void);
long TranslateMessage(const void *message);
long DispatchMessageW(const void *message);
long _isctype(int c, int mask);
long ce_tolower(long key);
long ce_toupper(long key);
void noop_key_handler(void);
void update_mouse_state(void);
void debug_framebuffer_dump(const char *tag);
void tick_book_illustration_palette_cycles(ushort *cycle_record);
void clear_ambient_sound_target(void);
void voice_sample_cluster_stub_1(void);
void voice_sample_cluster_stub_2(void);
void advance_menu_music_track(void);
void stop_voice_sample(void);
void clear_screen_and_restore_cursor(void);
void clear_ambient_sound_target_thunk(void);
void draw_text_string(char *text, short x, short y);
int measure_text_width(char *text);
void assert_visible_picture(void);
int get_audio_subsystem_flag(void);
int play_numbered_voice_sample(short sample_number);
bool is_voice_sample_finished(void);
int play_music_track(byte track_number, int flags);
bool select_active_font(char *font_filename);
bool set_palette_bank(int bank);
void decrement_cursor_hide_depth(void);
void load_dungeon_texture_arenas(void);
void change_game_mode(int mode);
int cursor_show_idle_tick(void);
int uw_defer_present(void);
int uw_take_completed_frame(void);
void *GXBeginDraw(void);
void assert_visible_picture(void);
void render_dungeon_frame_timed(void);
void enter_dungeon_view(void);
int dungeon_view_anim_tick(void);
void refresh_equipment_display_if_visible(void);
void handle_game_victory_sequence(void);
void movement_pacing_handler(void);
void sync_player_stats_to_hud(void);
void hud_panel_redraw_dispatch(void);
void enter_automap_screen(void);
void exit_automap_screen(void);
void enter_conversation_mode_screen(void);
void exit_talk_mode(void);
void dirty_rect_set(int top, int bottom, int left, int right);
void dispatch_sticky_mode_handlers(void);
void uw_debug_blit_pick_buffer(void);
void render_dungeon_view_frame(void);
void uw_debug_draw_inv_hotspot_positions(void);
void populate_debug_panel(void);
void dbgui_draw(void);
void uw_debug_dump_sprite_frames_once(void);
void uw_debug_dump_critter_sheet_once(void);
void uw_debug_force_item_id_once(void);
void tick_weapon_swing_state(short attack_direction);
void poll_input_bindings(void *input_state);

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

ushort gameplay_palette[256];

char opened[4][260];

const babl_render_op_fn PTR_FUN_00085408[16] = {
    (babl_render_op_fn)babl_render_op_wrap_message, (babl_render_op_fn)FUN_000362e8, (babl_render_op_fn)FUN_00036300, (babl_render_op_fn)FUN_00036308,
    (babl_render_op_fn)FUN_00036394, (babl_render_op_fn)FUN_000363f0, (babl_render_op_fn)FUN_00036404, (babl_render_op_fn)FUN_00036418,
    (babl_render_op_fn)babl_render_op_show_code, (babl_render_op_fn)FUN_000365bc, (babl_render_op_fn)FUN_000365fc, (babl_render_op_fn)FUN_0003663c,
    (babl_render_op_fn)FUN_00036698, (babl_render_op_fn)babl_render_op_say, (babl_render_op_fn)FUN_00036344, (babl_render_op_fn)babl_render_op_play_sound
};

int babl_render_op_wrap_message(byte *op_args, intptr_t render_state) { (void)op_args; (void)render_state; TEST_FAIL_MESSAGE("Unexpected text in window script"); return 0; }

int babl_render_op_say(intptr_t op_args, intptr_t render_state) { (void)op_args; (void)render_state; TEST_FAIL_MESSAGE("Unexpected voice in window script"); return 0; }

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

void *ce_memmove(void *p, void *source, unsigned int count) { return memcpy(p, source, count); }

void apply_palette_buffer(void *palette, int unused) { (void)palette; (void)unused; }

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

uint fake_tick_ms;

long GetTickCount(void) { return fake_tick_ms; }

long Sleep(unsigned int ms) { fake_tick_ms += ms; return 0; }

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

uint read_realtime_clock_units(void) { clock_units += 0x100; return clock_units; }

short DAT_00086968, DAT_0008696e, DAT_00204850;

undefined2 DAT_0008696a, DAT_0008696c;

short g_mouse_x, g_mouse_y;

ushort DAT_0023c448;
int DAT_000876c8;

undefined2 DAT_00201b60;

int DAT_0020484c;

undefined4 DAT_00204868;

char DAT_002506aa, DAT_002506ab;

short mouse_driver;

short *DAT_000876c4 = &mouse_driver;

char keyboard_case;

char *DAT_0008794c = &keyboard_case;

int opening_hold_polls, idle_polls, dismissal_sent;

long TranslateMessage(const void *message) { (void)message; return 0; }

long DispatchMessageW(const void *message) { (void)message; return 0; }

long _isctype(int c, int mask) { (void)c; (void)mask; return 0; }

long ce_tolower(long key) { return key; }

long ce_toupper(long key) { return key; }

int PeekMessageW(void *msg, void *hwnd, unsigned int low,
                unsigned int high, unsigned int remove)
{
    (void)msg; (void)hwnd; (void)low; (void)high; (void)remove;
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(1000, ++clicks, "Viewer never presented or dismissed");
    if (opening_click_pending) {
        if (opening_hold_polls-- > 0) return 1;
        opening_click_pending = 0;
        DAT_002506ab = 0;
        releases++;
        return 1;
    }
    if (blits > 0 && idle_polls++ >= 3 && !dismissal_sent) {
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

void tick_book_illustration_palette_cycles(ushort *cycle_record) { (void)cycle_record;}

void clear_ambient_sound_target(void) {}

void voice_sample_cluster_stub_1(void) {}

void voice_sample_cluster_stub_2(void) {}

void advance_menu_music_track(void) {}

void stop_voice_sample(void) {}

void clear_screen_and_restore_cursor(void) {}

void clear_ambient_sound_target_thunk(void) {}

void draw_text_string(char *text, short x, short y) { (void)text; (void)x; (void)y; TEST_FAIL_MESSAGE("Unexpected window text"); }

int measure_text_width(char *text) { (void)text; TEST_FAIL_MESSAGE("Unexpected window text"); return 0; }

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

ushort framebuffer[320 * 200], hardware_framebuffer[240 * 320];

int presents, testing_game_tick, input_opens_window;
int desktop_cursor;
int uw_always_show_cursor(void) { return desktop_cursor; }

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

void *GXBeginDraw(void) { return hardware_framebuffer; }

int GXEndDraw(void)
{
    if (uw_defer_present()) return 1;
    uw_take_completed_frame();
    presents++;
    if (!testing_game_tick) assert_visible_picture();
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
    if (testing_game_tick) flush_dungeon_frame();
}

void enter_dungeon_view(void) { TEST_FAIL_MESSAGE("Unexpected enter_dungeon_view during picture dismissal"); }

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

void illustration_render_fixture_reset(void)
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
    presents = testing_game_tick = input_opens_window = desktop_cursor = 0;
    DAT_0023cdb8 = 2; DAT_0023cdbc = 480; DAT_0023cdc0 = 16;
    DAT_00088954 = DAT_00088950 = 0;
    DAT_0008895c = 200; DAT_00088958 = 320;
    g_force_flush = 0;
    g_selected_object = &selected_window;
    DAT_0023c63c = 1;
    DAT_00201b64 = DAT_00201c90 = 0;
    uw_test_read_data("DATA/PALS.DAT", DAT_00088d98_backing, 768, 0, SEEK_SET);
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

void illustration_render_fixture_dispose(void)
{
    for (int i = 0; i < 4; i++) if (file_handles[i] > 0) uw_file_close(file_handles[i]);
    for (int i = 0; i < alloc_count; i++) if (allocations[i]) free(allocations[i]);
}

void dirty_rect_set(int top, int bottom, int left, int right)
{ DAT_00088954 = top; DAT_0008895c = bottom; DAT_00088950 = left; DAT_00088958 = right; }

void dispatch_sticky_mode_handlers(void)
{
    if (DAT_00201c84 & 2) DAT_00085668_real_table[1]();
    DAT_00201c84 = 0;
    /* Other HUD handlers may request their own intermediate flush. */
    flush_dirty_rect_to_display(1);
}

void uw_debug_blit_pick_buffer(void) {}

void render_dungeon_view_frame(void) {}

void uw_debug_draw_inv_hotspot_positions(void) {}

/* populate_debug_panel (hud.c) is its own function specifically so this
   suite's isolated extraction of main_loop_hud_flush doesn't also need
   fixtures for the object inspector's own dependencies (pick_object_
   under_cursor, get_message_string, g_monster_max_stats_table, ...) --
   see that function's own comment in hud.c. */
void populate_debug_panel(void) {}
void dbgui_draw(void) {}

void uw_debug_dump_sprite_frames_once(void) {}

void uw_debug_dump_critter_sheet_once(void) {}

void uw_debug_force_item_id_once(void) {}

void tick_weapon_swing_state(short attack_direction) { (void)attack_direction;}

void poll_input_bindings(void *input_state)
{
    if (input_opens_window) {
        int saved_presents = presents;
        testing_game_tick = 0;
        display_book_or_scroll_page(0x100);
        testing_game_tick = 1;
        TEST_ASSERT_GREATER_THAN_INT(saved_presents, presents);
        TEST_ASSERT_EQUAL_INT(0, g_force_flush);
    }
    flush_dirty_rect_to_display(1);
}

int dungeon_palette_cycle_tick() { return 0; }
void redraw_lit_light_source_widgets() {}

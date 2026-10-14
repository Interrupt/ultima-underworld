#include "weapon_ready_fixture.h"

static char character[256], attributes[256];
static ushort player[16];
char *DAT_00086df8, *DAT_0023be74;
uw_mobile_object_t *g_player_object;
short DAT_00201b68;
undefined2 DAT_00201b60, g_cursor_holding_state, g_cursor_mode, DAT_000868d8;
static short click_position[2];
short *DAT_00085a6c = click_position;
undefined1 DAT_0023c118_arr[9], DAT_0023c130, g_active_hud_panel;
undefined1 DAT_0023c11a, DAT_0023c11b, DAT_0023c12a;
undefined1 DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];
ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;
short DAT_0023c1ec;
char *g_selected_object;
undefined4 DAT_00204844;
unsigned char g_backpack_widget_to_slot_backing[0x17];
int weapon_sprite_loads;
int g_view_fullscreen;
void bitmap_blit_scaled_to_framebuffer(int x, int y, const char *pixels, int height, int width, double scale) { (void)x; (void)y; (void)pixels; (void)height; (void)width; (void)scale; }
static int initial_pending_action = -1;
static char initial_requested, initial_loaded;
static short initial_frame;
int DAT_0023c260, g_blit_transparent_mode;
undefined1 DAT_00204880_backing[128];
char *g_weapon_swing_current_frame;
void *g_weapon_swing_raw_frames[UW_WEAPON_SWING_FRAME_COUNT];
byte weapon_frame_x[UW_WEAPON_SWING_FRAME_COUNT];
byte weapon_frame_y[UW_WEAPON_SWING_FRAME_COUNT];
static char raw_frame[3] = {0, 1, 1}, decoded_pixel;
int weapon_draws;
static byte music_track;

void weapon_ready_fixture_reset(void)
{
    /* Preserve the production initializer rather than inventing a fixture
       default: this is the regression that differs from the ARM binary. */
    static int initial_overlay = -1;
    if (initial_pending_action == -1) {
        initial_pending_action = DAT_000870e0;
        initial_requested = DAT_000870d8;
        initial_loaded = DAT_000870dc;
        initial_frame = DAT_000870e4;
    }
    DAT_000870e0 = initial_pending_action;
    if (initial_overlay == -1) initial_overlay = g_weapon_overlay_enabled;
    g_weapon_overlay_enabled = initial_overlay;
    uw_test_create_character(character, attributes, player);
    memset(DAT_0023c118_arr, 0, sizeof DAT_0023c118_arr);
    DAT_0023c120 = DAT_0023c130 = 6;
    DAT_000870d8 = DAT_000870dc = 3; /* loaded fist sprites */
    DAT_000870e4 = -1;
    DAT_0023c260 = DAT_0023c1ec = 0;
    DAT_0023c1d8 = DAT_0023c1dc = DAT_0023c1e0 = 0;
    g_cursor_mode = g_cursor_holding_state = DAT_000868d8 = 0;
    DAT_00201b60 = 1;
    music_track = 0;
    weapon_draws = weapon_sprite_loads = 0;
    g_selected_object = NULL;
    for (int frame = 0; frame < UW_WEAPON_SWING_FRAME_COUNT; frame++)
        g_weapon_swing_raw_frames[frame] = raw_frame;
}

void weapon_ready_fixture_animate(void)
{
    for (int tick = 0; tick < 5; tick++) advance_action_animation_frame();
    weapon_swing_draw_tick();
}

/* Keep input, music, and bitmap services outside the tested mode and
   animation logic. The real draw function must reach its bitmap blit. */
void mode_icon_highlight_on(int mode) {}
void mode_icon_highlight_off(int mode) {}
void push_cursor_icon(int icon) {}
void pop_cursor_icon(ushort depth) {}
void wait_for_click_release(int mode)
{
    TEST_ASSERT_EQUAL_INT(1, mode);
    if (g_selected_object) weapon_ready_fixture_animate();
}
void handle_pause_menu_region_click(int x, short y) { TEST_FAIL_MESSAGE("Unexpected pause click"); }
void run_pause_menu_modal_loop(short mode) { TEST_FAIL_MESSAGE("Unexpected pause menu"); }
byte get_current_music_track(void) { return music_track; }
void set_pending_music_track(byte track) { music_track = track; }
void pick_random_pending_music_track(void) { music_track = 0; }
void cancel_weapon_swing(void) {}
void set_pending_update_flags(ushort flags) {}
byte load_weapon_swing_sprites(void)
{
    weapon_sprite_loads++;
    DAT_000870dc = DAT_000870d8;
    return 1;
}
void randomize_weapon_jump_shake(short shake) {}
char *decode_gr_entry_bitmap(char *frame)
{
    TEST_ASSERT_EQUAL_PTR(raw_frame, frame);
    return &decoded_pixel;
}
void bitmap_blit_to_framebuffer(ushort x, ushort y, char *bitmap, short height, short width, short a, short b, byte transparent)
{
    TEST_ASSERT_EQUAL_PTR(&decoded_pixel, bitmap);
    weapon_draws++;
}
void draw_hud_icon_sprite(int sprite, int x, int y) {}

void weapon_ready_fixture_start_unloaded(void)
{
    DAT_000870d8 = initial_requested;
    DAT_000870dc = initial_loaded;
    DAT_000870e4 = initial_frame;
}
int poll_keyboard_char_input(void *buttons_) { short *buttons = (short *)buttons_; *buttons = 2; return 2; }
void get_mouse_position(ushort *x, ushort *y) { *x = *y = 0; }
int hit_test_inventory_widget(short x, short y) { return 0; }
int erase_cursor_icon(void) { return 0; }
void handle_backpack_slot_click(short slot) { TEST_FAIL_MESSAGE("Unexpected slot drop"); }
void handle_object_drop_target(short widget) { TEST_FAIL_MESSAGE("Unexpected object drop"); }

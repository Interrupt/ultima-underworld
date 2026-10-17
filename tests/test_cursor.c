#include "unity.h"
#include "src/headers/options.h"
#include "cursor_test_globals.h"

short g_mouse_x, g_mouse_y, DAT_00204788, DAT_00204840, DAT_0023c63c;
short DAT_0020471c, DAT_00204748, DAT_00204784, DAT_002047a4;
short DAT_00204838, DAT_0020483c, DAT_002047dc, DAT_002047d8;
undefined2 DAT_000868dc, g_cursor_mode, g_cursor_holding_state, g_game_mode;
undefined2 DAT_000a85c4, DAT_000a85c8, DAT_000842a4, DAT_000842a8;
undefined4 DAT_000bbef4, DAT_00204844;
int DAT_00204848, g_blit_transparent_mode, g_force_flush;
int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
char *g_selected_object;
void *g_uw_framebuffer;
static uint16_t game_pixels[320*240], display_pixels[320*240];
static int draws, saves, flushes, sprite_id, sprite_x, sprite_y;
static int presents;
static uint64_t present_time;
unsigned int g_uw_frame_clock_units;

/* Display service boundary: pacing and pending-request handling are real GX
   functions; emulate the final copy/composition instead of opening SDL. */
int GXEndDraw(void)
{
    if (!uw_present_frame_due(present_time)) return 1;
    memcpy(display_pixels,game_pixels,sizeof(game_pixels));
    uw_composite_desktop_cursor(display_pixels);
    ++presents;
    return 1;
}
undefined2 DAT_00204704;
ushort DAT_00202738;
void *g_grtile_registry[65536];
static byte cursor_header[5];

/* Registry services resolve to the real cursor entry's loaded header. */
uint resolve_sprite_id_to_frame(int id) { return 1; }
void *lookup_grtile_by_id(short frame) { return (char *)cursor_header; }

static void select_real_cursor(int id)
{
    FILE *file=fopen(UW_TEST_DATA_DIR "/DATA/CURSORS.GR","rb");
    TEST_ASSERT_NOT_NULL(file);
    byte offset[4];
    TEST_ASSERT_EQUAL_INT(0,fseek(file,3+4*(id-0x106c),SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(4,fread(offset,1,4,file));
    uint32_t position=offset[0]|(uint32_t)offset[1]<<8|
                      (uint32_t)offset[2]<<16|(uint32_t)offset[3]<<24;
    TEST_ASSERT_EQUAL_INT(0,fseek(file,position,SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(5,fread(cursor_header,1,5,file));
    fclose(file);
    g_grtile_registry[1]=cursor_header;
    set_cursor_sprite_id(id);
}

/* Sprite service boundary: a transparent 3x3 icon, with real viewport clipping.
   Rendering lifecycle, cursor gates, and dirty/viewport storage are game code. */
void draw_sprite_by_id(int id, int x, int y, int height, short width)
{
    ++draws; sprite_id=id; sprite_x=x; sprite_y=y;
    TEST_ASSERT_EQUAL_INT(1,g_blit_transparent_mode);
    dirty_rect_union(y,y+height,x,x+width);
    uint16_t *pixels=g_uw_framebuffer;
    for(int row=y; row<y+height; ++row)
        for(int col=x; col<x+width; ++col)
            if(row>=DAT_000a85c8 && row<=DAT_000842a8 &&
               col>=DAT_000a85c4 && col<=DAT_000842a4 &&
               (row!=y || col!=x)) pixels[row*320+col]=id;
}
void set_draw_color(short color) {}
void rect_fill_or_save_restore(ushort x, uint y, short right, short bottom) { ++saves; }
void flush_dirty_rect_to_display(int mode) { ++flushes; }

void setUp(void)
{
    for(int i=0;i<320*240;++i) game_pixels[i]=display_pixels[i]=42;
    g_uw_framebuffer=game_pixels;
    g_mouse_x=100; g_mouse_y=100;
    DAT_0020471c=1; DAT_00204748=1;
    DAT_00204784=3; DAT_002047a4=3; DAT_00204788=0x106c;
    DAT_00204840=DAT_0023c63c=DAT_000bbef4=0;
    DAT_00204844=DAT_00204848=0;
    g_selected_object=NULL; g_cursor_mode=g_cursor_holding_state=0;
    g_blit_transparent_mode=g_force_flush=0;
    DAT_000868dc=7; g_game_mode=0;
    set_viewport_clip_rect(20,30,40,50);
    dirty_rect_set(31,32,21,22);
    draws=saves=flushes=sprite_id=presents=0;
    present_time=100000;
    uw_reset_frame_pacing();
}
void tearDown(void) {}

static void test_overlay_ignores_stylus_gates_and_restores_render_state(void)
{
    DAT_000868dc=0; /* Menus also need a hover cursor. */
    g_game_mode=0xcf; g_cursor_mode=3;
    DAT_00204840=-2;
    uw_composite_desktop_cursor(display_pixels);
    TEST_ASSERT_EQUAL_INT(1,draws);
    TEST_ASSERT_EQUAL_HEX16(0x106c,display_pixels[100*320+100]);
    TEST_ASSERT_EQUAL_HEX16(42,display_pixels[99*320+99]);
    TEST_ASSERT_EQUAL_UINT16_ARRAY(game_pixels,display_pixels,99*320+99);
    TEST_ASSERT_EQUAL_HEX16(42,game_pixels[100*320+100]);
    TEST_ASSERT_EQUAL_PTR(game_pixels,g_uw_framebuffer);
    TEST_ASSERT_EQUAL_INT(0,g_blit_transparent_mode);
    TEST_ASSERT_EQUAL_INT(20,DAT_000a85c4);
    TEST_ASSERT_EQUAL_INT(30,DAT_000a85c8);
    TEST_ASSERT_EQUAL_INT(40,DAT_000842a4);
    TEST_ASSERT_EQUAL_INT(50,DAT_000842a8);
    TEST_ASSERT_EQUAL_INT(31,DAT_00088954);
    TEST_ASSERT_EQUAL_INT(32,DAT_0008895c);
    TEST_ASSERT_EQUAL_INT(21,DAT_00088950);
    TEST_ASSERT_EQUAL_INT(22,DAT_00088958);
    TEST_ASSERT_EQUAL_INT(0,flushes);
}
static void test_moving_item_cursor_does_not_stamp_or_restore_old_pixels(void)
{
    g_selected_object=(char *)game_pixels;
    DAT_00204788=123;
    uw_composite_desktop_cursor(display_pixels);
    TEST_ASSERT_EQUAL_INT(123,sprite_id);
    TEST_ASSERT_EQUAL_HEX16(123,display_pixels[100*320+100]);
    game_pixels[100*320+100]=77;
    memcpy(display_pixels,game_pixels,sizeof(game_pixels)); /* Next GX present. */
    g_mouse_x=110;
    draw_idle_mouse_cursor(); save_cursor_background();
    DAT_00204844=2;
    TEST_ASSERT_EQUAL_INT(2,erase_cursor_icon()); /* Preserve click-pending flag. */
    uw_composite_desktop_cursor(display_pixels);
    TEST_ASSERT_EQUAL_HEX16(77,display_pixels[100*320+100]);
    TEST_ASSERT_EQUAL_HEX16(123,display_pixels[100*320+110]);
    TEST_ASSERT_EQUAL_HEX16(42,game_pixels[100*320+110]);
    TEST_ASSERT_EQUAL_INT(0,saves);
    TEST_ASSERT_EQUAL_INT(0,flushes);
    TEST_ASSERT_EQUAL_INT(0,DAT_00204848);
}
static void test_stationary_target_cursor_survives_new_frame_and_hide_calls(void)
{
    g_cursor_mode=3; DAT_00204788=0x1077;
    uw_composite_desktop_cursor(display_pixels);
    decrement_cursor_hide_depth();
    memset(display_pixels,0,sizeof(display_pixels));
    uw_composite_desktop_cursor(display_pixels);
    TEST_ASSERT_EQUAL_HEX16(0x1077,display_pixels[100*320+100]);
    TEST_ASSERT_EQUAL_INT(2,draws);
    TEST_ASSERT_EQUAL_INT(0,flushes);
}
static void test_overlay_clips_screen_edges_and_skips_uninitialized_sprite(void)
{
    const short corners[][2]={{0,0},{319,0},{0,199},{319,199}};
    for(int i=0;i<4;++i) {
        g_mouse_x=corners[i][0]; g_mouse_y=corners[i][1];
        uw_composite_desktop_cursor(display_pixels);
        TEST_ASSERT_EQUAL_HEX16(0x106c,display_pixels[g_mouse_y*320+g_mouse_x]);
    }
    TEST_ASSERT_EQUAL_HEX16(42,display_pixels[200*320]);
    DAT_00204784=0;
    uw_composite_desktop_cursor(display_pixels);
    uw_composite_desktop_cursor(NULL);
    TEST_ASSERT_EQUAL_INT(4,draws);
}
static void test_stylus_mode_retains_touch_visibility_and_background_save(void)
{
    uw_composite_desktop_cursor(display_pixels);
    draw_idle_mouse_cursor();
    TEST_ASSERT_EQUAL_INT(0,draws);
    DAT_0023c63c=1;
    draw_idle_mouse_cursor();
    TEST_ASSERT_EQUAL_INT(1,draws);
    TEST_ASSERT_EQUAL_INT(1,saves);
    TEST_ASSERT_EQUAL_INT(1,DAT_00204848);
    TEST_ASSERT_EQUAL_INT(1,erase_cursor_icon());
    TEST_ASSERT_EQUAL_INT(2,saves);
}
static void test_automap_cursor_uses_lower_left_hotspot_in_desktop_mode(void)
{
    select_real_cursor(0x1078);
    TEST_ASSERT_EQUAL_INT(43,DAT_00204784);
    TEST_ASSERT_EQUAL_INT(15,DAT_002047a4);
    TEST_ASSERT_EQUAL_INT(0,DAT_0020471c);
    TEST_ASSERT_EQUAL_INT(14,DAT_00204748);
    uw_composite_desktop_cursor(display_pixels);
    TEST_ASSERT_EQUAL_INT(g_mouse_x,sprite_x);
    TEST_ASSERT_EQUAL_INT(g_mouse_y-14,sprite_y);
    TEST_ASSERT_EQUAL_INT(g_mouse_y,sprite_y+DAT_002047a4-1);
    TEST_ASSERT_EQUAL_HEX16(42,display_pixels[(g_mouse_y+1)*320+g_mouse_x]);
    TEST_ASSERT_EQUAL_HEX16(42,display_pixels[g_mouse_y*320+g_mouse_x-1]);
    TEST_ASSERT_EQUAL_HEX16(0x1078,display_pixels[g_mouse_y*320+g_mouse_x]);
    select_real_cursor(0x106c);
    TEST_ASSERT_EQUAL_INT(7,DAT_0020471c); /* Leaving map restores centering. */
    TEST_ASSERT_EQUAL_INT(7,DAT_00204748);
    select_real_cursor(0x1077);
    TEST_ASSERT_EQUAL_INT(5,DAT_0020471c); /* Target cursors stay centered. */
    TEST_ASSERT_EQUAL_INT(5,DAT_00204748);
}
static void test_stylus_automap_cursor_keeps_original_centered_hotspot(void)
{
    select_real_cursor(0x1078);
    TEST_ASSERT_EQUAL_INT(20,DAT_0020471c);
    TEST_ASSERT_EQUAL_INT(7,DAT_00204748);
}

static void test_note_cursor_presents_without_mouse_motion_or_typing(void)
{
    select_real_cursor(0x1078);
    uw_service_pending_present(present_time);
    TEST_ASSERT_EQUAL_INT(1,presents);
    TEST_ASSERT_EQUAL_INT(0x1078,sprite_id);
    select_real_cursor(0x107a); /* Note editor's push_cursor_icon. */
    TEST_ASSERT_EQUAL_INT(1,presents); /* No extra flush in this display slot. */
    present_time+=16667;
    uw_service_pending_present(present_time); /* Modal input poll, no events. */
    TEST_ASSERT_EQUAL_INT(2,presents);
    TEST_ASSERT_EQUAL_INT(0x107a,sprite_id);
    TEST_ASSERT_EQUAL_INT(100,g_mouse_x);
    TEST_ASSERT_EQUAL_INT(100,g_mouse_y);
    TEST_ASSERT_EQUAL_HEX16(42,game_pixels[100*320+100]);
    TEST_ASSERT_EQUAL_INT(0,saves);
    TEST_ASSERT_EQUAL_INT(0,flushes);
    present_time+=16667;
    uw_service_pending_present(present_time);
    TEST_ASSERT_EQUAL_INT(2,presents); /* The request was consumed. */
    select_real_cursor(0x1078); /* Leaving the editor also redraws. */
    uw_service_pending_present(present_time);
    TEST_ASSERT_EQUAL_INT(3,presents);
    TEST_ASSERT_EQUAL_INT(0x1078,sprite_id);
}
static void test_stylus_sprite_change_does_not_queue_desktop_presentation(void)
{
    select_real_cursor(0x107a);
    uw_service_pending_present(present_time);
    TEST_ASSERT_EQUAL_INT(0,presents);
}

int main(int argc,char **argv)
{
    int stylus=argc>1 && strcmp(argv[1],"--stylus")==0;
    if(stylus) options_set("always-show-cursor", "0");
    else if(argc>1) options_set("always-show-cursor", "1");
    else options_unset("always-show-cursor");
    UNITY_BEGIN();
    TEST_ASSERT_EQUAL_INT(!stylus,uw_always_show_cursor());
    if(stylus) {
        RUN_TEST(test_stylus_mode_retains_touch_visibility_and_background_save);
        RUN_TEST(test_stylus_automap_cursor_keeps_original_centered_hotspot);
        RUN_TEST(test_stylus_sprite_change_does_not_queue_desktop_presentation);
    }
    else {
        RUN_TEST(test_note_cursor_presents_without_mouse_motion_or_typing);
        RUN_TEST(test_automap_cursor_uses_lower_left_hotspot_in_desktop_mode);
        RUN_TEST(test_overlay_ignores_stylus_gates_and_restores_render_state);
        RUN_TEST(test_moving_item_cursor_does_not_stamp_or_restore_old_pixels);
        RUN_TEST(test_stationary_target_cursor_survives_new_frame_and_hide_calls);
        RUN_TEST(test_overlay_clips_screen_edges_and_skips_uninitialized_sprite);
    }
    return UNITY_END();
}

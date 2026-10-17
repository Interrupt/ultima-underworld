#include "automap_fixture.h"
#include "src/headers/options.h"
#include "game_fixture.h"
#include <sys/stat.h>
#include <unistd.h>

short DAT_000bbef0, DAT_000ba9d0;
int DAT_000bbefc;
undefined2 DAT_000b99c0, DAT_000b99c8;
undefined4 DAT_000b99c4, DAT_000bbef4, DAT_000bbef8, DAT_00204844;
undefined1 DAT_000ba9d8_backing[32768];
undefined1 DAT_000b98b8_backing[32768], DAT_000b58b8_backing[8448];
char s__SAVE0_lev_ark_000842fc[]="\\SAVE0\\lev.ark";
char s__arc_tmp_000842b4[]="_arc.tmp";
char s_font4x5p_sys_0008431c[]="font4x5p.sys", s_font5x6p_sys_0008430c[]="font5x6p.sys";
static byte draw_color;
byte *g_draw_color_index=&draw_color, *DAT_00084298=&draw_color;
short DAT_00201b68=1;
undefined2 g_game_mode;
short g_mouse_x, g_mouse_y, DAT_00204788, DAT_00204840, DAT_0023c63c;
short DAT_0020471c, DAT_00204748, DAT_00204784, DAT_002047a4;
short DAT_00204838, DAT_0020483c, DAT_002047dc, DAT_002047d8;
undefined2 DAT_000868dc=7, g_cursor_mode;
undefined2 g_cursor_holding_state;
int DAT_00204848, g_blit_transparent_mode, g_force_flush;
undefined2 DAT_000a85c0, DAT_000a85c4, DAT_000a85c8, DAT_000842a4, DAT_000842a8;
undefined2 DAT_000879b8_backing[32768];
char *g_selected_object;
int automap_text_draws;
char automap_drawn_text[100][52];
short automap_drawn_x[100], automap_drawn_y[100];
char automap_test_directory[256];
static char *prior_data_directory;
static short click_position[4];
short *DAT_00085a6c=click_position;
static const char *note_input;

bool select_active_font(char *font) { return true; }
void draw_text_string(char *text, short x, short y)
{
    TEST_ASSERT_LESS_THAN_INT(100,automap_text_draws);
    snprintf(automap_drawn_text[automap_text_draws],52,"%s",text);
    automap_drawn_x[automap_text_draws]=x;
    automap_drawn_y[automap_text_draws++]=y;
}
int uw_always_show_cursor(void) { return 0; }
void flush_dirty_rect_to_display(int mode) {}
void dirty_rect_union(int top,int bottom,int left,int right) {}
void draw_sprite_by_id(int id, int x, int y, int height, short width)
{
    for(int row=y;row<y+height;++row)
        for(int col=x;col<x+width;++col)
            automap_pixels[row*320+col]=0xf800;
}
/* Lifecycle UI services: keep actual close/save and open/load paths. */
int register_key_binding(int key,int mode,int flags,void *callback) { return 1; }
void change_game_mode(int mode) {}
void set_pending_music_track(byte track) {}
void update_ingame_music_track(void) {}
int save_automap_reveal_to_archive(byte *archive, int level) { return 1; }
int load_automap_reveal_from_archive(byte *archive, int level) { return 1; }
void draw_automap_screen(int level)
{
    DAT_000ba9d0=level;
    load_automap_notes_from_archive(level);
    DAT_000bbef4=1;
}
int register_click_region(int left, int bottom, int right, int top, short flags, short mode, void *handler) { return 1; }
void wait_for_click_release(int mode) {}
int measure_text_width(char *text) { return strlen(text)*4; }
uint poll_input_event(int mode) { return *note_input ? *note_input++ : 13; }
int poll_keyboard_char_input(void *key_) { short *key = (short *)key_; *key=0; return 0; }
int next_input_event(void) { return 1; }
void update_hotspot_cursor_icon(void) {}
void screen_backup_restore_rect(uint x, uint y, uint right, uint bottom) {}
void switch_automap_level_display(int level) {}
void set_cursor_confine_rect(short left, short bottom, short right, short top) {}
void reset_cursor_confine_rect(void) {}
void push_cursor_icon(int id) { DAT_00204788=id; }
void pop_cursor_icon(ushort mode) {}
void unregister_key_binding(short id) {}
void pick_random_pending_music_track(void) {}
void clear_screen_and_restore_cursor(void) {}

void automap_fixture_add_note(const char *text,short x,short y)
{
    TEST_ASSERT_LESS_THAN_INT(100,DAT_000bbef0);
    byte *note=DAT_000ba9d8_backing+DAT_000bbef0++*54;
    snprintf((char *)note,50,"%s",text);
    memcpy(note+50,&x,2);
    memcpy(note+52,&y,2);
    DAT_000b99c4=1;
}
void automap_fixture_type_note(const char *text,short x,short y)
{
    note_input=text;
    click_position[0]=x; click_position[1]=200-y-4; click_position[3]=0;
    handle_automap_note_click();
}
void automap_storage_fixture_reset(void)
{
    char path[512];
    /* file_io caches its data directory for the process lifetime. */
    if (!automap_test_directory[0]) {
        const char *old=getenv("UW_DATA_DIR");
        prior_data_directory=old ? strdup(old) : NULL;
        snprintf(automap_test_directory,sizeof automap_test_directory,"/tmp/uw-automap-notes-XXXXXX");
        TEST_ASSERT_NOT_NULL(mkdtemp(automap_test_directory));
        snprintf(path,sizeof path,"%s/SAVE0",automap_test_directory);
        TEST_ASSERT_EQUAL_INT(0,mkdir(path,0700));
        options_set("data-dir", automap_test_directory);
    }
    uint offsets[64]={0};
    offsets[0]=2+sizeof offsets;
    FILE *file=uw_file_fopen("\\SAVE0\\lev.ark","wb");
    TEST_ASSERT_NOT_NULL(file);
    ushort count=64;
    TEST_ASSERT_EQUAL_UINT(1,fwrite(&count,2,1,file));
    TEST_ASSERT_EQUAL_UINT(64,fwrite(offsets,4,64,file));
    TEST_ASSERT_EQUAL_UINT(8,fwrite("LEVELONE",1,8,file));
    TEST_ASSERT_EQUAL_INT(0,fclose(file));
    memset(DAT_000ba9d8_backing,0,sizeof DAT_000ba9d8_backing);
    DAT_000bbef0=0; DAT_000b99c4=0; DAT_000bbefc=0;
    DAT_000ba9d0=DAT_00201b68=1;
    automap_text_draws=0;
    memset(automap_drawn_text,0,sizeof automap_drawn_text);
    DAT_000bbef4=1; DAT_00204844=0; DAT_00204840=1;
    g_mouse_x=50; g_mouse_y=50; DAT_00204788=0x1078;
    DAT_0020471c=DAT_00204748=0;
    DAT_00204784=DAT_002047a4=4;
    DAT_00204838=DAT_0020483c=0; DAT_002047dc=319; DAT_002047d8=199;
    DAT_000a85c4=DAT_000a85c8=0; DAT_000842a4=319; DAT_000842a8=199;
    DAT_00204848=0; g_cursor_mode=0; g_selected_object=NULL; g_game_mode=0;
}
void automap_storage_fixture_dispose(void)
{
    char path[512];
    snprintf(path,sizeof path,"%s/SAVE0/lev.ark",automap_test_directory); unlink(path);
    snprintf(path,sizeof path,"%s/SAVE0/_arc.tmp",automap_test_directory); unlink(path);
}
void automap_storage_fixture_finish(void)
{
    char path[512];
    snprintf(path,sizeof path,"%s/SAVE0",automap_test_directory); rmdir(path);
    rmdir(automap_test_directory);
    if(prior_data_directory) { options_set("data-dir", prior_data_directory); free(prior_data_directory); }
    else options_unset("data-dir");
}

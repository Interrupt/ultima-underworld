#include "unity.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
#include "game_fixture.h"
#include "door_models_fixture.h"
#include "src/headers/debug_ui.h"
double g_tune_rotation_offset;
int g_tune_last_catalog;
short DAT_00189584;
undefined2 DAT_00189586;
undefined1 DAT_00086d60_backing[64];

/* Load the shipped meshes' points. Faces/textures are outside this fixture;
   the real emitter and transformation functions still produce world vertices. */
static int model[4096];
static ushort door[4];
static char character[256];
static uw_mobile_object_t player;
static char draw_commands[8192];
static void load_points(const char *name)
{
    char path[1024], line[256];
    snprintf(path, sizeof(path), "%s/DATA3D/%s.E", UW_TEST_DATA_DIR, name);
    FILE *file = fopen(path, "r");
    TEST_ASSERT_NOT_NULL(file);
    memset(model, 0, sizeof model);
    while (fgets(line, sizeof line, file) && !strstr(line, "POINTS")) {}
    while (fgets(line, sizeof line, file)) {
        float x,y,z;
        if (strchr(line,'}')) break;
        if (sscanf(line," %f, %f, %f;", &x,&y,&z) == 3) {
            float *p = (float *)((char *)model + 8 + model[0] * 12);
            p[0]=x; p[1]=y; p[2]=z;
            model[0]++;
        }
    }
    fclose(file);
    TEST_ASSERT_GREATER_THAN_INT(0, model[0]);
}
void *tick_anim_record(short catalog)
{
    load_points(catalog == 1 ? "DFRAME" : "DOOR");
    return model;
}
void door_models_reset(void)
{
    memset(&player, 0, sizeof player);
    memset(door, 0, sizeof door);
    g_player_object = (uw_mobile_object_t *)(ushort *)&player;
    DAT_00086df8 = character;
    g_tune_last_catalog = -1;
    /* DAT_000d9930_arr/DAT_000d9ed8_arr are 361-entry (0..360 degrees)
       tables -- matches production's build_trig_tables loop (`iVar2<0x169`,
       src/3d.c) and the sizing-audit array sizes below (512->361, fixed in
       fcada22). That commit shrank the declarations but missed this fill
       loop, which still wrote indices up to 511: a 151-element (604-byte)
       overflow past DAT_000d9930_arr's own end, landing on the start of
       the immediately-following DAT_000d9ed8_arr and corrupting its
       low-degree cosine entries with stray sine values. Confirmed live:
       cos(90) came back as 1 (a sine-table leftover) instead of 0, so a
       door frame's opening point at local X=-64 picked up a spurious
       -64*cos(90)=-64 world-X shift at exactly the quarter-turn headings
       where cos should be 0 -- the "off by exactly 64" door_models
       failures. Bound this loop to the tables' own real size instead of
       a stale literal. */
    for (int angle=0; angle<361; angle++) {
        float s = sin(angle * 3.141592653589793 / 180.0);
        float c = cos(angle * 3.141592653589793 / 180.0);
        memcpy(&DAT_000d9930_arr[angle], &s, 4);
        memcpy(&DAT_000d9ed8_arr[angle], &c, 4);
    }
}
static const float *draw_at(int heading, int camera_heading, int progress,
                            int direction, int catalog, int x, int z,
                            int anchor_x, int anchor_z)
{
    memset(DAT_000a85d0_backing, 0, sizeof DAT_000a85d0_backing);
    DAT_0023b838 = DAT_0023b83c = 0;
    DAT_00110fc0 = draw_commands;
    DAT_0023b904 = anchor_x;
    DAT_0023b920 = anchor_z;
    DAT_0023b91c = 640;
    DAT_0023b4e4 = x; DAT_0023b4e8 = z;
    DAT_0023b4a0 = (camera_heading+1)/2 % 4;
    player.hdr.heading = camera_heading;
    door[1] = heading << 7;
    DAT_0018957a = direction * progress * 4096;
    emit_catalog_object(catalog, (char *)door, heading*2, -1);
    return (float *)((char *)DAT_000a85d0_backing + 8);
}
const float *door_models_draw(int heading, int camera_heading, int progress, int direction, int catalog)
{
    return draw_at(heading,camera_heading,progress,direction,catalog,
                   16,6,16*256+144,6*256+112);
}
const float *door_models_draw_level_one_frame(int x, int y, int camera_heading, int catalog)
{
    static byte level[UW_TEST_LEVEL_SIZE];
    uw_test_load_map(level, sizeof level, 1);
    ushort slot;
    memcpy(&slot,level+(x+y*64)*4+2,2);
    slot >>= 6;
    ushort *object = NULL;
    while (slot) {
        object=uw_test_level_object(level,sizeof level,slot);
        if ((object[0]&0x1f0)==0x140) break;
        slot=object[2]>>6;
    }
    TEST_ASSERT_NOT_EQUAL_UINT16(0,slot);
    byte offset[4]={0};
    DAT_0023b4a0=(camera_heading+1)/2%4;
    resolve_billboard_corner_offset(offset,(byte *)object);
    int heading=object[1]>>7&7;
    return draw_at(heading,camera_heading,0,1,catalog,x,y,
                   x*256+(char)offset[1]*32+16,y*256+(char)offset[2]*32+16);
}

/* Renderer storage; unrelated texture/input services are isolated below. */
short DAT_00086b24;
short DAT_00086b2c;
undefined2 DAT_00086b30;
undefined4 DAT_000a85d0_backing[16384];
short DAT_000b4620;
undefined4 DAT_000d9930_arr[361];
undefined4 DAT_000d9ed8_arr[361];
undefined2 DAT_000da47c;
undefined4 DAT_000db438;
undefined4 DAT_000db43c;
undefined4 DAT_000db440;
char *DAT_00110fc0;
undefined2 DAT_00189570_backing[16];
ushort DAT_0018957a;
ushort DAT_00189580;
undefined1 DAT_00202520_backing[1024];
undefined2 DAT_00202734;
char * DAT_002046c4;
byte DAT_0023b4a0;
byte DAT_0023b4e0;
short DAT_0023b4e4;
short DAT_0023b4e8;
undefined4 DAT_0023b804;
undefined1 DAT_0023b818;
ushort DAT_0023b81c;
undefined2 DAT_0023b824;
char DAT_0023b830;
char DAT_0023b834;
undefined4 DAT_0023b838;
int DAT_0023b83c;
ushort DAT_0023b904;
ushort DAT_0023b91c;
ushort DAT_0023b920;
byte DAT_0023bc88;
void * g_tile_texptr_emit[UW_MAX_VIS_TILES];
int g_uw_debug_pick_diag;
int g_uw_hide_walls;
void dbgui_begin(const char *s) {}
void dbgui_end(void) {}
void dbgui_field_double(const char *s,double *d,double step) {}
void dbgui_field_button(const char *s,void (*fn)(void)) {}
void dbgui_field_toggle(const char *s,int *n) {}
void uw_debug_request_3d_frame_dump(void) {}
int get_catalog_sprite_width(int id) { return id; }
void emit_floor_texture_select(byte *tile_record, uint depth, short texture_index) { (void)tile_record; (void)depth; (void)texture_index;}
void *get_texture_page(short id) { static char page[4096]; return page; }
void *lookup_grtile_by_id(short id) { static char gr[4096]={4,64,64}; return gr; }
byte *decompress_gr_bitmap(byte *source, byte *dest, char mode) { (void)source; (void)dest; (void)mode; return source; }
uint read_realtime_clock_units(void) { return 0; }

/* No DOS models in this suite: every face falls back to the original's
   one-colour-per-model behaviour. */
int uw_dos_model_face_colour(int dos_index, int part)
{
    (void)dos_index; (void)part;
    return -1;
}

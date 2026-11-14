#include "restored_tables_fixture.h"
undefined2 DAT_00100630_backing[32];
uw_melee_type_props_t g_melee_type_props[16];
uw_armor_type_props_t g_armor_type_props[32];
undefined4 DAT_0024cff8;
char *DAT_0024cfd4;
int restored_spawn_id, restored_scan_count;
int restored_message_kind, restored_message_id, restored_message_lparam;
undefined4 restored_message_window, restored_message_wparam;
void *restored_scan_objects[4];
static char character[256];
static ushort player[16];
void restored_tables_fixture_reset(void)
{
    memset(character, 0, sizeof character);
    memset(player, 0, sizeof player);
    DAT_00086df8=character;
    g_player_object = (uw_mobile_object_t *)player;
    DAT_0024cff8=0;
    DAT_0024cfd4=NULL;
    restored_spawn_id=-1;
    restored_message_kind=restored_message_id=restored_message_lparam=0;
    restored_message_window=restored_message_wparam=0;
    restored_scan_count=0;
    memset(restored_scan_objects, 0, sizeof restored_scan_objects);
    uw_test_read_data("DATA/CMB.DAT", DAT_00100630_backing, 60, 0, SEEK_SET);
    /* OBJECTS.DAT begins with a two-byte header. Class 0 supplies armor,
       then ranged records, then the four-byte accessory records. */
    FILE *file=uw_test_open_data("DATA/OBJECTS.DAT");
    ushort header;
    TEST_ASSERT_EQUAL_UINT(2, fread(&header, 1, 2, file));
    TEST_ASSERT_EQUAL_UINT(128,
                           fread(((byte *)g_melee_type_props), 1, 128, file));
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 48, SEEK_CUR));
    TEST_ASSERT_EQUAL_UINT(128,
                           fread(((byte *)g_armor_type_props), 1, 128, file));
    fclose(file);
}
uw_object_hdr_t *spawn_new_object(uint id, int argument)
{ TEST_ASSERT_EQUAL_INT(0, argument); restored_spawn_id=id; return NULL; }
void scan_area_ahead_of_object(void *source, int radius, int (*callback)(), int a, byte b, char mode)
{
    TEST_ASSERT_EQUAL_PTR(DAT_0024cfd4, source);
    TEST_ASSERT_EQUAL_INT(1, radius);
    TEST_ASSERT_EQUAL_INT(0, a); TEST_ASSERT_EQUAL_INT(0, b);
    TEST_ASSERT_EQUAL_INT(4, mode);
    for (int i=0; i<4 && restored_scan_objects[i]; ++i) {
        restored_scan_count++;
        if (((int (*)(int,int,void *,void *,int))callback)(18, 5, restored_scan_objects[i], NULL, 0)) break;
    }
}

int handle_keyboard_message(int window, int message, uint key)
{
    restored_message_kind=1; restored_message_window=window;
    restored_message_id=message; restored_message_wparam=key;
    return 0;
}
int handle_mouse_message(int window, uint message, uint buttons, int position)
{
    restored_message_kind=2; restored_message_window=window;
    restored_message_id=message; restored_message_wparam=buttons;
    restored_message_lparam=position;
    return 0;
}
int blit_framebuffer_to_gx_display(void) { restored_message_kind=3; return 0; }
int shutdown_game_resources(void) { restored_message_kind=4; return 0; }
int GXSuspend(void) { restored_message_kind=5; return 0; }
int GXResume(void) { restored_message_kind=6; return 0; }
long DefWindowProcW(void) { restored_message_kind=7; return 0; }

#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/file_io.h"

/* Use the actual introduction bytecode and STRINGS.PAK decoder. */
char DAT_0023c698_backing[1024];
char DAT_00101968_backing[260];
undefined4 DAT_0024bf98;
unsigned short *DAT_0024cfb8;
char *DAT_0024cfa8;
short DAT_0024cfc0, DAT_0024cfb4;
undefined2 DAT_0024cfac, DAT_000878bc;
undefined1 DAT_0024af98_backing[4096], DAT_0024bfa0_backing[4096];
undefined2 DAT_0024cfbc_backing[4];
char *g_bfa2_real_ptrs[263168];
undefined2 DAT_000890b0_backing[256];
char font_header[12], font_glyphs[0x1080];
char *DAT_000879b0 = font_header, *DAT_000890a4 = font_glyphs;
byte *g_font_glyph_data_base;
ushort g_font_line_height;
short g_font_row_stride, DAT_000a85b8;
undefined2 DAT_000a85b0;
ushort tree_count;
ushort script[2048];
size_t script_words;
struct babl_render_state state;
int voice_enabled;

int read_file_handle(int handle, void *buf, unsigned int size)
{ return uw_file_read(handle, buf, size); }
int seek_file_handle(int handle, int offset, int method)
{ return uw_file_seek(handle, offset, method); }
unsigned int ce_strlen(const char *s) { return (unsigned int)strlen(s); }
int audio_always_true_stub(void) { return voice_enabled; }

void introduction_fixture_reset(void)
{
    options_set("data-dir", UW_TEST_DATA_DIR);
    DAT_0024bf98 = uw_file_open_read("\\DATA\\STRINGS.PAK");
    TEST_ASSERT_GREATER_THAN_INT(0, DAT_0024bf98);
    TEST_ASSERT_EQUAL_INT(2, uw_file_read(DAT_0024bf98, &tree_count, 2));
    DAT_0024cfb8 = &tree_count;
    DAT_0024cfa8 = malloc(tree_count * 4);
    TEST_ASSERT_NOT_NULL(DAT_0024cfa8);
    TEST_ASSERT_EQUAL_INT(tree_count * 4, uw_file_read(DAT_0024bf98, DAT_0024cfa8, tree_count * 4));
    DAT_0024cfc0 = DAT_0024cfb4 = 0;
    DAT_0024cfac = 0xc00; /* Main menu's Introduction is page 0. */
    FILE *file = fopen(UW_TEST_DATA_DIR "/CUTS/CS000.N00", "rb");
    TEST_ASSERT_NOT_NULL(file);
    script_words = fread(script, sizeof(*script), 2048, file);
    fclose(file);
    memset(&state, 0, sizeof state);
    state.bytes[0x45] = 1;
    file = fopen(UW_TEST_DATA_DIR "/DATA/FONTBIG.SYS", "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_UINT(12, fread(font_header, 1, 12, file));
    TEST_ASSERT_GREATER_THAN_UINT(0, fread(font_glyphs, 1, sizeof font_glyphs, file));
    fclose(file);
    load_font_metrics();
    voice_enabled = 0;
    DAT_0023c698_backing[0] = 0;
}
void introduction_fixture_dispose(void)
{
    uw_file_close(DAT_0024bf98);
    free(DAT_0024cfa8);
}

#ifndef HEADERS_GRAPHICS_H
#define HEADERS_GRAPHICS_H

/* Declarations for graphics.c: low-level pixel-primitive functions (color state, rect
   fill/save/restore, paletted-bitmap blitting into the game's internal software framebuffer). Pulls
   in uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in graphics.c
   (bitmap_blit_to_framebuffer, rect_fill_or_save_restore, set_draw_color) -- extern'd here so both
   translation units see the same storage. */
extern void *g_uw_framebuffer;
/* 256-entry palette -> RGB565 lookup table (rebuilt by build_rgb565_palette on every palette load).
   Real binary size is 256 shorts at 0x0024ad60; over-allocated here as a safety margin. Indexed as
   `(&g_palette_rgb565)[palette_index]`. g_transparent_screen_color (uw.c) aliases entry 26. */
extern undefined2 g_palette_rgb565_backing[32768];

/* Globals defined in uw.c but also used by functions that now live in
   graphics.c (screen_backup_save/restore/restore_rect) -- extern'd here so
   both translation units see the same storage. */
#define g_transparent_screen_color (*(short *)&g_palette_rgb565_backing[26])

#define g_palette_rgb565 g_palette_rgb565_backing[0]
extern undefined2 DAT_000a85c0;
extern undefined2 DAT_000a85c4;
extern undefined2 DAT_000a85c8;
extern undefined2 DAT_000842a4;
extern undefined2 DAT_000842a8;
extern int DAT_00204848;
extern int g_blit_transparent_mode;
/* Globals defined in uw.c but also used by functions that now live in graphics.c
   (expand_pals_bytes, build_rgb565_palette, palette_cycle_range) -- extern'd here so both
   translation units see the same storage. */
extern int DAT_0024af70;
extern undefined2 DAT_00242010_backing[12800];
#define DAT_00242010 DAT_00242010_backing[0]
extern undefined2 DAT_00248418_backing[20 * 256];
#define DAT_00248418 DAT_00248418_backing[0]
extern void * DAT_0023c430;


void set_draw_color(short color_index);
void rect_fill_or_save_restore(ushort left, uint top, short right, short bottom);
void bitmap_blit_to_framebuffer(ushort x, ushort y, void *pixels, short height, short width, short src_x, short src_y, byte transparent);
void bitmap_blit_scaled_to_framebuffer(int x, int y, const char *pixels, int height, int width, double scale);

int screen_backup_save();
void screen_backup_restore();
void screen_backup_restore_rect(uint left, uint top, uint right, uint bottom);
void draw_horizontal_line(uint x_start, uint y, uint x_end);
void fill_viewport_and_flush();
void blit_bitmap_to_framebuffer_clipped(short x, short y, char *pixels, short height, short width, short src_x, short src_y, int transparent);
void fade_in(ushort *framebuffer, void *palette, int palette_flag);
void fade_out(ushort *framebuffer, void *palette, int palette_flag);
void copy_framebuffer_rect(short src_x, short src_y, short width, short height, short dst_x, short dst_y);
void flush_dungeon_frame();
void reset_viewport_to_fullscreen();
int render_dungeon_view();
uint64_t compute_view_y_bound(int angle, int offset, int passthrough);
void build_shade_lut();
void set_ambient_bias_with_light(char light_level);
void set_ambient_bias_without_light(char light_level);
void expand_pals_bytes(byte *out_rgb8, byte *pals_6bit, int copy_unscaled);
void build_rgb565_palette(byte *rgb_buffer, short mode);
unsigned int get_palette_brightness_bits();
int dungeon_palette_cycle_tick();
void end_gx_draw_session();
void palette_cycle_range(uint first_index, uint last_index, int reverse);
void convert_palette_bgrx_to_rgb(byte *bgrx, byte *rgb);
void tick_book_illustration_palette_cycles(ushort *cycle_record);
int load_bmp_resource_to_rgb565(int module, short resource_name, ushort *out_pixels);
void clear_screen_and_restore_cursor();
void apply_palette_buffer(void *palette, int flag);
void fade_active_palette_to_black(byte *palette, short steps);
int blit_fullscreen_bitmap_file(int palette_bank, char *path, int show_flag);
int blit_framebuffer_to_gx_display();
void reinstall_active_palette(int entry_count, int first_entry, int flag);
void plot_pixel(short x, short y, short color_index);

#endif

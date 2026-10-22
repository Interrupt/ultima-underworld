#ifndef HEADERS_VISIBILITY_H
#define HEADERS_VISIBILITY_H

/* Declarations for visibility.c: texture-id list loading, the visibility light grid/ray flood-fill,
   and the per-frame dungeon redraw dispatch. Pulls in uw.h itself so this header is self-contained
   for any caller. */
#include "uw.h"

extern undefined2 DAT_00189578;
/* Globals defined in uw.c but also used by functions that now live in
   visibility.c (load_floor_texture_arenas) -- extern'd here so both
   translation units see the same storage. */
extern ushort DAT_0023adc0;
extern byte *DAT_0023ae34;
extern byte *DAT_0023ae30;
extern undefined1 DAT_002049e0_backing[0x40000];
#define DAT_002049e0 DAT_002049e0_backing[0]
extern short DAT_00086b28;
extern char s__DATA_light_dat_000872c8[];
extern undefined1 g_visibility_ring_buffer_backing[32768];
#define g_visibility_ring_buffer g_visibility_ring_buffer_backing[0]
extern short g_visibility_ring_depth;
/* Globals defined in uw.c but also used by functions that now live in
   visibility.c (dungeon-view visibility/draw-list build) -- extern'd
   here so both translation units see the same storage. */
extern short DAT_00086b2c;
extern void * DAT_002020f8_arr[256];
#define DAT_002020f8 DAT_002020f8_arr[0]
extern undefined2 DAT_0023adb0;
extern undefined2 DAT_0023adb8_backing[16];
#define DAT_0023adb8 DAT_0023adb8_backing[0]
extern undefined2 DAT_0023ae58_backing[48];
#define DAT_0023ae58 DAT_0023ae58_backing[0]
extern undefined2 DAT_0023aeb8_backing[4];
#define DAT_0023aeb8 DAT_0023aeb8_backing[0]
extern undefined2 * DAT_0023aed0;
extern undefined2 DAT_0023aed4;
extern undefined2 DAT_0023b020;
extern undefined4 g_dungeon_view_active;
extern short g_visibility_max_ring_passes;
extern undefined2 DAT_00189578;
extern undefined2 DAT_00189582;
extern undefined DAT_0023b4dc;


int reset_texture_id_lists();
bool load_level_texture_ids(byte *archive, int level_number);
void load_texture_arena(char *path, ushort *id_list, ushort *out_count, byte *arena);
void load_terrain_texture_props(char *wall_texture_ids, char *floor_texture_ids);
void draw_command_list_rewind();
void free_frame_geometry_buffers();
void full_dungeon_redraw();
void render_dungeon_frame_timed();
int build_frame_draw_list();
void build_visibility_light_grid(short size);
void seed_visibility_queue();
void visibility_ray_step_forward(void *ray);
void visibility_ray_step_backward(void *ray);
int compute_visibility_ray_offset(void *ray, char step_x, char step_y);
int extend_visibility_ray_row(byte *ray_a, byte *ray_b);
void advance_visibility_ray(byte *ray);
void merge_adjacent_visibility_rays(byte **ray_cursor, byte **out_cursor);
void run_visibility_flood();
void rebuild_dungeon_view();
void dungeon_view_prepass_stub(int phase);
void load_floor_texture_arenas(byte special_floor_id);
void load_shading_level_config(char shading_level);
void load_light_tables();

#endif

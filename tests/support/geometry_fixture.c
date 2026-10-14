#include "geometry_fixture.h"
#include "src/headers/3d.h"

/* The real geometry arena. Old contents survive a reset between frames, as in the game; only the
   current counts delimit the list. */
uw_geom_arena_t g_geom_arena;
undefined4 DAT_00084608 = 0x40a00000;
undefined4 DAT_000c8ac0_mtx[16];
int g_view_fullscreen;
int DAT_000c8c98;
void *DAT_000c4838_backing[4096];
void *g_tile_texptr_emit[UW_MAX_VIS_TILES], *g_tile_texptr_out[UW_MAX_VIS_TILES];
undefined2 DAT_000da47c;
void *g_uw_framebuffer;
undefined4 DAT_0008462c=52, DAT_00084630=19, DAT_00084634=224, DAT_00084638=132;
undefined4 DAT_00084610=100;
int geometry_triangles, geometry_surface_ids[1024];
undefined4 geometry_last_triangle[15];

void raster_triangle(int stride, void *buffer, uint *vertices, int surface, int width, int size, char *texture, int *clip)
{
    (void)stride; (void)buffer; (void)width; (void)size; (void)texture; (void)clip;
    TEST_ASSERT_LESS_THAN_INT(1024, geometry_triangles);
    geometry_surface_ids[geometry_triangles++] = surface;
    memcpy(geometry_last_triangle, vertices, sizeof geometry_last_triangle);
}
void debug_framebuffer_dump(const char *tag) { (void)tag; }
void uw_debug_dump_3d_face(const char *tag) { (void)tag; }
int uw_debug_3d_frame_dump_finish(void) { return -1; }
const char *uw_debug_3d_frame_dump_last_dir(void) { return ""; }
int message_scroll_print_wrapped(char *text) { (void)text; TEST_FAIL_MESSAGE("Unexpected debug message"); return 0; }

void geometry_fixture_reset(void)
{
    memset(&g_geom_arena, 0, sizeof g_geom_arena);
    geometry_triangles = 0;
    DAT_000c8c98 = 0;
}
void geometry_fixture_wall(unsigned records, float x, float depth)
{
    TEST_ASSERT_LESS_OR_EQUAL_UINT(UW_ARENA_MAX_RECORDS, records);
    g_geom_arena.vert_count = 4;
    g_geom_arena.rec_count = records;
    uw_vec3 points[4] = {{x,0,depth},{x+1,0,depth},{x+1,1,depth},{x,1,depth}};
    memcpy(g_geom_arena.projected_verts, points, sizeof points);
    for (unsigned i=0;i<records;i++) {
        uw_geom_record_t *record=&g_geom_arena.records[i];
        memset(record,0,sizeof *record);
        record->vert_count=4;
        for (int j=0;j<4;j++) record->vert_idx[j]=j;
        record->attr[1]=16; record->attr[2]=16;
        record->tex[1]=0x20+i; /* draw surface ID */
        record->visible=1;
    }
}
void geometry_fixture_render(void)
{
    geometry_triangles=0;
    near_clip_visible_tiles(0,0);
    near_clip_visible_tiles(&g_geom_arena,1);
    render_visible_tile_list();
}

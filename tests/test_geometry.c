#include "geometry_fixture.h"
#include "src/headers/3d.h"

void setUp(void) { geometry_fixture_reset(); }
void tearDown(void) {}

static void test_next_frame_draws_only_its_current_walls(void)
{
    geometry_fixture_wall(3, 0, 10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(6, geometry_triangles);
    geometry_fixture_wall(1, 8, 10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(1, DAT_000c8c98);
    TEST_ASSERT_EQUAL_INT(2, geometry_triangles);
    TEST_ASSERT_EQUAL_INT(0x20, geometry_surface_ids[0]);
    float x; memcpy(&x, geometry_last_triangle, sizeof x);
    TEST_ASSERT_FLOAT_WITHIN(0.001, 220, x); /* current x=8, not old x=0 */
}
static void test_empty_next_frame_does_not_redraw_old_geometry(void)
{
    geometry_fixture_wall(3, 0, 10);
    geometry_fixture_render();
    geometry_fixture_wall(0, 0, 10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(0, DAT_000c8c98);
    TEST_ASSERT_EQUAL_INT(0, geometry_triangles);
}
static void test_walls_behind_camera_do_not_redraw_previous_visible_walls(void)
{
    geometry_fixture_wall(3, 0, 10);
    geometry_fixture_render();
    geometry_fixture_wall(3, 0, -10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(0, DAT_000c8c98);
    TEST_ASSERT_EQUAL_INT(0, geometry_triangles);
}
static void test_full_geometry_list_fits_clipped_record_storage(void)
{
    /* Many faces can share vertices (models); record count is independent
       of the raw vertex count and can exceed the old 240-record buffer. */
    geometry_fixture_wall(490, 0, 10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(490, DAT_000c8c98);
    TEST_ASSERT_EQUAL_INT(980, geometry_triangles);
    TEST_ASSERT_EQUAL_INT(0x20+489, geometry_surface_ids[979]);
    geometry_fixture_wall(1, 4, 10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(2, geometry_triangles);
}
static void test_next_frame_discards_vertices_added_by_previous_near_clip(void)
{
    geometry_fixture_wall(1, 0, 10);
    /* Put one corner behind the near plane: clipping adds two intersections
       and produces a five-vertex polygon instead of the original quad. */
    float behind = 0;
    g_geom_arena.projected_verts[0].z = behind;
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(3, geometry_triangles);
    geometry_fixture_wall(1, 4, 10);
    geometry_fixture_render();
    TEST_ASSERT_EQUAL_INT(2, geometry_triangles);
    float x; memcpy(&x, geometry_last_triangle, sizeof x);
    TEST_ASSERT_FLOAT_WITHIN(0.001, 180, x);
}



/* The arena arrays are packed back to back, so running one off its end corrupts the next. These
   tests fill the arena to UW_ARENA_MAX_VERTS / UW_ARENA_MAX_RECORDS and check nothing leaks across. */
static void set_cam_offset(float x, float y, float z)
{
    g_geom_arena.cam_offset.x = x; g_geom_arena.cam_offset.y = y; g_geom_arena.cam_offset.z = z;
}
static void test_arena_arrays_do_not_overlap_at_the_cap(void)
{
    TEST_ASSERT_EQUAL_PTR(&g_geom_arena.model_verts[UW_ARENA_MAX_VERTS], &g_geom_arena.camera_verts[0]);
    TEST_ASSERT_EQUAL_PTR(&g_geom_arena.camera_verts[UW_ARENA_MAX_VERTS], &g_geom_arena.projected_verts[0]);
    TEST_ASSERT_EQUAL_PTR(&g_geom_arena.projected_verts[UW_ARENA_MAX_VERTS], &g_geom_arena.cam_offset);
    TEST_ASSERT_EQUAL_PTR(&g_geom_arena.cam_offset + 1, &g_geom_arena.records[0]);
    TEST_ASSERT_EQUAL_PTR((char *)&g_geom_arena + sizeof g_geom_arena, &g_geom_arena.records[UW_ARENA_MAX_RECORDS]);
}
static void test_full_vertex_arena_transform_and_project_stay_in_bounds(void)
{
    int last = UW_ARENA_MAX_VERTS - 1;
    float one = 1.0f;
    set_cam_offset(1, 2, 3);
    g_geom_arena.vert_count = UW_ARENA_MAX_VERTS;
    g_geom_arena.rec_count = UW_ARENA_MAX_RECORDS;
    for (int i = 0; i < UW_ARENA_MAX_VERTS; i++) g_geom_arena.model_verts[i].x = i;
    g_geom_arena.records[UW_ARENA_MAX_RECORDS - 1].vert_count = 77;
    memset(DAT_000c8ac0_mtx, 0, sizeof DAT_000c8ac0_mtx);
    DAT_000c8ac0_mtx[0] = DAT_000c8ac0_mtx[5] = DAT_000c8ac0_mtx[10] = *(undefined4 *)&one;
    translate_verts_to_camera_space(&g_geom_arena);
    project_verts_through_view_matrix(&g_geom_arena);
    TEST_ASSERT_EQUAL_FLOAT(last + 1, g_geom_arena.camera_verts[last].x);
    TEST_ASSERT_EQUAL_FLOAT(last + 1, g_geom_arena.projected_verts[last].x);
    /* project_verts runs one past vert_count, which would be projected_verts[MAX] == cam_offset. */
    TEST_ASSERT_EQUAL_FLOAT(1, g_geom_arena.cam_offset.x);
    TEST_ASSERT_EQUAL_FLOAT(2, g_geom_arena.cam_offset.y);
    TEST_ASSERT_EQUAL_FLOAT(3, g_geom_arena.cam_offset.z);
    TEST_ASSERT_EQUAL_INT(77, g_geom_arena.records[UW_ARENA_MAX_RECORDS - 1].vert_count);
    TEST_ASSERT_EQUAL_INT(1, g_geom_arena.records[UW_ARENA_MAX_RECORDS - 1].visible);
}
static void test_model_append_fills_the_last_vertex_and_record_slots_exactly(void)
{
    enum { VERTS = 40, FACES = 6 };
    static int scratch[0xc14 / 4 + FACES * 0x18];
    memset(scratch, 0, sizeof scratch);
    scratch[0] = VERTS; scratch[1] = FACES;
    for (int i = 0; i < VERTS; i++) { float v = 100 + i; memcpy(&scratch[2 + i * 3], &v, sizeof v); }
    for (int f = 0; f < FACES; f++) {
        int *face = &scratch[0xc14 / 4 + f * 0x18];
        face[0] = 4;
        for (int k = 0; k < 4; k++) face[1 + k] = (f + k) % VERTS;
    }
    set_cam_offset(5, 6, 7);
    g_geom_arena.vert_count = UW_ARENA_MAX_VERTS - VERTS;
    g_geom_arena.rec_count = UW_ARENA_MAX_RECORDS - FACES;
    transform_points_by_matrix(&g_geom_arena, scratch);
    TEST_ASSERT_EQUAL_INT(UW_ARENA_MAX_VERTS, g_geom_arena.vert_count);
    TEST_ASSERT_EQUAL_INT(UW_ARENA_MAX_RECORDS, g_geom_arena.rec_count);
    TEST_ASSERT_EQUAL_FLOAT(100 + VERTS - 1, g_geom_arena.model_verts[UW_ARENA_MAX_VERTS - 1].x);
    TEST_ASSERT_EQUAL_INT(UW_ARENA_MAX_VERTS - VERTS + (FACES - 1 + 3) % VERTS,
                          g_geom_arena.records[UW_ARENA_MAX_RECORDS - 1].vert_idx[3]);
    TEST_ASSERT_EQUAL_FLOAT(5, g_geom_arena.cam_offset.x);
    TEST_ASSERT_EQUAL_FLOAT(6, g_geom_arena.cam_offset.y);
    TEST_ASSERT_EQUAL_FLOAT(7, g_geom_arena.cam_offset.z);
    TEST_ASSERT_EQUAL_FLOAT(0, g_geom_arena.camera_verts[0].x);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_next_frame_draws_only_its_current_walls);
    RUN_TEST(test_empty_next_frame_does_not_redraw_old_geometry);
    RUN_TEST(test_walls_behind_camera_do_not_redraw_previous_visible_walls);
    RUN_TEST(test_full_geometry_list_fits_clipped_record_storage);
    RUN_TEST(test_next_frame_discards_vertices_added_by_previous_near_clip);
    RUN_TEST(test_arena_arrays_do_not_overlap_at_the_cap);
    RUN_TEST(test_full_vertex_arena_transform_and_project_stay_in_bounds);
    RUN_TEST(test_model_append_fills_the_last_vertex_and_record_slots_exactly);
    return UNITY_END();
}

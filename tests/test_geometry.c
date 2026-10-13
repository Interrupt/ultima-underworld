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
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_next_frame_draws_only_its_current_walls);
    RUN_TEST(test_empty_next_frame_does_not_redraw_old_geometry);
    RUN_TEST(test_walls_behind_camera_do_not_redraw_previous_visible_walls);
    RUN_TEST(test_full_geometry_list_fits_clipped_record_storage);
    RUN_TEST(test_next_frame_discards_vertices_added_by_previous_near_clip);
    return UNITY_END();
}

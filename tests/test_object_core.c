#include "src/headers/objects.h"
#include "unity.h"

uw_object_type_props_t g_object_type_props[512];
static uw_mobile_object_t mobile[256];
static uw_object_hdr_t stationary[768];
char *DAT_002046b8 = (char *)mobile;
char *DAT_002046c4 = (char *)stationary;
ushort *DAT_002046b4;
char *DAT_002029cc;
static int allocation_region;
static int allocation_fails;

/* Only allocation bookkeeping is stubbed; creation and chain traversal
 * below run the actual game functions extracted from objects.c. */
uw_object_hdr_t *alloc_object_slot(int region)
{
    allocation_region = region;
    return allocation_fails ? NULL : &mobile[1].hdr;
}
int encode_object_slot_index(const uw_object_hdr_t *object)
{
    if (!object) return 0;
    if ((char *)object >= DAT_002046c4 &&
        (char *)object < DAT_002046c4 + sizeof stationary)
        return 256 + ((char *)object - DAT_002046c4) / sizeof stationary[0];
    return ((char *)object - DAT_002046b8) / sizeof mobile[0];
}
void setUp(void)
{
    memset(mobile, 0, sizeof mobile);
    memset(stationary, 0, sizeof stationary);
    memset(g_object_type_props, 0, sizeof g_object_type_props);
    allocation_region = -1;
    allocation_fails = 0;
    DAT_002046b4 = NULL;
}
void tearDown(void) {}

static void test_creation_matches_original_packed_bytes(void)
{
    for (int id = 0; id < 512; ++id) {
        for (int flags = 0; flags < 256; flags += 64) {
            for (int old_quantity = 0; old_quantity < 2; ++old_quantity) {
                unsigned char expected[8] = {0};
                int quantity = flags == 0 || flags == 128;
                memset(&mobile[1], 0xa5, sizeof mobile[1]);
                mobile[1].hdr.is_quant = old_quantity;
                g_object_type_props[id].flags = flags;
                /* Independent UW1 disk-byte masks, rather than reading
                 * expected values through the struct being tested. */
                expected[0] = id & 255;
                expected[1] = (id >> 8) | (quantity ? 128 : 0);
                expected[3] = 0x6c;
                expected[4] = 0x28;
                expected[6] = quantity ? 0x40 : 0;
                TEST_ASSERT_EQUAL_PTR(&mobile[1].hdr, spawn_new_object(id, 1));
                TEST_ASSERT_EQUAL_MEMORY(expected, &mobile[1].hdr, 8);
                TEST_ASSERT_EQUAL_UINT8(0xa5, mobile[1].npc_hp);
                TEST_ASSERT_EQUAL_INT(1, allocation_region);
            }
        }
    }
}
static void test_creation_propagates_allocation_failure(void)
{
    allocation_fails = 1;
    TEST_ASSERT_NULL(spawn_new_object(0x80, 0));
    TEST_ASSERT_EQUAL_INT(0, allocation_region);
}
static void test_link_resolution_preserves_both_slot_strides(void)
{
    ushort link = (255 << 6) | 37;
    TEST_ASSERT_EQUAL_PTR(&mobile[255].hdr, resolve_object_link(&link));
    link = (256 << 6) | 37;
    TEST_ASSERT_EQUAL_PTR(&stationary[0], resolve_object_link(&link));
    link = (1023 << 6) | 37;
    TEST_ASSERT_EQUAL_PTR(&stationary[767], resolve_object_link(&link));
    link = 37;
    TEST_ASSERT_NULL(resolve_object_link(&link));
    TEST_ASSERT_NULL(resolve_object_link(NULL));
}
static void test_chain_search_follows_next_and_contents_words(void)
{
    ushort root = 256 << 6;
    ushort *cursor = &root;
    stationary[0].object_id = 0x80;
    stationary[0].next = 257;
    stationary[1].object_id = 0x81;
    stationary[1].link = 2;
    mobile[2].hdr.object_id = 0x43;
    TEST_ASSERT_EQUAL_PTR(&mobile[2].hdr,
        find_object_in_chain(&cursor, 1, 1, 0, 3));
    TEST_ASSERT_EQUAL_PTR((char *)&stationary[1] + 6, cursor);
    cursor = &root;
    TEST_ASSERT_NULL(find_object_in_chain(&cursor, 0, 1, 0, 3));
    stationary[1].is_quant = 1;
    cursor = &root;
    TEST_ASSERT_NULL(find_object_in_chain(&cursor, 1, 1, 0, 3));
}
/* find_object_in_world, the game's own find-next (the level editor's Find uses it): a scan of the tile chains in row order, into containers,
   that leaves the cursor on the tile it found the object at; calling it again from the next tile finds the next object. */
static void test_world_search_scans_tiles_in_order_and_into_containers(void)
{
    static uw_tile_t tiles[4096];
    short x = 0, y = 0;
    memset(tiles, 0, sizeof tiles);
    DAT_002029cc = (char *)tiles;
    mobile[2].hdr.object_id = 0x43;
    mobile[3].hdr.object_id = 0x43;
    mobile[4].hdr.object_id = 0x43;
    stationary[0].object_id = 0x80;   /* a container holding slot 4 */
    stationary[0].link = 4;
    tiles[2 * 64 + 3].obj_head = 2;
    tiles[2 * 64 + 5].obj_head = 256;
    tiles[7 * 64 + 1].obj_head = 3;
    TEST_ASSERT_EQUAL_PTR(&mobile[2].hdr, find_object_in_world(1, 0, 3, &x, &y));
    TEST_ASSERT_EQUAL_INT(3, x);
    TEST_ASSERT_EQUAL_INT(2, y);
    x++;
    TEST_ASSERT_EQUAL_PTR(&mobile[4].hdr, find_object_in_world(1, 0, 3, &x, &y));   /* inside the container on the next tile */
    TEST_ASSERT_EQUAL_INT(5, x);
    TEST_ASSERT_EQUAL_INT(2, y);
    x++;
    TEST_ASSERT_EQUAL_PTR(&mobile[3].hdr, find_object_in_world(1, 0, 3, &x, &y));
    TEST_ASSERT_EQUAL_INT(1, x);
    TEST_ASSERT_EQUAL_INT(7, y);
    x++;
    TEST_ASSERT_NULL(find_object_in_world(1, 0, 3, &x, &y));
    x = 0; y = 0;
    TEST_ASSERT_NULL(find_object_in_world(1, 0, 9, &x, &y));   /* nothing of that quality */
    x = 0x40; y = 6;   /* a cursor past the end of a row continues on the next */
    TEST_ASSERT_EQUAL_PTR(&mobile[3].hdr, find_object_in_world(1, 0, 3, &x, &y));
}
static void test_encoded_slot_search_handles_nested_and_sibling_objects(void)
{
    ushort root = 256 << 6;
    stationary[0].next = 257;
    stationary[1].link = 2;
    TEST_ASSERT_EQUAL_PTR(&stationary[1],
        find_object_by_encoded_slot_in_chain(&root, 1, 257));
    TEST_ASSERT_EQUAL_PTR(&mobile[2].hdr,
        find_object_by_encoded_slot_in_chain(&root, 1, 2));
    stationary[1].is_quant = 1;
    TEST_ASSERT_NULL(find_object_by_encoded_slot_in_chain(&root, 1, 2));
    TEST_ASSERT_NULL(find_object_by_encoded_slot_in_chain(&root, 1, 900));
}
static void test_insert_append_and_unlink_preserve_low_link_bits(void)
{
    ushort root = 37;
    stationary[0].quality = 43;
    mobile[2].hdr.quality = 51;
    object_list_insert_head(&root, &stationary[0]);
    TEST_ASSERT_EQUAL_UINT16((256 << 6) | 37, root);
    TEST_ASSERT_EQUAL_UINT16(43, stationary[0].quality);
    TEST_ASSERT_EQUAL_UINT16(0, stationary[0].next);
    object_list_insert_head(&root, &mobile[2].hdr);
    TEST_ASSERT_EQUAL_UINT16((2 << 6) | 37, root);
    TEST_ASSERT_EQUAL_UINT16(256, mobile[2].hdr.next);
    TEST_ASSERT_EQUAL_UINT16(51, mobile[2].hdr.quality);
    stationary[1].quality = 19;
    stationary[1].next = 900;
    object_list_append_tail(&root, &stationary[1]);
    TEST_ASSERT_EQUAL_UINT16(257, stationary[0].next);
    TEST_ASSERT_EQUAL_UINT16(43, stationary[0].quality);
    TEST_ASSERT_EQUAL_UINT16(0, stationary[1].next);
    object_list_unlink(&root, &stationary[0]);
    TEST_ASSERT_EQUAL_UINT16(257, mobile[2].hdr.next);
    TEST_ASSERT_EQUAL_UINT16(51, mobile[2].hdr.quality);
    TEST_ASSERT_EQUAL_UINT16(0, stationary[0].next);
    TEST_ASSERT_EQUAL_UINT16(43, stationary[0].quality);
    object_list_unlink(&root, &mobile[2].hdr);
    TEST_ASSERT_EQUAL_UINT16((257 << 6) | 37, root);
    object_list_unlink(&root, &stationary[1]);
    TEST_ASSERT_EQUAL_UINT16(37, root);
    TEST_ASSERT_EQUAL_UINT16(19, stationary[1].quality);
}
static void test_contents_weight_distinguishes_quantity_from_links(void)
{
    ushort root = (256 << 6) | 37;
    short total = 10;
    stationary[0].object_id = 0x80;
    stationary[0].link = 2;
    g_object_type_props[0x80].unit_weight = 12;
    mobile[2].hdr.object_id = 0x83;
    mobile[2].hdr.is_quant = 1;
    mobile[2].hdr.link = 3;
    mobile[2].hdr.next = 257;
    g_object_type_props[0x83].unit_weight = 7;
    stationary[1].object_id = 0x87;
    stationary[1].is_quant = 1;
    stationary[1].link = 600; /* Special property, not 600 objects. */
    g_object_type_props[0x87].unit_weight = 5;
    sum_container_weight(&root, &total);
    TEST_ASSERT_EQUAL_INT16(48, total);
}
static void test_stacking_checks_type_contents_quantity_and_quality(void)
{
    uw_object_hdr_t *a = &stationary[0];
    uw_object_hdr_t *b = &stationary[1];
    a->object_id = b->object_id = 0x80;
    a->is_quant = b->is_quant = 1;
    a->link = 3;
    b->link = 7;
    a->quality = 18;
    b->quality = 31;
    TEST_ASSERT_EQUAL_INT(1, objects_can_stack(a, b));
    b->object_id = 0x81;
    TEST_ASSERT_EQUAL_INT(0, objects_can_stack(a, b));
    b->object_id = 0x80;
    b->is_quant = 0;
    TEST_ASSERT_EQUAL_INT(0, objects_can_stack(a, b));
    b->is_quant = 1;
    b->link = 600;
    TEST_ASSERT_EQUAL_INT(0, objects_can_stack(a, b));
    b->link = 7;
    g_object_type_props[0x80].flags = 0x40;
    TEST_ASSERT_EQUAL_INT(0, objects_can_stack(a, b));
    g_object_type_props[0x80].flags = 0;
    b->quality = 32;
    TEST_ASSERT_EQUAL_INT(0, objects_can_stack(a, b));
    a->quality = 0;
    b->quality = 1;
    TEST_ASSERT_EQUAL_INT(0, objects_can_stack(a, b));
    a->object_id = b->object_id = 0x10; /* Ammunition ignores quality. */
    TEST_ASSERT_EQUAL_INT(1, objects_can_stack(a, b));
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_creation_matches_original_packed_bytes);
    RUN_TEST(test_creation_propagates_allocation_failure);
    RUN_TEST(test_link_resolution_preserves_both_slot_strides);
    RUN_TEST(test_chain_search_follows_next_and_contents_words);
    RUN_TEST(test_world_search_scans_tiles_in_order_and_into_containers);
    RUN_TEST(test_encoded_slot_search_handles_nested_and_sibling_objects);
    RUN_TEST(test_insert_append_and_unlink_preserve_low_link_bits);
    RUN_TEST(test_contents_weight_distinguishes_quantity_from_links);
    RUN_TEST(test_stacking_checks_type_contents_quantity_and_quality);
    return UNITY_END();
}

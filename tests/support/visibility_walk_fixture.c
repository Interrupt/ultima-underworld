#include "game_fixture.h"
#include "visibility_walk_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
int visibility_ray_idx(const void *p);

unsigned char g_visibility_ray_table_backing[1024];

unsigned char g_visibility_ring_done;

char *g_visibility_ray_realptr[24];

char *g_visibility_ray_realptr2[24];
char *g_visibility_ray_clearptr[24];

char g_visibility_ray_fallback[64];

undefined1 g_visibility_ring_buffer_backing[32768];

short g_visibility_ring_depth;

short g_visibility_max_ring_passes;
short DAT_0025063c, DAT_0025064c, DAT_002506dc;
int DAT_000db448;   /* camera pitch angle; 0 keeps the near-tile ray widening inactive */

/* Exercise the actual equipment light scan; unrelated HUD/equipment
   services do nothing in this visibility fixture. */
static char character[256], derived[32];
static uw_object_hdr_t torch;
static byte torch_effect[2];
static int torch_equipped;
char *DAT_00086df8 = character, *DAT_0023be74 = derived;
char *g_selected_object;
uw_object_hdr_t *g_scratch_object_ptr;
undefined4 DAT_002020d8, DAT_0023bc98;
undefined1 DAT_00086da8_backing[256];
uw_melee_type_props_t g_melee_type_props[16];
unsigned char DAT_00085ac8_backing[16] = {5,6,7,8};
int visibility_light_config_record, visibility_ambient_strength;
uw_object_hdr_t *get_equipped_item_at_slot(short slot)
{
    return torch_equipped && slot == 5 ? &torch : NULL;
}
void *get_scanned_object_class_effect_ptr(void)
{
    return torch_effect;
}
int compute_object_weight(uw_unaligned_word_t *object) { (void)object; return 0; }
void request_weapon_swing_graphic(char category) {}
void reset_player_derived_state(void) {}
void load_shading_level_config(char record);
/* The real one loads the SHADES.DAT row for the level it is given. */
void set_ambient_bias_with_light(char level) { visibility_ambient_strength = level; load_shading_level_config(level); }
void set_ambient_bias_without_light(char level) {}
int is_valid_equipment_slot_item(ushort item, short slot) { return 0; }
int resolve_object_variant_or_special_link(void *object, void *type, void *level, void *result) { return 0; }
int apply_equipped_item_effect(byte type, byte level, ushort *effects, int slot) { return 0; }
void clear_object_pending_special_flag(void *object) {}
void apply_equipment_effect_penalties(uint effects) {}
void update_screen_flicker_effect(int flicker) {}
void force_locomotion_state_refresh(void) {}
void apply_movement_mode_profile(byte mode) {}
void load_shading_level_config(char record)
{
    visibility_light_config_record = record;
    load_visibility_light_config(record);
}
void equip_visibility_test_torch(int equipped)
{
    torch.type_flags = 0x94; /* lit torch in the original eligible slot */
    /* OBJECTS.DAT: header, armor tables, monster table, carry weights,
       then two bytes per light variant. Variant 4 is the lit torch. */
    if (equipped)
        uw_test_read_data("DATA/OBJECTS.DAT", torch_effect, sizeof torch_effect,
                         2 + 0x130 + 0xc00 + 0x30 + 4 * 2, SEEK_SET);
    torch_equipped = equipped;
}

unsigned char tilemap[64 * 64 * 4];

unsigned char level_one[0x7c08];

char *DAT_002029cc;

char *DAT_0023aecc;

byte DAT_0023b4a0;

/* Recovered UU.exe data from tmap.c/automap.c. These declarations start
   with whitespace in the game sources, so the current extractor cannot
   select them; keep the original byte tables for the visibility fixture. */
const unsigned char DAT_00086a00_region[0xb0] = {
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff,
  0x01,0x00,0x40,0x00,0xff,0xff,0xc0,0xff, 0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xc0,
  0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07, 0x08,0x09,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x04,0x02,0x05,0x03,0x09,0x08, 0x06,0x07,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x05,0x04,0x03,0x02,0x07,0x06, 0x09,0x08,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x01,0x03,0x05,0x02,0x04,0x08,0x09, 0x07,0x06,0x00,0x00,0x00,0x00,0x00,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xb8, 0x98,0xb0,0x98,0xb0,0x98,0xb0,0xe4,0xc4,
  0xe4,0xc4,0xe0,0xc4,0xe4,0xcd,0xcd,0xc5, 0xc9,0xc5,0xcd,0xc5,0xd6,0xd2,0x00,0xd6,
  0x00,0xd6,0x00,0xd7,0x00,0xd3,0x00,0xd7, 0x00,0xd7,0xbc,0x9c,0xb4,0x9c,0xb4,0x9c,
  0xb4,0xbd,0x9d,0xb5,0x9d,0xb5,0x9d,0xb5, 0xbe,0x9e,0xb6,0x9e,0xb6,0x9e,0xb6,0xbf,
  0x9f,0xb7,0x9f,0xb7,0x9f,0xb7,0x00,0x00, 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};

unsigned char DAT_000878d0_backing[256] = {
  0x1e, 0x00, 0x13, 0x15, 0x0b, 0x0d, 0x20, 0x20,
  0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e,
};

undefined1 DAT_00086e6c_backing[64];

/* Same pointer-index helper as visibility.c. Its inline opening brace is
   outside the extractor's supported function layout. */
int visibility_ray_idx(const void *p) {
    intptr_t off = (intptr_t)p - (intptr_t)g_visibility_ray_table_backing;
    if (off < 0 || off + 0x15 > (intptr_t)sizeof(g_visibility_ray_table_backing))
        return VISIBILITY_RAY_SCRATCH_IDX;
    return (int)(off / 0x15);
}

void set_tile(int x, int y, int tile_type)
{
    unsigned char *rec = tilemap + (x + y * 64) * 4;
    rec[0] = (unsigned char)tile_type;
}

void set_room(int x0, int y0, int x1, int y1)
{
    for (int y = y0; y <= y1; y++) {
        for (int x = x0; x <= x1; x++) set_tile(x, y, 1); /* open floor */
    }
}

void load_real_level_one(void)
{
    uw_test_load_map(level_one, sizeof level_one, 1);
}

unsigned char ring_cell(int depth, int side)
{
    return g_visibility_ring_buffer_backing[depth * 0x42 + (side + 16) * 2];
}

int ring_cell_untouched(int depth, int side)
{
    return ring_cell(depth, side) == 0;
}

void flood_at(const void *map, int x_fixed, int y_fixed, int facing)
{
    DAT_002029cc = (char *)map;
    memset(g_visibility_ray_table_backing, 0, sizeof(g_visibility_ray_table_backing));
    memset(g_visibility_ray_realptr, 0, sizeof(g_visibility_ray_realptr));
    memset(g_visibility_ray_realptr2, 0, sizeof(g_visibility_ray_realptr2));
    memset(g_visibility_ray_clearptr, 0, sizeof(g_visibility_ray_clearptr));
    g_visibility_ring_depth = 0;

    /* Match build_frame_draw_list's quadrant and sub-tile view rotation. */
    DAT_0023b4a0 = ((((short)facing >> 13) + 1) >> 1) & 3;
    int x = x_fixed & 255, y = y_fixed & 255;
    if (DAT_0023b4a0 == 1) { int old_x = x; x = 255-y; y = old_x; }
    else if (DAT_0023b4a0 == 2) { x = 255-x; y = 255-y; }
    else if (DAT_0023b4a0 == 3) { int old_x = x; x = y; y = 255-old_x; }
    g_current_view->view_x = x;
    g_current_view->view_y = y;
    g_current_view->view_facing = (short)(facing - DAT_0023b4a0 * 0x4000);
    DAT_0023aecc = (char *)tilemap_lookup(x_fixed >> 8, y_fixed >> 8);

    seed_visibility_queue();
    run_visibility_flood();
}

void repeat_flood_on(const void *map, int player_x, int player_y, int facing)
{
    flood_at(map, player_x * 256 + 128, player_y * 256 + 128, facing);
}

unsigned char visible_world_tile(int player_x, int player_y, int tile_x, int tile_y)
{
    int side_step = *(const short *)(DAT_00086a00_region + DAT_0023b4a0 * 6);
    int depth_step = *(const short *)(DAT_00086a00_region + DAT_0023b4a0 * 6 + 2);
    int dx = tile_x-player_x, dy = tile_y-player_y;
    int side = side_step == 1 ? dx : side_step == -1 ? -dx : side_step == 64 ? dy : -dy;
    int depth = depth_step == 1 ? dx : depth_step == -1 ? -dx : depth_step == 64 ? dy : -dy;
    if (depth < 0 || depth > g_visibility_ring_depth || side < -16 || side > 16) return 0;
    return ring_cell(depth, side);
}

void run_flood_on(const void *map, int player_x, int player_y, int facing)
{
    memset(g_visibility_ring_buffer_backing, RING_CELL_SENTINEL,
           sizeof(g_visibility_ring_buffer_backing));
    repeat_flood_on(map, player_x, player_y, facing);
}

void run_flood(int player_x, int player_y, int facing)
{
    run_flood_on(tilemap, player_x, player_y, facing);
}

void load_visibility_light_config(unsigned record)
{
    short fields[6];
    uw_test_read_data("DATA/SHADES.DAT", fields, sizeof fields, record * sizeof fields, SEEK_SET);
    DAT_0025063c = fields[0] < 2 ? 1 : fields[0];
    DAT_0025064c = fields[1];
    DAT_002506dc = fields[2];
    g_visibility_max_ring_passes = fields[3];
    build_visibility_light_grid(fields[3]);
}

void visibility_walk_fixture_reset(void)
{
    memset(character, 0, sizeof character);
    memset(derived, 0, sizeof derived);
    torch_equipped = 0;
    visibility_light_config_record = -1;
    visibility_ambient_strength = -1;
    DAT_002020d8 = 0;
    memset(tilemap, 1, sizeof(tilemap)); /* tile_type 1 == open floor everywhere, by default */
    g_visibility_max_ring_passes = 16;
    memset(g_visibility_ring_buffer_backing, 0, sizeof g_visibility_ring_buffer_backing);
}

void visibility_walk_fixture_dispose(void) {}

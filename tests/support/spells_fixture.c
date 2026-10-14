#include "spells_fixture.h"

SpellsFixture spells_fixture;
short *DAT_00085a6c;
undefined2 g_cursor_holding_state;
byte DAT_002028d4;
int DAT_002028d0;
undefined4 DAT_002028d8;
char DAT_0023c3e0;
char *DAT_002046c4, *DAT_00202098;
uint DAT_00202094;
undefined1 DAT_0023c3dc, DAT_0023c3d8;

uw_ranged_type_props_t g_ranged_type_props[16];
uw_object_type_props_t g_object_type_props[512];
short DAT_00202a38, DAT_00202a3c, DAT_00202a40, DAT_0023beb4;
ushort *DAT_00202a44;
ushort DAT_00202a48, DAT_00202a4c;
undefined2 DAT_00202a50, DAT_00202a54, g_cursor_mode;
char DAT_00101928;
ushort *g_interact_target;
char *g_selected_object, *DAT_002020b0;
short DAT_000858c4, DAT_002020ac;
code *DAT_002020b8;
void (*const PTR_FUN_000858c8_table[5])(void) = {0};

void push_cursor_icon(int icon)
{ TEST_ASSERT_EQUAL_HEX16(0x1075, icon); spells_fixture.cursor_pushes++; }
void pop_cursor_icon(ushort mode)
{ TEST_ASSERT_EQUAL_INT(3, mode); spells_fixture.cursor_pops++; }
void get_mouse_position(ushort *x, ushort *y)
{ *x=spells_fixture.mouse_x; *y=spells_fixture.mouse_y; }
uw_object_hdr_t *alloc_object_slot(int region)
{
    TEST_ASSERT_EQUAL_INT(1, region);
    spells_fixture.allocations++;
    return spells_fixture.allocation_fails ? NULL : spells_fixture.projectile;
}
int check_object_drop_height(ushort *object, ushort *actor)
{
    TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object);
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor);
    return spells_fixture.placement_allowed;
}
void free_object_slot(uw_object_hdr_t *object)
{ TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object); spells_fixture.frees++; }
int encode_object_slot_index(const uw_object_hdr_t *object)
{ TEST_ASSERT_EQUAL_PTR(g_player_object, object); return 1; }
void object_list_insert_head(ushort *head, uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(spells_fixture.map+(32+64*2)*4+2, head);
    TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object);
    spells_fixture.links++;
}
int play_sound_effect_at_object(int sound, ushort *object, int mode)
{
    TEST_ASSERT_EQUAL_INT(10, sound);
    TEST_ASSERT_EQUAL_PTR(spells_fixture.projectile, object);
    TEST_ASSERT_EQUAL_INT(0, mode);
    spells_fixture.projectile_sounds++;
    return 0;
}

void configure_texture_detail_functions(void) {}
int recalculate_player_stats(int level) { (void)level; return 0; }
void refresh_player_equipment_effects(void) { spells_fixture.equipment_refreshes++; }
int roll_dice_sum(int count, short sides)
{
    spells_fixture.dice_calls++;
    if (spells_fixture.skill_result == -1) {
        TEST_ASSERT_EQUAL_INT(0, count); /* circle-one critical-failure penalty */
        TEST_ASSERT_EQUAL_INT(8, sides);
        return 0;
    }
    TEST_ASSERT_EQUAL_INT(3, count);
    TEST_ASSERT_EQUAL_INT(20, sides);
    return 9;
}
void weapon_overlay_flash_once(int frame) { TEST_ASSERT_EQUAL_HEX16(0xa8, frame); }
int roll_skill_check(int skill, int difficulty)
{
    TEST_ASSERT_EQUAL_INT((byte)spells_fixture.character[0x2a] + 5, skill);
    TEST_ASSERT_EQUAL_INT(2, difficulty);
    spells_fixture.skill_checks++;
    return spells_fixture.skill_result;
}
void wait_for_click_release(int mode)
{ TEST_ASSERT_EQUAL_INT(1, mode); spells_fixture.click_releases++; }
int play_sound_effect_with_pan(uint sound, byte pan, uint mode)
{
    TEST_ASSERT_EQUAL_INT(0x40, pan);
    TEST_ASSERT_EQUAL_INT(0, mode);
    spells_fixture.sound = sound;
    return 0;
}
void print_scroll_message_by_id(uint id)
{ spells_fixture.messages++; spells_fixture.message_id = id; }
void print_not_a_spell_message(void) { TEST_FAIL_MESSAGE("Runes must match the real spell table"); }
void *tilemap_lookup(short x, short y)
{
    TEST_ASSERT_EQUAL_INT(32, x);
    TEST_ASSERT_EQUAL_INT(2, y);
    spells_fixture.tile_checks++;
    return spells_fixture.map + (x + 64*y)*4;
}
/* Fail on unrelated dispatcher branches, rather than substituting its real
   light effect with a success stub and hiding the pointer truncation. */
#define UNUSED_EFFECT(name) void name(void) { TEST_FAIL_MESSAGE("Unexpected " #name); }
void trigger_player_jump_if_grounded(char *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected trigger_player_jump_if_grounded"); }
void apply_healing_effect(ushort *object, char effect_code) { (void)object; (void)effect_code; TEST_FAIL_MESSAGE("Unexpected apply_healing_effect"); }
void cast_cone_damage_spell(void *caster, uint spell_variant) { (void)caster; (void)spell_variant; TEST_FAIL_MESSAGE("Unexpected cast_cone_damage_spell"); }
void cast_targeted_search_effect(void *caster, uint spell_variant) { (void)caster; (void)spell_variant; TEST_FAIL_MESSAGE("Unexpected cast_targeted_search_effect"); }
void cast_summon_or_spawn_effect(void *caster, char variant) { (void)caster; (void)variant; TEST_FAIL_MESSAGE("Unexpected cast_summon_or_spawn_effect"); }
void adjust_level7_hazard_value(void *object, char delta) { (void)object; (void)delta; TEST_FAIL_MESSAGE("Unexpected adjust_level7_hazard_value"); }
void dispatch_player_command(ushort *actor, int unused, char command) { (void)actor; (void)unused; (void)command; TEST_FAIL_MESSAGE("Unexpected dispatch_player_command"); }
void handle_level4_maze_puzzle_button(short button, int tile_x, int tile_y) { (void)button; (void)tile_x; (void)tile_y; TEST_FAIL_MESSAGE("Unexpected handle_level4_maze_puzzle_button"); }
void display_book_or_scroll_page(uint page_id) { (void)page_id; TEST_FAIL_MESSAGE("Unexpected display_book_or_scroll_page"); }
void scheduler_tick(int elapsed) { (void)elapsed; TEST_FAIL_MESSAGE("Unexpected scheduler_tick"); }
UNUSED_EFFECT(handle_game_view_click_hold)
UNUSED_EFFECT(interact_use)
void describe_picked_terrain(byte terrain_kind, short step_count) { (void)terrain_kind; (void)step_count; TEST_FAIL_MESSAGE("Unexpected describe_picked_terrain"); }
void handle_object_drop_target(short widget) { (void)widget; TEST_FAIL_MESSAGE("Unexpected handle_object_drop_target"); }
#undef UNUSED_EFFECT
ushort *pick_object_under_cursor(int mode)
{ (void)mode; TEST_FAIL_MESSAGE("Magic Arrow must not require picking a target"); return NULL; }
int target_in_range(short range_squared, void *actor, char *target)
{ TEST_FAIL_MESSAGE("Unexpected target_in_range"); return 0; }
int target_line_of_sight(short target_class, void *target)
{ TEST_FAIL_MESSAGE("Unexpected target_line_of_sight"); return 0; }

void spells_fixture_ready_ort_jux(int mana)
{
    spells_fixture.character[0x47]=14; /* Ort */
    spells_fixture.character[0x48]=9;  /* Jux */
    spells_fixture.character[0x49]=24;
    spells_fixture.character[0x37]=mana;
}
void spells_fixture_fire(void)
{
    spells_fixture.input[8]=1;
    spells_fixture.input[6]=2; /* right-click release in the 3D view */
    handle_game_view_click();
}

void spells_fixture_ready_in_lor(int mana)
{
    spells_fixture.character[0x47]=8;  /* In */
    spells_fixture.character[0x48]=11; /* Lor */
    spells_fixture.character[0x49]=24; /* empty third rune */
    spells_fixture.character[0x37]=mana;
}
void spells_fixture_reset(void)
{
    memset(&spells_fixture, 0, sizeof spells_fixture);
    uw_test_create_character(spells_fixture.character, spells_fixture.attributes,
                             spells_fixture.player);
    uw_test_load_map(spells_fixture.map, sizeof spells_fixture.map, 1);
    /* The player is a mobile object below the static-object table, matching
       the dispatcher's original object-position/no-magic branch. */
    spells_fixture.player[11]=(32 << 10) | (2 << 4);
    DAT_002046c4=(char *)spells_fixture.map+0x5b00;
    TEST_ASSERT_TRUE((uintptr_t)g_player_object < (uintptr_t)DAT_002046c4);
    DAT_00085a6c=spells_fixture.input;
    DAT_002028d4=DAT_002028d8=DAT_002028d0=0;
    DAT_0023c3e0=0;
    g_cursor_holding_state=0;
    uint regeneration_budget=1000;
    memcpy(spells_fixture.character+0xce, &regeneration_budget, sizeof regeneration_budget);
    spells_fixture_ready_in_lor(20);
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    uw_test_read_data("DATA/OBJECTS.DAT", ((byte *)g_ranged_type_props), 0x30,
                      2+0x80, SEEK_SET);
    DAT_00202a38=DAT_00202a3c=DAT_00202a40=DAT_0023beb4=0;
    DAT_00202a44=NULL;
    DAT_00202a48=DAT_00202a4c=DAT_00202a50=DAT_00202a54=0;
    spells_fixture.mouse_x=138;
    spells_fixture.mouse_y=77;
    spells_fixture.placement_allowed=1;
    spells_fixture.skill_result=1;
    spells_fixture.equipment_refreshes=0;
    spells_fixture.sound=-1;
}

int g_debug_godmode;

#include "spell_effects_fixture.h"
#define fx spell_effects_fixture
SpellEffectsFixture spell_effects_fixture;
undefined1 DAT_0023c3dc, DAT_0023c3d8, DAT_0010142c;
char DAT_00101740_backing[448];
undefined4 DAT_00101440;
byte DAT_00101450, DAT_00101730;
uw_monster_type_props_t *DAT_00101404;
undefined1 DAT_000878d0_backing[256];
uw_object_type_props_t g_object_type_props[512];
undefined2 DAT_0023ae40_backing[16];

void spell_effects_fixture_reset(void)
{
    memset(&fx, 0, sizeof fx);
    uw_test_create_character(fx.character, fx.attributes, fx.player);
    fx.player[11]=(32<<10)|(2<<4);
    fx.target[0]=0x40;
    fx.target[3]=0x40; /* locked object */
    fx.target[6]=1;
    memset(DAT_00101740_backing, 0, sizeof DAT_00101740_backing);
    DAT_0010142c=0;
}
int execute_spell_effect(uint type, uint parameter, void *actor, void *context)
{
    fx.dispatched_type=type; fx.dispatched_parameter=parameter;
    fx.dispatched_actor=(uintptr_t)actor; fx.dispatched_context=(intptr_t)context;
    return 1;
}
/* The fixture lays objects out as raw words; this is the single boundary
 * where that storage is viewed as a game object record. */
static uw_object_hdr_t *raw_object(ushort *words)
{ return (uw_object_hdr_t *)words; }

int encode_object_slot_index(const uw_object_hdr_t *object)
{
    if (object == raw_object(fx.effect)) return 2;
    TEST_ASSERT_EQUAL_PTR(g_player_object, object);
    return 1;
}
void project_position_by_heading(int heading, short distance, void *x, void *y)
{
    (void)heading;
    TEST_ASSERT_EQUAL_INT(4, distance);
    TEST_ASSERT_EQUAL_INT(32, *(ushort *)x); TEST_ASSERT_EQUAL_INT(2, *(ushort *)y);
}
/* Isolate scanning geometry, but execute the restored callback with real
   host addresses and the same register arguments as the ARM scanner. */
void scan_area_for_matching_objects(char count, byte owner, int (*callback)(), char mode, char x, char y, char width, char height)
{
    (void)count; (void)mode;
    TEST_ASSERT_EQUAL_INT(1, owner);
    TEST_ASSERT_EQUAL_INT(30, x); TEST_ASSERT_EQUAL_INT(0, y);
    TEST_ASSERT_EQUAL_INT(5, width); TEST_ASSERT_EQUAL_INT(5, height);
    fx.scans++;
    if (callback) ((int (*)(int,int,void *,void *,int))callback)(32, 2, fx.target, fx.tile, owner);
}
int roll_dice_sum(int count, short sides)
{ fx.dice_count=count; fx.dice_sides=sides; return count*sides; }
void * tilemap_lookup(short x, short y)
{ return x == fx.los_x && y == fx.los_y ? fx.los_tile : fx.tile; }
uw_object_hdr_t *resolve_object_link(uw_link_word_t *link)
{ return (byte *)link == fx.tile+2 ? raw_object(fx.target) : NULL; }
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{ TEST_ASSERT_EQUAL_INT(1, slot); return &g_player_object->hdr; }
int apply_typed_damage_to_object(uw_unaligned_word_t *target, uw_unaligned_word_t *attacker, int x, short y, byte damage, byte type)
{
    TEST_ASSERT_EQUAL_PTR(fx.target, target);
    TEST_ASSERT_EQUAL_PTR(g_player_object, attacker);
    (void)x; (void)y;
    fx.damage_calls++; fx.damage=damage; fx.damage_type=type;
    return 0;
}
void * spawn_and_prime_spell_effect_object(int type, byte *tile)
{
    TEST_ASSERT_EQUAL_PTR(fx.tile, tile);
    TEST_ASSERT_TRUE(type == 0x1c2 || type == 0x1c5);
    fx.spawns++;
    return fx.effect;
}
uint scheduler_add_entry(uint slot, int type, byte delay, byte x, byte y)
{
    TEST_ASSERT_EQUAL_INT(2, slot); TEST_ASSERT_EQUAL_INT(4, type);
    (void)delay; TEST_ASSERT_EQUAL_INT(32, x); TEST_ASSERT_EQUAL_INT(2, y);
    return 0;
}
void free_object_slot(uw_object_hdr_t *object)
{ (void)object; TEST_FAIL_MESSAGE("Unexpected allocation failure"); }
void object_list_insert_head(uw_link_word_t *head, uw_object_hdr_t *object)
{
    TEST_ASSERT_EQUAL_PTR(fx.tile+2, head); TEST_ASSERT_EQUAL_PTR(fx.effect, object);
    fx.links++;
}
void spawn_effect_debris_burst(void *object, uint x, int y)
{ TEST_ASSERT_EQUAL_PTR(fx.effect, object); (void)x; (void)y; }
uw_object_hdr_t *find_object_in_chain(uw_link_word_t **head, int a, int b, int c,
				      short d)
{ (void)head; (void)a; (void)b; (void)c; (void)d; return raw_object(fx.target+3); }
uint resolve_skill_gated_unlock_or_use(void *actor, void *target, void *link, ushort mode)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor); TEST_ASSERT_EQUAL_PTR(fx.target, target);
    TEST_ASSERT_EQUAL_PTR(fx.target+3, link); TEST_ASSERT_EQUAL_INT(5, mode); fx.unlocks++; return 1;
}
int resolve_damage_type_resistance(uw_unaligned_word_t *object, int damage, uint type)
{ TEST_ASSERT_EQUAL_PTR(fx.target, object); (void)damage; (void)type; return fx.resist; }
int spawn_scheduled_effect_object(uw_unaligned_word_t *object, int group, int variant, byte a, short b, short x, short y)
{
    TEST_ASSERT_EQUAL_PTR(fx.target, object);
    TEST_ASSERT_EQUAL_INT(7, group); fx.variant=variant; fx.effects++;
    (void)a; (void)b; TEST_ASSERT_EQUAL_INT(32, x); TEST_ASSERT_EQUAL_INT(2, y); return 1;
}
void npc_set_goal_for_object(uw_mobile_object_t *object, int goal, int mode)
{
    TEST_ASSERT_EQUAL_PTR(fx.target, object); fx.goal_mode=mode;
    fx.goal=goal; fx.goal_changes++;
}
void configure_texture_detail_functions(void) {}
void refresh_player_equipment_effects(void) {}

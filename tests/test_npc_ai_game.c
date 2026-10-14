/* NPC perception, chasing and attacking, run in the real game: a real level-1 monster, the real line of
   sight and pathing, and the real damage to the player. */
#include "unity.h"
#include "game_test_runner.h"
#include "src/headers/unit_test_hooks.h"
#include "src/headers/uw.h"
#include "src/headers/player.h"

void setUp(void) {}
void tearDown(void) {}

#define GIANT_RAT 0x41
#define HOSTILE 0

/* The first hostile level-1 monster of this type (a rat at (26,33)). */
static uw_mobile_object_t *find_hostile(unsigned object_id)
{
    for (unsigned slot = 2; slot < 256; slot++) {
        uw_mobile_object_t *m = (uw_mobile_object_t *)uw_test_live_object(slot);
        if (m && (*(unsigned short *)m & 0x1ff) == object_id && m->npc_attitude == HOSTILE &&
            uw_test_find_object_on_tile(m->tile_x, m->tile_y, object_id) == (unsigned short *)m)
            return m;
    }
    return NULL;
}

static uw_mobile_object_t *npc;
static int start_hp, min_hp, goals_seen, npc_start_x, npc_start_y, npc_tile_distance_closest, ticks;

static int tile_distance(void)
{
    return abs(npc->tile_x - g_player_object->tile_x) + abs(npc->tile_y - g_player_object->tile_y);
}

/* Put the player on an open tile next to the monster. */
static void place_player_beside_npc(void)
{
    npc = find_hostile(GIANT_RAT);
    TEST_ASSERT_NOT_NULL_MESSAGE(npc, "hostile giant rat on level 1");
    npc_start_x = npc->tile_x;
    npc_start_y = npc->tile_y;
    for (int dy = -1; dy <= 1; dy++)
        for (int dx = -1; dx <= 1; dx++) {
            unsigned char *tile = uw_test_live_tile(npc_start_x + dx, npc_start_y + dy);
            if ((dx || dy) && tile && (tile[0] & 0xf) == 1) {
                set_player_tile_position(npc_start_x + dx, npc_start_y + dy, 1);
                start_hp = min_hp = g_player_object->npc_hp;
                npc_tile_distance_closest = tile_distance();
                return;
            }
        }
    TEST_FAIL_MESSAGE("no open tile beside the rat");
}

static void watch_fight(void)
{
    ticks++;
    if (g_player_object->npc_hp < min_hp) min_hp = g_player_object->npc_hp;
    if (npc->npc_goal == 5) goals_seen++;
    if (min_hp < start_hp || ticks >= 1500) test_game_request_exit();
}

static void test_hostile_rat_beside_the_player_attacks_and_hurts_them(void)
{
    uw_test_hooks hooks = { .on_game_start = place_player_beside_npc, .post_game_tick = watch_fight, .max_ticks = 2000 };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_GREATER_THAN_INT_MESSAGE(0, goals_seen, "the rat should enter its attack goal");
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(start_hp, min_hp, "the rat should have hurt the player");
}

/* A rat that is nowhere near the player never notices them. */
static void leave_player_at_spawn(void)
{
    npc = find_hostile(GIANT_RAT);
    TEST_ASSERT_NOT_NULL(npc);
    start_hp = min_hp = g_player_object->npc_hp;
}

static void test_distant_rat_does_not_attack(void)
{
    uw_test_hooks hooks = { .on_game_start = leave_player_at_spawn, .post_game_tick = watch_fight, .max_ticks = 2000 };
    TEST_ASSERT_EQUAL_INT(0, start_test_game(&hooks));
    TEST_ASSERT_EQUAL_INT(start_hp, min_hp);
    TEST_ASSERT_EQUAL_INT(0, goals_seen);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_GAME_TEST(test_hostile_rat_beside_the_player_attacks_and_hurts_them);
    RUN_GAME_TEST(test_distant_rat_does_not_attack);
    return UNITY_END();
}

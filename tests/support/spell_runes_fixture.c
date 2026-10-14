#include "unity.h"
#include "src/headers/uw.h"
#include <string.h>

/* Real rune recognition and cast checks; UI, RNG and effects are fixtures. */
char *DAT_00086df8;
uw_mobile_object_t *g_player_object;
short *DAT_00085a6c;
undefined2 g_cursor_holding_state;
int DAT_002028d0;
byte DAT_002028d4;
undefined4 DAT_002028d8;
char DAT_0023c3e0;
char s_Not_a_spell_00085a80[] = "Not a spell";
byte player[256];
ushort object[16];
short click[8];
int invalid_spells, effects, effect_type, effect_param, sound, failure;
int skill_result;
void wait_for_click_release(int buttons) { TEST_ASSERT_EQUAL_INT(1, buttons); }
int message_scroll_print_wrapped(char *message)
{
    TEST_ASSERT_EQUAL_STRING("Not a spell", message);
    invalid_spells++;
    return 1;
}
int play_sound_effect_with_pan(uint id, byte pan, uint mode) { sound = id; return 1; }
void print_scroll_message_by_id(uint id) { failure = id; }
int roll_skill_check(int skill, int difficulty) { return skill_result; }
int execute_spell_effect(uint type, uint param, void *caster, void *target)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, caster);
    TEST_ASSERT_EQUAL_PTR(g_player_object, target);
    effects++;
    effect_type = type;
    effect_param = param;
    return 1;
}
void spell_runes_fixture_reset(void)
{
    memset(player, 0, sizeof player);
    memset(click, 0, sizeof click);
    DAT_00086df8 = (char *)player;
    g_player_object = (uw_mobile_object_t *)object;
    DAT_00085a6c = click;
    player[0x3d] = 15; /* enough level and mana for every circle */
    player[0x37] = 100;
    player[0x47] = player[0x48] = player[0x49] = 24;
    player[0xce] = 100;
    DAT_002028d0 = DAT_002028d4 = DAT_002028d8 = DAT_0023c3e0 = 0;
    g_cursor_holding_state = 0;
    invalid_spells = effects = effect_type = effect_param = sound = failure = 0;
    skill_result = 1;
}
void spell_runes_fixture_dispose(void) {}
void ready_runes(int first, int second, int third)
{
    player[0x47] = first; player[0x48] = second; player[0x49] = third;
}

int g_debug_godmode;

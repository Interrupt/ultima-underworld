#ifndef UW_TEST_SPELL_RUNES_FIXTURE_H
#define UW_TEST_SPELL_RUNES_FIXTURE_H
#include "unity.h"
#include "../spell_runes_test_globals.h"
void wait_for_click_release(int buttons);
int message_scroll_print_wrapped(char *message);
int play_sound_effect_with_pan(uint id, byte pan, uint mode);
void print_scroll_message_by_id(uint id);
int roll_skill_check(int skill, int difficulty);
int execute_spell_effect(uint type, uint param, void *caster, void *target);
void spell_runes_fixture_reset(void);
void spell_runes_fixture_dispose(void);
void ready_runes(int first, int second, int third);
#endif

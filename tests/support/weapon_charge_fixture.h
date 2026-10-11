#ifndef UW_TEST_WEAPON_CHARGE_FIXTURE_H
#define UW_TEST_WEAPON_CHARGE_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"

/* Drives the real tick_weapon_swing_state with a controlled clock, button and weapon record. */
extern uint weapon_charge_clock;      /* value read_realtime_clock_units() returns */
extern int weapon_charge_button_held; /* attack button state */
extern int gem_updates;               /* set_hud_status_value(3, ...) calls since reset */
extern ushort gem_values[256];        /* the values passed */
extern int melee_swings;              /* process_melee_attack_swing() calls */
extern int swing_charge_at_release;   /* DAT_001005fc when the swing was resolved */
void weapon_charge_fixture_reset(void);
/* Press the attack button (direction 1) so the swing begins charging. */
void weapon_charge_start(void);
/* One game tick while the button is held (or not). */
void weapon_charge_tick(void);
int weapon_charge_value(void);        /* DAT_00100614, the 0-100 charge */
#endif

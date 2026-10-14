#include "weapon_charge_fixture.h"

/* The real swing state machine (tick_weapon_swing_state and its reset/icon helpers) runs here.
   Controlled: the clock, the attack button, the equipped weapon's attack record, and the HUD,
   cursor and combat services it calls. */
undefined4 DAT_001005ec;
short DAT_00100618;
short DAT_001005e8;
uint DAT_001005f0;
byte DAT_00100614;
undefined2 g_cursor_holding_state;
short DAT_00084f10;
short DAT_0010062c;
short DAT_00100610;
byte DAT_001005fc;
char *DAT_001005e4;
char *DAT_001005e0;
char *DAT_00086df8, *DAT_0023be74;
undefined DAT_00250658_backing[256];

uint weapon_charge_clock;
int weapon_charge_button_held, gem_updates, melee_swings, swing_charge_at_release;
ushort gem_values[256];
static char character[256], attributes[256], weapon_object[64];
/* Attack record: [3] base power, [4] charge gained per step, [5] maximum. */
static char attack_record[16] = {0, 0, 0, 10, 5, 90};

uint read_realtime_clock_units(void) { return weapon_charge_clock; }
int poll_keyboard_char_input(void *out_char)
{
    (void)out_char;
    return weapon_charge_button_held ? 2 : 0;
}
void set_hud_status_value(byte slot, ushort value)
{
    if (slot == 3) {
        TEST_ASSERT_LESS_THAN_INT(256, gem_updates);
        gem_values[gem_updates++] = value;
    }
}
void push_cursor_icon(int icon) { (void)icon; }
void pop_cursor_icon(ushort flags) { (void)flags; }
int is_mouse_within_tracked_hotspot(void) { return 1; }
void fire_ranged_weapon(short weapon_type) { (void)weapon_type; }
int resolve_equipped_weapon_attack(char **out_attack_data, char **out_weapon_object)
{
    *out_attack_data = attack_record;
    *out_weapon_object = weapon_object;
    return 1; /* a melee weapon */
}
void compute_player_weapon_attack_stats(char *stats, char *weapon, short attack_type)
{ (void)stats; (void)weapon; (void)attack_type; }
int process_melee_attack_swing(void)
{
    melee_swings++;
    swing_charge_at_release = DAT_001005fc;
    return 1;
}

void weapon_charge_fixture_reset(void)
{
    memset(character, 0, sizeof character);
    memset(attributes, 0, sizeof attributes);
    memset(DAT_00250658_backing, 0, sizeof DAT_00250658_backing);
    DAT_00086df8 = character;
    DAT_0023be74 = attributes;
    character[0x5f] = 2; /* weapon readied */
    DAT_000870e4 = -1;
    DAT_001005ec = 0;
    DAT_00100618 = 0;
    DAT_001005e8 = -1;
    DAT_001005f0 = 0;
    DAT_00100614 = 0;
    DAT_00084f10 = 0;
    DAT_0010062c = 0;
    DAT_00100610 = -1;
    g_cursor_holding_state = 0;
    weapon_charge_clock = 1000;   /* well past one byte */
    weapon_charge_button_held = 1;
    gem_updates = melee_swings = swing_charge_at_release = 0;
}

void weapon_charge_start(void)
{
    tick_weapon_swing_state(1);
    TEST_ASSERT_LESS_THAN_INT(0, DAT_0010062c);
    /* The wind-up animation reaches its held frame (3), where the charge builds. */
    DAT_000870e4 = 3;
}
void weapon_charge_tick(void) { tick_weapon_swing_state(0); }
int weapon_charge_value(void) { return DAT_00100614; }

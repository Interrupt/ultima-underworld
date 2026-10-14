#ifndef HEADERS_INTERACT_H
#define HEADERS_INTERACT_H

/* Declarations for interact.c: object interaction dispatch (default
 * click, talk/look/use/attack). Pulls in uw.h itself so this header
 * is self-contained for any caller. */
#include "uw.h"

extern ushort DAT_001007c4;
extern char s__DATA_cnv_ark_00084fc8[];
extern ushort *DAT_0024cff0;
/* Globals defined in uw.c but also used by functions that now live in
   interact.c (object interaction dispatch) -- extern'd here so both
   translation units see the same storage. */
extern short DAT_000858c4;
extern char * DAT_002020b0;
extern short DAT_002020ac;
extern void (*const PTR_FUN_000858c8_table[5])();


void attempt_talk_interaction(void *target);
int target_in_range(short range_squared, void *actor, char *target);
uint object_chain_max_barrier(char *tile);
int target_line_of_sight(short target_class, void *target);
ushort *pick_object_under_cursor(int mode);
void describe_picked_terrain(byte terrain_kind, short step_count);
int resolve_picked_terrain_texture(short pick, char **out_desc);
void finalize_object_pickup(void *object);
void interact_default();
void interact_talk_npc();
void interact_look();
void interact_use();
void interact_attack();
/* E / Q hotkeys: act on the object under the cursor without a click. */
void quick_use_object_at_cursor(int unused);
void quick_look_at_cursor(int unused);
void trigger_terrain_discovery_illustration();
void trigger_inscription_illustration(int first_char);
int roll_container_lockpick_check(void *container, int skill);
int roll_container_trap_disarm_check(void *container, int skill);
uint resolve_skill_gated_unlock_or_use(void *object, void *key_item, void *lock_link, ushort key_id);
int apply_trap_or_link_effect(void *trigger_object, void *trigger_link, void *trap_record, int tile_x, int tile_y);
void purge_tagged_objects_from_chain(void *link_field);
void refresh_object_link_chain(void *chain_link, void *object);

#endif

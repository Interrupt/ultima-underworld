#ifndef HEADERS_ITEM_USE_H
#define HEADERS_ITEM_USE_H

/* Declarations for item_use.c: weapon ready/unready, drop/pickup,
 * light sources, food, combine/stow. Pulls in uw.h itself so this
 * header is self-contained for any caller. */
#include "uw.h"

extern char DAT_00085ce0_backing[32];
#define DAT_00085ce0 DAT_00085ce0_backing[0]
extern char s_You_read_the_00085ce8[];
/* Globals defined in uw.c but also used by functions that now live in
   item_use.c (item use) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00202a28_backing[256];
#define g_food_effect_table DAT_00202a28_backing[0]
extern undefined4 g_weapon_overlay_enabled;
extern char s_UNNAMED_00084f24[];
extern char *DAT_00202098;


int objects_are_combinable(ushort *object_a, ushort *object_b);
void *spawn_combined_object(short combination_index);
bool is_object_consumed_in_combination(ushort *object, short combination_index);
int check_offering_container_puzzle();
int try_climb_wall();
void use_lockpick_on_object(ushort *lock, int skill, int show_prompt);
void ready_weapon();
void unready_weapon();
void handle_object_drop_target(short widget);
bool place_object_in_equipment_slot(ushort *equip_object, int slot);
void redraw_backpack_slot_widget(short slot);
int place_object_in_backpack_slot(ushort *pack_object, short slot);
int find_or_assign_object_widget(void *object);
ushort *find_equipped_item_by_category(int category, int subcategory, int quality, short full_scan, void *out_slot);
uw_object_hdr_t *find_object_in_link_chain(int category, int subcategory, int quality, uw_object_hdr_t **chain);
ushort *resolve_clicked_inventory_item(short zone);
ushort *get_equipped_item_at_widget_slot(short slot);
void deplete_object_count(ushort *object);
void decrement_object_count(ushort *object);
int reduce_object_count(ushort *stack_object, uint amount);
ushort *extract_clicked_backpack_item(int category, int subcategory, int quality, short slot);
ushort *extract_ammo_and_refresh(int category, int subcategory, int quality, short slot);
ushort *extract_and_refresh_slot_item(int category, int subcategory, int quality, short slot, ushort flag);
ushort *extract_matching_object_from_slot(int category, int subcategory, int quality, short slot, ushort flag);
void attach_picked_up_object_to_cursor(ushort *object);
int load_armor_overlay_frame(int frame_index, int variant);
void redraw_armor_overlay_widgets();
void swap_cursor_and_slot_item(int slot, int mode);
byte *prompt_split_object_stack(byte *object);
uint check_object_fits_in_slot(ushort *object, int slot);
void handle_backpack_slot_click(short slot);
int place_held_item_in_empty_slot(void *held_object, short target_slot);
int objects_can_stack(const uw_object_hdr_t *object_a,
		      const uw_object_hdr_t *object_b);
int handle_backpack_slot_interact(void *object, uint slot);
bool compute_drop_aim_from_cursor();
int drop_held_object_near_player(void *held_object, int force);
int drop_object_near_target(void *actor, void *object, short mode, uint flags);
ushort *use_object_on_target(ushort *actor, ushort *used_object, int flag);
bool finish_object_use(void *used_object, int consume, int force_discard);
short *begin_holding_object_on_cursor(short *object, uint object_type);
void complete_use_reagent_on_player(ushort *target, int clicked);
void complete_use_item_on_player(ushort *target, int clicked);
void arm_use_item_on_player_prompt(ushort *item, int confirmed);
void prompt_use_item_on_target(ushort *item, void (*completion)());
void complete_use_item_on_special_target(ushort *target);
void arm_use_item_on_special_target_prompt(ushort *item, int confirmed);
void complete_use_item_on_quest_target(ushort *target, int consume);
void complete_use_item_on_container(ushort *target);
void complete_use_item_skill_check(ushort *target, int clicked, int confirmed);
void arm_use_item_on_target_prompt(ushort *item, int confirmed);
int apply_random_roll_to_matched_object(char *object, short max_roll);
void complete_use_item_special_quest_event(ushort *target, int confirmed, int unused);
void complete_use_item_on_flagged_tile(ushort *target, int consume);
void dispatch_use_held_item_by_type(ushort *target, ushort *item, int confirmed);
void use_light_source(ushort *object, int turn_on);
void refuel_light_source_item(void *item, uint refuel);
int use_food_item(void *actor, ushort *object, int consume);
void complete_use_item_scatter_spawn(short *target, int clicked, int confirmed);
void complete_use_item_fill_flask(ushort *target, int clicked, int confirmed);
void dispatch_use_special_item_by_type(ushort *actor, ushort *item, int flag);
void use_readable_item(ushort *item, int flag);
void dispatch_world_object_interaction_by_family(ushort *actor, ushort *object);
int trigger_object_use_babl_script(int context_x, int context_y, void *actor, void *object, int confirmed);
void trigger_object_trap_or_use_action(void *actor, void *object, int action, int tile_x, short tile_y);
void try_combine_or_stow_object(void *actor, ushort *object, int stow);

#endif

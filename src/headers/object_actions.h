#ifndef HEADERS_OBJECT_ACTIONS_H
#define HEADERS_OBJECT_ACTIONS_H

/* Declarations for object_actions.c: object action dispatch, critter sprite tier/page resolution,
   and placement/combination checks. Pulls in uw.h itself so this header is self-contained for any
   caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in object_actions.c (object
   action dispatch, critter sprite tier/page, placement/combination checks) -- extern'd here so both
   translation units see the same storage. */
extern ushort DAT_002022f8;
extern int DAT_002022fc;
extern ushort DAT_00202508;
extern undefined1 DAT_0023ce70_backing[128];
#define DAT_0023ce70 DAT_0023ce70_backing[0]
#define DAT_0023ce71 DAT_0023ce70_backing[1]

extern char s_You_see_000858fc[];
extern undefined1 DAT_0023c3dc;
extern undefined1 DAT_0023c3d8;
extern uint DAT_00202094;


int decode_critter_sprite_page(int page_base, int page_index, short column, short row, short frame);
int resolve_critter_sprite_tier(short type_idx, int direction, short frame, uint shade);
int init_monster_spawn_defaults();
void dispatch_object_action(ushort *object, int mode);
bool check_object_carry_weight(uw_unaligned_word_t *object);
void dispatch_object_action_dup(ushort *object, int mode);
int append_object_property_tag(ushort *object, short mode, char *out_text);
int append_object_special_name(void *object, short mode, char *out_text);
void look_at_inscribed_object(uw_unaligned_word_t *inscribed_object, short look_mode);
void describe_object_owner(ushort *object, short mode);
void print_object_flavor_text(ushort *object, short mode);
void describe_special_object_property(ushort *object, short mode);
int identify_mushroom_type(ushort *object, const uw_object_type_props_t *properties);
int check_object_drop_height(uw_unaligned_word_t *object, uw_unaligned_word_t *reference);
void check_scheduled_object_location_callback();
void dispatch_tile_special_action(uint tile_type, void *actor, void *target);
void reduce_item_quality_on_use(uw_unaligned_word_t *object, char dice_count);
void scan_area_for_matching_objects(char filter_a, byte filter_b, int (*callback)(), char object_class, char x, char y, char width, char height);
void scan_area_ahead_of_object(void *object, int filter_a, int (*callback)(), int object_class, byte distance, char half_width);
void for_each_object_of_type(ushort type_id, int mode, int argument, int (*callback)());
void damage_all_objects_at_tile(int tile_x, short tile_y, char damage_tier, byte attacker_slot);
int build_object_display_name(char *out_text, void *object, int flag_a, int flag_b);
char *format_object_display_name(char *buffer, int flag_a, int flag_b);
void print_scroll_message_by_id(uint message_id);
void print_scroll_message_concat(uint id_a, uint id_b, uint id_c);
int check_object_combination(void *actor, uw_unaligned_word_t *object, short count);
int resolve_object_variant_or_special_link(void *object, void *out_class, void *out_value, void *out_flag);
void clear_object_pending_special_flag(void *object);
void consume_linked_special_object_charge(void *object);
char compute_compass_direction(char dx, char dy);
void print_message_with_proximity_qualifier(char *message, short x1, short y1, short z1, short x2, short y2, short z2, short limit);
void spawn_effect_debris_burst(void *template, uint tile_x, int tile_y);

#endif

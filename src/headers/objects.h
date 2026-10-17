#ifndef HEADERS_OBJECTS_H
#define HEADERS_OBJECTS_H

/* Declarations for objects.c: the object table (slot alloc/free,
 * linked-list primitives, spawning). Pulls in uw.h itself so this
 * header is self-contained for any caller. */
#include "uw.h"

extern undefined2 DAT_002020a0;
extern undefined2 DAT_002020a4;
extern undefined4 DAT_00202c84;
extern uw_object_type_props_t g_object_type_props[512];

/* UW1 COMOBJ properties: 512 native 13-byte records. */
/* BUG FIX (unit-testing-framework merge): this branch's own history had drifted into giving
   DAT_00202c39..3f each their OWN independent backing array... */
#define DAT_00202c39 DAT_00202c38_backing[1]
#define DAT_00202c3a DAT_00202c38_backing[2]
#define DAT_00202c3b DAT_00202c38_backing[3]
#define DAT_00202c3c DAT_00202c38_backing[4]
#define DAT_00202c3d DAT_00202c38_backing[5]
#define DAT_00202c3e DAT_00202c38_backing[6]
#define DAT_00202c3f DAT_00202c38_backing[7]

extern uw_ranged_type_props_t g_ranged_type_props[16];
extern uw_melee_type_props_t g_melee_type_props[16];
extern ushort *DAT_002046b4;
extern undefined1 DAT_0024cfe0_backing[16];
#define DAT_0024cfe0 DAT_0024cfe0_backing[0]
extern uw_animation_type_props_t g_animation_type_props[16];
extern short DAT_00202080;
extern byte * DAT_00202c6c;
extern char * DAT_0023b82c;
extern uw_object_hdr_t *g_scratch_object_ptr;
/* Globals defined in uw.c but also used by functions that now live in
   objects.c (the object table) -- extern'd here so both translation
   units see the same storage. */
extern short DAT_0010144c;
extern short DAT_00101454;
extern short DAT_00202a38;
extern short DAT_00202a3c;
extern short DAT_00202a40;
/* FUN_0004ad10 reads word 1 (position) and word 12 (heading). */
extern ushort * DAT_00202a44;
extern ushort DAT_00202a48;
extern ushort DAT_00202a4c;
extern undefined2 DAT_00202a50;
extern undefined2 DAT_00202a54;
extern char * DAT_0020469c;
extern char * DAT_002046a4;
extern char * DAT_002046a8;
extern char * DAT_002046bc;
extern short DAT_002046b0;
extern byte * DAT_002046c0;
extern byte * DAT_002046c8;
extern uw_container_type_props_t g_container_type_props[16];
extern uw_light_type_props_t g_light_type_props[16];
/* Six-byte collision candidates: top, bottom, packed link, tile offset.
 * Ghidra split overlapping fields (and next-record sort views) into globals. */
extern undefined1 DAT_00202c38_backing[1536];
#define DAT_00202c38 DAT_00202c38_backing[0]


int reset_burnt_out_item_state(char *tile_link, void *object);
int apply_object_destruction_effect(ushort *object, ushort *attacker, uint damage_type_mask, int tile_x, short tile_y);
int find_placement_via_tile_flood_fill(ushort *object, short tile_x, short tile_y, short *out_x, short *out_y, int strict);
int clear_object_temp_flag_callback(ushort *object);
void clear_temp_flags_on_all_objects();
void load_class6_variant_effect_table(int file_handle);
void load_class7_variant_effect_table(int file_handle);
void *class0_variant_effect_table_lookup();
void *class1_variant_effect_table_lookup();
void *class2_variant_effect_table_lookup();
void *class6_variant_effect_table_lookup();
void *class7_variant_effect_table_lookup();
int class3_variant_effect_stub();
int class4_variant_effect_stub();
int class5_variant_effect_stub();
void free_player_inventory_chain(char *link_field);
uint calculate_object_weight(uw_object_hdr_t *object);
uw_object_hdr_t *spawn_object_near_player();
int place_object_in_world(uint tile_x, uint tile_y, int height, void *object, short radius, int skip_roll);
int find_object_placement(ushort *object, uint tile_x, uint tile_y, short height, short radius);
int load_object_catalog_data();
void *get_scanned_object_class_effect_ptr();
int walk_object_tree(void *object, int (*callback)());
int object_exceeds_size_threshold(void *object);
int should_destroy_linked_object(int base_chance, ushort *link_field);
void despawn_objects_outside_radius(int keep_rows, short max_destroyed);
uw_object_hdr_t *alloc_object_slot(int region);
void free_object_slot(uw_object_hdr_t *object);
void object_list_insert_head(ushort *link_field, uw_object_hdr_t *object);
void object_list_append_tail(ushort *link_field, uw_object_hdr_t *object);
void object_list_unlink(ushort *link_field, uw_object_hdr_t *object);
ushort *discard_misplaced_object(void *tile_link, ushort *object, int skip_roll);
void free_linked_object_recursive(ushort *link_field);
void unlink_and_free_object(ushort *link_field, uw_object_hdr_t *object);
uw_object_hdr_t *resolve_object_link(ushort *link_field);
int encode_object_slot_index(const uw_object_hdr_t *object);
uw_object_hdr_t *get_object_record_by_slot_index(short slot_index);
uw_object_hdr_t *find_object_by_encoded_slot_in_chain(ushort *link_field,
						      int recurse, int slot);
int object_is_mobile(const uw_object_hdr_t *object);
void active_mobile_list_add(byte slot);
void active_mobile_list_remove(char slot);
uw_object_hdr_t *find_object_in_chain(ushort **link_cursor, int recurse,
				      int object_class, int subclass,
				      short quality);
int object_or_contents_has_type(void *object, ushort type_id);
uw_object_hdr_t *find_object_in_world(int object_class, int subclass,
				      short quality, short *out_x,
				      short *out_y);
uw_object_hdr_t *reallocate_object_to_arena(ushort *object);
void compute_object_placement_fields(void *object, uint tile_x, uint tile_y);
void randomize_settled_snapshot_position(void *snapshot);
uw_object_hdr_t *settle_dropped_object(void *object, short tile_x,
				       short tile_y, int force);
uw_object_hdr_t *spawn_new_object(uint object_type, int region);

#endif

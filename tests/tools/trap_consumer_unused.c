/* Controlled unused services for the real trap dispatcher oracle. */
char *get_message_string(ushort id)
{ assert(!"Unexpected get_message_string"); return 0; }
int message_scroll_print_wrapped(char *text)
{ assert(!"Unexpected message_scroll_print_wrapped"); return 0; }
void debug_print(char *format, ...) { assert(!"Unexpected debug_print"); return; }
uw_unaligned_word_t *find_equipped_item_by_category(int category, int subcategory, int quality, short full_scan, void *out_slot) { assert(!"Unexpected find_equipped_item_by_category"); return 0; }
void set_pending_update_flags(ushort flags) { assert(!"Unexpected set_pending_update_flags"); return; }
void spawn_trap_hazard_object(uw_unaligned_word_t *trap_record, short tile_x, short tile_y) { assert(!"Unexpected spawn_trap_hazard_object"); return; }
uw_object_hdr_t *find_object_in_chain(ushort **link_cursor, int recurse,
				      int object_class, int subclass,
				      short quality) { assert(!"Unexpected find_object_in_chain"); return 0; }

int apply_poison_or_damage_trap_effect(int object_slot, uint damage_delta, int unused_a, int unused_b) { assert(!"Unexpected apply_poison_or_damage_trap_effect"); return 0; }
void close_door_object(void *actor, uw_unaligned_word_t *door) { assert(!"Unexpected close_door_object"); return; }
int dispatch_quest_event_code(void *trap_record, int tile_x, int tile_y) { assert(!"Unexpected dispatch_quest_event_code"); return 0; }
int dispatch_trap_special_or_tile_action(byte context_x, byte context_y, void *tile_x, void *tile_y, ushort action_id, byte argument) { assert(!"Unexpected dispatch_trap_special_or_tile_action"); return 0; }
void object_list_insert_head(ushort *link_field, uw_object_hdr_t *object) { assert(!"Unexpected object_list_insert_head"); return; }
void open_door_object(void *door) { assert(!"Unexpected open_door_object"); return; }
void print_message_with_proximity_qualifier(char *message, short x1, short y1, short z1, short x2, short y2, short z2, short limit) { assert(!"Unexpected print_message_with_proximity_qualifier"); return; }
uint resolve_skill_gated_unlock_or_use(void *object, void *key_item, void *lock_link, ushort key_id) { assert(!"Unexpected resolve_skill_gated_unlock_or_use"); return 0; }
int teleport_object_to_level_tile(void *object, int tile_x, int tile_y, short level_number) { assert(!"Unexpected teleport_object_to_level_tile"); return 0; }
void toggle_door_object(char *actor, void *door) { assert(!"Unexpected toggle_door_object"); return; }
void unlink_and_free_object(ushort *link_field, uw_object_hdr_t *object) { assert(!"Unexpected unlink_and_free_object"); return; }

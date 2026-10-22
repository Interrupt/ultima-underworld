#ifndef HEADERS_CONTAINERS_H
#define HEADERS_CONTAINERS_H

/* Declarations for containers.c: the open-container/backpack view stack, auto-place/empty logic,
   and equipped-item slot encoding. Pulls in uw.h itself so this header is self-contained for any
   caller. */
#include "uw.h"

extern char * g_open_container_list;
/* Globals defined in uw.c but also used by functions that now live in
   containers.c (the open-container/backpack view stack) -- extern'd
   here so both translation units see the same storage. */
extern char DAT_00085c88_backing[128];
#define DAT_00085c88 DAT_00085c88_backing[0]


void scroll_container_grid_up();
void scroll_container_grid_down();
int discard_container_contents(uw_object_hdr_t *container, int remove_all);
void release_container_reference(char *container_link);
void free_open_container_chain();
void close_backpack_container();
void leave_nested_container_level();
void refresh_container_view();
void repopulate_container_grid_slots();
void open_backpack_container(short container_slot);
int auto_place_in_container(void *object, short slot);
void sum_container_weight(uw_link_word_t *link_field, short *total_weight);
void encode_equipped_item_index(uw_link_word_t *item_link, uw_link_word_t *out_index);
void decode_equipped_item_index(uw_link_word_t *saved_index, uw_link_word_t *out_link);
int place_rune_in_bag(uw_object_hdr_t *rune_object);
uw_object_hdr_t *get_equipped_item_at_slot(short slot);
void reset_equipment_and_container_state();
int empty_container_into_world(void *container, short clear_flag);
void try_empty_container(uw_object_hdr_t *container, int owned_by_player);

#endif

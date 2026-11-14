#ifndef HEADERS_RESOURCES_H
#define HEADERS_RESOURCES_H

/* Declarations for resources.c: .GR bitmap resource loading, the
 * flip-grtile capture slots, and door-frame loading. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in
   resources.c (.GR bitmap loading, flip-grtile slots, door frames) --
   extern'd here so both translation units see the same storage. */
extern ushort DAT_00202744;
extern undefined1 DAT_0023b840_backing[8];

#define DAT_0023b841 DAT_0023b840_backing[1]

#define DAT_0023b840 DAT_0023b840_backing[0]
extern uw_armor_type_props_t g_armor_type_props[32];
extern void * g_grtile_real_ptrs[320];
extern char s__DATA__00085970[];


/* Forward declaration needed because register_grtile_entry (much earlier in uw.c)
   calls this before its own definition later in the file -- see its
   definition, right after grtile_alloc_registered, for why it exists. */
void *uw_alloc_grtile(uint width, uint height);
void blit_grtile_to_framebuffer(ushort x, int y, int grtile_key, short height, short width, short src_x, short src_y, int transparent);
byte *decompress_gr_bitmap(byte *source, byte *dest, char mode);
uint merge_byte_into_word(uint word, uint new_byte, int into_high_byte);
void select_gr_bitmap_remap_table(int unused_a, uint bank, int unused_b, uint shade);
void decode_gr_rle_stream(int unused_a, int unused_b, uint offset);
int register_gr_group_entry(void *buf, unsigned size, int idx);
/* Forward declarations needed because load_gr_resource_group, load_objects_gr, load_tmflat_gr,
   load_hud_icon_gr, reload_single_grtile_entry, and decode_gr_entry_to_buffer (now in
   src/resources.c) take these LAB_ callbacks' addresses and reference these globals... */
void *gr_resource_bump_alloc_entry(unsigned int byte_count);
int register_objects_gr_entry(void *buf, unsigned size, int idx);
int register_tmflat_gr_entry(void *buf, unsigned size, int idx);
void *hud_icon_gr_bump_alloc_entry(unsigned int byte_count);
void *decode_gr_entry_bump_alloc_entry(unsigned int byte_count);
int uw_copy_gr_entry_to_dest(void *buf, uint size, int idx);
byte *uw_load_critter_page_cached(int param_1, int param_2);
char *load_string_resource(char *text);
char *load_string_resource_large(char *text);
char *decode_gr_entry_bitmap(char *entry);
bool load_pals_bank(int bank, void *dest);
bool set_palette_bank(int bank);
int load_gr_format3_extra_table();
int open_gr_resource_file(char *path, char flag);
void close_gr_resource_file();
uint read_gr_resource_record(uint index, void *buffer);
int register_grtile_entry(void *buffer, uint unused, int index);
int reregister_grtile_entry(void *buffer, uint unused, int index);
/* load_gr_resource_entries callbacks: the allocator returns a buffer for one entry, the
   post-process callback is handed (decoded buffer, byte size, entry index). */
typedef void *gr_alloc_fn(uint byte_count);
typedef int gr_entry_fn(void *buffer, uint size, int index);
uint load_gr_resource_entries(char *path, int first_entry, short count, gr_alloc_fn *allocator, gr_entry_fn *post_process);
int load_gr_resource_group(char *path);
int load_objects_gr(char *path);
int load_tmflat_gr(char *path, short texture_base, int entry_count);
int load_hud_icon_gr(char *path);
void reload_single_grtile_entry(short slot, char *path, int entry_index);
int decode_gr_entry_to_buffer(char *path, int entry_index, void *dest);
void load_door_frames();
void load_armor_variant_tables(int file_handle);
int alloc_flip_grtile_slot();
void *resolve_flip_grtile_slot(int slot);
void load_light_food_effect_tables(int file_handle);
void init_grtile_registry();
uint grtile_alloc_registered(uint width, uint height);
int invalidate_grtile_by_key(uint key);
int capture_framebuffer_rect_to_grtile(uint key, int left, int top, int right, short bottom);
int restore_captured_grtile_backdrop(uint key);
int init_string_resource_cache();
void close_strings_pak_file_thunk();
char *get_message_string(ushort message_id);
int register_interned_string(char *string, int page);
uint overwrite_interned_string(char *string, uint message_id);
void reset_string_resource_page(int page);
int open_strings_pak_file();
void close_strings_pak_file();
byte *decode_strings_pak_entry(short page, short index);
byte walk_strings_pak_huffman_tree(int file_handle, ushort node);
int read_strings_pak_bit(int file_handle);
bool read_buffer_from_file(char *path, void *buffer, int byte_count);

#endif

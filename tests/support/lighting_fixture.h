#ifndef UW_TEST_LIGHTING_FIXTURE_H
#define UW_TEST_LIGHTING_FIXTURE_H
#include "unity.h"
#include "../lighting_test_globals.h"
uw_object_hdr_t *get_equipped_item_at_slot(short slot);
void *get_scanned_object_class_effect_ptr(void);
int compute_object_weight(uw_unaligned_word_t *object);
void request_weapon_swing_graphic(char category);
void reset_player_derived_state(void);
int is_valid_equipment_slot_item(ushort id, short slot);
int resolve_object_variant_or_special_link(void *o, void *a, void *b, void *c);
void clear_object_pending_special_flag(void *o);
int apply_equipped_item_effect(byte effect, byte level, ushort *flags, int slot);
void apply_equipment_effect_penalties(uint flags);
void update_screen_flicker_effect(int active);
void force_locomotion_state_refresh(void);
void apply_movement_mode_profile(byte mode);
int find_or_assign_object_widget(void *object);
void decrement_object_count(uw_unaligned_word_t *object);
int place_object_in_backpack_slot(uw_unaligned_word_t *object, short slot);
void redraw_container_icon_slot(void);
void redraw_backpack_slot_widget(short slot);
void print_scroll_message_by_id(uint id);
void set_pending_update_flags(ushort mode);
int open_file_for_read(const char *path);
int read_file_handle(int h, void *buf, unsigned n);
int seek_file_handle(int h, int offset, int whence);
long CloseHandle(int h);
void *ce_memset(void *p, int value, unsigned n);
char *ce_strcat(char *p, char *s);
void lighting_fixture_reset(void);
void lighting_fixture_set_camera(const float m[16], const float cam_offset[3]);
void lighting_fixture_dispose(void);
ushort lighting_draw_texel(int reciprocal_w, int x, int y);
extern byte lighting_span_shade;
void lighting_draw_span(int reciprocal_w, int x, int y, int count, int clip_left, ushort *pixels);
void assert_mode(int mode, int falloff, int initial, int offset);
#endif

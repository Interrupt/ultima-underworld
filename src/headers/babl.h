#ifndef HEADERS_BABL_H
#define HEADERS_BABL_H

/* Declarations for babl.c: the conversation/dialogue scripting VM.
 * Pulls in uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern char s_FONTBIG_SYS_00085454[];
/* Globals defined in uw.c but also used by functions that now live in
   babl.c (the conversation/dialogue scripting VM) -- extern'd here so
   both translation units see the same storage. */
extern char DAT_00085240_backing[16];
#define DAT_00085240 DAT_00085240_backing[0]
extern char DAT_00085244_backing[16];
#define DAT_00085244 DAT_00085244_backing[0]
extern char DAT_00085248_backing[16];
#define DAT_00085248 DAT_00085248_backing[0]
extern undefined4 DAT_00085c54;
extern uw_mobile_object_t * DAT_00100674;
extern undefined2 DAT_0024cfac;
extern undefined1 DAT_0023c698_backing[1024];
#define DAT_0023c698 DAT_0023c698_backing[0]
extern uintptr_t DAT_00101a70;
extern undefined2 DAT_00101960; // talking-portrait mouth-frame cycle count, reset by reset_dialogue_speech_state
/* Picture-page size cache used by load_voice_sample_page and
   read_voice_sample_page_chunk (illustrated book/scroll bitmap ANIMATION
   FRAME paging, despite the "voice_sample" name -- see
   load_voice_sample_page's own comment in audio.c). DAT_000853f8 was
   mis-declared as a 1-byte `undefined` in the original decompile despite
   holding a computed size masked with & 0xffff elsewhere -- widened to
   ushort, matching its siblings, to stop the silent truncation. */
extern ushort DAT_000853fc;


/* Keep the ARM byte fields at their original offsets. Subtitle pointers
   need separate native-width slots on a 64-bit host; expanding their old
   four-byte slots would overwrite the adjacent color/count/voice fields. */
struct babl_render_state {
    char bytes[70];
    char *lines[6];
};

int babl_builtin_default_handler();
void *converse_res_bump_alloc_entry(uint byte_count);
int converse_res_slot_store_callback(void *entry, uint slot, int size);
int FUN_000362e8(ushort *op_args, intptr_t render_state);
int FUN_00036300(ushort *op_args, intptr_t render_state);
int FUN_00036308(ushort *op_args, intptr_t render_state);
int FUN_00036344(ushort *op_args, intptr_t render_state);
int FUN_00036394(ushort *op_args, intptr_t render_state);
int FUN_000363f0(ushort *op_args, intptr_t render_state);
int FUN_00036404(ushort *op_args, intptr_t render_state);
int FUN_00036418(ushort *op_args, intptr_t render_state);
int FUN_000365bc(ushort *op_args, intptr_t render_state);
int FUN_000365fc(ushort *op_args, intptr_t render_state);
int FUN_0003663c(ushort *op_args, intptr_t render_state);
int FUN_00036698(ushort *op_args, intptr_t render_state);
void babl_builtin_set_attitude(char *args);
void babl_builtin_set_race_attitude(char *args);
byte babl_builtin_x_skills(char *args);
byte babl_builtin_x_traps(char *args);
int babl_builtin_place_object(char *args);
ushort babl_builtin_take_from_npc_inv(char *args);
void babl_builtin_add_to_npc_inv(char *args);
void babl_builtin_remove_talker();
void babl_builtin_set_quest(char *args);
byte babl_builtin_get_quest(char *args);
int babl_builtin_gronk_door(char *args);
void babl_builtin_x_obj_stuff(char *args);
void babl_builtin_x_obj_pos(char *args);
void *babl_alloc(int byte_count);
void babl_free(void *block);
void *babl_resize(void *block, int new_size);
int seed_conversation_globals_for_new_game();
void load_npc_conversation_variables(void *buffer, short conversation_id);
int load_npc_conversation_record(char *npc, byte *out_buffer);
void init_conv_var_terminator_record(byte *record);
int babl_builtin_random(char *args);
bool babl_builtin_compare(char *arg_stack);
int babl_builtin_plural(char *args);
int babl_builtin_contains(char *arg_stack);
void babl_builtin_append(char *arg_stack);
void babl_builtin_copy(char *arg_stack);
int babl_builtin_find(char *args);
int babl_builtin_val(char *arg_stack);
char *babl_expand_string_refs(char *text);
int parse_babl_string_ref_expr(char **cursor);
int build_babl_symbol_table();
void babl_vm_load_script(int script_id);
int run_babl_bytecode_interpreter();
void save_npc_conversation_variables();
void babl_op_add();
void babl_op_negate();
void babl_op_mul();
void babl_op_sub();
void babl_op_div();
void babl_op_mod();
void babl_op_or();
void babl_op_and();
void babl_op_gt();
void babl_op_ge();
void babl_op_lt();
void babl_op_le();
void babl_op_eq();
void babl_op_ne();
void babl_op_call();
bool babl_op_return();
void babl_op_push_var_raw();
void babl_op_combine_index();
void babl_op_set_var();
void babl_op_call_builtin();
void babl_op_string_eq();
void babl_op_say();
void babl_op_respond();
intptr_t babl_var_word_addr(short word_index);
int babl_read_var_word(short word_index);
void babl_write_var_word(short word_index, short value);
int babl_read_frame_word(short word_offset);
void babl_register_builtin(char *name, void *handler);
void babl_set_variable(char *name, short *value_array, short count);
void babl_get_variable(char *name, short *value_array, short count);
void init_babl_variable_defaults();
void babl_builtin_setup_to_barter();
void init_barter_ui();
void end_barter_ui();
void handle_barter_player_panel_click();
int hit_test_barter_player_slot(short x, short y);
int hit_test_barter_npc_slot(short x, short y);
void handle_barter_player_slot_drop();
void handle_barter_npc_panel_click();
void handle_barter_slot_click(int is_player_side, int slot, void *counts, void *values);
int resolve_barter_slot_at_point(short x, short y, ushort *out_is_player, short *out_slot, void **out_item_ids, void **out_flags);
void redraw_barter_slot_icon(short side, short slot);
void pick_up_barter_slot_item(short slot, char *slot_array, int remove_all);
void place_item_in_barter_slot(int is_player_side, int slot, void *slot_array);
int merge_or_swap_barter_slot_item(ushort *held_object, int side, int slot, void *slot_array);
int barter_offer_is_empty(void *values, void *counts);
int babl_builtin_do_offer(char *args);
int babl_builtin_set_attitude_apply(char *npc, uint attitude);
short babl_builtin_length(char *args);
int babl_builtin_sex(char *args);
void babl_builtin_do_decline();
int babl_builtin_take_from_npc(char *args);
int babl_builtin_take_id_from_npc(char *args);
int babl_builtin_do_inv_create(char *args);
void finalize_npc_barter_items(short skip_included);
void finalize_player_barter_items();
int babl_builtin_do_demand(char *args);
void babl_builtin_do_judgement();
int sum_barter_offer_value(int is_player_side, void *item_ids, void *counts, void *values, short mode);
int compute_barter_item_value(short is_player_side, int item_id, int mode);
int randomize_value_pct(short value, short min_pct, short max_pct);
int collect_included_player_barter_items(void *out_item_ids, void *out_values);
void add_item_to_npc_inventory(ushort *object);
void give_barter_item_by_item_id(short item_id);
int remove_item_from_npc_inventory_by_id(short item_id);
int babl_builtin_set_likes_dislikes(char *args);
int check_npc_item_preference(short item_id);
void enter_conversation_mode_screen();
void exit_talk_mode();
void start_npc_conversation(int conversation_id, int npc_type);
void run_babl_menu_wait_loop();
int babl_fmenu(char *args);
void select_babl_menu_response(short response);
void babl_builtin_say(char *say_text);
void babl_builtin_respond(char *text);
void echo_selected_conversation_choice(char *text);
void babl_builtin_print(char *arg_stack);
int babl_builtin_pause(char *args);
int babl_builtin_ask();
int babl_builtin_show_inv(char *args);
int babl_builtin_find_barter(char *args);
bool babl_builtin_find_barter_total(char *args);
int babl_builtin_give_to_npc(char *args);
int babl_builtin_give_ptr_npc(char *args);
void babl_builtin_do_inv_delete(char *args);
void babl_builtin_find_inv(char *args);
int babl_builtin_identify_inv(char *args);
ushort babl_builtin_count_inv(char *args);
byte babl_builtin_check_inv_quality(char *args);
int babl_builtin_set_inv_quality(char *args);
void sync_conv_vars_from_npc(ushort *npc);
bool sync_conv_vars_to_npc(char *npc);
void bubble_sort_indices_by_key_table(intptr_t key_table, uint count, intptr_t index_buffer);
/* Native babl builtin (registered in the DAT_000bbf00 table) and conversation-text render opcode
   handler signatures; the real handlers vary in their own pointer params, so calls go through these. */
typedef int (*babl_builtin_fn)(void *args);
typedef int (*babl_render_op_fn)(void *op_args, void *render_state);
int babl_render_op_wrap_message(byte *op_args, intptr_t render_state);
int babl_render_op_show_code(ushort *op_args, intptr_t render_state);
int babl_render_op_say(intptr_t op_args, intptr_t render_state);
int babl_render_op_play_sound();
void babl_render_tick(char *render_state);
void render_babl_dialog_window(short x, short y, short width, short height, short mode);
void display_book_or_scroll_page(uint page_id);
void record_illustration_discovery_and_display(uint page_id, uint flags);
void decompress_rle_stream(byte *out_buffer, byte *input_stream);
uint pack_byte_into_word(uint word, uint byte_value, int high_half);
uint read_rle_op_code();
void rle_op_handle_short_run();
void rle_op_copy_pairs_even();
void rle_op_copy_pairs_odd();
void rle_op_fill_doubled_byte_even();
void rle_op_fill_doubled_byte_odd();
void rle_op_finalize_length();
void rle_op_mark_stream_done();
void read_object_text(ushort *object, short mode);
int debug_noop_checkpoint();
void draw_hotspot_crosshair_marker(short is_player_side, short slot);
int babl_menu(char *args); // was LAB_0002912c, a no-op stub -- see its own comment next to babl_fmenu

#endif

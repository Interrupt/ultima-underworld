#ifndef HEADERS_CHARGEN_H
#define HEADERS_CHARGEN_H

/* Declarations for chargen.c: character creation (the field-by-field state machine, its
   resource-loading setup, and the critical-section entry wrapper). Pulls in uw.h itself so this
   header is self-contained for any caller. */
#include "uw.h"

extern char s_FONT5X6P_SYS_00084e9c[];
/* Globals defined in uw.c but also used by functions that now live in saveload.c
   (open_level_archive, close_level_archive, write_archive_entry, read_archive_entry) -- extern'd
   here so both translation units see the same storage. */
/* Globals defined in uw.c but also used by functions that now live in chargen.c
   (character_generator_start, run_character_generator, character_generator_loop) -- extern'd here
   so both translation units see the same storage. */
extern char *DAT_00086df8;
/* chrbtns.gr cumulative per-entry offset table (built by chrbtns_offset_table_builder).
   DAT_000fb8c4 is an alias into it starting at element 17 -- the same relationship DAT_000fb884
   (element 1) has, matching the 0xfb8c4 vs 0xfb880 symbol addresses (0x44 = 17*4). */
extern undefined4 DAT_000fb880_backing[64];
#define DAT_000fb8c4 (((undefined1 *)DAT_000fb880_backing)[0x44])
#define DAT_000fb880 DAT_000fb880_backing[0]
#define DAT_000fb884 (((undefined1 *)DAT_000fb880_backing)[4])
#define DAT_000fb898 (((int *)DAT_000fb880_backing)[6])
/* Fourth byte of each loaded class row is its attribute bonus pool. */
extern char *DAT_001005c8;
extern char *g_chargen_textfield_buf;


/* Brings a CHRGEN.DAT buffer up to the 0x14-byte record layout the rest of
   chargen.c indexes with, converting the DOS asset set's 0x12-byte records
   in place; see the full write-up above the definition in chargen.c.
   Returns the (possibly grown) size; a buffer already in the port's layout,
   or one matching neither, is returned untouched at its original size. */
unsigned chargen_normalize_record_stride(unsigned char *buf, unsigned size, unsigned capacity);

int character_generator_start();
int run_character_generator();
int character_generator_loop(char *tree_data, char *scratch_data, char *field_records);

/* chrbtns_bump_alloc_entry/chrbtns_offset_table_builder: orphaned callbacks Ghidra never recognized
   as real functions (only reached indirectly, via addresses passed to load_gr_resource_entries) --
   their definitions stay in uw.c (see their own comment there for the full recovery story)... */
void *chrbtns_bump_alloc_entry(uint byte_count);
int chrbtns_offset_table_builder(void *unused, uint entry_size, int index);
void init_new_character_record(int mode);
int advance_skill_tree_node(byte *cursor, char *picked_skills, char *record, char *tree);
void draw_chargen_attribute_summary();
void draw_selected_skills_list();
int apply_confirmed_skill_picks(int first_index, char *picked_skills);
void reroll_attributes_for_class_race();
void draw_chargen_field_value(short *field);
int draw_chargen_field_options(short *field, byte option_a, byte option_b);
uint character_generator_touch_select(short *field, uint position);
uint wait_for_chargen_field_input(short *field);
void chargen_ui_transition_hook(int is_press);

#endif

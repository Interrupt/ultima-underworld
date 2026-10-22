#ifndef HEADERS_SCHEDULER_H
#define HEADERS_SCHEDULER_H

/* Declarations for scheduler.c: the timed-effects queue (System Shock's own term for this shared
   mechanism -- doors' open/close swing, blood splats, combat highlights, ...). Pulls in uw.h itself
   so this header is self-contained for any caller. */
#include "uw.h"

extern short DAT_0010062c;
extern undefined1 g_scheduler_count;
extern char *g_scheduler_table;
#define DAT_00250778 g_scheduler_table[0]
#define DAT_00250779 g_scheduler_table[1]
#define DAT_0025077a g_scheduler_table[2]
#define DAT_0025077b g_scheduler_table[3]
#define DAT_0025077c g_scheduler_table[4]
#define DAT_0025077d g_scheduler_table[5]


void scheduler_despawn_entry(short entry_index);
void scheduler_remove_entry(short object_link);
void scheduler_finish_entry(int entry_slot);
void scheduler_relink_entry(void *new_object, void *old_object);
uint scheduler_add_entry(uint object_link, int delay, byte animation_offset, byte tile_x, byte tile_y);
void scheduler_step_entry(int entry_slot, int elapsed);
void scheduler_tick(int elapsed);
int spawn_scheduled_effect_object(ushort *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y);
int scheduler_find_entry(const uw_object_hdr_t *object);
int scheduler_get_delay(void *object);
void scheduler_set_delay(void *object, int delay);
int scheduler_advance_effect(short entry_slot, int elapsed);
int scheduler_load(void *archive, int level_number);
int scheduler_save(void *archive, int level_number);

#endif

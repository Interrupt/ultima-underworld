#ifndef HEADERS_INVENTORY_H
#define HEADERS_INVENTORY_H

/* Declarations for inventory.c: inventory panel click handling, widget
 * hit-test/redraw, and link-chain (de)serialization. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in
   inventory.c (the inventory panel) -- extern'd here so both
   translation units see the same storage. */
extern short * DAT_00085a6c;
extern unsigned char g_inventory_hotspot_table[0x17 * 0xe + 2];

#define DAT_002028ec DAT_002028e8_backing[1]
#define DAT_00202951 g_backpack_slot_table[1]
#define g_backpack_widget_to_slot_plus1 g_backpack_widget_to_slot_backing[1]
#define g_current_container_link (*(ushort *)&g_backpack_slot_table[56])

#define _DAT_00085bf0 (*(unsigned short *)&g_inventory_hotspot_table[288])
#define DAT_00085bf2 g_inventory_hotspot_table[290]
#define DAT_00085bf3 g_inventory_hotspot_table[291]
#define DAT_00085bf4 g_inventory_hotspot_table[292]
#define DAT_00085bf5 g_inventory_hotspot_table[293]
#define g_inv_hotspot_click_x1 g_inventory_hotspot_table[0x0]
#define g_inv_hotspot_click_y1 g_inventory_hotspot_table[0x2]
#define g_inv_hotspot_click_x2 g_inventory_hotspot_table[0x4]
#define g_inv_hotspot_click_y2 g_inventory_hotspot_table[0x6]
#define g_inv_hotspot_draw_x (*(unsigned short *)&g_inventory_hotspot_table[0x8])
#define g_inv_hotspot_draw_y (*(unsigned short *)&g_inventory_hotspot_table[0xa])
#define g_inv_hotspot_dirty_w g_inventory_hotspot_table[0xc]
#define g_inv_hotspot_dirty_h g_inventory_hotspot_table[0xd]
extern unsigned char g_backpack_widget_to_slot_backing[0x17];
#define g_backpack_widget_to_slot g_backpack_widget_to_slot_backing[0]
#define DAT_00085c4c g_backpack_widget_to_slot_backing[20]
extern unsigned char g_backpack_slot_to_widget_backing[0x1c];
#define g_backpack_slot_to_widget g_backpack_slot_to_widget_backing[0]
extern undefined2 g_save_record_count_backing[8192];
#define g_save_record_count g_save_record_count_backing[0]
extern undefined4 DAT_002028e8_backing[32];
#define DAT_002028e8 DAT_002028e8_backing[0]
extern code * DAT_002020b8;
extern undefined4 DAT_00202938;
extern undefined4 DAT_0020299c;
extern undefined4 DAT_002029a0;
extern char * DAT_002046b8;
extern char * DAT_002046c4;
extern undefined4 DAT_00204844;
extern short DAT_0023bd80;
extern short DAT_0023be5c;
extern short DAT_0023be80;
extern short DAT_0023be88;
extern char * g_backpack_slot_table;
#define g_equipped_items g_backpack_slot_table[0]
/* The grid's 8 visible slots are g_equipped_items[0x14..0x1b] (0x202978..0x202986 in the original).
   The scroll code reached them by those absolute addresses, which Ghidra turned into three unrelated
   variables (never written, so the scroll arrows did nothing): first slot = scroll start, slot 0x18
   = where "scroll forward" starts, slot 0x1b = last visible. */
#define SLOT_LINK(i) (*(ushort *)(&g_equipped_items + (i) * 2))
/* Address of slot i's link word, for the chain primitives (resolve_object_link etc.). */
#define SLOT_LINK_PTR(i) ((uw_link_word_t *)(&g_equipped_items + (i) * 2))
#define GRID_FIRST_SLOT SLOT_LINK(0x14)
extern char * g_current_container_record;
extern undefined2 g_cursor_holding_state;
extern ushort * g_interact_target;
extern char *DAT_002046b8;


void perform_object_search_check();
void handle_inventory_panel_normal_click();
void inventory_panel_click_region();
void toggle_weapon_ready();
void serialize_inventory_link_chain(byte *link_chain, byte *out_link);
void *alloc_save_record_slot();
void *save_record_slot_from_index(short slot_index);
void deserialize_inventory_link_chain(byte *link_field, void *saved_link);
void handle_inventory_panel_click(short slot);
void redraw_inventory_widget(int widget_id);
void redraw_lit_light_source_widgets();
void redraw_inventory_widget_range(int first_widget, short last_widget);
int hit_test_inventory_widget(short x, short y);

#endif

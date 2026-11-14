#ifndef HEADERS_TMAP_H
#define HEADERS_TMAP_H

/* Declarations for tmap.c: the dungeon tile map (lookup, visible-tile
 * walk/collection, per-tile emission, rasterization). Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"
#include <stddef.h>

#include "geom_arena.h"

extern short g_pick_tile_off_backing[0x200];
extern undefined1 DAT_0023b676_backing[1024];

#define DAT_00086a00 (*(undefined1 *)(DAT_00086a00_region + 0x00))
#define DAT_00086a02 (*(undefined1 *)(DAT_00086a00_region + 0x02))
#define DAT_00086a20 (*(undefined1 *)(DAT_00086a00_region + 0x20))
#define DAT_00086bf0 (*(undefined1 *)DAT_00086bf0_real_table)
#define g_current_tile ((uw_tile_t *)DAT_0023b4ec)
#define DAT_00086a18 (*(undefined1 *)(DAT_00086a00_region + 0x18))
#define DAT_00086a60 (*(undefined1 *)(DAT_00086a00_region + 0x60))

#define DAT_0023b676 DAT_0023b676_backing[0]
extern ushort DAT_00189580;
extern undefined2 DAT_00202734;
extern undefined4 DAT_0023b804;
extern ushort DAT_0023b81c;
extern ushort DAT_0023b904;
extern ushort DAT_0023b91c;
extern ushort DAT_0023b920;
extern byte DAT_0023bc88;
extern byte *DAT_0023ae38;
extern byte *DAT_0023ae3c;
extern byte DAT_0023b4a0;
extern undefined2 DAT_0023b848_backing[32];
#define DAT_0023b848 DAT_0023b848_backing[0]
extern undefined1 DAT_0023b8c8_backing[32];
#define DAT_0023b8c8 DAT_0023b8c8_backing[0]
#define DAT_0023b8c9 DAT_0023b8c8_backing[1]
extern undefined2 DAT_0023b8c0;
extern char DAT_0023bb94;
extern undefined1 DAT_0023bb98_backing[256];
#define DAT_0023bb98 DAT_0023bb98_backing[0]
#define DAT_0023bb99 DAT_0023bb98_backing[1]
#define DAT_0023bb9a DAT_0023bb98_backing[2]
/* Globals defined in uw.c but also used by functions that now live in
   tmap.c (the dungeon tile map) -- extern'd here so both translation
   units see the same storage. */
#define DAT_000a85d0 g_geom_arena.vert_count
#define DAT_000a85d4 g_geom_arena.rec_count
extern const undefined1 DAT_00086a00_region[0xb0];
extern const undefined1 DAT_00086b50_region[0xa0];
#define DAT_00086b50_at(off)  (*(const undefined1 *)(DAT_00086b50_region + (off)))
#define UW_B50_LIT(addr)  ((intptr_t)(const char *)DAT_00086b50_region + ((intptr_t)(addr) - 0x86b50))
#define DAT_00086b50  DAT_00086b50_at(0x00)
#define DAT_00086b52  DAT_00086b50_at(0x02)
#define DAT_00086b84  DAT_00086b50_at(0x34)
#define DAT_00086b88  DAT_00086b50_at(0x38)
#define DAT_00086bb0  DAT_00086b50_at(0x60)
#define DAT_00086bb1  DAT_00086b50_at(0x61)
#define DAT_00086bb2  DAT_00086b50_at(0x62)
#define DAT_00086bb3  DAT_00086b50_at(0x63)
#define DAT_00086bb4  DAT_00086b50_at(0x64)
#define DAT_00086bb5  DAT_00086b50_at(0x65)
#define DAT_00086bc8  DAT_00086b50_at(0x78)
#define DAT_00086bc9  DAT_00086b50_at(0x79)
#define DAT_00086bca  DAT_00086b50_at(0x7a)
#define DAT_00086bcb  DAT_00086b50_at(0x7b)
#define DAT_00086bcc  DAT_00086b50_at(0x7c)
#define DAT_00086bcd  DAT_00086b50_at(0x7d)
extern const unsigned char DAT_00086bf0_real_table[16];
extern undefined4 DAT_00086b20;
extern short DAT_00086b24;
extern undefined2 DAT_00086b30;
extern char DAT_00087938;
extern char * DAT_0023aecc;
extern code * DAT_0023b4d4;
extern ushort DAT_0023b4d8;
extern byte DAT_0023b4e0;
extern short DAT_0023b4e4;
extern short DAT_0023b4e8;
extern byte * DAT_0023b4ec;
extern char * DAT_0023b4f0;
extern code * DAT_0023b4f4;
extern code * DAT_0023b80c;
extern short DAT_0023b810;
extern byte * DAT_0023b814;
extern undefined1 DAT_0023b818;
extern ushort DAT_0023b81c;
extern undefined1 * DAT_0023b820;
extern undefined2 DAT_0023b824;
extern ushort DAT_0023b828;
extern char DAT_0023b834;
extern undefined4 DAT_0023b838;
extern int DAT_0023b83c;
extern int g_stat_tiles_drawn;
extern int g_uw_hide_walls;
extern undefined2 DAT_0023add0_backing[64];
#define DAT_0023add0 DAT_0023add0_backing[0]
extern undefined2 DAT_0023ae40_backing[16];
#define DAT_0023ae40 DAT_0023ae40_backing[0]
extern undefined4 DAT_0023b804;
extern short DAT_0025063c;
extern short DAT_0025064c;
extern short DAT_002506dc;
extern ushort DAT_00189580;
extern undefined2 DAT_0023b8c0;
extern undefined2 DAT_0023bc8c;


void render_visible_tile_list();
void *get_texture_page(short page_index);
void walk_visible_tiles();
void process_visible_tile_cell(byte *cell);
void emit_tile_objects(uw_unaligned_word_t *tile);
void update_wall_partition_phase(char phase);
void sort_feature_pairs_by_depth(short first, int last);
void init_feature_sort_order(short count);
void resolve_billboard_corner_offset(byte *corner, void *feature);
void compute_feature_depth_key(byte *feature);
void flush_pending_tile_features();
void emit_tile_features(ushort *tile);
void *tilemap_lookup(short tile_x, short tile_y);
byte tile_is_no_magic(int tile_x, int tile_y);

#endif

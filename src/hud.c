/* The HUD: dirty-rect tracking/flush, mode icons, cursor-mode button clicks, the per-frame HUD
   draw/tick dispatch (vitals bar, dragon reaction, compass needle, panel transitions), and the
   message scroll panel (word-wrap, line-by-line scroll, draw). */
#include "headers/hud.h"
#include "headers/options.h"
#include "headers/debug.h"
#include "headers/debug_ui.h"
#include "headers/models.h"
#include "headers/movement.h"
#include "headers/tmap.h"
#include "headers/interact.h"
#include "headers/objects.h"
#include "headers/resources.h"
#include "headers/ai.h"
#include "headers/object_actions.h"
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

#define DAT_00204720 DAT_00204720_backing[0]
static int DAT_00088954;
static int DAT_0008895c;
static int DAT_00088950;
static int DAT_00088958;
short DAT_00084f10;
undefined1 g_active_hud_panel;
/* Not part of the original binary -- a port-side addition. scroll_text_entry_prompt (the generic
   scroll-area text-entry field used by save-name entry, "Move how many", "Chant the mantra", etc.)
   is opened as an overlay on top of the dungeon view without ever calling set_game_mode... */
int g_text_input_active;
undefined2 g_cursor_mode;
int DAT_00250718;
/* Ghidra rendered the embedded space as an underscore and dropped
   the leading/trailing spaces. Real bytes at 0x858dc (ARM UU.exe
   .data): " out of " (used between two numbers, e.g. "3 out of 10"). */
static char s_out_of_000858dc[] = " out of ";
static undefined2 DAT_0020209c;
static undefined2 DAT_002020b4;
static undefined2 DAT_00202090;
static undefined2 DAT_002020c8;
static undefined2 DAT_002020bc;
static char s_init_gamedisp_goes_000858e8[] = "init_gamedisp goes\n";
/* Real, compile-time-baked data recovered directly from UU.exe (same technique/precedent as
   DAT_00085668 -- see memory.md's "HOW WE GOT THE DISPATCH TABLES POPULATED"), not something a
   runtime populator ever writes. */
static const unsigned short DAT_000858a8_real[8] = {8,8,6,6,7,8,0,0};
#define DAT_000858a8 (*(undefined1 *)DAT_000858a8_real)
static const unsigned short DAT_000858b8_real[8] = {100,81,66,48,28,11,144,0};
#define DAT_000858b8 (*(undefined1 *)DAT_000858b8_real)
/* Ghidra left 0x202988 and 0x2028e0 as bare literal addresses (no symbol) -- small per-hand
   "currently drawn weapon / hand state" arrays indexed 0..5 by
   reset_equipment_and_container_state/reload_paperdoll_body_sprite (which zero them) and... */
/* Sizing-audit pass: reload_paperdoll_body_sprite's own loop is
   `iVar1<6` (indices 0-5). HARD. Down from 16. */
undefined1 DAT_00202988_backing[6];
static int DAT_002028d0;
/* Ghidra rendered the embedded space as an underscore and dropped the
   trailing newline. Real bytes at 0x85a80 (ARM UU.exe .data): "Not a spell\n". */
static char s_Not_a_spell_00085a80[] = "Not a spell\n";
static byte DAT_002028d4;
/* Original UU.exe .data at 0x87530: 53 four-byte special-action records. The first 48 match readied
   spells; byte 0 >> 3 is the action type, bytes 1-2 pack three 5-bit rune indices (24 means an
   empty slot), and byte 3 is the action parameter. These fields share one table. */
undefined DAT_00087530_backing[212] = {
  0x00, 0x78, 0x21, 0x83,
  0x10, 0x12, 0x05, 0x02,
  0x29, 0x38, 0x39, 0x01,
  0x40, 0x97, 0x21, 0x01,
  0x18, 0xf8, 0x48, 0x02,
  0x08, 0xf8, 0x51, 0x01,
  0x18, 0x58, 0x02, 0x01,
  0x08, 0x6f, 0x44, 0x02,
  0x20, 0x2c, 0x20, 0x02,
  0x58, 0x98, 0x59, 0x01,
  0x38, 0x58, 0x40, 0x01,
  0x40, 0x38, 0x21, 0x03,
  0x58, 0x6f, 0x46, 0x00,
  0x18, 0x4b, 0x06, 0x03,
  0x00, 0x78, 0x41, 0x85,
  0x29, 0xd8, 0x38, 0x02,
  0x5a, 0x38, 0x49, 0x02,
  0x10, 0x58, 0x22, 0x43,
  0x08, 0xf8, 0x5d, 0x44,
  0x20, 0x98, 0x21, 0x04,
  0x08, 0xf8, 0x1d, 0x03,
  0x38, 0x98, 0x35, 0x04,
  0x18, 0xb8, 0x48, 0x46,
  0x5a, 0x38, 0x01, 0x03,
  0x29, 0xb8, 0x3c, 0x03,
  0x38, 0x4c, 0x00, 0x02,
  0x5a, 0xd7, 0x3a, 0x04,
  0x18, 0x4f, 0x1a, 0x05,
  0x5a, 0xf8, 0x12, 0x05,
  0x58, 0xb8, 0x01, 0x06,
  0x20, 0x0c, 0x55, 0x0f,
  0x30, 0xc6, 0x55, 0x42,
  0x58, 0x2f, 0x56, 0x0a,
  0x38, 0x8f, 0x00, 0x05,
  0x00, 0x0b, 0x55, 0x86,
  0x5a, 0xf7, 0x39, 0x08,
  0x08, 0xef, 0x54, 0x05,
  0x38, 0x91, 0x21, 0x03,
  0x40, 0x98, 0x29, 0x04,
  0x18, 0x4b, 0x56, 0x44,
  0x30, 0x16, 0x54, 0x03,
  0x30, 0x10, 0x38, 0x81,
  0x10, 0xb2, 0x22, 0x45,
  0x58, 0xf7, 0x55, 0x09,
  0x58, 0xf6, 0x39, 0x07,
  0x30, 0xf8, 0x14, 0x44,
  0x58, 0x78, 0x02, 0x0b,
  0x58, 0x42, 0x55, 0x0c,
  0x30, 0x18, 0x63, 0x05,
  0x28, 0x18, 0x63, 0x04,
  0x58, 0x18, 0x63, 0x0d,
  0x50, 0x18, 0x63, 0x03,
  0x50, 0x18, 0x63, 0x09,
};
#define DAT_00087531 DAT_00087530_backing[1]
char DAT_0023c3e0;
char s_bodies_00085c58[] = "bodies";
static int DAT_002029a4;
static undefined2 DAT_00202998;
undefined2 DAT_00085c50;
static int DAT_002046f8;
static char s_optbtns_00086954[] = "optbtns";
static short DAT_002046f4;
/* Real .data value confirmed via a Ghidra memory dump of the original binary at 0x87990:
   0x00000001, not the C zero-default this plain declaration gave it. */
// was DAT_00087990
undefined4 g_scroll_control_codes_enabled = 1;
static short DAT_0020471c;
static short DAT_00204838;
static short DAT_0020483c;
static short DAT_002047dc;
static short DAT_002047d8;
static int DAT_000889b8;
static int DAT_000889bc;
/* DAT_002047b0: declared as a scalar but indexed as (&DAT_002047b0)[i] throughout
   (register_click_region-style helpers, up to 20 slots per the `iVar2 < 0x14` loop bound) -- same
   "scalar declared but accessed as array" bug class fixed several times this session. */
static undefined2 DAT_002047b0_backing[20];
#define DAT_002047b0 DAT_002047b0_backing[0]
static short DAT_002047a4;
static short DAT_00204748;
static short DAT_00204784;
static undefined2 DAT_0020479c;
static undefined2 DAT_002047a0;
static undefined2 DAT_00204798;
static undefined2 DAT_00204790;
static undefined2 DAT_00204794;
static short DAT_00204854;
/* Sizing pass: register_cursor_hotspot's own loop bound is a fixed
   20-slot table (`while(iVar2<0x14)`), 2-byte stride -- real max
   19*2+2=40 bytes. */
static undefined1 DAT_00204720_backing[64];
/* Sizing-audit pass: siblings of DAT_00204720 right above, same register_cursor_hotspot 20-slot
   table, but indexed directly by element (not a byte offset) -- real max index 19, 20 elements * 2
   bytes = 40 bytes real need. */
static undefined2 DAT_00204750_backing[32];
#define DAT_00204750 DAT_00204750_backing[0]
static undefined2 DAT_002047e0_backing[32];
#define DAT_002047e0 DAT_002047e0_backing[0]
static undefined2 DAT_00204808_backing[32];
#define DAT_00204808 DAT_00204808_backing[0]
static short DAT_00086970;
static char DAT_00204858;
static undefined2 DAT_00204704;
/* Sizing-audit pass: push_cursor_icon/pop_cursor_icon's own cursor- icon stack, guarded by `if
   (DAT_00204858 != '\x03')` -- max depth 3, real need 3 elements (6 bytes). Sized to 8 for
   headroom; down from 256. */
static undefined2 DAT_00204714_backing[8];
#define DAT_00204714 DAT_00204714_backing[0]
static short DAT_002047a8;
static short DAT_0020478c;
static short DAT_002047ac;
/* Recovered from UU.exe .data at 0x86b38: three pairs of function pointers, selected by an index (0
   or 1, from DAT_00086b2c) in walk_visible_tiles, loaded into DAT_0023b4f4 / DAT_0023b80c /
   DAT_0023b4d4... */
code *DAT_00086b38_fnptrs[6] = {
  (code *)emit_flat_wall_texture_select, (code *)emit_floor_texture_select,
  (code *)emit_flat_floor_texture_select, (code *)emit_flat_wall_texture_select,
  (code *)emit_flat_diagonal_texture_select, (code *)emit_diagonal_wall_texture_select,
};
/* Was `static undefined1 DAT_000870ec_backing[65536]` (an oversized, never-populated byte buffer)
   -- real per-flask X position for `hud_vitals_bar_tick` (the health/mana FLASK bar update
   function), [0]=health [1]=mana. */
static undefined1 DAT_000870ec_backing[4] = { 248,0, 28,1 };  /* 248, 284 */
#define DAT_000870ec DAT_000870ec_backing[0]
#define DAT_000870f2 (*(short *)(DAT_000870f0_backing + 2))
/* Was 2 lone `undefined1` scalars -- same "split symbol" bug as DAT_0023c224/DAT_0023c230 etc. (see
   DAT_0023c224's comment for the full writeup). */
 undefined1 DAT_0023c118_arr[9];
static undefined1 DAT_0023c128_arr[9];
#define DAT_0023c128 DAT_0023c128_arr[0]
#define g_committed_hud_panel DAT_0023c128_arr[6]
#define DAT_0023c12f DAT_0023c128_arr[7]
/* Was a lone `undefined2 DAT_0023c224;` -- but used as a real 2-element array throughout
   (`(&DAT_0023c224)[iVar1]`/`[uVar2]` for index 0 AND 1, including the creation loop in
   redraw_hud_panels that assigns BOTH elements). */
static short DAT_0023c224_arr[2];
#define DAT_0023c224 DAT_0023c224_arr[0]
static byte DAT_0023c11a;
static short DAT_0023c228;
static short DAT_0023c22c;
/* Was `FIXME[hud-compass-layout]: .data 0x87130 -- ... Ghidra never recovered the .data contents so
   every entry reads 0 and the needle is stuck at x=0 (part of the black block in the HUD
   top-left)`. */
static short DAT_00087130_arr[16] = {
  136, 128, 120, 116, 112, 112, 116, 124, 136, 144, 156, 160, 160, 156, 152, 144,
};
#define DAT_00087130 DAT_00087130_arr[0]
/* Was `FIXME[hud-compass-layout]: .data 0x87150 -- ...`. See
   DAT_00087130's comment -- real Y data recovered the same way,
   16 values tracing the same ellipse (132-153). */
static short DAT_00087150_arr[16] = {
  132, 134, 135, 138, 142, 146, 148, 151, 153, 151, 148, 146, 142, 138, 135, 134,
};
#define DAT_00087150 DAT_00087150_arr[0]
/* Was two lone `short` scalars -- same split-symbol bug as DAT_0023c11c/DAT_0023c230 etc. elsewhere
   in this file. `hud_dragon_reaction_tick` indexes `&DAT_0023c1e8 + iVar6`... */
static short DAT_0023c1e8_arr[2];
#define DAT_0023c1e8 DAT_0023c1e8_arr[0]
#define DAT_0023c1ea DAT_0023c1e8_arr[1]
/* Same split-symbol bug, same fix: `hud_dragon_reaction_tick` indexes `&DAT_0023c1e4 + iVar6` (the
   animation-phase state byte per dragon side) and `reset_hud_panel_animation_state` resets both
   elements individually (`DAT_0023c1e6 = 0; ... */
static undefined2 DAT_0023c1e4_arr[2];
#define DAT_0023c1e4 DAT_0023c1e4_arr[0]
#define DAT_0023c1e6 DAT_0023c1e4_arr[1]
static undefined2 DAT_0023c220;
static ushort DAT_0023c1d8;
undefined1 DAT_0023c130;
static int DAT_0023c23c;
static short DAT_0023c21c;
/* The three tables below all position the two dragons.gr decorations that frame the compass --
   index 0 = left dragon, index 1 = right dragon -- built once in redraw_hud_panels (54155-54198). */

/* .data 0x87170 -- X of the dragon HEAD sub-sprite, [0]=left [1]=right. Sprite made by
   sprite_list_alloc_raw_entry(2,0xd,10) into DAT_0023c230[side], placed at ((&DAT_00087170)[side],
   0x87), size 0xd x 10 (redraw_hud_panels:54161); animation frame set from DAT_000871d4 (54190). */
static short DAT_00087170_arr[2] = { 36, 228};
#define DAT_00087170 DAT_00087170_arr[0]
/* .data 0x87174 -- X of the dragon BODY sub-sprite, [0]=left [1]=right. */
static short DAT_00087174_arr[2] = { 36, 204};
#define DAT_00087174 DAT_00087174_arr[0]
/* .data 0x871b4 -- X of the dragon WING/TAIL sub-sprite, [0]=left [1]=right. */
/* Sizing-audit pass: same `iVar3<2` loop as its 2-element siblings
   DAT_00087170/DAT_00087174 right above. HARD. Down from 4. */
static short DAT_000871b4_arr[2] = { 40, 224};
#define DAT_000871b4 DAT_000871b4_arr[0]
/* Was `FIXME[hud-dragon-frames]: .data 0x871d4 -- ... reads 0 now`. Same class of gap as the
   position tables above -- recovered via direct memory dump. */
static unsigned short DAT_000871d4_arr[2] = { 0x206d, 0x207f };
#define DAT_000871d4 DAT_000871d4_arr[0]
/* Was `FIXME[hud-dragon-frames]: .data 0x871d8 -- ... reads 0 now`. Real values 0x206e (left) /
   0x2080 (right), same +0x12 delta. Frame arg to sprite_list_set_frame_id for DAT_0023c234[side]
   (redraw_hud_panels :54191, also FUN_0006dbe4:54753). */
static unsigned short DAT_000871d8_arr[2] = { 0x206e, 0x2080 };
#define DAT_000871d8 DAT_000871d8_arr[0]
/* HUD-panel/tab dispatch table (13 entries), read as `(&g_hud_panel_handlers)[index]` at 4 call
   sites (g_active_hud_panel/DAT_0023c134 select the index -- which panel/tab is active). */
void (*const g_hud_panel_handlers_table[13])(void) = {
  (void(*)(void))refresh_equipment_display_if_visible, (void(*)(void))redraw_rune_bag_display, (void(*)(void))draw_stats_panel_content, 0,
  (void(*)(void))hud_vitals_bar_tick, (void(*)(void))hud_vitals_bar_tick, (void(*)(void))hud_compass_needle_tick, (void(*)(void))update_hud_status_icon_frame,
  (void(*)(void))hud_dragon_reaction_tick, (void(*)(void))hud_dragon_reaction_tick, (void(*)(void))tick_hud_panel_transition, (void(*)(void))hud_panel_wipe_transition_tick,
  (void(*)(void))advance_action_animation_frame,
};
static char s_panels_00087260[] = "panels";
/* Was 2 lone `undefined1` scalars -- same "split symbol" bug as DAT_0023c224/DAT_0023c230 etc.
   above: both are used throughout as real 2-element byte arrays (`(&DAT_0023c11c)[iVar6]`/
   `(&DAT_0023c12c)[iVar6]` for index 0 AND 1, including redraw_hud_ panels's own creation loop). */
static undefined1 DAT_0023c11c_arr[2];
#define DAT_0023c11c DAT_0023c11c_arr[0]
static undefined1 DAT_0023c12c_arr[2];
#define DAT_0023c12c DAT_0023c12c_arr[0]
/* Was 3 lone `undefined2` scalars (DAT_0023c230/234/238) -- same "split symbol" bug as DAT_0023c224
   (see its own comment for the full writeup): each is used throughout as a real 2-element array... */
static short DAT_0023c230_arr[2];
#define DAT_0023c230 DAT_0023c230_arr[0]
static short DAT_0023c234_arr[2];
#define DAT_0023c234 DAT_0023c234_arr[0]
static short DAT_0023c238_arr[2];
#define DAT_0023c238 DAT_0023c238_arr[0]
/* Was 3 separate `undefined2` scalars (DAT_0023c200/202/204) -- same split-symbol bug as
   DAT_0023c118/DAT_0023c128 just above (see that comment's full writeup, found chasing the same
   chain-hotspot/ stats-panel revival)... */
static undefined4 DAT_0023c200_arr[3];
#define DAT_0023c200 DAT_0023c200_arr[0]
#define DAT_0023c202 DAT_0023c200_arr[1]
#define DAT_0023c204 DAT_0023c200_arr[2]
// ARM .data starts both weapon sprite categories at -1 (not loaded).
char DAT_000870dc = -1;
char DAT_000870d8 = -1;
ushort DAT_0023c1dc;
#define DAT_0023c11d DAT_0023c11c_arr[1]
#define DAT_0023c12d DAT_0023c12c_arr[1]
static ushort DAT_0023c1e0;
static undefined1 DAT_0023c11b;
static byte DAT_0023c12a;
static byte DAT_0023c150;
/* Sizing pass: both indexed only by `sVar3 & 1` (0 or 1), a 4-byte
   stride -- real max 1*4+4=8 bytes each. */
static undefined1 DAT_0023c1f0_backing[64];
#define DAT_0023c1f0 DAT_0023c1f0_backing[0]
static undefined1 DAT_0023c1f8_backing[64];
#define DAT_0023c1f8 DAT_0023c1f8_backing[0]
/* Was `undefined2 DAT_00087254;` -- split-symbol bug: real ARM code (confirmed via disassembly of
   FUN_0006d4a4/hud_vitals_bar_tick) computes `&DAT_00087254 + uVar2*2` for the mana slot, so this
   is a genuine 2-element short array (0=health, 1=mana shimmer/wraparound state)... */
static short DAT_00087254_arr[2] = { 0x2019, 0x2032 };
#define DAT_00087254 DAT_00087254_arr[0]
/* Was `static undefined1 DAT_000870f0_backing[65536]` (oversized, never populated) -- real per-step
   Y offset for the FLASK fill-level animation sprite in
   `hud_vitals_bar_tick`/`hud_vitals_threshold_shake` (the health/mana flask bar update)... */
static undefined1 DAT_000870f0_backing[32] = {
  156,0, 152,0, 150,0, 148,0, 146,0, 144,0, 142,0, 141,0,
  140,0, 139,0, 137,0, 135,0, 133,0, 131,0, 0,0, 0,0,
};
#define DAT_000870f0 DAT_000870f0_backing[0]
/* Was `static undefined1 DAT_00087112_backing[65536]` (oversized, never populated) -- real per-step
   HEIGHT for the same flask fill-level animation sprite (paired with DAT_000870f0's Y), read the
   same byte-scaled way (`&DAT_00087112 + N*2`). */
static undefined1 DAT_00087112_backing[32] = {
  4,0, 5,0, 6,0, 7,0, 7,0, 7,0, 7,0, 6,0,
  5,0, 4,0, 4,0, 4,0, 4,0, 0,0, 0,0, 0,0,
};
#define DAT_00087112 DAT_00087112_backing[0]
#define DAT_00087114 (*(short *)(DAT_00087112_backing + 2))
/* .bss 0x23c240..0x23c24f: four short[2] rows of sprite handles for the HUD flask/vitals animation
   (hud_vitals_bar_tick / hud_dragon_reaction_tick), indexed `&row + param*2` with param in {0,1}. */
static char DAT_0023c240_vitals[16];
#define DAT_0023c240 DAT_0023c240_vitals[0]
#define DAT_0023c244 DAT_0023c240_vitals[4]
#define DAT_0023c248 DAT_0023c240_vitals[8]
#define DAT_0023c24c DAT_0023c240_vitals[12]
static short DAT_0023c250;
/* .data 0x87178..0x871b7: four rows (x / y / w / h) of the dragon HEAD-animation overlay sprite's
   placement table (a separate, dynamically-allocated sprite driving the head's reaction animation
   -- see DAT_0023c1e8's own comment)... */
static char DAT_00087178_arr[16] = {40,0, 48,0, 36,0, 204,0, 204,0, 200,0, 0,0, 0,0};  /* X: L 40/48/36, R 204/204/200 */
static char DAT_00087188_arr[16] = {156,0, 146,0, 146,0, 156,0, 146,0, 146,0, 0,0, 0,0};  /* Y: L 156/146/146, R 156/146/146 */
static char PTR_DAT_00087198_arr[16] = {33,0, 24,0, 37,0, 34,0, 24,0, 38,0, 0,0, 0,0};  /* W: L 33/24/37, R 34/24/38 */
static char PTR_DAT_000871a8_arr[16] = {14,0, 16,0, 23,0, 14,0, 16,0, 23,0, 0,0, 0,0};  /* H: L 14/16/23, R 14/16/23 */
#define DAT_00087178 DAT_00087178_arr[0]
#define DAT_00087188 DAT_00087188_arr[0]
#define PTR_DAT_00087198 PTR_DAT_00087198_arr[0]
#define PTR_DAT_000871a8 PTR_DAT_000871a8_arr[0]
/* Was a 64KB never-populated scratch buffer -- same "oversized placeholder" pattern as most of this
   file's other unrecovered .data gaps, just missed in the earlier pass that fixed the sibling
   DAT_00087178/DAT_00087188/PTR_DAT_00087198/PTR_DAT_000871a8 rect table right above... */
static const unsigned short DAT_000871b8_arr[14] = {
  0x207b, 0x207c, 0x207d, 0x207e, 0x207d, 0x207c, 0x207b,
  0x208d, 0x208e, 0x208f, 0x2090, 0x208f, 0x208e, 0x208d,
};
#define DAT_000871b8 (*(undefined1 *)DAT_000871b8_arr)
/* Sizing-audit pass: index is `iVar6*2` where iVar6 = param_1-4,
   param_1 guarded to {4,5} -- max byte 2+1=3. Sized to 4; down from
   256. */
static undefined DAT_0023c124_backing[4];
#define DAT_0023c124 DAT_0023c124_backing[0]
static short DAT_0023c254;
/* Next frame (above 0x2098) of the full-charge gem pulse (9..13). Initial value 9 is from the original .data. */
static short DAT_00087258 = 9;
static short DAT_0023c258;
static int DAT_0023c20c;
static byte DAT_0023c25c;
/* Was 2 lone `undefined2` scalars (DAT_0023c268/DAT_0023c270) -- same split-symbol bug as
   DAT_0023c118/DAT_0023c200 elsewhere in this file (see DAT_0023c118's own comment for the full
   writeup)... */
static short DAT_0023c268_arr[3];
#define DAT_0023c268 DAT_0023c268_arr[0]
static short DAT_0023c270_arr[3];
#define DAT_0023c270 DAT_0023c270_arr[0]
/* DAT_00087210/DAT_00087218: real per-index position lookup tables -- recovered directly from the
   real ARM binary's .data (raw uint16 reads at 0x87210/0x87218, not a function to decompile). */
static const undefined2 DAT_00087210_arr[3] = {176, 191, 206};
#define DAT_00087210 DAT_00087210_arr[0]
static const undefined2 DAT_00087218_arr[3] = {86, 69, 52};
#define DAT_00087218 DAT_00087218_arr[0]
static undefined2 DAT_0023c140;
static int DAT_0023c278;
static undefined2 DAT_0023c148;
static undefined2 DAT_0023c14c;
static undefined2 DAT_0023c144;
byte g_flip_grtile_cache_ready;
static short DAT_0023c134;
/* Sizing-audit pass: single use, `debug_print(&DAT_00087298)`, 0 writers. Real content confirmed
   via direct Ghidra memory export of UU.exe (tests/fixtures/static_strings.json): "ick\n" -- an odd
   short fragment, but that's genuinely what's at this address in the real binary's .data section. */
static undefined DAT_00087298_backing[16] = "ick\n";
#define DAT_00087298 DAT_00087298_backing[0]
static byte DAT_0023c208;
static short DAT_0023c138;
static short DAT_0023c13c;
static short DAT_0023c110;
/* Was `u"dgijjjigd\\G&"` -- Ghidra misidentified this as a UTF-16 string because its low bytes
   happen to be printable ASCII. */
static unsigned short u_dgijjjigd_G__000871e0[16] = {
  100,103,105,106,106,106,105,103,100,92,71,38,0,38,71,92
};
/* Same "was `int`, truncating a real pointer" bug as DAT_0023c3ec right above -- assigned
   `DAT_0023c40c + 0x100` (a real 64-bit pointer) and then compared against/derived into real
   `ushort *` locals throughout flush_sprite_list_compositor and friends. */
static ushort *DAT_0023c414;
/* Same truncation bug as DAT_0023c414/DAT_0023c3ec above, though this one is never read back
   anywhere in this decompile -- fixed for consistency regardless. */
static char *DAT_0023c410;
/* Sizing pass: this is the real Microsoft GXDisplayProperties struct (see gx_stub.c's own "6 x
   4-byte fields = 0x18" comment) -- confirmed by game.c's GXGetDisplayProperties population site,
   which copies exactly 0x18 (24) bytes into &DAT_0023cdb0 in a fixed-count loop. */
undefined1 DAT_0023cdb0_backing[32];
undefined *DAT_00250704;
static undefined2 DAT_00250714;
// was DAT_00087960
static undefined1 g_msg_scroll_panel_state_backing[65536];
#define g_msg_scroll_panel_state g_msg_scroll_panel_state_backing[0]
static undefined4 DAT_00250708;
static undefined4 DAT_0025071c;
/* Was a lone `undefined` (1-byte) scalar, but used throughout this file as the BASE POINTER of a
   whole message-scroll-panel-state struct... */
// was DAT_00087978
static undefined1 g_msg_scroll_panel_state_conv_backing[65536] = {
  0x34,0x00,0x84,0x00,0x38,0x00,0xdb,0x00,0x3b,0x00,0x36,0x00,0x3b,0x00,0x36,0x00,
  0x00,0x00,0x00,0x00,0x00,0x00,0x2e,0x00,0x01,0x00,0x00,0x00,
};
#define g_msg_scroll_panel_state_conv g_msg_scroll_panel_state_conv_backing[0]
static short DAT_00250724;
static short DAT_00250728;
static short DAT_00250710;
static char s__MORE__00087994[] = "[MORE]";
static undefined4 DAT_00250720;
static short DAT_0025070c;
/* Was a bare 1-byte `undefined` scalar -- FUN_0008090c's yes/no dialog takes its address and passes
   it to message_scroll_print_wrapped, so it needs to be a real string. Real bytes confirmed via a
   Ghidra memory dump of the original binary at 0x8799c: "No". */
// was DAT_0008799c
static char s_No_0008799c[] = "No";
/* Same fix as s_No_0008799c above: real bytes at 0x879a0 are "Yes". */
// was DAT_000879a0
static char s_Yes_000879a0[] = "Yes";
/* Reused-global-holding-a-real-string pattern (see the s_scroll_newline_0008522c
   comment far above): scroll_text_entry_prompt's ESC-cancel path prints
   `&s_dash_000879a4` with no write beforehand. Real bytes at 0x879a4: "-". */
// was DAT_000879a4
static undefined s_dash_000879a4_backing[8192] = "-";
#define s_dash_000879a4 s_dash_000879a4_backing[0]
/* Same pattern: scroll_text_entry_prompt defaults its prompt-before-the-input-field text to
   `&s_scroll_prompt_arrow_000879a8` whenever the caller passes a NULL label (the save-name-entry
   call site does exactly this) -- real bytes at 0x879a8 are ">"... */
// was DAT_000879a8
static undefined s_scroll_prompt_arrow_000879a8_backing[8192] = ">";
#define s_scroll_prompt_arrow_000879a8 s_scroll_prompt_arrow_000879a8_backing[0]




// was FUN_00011000 -- expand the damaged-region bounds (DAT_00088950..5c) to include the given rect; sibling of dirty_rect_set
void dirty_rect_union(int left, int bottom, int right, int top)
{
  if (left < DAT_00088954) {
    DAT_00088954 = left;
  }
  if (DAT_0008895c < bottom) {
    DAT_0008895c = bottom;
  }
  if (right < DAT_00088950) {
    DAT_00088950 = right;
  }
  if (DAT_00088958 < top) {
    DAT_00088958 = top;
  }
}



// was FUN_00011040 -- dirty-rect SET (overwrite the damaged-region
// bounds to exact values; sibling of dirty_rect union dirty_rect_union)
void dirty_rect_set(int left, int bottom, int right, int top)
{
  DAT_00088954 = left;
  DAT_0008895c = bottom;
  DAT_00088950 = right;
  DAT_00088958 = top;
}




// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* This is the game's dirty-rect blit: DAT_00088954/5c/50/58 (top/ bottom/left/right) accumulate via
   dirty_rect_union, called from every draw (rect fill, text draw, sprite blit, ...) to grow the
   damaged region -- clamped here... */
// was FUN_00022f0c
void flush_dirty_rect_to_display(int unused_flag)
{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  int iVar10;
  int iVar11;

  if (DAT_00088954 < 0) {
    DAT_00088954 = 0;
  }
  else if (200 < DAT_00088954) {
    DAT_00088954 = 200;
  }
  iVar2 = DAT_00088954;
  if (DAT_0008895c < 0) {
    DAT_0008895c = 0;
  }
  else if (200 < DAT_0008895c) {
    DAT_0008895c = 200;
  }
  iVar3 = DAT_0008895c;
  if (DAT_00088950 < 0) {
    DAT_00088950 = 0;
  }
  else if (0x140 < DAT_00088950) {
    DAT_00088950 = 0x140;
  }
  if (DAT_00088958 < 0) {
    DAT_00088958 = 0;
  }
  else if (0x140 < DAT_00088958) {
    DAT_00088958 = 0x140;
  }
  iVar10 = 0x140 - DAT_00088958;
  iVar11 = 0x140 - DAT_00088950;
  /* Desktop overlay never needs the stylus gate protecting saved pixels.
     GX still batches and throttles these flushes to the display cadence. */
  if (((uw_always_show_cursor() || 0 < DAT_00084f10) ||
      (((g_selected_object == 0 || (g_force_flush != 0)) && ((DAT_0023c63c == 0 || (g_force_flush != 0)))))
      ) && ((DAT_0023cdc0 == 0x10 && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0))))
  {
    iVar6 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar6 = DAT_0023cdb8 + 1;
    }
    iVar7 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar7 = DAT_0023cdbc + 1;
    }
    puVar5 = (undefined2 *)((char *)DAT_0023c430 + ((iVar7 >> 1) * iVar10 + (iVar6 >> 1) * iVar2) * 2);
    /* DAT_00088958 ("right") is a right-*exclusive* dirty-rect bound everywhere else in this
       function (e.g. `iVar10 = 0x140 - DAT_00088958` correctly treats it as a remaining-width
       count), but here it's used directly as a starting column INDEX... */
    puVar4 = (undefined2 *)
             ((g_uw_framebuffer) +
             (DAT_00088954 * 0x140 + (DAT_00088958 - 1)) * 2);
    if (iVar10 < iVar11) {
      iVar11 = iVar11 - iVar10;
      do {
        if (iVar2 < iVar3) {
          iVar10 = iVar3 - iVar2;
          puVar8 = puVar5;
          puVar9 = puVar4;
          do {
            uVar1 = *puVar9;
            iVar10 = iVar10 + -1;
            puVar9 = puVar9 + 0x140;
            *puVar8 = uVar1;
            puVar8 = puVar8 + (iVar6 >> 1);
          } while (iVar10 != 0);
        }
        iVar11 = iVar11 + -1;
        puVar5 = puVar5 + (iVar7 >> 1);
        puVar4 = puVar4 + -1;
      } while (iVar11 != 0);
    }
    GXEndDraw();
  }
  return;
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0002310c -- near-identical twin of flush_dirty_rect_to_display
// above, clamped to a 240px-tall dirty rect instead of 200px; likely a
// different screen-height device variant of the same GX-hardware flush.
void flush_dirty_rect_to_display_240()

{
  undefined2 uVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  int iVar6;
  int iVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  int iVar10;
  int iVar11;
  
  if (DAT_00088954 < 0) {
    DAT_00088954 = 0;
  }
  else if (0xf0 < DAT_00088954) {
    DAT_00088954 = 0xf0;
  }
  iVar2 = DAT_00088954;
  if (DAT_0008895c < 0) {
    DAT_0008895c = 0;
  }
  else if (0xf0 < DAT_0008895c) {
    DAT_0008895c = 0xf0;
  }
  iVar3 = DAT_0008895c;
  if (DAT_00088950 < 0) {
    DAT_00088950 = 0;
  }
  else if (0x140 < DAT_00088950) {
    DAT_00088950 = 0x140;
  }
  if (DAT_00088958 < 0) {
    DAT_00088958 = 0;
  }
  else if (0x140 < DAT_00088958) {
    DAT_00088958 = 0x140;
  }
  iVar10 = 0x140 - DAT_00088958;
  iVar11 = 0x140 - DAT_00088950;
  if ((DAT_0023cdc0 == 0x10) && (DAT_0023c430 = GXBeginDraw(), DAT_0023c430 != (void *)0x0)) {
    iVar6 = DAT_0023cdb8;
    if (DAT_0023cdb8 < 0) {
      iVar6 = DAT_0023cdb8 + 1;
    }
    iVar7 = DAT_0023cdbc;
    if (DAT_0023cdbc < 0) {
      iVar7 = DAT_0023cdbc + 1;
    }
    puVar5 = (undefined2 *)((char *)DAT_0023c430 + ((iVar7 >> 1) * iVar10 + (iVar6 >> 1) * iVar2) * 2);
    /* DAT_00088958 ("right") is a right-*exclusive* dirty-rect bound everywhere else in this
       function (e.g. `iVar10 = 0x140 - DAT_00088958` correctly treats it as a remaining-width
       count), but here it's used directly as a starting column INDEX... */
    puVar4 = (undefined2 *)
             ((g_uw_framebuffer) +
             (DAT_00088954 * 0x140 + (DAT_00088958 - 1)) * 2);
    if (iVar10 < iVar11) {
      iVar11 = iVar11 - iVar10;
      do {
        if (iVar2 < iVar3) {
          iVar10 = iVar3 - iVar2;
          puVar8 = puVar5;
          puVar9 = puVar4;
          do {
            uVar1 = *puVar9;
            iVar10 = iVar10 + -1;
            puVar9 = puVar9 + 0x140;
            *puVar8 = uVar1;
            puVar8 = puVar8 + (iVar6 >> 1);
          } while (iVar10 != 0);
        }
        iVar11 = iVar11 + -1;
        puVar5 = puVar5 + (iVar7 >> 1);
        puVar4 = puVar4 + -1;
      } while (iVar11 != 0);
    }
    GXEndDraw();
  }
  return;
}




// was FUN_0003e44c -- per-frame(ish) HUD/gameplay-mode refresh, called from enter_dungeon_view
// (chargen completion, returning from a menu, etc.); re-establishes the mode-icon highlight if a
// mode is already selected, then calls sync_player_stats_to_hud.
void enter_dungeon_view_hud_init()

{
  debug_print(s_init_gamedisp_goes_000858e8);
  init_inventory_panel_hotspots();
  init_msg_scroll_panel();
  resume_music_playback();
  register_stats_panel_click_regions();
  if (DAT_000868d8 == 0) {
    if (g_cursor_mode != 0) {
      /* Dropped argument (confirmed via disassembly of 0x3e44c: r0 holds g_cursor_mode, untouched
         since the guard's own load, right up to `bl 0x3f99c`) -- the real ARM code passes
         g_cursor_mode through via register reuse. */
      mode_icon_highlight_on((int)g_cursor_mode);
    }
  }
  else {
    run_pause_menu_modal_loop(1);
  }
  sync_player_stats_to_hud();
  redraw_hud_panels();
  return;
}




// was FUN_0003f99c -- draws the "selected" state for mode icon param_1 (1-based) by blitting
// LFTI.GR's per-icon highlight frame (id (param_1-1)*-2+0x200b) at that icon's registered position
// (DAT_000858a8/DAT_000858b8).
void mode_icon_highlight_on(int icon_index)
{
  int iVar1;
  short sVar2;
  short sVar3;
  
  iVar1 = (icon_index + -1) * 0x10000 >> 0x10;
  sVar2 = *(short *)(&DAT_000858a8 + iVar1 * 2);
  sVar3 = *(short *)(&DAT_000858b8 + iVar1 * 2);
  decrement_cursor_hide_depth();
  g_blit_transparent_mode = 1;
  /* Confirmed via real ARM disassembly (0x3f99c: `mov r0,#0x2000; orr r0,r0,#0xb; sub r0,r0,r4,lsl
     #0x1`) that `(icon_index-1)*-2 + 0x200b` is exactly what the original compiled code computes --
     NOT a decompile artifact. */
  draw_sprite_by_id((icon_index + -1) * -2 + 0x200b,(int)sVar2,(int)sVar3,1,1);
  g_blit_transparent_mode = 0;
  cursor_show_idle_tick();
}



// was FUN_0003fa1c -- un-highlights mode icon param_1 (1-based),
// mode_icon_highlight_on's counterpart: draws LFTI.GR's adjacent
// "unselected" frame (id (0x1005-(param_1-1))*2) at the same position.
void mode_icon_highlight_off(int icon_index)
{
  int iVar1;
  short sVar2;
  short sVar3;
  
  iVar1 = (icon_index + -1) * 0x10000 >> 0x10;
  sVar2 = *(short *)(&DAT_000858a8 + iVar1 * 2);
  sVar3 = *(short *)(&DAT_000858b8 + iVar1 * 2);
  decrement_cursor_hide_depth();
  g_blit_transparent_mode = 1;
  /* Confirmed via real ARM disassembly (0x3fa1c: `mov r0,#0x1000; orr r0,r0,#0x5; sub r0,r0,r4; mov
     r0,r0,lsl #0x1`) that `(0x1005-(icon_index-1))*2` is exactly what the original compiled code
     computes -- NOT a decompile artifact. */
  draw_sprite_by_id((0x1005 - (icon_index + -1)) * 2,(int)sVar2,(int)sVar3,1,1);
  g_blit_transparent_mode = 0;
  cursor_show_idle_tick();
}



// was FUN_0003faa0
void cursor_mode_button_click(short button_y)
{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  char cVar4;
  short sVar5;
  uint uVar6;
  int iVar7;
  
  if ((g_cursor_holding_state == 0) && ((short)DAT_00201b60 == 1)) {
    iVar7 = (int)button_y;
    if (iVar7 == -1) {
      if (DAT_000868d8 == 0) {
        sVar5 = ordint_divmod(0x12,DAT_00085a6c[1] + 2).quot;
        iVar7 = (int)sVar5;
        if (5 < iVar7) {
          return;
        }
      }
      else {
        handle_pause_menu_region_click((int)*DAT_00085a6c,(int)DAT_00085a6c[1]);
      }
    }
    if (iVar7 == 5) {
      run_pause_menu_modal_loop(1);
    }
    else {
      set_hud_status_value(8,6);
      uVar6 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar6;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar6 >> 8);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        pop_cursor_icon(3);
      }
      iVar7 = (iVar7 + 1) * 0x10000;
      iVar1 = iVar7 >> 0x10;
      if (iVar1 == g_cursor_mode) {
        /* Dropped argument (Ghidra emitted a bare call despite mode_icon_highlight_off's own body
           using button_y throughout) -- confirmed by this same function's sibling call sites
           elsewhere in the file... */
        mode_icon_highlight_off(g_cursor_mode);
        g_cursor_mode = 0;
      }
      else {
        if (g_cursor_mode != 0) {
          mode_icon_highlight_off(g_cursor_mode);
        }
        g_cursor_mode = (short)((uint)iVar7 >> 0x10);
        if (iVar1 == 2) {
          if ((*(byte *)(DAT_00086df8 + 0xb8) & 1) == 0) {
            uVar2 = *(undefined2 *)(DAT_00086df8 + 0x5f);
            *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar2 | 2;
            *(char *)(DAT_00086df8 + 0x60) = (char)((ushort)uVar2 >> 8);
            set_hud_status_value(8,4);
            mode_icon_highlight_on((int)g_cursor_mode);
            bVar3 = get_current_music_track();
            if ((bVar3 < 5) || (bVar3 = get_current_music_track(), 7 < bVar3)) {
              set_pending_music_track(8);
            }
          }
          else {
            g_cursor_mode = 0;
          }
        }
        else {
          mode_icon_highlight_on(iVar1);
        }
      }
      if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) && (cVar4 = get_current_music_track(), cVar4 == '\b')) {
        pick_random_pending_music_track();
      }
      wait_for_click_release(1);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        push_cursor_icon(0x1077);
      }
    }
  }
}



// was FUN_0003fd14 -- registered over the same mode-icon-bar click rect as cursor_mode_button_click
// but under a different active-mask bit (4, not 1), so it's live in a different input context.
void cursor_mode_button_click_restricted(int button_y)
{
  int iVar1;
  char cVar2;
  short sVar3;
  uint uVar4;
  int iVar5;
  
  if ((g_cursor_holding_state == 0) && ((short)DAT_00201b60 == 1)) {
    iVar5 = (int)button_y;
    if (iVar5 == -1) {
      if (DAT_000868d8 == 0) {
        sVar3 = ordint_divmod(0x12,DAT_00085a6c[1] + 2).quot;
        iVar5 = (int)sVar3;
        if (5 < iVar5) {
          return;
        }
      }
      else {
        handle_pause_menu_region_click((int)*DAT_00085a6c,(int)DAT_00085a6c[1]);
      }
    }
    if (iVar5 == 5) {
      run_pause_menu_modal_loop(1);
    }
    else {
      set_hud_status_value(8,6);
      uVar4 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfffd;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar4;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar4 >> 8);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        pop_cursor_icon(3);
      }
      iVar5 = (iVar5 + 1) * 0x10000;
      iVar1 = iVar5 >> 0x10;
      if (iVar1 == g_cursor_mode) {
        /* Same dropped-argument bug as cursor_mode_button_click's own
           two identical sites above -- see that comment. */
        mode_icon_highlight_off(g_cursor_mode);
        g_cursor_mode = 0;
      }
      else if (iVar1 == 3) {
        if (g_cursor_mode != 0) {
          mode_icon_highlight_off(g_cursor_mode);
        }
        g_cursor_mode = (short)((uint)iVar5 >> 0x10);
        mode_icon_highlight_on(3);
      }
      if (((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) && (cVar2 = get_current_music_track(), cVar2 == '\b')) {
        pick_random_pending_music_track();
      }
      wait_for_click_release(1);
      if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
        push_cursor_icon(0x1077);
      }
    }
  }
}




// was FUN_000497cc -- runs once per in-game main-loop iteration: resets
// the dirty rect to a degenerate {100,100,100,100}, redraws the small
// HUD/cursor element, and flushes that to the display
void main_loop_hud_flush()

{
  /* HACK: not original behaviour -- --max-fps holds each main-loop iteration to a minimum length. */
  if (g_opts.max_fps > 0.0f) uw_limit_frame_rate();
  uw_begin_present_batch();
  dirty_rect_set(100,100,100,100);
  /* HACK: redraw the 3D dungeon view on every main-loop iteration. */
  int _did_force_redraw = 0;
  {
    static int _force = -1;
    if (_force < 0) _force = (!g_opts.no_force_3d_redraw);
    /* Bit 0's enter_dungeon_view handler must fade the outgoing screen
       before drawing the dungeon. Do not overwrite it with this added
       per-tick redraw before the original transition handler runs. */
    if (_force && DAT_00201b64 == 0 && DAT_00201c90 == 0 &&
        (DAT_00201c84 & 1) == 0) {
      _did_force_redraw = 1;
      if (dungeon_palette_cycle_tick()) {
        /* The 3D view re-rasterises below; HUD pixels already in the framebuffer do not, so redraw
           the inventory icons that use the cycled fire colours (lit torches). */
        redraw_lit_light_source_widgets();
      }
      /* Rebuild AND re-rasterise the 3D dungeon view every main-loop iteration. */
      render_dungeon_frame_timed();
      /* --debug-pick-view: run a pick-mode render pass to fill the pick
         buffer, then paint it over the viewport (see
         uw_debug_blit_pick_buffer). */
      if (g_opts.debug_pick_view) { render_dungeon_view_frame(); uw_debug_blit_pick_buffer(); }
      if (g_opts.show_fps) uw_debug_draw_frame_stats();
    }
  }
  if (DAT_00201c84 != 0) {
    /* The forced pass already serviced this redraw request. */
    if (_did_force_redraw) DAT_00201c84 &= ~2;
    dispatch_sticky_mode_handlers();
  }
  /* HACK: drive the attack-swing state machine (tick_weapon_swing_state) every main-loop tick. */
  { static int _swing_tick = -1;
    if (_swing_tick < 0) _swing_tick = (!g_opts.no_force_swing_tick);
    if (_swing_tick) tick_weapon_swing_state(0);
  }
  {
    /* Input callbacks can run blocking prompt/menu loops. Keep their
       presentations immediate rather than annotating every such loop. */
    uw_suspend_present_batch();
    poll_input_bindings(DAT_00085a6c);
    uw_resume_present_batch();
  }
  /* HACK: re-run the per-tick mouse/cursor refresh (update_mouse_state) unconditionally every
     main-loop iteration, not just when this tick happens to dequeue a real OS input message.
     update_mouse_state's own cursor-draw (draw_idle_mouse_cursor) is reached only through... */
  { static int _force_cursor = -1;
    if (_force_cursor < 0) _force_cursor = (!g_opts.no_force_cursor_redraw);
    if (_force_cursor) update_mouse_state();
  }
  populate_debug_panel();
  /* Debug UI: must draw HERE, after the forced 3D redraw above (or it gets painted over) but before
     flush_dirty_rect_to_display(1) below -- that call is the actual screen present for this tick
     (blits the software framebuffer through to GXEndDraw/SDL_RenderPresent, see gx_stub.c). */
  dbgui_draw();
  uw_debug_dump_sprite_frames_once();
  uw_debug_dump_critter_sheet_once();
  /* When the forced 3D redraw ran this frame, push it through even if a mouse button is being held
     in the viewport: DAT_0023c63c (the click-hold flag) otherwise blocks
     flush_dirty_rect_to_display's real screen flush for the whole hold... */
  if (_did_force_redraw) {
    g_force_flush = 1;
    flush_dirty_rect_to_display(1);
    g_force_flush = 0;
  } else {
    flush_dirty_rect_to_display(1);
  }
  /* REVERTED (was a hand-hacked lit-torch HUD icon flicker -- see
     mode-icon-and-hud-icon-flicker-fixes memory for the full arc).
     Unconditionally rotating palette_cycle_range(16,8,1) every 8 ticks
     from here ran regardless of dungeon-view state and touched the
     shared global palette (DAT_00088d98/g_palette_rgb565), the same
     table raster_textured_span samples fresh every frame for ALL 3D
     wall/floor/ceiling rendering -- including real lava textures this
     project confirmed use this exact fire-gradient range (F32.TR/
     F16.TR entries 24/25, W64.TR/W16.TR entry 206). If the original
     game's own (still-unfound) global fire/water palette-animation
     mechanism turns up later, this hack would already be stomping on
     the same palette range and timing, corrupting or double-animating
     it. Pulled until that original mechanism is found or ruled out for
     good; the equipped lit-torch HUD icon is back to not animating. */
  gfx_finalizedraw();
  return;
}




// was FUN_0005d704 -- append the fixed HUD draw-command opcode sequence (compass, panels, sprite ids from get_catalog_sprite_width) to the draw-command list DAT_00110fc0
void emit_hud_draw_commands()

{
  short sVar1;
  undefined2 uVar2;
  bool bVar3;
  
  DAT_0023b830 = 1;
  sVar1 = g_current_view->view_shake_x;
  bVar3 = sVar1 == 0;
  if (bVar3) {
    sVar1 = g_current_view->view_shake_y;
  }
  DAT_0023b4dc = (uint)(bVar3 && sVar1 == 0);
  *DAT_00110fc0 = 0x38;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  emit_glyph_draw_command(0xa0,1);
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(9);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(8);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar2 = get_catalog_sprite_width(4);
  *DAT_00110fc0 = uVar2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189582 = 1;
  DAT_00189580 = 1;
  DAT_00189578 = 0;
  *DAT_00110fc0 = 0xd0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (undefined2)DAT_0023b4dc;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_0023b4f4 = DAT_00086b38;
  DAT_0023b80c = DAT_00086b40;
  DAT_0023b4d4 = DAT_00086b48;
  dungeon_view_prepass_stub(2);
  DAT_0023bc8c = *(undefined2 *)(&DAT_00086b50 + DAT_0023b4a0 * 4);
  DAT_0023b8c0 = *(undefined2 *)(&DAT_00086b52 + DAT_0023b4a0 * 4);
  walk_visible_tiles();
  return;
}




// was FUN_0006ca4c -- brief "shake" animation played on a flask's shared decoration slot
// ((&DAT_0023c224)[iVar1]) when hud_vitals_bar_tick's health-poisoned or mana threshold check
// crosses over...
void hud_vitals_threshold_shake(short flask)
{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  byte *pbVar5;
  
  iVar1 = (int)flask;
  if (iVar1 == 0) {
    if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) == 0) {
      sVar2 = 0x200c;
    }
    else {
      sVar2 = 0x203e;
    }
    iVar4 = (int)sVar2;
  }
  else {
    if (iVar1 != 1) {
      return;
    }
    iVar4 = 0x2025;
  }
  draw_sprite_by_id(0x2057,(int)*(short *)(&DAT_000870ec + iVar1 * 2),0x7e,1,1);
  iVar3 = 0;
  pbVar5 = &DAT_0023c118 + iVar1;
  if (*pbVar5 != 0) {
    do {
      sprite_list_set_position((int)(short)(&DAT_0023c224)[iVar1],(int)*(short *)(&DAT_000870ec + iVar1 * 2),
                   (int)(short)(&DAT_000870f2)[iVar3]);
      sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[iVar1],iVar3 + iVar4);
      flush_sprite_list_compositor();
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < (int)(uint)*pbVar5);
  }
  (&DAT_0023c128)[iVar1] = *pbVar5;
}




// was FUN_0006cca8
void redraw_hud_panels()

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;

  DEBUG(INFO, "[hud] Setting up hud graphics?\n");

  if (DAT_0023c23c == 0) {
    iVar3 = 0;
    do {
      uVar1 = sprite_list_alloc_entry(0);
      (&DAT_0023c224)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,0,0,0x18,4);
      uVar1 = sprite_list_alloc_raw_entry(2,0xd,10);
      (&DAT_0023c230)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087170)[iVar3],0x87,0xd,10);
      g_blit_transparent_mode = 1;
      uVar1 = sprite_list_alloc_raw_entry(2,0x25,0x17);
      (&DAT_0023c234)[iVar3] = (short)uVar1;
      g_blit_transparent_mode = 0;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087174)[iVar3],0x92,0x25,0x17);
      uVar1 = sprite_list_alloc_entry(0);
      (&DAT_0023c238)[iVar3] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_000871b4)[iVar3],0x42,0xc,0x1c);
      (&DAT_0023c12c)[iVar3] = 0;
      (&DAT_0023c11c)[iVar3] = 0;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < 2);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c228 = (undefined2)uVar1;
    sprite_list_set_rect(uVar1,0x70,0x84,0x38,0x20);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c22c = (undefined2)uVar1;
    sprite_list_set_rect(uVar1,(int)DAT_00087130,(int)DAT_00087150,3,4);
    uVar1 = sprite_list_alloc_entry(0);
    DAT_0023c21c = (short)uVar1;
    sprite_list_set_rect(uVar1,0x80,5,1,1);
    DAT_0023c130 = 6;
    DAT_0023c120 = 6;
    DAT_0023c23c = 1;
  }
  iVar3 = 0;
  do {
    hud_vitals_threshold_shake(iVar3);
    sprite_list_set_frame_id((int)(short)(&DAT_0023c230)[iVar3],(&DAT_000871d4)[iVar3]);
    sprite_list_set_frame_id((int)(short)(&DAT_0023c234)[iVar3],(&DAT_000871d8)[iVar3]);
    iVar2 = 0x12;
    if (iVar3 == 0) {
      iVar2 = 0;
    }
    sprite_list_set_frame_id((int)(short)(&DAT_0023c238)[iVar3],iVar2 + 0x207b);
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
  } while (iVar3 < 2);
  snap_compass_to_heading();
  sprite_list_set_frame_id((int)DAT_0023c21c,0x20a6);
  update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
  decode_gr_entry_to_buffer(s_panels_00087260,g_active_hud_panel,DAT_0023cca4);
  /* bitmap_blit_to_framebuffer doesn't take a real "transparent mode" parameter -- it reads the
     global g_blit_transparent_mode instead... */
  g_blit_transparent_mode = 1;
  bitmap_blit_to_framebuffer(0xec,8,DAT_0023cca4,0x72,0x53,0,0,1);
  g_blit_transparent_mode = 0;
  (*(code *)(&g_hud_panel_handlers)[g_active_hud_panel])();
  flush_sprite_list_compositor();
  return;
}




// was FUN_0006cff4 -- generic "set HUD status slot param_1 to param_2" dispatcher: negative param_1
// writes a raw byte value directly, 0/1 compute a health/mana fill tier (0-12) from the player
// object via ordint_divmod (see hud_vitals_bar_tick)...
void set_hud_status_value(byte slot, ushort value)
{
  int iVar1;
  char cVar2;
  byte bVar3;
  undefined1 uVar4;
  ushort uVar5;
  ushort uVar6;
  
  iVar1 = (int)(char)slot;
  uVar4 = (undefined1)value;
  if (iVar1 < 0) {
LAB_0006d09c:
    DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << (uint)slot);
    (&DAT_0023c118)[iVar1] = uVar4;
    return;
  }
  if (iVar1 < 2) {
    if (iVar1 == 1) {
      cVar2 = *(char *)(DAT_00086df8 + 0x38);
    }
    else {
      cVar2 = *(char *)(DAT_0023be74 + 4);
    }
    if (cVar2 == '\0') {
      (&DAT_0023c118)[iVar1] = 0;
    }
    else {
      uVar4 = ordint_divmod(cVar2,(short)value * 0xc).quot;
      (&DAT_0023c118)[iVar1] = uVar4;
    }
    if (0xb < (byte)(&DAT_0023c118)[iVar1]) {
      (&DAT_0023c118)[iVar1] = 0xc;
    }
    goto LAB_0006d17c;
  }
  if (iVar1 == 2) {
    if (value == DAT_0023c12a) {
      return;
    }
    DAT_0023c11a = uVar4;
    DAT_0023c1d8 = DAT_0023c1d8 | 4;
    return;
  }
  if (iVar1 == 3) {
    if (value == 9) {
      DAT_0023c11b = uVar4;
      DAT_0023c1d8 = DAT_0023c1d8 | 8;
      return;
    }
    DAT_0023c11b = uVar4;
    DAT_0023c1e0 = DAT_0023c1e0 | 8;
    return;
  }
  if (iVar1 != 4) {
    if (iVar1 == 6) {
      if (g_active_hud_panel == '\x04') {
        return;
      }
    }
    else if (iVar1 == 8) {
      if ((DAT_000870d8 != DAT_000870dc) && (DAT_0023c120 == '\x06')) {
        return;
      }
      DAT_0023c120 = uVar4;
      DAT_0023c1dc = DAT_0023c1dc | 0x100;
      return;
    }
    goto LAB_0006d09c;
  }
  if (DAT_0023c11c == value) {
    return;
  }
  uVar6 = (ushort)DAT_0023c11d;
  if (uVar6 == value) {
    return;
  }
  if (DAT_0023c12c == value) {
    return;
  }
  uVar5 = (ushort)DAT_0023c12d;
  if (uVar5 == value) {
    return;
  }
  if (DAT_0023c12c == 0) {
joined_r0x0006d150:
    if (uVar5 == 0) {
      bVar3 = ce_rand();
      slot = (bVar3 & 1) + slot;
    }
  }
  else if (uVar5 == 0) {
LAB_0006d164:
    slot = 5;
  }
  else {
    uVar5 = uVar6;
    if (DAT_0023c11c == 0) goto joined_r0x0006d150;
    if (uVar6 == 0) goto LAB_0006d164;
  }
  /* Was `(&DAT_0023c118)[(char)slot] = uVar4;` -- correct for the iVar1<2 (health/mana) branch
     above, which jumps straight to LAB_0006d17c without reaching this line, but this specific write
     only executes for the iVar1==4 dragon-reaction branch... */
  (&DAT_0023c11c)[slot + -4] = uVar4;
LAB_0006d17c:
  DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << (uint)slot);
}



// was FUN_0006d284
void hud_panel_redraw_dispatch()

{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  ushort uVar4;
  uint uVar5;
  byte bVar6;
  int iVar7;
  bool bVar8;
  int iVar9;

  bVar2 = read_realtime_clock_units();
  bVar8 = false;
  if (DAT_0023c1e0 != 0) {
    iVar7 = 1;
    iVar9 = 0;
    uVar4 = DAT_0023c1e0;
    do {
      uVar1 = (ushort)iVar7;
      if ((uVar1 & uVar4) != 0) {
        (*(void (*)(int))(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
        uVar4 = DAT_0023c1e0 & ~uVar1;
        bVar8 = true;
        DAT_0023c1e0 = uVar4;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)uVar1 << 0x11) >> 0x10;
    } while (iVar9 < 9);
  }
  bVar6 = DAT_0023c150;
  if (((DAT_0023c150 ^ bVar2) & 0xe0) != 0) {
    iVar7 = 1;
    iVar9 = 0;
    do {
      if (((ushort)iVar7 & DAT_0023c1dc) != 0) {
        (*(void (*)(int))(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
        bVar6 = DAT_0023c150;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)(ushort)iVar7 << 0x11) >> 0x10;
    } while (iVar9 < 9);
    bVar8 = true;
  }
  if (((bVar6 ^ bVar2) & 0xc0) != 0) {
    sVar3 = ce_rand();
    if (sVar3 < 0x666) {
      uVar5 = (int)sVar3 & 1;
      if (*(int *)(&DAT_0023c1f0 + uVar5 * 4) == 0) {
        *(int *)(&DAT_0023c1f0 + uVar5 * 4) = 1;
        DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << uVar5);
      }
    }
    sVar3 = ce_rand();
    if (sVar3 < 0x666) {
      uVar5 = (int)sVar3 & 1;
      if (*(int *)(&DAT_0023c1f8 + uVar5 * 4) == 0) {
        *(int *)(&DAT_0023c1f8 + uVar5 * 4) = 1;
        DAT_0023c1d8 = DAT_0023c1d8 | (ushort)(1 << uVar5);
      }
    }
    iVar7 = 1;
    iVar9 = 0;
    do {
      if (((ushort)iVar7 & DAT_0023c1d8) != 0) {
        (*(void (*)(int))(&g_hud_panel_ticker_handlers)[iVar9])(iVar9);
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      iVar7 = ((int)(short)(ushort)iVar7 << 0x11) >> 0x10;
    } while (iVar9 < 9);
    bVar8 = true;
  }
  if (bVar8) {
    flush_sprite_list_compositor();
    DAT_0023c150 = bVar2;
  }
  return;
}



// was FUN_0006d4a4
void hud_vitals_bar_tick(short flask)
{
  int iVar1;
  uint uVar2;
  int iVar3;
  short sVar4;
  short sVar5;
  undefined4 uVar6;
  byte *pbVar7;
  uint uVar8;
  uint uVar9;
  short *psVar10;
  short *psVar11;
  ushort local_30;
  short local_2e;
  short local_2c;
  
  uVar2 = (uint)flask;
  if (uVar2 == 0) {
    if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) == 0) {
      local_30 = 0x200c;
      local_2c = 0x2019;
      local_2e = 0x2024;
      if ((0x204a < DAT_00087254) && (DAT_00087254 < 0x2057)) {
        hud_vitals_threshold_shake(0);
        DAT_00087254 = DAT_00087254 + -0x32;
      }
    }
    else {
      local_30 = 0x203e;
      local_2c = 0x204b;
      local_2e = 0x2056;
      if ((0x2018 < DAT_00087254) && (DAT_00087254 < 0x2025)) {
        hud_vitals_threshold_shake(0);
        DAT_00087254 = DAT_00087254 + 0x32;
      }
    }
  }
  else {
    if (uVar2 != 1) {
      return;
    }
    local_30 = 0x2025;
    local_2c = 0x2032;
    local_2e = 0x203d;
  }
  iVar1 = uVar2 * 2;
  psVar11 = (short *)(&DAT_0023c244 + iVar1);
  if (*psVar11 == 0) {
    uVar6 = sprite_list_alloc_entry(0);
    *psVar11 = (short)uVar6;
    sprite_list_set_rect(uVar6,(int)*(short *)(&DAT_000870ec + iVar1),0x7e,0x18,0x21);
    uVar6 = sprite_list_alloc_entry(0);
    *(short *)(&DAT_0023c240 + iVar1) = (short)uVar6;
    sprite_list_set_rect(uVar6,0,0,0x18,4);
    uVar6 = sprite_list_alloc_entry(0);
    *(short *)(&DAT_0023c248 + iVar1) = (short)uVar6;
    sprite_list_set_rect(uVar6,(int)*(short *)(&DAT_000870ec + iVar1),0x7e,0x18,4);
  }
  pbVar7 = &DAT_0023c128 + uVar2;
  uVar8 = (uint)*pbVar7;
  iVar3 = (int)(((byte)(&DAT_0023c118)[uVar2] - uVar8) * 0x10000) >> 0x10;
  if (iVar3 < 1) {
    if (iVar3 < 0) {
      uVar9 = uVar8 + 0xff;
      sVar4 = *(short *)(&DAT_000870ec + iVar1);
      uVar8 = uVar9 & 0xff;
      *pbVar7 = (byte)uVar9;
      iVar3 = (int)(short)uVar8;
      sVar5 = (&DAT_000870f2)[iVar3];
      sprite_list_set_rect((int)*psVar11,(int)sVar4,(int)sVar5,0x18,
                   (&DAT_00087114)[iVar3]);
      sprite_list_set_lifetime((int)*psVar11,sVar5 + -0x7e);
      sprite_list_set_frame_id((int)*psVar11,0x2057);
      if (iVar3 != 0) {
        sprite_list_set_position((int)(short)(&DAT_0023c224)[uVar2],(int)*(short *)(&DAT_000870ec + iVar1),
                     (int)*(short *)(&DAT_000870f0 + iVar3 * 2));
        sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
      }
    }
    else if (*(int *)(&DAT_0023c1f0 + uVar2 * 4) == 0) {
      DAT_0023c1d8 = DAT_0023c1d8 & ~(ushort)(1 << (uVar2 & 0xff));
    }
  }
  else {
    uVar9 = uVar8 + 1;
    sVar4 = *(short *)(&DAT_000870ec + iVar1);
    uVar8 = uVar9 & 0xff;
    *pbVar7 = (byte)uVar9;
    sprite_list_set_position((int)(short)(&DAT_0023c224)[uVar2],(int)sVar4,
                 (int)*(short *)(&DAT_000870f0 + (short)uVar8 * 2));
    sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
  }
  if (((*(int *)(&DAT_0023c1f0 + uVar2 * 4) == 1) && (uVar9 = (uint)(short)uVar8, uVar9 < 8)) &&
     (uVar9 != 0)) {
    psVar11 = &DAT_00087254 + uVar2;
    if (*psVar11 == local_2e) {
      *psVar11 = local_2c;
      sprite_list_set_frame_id((int)(short)(&DAT_0023c224)[uVar2],uVar8 + local_30 + -1);
      *(int *)(&DAT_0023c1f0 + uVar2 * 4) = 0;
    }
    else {
      psVar10 = (short *)(&DAT_000870f0 + uVar9 * 2);
      sprite_list_set_position((int)*(short *)(&DAT_0023c240 + iVar1),(int)*(short *)(&DAT_000870ec + iVar1),
                   (int)*psVar10);
      sVar4 = *(short *)(&DAT_0023c240 + iVar1);
      *psVar11 = *psVar11 + 1;
      sprite_list_set_frame_id((int)sVar4,(int)*psVar11);
      psVar11 = (short *)(&DAT_0023c248 + iVar1);
      sprite_list_set_lifetime((int)*psVar11,*psVar10 + -0x7e);
      sprite_list_set_position((int)*psVar11,(int)*(short *)(&DAT_000870ec + iVar1),(int)*psVar10);
      sprite_list_set_frame_id_transparent((int)*psVar11,0x2058);
    }
  }
}



// was FUN_0006d894, briefly named hud_damage_flash_tick by an earlier pass.
void hud_dragon_reaction_tick(int elapsed)
{
  int iVar1;
  uint uVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  short *psVar7;
  int iVar8;
  short *psVar9;
  int *piVar10;
  short *psVar11;
  short local_40 [8];
  short local_30 [6];
  
  local_40[0] = 0x206f;
  local_40[1] = 0x2073;
  local_40[2] = 0x2077;
  local_40[3] = 0x2081;
  local_40[4] = 0x2085;
  local_40[5] = 0x2089;
  local_30[0] = 0x2072;
  local_30[1] = 0x2076;
  local_30[2] = 0x207a;
  local_30[3] = 0x2084;
  local_30[4] = 0x2088;
  local_30[5] = 0x208c;
  uVar2 = (uint)(short)elapsed;
  if ((uVar2 != 4) && (uVar2 != 5)) {
    return;
  }
  iVar6 = (elapsed + -4) * 0x10000 >> 0x10;
  iVar1 = iVar6 * 2;
  psVar11 = &DAT_0023c1e8 + iVar6;
  if (*psVar11 == 0) {
    g_blit_transparent_mode = 1;
    sVar4 = sprite_list_alloc_raw_entry(3,0x28,0x18);
    g_blit_transparent_mode = 0;
    *psVar11 = sVar4;
  }
  piVar10 = (int *)(&DAT_0023c1f8 + iVar6 * 4);
  if (*piVar10 == 1) {
    iVar5 = (int)DAT_0023c250;
    DAT_0023c250 = DAT_0023c250 + 1;
    sprite_list_set_frame_id((int)(short)(&DAT_0023c238)[iVar6],
                 *(undefined2 *)(&DAT_000871b8 + (iVar6 * 7 + iVar5) * 2));
    if (6 < DAT_0023c250) {
      DAT_0023c250 = 0;
      *piVar10 = 0;
    }
  }
  psVar7 = &DAT_0023c1e4 + iVar6;
  if ((*psVar7 == 0) && ((&DAT_0023c11c)[iVar6] != '\0')) {
    (&DAT_0023c12c)[iVar6] = (&DAT_0023c11c)[iVar6];
    *psVar7 = 1;
  }
  cVar3 = (&DAT_0023c12c)[iVar6];
  if (cVar3 == '\0') {
    if (*piVar10 != 0) {
      return;
    }
    DAT_0023c1d8 = DAT_0023c1d8 & ~(ushort)(1 << (uVar2 & 0xff));
    return;
  }
  if (cVar3 == '\x01') {
    sVar4 = *psVar7;
    if (sVar4 == 1) {
      (&DAT_0023c11c)[iVar6] = 0;
      iVar5 = iVar6 * 6;
      sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                   (int)*(short *)(&DAT_00087188 + iVar5),
                   (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                   *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
      *(short *)(&DAT_0023c24c + iVar1) = local_40[iVar6 * 3];
      *(undefined2 *)(&DAT_0023c124 + iVar1) = 1;
      *psVar7 = 3;
LAB_0006dec8:
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
// HACK: was draw-then-check (`sprite_list_set_frame_id(...); if (local_30[iVar6*3] < *psVar9)
      // { reset-for-next-time; }`).
      if (local_30[iVar6 * 3] < *psVar9) {
        *psVar9 = local_40[iVar6 * 3];
        *(short *)(&DAT_0023c124 + iVar1) = *(short *)(&DAT_0023c124 + iVar1) + -1;
      }
      sprite_list_set_frame_id((int)sVar4,*psVar9); 
      if ((&DAT_0023c11c)[iVar6] == '\0') {
        sVar4 = *(short *)(&DAT_0023c124 + iVar1);
LAB_0006df34:
        if (sVar4 != 0) {
          return;
        }
      }
LAB_0006df3c:
      sVar4 = 4;
    }
    else {
      if (sVar4 == 3) goto LAB_0006dec8;
      if (sVar4 != 4) {
LAB_0006ddf0:
        if (sVar4 != 5) {
          return;
        }
        clear_sprite_list_slot_flag((int)*psVar11);
LAB_0006de00:
        (&DAT_0023c12c)[iVar6] = 0;
        *psVar7 = 0;
        return;
      }
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
// HACK: was `sprite_list_set_frame_id(...); if (*psVar9 <= local_30[iVar6*3]) return;` --
      // i.e. draw first, THEN decide whether the counter overshot.
      if (local_30[iVar6 * 3] < *psVar9) {
        goto LAB_0006de54;
      }
      sprite_list_set_frame_id((int)sVar4,*psVar9); 
      return;
LAB_0006de54:
      sVar4 = 5;
    }
    *psVar7 = sVar4;
  }
  else {
    if (cVar3 == '\x02') {
      sVar4 = *psVar7;
      if (sVar4 != 1) {
        if (sVar4 == 2) goto LAB_0006dd88;
        if (sVar4 != 3) {
          if (sVar4 != 4) goto LAB_0006ddf0;
          psVar9 = (short *)(&DAT_0023c24c + iVar1);
          sVar4 = *psVar11;
          *psVar9 = *psVar9 + -1;
          // HACK: not original behaviour -- was draw-then-check, which drew the frame one before
          // this pose's first (the previous pose's last frame) for a tick before hiding the sprite.
          if (local_40[iVar6 * 3 + 1] <= *psVar9) {
            sprite_list_set_frame_id((int)sVar4,*psVar9);
            return;
          }
          goto LAB_0006de54;
        }
        psVar9 = (short *)(&DAT_0023c24c + iVar1);
        sVar4 = *psVar11;
        *psVar9 = *psVar9 + 1;
        iVar5 = iVar6 * 3 + 1;
        // HACK: not original behaviour -- was draw-then-check, which drew the frame one past this
        // pose's last (the next pose's frame, or the 12x28 vine frame) for a tick before wrapping.
        if (local_30[iVar5] < *psVar9) {
          *psVar9 = local_40[iVar5] + 2;
          *(short *)(&DAT_0023c124 + iVar1) = *(short *)(&DAT_0023c124 + iVar1) + -1;
        }
        sprite_list_set_frame_id((int)sVar4,*psVar9);
        if ((&DAT_0023c11c)[iVar6] == '\0') {
          sVar4 = *(short *)(&DAT_0023c124 + iVar1);
          goto LAB_0006df34;
        }
        goto LAB_0006df3c;
      }
      (&DAT_0023c11c)[iVar6] = 0;
      iVar8 = iVar6 * 3 + 1;
      iVar5 = iVar8 * 2;
      sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                   (int)*(short *)(&DAT_00087188 + iVar5),
                   (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                   *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
      sVar4 = local_40[iVar8];
      *(undefined2 *)(&DAT_0023c124 + iVar1) = 3;
      *(short *)(&DAT_0023c24c + iVar1) = sVar4;
      *psVar7 = 2;
LAB_0006dd88:
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      sprite_list_set_frame_id((int)sVar4,*psVar9); 
      if ((int)*psVar9 <= local_40[iVar6 * 3 + 1] + 1) {
        return;
      }
    }
    else {
      if (cVar3 != '\x03') {
        return;
      }
      sVar4 = *psVar7;
      if (sVar4 == 1) {
        (&DAT_0023c11c)[iVar6] = 0;
        clear_sprite_list_slot_flag((int)(short)(&DAT_0023c234)[iVar6]);
        iVar8 = iVar6 * 3 + 2;
        iVar5 = iVar8 * 2;
        sprite_list_set_rect((int)*psVar11,(int)*(short *)(&DAT_00087178 + iVar5),
                     (int)*(short *)(&DAT_00087188 + iVar5),
                     (int)*(short *)((char *)&PTR_DAT_00087198 + iVar5),
                     *(undefined2 *)((char *)&PTR_DAT_000871a8 + iVar5));
        *(short *)(&DAT_0023c24c + iVar1) = local_40[iVar8];
        *(undefined2 *)(&DAT_0023c124 + iVar1) = 6;
        *psVar7 = 2;
      }
      else if (sVar4 != 2) {
        if (sVar4 == 3) {
          if (((&DAT_0023c11c)[iVar6] == '\0') &&
             (iVar6 = *(short *)(&DAT_0023c124 + iVar1) + -1,
             *(short *)(&DAT_0023c124 + iVar1) = (short)iVar6, iVar6 * 0x10000 >> 0x10 != 0)) {
            return;
          }
          *psVar7 = 4;
          return;
        }
        if (sVar4 != 4) {
          if (sVar4 != 5) {
            return;
          }
          clear_sprite_list_slot_flag((int)*psVar11);
          sprite_list_set_frame_id((int)(short)(&DAT_0023c234)[iVar6],(&DAT_000871d8)[iVar6]);
          goto LAB_0006de00;
        }
        psVar9 = (short *)(&DAT_0023c24c + iVar1);
        sVar4 = *psVar11;
        *psVar9 = *psVar9 + -1;
        sprite_list_set_frame_id((int)sVar4,*psVar9); 
        if (*psVar9 != local_40[iVar6 * 3 + 2]) {
          return;
        }
        goto LAB_0006de54;
      }
      psVar9 = (short *)(&DAT_0023c24c + iVar1);
      sVar4 = *psVar11;
      *psVar9 = *psVar9 + 1;
      // HACK: not original behaviour -- was draw-then-check: it drew frame local_30+1 (0x207b, the
      // 12x28 vine frame) into the 37x23 dragon rect for a tick, a stray strip on screen.
      if ((int)*psVar9 <= (int)local_30[iVar6 * 3 + 2]) {
        sprite_list_set_frame_id((int)sVar4,*psVar9);
        return;
      }
      *psVar9 = (short)((uint)((*psVar9 + -1) * 0x10000) >> 0x10);
    }
    *psVar7 = 3;
  }
}



// was FUN_0006df70 -- one of the 13 entries in g_hud_panel_handlers_table (the per-tick HUD panel
// redraw dispatch, alongside hud_vitals_bar_tick and hud_dragon_reaction_tick, its naming
// siblings).
void hud_compass_needle_tick()

{
  int iVar1;
  short sVar2;
  uint uVar3;
  uint uVar4;

  uVar4 = (uint)DAT_0023c12a;
  sVar2 = (short)(DAT_0023c11a - uVar4);
  iVar1 = (int)((DAT_0023c11a - uVar4) * 0x10000) >> 0x10;
  if (iVar1 == 0) {
    DAT_0023c1d8 = DAT_0023c1d8 & 0xfffb;
  }
  else {
    if (iVar1 < 0) {
      sVar2 = sVar2 + 0x10;
    }
    uVar3 = uVar4 + 1;
    if (8 < sVar2) {
      uVar3 = uVar4 - 1;
    }
    uVar4 = uVar3 & 0xf;
    sprite_list_set_frame_id((int)DAT_0023c228,(uVar3 & 3) + 0x2059);
    sprite_list_set_position((int)DAT_0023c22c,(int)(short)(&DAT_00087130)[(short)uVar4],
                 (int)(short)(&DAT_00087150)[(short)uVar4]);
    sprite_list_set_frame_id((int)DAT_0023c22c,uVar4 + 0x205d);
    DAT_0023c12a = (byte)uVar4;
  }
  return;
}




// was FUN_0006e130
void tick_hud_panel_transition()

{
  int iVar1;

  if (g_committed_hud_panel != g_target_hud_panel) {
    if (DAT_0023c20c == 0) {
      DAT_0023c20c = 1;
      begin_hud_panel_flip(g_target_hud_panel,0xec,8,0x53,0x72);
      g_active_hud_panel = '\x04';
    }
    iVar1 = advance_hud_panel_flip();
    if (iVar1 == 1) {
      g_committed_hud_panel = g_target_hud_panel;
      g_active_hud_panel = g_target_hud_panel;
      DAT_0023c20c = 0;
      DAT_0023c1d8 = DAT_0023c1d8 & 0xffbf;
    }
  }
  return;
}




// was FUN_0006ed0c
void redraw_active_hud_panel()

{
  int iVar1;
  
  iVar1 = decode_gr_entry_to_buffer(s_panels_00087260,g_active_hud_panel,DAT_0023cca4);
  if (iVar1 == 0) {
    debug_print(&DAT_00087298);
  }
  else {
    decrement_cursor_hide_depth();
    bitmap_blit_to_framebuffer(0xec,8,DAT_0023cca4,0x72,0x53,0,0,1);
    (*(code *)(&g_hud_panel_handlers)[g_active_hud_panel])();
    set_draw_color(0x1a);
    flush_dirty_rect_to_display(1);
    cursor_show_idle_tick();
  }
  return;
}




// was FUN_0007f208
int msg_scroll_draw_edges()

{
  int iVar1;
  
  draw_sprite_by_id(DAT_00250724 + 0x20d5,0xb,0xa9,0x1c,4);
  draw_sprite_by_id(DAT_00250724 + 0x20da,0x132,0xa9,0x1c,4);
  iVar1 = (int)DAT_00250724;
  DAT_00250724 = (short)(iVar1 + 1);
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 5) {
    DAT_00250724 = 0;
  }
  return 0;
}




// was FUN_0007f340
void msg_scroll_scroll_up_line(int y_offset)
{
  short sVar1;
  short sVar2;
  
  sVar1 = *(short *)(DAT_00250704 + 0xe);
  sVar2 = *(short *)(DAT_00250704 + 4);
  copy_framebuffer_rect((int)sVar2,((int)*(short *)(DAT_000879b0 + 6) + (int)sVar1) * 0x10000 >> 0x10,
               ((int)*(short *)(DAT_00250704 + 6) - (int)sVar2) * 0x10000 >> 0x10,
               ((sVar1 * -0x10000 >> 0x10) - (int)*(short *)(DAT_000879b0 + 6)) + y_offset,sVar2,
               sVar1);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(*(undefined2 *)(DAT_00250704 + 4),*(undefined2 *)(DAT_00250704 + 10),
               *(undefined2 *)(DAT_00250704 + 6),y_offset + 1);
  if (DAT_00250704 == &g_msg_scroll_panel_state) {
    set_hud_status_value(4,1);
    msg_scroll_draw_edges();
  }
  else {
    draw_conversation_window_decoration();
  }
}



// was FUN_0007f454
void msg_scroll_more_prompt()

{
  undefined2 *puVar1;
  undefined1 uVar2;
  short sVar3;
  
  msg_scroll_scroll_up_line(((int)*(short *)(DAT_000879b0 + 6) + (int)*(short *)(DAT_00250704 + 10)) * 0x10000 >>
               0x10);
  sVar3 = *(short *)(DAT_00250704 + 10);
  uVar2 = *g_draw_color_index;
  *g_draw_color_index = 0xd4;
  draw_text_string(s__MORE__00087994,(int)*(short *)(DAT_00250704 + 0xc),(int)sVar3);
  wait_for_click_to_continue(0,1);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(*(undefined2 *)(DAT_00250704 + 0xc),(int)sVar3,*(undefined2 *)(DAT_00250704 + 6),
               *(undefined2 *)(DAT_00250704 + 2));
  *g_draw_color_index = uVar2;
  DAT_00250710 = *(short *)(DAT_00250704 + 0x14) + -1;
  puVar1 = (undefined2 *)(DAT_00250704 + 0xc);
  *(char *)(DAT_00250704 + 8) = (char)*puVar1;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)*puVar1 >> 8);
  return;
}



// was FUN_0007f570 -- print a string to the message scroll, word-wrapped
// at ~0x31 columns (one msg_scroll_split_escape_segments call per line).
int message_scroll_print_wrapped(char *text)
{
  undefined1 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 *puVar4;
  int extraout_r3;
  int extraout_r3_00;
  /* Ghidra split these into two locals (their own stack-offset names, 0x54 and 0x23, differ by
     exactly 0x31 = sizeof(auStack_54)) -- same "adjacent stack locals are really one buffer"
     pattern fixed elsewhere this session. */
  undefined1 auStack_54_backing [52];
  #define auStack_54 auStack_54_backing
  #define local_23 (auStack_54_backing + 49)

  iVar2 = (int)(short)DAT_00201b60;
  /* Debug: log every string handed to the message scroll. text is NULL at the call sites that
     only flush a pending inline graphic token (get_message_string). */

    DEBUG(INFO, "[scroll] add %s\"%s\" (mode=%d)\n",
            (iVar2 == 1 || iVar2 == 4) ? "" : "DROPPED ",
            (text != (char *)0x0) ? text : "(inline-graphic)",
            iVar2);

  if (iVar2 == 1 || iVar2 == 4) {
    check_mouse_over_msg_scroll_panel();
    iVar2 = extraout_r3;
    if (DAT_00250708 != 0) {
      decrement_cursor_hide_depth();
      iVar2 = extraout_r3_00;
    }
    if (DAT_00250718 != 0) {
      iVar2 = (int)DAT_00250714;
    }
    if (DAT_00250718 != 0 && iVar2 != 1) {
      DAT_00250718 = 0;
      msg_scroll_panel_reset(0);
    }
    DAT_00250710 = *(undefined2 *)(DAT_00250704 + 0x14);
    DAT_0025071c = 0;
    *g_draw_color_index = *(undefined1 *)(DAT_00250704 + 0x16);
    *DAT_00084298 = 0x2a;
    uVar3 = ce_strlen(text);
    for (uVar3 = uVar3 & 0xffff; 0x31 < (uVar3 & 0xffff);
        uVar3 = ((short)uVar3 - iVar2) * 0x10000 >> 0x10) {
      ce_memmove(auStack_54,text,0x31);
      local_23[0] = 0;
      puVar4 = (undefined1 *)ce_strrchr(auStack_54,0x20);
      if (puVar4 == (undefined1 *)0x0) {
        puVar4 = local_23;
      }
      uVar1 = *puVar4;
      *puVar4 = 0;
      iVar2 = ((int)((char *)puVar4 - (char *)auStack_54) * 0x10000) >> 0x10;
      msg_scroll_split_escape_segments(auStack_54,1);
      *puVar4 = uVar1;
      text = iVar2 + text;
    }
    ce_memmove(auStack_54,text,(short)uVar3 + 1);
    msg_scroll_split_escape_segments(auStack_54,0);
    DAT_00250720 = read_realtime_clock_units();
    if (DAT_00250708 != 0) {
      cursor_show_idle_tick();
    }
    iVar2 = (int)*(short *)(DAT_00250704 + 0x14);
  }
  else {
    iVar2 = -1;
  }
  return iVar2;
}
#undef auStack_54
#undef local_23




// was FUN_0007f7cc
void msg_scroll_draw_wrapped_span(char *text, int span_length)
{
  char *pRec;
  undefined2 *puVar1;
  char cVar2;
  undefined2 uVar3;
  uint uVar4;
  int iVar5;
  undefined1 uVar6;
  int iVar7;
  /* Recursion-depth safety valve for the msg_scroll_draw_wrapped_span<->msg_scroll_wrap_split_line
     word- wrap pair: msg_scroll_wrap_split_line's search-for-a-space-to-split-on has no fallback
     once the remainder is down to a single character/space that still doesn't fit the remaining... */
  static int s_wrap_recursion_depth = 0;
  s_wrap_recursion_depth++;

  iVar5 = 0;
  if ((g_scroll_control_codes_enabled != 0) && (*text == '\\')) {
    cVar2 = text[1];
    text = text + 2;
    if (cVar2 < '6') {
      if (cVar2 == '5') {
        uVar6 = 0xc4;
      }
      else if ((cVar2 == '0') || (cVar2 == '1')) {
LAB_0007f860:
        uVar6 = 0x60;
      }
      else if (cVar2 == '2') {
        uVar6 = 0xf1;
      }
      else {
        if (cVar2 == '3') goto LAB_0007f860;
        if (cVar2 != '4') goto LAB_0007f8b8;
        uVar6 = 0xb4;
      }
LAB_0007f8b0:
      *g_draw_color_index = uVar6;
    }
    else {
      if (cVar2 == '6') {
        uVar6 = 0xd4;
        goto LAB_0007f8b0;
      }
      if (cVar2 == 'P') {
LAB_0007f894:
        wait_for_click_to_continue(iVar5 + 200,1);
      }
      else if (cVar2 == 'm') {
        msg_scroll_more_prompt();
      }
      else if (cVar2 == 'p') {
        iVar5 = 400;
        goto LAB_0007f894;
      }
    }
LAB_0007f8b8:
    *(undefined1 *)(DAT_00250704 + 0x16) = *g_draw_color_index;
    *(undefined1 *)(DAT_00250704 + 0x17) = 0;
  }
  if (*(int *)(DAT_00250704 + 0x10) == 0) goto LAB_0007fa30;
  iVar5 = (int)*(short *)(DAT_00250704 + 10) + (int)*(short *)(DAT_000879b0 + 6);
  uVar3 = (undefined2)(uintptr_t)iVar5;
  iVar7 = (int)*(short *)(DAT_000879b0 + 6) + ((int)(iVar5) * 0x10000 >> 0x10);
  iVar5 = *(short *)(DAT_00250704 + 2) + 1;
  if ((int)DAT_00250710 - (int)(short)span_length < 0) {
    if (iVar5 < iVar7) {
      msg_scroll_more_prompt();
      uVar3 = *(undefined2 *)(DAT_00250704 + 10);
    }
    else {
LAB_0007f9ac:
      iVar5 = *(short *)(DAT_00250704 + 0x14) + 1;
      *(char *)(DAT_00250704 + 0x14) = (char)(uintptr_t)iVar5;
      *(char *)(DAT_00250704 + 0x15) = (char)((uint)(uintptr_t)iVar5 >> 8);
    }
  }
  else {
    if (iVar7 <= iVar5) goto LAB_0007f9ac;
    /* Ghidra dropped msg_scroll_scroll_up_line's argument here: it's the bottom Y of the block to
       shift up -- cursor_y + line_h, i.e. uVar3 as computed at the top of this function
       (msg_scroll_more_prompt's own call passes the identical expression). */
    msg_scroll_scroll_up_line((int)(short)uVar3);
    uVar3 = *(undefined2 *)(DAT_00250704 + 10);
    DAT_00250710 = DAT_00250710 + -1;
  }
  *(char *)(DAT_00250704 + 10) = (char)uVar3;
  *(char *)(DAT_00250704 + 0xb) = (char)((ushort)uVar3 >> 8);
  puVar1 = (undefined2 *)(DAT_00250704 + 0xc);
  *(char *)(DAT_00250704 + 8) = (char)*puVar1;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)*puVar1 >> 8);
  *(undefined1 *)(DAT_00250704 + 0x10) = 0;
  *(undefined1 *)(DAT_00250704 + 0x11) = 0;
  *(undefined1 *)(DAT_00250704 + 0x12) = 0;
  *(undefined1 *)(DAT_00250704 + 0x13) = 0;
LAB_0007fa30:
  iVar7 = measure_text_width(text);
  pRec = (char *)DAT_00250704;
  if (((*(short *)(DAT_00250704 + 8) + iVar7) * 0x10000 >> 0x10 < (int)*(short *)(DAT_00250704 + 6))
      || (32 < s_wrap_recursion_depth))
  {
    uVar4 = ce_strlen(text);
    /* Guard against text being an empty string: (uVar4 & 0xffff) - 1 underflows to 0xffff (index
       -1), reading/writing one byte before the string... */
    if ((uVar4 != 0) && (text[(int)(((uVar4 & 0xffff) - 1) * 0x10000) >> 0x10] == '\n')) {
      text[(int)(((uVar4 & 0xffff) - 1) * 0x10000) >> 0x10] = '\0';
      *(undefined1 *)(DAT_00250704 + 0x10) = 1;
      *(undefined1 *)(DAT_00250704 + 0x11) = 0;
      *(undefined1 *)(DAT_00250704 + 0x12) = 0;
      *(undefined1 *)(DAT_00250704 + 0x13) = 0;
      pRec = (char *)DAT_00250704;
    }
    draw_text_string(text,(int)*(short *)(pRec + 8),(int)*(short *)(pRec + 10));
    iVar5 = measure_text_width(text);
    iVar5 = *(short *)(DAT_00250704 + 8) + iVar5;
    *(char *)(DAT_00250704 + 8) = (char)(uintptr_t)iVar5;
    *(char *)(DAT_00250704 + 9) = (char)((uint)(uintptr_t)iVar5 >> 8);
  }
  else {
    msg_scroll_wrap_split_line(text,span_length);
  }
  s_wrap_recursion_depth--;
}



// was FUN_0007fb2c
void msg_scroll_wrap_split_line(char *text, int span_length)
{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  char cVar6;

  /* Guard against infinite msg_scroll_draw_wrapped_span<->msg_scroll_wrap_split_line recursion on
     an empty string: msg_scroll_draw_wrapped_span sends text here whenever its pixel width
     doesn't fit the remaining line width... */
  if (ce_strlen(text) == 0) {
    return;
  }
  pcVar3 = (char *)ce_strrchr(text,0x20);
  if (pcVar3 != (char *)0x0) {
    cVar6 = ' ';
    do {
      *pcVar3 = '\0';
      sVar2 = measure_text_width(text);
      if ((int)*(short *)(DAT_00250704 + 8) + (int)sVar2 < (int)*(short *)(DAT_00250704 + 6))
      goto LAB_0007fc2c;
      pcVar4 = (char *)ce_strrchr(text,0x20);
      *pcVar3 = ' ';
      pcVar3 = pcVar4;
    } while (pcVar4 != (char *)0x0);
  }
  iVar5 = ce_strlen(text);
  cVar6 = text[iVar5 + -1];
  pcVar3 = text + iVar5 + -2;
  do {
    pcVar3[1] = cVar6;
    /* BUG FIX: this bounds check used to run AFTER `pcVar3 = pcVar3 - 1; cVar6 = *pcVar3; *pcVar3 =
       '\0';` below instead of before. */
    if (pcVar3 <= text) {
      /* Was `&s_scroll_newline_0008522c` -- confirmed via real ARM disassembly (0x7fc74: `ldr
         r0,[0x7fc88]`, and DAT_0007fc88's own stored value IS 0x8522c) that the original binary
         passes this exact same shared "\n" constant's address here too... */
      char local_newline_copy[2];
      local_newline_copy[0] = '\n';
      local_newline_copy[1] = '\0';
      msg_scroll_draw_wrapped_span(local_newline_copy,1);
      goto LAB_0007fc64;
    }
    pcVar3 = pcVar3 + -1;
    cVar6 = *pcVar3;
    *pcVar3 = '\0';
    sVar2 = measure_text_width(text);
  } while ((int)*(short *)(DAT_00250704 + 6) <= (int)*(short *)(DAT_00250704 + 8) + (int)sVar2);
LAB_0007fc2c:
  *pcVar3 = cVar6;
  cVar1 = pcVar3[1];
  *pcVar3 = '\n';
  pcVar3[1] = '\0';
  msg_scroll_draw_wrapped_span(text,1);
  *pcVar3 = cVar6;
  pcVar3[1] = cVar1;
  text = pcVar3 + (cVar6 == ' ');
LAB_0007fc64:
  msg_scroll_draw_wrapped_span(text,span_length);
}



// was FUN_0007fc8c
void msg_scroll_panel_init(int panel_x, int panel_y, int panel_width, int panel_height, int clear_panel)
{
  char *ctx;

  if (clear_panel != 0) {
    set_draw_color(0xf1);
    rect_fill_or_save_restore(panel_x + 0xe,panel_y + 1,panel_width + -0xf,panel_height + -1);
  }
  set_draw_color(0x2a);
  rect_fill_or_save_restore(panel_x,panel_y,panel_width,panel_height);

  /* Populate the message-scroll context struct (DAT_00250704 -> g_msg_scroll_panel_state) from the
     region rectangle. */
  ctx = (char *)DAT_00250704;
  if (ctx != (char *)0x0) {
    *(short *)(ctx + 0x00) = (short)panel_y;   /* top y (erase rect)   */
    *(short *)(ctx + 0x02) = (short)panel_height;   /* bottom y             */
    *(short *)(ctx + 0x04) = (short)panel_x;   /* left x               */
    *(short *)(ctx + 0x06) = (short)panel_width;   /* right x              */
    *(short *)(ctx + 0x08) = (short)panel_x;   /* draw cursor x        */
    *(short *)(ctx + 0x0a) = (short)(panel_y + 4); /* draw cursor y (small top margin) */
    *(short *)(ctx + 0x0c) = (short)panel_x;   /* new-line left margin */
    *(short *)(ctx + 0x0e) = (short)panel_y;   /* top y (scroll blit)  */
    *(int   *)(ctx + 0x10) = 0;                /* pending-newline flag */
    *(short *)(ctx + 0x14) = 0;                /* lines printed        */
    ctx[0x16] = 0x60;                          /* default text colour  */
    ctx[0x17] = 0;
  }
}



/* Every field-offset constant below that was written as a bare `DAT_00250704 + N` (no cast before
   the addition) was wrong -- half what it should be. */
// was FUN_0007fce8
void msg_scroll_panel_reset(int redraw)
{
  char *pStruct;
  undefined2 uVar1;
  int iVar2;

  if ((redraw != 0) && (check_mouse_over_msg_scroll_panel(), DAT_00250708 != 0)) {
    decrement_cursor_hide_depth();
  }
  set_draw_color(0x2a);
  pStruct = (char *)DAT_00250704;
  rect_fill_or_save_restore(*(short *)(pStruct + 4),*(short *)(pStruct + 0),
               (ushort)*(short *)(pStruct + 6) + 1,(ushort)*(short *)(pStruct + 2) + 1);
  uVar1 = *(undefined2 *)(pStruct + 0xe);
  *(char *)(pStruct + 0xa) = (char)uVar1;
  *(char *)(pStruct + 0xb) = (char)((ushort)uVar1 >> 8);
  uVar1 = *(undefined2 *)(pStruct + 0xc);
  *(char *)(pStruct + 8) = (char)uVar1;
  *(char *)(pStruct + 9) = (char)((ushort)uVar1 >> 8);
  *(undefined1 *)(pStruct + 0x10) = 0;
  *(undefined1 *)(pStruct + 0x11) = 0;
  *(undefined1 *)(pStruct + 0x12) = 0;
  *(undefined1 *)(pStruct + 0x13) = 0;
  *(undefined1 *)(pStruct + 0x14) = 0;
  *(undefined1 *)(pStruct + 0x15) = 0;
  if (DAT_00250704 == (undefined *)&g_msg_scroll_panel_state) {
    set_hud_status_value(4,1);
    iVar2 = msg_scroll_draw_edges();
  }
  else {
    iVar2 = draw_conversation_window_decoration();
  }
  if (redraw != 0) {
    iVar2 = DAT_00250708;
  }
  if (redraw != 0 && iVar2 != 0) {
    cursor_show_idle_tick();
  }
}







// was FUN_0006cb74 -- snaps the compass dial (DAT_0023c228) and needle (DAT_0023c22c) sprites
// straight to the player's real current heading (DAT_0023c11a)...
void snap_compass_to_heading()

{
  byte bVar1;
  uint uVar2;

  bVar1 = DAT_0023c11a;
  uVar2 = (uint)DAT_0023c11a;
  sprite_list_set_frame_id((int)DAT_0023c228,(uVar2 & 3) + 0x2059);
  sprite_list_set_position((int)DAT_0023c22c,(int)(short)(&DAT_00087130)[(short)(ushort)bVar1],
               (int)(short)(&DAT_00087150)[(short)(ushort)bVar1]);
  sprite_list_set_frame_id((int)DAT_0023c22c,uVar2 + 0x205d);
  flush_sprite_list_compositor();
  return;
}



// was FUN_0006cbf0 -- resets the HUD panel subsystem's transient animation/selection state: zeroes
// the two 9-entry per-panel-button state arrays (DAT_0023c118/DAT_0023c128), hides the two sprites
// DAT_0023c1e8/DAT_0023c1ea via clear_sprite_list_slot_flag...
void reset_hud_panel_animation_state()

{
  int iVar1;

  iVar1 = 0;
  do {
    (&DAT_0023c118)[iVar1] = 0;
    (&DAT_0023c128)[iVar1] = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 9);
  clear_sprite_list_slot_flag((int)DAT_0023c1e8);
  clear_sprite_list_slot_flag((int)DAT_0023c1ea);
  DAT_0023c1e6 = 0;
  g_active_hud_panel = 0;
  DAT_0023c1e4 = 0;
  DAT_0023c220 = 0;
  DAT_0023c1d8 = DAT_0023c1d8 & 0xff7f;
  DAT_0023c11f = 4;
  DAT_0023c120 = 6;
  DAT_0023c130 = 6;
  DAT_000870e0 = 6;
  DAT_000870e4 = 0;
  flush_sprite_list_compositor();
  return;
}






// was thunk_FUN_0006edb8 -- Ghidra's own name (not related to the unrelated, differently-addressed
// release_hud_panel_flip_grtiles defined later in this file, despite the identical-looking suffix
// -- this project's established split-symbol/naming-collision bug class)...
void release_panel_wipe_grtiles()

{
  int iVar1;

  iVar1 = 0;
  do {
    if ((&DAT_0023c200)[iVar1] != 0) {
      release_grtile_handle();
      (&DAT_0023c200)[iVar1] = 0;
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  return;
}






// was FUN_0006e038 -- updates a small HUD status-icon sprite (DAT_0023c254, allocated on first use)
// from the state code DAT_0023c11b (0..0xd/13; out-of-range values leave the icon alone).
void update_hud_status_icon_frame()

{
  uint uVar1;
  char cVar2;
  undefined4 uVar3;
  int iVar4;

  cVar2 = DAT_0023c11b;
  uVar1 = (uint)DAT_0023c11b;
  if ((-1 < (int)uVar1) && ((int)uVar1 < 0xe)) {
    if (DAT_0023c254 == 0) {
      uVar3 = sprite_list_alloc_entry(0);
      DAT_0023c254 = (short)uVar3;
      sprite_list_set_rect(uVar3,4,0x8c,1,1);
    }
    if (uVar1 == 9) {
      iVar4 = (int)DAT_00087258;
      DAT_00087258 = DAT_00087258 + 1;
      sprite_list_set_frame_id((int)DAT_0023c254,iVar4 + 0x2098);
      if (0xd < DAT_00087258) {
        DAT_00087258 = 9;
      }
      DAT_0023c1d8 = DAT_0023c1d8 | 8;
    }
    else {
      if (DAT_0023c258 == 9) {
        DAT_00087258 = 9;
      }
      sprite_list_set_frame_id((int)DAT_0023c254,(uVar1 & 0xffff) + 0x2098);
      DAT_0023c1d8 = DAT_0023c1d8 & 0xfff7;
    }
    DAT_0023c258 = (short)cVar2;
  }
  return;
}






// was FUN_0006e1d4 -- per-tick driver for the small HUD panel-switch wipe-transition icon (sprite
// handle DAT_0023c21c, same one snap_compass_to_heading's sibling reset_hud_panel_animation_state
// resets to frame 0x20a6 ("idle") and redraw_hud_panels allocates at a 1x1 screen position).
void hud_panel_wipe_transition_tick()

{
  int iVar1;
  /* Original .data at 0x87200; ARM 0x6e27c..0x6e284 indexes halfwords. */
  static const ushort wipe_frames[6] = {0x20a7,0x20a8,0x20a9,0x20a8,0x20a7,0};

  if ((uint)DAT_0023c12f == (uint)DAT_0023c11f) {
    DAT_0023c220 = 2;
    DAT_0023c25c = 0;
  }
  else {
    if ((uint)DAT_0023c12f == DAT_0023c11f - 4) goto LAB_0006e244;
    if (DAT_0023c25c != 0) {
      DAT_0023c220 = 2;
      DAT_0023c25c = 0;
    }
    DAT_0023c12f = DAT_0023c11f;
  }
  DAT_0023c11f = DAT_0023c11f + 4;
LAB_0006e244:
  iVar1 = (int)DAT_0023c220;
  if ((iVar1 == 3) && (DAT_0023c25c < 0x10)) {
    DAT_0023c25c = DAT_0023c25c + 1;
  }
  else {
    DAT_0023c220 = DAT_0023c220 + 1;
    sprite_list_set_frame_id((int)DAT_0023c21c,
                 (uint)DAT_0023c12f * 3 + -3 + (uint)wipe_frames[iVar1]);
  }
  if (5 < DAT_0023c220) {
    DAT_0023c25c = 0;
    DAT_0023c220 = 0;
    DAT_0023c12f = 0;
    sprite_list_set_frame_id((int)DAT_0023c21c,0x20a6);
    DAT_0023c1d8 = DAT_0023c1d8 & 0xff7f;
  }
  return;
}






// was FUN_0006e96c -- the "ready to cast" rune-slot icon updater (see DAT_0023c268's own
// declaration comment): allocates 3 icon sprites on first use (positioned via DAT_00087210) and,
// for each of the 3 selected-rune bytes at param_1[0..2]...
/* Was `int`, truncating the real pointer callers pass (DAT_00086df8 + 0x47, DAT_00086df8 being a
   genuine `char *`). */
void update_ready_rune_slot_icons(char *character)
{
  undefined4 uVar1;
  int iVar2;
  
  if (DAT_0023c268 == 0) {
    iVar2 = 0;
    g_blit_transparent_mode = 1;
    do {
      uVar1 = sprite_list_alloc_raw_entry(1,0x10,0x10);
      (&DAT_0023c268)[iVar2] = (short)uVar1;
      sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087210)[iVar2],0x8b,0x10,0x10);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
    g_blit_transparent_mode = 0;
  }
  iVar2 = 0;
  do {
    if (*(byte *)(iVar2 + character) < 0x18) {
      sprite_list_set_frame_id((int)(&DAT_0023c268)[iVar2],*(byte *)(iVar2 + character) + 0xe8);
    }
    else {
      clear_sprite_list_slot_flag((int)(&DAT_0023c268)[iVar2]);
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 3);
  flush_sprite_list_compositor();
}






// was FUN_0006ea54 -- HUD light-color indicator: shows up to 3 small icons (mirrored off the
// opposite screen edge from update_ready_rune_slot_icons's rune slots -- DAT_00087218's X positions
// decrease where DAT_00087210's increase)...
/* Same truncation bug as its sibling update_ready_rune_slot_icons above. */
void update_light_source_color_icons(char *character)
{
  undefined4 uVar1;
  int iVar2;
  
  if (*(short *)(DAT_00085a6c + 8) == 1) {
    if (DAT_0023c270 == 0) {
      iVar2 = 0;
      g_blit_transparent_mode = 1;
      do {
        uVar1 = sprite_list_alloc_raw_entry(1,0x10,0x12);
        (&DAT_0023c270)[iVar2] = (short)uVar1;
        sprite_list_set_rect(uVar1,(int)(short)(&DAT_00087218)[iVar2],0x89,0x10,0x12);
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < 3);
      g_blit_transparent_mode = 0;
    }
    iVar2 = 0;
    do {
      if (*(byte *)(iVar2 + character) < 0x15) {
        sprite_list_set_frame_id((int)(&DAT_0023c270)[iVar2],*(byte *)(iVar2 + character) + 0x20c0);
      }
      else {
        clear_sprite_list_slot_flag((int)(&DAT_0023c270)[iVar2]);
      }
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 3);
    flush_sprite_list_compositor();
  }
}






// was FUN_0006eb64 -- begins the HUD panel-switch flip transition to param_1 (the target panel):
// lazily allocates the 3 flip grtile slots (DAT_0023c200/202/204) on first use, cleaning up via
// release_hud_panel_flip_grtiles on failure...
void begin_hud_panel_flip(int target_panel, short rect_x, short rect_y, short rect_width, short rect_height)
{
  undefined1 uVar1;
  /* Was `ushort` -- too narrow for alloc_flip_grtile_slot's real 4-byte grtile key now that it's no
     longer a stub (harmless before, when it always returned 0). */
  undefined4 uVar2;
  ushort uVar3;
  /* Was `undefined4` -- truncated resolve_flip_grtile_slot's real pointer return (see its own
     comment) to 32 bits on this host before handing it to
     decode_gr_entry_to_buffer/bitmap_blit_to_framebuffer. */
  char *uVar4;
  /* Was `int` -- doubles as this loop's plain counter (0..2, fine either way) AND, further down,
     resolve_flip_grtile_slot's real pointer return used in pointer arithmetic (`iVar5 + 0x2800`),
     which does need the wider type now that that call isn't a stub. */
  intptr_t iVar5;
  ushort uVar6;

  uVar6 = 1;
  DAT_0023c140 = rect_height;
  DAT_0023c144 = rect_width;
  DAT_0023c148 = rect_x;
  DAT_0023c14c = rect_y;
  if (DAT_0023c278 == 0) {
    iVar5 = 0;
    do {
      if ((&DAT_0023c200)[iVar5] == 0) {
        uVar2 = alloc_flip_grtile_slot();
        /* Not decompiled -- see alloc_flip_grtile_slot's own comment. */
        (&DAT_0023c200)[iVar5] = uVar2;
        /* Was `uVar6 = uVar6 & uVar2;` -- a bitwise AND of the success accumulator against uVar2
           directly made sense when uVar2 could only ever be the stub's constant 0, but uVar2 is now
           a real (large, effectively-arbitrary-bit-pattern) grtile key... */
        uVar6 = uVar6 & (uVar2 != 0);
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 3);
    if (uVar6 == 0) {
      release_hud_panel_flip_grtiles();
    }
    else {
      g_flip_grtile_cache_ready = g_flip_grtile_cache_ready | 1;
    }
    DAT_0023c278 = 1;
  }
  if ((g_flip_grtile_cache_ready & 1) != 0) {
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    uVar2 = decode_gr_entry_to_buffer(s_panels_00087260,target_panel,uVar4);
    iVar5 = (intptr_t)resolve_flip_grtile_slot(DAT_0023c200);
    uVar3 = decode_gr_entry_to_buffer(s_panels_00087260,3,(void *)(intptr_t)(iVar5 + 0x2800));
    if ((uVar2 & uVar3 & uVar6) == 0) {
      report_fatal_error_and_exit(0x300e);
    }
    decrement_cursor_hide_depth();
    /* Not decompiled -- capture the CURRENT (source/old panel's) live screen content into
       DAT_0023c200's offset-0 region... */
    uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
    capture_framebuffer_rect_to_grtile_paletted(uVar4,0xec,8,0x53,0x72);
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    bitmap_blit_to_framebuffer(0xec,8,uVar4,0x72,0x53,0,0,1);
    uVar1 = g_active_hud_panel;
    g_active_hud_panel = (undefined1)target_panel;
    DAT_00085c54 = 0;
    (*(code *)(&g_hud_panel_handlers)[(short)target_panel])();
    DAT_00085c54 = 1;
    g_active_hud_panel = uVar1;
    uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
    capture_framebuffer_rect_to_grtile_paletted(uVar4,0xec,8,0x53,0x72);
    /* Not decompiled -- put the source content (just captured above) back on screen now that we're
       done using the screen as a scratch surface to capture the target. */
    uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
    bitmap_blit_to_framebuffer(0xec,8,uVar4,0x72,0x53,0,0,1);
    cursor_show_idle_tick();
  }
  DAT_0023c134 = (short)target_panel;
}



// was FUN_0006edb8 -- byte-for-byte identical body to release_panel_wipe_grtiles (this project's
// established split-symbol/ naming-collision bug class -- see that function's own comment; not
// merged into one)...
void release_hud_panel_flip_grtiles()

{
  int iVar1;

  iVar1 = 0;
  do {
    if ((&DAT_0023c200)[iVar1] != 0) {
      release_grtile_handle();
      (&DAT_0023c200)[iVar1] = 0;
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  return;
}



// was FUN_0006edfc -- per-tick step of the HUD panel-switch flip animation begun by
// begin_hud_panel_flip: advances a multi-stage counter...
bool advance_hud_panel_flip()

{
  undefined1 uVar1;
  byte bVar2;
  /* Were `undefined4` -- truncated the real 64-bit pointers this function passes around
     (DAT_0023cca4 itself, and resolve_flip_grtile_slot's return value) to 32 bits on this host
     before handing them to... */
  char *uVar3;
  char *uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  bool bVar10;
  /* Was `iVar7 + 0x2800` (iVar7 declared `int`) -- iVar7 is reused as a plain int scratch
     everywhere else in this function, but in the DAT_0023c208==4 stage it briefly holds
     resolve_flip_grtile_slot's real 64-bit pointer... */
  char *pFlipSrc4;
  
  uVar3 = DAT_0023cca4;
  bVar2 = DAT_0023c208 + 1;
  if ((g_flip_grtile_cache_ready & 1) != 0) {
    DAT_0023c208 = bVar2;
    decrement_cursor_hide_depth();
    uVar3 = resolve_flip_grtile_slot(DAT_0023c204);
    if (DAT_0023c208 == 1) {
      uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
      capture_framebuffer_rect_to_grtile_paletted(uVar4,(int)(short)DAT_0023c148,(int)(short)DAT_0023c14c,(int)DAT_0023c144,
                   DAT_0023c140);
      squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
      set_draw_color(0xf1);
      iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
      iVar7 = (int)DAT_0023c144 - (int)DAT_0023c13c;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      iVar9 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      if (iVar9 < 0) {
        iVar9 = iVar9 + 1;
      }
      /* Not decompiled -- was `(iVar9 >> 1) - DAT_0023c14c`. */
      rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar9 >> 1 & 0xffffU),
                   (int)(short)DAT_0023c148 + (iVar7 >> 1 & 0xffffU),
                   (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
      iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
      iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      iVar9 = (int)DAT_0023c13c + (int)DAT_0023c144;
      if (iVar9 < 0) {
        iVar9 = iVar9 + 1;
      }
      /* Not decompiled -- same "16 pixels too high" fix as above. */
      rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar9 >> 1) & 0xffff,
                   (int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                   (int)DAT_0023c144 + (uint)DAT_0023c148,(uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff
                  );
      iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
      if (iVar5 < 0) {
        iVar5 = iVar5 + 1;
      }
      /* Not decompiled -- same "16 pixels too high" fix as above,
         this time for the actual squashed-content blit position. */
      bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                   (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                   DAT_0023c13c,0,0,1);
    }
    else if (1 < DAT_0023c208) {
      if (DAT_0023c208 < 4) {
        uVar4 = resolve_flip_grtile_slot(DAT_0023c200);
        squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
        set_draw_color(0xf1);
        iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar7 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        iVar9 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        /* Not decompiled -- "16 pixels too high" fix, see the identical block in the
           DAT_0023c208==1 branch above for the full explanation (disassembly-confirmed real bug,
           not a decompiler artifact). */
        rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar9 >> 1 & 0xffffU),
                     (int)(short)DAT_0023c148 + (iVar7 >> 1 & 0xffffU),
                     (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
        iVar5 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        iVar9 = (int)DAT_0023c13c + (int)DAT_0023c144;
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar9 >> 1) & 0xffff,
                     (int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                     (int)DAT_0023c144 + (uint)DAT_0023c148,
                     (uint)DAT_0023c14c + (iVar5 >> 1) & 0xffff);
        iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar7 < 0) {
          iVar7 = iVar7 + 1;
        }
        iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                     (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                     DAT_0023c13c,0,0,1);
      }
      else if (DAT_0023c208 == 4) {
        pFlipSrc4 = resolve_flip_grtile_slot(DAT_0023c200);
        set_draw_color(0xf1);
        iVar9 = (int)DAT_0023c140 + (int)DAT_0023c138;
        iVar5 = (int)DAT_0023c144 + (int)DAT_0023c13c;
        if (iVar9 < 0) {
          iVar9 = iVar9 + 1;
        }
        iVar8 = (int)DAT_0023c138 - (int)DAT_0023c140;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        if (iVar8 < 0) {
          iVar8 = iVar8 + 1;
        }
        iVar6 = (int)DAT_0023c144 - (int)DAT_0023c13c;
        if (iVar6 < 0) {
          iVar6 = iVar6 + 1;
        }
        /* Not decompiled -- "16 pixels too high" fix, see the
           DAT_0023c208==1 branch above for the full explanation. */
        rect_fill_or_save_restore((uint)DAT_0023c148 + (iVar6 >> 1) & 0xffff,
                     (int)DAT_0023c14c - (iVar8 >> 1 & 0xffffU),
                     (uint)DAT_0023c148 + (iVar5 >> 1) & 0xffff,
                     (uint)DAT_0023c14c + (iVar9 >> 1) & 0xffff);
        iVar5 = -(int)DAT_0023c140 + 0x78;
        if (iVar5 < 0) {
          iVar5 = -(int)DAT_0023c140 + 0x79;
        }
        iVar9 = DAT_0023c144 + -3;
        if (iVar9 < 0) {
          iVar9 = DAT_0023c144 + -2;
        }
        bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar9 >> 1),
                     (int)(short)(iVar5 >> 1) - (int)(short)DAT_0023c14c,pFlipSrc4 + 0x2800,0x78,3,0,0,1
                    );
      }
      else if (4 < DAT_0023c208) {
        if (DAT_0023c208 < 8) {
          uVar4 = resolve_flip_grtile_slot(DAT_0023c202);
          set_draw_color(0xf1);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          /* Was missing its 4th argument (y2) -- real disassembly (0006f3d8-0006f400) shows r3
             genuinely computed as `(short)DAT_0023c14c + (short)(iVar7 >> 1)` right before the
             call... */
          /* Not decompiled -- "16 pixels too high" fix, see the
             DAT_0023c208==1 branch above for the full explanation. */
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          iVar7 = (int)DAT_0023c138 + (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c140 + (uint)DAT_0023c14c,
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          squash_hud_panel_flip_rows(uVar4,uVar3,DAT_0023c208);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          iVar5 = (int)DAT_0023c144 - (int)DAT_0023c13c;
          if (iVar5 < 0) {
            iVar5 = iVar5 + 1;
          }
          /* Not decompiled -- "16 pixels too high" fix (the
             squashed-content blit position itself this time). */
          bitmap_blit_to_framebuffer((int)(short)DAT_0023c148 + (int)(short)(iVar5 >> 1),
                       (int)(short)DAT_0023c14c - (int)(short)(iVar7 >> 1),uVar3,(int)DAT_0023c138,
                       DAT_0023c13c,0,0,1);
        }
        else if (DAT_0023c208 == 8) {
          uVar3 = resolve_flip_grtile_slot(DAT_0023c202);
          set_draw_color(0xf1);
          iVar7 = (int)DAT_0023c138 - (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          /* Was missing its 4th argument (y2) -- same dropped-argument bug as the sibling call
             above (real disassembly 0006f56c-0006f594, identical instruction pattern); re-applied
             for the same reason (see that comment). */
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c14c - (iVar7 >> 1 & 0xffffU),
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          iVar7 = (int)DAT_0023c138 + (int)DAT_0023c140;
          if (iVar7 < 0) {
            iVar7 = iVar7 + 1;
          }
          rect_fill_or_save_restore((int)(short)DAT_0023c148,(int)DAT_0023c140 + (uint)DAT_0023c14c,
                       DAT_0023c148 + DAT_0023c144,(uint)DAT_0023c14c + (iVar7 >> 1) & 0xffff);
          bitmap_blit_to_framebuffer((int)(short)DAT_0023c148,(int)(short)DAT_0023c14c,uVar3,(int)DAT_0023c140,
                       DAT_0023c144,0,0,1);
          DAT_0023c208 = 0;
        }
      }
    }
    draw_sprite_by_id(DAT_0023c208 + 0x20b8,0x110,4,1,1);
    draw_sprite_by_id(DAT_0023c208 + 0x20b0,0x110,0x7a,1,1);
    cursor_show_idle_tick();
    goto LAB_0006f6c8;
  }
  if (DAT_0023c208 == '\x02') {
    DAT_0023c208 = bVar2;
    decode_gr_entry_to_buffer(s_panels_00087260,3,DAT_0023cca4);
    decrement_cursor_hide_depth();
    set_draw_color(0xf1);
    rect_fill_or_save_restore(0xec,8,0x13f,0x7a);
    draw_sprite_by_id(0x20bc,0x110,4,1,1);
    draw_sprite_by_id(0x20b4,0x110,0x7a,1,1);
    bitmap_blit_to_framebuffer(0x114,0xfffb,uVar3,0x78,3,0,0,1);
LAB_0006f008:
    cursor_show_idle_tick();
  }
  else {
    if (DAT_0023c208 == '\x05') {
      DAT_0023c208 = bVar2;
      decode_gr_entry_to_buffer(s_panels_00087260,(int)DAT_0023c134,DAT_0023cca4);
      decrement_cursor_hide_depth();
      set_draw_color(0xf1);
      rect_fill_or_save_restore(0x114,5,0x117,0x7d);
      uVar1 = g_active_hud_panel;
      g_active_hud_panel = (undefined1)DAT_0023c134;
      screen_backup_restore_rect(0xec,8,0x13f,0x7a);
      bitmap_blit_to_framebuffer(0xec,8,uVar3,0x72,0x53,0,0,1);
      (*(code *)(&g_hud_panel_handlers)[DAT_0023c134])();
      screen_backup_save();
      g_active_hud_panel = uVar1;
      draw_sprite_by_id(0x20b8,0x110,4,1,1);
      draw_sprite_by_id(0x20b0,0x110,0x7a,1,1);
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xec,8,0x13e,0x79);
      goto LAB_0006f008;
    }
    bVar10 = DAT_0023c208 == '\a';
    DAT_0023c208 = bVar2;
    if (bVar10) {
      DAT_0023c208 = 0;
    }
  }
  screen_backup_restore_rect(0xec,8,0x13f,0x7a);
LAB_0006f6c8:
  return DAT_0023c208 == 0;
}






// was FUN_0006f6e0 -- draws one stage of the HUD panel-flip's squashed- panel visual: looks up this
// stage's squash amount from the curve table u_dgijjjigd_G__000871e0...
void squash_hud_panel_flip_rows(char *src, char *dst, short stage)
{
  /* Were `undefined4` -- truncated the real 64-bit source/dest pointers (already fixed to real
     pointers at advance_hud_panel_flip's call sites) back down to 32 bits on entry. Same
     pointer-truncation class as everywhere else this session. */
  short sVar1;
  wchar_t wVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  /* Not decompiled -- QA: "the panel should fully squish horizontally during the flip, ours just
     crops part of it". */
  int squashAccum;
  int squashSrcCol;

  sVar6 = DAT_0023c144;
  iVar8 = (int)stage;
  iVar11 = (int)DAT_0023c144;
  wVar2 = u_dgijjjigd_G__000871e0[iVar8 + 8];
  sVar3 = ordint_divmod(100,iVar11 * wVar2).quot;
  sVar1 = DAT_0023c140;
  iVar9 = (int)sVar3;
  iVar10 = (int)DAT_0023c140;
  DAT_0023c13c = sVar3;
  sVar4 = ordint_divmod(100,u_dgijjjigd_G__000871e0[iVar8] * iVar10).quot;
  sVar5 = ordint_divmod((int)wVar2,100).quot;
  if (sVar5 == 1) {
    sVar3 = (short)(sVar6 - iVar9);
    sVar6 = ordint_divmod(((sVar6 - iVar9) * 0x10000 >> 0x10) + 1,iVar11).quot;
    sVar6 = sVar6 + -1;
  }
  else {
    sVar6 = 1;
  }
  squashAccum = 0;
  squashSrcCol = 0;
  iVar11 = 0;
  if (iVar8 < 4) {
    iVar8 = (iVar10 - sVar4) * 0x10000 >> 0x10;
    iVar7 = iVar9 + ((iVar10 - sVar4) * 0x10000 >> 0x10);
    DAT_0023c110 = 0;
    iVar10 = iVar9 + iVar8 * 2;
    DAT_0023c138 = sVar4;
    if (0 < sVar3) {
      do {
        if (0 < sVar6) {
          iVar9 = 0;
          do {
            sVar1 = (short)iVar10;
            if (sVar1 < 1) {
              DAT_0023c110 = DAT_0023c110 + 1;
              DAT_0023c138 = DAT_0023c138 + -2;
              iVar10 = iVar7 * 2 + (int)sVar1;
            }
            else {
              iVar10 = (int)(short)(iVar8 << 1) + (int)sVar1;
            }
            /* Was `copy_hud_panel_flip_column();` -- dropped arguments. Real disassembly
               (0006f884-0006f8a4) shows src/dst passed in as-is, then both incremented by 1
               byte afterward -- confirmed identical at all 3 call sites in this function. */
            copy_hud_panel_flip_column(src,dst);
            /* Not decompiled -- squash accumulator, see this
               function's own comment near its locals. */
            squashAccum = squashAccum + (int)DAT_0023c144;
            src = src + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
            squashSrcCol = squashAccum / (int)DAT_0023c13c;
            dst = dst + 1;
            iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
          } while (iVar9 < sVar6);
          iVar9 = (int)DAT_0023c13c;
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 * 0x10000 >> 0x10 < (int)sVar3);
    }
  }
  else {
    DAT_0023c138 = sVar1 * 2 - sVar4;
    iVar8 = (sVar4 - iVar10) * 0x10000;
    iVar7 = iVar8 >> 0x10;
    DAT_0023c110 = (short)((uint)iVar8 >> 0x10);
    iVar8 = ((sVar4 - iVar10) * 0x10000 >> 0x10) - iVar9;
    iVar10 = iVar7 * 2 - iVar9;
    if (0 < sVar3) {
      do {
        if (0 < sVar6) {
          iVar9 = 0;
          do {
            sVar1 = (short)iVar10;
            if (sVar1 < 0) {
              iVar10 = (int)(short)(iVar7 << 1) + (int)sVar1;
            }
            else {
              DAT_0023c110 = DAT_0023c110 + -1;
              DAT_0023c138 = DAT_0023c138 + 2;
              iVar10 = iVar8 * 2 + (int)sVar1;
            }
            /* Was `copy_hud_panel_flip_column();` -- same dropped-argument bug as
               the sibling branch above (real disassembly
               0006f96c-0006f988). */
            copy_hud_panel_flip_column(src,dst);
            /* Not decompiled -- squash accumulator, see this
               function's own comment near its locals. */
            squashAccum = squashAccum + (int)DAT_0023c144;
            src = src + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
            squashSrcCol = squashAccum / (int)DAT_0023c13c;
            dst = dst + 1;
            iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
          } while (iVar9 < sVar6);
          iVar9 = (int)DAT_0023c13c;
        }
        iVar11 = iVar11 + 1;
      } while (iVar11 * 0x10000 >> 0x10 < (int)sVar3);
    }
  }
  for (iVar9 = iVar9 - (int)sVar3 * (int)sVar6; iVar9 = iVar9 * 0x10000 >> 0x10, 0 < iVar9;
      iVar9 = iVar9 + -1) {
    /* Was `copy_hud_panel_flip_column();` -- same dropped-argument bug (real
       disassembly 0006f9ec-0006fa0c: leftover-rows loop). */
    copy_hud_panel_flip_column(src,dst);
    /* Not decompiled -- squash accumulator, see this function's own
       comment near its locals. */
    squashAccum = squashAccum + (int)DAT_0023c144;
    src = src + (squashAccum / (int)DAT_0023c13c - squashSrcCol);
    squashSrcCol = squashAccum / (int)DAT_0023c13c;
    dst = dst + 1;
  }
  DAT_0023c138 = sVar4;
}



// was FUN_0006fa28 -- copies one column of the HUD panel-flip's squashed panel content from a
// source column (param_1) into a destination column (param_2)...
void copy_hud_panel_flip_column(byte *src, byte *dst)
{
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short sVar7;

  sVar7 = DAT_0023c138 - DAT_0023c140;
  if (0 < DAT_0023c110) {
    iVar3 = 0;
    do {
      *dst = 0;
      dst = dst + DAT_0023c13c;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < DAT_0023c110);
  }
  sVar2 = DAT_0023c140;
  iVar3 = (int)sVar7;
  if (iVar3 == 0) {
    if (0 < DAT_0023c140) {
      iVar3 = 0;
      do {
        *dst = *src;
        dst = dst + DAT_0023c13c;
        src = src + DAT_0023c144;
        iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
      } while (iVar3 < DAT_0023c140);
    }
    sVar2 = 0;
  }
  else if (iVar3 < 1) {
    sVar2 = ordint_divmod(iVar3 + -1,(int)DAT_0023c140).quot;
    iVar6 = 0;
    if (iVar3 < 0) {
      iVar4 = (sVar2 + 1) * 0x10000 >> 0x10;
      sVar1 = DAT_0023c144;
      do {
        if (iVar4 < 0) {
          iVar5 = 0;
          do {
            *dst = *src;
            iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
            dst = dst + DAT_0023c13c;
            src = src + DAT_0023c144;
            sVar1 = DAT_0023c144;
          } while (iVar4 < iVar5);
        }
        iVar6 = iVar6 + -1;
        src = src + sVar1;
      } while (iVar3 < iVar6 * 0x10000 >> 0x10);
    }
    sVar2 = (DAT_0023c138 - sVar7 * (short)(sVar2 + 1)) + -1;
  }
  else {
    /* Was `ordint_divmod(iVar3 + 1)` -- missing its dividend argument. */
    sVar1 = ordint_divmod(iVar3 + 1,(int)DAT_0023c140).quot;
    iVar6 = 0;
    if (0 < iVar3) {
      do {
        if (0 < sVar1) {
          iVar4 = 0;
          do {
            *dst = *src;
            dst = dst + DAT_0023c13c;
            src = src + DAT_0023c144;
            iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
          } while (iVar4 < sVar1);
        }
        iVar6 = iVar6 + 1;
        *dst = *src;
        dst = dst + DAT_0023c13c;
        sVar2 = DAT_0023c140;
      } while (iVar6 * 0x10000 >> 0x10 < iVar3);
    }
    sVar2 = sVar2 - sVar7 * sVar1;
  }
  for (iVar3 = (int)sVar2; 0 < iVar3; iVar3 = (iVar3 + -1) * 0x10000 >> 0x10) {
    *dst = *src;
    dst = dst + DAT_0023c13c;
    src = src + DAT_0023c144;
  }
  if (0 < DAT_0023c110) {
    iVar3 = 0;
    do {
      *dst = 0;
      dst = dst + DAT_0023c13c;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    } while (iVar3 < DAT_0023c110);
  }
  *dst = 0;
}





// was FUN_00075be0 -- allocates and zero-initializes the HUD sprite- list compositor's 3 backing
// buffers: DAT_0023c3e8...
int init_sprite_list_buffers()

{
  DAT_0023c3e8 = ce_malloc(0x514);
  if (DAT_0023c3e8 != 0) {
    ce_memset(DAT_0023c3e8,0,0x514);
    DAT_0023c3ec = DAT_0023c3e8 + 0x500;
  }
  DAT_0023c40c = ce_malloc(0x102);
  if (DAT_0023c40c != 0) {
    ce_memset(DAT_0023c40c,0,0x102);
    DAT_0023c414 = (ushort *)(DAT_0023c40c + 0x100);
  }
  DAT_0023c3e4 = ce_malloc(0x102);
  if (DAT_0023c3e4 != 0) {
    ce_memset(DAT_0023c3e4,0,0x102);
    DAT_0023c410 = DAT_0023c40c + 0x100;
  }
  return 0;
}



// was FUN_00076488 -- clears a HUD sprite-list slot's status-word flags (masked by DAT_0023c418)
// and queues it for redraw, but only if the slot's status word currently has DAT_0008763c set (a
// "valid/active" bit); a no-op otherwise, or for an out-of-range slot index (>= 0x40).
int clear_sprite_list_slot_flag(int slot)
{
  ushort uVar1;
  ushort *puVar2;
  
  if ((short)slot < 0x40) {
    puVar2 = (ushort *)((short)slot * 0x14 + DAT_0023c3e8);
    if ((*puVar2 & DAT_0008763c) == 0) {
      return 0;
    }
    uVar1 = DAT_0023c418 & *puVar2;
    *(char *)puVar2 = (char)uVar1;
    *(char *)((char *)puVar2 + 1) = (char)(uVar1 >> 8);
    sprite_list_queue_slot_redraw(slot);
  }
  return 0xffffffff;
}



// was FUN_00076508 -- the HUD sprite-list compositor's per-call flush/draw pass, gated on
// DAT_0023c41c (skips entirely if not dirty).
void flush_sprite_list_compositor()

{
  ushort uVar1;
  bool bVar2;
  ushort *puVar3;
  ushort *puVar4;
  ushort uVar5;
  ushort *puVar6;
  ushort *puVar7;
  
  bVar2 = false;
  if (DAT_0023c41c != 0) {
    decrement_cursor_hide_depth();
    puVar7 = DAT_0023c414 + -0x20;
    puVar6 = (ushort *)DAT_0023c40c;
    if ((ushort *)DAT_0023c40c < puVar7) {
      do {
        puVar4 = puVar7;
        for (uVar5 = *puVar7; uVar5 != 0; uVar5 = uVar5 - 1) {
          puVar4 = puVar4 + 1;
          puVar6 = (ushort *)((uint)*puVar4 * 0x14 + DAT_0023c3e8);
          if ((*puVar6 & DAT_00087640) == 0) {
            restore_captured_grtile_backdrop(*(undefined4 *)(puVar6 + 8));
          }
          else {
            uVar1 = DAT_0023c408 & *puVar6;
            *(char *)puVar6 = (char)uVar1;
            *(char *)((char *)puVar6 + 1) = (char)(uVar1 >> 8);
          }
          if ((*puVar6 & DAT_00087644) != 0) {
            uVar1 = DAT_0023c3f0 & *puVar6;
            *(char *)puVar6 = (char)uVar1;
            *(char *)((char *)puVar6 + 1) = (char)(uVar1 >> 8);
            if (CONCAT13(*(undefined1 *)((char *)puVar6 + 0x13),
                         CONCAT12((char)puVar6[9],
                                  (ushort)puVar6[8])) !=
                0) {
              /* Ghidra dropped the arg here (relying on register carryover from the
                 CONCAT-reconstructed nonzero check just above) -- same class of bug fixed
                 throughout this session. */
              invalidate_grtile_by_key(*(undefined4 *)(puVar6 + 8));
            }
          }
          puVar6 = (ushort *)DAT_0023c40c;
        }
        puVar7 = puVar7 + -0x20;
      } while (puVar6 < puVar7);
    }
    if (puVar6 < DAT_0023c414) {
      do {
        puVar7 = puVar6 + 1;
        if (bVar2) {
          puVar4 = puVar7;
          for (uVar5 = *puVar6; uVar5 != 0; uVar5 = uVar5 - 1) {
            puVar3 = (ushort *)((uint)*puVar4 * 0x14 + DAT_0023c3e8);
            if ((*puVar3 & DAT_0008763c) == 0) {
              uVar1 = *puVar3 | DAT_00087640;
              *(char *)puVar3 = (char)uVar1;
              *(char *)((char *)puVar3 + 1) = (char)(uVar1 >> 8);
            }
            else {
              capture_framebuffer_rect_to_grtile(*(undefined4 *)(puVar3 + 8),(int)(short)puVar3[1],(int)(short)puVar3[2],
                           (int)(short)puVar3[3],puVar3[4]);
            }
            puVar4 = puVar4 + 1;
          }
        }
        uVar5 = *puVar6;
        if (uVar5 != 0) {
          for (; uVar5 != 0; uVar5 = uVar5 - 1) {
            puVar4 = (ushort *)((uint)*puVar7 * 0x14 + DAT_0023c3e8);
            uVar1 = *puVar4;
            if ((uVar1 & DAT_0008763c) != 0) {
              /* --diag-sprlist: one line per sprite the HUD sprite-list compositor draws -- id / x
                 / y / w / h -- handy for filling in the still-zero compass/dragon layout tables
                 (see the FIXME[hud-*-layout] blocks). */
              if (g_opts.diag_sprlist)
                fprintf(stderr, "[sprlist] slot=%u id=0x%x x=%d y=%d w=%d h=%d path=%s\n",
                        (unsigned)*puVar7, (unsigned)(short)puVar4[7],
                        (int)(short)(ushort)puVar4[1],
                        (int)(short)(ushort)puVar4[2],
                        (int)(ushort)puVar4[3], (int)(ushort)puVar4[4],
                        puVar4[5] == 0 ? "draw_sprite_by_id" : "sprite_list_flush_blit_raw");
              if (puVar4[5] == 0) {
                g_blit_transparent_mode = 1;
                if ((uVar1 & DAT_00087648) == 0) {
                  draw_sprite_by_id((int)(short)puVar4[7],
                               (int)(ushort)puVar4[1],
                               (int)(ushort)puVar4[2],
                               (int)(ushort)puVar4[4],
                               puVar4[3]);
                }
                else {
                  draw_sprite_by_id((int)(short)puVar4[7],
                               (int)(ushort)puVar4[1],
                               (int)(ushort)puVar4[2],
                               (int)(ushort)puVar4[4],
                               puVar4[3]);
                }
              }
              else {
                g_blit_transparent_mode = 1;
                if ((uVar1 & DAT_00087648) == 0) {
                  sprite_list_flush_blit_raw((int)(short)puVar4[7],
                               (int)(ushort)puVar4[1],
                               (int)(ushort)puVar4[2],
                               (int)(short)puVar4[4],
                               (ushort)puVar4[3],puVar4[5])
                  ;
                }
                else {
                  sprite_list_flush_blit_raw((int)(short)puVar4[7],
                               (int)(ushort)puVar4[1],
                               (int)(ushort)puVar4[2],
                               (int)(short)puVar4[4],
                               (ushort)puVar4[3],puVar4[5])
                  ;
                }
              }
              g_blit_transparent_mode = 0;
            }
            puVar7 = puVar7 + 1;
          }
          *puVar6 = 0;
        }
        bVar2 = true;
        puVar6 = puVar6 + 0x20;
      } while (puVar6 < DAT_0023c414);
    }
    cursor_show_idle_tick();
    DAT_0023c41c = 0;
  }
  return;
}


/* was FUN_0007e998 -- Not decompiled -- confirmed a genuine dead stub in the real binary too
   (disassembly at 0x0007e998 is just `cpy pc,lr`, 4 bytes, no body). */
void capture_framebuffer_rect_to_grtile_paletted(unsigned char *out_pixels, int x, int y, int width, int height)
{
  int row;
  int col;
  int i;
  unsigned short *pal565;
  unsigned short src_pixel;
  unsigned short pal_pixel;
  int dr;
  int dg;
  int db;
  int dist;
  int best_index;
  int best_dist;
  short *fb_row;

  pal565 = (unsigned short *)g_palette_rgb565_backing;
  for (row = 0; row < height; row++) {
    fb_row = (short *)((char *)g_uw_framebuffer + ((y + row) * 0x140 + x) * 2);
    for (col = 0; col < width; col++) {
      src_pixel = (unsigned short)fb_row[col];
      best_index = 0;
      best_dist = 0x7fffffff;
      for (i = 0; i < 256; i++) {
        pal_pixel = pal565[i];
        dr = (int)((src_pixel >> 11) & 0x1f) - (int)((pal_pixel >> 11) & 0x1f);
        dg = (int)((src_pixel >> 5) & 0x3f) - (int)((pal_pixel >> 5) & 0x3f);
        db = (int)(src_pixel & 0x1f) - (int)(pal_pixel & 0x1f);
        dist = dr * dr + dg * dg + db * db;
        if (dist < best_dist) {
          best_dist = dist;
          best_index = i;
          if (dist == 0) break;
        }
      }
      out_pixels[row * width + col] = (unsigned char)best_index;
    }
  }
}





// was FUN_0007f044 -- one-time message-scroll-panel setup, called once from src/hud.c's game init:
// points the shared panel-state pointer (DAT_00250704) at g_msg_scroll_panel_state, selects mode 0,
// and initializes+draws the panel's geometry/border.
void init_msg_scroll_panel()

{
  DAT_00250704 = &g_msg_scroll_panel_state;
  DAT_00250714 = 0;
  msg_scroll_panel_init(0xf,0xa9,0x131,200,0);
  msg_scroll_draw_edges();
  return;
}



// was FUN_0007f094 -- checks whether the mouse cursor is currently over the active message-scroll
// panel's rect (via is_position_within_rect, not yet named -- a point-in-rect hit test with a
// cursor-size margin, confirmed by its own body testing g_mouse_x/g_mouse_y)...
void check_mouse_over_msg_scroll_panel()

{
  DAT_00250708 = is_position_within_rect((int)DAT_00250704[2],(int)DAT_00250704[1],(int)DAT_00250704[3],
                              (int)*DAT_00250704);
  return;
}



// was FUN_0007f0e0 -- selects the message-scroll panel's "normal" mode (id 0): points the shared
// state pointer at g_msg_scroll_panel_state and sets the dirty/needs-redraw flag (DAT_0025071c).
void select_msg_scroll_mode_normal()

{
  DAT_00250714 = 0;
  DAT_0025071c = 1;
  DAT_00250704 = &g_msg_scroll_panel_state;
  return;
}



// was FUN_0007f110 -- selects the message-scroll panel's "NPC conversation" mode (id 1, confirmed
// by a pre-existing comment on g_msg_scroll_panel_state_conv's own declaration): points the shared
// state pointer at the separate conversation-mode panel struct and sets the dirty flag.
void select_msg_scroll_mode_conversation()

{
  DAT_00250714 = 1;
  DAT_0025071c = 1;
  DAT_00250704 = &g_msg_scroll_panel_state_conv;
  return;
}



// was FUN_0007f140 -- selects message-scroll mode id 2, reusing the same underlying
// g_msg_scroll_panel_state buffer as mode 0 (select_msg_scroll_mode_normal) but under a distinct
// mode id.
void select_msg_scroll_mode_2()

{
  DAT_00250714 = 2;
  DAT_0025071c = 1;
  DAT_00250704 = &g_msg_scroll_panel_state;
  return;
}





// was FUN_0007f170 -- input-pump wait loop used by the message-scroll panel: waits for the next
// distinct input event (or, if param_1 is nonzero, until param_1 clock units elapse)...
void wait_for_click_to_continue(short use_timeout, uint timeout_units)
{
  short sVar1;
  short sVar2;
  int iVar3;
  uint uVar4;
  
  wait_for_click_release(1);
  sVar1 = next_input_event();
  iVar3 = read_realtime_clock_units();
  if (DAT_00250708 != 0 && timeout_units != 0) {
    cursor_show_idle_tick();
  }
  do {
    sVar2 = next_input_event();
    if (sVar1 != sVar2) break;
    flush_dirty_rect_to_display(1);
  } while ((use_timeout == 0) || (uVar4 = read_realtime_clock_units(), uVar4 <= (uint)(use_timeout + iVar3)));
  wait_for_click_release(1);
  check_mouse_over_msg_scroll_panel();
  if ((timeout_units & DAT_00250708) != 0) {
    decrement_cursor_hide_depth();
  }
}





// was FUN_0007f290 -- the conversation-mode counterpart to msg_scroll_draw_edges (src/hud.c calls
// this one specifically when DAT_00250704 does NOT point at g_msg_scroll_panel_state, i.e. the
// panel is in conversation/mode-2, not normal mode).
int draw_conversation_window_decoration()

{
  int iVar1;
  int iVar2;

  iVar1 = 0;
  do {
    iVar2 = iVar1 * 0x1b + 0x34;
    draw_sprite_by_id(DAT_00250728 + 0x20df,0x34,iVar2,0x1b,5);
    draw_sprite_by_id(DAT_00250728 + 0x20e5,0xdc,iVar2,0x1b,5);
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 3);
  iVar1 = (int)DAT_00250728;
  DAT_00250728 = (short)(iVar1 + 1);
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 6) {
    DAT_00250728 = 0;
  }
  return 0;
}





// was FUN_0007f6fc -- confirmed by message_scroll_print_wrapped's own pre-existing comment
// (src/hud.c) as its per-~49-char-chunk worker (one call per line in the word-wrap loop).
void msg_scroll_split_escape_segments(byte *text, int span_length)
{
  undefined1 *puVar1;
  undefined4 uVar2;
  
  while (puVar1 = (undefined1 *)ce_strchr(text + 1,0x5c), puVar1 != (undefined1 *)0x0) {
    *puVar1 = 0;
    if ((puVar1[2] != '\0') || (uVar2 = span_length, puVar1[1] == 'm')) {
      uVar2 = 1;
    }
    msg_scroll_split_newline_segments(text,uVar2);
    *puVar1 = 0x5c;
    text = puVar1;
  }
  msg_scroll_split_newline_segments(text,span_length);
}



// was FUN_0007f770 -- confirmed by pre-existing callers' comments (src/object_actions.c) as "the
// scroll's own line-break logic": only breaks its input on an embedded '\n' (ASCII 10) byte,
// calling msg_scroll_draw_wrapped_span for each resulting line.
void msg_scroll_split_newline_segments(char *text, int span_length)
{
  char cVar1;
  char *iVar2;   /* was `int` -- ce_strchr (strchr) returns a real 64-bit pointer; truncating it made `*(char
   *)(iVar2+1)` a wild deref, e.g. crashing "You see nothing." on a right-click. */

  while ((iVar2 = ce_strchr(text,10), iVar2 != 0 &&
         (cVar1 = iVar2[1], cVar1 != '\0'))) {
    iVar2[1] = 0;
    msg_scroll_draw_wrapped_span(text,1);
    text = iVar2 + 1;
    *text = cVar1;
  }
  msg_scroll_draw_wrapped_span(text,span_length);
}





// was FUN_0007fe20 -- prints the decimal string form of param_1 (via itoa_radix) to the message
// scroll, restoring the cursor to the saved column (DAT_0025070c) first. Used to echo a numeric
// answer back after a scroll-based prompt.
void echo_number_to_scroll(short number)
{
  short sVar1;
  int iVar2;
  undefined1 auStack_18 [8];

  itoa_radix((int)number,auStack_18,10);
  iVar2 = (int)DAT_0025070c;
  sVar1 = *(short *)(DAT_00250704 + 10);
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(iVar2,(int)sVar1,*(undefined2 *)(DAT_00250704 + 8),
               (uint)*(ushort *)(DAT_000879b0 + 6) + sVar1 + -1);
  sVar1 = DAT_0025070c;
  *(char *)(DAT_00250704 + 8) = (char)DAT_0025070c;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)sVar1 >> 8);
  message_scroll_print_wrapped(auStack_18);
}



// was FUN_0007fee8 -- prints "Yes" or "No" to the message scroll (param_1 nonzero == "Yes"),
// restoring the cursor to the saved column first, the same setup echo_number_to_scroll does. Used
// to echo a yes/no answer back after a scroll-based prompt.
void echo_yes_no_to_scroll(int is_yes)
{
  short sVar1;
  char *puVar2;
  int iVar3;
  
  iVar3 = (int)DAT_0025070c;
  sVar1 = *(short *)(DAT_00250704 + 10);
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  set_draw_color(0x2a);
  rect_fill_or_save_restore(iVar3,(int)sVar1,*(undefined2 *)(DAT_00250704 + 8),
               (uint)*(ushort *)(DAT_000879b0 + 6) + sVar1 + -1);
  sVar1 = DAT_0025070c;
  *(char *)(DAT_00250704 + 8) = (char)DAT_0025070c;
  *(char *)(DAT_00250704 + 9) = (char)((ushort)sVar1 >> 8);
  if (is_yes == 0) {
    puVar2 = s_No_0008799c;
  }
  else {
    puVar2 = s_Yes_000879a0;
  }
  message_scroll_print_wrapped(puVar2);
}





// was FUN_0007ffa8
int scroll_text_entry_prompt(char *prompt, char *buffer, char *dest, int allow_all_chars, short max_length)
{
  char cVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  char *pcVar6;
  int iVar7;
  undefined4 uVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  uint uVar13;
  int iVar14;
  short local_a8;
  char acStack_a1 [57];
  char local_68 [52];
  
  if (0x32 < max_length) {
    max_length = 0x32;
  }
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  if (prompt == (char *)0x0) {
    sVar3 = measure_text_width(&s_scroll_prompt_arrow_000879a8);
    sVar3 = -sVar3 - *(short *)(DAT_00250704 + 0xc);
    prompt = &s_scroll_prompt_arrow_000879a8;
  }
  else {
    sVar3 = measure_text_width(prompt);
    sVar3 = -sVar3 - *(short *)(DAT_00250704 + 0xc);
  }
  sVar2 = *(short *)(DAT_00250704 + 6);
  message_scroll_print_wrapped(prompt);
  DAT_0025070c = *(short *)(DAT_00250704 + 8);
  if (buffer == (char *)0x0) {
    uVar13 = 0;
  }
  else {
    g_scroll_control_codes_enabled = 0;
    message_scroll_print_wrapped(buffer);
    g_scroll_control_codes_enabled = 1;
    pcVar6 = buffer;
    do {
      cVar1 = *pcVar6;
      /* Preserve Ghidra's relative-copy idiom without truncating pointers. */
      pcVar6[(intptr_t)(acStack_a1 + 1) - (intptr_t)buffer] = cVar1;
      pcVar6 = pcVar6 + 1;
    } while (cVar1 != '\0');
    iVar7 = ce_strlen(buffer);
    uVar13 = iVar7 * -0x10000 >> 0x10;
  }
  sVar5 = (short)uVar13;
  uVar11 = (int)sVar5 >> 0x1f;
  acStack_a1[(((int)sVar5 ^ uVar11) - uVar11) + 1] = '\0';
  local_a8 = 3000;
  sVar4 = measure_text_width(acStack_a1 + 1);
  iVar7 = ((int)sVar4 + (int)DAT_0025070c) * 0x10000 >> 0x10;
  iVar14 = (int)*(short *)(DAT_00250704 + 10);
  decrement_cursor_hide_depth();
  wait_for_click_release(0);
  g_text_input_active = 1;
  uVar8 = next_input_event();
  sVar4 = (short)uVar8;
  do {
    iVar12 = (int)sVar4;
    if ((((iVar12 == 0xd) || (sVar5 = (short)uVar13, iVar12 == 0x1b)) || (iVar12 == 1)) ||
       ((iVar12 == 2 || (iVar12 == 3)))) {
      if (1999 < local_a8) {
        set_draw_color(0x2a);
        rect_fill_or_save_restore(iVar7,iVar14,iVar7 + 4,(uint)*(ushort *)(DAT_000879b0 + 6) + iVar14 + -1);
        uVar13 = ce_strlen(acStack_a1 + 1);
        if ((uint)(int)sVar5 < uVar13) {
          draw_text_string(acStack_a1 + 1,(int)DAT_0025070c,(int)*(short *)(DAT_00250704 + 10));
        }
      }
      cursor_show_idle_tick();
      if ((short)uVar8 == 0x1b) {
        intptr_t dest_offset = (intptr_t)dest - (intptr_t)buffer;
        do {
          cVar1 = *buffer;
          buffer[dest_offset] = cVar1;
          buffer = buffer + 1;
        } while (cVar1 != '\0');
        set_draw_color(0x2a);
        rect_fill_or_save_restore((int)DAT_0025070c,(uint)*(ushort *)(DAT_00250704 + 10),
                     *(undefined2 *)(DAT_00250704 + 6),
                     (*(ushort *)(DAT_00250704 + 10) - 1) + (uint)*(ushort *)(DAT_000879b0 + 6));
        sVar3 = DAT_0025070c;
        *(char *)(DAT_00250704 + 8) = (char)DAT_0025070c;
        *(char *)(DAT_00250704 + 9) = (char)((ushort)sVar3 >> 8);
        message_scroll_print_wrapped(&s_dash_000879a4);
      }
      else {
        pcVar6 = acStack_a1;
        do {
          pcVar6 = pcVar6 + 1;
          cVar1 = *pcVar6;
          pcVar6[(intptr_t)dest - (intptr_t)(acStack_a1 + 1)] = cVar1;
        } while (cVar1 != '\0');
        *(char *)(DAT_00250704 + 8) = (char)iVar7;
        *(char *)(DAT_00250704 + 9) = (char)((uint)iVar7 >> 8);
      }
      g_text_input_active = 0;
      return uVar8;
    }
    flush_dirty_rect_to_display(1);
    iVar7 = 0;
    do {
      cVar1 = acStack_a1[iVar7 + 1];
      local_68[iVar7] = cVar1;
      iVar7 = iVar7 + 1;
    } while (cVar1 != '\0');
    uVar11 = (uint)sVar5;
    local_68[(uVar11 ^ (int)uVar11 >> 0x1f) - ((int)uVar11 >> 0x1f)] = '\0';
    sVar5 = measure_text_width(local_68);
    iVar7 = ((int)sVar5 + (int)DAT_0025070c) * 0x10000 >> 0x10;
    if ((local_a8 < 2000) || (3999 < local_a8)) {
      if (local_a8 == 4000) {
        set_draw_color(0x2a);
        local_a8 = 0;
        rect_fill_or_save_restore(iVar7,iVar14,iVar7 + 4,(uint)*(ushort *)(DAT_000879b0 + 6) + iVar14 + -1);
        uVar9 = ce_strlen(acStack_a1 + 1);
        if (uVar11 < uVar9) {
          draw_text_string(acStack_a1 + 1,(int)DAT_0025070c,(int)*(short *)(DAT_00250704 + 10));
        }
      }
    }
    else {
      set_draw_color(*(undefined2 *)(DAT_00250704 + 0x16));
      rect_fill_or_save_restore(iVar7,iVar14,iVar7 + 4,(uint)*(ushort *)(DAT_000879b0 + 6) + iVar14 + -1);
    }
    local_a8 = local_a8 + 1;
    if (iVar12 < 0xa9) {
      if (iVar12 == 0xa8) {
LAB_00080404:
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        if ((short)uVar13 < 1) goto LAB_0008062c;
        sVar5 = (short)uVar13 + -1;
LAB_000805c0:
        uVar13 = (uint)sVar5;
        goto LAB_0008062c;
      }
      if (0x91 < iVar12) {
        if (iVar12 == 0x92) goto LAB_0008061c;
        if (iVar12 != 0x96) {
          if (iVar12 != 0xa5) goto LAB_000804d0;
LAB_000803bc:
          uVar13 = 0;
          goto LAB_0008062c;
        }
LAB_0008042c:
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        uVar9 = ce_strlen(acStack_a1 + 1);
        uVar11 = (uint)(short)uVar13;
        if ((uVar11 < uVar9) && (uVar9 = ce_strlen(acStack_a1 + 1), uVar11 < uVar9)) {
          do {
            acStack_a1[uVar11 + 1] = acStack_a1[uVar11 + 2];
            uVar9 = ce_strlen(acStack_a1 + 1);
            uVar11 = (uint)(short)((uVar11 + 1) * 0x10000 >> 0x10);
          } while (uVar11 < uVar9);
        }
        goto LAB_0008062c;
      }
      if (iVar12 == 0x91) goto LAB_000805f0;
      if (iVar12 != -1) {
        if (iVar12 != 8) {
          if (iVar12 == 0x8c) goto LAB_000803bc;
          if (iVar12 != 0x8f) goto LAB_000804d0;
          goto LAB_00080404;
        }
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        uVar11 = (uint)(short)uVar13;
        if ((int)uVar11 < 1) goto LAB_0008062c;
        uVar9 = ce_strlen(acStack_a1 + 1);
        if (uVar11 <= uVar9) {
          do {
            acStack_a1[uVar11] = acStack_a1[uVar11 + 1];
            uVar9 = ce_strlen(acStack_a1 + 1);
            uVar11 = (uint)(short)((uVar11 + 1) * 0x10000 >> 0x10);
          } while (uVar11 <= uVar9);
        }
        sVar5 = (short)uVar13 + -1;
        goto LAB_000805c0;
      }
    }
    else {
      if (iVar12 < 0x165) {
        if (iVar12 == 0x164) goto LAB_0008042c;
        if (iVar12 != 0xa9) {
          if (iVar12 != 0xaa) {
            if (iVar12 == 0x161) goto LAB_000803bc;
            if (iVar12 != 0x162) goto LAB_000804d0;
            goto LAB_00080404;
          }
          goto LAB_0008061c;
        }
LAB_000805f0:
        if ((int)uVar11 < 0) {
          uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
        }
        uVar11 = ce_strlen(acStack_a1 + 1);
        sVar5 = (short)uVar13;
        if ((uint)(int)sVar5 < uVar11) {
LAB_000805bc:
          sVar5 = sVar5 + 1;
          goto LAB_000805c0;
        }
      }
      else if (iVar12 == 0x165) {
LAB_0008061c:
        uVar13 = ce_strlen(acStack_a1 + 1);
        uVar13 = uVar13 & 0xffff;
      }
      else {
        if (iVar12 == 0x166) goto LAB_000805f0;
        if (iVar12 == 0x16b) {
          if ((int)uVar11 < 0) {
            uVar13 = (int)(uVar11 * -0x10000) >> 0x10;
          }
          acStack_a1[(short)uVar13 + 1] = '\0';
        }
        else {
LAB_000804d0:
          if ((int)uVar11 < 0) {
            acStack_a1[1] = 0;
            uVar13 = 0;
          }
          if (((((iVar12 != -1) && (iVar10 = _isctype(iVar12,0x157), iVar10 != 0)) &&
               (sVar5 = measure_text_width(acStack_a1 + 1), sVar5 < (short)(sVar3 + -0x14 + sVar2))) &&
              (uVar11 = ce_strlen(acStack_a1 + 1), uVar11 < (uint)(int)max_length)) &&
             ((allow_all_chars != 0 || (iVar12 = _isctype(iVar12,4), iVar12 != 0)))) {
            sVar5 = ce_strlen(acStack_a1 + 1);
            iVar12 = (int)sVar5;
            acStack_a1[iVar12 + 2] = '\0';
            sVar5 = (short)uVar13;
            for (; sVar5 < iVar12; iVar12 = (iVar12 + -1) * 0x10000 >> 0x10) {
              acStack_a1[iVar12 + 1] = acStack_a1[iVar12];
            }
            acStack_a1[sVar5 + 1] = (char)uVar8;
            goto LAB_000805bc;
          }
        }
      }
LAB_0008062c:
      set_draw_color(0x2a);
      rect_fill_or_save_restore((int)DAT_0025070c,*(short *)(DAT_00250704 + 10),*(undefined2 *)(DAT_00250704 + 6)
                   ,*(short *)(DAT_000879b0 + 6) + *(short *)(DAT_00250704 + 10));
      *g_draw_color_index = *(undefined1 *)(DAT_00250704 + 0x16);
      draw_text_string(acStack_a1 + 1,(int)DAT_0025070c,(int)*(short *)(DAT_00250704 + 10));
    }
    sVar5 = (short)uVar13;
    uVar8 = next_input_event();
    sVar4 = (short)uVar8;
  } while( true );
}





// was FUN_00080828 -- interactive yes/no scroll prompt: prints the question (either param_1
// directly, or print_scroll_message_by_id on param_2 when param_1 is 0), echoes the current default
// answer (*param_3) as "Yes"/"No", then loops on input...
int prompt_yes_no_scroll(int question_text, int message_id, int *result)
{
  short sVar1;
  undefined *puVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = *result;
  select_msg_scroll_mode_normal();
  *g_draw_color_index = (char)*(undefined2 *)(DAT_00250704 + 0x16);
  if (question_text == 0) {
    print_scroll_message_by_id(message_id);
  }
  else {
    message_scroll_print_wrapped((char *)(intptr_t)(question_text));
  }
  DAT_0025070c = *(undefined2 *)(DAT_00250704 + 8);
  if (*result == 0) {
    puVar2 = s_No_0008799c;
  }
  else {
    puVar2 = s_Yes_000879a0;
  }
  message_scroll_print_wrapped(puVar2);
  decrement_cursor_hide_depth();
  wait_for_click_release(0);
  while( true ) {
    uVar3 = next_input_event();
    sVar1 = (short)uVar3;
    if ((((sVar1 == 0xd) || (sVar1 == 0x1b)) || (sVar1 == 1)) || ((sVar1 == 2 || (sVar1 == 3)))) {
      cursor_show_idle_tick();
      if (sVar1 == 0x1b) {
        echo_yes_no_to_scroll(0);
        *result = 0;
        uVar3 = 0xffffffff;
      }
      else {
        *result = iVar5;
      }
      return uVar3;
    }
    flush_dirty_rect_to_display(1);
    if (sVar1 == 0x4e) break;
    if (sVar1 == 0x59) goto LAB_0008090c;
    if (sVar1 == 0x6e) break;
    if (sVar1 == 0x79) {
LAB_0008090c:
      iVar4 = 1;
LAB_00080918:
      if (iVar4 != iVar5) {
        echo_yes_no_to_scroll(iVar4);
        iVar5 = iVar4;
      }
    }
  }
  iVar4 = 0;
  goto LAB_00080918;
}





// was FUN_0003df28 -- click handler for the stats-panel name/portrait click region (registered
// below in register_stats_panel_click_regions at (0x7a,0x97,0x98,0x88)).
void print_character_description_scroll()

{
  int uw_ord2005_rem_111 = 0;
  short sVar1;
  short sVar2;
  int iVar3;
  short extraout_r1;
  
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  sVar1 = ordint_divmod(0x1e,*(undefined1 *)(DAT_00086df8 + 0x39)).quot;
  print_scroll_message_concat(0x40,sVar1 + 0x68,0x67);
  sVar1 = ordint_divmod(0x17,*(undefined1 *)(DAT_00086df8 + 0x3a)).quot;
  iVar3 = (int)sVar1;
  if (5 < iVar3) {
    iVar3 = 5;
  }
  print_scroll_message_by_id(0x76 - iVar3);
  message_scroll_print_wrapped(&DAT_00084f20);
  print_scroll_message_concat(0x41,DAT_00201b68 + 0x19a,0x42);
  sVar1 = orduint_divmod(0x1c2000,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  sVar2 = ordint_divmod(0xc,(int)sVar1).quot;
  uw_ord2005_rem_111 = ((int)((int)sVar1)) % (0xc);
  if (sVar2 < 0x65) {
    print_scroll_message_concat(0x43,sVar2 + 0x19b,0x44);
  }
  else {
    print_scroll_message_by_id(0x45);
  }
  print_scroll_message_concat(0x46,uw_ord2005_rem_111 + 0x47,0x53);
  wait_for_click_release(1);
  return;
}



// was FUN_0003e0b4 -- click handler for the stats-panel flask click region (registered below at
// (0xf4,0x9c,0x135,0x78); own debug label already says "[flask]").
void show_flask_value_tooltip()

{
  char cVar1;
  short sVar2;
  char *pcVar3;
  char *pcVar4;
  undefined1 auStack_a4 [16];
  undefined1 auStack_94 [16];
  char local_84 [120];

  sVar2 = *DAT_00085a6c;
  if ((sVar2 < 0x1a) || (0x27 < sVar2)) {
    if (DAT_00085a6c[1] < 0x1f) {
      pcVar3 = (char *)get_message_string((int)(short)(ushort)(0x1e < sVar2) + 0x59U | 0x200);
      pcVar4 = local_84;
      do {
        cVar1 = *pcVar3;
        pcVar3 = pcVar3 + 1;
        *pcVar4 = cVar1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      if (*DAT_00085a6c < 0x1e) {
        itoa_radix(g_player_object->npc_hp,auStack_94,10);
        itoa_radix(*(undefined1 *)(DAT_0023be74 + 4),auStack_a4,10);
        if ((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) != 0) {
          sVar2 = ordint_divmod(3,(*(byte *)(DAT_00086df8 + 0x5f) >> 2 & 0xf) - 1).quot;
          print_scroll_message_concat(0x5b,sVar2 + 0x54,0x5c);
        }
      }
      else {
        itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x37),auStack_94,10);
        itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x38),auStack_a4,10);
      }
      ce_strcat(local_84,auStack_94);
      ce_strcat(local_84,s_out_of_000858dc);
      ce_strcat(local_84,auStack_a4);
      ce_strcat(local_84,&s_scroll_newline_0008522c);
      message_scroll_print_wrapped(local_84);
      wait_for_click_release(1);
    }
  }
  else if (0xd < DAT_00085a6c[1]) {
    toggle_stats_panel(0);
  }
  return;
}



// was FUN_0003e2a4 -- registers the stats panel's click regions: the cursor-mode button (normal and
// restricted variants), the two still-unnamed widget handlers
// handle_cast_spell_click/handle_light_source_click...
void register_stats_panel_click_regions()

{
  DAT_000868d8 = 0;
  DAT_00202090 = register_click_region(8,0x74,0x20,0xfffffffa,0xffff,1,cursor_mode_button_click);
  DAT_00202090 = register_click_region(8,0x74,0x20,0xfffffffa,0xffff,4,cursor_mode_button_click_restricted);
  DAT_002020c8 = register_click_region(0xb0,0x9b,0xde,0x8b,0,1,handle_cast_spell_click);
  DAT_002020bc = register_click_region(0x34,0x99,0x66,0x89,0,1,handle_light_source_click);
  DAT_0020209c = register_click_region(0x7a,0x97,0x98,0x88,0,1,print_character_description_scroll);
  DAT_002020b4 = register_click_region(0xf4,0x9c,0x135,0x78,0,1,show_flask_value_tooltip);
  return;
}



// was FUN_0003e404 -- unwinds register_stats_panel_click_regions'
// four non-cursor-mode regions.
void unregister_stats_panel_click_regions()

{
  unregister_key_binding((int)DAT_002020c8);
  unregister_key_binding((int)DAT_002020bc);
  unregister_key_binding((int)DAT_002020b4);
  unregister_key_binding((int)DAT_0020209c);
  return;
}



// was FUN_0003e644 -- skips the refresh unless the compass/main view is active (g_active_hud_panel
// == 0) or the stats-panel sub-view index (DAT_00085a6c+8) is 4 (the equipment/paperdoll
// sub-view)...
void refresh_equipment_display_if_visible()

{
  if ((g_active_hud_panel != '\0') && (*(short *)(DAT_00085a6c + 8) != 4)) {
    return;
  }
  reload_paperdoll_body_sprite();
  redraw_armor_overlay_widgets();
  redraw_container_icon_slot();
  return;
}


// was FUN_00044814 -- clears the player's rune-bag bitset (the 8-byte
// field at DAT_00086df8+0x44, the same bits place_rune_in_bag sets),
// emptying the bag of every rune.
void clear_rune_bag_contents()

{
  int iVar1;

  iVar1 = 0;
  do {
    *(undefined1 *)(iVar1 + DAT_00086df8 + 0x44) = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 8);
  return;
}



// was FUN_00044848 -- draws a single rune's icon (param_1, a rune
// index 0-0x17) at its grid position in the rune-bag panel.
void draw_rune_icon(uint rune_index)
{
  int iVar1;
  int iVar2;

  decrement_cursor_hide_depth();
  iVar1 = ((int)(short)rune_index >> 2) * 0xf;
  iVar2 = (rune_index & 3) * 0x12;
  draw_sprite_by_id(rune_index + 0xe8,iVar2 + 0xf4,iVar1 + 0xd,iVar2 + 0x101,(short)iVar1 + 4);
  cursor_show_idle_tick();
}



// was FUN_000448a8 -- the rune-bag panel's redraw callback (used alongside
// refresh_equipment_display_if_visible/draw_stats_panel_content in the stats-panel redraw dispatch
// table): draws every rune currently set in the bag's bitset via draw_rune_icon.
void redraw_rune_bag_display()

{
  uint uVar1;

  decrement_cursor_hide_depth();
  uVar1 = 0;
  do {
    if ((*(byte *)(DAT_00086df8 + ((int)uVar1 >> 3) + 0x44) >> (7 - (uVar1 & 7) & 0xff) & 1) != 0) {
      g_blit_transparent_mode = 1;
      draw_rune_icon(uVar1);
      g_blit_transparent_mode = 0;
    }
    uVar1 = (int)((uVar1 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar1 < 0x18);
  cursor_show_idle_tick();
  return;
}



// was FUN_00044920 -- clears the player's 3 "readied rune" slots
// (DAT_00086df8+0x47/+0x48/+0x49, 0x18 = "empty") and a matching flag
// field, then refreshes their icons via update_ready_rune_slot_icons.
void reset_ready_rune_slots()

{
  uint uVar1;

  *(undefined1 *)(DAT_00086df8 + 0x47) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x48) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x49) = 0x18;
  uVar1 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xf3ff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar1 >> 8);
  update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
  return;
}


// was FUN_0004497c -- the rune-bag panel's click handler (dispatched from
// inventory_panel_click_region's g_active_hud_panel==1 case, src/inventory.c:81): maps the click
// position to a rune-grid cell, and if that rune is present in the bag...
void handle_rune_bag_click()

{
  ushort uVar1;
  byte bVar2;
  short *psVar3;
  short sVar4;
  short sVar5;
  int iVar6;
  /* Was two separately-declared locals, `ushort local_20[3]` immediately followed by `undefined2
     local_1a` -- Ghidra's own offset naming (-0x20, then -0x1a, exactly 6 bytes later) confirms the
     real ARM stack frame packs them contiguously, and the real code below relies on that... */
  undefined1 local_20_backing[8];
#define local_20 ((ushort *)(local_20_backing + 0))
#define local_1a (*(undefined2 *)(local_20_backing + 6))

  psVar3 = DAT_00085a6c;
  if (g_cursor_holding_state == 0) {
    if (DAT_00085a6c[1] < 0x12) {
      reset_ready_rune_slots();
    }
    else {
      sVar4 = ordint_divmod(0xf,DAT_00085a6c[1] + -0x12).quot;
      sVar5 = ordint_divmod(0x12,*psVar3 + -3).quot;
      iVar6 = (5 - sVar4) * 4 + (int)sVar5;
      if ((*(byte *)(DAT_00086df8 + (iVar6 * 0x10000 >> 0x13) + 0x44) >>
           (7 - (iVar6 * 0x10000 >> 0x10 & 7U) & 0xff) & 1) != 0) {
        if ((psVar3[3] & 2U) == 0) {
          if (DAT_002028d0 != 0) {
            reset_ready_rune_slots();
          }
          DAT_002028d0 = 0;
          if ((*(byte *)(DAT_00086df8 + 0x60) & 0xc) == 0xc) {
            *(undefined1 *)(DAT_00086df8 + 0x47) = *(undefined1 *)(DAT_00086df8 + 0x48);
            *(undefined1 *)(DAT_00086df8 + 0x48) = *(undefined1 *)(DAT_00086df8 + 0x49);
            uVar1 = *(ushort *)(DAT_00086df8 + 0x5f);
            bVar2 = (byte)(uVar1 >> 8);
            *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
            *(byte *)(DAT_00086df8 + 0x60) =
                 ((byte)(((uVar1 & 0xfc00) - 1) >> 8) ^ bVar2) & 0xc ^ bVar2;
          }
          *(char *)((*(byte *)(DAT_00086df8 + 0x60) >> 2 & 3) + DAT_00086df8 + 0x47) = (char)iVar6;
          uVar1 = *(ushort *)(DAT_00086df8 + 0x5f);
          bVar2 = (byte)(uVar1 >> 8);
          *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
          *(byte *)(DAT_00086df8 + 0x60) =
               ((byte)(((uVar1 & 0xfc00) + 0x400) >> 8) ^ bVar2) & 0xc ^ bVar2;
          update_ready_rune_slot_icons(DAT_00086df8 + 0x47);
        }
        else {
          local_20[0] = ((short)iVar6 + 0xe8U ^ local_20[0]) & 0x1ff ^ local_20[0];
          local_1a = 0;
          dispatch_object_action_dup(local_20,0);
        }
      }
    }
    wait_for_click_release(1);
  }
  return;
}
#undef local_20
#undef local_1a



// was FUN_00044bcc -- prints the "Not a spell" scroll message.
void print_not_a_spell_message()

{
  message_scroll_print_wrapped(s_Not_a_spell_00085a80);
  return;
}


// was FUN_00044bd8 -- light-source icon click handler on the stats panel: a normal click cycles the
// active light source (cycle_active_light_source, not yet named) and refreshes equipment effects on
// a change...
void handle_light_source_click()

{
  byte bVar1;
  int iVar2;
  short local_10;
  byte abStack_e [6];

  if ((g_cursor_holding_state < 1) || (3 < g_cursor_holding_state)) {
    iVar2 = 2 - ((int)*DAT_00085a6c >> 4);
    local_10 = (short)iVar2;
    if (iVar2 * 0x10000 >> 0x10 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf)) {
      if ((DAT_00085a6c[3] & 2U) == 0) {
        iVar2 = cycle_active_light_source(&local_10);
        if (iVar2 != 0) {
          refresh_player_equipment_effects();
        }
      }
      else {
        compute_light_source_colors(abStack_e);
        message_scroll_print_wrapped(get_message_string(abStack_e[local_10] + 0x180 | 0xc00));
        bVar1 = *(byte *)(DAT_00086df8 + local_10 * 2 + 0x3f);
        if (bVar1 < 3) {
          iVar2 = 0;
        }
        else {
          iVar2 = 1;
          if (10 < bVar1) {
            iVar2 = 2;
          }
        }
        print_scroll_message_by_id(iVar2 + 0x89);
      }
      wait_for_click_release(1);
    }
  }
  return;
}



// was FUN_00044d14 -- the "cast spell" button click handler (registered in
// register_stats_panel_click_regions at (0xb0,0x9b), also bound as a key binding in
// run_game_startup_sequence)...
void handle_cast_spell_click(short click_state)
{
  int iVar1;

  if (g_cursor_holding_state == 0) {
    if (((*(ushort *)((byte *)DAT_00085a6c + 6) & 2) == 0) || (click_state != 0)) {
      DAT_002028d0 = 1;
      if (*(uint *)(DAT_00086df8 + 0xce) < (uint)DAT_002028d4 + DAT_002028d8) {
        play_sound_effect_with_pan(0x15,0x40,0);
      }
      else {
        wait_for_click_release(1);
        iVar1 = 0;
        do {
          if ((ushort)((ushort)*(byte *)(DAT_00086df8 + 0x49) +
                      ((ushort)*(byte *)(DAT_00086df8 + 0x48) +
                      (ushort)*(byte *)(DAT_00086df8 + 0x47) * 0x20) * 0x20) ==
              *(short *)(&DAT_00087531 + iVar1 * 4)) break;
          iVar1 = (iVar1 + 1) * 0x1000000 >> 0x18;
        } while (iVar1 < 0x30);
        if ((char)iVar1 == '0') {
          print_not_a_spell_message();
        }
        else {
          /* ARM 0x44e6c passes the matched table index in r0. */
          cast_spell_from_rune_combo(iVar1);
        }
      }
    }
    else {
      wait_for_click_release(1);
    }
  }
}



// was FUN_00044e74 -- shared spell-cast-failure reporter: plays the
// fizzle sound and prints the failure-reason scroll message (param_1,
// a reason code 0-3) from cast_spell_from_rune_combo. Always returns 0.
int report_spell_cast_failure(int failure_reason)
{
  play_sound_effect_with_pan(0x16,0x40,0);
  print_scroll_message_by_id(failure_reason + 0xd2);
  return 0;
}



// WARNING: Removing unreachable block (ram,0x00044ee8)

// was FUN_00044e9c -- resolves and attempts to cast the spell matched by handle_cast_spell_click's
// rune-combo lookup: checks caster-level requirement, mana cost, rolls a casting skill check, and
// on success dispatches the actual spell effect via dispatch_special_action...
int cast_spell_from_rune_combo(uint circle_hint)
{
  byte bVar1;
  char cVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  byte bVar6;
  byte bVar7;
  
  cVar2 = ordint_divmod(6,circle_hint & 0xff).quot;
  bVar6 = cVar2 + 1;
  iVar5 = (circle_hint & 0xff) * 4;
  bVar7 = (byte)(&DAT_00087530)[iVar5] >> 3;
  if ((uint)((int)(*(byte *)(DAT_00086df8 + 0x3d) + 1) >> 1) < (uint)bVar6) {
    uVar4 = 0;
  }
  else if (!g_debug_godmode && (uint)*(byte *)(DAT_00086df8 + 0x37) < (uint)bVar6 * 3) {
    uVar4 = 1;
  }
  else {
    sVar3 = roll_skill_check(*(byte *)(DAT_00086df8 + 0x2a) + 5,(uint)bVar6 << 1);
    if (sVar3 == 0) {
      uVar4 = 2;
    }
    else {
      if (sVar3 == -1) {
        print_scroll_message_by_id(0xd6);
        bVar7 = 9;
        bVar1 = bVar6 >> 1;
      }
      else {
        bVar1 = (&DAT_00087533)[iVar5];
      }
      DAT_002028d4 = (cVar2 + '\t') * '\b' + *(char *)(DAT_00086df8 + 0x3d) * -4;
      DAT_002028d8 = *(undefined4 *)(DAT_00086df8 + 0xce);
      DAT_0023c3e0 = bVar6 * '\x03';
      if (bVar7 != 5) {
        if (!g_debug_godmode) *(byte *)(DAT_00086df8 + 0x37) = *(char *)(DAT_00086df8 + 0x37) + bVar6 * -3;
        DAT_0023c3e0 = '\0';
      }
      iVar5 = dispatch_special_action(bVar7,bVar1,g_player_object,g_player_object);
      if (iVar5 != 0) {
        play_sound_effect_with_pan(0x10,0x40,0);
        return 1;
      }
      DAT_0023c3e0 = 0;
      uVar4 = 3;
    }
  }
  uVar4 = report_spell_cast_failure(uVar4);
  return uVar4;
}


/* Debug console CASTSPELL (declared in debug_shim.h; lives here for the statics it shares with
   cast_spell_from_rune_combo). */
/* Cast spell i: the effect half of cast_spell_from_rune_combo (hud.c) -- the same power globals it
   sets, then dispatch_special_action with the spell's table entry -- skipping its level, mana and
   skill-roll checks. DAT_0023c3e0 (deferred mana cost, charged by the spawn-type spells) stays 0.
   Returns dispatch_special_action's result (nonzero = took effect). */
int dbgui_cast_spell(int i)
{
  if (i < 0 || i >= 48) return -1;
  uint type = DAT_00087530_backing[i * 4] >> 3;
  byte param = DAT_00087530_backing[i * 4 + 3];
  DAT_002028d4 = (char)((i / 6 + 9) * 8 + *(char *)(DAT_00086df8 + 0x3d) * -4);
  DAT_002028d8 = *(undefined4 *)(DAT_00086df8 + 0xce);
  DAT_0023c3e0 = 0;
  int r = dispatch_special_action(type, param, g_player_object, g_player_object);
  if (r != 0) play_sound_effect_with_pan(0x10, 0x40, 0);
  return r;
}


// was FUN_0004638c -- reloads the player's paperdoll body sprite (BODIES.GR, the frame selected by
// gender/race bits at DAT_00086df8+100) via reload_single_grtile_entry, then clears 5 bytes of the
// cached equipment-icon slot array (DAT_00202988+1..+5).

void reload_paperdoll_body_sprite()

{
  int iVar1;

  reload_single_grtile_entry(0x2091,s_bodies_00085c58,
               (*(byte *)(DAT_00086df8 + 100) >> 2 & 7) +
               (int)(short)((int)((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 10) >> 1));
  iVar1 = 1;
  do {
    *(undefined1 *)((char *)&DAT_00202988 + iVar1) = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 6);
  return;
}


// was FUN_00046414 -- one-time inventory-panel setup (guarded by DAT_002029a4), called from
// enter_dungeon_view_hud_init alongside register_stats_panel_click_regions: reloads the paperdoll
// body sprite, allocates a grtile per inventory hotspot region...
void init_inventory_panel_hotspots()

{
  undefined4 uVar1;
  undefined1 *puVar2;
  int iVar3;
  uint uVar4;
  int iVar5;

  if (DAT_002029a4 == 0) {
    DAT_002029a4 = 1;
    g_blit_transparent_mode = 1;
    reload_paperdoll_body_sprite();
    iVar5 = 6;
    do {
      uVar1 = grtile_alloc_registered((&g_inv_hotspot_dirty_w)[iVar5 * 0xe],
                           (uint)(byte)(&g_inv_hotspot_dirty_h)[iVar5 * 0xe] << 1);
      (&DAT_002028e8)[iVar5] = uVar1;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 0x17);
    DAT_002028e8 = grtile_alloc_registered(0x10,0x14);
    DAT_002028ec = grtile_alloc_registered(0x54,0x52);
    iVar5 = 6;
    do {
      /* iVar5==10/11 were hardcoded original-binary literal addresses (0x85b5c/0x85b6a, plus the
         standalone DAT_00085b64/DAT_00085b72 symbols) instead of the same
         &g_inv_hotspot_click_x1/&g_inv_hotspot_draw_x + iVar5*stride expression every other... */
      if (iVar5 == 10) {
        puVar2 = &g_inv_hotspot_click_x1 + iVar5 * 0xe;
        iVar3 = (&g_inv_hotspot_draw_x)[iVar5 * 7] + 5;
LAB_000464c8:
        uVar4 = (byte)puVar2[0xc] - 5;
      }
      else {
        if (iVar5 == 0xb) {
          puVar2 = &g_inv_hotspot_click_x1 + iVar5 * 0xe;
          iVar3 = (&g_inv_hotspot_draw_x)[iVar5 * 7];
          goto LAB_000464c8;
        }
        puVar2 = &g_inv_hotspot_click_x1 + iVar5 * 0xe;
        iVar3 = (int)(short)(&g_inv_hotspot_draw_x)[iVar5 * 7];
        uVar4 = (uint)(byte)(&g_inv_hotspot_dirty_w)[iVar5 * 0xe];
      }
      capture_framebuffer_rect_to_grtile((&DAT_002028e8)[iVar5],iVar3,(int)*(short *)(puVar2 + 10),uVar4,puVar2[0xd]);
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < 0x17);
    capture_framebuffer_rect_to_grtile(DAT_002028ec,0xec,0x51,0x54,0x29);
    capture_framebuffer_rect_to_grtile(DAT_002028e8,299,0x3b,0x10,10);
    DAT_00202998 = register_click_region(0xf0,0x76,0x13b,0xb,0,5,inventory_panel_click_region);
  }
  return;
}


// was FUN_00048110 -- redraws the bag/container icon slot on the compass-view HUD: restores its
// plain backdrop when no container is open, or draws the "open container" icon sprite when one is,
// then refreshes the equipment widget range.
void redraw_container_icon_slot()

{
  if (g_active_hud_panel == '\0') {
    DAT_00085c50 = 0xffff;
    if (g_current_container_record == 0) {
      restore_captured_grtile_backdrop(DAT_002028ec);
    }
    else {
      draw_sprite_by_id(0x2097,0xec,0x51,0x29,0x54);
    }
    redraw_inventory_widget_range(6,0x16);
  }
  return;
}



// was FUN_00048514 -- the HUD carry-weight/encumbrance display: only redraws when the
// weight-capacity-remaining value actually changed since last tick (tracked via DAT_00085c50),
// restoring the flask-slot backdrop and drawing the remaining-capacity percentage as text.
bool update_carry_weight_display(int force)
{
  int iVar1;
  short sVar2;
  undefined4 uVar3;
  int iVar4;
  bool bVar5;
  undefined1 auStack_24 [8];
  
  bVar5 = false;
  iVar4 = ((int)g_player_max_carry_weight - (int)g_player_carry_weight) * 0x10000;
  iVar1 = iVar4 >> 0x10;
  if (DAT_00085c50 != iVar1) {
    restore_captured_grtile_backdrop(DAT_002028e8);
    DAT_00085c50 = (short)((uint)iVar4 >> 0x10);
    bVar5 = force != 0;
    *g_draw_color_index = 0xe0;
    uVar3 = ordint_divmod(10,iVar1).quot;
    itoa_radix(uVar3,auStack_24,10);
    sVar2 = measure_text_width(auStack_24);
    iVar4 = (int)sVar2;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 1;
    }
    draw_text_string(auStack_24,0x131 - (short)(iVar4 >> 1),0x3c);
  }
  return bVar5;
}


// was FUN_0004995c -- per release_panel_wipe_grtiles's own comment, releases a grtile handle; this
// decompile's body is an empty no-op (lost-body case, not confirmed to genuinely do nothing in the
// real binary).
void release_grtile_handle()

{
  return;
}


// was FUN_000564f8 -- the pause-menu's modal event loop: on a fresh open (param_1 != 0)
// clears/redraws the panel and waits for click release; then loops reading input events...
void run_pause_menu_modal_loop(short fresh_open)
{
  short sVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  short local_c;
  short local_a;

  /* This loop waits inside an input handler; show its redraws immediately
     instead of deferring them until the surrounding gameplay tick ends. */
  uw_begin_modal_present();
  DAT_000868d8 = 1;
  if (fresh_open != 0) {
    decrement_cursor_hide_depth();
    enter_pause_menu_state(6);
    cursor_show_idle_tick();
    wait_for_click_release(0);
  }
  DAT_002046f8 = 0;
  do {
    while( true ) {
      sVar1 = next_input_event();
      if (-1 < sVar1) break;
      advance_menu_music_track();
      flush_dirty_rect_to_display(1);
    }
    if (sVar1 < 0x8e) {
      if (sVar1 == 0x8d) {
LAB_00056638:
        uVar2 = 2;
        goto LAB_000565a4;
      }
      if (0 < sVar1) {
        if (sVar1 < 4) {
          get_mouse_position(&local_c,&local_a);
          iVar3 = (int)local_c;
          iVar4 = (int)local_a;
          local_c = (short)(iVar3 + -4);
          local_a = (short)(0x76 - iVar4);
          iVar3 = (iVar3 + -4) * 0x10000 >> 0x10;
          if ((-1 < iVar3) && (iVar3 < 0x24)) {
            iVar3 = (0x76 - iVar4) * 0x10000 >> 0x10;
            if ((-1 < iVar3) && (iVar3 < 0x6d)) {
              /* Was called with both args dropped (same missing-argument idiom as elsewhere in this
                 file) -- handle_pause_menu_region_click only actually uses its 2nd (Y) argument... */
              handle_pause_menu_region_click(local_c, local_a);
            }
          }
        }
        else {
          if (sVar1 == 0xd) {
            uVar2 = 1;
            goto LAB_000565a4;
          }
          if (sVar1 != 0x1b) {
            bVar5 = sVar1 == 0x20;
            goto LAB_0005659c;
          }
          close_ui_panel_return_to_game();
        }
      }
    }
    else {
      if (sVar1 != 0x93) {
        if (sVar1 == 0xa6) goto LAB_00056638;
        bVar5 = sVar1 == 0xab;
LAB_0005659c:
        if (!bVar5) goto LAB_000565a8;
      }
      uVar2 = 0;
LAB_000565a4:
      handle_pause_menu_dpad_navigation(uVar2);
    }
LAB_000565a8:
    if (DAT_002046f8 != 0) {
      uw_end_modal_present();
      return;
    }
  } while( true );
}



// was FUN_00056640 -- redraws the pause-menu's main icon slot (OPTBTNS.GR tile 0x20eb) showing
// sub-panel/highlight variant param_1. Confirmed called with distinct variant indices (1,2,3,4,5)
// from each sub-panel setup function and saveload.c's save/load panel.
void redraw_pause_menu_icon(int variant)
{
  reload_single_grtile_entry(0x20eb,s_optbtns_00086954,variant);
  draw_sprite_by_id(0x20eb,4,0xb,0x6c,0x23);
}



// was FUN_00056688 -- redraws one row of the pause-menu's sub-icon
// strip (OPTBTNS.GR tile 0x20ec) at a position derived from row index
// param_1, showing highlight/content variant param_2.
void redraw_pause_submenu_icon(int row, int variant)
{
  reload_single_grtile_entry(0x20ec,s_optbtns_00086954,variant);
  draw_sprite_by_id(0x20ec,5,row * -0xf + 0x67,0xe,0x1f);
}



// was FUN_000566dc -- moves the pause-menu's sub-icon highlight: un- highlights the
// previously-highlighted row (tracked in DAT_002046f0/DAT_002046f4) via redraw_pause_submenu_icon,
// then highlights row param_1 with content param_2, recording the new state.
void update_pause_submenu_highlight(int previous_row, int new_row)
{
  if (-1 < DAT_002046f0) {
    redraw_pause_submenu_icon((int)DAT_002046f4,DAT_002046f0 + -1);
  }
  redraw_pause_submenu_icon(previous_row,new_row + 1);
  DAT_002046f0 = (short)(new_row + 1);
  DAT_002046f4 = (short)previous_row;
}



// was FUN_00056724 -- closes whatever UI panel/popup is currently open (DAT_000868d8 = 0) and
// redraws the icon-bar's "options button" background (OPTBTNS.GR), re-establishing the mode-icon
// highlight if a mode is already selected. Called on Escape and other panel-close paths.
void close_ui_panel_return_to_game()

{
  decrement_cursor_hide_depth();
  DAT_000868d8 = 0;
  DAT_000868dc = 7;
  reload_single_grtile_entry(0x20eb,s_optbtns_00086954,0);
  draw_sprite_by_id(0x20eb,4,0xb,0x6c,0x23);
  if (0 < g_cursor_mode) {
    /* Dropped argument -- same idiom as the identical bug in enter_dungeon_view_hud_init right
       above this function's sibling call (see its comment); confirmed via disassembly of 0x56724
       the same way: r0 holds g_cursor_mode... */
    mode_icon_highlight_on((int)g_cursor_mode);
  }
  DAT_002046f8 = 1;
  cursor_show_idle_tick();
  return;
}


int DAT_002046fc;
/* Were lone `undefined *` -- the real thing is a pair of function-pointer dispatch tables for the
   in-game pause menu, indexed by menu "state" (DAT_000868dc, 0..6): PTR_FUN_000868e0 is the no-arg
   "draw this state's screen" table (enter_pause_menu_state calls table[state]())... */
extern void draw_pause_menu_main_list();
extern void draw_save_load_slot_list();
extern void draw_quit_confirm_panel();
extern void draw_music_or_sound_toggle_panel();
extern void draw_detail_level_panel();
/* CORRECTED: a prior pass's inline comments here had states 2/3 swapped -- confirmed by directly
   tracing draw_music_or_sound_toggle_panel's own `DAT_000868dc == 2` branch (shows is_music_playing
   when true) and by handle_music_toggle_click (registered at index 2) calling set_music_enabled... */
static void (*const PTR_FUN_000868e0_table[8])(void) = {
  draw_save_load_slot_list,  /* 0: load slot list */
  draw_save_load_slot_list,  /* 1: save slot list */
  draw_music_or_sound_toggle_panel,  /* 2: music toggle   */
  draw_music_or_sound_toggle_panel,  /* 3: sound toggle   */
  draw_detail_level_panel,  /* 4: texture detail level */
  draw_quit_confirm_panel,  /* 5: quit confirm   */
  draw_pause_menu_main_list,  /* 6: top-level list */
  0,
};
#define PTR_FUN_000868e0 (PTR_FUN_000868e0_table[0])
static void (*const PTR_FUN_00086900_table[8])(int) = {
  handle_save_load_slot_click,  /* 0: load slot list */
  handle_save_load_slot_click,  /* 1: save slot list */
  (void (*)(int))handle_music_toggle_click,  /* 2: music toggle   */
  (void (*)(int))handle_sound_toggle_click,  /* 3: sound toggle   */
  handle_detail_level_click,  /* 4: texture detail level */
  (void (*)(int))handle_quit_confirm_click,  /* 5: quit confirm   */
  (void (*)(int))handle_pause_menu_main_list_click,  /* 6: top-level list */
  0,
};
#define PTR_FUN_00086900 (PTR_FUN_00086900_table[0])


// was FUN_000567c0 -- draws the pause menu's top-level list (state 6
// in PTR_FUN_000868e0_table): the main icon plus the first
// highlighted list row.
void draw_pause_menu_main_list()

{
  redraw_pause_menu_icon(1);
  DAT_002046f0 = 0xffff;
  update_pause_submenu_highlight(6,6);
  return;
}



// was FUN_00056838 -- draws the "quit confirm" panel (state 5).
void draw_quit_confirm_panel()

{
  redraw_pause_menu_icon(3);
  DAT_002046f0 = 0xffff;
  update_pause_submenu_highlight(3,0x3b);
  return;
}



// was FUN_00056864 -- draws the shared music/sound toggle panel (states 2 and 3): shows the music
// on/off label and state when DAT_000868dc==2, else the sound-effects on/off label and state.
void draw_music_or_sound_toggle_panel()

{
  short sVar1;
  int iVar2;
  char cVar3;
  undefined4 uVar4;
  
  redraw_pause_menu_icon(4);
  DAT_002046f0 = 0xffff;
  if (DAT_000868dc == 2) {
    uVar4 = 0x33;
    iVar2 = is_music_playing();
    cVar3 = (iVar2 == 0) + '/';
    iVar2 = is_music_playing();
  }
  else {
    uVar4 = 0x34;
    iVar2 = is_sound_effects_enabled();
    cVar3 = (iVar2 == 0) + '1';
    iVar2 = is_sound_effects_enabled();
  }
  iVar2 = (short)(ushort)(iVar2 != 0) + 3;
  redraw_pause_submenu_icon(6,cVar3);
  redraw_pause_submenu_icon(5,uVar4);
  sVar1 = 2;
  if (iVar2 * 0x10000 >> 0x10 != 3) {
    sVar1 = 0;
  }
  update_pause_submenu_highlight(iVar2,sVar1 + 0x14);
  return;
}



// was FUN_0005693c -- draws the texture detail-level panel (state 4): reads the current level from
// the high nibble of DAT_00086df8+0xb5 and draws the slider sprite at a position derived from it.
void draw_detail_level_panel()

{
  uint uVar1;

  uVar1 = (uint)(*(byte *)(DAT_00086df8 + 0xb5) >> 4);
  DAT_002046f0 = 0xffff;
  redraw_pause_menu_icon(5);
  reload_single_grtile_entry(0x20ed,s_optbtns_00086954,uVar1 + 0x35);
  draw_sprite_by_id(0x20ed,5,10,0x12,0x22);
  update_pause_submenu_highlight(4 - uVar1,(uVar1 + 0x13) * 2);
  return;
}



// was FUN_000569c0 -- click handler for the music-toggle panel
// (state 2): toggles music on/off and redraws the panel.
void handle_music_toggle_click(short row)
{
  undefined4 uVar1;

  if (row == 4) {
    uVar1 = 1;
  }
  else {
    if (row != 3) goto LAB_000569ec;
    uVar1 = 0;
  }
  set_music_enabled(uVar1);
  draw_music_or_sound_toggle_panel();
LAB_000569ec:
  if (DAT_002046fc == 0) {
    if (row == 2) {
      enter_pause_menu_state(6);
    }
  }
  else {
    close_ui_panel_return_to_game();
  }
}



// was FUN_00056a18 -- click handler for the sound-toggle panel
// (state 3): toggles sound effects on/off and redraws the panel.
void handle_sound_toggle_click(short row)
{
  undefined4 uVar1;

  if (row == 4) {
    uVar1 = 1;
  }
  else {
    if (row != 3) goto LAB_00056a44;
    uVar1 = 0;
  }
  set_sound_effects_enabled(uVar1);
  draw_music_or_sound_toggle_panel();
LAB_00056a44:
  if (DAT_002046fc == 0) {
    if (row == 2) {
      enter_pause_menu_state(6);
    }
  }
  else {
    close_ui_panel_return_to_game();
  }
}



// was FUN_00056a70 -- click handler for the texture detail-level panel (state 4): adjusts the
// detail level in DAT_00086df8+0xb5's high nibble by the clicked delta, reconfigures the
// texture-emit function pointers via configure_texture_detail_functions...
void handle_detail_level_click(int row)
{
  short sVar1;
  
  sVar1 = (short)row;
  if ((0 < sVar1) && (sVar1 < 5)) {
    row = -row;
    *(byte *)(DAT_00086df8 + 0xb5) =
         (byte)(((row + 4) * 0x10000 >> 0x10 & 0xfU) << 4) |
         *(byte *)(DAT_00086df8 + 0xb5) & 0xf;
    configure_texture_detail_functions();
    full_dungeon_redraw();
    weapon_overlay_and_full_redraw();
    reload_single_grtile_entry(0x20ed,s_optbtns_00086954,row + 0x39);
    draw_sprite_by_id(0x20ed,5,10,0x12,0x22);
    update_pause_submenu_highlight(4 - (row + 4),(row + 0x17) * 2);
  }
  if (sVar1 == 0) {
    if (DAT_002046fc == 0) {
      enter_pause_menu_state(6);
    }
    else {
      close_ui_panel_return_to_game();
    }
  }
}



// was FUN_00056b48 -- click handler for the top-level list (state 6): maps the clicked row to the
// target pause-menu state (0=save, 1=load, 2-5 the toggle/brightness/quit panels) and enters it,
// gating save/load entry on check_can_save_game/check_can_load_game.
void handle_pause_menu_main_list_click(short row)
{
  int iVar1;
  undefined4 uVar2;
  
  if (row == 0) {
    uVar2 = 5;
  }
  else {
    if (row == 1) {
      close_ui_panel_return_to_game();
      return;
    }
    if (row == 2) {
      uVar2 = 4;
    }
    else if (row == 3) {
      uVar2 = 3;
    }
    else if (row == 4) {
      uVar2 = 2;
    }
    else if (row == 5) {
      iVar1 = check_can_load_game();
      if (iVar1 == 0) {
        return;
      }
      uVar2 = 1;
    }
    else {
      if (row != 6) {
        return;
      }
      iVar1 = check_can_save_game();
      if (iVar1 == 0) {
        return;
      }
      uVar2 = 0;
    }
  }
  enter_pause_menu_state(uVar2);
}



// was FUN_00056bdc -- click handler shared by the load (state 0) and save (state 1) slot lists:
// highlights the clicked slot and dispatches to handle_save_load_menu_action, closing the panel
// afterward.
void handle_save_load_slot_click(int row)
{
  short sVar1;
  int iVar2;
  
  sVar1 = (short)row;
  iVar2 = 4;
  if ((0 < sVar1) && (sVar1 < 6)) {
    update_pause_submenu_highlight(row,(0x14 - row) * 2);
    msg_scroll_panel_reset(0);
    if (sVar1 != 1) {
      if (sVar1 != 2) {
        if (sVar1 != 3) {
          if (sVar1 != 4) {
            if (sVar1 != 5) {
              return;
            }
            iVar2 = 3;
          }
          iVar2 = iVar2 + -1;
        }
        iVar2 = iVar2 + -1;
      }
      handle_save_load_menu_action(DAT_000868dc == 1,iVar2);
      if (DAT_000868dc == 1) {
        g_cursor_mode = 0;
        unready_weapon();
      }
    }
    close_ui_panel_return_to_game();
  }
}



// was FUN_00056c88 -- click handler for the quit-confirm panel
// (state 5): row 4 confirms (requests game exit), any other closes
// the panel without action.
void handle_quit_confirm_click(short row)
{
  if (row != 3) {
    if (row != 4) {
      return;
    }
    update_pause_submenu_highlight(4,0x39);
    cursor_show_idle_tick();
    request_game_exit(0);
    decrement_cursor_hide_depth();
  }
  close_ui_panel_return_to_game();
}



// was FUN_00056cc8 -- enters pause-menu state param_1: sets
// DAT_000868dc and invokes that state's draw callback from
// PTR_FUN_000868e0_table.
void enter_pause_menu_state(short new_state)
{
  DAT_000868dc = new_state;
  if ((uint)new_state < 8 && PTR_FUN_000868e0_table[new_state] != 0) {
    PTR_FUN_000868e0_table[new_state]();
  }
}



// was FUN_00056cf8 -- dispatches a click (param_1, a row/item index)
// to the current pause-menu state's click handler in
// PTR_FUN_00086900_table.
void dispatch_pause_menu_click(int row)
{
  decrement_cursor_hide_depth();
  if ((uint)DAT_000868dc < 8 && PTR_FUN_00086900_table[DAT_000868dc] != 0) {
    PTR_FUN_00086900_table[DAT_000868dc](row);
  }
  cursor_show_idle_tick();
  wait_for_click_release(0);
}



// was FUN_00056d38 -- converts a raw click Y offset (param_2) within
// the pause-menu's button region into a row index (one of 16 rows,
// param_2/15) and dispatches it via dispatch_pause_menu_click.
void handle_pause_menu_region_click(int region, short click_y)
{
  short sVar1;

  sVar1 = ordint_divmod(0xf,(int)click_y).quot;
  dispatch_pause_menu_click((int)sVar1);
}



/* Was raw pointer arithmetic `*(char *)(DAT_000868dc * 7 + iVar2 + 0x86920)` -- 0x86920 is the
   ORIGINAL 32-bit binary's fixed load address for this table... */
static const unsigned char g_menu_nav_highlight_table[8][7] = {
  {  0,  24,  36,  34,  32,  30,   0 },
  {  0,  24,  36,  34,  32,  30,   0 },
  {  0,   0,  26,  22,  20,   0,   0 },
  {  0,   0,  26,  22,  20,   0,   0 },
  { 28,  44,  42,  40,  38,   0,   0 },
  {  0,   0,   0,  59,  57,   0,   0 },
  { 18,  16,  14,  12,  10,   8,   6 },
  {  0,   0,   0, 111, 112, 116,  98 },
};

// was FUN_00056d6c -- D-pad/hotkey navigation for the pause menu: param_1 0/2 move the row
// highlight up/down (consulting g_menu_nav_highlight_table for the current state), 1/0x164 select
// the current row...
void handle_pause_menu_dpad_navigation(short key_code)
{
  short sVar1;
  int iVar2;
  int iVar3;

  if (key_code < 0x167) {
    if (key_code == 0x166) {
      iVar2 = 3;
    }
    else {
      if (key_code == 0) {
        sVar1 = -1;
LAB_00056ddc:
        iVar3 = (int)DAT_002046f4;
        iVar2 = (iVar3 + sVar1) * 0x10000 >> 0x10;
        if (iVar2 < 0) {
          return;
        }
        if (6 < iVar2) {
          return;
        }
        if (g_menu_nav_highlight_table[(unsigned)DAT_000868dc & 7][iVar2] == 0) {
          return;
        }
        decrement_cursor_hide_depth();
        update_pause_submenu_highlight(iVar3 + sVar1,(int)g_menu_nav_highlight_table[(unsigned)DAT_000868dc & 7][iVar2]);
        cursor_show_idle_tick();
        return;
      }
      if (key_code == 1) {
        iVar2 = (int)DAT_002046f4;
      }
      else {
        if (key_code == 2) {
          sVar1 = 1;
          goto LAB_00056ddc;
        }
        if (key_code != 0x164) {
          return;
        }
        iVar2 = 2;
      }
    }
  }
  else if (key_code == 0x16d) {
    iVar2 = 4;
  }
  else if (key_code == 0x171) {
    iVar2 = 0;
  }
  else if (key_code == 0x172) {
    iVar2 = 5;
  }
  else {
    if (key_code != 0x173) {
      return;
    }
    iVar2 = 6;
  }
  dispatch_pause_menu_click(iVar2);
}



// was FUN_00056ebc -- opens the pause menu via a bound hotkey (registered in game.c for several key
// codes): forces state 6 (top- level list) and runs the modal loop.
/* Key-binding callback: the dispatcher (input.c) calls handler(arg) with the binding's own arg
   (0x164/0x166/0x16d/0x171-0x173 as registered in game.c). ARM 0x56ebc keeps that incoming r0
   untouched and tail-feeds it to handle_pause_menu_dpad_navigation (0x56efc). Ghidra dropped it. */
void open_pause_menu_via_hotkey(short key_code)
{
  if (g_cursor_holding_state == 0) {
    DAT_002046fc = 1;
    DAT_000868dc = 6;
    handle_pause_menu_dpad_navigation(key_code);
    run_pause_menu_modal_loop(DAT_000868dc == 6);
    DAT_002046fc = 0;
  }
  else {
    print_scroll_message_by_id(0xa0);
  }
}



// was FUN_00056f28
int init_cursor_subsystem()

{
  undefined4 uVar1;
  int iVar2;
  
  DAT_00204710 = 0;
  DAT_0020470c = 0;
  DAT_00204830 = 0x13f;
  DAT_00204834 = 199;
  DAT_00204838 = DAT_0020471c + 0x35;
  DAT_0020483c = DAT_0020471c + 0x16;
  DAT_002047dc = DAT_0020471c + 0xdf;
  DAT_002047d8 = DAT_0020471c + 0x83;
  set_cursor_sprite_id(0x106c);
  DAT_000889b8 = grtile_alloc_registered(0x28,0x28);
  if (DAT_000889b8 == 0) {
    uVar1 = 0xffffffff;
  }
  else {
    iVar2 = 0;
    DAT_000889bc = DAT_000889b8;
    do {
      (&DAT_002047b0)[iVar2] = 10000;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x14);
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_00056fe8 -- erases the dragged-item cursor icon if one is currently drawn (DAT_00204844
// != 0): restores the saved background pixels under its last-drawn rect and flushes.
int erase_cursor_icon()

{
  /* Preserve the caller's click-state convention without restoring pixels. */
  if (uw_always_show_cursor()) return DAT_00204844;
  int iVar1;

  iVar1 = 0;
  if (DAT_00204844 != 0) {
    /* Bug fix ("Clicking in the inventory area stamps a yellow box there"): only actually paint a
       restore when DAT_00204848 (the rect_fill_or_save_restore save/restore sentinel -- see its own
       comment) is armed, i.e. a real save_cursor_background() SAVE is pending to restore. */
    if (DAT_00204848 != 0) {
      set_draw_color(0x15);
      rect_fill_or_save_restore(g_mouse_x - DAT_0020471c,g_mouse_y - DAT_00204748,
                 ((int)DAT_00204784 - (int)DAT_0020471c) + (int)g_mouse_x + 1,
                 ((int)DAT_002047a4 - (int)DAT_00204748) + (int)g_mouse_y + 1);
    /* REVERTED (was: force g_force_flush around this call, matching draw_idle_mouse_cursor's own
       sibling wrapping) -- caused a visible flicker regression: rect_fill_or_save_restore's own
       dirty_rect_union call already records this erase's rect unconditionally, BEFORE any gating... */
      flush_dirty_rect_to_display(1);
      DAT_00204848 = 0;
    }
    iVar1 = DAT_00204844;
  }
  return iVar1;
}



/* Desktop deviation: present the game cursor as an overlay by default.
   --always-show-cursor=0 restores the Pocket PC stylus visibility rules. */
int uw_always_show_cursor()
{
  return g_opts.always_show_cursor;
}


/* Desktop deviation: draw last, on GX's presentation copy. Never save or
   restore cursor pixels in the game framebuffer: animated views and HUD
   captures must remain cursor-free. Stylus hide depths and mode restrictions
   do not control this overlay. Reuse the real sprite decoder and palette. */
void uw_composite_desktop_cursor(void *present_buffer)
{
  if (!uw_always_show_cursor() || present_buffer == NULL ||
      DAT_00204784 <= 0 || DAT_002047a4 <= 0) return;

  void *game_buffer = g_uw_framebuffer;
  int transparent = g_blit_transparent_mode;
  undefined2 left = DAT_000a85c4, top = DAT_000a85c8;
  undefined2 right = DAT_000842a4, bottom = DAT_000842a8;
  int dirty_top = DAT_00088954, dirty_bottom = DAT_0008895c;
  int dirty_left = DAT_00088950, dirty_right = DAT_00088958;

  g_uw_framebuffer = present_buffer;
  g_blit_transparent_mode = 1;
  set_viewport_clip_rect(0,0,319,199);
  draw_sprite_by_id((int)DAT_00204788,
                   (int)g_mouse_x - (int)DAT_0020471c,
                   (int)g_mouse_y - (int)DAT_00204748,
                   (int)DAT_002047a4,(int)DAT_00204784);
  g_uw_framebuffer = game_buffer;
  g_blit_transparent_mode = transparent;
  set_viewport_clip_rect(left,top,right,bottom);
  dirty_rect_set(dirty_top,dirty_bottom,dirty_left,dirty_right);
}



// was FUN_000570b4
int cursor_show_idle_tick()

{
  int iVar1;
  
  iVar1 = (int)DAT_00204840;
  DAT_00204840 = (short)(iVar1 + 1);
  /* Desktop drawing happens at presentation, independently of this depth. */
  if ((iVar1 + 1) * 0x10000 >> 0x10 == 1) {
    if ((DAT_00204788 != 0x106c) || uw_always_show_cursor()) {
      draw_idle_mouse_cursor();
    }
  }
  if (1 < DAT_00204840) {
    DAT_00204840 = DAT_00204840 + -1;
  }
  return 0;
}




// was FUN_00057118 -- decrements the cursor hide/show nesting depth (DAT_00204840, floor-clamped at
// 0) one level, confirmed by an existing comment on clear_screen_and_restore_cursor describing this
// exact role.
void decrement_cursor_hide_depth()

{
  int iVar1;

  iVar1 = (int)DAT_00204840;
  DAT_00204840 = (short)(iVar1 + -1);
  if ((((iVar1 + -1) * 0x10000 >> 0x10 == 0) || (DAT_000bbef4 != 0)) &&
     (iVar1 = erase_cursor_icon(), iVar1 != 0)) {
    DAT_00204844 = 0;
    set_draw_color(1);
  }
  if (DAT_00204840 < 0) {
    DAT_00204840 = DAT_00204840 + 1;
  }
  return;
}


// was thunk_FUN_00057118 -- a Ghidra-generated "thunk" duplicate of decrement_cursor_hide_depth
// (identical body, a separate call site in the original binary decompiled as a second copy rather
// than a jump-thunk). Collapsed to a real call to avoid the duplication.
void decrement_cursor_hide_depth_thunk()

{
  decrement_cursor_hide_depth();
  return;
}


// was FUN_00057188 -- records the currently-tracked UI hotspot's rectangle (x,y,width,height) into
// DAT_0020479c/DAT_002047a0/ DAT_00204798/DAT_00204790, read by is_mouse_within_tracked_hotspot and
// track_hotspot_hover_state.
void set_tracked_hotspot_rect(short x, short y, short width, short height)
{
  DAT_0020479c = x;
  DAT_002047a0 = y;
  DAT_00204798 = width;
  DAT_00204790 = height;
}



// was FUN_000571c0 -- tests whether the mouse is within the tracked hotspot rect (via
// is_position_within_rect's cursor-margin-aware hit test).
int is_mouse_within_tracked_hotspot()

{
  undefined4 uVar1;

  uVar1 = is_position_within_rect((int)DAT_0020479c,(int)DAT_002047a0,
               ((int)DAT_00204798 + (int)DAT_0020479c) * 0x10000 >> 0x10,
               ((int)DAT_00204790 + (int)DAT_002047a0) * 0x10000 >> 0x10);
  return uVar1;
}



// was FUN_0005721c -- per-frame hover tracker for the tracked UI hotspot: tests the mouse against
// the rect's outer bounds and its (slightly inset) inner bounds to classify the hover state into
// DAT_00204794 (0=outside, 1=on the border, 2=inside the interior)...
void track_hotspot_hover_state()

{
  int iVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  
  iVar3 = (int)DAT_0020479c;
  iVar4 = (((int)g_mouse_x - (int)DAT_00204784) + (int)DAT_0020471c) * 0x10000 >> 0x10;
  if ((iVar4 <= iVar3 + DAT_00204798) &&
     (iVar5 = (((int)g_mouse_x - (int)DAT_0020471c) + (int)DAT_00204784) * 0x10000 >> 0x10,
     iVar3 <= iVar5)) {
    iVar6 = (((int)g_mouse_y - (int)DAT_002047a4) + (int)DAT_00204748) * 0x10000 >> 0x10;
    iVar7 = (int)DAT_002047a0;
    if ((iVar6 <= iVar7 + DAT_00204790) &&
       (iVar1 = (((int)g_mouse_y - (int)DAT_00204748) + (int)DAT_002047a4) * 0x10000 >> 0x10,
       iVar7 <= iVar1)) {
      if ((((iVar3 < iVar4) && (iVar5 < iVar3 + DAT_00204798)) && (iVar7 < iVar6)) &&
         (iVar1 < iVar7 + DAT_00204790)) {
        DAT_00204794 = 2;
      }
      else {
        DAT_00204794 = 1;
        if (*(short *)(DAT_00085a6c + 8) != 1) {
          iVar4 = (int)DAT_000a85c4;
          iVar3 = (int)DAT_000a85c8;
          iVar5 = (int)DAT_000842a4;
          iVar6 = (int)DAT_000842a8;
          set_viewport_clip_rect(0,0,0x13f,199);
          decrement_cursor_hide_depth();
          set_viewport_clip_rect(iVar4,iVar3,iVar5,iVar6);
        }
      }
      if ((DAT_00204840 == 1) && (g_selected_object == 0)) {
        draw_idle_mouse_cursor();
        return;
      }
      if (DAT_00204840 < 2) {
        if (-1 < DAT_00204840) {
          return;
        }
        sVar2 = 1;
      }
      else {
        sVar2 = -1;
      }
      DAT_00204840 = DAT_00204840 + sVar2;
      return;
    }
  }
  DAT_00204794 = 0;
  return;
}



// was FUN_00057460 -- after a frame flush, if the hover state (DAT_00204794) is "on the border" and
// not in a specific display mode, forces an idle cursor tick (cursor_show_idle_tick) within a
// full-viewport clip rect to refresh the border highlight.
void redraw_hotspot_border_cursor()

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  if ((DAT_00204794 == 1) && (*(short *)(DAT_00085a6c + 8) != 1)) {
    iVar1 = (int)DAT_000a85c4;
    iVar2 = (int)DAT_000a85c8;
    iVar3 = (int)DAT_000842a4;
    iVar4 = (int)DAT_000842a8;
    set_viewport_clip_rect(0,0,0x13f,199);
    cursor_show_idle_tick();
    set_viewport_clip_rect(iVar1,iVar2,iVar3,iVar4);
  }
  return;
}



// was FUN_00057504 -- returns the current raw mouse position.
void get_mouse_position(ushort *out_x, ushort *out_y)
{
  *out_x = g_mouse_x;
  *out_y = g_mouse_y;
}



// was FUN_00057528 -- returns the effective position for a click: the real mouse position, unless
// DAT_0020484c (a demo/scripted- input override flag) is set, in which case a fixed recorded
// position (DAT_0008696a/DAT_0008696c) is used instead.
void get_click_position(ushort *out_x, ushort *out_y)
{
  undefined2 uVar1;

  if (DAT_0020484c == 0) {
    *out_x = g_mouse_x;
    uVar1 = g_mouse_y;
  }
  else {
    *out_x = DAT_0008696a;
    uVar1 = DAT_0008696c;
  }
  *out_y = uVar1;
}


// was FUN_00057570 -- clears the pending-keyboard-char sentinel
// (DAT_00086968) back to "none pending" (-1).
void reset_keyboard_char_input()

{
  if (DAT_00086968 != -1) {
    DAT_00086968 = -1;
  }
  return;
}



// was FUN_0005758c -- confirmed genuinely empty (no body beyond `return;`). Always called
// immediately after reset_keyboard_char_input (player.c, end of a level-up sequence) -- possibly a
// vestigial hook point or focus-reset stub the original build never filled in.
void noop_post_input_reset_hook()

{
  return;
}



// was FUN_00057590 -- warps the mouse cursor to (param_1,param_2) directly, bracketed by a
// cursor-hide-depth pop/idle-tick pair. Confirmed used by automap.c to snap the cursor onto a
// map-note marker during note text entry.
void warp_mouse_cursor(short x, short y)
{
  decrement_cursor_hide_depth();
  update_hotspot_cursor_icon();
  g_mouse_x = x;
  g_mouse_y = y;
  cursor_show_idle_tick();
}



// was FUN_000575c4 -- polls for a pending keyboard character (via poll_mouse_button_flags, not yet
// named), clearing DAT_00086968's "pending" sentinel back to -1 (0xffff) when none is available,
// and recording the result in DAT_00204850.
int poll_keyboard_char_input(void *out_char_ptr)
{
  short *out_char = (short *)out_char_ptr;
  short sVar1;

  sVar1 = poll_mouse_button_flags();
  *out_char = sVar1;
  if (sVar1 == 0) {
    DAT_00086968 = 0xffff;
  }
  DAT_00204850 = *out_char;
  return (int)*out_char;
}



// was FUN_000576d0 -- a "press any key or move the mouse" modal wait: loops flushing the display
// and polling input/mouse state (optionally ticking sticky-mode handlers when param_1 is set) until
// poll_keyboard_char_input reports a key or the mouse has moved more than ~6 pixels...
int wait_for_key_or_mouse_move(int poll_mouse)
{
  uint uVar1;
  uint uVar2;
  short sVar3;
  int iVar4;
  short local_18;
  short local_16;
  short local_14;
  short local_12;
  undefined1 auStack_10 [4];
  
  iVar4 = 0;
  get_mouse_position(&local_16,&local_12);
  while( true ) {
    sVar3 = poll_keyboard_char_input(auStack_10);
    if ((sVar3 == 0) || (iVar4 != 0)) break;
    flush_dirty_rect_to_display(1);
    if (poll_mouse != 0) {
      dispatch_sticky_mode_handlers();
    }
    poll_input_event(0);
    process_pending_keyboard_scan_code(1);
    noop_key_handler();
    update_mouse_state();
    get_mouse_position(&local_18,&local_14);
    uVar1 = ((int)local_18 - (int)local_16) >> 0x1f;
    uVar2 = ((int)local_14 - (int)local_12) >> 0x1f;
    if (6 < (int)((((int)local_14 - (int)local_12 ^ uVar2) - uVar2) +
                 (((int)local_18 - (int)local_16 ^ uVar1) - uVar1))) {
      iVar4 = 1;
    }
  }
  return iVar4;
}


// was FUN_00057a80 -- looks up which on-screen-keyboard key was touched at (param_1,param_2),
// confirmed by DAT_00087650's own existing comment describing this exact [row+column*20] indexing
// scheme...
int lookup_onscreen_keyboard_key_hit(short x, short y)
{
  int iVar1;
  short sVar2;
  
  iVar1 = (int)x;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 0xf;
  }
  sVar2 = (short)(iVar1 >> 4);
  iVar1 = ordint_divmod(0x14,y + -200).quot;
  if (0 < iVar1) {
    sVar2 = (short)iVar1 * 0x14 + sVar2;
  }
  return (int)(char)(&DAT_00087650)[sVar2];
}



// was FUN_00057af0 -- registers a cursor hotspot rectangle (x1=param_1, y1=param_2, x2=param_3,
// y2=param_4, tag id=param_5) into the 20-slot DAT_002047b0 parallel-array table, returning its
// slot index or -1 if full.
int register_cursor_hotspot(short x1, short y1, short x2, short y2, short tag_id)
{
  int iVar1;
  int iVar2;
  
  iVar2 = 0;
  do {
    if ((&DAT_002047b0)[iVar2] == 10000) break;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x14);
  iVar1 = (int)(short)iVar2;
  if (iVar1 == 0x14) {
    iVar2 = -1;
  }
  else {
    (&DAT_002047b0)[iVar1] = x1;
    (&DAT_00204808)[iVar1] = x2;
    (&DAT_002047e0)[iVar1] = y2;
    (&DAT_00204750)[iVar1] = y1;
    *(undefined2 *)(&DAT_00204720 + iVar1 * 2) = tag_id;
    if (DAT_00204854 <= iVar1) {
      DAT_00204854 = (short)iVar2 + 1;
    }
    update_hotspot_cursor_icon();
  }
  return iVar2;
}



// was FUN_00057bb0 -- unregisters cursor hotspot slot param_1
// (register_cursor_hotspot's counterpart), clearing its sentinel and
// compacting the active-slot count if it was the last one.
void unregister_cursor_hotspot(short slot)
{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = (int)DAT_00204854;
  iVar1 = (int)DAT_00204854;
  iVar2 = (int)slot;
  if (iVar2 < iVar1) {
    (&DAT_002047b0)[iVar2] = 10000;
    if (*(short *)(&DAT_00204720 + iVar2 * 2) == DAT_00204788) {
      DAT_00086970 = 10000;
    }
    if (iVar2 == iVar1 + -1) {
      iVar3 = iVar3 + -2;
      iVar1 = iVar3 * 0x10000 >> 0x10;
      while ((-1 < iVar1 && ((&DAT_002047b0)[iVar1] == 10000))) {
        iVar3 = (iVar1 + -1) * 0x10000 >> 0x10;
        iVar1 = iVar3;
      }
      DAT_00204854 = (short)iVar3 + 1;
    }
    update_hotspot_cursor_icon();
  }
}



// was FUN_00057c5c -- pushes cursor sprite param_1 onto a small (max 3-deep) cursor-icon stack and
// makes it active, confirmed by its ubiquitous use alongside pop_cursor_icon across nearly every UI
// subsystem to show a context-specific cursor (e.g. a targeting reticle) temporarily.
void push_cursor_icon(int icon)
{
  int iVar1;
  
  if (DAT_00204858 != '\x03') {
    decrement_cursor_hide_depth();
    iVar1 = (int)DAT_00204858;
    DAT_00204858 = DAT_00204858 + '\x01';
    (&DAT_00204714)[iVar1] = DAT_00204704;
    set_cursor_sprite_id(icon);
    cursor_show_idle_tick();
  }
}



// was FUN_00057cac -- pops the cursor-icon stack (push_cursor_icon's counterpart), restoring the
// previous sprite (or the default 0x106c if the stack is empty). param_1's low bits optionally gate
// the cursor-hide-depth pop/idle-tick pair around the restore.
void pop_cursor_icon(ushort flags)
{
  int iVar1;
  
  if ((flags & 1) != 0) {
    decrement_cursor_hide_depth();
  }
  iVar1 = (int)DAT_00204858;
  DAT_00204858 = (char)(iVar1 + -1);
  if ((iVar1 + -1) * 0x1000000 >> 0x18 < 0) {
    DAT_00204714 = 0x106c;
    DAT_00204858 = '\0';
  }
  set_cursor_sprite_id((int)(short)(&DAT_00204714)[DAT_00204858]);
  update_hotspot_cursor_icon();
  if ((flags & 2) != 0) {
    cursor_show_idle_tick();
  }
}



// was FUN_00057d1c -- tests whether the mouse is within rect (param_1,param_2)-(param_3,param_4),
// inset by half the cursor's own dimensions on each axis (so the cursor's hotspot, not just its
// top-left corner, must overlap).
int is_position_within_rect(short x1, short y1, short x2, short y2)
{
  int iVar1;
  
  iVar1 = (int)(short)((DAT_002047a4 + 1) >> 1);
  if ((iVar1 + y1 <= (int)g_mouse_y) && ((int)g_mouse_y <= y2 - iVar1)) {
    iVar1 = (int)(short)((DAT_00204784 + 1) >> 1);
    if ((x1 - iVar1 <= (int)g_mouse_x) && ((int)g_mouse_x <= iVar1 + x2)) {
      return 1;
    }
  }
  return 0;
}



// WARNING: Removing unreachable block (ram,0x00057df0)
// WARNING: Removing unreachable block (ram,0x00057e24)

// was FUN_00057dc0 -- sets the active cursor sprite to resource id param_1, resolving it to its
// sprite frame/dimensions (lookup_grtile_by_id or a direct g_grtile_registry lookup for
// already-resident high ids).
void set_cursor_sprite_id(int sprite_id)
{
  /* Was a genuinely dropped RETURN VALUE, not just a dropped argument:
     resolve_sprite_id_to_frame(sprite_id) was called and its result thrown away, then the lookup just
     below re-used the raw, UNRESOLVED sprite_id... */
  char *iVar1;
  uint resolved_frame;

  erase_cursor_icon();
  resolved_frame = resolve_sprite_id_to_frame(sprite_id);
  /* Was unconditional `iVar1 = lookup_grtile_by_id(sprite_id);` -- lookup_grtile_by_id only covers
     ids below DAT_00202738 (the "still-compressed .GR resource entry, needs decoding" range)... */
  iVar1 = (int)resolved_frame < (int)(uint)DAT_00202738 ?
          lookup_grtile_by_id((short)resolved_frame) : (char *)g_grtile_registry[resolved_frame];
  if (iVar1 == (char *)0x0) {
    /* Same "table slot never populated" fallback as
       blit_object_sprite_by_frame's own identical guard. */
    static char dummy_sprite[8];
    iVar1 = dummy_sprite;
  }
  DAT_00204784 = (ushort)*(byte *)(iVar1 + 1);
  DAT_002047a4 = (ushort)*(byte *)(iVar1 + 2);
  DAT_00204704 = (undefined2)sprite_id;
  DAT_0020471c = ((short)(ushort)*(byte *)(iVar1 + 1) >> 1) + -1;
  DAT_00204748 = (short)(ushort)*(byte *)(iVar1 + 2) >> 1;
  /* Desktop deviation: ARM centers every icon (FUN_00057dc0), but the
     wide automap pointer (CURSORS.GR frame 12) uses its lower-left pixel
     as the mouse's map position. Keep item and targeting icons centered,
     and retain ARM's hotspot in stylus mode. */
  if (uw_always_show_cursor() && sprite_id == 0x1078) {
    DAT_0020471c = 0;
    DAT_00204748 = DAT_002047a4 > 0 ? DAT_002047a4 - 1 : 0;
  }
  DAT_00204788 = DAT_00204704;
  if (DAT_00204844 != 0) {
    save_cursor_background();
  }
  /* Desktop overlay must update during modal waits without mouse/text input. */
  if (uw_always_show_cursor()) uw_request_cursor_present();
}


// was FUN_00057e54 -- per-tick cursor-icon refresh for registered hotspots: if the mouse has left
// the cached hotspot's cached bounds, re-scans the 20-slot table (register_cursor_hotspot) for the
// one now under the cursor, updates the cache, and applies its icon via set_cursor_sprite_id...
void update_hotspot_cursor_icon()

{
  int iVar1;
  int iVar2;
  
  if ((DAT_00204858 < '\x01') &&
     ((((DAT_00086970 == -1 || (g_mouse_x < DAT_00086970)) || (DAT_002047a8 < g_mouse_x)) ||
      ((DAT_0020478c < g_mouse_y || (g_mouse_y < DAT_002047ac)))))) {
    iVar2 = 0;
    if (0 < DAT_00204854) {
      iVar2 = 0;
      do {
        if ((((short)(&DAT_002047b0)[iVar2] <= g_mouse_x) &&
            (g_mouse_x <= (short)(&DAT_00204808)[iVar2])) &&
           ((g_mouse_y <= (short)(&DAT_00204750)[iVar2] &&
            ((short)(&DAT_002047e0)[iVar2] <= g_mouse_y)))) {
          iVar1 = (int)(short)iVar2;
          DAT_00086970 = (&DAT_002047b0)[iVar1];
          DAT_002047a8 = (&DAT_00204808)[iVar1];
          DAT_0020478c = (&DAT_00204750)[iVar1];
          DAT_002047ac = (&DAT_002047e0)[iVar1];
          set_cursor_sprite_id((int)*(short *)(&DAT_00204720 + iVar1 * 2));
          break;
        }
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < DAT_00204854);
    }
    if ((DAT_00086970 != -1) && ((short)iVar2 == DAT_00204854)) {
      DAT_00086970 = -1;
      set_cursor_sprite_id(0x106c);
    }
  }
  return;
}



// was FUN_00058438 -- handles a mouse button state change: injects param_1 as a temporary
// button-state override (DAT_0020485c) while polling update_mouse_state, then records a "click
// pending" slot...
void handle_mouse_button_message(short button_state)
{
  short sVar1;

  DAT_0020485c = (int)button_state;
  update_mouse_state();
  DAT_0020485c = 0;
  /* Desktop input adaptation: the original checks the touch-held flag DAT_0023c63c here. SDL
     right-button pickup instead uses DAT_002506ab; checking only touch marks the drag released on a
     dungeon redraw. */
  sVar1 = poll_mouse_button_flags();
  if (sVar1 == 0) {
    DAT_0008696e = 0;
  }
  else if (DAT_00086968 == -1) {
    DAT_00086968 = sVar1;
    DAT_0008696a = g_mouse_x;
    DAT_0008696c = g_mouse_y;
  }
}



// was FUN_000584c0 -- saves the screen area under the cursor (via the color-0x14/0x15 save/restore
// convention rect_fill_or_save_restore implements, confirmed by an existing graphics.c comment
// naming this function as the one that sets DAT_00204848 for that purpose) before...
void save_cursor_background()

{
  if (uw_always_show_cursor()) return;
  DAT_00204848 = 1;
  set_draw_color(0x14);
  rect_fill_or_save_restore(g_mouse_x - DAT_0020471c,g_mouse_y - DAT_00204748,
               ((int)DAT_00204784 - (int)DAT_0020471c) + (int)g_mouse_x + 1,
               ((int)DAT_002047a4 - (int)DAT_00204748) + (int)g_mouse_y + 1);
  DAT_00204844 = 1;
  return;
}



// was FUN_0005857c
void draw_idle_mouse_cursor()

{
  /* The desktop overlay is drawn by GXEndDraw, outside game storage. */
  if (uw_always_show_cursor()) return;
  if (g_selected_object == 0) {
    /* Original stylus visibility gates; desktop mode returns above. */
    if ((DAT_0023c63c == 0) && (DAT_000bbef4 == 0)) {
      return;
    }
    if (DAT_000868dc != 7) {
      return;
    }
    if ((((ushort)DAT_00201b60 & 4) != 0) && (g_cursor_mode == 3)) {
      return;
    }
    if ((((ushort)DAT_00201b60 & 2) != 0) && (DAT_0023c63c != 0)) {
      return;
    }
    if ((((ushort)DAT_00201b60 & 0xc9) != 0)) {
      if (g_mouse_x < DAT_00204838) {
        return;
      }
      if (g_mouse_y < DAT_0020483c) {
        return;
      }
      if (DAT_002047dc < g_mouse_x) {
        return;
      }
      if (DAT_002047d8 < g_mouse_y) {
        return;
      }
    }
    if (g_cursor_mode != 0) {
      goto LAB_00058674;
    }
  }
  save_cursor_background();
LAB_00058674:
  g_blit_transparent_mode = 1;
  g_force_flush = 1;
  draw_sprite_by_id((int)DAT_00204788,((int)g_mouse_x - (int)DAT_0020471c) * 0x10000 >> 0x10,
               ((int)g_mouse_y - (int)DAT_00204748) * 0x10000 >> 0x10,(int)DAT_002047a4,
               DAT_00204784);
  flush_dirty_rect_to_display(1);
  g_blit_transparent_mode = 0;
  g_force_flush = 0;
  set_draw_color(0);
  return;
}



// was FUN_00058734 -- confirmed genuinely empty.
void noop_key_handler()

{
  return;
}



// was FUN_00058738 -- reports the effective mouse button state as a bitmask (bit0=left,
// bit1=right), confirmed by an existing input.c comment ("reports the right button as bit 1 (value
// 2)"): uses the real button flag (DAT_0023c63c) when set...
uint poll_mouse_button_flags()

{
  uint uVar1;

  uVar1 = 0;
  if ((DAT_000876c4 != 0) && (uVar1 = (uint)DAT_0023c63c, DAT_0023c63c == 0)) {
    if (DAT_002506aa != '\0') {
      uVar1 = 1;
    }
    if (DAT_002506ab != '\0') {
      uVar1 = uVar1 | 2;
    }
  }
  return uVar1;
}


// was FUN_0003def4
void toggle_stats_panel(int target_panel)
{
  undefined4 uVar1;

  if (g_active_hud_panel == '\0') {
    uVar1 = 2;
  }
  else {
    if (g_active_hud_panel == '\x04') {
      return;
    }
    uVar1 = 0;
  }
  set_hud_status_value(6,uVar1);
}


// was FUN_000577f0
void reset_cursor_confine_rect()

{
  DAT_0020483c = 0;
  DAT_00204838 = 0;
  DAT_00204710 = 0;
  DAT_0020470c = 0;
  DAT_002047dc = 0x13f;
  DAT_00204830 = 0x13f;
  DAT_002047d8 = 199;
  DAT_00204834 = 199;
  if (((ushort)DAT_00201b60 & 0xc9) != 0) {
    DAT_00204838 = DAT_0020471c + 0x35;
    DAT_002047dc = 0xdf - DAT_0020471c;
    DAT_0020483c = DAT_00204748 + 0x12;
    DAT_002047d8 = 0x87 - DAT_00204748;
  }
  return;
}


// was FUN_00057788
void set_cursor_confine_rect(short x1, short y1, short x2, short y2)
{
  DAT_00204838 = DAT_0020471c + x1 + 1;
  DAT_0020470c = DAT_00204838;
  DAT_0020483c = DAT_00204748 + y2 + 1;
  DAT_00204710 = DAT_0020483c;
  DAT_002047dc = (x2 - DAT_0020471c) + -2;
  DAT_002047d8 = (y1 - DAT_00204748) + 2;
  DAT_00204830 = DAT_002047dc;
  DAT_00204834 = DAT_002047d8;
}


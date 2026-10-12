#ifndef HEADERS_DEBUG_SHIM_H
#define HEADERS_DEBUG_SHIM_H

/* Declarations for debug_shim.c: the general debug panel's own population/inspector logic
   (populate_debug_panel and friends) plus the one-shot --dump-* dump tools that used
   to live inline in hud.c. Split out so hud.c stays focused on real HUD behavior -- none of this is
   reachable from normal gameplay. Pulls in uw.h itself so this header is self-contained. */
#include "uw.h"

/* Debug object inspector (gx_stub.c's own mouse-down handling calls this for a click inside the 3D
   viewport while the debug panel is visible) -- runs the real object pick and swaps the debug panel
   into a read-only properties view of whatever was under the cursor, or back to the normal
   subsystem-toggle panel if nothing was there. */
void dbgui_object_inspector_pick(void);
/* Populates the general debug panel (subsystem toggles, or the object inspector -- see
   dbgui_object_inspector_pick above) for the current frame; call once, right before dbgui_draw(). */
void populate_debug_panel(void);

/* Debug view (--debug-pick-view): paint the per-pixel object-pick buffer over the 3D viewport
   instead of the rendered dungeon. */
void uw_debug_blit_pick_buffer(void);
/* Debug tool (--dump-critter-sheet): systematically drive decode_critter_sprite_page across every
   (tier, direction, frame) combination for one or more critter type indices. */
void uw_debug_dump_critter_sheet_once(void);
/* Debug tool (--dump-sprite-frames / --dump-sprite-ids): dump individual sprites to standalone
   BMP files by real resource id. */
void uw_debug_dump_sprite_frames_once(void);
/* Console object commands: OBJIDS name lookup, SPAWNOBJ (returns 1 + tile), GIVEOBJ (returns slot, or
   -1 bad id / -2 backpack full / -3 no object slot free). */
void dbgui_object_name(int id, char *out, size_t n);
int dbgui_spawn_object(int id, int *tile_x, int *tile_y);
int dbgui_give_object(int id);
int dbgui_all_runes(void);
void dbgui_spell_name(int i, char *out, size_t n);
int dbgui_spell_count(void);
int dbgui_cast_spell(int i);
#endif

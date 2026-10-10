/* The general debug panel's own population/inspector logic (populate_debug_panel and friends) plus
   the one-shot --dump-* dump tools, split out of hud.c once these grew well past the
   handful of call sites main_loop_hud_flush needs -- none of this is reachable from normal
   gameplay, so it doesn't belong mixed in with the real HUD logic. */
#include "headers/debug_shim.h"
#include "headers/options.h"
#include "headers/debug_ui.h"
#include <stdio.h>
#include <stdlib.h>

/* Debug object inspector: clicking inside the 3D viewport while the
   debug panel is open (gx_stub.c's own mouse-down handling decides
   "inside the viewport" vs. "on the panel", the one other place that
   already knows the viewport's registered bounds -- the same ones
   pick_object_under_cursor's own guard checks) swaps the panel from
   subsystem toggles to a read-only properties view of whatever object
   was under the cursor. g_dbgui_inspect_tile_x/y are snapshotted once,
   at pick time (via target_in_range(0,...), the same cheap "just
   resolve DAT_002020a0/a4 from this object's own tile, skip the real
   range/line-of-sight check" call interact_default's own range check
   uses) rather than recomputed every frame the panel redraws -- by
   the time a LATER frame's redraw runs, DAT_002020a0/a4/DAT_002020b0
   could easily have been overwritten by something else's own pick
   (e.g. a real gameplay interact elsewhere), so capture while they're
   still guaranteed fresh from THIS pick. */
static ushort *g_dbgui_inspect_obj = 0;
static int g_dbgui_inspect_tile_x = 0, g_dbgui_inspect_tile_y = 0;
/* Set instead of g_dbgui_inspect_obj when the pick stencil resolved to
   a wall/floor texture rather than an object slot (see
   dbgui_object_inspector_pick's own comment) -- the raw DAT_002020ac
   pick index, resolved to a real texture id/description at display
   time by the exact same call the real "Look" feature uses
   (resolve_picked_terrain_texture, interact.c). 0 means "no texture
   pick showing" (DAT_002020ac itself is never a real pick value of 0 --
   pick_object_under_cursor only ever sets it from `byte - 0xbf` with
   the byte already checked > 0xbf). */
static int g_dbgui_inspect_tex_pick = 0;

static void dbgui_inspector_back(void) { g_dbgui_inspect_obj = 0; g_dbgui_inspect_tex_pick = 0; }

/* "locked" (door inspector rows, below) is shown as a toggle rather
   than plain text per direct request, so this tool can unlock a door
   for testing -- but there's no real "lock a door" action anywhere in
   this game to call the other way (doors only ever start locked from
   level data, never get relocked at runtime), so this is a one-way
   action: if the door is locked, run the exact same forced-unlock
   object_actions.c already has for a real "unlock" spell/effect
   (force_unlock_target_object -- temporarily maxes the pick-locks
   skill so its own internal skill-gated check always passes, same as
   a guaranteed scripted unlock); if it's already unlocked, there's
   nothing to do and this is a no-op. The row keeps showing whatever
   find_object_in_chain reports fresh next frame either way, so it
   can't drift from the object's real state. */
static void dbgui_inspector_toggle_door_lock(void)
{
  if (g_dbgui_inspect_obj != 0) force_unlock_target_object(0,0,g_dbgui_inspect_obj);
}

void dbgui_object_inspector_pick(void)
{
  ushort *obj;
  if (!dbgui_visible()) return;
  obj = pick_object_under_cursor(2);
  g_dbgui_inspect_obj = obj;
  g_dbgui_inspect_tex_pick = 0;
  if (obj != 0) {
    target_in_range(0,(char *)obj,DAT_002020b0);
    g_dbgui_inspect_tile_x = (int)(short)DAT_002020a0;
    g_dbgui_inspect_tile_y = (int)(short)DAT_002020a4;
  } else if (DAT_002020ac != 0) {
    /* No object under the cursor, but the pick stencil DID resolve to
       a wall/floor texture index (pick_object_under_cursor's own
       `(0xbf < uVar4) && (uVar4 < 0xfb)` branch) -- show that instead
       of falling back to the toggle panel. */
    g_dbgui_inspect_tex_pick = (int)DAT_002020ac;
  }
}

/* Populates the panel for the currently-inspected object -- see
   dbgui_object_inspector_pick above. Per direct request, "locked" is
   shown only for doors ((id&0x1f0)==0x140 -- the 0x140-0x14f id range
   confirmed throughout this project as the real "is a door" test, see
   e.g. doors.c/ai.c) rather than every object with a special-link
   field, and "hp" only for creatures ((id&0x1c0)==0x40, the same NPC-
   class test used throughout ai.c/combat.c). The "locked" check itself
   (find_object_in_chain(chain,0,6,2,3) -- class 6/subclass 2/id-low-
   nibble 3) is the exact same lock-record search
   force_unlock_target_object (object_actions.c) already does before
   attempting a real unlock, not a guess; "locked" is a toggle (see
   dbgui_inspector_toggle_door_lock above) so this tool can actually
   unlock the door, not just report its state. HP: current (object
   record byte +8, confirmed by npc_ai_tick's own regen check) over max
   (g_monster_max_stats_table[(id&0x3f)*0x30], the per-creature-type
   stat template load_monster_combat_stats loads from OBJECTS.DAT). */
static void populate_debug_object_inspector(ushort *obj)
{
  char line[40];
  char *name;
  int id = *obj & 0x1ff;

  dbgui_begin("Object Inspector");
  dbgui_field_button("< back", dbgui_inspector_back);
  snprintf(line, sizeof(line), "0x%03x", id);
  dbgui_field_text("id", line);
  name = get_message_string(0x800 | id);
  dbgui_field_text("type", (name != 0 && *name != 0) ? name : "(unnamed)");
  snprintf(line, sizeof(line), "(%d,%d)", g_dbgui_inspect_tile_x, g_dbgui_inspect_tile_y);
  dbgui_field_text("tile", line);
  if ((id & 0x1f0) == 0x140) {
    ushort *chain = obj + 3;
    int locked = find_object_in_chain(&chain,0,6,2,3) != 0;
    dbgui_field_toggle_action("locked", locked, dbgui_inspector_toggle_door_lock);
  }
  if ((id & 0x1c0) == 0x40) {
    int hp = *(byte *)((char *)obj + 8);
    int maxhp = g_monster_type_props[(id & 0x3f)].max_hp;
    snprintf(line, sizeof(line), "%d / %d", hp, maxhp);
    dbgui_field_text("hp", line);
  }
  dbgui_end();
}

/* Populates the panel for a picked wall/floor texture instead of an
   object -- see dbgui_object_inspector_pick's own comment on
   g_dbgui_inspect_tex_pick. resolve_picked_terrain_texture
   (interact.c) is the exact same resolution the real "Look" feature's
   describe_picked_terrain uses for the "You see ..." message; nothing
   reimplemented here. */
static void populate_debug_texture_inspector(int pick)
{
  char line[40];
  char *desc;
  int texid = resolve_picked_terrain_texture((short)pick,&desc);

  dbgui_begin("Texture Inspector");
  dbgui_field_button("< back", dbgui_inspector_back);
  snprintf(line, sizeof(line), "%d", texid);
  dbgui_field_text("id", line);
  dbgui_field_text("desc", (desc != 0 && *desc != 0) ? desc : "(none)");
  dbgui_end();
}

/* General debug panel: subsystem on/off toggles, bound directly to
   each subsystem's own global flag. Populated unconditionally, once
   per frame, from main_loop_hud_flush (hud.c) -- rather than from inside
   whatever subsystem happens to run that frame (the old per-catalog
   "Object Tuner" in models.c only populated the panel when a 3D model
   was actually on screen, and stomped it right back out the next
   frame a model wasn't drawn -- same shared-field-list conflict
   dbgui_begin's own header comment now calls out). Add a new
   subsystem toggle here, not at a second call site -- there's exactly
   one field list live at a time. */
/* Which of the panel's three distinct layouts populate_debug_panel
   drew last frame (0=toggle panel, 1=object inspector, 2=texture
   inspector), so a switch between them can be detected -- see its own
   dbgui_invalidate_region() call below for why. -1 means "none yet /
   panel was just (re)opened", so the very first frame after an open
   never spuriously invalidates (dbgui_toggle's own open-time save
   already started the backing clean for that case). */
static int g_dbgui_last_kind = -1;

void populate_debug_panel(void)
{
  /* Closing the panel (backtick) should always land back on the base
     toggle panel next time it opens, not wherever the inspector was
     left -- without this, g_dbgui_inspect_obj/tex_pick just sit set
     across a close/reopen (populate_debug_panel runs every tick
     regardless of visibility; only dbgui_draw's own paint is gated on
     it), so reopening silently resumed the same inspector view. */
  if (!dbgui_visible()) {
    g_dbgui_inspect_obj = 0;
    g_dbgui_inspect_tex_pick = 0;
    g_dbgui_last_kind = -1;
    return;
  }
  int kind = (g_dbgui_inspect_obj != 0) ? 1 : (g_dbgui_inspect_tex_pick != 0) ? 2 : 0;
  /* Switching which of the three layouts is showing, while the panel
     stays open (object inspector -> back to the toggle panel, a pick
     swapping straight from one inspector to the other, ...), can shrink
     or reshape the panel. Put the real pixels back and re-arm the save
     before the new layout draws, rather than trusting the new layout's
     own fill call to correctly cover whatever the old one left behind
     -- confirmed live this depends on redraw/flush ordering this module
     doesn't fully control (stale "3d_objects"/"npc_tick"/"pick_diag"
     row content survived on screen after an inspector's own "< back"
     click despite the fill itself covering the right rect). */
  if (g_dbgui_last_kind != -1 && g_dbgui_last_kind != kind) {
    dbgui_invalidate_region();
  }
  g_dbgui_last_kind = kind;
  if (g_dbgui_inspect_obj != 0) {
    populate_debug_object_inspector(g_dbgui_inspect_obj);
    return;
  }
  if (g_dbgui_inspect_tex_pick != 0) {
    populate_debug_texture_inspector(g_dbgui_inspect_tex_pick);
    return;
  }
  dbgui_begin("Debug Panel");
  dbgui_field_button("console", dbgui_console_open);
  dbgui_field_toggle("hide_walls", &g_uw_hide_walls);
  if (g_uw_3d_objects_enabled < 0) g_uw_3d_objects_enabled = (!g_opts.disable_3d_objects);
  /* Field names kept short (DBGUI_PANEL_W, debug_ui.c, is a fixed 140
     logical px, sized for the panel's small top-left corner of free
     screen real estate -- a longer name runs into neighboring HUD
     chrome, confirmed by eye). */
  dbgui_field_toggle("3d_objects", &g_uw_3d_objects_enabled);
  dbgui_field_toggle("npc_tick", &g_npc_tick_enabled);
  dbgui_field_toggle("pick_diag", &g_uw_debug_pick_diag);
  dbgui_field_toggle("pick_view", &g_opts.debug_pick_view);
  dbgui_end();
}

/* Debug view (--debug-pick-view): paint the per-pixel object-pick buffer DAT_0023cca0 over the 3D
   viewport instead of the rendered dungeon, so the pick/stencil coverage is directly visible. Call
   *after* a pick-mode render pass (render_dungeon_view_frame) has populated the buffer. */
void uw_debug_blit_pick_buffer(void)
{
  /* 16 distinct colours for object slot ids; deliberately excludes the
     crosshair yellow (0xFFE0) and the out-of-range magenta (0xF81F). */
  static const unsigned short obj_pal[16] = {
    0xF800, 0x07E0, 0x001F, 0x07FF, 0xFC00, 0xFD20, 0x8400, 0x0410,
    0x001A, 0x8010, 0xAFE5, 0x05FF, 0xF7B0, 0x7BEF, 0xFAE0, 0x39C7,
  };
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int x, y;
  if (fb == 0 || DAT_0023cca0 == 0) return;
  for (y = 19; y < 150; y++) {
    const unsigned char *row = (const unsigned char *)DAT_0023cca0 + y * 0x140;
    unsigned short *frow = fb + y * 0x140;
    for (x = 52; x < 276; x++) {
      unsigned int v = row[x];
      unsigned short c;
      if (v == 0)                 c = 0x0008;                 /* near-black blue */
      else if (v >= 0xc0 && v < 0xfb) {
        unsigned int g = ((v - 0xbf) * 5) & 0x3f;             /* 0..0x3f grey ramp */
        c = (unsigned short)(((g >> 1) << 11) | (g << 5) | (g >> 1));
      }
      else if (v < 0xc0)          c = obj_pal[v & 0xf];
      else                        c = 0xF81F;                 /* magenta: out of range */
      frow[x] = c;
    }
  }
  /* cursor crosshair */
  { int cx = (int)g_mouse_x, cy = (int)g_mouse_y, i;
    for (i = -4; i <= 4; i++) {
      int px = cx + i, py = cy + i;
      if (cy >= 0 && cy < 240 && cx + i >= 0 && cx + i < 320) fb[cy * 0x140 + px] = 0xFFE0;
      if (cx >= 0 && cx < 320 && cy + i >= 0 && cy + i < 240) fb[py * 0x140 + cx] = 0xFFE0;
    }
  }
}

/* Debug tool (--dump-sprite-frames / --dump-sprite-ids): dump individual sprites to standalone
   BMP files by real resource id, one file per id, using the game's own real render path... */
static void _uw_dump_sprite_to_file(int is_frame, int id, const char *dir) {
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int cw = 96, ch = 128, ox = 4, oy = 4;
  if (fb == 0) return;
  for (int y = 0; y < ch; y++) {
    for (int x = 0; x < cw; x++) {
      fb[(oy + y) * 0x140 + (ox + x)] = 0;
    }
  }
  if (is_frame) {
    blit_object_sprite_by_frame(id, ox, oy, cw, ch);  /* real arity is 5 (ARM draw_sprite_by_id passes id,x,y,w,h) */
  } else {
    draw_sprite_by_id(id, ox, oy, cw, ch);
  }
  char path[320];
  snprintf(path, sizeof(path), "%s/%s_%d.bmp", dir, is_frame ? "frame" : "id", id);
  uw_save_rgb565_region_bmp(path, fb + oy * 0x140 + ox, cw, ch, 0x140);
}

static void _uw_dump_sprite_ids_from_spec(const char *spec, int is_frame, const char *dir) {
  if (!spec || !spec[0]) return;
  uw_debug_mkdir_p(dir);
  const char *p = spec;
  while (*p) {
    int lo, hi;
    char *end;
    lo = (int)strtol(p, &end, 10);
    if (end == p) break;
    p = end;
    if (*p == '-') {
      p++;
      hi = (int)strtol(p, &end, 10);
      if (end == p) hi = lo;
      p = end;
    } else {
      hi = lo;
    }
    for (int id = lo; id <= hi; id++) {
      _uw_dump_sprite_to_file(is_frame, id, dir);
    }
    if (*p == ',') p++;
    else break;
  }
}

void uw_debug_dump_sprite_frames_once(void) {
  static int done = 0;
  if (done) return;
  done = 1;
  if (!g_opts.dump_sprite_frames && !g_opts.dump_sprite_ids) return;
  const char *dir = g_opts.dump_sprite_dir;
  if (!dir || !dir[0]) dir = "debug/sprites";
  _uw_dump_sprite_ids_from_spec(g_opts.dump_sprite_frames, 1, dir);
  _uw_dump_sprite_ids_from_spec(g_opts.dump_sprite_ids, 0, dir);
}

/* Debug tool (--dump-critter-sheet): systematically drive decode_critter_sprite_page across every
   (tier, direction, frame) combination for one or more critter type indices, instead of passively
   capturing whatever poses a demo happens to render. */
void uw_debug_dump_critter_sheet_once(void) {
  static int done = 0;
  if (done) return;
  done = 1;
  const char *spec = g_opts.dump_critter_sheet;
  if (!spec || !spec[0]) return;
  /* default maxdir kept conservative (63, not the full 0-255 clamp resolve_critter_sprite_tier
     allows): sweeping direction values past a creature's real per-page table found a separate,
     unfixed bug... */
  int maxdir = g_opts.dump_critter_sheet_maxdir, maxframe = g_opts.dump_critter_sheet_maxframe;
  const char *p = spec;
  while (*p) {
    char *end;
    long type_idx = strtol(p, &end, 10);
    if (end == p) break;
    p = end;
    if (type_idx >= 0 && type_idx < 64) {
      int page_idx = (unsigned char)(&DAT_0023ce70)[type_idx * 2];
      int frame_count_param = (unsigned char)(&DAT_0023ce71)[type_idx * 2];
      if (page_idx == 0xff) {
        fprintf(stderr, "[crit-sheet] type_idx=%ld has no assoc-table entry (0xff sentinel), skipping\n",
                type_idx);
      } else {
        fprintf(stderr, "[crit-sheet] type_idx=%ld -> page_idx=%d frame_count_param=%d, sweeping "
                "tier=0..3 dir=0..%d frame=0..%d\n",
                type_idx, page_idx, frame_count_param, maxdir, maxframe);
        for (int tier = 0; tier < 4; tier++) {
          for (int dir = 0; dir <= maxdir; dir++) {
            for (int frame = 0; frame <= maxframe; frame++) {
              decode_critter_sprite_page(page_idx, tier, dir, frame_count_param, frame);
            }
          }
        }
      }
    }
    if (*p == ',') p++;
    else break;
  }
  fprintf(stderr, "[crit-sheet] sweep complete, see debug/crit/\n");
}

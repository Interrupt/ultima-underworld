/* The general debug panel's own population/inspector logic (populate_debug_panel and friends) plus
   the one-shot --dump-* dump tools, split out of hud.c once these grew well past the
   handful of call sites main_loop_hud_flush needs -- none of this is reachable from normal
   gameplay, so it doesn't belong mixed in with the real HUD logic. */
#include "headers/debug_shim.h"
#include "headers/options.h"
#include "headers/debug_ui.h"
#include "headers/ai.h"
#include "headers/tmap.h"
#include "headers/text.h"
#include "headers/automap.h"
#include "headers/player.h"
#include "headers/platform_music.h"
#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

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

/* "locked" (door inspector rows, below) is a toggle so this tool can lock/unlock a door for testing;
   the row re-reads the real lock state every frame, so it can't drift. */
/* A door's lock is the id 0x10f object (class 4 / subclass 0 / low nibble 0xf -- the same lookup
   check_object_combination uses) on the door's link chain; the door is locked while that lock's
   type-word bit 0x200 is set (a matching key sets it, check_object_combination, and a count-0
   "is it locked" probe only returns 0 for it). */
static ushort *dbgui_door_lock_object(ushort *door)
{
  ushort *chain = door + 3;
  if ((*door & 0x8000) != 0 || (*chain & 0xffc0) == 0) return 0;
  return (ushort *)find_object_in_chain(&chain,0,4,0,0xf);
}

/* Opens the inspected door whether or not it is locked -- the lock is only ever consulted by the
   player's Use path, never by the door open itself. close_door_object is the routine that acts on a
   door whose id state (low nibble) is < 8 -- the ids every door has in the level data -- and runs the
   real open animation (its name is the original's, which reads the opposite way round). Does nothing
   for a door that is already open. */
static void dbgui_inspector_open_door(void)
{
  if (g_dbgui_inspect_obj == 0) return;
  close_door_object(0, g_dbgui_inspect_obj);
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
    ushort *lock = dbgui_door_lock_object(obj);
    int locked = lock != 0 && (*lock & 0x200) != 0;
    dbgui_field_text("locked", locked ? "yes" : "no");
    dbgui_field_text("state", (id & 0xf) < 8 ? "closed" : "open");
    dbgui_field_button("open door", dbgui_inspector_open_door);
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
/* The surface lighting modes the panel steps through (--light-mode names). */
static const char *const k_light_modes[] = { "smooth", "linear", "dos" };

static int current_light_mode_index(void)
{
  const char *m = g_opts.light_mode;
  if (m && strcasecmp(m, "dos") == 0) return 2;
  if (m && strcasecmp(m, "linear") == 0) return 1;
  return 0;
}

/* An int option edited from the panel: apply the panel's value when it changed it, otherwise follow
   the option (the console and command line can change it too). */
static void panel_option_int(const char *name, int step, int *opt, void (*after)(void))
{
  static struct { const char *name; int ui, applied; } st[4];
  int i = 0;
  while (i < 3 && st[i].name && strcmp(st[i].name, name) != 0) i++;
  if (!st[i].name) { st[i].name = name; st[i].applied = -1; }
  if (st[i].applied >= 0 && st[i].ui != st[i].applied) {
    *opt = st[i].ui < 0 ? 0 : st[i].ui > 100 ? 100 : st[i].ui;
    if (after) after();
  }
  st[i].ui = st[i].applied = *opt;
  dbgui_field_int(name, &st[i].ui, step);
}

enum { PANEL_MAIN, PANEL_OPTIONS, PANEL_DEBUG };
static int g_panel_page = PANEL_MAIN;

static void panel_goto_options(void) { g_panel_page = PANEL_OPTIONS; }
static void panel_goto_debug(void) { g_panel_page = PANEL_DEBUG; }
static void panel_goto_main(void) { g_panel_page = PANEL_MAIN; }

static void populate_options_page(void)
{
  dbgui_begin("Options");
  dbgui_field_button("< back", panel_goto_main);
  panel_option_int("music_volume", 10, &g_opts.music_volume, platform_music_apply_volume);
  panel_option_int("sfx_volume", 10, &g_opts.sfx_volume, NULL);
  {
    /* --light-mode is a string, the panel field an index. */
    static int ui_index, applied_index = -1;
    if (applied_index >= 0 && ui_index != applied_index) options_set("light-mode", k_light_modes[ui_index]);
    ui_index = applied_index = current_light_mode_index();
    dbgui_field_int_names("light-mode", &ui_index, k_light_modes, 3);
  }
  dbgui_field_toggle("dither", &g_opts.dither);
  dbgui_field_toggle("extra_lights", &g_opts.extralights);
  dbgui_end();
}

static void populate_debug_page(void)
{
  dbgui_begin("Debug");
  dbgui_field_button("< back", panel_goto_main);
  dbgui_field_toggle("pick_view", &g_opts.debug_pick_view);
  dbgui_field_toggle("npc_tick", &g_npc_tick_enabled);
  dbgui_field_toggle("hide_walls", &g_uw_hide_walls);
  {
    int hide_models = !g_uw_3d_objects_enabled;
    dbgui_field_toggle("hide_models", &hide_models);
    g_uw_3d_objects_enabled = !hide_models;
  }
  dbgui_end();
}

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
    g_panel_page = PANEL_MAIN;
    return;
  }
  if (g_dbgui_inspect_obj != 0) {
    populate_debug_object_inspector(g_dbgui_inspect_obj);
    return;
  }
  if (g_dbgui_inspect_tex_pick != 0) {
    populate_debug_texture_inspector(g_dbgui_inspect_tex_pick);
    return;
  }
  if (g_uw_3d_objects_enabled < 0) g_uw_3d_objects_enabled = (!g_opts.disable_3d_objects);
  if (g_panel_page == PANEL_OPTIONS) { populate_options_page(); return; }
  if (g_panel_page == PANEL_DEBUG) { populate_debug_page(); return; }
  dbgui_begin("UW Port Options");
  dbgui_field_button("console", dbgui_console_open);
  dbgui_field_button("options", panel_goto_options);
  dbgui_field_button("debug", panel_goto_debug);
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
  /* Exactly the 3D view's own clip rect (render_dungeon_view_frame): (0x34,0x13) .. +width/height. */
  int vx0 = 0x34, vy0 = 0x13, vx1 = 0x34 + (int)DAT_0023b020, vy1 = 0x13 + (int)DAT_0023aed4;
  for (y = vy0; y < vy1; y++) {
    const unsigned char *row = (const unsigned char *)DAT_0023cca0 + y * 0x140;
    unsigned short *frow = fb + y * 0x140;
    for (x = vx0; x < vx1; x++) {
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

/* --show-fps: frame stats over the 3D view's upper left. fps and physics ticks/s are measured over
   half-second windows of wall-clock time; tiles and faces are the last frame's counts (tiles that
   emitted geometry, and records in the draw list, which includes object models). */
void uw_debug_draw_frame_stats(void)
{
  static Uint32 window_start;
  static unsigned frames, last_ticks;
  static double fps, tick_rate;
  Uint32 now = SDL_GetTicks();
  char line[64];
  int saved_use_pal = g_text_use_palette_color;
  unsigned short saved_flat = g_text_flat_color;

  frames++;
  if (window_start == 0) {
    window_start = now;
    last_ticks = g_stat_physics_ticks;
  } else if (now - window_start >= 500) {
    double secs = (now - window_start) / 1000.0;
    fps = frames / secs;
    tick_rate = (g_stat_physics_ticks - last_ticks) / secs;
    frames = 0;
    last_ticks = g_stat_physics_ticks;
    window_start = now;
  }
  g_text_use_palette_color = 0;
  g_text_flat_color = (unsigned short)0xffff;
  /* The automap's small font, which only has upper-case glyphs; restored to the normal font below. */
  select_active_font(s_font4x5p_sys_0008431c);
  snprintf(line, sizeof line, "FPS %.1f", fps);
  draw_text_string(line, 0x34 + 3, 0x13 + 2);
  snprintf(line, sizeof line, "PHYSICS %.1f/S", tick_rate);
  draw_text_string(line, 0x34 + 3, 0x13 + 9);
  snprintf(line, sizeof line, "TILES %d", g_stat_tiles_drawn);
  draw_text_string(line, 0x34 + 3, 0x13 + 16);
  snprintf(line, sizeof line, "FACES %d", DAT_0023b83c);
  draw_text_string(line, 0x34 + 3, 0x13 + 23);
  select_active_font(s_font5x6p_sys_0008430c);
  g_text_use_palette_color = saved_use_pal;
  g_text_flat_color = saved_flat;
}

/* --max-fps: called once per main-loop iteration; sleeps until the iteration's slot of 1/max_fps has
   passed. A slow frame does not bank a deficit that later frames would then run uncapped to repay. */
void uw_limit_frame_rate(void)
{
  static Uint64 next_frame;
  Uint64 freq = SDL_GetPerformanceFrequency(), now = SDL_GetPerformanceCounter();
  Uint64 interval = (Uint64)((double)freq / g_opts.max_fps);

  if (next_frame > now) {
    SDL_Delay((Uint32)((next_frame - now) * 1000 / freq));
    now = SDL_GetPerformanceCounter();
  }
  next_frame = (next_frame + interval > now) ? next_frame + interval : now + interval;
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

/* ---- Console object commands (OBJIDS / SPAWNOBJ / GIVEOBJ, demomode.c) ---- */

/* Display name of object type `id` (0..0x1ff), the way look/pickup show it. Empty if the type has
   no name. The string table's entry is copied first: format_object_display_name edits in place. */
void dbgui_object_name(int id, char *out, size_t n)
{
  char copy[128];
  const char *name = get_message_string((ushort)((id & 0x1ff) | 0x800));
  out[0] = 0;
  if (!name || !*name) return;
  snprintf(copy, sizeof copy, "%s", name);
  snprintf(out, n, "%s", (const char *)format_object_display_name((byte *)copy, 1, 0));
}

/* Create a fresh object of type `id`; critters live in the 27-byte mobile table, everything else in
   the 8-byte one. Returns NULL if the table is full. */
static uw_object_hdr_t *dbgui_new_object(int id)
{
  int critter = (id & 0x1c0) == 0x40;
  uw_object_hdr_t *obj = spawn_new_object((uint)id, critter ? 1 : 0);
  if (obj && critter) {
    ((uw_mobile_object_t *)obj)->npc_hp = g_monster_type_props[id & 0x3f].max_hp;
  }
  return obj;
}

/* SPAWNOBJ: place a new object in a free spot about a tile in front of the player (the placement
   search widens to neighbouring tiles if that one is blocked). Returns 1 and the tile, or 0. */
int dbgui_spawn_object(int id, int *tile_x, int *tile_y)
{
  if (id < 0 || id > 0x1ff) return -1;
  ushort x = DAT_00204880 >> 5, y = DAT_00204882 >> 5;
  project_position_by_heading((int)DAT_00201c70 >> 8, 12, &x, &y);
  ushort *tile = (ushort *)tilemap_lookup((int)(short)x >> 3, (int)(short)y >> 3);
  if (!tile) return 0;
  int height = ((*tile >> 4) & 0xf) << 3;
  uw_object_hdr_t *obj = dbgui_new_object(id);
  if (!obj) return 0;
  obj->xpos = x & 7;
  obj->ypos = y & 7;
  obj->zpos = height & 0x7f;
  if (find_object_placement((ushort *)obj, (short)x, (short)y, (short)height, 2) == 0) {
    free_object_slot(obj);
    return 0;
  }
  *tile_x = (short)x >> 3;
  *tile_y = (short)y >> 3;
  return 1;
}

/* GIVEOBJ: put a new object in the first empty top-level backpack slot (slots 0xb..0x12); quantity > 1 sets the stack
   size of a stackable object. Returns the
   slot, -1 for a bad id, -2 if the backpack is full, -3 if no object could be allocated. */
int dbgui_give_object(int id, int quantity)
{
  int slot;
  if (id < 0 || id > 0x1ff) return -1;
  for (slot = 0xb; slot < 0x13; slot++) {
    if ((*(ushort *)(&g_equipped_items + slot * 2) & 0xffc0) == 0) break;
  }
  if (slot >= 0x13) return -2;
  uw_object_hdr_t *obj = dbgui_new_object(id);
  if (!obj) return -3;
  if (quantity > 1 && obj->is_quant) obj->link = (quantity > 0x1ff ? 0x1ff : quantity) & 0x3ff;
  if (!place_held_item_in_empty_slot(obj, (short)slot)) {
    free_object_slot(obj);
    return -2;
  }
  return slot;
}

/* ALLRUNES: set every spell rune in the player's rune bitset (24 bits at status +0x44) and make sure a
   Rune Bag (type 0x8f) is in the top-level backpack. Returns 1 if a bag was added, 0 if one was already
   there, -2 if the backpack had no room for one (runes are still set). */
int dbgui_all_runes(void)
{
  int slot, result = 0, have_bag = 0;
  for (slot = 0xb; slot < 0x13 && !have_bag; slot++) {
    ushort *o = (ushort *)resolve_object_link(&g_equipped_items + slot * 2);
    if (o && (*o & 0x1ff) == 0x8f) have_bag = 1;
  }
  if (!have_bag) result = dbgui_give_object(0x8f, 1) >= 0 ? 1 : -2;
  DAT_00086df8[0x44] = (char)0xff;
  DAT_00086df8[0x45] = (char)0xff;
  DAT_00086df8[0x46] = (char)0xff;
  redraw_active_hud_panel();
  return result;
}

/* ---- CASTSPELL (demomode.c) ---- */
#define DBGUI_SPELL_COUNT 48

/* Spell i's name: the 48 spells' names are string-table page 6, ids 0x100.. in rune-table order. */
void dbgui_spell_name(int i, char *out, size_t n)
{
  const char *name = get_message_string((ushort)(0xc00 | (0x100 + i)));
  snprintf(out, n, "%s", name ? name : "");
}

int dbgui_spell_count(void) { return DBGUI_SPELL_COUNT; }

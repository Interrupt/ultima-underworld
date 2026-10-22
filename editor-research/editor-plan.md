# Underworld editor plan

Goal: recreate the original UW1 level editor (see the surviving screenshot of
its object-edit mode: 3D view top-left, top-down tile map top-right, a mode
palette down the middle, a selected-object editor bottom-left and an object
palette bottom-right) inside this port, reusing the game's own renderer and
object code wherever possible.

Most of the machinery already exists: the Far Sight free camera, the
fullscreen-view buffer swap, the per-pixel pick buffer, the typed object-list
APIs and a level writer (`commit_level_to_save_slot`). The two genuinely new
pieces are a higher-resolution UI surface and tile (not just object) picking in
the 3D view.

## Reading the original screenshot

What the original UI appears to map onto, for reference while building:

| Original widget | Likely field / action |
|---|---|
| 8x8 grid with dot | `xpos`/`ypos` (3 bits each, sub-tile position) |
| `80` / `+0` spinner | `zpos` (7 bits) and offset relative to tile floor |
| 8-ray rose with marker | `heading` (3 bits) |
| `My:` box (dimmed for a spider) | probably `npc_whoami` (or owner) |
| Head / Next / Link | tile `obj_head` / `next` field / `link` field when `is_quant == 0` |
| Show / Move / Copy / Delete | focus camera / relink / duplicate / free |
| Class / Comm / Item tabs | type picker / NPC fields / generic item fields |
| Right-hand palette | placement brush; the shown page is the 0xC0-0xDF scenery range |
| Status bar `P:x y z h`, `Map= Lvl n @x,y` | camera position and current level/tile |

## Verified resolution of the screenshot

The screenshot is 1000x625 (8:5). Measuring edge spacing in the UI band gives
steps of 3,3,3,3,... averaging 3.125 px (= 1000/320), and the 8x8 grid lines
are ~18.75 px apart (= 6 native pixels). So the original editor ran at
**320x200** and the screenshot is a 3.125x nearest-neighbour upscale, not a
640x400 UI. Native layout (screenshot px / 3.125):

| Region | Native rect (x0,y0)-(x1,y1) |
|---|---|
| 3D view | (0,0)-(148,124) |
| Mode button palette | (153,0)-(175,~190) |
| Tile map | (176,0)-(320,116) |
| Object editor (bottom-left) | (0,126)-(150,190) |
| Object palette (bottom-right) | (174,~148)-(320,190) |
| Info bar | (0,192)-(320,200) |

This fits inside the game's own 320x240 framebuffer, so the two-surface 640x400
canvas below is probably unnecessary; the open cost is that the 3D view must
shrink to ~148x124 via the viewport sites listed below.

## Constraints found in the code

- **Framebuffer is fixed at 320x240 RGB565** (`g_uw_framebuffer`, game.c).
  `0x140` strides and 200/240 clamps run through graphics.c, text.c,
  bitmap.c, tmap.c (`raster_triangle(0x140, ...)`), the pick buffer and the
  dirty-rect flush. The original editor looks ~640x400 (640x480?), so its layout cannot
  live inside the game buffer.
- **The 3D view rect is defined in ~8 independent places:**
  `configure_dungeon_viewport` (3d.c), the static clip
  `DAT_0008462c..38 = {0x34,0x13,0xe0,0x84}` in `render_visible_tile_list`
  (tmap.c), the projection cx/cy/scale in tmap.c *and again* in
  `raster_textured_span` (3d.c, lighting eye-ray), the hardcoded clear in
  `render_dungeon_view` (graphics.c), the dirty rect in
  `render_dungeon_frame_timed` (visibility.c), the weapon overlay
  (weapon_swing.c) and `uw_debug_blit_pick_buffer` (debug_shim.c).
  `fullscreen_view.c` already overrides all of them behind `g_view_fullscreen`.
- **Free camera mostly exists.** `DAT_0023b82c = 0` makes
  `update_current_view_from_subject` read position from
  `DAT_0023be90/92/94` and facing from `DAT_0023bf00` (see
  `enter_free_camera_mode` / `move_custom_view_target`, game.c). Catches:
  - pitch still comes from the player's `DAT_0023beb4` via
    `sync_camera_from_player`;
  - `seed_visibility_queue` renders nothing if the camera tile is solid or
    off-map;
  - the vertex arena caps at `UW_ARENA_MAX_VERTS` (600);
  - edge rays are cast at a fixed +/-45 deg, so a wider FOV loses edge tiles.
- **Picking identifies objects only** (max 191 per frame). Walls/floors write
  `0xf0 + texture`, with no tile index.
- **Dangerous APIs for editor use:**
  - `alloc_object_slot` calls `despawn_objects_outside_radius` (random
    world deletion) when a free list is empty;
  - `free_linked_object_recursive` frees the object *and every following
    sibling* - on a tile head it wipes the tile.
- **Automap renderer isn't reusable** for a panel: fixed 3px/tile origin,
  reads the reveal buffer not the tiles, and `darken_pixel` dereferences
  `g_automap_tint_bitmap` (NULL outside `draw_automap_screen`) with no bounds
  check.
- **Only one lev.ark can be open at a time** (offset table is the single
  global `DAT_000b78b8`).

## Architecture

- **Overlay on dungeon mode, not a new mode-table row.** 3D rendering in
  `main_loop_hud_flush` is gated on `DAT_00201b64 == 0`, and the debug UI
  already proves the overlay pattern: intercept input in `uw_pump_events`
  (gx_stub.c), skip `poll_dungeon_movement_keys`, draw after the 3D pass.
- **New files:** `src/editor.c` (mode, input, layout), `src/editor_draw.c`
  (canvas primitives), `src/editor_ops.c` (safe object/tile mutations).
  Add all three to `UW_SOURCES` in `CMakeLists.txt` **and** `uw_sources` in
  `build.zig`.
- **Pause simulation** with an early return in `movement_pacing_handler`
  (movement.c) while the editor is active, keeping `DAT_0023bf54` updated so
  time doesn't jump on resume. Rendering is a separate step and continues.
- **Two-surface composite instead of a bigger game buffer:**
  - render the 3D scene through the existing fullscreen path
    (`uw_fullscreen_scene_begin/end`) into its own 320x200 buffer;
  - the editor owns a separate 640x400 RGB565 canvas for its panels;
  - in `GXEndDraw`, when the editor is active, `SDL_RenderCopy` the canvas,
    then the 3D scene into the 3D pane's rect; set the logical size to the
    canvas size;
  - map clicks inside the 3D pane back to 320x200 coordinates for the pick
    lookup.
  This leaves the renderer's stride assumptions untouched.
- **Editor drawing layer** (`editor_draw.c`): rect fill, lines, text and GR
  blits into the canvas. Reuse decoders, not blitters (the game's blitters
  assume a 320 stride): `decode_gr_entry_to_buffer` / `decompress_gr_bitmap`
  with the palette in `DAT_00088d98`, and the game font's glyph data.

## Phases

### Phase 0 - infrastructure and safety (first)

1. **Chain validator** (`VALIDATE` console command + test helper). Walk every
   tile chain and container link chain; assert each allocated slot is
   reachable exactly once, no free slot is reachable, free lists and the
   active-mobile list are consistent, and each mobile's `tile_word` (0x16)
   matches the tile it's linked on. Every editor op must leave it passing.
2. **Undo via arena snapshots.** Mutable level state is tiny: the 0x7c08-byte
   arena (`DAT_002029cc`), the 0x180-byte scheduler table and the 0x7a-byte
   texture map. Snapshot before each op into a ~64-entry ring; undo/redo with
   no per-op inverse logic.
3. **Safe wrappers** in `editor_ops.c`:
   - `ed_alloc(region)` checks the free count first and fails cleanly, never
     reaching the despawn path;
   - `ed_delete(link, obj)` uses `unlink_and_free_object`, plus
     `scheduler_remove_entry` for class 7 and `free_trap_class_object` for
     traps;
   - refuses to touch slot 1 (player); the player only moves via
     `set_player_tile_position`.

### Phase 1 - shell, free camera, composite display

- Toggle with a key and `EDITOR on|off` (branch in `demo_exec_line`,
  demomode.c).
- On enter: disable mouselook, set `DAT_0023b82c = 0`, seed the free camera
  from the current view. On exit: restore the player as view subject.
- Fly-cam: WASD, Q/E height, mouse yaw/pitch. Patch `sync_camera_from_player`
  to read pitch from an editor global when active. Reject moves into solid or
  off-map tiles so the visibility flood always has a valid seed.
- Redraw with `full_dungeon_redraw()`; after edits also
  `set_pending_update_flags(0x7ffe)`.
- Status bar: camera position, `Map= Lvl n @x,y`, fps.
- **Milestone:** 640x400 window, flying 3D pane, simulation frozen.

### Phase 2 - top-down tile map pane

- New renderer reading tiles directly (`uw_tile_t` at `DAT_002029cc`):
  colour by `tile_type`/`floor_height`, diagonal shapes via automap's
  `DAT_000842c0_real_table`, object dots coloured by class, camera position
  and view cone.
- Zoom and pan. Click selects a tile (cursor = that tile's head);
  double-click moves the camera there.
- **Milestone:** 3D and map panes linked; selection in one updates the other.

### Phase 3 - object navigation (Head / Next / Link)

- Editor **cursor** = stack of `ushort *` link fields + selected object.
  Holding the pointer to the link field (not just the object) is what makes
  unlink/insert-in-place correct.
  - **Head:** `(ushort *)((char *)tilemap_lookup(x, y) + 2)`.
  - **Next:** `&obj->chain_word`.
  - **Link:** push `&obj->link_word`, only when `is_quant == 0 && link != 0`.
  - **Back:** pop (not in the original, costs nothing).
- **3D pick:** `pick_object_under_cursor(2)` gives the object and its tile
  (`DAT_002020b0`); rebuild the cursor with
  `find_object_by_encoded_slot_in_chain` on that tile's chain.
- **Show:** move the camera beside the object's tile facing it; highlight in
  both panes.

### Phase 4 - object property editor (bottom-left)

- **Common widgets:** 8x8 grid -> `xpos`/`ypos`; z spinner -> `zpos` with
  offset from the tile floor (verify the floor-height -> zpos scale first);
  8-way rose -> `heading` (keep `full_heading`/`npc_heading` in sync for
  mobiles); icon box -> OBJECTS.GR frame.
- **Item page:** `object_id`, `quality`, `owner`, `is_quant` + quantity/link,
  `enchanted`, `invisible`, `doordir`.
- **Comm page (mobiles):** `npc_hp`, `npc_goal`, `npc_gtarg`, `npc_level`,
  `npc_attitude`, `npc_talkedto`, home x/y, `npc_whoami` ("My:").
- **Class page:** type picker; warn when crossing the static/mobile boundary
  (critters are `(id & 0x1c0) == 0x40`).
- Fields still marked unverified in uw.h are shown **read-only** until
  confirmed - this doubles as struct-recovery verification work.
- **Actions:**
  - **Move:** unlink from cursor link, insert at target tile head or into a
    container link; for mobiles set `tile_x`/`tile_y` at 0x16. Two-click.
  - **Copy:** `ed_alloc`, copy 8 or 27 bytes, insert after the original;
    shallow by default, deep copy of contents optional.
  - **Delete:** `ed_delete` on the cursor link.

### Phase 5 - object palette and placement (bottom-right)

- Category tabs by object id range (verify against `g_object_type_props`
  class bits rather than trusting this table):

  | IDs | Contents |
  |---|---|
  | 0x00-0x1F | weapons |
  | 0x20-0x3F | armour |
  | 0x40-0x7F | critters |
  | 0x80-0x8F | containers |
  | 0x90-0x9F | lights, wands |
  | 0xA0-0xBF | treasure, food |
  | 0xC0-0xDF | scenery / junk |
  | 0xE0-0xFF | runes, bits |
  | 0x100+ | keys, books, traps, triggers |

- Icons from OBJECTS.GR (`g_grtile_registry`, frame = type); fall back to
  `dbgui_object_name` text or critter sprite frame 0.
- Placement: pick a brush, click a map tile or a 3D floor. Create from
  `spawn_new_object` defaults via `ed_alloc`; critters get `npc_hp` from
  monster props as `dbgui_new_object` does. Exact `xpos`/`ypos` from the
  click - no `find_object_placement` randomness.
- **Floor picking in 3D:** add a parallel 16-bit tile-index buffer written
  during `walk_visible_tiles` for wall/floor spans. Cheaper and more exact
  than an analytic ray cast.

### Phase 6 - saving

- Generalise `commit_level_to_save_slot` (saveload.c) into
  `editor_write_level(path, n)`, keeping its player-strip/reload steps so
  player inventory isn't saved as orphans.
- Targets: `SAVE0\lev.ark` (immediate play-test) and an explicit export copy
  of `DATA\lev.ark` with the automap block zeroed. Serialise writes (single
  archive handle).
- Note: `write_level_quest_flags_to_archive` is misnamed - it writes the
  texture-map block `n+0x11`.
- **Live vs authored state:** saving copies runtime state (AI-mutated NPC
  fields, despawns). Add an "edit pristine" entry that loads level n from
  `DATA\lev.ark` with no simulation ticks. Live editing stays useful for
  debugging.

### Phase 7 - tile mode

- Edit `tile_type`, `floor_height`, `floor_tex`, `wall_tex`, `door_bit`,
  `no_magic`, and the 48-wall/10-floor texture map (block `n+0x11`).
- After changes, rebuild via `load_terrain_texture_props` /
  `load_dungeon_texture_arenas` as needed, then full redraw.

### Later

- Replace the `g_view_fullscreen` boolean with a viewport struct (rect,
  cx/cy/scale, clip) read at all ~8 sites, so the 3D pane can match the
  original's aspect instead of a scaled 320x200. Keep FOV near 90 deg.

## Testing

- **Unit tests** (Unity, following `object_core` / `test_debug_ui`): move,
  copy, delete, insert-into-container and undo round-trips, asserting with the
  chain validator and free counts. Must include: deleting the head of a
  multi-object tile (sibling-wipe bug), nested containers, a class-7
  scheduler object, a full free list.
- **Regression demos:** `demos/editor_*.txt` using `CONSOLE EDITOR on`,
  `SDLCLICK`, `SCREENSHOT`, `VALIDATE`, run under ASan via
  `run-regressions.sh`.

## Suggested order

Phase 0 -> 1 -> 3 -> 4 -> 2 -> 5 -> 6 -> 7.

Navigation and the property editor come before the map pane because 3D
picking already works: that yields a usable inspect-and-tweak tool early and
exercises the riskiest code (chain mutation) while the validator is fresh.

# Underworld Editor: Master Plan

2026-10-22 · @Chad Cuddigan

## Overview

This is the single source of truth for recreating the original UW1 level editor in Grandaddy (uw1-pocketpc-decomp). It merges `editor-plan.md` (unpushed commit on `underworld-editor`) with six later plan docs, and where they disagree the later decision wins.

| Source | What it contributed | Status |
| --- | --- | --- |
| `editor-plan.md` | Architecture, codebase constraints, phases | Superseded where noted below |
| [Object Mode Plan](https://claude.ai/artifact/3kbN4jdqngGSQsi7WcvS4i) | Item / Comm / Class pages, brush vs selection, Mv slot, field audit | Merged |
| [Editor Menu Plan](https://claude.ai/artifact/3FkrHVt5923BMHQPovtzNw) | Save, Revert, Change level, Play, hotkeys | Merged; layout changed to a popup |
| [Tile and Terrain Tool Plan](https://claude.ai/artifact/QtAuo4iegDTHkvuLwvnPDM) | Tile type and height brushes, consistency checks | Merged |
| [Texture Painter Plan](https://claude.ai/artifact/JXpkin5FTSJoMku4KbbF4E) | Slot palette, slot editing vs tile painting | Merged |
| [Fill Tool Plan](https://claude.ai/artifact/FZ35TV9sEWdpnHfWHXxVb6) | Flood fill paint targets and spread rules | Merged |
| [Search Tool Plan](https://claude.ai/artifact/G7hrwxAKV4GQko1iXKqGHd) | Recovering the dead find-next routine, search criteria | Merged |

No original editor data survives: the editor code is `#ifdef`'d out of the binary, so every button meaning below is an informed guess. Where faithfulness is unknowable, the plan picks clarity.

## Screen layout and button map

The screen has five regions: 3D view (top-left), top-down tile map (top-right), a mode column down the middle, a per-mode editor panel (bottom-left) and a per-mode palette (bottom-right). The status bar along the bottom shows camera position, level and tile.

**Resolution (confirmed).** The original editor ran at **320x200**. The surviving screenshot is 1000x625, a 3.125x nearest-neighbour upscale: the edges in its UI band step 3,3,3,3... pixels (averaging 3.125), and the 8x8 position grid's lines are 18.75 px apart, which is 6 native pixels. So the layout below is in native pixels and fits inside the game's own 320x240 framebuffer; no larger canvas is needed.

| Region | Native rect (x0,y0)-(x1,y1) |
| --- | --- |
| 3D view | (0,0)-(148,124) |
| Mode column | (153,0)-(175,200): the starburst at the top, eight 14x14 mode buttons from y=26 every 16 px, the orange button at the bottom |
| Tile map | (176,0)-(320,116) |
| Object-group bar | (194,119)-(299,141) |
| Selected-object editor | (0,126)-(150,190) |
| Object palette | (174,148)-(320,190) |
| Status bar | (0,192)-(320,200) |

### Mode column (top to bottom)

| Icon | Our reading | Confidence |
| --- | --- | --- |
| Big 8-ray starburst | Not a live compass: it has no direction marker at actual size, unlike the heading rose. Probably a menu or mode button. Ours: Save, for now (a candidate home for the menu later) | Low |
| Grid / tiles icon | Tile properties mode (type, height, flags) | Medium |
| Panel / swatch icon | Texture painter mode | Medium |
| OBJ | Object mode (the screenshot's active mode) | High |
| Eye | View options: editor markers, lighting, what the 3D pane draws | Low |
| Magnifier with F | Find (search) | High |
| First lettered icon | Unreadable at screenshot resolution | Unknown |
| Second lettered icon | Cut / copy mode for tile regions | Medium |
| Black blob | Paint-bucket fill | Medium |
| Orange figure (bottom, set apart) | Play-test: drop into the normal game at the camera. Ours: Play | Medium |

### Object mode, bottom-left panel

| Widget | Meaning | Confidence |
| --- | --- | --- |
| 8x8 grid with dot | `xpos`/`ypos`, the sub-tile position | High |
| `80` / `+0` spinner | `zpos`, and its offset from the tile floor | High |
| 8-ray rose with marker | Object `heading` (3 bits) | High |
| Icon box | The type's art, from its object ID | Medium |
| Mv box | Holding slot for an object being moved or copied (not "My:") | High (user-confirmed) |
| Head / Next / Link | Tile chain head / `next` field / `link` field into contents or traps | High |
| Show / Move / Copy / Delete | Focus camera / relink via Mv / duplicate via Mv / free | High |
| Item tab | This object's own fields (quality, owner, quantity, flags) | Medium |
| Comm tab | The type's common properties (COMOBJ.DAT), game-wide | Medium |
| Class tab | The type's class-specific table (OBJECTS.DAT), game-wide | Medium |

Item was drawn dimmer than Class and Comm with a spider selected, which hints it was disabled for critters.

### Object mode, bottom-right palette

The brush for placing objects. The bar above it (the object-group bar, native rect (194,119)-(299,141)) is a scrollable row of group icons, not the objects on the selected tile: its first icon, a skull pile, carries the selection frame, and the palette below it shows what a decor group would hold (plants, grass, skulls, bones, sticks, a shield, debris). Clicking a group fills the palette with that group's objects. The bar scrolls (arrows at both ends, mouse wheel) because there are more groups than fit, and the palette scrolls too. The tile's own objects are reached through Head / Next / Link and the selected-object editor.

### Status bar

`P:x y z h` is camera position and heading, `Map= Lvl n @x,y` is level and tile. `F:9.1` is likely frame rate; `R:22 P:2 S:4` are unidentified counters. The date (Thursday, Dec 17) points to 1992, around UW2's ship date.

## Architecture and codebase constraints

The editor runs as an overlay on dungeon mode and freezes simulation while active. Its screen is the original's native 320x200: the game's 3D scene is rendered into its own buffer and scaled into the 3D pane, and the editor's other panels are drawn around it.

### Constraints found in the code

- **Framebuffer is fixed at 320x240 RGB565** (`g_uw_framebuffer`). `0x140` strides and 200/240 clamps run through graphics, text, bitmap, tmap and the pick buffer. The original editor's 320x200 screen fits inside it, so the editor draws its panels with the game's own primitives into a separate 320x200 buffer instead of needing a larger canvas.
- **The 3D view rect is defined in about eight places**: `configure_dungeon_viewport`, the static clip in `render_visible_tile_list`, projection cx/cy/scale in tmap.c and again in `raster_textured_span`, the clear in `render_dungeon_view`, the dirty rect in `render_dungeon_frame_timed`, the weapon overlay and the debug pick blit. `fullscreen_view.c` already overrides all of them.
- **Free camera survives** because the Far Sight spell uses it, and the editor runs the camera in Far Sight's mode (below): `DAT_0023b82c = 0` makes `update_current_view_from_subject` read `DAT_0023be90/92/94` and `DAT_0023bf00`. Pitch still comes from the player's `DAT_0023beb4`, and a camera in a solid or off-map tile renders nothing.
- **Far Sight mode.** While the editor is on it holds the same flag the `FARSIGHT` demo command holds (`g_debug_farsight`, which sets `DAT_002020d8` when the player's effects are refreshed), so the view is lit at Far Sight's light level (6) whatever light the player carries; turning the editor off restores the previous state. The camera flies through walls: like the game's `move_custom_view_target`, it only stays within the map (0x180-0x3d80), with no collision. Inside a solid tile the view draws nothing, because the visibility flood starts from the camera's tile, as in Far Sight.
- **Camera controls** use the game's own keys: W or Up runs forward, S walks forward slowly, X or Down goes back, A / D / Left / Right turn, Z / C sidestep, Q / E change height. The mouse cursor is always the plain X cursor (never the walk and turn arrows). Right-drag pans the tile map; Show recentres it.
- **3D picking** has two parts. Objects come from the game's per-pixel pick buffer. The floor comes from a ray cast through the clicked pixel (the inverse of the renderer's projection, turned by the camera's facing and pitch) over the tile map, which treats floors as flat at their tile's height; this places and moves objects at exact spots. Wall faces still need the tile-index pick buffer (texture painting).
- **Picking finds objects only** (up to 191 per frame); walls and floors report a texture, not a tile.
- **Dangerous APIs**: `alloc_object_slot` randomly despawns objects when a free list is empty; `free_linked_object_recursive` frees an object and every following sibling.
- **Only one lev.ark can be open at a time** (single offset table `DAT_000b78b8`).
- **Automap can't be reused** for the map pane (fixed scale, reveal-buffer source, `darken_pixel` crashes outside its screen).

### Design

- **Overlay, not a mode-table row.** 3D rendering is gated on dungeon mode, and the debug UI already proves the overlay pattern in `uw_pump_events`.
- **New files**: `src/editor.c`, `src/editor_draw.c`, `src/editor_ops.c`, added to both `CMakeLists.txt` and `build.zig`.
- **Pause** with an early return in `movement_pacing_handler`, keeping `DAT_0023bf54` updated.
- **Two surfaces**: render 3D through the fullscreen path into its own 320x200 scene buffer; the editor owns a 320x200 screen buffer it draws the other panels into (the game's sprite and text decoders, with `g_uw_framebuffer` redirected to it); `GXEndDraw` presents that screen with the scene scaled into the 3D pane's rect (cropped at the sides to keep its aspect). Clicks in the pane map back to scene coordinates for picking.
- **Own drawing layer** that reuses the GR and font decoders but not the 320-stride blitters.
- **Safety layer first**: a chain validator (`VALIDATE`), whole-arena undo snapshots (0x7c08 + 0x180 + 0x7a bytes), and `ed_alloc` / `ed_delete` wrappers that never reach the despawn or sibling-wipe paths and refuse the player slot.

## Editor lifecycle

The editor always works on the master `DATA\lev.ark`, never on save slots, and reloads the level fresh from it on every entry.

1. Start the game and load into a level. The editor needs a loaded level, so it cannot be entered from the main menu (a later "Edit level" menu option could load one and jump straight in).
2. Press **F9** in the dungeon view (also the `--editor` startup option, and `editor` in the console: bare `editor` toggles, `editor on|off` sets it). L is not used: the game binds it to a movement command. The original entry point is gone, so these choices are ours.
3. The current level is reloaded from `DATA\lev.ark`, discarding play-session state (built: it reloads with `load_level_from_archive`, which is `load_level` for any archive path; the confirmation the first time is not built yet).
4. Edit, then save with Ctrl+S or the menu.
5. **Play** (the orange button at the bottom of the mode column) saves the level into `DATA\lev.ark`, copies that archive over `SAVE0\lev.ark` (so every level is as authored), then switches to the normal game with the full HUD, placing the player at the editor camera's X and Y, facing the way the camera faces. It refuses if the camera is over a wall (the player cannot stand inside one). It uses the current game and character, not a new one.
6. Press **F9** (or type `editor`) during play to return. The level reloads from the archive again so nothing done while playing leaks into the edit. Escape keeps its normal game-menu job during play.

**Level switching** uses its own path that reads and writes the master archive. The game's stairs path writes save slots, so reusing it unchanged would put edits in the wrong file.

**Saving during play-tests** is left as normal game behaviour for now; a scratch save slot is the fix if it ever causes trouble.

## Escape menu

Escape opens a small popup centred over the editor; Escape again closes it. The screen is not dimmed for now, since the popup itself shows you're in a menu. This replaces the Menu Plan's panel-swap layout: with no original data either way, the popup was picked for clarity, and blocking all input but the popup is simpler than tracking which panels stay live.

Selection, brush and Mv slot are all kept while the menu is open. If an action is pending (an object waiting in Mv), the first Escape cancels it and only an Escape with nothing pending opens the menu.

| Action | Hotkey | Behaviour |
| --- | --- | --- |
| Save | Ctrl+S | Write the current level into `DATA\lev.ark`; back up lev.ark before the first save of a session |
| Revert | none | Reload the level from the archive, discarding unsaved edits (always confirms) |
| Change level | Page Up / Page Down | Pick a level; clears selection and Mv, since they belong to the old level; camera resets to an open tile |
| Play | orange button | Save prompt if dirty, then normal game at the camera's position and facing (over open floor only) |
| Exit editor | F9 | Return to the game, same rules as Play |

There is no Open: UW keeps every level in one archive, so opening means picking a level. A dirty flag drives a Save / Discard / Cancel prompt on Change level, Play and Exit, and an unsaved marker in the status bar. Saving uses a generalised `commit_level_to_save_slot` that keeps its player-strip step.

## Object mode

The palette sets a brush for placing objects; the left panel edits one selected object; the two never affect each other.

### Palette and placement

- Built directly from OBJECTS.GR (frame N = type N), so no list is maintained by hand. Art is not a field: it comes from the ID (OBJECTS.GR, CRIT files via ASSOC.ANM, or .E models chosen in code), and was in place before the editor ever saw a type.
- Groups by ID range (the original's groups are not known; this set is a guess, to verify against `g_object_type_props` class bits). Each group's icon is a representative object:

  | Group | IDs |
  | --- | --- |
  | Weapons | 0x00-0x1F |
  | Armour | 0x20-0x3F |
  | Critters | 0x40-0x7F |
  | Containers | 0x80-0x8F |
  | Lights, wands | 0x90-0x9F |
  | Treasure, food | 0xA0-0xBF |
  | Decor (scenery, bones, plants, debris; the default) | 0xC0-0xDF |
  | Runes, bits | 0xE0-0xFF |
  | Keys, books, scrolls | 0x100-0x13F |
  | Special objects, shrines | 0x140-0x17F |
  | Traps | 0x180-0x1BF |
  | Triggers | 0x1C0-0x1FF |

- Clicking a palette icon **arms** it as the brush (orange frame); clicking the armed icon again disarms it. Left clicks on the map or on the 3D floor then place it; the click's position inside the tile sets the object's exact sub-tile position, and it stands on the floor. Right-drag on the map pans it, so a right click never selects or places.
- With a brush, click a map tile or a 3D floor to place. Exact `xpos`/`ypos` from the click, created through `ed_alloc` with `spawn_new_object` defaults.
- New critters get `npc_hp` from monster properties and `whoami = 0` (generic behaviour and conversation). Named NPCs get a whoami by hand.
- Selecting a type in the palette can open its Comm and Class pages directly, so tuning a type never requires placing a temporary instance.

### Brush vs selection

Picking a brush keeps the selection. **Replace with brush** is an explicit button that changes the selected object's type, so a spider never becomes a skull by accident. It warns when crossing the static/mobile boundary, since critters need a 27-byte slot.

### Selected-object panel

- **Common widgets**: 8x8 grid (`xpos`/`ypos`), height spinner (`zpos` and offset from floor), heading rose (keep `full_heading`/`npc_heading` in sync for critters), icon box.
- **Item** (this object, saved in the level): quality, owner, quantity or link, enchanted, invisible, door direction. Owner only means something when the type's can-have-owner flag is set; picking up an owned item angers a matching nearby NPC.
- **Comm** (type, COMOBJ.DAT): height, radius, weight, value, quality class, can-pick-up, can-have-owner, has-look-description. Edits change every object of that type game-wide, which the UI must make clear. Art shown read-only.
- **Class** (type, OBJECTS.DAT): weapon damage, armour values, critter stats, container capacity. Edits change every object of that exact type (all longswords, not all weapons).
- **Critter fields** (instance): hit points, level, attitude, goal, goal target, home x/y, talked-to, whoami, height, hunger. Runtime state is never exposed. Fields still unverified in uw.h are read-only. Conversations are authored elsewhere (CNV.ARK, babl VM); the editor only sets whoami.

### Field audit

| Field | Scope | Where edited |
| --- | --- | --- |
| object ID | instance | Replace with brush |
| xpos, ypos, zpos, heading | instance | Common widgets |
| quality, owner, quantity/link, flags | instance | Item |
| next | instance | Managed by editor, never edited |
| critter fields | instance | Critter page |
| COMOBJ properties | type | Comm |
| OBJECTS.DAT class table | type | Class |
| art | type (by ID) | Read-only display |

### Navigation and actions

- **Head** / **Next** / **Link** walk the tile chain and into containers, NPC inventories and trigger-to-trap links (Link only when `is_quant` is 0). **Back** pops a level (new). The editor cursor stores pointers to link fields, which is what makes in-place unlink and insert correct.
- Clicking an object in 3D selects it and rebuilds the cursor.
- **Move** / **Copy** are two-click: the object goes into Mv, then click a destination tile or container. Copy is shallow by default.
- **Delete** goes through `ed_delete`. **Show** flies the camera beside the object and highlights it in both panes.

### Traps, triggers and markers

- Traps (around 0x180-0x19F) and triggers are invisible objects whose parameters are packed into quality, owner and position fields; each trap type gets its own small parameter page.
- Chain: switch or lever, then trigger, then trap (often only on the link chain, not a tile list).
- Triggers store a target tile, believed to be quality/owner (verify). **Set Target**: select a trigger, then click a tile.
- The editor draws invisible objects, traps and triggers as icon billboards so they can be seen and clicked (they then land in the pick buffer). A view toggle hides them.

## Tile and terrain mode

Pick a tile type and height as a brush, then paint tiles; select-and-edit is also supported for careful single-tile changes.

- **Palette (bottom-right)**: one icon per tile type: solid, open, four diagonals and four slopes (verify enum values against the loader).
- **Panel (bottom-left)**: floor height spinner with a side-view preview, brush scope (type only, height only, or both), door and no-magic checkboxes, and a readout of the selected tile's coordinates, type, height, flags, textures and object count.
- **Painting**: click or drag over tiles on the map or floors in 3D. Modifier-click is an eyedropper that copies a tile's type and height into the brush, rather than a separate pick mode. Modifier-drag paints a rectangle. Raise/lower steps height by one.
- **Consistency checks** after each stroke (warn, don't block): objects on a newly solid tile (offer move or delete), objects below a raised floor (offer lift), camera inside a solid tile (allowed, as in Far Sight, but the view draws nothing there and Play refuses; offer to move it out), mismatched slope ends, door bit without a door object or the reverse, diagonals facing solid tiles.
- **Applying**: one undo snapshot per stroke, write through `uw_tile_t` fields, rebuild geometry caches for affected tiles and neighbours, then `full_dungeon_redraw()` and `set_pending_update_flags(0x7ffe)`. Run VALIDATE if a check moved or deleted objects.
- **Extras**: map coloured by height (light to dark green, like the original), a side-view cross-section, auto-slope between heights.

## Texture painter mode

Painting a tile changes only that tile; editing a slot changes every tile on the level that uses it, and the UI keeps these two apart.

- **Background**: each tile stores two texture indexes, `floor_tex` and `wall_tex`, into the level's own texture map (block `n+0x11`: about 48 wall and 10 floor slots chosen from the global set). The ceiling is one texture per level. All of a tile's wall faces share its one wall texture.
- **Palette (bottom-right)**: Wall and Floor tabs showing this level's slots as thumbnails, each with a usage count so empty slots stand out.
- **Panel (bottom-left)**: slot editor (swap which global texture the active slot points to), a ceiling picker, and the selected tile's slots.
- **Painting**: click or drag on the map (paints floor or wall per the active tab) or in 3D (floor or wall face clicked; needs the tile-index pick buffer). Modifier-click eyedrops a slot.
- **Slot edits** confirm with the usage count first. Picking an unmapped global texture offers a free zero-usage slot; an in-use slot is never silently overwritten.
- **Applying**: undo snapshot per stroke or slot edit (arena, scheduler table and texture map), write tile fields, rebuild with `load_terrain_texture_props` / `load_dungeon_texture_arenas` after slot or ceiling edits, then redraw. Saving writes block `n+0x11` through the misnamed `write_level_quest_flags_to_archive`.
- **Extras**: hover highlight of the face to be painted, select all tiles using a slot, compact unused slots.

## Fill tool

Click a seed tile and the active brush floods outward through connected matching tiles, stopping at doors by default.

- **Paint target**: floor texture, wall texture, floor and wall, or tile type (uses whichever brush is active).
- **Spread rule**: same floor texture, same wall texture, same floor height, same tile type, or any connected open tile. "Match height, paint floor" retextures one raised platform without touching the room around it.
- **Doors**: stop at tiles with the door bit by default (the door tile itself is not painted); a toggle fills through for a whole wing.
- **Algorithm**: breadth-first over the 64x64 grid with 4-connectivity, a visited bitmap, skip out-of-bounds, solid, non-matching and (by default) door tiles. Diagonal and slope tiles are painted but don't spread further, so the fill can't leak round corners.
- **Applying**: undo snapshot first, write tile fields, handle unmapped textures as in the texture painter, rebuild and redraw, then briefly highlight the filled tiles on the map.
- **Extras**: hover preview of the fill, a modifier for rectangle fill.

## Search (Find) tool

Find starts from a recovered dead routine in the decomp that finds the next object of a type and moves the camera to it; it lost its caller when the editor UI was `#ifdef`'d out.

1. **Recover it**: name the routine, add it to the function database, document whether it walks all slots or only tile chains and how it positions the camera, and pin its behaviour with a unit test.
2. **Wire it in**: Find Next / Find Previous drive the editor's free camera; the found object becomes the selection with its Head/Next/Link cursor rebuilt. For an object inside a container, the camera goes to the outermost container's tile.
3. **Extend criteria** (over every allocated slot, so container contents count): exact type, category, owner, whoami, "what links to this" (find a trap's trigger or a trigger's lever), trigger target tile, and the invisible/enchanted flags. Tile searches (texture slot, type, height, doors) come later.

- **UI**: criteria with a value prefilled from the selection in the bottom-left; a scrollable results list (icon, name, tile, container path) in the bottom-right; result count in the status bar.
- **Camera**: fly to an open tile beside the object, facing it; if the spot behind it is solid, use the tile's centre. (The free camera itself may enter walls; Find just prefers open floor.)
- **Validation searches**: traps nothing links to, triggers with no trap or a solid target, whoami with no conversation, owners missing from the level.

## Cut and copy mode

Cut and copy work on rectangular regions of tiles on the map, since object mode already has its own Move, Copy and Delete. There is no separate plan doc for this yet.

- Drag a rectangle on the map pane, then Copy or Cut. Paste places the region with its top-left at the clicked tile, with an undo snapshot first.
- **Version 1 copies tiles only**: type, height, flags and both texture slots.
- **Later, optional**: bring objects along, which means deep-copying their chains and shifting trigger target coordinates by the same offset as the paste.
- Pasting runs the tile-mode consistency checks on the destination.

## Phases, testing and open questions

Build the safety layer first, then a usable inspect-and-tweak object editor, then the painting tools.

1. **Phase 0, safety**: VALIDATE, arena-snapshot undo, `ed_alloc` / `ed_delete`.
2. **Phase 1, shell**: F9 toggle, `--editor` and the console command, archive reload on entry, simulation pause, free camera in Far Sight mode (lit, through walls; with editor pitch), 320x200 composite, status bar.
3. **Phase 2, object navigation**: Head/Next/Link/Back cursor, 3D picking, Show.
4. **Phase 3, object editing**: Item, Comm, Class and critter pages; Move/Copy via Mv; Delete; Replace with brush; trap Set Target; editor markers.
5. **Phase 4, map pane**: top-down renderer with height colours, object dots, camera cone.
6. **Phase 5, palette and placement**: OBJECTS.GR palette with the group bar, ray-cast floor picking in 3D (built); the tile-index pick buffer is still needed for wall faces.
7. **Phase 6, saving and menu**: Escape popup, Save/Revert/Change level/Play, archive writer, dirty flag, backup.
8. **Phase 7, terrain**: tile and terrain mode, texture painter, fill.
9. **Phase 8, search and cut/copy**: recovered find-next, criteria, validation searches, region copy.
10. **Later**: replace the fullscreen boolean with a viewport struct so the 3D pane can match the original's aspect.

### Testing

- Unit tests (Unity) for every mutation, asserting VALIDATE and free counts, with undo restoring state byte for byte. Include deleting a multi-object tile head, nested containers, class-7 scheduler objects, a full free list, fills across doors and platforms, and slot edits.
- Regression demos (`demos/editor_*.txt`) using `CONSOLE EDITOR on`, `SDLCLICK`, `SCREENSHOT` and `VALIDATE`, under ASan.

### Open questions

- What the starburst, eye and two lettered icons really did.
- Tile type enum values, floor height bit width, and the floor-height-to-zpos scale.
- ~~Exact texture slot counts and where the ceiling texture is stored.~~ Answered: 48 wall slots into W64.TR's 210 textures, 10 floor slots into F32.TR's 52 (low-resolution copies in W16.TR / F16.TR), and the ceiling is the last floor slot (9); changing it changes the ceiling in the 3D view.
- Whether the owner field matches an individual NPC or a faction.
- Which quality/owner bits hold a trigger's target tile.
- Which caches must be invalidated after tile geometry changes.

## View modes (the Eye button)

The Eye button opens a view-options panel of visibility toggles for what the 3D pane draws. To start, three buttons set the editor view mode:

| Mode | What the 3D pane draws |
| --- | --- |
| **Preview** | Exactly what the game would: invisible objects, traps and triggers stay invisible |
| **Triggers** | As Preview, but every invisible object (the invisible flag, traps, triggers) draws as an editor sprite |
| **Markers** | Every object draws as an editor sprite (its icon as a billboard), so the whole level reads as a map of things |

- Editor sprites are icon billboards (from OBJECTS.GR, by object ID) that are drawn in the 3D pass, so they land in the pick buffer and can be clicked and selected like any object. In Triggers and Markers mode picking finds them too.
- The mode shows in the status bar and is kept while the editor is closed and reopened. More toggles (lighting, ceiling and so on) can join the panel later; the panel is where they go.
- Preview is the default.

## Build status

Updated as work lands; the phases above say what each item is, this says what exists.

- **Built:** F9 / `--editor` / `editor` entry, the 320x200 screen, Far Sight camera (flies through walls, game keys), object selection and picking (objects by pick buffer, floor by ray cast), Head / Next / Link, Move / Copy / Delete / Show with the Mv slot, object placement from the group palette, the selected-object editor (position, height, heading, Item / Comm / Class field pages), the map pane (pan, dots), the master-archive workflow (reload on entry, Save into `DATA\lev.ark` with a one-time `.BAK`, Play copies it to `SAVE0`), VALIDATE, and undo / redo (Ctrl+Z, Ctrl+Y; 64 steps of arena + scheduler table + texture map, with a byte-for-byte self-check, `EDITOR selftest`) and the unsaved marker, and the Escape menu (Save, Revert, Change level with Page Up / Page Down, Play, Exit; Save / Discard / Cancel when there are unsaved edits; Escape first cancels a pending Move or Copy).
- **Also built (object mode):** Back, Replace with brush, Move / Copy into containers (Link with an object held), the Comm page as COMOBJ.DAT type data and the Class page as OBJECTS.DAT class tables (melee, ranged, armour, creatures, containers, lights; red-framed, game-wide; type edits are written to the data files on Save, patching only the edited fields, with one-time `.BAK` copies), the Item page for an object's own fields (items, creatures, and trap and trigger parameters with Set Target), and type view (right-click a palette icon). The Item tab shows an object's own fields, so for a creature it shows the creature fields.
- **Mode column:** wired. Each of the eight buttons selects a mode with its own bottom panels (`M_TILE`, `M_TEXTURE`, `M_OBJECT`, `M_VIEW`, `M_FIND`, `M_CUTCOPY`, `M_PASTE`, `M_FILL`); only object mode has panels so far, the rest show a placeholder until their items land.
- **Picking walls and floors:** done with the same ray cast as the floor (no renderer change): `view_ray_hit` reports the floor, a face of a solid tile (west, east, south, north; the tile whose wall texture it is) or the ceiling, with the hit point. A click on a floor or wall selects that tile. Floors are taken as flat at their tile's height, so slopes are approximate. `EDITOR selftest` checks a wall face, the floor and the ceiling.
- **Tile and terrain mode:** built. A palette of the ten tile types (BUTTONS.GR swatches 33 to 42), a brush of type, height and flags with a scope (Type / Height / Flags toggles), freehand strokes on the map or the 3D floor and walls, Shift-drag rectangles, Ctrl-click eyedropper, Raise / Lower for the selected tile, a side view of the row's floor heights, one undo step per stroke, and consistency checks after each stroke (objects on a solid tile, objects below a raised floor, door flag without a door object or the reverse, a diagonal with no open side, a slope whose ends are level - a heuristic - and the camera inside a wall); Fix lifts objects to the floor and moves objects off solid tiles. The renderer builds a tile's geometry from the tile word each frame, so a redraw is the only cache to refresh (plus the NPC path cache). Auto-slope between heights is not built.
- **Texture painter:** built. Wall / Floor slot palettes with usage counts, W tex / F tex lists of the global textures (a texture with no slot is given a free one, or the slot that already shows it is picked), slot editing that asks first when tiles use the slot, the ceiling picker (floor slot 9), painting on the map or in 3D with the Wall and Floor tabs (a floor click paints floors, a wall click walls), Ctrl-click eyedrop, and undo that reloads the textures. Not built: hover highlight, select all tiles using a slot, compact unused slots.
- **Fill tool:** built. Paint target (floor texture, wall texture, both, tile type) and spread rule (same floor texture, same wall texture, same height, same type, any open tile), breadth-first over the 64x64 grid with 4-connectivity, stopping at door tiles unless Through doors is on, diagonals and slopes painted but not spread from, a hover preview and a flash of the filled tiles on the map, Shift-drag rectangle fill, one undo step; it works from the map or the 3D view. A solid tile joins a fill only when the spread rule is a wall texture or a tile type (otherwise the walls of a room would never be reached).
- **Not built yet:** the Eye view modes and editor markers, mode-button wiring, Find, cut / copy.
- **Dropped for now (by request):** the map view cone and zoom, and the viewport struct.

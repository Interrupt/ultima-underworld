*Architecture analysis*

# A decompiled Pocket PC game, running natively

This codebase is a Ghidra decompile of `UU.exe`, the Windows CE build of Ultima Underworld 1, cleaned up until it builds and plays on a modern machine over SDL2. Most of what follows is how the original engine worked, read from the code. The rest is the layer the port added around it.

**Contents**

- [How objects work](#how-objects-work)
- [Levels, resources and saves](#levels-resources-and-saves)
- [How triggers, traps and doors work](#how-triggers-traps-and-doors-work)
- [NPC AI, combat and movement](#npc-ai-combat-and-movement)
- [Spells and player state](#spells-and-player-state)
- [How rendering works](#how-rendering-works)
- [The game loop and input](#the-game-loop-and-input)
- [HUD, character creation, conversations, audio](#hud-character-creation-conversations-audio)
- [Decompilation patterns, tests and tooling](#decompilation-patterns-tests-and-tooling)
- [Five bug classes that keep recurring](#five-bug-classes-that-keep-recurring)
- [Surprises and open questions](#surprises-and-open-questions)

- **55** C files in `src/`
- **80.5k** lines of C
- **~45** headers, one per module
- **1,521** commits since the raw decompile
- **69** unit-test files

### Conventions to know before reading any file

- **Names.** Functions and globals still carry Ghidra names (`FUN_0003f95c`, `DAT_00201c70`) until someone identifies them. A renamed function keeps a `// was FUN_…` comment. About 11,900 `DAT_` and 1,370 `FUN_` tokens remain.
- **Units.** Yaw is a 16-bit angle where 65536 is a full turn. Heading is yaw>>13, so 8 sectors. Player position is in 1/256 tile.
- **Module shape.** Each `.c` has a matching header that declares its functions and owns its extern globals. `uw.h` holds only shared types and macros.
- **Comments are history.** Many comments record what Ghidra got wrong (“was `int`, truncated the pointer”). They are the best map of where the bugs were.

### Module map

| Area | Files (lines) | Role |
|---|---|---|
| World | objects 1915, object_actions 1868, containers 998, level 426, doors 300, scheduler 650 | Object arena, chains, containers, door and effect timing |
| Events | traps 1375, interact 974, item_use 3565 | Trigger and trap dispatch, look/use/get/drop |
| Actors | ai 5173, combat 2445, weapon_swing 813, spells 975 | NPC state machines, damage, swing charge, spell effects |
| Player | player 3844, movement 2483, collision 892, input 1738 | Stats, physics sweep, key decoding |
| Render | visibility 1558, tmap 2316, 3d 2054, models 3020, models_dos 1113, lights 401, graphics 1580, bitmap 855 | Flood fill, tile geometry, rasterizer, object models, shading |
| Data | resources 2022, saveload 1342, file_io 279, text 554, automap 1054 | GR/PAK/ARK loaders, save format, path mapping |
| UI | hud 6003, game 2634, chargen 1592, babl 7058, audio 5127 | Panels, main loop, character creation, conversation VM, sound |
| Platform | gx_stub 1340, ordinal_stubs 1081, platform_music/sfx/voice/dosmidi, mouselook | WinCE services rebuilt over SDL2 |
| Tooling | options, debug_ui, debug_shim, demomode, democapture, unit_test_hooks | Flags, debug panel and console, scripted playback, test harness |

The original single file `uw.c` no longer exists. Every function and global was split out into the modules above. The README now says so too, and names ARM as the binary's CPU.

*Game data*

## How objects work

Everything in the dungeon that is not floor or wall is an object: items, doors, critters, traps, thrown spears, spell flashes. Objects are small fixed-size records in one arena, addressed by a 10-bit slot index and joined into linked lists. There are no pointers on disk, so a level saves by copying the arena.

### The 8-byte header

Every object starts with four 16-bit words (`uw_object_hdr_t`, `uw.h`). Fields are shown most significant bit first.

*word 0 · type_flags*

| quant (1 bit) | invis (1 bit) | door dir (1 bit) | ench (1 bit) | flags_res (3 bits) | object_id (9 bits) |
|---|---|---|---|---|---|

*word 1 · position_word*

| xpos (3 bits) | ypos (3 bits) | heading (3 bits) | zpos (7 bits) |
|---|---|---|---|

*word 2 · chain_word*

| next (slot index of the next object in the same list) (10 bits) | quality (6 bits) |
|---|---|

*word 3 · link_word*

| link (quantity, or head of contents) (10 bits) | owner (6 bits) |
|---|---|

Heading in word 1 counts 45° steps, and xpos/ypos are the 0–7 position inside the tile. In word 3, `link` means a quantity when the quantity bit is set, and otherwise the head of a contents or special chain. Bit 0x200 of a quantity marks “not a count”, which weight code reads as one.

### Classes come from the id

`object_id` is 9 bits, so 512 types. The class is `(id>>6)&7` and the subclass is `(id>>4)&3`. The code tests these ranges directly, in 60+ places for critters alone.

| Id range | Class | Used for |
|---|---|---|
| 0x000–0x03f | 0 · weapons, armor | `use_object_on_target` subclass 1 applies trap damage |
| 0x040–0x07f | 1 · critters | Test `(id & 0x1c0) == 0x40`. Low 6 bits index the monster stat table |
| 0x080–0x0bf | 2 · containers, lights, food | Container is `(id&0x1c0)==0x80` with subclass 0 |
| 0x0c0–0x13f | 3–4 · wands and held items | Several handlers are no-op stubs |
| 0x140–0x14f | 5 · doors | `(id & 0x1f0) == 0x140`. Low nibble is open or closed |
| 0x180–0x19f | 6 · traps | See the triggers chapter |
| 0x1a0–0x1bf | 6 · triggers | Subclass 2 of class 6 |
| 0x1c0–0x1ff | 7 · effect objects | Animated overlays that the scheduler owns, spawned as `0x1c0 + group` |

Per-type properties come from two files read by `load_object_catalog_data` (`objects.c:921`). `comobj.dat` fills `g_object_type_props[512]` (11 bytes on disk, expanded to 13). `objects.dat` goes through eight loader slots into the monster table (48 bytes per critter), the melee, ranged, armor, container, light and animation tables, and the class 6 and 7 variant tables.

### The arena

All per-level state is one heap blob of 0x7c08 bytes, allocated by `init_level_object_arena` and laid out by `reset_level_object_arena` (`level.c`). Writing a level back to `LEV.ARK` is a single copy of it.

0x0000 `tiles · 64×64×4 B` | 0x4000 `mobiles · 256×27 B` | 0x5b00 `statics · 768×8 B` | 0x7300 … 0x7c08 `lists`

The last segment holds the two free-slot stacks (0x7300, 0x74fc), the active-mobile list (0x7afc), three counters (0x7c00–0x7c04) and the magic word `0x7577` at 0x7c06. A level whose magic is wrong ends the program with fatal error 3. The port appends the 28-slot inventory table and the scheduler table after 0x7c08, outside the saved region.

### Slot indices

A link is a 10-bit slot index stored in bits 6–15 of some 16-bit word, with the low 6 bits of that word left for other fields. Index 0 is null.

| Index | Meaning | Address |
|---|---|---|
| 0x000 | null |  |
| 0x001 | the player (mobile slot 1) | `mobile_base + 1×0x1b` |
| 0x002–0x0ff | mobile slot, 27 bytes | `mobile_base + idx×0x1b` |
| 0x100–0x3ff | static slot, 8 bytes | `static_base + (idx−0x100)×8` |

```
// objects.c · resolve_object_link — the primitive everything else is built on
if ((uVar1 & 0xffc0) != 0) {
  if (0x3fff < (uVar1 & 0xffc0))
    return (uw_object_hdr_t *)(DAT_002046c4 + ((uVar1 >> 6) - 0x100) * 8);
  return (uw_object_hdr_t *)((uint)(uVar1 >> 6) * 0x1b + DAT_002046b8);
}
```

`resolve_object_link` takes the *address* of any link word, so a tile record, an object's `chain_word` and a container's `link_word` can all be followed the same way. `encode_object_slot_index` is the inverse. Allocation pops a free stack (`alloc_object_slot(0)` static, `(1)` mobile). When the stack is empty it calls `despawn_objects_outside_radius` and retries. That leaves 254 usable mobile slots and 766 static ones.

> **Fixed in the follow-up.** The comment on `get_object_record_by_slot_index` used to say “256 static + 768 mobile”, the reverse of the code. It now says 256 mobile and 768 static. The mobile-range test was named `object_ptr_in_arena`, which read as “is in the arena” although both tables are. It is now `object_is_mobile`.

### Lists: tiles, chains, containers

Objects on a floor tile form a singly linked list. The head is `obj_head` in the tile record, and each object's `next` points onward. A container uses the same machinery one level down.

**tile word 2** obj_head → object A → **object A** chain_word.next → object B → **object B (a sack)** link_word.link → first item inside → **item 1** chain_word.next → item 2 …

So `+4` is “next sibling” and `+6` is “first child”. The recursive free routine shows it plainly: it recurses on `&next` and on `&link_word`. `object_list_insert_head`, `object_list_append_tail` and `object_list_unlink` all take a link-field pointer, which is either the tile word or a previous object's `chain_word`. Unlink gives up after 0x400 hops.

### Mobile and static objects trade places

Critters need 27 bytes of state, so they live in mobile slots. So does any item in flight. A thrown spear or a dropped item falls as a mobile with `precise_x/y/z` and a speed. When it stops, `sync_object_tile_position` calls `settle_mobile_to_immobile`, which copies the header into an 8-byte static slot and frees the mobile one. `reallocate_object_to_arena` promotes in the other direction. The overlaid projectile record (`uw_projectile_object_t`) reuses bytes that an NPC uses for goal and target, and restores `original_heading` when it settles.

### The mobile record

| Offset | Field | Notes |
|---|---|---|
| 0x08 | npc_hp |  |
| 0x09 | full_heading | 256 directions |
| 0x0a | movement_flags | tick_phase (4 bits) and movement_mode (3) |
| 0x0b | goal_word | npc_goal 4 · npc_gtarg 8 (target slot) · animation_frame 4 |
| 0x0d | status_word | level 4 · loot_spawned · talkedto · attitude 2 |
| 0x0f | target_word | target tile x 6, y 6 · swing_charge 4 |
| 0x11–0x15 | recent_damage, damage_source, motion_flags, attack_pitch, animation_flags |  |
| 0x16 | tile_word | path_slot 4 · home y 6 · home x 6 |
| 0x18–0x1a | heading_flags, npc_ai_flags, npc_whoami | whoami links to conversation scripts |

### Look, get, use, drop

- **Picking.** `pick_object_under_cursor` (`interact.c:863`) re-renders the view in pick mode and reads a per-pixel id byte (see the rendering chapter). The id maps back to a slot, then to a record.
- **Cursor modes** index a five-entry table: use, attack, look, get, talk.
- **Look** builds “You see …” from the type properties, a quality word, an article, the quantity and the owner, then fires trigger action 5.
- **Get** checks range and line of sight, offers to split a stack, checks carry weight, unlinks the object from its tile, and hangs it on the cursor (`g_selected_object`).
- **Use** switches on class in `use_object_on_target` and ends by firing trigger action 4.
- **Drop** has two paths. A throw spawns a projectile mobile. A drop projects a position by heading, checks clearance, appends to the tile list and calls `settle_dropped_object`.

### Inventory and open containers

The player's gear is 28 two-byte links (`g_equipped_items`, `g_backpack_slot_table`).

| Slots | Holds |
|---|---|
| 0–4 | armor |
| 5–10 | shoulders, hands, rings (slot 8 is the ready weapon) |
| 11–18 | the eight backpack cells |
| 19 | the open-container indicator |
| 20–27 | the visible container grid, first slot is the scroll start |

Opening a sack pushes a record on `g_open_container_list` and fills slots 20–27 from its contents, skipping objects with the invisible bit. Scrolling moves the window by rewriting slot 20. The open sprite is the closed id plus one, so open and close add or subtract one from the low id bit.

> **Port-specific.** The original open-container record was 12 bytes with 4-byte next and prev pointers. The port made it 28 bytes with 64-bit links at +0xc and +0x14. The old fields are never written.

*Game data*

## Levels, resources and saves

### Files

| File | Contents |
|---|---|
| DATA/LEV.ARK | The nine dungeon levels (see below). 290,864 bytes |
| DATA/CNV.ARK | Conversation scripts |
| DATA/STRINGS.PAK | All message text, Huffman-coded |
| DATA/*.GR | Graphics: objects, doors, panels, weapons, textures-as-bitmaps |
| DATA/W16.TR, W64.TR, F16.TR, F32.TR | Wall and floor texture archives |
| DATA/PALS.DAT | Eight palette banks of 768 bytes |
| DATA/SHADES.DAT, LIGHT.DAT, XFER.DAT, MONO.DAT | Shading and colour-remap tables |
| DATA/COMOBJ.DAT, OBJECTS.DAT | Object property tables |
| DATA3D/*.E | About 30 ASCII 3D model scripts |
| CRIT/, CUTS/, SOUND/ | Critter pages, cutscenes, MODs, WAVs and the SFX bank |
| SAVE0 … SAVE4 | Save slots (SAVE0 is the live session) |

Game code still builds DOS paths like `"\\SAVE0\\lev.ark"`. `resolve_path` in `file_io.c` strips the slash, splits on either separator and walks each component under `--data-dir` with a case-insensitive match. A component that does not exist passes through unchanged, so new save files can be created. Win32 file calls are shimmed on top, with handles as indices 1–63 into a table of `FILE*`.

### LEV.ARK

The archive is a little-endian u16 count, then that many u32 absolute offsets. There is no stored size. A length is the distance to the next higher offset. Writing an entry of a new size rewrites the whole file through `_arc.tmp`. Levels are numbered 1–9.

| Entry | Content | Bytes |
|---|---|---|
| level − 1 | The arena: tiles and objects | 0x7c08 |
| level + 8 | Scheduler table (64 × 6 bytes) | 0x180 |
| level + 0x11 | Texture ids: 48 wall, 10 floor, 3 more words | 0x7a |
| level + 0x1a | Automap reveal grid, 64×64 | 0x1000 |
| level + 0x23 | Automap notes | varies |

The shipped file has entries 0–26 only. The last two kinds appear after a first save.

### The tile record

*word 0*

| door (1 bit) | no magic (1 bit) | floor_tex (4 bits) | — (1 bit) | light (1 bit) | floor_height (4 bits) | tile_type (4 bits) |
|---|---|---|---|---|---|---|

*word 2*

| obj_head (first object slot on this tile) (10 bits) | wall_tex (6 bits) |
|---|---|

Tile types run 0–9: solid, open, four diagonals and the slopes. `tilemap_lookup(x, y)` (`tmap.c:1141`) is `arena + (x + y×64)×4` and returns NULL outside 0–63. Many callers carry a NULL guard added during the port.

### Loading and switching levels

- `start_game_with_current_character` copies `DATA/LEV.ARK` to `SAVE0/lev.ark`. The shipped archive is never written. All live world state is in the working copy.
- `load_level(n)` saves the player record, opens the archive, loads the arena, restores the player, then loads the texture ids and the automap grid and resets the NPC path cache.
- `transition_to_level(from, to)` runs the special-state save, `commit_level_to_save_slot(from)` (which frees the live inventory objects, then writes the arena, texture ids and reveal grid), then `load_level(to)`.

### Resources

- **.GR files.** A format byte, a u16 count and `count+1` u32 offsets. Each entry is raw (header byte 4) or RLE. `load_gr_resource_entries` is the shared loader, and `g_grtile_registry` caches captured screen rectangles by key.
- **Strings.** `get_message_string(id)`: the page is bits 9 and up, the index the low 9. A two-page cache is checked first. A miss decodes `STRINGS.PAK` by walking its Huffman tree bit by bit until byte 0xFF or `|`. Results rotate through a 4 KB ring of 0x200-byte slots, so a returned pointer is only good until a few more lookups happen.
- **Critters.** `uw_load_critter_page_cached` builds `CRIT\CRppPAGE.Nxx` names with octal digits, and remembers files that failed to open.
- **Fonts** are read raw: a 12-byte header then 0x1080 bytes of glyphs.

### Saving

A slot is four files: `lev.ark`, `bglobals.dat` (conversation globals), `player.dat` and `desc` (description text). The player record is the 27-byte player object, then the inventory re-encoded as 8-byte records. `serialize_inventory_link_chain` copies each item's four header words into a fresh slot from `alloc_save_record_slot`, writes that new index into the link field and recurses into containers. `deserialize_inventory_link_chain` allocates live slots and rebuilds the chains.

> **Swapped names.** In `saveload.c`, `load_game_from_slot` copies the live session *into* the chosen slot, which is a save. `save_game_to_slot` only prompts for the description. The code comments say so outright.

The port appends a 220-byte stats block (`DAT_0023bca8`) to `player.dat`, marked in code as a requested deviation from the original. Saving is refused while holding a cursor item and on level 9.

### DOS data

If `UW.EXE` is in the data directory, `models_dos.c` finds a table of 32 model offsets by scanning for the byte signature `b6 4a 06 40`. It decodes the DOS bytecode and re-emits each model as `.E` text, so the PocketPC parser can read it. Without that file the loader reads `DATA3D/*.E`.

*Behaviour*

## How triggers, traps and doors work

Triggers and traps are ordinary objects in class 6. A trigger decides *when*. A trap decides *what*. A link in the trigger names the trap, and a trap can link onward to another trap or trigger. id & 0x3f

**Something happens** step on, use, look, pick up, destroy → **Trigger** id 0x1a0–0x1bf. Fires if its subclass table entry equals the action code → **Trap** id 0x180–0x19f. Kind is → **Next link** another trap (recurse) or trigger (re-dispatch)

The link is the quantity-as-link trick: a trap's `link` field (`+6`) is followed with `resolve_object_link` only when the quantity bit is clear and the link is nonzero. The target tile for effects like teleport comes from the trigger's own fields.

### What fires them

An action code travels from the call site to the trigger. A trigger fires only if `table[id & 0xf] == action`, using a 16-byte table loaded from `objects.dat` (`DAT_0024cfe0_backing`).

| Code | Call site |
|---|---|
| 0 | A player or mobile walks onto it (`begin_directional_move`, `resolve_collision_candidate_interaction`) |
| 2 | `finalize_object_pickup` |
| 4 | Item use or destroy |
| 5 | Use or search, and look. Also lock-forcing in `spells.c` |
| 6 | `object_actions.c:616` |
| 7 | A door closing; also `item_use.c` |
| 0xffff | A trap handing off to a linked trigger |

Use, look, pickup, drop and destroy all funnel into `trigger_object_trap_or_use_action` (`item_use.c`), which finds the object's class 6 child. Walking onto a trigger is handled in the collision sweep: the player path looks for the “move trigger” id `0x1a0`, and mobiles use the same test for the whole 0x180 class. `process_nearby_background_traps` also fires traps within seven tiles of the player on a timer. I found no separate enter and leave events beyond the step-on sweep.

**[unverified]** Which subclass maps to which action depends on bytes read from `objects.dat` at run time, and I did not decode them.

### Dispatch

Entry is `apply_trap_or_link_effect` (`interact.c`). It records the actor and trigger in two globals, but only if none is recorded already, so a trap cannot re-enter itself. It calls `dispatch_trap_type_effect` (`traps.c:35`), a switch on `id & 0x3f`, and always returns 0.

| Kind | Effect | Implementation |
|---|---|---|
| 0 | Damage | `apply_poison_or_damage_trap_effect`, sign from `owner` |
| 1 | Teleport | `teleport_object_to_level_tile` |
| 2 | Arrow or hazard | `spawn_trap_hazard_object` |
| 3 | Scripted quest event | `dispatch_quest_event_code`, sub-switch on a 6-bit code |
| 4 | Pit | Empty, falls through to chain follow |
| 5 | Change terrain | `apply_area_terrain_effect` |
| 6 | Spell or tile special | `execute_spell_effect` or `dispatch_tile_special_action` |
| 7 | Create object | Random-gated; returns 2 without chaining |
| 8 | Door control | Quality 1 close, 2 open, 3 toggle |
| 9, 10 | Ward (dart) | Damage `rand + 3`, message 0x2f5 |
| 0xb | Delete | `unlink_and_free_object` |
| 0xc | Inventory check | `find_equipped_item_by_category` |
| 0xd | Set variable | Bit and arithmetic ops on a player-state array |
| 0xe | Check variable | On mismatch, runs the linked trigger's chain |
| 0xf | No-op |  |
| 0x10 | Text | `get_message_string` then scroll print |

Kind labels for 5, 6, 8, 9 and 10 come from how the fields are used, not from names in the binary. **[unverified]** against the original.

> **Surprise.** NPC path planning triggers wards. `ai.c` pre-scans the tiles of a computed path and runs any linked kind-9 trap it finds, so a monster can set one off by planning a route.

### Levers, switches, pull chains

There is no lever code. A lever is a normal object with a class 6 trigger child. Using it is action 5 or 7, and it ends at a door-control or delete trap. A pull chain behaves identically.

### The scheduler is an effects queue

`scheduler.c` animates class 7 objects (`0x1c0–0x1ff`): door swings, spell flashes, blood. It is not a general event scheduler, and spell durations are not in it. The table has 64 entries of 6 bytes.

```
// scheduler.c · scheduler_tick — delay −1 means run forever
iVar2 = *(short *)(&DAT_0025077a + iVar1) - iVar4;
if (iVar2 * 0x10000 >> 0x10 < 0) {
  scheduler_finish_entry(iVar3);
}
else { scheduler_step_entry(iVar3,iVar4); ...
```

- `scheduler_step_entry` reads `g_animation_type_props[id & 0xf].flags`. Bit 1 advances a frame, bit 2 picks a random one, bit 4 advances a swing.
- `scheduler_finish_entry` handles the in-motion door object `0x1cf`. It checks clearance. If something blocks the door it plays sound 0xc and reverses. Otherwise it commits the final state.
- When the table is full, `scheduler_add_entry` returns −1. Spell callers free the object. Other callers' handling is unverified.
- The table saves per level at archive entry `level + 8`.

### Doors

A door is class 5. Its low id nibble is its state, and the door becomes object `0x1cf` while it swings, owned by the scheduler. `close_door_object` and `open_door_object` start the animation (type 4 for a portcullis, 5 otherwise). Sound 0x14 is a portcullis and 0xb a door. A lock is a class 6 trigger child with `id & 0x3f < 3`. `attempt_pick_lock` rolls the skill check. Keys are matched in `resolve_skill_gated_unlock_or_use`. `tick_ambient_doors_and_scheduler` randomly opens out-of-range doors (30% each pass).

**[unverified]** The names `open_door_object` and `close_door_object` look inverted against the state check in their non-swinging branch, and I did not resolve it. I also found no auto-close timer, only the swing animation delay.

### What calls all this, each tick

1. `movement_pacing_handler` runs once per frame. It calls `scheduler_tick(elapsed)`, then `movement_tick`, which sweeps the player and ticks NPCs.
2. A held-key step calls `begin_directional_move` (step-on triggers fire here), then `scheduler_tick(1)`.
3. Resting and level entry run `tick_ambient_doors_and_scheduler(0)` and `process_nearby_background_traps(0)`.
4. `update_player_tick_effects` runs about every 20 clock units and now and then calls `process_nearby_background_traps(1)`.

*Behaviour*

## NPC AI, combat and movement

### Time

`movement_pacing_handler` clamps elapsed time to 0x40 clock units and advances the game clock stored in the player record. By the comment at `ai.c:895` the original game tick is 16 units. Each frame it calls `movement_tick`:

1. `decode_movement_command` if no movement mode is active.
2. `apply_movement_tick`, the player's collision sweep.
3. `tick_mobile_objects` for NPCs and projectiles, if `g_npc_tick_enabled`.
4. Footstep and jump sounds.

Each mobile runs only when `object_tick_is_due` says so, from a 4-bit phase in its record and a speed class in its pitch byte. Category 0x40 goes to `npc_ai_tick` and everything else to `mobile_object_tick`. `--physics-fps` is a port addition that steps non-NPC mobiles at a finer rate.

### NPC AI

`npc_ai_tick` (`ai.c:665`) publishes the current NPC and its stats into globals, then:

- If the NPC is over ten tiles from both camera and player, it only advances its phase.
- It runs the shared collision sweep, the same one projectiles use.
- It reads `goal_word & 0xf`. Animation state 0xc is the death animation. At its end the NPC unlinks, drops loot and frees its slot.
- Otherwise `npc_ai_default_tick` switches on the goal.

| Goal | Handler (names inferred from code) |
|---|---|
| 0, 4, 7 | `npc_notice_and_idle_tick` |
| 1 | `npc_walk_toward_tile` |
| 2 | `npc_idle_behavior_tick` |
| 3 | `npc_combat_approach_tick` |
| 5 | `npc_combat_engage_close_tick` |
| 6 | `npc_combat_position_tick` (also the flee goal) |
| 8 | `npc_wander_return_home_tick` |
| 9 | `npc_combat_engage_wide_tick` |
| 10 | `npc_combat_disengage_tick` |
| 0xb, 0xc | Random wander and return home |

Attitude 0 means hostile. Being hit sets it to 0. `npc_notice_and_idle_tick` then targets the player and `refresh_npc_target_delta` computes distance in tiles and in 1/8 tiles. Noise wakes NPCs: `apply_damage_to_object` records player noise in globals, and an NPC compares it with its `awareness_ranges`.

Fleeing is `check_npc_morale_flee`. It never flees above 3/4 of morale in hit points or below 1/8. In between it rolls `rand%4 + morale/(hp×16)` against `0xf − margin`. Casters switch to goal 5 instead.

Pathing is a breadth-first search (`creature_find_path_to_tile`, capped at 0x1f steps) with straight-line shortcuts first. Each NPC has a cached 0x1c-byte path record. Heading turns toward the goal by at most 0x20 units, 45°, per tick.

> **Verified original.** An NPC more than eight tiles from its tracked target does not walk. `npc_combat_approach_tick` unlinks it and relinks it at the target's tile, plus a term `(own tile − target tile) × 4 / fine distance` that integer division truncates to zero. The ARM disassembly at 0x2f944–0x2fb67 does the same, so this is the shipped game's behaviour. It fits the AI cull, which skips NPCs far from both camera and player unless they are in goal 3.

### Combat

One pipeline serves both sides. The player's swing is a state machine on two globals. While the button is held, charge rises by the weapon's rate every 0x10 clock units up to 100, and on release melee damage is `d3 + (d5 − d3) × charge / 100`.

```
// player.c · roll_skill_check — the skill roll used everywhere
uVar2 = ce_rand();
uw_ord2005_rem_127 = ((int)(uVar2)) % (0x1f);
iVar1 = ((uw_ord2005_rem_127 - difficulty) + skill) * 0x10000 >> 16;
```

The total `rand%31 − difficulty + skill` falls into four buckets: under 3 is a critical failure, 3–15 a miss, 16–28 a hit and 29 or more a critical hit.

- **Attack stat** (`compute_player_weapon_attack_stats`): skill + attack/2 + dex/7.** Damage**: weapon damage + strength/9. Bare hands use strength/6 plus terms of their own.
- **Hit** (`process_melee_attack_swing`): `resolve_melee_swing_hit` projects a box in front of the attacker and finds the target. The roll is the attack stat against the target's defense. A critical hit multiplies damage by 1× or 2× and wears the player's gear.
- **Damage** (`apply_melee_damage`): `d/6` six-sided dice plus one die of `d%6`, then subtract the armor for the hit zone.
- **Apply** (`apply_damage_to_object`): adds `recent_damage`, records the attacker and noise, subtracts hit points and on death calls `handle_monster_death` and awards experience.
- **NPC melee** (`resolve_npc_melee_attack`): damage is `attacks[i].damage + strength/5`, then the same pipeline. Rage adds attack and damage.
- **Ranged** (`fire_ranged_weapon`): consumes ammo, copies its fields into a projectile mobile and frees the ammo slot.

### Player movement

Held keys set a movement mode, and `resolve_move_vector` (`input.c:183`) turns the mode into a travel angle and step. Modes include stop, analog move and turn, jump, back, strafe (±0x4000, a quarter turn) and fly. The port adds modes 0x10–0x13 for strafing while walking.

- **Position** is in 1/256 tile. The sweep itself works in coarser 1/8-tile units with sub-unit accumulators.** [unverified]** The exact conversion between the two is not reconciled here.
- **Sweep** (`movement_sweep_setup` and friends): velocity is `speed × sin or cos >> 15`. The player carries the rounding remainder between frames, which the code marks as a port fix against heading drift.
- **Wall slide** picks among eight octant headings. `--wall-turn` scales how much a wall nudges the player's yaw (`0x400 × scale`, default 0.1, 1.0 is the original).
- **Jump and fall.** Vertical velocity seeds vary with foot height. Fall acceleration is −4, or −2 under slow fall.
- **Locomotion.** A collision mask picks wading, swimming or airborne profiles. A bit field set by equipped item effects gives slow fall, levitation and others. Drowning accumulates a counter and damages past 0x78.

### Collision

`collision_build_height_field` builds a 5×5 corner height field around the mover. `collision_height_envelope` merges tile floors and ceilings with up to nine object candidates (`collision_add_candidate_object`), kept in six parallel byte arrays with a 6-byte stride. Each candidate stores top Z, base Z, a slot with flags and a tile offset. A radius of 4 means the object fills the tile, otherwise it is a box of ±radius in 1/8 tiles.

> **One thing to watch.** The nine-candidate guard silently drops the rest. The comment on `sort_collision_candidates` used to say it sorts by X then Y. The bytes it compares are top Z and base Z, so it orders by vertical extent, and the comment now says so.

*Behaviour*

## Spells and player state

### Casting

Spell input lives in `hud.c`, not `spells.c`. The rune bag is a 24-bit mask in the player record. Clicking a rune moves it into one of three ready slots, and a full set pushes the oldest out. `handle_cast_spell_click` packs the three runes as `r1×0x400 + r2×0x20 + r3` and scans a 48-entry table at `DAT_00087530` for a match, 4 bytes per entry: action type, rune key and a parameter. No match prints “Not a spell”.

`cast_spell_from_rune_combo` then applies the rules:

1. Circle is `index/6 + 1`. You need `(level+1)/2 ≥ circle`.
2. Mana cost is `circle × 3`.
3. It rolls `roll_skill_check(skill + 5, circle × 2)`. A critical failure swaps in a weaker effect.
4. `execute_spell_effect(action, arg, actor, target)` dispatches on the action type. Failures print message `0xd2 + code`.

`execute_spell_effect` (`spells.c:27`) refuses on no-magic tiles and on level 9. Action types: 0–3 light, 4 heal, 5 targeted (the player gets a cursor to pick a target), 6 cone damage, 7 detect, 8 summon, 9 reduce item quality, 0xa and 0xd level-specific hazards and puzzle buttons, 0xb a player command, 0xe a book page. NPC spells go through a ten-function table, `dispatch_tile_special_action`, which is how a trap or a monster casts.

### The player record

`DAT_00086df8` is the player status block. The offset names below are inferred from use, not from a struct.

| Offset | Holds |
|---|---|
| 0x1f–0x34 | Strength, skills and the swim skill |
| 0x37, 0x38 | Current and maximum mana |
| 0x39 | Hunger |
| 0x3d | Level |
| 0x44–0x49 | Rune bag mask, then the three ready-rune slots |
| 0x4c, 0x4e, 0x52 | Carry capacity, experience (32-bit), skill points |
| 0x5f–0x61 | Poison, light and rune counts, effect timers |
| 0xb9 | Submersion counter |
| 0xce | The 32-bit game clock |

`recalculate_player_stats` derives maximum hit points as `level × str / 5 + 30`, maximum mana as `(skill + 1) × int >> 3` and carry capacity as `str × 20`. Upkeep (`update_player_tick_effects`) runs about every 21 seconds by my arithmetic **[unverified]**. Every third call applies poison, every 24th lowers hunger by `3 + (rand&3)`. Light sources burn down in `decay_equipped_light_sources` by the fuel stored in the item's chain word, and a spent torch drops four ids to its unlit type.

*Presentation*

## How rendering works

The renderer is a software rasterizer for a tile world, written for a handheld CPU. It floods outward from the player to decide which tiles can be seen, turns each visible tile into a few textured quads, projects them, and fills triangles pixel by pixel. There is no z-buffer. Correct overlap comes from drawing far tiles first.

### One frame

1. **Entry.** `main_loop_hud_flush` runs `render_dungeon_frame_timed` every loop pass. The original only drew when a dirty bit asked, so this forced redraw is a port change (`--no-force-3d-redraw` turns it off).
2. **Camera.** `build_frame_draw_list` finds the player's tile, picks the view quadrant (0–3) and rotates the world into a quadrant-0 frame. `sync_camera_from_player` fills the camera position, pitch and yaw globals.
3. **Visibility.** `seed_visibility_queue` and `run_visibility_flood` mark which cells of a 17×33 grid are visible.
4. **Tile walk.** `walk_visible_tiles` goes row by row from the farthest to the nearest and calls `process_visible_tile_cell`, which writes floor, ceiling and wall quads and then the tile's objects into `g_geom_arena`.
5. **Transform.** `render_dungeon_view` builds the view matrix, moves vertices to camera space, near-clips at w = 5.0 and projects.
6. **Raster.** `render_visible_tile_list` fans each polygon into triangles and calls `raster_triangle`. Each pixel is textured, shaded and written to the framebuffer.
7. **Present.** The HUD draws over it. The dirty rectangle is rotated into the device buffer, then un-rotated and uploaded to an SDL texture.

### The visibility flood

The flood works on a grid 33 cells wide. It starts with two rays, the left and right edges of the view fan, at the camera facing ± `0x2040` (about 45°). Row by row, `advance_visibility_ray` steps each ray, `merge_adjacent_visibility_rays` joins ones that meet, and cells outside each span are cleared. Cells between the surviving left and right edge get bit `0x80`, visible. Walls set face request bits in the same byte.

- Each cell is two bytes. Byte 0 holds visibility and face requests (`0x08, 0x20, 0x10` for three sides). Byte 1 holds a light nibble and neighbour edge bits.
- A cell with `(byte & 0x44) == 4` is a slope. `== 0x44` is a diagonal wall. **[unverified]** The exact bit meanings are inferred from use.
- If the player's own tile is NULL or type 0, the flood is skipped.
- How far you see is set by the light grid, `build_visibility_light_grid(size)`, which gives each cell a nibble 0–15. Cells past the size get 15. On level 1 the size is 4.

> **Port addition.** With `--near-tile-visibility` the edge rays widen as the camera pitches past 24°, up to `0x2e39` (about 65°) at 90°. Tiles beside and below the player stay visible when looking down. Wider than that pulls in so many tiles that the vertex cap drops the nearest floor, so the maximum is a compromise.

### Tile geometry

`process_visible_tile_cell` (`tmap.c:495`) first checks the arena guard. It skips the tile if vertices are within 28 of `UW_ARENA_MAX_VERTS` (now 600) or records within 6 of 490. Each quad is four vertices stored as float bit patterns, plus a record with the texture page, size and UVs.

- **Floor** corner heights come from `DAT_00085d20[floor_height + corner offset]`, with a slope variant. It is emitted only if the camera is on its visible side.
- **Ceiling** sits at a constant height of 1024.0 and is emitted when the camera is below roughly 0x3f5.
- **Walls** are one quad per requested side. Texture index is the tile's `wall_tex`.** Diagonals** are one quad between two corner offsets, back-face tested with a cross product.
- **Texture pages and detail.** The light nibble picks the detail level. Below a threshold from `SHADES.DAT` the tile gets the detailed textures, otherwise the 16×16 ones.

| Page index | Archive | Stride |
|---|---|---|
| 0x00–0x2f | W64 · 64×64 walls | 0x1000 |
| 0x30–0x39 | F32 · 32×32 floors | 0x400 |
| 0x3a–0x69 | W16 · 16×16 walls | 0x100 |
| 0x6a–0x73 | F16 · 16×16 floors | 0x100 |

`process_visible_tile_cell` also writes each tile's discovered shape into the automap reveal grid. A tile whose light nibble is 8 or more is not revealed, so darkness cannot map a floor.

### The rasterizer

`raster_triangle` (`3d.c:221`) rejects against the viewport, sorts vertices by y and sets up perspective gradients: 1/w, u/w and v/w. Edge x has 14 fractional bits. The span loop (`raster_textured_span`) divides per pixel, so it is fully perspective-correct. There is no affine subdivision.

```
// 3d.c · per-pixel texel, replacing the original truncated path (port fix)
if (local_38 > 0) {
  long long inv = local_38;
  long long nv = local_34, nu = iVar14;
  tex_v = nv >= 0 ? nv / inv : -((-nv + inv - 1) / inv);
```

Texel 0 is transparent. The pixel then goes through `shade_span_pixel` (`lights.c:308`) and lands in the RGB565 framebuffer. The projection is `x = 140 + 100·x/z`, `y = 80 − 0.9·100·y/z`. **[unverified]** The viewport is 224×132 at (52,19), so I do not know why the centre differs.

### Objects in the view

There is no separate sprite pass. Class 0 objects are camera-facing quads added to the same arena, with the texture from `decode_tile_object_billboard_texture`. Critters use `resolve_critter_sprite_tier` and the same quad. Wall decals face the wall instead of the camera. 3D models (doors, chests, benches, beds, shrines: 29 in all) go through `emit_catalog_object` and `emit_anim_object_frames`, rotated by a Euler matrix.

- A model's faces sort by centroid distance, farthest first, up to 256 faces (`--model-no-depth-sort` disables it). Nothing is depth-tested and there is no back-face culling for models. The `.E` files' BSP block is parsed and never used.
- A tile's objects sort with `sort_feature_pairs_by_depth` before `emit_tile_objects`.

### Lighting

- **Shade tables.** `load_shading_level_config` reads a 12-byte header per level from `SHADES.DAT`. `load_light_tables` reads `LIGHT.DAT` (16 rows of 256) and `XFER.DAT`.
- **Per pixel**, `--light-mode` picks the model. `dos` reads a `LIGHT.DAT` row. `linear` (the default) interpolates the rows' brightness. `smooth` uses `(1 − s²)² / (1 + F·s²)` with s = distance / max. Distance is radial: `depth × sqrt(1 + rx² + ry²)`.
- **Dither** is a screen-anchored checker, on by default.** Extra lights** (`--extralights`) add campfires, torches and other lit objects as point sources, in view space.
- **Palette.** `build_rgb565_palette` scales by `--brightness`. `dungeon_palette_cycle_tick` rotates water and fire groups every 250 ms.

### Framebuffers

Three buffers and one rotation sit between the rasterizer and your monitor. GXBeginDrawflush_dirty_rect_to_displayGXEndDraw

**g_uw_framebuffer** 320×240 RGB565, landscape. The game draws here → **Device buffer** 240×320 portrait, from .  transposes the dirty rect into it → **g_display_buf** un-rotates to landscape, overlays the desktop cursor, uploads to an SDL texture

The pick buffer `DAT_0023cca0` is a fourth, 320×200 bytes. The HUD sits on a sprite-list compositor (`flush_sprite_list_compositor`): 0x14-byte slots, two passes. Pass one restores each slot's saved backdrop. Pass two saves new backdrops and draws.

### Object picking

Clicking an object does not ray-cast. `pick_object_under_cursor` calls `render_dungeon_view_frame` in pick mode. In that pass `emit_tile_objects` gives each drawn object an id from 1 to 0xbf, and each span also writes that id into `DAT_0023cca0`. The code reads the byte under the cursor. Ids 1–0xbe map to objects. Ids 0xc0–0xfa map to wall and floor textures (`resolve_picked_terrain_texture`). The debug panel's “pick view” paints this buffer over the 3D view.

> **Worth knowing.** The original draw-command list (`DAT_00110fc0`) is still written by the `emit_*` functions, but I found no reader. Geometry goes straight into the arena. That is a grep result, not a full trace.

*Presentation*

## The game loop and input

### Startup

`main.c` calls `app_main_loop` (`game.c:249`), the old WinMain. It makes the window and a 0x25800-byte framebuffer, shows the splash, then runs `run_game_startup_sequence`. That sequence initialises the string cache, the object arena, key bindings, cursors, the object catalog, dungeon rendering, collision profiles and the sprite lists, then loads lighting and combat data and copies `LEV.ARK` into `SAVE0`. After it come `wait_and_show_intro_page` and `main_menu_loop`: new game, credits or load.

### Per iteration

1. **`PeekMessageW`** runs the SDL pump (`uw_pump_events`) and returns whether input is pending.
2. **`main_loop_hud_flush`** runs every iteration, message or not. It limits the frame rate, forces the 3D redraw, dispatches any set mode handlers, ticks the weapon swing, polls input bindings, updates the mouse, draws the debug panel and flushes the dirty rect.

Mode handlers are a 3×16 table of function pointers, one row per game mode (`DAT_00085668_real_table`). A pending-bit mask says which fire. Mode 0 (the dungeon) re-arms bits 11, 12 and 13 every frame, which are movement pacing, stat sync and HUD redraw. Mode 1 is the automap, mode 2 conversation. `change_game_mode` calls the old row's exit slot (15), then the new row's enter slot (0).

> **Two mode variables.** `g_game_mode` is the logical mode (1 gameplay, 2 automap, 4 conversation). `g_mode_handler_row` is the row selector (0 dungeon, 1 automap, 2 talk). They are set together by `set_game_mode` but are different values. Both were `DAT_00201b60` and `DAT_00201b64` until the follow-up renamed them.

### A Windows message layer that is not there

The original was driven by `GetMessage` and a dispatch table. The port keeps the call shapes but not the queue. `PeekMessageW` pumps SDL and returns `(DAT_0023c448 != 0) || a mouse event is pending`. `TranslateMessage` and `DispatchMessageW` are stubs. `uw_pump_events` calls `handle_keyboard_message` and `handle_mouse_message` directly. The dispatch table and the message thread still exist and are vestigial.

- **Clock.** `uw_service_game_clock` ticks 60 Hz and sets a dirty bit.
- **Keys.** `poll_dungeon_movement_keys` reads physical key state with `SDL_GetKeyboardState`, so WASD, arrows and Z/X/C act as held keys while in the 3D view. Space and letters arrive as `WM_CHAR` via text input, so typing a name works.
- **Mouse.** SDL landscape coordinates are rotated into the device's portrait space: `portrait_x = landscape_y`, `portrait_y = 319 − landscape_x`.

### Bindings and hotspots

Input is routed through two tables. `register_key_binding(key, arg, mode_mask, handler)` uses 12-byte records. `register_click_region(left, bottom, right, top, arg, mode_mask, handler)` uses 18-byte records. `poll_input_bindings` scans click regions from last registered to first and calls the first whose rectangle and mode mask match. Keys go to a linear scan.

Handler pointers are 8 bytes now but the records are the original size, so the real pointers live in side tables (`g_keybind_handler[512]`, `g_click_region_handler[128]`). The records keep only a low-32-bit copy for a non-null test. The roughly 94 registration calls are in `game.c:675–784`. `registration.c` is the code-wheel copy protection, not hotspots.

> **Port addition.** Mouselook (F) captures the pointer and edits yaw and pitch directly. It also updates the player's heading and fine-heading fields, because door-leaf placement and the compass read them. Q looks and E uses the object under the crosshair.

*Presentation*

## HUD, character creation, conversations, audio

### HUD

- **Right-hand panel.** `g_active_hud_panel` is 0 for equipment and inventory, 1 for the rune bag, 2 for stats. A page flip is `begin_hud_panel_flip` plus `advance_hud_panel_flip`, driven by `tick_hud_panel_transition`. A 13-entry table of tick functions covers the vitals flasks, compass, dragons and wipes.
- **Status values.** `set_hud_status_value(slot, value)` sets dirty flags. Slots 0 and 1 are health and mana flask tiers (0–12). Slot 2 is the compass heading. Slot 6 selects the panel.
- **Compass.** `hud_compass_needle_tick` steps the needle one of 16 notches toward the target each tick. The target is computed from the player's heading and fine heading.
- **Message scroll.** Two panel structs, normal and conversation, switched by pointer. `message_scroll_print_wrapped` wraps text, and `msg_scroll_more_prompt` shows the --MORE-- prompt. `scroll_text_entry_prompt` is the free-text field and sets `g_text_input_active`.
- **Inventory.** `handle_inventory_panel_click` hit-tests widgets and maps widget id to slot through `g_backpack_widget_to_slot`.

### Character creation

`character_generator_loop` (`chargen.c:150`) is an eight-state machine: sex, handedness, class, skill picks, portrait, difficulty, name, confirm. Each state redraws the parchment, draws the field value and options, and waits for input. The state order is from an inline comment. The port converts the DOS 0x12-byte `CHRGEN.DAT` records to the 0x14-byte layout on load. After confirmation, `start_game_with_current_character` writes the player record, copies the level archive, seeds conversation globals, loads level 1 and puts the player at tile (0x20, 2).

### Conversations: the BABL virtual machine

NPC dialogue is bytecode. `start_npc_conversation` (`babl.c:2242`) reads an entry from `CNV.ARK` into a 0x4000-byte buffer and builds a symbol table of 0x20-byte records. Code is a buffer of 16-bit words, the variable array and the stack share one allocation, and the first word must be `0x22`.

`run_babl_bytecode_interpreter` (`babl.c:1631`) is a switch over opcodes 0–0x29:

| Opcodes | Meaning |
|---|---|
| 1–8, 0x29 | Add, mul, sub, div, mod, or, and, not, negate |
| 9–0xe | Comparisons |
| 0xf–0x13, 0x15 | Jumps, conditional branches, call, return |
| 0x14 | Call a native function by import index |
| 0x16–0x19 | Push literal, push frame address, pop, swap |
| 0x1a–0x21, 0x25 | Frame and variable ops, string compare |
| 0x27, 0x28 | Say, respond |

Native functions bind by name through `babl_register_builtin`: about forty of them (`babl_menu`, `get_quest`, `set_quest`, `give_to_npc`, `do_offer`, `do_demand`, `setup_to_barter`, `gronk_door`, `set_attitude`, `x_skills` and more) plus string helpers. Named script variables such as `npc_whoami` and `npc_talkedto` are bound to NPC state. `sync_conv_vars_from_npc` copies state in before a run and `sync_conv_vars_to_npc` writes it back. Persistent globals live in `SAVE0/bglobals.dat`.

The VM runs synchronously inside the conversation screen's enter handler. `say` prints the NPC's text to the scroll, and a menu builds a numbered list and loops on `poll_input_bindings` until keys 1–4 or a click set the answer. `babl_builtin_ask` opens the free-text prompt. When the script returns, variables save and the mode goes back to gameplay.

**[unverified]** How the conversation entry id in `DAT_001007c4` is derived, and what the separate `babl_render_*` cluster does.

### Audio

The original sound code in `audio.c` is a full MOD tracker, and none of it runs. Its allocations stored 32-bit pointers, and the engine handle is deliberately never set. The port intercepts at the top of each API call and sends sound to four platform files.

| Kind | Default | DOS or hybrid mode |
|---|---|---|
| Music | `platform_music.c`: a MOD through the vendored hxcmod player. Track file number is `(track>>3)` and `(track&7)` as octal digits | `platform_dosmidi.c`: the track's XMI through a model of the AIL driver and an OPL2 chip, resampled to the device rate |
| Effects | `platform_sfx.c`: 36 WAVE resources extracted from `UU.exe`, mixed by a small voice mixer | Pure DOS plays an OPL2 note from `SOUNDS.DAT`. Hybrid keeps WAVs where they exist |
| Speech | `platform_voice.c`: `VOCnn.wav`, one voice at a time | DOS VOC |

One SDL device and one callback serve either music backend. The choice is made at init. In DOS mode the same OPL2 carries music and effects, so the callback does not stop when music stops. If `SOUND\UW.AD` exists in the data directory and no mode is given, hybrid is chosen. Positional gain and pan in `play_positional_sound_effect` are the original's.

> **Port addition.** `--music-volume` and `--sfx-volume` scale the converted music and the effects. In DOS mode music volume scales `--dos-music-volume`, and DOS-chip effects are not scaled.

*The port itself*

## Decompilation patterns, tests and tooling

### From Ghidra output to a program

- **K&R declarations.** `tools/krify_functions.py` turned ANSI prototypes into old-style ones, because Ghidra recovered argument counts differently at each call site. This is also why a dropped argument still compiles.
- **Ghidra types.** `uw.h` defines `undefined`, `undefined4`, `byte`, `uint` and `ushort`, plus `code` and `codeval` for indirect calls. `ghidra_intrinsics.h` supplies `CONCATxy` and `SBORROW4`.
- **Pointers.** Ghidra typed pointers as `int`, which truncates them on a 64-bit host. The fix is to retype the local, parameter or global. About 855 `intptr_t` uses exist.
- **Backing arrays.** A global that is really a table gets real storage and a macro, like `#define DAT_00201b70 DAT_00201b70_backing[0]`. About 1,200 mentions exist in `src/`. A struct migration is in progress for the object table, tile map and common-object properties.
- **Platform stubs.** Unknown WinCE imports became no-op `Ordinal_N` stubs from `gen_ordinal_stubs.py`. Identified ones got real `ce_*` implementations.
- **Missing tables.** Original data tables are pulled from the Ghidra project into `tests/fixtures/restored_tables.json`, which tests check.

### Build and test

- `build.sh` builds `build/uw_dbg`. `debug.sh` adds AddressSanitizer. `run-tests.sh` runs `ctest`.
- `run-regressions.sh` runs demo scripts against the ASan build in parallel. Each gets its own copy of the save directories, which fixed a race. A watchdog kills a script after 90 s. Output is `N/M clean`.
- Unit tests use vendored Unity: 69 test files.

### The fixture-extraction trick

Game functions stay in their real source files. A Python script (`tests/tools/extract_functions.py`) copies the exact bodies of named functions into a generated test file. CMake regenerates it when the source changes, so the repo keeps no duplicate implementations.

```
// tests/CMakeLists.txt · a test names the functions it exercises
add_fixture_game_unit_test(traps src/traps.c:dispatch_trap_type_effect ...
```

A spec is `file:func` for a function, `file:@sym` for an initialised array and `file:%MACRO` for a `#define`. The fixture supplies isolated globals and service mocks, linked in separate archive members so one suite overrides only its own boundary.

> **Consequence.** A function pulled into a test cannot see macros defined at the top of its `.c`. A macro or global used by an extracted function has to live in a header, with definitions in the fixtures.

A newer layer, `unit_test_hooks.c`, runs the real game headless on a virtual 60 Hz clock. `Sleep()` advances the clock, and `RUN_GAME_TEST` forks a process per case because game state is process-wide.

### The demo harness

`--demo-file=script` plays one command per line, paced by `--demo-delay-ms`, by pushing real SDL events. The same executor sits behind the debug console.

#### Input

bare key names, `HOLD`, `RAWKEY`, `SDLKEYDOWN/UP`, `TYPE text`, `SDLCLICK x y`, `SDLRCLICK`, `SDLREL`

#### World

`TELEPORT`, `GOTOLEVEL`, `SETPLAYERPOS x y z yaw pitch`, `LIGHTLEVEL`, `NOCLIP`, `GODMODE`, `SPAWNOBJ`, `GIVEOBJ`, `CASTSPELL`

#### Output

`SCREENSHOT path` (forces a full flush), `DUMPOBJSLOT`, `SCANOBJTYPE`, `FINDOBJ`, `OPTIONS`

`democapture.c` runs the other way: `--record-demofile` writes real input into a demo script. Scripts usually open with a block of `ENTER` lines to pass character creation, then `TYPE Avatar`, then `SETPLAYERPOS` to jump into place.

### Options

One X-macro table (`options_table.h`, about 70 rows of type, field, default and help text) is included three times: to declare the struct, to build the defaults and descriptor array, and to print `--help`. Syntax is `--name`, `--name=0`, `--no-name` or `--name VALUE`, with dashes and underscores equal and a legacy `UW_NAME` environment variable under the command line. The debug console and panel read the same table, so every option is also a runtime setting.

```
// options_table.h · adding an option is one line
X(FLOAT, wall_turn, 0.1f, "How much running into a wall turns the player toward the slide direction (1.0 = original, 0 = off).")
```

### Debug panel and console

`debug_ui.c` is a small immediate-mode GUI drawn into the game framebuffer, with int, double, toggle, button, text and named-value rows. `debug_shim.c` fills it each frame. The main page offers console, options and debug sub-pages. The object inspector replaces the panel when you click an object or wall in the view. The console is a Quake-style drop-down that runs the demo command language.

### Port additions at a glance

| Area | Additions |
|---|---|
| View and input | Mouselook, pitch limit 45° (original 24°), strafe-while-walking, wall-turn scale, quick use and look keys, always-visible cursor |
| Rendering | Near-tile visibility, three light modes, dither, extra lights, brightness, 600-vertex arena, exact per-pixel texel division, pick buffer clear, model depth sort |
| Timing | Forced per-frame 3D redraw, frame cap, FPS display, physics sub-ticks |
| Audio | hxcmod, WAV and DOS OPL2 backends, volume options |
| Tooling | Debug panel and console, demo record and replay, unit-test harness, regression runner |

*The port itself*

## Five bug classes that keep recurring

Decompiled code fails in a small number of ways. Knowing them makes a suspicious function easier to read.

| Class | What happens | Example |
|---|---|---|
| Dropped parameters | A call site lost its arguments, and K&R declarations let it compile | `3d.c:1685`: `FUN_0005dd84();` dropped all three arguments of `emit_flat_wall_texture_select` |
| Missing table data | A table's bytes never made it out of the binary | The NPC and spell tables restored in commit 349fbd2; `restored_tables.json` |
| Unmerged backing arrays | One real table split across several unrelated globals | The container scroll arrows did nothing because three “variables” were really slots 20, 24 and 27 of one array. Swapped spell callbacks (846fae6) |
| Dropped loop cursors | A pointer update inside a loop was lost | `models.c:1433`: `row_base -= 0x18` vanished next to `iVar22 -= 0x60`. Door lintels shot through the ceiling |
| Silent capacity cliffs | A fixed buffer with no else branch | A 64-entry depth sort drew the 65-face boulder unsorted. The vertex cap dropped the nearest floor tiles |

Two working rules come with them. Read the original's real value before “fixing” a constant. And trace the live mechanism rather than trusting an inline comment.

*The port itself*

## Surprises and open questions

#### Things that look wrong but are

- The object mobile test, the two mode variables and three stale comments were renamed or corrected after this survey.
- `load_game_from_slot` saves, and `journey_onward_load_slot_menu` does the real load.
- `registration.c` is copy protection. The code-wheel table is never set, so that check is dead.
- `PeekMessageW` does not read a queue.
- The decompiled MOD engine in `audio.c` is unreachable.
- Two game-mode variables with different values.
- NPCs more than eight tiles from their target teleport onto its tile. Confirmed in the original ARM code.
- Ward traps fire during NPC path planning.

#### Not verified

- Which trigger subclass maps to which action code (bytes live in `objects.dat`).
- The door function names read backwards for a door at rest (they now carry a comment explaining it). I kept them because every caller passes the original's argument order.
- The unit relationship between the 1/256-tile player position and the sweep's 1/8-tile units.
- Why the projection centre (140, 80) differs from the viewport centre.
- Exact meaning of the visibility face bits and the lock-flag bits 0x400, 0x800, 0x1000.
- Meaning of `flags_res` in the type word.
- Whether the original draw-command list has any reader.
- Whether trap kind 8 “quality 1” really means close or open, given that `close_door_object` acts on a closed door.

`todo.md` and `struct-recovery-plan.md` are the live records of what is open. The README's section on ordinal stubs still overstates how many remain.

---

*Read from the `quality-of-life` branch of the repository. Line numbers are approximate (a few lines either way). Labels marked unverified were inferred from usage or could not be confirmed in code.*

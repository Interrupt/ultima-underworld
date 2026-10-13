Test executables contain Unity cases and assertions. Fixture libraries compile
setup, controlled services, and selected original game functions once, so a new
suite can reuse them without copying globals or mocks into its test file.

Register a suite in `tests/CMakeLists.txt` using an existing fixture:

```cmake
add_supported_game_unit_test(my_inventory uw_test_inventory)
```

Create `tests/test_my_inventory.c`:

```c
#include "inventory_fixture.h"

void setUp(void) { inventory_fixture_reset(); }
void tearDown(void) { inventory_fixture_dispose(); }

static void test_sack_contents_have_a_widget(void)
{
    TEST_ASSERT_EQUAL_INT(-4, find_or_assign_object_widget(objects[2]));
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_sack_contents_have_a_widget);
    return UNITY_END();
}
```

Each `uw_test_<suite>` library provides its matching `<suite>_fixture.h`.
Reset helpers reproduce the existing controlled setup; counters and fixture
storage are available for cases to select inputs and inspect effects. The
new-game fixture also provides `new_game_fixture_begin/end` to create and
remove its temporary save workspace around the suite. Link one domain fixture
per executable: fixtures provide separate, intentionally isolated game globals
and mocks, rather than a running UI/game instance.

`uw_test_movement` exposes a `movement_fixture` struct. Its reset loads level 1,
isolates actor records, creates an alive character through the real initializer,
and loads COMOBJ.DAT. Defaults represent a grounded player moving into a wall.
Set `movement_fixture.wall_flags = 4` for open floor, enable `door_fixture` for a
door candidate, or call `movement_fixture_prepare_stair(height)` for stairs.
Counters and snapshots record rollback, sliding, landing, and object contact;
read/write helpers access packed movement fields.

The common `uw_test_support` helpers in `game_fixture.h` are independent of
these domain fixtures:

- `uw_test_create_character(record, attributes, object)` binds character globals
  and calls the real initializer without class rolls or UI.
- `uw_test_load_map(arena, capacity, level)` loads a numbered UW1 block from
  LEV.ARK, validating capacity, archive block length, and the map marker.
- `uw_test_level_object(arena, capacity, slot)` resolves mobile/static slots.
- `uw_test_open_data(path)` opens a required file relative to the project data
  folder, independently of `UW_DATA_DIR` and a suite's file-service mocks.
- `uw_test_read_data(path, destination, size, offset, origin)` reads an exact
  slice; offsets can be relative to the beginning or end of the file.
- `uw_test_load_object_properties(records, capacity)` expands COMOBJ.DAT rows
  into the game's 13-byte metadata records.

Fixture map loading uses native file reads, so inventory, trap, illustration,
and new-game suites can keep their own observed or failing file-service mocks.
The inventory suite runs the real container open, refresh and weight traversal
with controlled object slots and drawing services. Cases open the real sack
from level 1 tile 23,6, empty sacks and nested sacks, and follow hidden contents'
sibling links. Its fixture frees container tracking records after each case.
The new-game suite still exercises the actual `read_archive_entry` and level
loader. The character initializer and archive reader have separate compiled
libraries, avoiding dependencies on unrelated services when only one is used.
String/memory services use compiled original ordinal bodies; division and the
default RNG are separate support archive members. A suite's own service symbol
wins over the default without pulling in unrelated mocks.

`uw_test_math` compiles just the original value-stepping function and needs no
unrelated service stubs. `test_support.c` demonstrates the common helpers.

`uw_test_npc_combat` reuses the combat fixture with real NPC attack setup,
weapon hit checks, skill rolls, damage dice, resistance and HP updates.
It loads Bragit's level-one record (human type 0x5a, identity 19) and
OBJECTS.DAT stats, including his enhanced-NPC flag. Controlled RNG exercises
all three attack styles against player defense and armor, critical hits,
misses and attack-strength scaling. Collision candidates, presentation and
equipment-wear output are controlled boundaries. The NPC AI suite separately
checks that every charge nibble passes the original ARM attack-strength scale
through the real attack animation tick; it extracts the table from ai.c.

`uw_test_geometry` exercises the real near-plane clipping and polygon-list
renderer against controlled arena records. Its raster callback captures the
current triangles without opening a window. The clipped-record buffer is
extracted from `src/3d.c` itself so AddressSanitizer checks its actual size;
the fixture does not substitute a larger buffer and hide an overflow.

`uw_test_spells` runs the real rune-table lookup, casting, special-action
dispatcher, and light effect with a character from the common helper. Skill
results, dice, sound, and UI boundaries remain controlled; tests also exercise
critical failures and no-magic tiles using the full player address.

Generated function units are build artifacts. CMake regenerates them from the
source files when those files change. Game implementations remain in their
original files; no implementation copies are checked into tests.

`uw_test_babl_vm` compiles the real conversation dispatcher, all opcode handlers,
menu wait/selection, NPC variable bridge, quest access and barter rules. Use
`babl_fixture_reset`, `babl_symbol` and `babl_run` to construct short bytecode
programs against controlled VM storage. `test_babl_vm.c` covers all 42
conversation opcodes (0x00..0x29), including signed arithmetic, branch outcomes,
nested calls, stack frames, variable writes, native dispatch and text output.
Its final coverage assertion checks that every opcode actually executed.

Input selects controlled menu responses through the real wait loop. Storage,
string expansion, drawing, RNG and inventory-list services are controlled at
fixture boundaries; these tests use hand-written bytecode, not CNV.ARK, and do
not cover every native builtin. Additional cases exercise quest-dependent dialogue,
NPC state on reentry, accepted/rejected/declined trades, 16-bit preferences and
barter cache initialization/invalidation. A tick budget makes endless dialogue
or input waits fail instead of hanging the test process.

`uw_test_babl_conversation` runs whole CNV.ARK conversations through the real
`start_npc_conversation`: script loader, STRINGS.PAK text, bglobals.dat
persistence, quest flags, menus and barter rules, with level-1 NPC records.
Drawing, scroll output and the object-world builtins are controlled. A test
queues the player's menu answers with `conv_pick("text", hook)` (first entry
containing the text; `hook` runs just before the choice, e.g. to stage barter
items), then calls `conv_talk`/`conv_talk_as`. A menu with no queued answer, or a
script that never finishes, fails the test. Set `CONV_DUMP=1` to print each
test's transcript. `test_babl_conversation.c` covers Ketchaval/Retichall and the
barter loop (offer, demand, think it over, leave).

Recovered suites from `unit-testing-framework` use the same prebuilt fixture
libraries. The `*_fixture_reset`/`*_fixture_dispose` functions own setup and cleanup;
case files contain their assertions. `uw_test_gx_pacing`, `uw_test_look_pacing` and
`uw_test_inventory_drag` exercise real deadline and pending-presentation handling
with controlled clocks and display/input services. `uw_test_transitions` checks
fades, menu/count prompts and character-to-dungeon transitions against real data.
`uw_test_spell_runes` covers recognition and click checks, alongside `uw_test_spells`
which covers the spell effects. Creature, lighting, stairs and throw fixtures use
the original game function bodies and required data resources. Shared data helpers
load maps and object properties; `uw_test_division` preserves the divisor-first
ordinal and quotient/remainder return convention.

The original commits and their already-ported source fixes are listed in
[the recovery audit](../fixtures/legacy-test-recovery.md).

`uw_test_special_use` loads the real level 1 fountain and bedroll records.
`special_use_fixture_reset` creates the player and installs the map arenas;
`special_use_empty_area` and `special_use_npc` arrange rest safety scenarios.
The real special-action dispatch, healing, area scan and safety callback run;
only the rest UI/time advancement and output services are controlled.

`uw_test_sleep` runs the actual bedroll dispatcher and `handle_rest_action`
through waking up, with the player at level 1 tile 18,5. It loads the original
map/object lists, object properties and light fuel records. The shared special
item fixture builds with `UW_TEST_FULL_REST` to leave the rest handler, stat
adjustments and fuel decay to the real game functions. Cases cover
complete and interrupted sleep, repeated use, hostile rejection, cleanup
limits/chain preservation, stack link words and torch exhaustion. The suite
also runs the real background trap search/dispatch, spawn-area scan/callback,
and weapon overlay hold/restore functions, including the reported level 1
tile 18,4. Fourteen cases check blocked/unblocked spawn scans, ignored template
and player records, resetting the scan result, and native snapshot pointers
and full-region copies. Real scans check whether starting rest is unsafe;
the interruption outcome and subsequent NPC movement remain controlled world
services. Spawn allocation is an exhausted-pool fixture, so successful NPC
placement is outside these cases. Drawing, sound, resource cleanup, inventory
light lookup, allocation/copy services, RNG and the clock are controlled so
the tests do not need interactive input or rendering.

## Real-game tests (`start_test_game`)

Fixtures replace game code; a real-game test runs all of it. Register with
`add_test_game_executable(name)` (needs `tests/test_name.c` with its own `main`), then:

```c
#include "src/headers/unit_test_hooks.h"
uw_test_hooks hooks = { .pre_game_start = setup_player, .post_game_tick = check_world };
start_test_game(&hooks);   /* NULL hooks are fine; returns when the game exits */
```

It boots headless (SDL dummy video/audio, `--headless`), skips the intro and title menu, and
starts a default character on level 1 using the real data folder. Hooks: `pre_game_start`
(character exists, level not loaded), `on_game_start`, `pre_game_tick`, `post_game_tick`,
`on_game_exit`; call `test_game_request_exit()` from one to stop. One game per process, so use one
executable per scenario. See `tests/test_game_hooks.c`.

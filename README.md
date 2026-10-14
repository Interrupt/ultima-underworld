# Ultima Underworld 1 — WinCE decompile, stubbed for native compile

<img width="752" height="620" alt="Screenshot 2026-09-20 at 1 18 42 AM" src="https://github.com/user-attachments/assets/50cac1ef-6723-49c9-bf5a-30fef6fc100a" />

`uw.c`/`uw.h` are a Ghidra decompile of `UU.exe`, the Windows CE (Pocket
PC) port of Ultima Underworld 1 (originally shipped by ZIO Interactive for
devices like the HP Jornada 540 — the folder name says "PPC" but that
means Pocket PC, not PowerPC; the actual binary is MIPS). This tree adds
everything needed to compile that raw decompile as a native macOS binary
and run it against the real game data files, with the WinCE platform
layer (coredll ordinals, GAPI/`GX*` graphics+input, file I/O) stubbed or
reimplemented against SDL2 and the host filesystem.

## Building

Requires `cmake`, `clang`, and SDL2 (`brew install cmake sdl2`).

```sh
./build.sh   # configures build/ via CMake and builds build/uw_dbg
./run.sh     # build.sh, then runs against the local data/ folder
```

Or drive CMake directly:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j
```

The `-Wno-*` flags in `CMakeLists.txt` are required, not optional: this is raw decompiled C
where 32-bit-original-binary idioms (K&R-style unspecified-argument
functions, implicit int/pointer conversions) are used throughout on
purpose — see "Architecture notes" below.

For crash hunting, add `-fsanitize=address` (catches bad memory accesses
precisely) — the two are not mutually exclusive with the flags above.

The persistent desktop cursor is enabled by default.
The game cursor (including held items and targeting icons) is drawn over each
presented frame without the Pocket PC stylus hiding rules. It stays out of the
game framebuffer, so moving it does not leave trails or enter screen backups.
Set `UW_ALWAYS_SHOW_CURSOR=0` to restore the original stylus behavior.

The display defaults to the original 320×200 game area, initially scaled 2×.
Set `UW_TOUCHSCREEN=1 ./run.sh` to include the Pocket PC touch input strip
below it (320×240). Leaving it unset or setting `UW_TOUCHSCREEN=0` hides it.

## Unit tests

The C unit tests use [Unity](https://github.com/ThrowTheSwitch/Unity),
vendored under `third_party/unity`. Tests also require Python 3. Build and run them with:

```sh
./run-tests.sh
```

Test build rules live in `tests/CMakeLists.txt`. `uw_test_support` shares the
compiled character initializer and archive reader and provides headless
`uw_test_create_character`, `uw_test_load_map`, and
`uw_test_load_object_properties` helpers. `uw_test_movement` adds the compiled
collision functions and a reusable movement fixture. The other suites likewise
link `uw_test_<suite>` fixture libraries, with setup, mocks, and reusable helpers
in `tests/support/`. Map loading, object-slot lookup, data reads, string/memory
services, and division are shared across fixtures. Game functions stay in
their source files; generated units are rebuilt when those sources change.

A new movement suite can link `uw_test_movement` with
`add_supported_game_unit_test(my_movement uw_test_movement)` and reset its
fixture with `movement_fixture_reset()`. The fixture loads real level 1 and
object properties, creates a character through the game initializer, and
isolates the actors. Collision sampling remains controlled by the fixture's
wall, stair and door inputs. Each case can select an exact contact condition
and assert the game's collision response.

`tests/test_math.c` checks `step_value_toward_limit` in both directions,
including exact limits and rejected steps. It links the compiled function from
`src/math.c` without stubs for unrelated functions; no game data or SDL window is
needed. The existing CMake configuration still requires SDL2 to be installed.

`tests/test_chargen.c` tests new-character defaults, starting rolls, class
attributes and bonus caps, skill-tree traversal, and confirmed skill picks.
It tests functions from `src/chargen.c` without UI code, with deterministic random
values and stubs for game services (including skill training). Class attributes
and bonus pools come from `data/DATA/SKILLS.DAT`; synthetic trees and cap cases
remain for testing specific edge conditions. Run just this
suite with `ctest --test-dir build -R '^chargen$' --output-on-failure`.

`tests/test_new_game.c` creates a stub character, copies the real
`data/DATA/LEV.ARK`, runs the real archive-entry reader and level loader,
and enters gameplay through the real game-mode transition. It checks the
character survives loading, the level data and free-list offsets are loaded,
the spawn request is tile (32, 2), and input dispatch switches to gameplay.
File I/O and copying use `src/file_io.c`; writes go to a temporary SAVE0,
leaving the supplied data and saves unchanged. Archive lifecycle bookkeeping,
save records, scheduler/texture/automap services, player placement, and UI
remain stubbed. Cancellation and copy/load failures are also checked.
Both chargen and new-game tests require the copied `data/DATA` files and fail
if they are missing. Run new-game with
`ctest --test-dir build -R '^new_game$' --output-on-failure`.

`tests/test_teleport.c` queues a player teleport and ticks the real
`dungeon_view_anim_tick` once to process it. It checks the old level is saved,
the destination is loaded, held-item state is cleared, the player is placed,
and the pending request is consumed.
The successful teleport then runs a real `movement_tick` on the destination
level and verifies the player remains alive with unchanged HP; NPC/physics
services are stubbed. It also covers same-level teleports, blocked destinations,
placement fallback, and save/load failures. Level I/O,
placement search, and display services are stubbed. Run it with
`ctest --test-dir build -R '^teleport$' --output-on-failure`.

`tests/test_movement.c` checks wall stopping/sliding, short and excessive
steps, collision-mask widths, closed/open doors, the original radius and packed
position rules, copied collision-link lookup, shared sweep/collision coordinates,
and jump rebounds followed by a natural descent to the floor. It compiles the
real movement setup, horizontal/vertical integrators, player position/heading
writeback, collision response, candidate builder/sorter, link resolver, object
collision dispatch, contact snapshot construction, and floor/step classifiers
from their existing files. Contact tests cover static doors and the snapshot's
velocity, speed, heading, and capped mass ratio.
Door properties come from `data/DATA/COMOBJ.DAT`, which is required. Map
sampling, object-slot lookup, placement synchronization, surface landing, and
horizontal rollback/restart remain fixture boundaries; no window is needed.
Run it with `ctest --test-dir build -R '^movement$' --output-on-failure`.

`tests/test_inventory.c` exercises the real recursive object lookup and
inventory widget lookup for a picked-up sack, its contents, nested containers,
sibling links, absent objects, and quantity fields. It also loads the sack and
key at level 1 tile (23,6) from `data/DATA/LEV.ARK` (required) and exercises
the real object-description dispatcher and key helper, including mode gating
and missing messages. The deferred-use regression arms the key prompt and
clicks the real door at (22,5), checking callback identity, target forwarding,
and cursor cleanup. Picking, range checks, and lock-action results are stubs.
Object links, widget slots, and message output are
fixtures; no UI is needed.
Run it with `ctest --test-dir build -R '^inventory$' --output-on-failure`.

`tests/test_combat.c` exercises the real melee hit resolver, nearest-target
selector, hit-zone and facing calculations, swing processing, melee damage
calculation, HP updates, death-state transitions, scripted death exceptions,
kill experience, and the combat-triggered HUD wipe redraw. It covers hitting a critter, missing,
excluding the attacker, nearest-target selection, all 64 heading pairs,
failed skill checks, critter faction checks, lethal hits, repeat hits on dead
critters, and kills by other critters. Collision candidates,
object lookup, position projection, skill/random rolls, effects, conversation
UI, the final XP grant, other HUD tickers, and sprite output are fixtures; HP,
death-state changes, HUD status requests, redraw dispatch, and wipe animation
state are real. The wipe regression verifies its frame sequence and completion.
Run it with `ctest --test-dir build -R '^combat$' --output-on-failure`.

`tests/test_traps.c` follows the real level-one orb at (58,13), near (57,13),
to its linked text trap and checks that message `0x1201` reaches the scroll
without pointer truncation. It also covers an absent message.
`data/DATA/LEV.ARK` is required; message lookup and display are stubbed.
Run it with `ctest --test-dir build -R '^traps$' --output-on-failure`.

Game functions remain in their original files. For the larger modules,
`tests/tools/extract_functions.py` generates test-only translation units in
the build directory from the exact selected function bodies. CMake regenerates
them when the original sources change; tests provide the isolated globals and
service stubs. No duplicate implementations are maintained in the repository.

Add cases using `RUN_TEST` in the test runner. Set `-DBUILD_TESTING=OFF` to
omit the test targets.

## Running

The game needs its original data files. Extract them from the WinCE
install `.cab` files (see "Extracting game data" below) into a directory
laid out as:

```
UWDATA/
  UU.exe  gx.dll        (unused by this build, just artifacts of extraction)
  DATA/       *.GR *.DAT *.BYT *.SYS *.PAK *.ARK *.CFG *.TR *.CM
  DATA3D/     *.E
  SOUND/      SOUNDS.DAT  *.MOD  VOC*.wav
  CRIT/       CR*PAGE.N00/N01  ASSOC.ANM
  CUTS/       CS*.N0x
```

Then run with:

```sh
UW_DATA_DIR=/path/to/UWDATA ./build/uw
```

A copy of the extracted game data also lives at `data/` in this repo for
local convenience (`UW_DATA_DIR=$(pwd)/data ./build/uw`) — it's
gitignored, not checked in, since it's copyrighted game data.

### Running against an original DOS install

`--data-dir` is the one and only data directory, and it can point either at
the extracted Pocket PC assets or straight at a DOS Ultima Underworld 1
directory:

```sh
./build/uw --data-dir=/path/to/UW1/UW
./run.sh --data-dir=/path/to/UW1/UW     # or UW_DATA_DIR=/path/to/UW1/UW ./run.sh
```

`./run.sh` and `./debug.sh` pass the repo's own `data/` by default, seeded
from `UW_DATA_DIR` when that is set, and forward any further arguments — so a
`--data-dir` of your own wins, being later on the command line.

Supply one asset set or the other, not both; the port works out which it has
been given and adapts:

- `DATA/CHRGEN.DAT` uses 18-byte records on DOS instead of the port's 20,
  and is converted at load time (`src/chargen.c`).
- Cutscene speech ships as Creative `SOUND/NN.VOC` rather than RIFF
  `SOUND/VOCnn.wav`; `src/platform_voice.c` reads either.
- Music and sound effects come from the DOS `SOUND` set automatically: with
  no `--audio-mode` given, a data directory that is a DOS install (detected
  by `SOUND/UW.AD`, the timbre bank) selects `hybrid`, because such a
  directory has no `.MOD` music or WAVE effects to fall back on. Pass
  `--audio-mode` explicitly — including `--audio-mode=arm` — to override.
  `--dos-data-dir` is only needed to borrow DOS music *while playing the
  Pocket PC assets*; it does not by itself turn DOS audio on.
- The 3D models are read out of `UW.EXE` itself, where DOS kept them
  compiled as bytecode. There is no `DATA3D/` in a DOS install and no `.E`
  source anywhere in the executable, so there is nothing for the `.E`
  parser to read — see `src/models_dos.c`.

Dungeon lighting defaults to ARM RGB shading. As a project deviation, each
light strength level subtracts 16 from the unlit starting bias of +8.
Use `UW_LIGHT_MODE=dos ./run.sh` for palette shading based on the equipped
light's `SHADES.DAT` configuration and `LIGHT.DAT` mappings. Use
`UW_LIGHT_MODE=arm ./run.sh` to select the default explicitly; unrecognized
values also use ARM lighting. Mode names are case-insensitive (`DOS` and
`dos` select the same palette shading).
For optional ARM brightness calibration, use `UW_AMBIENT_BIAS_REDUCTION`:
negative integers brighten the view and positive integers darken it. The
adjustment defaults to `64` when unset. Set it to `0` to disable calibration. DOS palette shading does not use this adjustment.
Both modes use radial eye-to-surface distance and default to screen-anchored
ordered dithering: DOS alternates palette shades, while ARM dithers RGB565
channel rounding. Set `UW_DITHER=0` to disable it or `UW_DITHER=1` to enable it
explicitly.

File loads are logged to stderr (`[fileio] open-read: ...`), including
failures, which is the fastest way to tell what's missing or misnamed.

### Extracting game data from the CE `.cab` installers

7-Zip (`7zz x foo.cab`) extracts the compressed file contents correctly
but loses the original directory structure and filenames — CE cab
installers store real names/paths in a separate binary manifest
(`ULTIMA~1.000` in the extracted output, a "WinCE install header"), with
each content file keyed by its file-table index (which is what 7-Zip
falls back to naming the file `.NNN`). `tools/organize_uw_data.py`
(adapt the paths at the top) parses that manifest and copies the `.NNN`
files into the real `DATA`/`DATA3D`/`SOUND`/`CRIT` layout with real
filenames. Run it once per cab (main data, Voice, CutScene) pointing at
each one's own extracted+manifest directory.

## Current status

Compiles clean, links, and runs against real game data: opens an actual
SDL window, passes single-instance/window-creation/registry checks, and
has successfully loaded `STRINGS.PAK`, `FONT5X6P.SYS`, `ALLPALS.DAT`,
`OBJECTS.DAT`, `DOORS.GR`, and others via the real file I/O layer. Still
hunting an intermittent heap-corruption bug (see below) somewhere in the
resource-loading path that hasn't fully stabilized into the game's main
loop yet.

Known-incomplete / best-effort areas:
- **Sound**: not wired up at all (no coredll waveOut-equivalent
  implemented yet).
- **A handful of UI icon/graphic files** may still 404 under the wrong
  filename — some path-building code references a lookup table whose
  actual string contents Ghidra couldn't recover (see "Unrecoverable
  string tables" below); fixed instances are documented inline as they're
  found, but not every one has necessarily been hit and confirmed yet.
- **`Ordinal_*` semantics**: most are unidentified coredll-by-ordinal
  imports with no name recovered. ~10 were identified from their
  call-site shape and implemented for real (malloc/free/memset,
  CreateFile/ReadFile/WriteFile/SetFilePointer, RegOpenKeyEx,
  single-instance check, window creation, the PeekMessage-shaped event
  pump). Everything else is a generic no-op stub (`ordinal_stubs.c`,
  `tools/gen_ordinal_stubs.py`) that ignores its arguments and returns 0
  — safe on the arm64 calling convention, but semantically a no-op, so
  any game feature that depends on one of these doing something real
  won't work correctly yet.

## Architecture notes (why the code looks like this)

**K&R-style declarations everywhere.** Ghidra's per-call-site argument
recovery disagreed with itself throughout this binary — the same
function gets called with different argument counts at different sites
because the original compiler's register allocation confused Ghidra's
analysis. Every function was mechanically converted
(`tools/krify_functions.py`) from an ANSI prototype to an old-style K&R
declaration (`void FUN_X(a,b) int a; int b; { ... }`), which disables
argument-count/type checking at call sites — required for this to
compile at all, not a style choice.

**Pointer truncation via `int`.** The original binary is 32-bit, so
pointers and `int` were interchangeable there. On a 64-bit host that's
not true, and Ghidra's `undefined4`/`int` typing for what are actually
pointers silently truncates real (malloc'd, or taken via `&global`)
addresses — compiles fine, corrupts memory or segfaults at runtime,
often far from the actual bad assignment. This has been the single
biggest source of bugs found while getting this to run this far, fixed
wherever found by retyping the offending local/parameter/global to a
real pointer type. If you hit a new crash and the faulting address looks
suspiciously small/truncated-looking, check for this pattern first.

**Undersized globals used as large tables.** A recurring, distinct
Ghidra artifact: a global that's actually the *base address* of a large
table (bytes, words, or a struct-per-entry array) gets declared as a
single scalar (`undefined DAT_x;`) because Ghidra only saw the *first*
access. Any indexed/strided access past that first element then
overflows into whatever memory follows. Every instance found so far has
been widened via a `static TYPE DAT_x_backing[N]; #define DAT_x
DAT_x_backing[0]` macro pattern, which preserves the symbol's normal
single-element usage everywhere while giving it real backing storage.
This is deliberately over-applied in a few broad passes (widening ~200
globals total, most of which probably didn't strictly need it) because
the fix is free (extra static memory, no behavior change for correctly-
sized uses) and finding each instance individually via crash/corruption
is slow.

**"Broken index" copy loops.** Another Ghidra artifact:
`(&stackXXXX)[(int)pcVar]` or `arrayName[(int)pcVar]`, where a byte-copy
loop's destination got expressed as "base address plus the *source*
pointer's raw numeric value" instead of a proper incrementing
destination pointer — meaningless once recompiled (the original only
worked because of a coincidental relationship between the two addresses
in the 32-bit binary's fixed memory layout). Fixed by introducing a real
destination pointer, reset at the loop's initialization site
(`tools/fix_stack_copy_loops.py`, `fix_direct_array_copy_loops.py`,
`refix_stack_copy_loops.py`).

**`code`/`codeval` typedefs.** Ghidra's `code` pseudo-type (function
reached through a pointer, e.g. jump/dispatch tables) is redefined here
as a K&R-unspecified-argument function type rather than `void`, so
`(**(code**)expr)(args...)` — the standard indirect-dispatch idiom in
this binary — type-checks regardless of argument count. `codeval` is the
same idea for dispatch targets whose result is actually used as a value.

**Unrecoverable string tables.** A few places index into a table of
string pointers at a fixed address in the *original* binary
(`uVar1 * 4 + 0x85990`-style expressions) that Ghidra never recovered
string contents for — the address is a dangling reference to memory that
doesn't exist in this dump. Handled case-by-case: either skipped (if
cosmetic) or replaced with a best-effort guess corrected against the
real extracted filenames once known (see `FUN_00041304`'s `.GR`
extension fix).

**Fatal-error path must actually exit.** `FUN_00082388` is the
process-termination point reached both from normal shutdown and from
in-game fatal-error handlers (`FUN_0003c3c8`/`FUN_0003c4a8`, "Underworld
can no longer run..."). It must call `exit()` for real — a no-op stub
here means a fatal-error caller keeps running with broken state and
loops back into the same failure forever, which looks exactly like an
unrelated infinite loop/hang until you check the backtrace.

**stderr buffering.** `main()` sets `stderr` unbuffered
(`setvbuf(..., _IONBF, 0)`). Without this, redirecting output to a log
file makes an *actively running* process look frozen for many seconds at
a time (full-buffering kicks in once stdout/stderr aren't a tty), which
is very easy to misdiagnose as a hang.

## Directory guide

- `uw.c` / `uw.h` — the decompile, mechanically and manually patched (see
  above).
- `ghidra_intrinsics.h` — `CONCATxy`/`SUBab`/`SBORROW4`/`SCARRY4`
  standard Ghidra decompiler intrinsics.
- `ordinal_stubs.c/.h` — coredll ordinal-import stubs; regenerate with
  `tools/gen_ordinal_stubs.py` after editing the `SPECIAL` dict in that
  script (don't hand-edit the generated files for the generic stubs).
- `gx_stub.c/.h` — GAPI (`GX*`) implementation backed by SDL2: window,
  framebuffer, input.
- `file_io.c/.h` — real file I/O backing the CreateFile/ReadFile/
  WriteFile/SetFilePointer/CloseHandle-shaped wrappers, resolving
  Windows-style game paths against `UW_DATA_DIR` case-insensitively.
- `main.c` — entry point, calls the decompiled `entry()`.
- `tools/` — one-shot Python scripts used to apply the mechanical fixes
  described above. Most are not idempotent-safe to blindly rerun after
  further hand edits; read before running.

# UW1 object conversion

Reference revision: `ac72dd9155e4bd3ab76257fa5daca080f23f2bbf` of
https://github.com/hankmorgan/UWReverseEngineering.

Use the UW1 object layout in `UW-Formats/uw-formats (Underworld Adventures).txt`,
sections 4.2 and 6.2, and `File Research/Game Object Research File.xlsx`.
Do not substitute `CommonObjDat UW2.xlsx`, `Player_Dat (UW2).xls`, or UW2 tables.
The research workbook includes notes about both games: verify each adopted
field against the UW1 format and this ARM port's actual consumers.

The native COMOBJ record is **13 bytes**, even though the UW1 disk row is
11 bytes. `load_object_catalog_data` inserts a byte before monetary value
and leaves a byte after description flags. Preserve that layout. The bit at
native offset 8, bit 7, means *can have an owner*, not *is a container*.

Object slots have an eight-byte common header. Mobile slots are 27 bytes;
NPC state and projectile coordinates occupy overlapping bytes. Only use
NPC fields for NPC/player slots and projectile fields for moving items.
`object_layout` exhaustively checks extraction and writes against independent
UW1 masks, including neighbouring bytes and native COMOBJ padding.

## Semantic patches

Coccinelle/spatch 1.3.3 was used for this sweep. Generated patches are checked
in alongside their generators, so reviewers can inspect exactly what ran.

```
python3 tools/coccinelle/generate_player_rules.py
python3 tools/coccinelle/generate_property_rules.py
spatch --sp-file tools/coccinelle/player-fields.cocci --dir src --no-includes --in-place
spatch --sp-file tools/coccinelle/object-properties.cocci --dir src --no-includes --in-place
spatch --sp-file tools/coccinelle/property-fields.cocci --dir src --no-includes --in-place
```

`property-pointers.cocci` converts row-address arithmetic at proven consumers.
Run it on each file separately: spatch accepts only one positional input file.
Saved COMOBJ offsets at the matched `iVar*` and `_iv` access sites were checked
to be `object_id * 13`; the patch divides the saved value rather than evaluating
a potentially changed object ID again.

`player-storage-boundaries.cocci` is the temporary migration step that keeps
remaining byte/word arithmetic in its original units as the player global is
retyped. Those accesses are **not converted fields**. Do not count explicit
casts as completion. `object-weight.cocci` converts the weight function, and
`object-weight-callers.cocci` marks its temporary typed call boundaries. Assignments were explicitly retyped once; the retained patch is idempotent.

`object-returns.cocci` changes the eleven allocation, lookup and relocation APIs
to return `uw_object_hdr_t *`, including their declarations and test doubles.
Compiler incompatible-pointer diagnostics now identify raw-pointer receivers.
Explicit casts hide those diagnostics, and pointer arithmetic can still compile
with different units after retyping: inspect both before converting a caller.
Do not silence the migration diagnostics globally.

`audit_object_roles.py` uses `build/compile_commands.json` and Clang ASTs to
identify object pointers from catalog accesses, object lookup calls and proven
aliases. It excludes locals reused as unrelated buffers. The generated
`object-pointer-roles.json` records the evidence and exclusions; it is an
incomplete audit, not proof that all object accesses have been found.
`generate_header_field_rules.py` generates function-scoped common-header read
patches from that audit. Apply them with `apply_header_field_rules.py`; use
`--check` to verify a second application makes no changes. These read patches
retain explicit header casts until caller declarations and arithmetic migrate.

`core-object-receivers.cocci` converts the chain/world search receivers and
their common-header reads. `object-link-interfaces.cocci` types packed link
and cursor parameters; `object-chain-interfaces.cocci` distinguishes those
parameters from the object headers passed to list operations. These interface
patches also apply to declarations and test doubles. `object-chain-storage.cocci`
converts list writes and recursive deletion without changing traversal order.
`spawn-object-header.cocci` replaces creation's byte stores with equivalent
header assignments, including the original quantity/container classification.
`object-arena-boundaries.cocci` casts the original computed byte addresses to
header pointers at allocation and resolution boundaries. The arena globals
themselves still need conversion.

`header-words/` contains generated, function-scoped rules for remaining whole
header words at the audited pointer roles. They expose `type_flags`,
`position_word`, `chain_word` and `link_word`; direct signed-short aliases
are excluded because their promotions differ. Regenerate with
`generate_header_word_rules.py` and apply/check with
`apply_header_field_rules.py --patch-dir tools/coccinelle/header-words`.
These casts still require a subsequent declaration/API migration.

`container-object-interfaces.cocci` types disposal, rune insertion and stack
inspection interfaces. Container weight traversal and matching-object locals
are covered by `core-object-receivers.cocci`. The core tests also exercise
nested contents weights and stack eligibility using the actual game functions.

`object_core` runs the real creation, link-resolution, search, insertion,
append and unlink functions. It compares creation to independent packed byte
values for all 512 types and checks both arena strides, nested contents,
quantity exclusions, next-link updates and preservation of adjacent low bits.

`current-mobile-object.cocci` types the current 27-byte slot pointer and
replaces common physical byte/header accesses. `current-mobile-fields.cocci`
reads the extended NPC fields only in NPC functions; projectile coordinate
words are excluded. Signed byte views retain their original signedness.
Residual word indexing uses explicit temporary word casts so retyping cannot
change its units. `npc-context-interfaces.cocci` types the context-setting
APIs, and `npc-state-setters.cocci` converts goal and target writes.
`projectile-tick.cocci` gives the non-NPC physics tick its own projectile
pointer, lifetime, pitch flags and tile coordinates.

`npc_state` runs the actual setters and independently checks all 65,536
target words, goal/target truncation, preserved animation/status bits and
the unchanged-target path flags. It does not imply that all NPC consumers
or the other projectile APIs have been migrated.

`uw_monster_type_props_t` and `uw_monster_attack_props_t` recover the UW1
OBJECTS.DAT critter table from `File Research/objects_dat-critters.xls` and
the ARM consumers. There are 64 packed 48-byte rows; the loader copies exactly
0xc00 bytes from disk offset 0x132. The last byte keeps an unknown name.
`monster-storage.cocci` migrates the table and fixture storage; its size rules
cover both sizeof forms and repairs byte-view sizes. Comma-separated fixture
declarations were split explicitly because spatch did not migrate those.
`monster-properties.cocci` replaces audited aliases and byte indexes with
properties. `monster-template-pointer.cocci` types the current NPC template
and preserves signed char views. `monster-table-boundaries.cocci` handles
armor/attack selection, XP, trading words and guarded spell-slot selection.
Unused field aliases have been removed; the base byte-address boundary still
serves remaining raw player/despawn template pointers.

Layout tests check every documented field offset, and `npc_combat` compares
all loaded rows with the independent on-disk byte block. This is stronger
than merely checking a few creature stats.

## UW1 weapon and wearable property rows

`ranged-storage.cocci` and `ranged-properties.cocci` convert the 16 three-byte
ranged rows to `uw_ranged_type_props_t`. The UW1 research spreadsheet identifies
bytes 0/1/2 as damage, projectile speed and an ammo/damage-type selector; ARM
consumers confirm these uses. The selector remains unsigned storage, with the
original explicit signed casts preserved where required. It is not named
"durability" from the less specific DOS format description.

`melee-armor-storage.cocci` and `melee-armor-properties.cocci` convert melee
(16 rows of eight bytes) and wearable (32 rows of four bytes) storage, loaders,
fixed field accesses and row addresses. Melee charge-field interpretations are
still tentative in the reference. Raw attack-data interfaces that can select
either a melee or ranged row retain temporary byte-pointer boundaries.

Byte-index rules divide by the record stride only at audited alias accesses:
all current ranged byte indices are row multiples of three. Mixed declarations
in fixtures were explicitly split before applying storage patches. Preserve
whole-array `sizeof` expressions before creating byte views for I/O.

`npc_combat` invokes the real `load_armor_variant_tables` and compares all
304 bytes against an independent disk read, including the final file offset.
Layout tests verify each field offset. Synthetic semantic tests check coverage,
unrelated-buffer exclusion, signed casts, buffer sizes and idempotence. A repeat
sweep over both source and tests produces no further changes.

## UW1 container, light and animation rows

`container-light-animation-storage.cocci` and
`container-light-animation-properties.cocci` convert container (16 * 3),
light (16 * 2), and animation (16 * 4) tables, fixed fields and loader sizes.
The detailed UW1 container spreadsheet establishes a two-byte acceptance mask
at offset 1; retain the inventory code's signed-short interpretation.
ARM light consumers and shipped data establish decay interval at byte 0 and
brightness at byte 1, despite the general format text describing them in the
opposite order. No lighting or decay arithmetic is changed.

Animation flags occupy the first word; start frame and frame count occupy
bytes 2 and 3. Rules repair the typed row-address form as well as the original
byte-address form, so rule ordering cannot leave raw flag casts behind.
Equipment handling now has typed armor/light-property locals. The generic
class dispatcher still returns an opaque pointer because its eight branches
return different record types; completing its consumers remains in scope.

The real loaders are exercised in `npc_combat`, comparing every container,
light and animation disk byte and final file offsets. `object_layout` checks
sizes/offsets and all 65,536 signed acceptance-word values independently.
Synthetic tests exercise exclusions, signed casts, scoped receiver types,
whole-array sizes, and repeatability.

`scratch-object.cocci` types the shared current-object inspection pointer and
its saved context as common headers, replaces first-word accesses and equips
callers directly from typed return values. The monster property lookup now
uses a typed header local and a typed property row address.

The player field generator also emits full-word rules after its narrower
bitfield rules. These replace reads saved into temporaries and masked updates
at the common-header, goal, status, target and tile-word offsets. For example,
`*(ushort *)((char *)g_player_object + 0x16)` becomes
`g_player_object->tile_word`; the x/y components remain separately named fields.
Synthetic tests cover full-word reads and writes and exclude unrelated buffers.

## Full-word and partial-byte object accesses

`generate_word_access_rules.py` generates `object-word-accesses.cocci` for the
player/current-mobile globals and `header-bytes/*.cocci` for independently
audited common-header receivers. The rules cover full unsigned/signed word
views, byte-pointer/index forms, word-pointer byte views, and partial writes.
Adjacent low/high writes from the same scalar identifier become a single word
assignment. Other partial writes retain their sequencing through named low/high
union members. Signed reads retain their original promotion; signed writes
preserve their low eight bits. Byte aliases do not enlarge any packed record.

The current-mobile extended words are scoped to proven NPC contexts; projectile
coordinates overlap those bytes and must retain the projectile layout. The low
four bits of the NPC tile word are now `npc_path_slot`, confirmed by the cached
walk-path consumers. The rule sweeps use that field for path-slot extraction.

Apply the header rules with:

```
python3 tools/coccinelle/apply_header_field_rules.py \
  --patch-dir tools/coccinelle/header-bytes
```

`object_layout` independently checks every byte/signed/unsigned view against
all 65,536 word values and verifies that partial writes preserve neighboring
bytes. Semantic tests cover paired writes, distinct-source partial writes,
signed reads, index forms, NPC/projectile exclusion and repeatability. This
extends the migration coverage; remaining object roles still require auditing.

The audit also found two legacy scaling errors in
`npc_combat_position_tick` (ARM `FUN_00031214`) and
`npc_combat_disengage_tick` (ARM `FUN_00031a94`). A read-only Ghidra decompile
and instruction dump confirms byte offsets +2 (position), +9 (heading),
+0xb/+0xc (goal/frame), and +0x13..0x19 (motion/animation/path flags).
The existing ushort-pointer boundaries doubled those offsets, including writes
past the 27-byte record. Earlier compatibility sweeps preserved that mistake.

`generate_npc_combat_byte_offsets.py` generates the repair; apply it only via
`apply_npc_combat_byte_offsets.py`, which isolates these two original function
bodies and invokes spatch before reinserting them in place. It also corrects
fields produced from the doubled offsets. Do not apply that context-specific
patch globally. The runner skips already-correct contexts and is idempotent.
The `npc_state` regression exercises all 65,536 goal words, both disengagement
branches and random frame advancement, checking independent bytes plus guards
around the mobile record. A second regression covers combat positioning
across all Z values and frame nibbles, including the flight-pitch threshold,
heading changes and preserved neighboring storage. Synthetic tests verify
the repair leaves unrelated functions untouched.

## Remaining full-goal work

* Finish player packed writes, whole-word reads, local aliases and call interfaces.
* Finish class-relative COMOBJ aliases (`DAT_002034b5`, `_DAT_002035cf`) and
  diagnostic/fixture byte accesses. Preserve the current four-byte interpretation
  of `_DAT_002035cf` until ARM evidence establishes whether it should be a word.
* Type remaining common-object APIs and their callers with `uw_object_hdr_t *`.
  `calculate_object_weight` is converted and has direct branch coverage; its
  existing callers retain temporary explicit header casts.
* Convert NPC and projectile consumers separately with proven pointer roles.
* Recover and convert object movement snapshots and relevant object class records.
* Finish mixed melee/ranged attack-data interfaces and row-relative field accesses.
* Finish food and class-6 scalar property tables and class-dispatch interfaces.
* Finish the player/despawn template pointers and dynamic property accesses.
* Migrate fixtures to typed objects while retaining independent byte-layout tests.
* Remove temporary boundaries; audit all object offsets across all source files.
* Build the game and every unit suite after each sweep. Verify semantic-patch
  coverage and idempotence, not only whether the resulting code compiles.

No game function is moved to a different source file during this work.

Validation includes the game build, all 53 C unit suites, conversion regressions,
and focused sanitizer checks. The latest
AddressSanitizer pass covers 19 consumers: babl_objects/throw/throw_cursor/npc_state/npc_combat/npc_ai/creatures/
combat/object_layout/object_core/movement/scheduler/spells/chargen/inventory/
lighting/sleep/teleport/babl_vm. This is a checkpoint for continuing the full
migration, not a completion claim.

## Shared mobile position synchronization

`generate_position_sync_rules.py` emits `position-sync-accesses.cocci` and
`position-sync-updates.cocci` for `sync_object_tile_position`. Apply the access
patch first, then the update patch, with the usual header/type include options.
The arena test proves 27-byte mobile storage before extended fields are used.
The snapshot builder and synchronizer establish shared health/lifetime,
collision-state mode, speed, gravity, pitch and tile-coordinate views. These
aliases preserve existing NPC and projectile layouts; NPC goal/status/target
words retain their distinct meaning. Only the explicit non-NPC branch uses
`uw_projectile_object_t::precise_x/y/z`.

Header position and static quality writes use individual properties. Shared
tile updates preserve the reserved low nibble, and movement-mode writes retain
the tick phase and upper flag. Speed preserves the gravity value installed
earlier in this function; the intervening division does not access the record.
All original scalar snapshots and formulas remain, including full packed
temporary values even when the record update uses a single property.
Callers supply separate stack/global placement snapshots; their raw buffer
offsets remain additional migration work, rather than object properties.

`position_sync_fields` extracts the actual game function and checks 524,288
NPC/projectile/static cases against independent byte expectations, including
all surrounding storage. `--asan` enables direct sanitizer checks. For a batch
review, `--reference PATH` additionally compares a saved original source with
the current function, including memory at service calls, return values,
snapshot mutations and tile globals. The original and converted functions
agree over 4,194,304 cases spanning relocation, landing failures, off-map
tiles and damage callbacks. The same run checks complete conversion and
idempotence against the saved original. The object-layout suite checks every
new alias and property against byte offsets and masks. This pass removes all
23 raw audited accesses in synchronization. Remaining raw accesses elsewhere
are tracked by the property-usage inventory.

## Shared mobile consumers

`generate_shared_mobile_rules.py` emits function- and receiver-scoped recipes
in `shared-mobile/`. `apply_shared_mobile_rules.py --in-place --jobs 4` applies
them to temporary copies of the reviewed functions and reinserts each body at
its original location. `--check` verifies that no additional changes are pending.
Original pointer declarations determine byte scaling; signed byte reads retain
their casts. The pass names common header fields, tile coordinates, scheduling
phase, movement mode, speed, gravity, pitch and fine heading. Scaled tile reads
retain their multiplication by eight through `tile_x/y << 3`.

The snapshot builder guards extended storage with the mobile arena boundary.
Its non-NPC branch alone reads projectile precise coordinates. The settling
function reads the projectile source slot only in its non-NPC branch, and the
reallocation diagnostic reads signed precise Z only for projectile class 0x80.
Saved local pointers remain local when calls change the selected global object.
Mixed attacker/current-object consumers use only shared byte views; raw NPC
goal/status/target words and unresolved byte-26 accesses remain further work.
Monster-table `movement_flags` is excluded from mobile scheduling rules.
Complete byte-field writes use named properties, including XOR inserts whose
values contain only scalar identifiers, masks, shifts and numeric literals.
Calls and repeated memory expressions are excluded from those value recipes.
The refreshed audit records 279 proven pointer roles across 47 sources and
61 remaining raw accesses at audited sites, down from 115 before this batch.

`shared_mobile_fields` extracts the actual placement snapshot builder and
checks 196,608 NPC/projectile/static cases against independent byte expectations,
including untouched snapshot bytes, object storage and random-call counts.
`--reference PATH` additionally compares a saved original builder; `--asan`
enables sanitizer checks. Receiver fixtures check word, character and void
pointer scaling, signed reads, unrelated fields, scope exclusions and idempotence.

## NPC summon and interaction fields

`generate_npc_interaction_rules.py` emits the function-scoped recipes in
`npc-interactions/`; `--in-place` applies them, and `--check` verifies the
current source is stable. Access conversion precedes adjacent packed-store
consolidation and property updates. Functions stay at their original locations.

Summon initialization names header XYZ, static quality, mobile tile coordinates,
NPC attitude and target coordinates. Only variant 4 allocates and initializes
an NPC, so its status and target words never label the caster or static spawn.
Other caster extensions use the shared mobile layout. Noise reactions and BABL
race updates set `npc_attitude` while preserving the lower fourteen status bits.
The scripted conversation sets identity, attitude and goal through a typed NPC
pointer, then frees its common header. BABL traversal retains the original
chain-field address when its local record pointer becomes typed.

Packed scalar snapshots retain their original values across calls and property
updates. The conversation's two pure snapshots are removed only after a scoped
check proves they have no remaining use or escaped address; volatile snapshots
are excluded. Unknown movement bit 7 and AI flag bits keep explicit masks on
named byte views. Status bit 9 remains unnamed; this batch supplies no evidence
for assigning it a semantic property.

`npc_interaction_fields` extracts the four actual game functions and runs
712,704 cases against independent byte expectations. Coverage includes all
65,536 status values, summon variants, NPC/player casters, placement failures,
noise filtering, conversation cleanup and BABL race filtering. Service mocks
observe records and deliberately change selected global pointers. `--asan`
enables sanitizer checks; `--reference-dir PATH` compares saved original sources
at every service call, including record bytes, arguments, random calls, messages
and final pointer identities. It also verifies complete original-to-current
conversion and idempotence. The refreshed audit records 280 proven pointer
roles and 30 remaining raw accesses at audited sites, down from 61.

## Packed-byte reassembly

`generate_packed_reassembly_rules.py` generates `packed-reassembly.cocci`.
Apply with `spatch --sp-file tools/coccinelle/packed-reassembly.cocci src/FILE.c
--no-includes --in-place`; omit `--in-place` to check for remaining conversions.
The rules collapse `CONCAT11` high/low aliases of the same named packed word,
and byte views that reconstruct an existing 16-bit pointer element. The latter
retain an unsigned-short cast, including when the original lvalue is signed.
Identifier constraints exclude receivers with calls or increments. Explicit
function-scoped rules cover audited byte-only object aliases, NPC goal words,
and the two cached-low-byte expressions in the container stacking branch.

The semantic regression compiles and executes both original and converted code
for all 65,536 word values. It checks signed low bytes, signed word promotion,
outer signed casts, member and cast receivers, and container cached bytes.
Mismatched fields/receivers, side effects, and untyped byte buffers remain
unchanged; a second application must produce identical output. Concatenations
that assemble separate values or update only part of a value remain valid.

## Named position operations

`generate_position_field_rules.py` generates `position-fields.cocci` and
`position-dead-temporaries.cocci`. Apply them in that order. Complete
read/modify/write sequences for `zpos`, `heading`, `ypos`, and `xpos` become
bitfield assignments; exact field extraction masks become named reads.
Both whole-word and matching two-byte stores are supported. Fine headings
inserted with `(value & 0xe0) << 2` become `(value >> 5) & 7` assignments.
Receiver and input identifiers exclude calls/increments. Wider insertion masks
are deliberately excluded because they may also change adjacent fields.

The conversion initially preserves the temporary's original packed result.
The cleanup patch removes its reload only where a control-flow match proves it
unused before function exit or an independent overwrite. A conservative RHS
name filter rejects overwrites that read the temporary. Explicitly documented
function/variable pairs cover manually audited goto-heavy NPC routines beyond
the generic pattern's reach. Do not generalize those exceptions to other
functions or variables without checking every path.

Regression coverage compiles and executes original and converted updates for
all 65,536 initial words and twelve input values (including out-of-range values),
checking the changed property, preserved neighboring header fields, returned
packed temporaries, conditional overwrites, wider-mask exclusion, and repeatability.

## Documented field reads and remaining-access inventory

`struct_field_catalog.py` lists the documented packed properties already
present in `uw.h`; reserved fields and the layout-only `npc_ai_flags_low7` view
are excluded. `generate_named_field_read_rules.py` generates
`named-field-reads.cocci` from that catalog. It covers unsigned/signed word
masks, unsigned/signed byte views, byte casts, and shifted comparisons.
A signed high-word shift is retained unless a mask bounds the result.
Comparisons use exact enumerated constants, so an out-of-field comparison
value cannot accidentally become true after truncation.

`named_struct_fields` compiles and executes original and transformed code
against the actual UW1 structs for 893 read expressions and all 65,536 input
words. It checks that candidates actually become named properties, compares
complete output checksums, preserves signed/cross-field/reserved exceptions,
and verifies repeatability. The independent `object_layout` suite checks the
binary layouts separately.

Run `python3 tools/coccinelle/audit_struct_property_usage.py --json
 tools/coccinelle/struct-property-usage.json` after each sweep. The inventory
tracks remaining named packed views and raw accesses at existing audited
object-pointer sites. It is deliberately a work list: entries are not blanket
exceptions, and it does not prove coverage of unrecorded aliases, tiles,
current-view storage, or property-row pointers that still need auditing.

Remaining work includes multi-field and XOR updates, paired byte stores,
raw aliases and interfaces, scalar-temporary field extraction, and documenting
which surviving whole-word operations are actual encoding/copy boundaries.
The goal is not complete while these remain unreviewed.

## Saved current-NPC aliases and packed writes

`audit_object_roles.py` records `current_mobile_alias` only when every
non-null assignment is the current mobile pointer or another proven saved
alias. Mixed object/accessor aliases remain common-object roles; aliases reused
for unrelated storage are excluded. `generate_current_alias_rules.py` emits
function-scoped `current-aliases/*.cocci`, respecting the original pointer's
byte/word scaling and signed views. It retains the saved pointer, because a
nested operation may change `DAT_0010190c`. NPC contexts are explicitly scoped;
projectile consumers must not inherit NPC fields at overlapping offsets.

`generate_named_field_write_rules.py` emits `named-field-writes.cocci` from
the documented catalog. Complete field insertions, clears, sets and contained
byte XOR updates become named assignments. Matching split-byte stores can be
combined. When the original calculation assigned a temporary, its final packed
value is reloaded after the field assignment so later uses retain their value.
Reserved-bit, cross-field and wider insertion masks remain unchanged. Rules
restrict receivers and insertion values to identifiers to avoid changing
side-effect evaluation. Multi-field and noncanonical sequences remain work.

`named_struct_writes` executes original and converted updates against the
actual UW1 structs for 207 update patterns, every initial word and six insertion
values, including
out-of-range values. It checks neighboring storage and live packed temporaries,
requires conversion of every candidate, and verifies exclusions and idempotence.
`current_object_aliases` uses the real Clang audit on a fixture, verifies mixed
and reused-pointer exclusions, and executes both versions after switching the
global current object to verify saved-pointer identity and word-offset scaling.

## Packed copies and declaration-aware header aliases

`generate_packed_store_rules.py` emits `packed-stores.cocci`. Adjacent low/high
stores of the same scalar become one unsigned 16-bit assignment. Identifier
receivers preserve evaluation counts, and an intervening statement or a
mismatched source prevents conversion. These whole-word operations are genuine
copies/encoding; the temporary remains unchanged. Property table casts use
`uw_object_type_props_t`, rather than the mobile object layout.

`packed_struct_stores` checks 234 combinations of receiver and cast spelling
against the actual structs for all 65,536 low words and both signs, preserving
neighboring storage. It requires coverage and idempotence and excludes mismatched
sources and intervening modifications.

The refreshed header generators consume the current Clang role audit, including
saved current-object aliases. `generate_word_access_rules.py` groups aliases by
both name and declaration type. It can therefore convert bare byte/word indexes
and dereferences without guessing their scaling. A `ushort *` offset of one is
two bytes; a `char *` offset of one is one byte. Signed char address-taking has
its own rule, before read conversion, so the result remains an addressable
lvalue. The semantic regression checks both pointer scales, signed stores,
addresses, unrelated-function exclusions and repeatability.

Named packed-write alternatives are grouped per receiver/property in the
emitter. This retains the same match cases and temporary-preservation behavior
while avoiding a separate rule for every spelling. Run the generators after
refreshing pointer roles, apply header fields before header byte views, then
apply packed stores, named reads and named writes. Review surviving snapshots,
partial-field/multi-field updates, and noncanonical byte copies separately;
these remain active migration work rather than blanket exceptions.

`generate_packed_store_rules.py` also emits `packed-field-copies.cocci`.
Adjacent low/high assignments from the same named source word become one
whole-word assignment, including narrowed whole-word and direct byte-view
sources. Apply with `--all-includes --include-headers-for-types -I . -I src`.
Receiver identifiers exclude side effects, and both writes must copy the same
member from the same source without intervening statements. Review matches
against object roles before applying: this pass assumes valid object records
that are disjoint or identical, not partially overlapping raw buffers or
volatile/device storage. The current matches copy records from object slots
into newly allocated slots in relocation, stack splitting, and traps.

`packed_field_copies` checks all 792 source/destination/cast combinations over
all 65,536 words using the real structs, including self-aliasing pointer forms,
source and neighboring bytes, mismatched-source and intervening-write
exclusions, and idempotence. Twenty paired copies across four game sources
are now whole-word assignments. Mixed-value byte updates remain for a later
property-write pass.

The scalar `packed-stores.cocci` rules also combine paired stores of the same
identifier masked, OR'd or XOR'd with a numeric literal. Limiting the operand
to a literal avoids ambiguous identifier matches in Coccinelle and excludes
memory reads or side effects inside the repeated expression. Distinct masks,
values, destination members and intervening writes stay separate. Five more
pairs in game reset, save preparation and object callbacks now assign the
complete word; their old scalar snapshots remain unchanged.

`packed_struct_stores` verifies 1008 scalar/cast/receiver forms over all 65,536
words with positive and negative inputs, checking neighboring bytes, exclusion
cases and idempotence. Pass `--asan` after the `spatch` argument for sanitizer
coverage. These packed assignments preserve the original mask expressions;
mapping those updates to individual documented properties remains further work.

## Projectile spawn fields

`generate_projectile_spawn_rules.py` emits `projectile-spawn-fields.cocci` for
`spawn_object_near_player` (ARM `FUN_0004ad10`). Its allocated mobile record
undergoes projectile physics until landing. The pass uses a typed projectile
pointer, combines coordinate byte stores into `precise_x/y/z`, and names
tile coordinates, heading, pitch, speed, source slot and common-header fields.
The packed `tile_position` view retains the reserved low nibble for diagnostic
word prints; ordinary coordinate consumers use `tile_x/y`.

Launch-header updates retain the original packed and byte snapshots. The
height calculations still use `bVar1 & 0x7f` to extract the saved original Z
coordinate after the live Z field changes; replacing it with the live field
would change the crouch branch. Remaining whole-word/byte reads cache packed
values or print diagnostics. The animation high-bit clear has no documented
property name. Explicit header/word casts remain at existing API boundaries.
No function moves, and NPC coordinate interpretations are excluded.
The pointer-role audit and dependent header patches are refreshed against the
typed declarations. Raw word-index patterns are retained only for word
pointers or explicit word casts, so record-pointer arithmetic keeps its scale.

Apply with `--all-includes --include-headers-for-types -I . -I src`.
The scoped recipes disable unnecessary arithmetic isomorphisms, and inserted
shifts carry explicit parentheses to preserve precedence inside larger sums.
`projectile_spawn_fields` compares all bytes, neighboring guards, source
records, live snapshots and side effects for 65,536 inputs in four modes,
including signed coordinate truncation, unsigned launch controls and failed
allocation. It verifies scope and idempotence. Add `--asan` after the `spatch`
argument for direct sanitizer coverage. The actual old and converted spawn
functions were also compared with the same 262,144-case harness under ASAN,
covering both template roles, height/drop rejection and source-slot branches;
the game throw suites exercise flight, bounce and landing.

## NPC spawn fields

`generate_npc_spawn_rules.py` emits `npc-spawn-fields.cocci` for
`init_monster_spawn_defaults` (ARM `FUN_0002a35c`). Its caller selects a newly
spawned creature before invoking it. This establishes NPC layout for the saved
scratch pointer within this function; other scratch and projectile consumers
remain separate audits. The pass replaces byte offsets with a typed NPC
pointer, names complete property updates and heading reads, and types the
monster-table row so HP reads use `max_hp` instead of row byte 4. Apply with
`--all-includes --include-headers-for-types -I . -I src`.

The update recipes retain every original packed snapshot, including when an
OR insertion forces a bit that the original clear mask retained. Status bits
4..12 have no documented property names, so their individual clears remain
explicit operations on `status_word`. Masks in motion, animation, attack,
heading and AI control bytes retain their original operations: their complete
bytes have names, but the remaining individual flag meanings are undocumented.
These are specific exceptions, not a claim that the surrounding migration is
complete.

The spawn initializer's unused `uVar1` snapshots have a separate, guarded
cleanup: `generate_npc_spawn_rules.py --cleanup-dead-snapshots`. It folds the
adjacent snapshot/mask/store pairs to `npc->status_word &= mask`, removes
unused snapshots and the local declaration, then checks that no reference to
the temporary remains. Any later use, escaped address, unfamiliar assignment
or volatile access rejects the entire cleanup. The underlying spawn patch
still preserves live snapshots; the cleanup only operates on this audited
initializer. Legacy status bits remain explicit masks until their meanings
are established.

`generate_mobile_tick_rules.py` emits `mobile-tick-phase.cocci`. The low nibble
at mobile offset 0x0a is now `tick_phase`: `npc_ai_tick` advances it modulo 16
and `tick_mobile_objects` passes it to the due-time check. Spawn clears this
property directly, retaining the upper nibble. Rules are scoped to proven
mobile receivers; the monster-table byte also named `movement_flags` has
different meanings and is excluded. This field is intentionally absent from
the unscoped byte-field catalog. `object_layout` checks its packing and writes
over 65,536 values, and `npc_spawn_fields` checks all phase byte values,
cleanup exclusions, idempotence and the actual initializer's bytes.

`npc_spawn_fields` checks offset conversions, signed reads/stores/addresses,
table HP signedness, live snapshots, exclusions and idempotence across all
65,536 input words. It extracts the actual game initializer and compares all
27 bytes plus surrounding guards with independently indexed expected bytes
for 65,536 record seeds and 50 random inputs each. Run the same regression
with `--asan` after the `spatch` argument for direct AddressSanitizer coverage.

## NPC death fields

`generate_npc_death_rules.py` emits `npc-death-fields.cocci` for
`initiate_npc_death` and `handle_monster_death` in `src/ai.c`. Their existing
ARM notes establish full-object byte offsets at 0x345bc..0x3462c and
0x34638..0x34648. The rules name HP, identity, animation flags, attack state,
and goal-byte accesses through the original local pointer. Signed reads,
stores, and addresses remain separate so signed values and lvalues survive.
Apply the named-field write rules afterward to clear `npc_animation_frame`
without obscuring the goal/target fields or changing the packed temporary.

`npc_death_fields` checks all 65,536 initial goal words against the actual
mobile-object layout, covering all byte flag values, signed identity reads,
address-taking, neighboring storage, packed temporaries, unrelated-buffer and
projectile exclusions, and idempotence. The function scopes are intentional;
they do not establish NPC layout for other consumers of mobile arena slots.

## Partial-property reads

`generate_partial_field_read_rules.py` emits `partial-field-reads.cocci` for
masked slices contained wholly within a documented property. The subset masks
come from the remaining-access inventory: class/subclass indexes within
`object_id`, reserved flag bits, owner subcodes, quantity/link bits, quality
subcodes, and position slices. A slice of `object_id` still reads `object_id`;
it does not need the surrounding `type_flags` word.

Apply this pass with `--all-includes --include-headers-for-types -I . -I src`,
so Coccinelle knows the actual typedefs without rewriting headers. Do not use
`--no-includes`: without type information it can parse a narrowing byte cast
as part of a member receiver and retain that cast around the wider field.
`python3 tools/coccinelle/apply_partial_field_read_rules.py --in-place`
selects the proven patterns present in each source and supplies those options.
Use `--check` to fail on remaining matches, or omit both flags to preview.

The rules preserve the original slice's bit position when its numeric value
is used for indexing or encoding. Zero comparisons can omit that position.
Signed word and char views are supported only where a final mask discards
sign extension. Masks spanning properties, sign-extension bits outside the
original byte/word, and genuine packed copies remain unchanged. Both pointer
and value receivers retain their original evaluation count.

`partial_field_reads` executes every generated spelling and zero comparison
over all 65,536 input words using the actual object structs. It checks
conversion coverage, identical values, exclusions and repeatability.

## Audited void-pointer headers and BABL objects

The header generators support explicit byte-offset dereferences on audited
`void *` receivers: GNU C arithmetic on these pointers advances by bytes.
They do not emit bare void-pointer indexing. Layout evidence still comes
from the function-scoped Clang object-role audit, and this pass only covers
the eight-byte common header. Mobile extensions need their own role proof.

`apply_void_object_header_rules.py` applies field reads, storage views and
named reads sequentially on a temporary source copy before updating a file.
Use `--in-place` to apply, `--check` to verify idempotence, or neither to preview.
The driver supplies header/type include options. Positioned fields retain
parentheses in larger arithmetic; zero comparisons also cover the parentheses
retained around cast receivers.

`generate_babl_object_rules.py` emits `babl-object-fields.cocci` for the
position, quantity, quality and barter-total builtins. Their object receivers
use `uw_object_hdr_t *`; floor fallback uses `uw_tile_t::floor_height`.
VM argument offsets remain VM accesses. The x/y masks intentionally retain
the original masked `uVar7` snapshot; quality keeps the old chain/low-byte
temporaries. The z update reconstructs the complete `uVar8` word before the
final word store. These snapshots preserve original temporary values.

`void_object_headers` checks 118 read forms against original expressions over
all 65,536 words, including signed byte reads, stores and addresses, unrelated
buffers, extension exclusions and idempotence. Its standalone runner accepts
`--asan`. `babl_objects` extracts the five actual builtins and exhaustively
checks getters, sentinel and negative setters, floor fallback, quantity,
quality, barter results and neighboring storage. The same tests also pass
against the pre-conversion builtins. This batch removes 35 raw-access inventory
entries; 138 remain, alongside packed operations requiring further review.

### Projectile launch and settling fields

`generate_projectile_lifecycle_rules.py` generates the function-scoped
`projectile-lifecycle-fields.cocci` recipe for dropped items, ranged ammunition,
mobile arena replacement and settling. Launch copies header `quality` into
projectile `lifetime`, and saves header `heading` in `original_heading` at byte
26. Settling restores the three-bit header heading from that byte. Existing
item-class guards stay in place: byte 26 has other meanings in other record
layouts. These conversions never interpret projectile coordinate words as NPC
status or goal fields.

The settling recipe retains the resulting packed word in `uVar11`, so a live
consumer of that temporary remains valid. Its low-three-bit source mask also
makes the saved byte's truncation explicit. No service call or pointer capture
is moved. `test_projectile_lifecycle_fields.py` checks scope and idempotence,
compares entire record buffers against independent byte expectations for all
16,777,216 heading-byte/position-word combinations, and verifies the returned
word temporary. It tests the converted access sequences; the game unit tests
provide the surrounding function coverage. Optional `--asan` enables address
sanitization, and `--reference-dir` checks exact conversion of saved pre-change
source functions against their current bodies.

### Shared mobile consumers and locally proved NPC storage

The shared-mobile recipes also cover combat durability/health, collision
animation bytes, player-position access and picking diagnostics. These use
only fields common to NPC and projectile records. The `emit_tile_features`
height recipe names `precise_z` only after the existing non-NPC and mobile
arena gates, retaining its signed `short` interpretation. A typed player
receiver uses `g_player_object->hdr` directly.

`generate_mobile_consumer_rules.py` emits three narrower NPC conversions:
`detect_npc_wander_proximity` retains its saved current-NPC pointer when
clearing AI bit 0; `apply_melee_damage` tests status bit 10 through
`status_word_high` within its NPC armor branch; and `npc_ai_default_tick`
names the goal low-byte store only with the adjacent current-NPC capture and
snapshot sequence. The last function also uses `npc_rec` for other record
roles, so a function-wide NPC extension map would be unsafe. The original
snapshots, low/high store sequence and global receiver reads remain intact.
AI bit 0, status bit 10 and animation bits retain their masks because their
individual property meanings have not been verified.

`test_mobile_consumer_fields.py` checks 1,310,720 packed-byte cases before and
after the generated rules, with independent expected bytes for health,
animation, player height and NPC goal updates. It checks signed projectile
height, the saved word results, scope exclusions and idempotence, with
optional `--asan`. These are access-sequence regressions; the game unit tests
cover the surrounding consumers. Source audit counts remain a conservative
work list, not a completion certificate.

### NPC target, goal and animation updates

`generate_npc_goal_rules.py` generates `npc-goal-fields.cocci`. Its reviewed
function scopes name complete target-to-player updates, four adjacent
snapshot/frame cycles, the idle behavior frame store, and both branches of
`npc_clear_special_goal`. The target mask `0xf01f` plus `0x10` sets the entire
eight-bit `npc_gtarg` to 1, preserving goal and frame. The low-nibble XOR
copy in the special-goal fallback copies `npc_level` into `npc_goal`; it does
not toggle goal bits. Level zero instead selects goal 2 and target 0.

Frame cycles name `npc_animation_frame`, while retaining all original scalar
snapshots and modulo results. Saved-alias cases are restricted to functions
where inspection proves the alias and current receiver stay equal between
the snapshot and stores. No intervening callback or record write occurs in
those sequences. The target update stays before `refresh_npc_target_delta`,
and later operations continue reading the current receiver after callbacks.

`test_npc_goal_fields.py` extracts the real reaction and special-goal helpers.
Independent byte expectations cover 5,242,880 cases, including callback changes
to the current NPC, all packed goal words, every level, branch gates, and RNG
paths. A further 262,144 reduced frame cases check returned live snapshots,
neighboring bytes, scope and idempotence. `--asan` sanitizes both harnesses;
`--reference PATH` additionally compares callback-event hashes against saved
pre-change helpers and verifies exact source conversion of every changed
function. Unrelated packed goal snapshots and shared-label stores remain for
separate review.

### Player movement and teleport coordinates

`generate_player_position_rules.py` generates `player-position-fields.cocci`
for `commit_player_move`, `begin_directional_move` and
`set_player_tile_position`. It names shared tile coordinates, header fine
coordinates/height/heading, fine heading and clock-driven animation frame.
Masked scalar snapshots retain their original values. When a temporary held
the complete newly assembled word, the recipe assigns the property and then
captures that complete word in the same temporary. Callback boundaries and
current-player reads stay in place.

Teleport's `0xefff` mask followed by high-byte `0x0c` sets the entire three-bit
y coordinate to 3: it clears bit 12 and forces bits 10/11. Its corresponding
x formula selects 3. The chain reset clears the whole word, preserving the
old `next << 6` snapshot; the original intermediate assignment made quality
zero before its low-byte read, so both quality and next finish zero.

`test_player_position_fields.py` extracts the real movement commit. Independent
byte expectations cover 2,097,152 cases with tile relinking, signed heights,
turn interpolation, clock frames, landing paths and callback-selected player
records. Optional `--reference-dir` compares saved original movement event
hashes and exact source conversion of all three functions. A further 524,288
teleport field cases check fixed coordinates, chain clearing, preserved
snapshots, scope and idempotence. `--asan` sanitizes both harnesses.

The cross-word byte stores in `reset_player_object_record` required a
complete-function review; their verified zero-based reduction is described
below.

### Zero-based player record reset

`generate_player_reset_rules.py` generates `player-reset-fields.cocci`. The
complete original function body must match, including the full zero clear,
ordinary scalar temporary, exact stores and return. It cannot fold a partial
initializer with added callbacks, live/escaping temporary uses, a volatile
scalar or a different clear size. The recipe disables Coccinelle's optional
qualifier matching, so the volatile guard is enforced by the generated patch.

`ce_memset` in `ordinal_stubs.c` is the ordinary memory-only wrapper. After
its full record clear, the original cross-word byte reads are zero. The
transient door-direction bit is overwritten with zero before the final item
ID update. The final record is zero except item ID `0x7f` and status word
`0x00fd`, so the replacement uses those named fields and the schema's size.
The status initializer intentionally remains a whole-word literal: its bits
4-7 have no verified property names. No meaning is inferred for those bits.

`test_player_reset_fields.py` compiles the actual reset and the real memory
wrapper. Independent byte expectations and a saved original initializer
check 262,144 varied input records/slots, all surrounding guard bytes, pointer
identity and the single clear call. It also checks the complete-function
conversion, idempotence and all preservation guards. `--asan` enables address
sanitization; `--reference PATH` checks conversion of saved source.

## Inventory and held-item save-record words

`generate_inventory_record_rules.py` emits `inventory-record-words.cocci` for
`serialize_inventory_link_chain`, `deserialize_inventory_link_chain`,
`build_player_save_record`, and `restore_player_save_record`. These audited
copies transfer the eight-byte common header between the level arena and a
separate save buffer. Adjacent low/high byte stores become direct copies of
`type_flags`, `position_word`, `chain_word`, and `link_word`; unknown and
reserved bits are preserved. The player save's tile-chain clear uses `next`,
and held-item quantity tests use `is_quant`. The copy order, record allocation,
recursive traversal, equipment remapping, and live scalar values stay intact.

Apply the patch to `src/inventory.c` and `src/player.c` with `--all-includes
--include-headers-for-types -I . -I src --in-place`. The conversion test checks
exact source conversion and idempotence, excludes other functions, and rejects
merging pairs across callbacks. It executes the real before/after functions
through the cold-arena save fixture over 65,536 header-word values, comparing
all arena and save-buffer bytes, nested containers, equipped objects, quantity
stacks, and both quantity and container cursor items. `--reference-dir` accepts
saved original `inventory.c`/`player.c` files; `--asan` enables AddressSanitizer.

The remaining encoded-link masks in these helpers act on standalone link words
or save-index/equipment tables, whose storage is not an object header. Full
packed-word copies are intentional: replacing them with selected properties
would drop other header bits. The 27-byte player copy includes unnamed extension
bytes and remains a complete record copy rather than guessed NPC properties.

## Scripted trap-pair initialization

`generate_trap_pair_rules.py` emits `trap-pair-fields.cocci` for
`create_scripted_trap_pair_at_tile`. Both region-zero allocations are stationary
objects with a common header. The exact complete initializer names object IDs, the reserved
flag slice, enchanted/direction/invisibility/quantity bits, position components,
quality, next, owner, and link. The first marker faces heading zero; the second
keeps its existing heading. Both use sub-tile coordinates (3,3). Intermediate
position stores overwritten before the next callback are folded only when the
entire function, including every capture and call, matches. Added callbacks,
changed capture formulas, escaping/live observations, and volatile captures
prevent conversion. Scalar snapshots and their formulas remain in
place, including the second object's captured position/heading and type words.

Apply with `--all-includes --include-headers-for-types -I . -I src --in-place`.
`test_trap_pair_fields.py` checks exact old-to-current conversion, idempotence,
function scope, and rejection of added callbacks, changed captures, live or
escaping temporary observations, and volatile captures. The actual
before/after functions run through 393,216 cases covering all 65,536 initial
word patterns, code nibbles, signed tile coordinates, unchanged and callback-
mutated records, both allocation failures, full records, and surrounding guard
bytes. Callback observations include the complete records at each allocator,
tile lookup, index encoder, insertion, and free. `--reference` accepts the saved
original `traps.c`; `--asan` enables AddressSanitizer.

The tile-height byte extraction remains a tilemap operation outside the object
header schema. Full captured type/position/chain words and scalar masks remain
until a separate liveness-guarded cleanup proves them removable or narrows them
without changing an observed temporary. Other trap helpers' undocumented NPC
status bits still require independent semantic evidence.

## Trap dispatcher and quest/marker consumers

`generate_trap_consumer_rules.py` emits `trap-consumer-fields.cocci` for
`dispatch_trap_type_effect`, `apply_quest_event_numeric_effect`, and
`remove_trap_chain_marker`. Dispatcher trap inputs are common eight-byte
headers; switch selectors, quality/owner slices, quantity flags, and link
presence use named properties. Captured full words keep their exact values.
The stationary spawn path copies named header words, while the region-one
path retains the complete 27-byte record copy, including unknown extension
bytes. Spawned container links and cloned next/content clears use `link`/`next`.
Placement uses `xpos`, `ypos`, and `zpos` in an exact adjacent capture/call
block while retaining the complete `uVar4` snapshot. A callback inserted between
that capture and the placement call prevents this rewrite.

Numeric quest effects read `zpos` and `quality`, and write `zpos` without
changing heading or sub-tile position. Their accessor index deliberately keeps
`link & 0x1ff`: the original `0x7fc0` mask selects only nine link bits.
Marker deletion's four-bit value spans `flags_res` and `enchanted`; its
cross-property captured-word calculation remains intact. The decrement writes
those two named slices and preserves every other bit, including zero wrap.
The whole marker function must match, including capture formulas, calls and
qualifiers; other edits invalidate conversion. Source comments and function
placement remain intact. No semantic NPC field is inferred from these headers.

Apply with `--all-includes --include-headers-for-types -I . -I src --in-place`.
`test_trap_consumer_fields.py` checks exact old-to-current conversion,
idempotence, scope, callback barriers, and marker capture/escape/volatile
guards. Its real before/after helpers run 786,432 cases: 524,288 dispatcher
case-seven spawn scenarios cover all initial words, stationary/mobile copies,
allocation failures, blocked NPCs, placement failure, and callback-mutated
clones; 131,072 marker cases cover all four-bit counter states and wraparound;
131,072 numeric quest cases cover terrain and linked-object paths, signed
contexts, and the narrower link index. All record/guard bytes and callback
observations are compared. Other dispatcher branches' pure named reads follow
the already verified common-header layout and are also covered by existing
trap/layout tests; this oracle does not claim exhaustive dispatcher coverage.
`--reference` accepts the original `traps.c`; `--asan` enables AddressSanitizer.

`generate_debris_rules.py` / `debris-fields.cocci` convert
`spawn_effect_debris_burst`'s template and allocation to typed common-header
pointers, copy its four header words directly, and name the object ID and
x/y/z writes. All three callers pass live objects; the stationary allocator
returns separate whole slots, so the word copies do not encounter partial
source/destination overlap. The template's `void *` input is independently
audited here: the generic pointer-role audit conservatively lists its local
alias for review rather than inferring the caller contract.

The complete original function must match, including random calls, coordinate
retry loops, scalar captures, list callbacks, and scheduling failures. Added
callbacks, volatile captures, changed arithmetic, and escaping/observed
locals reject the rule. Full type/position captures and the computations of
`uVar9`/`uVar10` remain intentional packed operations: they retain the original
scalar values and sampling times while named fields describe the writes.
The function and its existing comments stay in place.

`test_debris_fields.py` checks the checked-in rule, exact conversion,
idempotence, scope/capture/callback guards, and 786,432 executions of the real
original/current function bodies. The oracle sweeps every 16-bit template
pattern, uses an unaligned packed template, exercises random retries,
callback mutations and scheduler failures at each possible burst position,
and compares every record/guard/template/tile byte plus callback events and
arguments. Run with `--reference PATH` to verify against a saved original
source, and `--asan` for the same oracle under AddressSanitizer.
The worklist now has 233 byte views (14 fewer); four direct word copies and
retained snapshots account for the increase in packed-word entries.

`generate_scheduled_spawn_rules.py` / `scheduled-spawn-fields.cocci` name the
confirmed coordinate writes in `spawn_scheduled_door_texture_object` and
`spawn_scheduled_effect_object`, using typed destination headers. The door
spawner sets z/x/y and retains its full captured position/type values and
coordinate intermediates. Its plain, unobserved self-store is removed. The
effect spawner copies source x/y while preserving the destination z/heading,
then adjusts z; copying the entire position word would change that behavior.
The source high-byte capture becomes a named position-word read with the
same byte value. The order of the x write and subsequent source read remains
important when source and destination alias.

Complete original bodies guard these conversions. Added callbacks, volatile
captures, changed arithmetic or escaping/observed locals reject the rule.
The rules disable Coccinelle's `paren` isomorphism as well as qualifier/cast
and arithmetic isomorphisms: expanding optional parentheses over the door's
large condition caused excessive parsing work, while an exact-body recipe
requires the existing expressions. Functions and comments remain in place;
full-word captures and their packed calculations are intentional to preserve
original scalar values, including intermediates no longer needed for stores.

`test_scheduled_spawn_fields.py` checks the generated patch, exact conversion,
idempotence and rejection guards, then compares 3,145,728 executions of the
real original/current functions. Cases cover every 16-bit destination header
pattern, distinct source coordinates, identical source/destination slots,
null sources, signed height adjustments, callback mutations, level-9/tile/
clearance early returns, allocation failures and each scheduler failure
contract. All record/guard/tile/character bytes, returns, callback arguments
and counts are compared. Use `--reference-dir DIR` with original `doors.c`
and `scheduler.c`, and `--asan` to run the same oracle with AddressSanitizer.
The refreshed worklist contains 218 byte views (15 fewer); remaining packed
captures still require their own review.

`generate_item_scatter_rules.py` / `item-scatter-fields.cocci` convert
`complete_use_item_scatter_spawn`'s common-header clone copies to four direct
word assignments, type/quantity writes to `object_id`, `is_quant`, and `link`,
and placement arguments to named x/y/z fields. The allocated clone uses a
typed header pointer. The active target and fresh stationary slots are whole,
distinct records; partially overlapping byte-copy behavior does not apply.
Only the eight-byte common header is copied, with destination extension/guard
bytes preserved. The target's ID and position reads now use named header
members and the pointer audit recognizes that object role.

The complete original body must match. Callback order, captured IDs/words,
random calls, failed allocations, cursor reset, final discard and update
flags remain intact. All scalar snapshots (`uVar1`, `bVar2`, `uVar3`, `uVar10`)
retain their original values; full-word captures and packed expressions that
compute those values are intentional. Added callbacks, volatile captures,
changed arithmetic and escaping/observed locals reject conversion. Functions
and comments stay in place.

`test_item_scatter_fields.py` verifies patch generation, exact conversion,
idempotence and callback/capture/scope guards. Its real before/after oracle
runs 1,441,792 cases over all 16-bit header patterns, eligible target types,
cursor gates, already-held targets, allocation failures at every clone slot,
callback-modified source/clone fields, quantity conversion and placement
arguments. Every record/guard/tile/player byte, callback event/count, cursor
state and pending flag is compared. Use `--reference PATH` with the saved
original `item_use.c`, and `--asan` for AddressSanitizer. The refreshed
worklist contains 204 byte views (14 fewer); full-word copies and retained
snapshots account for the additional packed-word entries.

`generate_stack_split_rules.py` / `stack-split-fields.cocci` convert the common
header accesses in `extract_matching_object_from_slot` and
`reduce_object_count`. Extraction uses typed source/clone pointers, four
header-word copies, named object-ID slices and quantity checks, and named
`link` writes for both remaining and extracted counts. Reduction uses typed
object pointers and the same named quantity writes. Chain-field addresses
replace arithmetic on object-record pointers. Public argument/return types
and all functions stay in place.

The exact complete bodies retain captured counts before allocation, fresh
header copies after allocation callbacks, full arithmetic intermediates,
chain/list operations, inventory slot updates, UI refreshes and container
weight bookkeeping. Word-copy sources and fresh stationary allocations are
distinct whole records, so there is no partial overlap. Added callbacks,
volatile captures, changed arithmetic and escaping/observed temporaries
reject conversion. The generic role audit conservatively lists extraction's
`puVar3` for review because `find_object_in_link_chain` returns `char *`;
independent inspection confirms it returns the input object cursor or an
object reached through `resolve_object_link`/recursive object-chain search.
That contract justifies the local header type without widening automatic
sweeps. Slot-table packing and legacy container metadata/previous-pointer
walks retain their existing layout and behavior; they are outside these
common-header rules and still need a separate layout audit.

`test_stack_split_fields.py` checks generation, exact conversion, idempotence
and callback/capture/scope rejection. Its 2,621,440 real before/after executions
cover all 16-bit link-word patterns, matching and failing category/subcategory/
quality filters, direct/nested/open-container routes, empty/not-found cases,
non-quantity and special quantity kinds, zero/positive/signed/high-bit counts,
allocator-mutated source words, borrowed-slot rewrites and container weights.
All object/guard/player/slot/synthetic-container bytes, returns, carry weights,
callback arguments/events/counts and allocation counts are compared. The
well-formed synthetic container metadata exercises the existing walks; it
does not establish a new layout for the real container-state allocation.
Use `--reference PATH` with the original `item_use.c` and `--asan` for the
same oracle under AddressSanitizer. The worklist now contains 190 byte views
(14 fewer); named full-word copies and retained captures remain intentional.

`generate_durability_rules.py` / `durability-fields.cocci` convert
`apply_object_durability_damage` to a local common-header pointer and named
`quality` and `owner` stores. The special object-ID range retains its existing
five-bit counter inside `owner`; no new semantic property is inferred for
that slice. The full link/chain captures, signed depletion arithmetic,
mobile hit-point path and destruction callback remain intact. Named writes
preserve the adjacent `link` and `next` properties.

The complete original-body rule rejects changed callbacks, volatile or
escaping captures, altered masks and intervening writes. The regression
test requires an actual exact conversion, verifies generation/idempotence
and rejection guards, then compares 1,179,648 executions against the original
function. Cases cover every 16-bit link/chain pattern, signed damage,
independent small damage/quality depletion boundaries, ID-range gates,
damage resistance, arena classification, callback-mutated records and
destruction callbacks. Header/extension/guard/actor bytes, return values and
callback events/counts are compared. Use `--reference PATH` with the original
`combat.c` and `--asan` for AddressSanitizer. The refreshed worklist contains
176 byte views (four fewer); the full captured words remain intentional.


`generate_light_decay_rules.py` / `light-decay-fields.cocci` convert the
equipped-light loop in `decay_equipped_light_sources` to a typed header pointer
and named `quality` stores. The burnt-out ID byte pair becomes one
`type_flags = (ushort)(uVar2 - 4)` store: the guarded original ID nibble is
4..7, so subtraction changes only that nibble and restores every captured
flag exactly as the original two stores did. A fresh `object_id` write alone
would preserve current flags rather than the captured flags. Full scalar
snapshots and both tick-phase/bulk-elapsed division paths remain intact.

The complete-body rule and test verify generation, exact conversion,
idempotence and rejection of intervening callbacks, volatile/escaping
captures and changed masks/ranges. The 802,880 before/after cases cover all
16-bit type/chain patterns, signed elapsed ticks and decay intervals, empty
slots, repeated references, depletion boundaries, callback-mutated records,
redraws and ambient updates. Record/guard bytes, return values and callback
events/counts/arguments are compared. Use `--reference PATH` with the original
`player.c` and `--asan` for AddressSanitizer. After incorporating the latest
main and refreshing the audits, the worklist contains 165 byte views, 441
packed-word uses, seven raw audited accesses and nine signed-word views.

Main's diagnostic removal is accounted for in the held-drop and blood-splat
tests by removing only the known environment-gated `fprintf` statements from
their historical expected bodies. Current bodies still require an exact
match (C tokens for blood splats); historical rule application and executable
before/after references remain unchanged. The conversation fixture now sets
its temporary data directory through the runtime options API used by main.

`generate_starvation_rules.py` / `starvation-fields.json` convert the spawned
header in `handle_starvation_penalty` to a typed pointer and named z/x/y
position writes. The link-high self-store and redundant position-low stores
are removed. Full word/byte captures and the original audio, experience,
cursor, allocation, placement, settling, teleport and death/UI callbacks
remain intact; heading and unrelated header bits remain unchanged.

Coccinelle rejected the complete control-flow patch, so this batch uses
`apply_exact_source_rules.py`, a reusable complete-function JSON applier.
It masks comments and literals when locating a definition, rejects ambiguous
definitions, then requires a byte-for-byte original-body match before writing.
Changed callbacks, volatile/escaping captures, masks and intervening stores
reject conversion. The test requires an actual exact conversion and verifies
generation, idempotence, scope and an original body embedded in a comment.
Its 1,179,648 original/current executions cover every packed position word,
callback-mutated player/spawned positions, cursor states, early survival,
allocation/placement failures, teleport gates and both death/UI paths.
Record/guard/player/status bytes and callback arguments/events/counts are
compared. Use `--reference PATH` with the original `player.c` and `--asan` for
AddressSanitizer. The worklist now contains 155 byte views (ten fewer); full
position captures remain intentional.

`generate_ranged_rules.py` / `ranged-fields.json` convert `fire_ranged_weapon`
using the exact-source applier. The spawned pointer uses the projectile layout
constructed by `spawn_object_near_player`; the extracted ammo uses the common
header returned through `extract_ammo_and_refresh`. Named quantity, link,
owner, flag, lifetime and original-heading writes replace byte reconstruction
and self-stores. Complete type/link/high-byte captures and callback order
remain intact. The original caller still launches after a false aim result.

The test requires generation consistency and an actual exact conversion,
checks idempotence and guards against callbacks, volatile/escaping captures,
changed masks, intervening writes, excluded scopes, quoted bodies and ambiguous
definitions. Its 2,621,440 before/after executions cover every source type word,
all source link words, every ammo selector, signed/high-bit/full-width ammo
results, spawn failure, false aim results, callback-mutated ammo/projectile
records, heading gates and sound-producing weapon types. Header/projectile/
guard/player bytes, launch globals and callback events/counts are compared.
Use `--reference PATH` with the original `weapon_swing.c` and `--asan` for
AddressSanitizer. The worklist now contains 145 byte views (ten fewer); full
captured words remain intentional.

`generate_monster_loot_rules.py` / `monster-loot-fields.json` convert
`drop_monster_loot` using the exact-source applier. Its sole caller supplies
the current NPC (`DAT_0010190c`), which justifies the typed mobile pointer and
named home-tile coordinates. Fresh loot records use common-header pointers.
Named x/y/z writes replace position-byte reconstruction, the chain mask/store
pair becomes `quality = 0x28`, and the item drop copies the monster ID's low
six bits to `owner`. Full intermediate word/byte captures, allocation order,
random-item gates and all insertion/settling/drop callbacks remain intact.

The complete-body rule and test check exact generation/conversion,
idempotence and rejection of callbacks, volatile/escaping captures, changed
masks, intervening writes, excluded scopes, quoted bodies and ambiguous
definitions. The 786,432 before/after executions cover every packed position,
chain and link word, complete gold/item argument ranges, allocation failures,
zero-argument gates, signed random results and callback-mutated source/loot
records. Header/guard/tile bytes, placement globals and callback arguments/
events/counts are compared. Use `--reference PATH` with the original `ai.c`
and `--asan` for AddressSanitizer. The worklist now contains 135 byte views
(ten fewer); retained captures remain intentional.

`generate_babl_stuff_rules.py` / `babl-stuff-fields.json` convert
`babl_builtin_x_obj_stuff` using the exact-source applier. The record returned
by the slot accessor uses a common-header pointer. Named heading, owner,
quality, link and flag properties replace byte views and paired stores.
The flag getters retain their script-visible values of 512 and 1024, and the
link setter still forces bit 9 while the getter exposes only the low nine bits.
Full intermediate captures, sentinel checks, class gates and the order of
script-variable reads/writes remain intact. Unknown flag slices keep their
neutral `flags_res` name.

The complete-body rule and test require exact generation/conversion,
idempotence and rejection of changed callbacks, volatile/escaping captures,
masks, intervening stores, excluded scopes, quoted bodies and ambiguous
definitions. The 1,310,720 original/current executions cover every packed
header word, getter/setter modes, sentinel combinations, shared script
variables, script variables aliasing header words and callback-mutated records.
Header/guard/argument/variable bytes and callback events/counts are compared.
Use `--reference PATH` with the original `babl.c` and `--asan` for
AddressSanitizer. The worklist now contains 120 byte views (fifteen fewer);
retained full-word captures remain intentional.

`generate_approach_rules.py` / `approach-fields.json` convert
`npc_combat_approach_tick` using the exact-source applier. Its current-NPC
alias uses a mobile pointer. Named animation frame, speed, home-tile x/y and
header x/y/z writes replace byte reconstruction. The frame still advances
modulo four, gravity remains intact when speed is cleared, and the far-range
position still centers x/y at four and derives z from the destination tile.
All captured words, arithmetic intermediates and callbacks remain in place.
The six remaining packed-word operations in this function are retained
captures. The `animation_flags & 0xc1 | 1` and `attack_pitch & 0xfc | 4`
updates affect undocumented animation/attack-state bits; no semantic property
is invented for them.

The rule test requires exact generation/conversion and idempotence, and
rejects callbacks, volatile/escaping captures, changed masks, intervening
stores, excluded scopes, quoted bodies and ambiguous definitions. Its
4,718,592 original/current executions cover all packed goal, home-tile and
position words, all motion/animation/pitch bytes, distance thresholds of
0/2/3/64/65/65535, active/inactive combat and signed coordinate arithmetic.
Callbacks mutate records and rebind the current NPC; destination tile pointers
also alias position or home-tile words. Full guarded records, tiles, globals,
callback arguments/events/counts are compared. Use `--reference PATH` with
the original `combat.c` and `--asan` for AddressSanitizer. The audited worklist
now contains 110 byte views (ten fewer).

`generate_settle_rules.py` / `settle-fields.json` convert
`settle_mobile_to_immobile` using the exact-source applier. A common-header
alias covers the input, and the allocated immobile record uses a header
pointer; API signatures remain intact. Named z-position, link, object ID and
quality writes replace paired byte stores. Debris keeps the captured low-byte
position arithmetic, extinguishing changes only the ID nibble, and quality
receives the low six bits of the shared hit-points/lifetime byte. The special
effect ID update also uses the named ID property. Captured words/bytes,
callbacks, return values and hazard/discard order remain intact.

The input's mobile/projectile extension casts remain explicit because this
routine handles both layouts; no NPC interpretation is applied to projectile
coordinate words. The four complete header-word copies intentionally preserve
the entire header. Other packed words remain captures or class gates; the
owner-flags probability slice has no documented property name. Player-state
offsets are outside this object-layout conversion.

The rule test requires exact generation/conversion, idempotence and rejection
of changed callbacks, volatile/escaping captures, masks, intervening stores,
excluded scopes, quoted bodies and ambiguous definitions. Its 6,291,456
original/current executions cover complete type/position/chain/link words,
all lifetime/heading/source bytes, movement modes, destruction rolls,
debris counters and center-distance boundaries, extinguishing and class gates,
off-map tiles, allocation failures, scheduler relinking and hazard success/
failure. Callbacks mutate source/destination records, player state and tile
coordinates; allocation can alias the source and tile links can share its
guard storage. Guarded records, tiles, player bytes, globals, callback
arguments/events/counts and returned pointers are compared. Use
`--reference PATH` with the original `ai.c` and `--asan` for AddressSanitizer.
The audited worklist now contains 102 byte views (eight fewer).

`generate_combat_position_rules.py` / `combat-position-fields.json` convert
`npc_combat_position_tick` with the exact-source applier. Named animation
frame, speed, pitch and NPC heading updates replace the three paired frame
stores and several mask/XOR updates. Frame advancement remains modulo four;
speed writes preserve gravity and truncate to seven bits, including the
magic-power-255 case; pitch writes preserve the low attack-state bits.
All captured words, bytes, arithmetic intermediates, random calls and exits
remain intact.

The target's raw `+2` read now uses a common-header alias acquired after the
heading callback. `refresh_npc_target_delta` is the sole source assignment to
`DAT_00101400` and supplies an object-slot accessor result. The role audit
recognizes this global as a common header, without inferring an extension
layout, and the test checks that assignment provenance. Its full low-byte
position snapshot remains a byte view to preserve the original temporary;
the four remaining full-word reads are intentional captures. Animation flag,
AI-bit-4 and low attack-state masks remain because those individual bits have
no documented semantic properties.

The test requires exact generation/conversion and idempotence and rejects
changed callbacks, volatile/escaping captures, masks, intervening stores,
excluded scopes, quoted bodies and ambiguous definitions. Its 6,291,456
original/current executions cover every goal and position word and all
motion/pitch/heading bytes, each frame-update path, distance and vertical-gap
boundaries, both flying pitch ranges, negative random results, special-ability
exits, random-wander branches, heading adjustment and goal fallback. Callbacks
mutate/rebind NPC, target and property pointers; the target can alias the NPC
header. Guarded records, target/property bytes, globals and callback arguments/
events/counts are compared. Use `--reference PATH` with the original `combat.c`
and `--asan` for AddressSanitizer. The audited worklist now contains 97 byte
views: six paired-store views removed and one retained target snapshot added.

`generate_disengage_rules.py` / `disengage-fields.json` convert
`npc_combat_disengage_tick` with the exact-source applier. Named goal-target
and animation-frame writes replace three paired byte stores. The initial
target is exactly one while goal and frame bits remain intact; optional frame
advancement still uses the signed random remainder and modulo-four frame.
Speed resets preserve gravity. The player heading uses its existing typed
pointer directly. All full-word captures, arithmetic intermediates, callback
order and pointer reloads remain intact.

The three remaining goal-word operations are intentional captures, including
the initial masked temporary. The far branch still reuses `uVar6` for a goal
word; the near branch retains the distance captured before proximity detection
for its conversation gate. Animation flags and low attack-state masks affect
bits without documented semantic properties and remain explicit.

The test requires exact generation/conversion, idempotence and rejection of
changed callbacks, volatile/escaping captures, masks, intervening stores,
excluded scopes, quoted bodies and ambiguous definitions. Its 6,815,744
original/current executions cover every goal/position word and motion/pitch/
heading byte, inactive combat, distance thresholds and 16-bit truncation,
signed/high-bit detection and heading results, negative/zero random remainders,
both frame-update paths and conversation gates. Callbacks mutate/rebind NPC
and player pointers and alter deltas after the distance capture; the player
can alias the NPC. Guarded records, globals and callback arguments/events/
counts are compared. Assertions separately check target preservation, frame
advancement, near/far branches and an actual conversation callback. Use
`--reference PATH` with the original `combat.c` and `--asan` for AddressSanitizer.
The audited worklist now contains 91 byte views (six fewer).

`generate_drop_height_rules.py` / `drop-height-fields.json` convert
`check_object_drop_height` with the exact-source applier. Its sole caller
constructs a projectile in arena 1, so the input alias uses that layout and
the reference uses a common header. The test checks that caller provenance.
Named tile x/y and header x/y writes replace paired byte reconstruction and
the packed tile-word store. Full word/byte captures, callback order and the
order of scratch-buffer reads remain intact, including the X write before
the Y read. Three remaining packed-word reads are intentional captures.
The heading shift converts direction units. Raw collision-buffer offsets
remain explicit because that contiguous scratch buffer has no defined UW1
object struct layout.

The role audit now recognizes incoming parameters cast into typed object
aliases, using the same evidence as a cast followed by member access. It does
not infer NPC extensions or approve locals with unproven buffer origins.
Existing reassignment checks still remove parameters reused for unrelated
buffers and their aliases; the AST regression checks both cases. This also
restores alias evidence in earlier loot/drop/debris conversions. Regenerated
scoped rules expose four previously unrecorded raw accesses in
`check_object_fits_in_slot`, which remain on the worklist for conversion.

The drop-height test requires exact generation/conversion, idempotence and
rejection of callbacks, volatile/escaping captures, changed masks, intervening
stores, excluded scopes, quoted bodies and ambiguous definitions. Its
4,194,304 original/current executions cover every type, tile and fine-position
word, full signed/high-bit X/Y projection results, reference aliasing,
collision flags, candidate sorting and both placement results. Callbacks
mutate objects and rebind the scratch pointer during projection, envelope,
height-field and sorting calls, including scratch storage aliasing the header
or extension. Guarded records, local/external scratch bytes, callback arguments/
events/counts and return values are compared. Use `--reference PATH` with the
original `object_actions.c` and `--asan` for AddressSanitizer. The audit now
contains 85 byte views (six fewer) and 11 raw object accesses (four newly found).

`generate_slot_fit_rules.py` / `slot-fit-fields.json` convert
`check_object_fits_in_slot` with the exact-source applier. Source, resolved
slot and ancestor-container objects use common-header pointers. ID category,
subclass and nibble calculations read `object_id`; their masks remain numeric
ID classifiers. The stack gate reads `is_quant` and the ten-bit `link` value:
it rejects quantities greater than one and below 512. Extinguish/restore
writes update only the ID nibble using the captured full type word and the
original captured nibble. The container-weight helper receives the named
`link_word` address. API signatures, live intermediates, recursion, capacity/
acceptance rules, messages and temporary container-link swaps remain intact.
UI container-record offsets have no defined UW1 object struct layout and are
outside this conversion.

The rule test requires exact generation/conversion and idempotence and
rejects changed callbacks, volatile/escaping captures, masks, intervening
stores, excluded scopes, quoted bodies and ambiguous definitions. Its
14,680,064 original/current executions cover all type words and flags,
fourteen equipment/backpack/container slots, nested/root/missing containers,
capacity and signed acceptance masks, food results, light slots, recursive
extinguishing and failed retries, and full signed weight results. Callbacks
mutate source class/flags/link words, inventory-table and container pointers,
player status and scratch-object identity. Guarded records, container/table/
status bytes, globals, messages, callback arguments/events/counts and return
values are compared. The reference's recursive retry calls the reference
function throughout. Separate assertions check quantity boundaries
0/1/2/511/512/1023, nibble restoration and missing-container behavior.
Use `--reference PATH` with the original `item_use.c` and `--asan` for
AddressSanitizer. All four newly audited raw accesses are converted, leaving
seven raw object accesses and 85 byte views. Three additional packed accesses
are now visible: two intentional full-type captures and the named link address.

`generate_scheduler_finish_rules.py` / `scheduler-finish-fields.json` convert
`scheduler_finish_entry` with the exact-source applier. The resolved object
uses its native common-header pointer. The door subtype reads the upper two
owner bits; blocked closure writes `owner`, completion writes `zpos` and
`object_id`, clears `owner` while preserving `link`, and writes the computed
`flags_res`/`enchanted` fields. Full word and byte captures remain in place,
as do callback order, the captured door class and height, early returns,
queue compaction, and the legacy delay-helper API. The ID/subtype masks
classify values, and the final flag arithmetic still computes a live full
word. The six-byte scheduler table has a separate layout; its byte copies
are outside the object-header conversion.

The rule test checks exact generation/conversion and idempotence, rejects
changed callbacks, volatile/escaping captures, masks, intervening stores,
excluded scopes, quoted bodies and duplicate definitions. Its 1,572,864
original/current cases sweep all 16-bit seeds through type, position, chain
and link words, covering unresolved entries, non-doors, opening/closing,
blocked closure, catch-up and despawn gates, and queue removal/compaction.
Callbacks mutate header words, tile globals and queue pointer identity;
guarded object bytes, both queue buffers, globals, callback arguments/events
and counts are compared. Independent assertions check unresolved entries,
blocked owner restoration and link preservation, and owner clearing after
completion. Use `--reference PATH` with the original `scheduler.c` and
`--asan` for AddressSanitizer. The audit contains 79 byte views (six fewer),
440 packed accesses (three fewer), seven raw object accesses and nine signed
word views. This batch does not resolve the five excluded broad catalog tests.
## Geometry arena

`generate_geom_arena_rules.py` writes three files that fold the decompiler's four-byte stores
into the per-frame geometry arena (`uw_geom_arena_t`, `src/headers/geom_arena.h`) back into one
member store, e.g. four `(&DAT_000a85d8)[I] = ...` byte stores become
`UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;`. `I` is still the byte offset the
decompiler computed (vertex * 0xc, record * 0x60). Run them on `src/tmap.c` in this order:

```
python3 tools/coccinelle/generate_geom_arena_rules.py
spatch --sp-file tools/coccinelle/geom-arena-temps.cocci --no-includes src/tmap.c --in-place   # repeat until unchanged
spatch --sp-file tools/coccinelle/geom-arena-dead-temps.cocci --no-includes src/tmap.c --in-place
spatch --sp-file tools/coccinelle/geom-arena.cocci --no-includes src/tmap.c --in-place
```

* `geom-arena-temps.cocci` folds a shifted-byte temporary (`T = (undefined1)((uint)V >> 8);
  (&N)[I] = T;`) into the store, one use per run. The decompiler reuses these temporaries for
  several stores, so a use is only folded while `V` is not reassigned between it and the
  temporary's assignment.
* `geom-arena-dead-temps.cocci` drops an assignment only when the temporary is never mentioned
  again in the function; a reused temporary keeps its assignment (and so keeps the stores that read it).
* `geom-arena.cocci` collapses the four stores (low byte, then the three shifted bytes; or a
  byte followed by three zeros; or a constant followed by three zeros; or four zeros) when `V`
  and the index are not touched between them.

Stores the rules do not recognise (the sign-extended `tex` word, single-byte constant stores of
float exponent bytes, temporaries reused after their value changed) stay as byte stores through
the `DAT_000a85d8`-style macros in `tmap.h`.


## Combat stance fields

`generate_combat_stance_rules.py` emits `combat-stance-fields.cocci` and its
before/after recipe. `apply_combat_stance_rules.py SOURCE` runs Coccinelle only
when the original function is present exactly once and its audited body is
unchanged. It requires Coccinelle's output to match the recipe's C tokens before
writing canonical formatting and comments. Modified calls, masks, volatile or
escaping captures, ambiguous definitions and unrelated scopes are left alone.

`npc_combat_set_stance` reads/writes animation frames and swing charge in their
logical field units, uses a typed target header for height, and updates speed
and pitch without rebuilding packed words. The saved NPC receiver and captured
gravity bit survive the division callback, which can replace the current NPC
and change its record. The speed-only branches have no intervening callback
between capture and store. Animation/path flag masks and the undocumented low
attack-state bits remain unchanged; no named semantic subfields exist for them.

`combat_stance_fields` tests the generated patch, guards and idempotence, then
compares 4,194,304 original/current cases across all word seeds, sixteen stance/
random paths, callback mutations and target aliasing. It compares both guarded
records, targets, templates, globals, return values and callback observations.
Independent checks cover frame clearing/advancement, saturated charge and
preserved goal/target coordinates. The live function is compared by behavior;
its complete source text is not frozen to the generated spelling. Use
`--reference PATH` with the pre-conversion `combat.c`, or `--asan` for the same
matrix under AddressSanitizer. This suite is registered with `UW_SPATCH_TESTS=ON`.
The post-merge audit covers 55 sources and 304 proven pointer roles, with
74 byte views, 451 packed accesses, 12 raw audited object accesses and nine
signed word views. These are remaining work items, not completion evidence.

## Light source header fields

`generate_light_use_rules.py` emits `light-use-fields.cocci` and its original/
converted recipe. `apply_light_use_rules.py SOURCE` checks for one unchanged,
audited original body, runs Coccinelle, and verifies the resulting C tokens
before writing. Changed masks, escaping/volatile captures, inserted callbacks,
ambiguous definitions and unrelated functions are rejected. The production
function remains free to evolve: its test compares behavior, not exact text.

`use_light_source` now reads `is_quant`, `link`, `quality` and `object_id` through
a typed header alias without changing its public interface or moving it. The
link's high-bit special-value test is expressed as `link >= 512`; the captured
quantity still survives inventory callbacks. The four-step light-ID toggle
updates only `object_id`, preserving all unrelated flags. Its low nibble is a
light subtype encoding, not a separate documented object field: the add branch
has nibble < 4 and cannot carry, and the subtract branch has nibble >= 4 and
cannot borrow, so the original masked-byte writes equal an ID increment/
decrement by four.

`light_use_fields` checks generation, Coccinelle application, idempotence and
negative guards. It compares 7,864,320 original/current cases across every type
word, zero/full quality, six link quantities including both sides of the
special-value boundary, lit-widget/ownership paths, null equipment, turn-on/
turn-off and callback mutations. Guarded records, callback order/arguments and
scratch-pointer identity must match; independent assertions verify ID toggles,
quality and preserved flags. `--reference PATH` checks against the original
`item_use.c`; `--asan` runs the same matrix under AddressSanitizer. This test is
registered under `UW_SPATCH_TESTS=ON`. All 71 default game suites also pass.

The refreshed audit covers 55 sources and 305 proven pointer roles with no AST
errors. Raw audited accesses fall from 12 to seven; 74 byte views, 451 packed
accesses and nine signed views remain. Those counts exclude unrecorded aliases
and other structures and are not proof of completion. The remaining raw NPC
AI-flag bit and trap status padding-bit accesses need separate semantic evidence.

## Explicitly promoted field reads

`generate_promoted_field_read_rules.py` / `promoted-field-reads.cocci` extend the
read catalog to expressions where Ghidra casts a signed or unsigned word to
`int`/`uint` before applying a documented field mask. The rules support pointer
and value receivers, masked shifts, positioned masks and unsigned mask literals.
They retain an explicit `int` or `uint` cast on the named field: the source cast
and mask suffix determine the expression's signedness, which can affect later
comparisons with negative values. An explicit cast also preserves the expression
type instead of exposing a narrow bitfield to `sizeof` or `_Generic`.

These rules deliberately exclude unmasked sign-extending shifts, cross-field
masks, narrower `short` casts and whole-word copies. Receivers are evaluated once.
The source sweep replaces object-ID extraction in cursor selection, barter icon
redraw, dropped-object handling, positional-audio heading extraction and the
movement object's byte encoding. The
remaining byte shifts in that last case encode an ID into two output bytes;
they are not object property reads and remain unchanged.

`promoted_struct_fields` verifies reproducible generation, transformation to the
expected property, exclusions and idempotence. It compares original and converted
values for every 16-bit input using the actual UW1 layouts, and separately checks
expression types and comparisons against -1. A callback receiver checks single
evaluation. Run with `--asan` for AddressSanitizer; CTest registration is under
`UW_SPATCH_TESTS=ON`.

The matrix covers 1,489 expressions x 65,536 inputs (97,583,104 comparisons)
and passes under AddressSanitizer. All 71 default suites pass after the six
source conversions. Signed-word views fall from nine to three; the other
remaining counts are 74 byte views, 451 packed accesses and seven raw audited
accesses. The remaining signed views in `redraw_barter_slot_icon` include a
negative mask and an explicit narrow cast; those forms remain separate work
items, along with the broader packed-access inventory and unrecorded aliases.

## Narrowed and special-link header reads

`generate_special_header_read_rules.py` / `special-header-reads.cocci` cover the
three remaining signed-word forms in barter icon drawing. The narrowed negative
quantity mask becomes `is_quant == 0`; the link word's high-bit test becomes
`link >= 512`; casting the signed link word to `ushort` before shifting becomes
an `int` read of `link`. The last cast retains the integer promotion performed
by the original unsigned-short extraction. These are deliberately separate from
the general promoted-read rules, which exclude narrow casts and negative masks.

`special_header_reads` checks all six pointer/value expressions over all 65,536
words, with exact values, signed comparisons, expression types, exclusions,
idempotence and a receiver called once. Nearby signed shifts, cross-field masks
and other link bits must remain unchanged. The suite passes under AddressSanitizer
and is registered with `UW_SPATCH_TESTS=ON`.
All 71 default suites pass after this batch, and the optional CTest registration
passes. No signed-word member accesses remain in `src/*.c`. The latest inventory
still lists 74 byte views, 451 packed accesses and seven raw audited accesses;
those and the unrecorded aliases remain work toward the broader goal.

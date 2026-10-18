# Struct recovery plan

Goal: replace this file's raw `*(TYPE*)(ptr+N)`/bracket-index offset
arithmetic against "backing array" globals with real named C structs,
the way `uw_object_hdr_t`/`uw_mobile_object_t`/`uw_tile_t` (uw.h,
commit 225333e on `struct-recovery`, branched off `npcs`) started for
the object table and level tilemap.

This is explicitly a multi-session effort — there are ~900
`_backing`-suffixed globals in `uw.c` today, only two logical record
types have real structs so far, and even those two aren't fully
converted (see "Status" below). This doc is the working catalog +
methodology so any session can pick it back up without re-deriving
context.

## Why this is worth doing (and where it stops being worth it)

Two different problems currently hide behind identical-looking
`*(ushort*)(ptr+N)` syntax:
1. **Multi-field records** — an object, a tile, a monster-stat-table
   row, a comobj.dat property row. These benefit hugely from real
   structs: `obj->hdr.heading` catches a wrong offset at compile time,
   documents the field inline, and (with bitfields) is provably
   equivalent to the shift/mask it replaces (see Methodology below).
2. **Plain flat buffers** — a pixel buffer, a glyph-width table, a
   palette. These are already correctly modeled as arrays; there is no
   struct to recover, and most of the ~900 `_backing` globals are
   actually this category (leftovers from the earlier "undersized
   global" sweep, which just needed correct *sizing*, not a record
   type).

**Don't try to structify #2.** The first job of touching any new
`_backing` global is deciding which bucket it's in — see Step 0.

## Current migration: structs-attempt-two (2026-10-07)

This branch uses Coccinelle patches in `tools/coccinelle/`, with UW1-only
reference selection and independent layout tests. The historical status below
is retained as prior research; it does not describe the current code.

* `g_player_object` is now `uw_mobile_object_t *`; player reads and byte writes
  have begun conversion. Temporary word/byte casts and untyped caller APIs
  remain and must not be treated as completion.
* COMOBJ storage is now `uw_object_type_props_t g_object_type_props[512]`,
  loaded through struct fields. Most scalar lookups use properties; the
  historical class-relative aliases and diagnostic/fixture byte views still
  need their final sweep. Ownership was
  incorrectly named `is_container`; its native offset-8 bit 7 is now
  `can_have_owner`. The 11-byte UW1 disk format expands to 13 native bytes.
* Mobile heading/hunger padding is now explicit; the old struct placed hunger
  at bit 5 of offset 0x18. NPC target X/Y are six-bit fields at 0x0f, and swing
  charge occupies bits 12-15; the old tentative seven-bit height was incorrect.
* A separate `uw_projectile_object_t` documents the alternate mobile-slot
  layout. The non-NPC physics tick now uses it; the other users still require
  conversion.
* Eleven object allocation/lookup/relocation APIs return header pointers.
  Chain searches and list insertion, append, unlink and recursive deletion
  now use typed object receivers and named common-header fields. Link cursors
  remain packed word pointers. Many other caller locals and API parameters
  still use raw pointers; incompatible-pointer diagnostics expose those sites.
* `object_core` exercises actual creation, both object arena strides, nested
  search and list mutation against independent byte/link expectations.
  It also runs actual nested weight traversal and stack eligibility checks.
* Container disposal, rune insertion and stack inspection APIs are typed.
  A function-scoped sweep exposes remaining audited header-word accesses as
  named packed words. Locals and parameters throughout the remaining APIs
  still require conversion; header casts alone are not the requested end state.
* The current mobile-slot pointer is typed, with many physical byte fields
  and NPC-only goal/status/target reads converted through Coccinelle. Context
  setters and goal/target writers use mobile struct pointers/fields. Temporary
  word casts still remain. `npc_state` compares actual setter results with
  independent packed byte expectations, including unchanged target flags.
* UW1 monster properties now use 64 packed `uw_monster_type_props_t` rows,
  with typed current NPC template pointers. Fixed field aliases and most
  template offsets are replaced by properties; attacks, armor, trading and
  spell selection have dedicated Coccinelle rules. Loader tests compare all
  3072 bytes with OBJECTS.DAT. Other class-property tables, player/despawn
  template pointers and remaining dynamic byte accesses still need conversion.
* `object_layout` exhaustively checks packed field reads, writes and neighbour
  preservation. `object_semantic_patches` checks patch coverage, unrelated
  buffers and idempotence when spatch is installed.

See `tools/coccinelle/README.md` for the full remaining scope and source links.
Do not close the full migration based on the COMOBJ/player subset alone.

## Status (updated 2026-09-29, code-cleanup-first-pass branch)

Note: uw.c is now being split into src/*.c topic files in parallel
(see the code-cleanup goal) -- `g_current_tile`/`g_level_tiles` and
the raw fields they replace may live in a different file than uw.c by
the time you read this; grep for the symbol name, not a line number.

| Record | Base(s) | Stride | State |
|---|---|---|---|
| `uw_object_hdr_t` | `DAT_002046c4` | 8B | Type defined, bit-verified. Only the `heading` field is converted project-wide; `object_id`/`zpos`/`ypos`/`xpos`/`quality`/`next`/`owner`/`link` still raw at their ~300+ call sites. |
| `uw_mobile_object_t` | `DAT_002046b8` | 27B (0x1b) | Header inherited from above. The 19-byte NPC-extra block has real field names for `npc_yhome`/`npc_xhome`/`npc_heading` only (wiki-sourced, only those 3 cross-checked against real code); `npc_hp`/`npc_goal`/`npc_gtarg`/`npc_level`/`npc_talkedto`/`npc_attitude`/`npc_height`/`npc_ai_flags_low7`/`npc_whoami` are typed but **unverified against this binary** — confirm each before trusting it for a write. |
| `uw_tile_t` | `DAT_002029cc` | 4B | Type defined, bit-verified. `wall_tex`, `tile_type`, and `floor_height` now converted project-wide (all known call sites, in src/tmap.c after the cleanup split). `floor_tex` converted at the one call site found this pass (src/tmap.c, the automap-reveal-adjacent read) but **not verified exhaustive** -- a fresh grep for the raw `>> 2 & 0xf`-on-byte-1 pattern hasn't been re-run against the other topic files yet. `door_bit`/`no_magic`/`unk_light`/`obj_head` still fully raw -- `obj_head`'s ~70 call sites all go through the generic `object_list_insert_head`/`object_list_unlink` functions, which also operate on `uw_object_hdr_t.next` (offset 6) via the same byte-offset parameter, so converting it means giving those two functions a real dual-purpose signature first, not just a mechanical find/replace; scoped out of this pass for that reason. |
| `uw_current_view_t` | `DAT_00086e6c_backing` (single instance, not an array) | 0x2e (46)B of a 64B backing allocation | **Done.** `view_x`/`view_elevation`/`view_y`/`view_facing`/`view_shake_x`/`view_shake_y` (sizeof + offsetof verified against a throwaway harness) converted at all ~90 confirmed direct-dereference call sites across uw.c and 5 src/*.c files. A handful of `iVar = DAT_00086e6c;`-then-offset base-pointer-capture sites (src/tmap.c, uw.c's own update_current_view_from_subject) were deliberately left as raw offset math rather than risk misreading how the captured local is reused later in each function. Two bytes ranges (0x0c-0x0d, 0x10-0x11) and the leading/trailing spans (0x00-0x09, 0x14-0x27) have no confirmed call site and are left as honest `_unkNN` gaps. |
| `g_grtile_registry` (was `DAT_0024e090`) | n/a (flat pointer array, not a multi-field record) | 8B/slot, 65536 slots | **Done.** Retyped from a raw byte buffer with manual `&DAT_0024e090 + slot*8` pointer-cast arithmetic at every access site to a real `void *g_grtile_registry[65536]` array. All 3 writers (`uw_register_gr_entry`, the two grtile-alloc paths in what's now uw.c ~22740/22775) and all 4 readers (`FUN_000408fc`, one high-id fallback branch, and both blit paths in src/bitmap.c) converted; zero raw `DAT_0024e090` access sites remain (`grep -n "DAT_0024e090" uw.c uw.h src/*.c` returns only historical prose explaining the old name). Not really a "record" (single homogeneous pointer field, not multiple named fields) so no struct/bitfield verification step was needed -- this was a mechanical retype, closer to the earlier undersized-global sweep than the object/tile/view struct work above, but listed here since struct-recovery-plan.md's own candidate catalog named it. |
| `uw_object_type_props_t` (comobj.dat per-object-type record, was raw `DAT_00202c9X` offsets) | `DAT_00202c90` | 0xd (13)B | **Partial.** New this pass. `sizeof` verified == 13. Only 2 of the ~10 real sub-fields have real names so far (`is_container` at offset 8 bit 0x80, `has_look_description` at offset 0xb bit 0x10) -- both already had a directly-written comment elsewhere in the codebase naming that exact byte/mask before this pass, meeting the methodology's evidence bar; everything else (offsets 0, 1-2, 3, 4, 5-6, 7, 9, 0xa, 0xc, plus the unconfirmed remaining bits of offsets 8/0xb) is left as honest `_unkNN` gaps even though several are confirmed multi-bit/multi-value fields via mask reads at other call sites. All 9 known read call sites for the 2 named fields are converted to `g_object_type_props[id].field`; no writes exist for either field. Next session: pin down offset 9 (resistance/trap-flag byte, several individual bits already exercised this session -- see trigger_type_flagged_trap_effect/morph_tile_object_state in src/object_actions.c) and offset 0xa (the "!= 2" combine-class byte) next, both have enough call-site evidence already gathered to be low-effort follow-ups. |

`g_mobile_objects`/`g_static_objects`/`g_level_tiles`/`g_current_tile`
typed-view macros exist in uw.c and are safe to use for new code today.

## Step 0: survey pass (do this before picking the next record type)

`grep -n -iE "byte[- ]stride|byte record|per-object-type|per-tile record|
per-part record|per-point record|per-entry record|-byte table"  uw.c`
is the fast first pass — it already surfaced the candidates in the
table below from comments this project wrote for other reasons (mostly
the undersized-global sweep). It is **not exhaustive**: plenty of
record-shaped data has no comment using one of those phrasings. A
fuller survey should also:
- grep for repeated `* 0x` / `<< 0x` stride-multiply patterns against
  the same base pointer (`grep -n "DAT_XXXXXXXX + .* \* 0x"`) — this
  catches strided access even where no one ever wrote "N-byte record"
  in a comment.
- Cross-check anything found against `_backing` array sizes: a
  `_backing[8192]` array that's actually indexed `base[i*13]` for a
  13-byte record only has ~630 real records, which is worth confirming
  matches the domain (630 doesn't obviously correspond to anything —
  8192 was probably just a round "big enough" guess from the earlier
  sweep, not the real record count; sizing it exactly is part of doing
  the struct properly).
- Skip anything with fewer than ~5 call sites touching offsets past 0 —
  not enough payoff to justify a whole struct + verification pass; a
  couple of named `#define` accessors is enough.

### First-pass candidate catalog (unranked, from Step 0's grep today)

| Candidate | Base | Stride | Evidence | Notes |
|---|---|---|---|---|
| Visible-tile cache record | `DAT_000bc038` family | 0x88 (136)B | Strong — comment gives exact byte span 0..0x87, confirms via render_visible_tile_list's `local_7c*0x88[+off]` | Large field count likely; worth a sub-survey of which of the ~40 formerly-separate globals map to which offset before defining the struct |
| `g_monster_max_stats_table` | `DAT_001007d4` | 0x30 (48)B | Medium — only byte 0 (max HP) is named; rest undocumented | Low call-site count so far (mostly `restore_stat_capped`); confirm real field count before investing |
| ~~comobj.dat object-type property record~~ | `DAT_00202c90` | 0xd (13)B | **Started** — see `uw_object_type_props_t` in the Status table above | ~~High leverage: touches `dispatch_object_action` and other frequently-read gameplay logic~~ |
| Collision candidate record | `DAT_00202c38` | 6B | Strong — exact struct described in comment | Used by `collision_height_envelope`/`FUN_00051dd0`, a hot path — extra care on write sites |
| Model PARTS record | `parse_e_model_file`'s output, offset 0xc14+p\*0x60 | 0x67(103)B *or* stride disagreement, see below | Strong on layout, but **zero runtime consumers** (Mystery 1) | Low priority: correctness-neutral, code-clarity-only. Two comments (lines ~935 and ~7747) disagree on POINT stride (0x2c vs 0xc) — resolve that discrepancy before defining the struct, don't guess |
| Model POINTS record | same parser, offset 8+i\*0xc | 0xc (12)B (3 floats) | Strong | Same low-priority note as above |
| 16-slot 8-byte record table | ~uw.c:25751 | 8B | Needs read — comment mentions "last-update clock, a rate value" | Investigate before scoring |
| 0x12-byte record | ~uw.c:2881, 33811 | 0x12 (18)B | Needs read | Investigate before scoring |
| 0x15-byte record | ~uw.c:52363 | 0x15 (21)B | Needs read | Investigate before scoring |
| 0x42-byte-stride buffer | ~uw.c:52549 | 0x42 (66)B | Needs read | Investigate before scoring |
| 8 contiguous 0x14-byte records | ~uw.c:16893 | 0x14 (20)B | Needs read | Investigate before scoring |
| 4x 0x28-byte records | ~uw.c:60855 | 0x28 (40)B | Needs read, comment says "fixed-width" | Small, bounded (only 4 entries) — likely quick |
| 0x804-byte stride record | ~uw.c:5866 | 0x804 (2052)B | Needs read | Unusually large stride, investigate what this actually is first |
| ~~"current view" record~~ | `DAT_00086e6c` | 0x2e (46)B, single instance not an array | **Done** — see Status table above | ~~Not an array — a single-instance struct overlay, different shape of conversion~~ |

The last dozen rows need someone to actually read the surrounding code
before they're plannable — this table is Step 0's output, not a
finished backlog.

## Methodology (repeat this per record type)

This is exactly what commit 225333e did for the object header and
tile record; do the same steps for each new type.

1. **Pin the layout.** Prefer, in order: (a) an external reference doc
   if one exists and covers this record (uw-formats.txt covers
   objects/tiles; nothing else in this project has an external spec
   yet), (b) this file's own already-written "N-byte-stride record"
   comments, (c) fresh tracing of real field-access expressions. Cross-
   check (a) against (c) before trusting it — this session found the
   wiki's object/tile tables matched this binary exactly, but treat
   that as this-binary-specific luck, not a general guarantee for
   other record types or other reference docs.
2. **Write the struct in `uw.h`**, `__attribute__((packed))`, bitfields
   for sub-byte fields. Name only fields you have real evidence for;
   leave everything else as raw `unsigned char _unkNN[...]` /
   `unsigned short _padNN : W` — an honest gap beats a guessed name.
3. **Verify `sizeof` matches the known stride exactly.** A mismatch
   here means a bitfield width or a gap is wrong — don't proceed until
   this passes.
4. **Verify bit-for-bit equivalence**, not just size. Build a small
   throwaway harness (the pattern from this session's
   `/tmp/bitfield_verify.c`, not currently checked in) that sweeps the
   field's value domain and compares every named field's extraction
   against the original shift/mask expression it's replacing. Do this
   *before* converting any call site — it's the thing that actually
   catches a bitfield-order mistake, sizeof alone won't.
5. **Add a non-breaking typed-view macro** (`g_whatever`) over the
   existing raw base pointer. Never change an existing accessor
   function's return type or a global's declared type as part of this
   step — that breaks every untouched call site's pointer arithmetic
   in one shot (see "Why not just retype the global" below).
6. **Convert call sites in two passes, reads then writes.**
   - Reads first: mechanically find candidates by grepping the exact
     shift/mask expression (e.g. `grep -n ">> 7 & 7\b"` found every
     heading read this session). Hand-verify each site's pointer type
     before converting — `ushort*`, `byte*`, and `char*` base pointers
     all need different offset arithmetic, and this codebase has a
     documented history of exactly this class of bug (pointer-scaling
     truncation). Skip (flag, don't force) any site already entangled
     with a separate known bug (e.g. a pointer-truncation bug feeding
     the offset) — fix that bug in its own commit first.
   - Writes second, individually, more carefully. A read that maps to
     the wrong field just produces a wrong *value* (loud, usually
     caught by regression tests or visual inspection). A write that
     maps to the wrong field position or width can *corrupt* an
     adjacent field silently. Never batch-convert writes with a blind
     find/replace the way this session did for the (read-only)
     wall-texture sites.
7. **Test after every batch, not just at the end**: `./build.sh` clean,
   then `./run-regressions.sh` (all 6 fast scripts every batch;
   `demos/demo_automap.txt` explicitly before calling a tile-record type
   "done", since it's the one script that walks the whole map). For
   anything render-visible, spot check with the existing debug-dump
   env vars (`UW_DEBUG_DUMP_TMAP`, `UW_DEBUG_MODEL`, `UW_DEBUG_DOOR`,
   `UW_DEBUG_OBJCLASS`, etc.) rather than trusting exit codes alone —
   the regression suite catches crashes, not "the torch renders one
   tile off."
8. **Commit per record type** (or per meaningful batch within a large
   one), documenting exactly what's converted vs. still raw, same
   style as 225333e — so the "Status" table above stays truthful and
   the next session doesn't have to re-audit what got done.
9. **"Done" for a record type** means: zero remaining raw offset
   accesses against its base pointer(s) anywhere in `uw.c` (verify with
   `grep -n "BASE_PTR *[+\[]"` returning nothing but the struct
   definition/typed-view macro itself), and the old `_backing` array +
   its `#define` alias collapsed away if nothing references it raw
   anymore.

### Why not just retype the global

The tempting shortcut — change e.g. `char *DAT_002046c4;` to
`uw_object_hdr_t *DAT_002046c4;` and let the compiler force every call
site to be fixed — doesn't work here: this codebase's own established
convention (documented at `g_player_object`'s declaration, uw.c ~386)
is that *every* existing raw-offset call site already explicitly casts
to `(char *)` first specifically so the base pointer's own declared
type doesn't matter to their arithmetic. Retyping the global doesn't
make those sites fail to compile (so the compiler won't find them for
you) — bracket-index sites (`ptr[N]`, relying on the *old* type's
implicit scaling) are the ones that would silently break, and they're
exactly the sites hardest to grep for reliably. Convert call sites
deliberately (step 6) instead of relying on a type change to surface
them.

## Suggested order for the next sessions

1. **Finish `uw_tile_t`** (smallest remaining scope, single base
   pointer, already-defined fields cover half of it): convert
   `tile_type`/`floor_height`/`floor_tex`/`door_bit` reads at
   `tilemap_lookup`'s ~70 call sites. Good second session because the
   methodology is now proven and this is pure repetition of it.
2. **Finish `uw_object_hdr_t`'s remaining fields** (`object_id`, `zpos`/
   `ypos`/`xpos`, `quality`/`next`, `owner`/`link`) across the ~300
   remaining call sites, `g_player_object` first (single global, easy
   to find every site) then the generic object-pointer parameters.
   This is the biggest single chunk of remaining work in the codebase
   — budget several sessions, batched by field (all `object_id` reads,
   then all position reads, etc.), not by function.
3. **comobj.dat property record** (0xd bytes) — next-highest leverage
   after the two in-progress types: well-documented, touches gameplay-
   visible logic (`dispatch_object_action`), bounded call-site count.
4. **Collision candidate record** (6 bytes) — small, well-documented,
   but on a hot path (movement collision) — extra regression care
   (run the slower demo scripts too, not just the default 6).
5. **Visible-tile cache record** (0x88/136 bytes) — biggest of the
   well-documented candidates; do this once steps 1-4 have re-proven
   the methodology a few more times.
6. Everything else in the "needs read" rows of the Step 0 table —
   investigate each before scheduling, some may turn out tiny (the
   0x28-byte×4 table looks like a quick win) and some may not be real
   records at all.
7. Model PARTS/POINTS structs — deliberately last: zero runtime
   consumers means zero correctness payoff, this is pure code-clarity
   work and the stride discrepancy (0x2c vs 0xc for POINTS) needs
   resolving first regardless.

Re-run Step 0's survey periodically — new `_backing` globals appear as
other unrelated fixes land, and some of today's "needs read" rows may
turn out to already be covered once someone looks.

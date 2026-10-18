/* Background music track playback: loads and plays a numbered MOD tracker file (\SOUND\uwNN.mod)
   through the game's COM-style audio interface. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/audio.h"
#include "headers/platform_music.h"
#include "headers/platform_sfx.h"
#include "headers/platform_voice.h"
#include "headers/platform_dosmidi.h"
#include "headers/debug.h"
#include "headers/file_io.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Real background-music playback backend: a vendored, tiny MOD player
 * (third_party/hxcmod -- public-domain HxCModPlayer) plus a real SDL2
 * audio device, hooked in at the construct_and_load_mod_player/
 * start_mod_player_playback/stop_mod_player_playback call sites inside
 * play_music_track/resume_music_playback/set_music_enabled below via the
 * platform_music_* functions declared in headers/platform_music.h -- see
 * platform_music.c for the backend itself and why it's split out into
 * its own file, and those three functions' own comments below for
 * exactly where. */

#define DAT_00202a58 DAT_00202a58_backing[0]
#define DAT_00086370 DAT_00086370_backing[0]
static undefined1 DAT_0024d008;
static undefined1 DAT_0024fa10;
static undefined1 DAT_0024f90c;
/* was `undefined` (1 byte) -- load_voice_sample_page computes `(*(ushort*)(param_3+2)+4)*2 +
   (uint)*(ushort*)(param_3+4)` into this global then reads it back masked with & 0xffff and returns
   it as undefined2... */
static ushort DAT_000853f8;
static ushort DAT_00085400;
static char *DAT_002506ec;
/* Was silently zero -- the resampler's output rate, compared against both real sample rates it
   supports (`== 0xac44` i.e. 44100 and `== 0x5622` i.e. 22050 throughout this file). */
static int DAT_00086368 = 0x5622;
static unsigned short u_WAVE_0008686c[] = u"WAVE";
/* Was a bare scalar, but process_mod_tracker_row indexes it as `(&DAT_00086370)[iVar14]` with
   iVar14 clamped to [0,0x127] -- the same scalar-declared-but-accessed-as-array bug class fixed
   many times this session (e.g. DAT_00086260/DAT_00086264 above). */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined4 DAT_00086370_backing[296] = {
  907, 900, 894, 887, 881, 875, 868, 862, 856, 850, 844, 838, 832, 826, 820, 814,
  808, 802, 796, 791, 785, 779, 774, 768, 762, 757, 752, 746, 741, 736, 730, 725,
  720, 715, 709, 704, 699, 694, 689, 684, 678, 675, 670, 665, 660, 655, 651, 646,
  640, 636, 632, 628, 623, 619, 614, 610, 604, 601, 597, 592, 588, 584, 580, 575,
  570, 567, 563, 559, 555, 551, 547, 543, 538, 535, 532, 528, 524, 520, 516, 513,
  508, 505, 502, 498, 494, 491, 487, 484, 480, 477, 474, 470, 467, 463, 460, 457,
  453, 450, 447, 444, 441, 437, 434, 431, 428, 425, 422, 419, 416, 413, 410, 407,
  404, 401, 398, 395, 392, 390, 387, 384, 381, 379, 376, 373, 370, 368, 365, 363,
  360, 357, 355, 352, 350, 347, 345, 342, 339, 337, 335, 332, 330, 328, 325, 323,
  320, 318, 316, 314, 312, 309, 307, 305, 302, 300, 298, 296, 294, 292, 290, 288,
  285, 284, 282, 280, 278, 276, 274, 272, 269, 268, 266, 264, 262, 260, 258, 256,
  254, 253, 251, 249, 247, 245, 244, 242, 240, 238, 237, 235, 233, 232, 230, 228,
  226, 225, 223, 222, 220, 219, 217, 216, 214, 212, 211, 209, 208, 206, 205, 203,
  202, 200, 199, 198, 196, 195, 193, 192, 190, 189, 188, 187, 185, 184, 183, 181,
  180, 179, 177, 176, 175, 174, 172, 171, 170, 169, 167, 166, 165, 164, 163, 161,
  160, 159, 158, 157, 156, 155, 154, 152, 151, 150, 149, 148, 147, 146, 145, 144,
  143, 142, 141, 140, 139, 138, 137, 136, 135, 134, 133, 132, 131, 130, 129, 128,
  127, 126, 125, 125, 123, 123, 122, 121, 120, 119, 118, 118, 117, 116, 115, 114,
  113, 113, 112, 111, 110, 109, 109, 108,
};
/* DAT_00086810: declared as a scalar but indexed as (&DAT_00086810)[pos] in
   apply_mod_vibrato_effect/apply_mod_tremolo_effect, where pos is a per-channel counter that wraps
   at 0x20 (32) -- a 32-entry sine lookup table for the MOD tracker's vibrato/tremolo effects. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined1 DAT_00086810_backing[32] = {
  0x00, 0x18, 0x31, 0x4a, 0x61, 0x78, 0x8d, 0xa1, 0xb4, 0xc5, 0xd4, 0xe0, 0xeb, 0xf4, 0xfa, 0xfd,
  0xff, 0xfd, 0xfa, 0xf4, 0xeb, 0xe0, 0xd4, 0xc5, 0xb4, 0xa1, 0x8d, 0x78, 0x61, 0x4a, 0x31, 0x18,
};
#define DAT_00086810 DAT_00086810_backing[0]
/* Sizing pass: init_all_sound_channel_slots's own comment already
   says it -- "16 hardware sound-channel slots (0x1a/26-byte
   records)" -- 16*26=416 bytes real need. */
static undefined1 DAT_00202a58_backing[512];
/* Per-music-track duration table, indexed by the current track byte
   (DAT_0023c3a8) at a 4-byte stride; real shipped tracks (data/SOUND/
   UW*.MOD) top out at track 15. Sibling of DAT_000873e0 below, same
   bound.

   REAL DATA (not a "never recovered" table -- confirmed live via a
   Ghidra headless read of UU.exe's own initialized .data at this
   address, /Users/ccuddigan/Projects/UW1/decomp/UW.gpr): each 4-byte
   entry is a track's elapsed-time budget, consumed as
   `DAT_0023c330 * 0x100 + 3` in advance_menu_music_track_elapsed's
   `read_realtime_clock_units() - DAT_0023c280` comparison (each unit
   is 4ms -- see read_realtime_clock_units' own comment in math.c).
   track 1 (the title theme) = 126 -> (126*256+3)*4ms =~ 129s; track 11
   (one of the "track 9/0xb" tracks update_ingame_music_track special-
   cases as short, not a looping bed) = 7 -> ~7.2s. Before this fix the
   backing array defaulted to all-zero, so every track's budget was
   just 3 units (12ms) -- play_music_track's own DAT_0023c330 write
   happens, but advance_menu_music_track_elapsed then reports "elapsed"
   on the very next tick, which is the real cause of music restarting
   on a new random track every few seconds in actual gameplay. Indices
   past 15 are never reached by real gameplay and stay zero-initialized
   padding, same defensive sizing as before this fix. */
static undefined1 DAT_00087414_backing[256] = {
  1,0,0,0, 126,0,0,0, 121,0,0,0, 126,0,0,0,
  136,0,0,0, 45,0,0,0, 38,0,0,0, 33,0,0,0,
  48,0,0,0, 16,0,0,0, 43,0,0,0, 7,0,0,0,
  72,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0
};
#define DAT_00087414 DAT_00087414_backing[0]
static char s__SOUND__0008750c[] = "\\SOUND\\";
static char s_uw00_mod_00087514[] = "uw00.mod";
/* Was always 0 ("audio subsystem not initialized"), with NO writer
 * anywhere in this decompile (every one of the ~15 read sites in this
 * file, grepped exhaustively, only ever compares it -- none assigns
 * it) -- same "lost nonzero initial static value" bug class as
 * DAT_00086368 above, confirmed live by instrumenting play_music_track:
 * every single call during real gameplay (menu music cycling, chargen,
 * dungeon entry) printed `subsys=0`, so play_music_track,
 * resume_music_playback and set_music_enabled all permanently took
 * their very first early-out branch -- this flag (together with its
 * DAT_00087448 "music enabled" sibling right below) is genuinely the
 * first-order cause of "no music playback", ahead of waveOut being
 * stubbed.
 *
 * UPDATE (real music playback): the "fix this flag -> unlocks
 * construct_and_load_mod_player -> SIGSEGV in its internal dynamic-array
 * bookkeeping" chain described above is all still accurate for the
 * decompiled MOD engine itself (construct_and_load_mod_player/
 * start_mod_player_playback/stop_mod_player_playback and the ~1400
 * lines/20+ functions under them later in this file) -- that code is
 * still never reached and the struct-layout problem above is unchanged.
 * What changed is that play_music_track/resume_music_playback/
 * set_music_enabled no longer call through to any of that: they go
 * through a small vendored MOD player + real SDL2 audio device instead
 * (see this file's "Real MOD playback backend" block comment, right
 * before play_music_track). This flag is now genuinely set to 1 by
 * platform_music_init (called from gx_stub.c's GXOpenDisplay) once that
 * backend actually succeeds in opening a real audio device -- and left
 * at this original default of 0 otherwise (no audio hardware, e.g. in a
 * CI/sandboxed environment), which still falls back cleanly to this
 * gate's original "subsystem not initialized" silent behavior.
 *
 * Not static: platform_music.c's platform_music_init (in its own
 * translation unit) sets this directly on success -- see
 * headers/audio.h's extern declaration. */
int DAT_00087454;
/* "Is music currently enabled" -- same lost-initial-value bug class as
 * DAT_00087454 just above.
 *
 * UPDATE (real music playback): now set to 1 alongside DAT_00087454 by
 * platform_music_init on success, for the same reason -- see that
 * comment just above. Not static, for the same reason as DAT_00087454. */
int DAT_00087448;
static byte DAT_0023c3a8;
static char *DAT_0023c3b8;  /* the MOD-player engine object */
static undefined1 DAT_0023c384;
static undefined4 DAT_0023c280;
static undefined4 DAT_0023c330;
static short DAT_0023c32c;
/* "Is the sound-effects subsystem initialized" -- the exact same
 * "lost nonzero initial static value" bug class as DAT_00087454/
 * DAT_00087448 above (its music-subsystem twin), confirmed the same
 * way: a live Ghidra memory dump of UU.exe's own initialized .data at
 * this address reads 01 00 00 00 (1), not 0, and every one of this
 * file's ~6 read sites (play_positional_sound_effect,
 * play_sound_effect_with_pan, play_sound_effect_at_object,
 * set_sound_effects_enabled, is_sound_effects_enabled) only ever
 * compares it, never assigns it. Before this fix it defaulted to 0,
 * so all three of this cluster's real positional/pan SFX call sites
 * took their early-out `return 0xff` branch on every single call --
 * allocate_and_play_sound_channel (and therefore
 * trigger_sound_sample_note/platform_sfx_play) could never be reached
 * through any of them, regardless of allocate_and_play_sound_channel's
 * own id-whitelist gate (see that function's own comment) or the sfx
 * engine itself being real. This, not the id-whitelist, was the actual
 * first-order reason no positional sound effect ever played.
 *
 * UPDATE (real SFX playback): now genuinely set to 1 by
 * platform_sfx_init (in its own translation unit, platform_sfx.c) once
 * that backend actually succeeds in opening a real audio device --
 * exactly mirroring DAT_00087454/platform_music_init -- and left at
 * this original default of 0 otherwise (no audio hardware), which
 * still falls back cleanly to this gate's original silent behavior.
 * Not static, for the same reason as DAT_00087454: platform_sfx.c sets
 * it directly -- see headers/audio.h's extern declaration. */
int DAT_00087450;
/* "Are sound effects currently enabled" -- DAT_0008744c's own twin of
 * DAT_00087448 ("is music enabled"), same lost-initial-value bug,
 * same live-memory-dump confirmation (01 00 00 00), same fix: set to 1
 * alongside DAT_00087450 by platform_sfx_init on success. Not static,
 * for the same reason. */
int DAT_0008744c;
/* Sizing-audit pass: max real index is 0xff*5+4=1279 (confirmed by
   the comment below, an 8-bit id field * 5-byte stride) -- a HARD
   bound. Sized all 4 siblings to 1280; down from 8192. */
/* BUG FIX (DOS audio mode): these four per-sound-id bytes are a five-byte
   record per id, and the decompile never recovered their contents -- the
   backing array is zero-filled. DAT_0023c2b2 is the record's base VOLUME,
   so with it at zero play_positional_sound_effect/play_sound_effect_with_pan
   compute `volume_bias + 0` and many call sites pass a bias of 0, which
   would make the sound silent if the value were ever actually used. In the
   shipped port it never was (see trigger_sound_sample_note's comment: the
   volume is computed, forwarded two levels and then provably discarded).

   DOS mode does use it, and the DOS game's equivalent base is SOUNDS.DAT's
   own per-effect velocity -- real data we have. audio_set_effect_base_volume
   below lets platform_dosmidi_init fill these in from it, which makes the
   port's existing attenuation math (the same `vol * (0x30 - dist) / 0x28`
   the DOS engine uses) produce the right answer instead of zero. */
static undefined DAT_0023c2b0_backing[1280];
#define DAT_0023c2b0 DAT_0023c2b0_backing[0]
/* Same per-sound-effect-id table shape as DAT_0023c2b0 just above (all four indexed by
   play_positional_sound_effect's own `id*5`-stride iVar10) -- were lone scalars, so every id past 0
   read into whatever the compiler placed next... */
#define DAT_0023c2b1 DAT_0023c2b0_backing[1] /* Same five-byte ARM sound metadata record. */
#define DAT_0023c2b2 DAT_0023c2b0_backing[2] /* Same five-byte ARM sound metadata record. */
#define DAT_0023c2b3 DAT_0023c2b0_backing[3] /* Same five-byte ARM sound metadata record. */
static byte DAT_0023c39c;
/* allocate_and_play_sound_channel indexed these two by raw hardcoded
   original-binary literal addresses (0x23c338/0x23c350) rather than
   real declared globals -- same "hardcoded address" bug class as
   probe_save_slots's -0x87020 and the g_inv_hotspot fix elsewhere in
   this file. No symbol was ever recovered at either address (nothing
   else in the whole decompile references them), so on this 64-bit
   recompile those writes landed on literal address 0x23c338/0x23c350
   in the process's own address space -- unmapped, so a guaranteed
   SIGSEGV the first time a sound effect played. Declared as the real
   4-entry (one per sound channel) per-channel state/group arrays this
   indexing implies and rewritten to index them properly.

   Sizing-audit pass (real, reachable OOB write, not hypothetical):
   allocate_and_play_sound_channel's own bit-scan loop over
   DAT_0023c39c is bounded to `uVar2 < 4`, but DAT_0023c39c's bits are
   only ever OR'd in (`DAT_0023c39c = DAT_0023c39c | bVar1`) and never
   cleared anywhere in this whole decompile -- confirmed by grepping
   every reference to DAT_0023c39c/g_sound_channel_state/
   g_sound_channel_group project-wide: both arrays are write-only (no
   code anywhere ever reads them back to free a slot), and nothing
   clears the bitmask. So once 4 distinct successful calls have each
   claimed one of the 4 bits (entirely plausible: the id-whitelist
   below allows 7 distinct ids, and nothing ever resets this), the
   bit-scan loop runs out all 4 iterations and exits with uVar2==4 --
   one past the end of both 4-entry arrays. Confirmed via a live
   Ghidra decompile of the real FUN_00073064 that this is the real
   original binary's own behavior (identical loop/bound), not a
   decompile-introduced bug. Widened both arrays by one defensive slot
   purely for memory safety (same "pad for a confirmed-reachable
   out-of-bounds index" class as this project's other backing-array
   sizing fixes) -- not a behavior change: index 4 is still never
   read by anything, so the extra slot just gives the write somewhere
   safe to land instead of corrupting whatever static happens to sit
   next in memory. */
static byte g_sound_channel_state[5];
static ushort g_sound_channel_group[5];
/* Sizing-audit pass: 0 writers, used only as a path-string argument
   (audio.c's SetFileTime-named ordinal stub), content unrecovered.
   Sized to 128 for headroom as a path-text fragment; down from 8192. */
static undefined DAT_0023c3d4_backing[128];
#define DAT_0023c3d4 DAT_0023c3d4_backing[0]
static char *DAT_0023c3bc;  /* sound-channel slot record */
static int DAT_0023c378;
/* Sibling of DAT_00087414 above -- same per-track, 4-byte-stride
   indexing by DAT_0023c3a8, same real bound (max shipped track 15).

   REAL DATA (same Ghidra headless read as DAT_00087414 above): this
   table and DAT_00087414 are contiguous in UU.exe's real .data (this
   one sits 0x34/52 bytes before it, so its own indices 13-15 are
   literally DAT_00087414's indices 0-2), used in
   update_ingame_music_track as a per-track "is this an ambient-cycling
   track" flag (`*(int*)(&DAT_000873e0 + track*4) == 0`). Before this
   fix it defaulted to all-zero -- i.e. "yes, every track is ambient,
   always reselect" -- compounding the same DAT_00087414 bug above. */
static undefined1 DAT_000873e0_backing[256] = {
  0,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
  1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  1,0,0,0, 1,0,0,0, 126,0,0,0, 121,0,0,0
};
#define DAT_000873e0 DAT_000873e0_backing[0]
/* BUG FIX (missing table data): was a plain zero-initialized
   `undefined4` -- get_audio_subsystem_flag's own comment used to say
   this is "not otherwise written anywhere in this decompile (always
   its zero-initialized default)", which is true for CODE writers, but
   the real UU.exe .data byte at this address, confirmed via a live
   Ghidra memory read (same technique as DAT_00087414/DAT_000873e0/
   DAT_00087520 above/below), is `01 00 00 00` -- i.e. this flag
   defaults to 1 (enabled), it's just never written by any function,
   only ever read once (by get_audio_subsystem_flag itself). Left at 0
   here, render_babl_dialog_window's own `bVar4 = get_audio_subsystem_flag();
   local_8b = local_8b & 0xdf | (bVar4 & 1) << 5;` (babl.c) permanently
   clears the babl conversation-render state's "voice available" bit --
   confirmed live: every voiced-line call site this port's demo scripts
   exercise (babl.c's play_numbered_voice_sample call, gated on that
   same bit) traced to zero calls across 10 different demo scripts
   before this fix. Corrected to match the real .data content, making
   the whole numbered-VOC-sample pool (see platform_voice.c) actually
   reachable for the first time. */
static undefined4 DAT_00087458 = 1;
/* Sizing pass: read-only (`pcVar4 = &DAT_00087520;`), a base-directory
   path fragment per its usage context. Real content confirmed via
   direct Ghidra memory export of UU.exe: "\VOC00.WAV". Sized
   generously for a path component; down from 32768. */
static undefined1 DAT_00087520_backing[256] = "\\VOC00.WAV";
#define DAT_00087520 DAT_00087520_backing[0]
static short DAT_002506f0;
static undefined2 DAT_002029c8;
static undefined2 DAT_0024fa14;
static undefined2 DAT_0024d00c;
static undefined1 DAT_0024d010;


// was FUN_00072910 -- plays background music track track_number (patched
// into the "uwNN.mod" filename template via a base-8-style two-digit
// construction -- (track_number>>3)&0xf then track_number&7, NOT a naive
// %02d -- see this function's own "BUG FIX" comment below, and played
// from \SOUND\): no-op if the audio subsystem isn't initialized
// (DAT_00087454/DAT_00087448) or the track is already playing
// (track_number==DAT_0023c3a8). Stops any currently-playing module via
// its COM-style interface (DAT_0023c3b8), opens and loads the new one via
// the MOD-player ordinals (cpp_operator_new/177/construct_and_load_mod_player),
// and -- if flags!=0 -- starts playback (start_mod_player_playback)
// and records the start time and this track's own duration
// (DAT_00087414-indexed per-track table -- see
// advance_menu_music_track's own comment for how it's used) for later
// use.
int play_music_track(byte track_number, int flags)
{
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  char cVar1;
  char *pcVar2;
  undefined4 uVar4;
  /* Was declared as just 2 bytes -- Ghidra only recovered the first access, but this is filled from
     the 9-byte "uw00.mod\0" template right below and local_12e/local_12d (now folded in as direct
     indexed writes) patch the two '0' digits in place at offsets 2/3... */
  undefined1 auStack_130 [16];
  undefined1 local_127;
  char acStack_120 [260];

  ce_memmove(auStack_130,s_uw00_mod_00087514,9);
  local_127 = 0;
  if ((DAT_00087454 == 0) || (DAT_00087448 == 0)) {
    uVar4 = 0;
  }
  else {
    if (track_number != DAT_0023c3a8) {
      pcVar2 = &DAT_0023cca8;
    stack0xffdc3238_ptr = stack0xffdc3238_buf;
      auStack_130[2] = (track_number >> 3) + 0x30;
      auStack_130[3] = (track_number & 7) + 0x30;
      do {
        cVar1 = *pcVar2;
        *stack0xffdc3238_ptr = cVar1; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
        pcVar2 = pcVar2 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_120,s__SOUND__0008750c);
      ce_strcat(acStack_120,auStack_130);
      if (DAT_0023c3b8 != (char *)0x0) {
        stop_mod_player_playback(DAT_0023c3b8);
        if (DAT_0023c3b8 != (char *)0x0) {
          (**(void (**)(void *, int))(uintptr_t)*(uint *)DAT_0023c3b8)(DAT_0023c3b8,1);  /* virtual destructor via the (32-bit) vtable slot */
        }
        DAT_0023c3b8 = (char *)0x0;
      }
      /* BUG FIX (real music playback): the cpp_operator_new/SetFileTime/
       * construct_and_load_mod_player chain this replaces is permanently
       * unreachable -- cpp_operator_new is a hardcoded-NULL stub (see its
       * own comment in ordinal_stubs.c), and even with a real allocator
       * the decompiled MOD engine's internal struct layout is unsafe on
       * this 64-bit host (see DAT_00087454's comment above) -- so
       * construct_and_load_mod_player has never once actually executed.
       * Load the real MOD file through the vendored HxCModPlayer backend
       * instead (see this file's "Real MOD playback backend" block
       * comment above). Builds its own filename directly from
       * track_number rather than relying on acStack_120/auStack_130 just
       * built above (those still depend on an unverified Ghidra
       * split-stack-slot alias, stack0xffdc3238_buf vs. acStack_120, and
       * are genuinely dead).
       *
       * BUG FIX (wrong track playing, e.g. automap/talk/rest-interrupt's
       * track 0xd/13 audibly playing UW13.MOD instead of the real
       * original's UW15.MOD): the file-number digits are NOT track_number
       * formatted in decimal -- confirmed via live Ghidra decompile of
       * the real FUN_00072910, the original (dead) path right above
       * builds them as `local_12e = (track_number>>3)+'0';
       * local_12d = (track_number&7)+'0';`, i.e. each digit character is
       * computed separately (tens = track_number/8, ones =
       * track_number%8), not track_number run through a single base-10
       * conversion. The two schemes agree for track_number 0-7 (e.g.
       * track 2 -> uw02.mod either way) but diverge from track 8 on:
       * track 8 (combat) is really uw10.mod, track 9 is uw11.mod, track
       * 0xb/11 is uw13.mod, track 0xd/13 (automap/talk/rest) is
       * uw15.mod, etc. -- confirmed against the real shipped data/SOUND
       * set, which has exactly the 12 files this formula predicts (01-07,
       * 10-13, 15) and none of the ones plain decimal would ask for
       * instead (08, 09, 14). A naive "\SOUND\uw%02d.mod" with plain
       * decimal formatting (what this fix replaces) silently loaded a
       * real but wrong file for every track >= 8 whose decimal number
       * also happens to exist (9->uw09 doesn't exist so failed silently;
       * 0xb->uw11 exists but is the wrong track; 0xd->uw13 exists but is
       * the wrong track). */
      {
        char uwmod_path[32];
        snprintf(uwmod_path, sizeof(uwmod_path), "\\SOUND\\uw%d%d.mod",
                 (track_number >> 3) & 0xf, track_number & 7);
        platform_music_load_track(uwmod_path);
      }
    }
    DAT_0023c384 = 0;
    DAT_0023c3a8 = track_number;
    if (flags != 0) {
      platform_music_start();
      DAT_0023c280 = read_realtime_clock_units();
      DAT_0023c330 = *(undefined4 *)(&DAT_00087414 + (uint)DAT_0023c3a8 * 4);
      DAT_00087448 = 1;
    }
    uVar4 = 1;
  }
  return uVar4;
}







// was FUN_00072aac -- restarts/resumes playback of the currently-loaded
// music module (same start-playback steps as the tail of play_music_track,
// minus the load), gated on the audio subsystem being initialized and
// DAT_0023c32c (an open-module handle) being valid.
// BUG FIX (real music playback): start_mod_player_playback(DAT_0023c3b8)
// replaced with platform_music_start() -- see play_music_track's own
// comment and this file's "Real MOD playback backend" block comment.
void resume_music_playback()

{
  if ((DAT_00087454 != 0) && (DAT_00087448 != 0)) {
    if (DAT_0023c32c != -1) {
      platform_music_start();
      DAT_0023c280 = read_realtime_clock_units();
      DAT_0023c330 = *(undefined4 *)(&DAT_00087414 + (uint)DAT_0023c3a8 * 4);
      DAT_00087448 = 1;
    }
  }
  return;
}



// was FUN_00072b2c -- returns the currently-playing music track number.
byte get_current_music_track()

{
  return DAT_0023c3a8;
}



// was FUN_00072b3c -- returns whether music is currently playing
// (false if the audio subsystem isn't initialized).
int is_music_playing()

{
  undefined4 uVar1;

  uVar1 = DAT_00087448;
  if (DAT_00087454 == 0) {
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_00072b58 -- is_music_playing's counterpart for the sound-
// effects subsystem (DAT_0008744c/DAT_00087450).
int is_sound_effects_enabled()

{
  undefined4 uVar1;

  uVar1 = DAT_0008744c;
  if (DAT_00087450 == 0) {
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_00072b74 -- enables (param_1!=0: resumes playing
// DAT_0023c384, the current/pending track) or disables (param_1==0:
// stops playback via stop_mod_player_playback) background music.
// BUG FIX (real music playback): stop_mod_player_playback(DAT_0023c3b8)
// replaced with platform_music_stop() -- see play_music_track's own
// comment and this file's "Real MOD playback backend" block comment.
void set_music_enabled(int enable)
{
  uint uVar1;

  if (DAT_00087454 != 0) {
    if (enable == 0) {
      uVar1 = 1;
    }
    else {
      if (DAT_00087448 == 0) {
        DAT_00087448 = 1;
        pick_random_pending_music_track();
        play_music_track(DAT_0023c384,1);
        return;
      }
      uVar1 = 0;
    }
    if (((DAT_00087448 & uVar1) != 0) && (DAT_0023c32c != -1)) {
      DAT_00087448 = 0;
      platform_music_stop();
      DAT_00087448 = 0;
    }
  }
}



// was FUN_00072c10 -- set_music_enabled's counterpart for the sound-
// effects subsystem: enabled==0 disables it (also calling
// stop_current_audio_handle_dup to clean up), enabled!=0 enables it.
void set_sound_effects_enabled(int enabled)
{
  if (DAT_00087450 != 0) {
    if (enabled == 0) {
      DAT_0008744c = 0;
      stop_current_audio_handle_dup();
    }
    else {
      DAT_0008744c = 1;
    }
  }
}






// was FUN_00072c44 -- stops the current sound/music handle
// (stop_mod_player_playback(DAT_0023c3b8)) if the audio subsystem is
// initialized and music is enabled. The gate originally decompiled as a
// Ghidra artifact rather than real original logic -- it read
// DAT_00087448 (elsewhere in this file a plain int on/off flag, e.g.
// is_music_playing) as if it were a pointer value, which only made
// sense as a mis-inferred type from this one call site. That artifact
// has since been resolved into the plain `DAT_00087448 != 0` int test it
// always really was.
//
// BUG FIX (real crash, confirmed live): the gate above was PREVIOUSLY
// believed harmless ("no live bug has been observed from it") because
// DAT_00087454/DAT_00087448 used to be permanently stuck at 0 (see
// their own comment) -- but platform_music_init now genuinely sets
// both to 1 once a real audio device opens, so on any machine with
// working audio this gate now evaluates true and calls
// stop_mod_player_playback(DAT_0023c3b8) unconditionally, with
// DAT_0023c3b8 always NULL (deliberately never assigned -- see
// platform_music.c's block comment). stop_mod_player_playback's own
// body (its "shutdown counterpart to start_mod_player_playback" --
// see that function's comment) writes through param_1+0x10554 with no
// null check of its own, i.e. a guaranteed NULL-pointer write/crash.
// Every *other* stop_mod_player_playback call site in this file
// (play_music_track, set_music_enabled, the dead body of
// trigger_sound_sample_note, etc.) already guards it behind an
// explicit `DAT_0023c3b8 != 0` check first -- this function and its
// stop_current_audio_handle_dup twin were simply missing that same
// guard, decompiled as literally as the rest of the gate was. Two real
// call sites reach this live: handle_starvation_penalty (player.c,
// fires whenever the player starves) and set_sound_effects_enabled
// (hud.c's sound-effects toggle UI / player.c's settings load), both
// via stop_current_audio_handle_dup -- so this is a real, reachable
// crash during ordinary gameplay, not a hypothetical. Adding the same
// NULL guard every sibling call site already has fixes it while
// leaving this function's own decompiled shape/intent completely
// unchanged -- it was always meant to be a safe no-op while
// DAT_0023c3b8 stays NULL, it just wasn't actually safe before.
void stop_current_audio_handle()

{
  if (DAT_00087454 != 0 && DAT_00087448 != 0 && DAT_0023c3b8 != (char *)0x0) {
    stop_mod_player_playback(DAT_0023c3b8);
  }
  return;
}






// was FUN_00072c74 -- plays sound effect sound_id positioned at world
// coordinates (world_x,world_y), with a base volume/id-derived
// parameter block volume_bias: computes the distance from the player
// (integer_sqrt, a sqrt-shaped distance function) and, if within range
// (uVar3<=0x30, else fails outright), derives a distance-attenuated
// volume and a stereo pan (via heading_to_sine_cosine against the
// player's own facing) before dispatching to allocate_and_play_sound_channel with the
// per-sound-effect-id parameter table entries (DAT_0023c2b0/b1/b2/b3,
// 5-byte stride per id). Fails (returns 0xff) if the sound-effects
// subsystem is disabled or the sound is out of range.
//
// BUG FIX (real SFX playback, root cause): "the sound-effects
// subsystem is disabled" was NOT a real runtime condition before this
// fix -- DAT_00087450 was permanently stuck at 0 (see its own comment
// above), so this early-out fired on literally every call, for every
// caller, always. Now that platform_sfx_init sets it (and
// DAT_0008744c) to 1 on success, this function's own body -- already
// correct, matches a live Ghidra decompile of the real FUN_00072c74
// exactly, no dropped arguments -- genuinely runs and reaches
// allocate_and_play_sound_channel/trigger_sound_sample_note/
// platform_sfx_play for the first time. No change was needed here
// beyond the global's own default-value fix.
/* Fills in one sound id's base volume -- the byte the decompile lost. See
   DAT_0023c2b0_backing's comment. Bounded by the real backing array. */
void audio_set_effect_base_volume(int sound_id, int velocity)
{
  unsigned index = (unsigned)sound_id * 5 + 2;
  if (sound_id < 0 || index >= sizeof(DAT_0023c2b0_backing)) {
    return;
  }
  if (velocity < 0) velocity = 0;
  if (velocity > 0x7f) velocity = 0x7f;
  ((unsigned char *)DAT_0023c2b0_backing)[index] = (unsigned char)velocity;
}

int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias)
{
  short sVar1;
  short sVar2;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  undefined1 uVar7;
  uint uVar8;
  uint uVar9;
  int iVar10;
  short local_28;
  short local_26;

  if ((DAT_00087450 == 0) || (DAT_0008744c == 0)) {
LAB_00072f24:
    uVar4 = 0xff;
  }
  else {
    iVar10 = (sound_id & 0xff) * 5;
    uVar9 = (int)world_x -
            ((int)(((g_player_object->tile_word >> 7 & 0x1f8) +
                    (uint)(g_player_object->hdr.xpos)) * 0x10000) >> 0x10);
    uVar8 = (int)world_y -
            ((int)(((g_player_object->tile_word >> 1 & 0x1f8) +
                    (g_player_object->hdr.ypos)) * 0x10000) >> 0x10);
    uVar3 = integer_sqrt(uVar8 * uVar8 + uVar9 * uVar9);
    uVar3 = uVar3 & 0xffff;
    if (uVar3 == 0) {
      uVar7 = 0x40;
      iVar5 = ((volume_bias & 0xff) + (uint)(byte)(&DAT_0023c2b2)[iVar10]) * 0x10000;
    }
    else {
      if (uVar8 == uVar3) {
        sVar1 = 0x7f;
      }
      else if (-uVar3 == uVar8) {
        sVar1 = 0x80;
      }
      else {
        sVar1 = ordint_divmod(uVar3,uVar8 * 0x80).quot;
      }
      if (uVar9 == uVar3) {
        sVar2 = 0x7f;
      }
      else if (-uVar3 == uVar9) {
        sVar2 = 0x80;
      }
      else {
        sVar2 = ordint_divmod(uVar3,uVar9 * 0x80).quot;
      }
      heading_to_sine_cosine(((0x40 - (g_player_object->npc_heading)) * 4 -
                              (((uint)g_player_object->hdr.heading << 7))) * 0x40,
                             &local_28,&local_26);
      iVar5 = (int)local_28;
      iVar6 = (int)local_26;
      local_28 = (short)(char)((ushort)local_28 >> 8);
      local_26 = (short)(char)((ushort)local_26 >> 8);
      iVar6 = 0x40 - (short)((uint)((iVar6 >> 8) * (int)sVar1 - (iVar5 >> 8) * (int)sVar2) >> 8);
      iVar5 = iVar6 * 0x10000 >> 0x10;
      if (0x7f < iVar5) {
        iVar6 = 0x7f;
      }
      uVar7 = (undefined1)iVar6;
      iVar6 = iVar5 + -0x7f;
      if (iVar5 < 0x80) {
        iVar6 = iVar5;
      }
      iVar5 = ((volume_bias & 0xff) + (uint)(byte)(&DAT_0023c2b2)[iVar10]) * 0x10000;
      if (iVar6 < 0) {
        uVar7 = 0;
      }
      /* Out of earshot. Traced because this gate applies ONLY to the
       * positional entry point -- play_sound_effect_with_pan has no
       * distance check at all -- so it is the one thing that can silence
       * landing and door sounds while footsteps keep working. uVar3 is the
       * distance from the player in the same units as the x/y passed in. */
      if (0x30 < uVar3) {
        DEBUG(INFO, "[audio] positional effect %u dropped: distance %u exceeds the 0x30 range "
                    "(at %d,%d)\n", sound_id & 0xff, uVar3, (int)world_x, (int)world_y);
        goto LAB_00072f24;
      }
      if (7 < uVar3) {
        iVar5 = ordint_divmod(0x28,(0x30 - uVar3) * (int)(short)((uint)iVar5 >> 0x10)).quot;
        iVar5 = iVar5 << 0x10;
      }
    }
    uVar3 = iVar5 >> 0x10;
    iVar5 = (int)(short)((uint)iVar5 >> 0x10);
    if (0x7f < iVar5) {
      uVar3 = 0x7f;
      iVar5 = iVar5 + -0x7f;
    }
    if (iVar5 < 0) {
      uVar3 = 0;
    }
    uVar4 = allocate_and_play_sound_channel(sound_id,(&DAT_0023c2b0)[iVar10],(&DAT_0023c2b1)[iVar10],uVar3 & 0xff,uVar7,
                         *(undefined2 *)(&DAT_0023c2b3 + iVar10));
  }
  return uVar4;
}






// was FUN_00072f30 -- play_positional_sound_effect's non-positional
// sibling: plays sound effect sound_id with an explicit pan (passed
// straight through) and a volume boost (volume_bias, added to the
// per-id base volume DAT_0023c2b2[id] and clamped to 0..0x7f) rather
// than deriving pan/volume from a world position.
//
// BUG FIX (real SFX playback, root cause): same DAT_00087450/
// DAT_0008744c default-value fix as play_positional_sound_effect
// above unlocks this function too -- see that function's own "BUG
// FIX" comment. No change needed in this function's own body.
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias)
{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  int iVar4;
  
  if ((DAT_00087450 == 0) || (DAT_0008744c == 0)) {
    uVar2 = 0xff;
  }
  else {
    iVar4 = (sound_id & 0xff) * 5;
    uVar1 = (int)(((volume_bias & 0xff) + (uint)(byte)(&DAT_0023c2b2)[iVar4]) * 0x10000) >> 0x10;
    uVar3 = uVar1;
    if (0x7f < uVar1) {
      uVar3 = 0x7f;
    }
    if (0x7f < uVar1 && (int)(uVar1 - 0x7f) < 0) {
      uVar3 = 0;
    }
    uVar2 = allocate_and_play_sound_channel(sound_id,(&DAT_0023c2b0)[iVar4],(&DAT_0023c2b1)[iVar4],uVar3 & 0xff,pan,
                         *(undefined2 *)(&DAT_0023c2b3 + iVar4));
  }
  return uVar2;
}



// was FUN_00072fc8 -- play_positional_sound_effect's convenience wrapper taking an object pointer
// instead of raw coordinates: extracts the object's world position and forwards to
// play_positional_sound_effect.
//
// BUG FIX (real SFX playback, root cause): same DAT_00087450/
// DAT_0008744c default-value fix unlocks this wrapper too -- see
// play_positional_sound_effect's own "BUG FIX" comment. No change
// needed in this function's own body.
//
// BUG FIX (real crash, confirmed live + via Ghidra): the object pointer
// is dereferenced unconditionally (*(ushort*)(object+0x16),
// *(byte*)(object+3)) with no NULL check -- confirmed byte-for-byte
// against a live Ghidra decompile of the real FUN_00072fc8, so this is
// a genuine latent bug in the original compiled game, not a
// decompile artifact, just never reachable before DAT_00087450/
// DAT_0008744c were fixed to their real nonzero default (see above).
// get_object_record_by_slot_index (this function's own callers'
// shared accessor) legitimately returns NULL for an empty slot --
// already documented at its own definition in objects.c and guarded
// at several other call sites (movement.c, tmap.c) -- and
// play_weapon_impact_sound's own whiff-case branch
// (result==0 in combat.c) calls it with DAT_00100610, which is 0 on
// a swing with no acquired target, passing that NULL straight through
// to here. Confirmed live: swinging a weapon with no target in range
// SIGSEGVs here (crash_backtrace_handler: play_weapon_impact_sound ->
// play_sound_effect_at_object). Guarded the same way the subsystem-
// disabled case already is, matching this function's own existing
// "fails (returns 0xff)" convention.
//
// BUG FIX (real crash, confirmed live via lldb): this object parameter
// was `int` -- a 32-bit truncation of the real 64-bit object pointer
// every real caller passes (e.g. spawn_object_near_player's own
// `play_sound_effect_at_object(10,puVar6,0)`, objects.c, where puVar6
// is a genuine `ushort *`) -- the exact same pointer-truncation class
// fixed repeatedly elsewhere in this codebase (see e.g.
// read_xor_scrambled_block's own param_3 fix in player.c). Confirmed
// live under lldb: dropping an item into a container SIGSEGVs at
// `*(ushort *)(object + 0x16)` with the parameter == 87805 (0x1577d) --
// a small, clearly-truncated value, not a real heap address and not the
// NULL case the fix just above this one already covers. Widened to a
// real pointer type so the full 64-bit address survives the call.
//
// The 0x16/3 offsets below are BYTE offsets into the object record, so
// the arithmetic is done through a `char *` view rather than directly on
// the `ushort *` parameter: `object + 0x16` on a ushort pointer would
// scale by 2 and read byte 44 instead of byte 22, silently reading the
// wrong fields (and past the end of a real 0x20-byte record). The
// parameter itself stays `ushort *` to match every caller and the
// headers/audio.h declaration. Covered by
// test_play_sound_effect_at_object_does_not_truncate_the_object_pointer,
// which pins the exact decoded pan/volume for known bytes at those
// offsets.
int play_sound_effect_at_object(int sound_id, ushort *object, int volume_bias)
{
  undefined4 uVar1;
  const char *record = (const char *)object;

  if ((DAT_00087450 == 0) || (DAT_0008744c == 0) || (object == 0)) {
    uVar1 = 0xff;
  }
  else {
    uVar1 = play_positional_sound_effect(sound_id,((*(ushort *)(record + 0x16) & 0xfc00) >> 7) +
                                 (uint)(*(byte *)(record + 3) >> 5),
                         (*(byte *)(record + 3) >> 2 & 7) +
                         ((*(ushort *)(record + 0x16) & 0x3f0) >> 1),volume_bias);
  }
  return uVar1;
}






// was FUN_0007305c -- currently a no-op stub (Ghidra recovered an
// empty body). Its two call sites, both in movement.c's per-tick
// footstep/jump sound handling, call it right before resetting
// DAT_00086e84 (a sound-handle-in-progress marker) to -1, so this was
// most plausibly meant to stop that in-progress movement sound.
//
// INVESTIGATED (positional SFX cluster): re-confirmed via a live
// Ghidra decompile of the real FUN_0007305c -- it genuinely is an
// empty function in the original compiled binary (no instructions at
// all beyond the return), not a Ghidra lost-body case. There is
// nothing real to wire up here: the movement-sound "handle"
// (DAT_00086e84) it's named after is itself just the *return value*
// of play_sound_effect_with_pan(0,...) (see movement.c), and that id
// (0) is below allocate_and_play_sound_channel's own id-whitelist
// floor (see that function's comment) -- footstep sounds never
// actually reach trigger_sound_sample_note/platform_sfx_play in the
// real game at all, confirmed, so there is no real in-progress voice
// for this function to ever stop. Left exactly as decompiled.
void stop_movement_sound_handle()

{
  /* BUG FIX (DOS audio mode, confirmed live: falling in water started a
   * sound that never stopped). The empty body above is what the WinCE
   * binary really has, and it was harmless there for one reason only: the
   * movement sound is id 0, which allocate_and_play_sound_channel's
   * whitelist rejected, so there was never a voice for this to stop.
   *
   * DOS mode plays every id, and id 0 is 25 seconds long where every
   * other effect is under 1.5 (SOUNDS.DAT's own durations), so without a
   * real stop it reads as stuck. movement.c already does the right thing
   * around DAT_00086e84 -- it calls this and clears the handle when the
   * player leaves the water, and again on a timer -- so honouring that
   * call is all this needs. The default path keeps the original no-op. */
  if (platform_dos_audio_enabled()) {
    platform_dosmidi_stop_effect(0);
  }
  return;
}



// was thunk_FUN_00072c44 -- byte-for-byte identical body to
// stop_current_audio_handle (this project's established split-symbol/
// naming-collision bug class -- see that function's own comment; kept
// as a separately-named/addressed function per this project's
// convention of preserving what Ghidra recovered).
//
// BUG FIX (real crash, confirmed live): same missing
// `DAT_0023c3b8 != 0` guard as stop_current_audio_handle -- see that
// function's own "BUG FIX (real crash, confirmed live)" comment for
// the full root-cause writeup. This is the twin that's actually
// called from real gameplay: handle_starvation_penalty (player.c)
// calls it directly, and set_sound_effects_enabled (this file, driven
// live by hud.c's sound-toggle click handler and player.c's settings
// load) calls it whenever sound effects are turned off.
void stop_current_audio_handle_dup()

{
  if (DAT_00087454 != 0 && DAT_00087448 != 0 && DAT_0023c3b8 != (char *)0x0) {
    stop_mod_player_playback(DAT_0023c3b8);
  }
  return;
}






// was FUN_00073064 -- allocates a free sound channel slot (bit-scanned
// from DAT_0023c39c, 4 channels) and maps sound-effect id sound_id to a
// "sound group" value (4/8/0x10, ids 3/0x16 -> 4, 4/0x10 -> 0x10, else
// 8; ids <7 fail outright, returning 0xff) stored per-channel in
// g_sound_channel_state/g_sound_channel_group (see their own
// declaration comment -- BUG FIX: was raw hardcoded-address writes),
// then dispatches the actual sample trigger via trigger_sound_sample_note.
// Called by play_positional_sound_effect and siblings as their final
// low-level step.
//
// INVESTIGATED (positional SFX cluster): the id-whitelist above is
// confirmed via a live Ghidra decompile of the real FUN_00073064 to be
// genuine original behavior, not a decompile artifact -- only ids
// {3,4,7,8,0x10,0x15,0x16} ever succeed; every other id (including the
// footstep ids play_sound_effect_with_pan(0/2,...) uses in movement.c,
// and the door-open/close ids play_positional_sound_effect(0xb/0x14,...)
// uses in doors.c) returns 0xff here and never reaches
// trigger_sound_sample_note -- footsteps and door sounds are genuinely
// silent via this path in the real game, not a bug introduced here.
//
// INVESTIGATED (module/resource_id/flags/extra are real but unused):
// the raw Ghidra signature for FUN_00073064 has only 4 formal
// parameters; module/resource_id (the per-id table bytes
// DAT_0023c2b0/b1) are never read anywhere in its body, and
// there is no code reading a 5th/6th stack argument either -- i.e.
// play_positional_sound_effect's carefully distance-attenuated volume
// (note, which DOES get forwarded to trigger_sound_sample_note
// below and IS used) survives, but its equally carefully computed
// stereo pan (flags) and the per-id group table value
// (extra) are discarded right here, never reaching
// real playback, in the real original compiled game -- see
// trigger_sound_sample_note's own comment for where volume itself
// then also gets dropped one layer further down. This declaration
// keeps all 6 parameters (matching every real call site's
// own argument count) rather than trimming it to Ghidra's bare 4,
// per this project's convention of preserving what a caller actually
// passes even when the callee provably ignores some of it.
uint allocate_and_play_sound_channel(byte sound_id, int module, int resource_id, byte note, uint flags, int extra)
{
  byte bVar1;
  uint uVar2;
  undefined2 uVar3;
  byte bVar4;

  DEBUG(INFO, "[audio] allocate_and_play_sound_channel(id=%u, volume=%u)", sound_id, note);

  bVar1 = 1;
  bVar4 = DAT_0023c39c & 1;
  for (uVar2 = 0; (bVar4 != 0 && (uVar2 < 4)); uVar2 = uVar2 + 1 & 0xff) {
    bVar1 = bVar1 << 1;
    bVar4 = DAT_0023c39c & bVar1;
  }
  if (sound_id == 3) {
LAB_00073104:
    uVar3 = 4;
    goto LAB_00073108;
  }
  if (sound_id == 4) {
LAB_000730fc:
    uVar3 = 0x10;
  }
  else {
    if (sound_id < 7) {
      /* No longer rejected -- see the note at the second escape below. */
      uVar3 = 8;
      goto LAB_00073108;
    }
    if (8 < sound_id) {
      if (sound_id == 0x10) goto LAB_000730fc;
      if (sound_id != 0x15) {
        if (sound_id != 0x16) {
          /* BUG FIX (confirmed live, both audio paths): the original
           * whitelist here passed only ids {3,4,7,8,0x10,0x15,0x16} and
           * returned 0xff for the rest, which is why footsteps (1/2,
           * movement.c) and doors (0xb/0x14, doors.c) were silent.
           *
           * It is not a filter that matches either platform's assets. The
           * port's own WAVE resources cover effect ids 1-12, 16-18 and 20,
           * so ELEVEN ids it ships sounds for were blocked here (1, 2, 5,
           * 6, 9, 10, 11, 12, 17, 18, 20) -- while two ids the list does
           * admit, 0x15 and 0x16, have no resource at all. That mismatch
           * fits those resources having come from Ultima Underworld 2
           * rather than this game. The DOS side has no limitation either:
           * SOUNDS.DAT defines all 24 ids and UW.AD carries a timbre for
           * each.
           *
           * So every id is now dispatched and the backend decides. An id
           * with no asset costs nothing: platform_sfx_play bounds-checks
           * the resource range and warns once per missing resource, and
           * platform_dosmidi_play_effect does the same for ids outside
           * SOUNDS.DAT -- both stay silent rather than failing.
           *
           * The group value substituted here is this function's own
           * default; it only ever reaches g_sound_channel_group, which
           * nothing reads back (see that array's declaration comment). */
          uVar3 = 8;
          goto LAB_00073108;
        }
        goto LAB_00073104;
      }
    }
    uVar3 = 8;
  }
LAB_00073108:
  DAT_0023c39c = DAT_0023c39c | bVar1;
  g_sound_channel_state[uVar2] = 2;
  g_sound_channel_group[uVar2] = uVar3;
  /* The one place an effect's backend is chosen.
   *
   * --audio-mode=dos sends everything to the DOS driver -- a note on
   * UW.AD's bank-1 timbres -- with both the distance-attenuated volume
   * (`note`) and the pan (`flags`) the callers computed. Deliberately not
   * via trigger_sound_sample_note: the real FUN_00073140 takes one
   * argument, so that route structurally cannot carry a pan, and it is
   * where the shipped port discarded the volume.
   *
   * --audio-mode=hybrid prefers this port's sampled WAVE resource where
   * one exists and uses the DOS note only for the ids it lacks (0, 13, 14,
   * 15, 19, 21-23). Anything else -- including no DOS mode at all -- takes
   * the sampled path, which is silent for those same ids. */
  if (platform_dos_audio_enabled() &&
      !(platform_dos_prefer_wav_effects() && platform_sfx_has_resource(sound_id + 800))) {
    platform_dosmidi_play_effect(sound_id, note, (int)flags);
  } else {
    trigger_sound_sample_note(sound_id,note);
  }
  return uVar2;
}



// was FUN_00073140 -- the low-level sound-sample trigger: lazily
// reloads the current music module if playback had stopped
// (DAT_00087448==0) and lazily allocates the sample-set handle
// (DAT_0023c3bc) on first use, then triggers sample id sample_index+800
// as a one-shot note into the module player (load_and_resample_wave_sample/
// arm_sfx_trigger_slot/start_sfx_trigger_slot), all through the audio interface
// DAT_0023c3b8.
//
// BUG FIX (real SFX playback): the body below (gated by
// `DAT_0023c3b8 != 0`) has never once executed -- DAT_0023c3b8 is the
// dead decompiled MOD engine's COM-style handle, deliberately never
// assigned a value anywhere in this codebase (see platform_music.c's
// block comment) -- and even if it somehow were non-NULL,
// load_and_resample_wave_sample's own FindResourceW/LoadResource calls
// are hardcoded-0 stubs (ordinal_stubs.c) feeding a struct-packing
// scheme that's the same 64-bit-unsafe disease as the MOD engine's
// (see platform_sfx.c's own block comment for the full chain). Resource
// id sample_index+800 really is a genuine "WAVE"-type PE resource embedded
// in data/UU.exe (36 of them, ids 801-859 with gaps -- confirmed via
// direct PE parsing), so play it through the real platform_sfx backend
// instead, ahead of the dead gate below rather than inside it -- same
// shape as play_music_track's own real interception sitting ahead of
// its dead construct_and_load_mod_player chain. The original body is
// left completely untouched/still unreachable underneath, exactly like
// the MOD engine's own dead code.
//
// INVESTIGATED (no volume/pan parameter to forward): the `note`
// parameter here is the volume allocate_and_play_sound_channel forwards
// on from play_positional_sound_effect/play_sound_effect_with_pan's own
// distance/pan math (see allocate_and_play_sound_channel's own
// comment) -- but a live Ghidra decompile of the real FUN_00073140
// shows only ONE formal parameter (the sample index); its body never
// reads a second argument at all. So in the real original compiled game,
// volume was computed, forwarded this far, and then genuinely
// dropped -- never reaching the actual sample trigger. platform_sfx_play
// below is deliberately a plain `(resource_id)` call for the same
// reason: there's no real volume value from this call chain worth
// forwarding, and the 36 extracted WAVE resources are themselves mono
// PCM with no stereo image to pan in the first place. This is a
// confirmed fact about the original binary (not a guess from "mono
// WAVs probably didn't need panning"), so no volume/pan parameter was
// added to platform_sfx_play's own interface -- see platform_sfx.h's
// own comment for where that conclusion is recorded for the backend
// side too.
void trigger_sound_sample_note(int sample_index, int note)
{
  char cVar1;
  void *iVar2;
  undefined4 local_18;

  DEBUG(INFO, "[audio] trigger_sound_sample_note: sample_index %d, note %d\n",
        sample_index, note);

  platform_sfx_play(sample_index + 800);

  if (DAT_0023c3b8 != (char *)0x0) {
    if (DAT_00087448 == 0) {
      stop_mod_player_playback(DAT_0023c3b8);
      if (DAT_0023c3b8 != (char *)0x0) {
        (**(void (**)(void *, int))(uintptr_t)*(uint *)DAT_0023c3b8)(DAT_0023c3b8,1);  /* virtual destructor via the (32-bit) vtable slot */
      }
      iVar2 = cpp_operator_new(0x10581);
      if (iVar2 == 0) {
        DAT_0023c3b8 = (char *)0x0;
      }
      else {
        SetFileTime(&local_18,&DAT_0023c3d4);
        DAT_0023c3b8 = (char *)construct_and_load_mod_player(iVar2,(void *)(uintptr_t)local_18);
      }
      start_mod_player_playback(DAT_0023c3b8);
      DAT_0023c280 = read_realtime_clock_units();
      DAT_0023c330 = *(undefined4 *)(&DAT_00087414 + (uint)DAT_0023c3a8 * 4);
    }
    if (DAT_0023c3bc == 0) {
      iVar2 = cpp_operator_new(0x1a);
      if (iVar2 == 0) {
        DAT_0023c3bc = 0;
      }
      else {
        /* BUG FIX: was `DAT_0023c3bc = init_sound_channel_slot();` -- a dropped argument (iVar2,
           the handle cpp_operator_new just allocated, is the only value in scope this could
           mean)... */
        init_sound_channel_slot(iVar2);
        DAT_0023c3bc = iVar2;
      }
    }
    stop_sfx_trigger_slot(DAT_0023c3b8,0);
    cVar1 = load_and_resample_wave_sample(DAT_0023c3bc,DAT_0023c540,sample_index + 800);
    if (cVar1 != '\0') {
      arm_sfx_trigger_slot(DAT_0023c3b8,DAT_0023c3bc,0);
      start_sfx_trigger_slot(DAT_0023c3b8,0);
    }
  }
}






// was FUN_0007328c -- a playable musical instrument (param_1 selects which of two
// instruments/octave ranges, offsetting the sound-sample ids played): while active, number keys 1-0
// each play a note (trigger_sound_sample_note) and record it into a rolling 16-note buffer...
void play_musical_instrument(short instrument)
{
  ushort uVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  char cVar5;
  int iVar6;
  uint uVar7;
  char local_3c [16];
  char local_2c [16];
  
  builtin_strncpy(local_3c,"<>@ACEGHJL",10);
  iVar6 = -1;
  ce_memset(local_2c,0,0x10);
  uVar7 = 0;
  print_scroll_message_by_id(0xfa);
  while( true ) {
    uVar4 = next_input_event();
    uVar1 = (ushort)uVar4;
    if (uVar1 == 0x1b) break;
    flush_dirty_rect_to_display(1);
    if (((uVar1 != 0) && (0x2f < (short)(uVar1 & 0xfcff))) && ((short)(uVar1 & 0xfcff) < 0x3a)) {
      uVar2 = (uVar4 & 0xff) - 0x30;
      if ((uVar2 & 0xff) == 0) {
        uVar2 = 10;
      }
      uVar2 = uVar2 - 1 & 0xff;
      iVar6 = uVar2 + 0x28;
      if (instrument != 0) {
        iVar6 = uVar2 + 0x32;
      }
      trigger_sound_sample_note(iVar6,0x78);
      cVar5 = local_3c[uVar2];
      if ((uVar4 & 0x200) != 0) {
        cVar5 = cVar5 + '\f';
      }
      if ((uVar4 & 0x100) != 0) {
        cVar5 = cVar5 + -0xc;
      }
      local_2c[uVar7] = cVar5;
      uVar7 = uVar7 + 1 & 0xf;
      iVar6 = read_realtime_clock_units();
    }
    if ((0 < iVar6) && (iVar3 = read_realtime_clock_units(), 0x40 < (uint)(iVar3 - iVar6))) {
      iVar6 = -1;
    }
  }
  if ((((instrument == 1) && (DAT_00201b68 == 3)) &&
      (uVar4 = (g_player_object->npc_xhome) - 0x18, uVar7 = (int)uVar4 >> 0x1f,
       (int)((uVar4 ^ uVar7) - uVar7) < 3)) &&
      ((uVar4 = (g_player_object->npc_yhome) - 0x2d, uVar7 = (int)uVar4 >> 0x1f,
        (int)((uVar4 ^ uVar7) - uVar7) < 3 && (iVar6 = check_secret_tune_match(local_2c), iVar6 != 0)))) {
    return;
  }
  print_scroll_message_by_id(0xfb);
}



// was FUN_00073474 -- compares the 9 notes at param_1 against the hardcoded secret tune
// "@CA>@GHGC". On a match, and only if the one-time flag bit at DAT_00086df8+0x60 isn't already
// set, shows message 0x88 and sets that flag (so the reward only triggers once per game).
int check_secret_tune_match(char *notes)
{
  undefined2 uVar1;
  void *iVar2;
  uint uVar3;
  char local_14 [12];
  
  builtin_strncpy(local_14,"@CA>@GHGC",9);
  if ((*(byte *)(DAT_00086df8 + 0x60) & 0x80) == 0) {
    uVar3 = 0;
    do {
      if (*(char *)(uVar3 + notes) != local_14[uVar3]) {
        return 0;
      }
      uVar3 = uVar3 + 1 & 0xff;
    } while (uVar3 < 9);
    iVar2 = begin_holding_object_on_cursor(0,0xae);
    if (iVar2 != 0) {
      print_scroll_message_by_id(0x88);
      uVar1 = *(undefined2 *)(DAT_00086df8 + 0x5f);
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar1;
      *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar1 >> 8) | 0x80;
      return 1;
    }
  }
  return 0;
}






// was FUN_0007355c -- currently a no-op stub (Ghidra recovered an
// empty body). Called immediately before shutdown_music_module in the
// app-shutdown sequence, so most plausibly meant to shut down the
// sound-effects subsystem as its counterpart.
// BUG FIX (real voice-sample playback): added platform_voice_shutdown()
// to actually close the real voice-sample audio device before process
// exit, same shape as shutdown_music_module's own
// platform_music_shutdown() addition just below. (platform_sfx's own
// shutdown is a separate cluster's call site, not touched here.)
void shutdown_sound_effects()

{
  platform_voice_shutdown();
  return;
}



// was FUN_00073560 -- fully shuts down the music module: stops playback, releases the module's
// COM-style interface, and nulls the handle. Called from the app-shutdown sequence right after
// shutdown_sound_effects.
// BUG FIX (real music playback): the DAT_0023c3b8 block below is
// unreachable (DAT_0023c3b8 is deliberately never assigned a value
// anywhere now -- see this file's "Real MOD playback backend" block
// comment), so it's left exactly as-is; platform_music_shutdown() added instead
// to actually close the real audio device before process exit.
void shutdown_music_module()

{
  platform_music_shutdown();
  if (DAT_0023c3b8 != (char *)0x0) {
    stop_sfx_trigger_slot(DAT_0023c3b8,0);
    stop_mod_player_playback(DAT_0023c3b8);
    if (DAT_0023c3b8 != (char *)0x0) {
      (**(void (**)(void *, int))(uintptr_t)*(uint *)DAT_0023c3b8)(DAT_0023c3b8,1);  /* virtual destructor via the (32-bit) vtable slot */
    }
    DAT_0023c3b8 = (char *)0x0;
  }
  return;
}



// was FUN_000735b0 -- sets the pending/current music track number
// (DAT_0023c384, the value set_music_enabled resumes playing when
// re-enabled).
void set_pending_music_track(byte track)
{
  DAT_0023c384 = track;
}






// was FUN_000735c0 -- picks a random ambient music track (2..4) and
// sets it as the pending track via set_pending_music_track.
void pick_random_pending_music_track()

{
  int uw_ord2005_rem_149 = 0;
  undefined4 uVar1;
  char extraout_r1;

  uVar1 = ce_rand();
  uw_ord2005_rem_149 = ((int)(uVar1)) % (3);
  DAT_0023c384 = uw_ord2005_rem_149 + '\x02';
  return;
}



// was FUN_000735fc -- the main-menu music loop-advance tick: if the current track has finished
// playing (advance_menu_music_track_elapsed, comparing elapsed time against the track's own
// duration), replays it -- except track 1 (the title theme)...
void advance_menu_music_track()

{
  int iVar1;
  char cVar2;

  cVar2 = DAT_0023c3a8;
  iVar1 = advance_menu_music_track_elapsed();
  if (iVar1 != 0) {
    if (DAT_0023c3a8 == '\x01') {
      cVar2 = '\x04';
    }
    play_music_track(cVar2,1);
  }
  return;
}






// was FUN_00073634 -- the in-game ambient music selection tick: picks/transitions between ambient
// music tracks based on the current track group, combat state (DAT_00086df8+0x5f bit 2, forcing
// track 8 when in combat), and elapsed-time throttling (DAT_0023c378)...
void update_ingame_music_track()

{
  int uw_ord2005_rem_150 = 0; int uw_ord2005_rem_151 = 0;
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  uint extraout_r1;
  uint uVar4;
  uint extraout_r1_00;
  uint uVar5;
  
  if (((DAT_00087454 != 0) && (DAT_00087448 != 0)) &&
     (((DAT_0023c3a8 != 9 && (DAT_0023c3a8 != 0xb)) || (iVar1 = advance_menu_music_track_elapsed(), iVar1 != 0)))) {
    if (((DAT_0023c3a8 < 5) || (7 < DAT_0023c3a8)) ||
       (uVar2 = read_realtime_clock_units(), uVar2 <= DAT_00101944 + 0xa00U)) {
      uVar2 = (uint)DAT_0023c384;
    }
    else {
      if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) {
        uVar3 = ce_rand();
        uw_ord2005_rem_150 = ((int)(uVar3)) % (3);
        uVar2 = (uw_ord2005_rem_150 & 0xff) + 2;
      }
      else {
        uVar2 = 8;
      }
      DAT_0023c384 = (byte)uVar2;
    }
    uVar5 = uVar2 & 0xff;
    if ((uVar5 == 0) || (uVar4 = (uint)DAT_0023c3a8, uVar5 == uVar4)) {
      iVar1 = advance_menu_music_track_elapsed();
      if (iVar1 != 0) {
        uVar2 = (uint)DAT_0023c3a8;
        if ((((*(int *)(&DAT_000873e0 + uVar2 * 4) == 0) || ((1 < uVar2 && (uVar2 < 5)))) &&
            ((short)DAT_00201b60 == 1)) || (uVar2 = (uint)DAT_0023c384, uVar2 == 0)) {
          uVar3 = ce_rand();
          uw_ord2005_rem_151 = ((int)(uVar3)) % (3);
          uVar2 = (uw_ord2005_rem_151 & 0xff) + 2;
          DAT_0023c384 = (byte)uVar2;
        }
        if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0) {
          uVar2 = 8;
          DAT_0023c384 = 8;
        }
        play_music_track(uVar2,1);
        DAT_0023c378 = 0;
      }
    }
    else {
      if ((((uVar4 < 5) || (7 < uVar4)) || (uVar5 < 5)) || (7 < uVar5)) {
        play_music_track(uVar2,1);
      }
      else {
        uVar2 = read_realtime_clock_units();
        if (DAT_0023c378 + 0x800U < uVar2) {
          play_music_track(DAT_0023c384,1);
          DAT_0023c378 = read_realtime_clock_units();
        }
        else {
          DAT_0023c384 = DAT_0023c3a8;
        }
      }
      if ((4 < DAT_0023c384) && (DAT_0023c384 < 8)) {
        DAT_0023c378 = read_realtime_clock_units();
      }
    }
  }
  return;
}



// was FUN_00073870 -- true once the current music track's elapsed play time exceeds its own
// recorded duration (DAT_0023c330, set by play_music_track/resume_music_playback), i.e. "this track
// has finished playing and it's time to loop or advance."
bool advance_menu_music_track_elapsed()

{
  int iVar1;

  iVar1 = read_realtime_clock_units();
  return DAT_0023c330 * 0x100 + 3U < (uint)(iVar1 - DAT_0023c280);
}






// was FUN_000738ac -- returns DAT_00087458, an audio-subsystem-related
// flag not otherwise written anywhere in this decompile (no function
// ever assigns it -- see its own declaration comment above for why
// it's still initialized to 1, not left at a zero default: confirmed
// real .data content, not a guess). The one real caller,
// render_babl_dialog_window (babl.c), uses this value to gate whether
// a conversation line's "voice available" bit is ever set at all.
int get_audio_subsystem_flag()

{
  return DAT_00087458;
}



// was FUN_000738bc -- always returns true; a trivial stub/constant
// getter, audio-cluster sibling of get_audio_subsystem_flag.
int audio_always_true_stub()

{
  return 1;
}



// was FUN_000738c4 -- plays a numbered voice/speech sample: lazily
// reloads the music module if playback had stopped (same pattern as
// trigger_sound_sample_note), waits for any currently-playing sample
// to finish, lazily allocates the sample-set handle, then patches two
// ASCII decimal digits (sample_number/10, sample_number%10 -- confirmed
// genuine divide-by-10 via a live Ghidra decompile, NOT the base-8 scheme
// play_music_track's own filename digits turned out to need) into the
// "00" placeholder of a stack copy of DAT_00087520 ("\VOC00.WAV",
// already-recovered real content, see its own declaration comment
// above -- this comment used to wrongly claim neither buffer here was
// ever recovered), then strcats that patched "\VOCnn.WAV" onto a stack
// copy of DAT_00241f08 (confirmed, via its other use site in game.c's
// registry-install-dir lookup, to hold the game's absolute install
// directory, not a second filename template) before loading/playing
// the result as a one-shot note. See platform_voice.c's own block
// comment for the full chain (including why DAT_00241f08's half is
// irrelevant to this port) and the real playback backend hooked in
// below.
int play_numbered_voice_sample(short sample_number)
{
  int uw_ord2005_rem_152 = 0;
  char *wptr_54752;
  char stack0xffdbdfe0_buf [256];
  char *stack0xffdbdfe0_ptr;
  char cVar1;
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating load_string_resource's
     real pointer to 32 bits before forwarding it to load_and_resample_wave_file as a path -- same
     pointer-truncation class as load_string_resource's own fix. */
  char *uVar2;
  int result;
  void *iVar3;
  char *pcVar4;
  char extraout_r1;
  char acStack_87740 [554264];
  undefined4 local_228 [2];
  char acStack_220 [4];
  char local_21c;
  char local_21b;
  char acStack_118 [260];

  platform_voice_play(sample_number);

  if (DAT_0023c3b8 == (char *)0x0) {
    result = 0;
  }
  else {
    if (DAT_00087448 == 0) {
      stop_mod_player_playback(DAT_0023c3b8);
      if (DAT_0023c3b8 != (char *)0x0) {
        (**(void (**)(void *, int))(uintptr_t)*(uint *)DAT_0023c3b8)(DAT_0023c3b8,1);  /* virtual destructor via the (32-bit) vtable slot */
      }
      iVar3 = cpp_operator_new(0x10581);
      if (iVar3 == 0) {
        DAT_0023c3b8 = (char *)0x0;
      }
      else {
        SetFileTime(local_228,&DAT_0023c3d4);
        DAT_0023c3b8 = (char *)construct_and_load_mod_player(iVar3,(void *)(uintptr_t)local_228[0]);
      }
      start_mod_player_playback(DAT_0023c3b8);
      DAT_0023c330 = 0;
      DAT_00087448 = 1;
    }
    do {
      cVar1 = is_sfx_trigger_slot_active(DAT_0023c3b8,0);
    } while (cVar1 != '\0');
    if (DAT_0023c3bc == 0) {
      iVar3 = cpp_operator_new(0x1a);
      if (iVar3 == 0) {
        DAT_0023c3bc = 0;
      }
      else {
        /* Same dropped-argument-plus-discarded-handle bug as this
           file's other FUN_0004b600 (now init_sound_channel_slot) call
           site -- see its own comment. */
        init_sound_channel_slot(iVar3);
        DAT_0023c3bc = iVar3;
      }
    }
    pcVar4 = &DAT_00087520;
    wptr_54752 = acStack_87740;
    do {
      cVar1 = *pcVar4;
      *wptr_54752 = cVar1; wptr_54752 = wptr_54752 + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    local_21c = ordint_divmod(10,(int)sample_number).quot;
    local_21c = local_21c + '0';
    uw_ord2005_rem_152 = ((int)((int)sample_number)) % (10);
    pcVar4 = &DAT_00241f08;
    stack0xffdbdfe0_ptr = acStack_118;
    local_21b = uw_ord2005_rem_152 + '0';
    do {
      cVar1 = *pcVar4;
      *stack0xffdbdfe0_ptr = cVar1; stack0xffdbdfe0_ptr = stack0xffdbdfe0_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_118,acStack_220);
    uVar2 = load_string_resource(acStack_118);
    load_and_resample_wave_file(DAT_0023c3bc,DAT_0023c540,uVar2);
    arm_sfx_trigger_slot(DAT_0023c3b8,DAT_0023c3bc,0);
    start_sfx_trigger_slot(DAT_0023c3b8,0);
    result = 1;
  }
  return result;
}






// was FUN_00073ac0 -- currently a no-op stub (Ghidra recovered an
// empty body), sibling of is_voice_sample_finished/stop_voice_sample
// in this same cluster.
void voice_sample_cluster_stub_1()

{
  return;
}



// was FUN_00073ac4 -- true once the voice/speech sample most recently
// started (via play_numbered_voice_sample) has finished playing.
//
// BUG FIX (real voice-sample playback): unlike play_numbered_voice_sample
// and stop_voice_sample just below, this function's real decompiled body
// has NO `DAT_0023c3b8 == 0` guard at all -- it unconditionally calls
// is_sfx_trigger_slot_active(DAT_0023c3b8, 0), which dereferences
// `*(char*)(param_2*0xd + param_1 + 0x10410)` with param_1 (DAT_0023c3b8)
// always NULL on this codebase's current (deliberately dead) MOD-engine
// path, i.e. a raw dereference of address 0x10410 -- a real crash the
// instant any babl conversation line sets the "voice forced on" flag
// (see babl.c's render_babl_dialog_window/babl_render_tick), not just a
// hypothetical. The real platform_voice backend (see platform_voice.c)
// replaces this whole body outright -- returning its real answer
// directly, rather than prepending a call and falling through the way
// play_numbered_voice_sample/stop_voice_sample do -- specifically to
// never reach that unguarded dereference. The original body is left
// completely untouched/still unreachable underneath.
bool is_voice_sample_finished()

{
  return platform_voice_is_finished();

  char cVar1;

  cVar1 = is_sfx_trigger_slot_active(DAT_0023c3b8,0);
  return cVar1 == '\0';
}



// was FUN_00073aec -- stops the currently-playing voice/speech sample
// channel.
void stop_voice_sample()

{
  platform_voice_stop();

  if (DAT_0023c3b8 != 0) {
    stop_sfx_trigger_slot(DAT_0023c3b8,0);
  }
  return;
}



// was FUN_00073b0c -- currently a no-op stub (Ghidra recovered an
// empty body), sibling of voice_sample_cluster_stub_1.
void voice_sample_cluster_stub_2()

{
  return;
}


// was FUN_0007ea44 -- probabilistically starts an ambient looping
// sound effect: rolls a ~1-in-8-ish chance (ce_rand % 8), and if
// it lands, tries to acquire an ambient-sound-class resource
// (acquire_sound_resource_slot(0x1e), not yet named -- reads as "get a free slot/
// count for class 0x1e"). On failure to get any (result 0), reports a
// fatal error (report_categorized_fatal_error(0x2001), not yet named -- confirmed
// elsewhere in this file as an ce_malloc-allocation-failure
// handler, e.g. init_level_object_arena's report_categorized_fatal_error(0x1002));
// otherwise, if the acquired value is below the roll threshold and
// above 0x23, releases it and retries with an adjusted count,
// falling back to another fatal-error report if that retry still
// comes up short. On success, calls init_ambient_sound_timing to set
// up the effect's timing state. Regardless of the roll outcome,
// always allocates a small (0x10010-flagged) buffer via ce_malloc,
// reporting a third fatal-error code (0x1007) if that allocation
// fails too -- this second half's exact purpose (distinct from the
// ambient-sound roll above it) isn't confirmed.
//
// INVESTIGATED (positional SFX cluster): this entire mechanism is a
// separate, never-fully-decompiled subsystem that does NOT go through
// trigger_sound_sample_note/DAT_0023c3b8 or any WAVE resource id at
// all -- it operates purely on acquire_sound_resource_slot/
// release_sound_resource_slot (ce_rand-driven "resource slot" counts,
// not sample ids) and opaque ce_malloc/LocalFree buffer handles.
// acquire_sound_resource_slot's own body always returns the fixed
// value 0x28 regardless of its real parameters (same "lost body"
// class as several LAB_ stub functions elsewhere), and
// release_sound_resource_slot is itself an empty no-op. With no real
// resource id anywhere in this chain to map onto platform_sfx's
// WAVE-resource engine, there is nothing concrete here to wire up --
// forcing a platform_sfx_play call in here would be inventing new
// behavior with no decompiled evidence behind it. Left untouched.
//
// RE-CONFIRMED (QA question "should this be playing notes in the
// tracker?"): re-verified acquire_sound_resource_slot's "always
// returns 0x28" claim above against a FRESH live Ghidra decompile of
// the real FUN_00049940 -- byte-for-byte `undefined4 FUN_00049940(void)
// { return 0x28; }`, genuinely parameter-less and constant-returning in
// the real original binary, not a decompile artifact masking something
// real. This rules out a hidden tracker-note mechanism definitively.
void start_ambient_sound_effect(int sound_id)
{
  int uw_ord2005_rem_169 = 0;
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  short extraout_r1;
  
  uVar3 = ce_rand();
  uw_ord2005_rem_169 = ((int)(uVar3)) % (8);
  iVar1 = (uw_ord2005_rem_169 + 0x1b) * 0x20000 >> 0x10;
  if (0 < iVar1) {
    iVar4 = acquire_sound_resource_slot();
    DAT_002506f0 = (short)iVar4;
    iVar2 = (int)DAT_002506f0;
    if (iVar2 == 0) {
      report_categorized_fatal_error(0x2001);
    }
    else {
      if ((iVar2 < iVar1) && (0x23 < iVar2)) {
        release_sound_resource_slot();
        iVar4 = acquire_sound_resource_slot();
        DAT_002506f0 = (short)iVar4;
        if (DAT_002506f0 < 0x1e) {
          report_categorized_fatal_error(0x2002);
          iVar4 = (int)DAT_002506f0;
        }
      }
      init_ambient_sound_timing(iVar4);
    }
  }
  DAT_002506ec = ce_malloc(0x10010);
  if (DAT_002506ec == 0) {
    report_categorized_fatal_error(0x1007);
  }
}



// was FUN_0007eb34 -- the shutdown counterpart to
// start_ambient_sound_effect: releases the acquired resource
// (release_sound_resource_slot, not yet named) when one is held (DAT_002506f0 > 0),
// and stops the looping sound (LocalFree) when one is playing
// (DAT_002506ec != 0), clearing that handle afterward. Its only
// confirmed caller runs during game shutdown, paired with
// start_ambient_sound_effect(2)'s own call during game init.
//
// INVESTIGATED (positional SFX cluster): see start_ambient_sound_effect's
// own "INVESTIGATED" comment -- same separate, resource-id-less
// subsystem, nothing here to connect to platform_sfx either. Left
// untouched.
void stop_ambient_sound_effect()

{
  if (0 < DAT_002506f0) {
    release_sound_resource_slot();
  }
  if (DAT_002506ec != 0) {
    LocalFree(DAT_002506ec);
    DAT_002506ec = 0;
  }
  return;
}



// was FUN_0007eb70 -- initializes a 9-field ambient-sound-effect state block (the
// DAT_0024d0xx/DAT_0024faxx globals; the two address families suggest two parallel
// channels/slots)...
void init_ambient_sound_timing(short interval)
{
  DAT_0024d00c = 0x16;
  DAT_0024fa18 = (short)((interval + -0x16) >> 1);
  DAT_0024d008 = 0xff;
  DAT_0024fa10 = 0xff;
  DAT_0024d010 = 9;
  DAT_0024d000 = 10;
  DAT_0024f90c = 0xff;
  DAT_0024fa28 = 0xff;
  DAT_0024fa14 = DAT_002029c8;
}



// was FUN_0007ec1c -- resets 3 of init_ambient_sound_timing's 9 fields (the "target select" ones,
// all set to the sentinel 0xff) without touching the other 6 timing fields.
void clear_ambient_sound_target()

{
  DAT_0024d008 = 0xff;
  DAT_0024fa10 = 0xff;
  DAT_0024f90c = 0xff;
  return;
}





// was FUN_00035dd8 -- clears the current ambient sound target and resets DAT_00101960 (the
// talking-portrait mouth-frame cycle count, confirmed via its use a few thousand lines below in the
// babl conversation-rendering loop, which wraps a frame counter at this value) to its default of 3.
int reset_dialogue_speech_state()

{
  clear_ambient_sound_target();
  DAT_00101960 = 3;
  return 3;
}


// was FUN_00035ec4 -- despite the "voice_sample" name (kept to avoid
// an unrelated rename churn -- see the correction below), this is NOT
// part of the numbered VOC voice-sample pool (play_numbered_voice_sample/
// is_voice_sample_finished/stop_voice_sample, now backed by
// platform_voice.c). Its only real caller, render_babl_dialog_window
// (babl.c, inside the illustrated book/scroll-viewer branch), feeds its
// output straight into ce_memmove(..., 64000)/decompress_rle_stream/
// bitmap_blit_to_framebuffer -- i.e. this pages in 320x200 RLE/raw
// bitmap ANIMATION FRAMES for the picture viewer, not audio. (This
// project's own test grouping already bundles this function with
// render_babl_dialog_window/decompress_rle_stream/
// bitmap_blit_to_framebuffer under the "illustration_render" suite,
// independently agreeing.) Confirmed via a live Ghidra decompile plus
// tracing render_babl_dialog_window's own consumer of this data.
//
// Fully loads one picture-page (page_index, indexing into the resource
// at `resource`) into the caller's buffer (out_buffer, a freshly-
// allocated 0x10000-byte block at its only known call site) in a single
// ce_memmove read, sized from the page's own header fields at `header`.
// See the sibling read_voice_sample_page_chunk for the incremental/
// streaming variant used during actual playback.
short load_voice_sample_page(char *resource, int page_index, char *header, void *out_buffer)
{
  undefined2 uVar1;

  DAT_000853f8 = (*(ushort *)(header + 2) + 4) * 2 + (uint)*(ushort *)(header + 4);
  /* Ghidra dropped the size argument at this call site; the sibling function
     read_voice_sample_page_chunk computes the equivalent size the same way and passes it explicitly
     (& 0xffff), so reuse the value just computed into DAT_000853f8 above. */
  ce_memmove(out_buffer,resource + page_index * 0x10000 + 0xb00,DAT_000853f8 & 0xffff);
  uVar1 = (undefined2)DAT_000853f8;
  return uVar1;
}



// was FUN_00035f24 -- incremental/streaming counterpart to
// load_voice_sample_page: reads up to byte_count bytes of picture-page
// page_index into out_buffer, caching the page's total remaining size
// (DAT_000853fc/DAT_00085400) across calls so repeated calls for the
// same page don't recompute it, and returning 0 once the page is
// exhausted. Used by the babl conversation-rendering loop to stream
// illustrated-book/scroll bitmap ANIMATION FRAME data in display-sized
// pieces (NOT voice-sample audio -- see load_voice_sample_page's own
// comment just above for the full correction).
uint read_voice_sample_page_chunk(char *resource, ushort page_index, char *header, uint byte_count, void *out_buffer)
{
  uint uVar1;

  if ((byte_count & 0xffff) == 0) {
LAB_00035fd4:
    uVar1 = 0;
  }
  else {
    if ((uint)page_index == (uint)DAT_000853fc) {
      uVar1 = (uint)DAT_00085400;
      if (uVar1 == 0) goto LAB_00035fd4;
    }
    else {
      uVar1 = (uint)*(ushort *)(header + 4) + (*(ushort *)(header + 2) + 4) * 2;
      DAT_000853fc = page_index;
    }
    if ((uVar1 & 0xffff) < (byte_count & 0xffff)) {
      DAT_00085400 = 0;
    }
    else {
      DAT_00085400 = (short)uVar1 - (short)byte_count;
      uVar1 = byte_count;
    }
    ce_memmove(out_buffer,resource + (uint)page_index * 0x10000 + 0xb00,uVar1 & 0xffff);
  }
  return uVar1;
}


// was FUN_00037d50 -- copies the current ambient-sound loop handle (DAT_002506ec, set by
// start_ambient_sound_effect) into DAT_00101a70. Its only confirmed call site runs during game
// init, right after start_ambient_sound_effect(2).
void cache_ambient_sound_handle()

{
  DAT_00101a70 = (uintptr_t)DAT_002506ec;
  return;
}


// was FUN_00049948 -- per stop_ambient_sound_effect/start_ambient_sound_effect's own comments,
// releases a previously acquired sound-resource slot (the counterpart to
// acquire_sound_resource_slot); this decompile's body is an empty no-op...
void release_sound_resource_slot()

{
  return;
}


// was FUN_00049940 -- per start_ambient_sound_effect's own comment, reads as "get a free slot/count
// for class 0x1e" (its only known caller passes 0x1e, and in the retry path a second argument
// too)...
int acquire_sound_resource_slot()

{
  return 0x28;
}


// was FUN_0004b600 -- initializes one 0x1a-byte sound-channel slot (zeroing its +0x12..+0x19
// playback-state fields): called in a loop over all 0x10 slots at startup (uw.c's
// init_all_sound_channel_slots)...
int init_sound_channel_slot(char *slot)
{
  *(undefined1 *)(slot + 0x16) = 0;
  *(undefined1 *)(slot + 0x17) = 0;
  *(undefined1 *)(slot + 0x18) = 0;
  *(undefined1 *)(slot + 0x19) = 0;
  *(undefined1 *)(slot + 0x12) = 0;
  *(undefined1 *)(slot + 0x13) = 0;
  *(undefined1 *)(slot + 0x14) = 0;
  *(undefined1 *)(slot + 0x15) = 0;
  return 0;
}



/* A sound-channel slot is a 0x1a-byte record: +0x00..0x11 the WAVEFORMATEX header, +0x12..0x15 a 4-byte
   field that held the sample-buffer pointer in the original 32-bit binary, +0x16..0x19 the sample
   length/rate bytes. These accessors make the (legacy, 32-bit-truncating) pointer field explicit. */
static void *slot_sample_ptr(const char *slot)
{
  uint packed;
  memcpy(&packed,slot + 0x12,4);
  return (void *)(uintptr_t)packed;
}

static void set_slot_sample_ptr(char *slot, void *buffer)
{
  uint packed = (uint)(uintptr_t)buffer;
  memcpy(slot + 0x12,&packed,4);
}

// was FUN_0004b644 -- the shutdown counterpart to init_sound_channel_slot: releases the slot's
// playback resource (cpp_operator_delete) if its +0x12 field is non-zero (a sample currently
// loaded/playing).
void release_sound_channel_slot(char *slot)
{
  if (slot_sample_ptr(slot) != 0) {
    cpp_operator_delete(slot_sample_ptr(slot));
  }
}


// was FUN_0004b66c -- loads a WAVE resource (param_2=module, param_3=resource id) into the given
// sound-channel slot (param_1), resampling it to the output rate DAT_00086368 if the resource's own
// rate is a recognized standard one...
int load_and_resample_wave_sample(char *slot, int module, short resource_id)
{
  int iVar1;
  undefined1 uVar2;
  undefined1 uVar3;
  undefined3 uVar4;
  uint uVar5;
  char *iVar7;
  void *uVar8;
  int result;
  int iVar9;
  int iVar10;
  bool bVar11;
  void *uVar12;
  
  iVar7 = (char *)FindResourceW(module,resource_id,(long)(intptr_t)u_WAVE_0008686c);
  if ((iVar7 == 0) || (iVar7 = (char *)LoadResource(module), iVar7 == 0)) {
    result = 0;
  }
  else {
    uVar4 = *(undefined3 *)(iVar7 + 0x28);
    uVar2 = *(undefined1 *)(iVar7 + 0x2b);
    uVar5 = *(uint *)(iVar7 + 0x28);
    ce_memmove(slot,iVar7 + 0x14,0x12);
    uVar3 = *(undefined1 *)(slot + 0x13);
    if (DAT_00086368 == 0xac44) {
      iVar1 = uVar5 * 4;
      *(char *)(slot + 0x16) = (char)iVar1;
      *(char *)(slot + 0x17) = (char)((uint)iVar1 >> 8);
      *(char *)(slot + 0x18) = (char)(((uVar5 & 0x3fffffff) >> 6) >> 8);
      *(char *)(slot + 0x19) = (char)(((uVar5 & 0x3fffffff) >> 0xe) >> 8);
      if (slot_sample_ptr(slot) != 0) {
        cpp_operator_delete(slot_sample_ptr(slot));
      }
      uVar8 = cpp_operator_new(iVar1);
      set_slot_sample_ptr(slot,uVar8);
      iVar9 = 0;
      if (0 < iVar1) {
        do {
          iVar10 = iVar9;
          if (iVar9 < 0) {
            iVar10 = iVar9 + 3;
          }
          ((char *)slot_sample_ptr(slot))[iVar9] = *((char *)iVar7 + (iVar10 >> 2) + 0x2c);
          iVar9 = iVar9 + 1;
        } while (iVar9 < iVar1);
      }
    }
    else if (DAT_00086368 == 0x5622) {
      iVar1 = uVar5 * 2;
      *(char *)(slot + 0x16) = (char)iVar1;
      *(char *)(slot + 0x17) = (char)((uint)iVar1 >> 8);
      *(char *)(slot + 0x18) = (char)(((uVar5 & 0x7fffffff) >> 7) >> 8);
      *(char *)(slot + 0x19) = (char)(((uVar5 & 0x7fffffff) >> 0xf) >> 8);
      if (slot_sample_ptr(slot) != 0) {
        cpp_operator_delete(slot_sample_ptr(slot));
      }
      uVar8 = cpp_operator_new(iVar1);
      set_slot_sample_ptr(slot,uVar8);
      iVar9 = 0;
      if (0 < iVar1) {
        do {
          iVar10 = iVar9;
          if (iVar9 < 0) {
            iVar10 = iVar9 + 1;
          }
          ((char *)slot_sample_ptr(slot))[iVar9] = *((char *)iVar7 + (iVar10 >> 1) + 0x2c);
          iVar9 = iVar9 + 1;
        } while (iVar9 < iVar1);
      }
    }
    else {
      *(char *)(slot + 0x16) = (char)uVar4;
      *(char *)(slot + 0x17) = (char)((uint3)uVar4 >> 8);
      *(char *)(slot + 0x18) = (char)((uint3)uVar4 >> 0x10);
      *(undefined1 *)(slot + 0x19) = uVar2;
      if (slot_sample_ptr(slot) != 0) {
        cpp_operator_delete(slot_sample_ptr(slot));
      }
      uVar12 = cpp_operator_new(uVar5);
      set_slot_sample_ptr(slot,uVar12);
      bVar11 = uVar12 == 0;
      if (bVar11) {
        /* allocation failed: ARM shows a message box (text at 0x86830 in the original image) */
        MessageBoxW((const void *)0,(const void *)(uintptr_t)0x86830);
      }
      ce_memmove(slot_sample_ptr(slot),iVar7 + 0x2c,uVar5);
    }
    DeleteObject((long)iVar7);
    result = 1;
  }
  return result;
}


// was FUN_0004b948 -- load_and_resample_wave_sample's file-based counterpart: opens a WAVE file on
// disk (param_3, the path) instead of a module resource, otherwise identical (same header read,
// same 44100/22050Hz resample-vs-raw-copy logic, same slot-buffer layout at param_1).
int load_and_resample_wave_file(char *slot, int unused, const char *path)
{
  undefined1 uVar1;
  undefined1 uVar2;
  undefined3 uVar3;
  uint uVar4;
  int iVar6;
  int iVar7;
  char *iVar8;
  int iVar9;
  void *uVar10;
  int result;
  int iVar11;
  bool bVar12;
  void *uVar13;
  int local_20;
  
  iVar6 = CreateFileW(path,0x80000000,1,0,3,0x80,0);
  if (iVar6 != -1) {
    iVar7 = GetFileSize(iVar6,0);
    if ((iVar7 != -1) && (iVar8 = ce_malloc(iVar7), iVar8 != 0)) {
      iVar9 = ReadFile(iVar6,iVar8,iVar7,&local_20,0);
      if ((iVar9 == 0) || (local_20 != iVar7)) {
        result = 0;
      }
      else {
        uVar3 = *(undefined3 *)(iVar8 + 0x28);
        uVar1 = *(undefined1 *)(iVar8 + 0x2b);
        uVar4 = *(uint *)(iVar8 + 0x28);
        ce_memmove(slot,iVar8 + 0x14,0x12);
        uVar2 = *(undefined1 *)(slot + 0x13);
        if (DAT_00086368 == 0xac44) {
          iVar7 = uVar4 * 4;
          *(char *)(slot + 0x16) = (char)iVar7;
          *(char *)(slot + 0x17) = (char)((uint)iVar7 >> 8);
          *(char *)(slot + 0x18) = (char)(((uVar4 & 0x3fffffff) >> 6) >> 8);
          *(char *)(slot + 0x19) = (char)(((uVar4 & 0x3fffffff) >> 0xe) >> 8);
          if (slot_sample_ptr(slot) != 0) {
            cpp_operator_delete(slot_sample_ptr(slot));
          }
          uVar10 = cpp_operator_new(iVar7);
          set_slot_sample_ptr(slot,uVar10);
      iVar9 = 0;
          if (0 < iVar7) {
            do {
              iVar11 = iVar9;
              if (iVar9 < 0) {
                iVar11 = iVar9 + 3;
              }
              ((char *)slot_sample_ptr(slot))[iVar9] = *((char *)iVar8 + (iVar11 >> 2) + 0x2c);
              iVar9 = iVar9 + 1;
            } while (iVar9 < iVar7);
          }
        }
        else if (DAT_00086368 == 0x5622) {
          iVar7 = uVar4 * 2;
          *(char *)(slot + 0x16) = (char)iVar7;
          *(char *)(slot + 0x17) = (char)((uint)iVar7 >> 8);
          *(char *)(slot + 0x18) = (char)(((uVar4 & 0x7fffffff) >> 7) >> 8);
          *(char *)(slot + 0x19) = (char)(((uVar4 & 0x7fffffff) >> 0xf) >> 8);
          if (slot_sample_ptr(slot) != 0) {
            cpp_operator_delete(slot_sample_ptr(slot));
          }
          uVar10 = cpp_operator_new(iVar7);
          set_slot_sample_ptr(slot,uVar10);
      iVar9 = 0;
          if (0 < iVar7) {
            do {
              iVar11 = iVar9;
              if (iVar9 < 0) {
                iVar11 = iVar9 + 1;
              }
              ((char *)slot_sample_ptr(slot))[iVar9] = *((char *)iVar8 + (iVar11 >> 1) + 0x2c);
              iVar9 = iVar9 + 1;
            } while (iVar9 < iVar7);
          }
        }
        else {
          *(char *)(slot + 0x16) = (char)uVar3;
          *(char *)(slot + 0x17) = (char)((uint3)uVar3 >> 8);
          *(char *)(slot + 0x18) = (char)((uint3)uVar3 >> 0x10);
          *(undefined1 *)(slot + 0x19) = uVar1;
          if (slot_sample_ptr(slot) != 0) {
            cpp_operator_delete(slot_sample_ptr(slot));
          }
          uVar13 = cpp_operator_new(uVar4);
          set_slot_sample_ptr(slot,uVar13);
          bVar12 = uVar13 == 0;
          if (bVar12) {
            /* allocation failed: ARM shows a message box (text at 0x86830 in the original image) */
            MessageBoxW((const void *)0,(const void *)(uintptr_t)0x86830);
          }
          ce_memmove(slot_sample_ptr(slot),iVar8 + 0x2c,uVar4);
        }
        result = 1;
      }
      CloseHandle(iVar6);
      LocalFree(iVar8);
      return result;
    }
    CloseHandle(iVar6);
  }
  return 0;
}



// was FUN_0004bc94 -- constructs a MOD-player engine object in-place at param_1 (its counterpart is
// the very next function, destroy_mod_player): initializes its pattern/instrument/channel-state
// arrays...
/* Real arity is 2: all three ARM call sites set only r0/r1; Ghidra's param_3/param_4 were the
   unwritten r2/r3 spilled into stack slots that nothing read. */
byte *construct_and_load_mod_player(byte *player, void *module)
{
  char cVar1;
  char cVar2;
  intptr_t iVar3;
  intptr_t iVar4;
  undefined4 uVar5;
  int *piVar6;
  int iVar7;
  byte *pbVar8;
  undefined1 uVar9;
  intptr_t iVar10;
  intptr_t iVar11;
  int iVar12;
  int *piVar13;
  uint uVar14;
  int *piVar15;
  byte bVar16;
  bool bVar17;
  undefined8 uVar18;
  undefined8 uVar19;
  undefined8 uVar20;
  int local_340;
  int local_33c;
  int local_338;
  undefined1 *local_334;
  undefined1 auStack_330 [4];
  char *local_32c;
  int local_328;
  undefined8 local_318;
  uint local_310;
  uint local_30c;
  uint local_308;
  undefined1 auStack_300 [20];
  undefined4 local_2ec;
  undefined4 local_2e4;
  undefined1 auStack_2e0 [20];
  undefined1 local_2cc;
  undefined1 auStack_2c8 [22];
  undefined1 local_2b2;
  undefined1 auStack_2b0 [72];
  undefined1 auStack_268 [560];
  void *local_c;
  
  local_c = module;
  FindNextFileW(0,player + 0x104d8);  /* ARM passes only the object pointer (r0); handle slot unused */
  init_mod_dynamic_array(player + 0x104e0);
  local_334 = player + 0x104f4;
  /* BUG FIX: was `init_mod_pattern_array();` -- a dropped argument. */
  init_mod_pattern_array(local_334);
  init_mod_instrument_array(player + 0x10508);
  init_mod_channel_state_array(player + 0x10520);
  init_mod_dynamic_array(player + 0x10558);
  init_mod_dynamic_array(player + 0x1056c);
  *player = 0;
  player[1] = 0x30;
  player[2] = 8;
  player[3] = 0;
  iVar3 = FindFirstFileW(local_c,(unsigned int *)auStack_268);
  if (iVar3 == -1) {
    player[0x10580] = 0;
    build_mod_volume_sample_table(player,0x40);
    player[0x10554] = 0;
    player[0x10555] = 0;
    player[0x10556] = 0;
    player[0x10557] = 0;
    goto LAB_0004c940;
  }
  player[0x10580] = 1;
  player[0x1051c] = 0;
  player[0x1051d] = 0;
  player[0x1051e] = 0;
  player[0x1051f] = 0;
  ce_memset(player + 0x10404,0,0xd0);
  player[0x104d4] = 0;
  player[0x104d5] = 0;
  player[0x104d6] = 0;
  player[0x104d7] = 0;
  HeapReAlloc(auStack_330);
  CopyRect(auStack_300);
  ordaudio_op_2063(auStack_300,local_c,0x8000,0);
  RemoteLocalReAlloc(auStack_2b0,auStack_300,1,0x1000,0);
  ordaudio_op_2413(auStack_330,0,0xffffffff);
  do {
    iVar3 = local_328;
    ordaudio_op_2413(auStack_330,local_328 + 0x4000,0xffffffff);
    iVar4 = ordaudio_op_2135(auStack_2b0,local_32c + iVar3,0x4000);
    ordaudio_op_2413(auStack_330,iVar4 + iVar3,0xffffffff);
  } while (iVar4 == 0x4000);
  local_340 = 0;
  local_338 = 0x20;
  piVar15 = (int *)(player + 0x1054c);
  *(undefined1 *)piVar15 = 4;
  player[0x1054d] = 0;
  player[0x1054e] = 0;
  player[0x1054f] = 0;
  if (local_328 < 0x43c) {
LAB_0004c030:
    local_338 = 0x10;
  }
  else {
    cVar1 = *(char *)(local_32c + 0x438);
    if ((((cVar1 != 'M') || (*(char *)(local_32c + 0x439) != '.')) ||
        (*(char *)(local_32c + 0x43a) != 'K')) || (*(char *)(local_32c + 0x43b) != '.')) {
      if (cVar1 == 'F') {
        if (((*(char *)(local_32c + 0x439) == 'L') && (*(char *)(local_32c + 0x43a) == 'T')) &&
           (*(char *)(local_32c + 0x43b) == '4')) goto LAB_0004c038;
        if (((*(char *)(local_32c + 0x439) != 'L') || (*(char *)(local_32c + 0x43a) != 'T')) ||
           (*(char *)(local_32c + 0x43b) != '8')) goto LAB_0004bfd8;
LAB_0004bfb4:
        uVar9 = 8;
      }
      else {
LAB_0004bfd8:
        if ((cVar1 != '6') || (*(char *)(local_32c + 0x439) != 'C')) {
LAB_0004c004:
          if ((((cVar1 != '8') || (*(char *)(local_32c + 0x439) != 'C')) ||
              (*(char *)(local_32c + 0x43a) != 'H')) || (*(char *)(local_32c + 0x43b) != 'N'))
          goto LAB_0004c030;
          goto LAB_0004bfb4;
        }
        cVar2 = *(char *)(local_32c + 0x43a);
        bVar17 = cVar2 == 'H';
        if (bVar17) {
          cVar2 = *(char *)(local_32c + 0x43b);
        }
        if (!bVar17 || cVar2 != 'N') goto LAB_0004c004;
        uVar9 = 6;
      }
      *(undefined1 *)piVar15 = uVar9;
      player[0x1054d] = 0;
      player[0x1054e] = 0;
      player[0x1054f] = 0;
    }
  }
LAB_0004c038:
  resize_mod_channel_state_array(player + 0x10520,*piVar15,0xffffffff);
  ce_memmove(auStack_2e0,local_32c + local_340,0x14);
  local_2cc = 0;
  uVar5 = SetFileTime(&local_33c,auStack_2e0);
  CeReadRecordProps(player + 0x104d8,uVar5);
  BatteryDrvrGetLevels(&local_33c);
  iVar3 = local_338;
  local_340 = local_340 + 0x14;
  resize_mod_instrument_array(player + 0x10508,local_338,0xffffffff);
  if (1 < iVar3) {
    piVar13 = (int *)(player + 0x1050c);
    iVar3 = 0x30;
    iVar4 = local_338 + -1;
    do {
      ce_memmove(auStack_2c8,local_32c + local_340,0x16);
      local_2b2 = 0;
      uVar5 = SetFileTime(&local_33c,auStack_2c8);
      CeReadRecordProps((void *)(intptr_t)(*piVar13 + iVar3),uVar5);
      BatteryDrvrGetLevels(&local_33c);
      local_340 = local_340 + 0x16;
      uVar5 = read_mod_word_length_field(player,(char *)auStack_330,&local_340);
      iVar10 = *piVar13 + iVar3;
      *(char *)(iVar10 + 4) = (char)uVar5;
      *(char *)(iVar10 + 5) = (char)((uint)uVar5 >> 8);
      *(char *)(iVar10 + 6) = (char)((uint)uVar5 >> 0x10);
      *(char *)(iVar10 + 7) = (char)((uint)uVar5 >> 0x18);
      iVar11 = local_340 + 1;
      iVar10 = *piVar13 + iVar3;
      *(undefined1 *)(iVar10 + 8) = *(undefined1 *)(local_32c + local_340);
      *(undefined1 *)(iVar10 + 9) = 0;
      *(undefined1 *)(iVar10 + 10) = 0;
      *(undefined1 *)(iVar10 + 0xb) = 0;
      iVar10 = *piVar13 + iVar3;
      piVar6 = (int *)(iVar10 + 8);
      if (7 < *piVar6) {
        iVar12 = *piVar6 + -0x10;
        *(char *)piVar6 = (char)iVar12;
        *(char *)(iVar10 + 9) = (char)((uint)iVar12 >> 8);
        *(char *)(iVar10 + 10) = (char)((uint)iVar12 >> 0x10);
        *(char *)(iVar10 + 0xb) = (char)((uint)iVar12 >> 0x18);
      }
      local_340 = local_340 + 2;
      iVar10 = *piVar13 + iVar3;
      *(undefined1 *)(iVar10 + 0xc) = *(undefined1 *)(local_32c + iVar11);
      *(undefined1 *)(iVar10 + 0xd) = 0;
      *(undefined1 *)(iVar10 + 0xe) = 0;
      *(undefined1 *)(iVar10 + 0xf) = 0;
      uVar5 = read_mod_word_length_field(player,(char *)auStack_330,&local_340);
      iVar10 = *piVar13 + iVar3;
      *(char *)(iVar10 + 0x10) = (char)uVar5;
      *(char *)(iVar10 + 0x11) = (char)((uint)uVar5 >> 8);
      *(char *)(iVar10 + 0x12) = (char)((uint)uVar5 >> 0x10);
      *(char *)(iVar10 + 0x13) = (char)((uint)uVar5 >> 0x18);
      uVar5 = read_mod_word_length_field(player,(char *)auStack_330,&local_340);
      iVar10 = *piVar13 + iVar3;
      *(char *)(iVar10 + 0x14) = (char)uVar5;
      *(char *)(iVar10 + 0x15) = (char)((uint)uVar5 >> 8);
      *(char *)(iVar10 + 0x16) = (char)((uint)uVar5 >> 0x10);
      *(char *)(iVar10 + 0x17) = (char)((uint)uVar5 >> 0x18);
      iVar10 = iVar3 + *piVar13;
      iVar11 = *(int *)(iVar10 + 0x14) + *(int *)(iVar10 + 0x10);
      iVar10 = iVar3 + *piVar13;
      *(char *)(iVar10 + 0x18) = (char)iVar11;
      *(char *)(iVar10 + 0x19) = (char)((uint)iVar11 >> 8);
      *(char *)(iVar10 + 0x1a) = (char)((uint)iVar11 >> 0x10);
      *(char *)(iVar10 + 0x1b) = (char)((uint)iVar11 >> 0x18);
      iVar11 = iVar3 + *piVar13;
      iVar10 = *(int *)(iVar11 + 4);
      if (iVar10 < *(int *)(iVar11 + 0x18)) {
        iVar11 = iVar3 + *piVar13;
        *(char *)(iVar11 + 0x18) = (char)iVar10;
        *(char *)(iVar11 + 0x19) = (char)((uint)iVar10 >> 8);
        *(char *)(iVar11 + 0x1a) = (char)((uint)iVar10 >> 0x10);
        *(char *)(iVar11 + 0x1b) = (char)((uint)iVar10 >> 0x18);
      }
      iVar4 = iVar4 + -1;
      iVar3 = iVar3 + 0x30;
    } while (iVar4 != 0);
  }
  iVar3 = 0;
  player[0x104dc] = *(undefined1 *)(local_32c + local_340);
  player[0x104dd] = 0;
  player[0x104de] = 0;
  player[0x104df] = 0;
  local_340 = local_340 + 2;
  resize_mod_int_array(player + 0x104e0,0x80,0xffffffff);
  iVar10 = *(int *)(player + 0x104e4);
  iVar11 = 0;
  iVar4 = local_340;
  do {
    local_340 = iVar4;
    *(uint *)(iVar11 + iVar10) = (uint)*(byte *)(local_32c + local_340);
    iVar10 = *(int *)(player + 0x104e4);
    piVar13 = (int *)(iVar11 + iVar10);
    iVar11 = iVar11 + 4;
    if (iVar3 < *piVar13) {
      iVar3 = *piVar13;
    }
    iVar4 = local_340 + 1;
  } while (iVar11 < 0x200);
  iVar3 = iVar3 + 1;
  local_340 = local_340 + 5;
  resize_mod_pattern_array(local_334,iVar3,0xffffffff);
  if (0 < iVar3) {
    piVar13 = (int *)(player + 0x104f8);
    iVar4 = 0;
    local_33c = iVar3;
    do {
      resize_mod_pattern_row_array((char *)(intptr_t)(iVar4 + *piVar13),0x40,0xffffffff);
      iVar3 = 0;
      do {
        resize_mod_event_row_array((char *)(intptr_t)(*(int *)(iVar4 + *piVar13 + 4) + iVar3),*piVar15,0xffffffff);
        local_334 = (undefined1 *)0x0;
        if (0 < *piVar15) {
          iVar10 = 0;
          do {
            iVar11 = local_340 + 1;
            bVar16 = *(byte *)(local_32c + local_340);
            local_308 = (uint)bVar16;
            iVar12 = local_340 + 2;
            iVar7 = local_340 + 3;
            local_340 = local_340 + 4;
            local_310 = (uint)*(byte *)(local_32c + iVar12);
            local_30c = (uint)*(byte *)(local_32c + iVar7);
            uVar14 = (uint)*(byte *)(local_32c + iVar11) | (local_308 & 0xf) << 8;
            if (uVar14 == 0) {
              iVar11 = *(int *)(*(int *)(iVar4 + *piVar13 + 4) + iVar3 + 4) + iVar10;
              *(undefined1 *)(iVar11 + 4) = 0xff;
              *(undefined1 *)(iVar11 + 5) = 0xff;
              *(undefined1 *)(iVar11 + 6) = 0xff;
              *(undefined1 *)(iVar11 + 7) = 0xff;
            }
            else {
              uVar18 = ordfloat_log(0,0x408ac000);
              local_2ec = (undefined4)((ulonglong)uVar18 >> 0x20);
              ordfloat_double_from_int(uVar14);
              uVar19 = ordfloat_log(0,0);  /* ARM: result/args come from the preceding float-conversion call (dropped by the decompiler) */
              local_2e4 = (undefined4)((ulonglong)uVar19 >> 0x20);
              uVar20 = ordfloat_log(0x69f83f23,0x3ff01dae);
              local_318 = uVar20;
              uVar18 = ordfloat_double_binop((int)uVar18,local_2ec,(int)uVar19,local_2e4);
              uVar18 = ordfloat_double_binop2((int)uVar18,(int)((ulonglong)uVar18 >> 0x20),
                                    (undefined4)local_318,0 /* best-effort: high dword of a 64-bit codec value Ghidra split across overlapping locals */);
              ordfloat_double_op3((int)uVar18,(int)((ulonglong)uVar18 >> 0x20),0,0x40200000);
              uVar5 = ordfloat_double_result();
              bVar16 = (byte)local_308;
              iVar11 = *(int *)(*(int *)(iVar4 + *piVar13 + 4) + iVar3 + 4) + iVar10;
              *(char *)(iVar11 + 4) = (char)uVar5;
              *(char *)(iVar11 + 5) = (char)((uint)uVar5 >> 8);
              *(char *)(iVar11 + 6) = (char)((uint)uVar5 >> 0x10);
              *(char *)(iVar11 + 7) = (char)((uint)uVar5 >> 0x18);
            }
            iVar11 = (int)local_310 >> 4;
            pbVar8 = (byte *)(*(int *)(*(int *)(iVar4 + *piVar13 + 4) + iVar3 + 4) + iVar10);
            *pbVar8 = bVar16 & 0xf0 | (byte)iVar11;
            pbVar8[1] = (byte)((uint)iVar11 >> 8);
            pbVar8[2] = (byte)((uint)iVar11 >> 0x10);
            pbVar8[3] = (byte)((int)local_310 >> 0x1c);
            iVar11 = *(int *)(*(int *)(iVar4 + *piVar13 + 4) + iVar3 + 4) + iVar10;
            *(byte *)(iVar11 + 8) = (byte)local_310 & 0xf;
            *(undefined1 *)(iVar11 + 9) = 0;
            *(undefined1 *)(iVar11 + 10) = 0;
            *(undefined1 *)(iVar11 + 0xb) = 0;
            iVar11 = *(int *)(*(int *)(iVar4 + *piVar13 + 4) + iVar3 + 4) + iVar10;
            *(char *)(iVar11 + 0xc) = (char)local_30c;
            iVar10 = iVar10 + 0x10;
            *(char *)(iVar11 + 0xd) = (char)(local_30c >> 8);
            *(char *)(iVar11 + 0xe) = (char)(local_30c >> 0x10);
            *(char *)(iVar11 + 0xf) = (char)(local_30c >> 0x18);
            local_334 = local_334 + 1;
          } while ((int)(intptr_t)local_334 < *piVar15);
        }
        iVar3 = iVar3 + 0x14;
      } while (iVar3 < 0x500);
      iVar4 = iVar4 + 0x14;
      local_33c = local_33c + -1;
    } while (local_33c != 0);
  }
  if (1 < local_338) {
    piVar15 = (int *)(player + 0x1050c);
    iVar3 = 0x30;
    iVar4 = local_338 + -1;
    do {
      ordaudio_op_2413((void *)(intptr_t)(iVar3 + *piVar15 + 0x1c),*(undefined4 *)(iVar3 + *piVar15 + 4),0xffffffff);
      if (*(int *)(iVar3 + *piVar15 + 4) != 0) {
        /* Ghidra dropped the size argument here; the length field it just
           tested (*(iVar3 + *piVar15 + 4)) is the natural candidate --
           it's the field used as the "anything to copy" gate. */
        ce_memmove((void *)(intptr_t)(*(undefined4 *)(iVar3 + *piVar15 + 0x20)),local_32c + local_340,
                     *(int *)(iVar3 + *piVar15 + 4));
      }
      iVar10 = iVar3 + *piVar15;
      local_340 = *(int *)(iVar10 + 4) + local_340;
      if (0 < *(int *)(iVar10 + 4)) {
        ordaudio_op_2304((void *)(intptr_t)(iVar10 + 0x1c),(void *)(intptr_t)(*(undefined4 *)(iVar10 + 0x24)),
                     *(undefined1 *)(intptr_t)(*(int *)(iVar10 + 0x20) + *(int *)(iVar10 + 4) + -1));
        iVar10 = iVar3 + *piVar15;
        if (2 < *(int *)(iVar10 + 0x14)) {
          *(undefined1 *)(intptr_t)(*(int *)(iVar10 + 0x18) + *(int *)(iVar10 + 0x20)) =
               *(undefined1 *)(intptr_t)(*(int *)(iVar10 + 0x10) + *(int *)(iVar10 + 0x20));
        }
      }
      iVar4 = iVar4 + -1;
      iVar3 = iVar3 + 0x30;
    } while (iVar4 != 0);
  }
  build_mod_volume_sample_table(player,0x3c);
  player[0x10554] = 0;
  player[0x10555] = 0;
  player[0x10556] = 0;
  player[0x10557] = 0;
  GetUserDefaultLangID(auStack_2b0);
  CloseAllFileHandles(auStack_300);
  FoldStringW(auStack_330);
LAB_0004c940:
  BatteryDrvrGetLevels(&local_c);
  return player;
}


// was FUN_0004c958 -- destroys a MOD-player engine object: resets its state
// (reset_mod_player_state), then frees the object itself (cpp_operator_delete) if param_2's low bit
// is set...
int destroy_mod_player(int player, uint delete_flags)
{
  reset_mod_player_state((byte *)(intptr_t)(player));
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete((void *)(intptr_t)(player));
  }
  return player;
}



// was FUN_0004c97c -- resets a MOD-player engine object's full internal state (the large structure
// this whole cluster operates on, 0x10554+ bytes: pattern/sample/channel data): clears its header
// fields, stops playback first if currently playing (stop_mod_player_playback)...
void reset_mod_player_state(byte *player)
{
  *player = 0;
  player[1] = 0x30;
  player[2] = 8;
  player[3] = 0;
  if (*(int *)(player + 0x10554) != 0) {
    stop_mod_player_playback(player);
  }
  destroy_mod_dynamic_array(player + 0x1056c);
  destroy_mod_dynamic_array(player + 0x10558);
  destroy_mod_channel_state_array(player + 0x10520);
  destroy_mod_instrument_array(player + 0x10508);
  destroy_mod_pattern_array(player + 0x104f4);
  destroy_mod_dynamic_array(player + 0x104e0);
  BatteryDrvrGetLevels(player + 0x104d8);
}



// was FUN_0004ca50 -- starts MOD-player playback (no-op if already playing, per the +0x10554 "is
// playing" flag): opens the audio output device (waveOutOpen, with mod_player_wave_out_callback as
// its fill-buffer callback), zeroes the per-channel state array and several header fields...
int start_mod_player_playback(void *player_ptr)
{
  char *player = (char *)player_ptr;
  int iVar1;
  int *piVar2;
  int iVar3;
  undefined4 uVar4;
  undefined1 *puVar5;
  int iVar6;
  undefined2 local_2c;
  undefined2 local_2a;
  uint local_28;
  uint local_24;
  undefined2 local_20;
  undefined2 local_1e;
  undefined2 local_1c;
  
  if (*(int *)(player + 0x10554) == 0) {
    if (*(int *)(player + 0x1051c) != 0) {
      waveOutClose(*(int *)(player + 0x1051c));
    }
    local_1e = 8;
    local_28 = DAT_00086368;
    local_2c = 1;
    local_24 = DAT_00086368 & 0x1fffffff;
    local_2a = 1;
    local_1c = 0;
    local_20 = 1;
    waveOutOpen((int *)(player + 0x1051c),0xffffffff,&local_2c,mod_player_wave_out_callback,player,0x30000);
    iVar3 = 0;
    if (0 < *(int *)(player + 0x1054c)) {
      piVar2 = (int *)(player + 0x10524);
      iVar1 = 0;
      do {
        puVar5 = (undefined1 *)(intptr_t)(*piVar2 + iVar1);
        *puVar5 = 0;
        puVar5[1] = 0;
        puVar5[2] = 0;
        puVar5[3] = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 4) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 5) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 6) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 7) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 8) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 9) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 10) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0xb) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0xc) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0xd) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0xe) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0xf) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x14) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x15) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x16) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x17) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x18) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x19) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x1a) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x1b) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x1c) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x1d) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x1e) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x1f) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x20) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x21) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x22) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x23) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x24) = 0;
        iVar3 = iVar3 + 1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x25) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x26) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x27) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x28) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x29) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x2a) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x2b) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x2c) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x2d) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x2e) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x2f) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x30) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x31) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x32) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x33) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x34) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x35) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x36) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x37) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x10) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x11) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x12) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x13) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x38) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x39) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x3a) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x3b) = 0;
        iVar6 = *piVar2 + iVar1;
        *(undefined1 *)(intptr_t)(iVar6 + 0x3c) = 0;
        iVar1 = iVar1 + 0x40;
        *(undefined1 *)(intptr_t)(iVar6 + 0x3d) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x3e) = 0;
        *(undefined1 *)(intptr_t)(iVar6 + 0x3f) = 0;
      } while (iVar3 < *(int *)(player + 0x1054c));
    }
    *(undefined1 *)(player + 0x10534) = 6;
    *(undefined1 *)(player + 0x10535) = 0;
    *(undefined1 *)(player + 0x10536) = 0;
    *(undefined1 *)(player + 0x10537) = 0;
    *(undefined1 *)(player + 0x10544) = 0x7d;
    *(undefined1 *)(player + 0x10545) = 0;
    *(undefined1 *)(player + 0x10546) = 0;
    *(undefined1 *)(player + 0x10547) = 0;
    *(undefined1 *)(player + 0x10548) = 0;
    *(undefined1 *)(player + 0x10549) = 0;
    *(undefined1 *)(player + 0x1054a) = 0;
    *(undefined1 *)(player + 0x1054b) = 0;
    *(undefined1 *)(player + 0x10538) = 0;
    *(undefined1 *)(player + 0x10539) = 0;
    *(undefined1 *)(player + 0x1053a) = 0;
    *(undefined1 *)(player + 0x1053b) = 0;
    *(undefined1 *)(player + 0x1053c) = 0;
    *(undefined1 *)(player + 0x1053d) = 0;
    *(undefined1 *)(player + 0x1053e) = 0;
    *(undefined1 *)(player + 0x1053f) = 0;
    if (*(char *)(player + 0x10580) != '\0') {
      uVar4 = *(undefined4 *)(intptr_t)
               (**(int **)(player + 0x104e4) * 0x14 + *(int *)(player + 0x104f8) + 4);
      *(char *)(player + 0x10550) = (char)uVar4;
      *(char *)(player + 0x10551) = (char)((uint)uVar4 >> 8);
      *(char *)(player + 0x10552) = (char)((uint)uVar4 >> 0x10);
      *(char *)(player + 0x10553) = (char)((uint)uVar4 >> 0x18);
    }
    *(undefined1 *)(player + 0x10540) = 0;
    *(undefined1 *)(player + 0x10541) = 0;
    *(undefined1 *)(player + 0x10542) = 0;
    *(undefined1 *)(player + 0x10543) = 0;
    iVar3 = queue_mod_audio_buffer(player);
    if ((iVar3 == 0) || (iVar3 = queue_mod_audio_buffer(player), iVar3 == 0)) {
      return 0;
    }
    *(undefined1 *)(player + 0x10554) = 1;
    *(undefined1 *)(player + 0x10555) = 0;
    *(undefined1 *)(player + 0x10556) = 0;
    *(undefined1 *)(player + 0x10557) = 0;
  }
  return 1;
}



// was FUN_0004cfc8 -- stops MOD-player playback: the shutdown
// counterpart to start_mod_player_playback, clearing the "is playing"
// flag first thing.
int stop_mod_player_playback(void *player_ptr)
{
  char *player = (char *)player_ptr;
  *(undefined1 *)(player + 0x10554) = 0;
  *(undefined1 *)(player + 0x10555) = 0;
  *(undefined1 *)(player + 0x10556) = 0;
  *(undefined1 *)(player + 0x10557) = 0;
  if (*(int *)(player + 0x1051c) != 0) {
    waveOutReset();
    waveOutClose(*(int *)(player + 0x1051c));
  }
  return 1;
}


// was FUN_0004d050 -- prepares and queues the next audio buffer for MOD playback (called twice from
// start_mod_player_playback for double-buffering): advances the row/pattern/song-position counters,
// mixing one row's worth of audio via process_mod_tracker_row when a row boundary is reached...
bool queue_mod_audio_buffer(char *player)
{
  char *pcVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 *puVar4;
  undefined1 *puVar5;
  int *piVar6;
  undefined1 *puVar7;
  int iVar8;
  int *piVar9;
  int iVar10;
  int iVar11;
  undefined4 *puVar12;
  int *piVar13;
  int *piVar14;
  int iVar15;
  int iVar16;
  bool bVar17;
  bool bVar18;
  bool bVar19;
  int local_a0;
  int local_9c;
  undefined1 auStack_94 [4];
  int local_90;
  undefined1 auStack_7c [4];
  int local_78;
  int local_64 [16];
  
  uVar3 = ordint_divmod(5,*(int *)(player + 0x10544) << 1).quot;
  iVar2 = DAT_00086368;
  uVar3 = ordint_divmod(uVar3,DAT_00086368).quot;
  iVar8 = iVar2 >> 3;
  init_mod_dynamic_array(auStack_7c);
  init_mod_dynamic_array(auStack_94);
  resize_mod_int_array(auStack_7c,iVar8,0xffffffff);
  resize_mod_int_array(auStack_94,iVar8,0xffffffff);
  puVar4 = (undefined1 *)cpp_operator_new(8);
  *puVar4 = (char)(uintptr_t)player;
  puVar4[1] = (char)((uint)(uintptr_t)player >> 8);
  puVar4[2] = (char)((uint)(uintptr_t)player >> 0x10);
  puVar4[3] = (char)((uint)(uintptr_t)player >> 0x18);
  puVar5 = (undefined1 *)cpp_operator_new(iVar8 + 0x20);
  local_a0 = 0;
  puVar4[4] = (char)(uintptr_t)puVar5;
  puVar4[5] = (char)((uint)(uintptr_t)puVar5 >> 8);
  puVar4[6] = (char)((uint)(uintptr_t)puVar5 >> 0x10);
  puVar4[7] = (char)((uint)(uintptr_t)puVar5 >> 0x18);
  if ((*(char *)(player + 0x10580) != '\0') && (iVar8 != 0)) {
    piVar14 = (int *)(player + 0x10548);
    iVar15 = iVar8;
    do {
      if (*piVar14 == 0) {
        piVar13 = (int *)(player + 0x10540);
        if (*piVar13 == 0) {
          piVar9 = (int *)(player + 0x10538);
          piVar6 = (int *)(player + 0x1053c);
          iVar10 = *piVar6 + 1;
          iVar16 = *(int *)(intptr_t)(*(int *)(intptr_t)(*(int *)(player + 0x104e4) + *piVar9 * 4) * 0x14 +
                            *(int *)(player + 0x104f8) + 4) + *piVar6 * 0x14;
          *(char *)(player + 0x10550) = (char)iVar16;
          *(char *)(player + 0x10551) = (char)((uint)iVar16 >> 8);
          *(char *)(player + 0x10552) = (char)((uint)iVar16 >> 0x10);
          *(char *)(player + 0x10553) = (char)((uint)iVar16 >> 0x18);
          *(char *)piVar6 = (char)iVar10;
          *(char *)(player + 0x1053d) = (char)((uint)iVar10 >> 8);
          *(char *)(player + 0x1053e) = (char)((uint)iVar10 >> 0x10);
          *(char *)(player + 0x1053f) = (char)((uint)iVar10 >> 0x18);
          if (0x3f < iVar10) {
            *(undefined1 *)piVar6 = 0;
            *(undefined1 *)(player + 0x1053d) = 0;
            *(undefined1 *)(player + 0x1053e) = 0;
            *(undefined1 *)(player + 0x1053f) = 0;
            iVar10 = *piVar9 + 1;
            *(char *)piVar9 = (char)iVar10;
            *(char *)(player + 0x10539) = (char)((uint)iVar10 >> 8);
            *(char *)(player + 0x1053a) = (char)((uint)iVar10 >> 0x10);
            *(char *)(player + 0x1053b) = (char)((uint)iVar10 >> 0x18);
            if (*(int *)(player + 0x104dc) <= iVar10) {
              *(undefined1 *)piVar9 = 0;
              *(undefined1 *)(player + 0x10539) = 0;
              *(undefined1 *)(player + 0x1053a) = 0;
              *(undefined1 *)(player + 0x1053b) = 0;
            }
          }
          process_mod_tracker_row(player);
        }
        else {
          apply_mod_tracker_tick_effects(player);
        }
        iVar10 = *piVar13 + 1;
        *(char *)piVar13 = (char)iVar10;
        *(char *)(player + 0x10541) = (char)((uint)iVar10 >> 8);
        *(char *)(player + 0x10542) = (char)((uint)iVar10 >> 0x10);
        *(char *)(player + 0x10543) = (char)((uint)iVar10 >> 0x18);
        if (*(int *)(player + 0x10534) <= iVar10) {
          *(undefined1 *)piVar13 = 0;
          *(undefined1 *)(player + 0x10541) = 0;
          *(undefined1 *)(player + 0x10542) = 0;
          *(undefined1 *)(player + 0x10543) = 0;
        }
        *(char *)piVar14 = (char)uVar3;
        *(char *)(player + 0x10549) = (char)((uint)uVar3 >> 8);
        *(char *)(player + 0x1054a) = (char)((uint)uVar3 >> 0x10);
        *(char *)(player + 0x1054b) = (char)((uint)uVar3 >> 0x18);
      }
      iVar10 = *piVar14;
      iVar16 = iVar10;
      if (iVar15 < iVar10) {
        iVar16 = iVar15;
      }
      iVar10 = iVar10 - iVar16;
      *(char *)piVar14 = (char)iVar10;
      *(char *)(player + 0x10549) = (char)((uint)iVar10 >> 8);
      iVar15 = iVar15 - iVar16;
      *(char *)(player + 0x1054a) = (char)((uint)iVar10 >> 0x10);
      *(char *)(player + 0x1054b) = (char)((uint)iVar10 >> 0x18);
      mix_mod_channels_to_buffer(player,(uint *)(intptr_t)(local_78 + local_a0 * 4),(uint *)(intptr_t)(local_90 + local_a0 * 4),iVar16);
      local_a0 = iVar16 + local_a0;
    } while (iVar15 != 0);
  }
  iVar15 = 0;
  iVar10 = 0;
  piVar14 = local_64;
  iVar16 = (int)(intptr_t)player;
  do {
    pcVar1 = (char *)(intptr_t)(iVar16 + 0x10410);
    iVar16 = iVar16 + 0xd;
    if (*pcVar1 != '\0') {
      *piVar14 = iVar10;
      iVar15 = iVar15 + 1;
      piVar14 = piVar14 + 1;
    }
    iVar10 = iVar10 + 1;
  } while (iVar10 < 0x10);
  local_a0 = 0;
  if (0 < iVar8) {
    do {
      iVar10 = 0;
      if (0 < iVar15) {
        piVar14 = local_64;
        local_9c = iVar15;
        do {
          iVar16 = (int)(intptr_t)(*piVar14 * 0xd + player);
          if (*(char *)(intptr_t)(iVar16 + 0x10410) != '\0') {
            iVar11 = *(int *)(intptr_t)(iVar16 + 0x10408);
            if (iVar11 < *(int *)(intptr_t)(iVar16 + 0x1040c)) {
              iVar10 = iVar10 + (uint)*(byte *)(intptr_t)(*(int *)(intptr_t)(iVar16 + 0x10404) + iVar11) + -0x80;
              iVar11 = iVar11 + 1;
            }
            else {
              *(char *)(intptr_t)(iVar16 + 0x10410) = '\0';
              iVar11 = 0;
            }
            *(char *)(intptr_t)(iVar16 + 0x10408) = (char)iVar11;
            *(char *)(intptr_t)(iVar16 + 0x10409) = (char)((uint)iVar11 >> 8);
            *(char *)(intptr_t)(iVar16 + 0x1040a) = (char)((uint)iVar11 >> 0x10);
            *(char *)(intptr_t)(iVar16 + 0x1040b) = (char)((uint)iVar11 >> 0x18);
          }
          piVar14 = piVar14 + 1;
          local_9c = local_9c + -1;
        } while (local_9c != 0);
      }
      iVar10 = iVar10 + ((*(int *)(intptr_t)(local_90 + local_a0 * 4) + *(int *)(intptr_t)(local_78 + local_a0 * 4)) >> 8)
      ;
      bVar19 = SCARRY4(iVar10,0x80);
      iVar10 = iVar10 + 0x80;
      bVar17 = iVar10 < 0;
      bVar18 = iVar10 == 0;
      if (bVar17) {
        iVar10 = 0;
      }
      else {
        bVar19 = SBORROW4(iVar10,0xff);
        bVar18 = iVar10 == 0xff;
      }
      if (!bVar18 && (bVar17 || iVar10 + -0xff < 0) == bVar19) {
        iVar10 = 0xff;
      }
      puVar5[local_a0 + 0x20] = (char)iVar10;
      local_a0 = local_a0 + 1;
    } while (local_a0 < iVar8);
  }
  puVar7 = puVar5 + 0x20;
  puVar5[4] = (char)iVar8;
  *puVar5 = (char)(uintptr_t)puVar7;
  puVar5[1] = (char)((uint)(uintptr_t)puVar7 >> 8);
  puVar5[2] = (char)((uint)(uintptr_t)puVar7 >> 0x10);
  puVar5[3] = (char)((uint)(uintptr_t)puVar7 >> 0x18);
  puVar5[5] = (char)((uint)iVar8 >> 8);
  puVar5[6] = (char)((uint)iVar8 >> 0x10);
  puVar5[7] = (char)(iVar2 >> 0x1b);
  puVar5[0x10] = 0;
  puVar5[0x11] = 0;
  puVar5[0x12] = 0;
  puVar5[0x13] = 0;
  puVar5[0x14] = 0;
  puVar5[0x15] = 0;
  puVar5[0x16] = 0;
  puVar5[0x17] = 0;
  puVar5[0xc] = (char)(uintptr_t)puVar4;
  puVar5[0xd] = (char)((uint)(uintptr_t)puVar4 >> 8);
  puVar5[0xe] = (char)((uint)(uintptr_t)puVar4 >> 0x10);
  puVar5[0xf] = (char)((uint)(uintptr_t)puVar4 >> 0x18);
  puVar12 = (undefined4 *)(player + 0x1051c);
  waveOutPrepareHeader(*puVar12,puVar5,0x20);
  iVar8 = waveOutWrite(*puVar12,puVar5,0x20);
  if (iVar8 != 0) {
    waveOutUnprepareHeader(*puVar12,puVar5,0x20);
    cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(puVar4 + 4)));
  }
  destroy_mod_dynamic_array(auStack_94);
  destroy_mod_dynamic_array(auStack_7c);
  return iVar8 == 0;
}


// was FUN_0004d79c -- the MOD-tracker engine's "process one pattern row" routine, called from
// queue_mod_audio_buffer at each row boundary: for every channel, reads its current row entry...
void process_mod_tracker_row(char *player)
{
  uint3 *puVar1;
  undefined1 uVar2;
  char cVar3;
  undefined1 uVar4;
  undefined1 uVar5;
  int iVar8;
  ushort uVar9;
  int iVar10;
  int *piVar11;
  undefined1 *puVar12;
  int *piVar13;
  int iVar14;
  undefined4 uVar15;
  uint uVar16;
  int iVar17;
  int iVar18;
  int *piVar19;
  int iVar20;
  int *piVar21;
  int iVar22;
  int local_48;
  int local_44;
  int local_3c;
  int local_34;
  undefined1 uVar6;
  char cVar7;
  
  piVar21 = (int *)(player + 0x10538);
  local_44 = *piVar21;
  local_3c = *(int *)(player + 0x1053c);
  local_48 = 0;
  if (0 < *(int *)(player + 0x1054c)) {
    local_34 = 0;
    piVar19 = (int *)(player + 0x10524);
    iVar18 = 0;
    do {
      piVar11 = (int *)(intptr_t)(*(int *)(intptr_t)(*(int *)(player + 0x10550) + 4) + local_34);
      iVar17 = *piVar11;
      iVar14 = piVar11[1];
      iVar8 = piVar11[2];
      puVar1 = (uint3 *)(piVar11 + 3);
      uVar9 = (ushort)*puVar1;
      uVar2 = *(undefined1 *)((char *)piVar11 + 0xe);
      cVar3 = *(char *)((char *)piVar11 + 0xf);
      iVar10 = *(int *)puVar1;
      iVar20 = iVar10 >> 4;
      uVar16 = *puVar1 & 0xf;
      if (0 < iVar17) {
        puVar12 = (undefined1 *)(intptr_t)(iVar18 + *piVar19);
        *puVar12 = (char)iVar17;
        puVar12[1] = (char)((uint)iVar17 >> 8);
        puVar12[2] = (char)((uint)iVar17 >> 0x10);
        puVar12[3] = (char)((uint)iVar17 >> 0x18);
        iVar22 = iVar18 + *piVar19;
        uVar15 = *(undefined4 *)(intptr_t)(*(int *)(player + 0x1050c) + iVar17 * 0x30 + 0xc);
        *(char *)(intptr_t)(iVar22 + 0x14) = (char)uVar15;
        *(char *)(intptr_t)(iVar22 + 0x15) = (char)((uint)uVar15 >> 8);
        *(char *)(intptr_t)(iVar22 + 0x16) = (char)((uint)uVar15 >> 0x10);
        *(char *)(intptr_t)(iVar22 + 0x17) = (char)((uint)uVar15 >> 0x18);
        iVar22 = *piVar19 + iVar18;
        uVar15 = *(undefined4 *)(intptr_t)(*piVar19 + iVar18 + 0x14);
        *(char *)(intptr_t)(iVar22 + 0x18) = (char)uVar15;
        *(char *)(intptr_t)(iVar22 + 0x19) = (char)((uint)uVar15 >> 8);
        *(char *)(intptr_t)(iVar22 + 0x1a) = (char)((uint)uVar15 >> 0x10);
        *(char *)(intptr_t)(iVar22 + 0x1b) = (char)((uint)uVar15 >> 0x18);
        if ((iVar8 != 3) && (iVar8 != 5)) {
          iVar22 = iVar18 + *piVar19;
          *(undefined1 *)(intptr_t)(iVar22 + 4) = 0;
          *(undefined1 *)(intptr_t)(iVar22 + 5) = 0;
          *(undefined1 *)(intptr_t)(iVar22 + 6) = 0;
          *(undefined1 *)(intptr_t)(iVar22 + 7) = 0;
        }
      }
      if (-1 < iVar14) {
        iVar22 = iVar18 + *piVar19;
        iVar14 = piVar11[1];
        *(char *)(intptr_t)(iVar22 + 8) = (char)iVar14;
        *(char *)(intptr_t)(iVar22 + 9) = (char)((uint)iVar14 >> 8);
        *(char *)(intptr_t)(iVar22 + 10) = (char)((uint)iVar14 >> 0x10);
        *(char *)(intptr_t)(iVar22 + 0xb) = (char)((uint)iVar14 >> 0x18);
        if ((iVar8 != 3) && (iVar8 != 5)) {
          piVar13 = (int *)(intptr_t)(*piVar19 + iVar18);
          iVar14 = *(int *)(intptr_t)(*piVar13 * 0x30 + *(int *)(player + 0x1050c) + 8) + piVar13[2];
          if (iVar14 < 0) {
            iVar14 = 0;
          }
          iVar22 = *piVar19 + iVar18;
          if (0x127 < iVar14) {
            iVar14 = 0x127;
          }
          uVar15 = (&DAT_00086370)[iVar14];
          *(char *)(intptr_t)(iVar22 + 0xc) = (char)uVar15;
          *(char *)(intptr_t)(iVar22 + 0xd) = (char)((uint)uVar15 >> 8);
          *(char *)(intptr_t)(iVar22 + 0xe) = (char)((uint)uVar15 >> 0x10);
          *(char *)(intptr_t)(iVar22 + 0xf) = (char)((uint)uVar15 >> 0x18);
        }
        if ((iVar17 == 0) && (iVar8 == 0)) {
          iVar14 = iVar18 + *piVar19;
          *(undefined1 *)(intptr_t)(iVar14 + 4) = 0;
          *(undefined1 *)(intptr_t)(iVar14 + 5) = 0;
          *(undefined1 *)(intptr_t)(iVar14 + 6) = 0;
          *(undefined1 *)(intptr_t)(iVar14 + 7) = 0;
        }
        iVar14 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar14 + 0x24) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x25) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x26) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x27) = 0;
        iVar14 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar14 + 0x28) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x29) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x2a) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x2b) = 0;
        iVar14 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar14 + 0x2c) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x2d) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x2e) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x2f) = 0;
        iVar14 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar14 + 0x30) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x31) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x32) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x33) = 0;
        iVar14 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar14 + 0x38) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x39) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x3a) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x3b) = 0;
        iVar14 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar14 + 0x3c) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x3d) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x3e) = 0;
        *(undefined1 *)(intptr_t)(iVar14 + 0x3f) = 0;
      }
      if (0xc < piVar11[2] - 3U) goto LAB_0004e21c;
      uVar4 = (undefined1)uVar16;
      uVar5 = (undefined1)((uint)iVar20 >> 8);
      uVar6 = (undefined1)((uint)iVar20 >> 0x10);
      cVar7 = cVar3 >> 4;
      switch(piVar11[2]) {
      case 3:
        goto LAB_0004dcac;
      case 4:
        if (0 < iVar20) {
          iVar17 = iVar18 + *piVar19;
          *(char *)(intptr_t)(iVar17 + 0x24) = (char)iVar20;
          *(undefined1 *)(intptr_t)(iVar17 + 0x25) = uVar5;
          *(undefined1 *)(intptr_t)(iVar17 + 0x26) = uVar6;
          *(char *)(intptr_t)(iVar17 + 0x27) = cVar7;
        }
        if ((uVar9 & 0xf) != 0) {
          iVar20 = iVar18 + *piVar19;
          *(undefined1 *)(intptr_t)(iVar20 + 0x28) = uVar4;
          *(undefined1 *)(intptr_t)(iVar20 + 0x29) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x2a) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x2b) = 0;
        }
        break;
      case 5:
LAB_0004dcac:
        iVar20 = *piVar19 + iVar18;
        uVar15 = (&DAT_00086370)
                 [*(int *)(intptr_t)(*(int *)(player + 0x1050c) + iVar17 * 0x30 + 8) +
                  *(int *)(intptr_t)(*piVar19 + iVar18 + 8)];
        *(char *)(intptr_t)(iVar20 + 0x1c) = (char)uVar15;
        *(char *)(intptr_t)(iVar20 + 0x1d) = (char)((uint)uVar15 >> 8);
        *(char *)(intptr_t)(iVar20 + 0x1e) = (char)((uint)uVar15 >> 0x10);
        *(char *)(intptr_t)(iVar20 + 0x1f) = (char)((uint)uVar15 >> 0x18);
        if ((0 < iVar10) && (iVar8 == 3)) {
          iVar20 = iVar18 + *piVar19;
          *(char *)(intptr_t)(iVar20 + 0x20) = (char)uVar9;
          *(char *)(intptr_t)(iVar20 + 0x21) = (char)(uVar9 >> 8);
          *(undefined1 *)(intptr_t)(iVar20 + 0x22) = uVar2;
          *(char *)(intptr_t)(iVar20 + 0x23) = cVar3;
        }
        break;
      case 6:
        break;
      case 7:
        if (0 < iVar20) {
          iVar17 = iVar18 + *piVar19;
          *(char *)(intptr_t)(iVar17 + 0x2c) = (char)iVar20;
          *(undefined1 *)(intptr_t)(iVar17 + 0x2d) = uVar5;
          *(undefined1 *)(intptr_t)(iVar17 + 0x2e) = uVar6;
          *(char *)(intptr_t)(iVar17 + 0x2f) = cVar7;
        }
        if ((uVar9 & 0xf) != 0) {
          iVar20 = iVar18 + *piVar19;
          *(undefined1 *)(intptr_t)(iVar20 + 0x30) = uVar4;
          *(undefined1 *)(intptr_t)(iVar20 + 0x31) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x32) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x33) = 0;
        }
        break;
      case 8:
        if (iVar10 == 0xa4) {
          iVar20 = iVar18 + *piVar19;
          *(undefined1 *)(intptr_t)(iVar20 + 0x34) = 7;
          *(undefined1 *)(intptr_t)(iVar20 + 0x35) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x36) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x37) = 0;
        }
        else {
          iVar17 = (iVar10 >> 3) + -1;
          iVar20 = iVar18 + *piVar19;
          *(char *)(intptr_t)(iVar20 + 0x34) = (char)iVar17;
          *(char *)(intptr_t)(iVar20 + 0x35) = (char)((uint)iVar17 >> 8);
          *(char *)(intptr_t)(iVar20 + 0x36) = (char)((uint)iVar17 >> 0x10);
          *(char *)(intptr_t)(iVar20 + 0x37) = (char)((uint)iVar17 >> 0x18);
        }
        if (*(int *)(intptr_t)(*piVar19 + iVar18 + 0x34) < 0) {
          iVar20 = *piVar19 + iVar18;
          *(undefined1 *)(intptr_t)(iVar20 + 0x34) = 0;
LAB_0004e0b8:
          *(undefined1 *)(intptr_t)(iVar20 + 0x35) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x36) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0x37) = 0;
        }
        break;
      case 9:
        uVar9 = *(ushort *)(piVar11 + 3);
        iVar20 = iVar18 + *piVar19;
        *(undefined1 *)(intptr_t)(iVar20 + 4) = 0;
        *(undefined1 *)(intptr_t)(iVar20 + 5) = 0;
        *(char *)(intptr_t)(iVar20 + 6) = (char)(((uVar9 & 0x3fff) << 10) >> 8);
        *(char *)(intptr_t)(iVar20 + 7) = (char)(((uVar9 & 0x3fff) << 2) >> 8);
        break;
      case 10:
        break;
      case 0xb:
        local_44 = piVar11[3];
        if (*(int *)(player + 0x104dc) <= local_44) {
          local_44 = 0;
        }
        local_3c = 0;
        goto LAB_0004df60;
      case 0xc:
LAB_0004df60:
        iVar17 = iVar18 + *piVar19;
        iVar20 = piVar11[3];
        *(char *)(intptr_t)(iVar17 + 0x14) = (char)iVar20;
        *(char *)(intptr_t)(iVar17 + 0x15) = (char)((uint)iVar20 >> 8);
        *(char *)(intptr_t)(iVar17 + 0x16) = (char)((uint)iVar20 >> 0x10);
        *(char *)(intptr_t)(iVar17 + 0x17) = (char)((uint)iVar20 >> 0x18);
        uVar16 = 0;
LAB_0004e058:
        adjust_mod_channel_volume(player,local_48,uVar16);
        iVar20 = *piVar19 + iVar18;
        uVar15 = *(undefined4 *)(intptr_t)(*piVar19 + iVar18 + 0x14);
        *(char *)(intptr_t)(iVar20 + 0x18) = (char)uVar15;
        *(char *)(intptr_t)(iVar20 + 0x19) = (char)((uint)uVar15 >> 8);
        *(char *)(intptr_t)(iVar20 + 0x1a) = (char)((uint)uVar15 >> 0x10);
        *(char *)(intptr_t)(iVar20 + 0x1b) = (char)((uint)uVar15 >> 0x18);
        break;
      case 0xd:
        local_3c = iVar20 * 10 + uVar16;
        if (0x3f < local_3c) {
          local_3c = 0;
        }
        local_44 = CONCAT13(*(undefined1 *)(player + 0x1053b),
                            CONCAT12(*(undefined1 *)(player + 0x1053a),
                                     CONCAT11(*(undefined1 *)(player + 0x10539),
                                              *(undefined1 *)piVar21))) + 1;
        if (*(int *)(player + 0x104dc) <= local_44) {
          local_44 = 0;
        }
        break;
      case 0xe:
        if (iVar20 == 1) {
          piVar11 = (int *)(intptr_t)(iVar18 + *piVar19 + 0xc);
          iVar20 = *piVar11 - uVar16;
LAB_0004e184:
          *(char *)piVar11 = (char)iVar20;
          *(char *)((char *)piVar11 + 1) = (char)((uint)iVar20 >> 8);
          *(char *)((char *)piVar11 + 2) = (char)((uint)iVar20 >> 0x10);
          *(char *)((char *)piVar11 + 3) = (char)((uint)iVar20 >> 0x18);
          break;
        }
        if (iVar20 == 2) {
          piVar11 = (int *)(intptr_t)(iVar18 + *piVar19 + 0xc);
          iVar20 = *piVar11 + uVar16;
          goto LAB_0004e184;
        }
        if (iVar20 == 5) {
          iVar20 = iVar17 * 0x30 + *(int *)(player + 0x1050c);
          *(undefined1 *)(intptr_t)(iVar20 + 8) = uVar4;
          *(undefined1 *)(intptr_t)(iVar20 + 9) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 10) = 0;
          *(undefined1 *)(intptr_t)(iVar20 + 0xb) = 0;
          piVar11 = (int *)(intptr_t)(iVar17 * 0x30 + *(int *)(player + 0x1050c) + 8);
          if (*piVar11 < 8) break;
          iVar20 = *piVar11 + -0x10;
          goto LAB_0004e184;
        }
        if (iVar20 == 8) {
          iVar20 = iVar18 + *piVar19;
          *(undefined1 *)(intptr_t)(iVar20 + 0x34) = uVar4;
          goto LAB_0004e0b8;
        }
        if (iVar20 != 10) {
          if (iVar20 != 0xb) break;
          uVar16 = -uVar16;
        }
        goto LAB_0004e058;
      case 0xf:
        iVar20 = piVar11[3];
        uVar16 = 0x10400;
        if (iVar10 < 0x20) {
          uVar16 = 0x10534;
        }
        uVar2 = *(undefined1 *)((char *)piVar11 + 0xe);
        if (0x1f < iVar10) {
          uVar16 = uVar16 | 0x144;
        }
        uVar4 = *(undefined1 *)((char *)piVar11 + 0xf);
        puVar12 = (undefined1 *)(player + uVar16);
        *puVar12 = (char)(short)iVar20;
        puVar12[1] = (char)((ushort)(short)iVar20 >> 8);
        puVar12[2] = uVar2;
        puVar12[3] = uVar4;
      }
LAB_0004e21c:
      iVar20 = iVar18 + *piVar19;
      if (0 < *(int *)(intptr_t)(iVar20 + 0xc)) {
        uVar15 = ordfloat_int_to_float2(*(int *)(intptr_t)(iVar20 + 0xc));
        uVar15 = ordfloat_div(0x4a5a7a65,uVar15);
        *(char *)(intptr_t)(iVar20 + 0x10) = (char)uVar15;
        *(char *)(intptr_t)(iVar20 + 0x11) = (char)((uint)uVar15 >> 8);
        *(char *)(intptr_t)(iVar20 + 0x12) = (char)((uint)uVar15 >> 0x10);
        *(char *)(intptr_t)(iVar20 + 0x13) = (char)((uint)uVar15 >> 0x18);
      }
      iVar18 = iVar18 + 0x40;
      local_48 = local_48 + 1;
      local_34 = local_34 + 0x10;
    } while (local_48 < *(int *)(player + 0x1054c));
  }
  *(char *)(player + 0x1053c) = (char)local_3c;
  *(char *)(player + 0x1053d) = (char)((uint)local_3c >> 8);
  *(char *)piVar21 = (char)local_44;
  *(char *)(player + 0x1053e) = (char)((uint)local_3c >> 0x10);
  *(char *)(player + 0x1053f) = (char)((uint)local_3c >> 0x18);
  *(char *)(player + 0x10539) = (char)((uint)local_44 >> 8);
  *(char *)(player + 0x1053a) = (char)((uint)local_44 >> 0x10);
  *(char *)(player + 0x1053b) = (char)((uint)local_44 >> 0x18);
}


// was FUN_0004e324 -- the MOD-tracker engine's core sample mixer: zeroes the left/right output
// buffers (param_2/param_3, param_4 samples each), then for every active channel with a loaded
// sample (per-channel state at +0x10524, sample data pointer check at +0x24)...
int mix_mod_channels_to_buffer(char *player, uint *left_buffer, uint *right_buffer, int sample_count)
{
  int iVar1;
  uint3 uVar2;
  uint3 uVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int *piVar11;
  int iVar12;
  int iVar13;
  int iVar14;
  int iVar15;
  int local_50;
  uint local_4c;
  undefined4 *local_48;
  
  if (0 < sample_count) {
    puVar4 = left_buffer;
    iVar9 = sample_count;
    do {
      *(undefined4 *)(intptr_t)(((int)(uintptr_t)right_buffer - (int)(uintptr_t)left_buffer) + (int)(uintptr_t)puVar4) = 0;
      iVar9 = iVar9 + -1;
      *puVar4 = 0;
      puVar4 = puVar4 + 1;
    } while (iVar9 != 0);
  }
  local_4c = 0;
  if (0 < *(int *)(player + 0x1054c)) {
    local_50 = 0;
    do {
      piVar11 = (int *)(intptr_t)(local_50 + *(int *)(player + 0x10524));
      if ((0 < *piVar11) &&
         (iVar9 = *piVar11 * 0x30 + *(int *)(player + 0x1050c), *(int *)(intptr_t)(iVar9 + 0x24) != 0)) {
        if (((local_4c & 3) == 0) || (local_48 = right_buffer, (local_4c & 3) == 3)) {
          local_48 = left_buffer;
        }
        iVar15 = *(int *)(intptr_t)(iVar9 + 0x20);
        iVar1 = (uint)*(uint3 *)(intptr_t)(iVar9 + 4) * 0x400;
        uVar2 = *(uint3 *)(intptr_t)(iVar9 + 0x14);
        iVar9 = (uint)*(uint3 *)(intptr_t)(iVar9 + 0x18) * 0x400;
        iVar13 = piVar11[1];
        uVar5 = ordfloat_mul(piVar11[4],0x44800000);
        uVar6 = ordfloat_int_to_float2(DAT_00086368);
        iVar7 = ordfloat_uint_to_float(ordfloat_div(uVar5,uVar6));
        uVar3 = *(uint3 *)(piVar11 + 6);
        iVar14 = 0;
        iVar12 = sample_count;
        while (iVar12 != 0) {
          if (iVar9 < 0x801) {
            if (iVar13 < iVar1) {
              iVar12 = ordint_divmod(iVar7,(iVar1 - iVar13) + -1).quot;
              iVar10 = iVar12 + 1;
              if (sample_count < iVar12 + 1) {
                iVar10 = sample_count;
              }
            }
            else {
              iVar10 = 0;
            }
            iVar12 = 0;
          }
          else {
            if (iVar9 <= iVar13) {
              iVar13 = iVar13 + (uint)uVar2 * -0x400;
            }
            iVar8 = ordint_divmod(iVar7,(iVar9 - iVar13) + -1).quot;
            iVar10 = iVar8 + 1;
            if (iVar12 < iVar8 + 1) {
              iVar10 = iVar12;
            }
            iVar12 = iVar12 - iVar10;
          }
          if (0 < iVar10) {
            piVar11 = local_48 + iVar14;
            iVar14 = iVar10 + iVar14;
            do {
              iVar8 = iVar13 >> 10;
              iVar10 = iVar10 + -1;
              iVar13 = iVar7 + iVar13;
              *piVar11 = *(int *)(player + (uint)uVar3 * 0x400 + 4 +
                                 (uint)*(byte *)(intptr_t)(iVar15 + iVar8) * 4) + *piVar11;
              piVar11 = piVar11 + 1;
            } while (iVar10 != 0);
          }
        }
        iVar9 = local_50 + *(int *)(player + 0x10524);
        *(char *)(intptr_t)(iVar9 + 4) = (char)iVar13;
        *(char *)(intptr_t)(iVar9 + 5) = (char)((uint)iVar13 >> 8);
        *(char *)(intptr_t)(iVar9 + 6) = (char)((uint)iVar13 >> 0x10);
        *(char *)(intptr_t)(iVar9 + 7) = (char)((uint)iVar13 >> 0x18);
      }
      local_4c = local_4c + 1;
      local_50 = local_50 + 0x40;
    } while ((int)local_4c < *(int *)(player + 0x1054c));
  }
  return 1;
}


// was FUN_0004e6e0 -- the MOD-tracker engine's per-tick effect processor (as opposed to
// process_mod_tracker_row's per-row setup): for each channel, dispatches on its current effect
// code...
void apply_mod_tracker_tick_effects(char *player)
{
  int uw_ord2005_rem_114 = 0;
  uint uVar1;
  int *piVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  int extraout_r1;
  int *piVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  int iVar10;
  int local_30;
  
  piVar2 = (int *)(player + 0x1054c);
  iVar10 = 0;
  if (0 < *piVar2) {
    local_30 = 0;
    iVar8 = 0;
    piVar4 = piVar2;
    do {
      iVar3 = *(int *)(intptr_t)(*(int *)(player + 0x10550) + 4) + local_30;
      uVar1 = *(uint *)(intptr_t)(iVar3 + 0xc);
      iVar7 = (int)uVar1 >> 4;
      uVar9 = uVar1 & 0xf;
      switch(*(undefined4 *)(intptr_t)(iVar3 + 8)) {
      case 0:
        if (0 < (int)uVar1) {
          uw_ord2005_rem_114 = ((int)(*(undefined4 *)(player + 0x10540))) % (3);
          if (uw_ord2005_rem_114 == 0) {
            piVar4 = *(int **)(intptr_t)(*(int *)(player + 0x10524) + iVar8 + 0xc);
          }
          else {
            if (uw_ord2005_rem_114 == 1) {
              piVar4 = (int *)(intptr_t)(*(int *)(player + 0x10524) + iVar8);
              iVar7 = *(int *)(intptr_t)(*piVar4 * 0x30 + *(int *)(player + 0x1050c) + 8) + piVar4[2] +
                      iVar7 * 8;
            }
            else {
              if (uw_ord2005_rem_114 != 2) goto LAB_0004e964;
              piVar4 = (int *)(intptr_t)(*(int *)(player + 0x10524) + iVar8);
              iVar7 = *(int *)(intptr_t)(*piVar4 * 0x30 + *(int *)(player + 0x1050c) + 8) + piVar4[2] +
                      uVar9 * 8;
            }
            piVar4 = (int *)(intptr_t)(&DAT_00086370)[iVar7];
          }
LAB_0004e964:
          uVar5 = ordfloat_int_to_float2((int)(intptr_t)piVar4);
          uVar5 = ordfloat_div(0x4a5a7a65,uVar5);
          iVar7 = *(int *)(player + 0x10524);
          goto LAB_0004eb28;
        }
        break;
      case 1:
        piVar6 = (int *)(player + 0x10524);
        iVar7 = iVar8 + *piVar6;
        iVar3 = *(int *)(intptr_t)(iVar7 + 0xc) - uVar1;
        *(char *)(intptr_t)(iVar7 + 0xc) = (char)iVar3;
        *(char *)(intptr_t)(iVar7 + 0xd) = (char)((uint)iVar3 >> 8);
        *(char *)(intptr_t)(iVar7 + 0xe) = (char)((uint)iVar3 >> 0x10);
        *(char *)(intptr_t)(iVar7 + 0xf) = (char)((uint)iVar3 >> 0x18);
        if (*(int *)(intptr_t)(iVar8 + *piVar6 + 0xc) < 0x36) {
          iVar7 = iVar8 + *piVar6;
          *(undefined1 *)(intptr_t)(iVar7 + 0xc) = 0x36;
          *(undefined1 *)(intptr_t)(iVar7 + 0xd) = 0;
          *(undefined1 *)(intptr_t)(iVar7 + 0xe) = 0;
          *(undefined1 *)(intptr_t)(iVar7 + 0xf) = 0;
        }
        iVar7 = *piVar6;
        uVar5 = ordfloat_int_to_float2(*(undefined4 *)(intptr_t)(iVar8 + iVar7 + 0xc));
        uVar5 = ordfloat_div(0x4a5a7a65,uVar5);
        goto LAB_0004eb28;
      case 2:
        iVar7 = iVar8 + *(int *)(player + 0x10524);
        iVar3 = *(int *)(intptr_t)(iVar7 + 0xc) + uVar1;
        *(char *)(intptr_t)(iVar7 + 0xc) = (char)iVar3;
        *(char *)(intptr_t)(iVar7 + 0xd) = (char)((uint)iVar3 >> 8);
        *(char *)(intptr_t)(iVar7 + 0xe) = (char)((uint)iVar3 >> 0x10);
        *(char *)(intptr_t)(iVar7 + 0xf) = (char)((uint)iVar3 >> 0x18);
        iVar7 = *(int *)(player + 0x10524);
        uVar5 = ordfloat_int_to_float2(*(undefined4 *)(intptr_t)(iVar8 + iVar7 + 0xc));
        uVar5 = ordfloat_div(0x4a5a7a65,uVar5);
LAB_0004eb28:
        iVar7 = iVar8 + iVar7;
        *(char *)(intptr_t)(iVar7 + 0x10) = (char)uVar5;
        *(char *)(intptr_t)(iVar7 + 0x11) = (char)((uint)uVar5 >> 8);
        *(char *)(intptr_t)(iVar7 + 0x12) = (char)((uint)uVar5 >> 0x10);
        *(char *)(intptr_t)(iVar7 + 0x13) = (char)((uint)uVar5 >> 0x18);
        break;
      case 3:
        apply_mod_tone_portamento(player,iVar10);
        break;
      case 4:
        apply_mod_vibrato_effect(player,iVar10);
        break;
      case 5:
        apply_mod_tone_portamento(player,iVar10);
        goto LAB_0004eb74;
      case 6:
        apply_mod_vibrato_effect(player,iVar10);
        goto LAB_0004eb74;
      case 7:
        apply_mod_tremolo_effect(player,iVar10);
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
LAB_0004eb74:
        adjust_mod_channel_volume(player,iVar10,iVar7 - uVar9);
        iVar7 = iVar8 + *(int *)(player + 0x10524);
        uVar5 = *(undefined4 *)(intptr_t)(iVar8 + *(int *)(player + 0x10524) + 0x14);
        *(char *)(intptr_t)(iVar7 + 0x18) = (char)uVar5;
        *(char *)(intptr_t)(iVar7 + 0x19) = (char)((uint)uVar5 >> 8);
        *(char *)(intptr_t)(iVar7 + 0x1a) = (char)((uint)uVar5 >> 0x10);
        *(char *)(intptr_t)(iVar7 + 0x1b) = (char)((uint)uVar5 >> 0x18);
        break;
      case 0xb:
        break;
      case 0xc:
        break;
      case 0xd:
        break;
      case 0xe:
        if ((iVar7 == 0xc) && (*(uint *)(player + 0x10540) == uVar9)) {
          iVar7 = iVar8 + *(int *)(player + 0x10524);
          *(undefined1 *)(intptr_t)(iVar7 + 0x14) = 0;
          *(undefined1 *)(intptr_t)(iVar7 + 0x15) = 0;
          *(undefined1 *)(intptr_t)(iVar7 + 0x16) = 0;
          *(undefined1 *)(intptr_t)(iVar7 + 0x17) = 0;
          iVar7 = iVar8 + *(int *)(player + 0x10524);
          uVar5 = *(undefined4 *)(intptr_t)(iVar7 + 0x14);
          *(char *)(intptr_t)(iVar7 + 0x18) = (char)uVar5;
          *(char *)(intptr_t)(iVar7 + 0x19) = (char)((uint)uVar5 >> 8);
          *(char *)(intptr_t)(iVar7 + 0x1a) = (char)((uint)uVar5 >> 0x10);
          *(char *)(intptr_t)(iVar7 + 0x1b) = (char)((uint)uVar5 >> 0x18);
        }
      }
      iVar10 = iVar10 + 1;
      iVar8 = iVar8 + 0x40;
      local_30 = local_30 + 0x10;
    } while (iVar10 < *piVar2);
  }
}


// was FUN_0004ecd4 -- the waveOutProc-shaped callback passed to waveOutOpen (waveOutOpen) in
// start_mod_player_playback: on WOM_DONE (param_2==0x3bd, a completed-buffer notification), frees
// the just-finished buffer's resources and, if still playing...
void mod_player_wave_out_callback(int wave_out, int message, int instance, int header)
{
  int *piVar1;
  int iVar2;
  undefined4 uVar3;
  int *piVar4;
  
  if (message == 0x3bd) {
    piVar1 = *(int **)(intptr_t)(header + 0xc);
    iVar2 = *piVar1;
    piVar4 = (int *)(intptr_t)(iVar2 + 0x10554);
    if (*piVar4 != 0) {
      waveOutUnprepareHeader(*(undefined4 *)(intptr_t)(iVar2 + 0x1051c),(void *)(intptr_t)(header),0x20);
    }
    cpp_operator_delete((void *)(intptr_t)(piVar1[1]));
    cpp_operator_delete(piVar1);
    if (*piVar4 != 0) {
      uVar3 = queue_mod_audio_buffer((char *)(intptr_t)(iVar2));
      *(char *)piVar4 = (char)uVar3;
      *(char *)(intptr_t)(iVar2 + 0x10555) = (char)((uint)uVar3 >> 8);
      *(char *)(intptr_t)(iVar2 + 0x10556) = (char)((uint)uVar3 >> 0x10);
      *(char *)(intptr_t)(iVar2 + 0x10557) = (char)((uint)uVar3 >> 0x18);
    }
  }
}


// was FUN_0004edf8 -- adjusts channel param_2's volume field by delta
// param_3, clamped to the MOD volume range [0,0x40]. Called from
// apply_mod_tracker_tick_effects for volume-slide-shaped effects.
void adjust_mod_channel_volume(char *player, int channel, int delta)
{
  int iVar1;
  int iVar2;
  bool bVar3;
  bool bVar4;
  bool bVar5;
  
  iVar2 = channel * 0x40 + *(int *)(player + 0x10524);
  iVar1 = *(int *)(intptr_t)(channel * 0x40 + *(int *)(player + 0x10524) + 0x14);
  bVar5 = SCARRY4(iVar1,delta);
  iVar1 = iVar1 + delta;
  bVar3 = iVar1 < 0;
  bVar4 = iVar1 == 0;
  if (bVar3) {
    iVar1 = 0;
  }
  else {
    bVar5 = SBORROW4(iVar1,0x40);
    bVar4 = iVar1 == 0x40;
  }
  if (!bVar4 && (bVar3 || iVar1 + -0x40 < 0) == bVar5) {
    iVar1 = 0x40;
  }
  *(char *)(intptr_t)(iVar2 + 0x14) = (char)iVar1;
  *(char *)(intptr_t)(iVar2 + 0x15) = (char)((uint)iVar1 >> 8);
  *(char *)(intptr_t)(iVar2 + 0x16) = (char)((uint)iVar1 >> 0x10);
  *(char *)(intptr_t)(iVar2 + 0x17) = (char)((uint)iVar1 >> 0x18);
}


// was FUN_0004ee60 -- applies the MOD tracker's "tone portamento" effect to channel param_2: slides
// its current period (+0xc) toward a target period (+0x1c) by one step (+0x20), clamping once the
// target is reached, then recomputes the channel's playback frequency from the updated period.
void apply_mod_tone_portamento(char *player, int channel)
{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  int *piVar4;
  int iVar5;
  
  piVar4 = (int *)(player + 0x10524);
  channel = channel * 0x40;
  iVar1 = channel + *piVar4;
  piVar3 = (int *)(intptr_t)(iVar1 + 0xc);
  if (*piVar3 < *(int *)(intptr_t)(iVar1 + 0x1c)) {
    iVar5 = *(int *)(intptr_t)(iVar1 + 0x20) + CONCAT13(*(undefined1 *)(intptr_t)(iVar1 + 0xf),*(undefined3 *)piVar3);
    *(char *)piVar3 = (char)iVar5;
    *(char *)(intptr_t)(iVar1 + 0xd) = (char)((uint)iVar5 >> 8);
    *(char *)(intptr_t)(iVar1 + 0xe) = (char)((uint)iVar5 >> 0x10);
    *(char *)(intptr_t)(iVar1 + 0xf) = (char)((uint)iVar5 >> 0x18);
    iVar5 = *piVar4;
    iVar1 = *(int *)(intptr_t)(channel + iVar5 + 0x1c);
    if (*(int *)(intptr_t)(channel + iVar5 + 0xc) <= iVar1) goto LAB_0004f030;
  }
  else {
    if (*piVar3 <= *(int *)(intptr_t)(iVar1 + 0x1c)) goto LAB_0004f030;
    iVar5 = *(int *)(intptr_t)(iVar1 + 0xc) - *(int *)(intptr_t)(iVar1 + 0x20);
    *(char *)(intptr_t)(iVar1 + 0xc) = (char)iVar5;
    *(char *)(intptr_t)(iVar1 + 0xd) = (char)((uint)iVar5 >> 8);
    *(char *)(intptr_t)(iVar1 + 0xe) = (char)((uint)iVar5 >> 0x10);
    *(char *)(intptr_t)(iVar1 + 0xf) = (char)((uint)iVar5 >> 0x18);
    iVar5 = *piVar4;
    iVar1 = *(int *)(intptr_t)(channel + iVar5 + 0x1c);
    if (iVar1 <= *(int *)(intptr_t)(channel + iVar5 + 0xc)) goto LAB_0004f030;
  }
  iVar5 = channel + iVar5;
  *(char *)(intptr_t)(iVar5 + 0xc) = (char)iVar1;
  *(char *)(intptr_t)(iVar5 + 0xd) = (char)((uint)iVar1 >> 8);
  *(char *)(intptr_t)(iVar5 + 0xe) = (char)((uint)iVar1 >> 0x10);
  *(char *)(intptr_t)(iVar5 + 0xf) = (char)((uint)iVar1 >> 0x18);
LAB_0004f030:
  iVar1 = *piVar4;
  uVar2 = ordfloat_int_to_float2(*(undefined4 *)(intptr_t)(channel + iVar1 + 0xc));
  uVar2 = ordfloat_div(0x4a5a7a65,uVar2);
  channel = channel + iVar1;
  *(char *)(intptr_t)(channel + 0x10) = (char)uVar2;
  *(char *)(intptr_t)(channel + 0x11) = (char)((uint)uVar2 >> 8);
  *(char *)(intptr_t)(channel + 0x12) = (char)((uint)uVar2 >> 0x10);
  *(char *)(intptr_t)(channel + 0x13) = (char)((uint)uVar2 >> 0x18);
}


// was FUN_0004f0ac -- applies the MOD tracker's "vibrato" effect to channel param_2: looks up a
// sine value from the 32-entry DAT_00086810 table at the channel's vibrato position (+0x38), scales
// it by vibrato depth (+0x28)...
void apply_mod_vibrato_effect(char *player, int channel)
{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  uint uVar5;
  int *piVar6;
  int iVar7;

  piVar6 = (int *)(player + 0x10524);
  iVar7 = *piVar6;
  channel = channel * 0x40;
  iVar1 = channel + iVar7;
  iVar3 = (int)((uint)(byte)(&DAT_00086810)[*(int *)(intptr_t)(iVar1 + 0x38)] * *(int *)(intptr_t)(iVar1 + 0x28)) >> 7;
  if (*(int *)(intptr_t)(iVar1 + 0x3c) == 0) {
    uVar2 = ordfloat_int_to_float2(*(int *)(intptr_t)(iVar1 + 0xc) + iVar3);
    uVar2 = ordfloat_div(0x4a5a7a65,uVar2);
  }
  else {
    uVar2 = ordfloat_int_to_float2(*(int *)(intptr_t)(iVar1 + 0xc) - iVar3);
    uVar2 = ordfloat_div(0x4a5a7a65,uVar2);
  }
  iVar7 = channel + iVar7;
  *(char *)(intptr_t)(iVar7 + 0x10) = (char)uVar2;
  *(char *)(intptr_t)(iVar7 + 0x11) = (char)((uint)uVar2 >> 8);
  *(char *)(intptr_t)(iVar7 + 0x12) = (char)((uint)uVar2 >> 0x10);
  *(char *)(intptr_t)(iVar7 + 0x13) = (char)((uint)uVar2 >> 0x18);
  iVar3 = channel + *piVar6;
  iVar1 = *(int *)(intptr_t)(iVar3 + 0x24) + *(int *)(intptr_t)(iVar3 + 0x38);
  *(char *)(intptr_t)(iVar3 + 0x38) = (char)iVar1;
  *(char *)(intptr_t)(iVar3 + 0x39) = (char)((uint)iVar1 >> 8);
  *(char *)(intptr_t)(iVar3 + 0x3a) = (char)((uint)iVar1 >> 0x10);
  *(char *)(intptr_t)(iVar3 + 0x3b) = (char)((uint)iVar1 >> 0x18);
  iVar3 = channel + *piVar6;
  piVar4 = (int *)(intptr_t)(iVar3 + 0x38);
  if (0x1f < *piVar4) {
    iVar1 = *piVar4 + -0x20;
    *(char *)piVar4 = (char)iVar1;
    *(char *)(intptr_t)(iVar3 + 0x39) = (char)((uint)iVar1 >> 8);
    *(char *)(intptr_t)(iVar3 + 0x3a) = (char)((uint)iVar1 >> 0x10);
    *(char *)(intptr_t)(iVar3 + 0x3b) = (char)((uint)iVar1 >> 0x18);
    uVar5 = ~*(uint *)(intptr_t)(channel + *piVar6 + 0x3c);
    channel = channel + *piVar6;
    *(char *)(intptr_t)(channel + 0x3c) = (char)uVar5;
    *(char *)(intptr_t)(channel + 0x3d) = (char)(uVar5 >> 8);
    *(char *)(intptr_t)(channel + 0x3e) = (char)(uVar5 >> 0x10);
    *(char *)(intptr_t)(channel + 0x3f) = (char)(uVar5 >> 0x18);
  }
}



// was FUN_0004f2f0 -- applies the MOD tracker's "tremolo" effect to channel param_2: looks up a
// sine value from the same DAT_00086810 table at the channel's vibrato position (+0x38), scales it
// by tremolo depth (+0x30), and adds or subtracts it from the current volume (+0x14)...
void apply_mod_tremolo_effect(char *player, int channel)
{
  int iVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  uint uVar6;

  piVar5 = (int *)(player + 0x10524);
  channel = channel * 0x40;
  iVar1 = channel + *piVar5;
  iVar2 = (int)((uint)(byte)(&DAT_00086810)[*(int *)(intptr_t)(iVar1 + 0x38)] * *(int *)(intptr_t)(iVar1 + 0x30)) >> 6;
  iVar4 = *(int *)(intptr_t)(iVar1 + 0x14);
  if (*(int *)(intptr_t)(iVar1 + 0x3c) == 0) {
    if (0x40 < iVar4 + iVar2) {
      iVar2 = 0x40 - iVar4;
    }
  }
  else if (iVar4 - iVar2 < 0) {
    iVar2 = iVar4;
  }
  iVar4 = iVar4 + iVar2;
  iVar2 = channel + *piVar5;
  *(char *)(intptr_t)(iVar2 + 0x18) = (char)iVar4;
  *(char *)(intptr_t)(iVar2 + 0x19) = (char)((uint)iVar4 >> 8);
  *(char *)(intptr_t)(iVar2 + 0x1a) = (char)((uint)iVar4 >> 0x10);
  *(char *)(intptr_t)(iVar2 + 0x1b) = (char)((uint)iVar4 >> 0x18);
  iVar2 = channel + *piVar5;
  iVar4 = *(int *)(intptr_t)(iVar2 + 0x2c) + *(int *)(intptr_t)(iVar2 + 0x38);
  *(char *)(intptr_t)(iVar2 + 0x38) = (char)iVar4;
  *(char *)(intptr_t)(iVar2 + 0x39) = (char)((uint)iVar4 >> 8);
  *(char *)(intptr_t)(iVar2 + 0x3a) = (char)((uint)iVar4 >> 0x10);
  *(char *)(intptr_t)(iVar2 + 0x3b) = (char)((uint)iVar4 >> 0x18);
  iVar2 = channel + *piVar5;
  piVar3 = (int *)(intptr_t)(iVar2 + 0x38);
  if (0x1f < *piVar3) {
    iVar4 = *piVar3 + -0x20;
    *(char *)piVar3 = (char)iVar4;
    *(char *)(intptr_t)(iVar2 + 0x39) = (char)((uint)iVar4 >> 8);
    *(char *)(intptr_t)(iVar2 + 0x3a) = (char)((uint)iVar4 >> 0x10);
    *(char *)(intptr_t)(iVar2 + 0x3b) = (char)((uint)iVar4 >> 0x18);
    uVar6 = ~*(uint *)(intptr_t)(channel + *piVar5 + 0x3c);
    channel = channel + *piVar5;
    *(char *)(intptr_t)(channel + 0x3c) = (char)uVar6;
    *(char *)(intptr_t)(channel + 0x3d) = (char)(uVar6 >> 8);
    *(char *)(intptr_t)(channel + 0x3e) = (char)(uVar6 >> 0x10);
    *(char *)(intptr_t)(channel + 0x3f) = (char)(uVar6 >> 0x18);
  }
}


// was FUN_0004f4ec -- builds a 65-row (volume 0..0x40) x 256-column (signed sample byte) lookup
// table of pre-scaled int32 mix contributions: table[vol][sample] = round(sample * vol * scale /
// 64).
void build_mod_volume_sample_table(byte *table, int scale)
{
  char cVar1;
  int iVar2;
  undefined1 *puVar3;
  int iVar4;
  int iVar5;
  int iVar6;

  iVar5 = 0;
  do {
    iVar4 = 0;
    puVar3 = table;
    do {
      cVar1 = (char)iVar4;
      iVar4 = iVar4 + 1;
      iVar6 = cVar1 * iVar5 * scale;
      if (iVar6 < 0) {
        iVar6 = iVar6 + 0x3f;
      }
      iVar2 = iVar6 >> 6;
      puVar3[4] = (char)iVar2;
      puVar3[5] = (char)((uint)iVar2 >> 8);
      puVar3[6] = (char)((uint)iVar2 >> 0x10);
      puVar3[7] = (char)(iVar6 >> 0x1e);
      puVar3 = puVar3 + 4;
    } while (iVar4 < 0x100);
    iVar5 = iVar5 + 1;
    table = table + 0x400;
  } while (iVar5 < 0x41);
}


// was FUN_0004f858 -- queries whether SFX trigger slot param_2 is currently playing (reads its
// "playing" flag at +0x10410 directly, same field start_sfx_trigger_slot sets and
// stop_sfx_trigger_slot clears).
byte is_sfx_trigger_slot_active(void *player_ptr, int slot)
{
  char *player = (char *)player_ptr;
  return *(undefined1 *)(slot * 0xd + player + 0x10410);
}


// was FUN_0004f560 -- reads a big-endian 16-bit word count from the MOD file buffer (param_2+4) at
// the cursor position *param_3, advances the cursor by 2, and returns the count doubled to a byte
// count.
int read_mod_word_length_field(void *unused, char *file, int *cursor)
{
  byte bVar1;
  int iVar2;

  iVar2 = *cursor;
  *cursor = iVar2 + 1;
  bVar1 = *(byte *)(intptr_t)(*(int *)(file + 4) + iVar2);
  *cursor = iVar2 + 2;
  return ((uint)*(byte *)(intptr_t)(*(int *)(file + 4) + iVar2 + 1) + (uint)bVar1 * 0x100) * 2;
}



// was FUN_0004f594 -- arms one-shot SFX trigger slot param_3 (of 16, each a 13-byte record at
// player+0x10404+slot*0xd) with the sample data pointer+length from loaded wave handle param_2's
// fields +0x12/+0x16...
bool arm_sfx_trigger_slot(void *player_ptr, char *sample_slot, int trigger_slot)
{
  char *player = (char *)player_ptr;
  undefined4 uVar1;
  int iVar2;
  bool bVar3;

  iVar2 = (int)(intptr_t)(trigger_slot * 0xd + player);
  if (*(char *)(intptr_t)(iVar2 + 0x10410) != '\0') {
    stop_sfx_trigger_slot(player,trigger_slot);
  }
  bVar3 = *(int *)(sample_slot + 0x12) != 0;
  if (bVar3) {
    *(char *)(intptr_t)(iVar2 + 0x10410) = '\0';
    *(undefined1 *)(intptr_t)(iVar2 + 0x10408) = 0;
    *(undefined1 *)(intptr_t)(iVar2 + 0x10409) = 0;
    *(undefined1 *)(intptr_t)(iVar2 + 0x1040a) = 0;
    *(undefined1 *)(intptr_t)(iVar2 + 0x1040b) = 0;
    uVar1 = *(undefined4 *)(sample_slot + 0x12);
    *(char *)(intptr_t)(iVar2 + 0x10404) = (char)uVar1;
    *(char *)(intptr_t)(iVar2 + 0x10405) = (char)((uint)uVar1 >> 8);
    *(char *)(intptr_t)(iVar2 + 0x10406) = (char)((uint)uVar1 >> 0x10);
    *(char *)(intptr_t)(iVar2 + 0x10407) = (char)((uint)uVar1 >> 0x18);
    uVar1 = *(undefined4 *)(sample_slot + 0x16);
    *(char *)(intptr_t)(iVar2 + 0x1040c) = (char)uVar1;
    *(char *)(intptr_t)(iVar2 + 0x1040d) = (char)((uint)uVar1 >> 8);
    *(char *)(intptr_t)(iVar2 + 0x1040e) = (char)((uint)uVar1 >> 0x10);
    *(char *)(intptr_t)(iVar2 + 0x1040f) = (char)((uint)uVar1 >> 0x18);
  }
  return bVar3;
}



// was FUN_0004f6b0 -- starts SFX trigger slot param_2 playing: resets its position (+0x10408) to 0
// and sets the "playing" flag (+0x10410) -- the counterpart to arm_sfx_trigger_slot, which loads
// the sample data but leaves this flag cleared.
int start_sfx_trigger_slot(void *player_ptr, int slot)
{
  char *player = (char *)player_ptr;
  undefined4 uVar1;

  player = slot * 0xd + player;
  if ((*(int *)(player + 0x10404) == 0) || (0xf < slot)) {
    uVar1 = 0;
  }
  else {
    *(undefined1 *)(player + 0x10408) = 0;
    *(undefined1 *)(player + 0x10409) = 0;
    *(undefined1 *)(player + 0x1040a) = 0;
    *(undefined1 *)(player + 0x1040b) = 0;
    *(undefined1 *)(player + 0x10410) = 1;
    uVar1 = 1;
  }
  return uVar1;
}



// was FUN_0004f748 -- stops SFX trigger slot param_2: clears its "playing" flag (+0x10410) and
// resets its position (+0x10408) to 0, but leaves the armed sample pointer/length
// (+0x10404/+0x1040c) intact so arm_sfx_trigger_slot can detect and cancel a still-armed...
int stop_sfx_trigger_slot(void *player_ptr, int slot)
{
  char *player = (char *)player_ptr;
  undefined4 uVar1;

  player = slot * 0xd + player;
  if ((*(int *)(player + 0x10404) == 0) || (0xf < slot)) {
    uVar1 = 0;
  }
  else {
    *(undefined1 *)(player + 0x10410) = 0;
    *(undefined1 *)(player + 0x10408) = 0;
    uVar1 = 1;
    *(undefined1 *)(player + 0x10409) = 0;
    *(undefined1 *)(player + 0x1040a) = 0;
    *(undefined1 *)(player + 0x1040b) = 0;
  }
  return uVar1;
}


// was FUN_0004f7e0 -- one-time startup entry point for the hardware sound-channel slot pool:
// initializes all 16 slots now (init_all_sound_channel_slots) and registers their teardown to run
// automatically at exit.
//
// INVESTIGATED (positional SFX cluster): this function -- and
// therefore init_all_sound_channel_slots/release_all_sound_channel_slots
// below it -- has ZERO call sites anywhere in this project (confirmed
// by grepping every src/*.c and header for its name, and for the raw
// FUN_0004f7e0 in case it survives un-renamed somewhere not yet
// extracted: no hits at all). This whole 16-"hardware slot" pool is
// completely orphaned dead code in the current decompile, independent
// of DAT_0023c3b8/DAT_00087450 ever being real -- the same
// "intentionally dead, nothing calls it" category as DAT_0023c3b8
// itself staying NULL by design. It is NOT the same pool as
// platform_sfx.c's own internal 16-voice mixer array (that one is a
// private implementation detail of the real backend; this one is
// unused decompiled bookkeeping for the 0x1a-byte slot records at
// DAT_00202a58) -- don't conflate them. Left completely untouched: no
// live caller depends on it being correct, so there's nothing to wire
// into platform_sfx here.
void register_sound_channel_pool_cleanup()

{
  init_all_sound_channel_slots();
  register_default_atexit_handler(release_all_sound_channel_slots);
  return;
}



// was FUN_0004f7f0 -- initializes all 16 hardware sound-channel slots
// (0x1a/26-byte records starting at the shared scratch buffer
// DAT_00202a58) via init_sound_channel_slot.
void init_all_sound_channel_slots()

{
  undefined *puVar1;
  int iVar2;

  puVar1 = &DAT_00202a58;
  iVar2 = 0x10;
  do {
    init_sound_channel_slot(puVar1);
    iVar2 = iVar2 + -1;
    puVar1 = puVar1 + 0x1a;
  } while (iVar2 != 0);
  return;
}



// was FUN_0004f828 -- releases all 16 hardware sound-channel slots in reverse order via
// release_sound_channel_slot; DAT_00202bf8 is confirmed...
void release_all_sound_channel_slots()

{
  undefined1 *puVar1;
  int iVar2;

  iVar2 = 0x10;
  puVar1 = &DAT_00202bf8;
  do {
    puVar1 = puVar1 + -0x1a;
    release_sound_channel_slot(puVar1);
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}






// was FUN_0004f874 -- generic growable-array resize for 16-byte, zero-initializable elements (grows
// via cpp_operator_new/realloc-style copy, zero-fills new slots via
// construct_mod_event_array_range's ce_memset memset).
void resize_mod_event_row_array(char *array, int new_size, int growth)
{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;

  if (growth != -1) {
    *(int *)(array + 0x10) = growth;
  }
  if (new_size == 0) {
    new_size = 0;
    if (*(int *)(array + 4) != 0) {
      cpp_operator_delete((void *)(intptr_t)(*(int *)(array + 4)));
      *(undefined4 *)(array + 4) = 0;
    }
  }
  else {
    if (*(int *)(array + 4) != 0) {
      if (*(int *)(array + 0xc) < new_size) {
        iVar2 = *(int *)(array + 0x10);
        if (*(int *)(array + 0x10) == 0) {
          iVar2 = *(int *)(array + 8);
          if (iVar2 < 0) {
            iVar2 = iVar2 + 7;
          }
          iVar2 = iVar2 >> 3;
          bVar6 = SBORROW4(iVar2,4);
          iVar3 = iVar2 + -4;
          bVar5 = iVar2 == 4;
          if (iVar2 < 4) {
            iVar2 = 4;
            iVar4 = new_size;
          }
          else {
            iVar4 = 0x400;
            bVar6 = SBORROW4(iVar2,0x400);
            iVar3 = iVar2 + -0x400;
            bVar5 = iVar2 == 0x400;
          }
          if (!bVar5 && iVar3 < 0 == bVar6) {
            iVar2 = iVar4;
          }
        }
        iVar2 = *(int *)(array + 0xc) + iVar2;
        if (iVar2 <= new_size) {
          iVar2 = new_size;
        }
        iVar3 = (int)(intptr_t)cpp_operator_new(iVar2 << 4);
        ce_memmove((void *)(intptr_t)(iVar3),(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) << 4);
        construct_mod_event_array_range((void *)(intptr_t)(iVar3 + *(int *)(array + 8) * 0x10),new_size - *(int *)(array + 8));
        cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
        *(int *)(array + 4) = iVar3;
        *(int *)(array + 0xc) = iVar2;
      }
      else {
        iVar2 = *(int *)(array + 8);
        if (iVar2 < new_size) {
          construct_mod_event_array_range((void *)(intptr_t)(*(int *)(array + 4) + iVar2 * 0x10),new_size - iVar2);
        }
      }
      goto LAB_0004f994;
    }
    uVar1 = (int)(intptr_t)cpp_operator_new(new_size << 4);
    *(undefined4 *)(array + 4) = uVar1;
    construct_mod_event_array_range((void *)(intptr_t)(uVar1),new_size);
  }
  *(int *)(array + 0xc) = new_size;
LAB_0004f994:
  *(int *)(array + 8) = new_size;
}


// was FUN_0004f9a0 -- generic growable-array resize for 20-byte elements with real
// construct/destruct lifecycle (construct_mod_row_array_range on grow, destroy_mod_row_array_range
// on shrink/clear).
void resize_mod_pattern_row_array(char *array, int new_size, int growth)
{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;

  if (growth != -1) {
    *(int *)(array + 0x10) = growth;
  }
  if (new_size == 0) {
    new_size = 0;
    if (*(int *)(array + 4) != 0) {
      destroy_mod_row_array_range((char *)(intptr_t)(*(int *)(array + 4)),*(undefined4 *)(array + 8));
      cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
      *(undefined4 *)(array + 4) = 0;
    }
  }
  else {
    iVar4 = *(int *)(array + 4);
    if (iVar4 != 0) {
      if (*(int *)(array + 0xc) < new_size) {
        iVar4 = *(int *)(array + 0x10);
        if (*(int *)(array + 0x10) == 0) {
          iVar4 = *(int *)(array + 8);
          if (iVar4 < 0) {
            iVar4 = iVar4 + 7;
          }
          iVar4 = iVar4 >> 3;
          bVar6 = SBORROW4(iVar4,4);
          iVar2 = iVar4 + -4;
          bVar5 = iVar4 == 4;
          if (iVar4 < 4) {
            iVar4 = 4;
            iVar3 = new_size;
          }
          else {
            iVar3 = 0x400;
            bVar6 = SBORROW4(iVar4,0x400);
            iVar2 = iVar4 + -0x400;
            bVar5 = iVar4 == 0x400;
          }
          if (!bVar5 && iVar2 < 0 == bVar6) {
            iVar4 = iVar3;
          }
        }
        iVar4 = *(int *)(array + 0xc) + iVar4;
        if (iVar4 <= new_size) {
          iVar4 = new_size;
        }
        iVar2 = (int)(intptr_t)cpp_operator_new(iVar4 * 0x14);
        ce_memmove((void *)(intptr_t)(iVar2),(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) * 0x14);
        construct_mod_row_array_range((char *)(intptr_t)(*(int *)(array + 8) * 0x14 + iVar2),new_size - *(int *)(array + 8));
        cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
        *(int *)(array + 4) = iVar2;
        *(int *)(array + 0xc) = iVar4;
      }
      else {
        iVar2 = *(int *)(array + 8);
        if (iVar2 < new_size) {
          construct_mod_row_array_range((char *)(intptr_t)(iVar2 * 0x14 + iVar4),new_size - iVar2);
        }
        else if (new_size < iVar2) {
          destroy_mod_row_array_range((char *)(intptr_t)(new_size * 0x14 + iVar4),iVar2 - new_size);
        }
      }
      goto LAB_0004faec;
    }
    uVar1 = (int)(intptr_t)cpp_operator_new(new_size * 0x14);
    *(undefined4 *)(array + 4) = uVar1;
    construct_mod_row_array_range((char *)(intptr_t)(uVar1),new_size);
  }
  *(int *)(array + 0xc) = new_size;
LAB_0004faec:
  *(int *)(array + 8) = new_size;
}



// was FUN_0004faf4 -- default-constructs one empty dynamic-array instance in place: zeroes the
// array header (data pointer, count, capacity, growth-hint at +4/+8/+0xc/+0x10) and resets a
// leading 4-byte tag immediately before it to its default state.
void init_mod_dynamic_array(byte *array)
{
  *array = 8;
  array[1] = 0x30;
  *(undefined4 *)(array + 4) = 0;
  *(undefined4 *)(array + 0x10) = 0;
  array[2] = 8;
  *(undefined4 *)(array + 0xc) = 0;
  *(undefined4 *)(array + 8) = 0;
  array[3] = 0;
}



// was FUN_0004fb38 -- generic growable-array resize for plain 4-byte (int) elements: no
// construct/destruct step, new slots are just zero-filled (construct_mod_int_array_range ->
// memset).
void resize_mod_int_array(char *array, int new_size, int growth)
{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;

  if (growth != -1) {
    *(int *)(array + 0x10) = growth;
  }
  if (new_size == 0) {
    new_size = 0;
    if (*(int *)(array + 4) != 0) {
      cpp_operator_delete((void *)(intptr_t)(*(int *)(array + 4)));
      *(undefined4 *)(array + 4) = 0;
    }
  }
  else {
    if (*(int *)(array + 4) != 0) {
      if (*(int *)(array + 0xc) < new_size) {
        iVar2 = *(int *)(array + 0x10);
        if (*(int *)(array + 0x10) == 0) {
          iVar2 = *(int *)(array + 8);
          if (iVar2 < 0) {
            iVar2 = iVar2 + 7;
          }
          iVar2 = iVar2 >> 3;
          bVar6 = SBORROW4(iVar2,4);
          iVar3 = iVar2 + -4;
          bVar5 = iVar2 == 4;
          if (iVar2 < 4) {
            iVar2 = 4;
            iVar4 = new_size;
          }
          else {
            iVar4 = 0x400;
            bVar6 = SBORROW4(iVar2,0x400);
            iVar3 = iVar2 + -0x400;
            bVar5 = iVar2 == 0x400;
          }
          if (!bVar5 && iVar3 < 0 == bVar6) {
            iVar2 = iVar4;
          }
        }
        iVar2 = *(int *)(array + 0xc) + iVar2;
        if (iVar2 <= new_size) {
          iVar2 = new_size;
        }
        iVar3 = (int)(intptr_t)cpp_operator_new(iVar2 << 2);
        ce_memmove((void *)(intptr_t)(iVar3),(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) << 2);
        construct_mod_int_array_range((void *)(intptr_t)(iVar3 + *(int *)(array + 8) * 4),new_size - *(int *)(array + 8));
        cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
        *(int *)(array + 4) = iVar3;
        *(int *)(array + 0xc) = iVar2;
      }
      else {
        iVar2 = *(int *)(array + 8);
        if (iVar2 < new_size) {
          construct_mod_int_array_range((void *)(intptr_t)(*(int *)(array + 4) + iVar2 * 4),new_size - iVar2);
        }
      }
      goto LAB_0004fc58;
    }
    uVar1 = (int)(intptr_t)cpp_operator_new(new_size << 2);
    *(undefined4 *)(array + 4) = uVar1;
    construct_mod_int_array_range((void *)(intptr_t)(uVar1),new_size);
  }
  *(int *)(array + 0xc) = new_size;
LAB_0004fc58:
  *(int *)(array + 8) = new_size;
}


// was FUN_0004fc64 -- destroys one dynamic-array instance: frees its data buffer (if allocated) and
// resets it to the empty/closed tag state.
void destroy_mod_dynamic_array(byte *array)
{
  *array = 8;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
  if (*(int *)(array + 4) != 0) {
    cpp_operator_delete((void *)(intptr_t)(*(int *)(array + 4)));
  }
  *array = 0x20;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
}



// was FUN_0004fcd4 -- resets a dynamic-array instance to its empty/ closed tag state (without
// touching/freeing its data buffer) and, if param_2's low bit is set, frees the struct itself...
byte *reset_mod_dynamic_array_and_maybe_free(byte *array, uint delete_flags)
{
  *array = 0x20;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(array);
  }
  return array;
}



// was FUN_0004fd18 -- MFC CArchive-style serialize for a resize_mod_int_array-managed array:
// param_2's +0x14 bit 0 matches CArchive::IsLoading()'s flag convention.
void serialize_mod_int_array(char *array, char *archive)
{
  undefined4 uVar1;
  uint uVar2;
  undefined4 unaff_lr;

  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2588(archive,*(undefined4 *)(array + 8));
  }
  else {
    uVar1 = ordaudio_op_2142(archive);
    resize_mod_int_array(array,uVar1,0xffffffff);
  }
  uVar2 = *(uint *)(archive + 0x14) & 1;
  if (uVar2 == 0) {
    ordaudio_op_2582();
  }
  else {
    ordaudio_op_2135(archive,(const void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) << 2,uVar2,unaff_lr);
  }
}



// was FUN_0004fd68 -- constructs the top-level "array of patterns" header in place (tag 0x38,
// zeroed count/capacity/growth-hint).
void init_mod_pattern_array(byte *array)
{
  *array = 0x38;
  array[1] = 0x30;
  *(undefined4 *)(array + 4) = 0;
  *(undefined4 *)(array + 0x10) = 0;
  array[2] = 8;
  *(undefined4 *)(array + 0xc) = 0;
  *(undefined4 *)(array + 8) = 0;
  array[3] = 0;
}



// was FUN_0004fda4 -- resizes the top-level "array of patterns": each 20-byte element is itself a
// nested resize_mod_pattern_row_array- style header for one pattern's rows...
void resize_mod_pattern_array(char *array, int new_size, int growth)
{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;

  if (growth != -1) {
    *(int *)(array + 0x10) = growth;
  }
  if (new_size == 0) {
    new_size = 0;
    if (*(int *)(array + 4) != 0) {
      destroy_mod_pattern_array_range((char *)(intptr_t)(*(int *)(array + 4)),*(undefined4 *)(array + 8));
      cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
      *(undefined4 *)(array + 4) = 0;
    }
  }
  else {
    iVar4 = *(int *)(array + 4);
    if (iVar4 != 0) {
      if (*(int *)(array + 0xc) < new_size) {
        iVar4 = *(int *)(array + 0x10);
        if (*(int *)(array + 0x10) == 0) {
          iVar4 = *(int *)(array + 8);
          if (iVar4 < 0) {
            iVar4 = iVar4 + 7;
          }
          iVar4 = iVar4 >> 3;
          bVar6 = SBORROW4(iVar4,4);
          iVar2 = iVar4 + -4;
          bVar5 = iVar4 == 4;
          if (iVar4 < 4) {
            iVar4 = 4;
            iVar3 = new_size;
          }
          else {
            iVar3 = 0x400;
            bVar6 = SBORROW4(iVar4,0x400);
            iVar2 = iVar4 + -0x400;
            bVar5 = iVar4 == 0x400;
          }
          if (!bVar5 && iVar2 < 0 == bVar6) {
            iVar4 = iVar3;
          }
        }
        iVar4 = *(int *)(array + 0xc) + iVar4;
        if (iVar4 <= new_size) {
          iVar4 = new_size;
        }
        iVar2 = (int)(intptr_t)cpp_operator_new(iVar4 * 0x14);
        ce_memmove((void *)(intptr_t)(iVar2),(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) * 0x14);
        construct_mod_pattern_array_range((char *)(intptr_t)(*(int *)(array + 8) * 0x14 + iVar2),new_size - *(int *)(array + 8));
        cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
        *(int *)(array + 4) = iVar2;
        *(int *)(array + 0xc) = iVar4;
      }
      else {
        iVar2 = *(int *)(array + 8);
        if (iVar2 < new_size) {
          construct_mod_pattern_array_range((char *)(intptr_t)(iVar2 * 0x14 + iVar4),new_size - iVar2);
        }
        else if (new_size < iVar2) {
          destroy_mod_pattern_array_range((char *)(intptr_t)(new_size * 0x14 + iVar4),iVar2 - new_size);
        }
      }
      goto LAB_0004fef0;
    }
    uVar1 = (int)(intptr_t)cpp_operator_new(new_size * 0x14);
    *(undefined4 *)(array + 4) = uVar1;
    construct_mod_pattern_array_range((char *)(intptr_t)(uVar1),new_size);
  }
  *(int *)(array + 0xc) = new_size;
LAB_0004fef0:
  *(int *)(array + 8) = new_size;
}


// was FUN_0004fef8 -- destroys the top-level "array of patterns" in place: frees each pattern's own
// nested row-array (destroy_mod_pattern_array_range, the same destroy-range callback
// resize_mod_pattern_array uses) then the outer buffer, and resets the tag to closed.
void destroy_mod_pattern_array(byte *array)
{
  *array = 0x38;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
  if (*(int *)(array + 4) != 0) {
    destroy_mod_pattern_array_range((char *)(intptr_t)(*(int *)(array + 4)),*(undefined4 *)(array + 8));
    cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
  }
  *array = 0x20;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
}



// was FUN_0004ff68 -- MFC CArchive-style serialize for the top-level "array of patterns" (loading
// resizes via resize_mod_pattern_array, storing writes via still-unnamed write_mod_pattern_array).
void serialize_mod_pattern_array(char *array, char *archive)
{
  undefined4 uVar1;

  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2588(archive,*(undefined4 *)(array + 8));
  }
  else {
    uVar1 = ordaudio_op_2142(archive);
    resize_mod_pattern_array(array,uVar1,0xffffffff);
  }
  write_mod_pattern_array(archive,(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(undefined4 *)(array + 8));
}



// was FUN_0004ffb8 -- constructs the MOD instrument/sample-descriptor array header in place (tag
// 0x50).
void init_mod_instrument_array(byte *array)
{
  *array = 0x50;
  array[1] = 0x30;
  *(undefined4 *)(array + 4) = 0;
  *(undefined4 *)(array + 0x10) = 0;
  array[2] = 8;
  *(undefined4 *)(array + 0xc) = 0;
  *(undefined4 *)(array + 8) = 0;
  array[3] = 0;
}



// was FUN_0004fff4 -- resizes the MOD instrument/sample-descriptor
// array (48-byte elements, construct/destruct via construct_mod_instrument_array_range/
// destroy_mod_instrument_array_range). The matching constructor is init_mod_instrument_array.
void resize_mod_instrument_array(char *array, int new_size, int growth)
{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (growth != -1) {
    *(int *)(array + 0x10) = growth;
  }
  if (new_size == 0) {
    new_size = 0;
    if (*(int *)(array + 4) != 0) {
      destroy_mod_instrument_array_range((char *)(intptr_t)(*(int *)(array + 4)),*(undefined4 *)(array + 8));
      cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
      *(undefined4 *)(array + 4) = 0;
    }
  }
  else {
    iVar4 = *(int *)(array + 4);
    if (iVar4 != 0) {
      if (*(int *)(array + 0xc) < new_size) {
        iVar4 = *(int *)(array + 0x10);
        if (*(int *)(array + 0x10) == 0) {
          iVar4 = *(int *)(array + 8);
          if (iVar4 < 0) {
            iVar4 = iVar4 + 7;
          }
          iVar4 = iVar4 >> 3;
          bVar6 = SBORROW4(iVar4,4);
          iVar2 = iVar4 + -4;
          bVar5 = iVar4 == 4;
          if (iVar4 < 4) {
            iVar4 = 4;
            iVar3 = new_size;
          }
          else {
            iVar3 = 0x400;
            bVar6 = SBORROW4(iVar4,0x400);
            iVar2 = iVar4 + -0x400;
            bVar5 = iVar4 == 0x400;
          }
          if (!bVar5 && iVar2 < 0 == bVar6) {
            iVar4 = iVar3;
          }
        }
        iVar4 = *(int *)(array + 0xc) + iVar4;
        if (iVar4 <= new_size) {
          iVar4 = new_size;
        }
        iVar2 = (int)(intptr_t)cpp_operator_new(iVar4 * 0x30);
        ce_memmove((void *)(intptr_t)(iVar2),(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) * 0x30);
        construct_mod_instrument_array_range((char *)(intptr_t)(*(int *)(array + 8) * 0x30 + iVar2),new_size - *(int *)(array + 8));
        cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
        *(int *)(array + 4) = iVar2;
        *(int *)(array + 0xc) = iVar4;
      }
      else {
        iVar2 = *(int *)(array + 8);
        if (iVar2 < new_size) {
          construct_mod_instrument_array_range((char *)(intptr_t)(iVar2 * 0x30 + iVar4),new_size - iVar2);
        }
        else if (new_size < iVar2) {
          destroy_mod_instrument_array_range((char *)(intptr_t)(new_size * 0x30 + iVar4),iVar2 - new_size);
        }
      }
      goto LAB_00050140;
    }
    uVar1 = (int)(intptr_t)cpp_operator_new(new_size * 0x30);
    *(undefined4 *)(array + 4) = uVar1;
    construct_mod_instrument_array_range((char *)(intptr_t)(uVar1),new_size);
  }
  *(int *)(array + 0xc) = new_size;
LAB_00050140:
  *(int *)(array + 8) = new_size;
}



// was FUN_00050148 -- destroys the MOD instrument/sample-descriptor array in place: frees each
// element via the destroy-range callback destroy_mod_instrument_array_range (same one
// resize_mod_instrument_array uses), then the outer buffer, and resets the tag to closed.
void destroy_mod_instrument_array(byte *array)
{
  *array = 0x50;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
  if (*(int *)(array + 4) != 0) {
    destroy_mod_instrument_array_range((char *)(intptr_t)(*(int *)(array + 4)),*(undefined4 *)(array + 8));
    cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
  }
  *array = 0x20;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
}



// was FUN_000501b8 -- MFC CArchive-style serialize for the MOD instrument/sample-descriptor array
// (loading resizes via resize_mod_instrument_array, storing writes via still-unnamed
// write_mod_instrument_array).
void serialize_mod_instrument_array(char *array, char *archive)
{
  undefined4 uVar1;

  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2588(archive,*(undefined4 *)(array + 8));
  }
  else {
    uVar1 = ordaudio_op_2142(archive);
    resize_mod_instrument_array(array,uVar1,0xffffffff);
  }
  write_mod_instrument_array(archive,(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(undefined4 *)(array + 8));
}



// was FUN_00050208 -- constructs the MOD channel runtime-state array header in place (tag 0x68).
void init_mod_channel_state_array(byte *array)
{
  *array = 0x68;
  array[1] = 0x30;
  *(undefined4 *)(array + 4) = 0;
  *(undefined4 *)(array + 0x10) = 0;
  array[2] = 8;
  *(undefined4 *)(array + 0xc) = 0;
  *(undefined4 *)(array + 8) = 0;
  array[3] = 0;
}



// was FUN_00050244 -- resizes the MOD channel runtime-state array (64-byte elements, no element
// construct/destruct -- new slots are just zero-filled via
// construct_mod_channel_state_array_range).
void resize_mod_channel_state_array(char *array, int new_size, int growth)
{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  if (growth != -1) {
    *(int *)(array + 0x10) = growth;
  }
  if (new_size == 0) {
    new_size = 0;
    if (*(int *)(array + 4) != 0) {
      cpp_operator_delete((void *)(intptr_t)(*(int *)(array + 4)));
      *(undefined4 *)(array + 4) = 0;
    }
  }
  else {
    if (*(int *)(array + 4) != 0) {
      if (*(int *)(array + 0xc) < new_size) {
        iVar2 = *(int *)(array + 0x10);
        if (*(int *)(array + 0x10) == 0) {
          iVar2 = *(int *)(array + 8);
          if (iVar2 < 0) {
            iVar2 = iVar2 + 7;
          }
          iVar2 = iVar2 >> 3;
          bVar6 = SBORROW4(iVar2,4);
          iVar3 = iVar2 + -4;
          bVar5 = iVar2 == 4;
          if (iVar2 < 4) {
            iVar2 = 4;
            iVar4 = new_size;
          }
          else {
            iVar4 = 0x400;
            bVar6 = SBORROW4(iVar2,0x400);
            iVar3 = iVar2 + -0x400;
            bVar5 = iVar2 == 0x400;
          }
          if (!bVar5 && iVar3 < 0 == bVar6) {
            iVar2 = iVar4;
          }
        }
        iVar2 = *(int *)(array + 0xc) + iVar2;
        if (iVar2 <= new_size) {
          iVar2 = new_size;
        }
        iVar3 = (int)(intptr_t)cpp_operator_new(iVar2 << 6);
        ce_memmove((void *)(intptr_t)(iVar3),(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) << 6);
        construct_mod_channel_state_array_range((void *)(intptr_t)(iVar3 + *(int *)(array + 8) * 0x40),new_size - *(int *)(array + 8));
        cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(array + 4)));
        *(int *)(array + 4) = iVar3;
        *(int *)(array + 0xc) = iVar2;
      }
      else {
        iVar2 = *(int *)(array + 8);
        if (iVar2 < new_size) {
          construct_mod_channel_state_array_range((void *)(intptr_t)(*(int *)(array + 4) + iVar2 * 0x40),new_size - iVar2);
        }
      }
      goto LAB_00050364;
    }
    uVar1 = (int)(intptr_t)cpp_operator_new(new_size << 6);
    *(undefined4 *)(array + 4) = uVar1;
    construct_mod_channel_state_array_range((void *)(intptr_t)(uVar1),new_size);
  }
  *(int *)(array + 0xc) = new_size;
LAB_00050364:
  *(int *)(array + 8) = new_size;
}



// was FUN_00050370 -- destroys the MOD channel runtime-state array in place: frees the raw buffer
// (no per-element destructor, matching resize_mod_channel_state_array's plain zero-fill
// constructor) and resets the tag to closed.
void destroy_mod_channel_state_array(byte *array)
{
  *array = 0x68;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
  if (*(int *)(array + 4) != 0) {
    cpp_operator_delete((void *)(intptr_t)(*(int *)(array + 4)));
  }
  *array = 0x20;
  array[1] = 0x30;
  array[2] = 8;
  array[3] = 0;
}



// was FUN_000503e0 -- MFC CArchive-style serialize for the MOD channel runtime-state array (loading
// resizes via resize_mod_channel_state_array, storing writes the raw 64-byte elements directly via
// ordaudio_op_2135).
void serialize_mod_channel_state_array(char *array, char *archive)
{
  undefined4 uVar1;
  uint uVar2;
  undefined4 unaff_lr;

  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2588(archive,*(undefined4 *)(array + 8));
  }
  else {
    uVar1 = ordaudio_op_2142(archive);
    resize_mod_channel_state_array(array,uVar1,0xffffffff);
  }
  uVar2 = *(uint *)(archive + 0x14) & 1;
  if (uVar2 == 0) {
    ordaudio_op_2582();
  }
  else {
    ordaudio_op_2135(archive,(const void *)(intptr_t)(*(undefined4 *)(array + 4)),*(int *)(array + 8) << 6,uVar2,unaff_lr);
  }
}



// was FUN_00050430 -- MSVC-style "scalar deleting destructor" for the int-array type: destroys the
// array in place then, if param_2's low bit is set, frees the struct itself. BUG FIX: was
// `destroy_mod_dynamic_array();` -- a dropped argument.
void *destroy_mod_dynamic_array_and_maybe_free(char *array, uint delete_flags)
{
  destroy_mod_dynamic_array(array);
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(array);
  }
  return array;
}



// was FUN_00050454 -- "scalar deleting destructor" for the top-level pattern-array type (see
// destroy_mod_dynamic_array_and_maybe_free). BUG FIX: was `destroy_mod_pattern_array();`
// (destroy_mod_pattern_array) -- the same dropped-argument bug, same fix (pass param_1).
void *destroy_mod_pattern_array_and_maybe_free(char *array, uint delete_flags)
{
  destroy_mod_pattern_array(array);
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(array);
  }
  return array;
}



// was FUN_00050478 -- "scalar deleting destructor" for the MOD instrument/sample-descriptor array
// type (see destroy_mod_dynamic_array_and_maybe_free).
void *destroy_mod_instrument_array_and_maybe_free(char *array, uint delete_flags)
{
  destroy_mod_instrument_array(array);
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(array);
  }
  return array;
}



// was FUN_0005049c -- "scalar deleting destructor" for the MOD channel runtime-state array type
// (see destroy_mod_dynamic_array_and_maybe_free). BUG FIX: was `destroy_mod_channel_state_array();`
// (destroy_mod_channel_state_array) -- the same dropped-argument bug, same fix (pass param_1).
void *destroy_mod_channel_state_array_and_maybe_free(char *array, uint delete_flags)
{
  destroy_mod_channel_state_array(array);
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(array);
  }
  return array;
}


// was FUN_000504c0 -- zero-fills param_2 16-byte "event" elements in
// one memset. The construct-range callback resize_mod_event_row_array
// passes to ce_memmove/its grow path.
void construct_mod_event_array_range(void *elements, int count)
{
  ce_memset(elements,0,count << 4);
}



// was FUN_000504cc -- destroys param_2 20-byte "row" elements (each a nested event-array header,
// destroyed via destroy_mod_row_array_elem).
void destroy_mod_row_array_range(char *elements, int count)
{
  for (; count != 0; count = count + -1) {
    destroy_mod_row_array_elem(elements);
    elements = elements + 0x14;
  }
}



// was FUN_000504fc -- destroys one "row" element in place: frees its nested event-array buffer (if
// allocated) and resets the tag to closed. The per-element destructor
// resize_mod_pattern_row_array's destroy-range (destroy_mod_row_array_range) calls for each row.
void destroy_mod_row_array_elem(byte *element)
{
  *element = 0x80;
  element[1] = 0x30;
  element[2] = 8;
  element[3] = 0;
  if (*(int *)(element + 4) != 0) {
    cpp_operator_delete((void *)(intptr_t)(*(int *)(element + 4)));
  }
  *element = 0x20;
  element[1] = 0x30;
  element[2] = 8;
  element[3] = 0;
}



// was FUN_0005056c -- MFC CArchive-style serialize for the event-row
// array (16-byte elements, one row's channel events): loading resizes
// via resize_mod_event_row_array, storing writes via write_mod_event_array.
void serialize_mod_event_row_array(char *array, char *archive)
{
  undefined4 uVar1;

  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2588(archive,*(undefined4 *)(array + 8));
  }
  else {
    uVar1 = ordaudio_op_2142(archive);
    resize_mod_event_row_array(array,uVar1,0xffffffff);
  }
  write_mod_event_array(archive,(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(undefined4 *)(array + 8));
}



// was FUN_000505bc -- "scalar deleting destructor" for the "row" element type (see
// destroy_mod_dynamic_array_and_maybe_free).
void *destroy_mod_row_array_elem_and_maybe_free(char *element, uint delete_flags)
{
  destroy_mod_row_array_elem(element);
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(element);
  }
  return element;
}



// was FUN_000505e0 -- MFC CArchive write helper for the event-array (16-byte elements): writes
// param_3 elements of param_2 via ordaudio_op_2135 if storing, else asserts/no-ops
// (ordaudio_op_2582)...
void write_mod_event_array(char *archive, void *elements, int count)
{
  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2582();
  }
  else {
    ordaudio_op_2135(archive,elements,count << 4);
  }
}



// was FUN_00050604 -- zero-fills param_2 20-byte "row" elements then
// default-constructs each one (construct_mod_row_array_elem). The
// construct-range callback resize_mod_pattern_row_array uses on grow.
void construct_mod_row_array_range(char *elements, int count)
{
  ce_memset(elements,0,count * 0x14);
  for (; count != 0; count = count + -1) {
    if (elements != 0) {
      construct_mod_row_array_elem(elements);
    }
    elements = elements + 0x14;
  }
}



// was FUN_00050648 -- zero-fills param_2 plain int elements in one
// memset. The construct-range callback resize_mod_int_array passes
// on grow/shrink.
void construct_mod_int_array_range(void *elements, int count)
{
  ce_memset(elements,0,count << 2);
}



// was FUN_00050678 -- destroys param_2 20-byte "pattern" elements (each a nested row-array header,
// destroyed via destroy_mod_pattern_array_elem).
void destroy_mod_pattern_array_range(char *elements, int count)
{
  for (; count != 0; count = count + -1) {
    destroy_mod_pattern_array_elem(elements);
    elements = elements + 0x14;
  }
}



// was FUN_000506a8 -- destroys one "pattern" element in place: frees its nested row array
// (destroy_mod_row_array_range, same callback resize_mod_pattern_row_array's destructor uses) then
// the row array's own buffer, and resets the tag to closed.
void destroy_mod_pattern_array_elem(byte *element)
{
  *element = 0x98;
  element[1] = 0x30;
  element[2] = 8;
  element[3] = 0;
  if (*(int *)(element + 4) != 0) {
    destroy_mod_row_array_range((char *)(intptr_t)(*(int *)(element + 4)),*(undefined4 *)(element + 8));
    cpp_operator_delete((void *)(intptr_t)(*(undefined4 *)(element + 4)));
  }
  *element = 0x20;
  element[1] = 0x30;
  element[2] = 8;
  element[3] = 0;
}



// was FUN_00050718 -- MFC CArchive-style serialize for the per-pattern row array (20-byte elements,
// one pattern's rows): loading resizes via resize_mod_pattern_row_array, storing writes via
// write_mod_pattern_row_array.
void serialize_mod_pattern_row_array(char *array, char *archive)
{
  undefined4 uVar1;

  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2588(archive,*(undefined4 *)(array + 8));
  }
  else {
    uVar1 = ordaudio_op_2142(archive);
    resize_mod_pattern_row_array(array,uVar1,0xffffffff);
  }
  write_mod_pattern_row_array(archive,(void *)(intptr_t)(*(undefined4 *)(array + 4)),*(undefined4 *)(array + 8));
}



// was FUN_00050768 -- "scalar deleting destructor" for the "pattern" element type (see
// destroy_mod_dynamic_array_and_maybe_free).
void *destroy_mod_pattern_array_elem_and_maybe_free(char *element, uint delete_flags)
{
  destroy_mod_pattern_array_elem(element);
  if ((delete_flags & 1) != 0) {
    cpp_operator_delete(element);
  }
  return element;
}



// was FUN_0005078c -- MFC CArchive write helper for the per-pattern
// row array (20-byte elements).
void write_mod_pattern_row_array(char *archive, void *elements, int count)
{
  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2582();
  }
  else {
    ordaudio_op_2135(archive,elements,count * 0x14);
  }
}



// was FUN_000507b8 -- zero-fills param_2 20-byte "pattern" elements
// then default-constructs each one (construct_mod_pattern_array_elem).
// The construct-range callback resize_mod_pattern_array uses on grow.
void construct_mod_pattern_array_range(char *elements, int count)
{
  ce_memset(elements,0,count * 0x14);
  for (; count != 0; count = count + -1) {
    if (elements != 0) {
      construct_mod_pattern_array_elem(elements);
    }
    elements = elements + 0x14;
  }
}



// was FUN_000507fc -- MFC CArchive write helper for the top-level
// pattern array (20-byte elements) -- used by serialize_mod_pattern_array.
void write_mod_pattern_array(char *archive, void *elements, int count)
{
  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2582();
  }
  else {
    ordaudio_op_2135(archive,elements,count * 0x14);
  }
}



// was FUN_00050828 -- destroys param_2 48-byte instrument elements: releases an embedded object
// (likely a CString sample name, given BatteryDrvrGetLevels's use alongside name-reading code in
// the MOD loader) per element via FoldStringW/BatteryDrvrGetLevels.
void destroy_mod_instrument_array_range(char *elements, int count)
{
  for (; count != 0; count = count + -1) {
    FoldStringW(elements + 0x1c);
    BatteryDrvrGetLevels(elements);
    elements = elements + 0x30;
  }
}



// was FUN_00050860 -- zero-fills param_2 48-byte instrument elements then default-constructs each
// one's embedded object (FindNextFileW/ HeapReAlloc, the construct counterpart to
// destroy_mod_instrument_array_range's BatteryDrvrGetLevels/FoldStringW).
void construct_mod_instrument_array_range(char *elements, int count)
{
  ce_memset(elements,0,count * 0x30);
  for (; count != 0; count = count + -1) {
    if (elements != 0) {
      FindNextFileW(0,elements);  /* ARM passes only the object pointer (r0); handle slot unused */
      HeapReAlloc(elements + 0x1c);
    }
    elements = elements + 0x30;
  }
}



// was FUN_000508b0 -- MFC CArchive write helper for the instrument
// array (48-byte elements) -- used by serialize_mod_instrument_array.
void write_mod_instrument_array(char *archive, void *elements, int count)
{
  if ((*(uint *)(archive + 0x14) & 1) == 0) {
    ordaudio_op_2582();
  }
  else {
    ordaudio_op_2135(archive,elements,count * 0x30);
  }
}



// was FUN_000508dc -- zero-fills param_2 64-byte channel-state elements in one memset. The
// construct-range callback resize_mod_channel_state_array passes on grow (no per-element
// constructor needed -- see resize_mod_channel_state_array's own comment).
void construct_mod_channel_state_array_range(void *elements, int count)
{
  ce_memset(elements,0,count << 6);
}



// was FUN_0005090c -- default-constructs one "row" element in place
// (tag 0x80, zeroed nested event-array header). The per-element
// constructor construct_mod_row_array_range calls for each new row.
void construct_mod_row_array_elem(byte *element)
{
  *element = 0x80;
  element[1] = 0x30;
  *(undefined4 *)(element + 4) = 0;
  *(undefined4 *)(element + 0x10) = 0;
  element[2] = 8;
  *(undefined4 *)(element + 0xc) = 0;
  *(undefined4 *)(element + 8) = 0;
  element[3] = 0;
}



// was FUN_00050948 -- default-constructs one "pattern" element in place (tag 0x98, zeroed nested
// row-array header). The per-element constructor construct_mod_pattern_array_range calls for each
// new pattern.
void construct_mod_pattern_array_elem(byte *element)
{
  *element = 0x98;
  element[1] = 0x30;
  *(undefined4 *)(element + 4) = 0;
  *(undefined4 *)(element + 0x10) = 0;
  element[2] = 8;
  *(undefined4 *)(element + 0xc) = 0;
  *(undefined4 *)(element + 8) = 0;
  element[3] = 0;
}


// byte-identical duplicate body of clear_ambient_sound_target (was FUN_0007ec1c) at a different
// address -- same split-symbol/naming- collision pattern documented elsewhere in this file (e.g.
// close_strings_pak_file vs close_strings_pak_file_thunk). was thunk_FUN_0007ec1c...
void clear_ambient_sound_target_thunk()

{
  clear_ambient_sound_target();
  return;
}

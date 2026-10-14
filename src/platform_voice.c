/* Real playback backend for the numbered VOC voice/narration sample
 * pool: a single-voice (interrupting, not mixing) SDL2 WAV player fed
 * directly from the loose data/SOUND/VOCnn.wav files that already ship
 * with the game, no extraction step needed. Split out of audio.c into
 * its own file/header (platform_voice.h) specifically so this backend
 * can be swapped out later without touching audio.c's own call sites
 * (play_numbered_voice_sample/is_voice_sample_finished/stop_voice_sample)
 * at all. Mirrors platform_music.c/platform_sfx.c's split/role for the
 * other two audio backends -- read those first if this is the first
 * platform_* backend you're looking at.
 */
#include "headers/platform_voice.h"
#include "headers/debug.h"
#include "headers/file_io.h"
#include "uw_sound.h"  /* vendored OpenAbyss VOC reader, for the DOS asset set */
#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* --- Real voice-sample playback backend (SDL2 WAV player) ---------------
 *
 * play_numbered_voice_sample's own decompiled body (audio.c, "was
 * FUN_000738c4") is gated by `if (DAT_0023c3b8 == 0) return 0;` --
 * DAT_0023c3b8 is the dead decompiled MOD engine's COM-style handle,
 * deliberately never assigned a value anywhere in this codebase (see
 * platform_music.c's own block comment), so that body has never once
 * executed. Its sibling query/stop functions (is_voice_sample_finished/
 * stop_voice_sample) are gated the same way (and is_voice_sample_finished
 * in fact has NO such guard at all -- see the live-crash finding below).
 * This is a real, separate asset pool (confirmed below), so it gets the
 * same treatment as the MOD engine and the PE-resource SFX pool: a
 * fresh, small, parallel backend, hooked in ahead of the dead gates.
 *
 * What the real dead body actually does, confirmed via a live Ghidra
 * decompile of FUN_000738c4 (ARM, address 0x000738c4) rather than
 * trusting this file's own earlier, partially-wrong inline comment:
 *
 *   1. It copies the base-directory global DAT_00087520 into a stack
 *      buffer. DAT_00087520's real recovered content, already confirmed
 *      elsewhere in this very file (see its own declaration comment a
 *      few hundred lines up), is the literal string "\VOC00.WAV" -- a
 *      complete filename TEMPLATE, not a directory fragment.
 *   2. It computes two ASCII digit characters from param_1 via genuine
 *      divide-by-10 (confirmed in the disassembly: `Ordinal_2005` --
 *      the project's own div/mod helper -- is called twice with divisor
 *      10, once for the quotient and once for the remainder). This is
 *      PLAIN DECIMAL, unlike play_music_track's own filename digits
 *      (tens = track>>3, ones = track&7, fixed in a separate commit on
 *      this branch) -- confirmed by checking, not assumed by analogy.
 *   3. Those two digits are written in place over the "00" placeholder
 *      inside that same stack copy of "\VOC00.WAV" -- Ghidra printed
 *      the destination as three separate locals (acStack_220/local_21c/
 *      local_21b) only because of how it mis-split one contiguous
 *      11-byte stack buffer, not because they're independent values;
 *      the real ARM stack offsets (sp+0x8.."\VOC00.WAV"'s start,
 *      sp+0xc/sp+0xd == the two placeholder '0' characters) confirm
 *      they're all the same buffer. The result is a real "\VOCnn.WAV"
 *      string, nn = param_1 in two decimal digits.
 *   4. A second, unrelated-looking copy loop from DAT_00241f08 fills a
 *      different stack buffer, and `ce_strcat` appends the patched
 *      "\VOCnn.WAV" from step 3 onto the end of it. DAT_00241f08 is NOT
 *      a second filename template (the only other reader/writer of it,
 *      game.c's registry-install-dir lookup around
 *      RegQueryValueExW/load_string_resource_large, confirms it holds
 *      the game's install directory) -- so the real, full intent is
 *      "<install dir>\VOCnn.WAV", an absolute Windows path.
 *
 *   None of step 4's install-directory half matters for this port,
 *   though: RegQueryValueExW (ordinal_stubs.c) is a no-op stub that
 *   never actually fills its output buffer, so DAT_00241f08 resolves to
 *   an empty string at runtime here regardless -- the real effective
 *   path this build would ever produce is just "\VOCnn.WAV", exactly
 *   matching the real, loose data/SOUND/VOCnn.wav files that already
 *   ship with the game (confirmed: VOC00.wav..VOC65.wav, 42 files, real
 *   8-bit PCM) and exactly matching platform_sfx.c's own prior note
 *   about this sibling pool's path convention. So this backend just
 *   builds "\SOUND\VOCnn.wav" directly and resolves it the normal way
 *   (uw_resolve_win_path/uw_file_fopen), skipping the dead install-dir
 *   concatenation entirely rather than reimplementing an absolute
 *   Windows path lookup that can never produce anything but "" here.
 *
 * Why single-voice instead of reusing platform_sfx's 16-voice mixer:
 * the real decompiled body's own logic is "wait for any currently-
 * playing sample to finish [a `do { } while (is_sfx_trigger_slot_active)`
 * spin] before arming the new one" -- i.e. one voice line at a time,
 * interrupting/replacing, never overlapping. A fresh small backend with
 * exactly that shape is simpler and more honest than bolting a
 * single-voice restriction onto the mixer built for the other pool.
 *
 * Live-crash finding this change also neutralizes: is_voice_sample_finished's
 * real decompiled body (unlike play_numbered_voice_sample's own) has NO
 * `DAT_0023c3b8 == 0` guard at all -- it unconditionally calls
 * is_sfx_trigger_slot_active(DAT_0023c3b8, 0), which dereferences
 * `*(char*)(param_2*0xd + param_1 + 0x10410)` with param_1 (DAT_0023c3b8)
 * always NULL, i.e. a raw read of address 0x10410. That's only ever
 * reached once a babl conversation line sets the "voice forced on" flag
 * (babl.c's render_babl_dialog_window, bit 0x40) and babl_render_tick
 * polls it -- a real, reachable path during ordinary dialogue, not a
 * hypothetical. Replacing this function's whole body with a direct
 * return of the real platform_voice_is_finished() value (not merely
 * prepending a call and falling through, the shape used for
 * play_numbered_voice_sample/stop_voice_sample below, both of which DO
 * have a safe NULL guard already) avoids ever reaching that dereference.
 *
 * load_voice_sample_page/read_voice_sample_page_chunk (audio.c), despite
 * their names, were checked and are NOT part of this pool: their only
 * real caller (babl.c's render_babl_dialog_window, inside the
 * illustrated book/scroll-viewer branch) streams their output straight
 * into ce_memmove(64000 bytes)/decompress_rle_stream/
 * bitmap_blit_to_framebuffer -- i.e. they page in 320x200 RLE/raw
 * bitmap ANIMATION FRAMES for the picture viewer, not audio. (This
 * project's own test grouping already bundles them with
 * render_babl_dialog_window/decompress_rle_stream/bitmap_blit_to_framebuffer
 * under the "illustration_render" suite, independently agreeing.) Left
 * completely untouched here.
 */

static SDL_AudioDeviceID g_voice_audiodev;
static Uint8 *g_voice_pcm;     /* SDL_malloc'd/converted, AUDIO_S16SYS mono */
static unsigned int g_voice_len;   /* bytes */
static unsigned int g_voice_pos;   /* bytes, advanced by the audio callback */
static int g_voice_device_rate;

/* SDL audio device fill callback -- runs on SDL's own audio thread.
   Copies out whatever's left of the current sample and advances the
   position; once pos reaches len the voice is simply "finished" and
   the callback goes silent, same shape as platform_sfx.c's mixer minus
   the mixing (there's only ever one voice here). SDL already holds
   this device's lock for the callback's duration. */
static void voice_audio_callback(void *userdata, Uint8 *stream, int len)
{
  (void)userdata;
  memset(stream, 0, (size_t)len);
  if (!g_voice_pcm || g_voice_pos >= g_voice_len) {
    return;
  }
  unsigned int remain = g_voice_len - g_voice_pos;
  unsigned int n = remain < (unsigned int)len ? remain : (unsigned int)len;
  memcpy(stream, g_voice_pcm + g_voice_pos, n);
  g_voice_pos += n;
}

void platform_voice_init(void)
{
  if (SDL_GetNumAudioDevices(0) <= 0) {
    DEBUG(WARN, "[audio] no audio output devices available -- voice-sample playback disabled\n");
    return;
  }

  SDL_AudioSpec want, have;
  memset(&want, 0, sizeof(want));
  /* The real VOC*.wav files are all 8-bit mono, but not all at the same
     rate (confirmed via `file` on the real shipped set: most are
     11025Hz, some are 12048Hz) -- open the device at a single fixed
     rate and let sfx-style SDL_AudioCVT conversion in
     voice_cache_load_and_play below handle whichever source rate each
     file actually has, rather than assuming one. */
  want.freq = 22050;
  want.format = AUDIO_S16SYS;
  want.channels = 1;
  want.samples = 1024;
  want.callback = voice_audio_callback;
  want.userdata = NULL;

  g_voice_audiodev = SDL_OpenAudioDevice(NULL, 0, &want, &have, 0);
  if (g_voice_audiodev == 0) {
    DEBUG(WARN, "[audio] SDL_OpenAudioDevice (voice) failed: %s -- voice-sample playback disabled\n",
          SDL_GetError());
    return;
  }

  g_voice_device_rate = have.freq;
  DEBUG(INFO, "[audio] voice-sample playback ready: %dHz %dch %d samples/buffer\n",
        have.freq, have.channels, have.samples);
  SDL_PauseAudioDevice(g_voice_audiodev, 0);
}

/* One loaded voice sample, in whatever format its file happened to be:
   always an SDL_malloc'd buffer the caller owns and frees with SDL_free,
   so the two source formats below converge before the resampler.

   Spelled as a named struct starting its own line, rather than the
   anonymous `typedef struct {`, so tests/tools/extract_functions.py can
   select it with `@voice_source` and compile voice_source_load's real body
   into the voice test suite without un-staticing it -- the same shape
   uw_test_look_pacing uses for its own static poller. */
struct voice_source {
  Uint8 *buf;
  Uint32 len;
  SDL_AudioFormat format;
  int channels;
  int freq;
  char path[4096];
};
typedef struct voice_source voice_source;

/* The Pocket PC asset set ships this pool as RIFF WAV ("\SOUND\VOCnn.wav",
   see the path derivation above). The DOS set ships exactly the same 42
   ids -- confirmed id-for-id against the shipped set, no holes on either
   side -- as Creative VOC under their bare number ("\SOUND\nn.VOC"), which
   SDL_LoadWAV cannot read.

   The DOS game never parsed VOC either: its voc_play_file staged the file
   in EMS and handed the raw bytes to the digital driver, so the four things
   it assumed without checking are what matter, and all 42 files satisfy
   them (verified with the vendored reader: data offset 26, version 0x010a,
   a single type-1 block with its samples at byte 32, pack byte 0 -- plain
   8-bit unsigned PCM -- and a time constant of 173, i.e. 1000000/(256-173)
   = 12048Hz). That is squarely inside what the existing resampler below
   already handles, so the DOS files need no conversion step of their own;
   they just enter as AUDIO_U8/1ch/12048Hz instead of whatever the WAV's
   own header said. */
static int voice_source_load(int sample_id, char tens, char ones, voice_source *out)
{
  memset(out, 0, sizeof(*out));

  char win_path[32];
  snprintf(win_path, sizeof(win_path), "\\SOUND\\VOC%c%c.WAV", tens, ones);
  char real_path[4096];
  if (uw_resolve_win_path(win_path, real_path, sizeof(real_path))) {
    SDL_AudioSpec wav_spec;
    Uint8 *wav_buf = NULL;
    Uint32 wav_len = 0;
    if (SDL_LoadWAV(real_path, &wav_spec, &wav_buf, &wav_len) != NULL) {
      /* Copy out of SDL_LoadWAV's own allocation so both source formats
         hand back one uniformly-owned SDL_malloc'd buffer. These are at
         most a few tens of KB and loaded once per spoken line. */
      out->buf = (Uint8 *)SDL_malloc(wav_len ? wav_len : 1);
      if (!out->buf) {
        DEBUG(ERR, "[audio] platform_voice_play: out of memory loading sample %d\n", sample_id);
        SDL_FreeWAV(wav_buf);
        return 0;
      }
      memcpy(out->buf, wav_buf, wav_len);
      SDL_FreeWAV(wav_buf);
      out->len = wav_len;
      out->format = wav_spec.format;
      out->channels = wav_spec.channels;
      out->freq = wav_spec.freq;
      snprintf(out->path, sizeof(out->path), "%s", real_path);
      return 1;
    }
  }

  snprintf(win_path, sizeof(win_path), "\\SOUND\\%c%c.VOC", tens, ones);
  if (!uw_resolve_win_path(win_path, real_path, sizeof(real_path))) {
    DEBUG(WARN, "[audio] platform_voice_play: could not resolve path for sample %d (%s)\n",
          sample_id, win_path);
    return 0;
  }
  uw_voc voc;
  if (!uw_voc_open(&voc, real_path)) {
    DEBUG(WARN, "[audio] platform_voice_play: no readable WAV or VOC file for sample %d (%s)\n",
          sample_id, real_path);
    return 0;
  }
  if (!voc.sound_blocks || voc.pack != 0 || !voc.samples) {
    DEBUG(WARN, "[audio] platform_voice_play: sample %d (%s) has %d sound block(s), pack %u, %zu samples -- not plain 8-bit PCM, skipping\n",
          sample_id, real_path, voc.sound_blocks, voc.pack, voc.samples);
    uw_voc_close(&voc);
    return 0;
  }
  out->buf = (Uint8 *)SDL_malloc(voc.samples);
  if (!out->buf) {
    DEBUG(ERR, "[audio] platform_voice_play: out of memory loading sample %d\n", sample_id);
    uw_voc_close(&voc);
    return 0;
  }
  memcpy(out->buf, voc.file.data + voc.samples_at, voc.samples);
  out->len = (Uint32)voc.samples;
  out->format = AUDIO_U8;
  out->channels = 1;
  out->freq = (int)uw_voc_rate(&voc);
  snprintf(out->path, sizeof(out->path), "%s", real_path);
  uw_voc_close(&voc);
  return 1;
}

void platform_voice_play(int sample_id)
{
  if (!g_voice_audiodev) {
    return; /* no device open -- platform_voice_init already warned once */
  }
  /* The real digit formula (confirmed above) is a raw tens/ones ASCII
     pair, not a generic 3+-digit decimal format -- faithfully
     reproduced here rather than assuming printf-style "%02d" scales the
     same way past two digits. Every real shipped file is 0-65, so this
     only ever matters for an out-of-range id, which just fails to
     resolve a file below (same soft-fail as any other missing id). */
  if (sample_id < 0 || sample_id > 99) {
    DEBUG(WARN, "[audio] platform_voice_play: sample id %d can't be represented by the real two-digit filename scheme\n",
          sample_id);
    return;
  }
  char tens = (char)('0' + sample_id / 10);
  char ones = (char)('0' + sample_id % 10);

  voice_source src;
  if (!voice_source_load(sample_id, tens, ones, &src)) {
    return; /* voice_source_load already warned */
  }
  const char *real_path = src.path;

  Uint8 *new_pcm;
  unsigned int new_len;
  SDL_AudioCVT cvt;
  int cvt_ok = SDL_BuildAudioCVT(&cvt, src.format, (Uint8)src.channels, src.freq,
                                  AUDIO_S16SYS, 1, g_voice_device_rate);
  if (cvt_ok < 0) {
    DEBUG(WARN, "[audio] platform_voice_play: SDL_BuildAudioCVT failed for sample %d: %s\n",
          sample_id, SDL_GetError());
    SDL_free(src.buf);
    return;
  }
  if (cvt_ok == 0) {
    /* Already exactly the device's own format -- no conversion buffer
       needed, just take ownership of the loader's own buffer. */
    new_pcm = src.buf;
    new_len = src.len;
  } else {
    cvt.len = (int)src.len;
    Uint8 *cvt_buf = (Uint8 *)SDL_malloc((size_t)cvt.len * cvt.len_mult);
    if (!cvt_buf) {
      DEBUG(ERR, "[audio] platform_voice_play: out of memory converting sample %d\n", sample_id);
      SDL_free(src.buf);
      return;
    }
    memcpy(cvt_buf, src.buf, src.len);
    cvt.buf = cvt_buf;
    SDL_free(src.buf);
    if (SDL_ConvertAudio(&cvt) != 0) {
      DEBUG(WARN, "[audio] platform_voice_play: SDL_ConvertAudio failed for sample %d: %s\n",
            sample_id, SDL_GetError());
      SDL_free(cvt_buf);
      return;
    }
    new_pcm = cvt_buf;
    new_len = (unsigned int)cvt.len_cvt;
  }

  /* Single voice, interrupting: swap in the new buffer under the
     device lock and drop whatever was playing before, matching the
     real decompiled body's own "wait for the current slot to finish,
     then arm the new one" shape, except interrupting immediately
     rather than blocking -- nothing in this codebase actually depends
     on the original's busy-wait, and blocking the caller's thread here
     would freeze the whole game. */
  SDL_LockAudioDevice(g_voice_audiodev);
  Uint8 *old_pcm = g_voice_pcm;
  g_voice_pcm = new_pcm;
  g_voice_len = new_len;
  g_voice_pos = 0;
  SDL_UnlockAudioDevice(g_voice_audiodev);
  if (old_pcm) {
    SDL_free(old_pcm);
  }

}

int platform_voice_is_finished(void)
{
  if (!g_voice_audiodev || !g_voice_pcm) {
    return 1;
  }
  SDL_LockAudioDevice(g_voice_audiodev);
  int finished = g_voice_pos >= g_voice_len;
  SDL_UnlockAudioDevice(g_voice_audiodev);
  return finished;
}

void platform_voice_stop(void)
{
  if (!g_voice_audiodev || !g_voice_pcm) {
    return;
  }
  SDL_LockAudioDevice(g_voice_audiodev);
  g_voice_pos = g_voice_len;
  SDL_UnlockAudioDevice(g_voice_audiodev);
}

void platform_voice_shutdown(void)
{
  if (g_voice_audiodev) {
    SDL_CloseAudioDevice(g_voice_audiodev);
    g_voice_audiodev = 0;
  }
  if (g_voice_pcm) {
    SDL_free(g_voice_pcm);
    g_voice_pcm = NULL;
  }
  g_voice_len = 0;
  g_voice_pos = 0;
}

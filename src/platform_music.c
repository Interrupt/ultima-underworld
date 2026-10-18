/* Real background-music playback backend: a vendored, tiny MOD player
 * (third_party/hxcmod -- public-domain HxCModPlayer) plus a real SDL2
 * audio device. Split out of audio.c into its own file/header
 * (platform_music.h) specifically so this third-party backend can be
 * swapped out later without touching audio.c's own call sites
 * (play_music_track/resume_music_playback/set_music_enabled/
 * shutdown_music_module) at all -- those call the platform_music_*
 * functions declared in platform_music.h and nothing else.
 */
#include "headers/platform_music.h"
#include "headers/options.h"
#include "headers/audio.h"
#include "headers/debug.h"
#include "headers/file_io.h"
#include "headers/platform_dosmidi.h"
#include "hxcmod.h"
#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* --- Real MOD playback backend (vendored HxCModPlayer + SDL2 audio) ------
 *
 * The decompiled MOD engine construct_and_load_mod_player/
 * start_mod_player_playback/stop_mod_player_playback (and the ~1400 lines
 * of dynamic-array/channel-mixing machinery under them in audio.c) can
 * never run safely on this 64-bit host: every one of their internal
 * "dynamic array" structs stores a cpp_operator_new() allocation in a
 * 4-byte field and reads it back later as a real pointer, which silently
 * truncates any real 64-bit heap address (see DAT_00087454's own comment
 * in audio.c, and cpp_operator_new's in ordinal_stubs.c, for the full
 * investigation/root cause). Rather than refactor that struct layout
 * across 20+ functions, background music is played through this small,
 * separate backend instead, hooked in at the exact same call sites inside
 * audio.c's play_music_track/resume_music_playback/set_music_enabled/
 * shutdown_music_module (see each function's own comment) via the
 * platform_music_* functions declared in platform_music.h --
 * construct_and_load_mod_player, start_mod_player_playback and
 * stop_mod_player_playback themselves are left completely untouched and
 * still unreachable from there (cpp_operator_new is still the same
 * hardcoded-NULL stub it always was).
 *
 * Deliberately NOT wired into DAT_0023c3b8 or shared with the sound-
 * effect/voice-sample call sites (trigger_sound_sample_note,
 * play_numbered_voice_sample, stop_current_audio_handle(_dup),
 * is_voice_sample_finished, stop_voice_sample): those all gate on
 * DAT_0023c3b8 being non-NULL, which was never reachable before this
 * change (cpp_operator_new always returned 0) and is deliberately left
 * exactly that way -- DAT_0023c3b8 is never assigned a value anywhere in
 * this backend, so every one of those call sites stays precisely as
 * dormant/silent as it already was. Fixing sound effects/voice samples is
 * out of scope here; this backend is music-only. */

static modcontext g_uwmod_ctx;
static unsigned char *g_uwmod_filedata;
static int g_uwmod_loaded;
static int g_uwmod_playing;
static SDL_AudioDeviceID g_uwmod_audiodev;
/* Nonzero once platform_dosmidi_init has confirmed a usable DOS audio
 * path, i.e. the player asked for --audio-mode=dos AND the DOS driver,
 * timbre bank and effect table were all readable. Decided once at init and never flipped
 * afterwards, so one audio device and one callback serve either backend
 * without ever mixing the two mid-session. Zero is the default and means
 * everything below behaves exactly as it always has. */
static int g_dos_mode;

/* SDL audio device fill callback -- runs on SDL's own audio thread, not
 * the game's main thread, so every access to the shared g_uwmod_* state
 * above here is made safe by SDL_LockAudioDevice/SDL_UnlockAudioDevice in
 * the platform_music_* functions below (SDL already holds that same lock
 * for the duration of this callback). Pre-zeroes the buffer and only
 * calls hxcmod_fillbuffer when actually "playing" so a stopped track
 * freezes in place instead of silently advancing. */
static void uwmod_audio_callback(void *userdata, Uint8 *stream, int len)
{
  (void)userdata;
  memset(stream, 0, (size_t)len);
  if (g_dos_mode) {
    /* The DOS driver model and its OPL2, resampled to this device's rate.
     *
     * BUG FIX (confirmed live): deliberately NOT gated on g_uwmod_playing.
     * In DOS mode one chip carries both the music and the sound effects, so
     * a "music stopped" gate here silenced the effects too -- turning the
     * music off turned everything off. Music is stopped where it should be,
     * at the sequencer (platform_dosmidi_stop), which leaves the driver
     * running for effects. Renders nothing when DOS mode has no track and
     * no effect sounding, so this costs nothing while idle. */
    platform_dosmidi_render((short *)stream, len / 4);
  } else {
    if (!g_uwmod_playing || !g_uwmod_loaded) {
      return;
    }
    hxcmod_fillbuffer(&g_uwmod_ctx, (msample *)stream, (mssize)(len / 4), NULL);
    if (g_opts.music_volume < 100) {
      int vol = g_opts.music_volume < 0 ? 0 : g_opts.music_volume;
      short *s = (short *)stream;
      for (int i = 0; i < len / 2; i++) s[i] = (short)(s[i] * vol / 100);
    }
  }

}

/* Opens the real SDL2 audio device and prepares the HxCModPlayer context.
 * Called once, early at startup from gx_stub.c's GXOpenDisplay right
 * after SDL_Init(... | SDL_INIT_AUDIO) -- well before
 * run_game_startup_sequence's very first play_music_track(1,1) call.
 *
 * Sets DAT_00087454 ("audio subsystem initialized", see its own long
 * comment in audio.c) and DAT_00087448 ("music enabled") to 1 only if
 * this actually succeeds; both are left at their existing default of 0
 * otherwise, which (via play_music_track/resume_music_playback/
 * set_music_enabled's own existing gate checks, completely unchanged)
 * falls back to exactly this build's current silent-but-stable behavior.
 * No audio output device is a real condition in CI/sandboxed test
 * environments, not just a hypothetical -- this must not crash there. */
void platform_music_init(void)
{
  if (SDL_GetNumAudioDevices(0) <= 0) {
    DEBUG(WARN, "[audio] no audio output devices available -- music playback disabled\n");
    return;
  }

  SDL_AudioSpec want;
  SDL_AudioSpec have;
  memset(&want, 0, sizeof(want));
  want.freq = 44100;
  want.format = AUDIO_S16SYS;
  want.channels = 2;
  want.samples = 2048;
  want.callback = uwmod_audio_callback;
  want.userdata = NULL;

  g_uwmod_audiodev = SDL_OpenAudioDevice(NULL, 0, &want, &have, 0);
  if (g_uwmod_audiodev == 0) {
    DEBUG(WARN, "[audio] SDL_OpenAudioDevice failed: %s -- music playback disabled\n", SDL_GetError());
    return;
  }

  hxcmod_init(&g_uwmod_ctx);
  hxcmod_setcfg(&g_uwmod_ctx, have.freq, 0, 1);

  /* Opt-in DOS audio mode. Returns 0 both when it wasn't asked for (the
   * normal case) and when it was but couldn't be set up, so an incomplete
   * DOS install degrades to the .MOD path below rather than to silence --
   * see platform_dosmidi_init for the specific failure cases. It is told
   * the device's real rate because its chip runs at 49716Hz and resamples. */
  g_dos_mode = platform_dosmidi_init(have.freq);

  DEBUG(INFO, "[audio] music playback ready: %dHz %dch %d samples/buffer (%s)\n",
        have.freq, have.channels, have.samples,
        g_dos_mode ? "DOS XMI/OPL2" : "converted MOD");

  DAT_00087454 = 1;
  DAT_00087448 = 1;
  SDL_PauseAudioDevice(g_uwmod_audiodev, 0);
}

/* Reads the whole file at win_path (a "\SOUND\uwNN.mod"-style game path)
 * into a freshly malloc'd buffer via this codebase's existing --data-dir
 * file helpers (uw_file_fopen), then hands it to hxcmod_load -- replacing
 * construct_and_load_mod_player's own loader, which (per this file's
 * block comment above) never once executed. hxcmod_load keeps pointers
 * directly into this buffer for the entire lifetime of playback (it never
 * copies sample data out of it), so the buffer is kept alive in
 * g_uwmod_filedata until the next call here (or platform_music_shutdown),
 * not just until this function returns. */
void platform_music_load_track(const char *win_path)
{
  /* DOS audio mode plays the original XMI for this same track number
   * instead. audio.c is deliberately untouched: it still asks for
   * "\SOUND\uwNN.mod" and the mapping to <--dos-data-dir>/SOUND/UWNN.XMI
   * happens here, so play_music_track's base-8 track numbering stays the
   * single source of truth for which track this is. */
  if (g_dos_mode) {
    char xmi_path[1024];
    if (!platform_dosmidi_xmi_path(win_path, xmi_path, sizeof(xmi_path))) {
      DEBUG(WARN, "[audio] could not map %s to a DOS XMI path\n", win_path);
      return;
    }
    if (g_uwmod_audiodev) SDL_LockAudioDevice(g_uwmod_audiodev);
    g_uwmod_playing = 0;
    platform_dosmidi_load_file(xmi_path);
    if (g_uwmod_audiodev) SDL_UnlockAudioDevice(g_uwmod_audiodev);
    return;
  }

  FILE *fp = (FILE *)uw_file_fopen(win_path, "rb");
  if (!fp) {
    DEBUG(WARN, "[audio] platform_music_load_track: could not open %s\n", win_path);
    return;
  }
  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);
  fseek(fp, 0, SEEK_SET);
  if (size <= 0) {
    fclose(fp);
    DEBUG(WARN, "[audio] platform_music_load_track: empty/unreadable file %s\n", win_path);
    return;
  }

  unsigned char *data = (unsigned char *)malloc((size_t)size);
  if (!data) {
    fclose(fp);
    DEBUG(ERR, "[audio] platform_music_load_track: out of memory (%ld bytes) for %s\n", size, win_path);
    return;
  }
  size_t got = fread(data, 1, (size_t)size, fp);
  fclose(fp);
  if (got != (size_t)size) {
    DEBUG(WARN, "[audio] platform_music_load_track: short read on %s (%zu/%ld bytes)\n", win_path, got, size);
    free(data);
    return;
  }

  if (g_uwmod_audiodev) SDL_LockAudioDevice(g_uwmod_audiodev);
  g_uwmod_playing = 0;
  if (g_uwmod_loaded) {
    hxcmod_unload(&g_uwmod_ctx);
    g_uwmod_loaded = 0;
  }
  unsigned char *old_filedata = g_uwmod_filedata;
  g_uwmod_filedata = NULL;
  int ok = hxcmod_load(&g_uwmod_ctx, data, (int)size);
  if (ok) {
    g_uwmod_filedata = data;
    g_uwmod_loaded = 1;
  }
  if (g_uwmod_audiodev) SDL_UnlockAudioDevice(g_uwmod_audiodev);

  free(old_filedata);
  if (!ok) {
    DEBUG(WARN, "[audio] hxcmod_load failed for %s\n", win_path);
    free(data);
    return;
  }

  DEBUG(INFO, "[audio] loaded MOD track %s (%ld bytes)\n", win_path, size);
}

/* (Re)starts playback of whatever track platform_music_load_track most
 * recently loaded, from the engine's current position -- the
 * counterpart to start_mod_player_playback at the music call sites in
 * audio.c. A no-op if no audio device is open or nothing is loaded. */
void platform_music_start(void)
{
  if (!g_uwmod_audiodev) {
    return;
  }
  /* In DOS mode the synth itself reports "nothing loaded" by rendering
   * silence, so there is no separate loaded flag to gate on here. */
  if (!g_dos_mode && !g_uwmod_loaded) {
    return;
  }
  SDL_LockAudioDevice(g_uwmod_audiodev);
  g_uwmod_playing = 1;
  if (g_dos_mode) platform_dosmidi_start();
  SDL_UnlockAudioDevice(g_uwmod_audiodev);
}

/* Silences (without unloading) whatever track is currently playing --
 * the counterpart to stop_mod_player_playback at the music call sites in
 * audio.c. The engine's own position freezes in place (the audio
 * callback simply stops calling hxcmod_fillbuffer) so a later
 * platform_music_start call resumes from where this left off, matching
 * this cluster's existing stop-then-resume semantics (e.g.
 * set_music_enabled/resume_music_playback). */
void platform_music_stop(void)
{
  if (!g_uwmod_audiodev) {
    return;
  }
  SDL_LockAudioDevice(g_uwmod_audiodev);
  g_uwmod_playing = 0;
  if (g_dos_mode) platform_dosmidi_stop();
  SDL_UnlockAudioDevice(g_uwmod_audiodev);
}

/* Re-applies --music-volume to a playing DOS sequence (the converted MOD path reads it per buffer). */
void platform_music_apply_volume(void)
{
  if (!g_dos_mode) return;
  platform_music_lock();
  platform_dosmidi_set_music_volume(g_opts.dos_music_volume * g_opts.music_volume / 100);
  platform_music_unlock();
}

void platform_music_lock(void)
{
  if (g_uwmod_audiodev) SDL_LockAudioDevice(g_uwmod_audiodev);
}

void platform_music_unlock(void)
{
  if (g_uwmod_audiodev) SDL_UnlockAudioDevice(g_uwmod_audiodev);
}

/* Closes the real audio device and releases the loaded track, for real
 * app shutdown (see shutdown_music_module in audio.c, called once from
 * run_game_shutdown_sequence right before process exit). Safe to call
 * even if platform_music_init never succeeded. */
void platform_music_shutdown(void)
{
  if (g_uwmod_audiodev) {
    SDL_CloseAudioDevice(g_uwmod_audiodev);
    g_uwmod_audiodev = 0;
  }
  /* Safe (and a no-op) when DOS mode was never active. Done after the
   * device is closed so the audio callback can no longer be rendering
   * from the synth while it is being torn down. */
  platform_dosmidi_shutdown();
  g_dos_mode = 0;
  if (g_uwmod_loaded) {
    hxcmod_unload(&g_uwmod_ctx);
    g_uwmod_loaded = 0;
  }
  free(g_uwmod_filedata);
  g_uwmod_filedata = NULL;
  g_uwmod_playing = 0;
}

/* Optional DOS-audio backend: the original game's audio path as a Sound
 * Blaster Pro played it. See src/headers/platform_dosmidi.h for what this
 * is and why, and third_party/openabyss/VENDORING.md for the vendored
 * driver model this drives.
 *
 * This file is the only thing in the port that touches that layer. It owns
 * three jobs and no more: find the DOS files, turn the SDL callback's
 * demand for output frames into the driver's 120Hz timer calls, and
 * translate the port's two audio requests (play track, play effect) into
 * the MIDI the driver expects. Everything musical happens inside the
 * vendored code. */
#include "headers/platform_dosmidi.h"
#include "headers/debug.h"
#include "headers/options.h"
#include "headers/audio.h"
#include "headers/file_io.h"
#include "uw_ail.h"
#include "uw_adlib.h"
#include "uw_opl.h"
#include "uw_sound.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

/* One tick of the driver's timer is this many chip samples. The chip runs
 * at its own 49716Hz and the host resamples, so this is fractional and the
 * remainder is carried in g.src_frac. */
#define CHIP_SAMPLES_PER_TICK ((double)UW_OPL_RATE / (double)UW_AIL_TICK_HZ)

static struct {
  int live;
  int out_rate;

  uw_opl opl;
  uw_adlib adlib;
  uw_ail ail;
  uw_sounds sounds;
  uw_bank timbres;
  uw_blob adlib_file;
  uw_blob xmi;

  int seq;                  /* the registered sequence handle, -1 for none */
  int prefer_wav;           /* --audio-mode=hybrid: sample where we have one */
  int music_volume;         /* percent, applied to the sequence only */

  /* One tick's worth of chip output, consumed by the resampler below. */
  short tick_buf[(int)(UW_OPL_RATE / UW_AIL_TICK_HZ) + 2];
  int tick_len, tick_pos;

  /* 49716Hz -> out_rate, linear. src_frac is the position between the two
   * samples straddling the current output frame. */
  double src_frac;
  short prev_sample, cur_sample;
  int primed;

  /* The card's output coupling capacitor, as a one-pole high pass. Without
   * it a held operator leaves a constant offset on the output. */
  int dc_x, dc_y;

  /* Sound effects: a locked channel per voice, released when its note's
   * duration runs out. Durations are in SOUNDS.DAT's 1/256s units; count
   * them down in driver ticks. */
  struct { int channel, note, ticks_left, id; } sfx[4];
} g;

/* Where a DOS sound file lives. --dos-data-dir still wins, for pointing at
   a DOS install while playing the Pocket PC assets; with it unset the file is
   looked up in the game's own data directory, because when that directory IS
   a DOS install there is nowhere else for it to be -- and this port takes one
   data directory. */
static int dos_sound_path(const char *name, char *out, unsigned int out_sz)
{
  const char *root = g_opts.dos_data_dir;
  if (root && *root) {
    int n = snprintf(out, out_sz, "%s/SOUND/%s", root, name);
    return (n > 0 && (unsigned int)n < out_sz) ? 1 : 0;
  }
  char win[64];
  snprintf(win, sizeof(win), "\\SOUND\\%s", name);
  return uw_resolve_win_path(win, out, out_sz);
}

/* Is the GAME DATA DIRECTORY itself a DOS install, for audio purposes? UW.AD
   is the timbre bank: a DOS SOUND directory has it, the Pocket PC one holds
   .MOD and .wav files and no .AD at all.

   Deliberately ignores --dos-data-dir. Pointing that at a DOS install is how
   you borrow its music while playing the Pocket PC assets, and it has never
   by itself switched DOS audio on; that stays true. */
static int data_dir_is_dos_install(void)
{
  char path[1024];
  if (!uw_resolve_win_path("\\SOUND\\UW.AD", path, sizeof(path))) {
    return 0;
  }
  FILE *f = fopen(path, "rb");
  if (!f) {
    return 0;
  }
  fclose(f);
  return 1;
}

/* Both modes run the DOS driver; they differ only in where effects come
   from (see platform_dos_prefer_wav_effects). */
int platform_dos_audio_mode(void)
{
  const char *mode = g_opts.audio_mode;
  if (mode && *mode) {
    if (strcasecmp(mode, "hybrid") == 0) return UW_DOS_AUDIO_HYBRID;
    if (strcasecmp(mode, "dos") == 0)    return UW_DOS_AUDIO_DOS;
    return UW_DOS_AUDIO_OFF;             /* "arm", or anything unrecognised */
  }
  /* Unset: a DOS data directory defaults to hybrid, because its SOUND
     directory holds no .MOD music and no WAVE effects to fall back on. */
  return data_dir_is_dos_install() ? UW_DOS_AUDIO_HYBRID : UW_DOS_AUDIO_OFF;
}

static int dos_mode_requested(void)
{
  return platform_dos_audio_mode() != UW_DOS_AUDIO_OFF;
}

static int hybrid_mode_requested(void)
{
  return platform_dos_audio_mode() == UW_DOS_AUDIO_HYBRID;
}

int platform_dos_prefer_wav_effects(void)
{
  return g.live && g.prefer_wav;
}

int platform_dos_audio_enabled(void) { return g.live; }

/* The vendored driver model's synthesiser: the AIL sequencer's messages
 * and timbres go to ADLIB.ADV's voice layer, whose register writes go to
 * the chip. */
static void synth_message(void *user, uint8_t status, uint8_t d1, uint8_t d2)
{
  (void)user;
  uw_adlib_message(&g.adlib, status, d1, d2);
}
static void synth_timbre(void *user, uint8_t bank, uint8_t program, const uint8_t *patch, size_t len)
{
  (void)user;
  uw_adlib_timbre(&g.adlib, bank, program, patch, len);
}
static void synth_tick(void *user)
{
  (void)user;
  uw_adlib_service(&g.adlib);
}
static void chip_write(void *user, uint8_t reg, uint8_t value)
{
  (void)user;
  uw_opl_write(&g.opl, reg, value);
}

int platform_dosmidi_init(int out_rate)
{
  if (!dos_mode_requested()) {
    return 0; /* not asked for -- the normal case, silently */
  }
  if (g.live) {
    return 1;
  }


  char path[1024];
  uw_ail_synth synth;

  /* The driver file is not optional: uw_adlib_init reads the F-number,
   * block, velocity and operator-slot tables, and the chip's reset
   * registers, out of ADLIB.ADV itself rather than hardcoding them. */
  if (!dos_sound_path("ADLIB.ADV", path, sizeof(path))) {
    DEBUG(WARN, "[audio] DOS audio: no SOUND directory to read ADLIB.ADV from -- "
                "falling back to the converted .MOD music\n");
    return 0;
  }
  g.adlib_file = uw_read_file(path);
  if (!g.adlib_file.data) {
    DEBUG(WARN, "[audio] DOS audio: cannot read %s (%s) -- falling back\n",
          path, g.adlib_file.why ? g.adlib_file.why : "?");
    goto fail;
  }

  if (!dos_sound_path("UW.AD", path, sizeof(path)) || !uw_bank_open(&g.timbres, path)) {
    DEBUG(WARN, "[audio] DOS audio: cannot read the timbre bank %s -- falling back\n", path);
    goto fail;
  }

  /* The effect table comes from the port's own game data, not the DOS
   * install: data/SOUND/SOUNDS.DAT is byte-identical to the DOS original
   * (verified), because the Pocket PC build carried the table all along and
   * never used it -- its effects were WAVE resources instead. So prefer
   * that copy and keep the DOS directory only as a fallback, which narrows
   * what a DOS install is actually needed for to the XMI scores and the
   * UW.AD timbres. */
  int have_sounds = 0;
  if (uw_resolve_win_path("\\SOUND\\SOUNDS.DAT", path, sizeof(path))) {
    have_sounds = uw_sounds_open(&g.sounds, path);
  }
  if (!have_sounds) {
    if (dos_sound_path("SOUNDS.DAT", path, sizeof(path))) {
      have_sounds = uw_sounds_open(&g.sounds, path);
    }
  }
  if (!have_sounds) {
    DEBUG(WARN, "[audio] DOS audio: no readable SOUNDS.DAT in the game data or "
                "the DOS SOUND directory -- falling back\n");
    goto fail;
  }
  DEBUG(INFO, "[audio] DOS audio: effect table from %s\n", path);

  uw_opl_reset(&g.opl);
  if (!uw_adlib_init(&g.adlib, g.adlib_file.data, g.adlib_file.size, chip_write, NULL)) {
    DEBUG(WARN, "[audio] DOS audio: %s is not the AdLib driver -- falling back\n", path);
    goto fail;
  }

  synth.user = NULL;
  synth.message = synth_message;
  synth.timbre = synth_timbre;
  synth.tick = synth_tick;
  uw_ail_init(&g.ail, &synth);

  g.out_rate = out_rate > 0 ? out_rate : UW_OPL_RATE;
  g.seq = -1;
  g.prefer_wav = hybrid_mode_requested();
  {
    const char *env = g_opts.audio_mode;
    DEBUG(INFO, "[audio] DOS audio enabled: %s%s\n",
          g.prefer_wav ? "hybrid" : "dos",
          (env && *env) ? "" : " (no --audio-mode given; the data directory is a DOS install)");
  }
  /* BUG FIX (confirmed live: the music drowned the effects). At their own
   * settings the OPL music peaks about 7x an effect, so the default trims
   * the music -- never the effects, which stay at the velocities
   * SOUNDS.DAT gives them.
   *
   * The scale is an OPL attenuation curve, so it is steeply non-linear and
   * "50%" is nowhere near half: measured against a 1143 effect peak,
   * 100% gives 8368, 90% 4368, 85% 3374, 80% 2595, 75% 2029, 70% 1490,
   * 50% just 577. 80 leaves the music about twice an effect, which is
   * roughly where continuous music against transient effects wants to be.
   * --dos-music-volume overrides it without a rebuild. */
  g.music_volume = g_opts.dos_music_volume;
  if (g.music_volume < 0) g.music_volume = 0;
  if (g.music_volume > 100) g.music_volume = 100;
  for (int i = 0; i < (int)(sizeof(g.sfx) / sizeof(g.sfx[0])); i++) {
    g.sfx[i].channel = 0;
  }
  /* Hand audio.c the per-id base volumes its decompile lost, so
   * play_positional_sound_effect's existing `vol * (0x30 - dist) / 0x28`
   * -- the same curve the DOS engine uses -- has a real base to scale
   * instead of zero. See DAT_0023c2b0_backing's comment there. */
  for (int id = 0; id < g.sounds.count; id++) {
    uw_sound_effect e;
    if (uw_sound_effect_at(&g.sounds, id, &e)) {
      audio_set_effect_base_volume(id, e.velocity);
    }
  }

  g.live = 1;
  DEBUG(INFO, "[audio] DOS audio mode ready (%s): OPL2 at %dHz -> %dHz, %d effects, %d timbres\n",
        g.prefer_wav ? "hybrid: sampled effects where available" : "dos: every effect a DOS note",
        UW_OPL_RATE, g.out_rate, g.sounds.count, g.timbres.count);
  return 1;

fail:
  uw_sounds_close(&g.sounds);
  uw_bank_close(&g.timbres);
  uw_free(&g.adlib_file);
  memset(&g, 0, sizeof(g));
  return 0;
}

int platform_dosmidi_xmi_path(const char *win_mod_path, char *out, unsigned int out_sz)
{
  if (!win_mod_path || !out || out_sz == 0) {
    return 0;
  }

  const char *base = win_mod_path;
  for (const char *p = win_mod_path; *p; p++) {
    if (*p == '\\' || *p == '/') {
      base = p + 1;
    }
  }

  /* "uw01.mod" -> "AW01.XMI": the two digits are already the octal-style
   * pair play_music_track built, so only the stem's letters and the
   * extension change. */
  const char *dot = strrchr(base, '.');
  size_t stem_len = dot ? (size_t)(dot - base) : strlen(base);
  if (stem_len < 3 || stem_len >= 32) {
    return 0;
  }
  char stem[32];
  for (size_t i = 0; i < stem_len; i++) {
    char c = base[i];
    stem[i] = (c >= 'a' && c <= 'z') ? (char)(c - 'a' + 'A') : c;
  }
  stem[stem_len] = '\0';
  if (stem[0] != 'U' || stem[1] != 'W') {
    return 0;
  }
  stem[0] = 'A'; /* UWnn -> AWnn, the AdLib-voiced variant */

  char file[64];
  snprintf(file, sizeof(file), "%s.XMI", stem);
  return dos_sound_path(file, out, out_sz);
}

/* The patch for (bank, program) out of UW.AD, installed in the driver's
 * cache if it isn't already there. */
static int timbre_ready(uint8_t bank, uint8_t program)
{
  if (uw_ail_timbre_installed(&g.ail, bank, program)) {
    return 1;
  }
  size_t len = 0;
  const uint8_t *patch = uw_bank_patch(&g.timbres, program, bank, &len);
  if (!patch) {
    return 0;
  }
  uw_ail_install_timbre(&g.ail, bank, program, patch, len);
  return 1;
}

int platform_dosmidi_load_file(const char *real_path)
{
  if (!g.live || !real_path) {
    return 0;
  }

  if (g.seq >= 0) {
    uw_ail_stop_sequence(&g.ail, g.seq);
    uw_ail_release_sequence(&g.ail, g.seq);
    g.seq = -1;
  }
  uw_free(&g.xmi);

  g.xmi = uw_read_file(real_path);
  if (!g.xmi.data) {
    DEBUG(WARN, "[audio] DOS audio: cannot read %s (%s)\n",
          real_path, g.xmi.why ? g.xmi.why : "?");
    return 0;
  }

  g.seq = uw_ail_register_sequence(&g.ail, g.xmi.data, g.xmi.size, 0);
  if (g.seq < 0) {
    DEBUG(WARN, "[audio] DOS audio: %s is not an XMI sequence\n", real_path);
    uw_free(&g.xmi);
    return 0;
  }

  /* The driver names the timbres it still needs, one per call, until it has
   * them all; each is bank<<8 | program in UW.AD. */
  int req;
  while ((req = uw_ail_timbre_request(&g.ail, g.seq)) != 0xffff) {
    if (!timbre_ready((uint8_t)(req >> 8), (uint8_t)(req & 0xff))) {
      DEBUG(WARN, "[audio] DOS audio: the timbre bank has no patch %d:%d\n",
            req >> 8, req & 0xff);
      break; /* the driver will play it on whatever the cache holds */
    }
  }

  DEBUG(INFO, "[audio] loaded DOS XMI track %s (music volume %d%%)\n",
        real_path, g.music_volume);
  return 1;
}

void platform_dosmidi_start(void)
{
  if (g.live && g.seq >= 0) {
    uw_ail_start_sequence(&g.ail, g.seq);
    /* After the start, not before: uw_ail_start_sequence resets the
     * sequence (seq_reset), which puts its volume back to full. */
    if (g.music_volume != 100) {
      uw_ail_set_sequence_volume(&g.ail, g.seq, g.music_volume, 0);
    }
  }
}

void platform_dosmidi_stop(void)
{
  if (g.live && g.seq >= 0) {
    uw_ail_stop_sequence(&g.ail, g.seq);
  }
}

void platform_dosmidi_play_effect(int id, int velocity, int pan)
{
  if (!g.live) {
    return;
  }
  /* Every way this can decline is traced: the effect path has several
   * silent exits and, with 24 ids and four voices, "nothing happened" is
   * otherwise impossible to tell apart from "it played quietly". */
  if (id < 0 || id >= g.sounds.count) {
    DEBUG(INFO, "[audio] dos effect %d: outside SOUNDS.DAT's 0..%d (the playable "
                "instrument's ids 40-59 land here; the table does not cover them)\n",
          id, g.sounds.count - 1);
    return;
  }
  uw_sound_effect e;
  if (!uw_sound_effect_at(&g.sounds, id, &e)) {
    DEBUG(WARN, "[audio] dos effect %d: no record\n", id);
    return;
  }
  /* The caller's attenuated volume and pan when it has them, else the
   * table's own velocity and a centred pan. Zero is a real answer, not a
   * missing one: the distance curve reaches it at the 0x30 range limit. */
  if (velocity < 0) velocity = e.velocity;
  if (velocity > 0x7f) velocity = 0x7f;
  if (pan < 0 || pan > 0x7f) pan = 0x40;
  if (velocity == 0) {
    DEBUG(INFO, "[audio] dos effect %d dropped: attenuated to silence\n", id);
    return;
  }

  /* Bank 1 is the sound-effects bank: its timbres are the time-variant
   * effects, not plain instruments (see the header). */
  if (!timbre_ready(1, e.program)) {
    DEBUG(WARN, "[audio] dos effect %d: UW.AD has no bank 1 patch %u\n", id, e.program);
    return;
  }

  /* First free of four slots, and drop the effect when all four are busy
   * -- the original's own policy (sound_effect_start returns 0xff there).
   *
   * Deliberately does NOT stop a sounding voice to make room. An earlier
   * version replaced a retriggered id instead, out of a worry that the long
   * movement sound would stack; it cannot. movement.c only starts that
   * sound when its handle is -1, i.e. when it is not already playing (see
   * the DAT_00086e84 guard there), so the game never asks twice. What the
   * replace did cause was an audible click: stopping a voice and
   * immediately relocking the channel churns through a note-off, CC 123,
   * a channel release that resends nine cached controllers, and then the
   * whole setup sequence again, all inside one driver tick. */
  int slot = -1;
  for (int i = 0; i < (int)(sizeof(g.sfx) / sizeof(g.sfx[0])); i++) {
    if (!g.sfx[i].channel) { slot = i; break; }
  }
  if (slot < 0) {
    DEBUG(INFO, "[audio] dos effect %d dropped: all four effect voices busy "
                "(ids %d/%d/%d/%d still sounding)\n",
          id, g.sfx[0].id, g.sfx[1].id, g.sfx[2].id, g.sfx[3].id);
    return; /* the original drops it too -- sound_effect_start returns 0xff */
  }

  int ch = uw_ail_lock_channel(&g.ail);
  if (ch <= 0) {
    DEBUG(INFO, "[audio] dos effect %d dropped: no channel free to lock\n", id);
    return;
  }
  DEBUG(INFO, "[audio] dos effect %d: bank1 prog %u note %u vel %d pan %d for %.2fs on channel %d\n",
        id, e.program, e.note, velocity, pan, e.duration / 256.0, ch);

  /* The sequence the DOS engine sends, in its order: the bank, the program,
   * all controllers off, full volume and expression, centre pan, note on. */
  uw_ail_send_voice(&g.ail, (uint8_t)(0xaf + ch), 0x72, 1);   /* CC 114: timbre bank 1 */
  uw_ail_send_voice(&g.ail, (uint8_t)(0xbf + ch), e.program, 0);
  uw_ail_send_voice(&g.ail, (uint8_t)(0xaf + ch), 0x79, 0);   /* CC 121: controllers off */
  uw_ail_send_voice(&g.ail, (uint8_t)(0xaf + ch), 7, 0x7f);
  uw_ail_send_voice(&g.ail, (uint8_t)(0xaf + ch), 0x0b, 0x7f);
  uw_ail_send_voice(&g.ail, (uint8_t)(0xaf + ch), 0x0a, (uint8_t)pan);
  uw_ail_send_voice(&g.ail, (uint8_t)(0x8f + ch), e.note, (uint8_t)velocity);

  /* duration is in 1/256s; the timer runs at UW_AIL_TICK_HZ. */
  int ticks = (int)(((long)e.duration * UW_AIL_TICK_HZ) / 256);
  g.sfx[slot].channel = ch;
  g.sfx[slot].id = id;
  g.sfx[slot].note = e.note;
  g.sfx[slot].ticks_left = ticks > 0 ? ticks : 1;
}

/* Silences one effect slot and gives its channel back. CC 123 (all notes
 * off) as well as the note-off because the note-off alone can leave a
 * bank-1 effect's own release stream still running -- these timbres are
 * command streams, not plain notes, so they do not necessarily stop just
 * because the key went up. */
static void release_sfx_slot(int i)
{
  int ch = g.sfx[i].channel;
  if (!ch) {
    return;
  }
  uw_ail_send_voice(&g.ail, (uint8_t)(0x7f + ch), (uint8_t)g.sfx[i].note, 0);
  uw_ail_send_voice(&g.ail, (uint8_t)(0xaf + ch), 0x7b, 0);
  uw_ail_release_channel(&g.ail, ch);
  g.sfx[i].channel = 0;
}

void platform_dosmidi_stop_effect(int id)
{
  if (!g.live) {
    return;
  }
  for (int i = 0; i < (int)(sizeof(g.sfx) / sizeof(g.sfx[0])); i++) {
    if (g.sfx[i].channel && g.sfx[i].id == id) {
      release_sfx_slot(i);
    }
  }
}

void platform_dosmidi_set_music_volume(int percent)
{
  if (percent < 0) percent = 0;
  if (percent > 100) percent = 100;
  g.music_volume = percent;
  if (g.live && g.seq >= 0) {
    uw_ail_set_sequence_volume(&g.ail, g.seq, percent, 0);
  }
}

/* One driver timer call: the effect voices' durations, then the sequencer
 * (which calls the voice layer's own service through synth_tick). */
static void driver_tick(void)
{
  for (int i = 0; i < (int)(sizeof(g.sfx) / sizeof(g.sfx[0])); i++) {
    if (!g.sfx[i].channel) {
      continue;
    }
    if (--g.sfx[i].ticks_left <= 0) {
      release_sfx_slot(i);
    }
  }
  uw_ail_tick(&g.ail);
}

/* The next chip sample, generating another tick's worth when the current
 * one is spent. */
static short next_chip_sample(void)
{
  if (g.tick_pos >= g.tick_len) {
    driver_tick();
    int n = (int)CHIP_SAMPLES_PER_TICK;
    if (n > (int)(sizeof(g.tick_buf) / sizeof(g.tick_buf[0]))) {
      n = (int)(sizeof(g.tick_buf) / sizeof(g.tick_buf[0]));
    }
    uw_opl_render(&g.opl, g.tick_buf, n);
    /* The output coupling, sample by sample, as the card's capacitor. */
    for (int i = 0; i < n; i++) {
      int x = g.tick_buf[i];
      int y = x - g.dc_x + (g.dc_y * 255) / 256;
      g.dc_x = x;
      g.dc_y = y;
      g.tick_buf[i] = (short)(y > 32767 ? 32767 : (y < -32768 ? -32768 : y));
    }
    g.tick_len = n;
    g.tick_pos = 0;
  }
  return g.tick_buf[g.tick_pos++];
}

int platform_dosmidi_render(short *stream, int frames)
{
  if (!g.live || !stream || frames <= 0) {
    return 0;
  }

  const double step = (double)UW_OPL_RATE / (double)g.out_rate;
  if (!g.primed) {
    g.prev_sample = next_chip_sample();
    g.cur_sample = next_chip_sample();
    g.src_frac = 0.0;
    g.primed = 1;
  }

  for (int i = 0; i < frames; i++) {
    double t = g.src_frac;
    int v = (int)(g.prev_sample + (g.cur_sample - g.prev_sample) * t);
    short s = (short)(v > 32767 ? 32767 : (v < -32768 ? -32768 : v));
    stream[i * 2] = s;
    stream[i * 2 + 1] = s; /* the chip is mono; both ears get it */

    g.src_frac += step;
    while (g.src_frac >= 1.0) {
      g.src_frac -= 1.0;
      g.prev_sample = g.cur_sample;
      g.cur_sample = next_chip_sample();
    }
  }
  return frames;
}

void platform_dosmidi_shutdown(void)
{
  if (g.live && g.seq >= 0) {
    uw_ail_stop_sequence(&g.ail, g.seq);
    uw_ail_release_sequence(&g.ail, g.seq);
  }
  uw_free(&g.xmi);
  uw_sounds_close(&g.sounds);
  uw_bank_close(&g.timbres);
  uw_free(&g.adlib_file);
  memset(&g, 0, sizeof(g));
}

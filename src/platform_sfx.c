/* Real one-shot sound-effect playback backend: a small SDL2 WAV mixer
 * fed by genuine "WAVE"-type PE resources extracted once from
 * data/UU.exe. Split out of audio.c into its own file/header
 * (platform_sfx.h) specifically so this backend can be swapped out
 * later without touching audio.c's own call site
 * (trigger_sound_sample_note) at all -- that function calls the
 * platform_sfx_* functions declared in platform_sfx.h and nothing
 * else. Mirrors platform_music.c's split/role for background music;
 * read that file first if this is the first platform_* backend you're
 * looking at.
 */
#include "headers/platform_sfx.h"
#include "headers/platform_dosmidi.h"
#include "headers/platform_music.h"
#include "headers/audio.h"
#include "headers/debug.h"
#include "headers/file_io.h"
#include "headers/options.h"
#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* --- Real SFX playback backend (PE resource extraction + SDL2 mixer) ----
 *
 * trigger_sound_sample_note's own decompiled body (audio.c, "was
 * FUN_00073140") triggers sample id param_1+800 as a one-shot note by
 * calling load_and_resample_wave_sample(DAT_0023c3bc, DAT_0023c540,
 * param_1+800), which in turn calls FindResourceW/LoadResource to pull
 * resource id `param_1+800` of type "WAVE" (the literal string, not
 * the numeric RT_* constant -- see u_WAVE_0008686c in audio.c) out of
 * the running module. Confirmed via direct PE-level parsing of the
 * real data/UU.exe (a genuine Windows CE PE32/MIPS executable): it
 * really does embed exactly 36 "WAVE" resources, ids 801-859 with
 * gaps, each an 8-bit mono 11025Hz PCM RIFF/WAVE file -- this is a
 * real, separate asset pool, not a guess and not related to the
 * MOD-tracker engine's own internal sample tables.
 *
 * None of that chain can ever run, though, for two independent
 * reasons:
 *
 *   1. FindResourceW/LoadResource (ordinal_stubs.c) are both
 *      hardcoded-0 stubs -- same shape as cpp_operator_new's stub that
 *      permanently killed the MOD engine (see audio.c's "Real MOD
 *      playback backend" block comment) -- so
 *      load_and_resample_wave_sample's very first call always fails.
 *   2. Even with real resource APIs, load_and_resample_wave_sample's
 *      own internal struct-packing is the identical 64-bit-unsafe
 *      disease as the MOD engine's: it packs a cpp_operator_new()
 *      pointer into a slot's +0x12..+0x15 fields 1 byte at a time via
 *      4 separate `*(char*)(...) = (char)(...)` writes, then
 *      reconstructs it with CONCAT13/CONCAT12/CONCAT11 -- silently
 *      truncating any real 64-bit heap address. Not safe to fix in
 *      place across its many call-site-adjacent helpers; a fresh
 *      parallel path, exactly like the MOD engine's, is built here
 *      instead.
 *   3. trigger_sound_sample_note's own body is additionally gated by
 *      `if (DAT_0023c3b8 != 0)`, and DAT_0023c3b8 (the dead decompiled
 *      MOD engine's COM-style handle) is deliberately never assigned
 *      a value anywhere in this codebase now -- see platform_music.c's
 *      own block comment for why. So even a hypothetically-fixed
 *      load_and_resample_wave_sample would still never execute.
 *
 * Sound effects are played through this small, separate backend
 * instead, hooked in at trigger_sound_sample_note's single call site
 * (see that function's own comment in audio.c) via platform_sfx_play
 * -- called directly, ahead of (not inside) the dead DAT_0023c3b8
 * gate, the same way play_music_track's real interception sits ahead
 * of its own dead construct_and_load_mod_player chain.
 *
 * Extraction: a minimal, targeted PE resource-directory parser below
 * (pe_load/pe_rva_to_offset/extract_all_wave_resources) -- NOT a
 * general-purpose PE library, just enough to read the DOS/PE headers,
 * find the resource data directory entry, walk its 3 levels (Type
 * "WAVE" -> numeric resource ID -> language) via the section table
 * for every RVA->file-offset conversion (never assumed identity), and
 * copy each resource's raw RIFF/WAVE bytes out. This runs once, at
 * platform_sfx_init() time, writing any resource not already found at
 * data/SOUND/SFX/<id>.wav (see path choice below) so every later
 * platform_sfx_play() call is a plain WAV file load, not a repeated PE
 * parse.
 *
 * Path choice: data/SOUND/ already holds the \SOUND\uwNN.mod music
 * tracks and (as a sibling pool, out of scope here --
 * play_numbered_voice_sample) \SOUND\VOCnn.wav files side by side, no
 * subfolder. These 36 WAVE resources get their own data/SOUND/SFX/
 * subfolder instead of sitting loose next to those, because unlike
 * the MOD/VOC files (which ship as real files in the original
 * install) these never existed as standalone files at all -- they are
 * synthesized here, once, by extracting them out of UU.exe, so a
 * dedicated subfolder makes that provenance obvious at a glance and
 * keeps 36 new files from cluttering data/SOUND/'s existing listing.
 * Filenames are just "<id>.wav" (the raw resource id, e.g. 801.wav),
 * matching the id-keyed lookup trigger_sound_sample_note already does
 * (param_1+800) and nothing else -- no extra padding/prefix needed
 * since these aren't matched against any original install manifest.
 */

/* ---- Minimal PE resource-directory parser ------------------------- */

#define PE_MAX_SECTIONS 64

typedef struct {
  const unsigned char *data;
  size_t size;
} pe_buf_t;

typedef struct {
  unsigned int virtual_address;
  unsigned int virtual_size;
  unsigned int raw_size;
  unsigned int raw_offset;
} pe_section_t;

typedef struct {
  pe_buf_t buf;
  pe_section_t sections[PE_MAX_SECTIONS];
  unsigned int num_sections;
  unsigned int resource_rva;
  unsigned int resource_size;
} pe_image_t;

typedef struct {
  unsigned int name_or_id;    /* top bit already masked off */
  unsigned int offset_to_data; /* top bit NOT masked -- caller checks it */
  int is_named;
} pe_res_entry_t;

static int pe_rd_u16(const pe_buf_t *b, unsigned int off, unsigned short *out)
{
  if ((size_t)off + 2 > b->size) return 0;
  *out = (unsigned short)(b->data[off] | ((unsigned int)b->data[off + 1] << 8));
  return 1;
}

static int pe_rd_u32(const pe_buf_t *b, unsigned int off, unsigned int *out)
{
  if ((size_t)off + 4 > b->size) return 0;
  *out = (unsigned int)b->data[off] | ((unsigned int)b->data[off + 1] << 8) |
         ((unsigned int)b->data[off + 2] << 16) | ((unsigned int)b->data[off + 3] << 24);
  return 1;
}

/* Parses just enough of the DOS header / PE header / section table /
 * resource data-directory entry to locate the resource directory --
 * bails out (returning 0, with a DEBUG WARN) on anything that doesn't
 * look like the expected PE32 shape rather than guessing. */
static int pe_load(const unsigned char *data, size_t size, pe_image_t *img)
{
  memset(img, 0, sizeof(*img));
  img->buf.data = data;
  img->buf.size = size;

  if (size < 0x40 || data[0] != 'M' || data[1] != 'Z') {
    DEBUG(WARN, "[audio] UU.exe: missing MZ signature -- not a PE file\n");
    return 0;
  }
  unsigned int e_lfanew;
  if (!pe_rd_u32(&img->buf, 0x3C, &e_lfanew)) return 0;
  if ((size_t)e_lfanew + 24 > size ||
      !(data[e_lfanew] == 'P' && data[e_lfanew + 1] == 'E' &&
        data[e_lfanew + 2] == 0 && data[e_lfanew + 3] == 0)) {
    DEBUG(WARN, "[audio] UU.exe: missing PE signature at 0x%x\n", e_lfanew);
    return 0;
  }

  /* IMAGE_FILE_HEADER starts right after the 4-byte "PE\0\0" signature:
     NumberOfSections is its own +2, SizeOfOptionalHeader is its +16 --
     both offsets below are relative to e_lfanew, so each needs that
     +4 signature size folded in too. */
  unsigned short num_sections, size_opt_header, magic;
  if (!pe_rd_u16(&img->buf, e_lfanew + 4 + 2, &num_sections)) return 0;
  if (!pe_rd_u16(&img->buf, e_lfanew + 4 + 16, &size_opt_header)) return 0;

  unsigned int opt_off = e_lfanew + 24; /* 4 (sig) + 20 (IMAGE_FILE_HEADER) */
  if (!pe_rd_u16(&img->buf, opt_off, &magic)) return 0;
  if (magic != 0x10b) {
    /* 0x20b (PE32+) never shows up on this MIPS/WinCE target; bail
       rather than mis-parse an optional header shaped differently. */
    DEBUG(WARN, "[audio] UU.exe: unexpected optional header magic 0x%x (not PE32)\n", magic);
    return 0;
  }

  /* IMAGE_OPTIONAL_HEADER32's DataDirectory array starts at a fixed
     96-byte offset from the optional header's own start; entry 2 is
     IMAGE_DIRECTORY_ENTRY_RESOURCE. */
  unsigned int resource_entry_off = opt_off + 96 + 2 * 8;
  if (!pe_rd_u32(&img->buf, resource_entry_off, &img->resource_rva)) return 0;
  if (!pe_rd_u32(&img->buf, resource_entry_off + 4, &img->resource_size)) return 0;
  if (img->resource_rva == 0) {
    DEBUG(WARN, "[audio] UU.exe has no resource directory -- SFX WAVE extraction skipped\n");
    return 0;
  }

  unsigned int sect_off = opt_off + size_opt_header;
  if (num_sections > PE_MAX_SECTIONS) {
    DEBUG(WARN, "[audio] UU.exe: %u sections exceeds parser cap %d, truncating\n",
          num_sections, PE_MAX_SECTIONS);
    num_sections = PE_MAX_SECTIONS;
  }
  img->num_sections = num_sections;
  for (unsigned int i = 0; i < num_sections; i++) {
    unsigned int base = sect_off + i * 40;
    unsigned int vsize, vaddr, rsize, roff;
    if (!pe_rd_u32(&img->buf, base + 8, &vsize) || !pe_rd_u32(&img->buf, base + 12, &vaddr) ||
        !pe_rd_u32(&img->buf, base + 16, &rsize) || !pe_rd_u32(&img->buf, base + 20, &roff)) {
      img->num_sections = i;
      break;
    }
    img->sections[i].virtual_size = vsize;
    img->sections[i].virtual_address = vaddr;
    img->sections[i].raw_size = rsize;
    img->sections[i].raw_offset = roff;
  }
  return 1;
}

/* Resolves an RVA to a real file offset by finding the section whose
 * virtual range contains it -- deliberately not assuming raw and
 * virtual offsets line up (per-section file alignment can differ). */
static int pe_rva_to_offset(const pe_image_t *img, unsigned int rva, unsigned int *out_off)
{
  for (unsigned int i = 0; i < img->num_sections; i++) {
    const pe_section_t *s = &img->sections[i];
    unsigned int span = s->virtual_size ? s->virtual_size : s->raw_size;
    if (rva >= s->virtual_address && rva < s->virtual_address + span) {
      unsigned int delta = rva - s->virtual_address;
      if (delta >= s->raw_size) return 0; /* in the section's zero-filled tail */
      *out_off = s->raw_offset + delta;
      return (size_t)*out_off < img->buf.size;
    }
  }
  return 0;
}

static int pe_read_res_dir_header(const pe_image_t *img, unsigned int dir_off,
                                   unsigned short *named, unsigned short *ids)
{
  return pe_rd_u16(&img->buf, dir_off + 12, named) && pe_rd_u16(&img->buf, dir_off + 14, ids);
}

static int pe_read_res_entry(const pe_image_t *img, unsigned int dir_off, unsigned int index,
                              pe_res_entry_t *out)
{
  unsigned int eoff = dir_off + 16 + index * 8;
  unsigned int name_field, data_field;
  if (!pe_rd_u32(&img->buf, eoff, &name_field) || !pe_rd_u32(&img->buf, eoff + 4, &data_field))
    return 0;
  out->is_named = (name_field & 0x80000000u) != 0;
  out->name_or_id = name_field & 0x7fffffffu;
  out->offset_to_data = data_field;
  return 1;
}

/* Compares a resource directory's IMAGE_RESOURCE_DIR_STRING_U (a
 * length-prefixed, non-null-terminated UTF-16LE string) against a
 * plain ASCII literal -- just enough to recognize the "WAVE" type
 * name, not a general string comparison. */
static int pe_res_name_equals(const pe_image_t *img, unsigned int name_rva_delta, const char *ascii)
{
  unsigned int str_rva = img->resource_rva + name_rva_delta;
  unsigned int str_off;
  if (!pe_rva_to_offset(img, str_rva, &str_off)) return 0;
  unsigned short len;
  if (!pe_rd_u16(&img->buf, str_off, &len)) return 0;
  size_t need = strlen(ascii);
  if (len != need) return 0;
  for (size_t i = 0; i < need; i++) {
    unsigned short ch;
    if (!pe_rd_u16(&img->buf, str_off + 2 + (unsigned int)i * 2, &ch)) return 0;
    if (ch != (unsigned char)ascii[i]) return 0;
  }
  return 1;
}

/* Reads the whole file at win_path into a freshly malloc'd buffer,
 * same pattern as platform_music_load_track's own file-read (see
 * that function's comment) -- except this is read once, into a
 * throwaway buffer that lives only for the duration of
 * extract_all_wave_resources, not kept around afterward. */
static unsigned char *read_whole_file(const char *win_path, size_t *out_size)
{
  FILE *fp = (FILE *)uw_file_fopen(win_path, "rb");
  if (!fp) return NULL;
  fseek(fp, 0, SEEK_END);
  long size = ftell(fp);
  fseek(fp, 0, SEEK_SET);
  if (size <= 0) {
    fclose(fp);
    return NULL;
  }
  unsigned char *data = (unsigned char *)malloc((size_t)size);
  if (!data) {
    fclose(fp);
    return NULL;
  }
  size_t got = fread(data, 1, (size_t)size, fp);
  fclose(fp);
  if (got != (size_t)size) {
    free(data);
    return NULL;
  }
  *out_size = (size_t)size;
  return data;
}

/* One-time extraction pass: walks UU.exe's real PE resource directory
 * for the "WAVE" type, and for every numeric resource id found under
 * it that doesn't already have a data/SOUND/SFX/<id>.wav on disk,
 * copies its raw RIFF/WAVE bytes out to exactly that path (see this
 * file's block comment for the path/naming choice). Fails soft at
 * every step -- a missing/unparseable UU.exe (expected in test
 * fixtures that only symlink a subset of files) just means SFX stay
 * silent, logged once via DEBUG WARN, never a crash. */
static void extract_all_wave_resources(void)
{
  size_t filesize = 0;
  unsigned char *filedata = read_whole_file("\\UU.exe", &filesize);
  if (!filedata) {
    DEBUG(WARN, "[audio] UU.exe not found/readable -- SFX WAVE resource extraction skipped "
                "(sound effects will be silent)\n");
    return;
  }

  pe_image_t img;
  if (!pe_load(filedata, filesize, &img)) {
    /* pe_load already logged the specific reason. */
    free(filedata);
    return;
  }

  unsigned int root_off;
  if (!pe_rva_to_offset(&img, img.resource_rva, &root_off)) {
    DEBUG(WARN, "[audio] UU.exe: resource directory RVA 0x%x doesn't map to any section\n",
          img.resource_rva);
    free(filedata);
    return;
  }
  unsigned short named, ids;
  if (!pe_read_res_dir_header(&img, root_off, &named, &ids)) {
    free(filedata);
    return;
  }

  unsigned int wave_type_off = 0;
  int found_wave = 0;
  for (unsigned int i = 0; i < (unsigned int)named + ids; i++) {
    pe_res_entry_t e;
    if (!pe_read_res_entry(&img, root_off, i, &e)) break;
    if (!e.is_named) continue; /* "WAVE" is a custom named type, not a numeric RT_* id */
    if (pe_res_name_equals(&img, e.name_or_id, "WAVE")) {
      if (!(e.offset_to_data & 0x80000000u)) continue; /* must lead to a subdirectory */
      unsigned int sub_rva = img.resource_rva + (e.offset_to_data & 0x7fffffffu);
      if (pe_rva_to_offset(&img, sub_rva, &wave_type_off)) {
        found_wave = 1;
        break;
      }
    }
  }
  if (!found_wave) {
    DEBUG(WARN, "[audio] UU.exe has no \"WAVE\"-type resources -- SFX will be silent\n");
    free(filedata);
    return;
  }

  unsigned short wnamed, wids;
  if (!pe_read_res_dir_header(&img, wave_type_off, &wnamed, &wids)) {
    free(filedata);
    return;
  }

  int extracted = 0, already_present = 0, failed = 0;
  for (unsigned int i = 0; i < (unsigned int)wnamed + wids; i++) {
    pe_res_entry_t id_entry;
    if (!pe_read_res_entry(&img, wave_type_off, i, &id_entry)) continue;
    if (id_entry.is_named) continue; /* every real WAVE sample is a numeric id (801-859) */
    int id = (int)id_entry.name_or_id;

    char win_path[64];
    snprintf(win_path, sizeof(win_path), "\\SOUND\\SFX\\%d.wav", id);

    FILE *existing = (FILE *)uw_file_fopen(win_path, "rb");
    if (existing) {
      fclose(existing);
      already_present++;
      continue;
    }

    if (!(id_entry.offset_to_data & 0x80000000u)) {
      failed++;
      continue;
    }
    unsigned int lang_dir_rva = img.resource_rva + (id_entry.offset_to_data & 0x7fffffffu);
    unsigned int lang_dir_off;
    if (!pe_rva_to_offset(&img, lang_dir_rva, &lang_dir_off)) {
      failed++;
      continue;
    }
    unsigned short lnamed, lids;
    if (!pe_read_res_dir_header(&img, lang_dir_off, &lnamed, &lids) || (unsigned int)lnamed + lids == 0) {
      failed++;
      continue;
    }
    pe_res_entry_t leaf_entry;
    if (!pe_read_res_entry(&img, lang_dir_off, 0, &leaf_entry)) {
      failed++;
      continue;
    }
    if (leaf_entry.offset_to_data & 0x80000000u) {
      failed++; /* should be a leaf IMAGE_RESOURCE_DATA_ENTRY, not another subdirectory */
      continue;
    }
    unsigned int data_entry_rva = img.resource_rva + leaf_entry.offset_to_data;
    unsigned int data_entry_off;
    if (!pe_rva_to_offset(&img, data_entry_rva, &data_entry_off)) {
      failed++;
      continue;
    }
    unsigned int wav_data_rva, wav_size;
    if (!pe_rd_u32(&img.buf, data_entry_off, &wav_data_rva) ||
        !pe_rd_u32(&img.buf, data_entry_off + 4, &wav_size)) {
      failed++;
      continue;
    }
    unsigned int wav_file_off;
    if (!pe_rva_to_offset(&img, wav_data_rva, &wav_file_off) ||
        (size_t)wav_file_off + wav_size > img.buf.size) {
      failed++;
      continue;
    }

    FILE *out = (FILE *)uw_file_fopen(win_path, "wb");
    if (!out) {
      DEBUG(WARN, "[audio] could not create %s for WAVE resource %d\n", win_path, id);
      failed++;
      continue;
    }
    size_t wrote = fwrite(filedata + wav_file_off, 1, wav_size, out);
    fclose(out);
    if (wrote != wav_size) {
      DEBUG(WARN, "[audio] short write extracting WAVE resource %d -> %s\n", id, win_path);
      failed++;
      continue;
    }
    extracted++;
  }

  DEBUG(INFO, "[audio] SFX WAVE resource extraction: %d extracted, %d already present, %d failed\n",
        extracted, already_present, failed);
  free(filedata);
}

/* ---- SDL2 one-shot WAV mixer --------------------------------------- */

/* trigger_sound_sample_note calls with param_1+800, and the real
   extracted set is ids 801-859 (confirmed via direct PE parsing of
   UU.exe -- 36 ids present, with real gaps in that range). */
#define SFX_ID_MIN 801
#define SFX_ID_MAX 859
#define SFX_CACHE_SIZE (SFX_ID_MAX - SFX_ID_MIN + 1)

/* A handful of overlapping voices -- enough that footsteps/hits/UI
   clicks firing close together don't cut each other off. Channel-slot
   bookkeeping/allocation (which of up to 16 *hardware* slots a given
   effect logically owns, panning, etc. -- see
   init_all_sound_channel_slots's own comment) is explicitly out of
   scope here; this is just the underlying playback engine a later
   caller can layer that on top of. */
#define SFX_MAX_VOICES 16

typedef struct {
  unsigned char *pcm; /* SDL_malloc'd, AUDIO_S16SYS, mono, 11025Hz */
  unsigned int len;   /* bytes */
  int tried;          /* load (success or failure) already attempted */
  int loaded;         /* 1 if pcm/len are valid */
} sfx_cache_entry_t;

typedef struct {
  const unsigned char *pcm; /* borrowed from a cache entry; never owned */
  unsigned int pos;
  unsigned int len;
} sfx_voice_t;

static sfx_cache_entry_t g_sfx_cache[SFX_CACHE_SIZE];
static sfx_voice_t g_sfx_voices[SFX_MAX_VOICES];
static unsigned int g_sfx_next_steal_voice;
static SDL_AudioDeviceID g_sfx_audiodev;

/* SDL audio device fill callback -- runs on SDL's own audio thread.
   Sums every active voice's remaining PCM into the output buffer via
   SDL_MixAudioFormat (which clips safely on overlap) and advances each
   voice's position; a voice past its own length is simply skipped and
   left for platform_sfx_play to reclaim. SDL already holds this
   device's lock for the callback's duration, same as
   platform_music.c's uwmod_audio_callback. */
static void sfx_audio_callback(void *userdata, Uint8 *stream, int len)
{
  (void)userdata;
  memset(stream, 0, (size_t)len);
  int vol = g_opts.sfx_volume < 0 ? 0 : g_opts.sfx_volume > 100 ? 100 : g_opts.sfx_volume;
  vol = vol * SDL_MIX_MAXVOLUME / 100;
  for (int i = 0; i < SFX_MAX_VOICES; i++) {
    sfx_voice_t *v = &g_sfx_voices[i];
    if (!v->pcm || v->pos >= v->len) continue;
    unsigned int remain = v->len - v->pos;
    unsigned int n = remain < (unsigned int)len ? remain : (unsigned int)len;
    SDL_MixAudioFormat(stream, v->pcm + v->pos, AUDIO_S16SYS, n, vol);
    v->pos += n;
  }
}

/* Opens the real SDL2 audio device for SFX mixing and runs the
 * one-time WAVE resource extraction pass. Mirrors platform_music_init
 * (see its comment): sets up its own, separate audio device so a
 * sandboxed/CI environment with no audio hardware still gets a
 * working (just silent) game, never crashing. Extraction is attempted
 * unconditionally (it's plain file I/O, independent of whether an
 * audio device exists), so the extracted files are ready on disk
 * regardless. */
void platform_sfx_init(void)
{
  extract_all_wave_resources();

  if (SDL_GetNumAudioDevices(0) <= 0) {
    DEBUG(WARN, "[audio] no audio output devices available -- SFX playback disabled\n");
    return;
  }

  SDL_AudioSpec want, have;
  memset(&want, 0, sizeof(want));
  /* The real extracted WAVE resources are all 8-bit mono 11025Hz PCM
     (confirmed via `file` on every one of the 36 extracted copies) --
     opening the device at that exact native rate avoids needing any
     resampling math at all; SDL_LoadWAV's own AUDIO_U8 samples are
     widened to AUDIO_S16SYS below (format conversion only, same
     rate/channels) purely so SDL_MixAudioFormat has well-defined
     (non-128-biased) silence to mix overlapping voices into. */
  want.freq = 11025;
  want.format = AUDIO_S16SYS;
  want.channels = 1;
  want.samples = 512; /* small buffer: one-shots need low trigger latency */
  want.callback = sfx_audio_callback;
  want.userdata = NULL;

  g_sfx_audiodev = SDL_OpenAudioDevice(NULL, 0, &want, &have, 0);
  if (g_sfx_audiodev == 0) {
    DEBUG(WARN, "[audio] SDL_OpenAudioDevice (sfx) failed: %s -- SFX playback disabled\n",
          SDL_GetError());
    return;
  }

  DEBUG(INFO, "[audio] sfx playback ready: %dHz %dch %d samples/buffer, %d voices\n",
        have.freq, have.channels, have.samples, SFX_MAX_VOICES);

  /* BUG FIX (real SFX playback, root cause): DAT_00087450 ("sfx subsys
   * initialized") and DAT_0008744c ("sfx enabled") -- audio.c's gate
   * flags for play_positional_sound_effect/play_sound_effect_with_pan/
   * play_sound_effect_at_object -- were stuck at their default of 0
   * (same lost-nonzero-initial-value bug class as DAT_00087454/
   * DAT_00087448 before platform_music_init, confirmed the same way
   * via a live Ghidra memory dump of UU.exe's own .data: both real
   * initial values are 1), so every one of those three real call
   * sites took its early-out `return 0xff` branch unconditionally,
   * never reaching allocate_and_play_sound_channel at all -- this, not
   * that function's own id-whitelist gate, was the actual first-order
   * reason no positional/panned sound effect ever played. Set both to
   * 1 here, exactly mirroring platform_music_init's own
   * DAT_00087454/DAT_00087448 fix, only once this device has actually
   * opened -- left at 0 otherwise (no audio hardware), falling back to
   * the original silent behavior. */
  DAT_00087450 = 1;
  DAT_0008744c = 1;

  SDL_PauseAudioDevice(g_sfx_audiodev, 0);
}

/* Lazily loads+caches data/SOUND/SFX/<id>.wav (extracted by
 * platform_sfx_init, or already present from a previous run) the
 * first time `id` is requested, converting its 8-bit PCM up to
 * AUDIO_S16SYS to match the device opened above. Marks the attempt as
 * tried either way so a missing/corrupt file only ever warns once. */
static void sfx_cache_load(int id, sfx_cache_entry_t *entry)
{
  entry->tried = 1;

  char win_path[64];
  snprintf(win_path, sizeof(win_path), "\\SOUND\\SFX\\%d.wav", id);
  char real_path[4096];
  if (!uw_resolve_win_path(win_path, real_path, sizeof(real_path))) {
    DEBUG(WARN, "[audio] platform_sfx: could not resolve path for resource %d\n", id);
    return;
  }

  SDL_AudioSpec wav_spec;
  Uint8 *wav_buf = NULL;
  Uint32 wav_len = 0;
  if (SDL_LoadWAV(real_path, &wav_spec, &wav_buf, &wav_len) == NULL) {
    DEBUG(WARN, "[audio] platform_sfx: SDL_LoadWAV failed for resource %d (%s): %s\n",
          id, real_path, SDL_GetError());
    return;
  }

  SDL_AudioCVT cvt;
  int cvt_ok = SDL_BuildAudioCVT(&cvt, wav_spec.format, wav_spec.channels, wav_spec.freq,
                                  AUDIO_S16SYS, 1, 11025);
  if (cvt_ok < 0) {
    DEBUG(WARN, "[audio] platform_sfx: SDL_BuildAudioCVT failed for resource %d: %s\n",
          id, SDL_GetError());
    SDL_FreeWAV(wav_buf);
    return;
  }
  if (cvt_ok == 0) {
    /* Already exactly AUDIO_S16SYS/1ch/11025Hz -- no conversion buffer
       needed, just take ownership of SDL_LoadWAV's own buffer. */
    entry->pcm = wav_buf;
    entry->len = wav_len;
    entry->loaded = 1;
    return;
  }

  cvt.len = (int)wav_len;
  Uint8 *cvt_buf = (Uint8 *)SDL_malloc((size_t)cvt.len * cvt.len_mult);
  if (!cvt_buf) {
    DEBUG(ERR, "[audio] platform_sfx: out of memory converting resource %d\n", id);
    SDL_FreeWAV(wav_buf);
    return;
  }
  memcpy(cvt_buf, wav_buf, wav_len);
  cvt.buf = cvt_buf;
  SDL_FreeWAV(wav_buf);
  if (SDL_ConvertAudio(&cvt) != 0) {
    DEBUG(WARN, "[audio] platform_sfx: SDL_ConvertAudio failed for resource %d: %s\n",
          id, SDL_GetError());
    SDL_free(cvt_buf);
    return;
  }

  entry->pcm = cvt_buf;
  entry->len = (unsigned int)cvt.len_cvt;
  entry->loaded = 1;
}

/* Finds a voice slot to play into: prefers one that's finished (pos >=
   len or never used), otherwise steals the next slot in round-robin
   order rather than always clobbering the same one -- at most
   SFX_MAX_VOICES simultaneous one-shots, but overlap beyond that
   degrades gracefully (steals the oldest-ish voice) instead of being
   silently dropped. */
static int sfx_pick_voice(void)
{
  for (int i = 0; i < SFX_MAX_VOICES; i++) {
    if (!g_sfx_voices[i].pcm || g_sfx_voices[i].pos >= g_sfx_voices[i].len) return i;
  }
  int slot = (int)(g_sfx_next_steal_voice % SFX_MAX_VOICES);
  g_sfx_next_steal_voice++;
  return slot;
}

int platform_sfx_has_resource(int resource_id)
{
  if (!g_sfx_audiodev) {
    return 0; /* nothing sampled can be heard -- let the caller fall back */
  }
  if (resource_id < SFX_ID_MIN || resource_id > SFX_ID_MAX) {
    return 0;
  }
  sfx_cache_entry_t *entry = &g_sfx_cache[resource_id - SFX_ID_MIN];
  if (!entry->tried) {
    sfx_cache_load(resource_id, entry);
  }
  return entry->loaded ? 1 : 0;
}

void platform_sfx_play(int resource_id)
{
  /* DOS audio mode plays effects the way the original did: a note on a
   * custom bank-1 timbre through the AdLib driver, not a WAV sample. Taken
   * before the device check below because that path needs no WAV device at
   * all. The id arrives with trigger_sound_sample_note's +800 resource
   * offset already applied; SOUNDS.DAT is indexed by the raw id, so take
   * that 800 back off. (Not SFX_ID_MIN: that is 801, the lowest WAVE
   * resource that happens to exist, which is a different number.)
   *
   * Effect ids the table has no record for are dropped by
   * platform_dosmidi_play_effect -- notably the playable instrument's
   * notes, ids 40-59, which SOUNDS.DAT does not cover.
   *
   * Bracketed by the music device's lock: the DOS driver state this
   * touches is also stepped by the audio callback (platform_dosmidi_render),
   * which runs on SDL's audio thread. */
  if (platform_dos_audio_enabled() && !platform_dos_prefer_wav_effects()) {
    platform_music_lock();
    platform_dosmidi_play_effect(resource_id - 800, -1, -1);
    platform_music_unlock();
    return;
  }

  if (!g_sfx_audiodev) {
    return; /* no device open -- platform_sfx_init already warned once */
  }
  if (resource_id < SFX_ID_MIN || resource_id > SFX_ID_MAX) {
    DEBUG(WARN, "[audio] platform_sfx_play: resource id %d out of the known 801-859 range\n",
          resource_id);
    return;
  }

  sfx_cache_entry_t *entry = &g_sfx_cache[resource_id - SFX_ID_MIN];
  if (!entry->tried) {
    sfx_cache_load(resource_id, entry);
  }
  if (!entry->loaded) {
    return; /* sfx_cache_load already warned */
  }

  SDL_LockAudioDevice(g_sfx_audiodev);
  int slot = sfx_pick_voice();
  g_sfx_voices[slot].pcm = entry->pcm;
  g_sfx_voices[slot].len = entry->len;
  g_sfx_voices[slot].pos = 0;
  SDL_UnlockAudioDevice(g_sfx_audiodev);

  DEBUG(INFO, "[audio] platform_sfx_play: resource %d (%u bytes) -> voice %d\n",
        resource_id, entry->len, slot);
}

void platform_sfx_shutdown(void)
{
  if (g_sfx_audiodev) {
    SDL_CloseAudioDevice(g_sfx_audiodev);
    g_sfx_audiodev = 0;
  }
  for (int i = 0; i < SFX_CACHE_SIZE; i++) {
    if (g_sfx_cache[i].pcm) {
      SDL_free(g_sfx_cache[i].pcm);
    }
    g_sfx_cache[i].pcm = NULL;
    g_sfx_cache[i].len = 0;
    g_sfx_cache[i].tried = 0;
    g_sfx_cache[i].loaded = 0;
  }
  memset(g_sfx_voices, 0, sizeof(g_sfx_voices));
}

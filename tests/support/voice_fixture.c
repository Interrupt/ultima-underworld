#include "unity.h"
#include "src/headers/options.h"
#include "voice_fixture.h"

#include "src/headers/debug.h"
#include "src/headers/file_io.h"
#include "uw_sound.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

/* Exercise the static loader without changing its linkage in the game. */
#include "uw_test_voice_functions.c"

/* ---- the suite's one shared data directory ------------------------------ */

static char g_dir[1024];

/* 64 sample bytes, a shape that is obviously not all-silence so a test can
   tell "the right bytes" from "a zeroed buffer". */
#define VOC_SAMPLE_COUNT 64
static Uint8 g_samples[VOC_SAMPLE_COUNT];

const Uint8 *voice_fixture_voc_samples(unsigned *len)
{
    if (len) *len = VOC_SAMPLE_COUNT;
    return g_samples;
}

/* Write a Creative Voice File holding one type-1 block of 8-bit samples.
   The layout is the one all 42 shipped DOS files use: a 20-byte signature,
   the data offset (26) and version (0x010a) words, a version complement,
   then the block -- type byte, 3-byte length, time constant, pack byte,
   samples -- and a type-0 terminator. */
static void write_voc(const char *path, Uint8 time_constant, Uint8 pack,
                      const Uint8 *samples, unsigned count)
{
    FILE *f = fopen(path, "wb");
    TEST_ASSERT_NOT_NULL_MESSAGE(f, path);
    fwrite("Creative Voice File\x1a", 1, 20, f);
    Uint8 head[6] = {26, 0, 0x0a, 0x01, 0x29, 0x11}; /* offset, version, ~version+0x1234 */
    fwrite(head, 1, sizeof head, f);
    unsigned n = count + 2;                          /* time constant + pack byte */
    Uint8 block[6] = {1, (Uint8)(n & 0xff), (Uint8)((n >> 8) & 0xff),
                      (Uint8)((n >> 16) & 0xff), time_constant, pack};
    fwrite(block, 1, sizeof block, f);
    fwrite(samples, 1, count, f);
    Uint8 terminator = 0;
    fwrite(&terminator, 1, 1, f);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, fclose(f), path);
}

static void copy_file(const char *from, const char *to)
{
    FILE *in = fopen(from, "rb");
    TEST_ASSERT_NOT_NULL_MESSAGE(in, from);
    FILE *out = fopen(to, "wb");
    TEST_ASSERT_NOT_NULL_MESSAGE(out, to);
    char buf[8192];
    size_t n;
    while ((n = fread(buf, 1, sizeof buf, in)) > 0) {
        TEST_ASSERT_EQUAL_UINT_MESSAGE(n, fwrite(buf, 1, n, out), to);
    }
    fclose(in);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, fclose(out), to);
}

const char *voice_fixture_data_dir(void)
{
    if (g_dir[0]) {
        return g_dir;
    }

    char tmpl[] = "/tmp/uw_voice_test_XXXXXX";
    const char *made = mkdtemp(tmpl);
    TEST_ASSERT_NOT_NULL_MESSAGE(made, "mkdtemp for the voice fixture data dir");
    snprintf(g_dir, sizeof g_dir, "%s", made);

    char sound[1200];
    snprintf(sound, sizeof sound, "%s/SOUND", g_dir);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, mkdir(sound, 0755), sound);

    for (unsigned i = 0; i < VOC_SAMPLE_COUNT; i++) {
        g_samples[i] = (Uint8)(0x80 + (int)(i * 3) % 40 - 20);
    }

    char path[1400];

    /* id 0: a real shipped RIFF WAV, so the Pocket PC path is checked
       against an actual file rather than a synthesized one. */
    char from[1400];
    snprintf(from, sizeof from, "%s/SOUND/VOC00.wav", UW_TEST_DATA_DIR);
    snprintf(path, sizeof path, "%s/VOC00.WAV", sound);
    copy_file(from, path);

    /* id 1: DOS set only. */
    snprintf(path, sizeof path, "%s/01.VOC", sound);
    write_voc(path, 173, 0, g_samples, VOC_SAMPLE_COUNT);

    /* id 2: a "VOCnn.WAV" that exists but is not a WAV, alongside a good
       VOC -- the loader has to fall through on an unreadable WAV, not just
       on a missing one. */
    snprintf(path, sizeof path, "%s/VOC02.WAV", sound);
    FILE *junk = fopen(path, "wb");
    TEST_ASSERT_NOT_NULL_MESSAGE(junk, path);
    fwrite("this is not a RIFF file", 1, 23, junk);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, fclose(junk), path);
    snprintf(path, sizeof path, "%s/02.VOC", sound);
    write_voc(path, 173, 0, g_samples, VOC_SAMPLE_COUNT);

    /* id 3: neither file. */

    /* id 4: a VOC the DOS driver could play but this backend cannot --
       pack 4 is 4-bit ADPCM, not the plain 8-bit PCM every shipped file
       actually uses. */
    snprintf(path, sizeof path, "%s/04.VOC", sound);
    write_voc(path, 173, 4, g_samples, VOC_SAMPLE_COUNT);

    /* id 5: a different time constant, so the rate has to come from the
       file rather than a hardcoded 12048. */
    snprintf(path, sizeof path, "%s/05.VOC", sound);
    write_voc(path, 211, 0, g_samples, VOC_SAMPLE_COUNT);

    TEST_ASSERT_EQUAL_INT_MESSAGE(0, options_set("data-dir", g_dir), "options_set data-dir");
    return g_dir;
}

/* ---- calling the real loader -------------------------------------------- */

int voice_fixture_load(int sample_id, voice_source *out)
{
    voice_fixture_data_dir();
    char tens = (char)('0' + sample_id / 10);
    char ones = (char)('0' + sample_id % 10);
    return voice_source_load(sample_id, tens, ones, out);
}

Uint32 voice_fixture_len(const voice_source *s) { return s->len; }
SDL_AudioFormat voice_fixture_format(const voice_source *s) { return s->format; }
int voice_fixture_channels(const voice_source *s) { return s->channels; }
int voice_fixture_freq(const voice_source *s) { return s->freq; }
const char *voice_fixture_path(const voice_source *s) { return s->path; }
const Uint8 *voice_fixture_buf(const voice_source *s) { return s->buf; }

void voice_fixture_release(voice_source *s)
{
    if (s->buf) {
        SDL_free(s->buf);
        s->buf = NULL;
    }
}

void *voice_fixture_alloc_source(void)
{
    void *p = calloc(1, sizeof(voice_source));
    TEST_ASSERT_NOT_NULL(p);
    return p;
}

void voice_fixture_free_source(void *s) { free(s); }

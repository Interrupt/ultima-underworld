#ifndef TESTS_SUPPORT_VOICE_FIXTURE_H
#define TESTS_SUPPORT_VOICE_FIXTURE_H

/* Fixture for platform_voice.c's voice_source_load -- the loader that picks
   between the Pocket PC asset set's RIFF "\SOUND\VOCnn.WAV" and the DOS
   set's Creative "\SOUND\nn.VOC" for the same sample id.

   The function is static and stays that way; its real body is compiled into
   this suite via tests/tools/extract_functions.py (see voice_fixture.c's
   include of the generated translation unit), the same arrangement
   uw_test_look_pacing uses for its own static poller.

   file_io.c caches UW_DATA_DIR on its first use and never re-reads it, so
   the whole suite shares ONE data directory: voice_fixture_data_dir() below
   builds it once, before any file_io call, and the per-id files it contains
   are laid out so each test gets the case it needs from a different id. */

#include <SDL.h>

struct voice_source;
typedef struct voice_source voice_source;

/* Builds (once) the suite's temporary data directory and points UW_DATA_DIR
   at it, returning its path. Contents, by sample id:

     0  SOUND/VOC00.WAV  a real RIFF WAV copied from the shipped asset set
     1  SOUND/01.VOC     a synthesized Creative VOC, time constant 173
     2  SOUND/VOC02.WAV  deliberately not a WAV, plus a valid SOUND/02.VOC
     3  (nothing)
     4  SOUND/04.VOC     a VOC whose pack byte says 4-bit ADPCM
     5  SOUND/05.VOC     a VOC with a different time constant (211)

   Aborts the test on any setup failure rather than letting a later
   assertion fail for the wrong reason. */
const char *voice_fixture_data_dir(void);

/* The sample bytes voice_fixture_data_dir wrote into each synthesized VOC,
   so a test can assert the loader hands back exactly those. */
const Uint8 *voice_fixture_voc_samples(unsigned *len);

/* Calls the real static voice_source_load for `sample_id`, deriving the two
   filename digits the way platform_voice_play does. Returns its result;
   `out->buf` is the caller's to SDL_free on success. */
int voice_fixture_load(int sample_id, voice_source *out);

/* Accessors, so test_voice.c needs no copy of the struct layout. */
Uint32 voice_fixture_len(const voice_source *s);
SDL_AudioFormat voice_fixture_format(const voice_source *s);
int voice_fixture_channels(const voice_source *s);
int voice_fixture_freq(const voice_source *s);
const char *voice_fixture_path(const voice_source *s);
const Uint8 *voice_fixture_buf(const voice_source *s);
void voice_fixture_release(voice_source *s);

/* Enough storage for a voice_source without test_voice.c seeing its
   layout; checked against the real size in voice_fixture.c. */
void *voice_fixture_alloc_source(void);
void voice_fixture_free_source(void *s);

#endif

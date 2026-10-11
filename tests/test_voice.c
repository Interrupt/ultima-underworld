/* platform_voice.c's voice_source_load: picking between the two asset sets'
   spellings of the same cutscene-speech pool.

   The Pocket PC set ships it as RIFF WAV ("\SOUND\VOCnn.wav"); the DOS set
   ships the same 42 ids as Creative VOC under their bare number
   ("\SOUND\nn.VOC"), which SDL_LoadWAV cannot read. Both have to work, and
   the port has to pick without being told which set it is looking at. */

#include "unity.h"
#include "voice_fixture.h"

#include <string.h>

void setUp(void) {}
void tearDown(void) {}

static void test_pocket_pc_wav_loads_with_its_own_header_spec(void)
{
    voice_source *s = voice_fixture_alloc_source();
    TEST_ASSERT_TRUE(voice_fixture_load(0, s));

    /* The real shipped VOC00.wav: 8-bit unsigned mono. Whatever rate its
       own header carries is the rate that must come back -- the two sets
       disagree on it (the port resampled most ids to 11025Hz), so the
       loader may never substitute a constant. */
    TEST_ASSERT_EQUAL_HEX16(AUDIO_U8, voice_fixture_format(s));
    TEST_ASSERT_EQUAL_INT(1, voice_fixture_channels(s));
    TEST_ASSERT_EQUAL_INT(12048, voice_fixture_freq(s));
    TEST_ASSERT_EQUAL_UINT32(20711, voice_fixture_len(s));
    TEST_ASSERT_NOT_NULL(strstr(voice_fixture_path(s), "VOC00.WAV"));

    voice_fixture_release(s);
    voice_fixture_free_source(s);
}

static void test_dos_voc_is_found_when_there_is_no_wav(void)
{
    voice_source *s = voice_fixture_alloc_source();
    TEST_ASSERT_TRUE(voice_fixture_load(1, s));

    unsigned expect_len;
    const Uint8 *expect = voice_fixture_voc_samples(&expect_len);
    TEST_ASSERT_EQUAL_HEX16(AUDIO_U8, voice_fixture_format(s));
    TEST_ASSERT_EQUAL_INT(1, voice_fixture_channels(s));
    /* 1000000 / (256 - 173) -- the rate the DOS digital driver would have
       played it at, read from the file's time constant. */
    TEST_ASSERT_EQUAL_INT(12048, voice_fixture_freq(s));
    TEST_ASSERT_EQUAL_UINT32(expect_len, voice_fixture_len(s));
    TEST_ASSERT_NOT_NULL(strstr(voice_fixture_path(s), "01.VOC"));
    /* The samples themselves, not just the length: the block header's own
       two bytes sit immediately before them and must not be included. */
    TEST_ASSERT_EQUAL_UINT8_ARRAY(expect, voice_fixture_buf(s), expect_len);

    voice_fixture_release(s);
    voice_fixture_free_source(s);
}

static void test_unreadable_wav_still_falls_through_to_the_voc(void)
{
    voice_source *s = voice_fixture_alloc_source();
    TEST_ASSERT_TRUE(voice_fixture_load(2, s));

    unsigned expect_len;
    const Uint8 *expect = voice_fixture_voc_samples(&expect_len);
    TEST_ASSERT_NOT_NULL(strstr(voice_fixture_path(s), "02.VOC"));
    TEST_ASSERT_EQUAL_UINT32(expect_len, voice_fixture_len(s));
    TEST_ASSERT_EQUAL_UINT8_ARRAY(expect, voice_fixture_buf(s), expect_len);

    voice_fixture_release(s);
    voice_fixture_free_source(s);
}

/* The id space has real holes -- 21 for one, absent from both asset sets --
   and a cutscene can ask for one. That has to be a soft skip, not a crash
   and not a buffer of garbage handed to the resampler. */
static void test_missing_in_both_sets_fails_without_a_buffer(void)
{
    voice_source *s = voice_fixture_alloc_source();
    TEST_ASSERT_FALSE(voice_fixture_load(3, s));
    TEST_ASSERT_NULL(voice_fixture_buf(s));
    TEST_ASSERT_EQUAL_UINT32(0, voice_fixture_len(s));
    voice_fixture_free_source(s);
}

/* All 42 shipped files are plain 8-bit PCM. A compressed one would decode to
   noise rather than speech if handed straight to the resampler, so it is
   refused instead -- the check is on the file's own pack byte, not on a
   guess from its size. */
static void test_compressed_voc_is_refused(void)
{
    voice_source *s = voice_fixture_alloc_source();
    TEST_ASSERT_FALSE(voice_fixture_load(4, s));
    TEST_ASSERT_NULL(voice_fixture_buf(s));
    voice_fixture_free_source(s);
}

static void test_rate_comes_from_the_files_time_constant(void)
{
    voice_source *s = voice_fixture_alloc_source();
    TEST_ASSERT_TRUE(voice_fixture_load(5, s));
    /* 1000000 / (256 - 211) = 22222, not the 12048 every shipped file has. */
    TEST_ASSERT_EQUAL_INT(22222, voice_fixture_freq(s));
    voice_fixture_release(s);
    voice_fixture_free_source(s);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_pocket_pc_wav_loads_with_its_own_header_spec);
    RUN_TEST(test_dos_voc_is_found_when_there_is_no_wav);
    RUN_TEST(test_unreadable_wav_still_falls_through_to_the_voc);
    RUN_TEST(test_missing_in_both_sets_fails_without_a_buffer);
    RUN_TEST(test_compressed_voc_is_refused);
    RUN_TEST(test_rate_comes_from_the_files_time_constant);
    return UNITY_END();
}

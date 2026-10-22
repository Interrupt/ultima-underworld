#ifndef UW_TEST_GAME_FIXTURE_H
#define UW_TEST_GAME_FIXTURE_H
#include "src/headers/uw.h"

/* Reusable, headless setup. Callers own storage and supply unrelated services;
   character defaults use compiled game function bodies. Map fixtures read the
   required data directly, independently of each suite's file-service mocks. */
enum { UW_TEST_CHARACTER_SIZE = 256, UW_TEST_LEVEL_SIZE = 0x7c08 };
extern bool uw_test_creating_character;
/* Both character buffers need UW_TEST_CHARACTER_SIZE bytes; object needs
   at least 0x1b bytes, matching a mobile/player record. */
void uw_test_create_character(char *record, char *attributes, uw_unaligned_word_t *object);
FILE *uw_test_open_data(const char *relative_path);
void uw_test_read_data(const char *path, void *destination, size_t size,
                       long offset, int origin);
ushort *uw_test_level_object(byte *arena, size_t capacity, unsigned slot);
void uw_test_load_map(byte *arena, size_t capacity, unsigned level);
void uw_test_load_object_properties(byte *records, size_t capacity);

/* Private archive storage used by the extracted read_archive_entry. */
extern undefined DAT_000b78b8_backing[8192];
#define DAT_000b78b8 DAT_000b78b8_backing[0]
#endif

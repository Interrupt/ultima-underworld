#ifndef HEADERS_AUDIO_H
#define HEADERS_AUDIO_H

/* Declarations for audio.c: background music track playback (the
 * MOD-tracker-based \SOUND\uwNN.mod player). Pulls in uw.h itself so
 * this header is self-contained for any caller. */
#include "uw.h"

/* "Audio subsystem initialized" / "music enabled" gate flags -- defined
 * in audio.c, but also set directly by platform_music.c's
 * platform_music_init on success (see each global's own comment in
 * audio.c for the full history). Use headers/platform_music.h for the
 * actual init/load/start/stop/shutdown calls. */
extern int DAT_00087454;
extern int DAT_00087448;

/* Their sound-effects-subsystem twins -- defined in audio.c, set
 * directly by platform_sfx.c's platform_sfx_init on success (see each
 * global's own comment in audio.c). Use headers/platform_sfx.h for the
 * actual init/play/shutdown calls. */
extern int DAT_00087450;
extern int DAT_0008744c;

/* Supplies a per-sound-id base volume the decompile never recovered, for
 * DOS audio mode -- see DAT_0023c2b0_backing's comment in audio.c. */
void audio_set_effect_base_volume(int sound_id, int velocity);

int reset_dialogue_speech_state();
void clear_ambient_sound_target_thunk();
short load_voice_sample_page(char *resource, int page_index, char *header, void *out_buffer);
uint read_voice_sample_page_chunk(char *resource, ushort page_index, char *header, uint byte_count, void *out_buffer);
void cache_ambient_sound_handle();
int acquire_sound_resource_slot();
void release_sound_resource_slot();
int init_sound_channel_slot(char *slot);
void release_sound_channel_slot(char *slot);
int load_and_resample_wave_sample(char *slot, int module, short resource_id);
int load_and_resample_wave_file(char *slot, int unused, const char *path);
byte *construct_and_load_mod_player(byte *player, void *module);
int destroy_mod_player(int player, uint delete_flags);
void reset_mod_player_state(byte *player);
int start_mod_player_playback(void *player);
int stop_mod_player_playback(void *player);
bool queue_mod_audio_buffer(char *player);
void process_mod_tracker_row(char *player);
int mix_mod_channels_to_buffer(char *player, uint *left_buffer, uint *right_buffer, int sample_count);
void apply_mod_tracker_tick_effects(char *player);
void mod_player_wave_out_callback(int wave_out, int message, int instance, int header);
void adjust_mod_channel_volume(char *player, int channel, int delta);
void apply_mod_tone_portamento(char *player, int channel);
void apply_mod_vibrato_effect(char *player, int channel);
void apply_mod_tremolo_effect(char *player, int channel);
void build_mod_volume_sample_table(byte *table, int scale);
int read_mod_word_length_field(void *unused, char *file, int *cursor);
bool arm_sfx_trigger_slot(void *player, char *sample_slot, int trigger_slot);
int start_sfx_trigger_slot(void *player, int slot);
int stop_sfx_trigger_slot(void *player, int slot);
void register_sound_channel_pool_cleanup();
void init_all_sound_channel_slots();
void release_all_sound_channel_slots();
byte is_sfx_trigger_slot_active(void *player, int slot);
void resize_mod_event_row_array(byte *array, int new_size, int growth);
void resize_mod_pattern_row_array(byte *array, int new_size, int growth);
void init_mod_dynamic_array(byte *array);
void resize_mod_int_array(byte *array, int new_size, int growth);
void destroy_mod_dynamic_array(byte *array);
byte *reset_mod_dynamic_array_and_maybe_free(byte *array, uint delete_flags);
void serialize_mod_int_array(byte *array, char *archive);
void init_mod_pattern_array(byte *array);
void resize_mod_pattern_array(byte *array, int new_size, int growth);
void destroy_mod_pattern_array(byte *array);
void serialize_mod_pattern_array(byte *array, char *archive);
void init_mod_instrument_array(byte *array);
void resize_mod_instrument_array(byte *array, int new_size, int growth);
void destroy_mod_instrument_array(byte *array);
void serialize_mod_instrument_array(byte *array, char *archive);
void init_mod_channel_state_array(byte *array);
void resize_mod_channel_state_array(byte *array, int new_size, int growth);
void destroy_mod_channel_state_array(byte *array);
void serialize_mod_channel_state_array(byte *array, char *archive);
void *destroy_mod_dynamic_array_and_maybe_free(byte *array, uint delete_flags);
void *destroy_mod_pattern_array_and_maybe_free(byte *array, uint delete_flags);
void *destroy_mod_instrument_array_and_maybe_free(byte *array, uint delete_flags);
void *destroy_mod_channel_state_array_and_maybe_free(byte *array, uint delete_flags);
void construct_mod_event_array_range(void *elements, int count);
void destroy_mod_row_array_range(byte *elements, int count);
void destroy_mod_row_array_elem(byte *element);
void serialize_mod_event_row_array(byte *array, char *archive);
void *destroy_mod_row_array_elem_and_maybe_free(byte *element, uint delete_flags);
void write_mod_event_array(char *archive, void *elements, int count);
void construct_mod_row_array_range(byte *elements, int count);
void construct_mod_int_array_range(void *elements, int count);
void destroy_mod_pattern_array_range(byte *elements, int count);
void destroy_mod_pattern_array_elem(byte *element);
void serialize_mod_pattern_row_array(byte *array, char *archive);
void *destroy_mod_pattern_array_elem_and_maybe_free(byte *element, uint delete_flags);
void write_mod_pattern_row_array(char *archive, void *elements, int count);
void construct_mod_pattern_array_range(byte *elements, int count);
void write_mod_pattern_array(char *archive, void *elements, int count);
void destroy_mod_instrument_array_range(byte *elements, int count);
void construct_mod_instrument_array_range(byte *elements, int count);
void write_mod_instrument_array(char *archive, void *elements, int count);
void construct_mod_channel_state_array_range(void *elements, int count);
void construct_mod_row_array_elem(byte *element);
void construct_mod_pattern_array_elem(byte *element);
int play_music_track(byte track_number, int flags);
void resume_music_playback();
byte get_current_music_track();
int is_music_playing();
int is_sound_effects_enabled();
void set_music_enabled(int enable);
void set_sound_effects_enabled(int enabled);
void stop_current_audio_handle();
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias);
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias);
int play_sound_effect_at_object(int sound_id, ushort *object, int volume_bias);
void stop_movement_sound_handle();
void stop_current_audio_handle_dup();
uint allocate_and_play_sound_channel(byte sound_id, int module, int resource_id, byte note, uint flags, int extra);
void trigger_sound_sample_note(int sample_index, int note);
void play_musical_instrument(short instrument);
int check_secret_tune_match(char *notes);
void shutdown_sound_effects();
void shutdown_music_module();
void set_pending_music_track(byte track);
void pick_random_pending_music_track();
void advance_menu_music_track();
void update_ingame_music_track();
bool advance_menu_music_track_elapsed();
int get_audio_subsystem_flag();
int audio_always_true_stub();
int play_numbered_voice_sample(short sample_number);
void voice_sample_cluster_stub_1();
bool is_voice_sample_finished();
void stop_voice_sample();
void voice_sample_cluster_stub_2();
void start_ambient_sound_effect(int sound_id);
void stop_ambient_sound_effect();
void init_ambient_sound_timing(short interval);
void clear_ambient_sound_target();

#endif

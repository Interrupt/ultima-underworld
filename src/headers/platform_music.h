#ifndef HEADERS_PLATFORM_MUSIC_H
#define HEADERS_PLATFORM_MUSIC_H

/* Thin platform-backend interface for background music playback, kept
 * deliberately separate from audio.c's own MOD-engine-shaped call sites
 * (play_music_track/resume_music_playback/set_music_enabled/
 * shutdown_music_module) so the backend itself -- currently the vendored
 * HxCModPlayer (third_party/hxcmod) driven through a real SDL2 audio
 * device, see platform_music.c's own block comment -- can be swapped
 * out later for a different implementation without touching audio.c's
 * call sites at all. */

/* Opens the real audio device and prepares the backend. Call once, early
 * at startup, right after SDL_Init(... | SDL_INIT_AUDIO) and before any
 * other platform_music_* call below (see gx_stub.c's GXOpenDisplay). */
void platform_music_init(void);

/* Loads the MOD file at win_path (a "\SOUND\uwNN.mod"-style game path),
 * replacing whatever track was previously loaded. A no-op (with a DEBUG
 * warning) if the file can't be read or the backend rejects it. */
void platform_music_load_track(const char *win_path);

/* (Re)starts playback of whatever track was most recently loaded, from
 * the backend's current position. A no-op if nothing is loaded or the
 * audio device never opened. */
void platform_music_start(void);

/* Silences (without unloading) whatever track is currently playing --
 * platform_music_start resumes from where this left off. */
void platform_music_stop(void);

/* Closes the audio device and releases the loaded track, for real app
 * shutdown. Safe to call even if platform_music_init never succeeded. */
void platform_music_shutdown(void);

/* The audio device's lock, for callers that must mutate state the audio
 * callback also touches. platform_music.c owns the device, so it owns the
 * lock; the DOS audio backend is shared between this file's callback and
 * platform_sfx.c's effect trigger, which runs on the game thread. Both are
 * no-ops when no device is open. */
/* Call after --music-volume changes so a playing DOS sequence follows it. */
void platform_music_apply_volume(void);
void platform_music_lock(void);
void platform_music_unlock(void);

#endif

#ifndef HEADERS_PLATFORM_DOSMIDI_H
#define HEADERS_PLATFORM_DOSMIDI_H

/* Optional DOS-audio backend: the original DOS game's own audio path, as a
 * Sound Blaster Pro played it -- XMI music and MIDI-note sound effects
 * rendered through an emulated OPL2, driven by the real ADLIB.ADV driver
 * model and the game's real UW.AD timbres.
 *
 * Everything that touches the vendored OpenAbyss audio layer lives behind
 * this header (see third_party/openabyss/VENDORING.md). That layer is a
 * reverse-engineering of ADLIB.ADV: the AIL sequencer, its voice layer and
 * the chip. This port supplies only the files, the clock and the output.
 *
 * Why this rather than a general MIDI synth: UW1's sound effects are not
 * samples and not plain notes either. Each one is a note on a *custom*
 * timbre from UW.AD's bank 1 -- selected by MIDI controller 114 -- and
 * those bank-1 timbres are time-variant effects, little command streams
 * that ramp the frequency, levels, feedback, multipliers and waveforms at
 * 60Hz. That is what makes a door sound like a door instead of a beep, and
 * it cannot be expressed as a static instrument, so a MIDI-file player
 * cannot reproduce it.
 *
 * Strictly opt-in. The default audio path remains the ARM/WinCE one
 * (hxcmod .MOD music, UU.exe WAVE-resource SFX), and the DOS assets are
 * optional -- nothing here runs unless the player asks for it AND the
 * assets are present. */

/* Is DOS audio mode live? True only when --audio-mode=dos (case-
 * insensitive, matching --light-mode=dos in 3d.c/player.c) and
 * platform_dosmidi_init then succeeded in loading every file it needs.
 * Reports false after a failed init, so missing assets degrade to the
 * normal path rather than to silence or a crash. */
int platform_dos_audio_enabled(void);

/* The audio mode this run resolved to, before any file is opened:
 * UW_DOS_AUDIO_OFF (the ARM/WinCE path), UW_DOS_AUDIO_DOS, or
 * UW_DOS_AUDIO_HYBRID.
 *
 * --audio-mode decides it when given. When it is NOT given the answer is HYBRID
 * if the game's data directory is itself a DOS install, and OFF otherwise --
 * a DOS data directory has no .MOD music or WAVE effects to fall back on, so
 * leaving it on the ARM path would mean silence.
 *
 * Separate from platform_dos_audio_enabled(), which reports whether the
 * driver actually came up: the mode can be HYBRID and the driver still fail
 * to start because a file is missing. Exposed so that decision can be
 * inspected and tested without a complete set of DOS audio files. */
#define UW_DOS_AUDIO_OFF    0
#define UW_DOS_AUDIO_DOS    1
#define UW_DOS_AUDIO_HYBRID 2
int platform_dos_audio_mode(void);

/* Should sound effects prefer this port's sampled WAVE resources over the
 * DOS notes, where a sample exists? True only for --audio-mode=hybrid.
 *
 * "dos" is the faithful setting: every effect is a note on UW.AD's bank-1
 * timbres, as a Sound Blaster Pro played it. "hybrid" keeps that driver
 * for the music but takes the sampled effect where the port has one,
 * falling back to the DOS note for the ids it does not -- effect ids 0,
 * 13, 14, 15, 19 and 21-23. Those samples appear to be Ultima Underworld
 * 2's, so hybrid is deliberately a mix rather than either original. */
int platform_dos_prefer_wav_effects(void);

/* Loads SOUND/ADLIB.ADV (the driver's own tables), SOUND/UW.AD (the
 * timbres) and SOUND/SOUNDS.DAT (the effect table) from --dos-data-dir,
 * and starts the driver. out_rate is the rate render() will be asked for.
 * Returns 1 on success, 0 on any failure. Call once, from
 * platform_music_init, only when --audio-mode=dos. */
int platform_dosmidi_init(int out_rate);

/* Maps one of audio.c's "\SOUND\uwNN.mod" game paths to the DOS XMI for
 * the same track: "<--dos-data-dir>/SOUND/AWNN.XMI".
 *
 * The AW set is deliberate: UW ships two variants of every track, UW*.XMI
 * voiced for the MT-32 and AW*.XMI voiced for AdLib/OPL. We synthesise OPL,
 * so AW is the matching set -- which is also the set the DOS game itself
 * loads when the AdLib driver is in use. Its own two digits are already
 * octal-style ((track>>3), track&7), which is exactly how play_music_track
 * builds the .mod name, so the digits carry across untouched.
 *
 * Its own function because it is the one piece here worth pinning down in a
 * test: a wrong track number silently plays a real-but-wrong file, a bug
 * this project has already shipped once. Returns 1 on success, 0 if
 * --dos-data-dir is unset or the path is not a track path. */
int platform_dosmidi_xmi_path(const char *win_mod_path, char *out, unsigned int out_sz);

/* Registers the XMI at a real filesystem path as the current track and
 * installs the timbres it asks for. Returns 1 on success. */
int platform_dosmidi_load_file(const char *real_path);

/* Starts / stops the registered track. */
void platform_dosmidi_start(void);
void platform_dosmidi_stop(void);

/* Plays sound-effect `id` -- an index into SOUNDS.DAT, i.e.
 * trigger_sound_sample_note's own id before its +800 resource offset.
 * Looks up that record's bank-1 program, note and duration, locks a
 * channel and plays the note, releasing it when the duration runs out.
 * A no-op when the id has no record.
 *
 * `velocity` is the caller's distance-attenuated volume (0..0x7f) and
 * `pan` its stereo placement (0..0x7f, 0x40 centre) -- the values
 * play_positional_sound_effect and play_sound_effect_with_pan compute and
 * which the shipped WinCE port discarded. Pass -1 for either to fall back
 * to SOUNDS.DAT's own velocity and a centred pan. A velocity of 0 is
 * honoured as silence, matching the original's "out of earshot".
 *
 * MEASURED: velocity genuinely scales the output (0x7f/0x3f/0x1f on one
 * effect peak at 2572/900/588, and 0 is silent). `pan` currently does
 * NOT, and cannot: the chip behind ADLIB.ADV is an OPL2 (YM3812), which
 * is mono -- its nine channels are summed to one output, so a real AdLib
 * could not place a sound either. It is forwarded anyway because the
 * driver accepts CC 10 and the value is correct; realising it would mean
 * the SB Pro FM driver (SBPFM.ADV) over a stereo OPL3, which is a
 * different driver and a different chip than this path emulates. */
void platform_dosmidi_play_effect(int id, int velocity, int pan);

/* Stops any voice currently sounding effect `id`, releasing its channel.
 *
 * Needed because a few effects are long by design -- id 0, the movement
 * sound, runs 25 seconds where every other effect is under 1.5 -- and the
 * engine stops those explicitly rather than waiting them out
 * (stop_movement_sound_handle, called from movement.c around the
 * DAT_00086e84 handle). That stop is an empty function in the WinCE
 * binary, which was harmless there only because the id whitelist meant
 * id 0 never actually played. A no-op when the id is not sounding. */
void platform_dosmidi_stop_effect(int id);

/* Sets the music sequence's volume as a percentage, leaving sound effects
 * alone -- they play on channels locked outside the sequence, so the
 * sequence volume does not touch them. Called at init from
 * --dos-music-volume (default below 100, because the OPL music sits
 * louder than the effects at matched settings). */
void platform_dosmidi_set_music_volume(int percent);

/* Renders `frames` stereo frames of interleaved 16-bit audio, advancing the
 * driver's 120Hz timer and the chip as needed.
 *
 * Called from platform_music.c's SDL audio callback, which holds the device
 * lock for the duration, so this does no locking of its own. Returns the
 * frames produced (0 when DOS mode is not live). */
int platform_dosmidi_render(short *stream, int frames);

/* Releases every loaded file. Safe to call even if init never succeeded. */
void platform_dosmidi_shutdown(void);

#endif

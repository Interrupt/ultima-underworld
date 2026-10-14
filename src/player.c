/* Player state: tile position/movement commit, save-record build/ write/restore, HUD stat sync,
   equipment-effect refresh, and HP adjustment. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/player.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

char *DAT_0024fa2c;
char s_font5x6p_sys_0008430c[] = "font5x6p.sys";
/* The player occupies a UW1 27-byte mobile slot. Word/byte casts at
 * remaining storage boundaries are temporary until their field sweep. */
uw_mobile_object_t *g_player_object;
char *DAT_0023be74;
short DAT_0023beb4;
/* Sizing-audit pass: investigated, NOT confidently shrunk to the minimum. */
undefined1 DAT_0010060c_backing[8];
#define DAT_0010060c DAT_0010060c_backing[0]
short DAT_00201c74;
undefined1 DAT_0023bf0c;
/* Reused scratch global (see the DAT_000a85d0 comment above for the general pattern) -- most call
   sites treat it as a writable sprintf- style destination buffer via ce_strcat... */
// was DAT_0008522c
 undefined s_scroll_newline_0008522c_backing[8192] = "\n";
static undefined4 DAT_00101954;
/* DAT_00204880/82/84/86/88/8a/8c/8e/90/92/94/96/97/a1/a2/a3/a4/a5/a6/ a7/a8/a9/aa were ~20 separate
   lone `short`/`undefined1`/`undefined2` scalars, but movement_collision_sweep and its siblings... */
 undefined1 DAT_00204880_backing[128];
short DAT_00201c70;
undefined2 DAT_00201b60;
/* Was `undefined2` (unsigned) -- change_game_mode/FUN_0003bd48 (see their own "0x80, see
   DAT_00085668's comment" sites) cast this to `int` and compare against the 32-bit sentinel
   `0xffffffff` to detect "dispatch disabled" (set via `DAT_00201b64 = 0xffff;`, uw.c ~27530/27774). */
short DAT_00201b64;
short DAT_00201c94;
undefined4 DAT_0024cfc8;
undefined4 DAT_002028d8;
undefined2 DAT_00201c78;
/* Ghidra under-recovered this: it rendered the embedded spaces as
   underscores and dropped the leading padding and trailing newline.
   Real bytes at 0x857b8 (confirmed via ARM UU.exe .data): "    You died\n". */
static char s_You_died_000857b8[] = "    You died\n";
static byte DAT_00085730;
code *DAT_00201c9c;
byte DAT_0020208c;
/* Debug-console overrides (FLY / FARSIGHT / NOCLIP in demomode.c). The real effects live in
   DAT_0020208c / DAT_002020d8, which reset_player_derived_state zeroes on every effects refresh, so
   it re-applies these after the reset. g_debug_noclip is read by sweep_apply_collision. */
int g_debug_fly;
int g_debug_farsight;
int g_debug_noclip;
/* GODMODE: the player's hp never reaches 0 and spells cost no mana (combat.c, hud.c, object_actions.c). */
int g_debug_godmode;
undefined2 DAT_00203304;
undefined1 DAT_00203303;
short DAT_00202078;
/* Sizing-audit pass: pure scalar, only ever set to 0 or 0x1000 and passed by address into
   movement_collision_sweep, which only dereferences its own callee-side alias (DAT_002048bc) up to
   offset +4 as a ushort -- max byte touched 5. */
 undefined2 DAT_002048b0_backing[16];
int (*DAT_002048b8)(ushort *);  /* movement-state callback slot (check_and_reset_landing_state) */
undefined2 DAT_002048b2;
undefined2 DAT_0023be98;
undefined4 DAT_000858a0;
/* Recovered from UU.exe .data at 0x85d20: tile-floor-height -> world Z table, `height_nibble * 64`
   for nibbles 0..13 (then 0,0,1024). `*(short *)(&DAT_00085d20 + nibble*2)`. */
 undefined1 DAT_00085d20_backing[128] = {
  0x00,0x00, 0x40,0x00, 0x80,0x00, 0xc0,0x00, 0x00,0x01, 0x40,0x01,
  0x80,0x01, 0xc0,0x01, 0x00,0x02, 0x40,0x02, 0x80,0x02, 0xc0,0x02,
  0x00,0x03, 0x40,0x03, 0x00,0x00, 0x00,0x00, 0x00,0x04, 0x00,0x00,
};
short DAT_00202088;
int g_move_facing_offset; /* travel heading minus facing (16-bit), for the diagonal walk+strafe modes */
/* DAT_0008589c/85898/85894 are link-time-initialized read-only data, same situation as DAT_00086e68
   right above's fix (nothing in this decompile writes any of the three, and an exhaustive
   whole-binary Ghidra reference search confirms the real UU.exe agrees -- their only references)... */
static byte DAT_001013a4;
static uint DAT_002020e4;
static byte DAT_002020e8;
int DAT_0023bc94;
// was DAT_002028c0
undefined1 *g_save_equip_table_ptr;
// was DAT_002028c4
undefined1 *g_save_record_base_ptr;
/* Was missing its leading backslash -- both call sites append this straight onto a directory path
   built with no trailing separator (e.g. load_player_save_record builds "<root>\SAVE0" then appends
   this)... */
/* Original bytes are "player.dat"; the port's save-directory prefix
   omits its trailing separator, so this suffix supplies it instead. */
char s_player_dat_00085a74[] = "\\player.dat";
/* g_light_source_slots: light-source-eligible equip slots {5,6,7,8} (see
   refresh_player_equipment_effects and decay_equipped_light_sources's light-scan loops, and
   use_light_source's own comparison against find_or_assign_object_widget's result). */
 unsigned char DAT_00085ac8_backing[16] =
    {5,6,7,8,0,0,0,0,0,0,0xc8,0,0,0,0xc8,0};
static byte DAT_002046d0;
static byte DAT_002046cc;
static undefined1 DAT_0020330c;
static char DAT_00086db0;
static char DAT_00086db1;
// These armor bonuses are consecutive bytes in the ARM bonus array.
#define DAT_0010060d DAT_0010060c_backing[1]
#define DAT_0010060e DAT_0010060c_backing[2]
#define DAT_0010060f DAT_0010060c_backing[3]
static undefined4 DAT_0023bc9c;
static undefined4 DAT_0023bc98;
undefined4 DAT_002020d0;
static undefined4 DAT_002020dc;
undefined4 DAT_002020d8;
undefined4 DAT_002020d4;
static char DAT_00086db4;
/* Sizing-audit pass: accessed as a raw byte blob at `(intptr_t)&DAT_00086db8 + uVar1 + 3` with
   uVar1 guarded to [5,9] -- max byte 12. Sized to 4 int elements (16 bytes) for headroom; down from
   256. */
static int DAT_00086db8_backing[4];
#define DAT_00086db8 DAT_00086db8_backing[0]
/* Sizing-audit pass: equip-slot weight table, loop bound `iVar4<5` (5 equip slots). HARD. Down from
   256. ARM equipment slot -> armor region table at 0x86da8 (real recovered data, not just
   zero-init). */
static undefined1 DAT_00086da8_backing[5] = {3, 0, 1, 2, 2};
#define DAT_00086da8 DAT_00086da8_backing[0]
/* Was a lone `undefined` scalar, but compute_light_source_colors
   indexes it as a 16-entry (0-0xf) light-type -> base-color-index
   table (`(&DAT_00086dc8)[light_type & 0xf]`). Widened to match. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined DAT_00086dc8_backing[16] = {
  0x0e, 0xff, 0x0d, 0x04, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x0b, 0x80, 0x80, 0x80, 0x80,
};
#define DAT_00086dc8 DAT_00086dc8_backing[0]
undefined2 DAT_0023beb8;
/* Player status record: character attributes, skills, mana, carry weights, quest flags, and world
   state. DAT_00086df8 points here in the game; write_player_status_block serializes 0xd2 bytes, and
   the inventory save path also preserves a 220-byte snapshot. */
 undefined1 DAT_0023bca8_backing[256];
short DAT_0023be90;
short DAT_0023be92;
short DAT_0023be94;
short DAT_0023bf00;
undefined2 DAT_0023bf02;
undefined2 DAT_0023bf04;
byte DAT_0023beb0;
byte DAT_0023beac;
undefined2 DAT_0023bea0;
short DAT_0023bea4;
short DAT_0023bf08;
undefined4 DAT_0023bea8;
// ARM uses unsigned phase shifts to index the 16-entry bob waveforms.
byte DAT_0023bf18;
undefined2 DAT_0023be9e;
undefined2 DAT_0023be9c;
undefined2 DAT_0023be9a;
static char DAT_0023bf14;
static byte DAT_0023bf10;
/* Real static lookup table, same recovery/boundary evidence as movement.c's
   DAT_00086e38/DAT_00086e48 (bytes at 0x86e58..0x86e67 in UU.exe's .data, immediately after those
   two and immediately before the already-recovered DAT_00086e68 == 15 scalar). */
static const signed char DAT_00086e58_backing[16] = {
  -4, -3, -2, -1,  0,  1,  2,  3,
   4,  3,  2,  1,  0, -1, -2, -3
};
#define DAT_00086e58 DAT_00086e58_backing[0]
static short DAT_0023bf30;
static short DAT_0023bf34;
static short DAT_0023bf38;
static short DAT_0023bf3c;
static short DAT_0023bf40;
/* ARM .data 0x86e87..0x86e97: level thresholds measured in units of 500 XP. Index by the current
   character level; entry 16 is the terminal sentinel because grant_experience_points stops
   advancing at level 16. A zero-filled replacement made ordinary kills cross every threshold. */
static const byte DAT_00086e87_backing[17] = {
  0, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 0
};
#define DAT_00086e87 DAT_00086e87_backing[0]
static int DAT_0024af8c;
static char s_font5x6i_sys_00086e98[] = "font5x6i.sys";
char s__DATA_mono_dat_000872b8[] = "\\DATA\\mono.dat";
/* "currently-loaded shading level" for load_shading_level_config's `if (DAT_000872a0 == param_1)
   return;` early-out. */
char DAT_000872a0 = -1;
/* Sizing-audit pass: BUG FIX, not just a shrink -- advance_character_ level builds a 2-digit
   level-number string here (tens digit/space at offset 0, units digit written to the
   separately-declared DAT_0008730d at real address +1) then prints it via... */
static undefined1 DAT_0008730c_backing[16] = " 0\n";
#define DAT_0008730c DAT_0008730c_backing[0]
/* The second digit belongs to the same scroll-message buffer. */
#define DAT_0008730d DAT_0008730c_backing[1]
/* Was a lone scalar, but roll_skill_use_improvement indexes it `(&DAT_00087308)[tier]` for tier
   0..2 (classify_skill_training_tier's full range) as a per-tier probability threshold for
   ordint_divmod(uVar2, random).quot. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined DAT_00087308_arr[3] = {
  0x19, 0x28, 0x0a,
};
#define DAT_00087308 DAT_00087308_arr[0]
/* Ghidra rendered this as "and" (dropped the real leading/trailing spaces). Real bytes at 0x87310
   (ARM UU.exe .data, confirmed via tests/fixtures/static_strings.json's direct memory export): "
   and ". */
char s_and_00087310[] = " and ";
/* Used as a NUL-terminated string (&DAT_00087318) by print_skill_improvement_list, joining middle
   entries of its skill- name list. Ghidra never surfaced this as initialized string data; real
   bytes confirmed via the same direct memory export: ", ". */
static char DAT_00087318[] = ", ";
/* Ghidra rendered the embedded spaces as underscores and dropped
   the trailing space. Real bytes at 0x8731c (ARM UU.exe .data):
   "Chant the mantra: ". */
static char s_Chant_the_mantra__0008731c[] = "Chant the mantra: ";
static char s_fontchar_sys_00087330[] = "fontchar.sys";
static char s__DATA_win1_byt_00087350[] = "\\DATA\\win1.byt";
char DAT_0023c27c;
static char s__DATA_win2_byt_00087340[] = "\\DATA\\win2.byt";
static byte DAT_0024af80;
static undefined4 DAT_0024af88;






// was FUN_0003cff8
void set_player_tile_position(uint tile_x, uint tile_y, int flag)
{
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  undefined1 local_3c [24];
  
  if (-1 < DAT_00202080) {
    object_list_unlink(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  }
  DAT_002048b8 = check_and_reset_landing_state;
  DAT_002048b2 = 0x1100;
  DAT_002048b0 = 0;
  g_jump_ascent_timer = 0;
  g_fall_accel = 0;
  DAT_0020488e = 0;
  DAT_0020488c = 0;
  g_vertical_velocity = 0;
  DAT_00204888 = 0;
  DAT_00204886 = 0;
  DAT_00204880 = (short)((uint)((int)(short)tile_x << 0x18) >> 0x10) + 0x80;
  DAT_00204882 = (short)((uint)((int)(short)tile_y << 0x18) >> 0x10) + 0x80;
  DAT_002048a7 = 8;
  DAT_002048a3 = 1;
  DAT_002048a4 = 0;
  iVar2 = tile_x + tile_y * 0x40;
  DAT_00202080 = (short)iVar2;
  iVar2 = iVar2 * 0x10000 >> 0x10;
  DAT_00204884 = *(short *)(&DAT_00085d20 + (uint)(*(byte *)(DAT_002029cc + iVar2 * 4) >> 4) * 2);
  if (((&DAT_000878d0)[*(byte *)(DAT_002029cc + iVar2 * 4) & 0xf] & 0x20) != 0) {
    DAT_00204884 = DAT_00204884 + 0x20;
  }
  uVar3 = g_player_object->hdr.position_word & 0xff80;
  g_player_object->hdr.zpos = ((ushort)DAT_00204884 >> 3) & 0x7f;
  uVar3 = g_player_object->tile_word & 0x3ff;
  g_player_object->tile_x = tile_x & 0x3f;
  g_player_object->tile_y = tile_y & 0x3f;
  uVar3 = g_player_object->tile_word;
  uVar3 = g_player_object->hdr.position_word & 0x1fff;
  g_player_object->hdr.xpos = 3;
  uVar3 = g_player_object->hdr.position_word & 0xefff;
  g_player_object->hdr.ypos = 3;
  g_player_object->animation_flags = g_player_object->animation_flags & 0xec | 0x2c;
  uVar3 = g_player_object->hdr.next << 6;
  g_player_object->hdr.chain_word = 0;
  DAT_00202c6c = local_3c;
  uVar1 = encode_object_slot_index(g_player_object);
  DAT_00202c6c[10] = (char)uVar1;
  DAT_00202c6c[0xb] = (char)((ushort)uVar1 >> 8);
  DAT_00202c6c[8] = (byte)DAT_00203304 & 7;
  iVar2 = (((int)(short)tile_x << 0x13) >> 0x10) + 3;
  DAT_00202c6c[9] = DAT_00203303;
  *DAT_00202c6c = (char)iVar2;
  DAT_00202c6c[1] = (char)((uint)iVar2 >> 8);
  iVar2 = (((int)(short)tile_y << 0x13) >> 0x10) + 3;
  DAT_00202c6c[2] = (char)iVar2;
  DAT_00202c6c[3] = (char)((uint)iVar2 >> 8);
  iVar2 = (int)DAT_00204884;
  DAT_00202c6c[4] = (char)(iVar2 >> 3);
  DAT_00202c6c[5] = (char)((uint)(iVar2 >> 3) >> 8);
  collision_build_height_field(DAT_002048a7);
  DAT_002048a8 = collision_flags_to_locomotion_code((int)(short)(*(ushort *)(DAT_00202c6c + 0xe) |
                                          *(ushort *)(DAT_00202c6c + 0xc)));
  set_locomotion_state(DAT_002048a8,0);
  DAT_0023be98 = 0;
  trigger_view_transition();
  DAT_000858a0 = 1;
  object_list_insert_head(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
}

/* Debug-only helper (--debug): print both player-position representations side by side
   -- the fine, continuous DAT_00204880/2 (used by the camera and by demo_set_player_pos) vs. the
   coarser tile-position bytes packed into g_player_object's own record. */
void debug_print_player_position(const char *label)
{
  if (g_opts.debug)
    fprintf(stderr, "[playerpos:%s] fine=(%d,%d)=world(%g,%g) obj_bytes tile=(%d,%d)\n",
            label, (int)DAT_00204880, (int)DAT_00204882,
            (double)DAT_00204880 / 256.0, (double)DAT_00204882 / 256.0,
            (int)((byte) g_player_object->tile_word_high >> 2),
            (int)(g_player_object->npc_yhome));
}


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0003d438 (previously mis-guessed as "update_3d_sound_position" from its trailing sound
// call).
void commit_player_move()

{
  short sVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  ushort uVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  
  iVar8 = ((int)(short)DAT_00204882 >> 8) * 0x40 + (((int)(short)DAT_00204880 << 0x10) >> 0x18);
  iVar2 = (int)DAT_00202080;
  iVar7 = iVar8 * 0x10000 >> 0x10;
  if (iVar7 != iVar2) {
    if (iVar2 != -1) {
      object_list_unlink(DAT_002029cc + iVar2 * 4 + 2,g_player_object);
    }
    DAT_00202080 = (short)iVar8;
    object_list_insert_head(DAT_002029cc + iVar7 * 4 + 2,g_player_object);
    uVar5 = DAT_00204880 & 0x3f00;
    uVar3 = g_player_object->tile_word & 0x3ff;
    g_player_object->tile_x = (uVar5 >> 8) & 0x3f;
    g_player_object->tile_y = ((ushort)DAT_00204882 >> 8) & 0x3f;
    uVar3 = g_player_object->tile_word;
  }
  uVar5 = DAT_00204880 & 0xe0;
  uVar3 = g_player_object->hdr.position_word & 0x1fff;
  g_player_object->hdr.xpos = (uVar5 >> 5) & 7;
  uVar5 = DAT_00204882 & 0xe0;
  uVar3 = g_player_object->hdr.position_word & 0xe3ff;
  g_player_object->hdr.ypos = (uVar5 >> 5) & 7;
  uVar3 = g_player_object->hdr.position_word & 0xff80;
  g_player_object->hdr.zpos = ((ushort)DAT_00204884 >> 3) & 0x7f;
  uVar3 = read_realtime_clock_units();
  uVar4 = g_player_object->goal_word & 0xfff;
  g_player_object->npc_animation_frame = (uVar3 >> 6) & 3;
  /* ARM 0x3d668..0x3d694 compares two signed 16-bit headings. */
  if ((_DAT_002048a9 != 0) && (_DAT_002048a1 == (short)DAT_00201c78)) {
    g_jump_ascent_timer = 0;
  }
  /* A wall hit that deflects the travel heading also swings the player's FACING toward the slide
     direction by 0x400 (~5.6 degrees) per tick; --wall-turn scales that step (0 = never turns). */
  uVar5 = DAT_00201c70;
  if (_DAT_002048a1 != (short)DAT_00201c78) {
    DAT_00201c78 = _DAT_002048a1;
    uVar3 = (int)_DAT_002048a1 + DAT_00202088 * -0x4000 - g_move_facing_offset;
    if ((((DAT_00204897 & 0x80) != 0) &&
        (uVar6 = (int)(short)DAT_00201c70 - ((int)(uVar3 * 0x10000) >> 0x10),
        uVar4 = (int)uVar6 >> 0x1f, uVar5 = (ushort)uVar3, 0x3ff < (int)((uVar6 ^ uVar4) - uVar4)))
       && (uVar5 = DAT_00201c70 - uw_wall_turn_step(), 0x7ffe < ((uint)DAT_00201c70 - (uVar3 & 0xffff) & 0xffff)))
    {
      uVar5 = DAT_00201c70 + uw_wall_turn_step();
    }
  }
  DAT_00201c70 = uVar5;
  g_player_object->hdr.heading = ((ushort)DAT_00201c70 >> 13) & 7;
  uVar3 = g_player_object->hdr.position_word;
  g_player_object->fine_heading = ((ushort)DAT_00201c70 >> 8) & 0x1f;
  if (_DAT_002048a9 != 0) {
    if (DAT_00204896 != '\0') {
      uVar3 = (uint)(_DAT_002048a9 >> 8);
      iVar7 = 0;
      if (g_vertical_velocity != 0) {
        iVar7 = uVar3 << 0x10;
      }
      if (g_vertical_velocity != 0) {
        uVar3 = ((iVar7 >> 0x10) << 0x11) >> 0x10;
      }
      sVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x32),((int)(short)uVar3 << 0x11) >> 0x10)
      ;
      if (0 < sVar1) {
        sVar1 = ordint_divmod(0x1e,(0x1e - (uint)*(byte *)(DAT_00086df8 + 0x32)) * (int)(short)uVar3).quot
        ;
        uVar3 = (uint)sVar1;
      }
      if (3 < (short)uVar3) {
        apply_typed_damage_to_object(g_player_object,0,0,0,(char)uVar3,0);
      }
      if ((1 < (short)uVar3) || ((DAT_002048a8 & 0x10) != 0)) {
        play_sound_effect_with_pan(0xf,0x40,((uVar3 & 0xff) + 0x31) * 4);
      }
    }
    _DAT_002048a9 = 0;
  }
  set_locomotion_state(DAT_002048a8,0);
  DAT_000858a0 = 0;
  return;
}



// New (not decompiled from the binary): a debug/testing entry point for demomode.c's SETPLAYERPOS
// command.
void demo_set_player_pos(double x, double y, double z, double yaw_deg, double pitch_deg)
{
  set_player_tile_position((int)floor(x), (int)floor(y), 1);
  /* Clear any in-flight smooth-turn interpolation (update_current_view_from_subject's
     DAT_0023bea8-gated add-on to DAT_00086e6c+0x2c): if a turn animation was still mid-flight when
     this runs... */
  DAT_0023bea8 = 0;
  /* Force the camera to track the player object right now. update_current_view_from_subject (the
     function that actually copies DAT_00201c70/DAT_00204880 etc. into the camera-facing
     DAT_00086e6c record sync_camera_from_player reads) only does that when DAT_0023b82c... */
  DAT_0023b82c = (char *)g_player_object;
  DAT_00204880 = (short)lround(x * 256.0);
  DAT_00204882 = (short)lround(y * 256.0);
  /* set_player_tile_position just computed a default DAT_00204884 from the destination tile's own
     floor-height table lookup; override it with the caller's exact value (e.g. to stand at a
     specific mid-air/step height, not just "on the floor of this tile"). */
  DAT_00204884 = (short)lround(z);
  DAT_00201c70 = (short)lround(yaw_deg * (65536.0 / 360.0));
  DAT_0023beb4 = (short)lround(pitch_deg * 256.0);
  DAT_00201c78 = DAT_00201c70;
  _DAT_002048a1 = DAT_00201c70;
  commit_player_move();
}




// was FUN_0003e4cc -- reads the player object's current HP/MP/etc. and pushes them into the HUD via
// set_hud_status_value, one call per status slot (0=health, 1=mana, 2=hunger-ish, 4=poison flash,
// ...). Called once per HUD refresh from enter_dungeon_view_hud_init.
void sync_player_stats_to_hud()

{
  int iVar1;
  byte bVar2;
  uint uVar3;
  
  tick_weapon_swing_state(0);
  bVar2 = g_player_object->npc_hp;
  set_hud_status_value(0,bVar2);
  if (((uint)DAT_001013a4 < (uint) g_player_object->recent_damage * 4) ||
      ((bVar2 < 0x10 && (g_player_object->recent_damage != 0)))) {
    set_hud_status_value(4,3);
  }
  g_player_object->recent_damage = 0;
  set_hud_status_value(1,*(undefined1 *)(DAT_00086df8 + 0x37));
  if (DAT_00201b68 != 9) {
    set_hud_status_value(2,(ushort)((((int)(((g_player_object->npc_heading) +
                                             ((g_player_object->hdr.heading << 7) >> 2)) * 0x10000) >>
                                      0x10) + 8) >> 4) & 0xf);
  }
  if ((char)g_player_object->npc_hp == '\0') {
    handle_starvation_penalty();
  }
  uVar3 = read_realtime_clock_units();
  iVar1 = ((uVar3 >> 8) - DAT_002020e4) * 0x10000;
  if (iVar1 >> 0x10 != 0) {
    uVar3 = read_realtime_clock_units();
    DAT_002020e4 = uVar3 >> 8;
    DAT_002020e8 = (char)((uint)iVar1 >> 0x10) + DAT_002020e8;
    update_ingame_music_track();
    if (0x14 < DAT_002020e8) {
      DAT_002020e8 = 0;
      update_player_tick_effects();
    }
  }
  if ((DAT_00201b68 == 9) && (uVar3 = ce_rand(), (uVar3 & 0x1f) == 0)) {
    apply_level9_random_hazard_tick();
  }
  return;
}




// was FUN_00043e20
void build_player_save_record(byte *out_record)
{
  bool bVar1;
  ushort uVar2;
  short sVar3;
  undefined1 *puVar4;
  int iVar5;
  int iVar6;
  undefined1 *puVar7;
  ushort *puVar8;
  byte *pbVar9;
  ushort local_14 [2];
  
  close_backpack_container();
  puVar4 = (undefined1 *)g_player_object;
  iVar6 = 0x1b;
  puVar7 = out_record;
  do {
    iVar5 = iVar6 + -1;
    *puVar7 = *puVar4;
    bVar1 = 0 < iVar6;
    puVar4 = puVar4 + 1;
    iVar6 = iVar5;
    puVar7 = puVar7 + 1;
  } while (iVar5 != 0 && bVar1);
  ((uw_object_hdr_t *)out_record)->next = 0;
  g_save_equip_table_ptr = out_record + 0x23;
  g_save_record_base_ptr = out_record + 0x5b;
  g_save_record_count = 0;
  iVar6 = 0;
  do {
    puVar8 = (ushort *)(g_save_equip_table_ptr + iVar6 * 2);
    uVar2 = *puVar8;
    *(char *)puVar8 = (char)(uVar2 & 0xffc0);
    *(char *)((char *)puVar8 + 1) = (char)((uVar2 & 0xffc0) >> 8);
    pbVar9 = g_save_equip_table_ptr + iVar6 * 2;
    *pbVar9 = *pbVar9 & 0x3f;
    pbVar9[1] = 0;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x13);
  serialize_inventory_link_chain((char *)g_player_object + 6,out_record + 6);
  puVar4 = (undefined1 *)g_selected_object;
  if (g_cursor_holding_state == 1) {
    ((uw_object_hdr_t *)(out_record + 0x1b))->type_flags = ((uw_object_hdr_t *)puVar4)->type_flags;
    ((uw_object_hdr_t *)(out_record + 0x1b))->position_word = ((uw_object_hdr_t *)puVar4)->position_word;
    ((uw_object_hdr_t *)(out_record + 0x1b))->chain_word = ((uw_object_hdr_t *)puVar4)->chain_word;
    ((uw_object_hdr_t *)(out_record + 0x1b))->link_word = ((uw_object_hdr_t *)puVar4)->link_word;
    if (((uw_object_hdr_t *)g_selected_object)->is_quant == 0) {
      serialize_inventory_link_chain(g_selected_object + 6,out_record + 0x21);
    }
    sVar3 = encode_object_slot_index(g_selected_object);
    local_14[0] = local_14[0] & 0x3f | sVar3 << 6;
    free_linked_object_recursive(local_14);
  }
}



// was FUN_00043fd8
bool write_player_save_record(char *slot_dir)
{
  char cVar1;
  int iVar2;
  bool bVar3;
  char acStack_114 [260];
  char *pcDst;
  
  bVar3 = true;
  g_save_record_buffer = ce_malloc(0x4000);
  if (g_save_record_buffer == 0) {
    bVar3 = false;
  }
  else {
    build_player_save_record(g_save_record_buffer);
    g_save_record_count = g_save_record_count + 1;
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested): the real binary's own
       write_player_save_record never serializes DAT_0023bca8... */
    ce_memmove(g_save_record_buffer + 0x5b + g_save_record_count * 8,&DAT_0023bca8,220);
    if (slot_dir != (char *)0x0) {
      pcDst = acStack_114;
      do {
        cVar1 = *slot_dir;
        *pcDst = cVar1;
        pcDst = pcDst + 1;
        slot_dir = slot_dir + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_114,s_player_dat_00085a74);
      iVar2 = open_existing_file_rw(acStack_114);
      bVar3 = iVar2 != -1;
      if (bVar3) {
        /* BUG FIX: was `write_player_status_block()` with no arguments, relying on leftover
           register state -- iVar2 (the file handle, used the very next line) is the value that
           belongs here... */
        write_player_status_block(iVar2);
        write_file_handle(iVar2,&g_save_record_count,2);
        write_file_handle(iVar2,g_save_record_buffer,g_save_record_count * 8 + 0x5b + 220);
        CloseHandle(iVar2);
      }
      if (g_save_record_buffer != 0) {
        LocalFree(g_save_record_buffer);
        g_save_record_buffer = 0;
      }
      set_pending_update_flags(0x200);
    }
  }
  return bVar3;
}




// was FUN_00044538
void restore_player_save_record(byte *record)
{
  bool bVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  int iVar4;
  int iVar5;
  
  g_save_equip_table_ptr = record + 0x23;
  g_save_record_base_ptr = record + 0x5b;
  puVar2 = (undefined1 *)g_player_object;
  puVar3 = record;
  iVar4 = 0x1b;
  do {
    iVar5 = iVar4 + -1;
    *puVar2 = *puVar3;
    bVar1 = 0 < iVar4;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
    iVar4 = iVar5;
  } while (iVar5 != 0 && bVar1);
  deserialize_inventory_link_chain((char *)g_player_object + 6,record + 6);
  if (g_cursor_holding_state == 1) {
    puVar2 = (undefined1 *)alloc_object_slot(0);
    g_selected_object = (char *)puVar2;
    ((uw_object_hdr_t *)puVar2)->type_flags = ((uw_object_hdr_t *)(record + 0x1b))->type_flags;
    ((uw_object_hdr_t *)puVar2)->position_word = ((uw_object_hdr_t *)(record + 0x1b))->position_word;
    ((uw_object_hdr_t *)puVar2)->chain_word = ((uw_object_hdr_t *)(record + 0x1b))->chain_word;
    ((uw_object_hdr_t *)puVar2)->link_word = ((uw_object_hdr_t *)(record + 0x1b))->link_word;
    if (((uw_object_hdr_t *)(record + 0x1b))->is_quant == 0) {
      deserialize_inventory_link_chain(g_selected_object + 6,record + 0x21);
    }
  }
  /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested) -- see write_player_save_record's own
     matching comment: restores DAT_0023bca8 from the same trailing offset that function now appends
     it at. g_save_record_count is already set here... */
  ce_memmove(&DAT_0023bca8,record + 0x5b + g_save_record_count * 8,220);
}




// was FUN_000667cc
void refresh_player_equipment_effects()

{
  byte bVar1;
  ushort uVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  ushort *equipped;
  ushort *puVar6;
  uw_light_type_props_t *iVar7; /* Was `int` -- truncated the 64-bit pointer get_scanned_object_class_effect_ptr
                  returns (see its own comment); made a real crash once
                  that return value stopped being a hardcoded 0. */
  uint uVar8;
  byte bVar9;
  ushort uVar11;
  bool bVar12;
  bool bVar13;
  undefined2 local_30;
  undefined1 local_2e [2];
  undefined1 local_2c [4];
  int local_28;
  byte bVar10;
  
  local_30 = 0;
  iVar4 = 0;
  do {
    DAT_0023be74[iVar4] = '\0';
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 4);
  iVar4 = 0;
  do {
    equipped = (ushort *)get_equipped_item_at_slot(iVar4);
    if (equipped != 0) {
      cVar3 = compute_object_weight(equipped);
      DAT_0023be74[(char)(&DAT_00086da8)[iVar4]] =
           cVar3 + DAT_0023be74[(char)(&DAT_00086da8)[iVar4]];
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 5);
  puVar6 = (ushort *)get_equipped_item_at_slot((*(byte *)(DAT_00086df8 + 100) & 1) + 7);
  if ((((puVar6 != (ushort *)0x0) && (uVar11 = *puVar6, (uVar11 & 0x1c0) == 0)) &&
      ((uVar11 & 0x30) == 0x30)) && ((10 < (uVar11 & 0xf) && ((uVar11 & 0xf) < 0x10)))) {
    cVar3 = compute_object_weight(puVar6);
    *DAT_0023be74 = cVar3 + *DAT_0023be74;
    DAT_0023be74[1] = DAT_0023be74[1] + cVar3;
  }
  DAT_0023be74[0x12] = *(char *)(DAT_00086df8 + 0x22);
  g_scratch_object_ptr = get_equipped_item_at_slot(8 - (*(byte *)(DAT_00086df8 + 100) & 1));
  uVar11 = 2;
  if (g_scratch_object_ptr != NULL) {
    uVar2 = g_scratch_object_ptr->type_flags;
    if (((uVar2 & 0x1c0) == 0) && ((uVar2 & 0x30) < 0x20)) {
      uVar8 = uVar2 & 0xf;
      if ((uVar2 & 0x30) == 0) {
        uVar11 = (ushort)(byte) g_melee_type_props[uVar8].skill;
        uVar8 = (uint)(short)(ushort)(byte) g_melee_type_props[uVar8].skill;
        bVar13 = SBORROW4(uVar8,3);
        iVar4 = uVar8 - 3;
        bVar12 = uVar8 == 3;
        if (uVar8 < 3) {
          uVar11 = 3;
        }
        else {
          bVar13 = SBORROW4(uVar8,5);
          iVar4 = uVar8 - 5;
          bVar12 = uVar8 == 5;
        }
        if (!bVar12 && iVar4 < 0 == bVar13) {
          uVar11 = 5;
        }
        iVar4 = (char)uVar11 + -3;
        goto LAB_000669a8;
      }
      iVar4 = -1;
      if (7 < uVar8) goto LAB_000669a8;
    }
  }
  iVar4 = 3;
LAB_000669a8:
  request_weapon_swing_graphic(iVar4);
  DAT_0023be74[0x12] = DAT_0023be74[0x12] + (*(byte *)(DAT_00086df8 + (short)uVar11 + 0x21) >> 1);
  reset_player_derived_state();
  iVar5 = 0;
  bVar10 = 0;
  bVar9 = 0;
  iVar4 = 0;
  bVar12 = false;
  do {
    puVar6 = (ushort *)g_selected_object;
    if (!bVar12) {
      /* Was get_equipped_item_at_slot(iVar4) -- scanning raw equip slots 0-3, which never hold a
         light source. */
      puVar6 = (ushort *)get_equipped_item_at_slot((int)(char)(&g_light_source_slots)[iVar4]);
    }
    g_scratch_object_ptr = (uw_object_hdr_t *)puVar6;
    if ((((puVar6 != (ushort *)0x0) && ((*puVar6 & 0x1f0) == 0x90)) &&
        (uVar11 = *puVar6 & 0xf, 3 < uVar11)) && (uVar11 < 8)) {
      iVar7 = get_scanned_object_class_effect_ptr();
      bVar1 = iVar7->brightness;
      if (bVar10 < bVar1) {
        /* ARM 0x66a54 sets r0 = 0 before the call at 0x66a5c;
           Ghidra omitted the reused-register argument. HACK: the port passes the light's real
           brightness (see set_ambient_bias_with_light). */
        set_ambient_bias_with_light(bVar1);
        iVar5 = iVar4;
        bVar9 = bVar1;
        bVar10 = bVar1;
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    bVar12 = iVar4 == 4;
  } while (iVar4 < 5);
  *(byte *)(DAT_00086df8 + 99) = bVar9 * '\x10' + (char)(uintptr_t)iVar5;
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    iVar4 = 0;
    do {
      bVar9 = *(byte *)(DAT_00086df8 + iVar4 * 2 + 0x3e);
      apply_equipped_item_effect(bVar9 & 0xf,bVar9 >> 4,&local_30,0xffffffff);
      iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
    } while (iVar4 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
  }
  iVar4 = 0;
  do {
    g_scratch_object_ptr = get_equipped_item_at_slot(iVar4);
    if ((g_scratch_object_ptr != NULL) &&
        (iVar5 = is_valid_equipment_slot_item(g_scratch_object_ptr->object_id,iVar4), iVar5 != 0)) {
      iVar5 = resolve_object_variant_or_special_link(g_scratch_object_ptr,local_2c,local_2e,&local_28);
      if ((iVar5 == 0) || (local_28 != 0)) {
        if (g_scratch_object_ptr->object_id == 0x2f) {
          DAT_0023bc98 = 1;
        }
      }
      else {
        iVar5 = apply_equipped_item_effect(local_2c[0],local_2e[0],&local_30,iVar4);
        if (iVar5 != 0) {
          clear_object_pending_special_flag(g_scratch_object_ptr);
        }
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 0xb);
  apply_equipment_effect_penalties(local_30);
  /* The light level (0-7) selects the SHADES.DAT row in both render modes; far sight lights the view
     at level 6 regardless of carried light. Applying it also keeps the tile-light grid in sync, which
     decides which tiles the automap can discover. */
  set_ambient_bias_with_light(DAT_002020d8 == 0 ? *(byte *)(DAT_00086df8 + 99) >> 4 : 6);
  update_screen_flicker_effect((*(byte *)(DAT_00086df8 + 0x61) & 0xc) != 0);
  force_locomotion_state_refresh();
  apply_movement_mode_profile(0xff);
  return;
}




// was FUN_00073ec0
void adjust_player_hp(void *object_ptr, char delta)
{
  char *object = (char *)object_ptr;
  ushort uVar1;
  short sVar2;
  
  if ((void *)object == (void *)g_player_object) {
    if (delta < '\x01') {
      sVar2 = (ushort) g_player_object->npc_hp - (short)delta;
    }
    else {
      uVar1 = ce_rand();
      sVar2 = (ushort) g_player_object->npc_hp +
              ((short)(((uVar1 & 3) + (short)delta) * (ushort)*(byte *)(DAT_0023be74 + 4)) >> 4) +
              1;
    }
    if ((short)(ushort)*(byte *)(DAT_0023be74 + 4) < sVar2) {
      g_player_object->npc_hp = *(byte *)(DAT_0023be74 + 4);
    }
    else {
      g_player_object->npc_hp = (byte)(char)sVar2;
    }
    refresh_experience_display();
  }
}




// was FUN_00065b90 -- packs live game state (recent equip/attack bytes, world x/y/z/facing,
// locomotion state) into the 0xd2-byte DAT_00086df8 player-status block, then writes it to file
// handle param_1 through a length-prefixed...
void write_player_status_block(int file_handle)
{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  byte local_14 [4];
  
  local_14[0] = *DAT_00086df8 ^ 0xaa;
  DAT_00086df8[0x1e] = *(byte *)(DAT_0023be74 + 5);
  DAT_00086df8[0x1f] = *(byte *)(DAT_0023be74 + 6);
  DAT_00086df8[0x20] = *(byte *)(DAT_0023be74 + 7);
  DAT_00086df8[0x35] = g_player_object->npc_hp;
  DAT_00086df8[0x36] = *(byte *)(DAT_0023be74 + 4);
  uVar1 = DAT_00204880;
  DAT_00086df8[0x54] = (byte)DAT_00204880;
  DAT_00086df8[0x55] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00204882;
  DAT_00086df8[0x56] = (byte)DAT_00204882;
  DAT_00086df8[0x57] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00204884;
  DAT_00086df8[0x58] = (byte)DAT_00204884;
  DAT_00086df8[0x59] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00201c70;
  DAT_00086df8[0x5a] = (byte)DAT_00201c70;
  DAT_00086df8[0x5b] = (byte)((ushort)uVar1 >> 8);
  uVar1 = DAT_00201b68;
  DAT_00086df8[0x5c] = (byte)DAT_00201b68;
  DAT_00086df8[0x5d] = (byte)((ushort)uVar1 >> 8);
  bVar2 = is_sound_effects_enabled();
  DAT_00086df8[0xb5] = (bVar2 ^ DAT_00086df8[0xb5]) & 3 ^ DAT_00086df8[0xb5];
  bVar2 = is_music_playing();
  DAT_00086df8[0xb5] = DAT_00086df8[0xb5] & 0xf3 | (bVar2 & 3) << 2;
  uVar3 = *(ushort *)(DAT_00086df8 + 0xb6) & 0xf807 | (uint)DAT_002048a8 << 3;
  DAT_00086df8[0xb6] = (byte)uVar3;
  DAT_00086df8[0xb7] = (byte)(uVar3 >> 8);
  write_file_handle(file_handle,local_14,1);
  write_xor_scrambled_block(file_handle,local_14[0],DAT_00086df8,0xd2);
}



// was FUN_00065d4c -- read-side counterpart to write_player_status_block: reads the 0xd2-byte
// DAT_00086df8 player- status block from file handle param_1 and unpacks it back into the live
// game-state globals it was packed from.
void read_player_status_block(int file_handle)
{
  undefined1 local_10 [4];
  
  read_file_handle(file_handle,local_10,1);
  read_xor_scrambled_block(file_handle,local_10[0],DAT_00086df8,0xd2);
  *(undefined1 *)(DAT_0023be74 + 5) = *(undefined1 *)(DAT_00086df8 + 0x1e);
  *(undefined1 *)(DAT_0023be74 + 6) = *(undefined1 *)(DAT_00086df8 + 0x1f);
  *(undefined1 *)(DAT_0023be74 + 7) = *(undefined1 *)(DAT_00086df8 + 0x20);
  g_player_object->npc_hp = *(undefined1 *)(DAT_00086df8 + 0x35);
  *(undefined1 *)(DAT_0023be74 + 4) = *(undefined1 *)(DAT_00086df8 + 0x36);
  DAT_00204880 = *(undefined2 *)(DAT_00086df8 + 0x54);
  DAT_00204882 = *(undefined2 *)(DAT_00086df8 + 0x56);
  DAT_00204884 = *(undefined2 *)(DAT_00086df8 + 0x58);
  DAT_00201c70 = *(undefined2 *)(DAT_00086df8 + 0x5a);
  DAT_00201b68 = *(undefined2 *)(DAT_00086df8 + 0x5c);
  DAT_002048a8 = (undefined1)(*(ushort *)(DAT_00086df8 + 0xb6) >> 3);
  set_sound_effects_enabled(*(byte *)(DAT_00086df8 + 0xb5) & 3);
  set_music_enabled(*(byte *)(DAT_00086df8 + 0xb5) >> 2 & 3);
  configure_texture_detail_functions();
  apply_movement_mode_profile(*(ushort *)(DAT_00086df8 + 0xb6) & 7);
}




// was FUN_00065eb4 -- recomputes the player's derived stealth/hide thresholds
// (DAT_00086db0/DAT_00086db1, die-roll-jittered from a player-stat byte at DAT_00086df8+0x2e) and
// resets a batch of movement/combat scratch flags and counters...
void reset_player_derived_state()

{
  char *iVar1;
  char cVar2;

  iVar1 = DAT_00086df8;
  DAT_0020330c = 0;
  cVar2 = ordint_divmod(3,*(undefined1 *)(DAT_00086df8 + 0x2e)).quot;
  DAT_00086db0 = '\r' - cVar2;
  cVar2 = ordint_divmod(5,*(undefined1 *)(iVar1 + 0x2e)).quot;
  DAT_00086db1 = '\x0f' - cVar2;
  DAT_0020208c = 0;
  DAT_0010060c = 0;
  DAT_0010060d = 0;
  DAT_0010060e = 0;
  DAT_0010060f = 0;
  DAT_0023bc9c = 0;
  DAT_0023bc98 = 0;
  DAT_002020d0 = 0;
  DAT_002020dc = 0;
  DAT_002020d8 = 0;
  DAT_002020d4 = 0;
  DAT_000858c4 = 0x90;
  if (DAT_0023bc94 != 0) {
    DAT_000858c4 = 400;
  }
  DAT_002046cc = 0;
  if (g_debug_fly) DAT_0020208c |= 0x10;   /* same bit a real flying effect sets (hover, gravity off) */
  if (g_debug_farsight) DAT_002020d8 = 1;  /* same flag the far-sight (free camera) effect sets */
  return;
}




// was FUN_000660d4 -- toggles a randomized screen flicker effect tracked in DAT_00086db4 (-1=off,
// 0/1/2 = which of 3 sub-effects): param_1==0 cancels any active effect (restoring palette bank 0,
// or stopping toggle_light_table_flicker's effect)...
void update_screen_flicker_effect(int enable)
{
  int uw_ord2005_rem_125 = 0;
  ushort uVar1;
  undefined4 uVar2;
  char extraout_r1;
  
  if (enable == 0) {
    if (-1 < DAT_00086db4) {
      if (DAT_00086db4 == '\x01') {
        set_palette_bank(0);
      }
      else if (DAT_00086db4 == '\x02') {
        toggle_light_table_flicker(0);
      }
      DAT_00086db4 = -1;
    }
  }
  else if (DAT_00086db4 < '\0') {
    if (DAT_00086db8 == 0) {
      uVar2 = ce_rand();
      uw_ord2005_rem_125 = ((int)(uVar2)) % (3);
      DAT_00086db4 = uw_ord2005_rem_125;
    }
    else {
      DAT_00086db4 = '\0';
      DAT_00086db8 = 0;
    }
    if (DAT_00086db4 == '\x01') {
      uVar1 = ce_rand();
      set_palette_bank(uVar1 & 7);
    }
    else if (DAT_00086db4 == '\x02') {
      toggle_light_table_flicker(1);
    }
  }
}




// was FUN_000661b0 -- applies one "intrinsic equipment effect" opcode (param_1, 0-0xd) with
// magnitude/argument param_2, against scratch state param_3 and an equipment-slot/object index
// param_4.
int apply_equipped_item_effect(byte opcode, byte magnitude, ushort *scratch, int flags)
{
  uint uVar1;
  byte *pbVar2;
  undefined4 *puVar3;
  char *pcVar4;
  byte bVar5;
  int iVar6;
  char cVar7;
  ushort uVar8;
  short local_1c [2];
  
  switch(opcode) {
  case 0:
    if (*(byte *)(DAT_00086df8 + 99) >> 4 < magnitude) {
      *(byte *)(DAT_00086df8 + 99) = magnitude << 4;
    }
    break;
  case 1:
    pbVar2 = &DAT_0020208c;
    bVar5 = (byte)(1 << (uint)(byte)(magnitude - 1)) | DAT_0020208c;
LAB_0006636c:
    *pbVar2 = bVar5;
    break;
  case 2:
    if ((ushort)magnitude <= *scratch >> 4) {
      return 0;
    }
    uVar8 = (*scratch & 0xf) + (ushort)magnitude * 0x10;
    goto LAB_00066290;
  case 3:
    uVar1 = (uint)magnitude;
    if (uVar1 == 1) {
      DAT_0010060c = DAT_0010060c + '\x03';
      DAT_0010060d = DAT_0010060d + '\x03';
      DAT_0010060e = DAT_0010060e + '\x03';
      DAT_0010060f = DAT_0010060f + '\x03';
      return 0;
    }
    if (4 < uVar1) {
      if (9 < uVar1) {
        return 0;
      }
      DAT_0020330c = DAT_0020330c | *(byte *)((intptr_t)&DAT_00086db8 + uVar1 + 3);
      return 0;
    }
    uVar8 = *scratch | (ushort)(1 << (uVar1 - 1 & 0xff));
LAB_00066290:
    *scratch = uVar8;
    break;
  case 4:
    break;
  case 5:
    break;
  case 6:
    break;
  case 7:
    break;
  case 8:
    break;
  case 9:
    reduce_item_quality_on_use(g_player_object,1);  /* ARM passes only r0 here (r1 is stale); 1 matches the join path's value */
    break;
  case 10:
    break;
  case 0xb:
    if (magnitude == 0) {
      puVar3 = &DAT_002020d0;
    }
    else if (magnitude == 1) {
      puVar3 = &DAT_002020d8;
    }
    else {
      if (magnitude != 2) {
        if (magnitude == 3) {
          DAT_000858c4 = 0;
          return 0;
        }
        if (magnitude == 0xe) {
          pbVar2 = &DAT_002046cc;
          bVar5 = DAT_002046cc | 1;
        }
        else {
          if (magnitude != 0xf) {
            return 0;
          }
          pbVar2 = &DAT_002046cc;
          bVar5 = DAT_002046cc | 2;
        }
        goto LAB_0006636c;
      }
      puVar3 = &DAT_002020d4;
    }
    goto LAB_00066398;
  case 0xc:
    flags = flags << 0x10;
    iVar6 = flags >> 0x10;
    if (-1 < iVar6) {
      if (iVar6 < 5) {
        local_1c[0] = (short)(char)(&DAT_00086da8)[iVar6];
      }
      else {
        local_1c[0] = 0;
        flags = 1;
      }
      local_1c[1] = 0xffff;
      if (4 < iVar6) {
        local_1c[1] = (short)flags;
      }
      if (local_1c[0] != -1) {
        iVar6 = 0;
        do {
          if (1 < iVar6) {
            return 0;
          }
          cVar7 = '\0';
          if ((magnitude & 8) == 0) {
            (&DAT_0010060c)[local_1c[iVar6]] =
                 (magnitude & 7) + (&DAT_0010060c)[local_1c[iVar6]] + '\x01';
          }
          else {
            cVar7 = (magnitude & 7) + 1;
          }
          pcVar4 = (char *)(local_1c[0] + DAT_0023be74);
          *pcVar4 = cVar7 + *pcVar4;
          iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        } while (local_1c[iVar6] != -1);
      }
    }
    break;
  case 0xd:
    if (magnitude != 4) {
      return 0;
    }
    puVar3 = &DAT_0023bc9c;
LAB_00066398:
    *puVar3 = 1;
  }
  return 0;
}




// was FUN_000664bc -- fills param_1[0..2] (default color index 0x15 each) with per-light-source
// color indices derived from the ambient- light contributions packed at DAT_00086df8+0x3e (same
// bitfield layout apply_equipped_item_effect's light scan uses)...
void compute_light_source_colors(byte *out_colors)
{
  char cVar1;
  uint uVar2;

  *out_colors = 0x15;
  out_colors[1] = 0x15;
  out_colors[2] = 0x15;
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    uVar2 = 0;
    do {
      cVar1 = (&DAT_00086dc8)[*(byte *)(DAT_00086df8 + uVar2 * 2 + 0x3e) & 0xf];
      out_colors[uVar2] = cVar1;
      out_colors[uVar2] = (*(byte *)(DAT_00086df8 + uVar2 * 2 + 0x3e) >> 4) + cVar1;
      uVar2 = uVar2 + 1 & 0xff;
    } while (uVar2 < (*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
  }
}




// was FUN_00066594 -- on level 7 only (DAT_00201b68==7), swaps the special floor texture between
// ids 0xc and 0xe via load_floor_texture_arenas as param_1 toggles on/off, then sets or clears bit
// 12 of the player status word at DAT_00086df8+0x61/0x62 to record the current state.
void update_level7_floor_hazard_state(uint active)
{
  char cVar1;
  uint uVar2;
  
  if (DAT_00201b68 == 7) {
    cVar1 = -1;
    if (active == 0) {
      if (DAT_0023adc0 == 0xc) {
        cVar1 = '\x0e';
      }
    }
    else if (DAT_0023adc0 != 0xc) {
      cVar1 = '\f';
    }
    if (-1 < cVar1) {
      /* BUG FIX: was `load_floor_texture_arenas()` with no arguments, relying on leftover register
         state -- cVar1 (just computed above, the new special-floor texture id 0xc/0xe) is the value
         that belongs here... */
      load_floor_texture_arenas(cVar1);
    }
  }
  uVar2 = *(ushort *)(DAT_00086df8 + 0x61) & 0xefff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar2;
  *(byte *)(DAT_00086df8 + 0x62) = (byte)(uVar2 >> 8) | (byte)(((active & 1) << 0xc) >> 8);
}




// was FUN_00066634 -- final step of refresh_player_equipment_effects: param_1 is the effect-flag
// bitmask accumulated by apply_equipped_item_effect's scan over equipped items (bit 0 unused, bits
// 1-3 each an independent penalty).
void apply_equipment_effect_penalties(uint effect_mask)
{
  uint uVar1;
  uint uVar2;
  byte bVar3;
  byte bVar4;
  byte bVar5;
  undefined1 auStack_c [4];
  
  bVar4 = 0;
  bVar5 = DAT_00086db0;
  do {
    if ((effect_mask & 1) != 0) {
      if (bVar4 == 1) {
        bVar3 = bVar5;
        if (0x10 < bVar5) {
          bVar3 = 0x10;
        }
        bVar5 = bVar5 - bVar3;
        DAT_00086db0 = bVar5;
      }
      else if (bVar4 == 2) {
        bVar3 = DAT_00086db1;
        if (5 < DAT_00086db1) {
          bVar3 = 5;
        }
        DAT_00086db1 = DAT_00086db1 - bVar3;
      }
      else if (bVar4 == 3) {
        bVar3 = DAT_00086db1;
        if (0x10 < DAT_00086db1) {
          bVar3 = 0x10;
        }
        DAT_00086db1 = DAT_00086db1 - bVar3;
      }
    }
    bVar4 = bVar4 + 1;
    uVar1 = effect_mask & 0xffff;
    effect_mask = uVar1 >> 1;
  } while (bVar4 < 4);
  uVar2 = 0;
  do {
    *(byte *)(uVar2 + DAT_0023be74) = ((byte)(uVar1 >> 5) & 0xf) + *(char *)(uVar2 + DAT_0023be74);
    uVar2 = uVar2 + 1 & 0xff;
  } while (uVar2 < 4);
  update_level7_floor_hazard_state(DAT_0023bc9c);
  compute_light_source_colors(auStack_c);
  update_light_source_color_icons(auStack_c);
}




// ARM 0x6674c calculates armor protection from OBJECTS.DAT and item quality.
// Its table starts at item 0x20; the old separate backing array never loaded
// those protection values. Keep the existing function name for its callers.

// was FUN_0006674c
int compute_object_weight(ushort *object)
{
  ushort uVar1;
  int iVar2;
  
  uVar1 = *object;
  if (((uVar1 & 0x1c0) == 0) && ((uVar1 & 0x30) < 0x20)) {
    iVar2 = 0;
  }
  else {
    iVar2 = (((int)((uint)(byte) g_armor_type_props[((uVar1 & 0x1ff)) - 0x20].protection * ((byte)object[2] & 0x3f)) >>
              6) + 1) * 0x10000 >> 0x10;
  }
  return iVar2;
}




// was FUN_0006907c -- starts a smooth camera transition: sets the "turn animation in flight" flag
// (DAT_0023bea8, gates update_current_view_from_subject's own per-tick facing interpolation),
// resets the camera-shake accumulators, forces a resync...
void trigger_view_transition()

{
  int uw_ord2005_rem_126 = 0;
  uint uVar1;
  char cVar2;
  char cVar3;
  ushort uVar4;
  undefined4 uVar5;
  int extraout_r1;
  uint uVar6;
  int iVar7;
  char *player_rec;
  byte bVar8;
  short sVar9;
  bool bVar10;
  
  cVar3 = '\x01';
  DAT_0023bea8 = 1;
  bVar8 = 1;
  set_pending_update_flags(2);
  DAT_0023be9e = 0;
  DAT_0023be9c = 0;
  DAT_0023be9a = 0;
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 0x11) != 0) &&
     (sVar9 = -(ushort)*(byte *)(DAT_00086df8 + 0xb9), DAT_0023be98 = sVar9,
     0x50 < *(byte *)(DAT_00086df8 + 0xb9))) {
    iVar7 = (int)g_jump_ascent_timer;
    cVar2 = ordint_divmod((int)DAT_00202078 >> 1,(int)(iVar7) << 2).quot;
    cVar3 = (char)(cVar2 + -3);
    if ((cVar2 + -3) * 0x1000000 >> 0x18 < 1) {
      cVar3 = '\x01';
    }
    bVar8 = DAT_0023bf18 >> 4;
    if (iVar7 == 0) {
      uVar4 = ce_rand();
      DAT_0023be9e = (uVar4 & 0x1ff) - 0x100;
      sVar9 = DAT_0023be98;
    }
    else {
      DAT_0023be9e = (short)(char)(&DAT_00086e58)[(char)bVar8] * (short)cVar3 * 0x40;
    }
    DAT_0023be98 = sVar9 + (short)(char)(&DAT_00086e58)[(int)(char)bVar8 + 2U & 0xf] * (short)cVar3
                           * 2;
    uVar4 = ce_rand();
    /* HACK: replace ARM's per-tick random water yaw with three smooth sine waves at 0.55, 1.1 and
       1.9 Hz. The shared game clock uses 4 ms units, so phase depends on elapsed time, not tick
       count. Weights sum to 64, retaining the original speed-scaled amplitude. */
    {
      double phase = (double)uw_frame_clock_ms() * 0.004 * 6.283185307179586;
      DAT_0023be9a = (short)((32.0 * sin(phase * 0.55) +
                             20.0 * sin(phase * 1.1) +
                             12.0 * sin(phase * 1.9)) * (short)cVar3);
    }
    uVar4 = ce_rand();
    DAT_0023be9c = ((uVar4 & 0x7f) - 0x40) * (short)cVar3;
  }
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 2) != 0) && (DAT_0023bc98 == 0)) {
    uVar5 = ce_rand();
    uw_ord2005_rem_126 = ((int)(uVar5)) % (5);
    if (uw_ord2005_rem_126 == 0) {
      apply_typed_damage_to_object(g_player_object,0,0,0,1,8);
    }
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 8) != 0) {
    uVar6 = 0x10 - (DAT_0023bf18 >> 3);
    uVar1 = (int)uVar6 >> 0x1f;
    DAT_0023be98 = (short)(((uVar6 ^ uVar1) - uVar1) * 0x10000 >> 0x10) * 3;
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 0x60) != 0) {
    player_rec = DAT_00086df8;
    if ((*(byte *)(DAT_00086df8 + 0xb8) & 0x40) != 0) {
      bVar10 = DAT_0023bf14 == '\0';
      DAT_0023bf14 = DAT_0023bf14 + -1;
      if (bVar10) {
        *(byte *)(DAT_00086df8 + 0xb8) = *(byte *)(DAT_00086df8 + 0xb8) ^ 0x40;
        set_pending_update_flags(2);
      }
      player_rec = DAT_00086df8;
      cVar3 = ordint_divmod(10,DAT_0023bf14).quot;
      if ('\b' < cVar3) {
        cVar3 = '\b';
      }
    }
    if ((*(byte *)(player_rec + 0xb8) & 0x20) != 0) {
      bVar10 = DAT_0023bf10 == 0;
      DAT_0023bf10 = DAT_0023bf10 - 1;
      if (bVar10) {
        *(byte *)(player_rec + 0xb8) = *(byte *)(player_rec + 0xb8) ^ 0x20;
        set_pending_update_flags(2);
      }
      bVar8 = DAT_0023bf10 >> 3;
      if (3 < bVar8) {
        bVar8 = 3;
      }
    }
    cVar3 = bVar8 + cVar3;
    uVar4 = ce_rand();
    DAT_0023be9a = ((uVar4 & 0xff) - 0x80) * (short)cVar3 + DAT_0023be9a;
    uVar4 = ce_rand();
    DAT_0023be9c = ((uVar4 & 0x7f) - 0x40) * (short)cVar3 + DAT_0023be9c;
    uVar4 = ce_rand();
    DAT_0023be9e = ((uVar4 & 0x1ff) - 0x100) * (short)cVar3 + DAT_0023be9e;
  }
  return;
}



// was FUN_00069424 -- sets a movement-animation sub-timer (DAT_0023bf10 for param_1==0x20
// "landing", DAT_0023bf14 for param_1==0x40 "jump") to param_2 and ORs the corresponding bit into
// the player's landing-state status byte (DAT_00086df8+0xb8).
void set_movement_animation_timer(byte timer_id, byte ticks)
{
  undefined1 *puVar1;
  
  if (timer_id == 0x20) {
    puVar1 = &DAT_0023bf10;
  }
  else {
    if (timer_id != 0x40) {
      return;
    }
    puVar1 = &DAT_0023bf14;
  }
  *puVar1 = ticks;
  *(byte *)(DAT_00086df8 + 0xb8) = *(byte *)(DAT_00086df8 + 0xb8) | timer_id;
}



// Writes g_current_view (world x/y/elevation/facing + camera-shake offsets) from whichever object
// DAT_0023b82c currently designates as the view subject -- the player object (the common case), a
// specific NPC/mobile object being looked at...
void update_current_view_from_subject()

{
  int iVar1;
  undefined2 uVar2;
  int iVar3;
  short sVar4;
  int iVar5;
  short local_c;
  short local_a;

  if (DAT_0023b82c == (char *)g_player_object) {
    g_current_view->view_x = DAT_00204880;
    g_current_view->view_y = DAT_00204882;
    g_current_view->view_elevation = DAT_00204884 + 0xa4;
    g_current_view->view_facing = DAT_00201c70;
    g_current_view->view_shake_x = DAT_0023beb4;
    g_current_view->view_shake_y = DAT_0023beb8;
    if (DAT_0023bea8 == 0) {
      return;
    }
    g_current_view->view_elevation = g_current_view->view_elevation + DAT_0023be98;
    if (1000 < g_current_view->view_elevation) {
      g_current_view->view_elevation = 1000;
    }
    g_current_view->view_facing = g_current_view->view_facing + DAT_0023be9a;
    g_current_view->view_shake_x = g_current_view->view_shake_x + DAT_0023be9c;
    sVar4 = g_current_view->view_shake_y + DAT_0023be9e;
LAB_00069910:
    g_current_view->view_shake_y = sVar4;
  }
  else {
    if (DAT_0023b82c == 0) {
      g_current_view->view_x = DAT_0023be90;
      g_current_view->view_elevation = DAT_0023be94;
      g_current_view->view_y = DAT_0023be92;
      g_current_view->view_facing = DAT_0023bf00;
      g_current_view->view_shake_x = DAT_0023bf02;
      uVar2 = DAT_0023bf04;
    }
    else {
      if (DAT_002046b8 < DAT_0023b82c) {
        g_current_view->view_x =
             (short)((*(ushort *)(DAT_0023b82c + 0x16) & 0xfc00) >> 2) +
             (ushort)(*(byte *)(DAT_0023b82c + 3) & 0xe0);
        g_current_view->view_y =
             (*(byte *)(DAT_0023b82c + 3) & 0x1c) * 8 +
             (*(ushort *)(DAT_0023b82c + 0x16) & 0x3f0) * 0x10;
        g_current_view->view_elevation = ((*(byte *)(DAT_0023b82c + 2) & 0x7f) + 0x16) * 8;
        g_current_view->view_facing =
             ((*(ushort *)(DAT_0023b82c + 2) & 0xff80) +
             (short)(((*(byte *)(DAT_0023b82c + 0x18) & 0x1f) << 0x12) >> 0x10)) * 0x40;
        return;
      }
      if (DAT_0023b82c != DAT_002046b8 - 0x1b) {
        if (DAT_0023b82c != DAT_002046b8 - 0x36) {
          return;
        }
        angle_to_screen_delta(DAT_0023bea4,&local_a,&local_c);
        iVar1 = (int)((0x40 - (uint)DAT_0023bf08) * 0x10000) >> 0x10;
        iVar5 = (int)local_a;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0xff;
        }
        iVar5 = (short)((uint)iVar5 >> 8) * iVar1;
        iVar3 = (int)local_c;
        if (iVar5 < 0) {
          iVar5 = iVar5 + 0x3f;
        }
        if (iVar3 < 0) {
          iVar3 = iVar3 + 0xff;
        }
        iVar1 = (short)((uint)iVar3 >> 8) * iVar1;
        if (iVar1 < 0) {
          iVar1 = iVar1 + 0x3f;
        }
        iVar5 = (int)DAT_0023bea0 * (int)(short)(iVar5 >> 6);
        if (iVar5 < 0) {
          iVar5 = iVar5 + 1;
        }
        g_current_view->view_x =
             (short)(iVar5 >> 1) + (short)(((uint)DAT_0023beac << 0x18) >> 0x10) + 0x80;
        iVar1 = (int)DAT_0023bea0 * (int)(short)(iVar1 >> 6);
        if (iVar1 < 0) {
          iVar1 = iVar1 + 1;
        }
        g_current_view->view_y =
             (short)(iVar1 >> 1) + (short)(((uint)DAT_0023beb0 << 0x18) >> 0x10) + 0x80;
        g_current_view->view_elevation = DAT_00204884 + (0x52 - DAT_0023bf08) * 2;
        g_current_view->view_facing = DAT_0023bea4 + 0x7fff;
        g_current_view->view_shake_x = 0;
        sVar4 = DAT_0023bf08 << 0xb;
        goto LAB_00069910;
      }
      angle_to_screen_delta((int)DAT_00201c70,&local_c,&local_a);
      g_current_view->view_x = DAT_00204880 - (local_c >> 7);
      g_current_view->view_y = DAT_00204882 - (local_a >> 7);
      g_current_view->view_elevation = DAT_00204884 + 0x148;
      g_current_view->view_facing = DAT_00201c70;
      g_current_view->view_shake_x = DAT_0023beb4;
      uVar2 = DAT_0023beb8;
    }
    g_current_view->view_shake_y = uVar2;
  }
  return;
}



// was FUN_00069938 -- sync the 3D camera globals (DAT_000db438.. position, DAT_000db448 pitch /
// DAT_000db44c yaw) from the player object DAT_00086e6c (pos at +10/+0x12, view angle at +0x2c),
// applying the DAT_0023b4a0 screen -rotation quadrant.
void sync_camera_from_player()

{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  intptr_t iVar4; // holds DAT_00086e6c (a real pointer); was `int`, truncating it
  ushort uVar5;
  int iVar6;
  ushort uVar7;
  short sVar8;
  ushort local_20;

  cVar1 = DAT_0023b4a0;
  iVar4 = DAT_00086e6c;
  sVar8 = 0;
  uVar2 = g_current_view->view_x & 0xff;
  uVar5 = g_current_view->view_y & 0xff;
  uVar3 = uVar2;
  uVar7 = uVar5;
  if (DAT_0023b4a0 != '\0') {
    if (DAT_0023b4a0 == '\x01') {
      uVar3 = 0xff - uVar5;
      uVar7 = uVar2;
    }
    else if (DAT_0023b4a0 == '\x02') {
      uVar3 = 0xff - uVar2;
      uVar7 = 0xff - uVar5;
    }
    else {
      uVar3 = local_20;
      uVar7 = local_20;
      if (DAT_0023b4a0 == '\x03') {
        uVar3 = uVar5;
        uVar7 = 0xff - uVar2;
      }
    }
  }
  DAT_000db438 = ordfloat_int_to_float2((int)DAT_0023bf30 + (int)(short)uVar3 + 0x1000);
  DAT_000db43c = ordfloat_int_to_float2((int)*(short *)(iVar4 + 0xe) + (int)DAT_0023bf34);
  DAT_000db440 = ordfloat_int_to_float2((int)DAT_0023bf38 + (int)(short)uVar7);
  iVar6 = (int)DAT_0023beb4;
  if (iVar6 == 0) {
    DAT_000db448 = 0;
  }
  else if (iVar6 < 1) {
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0xff;
    }
    DAT_000db448 = (iVar6 >> 8) + (int)DAT_0023bf3c + 0x168;
  }
  else {
    if (iVar6 < 0) {
      iVar6 = iVar6 + 0xff;
    }
    DAT_000db448 = (iVar6 >> 8) + (int)DAT_0023bf3c;
  }
  /* Hack - Testing: --hack-pitch overrides the camera pitch angle (index into the sin/cos tables,
     0..360). */
  if (UW_OPT_ISSET(g_opts.hack_pitch)) DAT_000db448 = g_opts.hack_pitch;
  if (cVar1 == '\0') {
    sVar8 = *(short *)(iVar4 + 0x2c);
  }
  else if (cVar1 == '\x01') {
    sVar8 = *(short *)(iVar4 + 0x2c) + -0x4000;
  }
  else if (cVar1 == '\x02') {
    sVar8 = *(short *)(iVar4 + 0x2c) + -0x8000;
  }
  else if (cVar1 == '\x03') {
    sVar8 = *(short *)(iVar4 + 0x2c) + 0x4000;
  }
  if (sVar8 < 1) {
    /* Ghidra dropped the dividend: this is the 16-bit view angle sVar8 converted to degrees, angle
       / 180 (0xb4). Without sVar8 passed the divide ran on a leftover register -> yaw came out
       0/360 -> identity view rotation -> every tile projected behind the near plane. */
    iVar4 = ordint_divmod(0xb4, (int)sVar8).quot;
    DAT_000db44c = iVar4 + DAT_0023bf40 + 0x168;
  }
  else {
    iVar4 = ordint_divmod(0xb4, (int)sVar8).quot;
    DAT_000db44c = iVar4 + DAT_0023bf40;
  }
  /* Position/heading debug print (--debug), for correlating a live playtester's exact standing
     spot/facing with what the decompile is doing -- e.g. pinning down the wall-decal depth/
     parallax issue. */
  if (g_opts.debug) {
    static int _last_x = -1, _last_y = -1, _last_z = -1, _last_yaw = -1, _last_pitch = -1;
    int _x = (unsigned short)DAT_00204880;
    int _y = (unsigned short)DAT_00204882;
    int _z = (short)DAT_00204884;
    int _yaw = (int)lround(fmod((double)(unsigned short)DAT_00201c70 * (360.0 / 65536.0), 360.0));
    if (_x != _last_x || _y != _last_y || _z != _last_z ||
        _yaw != _last_yaw || DAT_000db448 != _last_pitch) {
      _last_x = _x; _last_y = _y; _last_z = _z;
      _last_yaw = _yaw; _last_pitch = DAT_000db448;
      fprintf(stderr, "[playerpos] tile=(%.2f,%.2f) z=%d yaw=%d pitch=%d\n",
              _x / 256.0, _y / 256.0, _z, _yaw, (int)DAT_000db448);
    }
  }
  return;
}




// was FUN_00069b68 -- the game's general skill-check roll: rolls a random value mod 31, offsets it
// by (param_1 - param_2) (typically a skill/stat value minus a difficulty threshold), and buckets
// the result into -1 (critical failure, <3), 0 (failure, 3-15), 1 (success, 16-28)...
int roll_skill_check(int skill, int difficulty)
{
  int uw_ord2005_rem_127 = 0;
  int iVar1;
  undefined4 uVar2;
  short extraout_r1;
  
  uVar2 = ce_rand();
  uw_ord2005_rem_127 = ((int)(uVar2)) % (0x1f);
  iVar1 = ((uw_ord2005_rem_127 - difficulty) + skill) * 0x10000 >> 0x10;
  if (iVar1 < 0x1d) {
    if (iVar1 < 0x10) {
      uVar2 = 0;
      if (iVar1 < 3) {
        uVar2 = 0xffffffff;
      }
    }
    else {
      uVar2 = 1;
    }
  }
  else {
    uVar2 = 2;
  }
  return uVar2;
}




// was FUN_00069bd0 -- add param_1 experience points to the character
// (DAT_00086df8 + 0x4e), capped per call, and run advance_character_level
// when the original XP / 500 threshold table is crossed.
void grant_experience_points(short points)
{
  byte bVar1;
  uint uVar2;
  uint uVar3;
  short sVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  char *iVar8;
  
  iVar8 = DAT_00086df8;
  iVar7 = (int)points;
  if (iVar7 < 0) {
    uVar2 = *(uint *)(DAT_00086df8 + 0x4e);
    if ((uint)-iVar7 < uVar2 || -uVar2 == iVar7) {
      iVar7 = uVar2 + iVar7;
    }
    else {
      iVar7 = 0;
    }
    *(char *)(DAT_00086df8 + 0x4e) = (char)iVar7;
    *(char *)(DAT_00086df8 + 0x4f) = (char)((uint)iVar7 >> 8);
    *(char *)(DAT_00086df8 + 0x50) = (char)((uint)iVar7 >> 0x10);
    *(char *)(DAT_00086df8 + 0x51) = (char)((uint)iVar7 >> 0x18);
  }
  else if (*(uint *)(DAT_00086df8 + 0x4e) < 0x17701) {
    if ((DAT_00201b68 + 1) * 2 < (int)(uint)*(byte *)(DAT_00086df8 + 0x3d)) {
      if (iVar7 < 0) {
        iVar7 = iVar7 + 1;
      }
      points = (short)(iVar7 >> 1) + 1;
    }
    sVar4 = orduint_divmod(3000,*(uint *)(DAT_00086df8 + 0x4e) + (int)points).quot;
    if ((short)(ushort)*(byte *)(iVar8 + 0x53) < sVar4) {
      *(byte *)(iVar8 + 0x52) = ((char)sVar4 - *(byte *)(iVar8 + 0x53)) + *(char *)(iVar8 + 0x52);
      *(char *)(DAT_00086df8 + 0x53) = (char)sVar4;
      iVar8 = DAT_00086df8;
    }
    uVar2 = *(uint *)(iVar8 + 0x4e);
    iVar7 = uVar2 + (int)points;
    *(char *)(iVar8 + 0x4e) = (char)iVar7;
    *(char *)(DAT_00086df8 + 0x4f) = (char)((uint)iVar7 >> 8);
    *(char *)(DAT_00086df8 + 0x50) = (char)((uint)iVar7 >> 0x10);
    *(char *)(DAT_00086df8 + 0x51) = (char)((uint)iVar7 >> 0x18);
    iVar8 = DAT_00086df8;
    iVar7 = 0;
    uVar3 = *(uint *)(DAT_00086df8 + 0x4e);
    sVar4 = orduint_divmod(500,uVar3).quot;  /* dividend dropped; ARM 0x69d88-0x69da4 */
    uVar5 = (uint)*(byte *)(iVar8 + 0x3d);
    bVar1 = (&DAT_00086e87)[uVar5];
    uVar6 = uVar5;
    while (((short)(ushort)bVar1 <= sVar4 && ((int)uVar6 < 0x10))) {
      iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      uVar6 = iVar7 + uVar5;
      bVar1 = (&DAT_00086e87)[uVar6];
    }
    if ((short)iVar7 != 0) {
      advance_character_level(iVar7);
    }
    if ((uint)(int)(short)(uVar2 >> 4) < uVar3 >> 4) {
      refresh_experience_display();
    }
  }
}



// was FUN_00069e30 -- redraws the stats panel's experience/level progress indicator, but only when
// that panel (g_active_hud_panel==2) is currently the active HUD view.
void refresh_experience_display()

{
  if (g_active_hud_panel == '\x02') {
    *g_draw_color_index = 0xf1;
    *DAT_00084298 = 0xf1;
    decrement_cursor_hide_depth();
    select_active_font(s_font5x6i_sys_00086e98);
    if (DAT_0024af8c != 0) {
      /* Ghidra dropped the arg here (relying on register carryover from the `!= 0` compare) -- same
         class of bug fixed throughout this session. DAT_0024af8c is the grtile key allocated in
         draw_stats_panel_content (uw.c), passed explicitly here. */
      restore_captured_grtile_backdrop(DAT_0024af8c);
    }
    draw_hp_stat_display();
    draw_mana_stat_display();
    draw_experience_points_display();
    select_active_font(s_font5x6p_sys_0008430c);
    cursor_show_idle_tick();
  }
  return;
}







// was FUN_00070224 -- update_screen_flicker_effect's "sub-effect 2" driver: param_1==0 restores the
// light remap table by reloading LIGHT.DAT/MONO.DAT (mirroring load_light_tables' own load),
// param_1!=0 zeroes its first 16 entries instead...
void toggle_light_table_flicker(int enable)
{
  char stack0xffdc324c_buf [256];
  char *stack0xffdc324c_ptr;
  char cVar1;
  int iVar2;
  char *pcVar3;
  char acStack_10c [260];
  
  if (enable == 0) {
    pcVar3 = &DAT_0023cca8;
    stack0xffdc324c_ptr = stack0xffdc324c_buf;
    do {
      cVar1 = *pcVar3;
      *stack0xffdc324c_ptr = cVar1; stack0xffdc324c_ptr = stack0xffdc324c_ptr + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    if (DAT_000872a0 == '\x05') {
      pcVar3 = s__DATA_mono_dat_000872b8;
    }
    else {
      pcVar3 = s__DATA_light_dat_000872c8;
    }
    ce_strcat(acStack_10c,pcVar3);
    iVar2 = open_file_for_read(acStack_10c);
    if (iVar2 != -1) {
      read_file_handle(iVar2,DAT_0024fa2c,0x1000);
      CloseHandle(iVar2);
    }
  }
  else {
    iVar2 = 0;
    do {
      *(undefined1 *)(DAT_0024fa2c + iVar2 * 0x100) = 0;
      *(undefined1 *)(DAT_0024fa2c + iVar2 * 0x100 + 1) = 0;
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < 0x10);
  }
}






// was FUN_000703a0 -- recalculates maximum HP (30 + level * STR / 5), maximum mana ((casting skill
// + 1) * INT / 8), and carrying capacity (STR * 20, in tenths of a stone). Level 7 keeps normal
// maximum mana at +0xb0 while its special state occupies +0x38.
int recalculate_player_stats(int refill_mana)
{
  undefined1 uVar1;
  char cVar2;
  char *iVar3;
  uint carry_capacity;
  
  iVar3 = DAT_0023be74;
  cVar2 = ordint_divmod(5,(uint)*(byte *)(DAT_00086df8 + 0x3d) * (uint)*(byte *)(DAT_0023be74 + 5)).quot;
  *(char *)(iVar3 + 4) = cVar2 + '\x1e';
  uVar1 = (undefined1)
          ((int)((*(byte *)(DAT_00086df8 + 0x28) + 1) * (uint)*(byte *)(DAT_0023be74 + 7)) >> 3);
  if (DAT_00201b68 == 7) {
    *(undefined1 *)(DAT_00086df8 + 0xb0) = uVar1;
  }
  else {
    *(undefined1 *)(DAT_00086df8 + 0x38) = uVar1;
  }
  carry_capacity = (uint)*(byte *)(DAT_0023be74 + 5) * 0x14;
  *(char *)(DAT_00086df8 + 0x4c) = (char)carry_capacity;
  *(char *)(DAT_00086df8 + 0x4d) = (char)(carry_capacity >> 8);
  if (refill_mana != 0) {
    *(undefined1 *)(DAT_00086df8 + 0x37) = *(undefined1 *)(DAT_00086df8 + 0x38);
  }
  return 0;
}



// was FUN_00070464 -- raise the character level byte (DAT_00086df8 + 0x3d)
// by param_1, show the "attained experience level N" scroll message, and
// bump the dependent stat at +0x52.
void advance_character_level(char levels)
{
  int uw_ord2005_rem_138 = 0;
  char *iVar1;
  char cVar2;
  int extraout_r1;
  
  *(char *)(DAT_00086df8 + 0x3d) = *(char *)(DAT_00086df8 + 0x3d) + levels;
  iVar1 = DAT_00086df8;
  if (*(byte *)(DAT_00086df8 + 0x3d) < 10) {
    DAT_0008730c = ' ';
  }
  else {
    cVar2 = ordint_divmod(10,(uint)*(byte *)(iVar1 + 0x3d)).quot;
    DAT_0008730c = cVar2 + '0';
  }
  uw_ord2005_rem_138 = ((int)(*(undefined1 *)(iVar1 + 0x3d))) % (10);
  DAT_0008730d = (undefined1)((uint)((uw_ord2005_rem_138 + 0x30) * 0x1000000) >> 0x18);
  print_scroll_message_by_id(0x93);
  message_scroll_print_wrapped(&DAT_0008730c);
  *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + levels;
  recalculate_player_stats(0);
  refresh_stats_panel_if_active();
}



// was FUN_00070524 -- 3-way tier classifier: param_1<7 -> tier 0, param_1>9 -> tier 1, otherwise
// (7..9) -> tier 2.
int classify_skill_training_tier(short value)
{
  undefined4 uVar1;
  
  if (value < 7) {
    uVar1 = 0;
  }
  else {
    uVar1 = 2;
    if (9 < value) {
      uVar1 = 1;
    }
  }
  return uVar1;
}



// was FUN_00070548 -- advances the skill/combat-category progress byte at
// DAT_00086df8[param_1+0x21] (one of the per-skill bytes babl.c's own "play_arms" variable sums,
// see its comment) toward its 30 (0x1e) cap...
void advance_skill_training(short skill_index)
{
  int iVar1;
  undefined1 uVar2;
  char cVar3;
  short sVar4;
  /* iVar5 doubles as a real pointer (DAT_00086df8 + iVar1) early on
     and a plain int loop counter (from sVar7) later -- mutually
     exclusive, but both squeezed into `int`, truncating the pointer. */
  char *pcVar_df8;
  int iVar5;
  undefined2 uVar6;
  short sVar7;

  iVar1 = (int)skill_index;
  if (*(char *)(iVar1 + DAT_00086df8 + 0x21) == '\0') {
    cVar3 = '\x03';
    uVar6 = 9;
    sVar7 = 3;
  }
  else {
    cVar3 = '\x01';
    uVar6 = 0xd;
    sVar7 = 2;
  }
  /* BUG FIX: was `classify_skill_training_tier()` with no argument -- dropped by Ghidra (same "ARM
     register-leftover doesn't survive a literal recompile" idiom as every other dropped-argument
     bug in this file). */
  sVar4 = classify_skill_training_tier(skill_index);
  uVar2 = *(undefined1 *)(DAT_0023be74 + sVar4 + 5);
  *(char *)(iVar1 + DAT_00086df8 + 0x21) = *(char *)(iVar1 + DAT_00086df8 + 0x21) + cVar3;
  pcVar_df8 = DAT_00086df8 + iVar1;
  cVar3 = ordint_divmod(uVar6,uVar2).quot;
  *(char *)(pcVar_df8 + 0x21) = cVar3 + *(char *)(pcVar_df8 + 0x21);
  iVar5 = (int)sVar7;
  cVar3 = rand_below(iVar5);
  *(char *)(iVar1 + DAT_00086df8 + 0x21) = *(char *)(iVar1 + DAT_00086df8 + 0x21) + cVar3;
  if (iVar5 != 0) {
    do {
      cVar3 = roll_skill_check(uVar2,0x14);
      *(char *)(iVar1 + 0x21 + DAT_00086df8) = *(char *)(iVar1 + 0x21 + DAT_00086df8) + cVar3;
      iVar5 = (iVar5 + -1) * 0x10000 >> 0x10;
    } while (0 < iVar5);
  }
  if (0x1e < *(byte *)(iVar1 + DAT_00086df8 + 0x21)) {
    *(undefined1 *)(iVar1 + DAT_00086df8 + 0x21) = 0x1e;
  }
}






// WARNING: Removing unreachable block (ram,0x00070700)

// was FUN_0007067c -- the "skill improves through use" roll: on a successful use of skill param_1,
// fails outright (returns false, no change) if the skill's current progress
// (DAT_00086df8[param_1+0x21]) already exceeds double its class/tier's base value...
int roll_skill_use_improvement(char skill_index)
{
  int iVar1;
  undefined1 uVar2;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  int extraout_r1;
  uint uVar6;
  int iVar7;
  /* Was `int`, truncating the real 64-bit pointer `iVar1 + DAT_00086df8` (DAT_00086df8 is `char *`)
     down to 32 bits before it was dereferenced just below... */
  char *pcVar_skillrow;
  undefined4 uVar8;

  uVar8 = 1;
  sVar4 = classify_skill_training_tier((int)skill_index);
  iVar7 = (int)sVar4;
  uVar2 = (&DAT_00087308)[iVar7];
  iVar1 = (int)skill_index;
  uVar6 = (uint)*(byte *)(iVar7 + DAT_0023be74 + 5);
  bVar3 = *(byte *)(iVar1 + DAT_00086df8 + 0x21);
  if ((uVar6 * 2 < (uint)bVar3) || (0x1d < bVar3)) {
    uVar8 = 0;
  }
  else {
    *(byte *)(iVar1 + DAT_00086df8 + 0x21) = bVar3 + 1;
    if (iVar7 != 0) {
      bVar3 = *(byte *)(iVar1 + DAT_00086df8 + 0x21);
      if ((uint)bVar3 < (uint)((int)uVar6 >> 1)) {
        *(byte *)(iVar1 + DAT_00086df8 + 0x21) = bVar3 + 1;
      }
    }
    if (*(byte *)(iVar1 + DAT_00086df8 + 0x21) < uVar6) {
      uVar5 = ce_rand();
      pcVar_skillrow = iVar1 + DAT_00086df8;
      bVar3 = *(byte *)(pcVar_skillrow + 0x21);
      extraout_r1 = ordint_divmod(uVar2,uVar5).rem;
      if (extraout_r1 < (int)(uVar6 - bVar3)) {
        *(byte *)(pcVar_skillrow + 0x21) = bVar3 + 1;
      }
    }
    if (0x1e < *(byte *)(iVar1 + DAT_00086df8 + 0x21)) {
      *(undefined1 *)(iVar1 + DAT_00086df8 + 0x21) = 0x1e;
    }
  }
  if (iVar1 == 8) {
    clear_temp_flags_on_all_objects();
    if (DAT_00201b68 < 9) {
      *(undefined1 *)(DAT_00201b68 + DAT_00086df8 + 0xc2) = *(undefined1 *)(DAT_00086df8 + 0x29);
    }
  }
  return uVar8;
}






// was FUN_000707c8 -- prints a single skill-improvement message: param_2==0 shows message 0x1b ("no
// improvement"), otherwise message 0x1c followed by param_1's skill name (resolved via
// get_message_string(param_1+0x1f|0x400), the skill-name string-id range).
void print_single_skill_improvement_message(int skill_index, int improved)
{
  if (improved == 0) {
    print_scroll_message_by_id(0x1b);
  }
  else {
    print_scroll_message_by_id(0x1c);
    message_scroll_print_wrapped(get_message_string(skill_index + 0x1fU | 0x400));
    message_scroll_print_wrapped(&DAT_00084f20);
  }
}



// was FUN_0007080c -- prints a comma/and-joined list of improved skill names from param_1 (a byte
// array of skill ids, -1-terminated, up to 4 entries): message 0x1e if the list is empty
// (*param_1==-1), else message 0x1d followed by each skill name...
void print_skill_improvement_list(char *skill_ids)
{
  char *pcVar1;
  int iVar2;
  
  if (*skill_ids == -1) {
    print_scroll_message_by_id(0x1e);
  }
  else {
    print_scroll_message_by_id(0x1d);
    if (*skill_ids != -1) {
      iVar2 = 0;
      do {
        if (3 < iVar2) break;
        if (iVar2 == 3) {
LAB_00070870:
          pcVar1 = s_and_00087310;
LAB_00070874:
          message_scroll_print_wrapped(pcVar1);
        }
        else if (iVar2 != 0) {
          if (skill_ids[iVar2 + 1] == -1) goto LAB_00070870;
          pcVar1 = DAT_00087318;
          goto LAB_00070874;
        }
        message_scroll_print_wrapped(get_message_string((byte)skill_ids[iVar2] + 0x1f | 0x400));
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (skill_ids[iVar2] != -1);
    }
    message_scroll_print_wrapped(&DAT_00084f20);
  }
}






// was FUN_000708bc -- the "Chant the mantra" feature: prompts for a typed mantra word
// (scroll_text_entry_prompt), matches it against the known-mantra string table...
void handle_mantra_chant()

{
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  char *msg_text;
  void *held_item;
  char cVar11;
  uint uVar12;
  short sVar13;
  char *pcVar_typed;
  char *pcVar_name;
  undefined1 local_60 [8];
  undefined1 local_58 [52];

  local_58[0] = 0;
  scroll_text_entry_prompt(s_Chant_the_mantra__0008731c,0,local_58,1,10);
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  iVar10 = 0x33;
  do {
    /* uVar4/uVar5 were `undefined4` (32-bit) here, truncating _strupr's and get_message_string's
       real 64-bit pointer returns -- the same pointer-truncation bug class already fixed at dozens
       of other get_message_string call sites in this codebase... */
    pcVar_typed = (char *)_strupr(local_58);
    pcVar_name = get_message_string((int)(char)iVar10 | 0x400);
    iVar6 = ce_strcmp(pcVar_name,pcVar_typed);
    if (iVar6 == 0) break;
    iVar10 = iVar10 + 1;
  } while (iVar10 * 0x1000000 >> 0x18 < 0x4d);
  if ((char)iVar10 == 'M') {
    print_scroll_message_by_id(0x19);
    goto LAB_00070b58;
  }
  iVar10 = iVar10 + -0x33;
  iVar6 = iVar10 * 0x1000000 >> 0x18;
  if (iVar6 < 0x14) {
    if (*(char *)(DAT_00086df8 + 0x52) == '\0') {
LAB_00070980:
      print_scroll_message_by_id(0x18);
    }
    else {
      iVar6 = roll_skill_use_improvement(iVar10);
      iVar7 = roll_skill_use_improvement(iVar10);
      if ((iVar6 == 0) && (iVar7 == 0)) {
LAB_000709e0:
        uVar4 = 0;
      }
      else {
        print_scroll_message_by_id(0x1a);
        *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + -1;
        if ((iVar6 == 0) && (iVar7 == 0)) goto LAB_000709e0;
        uVar4 = 1;
      }
      print_single_skill_improvement_message(iVar10 * 0x1000000 >> 0x18,uVar4);
    }
  }
  else {
    if (iVar6 == 0x14) {
      if ((*(byte *)(DAT_00086df8 + 0x60) & 0x80) == 0) {
        msg_text = get_message_string(0x223);
        print_message_with_proximity_qualifier(msg_text,
                                               g_player_object->npc_xhome,
                                               g_player_object->npc_yhome,
                                               (int)DAT_00201b68,0x18,0x2d,3,4
                    );
      }
LAB_00070c78:
      busy_wait_ms(0x20);
      return;
    }
    if (iVar6 == 0x15) {
      if (((*(byte *)(DAT_00086df8 + 0x60) & 0x40) == 0) &&
         (held_item = begin_holding_object_on_cursor(0,0xe1), held_item != 0)) {
        print_scroll_message_by_id(0x1e);
        uVar2 = *(undefined2 *)(DAT_00086df8 + 0x5f);
        *(char *)(DAT_00086df8 + 0x5f) = (char)uVar2;
        *(byte *)(DAT_00086df8 + 0x60) = (byte)((ushort)uVar2 >> 8) | 0x40;
      }
      goto LAB_00070c78;
    }
    if (iVar6 == 0x16) {
      print_scroll_message_by_id(0x1f);
      goto LAB_00070c78;
    }
    if (iVar6 == 0x17) {
      sVar13 = 0;
      cVar11 = '\a';
      sVar3 = 3;
    }
    else if (iVar6 == 0x18) {
      sVar13 = 7;
      cVar11 = '\x03';
      sVar3 = 2;
    }
    else {
      if (iVar6 != 0x19) goto LAB_00070c78;
      sVar13 = 10;
      cVar11 = '\n';
      sVar3 = 4;
    }
    if (*(char *)(DAT_00086df8 + 0x52) == '\0') goto LAB_00070980;
    local_60[0] = 0xff;
    uVar12 = 0;
    local_60[1] = 0xff;
    local_60[2] = 0xff;
    local_60[3] = 0xff;
    iVar10 = (int)cVar11;
    iVar6 = (int)sVar3;
    while ((iVar6 != 0 &&
           (cVar1 = (char)iVar10, iVar10 = (cVar1 + -1) * 0x1000000 >> 0x18, cVar1 != 0))) {
      if ((sVar13 == 7) &&
         ((*(byte *)(DAT_00086df8 + 0x28) < 8 && (uVar8 = ce_rand(), (uVar8 & 2) != 0)))) {
        iVar7 = 7;
      }
      else {
        iVar7 = rand_below(cVar11);
        iVar7 = (sVar13 + iVar7) * 0x1000000 >> 0x18;
      }
      iVar9 = roll_skill_use_improvement(iVar7);
      if (iVar9 != 0) {
        local_60[uVar12] = (char)iVar7;
        uVar12 = uVar12 + 1 & 0xff;
      }
      iVar6 = (iVar6 + -1) * 0x10000 >> 0x10;
    }
    print_skill_improvement_list(local_60);
    *(char *)(DAT_00086df8 + 0x52) = *(char *)(DAT_00086df8 + 0x52) + -1;
  }
  recalculate_player_stats(0);
  refresh_stats_panel_if_active();
LAB_00070b58:
  refresh_player_equipment_effects();
  busy_wait_ms(0x20);
  reset_keyboard_char_input();
  noop_post_input_reset_hook();
  return;
}






// was FUN_00070c90 -- draws the full character-sheet text overlay (name, class, level, elapsed game
// time (DAT_00086df8+0xce, this project's already-documented game_time field), the 6 core
// attributes in a 3-column grid)...
void render_endgame_character_stats()

{
  int uw_ord2005_rem_139 = 0; int uw_ord2005_rem_140 = 0; int uw_ord2005_rem_141 = 0; int uw_ord2005_rem_142 = 0;
  byte bVar1;
  short sVar2;
  char cVar3;
  undefined1 uVar4;
  byte bVar5;
  short sVar6;
  /* Was `undefined4`, truncating get_message_string's real char* return on this 64-bit host -- same
     bug class as the other get_message_string truncation fixes this session (e.g.
     character_generator_loop's uVar10). */
  char *uVar7;
  char *pcVar8;
  int iVar9;
  undefined4 uVar10;
  char extraout_r1;
  char extraout_r1_00;
  short extraout_r1_01;
  char *pcVar11;
  int extraout_r1_02;
  int iVar12;
  char *player_rec;
  int iVar13;
  int iVar14;
  char *font_hdr;
  short local_70;
  undefined1 auStack_68 [16];
  char local_58 [52];

  select_active_font(s_fontchar_sys_00087330);
  *DAT_00084298 = 0x5c;
  *g_draw_color_index = 0x5c;
  uVar7 = get_message_string((int)DAT_00201c74);
  /* Was `measure_text_width()` with no argument -- see draw_text_string/ measure_text_width's own
     comments above for the root "dropped argument" bug this matches; uVar7 (the string
     get_message_string just returned) is right here... */
  sVar6 = measure_text_width(uVar7);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(uVar7,0xa0 - (short)((int)(iVar12) >> 1),0x14);
  pcVar8 = (char *)get_message_string(699);
  pcVar11 = local_58;
  do {
    cVar3 = *pcVar8;
    pcVar8 = pcVar8 + 1;
    *pcVar11 = cVar3;
    pcVar11 = pcVar11 + 1;
  } while (cVar3 != '\0');
  sVar6 = ce_strlen(local_58);
  player_rec = DAT_00086df8;
  if (9 < *(byte *)(DAT_00086df8 + 0x3d)) {
    cVar3 = ordint_divmod(10,*(byte *)(DAT_00086df8 + 0x3d)).quot;  /* dividend dropped, same as advance_character_level */
    local_58[sVar6] = cVar3 + '0';
    sVar6 = (short)((uint)((sVar6 + 1) * 0x10000) >> 0x10);
  }
  uw_ord2005_rem_139 = ((int)(*(undefined1 *)(player_rec + 0x3d))) % (10);
  local_58[sVar6] = uw_ord2005_rem_139 + '0';
  iVar13 = (sVar6 + 1) * 0x10000 >> 0x10;
  local_58[iVar13] = ' ';
  local_58[(iVar13 + 1) * 0x10000 >> 0x10] = '\0';
  uVar7 = get_message_string((*(byte *)(player_rec + 100) >> 5) + 0x17 | 0x400);
  ce_strcat(local_58,uVar7);
  iVar13 = *(short *)(DAT_000879b0 + 6) + 0x14;
  sVar6 = measure_text_width(local_58);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(local_58,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  uVar7 = get_message_string(700);
  iVar13 = *(short *)(DAT_000879b0 + 6) + iVar13;
  sVar6 = measure_text_width(uVar7);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  draw_text_string(uVar7,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  /* First argument is NOT the address of a global despite how this first decompiled
     (`&DAT_001c2000`) -- see print_character_description_scroll's identical call in hud.c for the
     real-disassembly explanation... */
  sVar6 = orduint_divmod(0x1c2000,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  sVar6 = ordint_divmod(0xc,(int)sVar6).quot;
  pcVar8 = (char *)get_message_string(0x2bd);
  pcVar11 = local_58;
  do {
    cVar3 = *pcVar8;
    pcVar8 = pcVar8 + 1;
    *pcVar11 = cVar3;
    pcVar11 = pcVar11 + 1;
  } while (cVar3 != '\0');
  uVar7 = _itoa((int)sVar6,auStack_68,10);
  ce_strcat(local_58,uVar7);
  uVar7 = get_message_string(0x2be);
  ce_strcat(local_58,uVar7);
  sVar6 = measure_text_width(local_58);
  iVar12 = (int)sVar6;
  if (iVar12 < 0) {
    iVar12 = iVar12 + 1;
  }
  iVar13 = CONCAT11(*(undefined1 *)(DAT_000879b0 + 7),*(undefined1 *)(DAT_000879b0 + 6)) + iVar13;
  draw_text_string(local_58,0xa0 - (short)((int)(iVar12) >> 1),iVar13);
  iVar12 = 0;
  iVar13 = *(short *)(DAT_000879b0 + 6) + iVar13;
  do {
    font_hdr = DAT_000879b0;
    iVar9 = ordint_divmod(3,iVar12).quot;
    sVar6 = 0xbe;
    if (iVar9 == 0) {
      sVar6 = 0x50;
    }
    uw_ord2005_rem_140 = ((int)(iVar12)) % (3);
    sVar2 = *(short *)(font_hdr + 6);
    uVar7 = get_message_string((int)(uintptr_t)iVar12 + 0x11U | 0x400);
    if (-1 < iVar12) {
      if (iVar12 < 3) {
        uVar4 = *(undefined1 *)((int)(uintptr_t)iVar12 + DAT_0023be74 + 5);
      }
      else if (iVar12 == 3) {
        uVar4 = *(undefined1 *)(DAT_0023be74 + 4);
      }
      else {
        if (iVar12 != 4) {
          if (iVar12 == 5) {
            uVar10 = orduint_divmod(10,*(undefined4 *)(DAT_00086df8 + 0x4e)).quot;
            _ltoa(uVar10,local_58,10);
          }
          goto LAB_00071110;
        }
        uVar4 = *(undefined1 *)(DAT_00086df8 + 0x38);
      }
      itoa_radix(uVar4,local_58,10);
    }
LAB_00071110:
    local_70 = (short)((uint)(iVar13 * 0x10000) >> 0x10);
    iVar14 = (int)uw_ord2005_rem_140 * (int)sVar2 + (int)local_70;
    draw_text_string(uVar7,(int)sVar6,iVar14);
    draw_text_string(local_58,sVar6 + 0x2d,iVar14);
    iVar12 = ((int)(uintptr_t)iVar12 + 1) * 0x10000 >> 0x10;
    if (5 < iVar12) {
      iVar12 = 0;
      iVar13 = iVar13 + *(short *)(DAT_000879b0 + 6) * 2;
      do {
        bVar1 = *(byte *)((int)(uintptr_t)iVar12 + DAT_00086df8 + 0x21);
        uVar7 = get_message_string((int)(uintptr_t)iVar12 + 0x1fU | 0x400);
        bVar5 = bVar1;
        if (9 < bVar1) {
          bVar5 = ordint_divmod(10,bVar1).quot;
        }
        local_58[0] = bVar5 + 0x30;
        if (bVar1 < 10) {
          local_58[1] = '\0';
        }
        else {
          uw_ord2005_rem_141 = ((int)(bVar1)) % (10);
          local_58[1] = uw_ord2005_rem_141 + '0';
        }
        local_58[2] = 0;
        uw_ord2005_rem_142 = ((int)(iVar12)) % (3);
        iVar14 = uw_ord2005_rem_142;
        if (uw_ord2005_rem_142 == 0) {
          font_hdr = DAT_000879b0;
        }
        if (uw_ord2005_rem_142 == 0) {
          iVar13 = *(short *)(font_hdr + 6) + iVar13;
        }
        iVar14 = (short)uw_ord2005_rem_142 * 0x4a + 0x32;
        draw_text_string(uVar7,iVar14,iVar13);
        iVar9 = measure_text_width(local_58);
        draw_text_string(local_58,(iVar14 - iVar9) + 0x46,iVar13);
        iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
      } while (iVar12 < 0x14);
      flush_dirty_rect_to_display(1);
      return;
    }
  } while( true );
}






// was FUN_0007141c -- applies pending status effects around a rest action: clears any active
// screen-flash effect (bits 1/2 of DAT_00086df8+0xb8) both before and after settling
// movement/refreshing equipment effects...
void apply_rest_status_effects()

{
  int uw_ord2005_rem_144 = 0;
  undefined4 uVar1;
  char extraout_r1;
  undefined1 uVar2;

  if ((*(byte *)(DAT_00086df8 + 0xb8) & 3) != 0) {
    apply_typed_damage_to_object(g_player_object,0,0,0,0xff,0);
  }
  refresh_player_equipment_effects();
  settle_movement_to_rest();
  if (((*(byte *)(DAT_00086df8 + 0xb8) & 8) != 0) && ((DAT_0020208c & 0x16) == 0)) {
    uVar1 = ce_rand();
    uVar2 = 0x10;
    uw_ord2005_rem_144 = ((int)(uVar1)) % (6);
    apply_typed_damage_to_object(g_player_object,0,0,0,uw_ord2005_rem_144 * '\n' + '\f',uVar2);
  }
  if ((*(byte *)(DAT_00086df8 + 0xb8) & 3) != 0) {
    apply_typed_damage_to_object(g_player_object,0,0,0,0xff,0);
  }
  return;
}






// was FUN_00071510 -- the "Rest" command handler, reached either directly (param_1<0) or, for
// param_1>=0, only after passing preconditions...
void handle_rest_action(short mode)
{
  int uw_ord2005_rem_145 = 0; int uw_ord2005_rem_146 = 0; int uw_ord2005_rem_147 = 0;
  byte bVar1;
  bool bVar2;
  short sVar3;
  int iVar4;
  undefined4 uVar5;
  short extraout_r1;
  short extraout_r1_00;
  short extraout_r1_01;
  ushort uVar6;
  uint uVar7;
  int iVar8;
  
  bVar2 = true;
  if (mode < 0) {
LAB_0007158c:
    full_dungeon_redraw();
    set_pending_music_track(0xd);
    update_ingame_music_track();
    weapon_overlay_flash_hold(5);
    if (-1 < mode) {
      print_scroll_message_by_id(0x10);
    }
    tick_ambient_doors_and_scheduler(0);
    despawn_objects_outside_radius(1,0x14);
    uVar5 = ce_rand();
    uw_ord2005_rem_145 = ((int)(uVar5)) % (5);
    iVar8 = uw_ord2005_rem_145 + 2;
    iVar4 = (iVar8 * 0x10000 >> 0x10) * 0xe1000 + *(int *)(DAT_00086df8 + 0xce);
    *(char *)(DAT_00086df8 + 0xce) = (char)iVar4;
    *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar4 >> 8);
    *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar4 >> 0x10);
    *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar4 >> 0x18);
    uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfc3f;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar7;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    uVar7 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfff3;
    *(char *)(DAT_00086df8 + 0x61) = (char)uVar7;
    *(char *)(DAT_00086df8 + 0x62) = (char)(uVar7 >> 8);
    decay_equipped_light_sources(iVar8 * 0xb4,0);
    if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c) != 0) {
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) >> 2 & 0xf;
      apply_typed_damage_to_object(g_player_object,0,0,0,(char)((int)((uVar7 + 1) * uVar7) >> 1),0x10);
      uVar7 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
      *(char *)(DAT_00086df8 + 0x5f) = (char)uVar7;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar7 >> 8);
    }
    if (mode < 0) {
      apply_rest_status_effects();
    }
    if ((char)g_player_object->npc_hp == '\0') {
      pick_random_pending_music_track();
    }
    else {
      iVar4 = check_rest_interrupted_by_monster();
      if (iVar4 == 0) {
        advance_mobile_objects();
        process_nearby_background_traps(0);
        uVar5 = ce_rand();
        uw_ord2005_rem_146 = ((int)(uVar5)) % (4);
        iVar4 = (uw_ord2005_rem_146 - iVar8) + 7;
        if (g_player_object->npc_hp < 10) {
          uVar5 = ce_rand();
          uw_ord2005_rem_147 = ((int)(uVar5)) % (2);
          iVar4 = iVar4 + uw_ord2005_rem_147 + 1;
        }
        iVar8 = (short)iVar4 * 0xe1000 + *(int *)(DAT_00086df8 + 0xce);
        *(char *)(DAT_00086df8 + 0xce) = (char)iVar8;
        *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar8 >> 8);
        *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar8 >> 0x10);
        *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar8 >> 0x18);
        decay_equipped_light_sources(iVar4 * 0xb4,0);
        if ((*(byte *)(DAT_00086df8 + 0x39) < 0x41) || (iVar4 = 1, mode < 1)) {
          iVar4 = 0;
        }
        bVar1 = *(byte *)(DAT_00086df8 + 0x3a);
        *(undefined1 *)(DAT_00086df8 + 0x3a) = 0;
        iVar8 = (bVar1 >> 1) + 2;
        sVar3 = (short)iVar8;
        if (5 < (uint)(iVar8 * 0x10000 >> 0x10)) {
          sVar3 = 5;
        }
        if (*(char *)(DAT_00086df8 + 0x39) == '\0') {
          print_scroll_message_by_id(0x11);
          apply_typed_damage_to_object(g_player_object,0,0,0,2,0);
        }
        else {
          adjust_player_hp(g_player_object,(((short)iVar4 + 1) * (int)sVar3 * 0x1000000 >> 0x18) + -1);
          adjust_level7_hazard_value(g_player_object,-6);
          adjust_level7_hazard_value(g_player_object,((char)sVar3 + 1) * (int)(char)iVar4 + (int)(char)sVar3 + -1);
        }
        sVar3 = ce_rand();
        adjust_player_hunger(-0x18 - ((int)sVar3 & 0x1fU));
        uVar6 = *(ushort *)(DAT_00086df8 + 0x61);
        if ((uVar6 & 0x3f0) < 0x200) {
          uVar6 = uVar6 & 0xfc0f;
        }
        else {
          uVar6 = ((uVar6 & 0xfff0) - 0x1f1 ^ uVar6) & 0x3f0 ^ uVar6;
        }
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
        if (-1 < mode) {
          iVar8 = trigger_random_level_special_event(iVar4);
          bVar2 = true;
          if (iVar8 != 0) {
            bVar2 = false;
          }
        }
        print_scroll_message_by_id(0x13 - iVar4);
      }
      else {
        if (*(byte *)(DAT_00086df8 + 0x3a) < 0x21) {
          *(undefined1 *)(DAT_00086df8 + 0x3a) = 0;
        }
        else {
          *(byte *)(DAT_00086df8 + 0x3a) = *(byte *)(DAT_00086df8 + 0x3a) - 0x20;
        }
        print_scroll_message_by_id(0x15);
        sVar3 = ce_rand();
        adjust_player_hunger(-0xc - ((int)sVar3 & 0xfU));
        uVar6 = *(ushort *)(DAT_00086df8 + 0x61);
        if ((uVar6 & 0x3f0) < 0x100) {
          uVar6 = uVar6 & 0xfc0f;
        }
        else {
          uVar6 = ((uVar6 & 0xfff0) - 0xf1 ^ uVar6) & 0x3f0 ^ uVar6;
        }
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
      }
      refresh_player_equipment_effects();
      flush_pending_critter_resource_slots();
      g_jump_ascent_timer = 0;
      g_fall_accel = 0;
      DAT_0020488e = 0;
      DAT_0020488c = 0;
      g_vertical_velocity = 0;
      DAT_00204888 = 0;
      DAT_00204886 = 0;
      refresh_stats_panel_if_active();
      full_dungeon_redraw();
      pick_random_pending_music_track();
      if (bVar2) {
        weapon_overlay_flash_restore(5);
      }
      else {
        weapon_overlay_and_full_redraw();
      }
    }
  }
  else {
    if ((((*(byte *)(DAT_00086df8 + 0xb8) & 0x1b) == 0) && (g_fall_accel == 0)) &&
       (DAT_00201b68 != 9)) {
      iVar4 = check_rest_area_unsafe();
      if (iVar4 == 0) {
        print_scroll_message_by_id(0xf);
        goto LAB_0007158c;
      }
      uVar5 = 0xe;
    }
    else {
      uVar5 = 0x14;
    }
    print_scroll_message_by_id(uVar5);
  }
}






// was FUN_00071b08 -- adjusts the player's hunger byte (DAT_00086df8+0x39) by param_1, clamped to
// 0..0xff (returns false if it would go >=0x100 without applying anything).
int adjust_player_hunger(short delta)
{
  int iVar1;
  int iVar2;
  byte bVar3;
  undefined4 uVar4;
  
  iVar1 = ((int)delta + (uint)*(byte *)(DAT_00086df8 + 0x39)) * 0x10000;
  iVar2 = iVar1 >> 0x10;
  if (iVar2 < 0x100) {
    if (iVar2 < 0) {
      *(undefined1 *)(DAT_00086df8 + 0x39) = 0;
    }
    else {
      *(char *)(DAT_00086df8 + 0x39) = (char)((uint)iVar1 >> 0x10);
    }
    if (0 < delta) {
      bVar3 = *(byte *)(DAT_00086df8 + 0x3b) >> 3;
      if (8 < bVar3) {
        bVar3 = 8;
      }
      restore_stat_capped(g_player_object,bVar3);
      *(undefined1 *)(DAT_00086df8 + 0x3b) = 0;
    }
    uVar4 = 1;
  }
  else {
    uVar4 = 0;
  }
  return uVar4;
}



// was FUN_00071b94 -- the game-completion/victory sequence, gated on DAT_0023c27c (0 = the one-time
// "ending cutscene" stage not yet run, nonzero = show the victory stats screen).
void handle_game_victory_sequence()

{
  char stack0xffdc3244_buf [256];
  char *stack0xffdc3244_ptr;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  char *pcVar4;
  undefined2 *puVar5;
  char *iVar6;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  char *pcVar7;
  char *local_11c;  /* was `int` -- same truncation, derived from iVar6 */
  char acStack_114 [260];
  
  if (DAT_0023c27c == '\0') {
    if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
      puVar5 = (undefined2 *)spawn_new_object(0x15a,0);
      if (puVar5 != (undefined2 *)0x0) {
        uVar2 = ((uw_object_hdr_t *)puVar5)->type_flags;
        ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)uVar2;
        ((uw_object_hdr_t *)puVar5)->type_flags_high = (byte)((ushort)uVar2 >> 8) | 0x80;
        ((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner;
        ((uw_object_hdr_t *)puVar5)->link_word_high = 0xb0;
        iVar6 = tilemap_lookup(0x20,0x20);
        local_11c = iVar6 + 2;
        object_list_append_tail(local_11c,puVar5);
      }
      print_scroll_message_by_id(0x117);
      spin_view_full_rotation(0xffffffff);
      weapon_overlay_flash_hold(5);
      if (puVar5 != (undefined2 *)0x0) {
        object_list_unlink(local_11c,puVar5);
        free_object_slot(puVar5);
      }
      teleport_object_to_level_tile(g_player_object,0x1b,0x17,9);
      *(undefined1 *)(DAT_00086df8 + 0x6d) = 0xff;
      print_scroll_message_by_id(0x118);
      DAT_00085730 = DAT_00085730 & 0xfe;
      dungeon_view_anim_tick();
      DAT_00085730 = DAT_00085730 | 1;
    }
  }
  else {
    dirty_rect_union(0,200,0,0x140);
    *(undefined1 *)(DAT_00085a6c + 8) = 0;
    *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
    DAT_000868d8 = 2;
    display_book_or_scroll_page(1);
    decrement_cursor_hide_depth();
    clear_screen_and_restore_cursor();
    ce_memset(acStack_114,0,0x104);
    pcVar7 = &DAT_0023cca8;
    stack0xffdc3244_ptr = stack0xffdc3244_buf;
    pcVar4 = pcVar7;
    stack0xffdc3244_ptr = acStack_114;
    do {
      cVar1 = *pcVar4;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_win1_byt_00087350);
    blit_fullscreen_bitmap_file(7,acStack_114,1);
    Sleep(3000);
    dirty_rect_union(0,200,0,0x140);
    ce_memset(acStack_114,0,0x104);
    do {
      cVar1 = *pcVar7;
      *stack0xffdc3244_ptr = cVar1; stack0xffdc3244_ptr = stack0xffdc3244_ptr + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_114,s__DATA_win2_byt_00087340);
    blit_fullscreen_bitmap_file(0xffffffff,acStack_114,1);
    dirty_rect_union(0,200,0,0x140);
    render_endgame_character_stats();
    do {
      sVar3 = next_input_event();
    } while (sVar3 < 0);
    handle_player_death_and_menu_transition(0);
    DAT_0023c27c = '\0';
  }
  return;
}






// was FUN_00072288 -- the starvation handler: its one caller invokes this every turn the player's
// hunger byte (g_player_object+8) reads 0.
void handle_starvation_penalty()

{
  int uw_ord2005_rem_148 = 0;
  byte bVar1;
  undefined1 uVar2;
  byte bVar3;
  undefined2 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  short extraout_r1;
  uw_object_hdr_t *pNewObj;

  if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
    g_player_object->npc_hp = 4;
    return;
  }
  stop_current_audio_handle_dup();
  play_music_track(10,1);
  grant_experience_points((int)((uint)(*(uint3 *)(DAT_00086df8 + 0x4e) >> 3) * -0x10000) >> 0x10);
  full_dungeon_redraw();
  weapon_overlay_flash_hold(5);
  cancel_weapon_swing();
  if (g_selected_object != 0) {
    if ((g_cursor_holding_state == 1) || (g_cursor_holding_state == 0)) {
      drop_object_near_target(g_player_object,g_selected_object,6,0);
    }
    else if (g_cursor_holding_state != 2) goto LAB_00072374;
    g_cursor_holding_state = 0;
    g_selected_object = 0;
    pop_cursor_icon(3);
  }
LAB_00072374:
  uVar5 = ce_rand();
  uw_ord2005_rem_148 = ((int)(uVar5)) % (5);
  /* Was `iVar6 = spawn_new_object(...)` (plain int) -- spawn_new_object now really returns a fresh
     object pointer (see its fix) instead of always 0, so storing it in a 32-bit int truncates it on
     this 64-bit host. */
  pNewObj = spawn_new_object(uw_ord2005_rem_148 + 0xc2,0);
  iVar7 = place_object_in_world((int)DAT_00204880 >> 5,(int)DAT_00204882 >> 5,(int)DAT_00204884 >> 3,
                       pNewObj,0,1);
  if (iVar7 != 0) {
    uVar4 = pNewObj->position_word;
    bVar1 = (byte)uVar4;
    pNewObj->zpos = g_player_object->hdr.zpos;
    pNewObj->owner = 0x3f;
    uVar8 = (pNewObj->position_word ^ g_player_object->hdr.position_word) & 0x1fff ^
            (uint) g_player_object->hdr.position_word;
    uVar2 = (undefined1)uVar8;
    bVar3 = (byte)(uVar8 >> 8);
    pNewObj->xpos = bVar3 >> 5;
    bVar1 = (byte)(g_player_object->hdr.position_word >> 8);
    pNewObj->ypos = (bVar1 >> 2) & 7;
    settle_dropped_object(pNewObj,(int)DAT_00204880 >> 8,(int)DAT_00204882 >> 8,1);
  }
  if (((*(byte *)(DAT_00086df8 + 0x5e) & 0xf0) != 0) && (DAT_00201b68 != 9)) {
    teleport_object_to_level_tile(g_player_object,0x3f,0x3f,*(byte *)(DAT_00086df8 + 0x5e) >> 4);
    DAT_00201c9c = apply_special_object_use_effect;
    DAT_00085730 = 0;
    iVar6 = dungeon_view_anim_tick();
    DAT_00085730 = 3;
    if (iVar6 != 0) {
      display_book_or_scroll_page(0x102);
      show_error_dialog_stub_thunk();
      msg_scroll_panel_reset(1);
      return;
    }
  }
  handle_player_death_and_menu_transition(1);
  return;
}






// was FUN_00073e14 -- adjusts the level-7 hazard byte (DAT_00086df8+0x37, only when param_1 is the
// player object): param_2<=0 subtracts it as a delta from the current value; param_2>0 instead adds
// a randomized amount...
void adjust_level7_hazard_value(void *object_ptr, char delta)
{
  char *object = (char *)object_ptr;
  short sVar1;
  
  if ((void *)object == (void *)g_player_object) {
    if (delta < '\x01') {
      delta = *(char *)(DAT_00086df8 + 0x37) - delta;
    }
    else {
      sVar1 = ce_rand();
      delta = (char)((int)((((int)sVar1 & 3U) + (int)delta) *
                             (uint)*(byte *)(DAT_00086df8 + 0x38) * 0x10000) >> 0x14) +
                *(char *)(DAT_00086df8 + 0x37) + '\x01';
    }
    *(char *)(DAT_00086df8 + 0x37) = delta;
    if (*(byte *)(DAT_00086df8 + 0x38) < *(byte *)(DAT_00086df8 + 0x37)) {
      *(byte *)(DAT_00086df8 + 0x37) = *(byte *)(DAT_00086df8 + 0x38);
    }
    refresh_experience_display();
  }
}






// was FUN_00073f60
void restore_stat_capped(void *object_ptr, uint amount)
{
  byte *object = (byte *)object_ptr;
  uint uVar1;
  byte bVar2;

  uVar1 = (amount & 0xff) + (uint)object[8];
  /* Was an unconditional `(&g_monster_max_stats_table)[(*object & 0x3f) * 0x30]` cap -- that table
     is the per-monster-class max-stat table, indexed by the low 6 bits of a monster object's own
     type id (a valid index for any real monster, 0x40-0x7f). */
  bVar2 = ((void *)object == (void *)g_player_object) ? *(byte *)(DAT_0023be74 + 4) :
          g_monster_type_props[(*object & 0x3f)].max_hp;
  if (bVar2 < uVar1) {
    object[8] = bVar2;
  }
  else {
    object[8] = (byte)uVar1;
  }
  if ((void *)object == (void *)g_player_object) {
    refresh_experience_display();
  }
}




// was FUN_00077f30 -- draws the stats panel's name/title/level header. Called from
// draw_stats_panel_content.
void draw_stats_panel_header()

{
  char cVar1;
  short sVar2;
  /* Was `undefined4` -- truncated _strupr's real 64-bit string pointer return (see that ordinal's
     own comment: it's `_strupr`, genuinely implemented now instead of a stub) to 32 bits on this
     host before handing it to draw_text_string. */
  char *uVar3;
  int iVar4;
  undefined1 auStack_28 [30];
  undefined1 local_a;

  ce_strncpy(auStack_28,DAT_00086df8,0xf);
  local_a = 0;
  _strupr(auStack_28);
  sVar2 = measure_text_width(auStack_28);
  iVar4 = -(int)sVar2 + 0x48;
  if (iVar4 < 0) {
    iVar4 = -(int)sVar2 + 0x49;
  }
  draw_text_string(auStack_28,(short)(iVar4 >> 1) + 0xf2,0xf);
  /* Was `get_message_string(id); uVar3 = _strupr();` -- _strupr (real body: `_strupr`, see its own
     comment) needs an explicit string argument, but was called with none... */
  uVar3 = _strupr(get_message_string((*(byte *)(DAT_00086df8 + 100) >> 5) + 0x17 | 0x400));
  draw_text_string(uVar3,0xf2,0x16);
  itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x3d),auStack_28,10);
  cVar1 = *(byte *)(DAT_00086df8 + 0x3d) - 1;
  if (3 < *(byte *)(DAT_00086df8 + 0x3d)) {
    cVar1 = '\x03';
  }
  /* Originally `cVar1 * 3 + 0x878b0`: index into a small string table at a fixed original-binary
     address Ghidra never recovered contents for (see open_gr_resource_file for the same pattern) --
     skipped rather than guessed, this is cosmetic HUD text formatting. */
  iVar4 = measure_text_width(auStack_28);
  draw_text_string(auStack_28,0x138 - iVar4,0x16);
  return;
}





// was FUN_0007802c -- draws one row of the stats panel's 3-value attribute display: param_1 selects
// the row (0-2), reading byte DAT_0023be74+5+row (see character_generator_loop's own init of these
// 3 bytes via "roll 2d10+10", uw.c ~10097) and right-aligning it at y = row*7+0x1d...
void draw_stats_panel_attribute_row(uint row)
{
  int iVar1;
  undefined1 auStack_c [4];
  
  itoa_radix(*(undefined1 *)((row & 0xff) + DAT_0023be74 + 5),auStack_c,10);
  iVar1 = measure_text_width(auStack_c);
  draw_text_string(auStack_c,0x138 - iVar1,(row & 0xff) * 7 + 0x1d);
}



// was FUN_00078088 -- draws the player's "current/max HP" fraction (g_player_object offset+8, the
// real player HP byte) as "X/Y" text at y=0x32.
void draw_hp_stat_display()

{
  short sVar1;
  int iVar2;
  undefined1 auStack_c [8];
  
  itoa_radix(g_player_object->npc_hp,auStack_c,10);
  sVar1 = ce_strlen(auStack_c);
  auStack_c[sVar1] = 0x2f;
  itoa_radix(*(undefined1 *)(DAT_0023be74 + 4),auStack_c + ((sVar1 + 1) * 0x10000 >> 0x10),10);
  iVar2 = measure_text_width(auStack_c);
  draw_text_string(auStack_c,0x138 - iVar2,0x32);
  return;
}



// was FUN_00078118 -- draws the player's "current/max mana" fraction (DAT_00086df8+0x37/+0x38 --
// offset 0x37 confirmed as "play_mana" against babl.c's own read of the same offset) as "X/Y" text
// at y=0x39. Same caller pair as draw_hp_stat_display above.
void draw_mana_stat_display()

{
  short sVar1;
  int iVar2;
  undefined1 auStack_10 [8];
  
  itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x37),auStack_10,10);
  sVar1 = ce_strlen(auStack_10);
  auStack_10[sVar1] = 0x2f;
  itoa_radix(*(undefined1 *)(DAT_00086df8 + 0x38),auStack_10 + ((sVar1 + 1) * 0x10000 >> 0x10),10)
  ;
  iVar2 = measure_text_width(auStack_10);
  draw_text_string(auStack_10,0x138 - iVar2,0x39);
  return;
}



// was FUN_000781a0 -- draws the player's total experience points (DAT_00086df8+0x4e, a 4-byte
// value) formatted via orduint_divmod/ _ltoa at y=0x40. Same caller pair as draw_hp_stat_display
// above.
void draw_experience_points_display()

{
  undefined4 uVar1;
  int iVar2;
  undefined1 auStack_18 [12];
  
  uVar1 = orduint_divmod(10,*(undefined4 *)(DAT_00086df8 + 0x4e)).quot;
  _ltoa(uVar1,auStack_18,10);
  iVar2 = measure_text_width(auStack_18);
  draw_text_string(auStack_18,0x138 - iVar2,0x40);
  return;
}





// was FUN_0007821c -- draws one row of the stats panel's skill list: param_1 selects the skill
// index, restores the captured backdrop rect behind that row (blit_grtile_to_framebuffer)...
void draw_stats_panel_skill_row(uint skill_index)
{
  /* Was `undefined4` -- same _strupr pointer-truncation class as
     draw_stats_panel_header's player-title draw. */
  char *uVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  undefined1 auStack_18 [4];
  
  uVar3 = skill_index & 0xff;
  itoa_radix(*(undefined1 *)(DAT_0024af80 + uVar3 + DAT_00086df8 + 0x21),auStack_18,10);
  blit_grtile_to_framebuffer(0xf0,((int)(uVar3 * 0x70000) >> 0x10) + 0x47,DAT_0024af88,((skill_index & 0xff) + 1) * 7,
               0x4b,0,(short)(uVar3 * 0x70000 >> 0x10),1);
  /* Was `get_message_string(id); uVar1 = _strupr();` -- same dropped- argument bug as
     draw_stats_panel_header's player-title draw above; thread the looked-up skill-name string
     through explicitly instead of relying on leftover-register reuse. */
  uVar1 = _strupr(get_message_string((uint)DAT_0024af80 + (int)(short)uVar3 + 0x1f | 0x400));
  iVar4 = ((int)(uVar3 * 0x70000) >> 0x10) + 0x48;
  draw_text_string(uVar1,0xf2,iVar4);
  iVar2 = measure_text_width(auStack_18);
  draw_text_string(auStack_18,0x138 - iVar2,iVar4);
}



void draw_stats_panel_content()

{
  byte bVar1;

  if (DAT_0024af88 == 0) {
    DAT_0024af88 = grtile_alloc_registered(0x96,0x2b);
    if (DAT_0024af88 != 0) {
      capture_framebuffer_rect_to_grtile(DAT_0024af88,0xf0,0x47,0x4b,0x2b);
    }
    DAT_0024af8c = grtile_alloc_registered(0x46,0x15);
    if (DAT_0024af8c != 0) {
      capture_framebuffer_rect_to_grtile(DAT_0024af8c,0x115,0x32,0x23,0x15);
    }
  }
  *g_draw_color_index = 0xf1;
  *DAT_00084298 = 0xf1;
  decrement_cursor_hide_depth();
  select_active_font(s_font5x6i_sys_00086e98);
  draw_stats_panel_header();
  bVar1 = 0;
  do {
    draw_stats_panel_attribute_row(bVar1);
    bVar1 = bVar1 + 1;
  } while (bVar1 < 3);
  draw_hp_stat_display();
  draw_mana_stat_display();
  draw_experience_points_display();
  bVar1 = 0;
  *g_draw_color_index = 0x68;
  *DAT_00084298 = 0x68;
  do {
    draw_stats_panel_skill_row(bVar1);
    bVar1 = bVar1 + 1;
  } while (bVar1 < 6);
  select_active_font(s_font5x6p_sys_0008430c);
  cursor_show_idle_tick();
  return;
}





// was FUN_00078434 -- handles a click on the stats panel's skill list, scrolling it up or down by
// one (DAT_0024af80, the skill scroll offset draw_stats_panel_skill_row reads) depending on click
// position relative to DAT_00085a6c.
void handle_stats_panel_skill_scroll_click()

{
  undefined2 uVar1;
  short sVar2;
  uint uVar3;
  ushort local_c [2];
  
  select_active_font(s_font5x6i_sys_00086e98);
  *g_draw_color_index = 0x68;
  *DAT_00084298 = 0x68;
  if (DAT_00085a6c[1] < 8) {
    local_c[0] = (ushort)DAT_0024af80;
    sVar2 = -1;
    if (0x24 < *DAT_00085a6c) {
      sVar2 = 1;
    }
    uVar1 = 0xe;
    if (sVar2 != 1) {
      uVar1 = 0;
    }
    /* Was `step_value_toward_limit(local_c,uVar1,1);` -- dropped its 4th argument (direction,
       -1/+1), the SAME `sVar2` value just computed above from the click position but about to be
       clobbered by this very call's own return value (Ghidra reused the variable slot).... */
    sVar2 = step_value_toward_limit(local_c,uVar1,1,(0x24 < *DAT_00085a6c) ? 1 : -1);
    if (sVar2 != 0) {
      DAT_0024af80 = (byte)local_c[0];
      decrement_cursor_hide_depth();
      uVar3 = 0;
      local_c[0] = 0;
      do {
        draw_stats_panel_skill_row(uVar3 & 0xff);
        uVar3 = (int)(short)local_c[0] + 1;
        local_c[0] = (ushort)uVar3;
      } while ((int)(uVar3 * 0x10000) >> 0x10 < 6);
      cursor_show_idle_tick();
    }
  }
  select_active_font(s_font5x6p_sys_0008430c);
  wait_for_click_release(1);
  return;
}



// was FUN_00078550
void refresh_stats_panel_if_active()

{
  if (g_active_hud_panel == '\x02') {
    redraw_active_hud_panel();
  }
  return;
}


// was FUN_0007ee9c -- confirmed by read_player_status_block (src/player.c) as the low-level "read
// and de-scramble" primitive behind the player.dat status block: reads param_4 bytes from file
// handle param_1 into param_3, 80 (0x50) bytes at a time...
/* was `int` -- same DAT_00086df8-pointer truncation bug as its sibling write_xor_scrambled_block
   (see that function's comment); this one is reached from the save-slot-copy path
   (read_player_status_block <- load_player_save_record) rather than... */
short read_xor_scrambled_block(int file_handle, byte key_seed, char *buffer, short byte_count)
{
  short sVar1;
  int iVar2;
  short sVar3;
  byte local_b4 [80];
  byte local_64 [80];
  
  sVar3 = 0;
  iVar2 = 0;
  do {
    key_seed = key_seed + 3;
    local_64[iVar2] = key_seed;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x50);
  for (; iVar2 = (int)byte_count, 0 < iVar2; byte_count = byte_count + -0x50) {
    if (0x4f < iVar2) {
      iVar2 = 0x50;
    }
    sVar1 = read_file_handle(file_handle,local_b4,iVar2);
    if (0 < sVar1) {
      iVar2 = 0;
      do {
        *(byte *)(iVar2 + buffer) = local_64[iVar2] ^ local_b4[iVar2];
        iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      } while (iVar2 < sVar1);
    }
    sVar3 = sVar1 + sVar3;
    buffer = buffer + 0x50;
  }
  return sVar3;
}



// was FUN_0007ef78 -- write-side mirror of read_xor_scrambled_block, confirmed by
// write_player_status_block (src/player.c): XOR- scrambles param_4 bytes from param_3 against the
// same rolling param_2-derived key, 80 bytes at a time, writing each chunk to file handle param_1.
/* was `int` -- truncated the real DAT_00086df8 pointer write_player_status_block passes in, latent
   until something (write_player_save_record, the player.dat writer) actually called
   write_player_status_block -- previously only reachable from the Load Game path */
int write_xor_scrambled_block(int file_handle, byte key_seed, char *buffer, short byte_count)
{
  int iVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  byte abStack_80b4 [80];
  byte abStack_8064 [32688];
  byte local_b4 [80];
  byte local_64 [80];
  
  iVar5 = 0;
  iVar1 = 0;
  do {
    key_seed = key_seed + 3;
    local_b4[iVar1] = key_seed;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 0x50);
  for (; iVar1 = (int)byte_count, 0 < iVar1; byte_count = byte_count + -0x50) {
    iVar2 = 0;
    while( true ) {
      iVar4 = iVar1;
      if (0x4f < iVar1) {
        iVar4 = 0x50;
      }
      iVar2 = (int)(short)iVar2;
      if (iVar4 <= iVar2) break;
      local_64[iVar2] = local_b4[iVar2] ^ *(byte *)(iVar2 + buffer);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    }
    if (0x4f < iVar1) {
      iVar1 = 0x50;
    }
    uVar3 = write_file_handle(file_handle,local_64,iVar1);
    iVar5 = iVar5 + (uVar3 & 0xffff);
    buffer = buffer + 0x50;
  }
  return iVar5;
}





// was FUN_000352d0 -- scan_area_ahead_of_object callback: flags DAT_00101954 if the scanned object
// (param_3) isn't the player, its class-record quality nibble (byte 0xb) is 4, 5, or 9 (a hostile
// creature category), and its own alerted/aware flag (byte 0x19, bit 0) is set.
/* ARM 0x352d4 preserves the scanned object from r2 in r4 before reading +0xb/+0x19. Keep that
   record address intact on a 64-bit host. */
int detect_unsafe_rest_object_callback(int scan_x, int scan_y, char *object)
{
  byte bVar1;
  short sVar2;

  sVar2 = encode_object_slot_index(object);
  if (((sVar2 != 1) &&
      (((bVar1 = *(byte *)(object + 0xb) & 0xf, bVar1 == 5 || (bVar1 == 4)) || (bVar1 == 9)))) &&
     ((*(byte *)(object + 0x19) & 1) != 0)) {
    DAT_00101954 = 1;
  }
  return 0;
}



// was FUN_00035340 -- scans a radius (0x7f) around the player for an alerted hostile creature
// (detect_unsafe_rest_object_callback) and returns whether one was found. handle_rest_action's
// non-negative path reads this to decide whether resting is safe here.
int check_rest_area_unsafe()

{
  DAT_00101954 = 0;
  scan_area_ahead_of_object(g_player_object,0x7f,detect_unsafe_rest_object_callback,0,0,2);
  return DAT_00101954;
}


// was FUN_0003bee4 -- confirmed by close_panels_before_level_change's own cross-reference as a
// "resurrect/reset-position" path: closes UI panels, refreshes equipment effects, clears the
// player's posture/heading bits...
void reset_player_for_resurrection()

{
  uint uVar1;

  close_panels_before_level_change();
  refresh_player_equipment_effects();
  g_player_object->hdr.heading = 0x0;
  uVar1 = g_player_object->hdr.position_word;
  g_player_object->npc_heading = 0;
  DAT_00201c70 = 0;
  DAT_00201c78 = 0;
  DAT_00086b20 = 1;
  reset_hud_panel_animation_state();
  DAT_00201c94 = 0;
  unready_weapon();
  DAT_000868d8 = 2;
  if (((g_cursor_mode == 1) || (g_cursor_mode == 3)) || (g_cursor_mode == 4)) {
    pop_cursor_icon(3);
  }
  g_cursor_mode = 0;
  DAT_0024cfc8 = 0;
  DAT_002028d8 = 0;
  if (g_cursor_holding_state != 0) {
    if (g_cursor_holding_state < 4) {
      pop_cursor_icon(3);
      g_selected_object = 0;
      g_cursor_holding_state = 0;
    }
    else {
      g_cursor_holding_state = 0;
      set_view_subject_by_command(1);
    }
  }
  return;
}


// was FUN_0003c038 -- exits the current game mode and transitions through the main menu before
// resuming: for param_1==1 (the player death case), shows the "You died" message, the death
// illustration page (0x103), and a 2-second pause before continuing.
void handle_player_death_and_menu_transition(short reason)
{
  short sVar1;
  code *pcVar2;
  bool bVar3;
  undefined1 auStack_31c [768];

  DAT_0023bf0c = 0;
  reset_cursor_confine_rect();
  if (reason == 1) {
    set_hud_status_value(2,0);
    snap_compass_to_heading();
    hud_vitals_threshold_shake(0);
    message_scroll_print_wrapped(s_You_died_000857b8);
    display_book_or_scroll_page(0x103);
    Sleep(2000);
  }
  do {
    sVar1 = next_input_event();
  } while (sVar1 < 0);
  msg_scroll_panel_reset(1);
  /* 0x80, see DAT_00085668's comment. */
  pcVar2 = (code *)0;
  /* Same 64-bit pointer-sentinel fix as change_game_mode's own identical
     guard -- see its comment. */
  bVar3 = DAT_00201b64 != -1;
  if (bVar3) {
    pcVar2 = *(code **)(&DAT_000856a4 + (int)DAT_00201b64 * 0x80);
  }
  if (bVar3 && pcVar2 != (code *)0x0) {
    (*pcVar2)();
  }
  *(undefined1 *)(DAT_00085a6c + 8) = 0;
  *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
  sVar1 = DAT_00201b64;
  DAT_00201b60 = 0;
  DAT_00201b64 = 0xffff;
  DAT_00201c98 = 0;
  if (reason == 1) {
    decrement_cursor_hide_depth();
  }
  reset_player_for_resurrection();
  ce_memmove(auStack_31c,&DAT_00088d98,0x300);
  fade_active_palette_to_black(auStack_31c,2);
  main_menu_loop(0);
  DAT_00201c98 = 1;
  DAT_00201b60 = (undefined2)(1 << ((int)sVar1 & 0xffU));
  DAT_00201b64 = sVar1;
  /* 0x80, see DAT_00085668's comment. */
  (**(code **)(&DAT_00085668 + sVar1 * 0x80))();
}


// was FUN_0003c6ac -- confirmed by its only call site as a level-9 (the final/Abyss level)
// exclusive random environmental hazard: only ever rolled 1-in-32 per tick while on that level.
void apply_level9_random_hazard_tick()

{
  if (g_debug_godmode) return;   /* the one hit-point write that bypasses apply_damage_to_object */
  int uw_ord2005_rem_106 = 0; int uw_ord2005_rem_107 = 0; int uw_ord2005_rem_108 = 0; int uw_ord2005_rem_109 = 0; int uw_ord2005_rem_110 = 0;
  uint uVar1;
  ushort uVar2;
  undefined4 uVar3;
  uint uVar4;
  char extraout_r1;
  char cVar5;
  char extraout_r1_00;
  char extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  byte bVar6;

  weapon_overlay_flash_once(0xb5);
  bVar6 = g_player_object->npc_hp;
  uVar1 = (uint)(short)(ushort)bVar6;
  if (uVar1 < 0x65) {
    if (uVar1 < 0x33) {
      if ((uVar1 < 0x15) || (uVar4 = ce_rand(), (uVar4 & 3) != 0)) {
        if ((1 < uVar1) && (uVar4 = ce_rand(), (uVar4 & 7) == 0)) {
          bVar6 = (byte)((uVar1 - 1) * 0x10000 >> 0x10);
        }
        goto LAB_0003c780;
      }
      uVar3 = ce_rand();
      uw_ord2005_rem_106 = ((int)(uVar3)) % (3);
      cVar5 = uw_ord2005_rem_106;
    }
    else {
      uVar3 = ce_rand();
      uw_ord2005_rem_107 = ((int)(uVar3)) % (4);
      cVar5 = uw_ord2005_rem_107;
    }
  }
  else {
    uVar3 = ce_rand();
    uw_ord2005_rem_108 = ((int)(uVar3)) % (6);
    cVar5 = uw_ord2005_rem_108;
  }
  bVar6 = bVar6 - cVar5;
LAB_0003c780:
  g_player_object->npc_hp = bVar6;
  uVar3 = ce_rand();
  uw_ord2005_rem_109 = ((int)(uVar3)) % (0xc);
  if (uw_ord2005_rem_109 != 0) {
    uVar3 = ce_rand();
    uw_ord2005_rem_110 = ((int)(uVar3)) % (0x1e);
    set_movement_animation_timer(0x40,(uw_ord2005_rem_110 & 0xff) + 0xf);
  }
  uVar2 = ce_rand();
  set_hud_status_value(2,uVar2 & 0xf);
  return;
}



// was FUN_0003dbd8 -- called once per player-update tick (src/player.c:759, right after the
// per-frame ambient-light/flicker update).
void force_locomotion_state_refresh()

{
  set_locomotion_state(DAT_002048a8,1);
  DAT_000858a0 = 1;
  return;
}



// was FUN_0003dc04 -- one of apply_quest_vertical_effect's two sub-effects (bit 2).
void apply_vertical_launch_impulse(short strength)
{
  int iVar1;

  if (g_fall_accel != -4) {
    g_fall_accel = -2;
  }
  iVar1 = strength * 0x2f;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 3;
  }
  g_vertical_velocity = (short)(iVar1 >> 2);
  iVar1 = (int)DAT_00204886;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 1;
  }
  DAT_00204886 = (short)(iVar1 >> 1);
  iVar1 = (int)DAT_00204888;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 1;
  }
  DAT_00204888 = (short)(iVar1 >> 1);
}



// was FUN_0003dc6c -- apply_quest_vertical_effect's other sub-effect (bit 1). Always the same
// fixed-duration animation-timer trigger (set_movement_animation_timer(0x40,0x1e)); reads as a
// scripted "stumble" animation cue.
void trigger_quest_stumble_animation(int unused)
{
  set_movement_animation_timer(0x40,0x1e);
}



// was FUN_0003dc78 -- dispatch_quest_event_code's handler for quest codes 0x3c-0x3e
// (src/traps.c:562, gated on the trap/link record's trigger context being the player), called as
// apply_quest_vertical_effect(code-0x3b, linkval&0x3f) so param_1 in {1,2,3}.
void apply_quest_vertical_effect(ushort effect_bits, int unused)
{
  if ((effect_bits & 1) != 0) {
    trigger_quest_stumble_animation(unused);
  }
  if ((effect_bits & 2) != 0) {
    apply_vertical_launch_impulse(unused);
  }
}


// was FUN_00053ab0 -- manages the player's active-light-source list (a small array at
// DAT_00086df8+0x3e, count tracked in bits 6-9 of the status word at +0x5f/+0x60): confirmed by
// handle_light_source_click's own comment as "cycle the active light source" on a UI click...
int cycle_active_light_source(short *index)
{
  short sVar1;
  ushort uVar2;
  undefined1 *puVar3;
  short sVar4;
  uint uVar5;
  int iVar6;
  
  uVar5 = (uint)*(ushort *)(DAT_00086df8 + *index * 2 + 0x3e);
  if (((uVar5 & 0xf) == 1) && (((uVar5 & 0xf0) == 0x30 || ((uVar5 & 0xf0) == 0x50)))) {
    iVar6 = (uVar5 & 0xff00) + 0x21;
    puVar3 = (undefined1 *)(DAT_00086df8 + (*index + 0x1f) * 2);
    *puVar3 = (char)iVar6;
    puVar3[1] = (char)((uint)iVar6 >> 8);
    sVar4 = *(byte *)(DAT_00086df8 + *index * 2 + 0x3e) + 0x100;
    puVar3 = (undefined1 *)(DAT_00086df8 + (*index + 0x1f) * 2);
  }
  else {
    if (((uVar5 & 0xf) == 0xb) && ((uVar5 & 0xf0) == 0x10)) {
      set_view_subject_by_command(1);
    }
    if ((*(byte *)(DAT_00086df8 + *index * 2 + 0x3e) & 0xf) == 1) {
      DAT_000858a0 = 1;
    }
    uVar5 = (uint)*(ushort *)(DAT_00086df8 + 0x5f);
    uVar5 = ((uVar5 & 0xffc0) - 1 ^ uVar5) & 0x3c0 ^ uVar5;
    *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
    *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
    sVar4 = *index;
    uVar2 = *(ushort *)(DAT_00086df8 + 0x5f);
    sVar1 = (short)((uint)((sVar4 + -1) * 0x10000) >> 0x10);
    *index = sVar1;
    if ((int)(uVar2 >> 6 & 0xf) <= (int)sVar4) {
      return 1;
    }
    puVar3 = (undefined1 *)(DAT_00086df8 + (sVar1 + 0x20) * 2);
    sVar4 = *(short *)(DAT_00086df8 + (*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf) * 2 + 0x3e);
  }
  *puVar3 = (char)sVar4;
  puVar3[1] = (char)((ushort)sVar4 >> 8);
  return 1;
}



// was FUN_00053c74 -- periodic player-tick updater, called from player.c roughly every 20
// realtime-clock ticks: cycles/decays every active light source (cycle_active_light_source) and
// refreshes equipment effects on a change...
void update_player_tick_effects()

{
  int uw_ord2005_rem_116 = 0; int uw_ord2005_rem_117 = 0;
  byte bVar1;
  char cVar2;
  ushort uVar3;
  ushort uVar4;
  short sVar5;
  uint uVar6;
  int extraout_r1;
  int extraout_r1_00;
  int iVar7;
  undefined1 *puVar8;
  int iVar9;
  int iVar10;
  char *player_rec;
  char *stat_ptr;
  short local_20 [2];
  
  iVar7 = 0;
  iVar10 = 0;
  local_20[0] = 0;
  uVar6 = DAT_002046d0 + 1;
  DAT_002046d0 = (byte)uVar6;
  if ((*(ushort *)(DAT_00086df8 + 0x5f) & 0x3c0) != 0) {
    do {
      uVar3 = *(ushort *)(DAT_00086df8 + (short)iVar7 * 2 + 0x3e);
      uVar4 = uVar3 >> 8;
      if (uVar4 == 1) {
        iVar10 = cycle_active_light_source(local_20);
      }
      else {
        iVar9 = (uVar3 & 0xff) + (uVar4 + 0xff) * 0x100;
        puVar8 = (undefined1 *)(DAT_00086df8 + ((short)iVar7 + 0x1f) * 2);
        *puVar8 = (char)iVar9;
        puVar8[1] = (char)((uint)iVar9 >> 8);
      }
      iVar7 = local_20[0] + 1;
      local_20[0] = (short)iVar7;
    } while (iVar7 * 0x10000 >> 0x10 < (int)(*(ushort *)(DAT_00086df8 + 0x5f) >> 6 & 0xf));
    uVar6 = (uint)DAT_002046d0;
  }
  iVar7 = decay_equipped_light_sources(1,uVar6);
  puVar8 = (undefined1 *)(DAT_00086df8 + 0x62);
  if (iVar7 != 0) {
    iVar10 = 1;
  }
  bVar1 = *(byte *)(DAT_00086df8 + 0x61);
  if ((bVar1 & 0xc) != 0) {
    *(byte *)(DAT_00086df8 + 0x61) = ((bVar1 & 0xfc) - 1 ^ bVar1) & 0xc ^ bVar1;
    *(undefined1 *)(DAT_00086df8 + 0x62) = *puVar8;
    if ((*(byte *)(DAT_00086df8 + 0x61) & 0xc) == 0) {
      iVar10 = 1;
    }
  }
  if (iVar10 != 0) {
    refresh_player_equipment_effects();
    set_pending_update_flags(2);
  }
  if (DAT_002046cc != 0) {
    if ((DAT_002046cc & 1) != 0) {
      adjust_player_hp(g_player_object,-1);
    }
    if ((DAT_002046cc & 2) != 0) {
      adjust_level7_hazard_value(g_player_object,-1);
    }
  }
  if (0x50 < *(byte *)(DAT_00086df8 + 0xb9)) {
    apply_drowning_hazard();
  }
  player_rec = DAT_00086df8;
  uw_ord2005_rem_116 = ((int)(DAT_002046d0)) % (3);
  if (uw_ord2005_rem_116 == 0) {
    uVar3 = *(ushort *)(player_rec + 0x5f);
    if ((uVar3 & 0x3c) != 0) {
      bVar1 = (byte)uVar3;
      *(byte *)(player_rec + 0x5f) = ((bVar1 & 0xfc) - 1 ^ bVar1) & 0x3c ^ bVar1;
      *(char *)(DAT_00086df8 + 0x60) = (char)(uVar3 >> 8);
      apply_typed_damage_to_object(g_player_object,0,0,0,(char)((uVar3 & 0x3c) >> 2),0x10);
      player_rec = DAT_00086df8;
    }
    sVar5 = roll_skill_check(*(undefined1 *)(player_rec + 0x28),10);
    if (0 < sVar5) {
      adjust_level7_hazard_value(g_player_object,sVar5 * -0x1000000 >> 0x18);
    }
  }
  uw_ord2005_rem_117 = ((int)(DAT_002046d0)) % (0x18);
  if (uw_ord2005_rem_117 == 0) {
    sVar5 = ce_rand();
    adjust_player_hunger(-3 - ((int)sVar5 & 3U));
    uVar6 = (uint)*(ushort *)(DAT_00086df8 + 0x61);
    if ((*(ushort *)(DAT_00086df8 + 0x61) & 0x3f0) != 0) {
      uVar6 = ((uVar6 & 0xfff0) - 1 ^ uVar6) & 0x3f0 ^ uVar6;
      *(char *)(DAT_00086df8 + 0x61) = (char)uVar6;
      *(char *)(DAT_00086df8 + 0x62) = (char)(uVar6 >> 8);
    }
    uVar6 = ce_rand();
    if ((uVar6 & 3) == 0) {
      process_nearby_background_traps(1);
    }
    randomize_active_npc_flags();
    iVar10 = 0;
    local_20[0] = 0;
    do {
      stat_ptr = DAT_00086df8 + (short)iVar10;
      cVar2 = *(char *)(stat_ptr + 0x3a);
      if (cVar2 != -1) {
        *(char *)(stat_ptr + 0x3a) = cVar2 + '\x01';
        iVar10 = (int)local_20[0];
      }
      iVar10 = iVar10 + 1;
      local_20[0] = (short)iVar10;
    } while ((int)(iVar10) * 0x10000 >> 0x10 < 3);
    sVar5 = roll_skill_check(*(undefined1 *)(DAT_0023be74 + 5),0xf);
    if (0 < sVar5) {
      adjust_player_hp(g_player_object,-1);
    }
    DAT_002046d0 = 0;
  }
  return;
}


// was FUN_0005404c -- burns fuel on the player's equipped light sources (g_light_source_slots, 4
// slots): for each equipped item whose type falls in the light-source category and has a valid
// radius (g_light_radius_table)...
int decay_equipped_light_sources(short elapsed, byte tick_phase)
{
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  byte bVar4;
  short sVar5;
  uw_object_hdr_t *puVar6;
  int extraout_r1;
  uint uVar7;
  ushort uVar8;
  int iVar9;
  undefined4 uVar10;
  
  uVar10 = 0;
  iVar9 = 0;
  do {
    puVar6 = get_equipped_item_at_slot((int)(char)(&g_light_source_slots)[iVar9]);
    if (puVar6 != (uw_object_hdr_t *)0x0) {
      uVar2 = puVar6->type_flags;
      if (((((uVar2 & 0x1f0) == 0x90) && (uVar7 = (uint)(short)(uVar2 & 0xf), 3 < uVar7)) &&
          (uVar7 < 8)) && (cVar1 = g_light_type_props[uVar7].decay_interval, cVar1 != '\0')) {
        /* ARM 0x540d4 uses the tick phase (tick_phase) for the remainder.
           Before the second division, 0x540ec reloads elapsed ticks
           (elapsed) into r1. Sleep needs that distinct bulk dividend. */
        divmod_result dmr4414 = ordint_divmod(cVar1,tick_phase);
        extraout_r1 = dmr4414.rem;
        uVar8 = (ushort)(extraout_r1 == 0);
        if (1 < elapsed) {
          sVar5 = ordint_divmod(cVar1,elapsed).quot;
          uVar8 = (ushort)(extraout_r1 == 0) + sVar5;
        }
        if ((short)uVar8 != 0) {
          uVar3 = puVar6->chain_word;
          if ((int)(short)uVar8 < (int)(uVar3 & 0x3f)) {
            bVar4 = (byte)uVar3;
            puVar6->quality = (bVar4 - (char)uVar8) & 0x3f;
          }
          else {
            uVar7 = uVar3 & 0xffc0;
            puVar6->quality = 0;
            bVar4 = (byte)uVar2;
            puVar6->type_flags = (ushort)(uVar2 - 4);
            redraw_backpack_slot_widget((int)(char)(&g_light_source_slots)[iVar9]);
            uVar10 = 1;
            set_ambient_bias_without_light(0);
          }
        }
      }
    }
    iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
  } while (iVar9 < 4);
  return uVar10;
}



// was FUN_000541d0 -- drowning hazard tick, called once liquid- submersion depth
// (DAT_00086df8+0xb9) exceeds a threshold: rolls a skill check (+0x34, swimming-like stat) against
// a light-encumbrance- derived difficulty...
void apply_drowning_hazard()

{
  undefined1 uVar1;
  char cVar2;
  int iVar3;
  
  uVar1 = 0;
  if (*(short *)(DAT_00086df8 + 0x4c) != 0) {
    uVar1 = ordint_divmod(*(short *)(DAT_00086df8 + 0x4c),(uint)*(ushort *)(DAT_00086df8 + 0x4a) << 5
                        ).quot;
  }
  iVar3 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x34),uVar1);
  if (((short)iVar3 < 1) && (*(byte *)(DAT_00086df8 + 0xb9) < 0x8c)) {
    cVar2 = roll_dice_sum(3 - (int)(iVar3),4);
    *(char *)(DAT_00086df8 + 0xb9) = *(char *)(DAT_00086df8 + 0xb9) + cVar2;
  }
  if (0x78 < *(byte *)(DAT_00086df8 + 0xb9)) {
    iVar3 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x34),uVar1);
    if ((-(int)iVar3 + 2) * 0x10000 >> 0x10 != 0) {
      weapon_overlay_flash_once(0xc6);
      set_pending_update_flags(2);
      uVar1 = roll_dice_sum(2,-(int)iVar3 + 4);
      apply_typed_damage_to_object(g_player_object,0,0,0,uVar1,0);
    }
  }
  return;
}


// was FUN_0003c194 -- mode-0 dirty-bit-3 handler: advance the in-progress step/turn view animation
// one tick (interpolate the player tile position via find_placement_via_tile_flood_fill) and redraw
// the dungeon view around it. Does nothing unless an animation is queued (0 < DAT_00201c90).
int dungeon_view_anim_tick()

{
  int iVar1;
  short local_20;
  short local_1e;
  
  if (0 < DAT_00201c90) {
    if ((DAT_00085730 & 1) != 0) {
      full_dungeon_redraw();
      weapon_overlay_flash_hold((int)g_visibility_max_ring_passes);
    }
    if (DAT_00201b68 != DAT_00201c7c) {
      iVar1 = transition_to_level(DAT_00201b68, DAT_00201c7c);
      if (iVar1 == 0) {
        report_fatal_error_and_exit(0x300c);
      }
      DAT_00201b68 = DAT_00201c7c;
    }
    if (DAT_00201c9c != (code *)0x0) {
      (*DAT_00201c9c)();
    }
    iVar1 = find_placement_via_tile_flood_fill(g_player_object,(int)DAT_00201c90,(int)DAT_00201c8c,&local_20,&local_1e,0);
    if ((iVar1 == 0) &&
       (iVar1 = find_placement_via_tile_flood_fill(g_player_object,(int)DAT_00201c90,(int)DAT_00201c8c,&local_20,&local_1e,1)
       , iVar1 == 0)) {
      DAT_00201c90 = 0;
      g_player_object->npc_hp = 0;
      return 0;
    }
    DAT_00201c90 = local_20;
    DAT_00201c8c = local_1e;
    set_player_tile_position((int)local_20,(int)local_1e,1);
    if ((DAT_00085730 & 2) != 0) {
      full_dungeon_redraw();
      weapon_overlay_flash_restore((int)g_visibility_max_ring_passes);
    }
    DAT_00201c90 = 0;
    if ((DAT_00085730 & 2) != 0) {
      set_pending_update_flags(0x7ffe);
    }
  }
  return 1;
}


/* Debug console: PLAYERLEVEL. Sets the level byte and the XP that level starts at, then refreshes
   max hp/mana (full refill) and the HUD. Returns the clamped level. */
int debug_set_player_level(int level)
{
  if (level < 1) level = 1;
  if (level > 16) level = 16;
  *(byte *)(DAT_00086df8 + 0x3d) = (byte)level;
  uint xp = (uint)DAT_00086e87_backing[level - 1] * 500;
  DAT_00086df8[0x4e] = (char)xp;
  DAT_00086df8[0x4f] = (char)(xp >> 8);
  DAT_00086df8[0x50] = (char)(xp >> 16);
  DAT_00086df8[0x51] = (char)(xp >> 24);
  recalculate_player_stats(1);
  g_player_object->npc_hp = *(byte *)(DAT_0023be74 + 4);
  refresh_experience_display();
  return level;
}

/* Debug console: SETSKILL. Skills are the 20 bytes at DAT_00086df8 + 0x21 (max 30). */
const char *const g_debug_skill_names[DEBUG_SKILL_COUNT] = {
  "attack", "defense", "unarmed", "sword", "axe", "mace", "missile", "mana", "lore", "casting",
  "traps", "search", "track", "sneak", "repair", "charm", "picklock", "acrobat", "appraise", "swimming",
};

int debug_set_skill(int index, int value)
{
  if (index < 0 || index >= DEBUG_SKILL_COUNT) return -1;
  if (value < 0) value = 0;
  if (value > 30) value = 30;
  *(byte *)(DAT_00086df8 + 0x21 + index) = (byte)value;
  return value;
}

void debug_skills_changed(void)
{
  recalculate_player_stats(0);   /* max mana depends on the mana skill */
  refresh_experience_display();
}

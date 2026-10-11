/* Weapon swing animation: frame loading/allocation, the request/draw tick, and the weapon overlay
   redraw. Split out of uw.c (the original monolithic decompile) once these functions' real roles
   were confirmed. */
#include "headers/weapon_swing.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* Ghidra rendered the embedded space as an underscore and dropped the
   trailing space. Real bytes at 0x84f2c (ARM UU.exe .data):
   "Sorry, you have no ". */
static char s_Sorry__you_have_no_00084f2c[] = "Sorry, you have no ";
static undefined4 DAT_001005ec;
static short DAT_00100618;
// Original ARM .data defaults: idle frame counter and pending action.
short DAT_000870e4 = -1;
static short DAT_001005e8;
/* Was a 1-byte `undefined`: ARM 0x278ac/0x278e8 store the whole 32-bit clock reading here (`str`)
   and 0x278c4 reloads its low 16 bits (`ldrsh`) to get the elapsed time. With only the low byte
   kept, the delta was clock - (0..255) -- garbage -- so the charge advanced in random jumps (often
   straight to full) instead of one step per 16 clock units. */
static uint DAT_001005f0;
static byte DAT_00100614;
/* Was a lone `undefined` scalar, same bug as DAT_00084eff just above -- tick_weapon_swing_state
   indexes it as `(&DAT_00084f0b)[iVar5]` with iVar5 = attack-type/3 (0-3), selecting which of a
   small set of swing animations (`DAT_00084f10`) to play. */
static unsigned char DAT_00084f0b_backing[5] = {0x00,0x34,0x27,0x19,0x00};
#define DAT_00084f0b DAT_00084f0b_backing[0]
// After a sprite-category load, restore idle (6), not swing action 0.
undefined1 DAT_000870e0 = 6;
static void *g_weapon_swing_raw_frames[UW_WEAPON_SWING_FRAME_COUNT];
static char s__DATA_weapons_dat_00087268[] = "\\DATA\\weapons.dat";
static char s_weapons_0008727c[] = "weapons";
// was DAT_0023c198/DAT_0023c1b8 (.data 0x87198/0x871b8) -- per-frame Y/X screen-offset tables (one
// signed byte per frame, 28 frames) for the weapon-swing sprite set...
static undefined1 g_weapon_swing_frame_y_offset_backing[256];
#define g_weapon_swing_frame_y_offset g_weapon_swing_frame_y_offset_backing[0]
static undefined1 g_weapon_swing_frame_x_offset_backing[256];
#define g_weapon_swing_frame_x_offset g_weapon_swing_frame_x_offset_backing[0]
static short DAT_0023c1ec;
// ARM 0x870e8 initializes the ready-pose frame offset to 1.
static undefined2 DAT_000870e8 = 1;
static int DAT_0023c260;
static char s__DATA_weapons_cm_00087284[] = "\\DATA\\weapons.cm";
/* Sizing-audit pass: `read_file_handle(iVar4,&DAT_00202700,0x10)`
   -- exact 16-byte real need. Down from 256. */
static undefined1 DAT_00202700_backing[16];
#define DAT_00202700 DAT_00202700_backing[0]



// was LAB_0006e324 -- load_weapon_swing_sprites's (weapons.GR loader) registrar callback (param_5),
// called once per loaded weapon-swing sprite frame with its raw (still-compressed) entry buffer,
// byte size, and 0-27 frame index.
int weapon_swing_frame_loaded(void *buf, unsigned size, int idx)

{
  (void)size;
  if ((unsigned)idx < UW_WEAPON_SWING_FRAME_COUNT) {
    g_weapon_swing_raw_frames[idx] = buf;
  }
  return 1;
}

// was LAB_0006e2f4 -- load_weapon_swing_sprites's (weapons.GR loader, called when the player's
// weapon-hand contents change -- including empty-handed, which resolves to category 3/"fist")
// allocator callback (param_4).
void *weapon_swing_frame_alloc(unsigned int byte_count)
{
  return ce_malloc(byte_count);
}




// was FUN_0006e360 -- sets the weapon-swing animation "category" to load (0-3, from the weapon-hand
// item's melee-weapon-stats byte 6, or 3 for empty-handed/fist)...
void request_weapon_swing_graphic(char category)
{
  DAT_000870d8 = category;
  if (((-1 < category) && (category < '\x04')) || (DAT_000870dc != category)) {
    DAT_0023c1dc = DAT_0023c1dc | 0x100;
  }
}



// was FUN_0006e3ac -- loads WEAPONS.GR's 28-frame swing-animation sprite set for the requested
// weapon-swing category (DAT_000870d8, set by request_weapon_swing_graphic) plus its matching
// 28-byte timing/hit-data rows from WEAPONS.DAT...
byte load_weapon_swing_sprites()
{
  char stack0xffdc3240_buf [256];
  char *stack0xffdc3240_ptr;
  char cVar1;
  byte bVar2;
  byte bVar3;
  int iSeekResult;
  byte bVar4;
  char *pcVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  char acStack_118 [260];
  
  if (DAT_000870dc == DAT_000870d8) {
    bVar2 = 1;
  }
  else {
    DAT_000870dc = DAT_000870d8;
    if ((DAT_000870d8 < '\x04') && (-1 < DAT_000870d8)) {
      g_weapon_swing_current_frame = 0;
      bVar2 = load_gr_resource_entries(s_weapons_0008727c,
                           ((int)DAT_000870d8 + (*(byte *)(DAT_00086df8 + 100) & 1) * -4 + 4) * 0x1c
                           ,0x1c,&weapon_swing_frame_alloc,&weapon_swing_frame_loaded);
      iVar8 = (int)DAT_000870d8;
      bVar3 = *(byte *)(DAT_00086df8 + 100);
      pcVar5 = &DAT_0023cca8;
    stack0xffdc3240_ptr = acStack_118;
      do {
        cVar1 = *pcVar5;
        *stack0xffdc3240_ptr = cVar1; stack0xffdc3240_ptr = stack0xffdc3240_ptr + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_118,s__DATA_weapons_dat_00087268);
      iVar6 = open_file_for_read(acStack_118);
      bVar2 = bVar2 & (iVar6 != -1);
      if (iVar6 != -1) {
        /* Was `bVar3 = seek_file_handle(...)` truncated straight to a byte and then bitwise-&'d
           into bVar2's overall success flag below -- seek_file_handle (SetFilePointer-shaped, see
           uw_file_seek) returns the real new file offset on success... */
        iSeekResult = seek_file_handle(iVar6,(int)((iVar8 + (bVar3 & 1) * -4 + 4) * 0x380000) >> 0x10,0);
        bVar3 = iSeekResult != -1;
        iVar8 = read_file_handle(iVar6,&g_weapon_swing_frame_x_offset,0x1c);
        iVar7 = read_file_handle(iVar6,&g_weapon_swing_frame_y_offset,0x1c);
        bVar4 = CloseHandle(iVar6);
        bVar2 = (iVar7 == 0x1c) & bVar4 & bVar2 & bVar3 & (iVar8 == 0x1c);
      }
    }
    else {
      bVar2 = 0;
    }
  }
  return bVar2;
}




// was FUN_0006fcb0 -- draws the weapon-swing sprite over the 3D viewport for the current frame of
// advance_action_animation_frame's state machine, gated on
// g_dungeon_view_active/g_weapon_overlay_enabled.
void weapon_swing_draw_tick()
{
  short sVar1;
  /* Was `undefined4` -- decode_gr_entry_bitmap returns a real 64-bit bitmap pointer, truncated on
     this 64-bit host before being passed on to bitmap_blit_to_framebuffer. */
  char *uVar2;

  g_blit_transparent_mode = 1;
  if ((((DAT_0023c130 != 6) && (DAT_000870e4 < 0x1c)) && (-1 < DAT_000870dc)) &&
     (g_weapon_overlay_enabled != 0)) {
    if (g_jump_ascent_timer == 0) {
      sVar1 = 0;
    }
    else {
      sVar1 = ordint_divmod(799,(int)g_jump_ascent_timer << 1).quot;
      sVar1 = sVar1 + 1;
    }
    randomize_weapon_jump_shake((int)sVar1);
    if ((DAT_0023c130 == 3) || (DAT_0023c130 == 5)) {
      sVar1 = DAT_000870e4 + 0x12;
    }
    else if ((DAT_000870e4 < 0) || (DAT_0023c130 == 4)) {
      sVar1 = 0x1c - DAT_000870e8;
    }
    else {
      DAT_0023c1ec = 0;
      sVar1 = (ushort)DAT_0023c130 * 9 + DAT_000870e4;
    }
    /* Was `DAT_0023c214 + (short)(&DAT_0023c158)[sVar1]` -- see
       g_weapon_swing_current_frame's own comment. */
    g_weapon_swing_current_frame = ((unsigned)(ushort)sVar1 < UW_WEAPON_SWING_FRAME_COUNT) ?
                   g_weapon_swing_raw_frames[sVar1] : 0;
    /* Was `FUN_000409f8()` -- dropped argument (same "ARM register- leftover doesn't survive a
       literal recompile" idiom as every other dropped-argument bug in this file).
       decode_gr_entry_bitmap needs the raw entry buffer just resolved above; without it... */
    uVar2 = (g_weapon_swing_current_frame == 0) ? 0 : decode_gr_entry_bitmap(g_weapon_swing_current_frame);
    if (uVar2 != 0) {
      bitmap_blit_to_framebuffer((uint)(byte)(&g_weapon_swing_frame_x_offset)[sVar1] + (int)DAT_0023c1ec + 0x34,
                   0x83 - (uint)(byte)(&g_weapon_swing_frame_y_offset)[sVar1],uVar2,*(undefined1 *)(g_weapon_swing_current_frame + 2),
                   *(undefined1 *)(g_weapon_swing_current_frame + 1),0,0,1);
    }
  }
  draw_hud_icon_sprite(0x107f,0x3e,3);
  draw_hud_icon_sprite(0x1080,0,0xd);
  draw_hud_icon_sprite(0x1081,0xab,0xd);
  g_blit_transparent_mode = 0;
}



// was FUN_0006fea4 -- full-screen "hard refresh" utility: draws the weapon-swing overlay (if the
// dungeon view is active) then marks the entire screen dirty.
void weapon_overlay_and_full_redraw()
{
  if (g_dungeon_view_active != 0) {
    weapon_swing_draw_tick();
  }
  dirty_rect_union(0,200,0,0x140);
}







// was FUN_0006e554 -- sets DAT_0023c1ec (the weapon-swing sprite's horizontal jitter offset,
// applied in src/weapon_swing.c's blit) from param_1's shake intensity: 0 clears it, 1 picks a
// small random value (-4..4, via ce_rand mod 5), 2 a larger one (-9..9, mod 10).
void randomize_weapon_jump_shake(short intensity)
{
  int uw_ord2005_rem_134 = 0; int uw_ord2005_rem_135 = 0; int uw_ord2005_rem_136 = 0; int uw_ord2005_rem_137 = 0;
  undefined4 uVar1;
  int iVar2;
  undefined2 extraout_r1;
  undefined2 extraout_r1_00;
  undefined2 extraout_r1_01;
  undefined2 extraout_r1_02;
  
  if (intensity == 0) {
    DAT_0023c1ec = 0;
  }
  else if (intensity == 1) {
    if (DAT_0023c1ec < 1) {
      iVar2 = ce_rand();
      uw_ord2005_rem_134 = ((int)(-iVar2)) % (5);
      DAT_0023c1ec = uw_ord2005_rem_134;
    }
    else {
      uVar1 = ce_rand();
      uw_ord2005_rem_135 = ((int)(uVar1)) % (5);
      DAT_0023c1ec = uw_ord2005_rem_135;
    }
  }
  else {
    if (intensity != 2) {
      return;
    }
    if (DAT_0023c1ec < 1) {
      iVar2 = ce_rand();
      uw_ord2005_rem_136 = ((int)(-iVar2)) % (10);
      DAT_0023c1ec = uw_ord2005_rem_136;
    }
    else {
      uVar1 = ce_rand();
      uw_ord2005_rem_137 = ((int)(uVar1)) % (10);
      DAT_0023c1ec = uw_ord2005_rem_137;
    }
    ce_rand();
  }
  DAT_000870e8 = 1;
}






// was FUN_0006e648 -- shared player-action animation state machine (weapon raise/ready, among
// others): reads the requested action type (DAT_0023c120, set via set_hud_status_value(8,N)),
// drives the current-action state (DAT_0023c130) and its own sub-frame counter (DAT_000870e4)...
void advance_action_animation_frame()
{
  byte bVar1;
  int iVar2;
  set_pending_update_flags(2);
  if (6 < DAT_0023c120) {
    DAT_0023c120 = 6;
  }
  bVar1 = DAT_0023c130;
  if (DAT_0023c120 == 6) {
    if ((DAT_0023c130 == 6) || (DAT_0023c130 == 5)) {
LAB_0006e770:
      DAT_0023c130 = bVar1;
      iVar2 = (int)DAT_000870e4;
    }
    else {
      DAT_0023c130 = 5;
LAB_0006e700:
      iVar2 = -1;
LAB_0006e704:
      DAT_000870e4 = (short)iVar2;
    }
  }
  else {
    bVar1 = DAT_0023c120;
    if (DAT_0023c120 != 4) goto LAB_0006e770;
    if ((DAT_0023c130 == 6) || (DAT_0023c130 == 5)) {
      DAT_0023c130 = 3;
      iVar2 = 3;
      goto LAB_0006e704;
    }
    if (DAT_0023c260 != 0) {
      DAT_0023c130 = 4;
      goto LAB_0006e700;
    }
    if (2 < DAT_0023c130) {
      bVar1 = DAT_0023c130;
      if ((DAT_0023c130 == 4) && (DAT_000870d8 == DAT_000870dc)) goto LAB_0006e7d0;
      goto LAB_0006e770;
    }
    iVar2 = DAT_000870e4 + -2;
    DAT_000870e4 = (short)iVar2;
    if (iVar2 * 0x10000 >> 0x10 < -1) {
      DAT_0023c130 = 4;
    }
  }
  if (DAT_0023c130 == 3) {
    DAT_000870e4 = (short)(iVar2 + -1);
    if (-1 < (iVar2 + -1) * 0x10000 >> 0x10) {
      return;
    }
    DAT_0023c130 = 4;
    return;
  }
  if (DAT_0023c130 == 4) {
    if (DAT_000870d8 != DAT_000870dc) {
      DAT_000870e0 = 4;
      DAT_0023c120 = 6;
      return;
    }
  }
  else {
    if (DAT_0023c130 == 5) {
      DAT_000870e4 = (short)(iVar2 + 1);
      if ((iVar2 + 1) * 0x10000 >> 0x10 < 3) {
        return;
      }
      DAT_0023c130 = 6;
      return;
    }
    if (DAT_0023c130 == 6) {
      if (DAT_000870d8 != DAT_000870dc) {
        load_weapon_swing_sprites();
        DAT_0023c120 = DAT_000870e0;
        DAT_000870e0 = 6;
        return;
      }
    }
    else {
      DAT_000870e4 = (short)(iVar2 + 1);
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
      if (iVar2 == 0) {
        DAT_0023c260 = 0;
        return;
      }
      if (iVar2 == 3) {
        DAT_0023c1dc = DAT_0023c1dc & 0xfeff;
        DAT_0023c260 = 1;
        return;
      }
      if (iVar2 != 9) {
        return;
      }
      DAT_0023c130 = 4;
      DAT_0023c120 = 4;
    }
  }
  DAT_000870e4 = -1;
LAB_0006e7d0:
  DAT_0023c1dc = DAT_0023c1dc & 0xfeff;
}






// was FUN_0006e89c -- loads a 16-byte weapon combat-maneuver record from \DATA\weapons.cm into
// DAT_00202700, seeking to offset 0x10 or 0 depending on a flag at DAT_00086df8+100 (bits 0x1c ==
// 4, an unidentified player/class condition).
bool load_weapon_combat_maneuver_data()
{
  char stack0xffdc3248_buf [256];
  char *stack0xffdc3248_ptr;
  char cVar1;
  undefined2 uVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  bool bVar7;
  char acStack_110 [260];
  
  pcVar3 = &DAT_0023cca8;
    stack0xffdc3248_ptr = acStack_110;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc3248_ptr = cVar1; stack0xffdc3248_ptr = stack0xffdc3248_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_110,s__DATA_weapons_cm_00087284);
  iVar4 = open_file_for_read(acStack_110);
  if (iVar4 == 0) {
    bVar7 = false;
  }
  else {
    uVar2 = 0x10;
    if ((*(byte *)(DAT_00086df8 + 100) & 0x1c) != 4) {
      uVar2 = 0;
    }
    iVar5 = seek_file_handle(iVar4,uVar2,0);
    iVar6 = read_file_handle(iVar4,&DAT_00202700,0x10);
    bVar7 = iVar5 == 0 && iVar6 == 0x10;
    CloseHandle(iVar4);
  }
  return bVar7;
}


// was FUN_00012948 -- always returns immediately and does nothing else; confirmed used two ways at
// its real call sites (uw.c): once inside a 13-iteration animation loop (weapon_overlay_flash_hold)
// alongside weapon_overlay_and_full_redraw...
void debug_noop_frame_hook(int frame)
{
}


// was FUN_000271dc -- finds/consumes the ammunition item required for weapon type param_1 (looked
// up from &DAT_002027d2), returning its inventory slot; on failure (none found), prints a "Sorry...
int find_and_consume_ammo(short weapon_type)
{
  ushort *found_item;
  char *wptr_14062;
  char cVar1;
  short sVar2;
  int iVar3;
  char *pcVar4;
  /* Was 544528 bytes -- same Ghidra stack-frame-size-miscalculation artifact already fixed
     elsewhere this session (check_object_fits_in_slot, dispatch_object_action,
     try_combine_or_stow_object)... */
  char acStackY_84f60 [64];
  short local_4c [4];
  ushort local_44 [4];
  char acStack_3c [52];
  
  cVar1 = g_ranged_type_props[weapon_type].ammo_damage_selector;
  found_item = find_equipped_item_by_category(0,1,(int)cVar1,4,(ushort *)local_4c);
  if (found_item == 0) {
    local_44[0] = ((short)cVar1 + 0x10U ^ local_44[0]) & 0x1ff ^ local_44[0];
    message_scroll_print_wrapped(s_Sorry__you_have_no_00084f2c);
    sVar2 = build_object_display_name(acStack_3c,local_44,0,1);
    if (sVar2 == 0) {
      pcVar4 = s_UNNAMED_00084f24;
    wptr_14062 = acStackY_84f60;
      do {
        cVar1 = *pcVar4;
        *wptr_14062 = cVar1; wptr_14062 = wptr_14062 + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
    }
    message_scroll_print_wrapped(acStack_3c);
    message_scroll_print_wrapped(&DAT_00084f20);
    iVar3 = -1;
  }
  else {
    iVar3 = (int)local_4c[0];
  }
  return iVar3;
}


// was FUN_000275e0 -- resets the weapon-swing state machine after a completed swing: sets
// DAT_0010062c to a cooldown value, clears the "swing charging" cursor-holding flags, and resets
// the HUD status icons. Called from tick_weapon_swing_state's own swing-completion path.
void reset_weapon_swing_state()
{
  DAT_0010062c = 0xfff6;
  DAT_00084f10 = 0xffff;
  set_hud_status_value(3,0);
  g_cursor_holding_state = g_cursor_holding_state + -4;
  pop_cursor_icon(3);
  set_hud_status_value(8,4);
  DAT_001005ec = 0;
}



// was FUN_0002764c -- sets the HUD's weapon-ready status icon (a
// different icon depending on a flag bit at DAT_00086df8+0x5f) and
// clears the swing-charge status icon.
void update_weapon_ready_hud_icon()
{
  undefined4 uVar1;
  
  uVar1 = 4;
  if ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0) {
    uVar1 = 6;
  }
  set_hud_status_value(8,uVar1);
  set_hud_status_value(3,0);
}



// was FUN_00027694 -- fully cancels an in-progress weapon swing (charging or mid-animation):
// releases any held swing-charge cursor state, updates the HUD icons, and resets the swing phase
// counter (DAT_0010062c), pending-swing marker (DAT_00084f10)...
void cancel_weapon_swing()
{
  if ((DAT_001005ec != 0) && (DAT_00100618 == 0)) {
    g_cursor_holding_state = g_cursor_holding_state + -4;
    pop_cursor_icon(3);
  }
  update_weapon_ready_hud_icon();
  DAT_0010062c = 0;
  DAT_00084f10 = 0xffff;
  DAT_00100610 = -1;
}



// was FUN_00027708 -- per-frame weapon-swing state machine: param_1 is the requested attack
// direction/type (0=none, from interact_attack's screen-position-to-3x3-grid mapping), and
// DAT_0010062c is the swing phase counter (negative while charging/swinging).
void tick_weapon_swing_state(short attack_direction)
{
  byte bVar1;
  bool bVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  undefined2 local_20 [2];
  /* Was folded into `iVar5` (int) -- the pointer DAT_001005e4 now carries (see its own fix) needs
     to stay a real 64-bit pointer across this function's two dereference sites below (~17130 and
     ~17180). iVar5 itself keeps its OTHER... */
  char *pRecord;

  if (((short)DAT_00084f10 < 1) || ((&DAT_00250658)[(short)DAT_00084f10] == '\0')) {
    uVar3 = poll_keyboard_char_input(local_20);
    bVar2 = false;
    if ((uVar3 & 2) == 0) goto LAB_00027754;
  }
  bVar2 = true;
LAB_00027754:
  pRecord = DAT_001005e4;
  if (DAT_0010062c < 1) {
    if (DAT_0010062c < 0) {
      if ((-1 < DAT_000870e4) || (-10 < DAT_0010062c)) {
        if (6 < DAT_000870e4) {
          return;
        }
        if (2 < DAT_000870e4) {
          if (DAT_000870e4 != 3) {
            if (DAT_000870e4 != 6) {
              return;
            }
            if (DAT_0010062c < -9) {
              return;
            }
            set_hud_status_value(3,0);
            local_20[0] = ordint_divmod(100,((int)(((uint)*(byte *)(pRecord + 5) -
                                                  (uint)*(byte *)(pRecord + 3)) * 0x10000) >> 0x10) *
                                           (uint)DAT_00100614).quot;
            DAT_00100614 = *(char *)(pRecord + 3) + (char)local_20[0];
            *(byte *)(DAT_0023be74 + 0x1d) = *(byte *)(DAT_0023be74 + 0x1d) | 0xf;
            DAT_001005fc = DAT_00100614;
            compute_player_weapon_attack_stats(pRecord,DAT_001005e0,(int)DAT_00100618);
            process_melee_attack_swing();
            DAT_0010062c = 0xfff6;
            return;
          }
          if (DAT_001005ec != 0) {
            if ((!bVar2) && (-1 < DAT_00100618)) {
              iVar5 = is_mouse_within_tracked_hotspot();
              if (iVar5 != 0) {
                fire_ranged_weapon(*DAT_001005e0 & 0xf);
              }
              reset_weapon_swing_state();
              return;
            }
            if (-1 < DAT_00100618) {
              return;
            }
            set_hud_status_value(3,9);
            DAT_00100618 = 0;
            g_cursor_holding_state = g_cursor_holding_state + 4;
            push_cursor_icon(0x1075);
            return;
          }
          if (!bVar2) {
            if (DAT_0010062c < -4) {
              return;
            }
            set_hud_status_value(8,-1 - DAT_0010062c);
            DAT_0010062c = 0xfffb;
            return;
          }
          *(byte *)(DAT_0023be74 + 0x1d) = *(byte *)(DAT_0023be74 + 0x1d) & 0xfa | 10;
          if (DAT_001005e8 < 0) {
            DAT_001005f0 = read_realtime_clock_units();
            DAT_001005e8 = 0;
            return;
          }
          sVar4 = read_realtime_clock_units();
          DAT_001005e8 = (sVar4 - (short)DAT_001005f0) + DAT_001005e8;
          DAT_001005f0 = read_realtime_clock_units();
          if (DAT_001005e8 < 0x11) {
            return;
          }
          do {
            DAT_00100614 = DAT_00100614 + *(char *)(pRecord + 4);
            if (100 < DAT_00100614) {
              DAT_00100614 = 100;
            }
            sVar4 = ordint_divmod(0xc,DAT_00100614).quot;
            set_hud_status_value(3,sVar4 + 1);
            iVar6 = (int)DAT_001005e8;
            DAT_001005e8 = (short)(iVar6 + -0x10);
          } while (0x10 < (iVar6 + -0x10) * 0x10000 >> 0x10);
          return;
        }
        if (bVar2) {
          return;
        }
      }
      update_weapon_ready_hud_icon();
      DAT_0010062c = 0;
      DAT_00084f10 = 0xffff;
    }
    else if (((((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0) && (iVar5 = (int)attack_direction, iVar5 != 0)) &&
             (DAT_000870e4 == -1)) &&
            (DAT_00100618 = attack_direction, sVar4 = resolve_equipped_weapon_attack(&DAT_001005e4,&DAT_001005e0), -1 < sVar4))
    {
      if (sVar4 == 0) {
        DAT_00100618 = -1;
      }
      DAT_001005ec = (uint)(sVar4 == 0);
      bVar1 = (&DAT_00084eff)[iVar5];
      DAT_0010062c = (short)(-1 - (uint)bVar1);
      iVar5 = ordint_divmod(3,iVar5).quot;
      DAT_00084f10 = (ushort)(byte)(&DAT_00084f0b)[iVar5];
      set_hud_status_value(8,-1 - (-1 - (uint)bVar1));
      set_hud_status_value(3,1);
      DAT_001005e8 = -1;
      DAT_00100614 = 0;
    }
  }
}


// was FUN_00040bc0 -- resolves a sprite id to its .GR frame, decodes it, and blits it at
// (param_2,param_3).
void draw_hud_icon_sprite(int sprite_id, int x, int y)
{
  char cVar1;
  char cVar2;
  char *pcVar3;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  uint resolved;

  /* Dropped arguments (2 calls) -- same idiom as the identical `resolved =
     resolve_sprite_id_to_frame(sprite_id); lookup_grtile_by_id(resolved);` pair used correctly
     elsewhere in this file (see e.g. the call site right above this function). */
  resolved = resolve_sprite_id_to_frame(sprite_id);
  pcVar3 = (char *)lookup_grtile_by_id(resolved);
  cVar1 = pcVar3[1];
  cVar2 = pcVar3[2];
  if (*pcVar3 == '\x04') {
    pcVar3 = pcVar3 + 5;
  }
  else {
    /* HACK: dropped 3rd argument (the .GR entry's own compression-mode byte, *pcVar3) -- the same
       bug already found and fixed twice elsewhere in this file for this identical
       decompress_gr_bitmap call shape... */
    pcVar3 = (char *)decompress_gr_bitmap(pcVar3 + 4,&DAT_00202520 + (uint)(byte)pcVar3[3] * 0x10,*pcVar3);
  }
  bitmap_blit_to_framebuffer(x,y,pcVar3,cVar2,cVar1,0,0,1);
}


// was FUN_000411b8 -- generic "flash and hold" weapon-overlay transition: hides the cursor,
// disables the weapon overlay, redraws ~13 blank frames with it hidden...
void weapon_overlay_flash_hold(int unused_code)
{
  int iVar1;

  decrement_cursor_hide_depth();
  g_weapon_overlay_enabled = 0;
  iVar1 = 0;
  do {
    debug_noop_frame_hook(iVar1);
    weapon_overlay_and_full_redraw();
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 0xd);
  show_error_dialog_stub_thunk();
  weapon_overlay_and_full_redraw();
  g_weapon_overlay_enabled = 1;
  cursor_show_idle_tick();
}



// was FUN_000411cc -- sibling to weapon_overlay_flash_hold: instead of blank redraws, snapshots the
// live screen region (DAT_00248410) and repeatedly restores it over the overlay-disabled redraw
// loop, holding a frozen frame while the overlay stays hidden.
void weapon_overlay_flash_restore(int unused_code)
{
  /* ARM 0x41138..0x41150 keeps the allocation address in r5 for the
     initial copy and every restore. It must stay native-width here. */
  void *pvVar1;
  int iVar2;

  decrement_cursor_hide_depth();  /* ARM 0x411e8: no args; (0xc,__FILE__,0xf1) belongs to the debug-trace thunk at 0x41124 */
  pvVar1 = ce_malloc(0x4bec);
  ce_memmove(pvVar1,DAT_00248410,0x4bec);
  g_weapon_overlay_enabled = 0;
  weapon_overlay_and_full_redraw();
  for (iVar2 = 0xc; 0 < iVar2; iVar2 = (iVar2 + -1) * 0x10000 >> 0x10) {
    weapon_overlay_and_full_redraw();
    ce_memmove(DAT_00248410,pvVar1,0x4bec);
  }
  weapon_overlay_and_full_redraw();
  g_weapon_overlay_enabled = 1;
  cursor_show_idle_tick();
}



// was FUN_000411e0 -- the simplest of the three: a single disable-redraw-reenable cycle, used as a
// quick screen flash cue for damage/hazard events (src/combat.c, src/player.c, src/object_actions.c
// call it with various scroll-message-like codes, all ignored since it takes no parameters).
void weapon_overlay_flash_once(int unused_code)
{
  show_error_dialog_stub_thunk();
  decrement_cursor_hide_depth();
  g_weapon_overlay_enabled = 0;
  weapon_overlay_and_full_redraw();
  g_weapon_overlay_enabled = 1;
  cursor_show_idle_tick();
}


// was FUN_0004a210 -- fires a ranged weapon (param_1, a weapon type): finds and consumes a matching
// ammo item (find_and_consume_ammo), sets up the throw/aim state and spawns a projectile object
// near the player...
void fire_ranged_weapon(short weapon_type)
{
  int iVar1;
  byte bVar2;
  char cVar3;
  ushort uVar4;
  undefined4 uVar5;
  ushort *puVar6;
  ushort *puVar7;
  uint uVar8;
  
  /* Was a dropped argument -- find_and_consume_ammo's own weapon_type (weapon type). The very next line
     re-derives the identical `(&DAT_002027d2)[weapon_type*3]` table lookup find_and_consume_ammo's own
     body performs internally, confirming this caller's weapon_type is the value that belongs here. */
  uVar5 = find_and_consume_ammo(weapon_type);
  if (-1 < (short)uVar5) {
    iVar1 = (int)weapon_type;
    cVar3 = g_ranged_type_props[iVar1].ammo_damage_selector;
    DAT_00202a48 = (ushort)(byte) g_ranged_type_props[(short)cVar3].projectile_speed;
    DAT_00202a38 = cVar3 + 0x10;
    DAT_00202a4c = (ushort)(g_player_object->npc_xhome);
    DAT_00202a44 = g_player_object;
    DAT_00202a50 = (undefined2)(g_player_object->npc_yhome);
    DAT_00202a54 = 1;
    compute_drop_aim_from_cursor();
    puVar6 = (ushort *)spawn_object_near_player();
    if (puVar6 == (ushort *)0x0) {
      print_scroll_message_by_id(0xfe);
    }
    else {
      puVar7 = (ushort *)extract_ammo_and_refresh(0,1,(int)cVar3,uVar5);
      uVar8 = (*puVar7 ^ ((uw_object_hdr_t *)puVar6)->type_flags) & 0x7fff ^ (uint)*puVar7;
      ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)uVar8;
      uVar4 = puVar7[3];
      bVar2 = (byte)uVar4;
      ((uw_object_hdr_t *)puVar6)->link_word_low = ((byte)((uw_object_hdr_t *)puVar6)->link_word ^ bVar2) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)(char)(uVar4 >> 8);
      bVar2 = *(byte *)((char *)puVar7 + 1);
      ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar6)->type_flags;
      ((uw_object_hdr_t *)puVar6)->type_flags_high =
          (bVar2 ^ ((uw_object_hdr_t *)puVar6)->type_flags_high) & 0x1e ^ ((uw_object_hdr_t *)puVar6)->type_flags_high;
      ((uw_projectile_object_t *)puVar6)->lifetime = ((uw_object_hdr_t *)puVar7)->quality;
      ((uw_object_hdr_t *)puVar6)->link_word_low = ((byte)puVar7[3] ^ (byte)((uw_object_hdr_t *)puVar6)->link_word) & 0x3f ^ (byte)((uw_object_hdr_t *)puVar6)->link_word;
      ((uw_object_hdr_t *)puVar6)->link_word_high = ((uw_object_hdr_t *)puVar6)->link_word_high;
      bVar2 = *(byte *)((char *)puVar7 + 1);
      ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar6)->type_flags;
      ((uw_object_hdr_t *)puVar6)->doordir = (bVar2 >> 5) & 0x1;
      if ((*puVar7 & 0x1c0) != 0x140) {
        if ((g_object_type_props[(*puVar7 & 0x1ff)].class_flags & 3) != 2) {
          ((uw_projectile_object_t *)puVar6)->original_heading = ((uw_object_hdr_t *)puVar7)->heading;
        }
      }
      /* Was a dropped argument -- free_object_slot(weapon_type) always takes the object pointer to free
         (every other call site in the codebase, e.g. src/objects.c, src/traps.c, src/babl.c, passes
         one)... */
      free_object_slot(puVar7);
    }
    if ((iVar1 == 9) || (iVar1 == 10)) {
      play_sound_effect_with_pan(9,0x40,0);
    }
  }
}

/* Input: key-binding registration/dispatch, movement command handling (locomotion state, move
   vectors, directional step, analog turn), mouse state, and click/event waiting. Split out of uw.c
   (the original monolithic decompile) once these functions' real roles were confirmed. */
#include "headers/input.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

undefined4 DAT_000bbef8;
int g_force_flush;
short DAT_0023c63c;
undefined DAT_00250658_backing[256];
#define DAT_00250658 DAT_00250658_backing[0]
short DAT_00201c84;
static ushort DAT_00202084;
short DAT_00085890;
static short DAT_0020207a;
static short DAT_0020207c;
static short DAT_00202074;
short g_mouse_y;
short g_mouse_x;
short DAT_00204840;
static short *DAT_00202890;
static short *DAT_0020289c;
/* Real-pointer side table for the keybinding records' handler field. */
static void (*g_keybind_handler[512])(int);
static int g_keybind_handler_n;
/* Same 64-bit-truncation problem for the mouse-click-region table (register_click_region stored
   param_7 -- the handler -- in a 4-byte field of an 0x12-byte record)... */
static void (*g_click_region_handler[128])(int);
static int g_click_region_handler_n;
static undefined2 DAT_00202898;
static undefined2 DAT_0020288c;
static undefined2 DAT_00202894;
static short DAT_00085a70;
/* Per-mode "sticky redraw bits" mask read by dispatch_sticky_mode_handlers right after it finishes
   dispatching DAT_00201c84's currently-set bits through DAT_00085668... */
static const unsigned short DAT_00085728_real_table[3] = { 0x3800, 0x1000, 0x0000 };
#define DAT_00085728 (*(undefined1 *)DAT_00085728_real_table)
undefined2 DAT_00204710;
undefined2 DAT_0020470c;
undefined2 DAT_00204830;
undefined2 DAT_00204834;
short DAT_00204788;
int DAT_0020484c;
undefined2 DAT_0008696a;
undefined2 DAT_0008696c;
short DAT_00086968;
short DAT_00204850;
short DAT_0008696e;
static undefined4 DAT_00204868;
/* Real static lookup table (.data, read-only in practice) recovered byte-for-byte from UU.exe --
   the stylus-tap hit grid for the chargen name-entry on-screen keyboard. */
undefined1 DAT_00087650_backing[40] = {
  '0','1','2','3','4','5','6','7','8','9',
  'a','b','c','d','e','f','g','h','i','j',
  'k','l','m','n','o','p','q','r','s','t',
  'u','v','w','x','y','z',8,13,32,0x14
};
static short DAT_000876c4_backing[128];
short *DAT_000876c4 = DAT_000876c4_backing;
static short DAT_00086974;
static short DAT_00204708;
static short DAT_00204700;
static int DAT_00204864;
static short DAT_0020477c;
static short DAT_00204778;
static short DAT_00204780;
int DAT_0020485c;
char DAT_002506aa;
char DAT_002506ab;
undefined2 DAT_0023be8c;
static undefined2 DAT_0023be6c;
static undefined2 DAT_0023be68;
static undefined2 DAT_0023be70;
static undefined2 DAT_0023be7c;
static undefined2 DAT_0023be84;
static undefined2 DAT_0023be78;
static undefined2 DAT_0023be60;
static undefined2 DAT_0023bd7c;
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined DAT_00086e70_backing[4] = {
  0x09, 0x08, 0x0a, 0x00,
};
#define DAT_00086e70 DAT_00086e70_backing[0]
static undefined4 DAT_0023bf50;
/* Sizing pass: this is the real Microsoft GXKeyList struct (see
   gx_stub.c's own "8x (short vk + POINT pt), 12 bytes each ... = 0x60"
   comment) -- 96 bytes total, not 65536. */
undefined1 DAT_0023ce10_backing[128];
HWND__ *DAT_0023c548;






// was FUN_0003c524 -- set the player's locomotion state from a collision-state mask (param_1): when
// it changes, pick the movement mode (walk / swim / fly / fall) via apply_movement_mode_profile.
void set_locomotion_state(ushort collision_mask, int mode_flag)
{
  uint uVar1;
  undefined1 uVar2;
  int iVar3;
  
  uVar1 = (uint)(short)collision_mask;
  if ((DAT_00202084 != uVar1) || (mode_flag != 0)) {
    iVar3 = 0;
    uVar2 = 0;
    DAT_00202084 = collision_mask;
    if ((uVar1 & 0x22) == 0) {
      if ((uVar1 & 4) == 0) {
        if ((uVar1 & 0x10) != 0) {
          if ((DAT_0020208c & 4) == 0) {
            if ((DAT_0020208c & 0x10) == 0) {
              if ((DAT_0020208c & 2) != 0) {
                uVar2 = 6;
              }
            }
            else {
              uVar2 = 5;
            }
          }
          else {
            uVar2 = 4;
          }
        }
      }
      else {
        uVar2 = 2;
      }
    }
    else if ((DAT_0020208c & 8) == 0) {
      /* Was `apply_swim_wade_pose()` with no argument -- apply_swim_wade_pose reads its `collision_mask &
         2` to decide between the two swim/wade sub-states... */
      iVar3 = apply_swim_wade_pose(collision_mask);
      uVar2 = 1;
    }
    apply_movement_mode_profile(uVar2);
    if (iVar3 == 0) {
      *(undefined1 *)(DAT_00086df8 + 0xb9) = 0;
    }
  }
  if ((uVar1 & 0x10) != 0) {
    if ((DAT_0020208c & 0x14) == 0) {
      if (g_fall_accel == 0) {
        g_fall_accel = -4;
      }
      if (((DAT_0020208c & 2) != 0) && (g_vertical_velocity < -0x5d)) {
        g_vertical_velocity = -0x5e;
        iVar3 = (int)g_jump_ascent_timer;
        if (iVar3 < 0x15) {
          g_jump_ascent_timer = 0;
        }
        else {
          if (iVar3 < 0) {
            iVar3 = iVar3 + 1;
          }
          g_jump_ascent_timer = (short)(iVar3 >> 1);
        }
      }
    }
    else {
      g_fall_accel = 0;
      uVar1 = (uint)g_vertical_velocity;
      if ((int)((uVar1 ^ (int)uVar1 >> 0x1f) - ((int)uVar1 >> 0x1f)) < 0xb) {
        g_vertical_velocity = 0;
      }
      else {
        g_vertical_velocity = ordint_divmod(5,uVar1 << 2).quot;
      }
    }
  }
}




// was FUN_0003d94c -- resolve a movement mode (param_1 = g_movement_mode) into a travel direction
// (DAT_00201c78) + step magnitude (*param_3): 0 stop 1 analog move/turn (DAT_0023bf48/4c rates) 6/7
// jump 8 move + face 180 9 sidestep left 10 sidestep right...
void resolve_move_vector(short movement_mode, short step_scale, short *out_step)
{
  short sVar1;
  int iVar2;
  short sVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  
  sVar3 = DAT_00201c70;
  sVar1 = DAT_0020207a;
  switch(movement_mode) {
  case 0:
    *out_step = 0;
    sVar3 = DAT_00201c78;
    break;
  case 1:
    iVar4 = (int)DAT_0023bf4c;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 3;
    }
    iVar4 = (iVar4 >> 2) * (int)DAT_00086e68 * (int)step_scale;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 3;
    }
    sVar3 = DAT_00201c70 + (short)(iVar4 >> 2);
    iVar4 = ((int)DAT_0023bf48 >> 2) * (int)DAT_00202078;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 0x1f;
    }
    DAT_00201c70 = sVar3;
    *out_step = (short)(iVar4 >> 5);
    DAT_00202088 = 0;
    break;
  case 2:
    sVar3 = DAT_00201c70;
    break;
  case 3:
    sVar3 = DAT_00201c70;
    break;
  case 4:
    sVar3 = DAT_00201c70;
    break;
  case 5:
    sVar3 = DAT_00201c70;
    break;
  case 6:
    if (g_vertical_velocity != 0) {
      DAT_00201c78 = DAT_00201c70;
      return;
    }
    if (g_fall_accel != 0) {
      DAT_00201c78 = DAT_00201c70;
      return;
    }
    if (g_jump_ascent_timer != 0) {
      DAT_00201c78 = DAT_00201c70;
      return;
    }
    DAT_00201c78 = DAT_00201c70;
    iVar4 = (int)DAT_00202078;
    if (iVar4 < 0) {
      iVar4 = iVar4 + 1;
    }
    g_jump_ascent_timer = (short)(iVar4 >> 1);
    *out_step = g_jump_ascent_timer;
    DAT_00202088 = 0;
    goto LAB_0003dafc;
  case 7:
LAB_0003dafc:
    g_vertical_velocity = 0x263;
    iVar2 = (int)DAT_00204884;
    bVar6 = SBORROW4(iVar2,0x280);
    iVar4 = iVar2 + -0x280;
    bVar5 = iVar2 == 0x280;
    if (0x280 < iVar2) {
      g_vertical_velocity = 0x1fd;
      bVar6 = SBORROW4(iVar2,0x2c0);
      iVar4 = iVar2 + -0x2c0;
      bVar5 = iVar2 == 0x2c0;
    }
    if (!bVar5 && iVar4 < 0 == bVar6) {
      g_vertical_velocity = 0x153;
    }
    sVar3 = DAT_00201c78;
    if ((DAT_0020208c & 1) == 0) {
      g_fall_accel = -4;
    }
    else {
      g_fall_accel = -2;
    }
    break;
  case 8:
    sVar3 = DAT_00201c70 + -0x8000;
    DAT_00202088 = 0xfffe;
    sVar1 = DAT_0020207c;
    goto LAB_0003da74;
  case 9:
    sVar3 = DAT_00201c70 + -0x4000;
    DAT_00202088 = 0xffff;
    goto LAB_0003da74;
  case 10:
    sVar3 = DAT_00201c70 + 0x4000;
    DAT_00202088 = 1;
LAB_0003da74:
    *out_step = sVar1;
    break;
  case 0xb:
    sVar3 = DAT_00201c70;
    break;
  case 0xc:
    g_vertical_velocity = 0x8d;
    goto LAB_0003db80;
  case 0xd:
    g_vertical_velocity = -0x8d;
LAB_0003db80:
    DAT_00202088 = 0;
    g_fall_accel = 0;
    sVar3 = DAT_00201c70;
  }
  DAT_00201c78 = sVar3;
}




// was FUN_0004213c -- append a (keycode, arg, mode-mask, handler) record
// to the DAT_0020289c keybinding table.
/* was undefined4 -- the handler function pointer; 32-bit truncated every real 64-bit callee
   address at the call site (move_key_directional_step etc.), so the side-table entry was an
   uncallable low-32-bits value. */
int register_key_binding(int key_code, int arg, int mode_mask, void *handler)
{
  short sVar1;
  int iVar2;
  char *iVar3;
  void *pvVar4;

  iVar2 = (int)DAT_0020288c;
  DAT_0020288c = (short)(iVar2 + 1);
  /* See register_click_region's identical fix -- ce_realloc (realloc-shaped)
     returns a real pointer, iVar2 was truncating it. */
  pvVar4 = ce_realloc(DAT_0020289c,((iVar2 + 1) * 0x10000 >> 0x10) * 0xc);
  if (pvVar4 == 0) {
    report_fatal_error_and_exit(0x1006);
  }
  sVar1 = DAT_00085a70;
  iVar3 = (char *)((char *)pvVar4 + DAT_0020288c * 0xc);
  DAT_0020289c = pvVar4;
  /* real 64-bit handler, indexed by record position (iVar2 == old count) */
  if ((uint)iVar2 < 512) {
    g_keybind_handler[iVar2] = (void (*)(int))handler;
    if (iVar2 + 1 > g_keybind_handler_n) g_keybind_handler_n = iVar2 + 1;
  }
  *(undefined1 *)(iVar3 + -0xc) = (char)DAT_00085a70;
  *(char *)(iVar3 + -0xb) = (char)((ushort)sVar1 >> 8);
  DAT_00085a70 = DAT_00085a70 + -1;
  *(char *)(iVar3 + -7) = (char)((uint)arg >> 8);
  *(char *)(iVar3 + -5) = (char)((uint)mode_mask >> 8);
  *(char *)(iVar3 + -3) = (char)((uintptr_t)handler >> 8);
  *(char *)(iVar3 + -8) = (char)arg;
  *(char *)(iVar3 + -2) = (char)((uintptr_t)handler >> 0x10);
  *(char *)(iVar3 + -6) = (char)mode_mask;
  *(char *)(iVar3 + -4) = (char)(uintptr_t)handler;
  *(char *)(iVar3 + -1) = (char)((uintptr_t)handler >> 0x18);
  *(char *)(iVar3 + -9) = (char)((uint)key_code >> 8);
  *(char *)(iVar3 + -10) = (char)key_code;
  return (int)CONCAT11(*(undefined1 *)(iVar3 + -0xb),*(undefined1 *)(iVar3 + -0xc));
}



// was FUN_0004221c -- remove a keybinding (and its mouse-region sibling)
// by record id, compacting the table.
void unregister_key_binding(short binding_id)
{
  bool bVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  int iVar5;
  short sVar6;
  short *psVar7;
  short *psVar8;
  short *psVar9;
  int iVar10;
  
  if (binding_id == 0) {
    return;
  }
  iVar10 = 1;
  sVar6 = 1;
  if (binding_id < 1) {
    psVar9 = &DAT_0020288c;
    iVar5 = (int)DAT_0020288c;
    psVar7 = DAT_0020289c;
    if (0 < iVar5) {
      do {
        sVar6 = (short)iVar10;
        if (*psVar7 == binding_id) break;
        iVar3 = (int)sVar6;
        iVar2 = (iVar3 + 1) * 0x10000;
        psVar7 = psVar7 + 6;
        iVar10 = iVar2 >> 0x10;
        sVar6 = (short)((uint)iVar2 >> 0x10);
      } while (iVar3 < iVar5);
    }
    if ((int)sVar6 == iVar5 + 1) {
      return;
    }
    if (sVar6 < iVar5) {
      /* the byte copy below moves the LAST record over the removed one; mirror that move in the
         real-handler side table (found 0-based = sVar6-1, last 0-based = iVar5-1, before iVar5 is
         reused as the copy counter). */
      if ((uint)(sVar6 - 1) < 512 && (uint)(iVar5 - 1) < 512) {
        g_keybind_handler[sVar6 - 1] = g_keybind_handler[iVar5 - 1];
      }
      iVar10 = 0xc;
      psVar8 = DAT_0020289c + iVar5 * 6 + -6;
      do {
        iVar5 = iVar10 + -1;
        *(char *)psVar7 = (char)*psVar8;
        bVar1 = 0 < iVar10;
        iVar10 = iVar5;
        psVar8 = (short *)((char *)psVar8 + 1);
        psVar7 = (short *)((char *)psVar7 + 1);
      } while (iVar5 != 0 && bVar1);
    }
    if (g_keybind_handler_n > 0) g_keybind_handler_n--;
    sVar6 = DAT_0020288c;
    if (DAT_0020288c < 2) goto LAB_00042510;
    DAT_0020288c = (short)((uint)((DAT_0020288c + -1) * 0x10000) >> 0x10);
    DAT_0020289c = (short *)ce_realloc(DAT_0020289c,DAT_0020288c * 0xc);
    if (DAT_0020289c != (short *)0x0) {
      return;
    }
    uVar4 = 0x1006;
    DAT_0020289c = (short *)0x0;
  }
  else {
    psVar9 = &DAT_00202898;
    iVar5 = (int)DAT_00202898;
    psVar7 = DAT_00202890;
    if (0 < iVar5) {
      do {
        sVar6 = (short)iVar10;
        if (*psVar7 == binding_id) break;
        iVar3 = (int)sVar6;
        iVar2 = (iVar3 + 1) * 0x10000;
        psVar7 = psVar7 + 9;
        iVar10 = iVar2 >> 0x10;
        sVar6 = (short)((uint)iVar2 >> 0x10);
      } while (iVar3 < iVar5);
    }
    if ((int)sVar6 == iVar5 + 1) {
      return;
    }
    if (sVar6 < iVar5) {
      /* record copy below moves the last click region over the removed
         one; mirror that in the real-handler side table (found 0-based =
         sVar6-1, last 0-based = iVar5-1). */
      if ((uint)(sVar6 - 1) < 128 && (uint)(iVar5 - 1) < 128) {
        g_click_region_handler[sVar6 - 1] = g_click_region_handler[iVar5 - 1];
      }
      sVar6 = DAT_00202890[iVar5 * 9 + -9];
      *(char *)psVar7 = (char)sVar6;
      *(char *)((char *)psVar7 + 1) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[3];
      *(char *)(psVar7 + 3) = (char)sVar6;
      *(char *)((char *)psVar7 + 7) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[4];
      *(char *)(psVar7 + 4) = (char)sVar6;
      *(char *)((char *)psVar7 + 9) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[1];
      *(char *)(psVar7 + 1) = (char)sVar6;
      *(char *)((char *)psVar7 + 3) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[2];
      *(char *)(psVar7 + 2) = (char)sVar6;
      *(char *)((char *)psVar7 + 5) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[5];
      *(char *)(psVar7 + 5) = (char)sVar6;
      *(char *)((char *)psVar7 + 0xb) = (char)((ushort)sVar6 >> 8);
      sVar6 = DAT_00202890[6];
      *(char *)(psVar7 + 6) = (char)sVar6;
      *(char *)((char *)psVar7 + 0xd) = (char)((ushort)sVar6 >> 8);
      uVar4 = *(undefined4 *)(DAT_00202890 + 7);
      *(char *)(psVar7 + 7) = (char)uVar4;
      *(char *)((char *)psVar7 + 0xf) = (char)((uint)uVar4 >> 8);
      *(char *)(psVar7 + 8) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)psVar7 + 0x11) = (char)((uint)uVar4 >> 0x18);
    }
    if (g_click_region_handler_n > 0) g_click_region_handler_n--;
    sVar6 = DAT_00202898;
    if (DAT_00202898 < 2) {
LAB_00042510:
      *psVar9 = sVar6 + -1;
      return;
    }
    DAT_00202898 = (short)((uint)((DAT_00202898 + -1) * 0x10000) >> 0x10);
    DAT_00202890 = (short *)ce_realloc(DAT_00202890,DAT_00202898 * 0x12);
    if (DAT_00202890 != (short *)0x0) {
      return;
    }
    uVar4 = 0x1005;
    DAT_00202890 = (short *)0x0;
  }
  report_fatal_error_and_exit(uVar4);
}



// was FUN_0004251c -- per-frame input pump: read the pending input code,
// dispatch a mouse button to a click region or a key to a keybinding.
void poll_input_bindings(void *input_state_ptr)
{
  byte *input_state = (byte *)input_state_ptr;
  undefined4 uVar1;
  /* Was `int`, truncating the real DAT_00202890 pointer arithmetic result below -- same
     pointer-truncation pattern already fixed in this function's own sibling dispatch_key_binding
     (see its comment)... */
  char *pcVar2;
  int iVar3;
  int iVar4;
  short local_28;
  short local_26;

  uVar1 = peek_input_event();
  if (-1 < (short)uVar1) {
    if ((short)uVar1 < 4) {
      get_click_position(&local_28,&local_26);
      input_state[6] = (char)uVar1;
      input_state[7] = (char)((uint)uVar1 >> 8);
      /* The mouse-button-state field of the DAT_00085a6c struct is at BYTE offset 12: every reader
         (handle_game_view_click's click-and-hold walk, spawn_new_object, ...) does `*(ushort
         *)(DAT_00085a6c + 6)`, which is byte 12 because DAT_00085a6c is typed `short *`... */
      input_state[12] = (char)uVar1;
      input_state[13] = (char)((uint)uVar1 >> 8);
      get_click_position(&local_28,&local_26);
      input_state[4] = 1;
      input_state[5] = 0;
      iVar4 = DAT_00202898 + -1;
      iVar3 = iVar4 * 0x10000 >> 0x10;
      if (-1 < iVar3) {
        do {
          pcVar2 = (char *)DAT_00202890 + iVar3 * 0x12;
          if ((((*(short *)(pcVar2 + 6) <= local_28) && (local_26 <= *(short *)(pcVar2 + 8))) &&
              (local_28 <= *(short *)(pcVar2 + 2))) &&
             (((*(short *)(pcVar2 + 4) <= local_26 &&
               ((*(ushort *)(pcVar2 + 0xc) & *(ushort *)(input_state + 8)) != 0)) &&
              (*(int *)(pcVar2 + 0xe) != 0)))) {
            {
              int _cri = (int)(short)iVar4;   /* matched record index */
              iVar3 = (short)iVar4 * 0x12;
              iVar4 = (int)local_28 - (int)*(short *)((char *)DAT_00202890 + iVar3 + 6);
              *input_state = (char)iVar4;
              input_state[1] = (char)((uint)iVar4 >> 8);
              iVar4 = (int)*(short *)((char *)DAT_00202890 + iVar3 + 8) - (int)local_26;
              input_state[2] = (char)iVar4;
              input_state[3] = (char)((uint)iVar4 >> 8);
              /* call the real 64-bit handler, not the truncated in-record
                 pointer (see g_click_region_handler). */
              if ((uint)_cri < 128 && g_click_region_handler[_cri] != 0) {
                g_click_region_handler[_cri]((int)*(short *)((char *)DAT_00202890 + iVar3 + 10));
              }
            }
            return;
          }
          iVar4 = (iVar3 + -1) * 0x10000 >> 0x10;
          iVar3 = iVar4;
        } while (-1 < iVar4);
      }
    }
    else {
      input_state[4] = 0;
      input_state[5] = 0;
      dispatch_key_binding(input_state,uVar1);
    }
  }
}




// was FUN_00057604
void wait_for_click_release(int mode)
{
  short sVar1;
  short sVar2;
  
  sVar2 = 1;
  DAT_0008696e = -1;
  if (DAT_00204850 != 1) {
    sVar2 = 2;
  }
  while( true ) {
    sVar1 = peek_input_event();
    /* Desktop input adaptation: the original only sees mouse codes (0..3) here, so any other event
       meant the stylus had lifted. A held movement key latches its code in DAT_0023c448, and that
       made peek_input_event return the key instead of the button state, ending the wait and
       dropping the dragged item the moment the player moved. Only while an item is held, keys
       leave the wait running; the button's own state decides when it ends. */
    if (sVar1 > 3 && g_selected_object != 0) {
      if (DAT_000876c8 != 0) {
        DAT_0023c448 = 0; /* key released: stop the walk, as app_main_loop does */
      }
      sVar1 = (short)poll_mouse_button_flags();
      if (sVar1 == 0) {
        sVar1 = -1;
      }
    }
    if (((((int)sVar2 | 0xfffcU) & (int)sVar1) != (int)sVar2) || (DAT_0008696e != -1)) break;
    if (mode != 0) {
      dispatch_sticky_mode_handlers();
    }
    process_pending_keyboard_scan_code(1);
    noop_key_handler();
    update_mouse_state();
  }
  if ((DAT_0008696e == -1) && (sVar2 = poll_mouse_button_flags(), sVar2 != 0)) {
    DAT_0008696a = g_mouse_x;
    DAT_0008696c = g_mouse_y;
    DAT_00086968 = sVar2;
  }
}




// was FUN_00057a70 -- poll_input_event(0): consume and return the next
// input event code (used by the menu / prompt input-wait loops).
int next_input_event()
{
  /* Was `poll_input_event(0); return 0;` -- computing the real event code and then discarding it in
     favor of a hardcoded 0. */
  return poll_input_event(0);
}




// was FUN_00057ff0
void update_mouse_state()
{
  short sVar1;
  short sVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  int iVar8;
  int iVar9;
  ushort uVar10;
  bool bVar11;
  short local_2c;
  ushort local_2a;
  short local_28;
  short sVar2;
  short sVar3;
  
  local_2a = 0;
  local_2c = 0;
  if (DAT_000bbef8 == 0) {
    if (*DAT_000876c4 != 0) {
      local_2a = *DAT_000876bc;
      local_2c = *DAT_000876c0;
    }
    if ((local_2a == 0) && (local_2c == 0)) {
      if (DAT_00086974 < 0) {
        return;
      }
      if (DAT_00204708 == 0) {
        iVar8 = read_realtime_clock_units();
        if ((uint)(iVar8 - DAT_00204864) < 10) {
          return;
        }
        iVar8 = (int)DAT_00204700;
        DAT_00204700 = (short)(iVar8 + 8);
        if (0x28 < (iVar8 + 8) * 0x10000 >> 0x10) {
          DAT_00204700 = 0x28;
        }
      }
      else if ((&DAT_00250658)[DAT_00204708] == '\0') {
        DAT_00204700 = DAT_00204700 >> 1;
        if (DAT_00204700 == 0) {
          DAT_00086974 = 0xffff;
          DAT_00204708 = 0;
          return;
        }
      }
      else {
        iVar8 = read_realtime_clock_units();
        if ((uint)(iVar8 - DAT_00204864) < 10) {
          return;
        }
      }
      DAT_00204864 = read_realtime_clock_units();
      uVar10 = 3;
      iVar8 = (int)DAT_00204700;
      local_28 = (short)((uint)((iVar8 + -1) * 0x10000) >> 0x10);
      while ((iVar8 != 0 && (uVar10 != 0))) {
        if ((DAT_00086974 + -5 < (int)(short)g_mouse_x + (int)(short)local_2a) &&
           (((int)(short)g_mouse_x + (int)(short)local_2a < DAT_00086974 + 5 &&
            ((uVar10 & 1) != 0)))) {
          uVar10 = uVar10 ^ 1;
          local_2a = DAT_00086974 - g_mouse_x;
        }
        else if ((uVar10 & 1) != 0) {
          local_2a = DAT_0020477c + local_2a;
        }
        iVar8 = (int)DAT_00204778;
        iVar9 = (int)g_mouse_y + (int)local_2c;
        if (((iVar8 + -5 < iVar9) && (iVar9 < iVar8 + 5)) && ((uVar10 & 2) != 0)) {
          uVar10 = uVar10 ^ 2;
          local_2c = (short)((uint)((iVar8 + g_mouse_y) * 0x10000) >> 0x10);
        }
        else if ((uVar10 & 2) != 0) {
          local_2c = local_2c - DAT_00204780;
        }
        iVar8 = (int)local_28;
        local_28 = (short)((uint)((iVar8 + -1) * 0x10000) >> 0x10);
      }
    }
    else {
      DAT_00086974 = -1;
    }
    sVar7 = DAT_000a85c8;
    sVar6 = DAT_000a85c4;
    sVar5 = DAT_000842a8;
    sVar4 = DAT_000842a4;
    sVar1 = local_28;
    sVar2 = local_28;
    sVar3 = local_28;
    if (DAT_0020485c != 0) {
      set_viewport_clip_rect(0,0,0x13f,199);
      local_28 = sVar6;
      sVar1 = sVar7;
      sVar2 = sVar4;
      sVar3 = sVar5;
    }
    iVar8 = erase_cursor_icon();
    if (iVar8 != 0) {
      DAT_00204844 = 0;
    }
    uVar10 = DAT_0020470c;
    if (((short)local_2a < (short)DAT_0020470c) ||
       (uVar10 = DAT_00204830, g_mouse_x = local_2a, (short)DAT_00204830 < (short)local_2a)) {
      g_mouse_x = uVar10;
    }
    sVar4 = DAT_00204710;
    if ((local_2c < DAT_00204710) ||
       (sVar4 = DAT_00204834, g_mouse_y = local_2c, DAT_00204834 < local_2c)) {
      g_mouse_y = sVar4;
    }
    iVar9 = (int)g_mouse_y;
    iVar8 = (uint)g_mouse_x << 0x10;
    bVar11 = (int)DAT_00086974 == iVar8 >> 0x10;
    if (bVar11) {
      iVar8 = (int)DAT_00204778;
      iVar9 = iVar9 << 0x10;
    }
    if (bVar11 && iVar8 == iVar9 >> 0x10) {
      DAT_00204708 = 0;
      DAT_00086974 = -1;
    }
    update_hotspot_cursor_icon();
    /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested) -- see cursor_show_idle_tick's own
       matching comment just above: skips the `DAT_00204788 != 0x106c` exclusion so the desktop
       cursor stays visible over the plain 3D viewport too, not just registered UI hotspots... */
    if ((0 < DAT_00204840) && ((DAT_00204788 != 0x106c) || uw_always_show_cursor())) {
      draw_idle_mouse_cursor();
    }
    if (DAT_0020485c != 0) {
      set_viewport_clip_rect((int)local_28,(int)sVar1,(int)sVar2,(int)sVar3);
    }
  }
}




// was FUN_000682f0 -- discrete movement-command handler: keyboard Z/C (strafe left/right), the 4
// GAPI hardware buttons (0x8d/0x8f/0x91/0x93), and the mouse click-and-hold walk (param_1 < 0).
// Routes via decode_movement_command.
void move_command_dispatch(short command)
{
  short sVar1;
  short *psVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  ushort local_28 [2];
  
  if (command < 0) {
    DAT_0023bf50 = 0;
    poll_keyboard_char_input(local_28);
    psVar2 = DAT_00085a6c;
    if ((local_28[0] != 1) &&
       (((local_28[0] & 1) == 0 || ((*(byte *)(DAT_00086df8 + 0x5f) & 2) == 0)))) {
      if (local_28[0] != 3) {
        return;
      }
      if ((DAT_002048a8 & 0x10) != 0) {
        g_movement_mode = 1;
        return;
      }
      if (*(char *)(DAT_00086df8 + 0xb8) == '\x01') {
        g_movement_mode = 1;
        return;
      }
      g_movement_mode = 7;
      return;
    }
    DAT_0023bf4c = 0;
    DAT_0023bf48 = 0;
    sVar1 = DAT_00085a6c[1];
    iVar5 = (int)DAT_0023be88;
    iVar3 = ordint_divmod(5,iVar5).quot;
    if (sVar1 < iVar3) {
      iVar3 = ordint_divmod((int)DAT_0023bd80,*psVar2 * 3).quot;
      g_movement_mode = (ushort)(byte)(&DAT_00086e70)[iVar3];
      return;
    }
    iVar4 = (int)DAT_0023bd80;
    iVar3 = ordint_divmod(3,iVar4).quot;
    if (*psVar2 < iVar3) {
      DAT_0023bf4c = ordint_divmod(iVar4,(*psVar2 - iVar3) * 0x180).quot;
    }
    iVar3 = ordint_divmod(3,iVar4 << 1).quot;
    if (iVar3 < *psVar2) {
      DAT_0023bf4c = ordint_divmod(iVar4,(*psVar2 - iVar3) * 0x180).quot;
    }
    iVar3 = ordint_divmod(5,iVar5 << 1).quot;
    if (iVar3 < psVar2[1]) {
      DAT_0023bf48 = ordint_divmod(iVar5,(psVar2[1] - iVar3) * 0xc0).quot;
    }
  }
  else {
    DAT_0023bf50 = 1;
    decode_movement_command();
    if (command == 0) {
      g_movement_mode = command;
      DAT_0023bf48 = 0;
      DAT_0023bf4c = 0;
      return;
    }
    if (command < 6) {
      return;
    }
    if (7 < command) {
      return;
    }
    if (((DAT_002048a8 & 0x10) == 0) && (*(char *)(DAT_00086df8 + 0xb8) != '\x01')) {
      g_movement_mode = command;
      return;
    }
  }
  g_movement_mode = 1;
}




/* Port, DOS style: the polled movement keys (W/S/X/A/D/Z/C) are not funnelled through the one
   pending-key slot (DAT_0023c448) a typed key or button code lands in. They are a held-key state
   of their own, like DOS's key array read by do_player_keyboard, which decode_movement_command
   reads directly. A jump (or any other key) pressed while walking therefore reaches its binding
   untouched, and decodes together with the held walk. */
ushort g_held_move_keys;

void set_held_movement_keys(ushort mask)
{
  if (mask != 0) {
    if (g_held_move_keys == 0) {
      DAT_0024af6c = 0x14; /* press edge: restart the held-key accelerator ramp */
    }
    DAT_000876c8 = 0;
  }
  else if (g_held_move_keys != 0) {
    DAT_000876c8 = 1; /* all released: the main loop clears the pending-key slot */
  }
  g_held_move_keys = mask;
}

/* Sets DAT_0023bf48 (forward rate, same 0x500000 scale decode_movement_command's own forward code
   0x8d uses) and DAT_0023bf4c (turn rate, via uw_turn_rate_accel()) together in one call, then
   g_movement_mode = 1... */
void uw_set_analog_move_turn(int fwd_held, int turn_dir) {
  DAT_0023bf48 = fwd_held ? ordint_divmod(100,(int)((long long)DAT_0024af6c * 0x500000 >> 0x10)).quot : 0;
  if (turn_dir < 0) {
    DAT_0023bf4c = ordint_divmod(100,(int)((long long)uw_turn_rate_accel() * -0x5a0000 >> 0x10)).quot;
  } else if (turn_dir > 0) {
    DAT_0023bf4c = ordint_divmod(100,(int)((long long)uw_turn_rate_accel() * 0x5a0000 >> 0x10)).quot;
  } else {
    DAT_0023bf4c = 0;
  }
  g_movement_mode = 1;
}



// was FUN_00068884 -- keyboard directional-move handler bound to W/S/X/A/D
// (run-forward / walk-forward / walk-back / turn-left / turn-right); calls
// begin_directional_move then movement_tick, then paces one held-key frame.
void move_key_directional_step(int direction)
{
  int iVar1;
  int iVar2;
  ushort uVar3;
  
  iVar1 = read_realtime_clock_units();
  iVar2 = begin_directional_move(direction);
  if (iVar2 != 0) {
    DAT_0023bf54 = read_realtime_clock_units();
    DAT_0023bf58 = DAT_0023bf58 + 4;
    g_jump_ascent_timer = 0;
    if (DAT_000879ac != 0) {
      scheduler_tick(1);
    }
    iVar2 = *(int *)(DAT_00086df8 + 0xce) + 0x40;
    *(char *)(DAT_00086df8 + 0xce) = (char)iVar2;
    *(char *)(DAT_00086df8 + 0xcf) = (char)((uint)iVar2 >> 8);
    *(char *)(DAT_00086df8 + 0xd0) = (char)((uint)iVar2 >> 0x10);
    *(char *)(DAT_00086df8 + 0xd1) = (char)((uint)iVar2 >> 0x18);
    DAT_0023bf54 = read_realtime_clock_units();
    uVar3 = (ushort)DAT_0023bf58;
    if (DAT_002020d4 == 0) {
      DAT_0023bf58 = 0;
    }
    else {
      uVar3 = (ushort)DAT_0023bf58;
      DAT_0023bf58 = DAT_0023bf58 & 1;
      uVar3 = (short)uVar3 >> 1;
    }
    movement_tick(0x40,uVar3,1);
    /* movement_tick can come out of that one call with DAT_0023bea8=1 (a "climbing a step"
       eye-height bob in progress -- see update_current_view_from_subject's own comment on
       DAT_0023bea8/be98) if g_movement_mode happened to read as one of the climb-triggering... */
    DAT_0023bea8 = 0;
    DAT_0023be98 = 0;
    set_pending_update_flags(10);
  }
  do {
    iVar2 = read_realtime_clock_units();
  } while ((uint)(iVar2 - iVar1) < 0x18);
  reset_keyboard_char_input();
}




// was FUN_0006764c -- divides the game viewport rect (param_1=x, param_2=y, param_3=width,
// param_4=height) into 8 click regions, all sharing the same handler (handle_game_view_click, the
// "3D-viewport's own click-and-hold-to-walk region" per input.c's own comment)...
void register_game_view_interact_zones(int x, int y, int width, int height)
{
  int iVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  
  unregister_key_binding((int)DAT_0023be8c);
  iVar9 = (y - height) + 1;
  sVar2 = (short)x;
  iVar10 = x + width + -1;
  sVar3 = (short)y;
  sVar4 = (short)width;
  sVar5 = (short)height;
  DAT_0023bd80 = sVar4;
  DAT_0023be5c = sVar2;
  DAT_0023be80 = sVar3;
  DAT_0023be88 = sVar5;
  DAT_0023be8c = register_click_region(x,y,iVar10,iVar9,0,0x1b,handle_game_view_click);
  iVar6 = ordint_divmod(0xf,sVar5 * 3).quot;
  iVar6 = (sVar3 - iVar6) * 0x10000 >> 0x10;
  iVar7 = ordint_divmod(0xf,sVar4 * 5).quot;
  iVar1 = (iVar7 + sVar2) * 0x10000 >> 0x10;
  DAT_0023be6c = register_cursor_hotspot(x,y,iVar1,iVar6,0x106f);
  iVar7 = ((sVar2 - iVar7) + (int)sVar4) * 0x10000 >> 0x10;
  DAT_0023be68 = register_cursor_hotspot(iVar7,y,iVar10,iVar6,0x1070);
  DAT_0023be70 = register_cursor_hotspot(iVar1,y,iVar7,iVar6,0x106e);
  iVar8 = ordint_divmod(0xf,sVar5 * 6).quot;
  iVar8 = (sVar3 - iVar8) * 0x10000 >> 0x10;
  DAT_0023be7c = register_cursor_hotspot(x,iVar6,iVar1,iVar8,0x1071);
  DAT_0023be84 = register_cursor_hotspot(iVar7,iVar6,iVar10,iVar8,0x1072);
  DAT_0023be78 = register_cursor_hotspot(iVar1,iVar8,iVar7,iVar9,0x106d);
  DAT_0023be60 = register_cursor_hotspot(x,iVar8,iVar1,iVar9,0x1073);
  DAT_0023bd7c = register_cursor_hotspot(iVar7,iVar8,iVar10,iVar9,0x1074);
}



// was FUN_000678e0 -- teardown counterpart to
// register_game_view_interact_zones: unregisters the whole-rect key
// binding and all 8 click regions.
void unregister_game_view_interact_zones()
{
  unregister_key_binding((int)DAT_0023be8c);
  DAT_0023be8c = 0;
  unregister_cursor_hotspot((int)DAT_0023be6c);
  unregister_cursor_hotspot((int)DAT_0023be68);
  unregister_cursor_hotspot((int)DAT_0023be7c);
  unregister_cursor_hotspot((int)DAT_0023be84);
  unregister_cursor_hotspot((int)DAT_0023be70);
  unregister_cursor_hotspot((int)DAT_0023be78);
  unregister_cursor_hotspot((int)DAT_0023be60);
  unregister_cursor_hotspot((int)DAT_0023bd7c);
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

/* scroll_text_entry_prompt (hud.c)'s "a raw text field is actively reading keystrokes right now"
   flag -- see its own extern/comment in gx_stub.c and its set/clear in hud.c, and the matching
   comment on its use just below. */
extern int g_text_input_active;

// was FUN_00077b2c
int handle_keyboard_message(int window, int message, uint wparam)
{
  ushort uVar1;
  undefined4 *puVar2;
  undefined4 uVar3;
  
  if (message == 7) {
    GXResume();
    return 0;
  }
  if (message == 8) {
    GXSuspend();
    return 0;
  }
  uVar1 = (ushort)wparam;
  if (message != 0x100) {
    if (message == 0x101) {
      /* Releasing some other key (the jump key) must not stall a walk the polled movement keys
         still hold. */
      if (g_held_move_keys == 0) {
        DAT_000876c8 = 1;
        DAT_0024af6c = 0;
      }
      else {
        /* The walk goes on, but the released key's own pending code must still be dropped. The
           main loop only clears the slot when DAT_000876c8 says a key came up, which a held
           movement key keeps at 0, so a jump would otherwise repeat for as long as it is held. */
        DAT_0023c448 = 0;
      }
      return 0;
    }
    if (message != 0x102) {
      return 0;
    }
    /* No case-folding here any more. */
    DAT_0023c448 = DAT_0023c448 | uVar1;
    return 0;
  }
  DAT_0023c648 = read_realtime_clock_units();
  if (uVar1 == _DAT_0023ce10) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x91;
    return 0;
  }
  if (uVar1 == DAT_0023ce1c) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x8f;
    return 0;
  }
  if (uVar1 == DAT_0023ce28) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x8d;
    return 0;
  }
  if (uVar1 == DAT_0023ce34) {
    if (DAT_000876c8 != 0) {
      DAT_0024af6c = 0x14;
      DAT_000876c8 = 0;
    }
    DAT_0023c448 = 0x93;
    return 0;
  }
  if (uVar1 == DAT_0023ce40) {
    DAT_0023c448 = 0xd;
LAB_00077d08:
    puVar2 = &DAT_000876c8;
  }
  else {
    if (uVar1 == DAT_0023ce4c) {
      DAT_0023c448 = 0x1b;
      goto LAB_00077d08;
    }
    if (uVar1 == DAT_0023ce58) {
LAB_00077d4c:
      DAT_0023c448 = 0x4a;
      goto LAB_00077d08;
    }
    if (uVar1 == DAT_0023ce64) {
      return 0;
    }
    if (uVar1 == 0xc2) goto LAB_00077d4c;
    if (uVar1 != 0x14) {
      if (((uVar1 != 0x20) && (uVar1 != 8)) && (uVar1 != 0xd)) {
        return 0;
      }
      DAT_0023c448 = uVar1;
      return 0;
    }
    puVar2 = &DAT_0024af60;
    if (DAT_0024af60 == 0) {
      uVar3 = 1;
      goto LAB_00077d70;
    }
  }
  uVar3 = 0;
LAB_00077d70:
  *puVar2 = uVar3;
  return 0;
}








/* Recovered from a message-dispatch table baked into the original binary's .rdata (0x830e4-0x83144)
   that routes WM_MOUSEMOVE/WM_LBUTTONDOWN/ WM_LBUTTONUP/WM_RBUTTONDOWN/WM_RBUTTONUP (msg
   0x200/0x201/0x202/0x204/ 0x205) to this handler... */
// was FUN_00077dd0
int handle_mouse_message(int window, uint message, uint wparam, int lparam)
{
  short x;
  short y;
  int id;

  y = (short)(lparam >> 16);
  *DAT_000876bc = (ushort)(0x140 - y);
  x = (short)lparam;
  *DAT_000876c0 = x;

  // HACK (extended): DAT_000876c4 has zero writers anywhere in the real binary (confirmed via
  // Ghidra xrefs), so update_mouse_state() would never trust *DAT_000876bc/*DAT_000876c0 and
  // g_mouse_x/g_mouse_y would never update from real mouse input at all...
  if (uw_always_show_cursor()) {
    *DAT_000876c4 = 1;
  }
  if (message == 0x201) {
    if (!uw_always_show_cursor()) {
      *DAT_000876c4 = 1;
    }
    if ((200 < x) && (x < 0xf0)) {
      id = lookup_onscreen_keyboard_key_hit(*DAT_000876bc,x);
      fprintf(stderr, "[mousehit] on-screen-keyboard tap: x=%d storedY=%d -> id=%d ('%c')\n", x, *DAT_000876bc, id, (id >= 0x20 && id < 0x7f) ? id : '?');
      if ((id == 8) || (id == 0xd) || (id == 0x20) || (id == 0x14)) {
        PostMessageW(DAT_0023c548,0x100,id,0);
      }
      else {
        PostMessageW(DAT_0023c548,0x102,id,0);
      }
    }
    else {
      DAT_00204844 = 1;
      if ((g_cursor_mode != 0) || (g_cursor_holding_state != 0)) {
        DAT_00204844 = 2;
      }
// HACK: same dead-plumbing story as DAT_000876c4 above -- poll_mouse_button_flags (the source
      // of chargen's touch-select event codes 1-3) only ever returns nonzero via DAT_0023c63c or
      // DAT_002506aa/ab...
      DAT_0023c63c = 1;
    }
  }
  if (message == 0x202) {
    /* An EARLIER attempt at this exact fix (erase before clearing DAT_00204844) was reverted as "no
       measurable effect" -- that test apparently didn't hit the actual failure window. */
    erase_cursor_icon();
    DAT_00204844 = 0;
    if ((g_selected_object == 0) && ((DAT_00201b60 & 2) == 0)) {
      DAT_00204844 = 0;
    }
    *DAT_000876bc = 0;
    *DAT_000876c0 = 0;
    DAT_0023c63c = 0;
  }
  /* Right button (WM_RBUTTONDOWN/UP). */
  if (message == 0x204) {
    *DAT_000876c4 = 1;
    DAT_002506ab = 1;
  }
  if (message == 0x205) {
    DAT_002506ab = 0;
    *DAT_000876bc = 0;
    *DAT_000876c0 = 0;
  }
  return 0;
}


// was FUN_0003dca4 -- called from set_locomotion_state (src/input.c:83) with an "anim mode" code
// (0=walk,1=swim,2=fly-ish,4/5/6=fall variants; see that function's own comment) whenever the
// locomotion state changes...
void apply_movement_mode_profile(byte anim_mode)
{
  int iVar1;
  byte *pbVar2;
  undefined2 uVar3;
  short sVar4;
  uint uVar5;
  int *piVar6;
  char local_24 [8];
  byte local_1c [8];
  
  local_1c[1] = 3;
  local_1c[2] = 5;
  local_1c[0] = 10;
  local_1c[3] = 10;
  local_1c[4] = 1;
  builtin_strncpy(local_24 + 1,"\x01\x02\x04\b\b",5);
  local_1c[6] = 2;
  iVar1 = (int)(char)anim_mode;
  local_1c[5] = 7;
  /* Was `piVar6 = (int *)&DAT_00086df8;` (address of the global itself) with every subsequent
     `*piVar6` in this branch meant to read DAT_00086df8's real value back out -- but piVar6 was
     typed `int *`, so each of those dereferences only read the first 4 of DAT_00086df8's 8 bytes... */
  piVar6 = (int *)DAT_00086df8;
  local_24[0] = '\0';
  local_24[6] = 0;
  if (iVar1 == -1) {
    anim_mode = *(byte *)((char *)piVar6 + 0xb6) & 7;
  }
  else {
    *(byte *)((char *)DAT_00086df8 + 0xb8) = local_24[iVar1] + (*(byte *)((char *)DAT_00086df8 + 0xb8) & 0xe0);
    pbVar2 = (byte *)((char *)DAT_00086df8 + 0xb6);
    uVar3 = *(undefined2 *)pbVar2;
    *(byte *)((char *)DAT_00086df8 + 0xb6) = (*pbVar2 ^ anim_mode) & 7 ^ (byte)uVar3;
    *(char *)((char *)DAT_00086df8 + 0xb7) = (char)((ushort)uVar3 >> 8);
  }
  uVar5 = (uint)local_1c[(char)anim_mode];
  DAT_00202078 = ordint_divmod(10,(int)DAT_0008589c * uVar5).quot;
  DAT_0020207a = ordint_divmod(10,(int)DAT_00085898 * uVar5).quot;
  DAT_0020207c = ordint_divmod(10,(int)DAT_00085894 * uVar5).quot;
  if ((char)anim_mode < 4) {
    DAT_00202074 = ordint_divmod(10,(int)DAT_00086e68 * uVar5).quot;
  }
  else {
    DAT_00202074 = DAT_00086e68;
  }
  uVar5 = (uint)*(ushort *)(piVar6 + 0x13);
  if ((uVar5 == 0) || ((uint)*(ushort *)((char *)piVar6 + 0x4a) * 2 <= uVar5)) {
    DAT_00085890 = 0x60;
  }
  else {
    sVar4 = ordint_divmod(uVar5 << 1,(uint)*(ushort *)((char *)piVar6 + 0x4a) * 0x60).quot;
    DAT_00085890 = 0x60 - sVar4;
  }
}


// was FUN_000578fc -- always returns 0.
int get_alternate_keyboard_scan_code()
{
  return 0;
}



// was FUN_00057904 -- translates the pending keyboard event (DAT_0023c448, or
// get_alternate_keyboard_scan_code's result when param_1 is set) into an
// international-charset-mapped scan code via ce_tolower/1091, or 0xffffffff if none is pending.
uint process_pending_keyboard_scan_code(int use_alternate)
{
  short sVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  
  uVar2 = (uint)DAT_0023c448;
  if (use_alternate != 0) {
    uVar2 = get_alternate_keyboard_scan_code();
  }
  uVar4 = uVar2 & 0xff;
  sVar1 = (short)uVar4;
  if (sVar1 == 0) {
    uVar4 = 0xffffffff;
  }
  else {
    DAT_00204868 = read_realtime_clock_units();
    if ((uVar2 & 0x80) == 0) {
      if ((*DAT_0008794c != '\0') && (iVar3 = _isctype(sVar1,0x103), iVar3 != 0)) {
        if (DAT_0023c448 == 0x400) {
          sVar1 = ce_tolower(sVar1);
        }
        else {
          sVar1 = ce_toupper(sVar1);
        }
        uVar4 = (uint)sVar1;
      }
    }
    else if ((DAT_0023c448 & 0x400) != 0) {
      uVar4 = uVar4 | 0x400;
    }
    if (DAT_0023c448 == 0x200) {
      uVar4 = uVar4 | 0x200;
    }
    if (DAT_0023c448 == 0x100) {
      uVar4 = uVar4 | 0x100;
    }
    if (DAT_0023c448 == 0xd) {
      uVar4 = uVar4 | 0xd;
    }
  }
  return uVar4;
}



// was FUN_000579e4 -- pump input, then return the pending event code: the keyboard code latched in
// DAT_0023c448 (set by handle_keyboard_message), or a poll_mouse_event() code, or 0xffffffff if
// nothing is pending. param_1 == 0 clears DAT_0023c448 first (consume); != 0 leaves it (peek)...
uint poll_input_event(int peek_only)
{
  int iVar1;
  uint uVar2;
  undefined1 auStack_24 [28];
  
  if ((short)DAT_00201b60 == 4) {
    DAT_0023c448 = 0;
  }
  if (peek_only == 0) {
    DAT_0023c448 = 0;
  }
  iVar1 = PeekMessageW(auStack_24,0,0,0,1);
  if (iVar1 == 0) {
    uVar2 = 0xffffffff;
  }
  else {
    TranslateMessage(auStack_24);
    DispatchMessageW(auStack_24);
    uVar2 = (uint)DAT_0023c448;
    if (uVar2 == 0) {
      uVar2 = poll_mouse_event();
    }
  }
  return uVar2;
}



// was FUN_00057a78 -- poll_input_event(1): return the pending input event
// code without consuming it (used by the per-frame keybinding poll).
int peek_input_event()
{
  return poll_input_event(1);
}


// was FUN_0003c4dc -- set the player's swim/wade sub-pose byte (DAT_00086df8+0xb9) from the
// collision-state mask's "in liquid, how deep" bit (0x2): shallow (0x10) vs deep/wading (0x60, also
// force-leaving combat stance via unready_weapon -- can't hold a weapon ready while swimming).
bool apply_swim_wade_pose(ushort collision_mask)
{
  bool bVar1;

  bVar1 = (collision_mask & 2) == 0;
  if (bVar1) {
    *(undefined1 *)(DAT_00086df8 + 0xb9) = 0x10;
  }
  else {
    *(undefined1 *)(DAT_00086df8 + 0xb9) = 0x60;
    unready_weapon();
  }
  return !bVar1;
}






// was FUN_0003c7f4 -- translate a W/S/X/A/D direction arg (-2..2) into
// movement-engine target state (heading-relative goal position/heading).
int begin_directional_move(short direction)
{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  int uVar4;
  byte *saved_scratch;
  int extraout_r1;
  uint uVar5;
  ushort uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  ushort *uVar11;
  ushort local_44;
  ushort local_42;
  uint local_40;
  /* DAT_00202c6c points at this scratch record for the
     collision_height_envelope/sort_collision_candidates/ collision_add_candidate_object call
     sequence below. */
  char local_24[24];
#define local_3c (*(undefined2 *)(local_24 + 0))
#define local_3a (*(undefined2 *)(local_24 + 2))
#define local_38 (*(ushort *)(local_24 + 4))
#define local_34 (*(byte *)(local_24 + 6))
#define local_33 (*(undefined1 *)(local_24 + 7))
#define local_32 (*(undefined2 *)(local_24 + 8))
  
  if ((g_fall_accel == 0) && (g_jump_ascent_timer < DAT_00085890)) {
    uVar10 = 0;
    if (direction == -2) {
      uVar4 = 0x40;
      iVar7 = (short)DAT_00201c70 + 0x8000;
LAB_0003c940:
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0xff;
      }
      local_44 = DAT_00204880;
      local_40 = (uint)((DAT_0020208c & 0x14) != 0);
      uVar5 = local_40;
      local_42 = DAT_00204882;
      project_position_by_heading((int)(short)((uint)iVar7 >> 8),uVar4,&local_44,&local_42);
      iVar7 = (int)(short)local_44;
      iVar8 = (int)(short)local_42;
      if (iVar8 < 0) {
        iVar8 = iVar8 + 0x1f;
      }
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0x1f;
      }
      iVar7 = check_object_placement_clearance(0x7f,1,(int)(short)(iVar7 >> 5),(int)(short)(iVar8 >> 5),
                           g_player_object->hdr.zpos,uVar5 | uVar10,8);
      if ((iVar7 == 0) ||
         ((((uVar10 == 0 && (uVar3 = (uint)DAT_00202c68, uVar3 != 1)) && (uVar3 != DAT_00202084)) &&
          ((uVar3 != 0x10 || (uVar5 == 0)))))) goto LAB_0003cdf8;
      DAT_00204880 = local_44;
      DAT_00204882 = local_42;
      iVar9 = ((int)(short)local_42 >> 8) * 0x40 + (((int)(short)local_44 << 0x10) >> 0x18);
      iVar8 = (int)DAT_00202080;
      iVar7 = iVar9 * 0x10000 >> 0x10;
      if (iVar7 != iVar8) {
        if (iVar8 != -1) {
          object_list_unlink(DAT_002029cc + iVar8 * 4 + 2,g_player_object);
        }
        DAT_00202080 = (short)iVar9;
        object_list_insert_head(DAT_002029cc + iVar7 * 4 + 2,g_player_object);
        uVar6 = DAT_00204880 & 0x3f00;
        uVar5 = g_player_object->tile_word & 0x3ff;
        g_player_object->tile_x = (uVar6 >> 8) & 0x3f;
        g_player_object->tile_y = ((ushort)DAT_00204882 >> 8) & 0x3f;
        uVar5 = g_player_object->tile_word;
        uVar5 = local_40;
      }
      uVar6 = DAT_00204880 & 0xe0;
      uVar3 = g_player_object->hdr.position_word & 0x1fff;
      g_player_object->hdr.xpos = (uVar6 >> 5) & 7;
      uVar6 = DAT_00204882 & 0xe0;
      uVar3 = g_player_object->hdr.position_word & 0xe3ff;
      g_player_object->hdr.ypos = (uVar6 >> 5) & 7;
      if (((uVar10 == 0) && (uVar5 == 0)) || (((int)DAT_00204884 >> 3) + -8 <= (int)DAT_00202c30)) {
        uVar1 = g_player_object->hdr.position_word;
        bVar2 = (byte)uVar1;
        g_player_object->hdr.zpos = (byte)DAT_00202c30 & 0x7f;
        DAT_00204884 = DAT_00202c30 << 3;
      }
      else if (g_fall_accel == 0 && uVar5 == 0) {
        g_fall_accel = -4;
      }
      set_locomotion_state((int)DAT_00202c68,0);
      uVar10 = read_realtime_clock_units();
      uVar5 = g_player_object->goal_word & 0xfff;
      g_player_object->npc_animation_frame = (uVar10 >> 6) & 3;
      saved_scratch = DAT_00202c6c;
      DAT_00202c6c = (byte *)&local_3c;
      local_32 = 1;
      local_33 = DAT_00203303;
      local_34 = (byte)DAT_00203304 & 7;
      iVar7 = (int)(short)local_44;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0x1f;
      }
      local_3c = (undefined2)(iVar7 >> 5);
      iVar7 = (int)(short)local_42;
      if (iVar7 < 0) {
        iVar7 = iVar7 + 0x1f;
      }
      local_3a = (undefined2)(iVar7 >> 5);
      local_38 = g_player_object->hdr.zpos;
      collision_height_envelope(0,0);
      sort_collision_candidates();
      iVar8 = (int)*(char *)(DAT_00202c6c + 0xb);
      iVar7 = (int)(short)*(char *)(DAT_00202c6c + 0xb);
      if (iVar7 < (int)(iVar8 + (uint)*(byte *)((char *)DAT_00202c6c + 0x15))) {
        do {
          uVar11 = (ushort *)resolve_object_link(&DAT_00202c3a + iVar7 * 6);
          /* Was `iVar8 = (int)((ulonglong)uVar11 >> 0x20);` -- a leftover from the original 32-bit
             ARM ABI, where resolve_object_link's caller apparently re-read some other value out of
             r1 right after the call (Ghidra folded it into a fake 64-bit return value, r0:r1). */
          if (uVar11 == 0) break;
          if ((((uw_object_hdr_t *)uVar11)->object_id) == 0x1a0) {
            /* Was followed by `iVar8 = extraout_r1;` -- same bug as the sibling fix just above in
               this function (resolve_object_link's own high-bits carry), but via a different,
               unrelated callee... */
            resolve_skill_gated_unlock_or_use(g_player_object,0,uVar11,0);
          }
          iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
        } while (iVar7 < (int)((uint)*(byte *)((char *)DAT_00202c6c + 0x15) +
                              (int)*(char *)(DAT_00202c6c + 0xb)));
      }
    }
    else {
      if (direction == 0) {
LAB_0003c920:
        uVar4 = 0x80;
        iVar7 = (int)(short)DAT_00201c70;
        goto LAB_0003c940;
      }
      if (direction == 2) {
        uVar10 = 1;
        goto LAB_0003c920;
      }
      if ((DAT_00201c70 & 0x1fff) == 0) {
        DAT_00201c70 = DAT_00201c70 + direction * 0x2000;
      }
      else {
        DAT_00201c70 = (DAT_00201c70 & 0xe000) + (ushort)(0 < direction) * 0x2000;
      }
      g_player_object->hdr.heading = ((ushort)DAT_00201c70 >> 13) & 7;
      uVar10 = g_player_object->hdr.position_word;
      g_player_object->fine_heading = ((ushort)DAT_00201c70 >> 8) & 0x1f;
      saved_scratch = DAT_00202c6c;
    }
    DAT_00202c6c = saved_scratch;
    uVar4 = 1;
  }
  else {
LAB_0003cdf8:
    uVar4 = 0;
  }
  return uVar4;
}
#undef local_3c
#undef local_3a
#undef local_38
#undef local_34
#undef local_33
#undef local_32


// was FUN_00041f34 -- allocate/reset the keybinding + click-region tables.
void input_bindings_init()
{
  DAT_00202890 = ce_malloc(0x12);
  DAT_0020289c = ce_malloc(0xc);
  if ((DAT_00202890 == 0) || (DAT_0020289c == 0)) {
    report_categorized_fatal_error(0x1003);
  }
  DAT_00202898 = 0;
  DAT_0020288c = 0;
  g_keybind_handler_n = 0;       /* keybind table reset -- drop the real-handler side table too */
  g_click_region_handler_n = 0;  /* likewise the click-region handler side table */
  DAT_00202894 = 1;
  DAT_00085a70 = 0xffff;
  *(undefined1 *)(DAT_00085a6c + 6) = 0;
  *(undefined1 *)(DAT_00085a6c + 7) = 0;
}



// was FUN_00041fe4 -- free the keybinding + click-region tables.
void input_bindings_free()
{
  if (DAT_00085a70 != -0x29a) {
    LocalFree(DAT_00202890);
    LocalFree(DAT_0020289c);
    DAT_00085a70 = -0x29a;
  }
}



// was FUN_0004202c -- append a mouse click-region record to DAT_00202890.
/* was undefined4 -- handler fn pointer; see g_click_region_handler */
int register_click_region(int left, int bottom, int right, int top, short arg, short mode_mask, void *handler)
{
  short sVar1;
  int iVar2;
  char *iVar3;
  void *pvVar4;

  iVar2 = (int)DAT_00202898;
  DAT_00202898 = (short)(iVar2 + 1);
  /* real 64-bit handler, indexed by record position (iVar2 == old count) */
  if ((uint)iVar2 < 128) {
    g_click_region_handler[iVar2] = (void (*)(int))handler;
    if (iVar2 + 1 > g_click_region_handler_n) g_click_region_handler_n = iVar2 + 1;
  }
  /* ce_realloc is realloc-shaped and now returns a real pointer; iVar2 was reused here for that
     result even though it's declared int, truncating it (and iVar3, derived from it, and
     DAT_00202890, assigned from it) on this 64-bit host. */
  pvVar4 = ce_realloc(DAT_00202890,((iVar2 + 1) * 0x10000 >> 0x10) * 0x12);
  if (pvVar4 == 0) {
    report_fatal_error_and_exit(0x1005);
  }
  sVar1 = DAT_00202894;
  iVar3 = (char *)((char *)pvVar4 + DAT_00202898 * 0x12);
  DAT_00202890 = pvVar4;
  *(undefined1 *)(iVar3 + -0x12) = (char)DAT_00202894;
  *(char *)(iVar3 + -0x11) = (char)((ushort)sVar1 >> 8);
  DAT_00202894 = DAT_00202894 + 1;
  *(char *)(iVar3 + -8) = (char)arg;
  *(char *)(iVar3 + -0xc) = (char)left;
  *(char *)(iVar3 + -7) = (char)((ushort)arg >> 8);
  *(char *)(iVar3 + -10) = (char)bottom;
  *(char *)(iVar3 + -0x10) = (char)right;
  *(char *)(iVar3 + -6) = (char)mode_mask;
  *(char *)(iVar3 + -0xe) = (char)top;
  *(char *)(iVar3 + -5) = (char)((ushort)mode_mask >> 8);
  /* low 32 bits only (0x12-byte record has no room for a 64-bit pointer);
     kept solely so poll_input_bindings' non-null gate passes -- the real
     call goes through g_click_region_handler. */
  *(char *)(iVar3 + -4) = (char)(uintptr_t)handler;
  *(char *)(iVar3 + -3) = (char)((uintptr_t)handler >> 8);
  *(char *)(iVar3 + -2) = (char)((uintptr_t)handler >> 0x10);
  *(char *)(iVar3 + -1) = (char)((uintptr_t)handler >> 0x18);
  *(char *)(iVar3 + -0xb) = (char)((uint)left >> 8);
  *(char *)(iVar3 + -9) = (char)((uint)bottom >> 8);
  *(char *)(iVar3 + -0xf) = (char)((uint)right >> 8);
  *(char *)(iVar3 + -0xd) = (char)((uint)top >> 8);
  return (int)CONCAT11(*(undefined1 *)(iVar3 + -0x11),*(undefined1 *)(iVar3 + -0x12));
}



// was FUN_00042758 -- look up a pressed key in the DAT_0020289c table
// (keycode + mode-mask match) and invoke its handler.
/* Was `int`, truncating the real pointer poll_input_bindings passes through (its own param_1, e.g.
   DAT_00085a6c). */
void dispatch_key_binding(char *input_state, short key_code)
{
  /* Was `int`; both double as a plain loop index (iVar2 only) and a real pointer into the
     DAT_0020289c keybinding table (iVar1 always, iVar2 once more on the match path just before it
     returns) -- truncating that pointer since DAT_0020289c is a genuine malloc'd 64-bit pointer. */
  char *pcVar1;
  int iVar2;

  iVar2 = 0;
  if (0 < DAT_0020288c) {
    do {
      pcVar1 = (char *)DAT_0020289c + iVar2 * 0xc;
      if (((*(short *)(pcVar1 + 2) == key_code) &&
          ((*(ushort *)(pcVar1 + 6) & *(ushort *)(input_state + 8)) != 0)) &&
          (((uint)iVar2 < 512 && g_keybind_handler[iVar2] != 0)))
      {
        g_keybind_handler[iVar2]((int)*(short *)(pcVar1 + 4));
        return;
      }
      iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    } while (iVar2 < DAT_0020288c);
  }
}


// was FUN_00049818 -- dispatches DAT_00201c84's currently-set "sticky redraw/per-frame" bits
// through the DAT_00085668 per-mode handler table (movement_pacing_handler is mode 0's bit 12, see
// DAT_00085728's own comment)...
void dispatch_sticky_mode_handlers()
{
  short sVar1;
  char cVar2;
  uint uVar3;
  ushort uVar4;
  bool bVar5;

  if (DAT_00201c84 != 0) {
    uVar4 = 1;
    uVar3 = 0;
    sVar1 = DAT_00201b64;
    do {
      if ((DAT_00201c84 & uVar4) != 0) {
        DAT_00201c84 = DAT_00201c84 & ~uVar4;
        /* *8 (real pointer size), see DAT_00085668's comment; *0x10 stays
           -- that's the 16-entries-per-mode count, not a byte stride. */
        if (*(code **)(&DAT_00085668 + (uVar3 + sVar1 * 0x10) * 8) != (code *)0x0) {
          (**(code **)(&DAT_00085668 + (uVar3 + sVar1 * 0x10) * 8))();
          sVar1 = DAT_00201b64;
        }
      }
      uVar4 = uVar4 << 1;
      uVar3 = uVar3 + 1 & 0xffff;
    } while (uVar3 < 0xf);
    DAT_00201c84 = *(ushort *)(&DAT_00085728 + sVar1 * 2) | DAT_00201c84;
    if (DAT_0023bf0c != '\0') {
      cVar2 = DAT_0023bf0c + -1;
      bVar5 = DAT_0023bf0c == '\x01';
      DAT_0023bf0c = cVar2;
      if (bVar5) {
        reset_cursor_confine_rect();
      }
    }
  }
}


// was FUN_00057888
int poll_mouse_event()
{
  short sVar1;

  update_mouse_state();
  if (DAT_00086968 == -1) {
    DAT_0020484c = 0;
    sVar1 = poll_mouse_button_flags();
  }
  else {
    sVar1 = poll_mouse_button_flags();
    if (sVar1 == 0) {
      DAT_0020484c = 1;
      sVar1 = DAT_00086968;
    }
    DAT_00086968 = -1;
  }
  DAT_00204850 = sVar1;
  if (sVar1 == 0) {
    sVar1 = -1;
  }
  return (int)sVar1;
}

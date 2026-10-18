/* Top-level program flow: WinMain's real body (window/subsystem init and the OS message pump) and
   the title/main menu loop. Split out of uw.c (the original monolithic decompile) once these
   functions' real roles were confirmed. */
#include "headers/mouselook.h"
#include "headers/game.h"
#include "headers/options.h"
#include "headers/debug.h"
#include "headers/unit_test_hooks.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#define DAT_00201b70 DAT_00201b70_backing[0]
// was DAT_0024af74. Nonzero: draw_text_string colors glyph pixels via the palette index
// *g_draw_color_index; zero (the default -- nothing else in this decompile ever sets it) uses the
// flat g_text_flat_color instead.
int g_text_use_palette_color;
static int DAT_0023c5b0;
// was DAT_0008429c_backing/DAT_0008429c. Current draw-color palette index, written before nearly
// every text/UI draw call across the file and read back by draw_text_string (when
// g_text_use_palette_color is set) and various fill/blit routines.
static byte g_draw_color_index_backing[128];
byte *g_draw_color_index = g_draw_color_index_backing;
/* DAT_000879b0/DAT_000890a4 (the active font's 12-byte header and its glyph-bitmap data, both
   filled in by select_active_font's file reads) were plain uninitialized pointers -- no allocation
   anywhere in this file... */
static char DAT_000879b0_backing[12];
char *DAT_000879b0 = DAT_000879b0_backing;
static char DAT_000890a4_backing[0x1080];
char *DAT_000890a4 = DAT_000890a4_backing;
byte *DAT_0024af78;
byte *DAT_0024af7c;
char *DAT_0023cca0;
/* Not `static` -- also used by game.c (app_main_loop, main_menu_loop); see the extern declaration
   and DAT_0023cca8 macro alias in uw.h. */
undefined1 DAT_0023cca8_backing[1024];
static undefined1 DAT_00084298_backing[128];
undefined1 *DAT_00084298 = DAT_00084298_backing;
/* Was `undefined4` despite being assigned a real malloc'd pointer (`DAT_00248410 = DAT_0023c44c;`,
   itself `ce_malloc(0x4cce)`'s result) -- truncating on this 64-bit host and feeding a garbage
   pointer to ce_memset/ce_memmove. */
char *DAT_00248410;
int DAT_00201c98;
static char s__DATA_pres1_byt_00085790[] = "\\DATA\\pres1.byt";
undefined4 DAT_0023c540;
static char s__DATA_lev_ark_00085734[] = "\\DATA\\lev.ark";
/* Ghidra rendered the embedded spaces as underscores and truncated the string partway through
   (dropped "ame.$"). */
static char s_Not_enough_disk_space_for_save_g_00085744[] = "Not enough disk space for save game.$";
static char s__DATA_COPYRIGHT_BYT_0008576c[] = "\\DATA\\COPYRIGHT.BYT";
static char s__DATA_pres2_byt_00085780[] = "\\DATA\\pres2.byt";
/* Not `static` -- also used by game.c (app_main_loop, main_menu_loop); see the extern declaration
   and DAT_000857a0 macro alias in uw.h. */
undefined1 DAT_000857a0_backing[16] = "\\SAVE0";
static undefined2 DAT_00201b6c;
/* Per-(redraw-mode, dirty-bit) handler dispatch table read by
   dispatch_sticky_mode_handlers/enter_dungeon_view/handle_player_death_and_menu_transition/change_game_mode... */
void (*const DAT_00085668_real_table[48])(void) = {
  /* mode 0 (in-game/dungeon view) */
  /* Original bit 1 is the 0x3c190 thunk to render_dungeon_frame_timed
     (0x5bbe0); picture dismissal requests this bit via FUN_00049924(2). */
  (void(*)(void))enter_dungeon_view, (void(*)(void))render_dungeon_frame_timed, 0, (void(*)(void))dungeon_view_anim_tick,
  0, 0, 0, 0,
  0, (void(*)(void))refresh_equipment_display_if_visible, (void(*)(void))handle_game_victory_sequence, (void(*)(void))movement_pacing_handler,
  (void(*)(void))sync_player_stats_to_hud, (void(*)(void))hud_panel_redraw_dispatch, 0, 0 /* Hack - Disabled: mode-exit handler, unrecovered */,
  /* mode 1 */
  0, (void(*)(void))enter_automap_screen, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0 /* Hack - Disabled: ambient sound cycling */, 0, 0, (void(*)(void))exit_automap_screen,
  /* mode 2 */
  (void(*)(void))enter_conversation_mode_screen, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, (void(*)(void))exit_talk_mode,
};
undefined2 DAT_000868d8;
/* All seven of these DOS-era error strings were mangled by Ghidra: embedded spaces rendered as
   underscores, and several truncated partway through (dropped trailing "\r\n$"/"or.$"/"...Error
   code XXXX.\r\n$" text). */
static char s_Error_code_XXXX___000857c8[] = " Error code XXXX\r\n$";
static char s_Out_of_Low_Memory___000857dc[] = "Out of Low Memory.$";
static char s_Out_of_EMS_Memory___000857f0[] = "Out of EMS Memory.$";
static char s_Could_not_read_data___00085804[] = "Could not read data.$";
static char s_Could_not_write_data___0008581c[] = "Could not write data.$";
static char s_Resource_problem_or_internal_err_00085834[] = "Resource problem or internal error.$";
static char s_Underworld_can_no_longer_run__Er_0008585c[] = "Underworld can no longer run.  Error code XXXX.\r\n$";
/* Sizing-audit pass: fatal-error message buffer, written via ce_strncpy from either a 42-byte stack
   buffer (report_fatal_error_ and_exit) or an unbounded caller string (report_fatal_error_
   message_and_exit)... */
static undefined DAT_00201b70_backing[64];
/* Sizing-audit pass: shutdown_game_resources's own teardown loop is a
   HARD exact `iVar1 = 0x80` (128) count. Down from 256. */
void *DAT_00202308_arr[128];
/* Per-geometry-record decoded-sprite pixel buffers, one malloc per visible object, freed each frame
   by free_frame_geometry_buffers. Ghidra typed it `undefined4` (4 bytes), truncating the 64-bit
   ce_malloc pointer -- the memcpy into it (ce_memmove) would fault. */
void *DAT_0023c7a0_arr[0x140];
static undefined2 DAT_0020272c;
static undefined2 DAT_0024fa1c;
static char DAT_00085988;
char DAT_0024d000;
char DAT_0024fa28;
/* Was `static undefined DAT_000859ac_backing[8192]` -- Ghidra never recognized this as a string
   reference (no cross-reference to label it), but the raw bytes at this address in the real binary
   spell out "optb\0" plainly -- confirmed via direct memory dump... */
static char s_optb_000859ac[] = "optb";
static char s_scrledge_000859b4[] = "scrledge";
static char s_spells_000859c0[] = "spells";
static char s_chains_000859c8[] = "chains";
/* Was `static undefined DAT_000859d0_backing[8192]` -- real bytes
   spell "eyes\0", matching EYES.GR. See s_optb_000859ac's comment. */
static char s_eyes_000859d0[] = "eyes";
static char s_power_000859d8[] = "power";
/* Was `static undefined DAT_000859e0_backing[8192]` -- real bytes
   spell "inv\0", matching INV.GR. See s_optb_000859ac's comment. */
static char s_inv_000859e0[] = "inv";
static char s_dragons_000859e4[] = "dragons";
static char s_compass_000859ec[] = "compass";
static char s_flasks_000859f4[] = "flasks";
static char s_tmobj_00085a04[] = "tmobj";
static char s_tmflat_00085a0c[] = "tmflat";
static char s_3dwin_00085a14[] = "3dwin";
static char s_cursors_00085a1c[] = "cursors";
static char s_buttons_00085a24[] = "buttons";
static char s_animo_00085a2c[] = "animo";
static char s_objects_00085a34[] = "objects";
static char s_views_00085a3c[] = "views";
static char s_question_00085a44[] = "question";
static char s__DATA_allpals_dat_00085a50[] = "\\DATA\\allpals.dat";
ushort DAT_0023c448;
static ushort DAT_000876bc_backing[128];
ushort *DAT_000876bc = DAT_000876bc_backing;
static short DAT_000876c0_backing[128];
short *DAT_000876c0 = DAT_000876c0_backing;

/* ARM 0x28bfc is simply `cpy pc, lr`: Escape has no keybinding action. */
static void FUN_00028bfc(void)
{
  return;
}
static char s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08[] = "Lev %d @ %2.2u.%1.1u %2.2u.%1.1u %2.2x %2.2x \n";
static byte DAT_0023bd84;
#define DAT_00086e05 DAT_00086e00_backing[5]
#define DAT_00086e06 DAT_00086e00_backing[6]

/* Original version string; help replaces its terminator with a newline. */
static char DAT_00086e00_backing[8] = "F1.87";
#define DAT_00086e00 DAT_00086e00_backing[0]
static void *DAT_000db500;  /* spectate target object (never assigned in this decompile) */
short DAT_0024af6c;
/* Was `int` despite holding a real stack address (main_menu_loop:
   `DAT_0023bf6c = local_82c;`) used in pointer arithmetic throughout
   this file -- truncating on this 64-bit host. */
static char *DAT_0023bf6c;
static ushort DAT_0023bf74;
/* populate_menu_button_bitmap_entry (main menu button record populator) used to split each loaded
   button bitmap's real pointer into 4 bytes and pack it directly into DAT_0023bf6c's record array
   -- fine for a 32-bit pointer on the original binary... */
static char *g_menu_button_bitmaps[16];
static char s__DATA_CREDIT3_BYT_00086ea8[] = "\\DATA\\CREDIT3.BYT";
static char s__DATA_CREDIT2_BYT_00086ebc[] = "\\DATA\\CREDIT2.BYT";
static char s__DATA_CREDIT1_BYT_00086ed0[] = "\\DATA\\CREDIT1.BYT";
static char s_opbtn_00086ee4[] = "opbtn";
static char s__DATA_opscr_byt_00086eec[] = "\\DATA\\opscr.byt";
/* Was `int` despite holding a real malloc'd pointer (main_menu_loop: `DAT_0023bf70 = iVar4;` where
   iVar4 = ce_malloc(0x10000)), used in pointer arithmetic (`iVar9 + DAT_0023bf70`) -- truncating on
   this 64-bit host. */
static char *DAT_0023bf70;
/* Same fix as DAT_00248410 above -- see its comment. */
char *DAT_0023cca4;
// was DAT_0023c210 -- the current frame's raw .GR entry pointer (see g_weapon_swing_raw_frames),
// set by weapon_swing_draw_tick right before decoding it...
char *g_weapon_swing_current_frame;
/* was DAT_0023c214, `int`-typed in both its own uw.h extern declaration and here -- app_main_loop
   (game.c) assigns it a real 64000-byte ce_malloc allocation (the same one it hands
   g_weapon_swing_current_frame right beside it, before per-frame use overwrites that one)... */
static char *g_weapon_swing_startup_scratch_buffer;
/* Sizing-audit pass: a third sibling of DAT_0023cca8/DAT_0023c698 (same registry-install-dir-lookup
   pattern, right above/at line 1889/1891) -- written from the same 520-byte (0x208) stack buffer
   (auStack_228) as those two, which were already sized to 1024 for this exact reason. */
undefined1 DAT_00241f08_backing[1024];
static undefined2 DAT_0023c59e;
static undefined2 DAT_0023c5a0;
static char *DAT_0023c44c;
static char *DAT_0023cef0;
/* Same fix as DAT_00248410 above -- see its comment. */
static char *DAT_0024ad58;
int DAT_000876c8;
int DAT_0024af60;
undefined4 DAT_0023c648;
static unsigned short u_UltimaUW_00087678[] = u"UltimaUW";
static unsigned short u_Ultima_Under_World_00087690[] = u"Ultima_Under_World";
static unsigned short u_Software_Apps_ZIO_Interactive_Ul_000877a4[] = u"Software\\Apps\\ZIO_Interactive_Ul";
static char s__Program_Files_ZIO_Interactive_U_00087804[] = "\\Program Files\\ZIO Interactive\\Ultima Underworld";
static unsigned short u_InstlDir_00087838[] = u"InstlDir";
static unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008784c[] = u"Software\\Apps\\ZIO_Interactive_Ul";
static unsigned short u_HP_Jornada_540_000876cc[] = u"HP,Jornada_540";
static char s__Program_Files_ZIO_Interactive_U_000876ec[] = "\\Program Files\\ZIO Interactive\\Ultima(Voice)";
static unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008771c[] = u"Software\\Apps\\ZIO_Interactive_Ul";
static char s__Program_Files_ZIO_Interactive_U_00087774[] = "\\Program Files\\ZIO Interactive\\Ultima(CutScene)";
// DAT_000830b0 and UNK_000830b4 are the same {int msg_id; void *handler;} 8-byte-stride table
// (dispatch_window_message walks msg_id entries from &DAT_000830b0 via an `int*`, and reads the
// matching handler from UNK_000830b4 + index*8 -- exactly DAT_000830b0's own address + 4)...
/* Recovered ARM window handlers (0x778f4/0x779f0/0x77a10/0x77a30).
   The focus handlers call the GAPI suspend/resume imports; create/activate return 0. */
static int FUN_000778f4(void)
{
  return 0;
}
static int FUN_000779f0(void)
{
  GXSuspend();
  return 0;
}
static int FUN_00077a10(void)
{
  GXResume();
  return 0;
}
static int FUN_00077a30(void)
{
  return 0;
}
/* UU.exe .rdata 0x830b0: native pointers replace the original 32-bit ARM addresses.
   Keep the legacy callback declarations: each handler consumes its own subset of
   the window procedure's four register arguments. */
struct uw_window_message_handler {
  uint message;
  int (*handler)();
};
static const struct uw_window_message_handler DAT_000830b0[] = {
  {0x001, FUN_000778f4}, {0x00f, blit_framebuffer_to_gx_display},
  {0x008, FUN_000779f0}, {0x007, FUN_00077a10},
  {0x006, FUN_00077a30}, {0x002, shutdown_game_resources},
  {0x100, handle_keyboard_message}, {0x101, handle_keyboard_message},
  {0x102, handle_keyboard_message}, {0x103, handle_keyboard_message},
  {0x106, handle_keyboard_message}, {0x107, handle_keyboard_message},
  {0x104, handle_keyboard_message}, {0x105, handle_keyboard_message},
  {0x201, handle_mouse_message}, {0x204, handle_mouse_message},
  {0x202, handle_mouse_message}, {0x205, handle_mouse_message},
  {0x200, handle_mouse_message},
};



// WinMain's real body: single-instance mutex check, window class/window creation, framebuffer + subsystem init, shows the main menu once, then runs the PeekMessage/Translate/Dispatch message pump until quit.
// was FUN_00077004
int app_main_loop(int instance, int prev_instance, int command_line, int show_command)
{
  uint uVar1;
  int iVar2;
  void *uVar3;
  undefined4 *puVar4;
  undefined1 auStack_40 [4];
  int local_3c;
  undefined4 local_38;

  uVar1 = FindWindowW(u_UltimaUW_00087678,u_Ultima_Under_World_00087690);
  if (uVar1 == 0) {
    DAT_0023c59e = 0;
    DAT_0023c5a0 = 0;
    DAT_0023c540 = instance;
    spawn_message_dispatch_thread(instance,u_UltimaUW_00087678);
    iVar2 = create_main_window_and_init_display(instance,show_command);
    if (iVar2 != 0) {
      uVar3 = ce_malloc(0x25800);
      /* was a CONCAT22 pair split across _DAT_0023c5ac/DAT_0023c5b0 --
         see g_uw_framebuffer's declaration comment. */
      g_uw_framebuffer = uVar3;
      uVar3 = ce_malloc(0x25800);
      load_bmp_resource_to_rgb565(instance,0xca,uVar3);
      dirty_rect_union(0,0xf0,0,0x140);
      ce_memmove(g_uw_framebuffer,uVar3,0x25800);
      flush_dirty_rect_to_display_240();
      Sleep(2000);
      LocalFree(uVar3);
      build_rgb565_palette(0,-1);
      build_shade_lut();
      DAT_0023c44c = ce_malloc(0x4cce);
      DAT_0023cca0 = ce_malloc(64000);
      DAT_0023cef0 = ce_malloc(0x7fff);
      ce_memset(DAT_0023c44c,0,0x4cce);
      /* DAT_0023c7a0 is now a real void*[] (widened from Ghidra's
         `undefined4`); zero it as one so the whole 8-byte slots clear. */
      for (iVar2 = 0; iVar2 < 0x140; iVar2++) {
        DAT_0023c7a0_arr[iVar2] = 0;
      }
      (void)puVar4;
      ce_memset(DAT_0023cca0,0,64000);
      ce_memset(DAT_0023cef0,0,0x7fff);
      DAT_0023cca4 = DAT_0023c44c;
      DAT_0024ad58 = DAT_0023c44c;
      DAT_00248410 = DAT_0023c44c;
      DAT_0024af78 = ce_malloc(0x1800);
      ce_memset(DAT_0024af78,0,0x1800);
      DAT_0024af7c = ce_malloc(0x1800);
      ce_memset(DAT_0024af7c,0,0x1800);
      DAT_000879b0 = ce_malloc(0xc);
      DAT_000890a4 = ce_malloc(0x1080);
      g_weapon_swing_current_frame = ce_malloc(64000);
      ce_memset(g_weapon_swing_current_frame,0,64000);
      g_weapon_swing_startup_scratch_buffer = g_weapon_swing_current_frame;
      *DAT_000876bc = 0;
      *DAT_000876c0 = 0;
      compute_dimension_volume();
      run_game_startup_sequence();
      build_trig_tables();
      if (uw_test_game_active()) {
        /* Unit-test harness: no intro, no title menu -- straight into a fresh game. */
        if (!start_headless_new_game()) {
          return 0;
        }
        begin_gameplay();
        uw_test_hook_on_game_start();
      }
      else {
        wait_and_show_intro_page();
        main_menu_loop(1);
      }
      DAT_00201c98 = 1;
      while (DAT_00201b6c != 0) {
        uw_test_hook_pre_game_tick();
        if (DAT_000876c8 == 0) {
          /* Was gated on `(DAT_0024af60 == 0) || ...` -- DAT_0024af60 was always 1 throughout this
             loop (set once at session start, never cleared in practice; see its init comment
             below)... */
          if (100 < DAT_0024af6c) {
            if (DAT_0024af6c < 0x33) {
              DAT_0024af6c = (short)((int)DAT_0024af6c << 1);
            }
          }
          else {
            DAT_0024af6c = (short)((int)DAT_0024af6c << 2);
          }
        }
        else {
          DAT_0023c648 = read_realtime_clock_units();
          DAT_0023c448 = 0;
        }
        {
          iVar2 = PeekMessageW(auStack_40,0,0,0,1);
          if (iVar2 != 0) {
            if (local_3c == 0x12) break;
            TranslateMessage(auStack_40);
            DispatchMessageW(auStack_40);
          }
          main_loop_hud_flush();
        }
        uw_test_hook_post_game_tick();
      }
      uw_test_hook_on_game_exit();
      iVar2 = window_message_noop_handler(instance,local_38);
      return iVar2;
    }
  }
  else {
    SetForegroundWindow(uVar1 | 1);
  }
  return 0;
}



// Title/main menu loop: builds the menu layout, dispatches on the selected option (0=continue?, 1=new game -> character_generator_loop, 2=show CREDIT1/2/3.BYT credits screens, 3=load a saved game), looping back to the menu until a game session actually starts.
// was FUN_0006a3d8
void main_menu_loop(int is_first_entry)
{
  /* stack0xffdc2b6c/2c74/2d7c are leftover placeholder scalars (from an early undeclared-identifier
     fix pass) that separate "copy the install-dir base path" loops below used as
     `pcVar5[(int)&placeholder] = cVar1;`... */
  char *pcVar_dst;
  unsigned int stack0xffdc2b6c;
  unsigned int stack0xffdc2c74;
  unsigned int stack0xffdc2d7c;
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  int iVar4;
  char *pcVar5;
  int iVar6;
  void *uVar7;
  undefined2 uVar8;
  int iVar9;
  int iVar10;
  bool bVar11;
  short local_83c [2];
  int local_838;
  /* Was `int`, holds the same ce_malloc(0x10000) pointer as
     DAT_0023bf70 (see its comment), passed to LocalFree (free) --
     truncating on this 64-bit host. */
  void *local_834;
  /* iVar4 is reused throughout this function for unrelated numeric work (timers, loop indices,
     etc.) after its brief life holding that same ce_malloc(0x10000) pointer -- pvVar_buf10000 takes
     over only that pointer-holding span instead of retyping iVar4 itself... */
  void *pvVar_buf10000;
  /* Declared as a lone 4-byte scalar, but `&local_82c` is handed to DAT_0023bf6c and then read back
     through draw_menu_item_list/menu_button_list_navigate as an array of up to 4 (is_first_entry)
     0x10-byte-stride records (plus an overlapping 4-byte-stride array access)... */
  char local_82c [256];
  char acStack_7ec [264];
  undefined1 auStack_4d4 [160];
  
  /* local_82c is now a real array (see its declaration) -- zero the whole thing rather than just
     its first 4 bytes, since it's read back as a multi-record table. */
  ce_memset(local_82c,0,sizeof(local_82c));
  /* Record 0 (button 0): bitmap-ptr slots (offsets 0/4) are now unused -- see g_menu_button_bitmaps
     -- X/Y at 8/0xa, W/H placeholders (overwritten by populate_menu_button_bitmap_entry once the
     real bitmap loads) at 0xc/0xe. */
  *(short *)(local_82c + 8) = 0x62;
  *(short *)(local_82c + 0xa) = 0x52;
  *(short *)(local_82c + 0xc) = 1;
  *(short *)(local_82c + 0xe) = 1;
  /* Record 1 (button 1), same layout at +0x10. */
  *(short *)(local_82c + 0x18) = 0x51;
  *(short *)(local_82c + 0x1a) = 0x69;
  *(short *)(local_82c + 0x1c) = 1;
  *(short *)(local_82c + 0x1e) = 1;
  /* Record 2 (button 2), same layout at +0x20. */
  *(short *)(local_82c + 0x28) = 0x48;
  *(short *)(local_82c + 0x2a) = 0x81;
  *(short *)(local_82c + 0x2c) = 1;
  *(short *)(local_82c + 0x2e) = 1;
  /* Record 3 (button 3), same layout at +0x30. */
  *(short *)(local_82c + 0x38) = 0x55;
  *(short *)(local_82c + 0x3a) = 0x9a;
  *(short *)(local_82c + 0x3c) = 1;
  *(short *)(local_82c + 0x3e) = 1;
  dirty_rect_union(0,200,0,0x140);
  DAT_0023bf6c = local_82c;
  probe_save_slots(auStack_4d4,local_83c);
  uVar8 = 3;
  if (local_83c[0] != 0) {
    uVar8 = 4;
  }
  uVar2 = 1;
  if (local_83c[0] != 0) {
    uVar2 = 3;
  }
  update_journey_onward_availability(is_first_entry);
  push_cursor_icon(0x106c);
  cursor_show_idle_tick();
  bVar11 = false;
  local_838 = 0;
  do {
    iVar4 = local_838;
    advance_menu_music_track();
    if ((iVar4 < 4) && (-1 < iVar4)) {
      pvVar_buf10000 = ce_malloc(0x10000);
      DAT_0023bf70 = pvVar_buf10000;
      local_834 = pvVar_buf10000;
      ce_memset(acStack_7ec,0,0x104);
      pcVar5 = &DAT_0023cca8;
      pcVar_dst = acStack_7ec;
      do {
        cVar1 = *pcVar5;
        *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_7ec,s__DATA_opscr_byt_00086eec);
      read_buffer_from_file(acStack_7ec,pvVar_buf10000,64000);
      decrement_cursor_hide_depth();
      // HACK: deviation from the real binary -- was load_pals_bank(2, temp_buf),
      /* confirmed via ARM disassembly of the original UU.exe (main_menu_loop == FUN_0006a3d8, calls
         load_pals_bank directly at both its own palette-load points, never through
         set_palette_bank). */
      set_palette_bank(2);
      iVar10 = 0;
      do {
        iVar6 = 0;
        do {
          iVar9 = iVar10 * 0x140 + iVar6;
          *(undefined2 *)((g_uw_framebuffer) + iVar9 * 2) =
               (&g_palette_rgb565)[*(byte *)(iVar9 + DAT_0023bf70)];
          iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        } while (iVar6 < 0x140);
        iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
      } while (iVar10 < 200);
      cursor_show_idle_tick();
      if ((DAT_0023bf70 == 0) ||
         /* Was a literal 0 here (an earlier fix pass believed this mirrored sibling call sites like
            decode_gr_entry_to_buffer's genuine "no postprocessing needed" case)... */
         (iVar10 = load_gr_resource_entries(s_opbtn_00086ee4,0,-1,&opbtn_gr_bump_alloc_entry,&populate_menu_button_bitmap_entry), iVar10 == 0)) {
        report_fatal_error_and_exit(0x300d);
      }
      if (local_838 != 3) {
        draw_menu_item_list(uVar8,DAT_0023bf6c,0,uVar2);
        // HACK: same DAT_00088d98-sync deviation as this function's other
        // palette-load point above -- see that comment.
        set_palette_bank(2);
        fade_in(g_uw_framebuffer,0,0);
      }
    }
    sVar3 = menu_button_list_navigate(uVar8,DAT_0023bf6c,0,uVar2);
    local_838 = (int)sVar3;
    if (local_838 == -1) {
      run_game_shutdown_sequence(0);
      terminate_process(1);
    }
    else if (local_838 == 0) {
      display_book_or_scroll_page(0);
    }
    else if (local_838 == 1) {
      g_text_use_palette_color = 1;
      fade_out(g_uw_framebuffer,0,0);
      /* Extracted (unit-testing-framework merge) into prepare_new_game,
         src/game.c -- see its own comment; this used to be the entire
         chargen->\SAVE0\lev.ark-seeding sequence inlined here. */
      bVar11 = prepare_new_game();
      g_text_use_palette_color = 0;
    }
    else if (local_838 == 2) {
      iVar4 = read_realtime_clock_units();
      do {
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_CREDIT1_BYT_00086ed0);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = read_realtime_clock_units();
      do {
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_CREDIT2_BYT_00086ebc);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      iVar4 = read_realtime_clock_units();
      do {
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_CREDIT3_BYT_00086ea8);
        blit_fullscreen_bitmap_file(2,acStack_7ec,1);
        iVar10 = read_realtime_clock_units();
        sVar3 = next_input_event();
      } while ((sVar3 < 0) && (iVar10 - iVar4 < 0x2ee));
      set_pending_update_flags(0x7ffe);
    }
    else if (local_838 == 3) {
      sVar3 = journey_onward_load_slot_menu();
      bVar11 = sVar3 == 1;
      if (sVar3 == -1) {
        uVar7 = get_message_string(0x2a9);
        ce_memset(acStack_7ec,0,0x104);
        pcVar5 = &DAT_0023cca8;
        pcVar_dst = acStack_7ec;
        do {
          cVar1 = *pcVar5;
          *pcVar_dst = cVar1; pcVar_dst = pcVar_dst + 1;
          pcVar5 = pcVar5 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_7ec,s__DATA_opscr_byt_00086eec);
        blit_fullscreen_bitmap_file(0xffffffff,acStack_7ec,1);
        select_active_font(s_FONTBIG_SYS_00085454);
        *g_draw_color_index = 0xa2;
        *DAT_00084298 = 0xa2;
        sVar3 = measure_text_width(uVar7);
        iVar4 = (int)sVar3;
        if (iVar4 < 0) {
          iVar4 = iVar4 + 1;
        }
        draw_text_string(uVar7,0xa0 - (short)(iVar4 >> 1),0x5a);
        cursor_show_idle_tick();
        while (sVar3 = next_input_event(), sVar3 < 0) {
          animate_title_palette_cycle();
        }
        select_active_font(s_FONT5X6P_SYS_00084e9c);
      }
      else if (bVar11) {
        unready_weapon();
      }
    }
    LocalFree(local_834);
  } while (!bVar11);
  begin_gameplay();
}



// was FUN_00066c90 -- closes the backpack container UI and clears the player's transient
// inventory-view state before a level transition (reset_player_for_resurrection, a
// resurrect/reset-position path) or a fresh level load (load_level)...
void close_panels_before_level_change()

{
  close_backpack_container();
  free_player_inventory_chain((char *)g_player_object + 6);
  reset_equipment_and_container_state();
  return;
}



// was FUN_00066cb4 -- clears the full mobile record, sets the player's fixed
// item ID, and restores the original status value. Bits 4-7 in that status
// value remain unnamed; preserve the complete initial word.
void reset_player_object_record()

{
  ce_memset(g_player_object, 0, sizeof(*g_player_object));
  g_player_object->hdr.object_id = 0x7f;
  g_player_object->status_word = 0x00fd;
  return;
}



// was FUN_00066e90 -- one-time gameplay session setup: initializes player/camera/movement state
// (starting level 1, facing, locomotion mode), the player object record
// (reset_player_object_record)...
void init_gameplay_session()

{
  int iVar1;

  /* DAT_002029cc is set once, early (init_level_object_arena/reset_level_object_arena: a real
     malloc'd pointer via ce_malloc), and DAT_002046b8/DAT_002046c4 are derived from it and never
     touched again. */
  if ((uintptr_t)DAT_002029cc < 0x10000) {
    return;
  }
  DAT_0023b82c = DAT_002046b8 + 0x1b;
  DAT_00202080 = 0xffff;
  DAT_00201c78 = 0;
  DAT_00201c70 = 0;
  DAT_0023beb4 = 0;
  DAT_0023beb8 = 0;
  /* Caps-Lock state (toggled by VK 0x14 in handle_keyboard_message). */
  DAT_0024af60 = 0;
  DAT_00201b68 = 1;
  DAT_002048a7 = 8;
  DAT_002048a3 = 1;
  DAT_002048a4 = 0;
  DAT_002048b8 = check_and_reset_landing_state;
  DAT_002048b2 = 0x1100;
  DAT_002048b0 = 0;
  g_player_object = (uw_mobile_object_t *)(ushort *)DAT_0023b82c;
  load_shading_level_config(0);
  DAT_0023be8c = 0;
  DAT_00086df8 = &DAT_0023bca8;
  /* HACK, same silently-zero class as DAT_0024af60 above and DAT_00086e68 / DAT_0008589c elsewhere
     in this file: g_npc_tick_enabled is read exactly once in this whole file... */
  g_npc_tick_enabled = 1;
  /* HACK, same silently-zero class as g_npc_tick_enabled just above: DAT_000879ac gates all three
     per-tick call sites of scheduler_tick... */
  DAT_000879ac = 1;
  reset_player_object_record();
  iVar1 = (g_player_object->hdr.object_id & 0x3f) * 0x30;
  DAT_0023be74 = &DAT_001007d0 + iVar1;
  ((ushort *)g_player_object)[8] = g_monster_type_props[(iVar1) / 0x30].max_hp;
  if (DAT_00201c74 == 0) {
    DAT_00201c74 = register_interned_string(DAT_00086df8,0x7d);
  }
  register_key_binding(0x3f,0xe,1,move_command_dispatch);
  register_key_binding(0x8d,5,1,move_command_dispatch);
  register_key_binding(0x8f,3,1,move_command_dispatch);
  register_key_binding(0x91,4,1,move_command_dispatch);
  register_key_binding(0x3f,0xe,1,move_command_dispatch);
  register_key_binding(0x8d,5,1,move_command_dispatch);
  register_key_binding(0x8f,3,1,move_command_dispatch);
  register_key_binding(0x91,4,1,move_command_dispatch);
  /* Z / C strafe. */
  register_key_binding(0x5a,9,1,move_command_dispatch);
  register_key_binding(0x43,10,1,move_command_dispatch);
  register_key_binding(0x7a,9,1,move_command_dispatch);
  register_key_binding(0x63,10,1,move_command_dispatch);
  /* Sidestep: the DOS "," / "." strafe keys. decode_movement_command already turns input codes 0x2c
     / 0x2e into g_movement_mode 9 / 10 (resolve_move_vector cases 9/10 = move at heading -/+ 90
     degrees, facing unchanged), but nothing routed those codes here... */
  register_key_binding(0x2c,9,1,move_command_dispatch);
  register_key_binding(0x2e,10,1,move_command_dispatch);
  register_key_binding(0x93,8,1,move_command_dispatch);
  register_key_binding(0x6c,0xc,0x1b,move_command_dispatch);
  register_key_binding(0x6b,0xd,0x1b,move_command_dispatch);
  register_key_binding(0x41,0xffffffff,1,move_key_directional_step);
  register_key_binding(0x44,1,1,move_key_directional_step);
  register_key_binding(0x53,0,1,move_key_directional_step);
  register_key_binding(0x58,0xfffffffe,1,move_key_directional_step);
  register_key_binding(0x57,2,1,move_key_directional_step);
  /* Lowercase duplicates of A/D/S/X/W above -- see DAT_0024af60's init comment. Safe to add
     unconditionally: unlike 'j'/'J' (0x6a/0x4a, registered a few lines down as two deliberately
     DIFFERENT actions), none of these five lowercase codes are bound to anything else. */
  register_key_binding(0x61,0xffffffff,1,move_key_directional_step);
  register_key_binding(0x64,1,1,move_key_directional_step);
  register_key_binding(0x73,0,1,move_key_directional_step);
  register_key_binding(0x78,0xfffffffe,1,move_key_directional_step);
  register_key_binding(0x77,2,1,move_key_directional_step);
  register_click_region(0x6b,0xa7,0x7b,0x99,0xffff,1,move_key_directional_step);
  register_click_region(0x82,0xa9,0x92,0x9c,0,1,move_key_directional_step);
  register_click_region(0x9b,0xa7,0xaa,0x99,1,1,move_key_directional_step);
  register_key_binding(0x33,1,0x11,&debug_adjust_view_heading);
  register_key_binding(0x31,0xffffffff,0x11,&debug_adjust_view_heading);
  register_key_binding(0x32,0,0x11,&debug_adjust_view_heading);
  register_key_binding(0x6a,7,0x1b,move_command_dispatch);
  register_key_binding(0x4a,6,0x1b,move_command_dispatch);
  /* Quality-of-life desktop keys (not in the original): F toggles mouselook, E uses / picks up the
     object under the cursor, Q looks at it. */
  register_key_binding(0x46,0,0x1b,uw_toggle_mouselook);
  register_key_binding(0x66,0,0x1b,uw_toggle_mouselook);
  register_key_binding(0x49,0,0x1b,uw_fullscreen_toggle_panel);
  register_key_binding(0x69,0,0x1b,uw_fullscreen_toggle_panel);
  register_key_binding(0x47,0,0x1b,uw_toggle_fullscreen_view);
  register_key_binding(0x67,0,0x1b,uw_toggle_fullscreen_view);
  register_key_binding(0x45,0,0x1b,quick_use_object_at_cursor);
  register_key_binding(0x65,0,0x1b,quick_use_object_at_cursor);
  register_key_binding(0x51,0,0x1b,quick_look_at_cursor);
  register_key_binding(0x71,0,0x1b,quick_look_at_cursor);
  register_key_binding(0x86,0,0x1b,toggle_stats_panel);
  register_key_binding(0x89,0,0x1b,&debug_force_rest_action);
  register_key_binding(0x88,2,0x1b,&print_debug_stat_message);
  register_key_binding(0x87,1,0x1b,handle_cast_spell_click);
  register_key_binding(0x173,0x173,1,open_pause_menu_via_hotkey);
  register_key_binding(0x172,0x172,1,open_pause_menu_via_hotkey);
  register_key_binding(0x16d,0x16d,1,open_pause_menu_via_hotkey);
  register_key_binding(0x166,0x166,1,open_pause_menu_via_hotkey);
  register_key_binding(0x164,0x164,1,open_pause_menu_via_hotkey);
  register_key_binding(0x171,0x171,1,open_pause_menu_via_hotkey);
  register_key_binding(0x80,5,1,cursor_mode_button_click);
  register_key_binding(0x81,4,1,cursor_mode_button_click);
  register_key_binding(0x82,3,1,cursor_mode_button_click);
  register_key_binding(0x83,2,1,cursor_mode_button_click);
  register_key_binding(0x83,2,4,cursor_mode_button_click);
  register_key_binding(0x84,1,1,cursor_mode_button_click);
  register_key_binding(0x85,0,1,cursor_mode_button_click);
  register_key_binding(0x70,9,1,tick_weapon_swing_state);
  register_key_binding(0x2e,3,1,tick_weapon_swing_state);
  register_key_binding(0x3b,6,1,tick_weapon_swing_state);
  register_key_binding(0x4a3,0x4a3,7,noop_key_handler);
  /* Mask 6, not 7: mode 1 (the 3D view) is left out so the TAB combat toggle below can bind there --
     dispatch_key_binding takes the FIRST matching entry. */
  register_key_binding(9,9,6,noop_key_handler);
  /* Desktop QoL (the TAB noop above excludes mode 1): TAB toggles
     combat (attack) mode -- the attack icon's own handler, button index 1 -- and M opens the
     automap, or closes it again from inside it (like its ESC binding). */
  register_key_binding(9,1,1,cursor_mode_button_click);
  register_key_binding(0x4d,2,1,change_game_mode);
  register_key_binding(0x6d,2,1,change_game_mode);
  register_key_binding(0x4d,1,2,change_game_mode);
  register_key_binding(0x6d,1,2,change_game_mode);
  /* R: rune bag page, V: skills page -- each also closes itself back to the inventory.
     Shift+R (the 'R' character) casts the spell currently set in the rune slots, the same call
     as the 0x87 cast binding. */
  register_key_binding(0x52,1,0x1b,handle_cast_spell_click);
  register_key_binding(0x72,1,1,toggle_hud_panel_page);
  register_key_binding(0x56,2,1,toggle_hud_panel_page);
  register_key_binding(0x76,2,1,toggle_hud_panel_page);
  register_key_binding(0x8d,0x8d,7,noop_key_handler);
  register_key_binding(0x93,0x93,7,noop_key_handler);
  register_key_binding(0x8f,0x8f,7,noop_key_handler);
  register_key_binding(0x91,0x91,7,noop_key_handler);
  register_key_binding(0x8c,0x8c,7,noop_key_handler);
  register_key_binding(0x8e,0x8e,7,noop_key_handler);
  register_key_binding(0x92,0x92,7,noop_key_handler);
  register_key_binding(0x94,0x94,7,noop_key_handler);
  register_key_binding(0x95,0x95,7,noop_key_handler);
  register_key_binding(0x96,0x96,7,noop_key_handler);
  register_key_binding(0x1b,4,4,FUN_00028bfc);
  register_key_binding(0x31,1,4,select_babl_menu_response);
  register_key_binding(0x32,2,4,select_babl_menu_response);
  register_key_binding(0x33,3,4,select_babl_menu_response);
  register_key_binding(0x34,4,4,select_babl_menu_response);
  register_click_region(0x52,0x30,0x88,10,4,4,handle_barter_npc_panel_click);
  register_click_region(0x8b,0x30,0xc1,10,4,4,handle_barter_player_panel_click);
  register_click_region(0xf,200,0x131,0xa9,0,4,select_babl_menu_response);
  register_click_region(8,0x74,0x20,0xfffffffa,0xffff,4,cursor_mode_button_click_restricted);
  register_key_binding(0x286,0,0x1b,print_help_message);
  register_key_binding(0x30,0,0x1b,print_player_position_debug);
  return;
}




// was FUN_00067950 -- formats and prints a "Lev:d X:.. Y:.. Z:.. F:.." style message showing the
// player's current level, tile position, and facing. Registered as the '0' key binding in
// init_gameplay_session -- a debug/cheat "show coordinates" command.
void print_player_position_debug()

{
  int iVar1;
  undefined1 auStack_2c [40];
  
  iVar1 = (int)DAT_00201c70;
  if (iVar1 < 0) {
    iVar1 = iVar1 + 0xff;
  }
  ce_sprintf(auStack_2c,s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08,(int)DAT_00201b68,
              (int)DAT_00204880 >> 8,(int)DAT_00204880 >> 5 & 7,((int)DAT_00204882 << 0x10) >> 0x18,
              ((int)DAT_00204882 << 0x10) >> 0x15 & 7,((int)DAT_00204884 << 0x10) >> 0x13,
              iVar1 >> 8 & 0xffff);
  message_scroll_print_wrapped(auStack_2c);
  return;
}



// was FUN_000679f4 -- prints a help/status message (string id 0x113) built into the DAT_00086e00
// buffer, one-time-initializing a small counter pair (DAT_0023bd84 bit 0 guards it) the first time
// it's shown. Registered as a special key binding in init_gameplay_session.
void print_help_message()

{
  if ((DAT_0023bd84 & 1) == 0) {
    DAT_0023bd84 = DAT_0023bd84 | 1;
    DAT_00086e05 = 10;
    DAT_00086e06 = 0;
  }
  print_scroll_message_by_id(0x113);
  message_scroll_print_wrapped(&DAT_00086e00);
  return;
}



// was FUN_00067a44 -- populates the "look at" override fields (DAT_0023be90/be92/be94/bf00/bf02)
// that update_current_view_from_subject's DAT_0023b82c==0 branch reads: param_1<2 resets to the
// player's own live position (param_1==1 also applies the eye-height offset)...
void set_custom_view_target(short mode)
{
  void *iVar1;
  short sVar2;
  bool bVar3;
  
  bVar3 = mode == 1;
  if (mode < 2) {
    DAT_0023be90 = DAT_00204880;
    sVar2 = 0x4880;
    if (bVar3) {
      sVar2 = DAT_00204884;
    }
    DAT_0023be92 = DAT_00204882;
    if (bVar3) {
      DAT_0023be94 = sVar2 + 0xa4;
    }
    DAT_0023bf00 = DAT_00201c70;
    if (!bVar3) {
      DAT_0023be94 = 0x458;
      DAT_0023bf02 = 0xfc00;
    }
  }
  else if (mode < 0x100) {
    iVar1 = get_object_record_by_slot_index(mode);
    DAT_0023be90 = ((((uw_mobile_object_t *)iVar1)->tile_x << 2)) * 0x40 + ((((uw_object_hdr_t *)iVar1)->xpos << 5));
    DAT_0023be92 = ((((uw_object_hdr_t *)iVar1)->ypos << 2)) * 8 + ((((uw_mobile_object_t *)iVar1)->tile_y << 4)) * 0x10;
    DAT_0023be94 = (((uw_object_hdr_t *)iVar1)->zpos) << 3;
    DAT_0023bf00 = (((uw_object_hdr_t *)iVar1)->position_word & 0xff80) << 6;
  }
  if (DAT_0023b82c == 0) {
    set_pending_update_flags(2);
  }
}




// was FUN_00067b98 -- moves the "custom view target" position (DAT_0023be90/be92, set up by
// set_custom_view_target) based on the live mouse cursor position relative to the game-view rect
// (DAT_0023bd80/be88 from register_game_view_interact_zones)...
/* Far sight's per-step camera deltas were tuned for the original device's slow main loop, and this
   runs once per 60Hz game frame (see handle_game_view_click_hold) -- about this many times faster.
   Each delta is divided down, keeping the remainder so slow movement still accumulates. */
#define FAR_SIGHT_TURN_DIVISOR 5
#define FAR_SIGHT_MOVE_DIVISOR 20

static int far_sight_scale_step(int *remainder, int delta, int divisor)
{
  int total = *remainder + delta;
  int out = total / divisor;
  *remainder = total - out * divisor;
  return out;
}

void move_custom_view_target(int unused)
{
  /* The facing delta wraps mod 0x10000 (0x40 * 0x400), so it is a signed turn -- it must be
     divided as a signed value or a small left turn becomes a large right one. */
  static int rem_facing, rem_x, rem_y;
  short *psVar1;
  short sVar2;
  uint uVar3;
  int iVar4;
  short far_sine;    /* was local_14/cStack_13: angle_to_screen_delta's 2-byte outputs */
  short far_cosine;  /* was local_12/cStack_11 */
  
  psVar1 = DAT_00085a6c;
  sVar2 = ordint_divmod((int)DAT_0023be88,DAT_00085a6c[1] * 3).quot;
  uVar3 = ordint_divmod((int)DAT_0023bd80,*psVar1 * 3).quot;
  iVar4 = (uint)DAT_0023bf00 +
          far_sight_scale_step(&rem_facing, (short)(((uVar3 & 0xffff) + 0x3f) * 0x400), FAR_SIGHT_TURN_DIVISOR);
  DAT_0023bf00 = (ushort)iVar4;
  if (sVar2 != 1) {
    angle_to_screen_delta(iVar4,&far_sine,&far_cosine);
    DAT_0023be90 = far_sight_scale_step(&rem_x, (far_sine >> 8) * (sVar2 + -1), FAR_SIGHT_MOVE_DIVISOR) + DAT_0023be90;
    DAT_0023be92 = far_sight_scale_step(&rem_y, (far_cosine >> 8) * (sVar2 + -1), FAR_SIGHT_MOVE_DIVISOR) + DAT_0023be92;
  }
  if (DAT_0023be90 < 0x180) {
    DAT_0023be90 = 0x180;
  }
  if (0x3d80 < DAT_0023be90) {
    DAT_0023be90 = 0x3d80;
  }
  if (DAT_0023be92 < 0x180) {
    DAT_0023be92 = 0x180;
  }
  if (0x3d80 < DAT_0023be92) {
    DAT_0023be92 = 0x3d80;
  }
  if (DAT_0023b82c == 0) {
    set_pending_update_flags(2);
  }
}



// was FUN_00067d10 -- sets DAT_0023b82c, the object the camera currently tracks (read by
// update_current_view_from_subject and many others), by opcode: -1 clears it (free-camera mode), 0
// selects whatever object is under the cursor (gated on DAT_000db500, a spectate-enable flag)...
void set_view_subject_by_command(short command)
{
  int iVar1;
  short sVar2;
  
  if (command == -1) {
    DAT_0023b82c = 0;
    return;
  }
  if (command == 0) {
    if (DAT_000db500 == 0) {
      return;
    }
    sVar2 = encode_object_slot_index(DAT_000db500);
    iVar1 = (int)sVar2;
    if (iVar1 == 0) {
      return;
    }
    if (0xff < iVar1) {
      return;
    }
    if (iVar1 < 2) {
      return;
    }
    DAT_0023b82c = iVar1 * 0x1b + DAT_002046b8;
  }
  else if (command == 1) {
    if (DAT_0023b82c == (char *)g_player_object) {
      return;
    }
    DAT_0023b82c = (char *)g_player_object;
  }
  else {
    if (command != 2) {
      if (command != 3) {
        return;
      }
      if (DAT_002046b8 - 0x1b <= DAT_0023b82c) {
        DAT_0023b82c = DAT_002046b8 - 0x36;
        set_pending_update_flags(2);
      }
    }
    if (DAT_0023b82c < DAT_002046b8) {
      return;
    }
    DAT_0023b82c = DAT_002046b8 - 0x1b;
  }
  set_pending_update_flags(2);
}



// was FUN_00067e2c -- enters free-camera mode: resets the custom view target to the player's own
// position, then clears the view subject (set_view_subject_by_command(-1)) so
// move_custom_view_target starts driving the camera instead of normal player movement.
void enter_free_camera_mode(int unused)
{
  set_custom_view_target(0);
  set_view_subject_by_command(-1);
}



// was FUN_00067e40 -- directly sets the custom view target's full state (position/facing) from an
// object record (param_1) with explicit x/y overrides (param_2/param_3), resets a couple of tracked
// deltas, forces a camera resync...
void restore_view_from_object_record(char *record, short x, short y)
{
  int iVar1;
  
  DAT_0023be90 = (*(byte *)(record + 3) & 0xe0) + x * 0x100;
  DAT_0023be92 = (*(byte *)(record + 3) & 0x1c) * 8 + y * 0x100;
  DAT_0023be94 = (*(byte *)(record + 2) & 0x7f) << 3;
  DAT_0023bf00 = (*(ushort *)(record + 2) & 0xff80) << 6;
  DAT_0023bf02 = 0;
  DAT_0023bf04 = 0;
  load_shading_level_config(6);
  iVar1 = DAT_00086b20;
  if (DAT_00086b20 != 0) {
    DAT_00086b20 = 0;
  }
  play_view_restore_transition();
  if (iVar1 != 0) {
    DAT_00086b20 = 1;
  }
  refresh_player_equipment_effects();
}



// was spin_view_full_rotation -- spins the view through a full rotation over 64 substeps
// (DAT_0023bea4, a rotation-like value, accumulates by a fixed 0xccb step each call), redrawing via
// render_dungeon_frame_timed every substep.
// was FUN_00067f1c
void spin_view_full_rotation(int unused)
{
  int iVar1;
  ushort uVar2;
  short sVar3;
  short sVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  
  DAT_0023beb0 = 0x20;
  DAT_0023beac = 0x20;
  set_view_subject_by_command(3);
  iVar6 = (uint)DAT_0023beac * 0x100 - (int)DAT_00204880;
  iVar7 = (uint)DAT_0023beb0 * 0x100 - (int)DAT_00204882;
  uVar5 = integer_sqrt(iVar7 * iVar7 + iVar6 * iVar6);
  uVar5 = (uVar5 & 0xffff) >> 6;
  DAT_0023bea0 = (undefined2)uVar5;
  iVar1 = uVar5 << 6;
  sVar3 = ordint_divmod(iVar1,iVar6 * 0x8000).quot;
  sVar4 = ordint_divmod(iVar1,iVar7 * 0x8000).quot;
  DAT_0023bea4 = compute_angle_from_slope((int)sVar4,(int)sVar3);
  DAT_0023bf08 = 0;
  do {
    render_dungeon_frame_timed();
    DAT_0023bea4 = DAT_0023bea4 + 0xccb;
    sVar3 = DAT_0023bf08 + 1;
    uVar2 = DAT_0023bf08 + 1;
    DAT_0023bf08 = sVar3;
  } while (uVar2 < 0x40);
  set_view_subject_by_command(1);
}



// was FUN_00068260 -- the "3D-viewport's own click-and-hold-to-walk region" handler (per input.c's
// own comment), called from handle_game_view_click while a button is held: drives ordinary player
// movement (move_command_dispatch) normally...
void handle_game_view_click_hold()

{
  if (DAT_002020d8 == 0) {
    /* Mouselook: the cursor sits at the viewport centre, which this click-and-hold-to-walk logic
       reads as "walk forward slowly" -- a held button (attack swing, drag) must not move the
       player; WASD does that. */
    if (uw_mouselook_active()) return;
    move_command_dispatch(-1);
    if (DAT_0023bf0c == '\0') {
      set_cursor_confine_rect((int)DAT_0023be5c,(int)DAT_0023be80,(int)DAT_0023bd80 + (int)DAT_0023be5c + -1,
                   ((int)DAT_0023be80 - (int)DAT_0023be88) + 1);
    }
    DAT_0023bf0c = '\x02';
  }
  else {
    /* This handler runs once per main-loop poll, which on a modern host is far faster than the
       original device's loop -- step the far-sight camera once per game frame instead (the same
       clock the player's own movement is paced by). */
    static unsigned int last_step_clock = ~0u;
    unsigned int now = uw_frame_clock_ms();
    if (now != last_step_clock) {
      last_step_clock = now;
      move_custom_view_target(0);
    }
  }
  return;
}




// was FUN_0006a0c8 -- postprocess callback for the main menu's "opbtn" (OPBTN.GR) resource load --
// populates DAT_0023bf6c's per-button record table (bitmap pointer via g_menu_button_bitmaps, plus
// width/height) as each button-state bitmap finishes loading.
int populate_menu_button_bitmap_entry(void *entry_ptr, uint success, int index)
{
  char *entry = (char *)entry_ptr;
  uint uVar1;
  int iVar3;
  int bmp_idx;

  uVar1 = (int)index & 1;
  iVar3 = (int)index >> 1;
  bmp_idx = uVar1 + iVar3 * 4;
  if ((uint)bmp_idx < sizeof(g_menu_button_bitmaps) / sizeof(g_menu_button_bitmaps[0])) {
    g_menu_button_bitmaps[bmp_idx] = entry + 5;
  }
  if ((short)uVar1 == 0) {
    char *rec = DAT_0023bf6c + iVar3 * 0x10;
    rec[0xc] = entry[1];
    rec[0xd] = 0;
    rec[0xe] = entry[2];
    rec[0xf] = 0;
  }
  return success != 0;
}







// was FUN_0006a168 -- throttled (14ms via DAT_0023bf74 vs
// read_realtime_clock_units) palette-cycle animation for the main menu's
// title/copyright gold gradient.
void animate_title_palette_cycle()

{
  uint uVar1;
  
  uVar1 = read_realtime_clock_units();
  if (0xd < (int)((uVar1 & 0xffff) - (uint)DAT_0023bf74)) {
    palette_cycle_range(0x40,0x40,1);
    reinstall_active_palette(0x40,0x40,0);
    /* Palette-cycle animation on the menu's "Ultima Underworld" title (and the copyright line):
       palette_cycle_range rotates PALS entries 0x40..0x7f -- the gold gradient ramp -- and
       reinstall_active_palette rebuilds g_palette_rgb565. */
    if (DAT_0023bf70 != (char *)0x0) {
      unsigned char *_src = (unsigned char *)DAT_0023bf70;
      unsigned short *_dst = (unsigned short *)g_uw_framebuffer;
      unsigned short *_lut = &g_palette_rgb565;
      int _i;
      for (_i = 0; _i < 0x140 * 200; _i++) {
        unsigned char _ix = _src[_i];
        if ((_ix & 0xc0) == 0x40) _dst[_i] = _lut[_ix];
      }
      dirty_rect_union(0,200,0,0x140); /* recoloured pixels span the screen -- make sure the flush below carries them */
    }
    DAT_0023bf74 = read_realtime_clock_units();
  }
  flush_dirty_rect_to_display(1);
  return;
}



// was FUN_0006a1c4 -- if param_1 is set, probes the save-slot archives via probe_save_slots and,
// when no valid save slot exists, calls display_book_or_scroll_page(0) to disable/grey out the
// "Journey Onward" main-menu option.
void update_journey_onward_availability(short check_saves)
{
  short local_ac [4];
  undefined1 auStack_a4 [160];

  if ((check_saves != 0) && (probe_save_slots(auStack_a4,local_ac), local_ac[0] == 0)) {
    display_book_or_scroll_page(0);
  }
}






// was FUN_0006a200.
void draw_menu_item_list(short item_count, char *rects, char use_text, short selected)
{
  short sVar1;
  int iVar2;
  /* pcVar_rec: dedicated pointer for the use_text=='\0' branch's 0x10-stride
     rect-record array (rects was `int`, truncating the pointer). */
  char *pcVar_rec;
  undefined1 uVar3;
  int iVar4;
  /* ppcVar5/pcVar_str: the use_text!=0 branch indexes rects as an array of char* string pointers. */
  char **ppcVar5;
  char *pcVar_str;

  if (use_text == '\0') {
    decrement_cursor_hide_depth();
    if (0 < item_count) {
      iVar4 = 0;
      do {
        pcVar_rec = rects + iVar4 * 0x10;
        /* Was reading the bitmap pointer back out of rects's packed 4-byte record slot -- see
           g_menu_button_bitmaps' declaration comment for why that's now routed through a dedicated
           array instead... */
        int bmp_idx = (uint)(iVar4 == selected) + iVar4 * 4;
        bitmap_blit_to_framebuffer((int)*(short *)(pcVar_rec + 8),(int)*(short *)(pcVar_rec + 10),
                     (uint)bmp_idx < sizeof(g_menu_button_bitmaps) / sizeof(g_menu_button_bitmaps[0])
                       ? g_menu_button_bitmaps[bmp_idx] : 0,
                     (int)*(short *)(pcVar_rec + 0xe),*(undefined2 *)(pcVar_rec + 0xc),0,0,1);
        iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      } while (iVar4 < item_count);
    }
  }
  else {
    decrement_cursor_hide_depth();
    iVar4 = 0;
    /* draw_text_string only honours *g_draw_color_index (the palette index this loop sets to
       0xa2/0xaa to highlight the selected item) when g_text_use_palette_color is nonzero; otherwise
       it falls back to the flat g_text_flat_color color... */
    int _saved_af74 = g_text_use_palette_color;
    g_text_use_palette_color = 1;
    if (0 < item_count) {
      do {
        uVar3 = 0xa2;
        if (iVar4 != selected) {
          uVar3 = 0xaa;
        }
        *g_draw_color_index = uVar3;
        *DAT_00084298 = uVar3;
        ppcVar5 = (char **)(rects + iVar4 * 8);
        pcVar_str = *ppcVar5;
        while (sVar1 = measure_text_width(pcVar_str), 0x13e < sVar1) {
          pcVar_str = *ppcVar5;
          iVar2 = ce_strlen(pcVar_str);
          pcVar_str[iVar2 - 1] = 0;
          pcVar_str = *ppcVar5;
        }
        iVar2 = (int)sVar1;
        if (iVar2 < 0) {
          iVar2 = iVar2 + 1;
        }
        draw_text_string(*ppcVar5,0xa0 - (short)(iVar2 >> 1),iVar4 * 0x16 + 100);
        iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
      } while (iVar4 < item_count);
    }
    g_text_use_palette_color = _saved_af74;
  }
  cursor_show_idle_tick();
}






// was poll_menu_pointer_selection -- pointer/touch-driven hit-test loop for a menu item list
// (param_3=='\0': bitmap buttons; param_3!=0: text items, e.g. the save-slot list): while pointer
// events remain queued...
// was FUN_0006ac38
int poll_menu_pointer_selection(int item_count, char *rects, char use_text)
{
  int iVar1;
  bool bVar2;
  bool bVar3;
  short sVar4;
  short sVar5;
  /* iVar6 doubles as a byte-offset pointer into rects (0x10-stride rect records, use_text=='\0'
     branch) and a plain int scratch value (distance/threshold math, use_text!=0 branch) -- mutually
     exclusive, but iVar6 stayed `int` either way... */
  char *pcVar_rec;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  short local_30;
  short local_2e;

  iVar9 = -1;
  bVar3 = true;
  bVar2 = true;
  sVar5 = (short)item_count;
  if (use_text == '\0') {
    sVar4 = next_input_event();
    if (0 < sVar4) {
      iVar1 = (int)sVar5;
      bVar2 = bVar3;
      do {
        animate_title_palette_cycle();
        get_mouse_position(&local_30,&local_2e);
        iVar8 = 0;
        if (0 < iVar1) {
          do {
            pcVar_rec = rects + iVar8 * 0x10;
            if (((int)*(short *)(pcVar_rec + 8) <= (int)local_30) &&
               ((int)local_30 <= (int)*(short *)(pcVar_rec + 8) + (int)*(short *)(pcVar_rec + 0xc) + -1)) {
              if (((int)local_2e <= (int)*(short *)(pcVar_rec + 10) + (int)*(short *)(pcVar_rec + 0xe) + -1)
                 && ((int)*(short *)(pcVar_rec + 10) <= (int)local_2e)) {
                bVar2 = true;
                if ((short)iVar8 != (short)iVar9) {
                  draw_menu_item_list(item_count,rects,0,iVar8);
                  iVar9 = iVar8;
                }
                break;
              }
            }
            iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
          } while (iVar8 < iVar1);
        }
        if (((short)iVar8 == iVar1) && (bVar2 = true, (short)iVar9 != -1)) {
          bVar2 = false;
        }
        sVar4 = next_input_event();
      } while (0 < sVar4);
    }
  }
  else {
    select_active_font(s_fontbig_sys_0008432c);
    sVar4 = next_input_event();
    bVar2 = bVar3;
    if (0 < sVar4) {
      iVar1 = (int)sVar5;
      do {
        animate_title_palette_cycle();
        get_mouse_position(&local_30,&local_2e);
        iVar8 = 0;
        if (0 < iVar1) {
          iVar8 = 0;
          do {
            sVar4 = measure_text_width(*(char **)(rects + iVar8 * 8));
            iVar6 = -(int)sVar4;
            iVar7 = iVar6 + 0x140;
            if (iVar7 < 0) {
              iVar7 = iVar6 + 0x141;
            }
            iVar6 = (int)(short)(iVar7 >> 1);
            if ((iVar6 <= local_30) && ((int)local_30 < iVar6 + sVar4)) {
              iVar6 = (iVar8 * 0x16 + 100) * 0x10000 >> 0x10;
              if ((iVar6 <= local_2e) && ((int)local_2e < iVar6 + *(short *)(DAT_000879b0 + 6))) {
                bVar2 = true;
                if ((short)iVar8 != (short)iVar9) {
                  draw_menu_item_list(item_count,rects,use_text,iVar8);
                  iVar9 = iVar8;
                }
                break;
              }
            }
            iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
          } while (iVar8 < iVar1);
        }
        if (((short)iVar8 == iVar1) && (bVar2 = true, (short)iVar9 != -1)) {
          bVar2 = false;
        }
        sVar4 = next_input_event();
      } while (0 < sVar4);
    }
    select_active_font(s_FONT5X6P_SYS_00084e9c);
  }
  if (bVar2) {
    sVar5 = 0;
  }
  return iVar9 + sVar5;
}



// was FUN_0006af3c
int menu_button_list_navigate(int item_count, void *rects_ptr, byte use_text, int selected)
{
  char *rects = (char *)rects_ptr;
  short sVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  bool bVar6;
  
  iVar4 = -2;
  do {
    select_active_font(s_fontbig_sys_0008432c);
    draw_menu_item_list(item_count,rects,use_text,selected);
    select_active_font(s_font5x6p_sys_0008430c);
    /* Was: `ushort _cyc_t = DAT_0023bf74; ... if (DAT_0023bf74 != _cyc_t) draw_menu_item_list(...)`
       -- an earlier session's own addition... */
    while (sVar2 = next_input_event(), sVar2 < 0) {
      advance_menu_music_track();
      animate_title_palette_cycle();
    }
    sVar1 = (short)item_count;
    iVar3 = selected;
    iVar5 = iVar4;
    if (0xa7 < sVar2) {
      if (sVar2 < 0x167) {
        if (sVar2 != 0x166) {
          if (sVar2 == 0xa8) {
LAB_0006b0e4:
            iVar3 = selected + -1;
            iVar5 = iVar4;
            goto LAB_0006b144;
          }
          if (sVar2 != 0xa9) {
            if (sVar2 != 0xaa) {
              if (sVar2 == 0xab) goto LAB_0006b140;
              if (sVar2 != 0xac) {
                bVar6 = sVar2 == 0x162;
                goto LAB_0006b0e0;
              }
            }
            goto LAB_0006b138;
          }
        }
      }
      else if (sVar2 != 0x16e) {
        if (sVar2 == 0x170) goto LAB_0006b0e4;
        if (sVar2 != 0x23c) {
          if (sVar2 != 0x23e) {
            if (sVar2 == 0x278) {
LAB_0006b130:
              iVar5 = -1;
            }
            goto LAB_0006b144;
          }
          goto LAB_0006b138;
        }
        goto LAB_0006b000;
      }
      goto LAB_0006b140;
    }
    if (sVar2 == 0xa7) {
LAB_0006b000:
      iVar3 = 0;
      iVar5 = iVar4;
    }
    else if (sVar2 < 0x90) {
      if (sVar2 == 0x8f) goto LAB_0006b0e4;
      if (0 < sVar2) {
        if (sVar2 < 4) {
          iVar3 = poll_menu_pointer_selection(item_count,rects,use_text);
          sVar2 = (short)iVar3;
          if ((((sVar2 < 0) || (sVar1 <= sVar2)) || (iVar5 = iVar3, sVar2 == (short)iVar4)) &&
             (iVar3 = selected, iVar5 = iVar4, sVar1 <= sVar2)) {
            iVar3 = (int)sVar2 - (int)sVar1;
          }
        }
        else {
          iVar5 = selected;
          if (sVar2 != 0xd) {
            if (sVar2 == 0x1b) goto LAB_0006b130;
            if (sVar2 != 0x8c) {
              if (sVar2 == 0x8d) goto LAB_0006b0e4;
              iVar5 = iVar4;
              if (sVar2 != 0x8e) goto LAB_0006b144;
            }
            goto LAB_0006b000;
          }
        }
      }
    }
    else if (sVar2 == 0x91) {
LAB_0006b140:
      iVar3 = selected + 1;
    }
    else {
      if (sVar2 != 0x92) {
        if (sVar2 == 0x93) goto LAB_0006b140;
        if (sVar2 != 0x94) {
          if (sVar2 != 0xa5) {
            bVar6 = sVar2 == 0xa6;
LAB_0006b0e0:
            if (!bVar6) goto LAB_0006b144;
            goto LAB_0006b0e4;
          }
          goto LAB_0006b000;
        }
      }
LAB_0006b138:
      iVar3 = item_count + -1;
    }
LAB_0006b144:
    if ((short)iVar3 < 0) {
      iVar3 = 0;
    }
    else if (sVar1 <= (short)iVar3) {
      iVar3 = item_count + -1;
    }
    selected = iVar3;
    iVar4 = iVar5;
    if (-2 < (short)iVar5) {
      return iVar5;
    }
  } while( true );
}





// was FUN_000773ac -- called from app_main_loop (src/game.c, WinMain's real body) right before
// create_main_window_and_init_display below.
void spawn_message_dispatch_thread(int instance, const void *class_name)
{
  undefined4 local_34;
  code *local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  
  local_34 = 3;
  local_2c = 0;
  local_30 = dispatch_window_message;
  local_28 = 0;
  local_20 = 0;
  local_1c = 0;
  local_24 = instance;
  local_18 = GetStockObject(0);
  local_14 = 0;
  local_10 = (undefined4)(uintptr_t)class_name;  /* the second argument is really the window-class name pointer */
  RegisterClassW(&local_34);
}



// was FUN_00077408 -- creates the main app window (CreateWindowExW, a CreateWindowEx-style call)
// and, if that and the registration check (is_product_registered) both succeed...
int create_main_window_and_init_display(int instance, int show_command)
{
  bool bVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;
  undefined1 *puVar5;
  undefined *puVar6;
  int iVar7;
  undefined1 *puVar8;
  char *pcVar9;
  char *pcVar10;
  undefined4 local_7d8;
  undefined4 local_7d4;
  undefined4 local_7d0;
  undefined4 local_7c8;
  undefined4 local_7c4;
  undefined4 local_7c0;
  undefined4 local_7bc;
  undefined4 local_7b8 [2];
  undefined1 auStack_7b0 [24];
  undefined1 auStack_798 [96];
  undefined1 auStack_738 [256];
  undefined1 auStack_638 [520];
  undefined1 auStack_430 [520];
  undefined1 auStack_228 [520];
  
  GetSystemMetrics(1);
  GetSystemMetrics(0);
  DAT_0023c548 = (HWND__ *)
                 CreateWindowExW(0,u_UltimaUW_00087678,u_Ultima_Under_World_00087690,0x10000000);
  if ((DAT_0023c548 != (HWND__ *)0x0) && (iVar3 = is_product_registered(DAT_0023c548,instance), iVar3 != 0)) {
    pcVar9 = &DAT_0023cca8;
    ce_memset(&DAT_0023cca8,0,0x104);
    pcVar10 = &DAT_0023c698;
    ce_memset(&DAT_0023c698,0,0x104);
    local_7c4 = 1;
    local_7c0 = 0x208;
    ce_memset(auStack_638,0,0x208);
    iVar3 = RegOpenKeyExW(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_0008784c,0,0);
    if (iVar3 == 0) {
      RegQueryValueExW(local_7d4,u_InstlDir_00087838,0,&local_7c4,auStack_638,&local_7c0);  /* data buffer + size dropped by Ghidra (ARM stack args) */
      pcVar4 = (char *)load_string_resource_large(auStack_638);
      do {
        cVar2 = *pcVar4;
        pcVar4 = pcVar4 + 1;
        *pcVar9 = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
      RegCloseKey(local_7d4);
    }
    else {
      pcVar9 = s__Program_Files_ZIO_Interactive_U_00087804;
      do {
        cVar2 = *pcVar9;
        pcVar9[0x1b54a4] = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
    }
    local_7c8 = 1;
    local_7bc = 0x208;
    ce_memset(auStack_430,0,0x208);
    iVar3 = RegOpenKeyExW(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_000877a4,0,0);
    if (iVar3 == 0) {
      RegQueryValueExW(local_7d8,u_InstlDir_00087838,0,&local_7c8,auStack_430,&local_7bc);
      pcVar9 = (char *)load_string_resource_large(auStack_430);
      do {
        cVar2 = *pcVar9;
        pcVar9 = pcVar9 + 1;
        *pcVar10 = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
      RegCloseKey(local_7d8);
    }
    else {
      pcVar10 = s__Program_Files_ZIO_Interactive_U_00087774;
      do {
        cVar2 = *pcVar10;
        pcVar10[0x1b4f24] = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
    }
    local_7b8[0] = 1;
    local_7b8[1] = 0x208;  /* size-in-bytes store dropped by Ghidra, same as the two sibling lookups above */
    ce_memset(auStack_228,0,0x208);
    iVar3 = RegOpenKeyExW(0x80000002,u_Software_Apps_ZIO_Interactive_Ul_0008771c,0,0);
    if (iVar3 == 0) {
      RegQueryValueExW(local_7d0,u_InstlDir_00087838,0,local_7b8,auStack_228,&local_7b8[1]);
      pcVar10 = (char *)load_string_resource_large(auStack_228);
      pcVar9 = &DAT_00241f08;
      do {
        cVar2 = *pcVar10;
        pcVar10 = pcVar10 + 1;
        *pcVar9 = cVar2;
        pcVar9 = pcVar9 + 1;
      } while (cVar2 != '\0');
      RegCloseKey(local_7d0);
    }
    else {
      pcVar10 = s__Program_Files_ZIO_Interactive_U_000876ec;
      do {
        cVar2 = *pcVar10;
        pcVar10[0x1ba81c] = cVar2;
        pcVar10 = pcVar10 + 1;
      } while (cVar2 != '\0');
    }
    ShowWindow(DAT_0023c548,show_command);
    UpdateWindow(DAT_0023c548);
    iVar3 = GXOpenDisplay(DAT_0023c548,1);
    if (iVar3 != 0) {
      SystemParametersInfoW(0x102,0x100,auStack_738,0);
      iVar3 = _wcsicmp(auStack_738,u_HP_Jornada_540_000876cc);
      if (iVar3 != 0) {
        GXOpenInput();
        puVar5 = (undefined1 *)GXGetDisplayProperties();
        iVar3 = 0x18;
        puVar8 = auStack_7b0;
        do {
          iVar7 = iVar3 + -1;
          *puVar8 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar5 = &DAT_0023cdb0;
        iVar3 = 0x18;
        puVar8 = auStack_7b0;
        do {
          iVar7 = iVar3 + -1;
          *puVar5 = *puVar8;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar5 = (undefined1 *)GXGetDefaultKeys(auStack_798);
        iVar3 = 0x60;
        puVar8 = auStack_798;
        do {
          iVar7 = iVar3 + -1;
          *puVar8 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar5 = puVar5 + 1;
          iVar3 = iVar7;
          puVar8 = puVar8 + 1;
        } while (iVar7 != 0 && bVar1);
        puVar6 = &DAT_0023ce10;
        iVar3 = 0x60;
        puVar5 = auStack_798;
        do {
          iVar7 = iVar3 + -1;
          *puVar6 = *puVar5;
          bVar1 = 0 < iVar3;
          puVar6 = puVar6 + 1;
          iVar3 = iVar7;
          puVar5 = puVar5 + 1;
        } while (iVar7 != 0 && bVar1);
      }
      return 1;
    }
  }
  return 0;
}





// was FUN_00077860 -- trivial passthrough, returns param_2 unchanged.
int window_message_noop_handler(int window, int message)
{
  return message;
}



// was FUN_00077868 -- stores &DAT_00242010 into the window's extra- data slot 0x94 via
// load_bmp_resource_to_rgb565 (a SetWindowLong-style helper -- see its other use in
// create_main_window_and_init_display storing g_uw_framebuffer at slot 0xca).
void store_window_extra_data_ptr(int module)
{
  load_bmp_resource_to_rgb565(module,0x94,&DAT_00242010);
}



// was FUN_00077878 -- looks up window message id param_2 in a {msg_id, handler_ptr} table
// (0x13 ARM records) and forwards the original window arguments to the matching native callback.
void dispatch_window_message(undefined4 param_1, int param_2,
                             undefined4 param_3, int param_4)
{
  /* ARM 0x778e8 calls through r11 with r0-r3 still containing the message
     arguments. The decompiler omitted them, losing key codes and mouse positions. */
  for (uint i = 0; i < 0x13; ++i) {
    if ((uint)param_2 == DAT_000830b0[i].message) {
      DAT_000830b0[i].handler(param_1, param_2, param_3, param_4);
      return;
    }
  }
  DefWindowProcW();
}






// was FUN_00077a38 -- shutdown/cleanup routine: calls end_gx_draw_session, frees several
// conditionally-allocated resources (LocalFree, likely LocalFree/free) and a 0x80-entry pointer
// array (&DAT_00202308)...
int shutdown_game_resources()

{
  int iVar1;
  void **piVar2;

  end_gx_draw_session();
  if (DAT_0023c44c != 0) {
    LocalFree(DAT_0023c44c);
  }
  if (DAT_0023cca0 != 0) {
    LocalFree(DAT_0023cca0);
  }
  if (DAT_000890a4 != 0) {
    LocalFree(DAT_000890a4);
  }
  if (DAT_000879b0 != 0) {
    LocalFree(DAT_000879b0);
  }
  if (DAT_0024af78 != 0) {
    LocalFree(DAT_0024af78);
  }
  if (DAT_0024af7c != 0) {
    LocalFree(DAT_0024af7c);
  }
  piVar2 = &DAT_00202308;
  iVar1 = 0x80;
  do {
    if (*piVar2 != 0) {
      LocalFree(*piVar2);
    }
    iVar1 = iVar1 + -1;
    piVar2 = piVar2 + 1;
  } while (iVar1 != 0);
  LocalFree(&DAT_00202308);
  run_game_shutdown_sequence(0);
  GXCloseDisplay();
  GXCloseInput();
  PostQuitMessage(0);
  return 0;
}


/* was FUN_0007ea30 -- real body confirmed stripped from the shipped ARM code (disassembly is just
   `cpy pc,lr` -- an immediate return, ignoring whatever argument its single call site passes). */
void debug_print_init()

{
  return;
}



/* was FUN_0007ea34 -- real body confirmed stripped from the shipped ARM code (disassembly: the
   standard vararg prologue -- stmdb saving r0-r3 and r12/lr to the stack -- immediately followed by
   ldmia popping straight back out and returning)... */
void debug_print(char *param_1, ...)

{
  if (param_1 != (char *)0x0) {
    va_list ap;
    fprintf(stderr, "[dbg] ");
    va_start(ap, param_1);
    vfprintf(stderr, param_1, ap);
    va_end(ap);
    fprintf(stderr, "\n");
  }
  return;
}





/* was FUN_0007036c. Bound to key 0x88 in mode 0x1b, arg 2 (uw.c ~59574, register_key_binding). */
int print_debug_stat_message(short stat_index)
{
  undefined4 uVar1;
  uint uVar2;

  if (1) {
    uVar2 = ((uint)stat_index + 10) & 0xff;
    if ((uVar2 != 10) && (uVar2 != 0xb)) {
      if (uVar2 == 0xc) {
        cast_detect_life_spell(8,*(undefined1 *)(DAT_00086df8 + (int)stat_index + 0x2b));
      }
      else {
        message_scroll_print_wrapped(get_message_string((((int)(short)uVar2 + 0x1f) | 0x400)));
        message_scroll_print_wrapped(&s_scroll_newline_0008522c);
      }
    }
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


/* was FUN_00071ac4. Bound to key 0x89 in mode 0x1b (uw.c ~59573). find_equipped_item_by_category
   returns `ushort *`; its return was captured into a plain `int` in the original decompile, the
   same pointer-truncation bug class fixed ~30 other places in this file. */
void debug_force_rest_action()
{
  ushort *puVar1;
  undefined1 auStack_10 [4];

  puVar1 = find_equipped_item_by_category(4,2,1,4,(undefined2 *)auStack_10);
  handle_rest_action(puVar1 != (ushort *)0x0);
  return;
}


/* was FUN_000680d0. Bound to keys '1'/'2'/'3' (0x31/0x32/0x33) in mode 0x11 with args -1/0/1
   respectively (uw.c ~59567-59569, register_key_binding). */
short DAT_0023bf2c;
void debug_adjust_view_heading(int delta)
{
  short sVar1;
  short *puVar2;

  puVar2 = &DAT_0023beb4;
  if (DAT_0023bf2c != 0) {
    puVar2 = (short *)&DAT_0023bf02;
  }
  if ((short)delta == 0) {
    set_pending_update_flags(2);
    *puVar2 = 0;
  }
  else {
    sVar1 = 0x1000;
    if ((short)delta == -1) {
      sVar1 = -0x1000;
    }
    if (step_value_toward_limit(puVar2,sVar1,0x400,(short)delta) != 0) {
      set_pending_update_flags(2);
    }
  }
}


// was FUN_000228d4 -- reads a 10-byte structure via GetSystemTime into a stack buffer, then
// multiplies 3 of its ushort fields together (each +1, converting a 0-based max-index into a count)
// and passes the product to ce_srand.
void compute_dimension_volume()

{
  undefined1 auStack_14 [10];
  ushort local_a;
  ushort local_8;
  ushort local_6;

  GetSystemTime(auStack_14);
  ce_srand((local_6 + 1) * (local_8 + 1) * (local_a + 1));
  return;
}


// was FUN_0003b820 -- the game's startup/boot sequence: starts ambient sound, initializes the
// string/level-object/input/debug subsystems, shows the three presentation splash screens
// (pres1.byt, pres2.byt, the copyright screen -- each with a 1.5s dwell)...
void run_game_startup_sequence()

{
  char stack0xffdc2d2c_buf [256];
  char *stack0xffdc2d2c_ptr;
  char stack0xffdc2e34_buf [256];
  char *stack0xffdc2e34_ptr;
  char cVar1;
  short sVar2;
  int iVar3;
  char *pcVar4;
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating
     load_string_resource's real pointer -- same class as that
     function's own fix. */
  char *uVar5;
  char *pcVar6;
  char acStack_62c [264];
  char acStack_524 [264];
  undefined1 auStack_41c [520];
  undefined1 auStack_214 [520];
  
  start_ambient_sound_effect(2);
  init_string_resource_cache();
  init_level_object_arena();
  input_bindings_init();
  debug_print_init();
  store_window_extra_data_ptr(DAT_0023c540);
  cache_ambient_sound_handle();
  iVar3 = select_default_hud_font();
  if (iVar3 == 0) {
    report_fatal_error_and_exit(0x3003);
  }
  DAT_0024af70 = 1;
  ce_memset(acStack_62c,0,0x104);
  pcVar6 = &DAT_0023cca8;
    stack0xffdc2e34_ptr = stack0xffdc2e34_buf;
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_pres1_byt_00085790);
  blit_fullscreen_bitmap_file(5,acStack_62c,1);
  Sleep(0x5dc);
  play_music_track(1,1);
  init_grtile_registry();
  ce_memset(acStack_62c,0,0x104);
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_pres2_byt_00085780);
  blit_fullscreen_bitmap_file(6,acStack_62c,1);
  Sleep(0x5dc);
  sVar2 = load_startup_gr_resources();
  if (sVar2 != 0) {
    report_fatal_error_and_exit(sVar2);
  }
  ce_memset(acStack_62c,0,0x104);
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_COPYRIGHT_BYT_0008576c);
  blit_fullscreen_bitmap_file(2,acStack_62c,1);
  /* Intentional deviation: the original gave the final copyright splash
     no dwell. Keep it visible for 1.5 seconds, like the preceding splashes. */
  Sleep(0x5dc);
  sVar2 = init_cursor_subsystem();
  if (sVar2 < 0) {
    report_fatal_error_and_exit(2);
  }
  sVar2 = load_object_catalog_data();
  if (sVar2 != 0) {
    report_fatal_error_and_exit(sVar2);
  }
  reset_texture_id_lists();
  init_dungeon_rendering();
  init_gameplay_session();
  init_collision_response_profiles();
  init_new_character_record(0);
  init_sprite_list_buffers();
  init_main_loop_state();
  load_light_tables();
  load_combat_data_file();
  iVar3 = check_save_disk_space();
  if (iVar3 == 0) {
    report_fatal_error_message_and_exit(s_Not_enough_disk_space_for_save_g_00085744);
  }
  ce_memset(acStack_62c,0,0x104);
  pcVar4 = pcVar6;
    stack0xffdc2d2c_ptr = acStack_62c;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc2d2c_ptr = cVar1; stack0xffdc2d2c_ptr = stack0xffdc2d2c_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_62c,s__DATA_lev_ark_00085734);
  uVar5 = load_string_resource(acStack_62c);
  ce_wcscpy(auStack_214,uVar5);
  ce_memset(acStack_524,0,0x104);
  do {
    cVar1 = *pcVar6;
    *stack0xffdc2e34_ptr = cVar1; stack0xffdc2e34_ptr = stack0xffdc2e34_ptr + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_524,s__SAVE0_lev_ark_000842fc);
  uVar5 = load_string_resource(acStack_524);
  ce_wcscpy(auStack_41c,uVar5);
  CopyFileW(auStack_214,auStack_41c,0);
  sVar2 = seed_conversation_globals_for_new_game();
  if (sVar2 != 0) {
    report_fatal_error_and_exit(sVar2);
  }
  clear_screen_and_restore_cursor();
  set_palette_bank(5);
  return;
}


// was FUN_0003baf4 -- the game's shutdown counterpart to run_game_startup_sequence: frees input
// bindings, stops ambient sound and other sound effects/music, releases panel-wipe grtiles, then
// builds the save directory path and ensures it exists.
void run_game_shutdown_sequence(int unused)
{
  char stack0xffdc3250_buf [256];
  char *stack0xffdc3250_ptr;
  char cVar1;
  char *pcVar2;
  char acStack_108 [260];

  decrement_cursor_hide_depth_thunk();
  input_bindings_free();
  stop_ambient_sound_effect();
  free_level_tile_arena();
  release_panel_wipe_grtiles();
  shutdown_sound_effects();
  shutdown_music_module();
  close_strings_pak_file_thunk();
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3250_ptr = acStack_108;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3250_ptr = cVar1; stack0xffdc3250_ptr = stack0xffdc3250_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_108,&DAT_000857a0);
  ensure_save_directory_exists(acStack_108);
}



// was FUN_0003bb60 -- waits for a pending input event to clear, then shows book/scroll page 9.
// Called once during startup, right after run_game_startup_sequence/build_trig_tables and before
// main_menu_loop -- plausibly a "press any key" instructions/title page shown before the main menu.
void wait_and_show_intro_page()

{
  short sVar1;

  do {
    sVar1 = next_input_event();
  } while (3 < sVar1);
  display_book_or_scroll_page(9);
  return;
}



// was FUN_0003bb84 -- initializes main-loop state: registers a key binding (request_game_exit) that
// signals the main loop to stop, sets the "game running" flag (DAT_00201b6c) that gates it, and
// resets a few related UI/mode fields. Called once from run_game_startup_sequence.
void init_main_loop_state()

{
  register_key_binding(0x278,0,0xbd,request_game_exit);
  DAT_00201b6c = 1;
  DAT_00201c84 = 0x7fff;
  DAT_00201b60 = 0;
  DAT_00201b64 = 0xffff;
  *(undefined1 *)(DAT_00085a6c + 8) = 0;
  *(undefined1 *)(DAT_00085a6c + 9) = 0;
  DAT_00085a6c[4] = 0; /* mirror to the real byte-8 mode field -- see set_game_mode */
  return;
}



// was FUN_0003bc08 -- key-binding callback (registered by
// init_main_loop_state) that clears the "game running" flag,
// signaling the main loop to exit.
void request_game_exit(int key_code)
{
  DAT_00201b6c = 0;
}


// was FUN_0003c310 -- empty body (just returns), same no-op as its split-symbol duplicate
// show_error_dialog_stub_thunk.
void show_error_dialog_stub()

{
  return;
}



// was FUN_0003c318 -- logs a categorized error message: the error code's top nibble selects one of
// 5 category strings (Low Memory, EMS Memory, read-data, write-data, resource/internal), logged via
// NKDbgPrintfW...
void log_categorized_error_message(short error_code)
{
  char *wptr_24610;
  char cVar1;
  ushort uVar2;
  char *pcVar3;
  char acStack_857f4 [546760];
  char acStack_2c [40];

  uVar2 = error_code >> 0xc & 0xf;
  if (uVar2 == 1) {
    pcVar3 = s_Out_of_Low_Memory___000857dc;
  }
  else if (uVar2 == 2) {
    pcVar3 = s_Out_of_EMS_Memory___000857f0;
  }
  else if (uVar2 == 3) {
    pcVar3 = s_Could_not_read_data___00085804;
  }
  else if (uVar2 == 4) {
    pcVar3 = s_Could_not_write_data___0008581c;
  }
  else {
    pcVar3 = s_Resource_problem_or_internal_err_00085834;
  }
  NKDbgPrintfW(pcVar3);
  pcVar3 = s_Error_code_XXXX___000857c8;
    wptr_24610 = acStack_857f4;
  do {
    cVar1 = *pcVar3;
    *wptr_24610 = cVar1; wptr_24610 = wptr_24610 + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
}



// was FUN_0003c3b4 -- logs a categorized fatal error (log_categorized_error_message) then
// terminates the process.
void report_categorized_fatal_error(short error_code)
{
  log_categorized_error_message(error_code);
  terminate_process(0xffffffff);
}



// was FUN_0003c3c8 -- the general-purpose "fatal error" handler used throughout this decompile:
// formats an "Underworld can no longer run, Error XNNN" code string from param_1 (category letter +
// 3 octal digits), shows it via ce_strncpy (unimplemented in this port, see the fprintf below)...
void report_fatal_error_and_exit(ushort error_code)
{
  /* ce_strncpy (the real message-box display for this error) isn't implemented, so this is
     currently the only visibility into which fatal error actually fired -- kept as a permanent log
     line, not a one-off diagnostic. */
  fprintf(stderr, "[fatal] report_fatal_error_and_exit: error code 0x%x\n", error_code);
  char *wptr_24645;
  char cVar1;
  undefined4 uVar2;
  char *pcVar3;
  char acStack_858b0 [546908];
  char acStack_54 [42];
  char local_2a;
  char local_29;
  char local_28;
  char local_27;
  
  pcVar3 = s_Underworld_can_no_longer_run__Er_0008585c;
    wptr_24645 = acStack_858b0;
  do {
    cVar1 = *pcVar3;
    *wptr_24645 = cVar1; wptr_24645 = wptr_24645 + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  local_2a = ((byte)((short)error_code >> 0xc) & 0xf) + 0x41;
  error_code = error_code & 0xfff;
  local_29 = ((byte)((short)error_code >> 6) & 7) + 0x30;
  local_28 = ((byte)((short)error_code >> 3) & 7) + 0x30;
  local_27 = ((byte)error_code & 7) + 0x30;
  uVar2 = ce_strlen(acStack_54);
  ce_strncpy(&DAT_00201b70,acStack_54,uVar2);
  run_game_shutdown_sequence(0);
  terminate_process(0xffffffe8);
}


// was FUN_0003c4a8 -- text-message sibling of report_fatal_error_and_exit: shows a direct message
// string (rather than a numeric error code) via ce_strncpy, then runs the same
// shutdown-and-terminate sequence.
void report_fatal_error_message_and_exit(char *message)
{
  undefined4 uVar1;

  /* See report_fatal_error_and_exit's identical fprintf -- ce_strncpy (the real message-box
     display) isn't implemented, so this is the only visibility into which fatal message actually
     fired. message here is the message text directly, not a numeric code. */
  fprintf(stderr, "[fatal] report_fatal_error_message_and_exit: %s\n", message ? message : "(null)");
  uVar1 = ce_strlen(message); // was a dropped arg -- message itself, same class as babl_builtin_compare's own comment (uw.c ~10977)
  ce_strncpy(&DAT_00201b70,message,uVar1);
  run_game_shutdown_sequence(0);
  terminate_process(0xffffffe8);
}


// was FUN_0003f420 -- the 3D-viewport's click region handler (registered in src/input.c:970
// alongside the sibling handle_game_view_click_hold), fired on click release.
void handle_game_view_click()

{
  int iVar1;
  uint uVar2;
  if ((*(ushort *)(DAT_00085a6c + 6) & 1) != 0) {
    handle_game_view_click_hold();
  }
  if (*(short *)(DAT_00085a6c + 8) != 1) {
    if (*(short *)(DAT_00085a6c + 8) != 0x10) {
      return;
    }
    if (*(short *)(DAT_00085a6c + 6) != 2) {
      return;
    }
    g_interact_target = pick_object_under_cursor(2);
    if (g_interact_target == 0) {
      return;
    }
    interact_use();
    return;
  }
  g_interact_target = 0;
  if ((*(ushort *)(DAT_00085a6c + 6) & 2) == 0) {
    g_interact_target = 0;
    return;
  }
  if (g_cursor_holding_state == 0) {
    uint _dispatch;
    if (g_cursor_mode == 0) {
      uVar2 = 2;
    }
    else {
      uVar2 = ((int)g_cursor_mode & 0xffU) - 1;
    }
    /* Was `(g_cursor_mode == 0) ? 0 : uVar2` -- a forced index-0 override for the no-mode-selected
       case. */
    _dispatch = uVar2;
    if ((uVar2 & 0xff) != 1) {
      if ((*(ushort *)(DAT_00085a6c + 6) & 1) != 0) {
        g_interact_target = 0;
        return;
      }
      g_interact_target = pick_object_under_cursor(2);
      /* Was `(g_interact_target == 0) && (uVar2 != 4)` -- an extra skip added under the OLD, wrong
         table order, meant to let attack (then assumed to be table[4]) fall through to the dispatch
         table even with no object under the cursor... */
      if (g_interact_target == 0) {
        describe_picked_terrain(uVar2,(int)DAT_002020ac);
        goto LAB_0003f584;
      }
    }
    if ((_dispatch & 0xff) < 5 && PTR_FUN_000858c8_table[_dispatch & 0xff] != 0) {
      PTR_FUN_000858c8_table[_dispatch & 0xff]();
    }
  }
  else {
    if (g_cursor_holding_state == 1) {
      handle_object_drop_target(0x17);
    }
    else {
      if (g_cursor_holding_state != 2) {
        if (g_cursor_holding_state != 3) {
          g_interact_target = 0;
          return;
        }
        complete_cast_spell_on_target();
        return;
      }
      g_interact_target = pick_object_under_cursor(2);
      if (g_interact_target != 0) {
        iVar1 = target_in_range((int)DAT_000858c4,g_interact_target,DAT_002020b0);
        if ((iVar1 == 0) || (iVar1 = target_line_of_sight((int)DAT_000858c4,g_interact_target), iVar1 != 0)) {
          print_scroll_message_by_id(0x5e);
        }
        else {
          ((void (*)(ushort *, int, int))DAT_002020b8)(g_interact_target,1,0);
        }
      }
      if (g_selected_object != 0) {
        pop_cursor_icon(3);
        g_selected_object = 0;
        g_cursor_holding_state = 0;
      }
    }
LAB_0003f584:
    wait_for_click_release(1);
  }
  return;
}


// was FUN_00040cd4 -- called once from run_game_startup_sequence (see
// src/game.c:2132) to load/select the game's default HUD font
// (FONT5X6P.SYS).
int select_default_hud_font()

{
  /* Ghidra dropped select_active_font's return value here and always returned 0 (failure)
     regardless -- the font file loads successfully, but the caller (run_game_startup_sequence)
     treats a 0 return as fatal and calls the "Underworld can no longer run" handler... */
  return select_active_font(s_FONT5X6P_SYS_00084e9c);
}


// was FUN_00041210 -- called from restore_view_from_object_record (teleport/saved-viewpoint
// restore): switches to free-camera view, redraws and flashes the weapon overlay out then back in,
// waits for a click, flashes it out and in again, then restores the normal player view subject.
void play_view_restore_transition()

{
  full_dungeon_redraw();
  set_view_subject_by_command(-1);
  weapon_overlay_flash_hold(5);
  full_dungeon_redraw();
  weapon_overlay_flash_restore(5);
  wait_for_click_release(1);
  full_dungeon_redraw();
  weapon_overlay_flash_hold(5);
  set_view_subject_by_command(1);
  full_dungeon_redraw();
  weapon_overlay_flash_restore(5);
  return;
}


// was FUN_00041aac -- called once during game startup (src/game.c:2163, inside
// run_game_startup_sequence, right after the second splash screen); a report_fatal_error_and_exit
// failure here is fatal.
int load_startup_gr_resources()

{
  char stack0xffdc3230_buf [256];
  char *stack0xffdc3230_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  uint uVar21;
  uint uVar22;
  uint uVar23;
  uint uVar24;
  char acStack_128 [260];
  
  ce_memset(acStack_128,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3230_ptr = acStack_128;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_128,s__DATA_allpals_dat_00085a50);
  iVar3 = open_file_for_read(acStack_128);
  if (iVar3 == -1) {
    uVar4 = 0x3008;
  }
  else {
    read_file_handle(iVar3,&DAT_00202520,0x200);
    CloseHandle(iVar3);
    uVar5 = load_gr_resource_group(s_question_00085a44);
    uVar6 = load_gr_resource_group(s_views_00085a3c);
    DAT_0020272c = DAT_00202744;
    uVar7 = load_objects_gr(s_objects_00085a34);
    DAT_0024fa1c = DAT_00202744;
    DAT_00202744 = 0x1c0;
    uVar8 = load_gr_resource_group(s_animo_00085a2c);
    DAT_00202730 = DAT_00202744;
    uVar9 = load_gr_resource_group(s_buttons_00085a24);
    uVar10 = load_gr_resource_group(s_cursors_00085a1c);
    uVar11 = load_gr_resource_group(s_3dwin_00085a14);
    DAT_00202734 = DAT_00202744;
    uVar12 = load_tmflat_gr(s_tmflat_00085a0c,0x170,0x10);
    /* DAT_00202738 is snapshotted AFTER this call, i.e. it's the base for whatever loads NEXT
       (LFTI.GR, see s_lfti_000859fc), not TMOBJ's own base -- confirmed by instrumenting this exact
       spot (DAT_00202744 went 643 -> 681 across the load_gr_resource_group call below)... */
    uVar13 = load_gr_resource_group(s_tmobj_00085a04);
    DAT_00202738 = DAT_00202744;
    uVar14 = load_hud_icon_gr(s_lfti_000859fc);
    uVar15 = load_hud_icon_gr(s_flasks_000859f4);
    uVar16 = load_hud_icon_gr(s_compass_000859ec);
    uVar17 = load_hud_icon_gr(s_dragons_000859e4);
    uVar18 = load_hud_icon_gr(s_inv_000859e0);
    uVar19 = load_hud_icon_gr(s_power_000859d8);
    uVar20 = load_hud_icon_gr(s_eyes_000859d0);
    uVar21 = load_hud_icon_gr(s_chains_000859c8);
    uVar22 = load_hud_icon_gr(s_spells_000859c0);
    uVar23 = load_hud_icon_gr(s_scrledge_000859b4);
    uVar24 = load_hud_icon_gr(s_optb_000859ac);
    if ((uVar23 & uVar24 & uVar22 & uVar21 & uVar20 & uVar19 & uVar18 & uVar17 & uVar16 & uVar15 &
         uVar14 & uVar13 & uVar12 & uVar11 & uVar10 & uVar9 & uVar8 & uVar7 & uVar6 & uVar5 & 1) ==
        0) {
      uVar4 = 0x3004;
    }
    else {
      DAT_00085988 = DAT_00085988 + '\x01';
      DAT_0024fa28 = DAT_0024d000 + '\t';
      iVar3 = load_critter_association_tables(1);
      if (iVar3 == 0) {
        uVar4 = 0x3009;
      }
      else {
        uVar4 = 0;
      }
    }
  }
  return uVar4;
}


// was FUN_00049924 -- ORs param_1's bits into the pending-update flag word DAT_00201c84, consumed
// elsewhere to decide what needs redrawing/reprocessing this tick. Callers pass everything from a
// single bit (2, 0x400, 10) up to near-all-bits requests (0x7dfe/0x7ffe) for a full redraw.
void set_pending_update_flags(ushort flags)
{
  DAT_00201c84 = DAT_00201c84 | flags;
}


// was thunk_FUN_0003c310 -- a Ghidra-generated "thunk" duplicate of show_error_dialog_stub
// (identical empty body, a separate call site decompiled as a second copy). Collapsed to a real
// call to avoid the duplication.
void show_error_dialog_stub_thunk()

{
  show_error_dialog_stub();
  return;
}

// Extracted (unit-testing-framework merge) from the chargen "New Game" branch below -- the same
// \DATA\lev.ark -> \SAVE0\lev.ark seeding sequence inlined there originally, pulled into its own
// testable function.
bool prepare_new_game()
{
    g_new_game_entry_pause_pending = false;
    if (!character_generator_start()) return false;
    return start_game_with_current_character();
}

// Unit-test harness version of prepare_new_game: the same new-game sequence, but the character is
// the real initializer's default one (no chargen UI); pre_game_start gets to adjust it first.
bool start_headless_new_game()
{
    g_new_game_entry_pause_pending = false;
    init_new_character_record(1);
    ce_strncpy(DAT_00086df8, "Test Avatar", 0x1d);
    load_weapon_combat_maneuver_data();
    uw_test_hook_pre_game_start();
    return start_game_with_current_character();
}

// The part of starting a new game that follows character creation: saves the character, seeds
// \SAVE0\lev.ark from \DATA\lev.ark, loads level 1 and places the player.
bool start_game_with_current_character()
{
    char save_directory[264];
    char destination_path[264];
    undefined1 source_copy_path[520];
    undefined1 destination_copy_path[520];
    char *converted_path;
    char *source;
    char *destination;

    ce_memset(save_directory, 0, 0x104);
    source = (char *)&DAT_0023cca8;
    destination = save_directory;
    do {
        *destination++ = *source;
    } while (*source++ != '\0');
    ce_strcat(save_directory, (char *)&DAT_000857a0);
    ensure_save_directory_exists(save_directory);
    write_player_save_record(save_directory);

    ce_memset(save_directory, 0, 0x104);
    source = (char *)&DAT_0023cca8;
    destination = save_directory;
    do {
        *destination++ = *source;
    } while (*source++ != '\0');
    ce_strcat(save_directory, s__DATA_lev_ark_00085734);
    converted_path = (char *)load_string_resource(save_directory);
    ce_wcscpy(source_copy_path, converted_path);

    ce_memset(destination_path, 0, 0x104);
    source = (char *)&DAT_0023cca8;
    destination = destination_path;
    do {
        *destination++ = *source;
    } while (*source++ != '\0');
    ce_strcat(destination_path, s__SAVE0_lev_ark_000842fc);
    converted_path = (char *)load_string_resource(destination_path);
    ce_wcscpy(destination_copy_path, converted_path);
    if (!CopyFileW(source_copy_path, destination_copy_path, 0)) return false;

    {
        int seed_status = seed_conversation_globals_for_new_game();
        if (seed_status != 0) {
            report_fatal_error_and_exit(seed_status);
            return false;
        }
    }
    if (load_level(1) < 1) return false;

    set_player_tile_position(0x20, 2, 1);
    debug_print_player_position("chargen-spawn");
    save_or_restore_level_special_state(1, 0);
    /* Port-only timing: the next dungeon entry pauses after its fade-out. */
    g_new_game_entry_pause_pending = true;
    return true;
}

// Added by the unit-testing-framework merge, alongside prepare_new_game.
void begin_gameplay()
{
    pop_cursor_icon(3);
    cursor_show_idle_tick();
    set_game_mode(1);
    set_pending_update_flags(0x7ffe);
    DAT_000868d8 = 0;
}


// was FUN_0003bc40
void set_game_mode(int mode)
{
  *(char *)(DAT_00085a6c + 8) = (char)mode;
  *(char *)(DAT_00085a6c + 9) = (char)((uint)mode >> 8);
  /* The real game mode lives at BYTE offset 8 of the DAT_00085a6c struct (== DAT_00085a6c[4] with
     its `short *` typing) -- that is what the 0x3bc40 disasm writes (`strb [buf,#8]` / `[buf,#9]`)
     and what the keybinding dispatcher dispatch_key_binding reads (`ldrb [state,#8]`). */
  DAT_00085a6c[4] = (short)mode;
  DAT_00201b60 = (short)mode;
  if ((short)DAT_00201b60 != 1) {
    if ((short)DAT_00201b60 == 2) {
      DAT_00201b64 = 1;
      goto LAB_0003bcb0;
    }
    if ((short)DAT_00201b60 == 4) {
      DAT_00201b64 = 2;
      goto LAB_0003bcb0;
    }
  }
  DAT_00201b64 = 0;
LAB_0003bcb0:
  reset_cursor_confine_rect();
}



// was FUN_0003bcb8
void change_game_mode(int mode)
{
  code *pcVar1;
  bool bVar2;
  
  pcVar1 = (code *)0;
  /* Was `pcVar1 != (code *)0xffffffff` -- a 32-bit-pointer-sentinel idiom that's broken on this
     64-bit host even after fixing DAT_00201b64's own signedness above: `pcVar1` sign-extends from a
     negative `int` to a full 64-bit all-ones pointer... */
  bVar2 = DAT_00201b64 != -1;
  if (bVar2) {
    /* 0x80 = 16 entries/mode * 8 bytes/entry (real pointer size) -- was
       0x40 (*4-byte entries), see DAT_00085668's comment. */
    pcVar1 = *(code **)(&DAT_000856a4 + (int)DAT_00201b64 * 0x80);
  }
  if (bVar2 && pcVar1 != (code *)0x0) {
    (*pcVar1)();
  }
  if ((short)mode < 0) {
    mode = (int)DAT_00201c94;
  }
  else {
    DAT_00201c94 = (short)DAT_00201b60;
  }
  set_game_mode(mode);
  /* 0x80, see DAT_00085668's comment. */
  if ((DAT_00201b64 != -1) && (*(code **)(&DAT_00085668 + DAT_00201b64 * 0x80) != (code *)0x0)) {
    (**(code **)(&DAT_00085668 + DAT_00201b64 * 0x80))();
  }
  if ((short)mode != 1) {
    set_pending_update_flags(0x7ffe);
  }
}


void *opbtn_gr_bump_alloc_entry(unsigned int byte_count)
{
  /* Same allocator-callback role as gr_resource_bump_alloc_entry/hud_icon_gr_bump_alloc_entry/
     decode_gr_entry_bump_alloc_entry (load_gr_resource_entries's param_4, "Ghidra couldn't resolve
     this address" -- see their comments)... */
  return ce_malloc(byte_count);
}

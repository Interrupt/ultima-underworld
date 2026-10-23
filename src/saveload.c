/* Save/load: the slot-list menu (draw, "journey onward" selection), slot probing, the actual game
   save/load, and the low-level .ark archive I/O primitives (open/close/read-entry/write-entry)
   those and the level loader build on. */
#include "headers/saveload.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

static char s__arc_tmp_000842b4[] = "_arc.tmp";
/* Not `static` -- also used by saveload.c (open_level_archive,
   close_level_archive, write_archive_entry, read_archive_entry); see the
   extern declarations and macro aliases in uw.h. */
/* Sizing-audit pass: investigated, NOT shrunk -- flagged as a caution, not a confirmed-safe target. */
static undefined DAT_000b78b8_backing[8192];
#define DAT_000b78b8 DAT_000b78b8_backing[0]
/* Sizing pass: DAT_000b98b8 and DAT_000b98b9's real ARM addresses are exactly 1 byte apart
   (0xb98b8/0xb98b9), and every real use confirms they're one combined buffer, not two independent
   ones... */
static undefined1 DAT_000b98b8_backing[1024];
#define DAT_000b98b8 DAT_000b98b8_backing[0]
/* Archive name followed by NUL and the temporary-file name. */
#define DAT_000b98b9 DAT_000b98b8_backing[1]
/* Sizing pass: this is a file-copy scratch buffer, read in chunks explicitly clamped to 0x2000
   (8192) bytes right before every read into it (see the `if (0x2000 < uVar12) uVar12 = 0x2000;`
   clamp and the sibling fixed-0x2000 read_file_handle call a few lines below it)... */
static undefined1 DAT_000b58b8_backing[8448];
#define DAT_000b58b8 DAT_000b58b8_backing[0]
char s__SAVE0_lev_ark_000842fc[] = "\\SAVE0\\lev.ark";
// was DAT_002028c8
char *g_save_record_buffer;
short DAT_002046f0;
/* Was zero-initialized (C default, no initializer) -- confirmed via Ghidra headless memory dump
   (0x868dc) that the real binary's own .data has this at 7, not 0. */
undefined2 DAT_000868dc = 7;
/* Was a bare 1-byte `undefined` scalar -- draw_save_load_slot_list takes its address and passes it
   straight to message_scroll_print_wrapped as the save- slot IV label, so it needs to be a real
   string, not a scalar. */
// was DAT_0008705c
static char s_IV__0008705c[] = "IV- ";
/* Was `"III-"` -- missing its trailing space, confirmed via the same
   memory dump (0x87064: "III- ", not "III-"). */
static char s_III__00087064[] = "III- ";
/* Same fix as s_IV__0008705c above: real bytes at 0x8706c are "II- ". */
// was DAT_0008706c
static char s_II__0008706c[] = "II- ";
/* Same fix as s_IV__0008705c above: real bytes at 0x87074 are "I- ". */
// was DAT_00087074
static char s_I__00087074[] = "I- ";
/* Same reused-global-holding-a-real-string pattern as s_scroll_newline_0008522c above: a Ghidra
   memory dump of the original binary at 0x87038 shows the real bytes are `5c 30 00` -- the string
   "\0" (a literal backslash+'0' control code, not an escape byte)... */
// was DAT_00087038
static undefined s_scroll_color_reset_00087038_backing[8192] = "\\0";
#define s_scroll_color_reset_00087038 s_scroll_color_reset_00087038_backing[0]
/* Was `"\\6_Save_Game_Descriptions"` -- underscores standing in for whitespace, matching Ghidra's
   own auto-generated symbol name for this string rather than its real recovered bytes... */
static char s__6_Save_Game_Descriptions_0008703c[] = "\\6    Save Game Descriptions";
static char s__DATA_OPSCR_BYT_00086efc[] = "\\DATA\\OPSCR.BYT";
/* Was `"<not_used_yet>"` -- underscores standing in for the real spaces (same garbled-placeholder
   class as the save-descriptions header string above and the save-name prompt fixed earlier this
   session). */
static char s__not_used_yet__00087020[] = "<not used yet>";
/* Was zero-initialized -- see DAT_000857a0's comment above. probe_save_slots appends this to
   DAT_000857a0 ("\SAVE0") to build each save-slot probe path, then substitutes the '0' with
   '1'..'4'... */
/* Sizing-audit pass: confirmed 5-char content ("\desc"), no
   indexing. Sized to 16; down from 8192. */
static undefined DAT_00087030_backing[16] = "\\desc";
#define DAT_00087030 DAT_00087030_backing[0]
static char s__PLAYER_DAT_00087088[] = "\\PLAYER.DAT";
/* Was `"Please_enter_a_Save_Game_file_an"` -- a garbled placeholder that just echoed this string's
   own auto-generated symbol name (underscores for spaces, truncated at Ghidra's naming-length cap)
   instead of the real recovered text... */
static char s_Please_enter_a_Save_Game_file_an_00087094[] = "  Please enter a Save Game file and press Enter\n";
static char s__SAVE0_desc_00087078[] = "\\SAVE0\\desc";
/* Sizing-audit pass: a directory-scan path suffix, appended once before a FindFirstFile-style scan.
   Real content confirmed via direct Ghidra memory export of UU.exe: "\". Sized to 32 for headroom;
   down from 8192. */
static undefined DAT_00087084_backing[32] = "\\";
#define DAT_00087084 DAT_00087084_backing[0]
/* Was zero-initialized -- see DAT_000857a0's comment above. ensure_save_directory_exists appends
   this to a directory path before scanning it with the FindFirstFileW/181
   FindFirstFile/FindNextFile-shaped ordinals... */
/* Sizing-audit pass: confirmed 4-char content ("\*.*"), no indexing.
   Sized to 16; down from 8192. */
static undefined DAT_000870c8_backing[16] = "\\*.*";
#define DAT_000870c8 DAT_000870c8_backing[0]






// was FUN_000567ec
void draw_save_load_slot_list()
{
  int iVar1;
  undefined1 auStack_c4 [8];
  char *local_bc [4];
  undefined1 auStack_ac [160];
  
  redraw_pause_menu_icon(2);
  DAT_002046f0 = 0xffff;
  update_pause_submenu_highlight(5,0x1e);
  if (DAT_000868dc == 1) {
    redraw_pause_submenu_icon(6,0x2e);
  }
  local_bc[0] = s_I__00087074;
  local_bc[1] = s_II__0008706c;
  local_bc[2] = s_III__00087064;
  local_bc[3] = s_IV__0008705c;
  msg_scroll_panel_reset(1);
  probe_save_slots((char *)auStack_ac,(ushort *)auStack_c4);
  /* g_text_use_palette_color gates whether draw_text_string honours g_draw_color_index at all (see
     that global's own comment) -- confirmed via disassembly that neither
     message_scroll_print_wrapped nor msg_scroll_draw_wrapped_span... */
  int _saved_text_palette_color = g_text_use_palette_color;
  g_text_use_palette_color = 1;
  message_scroll_print_wrapped(s__6_Save_Game_Descriptions_0008703c);
  iVar1 = 0;
  g_scroll_control_codes_enabled = 0;
  do {
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    message_scroll_print_wrapped(local_bc[iVar1]);
    message_scroll_print_wrapped(auStack_ac + iVar1 * 0x28);
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 4);
  g_scroll_control_codes_enabled = 1;
  message_scroll_print_wrapped(&s_scroll_color_reset_00087038);
  g_text_use_palette_color = _saved_text_palette_color;
}




// was FUN_0006b178.
int journey_onward_load_slot_menu()
{
  char stack0xffdc3198_buf [256];
  char *stack0xffdc3198_ptr;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  char *pcVar_str;  /* was folded into uVar5 (`undefined4`, this function's own 0/1/-1 return-code variable), truncating
   the real get_message_string() string pointer it also briefly held -- same "reused scalar" bug
   already fixed elsewhere this session (see dispatch_object_action's uVar11 comment) */
  short sVar6;
  uint uVar7;
  int iVar8;
  char *pcVar9;
  uint uVar10;
  undefined4 auStack_201d0 [32766];
  short local_1d8 [4];
  /* Was `undefined4 local_1d0 [4]`, storing real char* pointers into
     4-byte slots (see draw_menu_item_list's param_3!=0 branch, which reads this
     array as an 8-byte-stride char** table). Widened to match. */
  char *local_1d0 [4];
  char acStack_1c0 [264];
  /* Was `char acStack_b8 [38]` -- another Ghidra stack-frame-size miscalculation (same bug class
     fixed elsewhere this session). probe_save_slots unconditionally writes 4 fixed-width
     0x28(40)-byte records into whatever buffer its param_1 points at... */
  char acStack_b8 [160];
  char local_92 [122];
  
  decrement_cursor_hide_depth();
  ce_memset(acStack_1c0,0,0x104);
  pcVar9 = &DAT_0023cca8;
    stack0xffdc3198_ptr = stack0xffdc3198_buf;
  pcVar3 = pcVar9;
    stack0xffdc3198_ptr = acStack_1c0;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc3198_ptr = cVar1; stack0xffdc3198_ptr = stack0xffdc3198_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_1c0,s__DATA_OPSCR_BYT_00086efc);
  blit_fullscreen_bitmap_file(0xffffffff,acStack_1c0,1);
  cursor_show_idle_tick();
  probe_save_slots(acStack_b8,local_1d8);
  iVar4 = 0;
  uVar10 = (uint)local_1d8[0];
  uVar7 = 0;
  do {
    if ((uVar10 & 1 << (uVar7 & 0xff)) != 0) {
      /* Was `local_92 + uVar7 * 0x28` -- local_92 is a separate, never-written 122-byte stack local
         (too small for this indexing past uVar7==2 anyway)... */
      for (pcVar3 = acStack_b8 + uVar7 * 0x28 + 0x27;
          (*pcVar3 == ' ' && (acStack_b8 + uVar7 * 0x28 < pcVar3)); pcVar3 = pcVar3 + -1) {
      }
      pcVar3[1] = '\0';
      local_1d0[(short)iVar4] = acStack_b8 + uVar7 * 0x28;
      iVar4 = ((short)iVar4 + 1) * 0x10000 >> 0x10;
    }
    uVar7 = (int)((uVar7 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar7 < 4);
  sVar2 = menu_button_list_navigate(iVar4,local_1d0,1,0);
  if (sVar2 < 0) {
    uVar5 = 0;
  }
  else {
    sVar6 = -1;
    iVar4 = -1;
    if (sVar2 != -1) {
      do {
        uVar7 = (int)(short)iVar4 + 1;
        if (((int)local_1d8[0] & 1 << (uVar7 & 0xff)) != 0) {
          sVar6 = sVar6 + 1;
        }
        iVar4 = (int)(uVar7 * 0x10000) >> 0x10;
      } while (sVar6 != sVar2);
    }
    decrement_cursor_hide_depth();
    ce_memset(acStack_1c0,0,0x104);
    do {
      cVar1 = *pcVar9;
      *stack0xffdc3198_ptr = cVar1; stack0xffdc3198_ptr = stack0xffdc3198_ptr + 1;
      pcVar9 = pcVar9 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_1c0,s__DATA_OPSCR_BYT_00086efc);
    blit_fullscreen_bitmap_file(0xffffffff,acStack_1c0,1);
    /* Was `uVar5 = get_message_string(0x301);` -- get_message_string returns a real char*, but
       uVar5 is this function's own `undefined4` 0/1/-1 return-code variable... */
    pcVar_str = (char *)get_message_string(0x301);
    select_active_font(s_fontbig_sys_0008432c);
    *g_draw_color_index = 0xa2;
    *DAT_00084298 = 0xa2;
    sVar2 = measure_text_width(pcVar_str);
    iVar8 = -(int)sVar2 + 0x140;
    if (iVar8 < 0) {
      iVar8 = -(int)sVar2 + 0x141;
    }
    draw_text_string(pcVar_str,(short)(iVar8 >> 1) + 10,0x5a);
    select_active_font(s_font5x6p_sys_0008430c);
    /* Was `load_game_from_slot(iVar4 + 1)` -- load_game_from_slot is "Save Game" (copies the live
       \SAVE0 session INTO the chosen slot), which makes no sense from the title screen where no
       game is running yet... */
    {
      char loadsrc[300];
      snprintf(loadsrc, sizeof(loadsrc), "\\SAVE%d", iVar4 + 1);
      iVar4 = copy_save_slot_files(&DAT_000857a0, loadsrc);
    }
    if (iVar4 == 0) {
      uVar5 = 0xffffffff;
    }
    else {
      load_player_save_record(&DAT_000857a0);
      /* DAT_00201b68 (current level) isn't meaningfully set yet at a fresh title screen with no
         dungeon loaded -- unlike load_game_from_slot's own use of it, which only ever runs
         mid-game. */
      sVar2 = load_level(1);
      if (sVar2 != 0) {
        save_or_restore_level_special_state(1,3);
        /* Was a hardcoded set_player_tile_position(0x20,2,1) here -- worked around load_level
           leaving the player at tile (0,0) (unplaced, black 3D view) because the save/load path
           never actually wrote the live player position into \SAVE0\lev.ark to begin with... */
      }
      load_weapon_combat_maneuver_data();
      uVar5 = 1;
    }
  }
  return uVar5;
}




// was FUN_0006bde0. Fills param_1 with 4 fixed-width 0x28-byte records
// (each slot's "desc" file text, space-padded, or a "not used yet"
// placeholder) and *param_2 with a bitmask of which slots are real.
void probe_save_slots(char *slot_descriptions, ushort *used_mask)
{
  char stack0xffdc3230_buf [256];
  char *stack0xffdc3230_ptr;
  char cVar1;
  char *pcVar2;
  undefined1 *puVar3;
  int iVar4;
  uint uVar5;
  char acStack_128 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3230_ptr = acStack_128;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_128,&DAT_000857a0);
  puVar3 = (undefined1 *)ce_strchr(acStack_128,0x30);
  ce_strcat(acStack_128,&DAT_00087030);
  *used_mask = 0;
  uVar5 = 0;
  do {
    /* DAT_000857a0/DAT_00087030 are both unrecoverable string constants (no content Ghidra could
       recover) -- puVar3 (a '0' placeholder digit position within the built path)... */
    if (puVar3 != (undefined1 *)0x0) {
    *puVar3 = (char)((uVar5 + 0x31) * 0x1000000 >> 0x18);
    }
    iVar4 = win_file_exists(acStack_128,0);
    if ((iVar4 != -1) && (iVar4 = open_file_for_read(acStack_128), iVar4 != -1)) {
      /* Pad the record with spaces before reading the real "desc" file text over the front of it --
         journey_onward_load_slot_menu's caller trims trailing spaces off this record to find where
         the real text ends... */
      ce_memset(uVar5 * 0x28 + slot_descriptions,0x20,0x28);
      read_file_handle(iVar4,uVar5 * 0x28 + slot_descriptions,0x27);
      *used_mask = *used_mask | (ushort)(1 << (uVar5 & 0xff));
      CloseHandle(iVar4);
    }
    if (((int)(short)*used_mask & 1 << (uVar5 & 0xff)) == 0) {
      pcVar2 = s__not_used_yet__00087020;
      do {
        cVar1 = *pcVar2;
        /* Was `pcVar2[uVar5*0x28 + -0x87020 + slot_descriptions]` -- `-0x87020` hardcoded
           s__not_used_yet__00087020's address in the ORIGINAL 32-bit binary's fixed layout... */
        slot_descriptions[uVar5 * 0x28 + (pcVar2 - s__not_used_yet__00087020)] = cVar1;
        pcVar2 = pcVar2 + 1;
      } while (cVar1 != '\0');
    }
    uVar5 = (int)((uVar5 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar5 < 4);
}




// was FUN_0006c0c0
int load_game_from_slot(char slot_digit)
{
  char *wptr_50330;
  char stack0xffdc2d28_buf [256];
  char *stack0xffdc2d28_ptr;
  char stack0xffdc2e30_buf [256];
  char *stack0xffdc2e30_ptr;
  char cVar1;
  short sVar2;
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating
     load_string_resource's real pointer -- same class as that
     function's own fix. */
  char *uVar3;
  int iVar4;
  char *pcVar5;
  char *pcVar6;
  char acStack_85df0 [546720];
  char acStack_650 [32];
  char acStack_630 [264];
  char acStack_528 [264];
  undefined1 auStack_420 [520];
  undefined1 auStack_218 [520];
  
  pcVar6 = &DAT_000857a0;
    wptr_50330 = acStack_85df0;
  do {
    cVar1 = *pcVar6;
    *wptr_50330 = cVar1; wptr_50330 = wptr_50330 + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  /* Ghidra never emitted the copy of DAT_000857a0 into acStack_650 before searching it below --
     acStack_650 was read while still uninitialized stack garbage, so the '0' substitution below
     found a random byte (or nothing) instead of the real "SAVE0" digit. */
  pcVar6 = &DAT_000857a0;
  wptr_50330 = acStack_650;
  do {
    cVar1 = *pcVar6;
    *wptr_50330 = cVar1; wptr_50330 = wptr_50330 + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  pcVar6 = (char *)ce_strchr(acStack_650,0x30);
  pcVar5 = &DAT_0023cca8;
    stack0xffdc2e30_ptr = stack0xffdc2e30_buf;
  /* Same DAT_000857a0-is-unrecoverable NULL risk as probe_save_slots above -- see its comment. Here
     the digit is a save-slot number (SAVE0, SAVE1, ...), so a NULL means this path build silently
     keeps whatever acStack_650 already had instead of crashing. */
  if (pcVar6 != (char *)0x0) {
  *pcVar6 = slot_digit + '0';
  }
  pcVar6 = pcVar5;
    stack0xffdc2d28_ptr = acStack_630;
  do {
    cVar1 = *pcVar6;
    *stack0xffdc2d28_ptr = cVar1; stack0xffdc2d28_ptr = stack0xffdc2d28_ptr + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_630,&DAT_000857a0);
  uVar3 = load_string_resource(acStack_630);
  ce_wcscpy(auStack_420,uVar3);
  /* Was `stack0xffdc2e30_ptr = stack0xffdc2e30_buf;` above -- a stack slot Ghidra split into two
     names (same bug class as the acStack_650 fix above), so this copy of DAT_0023cca8 landed in a
     buffer (stack0xffdc2e30_buf) that acStack_528 below never reads... */
  stack0xffdc2e30_ptr = acStack_528;
  do {
    cVar1 = *pcVar5;
    *stack0xffdc2e30_ptr = cVar1; stack0xffdc2e30_ptr = stack0xffdc2e30_ptr + 1;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_528,acStack_650);
  uVar3 = load_string_resource(acStack_528);
  ce_wcscpy(auStack_218,uVar3);
  print_scroll_message_by_id(0xa6);
  iVar4 = ensure_save_directory_exists(acStack_630);
  if (iVar4 != 0) {
    print_scroll_message_by_id(0xaa);
    /* Was copy_save_slot_files(acStack_528,acStack_630) -- i.e. (dest="\SAVEn", src="\SAVE0"),
       copying the ACTIVE SESSION onto the chosen slot -- a save-direction copy. */
    iVar4 = copy_save_slot_files(acStack_630,acStack_528);
    if (iVar4 != 0) {
      print_scroll_message_by_id(0xaa);
      /* An earlier session added a snprintf("Level %d", ...) write-back to this slot's desc file
         here, reasoning the decompile never reconstructed a "type a save description" prompt for
         Save, so Load should at least leave something non-blank behind. */
      reset_player_for_resurrection();
      iVar4 = load_player_save_record(&DAT_000857a0);
      if (iVar4 != 0) {
        print_scroll_message_by_id(0xaa);
        sVar2 = load_level((int)DAT_00201b68);
        if (sVar2 != 0) {
          save_or_restore_level_special_state((int)DAT_00201b68,3);
          print_scroll_message_by_id(0xaa);
          load_last_attacker_record();
          return 1;
        }
      }
    }
  }
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  return 0;
}



// was FUN_0006c264
/* Was `undefined4` -- truncates the real 64-bit buffer pointer handle_save_load_menu_action passes
   in (a pointer into its own auStack_ac local, see that function's comment). */
int save_game_to_slot(char slot_digit, char *description)
{
  char stack0xffdc2d20_buf [256];
  char *stack0xffdc2d20_ptr;
  char stack0xffdc2e28_buf [256];
  char *stack0xffdc2e28_ptr;
  char cVar1;
  short sVar2;
  char *pcVar3;
  int iVar4;
  /* BUG FIX (unit-testing-framework merge): was `undefined4`, truncating
     load_string_resource's (and ce_strcat's) real pointer -- same
     class as load_string_resource's own fix. */
  char *uVar5;
  int result;
  char *pcVar6;
  uint uVar7;
  char *pcVar8;
  char local_638 [264];
  char local_530 [264];
  undefined1 auStack_428 [520];
  undefined1 auStack_220 [520];
  
  save_last_attacker_record();
  pcVar8 = &DAT_0023cca8;
    stack0xffdc2d20_ptr = stack0xffdc2d20_buf;
  pcVar3 = pcVar8;
    stack0xffdc2e28_ptr = local_530;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc2e28_ptr = cVar1; stack0xffdc2e28_ptr = stack0xffdc2e28_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(local_530,&DAT_000857a0);
  pcVar3 = (char *)ce_strchr(local_530,0x30);
  /* Same DAT_000857a0-is-unrecoverable NULL risk as probe_save_slots above. */
  if (pcVar3 != (char *)0x0) {
  *pcVar3 = slot_digit + '0';
  pcVar3[1] = '\0';
  }
  msg_scroll_panel_reset(1);
  message_scroll_print_wrapped(s_Please_enter_a_Save_Game_file_an_00087094);
  /* Dropped 5th argument (max name length) -- confirmed via real ARM disassembly (0x6c2f8-0x6c30c:
     `mov r3,#0x1e; strh r3,[sp,#0]` pushes 0x1e as the 5th/stack arg immediately before the call). */
  sVar2 = scroll_text_entry_prompt(0,description,description,1,0x1e);
  if (((sVar2 != 0x1b) && (sVar2 != 1)) && (sVar2 != 2)) {
    message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    print_scroll_message_by_id(0xa7);
    iVar4 = 0;
    do {
      pcVar6 = local_530 + iVar4;
      local_638[iVar4] = *pcVar6;
      iVar4 = iVar4 + 1;
    } while (*pcVar6 != '\0');
    uVar5 = ce_strcat(local_638,s__PLAYER_DAT_00087088);
    iVar4 = win_file_exists(local_638,0);
    if (iVar4 == -1) {
      load_string_resource(local_530);
      RemoveDirectoryW();
      uVar5 = load_string_resource(local_530);
      iVar4 = CreateDirectoryW(uVar5,0);
      if (iVar4 < 0) goto LAB_0006c540;
    }
    ce_strcat(local_530,&DAT_00087084);
    iVar4 = ensure_save_directory_exists(local_530);
    if (iVar4 != 0) {
      ce_memset(local_638,0,0x104);
      pcVar6 = pcVar8;
    stack0xffdc2d20_ptr = local_638;
      do {
        cVar1 = *pcVar6;
        *stack0xffdc2d20_ptr = cVar1; stack0xffdc2d20_ptr = stack0xffdc2d20_ptr + 1;
        pcVar6 = pcVar6 + 1;
      } while (cVar1 != '\0');
      ce_strcat(local_638,s__SAVE0_desc_00087078);
      uVar7 = ce_strlen(description);
      iVar4 = write_buffer_to_file(description,local_638,(uVar7 & 0xffff) + 1);
      if (iVar4 != 0) {
        pcVar3[2] = '\0';
        print_scroll_message_by_id(0xaa);
        ce_memset(local_638,0,0x104);
        do {
          cVar1 = *pcVar8;
          *stack0xffdc2d20_ptr = cVar1; stack0xffdc2d20_ptr = stack0xffdc2d20_ptr + 1;
          pcVar8 = pcVar8 + 1;
        } while (cVar1 != '\0');
        ce_strcat(local_638,&DAT_000857a0);
        iVar4 = write_player_save_record(local_638);
        if (iVar4 != 0) {
          print_scroll_message_by_id(0xaa);
          iVar4 = commit_level_to_save_slot((int)DAT_00201b68);
          if (iVar4 != 0) {
            print_scroll_message_by_id(0xaa);
            uVar5 = load_string_resource(local_530);
            ce_wcscpy(auStack_428,uVar5);
            uVar5 = load_string_resource(local_638);
            ce_wcscpy(auStack_220,uVar5);
            /* Was copy_save_slot_files(local_638,local_530) -- i.e. (dest="\SAVE0", src="\SAVEn"),
               copying the CHOSEN SLOT back onto the active session. */
            iVar4 = copy_save_slot_files(local_530,local_638);
            if (iVar4 != 0) {
              message_scroll_print_wrapped(&s_scroll_color_reset_00087038);
              result = 1;
              goto LAB_0006c544;
            }
          }
        }
      }
    }
  }
LAB_0006c540:
  result = 0;
LAB_0006c544:
  msg_scroll_panel_reset(1);
  return result;
}



// was FUN_00015870
/* param_2 was dropped entirely -- declared with only 1 parameter but every caller passes 2 (the
   filename to open, e.g. s__SAVE0_lev_ark_000842fc). `ce_strcat(local_120);` (a strcat- shaped
   Ordinal used with an explicit 2-arg form everywhere else in this file) was being called with... */
bool open_level_archive(void *archive_handle, char *path)
{
  byte *archive = (byte *)archive_handle;  /* 16-byte handle record, addressed as bytes */
  char cVar1;
  char *pcVar2;
  char *pcVar9;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  bool bVar8;
  /* Was reusing `iVar3` (an int, otherwise a loop counter / file handle elsewhere in this function)
     to also hold ce_strrchr's (strrchr) return -- harmless while that ordinal was a dead `return
     0;` stub (see its own comment: fixed for real this session)... */
  char *pLastSlash;
  ushort local_230 [4];
  char local_228 [264];
  char local_120 [260];

  pcVar2 = path;
  pcVar9 = local_120;
  do {
    cVar1 = *pcVar2;
    *pcVar9 = cVar1; pcVar9 = pcVar9 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  iVar3 = 0;
  do {
    pcVar2 = local_120 + iVar3;
    local_228[iVar3] = *pcVar2;
    iVar3 = iVar3 + 1;
  } while (*pcVar2 != '\0');
  pLastSlash = (char *)ce_strrchr(local_228,0x5c);
  if (pLastSlash == 0) {
    local_228[0] = '\0';
  }
  else {
    pLastSlash[1] = 0;
  }
  ce_strcat(local_228,s__arc_tmp_000842b4);
  /* Was `open_existing_file_rw_alt(local_120)` -- opens read-only (uw_file_open_read). */
  iVar3 = open_existing_file_rw(local_120);
  if (iVar3 == -1) {
    bVar8 = false;
  }
  else {
    iVar4 = read_file_handle(iVar3,local_230,2);
    iVar5 = read_file_handle(iVar3,&DAT_000b78b8,(uint)local_230[0] << 2);
    uVar7 = (uint)local_230[0];
    iVar6 = open_existing_file_rw(local_228);
    *archive = (char)iVar3;
    archive[1] = (char)((uint)iVar3 >> 8);
    archive[4] = (char)iVar6;
    archive[10] = 0xb8;
    archive[2] = (char)((uint)iVar3 >> 0x10);
    archive[0xe] = 0;
    bVar8 = (iVar4 == 2 && iVar5 == uVar7 * 4) && iVar6 != -1;
    archive[3] = (char)((uint)iVar3 >> 0x18);
    archive[5] = (char)((uint)iVar6 >> 8);
    iVar3 = 0;
    archive[6] = (char)((uint)iVar6 >> 0x10);
    archive[7] = (char)((uint)iVar6 >> 0x18);
    archive[8] = (char)local_230[0];
    archive[9] = (char)(local_230[0] >> 8);
    archive[0xb] = 0x78;
    archive[0xc] = 0xb;
    archive[0xd] = 0;
    do {
      cVar1 = local_120[iVar3];
      (&DAT_000b98b8)[iVar3] = cVar1;
      iVar3 = iVar3 + 1;
    } while (cVar1 != '\0');
    iVar3 = ce_strlen(local_120);
    pcVar2 = local_228;
    do {
      cVar1 = *pcVar2;
      (&DAT_000b98b9)[iVar3 + (pcVar2 - local_228)] = cVar1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
  }
  return bVar8;
}



// was FUN_00015a58 -- finalizes and closes an open_level_archive handle: rewrites the entry-offset
// table header if the dirty flag (param_1+0xe) is set, closes both file handles, and commits the
// tmp-file rename back over the real archive name.
byte close_level_archive(void *archive_handle)
{
  uint *archive = (uint *)archive_handle;  /* 16-byte handle record, addressed as words */
  char cVar1;
  ushort uVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  bool bVar6;
  char acStack_118 [260];
  
  bVar6 = true;
  uVar2 = *(ushort *)(archive + 2);
  if (*(char *)((char *)archive + 0xe) != '\0') {
    iVar3 = seek_file_handle(*archive,2,0);
    iVar4 = write_file_handle(*archive,&DAT_000b78b8,(uVar2 & 0x3fff) << 2);
    bVar6 = iVar3 == 2 && iVar4 == (uVar2 & 0x3fff) * 4;
  }
  iVar4 = CloseHandle(*archive);
  CloseHandle(CONCAT13(*(undefined1 *)((char *)archive + 7),*(undefined3 *)(archive + 1)));
  iVar3 = ce_strlen(&DAT_000b98b8);
  pcVar5 = &DAT_000b98b9 + iVar3;
  char *path_start = pcVar5;
  do {
    cVar1 = *pcVar5;
    acStack_118[pcVar5 - path_start] = cVar1;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  close_file_handle(acStack_118);
  return bVar6 & (iVar4 != 0);
}



// was FUN_00015b94 -- write_archive_entry(handle, entry_index, src_buf, len): the write-side
// counterpart to read_archive_entry, resizing the archive's entry table when the new length doesn't
// fit the existing slot.
/* Was `undefined4` -- truncated the real 64-bit `DAT_002029cc` (the live object arena) pointer
   write_level_tilemap_to_archive passes in as the source buffer for the archive-entry write. */
bool write_archive_entry(void *archive_handle, uint entry_index, void *data, uint byte_count)
{
  uint *archive = (uint *)archive_handle;  /* 16-byte handle record, addressed as words */
  char cVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint *puVar7;
  int iVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  void *uVar11;
  uint uVar12;
  uint uVar13;
  char *pcVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  char local_338 [264];
  char acStack_230 [263];
  char acStack_129 [261];
  
  iVar8 = (entry_index & 0xffff) * 4;
  uVar16 = 0;
  /* archive+0xa..0xd held the literal 0x000b78b8 (&DAT_000b78b8's address in the original 32-bit
     binary) as the .ark entry-offset table pointer -- see read_archive_entry's matching comment.
     The table is a fixed global; use its real address. */
  uVar15 = *(uint *)((char *)&DAT_000b78b8 + iVar8);
  if ((entry_index & 0xffff) <= (uint)*(ushort *)(archive + 2)) {
    if (uVar15 == 0) {
      /* Zero offsets represent empty entries. An EOF offset for an
         empty note page would alias the next entry appended there. */
      if ((byte_count & 0xffff) == 0) return true;
      uVar4 = seek_file_handle(*archive,0,2);
      uVar15 = write_file_handle(*archive,data,byte_count & 0xffff);
      *(undefined1 *)((char *)archive + 0xe) = 1;
      *(undefined4 *)((char *)&DAT_000b78b8 + iVar8) = uVar4;
      return uVar15 == (byte_count & 0xffff);
    }
    iVar5 = seek_file_handle(*archive,0,2);
    uVar17 = iVar5 - *(int *)((char *)&DAT_000b78b8 + iVar8);
    if (*(ushort *)(archive + 2) != 0) {
      uVar12 = 0;
      do {
        uVar6 = *(uint *)((char *)&DAT_000b78b8 + uVar12 * 4);
        uVar13 = uVar6 - uVar15;
        if ((uVar15 < uVar6) && (uVar13 < uVar17)) {
          uVar17 = uVar13;
        }
        uVar12 = uVar12 + 1 & 0xffff;
      } while (uVar12 < *(ushort *)(archive + 2));
    }
    byte_count = byte_count & 0xffff;
    if (uVar17 != byte_count) {
      *(undefined1 *)((char *)archive + 0xe) = 1;
      seek_file_handle(CONCAT13(*(undefined1 *)((char *)archive + 3),
                            CONCAT12(*(undefined1 *)((char *)archive + 2),
                                     CONCAT11(*(undefined1 *)((char *)archive + 1),
                                              *(undefined1 *)archive))),0,0);
      seek_file_handle(archive[1],0,0);
      if (uVar15 != 0) {
        do {
          uVar12 = uVar15 - uVar16;
          if (0x2000 < uVar12) {
            uVar12 = 0x2000;
          }
          uVar2 = read_file_handle(*archive,&DAT_000b58b8,uVar12 & 0xffff);
          iVar5 = write_file_handle(archive[1],&DAT_000b58b8,uVar2);
          uVar16 = uVar16 + iVar5;
        } while (uVar16 < uVar15);
      }
      seek_file_handle(*archive,uVar17,1);
      while( true ) {
        sVar3 = read_file_handle(*archive,&DAT_000b58b8,0x2000);
        if (sVar3 == 0) break;
        /* ARM 0x15ebc retains the byte count in r2 for this write. */
        iVar5 = write_file_handle(archive[1],&DAT_000b58b8,(ushort)sVar3);
        uVar16 = uVar16 + iVar5;
      }
      write_file_handle(archive[1],data,byte_count);
      if (*(short *)(archive + 2) != 0) {
        uVar12 = 0;
        do {
          puVar7 = (uint *)((char *)&DAT_000b78b8 + uVar12 * 4);
          uVar6 = *puVar7;
          if (uVar6 != 0 && uVar15 < uVar6) {
            *puVar7 = uVar6 - (uVar17 & 0xffff);
          }
          uVar12 = uVar12 + 1 & 0xffff;
        } while (uVar12 < *(ushort *)(archive + 2));
      }
      pcVar14 = &DAT_000b98b8;
      *(uint *)((char *)&DAT_000b78b8 + iVar8) = byte_count == 0 ? 0 : uVar16;
      do {
        cVar1 = *pcVar14;
        /* ARM 0x15f94 uses sp+0x108: the archive-name buffer. */
        acStack_230[pcVar14 - (char *)&DAT_000b98b8] = cVar1;
        pcVar14 = pcVar14 + 1;
      } while (cVar1 != '\0');
      iVar8 = ce_strlen(&DAT_000b98b8);
      pcVar14 = &DAT_000b98b9 + iVar8;
      char *path_start = pcVar14;
      do {
        cVar1 = *pcVar14;
        local_338[pcVar14 - path_start] = cVar1;
        pcVar14 = pcVar14 + 1;
      } while (cVar1 != '\0');
      iVar8 = 0;
      do {
        cVar1 = local_338[iVar8];
        acStack_129[iVar8 + 1] = cVar1;
        iVar8 = iVar8 + 1;
      } while (cVar1 != '\0');
      iVar8 = ce_strlen(local_338);
      acStack_129[iVar8] = '_';
      CloseHandle(*archive);
      CloseHandle(archive[1]);
      close_file_handle(acStack_230);
      uVar4 = open_file_for_read(local_338);
      uVar9 = open_existing_file_rw(acStack_230);
      uVar10 = GetFileSize(uVar4,0);
      /* ARM 0x16098 forwards GetFileSize's return as malloc's size. */
      uVar11 = ce_malloc(uVar10);
      read_file_handle(uVar4,uVar11,uVar10);
      write_file_handle(uVar9,uVar11,uVar10);
      LocalFree(uVar11);
      CloseHandle(uVar4);
      CloseHandle(uVar9);
      close_file_handle(local_338);
      /* close_level_archive still needs to write the offset table. */
      uVar4 = open_existing_file_rw(acStack_230);
      *(char *)archive = (char)uVar4;
      *(char *)((char *)archive + 1) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)archive + 2) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)archive + 3) = (char)((uint)uVar4 >> 0x18);
      uVar4 = open_existing_file_rw(local_338);
      *(char *)(archive + 1) = (char)uVar4;
      *(char *)((char *)archive + 5) = (char)((uint)uVar4 >> 8);
      *(char *)((char *)archive + 6) = (char)((uint)uVar4 >> 0x10);
      *(char *)((char *)archive + 7) = (char)((uint)uVar4 >> 0x18);
      return true;
    }
    seek_file_handle(CONCAT13(*(undefined1 *)((char *)archive + 3),
                          CONCAT12(*(undefined1 *)((char *)archive + 2),
                                   CONCAT11(*(undefined1 *)((char *)archive + 1),*(undefined1 *)archive
                                           ))),uVar15,0);
    uVar15 = write_file_handle(*archive,data,byte_count);
    if (uVar15 == byte_count) {
      return true;
    }
  }
  return false;
}



// was FUN_0001613c
/* Was `undefined4`, truncating the real destination buffer pointer the callers pass
   (load_level_object_table: the malloc'd DAT_002029cc workspace; load_automap_reveal_from_archive:
   &DAT_000b99d0). */
short read_archive_entry(void *archive_handle, uint entry_index, void *buffer)
{
  uint *archive = (uint *)archive_handle;  /* 16-byte handle record, addressed as words */
  undefined2 uVar1;
  int iVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  
  /* archive+10 (bytes 0xa..0xd) held the literal address 0x000b78b8 -- &DAT_000b78b8's location in
     the ORIGINAL 32-bit binary -- baked in by open_level_archive as the .ark entry-offset table
     pointer. */
  if (((uint)*(ushort *)(archive + 2) < (entry_index & 0xffff)) ||
     (uVar6 = *(uint *)((char *)&DAT_000b78b8 + (entry_index & 0xffff) * 4), uVar6 == 0)) {
    uVar1 = 0;
  }
  else {
    iVar2 = seek_file_handle(*archive,0,2);
    uVar7 = iVar2 - uVar6;
    if (*(ushort *)(archive + 2) != 0) {
      uVar5 = 0;
      do {
        uVar3 = *(uint *)((char *)&DAT_000b78b8 + uVar5 * 4);
        uVar4 = uVar3 - uVar6;
        if (uVar3 <= uVar6) {
          uVar4 = 0;
        }
        if ((uVar4 != 0) && (uVar4 < uVar7)) {
          uVar7 = uVar4;
        }
        uVar5 = uVar5 + 1 & 0xffff;
      } while (uVar5 < *(ushort *)(archive + 2));
    }
    seek_file_handle(*archive,uVar6,0);
    uVar1 = read_file_handle(*archive,buffer,uVar7 & 0xffff);
  }
  return uVar1;
}




// was FUN_0001629c -- opens the archive at win path param_1 directly (bypassing
// open_level_archive/close_level_archive), seeks to entry param_2's slot in the entry-offset table,
// and reports whether it has a nonzero offset (1 = has data, 0 = empty slot, -1 = I/O error).
int probe_archive_entry_exists(char *path, uint entry_index)
{
  short sVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int local_14;

  iVar2 = open_file_for_read(path);
  if (iVar2 == -1) {
    iVar2 = -1;
  }
  else {
    iVar5 = (entry_index & 0xffff) * 4 + 2;
    iVar3 = seek_file_handle(iVar2,iVar5,0);
    iVar4 = read_file_handle(iVar2,&local_14,4);
    iVar2 = CloseHandle(iVar2);
    if ((iVar3 == iVar5 && iVar4 == 4) && iVar2 != 0) {
      if (local_14 == 0) {
        sVar1 = 0;
      }
      else {
        sVar1 = 1;
      }
    }
    else {
      sVar1 = -1;
    }
    iVar2 = (int)sVar1;
  }
  return iVar2;
}







// was FUN_0006bcd4 -- flushes the player's carried-inventory chain (freeing the live objects, since
// write_player_save_record just above already serialized them into the save buffer), then writes
// the current level's live tilemap+object arena to its on-disk archive.
int commit_level_to_save_slot(int level_number)
{
  return commit_level_to_archive(level_number, s__SAVE0_lev_ark_000842fc, 1);
}

/* The commit above for any archive path: writes the level's tile map and objects and its texture map into
   the archive (and the player's automap reveal too, when with_automap), taking the player out of the level and back
   in as a level change does. The level editor uses it to write an edited copy of DATA\LEV.ARK. */
int commit_level_to_archive(int level_number, char *archive_path, int with_automap)
{
  ushort uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined1 auStack_20 [16];
  
  write_player_save_record(0);
  /* Was `+ 3` -- confirmed wrong via Ghidra decompile of the real ARM binary (0x6bcd4): it passes
     `+ 6`. free_player_inventory_chain treats its argument as a pointer to a 2-byte object link
     field (it immediately calls resolve_object_link on it)... */
  free_player_inventory_chain((char *)g_player_object + 6);
  if (-1 < DAT_00202080) {
    object_list_unlink(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  }
  DAT_00202080 = 0xffff;
  uVar1 = g_player_object->hdr.type_flags;
  g_player_object->hdr.type_flags = (ushort)(uVar1 & 0xfe3f);
  iVar2 = open_level_archive(auStack_20,archive_path);
  uVar3 = 0;
  if (iVar2 != 0) {
    iVar2 = write_level_tilemap_to_archive(auStack_20,level_number);
    if (((iVar2 != 0) && (iVar2 = write_level_quest_flags_to_archive(auStack_20,level_number), iVar2 != 0)) &&
       (!with_automap || (iVar2 = save_automap_reveal_to_archive(auStack_20,level_number), iVar2 != 0))) {
      iVar2 = close_level_archive(auStack_20);
      uVar3 = 1;
      if (iVar2 != 0) goto LAB_0006bdbc;
    }
    uVar3 = 0;
  }
LAB_0006bdbc:
  load_player_save_record(0);
  return uVar3;
}



// was handle_save_load_menu_action -- save/load menu action dispatcher: param_1==0 saves to slot
// param_2 (save_game_to_slot), otherwise loads from it (load_game_from_slot; the middle
// "already-occupied slot" gate is disabled dead code -- see its own comment).
// was FUN_0006bfec
void handle_save_load_menu_action(short action, int slot)
{
  int iVar1;
  int iVar2;
  short local_b4 [4];
  undefined1 auStack_ac [160];

  probe_save_slots(auStack_ac,local_b4);
  if (action == 0) {
    /* Was `auStack_d4 + (short)slot * 0x28` into a phantom, separately -declared 32-byte
       `auStack_d4` local -- confirmed via real ARM disassembly (0x6c088-0x6c098) that no such
       buffer exists: the real code computes sp+8 + (slot-1)*0x28... */
    iVar1 = save_game_to_slot(slot,auStack_ac + ((short)slot - 1) * 0x28);
    iVar2 = 4;
    if (iVar1 != 0) {
      iVar2 = 5;
      /* load_game_from_slot's own success branch just below (the mirror Load path) calls
         load_weapon_combat_maneuver_data/sync_player_stats_to_hud/... */
      set_pending_update_flags(0x7ffe);
    }
  }
  else if (false) {
    /* Was `(1 << (slot-1) & local_b4[0]) == 0` -- local_b4[0] is the bitmask probe_save_slots
       just built of which of the 4 numbered slots already HAVE a save (bit set = a real
       "\SAVEn\desc" was found on disk)... */
    iVar2 = 1;
  }
  else {
    iVar1 = load_game_from_slot(slot);
    if (iVar1 == 0) {
      iVar2 = 3;
    }
    else {
      load_weapon_combat_maneuver_data();
      iVar2 = 2;
      sync_player_stats_to_hud();
      redraw_hud_panels();
      apply_movement_mode_profile(0xff);
      DAT_000858a0 = 1;
      set_pending_update_flags(0x7ffe);
    }
  }
  print_scroll_message_by_id(iVar2 + 0xa0);
}



// was ensure_save_directory_exists -- ensures the save-game directory exists: scans it via the
// FindFirstFileW/181 FindFirstFile/FindNextFile-shaped ordinals (appending DAT_000870c8's "\*.*"
// wildcard) and, if that scan finds nothing (directory missing or empty)...
// was FUN_0006c560
int ensure_save_directory_exists(char *path)
{
  char cVar1;
  short sVar2;
  int iVar3;
  char *uVar4;  /* was undefined4 -- truncated the real load_string_resource()
                   pointer to 32 bits, which FindFirstFileW now actually
                   dereferences (used to be a harmless no-op stub) */
  int iVar5;
  char *pcVar6;
  int iVar7;
  char *pcVar8;
  bool bVar9;
  bool bVar10;
  char acStack_348 [264];
  int local_240 [10];
  undefined1 auStack_218 [520];

  bVar9 = true;
  pcVar8 = acStack_348;
  do {
    cVar1 = *path;
    *pcVar8 = cVar1;
    pcVar8 = pcVar8 + 1;
    path = path + 1;
  } while (cVar1 != '\0');
  iVar3 = ce_strlen(acStack_348);
  ce_strcat(acStack_348,&DAT_000870c8);
  uVar4 = load_string_resource(acStack_348);
  iVar5 = FindFirstFileW(uVar4,local_240);
  bVar10 = iVar5 == -1;
  while (!bVar10) {
    if (local_240[0] != 0x10) goto LAB_0006c5f8;
    iVar7 = FindNextFileW(iVar5,local_240);
    bVar10 = iVar7 == 0;
  }
  bVar9 = false;
LAB_0006c5f8:
  if (bVar9) {
    /* Was a `do { ... } while (sVar2 != 0)` loop rebuilding the path from
       `load_string_resource_large(auStack_218)` each pass -- auStack_218 is never written anywhere
       in this function, so that read uninitialized stack memory as a string... */
    acStack_348[iVar3] = '\0';
    iVar7 = create_directory_path(acStack_348);
    if (iVar7 == 0) {
      return 0;
    }
  }
  return 1;
}






/* Was a generic "copy every file matching dest\*.* " directory-copy using
   CopyFileW/FindFirstFileW/FindNextFileW (CopyFileW/167/181) via wide-string paths built through
   ce_wcscat/61/63... */
// was FUN_0006c670
/* destination directory, e.g. "\SAVE3" source directory, e.g. "\SAVE0" */
int copy_save_slot_files(char *dest_dir, char *source_dir)
{
  /* Was a hardcoded 3-entry list missing "player.dat" entirely -- real ARM disassembly of this
     function (0x6c670) shows it's genuinely NOT a fixed-file-list copier at all: it calls what are
     clearly FindFirstFile/FindNextFile/CopyFile-equivalents (0x8203c/0x82150/ 0x81ff4)... */
  static const char *file_suffixes[] = { "\\lev.ark", "\\bglobals.dat", "\\player.dat", "\\desc" };
  char src[300];
  char dst[300];
  size_t i;
  int ok;

  ok = 1;
  for (i = 0; i < sizeof(file_suffixes) / sizeof(file_suffixes[0]); i++) {
    snprintf(src, sizeof(src), "%s%s", source_dir, file_suffixes[i]);
    snprintf(dst, sizeof(dst), "%s%s", dest_dir, file_suffixes[i]);
    /* desc is optional (a brand new character who has never saved/loaded
       before has no \SAVE0\desc yet) -- lev.ark/bglobals.dat/player.dat
       are not. */
    if (!uw_file_copy(src, dst) && i != 3) {
      ok = 0;
    }
  }
  return ok;
}


// was FUN_0007edf4 -- writes param_3 bytes from param_1 into the file named by param_2, always
// creating/truncating (via uw_file_open_write(param_2, 1)) rather than preserving existing
// content...
/* was `undefined4` -- truncated the real data-buffer pointer (save_game_to_slot passes its own
   param_2, a real description-text buffer; the new save-description write above passes a real
   stack buffer too) was `undefined4` -- same truncation, for the real path-string pointer */
bool write_buffer_to_file(void *buffer, char *filename, ushort byte_count)
{
  int iVar1;
  uint uVar2;
  bool bVar3;

  /* Was `open_existing_file_rw(filename)` (== uw_file_open_write(filename, 0), our port's "rb+",
     no-truncate" mode) -- real ARM disassembly of open_existing_file_rw (0x2273c) shows the
     original game's own write-open helper always ends up starting from an empty file... */
  iVar1 = uw_file_open_write(filename, 1);
  if (iVar1 == -1) {
    bVar3 = false;
  }
  else {
    uVar2 = write_file_handle(iVar1,buffer,byte_count);
    bVar3 = uVar2 == byte_count;
    CloseHandle(iVar1);
  }
  return bVar3;
}





// was FUN_000400dc -- gates save_game_to_slot's "can save now" check (confirmed via
// src/saveload.c's own comment on save_game_to_slot): refuses (printing a scroll warning) while the
// cursor is holding an object, or while on level 9 (the final/Abyss level)...
bool check_can_save_game()
{
  short sVar1;

  sVar1 = 0;
  if (g_cursor_holding_state != 0) {
    sVar1 = 0xa0;
  }
  if (DAT_00201b68 == 9) {
    sVar1 = 0x9f;
  }
  if (sVar1 != 0) {
    print_scroll_message_by_id(sVar1);
  }
  return sVar1 == 0;
}



// was FUN_00040130 -- gates load_game_from_slot's "can load now" check (src/saveload.c's own
// comment on load_game_from_slot confirms this "unconditional-allow" semantics): unlike
// check_can_save_game, never refuses -- just releases any cursor-held object first...
int check_can_load_game()
{
  if (g_cursor_holding_state != 0) {
    g_cursor_holding_state = 0;
    pop_cursor_icon(0);
  }
  return 1;
}


// was FUN_00044624 -- dual-purpose player-save loader: given a real path (load_game_from_slot
// passes &DAT_000857a0, the chosen slot's directory), opens that slot's player.dat, reads the
// player status block and save-record buffer from it...
/* was `int` -- truncated the real DAT_000857a0 pointer load_game_from_slot passes in (the
   save-slot-copy path), which only started actually running once the save-directory- creation
   fixes above stopped it from bailing out earlier. */
int load_player_save_record(char *slot_dir)
{
  char stack0xffdc3234_buf [256];
  char *stack0xffdc3234_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  char acStack_124 [260];
  
  uVar4 = 1;
  if ((slot_dir != 0) && (-1 < DAT_00202080)) {
    object_list_unlink(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  }
  close_panels_before_level_change();
  if ((g_save_record_buffer == 0) && (g_save_record_buffer = ce_malloc(0x4000), g_save_record_buffer == 0)) {
    return 0;
  }
  if (slot_dir != 0) {
    pcVar2 = &DAT_0023cca8;
    stack0xffdc3234_ptr = acStack_124;
    do {
      cVar1 = *pcVar2;
      *stack0xffdc3234_ptr = cVar1; stack0xffdc3234_ptr = stack0xffdc3234_ptr + 1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_124,slot_dir);
    ce_strcat(acStack_124,s_player_dat_00085a74);
    iVar3 = open_file_for_read(acStack_124);
    if (iVar3 == -1) {
      uVar4 = 0;
      goto LAB_00044730;
    }
    /* BUG FIX: was `read_player_status_block()` with no arguments, relying on leftover register
       state -- iVar3 (the file handle, used the very next line) is the value that belongs here... */
    read_player_status_block(iVar3);
    read_file_handle(iVar3,&g_save_record_count,2);
    read_file_handle(iVar3,g_save_record_buffer,g_save_record_count * 8 + 0x5b + 220);
    CloseHandle(iVar3);
    reload_paperdoll_body_sprite();
  }
  restore_player_save_record(g_save_record_buffer);
  refresh_player_equipment_effects();
LAB_00044730:
  if (g_save_record_buffer != 0) {
    LocalFree(g_save_record_buffer);
    g_save_record_buffer = 0;
  }
  if ((slot_dir != 0) && (-1 < DAT_00202080)) {
    object_list_insert_head(DAT_002029cc + DAT_00202080 * 4 + 2,g_player_object);
  }
  return uVar4;
}


// was FUN_00049b04 -- writes the level's tilemap/object arena (g_level_tiles) and scheduler state
// into a level archive: given param_1==NULL, opens its own fresh archive handle (for SAVE0, the
// live session) and closes it when done; given a real param_1...
int write_level_tilemap_to_archive(byte *archive, int level_number)
{
  bool bVar1;
  short sVar2;
  short sVar3;
  int iVar4;
  char *arena;
  undefined2 *puVar5;
  int iVar6;
  undefined1 *puVar7;
  undefined1 *puVar8;
  undefined1 auStack_20 [16];
  
  if (archive == (undefined1 *)0x0) {
    iVar4 = open_level_archive(auStack_20,s__SAVE0_lev_ark_000842fc);
    if (iVar4 == 0) {
      return 0;
    }
  }
  else {
    iVar4 = 0xf;
    puVar7 = archive;
    puVar8 = auStack_20;
    do {
      iVar6 = iVar4 + -1;
      *puVar8 = *puVar7;
      bVar1 = 0 < iVar4;
      iVar4 = iVar6;
      puVar7 = puVar7 + 1;
      puVar8 = puVar8 + 1;
    } while (iVar6 != 0 && bVar1);
  }
  arena = DAT_002029cc;
  puVar5 = (undefined2 *)(DAT_002029cc + 0x7c06);
  *(short *)(DAT_002029cc + 0x7c00) =
       (short)((uint)((DAT_002046c8 - DAT_002046c0) * 0x10000) >> 0x10);
  *(short *)(arena + 0x7c02) = (short)((DAT_002046a8 - DAT_002046a4) >> 1);
  *(short *)(arena + 0x7c04) = (short)((DAT_0020469c - DAT_002046bc) >> 1);
  *puVar5 = 0x7577;
  DAT_002029d0 = 0;
  sVar2 = write_archive_entry(auStack_20,level_number + -1,DAT_002029cc,0x7c08);
  sVar3 = 0;
  if (sVar2 != 0) {
    sVar3 = scheduler_save(auStack_20,level_number);
  }
  if (archive == (undefined1 *)0x0) {
    close_level_archive(auStack_20);
  }
  return (int)sVar3;
}


// was FUN_0005b298 -- assembles a fixed 0x7a-byte level-state block (quest-flag-shaped: three fixed
// .data regions, DAT_0023ae58/adb8/ b841+b840) and writes it to the level archive via
// write_archive_entry.
/* .ark handle-struct pointer -- was `undefined4`, truncating it before write_archive_entry. */
int write_level_quest_flags_to_archive(byte *archive, int level_number)
{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  /* Was three separate locals (local_8c[48], local_2c[10], local_18[6]) -- a stack-slot-splitting
     artifact (same bug class as stack0xffdc2e30_buf/acStack_528 in load_game_from_slot, or
     acStack_86af8/etc in load_dungeon_texture_arenas right below this function)... */
  undefined2 local_8c [64];

  iVar2 = 0;
  do {
    puVar5 = &DAT_0023ae58 + iVar2;
    puVar6 = local_8c + iVar2;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    *puVar6 = *puVar5;
  } while (iVar2 < 0x30);
  iVar2 = 0;
  do {
    puVar6 = &DAT_0023adb8 + iVar2;
    iVar3 = iVar2 + 0x30;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    local_8c[iVar3] = *puVar6;
  } while (iVar2 < 10);
  iVar2 = 0;
  do {
    iVar3 = iVar2 * 2;
    iVar1 = iVar2 * 2;
    iVar4 = iVar2 + 0x3a;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
    local_8c[iVar4] = CONCAT11((&DAT_0023b841)[iVar3],(&DAT_0023b840)[iVar1]);
  } while (iVar2 < 3);
  /* Was `write_archive_entry(...); return 0;` -- a fabricated `return 0` masking a real result,
     same bug class as scheduler_save right above this function. */
  return write_archive_entry(archive,level_number + 0x11,local_8c,0x7a);
}

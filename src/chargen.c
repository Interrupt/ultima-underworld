/* Character creation: the field-by-field state machine (choose sex, handedness, class, skills,
   portrait, difficulty, name, confirm), its resource-loading setup, and the critical-section entry
   wrapper. */
#include "headers/chargen.h"
#include "headers/options.h"
#include "headers/debug.h"

#define DAT_000fb860 DAT_000fb860_backing[0]
#define DAT_000fb863 DAT_000fb860_backing[3]
#define DAT_000fb8f0 DAT_000fb8f0_backing[0]
char *DAT_00086df8;
/* These 4 were zero-initialized "backing" buffers standing in for unrecovered string constants,
   passed straight into draw_text_string by draw_chargen_attribute_summary as the row labels for the
   4 values it draws. */
static undefined DAT_00084e40_backing[16] = "Vit:";
#define DAT_00084e40 DAT_00084e40_backing[0]
static undefined DAT_00084e48_backing[16] = "Int:";
#define DAT_00084e48 DAT_00084e48_backing[0]
static undefined DAT_00084e50_backing[16] = "Dex:";
#define DAT_00084e50 DAT_00084e50_backing[0]
static undefined DAT_00084e58_backing[16] = "Str:";
#define DAT_00084e58 DAT_00084e58_backing[0]
char *DAT_001005c8;
/* Was `undefined4` (4 bytes), but assigned real char* pointers (DAT_001005c4/DAT_001005c8)
   throughout the character-generation/ font-drawing subsystem and passed directly as
   bitmap_blit_to_framebuffer's char* source-bitmap param... */
static char *DAT_000fb858;
static char *DAT_001005c4;
/* Not `static` -- also used by chargen.c; see the extern declaration and
   DAT_000fb860 macro alias in uw.h. */
/* Sizing-audit pass: `ce_memmove(&DAT_000fb860,&DAT_000fb8f0,0x20)`
   -- exact 32-byte real need. Down from 256. */
static undefined1 DAT_000fb860_backing[32];
/* DAT_000fb863 aliases the bonus-pool byte in DAT_000fb860_backing. */
/* Was a lone `undefined4` scalar, but indexed as `(&DAT_000fb880)[idx]` (4-byte stride) with idx up
   to a CONCAT11 of two record byte fields (draw_chargen_field_value). */
/* Sizing-audit pass: chrbtns_offset_table_builder (the real populator) only ever writes idx 0..26
   (10 body-figure entries at 17-26, per DAT_000fb8c4's own comment below). */
undefined4 DAT_000fb880_backing[64];
/* These three were all mangled the same way: Ghidra rendered the embedded spaces as underscores. */
static char s_key_to_continue_00084e60[] = "key to continue";
static char s_then_press_the_Enter_00084e70[] = "then press the Enter";
static char s_Enter_your_name_and_00084e88[] = "Enter your name and";
static short DAT_001005c0;
/* DAT_000fb8c4's address (0xfb8c4) is 0x44 bytes = 17 elements past DAT_000fb880's (0xfb880) --
   like DAT_000fb884, not a separate table but an alias into the SAME cumulative per-entry offset
   array chrbtns_offset_table_builder builds for chrbtns.gr, viewed starting at element 17. */
/* Sizing-audit pass: investigated, NOT shrunk -- SKILLS.DAT+CHRGEN.DAT (the real shipped assets)
   only need 441 bytes together, which made a smaller size look safe, but
   tests/test_chargen.c:128-130 asserts against DAT_000fb8f0_backing[1000]/[1002]... */
static undefined1 DAT_000fb8f0_backing[1680];
char s_FONT5X6P_SYS_00084e9c[] = "FONT5X6P.SYS";
static char s__DATA_CHARGEN_BYT_00084eac[] = "\\DATA\\CHARGEN.BYT";
static char s_FONTCHAR_SYS_00084ec0[] = "FONTCHAR.SYS";
static char s__DATA_chrgen_dat_00084ed0[] = "\\DATA\\chrgen.dat";
static char s__DATA_skills_dat_00084ee4[] = "\\DATA\\skills.dat";
/* Was a zero-initialized array standing in for an unrecovered string constant (Ghidra had no
   content at this address, just a dangling reference -- see load_gr_resource_entries's comment). */
static char s_chrbtns_00084ef8[] = "chrbtns";



// The main character-generation state machine: steps through portrait/gender/skills/stats/name/confirm, one screen per state.
// was FUN_00024e24
/* CHRGEN.DAT's record stride differs between the two asset sets, and the
 * rest of this file hardcodes the Pocket PC one (0x14 records, text region
 * at 0xa0, used at twenty-odd sites). So normalise the DOS layout up to it
 * here, at the one place the file is read, rather than making the stride
 * dynamic everywhere.
 *
 * The two files hold identical data; only the record size differs:
 *
 *   Pocket PC  254 bytes   8 x 0x14 records, second field at +10
 *   DOS        238 bytes   8 x 0x12 records, second field at +8
 *
 * The port widened the +6 field -- where the loader below stores a real
 * pointer offset -- from two bytes to four, which pushed everything after
 * it along by two. Verified byte-for-byte across all eight records of both
 * shipped files: PPC[0..5] == DOS[0..5] and PPC[10..19] == DOS[8..17], with
 * PPC[6..9] zero on disk in both (the loader overwrites it anyway).
 *
 * Detected from the records themselves rather than from the file size:
 * each record's first field is its own one-based id, so reading 1,2,3,4 at
 * records 0-3 (record 4's id is 0) only happens at the right stride. Both
 * shipped files satisfy it at their own stride and fail at the other.
 *
 * Returns the (possibly grown) size; a file already in the port's layout,
 * or one matching neither, is left exactly as read. */
unsigned chargen_normalize_record_stride(unsigned char *buf, unsigned size, unsigned capacity)
{
  enum { RECORDS = 8, PPC_STRIDE = 0x14, DOS_STRIDE = 0x12 };

  if (!buf) {
    return size;
  }

  /* Each record's first field is its own id, 1-based, except record 4. */
  unsigned stride_ok = 0;
  if (size >= RECORDS * PPC_STRIDE) {
    stride_ok = 1;
    for (unsigned i = 0; i < RECORDS; i++) {
      unsigned v = (unsigned)buf[i * PPC_STRIDE] | ((unsigned)buf[i * PPC_STRIDE + 1] << 8);
      if (i != 4 && v != i + 1) { stride_ok = 0; break; }
    }
  }
  if (stride_ok) {
    return size; /* already the layout the rest of this file expects */
  }

  unsigned dos_ok = 0;
  if (size >= RECORDS * DOS_STRIDE) {
    dos_ok = 1;
    for (unsigned i = 0; i < RECORDS; i++) {
      unsigned v = (unsigned)buf[i * DOS_STRIDE] | ((unsigned)buf[i * DOS_STRIDE + 1] << 8);
      if (i != 4 && v != i + 1) { dos_ok = 0; break; }
    }
  }
  if (!dos_ok) {
    DEBUG(WARN, "[chargen] CHRGEN.DAT (%u bytes) matches neither the 0x14 nor the 0x12 "
                "record layout -- using it as read\n", size);
    return size;
  }

  const unsigned grow = RECORDS * (PPC_STRIDE - DOS_STRIDE);
  if (size + grow > capacity) {
    DEBUG(WARN, "[chargen] CHRGEN.DAT needs %u bytes converted but only %u are available "
                "-- using it as read\n", size + grow, capacity);
    return size;
  }

  /* Tail first (it moves up, so copy before the records overwrite it), then
   * the records backwards, since each one's destination is at or past its
   * source. */
  const unsigned tail = size - RECORDS * DOS_STRIDE;
  memmove(buf + RECORDS * PPC_STRIDE, buf + RECORDS * DOS_STRIDE, tail);
  for (int i = RECORDS - 1; i >= 0; i--) {
    unsigned char rec[DOS_STRIDE];
    memcpy(rec, buf + (unsigned)i * DOS_STRIDE, DOS_STRIDE);
    unsigned char *out = buf + (unsigned)i * PPC_STRIDE;
    memcpy(out, rec, 6);
    memset(out + 6, 0, 4);              /* the widened field, filled in below */
    memcpy(out + 10, rec + 8, DOS_STRIDE - 8);
  }

  DEBUG(INFO, "[chargen] CHRGEN.DAT is the DOS layout (%u bytes, 0x12 records) -- "
              "converted to 0x14 records (%u bytes)\n", size, size + grow);
  return size + grow;
}

int character_generator_loop(char *tree_data, char *scratch_data, char *field_records)
{
  uint uVar1;
  byte bVar2;
  byte bVar3;
  int iVar4;
  /* iVar4 doubles as the character record's name-string pointer field (read from pcVar_rec+6, a
     relative offset from &DAT_000fb8f0 -- see the write site in run_character_generator and
     draw_chargen_field_value's matching read-site comments) early in each state... */
  char *pcVar_name;
  char *pcVar5;
  /* iVar13 doubles as a "current character record" pointer (0x14-byte stride into field_records, computed
     fresh at the top of each state-machine iteration and consumed by
     draw_chargen_field_value/draw_chargen_field_options/wait_for_chargen_field_input)... */
  char *pcVar_rec;
  ulonglong uVar6;
  undefined1 uVar7;
  short sVar8;
  uint uVar9;
  /* Was `undefined4`, truncating get_message_string's real char* return
     before measure_text_width/draw_text_string use it as a pointer. */
  char *uVar10;
  int iVar11;
  undefined4 extraout_r1;
  undefined4 hi_word;
  undefined4 extraout_r1_00;
  undefined4 extraout_r1_01;
  int iVar12;
  int iVar13;
  int iVar14;
  ulonglong uVar15;
  byte local_64 [4];
  undefined4 local_60;
  char *pcVar_p2off;
  /* local_5c and local_58 were separate Ghidra locals (`undefined4 local_5c` + 6 more `undefined1
     local_58/57/56/55/54/53` scalars), but their names encode adjacent stack offsets (-0x5c then
     -0x58, 4 bytes apart) and the code writes across both as one flowing buffer... */
  undefined1 local_5c_buf [10];
  undefined1 auStack_4c [32];

  local_64[0] = 0;
  sVar8 = 0;
  uVar15 = grtile_alloc_registered(0x5f,0x6e);
  local_60 = (undefined4)uVar15;
  pcVar_p2off = scratch_data + 0x20;
  memset(local_5c_buf + 4, 0x14, 6);
  /* Was 4 separate byte writes reconstructing a 32-bit address, then (in an earlier, incorrect fix
     attempt) a direct 8-byte pointer store -- see g_chargen_textfield_buf's comment above for why
     that's wrong. */
  *(int *)(field_records + 0x7a) = 1;
  g_chargen_textfield_buf = auStack_4c;
  do {
    iVar12 = (int)sVar8;
// Fires once per chargen screen (sex/handedness/class/skill/portrait/ difficulty/name/confirm
    // are states 0-7, in that order) -- state is whatever the previous iteration's switch-case just
    // advanced sVar8 to (or reset it to 0 for, on a "back"/cancel).
    pcVar_rec = field_records + iVar12 * 0x14;
    iVar4 = *(int *)(pcVar_rec + 6);
    pcVar_name = (char *)&DAT_000fb8f0 + iVar4;
    screen_backup_save();  /* takes no args (ARM 0x11478 never reads r0-r3); the old args were the halves of the previous call's 64-bit return */
    chargen_ui_transition_hook(1);
    DAT_000fb858 = DAT_001005c8;
    // Redraws the raw parchment background (both pages, 0,0 to 320,200) from scratch every loop iteration -- this is the mechanism that clears stale text from the *right* page between prompts (confirmed: disabling it leaves old prompt text visibly bleeding through under new prompt text). As a side effect it also wipes any stats text the previous iteration's switch-case drew on the left page. Confirmed present in the real ARM disassembly at this exact spot, in this exact order relative to the fill below -- not a decompilation bug.
    bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
    cursor_show_idle_tick();
    chargen_ui_transition_hook(0);
    DAT_000fb858 = DAT_001005c4;
    decrement_cursor_hide_depth();
    set_draw_color(0x1a);
    // Fills the left-page stats/portrait area (x:17-142,y:0-199) with a solid backing color, on top of the parchment the reblit above just redrew. Runs *after* that reblit (confirmed via disassembly), so despite looking like an eraser this can't be "protecting" the area from it -- more likely just the stats card's background color. The stats themselves only get redrawn when the switch below happens to hit case 2 or 3, so they're only visible for one frame after finishing class/skill picks. This contradicts a real-device reference screenshot showing stats persisting through later screens (e.g. name entry) -- root cause not yet found; see the STILL OPEN notes.
    rect_fill_or_save_restore(0x11,0,0x8e,199);
    screen_backup_restore();
    draw_chargen_field_value((short *)pcVar_rec);
    draw_chargen_field_options((short *)pcVar_rec,0,0xff);
    screen_backup_restore();
    uVar15 = wait_for_chargen_field_input((short *)pcVar_rec);
    uVar6 = CONCAT44((int)(uVar15 >> 0x20),(uint)(uintptr_t)DAT_00086df8);
    uVar9 = (uint)uVar15;
    uVar1 = (uint)(short)uVar15;
    if ((int)uVar1 < 0) {
      if (iVar12 == 0) {
        return 0;
      }
      local_64[0] = 0;
      memset(local_5c_buf + 4, 0x14, 6);
      DAT_001005c0 = 0;
      chargen_ui_transition_hook(1);
      DAT_000fb858 = DAT_001005c8;
      bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
LAB_00025468:
      sVar8 = 0;
      cursor_show_idle_tick();
      chargen_ui_transition_hook(0);
      DAT_000fb858 = DAT_001005c4;
      uVar15 = screen_backup_save();
    }
    else {
      bVar2 = (byte)uVar15;
      switch(iVar12) {
      case 0:
        uVar10 = get_message_string(*(byte *)(pcVar_name + uVar1) | 0x400);
        uVar7 = 0xc;
        if (uVar1 == 0) {
          uVar7 = 7;
        }
        /* Was a write through CONCAT13(field_records+0x59, field_records+0x56) -- reconstructing a pointer
           split across those 4 bytes the same way field_records+0x7a's pointer field was (see that fix
           above). */
        *(byte *)(DAT_00086df8 + 100) =
             *(byte *)(DAT_00086df8 + 100) & 0xfd | (byte)((uVar9 & 1) << 1);
        decrement_cursor_hide_depth();
        draw_text_string(uVar10,0x11,0x16);
        uVar15 = cursor_show_idle_tick();
        sVar8 = 1;
        break;
      case 1:
        sVar8 = 2;
        bVar3 = *(byte *)(DAT_00086df8 + 100);
        uVar15 = (ulonglong)CONCAT14(bVar3,(uint)(uintptr_t)DAT_00086df8);
        *(byte *)(DAT_00086df8 + 100) = (bVar2 ^ bVar3) & 1 ^ bVar3;
        break;
      case 2:
        uVar10 = get_message_string(*(byte *)(pcVar_name + uVar1 * 2) | 0x400);
        *(byte *)(DAT_00086df8 + 100) =
             (byte)((uVar1 & 7) << 5) | *(byte *)(DAT_00086df8 + 100) & 0x1f;
        reroll_attributes_for_class_race();
        iVar12 = advance_skill_tree_node(local_64,local_5c_buf + 4,field_records + 0x3c,pcVar_p2off);
        if (iVar12 == 0) {
          sVar8 = 3;
        }
        DAT_001005c0 = apply_confirmed_skill_picks(0,local_5c_buf + 4);
        decrement_cursor_hide_depth();
        iVar12 = measure_text_width(uVar10);
        draw_text_string(uVar10,0x8f - iVar12,0x16);
        draw_chargen_attribute_summary();
        capture_framebuffer_rect_to_grtile(local_60,0x1e,0x85,0x5f,0x37);
        draw_selected_skills_list();
        uVar15 = cursor_show_idle_tick();
        sVar8 = sVar8 + 1;
        break;
      case 3:
        /* ARM 0x25198-0x251d4: record the skill the player just picked from the branch menu --
           picked[cursor-1] = list[choice*2] - 0x1f, where list is the string-id list
           advance_skill_tree_node filled in for this record (record+6, relative to
           &DAT_000fb8f0, same field draw_chargen_field_options reads). This was `= 0`, written
           off as a "never-written" field, so the chosen skill was always discarded and never
           added to the character's skill list (the slot kept the 0 and then applied nothing
           useful / skill 0). */
        {
          char *picked_list = (char *)&DAT_000fb8f0 + *(int *)(field_records + 0x3c + 6);
          local_5c_buf[local_64[0] + 3] = picked_list[uVar1 * 2] - 0x1f;
        }
        DAT_001005c0 = apply_confirmed_skill_picks((int)DAT_001005c0,local_5c_buf + 4);
        decrement_cursor_hide_depth();
        restore_captured_grtile_backdrop(local_60);
        draw_selected_skills_list();
        cursor_show_idle_tick();
        uVar15 = advance_skill_tree_node(local_64,local_5c_buf + 4,field_records + 0x3c,pcVar_p2off);
        if ((int)uVar15 == 0) {
          sVar8 = 4;
        }
        break;
      case 4:
        g_blit_transparent_mode = 1;
        iVar14 = *(int *)(&DAT_000fb8c4 + ((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 5 + uVar1) * 4
                         );
        chargen_ui_transition_hook(0);
        DAT_000fb858 = DAT_001005c4;
        /* iVar14 is chrbtns.gr's cumulative offset for the chosen body figure (entry 17 + sexbit*5
           + portraitIdx) -- now that DAT_000fb8c4 aliases the real chrbtns_offset_table_builder
           table (see uw.h), this is a genuine nonzero offset. */
        if (iVar14 < 4) {
          bVar2 = 0;
          bVar3 = 0;
        } else {
          bVar2 = *(byte *)(iVar14 + tree_data + -4);
          bVar3 = *(byte *)(iVar14 + tree_data + -3);
        }
        decrement_cursor_hide_depth();
        iVar12 = -(int)(short)(ushort)bVar3;
        iVar11 = iVar12 + 0x4c;
        iVar4 = -(int)(short)(ushort)bVar2;
        iVar13 = iVar4 + 0x38;
        if (iVar11 < 0) {
          iVar11 = iVar12 + 0x4d;
        }
        if (iVar13 < 0) {
          iVar13 = iVar4 + 0x39;
        }
        bitmap_blit_to_framebuffer((short)(iVar13 >> 1) + 0x10,(short)(iVar11 >> 1) + 0x2b,iVar14 + tree_data,bVar3,
                     bVar2,0,0,1);
        cursor_show_idle_tick();
        uVar15 = CONCAT44(extraout_r1,(uint)(uintptr_t)DAT_00086df8);
        g_blit_transparent_mode = 0;
        sVar8 = 5;
        *(byte *)(DAT_00086df8 + 100) =
             *(byte *)(DAT_00086df8 + 100) & 0xe3 | (byte)((uVar9 & 7) << 2);
        break;
      case 5:
        sVar8 = 6;
        *(byte *)(DAT_00086df8 + 0xb4) = bVar2;
        uVar15 = uVar6;
        break;
      case 6:
        pcVar5 = g_chargen_textfield_buf;
        decrement_cursor_hide_depth();
        sVar8 = measure_text_width(pcVar5);
        iVar12 = -(int)sVar8 + 0x7e;
        if (iVar12 < 0) {
          iVar12 = -(int)sVar8 + 0x7f;
        }
        draw_text_string(pcVar5,(short)(iVar12 >> 1) + 0x11,0xb);
        cursor_show_idle_tick();
        hi_word = extraout_r1_00;
        if (*pcVar5 != '\0') {
          /* Regression-verification hook only (see bugfix/lowercase-text- universal): no other
             other trace in this file surfaces the committed name-entry text... */
          DEBUG(TRACE, "[chargen] name field committed: \"%s\"", pcVar5);
          ce_strncpy(DAT_00086df8,pcVar5,0x1d);
          hi_word = extraout_r1_01;
        }
        uVar15 = CONCAT44(hi_word,(uint)(uintptr_t)DAT_00086df8);
        sVar8 = 7;
        *(undefined1 *)(DAT_00086df8 + 0x1d) = 0;
        break;
      case 7:
        if (uVar1 != 0) {
          decrement_cursor_hide_depth();
          set_draw_color(0x1a);
          rect_fill_or_save_restore(0x11,0,0x8f,199);
          cursor_show_idle_tick();
          local_64[0] = 0;
          memset(local_5c_buf + 4, 0x14, 6);
          DAT_001005c0 = 0;
          chargen_ui_transition_hook(1);
          DAT_000fb858 = DAT_001005c8;
          bitmap_blit_to_framebuffer(0,0,DAT_001005c8,200,0x140,0,0,1);
          goto LAB_00025468;
        }
        sVar8 = 8;
        uVar15 = recalculate_player_stats(1);
      }
    }
    if (7 < sVar8) {
      uVar10 = get_message_string(0x300);
      decrement_cursor_hide_depth();
      chargen_ui_transition_hook(1);
      DAT_000fb858 = DAT_001005c8;
      screen_backup_restore();
      bitmap_blit_to_framebuffer(0,0,DAT_000fb858,200,0x140,0,0,1);
      sVar8 = measure_text_width(auStack_4c);
      iVar12 = -(int)sVar8 + 0xa0;
      if (iVar12 < 0) {
        iVar12 = -(int)sVar8 + 0xa1;
      }
      draw_text_string(auStack_4c,(short)(iVar12 >> 1) + 0xa0,
                   0x62 - CONCAT11(*(undefined1 *)(DAT_000879b0 + 7),
                                   *(undefined1 *)(DAT_000879b0 + 6)));
      sVar8 = measure_text_width(uVar10);
      iVar12 = -(int)sVar8 + 0xa0;
      if (iVar12 < 0) {
        iVar12 = -(int)sVar8 + 0xa1;
      }
      draw_text_string(uVar10,(short)(iVar12 >> 1) + 0xa0,0x62);
      screen_backup_restore();
      set_draw_color(0x1a);
      rect_fill_or_save_restore(0xa0,199,0x13f,0);
      invalidate_grtile_by_key(local_60);
      return 1;
    }
  } while( true );
}



// Loads CHRGEN.DAT/CHARGEN.BYT/fonts/palette, builds the per-field record array, and drives character_generator_loop's state machine.
// was FUN_00025608
int run_character_generator()
{
  char stack0xffdc3230_buf [256];
  char *stack0xffdc3230_ptr;
  char cVar1;
  int iVar2;
  /* iVar2 doubles as a plain int return-code check early in this function and a real pointer
     (`DAT_001005c8 + 64000`, a palette load destination) later on -- mutually exclusive, but iVar2
     stayed `int` either way, truncating the pointer. */
  char *pcVar_palbuf;
  char *pcVar3;
  int iVar4;
  char *buf_a;
  char *bg_buf;
  uint uVar5;
  char *pcVar6;
  uint uVar7;
  undefined *puVar8;
  char *pcVar9;
  undefined2 uVar10;
  char acStack_128 [260];
  
  reset_dialogue_speech_state();
  DAT_001005c4 = ce_malloc(0x10000);
  DAT_001005c8 = ce_malloc(0x10000);
  buf_a = DAT_001005c4;
  uVar10 = 2;
  DAT_000fb858 = DAT_001005c4;
  iVar2 = load_gr_resource_entries(s_chrbtns_00084ef8,0,-1,&chrbtns_bump_alloc_entry,&chrbtns_offset_table_builder);
  if (iVar2 != 0) {
    DAT_000fb858 = buf_a;
    ce_memset(acStack_128,0,0x104);
    pcVar9 = &DAT_0023cca8;
    stack0xffdc3230_ptr = stack0xffdc3230_buf;
    pcVar3 = pcVar9;
    stack0xffdc3230_ptr = acStack_128;
    do {
      cVar1 = *pcVar3;
      *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_128,s__DATA_skills_dat_00084ee4);
    iVar4 = open_file_for_read(acStack_128);
    if (iVar4 != -1) {
      uVar5 = read_file_handle(iVar4,&DAT_000fb8f0,0x348);
      ce_memmove(&DAT_000fb860,&DAT_000fb8f0,0x20);
      CloseHandle(iVar4);
      if ((0x27 < uVar5) && (uVar5 != 0)) {
        ce_memset(acStack_128,0,0x104);
        pcVar3 = pcVar9;
    stack0xffdc3230_ptr = acStack_128;
        do {
          cVar1 = *pcVar3;
          *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
          pcVar3 = pcVar3 + 1;
        } while (cVar1 != '\0');
        ce_strcat(acStack_128,s__DATA_chrgen_dat_00084ed0);
        iVar4 = open_file_for_read(acStack_128);
        if (iVar4 != -1) {
          puVar8 = &DAT_000fb8f0 + uVar5;
          int chrgen_size = read_file_handle(iVar4,puVar8,10000);
          CloseHandle(iVar4);
          /* The DOS asset set uses a smaller record; bring it up to the
             layout every site below indexes with. */
          if (chrgen_size > 0) {
            chargen_normalize_record_stride((unsigned char *)puVar8, (unsigned)chrgen_size,
                                            (unsigned)(sizeof DAT_000fb8f0_backing - uVar5));
          }
          /* Was `(char *)(uVar5 + 0xfb990)` -- a literal original-binary address (0xfb990 =
             &DAT_000fb990's address there) added to an int, instead of real pointer arithmetic
             against the actual (relocated) buffer. 0xfb990 - 0xfb8f0 = 0xa0... */
          pcVar3 = (char *)puVar8 + 0xa0;
          iVar4 = 0;
          do {
            /* Was a 4-byte split of the absolute pointer `pcVar3` ((char)pcVar3, >>8, >>0x10,
               >>0x18) -- correct for a 32-bit binary, but only ever captured pcVar3's low 32 bits
               here... */
            *(int *)(puVar8 + (int)(iVar4) * 0x14 + 6) = (int)(pcVar3 - (char *)&DAT_000fb8f0);
            do {
              pcVar6 = pcVar3;
              pcVar3 = pcVar6 + 2;
            } while (*pcVar3 != '\0');
            iVar4 = ((int)iVar4 + 1) * 0x10000 >> 0x10;
            pcVar3 = pcVar6 + 4;
          } while (iVar4 < 8);
          select_active_font(s_FONTCHAR_SYS_00084ec0);
          *g_draw_color_index = 0x49;
          *DAT_00084298 = 0x49;
          chargen_ui_transition_hook(1);
          bg_buf = DAT_001005c8;
          pcVar_palbuf = DAT_001005c8 + 64000;
          ce_memset(acStack_128,0,0x104);
          do {
            cVar1 = *pcVar9;
            *stack0xffdc3230_ptr = cVar1; stack0xffdc3230_ptr = stack0xffdc3230_ptr + 1;
            pcVar9 = pcVar9 + 1;
          } while (cVar1 != '\0');
          ce_strcat(acStack_128,s__DATA_CHARGEN_BYT_00084eac);
          uVar5 = read_buffer_from_file(acStack_128,bg_buf,64000);
          uVar7 = load_pals_bank(3,pcVar_palbuf);
          if ((uVar5 & uVar7) != 0) {
            decrement_cursor_hide_depth();
            bitmap_blit_to_framebuffer(0,0,bg_buf,200,CONCAT22(uVar10,0x140),0,0,0);
            /* The PocketPC path drew this screen at full brightness.
               Fade in its loaded background before accepting choices. */
            fade_in(g_uw_framebuffer,0,0);
            iVar4 = character_generator_loop(DAT_000fb858,&DAT_000fb8f0,puVar8);
            select_active_font(s_FONT5X6P_SYS_00084e9c);
            if (DAT_00201c98 != 0) {
              load_dungeon_texture_arenas();
            }
            if (iVar4 == 0) {
              chargen_ui_transition_hook(1);
            }
            clear_ambient_sound_target_thunk();
            if (DAT_001005c4 != 0) {
              /* LocalFree(); -- Ghidra omitted the allocation pointer. */
              LocalFree(DAT_001005c4);
              DAT_001005c4 = 0;
            }
            if (DAT_001005c8 == 0) {
              return iVar4;
            }
            /* LocalFree(); */
            LocalFree(DAT_001005c8);
            DAT_001005c8 = 0;
            return iVar4;
          }
        }
      }
    }
  }
  clear_ambient_sound_target_thunk();
  if (DAT_001005c4 != 0) {
    /* LocalFree(); */
    LocalFree(DAT_001005c4);
    DAT_001005c4 = 0;
  }
  if (DAT_001005c8 != 0) {
    /* LocalFree(); */
    LocalFree(DAT_001005c8);
    DAT_001005c8 = 0;
  }
  if (DAT_00201c98 != 0) {
    load_dungeon_texture_arenas();
  }
  init_new_character_record(0);
  clear_screen_and_restore_cursor();
  report_fatal_error_and_exit(5);
  return 1;
}



// Thin wrapper that enters/exits a critical section around run_character_generator.
// was FUN_000259a0
int character_generator_start()
{
  undefined4 uVar1;

  init_new_character_record(1);
  uVar1 = run_character_generator();
  load_weapon_combat_maneuver_data();
  return uVar1;
}


// was FUN_000232ec -- resets the player record (DAT_00086df8, base &DAT_0023bca8 set by
// reset_player_object_record) to new-character defaults: zeroes/reinitializes combat flags,
// equipment slots, and misc stat fields...
void init_new_character_record(int mode)
{
  int uw_ord2005_rem_0 = 0; int uw_ord2005_rem_1 = 0;
  byte bVar1;
  undefined1 uVar2;
  char cVar3;
  undefined4 uVar4;
  char extraout_r1;
  uint extraout_r1_00;
  uint uVar5;
  int iVar6;
  
  *(byte *)(DAT_00086df8 + 100) = *(byte *)(DAT_00086df8 + 100) | 1;
  *(undefined1 *)(DAT_00086df8 + 0x4e) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x4f) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x50) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x51) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x52) = 1;
  *(undefined1 *)(DAT_00086df8 + 0x53) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x3d) = 1;
  *(undefined1 *)(DAT_00086df8 + 0xce) = 0;
  *(undefined1 *)(DAT_00086df8 + 0xcf) = 0x30;
  *(undefined1 *)(DAT_00086df8 + 0xd0) = 0xb;
  *(undefined1 *)(DAT_00086df8 + 0xd1) = 1;
  *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf2 | 2;
  *(byte *)(DAT_00086df8 + 0x5e) = *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfc3f;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xf3ff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xefff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xdfff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0x7fff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xbfff;
  *(char *)(DAT_00086df8 + 0x5f) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfbff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xf7ff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xefff;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfffc;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfc0f;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  uVar5 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfff3;
  *(char *)(DAT_00086df8 + 0x61) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0x62) = (char)(uVar5 >> 8);
  *(byte *)(DAT_00086df8 + 0xb5) = *(byte *)(DAT_00086df8 + 0xb5) & 0xf | 0x30;
  configure_texture_detail_functions();
  *(undefined1 *)(DAT_00086df8 + 0x6d) = 8;
  *(undefined1 *)(DAT_00086df8 + 0x65) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x66) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x67) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x68) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6e) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6f) = 0;
  uVar5 = *(ushort *)(DAT_00086df8 + 0xb6) & 0xfff8;
  *(char *)(DAT_00086df8 + 0xb6) = (char)uVar5;
  *(char *)(DAT_00086df8 + 0xb7) = (char)(uVar5 >> 8);
  *(undefined1 *)(DAT_00086df8 + 0xb8) = 0;
  *(undefined1 *)(DAT_00086df8 + 0xb9) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x3a) = 0x40;
  *(undefined1 *)(DAT_00086df8 + 0x3b) = 0x40;
  *(undefined1 *)(DAT_00086df8 + 0x3c) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x69) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6a) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6b) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x6c) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x47) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x48) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x49) = 0x18;
  *(undefined1 *)(DAT_00086df8 + 0x44) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x45) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x46) = 0;
  ce_memset(DAT_00086df8 + 0x70,0,0x40);
  ce_memset(DAT_00086df8 + 0xc2,0,8);
  *(undefined1 *)(DAT_00086df8 + 0x8a) = 0x35;
  *(undefined1 *)(DAT_00086df8 + 0x39) = 0xc0;
  uVar4 = ce_rand();
  uw_ord2005_rem_0 = ((int)(uVar4)) % (5);
  *(byte *)(DAT_00086df8 + 100) =
       (byte)((uw_ord2005_rem_0 & 7) << 2) | *(byte *)(DAT_00086df8 + 100) & 0xe3;
  bVar1 = ce_rand();
  iVar6 = 0;
  *(byte *)(DAT_00086df8 + 100) = *(byte *)(DAT_00086df8 + 100) & 0xfd | (bVar1 & 1) << 1;
  do {
    if (mode == 0) {
      uVar2 = roll_dice_sum(3,4);
    }
    else {
      uVar2 = 0;
    }
    *(undefined1 *)(iVar6 + DAT_00086df8 + 0x21) = uVar2;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x14);
  iVar6 = 0;
  do {
    if (mode == 0) {
      cVar3 = roll_dice_sum(2,10);
      cVar3 = cVar3 + '\n';
    }
    else {
      cVar3 = '\0';
    }
    *(char *)(iVar6 + DAT_0023be74 + 5) = cVar3;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 3);
  recalculate_player_stats(1);
  *(undefined1 *)(DAT_00086df8 + 0x4a) = 0;
  *(undefined1 *)(DAT_00086df8 + 0x4b) = 0;
  uVar4 = ce_rand();
  uw_ord2005_rem_1 = ((int)(uVar4)) % (6);
  g_player_object->npc_hp = (byte)((-6 - uw_ord2005_rem_1) + *(char *)(DAT_0023be74 + 4));
  DAT_00201b68 = 1;
  refresh_player_equipment_effects();
}


// was FUN_000238b4 -- walks the character-generator skill tree (param_4, a compact
// [count][id0][id1]...-encoded tree) starting from the cursor index *param_1: for each leaf skill
// entry, records its id into the output array param_2 (up to 5 entries) and advances the cursor...
int advance_skill_tree_node(byte *cursor, char *picked_skills, char *record, char *tree)
{
  byte bVar1;
  short sVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  
  sVar2 = 0;
  iVar3 = (uint)(*(byte *)(DAT_00086df8 + 100) >> 5) * 5 + (uint)*cursor;
  if (iVar3 != 0) {
    iVar5 = 0;
    do {
      sVar2 = (ushort)*(byte *)(tree + sVar2) + sVar2 + 1;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < iVar3);
  }
  if (*cursor < 5) {
    do {
      pbVar4 = (byte *)(tree + sVar2);
      if (*pbVar4 == 0) {
        *(undefined1 *)(picked_skills + (uint)*cursor) = 0x14;
      }
      else {
        if (*pbVar4 != 1) {
          iVar3 = (int)sVar2;
          /* Branch node in the skill tree: [count][id0][id1]... */
          *(undefined1 *)(record + 10) = *(undefined1 *)(iVar3 + tree);
          *(undefined1 *)(record + 0xb) = 0;
          /* record+6 is the skill record's string-list field. */
          {
            char *list = (char *)&DAT_000fb8f0 + *(int *)(record + 6);
            iVar5 = 0;
            do {
              list[iVar5 * 2] = *(char *)(iVar5 + iVar3 + tree + 1) + '\x1f';
              iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
            } while (iVar5 < (int)(uint)*(byte *)(iVar3 + tree));
          }
          *cursor = *cursor + 1;
          return 1;
        }
        *(byte *)(picked_skills + (uint)*cursor) = pbVar4[1];
        sVar2 = (ushort)*pbVar4 + sVar2 + 1;
      }
      bVar1 = *cursor;
      *cursor = bVar1 + 1;
    } while ((byte)(bVar1 + 1) < 5);
  }
  return 0;
}


// was FUN_00023a00 -- draws the chargen stat screen's 4 attribute values (DAT_0023be74 offsets
// +5/+6/+7 -- the 3 rolled 2d10+10 attributes set by init_new_character_record -- and +4)...
void draw_chargen_attribute_summary()
{
  int iVar1;
  undefined1 auStack_14 [12];
  
  set_draw_color(0x1a);
  rect_fill_or_save_restore(0x5d,0x32,0x8c,0x7a);
  screen_backup_restore();
  itoa_radix(*(undefined1 *)(DAT_0023be74 + 5),auStack_14,10);
  draw_text_string(&DAT_00084e58,0x5d,0x32);
  iVar1 = measure_text_width(auStack_14);
  draw_text_string(auStack_14,0x8c - iVar1,0x32);
  itoa_radix(*(undefined1 *)(DAT_0023be74 + 6),auStack_14,10);
  draw_text_string(&DAT_00084e50,0x5d,0x44);
  iVar1 = measure_text_width(auStack_14);
  draw_text_string(auStack_14,0x8c - iVar1,0x44);
  itoa_radix(*(undefined1 *)(DAT_0023be74 + 7),auStack_14,10);
  draw_text_string(&DAT_00084e48,0x5d,0x56);
  iVar1 = measure_text_width(auStack_14);
  draw_text_string(auStack_14,0x8c - iVar1,0x56);
  itoa_radix(*(undefined1 *)(DAT_0023be74 + 4),auStack_14,10);
  draw_text_string(&DAT_00084e40,0x5d,0x68);
  iVar1 = measure_text_width(auStack_14);
  draw_text_string(auStack_14,0x8c - iVar1,0x68);
}



// was FUN_00023b38 -- draws the chargen skill-selection screen: blits a backdrop bitmap, then lists
// up to 6 of the player's currently-selected skills (nonzero entries in DAT_00086df8+0x21, up to 20
// slots) with each skill's name (get_message_string) and its point value (itoa_radix)...
void draw_selected_skills_list()
{
  int iVar1;
  int iVar2;
  /* Was `undefined4`, truncating get_message_string's real char* return. */
  char *uVar3;
  int iVar4;
  int iVar5;
  undefined1 auStack_24 [12];

  set_draw_color(0x1a);
  rect_fill_or_save_restore(0x1e,0x85,0x7d,0xbc);
  chargen_ui_transition_hook(1);
  DAT_000fb858 = DAT_001005c8;
  blit_bitmap_to_framebuffer_clipped(0x1e,0x85,DAT_001005c8,0x37,0x5f,0x1e,0x85,1);
  screen_backup_save();
  cursor_show_idle_tick();
  chargen_ui_transition_hook(0);
  DAT_000fb858 = DAT_001005c4;
  iVar4 = 0;
  iVar2 = 0;
  do {
    if (5 < (short)iVar4) break;
    iVar1 = (int)(short)iVar2;
    if (*(char *)(iVar1 + DAT_00086df8 + 0x21) != '\0') {
      uVar3 = get_message_string(iVar2 + 0x1fU | 0x400);
      itoa_radix(*(undefined1 *)(iVar1 + DAT_00086df8 + 0x21),auStack_24,10);
      iVar5 = iVar4 * 0xb + 0x85;
      draw_text_string(uVar3,0x1e,iVar5);
      iVar2 = measure_text_width(auStack_24);
      draw_text_string(auStack_24,0x7d - iVar2,iVar5);
      iVar4 = ((short)iVar4 + 1) * 0x10000 >> 0x10;
    }
    iVar2 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x14);
  screen_backup_restore();
}



// was FUN_00023c90 -- walks param_2 (the skill-id array advance_skill_tree_node fills) from index
// param_1 up to 6, calling advance_skill_training on each valid skill id (<0x14) to actually apply
// it to the player record, and returns the updated count.
int apply_confirmed_skill_picks(int first_index, char *picked_skills)
{
  int iVar1;

  for (iVar1 = first_index << 0x10; iVar1 = iVar1 >> 0x10, iVar1 < 6; iVar1 = (iVar1 + 1) * 0x10000) {
    if (*(byte *)(iVar1 + picked_skills) < 0x14) {
      advance_skill_training(*(byte *)(iVar1 + picked_skills));
      first_index = first_index + 1;
    }
  }
  return first_index;
}


// was FUN_00023cdc -- applies the just-chosen class/race's attribute bonuses (looked up from
// &DAT_000fb860 by a class/race-derived index) to the 3 rolled attributes (DAT_0023be74+5/6/7),
// clears the skill array (DAT_00086df8+0x21, 20 slots) for a fresh pick...
void reroll_attributes_for_class_race()
{
  int uw_ord2005_rem_2 = 0;
  byte bVar1;
  int iVar2;
  uint uVar3;
  undefined4 uVar4;
  int extraout_r1;
  /* Was `int`, truncating the real char* pointer DAT_0023be74. */
  char *iVar5;
  /* iVar6 doubles as a plain int index (into &DAT_000fb860) in the first loop and a real pointer
     (DAT_00086df8 + iVar2) in the second -- mutually exclusive, but both squeezed into `int`,
     truncating the pointer role. Dedicated variable for that role. */
  int iVar6;
  char *pcVar_df8;
  uint uVar7;

  iVar2 = 0;
  do {
    iVar6 = iVar2 + (uint)(*(byte *)(DAT_00086df8 + 100) >> 5) * 4;
    iVar5 = DAT_0023be74 + iVar2;
    iVar2 = iVar2 + 1;
    *(undefined *)(iVar5 + 5) = (&DAT_000fb860)[iVar6];
  } while (iVar2 < 3);
  iVar2 = 0;
  do {
    pcVar_df8 = DAT_00086df8 + iVar2;
    iVar2 = iVar2 + 1;
    *(undefined1 *)(pcVar_df8 + 0x21) = 0;
  } while (iVar2 < 0x14);
  for (uVar7 = (uint)(byte)(&DAT_000fb863)[(uint)(*(byte *)(DAT_00086df8 + 100) >> 5) * 4];
      0 < (int)uVar7; uVar7 = uVar7 - uVar3) {
    uVar3 = ce_rand();
    uVar3 = (uVar3 & 3) + 1;
    if ((int)uVar7 < (int)uVar3) {
      uVar3 = uVar7;
    }
    uVar4 = ce_rand();
    uw_ord2005_rem_2 = ((int)(uVar4)) % (3);
    bVar1 = *(byte *)(DAT_0023be74 + uw_ord2005_rem_2 + 5);
    if (0x1e < (int)(bVar1 + uVar3)) {
      uVar3 = 0x1e - bVar1;
    }
    *(byte *)(DAT_0023be74 + uw_ord2005_rem_2 + 5) = (char)uVar3 + bVar1;
  }
  recalculate_player_stats(1);
  g_player_object->npc_hp = *(undefined1 *)(DAT_0023be74 + 4);
}



/* character_generator_loop's per-record array is raw CHRGEN.DAT file data laid out as 8 contiguous
   0x14-byte records; the name-entry text field (record 6) is the only one that needs a *real*
   buffer pointer... */
char *g_chargen_textfield_buf;

// was FUN_00023de8 -- draws the current chargen field's label and
// current value/text (and, for the name field, the "Enter your
// name..." prompt).
void draw_chargen_field_value(short *field)
{
  byte bVar1;
  byte bVar2;
  /* Was `int iVar3` holding DAT_000fb858 (a real pointer, used as
     bitmap_blit_to_framebuffer's source-bitmap arg right after) -- truncating. Only
     ever used for this one pointer-holding role in this function. */
  char *iVar3;
  short sVar4;
  short sVar5;
  undefined2 uVar6;
  short sVar7;
  /* Was `undefined4`, truncating get_message_string's real char* return
     (a string-resource lookup) before it's passed to measure_text_width
     (strlen-shaped) and draw_text_string (draw string). */
  char *uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  /* iVar11 doubles as a real pointer (DAT_000fb858 + a small table offset, read from right after)
     early on, and a plain int for screen-coordinate math for the rest of the function -- mutually
     exclusive, but both squeezed into `int iVar11`... */
  char *pcVar_off;
  /* Was `extraout_r1` -- the classic "call ordint_divmod, discard its return, read the remainder
     via a register-leftover" idiom (same class as draw_chargen_field_options's sVar_rem fix earlier
     this session), but here that register was never even assigned in our C translation... */
  int iVar_rem;
  uint uVar12;
  uint uVar13;
  ushort local_2c;
  int local_28;

  if (*(int *)(field + 3) == 0) {
    uVar12 = (uint)(short)local_2c;
    iVar10 = 9;
    uVar13 = (uint)(short)local_2c;
  }
  else {
    pcVar_off = DAT_000fb858 + (&DAT_000fb880)[field[6]];
    sVar7 = *field;
    chargen_ui_transition_hook(0);
    DAT_000fb858 = DAT_001005c4;
    iVar10 = 0x14;
    /* DAT_000fb880 (indexed by field[6], a race/portrait-style selector) is never written
       anywhere in this decompile -- no call site populates it, so it's permanently all-zero. */
    if (pcVar_off - DAT_000fb858 < 4) {
      bVar1 = 0;
      bVar2 = 0;
    } else {
      bVar1 = *(byte *)(pcVar_off + -3);
      bVar2 = *(byte *)(pcVar_off + -4);
    }
    uVar13 = (uint)bVar1;
    if ((sVar7 != 0) == 0) {
      iVar10 = 0;
    }
    uVar12 = (uint)bVar2;
    sVar5 = field[5];
    local_2c = (ushort)bVar1;
    sVar4 = ordint_divmod(0xc4 - iVar10,(int)sVar5 * ((short)(ushort)bVar1 + 4) + -4).quot;
    iVar10 = sVar4 + 1;
    *(char *)(field + 8) = (char)iVar10;
    *(char *)((char *)field + 0x11) = (char)((uint)iVar10 >> 8);
    iVar10 = iVar10 * 0x10000 >> 0x10;
    sVar5 = ordint_divmod(iVar10,iVar10 + sVar5 + -1).quot;
    *(char *)(field + 7) = (char)sVar5;
    *(char *)((char *)field + 0xf) = (char)((ushort)sVar5 >> 8);
    uVar6 = ordint_divmod(iVar10 + 1,0xa0 - (short)(ushort)bVar2 * iVar10).quot;
    *(char *)(field + 9) = (char)uVar6;
    *(char *)((char *)field + 0x13) = (char)((ushort)uVar6 >> 8);
    iVar10 = -(((int)(sVar7 != 0) + (int)sVar5) * ((short)(ushort)bVar1 + 4));
    iVar11 = iVar10 + 200;
    if (iVar11 < 0) {
      iVar11 = iVar10 + 0xc9;
    }
    iVar10 = (short)(iVar11 >> 1) + 3;
  }
  if (*field == 0) {
    iVar11 = (int)(short)local_2c;
    iVar10 = (iVar10 - uVar13) + -4;
  }
  else {
    uVar8 = get_message_string((int)*field | 0x400);
    iVar11 = 0xa4;
    /* This field is a plain 4-byte nonzero marker ("is this a text- entry field") for whichever
       record is currently being processed -- see g_chargen_textfield_buf's comment near
       character_generator_loop for why it must stay a narrow 4-byte read... */
    if (*(int *)(field + 1) == 0) {
      sVar7 = measure_text_width(uVar8);
      iVar9 = -(int)sVar7 + 0x91;
      if (iVar9 < 0) {
        iVar9 = -(int)sVar7 + 0x92;
      }
      iVar9 = ((iVar9 >> 1) + 0xa4) * 0x10000 >> 0x10;
    }
    else {
      bitmap_blit_to_framebuffer(0xa4,iVar10,DAT_000fb898 + DAT_000fb858,0x10,0x91,0,0,1);
      iVar11 = 0xa8;
      iVar9 = 0xa8;
    }
    draw_text_string(uVar8,iVar9,iVar10 + 3);
    if (*field == 7) {
      draw_text_string(s_Enter_your_name_and_00084e88,0xaa,0x3c);
      draw_text_string(s_then_press_the_Enter_00084e70,0xaa,0x46);
      draw_text_string(s_key_to_continue_00084e60,0xb9,0x50);
    }
  }
  if (*(int *)(field + 3) != 0) {
    g_blit_transparent_mode = 0;
    chargen_ui_transition_hook(0);
    DAT_000fb858 = DAT_001005c4;
    if (0 < field[5]) {
      local_28 = 0;
      do {
        iVar3 = DAT_000fb858;
        iVar_rem = ordint_divmod((int)field[8],local_28).rem;
        iVar9 = iVar_rem;
        if (iVar_rem == 0) {
          iVar9 = (int)(short)local_2c;
          iVar11 = 0xa0 - uVar12;
        }
        if (iVar_rem == 0) {
          iVar10 = iVar10 + iVar9 + 4;
        }
        sVar7 = (short)uVar12;
        iVar11 = (ushort)field[9] + iVar11 + uVar12;
        /* Investigated as a possible "missing button outline" source this session -- ruled out. */
        bitmap_blit_to_framebuffer(iVar11,iVar10,
                     (&DAT_000fb880)[(ushort)field[6]]
                     + iVar3,(int)(short)local_2c,sVar7,0,0,0);
        if (field[6] == 0) {
          /* field+3 (byte offset +6 in the record) holds a relative
             offset from &DAT_000fb8f0, not an absolute pointer -- see
             the write site in run_character_generator. Reconstruct before use. */
          uVar8 = get_message_string(*(byte *)(((char *)&DAT_000fb8f0 + *(int *)(field + 3)) + local_28 * 2) | 0x400);
          sVar5 = measure_text_width(uVar8);
          iVar9 = (int)sVar7 - (int)sVar5;
          if (iVar9 < 0) {
            iVar9 = iVar9 + 1;
          }
          draw_text_string(uVar8,iVar11 + (short)(iVar9 >> 1),iVar10 + 3);
        }
        else if (field[6] == 3) {
          /* Portrait/head selector (chargen state 4). */
          {
            int head_idx = 7 + ((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 5) + local_28;
            g_blit_transparent_mode = 1;
            bitmap_blit_to_framebuffer(iVar11,iVar10,
                         (&DAT_000fb880)[head_idx] + DAT_000fb858,(int)(short)local_2c,
                         sVar7,0,0,1);
            g_blit_transparent_mode = 0;
          }
        }
        local_28 = (local_28 + 1) * 0x10000 >> 0x10;
      } while (local_28 < field[5]);
    }
  }
}


// was FUN_0002431c -- draws up to two selectable option icons/portraits
// (e.g. prev/next choice) for the current chargen field.
int draw_chargen_field_options(short *field, byte option_a, byte option_b)
{
  byte bVar1;
  byte bVar2;
  short sVar3;
  /* Was `short extraout_r1` -- the classic "call ordint_divmod once for the quotient, call it again
     with identical args purely to grab the remainder via the register-leftover idiom" pattern
     already fixed elsewhere this session (see itoa_radix)... */
  short sVar_rem;
  short sVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  /* iVar10 doubles as a plain int (screen-coordinate math, early on) and a real pointer
     (DAT_000fb858, used as bitmap_blit_to_framebuffer's source-bitmap arg) later -- mutually
     exclusive, but both squeezed into one `int`, truncating the pointer. */
  char *pcVar_fb858;
  byte local_2c [2];
  short local_2a;
  short local_28;
  
  sVar4 = -1;
  if (*field == 0) {
    sVar4 = 0;
  }
  if (option_a != option_b) {
    local_2c[0] = option_b;
    local_2c[1] = option_a;
    iVar9 = 0;
    /* Same DAT_000fb880-is-never-written underflow guard as
       draw_chargen_field_value above -- see its comment. */
    if ((&DAT_000fb880)[field[6]] < 4) {
      bVar1 = 0;
      bVar2 = 0;
    } else {
      bVar1 = *(byte *)((&DAT_000fb880)[field[6]] + DAT_000fb858 + -3);
      bVar2 = *(byte *)((&DAT_000fb880)[field[6]] + DAT_000fb858 + -4);
    }
    local_28 = field[9] + 0xa0;
    iVar10 = -(((int)field[7] + (int)sVar4) * ((short)(ushort)bVar1 + 4));
    iVar5 = iVar10 + 200;
    if (iVar5 < 0) {
      iVar5 = iVar10 + 0xc9;
    }
    local_2a = (short)(iVar5 >> 1) + 3;
    pcVar_fb858 = DAT_000fb858;
    do {
      uVar8 = (uint)local_2c[iVar9];
      if ((int)uVar8 < (int)field[5]) {
        sVar4 = field[8];
        sVar3 = ordint_divmod((int)sVar4,uVar8).quot;
        sVar_rem = (sVar4 == 0) ? 0 : (short)((int)uVar8 % (int)sVar4);
        iVar5 = (int)local_2a;
        sVar4 = field[9];
        iVar6 = (int)local_28;
        iVar7 = *(int *)(&DAT_000fb884 + (iVar9 + field[6]) * 4);
        decrement_cursor_hide_depth();
        chargen_ui_transition_hook(0);
        DAT_000fb858 = DAT_001005c4;
        g_blit_transparent_mode = 1;
        bitmap_blit_to_framebuffer((int)sVar_rem * ((int)sVar4 + (uint)bVar2) + iVar6,
                     (int)sVar3 * (bVar1 + 4) + iVar5,pcVar_fb858 + iVar7,(uint)bVar1,bVar2,0,0,1);
        cursor_show_idle_tick();
        pcVar_fb858 = DAT_000fb858;
      }
      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
    } while (iVar9 < 2);
    g_blit_transparent_mode = 0;
  }
  return 0;
}



// Translates a touch/shortcut-key position into a selected item index for the current chargen field.
// was FUN_0002454c
uint character_generator_touch_select(short *field, uint position)
{
  int iVar1;
  byte bVar2;
  byte bVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  int iVar8;
  int extraout_r1;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  uint uVar13;
  short local_40;
  short local_3e;
  ushort local_3c;
  int local_38;
  int local_34;
  int local_30;
  uint local_4;

  sVar4 = *field;
  /* Same DAT_000fb880-is-never-written underflow guard as
     draw_chargen_field_value above -- see its comment. */
  if ((&DAT_000fb880)[field[6]] < 4) {
    bVar2 = 0;
    bVar3 = 0;
  } else {
    bVar2 = *(byte *)((&DAT_000fb880)[field[6]] + DAT_000fb858 + -4);
    bVar3 = *(byte *)((&DAT_000fb880)[field[6]] + DAT_000fb858 + -3);
  }
  sVar5 = field[9];
  local_3c = (ushort)bVar2;
  iVar10 = bVar3 + 4;
  sVar7 = 0;
  if (sVar4 != 0) {
    sVar7 = (short)((uint)(iVar10 * 0x10000) >> 0x10);
  }
  local_30 = (int)(short)(ushort)bVar3;
  if (sVar4 == 0) {
    sVar7 = 0;
  }
  iVar1 = -(((uint)(sVar4 != 0) +
            (int)(ushort)field[7]) * (local_30 + 4));
  iVar9 = iVar1 + 200;
  if (iVar9 < 0) {
    iVar9 = iVar1 + 0xc9;
  }
  sVar4 = next_input_event();
  uVar13 = position;
  if (0 < sVar4) {
    local_38 = (int)(((int)sVar5 + (uint)bVar2) * 0x10000) >> 0x10;
    iVar1 = (sVar5 + 0xa0) * 0x10000 >> 0x10;
    local_34 = iVar10 * 0x10000 >> 0x10;
    iVar10 = ((int)(short)(iVar9 >> 1) + (int)sVar7 + 3) * 0x10000;
    iVar9 = iVar10 >> 0x10;
    local_4 = position;
    do {
      /* HACK: DAT_0023c63c (our click-hold flag -- see handle_mouse_message's HACK comment) blocks
         flush_dirty_rect_to_display's actual screen flush the whole time a button is held, unless
         g_force_flush is set... */
      g_force_flush = 1;
      flush_dirty_rect_to_display(1);
      g_force_flush = 0;
      if (((short)uVar13 != (short)position) && ((short)uVar13 != -1)) {
        decrement_cursor_hide_depth();
        draw_chargen_field_options(field,uVar13 & 0xff,position & 0xff);
        cursor_show_idle_tick();
        local_4 = uVar13 & 0xffff;
      }
      // Click/touch detection: reads the current pointer position, then the math below maps it to a list-item index.
      get_mouse_position(&local_40,&local_3e);
      sVar4 = local_40;
      sVar7 = field[8];
      iVar11 = (int)local_3e;
      iVar12 = (int)local_40;
      sVar5 = ordint_divmod(local_34,iVar11 - iVar9).quot;
      sVar6 = ordint_divmod(local_38,iVar12 - iVar1).quot;
      uVar13 = (int)sVar5 * (int)sVar7 + (int)sVar6;
      iVar8 = (int)(uVar13 * 0x10000) >> 0x10;
      if ((((iVar8 < 0) || (field[5] <= iVar8)) || (iVar11 < iVar9)) || (iVar12 < iVar1)) {
LAB_000247f8:
        uVar13 = 0xffffffff;
      }
      else {
        /* X uses this division's remainder, Y uses its quotient -- one real ARM idivmod call in the
           original, split by Ghidra into two separate ordint_divmod calls (one for each half) with
           the remainder-wanting one reading an extraout_r1 that was never populated. */
        divmod_result dmr1118 = ordint_divmod((int)sVar7,iVar8);
        extraout_r1 = dmr1118.rem;
        iVar12 = ((iVar1 * -0x10000 >> 0x10) - (extraout_r1 * local_38 * 0x10000 >> 0x10)) +
                 (int)sVar4;
        local_40 = (short)iVar12;
        iVar8 = dmr1118.quot;
        iVar8 = ((iVar11 * -0x10000 >> 0x10) - (iVar8 * local_34 * 0x10000 >> 0x10)) +
                (int)(short)((uint)iVar10 >> 0x10);
        local_3e = (short)iVar8;
        if (((int)(short)local_3c <= iVar12 * 0x10000 >> 0x10) ||
           (local_30 <= iVar8 * 0x10000 >> 0x10)) goto LAB_000247f8;
      }
      sVar7 = next_input_event();
      position = (uint)(short)local_4;
    } while (0 < sVar7);
  }
  if ((short)uVar13 == -1) {
    uVar13 = -position - 1;
  }
  return uVar13;
}



// was FUN_00024840 -- waits for input on the current chargen field:
// navigates/selects a list, or (for the name field) runs the
// text-entry loop.
uint wait_for_chargen_field_input(short *field)
{
  undefined4 param_2;  /* was a 2nd parameter: only ever assigned the high half of a 64-bit return; ARM 0x24840 reads r0 only */
  byte bVar1;
  short sVar2;
  short sVar3;
  undefined2 uVar4;
  short sVar5;
  uint uVar6;
  /* get_message_string's return (the label string for this field) was discarded here, with the very
     next line calling measure_text_width() with no argument -- relying on register leftovers to
     still hold that same return value... */
  char *pcVar_str;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10; // Selection index -- the currently-highlighted item in the field's list.
  int iVar11;
  /* iVar11 doubles as a real pointer (DAT_000fb858 + a table offset, read from right after) and
     then a plain int for the rest of the function -- same pattern already fixed in
     draw_chargen_field_value/ draw_chargen_field_options above. */
  char *pcVar_off;
  uint uVar12;
  uint uVar13;
  undefined8 uVar14;
  ushort local_2c [2];
  int local_28;
  
  local_28 = 1;
  uVar10 = 0;
  uVar12 = 0;
  uVar6 = (uint)*field;
  uVar13 = 0;
  /* Plain 4-byte nonzero marker -- see draw_chargen_field_value's matching comment
     and g_chargen_textfield_buf's comment near character_generator_loop. */
  if ((*field == 0) || (*(int *)(field + 1) == 0)) {
    do {
      do {
        advance_menu_music_track();
        flush_dirty_rect_to_display(1);
        uVar14 = next_input_event();
        param_2 = (undefined4)((ulonglong)uVar14 >> 0x20);
        uVar6 = (uint)uVar14;
      } while ((short)uVar14 < 0);
      uVar6 = (uint)(short)uVar14;
      if ((int)uVar6 < 0xa8) {
        if (uVar6 == 0xa7) goto LAB_00024c88;
        if (0x8f < (int)uVar6) {
          if (uVar6 != 0x91) {
            if (uVar6 != 0x92) {
              if (uVar6 == 0x93) goto LAB_00024dc4;
              if (uVar6 != 0x94) {
                if (uVar6 != 0xa5) {
                  if (uVar6 == 0xa6) goto LAB_00024cfc;
                  goto LAB_00024dd4;
                }
                goto LAB_00024c88;
              }
            }
            goto LAB_00024db0;
          }
          goto LAB_00024d5c;
        }
        if (uVar6 == 0x8f) goto LAB_00024d54;
        if (0 < (int)uVar6) {
          if ((int)uVar6 < 4) {
            uVar10 = character_generator_touch_select(field,uVar10);
            uVar6 = (uint)(short)uVar10;
            uVar13 = (uint)(uVar6 < 0x80000000);
            uVar12 = uVar10;
            if ((int)uVar6 < 0) {
              uVar10 = -uVar10 - 1;
              uVar12 = uVar10;
            }
          }
          else if (uVar6 == 0xd) {
            uVar13 = 1;
          }
          else {
            if (uVar6 == 0x1b) {
              return 0xffffffff;
            }
            if (uVar6 != 0x8c) {
              if (uVar6 == 0x8d) goto LAB_00024cfc;
              if (uVar6 != 0x8e) goto LAB_00024dd4;
            }
LAB_00024c88:
            uVar10 = 0;
          }
        }
        goto LAB_00024dd4;
      }
      if (0x166 < (int)uVar6) {
        if (uVar6 == 0x16e) {
LAB_00024dc4:
          uVar10 = (int)field[8] + uVar10;
        }
        else if (uVar6 == 0x170) {
LAB_00024cfc:
          uVar10 = uVar10 - (int)field[8];
        }
        else {
          if (uVar6 == 0x23c) goto LAB_00024c88;
          if (uVar6 == 0x23e) goto LAB_00024db0;
          if (uVar6 == 0x278) {
            return 0xffffffff;
          }
        }
        goto LAB_00024dd4;
      }
      if (uVar6 == 0x166) {
LAB_00024d5c:
        uVar10 = uVar10 + 1;
      }
      else if (uVar6 == 0xa8) {
LAB_00024d54:
        uVar10 = uVar10 - 1;
      }
      else {
        if (uVar6 == 0xa9) goto LAB_00024d5c;
        if (uVar6 != 0xaa) {
          if (uVar6 == 0xab) goto LAB_00024dc4;
          if (uVar6 != 0xac) {
            if (uVar6 != 0x162) goto LAB_00024dd4;
            goto LAB_00024d54;
          }
        }
LAB_00024db0:
        uVar10 = (int)field[5] - 1;
      }
LAB_00024dd4:
      iVar7 = (int)(short)uVar10;
      uVar14 = CONCAT44(iVar7,uVar6);
      if (iVar7 < 0) {
        uVar10 = 0;
      }
      else {
        sVar5 = field[5];
        uVar14 = CONCAT44(iVar7,(int)sVar5);
        if (iVar7 < sVar5) {
          if (g_opts.diag_text) {
            fprintf(stderr, "[diagnav] key=0x%x uVar10(new)=%u uVar12(old)=%u itemcount=%d\n", uVar6, uVar10, uVar12, sVar5);
          }
          uVar14 = draw_chargen_field_options(field,uVar10 & 0xff,uVar12 & 0xff);
        }
        else {
          uVar10 = (int)sVar5 - 1;
        }
      }
      param_2 = (undefined4)((ulonglong)uVar14 >> 0x20);
      uVar6 = (uint)uVar14;
      uVar12 = uVar10;
    } while (uVar13 == 0);
    /* Log every confirmed chargen button selection (arrow-key/ENTER confirm or a click), so it's
       always visible which one fired -- see debug.h. field[6]==0 fields... */
    {
      char *item_text = "";
      if ((field[6] == 0) && (*(int *)(field + 3) != 0)) {
        item_text = get_message_string(*(byte *)(((char *)&DAT_000fb8f0 + *(int *)(field + 3)) + uVar10 * 2) | 0x400);
      }
      char *field_label = (*field != 0) ? get_message_string((int)*field | 0x400) : "";
    }
  }
  else {
    pcVar_str = get_message_string(uVar6 | 0x400);
    iVar7 = measure_text_width(pcVar_str);
    /* get_message_string's compressed-string decoder (walk_strings_pak_huffman_tree and its
       tree-walk helpers) has a separate, deeper bug -- confirmed via diagnostics that this field's
       label lookup returns a fragment of an unrelated... */
    if (0x40 < iVar7) {
      iVar7 = 0x40;
    }
    iVar7 = iVar7 + 0xa8;
    if (*(int *)(field + 3) == 0) {
      iVar9 = (int)(short)local_2c[0];
    }
    else {
      pcVar_off = (&DAT_000fb880)[field[6]] + DAT_000fb858;
      sVar5 = *field;
      chargen_ui_transition_hook(0);
      iVar9 = 0x14;
      if ((sVar5 != 0) == 0) {
        iVar9 = 0;
      }
      /* Same DAT_000fb880-is-never-written underflow guard as
         draw_chargen_field_value above -- see its comment. */
      if (pcVar_off - DAT_000fb858 < 4) {
        bVar1 = 0;
        iVar11 = 4;
      } else {
        bVar1 = *(byte *)(pcVar_off + -4);
        iVar11 = (short)(ushort)*(byte *)(pcVar_off + -3) + 4;
      }
      DAT_000fb858 = DAT_001005c4;
      sVar3 = field[5];
      sVar2 = ordint_divmod(0xc4 - iVar9,sVar3 * iVar11 + -4).quot;
      iVar9 = sVar2 + 1;
      *(char *)(field + 8) = (char)iVar9;
      *(char *)((char *)field + 0x11) = (char)((uint)iVar9 >> 8);
      iVar9 = iVar9 * 0x10000 >> 0x10;
      sVar3 = ordint_divmod(iVar9,iVar9 + sVar3 + -1).quot;
      *(char *)(field + 7) = (char)sVar3;
      *(char *)((char *)field + 0xf) = (char)((ushort)sVar3 >> 8);
      uVar4 = ordint_divmod(iVar9 + 1,0xa0 - (short)(ushort)bVar1 * iVar9).quot;
      *(char *)(field + 9) = (char)uVar4;
      *(char *)((char *)field + 0x13) = (char)((ushort)uVar4 >> 8);
      iVar9 = -(((int)(sVar5 != 0) + (int)sVar3) * iVar11);
      iVar11 = iVar9 + 200;
      if (iVar11 < 0) {
        iVar11 = iVar9 + 0xc9;
      }
      iVar9 = (short)(iVar11 >> 1) + 3;
    }
    local_2c[0] = local_2c[0] & 0xff;
    while( true ) {
      sVar5 = next_input_event();
      iVar11 = (int)sVar5;
      if (((iVar11 == 0xd) && (local_28 == 0)) || (iVar11 == 0x1b)) break;
      flush_dirty_rect_to_display(1);
      sVar3 = (short)iVar7;
      if (((iVar11 == -1) || (iVar8 = _isctype(iVar11,0x157), iVar8 == 0)) ||
         ((0x12d < sVar3 || (0x1c < (int)uVar13)))) {
        if ((iVar11 == 8) || (iVar11 == 0x91)) {
          if ((int)uVar13 < 1) {
            local_28 = 1;
          }
          else {
            uVar13 = uVar13 - 1;
            local_2c[0] = CONCAT11((undefined1)(local_2c[0] >> 8),*(undefined1 *)(g_chargen_textfield_buf + uVar13)
                                  );
            sVar5 = measure_text_width((char *)local_2c);
            iVar11 = ((int)sVar3 - (int)sVar5) * 0x10000;
            iVar7 = iVar11 >> 0x10;
            decrement_cursor_hide_depth();
            bitmap_blit_to_framebuffer(iVar7,iVar9,DAT_000fb898 + DAT_000fb858,0x10,0x91,
                         (short)((uint)iVar11 >> 0x10) + -0xa4,0,1);
            cursor_show_idle_tick();
          }
        }
      }
      else {
        local_2c[0] = CONCAT11((undefined1)(local_2c[0] >> 8),(char)sVar5);
        decrement_cursor_hide_depth();
        draw_text_string((char *)local_2c,iVar7,iVar9 + 3);
        cursor_show_idle_tick();
        iVar7 = measure_text_width((char *)local_2c);
        iVar7 = iVar7 + sVar3;
        local_28 = 0;
        *(char *)(g_chargen_textfield_buf + uVar13) = (char)sVar5;
        uVar13 = uVar13 + 1;
      }
    }
    uVar10 = 0;
    *(undefined1 *)(g_chargen_textfield_buf + uVar13) = 0;
  }
  return uVar10;
}


// was FUN_00035df8 -- takes no parameters and its decompiled body takes no action, yet every call
// site in src/chargen.c passes a 0/1 flag at UI-transition points (screen changes, button
// presses/releases).
void chargen_ui_transition_hook(int is_press)
{
}


/* Ghidra's auto-analysis never recognized chrbtns_bump_alloc_entry/chrbtns_offset_table_builder as
   real functions -- they're only reached indirectly (passed as callback pointers to
   load_gr_resource_entries at run_character_generator's call site below)... */

/* r1 = &DAT_000fb858; r2 = *r1 (current cursor); r0 = r2 + param_1; r1 = r0 (advance cursor by
   param_1 bytes); return r2 (the position before* advancing) -- a bump-pointer sub-allocator
   carving fixed- size chunks out of whatever buffer DAT_000fb858 currently points to. */
void *chrbtns_bump_alloc_entry(uint byte_count)
{
  char *old = DAT_000fb858;
  DAT_000fb858 = DAT_000fb858 + byte_count;
  return old;
}

/* r0 is loaded fresh from a literal (&DAT_000fb880), discarding whatever was passed in that
   register -- this callback's real parameters are param_2 (r1) and param_3 (r2, only its low 16
   bits used, sign-extended, as a table index). */
int chrbtns_offset_table_builder(void *unused, uint entry_size, int index)
{
  int idx = (short)(index & 0xffff);
  if (idx == 0) {
    DAT_000fb880_backing[0] = 5;
  }
  int old = DAT_000fb880_backing[idx];
  DAT_000fb880_backing[idx + 1] = old + entry_size;
  return (entry_size == 0) ? 0 : 1;
}

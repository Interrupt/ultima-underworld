/* The "babl" conversation/dialogue scripting VM: bytecode interpreter, script-callable native
   intrinsics (babl_builtin_*), the named script-variable bridge
   (babl_register_builtin/babl_set_variable/ babl_get_variable)... */
#include "headers/babl.h"
#include "headers/options.h"
#include <stdio.h>
#include <stdlib.h>

#define DAT_00101968 DAT_00101968_backing[0]
#define DAT_00085460 DAT_00085460_backing[0]
#define DAT_00085448 DAT_00085448_backing[0]
uw_mobile_object_t *DAT_00100674;
static uint *DAT_000bbf04;
static char s__SAVE0_bglobals_dat_00084538[] = "\\SAVE0\\bglobals.dat";
static char s__DATA_babglobs_dat_0008454c[] = "\\DATA\\babglobs.dat";
static undefined1 DAT_000bbf30;
static char *DAT_000bbf20;
static char *DAT_000bbf18;
static short DAT_000bbf7c;
/* Was `int` -- a real 64-bit heap pointer (babl_alloc, i.e. malloc) truncated through a 32-bit int,
   same bug class as DAT_000bbf70/ DAT_000bbf00 below (see their own comment)... */
static intptr_t DAT_000bbf14;
static short DAT_000bbf84;
static intptr_t DAT_000bbf0c; // was `int`, same DAT_000bbf14-derived-pointer truncation
static undefined2 DAT_000bbf88;
/* Was zero-initialized 8192-byte placeholders -- same "zero-init global missing real .data content"
   class as this file's many other string recoveries (e.g. s_sex_000851f8's own comment). */
static char s_val_00084560[] = "val";
static char s_length_00084564[] = "length";
static char s_find_0008456c[] = "find";
static char s_copy_00084574[] = "copy";
static char s_append_0008457c[] = "append";
static char s_contains_00084584[] = "contains";
static char s_plural_00084590[] = "plural";
static char s_random_00084598[] = "random";
static char s_compare_000845a0[] = "compare";
static int DAT_000bbf10;
static char *DAT_000bbf80;
static undefined2 DAT_000bbf8c;
undefined2 DAT_0024cfac;
static short DAT_000bbf24;
/* Was `int` -- build_babl_symbol_table assigns it a real 64-bit heap pointer (`DAT_000bbf70 =
   babl_alloc((iVar11+1)*0x20)`) and every reader throughout this whole babl-symbol-table cluster... */
static intptr_t DAT_000bbf70;
static intptr_t DAT_000bbf00; // was `int` -- babl_alloc'd function-pointer-table base, same bug
static short DAT_000bbf78;
static short DAT_000bbf2c;
static short DAT_000bbf74;
static short DAT_000bbf1c;
static short DAT_000bbf08;
/* Was a zero-initialized 8192-byte backing array -- same "real nonzero .data content missing from
   this port's build" bug class as several earlier-session fixes (message-scroll control codes,
   save-slot list text, etc). */
static char DAT_000845a8[] = "say";
static char s_respond_000845ac[] = "respond";
/* Sizing-audit pass: sum_barter_offer_value's own `iVar4<4` loop
   bound (2-byte stride for this param slot) -- max byte 3*2+1=7.
   Sized to 8 for headroom; down from 256. */
static undefined2 DAT_000bbfe8_backing[8];
#define DAT_000bbfe8 DAT_000bbfe8_backing[0]
static undefined2 DAT_000bbfd8;
static undefined2 DAT_000bbfdc;
static undefined1 DAT_000bc008;
static short DAT_000bc024;
static short DAT_000bc004;
static undefined2 DAT_000bbfbc;
static undefined2 DAT_000bbfe0;
static undefined2 DAT_000bbfb8;
static short *DAT_000bc020; /* ARM preference lists contain signed 16-bit words. */
static short *DAT_000bc000;
/* ARM has two 32-byte coordinate records; each contains four icon and four marker X/Y pairs. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined1 DAT_000845b8_backing[32] = {
  0x94, 0x00, 0x0c, 0x00, 0xa9, 0x00, 0x0c, 0x00, 0x94, 0x00, 0x1e, 0x00, 0xa9, 0x00, 0x1e, 0x00,
  0x91, 0x00, 0x13, 0x00, 0xbb, 0x00, 0x13, 0x00, 0x91, 0x00, 0x25, 0x00, 0xbb, 0x00, 0x25, 0x00,
};
#define DAT_000845b8 DAT_000845b8_backing[0]
#define DAT_000845ba DAT_000845b8_backing[2] /* ARM overlapping coordinate view. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined1 DAT_000845d8_backing[32] = {
  0x5b, 0x00, 0x0c, 0x00, 0x70, 0x00, 0x0c, 0x00, 0x5b, 0x00, 0x1e, 0x00, 0x70, 0x00, 0x1e, 0x00,
  0x58, 0x00, 0x13, 0x00, 0x82, 0x00, 0x13, 0x00, 0x58, 0x00, 0x25, 0x00, 0x82, 0x00, 0x25, 0x00,
};
#define DAT_000845d8 DAT_000845d8_backing[0]
#define DAT_000845da DAT_000845d8_backing[2] /* ARM overlapping coordinate view. */
/* Sizing-audit pass: sum_barter_offer_value's own `iVar4<4` loop
   bound, 4-byte stride (matching this element type exactly) -- max
   index 3. Sized to 8 for headroom; down from 256. */
static undefined4 DAT_000bbf98_backing[8];
#define DAT_000bbf98 DAT_000bbf98_backing[0]
/* Sizing-audit pass: reset loop `while(iVar7<4)` writes both
   `[iVar7]` and `[iVar7+4]` -- max index 7, 8 elements (16 bytes,
   undefined2 type). HARD. Down from 8192 elements (16384 bytes). */
static undefined2 DAT_000bbfa8_backing[8];
#define DAT_000bbfa8 DAT_000bbfa8_backing[0]
static undefined2 DAT_000bbfc0_backing[8];
#define DAT_000bbfc0 DAT_000bbfc0_backing[0]
/* Sizing-audit pass: same bound as DAT_000bbfe8 (sum_barter_offer_
   value's `iVar4<4` loop, 2-byte stride). Sized to 8; down from 256. */
static undefined2 DAT_000bbfd0_backing[8];
#define DAT_000bbfd0 DAT_000bbfd0_backing[0]
/* New this round -- referenced only via literal-pool constants inside
   babl_builtin_take_from_npc/take_id_from_npc (both still-unrecovered stubs at the time this was
   added). */
static intptr_t DAT_00202948; // was `int` in the raw decompile -- holds a real object pointer, same truncation bug class as every other pointer-holding global in this cluster
static short DAT_002020c4;
/* Sizing-audit pass: same bound as DAT_000bbf98 (sum_barter_offer_
   value's `iVar4<4` loop, 4-byte stride). Sized to 8; down from 256. */
static undefined4 DAT_000bbff0_backing[8];
#define DAT_000bbff0 DAT_000bbff0_backing[0]
/* Sizing-audit pass: init_barter_ui's own `while(iVar7<4)` loop --
   max index 3 (4 elements, 16 bytes). Down from 256. */
static undefined4 DAT_000bc010_backing[4];
#define DAT_000bc010 DAT_000bc010_backing[0]
static undefined4 DAT_000bc028_backing[4];
#define DAT_000bc028 DAT_000bc028_backing[0]
/* Marker coordinates occupy the second half of each barter coordinate record. */
#define PTR_DAT_000845c8 DAT_000845b8_backing[16] /* ARM overlapping coordinate view. */

#define DAT_000845e8 DAT_000845d8_backing[16] /* ARM overlapping coordinate view. */
/* ARM 0xbbfb0/0xbbfc8 are the second four words of the 0xbbfa8/0xbbfc0
   caches. init_barter_ui and item changes invalidate those words; separate
   arrays made offer evaluation reuse zero or stale values instead. */
#define DAT_000bbfb0 DAT_000bbfa8_backing[4]
#define DAT_000bbfc8 DAT_000bbfc0_backing[4]
static char s_npc_attitude_000845f8[] = "npc_attitude";
static char *DAT_00100784;
/* Was `undefined4`, truncating the real char* buffer pointer (DAT_00100784) assigned to it before
   every "heads"/"converse"/"genhead"/"charhead" resource load -- it's the bump-allocator cursor
   converse_res_bump_alloc_entry advances (see that function's comment). */
static char *DAT_00100670;
/* Was a lone `undefined4` scalar, but converse_res_slot_store_callback writes real pointers into it
   as an array (`DAT_00100728[idx] = allocated_buffer + 5`, one entry per loaded head/portrait) --
   same "array Ghidra saw as a single scalar" bug class as DAT_000fb880. */
static char *DAT_00100728_backing[256];
#define DAT_00100728 DAT_00100728_backing[0]
#define DAT_0010072c DAT_00100728_backing[1]
#define DAT_00100730 DAT_00100728_backing[2]
#define DAT_00100734 DAT_00100728_backing[3]
#define DAT_00100738 DAT_00100728_backing[4]
#define DAT_0010073c DAT_00100728_backing[5]
static undefined1 DAT_00100678;
undefined4 DAT_00085c54;
static char *DAT_001007c0; // was `undefined4` -- assigned a real 64-bit pointer (DAT_00100784, uw.c ~19277) and used as a real string buffer by babl_builtin_respond/echo_selected_conversation_choice/etc.; truncated on 64-bit, crashing the first time any of those functions actually ran (selecting a babl_menu response)
static char s_genhead_00084fd8[] = "genhead";
static char s_charhead_00084fe0[] = "charhead";
static char s_heads_00084fec[] = "heads";
static char s_converse_00084ff4[] = "converse";
/* HACK: "barter UI is up". The original exit_talk_mode tests this before calling end_barter_ui, but
   nothing in the decompile or the ARM disassembly ever sets it, so items left in the barter slots
   when a conversation ended were never returned. init_barter_ui now sets it and exit_talk_mode
   clears it after the cleanup. */
static short DAT_001006d0;
static char s_take_id_from_npc_0008519c[] = "take_id_from_npc";
static char s_take_from_npc_000851b0[] = "take_from_npc";
static char s_find_inv_000851c0[] = "find_inv";
static char s_give_to_npc_000851cc[] = "give_to_npc";
static char s_show_inv_000851d8[] = "show_inv";
static char s_print_000851e4[] = "print";
static char s_babl_ask_000851ec[] = "babl_ask";
/* Was a zero-initialized 8192-byte placeholder -- same "zero-init global missing real .data
   content" class as this file's many other string recoveries. */
static char s_sex_000851f8[] = "sex";
static char s_set_quest_000851fc[] = "set_quest";
static char s_get_quest_00085208[] = "get_quest";
static char s_babl_fmenu_00085214[] = "babl_fmenu";
static char s_babl_menu_00085220[] = "babl_menu";
/* Was `undefined4`, truncating the real char* buffer babl_alloc
   returns (assigned at its only writer) -- dereferenced directly a
   few lines after its only other read. */
static char *DAT_001007b8;
static char DAT_001007b4;
static char s_give_ptr_npc_00085000[] = "give_ptr_npc";
static char s_find_barter_total_00085010[] = "find_barter_total";
static char s_find_barter_00085024[] = "find_barter";
static char s_x_obj_pos_00085030[] = "x_obj_pos";
static char s_x_obj_stuff_0008503c[] = "x_obj_stuff";
static char s_x_traps_00085048[] = "x_traps";
static char s_x_skills_00085050[] = "x_skills";
static char s_remove_talker_0008505c[] = "remove_talker";
static char s_place_object_0008506c[] = "place_object";
static char s_add_to_npc_inv_0008507c[] = "add_to_npc_inv";
static char s_take_from_npc_inv_0008508c[] = "take_from_npc_inv";
static char s_set_race_attitude_000850a0[] = "set_race_attitude";
static char s_set_attitude_000850b4[] = "set_attitude";
static char s_gronk_door_000850c4[] = "gronk_door";
static char s_count_inv_000850d0[] = "count_inv";
static char s_set_inv_quality_000850dc[] = "set_inv_quality";
static char s_check_inv_quality_000850ec[] = "check_inv_quality";
static char s_do_inv_delete_00085100[] = "do_inv_delete";
static char s_do_inv_create_00085110[] = "do_inv_create";
static char s_set_likes_dislikes_00085120[] = "set_likes_dislikes";
static char s_pause_00085134[] = "pause";
static char s_setup_to_barter_0008513c[] = "setup_to_barter";
static char s_end_barter_0008514c[] = "end_barter";
static char s_do_judgement_00085158[] = "do_judgement";
static char s_do_decline_00085168[] = "do_decline";
static char s_do_demand_00085174[] = "do_demand";
static char s_do_offer_00085180[] = "do_offer";
static char s_identify_inv_0008518c[] = "identify_inv";
static short DAT_0010078c;
static short DAT_00100794;
/* Sizing-audit pass: no code-level cap exists -- indexed by DAT_00100794, a count of consecutive
   non-zero babl-script words read until a 0 sentinel (babl_menu/babl_fmenu). */
static undefined1 DAT_00100680_backing[8192];
#define DAT_00100680 DAT_00100680_backing[0]
static undefined2 DAT_00100790;
static short DAT_00100788;
/* Sizing-audit pass: sibling raw-string cache for DAT_00100680, same
   index (DAT_00100794) and same judgment-call headroom reasoning --
   see that array's own comment. Down from 65536. */
static undefined1 DAT_001006d8_backing[8192];
#define DAT_001006d8 DAT_001006d8_backing[0]
/* Was a lone `undefined2` scalar, but babl_menu/babl_fmenu/select_babl_menu_response all index it
   as a real array -- `(&DAT_00100770)[idx]` for idx up to 9 (a fixed "10 visible scroll lines" loop
   bound) and up to whatever message_scroll_print_wrapped's own wrapped-line-count returns... */
/* Sizing-audit pass: indexed by wrapped-line position, bounded by the same CONV.BYT-budget judgment
   call as its siblings DAT_00100680/ 001006d8/001007a0 (see DAT_00100680's own comment) -- a long
   menu message could wrap past the fixed "10 visible lines" bound... */
static short DAT_00100770_backing[1024];
#define DAT_00100770 DAT_00100770_backing[0]
/* Sizing-audit pass: same index/cap reasoning as DAT_00100680 above,
   but a 2-byte (short) stride, not 8 -- 1024 items * 2 = 2048 bytes.
   Down from 65536. */
static undefined1 DAT_001007a0_backing[2048];
#define DAT_001007a0 DAT_001007a0_backing[0]
/* DAT_00085230/34/38/3c are 4 tiny (<=3-char) control-code constants, packed 4 bytes apart in the
   original binary -- confirmed via a real Ghidra memory dump at 0x85230 rather than guessed: "\P\0"
   (0x5c 0x50 0x00), "\0\n" (0x5c 0x30 0x0a 0x00)... */
/* Sizing pass: these are 3-4-byte control-code constants (confirmed by
   a real Ghidra memory dump, see above); no indexing, nothing depends
   on a larger extent. */
static undefined1 DAT_00085230_backing[16] = { 0x5c,0x50,0x00 };
#define DAT_00085230 DAT_00085230_backing[0]
static undefined DAT_00085234_backing[16] = { 0x5c,0x30,0x0a,0x00 };
#define DAT_00085234 DAT_00085234_backing[0]
static undefined1 DAT_0008523c_backing[16] = { 0x5c,0x32,0x00 };
#define DAT_0008523c DAT_0008523c_backing[0]
static short DAT_001007bc;
/* DAT_00085240/44/48 are the look-text word-separator/article constants (" ", "a ", "an ") used by
   dispatch_object_action/dispatch_object_action_dup and build_creature_look_text to glue "a"/"an" +
   adjective + noun [+ "named" + proper name] together... */
 char DAT_00085240_backing[16] = " ";
/* Selected when the following word starts with a vowel (see the callers'
   own vowel checks) -- so this one is "an ", not "a ".
   Sizing pass: both are fixed 2-3 char literals with no indexing. */
 char DAT_00085244_backing[16] = "an ";
 char DAT_00085248_backing[16] = "a ";
static char s_npc_talkedto_00085340[] = "npc_talkedto";
static char s_npc_gtarg_00085350[] = "npc_gtarg";
static char s_npc_goal_0008535c[] = "npc_goal";
static char s_npc_power_00085368[] = "npc_power";
static char s_npc_arms_00085374[] = "npc_arms";
static char s_npc_hp_00085380[] = "npc_hp";
static char s_npc_health_00085388[] = "npc_health";
static char s_npc_hunger_00085394[] = "npc_hunger";
static char s_npc_whoami_000853a0[] = "npc_whoami";
/* Sizing-audit pass: DAT_001007e3/DAT_001007fd (used just below in sync_conv_vars_from_npc) were
   independent 256-byte arrays, but every use indexes them by the same per-class record base as
   g_monster_max_stats_table/DAT_001007d5 in this same function... */
static char s_play_name_0008524c[] = "play_name";
static char s_play_drawn_00085258[] = "play_drawn";
static char s_play_poison_00085264[] = "play_poison";
static char s_play_sex_00085270[] = "play_sex";
static char s_new_player_exp_0008527c[] = "new_player_exp";
static char s_game_days_0008528c[] = "game_days";
static char s_game_mins_00085298[] = "game_mins";
static char s_game_time_000852a4[] = "game_time";
static char s_dungeon_level_000852b0[] = "dungeon_level";
static char s_play_level_000852c0[] = "play_level";
static char s_play_mana_000852cc[] = "play_mana";
static char s_play_power_000852d8[] = "play_power";
static char s_play_arms_000852e4[] = "play_arms";
static char s_play_hp_000852f0[] = "play_hp";
static char s_play_health_000852f8[] = "play_health";
static char s_play_hunger_00085304[] = "play_hunger";
static char s_npc_name_00085310[] = "npc_name";
static char s_npc_yhome_0008531c[] = "npc_yhome";
static char s_npc_xhome_00085328[] = "npc_xhome";
static char s_npc_level_00085334[] = "npc_level";
undefined2 DAT_00101960;
ushort DAT_000853fc;
/* Sizing-audit pass: every build site does
   `ce_memset(&DAT_00101968,0,0x104)` right before use -- exact HARD
   bound, 260 bytes (MAX_PATH-style). Down from 8192. */
static undefined1 DAT_00101968_backing[260];
/* Sizing pass: this is the "CUTS"-directory override path string (cleared via
   ce_memset(&DAT_0023c698,0,0x104) in game.c, i.e. a Windows MAX_PATH=260-byte buffer by design). */
undefined1 DAT_0023c698_backing[1024];
static ushort DAT_00101a6c;
/* Bitmap workspace supplied by cache_ambient_sound_handle; retain the full
   allocation address on 64-bit hosts. */
uintptr_t DAT_00101a70;
/* Dispatch table of babl conversation-text render-time opcode handlers (distinct from the
   babl_builtin_* script-language builtins): a raw compiled dialogue-text stream can embed a byte <
   0x10 that indexes this table, each entry a... */
static const babl_render_op_fn PTR_FUN_00085408[16] = {
  (babl_render_op_fn)babl_render_op_wrap_message,
  (babl_render_op_fn)FUN_000362e8,
  (babl_render_op_fn)FUN_00036300,
  (babl_render_op_fn)FUN_00036308,
  (babl_render_op_fn)FUN_00036394,
  (babl_render_op_fn)FUN_000363f0,
  (babl_render_op_fn)FUN_00036404,
  (babl_render_op_fn)FUN_00036418,
  (babl_render_op_fn)babl_render_op_show_code,
  (babl_render_op_fn)FUN_000365bc,
  (babl_render_op_fn)FUN_000365fc,
  (babl_render_op_fn)FUN_0003663c,
  (babl_render_op_fn)FUN_00036698,
  (babl_render_op_fn)babl_render_op_say,
  (babl_render_op_fn)FUN_00036344,
  (babl_render_op_fn)babl_render_op_play_sound
};
static undefined1 DAT_00085448_backing[11] = "\\CSXXX.nXX";
char s_FONTBIG_SYS_00085454[] = "FONTBIG.SYS";
static undefined1 DAT_00085460_backing[11] = "\\CSXXX.N00";
/* decompress_rle_stream's own shared codec state (output/input cursors, byte counts, and the
   current/pending op-code value), threaded through its several sibling op-code handler functions
   (read_rle_op_code and others still unnamed below it). */
static undefined1 *DAT_00201b40; // output cursor
static int DAT_00201b54; // input bytes consumed so far
static int DAT_00201b4c; // output bytes written so far
static int DAT_00201b58; // "done" flag
static ushort DAT_00201b48; // current run/length value
static undefined1 *DAT_00201b50; // input cursor
static short DAT_00201b44; // current fill-byte/length accumulator
static int DAT_00201b3c; // current op code



/* Was a no-op stub -- the real function was never decompiled, so babl_builtin_set_attitude's own
   for_each_object_of_type iteration (invoked once per matching-race object it walks) silently never
   wrote the new attitude value into any of them. */
int babl_builtin_set_attitude_apply(char *npc, uint attitude)
{
  uint uVar1;

  uVar1 = *(ushort *)(npc + 0xd) & 0x3fff;
  *(char *)(npc + 0xd) = (char)uVar1;
  *(byte *)(npc + 0xe) = (byte)(uVar1 >> 8) | (byte)(((attitude & 3) << 0xe) >> 8);
  return 0;
}

/* Was a no-op stub here -- the real function was never decompiled, so the "length" babl builtin
   (registered a few hundred lines below) silently returned 0 (an empty-string length) whenever a
   script asked for a string's length, same bug class as babl_menu before its own recovery. */
// was FUN_00019a60
short babl_builtin_length(char *args)
{
  intptr_t iVar1;
  char *pcVar2;

  iVar1 = babl_read_var_word((int)*(short *)(args + -2));
  pcVar2 = (char *)get_message_string((int)iVar1);
  return ce_strlen(pcVar2);
}

/* Was a no-op stub here ("Ghidra couldn't resolve this address... safe no-op stub") -- the real
   function was never decompiled, so the "sex" babl builtin (registered under that exact script
   name, see start_npc_conversation) silently did nothing... */
// was FUN_0001840c
int babl_builtin_sex(char *args)
{
  /* Ghidra's own decompile of this one shows `void`, discarding babl_read_var_word's return value
     -- but on real ARM calling convention a tail call like this naturally leaves its callee's
     return value in r0 for the caller... */
  return babl_read_var_word((int)*(short *)(args + (intptr_t)((*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * 2) + -4));
}
/* Was a no-op stub here -- the real function was never decompiled, so the "do_decline" babl builtin
   (registered under that exact script name, see start_npc_conversation) silently did nothing
   whenever an NPC's barter script declined an offer... */
// was FUN_0001cd34
void babl_builtin_do_decline()

{
  finalize_npc_barter_items(0);
  return;
}
/* Was a no-op stub here ("Ghidra couldn't resolve this address... safe no-op stub") -- the real
   function was never decompiled, so the "take_from_npc" babl builtin... */
int babl_builtin_take_from_npc(char *args)
{
  uint uVar1;
  intptr_t iVar2;
  intptr_t *piVar3;
  intptr_t *piVar4;
  intptr_t iVar5;
  undefined2 uVar6;
  short sVar7;
  intptr_t iVar8;
  ushort *puVar9;
  intptr_t iVar10;
  undefined4 uVar11;
  bool bVar12;

  sVar7 = babl_read_var_word((int)*(short *)(args + -2));
  piVar4 = &DAT_00202948;
  piVar3 = (intptr_t *)&DAT_00100674;
  if (DAT_00202948 == 0) {
    iVar8 = (intptr_t)DAT_00100674;
    if ((*(byte *)(iVar8 + 0xe) & 0x10) == 0) {
      /* Was a dropped argument -- spawn_creature_death_loot's own K&R declaration (`void
         spawn_creature_death_loot(args)`) takes the creature object pointer, but every one of
         this file's 4 call sites invoked it with empty parens... */
      spawn_creature_death_loot(DAT_00100674);
      iVar8 = *piVar3;
    }
    puVar9 = (ushort *)resolve_object_link((ushort *)(iVar8 + 6));
    if (puVar9 != (ushort *)0x0) {
      uVar1 = (uint)sVar7;
      do {
        if ((int)uVar1 < 1000) {
          bVar12 = (((uw_object_hdr_t *)puVar9)->object_id) == uVar1;
        }
        else {
          bVar12 = uVar1 - 1000 == (uint)(((uw_object_hdr_t *)puVar9)->object_id >> 4);
        }
        if (bVar12) {
          object_list_unlink((byte *)(iVar8 + 6),(byte *)puVar9);
          iVar10 = check_object_carry_weight(puVar9);
          iVar8 = (intptr_t)&DAT_000bbfd0;
          if (iVar10 == 0) {
            iVar10 = 0;
            while (*(short *)(iVar8 + iVar10 * 2) != 0) {
              iVar10 = (intptr_t)(short)(iVar10 + 1);
              if (3 < iVar10) {
                iVar8 = drop_object_near_target((void *)*piVar3,puVar9,5,0);
                if (iVar8 == 0) {
                  uVar11 = 3;
                }
                else {
                  uVar11 = 2;
                }
                return uVar11;
              }
            }
            iVar2 = (intptr_t)(short)iVar10;
            uVar6 = encode_object_slot_index((char *)puVar9);
            iVar5 = (intptr_t)&DAT_000bbfa8;
            *(undefined2 *)(iVar8 + iVar2 * 2) = uVar6;
            *(undefined4 *)((intptr_t)&DAT_000bbf98 + iVar2 * 4) = 0;
            *(undefined2 *)((intptr_t)&DAT_000bbfc0 + (iVar2 + 4) * 2) = 0xffff;
            *(undefined2 *)(iVar5 + iVar2 * 2) = 0xffff;
            draw_hotspot_crosshair_marker(0,(int)iVar10);
            redraw_barter_slot_icon(1,(int)iVar10);
          }
          else {
            *piVar4 = (intptr_t)puVar9;
            decrement_cursor_hide_depth();
            push_cursor_icon(((uw_object_hdr_t *)puVar9)->object_id);
            DAT_002020c4 = 1;
            cursor_show_idle_tick();
            debug_noop_checkpoint();
          }
          return 1;
        }
        puVar9 = (ushort *)resolve_object_link(puVar9 + 2);
      } while (puVar9 != (ushort *)0x0);
    }
  }
  return 0;
}
/* Was a no-op stub -- same bug and same recovery as babl_builtin_take_from_npc just above (see its
   own comment for the full story and the helper/global mapping both share). */
int babl_builtin_take_id_from_npc(char *args)
{
  intptr_t iVar1;
  intptr_t *piVar2;
  intptr_t *piVar3;
  intptr_t iVar4;
  short sVar5;
  undefined2 uVar6;
  short sVar7;
  intptr_t iVar8;
  ushort *puVar9;
  intptr_t iVar10;
  undefined4 uVar11;

  sVar7 = babl_read_var_word((int)*(short *)(args + -2));
  piVar3 = &DAT_00202948;
  piVar2 = (intptr_t *)&DAT_00100674;
  if (DAT_00202948 == 0) {
    iVar8 = (intptr_t)DAT_00100674;
    for (puVar9 = (ushort *)resolve_object_link((ushort *)(iVar8 + 6)); puVar9 != (ushort *)0x0;
        puVar9 = (ushort *)resolve_object_link(puVar9 + 2)) {
      sVar5 = encode_object_slot_index((char *)puVar9);
      if (sVar7 == sVar5) {
        object_list_unlink((byte *)(iVar8 + 6),(byte *)puVar9);
        iVar10 = check_object_carry_weight(puVar9);
        iVar8 = (intptr_t)&DAT_000bbfd0;
        if (iVar10 == 0) {
          iVar10 = 0;
          while (*(short *)(iVar8 + iVar10 * 2) != 0) {
            iVar10 = (intptr_t)(short)(iVar10 + 1);
            if (3 < iVar10) {
              iVar8 = drop_object_near_target((void *)*piVar2,puVar9,5,0);
              if (iVar8 == 0) {
                uVar11 = 3;
              }
              else {
                uVar11 = 2;
              }
              return uVar11;
            }
          }
          iVar1 = (intptr_t)(short)iVar10;
          uVar6 = encode_object_slot_index((char *)puVar9);
          iVar4 = (intptr_t)&DAT_000bbfa8;
          *(undefined2 *)(iVar8 + iVar1 * 2) = uVar6;
          *(undefined4 *)((intptr_t)&DAT_000bbf98 + iVar1 * 4) = 0;
          *(undefined2 *)((intptr_t)&DAT_000bbfc0 + (iVar1 + 4) * 2) = 0xffff;
          *(undefined2 *)(iVar4 + iVar1 * 2) = 0xffff;
          draw_hotspot_crosshair_marker(0,(int)iVar10);
          redraw_barter_slot_icon(1,(int)iVar10);
        }
        else {
          *piVar3 = (intptr_t)puVar9;
          decrement_cursor_hide_depth();
          push_cursor_icon(((uw_object_hdr_t *)puVar9)->object_id);
          DAT_002020c4 = 1;
          cursor_show_idle_tick();
          debug_noop_checkpoint();
        }
        return 1;
      }
    }
  }
  return 0;
}
/* Was a no-op stub -- same bug and same recovery as the two babl_builtin_take_from_npc /
   babl_builtin_take_id_from_npc functions above. */
int babl_builtin_do_inv_create(char *args)
{
  ushort uVar1;
  intptr_t *piVar2;
  ushort *puVar3;
  ushort *puVar4;
  undefined4 uVar5;
  int iVar6;

  uVar5 = babl_read_var_word((int)*(short *)(args + -2));
  puVar3 = (ushort *)spawn_new_object(uVar5,0);
  piVar2 = (intptr_t *)&DAT_00100674;
  if (puVar3 == (ushort *)0x0) {
    uVar5 = 0;
  }
  else {
    uVar1 = ((uw_object_hdr_t *)puVar3)->chain_word;
    ((uw_object_hdr_t *)puVar3)->chain_word_low = (byte)uVar1 | 0x3f;
    ((uw_object_hdr_t *)puVar3)->chain_word_high = (byte)(char)(uVar1 >> 8);
    puVar4 = (ushort *)(*piVar2 + 6);
    while (puVar4 = (ushort *)resolve_object_link(puVar4), puVar4 != (ushort *)0x0) {
      if ((((((uw_object_hdr_t *)puVar3)->is_quant != 0) && ((*puVar4 & 0x8000) != 0)) && ((((uw_object_hdr_t *)puVar3)->link & 0x200) == 0))
          && ((((puVar4[3] & 0x8000) == 0 && (((*puVar4 ^ ((uw_object_hdr_t *)puVar3)->type_flags) & 0x1ff) == 0)) &&
               ((ushort)((puVar4[3] >> 6) + (((uw_object_hdr_t *)puVar3)->link)) < 999)))) {
        iVar6 = (puVar4[3] & 0xffc0) + (((uw_object_hdr_t *)puVar3)->link << 6);
        *(byte *)(puVar4 + 3) = (byte)iVar6 ^ (byte)puVar4[3] & 0x3f;
        *(char *)((char *)puVar4 + 7) = (char)((uint)iVar6 >> 8);
        free_object_slot(puVar3);
        puVar3 = (ushort *)0x0;
        break;
      }
      puVar4 = puVar4 + 2;
    }
    if (puVar3 != (ushort *)0x0) {
      object_list_insert_head((byte *)(*piVar2 + 6),(byte *)puVar3);
    }
    uVar5 = encode_object_slot_index((char *)puVar3);
  }
  return uVar5;
}




// was FUN_00017be8
void babl_builtin_set_attitude(char *args)
{
  undefined4 uVar1;
  undefined4 uVar2;
  
  uVar1 = babl_read_var_word((int)*(short *)(args + -2));
  uVar2 = babl_read_var_word((int)*(short *)(args + -4));
  for_each_object_of_type(uVar2,0,uVar1,&babl_builtin_set_attitude_apply);
}



// was FUN_00017c1c
void babl_builtin_set_race_attitude(char *args)
{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  uint uVar6;
  uw_mobile_object_t *puVar7;
  short sVar8;
  int iVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  int iVar9;
  
  iVar5 = babl_read_var_word((int)*(short *)(args + -2));
  uVar2 = babl_read_var_word((int)*(short *)(args + -4));
  uVar3 = babl_read_var_word((int)*(short *)(args + -6));
  uVar1 = DAT_00100674->hdr.type_flags;
  uVar11 = (uint)(DAT_00100674->tile_x);
  iVar13 = uVar11 - iVar5;
  uVar6 = DAT_00100674->tile_y;
  iVar10 = uVar6 - iVar5;
  if (iVar13 * 0x10000 >> 0x10 < 1) {
    iVar13 = 1;
  }
  iVar9 = uVar11 + iVar5;
  sVar8 = (short)iVar9;
  if (iVar10 * 0x10000 >> 0x10 < 1) {
    iVar10 = 1;
  }
  iVar5 = uVar6 + iVar5;
  sVar4 = (short)iVar5;
  if (0x3f < iVar9 * 0x10000 >> 0x10) {
    sVar8 = 0x3f;
  }
  if (0x3f < iVar5 * 0x10000 >> 0x10) {
    sVar4 = 0x3f;
  }
  if ((int)(short)iVar10 <= (int)sVar4) {
    iVar9 = iVar13;
    iVar5 = (int)(short)iVar13;
    iVar12 = (int)(short)iVar10;
    do {
      while (iVar5 <= sVar8) {
        /* was folded into `int iVar5` (reused elsewhere as a loop-index
           int) -- truncated tilemap_lookup's real `void *` return */
        char *_tile5 = (char *)tilemap_lookup(iVar9,iVar10);
        puVar7 = (uw_mobile_object_t *)resolve_object_link(_tile5 + 2);
        if (puVar7 != NULL) {
          do {
            if ((((puVar7->hdr.object_id) == (int)(short)(uVar1 & 0x1ff)) && ((puVar7->movement_flags & 0x80) == 0)) &&
                ((byte) g_monster_type_props[(puVar7->hdr.object_id & 0x3f)].race_flags == uVar3)) {
              uVar11 = puVar7->status_word & 0x3fff;
              puVar7->npc_attitude = uVar2 & 3;
            }
            puVar7 = (uw_mobile_object_t *)resolve_object_link(&puVar7->hdr.chain_word);
          } while (puVar7 != NULL);
        }
        iVar9 = iVar9 + 1;
        iVar5 = iVar9 * 0x10000 >> 0x10;
      }
      iVar10 = (iVar12 + 1) * 0x10000 >> 0x10;
      iVar9 = iVar13;
      iVar5 = (int)(short)iVar13;
      iVar12 = iVar10;
    } while (iVar10 <= sVar4);
  }
}



// was FUN_00017e10
byte babl_builtin_x_skills(char *args)
{
  short sVar1;
  short sVar2;

  sVar1 = babl_read_var_word((int)*(short *)(args + -4));
  sVar2 = babl_read_var_word((int)*(short *)(args + -2));
  if (sVar2 == 10000) {
    roll_skill_use_improvement((int)(char)sVar1);
  }
  else if ((-1 < sVar2) && (sVar2 < 0x1f)) {
    *(char *)(DAT_00086df8 + sVar1 + 0x21) = (char)sVar2;
  }
  return *(undefined1 *)(DAT_00086df8 + sVar1 + 0x21);
}



// was FUN_00017e90
byte babl_builtin_x_traps(char *args)
{
  short sVar1;
  short sVar2;

  sVar1 = babl_read_var_word((int)*(short *)(args + -4));
  sVar2 = babl_read_var_word((int)*(short *)(args + -2));
  if ((-1 < sVar2) && (sVar2 < 0x40)) {
    *(char *)(DAT_00086df8 + sVar1 + 0x70) = (char)sVar2;
  }
  return *(undefined1 *)(DAT_00086df8 + sVar1 + 0x70);
}



// was FUN_00017eec
int babl_builtin_place_object(char *args)
{
  int iVar1;
  ushort uVar2;
  undefined4 uVar3;
  undefined1 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  ushort *puVar7;
  int iVar8;
  void *link_cursor;
  byte *pbVar9;
  
  uVar3 = babl_read_var_word((int)*(short *)(args + -6));
  puVar4 = (undefined1 *)get_object_record_by_slot_index(uVar3);
  uVar5 = babl_read_var_word((int)*(short *)(args + -4));
  uVar6 = babl_read_var_word((int)*(short *)(args + -2));
  puVar7 = (ushort *)((char *)&DAT_00100674->hdr.link_word);
  uVar2 = *puVar7;
  if ((uVar2 & 0xffc0) != 0) {
    do {
      if ((uint)(uVar2 >> 6) == (int)(short)uVar3) break;
      /* Was called with no argument (also true at ~30 other call sites throughout this file) --
         verified against real ARM disassembly (Ghidra, UU.exe) that every one of them DOES set up a
         real r0 argument in the compiled binary; Ghidra's decompiler just failed to show it... */
      link_cursor = resolve_object_link(puVar7);
      puVar7 = (ushort *)((char *)link_cursor + 4);
      uVar2 = *puVar7;
    } while ((uVar2 & 0xffc0) != 0);
  }
  if ((*puVar7 & 0xffc0) != 0) {
    object_list_unlink((char *)&DAT_00100674->hdr.link_word,puVar4);
  }
  iVar8 = (int)(short)uVar5;
  if (iVar8 < 0) {
    DAT_00202c84 = 1;
    place_object_in_world(g_player_object->tile_word >> 7 & 0x1f8,
                          g_player_object->tile_word >> 1 & 0x1f8,
                          g_player_object->hdr.zpos,
                          puVar4,6,1);
    DAT_00202c84 = 0;
LAB_0001818c:
    uVar3 = 1;
  }
  else {
    if ((((0 < iVar8) && (iVar8 < 0x40)) && (iVar1 = (int)(short)uVar6, 0 < iVar1)) &&
       (iVar1 < 0x40)) {
      pbVar9 = (byte *)tilemap_lookup(uVar5,uVar6);
      uVar2 = ((uw_object_hdr_t *)puVar4)->position_word;
      ((uw_object_hdr_t *)puVar4)->position_word_low = (byte)(uVar2 & 0xff80) | *pbVar9 >> 1 & 0x78;
      ((uw_object_hdr_t *)puVar4)->position_word_high = (char)((uVar2 & 0xff80) >> 8);
      iVar8 = check_object_placement_clearance(((uw_object_hdr_t *)puVar4)->object_id,
                                               uVar3,(iVar8 << 0x13) >> 0x10,
                                               (iVar1 << 0x13) >> 0x10,
                                               (ushort)(*pbVar9 >> 4) << 3,1,
                                               (g_object_type_props[(((uw_object_hdr_t *)puVar4)->object_id)].collision_radius) + 4);
      if (iVar8 != 0) {
        object_list_append_tail(pbVar9 + 2,puVar4);
        settle_dropped_object(puVar4,uVar5,uVar6,1);
        goto LAB_0001818c;
      }
    }
    uVar3 = 0;
  }
  return uVar3;
}



// was FUN_000181a4
ushort babl_builtin_take_from_npc_inv(char *args)
{
  short sVar1;
  ushort *puVar2;
  void *iVar3;
  int iVar4;
  
  sVar1 = babl_read_var_word((int)*(short *)(args + -2));
  iVar4 = 0;
  puVar2 = (ushort *)((char *)&DAT_00100674->hdr.link_word);
  if (0 < sVar1) {
    do {
      if ((*puVar2 & 0xffc0) == 0) break;
      iVar3 = resolve_object_link(puVar2);
      iVar4 = iVar4 + 1;
      puVar2 = (ushort *)(iVar3 + 4);
    } while (iVar4 * 0x10000 >> 0x10 < (int)sVar1);
  }
  return *puVar2 >> 6;
}



// was FUN_00018230
void babl_builtin_add_to_npc_inv(char *args)
{
  void *uVar1;

  uVar1 = get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -2)));  /* r0 passthrough */
  object_list_append_tail((char *)&DAT_00100674->hdr.link_word,uVar1);
}




// was FUN_000182b4
void babl_builtin_set_quest(char *args)
{
  short sVar1;
  short sVar2;
  uint uVar3;
  
  sVar1 = babl_read_var_word((int)*(short *)(args + -4));
  sVar2 = babl_read_var_word((int)*(short *)(args + -2));
  uVar3 = (uint)sVar1;
  if (-1 < (int)uVar3) {
    if ((int)uVar3 < 0x20) {
      if (sVar2 == 0) {
        uVar3 = *(uint *)(DAT_00086df8 + 0x65) & ~(1U << (uVar3 & 0xff));
      }
      else {
        uVar3 = *(uint *)(DAT_00086df8 + 0x65) | 1U << (uVar3 & 0xff);
      }
      *(char *)(DAT_00086df8 + 0x65) = (char)uVar3;
      *(char *)(DAT_00086df8 + 0x66) = (char)(uVar3 >> 8);
      *(char *)(DAT_00086df8 + 0x67) = (char)(uVar3 >> 0x10);
      *(char *)(DAT_00086df8 + 0x68) = (char)(uVar3 >> 0x18);
    }
    else if ((int)uVar3 < 0x24) {
      *(char *)(uVar3 + DAT_00086df8 + 0x49) = (char)sVar2;
    }
  }
}



// was FUN_00018370
byte babl_builtin_get_quest(char *args)
{
  int iVar1;
  short sVar2;
  
  sVar2 = babl_read_var_word((int)*(short *)(args + -2));
  iVar1 = (int)sVar2;
  if (-1 < iVar1) {
    if (0x1f < iVar1) {
      if (0x23 < iVar1) {
        return *(undefined1 *)(DAT_00086df8 + 0x6d);
      }
      return *(undefined1 *)(iVar1 + DAT_00086df8 + 0x49);
    }
    sVar2 = babl_read_var_word((int)*(short *)(args + -2));
    if ((*(uint *)(DAT_00086df8 + 0x65) & 1U << ((int)sVar2 & 0xffU)) != 0) {
      return 1;
    }
  }
  return 0;
}



// was FUN_00018430
int babl_builtin_gronk_door(char *args)
{
  undefined2 uVar1;
  undefined2 uVar2;
  short sVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  /* HACK: was plain `int iVar6` -- truncated find_object_in_chain's real `ushort *` return (same
     bug class as its own signature comment) on this 64-bit host. */
  ushort *iVar6;
  ushort *local_24;   /* was int -- holds tilemap_lookup()+2, a 64-bit ptr */

  uVar4 = babl_read_var_word((int)*(short *)(args + -4));
  uVar5 = babl_read_var_word((int)*(short *)(args + -6));
  local_24 = (ushort *)((char *)tilemap_lookup(uVar5,uVar4) + 2);
  iVar6 = find_object_in_chain(&local_24,0,5,0,0xffff);
  if ((iVar6 == (ushort *)0x0) &&
     (iVar6 = find_object_in_chain(&local_24,0,7,0,0xf), iVar6 == (ushort *)0x0)) {
    uVar4 = 0;
  }
  else {
    uVar2 = DAT_002020a4;
    uVar1 = DAT_002020a0;
    DAT_002020a0 = babl_read_var_word((int)*(short *)(args + -6));
    DAT_002020a4 = babl_read_var_word((int)*(short *)(args + -4));
    sVar3 = babl_read_var_word((int)*(short *)(args + -2));
    if (sVar3 == 0) {
      close_door_object(0,iVar6);
    }
    else if (sVar3 == 1) {
      open_door_object(iVar6);
    }
    else if (sVar3 == 2) {
      toggle_door_object(0,iVar6);
    }
    uVar4 = 1;
    DAT_002020a0 = uVar1;
    DAT_002020a4 = uVar2;
  }
  return uVar4;
}



// was FUN_0001853c
void babl_builtin_x_obj_stuff(char *args)
{
  ushort uVar1;
  byte bVar2;
  short sVar3;
  short *psVar4;
  ushort *puVar5;
  short *psVar6;
  short *psVar7;
  short *psVar8;
  short *psVar9;
  ushort *puVar10;

  ushort *puVar11_rec;
  uint uVar12;
  
  psVar4 = (short *)babl_var_word_addr((int)*(short *)(args + -0xe));
  puVar5 = (ushort *)babl_var_word_addr((int)*(short *)(args + -0xc));
  psVar6 = (short *)babl_var_word_addr((int)*(short *)(args + -10));
  psVar7 = (short *)babl_var_word_addr((int)*(short *)(args + -8));
  psVar8 = (short *)babl_var_word_addr((int)*(short *)(args + -6));
  psVar9 = (short *)babl_var_word_addr((int)*(short *)(args + -4));
  puVar10 = (ushort *)babl_var_word_addr((int)*(short *)(args + -2));
  puVar11_rec = (ushort *)get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -0x12)));  /* r0 passthrough */
  sVar3 = babl_read_var_word((int)*(short *)(args + -0x10));
  if (sVar3 == 0) {
    if (((*psVar4 != -1) && ((((uw_object_hdr_t *)puVar11_rec)->object_id & 0x1c0) != 0x140)) &&
        ((g_object_type_props[(((uw_object_hdr_t *)puVar11_rec)->object_id)].class_flags & 3) != 2)) {
      *psVar4 = (short)(((uw_object_hdr_t *)puVar11_rec)->heading);
    }
    if (*puVar5 != 0xffff) {
      *puVar5 = ((uw_object_hdr_t *)puVar11_rec)->owner;
    }
    if (*psVar6 != -1) {
      *psVar6 = (short)((((uw_object_hdr_t *)puVar11_rec)->type_flags_high & 0x1e) >> 1);
    }
    if (*psVar7 != -1) {
      *psVar7 = (short)(((((uw_object_hdr_t *)puVar11_rec)->link & 0x1ff) << 6) >> 6);
    }
    if (*psVar8 != -1) {
      *psVar8 = ((short)(char)((uw_object_hdr_t *)puVar11_rec)->type_flags_high & 4U) << 8;
    }
    if (*psVar9 != -1) {
      *psVar9 = ((short)(char)((uw_object_hdr_t *)puVar11_rec)->type_flags_high & 2U) << 8;
    }
    if (*puVar10 != 0xffff) {
      *puVar10 = ((uw_object_hdr_t *)puVar11_rec)->quality;
    }
  }
  else {
    if ((((int)*psVar4 != 0xffffffff) && ((((uw_object_hdr_t *)puVar11_rec)->object_id & 0x1c0) != 0x140)) &&
        ((g_object_type_props[(((uw_object_hdr_t *)puVar11_rec)->object_id)].class_flags & 3) != 2)) {
      uVar12 = ((uw_object_hdr_t *)puVar11_rec)->position_word & 0xfc7f | ((int)*psVar4 & 7U) << 7;
      ((uw_object_hdr_t *)puVar11_rec)->position_word = (ushort)uVar12;
    }
    if (*puVar5 != 0xffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->link_word;
      bVar2 = (byte)uVar1;
      ((uw_object_hdr_t *)puVar11_rec)->link_word_low = (bVar2 ^ (byte)*puVar5) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)puVar11_rec)->link_word_high = (byte)(char)(uVar1 >> 8);
    }
    sVar3 = *psVar6;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->type_flags;
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_low = (byte)(char)(uVar1 & 0xe1ff);
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_high =
          (byte)((uVar1 & 0xe1ff) >> 8) | (byte)((((int)sVar3 & 0xfU) << 9) >> 8);
    }
    uVar12 = (uint)*psVar7;
    if (uVar12 != 0xffffffff) {
      ((uw_object_hdr_t *)puVar11_rec)->link_word_low = ((uw_object_hdr_t *)puVar11_rec)->owner | (byte)(uVar12 << 6);
      ((uw_object_hdr_t *)puVar11_rec)->link_word_high = (byte)(char)((uVar12 & 0x3ffffff | 0xfe00) >> 2);
    }
    sVar3 = *psVar8;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->type_flags;
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_low = (byte)(char)(uVar1 & 0xfbff);
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_high =
          (byte)((uVar1 & 0xfbff) >> 8) | (byte)((((int)sVar3 & 1U) << 10) >> 8);
    }
    sVar3 = *psVar9;
    if ((int)sVar3 != 0xffffffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->type_flags;
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_low = (byte)(char)(uVar1 & 0xfdff);
      ((uw_object_hdr_t *)puVar11_rec)->type_flags_high =
          (byte)((uVar1 & 0xfdff) >> 8) | (byte)((((int)sVar3 & 1U) << 9) >> 8);
    }
    if (*puVar10 != 0xffff) {
      uVar1 = ((uw_object_hdr_t *)puVar11_rec)->chain_word;
      bVar2 = (byte)uVar1;
      ((uw_object_hdr_t *)puVar11_rec)->chain_word_low = (bVar2 ^ (byte)*puVar10) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)puVar11_rec)->chain_word_high = (byte)(char)(uVar1 >> 8);
    }
  }
}



// was FUN_000188fc
void babl_builtin_x_obj_pos(char *args)
{
  short sVar1;
  ushort *puVar2;
  short *psVar3;
  ushort *puVar4;
  uw_object_hdr_t *iVar5;
  uw_tile_t *pbVar6;
  uint uVar7;
  ushort uVar8;
  
  puVar2 = (ushort *)babl_var_word_addr((int)*(short *)(args + -6));
  psVar3 = (short *)babl_var_word_addr((int)*(short *)(args + -4));
  puVar4 = (ushort *)babl_var_word_addr((int)*(short *)(args + -2));
  iVar5 = get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -10)));  /* r0 passthrough */
  sVar1 = babl_read_var_word((int)*(short *)(args + -8));
  if (sVar1 == 0) {
    if (*puVar2 != 0xffff) {
      *puVar2 = (ushort)(iVar5->xpos);
    }
    if (*psVar3 != -1) {
      *psVar3 = (short)(iVar5->ypos);
    }
    if (*puVar4 != 0xffff) {
      *puVar4 = iVar5->zpos;
    }
  }
  else {
    uVar8 = *puVar2;
    if (uVar8 != 0xffff) {
      uVar7 = iVar5->position_word & 0x1fff;
      iVar5->xpos = uVar8 & 7;
    }
    sVar1 = *psVar3;
    if ((int)sVar1 != 0xffffffff) {
      uVar7 = iVar5->position_word & 0xe3ff;
      iVar5->ypos = sVar1 & 7;
    }
    uVar8 = *puVar4;
    if (uVar8 != 0xffff) {
      if ((short)uVar8 < 0x80) {
        iVar5->zpos = uVar8 & 0x7f;
        uVar8 = iVar5->position_word;
      }
      else {
        pbVar6 = (uw_tile_t *)tilemap_lookup((int)(short)*puVar2,
                                             (int)*psVar3);
        iVar5->zpos = pbVar6->floor_height << 3;
        uVar8 = iVar5->position_word;
      }
      iVar5->position_word = uVar8;
    }
  }
}



// was FUN_00018ac8
/* HACK: this whole function was a hand-rolled, fixed-pool free-list allocator whose "next free
   block" links are packed as 4 INDIVIDUAL BYTES within the block header... */
void *babl_alloc(int byte_count)
{
  return malloc((size_t)byte_count);
}



// was FUN_00018ccc
/* HACK: matching replacement for babl_alloc -- see its own comment. */
void babl_free(void *block)
{
  if (block != 0) {
    free((void *)block);
  }
}



// was FUN_00018f34
/* HACK: matching replacement for babl_alloc/babl_free -- see their own comments. */
void *babl_resize(void *block, int new_size)
{
  (void)new_size;
  return block;
}




// was FUN_0001927c
void load_npc_conversation_variables(void *buffer, short conversation_id)
{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  bool bVar2;
  char *pcVar3;
  int iVar4;
  uint uVar5;
  /* Same "two separate stack locals read as one 4-byte record" bug as
     save_npc_conversation_variables's own matching comment (its save-side mirror) -- see there for
     the full explanation. */
  undefined1 local_124_backing[4];
  #define local_124 (*(short *)(local_124_backing + 0))
  #define local_122 (*(short *)(local_124_backing + 2))
  char acStack_11c [260];

  pcVar3 = &DAT_0023cca8;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__SAVE0_bglobals_dat_00084538);
  iVar4 = open_file_for_read(acStack_11c);
  if (iVar4 != -1) {
    bVar2 = false;
    do {
      uVar5 = read_file_handle(iVar4,local_124_backing,4);
      if ((uVar5 < 4) || ((int)(uint)DAT_001007c4 < (int)local_124)) {
        break;
      }
      if ((int)local_124 == (uint)DAT_001007c4) {
        if (conversation_id < local_122) {
          local_122 = conversation_id;
        }
        uVar5 = read_file_handle(iVar4,buffer,(int)local_122 << 1);
        if (uVar5 < (uint)((int)local_122 << 1)) {
          bVar2 = true;
        }
      }
      else {
        seek_file_handle(iVar4,(int)local_122 << 1,1);
      }
    } while (!bVar2);
    CloseHandle(iVar4);
  }
  #undef local_124
  #undef local_122
}




// was FUN_000196c0
int babl_builtin_random(char *args)
{
  short sVar1;

  sVar1 = babl_read_var_word((int)*(short *)(args + -2));
  sVar1 = rand_below((int)sVar1);
  return sVar1 + 1;
}



// was FUN_000196e8
bool babl_builtin_compare(char *arg_stack)
{
  char cVar1;
  short sVar2;
  int iVar1;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  char *pcDst;
  char acStack_218 [256];
  char acStack_118 [256];

  /* Was 4 dropped register-forwarding args (Ghidra faithfully preserved the original ARM code
     relying on a value staying in r0 across back-to-back `bl`s with no reload -- confirmed real
     elsewhere this session, e.g. FUN_00019470's own comment)... */
  iVar1 = babl_read_var_word((int)*(short *)(arg_stack + -2));
  pcVar3 = (char *)get_message_string(iVar1);
  pcVar4 = (char *)babl_expand_string_refs(pcVar3);
  iVar1 = babl_read_var_word((int)*(short *)(arg_stack + -4));
  pcVar5 = (char *)get_message_string(iVar1);
  pcVar6 = (char *)babl_expand_string_refs(pcVar5);
  /* (was copied through a truncated `dst - src` int offset; now plain strcpy-style loops) */
  pcVar7 = pcVar6;
  pcDst = acStack_118;
  do {
    cVar1 = *pcVar7;
    *pcDst++ = cVar1;
    pcVar7 = pcVar7 + 1;
  } while (cVar1 != '\0');
  pcVar7 = pcVar4;
  pcDst = acStack_218;
  do {
    cVar1 = *pcVar7;
    *pcDst++ = cVar1;
    pcVar7 = pcVar7 + 1;
  } while (cVar1 != '\0');
  _strlwr(acStack_118);
  _strlwr(acStack_218);
  sVar2 = ce_strcmp(acStack_118,acStack_218);
  if (pcVar5 != pcVar6) {
    babl_free(pcVar6);
  }
  if (pcVar3 != pcVar4) {
    babl_free(pcVar4);
  }
  return sVar2 == 0;
}



// was FUN_000197c0
int babl_builtin_plural(char *args)
{
  short sVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  
  sVar1 = babl_read_var_word((int)*(short *)(args + -6));
  uVar2 = babl_read_var_word((int)*(short *)(args + -4));
  uVar3 = babl_read_var_word((int)*(short *)(args + -2));
  if (sVar1 < 2) {
    uVar3 = uVar2;
  }
  return uVar3;
}



// was FUN_000197fc
int babl_builtin_contains(char *arg_stack)
{
  /* uVar1/iVar2/uVar3/uVar4/iVar5/iVar7 were `undefined4`/`int` (4 bytes) but hold real string
     pointers from get_message_string/babl_expand_string_refs/ ce_strstr (iVar5 doubly so -- reused
     below as `iVar5 = iVar2` then in pointer arithmetic `iVar5 = iVar5 + iVar7`)... */
  intptr_t uVar1;
  intptr_t iVar2;
  intptr_t uVar3;
  intptr_t uVar4;
  intptr_t iVar5;
  int iVar6;
  intptr_t iVar7;

  /* Was 4 dropped register-forwarding args -- same class as babl_builtin_compare's
     own comment (uw.c ~10977). Chained explicitly. */
  iVar5 = babl_read_var_word((int)*(short *)(arg_stack + -2));
  uVar1 = (intptr_t)get_message_string((int)iVar5);
  iVar2 = (intptr_t)babl_expand_string_refs((char *)uVar1);
  iVar5 = babl_read_var_word((int)*(short *)(arg_stack + -4));
  uVar3 = (intptr_t)get_message_string((int)iVar5);
  uVar4 = (intptr_t)babl_expand_string_refs((char *)uVar3);
  _strlwr((char *)(intptr_t)(uVar3));
  _strlwr((char *)(intptr_t)(uVar1));
  iVar5 = iVar2;
  do {
    iVar7 = (intptr_t)ce_strstr((const char *)(intptr_t)(iVar5),(const char *)(intptr_t)(uVar4));
    if (iVar7 == 0) {
      return 0;
    }
    iVar5 = ce_strlen((const char *)(intptr_t)(uVar4));
    if ((iVar7 != 0) &&
       (((iVar7 == iVar2 || (iVar6 = _isctype((int)*(char *)(iVar7 + -1),8), iVar6 != 0)) ||
        (iVar6 = _isctype((int)*(char *)(iVar7 + -1),0x10), iVar6 != 0)))) {
      iVar6 = (int)*(char *)(iVar5 + iVar7);
      if (((iVar6 == 0) || (iVar6 = _isctype(iVar6,8), iVar6 != 0)) ||
         (iVar6 = _isctype((int)*(char *)(iVar5 + iVar7),0x10), iVar6 != 0)) {
        return 1;
      }
    }
    iVar5 = (intptr_t)iVar5 + iVar7;
  } while( true );
}



// was FUN_000198e8
void babl_builtin_append(char *arg_stack)
{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  uint uVar4;
  uint uVar5;
  int iVar6;
  char *pcDst;
  char *pcDstBase;
  
  /* Was 4 dropped register-forwarding args (2x get_message_string, 2x ce_strlen) -- same class as
     babl_builtin_compare's own comment (uw.c ~10977). */
  iVar6 = babl_read_var_word((int)*(short *)(arg_stack + -2));
  pcVar2 = (char *)get_message_string(iVar6);
  iVar6 = babl_read_var_word((int)*(short *)(arg_stack + -4));
  pcVar3 = (char *)get_message_string(iVar6);
  uVar4 = ce_strlen(pcVar3);
  uVar5 = ce_strlen(pcVar2);
  /* Was `iVar6 = babl_alloc(...)` (truncating the real pointer to int) and string copies through
     truncated `dst - src` offsets, i.e. out-of-bounds writes on a 64-bit host. */
  pcDstBase = (char *)babl_alloc((int)(((uVar4 & 0xffff) + (uVar5 & 0xffff) + 1) * 0x10000) >> 0x10);
  pcDst = pcDstBase;
  do {
    cVar1 = *pcVar3;
    *pcDst++ = cVar1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  pcDst = pcDstBase + (short)uVar4;
  do {
    cVar1 = *pcVar2;
    *pcDst++ = cVar1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  register_interned_string(pcDstBase,0x7c);
}



// was FUN_0001998c
void babl_builtin_copy(char *arg_stack)
{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  char *pcDst;
  char *pcDstBase;
  
  /* Was 3 dropped register-forwarding args -- same class as
     babl_builtin_compare's own comment (uw.c ~10977). */
  iVar4 = babl_read_var_word((int)*(short *)(arg_stack + -2));
  pcVar2 = (char *)get_message_string(iVar4);
  iVar3 = ce_strlen(pcVar2);
  /* Was `iVar3 = babl_alloc(...)` plus a copy through a truncated `dst - src` int offset. */
  pcDstBase = (char *)babl_alloc(iVar3 + 1);
  pcDst = pcDstBase;
  do {
    cVar1 = *pcVar2;
    *pcDst++ = cVar1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  register_interned_string(pcDstBase,0x7c);
}



// was FUN_000199d4
int babl_builtin_find(char *args)
{
  short sVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  int iVar5;
  
  sVar2 = babl_read_var_word((int)*(short *)(args + -2));
  sVar3 = babl_read_var_word((int)*(short *)(args + -4));
  sVar1 = *(short *)(args + -6);
  iVar5 = 0;
  if (0 < sVar3) {
    do {
      sVar4 = babl_read_var_word((sVar1 + iVar5) * 0x10000 >> 0x10);
      if (sVar2 == sVar4) {
        return iVar5 + 1;
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < sVar3);
  }
  return 0;
}



// was FUN_00019a80
int babl_builtin_val(char *arg_stack)
{
  short sVar1;
  int iVar2;
  char *pcVar3;

  /* Was 3 dropped register-forwarding args -- same class as
     babl_builtin_compare's own comment (uw.c ~10977). */
  iVar2 = babl_read_var_word((int)*(short *)(arg_stack + -2));
  pcVar3 = (char *)get_message_string(iVar2);
  sVar1 = ce_atoi(pcVar3);
  return (int)sVar1;
}



// was FUN_00019aa0
char *babl_expand_string_refs(char *text)
{
  char cVar1;
  char cVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  int iVar6;
  char *pcVar7;
  char *pcVar8;
  char *pcVar9;
  char *pcVar10;
  char *pcVar11;
  char cVar12;
  char *local_38 [2];
  char local_30 [20];
  /* Was `undefined4 babl_expand_string_refs` with a single `return 0;` at the very end -- always
     NULL regardless of what this function actually computed. */
  char *pcVar_result;

  pcVar_result = text;
  if (ce_strchr(text,0x40) != 0) {
    iVar6 = ce_strlen(text);
    pcVar7 = (char *)babl_alloc((iVar6 + 0x40) * 2);
    cVar1 = *text;
    pcVar11 = pcVar7;
    local_38[0] = text;
    while (cVar1 != '\0') {
      if (*local_38[0] == '@') {
        cVar1 = local_38[0][1];
        if (cVar1 == '@') {
          *pcVar11 = '@';
          local_38[0] = local_38[0] + 1;
          goto LAB_00019cc0;
        }
        pcVar9 = local_38[0] + 2;
        if (cVar1 == 'C') {
          cVar12 = 'I';
        }
        else {
          cVar12 = *pcVar9;
          pcVar9 = local_38[0] + 3;
        }
        local_38[0] = pcVar9;
        ce_strncpy(local_30,pcVar9,0x13);
        sVar3 = ce_atoi(local_30);
        while ((*local_38[0] != 0 &&
               ((iVar6 = _isctype((int)*local_38[0],4), iVar6 != 0 || (*local_38[0] == '-')))))
        {
          local_38[0] = local_38[0] + 1;
        }
        cVar2 = *local_38[0];
        if (((cVar2 == 'G') || (cVar2 == 'S')) || (cVar2 == 'P' || cVar2 == 'C')) {
          sVar4 = parse_babl_string_ref_expr(local_38);
          sVar4 = sVar4 + -1;
        }
        else {
          sVar4 = 0;
        }
        sVar5 = sVar4;
        if (cVar1 == 'G') {
LAB_00019bc8:
          sVar3 = babl_read_var_word(((int)sVar5 + (int)sVar3) * 0x10000 >> 0x10);
        }
        else {
          if (cVar1 == 'P') {
            sVar5 = babl_read_frame_word((int)sVar3);
            sVar3 = sVar4;
            goto LAB_00019bc8;
          }
          if (cVar1 == 'S') {
            sVar3 = babl_read_frame_word(((int)sVar4 + (int)sVar3) * 0x10000 >> 0x10);
          }
        }
        if (cVar12 == 'I') {
          /* Was `pcVar9[(int)pcVar11 - (int)local_30] = cVar1;` -- Ghidra swapped which pointer is
             the array base and which is the index, AND truncated the pointer difference to 32 bits. */
          itoa_radix((int)sVar3,local_30,10);
          pcVar9 = local_30;
          do {
            cVar1 = *pcVar9;
            pcVar11[(intptr_t)pcVar9 - (intptr_t)local_30] = cVar1;
            pcVar9 = pcVar9 + 1;
          } while (cVar1 != '\0');
        }
        else {
          /* Was a dropped argument -- Ghidra's own P-code analysis of the real binary shows no
             register load before this `bl` either, confirming it's genuine register-forwarding... */
          pcVar9 = (char *)get_message_string(sVar3);
          if (pcVar9 != (char *)0x0) {
            pcVar8 = (char *)babl_expand_string_refs(pcVar9);
            pcVar10 = pcVar8;
            /* BUG FIX: was `pcVar10[(int)pcVar11 - (int)pcVar8] = cVar1;` -- same
               swapped-base/truncated-pointer-difference bug as the 'I' branch above (see its
               comment)... */
            do {
              cVar1 = *pcVar10;
              pcVar11[(intptr_t)pcVar10 - (intptr_t)pcVar8] = cVar1;
              pcVar10 = pcVar10 + 1;
            } while (cVar1 != '\0');
            if (pcVar9 != pcVar8) {
              /* Was a dropped argument (K&R register-forwarding) -- now that babl_free is a real
                 free() (see its own comment), passing whatever happened to be left in the argument
                 register is far riskier than under the old hand-rolled allocator's own... */
              babl_free(pcVar9);
            }
          }
        }
        iVar6 = ce_strlen(pcVar7);
        pcVar11 = pcVar7 + iVar6;
      }
      else {
        *pcVar11 = *local_38[0];
LAB_00019cc0:
        pcVar11 = pcVar11 + 1;
        local_38[0] = local_38[0] + 1;
      }
      cVar1 = *local_38[0];
    }
    *pcVar11 = '\0';
    iVar6 = ce_strlen(pcVar7);
    babl_resize(pcVar7,iVar6 + 1);
    pcVar_result = pcVar7;
  }
  return pcVar_result;
}




// was FUN_00019e58
int build_babl_symbol_table()

{
  /* iVar1/iVar2/iVar3/iVar5/iVar6/iVar7/iVar10/iVar11 were all plain `int` -- fine for the small
     byte-offset/value uses, but iVar10 and iVar7 (mid-loop) and iVar5/iVar11 (after the loop) also
     get assigned straight from DAT_000bbf70... */
  intptr_t iVar1;
  intptr_t iVar2;
  intptr_t iVar3;
  char cVar4;
  intptr_t iVar5;
  intptr_t iVar6;
  intptr_t iVar7;
  char *pcVar8;
  char *pcVar9;
  intptr_t iVar10;
  intptr_t iVar11;
  bool bVar12;
  char local_64 [64];

  DAT_000bbf10 = *(int *)((char *)DAT_000bbf18 + 4);
  DAT_000bbf18 = (char *)((char *)DAT_000bbf18 + 8);
  DAT_000bbf80 = babl_alloc(DAT_000bbf10 << 1);
  DAT_000bbf8c = *(undefined2 *)DAT_000bbf18;
  DAT_0024cfac = *(undefined2 *)((char *)DAT_000bbf18 + 2);
  DAT_000bbf7c = *(undefined2 *)((char *)DAT_000bbf18 + 4);
  iVar11 = (int)*(short *)((char *)DAT_000bbf18 + 6);
  DAT_000bbf18 = (char *)((char *)DAT_000bbf18 + 8);
  DAT_000bbf24 = 0;
  DAT_000bbf70 = (intptr_t)babl_alloc((iVar11 + 1) * 0x20);
  iVar5 = 0;
  if (0 < iVar11) {
    iVar5 = 0;
    do {
      iVar10 = DAT_000bbf70;
      pcVar8 = DAT_000bbf18 + 2;
      iVar7 = (int)(short)((short)*DAT_000bbf18 + DAT_000bbf18[1] * 0x100);
      DAT_000bbf18 = pcVar8;
      ce_memmove(local_64,pcVar8,iVar7);
      pcVar8 = pcVar8 + iVar7;
      local_64[iVar7] = '\0';
      iVar7 = ((int)*pcVar8 + pcVar8[1] * 0x100) * 0x10000;
      iVar1 = ((int)pcVar8[2] + pcVar8[3] * 0x100) * 0x10000;
      DAT_000bbf18 = pcVar8 + 8;
      iVar2 = ((int)pcVar8[4] + pcVar8[5] * 0x100) * 0x10000;
      iVar6 = iVar5 * 0x20;
      iVar3 = ((int)pcVar8[6] + pcVar8[7] * 0x100) * 0x10000;
      pcVar9 = (char *)(iVar6 + iVar10);
      pcVar8 = local_64;
      do {
        cVar4 = *pcVar8;
        pcVar8 = pcVar8 + 1;
        *pcVar9 = cVar4;
        pcVar9 = pcVar9 + 1;
      } while (cVar4 != '\0');
      iVar10 = iVar6 + DAT_000bbf70;
      *(char *)(iVar10 + 0x1a) = (char)((uint)iVar7 >> 0x10);
      *(char *)(iVar10 + 0x1b) = (char)((uint)iVar7 >> 0x18);
      iVar7 = iVar6 + DAT_000bbf70;
      *(char *)(iVar7 + 0x18) = (char)((uint)iVar1 >> 0x10);
      *(char *)(iVar7 + 0x19) = (char)((uint)iVar1 >> 0x18);
      iVar7 = iVar6 + DAT_000bbf70;
      *(char *)(iVar7 + 0x1c) = (char)((uint)iVar3 >> 0x10);
      *(char *)(iVar7 + 0x1d) = (char)((uint)iVar3 >> 0x18);
      iVar7 = iVar6 + DAT_000bbf70;
      *(char *)(iVar7 + 0x1e) = (char)((uint)iVar2 >> 0x10);
      *(char *)(iVar7 + 0x1f) = (char)((uint)iVar2 >> 0x18);
      bVar12 = (short)((uint)iVar2 >> 0x10) == 0x111;
      if (bVar12) {
        iVar6 = (int)DAT_000bbf24;
      }
      if (bVar12) {
        DAT_000bbf24 = (short)iVar6 + 1;
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < iVar11);
  }
  iVar5 = (short)iVar5 * 0x20;
  *(undefined1 *)(iVar5 + DAT_000bbf70) = 0;
  iVar11 = iVar5 + DAT_000bbf70;
  *(undefined1 *)(iVar11 + 0x18) = 0;
  *(undefined1 *)(iVar11 + 0x19) = 0;
  iVar5 = iVar5 + DAT_000bbf70;
  *(undefined1 *)(iVar5 + 0x1a) = 0;
  *(undefined1 *)(iVar5 + 0x1b) = 0;
  /* DAT_000bbf00's slot stride was `* 4` (idx << 2 for the allocation, idx * 4 at every
     reader/writer below) -- a 32-bit-pointer-only design baked into the original binary, same bug
     class as change_game_mode's own DAT_00085668/DAT_000856a4 table (see its "0x80, was 0x40" fix). */
  if (0 < DAT_000bbf24) {
    DAT_000bbf00 = (intptr_t)babl_alloc((int)DAT_000bbf24 << 3);
  }
  if (0 < DAT_000bbf24) {
    iVar5 = 0;
    do {
      *(void **)(DAT_000bbf00 + iVar5 * 8) = (void *)babl_builtin_default_handler;
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < DAT_000bbf24);
  }
  return 1;
}




// was FUN_0001a1c8 -- the babl dialogue VM's main opcode dispatch loop: reads the current
// conversation bytecode buffer (DAT_000bbf80) word by word at instruction pointer DAT_000bbf74,
// dispatching each opcode to its babl_op_* handler...
int run_babl_bytecode_interpreter()

{
  undefined2 uVar1;
  short sVar2;
  short sVar3;
  undefined4 uVar4;
  undefined2 *puVar5;
  int iVar6;
  short *psVar7;
  ushort *puVar8;
  
  DAT_000bbf78 = 0;
  DAT_000bbf2c = 0;
  DAT_000bbf74 = 0;
  if (*DAT_000bbf80 == 0x22) {
    sVar2 = 1;
    do {
      flush_dirty_rect_to_display(1);
      /* Was `DAT_000bbf80 + DAT_000bbf74` (byte offset) -- DAT_000bbf74 is the babl VM's own
         instruction pointer, counted in 16-bit WORDS... */
      psVar7 = (short *)(DAT_000bbf80 + DAT_000bbf74 * 2);
      switch(*psVar7) {
      case 0:
        goto LAB_0001a2d8;
      case 1:
        babl_op_add();
        break;
      case 2:
        babl_op_mul();
        break;
      case 3:
        babl_op_sub();
        break;
      case 4:
        babl_op_div();
        break;
      case 5:
        babl_op_mod();
        break;
      case 6:
        babl_op_or();
        break;
      case 7:
        babl_op_and();
        break;
      case 8:
        puVar8 = (ushort *)(DAT_000bbf0c + DAT_000bbf78 * 2);
        *puVar8 = (ushort)(*puVar8 == 0);
        break;
      case 9:
        babl_op_gt();
        break;
      case 10:
        babl_op_ge();
        break;
      case 0xb:
        babl_op_lt();
        break;
      case 0xc:
        babl_op_le();
        break;
      case 0xd:
        babl_op_eq();
        break;
      case 0xe:
        babl_op_ne();
        break;
      case 0xf:
        DAT_000bbf74 = psVar7[1];
        goto LAB_0001a5a4;
      case 0x10:
        iVar6 = (int)DAT_000bbf78;
        DAT_000bbf78 = (short)((uint)((iVar6 + -1) * 0x10000) >> 0x10);
        if (*(short *)(DAT_000bbf0c + iVar6 * 2) == 0) goto LAB_0001a3f0;
LAB_0001a3ac:
        DAT_000bbf74 = DAT_000bbf74 + 2;
        goto LAB_0001a5a4;
      case 0x11:
        iVar6 = (int)DAT_000bbf78;
        DAT_000bbf78 = (short)((uint)((iVar6 + -1) * 0x10000) >> 0x10);
        if (*(short *)(DAT_000bbf0c + iVar6 * 2) == 0) goto LAB_0001a3ac;
        goto LAB_0001a3f0;
      case 0x12:
LAB_0001a3f0:
        DAT_000bbf74 = psVar7[1] + DAT_000bbf74 + 1;
        goto LAB_0001a5a4;
      case 0x13:
        babl_op_call();
        goto LAB_0001a5a4;
      case 0x14:
        babl_op_call_builtin();
        goto LAB_0001a5a4;
      case 0x15:
        sVar2 = babl_op_return();
        goto LAB_0001a5a4;
      case 0x16:
        DAT_000bbf78 = DAT_000bbf78 + 1;
        *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) = psVar7[1];
        goto LAB_0001a4f0;
      case 0x17:
        DAT_000bbf78 = DAT_000bbf78 + 1;
        *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) = psVar7[1] + DAT_000bbf84 + DAT_000bbf2c;
LAB_0001a4f0:
        DAT_000bbf74 = DAT_000bbf74 + 2;
        goto LAB_0001a5a4;
      case 0x18:
        DAT_000bbf78 = DAT_000bbf78 + -1;
        goto LAB_0001a2d8;
      case 0x19:
        puVar5 = (undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2);
        uVar1 = *puVar5;
        *puVar5 = puVar5[-1];
        *(undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2 + -2) = uVar1;
        break;
      case 0x1a:
        iVar6 = DAT_000bbf78 + 1;
        DAT_000bbf78 = (short)iVar6;
        sVar3 = DAT_000bbf2c;
        goto LAB_0001a470;
      case 0x1b:
        DAT_000bbf2c = *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
        DAT_000bbf78 = DAT_000bbf78 + -1;
        goto LAB_0001a2d8;
      case 0x1c:
        DAT_000bbf2c = DAT_000bbf78;
        goto LAB_0001a2d8;
      case 0x1d:
        DAT_000bbf78 = DAT_000bbf2c;
        goto LAB_0001a2d8;
      case 0x1e:
        DAT_000bbf78 = *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) + DAT_000bbf78 + -1;
        goto LAB_0001a2d8;
      case 0x1f:
        babl_op_push_var_raw();
        break;
      case 0x20:
        babl_op_set_var();
        break;
      case 0x21:
        babl_op_combine_index();
        break;
      case 0x22:
        goto LAB_0001a2d8;
      case 0x23:
        DAT_000bbf1c = *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
LAB_0001a2d8:
        DAT_000bbf74 = DAT_000bbf74 + 1;
        goto LAB_0001a5a4;
      case 0x24:
        iVar6 = DAT_000bbf78 + 1;
        DAT_000bbf78 = (short)iVar6;
        sVar3 = DAT_000bbf1c;
LAB_0001a470:
        *(short *)(DAT_000bbf0c + (iVar6 * 0x10000 >> 0x10) * 2) = sVar3;
        break;
      case 0x25:
        babl_op_string_eq();
        break;
      case 0x26:
      default:
        sVar2 = 0;
        goto LAB_0001a5a4;
      case 0x27:
        babl_op_say();
        break;
      case 0x28:
        babl_op_respond();
        break;
      case 0x29:
        babl_op_negate();
      }
      DAT_000bbf74 = DAT_000bbf74 + 1;
LAB_0001a5a4:;
    } while (sVar2 != 0);
    save_npc_conversation_variables();
    uVar4 = 1;
  }
  else {
    uVar4 = 0xffffffff;
  }
  return uVar4;
}




/* was FUN_0001ae28 -- binds a name (param_1) to a native function pointer (param_2) callable from
   conversation ("babl") scripts. */
void babl_register_builtin(char *name, void *handler)
{
  short *psVar1;
  char cVar2;
  int iVar3;
  char *pcVar4;

  /* HACK: added `DAT_000bbf70 != 0` -- this whole babl-symbol-table cluster
     (babl_register_builtin/babl_op_say/etc.) uniformly assumes DAT_000bbf70 already points at a
     real, build_babl_symbol_table()-initialized record array before touching it. */
  if (DAT_000bbf70 != 0 && *(short *)(DAT_000bbf70 + 0x18) != 0) {
    cVar2 = *name;
    pcVar4 = (char *)DAT_000bbf70;
    do {
      if ((cVar2 == *pcVar4) && (iVar3 = ce_strcmp(name,pcVar4), iVar3 == 0)) {
        *(intptr_t *)(DAT_000bbf00 + *(short *)(pcVar4 + 0x1a) * 8) = (intptr_t)handler; // was `undefined4 ... * 4` -- DAT_000bbf00's own comment (uw.c ~11468)
        return;
      }
      psVar1 = (short *)(pcVar4 + 0x38);
      pcVar4 = pcVar4 + 0x20;
    } while (*psVar1 != 0);
  }
}



/* was FUN_0001aebc -- looks up a named babl script variable (param_1, e.g. "npc_hp") in the
   variable table at DAT_000bbf70 (0x20-byte stride records) and copies param_3 16-bit values from
   param_2 INTO its backing storage (DAT_000bbf14)... */
void babl_set_variable(char *name, short *value_array, short count)
{
  undefined1 uVar1;
  intptr_t iVar2; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t) right back down, same as init_babl_variable_defaults's own fix; this is the crash in bug-critter-talk.txt's own successful-conversation-load path (via sync_conv_vars_from_npc's npc_whoami lookup)
  uint uVar3;
  int iVar4;
  uint uVar5;
  short sVar6;
  undefined1 local_34 [28];

  sVar6 = 0;
  iVar2 = ce_strlen(name); // was a dropped arg -- name itself, matching this same function's own explicit `ce_strlen(name)` call a few lines below
  if (iVar2 != 0) {
    uVar5 = 0;
    do {
      uVar1 = ce_tolower((int)*(char *)(uVar5 + name));
      local_34[uVar5] = uVar1;
      sVar6 = (short)((uVar5 + 1) * 0x10000 >> 0x10);
      uVar3 = ce_strlen(name);
      uVar5 = (uint)sVar6;
    } while (uVar5 < uVar3);
  }
  local_34[sVar6] = 0;
  iVar2 = DAT_000bbf70;
  while( true ) {
    /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own comment (uw.c ~12260) --
       this is the Talk-crash's own next crash site once that one's fixed... */
    if (iVar2 == 0 || *(short *)(iVar2 + 0x18) == 0) {
      return;
    }
    iVar4 = ce_strcmp(name,(const char *)(intptr_t)(iVar2));
    if (iVar4 == 0) break;
    iVar2 = iVar2 + 0x20;
  }
  if (count < 1) {
    return;
  }
  iVar4 = 0;
  do {
    if (*(short *)(iVar2 + 0x18) <= iVar4) {
      return;
    }
    *(undefined2 *)(DAT_000bbf14 + (iVar4 + *(short *)(iVar2 + 0x1a)) * 2) =
         value_array[iVar4];
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < count);
}



/* was FUN_0001afe4 -- the mirror of babl_set_variable: looks up a named babl script variable in the
   same DAT_000bbf70 table and copies its current value OUT of DAT_000bbf14 into param_2 -- native
   code reading back whatever value the conversation script itself set. */
void babl_get_variable(char *name, short *value_array, short count)
{
  int iVar1;
  intptr_t iVar2; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t) right back down, same as init_babl_variable_defaults's own fix

  iVar2 = DAT_000bbf70;
  while( true ) {
    /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own
       comment (uw.c ~12260). */
    if (iVar2 == 0 || *(short *)(iVar2 + 0x18) == 0) {
      return;
    }
    iVar1 = ce_strcmp(name,(const char *)(intptr_t)(iVar2));
    if (iVar1 == 0) break;
    iVar2 = iVar2 + 0x20;
  }
  if (count < 1) {
    return;
  }
  iVar1 = 0;
  do {
    if (*(short *)(iVar2 + 0x18) <= iVar1) {
      return;
    }
    value_array[iVar1] =
         *(undefined2 *)(DAT_000bbf14 + (iVar1 + *(short *)(iVar2 + 0x1a)) * 2);
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < count);
}




// was FUN_0001c57c
int babl_builtin_do_offer(char *args)
{
  short sVar1;
  short sVar2;
  short sVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  bool bVar11;
  
  debug_noop_checkpoint();
  uVar4 = babl_read_var_word((int)*(short *)(args + -10));
  sVar1 = babl_read_var_word((int)*(short *)(args + -8));
  uVar5 = babl_read_var_word((int)*(short *)(args + -6));
  uVar6 = babl_read_var_word((int)*(short *)(args + -4));
  uVar7 = babl_read_var_word((int)*(short *)(args + -2));
  if (DAT_000bc004 < 0) {
    /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
    babl_builtin_say(get_message_string(uVar6));
    sVar2 = DAT_000bbfb8;
  }
  else {
    iVar8 = barter_offer_is_empty(&DAT_000bbfd0,&DAT_000bbf98);
    if ((iVar8 == 0) && (iVar8 = barter_offer_is_empty(&DAT_000bbfe8,&DAT_000bbff0), iVar8 == 0)) {
      sVar2 = sum_barter_offer_value(1,&DAT_000bbfd0,&DAT_000bbf98,&DAT_000bbfb0,DAT_000bbfbc);
      sVar3 = sum_barter_offer_value(0,&DAT_000bbfe8,&DAT_000bbff0,&DAT_000bbfc8,DAT_000bbfbc);
      iVar8 = (int)sVar3;
      if (iVar8 < 1) {
        sVar2 = 100;
      }
      else {
        sVar2 = ordint_divmod(iVar8,(sVar2 - iVar8) * 100).quot;
      }
      iVar9 = (int)DAT_000bc024;
      iVar8 = (int)sVar2;
      if (iVar9 <= iVar8) {
        /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
        babl_builtin_say(get_message_string(uVar4));
        finalize_npc_barter_items(1);
        finalize_player_barter_items();
        DAT_000bc008 = 1;
        return 1;
      }
      iVar10 = (int)DAT_000bbfb8;
      if (iVar10 == 0) {
        bVar11 = SBORROW4(iVar8 * 2,iVar9);
        iVar9 = iVar8 * 2 - iVar9;
      }
      else {
        if (iVar8 < iVar10) {
          /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
          babl_builtin_say(get_message_string(uVar5));
          DAT_000bbfb8 = sVar2;
          DAT_000bc004 = DAT_000bc004 + -2;
          return 0;
        }
        iVar10 = (iVar9 - iVar10) * 3;
        if (iVar10 < 0) {
          iVar10 = iVar10 + 1;
        }
        bVar11 = SBORROW4(iVar9 - iVar8,iVar10 >> 1);
        iVar9 = (iVar9 - iVar8) - (iVar10 >> 1);
      }
      if (iVar9 < 0 != bVar11) {
        /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
        babl_builtin_say(get_message_string((int)sVar1));
        DAT_000bc004 = DAT_000bc004 + -1;
      }
    }
    else {
      /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
      babl_builtin_say(get_message_string(uVar7));
      DAT_000bc008 = 0;
      sVar2 = DAT_000bbfb8;
    }
  }
  DAT_000bbfb8 = sVar2;
  return 0;
}




// was FUN_0001ca78
int babl_builtin_do_demand(char *args)
{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  byte bVar4;
  short sVar5;
  short sVar6;
  short sVar7;
  uint uVar8;
  undefined4 uVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  char *player_rec;
  short local_2c;
  short local_2a;
  short local_28;
  
  local_28 = babl_read_var_word((int)*(short *)(args + -4));
  local_2a = babl_read_var_word((int)*(short *)(args + -2));
  player_rec = DAT_00086df8;
  bVar1 = (byte)DAT_00100674->hdr.type_flags;
  if (*(char *)(DAT_0023be74 + 4) == '\0') {
    iVar11 = 1;
  }
  else {
    sVar5 = ordint_divmod(*(char *)(DAT_0023be74 + 4),
                         ((uint) g_player_object->npc_hp - (uint)*(byte *)(DAT_00086df8 + 0x36))
                         * 2).quot;
    iVar11 = sVar5 + 2;
  }
  bVar2 = *(byte *)(player_rec + 0x5f);
  sVar5 = ordint_divmod(6,*(undefined1 *)(player_rec + 0x30)).quot;
  bVar3 = *(byte *)(player_rec + 0x3d);
  sVar6 = sum_barter_offer_value(0,&DAT_000bbfe8,&DAT_000bbff0,&DAT_000bbfc8,DAT_000bbfbc);
  uVar8 = (uint)(byte) g_monster_type_props[(DAT_00100674->hdr.object_id & 0x3f)].max_hp;
  if (uVar8 == 0) {
    iVar12 = 1;
  }
  else {
    sVar7 = ordint_divmod(uVar8,(DAT_00100674->hit_points - uVar8) * 2).quot;
    iVar12 = sVar7 + 2;
  }
  babl_get_variable(s_npc_attitude_000845f8,&local_2c,1);
  bVar4 = DAT_00100674->npc_ai_flags;
  if ((bVar4 & 0x40) == 0) {
    iVar10 = 1;
    if (1 < local_2c) {
      iVar10 = 0;
    }
  }
  else {
    iVar10 = -1;
  }
  sVar6 = ordint_divmod(10,(int)sVar6).quot;
  if (((int)((((byte) g_monster_type_props[(bVar1 & 0x3f)].trade_level & 0xf) + (int)sVar6 + iVar10 + (int)iVar12) *
             0x10000) >> 0x10 <
       (int)((((bVar2 & 2) >> 1) + (int)sVar5 + (uint)bVar3 + iVar11) * 0x10000) >> 0x10) ||
     ((bVar4 & 0x40) != 0)) {
    /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
    babl_builtin_say(get_message_string((int)local_28));
    finalize_npc_barter_items(1);
    DAT_000bc008 = 1;
    if (0 < local_2c) {
      local_2c = (short)((uint)((local_2c + -1) * 0x10000) >> 0x10);
      babl_set_variable(s_npc_attitude_000845f8,&local_2c,1);
    }
    uVar9 = 1;
  }
  else {
    /* Was a dropped register-forwarding argument -- same class as
       babl_builtin_compare's own comment (uw.c ~10977). Thread
       get_message_string's own return through explicitly. */
    babl_builtin_say(get_message_string((int)local_2a));
    finalize_npc_barter_items(0);
    npc_set_goal_for_object(DAT_00100674,5,1);
    uVar9 = 0;
  }
  return uVar9;
}




// was FUN_0001da88
int babl_builtin_set_likes_dislikes(char *args)
{
  DAT_000bc020 = (short *)babl_var_word_addr((int)*(short *)(args + -4));
  DAT_000bc000 = (short *)babl_var_word_addr((int)*(short *)(args + -2));
  return 1;
}




// was FUN_000286cc -- the "enter conversation" game-mode handler (registered in change_game_mode's
// mode-dispatch table, uw.c).
void enter_conversation_mode_screen()

{
  char cVar1;
  short sVar2;
  int iVar3;
  char *pcVar4;
  char *pcVar5;
  undefined2 uVar6;
  char local_44 [40];
  
  flush_sprite_list_compositor();
  set_pending_music_track(0xd);
  update_ingame_music_track();
  DAT_00100784 = ce_malloc(0x10000);
  ce_memset(DAT_00100784,0,0x10000);
  decrement_cursor_hide_depth();
  set_viewport_clip_rect(0,0,0x13f,199);
  DAT_00100670 = DAT_00100784;
  uVar6 = 2;
  iVar3 = load_gr_resource_entries(s_converse_00084ff4,0,-1,&converse_res_bump_alloc_entry,&converse_res_slot_store_callback);
  if (iVar3 != 0) {
    set_draw_color(0xf1);
    rect_fill_or_save_restore(0x2a,1,0xc2,0x2f);
    bitmap_blit_to_framebuffer(0x2b,1,DAT_00100728,9,CONCAT22(uVar6,0x5e),0,0,1);
    bitmap_blit_to_framebuffer(0x8b,1,DAT_00100728,9,0x5e,0,0,1);
    bitmap_blit_to_framebuffer(0x52,10,DAT_0010072c,0x26,0x37,0,0,1);
    bitmap_blit_to_framebuffer(0x8b,10,DAT_0010072c,0x26,0x37,0,0,1);
    bitmap_blit_to_framebuffer(0x2b,10,DAT_00100730,0x26,0x26,0,0,1);
    bitmap_blit_to_framebuffer(0xc3,10,DAT_00100730,0x26,0x26,0,0,1);
    bitmap_blit_to_framebuffer(0x2a,0x31,DAT_00100734,10,0xc0,0,0,1);
    bitmap_blit_to_framebuffer(0x2a,0x7f,DAT_00100738,10,0xc0,0,0,1);
    bitmap_blit_to_framebuffer(0xec,8,DAT_0010073c,0x72,0x54,0,0,1);
    set_draw_color(0xf1);
    draw_horizontal_line(0x34,0x30,0xdc);
    DAT_00100678 = g_active_hud_panel;
    g_active_hud_panel = 0;
    DAT_00085c54 = 0;
    init_inventory_panel_hotspots();
    refresh_equipment_display_if_visible();
    DAT_00085c54 = 1;
    select_msg_scroll_mode_2();
    msg_scroll_panel_reset(0);
    select_msg_scroll_mode_conversation();
    msg_scroll_panel_reset(0);
    select_active_font(s_font5x6p_sys_0008430c);
    uVar6 = 2;
    *g_draw_color_index = 0x65;
    *DAT_00084298 = 0x65;
    DAT_00100670 = DAT_00100784;
    iVar3 = load_gr_resource_entries(s_heads_00084fec,
                         (*(byte *)(DAT_00086df8 + 100) >> 1 & 1) * '\x05' +
                         (*(byte *)(DAT_00086df8 + 100) >> 2 & 7),1,&converse_res_bump_alloc_entry,&converse_res_slot_store_callback);
    if (iVar3 != 0) {
      g_blit_transparent_mode = 1;
      bitmap_blit_to_framebuffer(0xc5,0xc,DAT_00100728,0x22,CONCAT22(uVar6,0x22),0,0,1);
      g_blit_transparent_mode = 0;
      pcVar4 = (char *)get_message_string((int)DAT_00201c74);
      pcVar5 = local_44;
      do {
        cVar1 = *pcVar4;
        pcVar4 = pcVar4 + 1;
        *pcVar5 = cVar1;
        pcVar5 = pcVar5 + 1;
      } while (cVar1 != '\0');
      draw_text_string(local_44,0x90,3);
      DAT_00100670 = DAT_00100784;
      if (DAT_00100674->npc_whoami == 0) {
        uVar6 = 2;
        load_gr_resource_entries(s_genhead_00084fd8,DAT_00100674->hdr.object_id & 0x3f,1,&converse_res_bump_alloc_entry,&converse_res_slot_store_callback);
      }
      else {
        uVar6 = 2;
        iVar3 = load_gr_resource_entries(s_charhead_00084fe0,DAT_00100674->npc_whoami - 1,1,&converse_res_bump_alloc_entry,
                             &converse_res_slot_store_callback);
        if (iVar3 == 0) {
          uVar6 = 2;
          load_gr_resource_entries(s_genhead_00084fd8,DAT_00100674->hdr.object_id & 0x3f,1,&converse_res_bump_alloc_entry,&converse_res_slot_store_callback);
        }
      }
      g_blit_transparent_mode = 1;
      bitmap_blit_to_framebuffer(0x2d,0xc,DAT_00100728,0x22,CONCAT22(uVar6,0x22),0,0,1);
      g_blit_transparent_mode = 0;
      sVar2 = build_object_display_name(local_44,DAT_00100674,0,0);
      if (sVar2 != 0) {
        draw_text_string(local_44,0x30,3);
      }
      DAT_001007c0 = DAT_00100784;
      init_barter_ui();
      select_msg_scroll_mode_normal();
      cursor_show_idle_tick();
      DAT_0023bf0c = 0;
      reset_cursor_confine_rect();
      mode_icon_highlight_off(5);
      g_cursor_mode = 0;
      start_npc_conversation(DAT_00100674->npc_whoami,DAT_00100674->hdr.object_id & 0x3f);
      change_game_mode(1);
      return;
    }
  }
  exit_talk_mode();
  return;
}




// was FUN_00028c00
void start_npc_conversation(int conversation_id, int npc_type)
{
  short sVar1;
  int iVar2;
  undefined4 uVar3;
  
  sVar1 = load_npc_conversation_record(s__DATA_cnv_ark_00084fc8,DAT_00100784 + 0x400);
  /* Was `if (sVar1 < 0)` alone, matching real disassembly at 0x28c1c- 0x28c20 (`bpl` = branch to
     the success/registration branch below on sVar1 >= 0)... */
  if (sVar1 < 0 || DAT_000bbf70 == 0) {
    /* Was two separate calls with message_scroll_print_wrapped()'s arg dropped -- same pattern
       already fixed at load_npc_conversation_record's own sVar1<0 branch (uw.c ~10987) and at
       attempt_talk_interaction's tail (uw.c ~19070). */
    message_scroll_print_wrapped(get_message_string(0xe01));
  }
  else {
    babl_register_builtin(s_babl_menu_00085220,&babl_menu); // was &LAB_0002912c, the no-op stub
    babl_register_builtin(s_babl_fmenu_00085214,babl_fmenu);
    babl_register_builtin(DAT_000845a8,babl_builtin_say);
    babl_register_builtin(s_respond_000845ac,babl_builtin_respond);
    babl_register_builtin(s_get_quest_00085208,babl_builtin_get_quest);
    babl_register_builtin(s_set_quest_000851fc,babl_builtin_set_quest);
    babl_register_builtin(s_sex_000851f8,babl_builtin_sex);
    babl_register_builtin(s_babl_ask_000851ec,babl_builtin_ask);
    babl_register_builtin(s_print_000851e4,babl_builtin_print);
    babl_register_builtin(s_show_inv_000851d8,babl_builtin_show_inv);
    babl_register_builtin(s_give_to_npc_000851cc,babl_builtin_give_to_npc);
    babl_register_builtin(s_find_inv_000851c0,babl_builtin_find_inv);
    babl_register_builtin(s_take_from_npc_000851b0,&babl_builtin_take_from_npc);
    babl_register_builtin(s_take_id_from_npc_0008519c,&babl_builtin_take_id_from_npc);
    babl_register_builtin(s_identify_inv_0008518c,babl_builtin_identify_inv);
    babl_register_builtin(s_do_offer_00085180,babl_builtin_do_offer);
    babl_register_builtin(s_do_demand_00085174,babl_builtin_do_demand);
    babl_register_builtin(s_do_decline_00085168,&babl_builtin_do_decline);
    babl_register_builtin(s_do_judgement_00085158,babl_builtin_do_judgement);
    babl_register_builtin(s_end_barter_0008514c,end_barter_ui);
    babl_register_builtin(s_setup_to_barter_0008513c,babl_builtin_setup_to_barter);
    babl_register_builtin(s_pause_00085134,babl_builtin_pause);
    babl_register_builtin(s_set_likes_dislikes_00085120,babl_builtin_set_likes_dislikes);
    babl_register_builtin(s_do_inv_create_00085110,&babl_builtin_do_inv_create);
    babl_register_builtin(s_do_inv_delete_00085100,babl_builtin_do_inv_delete);
    babl_register_builtin(s_check_inv_quality_000850ec,babl_builtin_check_inv_quality);
    babl_register_builtin(s_set_inv_quality_000850dc,babl_builtin_set_inv_quality);
    babl_register_builtin(s_count_inv_000850d0,babl_builtin_count_inv);
    babl_register_builtin(s_gronk_door_000850c4,babl_builtin_gronk_door);
    babl_register_builtin(s_set_attitude_000850b4,babl_builtin_set_attitude);
    babl_register_builtin(s_set_race_attitude_000850a0,babl_builtin_set_race_attitude);
    babl_register_builtin(s_take_from_npc_inv_0008508c,babl_builtin_take_from_npc_inv);
    babl_register_builtin(s_add_to_npc_inv_0008507c,babl_builtin_add_to_npc_inv);
    babl_register_builtin(s_place_object_0008506c,babl_builtin_place_object);
    babl_register_builtin(s_remove_talker_0008505c,babl_builtin_remove_talker);
    babl_register_builtin(s_x_skills_00085050,babl_builtin_x_skills);
    babl_register_builtin(s_x_traps_00085048,babl_builtin_x_traps);
    babl_register_builtin(s_x_obj_stuff_0008503c,babl_builtin_x_obj_stuff);
    babl_register_builtin(s_x_obj_pos_00085030,babl_builtin_x_obj_pos);
    babl_register_builtin(s_find_barter_00085024,babl_builtin_find_barter);
    babl_register_builtin(s_find_barter_total_00085010,babl_builtin_find_barter_total);
    babl_register_builtin(s_give_ptr_npc_00085000,babl_builtin_give_ptr_npc);
    sync_conv_vars_from_npc(DAT_00100674);
    DAT_001007b8 = babl_alloc(0xa0);
    if (!DAT_00100674->npc_loot_spawned) {
      /* Dropped argument -- see babl_builtin_take_from_npc's identical
         call for the full explanation; intended arg is DAT_00100674. */
      spawn_creature_death_loot(DAT_00100674);
    }
    /* Debug-only static dump of every string in this NPC's own compiled conversation, independent
       of which branches a live playthrough happens to reach -- see bragit-talk-again-investigation. */
    run_babl_bytecode_interpreter();
    uVar3 = 500;
    iVar2 = sync_conv_vars_to_npc((char *)DAT_00100674);
    if ((iVar2 != 0) || (DAT_001007b4 == '\0')) {
      uVar3 = 0;
    }
    /* Debug-only re-seed, no UI involved: directly proves out the npc_talkedto persistence fix
       (bglobals-dat-readonly-handle-fix) end-to-end without needing to click the NPC a second time
       through a fragile, animation-position-dependent screen coordinate. */
    /* Debug-only: re-runs the exact same object-pick the mouse position already used to start this
       conversation would produce, RIGHT as the conversation ends -- same frame, same
       g_mouse_x/g_mouse_y, no real click or screen coordinate involved at all. */
    wait_for_click_to_continue(uVar3,0);
  }
}




/* Was a no-op stub (LAB_0002912c, uw.c ~1693's own comment) -- Ghidra never resolved this address
   into a proper function on this port's own earlier decompile pass, so babl_menu (registered under
   that exact script name in start_npc_conversation) silently did nothing. */
int babl_menu(char *args)
{
  char cVar1;
  short sVar2;
  short sVar5;
  undefined4 uVar6;
  /* uVar7/iVar8/iVar9 were `undefined4`/`int` (4 bytes) but hold real string pointers from
     get_message_string/babl_expand_string_refs/ ce_strlen -- and DAT_001006d8/DAT_00100680... */
  intptr_t uVar7;
  intptr_t iVar8;
  intptr_t iVar9;
  char *pcVar10;
  char *pcVar11;
  int iVar12;
  short sVar13;
  /* Was 4 separate stack locals (`local_c4`, `local_c3`, `local_c2`, `acStack_c1[157]`) that the
     print loop below relies on being laid out contiguously in memory (writing local_c3/local_c2
     then reading the whole thing back starting from `&local_c4`)... */
  char local_c4 [160];

  sVar13 = 0;
  DAT_00100790 = 1;
  DAT_00100794 = 1;
  sVar2 = *(short *)(args + -2);
  uVar6 = babl_read_var_word((int)sVar2);
  iVar12 = 1;
  sVar5 = (short)uVar6;
  while (sVar5 != 0) {
    uVar7 = (intptr_t)get_message_string(uVar6);
    *(intptr_t *)(&DAT_001006d8 + DAT_00100794 * 8) = uVar7;
    iVar8 = (intptr_t)babl_expand_string_refs((char *)uVar7);
    sVar5 = DAT_00100794;
    iVar9 = (int)DAT_00100794;
    *(intptr_t *)(&DAT_00100680 + iVar9 * 8) = iVar8;
    if (iVar8 == *(intptr_t *)(&DAT_001006d8 + iVar9 * 8)) {
      iVar9 = ce_strlen((const char *)(intptr_t)(*(intptr_t *)(&DAT_001006d8 + iVar9 * 8)));
      pcVar10 = (char *)babl_alloc(iVar9 + 1);
      iVar9 = (int)DAT_00100794;
      *(char **)(&DAT_00100680 + iVar9 * 8) = pcVar10;
      pcVar11 = *(char **)(&DAT_001006d8 + iVar9 * 8);
      do {
        cVar1 = *pcVar11;
        pcVar11 = pcVar11 + 1;
        *pcVar10 = cVar1;
        pcVar10 = pcVar10 + 1;
        sVar5 = DAT_00100794;
      } while (cVar1 != '\0');
    }
    DAT_00100794 = sVar5 + 1;
    *(short *)(&DAT_001007a0 + sVar5 * 2) = (short)uVar6;
    iVar12 = iVar12 + 1;
    uVar6 = babl_read_var_word(iVar12 + sVar2 + -1);
    sVar5 = (short)uVar6;
  }
  select_msg_scroll_mode_2();
  msg_scroll_panel_reset(1);
  debug_noop_checkpoint();
  iVar12 = 0;
  do {
    (&DAT_00100770)[iVar12] = 0xffff;
    iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
  } while (iVar12 < 10);
  iVar12 = 1;
  if (1 < DAT_00100794) {
    do {
      pcVar10 = *(char **)(&DAT_00100680 + iVar12 * 8);
      local_c4[0] = (char)iVar12 + '0';
      local_c4[1] = 0x2e;
      local_c4[2] = 0x20;
      pcVar11 = local_c4 + 3;
      do {
        cVar1 = *pcVar10;
        pcVar10 = pcVar10 + 1;
        *pcVar11 = cVar1;
        pcVar11 = pcVar11 + 1;
      } while (cVar1 != '\0');
      ce_strcat(local_c4,&s_scroll_newline_0008522c);
      sVar5 = message_scroll_print_wrapped(local_c4);
      debug_noop_checkpoint();
      for (iVar9 = (int)sVar13; iVar9 <= sVar5; iVar9 = (iVar9 + 1) * 0x10000 >> 0x10) {
        (&DAT_00100770)[iVar9] = (short)iVar12;
      }
      iVar12 = (iVar12 + 1) * 0x10000 >> 0x10;
      sVar13 = sVar5 + 1;
    } while (iVar12 < DAT_00100794);
  }
  /* Debug-only regression-test aid: end-to-end verifying npc_talkedto persistence (see
     bglobals-dat-readonly-handle-fix) needs driving a conversation all the way to a real
     "Farewell"/"Bye" exit... */
  select_msg_scroll_mode_normal();
  DAT_0010078c = 1;
  DAT_00250718 = 1;
  run_babl_menu_wait_loop();
  /* ARM 0x29348 (`ldrsh r0, [r4, #0x18]`) returns the selected 1-based menu POSITION,
     DAT_00100788, directly. Scripts compare babl_menu's result against 1, 2, ... to pick a branch
     (Ketchaval's "consent of my bride" menu tests for 1 and 2). This was `DAT_001007a0[position]`,
     the chosen entry's string id -- correct only for babl_fmenu (whose ARM tail at 0x29598 really
     does index DAT_001007a0), copied here by mistake. With an id like 58 no branch matched, so
     the dialogue fell out of its menu handler and carried on into the next topic instead of ending
     or answering. */
  return (int)DAT_00100788;
}




// was FUN_000298d8
int babl_builtin_pause(char *args)
{
  int iVar1;

  wait_for_click_release(0);
  iVar1 = babl_read_var_word((int)*(short *)(args + -2));
  wait_for_click_to_continue(iVar1 * 500,0);
  return 1;
}




// was FUN_000299b0
int babl_builtin_show_inv(char *args)
{
  short sVar1;
  short sVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  short local_24 [4];
  short local_1c [4];
  
  uVar3 = collect_included_player_barter_items(local_24,local_1c);
  iVar5 = 0;
  do {
    sVar1 = (short)iVar5;
    if (iVar5 < (short)uVar3) {
      babl_write_var_word((int)*(short *)(args + -4) + (int)sVar1,(int)local_24[iVar5]);
      sVar2 = *(short *)(args + -2);
      iVar4 = (int)local_1c[iVar5];
    }
    else {
      babl_write_var_word((int)*(short *)(args + -2) + (int)sVar1,0);
      sVar2 = *(short *)(args + -4);
      iVar4 = 0;
    }
    babl_write_var_word((int)sVar2 + (int)sVar1,iVar4);
    iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
  } while (iVar5 < 4);
  return uVar3;
}



// was FUN_00029a58
int babl_builtin_find_barter(char *args)
{
  uint uVar1;
  int iVar2;
  short sVar3;
  short sVar4;
  int iVar5;
  short asStack_10014 [32764];
  short local_1c [4];
  short asStack_14 [4];
  
  sVar3 = babl_read_var_word((int)*(short *)(args + -2));
  sVar4 = collect_included_player_barter_items(local_1c,asStack_14);
  uVar1 = (uint)sVar3;
  iVar2 = (int)sVar4;
  if ((int)uVar1 < 1000) {
    iVar5 = 0;
    if (0 < iVar2) {
      do {
        sVar3 = (short)iVar5;
        if ((int)local_1c[iVar5] == uVar1) {
LAB_00029b4c:
          return (int)asStack_14[sVar3];
        }
        iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
      } while (iVar5 < iVar2);
    }
  }
  else {
    iVar5 = 0;
    if (0 < iVar2) {
      do {
        sVar3 = (short)iVar5;
        if ((((int)local_1c[iVar5] >> 4 & 0xfffffffcU) == (uVar1 - 1000 & 0xfffffffc)) &&
           ((uVar1 & 3) == (int)((int)local_1c[iVar5] & 0x30U) >> 4)) goto LAB_00029b4c;
        iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
      } while (iVar5 < iVar2);
    }
  }
  return 0;
}



// was FUN_00029b60
bool babl_builtin_find_barter_total(char *args)
{
  short sVar1;
  short sVar2;
  uw_object_hdr_t *iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  short asStack_1002c [32752];
  short local_4c [8];
  short local_3c [8];
  short local_2c [6];
  
  sVar1 = babl_read_var_word((int)*(short *)(args + -8));
  iVar4 = 0;
  iVar6 = 0;
  sVar2 = collect_included_player_barter_items(local_4c,local_3c);
  if ((sVar1 < 1000) && (0 < sVar2)) {
    iVar5 = 0;
    do {
      if (local_4c[iVar5] == sVar1) {
        iVar3 = get_object_record_by_slot_index((int)local_3c[iVar5]);
        local_2c[(short)iVar4] = local_3c[iVar5];
        if ((iVar3->is_quant == 0) || ((iVar3->link & 0x200) != 0)) {
          iVar6 = iVar6 + 1;
        }
        else {
          iVar6 = iVar6 + (uint)(iVar3->link);
        }
        iVar4 = ((short)iVar4 + 1) * 0x10000 >> 0x10;
      }
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < sVar2);
  }
  babl_write_var_word((int)*(short *)(args + -6),iVar4);
  babl_write_var_word((int)*(short *)(args + -2),iVar6);
  if (0 < (short)iVar4) {
    iVar5 = 0;
    do {
      babl_write_var_word((int)*(short *)(args + -4) + (int)(short)iVar5,(int)local_2c[iVar5]);
      iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
    } while (iVar5 < (short)iVar4);
  }
  return 0 < (short)iVar6;
}



// was FUN_00029cc8
int babl_builtin_give_to_npc(char *args)
{
  int iVar1;
  short sVar2;
  short sVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  short asStack_10044 [32768];
  short local_44 [12];
  undefined1 auStack_2c [8];
  
  sVar2 = babl_read_var_word((int)*(short *)(args + -4));
  sVar3 = collect_included_player_barter_items(auStack_2c,local_44 + 8);
  iVar5 = (int)sVar3;
  iVar1 = (int)sVar2;
  if (iVar5 < iVar1) {
LAB_00029e2c:
    uVar4 = 0;
  }
  else {
    local_44[7] = 0xffff;
    iVar7 = 0;
    local_44[6] = 0xffff;
    local_44[5] = 0xffff;
    local_44[4] = 0xffff;
    local_44[3] = 0xffff;
    local_44[2] = 0xffff;
    local_44[1] = 0xffff;
    local_44[0] = -1;
    if (0 < iVar1) {
      do {
        iVar6 = 0;
        if (0 < iVar5) {
          do {
            sVar2 = babl_read_var_word((int)*(short *)(args + -2) + (int)(short)iVar7);
            if ((local_44[iVar6 + 8] == sVar2) && (local_44[iVar6] == -1)) {
              local_44[iVar7 + 4] = (short)iVar6;
              local_44[(short)iVar6] = (short)iVar7;
              break;
            }
            iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
          } while (iVar6 < iVar5);
        }
        if (local_44[iVar7 + 4] == -1) goto LAB_00029e2c;
        iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
      } while (iVar7 < iVar1);
      if (0 < iVar1) {
        iVar5 = 0;
        do {
          /* BUG FIX: was `babl_read_var_word(...); give_barter_item_by_item_id();` -- the read
             result was discarded and the call made with zero visible arguments... */
          sVar2 = babl_read_var_word((int)*(short *)(args + -2) + (int)(short)iVar5);
          give_barter_item_by_item_id(sVar2);
          iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
        } while (iVar5 < iVar1);
      }
    }
    uVar4 = 1;
  }
  return uVar4;
}



// was FUN_00029e34
int babl_builtin_give_ptr_npc(char *args)
{
  undefined4 uVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  char *item_rec;
  short local_1c [4];
  short local_14 [4];
  
  uVar1 = babl_read_var_word((int)*(short *)(args + -4));
  collect_included_player_barter_items(local_1c,local_14);
  iVar2 = 0;
  do {
    if (local_1c[iVar2] != 0) {
      if ((short)uVar1 == local_14[iVar2]) {
        give_barter_item_by_item_id(uVar1);
        goto LAB_00029f2c;
      }
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 4);
  uVar3 = babl_read_var_word((int)*(short *)(args + -2));
  item_rec = (char *)get_object_record_by_slot_index(uVar1);
  if (-1 < (short)uVar3) {
    if (((uw_object_hdr_t *)item_rec)->is_quant != 0) {
      if ((((uw_object_hdr_t *)item_rec)->link & 0x200) == 0) goto LAB_00029efc;
    }
  }
  uVar3 = 0xffffffff;
LAB_00029efc:
  iVar4 = reduce_object_count((ushort *)item_rec,uVar3);
  if (iVar4 == 0) {
    uVar1 = 0;
  }
  else {
    add_item_to_npc_inventory((ushort *)item_rec);
LAB_00029f2c:
    uVar1 = 1;
  }
  return uVar1;
}



// was FUN_00029f38
void babl_builtin_do_inv_delete(char *args)
{
  remove_item_from_npc_inventory_by_id(babl_read_var_word((int)*(short *)(args + -2)));  /* ARM 0x29f3c-0x29f48: tail call with r0 = babl_read_var_word's result */
}



// was FUN_00029f4c
void babl_builtin_find_inv(char *args)
{
  int iVar1;
  ushort uVar2;
  short sVar3;
  ushort uVar4;
  char *local_10;
  
  sVar3 = babl_read_var_word((int)*(short *)(args + -2));
  uVar4 = babl_read_var_word((int)*(short *)(args + -4));
  local_10 = (char *)g_player_object;
  if ((sVar3 == 0) && (local_10 = (char *)DAT_00100674, !DAT_00100674->npc_loot_spawned)) {
    /* Dropped argument -- see babl_builtin_take_from_npc's identical
       call for the full explanation; intended arg is DAT_00100674. */
    spawn_creature_death_loot(DAT_00100674);
    local_10 = (char *)DAT_00100674;
  }
  local_10 = local_10 + 6;
  if ((short)uVar4 < 1000) {
    iVar1 = (int)(short)uVar4 >> 6;
    uVar2 = uVar4 & 0xf;
    uVar4 = (short)uVar4 >> 4;
  }
  else {
    iVar1 = (int)(short)(((short)uVar4 + -1000) >> 2);
    uVar2 = 0xffff;
  }
  encode_object_slot_index(find_object_in_chain(&local_10,1,iVar1,uVar4 & 3,uVar2));  /* ARM 0x1d4ec: r0 passthrough */
}



// was FUN_00029fb0
int babl_builtin_identify_inv(char *args)
{
  char *wptr_15610;
  char *wptr_15618;
  short sVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  char *iVar5;
  char *count_text;
  char *pcInterned;
  char *pcDst;
  int iVar6;
  char *pcVar7;
  char cVar8;
  ushort uVar9;
  char acStack_852bc [4];
  char acStack_852b8 [545324];
  undefined1 auStack_8c [8];
  char local_84 [16];
  char local_74 [80];
  
  uVar2 = babl_read_var_word((int)*(short *)(args + -8));
  sVar1 = babl_read_var_word((int)*(short *)(args + -6));
  uVar3 = babl_read_var_word((int)*(short *)(args + -2));
  uVar4 = compute_barter_item_value(1,uVar2,(int)DAT_000bbfbc);
  iVar5 = (char *)get_object_record_by_slot_index(uVar2);
  if ((((uw_object_hdr_t *)iVar5)->is_quant == 0) || ((((uw_object_hdr_t *)iVar5)->link & 0x200) != 0)) {
    uVar9 = 1;
  }
  else {
    uVar9 = ((uw_object_hdr_t *)iVar5)->link;
  }
  local_74[0] = '\0';
  local_84[0] = '\0';
  iVar6 = append_object_property_tag((ushort *)iVar5,uVar3,local_84);
  cVar8 = '\0';
  if (iVar6 != 0) {
    cVar8 = local_84[0];
  }
  if (((cVar8 == '\0') || (sVar1 == 0)) || (uVar9 != 1)) {
    if (uVar9 < 2) goto LAB_0002a154;
    count_text = _itoa(uVar9,auStack_8c,10);
    ce_strcat(local_74,count_text);
    ce_strcat(local_74,&DAT_00085240);
  }
  else if (((cVar8 == 'a') || (cVar8 == 'e')) ||
          ((cVar8 == 'i' || ((cVar8 == 'o' || (cVar8 == 'u')))))) {
    pcVar7 = &DAT_00085244;
    wptr_15610 = acStack_852b8;
    do {
      cVar8 = *pcVar7;
      *wptr_15610 = cVar8; wptr_15610 = wptr_15610 + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar8 != '\0');
  }
  else {
    pcVar7 = &DAT_00085248;
    wptr_15618 = acStack_852bc;
    do {
      cVar8 = *pcVar7;
      *wptr_15618 = cVar8; wptr_15618 = wptr_15618 + 1;
      pcVar7 = pcVar7 + 1;
    } while (cVar8 != '\0');
  }
  sVar1 = 0;
LAB_0002a154:
  if (local_84[0] != '\0') {
    ce_strcat(local_74,local_84);
  }
  iVar6 = ce_strlen(local_74);
  build_object_display_name(local_74 + iVar6,iVar5,(int)sVar1,1 < uVar9);
  append_object_special_name(iVar5,uVar3,local_74);
  pcInterned = (char *)babl_alloc(ce_strlen(local_74) + 1);
  pcVar7 = local_74;
  pcDst = pcInterned;
  do {
    cVar8 = *pcVar7;
    *pcDst++ = cVar8;
    pcVar7 = pcVar7 + 1;
  } while (cVar8 != '\0');
  uVar2 = register_interned_string(pcInterned,0x7c);
  babl_write_var_word((int)*(short *)(args + -4),uVar2);
  return uVar4;
}



// was FUN_0002a1fc
ushort babl_builtin_count_inv(char *args)
{
  ushort uVar1;
  uw_object_hdr_t *iVar2;

  iVar2 = get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -2)));  /* r0 passthrough */
  if ((iVar2->is_quant == 0) || ((iVar2->link & 0x200) != 0)) {
    uVar1 = 1;
  }
  else {
    uVar1 = iVar2->link;
  }
  return uVar1;
}



// was FUN_0002a258
byte babl_builtin_check_inv_quality(char *args)
{
  uw_object_hdr_t *iVar1;

  iVar1 = get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -2)));  /* r0 passthrough */
  return iVar1->quality;
}



// was FUN_0002a27c
int babl_builtin_set_inv_quality(char *args)
{
  undefined2 uVar1;
  byte bVar2;
  byte bVar3;
  uw_object_hdr_t *iVar4;
  
  iVar4 = get_object_record_by_slot_index(babl_read_var_word((int)*(short *)(args + -4)));  /* r0 passthrough */
  bVar3 = babl_read_var_word((int)*(short *)(args + -2));
  uVar1 = iVar4->chain_word;
  bVar2 = (byte)uVar1;
  iVar4->quality = bVar3 & 0x3f;
  return 1;
}




/* was sync_conv_vars_from_npc -- NOT a debug/cheat tool (an earlier pass through this file
   mislabeled it that way from its shape alone; tracing its real caller corrects that). */
// was FUN_0002a8e0
void sync_conv_vars_from_npc(ushort *npc)
{
  byte bVar1;
  undefined4 uVar2;
  ushort extraout_r1;
  int iVar3;
  ushort uVar4;
  bool bVar5;
  ushort local_20 [2];
  
  iVar3 = ((byte)*npc & 0x3f) * 0x30;
  local_20[0] = (ushort)(byte)npc[0xd];
  babl_set_variable(s_npc_whoami_000853a0,local_20,1);
  local_20[0] = 0x10;
  if ((*(byte *)((char *)npc + 0x19) & 0x80) == 0) {
    local_20[0] = 0xc0;
  }
  babl_set_variable(s_npc_hunger_00085394,local_20,1);
  if (g_monster_type_props[(iVar3) / 0x30].max_hp == '\0') {
    local_20[0] = 0x80;
  }
  else {
    local_20[0] = ordint_divmod(g_monster_type_props[(iVar3) / 0x30].max_hp,
                                (uint)(byte)npc[4] << 8).quot;
  }
  babl_set_variable(s_npc_health_00085388,local_20,1);
  local_20[0] = (ushort)(byte)npc[4];
  babl_set_variable(s_npc_hp_00085380,local_20,1);
  local_20[0] = (ushort)(char) g_monster_type_props[(iVar3) / 0x30].attacks[0].skill;
  babl_set_variable(s_npc_arms_00085374,local_20,1);
  local_20[0] = (ushort)(byte) g_monster_type_props[(iVar3) / 0x30].strength + (ushort)((byte) g_monster_type_props[(iVar3) / 0x30].spell_flags >> 1);
  babl_set_variable(s_npc_power_00085368,local_20,1);
  local_20[0] = *(byte *)((char *)npc + 0xb) & 0xf;
  babl_set_variable(s_npc_goal_0008535c,local_20,1);
  local_20[0] = (ushort)((*(ushort *)((char *)npc + 0xb) & 0xff0) >> 4);
  babl_set_variable(s_npc_gtarg_00085350,local_20,1);
  local_20[0] = (ushort)(((byte)npc[7] & 0x20) >> 5);
  babl_set_variable(s_npc_talkedto_00085340,local_20,1);
  local_20[0] = (byte) g_monster_type_props[(iVar3) / 0x30].trade_level & 0xf;
  babl_set_variable(s_npc_level_00085334,local_20,1);
  local_20[0] = (byte)npc[2] & 0x3f;
  babl_set_variable(s_npc_xhome_00085328,local_20,1);
  local_20[0] = (byte)npc[3] & 0x3f;
  babl_set_variable(s_npc_yhome_0008531c,local_20,1);
  if ((byte)npc[0xd] == 0) {
    local_20[0] = *npc & 0x1ff | 0x800;
  }
  else {
    local_20[0] = (byte)npc[0xd] + 0x10 | 0xe00;
  }
  babl_set_variable(s_npc_name_00085310,local_20,1);
  uVar4 = *(ushort *)((char *)npc + 0xb) & 0xf;
  bVar5 = uVar4 == 5;
  if (bVar5) {
    uVar4 = *(ushort *)((char *)npc + 0xb) & 0xff0;
  }
  if (bVar5 && uVar4 == 0x10) {
    local_20[0] = 0;
  }
  else if ((*(byte *)((char *)npc + 0x19) & 0x40) == 0) {
    local_20[0] = (ushort)(byte)((byte)npc[7] >> 6);
  }
  else {
    local_20[0] = 6;
  }
  babl_set_variable(s_npc_attitude_000845f8,local_20,1);
  bVar1 = g_player_object->hdr.type_flags;
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x39);
  babl_set_variable(s_play_hunger_00085304,local_20,1);
  if (g_monster_type_props[(bVar1 & 0x3f)].max_hp == '\0') {
    local_20[0] = 0x80;
  }
  else {
    /* Was `g_player_object[8]` -- g_player_object is `ushort *`, so the plain-index form reads byte
       offset 16 (8*2), not byte offset 8 where the player's real HP byte lives... */
    local_20[0] = ordint_divmod(g_monster_type_props[(bVar1 & 0x3f)].max_hp,
                                (uint) g_player_object->npc_hp << 8).quot;
  }
  babl_set_variable(s_play_health_000852f8,local_20,1);
  local_20[0] = (ushort) g_player_object->npc_hp;
  babl_set_variable(s_play_hp_000852f0,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x1e) + (ushort)*(byte *)(DAT_00086df8 + 0x21);
  babl_set_variable(s_play_arms_000852e4,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x27) + (ushort)*(byte *)(DAT_00086df8 + 0x37) +
                (ushort)*(byte *)(DAT_00086df8 + 0x1f);
  babl_set_variable(s_play_power_000852d8,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x37);
  babl_set_variable(s_play_mana_000852cc,local_20,1);
  local_20[0] = (ushort)*(byte *)(DAT_00086df8 + 0x3d);
  babl_set_variable(s_play_level_000852c0,local_20,1);
  local_20[0] = DAT_00201b68;
  babl_set_variable(s_dungeon_level_000852b0,local_20,1);
  local_20[0] = orduint_divmod(0x3bc4,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  babl_set_variable(s_game_time_000852a4,local_20,1);
  uVar2 = orduint_divmod(0x3bc4,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  local_20[0] = orduint_divmod(0x5a0,uVar2).rem;
  babl_set_variable(s_game_mins_00085298,local_20,1);
  local_20[0] = orduint_divmod(0x1502e80,*(undefined4 *)(DAT_00086df8 + 0xce)).quot;
  babl_set_variable(s_game_days_0008528c,local_20,1);
  local_20[0] = 0;
  babl_set_variable(s_new_player_exp_0008527c,local_20,1);
  local_20[0] = (ushort)((*(byte *)(DAT_00086df8 + 100) & 2) >> 1);
  babl_set_variable(s_play_sex_00085270,local_20,1);
  local_20[0] = (ushort)((*(byte *)(DAT_00086df8 + 0x5f) & 0x3c) >> 2);
  babl_set_variable(s_play_poison_00085264,local_20,1);
  local_20[0] = (ushort)((*(byte *)(DAT_00086df8 + 0x5f) & 2) >> 1);
  babl_set_variable(s_play_drawn_00085258,local_20,1);
  local_20[0] = DAT_00201c74;
  babl_set_variable(s_play_name_0008524c,local_20,1);
}



/* was sync_conv_vars_to_npc -- the write-back mirror of sync_conv_vars_from_npc, called once from
   the same enter_conversation_mode_screen, right after the conversation bytecode interpreter
   (run_babl_bytecode_interpreter) runs. */
// was FUN_0002af88
bool sync_conv_vars_to_npc(char *npc)
{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  bool bVar4;
  ushort local_10;
  undefined2 local_e;

  babl_get_variable(s_npc_hunger_00085394,&local_10,1);
  *(byte *)(npc + 0x19) = ((short)local_10 < 0x20) << 7 | *(byte *)(npc + 0x19) & 0x7f;
  babl_get_variable(s_npc_hp_00085380,&local_10,1);
  *(char *)(npc + 8) = (char)local_10;
  babl_get_variable(s_npc_xhome_00085328,&local_10,1);
  uVar1 = *(undefined2 *)(npc + 4);
  bVar2 = (byte)uVar1;
  *(byte *)(npc + 4) = (bVar2 ^ (byte)local_10) & 0x3f ^ bVar2;
  *(char *)(npc + 5) = (char)((ushort)uVar1 >> 8);
  babl_get_variable(s_npc_yhome_0008531c,&local_10,1);
  uVar1 = *(undefined2 *)(npc + 6);
  bVar2 = (byte)uVar1;
  *(byte *)(npc + 6) = (bVar2 ^ (byte)local_10) & 0x3f ^ bVar2;
  *(char *)(npc + 7) = (char)((ushort)uVar1 >> 8);
  babl_get_variable(s_npc_goal_0008535c,&local_10,1);
  babl_get_variable(s_npc_gtarg_00085350,&local_e,1);
  npc_set_goal_for_object(npc,(undefined1)local_10,local_e);
  uVar1 = *(undefined2 *)(npc + 0xd);
  *(char *)(npc + 0xd) = (char)uVar1;
  *(byte *)(npc + 0xe) = (byte)((ushort)uVar1 >> 8) | 0x20;
  babl_get_variable(s_npc_attitude_000845f8,&local_10,1);
  if ((short)local_10 < 4) {
    uVar3 = *(ushort *)(npc + 0xd) & 0x3fff;
    *(char *)(npc + 0xd) = (char)uVar3;
    *(byte *)(npc + 0xe) = (byte)(uVar3 >> 8) | (byte)(((local_10 & 3) << 0xe) >> 8);
  }
  else {
    uVar1 = *(undefined2 *)(npc + 0xd);
    *(char *)(npc + 0xd) = (char)uVar1;
    *(byte *)(npc + 0xe) = (byte)((ushort)uVar1 >> 8) | 0xc0;
    *(byte *)(npc + 0x19) = *(byte *)(npc + 0x19) | 0x40;
  }
  bVar4 = local_10 == 0;
  uVar1 = *(undefined2 *)(npc + 0xd);
  *(char *)(npc + 0xd) = (char)uVar1;
  *(byte *)(npc + 0xe) = (byte)((ushort)uVar1 >> 8) | 0x20;
  babl_get_variable(s_play_hunger_00085304,&local_10,1);
  *(char *)(DAT_00086df8 + 0x39) = (char)local_10;
  babl_get_variable(s_play_hp_000852f0,&local_10,1);
  g_player_object->npc_hp = (byte)(char)local_10;
  babl_get_variable(s_play_mana_000852cc,&local_10,1);
  *(char *)(DAT_00086df8 + 0x37) = (char)local_10;
  babl_get_variable(s_play_poison_00085264,&local_10,1);
  uVar3 = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
  *(byte *)(DAT_00086df8 + 0x5f) = (byte)uVar3 | (byte)((local_10 & 0xf) << 2);
  *(char *)(DAT_00086df8 + 0x60) = (char)(uVar3 >> 8);
  babl_get_variable(s_new_player_exp_0008527c,&local_10,1);
  if (local_10 != 0) {
    grant_experience_points((int)(short)local_10);   /* dropped arg: the parsed exp value */
  }
  return bVar4;
}






// was FUN_00019470
int load_npc_conversation_record(char *npc, byte *out_buffer)
{
  short sVar1;
  int iVar2;
  undefined1 *puVar3;
  char *local_28;
  undefined1 auStack_20 [16];

  /* Was `undefined4 out_buffer` (32-bit) -- truncated the real 64-bit buffer pointer (DAT_00100784 +
     0x400, passed in from start_npc_conversation) before it ever reached
     init_conv_var_terminator_record's own `*npc = 0xff` write... */
  init_conv_var_terminator_record(out_buffer);
  DAT_000bbf30 = 0;
  DAT_000bbf20 = npc;
  iVar2 = open_level_archive(auStack_20,npc);
  if (iVar2 == 0) {
    report_fatal_error_and_exit(0x300a);
  }
  else {
    DAT_000bbf18 = babl_alloc(0x4000);
    if (DAT_000bbf18 == 0) {
      report_fatal_error_and_exit(4);
    }
    local_28 = DAT_000bbf18;
    /* Was `read_archive_entry(auStack_20,DAT_001007c4)` -- a dropped 3rd argument.
       read_archive_entry's real signature takes a destination buffer (its own `param_3`, see its
       comment); the real ARM code... */
    sVar1 = read_archive_entry(auStack_20,DAT_001007c4,local_28);
    close_level_archive(auStack_20);
    if (sVar1 < 1) {
      /* Was `message_scroll_print_wrapped(...); return 1;` -- a second, separate bug on top of the
         already-fixed dropped-argument one (see the surviving half of this comment below)... */
      return message_scroll_print_wrapped(get_message_string(0xe01));
    }
  }
  iVar2 = build_babl_symbol_table();
  if (-1 < iVar2) {
    babl_vm_load_script(iVar2);
    babl_free(local_28);
    DAT_000bbf14 = (intptr_t)babl_alloc((DAT_000bbf7c + 0x800) * 2);
    load_npc_conversation_variables((void *)(intptr_t)(DAT_000bbf14),(int)DAT_000bbf7c);
    DAT_000bbf84 = DAT_000bbf7c;
    DAT_000bbf0c = DAT_000bbf14 + DAT_000bbf7c * 2;
    puVar3 = (undefined1 *)babl_alloc(1);
    *puVar3 = 0;
    DAT_000bbf88 = register_interned_string(puVar3,0x7c);
    init_babl_variable_defaults();
    babl_register_builtin(s_compare_000845a0,babl_builtin_compare);
    babl_register_builtin(s_random_00084598,babl_builtin_random);
    babl_register_builtin(s_plural_00084590,babl_builtin_plural);
    babl_register_builtin(s_contains_00084584,babl_builtin_contains);
    babl_register_builtin(s_append_0008457c,babl_builtin_append);
    babl_register_builtin(s_copy_00084574,babl_builtin_copy);
    babl_register_builtin(s_find_0008456c,babl_builtin_find);
    babl_register_builtin(s_length_00084564,&babl_builtin_length);
    babl_register_builtin(s_val_00084560,babl_builtin_val);
    return 1;
  }
  return 0xffffffff;
}




// was FUN_0001a5bc
void save_npc_conversation_variables()

{
  char stack0xffdc3240_buf [256];
  char *stack0xffdc3240_ptr;
  char cVar1;
  short sVar2;
  intptr_t uVar3; // was `undefined4` -- truncated the real 64-bit DAT_000bbf14 pointer on assignment, same bug class as load_npc_conversation_variables's own `param_1` fix (its load-side mirror); dormant until the scan-alignment fix below let execution actually reach this write
  char *pcVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  /* Was two separate stack locals (`short local_120; short local_11e;`) read as ONE 4-byte record
     via `&local_120,4` -- the same "Ghidra split one real contiguous buffer into separate stack
     locals" bug class fixed dozens of times elsewhere in this file... */
  undefined1 local_120_backing[4];
  #define local_120 (*(short *)(local_120_backing + 0))
  #define local_11e (*(short *)(local_120_backing + 2))
  char acStack_118 [260];

  reset_string_resource_page(0x7c);
  sVar2 = DAT_000bbf7c;
  uVar3 = DAT_000bbf14;
  pcVar4 = &DAT_0023cca8;
    stack0xffdc3240_ptr = acStack_118;
  do {
    cVar1 = *pcVar4;
    *stack0xffdc3240_ptr = cVar1; stack0xffdc3240_ptr = stack0xffdc3240_ptr + 1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_118,s__SAVE0_bglobals_dat_00084538);
  iVar5 = open_existing_file_rw_alt(acStack_118);
  if (iVar5 != -1) {
    while( true ) {
      uVar6 = read_file_handle(iVar5,local_120_backing,4);
      if ((uVar6 < 4) ||
         (uVar7 = (uint)local_120, uVar6 = (uint)DAT_001007c4,
         uVar7 != uVar6 && (int)uVar6 <= (int)uVar7)) {
        goto LAB_00019460;
      }
      if (uVar7 == uVar6) break;
      seek_file_handle(iVar5,(int)local_11e << 1,1);
    }
    if (sVar2 < local_11e) {
      local_11e = sVar2;
    }
    write_file_handle(iVar5,(const void *)(intptr_t)(uVar3),(int)local_11e << 1);
LAB_00019460:
    CloseHandle(iVar5);
  }
  #undef local_120
  #undef local_11e
  return;
}




// was FUN_0001825c -- babl builtin "remove_talker": looks up the tile the current conversation
// partner (DAT_00100674) is standing on (its packed tile coords at offset 0x16) and discards it
// from that tile's object list as misplaced.
void babl_builtin_remove_talker()

{
  char *iVar1;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  iVar1 = (char *)tilemap_lookup(DAT_00100674->npc_xhome,
                       DAT_00100674->npc_yhome);
  discard_misplaced_object(iVar1 + 2,DAT_00100674,1);
  return;
}




// was FUN_00019120 -- copies the default conversation-globals template (\DATA\babglobs.dat) into
// the active save's own copy (\SAVE0\bglobals.dat), one variable-length record at a time.
int seed_conversation_globals_for_new_game()

{
  char stack0xffdc323c_buf [256];
  char *stack0xffdc323c_ptr;
  char cVar1;
  bool bVar2;
  char *pcVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  char *pcVar8;
  /* Was `undefined1 auStack_124[4]; short local_122;` -- a previous fix widened auStack_124 to the
     4 bytes read_file_handle/write_file_handle read and write as one blob, but left local_122 as
     its own... */
  short auStack_124 [2];
#define local_122 auStack_124[1]
  char acStack_11c [260];
  
  ce_memset(acStack_11c,0,0x104);
  pcVar8 = &DAT_0023cca8;
    stack0xffdc323c_ptr = stack0xffdc323c_buf;
  pcVar3 = pcVar8;
    stack0xffdc323c_ptr = acStack_11c;
  do {
    cVar1 = *pcVar3;
    *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_11c,s__DATA_babglobs_dat_0008454c);
  iVar4 = open_file_for_read(acStack_11c);
  if (iVar4 == -1) {
    uVar5 = 0x3007;
  }
  else {
    ce_memset(acStack_11c,0,0x104);
    do {
      cVar1 = *pcVar8;
      *stack0xffdc323c_ptr = cVar1; stack0xffdc323c_ptr = stack0xffdc323c_ptr + 1;
      pcVar8 = pcVar8 + 1;
    } while (cVar1 != '\0');
    ce_strcat(acStack_11c,s__SAVE0_bglobals_dat_00084538);
    iVar6 = open_existing_file_rw(acStack_11c);
    if (iVar6 != -1) {
      ce_memset(DAT_00248410,0,0x1000);
      do {
        bVar2 = true;
        iVar7 = read_file_handle(iVar4,auStack_124,4);
        if (iVar7 != 4) goto LAB_00019240;
        iVar7 = write_file_handle(iVar6,auStack_124,4);
      } while ((iVar7 == 4) &&
              (iVar7 = write_file_handle(iVar6,DAT_00248410,(int)local_122 << 1), iVar7 == local_122 * 2)
              );
      bVar2 = false;
LAB_00019240:
      CloseHandle(iVar4);
      CloseHandle(iVar6);
      if (bVar2) {
        return 0;
      }
    }
    uVar5 = 0x4001;
  }
  return uVar5;
}
#undef local_122




// was FUN_00019660 -- writes an 8-byte "terminator" record (id/marker bytes 0xffffffff, value bytes
// 0) at the head of the conversation- globals destination buffer, ahead of
// load_npc_conversation_record's real archive read...
void init_conv_var_terminator_record(byte *record)
{
  DAT_000bbf04 = (uint *)record;
  *record = 0xff;
  record[1] = 0xff;
  record[2] = 0xff;
  record[3] = 0xff;
  record[4] = 0;
  record[5] = 0;
  record[6] = 0;
  record[7] = 0;
}




// was FUN_00019d00 -- recursive parser for one "@X..." embedded reference inside a babl display
// string (expand_string_refs's own sub-parser for compound G/S/P/C-chained expressions)...
int parse_babl_string_ref_expr(char **cursor)
{
  char cVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  char *pcVar5;
  int iVar6;
  char cVar7;
  undefined1 auStack_24 [20];
  
  pcVar5 = *cursor;
  cVar7 = 'I';
  cVar1 = *pcVar5;
  *cursor = pcVar5 + 1;
  if (cVar1 != 'C') {
    cVar7 = pcVar5[1];
    *cursor = pcVar5 + 2;
  }
  if (cVar7 == 'I') {
    ce_strncpy(auStack_24,*cursor,0x13);
    sVar2 = ce_atoi(auStack_24);
    cVar7 = **cursor;
    while ((cVar7 != '\0' &&
           ((iVar6 = _isctype((int)**cursor,4), iVar6 != 0 ||
            (**cursor == '-'))))) {
      pcVar5 = *cursor;
      *cursor = pcVar5 + 1;
      cVar7 = pcVar5[1];
    }
    cVar7 = **cursor;
    if (((cVar7 == 'G') || (cVar7 == 'S')) || (cVar7 == 'P' || cVar7 == 'C')) {
      sVar3 = parse_babl_string_ref_expr(cursor);
      sVar3 = sVar3 + -1;
    }
    else {
      sVar3 = 0;
    }
    if (cVar1 != 'G') {
      if (cVar1 != 'P') {
        if (cVar1 != 'S') {
          return (int)sVar2;
        }
        iVar6 = babl_read_frame_word(((int)sVar3 + (int)sVar2) * 0x10000 >> 0x10);
        return iVar6;
      }
      sVar4 = babl_read_frame_word((int)sVar2);
      sVar2 = sVar3;
      sVar3 = sVar4;
    }
    iVar6 = babl_read_var_word(((int)sVar3 + (int)sVar2) * 0x10000 >> 0x10);
  }
  else {
    iVar6 = 0;
  }
  return iVar6;
}




// was FUN_0001ada8 -- address-of counterpart to babl_read_var_word: returns a pointer to word index
// param_1 in the conversation-variable segment, for intrinsics that need to pass a variable by
// reference (e.g. an out-parameter) rather than read its value.
intptr_t babl_var_word_addr(short word_index)
{
  return DAT_000bbf14 + word_index * 2;
}



// was FUN_0001adc4 -- reads word param_1 (a signed index, negative for the common "stack operand a
// few slots back" caller pattern) from the babl VM's conversation-variable segment (DAT_000bbf14).
int babl_read_var_word(short word_index)
{
  return (int)*(short *)(DAT_000bbf14 + word_index * 2);
}



// was FUN_0001ade4 -- write-side counterpart to babl_read_var_word:
// stores param_2 at word index param_1 in the conversation-variable
// segment.
void babl_write_var_word(short word_index, short value)
{
  *(undefined2 *)(DAT_000bbf14 + word_index * 2) = value;
}



// was FUN_0001ae04 -- reads word param_1, relative to the current call frame base (DAT_000bbf2c),
// from the babl VM's stack segment (DAT_000bbf0c, which sits immediately after DAT_000bbf14's
// variable segment in the same allocation -- see the interpreter loop's own setup).
int babl_read_frame_word(short word_offset)
{
  return (int)*(short *)(DAT_000bbf0c + ((int)DAT_000bbf2c + (int)word_offset) * 2);
}




// was FUN_0001b0a4 -- walks the babl symbol table (DAT_000bbf70, 0x20- byte records) once at VM
// startup and initializes each variable's default value by its declared type (offset 0x1c):
// string-typed variables...
void init_babl_variable_defaults()

{
  short sVar1;
  intptr_t iVar2; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t; see its own comment) right back down
  short *psVar3;
  int iVar4;

  /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own comment (uw.c ~12260) --
     unlike its siblings this one dereferences unconditionally before any loop check, so guard the
     read itself rather than the loop condition. */
  psVar3 = (short *)(DAT_000bbf70 + 0x18);
  sVar1 = (DAT_000bbf70 == 0) ? 0 : *(short *)(DAT_000bbf70 + 0x18);
  iVar2 = DAT_000bbf70;
  while (sVar1 != 0) {
    if (*(short *)(iVar2 + 0x1e) != 0x111) {
      sVar1 = *(short *)(iVar2 + 0x1c);
      if (sVar1 == 0x126) {
        *(undefined2 *)(DAT_000bbf14 + *(short *)(iVar2 + 0x1a) * 2) = 0;
      }
      else if (sVar1 == 0x128) {
        *(undefined2 *)(DAT_000bbf14 + *(short *)(iVar2 + 0x1a) * 2) = DAT_000bbf88;
      }
      else if (sVar1 == 0x12a) {
        if (0 < *psVar3) {
          iVar4 = 0;
          do {
            *(undefined2 *)(DAT_000bbf14 + (iVar4 + *(short *)(iVar2 + 0x1a)) * 2) = DAT_000bbf88;
            iVar4 = ((int)iVar4 + 1) * 0x10000 >> 0x10;
          } while (iVar4 < *psVar3);
        }
      }
      else if ((sVar1 == 299) && (0 < *psVar3)) {
        iVar4 = 0;
        do {
          *(undefined2 *)(DAT_000bbf14 + (iVar4 + *(short *)(iVar2 + 0x1a)) * 2) = 0;
          iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
        } while (iVar4 < *psVar3);
      }
    }
    psVar3 = (short *)(iVar2 + 0x38);
    iVar2 = iVar2 + 0x20;
    sVar1 = *psVar3;
  }
  return;
}




// was FUN_0001b288 -- babl builtin "setup_to_barter": walks the current conversation partner's
// (DAT_00100674) inventory list, culling items that fail a comobj.dat property check or lose a
// random roll (once 4 items have already been kept, via DAT_000bbfe8's rotating 4-slot pool)...
void babl_builtin_setup_to_barter()

{
  int iVar1;
  bool bVar2;
  bool bVar3;
  ushort uVar4;
  short sVar5;
  ushort *puVar6;
  ushort *puVar7;
  uint uVar8;
  ushort *uVar9;
  short *psVar10;
  short sVar11;
  int iVar12;
  intptr_t iVar13;
  ushort *puVar14;
  
  sVar11 = 0;
  bVar2 = false;
  bVar3 = false;
  if (!DAT_00100674->npc_loot_spawned) {
    /* Dropped argument -- see babl_builtin_take_from_npc's identical
       call for the full explanation; intended arg is DAT_00100674. */
    spawn_creature_death_loot(DAT_00100674);
  }
  /* ARM 0x1b2cc uses a byte offset: the NPC inventory head is at +6. */
  iVar13 = (intptr_t)((char *)&DAT_00100674->hdr.link_word);
  puVar6 = (ushort *)resolve_object_link((void *)(intptr_t)(iVar13));
  iVar12 = 0;
  puVar14 = (ushort *)0x0;
  while (((puVar6 != (ushort *)0x0 && (puVar6 != puVar14)) &&
         (iVar1 = (int)sVar11, sVar11 = (short)((uint)((iVar1 + 1) * 0x10000) >> 0x10), iVar1 < 0x28
         ))) {
    puVar7 = (ushort *)resolve_object_link(puVar6 + 2);
    if ((((((uw_object_hdr_t *)puVar6)->object_id & 0x30) == 0) && (!bVar2)) ||
        (((short)g_object_type_props[(((uw_object_hdr_t *)puVar6)->object_id)].monetary_value == 0 ||
          ((bVar3 && (uVar8 = ce_rand(), (uVar8 & 7) < 5)))))) {
      uVar4 = ((uw_object_hdr_t *)puVar6)->type_flags;
      puVar6 = puVar7;
      if ((uVar4 & 0x30) == 0) {
        bVar2 = true;
      }
    }
    else {
      object_list_unlink((void *)(intptr_t)(iVar13),puVar6);
      psVar10 = &DAT_000bbfe8 + (short)iVar12;
      if (*psVar10 != 0) {
        if (puVar14 == (ushort *)0x0) {
          puVar14 = (ushort *)get_object_record_by_slot_index((int)*psVar10);
        }
        uVar9 = get_object_record_by_slot_index((int)*psVar10);
        object_list_insert_head((char *)&DAT_00100674->hdr.link_word,uVar9);
      }
      sVar5 = encode_object_slot_index(puVar6);
      *psVar10 = sVar5;
      redraw_barter_slot_icon(0,iVar12);
      iVar12 = ((short)iVar12 + 1) * 0x10000 >> 0x10;
      puVar6 = puVar7;
      if (3 < iVar12) {
        iVar12 = 0;
        bVar3 = true;
      }
    }
  }
  debug_noop_checkpoint();
  return;
}




// was FUN_0001b474 -- initializes the barter/trade UI: allocates the 4-slot left/right item-icon
// grtile pools (DAT_000bc028/DAT_000bc010), captures the trade-scale panel background under them
// from the framebuffer...
void init_barter_ui()

{
  int iVar1;
  byte bVar2;
  undefined2 uVar3;
  short sVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  
  iVar7 = 0;
  iVar6 = (DAT_00100674->hdr.object_id & 0x3f) * 0x30;
  g_blit_transparent_mode = 1;
  do {
    uVar5 = grtile_alloc_registered(0x10,0x20);
    (&DAT_000bc028)[iVar7] = uVar5;
    uVar5 = grtile_alloc_registered(0x10,0x20);
    (&DAT_000bc010)[iVar7] = uVar5;
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 4);
  iVar7 = 0;
  do {
    iVar1 = iVar7 * 4;
    capture_framebuffer_rect_to_grtile((&DAT_000bc028)[iVar7],(int)*(short *)(&DAT_000845b8 + iVar1),
                 (int)*(short *)(&DAT_000845ba + iVar1),0x10,0x10);
    capture_framebuffer_rect_to_grtile((&DAT_000bc010)[iVar7],(int)*(short *)(&DAT_000845d8 + iVar1),
                 (int)*(short *)(&DAT_000845da + iVar1),0x10,0x10);
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 4);
  iVar7 = 0;
  DAT_000bbfd8 = 0;
  DAT_000bbfdc = 0;
  do {
    (&DAT_000bbfd0)[iVar7] = 0;
    (&DAT_000bbfe8)[iVar7] = 0;
    (&DAT_000bbfa8)[iVar7] = 0xffff;
    (&DAT_000bbfc0)[iVar7] = 0xffff;
    (&DAT_000bbfa8)[iVar7 + 4] = 0xffff;
    (&DAT_000bbfc0)[iVar7 + 4] = 0xffff;
    (&DAT_000bbf98)[iVar7] = 0;
    (&DAT_000bbff0)[iVar7] = 0;
    draw_hotspot_crosshair_marker(1,iVar7);
    draw_hotspot_crosshair_marker(0,iVar7);
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 4);
  DAT_000bc008 = 0;
  DAT_001006d0 = 1;
  uVar3 = encode_object_slot_index(DAT_00100674);
  ce_srand(uVar3);
  DAT_000bc024 = randomize_value_pct((g_monster_type_props[(iVar6) / 0x30].trade_patience & 0xf) * '\x06',
                                     -25,0x19);
  DAT_000bc004 = randomize_value_pct(g_monster_type_props[(iVar6) / 0x30].trade_patience >> 4,
                                     -20,100);
  DAT_000bbfbc = randomize_value_pct((0xf - (uint)((byte) g_monster_type_props[(iVar6) / 0x30].trade_level >> 4)) * 6,
                                     -25,0x32)
  ;
  iVar7 = randomize_value_pct(g_monster_type_props[(iVar6) / 0x30].trade_level & 0xf,
                              -20,0x14);
  DAT_000bbfe0 = (undefined2)iVar7;
  DAT_000bbfb8 = 0;
  bVar2 = *(byte *)(DAT_00086df8 + 0x30);
  DAT_000bc024 = DAT_000bc024 + (ushort)bVar2 * -2;
  DAT_000bc004 = DAT_000bc004 + ((short)(ushort)bVar2 >> 1);
  sVar4 = ordint_divmod(6,(ushort)bVar2).quot;
  DAT_000bbfe0 = (undefined2)(iVar7 - sVar4);
  iVar7 = (iVar7 - sVar4) * 0x10000 >> 0x10;
  uVar3 = DAT_000bbfe0;
  if (iVar7 < 1) {
    uVar3 = 1;
  }
  DAT_000bc020 = 0;
  if (iVar7 < 1) {
    DAT_000bbfe0 = uVar3;
  }
  DAT_000bc000 = 0;
  compute_dimension_volume();
  return;
}




// was FUN_0001b7c0 -- teardown counterpart to init_barter_ui: for each of the 4 barter slots, if
// the player or NPC still has an uncommitted offered item pending (DAT_000bbfd0/DAT_000bbfe8 > 0),
// drops it back near its owner rather than letting it vanish...
void end_barter_ui()

{
  ushort *uVar1;
  int iVar2;
  
  decrement_cursor_hide_depth();
  iVar2 = 0;
  do {
    if (0 < (short)(&DAT_000bbfd0)[iVar2]) {
      uVar1 = get_object_record_by_slot_index((int)(short)(&DAT_000bbfd0)[iVar2]);
      drop_object_near_target(g_player_object,uVar1,5,0);
      restore_captured_grtile_backdrop((&DAT_000bc028)[iVar2]);
    }
    if (0 < (short)(&DAT_000bbfe8)[iVar2]) {
      uVar1 = get_object_record_by_slot_index((int)(short)(&DAT_000bbfe8)[iVar2]);
      drop_object_near_target(DAT_00100674,uVar1,5,0);
      restore_captured_grtile_backdrop((&DAT_000bc010)[iVar2]);
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 4);
  cursor_show_idle_tick();
  iVar2 = 0;
  do {
    invalidate_grtile_by_key((&DAT_000bc028)[iVar2]);
    invalidate_grtile_by_key((&DAT_000bc010)[iVar2]);
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 4);
  return;
}




// was FUN_0001b89c -- click-region callback registered over the fixed player-side barter panel (see
// register_click_region's own call site): hit-tests the click against the 4 player slots and
// dispatches to handle_barter_slot_click for the one hit.
void handle_barter_player_panel_click()

{
  undefined4 uVar1;

  uVar1 = hit_test_barter_player_slot(*DAT_00085a6c + 0x8b,0x30 - DAT_00085a6c[1]);
  if (-1 < (short)uVar1) {
    handle_barter_slot_click(1,uVar1,&DAT_000bbfd0,&DAT_000bbf98);
    debug_noop_checkpoint();
  }
  return;
}



// was FUN_0001b900 -- hit-tests a point against the 4 player-side
// barter icon slots (DAT_000845b8/DAT_000845ba coordinate table, each
// a 0x10x0x10 box); returns the matching slot index or -1.
int hit_test_barter_player_slot(short x, short y)
{
  int iVar1;
  
  iVar1 = 0;
  do {
    if (((int)*(short *)(&DAT_000845b8 + iVar1 * 4) <= (int)x) &&
       ((int)x <= *(short *)(&DAT_000845b8 + iVar1 * 4) + 0x10)) {
      if (((int)*(short *)(&DAT_000845ba + iVar1 * 4) <= (int)y) &&
         ((int)y <= *(short *)(&DAT_000845ba + iVar1 * 4) + 0x10)) {
        return iVar1;
      }
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    if (3 < iVar1) {
      return -1;
    }
  } while( true );
}



// was FUN_0001b9a4 -- NPC-side counterpart to hit_test_barter_player_slot,
// against the DAT_000845d8/DAT_000845da coordinate table.
int hit_test_barter_npc_slot(short x, short y)
{
  int iVar1;
  
  iVar1 = 0;
  do {
    if (((int)*(short *)(&DAT_000845d8 + iVar1 * 4) <= (int)x) &&
       ((int)x <= *(short *)(&DAT_000845d8 + iVar1 * 4) + 0x10)) {
      if (((int)*(short *)(&DAT_000845da + iVar1 * 4) <= (int)y) &&
         ((int)y <= *(short *)(&DAT_000845da + iVar1 * 4) + 0x10)) {
        return iVar1;
      }
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    if (3 < iVar1) {
      return -1;
    }
  } while( true );
}



// was FUN_0001ba48 -- like handle_barter_player_panel_click, but reads the click point from the
// live cursor position rather than a fixed panel-relative one; used for the "drop the item you're
// holding onto a player slot" path.
void handle_barter_player_slot_drop()

{
  undefined4 uVar1;
  short local_8;
  short local_6;
  
  get_mouse_position(&local_6,&local_8);
  uVar1 = hit_test_barter_player_slot((int)local_6,(int)local_8);
  if (-1 < (short)uVar1) {
    handle_barter_slot_click(1,uVar1,&DAT_000bbfd0,&DAT_000bbf98);
  }
  debug_noop_checkpoint();
  return;
}



// was FUN_0001baa0 -- NPC-side counterpart to
// handle_barter_player_panel_click.
void handle_barter_npc_panel_click()

{
  undefined4 uVar1;
  
  uVar1 = hit_test_barter_npc_slot(*DAT_00085a6c + 0x52,0x30 - DAT_00085a6c[1]);
  if (-1 < (short)uVar1) {
    handle_barter_slot_click(0,uVar1,&DAT_000bbfe8,&DAT_000bbff0);
    debug_noop_checkpoint();
  }
  return;
}



// was FUN_0001bb04 -- shared core logic for a barter slot click: param_1 selects which side
// (1=player, 0=NPC), param_2 the slot index, param_3/param_4 that side's paired state arrays
// (offered-item slot array / "included in trade" flag array).
void handle_barter_slot_click(int is_player_side, int slot, void *counts, void *values)
{
  short sVar1;
  int iVar2;
  char *obj_rec;
  int iVar3;
  uint *puVar4;
  undefined4 uVar5;
  void *obj_ptr;
  int iVar6;
  char *split_rec;
  bool bVar7;
  short local_38;
  short local_36;
  ushort local_10;
  short local_c;
  char *local_8;
  char *local_4;
  
  split_rec = 0;
  bVar7 = g_selected_object != 0;
  local_10 = is_player_side;
  local_c = slot;
  local_8 = (char *)counts;
  local_4 = (char *)values;
  if (!bVar7) {
    if (*(short *)(counts + (short)slot * 2) == 0) {
      return;
    }
    iVar2 = wait_for_key_or_mouse_move(1);
    if (iVar2 != 0) {
      if (((short)local_10 == 0) && (DAT_000bc008 == '\0')) {
        return;
      }
      obj_rec = get_object_record_by_slot_index((int)*(short *)(local_8 + (short)local_c * 2));
      if ((((((uw_object_hdr_t *)obj_rec)->is_quant != 0) && ((((uw_object_hdr_t *)obj_rec)->link & 0x200) == 0)) &&
           (((uw_object_hdr_t *)obj_rec)->link != 1)) && (split_rec = prompt_split_object_stack((byte *)(intptr_t)(obj_rec)), split_rec == 0))
      {
        return;
      }
      iVar3 = check_object_carry_weight((ushort *)(intptr_t)(obj_rec));
      if (iVar3 == 0) {
        if ((split_rec != 0) && (split_rec != obj_rec)) {
          iVar3 = (((uw_object_hdr_t *)obj_rec)->link << 6) + (*(ushort *)(split_rec + 6) & 0xffc0);
          ((uw_object_hdr_t *)obj_rec)->link_word_low = (byte)iVar3 ^ ((uw_object_hdr_t *)obj_rec)->owner;
          ((uw_object_hdr_t *)obj_rec)->link_word_high = (byte)(char)((uint)iVar3 >> 8);
          object_list_unlink((void *)(intptr_t)(obj_rec + 4),(void *)(intptr_t)(split_rec));
          free_object_slot((void *)(intptr_t)(split_rec));
        }
        print_scroll_message_by_id(0xfc);
        return;
      }
      if (split_rec != 0 && split_rec != obj_rec) {
        object_list_insert_head((void *)(intptr_t)(obj_rec + 4),(void *)(intptr_t)(split_rec));
      }
      bVar7 = true;
      if ((split_rec == 0) || (uVar5 = 1, split_rec == obj_rec)) {
        uVar5 = 0;
      }
      pick_up_barter_slot_item((int)(short)local_c,(char *)(intptr_t)(local_8),uVar5);
      redraw_barter_slot_icon((int)(short)local_10,(int)(short)local_c);
      *(undefined4 *)(local_4 + (short)local_c * 4) = 0;
      (&DAT_000bbfa8)[(short)local_c] = 0xffff;
      (&DAT_000bbfa8)[(short)local_c + 4] = 0xffff;
      /* Real ARM binary also calls this with only 1 arg (confirmed via Ghidra decompile of the real
         handle_barter_slot_click) -- same "leftover register" reliance as
         blit_sprite_row_remapped's dropped 4th arg, not a decompile mistake... */
      draw_hotspot_crosshair_marker((int)(short)local_10,(int)(short)local_c);
      if (g_selected_object == 0) {
        return;
      }
      if (split_rec != 0) {
        g_cursor_holding_state = 1;
        return;
      }
      wait_for_click_release(1);
      get_mouse_position(&local_36,&local_38);
      sVar1 = resolve_barter_slot_at_point((int)local_36,(int)local_38,&local_10,&local_c,(void **)&local_8,(void **)&local_4);
      if (sVar1 == 0) {
        g_cursor_holding_state = 1;
        handle_inventory_panel_click(-1);
        return;
      }
    }
    if (g_selected_object == 0) {
      if ((*(ushort *)(DAT_00085a6c + 6) & 1) == 0) {
        iVar6 = 1;
        obj_ptr = get_object_record_by_slot_index((int)*(short *)(local_8 + (short)local_c * 2));
        if ((short)local_10 == 0) {
          sVar1 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x29),0x14);
          if (0 < sVar1) {
            iVar6 = 2;
          }
        }
        else {
          iVar6 = roll_skill_check(*(undefined1 *)(DAT_00086df8 + 0x29),0xf);
          iVar6 = iVar6 + 1;
        }
        dispatch_object_action((ushort *)obj_ptr,iVar6);
      }
      else {
        puVar4 = (uint *)(local_4 + (short)local_c * 4);
        *puVar4 = (uint)(*puVar4 == 0);
        draw_hotspot_crosshair_marker((int)(short)local_10,(int)(short)local_c);
      }
      goto LAB_0001bec8;
    }
  }
  wait_for_click_release(1);
  g_cursor_holding_state = 1;
  if ((short)local_10 == 0) {
    g_cursor_holding_state = 1;
    return;
  }
  place_item_in_barter_slot((int)(short)local_10,(int)(short)local_c,local_8);
  redraw_barter_slot_icon((int)(short)local_10,(int)(short)local_c);
  *(undefined4 *)(local_4 + (short)local_c * 4) = 1;
  draw_hotspot_crosshair_marker((int)(short)local_10,(int)(short)local_c);
  (&DAT_000bbfa8)[(short)local_c] = 0xffff;
  (&DAT_000bbfa8)[(short)local_c + 4] = 0xffff;
LAB_0001bec8:
  if ((bVar7) && (g_selected_object == 0)) {
    pop_cursor_icon(3);
    g_cursor_holding_state = 0;
  }
}




// was FUN_0001bef4 -- hit-tests a point against both barter panels (player first, then NPC) and, on
// a hit, fills in the out-parameters with which side (1=player/0=npc, *param_3), slot index
// (*param_4), and that side's paired state-array pointers (*param_5/*param_6).
int resolve_barter_slot_at_point(short x, short y, ushort *out_is_player, short *out_slot, void **out_item_ids, void **out_flags)
{
  short sVar1;
  void *puVar2;
  
  sVar1 = hit_test_barter_player_slot(x,y);  /* ARM 0x1bef4-0x1bf08: r0/r1 pass straight through */
  if ((uint)(int)sVar1 < 0x80000000) {
    *out_is_player = 1;
    *out_slot = sVar1;
    *out_item_ids = &DAT_000bbfd0;  /* was written through a `uint *` (truncated pointer) */
    puVar2 = &DAT_000bbf98;
  }
  else {
    sVar1 = hit_test_barter_npc_slot(x,y);
    if (sVar1 < 0) {
      return 0;
    }
    *out_is_player = 0;
    *out_slot = sVar1;
    *out_item_ids = &DAT_000bbfe8;
    puVar2 = &DAT_000bbff0;
  }
  *out_flags = puVar2;
  return 1;
}



// was FUN_0001bf9c -- redraws one barter slot's icon: frees the old grtile capture, redraws the
// trade-scale panel background if the slot is now empty, otherwise draws the item's sprite (plus a
// small stack- count label when quantity > 1). param_1 selects the side (0=NPC, nonzero=player)...
void redraw_barter_slot_icon(short side, short slot)
{
  int iVar1;
  int iVar3;
  short sVar4;
  undefined2 *puVar5;
  short *psVar6;
  char *uVar7;
  ushort uVar8;
  uint uVar9;
  undefined1 *puVar10;
  undefined1 auStack_2c [8];
  
  decrement_cursor_hide_depth();
  g_blit_transparent_mode = 1;
  if (side == 0) {
    puVar5 = &DAT_000bbfe8;
  }
  else {
    puVar5 = &DAT_000bbfd0;
  }
  iVar3 = (int)slot;
  sVar4 = puVar5[iVar3];
  if (sVar4 == 0) {
    uVar9 = (uint)side;
    psVar6 = (short *)0;  /* (was `psVar2`, a pointer-typed copy of `side`; unused when the slot is empty) */
  }
  else {
    psVar6 = (short *)get_object_record_by_slot_index(sVar4);
    uVar9 = (int)((uw_object_hdr_t *)psVar6)->type_flags_signed & 0x1ff;
  }
  puVar10 = &DAT_000845d8;
  iVar1 = iVar3 * 4;
  if (side == 0) {
    restore_captured_grtile_backdrop((&DAT_000bc010)[iVar3]);
    if (sVar4 == 0) goto LAB_0001c1b4;
    draw_sprite_by_id(uVar9,(int)*(short *)(&DAT_000845d8 + iVar1),(int)*(short *)(&DAT_000845da + iVar1)
                 ,0x10,0x10);
  }
  else {
    restore_captured_grtile_backdrop((&DAT_000bc028)[iVar3]);
    if (sVar4 == 0) goto LAB_0001c1b4;
    draw_sprite_by_id(uVar9,(int)*(short *)(&DAT_000845b8 + iVar1),(int)*(short *)(&DAT_000845ba + iVar1)
                 ,0x10,0x10);
  }
  if (sVar4 != 0) {
    if (((short)(((uw_object_hdr_t *)psVar6)->type_flags_signed & -0x8000) == 0) || ((((uw_object_hdr_t *)psVar6)->link_word_signed & 0x8000U) != 0)) {
      uVar8 = 0;
    }
    else {
      uVar8 = (ushort)((uw_object_hdr_t *)psVar6)->link_word_signed >> 6;
    }
    g_blit_transparent_mode = 0;
    if (1 < uVar8) {
      select_active_font(s_font4x5p_sys_0008431c);
      *g_draw_color_index = 0x60;
      if (side == 0) {
        uVar7 = _itoa(uVar8,auStack_2c,10);
      }
      else {
        uVar7 = _itoa(uVar8,auStack_2c,10);
        puVar10 = &DAT_000845b8;
      }
      draw_text_string(uVar7,*(short *)(puVar10 + iVar1) + 3,*(short *)(puVar10 + iVar1 + 2) + 1)
      ;
      select_active_font(s_font5x6p_sys_0008430c);
    }
  }
LAB_0001c1b4:
  cursor_show_idle_tick();
  debug_noop_checkpoint();
}



// was FUN_0001c1c8 -- removes the item from barter slot param_1 (offset param_2 into the side's
// state array) into g_selected_object (the cursor's held item), clearing the slot.
void pick_up_barter_slot_item(short slot, char *slot_array, int remove_all)
{
  short sVar1;
  short *psVar2;
  bool bVar3;
  
  psVar2 = (short *)(slot_array + slot * 2);
  bVar3 = g_selected_object != (char *)0x0;
  g_selected_object = (char *)get_object_record_by_slot_index((int)*psVar2);
  *psVar2 = 0;
  if (g_selected_object != (char *)0x0) {
    if (remove_all != 0) {
      sVar1 = encode_object_slot_index(resolve_object_link(g_selected_object + 2));  /* ARM 0x1c220: r0 passthrough */
      *psVar2 = sVar1;
    }
    decrement_cursor_hide_depth();
    if (bVar3) {
      pop_cursor_icon(0);
    }
    /* Was `*g_selected_object & 0x1ff` -- see swap_cursor_and_slot_item's
       own identical fix comment (g_selected_object is `char *`, a
       single signed byte; the real 9-bit objid needs a `ushort` read). */
    push_cursor_icon(*(ushort *)g_selected_object & 0x1ff);
    cursor_show_idle_tick();
    debug_noop_checkpoint();
  }
}



// was FUN_0001c268 -- drops g_selected_object (the cursor's held item) into a barter slot: if the
// slot is empty, places it directly; otherwise defers to merge_or_swap_barter_slot_item to stack or
// swap against the existing occupant.
void place_item_in_barter_slot(int is_player_side, int slot, void *slot_array)
{
  short sVar1;
  int iVar2;
  short *psVar3;
  
  psVar3 = (short *)(slot_array + (short)slot * 2);
  if (*psVar3 == 0) {
    sVar1 = encode_object_slot_index(g_selected_object);
    *psVar3 = sVar1;
  }
  else {
    iVar2 = merge_or_swap_barter_slot_item((ushort *)g_selected_object,is_player_side,slot,slot_array);
    if (iVar2 == 0) {
      return;
    }
  }
  g_selected_object = 0;
}



// was FUN_0001c2c4 -- called when dropping the cursor's held item onto an already-occupied barter
// slot: if both items are the same stackable item-id (weightless/quantity-bit set) and combining
// wouldn't exceed 999, merges the quantities and frees the held object's slot...
int merge_or_swap_barter_slot_item(ushort *held_object, int side, int slot, void *slot_array)
{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  ushort *puVar5;
  int iVar6;
  short *psVar7;
  undefined4 uVar8;
  
  psVar7 = (short *)(slot_array + (short)slot * 2);
  uVar8 = 0;
  puVar5 = (ushort *)get_object_record_by_slot_index((int)*psVar7);
  uVar1 = ((uw_object_hdr_t *)puVar5)->type_flags;
  if ((uVar1 & 0x1c0) == 0x80 && (uVar1 & 0x30) == 0) {
    return 0;
  }
  if (((*held_object & 0x8000) != 0) && ((uVar1 & 0x8000) != 0)) {
    uVar2 = held_object[3];
    if ((uVar2 & 0x8000) == 0) {
      uVar3 = ((uw_object_hdr_t *)puVar5)->link_word;
      if ((((uVar3 & 0x8000) == 0) && (((*held_object ^ uVar1) & 0x1ff) == 0)) &&
         ((ushort)((uVar3 >> 6) + (uVar2 >> 6)) < 999)) {
        iVar6 = (uVar3 & 0xffc0) + (uVar2 & 0xffc0);
        ((uw_object_hdr_t *)puVar5)->link_word_low = (byte)iVar6 ^ (byte)uVar3 & 0x3f;
        ((uw_object_hdr_t *)puVar5)->link_word_high = (byte)(char)((uint)iVar6 >> 8);
        free_object_slot(held_object);
        uVar8 = 1;
        goto LAB_0001c404;
      }
    }
  }
  sVar4 = encode_object_slot_index(g_selected_object);
  pick_up_barter_slot_item(slot,(char *)(intptr_t)(slot_array),0);
  *psVar7 = sVar4;
LAB_0001c404:
  redraw_barter_slot_icon(side,slot);
  debug_noop_checkpoint();
  return uVar8;
}




// was FUN_0001c420 -- draws a 5-pixel plot_pixel crosshair (center + one pixel each direction) at a
// coordinate pair looked up by index from one of two tables selected by param_1 (worn-item slots vs
// backpack slots), colored by whether a parallel "valid"/"used" table says that slot is occupied.
void draw_hotspot_crosshair_marker(short is_player_side, short slot)
{
  int slot_index = (int)slot;
  short *point;
  undefined2 color;
  undefined4 *included_flags;

  if (is_player_side != 0) {
    /* Was `position + iVar2` on the `undefined **` field -- pointer
       arithmetic on an 8-byte stride, doubling (and past index 1,
       overrunning) the intended 4-byte-stride table below. */
    point = (short *)(&PTR_DAT_000845c8 + slot_index * 4);
    included_flags = &DAT_000bbf98;
  }
  else {
    point = (short *)(&DAT_000845e8 + slot_index * 4);
    included_flags = &DAT_000bbff0;
  }
  color = 0x60;
  if (included_flags[slot_index] != 1) {
    color = 0xf1;
  }
  decrement_cursor_hide_depth();
  plot_pixel((int)point[0],(int)point[1],color);
  plot_pixel(point[0] + -1,(int)point[1],color);
  plot_pixel(point[0] + 1,(int)point[1],color);
  plot_pixel((int)point[0],point[1] + -1,color);
  plot_pixel((int)point[0],point[1] + 1,color);
  cursor_show_idle_tick();
  debug_noop_checkpoint();
}



// was FUN_0001c538 -- checks whether ANY of the 4 barter slots has a valid paired (count > 0, value
// > 0) entry across param_1 (a short count array) and param_2 (an int value array). Returns 1 if
// none do (the offer is effectively empty), 0 if at least one slot qualifies.
int barter_offer_is_empty(void *values, void *counts)
{
  int iVar1;
  
  iVar1 = 0;
  while ((*(int *)(counts + iVar1 * 4) < 1 || (*(short *)(values + iVar1 * 2) < 1))) {
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    if (3 < iVar1) {
      return 1;
    }
  }
  return 0;
}



// was FUN_0001c79c -- for each occupied NPC-side barter slot where param_1==0 or the slot isn't
// marked "included in trade" (DAT_000bbff0), links its item back into the NPC's own inventory list
// and clears the slot's icon/state.
void finalize_npc_barter_items(short skip_included)
{
  ushort *uVar1;
  int iVar2;
  
  decrement_cursor_hide_depth();
  iVar2 = 0;
  do {
    if ((0 < (short)(&DAT_000bbfe8)[iVar2]) && ((skip_included == 0 || ((&DAT_000bbff0)[iVar2] == 0)))) {
      uVar1 = get_object_record_by_slot_index((int)(short)(&DAT_000bbfe8)[iVar2]);
      object_list_insert_head((char *)&DAT_00100674->hdr.link_word,uVar1);
      restore_captured_grtile_backdrop((&DAT_000bc010)[iVar2]);
      (&DAT_000bbff0)[iVar2] = 0;
      (&DAT_000bbfe8)[iVar2] = 0;
      draw_hotspot_crosshair_marker(0,iVar2);
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 4);
  cursor_show_idle_tick();
  debug_noop_checkpoint();
}



// was FUN_0001c85c -- commits the player's accepted-for-trade items (the mirror image of
// finalize_npc_barter_items's condition: this one processes slots WHERE DAT_000bbf98's "included in
// trade" flag IS set, i.e. actually completes the deal for that item rather than returning it)...
void finalize_player_barter_items()

{
  short sVar1;
  ushort *puVar2;
  ushort *puVar3;
  int iVar4;
  short *psVar5;
  short local_2c;
  int local_28;
  
  decrement_cursor_hide_depth();
  local_2c = 0;
  local_28 = 0;
  do {
    psVar5 = &DAT_000bbfd0 + local_28;
    if (0 < *psVar5) {
      /* BUG FIX: was `check_npc_item_preference()` with no arguments, relying on leftover register
         state (same dropped-argument bug class documented throughout this project) -- *psVar5 (the
         slot's item-value, already used the very next line) is the value that belongs here... */
      if (((&DAT_000bbf98)[local_28] != 0) && (sVar1 = check_npc_item_preference(*psVar5), sVar1 != -1)) {
        puVar2 = (ushort *)get_object_record_by_slot_index((int)*psVar5);
        puVar3 = (ushort *)resolve_object_link((char *)&DAT_00100674->hdr.link_word);
        if ((((uw_object_hdr_t *)puVar2)->object_id) == 0xa1) {
          for (; puVar3 != (ushort *)0x0; puVar3 = (ushort *)resolve_object_link(puVar3 + 2)) {
            if ((((((uw_object_hdr_t *)puVar2)->is_quant != 0) && (((uw_object_hdr_t *)puVar3)->is_quant != 0)) &&
                 ((((uw_object_hdr_t *)puVar2)->link & 0x200) == 0)) &&
                ((((((uw_object_hdr_t *)puVar3)->link & 0x200) == 0 && (((((uw_object_hdr_t *)puVar3)->type_flags ^ ((uw_object_hdr_t *)puVar2)->type_flags) & 0x1ff) == 0)) &&
                  ((ushort)((((uw_object_hdr_t *)puVar3)->link) + (((uw_object_hdr_t *)puVar2)->link)) < 999)))) {
              iVar4 = (((uw_object_hdr_t *)puVar3)->link << 6) + (((uw_object_hdr_t *)puVar2)->link << 6);
              ((uw_object_hdr_t *)puVar3)->link_word_low = (byte)iVar4 ^ ((uw_object_hdr_t *)puVar3)->owner;
              ((uw_object_hdr_t *)puVar3)->link_word_high = (byte)(char)((uint)iVar4 >> 8);
              free_object_slot(puVar2);
              puVar2 = (ushort *)0x0;
              break;
            }
          }
        }
        if (puVar2 != (ushort *)0x0) {
          object_list_insert_head((char *)&DAT_00100674->hdr.link_word,puVar2);
        }
        restore_captured_grtile_backdrop((&DAT_000bc028)[local_28]);
        (&DAT_000bbf98)[local_28] = 0;
        *psVar5 = 0;
        draw_hotspot_crosshair_marker(1,(int)local_2c);
      }
    }
    iVar4 = (local_28 + 1) * 0x10000;
    local_28 = iVar4 >> 0x10;
    local_2c = (short)((uint)iVar4 >> 0x10);
    if (3 < local_28) {
      cursor_show_idle_tick();
      debug_noop_checkpoint();
      return;
    }
  } while( true );
}




// was FUN_0001cd3c -- babl builtin "do_judgement": sums each side's total offer value
// (sum_barter_offer_value, item values cached via compute_barter_item_value), computes the
// offered-vs-asked percentage difference...
void babl_builtin_do_judgement()

{
  char cVar1;
  short sVar2;
  short sVar3;
  char *pcVar4;
  char *uVar5;
  int iVar6;
  char *pcVar7;
  int iVar8;
  uint uVar9;
  char local_60 [80];
  
  uVar9 = (uint)*(byte *)(DAT_00086df8 + 0x33);
  sVar2 = ordint_divmod(0x1e,uVar9 * 0x2d).quot;
  sVar3 = sum_barter_offer_value(0,&DAT_000bbfd0,&DAT_000bbf98,&DAT_000bbfa8,0x32 - sVar2);
  sVar2 = sum_barter_offer_value(0,&DAT_000bbfe8,&DAT_000bbff0,&DAT_000bbfc0,0x32 - sVar2);
  iVar6 = (int)sVar2;
  if (iVar6 < 1) {
    sVar2 = 100;
  }
  else {
    sVar2 = ordint_divmod(iVar6,(sVar3 - iVar6) * 100).quot;
  }
  if (uVar9 < 6) {
    iVar6 = 0;
  }
  else if (uVar9 < 0xc) {
    iVar6 = 1;
  }
  else if (uVar9 < 0x12) {
    iVar6 = 2;
  }
  else {
    iVar6 = 3;
    if (0x17 < uVar9) {
      iVar6 = 4;
    }
  }
  if (sVar2 < 0x33) {
    if (sVar2 < 0x24) {
      if (sVar2 < 0x1a) {
        if (sVar2 < 0xb) {
          if (sVar2 < -9) {
            if (sVar2 < -0x18) {
              if (sVar2 < -0x22) {
                iVar8 = 7;
                if (sVar2 < -0x31) {
                  iVar8 = 8;
                }
              }
              else {
                iVar8 = 6;
              }
            }
            else {
              iVar8 = 5;
            }
          }
          else {
            iVar8 = 4;
          }
        }
        else {
          iVar8 = 3;
        }
      }
      else {
        iVar8 = 2;
      }
    }
    else {
      iVar8 = 1;
    }
  }
  else {
    iVar8 = 0;
  }
  pcVar4 = (char *)get_message_string(iVar6 + 3U | 0xe00);
  pcVar7 = local_60;
  do {
    cVar1 = *pcVar4;
    pcVar4 = pcVar4 + 1;
    *pcVar7 = cVar1;
    pcVar7 = pcVar7 + 1;
  } while (cVar1 != '\0');
  uVar5 = get_message_string(0xe02);
  ce_strcat(local_60,uVar5);
  uVar5 = get_message_string(iVar8 + 8U | 0xe00);
  ce_strcat(local_60,uVar5);
  echo_selected_conversation_choice(local_60);
  return;
}



// was FUN_0001cf20 -- sums the total value of one side's barter offer: for each of the 4 slots with
// a positive count (param_3) and item index (param_2), computes (and caches into param_4, a
// per-slot value array initialized to -1) that item's value via compute_barter_item_value...
int sum_barter_offer_value(int is_player_side, void *item_ids, void *counts, void *values, short mode)
{
  short sVar1;
  int iVar2;
  short *psVar3;
  int iVar4;
  int iVar5;
  
  iVar5 = 0;
  iVar4 = 0;
  do {
    if (0 < *(int *)(counts + iVar4 * 4)) {
      iVar2 = (int)*(short *)(iVar4 * 2 + item_ids);
      if (0 < iVar2) {
        psVar3 = (short *)(iVar4 * 2 + values);
        if (*psVar3 == -1) {
          sVar1 = compute_barter_item_value(is_player_side,iVar2,(int)mode);
          *psVar3 = sVar1;
        }
        iVar5 = ((int)*psVar3 + (int)(short)iVar5) * 0x10000 >> 0x10;
      }
    }
    iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
  } while (iVar4 < 4);
  return iVar5;
}



// was FUN_0001cfa8 -- computes one item's barter value: base value from its comobj.dat property row
// (doubled if magic, when param_1 gates that check), times quantity (or 1 for non-stackable items),
// scaled by its condition/durability (out of 0x3f)...
int compute_barter_item_value(short is_player_side, int item_id, int mode)
{
  int iVar1;
  short sVar2;
  ushort uVar3;
  ushort *puVar4;
  undefined4 uVar5;
  short sVar6;
  uint uVar7;
  int iVar8;
  
  puVar4 = (ushort *)get_object_record_by_slot_index(item_id);
  if (is_player_side == 0) {
    uVar7 = (uint)((uw_object_hdr_t *)puVar4)->type_flags;
    sVar6 = (short)g_object_type_props[(uVar7 & 0x1ff)].monetary_value;
  }
  else {
    sVar2 = check_npc_item_preference(item_id);
    if (sVar2 == -1) {
      return 0;
    }
    uVar7 = (uint)((uw_object_hdr_t *)puVar4)->type_flags;
    sVar6 = (short)g_object_type_props[(uVar7 & 0x1ff)].monetary_value;
    if (sVar2 != 0) {
      sVar6 = (short)(sVar6 * 3 >> 1);
    }
  }
  if (((uVar7 & 0x8000) == 0) || ((((uw_object_hdr_t *)puVar4)->link & 0x200) != 0)) {
    uVar3 = 1;
  }
  else {
    uVar3 = ((uw_object_hdr_t *)puVar4)->link;
  }
  iVar8 = (int)(short)uVar3 * (int)sVar6 * 0x10000 >> 0x10;
  if (0 < iVar8) {
    iVar1 = (int)(short)(((uw_object_hdr_t *)puVar4)->quality);
    if (iVar1 == 0) {
      iVar8 = 0;
    }
    else {
      iVar8 = (int)(short)(iVar1 * iVar8 >> 6);
      if (iVar8 == 0) {
        iVar8 = 1;
      }
    }
  }
  ce_srand((int)(short)item_id);
  uVar5 = randomize_value_pct(iVar8,(short)mode * -0x10000 >> 0x10,mode);
  compute_dimension_volume();
  return uVar5;
}



// was FUN_0001d170 -- randomizes param_1 by a random percentage in
// [param_2, param_3), used throughout the barter UI for haggle-value
// jitter.
int randomize_value_pct(short value, short min_pct, short max_pct)
{
  int iVar1;
  
  iVar1 = rand_below((int)max_pct - (int)min_pct);
  iVar1 = ordint_divmod(100,(iVar1 + min_pct) * (int)value).quot;
  return (iVar1 + value) * 0x10000 >> 0x10;
}




// was FUN_0001d1c0 -- collects the player's barter slots marked "included in trade" (DAT_000bbf98)
// into two parallel out-arrays (param_2 = slot indices, param_1 = item ids) and returns how many
// were found.
int collect_included_player_barter_items(void *out_item_ids, void *out_values)
{
  ushort *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 0;
  iVar2 = 0;
  do {
    if ((&DAT_000bbf98)[iVar2] != 0) {
      puVar1 = (ushort *)get_object_record_by_slot_index((int)(short)(&DAT_000bbfd0)[iVar2]);
      iVar3 = (int)(short)iVar3;
      *(undefined2 *)(out_values + iVar3 * 2) = (&DAT_000bbfd0)[iVar2];
      *(ushort *)(out_item_ids + iVar3 * 2) = ((uw_object_hdr_t *)puVar1)->object_id;
      iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 4);
  return iVar3;
}



// was FUN_0001d258 -- gives an item to the current conversation partner's (DAT_00100674) inventory:
// if it's item-id 0xa1 (gold) and both it and an existing stack in the NPC's inventory are
// stackable (weightless bit set) with matching item-id and combined quantity under 999...
void add_item_to_npc_inventory(ushort *object)
{
  ushort *puVar1;
  int iVar2;
  
  if ((*object & 0x1ff) == 0xa1) {
    puVar1 = (ushort *)((char *)&DAT_00100674->hdr.link_word);
    while (puVar1 = (ushort *)resolve_object_link(puVar1), puVar1 != (ushort *)0x0) {
      if (((((*object & 0x8000) != 0) && ((*puVar1 & 0x8000) != 0)) && ((object[3] & 0x8000) == 0)
          ) && ((((puVar1[3] & 0x8000) == 0 && (((*puVar1 ^ *object) & 0x1ff) == 0)) &&
                ((ushort)((puVar1[3] >> 6) + (object[3] >> 6)) < 999)))) {
        iVar2 = (puVar1[3] & 0xffc0) + (object[3] & 0xffc0);
        *(byte *)(puVar1 + 3) = (byte)iVar2 ^ (byte)puVar1[3] & 0x3f;
        *(char *)((char *)puVar1 + 7) = (char)((uint)iVar2 >> 8);
        free_object_slot(object);
        object = (ushort *)0x0;
        break;
      }
      puVar1 = puVar1 + 2;
    }
  }
  if (object != (ushort *)0x0) {
    object_list_insert_head((char *)&DAT_00100674->hdr.link_word,object);
  }
}




// was FUN_0001d3ac -- resolves param_1 (an item-value, per this function's own comparison below and
// its caller babl_builtin_give_ptr_npc) to an object and gives it to the NPC via
// add_item_to_npc_inventory...
void give_barter_item_by_item_id(short item_id)
{
  int iVar1;
  void *pvItem;

  pvItem = get_object_record_by_slot_index(item_id);
  add_item_to_npc_inventory(pvItem);
  decrement_cursor_hide_depth();
  iVar1 = 0;
  do {
    if ((&DAT_000bbfd0)[iVar1] == item_id) {
      restore_captured_grtile_backdrop((&DAT_000bc028)[iVar1]);
      (&DAT_000bbfd0)[iVar1] = 0;
      (&DAT_000bbf98)[iVar1] = 0;
      draw_hotspot_crosshair_marker(1,iVar1);
    }
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 4);
  cursor_show_idle_tick();
  debug_noop_checkpoint();
}



// was FUN_0001da00 -- searches the current conversation partner's (DAT_00100674) inventory list for
// an item matching item-id param_1; if found, unlinks and frees it and returns 1, else returns 0.
// Used by babl_builtin_do_inv_delete.
int remove_item_from_npc_inventory_by_id(short item_id)
{
  ushort *puVar1;
  void *iVar2;
  
  iVar2 = (char *)&DAT_00100674->hdr.link_word;
  puVar1 = (ushort *)resolve_object_link(iVar2);
  if (puVar1 != (ushort *)0x0) {
    do {
      if ((((uw_object_hdr_t *)puVar1)->object_id) == (int)item_id) {
        object_list_unlink((void *)(intptr_t)(iVar2),puVar1);
        free_object_slot(puVar1);
        return 1;
      }
      puVar1 = (ushort *)resolve_object_link(puVar1 + 2);
    } while (puVar1 != (ushort *)0x0);
  }
  return 0;
}




// was FUN_0001dab8 -- checks an item's slot-value against the NPC's "wanted" (DAT_000bc020) and
// "refused" (DAT_000bc000) item-id/item- class preference lists: returns 1 if specifically wanted
// (or an item-id hit in the wanted list)...
int check_npc_item_preference(short item_id)
{
  ushort uVar1;
  ushort *puVar2;
  undefined4 uVar3;
  uint uVar4;
  int iVar5;
  int iVar6;

  puVar2 = (ushort *)get_object_record_by_slot_index(item_id);
  if ((short)g_object_type_props[(((uw_object_hdr_t *)puVar2)->object_id)].monetary_value == 0) {
LAB_0001dbcc:
    uVar3 = 0xffffffff;
  }
  else {
    uVar1 = ((uw_object_hdr_t *)puVar2)->object_id;
    iVar5 = ((int)(short)uVar1 >> 4) + 1000;
    uVar3 = 0;
    if ((DAT_000bc020 != (short *)0x0) && (uVar4 = (uint)*DAT_000bc020, -1 < (int)uVar4)) {
      iVar6 = 0;
      do {
        if ((int)uVar4 < 1000) {
          if ((int)(short)uVar1 == uVar4) {
            return 1;
          }
        }
        else if (iVar5 * 0x10000 >> 0x10 == uVar4) {
          uVar3 = 1;
        }
        iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        uVar4 = (uint)DAT_000bc020[iVar6];
      } while (uVar4 < 0x80000000);
    }
    if ((DAT_000bc000 != (short *)0x0) && (uVar4 = (uint)*DAT_000bc000, -1 < (int)uVar4)) {
      iVar6 = 0;
      do {
        if ((int)uVar4 < 1000) {
          if ((int)(short)uVar1 == uVar4) goto LAB_0001dbcc;
        }
        else if (iVar5 * 0x10000 >> 0x10 == uVar4) {
          uVar3 = 0xffffffff;
        }
        iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
        uVar4 = (uint)DAT_000bc000[iVar6];
      } while (uVar4 < 0x80000000);
    }
  }
  return uVar3;
}



// was FUN_0007ec50 -- always returns 0 and does nothing else; called from ~24 scattered locations
// across the babl dialogue-VM code (src/babl.c) and some object-combination logic (uw.c), none of
// which ever use its return value.
int debug_noop_checkpoint()

{
  return 0;
}





// was FUN_0001a1a4 -- the babl VM's own "load bytecode into the run buffer" step: an `ce_memmove`
// (memcpy-shaped) copy of the parsed script's bytecode (DAT_000bbf18, word count DAT_000bbf10) into
// the VM's live opcode buffer (DAT_000bbf80)...
void babl_vm_load_script(int script_id)
{
  ce_memmove(DAT_000bbf80,DAT_000bbf18,(uint)(ushort)DAT_000bbf10 << 1);
}



// was FUN_0001a5e0 -- babl VM opcode 1 (ADD): pops the top two stack
// slots, pushes their sum.
void babl_op_add()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(short *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = *psVar2 + psVar2[-1];
  return;
}



// was FUN_0001a628 -- babl VM opcode 0x29 (NEGATE): negates the
// top-of-stack value in place.
void babl_op_negate()

{
  short *psVar1;
  
  psVar1 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  *psVar1 = -*psVar1;
  return;
}



// was FUN_0001a654 -- babl VM opcode 2 (MULTIPLY): pops the top two stack
// slots, pushes their product.
void babl_op_mul()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(short *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = psVar2[-1] * *psVar2;
  return;
}



// was FUN_0001a69c -- babl VM opcode 3 (SUBTRACT): pops the top two stack
// slots (a=second-from-top, b=top), pushes a-b.
void babl_op_sub()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(short *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = psVar2[-1] - *psVar2;
  return;
}



// was FUN_0001a6e4 -- babl VM opcode 4 (DIVIDE): pops the top two stack slots
// (a=dividend=second-from-top, b=divisor=top), pushes a/b via ordint_divmod (ARM soft-division,
// quotient in the primary return)...
void babl_op_div()

{
  intptr_t iVar1; /* ARM stack address: preserve the host pointer width. */
  undefined2 uVar2;
  short *psVar3;
  int iVar4;
  int iVar5;
  
  iVar1 = DAT_000bbf0c;
  iVar5 = (int)DAT_000bbf78;
  psVar3 = (short *)(DAT_000bbf0c + iVar5 * 2);
  iVar4 = (int)*psVar3;
  if (iVar4 == 0) {
    uVar2 = 0xffff;
  }
  else {
    uVar2 = ordint_divmod(iVar4,(int)psVar3[-1]).quot;
  }
  iVar4 = (iVar5 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar4 >> 0x10);
  *(undefined2 *)(iVar1 + (iVar4 >> 0x10) * 2) = uVar2;
  return;
}



// was FUN_0001a74c -- babl VM opcode 5 (MODULO): identical setup to babl_op_div's own DIVIDE, but
// wants the remainder (the ARM soft-division routine's r1) instead of ordint_divmod's own quotient
// return -- same divide-by-zero 0xffff sentinel as DIVIDE.
void babl_op_mod()

{
  intptr_t iVar1; /* ARM stack address: preserve the host pointer width. */
  undefined2 uVar2;
  short *psVar3;
  int iVar4;
  int iVar5;

  iVar1 = DAT_000bbf0c;
  iVar5 = (int)DAT_000bbf78;
  psVar3 = (short *)(DAT_000bbf0c + iVar5 * 2);
  iVar4 = (int)*psVar3;
  if (iVar4 == 0) {
    uVar2 = 0xffff;
  }
  else {
    /* Dropped-remainder bug (same class as this session's other ordint_divmod/extraout_r1 fixes),
       but live here: this is the babl VM's own MODULO bytecode opcode, so every in-game script/
       conversation use of "%" silently got uninitialized garbage instead of a real result. */
    uVar2 = ordint_divmod(iVar4,(int)psVar3[-1]).rem;
  }
  iVar4 = (iVar5 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar4 >> 0x10);
  *(undefined2 *)(iVar1 + (iVar4 >> 0x10) * 2) = uVar2;
  return;
}



// was FUN_0001a7b4 -- babl VM opcode 6 (logical OR): pops the top two
// stack slots, pushes 1 if either is nonzero, else 0.
void babl_op_or()

{
  int iVar1;
  undefined2 uVar2;
  short *psVar3;
  
  psVar3 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  if ((psVar3[-1] != 0) || (uVar2 = 0, *psVar3 != 0)) {
    uVar2 = 1;
  }
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(undefined2 *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = uVar2;
  return;
}



// was FUN_0001a808 -- babl VM opcode 7 (logical AND): pops the top two
// stack slots, pushes 1 if both are nonzero, else 0.
void babl_op_and()

{
  int iVar1;
  undefined2 uVar2;
  short *psVar3;
  
  psVar3 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  if ((psVar3[-1] == 0) || (uVar2 = 1, *psVar3 == 0)) {
    uVar2 = 0;
  }
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(undefined2 *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = uVar2;
  return;
}



// was FUN_0001a85c -- babl VM opcode 9 (GREATER_THAN): pops a
// (second-from-top) and b (top), pushes 1 if a>b else 0.
void babl_op_gt()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(ushort *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = (ushort)(*psVar2 < psVar2[-1]);
  return;
}



// was FUN_0001a8a4 -- babl VM opcode 10 (GREATER_EQUAL): pops a
// (second-from-top) and b (top), pushes 1 if a>=b else 0.
void babl_op_ge()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(ushort *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = (ushort)(*psVar2 <= psVar2[-1]);
  return;
}



// was FUN_0001a8ec -- babl VM opcode 0xb (LESS_THAN): pops a
// (second-from-top) and b (top), pushes 1 if a<b else 0.
void babl_op_lt()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(ushort *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = (ushort)(psVar2[-1] < *psVar2);
  return;
}



// was FUN_0001a934 -- babl VM opcode 0xc (LESS_EQUAL): pops a
// (second-from-top) and b (top), pushes 1 if a<=b else 0.
void babl_op_le()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(ushort *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = (ushort)(psVar2[-1] <= *psVar2);
  return;
}



// was FUN_0001a97c -- babl VM opcode 0xd (EQUAL): pops the top two stack
// slots, pushes 1 if equal else 0.
void babl_op_eq()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(ushort *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = (ushort)(psVar2[-1] == *psVar2);
  return;
}



// was FUN_0001a9c4 -- babl VM opcode 0xe (NOT_EQUAL): pops the top two
// stack slots, pushes 1 if unequal else 0.
void babl_op_ne()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(ushort *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = (ushort)(psVar2[-1] != *psVar2);
  return;
}



// was FUN_0001aa0c -- babl VM opcode 0x13 (CALL): pushes the return
// address (ip+2, past this opcode's own operand word) onto the stack, then
// jumps to the absolute target address read from the bytecode operand.
void babl_op_call()

{
  DAT_000bbf78 = DAT_000bbf78 + 1;
  *(short *)(DAT_000bbf0c + DAT_000bbf78 * 2) = DAT_000bbf74 + 2;
  DAT_000bbf74 = *(undefined2 *)(DAT_000bbf80 + DAT_000bbf74 * 2 + 2);
  return;
}



// was FUN_0001aa54 -- babl VM opcode 0x15 (RETURN): if the call stack is non-empty, pops a return
// address into ip and returns true (continue running); if empty (top-level script with no open call
// frame), returns false, which the dispatch loop treats as "end of script" and stops.
bool babl_op_return()

{
  int iVar1;
  
  iVar1 = (int)DAT_000bbf78;
  if (0 < iVar1) {
    DAT_000bbf74 = *(undefined2 *)(DAT_000bbf0c + iVar1 * 2);
    DAT_000bbf78 = DAT_000bbf78 + -1;
  }
  return 0 < iVar1;
}



// was FUN_0001aa88 -- babl VM opcode 0x1f (PUSH_VAR): raw "push variable
// value" opcode, see its own comment below.
void babl_op_push_var_raw()

{
  short *psVar1;

  psVar1 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  /* Raw "push variable value" VM opcode: indexes DAT_000bbf14 directly by the symbol's compiled-in
     slot number, bypassing babl_get_variable's name-based lookup entirely -- this is the actual
     path a script's own `if npc_talkedto ...` check would read through... */
  *psVar1 = *(short *)(DAT_000bbf14 + *psVar1 * 2);
  return;
}



// was FUN_0001aab4 -- babl VM opcode 0x21: pops the top two stack slots (a=second-from-top, b=top),
// pushes a+b-1.
void babl_op_combine_index()

{
  int iVar1;
  short *psVar2;
  
  psVar2 = (short *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  iVar1 = (DAT_000bbf78 + -1) * 0x10000;
  DAT_000bbf78 = (short)((uint)iVar1 >> 0x10);
  *(short *)(DAT_000bbf0c + (iVar1 >> 0x10) * 2) = psVar2[-1] + *psVar2 + -1;
  return;
}



// was FUN_0001aaf8 -- babl VM opcode 0x20 (SET_VAR): pops a value (top) and a slot index
// (second-from-top), stores the value into DAT_000bbf14 at that slot (the same raw variable-slot
// array babl_op_push_var_raw reads).
void babl_op_set_var()

{
  undefined2 *puVar1;
  
  puVar1 = (undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  *(undefined2 *)(DAT_000bbf14 + (short)puVar1[-1] * 2) = *puVar1;
  DAT_000bbf78 = DAT_000bbf78 + -2;
  return;
}



// was FUN_0001ab30 -- babl VM opcode 0x14 (CALL_BUILTIN): reads a builtin index from the bytecode
// operand, invokes the matching native function pointer out of the DAT_000bbf00 table (registered
// by babl_register_builtin/babl_op_say/babl_op_respond) passing the current stack top as its...
void babl_op_call_builtin()

{
  undefined2 uVar1;
  
  DAT_000bbf08 = *(short *)(DAT_000bbf80 + DAT_000bbf74 * 2 + 2);
  uVar1 = (**(babl_builtin_fn *)(DAT_000bbf00 + DAT_000bbf08 * 8))((void *)(DAT_000bbf0c + DAT_000bbf78 * 2)); // was `* 4` -- DAT_000bbf00's own comment (uw.c ~11468)
  *(undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2) = uVar1;
  DAT_000bbf1c = *(undefined2 *)(DAT_000bbf0c + DAT_000bbf78 * 2);
  DAT_000bbf74 = DAT_000bbf74 + 2;
  return;
}



// was FUN_0001aba0 -- babl VM opcode 0x25 (STRING_EQUAL): pops two message-id operands, resolves
// each through get_message_string + babl_expand_string_refs, compares the expanded text with
// ce_strcmp (strcmp-shaped), and pushes 1 if equal else 0.
void babl_op_string_eq()

{
  short sVar1;
  /* iVar2-iVar5 were `int` but hold real string pointers from
     get_message_string/babl_expand_string_refs -- truncated a real 64-bit pointer on assignment
     even with each call's own dropped argument now fixed... */
  intptr_t iVar2;
  intptr_t iVar3;
  intptr_t iVar4;
  intptr_t iVar5;

  /* Was 2 dropped register-forwarding args -- same class as babl_builtin_compare's own comment
     (uw.c ~10977), now confirmed reachable live (bug-critter-talk.txt) since this whole babl-VM
     cluster started actually running this session. */
  iVar2 = (intptr_t)get_message_string((int)*(short *)(DAT_000bbf0c + DAT_000bbf78 * 2));
  iVar3 = (intptr_t)babl_expand_string_refs((char *)iVar2);
  iVar4 = (intptr_t)get_message_string((int)*(short *)(DAT_000bbf0c + DAT_000bbf78 * 2 + -2));
  iVar5 = (intptr_t)babl_expand_string_refs((char *)iVar4);
  sVar1 = ce_strcmp((char*)iVar5,(char*)iVar3);
  if (iVar5 != iVar4) {
    babl_free((void *)(intptr_t)(iVar5));
  }
  if (iVar3 != iVar2) {
    babl_free((void *)(intptr_t)(iVar3));
  }
  iVar2 = (int)DAT_000bbf78;
  DAT_000bbf78 = (short)(iVar2 + -1);
  *(ushort *)(DAT_000bbf0c + ((iVar2 + -1) * 0x10000 >> 0x10) * 2) = (ushort)(sVar1 == 0);
  return;
}



// was FUN_0001ac48 -- babl VM opcode 0x27 (SAY): resolves and expands the top-of-stack message-id
// operand into text, then looks that text up against the "say" symbol in the babl symbol table...
void babl_op_say()

{
  /* iVar1/iVar2 were `int` but hold a real string pointer from
     get_message_string/babl_expand_string_refs -- truncated even with the dropped argument below
     now fixed (uw.c ~70085's comment). Widened to intptr_t. */
  intptr_t iVar1;
  intptr_t iVar2;
  int iVar3;
  intptr_t iVar4; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t) right back down, same as init_babl_variable_defaults's own fix

  /* Was a dropped register-forwarding arg -- same class as babl_builtin_compare's own comment (uw.c
     ~10977); this is the crash in bug-critter-talk.txt one step past the DAT_000bbf70-width fix
     below... */
  iVar1 = (intptr_t)get_message_string((int)*(short *)(DAT_000bbf0c + DAT_000bbf78 * 2));
  iVar2 = (intptr_t)babl_expand_string_refs((char *)iVar1);
  DAT_000bbf78 = DAT_000bbf78 + -1;
  iVar4 = DAT_000bbf70;
  do {
    /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own
       comment (uw.c ~12260) -- every reader of this babl-symbol table
       shares the same crash when no conversation record was loaded. */
    if (iVar4 == 0 || *(short *)(iVar4 + 0x18) == 0) {
LAB_0001ace8:
      if (iVar2 != iVar1) {
        babl_free((void *)(intptr_t)(iVar2));
      }
      return;
    }
    iVar3 = ce_strcmp(DAT_000845a8,(const char *)(intptr_t)(iVar4));
    if (iVar3 == 0) {
      (**(babl_builtin_fn *)(DAT_000bbf00 + *(short *)(iVar4 + 0x1a) * 8))((void *)iVar2); // was `* 4` -- DAT_000bbf00's own comment (uw.c ~11468)
      goto LAB_0001ace8;
    }
    iVar4 = iVar4 + 0x20;
  } while( true );
}



// was FUN_0001acf8 -- babl VM opcode 0x28 (RESPOND): identical to babl_op_say, but hardcoded to the
// "respond" symbol (s_respond_000845ac) instead of "say" -- the babl script "respond" keyword.
void babl_op_respond()

{
  /* iVar1/iVar2 were `int` -- same pointer-truncation fix as
     babl_op_say's own comment just above. */
  intptr_t iVar1;
  intptr_t iVar2;
  int iVar3;
  intptr_t iVar4; // was `int` -- re-truncated DAT_000bbf70 (now intptr_t) right back down, same as init_babl_variable_defaults's own fix

  /* Was a dropped register-forwarding arg -- same class as
     babl_op_say's own fix just above. */
  iVar1 = (intptr_t)get_message_string((int)*(short *)(DAT_000bbf0c + DAT_000bbf78 * 2));
  iVar2 = (intptr_t)babl_expand_string_refs((char *)iVar1);
  DAT_000bbf78 = DAT_000bbf78 + -1;
  iVar4 = DAT_000bbf70;
  do {
    /* Same DAT_000bbf70-uninitialized guard as babl_register_builtin's own
       comment (uw.c ~12260). */
    if (iVar4 == 0 || *(short *)(iVar4 + 0x18) == 0) {
LAB_0001ad98:
      if (iVar2 != iVar1) {
        babl_free((void *)(intptr_t)(iVar2));
      }
      return;
    }
    iVar3 = ce_strcmp(s_respond_000845ac,(const char *)(intptr_t)(iVar4));
    if (iVar3 == 0) {
      (**(babl_builtin_fn *)(DAT_000bbf00 + *(short *)(iVar4 + 0x1a) * 8))((void *)iVar2); // was `* 4` -- DAT_000bbf00's own comment (uw.c ~11468)
      goto LAB_0001ad98;
    }
    iVar4 = iVar4 + 0x20;
  } while( true );
}


// was FUN_00028bac -- the game-mode dispatch table's mode-exit handler for mode 2
// (Talk/conversation, see the table entry at uw.c ~2595): frees a conditionally-held resource, ends
// barter UI if one was open, restores the HUD panel, resumes ambient music selection...
void exit_talk_mode()

{
  if (DAT_00100784 != 0) {
    LocalFree(DAT_00100784);
    DAT_00100784 = 0;
  }
  if (DAT_001006d0 != 0) {
    end_barter_ui();
    DAT_001006d0 = 0;
  }
  pick_random_pending_music_track();
  g_active_hud_panel = DAT_00100678;
  select_msg_scroll_mode_normal();
  return;
}



// was FUN_00028ffc -- the babl conversation menu's idle-tick wait loop: re-runs the same
// numbered-choice-list redraw babl_menu itself builds (same "4 contiguous stack locals" layout, per
// its own comment) every idle tick while waiting for the player to click a response...
void run_babl_menu_wait_loop()

{
  char cVar1;
  char *pcVar3;
  char *pcVar5;
  int iVar4;
  /* Same "4 separate stack locals relied on being one contiguous buffer" fix as babl_menu's own
     comment (uw.c ~19505) -- this is the SAME menu redraw, just re-run every idle tick while
     waiting for the player's click, so it has the identical bug. */
  char local_bc [160];

  while (DAT_0010078c != 0) {
    flush_dirty_rect_to_display(1);
    advance_menu_music_track();
    if (DAT_00201c84 != 0) {
      dispatch_sticky_mode_handlers();
    }
    if (DAT_00250718 == 0) {
      wait_for_click_to_continue(500,0);
      select_msg_scroll_mode_2();
      msg_scroll_panel_reset(1);
      if (1 < DAT_00100794) {
        iVar4 = 1;
        do {
          pcVar3 = *(char **)(&DAT_00100680 + iVar4 * 8);
          local_bc[0] = (undefined1)((uint)((iVar4 + 0x30) * 0x1000000) >> 0x18);
          local_bc[1] = 0x2e;
          local_bc[2] = 0x20;
          pcVar5 = local_bc + 3;
          do {
            cVar1 = *pcVar3;
            pcVar3 = pcVar3 + 1;
            *pcVar5 = cVar1;
            pcVar5 = pcVar5 + 1;
          } while (cVar1 != '\0');
          ce_strcat(local_bc,&s_scroll_newline_0008522c);
          message_scroll_print_wrapped(local_bc);
          iVar4 = (iVar4 + 1) * 0x10000 >> 0x10;
        } while (iVar4 < DAT_00100794);
      }
      select_msg_scroll_mode_normal();
      DAT_00250718 = 1;
    }
    poll_input_bindings(DAT_00085a6c);
  }
  return;
}


// was FUN_00029358 -- babl_fmenu: the "filtered menu" babl script builtin, structurally identical
// to babl_menu (registered under s_babl_fmenu_00085214) but reading two parallel variable-slot
// indices via babl_read_var_word and only showing a choice when its second ("filter") value is...
int babl_fmenu(char *args)
{
  char cVar1;
  short sVar2;
  short sVar3;
  short sVar4;
  short sVar5;
  undefined4 uVar6;
  /* Same width/stride fix as babl_menu's own comment just above --
     uVar7/iVar8/iVar9 hold real string pointers, and
     DAT_001006d8/DAT_00100680 need a `* 8` stride to match. */
  intptr_t uVar7;
  intptr_t iVar8;
  intptr_t iVar9;
  char *pcVar10;
  char *pcVar11;
  int iVar12;
  short sVar13;
  /* Same "4 separate stack locals relied on being one contiguous
     buffer" fix as babl_menu's own comment -- confirmed the identical
     bug here too. Merged into one real buffer. */
  char local_c4 [160];

  sVar13 = 0;
  DAT_00100790 = 1;
  DAT_00100794 = 1;
  sVar2 = *(short *)(args + -2);
  sVar3 = *(short *)(args + -4);
  uVar6 = babl_read_var_word((int)sVar2);
  sVar4 = babl_read_var_word((int)sVar3);
  iVar12 = 1;
  sVar5 = (short)uVar6;
  while (sVar5 != 0) {
    if (sVar4 != 0) {
      uVar7 = (intptr_t)get_message_string(uVar6);
      *(intptr_t *)(&DAT_001006d8 + DAT_00100794 * 8) = uVar7;
      iVar8 = (intptr_t)babl_expand_string_refs((char *)uVar7); // was a dropped register-forwarding arg -- same class as babl_builtin_compare's own comment (uw.c ~10977)
      sVar5 = DAT_00100794;
      iVar9 = (int)DAT_00100794;
      *(intptr_t *)(&DAT_00100680 + iVar9 * 8) = iVar8;
      if (iVar8 == *(intptr_t *)(&DAT_001006d8 + iVar9 * 8)) {
        iVar9 = ce_strlen((const char *)(intptr_t)(*(intptr_t *)(&DAT_001006d8 + iVar9 * 8)));
        pcVar10 = (char *)babl_alloc(iVar9 + 1);
        iVar9 = (int)DAT_00100794;
        *(char **)(&DAT_00100680 + iVar9 * 8) = pcVar10;
        pcVar11 = *(char **)(&DAT_001006d8 + iVar9 * 8);
        do {
          cVar1 = *pcVar11;
          pcVar11 = pcVar11 + 1;
          *pcVar10 = cVar1;
          pcVar10 = pcVar10 + 1;
          sVar5 = DAT_00100794;
        } while (cVar1 != '\0');
      }
      DAT_00100794 = sVar5 + 1;
      *(short *)(&DAT_001007a0 + sVar5 * 2) = (short)uVar6;
    }
    iVar12 = iVar12 + 1;
    uVar6 = babl_read_var_word(iVar12 + sVar2 + -1);
    sVar4 = babl_read_var_word(iVar12 + sVar3 + -1);
    sVar5 = (short)uVar6;
  }
  select_msg_scroll_mode_2();
  msg_scroll_panel_reset(1);
  debug_noop_checkpoint();
  iVar12 = 0;
  do {
    (&DAT_00100770)[iVar12] = 0xffff;
    iVar12 = ((int)iVar12 + 1) * 0x10000 >> 0x10;
  } while (iVar12 < 10);
  iVar12 = 1;
  if (1 < DAT_00100794) {
    do {
      pcVar10 = *(char **)(&DAT_00100680 + iVar12 * 8);
      local_c4[0] = (char)iVar12 + '0';
      local_c4[1] = 0x2e;
      local_c4[2] = 0x20;
      pcVar11 = local_c4 + 3;
      do {
        cVar1 = *pcVar10;
        pcVar10 = pcVar10 + 1;
        *pcVar11 = cVar1;
        pcVar11 = pcVar11 + 1;
      } while (cVar1 != '\0');
      ce_strcat(local_c4,&s_scroll_newline_0008522c);
      sVar5 = message_scroll_print_wrapped(local_c4);
      debug_noop_checkpoint();
      for (iVar9 = (int)sVar13; iVar9 <= sVar5; iVar9 = (iVar9 + 1) * 0x10000 >> 0x10) {
        (&DAT_00100770)[iVar9] = (short)iVar12;
      }
      iVar12 = (iVar12 + 1) * 0x10000 >> 0x10;
      sVar13 = sVar5 + 1;
    } while (iVar12 < DAT_00100794);
  }
  select_msg_scroll_mode_normal();
  DAT_0010078c = 1;
  DAT_00250718 = 1;
  run_babl_menu_wait_loop();
  return (int)*(short *)(&DAT_001007a0 + DAT_00100788 * 2);
}


// was FUN_000295b4 -- selects a babl_menu/babl_fmenu response: registered as the click/key handler
// for the numbered response hotkeys and the response-list click region (src/game.c). param_1==0
// means "resolve from a click position" via DAT_00100770...
void select_babl_menu_response(short response)
{
  int iVar1;
  short sVar2;
  /* Was `int` -- same DAT_00100680/DAT_001006d8 `* 8` stride / pointer- width fix as babl_menu's
     own comment. */
  intptr_t iVar3;

  if (DAT_00100790 != 0) {
    if (response == 0) {
      sVar2 = ordint_divmod((int)*(short *)(DAT_000879b0 + 6),
                           0xa9 - ((200 - *(short *)(DAT_00085a6c + 2)) * 0x10000 >> 0x10)).quot;
      response = (&DAT_00100770)[sVar2];
    }
    iVar1 = (int)response;
    if ((0 < iVar1) && (iVar1 < DAT_00100794)) {
      DAT_00100790 = 0;
      DAT_0010078c = 0;
      wait_for_click_release(0);
      select_msg_scroll_mode_2();
      msg_scroll_panel_reset(1);
      select_msg_scroll_mode_normal();
      DAT_00250718 = 0;
      select_msg_scroll_mode_conversation();
      if (1 < DAT_00100794) {
        iVar3 = 1;
        do {
          if (iVar3 == iVar1) {
            echo_selected_conversation_choice(*(char **)(&DAT_00100680 + iVar3 * 8));
          }
          if (*(intptr_t *)(&DAT_001006d8 + iVar3 * 8) != *(intptr_t *)(&DAT_00100680 + iVar3 * 8)) {
            babl_free((void *)(intptr_t)(*(intptr_t *)(&DAT_00100680 + iVar3 * 8)));
          }
          iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
        } while (iVar3 < DAT_00100794);
      }
      select_msg_scroll_mode_normal();
      DAT_00100788 = response;
    }
  }
}



// was FUN_00029708 -- babl_builtin_say: the "say" babl script builtin (registered via
// babl_register_builtin(DAT_000845a8="say", ...)), prints the NPC's spoken line to the conversation
// scroll in its dark-brown speech color.
void babl_builtin_say(char *say_text)
{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  
  pcVar2 = &DAT_00085230;
  pcVar3 = DAT_001007c0;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
    *pcVar3 = cVar1;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  ce_strcat(DAT_001007c0,say_text);
  ce_strcat(DAT_001007c0,&s_scroll_newline_0008522c);
  select_msg_scroll_mode_conversation();
  /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested, confirmed via an exhaustive real-binary
     reference search that this PocketPC port's conversation text never used the palette-indexed
     color path at all)... */
  {
    int _saved_use_pal = g_text_use_palette_color;
    byte _saved_color = *(byte *)(DAT_00250704 + 0x16);
    g_text_use_palette_color = 1;
    *(byte *)(DAT_00250704 + 0x16) = 0x2e;
    message_scroll_print_wrapped(DAT_001007c0);
    *(byte *)(DAT_00250704 + 0x16) = _saved_color;
    g_text_use_palette_color = _saved_use_pal;
  }
  debug_noop_checkpoint();
  select_msg_scroll_mode_normal();
  DAT_001007b4 = 0;
}



// was FUN_0002977c -- babl_builtin_respond: the "respond" babl script builtin (registered via
// babl_register_builtin(s_respond_000845ac, ...)), prints text to the conversation scroll in the
// default (non speech-colored) mode.
void babl_builtin_respond(char *text)
{
  char cVar1;
  char *pcVar2;
  
  pcVar2 = DAT_001007c0;
  do {
    cVar1 = *text;
    text = text + 1;
    *pcVar2 = cVar1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(DAT_001007c0,&s_scroll_newline_0008522c);
  select_msg_scroll_mode_2();
  message_scroll_print_wrapped(DAT_001007c0);
  debug_noop_checkpoint();
  select_msg_scroll_mode_normal();
  DAT_001007b4 = 1;
}



// was FUN_000297dc -- echoes the player's selected conversation-menu choice text to the scroll,
// highlighted in white (rather than the NPC's dark-brown speech color babl_builtin_say uses).
// Called from select_babl_menu_response on a valid selection.
void echo_selected_conversation_choice(char *text)
{
  char cVar1;
  char *pcVar2;
  char *pcVar3;

  *DAT_001007c0 = '\0';
  ce_strcat(DAT_001007c0,text);
  ce_strcat(DAT_001007c0,&DAT_00085234);
  select_msg_scroll_mode_conversation();
  /* DEVIATION FROM AUTHENTIC BEHAVIOR (user requested) -- see babl_builtin_say's own comment on
     this same pattern. */
  {
    int _saved_use_pal = g_text_use_palette_color;
    byte _saved_color = *(byte *)(DAT_00250704 + 0x16);
    g_text_use_palette_color = 1;
    *(byte *)(DAT_00250704 + 0x16) = 0x60;
    message_scroll_print_wrapped(DAT_001007c0);
    *(byte *)(DAT_00250704 + 0x16) = _saved_color;
    g_text_use_palette_color = _saved_use_pal;
  }
  debug_noop_checkpoint();
  select_msg_scroll_mode_normal();
  DAT_001007b4 = 1;
}



// was FUN_00029850 -- babl_builtin_print: the "print" babl script builtin (registered via
// babl_register_builtin(s_print_000851e4, ...)), resolves a message-id operand read from the
// bytecode (babl_read_var_word) into text and prints it to the conversation scroll.
void babl_builtin_print(char *arg_stack)
{
  char cVar1;
  /* Was `int` -- reassigned to a real string pointer (get_message_string/ babl_expand_string_refs)
     right after the small babl_read_var_word use, same bug class as DAT_001007c0's own fix above... */
  intptr_t iVar2;
  intptr_t iVar3;
  char *pcVar4;
  char *pcVar5;

  /* Was 3 dropped register-forwarding args -- same class as
     babl_builtin_compare's own comment (uw.c ~10977). */
  iVar2 = babl_read_var_word((int)*(short *)(arg_stack + -2));
  iVar2 = (intptr_t)get_message_string((int)iVar2);
  iVar3 = (intptr_t)babl_expand_string_refs((char *)iVar2);
  pcVar4 = &DAT_0008523c;
  pcVar5 = DAT_001007c0;
  do {
    cVar1 = *pcVar4;
    pcVar4 = pcVar4 + 1;
    *pcVar5 = cVar1;
    pcVar5 = pcVar5 + 1;
  } while (cVar1 != '\0');
  ce_strcat(DAT_001007c0,(char *)(intptr_t)(iVar3));
  ce_strcat(DAT_001007c0,&DAT_00085234);
  select_msg_scroll_mode_conversation();
  message_scroll_print_wrapped(DAT_001007c0);
  select_msg_scroll_mode_normal();
  debug_noop_checkpoint();
  if (iVar3 != iVar2) {
    babl_free((void *)(intptr_t)(iVar3));
  }
}


// was FUN_0002990c -- babl_builtin_ask: the "ask" babl script builtin (registered via
// babl_register_builtin(s_babl_ask_000851ec, ...)), prompts the player for freeform text input via
// scroll_text_entry_prompt, then interns the typed text...
int babl_builtin_ask()

{
  char *pcMsg;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char *pcVar4;
  char local_a8 [160];
  
  scroll_text_entry_prompt(0,0,local_a8,1,0x32);
  message_scroll_print_wrapped(&s_scroll_newline_0008522c);
  debug_noop_checkpoint();
  pcVar2 = local_a8;
  pcVar4 = DAT_001007b8;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
    *pcVar4 = cVar1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  if (DAT_001007bc == 0) {
    DAT_001007bc = register_interned_string(DAT_001007b8,0x7c);
  }
  else {
    /* Was a dropped argument -- checking whether the existing interned
       string DAT_001007bc still resolves, same class as this session's
       other register-forwarding fixes. */
    pcMsg = get_message_string((int)DAT_001007bc);
    if (pcMsg == 0) {
      overwrite_interned_string(DAT_001007b8,(int)DAT_001007bc);
    }
  }
  debug_noop_checkpoint();
  return (int)DAT_001007bc;
}


// was FUN_00035e00 -- in-place bubble sort of param_2 byte-index entries in the buffer param_3
// (initialized here to 0..param_2-1 before sorting), ordered by an unsigned 16-bit key looked up as
// *(ushort*)(param_1 + entry*6) for each entry.
void bubble_sort_indices_by_key_table(intptr_t key_table, uint count, intptr_t index_buffer)
{
  byte bVar1;
  ushort uVar2;
  ushort uVar3;
  bool bVar4;
  byte *pbVar5;
  int iVar6;

  count = count & 0xffff;
  iVar6 = 0;
  if (count != 0) {
    do {
      *(char *)(iVar6 + index_buffer) = (char)iVar6;
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < (int)count);
  }
  do {
    bVar4 = true;
    if (count < 2) {
      return;
    }
    iVar6 = 1;
    do {
      pbVar5 = (byte *)(iVar6 + index_buffer);
      bVar1 = *pbVar5;
      uVar2 = *(ushort *)((uint)bVar1 * 6 + key_table);
      uVar3 = *(ushort *)((uint)pbVar5[-1] * 6 + key_table);
      if (uVar2 < uVar3) {
        *pbVar5 = pbVar5[-1];
      }
      if (uVar2 < uVar3) {
        pbVar5[-1] = bVar1;
      }
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
      if (uVar2 < uVar3) {
        bVar4 = false;
      }
    } while (iVar6 < (int)count);
  } while (!bVar4);
}


/* Missing render opcodes recovered directly from the ARM functions at
   their named addresses. The window script uses 11 (show at frame),
   3 (wait for click), and 6 (finish); these table entries were absent. */
int FUN_000362e8(ushort *op_args, intptr_t render_state)
{
  *(short *)(render_state + 0x35) = 0;
  return 0;
}

int FUN_00036300(ushort *op_args, intptr_t render_state)
{
  return 2;
}

int FUN_00036308(ushort *op_args, intptr_t render_state)
{
  if (*(byte *)(render_state + 0x45) & 1) {
    *(byte *)(render_state + 0x45) &= 0xfd;
    *(ushort *)(render_state + 0x39) = op_args[-2];
    *(ushort *)(render_state + 0x3b) = op_args[0];
  }
  return 1;
}

int FUN_00036344(ushort *op_args, intptr_t render_state)
{
  if (*(byte *)(render_state + 0x45) & 1) {
    byte flags = *(byte *)(render_state + 0x45) & 0xfd;
    *(ushort *)(render_state + 0x39) = op_args[-2];
    if (flags & 0x20) flags |= 0x80;
    *(byte *)(render_state + 0x45) = flags;
    *(ushort *)(render_state + 0x3b) = op_args[(flags & 0x20) ? 1 : 0];
  }
  return 2;
}

int FUN_00036394(ushort *op_args, intptr_t render_state)
{
  if (*(byte *)(render_state + 0x45) & 1) {
    byte flags = *(byte *)(render_state + 0x45) & 0xfd;
    *(byte *)(render_state + 0x45) = flags;
    *(ushort *)(render_state + 0x37) = op_args[0];
    if (!(flags & 0x20)) {
      *(ushort *)(render_state + 0x3b) = op_args[1];
      *(ushort *)(render_state + 0x39) = op_args[0] - 1;
    }
  }
  return 2;
}

int FUN_000363f0(ushort *op_args, intptr_t render_state)
{
  *(byte *)(render_state + 0x45) &= 0xfb;
  return 1;
}

int FUN_00036404(ushort *op_args, intptr_t render_state)
{
  *(byte *)(render_state + 0x45) &= 0xf3;
  return 0;
}

int FUN_00036418(ushort *op_args, intptr_t render_state)
{
  *(ushort *)(render_state + 0x3d) = op_args[0];
  *(ushort *)(render_state + 0x37) = op_args[-2] + 1;
  *(ushort *)(render_state + 0x39) = 0;
  *(byte *)(render_state + 0x45) &= 0xfd;
  return 1;
}

int FUN_000365bc(ushort *op_args, intptr_t render_state)
{
  if (*(byte *)(render_state + 0x17) == 0 && *(short *)(render_state + 0x43) > -2)
    *(short *)(render_state + 0x43) = (short)op_args[0];
  return 1;
}

int FUN_000365fc(ushort *op_args, intptr_t render_state)
{
  if (*(byte *)(render_state + 0x17) == 0 && *(short *)(render_state + 0x41) > -2)
    *(short *)(render_state + 0x41) = (short)op_args[0];
  return 1;
}

int FUN_0003663c(ushort *op_args, intptr_t render_state)
{
  if (op_args[-2] != op_args[0] - 1) {
    *(ushort *)(render_state + 0x37) = op_args[0] - 1;
    *(ushort *)(render_state + 0x39) = 0;
    *(ushort *)(render_state + 0x3b) = 0;
    *(byte *)(render_state + 0x45) = (*(byte *)(render_state + 0x45) & 0xfe) | 2;
  }
  return 1;
}

int FUN_00036698(ushort *op_args, intptr_t render_state)
{
  return 1;
}

// was FUN_000360f4 -- babl conversation-text render opcode handler (see PTR_FUN_00085408's own
// comment): if the render state's flag byte (param_2+0x45) has bit 0 set, looks up a message string
// keyed by param_1's own 16-bit id field, splits it on newlines into up to 6 paragraphs...
int babl_render_op_wrap_message(byte *op_args, intptr_t render_state)
{
  undefined1 uVar1;
  short sVar2;
  intptr_t iVar3;
  undefined1 *puVar4;
  intptr_t iVar5;
  intptr_t *piVar6;
  intptr_t *piVar7;
  char **puVar8;
  int iVar9;
  undefined1 *puVar10;
  int iVar11;
  int iVar12;
  int local_4c;
  /* Six paragraph starts plus the next-newline scratch and sentinel. */
  intptr_t local_44 [8] = {0};

  if ((*(byte *)(render_state + 0x45) & 1) != 0) {
    *(undefined1 *)(render_state + 0x34) = *op_args;
    local_44[0] = (intptr_t)get_message_string((int)*(short *)(op_args + 2));
    iVar12 = 0;
    iVar11 = 0;
    iVar9 = 0;
    local_44[1] = (intptr_t)ce_strchr((const char *)(intptr_t)(local_44[0]),10);
    if (local_44[1] != 0) {
      piVar6 = local_44;
      do {
        if (5 < iVar9) break;
        piVar7 = piVar6 + 1;
        iVar9 = iVar9 + 1;
        puVar4 = (undefined1 *)*piVar7 + 1;
        *(undefined1 *)*piVar7 = 0;
        *piVar7 = (intptr_t)puVar4;
        iVar3 = (intptr_t)ce_strchr(puVar4,10);
        piVar6[2] = iVar3;
        piVar6 = piVar7;
      } while (iVar3 != 0);
    }
    local_4c = 0;
    piVar6 = local_44;
    do {
      puVar4 = (undefined1 *)*piVar6;
      if ((puVar4 == (undefined1 *)0x0) || (5 < iVar11)) break;
      iVar9 = 0;
      if (puVar4 != (undefined1 *)0x0) {
        puVar8 = ((struct babl_render_state *)render_state)->lines + iVar11;
        do {
          iVar3 = (intptr_t)ce_strchr(puVar4,0x20);
          if (iVar3 == 0) {
            sVar2 = measure_text_width(puVar4);
            iVar3 = (int)sVar2;
            puVar10 = (undefined1 *)0x0;
            if (iVar3 + iVar9 < 0x141) {
              iVar5 = *piVar6;
              iVar11 = iVar11 + 1;
              iVar12 = iVar12 + 1;
              *puVar8 = (char *)iVar5;
              puVar8 = puVar8 + 1;
            }
          }
          else {
            puVar10 = (undefined1 *)(iVar3 + 1);
            uVar1 = *puVar10;
            *puVar10 = 0;
            sVar2 = measure_text_width(puVar4);
            *puVar10 = uVar1;
            iVar3 = (int)sVar2;
          }
          iVar9 = iVar3 + iVar9;
          if (0x140 < iVar9) {
            puVar4[-1] = 0;
            iVar11 = iVar11 + 1;
            iVar3 = *piVar6;
            *piVar6 = (intptr_t)puVar4;
            iVar12 = iVar12 + 1;
            *puVar8 = (char *)iVar3;
            iVar9 = 0;
            puVar8 = puVar8 + 1;
            puVar10 = puVar4;
          }
          puVar4 = puVar10;
        } while (puVar10 != (undefined1 *)0x0);
      }
      piVar6 = piVar6 + 1;
      local_4c = local_4c + 1;
    } while (local_4c < 6);
    if (5 < iVar12) {
      iVar12 = 6;
    }
    *(char *)(render_state + 0x35) = (char)iVar12;
    *(char *)(render_state + 0x36) = (char)((uint)iVar12 >> 8);
  }
  return 2;
}



// was FUN_00036460 -- babl conversation-text render opcode handler (see PTR_FUN_00085408's own
// comment): unpacks 5 octal digits (0-7, three 3-bit fields from param_1's first word, two more
// from its second) into a "DDD-DD"-shaped scratch message buffer at fixed positions...
int babl_render_op_show_code(ushort *op_args, intptr_t render_state)
{
  /* Match the viewer's initial-load fallback when the registry is empty. */
  const char *pcVar2 = DAT_0023c698 ? (char *)&DAT_0023c698 : "\\CUTS";

  *(byte *)(render_state + 3) = ((byte)(*op_args >> 6) & 7) + 0x30;
  *(byte *)(render_state + 4) = ((byte)(*op_args >> 3) & 7) + 0x30;
  *(byte *)(render_state + 5) = ((byte)*op_args & 7) + 0x30;
  *(byte *)(render_state + 8) = ((byte)(op_args[1] >> 3) & 7) + 0x30;
  *(byte *)(render_state + 9) = ((byte)op_args[1] & 7) + 0x30;
  ce_memset(&DAT_00101968,0,0x104);
  /* strcpy(&DAT_00101968, &DAT_0023c698). Ghidra baked the delta between the two globals as
     -0x13ad30, which only resolves in the original 0x00xx_xxxx address space -- in the recompile
     pcVar2[-0x13ad30] is a wild pointer (ASan: global-buffer-overflow). Bounded indexed copy. */
  {
    int _i = 0;
    while (_i < 0x103 && pcVar2[_i] != '\0') {
      (&DAT_00101968)[_i] = pcVar2[_i]; _i++;
    }
    (&DAT_00101968)[_i] = '\0';
  }
  ce_strcat(&DAT_00101968,(char *)(intptr_t)(render_state));
  return 2;
}



// was FUN_0003651c -- babl conversation-text render opcode handler (see PTR_FUN_00085408's own
// comment) for a "say" directive: if the render state's flag byte has bit 0x20 set (voice available
// for this line) and either bit 0x40 (voice already forced on) or audio_always_true_stub allows...
int babl_render_op_say(intptr_t op_args, intptr_t render_state)
{
  undefined2 uVar1;
  int iVar2;

  if ((*(byte *)(render_state + 0x45) & 0x20) != 0) {
    if (((*(byte *)(render_state + 0x45) & 0x40) != 0) || (iVar2 = audio_always_true_stub(), iVar2 != 0)) {
      uVar1 = *(undefined2 *)(op_args + 4);
      *(char *)(render_state + 0x3f) = (char)uVar1;
      *(char *)(render_state + 0x40) = (char)((ushort)uVar1 >> 8);
      babl_render_op_wrap_message((byte *)(intptr_t)(op_args),render_state);
      if (*(short *)(op_args + 4) != 999) {
        return 3;
      }
      *(undefined1 *)(render_state + 0x3f) = 0xff;
      *(undefined1 *)(render_state + 0x40) = 0xff;
      return 3;
    }
    *(undefined1 *)(render_state + 0x3f) = 0xff;
    *(undefined1 *)(render_state + 0x40) = 0xff;
    *(byte *)(render_state + 0x45) = *(byte *)(render_state + 0x45) & 0xdf;
  }
  babl_render_op_wrap_message((byte *)(intptr_t)(op_args),render_state);
  return 3;
}


// was FUN_000366a0 -- plays a fixed sound effect (id 0x11, centered pan) and returns 0.
int babl_render_op_play_sound()

{
  play_sound_effect_with_pan(0x11,0x40,0);
  return 0;
}



// was FUN_000366bc -- per-tick housekeeping for the babl conversation render state (param_1):
// advances the menu music track, and if a voice sample is currently playing (flag 0x40 set, sample
// id != -1) and has finished (is_voice_sample_finished), clears the voice fields back to "none".
void babl_render_tick(char *render_state)
{
  int iVar1;

  advance_menu_music_track();
  if (((*(byte *)(render_state + 0x45) & 0x40) != 0) && (*(short *)(render_state + 0x3f) != -1)) {
    voice_sample_cluster_stub_1();
    iVar1 = is_voice_sample_finished();
    if (iVar1 != 0) {
      *(undefined1 *)(render_state + 0x3f) = 0xff;
      *(byte *)(render_state + 0x45) = *(byte *)(render_state + 0x45) & 0xbf;
      *(undefined1 *)(render_state + 0x40) = 0xff;
    }
  }
}


// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0003671c -- the main babl conversation/book-viewer window
// renderer, shared by ordinary NPC dialogue AND the special
// illustrated-book/scroll full-screen viewer (its only known caller,
// display_book_or_scroll_page, picks the y/width/height/mode arguments
// -- a style flag plus window geometry -- based on whether the
// requested display id is a regular text page (<0x100) or a picture
// page (>=0x100)). Runs its own modal input-handling loop
// (next_input_event/read_realtime_clock_units polling) while
// interpreting the compiled dialogue-text stream, dispatching embedded
// opcode bytes < 0x10 through the PTR_FUN_00085408 table
// (babl_render_op_wrap_message, babl_render_op_say,
// babl_render_op_show_code, babl_render_op_play_sound), streaming
// illustrated book/scroll bitmap animation-frame data via
// load_voice_sample_page/read_voice_sample_page_chunk (despite their
// "voice_sample" names -- see load_voice_sample_page's own comment in
// audio.c), driving portrait/illustration palette-cycle animation via
// tick_book_illustration_palette_cycles, and per-tick housekeeping
// via babl_render_tick. See the individual opcode handlers and
// PTR_FUN_00085408's own comment for the dispatch table itself.
//
// NOTE: the first parameter's name `x` is misleading -- it is the
// display/resource id, not a coordinate: the body uses it only to build
// the page-resource filename digits (`(x >> 6) & 7` etc. below), never
// as a position. Left named as-is to match the rest of the codebase.
void render_babl_dialog_window(short x, short y, short width, short height, short mode)
{
  char *wptr_21485;
  /* WinCE obtained this directory from the registry. Its host stub leaves
     it empty; resources live in CUTS under --data-dir. */
  const char *cutscene_directory = DAT_0023c698 ? (char *)&DAT_0023c698 : "\\CUTS";
  ushort *puVar1;
  ushort uVar2;
  bool bVar3;
  byte bVar4;
  char cVar5;
  short sVar6;
  ushort uVar7;
  char *pcVar8;
  intptr_t iVar9;
  intptr_t iVar10;
  ushort *puVar11;
  intptr_t iVar12;
  int iVar13;
  uintptr_t uVar14;
  undefined4 uVar15;
  uintptr_t uVar16;
  intptr_t *piVar17;
  uint uVar18;
  uint extraout_r3;
  int iVar19;
  short sVar20;
  ushort *puVar21;
  ushort *puVar22;
  intptr_t *piVar23;
  intptr_t in_stack_ffffff10;
  undefined2 uVar24;
  byte local_d8;
  /* ARM 0x36774 builds one state at sp+0x20. The callbacks access
     fields through that pointer; keep the decompiled locals as aliases. */
  struct babl_render_state render_state = {0};
#define acStack_d0 render_state.bytes
#define local_c1 (*((short *)(acStack_d0 + 15)))
#define local_bf (*((short *)(acStack_d0 + 17)))
#define local_bd (*((short *)(acStack_d0 + 19)))
#define local_bb (*((short *)(acStack_d0 + 21)))
#define local_b9 (*((char *)(acStack_d0 + 23)))
  intptr_t local_b8;
#define local_b4 (render_state.lines[0])
#define local_9c (*((undefined1 *)(acStack_d0 + 52)))
#define local_9b (*((short *)(acStack_d0 + 53)))
#define local_99 (*((ushort *)(acStack_d0 + 55)))
#define local_97 (*((ushort *)(acStack_d0 + 57)))
#define local_95 (*((ushort *)(acStack_d0 + 59)))
#define local_93 (*((short *)(acStack_d0 + 61)))
#define local_91 (*((short *)(acStack_d0 + 63)))
#define local_8f (*((short *)(acStack_d0 + 65)))
#define local_8d (*((short *)(acStack_d0 + 67)))
#define local_8b (*((byte *)(acStack_d0 + 69)))
  uintptr_t local_88;
  ushort *local_84;
  intptr_t local_80;
  short local_7c;
  intptr_t *local_78;
  int local_74;
  intptr_t local_70;
  ushort local_6c;
  intptr_t local_68;
  uintptr_t local_64;
  int local_60;
  int local_5c;
  int local_58;
  int local_54;
  int local_50;
  int local_4c;
  intptr_t local_48;
  ushort *local_44;
  int local_40;
  int local_3c;
  
  local_78 = (intptr_t *)0x0;
  local_80 = 0;
  local_64 = 0;
  dirty_rect_union(0,200,0,0x140);
  pcVar8 = &DAT_00085448;
    wptr_21485 = acStack_d0;
  do {
    cVar5 = *pcVar8;
    *wptr_21485 = cVar5; wptr_21485 = wptr_21485 + 1;
    pcVar8 = pcVar8 + 1;
  } while (cVar5 != '\0');
  local_bb = mode;
  local_8b = local_8b & 0xbf;
  local_95 = 0;
  local_97 = 0;
  local_99 = 0;
  if ((y == 0) && (width == 199)) {
    sVar6 = height;
    if (height == 0x140) {
      sVar6 = mode;
    }
    if (height == 0x140 && sVar6 == 200) {
      local_b9 = '\0';
      goto LAB_00036858;
    }
  }
  local_b9 = '\x01';
LAB_00036858:
  local_91 = -1;
  local_c1 = y;
  local_bf = width;
  local_bd = height;
  bVar4 = get_audio_subsystem_flag();
  local_8b = local_8b & 0xdf | (bVar4 & 1) << 5;
  local_88 = (intptr_t)ce_malloc(0xb00);
  local_b8 = (intptr_t)ce_malloc(0x300);
  iVar9 = (intptr_t)ce_malloc(0x100);
  local_70 = iVar9;
  iVar10 = (intptr_t)ce_calloc(0x100,2);
  local_48 = iVar10;
  puVar11 = (ushort *)ce_calloc(0x400,2);
  /* Original filename template was copied above (ARM 0x36770).
     The resource-page digits are at offsets 8/9, after the .n suffix. */
  acStack_d0[3] = ((byte)(x >> 6) & 7) + 0x30;
  acStack_d0[4] = ((byte)(x >> 3) & 7) + 0x30;
  acStack_d0[5] = ((byte)x & 7) + 0x30;
  acStack_d0[8] = '0';
  acStack_d0[9] = '0';
  local_44 = puVar11;
  ce_memset(&DAT_00101968,0,0x104);
  local_3c = -0x13ad30;
  /* strcpy(&DAT_00101968, &DAT_0023c698) -- see the note at the sibling
     copy above; the -0x13ad30 baked delta is a wild pointer here. */
  {
    int _i = 0;
    while (_i < 0x103 && cutscene_directory[_i] != '\0') {
      (&DAT_00101968)[_i] = cutscene_directory[_i]; _i++;
    }
    (&DAT_00101968)[_i] = '\0';
  }
  ce_strcat(&DAT_00101968,acStack_d0);
  iVar12 = (int)open_file_for_read(&DAT_00101968);
  local_5c = iVar12;
  if (iVar12 == -1) {
    clear_ambient_sound_target();
  }
  else {
    iVar13 = read_file_handle(iVar12,puVar11,0x800);
    if (iVar13 != 0) {
      local_8b = local_8b | 0x19;
      local_8f = -1;
      local_8d = -2;
      local_84 = puVar11;
      ce_memmove((void *)(intptr_t)(local_b8),&DAT_00088d98,0x300);
      if (local_b9 == '\0') {
        fade_out(g_uw_framebuffer,(char *)(intptr_t)(local_b8),0);
      }
      iVar10 = (int)acStack_d0[9];
      acStack_d0[9] = (char)(iVar10 + 1);
      if (0x37 < (iVar10 + 1) * 0x1000000 >> 0x18) {
        acStack_d0[9] = '0';
        acStack_d0[8] = acStack_d0[8] + '\x01';
      }
      ce_memset(&DAT_00101968,0,0x104);
      /* strcpy(&DAT_00101968, &DAT_0023c698) -- baked -0x13ad30 delta is
         a wild pointer in the recompile; bounded indexed copy. */
      {
        int _i = 0;
        while (_i < 0x103 && cutscene_directory[_i] != '\0') {
          (&DAT_00101968)[_i] = cutscene_directory[_i]; _i++;
        }
        (&DAT_00101968)[_i] = '\0';
      }
      ce_strcat(&DAT_00101968,acStack_d0);
      uVar2 = *puVar11;
      puVar21 = local_84;
      while (uVar2 == 0) {
        puVar21 = puVar11 + 2;
        if (puVar11[1] < 0x10) {
          uVar14 = PTR_FUN_00085408[puVar11[1]](puVar21,acStack_d0);
          puVar21 = puVar21 + (uVar14 & 0xffff);
        }
        puVar11 = puVar21;
        uVar2 = *puVar21;
      }
      local_84 = puVar21;
      iVar10 = (int)open_file_for_read(&DAT_00101968);
      uVar24 = (undefined2)((uint)in_stack_ffffff10 >> 0x10);
      while ((local_74 = iVar10, iVar10 != -1 &&
             (uVar24 = (undefined2)((uint)in_stack_ffffff10 >> 0x10), (local_8b & 8) != 0))) {
        uVar15 = GetFileSize(iVar10,0);
        if (local_80 != 0) {
          /* LocalFree(); */
          LocalFree((void *)(intptr_t)(local_80));
        }
        iVar9 = (intptr_t)ce_malloc(uVar15);
        local_80 = iVar9;
        ce_memset((void *)(intptr_t)(iVar9),0,uVar15);
        read_file_handle(iVar10,(void *)(intptr_t)(iVar9),uVar15);
        uVar14 = local_88;
        DAT_000853fc = 0xffff;
        ce_memmove((void *)(intptr_t)(local_88),(void *)(intptr_t)(iVar9),0xb00);
        iVar10 = 0x10;
        uVar16 = uVar14;
        do {
          iVar10 = iVar10 + -1;
          *(byte *)(uVar16 + 0x82) = *(byte *)(uVar16 + 0x83) & 0x3f;
          *(undefined1 *)(uVar16 + 0x83) = 0;
          uVar16 = uVar16 + 8;
        } while (iVar10 != 0);
        local_64 = uVar14;
        convert_palette_bgrx_to_rgb((byte *)(intptr_t)(uVar14 + 0x100),(byte *)(intptr_t)(local_b8));
        build_rgb565_palette((byte *)(intptr_t)(local_b8),-1);
        local_54 = read_realtime_clock_units();
        local_4c = local_54;
        bubble_sort_indices_by_key_table(uVar14 + 0x500,*(undefined2 *)(uVar14 + 6),local_70);
        local_93 = 0;
        iVar10 = (int)acStack_d0[9];
        acStack_d0[9] = (char)(iVar10 + 1);
        if (0x37 < (iVar10 + 1) * 0x1000000 >> 0x18) {
          acStack_d0[8] = acStack_d0[8] + '\x01';
          acStack_d0[9] = '0';
        }
        ce_memset(&DAT_00101968,0,0x104);
        /* strcpy(&DAT_00101968, &DAT_0023c698) -- local_3c is the baked
           -0x13ad30 delta, a wild pointer here; bounded indexed copy. */
        {
          int _i = 0;
          while (_i < 0x103 && cutscene_directory[_i] != '\0') {
            (&DAT_00101968)[_i] = cutscene_directory[_i]; _i++;
          }
          (&DAT_00101968)[_i] = '\0';
        }
        ce_strcat(&DAT_00101968,acStack_d0);
        local_9b = 0;
LAB_00036ca4:
        piVar17 = local_78;
        local_7c = -1;
        if ((local_8b & 8) != 0) {
          local_8b = local_8b | 4;
        }
        local_60 = 0;
        DAT_00101a6c = 1;
        if (local_78 != (intptr_t *)0x0) {
          iVar10 = 0;
          piVar23 = local_78;
          if (*(short *)(uVar14 + 6) != 0) {
            do {
              if (*piVar23 != 0) {
                /* LocalFree(); */
                LocalFree((void *)(intptr_t)(*piVar23));
              }
              iVar10 = iVar10 + 1;
              piVar23 = piVar23 + 1;
            } while (iVar10 < (int)(uint)*(ushort *)(uVar14 + 6));
          }
          LocalFree(piVar17);
        }
        piVar17 = (intptr_t *)ce_malloc((uint)*(ushort *)(uVar14 + 6) * sizeof(*piVar17));
        iVar10 = 0;
        local_78 = piVar17;
        if (*(short *)(uVar14 + 6) != 0) {
          do {
            if (x == 10 && iVar10 == 5) {
              piVar17[5] = 0;
            }
            else {
              iVar12 = (intptr_t)ce_calloc(0x10000,1);
              piVar17[iVar10] = iVar12;
              load_voice_sample_page((char *)(intptr_t)(iVar9),(uint)*(byte *)(iVar10 + local_70),
                           (char *)(intptr_t)((uint)*(byte *)(iVar10 + local_70) * 6 + uVar14 + 0x500),(void *)(intptr_t)(iVar12));
            }
            iVar10 = iVar10 + 1;
          } while (iVar10 < (int)(uint)*(ushort *)(uVar14 + 6));
        }
        local_d8 = (char)iVar10 - 1;
        while (((*local_84 == 0 && ((local_8b & 4) != 0)) && (local_93 == 0))) {
          puVar21 = local_84 + 2;
          puVar11 = local_84 + 1;
          local_84 = puVar21;
          if (*puVar11 < 0x10) {
            uVar16 = PTR_FUN_00085408[*puVar11]((void *)puVar21,(void *)acStack_d0);
            local_84 = puVar21 + (uVar16 & 0xffff);
          }
        }
        local_50 = 0;
        while ((iVar10 = local_50, local_50 < (int)(uint)*(ushort *)(uVar14 + 6) &&
               ((local_8b & 4) != 0))) {
          uVar16 = 0;
          piVar17 = local_78 + local_50;
          iVar9 = *piVar17 + 8;
          iVar12 = (uint)*(byte *)(local_50 + local_70) * 6 + uVar14 + 0x500;
          ce_memmove((void *)(intptr_t)(local_48),(void *)(intptr_t)(iVar9),(uint)*(ushort *)(iVar12 + 2) << 1);
          bVar3 = true;
          local_68 = iVar9 + (uint)*(ushort *)(iVar12 + 2) * 2;
          if ((iVar10 != *(ushort *)(uVar14 + 6) - 1) ||
             (local_40 = 1, *(char *)(uVar14 + 0x1a) == '\0')) {
            local_40 = 0;
          }
          local_58 = 0;
          local_95 = 0;
          local_97 = 0;
          local_8b = local_8b & 0xfd;
          if (0 < (int)((uint)*(ushort *)(iVar12 + 2) - local_40)) {
            do {
              iVar10 = local_4c;
              if ((local_8b & 4) == 0) break;
              if (*(byte *)(local_68 + 1) == 0) {
                uVar14 = 2;
              }
              else {
                uVar14 = (*(byte *)(local_68 + 1) + 1 & 0xfffe) + 4;
              }
              puVar11 = (ushort *)(local_48 + uVar16 * 2);
              uVar18 = (uint)*puVar11;
              if ((uVar18 != 0) && (uVar18 != uVar14)) {
                pcVar8 = (char *)(uVar14 + local_68);
                if (*pcVar8 == '\0') {
                  ce_memmove((void *)(intptr_t)(DAT_00101a70),pcVar8 + 2,64000);
                }
                else if (*pcVar8 == '\x01') {
                  decompress_rle_stream((byte *)(intptr_t)(DAT_00101a70),pcVar8 + 2);
                }
              }
              if ((local_8b & 1) == 0) {
                if (DAT_00101a6c == local_99) {
                  local_99 = 0;
                  local_97 = 0;
                  local_95 = 0;
                  local_8b = local_8b & 0xfc | 1;
                }
              }
              else {
                in_stack_ffffff10 = CONCAT22((short)((uint)in_stack_ffffff10 >> 0x10),0x140);
                bitmap_blit_to_framebuffer((int)y,200 - width,(char *)(intptr_t)(DAT_00101a70),200,in_stack_ffffff10,
                             0x140 - height,200 - mode,1);
                uVar14 = extraout_r3;
                do {
                  if (x != 10) {
                    uVar14 = local_88;
                  }
                  if (x != 10) {
                    tick_book_illustration_palette_cycles((ushort *)(intptr_t)(uVar14 + 0x80));
                  }
                  babl_render_tick(acStack_d0);
                  sVar6 = -1;
                  do {
                    sVar20 = sVar6;
                    sVar6 = next_input_event();
                  } while (3 < sVar6);
                  if ((-1 < sVar6) && (sVar6 < 4)) {
                    sVar20 = sVar6;
                  }
                  if (((sVar20 != -1) && (local_91 == -1)) &&
                     ((3 < sVar20 || (iVar9 = read_realtime_clock_units(), 0x40 < (uint)(iVar9 - local_54))))) {
                    local_8b = local_8b | 2;
                    local_54 = read_realtime_clock_units();
                  }
                  uVar24 = (undefined2)((uint)in_stack_ffffff10 >> 0x10);
                  if (sVar20 == 1) {
                    if (x != 10) {
                      sVar20 = 0x1b;
                    }
                    DAT_0023c63c = 0;
                  }
                  if ((sVar20 == 0x1b) && ((local_8b & 0x10) != 0)) goto LAB_00037a8c;
                  iVar9 = read_realtime_clock_units();
                  local_4c = iVar9;
                  uVar18 = ordint_divmod(*(undefined2 *)(local_88 + 0x44),300).quot;
                  uVar14 = iVar9 - iVar10;
                } while (uVar14 < uVar18);
                if ((DAT_00101a6c < local_99) && ((local_8b & 2) != 0)) {
                  if (local_8d == -2) {
                    local_8b = local_8b & 0xfd;
                  }
                  else {
                    local_8b = local_8b & 0xfe;
                    local_95 = 0;
                    local_97 = 0;
                    local_93 = 0;
                  }
                }
              }
              Sleep(10);
              puVar21 = local_44;
              iVar9 = local_5c;
              while (((local_5c = iVar9, (local_8b & 4) != 0 && (*local_84 == DAT_00101a6c)) &&
                     (local_93 == 0))) {
                if (local_84 < puVar21 + 0x3fd) {
                  puVar22 = local_84 + 2;
                  puVar1 = local_84 + 1;
                  local_84 = puVar22;
                  if (*puVar1 < 0x10) {
                    uVar14 = PTR_FUN_00085408[*puVar1]((void *)puVar22,(void *)acStack_d0);
                    local_84 = puVar22 + (uVar14 & 0xffff);
                    iVar9 = local_5c;
                  }
                }
                else {
                  seek_file_handle(iVar9,(local_84 - puVar21) + -0x400,1);
                  read_file_handle(iVar9,puVar21,0x800);
                  local_84 = puVar21;
                  iVar9 = local_5c;
                }
              }
              Sleep(10);
              if ((local_8b & 1) != 0) {
                if (0 < local_9b) {
                  *g_draw_color_index = local_9c;
                  *DAT_00084298 = local_9c;
                  iVar10 = ((local_bf * -0x10000 >> 0x10) -
                           (int)*(short *)(DAT_000879b0 + 6) * (int)local_9b) + (int)local_bb + 0xc5
                  ;
                  if (0 < local_9b) {
                    iVar9 = 0;
                    do {
                      sVar6 = measure_text_width((&local_b4)[iVar9]);
                      iVar19 = ((int)local_bd - (int)sVar6) + (int)local_c1;
                      if (iVar19 < 0) {
                        iVar19 = iVar19 + 1;
                      }
                      draw_text_string((&local_b4)[iVar9],
                                   (int)(short)(iVar19 >> 1),iVar10);
                      iVar10 = *(short *)(DAT_000879b0 + 6) + iVar10;
                      iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
                    } while (iVar9 < local_9b);
                  }
                }
                iVar10 = local_4c;
                if (-1 < local_8f) {
                  /* Opcode 10 requests a fade; the PocketPC player only
                     cleared this marker, leaving the transition invisible. */
                  fade_in(g_uw_framebuffer,0,0);
                  local_8f = -2;
                  local_8d = -1;
                }
                flush_dirty_rect_to_display(1);
              }
              if ((((local_8b & 0x20) != 0) && ((local_8b & 0x40) == 0)) &&
                 ((-1 < local_91 && (local_91 < 999)))) {
                play_numbered_voice_sample(local_91);
                local_8b = local_8b | 0x40;
              }
              uVar14 = (uint)*puVar11;
              local_68 = local_68 + uVar14;
              if (local_58 == *(ushort *)(iVar12 + 2) - 1) {
                uVar14 = 0xffff;
              }
              if ((local_60 == 0) && (bVar3)) {
                local_60 = 1;
                local_6c = 0;
                local_d8 = local_d8 + 1;
                local_7c = local_7c + 1;
                if (DAT_00101960 <= local_7c) {
                  local_7c = 0;
                }
              }
              uVar2 = local_6c;
              if ((uint)local_d8 < (uint)*(ushort *)(local_88 + 6)) {
                uVar18 = (uint)*(byte *)((uint)local_d8 + local_70);
                in_stack_ffffff10 = (uintptr_t)local_6c + *piVar17;
                uVar7 = read_voice_sample_page_chunk((char *)(intptr_t)(local_80),uVar18,(char *)(intptr_t)(uVar18 * 6 + local_88 + 0x500),uVar14,
                                     (void *)(intptr_t)(in_stack_ffffff10));
                uVar18 = (uint)uVar7;
                if (uVar18 != 0xffffffff) {
                  local_6c = uVar7 + uVar2;
                }
                if (((uVar18 == 0) || (uVar18 < uVar14)) && (uVar14 != 0)) {
                  local_60 = 0;
                }
              }
              if (((uint)DAT_00101a6c == local_99 - 1) && (local_93 != 0)) {
                local_93 = local_93 + -1;
                DAT_000853fc = 0xffff;
                uVar14 = local_88;
                iVar9 = local_80;
                goto LAB_00036ca4;
              }
              if ((uint)DAT_00101a6c == (uint)local_97) {
                do {
                  if (((local_95 != 999) &&
                      (iVar9 = read_realtime_clock_units(), (uint)local_95 <= (uint)(iVar9 - iVar10) >> 8)) &&
                     ((local_8b & 0x80) == 0)) break;
                  sVar6 = -1;
                  if (x != 10) {
                    tick_book_illustration_palette_cycles((ushort *)(intptr_t)(local_88 + 0x80));
                  }
                  babl_render_tick(acStack_d0);
                  if (((local_8b & 0x80) != 0) && (iVar9 = is_voice_sample_finished(), iVar9 != 0)) {
                    local_8b = local_8b & 0x7f;
                    iVar9 = read_realtime_clock_units();
                    local_95 = local_95 + (short)((uint)(iVar9 - iVar10) >> 8);
                  }
                  do {
                    sVar20 = sVar6;
                    sVar6 = next_input_event();
                    uVar24 = (undefined2)((uint)in_stack_ffffff10 >> 0x10);
                  } while (3 < sVar6);
                  if ((-1 < sVar6) && (sVar6 < 4)) {
                    sVar20 = sVar6;
                  }
                  if (sVar20 == 1) {
                    if (x != 10) {
                      sVar20 = 0x1b;
                    }
                    DAT_0023c63c = 0;
                  }
                  if ((sVar20 == 0x1b) && ((local_8b & 0x10) != 0)) goto LAB_00037a8c;
                  if (((sVar20 == -1) || (local_91 != -1)) ||
                     ((sVar20 < 4 && (iVar9 = read_realtime_clock_units(), (uint)(iVar9 - local_54) < 0x41)))) {
                    cVar5 = '\0';
                  }
                  else {
                    cVar5 = '\x01';
                  }
                  bVar4 = local_8b | cVar5 << 1;
                  if ((local_8b & 2) != 0 || cVar5 != '\0') {
                    local_8b = local_8b & 0xfd;
                    break;
                  }
                  local_8b = bVar4;
                } while (DAT_00101a6c == local_97);
              }
              if (-1 < local_8d) {
                fade_out(g_uw_framebuffer,0,0);
                local_8d = -2;
                local_8f = -1;
              }
              babl_render_tick(acStack_d0);
              uVar16 = uVar16 + 1 & 0xffff;
              bVar3 = false;
              DAT_00101a6c = DAT_00101a6c + 1;
              local_58 = local_58 + 1;
            } while (local_58 < (int)((uint)*(ushort *)(iVar12 + 2) - local_40));
          }
          local_50 = local_50 + 1;
          uVar14 = local_88;
          iVar9 = local_80;
          piVar17 = local_78;
        }
        if (piVar17 != (intptr_t *)0x0) {
          iVar10 = 0;
          piVar23 = piVar17;
          if (*(short *)(uVar14 + 6) != 0) {
            do {
              if (*piVar23 != 0) {
                /* LocalFree(); */
                LocalFree((void *)(intptr_t)(*piVar23));
                *piVar23 = 0;
              }
              iVar10 = iVar10 + 1;
              piVar23 = piVar23 + 1;
            } while (iVar10 < (int)(uint)*(ushort *)(uVar14 + 6));
          }
          LocalFree(piVar17);
          local_78 = (intptr_t *)0x0;
        }
        if (iVar9 != 0) {
          LocalFree((void *)(intptr_t)(iVar9));
          local_80 = 0;
        }
        CloseHandle(local_74);
        iVar10 = (int)open_file_for_read(&DAT_00101968);
        uVar24 = (undefined2)((uint)in_stack_ffffff10 >> 0x10);
      }
LAB_00037a94:
      if (local_91 != -1) {
        stop_voice_sample();
      }
      if (local_b9 == '\0') {
        if (local_8d != -2) {
          fade_out(g_uw_framebuffer,(char *)(intptr_t)(local_b8),1);
        }
        clear_screen_and_restore_cursor();
      }
      clear_ambient_sound_target_thunk();
      iVar12 = local_5c;
      puVar11 = local_44;
      iVar10 = local_48;
      iVar9 = local_70;
    }
    voice_sample_cluster_stub_2();
    uVar14 = local_64;
    if (local_78 != (intptr_t *)0x0) {
      iVar12 = 0;
      piVar17 = local_78;
      if (*(short *)(local_64 + 6) != 0) {
        do {
          if (*piVar17 != 0) {
            /* LocalFree(); */
            LocalFree((void *)(intptr_t)(*piVar17));
          }
          iVar12 = iVar12 + 1;
          piVar17 = piVar17 + 1;
        } while (iVar12 < (int)(uint)*(ushort *)(uVar14 + 6));
      }
      LocalFree(local_78);
      iVar12 = local_5c;
    }
    if (local_80 != 0) {
      /* LocalFree(); */
      LocalFree((void *)(intptr_t)(local_80));
    }
  }
  if (local_44 != (ushort *)0x0) {
    LocalFree(local_44);
  }
  if (local_48 != 0) {
    LocalFree((void *)(intptr_t)(local_48));
  }
  if (local_70 != 0) {
    LocalFree((void *)(intptr_t)(local_70));
  }
  if (local_b8 != 0) {
    /* LocalFree(); */
    LocalFree((void *)(intptr_t)(local_b8));
  }
  if (local_88 != 0) {
    /* LocalFree(); */
    LocalFree((void *)(intptr_t)(local_88));
  }
  CloseHandle(iVar12);
  return;
LAB_00037a8c:
  CloseHandle(local_74);
  goto LAB_00037a94;
#undef acStack_d0
#undef local_c1
#undef local_bf
#undef local_bd
#undef local_bb
#undef local_b9
#undef local_b4
#undef local_9c
#undef local_9b
#undef local_99
#undef local_97
#undef local_95
#undef local_93
#undef local_91
#undef local_8f
#undef local_8d
#undef local_8b
}



// was FUN_00037c14 -- the general-purpose "display a numbered text/scroll/picture page" entry
// point: for page ids under 0x100...
void display_book_or_scroll_page(uint page_id)
{
  uint uVar1;
  undefined4 uVar2;
  undefined4 unaff_r6;
  undefined4 unaff_r7;
  undefined2 unaff_r8;
  ushort saved_palette[256];

  uVar1 = page_id & 0xffff;
  /* The RGB565 lookup table is shared by the viewer and every HUD blit.
     Preserve the gameplay colors while the LPF palette is installed. */
  ce_memmove(saved_palette,&g_palette_rgb565,sizeof(saved_palette));
  if (uVar1 >= 0x100) {
    /* Consume the click that opened the picture before polling dismissal.
       Tick no gameplay handlers while preparing the modal viewer. */
    wait_for_click_release(0);
  }
  /* Object selection blocks ordinary game flushes. This viewer owns its
     modal presentation loop, including when entered from a batched tick. */
  uw_begin_modal_present();
  if (uVar1 < 0x100) {
    uVar2 = 0;
    unaff_r6 = 199;
    unaff_r7 = 0x140;
    unaff_r8 = 200;
  }
  else {
    uVar2 = 0x34;
  }
  g_text_use_palette_color = 1;
  if (uVar1 >= 0x100) {
    unaff_r6 = 0xb5;
    unaff_r7 = 0xac;
    unaff_r8 = 0x70;
  }
  if (((uVar1 == 1) || (uVar1 == 2)) || (uVar1 == 3)) {
    play_music_track(4,1);
  }
  select_active_font(s_FONTBIG_SYS_00085454);
  DAT_0024cfac = (short)page_id + 0xc00;
  decrement_cursor_hide_depth();
  render_babl_dialog_window(page_id,uVar2,unaff_r6,unaff_r7,unaff_r8);
  ce_memmove(&g_palette_rgb565,saved_palette,sizeof(saved_palette));
  select_active_font(s_font5x6p_sys_0008430c);
  if (DAT_00201c98 != 0) {
    load_dungeon_texture_arenas();
  }
  if (uVar1 < 0x100) {
    if (*(short *)(DAT_00085a6c + 8) == 1) {
      change_game_mode(1);
      goto LAB_00037d3c;
    }
    if (*(short *)(DAT_00085a6c + 8) == 0) goto LAB_00037d3c;
    set_palette_bank(0);
    uVar2 = 0x7ffe;
  }
  else {
    uVar2 = 2;
  }
  set_pending_update_flags(uVar2);
LAB_00037d3c:
  cursor_show_idle_tick();
  g_text_use_palette_color = 0;
  uw_end_modal_present();
}


// was FUN_00037d6c -- for illustration page param_1, opens its cutscene script (its name built from
// param_1's octal digits via the same template as babl_render_op_show_code), and only if every file
// operation succeeds, shows the page via display_book_or_scroll_page.
/* Real arity is 2: ARM 0x6fed4-0x6fee0 and 0x6feec-0x6ff00 (both call sites) set only r0/r1, and
   Ghidra's param_3/param_4 were just the unwritten r2/r3 spilled into stack slots that nothing read. */
void record_illustration_discovery_and_display(uint page_id, uint flags)
{
  char *wptr_22113;
  char stack0xffdc383c_buf [256];
  char *stack0xffdc383c_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  /* ARM copies the template to sp+0, then writes digits at sp+3/4/5.
     Ghidra split this one filename into a huge array and small locals. */
  char acStack_144 [12];
  char acStack_12c [260];
  undefined4 uStack_c;
  
  pcVar2 = &DAT_00085460;
    wptr_22113 = acStack_144;
  uStack_c = flags;
  do {
    cVar1 = *pcVar2;
    *wptr_22113 = cVar1; wptr_22113 = wptr_22113 + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  acStack_144[3] = ((byte)((page_id & 0xffff) >> 6) & 7) + 0x30;
  acStack_144[4] = ((byte)((page_id & 0xffff) >> 3) & 7) + 0x30;
  acStack_144[5] = ((byte)page_id & 7) + 0x30;
  ce_memset(acStack_12c,0,0x104);
  pcVar2 = DAT_0023c698 ? (char *)&DAT_0023c698 : "\\CUTS";
    stack0xffdc383c_ptr = acStack_12c;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc383c_ptr = cVar1; stack0xffdc383c_ptr = stack0xffdc383c_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_12c,acStack_144);
  /* Use the installation path just assembled above. The host file wrapper
     resolves paths under --data-dir; the bare name omits CUTS. */
  iVar3 = open_existing_file_rw_alt(acStack_12c);
  iVar4 = seek_file_handle(iVar3,4,0);
  iVar5 = write_file_handle(iVar3,&uStack_c,2);
  iVar6 = write_file_handle(iVar3,&uStack_c,2);
  iVar7 = seek_file_handle(iVar3,4,1);
  iVar8 = write_file_handle(iVar3,&uStack_c,2);
  iVar9 = CloseHandle(iVar3);
  if ((((((iVar3 != -1 && iVar4 != -1) && iVar5 == 2) && iVar6 == 2) && iVar7 != -1) && iVar8 == 2)
      && iVar9 != 0) {
    display_book_or_scroll_page(page_id);
  }
}


// was FUN_0003b0e4 -- a run-length-style stream decompressor: reads successive op codes from the
// compressed input (read_rle_op_code, not yet named) and drives the output (param_1) from the input
// (param_2).
void decompress_rle_stream(byte *out_buffer, byte *input_stream)
{
  byte *pbVar1;
  uint uVar2;
  int iVar3;

  DAT_00201b54 = 0;
  DAT_00201b4c = 0;
  DAT_00201b58 = 0;
  DAT_00201b48 = 0;
  DAT_00201b44 = 0;
  DAT_00201b40 = out_buffer;
  DAT_00201b50 = input_stream;
  do {
    DAT_00201b3c = read_rle_op_code();
    if (DAT_00201b3c == 1000) {
      DAT_00201b48 = pack_byte_into_word(DAT_00201b48,*DAT_00201b50,0);
      DAT_00201b54 = DAT_00201b54 + 1;
      DAT_00201b50 = DAT_00201b50 + 1;
      DAT_00201b44 = pack_byte_into_word(DAT_00201b44,*DAT_00201b50,0);
      DAT_00201b50 = DAT_00201b50 + 1;
      DAT_00201b54 = DAT_00201b54 + 1;
      iVar3 = 0;
      if (DAT_00201b48 != 0) {
        do {
          *DAT_00201b40 = (char)DAT_00201b44;
          iVar3 = iVar3 + 1;
          DAT_00201b40 = DAT_00201b40 + 1;
          DAT_00201b4c = DAT_00201b4c + 1;
        } while (iVar3 < (int)(uint)DAT_00201b48);
      }
    }
    else if (DAT_00201b3c == 0x3e9) {
      DAT_00201b48 = pack_byte_into_word(DAT_00201b48,(DAT_00201b48 & 0xff) + 0x80,0);
      if ((char)DAT_00201b48 == '\0') {
        uVar2 = pack_byte_into_word(DAT_00201b44,*DAT_00201b50,0);
        pbVar1 = DAT_00201b50 + 1;
        DAT_00201b50 = DAT_00201b50 + 2;
        uVar2 = uVar2 & 0xff | (uint)*pbVar1 << 8;
        DAT_00201b44 = (short)uVar2;
        DAT_00201b54 = DAT_00201b54 + 2;
        if (DAT_00201b44 < 1) {
          rle_op_handle_short_run();
        }
        else {
          DAT_00201b40 = DAT_00201b40 + uVar2;
          DAT_00201b4c = DAT_00201b4c + uVar2;
        }
      }
      else {
        DAT_00201b40 = DAT_00201b40 + DAT_00201b48;
        DAT_00201b4c = (uint)DAT_00201b48 + DAT_00201b4c;
      }
    }
    else if (DAT_00201b3c == 0x3ea) {
      ce_memmove(DAT_00201b40,DAT_00201b50,DAT_00201b48);
      uVar2 = (uint)DAT_00201b48;
      DAT_00201b40 = DAT_00201b40 + uVar2;
      DAT_00201b50 = DAT_00201b50 + uVar2;
      DAT_00201b4c = uVar2 + DAT_00201b4c;
      DAT_00201b54 = uVar2 + DAT_00201b54;
    }
  } while (DAT_00201b58 == 0);
}



// was FUN_0003b31c -- merges a byte into one half of a 16-bit value: param_3==0 replaces the low
// byte of param_1 with param_2's low byte (keeping param_1's high byte); nonzero replaces the high
// byte instead.
uint pack_byte_into_word(uint word, uint byte_value, int high_half)
{
  uint uVar1;

  if (high_half == 0) {
    uVar1 = word & 0xff00 | byte_value & 0xff;
  }
  else {
    uVar1 = word & 0xff | (byte_value & 0xff) << 8;
  }
  return uVar1;
}


// was FUN_0003b344 -- reads the next op code from decompress_rle_stream's input stream: a zero byte
// maps to op 1000 (byte-fill run); a nonzero byte with its top bit set maps to op 0x3e9; otherwise
// op 0x3ea. See decompress_rle_stream's own comment for what each op does.
uint read_rle_op_code()

{
  uint uVar1;
  bool bVar2;

  uVar1 = pack_byte_into_word(DAT_00201b48,*DAT_00201b50,0);
  DAT_00201b48 = (short)uVar1;
  DAT_00201b50 = DAT_00201b50 + 1;
  bVar2 = (uVar1 & 0xffff) == 0;
  if (bVar2) {
    uVar1 = 1000;
  }
  DAT_00201b54 = DAT_00201b54 + 1;
  if (!bVar2) {
    if ((char)uVar1 < '\0') {
      uVar1 = 0x3e9;
    }
    else {
      uVar1 = 0x3ea;
    }
  }
  return uVar1;
}


// was FUN_0003b3a8 -- decompress_rle_stream's op-0x3e9 handler (a "short run" variant): if the
// accumulated fill value (DAT_00201b44) is 0, marks the stream done (rle_op_mark_stream_done);
// otherwise recomputes the run length and, for shorter runs (<0x40)...
void rle_op_handle_short_run()

{
  int uw_ord2005_rem_104 = 0;
  ushort uVar1;
  int extraout_r1;

  if (DAT_00201b44 == 0) {
    rle_op_mark_stream_done();
  }
  else if (DAT_00201b58 == 0) {
    uVar1 = (DAT_00201b44 >> 8) + 0x80;
    DAT_00201b48 = DAT_00201b44 & 0xff | uVar1 * 0x100;
    if ((uVar1 & 0xff) < 0x40) {
      uw_ord2005_rem_104 = ((int)(DAT_00201b54)) % (2);
      if (uw_ord2005_rem_104 != 0) {
        *DAT_00201b40 = *DAT_00201b50;
        DAT_00201b40 = DAT_00201b40 + 1;
        DAT_00201b4c = DAT_00201b4c + 1;
        DAT_00201b50 = DAT_00201b50 + 1;
        DAT_00201b54 = DAT_00201b54 + 1;
        DAT_00201b48 = DAT_00201b48 - 1;
      }
      rle_op_copy_pairs_even();
    }
    else {
      rle_op_fill_doubled_byte_even();
    }
  }
  return;
}



// was FUN_0003b48c -- copies DAT_00201b48/2 byte-pairs from input to output (direct copy, not a
// fill); if the run length's low bit is set, delegates to rle_op_copy_pairs_odd for one extra
// trailing byte, otherwise finalizes via rle_op_finalize_length.
void rle_op_copy_pairs_even()

{
  ushort uVar1;
  int iVar2;

  if (DAT_00201b58 == 0) {
    uVar1 = DAT_00201b48 & 1;
    DAT_00201b48 = DAT_00201b48 >> 1;
    if (uVar1 == 0) {
      iVar2 = 0;
      if (DAT_00201b48 != 0) {
        do {
          iVar2 = iVar2 + 1;
          *DAT_00201b40 = *DAT_00201b50;
          DAT_00201b40[1] = DAT_00201b50[1];
          DAT_00201b4c = DAT_00201b4c + 2;
          DAT_00201b40 = DAT_00201b40 + 2;
          DAT_00201b50 = DAT_00201b50 + 2;
          DAT_00201b54 = DAT_00201b54 + 2;
        } while (iVar2 < (int)(uint)DAT_00201b48);
      }
      rle_op_finalize_length();
    }
    else {
      rle_op_copy_pairs_odd();
    }
  }
  return;
}



// was FUN_0003b54c -- rle_op_copy_pairs_even's odd-length tail: copies
// the same byte-pairs, then one final single byte, before finalizing.
void rle_op_copy_pairs_odd()

{
  int iVar1;

  iVar1 = 0;
  if (DAT_00201b48 != 0) {
    do {
      iVar1 = iVar1 + 1;
      *DAT_00201b40 = *DAT_00201b50;
      DAT_00201b40[1] = DAT_00201b50[1];
      DAT_00201b4c = DAT_00201b4c + 2;
      DAT_00201b40 = DAT_00201b40 + 2;
      DAT_00201b50 = DAT_00201b50 + 2;
      DAT_00201b54 = DAT_00201b54 + 2;
    } while (iVar1 < (int)(uint)DAT_00201b48);
  }
  *DAT_00201b40 = *DAT_00201b50;
  DAT_00201b40 = DAT_00201b40 + 1;
  DAT_00201b4c = DAT_00201b4c + 1;
  DAT_00201b50 = DAT_00201b50 + 1;
  DAT_00201b54 = DAT_00201b54 + 1;
  rle_op_finalize_length();
  return;
}



// was FUN_0003b608 -- fills output with a doubled byte value (read once from input, replicated into
// both halves of DAT_00201b44) in byte-pairs; if the run length's low bit is set, delegates to
// rle_op_fill_doubled_byte_odd for one extra trailing byte...
void rle_op_fill_doubled_byte_even()

{
  int uw_ord2005_rem_105 = 0;
  ushort uVar1;
  undefined1 uVar2;
  int extraout_r1;
  int iVar3;

  DAT_00201b48 = DAT_00201b48 & 0xff | ((DAT_00201b48 >> 8) - 0x40) * 0x100;
  uVar2 = pack_byte_into_word(DAT_00201b44,*DAT_00201b50,0);
  DAT_00201b50 = DAT_00201b50 + 1;
  DAT_00201b54 = DAT_00201b54 + 1;
  DAT_00201b44 = CONCAT11(uVar2,uVar2);
  uw_ord2005_rem_105 = ((int)(DAT_00201b4c)) % (2);
  if (uw_ord2005_rem_105 != 0) {
    *DAT_00201b40 = uVar2;
    DAT_00201b40 = DAT_00201b40 + 1;
    DAT_00201b4c = DAT_00201b4c + 1;
    DAT_00201b48 = DAT_00201b48 - 1;
  }
  uVar1 = DAT_00201b48 & 1;
  DAT_00201b48 = DAT_00201b48 >> 1;
  if (uVar1 == 0) {
    iVar3 = 0;
    if (DAT_00201b48 != 0) {
      do {
        iVar3 = iVar3 + 1;
        *DAT_00201b40 = (char)DAT_00201b44;
        DAT_00201b40[1] = (char)((ushort)DAT_00201b44 >> 8);
        DAT_00201b4c = DAT_00201b4c + 2;
        DAT_00201b40 = DAT_00201b40 + 2;
      } while (iVar3 < (int)(uint)DAT_00201b48);
    }
    rle_op_finalize_length();
  }
  else {
    rle_op_fill_doubled_byte_odd();
  }
  return;
}



// was FUN_0003b770 -- rle_op_fill_doubled_byte_even's odd-length
// tail: fills the same doubled-byte pairs, then one final single
// byte (the high half of DAT_00201b44), before finalizing.
void rle_op_fill_doubled_byte_odd()

{
  int iVar1;

  iVar1 = 0;
  if (DAT_00201b48 != 0) {
    do {
      iVar1 = iVar1 + 1;
      *DAT_00201b40 = (char)DAT_00201b44;
      DAT_00201b40[1] = (char)((ushort)DAT_00201b44 >> 8);
      DAT_00201b4c = DAT_00201b4c + 2;
      DAT_00201b40 = DAT_00201b40 + 2;
    } while (iVar1 < (int)(uint)DAT_00201b48);
  }
  *DAT_00201b40 = (char)((ushort)DAT_00201b44 >> 8);
  DAT_00201b40 = DAT_00201b40 + 1;
  DAT_00201b4c = DAT_00201b4c + 1;
  rle_op_finalize_length();
  return;
}



// was FUN_0003b7f4 -- masks the run-length state back down to its low
// byte once a run has been fully emitted.
void rle_op_finalize_length()

{
  DAT_00201b48 = DAT_00201b48 & 0xff;
  return;
}



// was FUN_0003b80c -- marks the decompression stream as finished.
void rle_op_mark_stream_done()

{
  DAT_00201b58 = 1;
  return;
}


// was FUN_00048e8c -- handles "read" on a sign/book/scroll object: prints a fixed scroll message
// for sign class 0x13b; for an illustrated book/scroll (quality bit 0x400) opens the picture page
// via display_book_or_scroll_page...
void read_object_text(ushort *object, short mode)
{
  char *wptr_31881;
  char cVar1;
  ushort uVar2;
  ushort uVar3;
  short sVar4;
  undefined *puVar5;
  char *pcVar6;
  int iVar7;
  char acStack_85d54 [548072];
  char acStack_6c [100];
  
  if (0 < mode) {
    uVar2 = *object;
    if ((uVar2 & 0x1ff) == 0x13b) {
      print_scroll_message_by_id(0x97);
    }
    else if (((uVar2 & 0x1000) == 0) || ((uVar2 & 0x1c0) == 0x140)) {
      uVar3 = object[3];
      if ((uVar2 & 0x400) == 0) {
        if ((uVar3 & 0x7fc0) < 0x3fc1) {
          pcVar6 = s_You_read_the_00085ce8;
    wptr_31881 = acStack_85d54;
          do {
            cVar1 = *pcVar6;
            *wptr_31881 = cVar1; wptr_31881 = wptr_31881 + 1;
            pcVar6 = pcVar6 + 1;
          } while (cVar1 != '\0');
          iVar7 = ce_strlen(acStack_6c);
          sVar4 = build_object_display_name(acStack_6c + iVar7,object,0,0);
          if (sVar4 == 0) {
            ce_strcat(acStack_6c,s_UNNAMED_00084f24);
          }
          ce_strcat(acStack_6c,&DAT_00085ce0);
          message_scroll_print_wrapped(acStack_6c);
          message_scroll_print_wrapped(get_message_string(object[3] >> 6 | 0x600));
          puVar5 = &s_scroll_newline_0008522c;
        }
        else {
          puVar5 = (undefined *)get_message_string(uVar3 >> 6 | 0x600);
        }
        message_scroll_print_wrapped(puVar5);
      }
      else {
        display_book_or_scroll_page((object[3] >> 6 & 0x1ff) + 0x100);
      }
    }
  }
}


/* Recovered by disassembling the original UU.exe (same method as
   chrbtns_bump_alloc_entry/chrbtns_offset_table_builder -- see their comment)... */
void *converse_res_bump_alloc_entry(uint byte_count)
{
  char *old = DAT_00100670;
  DAT_00100670 = DAT_00100670 + byte_count;
  return old;
}

/* Recovered the same way: load_gr_resource_entries's post-process callback for the same resource
   loads. */
int converse_res_slot_store_callback(void *entry_ptr, uint slot, int size)
{
  char *entry = (char *)entry_ptr;
  int idx = (short)(size & 0xffff);
  DAT_00100728_backing[idx] = entry + 5;
  return (slot == 0) ? 0 : 1;
}


// was LAB_0001a120 -- default placeholder handler installed into every
// slot of build_babl_symbol_table's builtin function-pointer table
int babl_builtin_default_handler()

{
  /* Ghidra couldn't resolve this address into a proper function (an indirect-jump/jumptable target
     it gave up on). */
  return 0;
}

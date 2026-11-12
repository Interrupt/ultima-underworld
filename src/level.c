/* Level loading: the object-table arena init/reset, per-level object table load, and the top-level
   "enter dungeon view"/"load level" entry points. Split out of uw.c (the original monolithic
   decompile) once these functions' real roles were confirmed. */
#include "headers/level.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

short DAT_00201b68;
char *g_selected_object;
/* Sizing-audit pass: both ce_memmove sites copy exactly 0x300 (768)
   bytes, bidirectionally -- HARD exact bound (256-entry VGA palette,
   3 bytes/entry). Down from 1536. */
undefined1 DAT_00088d98_backing[768];
short DAT_00201c7c;
undefined2 DAT_00201c90;
undefined2 DAT_00201c8c;
/* DAT_00085668_backing/DAT_00085668/DAT_000856a4 macros now live in uw.h (DAT_000856a4 aliases into
   the same table at entry 15, byte offset 15*8 -- Ghidra's own decompile of the real UU.exe shows
   this used as `&DAT_000856a4 + mode*0x80`, i.e. "entry 15 of whichever mode")... */
static char s__DATA_main_byt_000857a8[] = "\\DATA\\main.byt";
undefined4 DAT_002029d0;
/* Both were `int` -- real 64-bit pointers (DAT_002046a8/DAT_0020469c, both `char *`) stored through
   a 32-bit global truncate them on this host. */
static char *DAT_002046ac;
static char *DAT_002046a0;
char *DAT_0024cff4;

bool g_new_game_entry_pause_pending = false;






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// Blits \DATA\main.byt (the HUD frame bitmap) over the whole screen -- the first step of entering the
// dungeon view, split out so the fullscreen view can redraw the HUD when it is turned off.
void draw_dungeon_hud_backdrop()
{
  char *path_cursor;
  char path_char;
  char *install_dir;
  int loaded;
  char main_byt_path[264];

  ce_memset(main_byt_path,0,0x104);
  install_dir = &DAT_0023cca8;
  path_cursor = main_byt_path;
  do {
    path_char = *install_dir;
    *path_cursor = path_char;
    path_cursor = path_cursor + 1;
    install_dir = install_dir + 1;
  } while (path_char != '\0');
  ce_strcat(main_byt_path,s__DATA_main_byt_000857a8);
  loaded = blit_fullscreen_bitmap_file(0xffffffff,main_byt_path,0);
  if (loaded == 0) {
    report_fatal_error_and_exit(0x300b);
  }
}



// was enter_dungeon_view -- 3D dungeon-view entry transition (fade out, load PALS.DAT
// bank 0, redraw dungeon, fade in)
// was FUN_0003bd50
void enter_dungeon_view()
{
  undefined1 saved_palette[768];

  decrement_cursor_hide_depth();
  dirty_rect_union(0,200,0,0x140);
  unregister_game_view_interact_zones();
  configure_dungeon_viewport(0x34,0x14,0xab,0x70);
  ce_memmove(saved_palette,&DAT_00088d98,0x300);
  fade_out(g_uw_framebuffer,saved_palette,0);
  if (g_new_game_entry_pause_pending) {
    g_new_game_entry_pause_pending = false;
    /* Intentional deviation: hold the black screen for 0.5 seconds after
       character creation before drawing/fading in the dungeon. Ordinary
       level loads and returns from other views do not get this pause. */
    Sleep(500);
  }
  load_pals_bank(0,saved_palette);
  /* load_pals_bank loads PALS.DAT bank 0 (the 3D dungeon-view palette -- cf. set_palette_bank(0) at
     the game-mode switch) into the local saved_palette and installs it, but leaves the global
     DAT_00088d98 holding whatever bank the main menu last loaded (bank 2). */
  ce_memmove(&DAT_00088d98,saved_palette,0x300);
  draw_dungeon_hud_backdrop();
  enter_dungeon_view_hud_init();
  set_pending_update_flags(0x7dfe);
  refresh_player_equipment_effects();
  full_dungeon_redraw();
  weapon_overlay_and_full_redraw();
  cursor_show_idle_tick();
  fade_in(g_uw_framebuffer,saved_palette,0);
}




// was FUN_00049960
int init_level_object_arena()
{
  if (DAT_002029cc == 0) {
    /* Widened by 0x3a bytes: 28 backpack/equipment slots * 2 bytes (0x38) plus
       g_current_container_link's own 2 bytes, both now reserved at this buffer's tail -- see
       reset_level_object_arena and g_equipped_items's/ g_current_container_link's own comments. */
    /* HACK: not original behaviour -- a zeroed margin of two tile rows (0x200 bytes) on each side of the arena. The
       visibility flood reads the tile beside a ray's tile without a bounds check, so a ray on the map's edge reads past
       the tile map; zero bytes are solid tiles, which stops it. The game never has a ray there, but the level editor's
       Far Sight camera can fly outside the map's outer ring. The arena itself (DAT_002029cc) starts after the margin. */
    char *arena_block = ce_malloc(0x200 + 0x7c08 + 0x3a + 0x180 + 0x200);
    DAT_002029cc = arena_block != 0 ? arena_block + 0x200 : 0;
    if (DAT_002029cc == 0) {
      report_categorized_fatal_error(0x1002);
    }
  }
  reset_level_object_arena();
  return 1;
}




// was FUN_000499c0
int load_level_object_table(byte *archive_handle, int level_number)
{
  short objects_loaded;
  char *arena;
  short *magic_marker;
  byte archive[16];

  if (archive_handle == NULL) {
    if (!open_level_archive(archive, s__SAVE0_lev_ark_000842fc)) return 0;
  }
  else {
    /* The archive handle is a 16-byte record. Ghidra's pointer-as-loop-
     * counter copy only copied 15 bytes and required int/pointer casts. */
    memcpy(archive, archive_handle, sizeof(archive));
  }
  arena = DAT_002029cc;
  magic_marker = (short *)(DAT_002029cc + 0x7c06);
  *magic_marker = 0;
  read_archive_entry(archive,level_number + -1,DAT_002029cc);
  if (*magic_marker == 0x7577) {
    DAT_002046a8 = DAT_002046a4 + *(short *)(arena + 0x7c02) * 2;
    DAT_0020469c = DAT_002046bc + *(short *)(arena + 0x7c04) * 2;
    DAT_002046c8 = DAT_002046c0 + *(short *)(arena + 0x7c00);
    DAT_002029d0 = 0;
  }
  else {
    report_fatal_error_and_exit(3);
  }
  objects_loaded = scheduler_load(archive,level_number);
  if (archive_handle == (undefined1 *)0x0) {
    close_level_archive(archive);
  }
  return (int)objects_loaded;
}




// was FUN_00052960
void reset_level_object_arena()
{
  ushort *free_list_cursor;
  uw_tile_t *tile_record = (uw_tile_t *)DAT_002029cc;
  int index = 0;

  do {
    tile_record->obj_head = 0;
    index = (index + 1) * 0x10000 >> 0x10;
    tile_record = tile_record + 1;
  } while (index < 0x1000);
  DAT_002046b8 = DAT_002029cc + 0x4000;
  DAT_002046c4 = DAT_002029cc + 0x5b00;
  free_list_cursor = (ushort *)(DAT_002029cc + 0x7300);
  DAT_002046a8 = DAT_002029cc + 0x74fa;
  DAT_002046bc = DAT_002029cc + 0x74fc;
  DAT_0020469c = DAT_002029cc + 0x7afa;
  /* g_backpack_slot_table lives in this same arena buffer, in the 0x38 bytes
     init_level_object_arena added past the buffer's old real end... */
  g_backpack_slot_table = DAT_002029cc + 0x7c08;
  /* g_scheduler_table lives in this same arena buffer too, right after g_backpack_slot_table's own
     0x3a-byte reservation -- see DAT_00250778's own comment for the full explanation... */
  g_scheduler_table = DAT_002029cc + 0x7c08 + 0x3a;
  index = 2;
  DAT_002046a0 = DAT_0020469c;
  DAT_002046a4 = (char *)free_list_cursor;
  DAT_002046ac = DAT_002046a8;
  /* Both allocator free lists contain 16-bit slot IDs. A byte cursor
     left the stationary list uninitialized until a level archive loaded. */
  do {
    *free_list_cursor = (ushort)index;
    index = (index + 1) * 0x10000 >> 0x10;
    free_list_cursor = free_list_cursor + 1;
  } while (index < 0x400);
  if (g_player_object != 0) {
    g_player_object->hdr.next = 0;
    g_player_object->hdr.link = 0;
    reset_equipment_and_container_state();
  }
  g_scheduler_count = 0;
  DAT_002046c0 = DAT_002046a0 + 2;
  DAT_002046c8 = DAT_002046a0 + 2;
}




// was FUN_0006bc28
int load_level(int level_number)
{
  return load_level_from_archive(level_number, s__SAVE0_lev_ark_000842fc);
}

/* load_level for any level archive path: the level editor reads a level from the master DATA\LEV.ARK this way, so the
   game's save slot is left alone. */
int load_level_from_archive(int level_number, char *archive_path)
{
  int result;
  byte archive[16];

  write_player_save_record(0);
  if (-1 < DAT_00202080) {
    DAT_00202080 = -1;
  }
  uw_test_hook_pre_level_load(level_number);
  if (open_level_archive(archive,archive_path) == 0) {
    return 0;
  }
  result = (int)(short)load_level_object_table(archive,level_number);
  load_player_save_record(0);
  if (0 < result) {
    load_level_texture_ids(archive,level_number);
    clear_automap_reveal_buffer();
    reset_npc_path_cache();
    clear_last_attacker_record();
    if (result == 1) {
      load_automap_reveal_from_archive(archive,level_number);
    }
  }
  close_level_archive(archive);
  return result;
}







// was FUN_0006c79c -- level-transition entry point: cancels any held cursor item (same "drop what
// you're holding" guard as elsewhere), snapshots the leaving level's special per-level state
// (save_or_restore_level_special_state(param_1, 1)), commits the leaving level to its save slot...
int transition_to_level(int from_level, int to_level)
{
  int committed;
  int result;

  cancel_weapon_swing();
  if ((g_cursor_holding_state == 2) && (g_selected_object != 0)) {
    g_cursor_holding_state = 0;
    g_selected_object = 0;
    pop_cursor_icon(3);
  }
  save_or_restore_level_special_state(from_level,1);
  committed = commit_level_to_save_slot(from_level);
  result = 0;
  if (committed != 0) {
    result = (int)(short)load_level(to_level);
    if (result != 0) {
      save_or_restore_level_special_state(to_level,0);
    }
  }
  return result;
}






// was FUN_0006c834 -- saves (param_2==1) or restores (param_2==0) a leaving/entering level's
// special transient per-level state, called from transition_to_level around
// commit_level_to_save_slot/load_level.
void save_or_restore_level_special_state(short level_number, short mode)
{
  if (((*(byte *)(DAT_00086df8 + 0x60) & 0x10) == 0) || (mode != 0)) {
    if (mode == 0) {
      clear_last_attacker_record();
    }
    else if (mode == 1) {
      advance_mobile_objects();
    }
    if (level_number == 7) {
      if ((*(byte *)(DAT_00086df8 + 0x60) & 0x20) == 0) {
        if (mode == 0) {
          *(undefined1 *)(DAT_00086df8 + 0xb0) = *(undefined1 *)(DAT_00086df8 + 0x38);
          *(undefined1 *)(DAT_00086df8 + 0x38) = 0;
          *(undefined1 *)(DAT_00086df8 + 0x37) = 0;
          update_level7_floor_hazard_state(*(byte *)(DAT_00086df8 + 0x62) >> 4 & 1);
        }
        else if (mode == 1) {
          *(undefined1 *)(DAT_00086df8 + 0x38) = *(undefined1 *)(DAT_00086df8 + 0xb0);
          *(byte *)(DAT_00086df8 + 0x37) = *(byte *)(DAT_00086df8 + 0xb0) >> 2;
        }
      }
    }
    else if (level_number == 9) {
      if (mode == 0) {
        *(char *)(DAT_00086df8 + 0xb0) = (char)DAT_00086b20;
        DAT_00086b20 = 0;
      }
      else if (mode == 1) {
        DAT_00086b20 = (uint)*(byte *)(DAT_00086df8 + 0xb0);
      }
      else if (mode == 3) {
        DAT_00086b20 = 0;
      }
    }
  }
  else {
    reset_level_arena_and_invalidate(0);
  }
}






// was FUN_0007129c -- rolls for and triggers one of several as-yet- untriggered special per-level
// dialog/effect ids (tracked as bits in the 16-bit DAT_00086df8+0x6e mask): picks a candidate id...
int trigger_random_level_special_event(short chance_scale)
{
  int uw_ord2005_rem_143 = 0;
  undefined4 random_value;
  int divmod_remainder;
  uint triggered_mask = (uint)*(short *)(DAT_00086df8 + 0x6e);
  int event_id = -1;
  uint clock_now;

  if ((triggered_mask & 1) == 1) {
    if ((DAT_00201b68 < 2) || ((triggered_mask & 2) == 2)) {
      if ((triggered_mask & 4) == 4) {
        event_id = 2;
      }
      else if ((triggered_mask & 8) == 8) {
        event_id = 3;
      }
    }
    else {
      event_id = 1;
    }
  }
  else {
    event_id = 0;
  }
  if ((short)event_id < 0) {
    random_value = ce_rand();
    divmod_remainder = ordint_divmod((chance_scale + 1) * 4, random_value).rem;
    if (divmod_remainder == 0) {
      random_value = ce_rand();
      uw_ord2005_rem_143 = ((int)(random_value)) % (6);
      event_id = uw_ord2005_rem_143 + 4;
      if ((triggered_mask & 1 << (event_id * 0x10000 >> 0x10 & 0xffU)) != 0) {
        event_id = -1;
      }
    }
  }
  if (((short)event_id < 0) || ((*(byte *)(DAT_00086df8 + 0x62) & 8) != 0)) {
    /* Nothing triggered: just burn a short delay. */
    event_id = read_realtime_clock_units();
    do {
      clock_now = read_realtime_clock_units();
    } while (clock_now < event_id + 0x180U);
    return 0;
  }
  display_book_or_scroll_page(event_id + 0x18);
  triggered_mask = (uint)*(ushort *)(DAT_00086df8 + 0x6e) ^ 1 << ((int)(short)event_id & 0xffU) & 0xffffU;
  *(char *)(DAT_00086df8 + 0x6e) = (char)triggered_mask;
  *(char *)(DAT_00086df8 + 0x6f) = (char)(triggered_mask >> 8);
  return 1;
}


// was FUN_000396a0 -- teleports object param_1 to tile (param_2,param_3) on level param_4.
// Confirmed as the "teleporter trap" handler (dispatch_trap_type_effect's case 1, teleporting the
// current trigger object DAT_0024cff4 to a trap-record-specified tile/level).
int teleport_object_to_level_tile(void *object_ptr, int tile_x, int tile_y, short level_number)
{
  ushort *object = (ushort *)object_ptr;
  short current_level = DAT_00201b68;
  int placed;
  short placed_x;
  short placed_y;

  if ((level_number != DAT_00201b68) && (object != g_player_object)) {
    return 2;
  }
  if (((level_number == 0) || (level_number == DAT_00201b68)) &&
     (((short)tile_x != 0x3f && ((short)tile_y != 0x3f)))) {
    placed = find_placement_via_tile_flood_fill(object, tile_x, tile_y, &placed_x, &placed_y, 0);
    if (placed == 0) {
      return 2;
    }
    tile_x = (int)placed_x;
    tile_y = (int)placed_y;
    level_number = current_level;
  }
  if (object == g_player_object) {
    DAT_00201c90 = (undefined2)tile_x;
    DAT_00201c8c = (undefined2)tile_y;
    DAT_00201c7c = level_number;
    set_pending_update_flags(0x20);
  }
  return 0x10;
}


// was FUN_0003bc1c -- hard-resets the level object arena (reset_level_object_arena), flushes a
// redraw, and invalidates DAT_00202080 (a loaded-level data marker).
void reset_level_arena_and_invalidate(int reserved)
{
  reset_level_object_arena();
  set_pending_update_flags(2);
  DAT_00202080 = 0xffff;
}


// was FUN_000499a4 -- frees g_level_tiles (DAT_002029cc) if currently
// allocated, without clearing the pointer itself (callers are
// expected to overwrite it right after, e.g. on loading a new level).
void free_level_tile_arena()
{
  if (DAT_002029cc != 0) {
    LocalFree(DAT_002029cc - 0x200);   /* the block starts at the zeroed margin (see init_level_object_arena) */
  }
}

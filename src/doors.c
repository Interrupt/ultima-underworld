/* Door open/close/toggle handlers and the doors.GR frame-buffer allocator.
   close_door_object/open_door_object/toggle_door_object were originally
   FUN_0007c580/FUN_0007c708/FUN_0007c814... */
#include "headers/doors.h"
#include "headers/options.h"
#include <stdio.h>
#include <stdlib.h>

/* Ghidra rendered the embedded spaces as underscores and dropped the trailing newline. Real bytes
   at 0x87360 (ARM UU.exe .data, confirmed via tests/fixtures/static_strings.json's direct memory
   export): "At %d %d\n". */
static char s_At__d__d_00087360[] = "At %d %d\n";

// was LAB_000415b4
void *alloc_door_frame_buffer(unsigned int byte_count)
{
  /* Ghidra couldn't resolve this address into a proper function (an indirect-jump/jumptable target
     it gave up on). */
  return ce_malloc(byte_count);
}




// was FUN_0007c580
void close_door_object(void *actor_ptr, ushort *door)
{
  char *actor = (char *)actor_ptr;
  ushort quality_word;
  ushort state;
  byte low_byte;
  undefined4 sound_id;

  if ((*door & 0x1ff) == 0x1cf) {
    quality_word = door[3];
    if ((quality_word & 0xf) < 8) {
      return;
    }
    *(byte *)(door + 3) = ((char)(quality_word & 0xf) - 8U ^ (byte)quality_word) & 0x3f ^ (byte)quality_word;
    *(byte *)((char *)door + 7) = (byte)(quality_word >> 8);
    adjust_door_close_animation_delay(door);
  }
  else {
    state = *door & 0xf;
    if (7 < state) {
      return;
    }
    quality_word = door[3];
    *(byte *)(door + 3) = (byte)(quality_word & 0xfffe);
    *(byte *)((char *)door + 7) = (byte)((quality_word & 0xfffe) >> 8);
    if (state != 6) {
      state = door[1];
      low_byte = (byte)state;
      *(byte *)(door + 1) = (low_byte + 0x18 ^ low_byte) & 0x7f ^ low_byte;
      *(byte *)((char *)door + 3) = (byte)(state >> 8);
    }
    trigger_object_trap_or_use_action(actor, door, 7, (int)DAT_002020a0, DAT_002020a4);
    schedule_door_open_animation(door);
  }
  sound_id = 0x14;
  if ((*door & 7) != 6) {
    sound_id = 0xb;
  }
  play_positional_sound_effect(sound_id, (uint)(*(byte *)((char *)door + 3) >> 5) + DAT_002020a0 * 8,
               (*(byte *)((char *)door + 3) >> 2 & 7) + DAT_002020a4 * 8, 0);
}



// was FUN_0007c708 -- confirmed live as the real "open door" builtin (see
// the door-quality analysis a few thousand lines up, near DAT_0018957a):
// a single guarded (quality & 0xf) + 8 step, closed(0-7) -> open(8-15).
void open_door_object(void *door_ptr)
{
  ushort *door = (ushort *)door_ptr;
  ushort quality_word;
  undefined4 sound_id;

  if ((*door & 0x1ff) == 0x1cf) {
    quality_word = door[3];
    if (7 < (quality_word & 0xf)) {
      return;
    }
    *(byte *)(door + 3) = ((char)(quality_word & 0xf) + 8U ^ (byte)quality_word) & 0x3f ^ (byte)quality_word;
    *(byte *)((char *)door + 7) = (byte)(quality_word >> 8);
    adjust_door_close_animation_delay(door);
  }
  else {
    if ((*door & 0xf) < 8) {
      return;
    }
    schedule_door_open_animation(door);
  }
  sound_id = 0x14;
  if ((*door & 7) != 6) {
    sound_id = 0xb;
  }
  play_positional_sound_effect(sound_id, (uint)(*(byte *)((char *)door + 3) >> 5) + DAT_002020a0 * 8,
               (*(byte *)((char *)door + 3) >> 2 & 7) + DAT_002020a4 * 8, 0);
}



// was FUN_0007c814 NOTE: for the object_id==0x1cf special-object branch inside
// close_door_object/open_door_object, this dispatch is provably always a no-op: closed(<8) routes
// to close_door_object, whose 0x1cf branch only proceeds when quality is ALREADY >=8...
void toggle_door_object(char *actor, void *door_ptr)
{
  byte *door = (byte *)door_ptr;
  if ((*door & 0xf) < 8) {
    close_door_object(actor, (ushort *)door);
  }
  else {
    open_door_object((ushort *)door);
  }
}







// was FUN_00071e20 -- disabled outright on level 9.
int spawn_scheduled_door_texture_object()
{
  ushort tile_word;
  byte position_high_bits;
  short tile_type;
  undefined4 slot_index;
  ushort *tile;
  int clearance;
  uw_object_hdr_t *door_texture;
  uint object_word;
  undefined2 object_word_low16;
  undefined1 object_word_high_byte;
  ushort target_y;
  ushort target_x;

  if (DAT_00201b68 == 9) {
    return 0xffffffff;
  }
  target_x = DAT_00204880 >> 5;
  target_y = DAT_00204882 >> 5;
  project_position_by_heading((int)DAT_00201c70 >> 8, 0xb, &target_x, &target_y);
  tile = (ushort *)tilemap_lookup((int)(short)target_x >> 3, (int)(short)target_y >> 3);
  tile_word = *tile;
  if (((tile_word & 0xf) == 1) &&
     (((((tile_type = (&DAT_0023adb8)[tile_word >> 10 & 0xf], 4 < tile_type && (tile_type < 0xc)) ||
        ((0x11 < tile_type && (tile_type < 0x17)))) || ((0x1a < tile_type && (tile_type < 0x20)))) ||
      ((0x22 < tile_type && (tile_type < 0x29)))))) {
    object_word = (tile_word >> 4 & 0xf) << 3;
    object_word_low16 = (undefined2)object_word;
    clearance = check_object_placement_clearance(0x1ca, 0, (int)(short)target_x, (int)(short)target_y,
                                                 object_word_low16, 0, 0);
    object_word_high_byte = (undefined1)((ushort)object_word_low16 >> 8);
    if (clearance != 0) {
      door_texture = spawn_new_object(0x1ca, 0);
      tile_word = door_texture->position_word;
      object_word = (tile_word ^ object_word) & 0x7f ^ (uint)tile_word;
      door_texture->zpos = object_word & 0x7f;
      position_high_bits = (byte)(((target_x & 7) << 0xd) >> 8);
      door_texture->xpos = target_x & 7;
      door_texture->ypos = target_y & 7;
      door_texture->doordir = 0x1;
      slot_index = encode_object_slot_index(door_texture);
      tile_type = scheduler_add_entry(slot_index, 0xffffffff, 0, (short)target_x >> 3 & 0xff,
                                      CONCAT11(object_word_high_byte, (char)((short)target_y >> 3)));
      if (tile_type != 0) {
        *(byte *)(DAT_00086df8 + 0x5e) =
             (byte)(((int)DAT_00201b68 & 0xfU) << 4) | *(byte *)(DAT_00086df8 + 0x5e) & 0xf;
        object_list_insert_head(tile + 1, door_texture);
        return 1;
      }
      free_object_slot(door_texture);
    }
  }
  return 0;
}






// was FUN_00072084 -- checks whether param_1 (a stored level number) matches the current level
// (DAT_00201b68); if so, decodes param_2's packed tile coordinates (find_object_in_world) and shows
// a debug "At X Y" message.
bool check_scheduled_object_level_match(short stored_level, ushort packed_tile)
{
  short tile_x = 0;
  short tile_y = 0;
  bool matches_current_level = stored_level == DAT_00201b68;

  DAT_00201c9c = 0;
  if (matches_current_level) {
    find_object_in_world((int)(short)packed_tile >> 6, (short)packed_tile >> 4 & 3, packed_tile & 0xf, &tile_x, &tile_y);
    debug_print(s_At__d__d_00087360, (int)tile_x, (int)tile_y);
    DAT_00201c90 = tile_x;
    DAT_00201c8c = tile_y;
  }
  return matches_current_level;
}



// was FUN_0007213c -- applies a bundle of player-state changes (hunger restoration scaled off the
// class base-stat row DAT_0023be74+4, the level-7 hazard byte, equipment flags)...
void apply_special_object_use_effect()
{
  char hunger_roll;
  int level_matches = check_scheduled_object_level_match(*(byte *)(DAT_00086df8 + 0x5e) >> 4, 0x1ca);
  uint masked_flags;

  if (level_matches != 0) {
    if (*(byte *)(DAT_0023be74 + 4) < 9) {
      g_player_object->npc_hp = *(byte *)(DAT_0023be74 + 4);
    }
    else {
      hunger_roll = rand_below(3);
      g_player_object->npc_hp = (byte)((-2 - hunger_roll) + *(char *)(DAT_0023be74 + 4));
    }
    *(undefined1 *)(DAT_00086df8 + 0x37) = *(undefined1 *)(DAT_00086df8 + 0x38);
    if (8 < *(byte *)(DAT_00086df8 + 0x38)) {
      *(byte *)(DAT_00086df8 + 0x37) =
           (-2 - (*(byte *)(DAT_00086df8 + 0x38) >> 3)) + *(char *)(DAT_00086df8 + 0x37);
    }
    g_player_object->animation_flags = g_player_object->animation_flags & 0xec | 0x2c;
    masked_flags = *(ushort *)(DAT_00086df8 + 0x5f) & 0xffc3;
    *(char *)(DAT_00086df8 + 0x5f) = (char)masked_flags;
    *(char *)(DAT_00086df8 + 0x60) = (char)(masked_flags >> 8);
    masked_flags = *(ushort *)(DAT_00086df8 + 0x5f) & 0xfc3f;
    *(char *)(DAT_00086df8 + 0x5f) = (char)masked_flags;
    *(char *)(DAT_00086df8 + 0x60) = (char)(masked_flags >> 8);
    refresh_player_equipment_effects();
    set_pending_music_track(4);
  }
}





// was FUN_0007c3f4 -- schedules a door's open animation: derives an animation type from the door's
// own low bits (a "portcullis"-style door, low 3 bits == 6, uses type 4; every other door type uses
// 5), sets the door's quality/state field, forces its type-id bits to 0x1cf...
void schedule_door_open_animation(ushort *door)
{
  ushort original_word = *door;
  ushort quality_word = door[3];
  byte quality_low_byte = (byte)quality_word;
  uint updated_word;
  undefined4 slot_index;
  undefined4 animation_type = 5;

  if ((original_word & 7) == 6) {
    animation_type = 4;
  }
  *(byte *)(door + 3) = ((byte)original_word ^ quality_low_byte) & 0x3f ^ quality_low_byte;
  *(char *)((char *)door + 7) = (char)(quality_word >> 8);
  updated_word = original_word & 0xffcf | 0x1cf;
  *(char *)door = (char)updated_word;
  *(char *)((char *)door + 1) = (char)(updated_word >> 8);
  /* HACK: was a bare `encode_object_slot_index();` -- dropped argument, same class as
     scheduler_tick's own `scheduler_finish_entry();` fix just above (see its comment).
     encode_object_slot_index's real signature takes the object pointer it encodes... */
  slot_index = encode_object_slot_index((uw_object_hdr_t *)door);
  scheduler_add_entry(slot_index, animation_type, 0, (undefined1)DAT_002020a0, (char)DAT_002020a4);
}





// was FUN_0007c4a8 -- companion to schedule_door_open_animation for closing a door: derives the
// same portcullis-aware animation type (4 vs 5), decrements the door's state field, and, if it
// already has a live scheduler entry...
void adjust_door_close_animation_delay(ushort *door)
{
  short delay;
  ushort door_word = *door;
  short animation_type = 5;

  if ((((door_word & 0x1c0) == 0x140) && ((door_word & 7) == 6)) ||
     (((door_word & 0x1c0) == 0x1c0 && ((door[3] & 7) == 6)))) {
    animation_type = 4;
  }
  if ((door_word & 0x1000) == 0) {
    door_word = ((door_word & 0xe00) - 0xe01 ^ door_word) & 0x1e00 ^ door_word;
  }
  else {
    door_word = door_word & 0xefff;
  }
  *(char *)door = (char)door_word;
  *(char *)((char *)door + 1) = (char)(door_word >> 8);
  delay = scheduler_get_delay(door);
  if (-1 < delay) {
    scheduler_set_delay(door, ((int)animation_type - (int)delay) * 0x10000 >> 0x10);
  }
}

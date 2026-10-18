"""Name mobile settling header stores without conflating extension layouts."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'settle_mobile_to_immobile'
ORIGINAL = r"""ushort *settle_mobile_to_immobile(ushort *object)
{
  ushort uVar1;
  undefined2 uVar2;
  bool bVar3;
  byte bVar4;
  byte bVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  int iVar8;
  char *pbTile;
  ushort *puVar9;
  int iVar10;
  short extraout_r1;
  short extraout_r1_00;
  uint uVar11;
  uint uVar12;
  byte bVar13;
  byte local_2c;
@BLANK@
  bVar3 = true;
  bVar13 = (byte) g_object_type_props[(((uw_object_hdr_t *)object)->object_id)].owner_flags >> 1 & 0xf;
  bVar5 = (((uw_mobile_object_t *)object)->movement_mode << 4);
  if (bVar5 == 0x10) {
    bVar13 = 8;
    spawn_scheduled_effect_object(object,6,3,0,0,DAT_0010144c,DAT_00101454);
  }
  else if ((((bVar5 == 0x20) && (bVar13 == 10)) && (DAT_00201b68 == 8)) &&
          ((uVar11 = (int)((int)DAT_0010144c - 0x20U) >> 0x1f,
           uVar12 = (int)((int)DAT_00101454 - 0x20U) >> 0x1f,
           (int)((((int)DAT_00101454 - 0x20U ^ uVar12) - uVar12) +
                (((int)DAT_0010144c - 0x20U ^ uVar11) - uVar11)) < 6 &&
           ((char)g_player_object->npc_hp != '\0')))) {
    if ((*(byte *)(DAT_00086df8 + 0x62) & 4) == 0) {
      uVar2 = *(undefined2 *)(DAT_00086df8 + 0x6e);
      *(byte *)(DAT_00086df8 + 0x6e) = (byte)uVar2 | 8;
      *(char *)(DAT_00086df8 + 0x6f) = (char)((ushort)uVar2 >> 8);
    }
    else {
      bVar13 = 8;
      bVar3 = false;
      *(char *)(DAT_00086df8 + 0x6d) = *(char *)(DAT_00086df8 + 0x6d) + -1;
      if (*(char *)(DAT_00086df8 + 0x6d) == '\0') {
        print_scroll_message_by_id(0x116);
        set_pending_update_flags(0x400);
      }
      else {
        uVar11 = ((uw_object_hdr_t *)object)->type_flags & 0xffc2 | 0x1c2;
        ((uw_object_hdr_t *)object)->type_flags = (ushort)uVar11;
        if (*(byte *)(DAT_00086df8 + 0x6d) < 9) {
          iVar8 = 8;
          do {
            bVar4 = ce_rand();
            uVar1 = ((uw_object_hdr_t *)object)->position_word;
            bVar5 = (byte)uVar1;
            ((uw_object_hdr_t *)object)->position_word_low = ((bVar4 & 7) + bVar5 + 4 ^ bVar5) & 0x7f ^ bVar5;
            ((uw_object_hdr_t *)object)->position_word_high = (byte)(uVar1 >> 8);
            uVar6 = ce_rand();
            uVar7 = ce_rand();
            /* Was `ordint_divmod(3,uVar6); ... extraout_r1_00` / same for uVar7/extraout_r1 -- the
               same fabricated-remainder bug fixed several times elsewhere this session (this port's
               old `long`-returning ordint_divmod never populated extraout_r1). */
            extraout_r1_00 = (short)ordint_divmod(3,uVar6).rem;
            iVar10 = (int)DAT_00101454;
            extraout_r1 = (short)ordint_divmod(3,uVar7).rem;
            spawn_effect_debris_burst(object,(int)DAT_0010144c + (int)extraout_r1_00 + -1,
                         iVar10 + extraout_r1 + -1);
            iVar8 = (iVar8 + -1) * 0x10000 >> 0x10;
          } while ((int)(uint)*(byte *)(DAT_00086df8 + 0x6d) <= iVar8);
        }
      }
    }
  }
  if (((bVar13 != 0) && (bVar13 < 9)) &&
     ((bVar5 = ce_rand(), (bVar5 & 7) < bVar13 &&
      (iVar8 = roll_object_destroy_chance(10,object), iVar8 != 0)))) {
    bVar3 = false;
  }
  if (DAT_00201b68 == 9) {
    bVar3 = false;
  }
  /* Was `iVar8 = tilemap_lookup(...); iVar8 = iVar8 + 2;` -- same pointer- truncation-into-`int`
     bug fixed in FUN_0004ad10 just above... */
  pbTile = (char *)tilemap_lookup((int)DAT_0010144c,(int)DAT_00101454);
  /* Off-map landing tile (a projectile carried past the map edge -- sync_object_tile_position
     already skipped its own unlink/insert on the same NULL). */
  if (pbTile == (char *)0x0) {
    discard_misplaced_object((char *)0x0,object,1);
    return (ushort *)0x0;
  }
  pbTile = pbTile + 2;
  if ((bVar3) && (puVar9 = (ushort *)alloc_object_slot(0), puVar9 != (ushort *)0x0)) {
    ((uw_object_hdr_t *)puVar9)->type_flags = ((uw_object_hdr_t *)object)->type_flags;
    ((uw_object_hdr_t *)puVar9)->position_word = ((uw_object_hdr_t *)object)->position_word;
    ((uw_object_hdr_t *)puVar9)->chain_word = ((uw_object_hdr_t *)object)->chain_word;
    ((uw_object_hdr_t *)puVar9)->link_word = ((uw_object_hdr_t *)object)->link_word;
    ((uw_object_hdr_t *)object)->link_word_low = ((uw_object_hdr_t *)object)->owner;
    ((uw_object_hdr_t *)object)->link_word_high = 0;
    uVar1 = ((uw_object_hdr_t *)puVar9)->type_flags;
    if ((uVar1 & 0x1c0) == 0x1c0) {
      scheduler_relink_entry(puVar9,object);
    }
    else if ((((uVar1 & 0x1f0) == 0x90) && (3 < (uVar1 & 0xf))) && ((uVar1 & 0xf) < 7)) {
      bVar5 = (byte)uVar1;
      ((uw_object_hdr_t *)puVar9)->type_flags_low = (bVar5 - 4 ^ bVar5) & 0xf ^ bVar5;
      ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)(uVar1 >> 8);
      set_ambient_bias_without_light(0);
    }
    uVar1 = ((uw_object_hdr_t *)puVar9)->chain_word;
    ((uw_object_hdr_t *)puVar9)->chain_word_low = ((uw_mobile_object_t *)object)->hit_points & 0x3f | (byte)(uVar1 & 0xffc0);
    ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)((uVar1 & 0xffc0) >> 8);
    uVar12 = (uint)(ushort)((uw_object_hdr_t *)puVar9)->type_flags;
    uVar11 = uVar12 & 0x1c0;
    if (((uVar11 != 0x140) && (uVar11 != 0x180)) &&
       ((g_object_type_props[(uVar12 & 0x1ff)].class_flags & 3) != 2)) {
      ((uw_object_hdr_t *)puVar9)->heading = ((uw_projectile_object_t *)object)->original_heading & 7;
      uVar11 = ((uw_object_hdr_t *)puVar9)->position_word;
    }
  }
  else {
    puVar9 = (ushort *)0x0;
  }
  if (bVar13 == 9) {
    if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) == 0x40) {
      local_2c = 0;
    }
    else {
      local_2c = ((uw_projectile_object_t *)object)->source_slot;
    }
  }
  discard_misplaced_object(pbTile,object,1);
  if (puVar9 != (ushort *)0x0) {
    object_list_insert_head(pbTile,puVar9);
  }
  if ((bVar13 == 9) &&
     (iVar10 = activate_area_hazard_object(puVar9,(int)DAT_0010144c,(int)DAT_00101454,local_2c), iVar10 == 0)) {
    puVar9 = (ushort *)discard_misplaced_object(pbTile,puVar9,0);
  }
  return puVar9;
}""".replace("@BLANK@", "  ")
REPLACEMENTS = [('ushort *puVar9;',
  'uw_object_hdr_t *puVar9;\n  uw_object_hdr_t *header = (uw_object_hdr_t *)object;'),
 ('((uw_object_hdr_t *)object)->type_flags = (ushort)uVar11;',
  '((uw_object_hdr_t *)object)->object_id = uVar11 & 0x1ff;'),
 ('((uw_object_hdr_t *)object)->position_word_low = ((bVar4 & 7) + bVar5 + 4 ^ bVar5) & 0x7f ^ '
  'bVar5;\n'
  '            ((uw_object_hdr_t *)object)->position_word_high = (byte)(uVar1 >> 8);',
  '((uw_object_hdr_t *)object)->zpos = ((bVar4 & 7) + bVar5 + 4) & 0x7f;'),
 ('puVar9 = (ushort *)alloc_object_slot(0)', 'puVar9 = alloc_object_slot(0)'),
 ('((uw_object_hdr_t *)object)->link_word_low = ((uw_object_hdr_t *)object)->owner;\n'
  '    ((uw_object_hdr_t *)object)->link_word_high = 0;',
  '((uw_object_hdr_t *)object)->link = 0;'),
 ('((uw_object_hdr_t *)puVar9)->type_flags_low = (bVar5 - 4 ^ bVar5) & 0xf ^ bVar5;\n'
  '      ((uw_object_hdr_t *)puVar9)->type_flags_high = (byte)(uVar1 >> 8);',
  '((uw_object_hdr_t *)puVar9)->object_id = (uVar1 & 0x1f0) | ((bVar5 - 4) & 0xf);'),
 ('((uw_object_hdr_t *)puVar9)->chain_word_low = ((uw_mobile_object_t *)object)->hit_points & 0x3f '
  '| (byte)(uVar1 & 0xffc0);\n'
  '    ((uw_object_hdr_t *)puVar9)->chain_word_high = (byte)((uVar1 & 0xffc0) >> 8);',
  '((uw_object_hdr_t *)puVar9)->quality = ((uw_mobile_object_t *)object)->hit_points & 0x3f;'),
 ('activate_area_hazard_object(puVar9,', 'activate_area_hazard_object((ushort *)puVar9,'),
 ('puVar9 = (ushort *)discard_misplaced_object(pbTile,puVar9,0);',
  'puVar9 = (uw_object_hdr_t *)discard_misplaced_object(pbTile,(ushort *)puVar9,0);'),
 ('return puVar9;', 'return (ushort *)puVar9;')]


def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    result = result.replace('((uw_object_hdr_t *)object)->', 'header->')
    result = result.replace('((uw_object_hdr_t *)puVar9)->', 'puVar9->')
    result = result.replace('puVar9 != (ushort *)0x0', 'puVar9 != (uw_object_hdr_t *)0x0')
    return result.replace('puVar9 = (ushort *)0x0', 'puVar9 = (uw_object_hdr_t *)0x0')


def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'settle-fields.json').write_text(generate())

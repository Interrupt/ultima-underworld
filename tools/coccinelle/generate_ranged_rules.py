"""Name ranged projectile fields while retaining complete ammo/header captures."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
FUNCTION = 'fire_ranged_weapon'
ORIGINAL = r"""void fire_ranged_weapon(short weapon_type)
{
  int iVar1;
  byte bVar2;
  char cVar3;
  ushort uVar4;
  undefined4 uVar5;
  ushort *puVar6;
  ushort *puVar7;
  uint uVar8;
@BLANK@
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
}""".replace("@BLANK@", "  ")


def converted():
    result = ORIGINAL
    a = '((uw_object_hdr_t *)puVar6)->'
    replacements = [
        ('ushort *puVar6;', 'uw_projectile_object_t *puVar6;'),
        ('ushort *puVar7;', 'uw_object_hdr_t *puVar7;'),
        ('puVar6 = (ushort *)spawn_object_near_player();', 'puVar6 = (uw_projectile_object_t *)spawn_object_near_player();'),
        ('puVar6 == (ushort *)0x0', 'puVar6 == (uw_projectile_object_t *)0x0'),
        ('puVar7 = (ushort *)extract_ammo_and_refresh', 'puVar7 = (uw_object_hdr_t *)extract_ammo_and_refresh'),
        (a+'type_flags = (ushort)uVar8;', 'puVar6->hdr.is_quant = (uVar8 >> 15) & 1;'),
        (a+'link_word_low = ((byte)'+a+'link_word ^ bVar2) & 0x3f ^ bVar2;\n      '+a+'link_word_high = (byte)(char)(uVar4 >> 8);',
         'puVar6->hdr.link = uVar4 >> 6;'),
        (a+'type_flags_low = (byte)(char)'+a+'type_flags;\n      '+a+'type_flags_high =\n          (bVar2 ^ '+a+'type_flags_high) & 0x1e ^ '+a+'type_flags_high;',
         'puVar6->hdr.flags_res = (bVar2 >> 1) & 7;\n      puVar6->hdr.enchanted = (bVar2 >> 4) & 1;'),
        (a+'link_word_low = ((byte)puVar7[3] ^ (byte)'+a+'link_word) & 0x3f ^ (byte)'+a+'link_word;\n      '+a+'link_word_high = '+a+'link_word_high;',
         'puVar6->hdr.owner = puVar7->owner;'),
        ('      '+a+'type_flags_low = (byte)(char)'+a+'type_flags;\n', ''),
    ]
    for before, after in replacements:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    result = result.replace('*puVar7 & 0x1c0', 'puVar7->object_id & 0x1c0').replace(
        '*puVar7 & 0x1ff', 'puVar7->object_id').replace('*puVar7', 'puVar7->type_flags')
    # Restore the declaration after replacing full-word dereferences.
    result = result.replace('uw_object_hdr_t puVar7->type_flags;', 'uw_object_hdr_t *puVar7;')
    result = result.replace('puVar7[3]', 'puVar7->link_word').replace(
        '*(byte *)((char *)puVar7 + 1)', '(byte)(puVar7->type_flags >> 8)')
    result = result.replace('((uw_object_hdr_t *)puVar7)->', 'puVar7->')
    result = result.replace(a, 'puVar6->hdr.').replace('((uw_projectile_object_t *)puVar6)->', 'puVar6->')
    return result


def generate():
    import json
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'ranged-fields.json').write_text(generate())

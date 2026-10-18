"""Name slot-fit headers, stack gates and extinguish/restore ID writes."""
from pathlib import Path
import json
HERE = Path(__file__).resolve().parent
FUNCTION = 'check_object_fits_in_slot'
ORIGINAL = r"""uint check_object_fits_in_slot(ushort *object, int slot)
{
  char *wptr_31150;
  ushort uVar1;
  uint uVar2;
  char cVar3;
  byte bVar4;
  ushort uVar5;
  byte bVar6;
  byte bVar7;
  uint uVar8;
  short sVar9;
  undefined1 *puVar10;
  ushort *puVar11;
  int iVar12;
  uw_armor_type_props_t *effect_ptr;
  char *container_rec;
  byte *pbVar13;
  char *pcVar14;
  int iVar15;
  bool bVar16;
  /* Was 544528 bytes -- same Ghidra stack-frame-size-miscalculation artifact already fixed in
     dispatch_object_action's acStack_85978 (see its own comment)... */
  char acStack_84f64 [64];
  short local_54 [2];
  int local_50;
  uint local_4c;
  const uw_object_type_props_t *local_48;
  char acStack_40 [28];
  char *_parentRec;
  undefined2 _savedLink;

  local_4c = (uint)(short)(*object & 0x1ff);
  local_48 = &g_object_type_props[local_4c];
  uVar1 = *object >> 6 & 7;
  uVar5 = ((byte)*object & 0x30) >> 4;
  bVar4 = (byte)*object & 0xf;
  iVar15 = (int)(short)slot;
  g_scratch_object_ptr = (uw_object_hdr_t *)object;
  if (iVar15 == 0x13) {
    if (g_current_container_record == 0) {
      return 0;
    }
    /* Both `g_current_container_record + 4` reads below were the legacy 4-byte "prev" field -- only
       ever a truncated half of a real 64-bit pointer (same class as the whole Update-29 sweep --
       search "still broken for genuine container nesting"). */
    _parentRec = *(char **)(g_current_container_record + 0x14);
    if (_parentRec == 0) {
      iVar15 = 0xb;
      do {
        if ((*(ushort *)(&g_equipped_items + iVar15 * 2) & 0xffc0) == 0) break;
        iVar15 = (iVar15 + 1) * 0x10000 >> 0x10;
      } while (iVar15 < 0x13);
      if ((short)iVar15 < 0x13) {
        return 1;
      }
      print_scroll_message_by_id(0x102);
      if ((short)iVar15 < 0x13) {
        return 1;
      }
      return 0;
    }
    _savedLink = g_current_container_link;
    g_current_container_link = *(undefined2 *)(_parentRec + 8);
    puVar11 = (ushort *)resolve_object_link(&g_current_container_link);
    g_current_container_link = _savedLink;
  }
  else {
    if (iVar15 < 0x14) {
      puVar10 = &g_equipped_items + iVar15 * 2;
      puVar11 = (ushort *)resolve_object_link(puVar10);
    }
    else {
      puVar11 = (ushort *)resolve_object_link(&g_equipped_items + iVar15 * 2);
      if ((puVar11 == (ushort *)0x0) || ((((uw_object_hdr_t *)puVar11)->object_id & 0x1f0) != 0x80)) {
        puVar11 = (ushort *)resolve_object_link(&g_current_container_link);
      }
    }
  }
  if (iVar15 < 5) {
    if (uVar1 != 0) {
      if (iVar15 != 0) {
        return 0;
      }
      sVar9 = use_food_item(g_player_object,object,0);
      if (sVar9 < 1) {
        return 0;
      }
      return 0xffffffff;
    }
    if (((byte)*object & 0x30) < 0x20) {
      return 0;
    }
    effect_ptr = (uw_armor_type_props_t *)get_scanned_object_class_effect_ptr();
    if (iVar15 == 0) {
      bVar16 = (char)effect_ptr->equipment_slot == '\b';
    }
    else if (iVar15 == 1) {
      bVar16 = (char)effect_ptr->equipment_slot == '\x01';
    }
    else if (iVar15 == 2) {
      bVar16 = (char)effect_ptr->equipment_slot == '\x04';
    }
    else if (iVar15 == 3) {
      bVar16 = (char)effect_ptr->equipment_slot == '\x03';
    }
    else {
      if (iVar15 != 4) {
        return 0;
      }
      bVar16 = (char)effect_ptr->equipment_slot == '\x05';
    }
LAB_00047a68:
    if (!bVar16) {
      return 0;
    }
    return 1;
  }
  if ((iVar15 == 9) || (iVar15 == 10)) {
    if (uVar1 != 0) {
      return 0;
    }
    if (((byte)*object & 0x30) < 0x20) {
      return 0;
    }
    effect_ptr = (uw_armor_type_props_t *)get_scanned_object_class_effect_ptr();
    bVar16 = (char)effect_ptr->equipment_slot == '\t';
    goto LAB_00047a68;
  }
  if ((iVar15 == 8 - (*(byte *)(DAT_00086df8 + 100) & 1)) && ((uVar1 == 0 && (uVar5 == 0)))) {
    if ((puVar11 != (ushort *)0x0) && ((((uw_object_hdr_t *)puVar11)->object_id) == local_4c)) {
      return 0;
    }
    if ((((*object & 0x8000) != 0) && ((object[3] & 0x8000) == 0)) &&
       (0x40 < (object[3] & 0xffc0))) {
      return 0;
    }
  }
  else {
    local_50 = (int)(short)uVar1;
    if ((local_50 == 2) && (((uVar5 == 1 && (3 < bVar4)) && (bVar4 < 8)))) {
      iVar12 = 0;
      do {
        if (iVar15 == (char)(&g_light_source_slots)[iVar12]) {
          return 1;
        }
        iVar12 = (iVar12 + 1) * 0x10000 >> 0x10;
      } while (iVar12 < 4);
      uVar1 = *object;
      bVar6 = (byte)uVar1;
      *(byte *)object = (bVar4 - 4 ^ bVar6) & 0xf ^ bVar6;
      *(byte *)((char *)object + 1) = (byte)(uVar1 >> 8);
      set_ambient_bias_without_light(0);
      sVar9 = check_object_fits_in_slot(object,slot);
      if (sVar9 != 0) {
        return 1;
      }
      uVar1 = *object;
      bVar6 = (byte)uVar1;
      *(byte *)object = (bVar6 ^ bVar4) & 0xf ^ bVar6;
      *(byte *)((char *)object + 1) = (byte)(uVar1 >> 8);
      return 0;
    }
  }
  local_50 = (int)(short)uVar1;
  if ((puVar11 == (ushort *)0x0) || ((((uw_object_hdr_t *)puVar11)->object_id & 0x1f0) != 0x80)) {
LAB_00047a0c:
    return local_48->flags >> 5 & 1;
  }
  bVar6 = 1;
  local_54[0] = calculate_object_weight((uw_object_hdr_t *)object);
  container_rec = g_current_container_record;
  bVar7 = 1;
  if (0x13 < iVar15) {
    /* Was `container_rec = *(int *)(container_rec + 4)` walking the legacy 4-byte "prev" field (truncated half of
       a real 64-bit pointer, same class as this whole file's Update-29 sweep)... */
    for (; bVar6 = bVar7, container_rec != 0; container_rec = *(char **)(container_rec + 0x14)) {
      _savedLink = g_current_container_link;
      g_current_container_link = *(undefined2 *)(container_rec + 8);
      pbVar13 = (byte *)resolve_object_link(&g_current_container_link);
      g_current_container_link = _savedLink;
      if (pbVar13 == (byte *)0x0) {
        bVar7 = 1;
      }
      else if (((short)(ushort)(byte) g_container_type_props[(((uw_object_hdr_t *)pbVar13)->object_id & 0xf)].capacity == 0) ||
               (bVar7 = 0,
                (int)*(short *)(container_rec + 10) + (int)local_54[0] <=
                (int)(short)(ushort)(byte) g_container_type_props[(((uw_object_hdr_t *)pbVar13)->object_id & 0xf)].capacity)) {
        bVar7 = 1;
      }
      bVar7 = bVar6 & bVar7;
    }
  }
  sum_container_weight(puVar11 + 3,local_54);
  uVar8 = local_4c;
  iVar15 = (((uw_object_hdr_t *)puVar11)->object_id & 0xf) * 3;
  if (((byte) g_container_type_props[(iVar15) / 3].capacity == 0) ||
      (bVar7 = 0, local_54[0] <= (short)(ushort)(byte) g_container_type_props[(iVar15) / 3].capacity)) {
    bVar7 = 1;
  }
  if (!(bool)(bVar7 & bVar6)) {
    sVar9 = build_object_display_name(acStack_40,puVar11,0,0);
    if (sVar9 == 0) {
      pcVar14 = s_UNNAMED_00084f24;
    wptr_31150 = acStack_84f64;
      do {
        cVar3 = *pcVar14;
        *wptr_31150 = cVar3; wptr_31150 = wptr_31150 + 1;
        pcVar14 = pcVar14 + 1;
      } while (cVar3 != '\0');
    }
    message_scroll_print_wrapped(&DAT_00085c88);
    message_scroll_print_wrapped(acStack_40);
    message_scroll_print_wrapped(s_is_too_full__00085c78);
    return 0;
  }
  uVar2 = (uint)(short)g_container_type_props[(iVar15) / 3].acceptance_mask;
  /* The signed acceptance mask shares the row with capacity;
     load_light_food_effect_tables fills both fields from OBJECTS.DAT. */
  if ((int)uVar2 <= 0) goto LAB_00047a0c;
  if ((int)uVar2 < 0x200) {
    if ((local_4c != uVar2) && (print_scroll_message_by_id(0xf8), uVar8 != uVar2)) {
      return 0;
    }
    return 1;
  }
  if (uVar2 == 0x200) {
    if ((local_50 != 3) || ((uVar5 != 3 && ((uVar5 != 2 || (bVar4 < 8)))))) {
      print_scroll_message_by_id(0xf7);
      return 0;
    }
  }
  else if (uVar2 == 0x201) {
    if (((local_50 != 0) || (uVar5 != 1)) || (2 < bVar4)) goto LAB_000479b4;
  }
  else if (uVar2 == 0x202) {
    if (((local_50 != 4) || (uVar5 != 3)) || (bVar4 < 8)) goto LAB_000479b4;
  }
  else if ((uVar2 != 0x203) ||
          (((local_50 != 2 || (uVar5 != 3)) &&
           ((local_4c != 0xce &&
            ((((local_4c != 0xcf && (local_4c != 0x92)) && (local_4c != 0x125)) &&
             ((local_4c != 0x11b && (local_4c != 0xd9)))))))))) {
LAB_000479b4:
    sVar9 = 0;
    print_scroll_message_by_id(0xf8);
    goto LAB_000479c0;
  }
  sVar9 = 1;
LAB_000479c0:
  return (int)sVar9;
}""".replace("@BLANK@", "  ")
REPLACEMENTS = [('ushort *puVar11;',
  'uw_object_hdr_t *puVar11;\n  uw_object_hdr_t *header = (uw_object_hdr_t *)object;'),
 ('byte *pbVar13;', 'uw_object_hdr_t *pbVar13;'),
 ('local_4c = (uint)(short)(*object & 0x1ff);', 'local_4c = (uint)(short)header->object_id;'),
 ('uVar1 = *object >> 6 & 7;', 'uVar1 = (header->object_id >> 6) & 7;'),
 ('uVar5 = ((byte)*object & 0x30) >> 4;', 'uVar5 = (header->object_id >> 4) & 3;'),
 ('bVar4 = (byte)*object & 0xf;', 'bVar4 = header->object_id & 0xf;'),
 ('g_scratch_object_ptr = (uw_object_hdr_t *)object;', 'g_scratch_object_ptr = header;'),
 ('if ((((*object & 0x8000) != 0) && ((object[3] & 0x8000) == 0)) &&\n'
  '       (0x40 < (object[3] & 0xffc0))) {',
  'if (((header->is_quant != 0) && (header->link < 0x200)) &&\n       (1 < header->link)) {'),
 ('*(byte *)object = (bVar4 - 4 ^ bVar6) & 0xf ^ bVar6;\n'
  '      *(byte *)((char *)object + 1) = (byte)(uVar1 >> 8);',
  'header->object_id = (uVar1 & 0x1f0) | ((bVar4 - 4) & 0xf);'),
 ('*(byte *)object = (bVar6 ^ bVar4) & 0xf ^ bVar6;\n'
  '      *(byte *)((char *)object + 1) = (byte)(uVar1 >> 8);',
  'header->object_id = (uVar1 & 0x1f0) | (bVar4 & 0xf);'),
 ('calculate_object_weight((uw_object_hdr_t *)object)', 'calculate_object_weight(header)'),
 ('sum_container_weight(puVar11 + 3,local_54);',
  'sum_container_weight(&puVar11->link_word,local_54);')]


def converted():
    result = ORIGINAL
    for before, after in REPLACEMENTS:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    for before, after, count in [
        ('((byte)*object & 0x30)', '(header->object_id & 0x30)', 2),
        ('uVar1 = *object;', 'uVar1 = header->type_flags;', 2),
        ('puVar11 = (ushort *)resolve_object_link', 'puVar11 = resolve_object_link', 4),
        ('pbVar13 = (byte *)resolve_object_link', 'pbVar13 = resolve_object_link', 1),
        ('((uw_object_hdr_t *)puVar11)->', 'puVar11->', 4),
        ('((uw_object_hdr_t *)pbVar13)->', 'pbVar13->', 2),
        ('puVar11 == (ushort *)0x0', 'puVar11 == (uw_object_hdr_t *)0x0', 2),
        ('puVar11 != (ushort *)0x0', 'puVar11 != (uw_object_hdr_t *)0x0', 1),
        ('pbVar13 == (byte *)0x0', 'pbVar13 == (uw_object_hdr_t *)0x0', 1)]:
        assert result.count(before) == count, (before, result.count(before))
        result = result.replace(before, after)
    return result


def generate():
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'slot-fit-fields.json').write_text(generate())

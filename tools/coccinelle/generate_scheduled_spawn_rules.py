"""Name confirmed coordinate writes in stationary scheduled-object spawners.

Exact body guards preserve full-word captures, scalar lifetimes, alias order,
placement/list callbacks, and scheduling success/failure semantics.
"""
from pathlib import Path
from difflib import SequenceMatcher
import re
HERE=Path(__file__).resolve().parent
DOOR='spawn_scheduled_door_texture_object'
EFFECT='spawn_scheduled_effect_object'
ORIGINALS={}
ORIGINALS['spawn_scheduled_effect_object']="""int spawn_scheduled_effect_object(ushort *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y)
{
  undefined1 uVar1;
  byte bVar2;
  undefined2 uVar3;
  short sVar4;
  char *iVar5;  /* was `int` -- truncated spawn_new_object's real pointer */
  uint uVar6;
  undefined4 uVar7;
  char *iVar8;  /* was `int` -- truncated tilemap_lookup's real pointer, same
                   class as iVar5 above; crashed live in the sibling call
                   shape at FUN_0004ad10/settle_mobile_to_immobile (see their comments) */
  byte bVar9;

  iVar5 = (char *)spawn_new_object(effect_group + 0x1c0,0);
  if (iVar5 == (char *)0x0) {
    return 0;
  }
  if (source_object != (ushort *)0x0) {
    uVar6 = (((uw_object_hdr_t *)iVar5)->position_word ^ ((uw_object_hdr_t *)source_object)->position_word) & 0x1fff ^ (uint)((uw_object_hdr_t *)source_object)->position_word;
    uVar1 = (undefined1)uVar6;
    ((uw_object_hdr_t *)iVar5)->position_word_low = uVar1;
    bVar2 = (byte)(uVar6 >> 8);
    ((uw_object_hdr_t *)iVar5)->position_word_high = bVar2;
    bVar9 = ((uw_object_hdr_t *)source_object)->position_word_high;
    ((uw_object_hdr_t *)iVar5)->position_word_low = uVar1;
    ((uw_object_hdr_t *)iVar5)->position_word_high = (bVar9 ^ bVar2) & 0x1c ^ bVar2;
  }
  if ((short)heading_adjust < 0) {
    uVar3 = ((uw_object_hdr_t *)iVar5)->position_word;
    bVar9 = (byte)uVar3 ^ (byte)((uint)heading_adjust * -0x10000 >> 0x10);
  }
  else {
    if (source_object == (ushort *)0x0) goto LAB_00081980;
    bVar9 = (byte) g_object_type_props[(((uw_object_hdr_t *)source_object)->object_id)].height >> 3;
    uVar3 = ((uw_object_hdr_t *)iVar5)->position_word;
    if (bVar9 == 0) {
      bVar9 = 1;
    }
    bVar9 = (char)heading_adjust * bVar9 + (char)((uw_object_hdr_t *)source_object)->position_word ^ (byte)uVar3;
  }
  ((uw_object_hdr_t *)iVar5)->position_word_low = bVar9 & 0x7f ^ (byte)uVar3;
  ((uw_object_hdr_t *)iVar5)->position_word_high = (byte)(char)((ushort)uVar3 >> 8);
LAB_00081980:
  uVar7 = encode_object_slot_index(iVar5);
  sVar4 = scheduler_add_entry(uVar7,delay,animation_offset,(int)tile_x & 0xff,(char)tile_y);
  if (sVar4 == -1) {
    free_object_slot(iVar5);
    return 0;
  }
  iVar8 = (char *)tilemap_lookup((int)tile_x,(int)tile_y);
  object_list_append_tail(iVar8 + 2,iVar5);
  return 1;
}"""
ORIGINALS['spawn_scheduled_door_texture_object']="""int spawn_scheduled_door_texture_object()
{
  ushort tile_word;
  byte position_high_bits;
  short tile_type;
  undefined4 slot_index;
  ushort *tile;
  int clearance;
  undefined1 *door_texture;
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
      door_texture = (undefined1 *)spawn_new_object(0x1ca, 0);
      tile_word = ((uw_object_hdr_t *)door_texture)->position_word;
      object_word = (tile_word ^ object_word) & 0x7f ^ (uint)tile_word;
      ((uw_object_hdr_t *)door_texture)->position_word_low = (char)object_word;
      ((uw_object_hdr_t *)door_texture)->position_word_high = (char)(tile_word >> 8);
      position_high_bits = (byte)(((target_x & 7) << 0xd) >> 8);
      ((uw_object_hdr_t *)door_texture)->position_word_low = (char)(object_word & 0x1fff);
      ((uw_object_hdr_t *)door_texture)->position_word_high = (byte)((object_word & 0x1fff) >> 8) | position_high_bits;
      ((uw_object_hdr_t *)door_texture)->position_word_low = (char)(object_word & 0x3ff);
      ((uw_object_hdr_t *)door_texture)->position_word_high = (byte)((object_word & 0x3ff) >> 8) | position_high_bits | (byte)(((target_y & 7) << 10) >> 8);
      ((uw_object_hdr_t *)door_texture)->type_flags_low = ((uw_object_hdr_t *)door_texture)->type_flags_low;
      ((uw_object_hdr_t *)door_texture)->doordir = 0x1;
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
}"""


def changes():
    result=[]
    def add(function,key,before,after):
        result.append(dict(function=function,key=key,before=before,after=after))
    a='((uw_object_hdr_t *)door_texture)->'
    add(DOOR,'typed_destination','undefined1 *door_texture;','uw_object_hdr_t *door_texture;')
    add(DOOR,'typed_allocation','door_texture = (undefined1 *)spawn_new_object(0x1ca, 0);','door_texture = spawn_new_object(0x1ca, 0);')
    add(DOOR,'zpos',f'{a}position_word_low = (char)object_word;\n{a}position_word_high = (char)(tile_word >> 8);',
        f'{a}zpos = object_word & 0x7f;')
    add(DOOR,'xpos',f'{a}position_word_low = (char)(object_word & 0x1fff);\n{a}position_word_high = (byte)((object_word & 0x1fff) >> 8) | position_high_bits;',
        f'{a}xpos = target_x & 7;')
    add(DOOR,'ypos',f'{a}position_word_low = (char)(object_word & 0x3ff);\n{a}position_word_high = (byte)((object_word & 0x3ff) >> 8) | position_high_bits | (byte)(((target_y & 7) << 10) >> 8);',
        f'{a}ypos = target_y & 7;')
    add(DOOR,'plain_self_store',f'{a}type_flags_low = {a}type_flags_low;', '')
    a='((uw_object_hdr_t *)iVar5)->'
    b='((uw_object_hdr_t *)source_object)->'
    add(EFFECT,'typed_destination','char *iVar5;', 'uw_object_hdr_t *iVar5;')
    add(EFFECT,'typed_allocation','iVar5 = (char *)spawn_new_object(effect_group + 0x1c0,0);',
        'iVar5 = spawn_new_object(effect_group + 0x1c0,0);')
    add(EFFECT,'typed_null','iVar5 == (char *)0x0','iVar5 == (uw_object_hdr_t *)0x0')
    add(EFFECT,'copy_xpos',f'{a}position_word_low = uVar1;\nbVar2 = (byte)(uVar6 >> 8);\n{a}position_word_high = bVar2;',
        f'bVar2 = (byte)(uVar6 >> 8);\n{a}xpos = (uVar6 >> 13) & 7;')
    add(EFFECT,'source_high',f'bVar9 = {b}position_word_high;', f'bVar9 = (byte)({b}position_word >> 8);')
    add(EFFECT,'copy_ypos',f'{a}position_word_low = uVar1;\n{a}position_word_high = (bVar9 ^ bVar2) & 0x1c ^ bVar2;',
        f'{a}ypos = (bVar9 >> 2) & 7;')
    add(EFFECT,'adjust_zpos',f'{a}position_word_low = bVar9 & 0x7f ^ (byte)uVar3;\n{a}position_word_high = (byte)(char)((ushort)uVar3 >> 8);',
        f'{a}zpos = (bVar9 ^ (byte)uVar3) & 0x7f;')
    # iVar8 + 2 is the tile's object-chain head word (tile word 1).
    add(EFFECT,'tile_chain_head','object_list_append_tail(iVar8 + 2,iVar5);',
        'object_list_append_tail((uw_link_word_t *)(iVar8 + 2), iVar5);')
    return result


def converted(function):
    final=ORIGINALS[function]
    for change in changes():
        if change['function'] != function: continue
        before,after=change['before'],change['after']
        pattern=re.compile(r'(?m)^([ \t]*)'+r'\s*'.join(re.escape(line) for line in before.splitlines()))
        # Declaration prefixes retain their original historical comments.
        if change['key']=='typed_null':
            final,count=re.subn(re.escape(before),lambda m:after,final)
        elif change['key']=='plain_self_store':
            final,count=re.subn(r'(?m)^[ \t]*'+re.escape(before)+r'\n','',final)
        else:
            final,count=pattern.subn(lambda m:m[1]+after.replace('\n','\n'+m[1]),final)
        assert count==1,change['key']
    name='door_texture' if function==DOOR else 'iVar5'
    return final.replace(f'((uw_object_hdr_t *){name})->',name+'->')


def generate():
    rules=[]
    for function in [DOOR,EFFECT]:
        old,new=ORIGINALS[function].splitlines(),converted(function).splitlines()
        patch=[]
        for tag,i,j,k,l in SequenceMatcher(a=old,b=new,autojunk=False).get_opcodes():
            if tag=='equal': patch.extend(' '+line if line.strip() else '' for line in old[i:j])
            else:
                patch.extend('- '+line if line else '-' for line in old[i:j])
                patch.extend('+ '+line if line else '+' for line in new[k:l])
        rules.append(f'@{function}_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
            'typedef byte, ushort, uint, undefined1, undefined2, undefined4, uw_object_hdr_t, uw_link_word_t;\n@@\n'+'\n'.join(patch)+'\n')
    return ''.join(rules)


if __name__=='__main__':
    (HERE/'scheduled-spawn-fields.cocci').write_text(generate())

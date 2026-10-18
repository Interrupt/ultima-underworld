"""Name monster loot header placement while retaining full scalar captures."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
FUNCTION = 'drop_monster_loot'
ORIGINAL = r"""void drop_monster_loot(void *monster_ptr, ushort gold_nibble, ushort item_nibble)
{
  byte *monster = (byte *)monster_ptr;
  int uw_ord2005_rem_12 = 0;
  byte bVar1;
  byte bVar2;
  undefined2 uVar3;
  char *iVar4;  /* was `int` -- truncated tilemap_lookup's real `void *`
                    return (crash: object_list_insert_head(iVar4 + 2, ...)
                    below dereferences the truncated address) */
  uint uVar6;
  undefined4 uVar7;
  int extraout_r1;
  char *pDropObj;  /* was `int iVar5`/reused `int iVar4` -- truncated
                       spawn_new_object's real object pointer in both of
                       this function's drop branches */

  iVar4 = (char *)tilemap_lookup(*(ushort *)(monster + 0x16) >> 10,(*(ushort *)(monster + 0x16) & 0x3f0) >> 4)
  ;
  if (((gold_nibble & 0xff) != 0) &&
     (pDropObj = (char *)spawn_new_object((short)(gold_nibble & 0xff) + 0xd8,0), pDropObj != NULL)) {
    uVar6 = (((uw_object_hdr_t *)pDropObj)->position_word ^ *(ushort *)(monster + 2)) & 0x1fff ^
            (uint)*(ushort *)(monster + 2);
    bVar1 = (byte)uVar6;
    ((uw_object_hdr_t *)pDropObj)->position_word_low = bVar1;
    bVar2 = (byte)(uVar6 >> 8);
    ((uw_object_hdr_t *)pDropObj)->position_word_high = bVar2;
    bVar2 = (monster[3] ^ bVar2) & 0x1c ^ bVar2;
    ((uw_object_hdr_t *)pDropObj)->position_word_low = bVar1;
    ((uw_object_hdr_t *)pDropObj)->position_word_high = bVar2;
    ((uw_object_hdr_t *)pDropObj)->position_word_low = (monster[2] ^ bVar1) & 0x7f ^ bVar1;
    ((uw_object_hdr_t *)pDropObj)->position_word_high = bVar2;
    uVar6 = ((uw_object_hdr_t *)pDropObj)->chain_word & 0xffe8;
    ((uw_object_hdr_t *)pDropObj)->chain_word_low = (byte)uVar6 | 0x28;
    ((uw_object_hdr_t *)pDropObj)->chain_word_high = (byte)(char)(uVar6 >> 8);
    object_list_insert_head(iVar4 + 2,pDropObj);
    settle_dropped_object(pDropObj,(int)DAT_0010144c,(int)DAT_00101454,1);
  }
  if ((item_nibble & 0xff) != 0) {
    uVar7 = ce_rand();
    uw_ord2005_rem_12 = ((int)(uVar7)) % (0x10);
    if ((uw_ord2005_rem_12 < 7) &&
       (pDropObj = (char *)spawn_new_object((short)(item_nibble & 0xff) + 0xc0,0), pDropObj != NULL)) {
      uVar3 = ((uw_object_hdr_t *)pDropObj)->link_word;
      bVar1 = (byte)uVar3;
      ((uw_object_hdr_t *)pDropObj)->link_word_low = (*monster ^ bVar1) & 0x3f ^ bVar1;
      ((uw_object_hdr_t *)pDropObj)->link_word_high = (byte)(char)((ushort)uVar3 >> 8);
      drop_object_near_target(monster,pDropObj,4,0);
    }
  }
}"""


def converted():
    result = ORIGINAL
    a = '((uw_object_hdr_t *)pDropObj)->'
    replacements = [
        ('byte *monster = (byte *)monster_ptr;', 'uw_mobile_object_t *monster = (uw_mobile_object_t *)monster_ptr;'),
        ('char *pDropObj;', 'uw_object_hdr_t *pDropObj;'),
        ('pDropObj = (char *)spawn_new_object', 'pDropObj = spawn_new_object'),
        ('*(ushort *)(monster + 0x16) >> 10', 'monster->npc_xhome'),
        ('(*(ushort *)(monster + 0x16) & 0x3f0) >> 4', 'monster->npc_yhome'),
        ('*(ushort *)(monster + 2)', 'monster->hdr.position_word'),
        ('    '+a+'position_word_low = bVar1;\n    bVar2 = (byte)(uVar6 >> 8);\n    '+a+'position_word_high = bVar2;',
         '    bVar2 = (byte)(uVar6 >> 8);\n    pDropObj->xpos = bVar2 >> 5;'),
        ('monster[3]', '(byte)(monster->hdr.position_word >> 8)'),
        ('    '+a+'position_word_low = bVar1;\n    '+a+'position_word_high = bVar2;',
         '    pDropObj->ypos = (bVar2 >> 2) & 7;'),
        ('    '+a+'position_word_low = (monster[2] ^ bVar1) & 0x7f ^ bVar1;\n    '+a+'position_word_high = bVar2;',
         '    pDropObj->zpos = monster->hdr.zpos;'),
        ('    '+a+'chain_word_low = (byte)uVar6 | 0x28;\n    '+a+'chain_word_high = (byte)(char)(uVar6 >> 8);',
         '    pDropObj->quality = 0x28;'),
        ('      '+a+'link_word_low = (*monster ^ bVar1) & 0x3f ^ bVar1;\n      '+a+'link_word_high = (byte)(char)((ushort)uVar3 >> 8);',
         '      pDropObj->owner = monster->hdr.object_id & 0x3f;'),
    ]
    for before, after in replacements:
        count = result.count(before)
        assert count == (2 if before in ['pDropObj = (char *)spawn_new_object', '*(ushort *)(monster + 2)'] else 1), before
        result = result.replace(before, after)
    return result.replace(a, 'pDropObj->')


def generate():
    import json
    return json.dumps(dict(function=FUNCTION, before=ORIGINAL, after=converted()), indent=2)+'\n'


if __name__ == '__main__':
    (HERE/'monster-loot-fields.json').write_text(generate())

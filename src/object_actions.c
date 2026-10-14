/* Object action dispatch: the right-click action-list builder (and its duplicate variant), critter
   sprite tier/page resolution, and placement/combination checks (carry weight, drop height, item
   combination). */
#include "headers/object_actions.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define DAT_00085cd8 DAT_00085cd8_backing[0]
#define DAT_00085cb4 DAT_00085cb4_backing[0]
static uw_monster_type_props_t *DAT_001007c8;
undefined1 DAT_0023c3dc;
undefined1 DAT_0023c3d8;
/* Ghidra recovered this as "You_see" (underscores, no trailing space); it's the "You see " prefix
   the look/identify code prepends to an object/terrain name, so the real bytes are "You see " with
   a trailing space... */
char s_You_see_000858fc[] = "You see ";
/* Ghidra rendered the embedded space as an underscore and put it on the wrong side -- real bytes at
   0x85c90 (ARM UU.exe .data, confirmed via tests/fixtures/static_strings.json's direct memory
   export): " belonging to" (leading space, no trailing space). */
static char s_belonging_to_00085c90[] = " belonging to";
/* Sizing-audit pass: `read_file_handle(iVar8,&DAT_0023ce70,0x80)` (ai.c's
   load_critter_association_tables) reads exactly 128 bytes, matching its own fill loop's `<0x80`
   bound. HARD exact. Down from 8192. */
 undefined1 DAT_0023ce70_backing[128];
ushort DAT_00202508;
ushort DAT_002022f8;
static ushort DAT_00202300;
static ushort DAT_00202304;
int DAT_002022fc;
static char s_cursed_00085ca0[] = "cursed ";
static char s_magical_00085ca8[] = "magical ";
/* Ghidra rendered the embedded space as an underscore and dropped the leading space entirely --
   confirmed via a Ghidra memory dump of the real UU.exe that the real bytes are " full charge\0"
   (with a real space, not '_', between "full" and "charge")... */
static char s_full_charge_00085cb8[] = " full charge";
/* Was a bare scalar read through &DAT_00085cc8 as a 2-char C string (the "no charges" case of the
   same charge-count message). Confirmed via a Ghidra memory dump of the real UU.exe that the real
   bytes are "no\0". */
static char DAT_00085cc8[] = "no";
/* Was missing both its leading and trailing space -- confirmed via a Ghidra memory dump of the real
   UU.exe that the real bytes are " with \0", not "with\0"; matches the same leading/trailing-space-
   per-fragment convention as the full_charge/DAT_00085cc8 strings just above. */
static char s_with_00085cd0[] = " with ";
/* Was a zero-initialized 8192-byte placeholder (this file's own adjacent comment guessed ":
   "-shaped, but a Ghidra memory dump of the real UU.exe shows the real bytes are " of \0") -- this
   prefixes a special/unique item's proper name onto its base name, e.g. "<item> of <name>"... */
/* Sizing-audit pass: confirmed 4-char content (" of \0"), no
   indexing. Sized to 16; down from 8192. */
static undefined DAT_00085cd8_backing[16] = " of ";
static undefined4 DAT_0024cfcc;
/* DAT_00085ccc/ccd/cce sit right after DAT_00085cc8 ("no\0", above) in real memory ("00\0" -- 0x30
   0x30 0x00) and get copied into this function's own digit-formatting scratch buffer before being
   overwritten by the actual computed digits... */
static undefined1 DAT_00085ccc;
static undefined1 DAT_00085ccd;
static undefined1 DAT_00085cce;
/* Was a zero-initialized 8192-byte placeholder -- confirmed via a Ghidra memory dump of the real
   UU.exe that the real bytes are "s\0", the plural suffix appended after "full charge" when the
   count isn't exactly 1. */
/* Sizing-audit pass: confirmed 1-char content ("s\0"), no indexing.
   Sized to 16; down from 8192. */
static undefined DAT_00085cb4_backing[16] = "s";
static char s__DATA_grave_dat_00085cf8[] = "\\DATA\\grave.dat";
/* Ghidra rendered the embedded space as an underscore and dropped
   the trailing newline. Real bytes at 0x85d08 (ARM UU.exe .data):
   "an adventurer.\n". */
static char s_an_adventurer__00085d08[] = "an adventurer.\n";
uint DAT_00202094;

/* ARM 0x8762c/30/34: two tile-damage tiers, dice count/size/type. */
static undefined DAT_0008762c_backing[12] = {10,6,0,0,6,5,0,0,11,3,0,0};
#define DAT_0008762c DAT_0008762c_backing[0]
#define DAT_00087630 DAT_0008762c_backing[4]
#define DAT_00087634 DAT_0008762c_backing[8]
/* Ghidra rendered the embedded space as an underscore. Real bytes at
   0x87954 (ARM UU.exe .data): "very near" (null-terminated right
   after, no trailing space/newline needed). */
static char s_very_near_00087954[] = "very near";






void dispatch_object_action(ushort *object, int mode)
{
  char *wptr_26120;
  byte bVar1;
  char cVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  char *pcVar6;
  char *count_str;
  undefined *puVar8;
  int iVar9;
  char cVar10;
  undefined4 uVar11;
  char acStack_85978 [547012];
  undefined1 auStack_b4 [8];
  char acStack_ac [16];
  char acStack_9c [32];
  /* Was 80 bytes -- build_creature_look_text's creature-look text ("You see " + article +
     description + " named " + proper name + suffix + "\n") can run well past that for a creature
     with a real name... */
  char acStack_7c [256];

  uVar11 = 0;
  if (object == (ushort *)0x0) {
    return;
  }
  iVar9 = (((uw_object_hdr_t *)object)->object_id) * 0xd;
  if (!g_object_type_props[((uw_object_hdr_t *)object)->object_id].has_look_description) {
    if ((((uw_object_hdr_t *)object)->object_id & 0x1f0) == 0x160) {
      look_at_inscribed_object(object,mode);
    }
    goto LAB_00048b58;
  }
  if (((short)mode == 3) && (iVar5 = identify_mushroom_type(object,&g_object_type_props[iVar9 / 0xd]), iVar5 != 0)) {
    return;
  }
  /* This copied "You see " into acStack_85978 (a wildly oversized, 547012-byte local Ghidra
     apparently misattributed here -- almost certainly a stack-frame-size miscalculation artifact,
     not a real array in the original binary), but nothing ever reads acStack_85978 again... */
  acStack_7c[0] = '\0';
  ce_strcat(acStack_7c, s_You_see_000858fc);
  acStack_ac[0] = '\0';
  iVar5 = append_object_property_tag(object,mode,acStack_ac);
  cVar10 = '\0';
  if (iVar5 != 0) {
    cVar10 = acStack_ac[0];
  }
  acStack_9c[0] = '\0';
  if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) == 0x40) {
    build_creature_look_text(object,acStack_7c);
    return;
  }
  iVar5 = 0;
  if ((((uw_object_hdr_t *)object)->quality) != 0) {
    if ((g_object_type_props[iVar9 / 0xd].quality_flags & 0xc) == 0xc) {
      sVar4 = 5;
    }
    else {
      sVar4 = (((uw_object_hdr_t *)object)->quality >> 4) + 1;
    }
    iVar5 = (int)sVar4;
  }
  pcVar6 = (char *)get_message_string((g_object_type_props[iVar9 / 0xd].quality_type) * 6 + iVar5 | 0xa00);
  if (pcVar6 != (char *)0x0) {
    cVar2 = *pcVar6;
    if (cVar2 != '\0') {
      iVar5 = ce_strlen(pcVar6);
      ce_memmove(acStack_9c,pcVar6,iVar5 + 1);
      cVar10 = cVar2;
    }
    mode = (int)(short)mode;
  }
  if (((((uw_object_hdr_t *)object)->is_quant == 0) || (uVar3 = ((uw_object_hdr_t *)object)->link_word, (uVar3 & 0x8000) != 0)) ||
      ((uVar3 & 0xffc0) < 0x41)) {
    if ((cVar10 != '\0') && ((g_object_type_props[iVar9 / 0xd].quality_type) != 0xd)) {
      if (((cVar10 == 'a') || ((cVar10 == 'e' || (cVar10 == 'i')))) ||
         (cVar10 == 'o' || cVar10 == 'u')) {
        puVar8 = &DAT_00085244;
      }
      else {
        puVar8 = &DAT_00085248;
      }
      goto LAB_000489fc;
    }
  }
  else {
    uVar11 = 1;
    cVar10 = 'x';
    count_str = _itoa(uVar3 >> 6,auStack_b4,10);
    ce_strcat(acStack_7c,count_str);
    puVar8 = &DAT_00085240;
LAB_000489fc:
    ce_strcat(acStack_7c,puVar8);
  }
  if (acStack_9c[0] != '\0') {
    ce_strcat(acStack_7c,acStack_9c);
    ce_strcat(acStack_7c,&DAT_00085240);
  }
  if (acStack_ac[0] != '\0') {
    ce_strcat(acStack_7c,acStack_ac);
  }
  iVar9 = ce_strlen(acStack_7c);
  build_object_display_name(acStack_7c + iVar9,object,cVar10 == '\0',uVar11);
  append_object_special_name(object,mode,acStack_7c);
  if (((g_object_type_props[((uw_object_hdr_t *)object)->object_id].can_have_owner) &&
       (bVar1 = (byte)((uw_object_hdr_t *)object)->link_word, (bVar1 & 0x3f) != 0)) && ((bVar1 & 0x1f) < 0x1c)) {
    ce_strcat(acStack_7c,s_belonging_to_00085c90);
    /* uVar11 is `undefined4` (reused as a flag above); assigning get_message_string's char* to it
       truncated the pointer -> ce_strcat (strcat) walked a wild address, crashing a right-click
       "look" at any owned container (the spawn-room sack). Use the char* local. */
    pcVar6 = get_message_string((bVar1 & 0x1f) + 0x172 | 0x200);
    ce_strcat(acStack_7c,pcVar6);
  }
  ce_strcat(acStack_7c,&DAT_00084f20);
  /* DAT_00084f20 already supplies the original period and newline. */
  message_scroll_print_wrapped(acStack_7c);
LAB_00048b58:
  describe_special_object_property(object,mode);
}


/* was FUN_000404a0. Loads (and page-caches) a \CRIT\CRnnPAGE.Nnn sprite page and decodes one
   frame's glyph into a fresh palette-indexed bitmap. */
int decode_critter_sprite_page(int page_base, int page_index, short column, short row, short frame)
{
  ushort uVar3;
  int iVar1;
  int iVar5;
  byte *pbVar6;
  char *uVar7; /* decompress_gr_bitmap's real return type -- was undefined4, truncating it */
  byte *pbVar8;
  int iVar9;
  int iVar10;
  byte *pbVar11;
  void **piVar12;
  /* iVar5 above is a real int (file handle) for open_file_for_read's return, reused later in this
     same function as if it held ce_malloc's `void *` return (the decoded glyph buffer) -- same
     "reused scalar" bug already fixed in look_at_inscribed_object this session. */
  void *pvVar_glyphbuf;

  pbVar11 = uw_load_critter_page_cached(page_base, page_index);
  if (pbVar11 == (byte *)0) {
    /* Missing/unopenable per-page resource file -- was an unconditional
       terminate_process(0xffffffff) hard exit... */
    return 0;  /* (was `return dummy_page;`, an 8-byte static buffer whose address was truncated to int; no caller uses the result) */
  }
  iVar1 = (page_index + page_base * 4) * 0x10000 >> 0x10;
  iVar9 = ((int)(((int)column - (uint)*pbVar11) * 0x10000) >> 0x10) + 2;
  if ((unsigned int)iVar9 >= 0x7ffd) {
    /* Out-of-range glyph/character code for this page (this whole class-1/font-page path was
       unexercised before this session -- nothing in the previously-tested level area used it)... */
    DEBUG(ERR, "[glyphpage] index %d out of range for page base %d (column=%d), skipping\n",
          iVar9, (int)*pbVar11, (int)column);
    return 0;
  }
  if (pbVar11[iVar9] != 0xff) {
    pbVar6 = pbVar11 + (short)(ushort)pbVar11[1] + 2;
    uVar3 = (ushort)pbVar6[(((int)frame +
                            ((int)((uint)pbVar11[iVar9] << 0x13) >> 0x10)) * 0x10000 >> 0x10)
                           + 1];
    pbVar8 = pbVar6 + (((int)(short)(ushort)*pbVar6 << 0x13) >> 0x10) + 1;
    if (pbVar6[(((int)frame +
                ((int)((uint)pbVar11[iVar9]
                      << 0x13) >> 0x10)) * 0x10000 >> 0x10) + 1] == 0xff) {
      uVar3 = 0;
    }
    if ((int)row <= (int)(uint)*pbVar8) {
      iVar9 = (uint)*pbVar8 * 0x20 + 3;
      iVar5 = ((int)(short)uVar3 << 0x11) >> 0x10;
      pbVar11 = pbVar11 + ((int)(((uint)pbVar8[iVar5 + iVar9] +
                                 (uint)pbVar8[iVar5 + iVar9 + 1] * 0x100) * 0x10000) >> 0x10);
      DAT_00202508 = (ushort)*pbVar11;
      DAT_002022f8 = (ushort)pbVar11[1];
      DAT_00202300 = (ushort)pbVar11[2];
      DAT_00202304 = (ushort)pbVar11[3];
      /* DAT_00202508 is WIDTH, DAT_002022f8 is HEIGHT -- confirmed against the class-0 item
         decoder's identical header read a few lines below... */
      /* The original decoder accepts the page's full byte-sized dimensions. Goblin combat frames
         legitimately exceed 64 pixels (e.g. direction 3, frame 3 is 68x44). Rejecting those after
         updating the dimensions left the previous texture paired with the new size, garbling it. */
      uVar7 = decompress_gr_bitmap(pbVar11 + 5,pbVar8 + row * 0x20 + 1,pbVar11[4]);
      pvVar_glyphbuf = ce_malloc((int)(short)DAT_002022f8 * (int)(short)DAT_00202508);
      iVar10 = (int)(short)DAT_002022f8;
      iVar9 = (int)(short)DAT_00202508;
      piVar12 = &DAT_002020f8 + iVar1;
      *piVar12 = pvVar_glyphbuf;
      ce_memset(pvVar_glyphbuf,0,iVar10 * iVar9);
      ce_memmove(*piVar12,uVar7,(int)(short)DAT_002022f8 * (int)(short)DAT_00202508);
      uw_debug_dump_critter_sprite(page_base,page_index,(int)column,(int)frame,
                                    (unsigned char *)*piVar12,
                                    (int)(short)DAT_00202508,(int)(short)DAT_002022f8);
      if (*piVar12 != 0) {
        DAT_002022fc = (intptr_t)*piVar12;
        /* render_visible_tile_list reads each record's texture from the g_tile_texptr_out[] side
           channel (the in-record field is 4 bytes and truncates on 64-bit) -- same fix already
           applied to the class-0 item billboard decoder just above resolve_critter_sprite_tier. */
        if ((unsigned)DAT_0023b83c < UW_MAX_VIS_TILES) {
          g_tile_texptr_emit[DAT_0023b83c] = *piVar12;
        }
      }
      return 1;
    }
  }
  return 0;
}




/* was FUN_0004083c. Called from emit_tile_objects's render-class-1 (camera-facing billboard, used
   for both critters and doors) branch. param_1=critter type index (object id & 0x3f),
   param_2=direction index, param_3=frame, param_4=shade (see below). */
/* Tier selection REWRITTEN this session -- the shade/DAT_0023c460- threshold mechanism previously
   here was never the real logic; that original code was not recovered from disassembly... */
int resolve_critter_sprite_tier(short type_idx, int direction, short frame, uint shade)
{
  undefined4 uVar2;
  uint uVar4;
  byte *page;
  int tier;
  int t;

  if (0x60 < frame) {
    frame = 0;
  }
  uVar4 = (uint)(byte)(&DAT_0023ce70)[type_idx * 2];
  if (0xff < (short)direction) {
    direction = 0;
  }
  if (uVar4 == 0xff) {
    uVar2 = 0;
  }
  else {
    tier = 0;
    for (t = 0; t < 4; t++) {
      page = uw_load_critter_page_cached(uVar4, t);
      if (page == (byte *)0) continue;
      int base = (int)page[0];
      int span = (int)page[1];
      int match = ((int)(short)direction >= base) && ((int)(short)direction < base + span);
      if (match) {
        tier = t;
        break;
      }
    }
    decode_critter_sprite_page(uVar4,tier,direction,(&DAT_0023ce71)[type_idx * 2],frame);
    uVar2 = 1;
  }
  return uVar2;
}




// Dropped argument: both real call sites (uw.c:11074 `check_object_carry_weight(iVar2)`, and
// interact_default's own `check_object_carry_weight(g_interact_target)` -- the object being picked
// up) pass an object pointer, but this function's own recovered signature took none...
// was FUN_00046358
bool check_object_carry_weight(ushort *object)
{
  short sVar1;

  sVar1 = calculate_object_weight((uw_object_hdr_t *)object);
  return (int)((int)sVar1 + (uint)g_player_carry_weight) <= (int)(uint)g_player_max_carry_weight;
}




// was FUN_00048764
void dispatch_object_action_dup(ushort *object, int mode)
{
  char *wptr_31634;
  byte bVar1;
  char cVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  char *pcVar6;
  char *count_str;
  undefined *puVar8;
  int iVar9;
  char cVar10;
  undefined4 uVar11;
  char acStack_85978 [547012];
  undefined1 auStack_b4 [8];
  char local_ac [16];
  char local_9c [32];
  /* Same too-small stack buffer fixed in this function's duplicate,
     dispatch_object_action -- see the comment there. */
  char acStack_7c [256];
  
  uVar11 = 0;
  if (object == (ushort *)0x0) {
    return;
  }
  iVar9 = (((uw_object_hdr_t *)object)->object_id) * 0xd;
  if (!g_object_type_props[((uw_object_hdr_t *)object)->object_id].has_look_description) {
    if ((((uw_object_hdr_t *)object)->object_id & 0x1f0) == 0x160) {
      look_at_inscribed_object(object,mode);
    }
    goto LAB_00048b58;
  }
  if (((short)mode == 3) && (iVar5 = identify_mushroom_type(object,&g_object_type_props[iVar9 / 0xd]), iVar5 != 0)) {
    return;
  }
  pcVar6 = s_You_see_000858fc;
  /* Like dispatch_object_action, seed the actual message buffer. */
  wptr_31634 = acStack_7c;
  do {
    cVar10 = *pcVar6;
    *wptr_31634 = cVar10; wptr_31634 = wptr_31634 + 1;
    pcVar6 = pcVar6 + 1;
  } while (cVar10 != '\0');
  local_ac[0] = '\0';
  iVar5 = append_object_property_tag(object,mode,local_ac);
  cVar10 = '\0';
  if (iVar5 != 0) {
    cVar10 = local_ac[0];
  }
  local_9c[0] = '\0';
  if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) == 0x40) {
    build_creature_look_text(object,acStack_7c);
    return;
  }
  iVar5 = 0;
  if ((((uw_object_hdr_t *)object)->quality) != 0) {
    if ((g_object_type_props[iVar9 / 0xd].quality_flags & 0xc) == 0xc) {
      sVar4 = 5;
    }
    else {
      sVar4 = (((uw_object_hdr_t *)object)->quality >> 4) + 1;
    }
    iVar5 = (int)sVar4;
  }
  pcVar6 = (char *)get_message_string((g_object_type_props[iVar9 / 0xd].quality_type) * 6 + iVar5 | 0xa00);
  if (pcVar6 != (char *)0x0) {
    cVar2 = *pcVar6;
    if (cVar2 != '\0') {
      iVar5 = ce_strlen(pcVar6);
      ce_memmove(local_9c,pcVar6,iVar5 + 1);
      cVar10 = cVar2;
    }
    mode = (int)(short)mode;
  }
  if (((((uw_object_hdr_t *)object)->is_quant == 0) || (uVar3 = ((uw_object_hdr_t *)object)->link_word, (uVar3 & 0x8000) != 0)) ||
      ((uVar3 & 0xffc0) < 0x41)) {
    if ((cVar10 != '\0') && ((g_object_type_props[iVar9 / 0xd].quality_type) != 0xd)) {
      if (((cVar10 == 'a') || ((cVar10 == 'e' || (cVar10 == 'i')))) ||
         (cVar10 == 'o' || cVar10 == 'u')) {
        puVar8 = &DAT_00085244;
      }
      else {
        puVar8 = &DAT_00085248;
      }
      goto LAB_000489fc;
    }
  }
  else {
    uVar11 = 1;
    cVar10 = 'x';
    count_str = _itoa(uVar3 >> 6,auStack_b4,10);
    ce_strcat(acStack_7c,count_str);
    puVar8 = &DAT_00085240;
LAB_000489fc:
    ce_strcat(acStack_7c,puVar8);
  }
  if (local_9c[0] != '\0') {
    ce_strcat(acStack_7c,local_9c);
    ce_strcat(acStack_7c,&DAT_00085240);
  }
  if (local_ac[0] != '\0') {
    ce_strcat(acStack_7c,local_ac);
  }
  iVar9 = ce_strlen(acStack_7c);
  build_object_display_name(acStack_7c + iVar9,object,cVar10 == '\0',uVar11);
  append_object_special_name(object,mode,acStack_7c);
  if (((g_object_type_props[((uw_object_hdr_t *)object)->object_id].can_have_owner) &&
       (bVar1 = (byte)((uw_object_hdr_t *)object)->link_word, (bVar1 & 0x3f) != 0)) && ((bVar1 & 0x1f) < 0x1c)) {
    ce_strcat(acStack_7c,s_belonging_to_00085c90);
    /* uVar11 is `undefined4` (reused as a flag above); assigning get_message_string's char* to it
       truncated the pointer -> ce_strcat (strcat) walked a wild address, crashing a right-click
       "look" at any owned container (the spawn-room sack). Use the char* local. */
    pcVar6 = get_message_string((bVar1 & 0x1f) + 0x172 | 0x200);
    ce_strcat(acStack_7c,pcVar6);
  }
  ce_strcat(acStack_7c,&DAT_00084f20);
  /* DAT_00084f20 already supplies the original period and newline. */
  message_scroll_print_wrapped(acStack_7c);
LAB_00048b58:
  describe_special_object_property(object,mode);
}




// was FUN_0004b288 -- validity gate for spawn_object_near_player's freshly-copied object (param_1)
// placed near param_2's position: runs the same
// collision_build_height_field/collision_height_envelope machinery settle_dropped_object uses...
int check_object_drop_height(ushort *object, ushort *reference)
{
  byte bVar1;
  ushort uVar2;
  undefined2 uVar3;
  undefined4 uVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  uw_projectile_object_t *projectile = (uw_projectile_object_t *)object;
  uw_object_hdr_t *reference_header = (uw_object_hdr_t *)reference;
  /* Was three separate C locals (`ushort local_38[6]; ushort local_2c; ushort local_2a;`), but
     collision_height_envelope/collision_build_ height_field write through DAT_00202c6c-relative
     offset arithmetic expecting ONE contiguous struct... */
  unsigned char local_backing[64];
#define local_38 ((ushort *)local_backing)
#define local_2c (*(ushort *)(local_backing + 0xc))
#define local_2a (*(ushort *)(local_backing + 0xe))

  DAT_00202c6c = local_backing;
  uVar2 = projectile->hdr.type_flags;
  uVar3 = encode_object_slot_index(&projectile->hdr);
  /* ARM 0x4b2d0/0x4b310: slot at byte 10, radius at byte 8.
     DAT_00202c6c is a byte pointer; Ghidra's word indices need scaling. */
  *(byte *)(DAT_00202c6c + 10) = (byte)uVar3;
  *(byte *)((char *)DAT_00202c6c + 0xb) = (byte)((ushort)uVar3 >> 8);
  iVar5 = (short)(uVar2 & 0x1ff) * 0xd;
  *(byte *)(DAT_00202c6c + 8) = g_object_type_props[iVar5 / 0xd].collision_radius;
  *(undefined *)((char *)DAT_00202c6c + 9) = g_object_type_props[iVar5 / 0xd].height;
  iVar5 = ((projectile->tile_x << 3)) + (uint)(projectile->hdr.xpos);
  *(byte *)DAT_00202c6c = (byte)iVar5;
  *(byte *)((char *)DAT_00202c6c + 1) = (byte)((uint)iVar5 >> 8);
  /* Was `DAT_00202c6c + 1` for Y's low byte -- disassembly-confirmed (0x4b288 @ 0x4b3b8: `strb
     r3,[r1,#0x2]`) the real write target is offset+2, not +1. */
  iVar5 = (projectile->hdr.ypos) + ((projectile->tile_y << 3));
  *(byte *)((char *)DAT_00202c6c + 2) = (byte)iVar5;
  *(byte *)((char *)DAT_00202c6c + 3) = (byte)((uint)iVar5 >> 8);
  /* Both pointer args below were `DAT_00202c6c`/`DAT_00202c6c + 1` -- the Y output must be `+2` to
     match the real Y storage (offset+2/+3, see the fix just above); `+1` is X's own high byte.
     Disassembly- confirmed (0x4b288 @ 0x4b458's `bl 0x69f2c` args). */
  project_position_by_heading((projectile->fine_heading) + ((projectile->hdr.heading << 7) >> 2),
                              (g_object_type_props[(projectile->hdr.object_id)].collision_radius) +
                              (g_object_type_props[(reference_header->object_id)].collision_radius) + '\x04',
                              DAT_00202c6c,
                              DAT_00202c6c + 2);
  /* Was `DAT_00202c6c + 2` -- disassembly-confirmed (0x4b288 @ 0x4b474: `strb r3,[r0,#0x4]`) the
     real target is offset+4/+5 (the same "Z" field this function's own later collision calls read
     via `*(short *)(DAT_00202c6c + 4)`), not offset+2... */
  *(byte *)((char *)DAT_00202c6c + 4) = projectile->hdr.zpos;
  *(byte *)((char *)DAT_00202c6c + 5) = 0;
  collision_height_envelope(0,1);
  collision_build_height_field(0);
  if (((local_2a | local_2c) & 0x300) == 0) {
    if ((byte)DAT_00202c6c[20] != 0) {
      sort_collision_candidates();
      if (*(byte *)((char *)DAT_00202c6c + 0x15) != 0) goto LAB_0004b4d4;
    }
    uVar2 = projectile->tile_position;
    uVar6 = uVar2 & 0x3ff;
    /* ARM 0x4b4e4..0x4b5d0 reads full X/Y words at bytes 0/2;
       byte reads discarded X's high bits and used X's high byte as Y. */
    uVar7 = ((int)(short)(*(ushort *)DAT_00202c6c & 0x1f8) >> 3) << 10;
    projectile->tile_x = (uVar7 >> 10) & 0x3f;
    uVar7 = uVar2 & 0xf | uVar7 | ((int)(short)(*(ushort *)(DAT_00202c6c + 2) & 0x1f8) >> 3) << 4;
    projectile->tile_y = (uVar7 >> 4) & 0x3f;
    uVar7 = (uint)projectile->hdr.position_word;
    uVar6 = uVar7 & 0x1fff;
    bVar1 = (byte)((((byte)*DAT_00202c6c & 7) << 0xd) >> 8);
    projectile->hdr.xpos = bVar1 >> 5;
    uVar2 = *(ushort *)(DAT_00202c6c + 2);
    uVar7 = uVar7 & 0x3ff;
    uVar4 = 1;
    projectile->hdr.ypos = uVar2 & 7;
  }
  else {
LAB_0004b4d4:
    uVar4 = 0;
  }
#undef local_38
#undef local_2c
#undef local_2a
  return uVar4;
}




// was FUN_0007bf38
int check_object_combination(void *actor_ptr, ushort *object, short count)
{
  char *actor = (char *)actor_ptr;
  ushort uVar1;
  ushort uVar2;
  short sVar3;
  ushort *puVar4;
  uint uVar5;
  uint uVar6;
  ushort *local_18;
  
  if ((((*object & 0x8000) != 0) || (local_18 = object + 3, (*local_18 & 0xffc0) == 0)) ||
     (puVar4 = (ushort *)find_object_in_chain(&local_18,0,4,0,0xf), puVar4 == (ushort *)0x0)) {
    return 1;
  }
  uVar1 = ((uw_object_hdr_t *)puVar4)->type_flags;
  if ((uVar1 & 0x200) == 0) {
    if (0 < count) {
      uVar2 = *object;
      if ((((uVar2 & 0x1f0) != 0x140) || ((uVar2 & 0xf) < 8)) &&
         (((uVar2 & 0x1f0) != 0x80 || ((0xb < (uVar2 & 0xf) || ((uVar2 & 1) == 0)))))) {
        if ((((uw_object_hdr_t *)puVar4)->link & 0x1ff) != (int)count) {
          return 0;
        }
        ((uw_object_hdr_t *)puVar4)->type_flags_low = (byte)(char)uVar1;
        ((uw_object_hdr_t *)puVar4)->type_flags_high = (byte)(uVar1 >> 8) | 2;
        return 2;
      }
    }
    return 4;
  }
  uVar6 = (uint)count;
  if ((int)uVar6 < 0) {
    uVar5 = ((uw_object_hdr_t *)puVar4)->zpos;
    if (((uVar5 != 0xe) || (0x1e < (int)-uVar6)) &&
       ((uVar5 != 0xf &&
        (sVar3 = roll_skill_check((int)(uVar6 * -0x10000) >> 0x10,(((uw_object_hdr_t *)puVar4)->zpos) * 3),
         0 < sVar3)))) {
LAB_0007c130:
      trigger_object_trap_or_use_action(actor,object,6,(int)DAT_002020a0,DAT_002020a4);
      if ((((uw_object_hdr_t *)puVar4)->flags_res & 0x2) == 0) {
        object_list_unlink(local_18,puVar4);
        free_object_slot(puVar4);
      }
      else {
        uVar6 = ((uw_object_hdr_t *)puVar4)->type_flags & 0xfdff;
        ((uw_object_hdr_t *)puVar4)->type_flags = (ushort)uVar6;
      }
      return 3;
    }
  }
  else if (((0 < (int)uVar6) && ((((uw_object_hdr_t *)puVar4)->link & 0x1ff) != 0)) && ((((uw_object_hdr_t *)puVar4)->link & 0x1ff) == uVar6))
  goto LAB_0007c130;
  return 0;
}







// was FUN_00073b40 -- looks up tile-type id param_1 (0..0x34) in a per-type 4-byte-stride table
// (DAT_00087530/DAT_00087533) to get a "special action" type/id pair, then forwards to
// execute_spell_effect with param_2/param_3 as the actor object and an extra parameter.
void dispatch_tile_special_action(uint tile_type, void *actor, void *target)
{
  tile_type = tile_type & 0xff;
  if (tile_type < 0x35) {
    execute_spell_effect((byte)(&DAT_00087530)[tile_type * 4] >> 3,(&DAT_00087533)[tile_type * 4],actor,
                 target);
  }
}





// was FUN_00074028 -- execute_spell_effect's "reduce item durability" handler (its own case 9):
// only applies if the target object's quality bits match 0x40 (same food/potion-shaped flag
// apply_healing_effect gates on) and its quality/charge field...
void reduce_item_quality_on_use(ushort *object, char dice_count)
{
  byte bVar1;
  char cVar2;
  
  if ((*object & 0x1c0) == 0x40) {
    cVar2 = roll_dice_sum((int)dice_count,8);
    bVar1 = (byte)object[4];
    if (3 < bVar1) {
      if ((int)((uint)bVar1 - (int)cVar2) < 4) {
        cVar2 = '\x03';
      }
      else {
        cVar2 = bVar1 - cVar2;
      }
      *(char *)(object + 4) = cVar2;
      if (object == g_player_object) {
        weapon_overlay_flash_once(0xa8);
      }
    }
  }
}







// was FUN_0007471c -- scans a rectangular tile area (top-left (param_5,param_6), size param_7 x
// param_8, clamped to the 0-63 tilemap bounds) and invokes the callback param_3...
void scan_area_for_matching_objects(char filter_a, byte filter_b, int (*callback)(), char object_class, char x, char y, char width, char height)
{
  int iVar1;
  ushort uVar2;
  ushort uVar3;
  int iVar4;
  undefined4 uVar5;
  ushort *puVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int extraout_r1;
  int iVar10;
  char cVar11;
  int iVar12;
  ushort *puVar13;
  byte *pbVar14;
  int iVar15;
  int iVar16;
  bool bVar17;
  bool bVar18;
  short local_60;
  short local_5e;

  /* callback (the match callback) legitimately arrives NULL for a cone-damage/search-effect spell
     cast (execute_spell_effect case 6/7, via
     cast_cone_damage_spell/cast_targeted_search_effect)... */
  if (callback == (int (*)())0) {
    return;
  }
  iVar1 = (int)x;
  local_5e = 0;
  if (((iVar1 < 0x40) && (iVar8 = iVar1 + width, -1 < iVar8)) &&
     (iVar10 = (int)y, iVar10 < 0x40)) {
    iVar12 = (int)height;
    iVar16 = iVar10 + height;
    if (-1 < iVar16) {
      if (iVar1 < 0) {
        width = (char)((uint)(iVar8 * 0x1000000) >> 0x18);
        x = '\0';
      }
      else if (0x3f < iVar8) {
        width = '@' - x;
      }
      bVar17 = iVar10 < 0;
      bVar18 = iVar10 == 0;
      if (bVar17) {
        y = '\0';
        iVar12 = iVar16 * 0x1000000 >> 0x18;
      }
      else {
        bVar18 = iVar16 == 0x40;
      }
      if (!bVar18 && (!bVar17 && 0x3f < iVar16)) {
        iVar12 = iVar10 << 0x18;
      }
      if (!bVar18 && (!bVar17 && 0x3f < iVar16)) {
        iVar12 = iVar12 >> 0x18;
      }
      cVar11 = (char)iVar12;
      iVar1 = (int)width;
      if (!bVar18 && (!bVar17 && 0x3f < iVar16)) {
        cVar11 = '@' - cVar11;
      }
      if ((0 < iVar1) && (iVar8 = (int)cVar11, 0 < iVar8)) {
        iVar12 = (int)y;
        iVar10 = (int)x;
        /* was folded into `int iVar16` (reused above for unrelated int
           values) -- truncated tilemap_lookup's real `void *` return */
        char *_tile16 = (char *)tilemap_lookup(iVar10,iVar12);
        iVar9 = iVar1 + x;
        do {
          local_60 = (short)iVar10;
          iVar7 = (int)local_60;
          if (iVar7 <= iVar9) {
            iVar4 = iVar8 + y;
            do {
              iVar15 = (int)(short)iVar12;
              if ((short)iVar12 <= iVar4) {
                do {
                  if (((-1 < iVar7) && (iVar7 < 0x40)) && ((-1 < iVar15 && (iVar15 < 0x40)))) {
                    pbVar14 = (byte *)(_tile16 + (((iVar15 - y) * 0x40 - (int)x) + iVar7)
                                                * 4);
                    if (object_class == '@') {
                      if ((*pbVar14 & 0xf) != 0) {
                        uVar5 = ce_rand();
                        extraout_r1 = ordint_divmod(iVar8 * iVar1 + 3,uVar5).rem;
                        if (((extraout_r1 < filter_a) &&
                            (iVar10 = ((int (*)(int,int,void *,void *,int))callback)((int)local_60,iVar12,0,pbVar14,filter_b),
                            iVar10 != 0)) &&
                           (iVar10 = (filter_a + -1) * 0x1000000,
                           filter_a = (char)((uint)iVar10 >> 0x18), iVar10 >> 0x18 == 0)) {
                          return;
                        }
                      }
                    }
                    else {
                      puVar13 = (ushort *)(pbVar14 + 2);
                      puVar6 = (ushort *)resolve_object_link(puVar13);
                      while (puVar6 != (ushort *)0x0) {
                        uVar2 = *puVar13;
                        if (object_class == -0x80) {
LAB_000749c4:
                          iVar10 = ((int (*)(int,int,void *,void *,int))callback)((int)local_60,iVar12,puVar6,pbVar14,filter_b);
                          if ((iVar10 != 0) &&
                             (iVar10 = (int)filter_a, filter_a = (char)(iVar10 + -1),
                             (iVar10 + -1) * 0x1000000 >> 0x18 < 1)) {
                            return;
                          }
                        }
                        else if (object_class == '\0') {
                          if ((((uw_object_hdr_t *)puVar6)->object_id & 0x1c0) == 0x40) {
                            uVar3 = encode_object_slot_index(puVar6);
                            if (uVar3 != filter_b) goto LAB_000749c4;
                            goto LAB_000749bc;
                          }
                        }
                        else {
LAB_000749bc:
                          if (object_class == -0x40) goto LAB_000749c4;
                        }
                        if (*puVar13 >> 6 == uVar2 >> 6) {
                          puVar13 = puVar6 + 2;
                        }
                        puVar6 = (ushort *)resolve_object_link(puVar13);
                      }
                    }
                  }
                  iVar12 = (iVar15 + 1) * 0x10000 >> 0x10;
                  iVar15 = iVar12;
                } while (iVar12 <= iVar4);
                iVar10 = (int)(short)x;
                iVar12 = (int)(short)y;
              }
              iVar15 = (iVar7 + 1) * 0x10000;
              iVar7 = iVar15 >> 0x10;
              local_60 = (short)((uint)iVar15 >> 0x10);
            } while (iVar7 <= iVar9);
          }
        } while (((object_class == '@') && ('\0' < filter_a)) &&
                (iVar7 = (int)local_5e, local_5e = (short)((uint)((iVar7 + 1) * 0x10000) >> 0x10),
                iVar7 < 4));
      }
    }
  }
}



// was FUN_00074ad0 -- computes a position projected param_5 tiles ahead of object param_1's facing
// (project_position_by_heading, using its heading bits at offset+2 and location at offset+0x16)...
/* ARM carries the callback unchanged into the scan (r11 -> pc at 0x749e4). A 32-bit integer
   truncates its native function address. */
void scan_area_ahead_of_object(void *object_ptr, int filter_a, int (*callback)(), int object_class, byte distance, char half_width)
{
  char *object = (char *)object_ptr;
  char cVar1;
  ushort uVar2;
  uint uVar3;
  ushort local_1c;
  ushort local_1a;
  
  uVar2 = encode_object_slot_index(object);  /* ARM 0x74ad0-0x74ae8: r0 untouched since entry */
  uVar3 = *(ushort *)(object + 2) & 0x380;
  if ((short)uVar2 < 0x100) {
    uVar2 = uVar2 & 0xff;
    uVar3 = (*(byte *)(object + 0x18) & 0x1f) + (uVar3 >> 2);
    local_1a = *(ushort *)(object + 0x16) >> 10;
    local_1c = (ushort)((*(ushort *)(object + 0x16) & 0x3f0) >> 4);
  }
  else {
    uVar3 = uVar3 >> 2;
    uVar2 = 0;
    local_1a = (ushort)DAT_0023c3dc;
    local_1c = (ushort)DAT_0023c3d8;
  }
  project_position_by_heading(uVar3,distance,&local_1a,&local_1c);
  cVar1 = half_width * '\x02' + '\x01';
  scan_area_for_matching_objects(filter_a,uVar2,callback,object_class,(char)local_1a - half_width,(char)local_1c - half_width,cVar1
               ,cVar1);
}





// was FUN_00074be8 -- iterates the active-object slot range [DAT_002046c0, DAT_002046c8), and for
// each object whose type-id byte (offset +0x1a) matches param_1, invokes callback param_4 as
// (object, param_3).
void for_each_object_of_type(ushort type_id, int mode, int argument, int (*callback)())
{
  intptr_t iVar1; // was `int` -- get_object_record_by_slot_index returns a real 64-bit object pointer, truncated on this host (this loop was never exercised until babl_builtin_set_attitude's own recovery)
  undefined1 *puVar2;

  puVar2 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      iVar1 = (intptr_t)get_object_record_by_slot_index(*puVar2);
      if (*(byte *)(iVar1 + 0x1a) == type_id) {
        iVar1 = ((int (*)(intptr_t,int))callback)(iVar1,argument);
        if (iVar1 != 0) {
          puVar2 = puVar2 + -1;
        }
        if (mode == 0) {
          return;
        }
      }
      puVar2 = puVar2 + 1;
    } while (puVar2 < DAT_002046c8);
  }
}









// was FUN_00075a88 -- walks every object on tile (param_1,param_2) (tilemap_lookup + the object
// linked list) and applies damage to each one via the general damage dispatcher
// (apply_typed_damage_to_object, not yet named): rolls dice from a damage-tier table...
void damage_all_objects_at_tile(int tile_x, short tile_y, char damage_tier, byte attacker_slot)
{
  undefined1 uVar1;
  char *iVar2;  /* was `int` -- truncated tilemap_lookup's/resolve_object_link's
                   real `void *` returns */
  char *iVar3;  /* was `int` -- same, holds resolve_object_link's return */
  void *uVar4;
  byte bVar5;

  bVar5 = damage_tier - 1;
  if (damage_tier != '\0') {
    iVar2 = (char *)tilemap_lookup(tile_x,tile_y);  /* ARM 0x75ab4-0x75ab8: r1 still holds tile_y */
    iVar2 = (char *)resolve_object_link(iVar2 + 2);
    if (iVar2 != 0) {
      do {
        iVar3 = (char *)resolve_object_link(iVar2 + 4);
        uVar1 = roll_dice_sum((&DAT_0008762c)[bVar5],(&DAT_00087630)[bVar5]);
        uVar4 = get_object_record_by_slot_index(attacker_slot);
        apply_typed_damage_to_object((ushort *)iVar2,uVar4,tile_x,(int)tile_y,uVar1,(&DAT_00087634)[bVar5]);
        iVar2 = iVar3;
      } while (iVar3 != 0);
    }
  }
}





// was FUN_00078b18 -- builds an object's display name into param_1's buffer. For a creature (type
// class 0x1c0==0x40) with a valid "whoami" id (param_2[0xd], uw_mobile_object_t's npc_whoami
// field), looks up and copies that creature's proper name string directly.
int build_object_display_name(char *out_text, void *object_ptr, int flag_a, int flag_b)
{
  ushort *object = (ushort *)object_ptr;
  char cVar1;
  uint uVar2;
  char *pcVar3;
  intptr_t iVar4;
  
  if ((((*object & 0x1c0) == 0x40) && (uVar2 = (uint)(byte)object[0xd], uVar2 != 0)) &&
     (uVar2 < 0xf0)) {
    pcVar3 = (char *)get_message_string(uVar2 + 0x10 | 0xe00);
    if ((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) {
      return 0;
    }
    iVar4 = (intptr_t)out_text - (intptr_t)pcVar3;
    do {
      cVar1 = *pcVar3;
      pcVar3[iVar4] = cVar1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
  }
  else {
    pcVar3 = (char *)get_message_string(*object & 0x1ff | 0x800);
    if (pcVar3 == (char *)0x0) {
      return 0;
    }
    if (*pcVar3 == '\0') {
      return 0;
    }
    pcVar3 = (char *)format_object_display_name(pcVar3,flag_a,flag_b);
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
      *out_text = cVar1;
      out_text = out_text + 1;
    } while (cVar1 != '\0');
  }
  return 1;
}



// was FUN_00078bfc
byte *format_object_display_name(byte *buffer, int flag_a, int flag_b)
{
  undefined1 *puVar1;
  int iVar2;
  
  puVar1 = (undefined1 *)ce_strchr(buffer,0x26);
  if (flag_b == 0) {
    if (puVar1 != (undefined1 *)0x0) {
      *puVar1 = 0;
    }
  }
  else if (puVar1 == (undefined1 *)0x0) {
    iVar2 = ce_strlen(buffer);
    buffer[iVar2] = 0x73;
    (buffer + iVar2)[1] = 0;
  }
  else {
    buffer = puVar1 + 1;
  }
  puVar1 = (undefined1 *)ce_strchr(buffer,0x5f);
  if (puVar1 != (undefined1 *)0x0) {
    if (flag_a == 0) {
      buffer = puVar1 + 1;
    }
    else {
      *puVar1 = 0x20;
    }
  }
  return buffer;
}



// was FUN_00078c80 -- looks up message id param_1 (in the 0x200 message-page range) and prints it
// to the message scroll.
void print_scroll_message_by_id(uint message_id)
{
  message_scroll_print_wrapped(get_message_string(message_id | 0x200)); // was two separate calls with message_scroll_print_wrapped()'s arg dropped; see uw.c ~7961's sibling call and its comment
}





// was FUN_00078c94 -- prints a scroll message built by concatenating up to 3 message ids: param_1
// is always looked up and copied first, then param_2 and param_3 are each appended in turn if
// non-negative (a caller passing -1 skips that piece).
void print_scroll_message_concat(uint id_a, uint id_b, uint id_c)
{
  char cVar1;
  char *pcVar2;
  char *uVar3;   /* was undefined4 -- get_message_string returns char*; truncating
                    it fed ce_strcat (strcat) a wild src pointer */
  char *pcVar4;
  char local_10c [256];
  
  pcVar4 = local_10c;
  pcVar2 = (char *)get_message_string(id_a | 0x200);
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
    *pcVar4 = cVar1;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  if (-1 < (short)id_b) {
    uVar3 = get_message_string(id_b | 0x200);
    ce_strcat(local_10c,uVar3);
  }
  if (-1 < (short)id_c) {
    uVar3 = get_message_string(id_c | 0x200);
    ce_strcat(local_10c,uVar3);
  }
  message_scroll_print_wrapped(local_10c);
}



// was FUN_0007ca50 -- resolves an object instance's (param_1) packed quality/variant field into a
// (class, value) pair plus a flag distinguishing "ordinary quality variant" from "special/linked"
// items.
int resolve_object_variant_or_special_link(void *object_ptr, void *out_class_ptr, void *out_value_ptr, void *out_flag_ptr)
{
  ushort *object = (ushort *)object_ptr;
  ushort *out_class = (ushort *)out_class_ptr;
  ushort *out_value = (ushort *)out_value_ptr;
  uint *out_flag = (uint *)out_flag_ptr;
  byte bVar1;
  ushort uVar2;
  int iVar3;
  ushort uVar4;
  uint uVar5;
  ushort *local_20;
  
  uVar2 = *object;
  if ((uVar2 & 0x1c0) != 0x180) {
    if (((uVar2 & 0x8000) == 0) && (local_20 = object + 3, (*local_20 & 0xffc0) != 0)) {
      object = (ushort *)find_object_in_chain(&local_20,0,4,2,0);
      if (object == (ushort *)0x0) {
        return 0;
      }
      if ((((object[2] & 0x3f) == 0) && (DAT_0024cfcc == 0)) &&
         (iVar3 = rand_below(10), iVar3 < 4)) {
        return 0;
      }
    }
    else {
      if ((uVar2 & 0x8000) == 0) {
        return 0;
      }
      if ((uVar2 & 0x1000) == 0) {
        return 0;
      }
      if ((uVar2 & 0x1c0) == 0x140) {
        return 0;
      }
    }
    if (object != (ushort *)0x0) {
      uVar5 = (uint)((*object & 0x800) != 0);
      *out_flag = uVar5;
      if (uVar5 == 1) {
        bVar1 = *(byte *)((char *)object + 7) >> 4;
        uVar2 = bVar1 & 7;
        *out_class = uVar2;
        uVar4 = 0xffff;
        if ((bVar1 & 7) != 0) {
          uVar4 = uVar2 + 0xc;
        }
        *out_class = uVar4;
        uVar5 = object[3] & 0xfc0;
      }
      else {
        *out_class = (ushort)((*(byte *)((char *)object + 7) & 0x7c) >> 2);
        uVar5 = object[3] & 0x3c0;
      }
      *out_value = (short)(uVar5 >> 6);
      return 1;
    }
  }
  return 0;
}





// was FUN_0007cc30 -- called by src/player.c's equip-effect refresh loop right after
// apply_equipped_item_effect succeeds for an equipped item; only acts when the item's flags word
// has bit 0x8000 set (the same gating bit resolve_object_variant_or_special_link checks first).
void clear_object_pending_special_flag(void *object_ptr)
{
  ushort *object = (ushort *)object_ptr;
  ushort uVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  bool bVar5;
  
  uVar1 = *object;
  uVar3 = (uint)uVar1;
  if ((uVar1 & 0x8000) != 0) {
    uVar4 = uVar3 & 0x1000;
    bVar5 = (uVar1 & 0x1000) != 0;
    uVar2 = uVar3;
    if (bVar5) {
      uVar4 = uVar3 & 0x1c0;
      uVar2 = 0x140;
    }
    if (bVar5 && uVar4 != uVar2) {
      *(char *)object = (char)(uVar3 & 0xefff);
      *(char *)((char *)object + 1) = (char)((uVar3 & 0xefff) >> 8);
    }
  }
}



// was FUN_0007cc78 -- trigger_object_use_babl_script's "finalize" step for the interacting object
// (src/item_use.c's own comment already names this function).
void consume_linked_special_object_charge(void *object_ptr)
{
  char *object = (char *)object_ptr;
  ushort uVar1;
  byte bVar2;
  void *iVar3;
  int iVar4;
  ushort *local_c;
  
  if (((((*(byte *)(object + 1) & 0x80) == 0) &&
       (local_c = (ushort *)(object + 6), (*local_c & 0xffc0) != 0)) &&
      (iVar3 = find_object_in_chain(&local_c,0,4,2,0), iVar3 != 0)) && ((((uw_object_hdr_t *)iVar3)->flags_res & 0x4) != 0)) {
    uVar1 = ((uw_object_hdr_t *)iVar3)->chain_word;
    if ((uVar1 & 0x3f) == 0) {
      iVar4 = rand_below(10);
      if (iVar4 < 4) {
        object_list_unlink(local_c,iVar3);
        free_object_slot(iVar3);
      }
    }
    else {
      bVar2 = (byte)uVar1;
      ((uw_object_hdr_t *)iVar3)->chain_word_low = (bVar2 - 1 ^ bVar2) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)iVar3)->chain_word_high = (byte)(char)(uVar1 >> 8);
    }
  }
}





// was FUN_0007ec58 -- confirmed by its only caller's own pre-existing comment
// (cast_detect_life_spell, src/object_actions.c) as bucketing a relative (dx,dy) offset into one of
// 8 compass directions (0-7).
char compute_compass_direction(char dx, char dy)
{
  uint uVar1;
  uint uVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  uVar1 = (uint)dx;
  iVar4 = (uVar1 ^ (int)uVar1 >> 0x1f) - ((int)uVar1 >> 0x1f);
  uVar2 = (uint)dy;
  iVar5 = (uVar2 ^ (int)uVar2 >> 0x1f) - ((int)uVar2 >> 0x1f);
  iVar6 = iVar4;
  if (iVar4 < 0) {
    iVar6 = iVar4 + 1;
  }
  if (iVar5 < iVar6 >> 1) {
    if ((int)uVar1 < 1) {
      cVar3 = '\x06';
    }
    else {
      cVar3 = '\x02';
    }
  }
  else {
    if (iVar5 < 0) {
      iVar5 = iVar5 + 1;
    }
    if (iVar4 < iVar5 >> 1) {
      if ((int)uVar2 < 1) {
        cVar3 = '\x04';
      }
      else {
        cVar3 = '\0';
      }
    }
    else if ((int)uVar1 < 0) {
      cVar3 = (0 < (int)uVar2) * '\x02' + '\x05';
    }
    else {
      cVar3 = ((int)uVar2 < 0) * '\x02' + '\x01';
    }
  }
  return cVar3;
}





// was FUN_0007ed20 -- prints param_1 (a get_message_string result at every confirmed call site) via
// message_scroll_print_wrapped, then compares two (x,y) tile positions (param_2/3 vs param_5/6)
// against a max-distance threshold...
void print_message_with_proximity_qualifier(char *message, short x1, short y1, short z1, short x2, short y2, short z2, short limit)
{
  uint uVar1;
  uint uVar2;
  bool bVar3;
  char *pcVar4;

  bVar3 = false;
  /* HACK: was a bare `message_scroll_print_wrapped();` -- dropped argument, the same class of bug
     fixed repeatedly elsewhere in this file. */
  message_scroll_print_wrapped(message);
  if (limit < 0) {
LAB_0007ed8c:
    bVar3 = true;
  }
  else {
    uVar1 = ((int)x1 - (int)x2) >> 0x1f;
    uVar2 = ((int)y1 - (int)y2) >> 0x1f;
    if ((int)limit <
        (int)((((int)y1 - (int)y2 ^ uVar2) - uVar2) +
             (((int)x1 - (int)x2 ^ uVar1) - uVar1))) goto LAB_0007ed8c;
  }
  if ((z1 == z2) || (z1 == 0)) {
    if ((bVar3) || (z1 == 0)) goto LAB_0007edd8;
    pcVar4 = s_very_near_00087954;
  }
  else {
    if (!bVar3) goto LAB_0007edd8;
    pcVar4 = s_and_00087310;
  }
  message_scroll_print_wrapped(pcVar4);
LAB_0007edd8:
  message_scroll_print_wrapped(&DAT_00084f20);
}





// was FUN_00081388 -- spawns a small burst of 2-4 debris/particle objects at tile
// (param_2,param_3), each copied from the 8-byte template param_1, given randomized
// position/orientation offsets within the tile, linked into the tile's object list...
void spawn_effect_debris_burst(void *template_ptr, uint tile_x, int tile_y)
{
  uw_object_hdr_t *template = (uw_object_hdr_t *)template_ptr;
  int uw_ord2005_rem_170 = 0; int uw_ord2005_rem_171 = 0; int uw_ord2005_rem_172 = 0; int uw_ord2005_rem_173 = 0; int uw_ord2005_rem_174 = 0;
  short sVar1;
  ushort uVar2;
  byte bVar3;
  byte bVar4;
  short sVar5;
  undefined4 uVar6;
  int iVar7;
  uw_object_hdr_t *puVar8;
  uint uVar9;
  uint uVar10;
  undefined4 uVar11;
  short extraout_r1;
  short extraout_r1_00;
  short extraout_r1_01;
  short extraout_r1_02;
  short extraout_r1_03;
  undefined1 uVar12;
  undefined1 uVar13;
  
  uVar6 = ce_rand();
  uw_ord2005_rem_170 = ((int)(uVar6)) % (3);
  iVar7 = uw_ord2005_rem_170 + 2;
  sVar1 = (short)iVar7;
  while (-1 < iVar7 * 0x10000 >> 0x10) {
    puVar8 = alloc_object_slot(0);
    puVar8->type_flags = template->type_flags;
    puVar8->position_word = template->position_word;
    puVar8->chain_word = template->chain_word;
    puVar8->link_word = template->link_word;
    uVar9 = ce_rand();
    uVar10 = (uint)puVar8->type_flags;
    uVar10 = ((uVar9 & 1) + uVar10 + 1 ^ uVar10) & 0x1ff ^ uVar10;
    puVar8->object_id = uVar10 & 0x1ff;
    bVar3 = puVar8->xpos;
    do {
      do {
        uVar6 = ce_rand();
        uw_ord2005_rem_171 = ((int)(uVar6)) % (5);
        iVar7 = ((int)(((int)uw_ord2005_rem_171 - 2U) * 0x10000) >> 0x10) + (int)(short)(ushort)bVar3;
      } while (iVar7 < 0);
    } while (7 < iVar7);
    uVar9 = puVar8->position_word & 0x1fff ^ (((int)uw_ord2005_rem_171 - 2U & 0xffff) + (uint)bVar3 & 0xffff) << 0xd
    ;
    puVar8->xpos = (uVar9 >> 13) & 7;
    uVar9 = (uVar9 & 0x1c00) >> 10;
    do {
      do {
        uVar6 = ce_rand();
        uw_ord2005_rem_172 = ((int)(uVar6)) % (5);
        iVar7 = ((int)(((int)uw_ord2005_rem_172 - 2U) * 0x10000) >> 0x10) + (int)(short)uVar9;
      } while (iVar7 < 0);
    } while (7 < iVar7);
    bVar3 = (byte)(puVar8->position_word >> 8);
    puVar8->ypos = (((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9) & 7;
    bVar4 = ce_rand();
    uVar2 = puVar8->position_word;
    bVar3 = (byte)uVar2;
    puVar8->zpos = ((bVar4 & 0xf) + bVar3 - 8) & 0x7f;
    /* was folded into `int iVar7` (this function's loop counter, reused
       immediately after this for unrelated int values) -- truncated
       tilemap_lookup's real `void *` return */
    {
      char *_tile7 = (char *)tilemap_lookup(tile_x,tile_y);
      object_list_insert_head(_tile7 + 2,puVar8);
    }
    uVar6 = ce_rand();
    uw_ord2005_rem_173 = ((int)(uVar6)) % (3);
    uVar6 = ce_rand();
    uVar11 = encode_object_slot_index(puVar8);
    uVar12 = (undefined1)tile_y;
    uVar13 = (undefined1)uw_ord2005_rem_173;
    uw_ord2005_rem_174 = ((int)(uVar6)) % (3);
    sVar5 = scheduler_add_entry(uVar11,((int)uw_ord2005_rem_174 - (int)uw_ord2005_rem_173) + 2,(int)uw_ord2005_rem_173,
                         tile_x & 0xff,uVar12);  /* a 6th arg (uVar13) was Ghidra noise: ARM scheduler_add_entry takes 5 */
    if (sVar5 == -1) {
      /* was folded into `int iVar7` (this function's loop counter) --
         truncated tilemap_lookup's real `void *` return */
      char *_tile7b = (char *)tilemap_lookup(tile_x,tile_y);
      object_list_unlink(_tile7b + 2,puVar8);
      free_object_slot(puVar8);
      iVar7 = -1;
    }
    else {
      iVar7 = (int)sVar1;
    }
    iVar7 = iVar7 + -1;
    sVar1 = (short)iVar7;
  }
}





// was FUN_0002a35c -- initializes a newly-spawned creature's default stat/flag fields on
// g_scratch_object_ptr: clears combat/status bitfields (poison, paralysis, sleep, etc.), rolls a
// randomized field (byte 8) from the monster combat-stat table...
int init_monster_spawn_defaults()

{
  int uw_ord2005_rem_11 = 0;
  undefined4 uVar2;
  int extraout_r1;
  int iVar3;
  uw_mobile_object_t *npc = (uw_mobile_object_t *)g_scratch_object_ptr;
  
  npc->npc_xhome = 32;
  npc->npc_yhome = 32;
  npc->hdr.quality = 32;
  npc->hdr.owner = 32;
  DAT_001007c8 = &g_monster_type_props[npc->hdr.object_id & 0x3f];
  uVar2 = ce_rand();
  uw_ord2005_rem_11 = ((int)(uVar2)) % (0x18);
  iVar3 = (uw_ord2005_rem_11 + 0x10) * (uint)(byte) DAT_001007c8->max_hp;
  if (iVar3 < 0) {
    iVar3 = iVar3 + 0x1f;
  }
  npc->npc_hp = (byte)(iVar3 >> 5);
  npc->full_heading = npc->hdr.heading << 5;
  npc->npc_goal = 8;
  npc->npc_gtarg = 0;
  npc->npc_level = 0;
  npc->npc_target_tile_x = 0;
  npc->npc_target_tile_y = 0;
  /* These legacy status bits (4..12) have no documented field names. */
  npc->status_word &= 0xff0f;
  npc->status_word &= 0xfdff;
  npc->status_word &= 0xfbff;
  npc->status_word &= 0xf7ff;
  npc->status_word &= 0xfeff;
  npc->heading_flags = npc->heading_flags & 0xdf;
  npc->npc_swing_charge = 0;
  npc->tick_phase = 0;
  npc->attack_pitch = npc->attack_pitch & 0xfc | 4;
  npc->animation_flags = npc->animation_flags & 0xe0 | 0x20;
  npc->npc_animation_frame = 0;
  npc->attack_pitch = npc->attack_pitch & 7 | 0x80;
  npc->motion_flags = npc->motion_flags & 0x7f;
  npc->motion_flags = npc->motion_flags & 0x80;
  npc->recent_damage = 0;
  npc->damage_source = 0;
  npc->animation_flags = npc->animation_flags & 0x7f;
  npc->heading_flags = npc->heading_flags & 0x7f;
  npc->heading_flags = npc->heading_flags & 0xbf;
  npc->npc_path_slot = 0;
  npc->animation_flags = npc->animation_flags & 0xbf;
  npc->npc_whoami = 0;
  npc->npc_ai_flags = npc->npc_ai_flags & 0xfe;
  npc->npc_ai_flags = npc->npc_ai_flags & 0xfd;
  npc->npc_ai_flags = npc->npc_ai_flags & 0xef;
  npc->npc_ai_flags = npc->npc_ai_flags & 0xdf;
  npc->npc_ai_flags = npc->npc_ai_flags & 0xbf;
  npc->npc_ai_flags = npc->npc_ai_flags & 0x7f;
  npc->status_word &= 0xefff;
  npc->npc_talkedto = 0;
  npc->npc_attitude = 2;
  npc->movement_flags = npc->movement_flags & 0x7f;
  npc->npc_ai_flags = npc->npc_ai_flags & 0xf3;
  return 1;
}


// was FUN_00048b6c -- appends a "magical"/"cursed" property tag onto the caller's description
// buffer (param_3), resolved via resolve_object_variant_or_special_link. param_2 selects which tag
// family to check...
/* was undefined4 -- object ptr into resolve_object_variant_or_special_link was undefined4 --
   caller's stack buffer for ce_strcat */
int append_object_property_tag(ushort *object, short mode, char *out_text)
{
  int iVar1;
  bool bVar2;
  short local_14;
  undefined1 auStack_12 [2];
  int local_10;
  
  iVar1 = resolve_object_variant_or_special_link(object,&local_14,auStack_12,&local_10);
  if (iVar1 != 0) {
    if (mode == 2) {
      ce_strcat(out_text,s_magical_00085ca8);
      return 1;
    }
    if (mode == 3) {
      bVar2 = local_10 == 0;
      if (bVar2) {
        local_10 = (int)local_14;
      }
      if (bVar2 && local_10 == 9) {
        ce_strcat(out_text,s_cursed_00085ca0);
      }
    }
  }
  return 0;
}



// was FUN_00048bf0 -- appends a special/unique item's proper name onto the caller's description
// buffer (param_3, called after build_object_display_name), for param_2==3: resolves the item's
// variant/special-link data...

/* was int -- caller's stack buffer for ce_strcat/1044/1068 */
int append_object_special_name(void *object_ptr, short mode, char *out_text)
{
  byte *object = (byte *)object_ptr;
  int uw_ord2005_rem_113 = 0;
  char cVar1;
  int iVar2;
  ushort *chain_item;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  undefined4 uVar6;
  int extraout_r1;
  undefined2 *puVar7;
  ushort uVar8;
  bool bVar9;
  short local_28;
  undefined1 local_26 [2];
  undefined1 local_24;
  int local_20;
  byte *local_1c;
  int has_variant;
  
  DAT_0024cfcc = 1;
  has_variant = resolve_object_variant_or_special_link(object,local_26,&local_28,&local_20);
  DAT_0024cfcc = 0;
  if ((has_variant == 0) || (mode != 3)) {
LAB_00048e80:
    uVar6 = 0;
  }
  else {
    if (*(short *)local_26 == 0xc) {
      *(short *)local_26 = 0x1c0;
      if ((*object & 0x30) < 0x11) {
        iVar2 = (int)local_28;
      }
      else {
        iVar2 = local_28 + 0x10;
      }
      uVar3 = iVar2 + 0x1c0;
    }
    else {
      if (*(short *)local_26 == 0x9) goto LAB_00048e80;
      if ((local_20 == 0) || (0 < *(short *)local_26)) {
        uVar3 = (int)local_28 + *(short *)local_26 * 0x10;
      }
      else {
        uVar3 = (int)local_28 + 0x100;
      }
    }
    local_28 = (short)uVar3;
    pcVar4 = (char *)get_message_string(uVar3 | 0xc00);
    if ((pcVar4 == (char *)0x0) || (*pcVar4 == '\0')) {
      pcVar4 = s_UNNAMED_00084f24;
    }
    ce_strcat(out_text,&DAT_00085cd8);
    iVar2 = ce_strlen(pcVar4);
    iVar5 = ce_strlen(out_text);
    ce_memmove(out_text + iVar5,pcVar4,iVar2 + 1);
    if ((object[1] & 0x80) == 0) {
      local_1c = object + 6;
      uVar8 = 0xffff;
      chain_item = find_object_in_chain((ushort **)&local_1c,0,4,2,0);
      bVar9 = chain_item == 0;
      if (!bVar9) {
        bVar9 = (((uw_object_hdr_t *)chain_item)->flags_res & 0x4) == 0;
      }
      if (!bVar9) {
        uVar8 = ((uw_object_hdr_t *)chain_item)->quality;
      }
      iVar2 = (int)(short)uVar8;
      if (-1 < iVar2) {
        ce_strcat(out_text,s_with_00085cd0);
        if (iVar2 < 1) {
          puVar7 = (undefined2 *)DAT_00085cc8;
        }
        else {
          local_26[1] = DAT_00085ccd;
          local_26[0] = DAT_00085ccc;
          local_24 = DAT_00085cce;
          uw_ord2005_rem_113 = ((int)(iVar2)) % (10);
          local_26[1] = (char)((uint)((uw_ord2005_rem_113 + 0x30) * 0x1000000) >> 0x18);
          if (iVar2 < 10) {
            puVar7 = (undefined2 *)((char *)local_26 + 1);
          }
          else {
            cVar1 = ordint_divmod(10,iVar2).quot;
            local_26[0] = cVar1 + '0';
            puVar7 = (undefined2 *)local_26;
          }
        }
        ce_strcat(out_text,(char *)puVar7);
        ce_strcat(out_text,s_full_charge_00085cb8);
        if (iVar2 != 1) {
          ce_strcat(out_text,&DAT_00085cb4);
        }
      }
    }
    uVar6 = 1;
  }
  return uVar6;
}


// was FUN_00049008 -- "look" handler for inscribed objects (class range 0x160, dispatched from
// object_actions.c's look-description builder): terrain-plaque text for class 4, a gravestone
// epitaph looked up by index in grave.dat for class 5...
void look_at_inscribed_object(ushort *inscribed_object, short look_mode)
{
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  char cVar1;
  ushort uVar2;
  byte bVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  uint uVar9;
  short sVar10;
  char local_128 [8];
  char acStack_120 [260];
  /* iVar5 above is a real int (file handle) for the uVar8==5/grave.dat branch's
     open_file_for_read/CloseHandle calls -- but is reused later in the shared tail... */
  char *pcVar_str;

  DEBUG(INFO, "Look mode object interact?");
  
  local_128[0] = '\0';
  sVar10 = 0x160;
  uVar2 = *inscribed_object;
  uVar8 = uVar2 & 0xf;
  if (uVar8 == 4) {
    uVar8 = uVar2 & 0x1e00;
    if (uVar8 < 0x400) {
      print_scroll_message_by_id(0xab);
    }
    else {
      describe_picked_terrain(2,(uVar8 >> 9) + 0x2f);
    }
  }
  else {
    if (uVar8 != 5) {
      if (uVar8 != 6) {
        if (uVar8 < 0xe) {
          return;
        }
        if (0xf < uVar8) {
          return;
        }
        if (-1 < look_mode) {
          describe_picked_terrain(2,((byte)inscribed_object[3] & 0x3f) + 1);
        }
        if (look_mode < 1) {
          return;
        }
        if (((&DAT_0023add0)[(byte)inscribed_object[3] & 0x3f] & 0xff) != 9) {
          return;
        }
        trigger_terrain_discovery_illustration();
        return;
      }
      sVar10 = 0x170;
    }
    if ((uVar2 & 0x8000) == 0) {
      uVar9 = (byte)inscribed_object[3] & 0x3f;
    }
    else {
      uVar9 = ((ushort)inscribed_object[3] & 0x7fc0) >> 6;
    }
    if (uVar8 == 5) {
      ce_memset(acStack_120,0,0x104);
      pcVar4 = &DAT_0023cca8;
    stack0xffdc3238_ptr = acStack_120;
      do {
        cVar1 = *pcVar4;
        *stack0xffdc3238_ptr = cVar1; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
        pcVar4 = pcVar4 + 1;
      } while (cVar1 != '\0');
      ce_strcat(acStack_120,s__DATA_grave_dat_00085cf8);
      iVar5 = open_file_for_read(acStack_120);
      iVar6 = seek_file_handle(iVar5,(short)uVar9,0);
      iVar7 = read_file_handle(iVar5,local_128,1);
      bVar3 = CloseHandle(iVar5);
      if (((iVar7 == 1) & bVar3 & (iVar5 != -1 && iVar6 != -1)) == 0) {
        return;
      }
    }
    pcVar_str = (char *)get_message_string(uVar9 | 0x1000);
    if (pcVar_str != (char *)0x0 && local_128[0] != '\0') {
      msg_scroll_panel_reset(1);
    }
    if (((*inscribed_object & 0xf) == 6) || (local_128[0] == '\0')) {
      /* was two separate calls with message_scroll_print_wrapped()'s arg dropped -- same pattern
         already fixed at line ~9137: get_message_string's return (char *) flows straight into
         message_scroll_print_wrapped as its argument. */
      message_scroll_print_wrapped((char *)get_message_string((*inscribed_object >> 9 & 0xf) + sVar10 | 0x1000));
    }
    if (pcVar_str != (char *)0x0) {
      /* Same dropped-argument pattern: format_object_display_name's real `undefined1 *` return
         (pcVar_str word-wrapped for the message scroll) is the actual real sign/inscription text
         ("We attacked the entrance with all manner of tools..."), confirmed live. */
      message_scroll_print_wrapped((char *)format_object_display_name(pcVar_str,1,0));
      message_scroll_print_wrapped(&s_scroll_newline_0008522c);
    }
    if (local_128[0] != '\0') {
      trigger_inscription_illustration(local_128[0]);
    }
  }
}


// was FUN_000492bc -- describes who a key/quest item belongs to: for an object whose quality field
// names an owner (not 0, 0x28, or the 0x3c-0x3e range)...
void describe_object_owner(ushort *object, short mode)
{
  ushort uVar1;
  ushort uVar2;
  undefined4 uVar3;
  char *pcVar4;
  ushort local_54 [13];
  undefined1 local_3a;
  undefined1 auStack_34 [40];
  
  if (mode != 0) {
    uVar2 = object[3];
    uVar1 = uVar2 & 0x3f;
    if ((((uVar2 & 0x3f) != 0) && (uVar1 != 0x28)) && ((uVar1 < 0x3c || (uVar1 == 0x3f)))) {
      uVar3 = 0x16;
      if (((*object & 0x1ff) == 0xc6) || (0x40 < (uVar2 & 0xffc0))) {
        uVar3 = 0x17;
      }
      print_scroll_message_by_id(uVar3);
      uVar2 = (byte)object[3] & 0x3f;
      if (uVar2 == 0x3f) {
        pcVar4 = s_an_adventurer__00085d08;
      }
      else {
        local_54[0] = (uVar2 + 0x40 ^ local_54[0]) & 0x1ff ^ local_54[0];
        local_3a = 0;
        build_object_display_name(auStack_34,local_54,1,0);
        message_scroll_print_wrapped(auStack_34);
        pcVar4 = &DAT_00084f20;
      }
      message_scroll_print_wrapped(pcVar4);
    }
  }
}



// was FUN_000493cc -- prints a flavor-text scroll message keyed by the object's own sub-quality
// field (offset+6 & 0x3f, message range 100-163), if one exists for this object.
void print_object_flavor_text(ushort *object, short mode)
{
  char *iVar1;  /* was `int`: truncated get_message_string's real pointer, now actually dereferenced by message_scroll_print_wrapped */

  if ((mode != 0) &&
     (iVar1 = get_message_string((*(byte *)((char *)object + 6) & 0x3f) + 100 | 0xa00), iVar1 != 0)) {
    message_scroll_print_wrapped(iVar1);
  }
}



// was FUN_000495d0 -- dispatches a "look" sub-description by object class bit-fields (subcategory
// uVar2, sub-subcategory uVar3): keys in class 0xc2-0xc6 get describe_object_owner; class-4
// sub-type 3 objects get read_object_text (books/scrolls)...
void describe_special_object_property(ushort *object, short mode)
{
  ushort uVar1;
  ushort uVar2;
  ushort uVar3;

  uVar1 = *object;
  uVar3 = uVar1 >> 4 & 3;
  uVar2 = uVar1 >> 6 & 7;
  if (uVar2 == 3) {
    if (uVar3 == 0) {
      if ((0xc1 < (uVar1 & 0x1ff)) && ((uVar1 & 0x1ff) < 199)) {
        describe_object_owner(object,mode);
      }
    }
  }
  else if (uVar2 == 4) {
    if (uVar3 == 3) {
      read_object_text(object,mode);
    }
    else if (uVar3 == 0) {
      print_object_flavor_text(object,mode);
    }
  }
  else if (((uVar2 == 5) && (uVar3 == 0)) && ((uVar1 & 0xf) < 8)) {
    if ((object[3] & 1) != 0) {
      print_scroll_message_by_id(0x83);
    }
  }
}


// was FUN_000496b0 -- called from describe_picked_terrain with a tile record (param_2): only acts
// on special-mushroom-bearing tiles (trap-type field bits 0x1e == 0x14)...
int identify_mushroom_type(ushort *object, const uw_object_type_props_t *properties)
{
  ushort uVar1;
  int iVar2;
  short local_c;
  
  if ((properties->owner_flags & 0x1e) != 0x14) {
    return 0;
  }
  uVar1 = *object & 0x1ff;
  if (uVar1 < 0x98) {
    if (uVar1 == 0x97) {
      iVar2 = 2;
      goto LAB_000497a0;
    }
    if (uVar1 == 10) {
      iVar2 = 7;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x36) {
      iVar2 = 8;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x37) {
      iVar2 = 5;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x93) {
      iVar2 = 1;
      goto LAB_000497a0;
    }
  }
  else {
    if (uVar1 == 0xae) {
      iVar2 = 6;
      goto LAB_000497a0;
    }
    if (uVar1 == 0xbf) {
      iVar2 = 3;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x11f) {
      iVar2 = 4;
      goto LAB_000497a0;
    }
    if (uVar1 == 0x136) {
      iVar2 = 0;
      goto LAB_000497a0;
    }
  }
  iVar2 = (int)local_c;
LAB_000497a0:
  print_scroll_message_by_id(0x104);
  print_scroll_message_by_id(iVar2 + 0x105);
  return 1;
}



/* was check_scheduled_object_location_callback. */
// was FUN_00072268
void check_scheduled_object_location_callback()
{
  check_scheduled_object_level_match(*(byte *)(DAT_00086df8 + 0x5e) & 0xf,0x126);
  return;
}

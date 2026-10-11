/* NPC AI: the per-tick object dispatcher, pathfinding, movement toward a target tile, tile-position
   sync, and the mobile<->immobile object settle/destroy-roll logic. Split out of uw.c (the original
   monolithic decompile) once these functions' real roles were confirmed. */
#include "headers/ai.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

#define DAT_00085908 DAT_00085908_backing[0]
#define DAT_0023c4c0 DAT_0023c4c0_backing[0]
#define DAT_0023c5b8 DAT_0023c5b8_backing[0]
#define DAT_0024ac18 DAT_0024ac18_backing[0]
short DAT_0010061c;
short DAT_00100608;
/* Sizing-audit pass: `read_file_handle(param_1,&DAT_001007d0,0xc00)` (combat.c's
   load_monster_combat_stats) reads exactly 0xc00 (3072) bytes, matching every indexed access's
   `&0x3f` class-id mask * 0x30 stride (63*48+48=3072). HARD exact bound. Down from 6144. */
 uw_monster_type_props_t g_monster_type_props[64];
/* Reused-global-holding-a-real-string pattern (see the s_scroll_newline_0008522c comment in
   player.h) -- interact.c, ai.c and player.c all pass `&DAT_00084f20` straight into
   message_scroll_print_wrapped/ce_strcat with no write beforehand... */
 undefined DAT_00084f20_backing[128] = ".\n";
ushort DAT_00101414;
char *DAT_00101904;
undefined4 DAT_00101560;
undefined4 DAT_001013fc;
undefined4 DAT_0010191c;
static undefined4 DAT_00101440;
static byte DAT_00101450;
static byte DAT_00101730;
/* ARM 0x853c0..0x853c8 maps signed (dx*3 + dy) offsets to cached
   directions. DAT_000853c4 is the center, so negative indexes are valid. */
static undefined DAT_000853c0_backing[9] = {0xff,3,0xff,2,0xff,0,0xff,1,0xff};
#define DAT_000853c4 DAT_000853c0_backing[4]
/* ARM 0x853cc: diagonal tile types accepted for each cached direction. */
static undefined DAT_000853cc_backing[4] = {6,8,7,9};
#define DAT_000853cc DAT_000853cc_backing[0]
char *DAT_00101438;
static undefined1 DAT_0010142c;
/* NPC waypoints are contiguous 7-byte records at the original 0x101740.
   Alias the adjacent field symbols into this array so recording later
   waypoints cannot overwrite unrelated globals or 64-bit AI pointers. */
/* Sizing-audit pass: shared waypoint/scalar array, 7-byte stride. record_line_walk_step's own cap
   (`if (uVar1 < 0x40)` after the write, ai.c:~2448) allows the write index up to 63*7=441 before
   that function stops advancing further -- the GOVERNING bound... */
static char DAT_00101740_backing[448];
#define DAT_00101740 DAT_00101740_backing[0]
#define DAT_00101741 DAT_00101740_backing[1]
#define DAT_00101743 DAT_00101740_backing[3]
#define DAT_00101744 (*(undefined2 *)&DAT_00101740_backing[4])
#define DAT_00101746 DAT_00101740_backing[6]
#define DAT_00101747 DAT_00101740_backing[7]
#define DAT_00101748 DAT_00101740_backing[8]
/* Sizing-audit pass: direction-delta table, every index is
   `(2-bit value)*2` -- max 3*2=6. Sized to 8 for headroom; down from
   256. */
/* ARM 0x853b0: four interleaved signed X/Y direction deltas. */
static undefined1 DAT_000853b0_backing[8] = {0,1,1,0,0,0xff,0xff,0};
#define DAT_000853b0 DAT_000853b0_backing[0]
#define DAT_000853b1 DAT_000853b0_backing[1]
static undefined1 DAT_00101460;
static undefined1 DAT_001014e0_backing[256];
#define DAT_001014e0 DAT_001014e0_backing[0]
static undefined1 DAT_001014e1_backing[256];
#define DAT_001014e1 DAT_001014e1_backing[0]
/* Sizing pass: `ce_memset(&DAT_0023cf08,0,0x5000)` is the only touch of
   its real extent -- exactly 0x5000 (20480) bytes, half the declared
   size. */
static undefined1 DAT_0023cf08_backing[20480];
#define DAT_0023cf08 DAT_0023cf08_backing[0]
/* Sizing-audit pass: BUG FIX, not a shrink -- these 4 siblings are indexed by the exact same
   `iVar18 = (iVar8 + iVar7*0x40) * 5` formula as DAT_0023cf08 right above... */
static undefined DAT_0023cf09_backing[20480];
#define DAT_0023cf09 DAT_0023cf09_backing[0]
static undefined DAT_0023cf0a_backing[20480];
#define DAT_0023cf0a DAT_0023cf0a_backing[0]
static undefined DAT_0023cf0b_backing[20480];
#define DAT_0023cf0b DAT_0023cf0b_backing[0]
static undefined DAT_0023cf0c_backing[20480];
#define DAT_0023cf0c DAT_0023cf0c_backing[0]
#define DAT_00101742 DAT_00101740_backing[2]
/* Sizing-audit pass: pure scalar (distance-squared int), never
   indexed anywhere. Down from 256 elements. */
static undefined4 DAT_00101728_backing[1];
#define DAT_00101728 DAT_00101728_backing[0]
/* Was `undefined4` (4 bytes), truncating the real 64-bit pointers
   npc_ai_tick/setup_npc_ai_tick_state store here (&DAT_002048c0/002048f0/00204950, one of a 3-way
   "which per-class scratch buffer" choice)... */
void *DAT_0010172c;
#define DAT_00101749 DAT_00101740_backing[9]
static ushort DAT_000853b8;
#define DAT_0010174a DAT_00101740_backing[10]
ushort DAT_0010141c;
ushort DAT_00101910;
static undefined4 DAT_00101920;
static undefined4 DAT_00101914;
/* Sizing-audit pass: NPC path-cache, slot index masked `&0xf` everywhere (16 slots), 28-byte
   per-slot record (see advance_cached_path_step's own comment) -- 16*28=448 bytes, a HARD bound.
   Down from 8192. */
static undefined DAT_00101568_backing[448];
#define DAT_00101568 DAT_00101568_backing[0]
/* Sizing-audit pass: was an independent 256-byte array, but its only use (`(&DAT_00101569)[iVar6]`
   at ai.c:585, `iVar6=(uVar3&0xf)*0x1c`) indexes it with the exact same per-slot cache-record base
   as DAT_00101568 right above -- a field of that same record, not a separate table. */
#define DAT_00101569 DAT_00101568_backing[1]
undefined2 DAT_00101418;
undefined2 DAT_00101908;
static undefined1 DAT_00101738;
static byte DAT_00101458;
static byte DAT_001018fc;
static byte DAT_00101434;
/* Was a bare 1-byte `undefined` -- same split-symbol class as DAT_00204980/990/9b0's own
   backing-array fixes just above: build_object_placement_snapshot (called with this as its param_2
   "object state" out-buffer, via DAT_0010172c) writes fields up to offset 0x28 into it... */
undefined1 DAT_002048f0_backing[128];
#define DAT_002048f0 DAT_002048f0_backing[0]
undefined1 DAT_00204950_backing[128];
#define DAT_00204950 DAT_00204950_backing[0]
undefined4 DAT_00101944;
/* ARM UU.exe 0x853d8: sixteen little-endian attack-strength scales.
   npc_ai_tick indexes the low byte with the attack charge nibble * 2;
   apply_melee_damage multiplies the dice roll by this value / 128.
   The decompile omitted the initializer, making every NPC's scale zero. */
static undefined DAT_000853d8_backing[32] = {
  50,0, 60,0, 70,0, 80,0, 90,0, 100,0, 110,0, 120,0,
  130,0, 140,0, 155,0, 170,0, 185,0, 205,0, 230,0, 255,0
};
#define DAT_000853d8 DAT_000853d8_backing[0]
short DAT_00101938;
short DAT_0010193c;
byte DAT_0010192c;
byte DAT_00101930;
undefined1 DAT_00101934;
char DAT_0010194c;
char DAT_000853d0;
int DAT_00101940;
char DAT_00101928;
static char DAT_00101948;
static undefined4 DAT_00101950;
static byte DAT_0010195c;
static ushort *DAT_00101958;
ushort DAT_0024fa18;
static char DAT_00085910;
static char DAT_00085911;
static char DAT_00085918;
static char DAT_00085919;
/* Sizing-audit pass: a filename template with digit pokes at fixed offsets 8,9,0x10,0x11 (via
   DAT_00085910/11/18/19) -- hard lower bound 18 bytes. Real template text recovered
   (bug-fixes-pass-2): "\CRIT\CR00PAGE.N00". Sized to 32 for headroom; down from 8192. */
static undefined DAT_00085908_backing[32] = "\\CRIT\\CR00PAGE.N00";
static char s__CRIT_assoc_anm_00085934[] = "\\CRIT\\assoc.anm";
/* Sizing-audit pass: load_critter_association_tables's own per-level write is `puVar6[iVar7]` where
   `iVar7 = iVar10*3 + iVar5`, iVar10 bounded to 32 levels (`< 0x20`) and iVar5 bounded to 3 (`if
   (iVar5 < 3)` write guard) -- exact max index 31*3+2 = 95... */
undefined1 DAT_0023c460_backing[128];
/* DAT_0023c4c0/DAT_0023c5b8/DAT_0024ac18 (a resource-slot status table,
   load_critter_association_tables) were lone-byte scalars indexed up to 0x80 (128) -- confirmed
   overflowing into the unrelated DAT_00248410 (a malloc'd buffer pointer) via an lldb watchpoint... */
static undefined1 DAT_0023c4c0_backing[256];
static undefined1 DAT_0023c5b8_backing[256];
static undefined1 DAT_0024ac18_backing[256];
/* Was "named" with no surrounding spaces -- build_creature_look_text (creature look text) appends
   it directly between the description and the proper name with no separator of its own, so a named
   creature's look text ran the words together... */
static char s_named_00085d18[] = " named ";
/* Original binary 0x868c0..0x868d7 maps locomotion bit values to
   the compact mobile-record state (indexed by snapshot byte 0x28). */
static undefined DAT_000868c0_backing[24] = {
  0,0,1,0,2,0,0,0,3,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0
};
#define DAT_000868c0 DAT_000868c0_backing[0]
/* was `int` -- truncated pointer to a 64-bit address on assignment in spawn_creature_death_loot
   (&DAT_001007d0 + index*0x30), causing spawn_creature_treasure_drop to dereference a garbage
   address (crash in demo_critter_orbit_cardinal.txt, EXC_BAD_ACCESS at uw.c:70173). */
// was DAT_0024cfc4
static char *g_despawn_creature_record;
/* Treasure values are fields of the loaded COMOBJ table (type 0xa0,
   offset 5), not an independent, never-loaded array. */
#define DAT_002034b5 ((byte *)g_object_type_props)[0x825] /* item 0xa0 value, loaded COMOBJ table */
int mobile_object_tick()
{
  byte bVar1;
  int iVar2;
  char *tile_rec;/* tilemap_lookup / discard_misplaced_object pointer results */
  if (((char)((uw_projectile_object_t *)DAT_0010190c)->lifetime == '\0') && ((g_object_type_props[(((uw_projectile_object_t *)DAT_0010190c)->hdr.object_id)].quality_flags & 0xc) < 0xc)) {
    tile_rec = (char *)tilemap_lookup(((uw_projectile_object_t *)DAT_0010190c)->tile_x,
                                      ((uw_projectile_object_t *)DAT_0010190c)->tile_y);
    tile_rec = (char *)discard_misplaced_object(tile_rec + 2,
                                                ((uw_projectile_object_t *)DAT_0010190c),
                                                0);
    if (tile_rec == 0) {
      return 0;
    }
    ((uw_projectile_object_t *)DAT_0010190c)->lifetime = 1;
  }
  DAT_002049a0 = 0x1000;
  if ((g_object_type_props[(((uw_projectile_object_t *)DAT_0010190c)->hdr.object_id)].flags & 8) == 0) {
    DAT_002049a0 = 0;
  }
  build_object_placement_snapshot(((uw_projectile_object_t *)DAT_0010190c),
                                  &DAT_00204920);
  apply_placement_collision_sweep(&DAT_00204920, &DAT_002049a0);
  DAT_0010144c = (ushort)(((uw_projectile_object_t *)DAT_0010190c)->tile_x);
  DAT_00101454 = (undefined2)(((uw_projectile_object_t *)DAT_0010190c)->tile_y);
  iVar2 = sync_object_tile_position(((uw_projectile_object_t *)DAT_0010190c),
                                    &DAT_00204920);
  if (iVar2 != 0) {
    bVar1 = ((uw_projectile_object_t *)DAT_0010190c)->movement_flags;
    ((uw_projectile_object_t *)DAT_0010190c)->movement_flags = ((((uw_projectile_object_t *)DAT_0010190c)->pitch_flags & 7) + bVar1 ^ bVar1) & 0xf ^ bVar1;
  }
  return iVar2;
}




// was FUN_0002cb14.
int creature_find_path_to_tile(int start_x, char start_y, byte size_class, char goal_x, char goal_y, char goal_sub_x, byte goal_sub_y)
{
  char cVar1;
  uint uVar2;
  uint uVar3;
  char cVar4;
  undefined1 uVar5;
  undefined1 uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  undefined1 *puVar10;
  uint uVar11;
  uint uVar12;
  uint uVar13;
  byte bVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  int iVar18;
  int iVar19;
  bool bVar20;
  byte local_5c;
  byte local_5b;
  byte local_5a;
  byte local_59;
  char local_58;
  char local_57;
  char local_56;
  char local_55;
  undefined1 *local_54;
  uint local_50;
  undefined1 *local_4c;
  uint local_48;
  uint local_44;
  int local_40;
  uint local_3c;
  uint local_38;
  
  DAT_00101450 = goal_sub_y;
  local_54 = &DAT_001014e0;
  local_4c = &DAT_00101460;
  local_5b = 0;
  ce_memset(&DAT_0023cf08,0,0x5000);
  cVar1 = (char)start_x;
  uVar11 = (uint)cVar1;
  local_48 = (uint)goal_x;
  uVar2 = uVar11;
  if ((int)local_48 <= (int)uVar11) {
    uVar2 = local_48;
  }
  iVar7 = uVar2 - 5;
  if (iVar7 < 2) {
    iVar7 = 1;
  }
  local_58 = (char)iVar7;
  local_50 = (uint)start_y;
  local_44 = (uint)goal_y;
  uVar16 = 0;
  uVar2 = local_50;
  if ((int)local_44 <= (int)local_50) {
    uVar2 = local_44;
  }
  iVar7 = uVar2 - 5;
  if (iVar7 < 2) {
    iVar7 = 1;
  }
  local_56 = (char)iVar7;
  uVar2 = uVar11;
  if ((int)uVar11 <= (int)local_48) {
    uVar2 = local_48;
  }
  iVar7 = uVar2 + 5;
  if (0x3f < iVar7) {
    iVar7 = 0x40;
  }
  uVar2 = local_50;
  if ((int)local_50 <= (int)local_44) {
    uVar2 = local_44;
  }
  iVar8 = uVar2 + 5;
  if (0x3f < iVar8) {
    iVar8 = 0x40;
  }
  local_55 = (char)iVar8;
  local_57 = (char)iVar7;
  iVar7 = (local_50 + uVar11 * 0x40) * 5;
  (&DAT_0023cf08)[iVar7] = cVar1;
  (&DAT_0023cf0a)[iVar7] = size_class;
  (&DAT_0023cf0c)[iVar7] = 0;
  do {
    uVar5 = (undefined1)((int)(char)(&DAT_000853b0)[uVar16 * 2] + (int)cVar1);
    iVar7 = (int)(char)(&DAT_000853b1)[uVar16 * 2] + (int)(char)local_50;
    uVar6 = (undefined1)iVar7;
    uVar11 = ((int)(char)(&DAT_000853b0)[uVar16 * 2] + (int)cVar1) * 0x1000000 >> 0x18;
    uVar2 = iVar7 * 0x1000000 >> 0x18;
    iVar8 = (uVar2 + uVar11 * 0x40) * 5;
    local_5c = 0;
    iVar7 = tile_pair_los_blocked(0,0,start_x,start_y,uVar5,uVar6,*(undefined2 *)(DAT_00101438 + 4),
                         *(undefined2 *)(DAT_00101438 + 6),size_class,&DAT_0023cf0a + iVar8,&local_5c);
    if (iVar7 != 0) {
      if ((uVar11 == local_48) && (uVar2 == local_44)) {
        DAT_0010142c = 1;
        DAT_00101740 = cVar1;
        DAT_00101741 = start_y;
        DAT_00101743 = 0;
        DAT_00101744 = 0;
        DAT_00101746 = 0;
        DAT_00101747 = uVar5;
        DAT_00101748 = uVar6;
        return 1;
      }
      (&DAT_0023cf08)[iVar8] = cVar1;
      (&DAT_0023cf09)[iVar8] = start_y;
      (&DAT_0023cf0c)[iVar8] = 1;
      uVar11 = (uint)local_5b;
      (&DAT_0023cf0b)[iVar8] = local_5c << 1 | (&DAT_0023cf0b)[iVar8] & 1;
      local_5b = local_5b + 1;
      (&DAT_001014e0)[uVar11 * 2] = uVar5;
      (&DAT_001014e1)[uVar11 * 2] = uVar6;
    }
    uVar16 = uVar16 + 1 & 0xff;
  } while (uVar16 < 4);
  local_5a = 1;
  do {
    uVar11 = (uint)local_5b;
    if (uVar11 == 0) {
      return 0;
    }
    bVar14 = 0;
    local_5b = 0;
    local_50 = 0;
    local_38 = uVar11;
    do {
      if (0x3f < bVar14) break;
      cVar1 = local_54[(local_50 & 0xff) * 2];
      iVar7 = (int)cVar1;
      cVar4 = (local_54 + (local_50 & 0xff) * 2)[1];
      iVar8 = (int)cVar4;
      iVar18 = (iVar8 + iVar7 * 0x40) * 5;
      local_40 = (int)local_58;
      local_50 = 0;
      do {
        iVar15 = (int)(char)(&DAT_000853b0)[local_50 * 2] + (int)cVar1;
        iVar17 = (int)(char)(&DAT_000853b1)[local_50 * 2] + (int)cVar4;
        uVar2 = iVar15 * 0x1000000 >> 0x18;
        if ((((local_40 <= (int)uVar2) && ((int)uVar2 <= (int)local_57)) &&
            (local_3c = iVar17 * 0x1000000 >> 0x18, (int)local_56 <= (int)local_3c)) &&
           ((int)local_3c <= (int)local_55)) {
          iVar19 = (local_3c + uVar2 * 0x40) * 5;
          local_5c = (byte)(&DAT_0023cf0b)[iVar18] >> 1;
          if (((byte)(&DAT_0023cf08)[iVar18] != uVar2) ||
             ((byte)(&DAT_0023cf09)[iVar18] != local_3c)) {
            iVar9 = tile_pair_los_blocked((uint)(byte)(&DAT_0023cf08)[iVar18],(&DAT_0023cf09)[iVar18],iVar7,
                                 iVar8,(char)iVar15,(char)iVar17,*(undefined2 *)(DAT_00101438 + 4),
                                 *(undefined2 *)(DAT_00101438 + 6),(&DAT_0023cf0a)[iVar18],&local_59
                                 ,&local_5c);
            bVar20 = (&DAT_0023cf08)[iVar19] == '\0';
            uVar11 = local_38;
            bVar14 = local_5b;
            if ((iVar9 != 0) &&
               ((bVar20 ||
                (((byte)(&DAT_0023cf0c)[iVar18] < (byte)(&DAT_0023cf0c)[iVar19] &&
                 (uVar13 = (uint)local_59 - (int)goal_sub_x, uVar16 = (int)uVar13 >> 0x1f,
                 uVar12 = (uint)(byte)(&DAT_0023cf0a)[iVar19] - (int)goal_sub_x,
                 uVar3 = (int)uVar12 >> 0x1f,
                 (int)((uVar13 ^ uVar16) - uVar16) < (int)((uVar12 ^ uVar3) - uVar3))))))) {
              (&DAT_0023cf08)[iVar19] = cVar1;
              (&DAT_0023cf09)[iVar19] = cVar4;
              (&DAT_0023cf0a)[iVar19] = local_59;
              (&DAT_0023cf0c)[iVar19] = local_5a + 1;
              (&DAT_0023cf0b)[iVar19] = local_5c << 1 | (&DAT_0023cf0b)[iVar19] & 1;
              bVar14 = (&DAT_0023cf0b)[iVar18];
              puVar10 = local_4c;  /* only used when bVar20 (was `(undefined1 *)(uint)bVar14` otherwise, never read) */
              (&DAT_0023cf0b)[iVar18] = ((byte)DAT_00101440 ^ bVar14) & 1 ^ bVar14;
              if (bVar20) {
                uVar16 = (uint)local_5b;
                local_5b = local_5b + 1;
                puVar10[uVar16 * 2] = (char)iVar15;
                (puVar10 + uVar16 * 2)[1] = (char)iVar17;
              }
              bVar14 = local_5b;
              if (((uVar2 == local_48) && (local_3c == local_44)) &&
                 (iVar15 = tile_pair_los_blocked(iVar7,iVar8,iVar15,iVar17,0,0,
                                        *(undefined2 *)(DAT_00101438 + 4),
                                        *(undefined2 *)(DAT_00101438 + 6),(&DAT_0023cf0a)[iVar19],
                                        &DAT_0023cf0a + iVar19,&local_5c), uVar11 = local_38,
                 bVar14 = local_5b, iVar15 != 0)) {
                reconstruct_path_from_bfs(local_5a,goal_x,goal_y);
                return 1;
              }
            }
          }
        }
        local_50 = local_50 + 1 & 0xff;
      } while (local_50 < 4);
      local_50 = local_50 + 1;
    } while ((local_50 & 0xff) < uVar11);
    local_4c = &DAT_001014e0;
    if (local_54 == &DAT_001014e0) {
      local_54 = &DAT_00101460;
    }
    else {
      local_54 = &DAT_001014e0;
      local_4c = &DAT_00101460;
    }
    local_5a = local_5a + 1;
    local_5b = bVar14;
    if (0x1f < local_5a) {
      return 0;
    }
  } while( true );
}




/* HACK: whole-function fix, same ushort-vs-byte pointer-scaling bug as the rest of this NPC-AI
   cluster this session (see [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is `ushort *`,
   so every bare `DAT_0010190c + N` throughout this function was scaling N by 2. */
// was FUN_0002e58c
void npc_walk_toward_tile(uint goal, char goal_target, byte attitude)
{
  int uw_ord2005_rem_17 = 0; int uw_ord2005_rem_18 = 0; int uw_ord2005_rem_19 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  undefined1 uVar4;
  short sVar5;
  int iVar6;
  char *npc_bytes;
  undefined4 uVar7;
  int extraout_r1;
  int extraout_r1_00;
  uint extraout_r1_01;
  uint uVar8;
  byte bVar9;
  byte local_40 [4];
  int local_3c;
  int local_38;
  
  local_3c = 0;
  local_38 = 0;
  /* Dropped arguments: the real call (0x2e5c0) is made with r0/r1/r2 still holding this function's
     own three incoming parameters (the prologue spills all three, `stmdb sp!,{r0,r1,r2}`), so the
     destination y and the third value were whatever this port's ABI left in those registers... */
  npc_set_walk_target(goal,goal_target,attitude);
  if (((DAT_0010190c->heading_flags & 0x20) != 0) &&
      ((DAT_0010190c->animation_flags & 0x80) != 0)) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
  }
  iVar1 = ((int)(char)goal - (int)DAT_00101918) * 0x1000000 >> 0x18;
  iVar6 = ((int)goal_target - (int)DAT_001013f8) * 0x1000000;
  iVar2 = (int)(iVar6) >> 0x18;
  if ((iVar1 == 0) && ((char)((uint)iVar6 >> 0x18) == '\0')) {
    if ((DAT_0010190c->animation_flags & 0x80) != 0) {
      DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
    }
    if ((DAT_0010190c->npc_goal) != 1) {
      if (DAT_00101734 != 0) {
        DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags | 0x40;
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
        return;
      }
      goto LAB_0002e6fc;
    }
    npc_set_goal(8,0);
  }
  if (DAT_00101734 == 0) {
LAB_0002e6fc:
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;
    if ((DAT_0010190c->animation_flags & 0x80) != 0) {
      uVar3 = DAT_0010190c->tile_word;
      iVar6 = (uVar3 & 0xf) * 0x1c;
      if ((uVar3 >> 10 == (ushort)(byte)(&DAT_00101568)[(int)iVar6]) &&
         ((uVar3 & 0x3f0) >> 4 == (uint)(byte)(&DAT_00101569)[(int)iVar6])) {
        /* Was a dropped argument -- called with no args (`FUN_0002dd4c();` before this rename). */
        advance_cached_path_step(&DAT_00101568 + (int)iVar6);
      }
    }
    return;
  }
  if (((DAT_00101924 != 0) && (DAT_00101430 == 0)) &&
     (bVar9 = DAT_0010190c->heading_flags, (bVar9 & 0x40) == 0)) {
    if (DAT_001013fc != 0) {
      if (DAT_00101560 == 0) {
        uVar3 = *DAT_00101904;
        if (((uVar3 & 0x1c0) == 0x40) && ((uVar3 & 0x1ff) != 0x7f)) {
          if (((DAT_0010190c->npc_goal) == 5) &&
              ((*(byte *)((char *)DAT_00101904 + 0xb) & 0xf) == 5)) {
            goal = goal & 0xff;
            goto LAB_0002e998;
          }
          goal = goal & 0xff;
        }
        if ((((uVar3 & 0x1f0) == 0x140) && (7 < (uVar3 & 0xf))) &&
           ((DAT_00101404->movement_flags & 0x80) != 0)) {
          local_38 = 1;
          DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 | 0x70;
          DAT_00101924 = 0;
          DAT_00101914 = 1;
          goto LAB_0002ea00;
        }
      }
      else {
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
        uVar7 = ce_rand();
        uw_ord2005_rem_17 = ((int)(uVar7)) % (4);
        if ((uw_ord2005_rem_17 != 0) && (DAT_0010190c->npc_attitude == 0)) {
          npc_arrival_interaction(DAT_00101904);
          goto LAB_0002e998;
        }
        bVar9 = DAT_0010190c->heading_flags;
      }
      DAT_0010190c->heading_flags = bVar9 | 0x40;
    }
LAB_0002e998:
    if (DAT_00101924 != 0) {
      if ((DAT_0010190c->animation_flags & 0x80) != 0) {
        DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
      }
      local_3c = 1;
      DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0x7f;
    }
  }
LAB_0002ea00:
  if ((DAT_0010190c->animation_flags & 0x80) != 0) {
    iVar6 = walk_using_cached_path(&DAT_00101568 + (DAT_0010190c->npc_path_slot) * 0x1c);
    if (iVar6 != 0) goto LAB_0002ed50;
LAB_0002ebfc:
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
LAB_0002ed50:
    if (DAT_00101920 != 0) {
      return;
    }
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xbf;
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xec | 0x2c;
    if (local_38 == 0) {
      if ((DAT_0010190c->npc_goal) == 5) {
        bVar9 = DAT_00101404->movement_speed;
      }
      else {
        bVar9 = DAT_00101404->magic_power;
      }
      bVar9 = (DAT_0010190c->motion_flags ^ bVar9) & 0x7f ^ DAT_0010190c->motion_flags;
    }
    else {
      bVar9 = DAT_0010190c->motion_flags & 0x80;
    }
    DAT_0010190c->motion_flags = bVar9;
    npc_bytes = (char *)DAT_0010190c;
    uVar3 = DAT_0010190c->goal_word;
    uw_ord2005_rem_18 = ((int)((uVar3 >> 0xc) + 1)) % (4);
    uVar8 = uVar3 & 0xfff;
    ((uw_mobile_object_t *)npc_bytes)->goal_word_low = (byte)(char)uVar8;
    DAT_0010190c->goal_word_high =
      (byte)(uVar8 >> 8) | (byte)(((uw_ord2005_rem_18 & 0xf) << 0xc) >> 8);
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
    return;
  }
  bVar9 = DAT_0010190c->heading_flags;
  if (((bVar9 & 0x20) == 0) && ((bVar9 & 0x80) != 0)) {
    uVar8 = compute_movement_heading(iVar1,iVar2);
    DAT_0010190c->full_heading = (byte)((uVar8 & 0xff) << 5);
    DAT_0010190c->hdr.heading = uVar8 & 0x7;
    DAT_0010190c->npc_heading = 0;
    if ((DAT_00101404->movement_flags & 0x80) != 0) {
      set_npc_altitude_state(goal,goal_target);
    }
    goto LAB_0002ed50;
  }
  if (((bVar9 & 0x20) == 0) && ((bVar9 & 0x40) != 0)) {
    uVar7 = ce_rand();
    uw_ord2005_rem_19 = ((int)(uVar7)) % (8);
    if (uw_ord2005_rem_19 != 0) goto LAB_0002ee74;
    bVar9 = DAT_0010190c->heading_flags & 0xbf;
  }
  else {
    if ((local_3c == 0) &&
       (sVar5 = try_direct_line_walk(DAT_00101918,DAT_001013f8,goal & 0xff,goal_target), sVar5 == 1)) {
      DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x80;
      uVar8 = compute_movement_heading(iVar1,iVar2);
      DAT_0010190c->full_heading = (byte)((uVar8 & 0xff) << 5);
      DAT_0010190c->hdr.heading = uVar8 & 0x7;
      DAT_0010190c->npc_heading = 0;
      DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
      if ((DAT_0010190c->animation_flags & 0x80) == 0) goto LAB_0002ed50;
      goto LAB_0002ebfc;
    }
    iVar6 = pop_pending_path_cache_slot(local_40);
    if (iVar6 != 0) {
      uVar4 = compute_pathfind_search_radius();
      iVar6 = creature_find_path_to_tile(DAT_00101918,DAT_001013f8,
                                         DAT_0010190c->hdr.zpos >> 3,
                                         goal,
                                         goal_target,attitude,uVar4);
      if (iVar6 != 0) {
        DAT_000853b8 = DAT_000853b8 & ~(ushort)(1 << (uint)local_40[0]);
        save_walk_path_to_cache_slot(&DAT_00101568 + (uint)local_40[0] * 0x1c);
        DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
        DAT_0010190c->animation_flags = DAT_0010190c->animation_flags | 0x80;
        uVar8 = DAT_0010190c->tile_word & 0xfff0;
        DAT_0010190c->tile_word_low = local_40[0] & 0xf | (byte)uVar8;
        DAT_0010190c->tile_word_high = (byte)(char)(uVar8 >> 8);
        walk_using_cached_path(&DAT_00101568 + (DAT_0010190c->npc_path_slot) * 0x1c);
        goto LAB_0002ed50;
      }
    }
    DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x40;
    bVar9 = DAT_0010190c->heading_flags & 0x7f;
  }
  DAT_0010190c->heading_flags = bVar9;
LAB_0002ee74:
  npc_idle_behavior_tick();
}




// was FUN_00032d38. Per-object per-tick AI/movement processor for class-0x40 (NPC/monster) objects,
// dispatched from tick_mobile_objects.
int npc_ai_tick()

{
  undefined1 uVar1;
  undefined2 uVar2;
  byte bVar3;
  char cVar4;
  /* Was `int`, truncating the real 64-bit pointers this variable holds
     (get_object_record_by_slot_index(1) and tilemap_lookup() both return real pointers, and the two
     dereferences below and the object_list_unlink(iVar5+2,...) call both need the full address)... */
  int iVar5;
  char *player_rec;
  char *tile_pos;
  int iVar6;
  undefined4 uVar7;
  byte extraout_r1;
  byte extraout_r1_00;
  byte bVar8;
  short extraout_r1_01;
  uint uVar9;
  uint uVar10;
  ushort *puVar11;

  DAT_00101738 = encode_object_slot_index(DAT_0010190c);
  DAT_00101404 = &g_monster_type_props[(DAT_0010190c->hdr.object_id & 0x3f)];
  DAT_00101918 = DAT_0010190c->npc_xhome;
  DAT_001013f8 = DAT_0010190c->npc_yhome;
  player_rec = get_object_record_by_slot_index(1);
  puVar11 = DAT_0010190c;
  if (((100 < ((((int)(char)DAT_00101918 - (int)DAT_00101938) * 0x10000 >> 0x10) *
               (((int)(char)DAT_00101918 - (int)DAT_00101938) * 0x10000 >> 0x10) +
              (((int)(char)DAT_001013f8 - (int)DAT_0010193c) * 0x10000 >> 0x10) *
              (((int)(char)DAT_001013f8 - (int)DAT_0010193c) * 0x10000 >> 0x10)) * 0x10000 >> 0x10)
      && (iVar6 = (int)(char)DAT_001013f8 -
                  (int)(char)(((uw_mobile_object_t *)player_rec)->tile_y),
                  iVar5 = (int)(char)DAT_00101918 - (int)(char)(byte)(((uw_mobile_object_t *)player_rec)->tile_x),
                  100 < (iVar5 * iVar5 + iVar6 * iVar6) * 0x10000 >> 0x10)) &&
      ((DAT_0010190c->npc_goal) != 3)) {
    bVar3 = DAT_0010190c->movement_flags;
    /* Was `ordint_divmod(0x10,(bVar3&0xf)+8); bVar8 = extraout_r1;` -- the classic "call idivmod,
       then read its remainder back through the extraout_r1 register-leftover fiction" pattern
       already fixed elsewhere this session (itoa_radix, draw_chargen_field_options's sVar_rem)... */
    bVar8 = ((bVar3 & 0xf) + 8) % 0x10;
    goto LAB_00033860;
  }
  if ((*(char *)&DAT_00101404->movement_flags & 0x80) == 0) {
    if ((*(char *)&DAT_00101404->movement_flags & 0x40) == 0) {
      DAT_0010172c = &DAT_002048c0;
      DAT_00101438 = &DAT_00204980;
    }
    else {
      DAT_0010172c = (undefined2 *)&DAT_00204950;
      DAT_00101438 = (byte *)&DAT_002049b0;
    }
  }
  else {
    DAT_0010172c = (undefined2 *)&DAT_002048f0;
    DAT_00101438 = (byte *)&DAT_00204990;
  }
  if ((g_object_type_props[(DAT_0010190c->hdr.object_id)].scale_flags & 8) != 0) {
    uVar2 = *(undefined2 *)(DAT_00101438 + 2);
    DAT_00101438[2] = (byte)uVar2 & 0xdf;
    DAT_00101438[3] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)(DAT_00101438 + 6);
    DAT_00101438[6] = (byte)uVar2 & 0xdf;
    DAT_00101438[7] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)DAT_00101438;
    *DAT_00101438 = (byte)uVar2 | 0x20;
    DAT_00101438[1] = (byte)((ushort)uVar2 >> 8);
  }
  DAT_00101924 = 0;
  DAT_00101734 = 1;
  DAT_0010191c = 0;
  DAT_00101430 = 0;
  DAT_001013fc = 0;
  DAT_00101560 = 0;
  DAT_00101914 = 0;
  bVar3 = DAT_0010190c->animation_flags & 0x3f;
  if (((bVar3 != 0x2c) && (bVar3 != 0x20)) && ((DAT_0010190c->animation_flags & 0x80) != 0)) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
  }
  if ((((DAT_0010190c->animation_flags & 0x40) == 0) ||
       ((DAT_0010190c->motion_flags & 0x7f) != 0)) || ((((ushort *)DAT_0010190c)[10] & 0xf8) != 0x80)) {
    build_object_placement_snapshot(DAT_0010190c,DAT_0010172c);
    bVar3 = DAT_0010190c->full_heading;
    /* Was `build_collision_height_field_for_object()` -- a dropped argument (K&R declared, relying
       on whatever register-content reuse the real ARM code got for free).
       build_collision_height_field_for_object's own single param is dereferenced the exact same... */
    DAT_00101414 = build_collision_height_field_for_object(DAT_0010190c);
    apply_placement_collision_sweep(DAT_0010172c,DAT_00101438);
    DAT_0010144c = (ushort)(DAT_0010190c->npc_xhome);
    DAT_00101454 = (undefined2)(DAT_0010190c->npc_yhome);
    sync_object_tile_position(DAT_0010190c,DAT_0010172c);
    if (DAT_0010190c->full_heading != bVar3) {
      DAT_00101430 = 1;
    }
  }
  if ((g_object_type_props[(DAT_0010190c->hdr.object_id)].scale_flags & 8) != 0) {
    uVar2 = *(undefined2 *)(DAT_00101438 + 2);
    DAT_00101438[2] = (byte)uVar2 | 0x20;
    DAT_00101438[3] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)(DAT_00101438 + 6);
    DAT_00101438[6] = (byte)uVar2 | 0x20;
    DAT_00101438[7] = (byte)((ushort)uVar2 >> 8);
    uVar2 = *(undefined2 *)DAT_00101438;
    *DAT_00101438 = (byte)uVar2 & 0xdf;
    DAT_00101438[1] = (byte)((ushort)uVar2 >> 8);
  }
  DAT_00101918 = DAT_0010190c->npc_xhome;
  uVar9 = DAT_0010190c->npc_yhome;
  DAT_001013f8 = (byte)uVar9;
  DAT_0010140c = DAT_0010190c->hdr.zpos >> 3;
  DAT_00101910 = (short)(((uint)DAT_00101918 << 0x13) >> 0x10) +
                 (ushort)(DAT_0010190c->hdr.xpos);
  DAT_0010141c = (DAT_0010190c->hdr.ypos) + (short)((uVar9 << 0x13) >> 0x10);
  DAT_0010143c = DAT_0010190c->hdr.quality;
  DAT_0010173c = DAT_0010190c->hdr.owner;
  DAT_00101458 = DAT_0010190c->full_heading;
  bVar3 = (byte)(DAT_0010190c->hdr.position_word >> 2);
  DAT_001018fc = (bVar3 ^ DAT_0010190c->heading_flags) & 0x1f ^ bVar3;
  DAT_00101434 = DAT_0010190c->motion_flags & 0x7f;
  DAT_00101730 = g_object_type_props[(DAT_0010190c->hdr.object_id)].height;
  uVar9 = (uint) DAT_0010190c->goal_word;
  if (((uVar9 & 0xf) == 0xb) || ((uVar9 & 0xf) == 3)) {
LAB_00033830:
    npc_ai_default_tick();
    goto LAB_00033834;
  }
  bVar3 = DAT_0010190c->animation_flags & 0x3f;
  if (bVar3 == 0xc) {
    if ((uVar9 & 0xf000) == 0x3000) {
      resolve_unique_npc_special_behavior(DAT_0010190c,1);
      DAT_0010144c = (ushort)(DAT_0010190c->npc_xhome);
      DAT_00101454 = (undefined2)(DAT_0010190c->npc_yhome);
      /* ARM 0x3343c..0x33470 passes the dead NPC's tile x/y in r0/r1.
         Dropping these arguments leaves its final frame in the old tile list. */
      tile_pos = tilemap_lookup(DAT_0010144c,DAT_00101454);
      object_list_unlink(tile_pos + 2,DAT_0010190c);
      spawn_creature_death_loot(DAT_0010190c);
      drop_monster_loot(DAT_0010190c,
                        (byte)*(char *)&DAT_00101404->effects_flags >> 5,
                        (byte)*(char *)&DAT_00101404->movement_flags >> 2 & 7);
      drop_creature_inventory_on_death(DAT_0010190c);
      free_object_slot(DAT_0010190c);
      return 0;
    }
LAB_00033810:
    uVar10 = (uVar9 & 0xf000) + 0x1000 ^ uVar9 & 0xfff;
    DAT_0010190c->goal_word_low = (byte)(uVar9 & 0xfff);
LAB_000337fc:
    DAT_0010190c->goal_word_high = (byte)(uVar10 >> 8);
  }
  else if (((DAT_0010190c->animation_flags & 0x3f) == 0) || (3 < bVar3)) {
    if ((bVar3 != 0xd) || ((DAT_0010190c->npc_ai_flags & 0xc) == 0)) {
      if (bVar3 != 5) goto LAB_00033830;
      if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
      uVar9 = ((byte)*(char *)&DAT_00101404->weapon_loot[0] & 0x1e) >> 1;
      iVar5 = (short)uVar9 * 3;
      cVar4 = compute_vertical_aim_offset(g_ranged_type_props[(iVar5) / 3].projectile_speed,
                                          1);
      DAT_00202a3c = (short)cVar4;
      spawn_npc_thrown_weapon(DAT_0010190c,uVar9,
                              g_ranged_type_props[(iVar5) / 3].projectile_speed);
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
      uVar10 = DAT_0010190c->goal_word & 0xfff;
      DAT_0010190c->goal_word_low = (byte)uVar10;
      goto LAB_000337fc;
    }
    if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
    cVar4 = compute_vertical_aim_offset(0x1e,0);
    DAT_00202a3c = (short)cVar4;
    dispatch_tile_special_action(*(char *)&DAT_00101404->spells[(DAT_0010190c->npc_ai_flags >> 2 & 3) - 1],
                                 DAT_0010190c,0)
    ;
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
    DAT_0010190c->npc_animation_frame = 0x0;
    uVar9 = DAT_0010190c->goal_word;
    DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xf3;
  }
  else {
    if ((DAT_0010190c->npc_animation_frame == 0) && ((uVar9 & 0xff0) == 0x10)) {
      bVar3 = get_current_music_track();
      if ((bVar3 < 5) || (bVar3 = get_current_music_track(), 7 < bVar3)) {
        set_pending_music_track(6);
      }
      DAT_00101944 = read_realtime_clock_units();
    }
    uVar9 = (uint) DAT_0010190c->goal_word;
    if ((uVar9 & 0xf000) != 0x4000) goto LAB_00033810;
    uVar7 = ce_rand();
    puVar11 = DAT_0010190c;
    bVar3 = DAT_0010190c->animation_flags;
    uVar1 = (&DAT_000853d8)[(uint)(byte)(DAT_0010190c->npc_swing_charge) * 2];
    /* Was `ordint_divmod(9,uVar7,*(byte*)(DAT_0010190c+0xf),ordint_divmod_exref,
       DAT_00101404[0xf]); resolve_npc_melee_attack(puVar11,(int)extraout_r1_01,uVar1,
       (bVar3&0x3f)-1);` -- badly garbled. */
    resolve_npc_melee_attack(puVar11,(short)(uVar7 % 9),uVar1,(bVar3 & 0x3f) - 1,
                             (short)*(char *)&DAT_00101404->poison_damage);
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xc0;
    DAT_0010190c->npc_animation_frame = 0x0;
    uVar9 = DAT_0010190c->goal_word;
    DAT_0010190c->npc_swing_charge = 0x0;
    uVar9 = DAT_0010190c->target_word;
  }
LAB_00033834:
  puVar11 = DAT_0010190c;
  bVar3 = DAT_0010190c->movement_flags;
  /* Was `ordint_divmod(...); bVar8 = extraout_r1_00;` -- same fabricated-
     remainder bug as the other ordint_divmod call above in this function,
     see that comment. Compute the remainder directly instead. */
  bVar8 = ((DAT_0010190c->attack_pitch & 7) + (bVar3 & 0xf)) % 0x10;
LAB_00033860:
  ((uw_mobile_object_t *)puVar11)->movement_flags = (bVar3 ^ bVar8) & 0xf ^ bVar3;
  return 1;
}




// was FUN_000349bc.
void tick_mobile_objects(char elapsed)
{
  int iVar1;
  byte *pbVar2;

  DAT_0010190c = (uw_mobile_object_t *)0x0;
  DAT_00101928 = DAT_00101948 + elapsed & 0xf;
  pbVar2 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      DAT_0010190c = (uw_mobile_object_t *)((uint)*pbVar2 * 0x1b + DAT_002046b8);
      do {
        iVar1 = object_tick_is_due(DAT_0010190c->tick_phase,
                                   DAT_0010190c->attack_pitch & 7);
        if (iVar1 == 0) goto LAB_00034a98;
        if ((DAT_0010190c->hdr.object_id & 0x1c0) == 0x40) {
          iVar1 = npc_ai_tick();
        }
        else {
          iVar1 = mobile_object_tick();
        }
      } while (iVar1 != 0);
      pbVar2 = pbVar2 + -1;
LAB_00034a98:
      pbVar2 = pbVar2 + 1;
    } while (pbVar2 < DAT_002046c8);
    if (DAT_0010190c != (ushort *)0x0) {
      set_pending_update_flags(2);
    }
  }
  DAT_00101948 = DAT_00101928;
}




// was FUN_00049404
/* was undefined4 -- the caller's stack description buffer (acStack_7c);
   ce_strcat/message_scroll_print_wrapped write through it, so truncating it crashed a right-click
   "look" at a creature (the "vitality is N out of N" path). */
void build_creature_look_text(ushort *creature, char *out_text)
{
  byte bVar1;
  char cVar2;
  char *pcVar3;
  char *pcVar4;
  char *pcVar5;
  int iVar6;
  undefined4 uVar7;
  /* format_object_display_name's real return type is `undefined1 *` -- was captured into `uVar7`
     (undefined4/int), which also does double duty as a plain 0/1 flag a few lines down. */
  char *pcVar_desc;
  undefined1 *puVar8;

  pcVar3 = (char *)get_message_string(*creature & 0x1ff | 0x800);
  bVar1 = (byte)creature[0xd];
  if ((pcVar3 == (char *)0x0) || (*pcVar3 == '\0')) {
    pcVar3 = (char *)0x0;
  }
  if (((0xef < bVar1) && (bVar1 != 0xff)) ||
     (pcVar4 = (char *)get_message_string((byte)((byte)creature[7] >> 6) + 0x60 | 0xa00),
      pcVar4 == (char *)0x0 || *pcVar4 == '\0'))
  {
    pcVar4 = (char *)0x0;
  }
  if ((bVar1 == 0) ||
     (pcVar5 = (char *)get_message_string((int)(short)(ushort)bVar1 + 0x10U | 0xe00),
      pcVar5 == (char *)0x0 || *pcVar5 == '\0')) {
    pcVar5 = (char *)0x0;
  }
  if (pcVar3 != (char *)0x0) {
    if (pcVar4 != (char *)0x0) {
      cVar2 = *pcVar4;
      if (((cVar2 == 'a') || (cVar2 == 'e')) || ((cVar2 == 'i' || (cVar2 == 'o' || cVar2 == 'u'))))
      {
        puVar8 = &DAT_00085244;
      }
      else {
        puVar8 = &DAT_00085248;
      }
      ce_strcat(out_text,puVar8);
      ce_strcat(out_text,pcVar4);
      ce_strcat(out_text,&DAT_00085240);
    }
    if ((pcVar5 == (char *)0x0) || (iVar6 = _isctype((int)*pcVar5,1), iVar6 != 0)) {
      pcVar_desc = (char *)format_object_display_name(pcVar3,pcVar4 == (char *)0x0,0);
      if (pcVar_desc != (char *)0x0) {
        ce_strcat(out_text,pcVar_desc);
      }
    }
  }
  if (pcVar5 != (char *)0x0) {
    uVar7 = 1;
    if (pcVar3 != (char *)0x0) {
      iVar6 = _isctype((int)*pcVar5,1);
      if (iVar6 != 0) {
        ce_strcat(out_text,s_named_00085d18);
      }
      uVar7 = 0;
    }
    pcVar_desc = (char *)format_object_display_name(pcVar5,uVar7,0);
    if (pcVar_desc != (char *)0x0) {
      ce_strcat(out_text,pcVar_desc);
    }
  }
  ce_strcat(out_text,&DAT_00084f20);
  /* DAT_00084f20 already supplies the original period and newline. */
  message_scroll_print_wrapped(out_text);
}




// was FUN_00052c5c -- disassembly-confirmed real math, not a bug: with param_1=10
// (discard_misplaced_object's only caller value) this computes `rand_below(10) < (10 +
// rand_below(3))`, and since rand_below(10) maxes at 9 while the threshold is always >=10...
/* was `int` -- truncated the real object-record pointer (dereferenced via casts, passed to
   resolve_object_link and object_exceeds_size_threshold), latent until those calls started
   actually using their arguments */
int roll_object_destroy_chance(short base_chance, void *object_ptr)
{
  char *object = (char *)object_ptr;
  short sVar1;
  int iVar2;
  /* Was `undefined4 uVar3` -- truncated resolve_object_link's real pointer return before forwarding
     it into walk_object_tree just below, same class as this whole never-before-exercised
     drop-into-world path's other fixes. */
  char *pcVar3;

  if (object != 0) {
    if (base_chance != 0) {
      sVar1 = rand_below(3);
      base_chance = base_chance + sVar1;
    }
    DAT_002046b0 = base_chance;
    iVar2 = object_exceeds_size_threshold(object);
    if (iVar2 == 0) {
      if (((*(byte *)(object + 1) & 0x80) == 0) && ((*(ushort *)(object + 6) & 0xffc0) != 0)) {
        pcVar3 = (char *)resolve_object_link((ushort *)(object + 6)); /* confirmed via ARM disassembly, 0x52ce8 */
        iVar2 = walk_object_tree(pcVar3,object_exceeds_size_threshold);
        if (iVar2 != 0) {
          return 0;
        }
      }
      iVar2 = rand_below(10);
      if (iVar2 < DAT_002046b0) {
        return 1;
      }
    }
  }
  return 0;
}




// was FUN_00054f6c.
int sync_object_tile_position(ushort *object, void *position_ptr)
{
  ushort *position = (ushort *)position_ptr;
  int uw_ord2005_rem_118 = 0;
  ushort uVar1;
  undefined1 uVar2;
  byte bVar3;
  short sVar4;
  /* Was `int`, truncating the real 64-bit pointers this variable holds from tilemap_lookup() and
     settle_mobile_to_immobile() (both real pointer returns) -- same class of bug fixed several
     times elsewhere this session... */
  int iVar5;
  void *tile_cell;
  ushort *settled;
  undefined4 uVar6;
  int extraout_r1;
  uint uVar7;
  uint uVar8;
  byte bVar9;
  bool bVar10;
  bool bVar11;
  
  if (((short)*position >> 8 != DAT_0010144c) || ((short)position[1] >> 8 != DAT_00101454)) {
    /* Both tilemap_lookup() calls below were dropped-argument (K&R, relying on register-content
       reuse) -- unlike the many other such call sites in this file that legitimately reuse
       whatever's still in r0/r1 from an immediately preceding, equivalent computation... */
    tile_cell = tilemap_lookup(DAT_0010144c,DAT_00101454);
    if (tile_cell != 0) {
      object_list_unlink((char *)tile_cell + 2,object);
    }
    DAT_0010144c = (ushort)(char)(*position >> 8);
    DAT_00101454 = (short)(char)(position[1] >> 8);
    tile_cell = tilemap_lookup(DAT_0010144c,DAT_00101454);
    if (tile_cell != 0) {
      object_list_insert_head((char *)tile_cell + 2,object);
    }
  }
  uVar7 = (uint)((uw_object_hdr_t *)object)->position_word;
  bVar9 = (byte)((int)(((int)(short)position[2] & 0x3f8U) << 0x10) >> 0x13);
  ((uw_object_hdr_t *)object)->zpos = bVar9;
  bVar3 = (byte)((uint)(((int)(short)(*position & 0xe0) >> 5) << 0xd) >> 8);
  ((uw_object_hdr_t *)object)->xpos = (bVar3 >> 5) & 7;
  uVar1 = position[1];
  ((uw_object_hdr_t *)object)->ypos = (uVar1 >> 5) & 7;
  if ((char *)object < DAT_002046c4) {
    ((uw_mobile_object_t *)object)->hit_points = (byte)position[0xf];
  }
  else {
    uVar1 = ((uw_object_hdr_t *)object)->chain_word;
    ((uw_object_hdr_t *)object)->quality = position[0xf] & 0x3f;
  }
  uVar1 = *(ushort *)((char *)position + 0x29);
  if (0x100 < uVar1) {
    if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) != 0x40) {
      uVar2 = ordint_divmod(0x32,
                                (short)(g_object_type_props[(((uw_object_hdr_t *)object)->object_id)].unit_weight)
                                + -600).quot;
      play_sound_effect_at_object(0xf,object,uVar2);
    }
    apply_typed_damage_to_object(object,0,(int)(short)DAT_0010144c,(int)DAT_00101454,(char)(uVar1 >> 8),0);
  }
  if ((char *)object < DAT_002046c4) {
    ((uw_mobile_object_t *)object)->hit_points = (byte)position[0xf];
  }
  else {
    uVar1 = ((uw_object_hdr_t *)object)->chain_word;
    ((uw_object_hdr_t *)object)->quality = position[0xf] & 0x3f;
  }
  if ((position[0x14] & 4) != 0) {
    uVar6 = ce_rand();
    uw_ord2005_rem_118 = ((int)(uVar6)) % (5);
    if (uw_ord2005_rem_118 == 0) {
      apply_typed_damage_to_object(object,0,(int)(short)DAT_0010144c,(int)DAT_00101454,1,8);
    }
  }
  if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) != 0x40) {
    if (DAT_002046c4 < (char *)object) {
      if ((position[10] != 0 || position[8] != 0) || position[5] != 0) {
        object = (ushort *)reallocate_object_to_arena(object);
      }
    }
    else if ((position[10] == 0 && position[8] == 0) && position[5] == 0) {
      ((uw_mobile_object_t *)object)->movement_mode = (&DAT_000868c0)[(byte)position[0x14]] & 7;
      settled = settle_mobile_to_immobile(object);
      if (settled == 0) {
        return 0;
      }
      object = (ushort *)settle_dropped_object(settled,(int)(short)DAT_0010144c,(int)DAT_00101454,0);
      if (object == (ushort *)0x0) {
        return 0;
      }
      if (DAT_002046c4 <= (char *)object) goto LAB_0005559c;
      randomize_settled_snapshot_position(position);
    }
  }
  if ((char *)object < DAT_002046c4) {
    uVar1 = ((uw_mobile_object_t *)object)->tile_position;
    ((uw_mobile_object_t *)object)->full_heading = (byte)(char)((ushort)*(undefined2 *)((char *)position + 0x21) >> 8);
    uVar8 = uVar1 & 0x3ff;
    uVar7 = (DAT_0010144c & 0x3f) << 10;
    ((uw_mobile_object_t *)object)->tile_x = (uVar7 >> 10) & 0x3f;
    uVar7 = uVar1 & 0xf | uVar7 | ((int)DAT_00101454 & 0x3fU) << 4;
    ((uw_mobile_object_t *)object)->tile_y = (uVar7 >> 4) & 0x3f;
    bVar11 = SBORROW4((int)(short)position[8],-4);
    bVar9 = ((short)position[8] == -4) << 7 | ((uw_mobile_object_t *)object)->motion_flags & 0x7f;
    ((uw_mobile_object_t *)object)->gravity_flag = bVar9 >> 7;
    iVar5 = (int)(short)position[5];
    if (iVar5 < 0) {
      iVar5 = iVar5 + 0x3f;
    }
    iVar5 = (short)(iVar5 >> 6) + 0x10;
    sVar4 = (short)iVar5;
    iVar5 = iVar5 * 0x10000 >> 0x10;
    bVar10 = iVar5 == 0;
    if (iVar5 < 0) {
      sVar4 = 0;
    }
    else {
      bVar11 = SBORROW4(iVar5,0x1f);
      bVar10 = iVar5 == 0x1f;
    }
    if (!bVar10 && (iVar5 < 0 || iVar5 + -0x1f < 0) == bVar11) {
      sVar4 = 0x1f;
    }
    ((uw_mobile_object_t *)object)->pitch = (byte)sVar4 & 0x1f;
    bVar3 = ordint_divmod(0x2f,(int)(short)position[10]).quot;
    ((uw_mobile_object_t *)object)->speed = bVar3 & 0x7f;
    ((uw_mobile_object_t *)object)->movement_mode = (&DAT_000868c0)[(byte)position[0x14]] & 7;
    if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) != 0x40) {
      uw_projectile_object_t *projectile = (uw_projectile_object_t *)object;
      uVar1 = *position;
      projectile->precise_x = uVar1;
      uVar1 = position[1];
      projectile->precise_y = uVar1;
      uVar1 = position[2];
      projectile->precise_z = uVar1;
    }
    return 1;
  }
LAB_0005559c:
  if ((((uw_object_hdr_t *)object)->object_id & 0x1c0) == 0x140) {
    uVar7 = ((uw_object_hdr_t *)object)->position_word & 0xfc7f | ((int)*(short *)((char *)position + 0x21) >> 0xd & 7U) << 7;
    ((uw_object_hdr_t *)object)->heading = (uVar7 >> 7) & 7;
  }
  return 0;
}




// was FUN_0005596c.
ushort *settle_mobile_to_immobile(ushort *object)
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
}






// was FUN_0007931c -- empties a dead creature's inventory into the world, capping the number of
// items dropped via a per-monster-class value (DAT_001007d9, indexed by the creature's type,
// 0x30-byte stride -- see g_monster_max_stats_table's own comment for this same table).
void drop_creature_inventory_on_death(void *creature_ptr)
{
  byte *creature = (byte *)creature_ptr;
  empty_container_into_world(creature,
                             g_monster_type_props[(*creature & 0x3f)].race_flags);
}





// was FUN_00079350 -- rolls a chance (based on g_despawn_creature_ record's own drop-rate byte,
// offset +0x26, high nibble) to spawn a treasure item on a dying/despawning creature: on a hit...
/* was `int` -- truncated the real object pointer spawn_creature_death_loot passes in (on this
   64-bit build), corrupting the address handed to object_list_insert_head(param_1 + 6, ...) below */
void spawn_creature_treasure_drop(void *creature_ptr)
{
  char *creature = (char *)creature_ptr;
  int uw_ord2005_rem_159 = 0;
  int iVar1;
  uint uVar2;
  byte bVar3;
  char cVar4;
  char cVar5;
  short sVar6;
  undefined4 uVar7;
  char extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  int iVar8;
  char *pObj;  /* was reuse of `iVar8` (int) -- truncated
                  spawn_new_object's real pointer */

  bVar3 = *(byte *)(g_despawn_creature_record + 0x26);
  uVar7 = ce_rand();
  uw_ord2005_rem_159 = ((int)(uVar7)) % (0x10);
  if (uw_ord2005_rem_159 < (int)(uint)(bVar3 >> 4)) {
    uVar7 = ce_rand();
    sVar6 = DAT_00201b68;
    extraout_r1 = (char)ordint_divmod(DAT_00201b68 * -3 + 0x28,uVar7).rem;
    iVar8 = ((char)sVar6 + -0xb) * 3 + (int)extraout_r1;
    cVar4 = (char)iVar8;
    if (iVar8 * 0x1000000 >> 0x18 < 0) {
      cVar4 = '\0';
    }
    cVar5 = (&DAT_002034b5)[cVar4 * 0xd];
    if (cVar5 == '\0') {
      cVar5 = '\x01';
    }
    if (cVar5 < '\f') {
      if (cVar5 < '\b') {
        if ('\x03' < cVar5) {
          cVar5 = (cVar5 + -2) * '\x02';
        }
      }
      else {
        cVar5 = (cVar5 + -5) * '\x04';
      }
    }
    else {
      cVar5 = cVar5 * '\b' + -0x44;
    }
    iVar8 = (bVar3 & 0xf) * 4;
    iVar1 = (int)cVar5;
    if (iVar8 < iVar1) {
      uVar7 = ce_rand();
      extraout_r1_01 = ordint_divmod(iVar1,uVar7).rem;
      if (iVar8 <= extraout_r1_01) {
        return;
      }
      cVar5 = '\x01';
    }
    else {
      cVar5 = ordint_divmod(iVar1,iVar8).quot;
      sVar6 = roll_dice_sum(4,((int)cVar5 << 0x19) >> 0x18);
      cVar5 = (char)(sVar6 >> 2);
    }
    uVar2 = (uint)cVar5;
    if (0 < (int)uVar2) {
      pObj = (char *)spawn_new_object((short)cVar4 + 0xa0,0);
      ((uw_object_hdr_t *)pObj)->link_word_low = ((uw_object_hdr_t *)pObj)->owner | (byte)((uVar2 & 0x3ff) << 6);
      ((uw_object_hdr_t *)pObj)->link_word_high = (byte)(char)((uVar2 << 0x16) >> 0x18);
      object_list_insert_head(creature + 6,pObj);
    }
  }
}





// was FUN_0007955c -- second creature-death drop roll: chance from g_despawn_creature_record's
// offset +0x27 low nibble; on a hit, spawns a single fixed-type item (high nibble + 0xb0) and links
// it into param_1's object chain.
/* was `int` -- same pointer-truncation bug as spawn_creature_treasure_drop */
void spawn_creature_special_item_drop(void *creature_ptr)
{
  char *creature = (char *)creature_ptr;
  int uw_ord2005_rem_160 = 0;
  byte bVar1;
  undefined4 uVar2;
  int extraout_r1;
  char *pObj;  /* was reuse of `uVar2` (undefined4) -- truncated
                  spawn_new_object's real pointer */

  bVar1 = *(byte *)(g_despawn_creature_record + 0x27);
  uVar2 = ce_rand();
  uw_ord2005_rem_160 = ((int)(uVar2)) % (0x10);
  if (uw_ord2005_rem_160 < (int)(bVar1 & 0xf)) {
    pObj = (char *)spawn_new_object((bVar1 >> 4) + 0xb0,0);
    object_list_insert_head(creature + 6,pObj);
  }
}



// was FUN_000795cc -- third creature-death drop roll: iterates 2 equipment-slot flag bytes
// (g_despawn_creature_record offsets +0x20/+0x21), and for each with bit 0 set...
/* was `int` -- same pointer-truncation bug as spawn_creature_treasure_drop */
void spawn_creature_equipment_drop(void *creature_ptr)
{
  char *creature = (char *)creature_ptr;
  int uw_ord2005_rem_161 = 0; int uw_ord2005_rem_162 = 0; int uw_ord2005_rem_163 = 0;
  undefined2 uVar1;
  byte bVar2;
  short sVar3;
  byte *pbVar4;
  undefined4 uVar5;
  char extraout_r1;
  byte bVar6;
  byte extraout_r1_00;
  int extraout_r1_01;
  uint extraout_r1_02;
  uint uVar7;
  uint uVar8;
  
  uVar8 = 0;
  do {
    bVar6 = *(byte *)(uVar8 + g_despawn_creature_record + 0x20);
    if ((bVar6 & 1) != 0) {
      pbVar4 = (byte *)spawn_new_object((bVar6 >> 1 & 0xf) + (bVar6 >> 5 & 3) * '\x10',0);
      uVar5 = ce_rand();
      uw_ord2005_rem_161 = ((int)(uVar5)) % (2);
      if (uw_ord2005_rem_161 == 0) {
        uVar5 = ce_rand();
        sVar3 = DAT_00201b68;
        extraout_r1 = (char)ordint_divmod((int)DAT_00201b68 << 2,uVar5).rem;
        bVar6 = extraout_r1 + (char)sVar3 * '\x04';
      }
      else {
        uVar5 = ce_rand();
        uw_ord2005_rem_162 = ((int)(uVar5)) % (0x40);
        bVar6 = uw_ord2005_rem_162;
      }
      uVar1 = ((uw_object_hdr_t *)pbVar4)->chain_word;
      bVar2 = (byte)uVar1;
      ((uw_object_hdr_t *)pbVar4)->chain_word_low = (bVar2 ^ bVar6) & 0x3f ^ bVar2;
      ((uw_object_hdr_t *)pbVar4)->chain_word_high = (byte)((ushort)uVar1 >> 8);
      if ((((uw_object_hdr_t *)pbVar4)->object_id & 0x30) == 0x10) {
        if (g_ranged_type_props[(((uw_object_hdr_t *)pbVar4)->object_id & 0xf)].ammo_damage_selector == 0xc0) {  /* byte value 0xc0 (was compared against -0x40, never true for an unsigned byte) */
          uVar5 = ce_rand();
          uw_ord2005_rem_163 = ((int)(uVar5)) % (8);
          uVar7 = (uw_ord2005_rem_163 & 0xffff) + 4;
          ((uw_object_hdr_t *)pbVar4)->link_word_low = ((uw_object_hdr_t *)pbVar4)->owner ^ (char)uVar7 * '@';
          ((uw_object_hdr_t *)pbVar4)->link_word_high = (byte)(uVar7 >> 2);
        }
      }
      object_list_insert_head(creature + 6,pbVar4);
    }
    uVar8 = uVar8 + 1 & 0xff;
  } while (uVar8 < 2);
}





// was FUN_00079784 -- fourth creature-death drop roll: iterates 2 item slots
// (g_despawn_creature_record offsets +0x22/+0x24, each a packed ushort: item id in the high 12
// bits, drop-chance nibble in the low 4), rolling a d16 chance per slot; on a hit...
/* was `int` -- same pointer-truncation bug as spawn_creature_treasure_drop */
void spawn_creature_misc_item_drop(void *creature_ptr)
{
  char *creature = (char *)creature_ptr;
  int uw_ord2005_rem_164 = 0; int uw_ord2005_rem_165 = 0; int uw_ord2005_rem_166 = 0;
  ushort uVar1;
  undefined2 uVar2;
  byte bVar3;
  short sVar4;
  undefined4 uVar5;
  char *iVar6;  /* was `int` -- truncated spawn_new_object's real pointer */
  char extraout_r1;
  byte bVar7;
  byte extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint uVar8;

  uVar8 = 0;
  do {
    uVar5 = ce_rand();
    uVar1 = *(ushort *)(g_despawn_creature_record + uVar8 * 2 + 0x22);
    uw_ord2005_rem_164 = ((int)(uVar5)) % (0x10);
    if (uw_ord2005_rem_164 < (int)(uVar1 & 0xf)) {
      iVar6 = (char *)spawn_new_object(uVar1 >> 4,0);
      uVar5 = ce_rand();
      uw_ord2005_rem_165 = ((int)(uVar5)) % (2);
      if (uw_ord2005_rem_165 == 0) {
        uVar5 = ce_rand();
        sVar4 = DAT_00201b68;
        extraout_r1 = (char)ordint_divmod((int)DAT_00201b68 << 2,uVar5).rem;
        bVar7 = extraout_r1 + (char)sVar4 * '\x04';
      }
      else {
        uVar5 = ce_rand();
        uw_ord2005_rem_166 = ((int)(uVar5)) % (0x40);
        bVar7 = uw_ord2005_rem_166;
      }
      uVar2 = ((uw_object_hdr_t *)iVar6)->chain_word;
      bVar3 = (byte)uVar2;
      ((uw_object_hdr_t *)iVar6)->chain_word_low = (bVar3 ^ bVar7) & 0x3f ^ bVar3;
      ((uw_object_hdr_t *)iVar6)->chain_word_high = (byte)(char)((ushort)uVar2 >> 8);
      object_list_insert_head(creature + 6,iVar6);
    }
    uVar8 = uVar8 + 1 & 0xff;
  } while (uVar8 < 2);
}





// was FUN_000798c4 -- the creature death-loot orchestrator, gated on a "already dropped" flag
// (param_1[7] bit 0x10, set at the end): points g_despawn_creature_record at this creature's own
// per-class record in the same table as g_monster_max_stats_table...
void spawn_creature_death_loot(ushort *creature)
{
  if (!((uw_mobile_object_t *)creature)->npc_loot_spawned) {
    g_despawn_creature_record = &DAT_001007d0 +
                   (((int)(short)*creature & 0xfU) + (short)((*creature & 0x30) >> 4) * 0x10) * 0x30;
    spawn_creature_treasure_drop(creature);
    spawn_creature_special_item_drop(creature);
    spawn_creature_equipment_drop(creature);
    spawn_creature_misc_item_drop(creature);
    ((uw_mobile_object_t *)creature)->npc_loot_spawned = 1;
  }
}


// was FUN_000816e0 -- morphs a trap/hazard object (class id 0x14 or 0x15) into its "active"
// counterpart (0x1c2 or 0x1c5 respectively -- 0x1c2 is the same spell-effect id
// cast_area_spell_effect spawns), schedules it (type 4, delay 0)...
int activate_area_hazard_object(ushort *hazard, uint tile_x, int tile_y, int damage)
{
  int iVar1;
  ushort uVar2;
  short sVar3;
  undefined4 uVar4;
  uint uVar5;
  uint uVar6;
  ushort local_24 [4];
  
  local_24[0] = 0x14;
  local_24[1] = 0x15;
  local_24[2] = 0x1c2;
  local_24[3] = 0x1c5;
  uVar2 = *hazard;
  uVar6 = 0;
  do {
    if ((int)(short)local_24[uVar6] == (uVar2 & 0x1ff)) break;
    uVar6 = (int)((uVar6 + 1) * 0x10000) >> 0x10;
  } while ((int)uVar6 < 2);
  iVar1 = (int)(short)uVar6;
  if (iVar1 < 2) {
    uVar5 = (local_24[iVar1 + 2] ^ uVar2) & 0x1ff ^ (uint)uVar2;
    *(char *)hazard = (char)uVar5;
    *(char *)((char *)hazard + 1) = (char)(uVar5 >> 8);
    uVar4 = encode_object_slot_index(hazard);
    sVar3 = scheduler_add_entry(uVar4,4,0,tile_x & 0xff,(char)tile_y);
    if (sVar3 != -1) {
      if (iVar1 == 0) {
        spawn_effect_debris_burst(hazard,tile_x,tile_y);
      }
      damage_all_objects_at_tile(tile_x,tile_y,(uVar6 & 0xff) + 1,damage);
      return 1;
    }
  }
  return 0;
}





// was FUN_0002b258 -- drops a dead monster's loot: if param_2 (a gold-category nibble from the
// monster's own template data) is nonzero, spawns a gold-pile object (0xd8+category) at the
// corpse's own tile; if param_3 (a treasure-category nibble) is nonzero...
void drop_monster_loot(void *monster_ptr, ushort gold_nibble, ushort item_nibble)
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
}


// was FUN_0002d110 -- reconstructs an NPC's walk path from creature_find_path_to_tile's BFS
// parent-pointer scratch arrays (&DAT_0023cf08-family), walking backward from the found tile...
void reconstruct_path_from_bfs(byte step_count, byte goal_x, byte goal_y)
{
  int iVar1;
  uint uVar2;
  int iVar3;
  
  DAT_0010142c = step_count + 1;
  (&DAT_00101740)[(step_count + 1) * 7] = goal_x;
  (&DAT_00101748)[(uint)step_count * 7] = goal_y;
  DAT_00101743 = 0;
  DAT_00101744 = 0;
  DAT_00101746 = 0;
  for (uVar2 = (uint)(byte)(step_count + 1); uVar2 != 0; uVar2 = uVar2 + 0xff & 0xff) {
    iVar1 = uVar2 * 7;
    iVar3 = ((uint)(byte)(&DAT_00101741)[iVar1] + (uint)(byte)(&DAT_00101740)[iVar1] * 0x40) * 5;
    (&DAT_00101740)[iVar1 - 7] = (&DAT_0023cf08)[iVar3];
    (&DAT_00101740)[iVar1 - 6] = (&DAT_0023cf09)[iVar3];
    (&DAT_00101743)[iVar1] = (&DAT_0023cf0b)[iVar3] & 1;
    *(undefined1 *)((intptr_t)&DAT_00101744 + iVar1) = 0;
    *(undefined1 *)((intptr_t)&DAT_00101744 + iVar1 + 1) = 0;
    (&DAT_00101746)[iVar1] = 0;
  }
}



// was FUN_0002d1e0 -- attempts a direct straight-line walk from tile (param_1,param_2) toward tile
// (param_3,param_4): sets up a Bresenham-style line-walk state (DAT_00101740/etc), stepping through
// can_step_between_tiles-checked tiles via record_line_walk_step.
int try_direct_line_walk(byte start_x, byte start_y, short goal_x, short goal_y)
{
  int iVar1;
  char cVar2;
  short sVar3;
  byte *pbVar4;
  int iVar5;
  char cVar6;
  int iVar7;
  uint uVar8;
  byte *pbVar9;
  uint uVar10;
  byte *pbVar11;
  byte local_34;
  byte local_33;
  char local_32;
  byte local_31;
  undefined1 auStack_30 [4];
  uint local_2c;
  uint local_28;
  
  local_2c = (uint)goal_x;
  local_31 = 0x40;
  local_28 = (uint)goal_y;
  iVar7 = (int)(char)goal_y - (int)(char)start_y;
  local_34 = start_y;
  local_33 = start_x;
  /* Dropped both arguments -- was `tilemap_lookup()`. start_x/start_y are this line-walk's starting
     tile (just stashed into local_33/local_34 above, and into DAT_00101740/DAT_00101741 a few lines
     below as the walk's "current position" state)... */
  pbVar4 = (byte *)tilemap_lookup(start_x,start_y);
  if (pbVar4 == 0) {
    DAT_00101450 = 0;
    return -1;
  }
  iVar5 = ((int)(char)goal_x - (int)(char)start_x) * 0x1000000;
  iVar1 = iVar5 >> 0x18;
  if (iVar1 == 0) {
    iVar5 = iVar7 * 0x1000000;
  }
  DAT_00101450 = 0;
  if (iVar1 == 0 && iVar5 >> 0x18 == 0) {
    DAT_00101450 = 0;
    return -1;
  }
  iVar5 = iVar7 * 0x1000000 >> 0x18;
  if (iVar1 < iVar5) {
    if (iVar1 < -iVar5) {
      pbVar9 = &local_33;
      pbVar11 = &local_34;
      cVar2 = ordint_divmod(iVar1,iVar5 << 7).quot;
      goto LAB_0002d330;
    }
    pbVar9 = &local_34;
    pbVar11 = &local_33;
    cVar2 = ordint_divmod(iVar5,iVar1 << 7).quot;
  }
  else {
    if (iVar1 < -iVar5) {
      pbVar9 = &local_34;
      pbVar11 = &local_33;
      cVar2 = ordint_divmod(iVar5,iVar1 << 7).quot;
      iVar5 = iVar1;
LAB_0002d330:
      local_32 = -1;
      cVar6 = -1;
      if (0 < iVar5) {
        local_32 = '\x01';
      }
      goto LAB_0002d340;
    }
    pbVar9 = &local_33;
    pbVar11 = &local_34;
    cVar2 = ordint_divmod(iVar1,iVar5 << 7).quot;
    iVar1 = iVar5;
  }
  cVar6 = '\x01';
  local_32 = '\x01';
  if (iVar1 < 1) {
    local_32 = -1;
  }
LAB_0002d340:
  DAT_0010142c = 1;
  DAT_00101742 = *pbVar4 >> 4;
  *pbVar9 = *pbVar9 + cVar6;
  uVar10 = (uint)local_34;
  uVar8 = (uint)local_33;
  DAT_00101740 = start_x;
  DAT_00101741 = start_y;
  iVar5 = record_line_walk_step(uVar8,uVar10);
  while( true ) {
    if (iVar5 == 0) {
      return 0;
    }
    local_31 = cVar2 + local_31;
    if ((local_31 & 0x80) != 0) {
      local_31 = local_31 & 0x7f;
      *pbVar11 = local_32 + *pbVar11;
      uVar10 = (uint)local_34;
      uVar8 = (uint)local_33;
      iVar5 = record_line_walk_step(uVar8,uVar10);
      if (iVar5 == 0) {
        return 0;
      }
    }
    if ((uVar8 == local_2c) && (uVar10 == local_28)) break;
    *pbVar9 = cVar6 + *pbVar9;
    uVar10 = (uint)local_34;
    uVar8 = (uint)local_33;
    iVar5 = record_line_walk_step(uVar8,uVar10);
  }
  /* ARM 0x2d47c..0x2d4d4 addresses the waypoint array at count*7,
     then subtracts field offsets. These are not adjacent AI globals. */
  iVar5 = (uint)DAT_0010142c * 7;
  sVar3 = tile_pair_los_blocked((&DAT_00101740)[iVar5 - 14],(&DAT_00101740)[iVar5 - 13],(&DAT_00101740)[iVar5 - 7],
                       (&DAT_00101740)[iVar5 - 6],0,0,*(undefined2 *)(DAT_00101438 + 4),
                       *(undefined2 *)(DAT_00101438 + 6),(&DAT_00101740)[iVar5 - 12]
                       ,(byte *)&DAT_00101740 + iVar5 - 12,auStack_30);
  return (int)sVar3;
}


// was FUN_0002d4e8 -- checks line-of-sight between two fine-grained (sub-tile) positions, walking a
// Bresenham-style line and testing each crossed tile boundary via can_step_between_tiles...
int check_fine_line_of_sight(uint from_x, uint from_y, uint from_z, short to_x, short to_y, short to_z)
{
  short sVar1;
  int iVar2;
  int iVar3;
  byte bVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  uint uVar10;
  ushort uVar11;
  ushort uVar12;
  ushort uVar13;
  ushort uVar14;
  byte local_3c;
  byte local_3b;
  char local_3a;
  char local_39;
  char local_38;
  byte local_37;
  byte local_36;
  byte local_35;
  byte local_34;
  byte local_33;
  short local_32;
  byte *local_30;
  byte *local_2c;
  int local_28;
  
  uVar9 = (uint)(short)from_x;
  iVar7 = ((int)to_x - uVar9) * 0x10000;
  iVar3 = iVar7 >> 0x10;
  uVar10 = (uint)(short)from_y;
  iVar2 = ((int)to_y - uVar10) * 0x10000;
  local_28 = (int)(short)from_z;
  local_32 = (short)((uint)((to_z - local_28) * 0x10000) >> 0x10);
  local_34 = (byte)(to_x >> 3);
  uVar13 = (short)from_x >> 3;
  uVar14 = uVar13 & 0xff;
  local_3b = (byte)uVar13;
  iVar8 = (int)to_y >> 3;
  local_33 = (byte)iVar8;
  uVar13 = (short)from_y >> 3;
  if (iVar3 == 0) {
    iVar8 = (iVar2 >> 0x10) << 0x10;
  }
  uVar12 = uVar13 & 0xff;
  local_3c = (byte)uVar13;
  if (iVar3 == 0 && iVar8 >> 0x10 == 0) {
    return 1;
  }
  sVar1 = (short)((uint)iVar2 >> 0x10);
  iVar2 = (int)sVar1;
  iVar8 = -iVar2;
  local_37 = local_3b;
  local_36 = local_3c;
  if (iVar3 < iVar2) {
    if (iVar3 < iVar8) {
      local_2c = &local_3b;
      local_3a = -1;
      local_38 = (char)(-iVar3 >> 3);
      local_39 = -1;
      local_30 = &local_3c;
      if (0 < iVar2) {
        local_3a = '\x01';
      }
      if (local_3a == '\x01') {
        /* Was a dropped register-forwarding argument -- was `ordint_divmod().quot;` with no args. */
        iVar7 = ordint_divmod(iVar3,iVar2 << 7).quot;
        uVar5 = -iVar7;
        uVar9 = uVar9 & 7;
        goto LAB_0002d808;
      }
      uVar5 = ordint_divmod(iVar3,iVar2 << 7).quot;
      uVar9 = uVar9 & 7;
LAB_0002d824:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar9 * uVar5;
      from_x = from_y;
    }
    else {
      local_2c = &local_3c;
      local_38 = (char)(sVar1 >> 3);
      local_30 = &local_3b;
      local_3a = '\x01';
      local_39 = '\x01';
      if (iVar3 < 1) {
        local_3a = -1;
      }
      if (local_3a != '\x01') {
        uVar5 = ordint_divmod(iVar2,iVar3 * -0x80).quot;
        uVar10 = 7 - (uVar10 & 7);
        goto LAB_0002d6c0;
      }
      uVar5 = ordint_divmod(iVar2,iVar3 << 7).quot;
      uVar10 = 7 - (uVar10 & 7);
LAB_0002d768:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar10 * uVar5;
    }
    if (iVar7 < 0) {
      iVar7 = iVar7 + 7;
    }
    uVar9 = (iVar7 >> 3 & 0xffU) + (from_x & 7) * 0x10;
  }
  else {
    if (iVar3 < iVar8) {
      local_2c = &local_3c;
      local_3a = -1;
      local_38 = (char)(iVar8 >> 3);
      local_39 = -1;
      local_30 = &local_3b;
      if (0 < iVar3) {
        local_3a = '\x01';
      }
      if (local_3a != '\x01') {
        uVar5 = ordint_divmod(iVar2,iVar3 << 7).quot;
        uVar10 = uVar10 & 7;
        goto LAB_0002d768;
      }
      /* Was a dropped register-forwarding argument -- same class as this function's own earlier fix
         (uw.c ~8942): reconstructed as this branch's own sibling call above
         (`ordint_divmod(iVar2,iVar3 << 7).quot`) wrapped in the negation this code already... */
      iVar7 = ordint_divmod(iVar2,iVar3 << 7).quot;
      uVar5 = -iVar7;
      uVar10 = uVar10 & 7;
LAB_0002d6c0:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar10 * uVar5;
    }
    else {
      local_38 = (char)(short)(iVar7 >> 0x13);
      local_30 = &local_3c;
      local_39 = '\x01';
      local_3a = '\x01';
      if (iVar2 < 1) {
        local_3a = -1;
      }
      local_2c = &local_3b;
      if (local_3a == '\x01') {
        uVar5 = ordint_divmod(iVar3,iVar2 << 7).quot;
        uVar9 = 7 - (uVar9 & 7);
        goto LAB_0002d824;
      }
      uVar5 = ordint_divmod(iVar3,iVar2 * -0x80).quot;
      uVar9 = 7 - (uVar9 & 7);
LAB_0002d808:
      uVar5 = uVar5 & 0xff;
      iVar7 = uVar9 * uVar5;
      from_x = from_y;
    }
    if (iVar7 < 0) {
      iVar7 = iVar7 + 7;
    }
    uVar9 = (iVar7 >> 3 & 0xffU) + (from_x & 7) * -0x10 + 0x70;
  }
  from_z = from_z & 0xff;
  local_35 = 0;
  while( true ) {
    bVar4 = local_36;
    uVar13 = uVar14;
    uVar11 = uVar12;
    if ((uVar9 & 0x80) != 0) {
      uVar9 = uVar9 & 0x7f;
      *local_30 = local_3a + *local_30;
      uVar11 = (ushort)local_3c;
      uVar13 = (ushort)local_3b;
      iVar7 = can_step_between_tiles(local_37,bVar4,uVar14,uVar12,local_3b,local_3c,(char)from_z);
      if (iVar7 == 0) {
        return 0;
      }
      if ((uVar13 == local_34) && (uVar11 == local_33)) {
        uVar6 = can_step_between_tiles(uVar14,uVar12,uVar13,uVar11,0,0,(char)from_z);
        return uVar6;
      }
      local_37 = (byte)uVar14;
      local_36 = (byte)uVar12;
    }
    *local_2c = local_39 + *local_2c;
    local_35 = local_35 + 1;
    if (10 < local_35) {
      return 0;
    }
    if (local_38 != '\0') {
      iVar7 = ordint_divmod(local_38,(int)local_32 * (uint)local_35).quot;
      from_z = local_28 + iVar7 & 0xff;
    }
    uVar12 = (ushort)local_3c;
    uVar14 = (ushort)local_3b;
    iVar7 = can_step_between_tiles(local_37,local_36,uVar13,uVar11,local_3b,local_3c,(char)from_z);
    if (iVar7 == 0) break;
    if ((uVar14 == local_34) && (uVar12 == local_33)) {
      uVar6 = can_step_between_tiles(uVar13,uVar11,uVar14,uVar12,0,0,(char)from_z);
      return uVar6;
    }
    local_37 = (byte)uVar13;
    local_36 = (byte)uVar11;
    uVar9 = uVar5 + uVar9;
  }
  return 0;
}


// was FUN_0002d9f4 -- records the next waypoint (param_1,param_2) into try_direct_line_walk's own
// step-array state (DAT_00101740/41), then validates line-of-sight for that step via
// tile_pair_los_blocked...
int record_line_walk_step(byte x, byte y)
{
  uint uVar1;
  int iVar2;
  uint uVar3;
  undefined1 auStack_14 [4];
  
  DAT_00101450 = 0;
  iVar2 = (uint)DAT_0010142c * 7;
  (&DAT_00101740)[iVar2] = x;
  (&DAT_00101741)[iVar2] = y;
  uVar3 = DAT_0010142c + 1;
  uVar1 = uVar3 & 0xff;
  DAT_0010142c = (byte)uVar3;
  if (uVar1 < 0x40) {
    if (uVar1 == 2) {
      iVar2 = tile_pair_los_blocked(0,0,DAT_00101740,DAT_00101741,DAT_00101747,DAT_00101748,
                           *(undefined2 *)(DAT_00101438 + 4),*(undefined2 *)(DAT_00101438 + 6),
                           DAT_00101742,&DAT_00101749,auStack_14);
    }
    else {
      /* ARM 0x2dac4..0x2db24 uses DAT_00101740 + count*7 with
         offsets -21..-6. Indexing past standalone DAT_0010172c/34
         instead corrupts the collision-profile pointer and AI state. */
      iVar2 = uVar1 * 7;
      iVar2 = tile_pair_los_blocked((&DAT_00101740)[iVar2 - 21],
                           (&DAT_00101740)[iVar2 - 20],(&DAT_00101740)[iVar2 - 14],
                           (&DAT_00101740)[iVar2 - 13],(&DAT_00101740)[iVar2 - 7],(&DAT_00101740)[iVar2 - 6],
                           *(undefined2 *)(DAT_00101438 + 4),*(undefined2 *)(DAT_00101438 + 6),
                           (&DAT_00101740)[iVar2 - 19],
                           (byte *)&DAT_00101740 + iVar2 - 12,auStack_14);
    }
    if ((iVar2 != 0) && (DAT_00101440 == 0)) {
      return 1;
    }
  }
  return 0;
}


// was FUN_0002db4c -- pops the lowest set bit (0-15) from DAT_000853b8, the pending "path cache
// slot needs recompute" bitmask (set per-NPC via `1 << (record's own byte 0xb & 0xf)` slot index),
// outputting it via *param_1. Returns 1 if a pending slot was found, 0 if the mask is empty.
int pop_pending_path_cache_slot(byte *out_slot)
{
  uint uVar1;

  if (DAT_000853b8 != 0) {
    uVar1 = 0;
    do {
      if (((uint)DAT_000853b8 & 1 << uVar1) != 0) {
        *out_slot = (char)uVar1;
        return 1;
      }
      uVar1 = uVar1 + 1 & 0xff;
    } while (uVar1 < 0x10);
  }
  return 0;
}



// was FUN_0002dba4 -- resets the NPC path-cache system: clears a per-record flag (byte 0x15 bit 7,
// likely "path cached") on every object slot 2-255, then resets DAT_000853b8 to 0xffff, marking all
// 16 path-cache slots pending recompute.
void reset_npc_path_cache()

{
  /* Was `int`, truncating get_object_record_by_slot_index's real pointer return. */
  char *iVar1;
  int iVar2;

  iVar2 = 2;
  do {
    iVar1 = get_object_record_by_slot_index(iVar2);
    ((uw_mobile_object_t *)iVar1)->animation_flags = ((uw_mobile_object_t *)iVar1)->animation_flags & 0x7f;
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x100);
  DAT_000853b8 = 0xffff;
  return;
}



// was FUN_0002dbf4 -- serializes the just-computed walk path (DAT_00101740/41 start, DAT_0010142c
// step count, and the per-step direction arrays try_direct_line_walk/record_line_walk_step filled)
// into a compact bitfield cache record at param_1...
void save_walk_path_to_cache_slot(byte *record)
{
  uint uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  
  uVar5 = 0;
  record[2] = record[2] & 0x80;
  *record = DAT_00101740;
  record[1] = DAT_00101741;
  record[3] = DAT_0010142c;
  uVar1 = 0;
  if (DAT_0010142c != 0) {
    uVar4 = 0;
    do {
      iVar3 = 0;
      uVar1 = 0;
      do {
        iVar2 = (uVar1 + uVar4) * 7;
        /* ARM adds a signed direction offset to the table's center. */
        iVar3 = iVar3 + (((byte)(&DAT_000853c4)
                                [((int)(byte)(&DAT_00101747)[iVar2] -
                                  (int)(byte)(&DAT_00101740)[iVar2]) * 3 -
                                 (int)(byte)(&DAT_00101741)[iVar2] +
                                 (int)(byte)(&DAT_00101748)[iVar2]] & 3) << ((uVar1 & 0x7f) << 1));
        uVar1 = uVar1 + 1 & 0xff;
      } while (uVar1 < 4);
      record[(uVar4 >> 2) + 4] = (char)iVar3;
      uVar5 = uVar5 + 4;
      uVar1 = (uint)DAT_0010142c;
      uVar4 = uVar5 & 0xff;
    } while (uVar4 < uVar1);
  }
  uVar5 = 0;
  if (uVar1 != 0) {
    uVar1 = 0;
    do {
      iVar3 = 0;
      uVar4 = 0;
      do {
        iVar3 = iVar3 + (((byte)(&DAT_0010174a)[(uVar4 + uVar1) * 7] & 1) << uVar4);
        uVar4 = uVar4 + 1 & 0xff;
      } while (uVar4 < 8);
      record[(uVar1 >> 3) + 0x14] = (char)iVar3;
      uVar5 = uVar5 + 8;
      uVar1 = uVar5 & 0xff;
    } while (uVar1 < DAT_0010142c);
  }
}


// was FUN_0002dd4c -- advances a cached NPC walk path (the 28-byte per-slot record
// save_walk_path_to_cache_slot writes, keyed on the current step index at param_1[2]&0x7f vs the
// total step count at param_1[3]) by one step...
int advance_cached_path_step(char *record)
{
  int uw_ord2005_rem_14 = 0; int uw_ord2005_rem_15 = 0;
  int iVar1;
  byte bVar2;
  byte bVar3;
  undefined4 uVar4;
  uint extraout_r1;
  uint extraout_r1_00;
  byte bVar5;
  
  bVar2 = record[2];
  bVar5 = bVar2 & 0x7f;
  if (bVar5 < (byte)record[3]) {
    bVar3 = record[(bVar2 >> 2 & 0x1f) + 4];
    uw_ord2005_rem_14 = ((int)(bVar5)) % (4);
    iVar1 = (short)(bVar3 >> ((uw_ord2005_rem_14 & 0x7f) << 1) & 3) * 2;
    *record = *record + (&DAT_000853b0)[iVar1];
    record[1] = record[1] + (&DAT_000853b1)[iVar1];
    bVar3 = record[(bVar2 >> 3 & 0xf) + 0x14];
    uw_ord2005_rem_15 = ((int)(bVar5)) % (8);
    if ((bVar3 >> (uw_ord2005_rem_15 & 0xff) & 1) == 0) {
      record[2] = bVar5;
    }
    else {
      record[2] = bVar2 | 0x80;
    }
    bVar2 = record[2];
    record[2] = (bVar2 + 1 ^ bVar2) & 0x7f ^ bVar2;
    uVar4 = 1;
  }
  else {
    uVar4 = 0;
  }
  return uVar4;
}



// was FUN_0002de40 -- checks whether an NPC's current tile position matches its cached path's
// expected position for this tick. param_1 is the cache record's own "blocked" flag (param_1[2]>>7
// at the call site); if clear...
int check_path_cache_position_match(int cache_flag, short tile_x, short tile_y, short sub_x, short sub_y, short expected_sub_x, short expected_sub_y)
{
  int iVar1;
  int iVar2;
  int iVar3;
  short sVar4;
  short sVar5;
  undefined4 uVar6;
  int iVar7;
  bool bVar8;
  bool bVar9;
  
  if (cache_flag == 0) {
    iVar1 = (int)sub_x;
    bVar9 = SBORROW4(iVar1,6);
    iVar7 = iVar1 + -6;
    bVar8 = iVar1 == 6;
    sVar5 = 0;
    if (5 < iVar1) {
      iVar2 = (int)tile_x;
      iVar3 = (int)expected_sub_x;
      bVar9 = SBORROW4(iVar3,iVar2);
      iVar7 = iVar3 - iVar2;
      bVar8 = iVar3 == iVar2;
      sVar5 = tile_x;
    }
    if (bVar8 || iVar7 < 0 != bVar9) {
      sVar4 = tile_x;
      if ((iVar1 < 2) && (sVar5 = tile_x, expected_sub_x < tile_x)) {
        sVar4 = tile_x + -1;
      }
    }
    else {
      sVar4 = sVar5 + 1;
    }
    tile_x = sVar4;
    iVar7 = (int)sub_y;
    bVar9 = SBORROW4(iVar7,6);
    iVar1 = iVar7 + -6;
    bVar8 = iVar7 == 6;
    if (5 < iVar7) {
      iVar2 = (int)tile_y;
      iVar3 = (int)expected_sub_y;
      bVar9 = SBORROW4(iVar3,iVar2);
      iVar1 = iVar3 - iVar2;
      bVar8 = iVar3 == iVar2;
      sVar5 = tile_y;
    }
    if (bVar8 || iVar1 < 0 != bVar9) {
      if ((iVar7 < 2) && (expected_sub_y < tile_y)) {
        tile_y = tile_y + -1;
      }
    }
    else {
      tile_y = sVar5 + 1;
    }
  }
  if ((tile_x != expected_sub_x) || (uVar6 = 1, tile_y != expected_sub_y)) {
    uVar6 = 0;
  }
  return uVar6;
}


// was FUN_0002df2c -- the top-level "walk via cached path" driver: checks the cache slot's position
// match (check_path_cache_position_match) and advances it a step if valid
// (advance_cached_path_step); if the path isn't blocked...
int walk_using_cached_path(byte *cache_record)
{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  int iVar8;
  byte bVar4;
  
  bVar1 = *cache_record;
  bVar2 = cache_record[1];
  iVar5 = check_path_cache_position_match(cache_record[2] >> 7,DAT_00101918,DAT_001013f8,DAT_00101910 & 7,DAT_0010141c & 7,
                       bVar1,bVar2);
  bVar3 = DAT_00101918;
  bVar4 = DAT_001013f8;
  if ((iVar5 == 0) || (iVar5 = advance_cached_path_step(cache_record), bVar3 = bVar1, bVar4 = bVar2, iVar5 != 0)) {
    if ((cache_record[2] & 0x80) == 0) {
      if ((DAT_00101404->movement_flags & 0x80) != 0) {
        set_npc_altitude_state(DAT_0010190c->npc_target_tile_x,
                               DAT_0010190c->npc_target_tile_y);
      }
      uVar7 = (uint)*cache_record;
      iVar5 = uVar7 * 8;
      if (bVar3 == uVar7) {
        iVar5 = iVar5 + 4;
      }
      else if (uVar7 < bVar3) {
        iVar5 = iVar5 + 7;
      }
      uVar7 = (uint)cache_record[1];
      iVar8 = uVar7 * 8;
      if (bVar4 == uVar7) {
        iVar8 = iVar8 + 4;
      }
      else if (uVar7 < bVar4) {
        iVar8 = iVar8 + 7;
      }
      uVar7 = compute_movement_heading((int)((iVar5 - (uint)DAT_00101910) * 0x1000000) >> 0x18,
                           (int)((iVar8 - (uint)DAT_0010141c) * 0x1000000) >> 0x18);
      DAT_0010190c->full_heading = (byte)((uVar7 & 0xff) << 5);
      DAT_0010190c->hdr.heading = uVar7 & 0x7;
      DAT_0010190c->npc_heading = 0;
    }
    else {
      handle_blocked_cached_path(cache_record);
    }
    uVar6 = 1;
  }
  else {
    uVar6 = 0;
  }
  return uVar6;
}



// was FUN_0002e104 -- handles a blocked/exhausted cached path: if the NPC is close (<3 tiles) to
// the cache's own tracked endpoint, takes one more direction-table-driven step past it...
void handle_blocked_cached_path(byte *cache_record)
{
  int uw_ord2005_rem_16 = 0;
  int iVar1;
  byte bVar2;
  uint extraout_r1;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  
  uVar7 = (uint)*cache_record;
  iVar1 = uVar7 * 8;
  uVar3 = iVar1 - 2;
  if (DAT_00101918 == uVar7) {
    uVar3 = iVar1 + 4;
  }
  else if (uVar7 < DAT_00101918) {
    uVar3 = iVar1 + 9;
  }
  uVar6 = (uint)cache_record[1];
  iVar1 = uVar6 * 8;
  uVar5 = iVar1 - 2;
  if (DAT_001013f8 == uVar6) {
    uVar5 = iVar1 + 4;
  }
  else if (uVar6 < DAT_001013f8) {
    uVar5 = iVar1 + 9;
  }
  uVar4 = (uVar3 & 0xffff) - (uint)DAT_00101910;
  uVar3 = (uVar5 & 0xffff) - (uint)DAT_0010141c;
  if ((int)(((uVar3 ^ (int)uVar3 >> 0x1f) - ((int)uVar3 >> 0x1f)) +
           ((uVar4 ^ (int)uVar4 >> 0x1f) - ((int)uVar4 >> 0x1f))) < 3) {
    bVar2 = cache_record[(cache_record[2] >> 2 & 0x1f) + 4];
    uw_ord2005_rem_16 = ((int)(cache_record[2] & 0x7f)) % (4);
    iVar1 = (short)(bVar2 >> ((uw_ord2005_rem_16 & 0x7f) << 1) & 3) * 2;
    uVar3 = compute_movement_heading(((int)(char)(&DAT_000853b0)[iVar1] + uVar7 & 0xff) -
                         (uint)(DAT_0010190c->npc_xhome),
                         ((int)(char)(&DAT_000853b1)[iVar1] + uVar6 & 0xff) -
                         (DAT_0010190c->npc_yhome));
    DAT_00101920 = 1;
    DAT_0010190c->full_heading = (byte)((uVar3 & 0xff) << 5);
    DAT_0010190c->hdr.heading = uVar3 & 0x7;
    DAT_0010190c->npc_heading = 0;
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 | 0xb0;
    DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x8b | 0xb;
  }
  else {
    uVar3 = compute_movement_heading((int)(uVar4 * 0x1000000) >> 0x18,(int)(uVar3 * 0x1000000) >> 0x18);
    DAT_0010190c->full_heading = (byte)((uVar3 & 0xff) << 5);
    DAT_0010190c->hdr.heading = uVar3 & 0x7;
    DAT_0010190c->npc_heading = 0;
  }
}



// was FUN_0002e3b4 -- computes an 8-way movement heading (0-7) from a relative (param_1,param_2)
// delta, used by walk_using_cached_path/ handle_blocked_cached_path to steer an NPC's
// facing/movement byte 9.
int compute_movement_heading(int dx, int dy)
{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  
  iVar1 = (int)(char)dy;
  iVar2 = (dy << 0x19) >> 0x18;
  iVar3 = (dx << 0x19) >> 0x18;
  iVar4 = (int)(char)dx;
  if (iVar3 < iVar1) {
    if (-iVar2 < iVar4) {
      uVar5 = 0;
      if (iVar1 <= -iVar3) {
        uVar5 = 7;
      }
    }
    else {
      uVar5 = 5;
      if (iVar4 <= iVar2) {
        uVar5 = 6;
      }
    }
  }
  else if (-iVar2 < iVar4) {
    uVar5 = 2;
    if (iVar4 <= iVar2) {
      uVar5 = 1;
    }
  }
  else {
    uVar5 = 3;
    if (iVar1 <= -iVar3) {
      uVar5 = 4;
    }
  }
  return uVar5;
}


// was FUN_0002ee80 -- sets a flying/levitating NPC's vertical movement/animation state (packed into
// the top bits of record byte 0x14): compares its current altitude (byte 2 & 0x7f) against the
// target tile (param_1,param_2)'s own ceiling-derived height...
void set_npc_altitude_state(byte tile_x, byte tile_y)
{
  int uw_ord2005_rem_20 = 0;
  char cVar1;
  byte *pbVar2;
  uint uVar3;
  undefined4 uVar4;
  char extraout_r1;
  uint uVar5;
  
  if (DAT_00101914 == 0) {
    pbVar2 = (byte *)tilemap_lookup(tile_x,tile_y);
    uVar5 = DAT_0010190c->hdr.zpos;
    uVar3 = (uint)(*pbVar2 >> 4) * 8 + 0x14;
    if (0x78 < uVar3) {
      uVar3 = 0x78;
    }
    if (((DAT_0010191c == 0) || (0x77 < uVar5)) && ((int)(uVar3 - 8) <= (int)uVar5)) {
      if ((uVar5 < 0x79) && (uVar5 <= uVar3 + 8)) {
        uVar4 = ce_rand();
        uw_ord2005_rem_20 = ((int)(uVar4)) % (3);
        cVar1 = uw_ord2005_rem_20 + '\x0f';
      }
      else {
        cVar1 = '\x0e';
      }
    }
    else {
      cVar1 = '\x12';
    }
    DAT_0010190c->attack_pitch = cVar1 << 3 | DAT_0010190c->attack_pitch & 7;
  }
}


// was FUN_0002efa0 -- an NPC's "arrived at destination tile" reaction: if a "use on arrival" flag
// is set in its stat template (byte 0x2e), uses the object it arrived on; if that object is a
// specific combinable-ingredient-shaped category (0x140) with a low sub-id...
void npc_arrival_interaction(void *npc_ptr)
{
  ushort *npc = (ushort *)npc_ptr;
  int uw_ord2005_rem_21 = 0; int uw_ord2005_rem_22 = 0;
  undefined4 uVar1;
  undefined1 extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  undefined1 uVar2;
  
  if ((*npc & 7) != 7) {
    if (*(char *)&DAT_00101404->door_skill != '\0') {
      DAT_002020a0 = (ushort)DAT_00101424;
      DAT_002020a4 = (ushort)DAT_00101428;
      use_object_on_target(DAT_0010190c,npc,0);
    }
    if (((*npc & 0x1f0) == 0x140) && ((*npc & 0xf) < 8)) {
      if (*(char *)&DAT_00101404->door_skill != '\0') {
        uVar1 = ce_rand();
        uw_ord2005_rem_21 = ((int)(uVar1)) % (2);
        if (uw_ord2005_rem_21 != 0) {
          check_object_combination(DAT_0010190c,npc,
                       (int)((uint) DAT_00101404->door_skill * -0x10000) >> 0x10);
          return;
        }
      }
      uVar1 = ce_rand();
      uw_ord2005_rem_22 = ((int)(uVar1)) % (4);
      if (uw_ord2005_rem_22 == 0) {
        uVar1 = ce_rand();
        uVar2 = 4;
        /* Was `ordint_divmod(...); apply_typed_damage_to_object(...,extraout_r1,...)` -- same
           fabricated-remainder bug fixed throughout this session (this port's ordint_divmod never
           populates extraout_r1). ordint_divmod(divisor,dividend).quot here divides the... */
        uw_ord2005_rem_21 = (int)uVar1 % (int)(uint)(DAT_00101404->attacks[0].damage);
        apply_typed_damage_to_object(npc,DAT_0010190c,DAT_00101424,DAT_00101428,uw_ord2005_rem_21,uVar2);
      }
    }
  }
}


// was FUN_00030874 -- an NPC's random-walk reposition step (confirmed via
// npc_combat_approach_tick's own comment describing its "far: random walk reposition" branch, which
// calls this): if not already at the given wander tile (param_1,param_2)...
/* Real arity is 3: the ARM prologue (0x30878) just spills r0-r3 (`push {r0-r3}`), and the lone caller
   (0x30358) leaves r3 as a stale `ands` result. Ghidra's param_4 was that spilled-but-unused r3. */
void npc_wander_reposition(uint saved_a, uint saved_b, uint saved_c)
{
  int uw_ord2005_rem_57 = 0; int uw_ord2005_rem_58 = 0;
  uint uVar1;
  char cVar2;
  undefined4 uVar3;
  int extraout_r1;
  int extraout_r1_00;
  byte bVar4;
  uint local_10;
  uint local_c;
  uint uStack_8;
  
  local_10 = saved_a;
  local_c = saved_b;
  uStack_8 = saved_c;
  if (((saved_a & 0xff) != (DAT_0010190c->npc_target_tile_x)) ||
      ((saved_b & 0xff) != DAT_0010190c->npc_target_tile_y)) {
    uVar3 = ce_rand();
    uw_ord2005_rem_57 = ((int)(uVar3)) % (8);
    if (uw_ord2005_rem_57 == 0) {
      cVar2 = detect_npc_wander_proximity(&local_10,&local_c);
      if (cVar2 != '\0') {
        if (cVar2 == '\x01') {
          DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xfe;
          bVar4 = DAT_0010190c->npc_ai_flags & 0xfd;
LAB_00030984:
          DAT_0010190c->npc_ai_flags = bVar4;
          npc_clear_special_goal();
          return;
        }
        if (cVar2 != '\x02') goto LAB_000309a0;
        uVar3 = ce_rand();
        uw_ord2005_rem_58 = ((int)(uVar3)) % (2);
        if (uw_ord2005_rem_58 == 0) {
          DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xfe;
          bVar4 = DAT_0010190c->npc_ai_flags | 2;
          goto LAB_00030984;
        }
      }
      npc_set_walk_target(local_10 & 0xff,local_c & 0xff,DAT_00101420);
    }
  }
LAB_000309a0:
  if (((((local_10 & 0xff) != (uint)DAT_00101918) || ((char)local_c != DAT_001013f8)) ||
      (uVar1 = ((int)DAT_0010140c - (int)DAT_00101420) >> 0x1f,
      3 < (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar1) - uVar1))) &&
     ((((saved_c = saved_c & 0xff, 1 < saved_c && (saved_c * saved_c < (uint)DAT_00101900)) ||
       ((saved_c * saved_c * 0x40 < DAT_00101728 ||
        ((saved_c < 2 &&
         (uVar1 = ((int)DAT_0010140c - (int)DAT_00101420) >> 0x1f,
         3 < (int)(((int)DAT_0010140c - (int)DAT_00101420 ^ uVar1) - uVar1))))))) &&
      /* Dropped third argument: at the real call (0x30a6c) r2 still holds
         DAT_00101420 from the `ldrb r2,[r5]` that fed the
         npc_set_walk_target call above -- pass it explicitly. */
      (npc_walk_toward_tile(local_10 & 0xff,local_c & 0xff,DAT_00101420), (DAT_0010190c->heading_flags & 0x40) != 0)))
     ) {
    npc_clear_special_goal();
    DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xfd;
  }
}


// was FUN_00031dbc -- called unconditionally at the tail of npc_idle_behavior_tick: if the NPC's
// own "aware" state flag (byte 0x13) is clear or the player is currently in a special mode (byte
// 0x5f bit 1), refreshes the delta-to-player (refresh_npc_target_delta) and...
void npc_react_to_nearby_player()

{
  int uw_ord2005_rem_82 = 0; int uw_ord2005_rem_83 = 0;
  ushort uVar1;
  char *iVar2;
  undefined4 uVar3;
  int extraout_r1;
  uint extraout_r1_00;
  uint uVar4;
  uint uVar5;
  
  if (((DAT_0010190c->motion_flags & 0x7f) == 0) || ((*(byte *)(DAT_00086df8 + 0x5f) & 2) != 0))
  {
    uVar5 = DAT_0010190c->goal_word & 0xf01f;
    DAT_0010190c->npc_gtarg = 1;
    refresh_npc_target_delta();
    if ((ushort)(DAT_00101444 * DAT_00101444 + DAT_00101448 * DAT_00101448) < 0x90) {
      uVar5 = compute_movement_heading((int)(char)DAT_00101444,(int)(char)DAT_00101448);
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
      uVar3 = ce_rand();
      uw_ord2005_rem_82 = ((int)(uVar3)) % (2);
      if (uw_ord2005_rem_82 != 0) {
        uVar1 = DAT_0010190c->goal_word;
        uw_ord2005_rem_83 = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
        uVar4 = uVar1 & 0xfff;
        DAT_0010190c->npc_animation_frame = uw_ord2005_rem_83 & 0xf;
      }
      DAT_0010190c->hdr.heading = uVar5 & 0x7;
      DAT_0010190c->npc_heading = 0;
    }
  }
  return;
}


// was FUN_00032180 -- checks the NPC's proximity to its current wander/goal tile against two
// stat-template-derived radii (byte 0x1e's two nibbles, each multiplied against a per-monster-class
// table entry): outputs the goal tile itself via param_1/param_2...
int detect_npc_wander_proximity(void *out_near_ptr, void *out_far_ptr)
{
  char *out_near = (char *)out_near_ptr;
  char *out_far = (char *)out_far_ptr;
  int uw_ord2005_rem_86 = 0;
  int iVar1;
  int iVar2;
  ushort uVar3;
  char cVar4;
  int iVar5;
  undefined4 uVar6;
  char extraout_r1;
  ushort *puVar7;
  /* Preserved separately from iVar1/iVar2 below, which get overwritten
     with the squared distance before compute_movement_heading's own
     call further down needs them -- see that dropped-argument fix. */
  int deltaX;
  int deltaY;

  *out_near = DAT_00101408;
  *out_far = DAT_00101410;
  iVar1 = ((int)DAT_00101408 - (int)DAT_00101918) * 0x1000000 >> 0x18;
  iVar2 = ((int)DAT_00101410 - (int)DAT_001013f8) * 0x1000000 >> 0x18;
  deltaX = iVar1;
  deltaY = iVar2;
  iVar2 = (iVar1 * iVar1 + iVar2 * iVar2) * 0x10000 >> 0x10;
  iVar1 = (int)((DAT_00101404->awareness_ranges & 0xf) *
                ((byte) g_monster_type_props[((byte)*DAT_00101400 & 0x3f)].detection_ranges & 0xf)) >> 4;
  iVar1 = iVar1 * iVar1 * 0x10000;
  if (iVar2 < iVar1 >> 0x12) {
LAB_000323ac:
    uVar6 = 0;
  }
  else {
    iVar5 = (int)((uint)(DAT_00101404->awareness_ranges >> 4) *
                  (uint)((byte) g_monster_type_props[((byte)*DAT_00101400 & 0x3f)].detection_ranges >> 4)) >> 4;
    puVar7 = DAT_0010190c;
    if (iVar2 <= iVar5 * iVar5 * 0x10000 >> 0x10) {
      /* Was a dropped register-forwarding argument -- was `compute_movement_heading();` with no
         args. deltaX/deltaY, preserved above from this function's own delta computation (before it
         got squashed into the squared-distance iVar2), are exactly what this call needs. */
      cVar4 = compute_movement_heading(deltaX,deltaY);
      puVar7 = DAT_0010190c;
      uVar3 = DAT_0010190c->hdr.position_word;
      uw_ord2005_rem_86 = ((int)(((int)cVar4 - ((int)(char)(uVar3 >> 7) & 7U)) + 8)) % (8);
      if ((((uw_ord2005_rem_86 == '\0') || (uw_ord2005_rem_86 == '\x01')) || (uw_ord2005_rem_86 == '\a')) &&
         (iVar5 = check_fine_line_of_sight(DAT_00101910,DAT_0010141c,
                               (ushort)(byte) g_object_type_props[(((uw_object_hdr_t *)puVar7)->object_id)].height +
                               (uVar3 & 0x7f),DAT_00101908,DAT_00101418,
                               (ushort)(byte) g_object_type_props[(*(ushort *)DAT_00101400 & 0x1ff)].height +
                               (((byte)DAT_00101400[2]) & 0x7f)), puVar7 = DAT_0010190c, iVar5 != 0))
      {
        DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 1;
        goto LAB_000323ac;
      }
    }
    if (iVar2 < (iVar1 >> 0x10) * 4) {
      uVar6 = 2;
    }
    else {
      uVar6 = 1;
      ((uw_mobile_object_t *)puVar7)->npc_ai_flags = ((uw_mobile_object_t *)puVar7)->npc_ai_flags & 0xfe;
    }
  }
  return uVar6;
}


// was FUN_0003298c -- computes a vertical aim/pitch offset toward the tracked target: derives it
// from the height difference between the NPC and target scaled by distance
// (integer_sqrt(DAT_00101728)), clamped to [-0xf,0xf]...
int compute_vertical_aim_offset(short has_target, int target)
{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  int iVar5;
  int iVar6;
  
  refresh_npc_target_delta();
  bVar1 = DAT_0010190c->hdr.position_word_low;
  bVar2 = *(byte *)(DAT_00101400 + 2);
  uVar3 = integer_sqrt(DAT_00101728);
  iVar6 = (int)(((bVar2 & 0x7f) - (bVar1 & 0x7f)) * 0x10000) >> 0x10;
  if (uVar3 == 0) {
    iVar5 = 0xf;
    if (iVar6 < 1) {
      iVar5 = -0xf;
    }
    iVar5 = iVar5 << 0x18;
  }
  else {
    sVar4 = ordint_divmod((int)(short)uVar3,iVar6 << 2).quot;
    iVar5 = (int)sVar4;
    if (0xf < iVar5) {
      iVar5 = 0xf;
    }
    if ((short)iVar5 < -0xf) {
      iVar5 = -0xf;
    }
    if ((target == 0) || (has_target == 0)) {
      iVar5 = iVar5 << 0x18;
    }
    else {
      iVar6 = ordint_divmod((int)has_target,(uint)uVar3 * 3).quot;
      iVar5 = (iVar6 + (short)iVar5) * 0x1000000;
    }
  }
  return iVar5 >> 0x18;
}


// was FUN_00032aa4 -- the per-tick NPC AI setup step: stashes the current NPC object into
// DAT_0010190c and computes the whole derived-state fan-out virtually every other function in this
// NPC AI cluster reads -- its own stat template pointer (DAT_00101404)...
void setup_npc_ai_tick_state(uw_mobile_object_t *npc)
{
  byte bVar1;
  uint uVar2;
  int iVar3;
  
  DAT_0010190c = npc;
  /* Was a dropped argument -- was `encode_object_slot_index();` with no args. npc (just stashed
     above as DAT_0010190c, the "current NPC" this whole per-tick setup is for) is the obvious
     intended argument. */
  DAT_00101738 = encode_object_slot_index(npc);
  iVar3 = (DAT_0010190c->hdr.object_id & 0x3f) * 0x30;
  DAT_00101404 = &g_monster_type_props[(iVar3) / 0x30];
  DAT_00101918 = DAT_0010190c->npc_xhome;
  uVar2 = DAT_0010190c->npc_yhome;
  DAT_001013f8 = (char)uVar2;
  DAT_0010140c = DAT_0010190c->hdr.zpos >> 3;
  DAT_00101910 = (short)(((uint)DAT_00101918 << 0x13) >> 0x10) +
                 (ushort)(DAT_0010190c->hdr.xpos);
  DAT_0010141c = (DAT_0010190c->hdr.ypos) + (short)((uVar2 << 0x13) >> 0x10);
  DAT_0010143c = DAT_0010190c->hdr.quality;
  DAT_0010173c = DAT_0010190c->hdr.owner;
  DAT_00101458 = DAT_0010190c->full_heading;
  bVar1 = (byte)(DAT_0010190c->hdr.position_word >> 2);
  DAT_001018fc = (bVar1 ^ DAT_0010190c->heading_flags) & 0x1f ^ bVar1;
  DAT_00101434 = DAT_0010190c->motion_flags & 0x7f;
  DAT_00101730 = g_object_type_props[(DAT_0010190c->hdr.object_id)].height;
  if ((g_monster_type_props[(iVar3) / 0x30].movement_flags & 0x80) == 0) {
    if ((g_monster_type_props[(iVar3) / 0x30].movement_flags & 0x40) == 0) {
      DAT_0010172c = &DAT_002048c0;
      DAT_00101438 = (char *)&DAT_00204980;
    }
    else {
      DAT_0010172c = (undefined2 *)&DAT_00204950;
      DAT_00101438 = (char *)&DAT_002049b0;
    }
  }
  else {
    DAT_0010172c = (undefined2 *)&DAT_002048f0;
    DAT_00101438 = (char *)&DAT_00204990;
  }
}


// was FUN_00033880 -- npc_ai_tick's `case 0xb`/default dispatch target, confirmed via this
// function's own already-documented internal comments: the shared per-tick tail for every "no
// special goal" NPC...
void npc_ai_default_tick()

{
  int uw_ord2005_rem_93 = 0; int uw_ord2005_rem_94 = 0; int uw_ord2005_rem_95 = 0; int uw_ord2005_rem_96 = 0;
  byte bVar1;
  ushort uVar2;
  bool bVar3;
  char cVar4;
  uint uVar5;
  undefined4 uVar6;
  int iVar7;
  char *npc_rec;
  ushort *puVar8;
  undefined1 extraout_r1;
  undefined1 uVar9;
  undefined1 extraout_r1_00;
  byte extraout_r1_01;
  undefined1 extraout_r1_02;
  char extraout_r1_03;
  uint extraout_r1_04;
  uint extraout_r1_05;
  uint extraout_r1_06;
  uint extraout_r1_07;
  uint extraout_r1_08;
  byte bVar10;
  uint uVar11;
  undefined4 unaff_r4;
  undefined4 unaff_r5;
  undefined4 unaff_r6;
  undefined4 unaff_r7;
  uint uVar12;
  undefined4 unaff_r8;
  undefined4 unaff_r9;
  undefined4 unaff_lr;
  
  bVar3 = false;
  DAT_00101920 = 0;
  DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xdf;
  DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xbf;
  uVar2 = DAT_0010190c->goal_word;
  if ((uVar2 & 0xf) != 0xb) {
    if (((DAT_0010190c->animation_flags & 0x3f) == 0x2c) && ((uVar2 & 0x1000) == 0x1000)) {
      bVar10 = DAT_00101404->category & 0xf;
      if (bVar10 == 1) {
        if ((uVar2 & 0xf000) == 0x1000) {
          uVar6 = 1;
        }
        else {
          if ((uVar2 & 0xf000) != 0x3000) goto LAB_000339fc;
          uVar6 = 2;
        }
      }
      else if (bVar10 == 2) {
        uVar6 = 0x17;
      }
      else if (bVar10 == 3) {
        uVar6 = 5;
      }
      else if (bVar10 == 4) {
        uVar6 = 0xe;
      }
      else {
        if (bVar10 != 5) goto LAB_000339fc;
        uVar6 = 0xd;
      }
      play_positional_sound_effect(uVar6,DAT_00101910,DAT_0010141c,0);
    }
LAB_000339fc:
    if ((DAT_00101404->movement_flags & 2) == 0) {
      if (((((((DAT_0010190c->npc_ai_flags & 0x40) == 0) && (DAT_0010194c != DAT_00101738)) &&
             (DAT_000853d0 == *(char *)&DAT_00101404->race_flags)) &&
            ((DAT_0010190c->movement_flags & 0x80) == 0)) ||
           ((DAT_0010190c->npc_ai_flags & 0x40) != 0)) &&
          ((*(uint *)(DAT_00086df8 + 0xce) < DAT_00101940 + 0x200U &&
            (uVar11 = (int)((uint)DAT_00101918 - (uint)DAT_0010192c) >> 0x1f,
             uVar5 = (int)((uint)DAT_001013f8 - (uint)DAT_00101930) >> 0x1f,
             (int)((((uint)DAT_001013f8 - (uint)DAT_00101930 ^ uVar5) - uVar5) +
                   (((uint)DAT_00101918 - (uint)DAT_0010192c ^ uVar11) - uVar11)) <
             (int)(DAT_00101404->awareness_ranges & 0xf))))) {
        DAT_0010190c->npc_attitude = 0x0;
        uVar11 = DAT_0010190c->status_word;
        DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 1;
        bVar10 = DAT_0010190c->npc_goal;
        if ((bVar10 != 9) && (bVar10 != 6)) {
          cVar4 = DAT_0010194c;
          if ((DAT_0010190c->npc_ai_flags & 0x40) == 0) {
            cVar4 = '\x01';
          }
          npc_set_goal(5,cVar4);
          npc_set_walk_target(DAT_0010192c,DAT_00101930,DAT_00101934);
        }
      }
      cVar4 = *(char *)&DAT_0010190c->damage_source;
      /* Added a NULL guard on get_object_record_by_slot_index's result: it legitimately returns
         NULL for an out-of-range slot index (its own established behavior/contract), and this code
         unconditionally dereferenced it. */
      if ((cVar4 != '\0') &&
         (((cVar4 == '\x01' && ((DAT_0010190c->npc_ai_flags & 0x40) == 0)) ||
           (((DAT_0010190c->npc_ai_flags & 0x40) != 0 ||
             (npc_rec = get_object_record_by_slot_index(cVar4), (npc_rec != 0) && (*(byte *)(npc_rec + 0x19) & 0x40) != 0)))))) {
        if ((uint) DAT_0010190c->damage_source != (DAT_0010190c->npc_gtarg)) {
          uVar11 = DAT_0010190c->goal_word & 0xf00f |
                   (uint) DAT_0010190c->damage_source << 4;
          DAT_0010190c->goal_word = (ushort)uVar11;
        }
        iVar7 = refresh_npc_target_delta();
        if (iVar7 != 0) {
          bVar3 = true;
          if (*(char *)&DAT_0010190c->damage_source == '\x01') {
            DAT_0010190c->npc_attitude = 0x0;
            uVar11 = DAT_0010190c->status_word;
            npc_set_walk_target(g_player_object->npc_xhome,
                                g_player_object->npc_yhome,
                                g_player_object->hdr.zpos >> 3);
            DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 1;
          }
          if ((DAT_00101900 < 3) ||
             (((DAT_00101404->spell_flags & 1) != 0 &&
               (iVar7 = tile_is_no_magic(DAT_00101918,DAT_001013f8), iVar7 == 0)))) {
            if ((DAT_0010190c->npc_ai_flags & 0x20) != 0) goto LAB_00033d18;
            if (((DAT_0010190c->npc_ai_flags & 0x10) == 0) &&
                (iVar7 = check_npc_morale_flee(DAT_00101404->max_hp,
                                               DAT_0010190c->npc_hp,
                                               DAT_00101404->morale_flags & 0xf,
                                               DAT_0010190c->recent_damage), iVar7 != 0)) {
              uVar9 = DAT_0010190c->damage_source;
              uVar6 = 6;
            }
            else {
              if ((DAT_0010190c->npc_ai_flags & 0x10) == 0) goto LAB_00033d18;
              DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 0x10;
              uVar9 = DAT_0010190c->damage_source;
              uVar6 = 9;
            }
          }
          else {
            DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 0x20;
LAB_00033d18:
            uVar9 = DAT_0010190c->damage_source;
            uVar6 = 5;
          }
          npc_set_goal(uVar6,uVar9);
          DAT_0010190c->damage_source = 0;
          DAT_0010190c->recent_damage = 0;
        }
      }
    }
  }
  /* Main per-tick goal dispatch -- see this function's header comment
     for the scaling-bug fix that applies here too (was reading byte
     0x16 instead of the real goal nibble at byte 0xb). */
  switch(DAT_0010190c->npc_goal) {
  case 0:
    goto LAB_00033e9c;
  case 1:
    puVar8 = (ushort *)tilemap_lookup(DAT_0010143c,DAT_0010173c);
    npc_walk_toward_tile(DAT_0010143c,DAT_0010173c,*puVar8 >> 4 & 0xf);
    break;
  case 2:
    npc_idle_behavior_tick();
    break;
  case 3:
    if ((bVar3) || (iVar7 = refresh_npc_target_delta(), iVar7 != 0)) {
      npc_combat_approach_tick();
    }
    else {
LAB_00033ef8:
      npc_clear_special_goal();
    }
    break;
  case 4:
    goto LAB_00033e9c;
  case 5:
    if ((!bVar3) && (iVar7 = refresh_npc_target_delta(), iVar7 == 0)) goto LAB_00033ef8;
    npc_combat_engage_close_tick();
    break;
  case 6:
    if ((!bVar3) && (iVar7 = refresh_npc_target_delta(), iVar7 == 0)) goto LAB_00033ef8;
    npc_combat_position_tick();
    break;
  case 7:
LAB_00033e9c:
    npc_notice_and_idle_tick();
    break;
  case 8:
    npc_wander_return_home_tick();
    break;
  case 9:
    if ((!bVar3) && (iVar7 = refresh_npc_target_delta(), iVar7 == 0)) goto LAB_00033ef8;
    npc_combat_engage_wide_tick();
    break;
  case 10:
    npc_combat_disengage_tick();
    break;
  case 0xb:
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
    uVar6 = ce_rand();
    npc_rec = (char *)DAT_0010190c;
    bVar10 = DAT_0010190c->motion_flags;
    uw_ord2005_rem_93 = ((int)(uVar6)) % (2);
    ((uw_mobile_object_t *)npc_rec)->motion_flags = (uw_ord2005_rem_93 ^ bVar10) & 0x7f ^ bVar10;
    uVar6 = ce_rand();
    uw_ord2005_rem_94 = ((int)(uVar6)) % (0x100);
    DAT_0010190c->full_heading = uw_ord2005_rem_94;
    uVar6 = ce_rand();
    uw_ord2005_rem_95 = ((int)(uVar6)) % (3);
    DAT_0010190c->attack_pitch =
      DAT_0010190c->attack_pitch & 7 ^ (uw_ord2005_rem_95 + '\x0f') * '\b';
    npc_rec = (char *)DAT_0010190c;
    uVar2 = DAT_0010190c->goal_word;
    uw_ord2005_rem_96 = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
    uVar11 = uVar2 & 0xfff;
    DAT_0010190c->npc_animation_frame = uw_ord2005_rem_96 & 0xf;
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags | 0x40;
    break;
  case 0xc:
    npc_wander_return_home_exact_tick();
    break;
  default:
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch | 7;
  }
  npc_rec = (char *)DAT_0010190c;
  /* HACK: same ushort-vs-byte pointer-arithmetic scaling bug as process_visible_tile_cell's sibling
     npc_notice_and_idle_tick (fixed earlier this session) -- DAT_0010190c is `ushort *`, so bare
     `DAT_0010190c + 2` scales to byte offset 4... */
  uVar2 = DAT_0010190c->hdr.position_word;
  bVar10 = DAT_0010190c->full_heading;
  uVar11 = uVar2 >> 2 & 0xff;
  uVar11 = (uVar11 ^ DAT_0010190c->heading_flags) & 0x1f ^ uVar11;
  uVar12 = (uint)DAT_001018fc;
  /* Was `ordint_divmod(0x100,(uVar11-uVar12)+0x100,*(undefined1*)(DAT_0010190c+2),
     ordint_divmod_exref,unaff_r4,unaff_r5,unaff_r6,unaff_r7,unaff_r8,unaff_r9, unaff_lr);` -- badly
     garbled. */
  uVar5 = ((uVar11 - uVar12) + 0x100) & 0xff;
  if ((0x1f < uVar5) && (uVar5 < 0xe1)) {
    if (uVar5 < 0x80) {
      uVar11 = (uVar12 + 0x20) & 0xff;
    }
    else {
      uVar11 = (uVar12 + 0xe0) & 0xff;
    }
    uVar11 = uVar11 & 0xff;
  }
  uVar5 = uVar2 & 0xfc7f | (uVar11 & 0xffe0) << 2;
  ((uw_object_hdr_t *)npc_rec)->position_word_low = (byte)(char)uVar5;
  DAT_0010190c->hdr.position_word_high = (byte)(char)(uVar5 >> 8);
  DAT_0010190c->heading_flags =
    (DAT_0010190c->heading_flags ^ (byte)uVar11) & 0x1f ^ DAT_0010190c->heading_flags;
  npc_rec = (char *)DAT_0010190c;
  /* Was `if (DAT_00101430 == 0)` -- an inverted condition, confirmed via real disassembly (`cmp
     r0,#0x0; beq 0x326a4`, where r0 is DAT_00101430 and 0x326a4 is the simple "just copy
     DAT_00101458" branch this decompile currently has as the ELSE)... */
  if (DAT_00101430 != 0) {
    if (DAT_00101434 < 2) {
      return;
    }
    bVar1 = DAT_0010190c->motion_flags;
    if ((bVar1 & 0x7f) < 2) {
      return;
    }
    uVar5 = (uint)DAT_00101458;
    uVar11 = ((bVar10 - uVar5) + 0x100) & 0xff;
    if ((uVar11 < 0x20) || (0xe0 < uVar11)) {
      ((uw_mobile_object_t *)npc_rec)->full_heading = bVar10;
      return;
    }
    if (uVar11 < 0x40) {
      uVar9 = (uVar5 + 0x20) & 0xff;
    }
    else {
      if (uVar11 < 0xc1) {
        ((uw_mobile_object_t *)npc_rec)->motion_flags = bVar1 & 0x80;
        goto LAB_00032690;
      }
      uVar9 = (uVar5 + 0xe0) & 0xff;
    }
    ((uw_mobile_object_t *)npc_rec)->full_heading = uVar9;
  }
  else {
LAB_00032690:
    DAT_0010190c->full_heading = DAT_00101458;
  }
  return;
}


// was FUN_00034044 -- refreshes the whole "delta to tracked target" state every function in this
// NPC AI cluster reads: looks up the target object from the NPC's own goal-target slot (byte 0xb's
// high nibble), and if it's valid and alive...
int refresh_npc_target_delta()

{
  undefined4 uVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  
  DAT_00101400 = get_object_record_by_slot_index(DAT_0010190c->npc_gtarg);
  if ((DAT_00101400 == 0) || (*(char *)(DAT_00101400 + 8) == '\0')) {
    uVar1 = 0;
  }
  else {
    DAT_00101408 = *(byte *)(DAT_00101400 + 0x17) >> 2;
    uVar4 = *(ushort *)(DAT_00101400 + 0x16) >> 4 & 0x3f;
    DAT_00101410 = (undefined1)uVar4;
    DAT_00101420 = *(byte *)(DAT_00101400 + 2) >> 3 & 0xf;
    iVar3 = (uint)DAT_00101408 * 8 + (uint)(*(byte *)(DAT_00101400 + 3) >> 5);
    DAT_00101908 = (undefined2)iVar3;
    iVar2 = (*(byte *)(DAT_00101400 + 3) >> 2 & 7) + uVar4 * 8;
    DAT_00101418 = (undefined2)iVar2;
    DAT_00101444 = (short)((uint)(iVar3 * 0x10000) >> 0x10) - DAT_00101910;
    DAT_00101448 = (short)((uint)(iVar2 * 0x10000) >> 0x10) - DAT_0010141c;
    iVar5 = (uint)DAT_00101408 - (uint)DAT_00101918;
    DAT_00101900 = (undefined2)
                   ((iVar5 * iVar5 + (uVar4 - DAT_001013f8) * (uVar4 - DAT_001013f8)) * 0x10000 >>
                   0x10);
    DAT_00101728 = (iVar3 - (uint)DAT_00101910) * (iVar3 - (uint)DAT_00101910) +
                   (iVar2 - (uint)DAT_0010141c) * (iVar2 - (uint)DAT_0010141c);
    uVar1 = 1;
  }
  return uVar1;
}


// was FUN_00034270 -- an NPC morale/flee-shaped check: param_1 is a stat-template byte (byte 4),
// param_2 the NPC's own current HP (byte 8); if param_2 falls outside a band scaled off param_1,
// returns 0 outright.
int check_npc_morale_flee(uint morale_stat, uint current_hp, uint hp_margin, uint flee_threshold)
{
  int uw_ord2005_rem_97 = 0;
  undefined4 uVar1;
  int iVar2;
  int extraout_r1;
  
  morale_stat = morale_stat & 0xff;
  current_hp = current_hp & 0xff;
  if (((uint)((int)(morale_stat * 3) >> 2) < current_hp) || (current_hp < morale_stat >> 3)) {
LAB_000342b0:
    uVar1 = 0;
  }
  else {
    if ((flee_threshold & 0xff) <= morale_stat >> 1) {
      if (morale_stat == 0) goto LAB_000342b0;
      uVar1 = ce_rand();
      uw_ord2005_rem_97 = ((int)(uVar1)) % (4);
      iVar2 = ordint_divmod(morale_stat,current_hp << 4).quot;
      if ((int)(0xf - (hp_margin & 0xff)) < (int)(uw_ord2005_rem_97 + iVar2 & 0xffffU)) {
        return 0;
      }
    }
    uVar1 = 1;
  }
  return uVar1;
}


// was FUN_0003431c -- computes the BFS search-radius parameter passed to
// creature_find_path_to_tile: gated on the NPC being alive/awake and having a nonzero stat-template
// byte 4 (with a quest-mode exception)...
int compute_pathfind_search_radius()

{
  char *iVar1;
  uint uVar2;
  
  iVar1 = DAT_00101404;
  if ((((DAT_0010190c->npc_attitude == 0) && (*(char *)&DAT_00101404->max_hp != '\0')) &&
       (DAT_0010190c->hdr.doordir == 0)) &&
      ((DAT_00201b68 != 6 || (*(char *)&DAT_0010190c->npc_whoami != '\x16')))) {
    uVar2 = ordint_divmod(*(char *)&DAT_00101404->max_hp,
                          (uint) DAT_0010190c->npc_hp << 2).quot;
    return (uVar2 & 0xff) + (*(byte *)(iVar1 + 0x1c) >> 2 & 3);
  }
  return 0;
}


// was FUN_000345b8 -- transitions an NPC object into the death state (goal 0xc, the state
// npc_ai_default_tick's own goal-0xc branch reads to drop loot and free the slot): allowed
// unconditionally if byte 0x1a is 0 (a "not immortal/scripted" marker)...
/* ARM 0x345bc..0x3462c uses the full object pointer with byte offsets. */
int initiate_npc_death(char *npc)
{
  int iVar1;
  undefined4 uVar2;
  uint uVar3;

  if (((char)((uw_mobile_object_t *)npc)->npc_whoami == '\0') || (iVar1 = resolve_unique_npc_special_behavior(npc,0), iVar1 != 0)) {
    uVar2 = 1;
    ((uw_mobile_object_t *)npc)->animation_flags = ((uw_mobile_object_t *)npc)->animation_flags & 0xcc | 0xc;
    ((uw_mobile_object_t *)npc)->npc_animation_frame = 0x0;
    uVar3 = ((uw_mobile_object_t *)npc)->goal_word;
    ((uw_mobile_object_t *)npc)->attack_pitch = ((uw_mobile_object_t *)npc)->attack_pitch & 0xfc | 4;
    ((uw_mobile_object_t *)npc)->npc_hp = 0;
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}



// was FUN_00034634 -- wraps initiate_npc_death: bails out early (returns 0) if the NPC is already
// in goal 0xc (dead) or initiate_npc_death() refuses the transition; otherwise plays a positional
// death sound (only for goal-category 1 NPCs) and returns 1.
/* ARM 0x34638..0x34648 uses the full object pointer with byte offsets. */
int handle_monster_death(void *npc_ptr)
{
  char *npc = (char *)npc_ptr;
  int iVar1;
  undefined4 uVar2;

  if (((((uw_mobile_object_t *)npc)->animation_flags & 0x3f) == 0xc) || (iVar1 = initiate_npc_death(npc), iVar1 == 0)) {
    uVar2 = 0;
  }
  else {
    if ((DAT_00101404->effects_flags & 7) == 1) {
      play_positional_sound_effect(6,DAT_00101910,DAT_0010141c,0);
    }
    uVar2 = 1;
  }
  return uVar2;
}


// was FUN_00034ac4 -- calls npc_set_goal(param_2,param_3) as if param_1 were the "current NPC"
// (DAT_0010190c), temporarily swapping that context pointer in and restoring the caller's own value
// afterward.
void npc_set_goal_for_object(uw_mobile_object_t *npc_ptr, int goal,
                             int goal_target)
{
  uw_mobile_object_t *npc = npc_ptr;
  uw_mobile_object_t *saved_npc;

  saved_npc = DAT_0010190c;
  DAT_0010190c = npc;
  npc_set_goal(goal,goal_target);
  DAT_0010190c = saved_npc;
}



// was FUN_00034af0 -- for every NPC in the active mobile list (DAT_002046c0..DAT_002046c8),
// randomly re-rolls two flag bits on its mobile-object record's byte 0x19: bit 7 is set/cleared on
// a 50/50 coin flip, and bit 6 is cleared unless a separate 1-in-4 roll hits.
void randomize_active_npc_flags()

{
  int uw_ord2005_rem_98 = 0; int uw_ord2005_rem_99 = 0;
  undefined4 uVar1;
  uint extraout_r1;
  int extraout_r1_00;
  byte *pbVar2;
  char *iVar3;
  
  pbVar2 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      iVar3 = (uint)*pbVar2 * 0x1b + DAT_002046b8;
      uVar1 = ce_rand();
      uw_ord2005_rem_98 = ((int)(uVar1)) % (2);
      *(byte *)(iVar3 + 0x19) = (byte)((uw_ord2005_rem_98 & 1) << 7) | *(byte *)(iVar3 + 0x19) & 0x7f;
      uVar1 = ce_rand();
      uw_ord2005_rem_99 = ((int)(uVar1)) % (4);
      if (uw_ord2005_rem_99 != 1) {
        *(byte *)(iVar3 + 0x19) = *(byte *)(iVar3 + 0x19) & 0xbf;
      }
      pbVar2 = pbVar2 + 1;
    } while (pbVar2 < DAT_002046c8);
  }
  return;
}


// was FUN_00034ba8 -- looks up a within-tile entry-point offset (written to *param_2/*param_3, x/y
// in 1/8-tile units) based on the destination tile's type nibble (param_1, from tilemap_lookup's
// low 4 type bits).
int resolve_tile_entry_offset(char tile_type, byte *out_x, byte *out_y)
{
  undefined1 uVar1;

  if (tile_type == '\0') {
    return 0;
  }
  if (tile_type == '\x02') {
LAB_00034bf0:
    *out_x = 6;
    *out_y = 1;
  }
  else {
    if (tile_type == '\x03') {
      uVar1 = 1;
    }
    else if (tile_type == '\x04') {
      uVar1 = 6;
    }
    else {
      if (tile_type == '\x05') goto LAB_00034bf0;
      uVar1 = 4;
    }
    *out_x = uVar1;
    *out_y = uVar1;
  }
  return 1;
}


// was FUN_00034c10 -- per-tick movement/animation step for an active NPC (class 0x40), called by
// advance_mobile_objects.

void npc_movement_tick(ushort *npc_object, char *scratch)
{
  int uw_ord2005_rem_100 = 0;
  byte bVar1;
  undefined4 uVar2;
  char *pcVar3;
  ushort *puVar4;
  int iVar5;
  uint extraout_r1;
  int iVar6;
  char cVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  byte local_2c;
  byte local_2b [3];
  char *local_28;  /* was `int` -- truncated tilemap_lookup's real `void *` return */

  iVar6 = ((byte)*npc_object & 0x3f) * 0x30;
  uVar9 = (uint)(npc_object[0xb] >> 10);
  uVar11 = npc_object[0xb] >> 4 & 0x3f;
  local_28 = (char *)tilemap_lookup(uVar9,uVar11);
  if ((npc_object[7] & 1) != 0) {
    unlink_and_free_object(local_28 + 2,npc_object);
    return;
  }
  *(byte *)((char *)npc_object + 0x19) = *(byte *)((char *)npc_object + 0x19) & 0xc;
  uVar2 = ce_rand();
  uw_ord2005_rem_100 = ((int)(uVar2)) % (8);
  uVar8 = npc_object[1] & 0xfc7f | (uw_ord2005_rem_100 & 7) << 7;
  *(byte *)(npc_object + 1) = (byte)uVar8;
  *(byte *)((char *)npc_object + 3) = (byte)(uVar8 >> 8);
  if (((uint)(byte)npc_object[4] < (uint)(byte) g_monster_type_props[(iVar6) / 0x30].max_hp) && ((npc_object[7] & 2) == 0)) {
    *(byte *)(npc_object + 4) =
         (byte)((int)((uint)(byte)npc_object[4] + (uint)(byte) g_monster_type_props[(iVar6) / 0x30].max_hp) >> 1);
  }
  if ((npc_object[5] & 0x80) == 0) {
    bVar1 = (byte)npc_object[7] >> 6;
    if (bVar1 == 0) {
      pcVar3 = (char *)(scratch + (uint)(byte) g_monster_type_props[(iVar6) / 0x30].race_flags);
      cVar7 = *pcVar3 + -1;
    }
    else {
      if (bVar1 != 3) goto LAB_00034db4;
      pcVar3 = (char *)(scratch + (uint)(byte) g_monster_type_props[(iVar6) / 0x30].race_flags);
      cVar7 = *pcVar3 + '\x01';
    }
    *pcVar3 = cVar7;
  }
LAB_00034db4:
  uVar10 = (byte)npc_object[2] & 0x3f;
  uVar8 = npc_object[3] & 0x3f;
  puVar4 = (ushort *)tilemap_lookup(uVar10,uVar8);
  if (((uVar9 != uVar10) || (uVar11 != uVar8)) &&
     (iVar5 = resolve_tile_entry_offset(*puVar4 & 0xf,&local_2c,local_2b), iVar5 != 0)) {
    if ((g_monster_type_props[(iVar6) / 0x30].movement_flags & 0x80) == 0) {
      uVar9 = (uint)(byte)((byte)*puVar4 >> 4) << 3;
    }
    else {
      uVar9 = (int)(((byte)((byte)*puVar4 >> 4) + 0x10) * 8) >> 1;
    }
    uVar2 = encode_object_slot_index(npc_object);
    iVar6 = check_object_placement_clearance(*npc_object & 0x1ff,uVar2,
                         (int)(((uint)local_2c + uVar10 * 8) * 0x10000) >> 0x10,
                         (int)(((uint)local_2b[0] + uVar8 * 8) * 0x10000) >> 0x10,(short)uVar9,
                         (byte) g_monster_type_props[(iVar6) / 0x30].movement_flags >> 7,
                         8);
    if (iVar6 != 0) {
      object_list_unlink(local_28 + 2,npc_object);
      object_list_insert_head(puVar4 + 1,npc_object);
      uVar8 = uVar8 | uVar10 << 6;
      *(byte *)(npc_object + 0xb) = (byte)npc_object[0xb] & 0xf | (byte)(uVar8 << 4);
      *(byte *)((char *)npc_object + 0x17) = (byte)((uVar8 << 0x14) >> 0x18);
      uVar9 = uVar9 | (local_2b[0] & 7 | (local_2c & 7) << 3) << 10 |
              (ushort)npc_object[1] & 0x380;
      *(byte *)(npc_object + 1) = (byte)uVar9;
      *(byte *)((char *)npc_object + 3) = (byte)(uVar9 >> 8);
    }
  }
}



// was FUN_00034fa4 -- per-tick settle step for a non-NPC active mobile object (thrown/dropped
// items, projectiles, etc).
int settle_misplaced_mobile_object(char *object)
{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  byte *pbVar4;
  char *iVar5;
  int iVar6;
  uint uVar7;
  byte *pbVar8;

  bVar3 = *(byte *)(object + 0x17) >> 2;
  DAT_0010144c = (ushort)bVar3;
  bVar1 = *(byte *)(object + 3);
  uVar7 = (*(ushort *)(object + 0x16) & 0x3f0) >> 4;
  DAT_00101454 = (undefined2)uVar7;
  bVar2 = *(byte *)(object + 3);
  pbVar4 = (byte *)tilemap_lookup(DAT_0010144c,DAT_00101454);
  pbVar8 = pbVar4 + 2;
  iVar5 = (char *)discard_misplaced_object(pbVar8,(ushort *)object,0);
  if ((iVar5 != 0) && (iVar5 = (char *)settle_mobile_to_immobile((ushort *)object), iVar5 != 0)) {
    object_list_unlink(pbVar8,iVar5);
    DAT_00202c84 = 1;
    iVar6 = find_object_placement((ushort *)iVar5,(uint)(bVar1 >> 5) + (uint)bVar3 * 8,
                         ((bVar2 & 0x1c) >> 2) + uVar7 * 8,(uint)(*pbVar4 >> 4) << 3,6);
    if (iVar6 == 0) {
      uVar7 = *(ushort *)(iVar5 + 2) & 0xff80;
      *(byte *)(iVar5 + 2) = *pbVar4 >> 1 & 0x78 | (byte)uVar7;
      *(char *)(iVar5 + 3) = (char)(uVar7 >> 8);
      object_list_insert_head(pbVar8,iVar5);
    }
  }
  return 1;
}



// was FUN_0003513c -- second per-tick pass over the active mobile list (after tick_mobile_objects'
// own goal-AI pass): drives each NPC's movement/animation via npc_movement_tick, or settles each
// non-NPC mobile object via settle_misplaced_mobile_object...
void advance_mobile_objects()

{
  ushort *puVar1;
  byte *pbVar2;
  char cVar3;
  int iVar5;
  uint uVar6;
  byte *pbVar7;
  byte *pbVar8;
  char acStack_58 [64];
  int iVar4;

  ce_memset(acStack_58,0,0x40);
  pbVar7 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      puVar1 = (ushort *)((uint)*pbVar7 * 0x1b + DAT_002046b8);
      if ((*puVar1 & 0x1c0) == 0x40) {
        npc_movement_tick(puVar1,acStack_58);
      }
      else {
        iVar5 = settle_misplaced_mobile_object((char *)puVar1);
        if (iVar5 != 0) {
          pbVar7 = pbVar7 + -1;
        }
      }
      pbVar7 = pbVar7 + 1;
    } while (pbVar7 < DAT_002046c8);
  }
  pbVar7 = DAT_002046c8;
  pbVar8 = DAT_002046c0;
  if (DAT_002046c0 < DAT_002046c8) {
    do {
      pbVar2 = (byte *)((uint)*pbVar8 * 0x1b + DAT_002046b8);
      if (((pbVar2[10] & 0x80) == 0) &&
         (iVar5 = (int)acStack_58[(byte) g_monster_type_props[(*pbVar2 & 0x3f)].race_flags], iVar5 != 0)) {
        iVar4 = (uint)(*(ushort *)(pbVar2 + 0xd) >> 0xe) + iVar5;
        cVar3 = (char)iVar4;
        iVar4 = iVar4 * 0x1000000 >> 0x18;
        if (iVar5 < 0) {
          if (iVar4 < 0) {
            cVar3 = '\0';
          }
        }
        else if (3 < iVar4) {
          cVar3 = '\x03';
        }
        uVar6 = *(ushort *)(pbVar2 + 0xd) & 0x3fff;
        pbVar2[0xd] = (byte)uVar6;
        pbVar2[0xe] = (byte)(uVar6 >> 8) | (byte)((((int)cVar3 & 3U) << 0xe) >> 8);
        pbVar7 = DAT_002046c8;
      }
      pbVar8 = pbVar8 + 1;
    } while (pbVar8 < pbVar7);
  }
  return;
}


// was FUN_00035394 -- scan_area_ahead_of_object callback used while the player rests: for an
// eligible non-player NPC (param_3, not currently fleeing/special per byte 7's top bits) within its
// stat-template's perception range of the player...
int spawn_rest_interrupt_monster_callback(int scan_x, int scan_y, ushort *object)
{
  int uw_ord2005_rem_101 = 0;
  byte bVar1;
  byte bVar2;
  byte bVar3;
  ushort uVar4;
  short sVar5;
  undefined4 uVar6;
  ushort *puVar7;
  ushort *puVar8;
  uint uVar9;
  int extraout_r1;
  uint extraout_r1_00;
  uint uVar10;
  int iVar11;
  uint uVar12;
  int iVar13;
  bool bVar14;
  void *tile_ptr;
  undefined2 in_stack_ffffffcc;
  undefined1 uVar16;
  undefined4 in_stack_ffffffd0;
  byte local_28;
  byte local_27 [3];
  
  uVar16 = (undefined1)((ushort)in_stack_ffffffcc >> 8);
  sVar5 = encode_object_slot_index(object);
  if ((sVar5 != 1) && ((object[7] & 0xc0) == 0)) {
    uVar6 = ce_rand();
    uw_ord2005_rem_101 = ((int)(uVar6)) % (2);
    if (uw_ord2005_rem_101 != 0) {
      setup_npc_ai_tick_state(object);
      uVar4 = g_player_object->tile_word;
      iVar13 = (uint)DAT_001013f8 - ((uVar4 & 0x3f0) >> 4);
      iVar11 = (uint)DAT_00101918 - (uint)(uVar4 >> 10);
      uVar9 = (uint)(DAT_00101404->morale_flags >> 4);
      if (((((iVar11 * 0x10000 >> 0x10) * (iVar11 * 0x10000 >> 0x10) +
            (iVar13 * 0x10000 >> 0x10) * (iVar13 * 0x10000 >> 0x10)) * 0x10000 >> 0x10 <=
            (int)(uVar9 * uVar9 * 3)) &&
          (iVar11 = creature_find_path_to_tile((uint)DAT_00101918,(uint)DAT_001013f8,
                                 DAT_0010190c->hdr.zpos >> 3,(uint)(uVar4 >> 10),
                                 CONCAT11(uVar16,(char)(uVar4 >> 4)) & 0xff3f,
                                 CONCAT31((int3)((uint)in_stack_ffffffd0 >> 8),
                                          g_player_object->hdr.position_word_low >> 3) & 0xffffff0f,0),
           iVar11 != 0)) && (1 < DAT_0010142c)) {
        uVar9 = 0;
        if (DAT_0010142c != 0) {
          uVar12 = 0;
          do {
            iVar11 = uVar12 * 7;
            tile_ptr = tilemap_lookup((&DAT_00101740)[iVar11],(&DAT_00101741)[iVar11]);
            for (puVar7 = (ushort *)((char *)tile_ptr + 2); (*puVar7 & 0xffc0) != 0; puVar7 = puVar7 + 2)
            {
              puVar7 = (ushort *)resolve_object_link(puVar7);
              if ((((*puVar7 & 0x1c0) == 0x180) && ((*puVar7 & 0x30) == 0x20)) &&
                 ((puVar7[3] & 0xffc0) != 0)) {
                puVar8 = (ushort *)resolve_object_link(puVar7 + 3);
                uVar9 = (uint)((uw_object_hdr_t *)puVar8)->type_flags;
                if ((uVar9 & 0x1c0) == 0x180) {
                  uVar10 = uVar9 & 0x30;
                  bVar14 = (((uw_object_hdr_t *)puVar8)->object_id & 0x30) == 0;
                  if (bVar14) {
                    uVar10 = uVar9 & 0xf;
                  }
                  if (bVar14 && uVar10 == 9) {
                    dispatch_trap_type_effect(puVar8,(&DAT_00101740)[iVar11],(&DAT_00101741)[iVar11]);
                    uVar9 = extraout_r1_00;
                  }
                }
              }
            }
            uVar12 = uVar12 + 1 & 0xff;
            uVar9 = (uint)DAT_0010142c;
          } while (uVar12 < uVar9);
        }
        bVar1 = (&DAT_00101740)[uVar9 * 7 - 13];
        bVar2 = (&DAT_00101740)[uVar9 * 7 - 14];
        puVar7 = (ushort *)tilemap_lookup((uint)bVar2,(uint)bVar1);
        iVar11 = resolve_tile_entry_offset(*puVar7 & 0xf,&local_28,local_27);
        if (iVar11 != 0) {
          bVar3 = (&DAT_0023cf0a)[((int)(short)(ushort)bVar1 + (short)(ushort)bVar2 * 0x40) * 5];
          uVar6 = encode_object_slot_index(object);
          iVar11 = check_object_placement_clearance(*object & 0x1ff,uVar6,
                                (int)(((uint)local_28 + (short)(ushort)bVar2 * 8) * 0x10000) >> 0x10
                                ,(int)(((uint)local_27[0] + (short)(ushort)bVar1 * 8) * 0x10000) >>
                                 0x10,(ushort)((uint)bVar3 << 3) & 0xff,
                                DAT_00101404->movement_flags >> 7,8);
          if (iVar11 != 0) {
            /* was folded into `int iVar11` (reused above for unrelated
               int arithmetic) -- truncated tilemap_lookup's real
               `void *` return */
            char *_tile11 = (char *)tilemap_lookup(DAT_00101918,DAT_001013f8);
            object_list_unlink(_tile11 + 2,object);
            object_list_insert_head(puVar7 + 1,object);
            uVar9 = bVar1 & 0x3f | (uint)bVar2 << 6;
            *(byte *)(object + 0xb) = (byte)object[0xb] & 0xf | (byte)(uVar9 << 4);
            *(char *)((char *)object + 0x17) = (char)(uVar9 >> 4);
            uVar9 = (uint)bVar3 << 3 & 0x7f | (local_27[0] & 7 | (local_28 & 7) << 3) << 10 |
                    (ushort)object[1] & 0x380;
            *(char *)(object + 1) = (char)uVar9;
            *(char *)((char *)object + 3) = (char)(uVar9 >> 8);
            *(byte *)((char *)object + 0x19) = *(byte *)((char *)object + 0x19) | 1;
            npc_set_walk_target(g_player_object->npc_xhome,
                                g_player_object->npc_yhome,
                                g_player_object->hdr.zpos >> 3);
            DAT_00101950 = 1;
            return 1;
          }
        }
      }
    }
  }
  return 0;
}



// was FUN_00035894 -- scans nearby NPCs via spawn_rest_interrupt_monster_callback and reports
// whether one teleported in to interrupt the player's rest. handle_rest_action checks this once
// resting begins to decide whether to run the "peaceful rest" or "interrupted rest" branch.
int check_rest_interrupted_by_monster()

{
  DAT_00101950 = 0;
  scan_area_ahead_of_object(g_player_object,1,spawn_rest_interrupt_monster_callback,0,0,8);
  return DAT_00101950;
}


// was FUN_000358e8 -- loads the "last attacker" record (see the
// globals' own comment in uw.h) from its serialized slot in the
// save-game block (DAT_00086df8+0xba..0xc1).
void load_last_attacker_record()

{
  DAT_0010194c = *(undefined1 *)(DAT_00086df8 + 0xba);
  DAT_000853d0 = *(undefined1 *)(DAT_00086df8 + 0xbb);
  DAT_00101940 = *(undefined4 *)(DAT_00086df8 + 0xbc);
  DAT_0010192c = *(undefined1 *)(DAT_00086df8 + 0xc0);
  DAT_00101930 = *(undefined1 *)(DAT_00086df8 + 0xc1);
  return;
}



// was FUN_00035960 -- the inverse of load_last_attacker_record:
// writes the current "last attacker" record back into its serialized
// slot in the save-game block.
void save_last_attacker_record()

{
  undefined4 uVar1;

  *(undefined1 *)(DAT_00086df8 + 0xba) = DAT_0010194c;
  *(undefined1 *)(DAT_00086df8 + 0xbb) = DAT_000853d0;
  uVar1 = DAT_00101940;
  *(char *)(DAT_00086df8 + 0xbc) = (char)DAT_00101940;
  *(char *)(DAT_00086df8 + 0xbd) = (char)((uint)uVar1 >> 8);
  *(char *)(DAT_00086df8 + 0xbe) = (char)((uint)uVar1 >> 0x10);
  *(char *)(DAT_00086df8 + 0xbf) = (char)((uint)uVar1 >> 0x18);
  *(undefined1 *)(DAT_00086df8 + 0xc0) = DAT_0010192c;
  *(undefined1 *)(DAT_00086df8 + 0xc1) = DAT_00101930;
  return;
}



// was FUN_000359f4 -- clears the "last attacker" slot/class fields
// (0 and 0xff, both sentinel "none" values matched against real slot
// indices/class ids elsewhere) and resets the NPC pathing cache.
void clear_last_attacker_record()

{
  DAT_0010194c = 0;
  DAT_000853d0 = 0xff;
  reset_npc_path_cache();
  return;
}


// was FUN_00035a18 -- scan_area_for_matching_objects callback used by emit_noise_alert: for a
// candidate NPC (param_3) whose class matches the current noise type (DAT_0010195c) and is either
// awake or the noise is loud enough to wake it...
int alert_npc_to_noise_callback(int scan_x, int scan_y, ushort *npc)
{
  ushort uVar1;
  ushort uVar2;
  int iVar3;
  /* ARM passes get_message_string's returned pointer straight to strcat;
     a 32-bit undefined4 truncated it on the host when an NPC heard noise. */
  char *uVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  undefined1 auStack_74 [80];
  
  iVar10 = (((uw_object_hdr_t *)npc)->object_id & 0x3f) * 0x30;
  if ((((g_monster_type_props[(iVar10) / 0x30].race_flags == (DAT_0010195c & 0x1f)) &&
        (((((uw_mobile_object_t *)npc)->movement_flags & 0x80) == 0 || ((DAT_0010195c & 0x20) != 0)))) &&
       ((DAT_0010195c != 0x20 || ((((uw_mobile_object_t *)npc)->movement_flags & 0x80) != 0)))) &&
      ((DAT_0010195c != 0xd || (*(byte *)(DAT_00086df8 + 0x69) < 3)))) {
    uVar1 = ((uw_object_hdr_t *)npc)->position_word;
    iVar3 = (uint)(uVar1 >> 0xd) + scan_x * 8;
    iVar5 = ((uVar1 & 0x1c00) >> 10) + scan_y * 8;
    uVar2 = DAT_00101958[1];
    iVar7 = (uint)(uVar2 >> 0xd) + DAT_002020a0 * 8;
    iVar9 = ((uVar2 & 0x1c00) >> 10) + DAT_002020a4 * 8;
    iVar11 = (iVar3 * 0x10000 >> 0x10) - (iVar7 * 0x10000 >> 0x10);
    if (iVar11 < 0) {
      iVar11 = iVar11 + 7;
    }
    iVar11 = (int)(short)(iVar11 >> 3);
    iVar12 = (iVar5 * 0x10000 >> 0x10) - (iVar9 * 0x10000 >> 0x10);
    if (iVar12 < 0) {
      iVar12 = iVar12 + 7;
    }
    iVar12 = (int)(short)(iVar12 >> 3);
    if ((iVar11 * iVar11 + iVar12 * iVar12 <=
         (int)((uint)((byte) g_monster_type_props[(iVar10) / 0x30].awareness_ranges >> 4) *
               (uint)((byte) g_monster_type_props[(iVar10) / 0x30].awareness_ranges >> 4))) &&
        (iVar10 = check_fine_line_of_sight(iVar3,iVar5,
                                           (uint)(byte) g_object_type_props[(((uw_object_hdr_t *)npc)->object_id)].height + (uVar1 & 0x7f)
                                           ,iVar7,(short)iVar9,
                                           (ushort)(byte) g_object_type_props[(*DAT_00101958 & 0x1ff)].height +
                                           (uVar2 & 0x7f) + 0xc), iVar10 != 0)) {
      uVar8 = (((uw_mobile_object_t *)npc)->npc_attitude) - 1;
      if ((int)(uVar8 * 0x10000) >> 0x10 < 0) {
        uVar8 = 0;
      }
      uVar6 = ((uw_mobile_object_t *)npc)->status_word & 0x3fff;
      ((uw_mobile_object_t *)npc)->npc_attitude = uVar8 & 3;
      build_object_display_name(auStack_74,npc,1,0);
      uVar4 = get_message_string(uVar8 + 0xe1 | 0x200);
      ce_strcat(auStack_74,uVar4);
      message_scroll_print_wrapped(auStack_74);
      return 1;
    }
  }
  return 0;
}



// was FUN_00035cb0 -- makes noise at object param_1 (e.g. a trap triggering, a loud action):
// resolves the noise type/volume to use (param_2, or if 0 and the object is a container, a
// class-specific field off the object itself), and if nonzero...
void emit_noise_alert(ushort *source, byte noise_type)
{
  byte bVar1;
  uint uVar2;

  DAT_0010195c = 0;
  bVar1 = noise_type;
  if ((noise_type == 0) &&
     (bVar1 = DAT_0010195c, g_object_type_props[((uw_object_hdr_t *)source)->object_id].can_have_owner)) {
    bVar1 = ((uw_object_hdr_t *)source)->owner;
  }
  DAT_0010195c = bVar1;
  if (DAT_0010195c != 0) {
    DAT_00101958 = source;
    scan_area_for_matching_objects(0x14,0,alert_npc_to_noise_callback,0,(char)DAT_002020a0 + -7,(char)DAT_002020a4 + -7,0xf,0xf);
    if ((((uw_object_hdr_t *)source)->owner & 0x1f) < 0x1c) {
      uVar2 = ((uw_object_hdr_t *)source)->link << 6;
      ((uw_object_hdr_t *)source)->link_word = (ushort)uVar2;
    }
  }
}


// was FUN_0003a73c -- special-behavior dispatcher for "unique" NPCs, keyed by their own byte 0x1a
// (a per-record special-event code, 0 meaning "ordinary, no special handling").
int resolve_unique_npc_special_behavior(void *npc_ptr, int event_mode)
{
  char *npc = (char *)npc_ptr;
  char cVar1;
  uint uVar2;

  cVar1 = *(char *)(npc + 0x1a);
  if (cVar1 == '\v') {
    if (event_mode == 0) {
      attempt_talk_interaction(npc);
      *(undefined1 *)(npc + 8) = 0x3c;
      return 0;
    }
  }
  else if (cVar1 == '\x16') {
    if (event_mode == 0) {
      if ((*(byte *)(npc + 10) & 0x70) == 0) {
        *(byte *)(npc + 10) = *(byte *)(npc + 10) & 0x9f | 0x10;
        grant_experience_points(500);
      }
      *(undefined1 *)(npc + 0x12) = 0;
      cancel_weapon_swing();
      *(byte *)(npc + 0x15) = *(byte *)(npc + 0x15) & 0xe0 | 0x20;
      uVar2 = ((uw_mobile_object_t *)npc)->goal_word & 0xfff;
      *(char *)(npc + 0xb) = (char)uVar2;
      *(char *)(npc + 0xc) = (char)(uVar2 >> 8);
      attempt_talk_interaction(npc);
      return 0;
    }
  }
  else {
    if (cVar1 == '\x18') {
      if (event_mode == 0) {
        return 1;
      }
      uVar2 = *(uint *)(DAT_00086df8 + 0x65) | 0x40;
    }
    else {
      if (cVar1 == '\x1b') {
        if (event_mode == 0) {
          return 1;
        }
        uVar2 = *(ushort *)(DAT_00086df8 + 0x61) & 0xfbff;
        *(char *)(DAT_00086df8 + 0x61) = (char)uVar2;
        *(char *)(DAT_00086df8 + 0x62) = (char)(uVar2 >> 8);
        return 1;
      }
      if (cVar1 == 'n') {
        if (event_mode == 0) {
          return 1;
        }
        uVar2 = *(uint *)(DAT_00086df8 + 0x65) | 0x10;
      }
      else {
        if (cVar1 != -0x72) {
          if (cVar1 != -0x19) {
            return 1;
          }
          if (event_mode == 0) {
            return 1;
          }
          trigger_quest_milestone_cleanup_event();
          return 1;
        }
        if (event_mode == 0) {
          return 1;
        }
        uVar2 = *(uint *)(DAT_00086df8 + 0x65) | 0x800;
      }
    }
    *(char *)(DAT_00086df8 + 0x65) = (char)uVar2;
    *(char *)(DAT_00086df8 + 0x66) = (char)(uVar2 >> 8);
    *(char *)(DAT_00086df8 + 0x67) = (char)(uVar2 >> 0x10);
    *(char *)(DAT_00086df8 + 0x68) = (char)(uVar2 >> 0x18);
  }
  return 1;
}


// was FUN_00040160 -- called during the bitmap-loading stage of game startup (uw.c, right after
// every HUD bitmap resource load succeeds) with param_1=1.
int load_critter_association_tables(int file_handle)
{
  int uw_ord2005_rem_112 = 0;
  char *wptr_26821;
  char *wptr_26852;
  unsigned int stack0xffdc3230;
  int iVar1;
  char cVar2;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  undefined1 *puVar6;
  int iVar7;
  char extraout_r1;
  int iVar8;
  int extraout_r2;
  int extraout_r2_00;
  ushort uVar9;
  int iVar10;
  /* Were two independently-declared single-byte scalars, relying on accidental stack adjacency to
     work as one 2-byte destination for `read_file_handle(puVar6,&local_130,2)` below (and the
     combined `(ushort)local_12f + (ushort)local_130` read right after)... */
  byte local_130_arr[2];
#define local_130 local_130_arr[0]
#define local_12f local_130_arr[1]
  undefined1 *local_12c;
  char acStack_128 [260];
  
  iVar8 = 0;
  uVar3 = (uint)DAT_0024fa18;
  if (uVar3 != 0) {
    iVar8 = 0;
    do {
      (&DAT_0023c4c0)[iVar8] = 0xfe;
      iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
    } while (iVar8 < (int)uVar3);
  }
  for (iVar8 = iVar8 << 0x10; iVar8 = iVar8 >> 0x10, iVar8 < 0x80; iVar8 = (iVar8 + 1) * 0x10000) {
    (&DAT_0023c4c0)[iVar8] = 0xff;
  }
  iVar8 = 0;
  do {
    (&DAT_0023c5b8)[iVar8] = 0xff;
    (&DAT_0024ac18)[iVar8] = 0xff;
    iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
  } while (iVar8 < 0x80);
  clear_ambient_sound_target();
  if (file_handle != 0) {
    /* Was pointed at the placeholder stack0xffdc3230 scalar (from an earlier undeclared-identifier
       pass) instead of the real 260-byte path buffer acStack_128 that both copy loops below (and
       the ce_strcat/open_file_for_read calls right after) actually operate on. */
    local_12c = (undefined1 *)acStack_128;
    pcVar4 = &DAT_0023cca8;
    wptr_26821 = local_12c;
    do {
      cVar2 = *pcVar4;
      *wptr_26821 = cVar2; wptr_26821 = wptr_26821 + 1;
      pcVar4 = pcVar4 + 1;
    } while (cVar2 != '\0');
    ce_strcat(acStack_128,s__CRIT_assoc_anm_00085934);
    iVar8 = open_file_for_read(acStack_128);
    if (iVar8 == -1) {
      iVar8 = 0;
      do {
        (&DAT_0023ce70)[iVar8] = 0xff;
        iVar8 = (iVar8 + 1) * 0x10000 >> 0x10;
      } while (iVar8 < 0x80);
      return 0;
    }
    seek_file_handle(iVar8,0x100,0);
    read_file_handle(iVar8,&DAT_0023ce70,0x80);
    iVar10 = 0;
    do {
      DAT_00085910 = (char)((short)iVar10 >> 3) + '0';
      DAT_00085911 = ((byte)iVar10 & 7) + 0x30;
      iVar5 = 0;
      do {
        iVar5 = (int)(short)iVar5;
        cVar2 = ordint_divmod(10,iVar5).quot;
        DAT_00085918 = cVar2 + '0';
        uw_ord2005_rem_112 = ((int)(iVar5)) % (10);
        DAT_00085919 = uw_ord2005_rem_112 + '0';
        uVar9 = 0xa0;
        ce_memset(acStack_128,0,0x104);
        pcVar4 = &DAT_0023cca8;
    wptr_26852 = local_12c;
        do {
          cVar2 = *pcVar4;
          *wptr_26852 = cVar2; wptr_26852 = wptr_26852 + 1;
          pcVar4 = pcVar4 + 1;
        } while (cVar2 != '\0');
        ce_strcat(acStack_128,&DAT_00085908);
        file_handle = open_file_for_read(acStack_128);
        iVar7 = extraout_r2;
        if (file_handle != -1) {
          iVar7 = read_file_handle(file_handle,&local_130,2);
          uVar9 = 0xa0;
          if (iVar7 == 2) {
            uVar9 = (ushort)local_12f + (ushort)local_130;
          }
          CloseHandle(file_handle);
          iVar7 = extraout_r2_00;
        }
        if (iVar5 < 3) {
          puVar6 = &DAT_0023c460;
          iVar7 = (short)iVar10 * 3 + iVar5;
        }
        iVar1 = (iVar5 + 1) * 0x10000;
        if (iVar5 < 3) {
          puVar6[iVar7] = (char)uVar9;
        }
        iVar5 = iVar1 >> 0x10;
      } while ((uVar9 < 0xa0) && ((short)((uint)iVar1 >> 0x10) < 4));
      iVar10 = iVar10 + 1;
    } while (iVar10 * 0x10000 >> 0x10 < 0x20);
    CloseHandle(iVar8);
  }
  return 1;
}


// was FUN_00040440 -- called once from handle_rest_action, right after resting/sleeping finishes
// (before the jump/fall timers get reset for the new tick).
void flush_pending_critter_resource_slots()

{
  byte bVar1;
  int iVar2;

  iVar2 = 0;
  do {
    if ((&DAT_0023c5b8)[iVar2] == '\x01') {
      bVar1 = (&DAT_0024ac18)[iVar2];
      (&DAT_0023c5b8)[iVar2] = 0xff;
      (&DAT_0024ac18)[iVar2] = 0xff;
      (&DAT_0023c4c0)[(short)(ushort)bVar1] = 0xfe;
    }
    iVar2 = (iVar2 + 1) * 0x10000 >> 0x10;
  } while (iVar2 < 0x80);
  clear_ambient_sound_target();
  return;
}


// was FUN_0004a510 -- NPC-side ranged/thrown weapon launch (the counterpart to the player's
// fire_ranged_weapon): given the attacker object (param_1), weapon type (param_2), and ammo quality
// (param_3)...
void spawn_npc_thrown_weapon(void *attacker_ptr, short launch_offset, short launch_flags)
{
  char *attacker = (char *)attacker_ptr;
  DAT_00202a38 = launch_offset + 0x10;
  DAT_00202a4c = (ushort)(*(byte *)(attacker + 0x17) >> 2);
  DAT_00202a50 = (undefined2)((*(ushort *)(attacker + 0x16) & 0x3f0) >> 4);
  DAT_00202a54 = 1;
  DAT_00202a40 = 0;
  DAT_00202a44 = (ushort *)attacker;
  DAT_00202a48 = launch_flags;
  spawn_object_near_player();
}
void npc_set_walk_target(byte goal, uint goal_target, byte attitude)
{
  if ((((uint)goal != DAT_0010190c->npc_target_tile_x) || ((goal_target & 0xff) != DAT_0010190c->npc_target_tile_y)) || (attitude != ((DAT_0010190c->status_word >> 4) & 0xf))) {
    DAT_0010190c->npc_target_tile_x = goal;
    DAT_0010190c->npc_target_tile_y = goal_target;
    DAT_0010190c->status_word = (DAT_0010190c->status_word & 0xff0f) | ((attitude & 0xf) << 4);
    DAT_0010190c->heading_flags = DAT_0010190c->heading_flags | 0x20;
    DAT_0010190c->heading_flags = DAT_0010190c->heading_flags & 0xbf;
  }
}









// was FUN_0002f124
void npc_idle_behavior_tick()

{
  int uw_ord2005_rem_23 = 0; int uw_ord2005_rem_24 = 0; int uw_ord2005_rem_25 = 0; int uw_ord2005_rem_26 = 0; int uw_ord2005_rem_27 = 0; int uw_ord2005_rem_28 = 0; int uw_ord2005_rem_29 = 0; int uw_ord2005_rem_30 = 0; int uw_ord2005_rem_31 = 0; int uw_ord2005_rem_32 = 0; int uw_ord2005_rem_33 = 0; int uw_ord2005_rem_34 = 0; int uw_ord2005_rem_35 = 0; int uw_ord2005_rem_36 = 0; int uw_ord2005_rem_37 = 0; int uw_ord2005_rem_38 = 0; int uw_ord2005_rem_39 = 0;
  ushort uVar1;
  byte *pbVar2;
  undefined4 uVar3;
  char extraout_r1;
  char extraout_r1_00;
  char cVar4;
  int extraout_r1_01;
  uint extraout_r1_02;
  uint extraout_r1_03;
  int extraout_r1_04;
  uint extraout_r1_05;
  uint extraout_r1_06;
  uint extraout_r1_07;
  int extraout_r1_08;
  uint extraout_r1_09;
  uint extraout_r1_10;
  int extraout_r1_11;
  uint extraout_r1_12;
  int extraout_r1_13;
  uint extraout_r1_14;
  uint extraout_r1_15;
  byte bVar5;
  byte bVar6;
  uint uVar7;
  uint uVar8;
  char *iVar9;
  
  if ((DAT_0010190c->animation_flags & 0x80) != 0) {
    DAT_000853b8 = DAT_000853b8 | (ushort)(1 << (DAT_0010190c->npc_path_slot));
    DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0x7f;
  }
  pbVar2 = (byte *)tilemap_lookup(DAT_00101918,DAT_001013f8);
  if (DAT_00101734 == 0) {
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xf9 | 1;
    return;
  }
  if (DAT_0010190c->npc_attitude == 0) {
    uVar3 = ce_rand();
    uw_ord2005_rem_23 = ((int)(uVar3)) % (2);
    if (uw_ord2005_rem_23 != 0) {
      npc_notice_and_idle_tick();
      return;
    }
  }
  if ((DAT_00101404->movement_flags & 0x80) != 0) {
    if (DAT_0010140c < 0xf) {
      if (DAT_0010140c < (byte)((*pbVar2 >> 4) + 2)) {
        uVar3 = ce_rand();
        iVar9 = (char *)DAT_0010190c;
        bVar5 = DAT_0010190c->attack_pitch;
        uw_ord2005_rem_24 = ((int)(uVar3)) % (3);
        ((uw_mobile_object_t *)iVar9)->attack_pitch = ~bVar5 & 7 ^ (char)((uw_ord2005_rem_24 & 0xff) << 3) + 0x87U;
        goto LAB_0002f314;
      }
      uVar3 = ce_rand();
      uw_ord2005_rem_25 = ((int)(uVar3)) % (5);
      cVar4 = uw_ord2005_rem_25;
    }
    else {
      uVar3 = ce_rand();
      uw_ord2005_rem_26 = ((int)(uVar3)) % (3);
      cVar4 = uw_ord2005_rem_26;
    }
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 7 ^ (cVar4 + '\x0e') * '\b';
  }
LAB_0002f314:
  /* HACK: whole-function fix, same ushort-vs-byte pointer-scaling bug as the rest of this NPC-AI
     cluster this session (see [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is `ushort
     *`... */
  if ((DAT_0010190c->animation_flags & 0x3f) == 0x20) {
    uVar3 = ce_rand();
    uw_ord2005_rem_27 = ((int)(uVar3)) % (0x10);
    if (((uw_ord2005_rem_27 & 0xff) < (DAT_00101404->missile_wander_flags & 0xf)) &&
        (DAT_0010190c->npc_animation_frame == 3)) {
LAB_0002f384:
      bVar5 = DAT_0010190c->animation_flags & 0xec | 0x2c;
      goto LAB_0002f390;
    }
  }
  else {
    uVar3 = ce_rand();
    uw_ord2005_rem_28 = ((int)(uVar3)) % (0x10);
    if (((uw_ord2005_rem_28 & 0xff) <= (DAT_00101404->missile_wander_flags & 0xf)) ||
        (DAT_0010190c->npc_animation_frame != 3)) goto LAB_0002f384;
    bVar5 = DAT_0010190c->animation_flags & 0xe0 | 0x20;
LAB_0002f390:
    DAT_0010190c->animation_flags = bVar5;
  }
  if ((DAT_0010190c->animation_flags & 0x3f) == 0x2c) {
    if ((DAT_00101924 != 0) && (DAT_00101430 == 0)) {
      uVar3 = ce_rand();
      uw_ord2005_rem_29 = ((int)(uVar3)) % (2);
      iVar9 = (char *)DAT_0010190c;
      uw_ord2005_rem_30 = ((int)((uint) DAT_0010190c->full_heading + uw_ord2005_rem_29 * 0x80 + 0xc0)) % (0x100);
      ((uw_mobile_object_t *)iVar9)->full_heading = (byte)uw_ord2005_rem_30;
      DAT_0010190c->hdr.heading = (uw_ord2005_rem_30 >> 5) & 7;
      uVar7 = DAT_0010190c->hdr.position_word;
      DAT_0010190c->heading_flags =
        ((byte)uw_ord2005_rem_30 ^ DAT_0010190c->heading_flags) & 0x1f ^
         DAT_0010190c->heading_flags;
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      return;
    }
    uVar3 = ce_rand();
    bVar5 = DAT_00101404->missile_wander_flags;
    uw_ord2005_rem_31 = ((int)(uVar3)) % (0x40);
    if ((uw_ord2005_rem_31 & 0xff) < (bVar5 & 0xf) + 8) {
      uVar3 = ce_rand();
      iVar9 = (char *)DAT_0010190c;
      bVar5 = DAT_0010190c->full_heading;
      uw_ord2005_rem_32 = ((int)(uVar3)) % (0x40);
      uw_ord2005_rem_33 = ((int)(uw_ord2005_rem_32 + (uint)bVar5 + 0xe0)) % (0x100);
      uVar7 = uw_ord2005_rem_33 & 0xff;
    }
    else {
      uVar7 = (uint) DAT_0010190c->full_heading;
      iVar9 = (char *)DAT_0010190c;
    }
    if (DAT_00101430 == 0) {
      uVar7 = adjust_heading_away_from_player(uVar7,10);
      iVar9 = (char *)DAT_0010190c;
    }
    ((uw_mobile_object_t *)iVar9)->full_heading = (byte)uVar7;
    DAT_0010190c->hdr.heading = (uVar7 >> 5) & 7;
    uVar8 = DAT_0010190c->hdr.position_word;
    bVar5 = DAT_0010190c->heading_flags;
    bVar6 = bVar5 ^ (byte)uVar7;
LAB_0002f6cc:
    DAT_0010190c->heading_flags = bVar6 & 0x1f ^ bVar5;
  }
  else {
    uVar3 = ce_rand();
    uw_ord2005_rem_34 = ((int)(uVar3)) % (0x80);
    if ((uw_ord2005_rem_34 & 0xff) < (DAT_00101404->missile_wander_flags & 0xf)) {
      uVar3 = ce_rand();
      iVar9 = (char *)DAT_0010190c;
      bVar5 = DAT_0010190c->full_heading;
      uw_ord2005_rem_35 = ((int)(uVar3)) % (0x40);
      uw_ord2005_rem_36 = ((int)(uw_ord2005_rem_35 + (uint)bVar5 + 0xe0)) % (0x100);
      ((uw_mobile_object_t *)iVar9)->full_heading = (byte)uw_ord2005_rem_36;
      DAT_0010190c->hdr.heading = (uw_ord2005_rem_36 >> 5) & 7;
      uVar7 = DAT_0010190c->hdr.position_word;
      bVar5 = DAT_0010190c->heading_flags;
      bVar6 = (byte)uw_ord2005_rem_36 ^ bVar5;
      goto LAB_0002f6cc;
    }
  }
  bVar5 = DAT_0010190c->animation_flags;
  if ((bVar5 & 0x3f) == 0x20) {
    DAT_0010190c->animation_flags = bVar5 | 0x40;
    DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
    uVar3 = ce_rand();
    uw_ord2005_rem_37 = ((int)(uVar3)) % (2);
    iVar9 = (char *)DAT_0010190c;
    if (uw_ord2005_rem_37 == 0) goto LAB_0002f810;
    uVar1 = DAT_0010190c->goal_word;
    uw_ord2005_rem_38 = ((int)((uVar1 >> 0xc) + 1)) % (4);
    uVar7 = uw_ord2005_rem_38;
  }
  else {
    DAT_0010190c->animation_flags = bVar5 & 0xbf;
    DAT_0010190c->motion_flags =
      (DAT_0010190c->motion_flags ^ DAT_00101404->magic_power) & 0x7f ^
       DAT_0010190c->motion_flags;
    DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfc | 4;
    iVar9 = (char *)DAT_0010190c;
    uVar1 = DAT_0010190c->goal_word;
    uw_ord2005_rem_39 = ((int)((uVar1 >> 0xc) + 1)) % (4);
    uVar7 = uw_ord2005_rem_39;
  }
  DAT_0010190c->npc_animation_frame = uVar7 & 0xf;
LAB_0002f810:
  npc_react_to_nearby_player();
  return;
}



// was FUN_0002fba8 -- goal 8: if attitude neutral and goal isn't already 4, resets to idle via
// npc_set_goal(4,1); else walks toward the home tile (DAT_0010143c/173c) via npc_walk_toward_tile
// if farther than a threshold, otherwise idles (npc_idle_behavior_tick)
void npc_wander_return_home_tick()

{
  uint uVar1;
  int iVar2;
  int iVar3;
  ushort *puVar4;
  
  if (DAT_00101734 != 0) {
    /* HACK: same ushort-vs-byte pointer-scaling bug as the rest of this NPC-AI cluster this session
       (see [[ushort-byte-scaling-bug-npc-cluster]]) -- bare `DAT_0010190c + 0xe`/`+ 0xb` scaled to
       byte 0x1c/0x16 (the latter being this object's real tile-position field) instead of the... */
    if ((DAT_0010190c->npc_attitude == 0) &&
        ((DAT_0010190c->npc_goal) != 4)) {
      npc_set_goal(4,1);
      return;
    }
    iVar2 = ((int)DAT_0010143c - (int)DAT_00101918) * 0x1000000 >> 0x18;
    iVar3 = ((int)DAT_0010173c - (int)DAT_001013f8) * 0x1000000 >> 0x18;
    uVar1 = (uint)(DAT_00101404->morale_flags >> 4);
    if ((int)(uVar1 * uVar1) < iVar2 * iVar2 + iVar3 * iVar3) {
      puVar4 = (ushort *)tilemap_lookup(DAT_0010143c,DAT_0010173c);
      npc_walk_toward_tile(DAT_0010143c,DAT_0010173c,*puVar4 >> 4 & 0xf);
    }
    else {
      npc_idle_behavior_tick();
    }
  }
  return;
}



// was FUN_0002fcec -- goal dispatch target for goals 0/4/7 (notice the
// player when attitude is neutral, otherwise idle frame-cycle default)
void npc_notice_and_idle_tick()

{
  int uw_ord2005_rem_41 = 0; int uw_ord2005_rem_42 = 0; int uw_ord2005_rem_43 = 0; int uw_ord2005_rem_44 = 0; int uw_ord2005_rem_45 = 0;
  byte bVar1;
  char *iVar2;
  char cVar3;
  undefined4 uVar4;
  ushort uVar5;
  int extraout_r1;
  int extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  uint extraout_r1_03;
  uint uVar6;
  undefined1 local_18;
  undefined1 local_17 [3];
  
  if (DAT_00101734 == 0) {
    return;
  }
  /* HACK: DAT_0010190c is `ushort *`, so bare `DAT_0010190c + N` pointer arithmetic scales N by 2
     -- correct for the handful of genuine 16-bit- array-style fields elsewhere in this file, but
     WRONG here... */
  if (DAT_0010190c->npc_attitude == 0) {
    uVar6 = DAT_0010190c->goal_word & 0xf01f;
    DAT_0010190c->npc_gtarg = 1;
    refresh_npc_target_delta();
    if ((DAT_0010190c->npc_ai_flags & 1) != 0) {
LAB_0002fe88:
      npc_set_goal(5,1);
      return;
    }
    if ((DAT_0010190c->npc_ai_flags & 2) != 0) {
      uVar4 = ce_rand();
      bVar1 = DAT_00101404->missile_wander_flags;
      uw_ord2005_rem_41 = ((int)(uVar4)) % (0x10);
      if ((int)(uint)(bVar1 >> 4) < uw_ord2005_rem_41) {
        DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags & 0xfd;
      }
      else {
        check_npc_target_alignment(0);
      }
    }
    uVar4 = ce_rand();
    bVar1 = DAT_00101404->missile_wander_flags;
    uw_ord2005_rem_42 = ((int)(uVar4)) % (0x10);
    if (uw_ord2005_rem_42 < (int)(uint)(bVar1 >> 4)) {
      cVar3 = detect_npc_wander_proximity(local_17,&local_18);
      if (cVar3 == '\0') {
        DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 1;
        npc_set_walk_target(local_17[0],local_18,DAT_00101420);
        goto LAB_0002fe88;
      }
      if ((cVar3 != '\x01') && (cVar3 == '\x02')) {
        DAT_0010190c->npc_ai_flags = DAT_0010190c->npc_ai_flags | 2;
        uVar4 = ce_rand();
        uw_ord2005_rem_43 = ((int)(uVar4)) % (2);
        if (uw_ord2005_rem_43 == 0) {
          npc_walk_toward_tile(local_17[0],local_18,DAT_00101420);
          return;
        }
      }
    }
  }
  /* HACK: same ushort-vs-byte pointer-scaling bug as the two other fixes in this NPC-AI cluster
     this session (see [[ushort-byte-scaling-bug-npc-cluster]]) -- DAT_0010190c is `ushort *`, so
     bare `DAT_0010190c + 0xb` scales to byte offset 0x16... */
  uVar5 = DAT_0010190c->npc_goal;
  if ((DAT_0010190c->npc_goal) != 0) {
    if (uVar5 == 2) {
      npc_idle_behavior_tick();
      return;
    }
    if (uVar5 != 7) {
      npc_wander_return_home_tick();
      return;
    }
  }
  DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
  DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
  DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
  uVar4 = ce_rand();
  uw_ord2005_rem_44 = ((int)(uVar4)) % (2);
  iVar2 = (char *)DAT_0010190c;
  if (uw_ord2005_rem_44 != 0) {
    /* HACK: this is the real frame-cycle step (advance this idle critter's animation frame,
       wrapping 0..3 -- see uVar5>>0xc, the upper nibble of raw byte 0xc, matching
       resolve_critter_sprite_tier's own "frame" param computed the same way in emit_tile_objects). */
    uVar5 = DAT_0010190c->goal_word;
    uw_ord2005_rem_45 = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
    uVar6 = uVar5 & 0xfff;
    DAT_0010190c->npc_animation_frame = uw_ord2005_rem_45 & 0xf;
  }
  return;
}















// was FUN_00031fa8 -- goal 0xc: same shape as npc_wander_return_home_tick
// but an exact tile-equality check instead of a distance threshold --
// walk home (npc_walk_toward_tile) if not exactly there, idle if so
void npc_wander_return_home_exact_tick()

{
  int uw_ord2005_rem_84 = 0; int uw_ord2005_rem_85 = 0;
  ushort uVar1;
  char *iVar2;
  undefined4 uVar3;
  ushort *puVar4;
  int extraout_r1;
  uint extraout_r1_00;
  uint uVar5;
  
  if (DAT_00101734 != 0) {
    if ((DAT_0010190c->npc_attitude == 0) &&
        ((DAT_0010190c->npc_goal) != 4)) {
      npc_set_goal(4,1);
    }
    else if ((DAT_0010143c == DAT_00101918) && (DAT_0010173c == DAT_001013f8)) {
      DAT_0010190c->attack_pitch = DAT_0010190c->attack_pitch & 0xfe | 6;
      DAT_0010190c->motion_flags = DAT_0010190c->motion_flags & 0x80;
      DAT_0010190c->animation_flags = DAT_0010190c->animation_flags & 0xe0 | 0x20;
      uVar3 = ce_rand();
      uw_ord2005_rem_84 = ((int)(uVar3)) % (2);
      iVar2 = (char *)DAT_0010190c;
      if (uw_ord2005_rem_84 != 0) {
        uVar1 = DAT_0010190c->goal_word;
        uw_ord2005_rem_85 = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
        uVar5 = uVar1 & 0xfff;
        DAT_0010190c->npc_animation_frame = uw_ord2005_rem_85 & 0xf;
      }
    }
    else {
      puVar4 = (ushort *)tilemap_lookup(DAT_0010143c,DAT_0010173c);
      npc_walk_toward_tile(DAT_0010143c,DAT_0010173c,*puVar4 >> 4 & 0xf);
    }
  }
  return;
}
void npc_set_goal(byte goal, uint goal_target)
{
  if (DAT_0010190c->npc_goal == 4) {
    DAT_0010190c->npc_level = DAT_0010190c->npc_goal;
  }
  DAT_0010190c->npc_goal = goal;
  DAT_0010190c->npc_gtarg = goal_target;
}



// was FUN_000344a4 -- npc_set_goal's sibling: fallback when a combat-engage goal's guard fails
// (player not detected / no path). With level zero, sets idle goal 2 and target 0.
// Otherwise copies npc_level into the goal, targets slot 1, and clears npc_level.
void npc_clear_special_goal()

{
  undefined2 uVar1;
  byte bVar2;
  uint uVar3;
  
  if ((DAT_0010190c->npc_level) == 0) {
    uVar3 = DAT_0010190c->goal_word & 0xfff2;
    DAT_0010190c->npc_goal = 2;
    DAT_0010190c->npc_gtarg = 0x0;
    uVar3 = DAT_0010190c->goal_word;
  }
  else {
    uVar1 = DAT_0010190c->goal_word;
    bVar2 = (byte)uVar1;
    DAT_0010190c->npc_goal = DAT_0010190c->npc_level;
    uVar3 = DAT_0010190c->goal_word & 0xf01f;
    DAT_0010190c->npc_gtarg = 1;
    DAT_0010190c->npc_level = 0x0;
    uVar3 = DAT_0010190c->status_word;
  }
  return;
}









// was FUN_0003495c.
int object_tick_is_due(short period, int phase)
{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  
  iVar1 = (int)period;
  iVar3 = (int)DAT_00101928;
  if (((iVar1 < iVar3) && (iVar3 <= iVar1 + 4)) ||
     ((iVar1 < iVar3 + 0x10 && ((DAT_00101948 <= iVar1 && (iVar3 < DAT_00101948)))))) {
    uVar2 = 1;
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}


// was FUN_0002bdac.
int tile_pair_los_blocked(byte tile_a_x, byte tile_a_y, byte tile_b_x, byte tile_b_y, byte tile_c_x, byte tile_c_y, ushort block_mask, ushort wall_mask, byte span, byte *out_a, byte *out_b)
{
  int uw_ord2005_rem_13 = 0;
  bool bVar1;
  ushort uVar2;
  byte bVar3;
  ushort uVar4;
  ushort uVar5;
  bool bVar6;
  ushort *puVar7;
  byte *pbVar8;
  ushort *puVar9;
  ushort *puVar10;
  uint extraout_r1;
  uint uVar11;
  uint uVar12;
  int iVar13;
  ushort uVar14;
  uint uVar15;
  uint uVar16;
  byte bVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  bool bVar21;
  byte local_50;
  
  DAT_00101440 = 0;
  bVar6 = false;
  bVar1 = false;
  puVar7 = (ushort *)tilemap_lookup(tile_b_x,tile_b_y);
  pbVar8 = (byte *)tilemap_lookup(tile_a_x,tile_a_y);
  uVar18 = (uint)tile_c_x;
  puVar9 = (ushort *)tilemap_lookup(uVar18,tile_c_y);
  /* Added NULL guards: tilemap_lookup legitimately returns NULL for an out-of-range tile coordinate
     (its own documented contract), and all three results here were dereferenced unconditionally. */
  if ((puVar7 == (ushort *)0x0) || (pbVar8 == (byte *)0x0) || (puVar9 == (ushort *)0x0)) {
    return 0;
  }
  uVar19 = *puVar7 & 0xf;
  uVar11 = *puVar9 & 0xf;
  bVar3 = (byte)uVar11;
  uVar4 = (ushort)(&DAT_0023ae40)[*puVar7 >> 10 & 0xf] >> 4;
  uVar2 = (&DAT_0023ae40)[*puVar9 >> 10 & 0xf];
  uVar15 = (uint)tile_a_x;
  if (uVar15 == 0) {
    uVar20 = (uint)tile_b_x;
    *out_a = span;
    uVar15 = (uint)(byte)((byte)*puVar9 >> 4);
    if ((uVar20 < uVar18) && (((&DAT_000878d0)[uVar11] & 2) != 0)) {
      return 0;
    }
    if ((uVar18 < uVar20) && (((&DAT_000878d0)[uVar11] & 4) != 0)) {
      return 0;
    }
    uVar16 = (uint)tile_c_y;
    uVar12 = (uint)tile_b_y;
    if ((uVar12 < uVar16) && (((&DAT_000878d0)[uVar11] & 8) != 0)) {
      return 0;
    }
    if ((uVar16 < uVar12) && (((&DAT_000878d0)[uVar11] & 0x10) != 0)) {
      return 0;
    }
    if ((uVar20 < uVar18) && (((&DAT_000878d0)[uVar19] & 4) != 0)) {
      return 0;
    }
    if ((uVar18 < uVar20) && (((&DAT_000878d0)[uVar19] & 2) != 0)) {
      return 0;
    }
    if ((uVar12 < uVar16) && (((&DAT_000878d0)[uVar19] & 0x10) != 0)) {
      return 0;
    }
    if ((uVar16 < uVar12) && (((&DAT_000878d0)[uVar19] & 8) != 0)) {
      return 0;
    }
    if ((block_mask & 0x1000) == 0) {
      return 1;
    }
    if (((5 < uVar11) && (uVar11 < 10)) &&
       (uVar11 != (byte)(&DAT_000853cc)
                        [(byte)(&DAT_000853c4)[(int)(((uVar18 - uVar20) * 3 - uVar12) + uVar16)]])) {
      uVar15 = uVar15 + 1;
    }
    if (uVar15 <= span + 1) {
      return 1;
    }
    return 0;
  }
  if (uVar18 == 0) {
    *out_a = span;
    if ((block_mask & 0x1000) == 0) {
      return 1;
    }
    uVar11 = 0;
    uVar2 = puVar7[1];
    /* `resolve_object_link(puVar7 + 1)` was called unchanged on every iteration -- real disassembly
       (0x2bdac @ 0x2c068-0x2c0f8) shows the argument register is only ever set to puVar7+1 ONCE,
       before the loop... */
    puVar10 = puVar7 + 1;
    while (((uVar2 & 0xffc0) != 0 && (uVar11 == 0))) {
      puVar9 = (ushort *)resolve_object_link(puVar10);
      iVar13 = (*puVar9 & 0x1ff) * 0xd;
      if ((g_object_type_props[iVar13 / 0xd].flags & 2) != 0) {
        uVar11 = (int)(((byte)puVar9[1] & 0x7f) + (uint)(byte) g_object_type_props[iVar13 / 0xd].height) >> 3;
      }
      puVar10 = puVar9 + 2;
      uVar2 = puVar9[2];
    }
    uVar15 = (uint)(byte)((byte)*puVar7 >> 4);
    bVar1 = uVar11 <= uVar15;
    if (bVar1) {
      uVar11 = uVar15;
    }
    if (uVar11 + 1 < (uint)(*pbVar8 >> 4)) {
      *out_a = (byte)uVar11;
      uVar11 = ((*out_b - uVar11) + (uint)span) - 1;
      *out_b = (byte)uVar11;
      if ((uint)DAT_00101450 < (uVar11 & 0xff)) {
        return 0;
      }
    }
    if (!bVar1) {
      return 1;
    }
    uVar11 = 8 << (uVar4 & 0xff);
    if ((block_mask & uVar11) != 0) {
      return 0;
    }
    if ((uVar11 & wall_mask) == 0) {
      return 1;
    }
    bVar3 = *out_b;
    *out_b = bVar3 + 2;
    if ((byte)(bVar3 + 2) <= DAT_00101450) {
      return 1;
    }
    return 0;
  }
  *out_a = span;
  uVar20 = (uint)tile_b_x;
  if (uVar20 < uVar18) {
    if (((&DAT_000878d0)[uVar11] & 2) != 0) {
      return 0;
    }
    bVar21 = ((&DAT_000878d0)[uVar19] & 4) == 0;
LAB_0002c220:
    if (!bVar21) {
      return 0;
    }
  }
  else {
    if (uVar18 < uVar20) {
      if (((&DAT_000878d0)[uVar11] & 4) != 0) {
        return 0;
      }
      bVar21 = ((&DAT_000878d0)[uVar19] & 2) == 0;
      goto LAB_0002c220;
    }
    if (tile_c_y >= tile_b_y && tile_c_y != tile_b_y) {
      if (((&DAT_000878d0)[uVar11] & 8) != 0) {
        return 0;
      }
      bVar21 = ((&DAT_000878d0)[uVar19] & 0x10) == 0;
      goto LAB_0002c220;
    }
    if (tile_c_y < tile_b_y) {
      if (((&DAT_000878d0)[uVar11] & 0x10) != 0) {
        return 0;
      }
      if (((&DAT_000878d0)[uVar19] & 8) != 0) {
        return 0;
      }
    }
  }
  local_50 = 0;
  uVar14 = puVar7[1];
  uVar11 = uVar15;
  /* Same bug as the earlier resolve_object_link loop above in this function (see that one's comment
     for the full disassembly- confirmed explanation): `resolve_object_link(puVar7 + 1)` was called
     unchanged on every iteration instead of advancing through the object chain... */
  ushort *puVar_link2 = puVar7 + 1;
  while (((uVar14 & 0xffc0) != 0 && (local_50 == 0))) {
    puVar10 = (ushort *)resolve_object_link(puVar_link2);
    uVar19 = (uint)*puVar10;
    iVar13 = (uVar19 & 0x1ff) * 0xd;
    if (((uVar19 & 0x1c0) != 0x140) || (((*puVar10 & 0x30) != 0 || (7 < (uVar19 & 0xf))))) {
      if ((g_object_type_props[iVar13 / 0xd].flags & 2) != 0) {
        local_50 = (byte)((int)(((byte)puVar10[1] & 0x7f) + (uint)(byte) g_object_type_props[iVar13 / 0xd].height) >>
                          3);
      }
      goto switchD_0002c458_default;
    }
    uVar14 = puVar10[1];
    uw_ord2005_rem_13 = ((int)(uVar14 >> 7 & 7)) % (4);
    uVar5 = uVar14 >> 0xd;
    uVar19 = uw_ord2005_rem_13 & 0xff;
    uVar14 = uVar14 >> 10 & 7;
    if (!bVar1) {
      if (uVar15 < uVar20) {
        if (tile_b_y < tile_c_y) {
          uVar11 = 0;
        }
        else {
          if (tile_b_y != tile_c_y) {
            uVar11 = 2;
          }
          if (tile_b_y <= tile_c_y) {
            uVar11 = 1;
          }
        }
      }
      else if (uVar15 == uVar20) {
        if (tile_a_y < tile_b_y) {
          if (uVar20 < uVar18) {
            uVar11 = 8;
          }
          else {
            if (uVar20 != uVar18) {
              uVar11 = 6;
            }
            if (uVar20 <= uVar18) {
              uVar11 = 7;
            }
          }
        }
        else if (uVar20 < uVar18) {
          uVar11 = 0xb;
        }
        else {
          uVar11 = 9;
          if (uVar20 <= uVar18) {
            uVar11 = 10;
          }
        }
      }
      else if (tile_b_y < tile_c_y) {
        uVar11 = 3;
      }
      else {
        if (tile_b_y != tile_c_y) {
          uVar11 = 5;
        }
        if (tile_b_y <= tile_c_y) {
          uVar11 = 4;
        }
      }
      bVar1 = true;
    }
    switch(uVar11) {
    case 0:
      break;
    case 1:
      goto LAB_0002c4a0;
    case 2:
      goto LAB_0002c4c8;
    case 3:
      goto LAB_0002c4f4;
    case 4:
LAB_0002c4a0:
      bVar21 = uVar19 == 0;
LAB_0002c498:
      if (!bVar21) {
        return 0;
      }
      goto switchD_0002c458_default;
    case 5:
      goto LAB_0002c510;
    case 6:
LAB_0002c4c8:
      if ((uVar19 == 0) || (uVar14 = uVar5, uVar19 == 2)) goto LAB_0002c4e8;
LAB_0002c4d8:
      if (uVar19 == 3) {
        return 0;
      }
      goto switchD_0002c458_default;
    case 7:
      goto LAB_0002c490;
    case 8:
LAB_0002c510:
      if (uVar19 == 0) goto LAB_0002c4e8;
      if (uVar19 == 1) {
        return 0;
      }
      uVar14 = uVar5;
      if (uVar19 == 2) goto LAB_0002c52c;
      goto switchD_0002c458_default;
    case 9:
      break;
    case 10:
LAB_0002c490:
      bVar21 = uVar19 == 2;
      goto LAB_0002c498;
    case 0xb:
LAB_0002c4f4:
      if ((uVar19 != 0) && (uVar14 = uVar5, uVar19 != 2)) goto LAB_0002c4d8;
      goto LAB_0002c52c;
    default:
      goto switchD_0002c458_default;
    }
    if (uVar19 == 0) {
LAB_0002c52c:
      if (3 < uVar14) {
        return 0;
      }
    }
    else {
      if (uVar19 == 1) {
        return 0;
      }
      uVar14 = uVar5;
      if (uVar19 == 2) {
LAB_0002c4e8:
        if (uVar14 < 4) {
          return 0;
        }
      }
    }
switchD_0002c458_default:
    puVar_link2 = puVar10 + 2;
    uVar14 = puVar10[2];
  }
  uVar11 = (uint)block_mask;
  if ((block_mask & 0x1000) == 0) {
    *out_a = 0x10 - (char)((int)(DAT_00101730 + 3) >> 2);
    return 1;
  }
  uVar15 = (byte)*puVar7 & 0xf0;
  uVar19 = uVar15;
  if (uVar15 <= (*pbVar8 & 0xf0)) {
    uVar19 = *pbVar8 & 0xf0;
  }
  uVar12 = (byte)*puVar9 & 0xf0;
  if (uVar15 <= uVar12) {
    uVar15 = uVar12;
  }
  uVar15 = uVar15 >> 4;
  bVar17 = (byte)uVar15;
  uVar12 = uVar19 >> 4;
  if (uVar19 >> 4 < (uint)span) {
    uVar12 = (uint)span;
  }
  if (((5 < bVar3) && (bVar3 < 10)) &&
     (bVar3 != (&DAT_000853cc)
               [(byte)(&DAT_000853c4)[(int)(((uVar18 - uVar20) * 3 - (uint)tile_b_y) + (uint)tile_c_y)]])) {
    uVar15 = uVar15 + 1;
  }
  uVar18 = uVar12;
  if (uVar12 <= uVar15) {
    uVar18 = uVar15;
  }
  if (0x7f < (uint)DAT_00101730 + uVar18 * 8) {
    return 0;
  }
  if (uVar15 + 1 < uVar12) {
    uVar18 = (uint)local_50;
    if (uVar18 + 1 < uVar12) {
      if (uVar18 < uVar15) {
        uVar18 = uVar15;
      }
      *out_a = (byte)uVar18;
      bVar6 = true;
      uVar18 = ((*out_b - uVar18) + uVar12) - 1;
      *out_b = (byte)uVar18;
      if ((uint)DAT_00101450 < (uVar18 & 0xff)) {
        return 0;
      }
LAB_0002c778:
      bVar1 = false;
    }
    else {
      bVar1 = true;
      uVar15 = uVar18;
      bVar17 = local_50;
    }
  }
  else {
    uVar18 = (uint)local_50;
    if (((uVar18 == 0) || (uVar12 < uVar18)) || (bVar1 = true, uVar18 + 1 < uVar12))
    goto LAB_0002c778;
  }
  if (uVar12 + 1 < uVar15) {
    return 0;
  }
  if (((uVar12 <= (byte)((byte)*puVar7 >> 4) + 1) || (bVar6)) || (bVar1)) {
    if (((uVar11 & 8 << (uVar4 & 0xff)) == 0) || (bVar1)) goto LAB_0002c8cc;
    uVar15 = 8 << (uVar2 >> 4 & 0xff);
    if ((uVar11 & uVar15) != 0) {
      return 0;
    }
    if (((uVar15 & wall_mask) != 0) &&
       (bVar3 = *out_b, *out_b = bVar3 + 2, DAT_00101450 < (byte)(bVar3 + 2))) {
      return 0;
    }
  }
  else {
    if ((uVar11 & 8 << (uVar4 & 0xff)) != 0) {
      return 0;
    }
    if (((8 << (uVar2 >> 4 & 0xff) & (uint)wall_mask) != 0) &&
       (bVar3 = *out_b, *out_b = bVar3 + 2, DAT_00101450 <= (byte)(bVar3 + 2))) {
      return 0;
    }
    if (uVar12 <= local_50 + 1) {
LAB_0002c8cc:
      *out_a = bVar17;
      return 1;
    }
    *out_a = (byte)uVar12;
    if (uVar12 < uVar15) {
      return 0;
    }
  }
  if (((DAT_00101404->movement_flags & 0x20) != 0) &&
      (bVar3 = *out_b, *out_b = bVar3 + 1, (byte)(bVar3 + 1) < DAT_00101450)) {
    DAT_00101440 = 1;
    return 1;
  }
  return 0;
}


// was FUN_00054a00.
void build_object_placement_snapshot(ushort *object, byte *snapshot)
{
  ushort uVar1;
  undefined2 uVar2;
  short sVar3;
  uint uVar4;
  int iVar5;
  byte bVar6;
  int iVar7;
  bool bVar8;
  
  bVar8 = true;
  iVar5 = (((uw_object_hdr_t *)object)->object_id) * 0xd;
  uVar2 = encode_object_slot_index(object);
  snapshot[0x23] = (byte)uVar2;
  snapshot[0x24] = (byte)((ushort)uVar2 >> 8);
  uVar1 = g_object_type_props[iVar5 / 0xd].size_weight;
  snapshot[0x18] = (byte)(uVar1 >> 4);
  snapshot[0x19] = (byte)(uVar1 >> 0xc);
  snapshot[0x1a] = (byte) g_object_type_props[iVar5 / 0xd].quality_flags >> 4 & 1;
  snapshot[0x1b] = 0;
  snapshot[0x1c] = 0;
  snapshot[0x1d] = 0;
  snapshot[0x16] = (byte)(g_object_type_props[iVar5 / 0xd].quality_owner_flags >> 5) & 0xf;
  bVar6 = g_object_type_props[iVar5 / 0xd].scale_flags;
  snapshot[0x20] = 0;
  snapshot[0x1f] = bVar6;
  uVar1 = ((uw_object_hdr_t *)object)->position_word;
  snapshot[0x27] = 0;
  snapshot[0x21] = 0;
  snapshot[0x22] = (byte)((((int)(short)uVar1 & 0xffffff80U) << 6) >> 8);
  snapshot[0x25] = g_object_type_props[iVar5 / 0xd].collision_radius;
  snapshot[0x26] = g_object_type_props[iVar5 / 0xd].height;
  *snapshot = ((uw_object_hdr_t *)object)->xpos;
  snapshot[1] = 0;
  snapshot[2] = (byte)(((uw_object_hdr_t *)object)->ypos);
  snapshot[3] = 0;
  snapshot[4] = ((uw_object_hdr_t *)object)->zpos;
  snapshot[5] = 0;
  if ((char *)object < DAT_002046c4) {
    iVar7 = (int)*(short *)snapshot + ((((uw_mobile_object_t *)object)->tile_x << 3));
    *snapshot = (byte)iVar7;
    snapshot[1] = (byte)((uint)iVar7 >> 8);
    iVar7 = (int)CONCAT11(snapshot[3],snapshot[2]) + ((((uw_mobile_object_t *)object)->tile_y << 3));
    snapshot[2] = (byte)iVar7;
    snapshot[3] = (byte)((uint)iVar7 >> 8);
    bVar6 = ((uw_mobile_object_t *)object)->full_heading;
    snapshot[0x21] = 0;
    snapshot[0x22] = bVar6;
    snapshot[0x28] = (byte)(1 << (((uw_mobile_object_t *)object)->movement_mode));
    iVar7 = ((byte)(((uw_mobile_object_t *)object)->pitch) - 0x10) * 0x40;
    snapshot[10] = (byte)iVar7;
    snapshot[0xb] = (byte)((uint)iVar7 >> 8);
    iVar7 = (uint)(((uw_mobile_object_t *)object)->gravity_flag) * -4;
    snapshot[0x10] = (byte)iVar7;
    snapshot[0x11] = (byte)((uint)iVar7 >> 8);
    snapshot[0x1e] = ((uw_mobile_object_t *)object)->hit_points;
    bVar8 = (((uw_object_hdr_t *)object)->type_flags & 0x1c0) == 0x40;
    if (!bVar8) {
      uVar2 = ((uw_projectile_object_t *)object)->precise_x;
      *snapshot = (byte)uVar2;
      snapshot[1] = (byte)((ushort)uVar2 >> 8);
      uVar2 = ((uw_projectile_object_t *)object)->precise_y;
      snapshot[2] = (byte)uVar2;
      snapshot[3] = (byte)((ushort)uVar2 >> 8);
      uVar2 = ((uw_projectile_object_t *)object)->precise_z;
      snapshot[4] = (byte)uVar2;
      snapshot[5] = (byte)((ushort)uVar2 >> 8);
    }
    uVar4 = ((uw_mobile_object_t *)object)->speed;
    snapshot[0x14] = (byte)uVar4;
    snapshot[0x15] = 0;
    if ((((((uw_object_hdr_t *)object)->type_flags & 0x1c0) == 0x40) ||
         (*(short *)(snapshot + 0x10) != 0 || *(short *)(snapshot + 10) != 0)) ||
        ((g_object_type_props[iVar5 / 0xd].flags & 8) != 0)) {
      snapshot[0x14] = (byte)(uVar4 * 0x2f);
      snapshot[0x15] = (byte)(uVar4 * 0x2f >> 8);
      if ((((uw_object_hdr_t *)object)->type_flags & 0x1c0) == 0x40) {
        snapshot[0x27] = 8;
      }
    }
    else {
      if ((*(int *)(snapshot + 0x1a) + 1) * 2 < (int)(short)uVar4) {
        iVar5 = (((uw_mobile_object_t *)object)->speed) *
                ((short)*(int *)(snapshot + 0x1a) * 4 + 0x29);
        snapshot[0x14] = (byte)iVar5;
        bVar6 = (byte)((uint)iVar5 >> 8);
      }
      else {
        snapshot[0x14] = 0;
        bVar6 = 0;
      }
      snapshot[0x15] = bVar6;
    }
  }
  else {
    snapshot[10] = 0;
    snapshot[0xb] = 0;
    snapshot[0x10] = 0;
    snapshot[0x11] = 0;
    snapshot[0x14] = 0;
    snapshot[0x15] = 0;
    snapshot[0x1e] = ((uw_object_hdr_t *)object)->quality;
    iVar5 = (int)CONCAT11(snapshot[1],*snapshot) + DAT_0010144c * 8;
    *snapshot = (byte)iVar5;
    snapshot[1] = (byte)((uint)iVar5 >> 8);
    iVar5 = (int)CONCAT11(snapshot[3],snapshot[2]) + DAT_00101454 * 8;
    snapshot[2] = (byte)iVar5;
    snapshot[3] = (byte)((uint)iVar5 >> 8);
  }
  if (bVar8) {
    sVar3 = ce_rand();
    iVar5 = ((int)sVar3 & 0x1fU) + *(short *)snapshot * 0x20;
    *snapshot = (byte)iVar5;
    snapshot[1] = (byte)((uint)iVar5 >> 8);
    sVar3 = ce_rand();
    iVar5 = ((int)sVar3 & 0x1fU) + *(short *)(snapshot + 2) * 0x20;
    snapshot[2] = (byte)iVar5;
    snapshot[3] = (byte)((uint)iVar5 >> 8);
    sVar3 = ce_rand();
    iVar5 = ((int)sVar3 & 7U) + *(short *)(snapshot + 4) * 8;
    snapshot[4] = (byte)iVar5;
    snapshot[5] = (byte)((uint)iVar5 >> 8);
  }
  snapshot[0x29] = 0;
  snapshot[0x2a] = 0;
}

/* Containers: the open-container/backpack view stack (open/close, nested levels, grid
   repopulate/scroll/refresh), auto-place/empty- into-world, container weight sum, and the
   equipped-item slot encode/decode. */
#include "headers/containers.h"
#include "headers/options.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>

/* Was a lone `undefined4` (4-byte) scalar holding a real heap pointer (an ce_malloc-allocated
   open-container tracking record, same class as g_current_container_record right above) -- every
   assignment to/from it... */
char *g_open_container_list;
/* Was a lone `undefined4` scalar, but indexed as `(&DAT_002028a0)[i]` for i up to 7
   (free_open_container_chain's icon save/restore swap) -- classic "undersized global used as an
   array" bug (same class as DAT_0024bfa0/DAT_000891b0 etc.)... */
/* Sizing-audit pass: real index range is i up to 7 (8 elements), per
   the comment above -- 32 bytes real need. Sized to 16 elements (64
   bytes) for headroom; down from 64 (256 bytes). */
static undefined4 DAT_002028a0_backing[16];
#define DAT_002028a0 DAT_002028a0_backing[0]
/* Sizing pass: its only use (empty_container_into_world's caller) is a read-only copy-until-NUL
   into a local scratch buffer -- a short message-prefix string, not indexed. */
 char DAT_00085c88_backing[128] = "The ";
/* Ghidra rendered the embedded space as an underscore, dropped the
   leading space and trailing newline. Real bytes at 0x8790c (ARM
   UU.exe .data): " is empty.\n". */
static char s_is_empty__0008790c[] = " is empty.\n";






// was FUN_00042a44
/* Was `int param_1` -- every call site passes g_current_container_record, a real 64-bit pointer,
   which this narrower type truncates to 32 bits -- same class as several other fixes this session
   (search "narrow local/parameter for a pointer"). */
void release_container_reference(char *container_link)
{
  ushort uVar1;
  uw_unaligned_word_t *puVar2;

  puVar2 = (uw_unaligned_word_t *)get_object_record_by_slot_index(*(uw_unaligned_word_t *)(container_link + 8) >> 6);
  uVar1 = ((uw_object_hdr_t *)puVar2)->type_flags;
  if (((uVar1 & 0xf) < 0xc) && ((uVar1 & 1) != 0)) {
    ((uw_object_hdr_t *)puVar2)->type_flags_low = ((char)(uVar1 & 0xf) - 1U ^ (byte)uVar1) & 0xf ^ (byte)uVar1;
    ((uw_object_hdr_t *)puVar2)->type_flags_high = (byte)(uVar1 >> 8);
  }
}



/* NOT YET FIXED (not on the crash path reached so far, but the same bug class as everywhere else in
   this file): the body below reads/writes through the literal `iVar1*4 + 0x202870`/`iVar10*4 +
   0x202870` -- a hardcoded original-binary address... */
// was FUN_00042aa8
void free_open_container_chain()
{
  char *_prev;

  if (g_current_container_record != 0) {
    /* Was reconstructing the "prev" chain link from the record's own byte-4..7 field (CONCAT13 of a
       3-byte + 1-byte read) -- that field is only ever a truncated 32-bit half of a real 64-bit
       pointer (see open_backpack_container's own record-widening fix). */
    _prev = *(char **)(g_current_container_record + 0x14);
    while (_prev != 0) {
      /* Dropped argument: release_container_reference's declared signature takes the open-container
         tracking record being freed -- g_current_container_record, the current one, before it's
         overwritten by _prev below... */
      release_container_reference((char *)g_current_container_record);
      LocalFree(g_current_container_record);
      g_current_container_record = _prev;
      _prev = *(char **)(g_current_container_record + 0x14);
    }
    g_open_container_list = 0;
    release_container_reference((char *)g_current_container_record);
    LocalFree(g_current_container_record);
    g_current_container_record = 0;
  }
}




// was FUN_00042b38
void close_backpack_container()
{
  int iVar1;
  undefined4 uVar2;
  
  if (g_current_container_record != 0) {
    free_open_container_chain();
    g_current_container_link = g_current_container_link & 0x3f;
    /* Clear the real "open container indicator" slot (widget 20, see DAT_00085c4c's own comment)
       now that nothing is open -- nothing else currently reads slot 19 outside that widget's own
       redraw, so this isn't load-bearing for the full-panel repaint below... */
    *(unsigned short *)(&g_equipped_items + DAT_00085c4c * 2) = 0;
    iVar1 = 0xb;
    do {
      (&g_backpack_widget_to_slot_plus1)[iVar1] = (char)iVar1;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < 0x13);
    iVar1 = 0xc;
    do {
      uVar2 = (&DAT_002028e8)[iVar1];
      /* Same hardcoded-original-address bug already fixed in
         open_backpack_container (0x202870 = &DAT_002028a0 - 0xc*4) -- a second,
         separate occurrence in this sibling function. */
      (&DAT_002028e8)[iVar1] = (&DAT_002028a0)[iVar1 + -0xc];
      (&DAT_002028a0)[iVar1 + -0xc] = uVar2;
      iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
    } while (iVar1 < 0x14);
    decrement_cursor_hide_depth();
    if ((((short)DAT_00201b60 == 1) || ((short)DAT_00201b60 == 4)) && (g_active_hud_panel == '\0')) {
      restore_captured_grtile_backdrop(DAT_002028ec);
      redraw_container_icon_slot();
    }
    cursor_show_idle_tick();
    DAT_002029a0 = 0;
    DAT_0020299c = 0;
    /* Missing piece, matching open_backpack_container's own fix: nothing here actually redraws the
       panel after leaving a container -- confirmed live... */
    g_blit_transparent_mode = 0;
    /* RESOLVED (was: body-shaped black cutout around the paperdoll after closing a container --
       user report: "closing a container draws black areas under some of the paper doll section"). */
    redraw_hud_panels();
    /* User report: "opening and closing a bag leaves the container icon behind." This used to need
       a hand-added verbatim pixel restore here (g_container_icon_backup_grtile) because the
       container icon was this project's own hack... */
    redraw_inventory_widget_range(0xc,0x13);
    redraw_inventory_widget_range(0x14,0x14);
    redraw_inventory_widget(0x15);
    redraw_inventory_widget(0x16);
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00042c5c
void leave_nested_container_level()
{
  /* Was `int iVar1;` -- resolve_object_link returns a real 64-bit pointer, truncated to 32 bits by
     this narrower type (same class as dozens of other fixes this session), then immediately
     dereferenced via `*(ushort*)(iVar1+6)` below -- a wild-pointer crash. */
  char *iVar1;
  char *_old;

  if (g_open_container_list != 0) {
    /* Was `*(int *)(g_current_container_record + 4) == 0` -- the legacy byte-4..7 "prev" field is
       only ever a truncated 32-bit half of a real 64-bit pointer (see open_backpack_container's own
       record- widening fix); check the real, untruncated prev pointer at +0x14 instead... */
    if (*(char **)(g_current_container_record + 0x14) == 0) {
      close_backpack_container();
    }
    else {
      /* Same dropped argument as free_open_container_chain's own fix -- forward the
         current g_current_container_record before it's overwritten below. */
      release_container_reference((char *)g_current_container_record);
      /* Was `g_current_container_record = *(undefined1 **)(g_current_container_record + 4);
         LocalFree();` -- walked the same truncated legacy "prev" field (wild pointer the moment a
         real second record existed to walk to), then freed with NO argument at all... */
      _old = g_current_container_record;
      g_current_container_record = *(char **)(g_current_container_record + 0x14);
      LocalFree(_old);
      *g_current_container_record = 0;
      g_current_container_record[1] = 0;
      g_current_container_record[2] = 0;
      g_current_container_record[3] = 0;
      /* This record is the tail again now that its child was just freed. */
      *(char **)(g_current_container_record + 0xc) = 0;
      g_current_container_link = *(undefined2 *)(g_current_container_record + 8);
      iVar1 = (char *)resolve_object_link(&g_current_container_link);
      GRID_FIRST_SLOT = (GRID_FIRST_SLOT ^ ((uw_object_hdr_t *)iVar1)->link_word) & 0x3f ^ ((uw_object_hdr_t *)iVar1)->link_word;
      /* User QA: "the container indicator does not update to show the current container icon" after
         popping back to a parent -- this is now the real widget 20 (see DAT_00085c4c's own
         comment)... */
      repopulate_container_grid_slots();
      refresh_container_view();
      /* The real "open container indicator" (widget 20, see DAT_00085c4c's own comment): point slot
         19 at the SAME object g_current_container_link already refers to (just re-resolved above,
         now the parent we popped back to) -- same "second copy of the same link value... */
      *(unsigned short *)(&g_equipped_items + DAT_00085c4c * 2) = g_current_container_link;
      redraw_inventory_widget_range(0x14,0x14);
    }
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00042d70
void refresh_container_view()
{
  short sVar1;
  /* ARM FUN_00042d70 keeps this object/link address in r0 while following
     contents (+6) and hidden objects' sibling links (+4). Ghidra's int
     truncates the pointer on 64-bit hosts; keep the original traversal. */
  uw_object_hdr_t *iVar2;
  uw_link_word_t *link_cursor;

  decrement_cursor_hide_depth();
  redraw_inventory_widget_range(0xc,0x13);
  iVar2 = resolve_object_link(&g_current_container_link);
  link_cursor = uw_link_word_ptr(iVar2);
  /* byte 1 bit 6 of the type word = bit 14, invisible */
  while ((iVar2 = resolve_object_link(link_cursor), iVar2 != 0 && (iVar2->invisible != 0))) {
    link_cursor = uw_chain_word_ptr(iVar2);
  }
  sVar1 = encode_object_slot_index(iVar2);
  DAT_002029a0 = (uint)((uint)(GRID_FIRST_SLOT >> 6) != (int)sVar1);
  DAT_0020299c = (uint)((SLOT_LINK(0x1b) & 0xffc0) != 0);
  redraw_inventory_widget(0x15);
  redraw_inventory_widget(0x16);
  cursor_show_idle_tick();
}



// was FUN_00042e30
void repopulate_container_grid_slots()
{
  undefined2 uVar1;
  byte bVar2;
  /* Was `int iVar3;`/`int iVar5;` for the parts of this function where they hold real
     resolve_object_link() pointers... */
  uw_object_hdr_t *pContents;
  uw_object_hdr_t *_pMatch;
  uint uVar4;
  int iVar5;
  int iVar6;

  iVar6 = 0x14;
  do {
    if ((*(ushort *)(&g_equipped_items + iVar6 * 2) & 0xffc0) != 0) break;
    iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
  } while (iVar6 < 0x1c);
  pContents = resolve_object_link(&g_current_container_link);
  pContents = resolve_object_link(uw_link_word_ptr(pContents));
  if ((short)iVar6 < 0x1c) {
    do {
      _pMatch = resolve_object_link(&SLOT_LINK((short)iVar6));
      if (pContents == _pMatch) {
        iVar6 = 0x14;
        do {
          uVar4 = encode_object_slot_index(pContents);
          iVar5 = (short)iVar6 * 2;
          (&g_equipped_items)[iVar5] = (&g_equipped_items)[iVar5] & 0x3f | (byte)((uVar4 & 0x3ff) << 6);
          (&DAT_00202951)[iVar5] = (char)((uVar4 << 0x16) >> 0x18);
          if (pContents != 0) {
            if (pContents->invisible != 0) {
              iVar6 = ((short)iVar6 + -1) * 0x10000 >> 0x10;
            }
            pContents = resolve_object_link(uw_chain_word_ptr(pContents));
          }
          iVar6 = iVar6 + 1;
        } while (iVar6 * 0x10000 >> 0x10 < 0x1c);
        return;
      }
      pContents = resolve_object_link(uw_chain_word_ptr(pContents));
    } while (pContents != 0);
    /* User QA: "closing a nested container [is] stuck on [the child's] contents" -- confirmed the
       real bug here. */
    pContents = resolve_object_link(&g_current_container_link);
    pContents = resolve_object_link(uw_link_word_ptr(pContents));
  }
  iVar6 = 0x14;
  do {
    uVar4 = encode_object_slot_index(pContents);
    iVar5 = (short)iVar6 * 2;
    (&g_equipped_items)[iVar5] = (&g_equipped_items)[iVar5] & 0x3f | (byte)((uVar4 & 0x3ff) << 6);
    (&DAT_00202951)[iVar5] = (char)((uVar4 << 0x16) >> 0x18);
    if (pContents != 0) {
      if (pContents->invisible != 0) {
        iVar6 = ((short)iVar6 + -1) * 0x10000 >> 0x10;
      }
      pContents = resolve_object_link(uw_chain_word_ptr(pContents));
    }
    iVar6 = iVar6 + 1;
  } while (iVar6 * 0x10000 >> 0x10 < 0x1c);
  while (pContents != 0) {
    iVar6 = 0x14;
    do {
      iVar5 = iVar6 * 2;
      uVar1 = *(undefined2 *)((char *)&g_backpack_slot_table[0] + 8 + iVar5); /* was the literal original address 0x202958 + iVar5 */
      bVar2 = (byte)uVar1;
      (&g_equipped_items)[iVar5] = ((&g_equipped_items)[iVar5] ^ bVar2) & 0x3f ^ bVar2;
      (&DAT_00202951)[iVar5] = (char)((ushort)uVar1 >> 8);
      iVar6 = (iVar6 + 1) * 0x10000 >> 0x10;
    } while (iVar6 < 0x18);
    for (; iVar5 = (int)(short)iVar6, iVar5 < 0x1c; iVar6 = iVar6 + 1) {
      uVar4 = encode_object_slot_index(pContents);
      (&g_equipped_items)[iVar5 * 2] =
           (&g_equipped_items)[iVar5 * 2] & 0x3f | (byte)((uVar4 & 0x3ff) << 6);
      (&DAT_00202951)[iVar5 * 2] = (char)((uVar4 << 0x16) >> 0x18);
      if (pContents != 0) {
        if (pContents->invisible != 0) {
          iVar6 = (iVar5 + -1) * 0x10000 >> 0x10;
        }
        pContents = resolve_object_link(uw_chain_word_ptr(pContents));
      }
    }
  }
}



// was FUN_00043100
void open_backpack_container(short container_slot)
{
  int iVar1;
  int iVar2;
  ushort uVar3;
  short sVar4;
  byte bVar5;
  undefined4 *puVar6;
  uw_unaligned_word_t *puVar7;
  undefined4 uVar8;
  undefined4 *puVar9;
  int iVar10;
  int iVar11;
  uint uVar12;
  ushort *puVar13;
  /* iVar10/iVar11 are reused elsewhere in this function as plain int loop counters (0xc..0x13 etc)
     -- real uses, left alone -- but the container-open sequence below also stored real 64-bit
     resolve_object_link() pointers into them... */
  uw_object_hdr_t *puVar14;
  uw_object_hdr_t *puVar15;
  
  iVar1 = (int)container_slot;
  puVar13 = (ushort *)(&g_equipped_items + iVar1 * 2);
  puVar7 = (uw_unaligned_word_t *)resolve_object_link(puVar13);
  uVar3 = ((uw_object_hdr_t *)puVar7)->type_flags;
  if (((uVar3 & 0x1c0) == 0x80) && ((uVar3 & 0x30) == 0)) {
    if ((uVar3 & 0xf) == 0xf) {
      set_hud_status_value(6,1);
    }
    else {
      if (g_open_container_list == (char *)0x0) {
        decrement_cursor_hide_depth();
        if ((((short)DAT_00201b60 == 1) || ((short)DAT_00201b60 == 4)) && (g_active_hud_panel == '\0')) {
          draw_sprite_by_id(0x2097,0xec,0x51,0x29,0x54);
        }
        /* Was also followed by a hand-added `set_draw_color(0);
           rect_fill_or_save_restore(0xf0,0x50,0x13c,0x76);` -- a flat dark rectangle painted over
           the whole 8-cell grid area... */
        if (DAT_002028a0 == 0) {
          iVar10 = 0xc;
          do {
            iVar11 = iVar10 * 0xe;
            uVar8 = grtile_alloc_registered((&g_inv_hotspot_dirty_w)[iVar11],(uint)(byte)(&g_inv_hotspot_dirty_h)[iVar11] << 1);
            sVar4 = (&g_inv_hotspot_draw_y)[iVar10 * 7];
            (&DAT_002028a0)[iVar10 + -0xc] = uVar8;
            /* Was a hardcoded original-binary literal address (0x202870 = &DAT_002028a0 - 0xc*4 in
               the original 32-bit address space) instead of the general symbolic form the write
               just above already uses for this same array... */
            capture_framebuffer_rect_to_grtile((&DAT_002028a0)[iVar10 + -0xc],
                         (int)(short)(&g_inv_hotspot_draw_x)[iVar10 * 7],(int)sVar4,(&g_inv_hotspot_dirty_w)[iVar11],
                         (&g_inv_hotspot_dirty_h)[iVar11]);
            iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
          } while (iVar10 < 0x14);
        }
        /* Widget 20's own background-save, same role/pattern as the g_container_icon_backup_grtile
           allocation above and the DAT_002028a0 loop just above that (for widgets 12-19)... */
        if (DAT_00202938 == 0) {
          DAT_00202938 = grtile_alloc_registered((&g_inv_hotspot_dirty_w)[20 * 0xe],
                       (uint)(byte)(&g_inv_hotspot_dirty_h)[20 * 0xe] << 1);
          capture_framebuffer_rect_to_grtile(DAT_00202938,
                       (int)(short)(&g_inv_hotspot_draw_x)[20 * 7],(int)(short)(&g_inv_hotspot_draw_y)[20 * 7],
                       (&g_inv_hotspot_dirty_w)[20 * 0xe],(&g_inv_hotspot_dirty_h)[20 * 0xe]);
        }
        cursor_show_idle_tick();
        /* Was a hardcoded original-binary literal address (0x85c30) -- same bug class as this
           function's own 0x202870 fix just above -- but unlike that one... */
        iVar10 = 0xc;
        do {
          uVar8 = (&DAT_002028e8)[iVar10];
          /* Same hardcoded-original-address bug as this function's
             other 0x202870 fix above (0x202870 = &DAT_002028a0 -
             0xc*4). */
          (&DAT_002028e8)[iVar10] = (&DAT_002028a0)[iVar10 + -0xc];
          (&DAT_002028a0)[iVar10 + -0xc] = uVar8;
          iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
        } while (iVar10 < 0x14);
      }
      else {
        puVar9 = (undefined4 *)g_open_container_list;
        do {
          if (((*(ushort *)(puVar9 + 2) ^ *puVar13) & 0xffc0) == 0) {
            close_backpack_container();
            return;
          }
          /* Was `puVar9 = (undefined4 *)*puVar9;` -- walking this chain "forward" via the record's
             own byte-0..3 "next" field, which open_backpack_container's own record-creation code
             below only ever wrote as a truncated 32-bit half of a real 64-bit pointer... */
          puVar9 = *(undefined4 **)((char *)puVar9 + 0xc);
        } while (puVar9 != (undefined4 *)0x0);
        if (iVar1 < 0xb) {
          free_open_container_chain();
        }
      }
      /* User QA (historical, now resolved by the real widget-20 mechanism below rather than a
         dedicated draw call here): "open container indicator slot does not show the 'open' version
         of a container like it should" + "opening a nested container does not update to show... */
      /* Record grew from 0xc (12) to 0x1c (28) bytes: the original 12-byte layout (0-3 next / 4-7
         prev / 8-9 container-link / 10-11 weight) only ever stored its next/prev CHAIN LINKS as
         4-byte fields -- correct on the original 32-bit target where a pointer IS 4 bytes... */
      puVar9 = (undefined4 *)ce_malloc(0x1c);
      if (puVar9 != (undefined4 *)0x0) {
        if (g_open_container_list == (char *)0x0) {
          g_open_container_list = (char *)puVar9;
          g_current_container_record = (char *)puVar9;
          *(undefined1 *)(puVar9 + 1) = 0;
          *(undefined1 *)((char *)puVar9 + 5) = 0;
          *(undefined1 *)((char *)puVar9 + 6) = 0;
          *(undefined1 *)((char *)puVar9 + 7) = 0;
          *(char **)((char *)puVar9 + 0xc) = 0;
          *(char **)((char *)puVar9 + 0x14) = 0;
        }
        else {
          /* The legacy 4-byte next/prev fields at +0/+4 used to be written here as truncated
             halves of these 64-bit pointers; nothing reads them any more (the chain is walked via
             the full-width links at +0xc/+0x14 below), so they are no longer stored. */
          /* Real (untruncated) chain links: the OLD current record's
             "next" now really points at the new one, and the new one's
             "prev" really points back at the old one. */
          *(char **)((char *)g_current_container_record + 0xc) = (char *)puVar9;
          *(char **)((char *)puVar9 + 0x14) = g_current_container_record;
          *(char **)((char *)puVar9 + 0xc) = 0;
          /* Was `g_current_container_record = (undefined4 *)*g_current_container_record;` --
             reading back the truncated 4-byte "next" field this same block just wrote 4 lines
             above... */
          g_current_container_record = (char *)puVar9;
        }
        *(undefined1 *)g_current_container_record = 0;
        *(undefined1 *)((char *)g_current_container_record + 1) = 0;
        *(undefined1 *)((char *)g_current_container_record + 2) = 0;
        *(undefined1 *)((char *)g_current_container_record + 3) = 0;
        *(undefined1 *)((char *)g_current_container_record + 10) = 0;
        *(undefined1 *)((char *)g_current_container_record + 0xb) = 0;
        uVar3 = *puVar13;
        bVar5 = (byte)uVar3;
        /* Was `*(byte *)(g_current_container_record + 2) = ...` -- byte offset 2, not 8.
           g_current_container_record is declared `char *` (retyped for 64-bit pointer safety, same
           class as this whole session's other fixes), so "+2" here means literal byte offset 2... */
        *(byte *)((char *)g_current_container_record + 8) =
             (*(byte *)((char *)g_current_container_record + 8) ^ bVar5) & 0x3f ^ bVar5;
        *(char *)((char *)g_current_container_record + 9) = (char)(uVar3 >> 8);
        /* Was `g_current_container_link = (g_current_container_link ^
           (ushort*)(g_current_container_record+2)) & 0x3f ^
           (ushort*)(g_current_container_record+2)`... */
        g_current_container_link = uVar3;
        puVar14 = resolve_object_link(&g_current_container_link);
        puVar15 = resolve_object_link(uw_link_word_ptr(puVar14));
        sum_container_weight(uw_link_word_ptr(puVar14),(short *)((char *)g_current_container_record + 10));
        iVar10 = 0x14;
        do {
          uVar12 = encode_object_slot_index(puVar15);
          iVar2 = (int)(short)iVar10;
          (&g_equipped_items)[iVar2 * 2] =
               (&g_equipped_items)[iVar2 * 2] & 0x3f | (byte)((uVar12 & 0x3ff) << 6);
          (&DAT_00202951)[iVar2 * 2] = (char)((uVar12 << 0x16) >> 0x18);
          if (puVar15 != NULL) {
            if (puVar15->invisible != 0) {
              iVar10 = (iVar2 + -1) * 0x10000 >> 0x10;
            }
            puVar15 = resolve_object_link(uw_chain_word_ptr(puVar15));
          }
          iVar10 = iVar10 + 1;
        } while (iVar10 * 0x10000 >> 0x10 < 0x1c);
        /* Missing piece, not present anywhere in the decompiled body: the container's contents are
           now sitting in slots 20-27, but nothing ever repointed the 8 visible grid widgets (12-19)
           at them -- they still map to 11-18... */
        for (iVar10 = 0xc; iVar10 < 0x14; iVar10 = iVar10 + 1) {
          (&g_backpack_widget_to_slot)[iVar10] = (char)(iVar10 + 8);
        }
        redraw_inventory_widget_range(0xc,0x13);
        puVar7 = (uw_unaligned_word_t *)resolve_object_link(&g_current_container_link);
        uVar3 = ((uw_object_hdr_t *)puVar7)->type_flags;
        if (((uVar3 & 0xf) < 0xc) && ((uVar3 & 1) == 0)) {
          ((uw_object_hdr_t *)puVar7)->type_flags_low = ((char)(uVar3 & 0xf) + 1U ^ (byte)uVar3) & 0xf ^ (byte)uVar3;
          ((uw_object_hdr_t *)puVar7)->type_flags_high = (byte)(uVar3 >> 8);
        }
        refresh_container_view();
        /* The real "open container indicator" (widget 20, see DAT_00085c4c's own comment): point
           slot 19 at the same object g_current_container_link was just set to a few lines above
           (this container's own link). */
        *(unsigned short *)(&g_equipped_items + DAT_00085c4c * 2) = g_current_container_link;
        redraw_inventory_widget_range(0x14,0x14);
        if ((char)(&g_backpack_slot_to_widget)[iVar1] < '\v') {
          redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar1]);
        }
      }
    }
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00043614 -- container-grid scroll up, dispatched from handle_object_drop_target's
// `iVar2==0x15` case (widget 21's own real click rect, see g_inventory_hotspot_table's comment)...
void scroll_container_grid_up()
{
  if ((g_open_container_list != 0) && (DAT_0020299c != 0)) {
    GRID_FIRST_SLOT = SLOT_LINK(0x18);
    repopulate_container_grid_slots();
    refresh_container_view();
  }
}



// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_0004365c -- container-grid scroll down, the DAT_002029a0
// ("can scroll down") counterpart to scroll_container_grid_up, same
// dispatch/redraw pattern via widget 22.
void scroll_container_grid_down()
{
  short sVar1;
  uw_object_hdr_t *iVar2;
  uw_object_hdr_t *iVar3;
  uw_object_hdr_t *iVar4;
  int iVar5;

  if ((g_open_container_list != 0) && (DAT_002029a0 != 0)) {
    /* Was `resolve_object_link(g_current_container_record + 8)` -- a tracking record lives outside
       the level's object arena resolve_object_link bounds-checks against... */
    g_current_container_link = *(undefined2 *)(g_current_container_record + 8);
    iVar2 = resolve_object_link(&g_current_container_link);
    iVar3 = resolve_object_link(uw_link_word_ptr(iVar2));
    iVar4 = resolve_object_link(&GRID_FIRST_SLOT);
    iVar2 = iVar3;
    if (iVar3 != iVar4) {
      do {
        iVar3 = iVar2;
        iVar5 = 0;
        iVar2 = iVar3;
        do {
          iVar2 = resolve_object_link(uw_chain_word_ptr(iVar2));
          if (iVar2 == 0) {
            return;
          }
          if (iVar2 == iVar4) goto LAB_00043700;
          iVar5 = iVar5 + 1;
        } while (iVar5 * 0x10000 >> 0x10 < 4);
      } while( true );
    }
LAB_00043700:
    sVar1 = encode_object_slot_index(iVar3);
    GRID_FIRST_SLOT = GRID_FIRST_SLOT & 0x3f | sVar1 << 6;
    repopulate_container_grid_slots();
    refresh_container_view();
  }
}



// WARNING: Removing unreachable block (ram,0x00043adc)

// was FUN_00043734
int auto_place_in_container(void *object_ptr, short slot)
{
  ushort *object = (ushort *)object_ptr;
  uw_object_hdr_t *record = (uw_object_hdr_t *)object_ptr; /* same record, typed for the object API */
  byte bVar1;
  ushort uVar2;
  short sVar3;
  uw_object_hdr_t *puVar4;
  undefined4 uVar5;
  uw_object_hdr_t *puVar6;
  uw_link_word_t *stack_link;
  uint uVar7;
  int iVar8;
  char *iVar9;
  int iVar10;
  bool bVar11;
  short local_28;
  ushort _parentLink;

  bVar11 = false;
  /* Dropped arguments -- same bare call as place_object_in_backpack_slot's identical
     fix just above (search "check_object_fits_in_slot's declared signature"). */
  sVar3 = check_object_fits_in_slot(object, slot);
  if (sVar3 == 0) {
LAB_000438ac:
    uVar5 = 0;
  }
  else {
    iVar10 = (int)slot;
    /* Both `g_current_container_record + 4` reads below were the legacy 4-byte "prev" field -- only
       ever a truncated half of a real 64-bit pointer (see open_backpack_container's record-widening
       comment); walk the real +0x14 pointer instead. */
    if ((iVar10 == 0x13) && (*(char **)(g_current_container_record + 0x14) == 0)) {
      iVar10 = 0xb;
      do {
        if ((*(ushort *)(&g_equipped_items + iVar10 * 2) & 0xffc0) == 0) {
          bVar11 = true;
          break;
        }
        iVar10 = (iVar10 + 1) * 0x10000 >> 0x10;
      } while (iVar10 < 0x13);
      local_28 = (short)iVar10;
      puVar4 = &g_player_object->hdr;
      if (0x12 < local_28) goto LAB_000438ac;
LAB_0004386c:
      iVar9 = 0;
    }
    else {
      if ((iVar10 == 0x13) &&
         (iVar9 = *(char **)(g_current_container_record + 0x14), iVar9 != 0)) {
        /* resolve_object_link rejects a pointer to an ordinary stack local (confirmed live:
           `_parentLink` as a plain local always resolved to NULL, crashing the very next
           dereference) -- it only accepts globals... */
        _parentLink = g_current_container_link;
        g_current_container_link = *(ushort *)(iVar9 + 8);
        puVar4 = resolve_object_link(&g_current_container_link);
        g_current_container_link = _parentLink;
      }
      else {
        puVar4 = resolve_object_link(&SLOT_LINK(iVar10));
        iVar9 = g_current_container_record;
        if (iVar10 < 0x14) {
          local_28 = 0;
          goto LAB_0004386c;
        }
      }
      local_28 = 0;
    }
    if ((puVar4->object_id) == 0x8f) {
      /* Real ARM binary calls place_rune_in_bag() with 0 args here too (confirmed via Ghidra
         decompile of the real auto_place_in_container at 0x43734) -- same "leftover register"
         reliance already found 3 times this session... */
      iVar10 = place_rune_in_bag(record);
      if (iVar10 == 0) {
        print_scroll_message_by_id(0xf7);
        goto LAB_000438ac;
      }
    }
    else {
      iVar10 = calculate_object_weight(record);
      g_player_carry_weight = g_player_carry_weight + (short)iVar10;
      /* Legacy truncated "prev" walk -- same fix as place_object_in_backpack_slot's sibling copy
         (search "still broken for genuine container nesting"). */
      for (; iVar9 != 0; iVar9 = *(char **)(iVar9 + 0x14)) {
        iVar8 = *(short *)(iVar9 + 10) + iVar10;
        *(char *)(iVar9 + 10) = (char)iVar8;
        *(char *)(iVar9 + 0xb) = (char)((uint)iVar8 >> 8);
      }
      stack_link = uw_link_word_ptr(puVar4);
      while (puVar6 = resolve_object_link(stack_link), puVar6 != NULL) {
        iVar10 = objects_can_stack(record,puVar6);
        if (iVar10 != 0) {
          uVar2 = puVar6->type_flags;
          if ((uVar2 & 0x8000) == 0) {
            puVar6->type_flags_low = (char)uVar2;
            puVar6->type_flags_high = (byte)(uVar2 >> 8) | 0x80;
            puVar6->link_word_low = (byte)puVar6->link_word & 0x3f | 0x40;
            puVar6->link_word_high = 0;
          }
          bVar1 = (byte)*object;
          bVar11 = (*object & 0x8000) != 0;
          if (bVar11) {
            bVar1 = (byte)object[3];
          }
          uVar7 = (uint)bVar1;
          if (bVar11) {
            uVar7 = (uint)(ushort)(((uw_object_hdr_t *)object)->link);
          }
          if (!bVar11) {
            uVar7 = 1;
          }
          iVar10 = ((ushort)puVar6->link_word & 0xffc0) +
                   uVar7 * 0x40;
          bVar1 = (byte)puVar6->chain_word;
          puVar6->link_word_low = (byte)iVar10 ^ (byte)puVar6->link_word & 0x3f;
          puVar6->link_word_high = (char)((uint)iVar10 >> 8);
          puVar6->chain_word_low =
               (bVar1 ^ (byte)((int)(((byte)object[2] & 0x3f) +
                                    (puVar6->quality)) >> 1)
               ) & 0x3f ^ bVar1;
          puVar6->chain_word_high = puVar6->chain_word_high;
          free_object_slot(record);
          goto LAB_000439a0;
        }
        stack_link = uw_chain_word_ptr(puVar6);
      }
      object_list_append_tail(uw_link_word_ptr(puVar4),record);
      if (bVar11) {
        uVar7 = encode_object_slot_index(record);
        iVar10 = (int)local_28;
        (&g_equipped_items)[iVar10 * 2] =
             (&g_equipped_items)[iVar10 * 2] & 0x3f | (byte)((uVar7 & 0x3ff) << 6);
        (&DAT_00202951)[iVar10 * 2] = (char)((uVar7 << 0x16) >> 0x18);
      }
LAB_000439a0:
      if ((g_current_container_record == 0) ||
         (sVar3 = encode_object_slot_index(puVar4), (int)sVar3 != (uint)(*(ushort *)(g_current_container_record + 8) >> 6))) {
        iVar10 = update_carry_weight_display(1);
        if (iVar10 != 0) {
          select_active_font(s_font5x6p_sys_0008430c);
        }
      }
      else {
        repopulate_container_grid_slots();
        redraw_inventory_widget_range(0xc,0x13);
      }
      uVar2 = *object;
      if ((0x93 < (uVar2 & 0x1ff)) && ((uVar2 & 0x1ff) < 0x98)) {
        bVar1 = (byte)uVar2;
        *(byte *)object = (bVar1 - 4 ^ bVar1) & 0xf ^ bVar1;
        *(byte *)((char *)object + 1) = (byte)(uVar2 >> 8);
        set_ambient_bias_without_light(0);
      }
    }
    uVar5 = 1;
  }
  return uVar5;
}




// was FUN_00043d40
/* was `undefined4` -- truncated the real object-record pointer (passed straight to
   resolve_object_link, and to itself recursively as `puVar2+2`), latent until that call started
   actually using its argument */
void sum_container_weight(uw_link_word_t *link_field, short *total_weight)
{
  ushort uVar1;
  uw_object_hdr_t *puVar2;
  
  puVar2 = resolve_object_link(link_field);
  while( true ) {
    if (puVar2 == NULL) {
      return;
    }
    if ((puVar2->is_quant == 0) || ((puVar2->link & 0x200) != 0)) {
      uVar1 = 1;
    }
    else {
      uVar1 = puVar2->link;
    }
    *total_weight = (g_object_type_props[(puVar2->object_id)].unit_weight) * uVar1 + *total_weight;
    sum_container_weight(uw_chain_word_ptr(puVar2),total_weight);
    if (puVar2->is_quant != 0) break;
    puVar2 = resolve_object_link(uw_link_word_ptr(puVar2));
  }
}



/* Same pointer-truncation bug class as alloc_save_record_slot/save_record_slot_from_index just
   below (their own comment has the full writeup) -- iVar4 was `int`... */
// was FUN_000441d8
void encode_equipped_item_index(uw_link_word_t *item_link, uw_link_word_t *out_index)
{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  byte *iVar4;
  int iVar5;

  iVar5 = 0;
  do {
    iVar1 = iVar5 * 2;
    if (((*(ushort *)(&g_equipped_items + iVar1) ^ *item_link) & 0xffc0) == 0) {
      uVar2 = *out_index;
      iVar4 = iVar1 + g_save_equip_table_ptr;
      bVar3 = (byte)uVar2;
      *(byte *)(iVar1 + g_save_equip_table_ptr) = (*(byte *)(iVar1 + g_save_equip_table_ptr) ^ bVar3) & 0x3f ^ bVar3;
      *(char *)(iVar4 + 1) = (char)((ushort)uVar2 >> 8);
    }
    iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
  } while (iVar5 < 0x13);
}




// was FUN_000442dc
void decode_equipped_item_index(uw_link_word_t *saved_index, uw_link_word_t *out_link)
{
  int iVar1;
  undefined2 uVar2;
  byte bVar3;
  byte *iVar4;
  int iVar5;
  
  iVar4 = g_save_equip_table_ptr;
  iVar5 = 0;
  do {
    iVar1 = iVar5 * 2;
    if (((*(ushort *)(iVar1 + iVar4) ^ *out_link) & 0xffc0) == 0) {
      uVar2 = *saved_index;
      bVar3 = (byte)uVar2;
      (&g_equipped_items)[iVar1] = ((&g_equipped_items)[iVar1] ^ bVar3) & 0x3f ^ bVar3;
      (&DAT_00202951)[iVar1] = (char)((ushort)uVar2 >> 8);
    }
    iVar5 = (iVar5 + 1) * 0x10000 >> 0x10;
  } while (iVar5 < 0x13);
}




/* Was `resolve_object_link(...); return 0;` -- computing the real object-record pointer and then
   discarding it in favor of a hardcoded 0, same "dropped return value" idiom already fixed for
   next_input_event elsewhere in this file. */
// was FUN_00045054
uw_object_hdr_t *get_equipped_item_at_slot(short slot)
{
  return resolve_object_link(&SLOT_LINK(slot));
}




// was FUN_00079144 -- walks a container's (param_1) contents link chain and places each item into
// the world near the container's own position (via place_object_in_world), clearing param_1's own
// contents-head link as it goes. param_2, when non-zero...
int empty_container_into_world(void *container_ptr, short clear_flag)
{
  ushort *container = (ushort *)container_ptr;
  uw_object_hdr_t *record = (uw_object_hdr_t *)container_ptr; /* same record, typed for the object API */
  ushort uVar1;
  ushort uVar2;
  byte bVar3;
  /* Was `int iVar4;` -- truncated resolve_object_link's real 64-bit pointer return, then handed
     straight to place_object_in_world's own param_4 (already `char *`, fixed in an earlier pass --
     see its own comment) as a garbage-high-bits address. */
  uw_object_hdr_t *iVar4;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  uint uVar8;
  uw_object_hdr_t *pNextLink;

  if ((container[3] & 0xffc0) == 0) {
    uVar6 = 0;
  }
  else {
    iVar4 = resolve_object_link(uw_link_word_ptr(record));
    *(byte *)(container + 3) = (byte)container[3] & 0x3f;
    *(undefined1 *)((char *)container + 7) = 0;
    iVar5 = object_ptr_in_arena(record);
    if (iVar5 == 0) {
      uVar7 = (uint)DAT_002020a0;
      uVar8 = (uint)DAT_002020a4;
    }
    else {
      uVar7 = (uint)(container[0xb] >> 10);
      uVar8 = (container[0xb] & 0x3f0) >> 4;
    }
    uVar1 = container[1];
    while (iVar4 != 0) {
      pNextLink = resolve_object_link(uw_chain_word_ptr(iVar4));
      if ((clear_flag != 0) && (g_object_type_props[*container & 0x1ff].can_have_owner)) {
        uVar2 = container[3];
        bVar3 = (byte)uVar2;
        *(byte *)(container + 3) = (bVar3 ^ (byte)clear_flag) & 0x3f ^ bVar3;
        *(char *)((char *)container + 7) = (char)(uVar2 >> 8);
      }
      place_object_in_world((uint)(uVar1 >> 0xd) + uVar7 * 8,((uVar1 & 0x1c00) >> 10) + uVar8 * 8,
                   uVar1 & 0x7f,iVar4,6,0);
      iVar4 = pNextLink;
    }
    uVar6 = 1;
  }
  return uVar6;
}




// was FUN_0007c84c -- thin wrapper around empty_container_into_world: empties param_1's contents,
// and if it turns out param_1 had nothing to empty (return 0) and param_2 is non-zero (callers pass
// whether the container belongs to the player)...
void try_empty_container(uw_object_hdr_t *container, int owned_by_player)
{
  char *wptr_60040;
  char cVar1;
  int iVar2;
  char *pcVar3;
  byte bVar4;
  char acStack_5c [80];


  bVar4 = 0;
  if (g_object_type_props[container->object_id].can_have_owner) {
    bVar4 = container->owner;
  }
  iVar2 = empty_container_into_world(container,bVar4);
  if ((iVar2 == 0) && (owned_by_player != 0)) {
    /* Ghidra couldn't correlate this copy loop's destination with a real stack slot (see
       fix_stack_copy_loops.py) and invented a 0x85c88-byte acStack_85ce4 for it; the "The " prefix
       is really copied into acStack_5c, which the ce_strlen/build_object_display_name below extend. */
    pcVar3 = &DAT_00085c88;
    wptr_60040 = acStack_5c;
    do {
      cVar1 = *pcVar3;
      *wptr_60040 = cVar1; wptr_60040 = wptr_60040 + 1;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    iVar2 = ce_strlen(acStack_5c);
    build_object_display_name(acStack_5c + iVar2,container,0,0);
    ce_strcat(acStack_5c,s_is_empty__0008790c);
    message_scroll_print_wrapped(acStack_5c);
  }
  set_pending_update_flags(2);
}



// was FUN_00037f1c -- for a container-like object param_1 (skipped if its class-flag byte's top bit
// is set) with a nonempty contents chain (offset 6), unlinks and frees matching contained objects
// one at a time via find_object_in_chain's scan; if param_2 is 0...
/* The object and matching chain entries are addresses, not 32-bit ints.
   ARM 0x37f48 adds six bytes to the object to reach its contents link. */
int discard_container_contents(uw_object_hdr_t *container, int remove_all)
{
  uw_object_hdr_t *puVar1; /* ARM 0x37fcc keeps the found object address in r4. */
  undefined4 uVar2;
  uw_link_word_t *local_18;

  uVar2 = 0;
  if ((((container->is_quant << 7)) == 0) &&
      (local_18 = uw_link_word_ptr(container), (*local_18 & 0xffc0) != 0)) {
    puVar1 = find_object_in_chain(&local_18,1,4,0,0xf);
    while (puVar1 != 0) {
      object_list_unlink(local_18,puVar1);
      free_object_slot(puVar1);
      if (remove_all == 0) {
        return uVar2;
      }
      uVar2 = 1;
      puVar1 = find_object_in_chain(&local_18,1,4,0,0xf);
    }
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}


// was FUN_0004479c -- called from auto_place_in_container (src/containers.c:942) when dropping an
// item onto the rune bag (item id 0x8f): rejects anything outside the rune id range
// (0xe8..0xe8+0x18)...
int place_rune_in_bag(uw_object_hdr_t *rune_object)
{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  byte *pbVar4;   /* was folded into iVar2 (a 32-bit int) -- see below */

  iVar2 = ((rune_object->object_id) - 0xe8) * 0x10000;
  uVar1 = iVar2 >> 0x10;
  if (((int)uVar1 < 0) || (0x18 < (int)uVar1)) {
    uVar3 = 0;
  }
  else {
    /* Was called with 0 args -- real ARM binary does the same bare call (confirmed via Ghidra:
       FUN_00053004(), free_object_slot's real address, at this exact spot)... */
    free_object_slot(rune_object);
    /* Was `iVar2 = DAT_00086df8 + (iVar2 >> 0x13); *(byte *)(iVar2 + 0x44) = ...` -- DAT_00086df8
       is a real 64-bit char* (the player stats/quest-flags struct, DAT_0023bca8) on this host, but
       `iVar2` is a 32-bit int... */
    pbVar4 = (byte *)(DAT_00086df8 + (iVar2 >> 0x13));
    pbVar4[0x44] = (byte)(1 << (7 - (uVar1 & 7) & 0xff)) | pbVar4[0x44];
    uVar3 = 1;
  }
  return uVar3;
}


// was FUN_000465c8 -- called from close_panels_before_level_change (right after
// free_player_inventory_chain) and from load_level: clears the equipped-items slot-index encoding
// and overlay-offset array...
void reset_equipment_and_container_state()
{
  int iVar1;

  iVar1 = 0;
  do {
    (&g_equipped_items)[iVar1 * 2] = (&g_equipped_items)[iVar1 * 2] & 0x3f;
    (&DAT_00202951)[iVar1 * 2] = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 0x1c);
  iVar1 = 1;
  do {
    *(undefined1 *)((char *)&DAT_00202988 + iVar1) = 0;
    iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
  } while (iVar1 < 6);
  g_open_container_list = 0;
  g_current_container_record = 0;
  DAT_002029a0 = 0;
  DAT_0020299c = 0;
  g_selected_object = 0;
  DAT_00085c50 = 0xffff;
}

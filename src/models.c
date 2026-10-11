/* The 3D "catalog object" model-rendering pipeline: animation-record ticking (resolving a catalog
   index to its real .E model geometry), emitting a catalog object (door, bridge, decal, sign) as
   textured model geometry, and door animation-frame emission. */
#include "headers/models.h"
#include "headers/models_dos.h"
#include "headers/options.h"
#include "headers/debug.h"
#include "headers/debug_ui.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Widened from 32768: load_3d_object_models does `ce_memmove(&DAT_00189590,&DAT_00110ff0,0x78580);`
   (a 492928-byte memmove, confirmed by ASAN global-buffer-overflow), matching DAT_00189590's own
   size (985856, an earlier widening pass already caught the destination but missed this source). */
static undefined DAT_00110ff0_backing[524288];
#define DAT_00110ff0 DAT_00110ff0_backing[0]
/* Sizing-audit pass: DAT_00110ffc/DAT_0018959c-f's only use is inside tick_anim_record's dead
   legacy address-walk (the same one documented at DAT_00110ff0/DAT_00189590's own comment above) --
   indexed by `catalog*0x3c2c`... */
static undefined DAT_00110ffc_backing[256];
#define DAT_00110ffc DAT_00110ffc_backing[0]
static undefined1 DAT_00189590_backing[524288];
#define DAT_00189590 DAT_00189590_backing[0]
static undefined DAT_0018959c_backing[256];
#define DAT_0018959c DAT_0018959c_backing[0]
static undefined DAT_0018959d_backing[256];
#define DAT_0018959d DAT_0018959d_backing[0]
static undefined DAT_0018959e_backing[256];
#define DAT_0018959e DAT_0018959e_backing[0]
static undefined DAT_0018959f_backing[256];
#define DAT_0018959f DAT_0018959f_backing[0]
/* General object tuner: zero unless edited in the debug panel. Changing
   catalogs resets the rotation adjustment so it cannot carry between models. */
static double g_tune_rotation_offset = 0.0;
static int g_tune_last_catalog = -1;
/* Debug-panel toggle (dbgui_field_toggle) for pick_object_under_cursor's own --pick-diag trace --
   lets the pick stencil/object-resolution trace be flipped on live from the object tuner panel
   instead of needing a relaunch with the env var set. */
int g_uw_debug_pick_diag = 0;
/* Debug-panel toggle for tick_anim_record's own --disable-3d-objects
   gate -- see that function's own comment. -1 = env var not yet
   checked this process; resolved to a real 0/1 on first read (by
   tick_anim_record or by the general debug panel, whichever runs
   first in a given frame), then flippable live via the panel. */
int g_uw_3d_objects_enabled = -1;
static undefined1 *DAT_000db45c;
static int DAT_000db458;
// was DAT_000d91d0 -- running point count while parse_e_model_file reads a .E model's POINTS block
// (bounded at 600, see the "Too many points" error); indexes both the point-scratch arrays and the
// final per-model output buffer's points array.
static int g_model_parse_point_count;
static int DAT_000db4fc;
static int *DAT_000c8b00;
// was DAT_000db430 -- running part (face) count while parse_e_model_file reads a .E model's PARTS
// block (bounded at 0x15e=350, see the "Too many polys" error); indexes both the part-scratch
// arrays and the final per-model output buffer's parts array.
static int g_model_parse_part_count;
/* Pointer-valued fields of the 0x67-byte per-PART record (see DAT_000c9dd8's comment below). The
   original record held them in 4-byte slots at +0x00 (DAT_000c9dd8: start of this part's vertex
   list inside DAT_000c4c38) and +0x4a (DAT_000c9e22: the part's name string inside DAT_000da480);
   on a 64-bit host those truncated, so they live in these parallel arrays (indexed by part number)
   instead. The 4-byte slots in the byte record are now unused. */
static int *g_eparse_part_verts[0x160];
static char *g_eparse_part_name[0x160];
static int DAT_00084660;
static int DAT_0008465c;
static int DAT_00084670;
static int DAT_0008466c;
// DAT_000db480/DAT_000db470: gate the PARTS block's 'A' (auto-backside) handling and an
// INTERSECTIONS-vs-other-block branch, but neither is ever WRITTEN anywhere in this decompile --
// always BSS-zero here, which makes the 'A' backside-generation code...
static int DAT_000db480;
static int DAT_000db470;
static int DAT_000db4d4;
static int DAT_000db4d8;
static int DAT_000db4d0;
/* DAT_000db494: gates whether parse_e_model_file resolves each PARTS entry's EXTENDED_COLORS index
   against g_model_known_ext_colors (and the function's own final scratch-to-scratch
   color-inheritance pass).

   NOT a dropped initialisation -- it reads 0 in the real UU.exe too, so the shipped game never
   resolved extended colours either and this decompile is faithful in leaving it zero. Checked by
   reading the original's own gate: parse_e_model_file is FUN_00020a74 there, its test is
   `*DAT_00022348`, and that literal-pool entry holds 0x000db494, whose contents are 0x00000000.

   So a .E file's per-face colour is dead in both this port and the original. It is worth knowing
   WHY before anyone tries to revive it, since "use the per-face colours the .E files already
   carry" sounds like an easy win: the PARTS colour field's low byte indexes the 32-entry RGB table
   below, which parse_e_model_file's own error message calls the "Mac color table", and the entries
   the shipped art actually names are authoring placeholders rather than final colours --

       entry  4  rgb(178,0,0)   bright red  <- DFRAME, DOOR, BEAM, FBRIDGE, GRAVE, GATE, ARROW
       entry  5  rgb(153,0,102) magenta     <- DFRAME, ARROW
       entry  6  rgb(153,46,1)  brown       <- BENCH, TABLF3, CHEST, BARRCLOS, 40LOTUS, CHAIRSIM
       entry  8  rgb(54,46,20)  dark brown  <- ROCKSMAL, CHAIRSIM
       entry 12  rgb(255,0,0)   pure red    <- CHAIRSIM
       entry 14  rgb(255,255,0) yellow      <- BARRCLOS
       entry 15  rgb(255,255,255) white     <- SHRINE, BED2

   -- i.e. honouring them would render door frames and doors bright red, the shrine white and
   barrel faces yellow. The colours the game really uses are the per-model auxiliary palette in
   DAT_00086c08_backing further down. (The DOS asset set is the opposite case and genuinely worth
   decoding: its per-face colour operand indexes that same auxiliary palette, which is what
   models_dos.c's uw_dos_model_face_colour supplies.) */
static int DAT_000db494;
static int DAT_000db4e0;
/* was DAT_00084678 -- a fixed table of 32 known 24-bit RGB values (0x00RRGGBB-shaped ints) that
   parse_e_model_file's EXTENDED_COLORS handling linearly searches to turn each entry's literal RGB
   (e.g. "545454" in ROCKSMAL.E) into a small index, stored per-part.

   Left as a single scalar on purpose: every path that reads it is behind DAT_000db494, which is
   zero in the real UU.exe as well (see its comment above), so filling the table in would add
   32 words of data that nothing can reach. Its real contents, read out of the original at
   0x00084678 should they ever be needed, are the 16 saturated authoring colours listed in that
   comment followed by a 16-step grey ramp from 0xffffff down to 0xa5a5a5. */
static undefined4 g_model_known_ext_colors;
static char s_unexpected_EOF___no_END_statemen_000846f8[] = "unexpected EOF - no END statement\n";
static char s________c_0008471c[] = "%*[^}]%c";
static char s___d__00084728[] = "(%d)\n";
/* Sizing-audit pass: a bare NKDbgPrintfW debug-message format string (no args), surrounded entirely
   by short (<40 char) literal strings in this same table. Real content confirmed via direct Ghidra
   memory export of UU.exe (tests/fixtures/static_strings.json): "%d ". */
static undefined DAT_00084730_backing[64] = "%d ";
#define DAT_00084730 DAT_00084730_backing[0]
static char s_anim__d___d__c__d__d___00084734[] = "anim %d (%d,%c,%d,%d): ";
static char s__d__1s__d__d__1s_0008474c[] = "%d,%1s,%d,%d,%1s";
static char s_ANIMATE_00084760[] = "ANIMATE";
static char s_Error__extended_color_for_part___00084768[] = "Error: extended color for part %d not in Mac color table\n";
/* Was "%lx%1s" -- correct as recovered from the original 32-bit binary, where 'long' and 'int' are
   both 4 bytes, matching the destination (parse_e_model_file's `int local_208;`). */
static char s__lx_1s_000847a4[] = "%x%1s";
static char s_EXTENDED_COLORS_000847ac[] = "EXTENDED_COLORS";
static char s_INTERSECTIONS_000847bc[] = "INTERSECTIONS";
static char s__c__d__d__d__d__d___c__000847cc[] = "%c,%d,%d,%d,%d,%d (%c)\n";
static char s__1s__d__d__d_1s_000847e4[] = "%1s,%d,%d,%d%1s";
static char s__1s__d__d__d__d__d_1s_000847f4[] = "%1s,%d,%d,%d,%d,%d%1s";
static char s_branch_0008480c[] = "branch ";
/* Sizing-audit pass: an NKDbgPrintfW debug-message format string (one %-arg, local_22c), sibling of
   the "branch"/"leaf" literals right around it. Real content confirmed via direct Ghidra memory
   export of UU.exe: "%d\n". Sized to 64 for headroom; down from 8192. */
static undefined DAT_00084814_backing[64] = "%d\n";
#define DAT_00084814 DAT_00084814_backing[0]
static char s_leaf_00084818[] = "leaf ";
/* Sizing-audit pass: a ce_fscanf format string (`ce_fscanf(pvVar_fh, &DAT_00084820,&local_1e4)`,
   one int destination), sibling of the short format-string literals around it (e.g.
   s__d_1s_000848c8 = "%d%1s"). */
static undefined DAT_00084820_backing[64] = "%1s,";
#define DAT_00084820 DAT_00084820_backing[0]
static char s_SUPER_NODES_00084828[] = "SUPER_NODES";
static char s_NODES_00084834[] = "NODES";
static char s_CLUSTERS_0008483c[] = "CLUSTERS";
static char s_making_backside_of__d_____d_00084848[] = "making backside of %d -> %d\n";
static char s_Error__Part__d_is_a_polygon_with_00084868[] = "Error: Part %d is a polygon with only %d points";
static char s_Error__polygon__d__bitmap_must_h_00084898[] = "Error: polygon %d: bitmap must have 4 points\n";
static char s__d_1s_000848c8[] = "%d%1s";
static char s__d__d_000848d0[] = "%d,%d";
static char s_________c_000848d8[] = "%*[^;}]%c";
static char s_got_sphere__d_000848e4[] = "got sphere %d\n";
/* Sizing-audit pass: a ce_fscanf format string (multiple destination pointers), sibling of "got
   sphere %d\n" right above it. Real content confirmed via direct Ghidra memory export of UU.exe:
   "%d,". Sized to 64 for headroom; down from 8192. */
static undefined DAT_000848f4_backing[64] = "%d,";
#define DAT_000848f4 DAT_000848f4_backing[0]
static char s_Too_many_polys_000848f8[] = "Too many polys\n";
static char s_Out_of_vertex_list_space_00084908[] = "Out of vertex list space\n";
static char s__d__d__d__d_00084924[] = "%d,%d,%d,%d";
static char s_got_bitmap__d___d_00084930[] = "got bitmap %d: %d\n";
static char s__d__1s__d__x__00084944[] = "%d,%1s,%d,%x,";
static char s___c_1____00084954[] = "%*c%1[}]";
static char s_PARTS_00084960[] = "PARTS";
static char s_Too_many_points___d__00084968[] = "Too many points (%d)\n";
static char s__d__d__d__00084980[] = "%d,%d,%d;";
static char s_POINTS_0008498c[] = "POINTS";
static char s__1s______1s_00084994[] = "%1s%[^\"]%1s";
static char s_NAMES_000849a0[] = "NAMES";
/* Unrecoverable scanf-format string constants (Ghidra never recovered their content). */
/* Sizing-audit pass: recovered/guessed content is 3-4 chars, no
   indexing. Sized to 16; down from 8192. */
static char DAT_000849a8_backing[16] = "%1s";
#define DAT_000849a8 DAT_000849a8_backing[0]
static char DAT_000849ac_backing[16] = "%d";
#define DAT_000849ac DAT_000849ac_backing[0]
static char s_VERSION_000849b0[] = "VERSION";
static char s_error___s__c_000849b8[] = "error: %s,%c\n";
/* Unrecoverable string constant (Ghidra never recovered its content) -- confirmed "END" by
   inspecting a real .E model file (DATA3D/DFRAME.E)... */
/* Sizing-audit pass: confirmed real content is "END" (3 chars, see
   comment above), no indexing. Sized to 16; down from 8192. */
static char DAT_000849c8_backing[16] = "END";
#define DAT_000849c8 DAT_000849c8_backing[0]
static char s__100s_1s_000849cc[] = "%100s%1s";
static char s__1s__a_z__1s_000849d8[] = "%1s%[a-z]%1s";
static char s_Input_file_error__BEGIN_statemen_000849e8[] = "Input file error: BEGIN statement missing\n";
static char s_BEGIN_00084a14[] = "BEGIN";
static char s__100s_00084a1c[] = "%100s";
/* Sizing-audit pass: ce_fopen's mode-string argument (`ce_fopen(acStack_130,&DAT_00084a24)`). Real
   content confirmed via direct Ghidra memory export of UU.exe: "r". Sized to 16; down from 8192. */
static undefined DAT_00084a24_backing[16] = "r";
#define DAT_00084a24 DAT_00084a24_backing[0]
/* DAT_000c4c38 (a vertex-data scratch buffer, see parse_e_model_file's ".E" model parser:
   `DAT_000c8b00 = &DAT_000c4c38;` starts a write cursor there and walks it forward one 4-byte slot
   at a time while parsing PARTS) was declared as a lone undefined4 scalar... */
static char DAT_000c4c38_backing[0x3e58];
#define DAT_000c4c38 (*(undefined4 *)DAT_000c4c38_backing)
#define DAT_000c8a90 (*(undefined1 *)(DAT_000c4c38_backing + 0x3e58))
/* INTERSECTIONS-block growing undefined4 array (DAT_000db4d0-indexed). */
static undefined1 DAT_000c8b08_backing[256];
#define DAT_000c8b08 DAT_000c8b08_backing[0]
/* Base of a growing per-cluster-connection undefined4 array in parse_e_model_file's CLUSTERS block
   (`puVar8 = &DAT_000c8ca0; ... *puVar8 = local_1d8; puVar8 = puVar8 + 1;`) -- same
   undersized-scalar bug as DAT_000da868/DAT_000dab90 right above, for the same block. */
static undefined1 DAT_000c8ca0_backing[1024];
#define DAT_000c8ca0 DAT_000c8ca0_backing[0]
/* DAT_000c9540..DAT_000c9555 (22 fields): another per-record byte-field cluster in
   parse_e_model_file's ".E" model parser (NODES block), same undersized-scalar bug as
   DAT_000d2ab0/DAT_000c9dd8/DAT_000c8ca0/ DAT_000da868/DAT_000dab90 above... */
static undefined1 DAT_000c9540_backing[512];
#define DAT_000c9540 DAT_000c9540_backing[0]
static undefined1 DAT_000c9541_backing[512];
#define DAT_000c9541 DAT_000c9541_backing[0]
static undefined1 DAT_000c9542_backing[512];
#define DAT_000c9542 DAT_000c9542_backing[0]
static undefined1 DAT_000c9543_backing[512];
#define DAT_000c9543 DAT_000c9543_backing[0]
static undefined1 DAT_000c9544_backing[512];
#define DAT_000c9544 DAT_000c9544_backing[0]
static undefined1 DAT_000c9545_backing[512];
#define DAT_000c9545 DAT_000c9545_backing[0]
static undefined1 DAT_000c9546_backing[512];
#define DAT_000c9546 DAT_000c9546_backing[0]
static undefined1 DAT_000c9547_backing[512];
#define DAT_000c9547 DAT_000c9547_backing[0]
static undefined1 DAT_000c9548_backing[512];
#define DAT_000c9548 DAT_000c9548_backing[0]
static undefined1 DAT_000c9549_backing[512];
#define DAT_000c9549 DAT_000c9549_backing[0]
static undefined1 DAT_000c954a_backing[512];
#define DAT_000c954a DAT_000c954a_backing[0]
static undefined1 DAT_000c954b_backing[512];
#define DAT_000c954b DAT_000c954b_backing[0]
static undefined1 DAT_000c954c_backing[512];
#define DAT_000c954c DAT_000c954c_backing[0]
static undefined1 DAT_000c954d_backing[512];
#define DAT_000c954d DAT_000c954d_backing[0]
static undefined1 DAT_000c954e_backing[512];
#define DAT_000c954e DAT_000c954e_backing[0]
static undefined1 DAT_000c954f_backing[512];
#define DAT_000c954f DAT_000c954f_backing[0]
static undefined1 DAT_000c9550_backing[512];
#define DAT_000c9550 DAT_000c9550_backing[0]
static undefined1 DAT_000c9551_backing[512];
#define DAT_000c9551 DAT_000c9551_backing[0]
static undefined1 DAT_000c9552_backing[512];
#define DAT_000c9552 DAT_000c9552_backing[0]
static undefined1 DAT_000c9553_backing[512];
#define DAT_000c9553 DAT_000c9553_backing[0]
static undefined1 DAT_000c9554_backing[512];
#define DAT_000c9554 DAT_000c9554_backing[0]
static undefined1 DAT_000c9555_backing[512];
#define DAT_000c9555 DAT_000c9555_backing[0]
/* DAT_000c9dd8 through DAT_000c9de3 (12 globals) are byte fields of a 0x67(103)-byte-stride
   per-PART record in parse_e_model_file's ".E" model parser (`iVar5 = g_model_parse_part_count *
   0x67; (&DAT_000c9ddc)[iVar5] = ...`)... */
static undefined1 DAT_000c9dd8_backing[49152];
#define DAT_000c9dd8 DAT_000c9dd8_backing[0]
static undefined1 DAT_000c9dd9_backing[49152];
#define DAT_000c9dd9 DAT_000c9dd9_backing[0]
static undefined1 DAT_000c9dda_backing[49152];
#define DAT_000c9dda DAT_000c9dda_backing[0]
static undefined1 DAT_000c9ddb_backing[49152];
#define DAT_000c9ddb DAT_000c9ddb_backing[0]
static undefined1 DAT_000c9ddc_backing[49152];
#define DAT_000c9ddc DAT_000c9ddc_backing[0]
static undefined1 DAT_000c9ddd_backing[49152];
#define DAT_000c9ddd DAT_000c9ddd_backing[0]
static undefined1 DAT_000c9dde_backing[49152];
#define DAT_000c9dde DAT_000c9dde_backing[0]
static undefined1 DAT_000c9ddf_backing[49152];
#define DAT_000c9ddf DAT_000c9ddf_backing[0]
static undefined1 DAT_000c9de0_backing[49152];
#define DAT_000c9de0 DAT_000c9de0_backing[0]
static undefined1 DAT_000c9de1_backing[49152];
#define DAT_000c9de1 DAT_000c9de1_backing[0]
static undefined1 DAT_000c9de2_backing[49152];
#define DAT_000c9de2 DAT_000c9de2_backing[0]
static undefined1 DAT_000c9de3_backing[49152];
#define DAT_000c9de3 DAT_000c9de3_backing[0]
/* DAT_000c9e0e..DAT_000c9e3e (30 fields): same bug, same parser, same systematic-scan discovery as
   DAT_000c9540 above. Sizing pass: same PARTS record as DAT_000c9dd8 above -- see its own comment
   (350-part code-enforced cap, 36050 bytes real need). Sized to 49152, down from 65536. */
static undefined1 DAT_000c9e0e_backing[49152];
#define DAT_000c9e0e DAT_000c9e0e_backing[0]
static undefined1 DAT_000c9e0f_backing[49152];
#define DAT_000c9e0f DAT_000c9e0f_backing[0]
static undefined1 DAT_000c9e10_backing[49152];
#define DAT_000c9e10 DAT_000c9e10_backing[0]
static undefined1 DAT_000c9e11_backing[49152];
#define DAT_000c9e11 DAT_000c9e11_backing[0]
static undefined1 DAT_000c9e22_backing[49152];
#define DAT_000c9e22 DAT_000c9e22_backing[0]
static undefined1 DAT_000c9e23_backing[49152];
#define DAT_000c9e23 DAT_000c9e23_backing[0]
static undefined1 DAT_000c9e24_backing[49152];
#define DAT_000c9e24 DAT_000c9e24_backing[0]
static undefined1 DAT_000c9e25_backing[49152];
#define DAT_000c9e25 DAT_000c9e25_backing[0]
static undefined1 DAT_000c9e26_backing[49152];
#define DAT_000c9e26 DAT_000c9e26_backing[0]
static undefined1 DAT_000c9e28_backing[49152];
#define DAT_000c9e28 DAT_000c9e28_backing[0]
static undefined1 DAT_000c9e29_backing[49152];
#define DAT_000c9e29 DAT_000c9e29_backing[0]
static undefined1 DAT_000c9e2b_backing[49152];
#define DAT_000c9e2b DAT_000c9e2b_backing[0]
static undefined1 DAT_000c9e2c_backing[49152];
#define DAT_000c9e2c DAT_000c9e2c_backing[0]
static undefined1 DAT_000c9e2d_backing[49152];
#define DAT_000c9e2d DAT_000c9e2d_backing[0]
static undefined1 DAT_000c9e2e_backing[49152];
#define DAT_000c9e2e DAT_000c9e2e_backing[0]
static undefined1 DAT_000c9e2f_backing[49152];
#define DAT_000c9e2f DAT_000c9e2f_backing[0]
static undefined1 DAT_000c9e30_backing[49152];
#define DAT_000c9e30 DAT_000c9e30_backing[0]
static undefined1 DAT_000c9e31_backing[49152];
#define DAT_000c9e31 DAT_000c9e31_backing[0]
static undefined1 DAT_000c9e32_backing[49152];
#define DAT_000c9e32 DAT_000c9e32_backing[0]
static undefined1 DAT_000c9e33_backing[49152];
#define DAT_000c9e33 DAT_000c9e33_backing[0]
static undefined1 DAT_000c9e34_backing[49152];
#define DAT_000c9e34 DAT_000c9e34_backing[0]
static undefined1 DAT_000c9e35_backing[49152];
#define DAT_000c9e35 DAT_000c9e35_backing[0]
static undefined1 DAT_000c9e36_backing[49152];
#define DAT_000c9e36 DAT_000c9e36_backing[0]
static undefined1 DAT_000c9e37_backing[49152];
#define DAT_000c9e37 DAT_000c9e37_backing[0]
static undefined1 DAT_000c9e38_backing[49152];
#define DAT_000c9e38 DAT_000c9e38_backing[0]
static undefined1 DAT_000c9e39_backing[49152];
#define DAT_000c9e39 DAT_000c9e39_backing[0]
static undefined1 DAT_000c9e3a_backing[49152];
#define DAT_000c9e3a DAT_000c9e3a_backing[0]
static undefined1 DAT_000c9e3b_backing[49152];
#define DAT_000c9e3b DAT_000c9e3b_backing[0]
static undefined1 DAT_000c9e3c_backing[49152];
#define DAT_000c9e3c DAT_000c9e3c_backing[0]
static undefined1 DAT_000c9e3d_backing[49152];
#define DAT_000c9e3d DAT_000c9e3d_backing[0]
static undefined1 DAT_000c9e3e_backing[49152];
#define DAT_000c9e3e DAT_000c9e3e_backing[0]
/* DAT_000d2ab0 through DAT_000d2ad3 (28 globals) are individual byte fields of a
   0x2c(44)-byte-stride per-POINT record in parse_e_model_file's ".E" model parser... */
static undefined1 DAT_000d2ab0_backing[32768];
#define DAT_000d2ab0 DAT_000d2ab0_backing[0]
static undefined1 DAT_000d2ab1_backing[32768];
#define DAT_000d2ab1 DAT_000d2ab1_backing[0]
static undefined1 DAT_000d2ab2_backing[32768];
#define DAT_000d2ab2 DAT_000d2ab2_backing[0]
static undefined1 DAT_000d2ab3_backing[32768];
#define DAT_000d2ab3 DAT_000d2ab3_backing[0]
static undefined1 DAT_000d2ab4_backing[32768];
#define DAT_000d2ab4 DAT_000d2ab4_backing[0]
static undefined1 DAT_000d2ab5_backing[32768];
#define DAT_000d2ab5 DAT_000d2ab5_backing[0]
static undefined1 DAT_000d2ab6_backing[32768];
#define DAT_000d2ab6 DAT_000d2ab6_backing[0]
static undefined1 DAT_000d2ab7_backing[32768];
#define DAT_000d2ab7 DAT_000d2ab7_backing[0]
static undefined1 DAT_000d2ab8_backing[32768];
#define DAT_000d2ab8 DAT_000d2ab8_backing[0]
static undefined1 DAT_000d2ab9_backing[32768];
#define DAT_000d2ab9 DAT_000d2ab9_backing[0]
static undefined1 DAT_000d2aba_backing[32768];
#define DAT_000d2aba DAT_000d2aba_backing[0]
static undefined1 DAT_000d2abb_backing[32768];
#define DAT_000d2abb DAT_000d2abb_backing[0]
static undefined1 DAT_000d2abc_backing[32768];
#define DAT_000d2abc DAT_000d2abc_backing[0]
static undefined1 DAT_000d2abd_backing[32768];
#define DAT_000d2abd DAT_000d2abd_backing[0]
static undefined1 DAT_000d2abe_backing[32768];
#define DAT_000d2abe DAT_000d2abe_backing[0]
static undefined1 DAT_000d2abf_backing[32768];
#define DAT_000d2abf DAT_000d2abf_backing[0]
static undefined1 DAT_000d2ac0_backing[32768];
#define DAT_000d2ac0 DAT_000d2ac0_backing[0]
static undefined1 DAT_000d2ac1_backing[32768];
#define DAT_000d2ac1 DAT_000d2ac1_backing[0]
static undefined1 DAT_000d2ac2_backing[32768];
#define DAT_000d2ac2 DAT_000d2ac2_backing[0]
static undefined1 DAT_000d2ac3_backing[32768];
#define DAT_000d2ac3 DAT_000d2ac3_backing[0]
static undefined1 DAT_000d2ac8_backing[32768];
#define DAT_000d2ac8 DAT_000d2ac8_backing[0]
static undefined1 DAT_000d2ac9_backing[32768];
#define DAT_000d2ac9 DAT_000d2ac9_backing[0]
static undefined1 DAT_000d2aca_backing[32768];
#define DAT_000d2aca DAT_000d2aca_backing[0]
static undefined1 DAT_000d2acb_backing[32768];
#define DAT_000d2acb DAT_000d2acb_backing[0]
static undefined1 DAT_000d2ad0_backing[32768];
#define DAT_000d2ad0 DAT_000d2ad0_backing[0]
static undefined1 DAT_000d2ad1_backing[32768];
#define DAT_000d2ad1 DAT_000d2ad1_backing[0]
static undefined1 DAT_000d2ad2_backing[32768];
#define DAT_000d2ad2 DAT_000d2ad2_backing[0]
static undefined1 DAT_000d2ad3_backing[32768];
#define DAT_000d2ad3 DAT_000d2ad3_backing[0]
/* Was a lone `undefined4`, but ANIMATE fills it as an int array (`*piVar17++ = frame_index`, every
   frame of every animation, up to the 0xd9768 table that follows): 0x190 bytes. */
static int DAT_000d95d8_arr[100];
#define DAT_000d95d8 DAT_000d95d8_arr[0]
/* DAT_000d9768..DAT_000d977c (21 fields): same bug, same parser, same systematic-scan discovery as
   the two clusters above. */
static undefined1 DAT_000d9768_backing[256];
#define DAT_000d9768 DAT_000d9768_backing[0]
static undefined1 DAT_000d9769_backing[256];
#define DAT_000d9769 DAT_000d9769_backing[0]
static undefined1 DAT_000d976a_backing[256];
#define DAT_000d976a DAT_000d976a_backing[0]
static undefined1 DAT_000d976b_backing[256];
#define DAT_000d976b DAT_000d976b_backing[0]
static undefined1 DAT_000d976c_backing[256];
#define DAT_000d976c DAT_000d976c_backing[0]
static undefined1 DAT_000d976d_backing[256];
#define DAT_000d976d DAT_000d976d_backing[0]
static undefined1 DAT_000d976e_backing[256];
#define DAT_000d976e DAT_000d976e_backing[0]
static undefined1 DAT_000d976f_backing[256];
#define DAT_000d976f DAT_000d976f_backing[0]
static undefined1 DAT_000d9770_backing[256];
#define DAT_000d9770 DAT_000d9770_backing[0]
static undefined1 DAT_000d9771_backing[256];
#define DAT_000d9771 DAT_000d9771_backing[0]
static undefined1 DAT_000d9772_backing[256];
#define DAT_000d9772 DAT_000d9772_backing[0]
static undefined1 DAT_000d9773_backing[256];
#define DAT_000d9773 DAT_000d9773_backing[0]
static undefined1 DAT_000d9774_backing[256];
#define DAT_000d9774 DAT_000d9774_backing[0]
static undefined1 DAT_000d9775_backing[256];
#define DAT_000d9775 DAT_000d9775_backing[0]
static undefined1 DAT_000d9776_backing[256];
#define DAT_000d9776 DAT_000d9776_backing[0]
static undefined1 DAT_000d9777_backing[256];
#define DAT_000d9777 DAT_000d9777_backing[0]
static undefined1 DAT_000d9778_backing[256];
#define DAT_000d9778 DAT_000d9778_backing[0]
static undefined1 DAT_000d9779_backing[256];
#define DAT_000d9779 DAT_000d9779_backing[0]
static undefined1 DAT_000d977a_backing[256];
#define DAT_000d977a DAT_000d977a_backing[0]
static undefined1 DAT_000d977b_backing[256];
#define DAT_000d977b DAT_000d977b_backing[0]
static undefined1 DAT_000d977c_backing[256];
#define DAT_000d977c DAT_000d977c_backing[0]
/* Sizing pass: live instrumentation across the full 19-script regression
   suite (29 real .E model files loaded) showed a real high-water mark of 8 chars for the unbounded
   %[a-z] token this feeds. Sized to 64 bytes for headroom above that. */
static undefined1 DAT_000d98c8_backing[64];
#define DAT_000d98c8 DAT_000d98c8_backing[0]
/* NAMES-block growing string-table cursor base (puVar16/local_258 walk forward from here, one
   null-terminated name per CLUSTER entry). Sizing pass: real usage across all 29 loaded models
   peaks at 270 bytes. Sized to 1024 for headroom, down from 65536. */
static undefined1 DAT_000da480_backing[1024];
#define DAT_000da480 DAT_000da480_backing[0]
/* Per-CLUSTER pointer/index slot in the same ".E" model parser (parse_e_model_file's CLUSTERS
   block) as DAT_000dab90 right below, same "declared as a lone scalar, actually a large indexed
   table" bug... */
static undefined1 DAT_000da868_backing[128];
#define DAT_000da868 DAT_000da868_backing[0]
static undefined1 DAT_000dab90_backing[128];
#define DAT_000dab90 DAT_000dab90_backing[0]
/* Sizing-audit pass: its only use is `ce_fscanf(pvVar_fh,&DAT_000849ac,&DAT_000db454)` where
   DAT_000849ac is the format string "%d" -- a single int destination, not a table. Sized to 16
   bytes for alignment/type-punning safety, down from 8192. */
static undefined DAT_000db454_backing[16];
#define DAT_000db454 DAT_000db454_backing[0]
static char s__DATA3D_BED2_E_00085474[] = "\\DATA3D\\BED2.E";
static char s__DATA3D_CHAIRSIM_E_00085484[] = "\\DATA3D\\CHAIRSIM.E";
static char s__DATA3D_BARRCLOS_E_00085498[] = "\\DATA3D\\BARRCLOS.E";
static char s__DATA3D_NITESTAN_E_000854ac[] = "\\DATA3D\\NITESTAN.E";
static char s__DATA3D_CHEST_E_000854c0[] = "\\DATA3D\\CHEST.E";
static char s__DATA3D_TABLF3_E_000854d0[] = "\\DATA3D\\TABLF3.E";
static char s__DATA3D_GATE_E_000854e4[] = "\\DATA3D\\GATE.E";
static char s__DATA3D_TMAP64X64_E_000854f4[] = "\\DATA3D\\TMAP64X64.E";
static char s__DATA3D_TMAP32X32_E_00085508[] = "\\DATA3D\\TMAP32X32.E";
static char s__DATA3D_GRAVE_E_0008551c[] = "\\DATA3D\\GRAVE.E";
static char s__DATA3D_TMAP16X16_E_0008552c[] = "\\DATA3D\\TMAP16X16.E";
static char s__DATA3D_DOOR_E_00085540[] = "\\DATA3D\\DOOR.E";
static char s__DATA3D_NEWPORT_E_00085550[] = "\\DATA3D\\NEWPORT.E";
static char s__DATA3D_SHRINE_E_00085564[] = "\\DATA3D\\SHRINE.E";
static char s__DATA3D_NEWPILL_E_00085578[] = "\\DATA3D\\NEWPILL.E";
static char s__DATA3D_BEAM_E_0008558c[] = "\\DATA3D\\BEAM.E";
static char s__DATA3D_ARROW_E_0008559c[] = "\\DATA3D\\ARROW.E";
static char s__DATA3D_ROCKBIG_E_000855ac[] = "\\DATA3D\\ROCKBIG.E";
static char s__DATA3D_ROCKMED_E_000855c0[] = "\\DATA3D\\ROCKMED.E";
static char s__DATA3D_ROCKSMAL_E_000855d4[] = "\\DATA3D\\ROCKSMAL.E";
static char s__DATA3D_40LOTUS_E_000855e8[] = "\\DATA3D\\40LOTUS.E";
static char s__DATA3D_BENCH_E_000855fc[] = "\\DATA3D\\BENCH.E";
static char s__DATA3D_FBRIDGE_E_0008560c[] = "\\DATA3D\\FBRIDGE.E";
static char s__DATA3D_DFRAME_E_00085620[] = "\\DATA3D\\DFRAME.E";
/* Sizing-audit pass: these ~30 per-model catalog buffers (one per .E file, each passed as
   parse_e_model_file's own param_2) were checked for oversizing like every other array in this
   audit, but turned out NOT to be oversized -- they're already reasonably tight. */
static undefined DAT_00114c1c_backing[16384];
#define DAT_00114c1c DAT_00114c1c_backing[0]
static undefined DAT_00118848_backing[16384];
#define DAT_00118848 DAT_00118848_backing[0]
static undefined DAT_0011c474_backing[16384];
#define DAT_0011c474 DAT_0011c474_backing[0]
static undefined DAT_001200a0_backing[16384];
#define DAT_001200a0 DAT_001200a0_backing[0]
undefined DAT_00123ccc_backing[16384];
static undefined DAT_001278f8_backing[16384];
#define DAT_001278f8 DAT_001278f8_backing[0]
static undefined DAT_0012b524_backing[16384];
#define DAT_0012b524 DAT_0012b524_backing[0]
static undefined DAT_0012f150_backing[16384];
#define DAT_0012f150 DAT_0012f150_backing[0]
static undefined DAT_00132d7c_backing[16384];
#define DAT_00132d7c DAT_00132d7c_backing[0]
static undefined DAT_001369a8_backing[16384];
#define DAT_001369a8 DAT_001369a8_backing[0]
static undefined DAT_0013a5d4_backing[16384];
#define DAT_0013a5d4 DAT_0013a5d4_backing[0]
static undefined DAT_0013e200_backing[16384];
#define DAT_0013e200 DAT_0013e200_backing[0]
static undefined DAT_00141e2c_backing[16384];
#define DAT_00141e2c DAT_00141e2c_backing[0]
static undefined DAT_00145a58_backing[16384];
#define DAT_00145a58 DAT_00145a58_backing[0]
static undefined DAT_00149684_backing[16384];
#define DAT_00149684 DAT_00149684_backing[0]
static undefined DAT_0014d2b0_backing[16384];
#define DAT_0014d2b0 DAT_0014d2b0_backing[0]
static undefined DAT_00150edc_backing[16384];
#define DAT_00150edc DAT_00150edc_backing[0]
static undefined DAT_00154b08_backing[16384];
#define DAT_00154b08 DAT_00154b08_backing[0]
static undefined DAT_00158734_backing[16384];
#define DAT_00158734 DAT_00158734_backing[0]
static undefined DAT_0015c360_backing[16384];
#define DAT_0015c360 DAT_0015c360_backing[0]
static undefined DAT_0015ff8c_backing[16384];
#define DAT_0015ff8c DAT_0015ff8c_backing[0]
static undefined DAT_00163bb8_backing[16384];
#define DAT_00163bb8 DAT_00163bb8_backing[0]
static undefined DAT_001677e4_backing[16384];
#define DAT_001677e4 DAT_001677e4_backing[0]
static undefined DAT_0016b410_backing[16384];
#define DAT_0016b410 DAT_0016b410_backing[0]
static undefined DAT_0016f03c_backing[16384];
#define DAT_0016f03c DAT_0016f03c_backing[0]
static undefined DAT_00172c68_backing[16384];
#define DAT_00172c68 DAT_00172c68_backing[0]
static undefined DAT_00176894_backing[16384];
#define DAT_00176894 DAT_00176894_backing[0]
static undefined DAT_0017a4c0_backing[16384];
#define DAT_0017a4c0 DAT_0017a4c0_backing[0]
static undefined DAT_0017e0ec_backing[16384];
#define DAT_0017e0ec DAT_0017e0ec_backing[0]
/* g_anim_model_slot: real fix for tick_anim_record's own address-walk bug (see that function's own
   comment). */
static void * const g_anim_model_slot[30] = {
  0,                 /* 0: unused */
  &DAT_00114c1c,     /* 1: DFRAME.E */
  &DAT_00118848,     /* 2: FBRIDGE.E */
  &DAT_0011c474,     /* 3: BENCH.E */
  &DAT_001200a0,     /* 4: 40LOTUS.E */
  &DAT_00123ccc,     /* 5: ROCKSMAL.E */
  &DAT_001278f8,     /* 6: ROCKMED.E */
  &DAT_0012b524,     /* 7: ROCKBIG.E */
  &DAT_0012f150,     /* 8: ARROW.E */
  &DAT_00132d7c,     /* 9: BEAM.E */
  &DAT_001369a8,     /* 10: NEWPILL.E */
  &DAT_0013a5d4,     /* 11: SHRINE.E */
  &DAT_0013e200,     /* 12: NEWPORT.E (1st load) */
  &DAT_00141e2c,     /* 13: NEWPORT.E (2nd load) */
  &DAT_00145a58,     /* 14: DOOR.E (1st load) */
  &DAT_00149684,     /* 15: DOOR.E (2nd load) */
  &DAT_0014d2b0,     /* 16: TMAP16X16.E (1st load) */
  &DAT_00150edc,     /* 17: TMAP16X16.E (2nd load) */
  &DAT_00154b08,     /* 18: TMAP16X16.E (3rd load) */
  &DAT_00158734,     /* 19: GRAVE.E */
  &DAT_0015c360,     /* 20: TMAP16X16.E (4th load) */
  &DAT_0015ff8c,     /* 21: TMAP32X32.E */
  &DAT_00163bb8,     /* 22: TMAP64X64.E */
  &DAT_001677e4,     /* 23: GATE.E */
  &DAT_0016b410,     /* 24: TABLF3.E */
  &DAT_0016f03c,     /* 25: CHEST.E */
  &DAT_00172c68,     /* 26: NITESTAN.E */
  &DAT_00176894,     /* 27: BARRCLOS.E */
  &DAT_0017a4c0,     /* 28: CHAIRSIM.E */
  &DAT_0017e0ec,     /* 29: BED2.E */
};
/* Per-slot working copy for tick_anim_record's real fix -- a fresh 16384-byte memcpy of the real
   model buffer, refreshed every call rather than reusing the original's incremental per-point
   "tick"... */
static unsigned char g_anim_model_scratch[30][16384];
/* Sizing-audit pass: both write loops index it by `iVar29 < uVar21` where `uVar21 = catalog_flags &
   7` -- max index 6 (7 elements, 14 bytes real). Sized to 16 for headroom; down from 256 (512
   bytes, undefined2 element type). */
undefined2 DAT_00189570_backing[16];
#define DAT_00189570 DAT_00189570_backing[0]
char *DAT_00110fc0 = DAT_00110fc0_scratch;
/* Sizing-audit pass: investigated, NOT confidently resolved. */
 undefined1 DAT_00202520_backing[1024];
short DAT_000b4620;
static short DAT_00189584;
static undefined2 DAT_00189586;
ushort DAT_0018957a;
/* .data 0x86c08: real billboard-catalog table, 30 records of 4 bytes each
   (byte0=flags/sub-frame-count, bytes1-3=up to 3 more per-entry values -- see emit_catalog_object's
   own use of it), recovered directly from UU.exe. */
static unsigned char DAT_00086c08_backing[0x78] = {
  0x01,0xec,0x00,0x00, 0x21,0xeb,0x00,0x00, 0x11,0xec,0x00,0x3e, 0x01,0xe4,0x00,0x00,
  0x02,0xb6,0xb0,0x00, 0x02,0x64,0x6c,0x00, 0x02,0x64,0x6c,0x00, 0x02,0x64,0x6c,0x00,
  0x42,0xe8,0xb8,0x00, 0x01,0xe4,0x00,0x00, 0x19,0xe4,0x00,0x60, 0x03,0xa3,0xa4,0xa6,
  0x01,0x68,0x00,0x00, 0x01,0x68,0x00,0x00, 0x11,0xec,0x00,0x00, 0x21,0xec,0x00,0x00,
  0x51,0xb0,0x00,0xe4, 0x51,0xb0,0x00,0xec, 0x11,0xb0,0x00,0xf4, 0x11,0x6a,0x00,0x3c,
  0x51,0xb0,0x00,0x00, 0x11,0xb0,0x00,0x00, 0x21,0xb0,0x00,0x00, 0x83,0x00,0x02,0x04,
  0x02,0xe4,0x68,0x00, 0x02,0xe6,0x68,0x00, 0x01,0xe4,0x00,0x00, 0x02,0xe4,0x6a,0x00,
  0x03,0xe6,0x6a,0x71, 0x03,0xe2,0x62,0xc4,
};
#define DAT_00086c08 DAT_00086c08_backing[0]
#define DAT_00086c09 DAT_00086c08_backing[1]
#define DAT_00086c0a DAT_00086c08_backing[2]
#define DAT_00086c0b DAT_00086c08_backing[3]
/* ARM .data 0x86ce0: one contiguous table, four door orientations by four camera quarters, each
   with an X/Z hinge offset. The leaf's local X range is [0,128]; keep its origin at the hinge
   rather than recentering the mesh. Separate backing arrays lost both these values and the stride. */
static undefined4 DAT_00086ce0_backing[32] = {
  -64, 0, 0, -64, 64, 0, 0, 64,
  0, 64, -64, 0, 0, -64, 64, 0,
  64, 0, 0, 64, -64, 0, 0, -64,
  0, -64, 64, 0, 0, 64, -64, 0,
};
#define DAT_00086ce0 DAT_00086ce0_backing[0]
#define DAT_00086ce4 DAT_00086ce0_backing[1]
#define DAT_00086ce8 DAT_00086ce0_backing[2]
#define DAT_00086cec DAT_00086ce0_backing[3]
#define DAT_00086cf0 DAT_00086ce0_backing[4]
#define DAT_00086cf4 DAT_00086ce0_backing[5]
#define DAT_00086cf8 DAT_00086ce0_backing[6]
#define DAT_00086cfc DAT_00086ce0_backing[7]
/* Sizing pass: a small fixed lookup table indexed by a 4-bit nibble (`(*(byte*)(obj+1)>>1 &
   0xf)*2`, a ushort stride) -- real max byte offset is 15*2+2=32; no comment ever justified the
   original 65536- byte size. Sized to 64 bytes for headroom. */
/* Recovered from the original ARM UU.exe; retain the original table bounds. */
static undefined1 DAT_00086d60_backing[32] = {
  0xe4, 0x00, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00,
  0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03,
};
#define DAT_00086d60 DAT_00086d60_backing[0]
static short DAT_0018957e;
static short DAT_0018957c;
static short DAT_00189576;




/* Ghidra lost the return value (literal `return 0`), so the sole caller (emit_catalog_object)
   dereferenced NULL at `*(int *)(iVar29 + 4)` -> crash the moment an animated tile object (door,
   etc.) came into view. */
// was FUN_0001dc04
void *tick_anim_record(short catalog)
{
  undefined4 uVar1;
  int *piVar2;
  undefined *puVar3;
  int iVar4;
  int iVar5;
  void *rec_base;

  /* Native 3D catalog-object rendering (doors/frames drawing as real .E model geometry instead of
     flat sprites) is enabled by default -- no env var needed, unlike this project's earlier,
     now-removed g_model_map hack (which defaulted off). g_uw_3d_objects_enabled is a real global
     (not a function-local static) so the general debug panel (main_loop_hud_flush, hud.c) can
     flip it live instead of only at launch. */
  if (g_uw_3d_objects_enabled < 0) g_uw_3d_objects_enabled = (!g_opts.disable_3d_objects);
  if (g_uw_3d_objects_enabled && catalog > 0 && catalog < 30 && g_anim_model_slot[catalog] != 0) {
    void *dest = g_anim_model_scratch[catalog];
    memcpy(dest, g_anim_model_slot[catalog], 16384);
    return dest;
  }

  iVar4 = catalog * 0x3c2c;
  piVar2 = (int *)(&DAT_00189590 + iVar4);
  rec_base = piVar2;
  iVar5 = *piVar2;
  if (0 < iVar5) {
    puVar3 = &DAT_00110ff0 + iVar4;
    do {
      iVar5 = iVar5 + -1;
      uVar1 = *(undefined4 *)(puVar3 + 8);
      *(char *)(piVar2 + 2) = (char)uVar1;
      *(char *)((char *)piVar2 + 9) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 10) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xb) = (char)((uint)uVar1 >> 0x18);
      uVar1 = *(undefined4 *)(&DAT_00110ffc + iVar4);
      (&DAT_0018959c)[iVar4] = (char)uVar1;
      (&DAT_0018959d)[iVar4] = (char)((uint)uVar1 >> 8);
      (&DAT_0018959e)[iVar4] = (char)((uint)uVar1 >> 0x10);
      (&DAT_0018959f)[iVar4] = (char)((uint)uVar1 >> 0x18);
      uVar1 = *(undefined4 *)(puVar3 + 0x10);
      puVar3 = puVar3 + 0xc;
      *(char *)(piVar2 + 4) = (char)uVar1;
      *(char *)((char *)piVar2 + 0x11) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x12) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x13) = (char)((uint)uVar1 >> 0x18);
      piVar2 = piVar2 + 3;
      iVar4 = iVar4 + 0xc;
    } while (iVar5 != 0);
  }
  return rec_base;
}




// WARNING: Removing unreachable block (ram,0x00064024)

// was FUN_00061e60
/* Object-record pointer -- was `uint`, truncating it (same class as object_list_insert_head
   above). */
void emit_catalog_object(byte catalog, void *obj_ptr, char heading, short frame_or_texid)
{
  char *obj = (char *)obj_ptr;
  int uw_ord2005_rem_123 = 0; int uw_ord2005_rem_124 = 0;
  int iVar1;
  int iVar2;
  int iVar3;
  byte catalog_flags;
  byte bVar5;
  byte *pbVar6;
  short sVar7;
  byte bVar8;
  char cVar9;
  undefined2 uVar10;
  ushort tex_w;
  ushort tex_h;
  short sVar13;
  uint catalog_u;
  char *pcVar15;
  int iVar16;
  /* iVar16 stays `int` for its FIRST role (a small face-index scalar, `faces_remaining-1`, used
     only to seed iVar22/local_58 before the loop). */
  char *_face_rec;
  undefined4 uVar17;
  int iVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  uint uVar21;
  short extraout_r1;
  short extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int iVar22;
  byte *pbVar23;
  undefined1 *puVar24;
  ushort *puVar25;
  undefined4 *puVar26;
  int iVar27;
  undefined4 *puVar28;
  int iVar29;
  char *_anim;
  int iVar30;
  /* Same truncated-pointer bug as _face_rec (see its own comment), one variable over: iVar30 has a
     genuine dual role. */
  char *_vptr;
  /* DELIBERATE DEVIATION from the real binary. */
  int _v_offset;
  byte *_floor_tex = (byte *)0x0;
  undefined4 _vmin_bits;
  undefined4 _vext_bits;
  float _model_minz;
  float _model_extz;
  undefined4 *puVar31;
  undefined4 *puVar32;
  ushort local_7c;
  ushort local_7a;
  byte *texptr;
  int local_60;
  byte *local_58;
  int row_base;
  int faces_remaining;
  
  catalog_u = (uint)catalog;
  iVar1 = catalog_u * 4;
  catalog_flags = (&DAT_00086c08)[iVar1];
  *DAT_00110fc0 = 2;
  local_7a = 0xffff;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  local_58 = (byte *)0x0;
  uVar10 = get_catalog_sprite_width(10);
  *DAT_00110fc0 = uVar10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)DAT_0023bc88 * DAT_00086b30;
  puVar25 = (ushort *)(DAT_00110fc0 + 1);
  DAT_00189584 = (ushort)DAT_0023bc88 * DAT_00086b30;
  DAT_00110fc0 = (char *)puVar25;
  if ((catalog_flags & 0x20) == 0) {
    if ((catalog_flags & 0x80) == 0) {
      uVar21 = (int)(short)(ushort)catalog_flags & 7;
      if (uVar21 != 0) {
        iVar29 = 0;
        do {
          *puVar25 = 2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = get_catalog_sprite_width(iVar29);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (ushort)DAT_0023bc88 * DAT_00086b30 * 0x100;
          puVar25 = (ushort *)(DAT_00110fc0 + 1);
          DAT_00110fc0 = (char *)puVar25;
          (&DAT_00189570)[iVar29] =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (ushort)DAT_0023bc88 * DAT_00086b30 * 0x100;
          iVar29 = (iVar29 + 1) * 0x10000 >> 0x10;
        } while (iVar29 < (int)uVar21);
      }
    }
    else {
      DAT_0023b804 = 1;
      uVar21 = read_realtime_clock_units();
      tex_w = (ushort)(uVar21 >> 6);
      local_7c = tex_w & 7;
      if ((uVar21 >> 6 & 4) != 0) {
        local_7c = 3 - (tex_w & 3);
      }
      uVar21 = (int)(short)(ushort)catalog_flags & 7;
      puVar25 = (ushort *)(DAT_00110fc0);
      if (uVar21 != 0) {
        iVar29 = 0;
        do {
          *puVar25 = 2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = get_catalog_sprite_width(iVar29);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (*(ushort *)(obj + 6) >> 6 & 0x1ff) + local_7c;
          puVar25 = (ushort *)(DAT_00110fc0 + 1);
          DAT_00110fc0 = (char *)puVar25;
          (&DAT_00189570)[iVar29] =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               ((*(ushort *)(obj + 6) & 0x7fc0) >> 6) + local_7c;
          iVar29 = (iVar29 + 1) * 0x10000 >> 0x10;
        } while (iVar29 < (int)uVar21);
      }
    }
  }
  else {
    local_58 = (byte *)get_texture_page((int)frame_or_texid);
    if (local_58 == (byte *)0x0) {
      /* frame_or_texid out of get_texture_page's 0..0x73 range -- reached with (uVar27 & 0xf) +
         DAT_00202734 (~0x2b8) from emit_tile_objects's `(*catalog & 0x30) == 0x30` branch... */
      return;
    }
    bVar5 = *local_58;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(0);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)bVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(10);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_0023b4e0 * DAT_00086b30;
    DAT_00189584 = (ushort)DAT_0023b4e0 * DAT_00086b30;
    puVar25 = (ushort *)(DAT_00110fc0 + 1);
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189570 = (ushort)bVar5;
  }
  iVar29 = (int)frame_or_texid;
  if ((catalog_flags & 0x10) != 0) {
    bVar5 = (&DAT_00086c0b)[iVar1];
    if (frame_or_texid < 0) {
      if (catalog_u == 2) {
        bVar8 = (bVar5 >> 5) + 1;
        if ((*(byte *)(obj + 1) >> 1 & 0xf) < bVar8) {
          DAT_0023b834 = 2;
          /* real ARM idivmod leaves the remainder in r1 (Ghidra's extraout_r1);
             gets it by name off ordint_divmod's own divmod_result now. */
          extraout_r1 = (short)ordint_divmod(bVar8,*(byte *)(obj + 1) >> 1 & 0xf).rem;
          uVar21 = (uint)DAT_00202734;
          *puVar25 = 2;
          iVar29 = (bVar5 & 0x1f) + (int)extraout_r1 + uVar21 + 0x10;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = get_catalog_sprite_width(0xb);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = *(ushort *)(&DAT_00086d60 + (*(byte *)(obj + 1) >> 1 & 0xf) * 2);
          DAT_00110fc0 = DAT_00110fc0 + 1;
          DAT_00189586 = *(undefined2 *)(&DAT_00086d60 + (*(byte *)(obj + 1) >> 1 & 0xf) * 2);
          *DAT_00110fc0 = 0xb2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = 6;
          puVar25 = (ushort *)(DAT_00110fc0 + 1);
          DAT_00110fc0 = (char *)puVar25;
        }
        else {
          emit_floor_texture_select(0,DAT_0023b4e0,
                       ((*(byte *)(obj + 1) >> 1 & 0xf) - (uint)(bVar5 >> 5)) + -1);
          /* The real branch textures the bridge through draw-list commands (0x3e/0xb2) this port
             has no consumer for -- resolve the same floor texture emit_floor_texture_select just
             selected (index +0x30 full-res / +0x6a low-res, its own level threshold) directly... */
          _floor_tex = (byte *)get_texture_page(
              (((*(byte *)(obj + 1) >> 1 & 0xf) - (uint)(bVar5 >> 5)) + -1) +
              (((int)(DAT_0023b4e0 & 0xff) < (int)DAT_00086b24) ? 0x30 : 0x6a));
          iVar29 = -1;
          *DAT_00110fc0 = 0xb2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = DAT_0023b81c;
          puVar25 = (ushort *)(DAT_00110fc0 + 1);
          DAT_00110fc0 = (char *)puVar25;
        }
      }
      else {
        cVar9 = (bVar5 >> 5) + 1;
        if (cVar9 != '\0') {
          extraout_r1_00 = (short)ordint_divmod(cVar9,*(byte *)(obj + 1) >> 1 & 0xf).rem;
          iVar29 = (bVar5 & 0x1f) + (int)extraout_r1_00 + (uint)DAT_00202734 + 0x10;
        }
      }
    }
    if (-1 < (short)(ushort)iVar29) {
      *puVar25 = 0xc0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)iVar29;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023bc88 * DAT_00086b30;
      puVar25 = (ushort *)(DAT_00110fc0 + 1);
      DAT_00110fc0 = (char *)puVar25;
    }
    DAT_0023b818 = 0xe0;
  }
  tex_w = DAT_0023b91c;
  if ((catalog_flags & 8) != 0) {
    *puVar25 = 0x4c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x400 - tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + 0x30;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (0x400 - tex_w) * 2 - 1;
    puVar25 = (ushort *)(DAT_00110fc0 + 1);
    DAT_00110fc0 = (char *)puVar25;
  }
  *puVar25 = 0x18;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b904;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b904 >> 0x10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b91c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b91c >> 0x10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b920;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b920 >> 0x10;
  cVar9 = DAT_0023b4a0;
  puVar25 = (ushort *)(DAT_00110fc0 + 1);
  DAT_00110fc0 = (char *)puVar25;
  if (heading < '\0') {
    uw_ord2005_rem_123 = ((int)((*(ushort *)(obj + 2) >> 7 & 7) + (4 - DAT_0023b4a0) * 2)) % (8);
    local_7c = (ushort)((uint)(uw_ord2005_rem_123 << 0x1d) >> 0x10);
  }
  else {
    local_7c = ((short)heading + DAT_0023b4a0 * -4) * 0x1000;
  }
  if (((catalog_flags & 0x40) != 0) && ((catalog_flags & 0x10) == 0)) {
    if (obj < DAT_002046c4) {
      tex_w = ((*(byte *)(obj + 0x14) >> 3) - 0x10) * 0x266;
      uw_ord2005_rem_124 = ((int)((*(ushort *)(obj + 2) >> 2 & 0xe0) + cVar9 * -0x40 +
                         (*(byte *)(obj + 0x18) & 0x1f) + 0x100)) % (0x100);
      local_7c = (ushort)((uint)(uw_ord2005_rem_124 << 0x18) >> 0x10);
    }
    else {
      tex_w = 0;
    }
    *puVar25 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_h = get_catalog_sprite_width(5);
    *DAT_00110fc0 = tex_h;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = tex_w;
    puVar25 = (ushort *)(DAT_00110fc0 + 1);
    DAT_00110fc0 = (char *)puVar25;
    DAT_0018957a = tex_w;
  }
  if (((catalog_u == 0x10) || (catalog_u == 0x11)) && (DAT_0023b830 == '\0' && DAT_00086b2c == 0)) {
    local_7a = 0;
  }
  else if (((DAT_0023b830 == '\0') && ((*(byte *)(DAT_00086df8 + 0xb5) & 0xf0) == 0x10)) &&
          (catalog_u == 2)) {
    local_7a = 1;
  }
  if (local_7a != 0xffff) {
    *puVar25 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(8);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = local_7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = local_7a;
  }
  sVar13 = (short)iVar29;
  if ((sVar13 < 0) || ((sVar13 == 0 && (catalog_u == 0xc)))) {
    tex_w = 0x40;
    tex_h = 0x40;
    texptr = (byte *)0x0;
  }
  else if (local_58 == (byte *)0x0) {
    pcVar15 = (char *)lookup_grtile_by_id(iVar29);
    tex_w = (ushort)(byte)pcVar15[1];
    tex_h = (ushort)(byte)pcVar15[2];
    if (*pcVar15 == '\x04') {
      texptr = (byte *)(pcVar15 + 5);
    }
    else {
      texptr = (byte *)decompress_gr_bitmap(pcVar15 + 4,&DAT_00202520 + (uint)(byte)pcVar15[3] * 0x10,*pcVar15);  /* compression-mode byte: same dropped-3rd-arg bug fixed at every sibling call site */
    }
  }
  else {
    texptr = local_58;
    tex_w = DAT_0023b824;
    tex_h = DAT_0023b824;
  }
  if (_floor_tex != (byte *)0x0) {
    texptr = _floor_tex;
    tex_w = DAT_0023b824;
    tex_h = DAT_0023b824;
  }
  _anim = (char *)tick_anim_record(catalog);
  faces_remaining = *(int *)(_anim + 4);
  /* HACK: ARM 0x65394 places models at packed_slot * 32 + 16. DFRAME.E's outer edges are at local X
     +/-128, so packed slot 3 or 4 leaves a 16-unit wall gap on one side and protrudes on the other.
     No integer packed slot centers a 256-unit frame at 128. */
  if (catalog_u == 1 && (local_7c & 0x3fff) == 0) {
    int _quarter = local_7c >> 14;
    int _along = ((_quarter & 1) ? DAT_0023b920 : DAT_0023b904) & 0xff;
    float _left = (_quarter == 1 || _quarter == 2) ? _along - 256 : -_along;
    float _right = _left + 256;
    for (int _point = 0; _point < *(int *)_anim; _point++) {
      float *_x = (float *)(_anim + 8 + _point * 12);
      if (*_x == -128.0f) *_x = _left;
      else if (*_x == 128.0f) *_x = _right;
    }
  }
  _model_minz = 0.0f;
  _model_extz = 1.0f;
  { int _pc = *(int *)_anim;
    if (_pc > 0) {
      float _maxz = 0.0f;
      int _pi;
      for (_pi = 0; _pi < _pc; _pi++) {
        float _z = *(float *)(_anim + 8 + _pi*0xc + 8);
        if (_pi == 0 || _z < _model_minz) _model_minz = _z;
        if (_pi == 0 || _z > _maxz) _maxz = _z;
      }
      if (_maxz > _model_minz) _model_extz = _maxz - _model_minz;
    }
  }
  iVar16 = faces_remaining + -1;
  if (-1 < iVar16) {
    iVar2 = (int)(short)tex_w;
    iVar3 = (int)(short)tex_h;
    iVar22 = iVar16 * 0x60;
    row_base = iVar16 * 0x18;
    do {
      sVar7 = DAT_000da47c;
      _face_rec = iVar22 + _anim + 0xc14;
      _v_offset = 0xc;
      _vmin_bits = *(undefined4 *)(_anim + 0x3c24);
      _vext_bits = *(undefined4 *)(_anim + 0x3c28);
      { int _vc = *(int *)_face_rec, _ci, _flat = (_vc > 1);
        float _y0 = *(float *)(_anim + 8 + *(int *)(_face_rec + 4) * 0xc + 4);
        for (_ci = 1; _ci < _vc && _ci < 4; _ci++)
          if (*(float *)(_anim + 8 + *(int *)(_face_rec + 4 + _ci * 4) * 0xc + 4) != _y0) _flat = 0;
        if (_flat) {
          _v_offset = 0x10;
          memcpy(&_vmin_bits, &_model_minz, 4);
          memcpy(&_vext_bits, &_model_extz, 4);
        }
      }
      *(char *)(_face_rec + 0x4c) = (char)DAT_000da47c;
      *(char *)(_face_rec + 0x4d) = (char)((ushort)sVar7 >> 8);
      cVar9 = (char)(sVar7 >> 0xf);
      *(char *)(_face_rec + 0x4e) = cVar9;
      *(char *)(_face_rec + 0x4f) = cVar9;
      /* DEVIATION FROM THE ORIGINAL, deliberate and opt-in by data: a
         per-face colour.

         The original paints a whole built-in model in ONE colour -- entry 1 of
         its auxiliary palette when it has two, else entry 0 -- for every face.
         That is faithful, not a decompile artefact: UU.exe's FUN_00061e60
         assigns its palette pointer once before the face loop and never
         advances it, so the `else` branch below is the original's behaviour
         verbatim.

         The DOS bytecode, though, carries a colour per face (opcode 0x00bc),
         and models_dos.c decodes it to an index into that same palette. Using
         it makes the table, barrel and chair two-tone as the data intends.

         This CANNOT affect the Pocket PC path, by two independent guards:
         uw_dos_model_face_colour only ever returns >= 0 for a model
         models_dos.c actually decoded, and the index must land inside this
         model's own palette (its entry count is the low 3 bits of the catalog
         flags, at most 3) -- while the .E files' own colour codes are ff04 and
         up, i.e. 4 or more, so they could never qualify even if they reached
         here. */
      int _dos_colour = uw_dos_model_face_colour((int)catalog_u, row_base / 0x18);
      if (_dos_colour >= 0 && _dos_colour < (int)(catalog_flags & 7)) {
        uVar10 = 0;
        *(char *)(_face_rec + 0x50) = (&DAT_00086c09)[iVar1 + _dos_colour];
      }
      else {
      cVar9 = (&DAT_00086c09)[iVar1];
      pbVar23 = &DAT_00086c08 + iVar1;
      pbVar6 = (byte *)0x0;
      if (cVar9 != '\0') {
        pbVar23 = (byte *)(uintptr_t)(byte)(&DAT_00086c0a)[iVar1];
        pbVar6 = pbVar23;
      }
      if (cVar9 != '\0' && pbVar6 != (byte *)0x0) {
        uVar10 = (undefined2)((uint)(uintptr_t)pbVar23 >> 8);
        *(char *)(_face_rec + 0x50) = (char)(uintptr_t)pbVar23;
      }
      else {
        uVar10 = 0;
        *(char *)(_face_rec + 0x50) = cVar9;
      }
      }
      *(char *)(_face_rec + 0x51) = (char)uVar10;
      *(char *)(_face_rec + 0x52) = (char)((ushort)uVar10 >> 8);
      *(undefined1 *)(_face_rec + 0x53) = 0;
      *(char *)(_face_rec + 0x18) = (char)(uintptr_t)texptr;
      *(char *)(_face_rec + 0x19) = (char)((uint)(uintptr_t)texptr >> 8);
      *(char *)(_face_rec + 0x1a) = (char)((uint)(uintptr_t)texptr >> 0x10);
      *(char *)(_face_rec + 0x1b) = (char)((uint)(uintptr_t)texptr >> 0x18);
      *(char *)(_face_rec + 0x1c) = (char)tex_w;
      *(char *)(_face_rec + 0x1d) = (char)(tex_w >> 8);
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x1e) = (short)tex_w >> 0xf;
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x1f) = (short)tex_w >> 0xf;
      *(char *)(_face_rec + 0x20) = (char)tex_h;
      *(char *)(_face_rec + 0x21) = (char)(tex_h >> 8);
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x22) = (short)tex_h >> 0xf;
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x23) = (short)tex_h >> 0xf;
      /* DEVIATION FROM THE ORIGINAL, deliberate: the pillar is clamped too.

         The original clamps catalog 1 alone -- `if (uVar13 == 1)` in UU.exe's
         FUN_00061e60, and that binary contains exactly one 1024.0f compare,
         so there is no second clamp anywhere. But exactly TWO models are
         authored with the 1024 "reaches the ceiling" sentinel, and the clamp
         covered one of them:

             catalog  1  door frame   DFRAME.E  0..1024   model 0x01, 0x008c x4
             catalog 10  pillar       NEWPILL.E 0..1024   model 0x0a, 0x008c x4

         Both asset sets agree, since models_dos.c emits the same 1024 for the
         DOS "extend to ceiling" opcode. Measured on the pillar at tile
         (34,17) before this change: anchor 768 plus a model height of 1024
         put its top at 1792 against a 1024 ceiling, three quarters of a tile
         through it. It is easy to miss in play because the ceiling plane
         hides the overshoot from most angles. */
      if (catalog_u == 1 || catalog_u == 10) {
        local_60 = 0;
        do {
          iVar27 = (int)(short)DAT_0023b91c;
          iVar30 = *(int *)(_anim + 0xc14 + (row_base + local_60) * 4 + 4);
          uVar17 = ordfloat_int_to_float2(iVar27);
          uVar17 = ordfloat_add(*(undefined4 *)(iVar30 * 0xc + _anim + 0xc),uVar17);
          iVar18 = ordfloat_gt(uVar17,0x44800000);
          if (iVar18 != 0) {
            uVar17 = ordfloat_int_to_float2(0x400 - iVar27);
            puVar24 = (undefined1 *)((iVar30 + 1) * 0xc + _anim);
            *puVar24 = (char)uVar17;
            puVar24[1] = (char)((uint)uVar17 >> 8);
            puVar24[2] = (char)((uint)uVar17 >> 0x10);
            puVar24[3] = (char)((uint)uVar17 >> 0x18);
          }
          local_60 = (local_60 + 1) * 0x10000 >> 0x10;
        } while (local_60 < 4);
        _vptr = *(int *)(_face_rec + 8) * 0xc + _anim;
        uVar17 = ordfloat_int_to_float2(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar19 = ordfloat_mul(uVar19,0x3b800000);
        uVar19 = ordfloat_uint_to_float(ordfloat_mul(uVar19,uVar17));
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = ordfloat_int_to_float2(iVar3 + -1);
        puVar28 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xf),
                          CONCAT12(*(undefined1 *)(_face_rec + 0xe),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0xd),
                                            *(undefined1 *)(_face_rec + 0xc)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = ordfloat_mul(uVar17,0x3b800000);
        uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar17,uVar19));
      }
      else if (((catalog_u == 0xe) || (catalog_u == 0xf)) || (catalog_u == 0x13)) {
        _vptr = *(int *)(_face_rec + 0xc) * 0xc + _anim;
        uVar17 = ordfloat_int_to_float2(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        puVar28 = (undefined4 *)(_anim + 0x3c20);
        uVar19 = ordfloat_div(uVar19,*puVar28);
        uVar19 = ordfloat_uint_to_float(ordfloat_mul(uVar19,uVar17));
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = ordfloat_int_to_float2(iVar3 + -1);
        puVar31 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        puVar32 = (undefined4 *)(_anim + 0x3c28);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xb),
                          CONCAT12(*(undefined1 *)(_face_rec + 10),
                                   CONCAT11(*(undefined1 *)(_face_rec + 9),*(undefined1 *)(_face_rec + 8))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = ordfloat_div(uVar17,_vext_bits);
        uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar17,uVar19));
      }
      else {
        _vptr = *(int *)(_face_rec + 8) * 0xc + _anim;
        uVar17 = ordfloat_int_to_float2(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        puVar28 = (undefined4 *)(_anim + 0x3c20);
        uVar19 = ordfloat_div(uVar19,*puVar28);
        uVar19 = ordfloat_uint_to_float(ordfloat_mul(uVar19,uVar17));
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = ordfloat_int_to_float2(iVar3 + -1);
        puVar31 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        puVar32 = (undefined4 *)(_anim + 0x3c28);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        uVar20 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar19));
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xf),
                          CONCAT12(*(undefined1 *)(_face_rec + 0xe),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0xd),
                                            *(undefined1 *)(_face_rec + 0xc)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar20,uVar17));
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = ordfloat_div(uVar17,_vext_bits);
        uVar17 = ordfloat_uint_to_float(ordfloat_mul(uVar17,uVar19));
      }
      *(char *)(_face_rec + 0x40) = (char)uVar17;
      *(char *)(_face_rec + 0x41) = (char)((uint)uVar17 >> 8);
      *(char *)(_face_rec + 0x42) = (char)((uint)uVar17 >> 0x10);
      *(char *)(_face_rec + 0x43) = (char)((uint)uVar17 >> 0x18);
      local_58 = (byte *)((char *)local_58 + -0x18);
      /* BUG FIX (dropped loop update): the original steps BOTH per-face
         cursors here -- the byte offset into the part records (iVar22, -0x60)
         and the int index into those same records (row_base, -0x18, the very
         same step counted in ints rather than bytes). This decompile kept the
         first and lost the second. Confirmed against a Ghidra decompile of
         the real UU.exe (FUN_00061e60), whose loop tail is:

             local_58 = (byte *)((int)local_58 + -0x18);
             iVar25 = iVar25 + -0x60;

         row_base feeds exactly one thing -- the door-frame ceiling clamp
         earlier in this loop -- so frozen at `face_count - 1` the clamp
         re-read the LAST face's four vertices on every iteration and never
         once saw the lintel, whose vertices are the only ones authored at the
         1024 ceiling sentinel. The lintel therefore kept a full 1024 of model
         height stacked on the frame's world anchor and shot through the
         ceiling. Measured on a real door frame: anchor 640 with the lintel at
         model y 1024 put its top at 1664 against a 1024 ceiling; with the
         step restored the clamp fires on vertices 17 and 19 and the top lands
         at exactly 1024. */
      iVar22 = iVar22 + -0x60;
      row_base = row_base + -0x18;
      faces_remaining = faces_remaining + -1;
    } while (faces_remaining != 0);
  }
  uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b904);
  *(char *)(_anim + 0xc08) = (char)uVar17;
  *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
  uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b91c);
  *(char *)(_anim + 0xc0c) = (char)uVar17;
  *(char *)(_anim + 0xc0d) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc0e) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc0f) = (char)((uint)uVar17 >> 0x18);
  uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b920);
  *(char *)(_anim + 0xc10) = (char)uVar17;
  *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  if (((catalog_u != 0xe) && (catalog_u != 0xf)) && (catalog_u != 0xc)) goto LAB_000640ec;
  uVar21 = (int)((*(ushort *)(obj + 2) >> 7 & 7) + 1) >> 1;
  if (3 < uVar21) {
    uVar21 = 0;
  }
  switch(((uw_mobile_object_t *)g_player_object)->hdr.heading) {
  case 0:
    break;
  case 1:
    goto LAB_00064070;
  case 2:
LAB_00064070:
    uVar19 = (&DAT_00086cec)[uVar21 * 8];
    uVar17 = (&DAT_00086ce8)[uVar21 * 8];
    goto LAB_000640c0;
  case 3:
    goto LAB_00064088;
  case 4:
LAB_00064088:
    uVar19 = (&DAT_00086cf4)[uVar21 * 8];
    uVar17 = (&DAT_00086cf0)[uVar21 * 8];
    goto LAB_000640c0;
  case 5:
    goto LAB_0006409c;
  case 6:
LAB_0006409c:
    uVar19 = (&DAT_00086cfc)[uVar21 * 8];
    uVar17 = (&DAT_00086cf8)[uVar21 * 8];
    goto LAB_000640c0;
  case 7:
    break;
  default:
    goto switchD_00064038_default;
  }
  uVar19 = (&DAT_00086ce4)[uVar21 * 8];
  uVar17 = (&DAT_00086ce0)[uVar21 * 8];
LAB_000640c0:
  apply_model_position_offset(_anim,uVar17,0,uVar19);
switchD_00064038_default:
  scale_model_part_offsets(_anim,0x3f800000,0x3f99999a,0x3f800000);
LAB_000640ec:
  if (sVar13 < 0) {
    if (catalog_u == 7) {
      scale_model_part_offsets(_anim,0x40200000,0x40200000,0x40200000);
    }
    if ((sVar13 < 0) && ((catalog_u == 0x1b || (catalog_u == 0x19)))) {
      scale_model_part_offsets(_anim,0x40000000,0x40000000,0x40000000);
    }
  }
  if ((catalog_u == 0xe) || (catalog_u == 0xf)) {
    uVar17 = ordfloat_int_to_float2((int)(short)DAT_0018957a);
    uVar19 = ordfloat_int_to_float2((int)(short)local_7c);
    /* ARM 0x6415c: each softfloat return is the next call's r0. */
    uVar17 = ordfloat_add(uVar17,uVar19);
    local_7c = ordfloat_uint_to_float(uVar17);
  }
  uVar17 = ordfloat_int_to_float2((int)(short)local_7c);
  uVar17 = ordfloat_mul(uVar17,0x38000000);
  uVar17 = ordfloat_mul(uVar17,0x43340000);
  for (sVar13 = ordfloat_uint_to_float(uVar17); 0x168 < sVar13; sVar13 = sVar13 + -0x168) {
  }
  for (; sVar13 < 0; sVar13 = sVar13 + 0x168) {
  }
  /* General object tuner (UW_MODEL_TUNER=1) -- runs for every catalog this path draws, not just
     doors, so whatever real .E-model object is currently on screen (boulder, bridge, door frame,
     ...) gets a live rotation_offset field. */
  if ((int)catalog_u != g_tune_last_catalog) {
    g_tune_last_catalog = (int)catalog_u;
    g_tune_rotation_offset = 0.0;
  }
  /* This used to populate the shared debug-UI field list with a live per-catalog "Object Tuner"
     panel every time a model drew, which silently overwrote whatever the general debug panel
     (main_loop_hud_flush, hud.c) had just populated that same frame, since dbgui_begin/_end share
     one static field list. The debug panel is a general subsystem-toggle panel now, not a model
     debugger -- this site no longer touches it. g_tune_rotation_offset keeps applying below at
     its known-good default (0.0); it's just no longer live-editable from the UI. */
  sVar13 = (short)((int)sVar13 + (int)g_tune_rotation_offset);
  for (; 0x168 < sVar13; sVar13 = sVar13 + -0x168) {
  }
  for (; sVar13 < 0; sVar13 = sVar13 + 0x168) {
  }
  { int _rec_start = DAT_0023b83c;
  int _vtx_start = DAT_0023b838;
  build_euler_rotation_matrix(_anim,0,(int)sVar13,0);
  transform_points_by_matrix(&DAT_000a85d0,_anim);
  DAT_0023b83c = DAT_000a85d4;
  DAT_0023b838 = DAT_000a85d0;
  /* transform_points_by_matrix is original, unmodified code -- it has no idea g_tile_texptr_emit[]
     exists. */
  { int _ti; for (_ti = _rec_start; _ti < DAT_0023b83c; _ti++) {
      if ((unsigned)_ti < UW_MAX_VIS_TILES) g_tile_texptr_emit[_ti] = texptr;
    }
  }
  /* QA report: "backwards object model face sorting in a boulder object... a portion of the floor
     shows through the boulder, because far faces are drawn but near faces are hidden." This engine
     has no z-buffer and no backface culling (confirmed repeatedly this session)... */
  if (!g_opts.model_no_depth_sort && DAT_0023b83c > _rec_start) {
    double _eye_x = *(float *)&DAT_000db438, _eye_y = *(float *)&DAT_000db43c, _eye_z = *(float *)&DAT_000db440;
    int _n = DAT_0023b83c - _rec_start;
    /* This cap used to be 64, and a model with more faces than that was
       silently left UNSORTED -- no warning, no partial sort, nothing. The
       DOS boulder decodes to 65 faces, so it fell off this cliff and drew
       in raw emission order, which is what "far faces in front of nearer
       ones" looked like in play. A model can emit at most as many faces as
       its buffer holds parts, and that is 128 ((0x3c1c - 0xc14) / 0x60), so
       size for that with headroom rather than leaving a silent cutoff. */
    if (_n <= 256) {
      double _dist[256];
      int _order[256];
      int _k;
      for (_k = 0; _k < _n; _k++) {
        int rec = _rec_start + _k;
        int rb = rec * 0x60;
        /* Average the face's OWN vertices, not four of them. An emitted
           record is a count at +0 (tmap.c writes `(&DAT_000acde4)[..] = 4`
           for its tile quads) followed by that many indices from +4, and
           this sort used to read exactly four regardless. Everything the
           tile code emits is a quad, so that was invisible -- but a model's
           faces are not: ROCKBIG is 57 triangles out of 65, and for each of
           those the fourth slot was never written, so it read 0 and averaged
           model vertex 0 into the centroid. That put every triangle at the
           wrong depth, which is exactly the "far faces drawn in front of
           nearer ones" this sort exists to prevent. */
        int _vc = *(int *)(&DAT_000acde4 + rb);
        double cx = 0.0, cy = 0.0, cz = 0.0;
        int _vi;
        if (_vc < 3) _vc = 3;
        if (_vc > 23) _vc = 23;          /* the record holds at most 23 */
        for (_vi = 0; _vi < _vc; _vi++) {
          int iv = *(int *)(&DAT_000acde8 + rb + _vi * 4);
          float *p = (float *)((char *)DAT_000a85d0_backing + 8 + iv*0xc);
          cx += p[0]; cy += p[1]; cz += p[2];
        }
        cx /= _vc; cy /= _vc; cz /= _vc;
        double dx = cx - _eye_x, dy = cy - _eye_y, dz = cz - _eye_z;
        _dist[_k] = dx*dx + dy*dy + dz*dz;
        _order[_k] = _k;
      }
      /* Small N -- plain insertion sort, descending distance (farthest
         first, so nearer faces paint last and correctly cover them). */
      { int _a;
        for (_a = 1; _a < _n; _a++) {
          int _oi = _order[_a]; double _od = _dist[_oi];
          int _b = _a - 1;
          while (_b >= 0 && _dist[_order[_b]] < _od) { _order[_b+1] = _order[_b]; _b--; }
          _order[_b+1] = _oi;
        }
      }
      /* Apply via cycle-sort in place, whole-record memcpy plus the
         parallel g_tile_texptr_emit[] side channel. */
      { unsigned char _tmp[0x60]; void *_tmp_tex;
        unsigned char _done[256] = {0};
        int _a;
        for (_a = 0; _a < _n; _a++) {
          int _cur, _src;
          if (_done[_a] || _order[_a] == _a) { _done[_a] = 1; continue; }
          _cur = _a;
          memcpy(_tmp, (char *)&DAT_000acde4 + (_rec_start+_a)*0x60, 0x60);
          _tmp_tex = g_tile_texptr_emit[_rec_start+_a];
          while (!_done[_cur]) {
            _src = _order[_cur];
            _done[_cur] = 1;
            if (_src == _a) break;
            memcpy((char *)&DAT_000acde4 + (_rec_start+_cur)*0x60, (char *)&DAT_000acde4 + (_rec_start+_src)*0x60, 0x60);
            g_tile_texptr_emit[_rec_start+_cur] = g_tile_texptr_emit[_rec_start+_src];
            _cur = _src;
          }
          memcpy((char *)&DAT_000acde4 + (_rec_start+_cur)*0x60, _tmp, 0x60);
          g_tile_texptr_emit[_rec_start+_cur] = _tmp_tex;
        }
      }
    }
  }
  }
  if (local_7a != 0xffff) {
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(8);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = local_7a - 1 & 1;
    DAT_00189580 = local_7a - 1 & 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
  }
  *DAT_00110fc0 = 0x18;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
}



// WARNING: Removing unreachable block (ram,0x000647ac)

// was FUN_00064384
void emit_anim_object_frames(uint door_type, ushort *obj)
{
  short sVar1;
  int iVar3;
  byte bVar4;
  undefined2 uVar5;
  ushort uVar6;
  ushort uVar7;
  int iVar8;
  undefined4 uVar9;
  uint uVar10;
  uint uVar11;
  bool bVar12;
  char local_38;
  char local_37;
  ushort local_36;
  short local_34;
  short local_32;
  char local_30;
  short local_28;
  short sVar2;
  
  door_type = door_type & 7;
  local_38 = '\0';
  local_37 = '\x01';
  local_34 = -1;
  DAT_0023b834 = 1;
  if (door_type == 6) {
    local_34 = DAT_0023b91c;
    local_38 = '\x01';
    local_37 = -1;
    local_32 = DAT_0023b91c + (short)((*(byte *)((char *)obj + 1) & 0xe) >> 1) * -0x30;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar5 = get_catalog_sprite_width(5);
    *DAT_00110fc0 = uVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = *(byte *)((char *)obj + 1) >> 1 & 7;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_0018957a = (undefined2)((*(byte *)((char *)obj + 1) & 0xe) >> 1);
    *DAT_00110fc0 = 0x4c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (*(byte *)((char *)obj + 1) >> 1 & 7) * -0x30 + 0xd0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x0;
    sVar1 = local_32;
  }
  else {
    if (((*obj & 0xe00) != 0) || ((*obj & 0x1c0) == 0x1c0)) {
      DAT_0023b91c = DAT_0023b91c + -0xc0;
    }
    sVar1 = DAT_0023b91c;
    bVar4 = *(byte *)((char *)obj + 1);
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    /* Reverting the previous "quality" HACK here: fresh Ghidra headless decompiles of this exact
       function (FUN_00064384) and scheduler_step_entry (scheduler_step_entry) from the real UU.exe
       binary (Ghidra project /Users/ccuddigan/Projects/UW1/decomp) prove this line's original... */
    iVar8 = ((bVar4 >> 5 & 1) * 2 + -1) * (bVar4 >> 1 & 7);
    uVar5 = get_catalog_sprite_width(5);
    *DAT_00110fc0 = uVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)((uint)(iVar8 * 0x10000000) >> 0x10);
    DAT_0018957a = (undefined2)((iVar8 * 0x10000 >> 0x10) << 0xc);
  }
  local_36 = 0x330 - sVar1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x4c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = local_36;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  if (((*(byte *)((char *)obj + 1) & 0xe) == 0) || (local_34 != -1)) goto LAB_000647e4;
  uVar7 = (obj[1] >> 7) + DAT_0023b4a0 * -2;
  iVar8 = ((int)DAT_0023b904 - (int)g_current_view->view_x) * 0x10000;
  iVar3 = ((int)DAT_0023b920 - (int)g_current_view->view_y) * 0x10000;
  uVar6 = uVar7 & 3;
  if (uVar6 == 0) {
LAB_00064794:
    if (iVar3 < 0) {
LAB_0006479c:
      iVar8 = 1;
    }
    else {
LAB_00064754:
      iVar8 = 0;
    }
  }
  else {
    sVar1 = (short)((uint)iVar8 >> 0x10);
    sVar2 = (short)((uint)iVar3 >> 0x10);
    if (uVar6 == 1) {
      bVar12 = SBORROW4((int)sVar1,-(int)sVar2);
      iVar8 = (int)sVar1 + (int)sVar2;
LAB_00064750:
      if (iVar8 < 0 != bVar12) goto LAB_0006479c;
      goto LAB_00064754;
    }
    iVar3 = iVar8;
    if (uVar6 == 2) goto LAB_00064794;
    if (uVar6 == 3) {
      bVar12 = SBORROW4((int)sVar1,(int)sVar2);
      iVar8 = (int)sVar1 - (int)sVar2;
      goto LAB_00064750;
    }
    iVar8 = (int)local_32;
  }
  if (((int)(((uint)(*(byte *)((char *)obj + 1) >> 5) + (int)((short)(uVar7 & 7) >> 2) + iVar8) *
            0x10000) >> 0x10 & 1U) == 0) {
    local_37 = -1;
    local_38 = '\x01';
  }
LAB_000647e4:
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar7 = get_catalog_sprite_width(3);
  *DAT_00110fc0 = uVar7;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (*(byte *)((char *)obj + 1) >> 1 & 7) + (ushort)(-1 < local_34);
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189576 = (short)((*(byte *)((char *)obj + 1) & 0xe) >> 1) + (ushort)(-1 < local_34);
  uVar10 = (uint)local_38;
  if (uVar10 < 2) {
    do {
      if ((int)uVar10 < 0) {
        return;
      }
      if (uVar10 == 0) {
        if (DAT_0023b818 < '\x01') {
          emit_diagonal_wall_texture_select(0,DAT_0023bc88,DAT_0023b91c >> 6 & 0xff,g_current_tile->wall_tex);
        }
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = (short)((uint)((int)DAT_0023b824 * (int)DAT_0023b824) >> 8) * local_36 - 1;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar7 = get_catalog_sprite_width(7);
        *DAT_00110fc0 = uVar7;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_0023b824 * DAT_0023b824 - 1;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar7 = get_catalog_sprite_width(6);
        *DAT_00110fc0 = uVar7;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        DAT_0018957e = DAT_0023b824 * DAT_0023b824 + -1;
        DAT_0018957c = DAT_000b4620 + DAT_0023b81c * 8;
        if (DAT_0023b830 != 0) {
          *DAT_00110fc0 = 0xae;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = (g_current_tile->wall_tex) + 0xc0;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          DAT_000da47c = (g_current_tile->wall_tex) + 0xc0;
        }
        *DAT_00110fc0 = 0xb2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_0023b81c;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar9 = 1;
        uVar11 = g_current_tile->wall_tex;
LAB_00064cdc:
        emit_catalog_object(uVar9,obj,(obj[1] >> 7 & 7) << 1,uVar11);
      }
      else {
        if (DAT_0023b830 != 0) {
          *DAT_00110fc0 = 0xae;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = DAT_0023b830 - 1;
          DAT_000da47c = DAT_0023b830 - 1;
          DAT_00110fc0 = DAT_00110fc0 + 1;
        }
        if (local_34 < 0) {
          local_28 = (short)door_type;
          if (local_28 == 7) {
            if (DAT_0023b818 < '\x01') {
              emit_diagonal_wall_texture_select(0,DAT_0023bc88,DAT_0023b91c >> 6 & 0xff,
                           g_current_tile->wall_tex);
            }
            *DAT_00110fc0 = 0xb2;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_0023b81c;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = 2;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_0023b824 * DAT_0023b824 - 1;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            uVar9 = 0xf;
            uVar11 = g_current_tile->wall_tex;
          }
          else {
            /* Was `DAT_00202734 + door_type + 0x30` -- matches load_door_frames's own (fixed)
               scratch base; see that function's comment for why the original binary's formula
               collided with the HUD icon preload range... */
            uVar11 = 20000 + door_type;
            uVar9 = 0xe;
          }
          goto LAB_00064cdc;
        }
        DAT_0023b91c = local_34;
        emit_catalog_object(0xc,obj,(obj[1] >> 7 & 7) << 1,0);
        DAT_0023b91c = local_32;
      }
      local_30 = (char)uVar10;
      uVar10 = ((int)local_37 + (int)local_30) * 0x1000000 >> 0x18;
    } while ((int)uVar10 < 2);
  }
}



// was FUN_0001e594 -- adds a per-axis float offset (param_2/3/4, each an int converted to float via
// ordfloat_int_to_float2) to the model animation block's own stored position floats at offsets
// 0xc08/0xc0c/0xc10 (x/y/z).
/* was `int` -- truncated the real _anim pointer emit_catalog_object passes in, latent until the
   DAT_00202c9X object-property fix let real property data reach a nonzero case here */
void apply_model_position_offset(char *model, int offset_x, int offset_y, int offset_z)
{
  undefined4 uVar1;
  
  uVar1 = ordfloat_int_to_float2(offset_x);
  uVar1 = ordfloat_add(*(undefined4 *)(model + 0xc08),uVar1);
  *(char *)(model + 0xc08) = (char)uVar1;
  *(char *)(model + 0xc09) = (char)((uint)uVar1 >> 8);
  *(char *)(model + 0xc0a) = (char)((uint)uVar1 >> 0x10);
  *(char *)(model + 0xc0b) = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_int_to_float2(offset_y);
  uVar1 = ordfloat_add(*(undefined4 *)(model + 0xc0c),uVar1);
  *(char *)(model + 0xc0c) = (char)uVar1;
  *(char *)(model + 0xc0d) = (char)((uint)uVar1 >> 8);
  *(char *)(model + 0xc0e) = (char)((uint)uVar1 >> 0x10);
  *(char *)(model + 0xc0f) = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_int_to_float2(offset_z);
  uVar1 = ordfloat_add(*(undefined4 *)(model + 0xc10),uVar1);
  *(char *)(model + 0xc10) = (char)uVar1;
  *(char *)(model + 0xc11) = (char)((uint)uVar1 >> 8);
  *(char *)(model + 0xc12) = (char)((uint)uVar1 >> 0x10);
  *(char *)(model + 0xc13) = (char)((uint)uVar1 >> 0x18);
}



// was FUN_0001e6f0 -- multiplies (ordfloat_mul, float MULTIPLY) a model animation block's own
// position floats by per-axis scale factors (param_2/3/4). param_1[0] is read as a sub-part
// count...
void scale_model_part_offsets(void *model_block_ptr, int scale_x, int scale_y, int scale_z)
{
  int *model_block = (int *)model_block_ptr;
  undefined4 uVar1;
  int *part;
  int iVar3;
  
  iVar3 = 0;
  part = model_block;
  if (0 < *model_block) {
    do {
      uVar1 = ordfloat_mul(part[2],scale_x);
      *(char *)(part + 2) = (char)uVar1;
      *(char *)((char *)part + 9) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)part + 10) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)part + 0xb) = (char)((uint)uVar1 >> 0x18);
      uVar1 = ordfloat_mul(CONCAT13(*(undefined1 *)((char *)part + 0xf),
                                    CONCAT12(*(undefined1 *)((char *)part + 0xe),
                                             CONCAT11(*(undefined1 *)((char *)part + 0xd),
                                                      (char)part[3]))),scale_y);
      *(char *)(part + 3) = (char)uVar1;
      *(char *)((char *)part + 0xd) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)part + 0xe) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)part + 0xf) = (char)((uint)uVar1 >> 0x18);
      uVar1 = ordfloat_mul(CONCAT13(*(undefined1 *)((char *)part + 0x13),
                                    CONCAT12(*(undefined1 *)((char *)part + 0x12),
                                             CONCAT11(*(undefined1 *)((char *)part + 0x11),
                                                      (char)part[4]))),scale_z);
      *(char *)(part + 4) = (char)uVar1;
      iVar3 = iVar3 + 1;
      *(char *)((char *)part + 0x11) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)part + 0x12) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)part + 0x13) = (char)((uint)uVar1 >> 0x18);
      part = part + 3;
    } while (iVar3 < *model_block);
  }
}


// was FUN_00038680 -- loads every catalog 3D object model (.E files: door frame, footbridge, bench,
// lotus, rocks, arrow, beam, shrine, doors, tilemap decals, grave, gate, table, chest, nightstand,
// barrel/closet, chair, bed) via parse_e_model_file into their respective geometry buffers...
/* One model slot: from the DOS executable when the data directory is a DOS
   install, else from the slot's own DATA3D/*.E file.
 
   The port's slot order below is exactly DOS built-in model order shifted by
   one -- slot 0 is the door frame, DOS model 1 -- which is how `slot + 1`
   below is derived; see src/models_dos.c for the eight models whose geometry
   confirms the correspondence vertex for vertex.
 
   flip_winding is passed as 0 on the DOS path, and that is not "no flip":
   models_dos.c has already reversed every face itself. It has to, because
   reversing a textured quad also moves a different corner to the front of the
   vertex list and so rotates its texture, and only the decoder knows which
   faces carry texture coordinates saying the first vertex is the texture
   origin. See emit_face_order there. */
static void load_model_slot(int slot, char *e_path, byte *out_buffer, int flip_winding)
{
  if (uw_dos_models_available()) {
    /* Largest real model is the shrine, 80 vertices and 43 faces; 64KB is
       ample for any of them as text. Static rather than stack: this runs once
       per slot at startup and the frame would otherwise be enormous. */
    static char script[64 * 1024];
    if (uw_dos_model_script(slot + 1, script, sizeof script) > 0) {
      parse_e_model_script(script, out_buffer, 0);
      return;
    }
    DEBUG(INFO, "[models] slot %d has no DOS model -- trying %s\n", slot, e_path);
  }
  parse_e_model_file(e_path, out_buffer, flip_winding);
}

void load_3d_object_models()
{
  load_model_slot( 0, s__DATA3D_DFRAME_E_00085620, &DAT_00114c1c, 1);
  load_model_slot( 1, s__DATA3D_FBRIDGE_E_0008560c, &DAT_00118848, 1);
  load_model_slot( 2, s__DATA3D_BENCH_E_000855fc, &DAT_0011c474, 0);
  load_model_slot( 3, s__DATA3D_40LOTUS_E_000855e8, &DAT_001200a0, 0);
  load_model_slot( 4, s__DATA3D_ROCKSMAL_E_000855d4, &DAT_00123ccc, 0);
  load_model_slot( 5, s__DATA3D_ROCKMED_E_000855c0, &DAT_001278f8, 0);
  load_model_slot( 6, s__DATA3D_ROCKBIG_E_000855ac, &DAT_0012b524, 1);
  load_model_slot( 7, s__DATA3D_ARROW_E_0008559c, &DAT_0012f150, 0);
  load_model_slot( 8, s__DATA3D_BEAM_E_0008558c, &DAT_00132d7c, 0);
  load_model_slot( 9, s__DATA3D_NEWPILL_E_00085578, &DAT_001369a8, 0);
  load_model_slot(10, s__DATA3D_SHRINE_E_00085564, &DAT_0013a5d4, 0);
  load_model_slot(11, s__DATA3D_NEWPORT_E_00085550, &DAT_0013e200, 0);
  load_model_slot(12, s__DATA3D_NEWPORT_E_00085550, &DAT_00141e2c, 0);
  load_model_slot(13, s__DATA3D_DOOR_E_00085540, &DAT_00145a58, 0);
  load_model_slot(14, s__DATA3D_DOOR_E_00085540, &DAT_00149684, 0);
  load_model_slot(15, s__DATA3D_TMAP16X16_E_0008552c, &DAT_0014d2b0, 0);
  load_model_slot(16, s__DATA3D_TMAP16X16_E_0008552c, &DAT_00150edc, 0);
  load_model_slot(17, s__DATA3D_TMAP16X16_E_0008552c, &DAT_00154b08, 0);
  load_model_slot(18, s__DATA3D_GRAVE_E_0008551c, &DAT_00158734, 0);
  load_model_slot(19, s__DATA3D_TMAP16X16_E_0008552c, &DAT_0015c360, 0);
  load_model_slot(20, s__DATA3D_TMAP32X32_E_00085508, &DAT_0015ff8c, 0);
  load_model_slot(21, s__DATA3D_TMAP64X64_E_000854f4, &DAT_00163bb8, 0);
  load_model_slot(22, s__DATA3D_GATE_E_000854e4, &DAT_001677e4, 0);
  load_model_slot(23, s__DATA3D_TABLF3_E_000854d0, &DAT_0016b410, 0);
  load_model_slot(24, s__DATA3D_CHEST_E_000854c0, &DAT_0016f03c, 0);
  load_model_slot(25, s__DATA3D_NITESTAN_E_000854ac, &DAT_00172c68, 0);
  load_model_slot(26, s__DATA3D_BARRCLOS_E_00085498, &DAT_00176894, 0);
  load_model_slot(27, s__DATA3D_CHAIRSIM_E_00085484, &DAT_0017a4c0, 0);
  load_model_slot(28, s__DATA3D_BED2_E_00085474, &DAT_0017e0ec, 0);
  /* UW.EXE is only needed while the models load. */
  uw_dos_models_release();
  ce_memmove(&DAT_00189590,&DAT_00110ff0,0x78580);
  return;
}


// was FUN_00020a74 -- parses one DATA3D/*.E text-format 3D model script (param_1 = file path,
// param_2 = ~16KB per-model output buffer) into point positions and per-part (per-face)
// vertex-index lists. Called 29 times from load_3d_object_models at startup, once per model file.
/* Set by parse_e_model_script for exactly one following parse_e_model_file
   call, which opens it instead of a file. This pair exists so the DOS asset
   set -- whose models are bytecode inside UW.EXE, with no .E file anywhere
   (see src/models_dos.c) -- can reuse every line of the parser below rather
   than grow a second implementation of the output-buffer layout. Not
   reentrant, and not meant to be: model loading is a single-threaded
   startup step. */
static const char *g_e_model_script;
static unsigned int g_e_model_script_len;

void parse_e_model_script(const char *script, byte *out_buffer, int flip_winding)
{
  if (!script || !script[0]) return;
  g_e_model_script = script;
  g_e_model_script_len = (unsigned int)strlen(script);
  parse_e_model_file("<decoded from UW.EXE>", out_buffer, flip_winding);
  g_e_model_script = NULL;
}

/* Every .E model file in data/DATA3D/ is CRLF-terminated (confirmed via `xxd` on ROCKBIG.E: the
   PARTS block's last entry ends "...8);\r\n}\r\n"). */
static void *uw_e_model_strip_cr(void *raw_fh) {
  FILE *f = (FILE *)raw_fh;
  long sz;
  char *buf;
  size_t n, r, w;
  FILE *clean;
  if (!f) return NULL;
  if (fseek(f, 0, SEEK_END) != 0) return f;
  sz = ftell(f);
  fseek(f, 0, SEEK_SET);
  if (sz <= 0) return f;
  buf = (char *)malloc((size_t)sz + 1);
  if (!buf) return f;
  n = fread(buf, 1, (size_t)sz, f);
  fclose(f);
  for (r = 0, w = 0; r < n; r++) {
    if (buf[r] != '\r') buf[w++] = buf[r];
  }
  buf[w] = 0;
  /* fmemopen keeps a reference to buf, not a copy -- intentionally never freed (one small per-model
     leak at load time, ~29 models total, same tolerance this codebase already extends to other
     load-time scratch allocations). */
  clean = fmemopen(buf, w, "r");
  return clean ? clean : f;
}

/* HACK: not part of the original recovered signature -- see its own use site (the "HACK:
   flip_winding" comment, right before the PARTS block's per-face vertex-reversal) for the full
   rationale. */
void parse_e_model_file(char *path, byte *out_buffer, int flip_winding)
{
  char stack0xffdc3228_buf [256];
  char *stack0xffdc3228_ptr;
  undefined1 uVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  int *piVar9;
  int iVar10;
  undefined4 *puVar11;
  int *piVar12;
  undefined4 extraout_r3;
  undefined1 *puVar13;
  undefined1 *puVar14;
  undefined4 extraout_r3_00;
  char *pcVar15;
  undefined *puVar16;
  int *piVar17;
  char cVar18;
  int iVar19;
  int *piVar20;
  undefined4 *****pppppuVar21;
  char local_260 [4];
  /* local_25c/pvVar_fh hold the real fopen() handle from ce_fopen, used across the whole function's
     ce_fscanf (fscanf) calls -- were declared int... */
  void *local_25c;
  void *pvVar_fh;
  undefined *local_258;
  int local_254;
  undefined4 local_250;
  undefined1 auStack_24c [4];
  undefined4 local_248;
  undefined4 ***pppuStack_244;
  int local_240;
  int local_23c;
  undefined4 local_238;
  undefined4 local_234;
  undefined4 local_230;
  undefined4 local_22c;
  int local_228;
  int local_224;
  int local_220;
  undefined1 local_21c [4];
  undefined4 local_218;
  int local_214;
  int local_210;
  int local_20c;
  int local_208;
  int local_204;
  undefined4 local_200;
  int local_1fc;
  int local_1f8;
  int local_1f4;
  undefined4 local_1f0;
  undefined1 auStack_1ec [4];
  int local_1e8;
  int local_1e4;
  int local_1e0;
  uint local_1dc;
  undefined4 local_1d8;
  undefined4 ***local_1d4;
  undefined4 local_1d0;
  int local_1cc;
  undefined1 auStack_1c8 [104];
  undefined1 auStack_160 [16];
  undefined1 auStack_150 [16];
  undefined1 auStack_140 [16];
  char acStack_130 [260];

  local_258 = &DAT_000da480;
  ce_memset(acStack_130,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3228_ptr = acStack_130;
  do {
    cVar18 = *pcVar2;
    *stack0xffdc3228_ptr = cVar18; stack0xffdc3228_ptr = stack0xffdc3228_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar18 != '\0');
  if (g_e_model_script != 0) {
    /* An in-memory script from the DOS decoder -- already LF-only, so it
       skips uw_e_model_strip_cr. */
    pvVar_fh = fmemopen((void *)g_e_model_script, g_e_model_script_len, "r");
  }
  else {
    ce_strcat(acStack_130,path);
    pvVar_fh = ce_fopen(acStack_130,&DAT_00084a24);
    pvVar_fh = uw_e_model_strip_cr(pvVar_fh);
  }
  local_25c = pvVar_fh;
  /* This whole function's 11 fatal-error checks (NKDbgPrintfW message + terminate_process, killing
     the entire process) originally treated any malformed/unparseable ".E" model script as
     unrecoverable. */
  if (pvVar_fh == 0) {
    goto LAB_0002263c;
  }
  out_buffer[0xc08] = 0;
  out_buffer[0xc09] = 0;
  out_buffer[0xc0a] = 0;
  out_buffer[0xc0b] = 0;
  out_buffer[0xc0c] = 0;
  out_buffer[0xc0d] = 0;
  out_buffer[0xc0e] = 0;
  out_buffer[0xc0f] = 0;
  out_buffer[0xc10] = 0;
  out_buffer[0xc11] = 0;
  out_buffer[0xc12] = 0;
  out_buffer[0xc13] = 0;
  ce_fscanf(pvVar_fh,s__100s_00084a1c,auStack_1c8);
  iVar4 = ce_strcmp(auStack_1c8,s_BEGIN_00084a14);
  if (iVar4 != 0) {
    NKDbgPrintfW(s_Input_file_error__BEGIN_statemen_000849e8);
    goto LAB_0002263c;
  }
  pppppuVar21 = (undefined4 *****)&pppuStack_244;
  pcVar15 = &DAT_000d98c8;
  ce_fscanf(pvVar_fh,s__1s__a_z__1s_000849d8,auStack_24c,&DAT_000d98c8,pppppuVar21);
  /* Sizing-pass instrumentation (NEEDS_LIVE_INSTRUMENTATION): the %[a-z] conversion above has no
     width limit, so DAT_000d98c8's real need is whatever the longest actual token in the shipped .E
     model files is, not a value derivable from the format string alone. */
  pcVar2 = pcVar15;
  if (DAT_000db45c == (undefined1 *)0x0) {
    do {
      cVar18 = *pcVar15;
      pcVar15 = pcVar15 + 1;
      if (cVar18 != ' ') {
        *pcVar2 = cVar18;
        pcVar2 = pcVar2 + 1;
      }
    } while (cVar18 != '\0');
    DAT_000db45c = &DAT_000d98c8;
  }
  piVar20 = (int *)&DAT_000c9dd8;
  while( true ) {
    pvVar_fh = local_25c;
    iVar4 = ce_fscanf(local_25c,s__100s_1s_000849cc,auStack_1c8,local_260,pppppuVar21);
    /* Real .E files are inconsistent about a space before a block keyword's opening brace --
       confirmed directly against the shipped files... */
    if (iVar4 == 2) {
      size_t _tklen = ce_strlen(auStack_1c8);
      if (_tklen > 0 && ((char *)auStack_1c8)[_tklen - 1] == '{') {
        ((char *)auStack_1c8)[_tklen - 1] = '\0';
        ungetc(local_260[0], (FILE *)local_25c);
        local_260[0] = '{';
      }
    }
    if (((iVar4 == -1) && (iVar5 = ce_strncmp(auStack_1c8,&DAT_000849c8,3), iVar5 == 0)) ||
       ((iVar4 != 0 && (iVar5 = ce_strcmp(auStack_1c8,&DAT_000849c8), iVar5 == 0))))
    goto LAB_0002263c;
    if (iVar4 == -1) break;
    if ((iVar4 != 2) || (local_260[0] != '{')) {
      NKDbgPrintfW(s_error___s__c_000849b8,auStack_1c8,(int)local_260[0]);
    }
    iVar4 = ce_strcmp(auStack_1c8,s_VERSION_000849b0);
    if (iVar4 == 0) {
      ce_fscanf(pvVar_fh,&DAT_000849ac,&DAT_000db454);
      pcVar2 = &DAT_000849a8;
LAB_00022604:
      iVar4 = ce_fscanf(pvVar_fh,pcVar2,local_260);
    }
    else {
      iVar4 = ce_strcmp(auStack_1c8,s_NAMES_000849a0);
      if (iVar4 == 0) {
        puVar16 = &DAT_000da480;
        do {
          pppppuVar21 = (undefined4 *****)&pppuStack_244;
          local_1cc = ce_fscanf(pvVar_fh,s__1s______1s_00084994,auStack_24c,puVar16,pppppuVar21);
          uVar7 = 0;
          if (local_1cc != 0) {
            iVar4 = ce_strlen(puVar16);
            puVar16 = puVar16 + iVar4 + 1;
            uVar7 = extraout_r3;
          }
          iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260,uVar7,pppppuVar21);
          DAT_000db458 = DAT_000db458 + 1;
        } while (local_260[0] == ';');
      }
      else {
        iVar4 = ce_strcmp(auStack_1c8,s_POINTS_0008498c);
        if (iVar4 == 0) {
          iVar5 = -10000;
          iVar3 = 10000;
          g_model_parse_point_count = 0;
          iVar4 = iVar3;
          iVar10 = iVar5;
          while( true ) {
            pppppuVar21 = (undefined4 *****)&local_214;
            iVar6 = ce_fscanf(local_25c,s__d__d__d__00084980,&local_204,&local_224,pppppuVar21);
            iVar19 = g_model_parse_point_count;
            if (iVar6 != 3) break;
            iVar6 = g_model_parse_point_count * 0x2c;
            (&DAT_000d2ab0)[iVar6] = (char)local_204;
            if (local_204 < iVar4) {
              iVar4 = local_204;
            }
            (&DAT_000d2ab1)[iVar6] = (char)((uint)local_204 >> 8);
            if (iVar10 < local_204) {
              iVar10 = local_204;
            }
            (&DAT_000d2ab2)[iVar6] = (char)((uint)local_204 >> 0x10);
            if (local_224 < iVar3) {
              iVar3 = local_224;
            }
            (&DAT_000d2ab3)[iVar6] = (char)((uint)local_204 >> 0x18);
            (&DAT_000d2ab4)[iVar6] = (char)local_224;
            if (iVar5 < local_224) {
              iVar5 = local_224;
            }
            (&DAT_000d2ab5)[iVar6] = (char)((uint)local_224 >> 8);
            (&DAT_000d2ab6)[iVar6] = (char)((uint)local_224 >> 0x10);
            (&DAT_000d2ab7)[iVar6] = (char)((uint)local_224 >> 0x18);
            (&DAT_000d2ab8)[iVar6] = (char)(uintptr_t)local_214;
            (&DAT_000d2ab9)[iVar6] = (char)((uint)(uintptr_t)local_214 >> 8);
            (&DAT_000d2aba)[iVar6] = (char)((uint)(uintptr_t)local_214 >> 0x10);
            (&DAT_000d2abb)[iVar6] = (char)((uint)(uintptr_t)local_214 >> 0x18);
            (&DAT_000d2ac8)[iVar6] = 8;
            (&DAT_000d2ac9)[iVar6] = 0;
            (&DAT_000d2aca)[iVar6] = 0;
            (&DAT_000d2acb)[iVar6] = 0;
            (&DAT_000d2abc)[iVar6] = 0;
            (&DAT_000d2abd)[iVar6] = 0;
            (&DAT_000d2abe)[iVar6] = 0;
            (&DAT_000d2abf)[iVar6] = 0;
            (&DAT_000d2ad0)[iVar6] = 0;
            (&DAT_000d2ad1)[iVar6] = 0;
            (&DAT_000d2ad2)[iVar6] = 0;
            (&DAT_000d2ad3)[iVar6] = 0;
            (&DAT_000d2ac0)[iVar6] = 0;
            (&DAT_000d2ac1)[iVar6] = 0;
            (&DAT_000d2ac2)[iVar6] = 0;
            (&DAT_000d2ac3)[iVar6] = 0;
            /* Was `ordfloat_int_to_float2()` with the argument dropped -- the two sibling
               conversions right below it (Y=local_224, Z=local_214) both pass their value
               explicitly; this one, the X coordinate, did not. */
            uVar7 = ordfloat_int_to_float2(local_204);
            out_buffer[iVar19 * 0xc + 8] = (char)uVar7;
            out_buffer[iVar19 * 0xc + 9] = (char)((uint)uVar7 >> 8);
            out_buffer[iVar19 * 0xc + 10] = (char)((uint)uVar7 >> 0x10);
            out_buffer[iVar19 * 0xc + 0xb] = (char)((uint)uVar7 >> 0x18);
            uVar7 = ordfloat_int_to_float2(local_224);
            puVar13 = out_buffer + (g_model_parse_point_count + 1) * 0xc;
            *puVar13 = (char)uVar7;
            puVar13[1] = (char)((uint)uVar7 >> 8);
            puVar13[2] = (char)((uint)uVar7 >> 0x10);
            puVar13[3] = (char)((uint)uVar7 >> 0x18);
            uVar7 = ordfloat_int_to_float2((int)local_214);
            iVar19 = g_model_parse_point_count;
            out_buffer[g_model_parse_point_count * 0xc + 0x10] = (char)uVar7;
            out_buffer[iVar19 * 0xc + 0x11] = (char)((uint)uVar7 >> 8);
            out_buffer[iVar19 * 0xc + 0x12] = (char)((uint)uVar7 >> 0x10);
            out_buffer[iVar19 * 0xc + 0x13] = (char)((uint)uVar7 >> 0x18);
            g_model_parse_point_count = g_model_parse_point_count + 1;
            if (600 < g_model_parse_point_count) {
              NKDbgPrintfW(s_Too_many_points___d__00084968);
              goto LAB_0002263c;
            }
          }
          DAT_000db4fc = g_model_parse_point_count;
          out_buffer[1] = (char)((uint)g_model_parse_point_count >> 8);
          *out_buffer = (char)iVar19;
          out_buffer[2] = (char)((uint)iVar19 >> 0x10);
          out_buffer[3] = (char)((uint)iVar19 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar4);
          out_buffer[0x3c1c] = (char)uVar7;
          out_buffer[0x3c1d] = (char)((uint)uVar7 >> 8);
          out_buffer[0x3c1e] = (char)((uint)uVar7 >> 0x10);
          out_buffer[0x3c1f] = (char)((uint)uVar7 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar10 - iVar4);
          out_buffer[0x3c20] = (char)uVar7;
          out_buffer[0x3c21] = (char)((uint)uVar7 >> 8);
          out_buffer[0x3c22] = (char)((uint)uVar7 >> 0x10);
          out_buffer[0x3c23] = (char)((uint)uVar7 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar3);
          out_buffer[0x3c24] = (char)uVar7;
          out_buffer[0x3c25] = (char)((uint)uVar7 >> 8);
          out_buffer[0x3c26] = (char)((uint)uVar7 >> 0x10);
          out_buffer[0x3c27] = (char)((uint)uVar7 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar5 - iVar3);
          pcVar2 = &DAT_000849a8;
          out_buffer[0x3c28] = (char)uVar7;
          out_buffer[0x3c29] = (char)((uint)uVar7 >> 8);
          out_buffer[0x3c2a] = (char)((uint)uVar7 >> 0x10);
          out_buffer[0x3c2b] = (char)((uint)uVar7 >> 0x18);
          pvVar_fh = local_25c;
          goto LAB_00022604;
        }
        iVar4 = ce_strcmp(auStack_1c8,s_PARTS_00084960);
        if (iVar4 == 0) {
          DAT_000c8b00 = &DAT_000c4c38;
          g_model_parse_part_count = 0;
          do {
            iVar5 = ce_fscanf(pvVar_fh,s___c_1____00084954,local_260);
            iVar4 = 1;
            if (iVar5 != 1) {
              puVar13 = local_21c;
              pppppuVar21 = (undefined4 *****)&local_1dc;
              ce_fscanf(pvVar_fh,s__d__1s__d__x__00084944,&local_23c,&local_254,pppppuVar21,puVar13)
              ;
              iVar4 = g_model_parse_part_count;
              iVar5 = g_model_parse_part_count * 0x67;
              (&DAT_000c9e2f)[iVar5] = (char)(uintptr_t)local_1dc;
              (&DAT_000c9e30)[iVar5] = (char)((uint)(uintptr_t)local_1dc >> 8);
              (&DAT_000c9e31)[iVar5] = (char)((uint)(uintptr_t)local_1dc >> 0x10);
              (&DAT_000c9e32)[iVar5] = (char)((uint)(uintptr_t)local_1dc >> 0x18);
              (&DAT_000c9e28)[iVar5] = (undefined1)local_254;
              (&DAT_000c9e0e)[iVar5] = (char)iVar4;
              (&DAT_000c9e0f)[iVar5] = (char)((uint)iVar4 >> 8);
              (&DAT_000c9e10)[iVar5] = (char)((uint)iVar4 >> 0x10);
              (&DAT_000c9e11)[iVar5] = (char)((uint)iVar4 >> 0x18);
              (&DAT_000c9e37)[iVar5] = 0xff;
              (&DAT_000c9e38)[iVar5] = 0xff;
              (&DAT_000c9e39)[iVar5] = 0xff;
              (&DAT_000c9e3a)[iVar5] = 0xff;
              (&DAT_000c9e33)[iVar5] = 0xff;
              (&DAT_000c9e34)[iVar5] = 0xff;
              (&DAT_000c9e35)[iVar5] = 0xff;
              (&DAT_000c9e36)[iVar5] = 0xff;
              out_buffer[iVar4 * 0x60 + 0xc6c] = 1;
              out_buffer[iVar4 * 0x60 + 0xc6d] = 0;
              out_buffer[iVar4 * 0x60 + 0xc6e] = 0;
              out_buffer[iVar4 * 0x60 + 0xc6f] = 0;
              puVar14 = out_buffer + (g_model_parse_part_count + 0x21) * 0x60;
              *puVar14 = 0xe0;
              puVar14[1] = 0;
              puVar14[2] = 0;
              puVar14[3] = 0;
              iVar4 = g_model_parse_part_count;
              iVar5 = g_model_parse_part_count * 0x67;
              if (local_23c == 4) {
                (&DAT_000c9e2b)[iVar5] = local_21c[0];
                (&DAT_000c9e2c)[iVar5] = local_21c[1];
                (&DAT_000c9e2d)[iVar5] = local_21c[2];
                (&DAT_000c9e2e)[iVar5] = local_21c[3];
                (&DAT_000c9de0)[iVar5] = 0xff;
                (&DAT_000c9de1)[iVar5] = 0xff;
                (&DAT_000c9de2)[iVar5] = 0xff;
                (&DAT_000c9de3)[iVar5] = 0xff;
                NKDbgPrintfW(s_got_bitmap__d___d_00084930);
                iVar4 = g_model_parse_part_count;
              }
              else {
                (&DAT_000c9e29)[iVar5] = local_21c[1];
                (&DAT_000c9de0)[iVar5] = local_21c[0];
                (&DAT_000c9de1)[iVar5] = 0;
                (&DAT_000c9de2)[iVar5] = 0;
                (&DAT_000c9de3)[iVar5] = 0;
              }
              iVar5 = local_23c;
              puVar16 = local_258;
              iVar10 = iVar4 * 0x67;
              if ((&DAT_000c9e26)[iVar10] == '\0') {
                uVar1 = 0xff;
                if (local_254 != 0x58) {
                  uVar1 = 0;
                }
                (&DAT_000c9e26)[iVar10] = uVar1;
              }
              if (iVar4 < DAT_000db458) {
                g_eparse_part_name[iVar10 / 0x67] = (char *)local_258;
                iVar4 = ce_strlen(local_258);
                puVar16 = puVar16 + iVar4 + 1;
                local_258 = puVar16;
              }
              else {
                g_eparse_part_name[iVar10 / 0x67] = NULL;
                puVar16 = (undefined *)0x0;
              }
              piVar17 = DAT_000c8b00;
              if (iVar5 == 0) {
LAB_000218b8:
                piVar12 = DAT_000c8b00 + 1;
                g_eparse_part_verts[iVar10 / 0x67] = (int *)piVar12;
                iVar5 = 0;
                DAT_000c8b00 = piVar12;
                iVar4 = ce_fscanf(local_25c,&DAT_000849a8,local_260,(uint)(uintptr_t)piVar12 >> 0x18,
                                     pppppuVar21,puVar13);
                iVar3 = 0;
                do {
                  iVar19 = iVar3;
                  ce_fscanf(local_25c,s__d_1s_000848c8,&local_210,local_260);
                  iVar3 = iVar19 + 1;
                  *DAT_000c8b00 = local_210;
                  DAT_000c8b00 = DAT_000c8b00 + 1;
                  iVar10 = g_model_parse_part_count * 0x18 + iVar5;
                  iVar5 = iVar5 + 1;
                  puVar13 = out_buffer + (iVar10 + 0x306) * 4;
                  *puVar13 = (char)local_210;
                  puVar13[1] = (char)((uint)local_210 >> 8);
                  puVar13[2] = (char)((uint)local_210 >> 0x10);
                  puVar13[3] = (char)((uint)local_210 >> 0x18);
                  iVar10 = g_model_parse_part_count;
                } while (local_260[0] == ',');
                out_buffer[g_model_parse_part_count * 0x60 + 0xc14] = (char)iVar5;
                out_buffer[iVar10 * 0x60 + 0xc15] = (char)((uint)iVar5 >> 8);
                out_buffer[iVar10 * 0x60 + 0xc16] = (char)((uint)iVar5 >> 0x10);
                out_buffer[iVar10 * 0x60 + 0xc17] = (char)((uint)iVar5 >> 0x18);
                /* HACK: flip_winding (new parameter, not part of the original recovered signature)
                   -- caller-supplied, per-model opt-in to reverse every face's just-read vertex
                   list. */
                if (flip_winding && 1 < iVar3) {
                  int _flip_lo = 0, _flip_hi = iVar3 - 1;
                  while (_flip_lo < _flip_hi) {
                    int *_flip_pa = (int *)(out_buffer + (g_model_parse_part_count * 0x18 + _flip_lo + 0x306) * 4);
                    int *_flip_pb = (int *)(out_buffer + (g_model_parse_part_count * 0x18 + _flip_hi + 0x306) * 4);
                    int _flip_tmp = *_flip_pa;
                    *_flip_pa = *_flip_pb;
                    *_flip_pb = _flip_tmp;
                    _flip_lo++; _flip_hi--;
                  }
                }
                iVar5 = *(int *)(out_buffer + g_model_parse_part_count * 0x60 + 0xc18);
                iVar10 = *(int *)(out_buffer + g_model_parse_part_count * 0x60 + 0xc20);
                vec3_sub(out_buffer + iVar5 * 0xc + 8,
                             out_buffer + *(int *)(out_buffer + g_model_parse_part_count * 0x60 + 0xc1c) * 0xc + 8,
                             auStack_150);
                vec3_sub(out_buffer + iVar5 * 0xc + 8,out_buffer + iVar10 * 0xc + 8,auStack_160);
                vec3_cross(auStack_160,auStack_150,auStack_140);
                if ((local_23c == 4) && (iVar3 != 4)) {
                  NKDbgPrintfW(s_Error__polygon__d__bitmap_must_h_00084898,g_model_parse_part_count);
                }
                if (iVar3 < 3) {
                  NKDbgPrintfW(s_Error__Part__d_is_a_polygon_with_00084868,g_model_parse_part_count,iVar3);
                }
                iVar5 = g_model_parse_part_count * 0x67;
                (&DAT_000c9ddc)[iVar5] = (char)iVar3;
                (&DAT_000c9ddd)[iVar5] = (char)((uint)iVar3 >> 8);
                (&DAT_000c9dde)[iVar5] = (char)((uint)iVar3 >> 0x10);
                (&DAT_000c9ddf)[iVar5] = (char)((uint)iVar3 >> 0x18);
                *piVar17 = iVar3;
                if (local_254 == 0x46) {
                  iVar5 = iVar3;
                  if (iVar3 < 0) {
                    iVar5 = iVar19 + 2;
                  }
                  iVar5 = iVar5 >> 1;
                  if (iVar5 != 0) {
                    puVar11 = (undefined4 *)(g_eparse_part_verts[g_model_parse_part_count] + iVar5);
                    puVar8 = (undefined4 *)(g_eparse_part_verts[g_model_parse_part_count] + (iVar3 - iVar5));
                    do {
                      iVar5 = iVar5 + -1;
                      uVar7 = puVar11[-1];
                      puVar11 = puVar11 + -1;
                      *puVar11 = *puVar8;
                      *puVar8 = uVar7;
                      puVar8 = puVar8 + 1;
                    } while (iVar5 != 0);
                  }
                }
                g_model_parse_part_count = g_model_parse_part_count + 1;
                if (0x15e < g_model_parse_part_count) {
                  NKDbgPrintfW(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                }
                if ((int *)&DAT_000c8a90 < DAT_000c8b00) {
                  NKDbgPrintfW(s_Out_of_vertex_list_space_00084908);
                  goto LAB_0002263c;
                }
                ce_fscanf(local_25c,&DAT_000849a8,local_260);
                pvVar_fh = local_25c;
              }
              else if (iVar5 == 1) {
                iVar4 = ce_fscanf(pvVar_fh,s__d__d_000848d0,&local_1e0,&local_20c,pppppuVar21,
                                     puVar13);
                piVar17 = DAT_000c8b00;
                iVar5 = g_model_parse_part_count * 0x67;
                (&DAT_000c9ddc)[iVar5] = 2;
                (&DAT_000c9ddd)[iVar5] = 0;
                (&DAT_000c9dde)[iVar5] = 0;
                (&DAT_000c9ddf)[iVar5] = 0;
                *piVar17 = 2;
                iVar5 = g_model_parse_part_count * 0x67;
                piVar17 = DAT_000c8b00 + 1;
                DAT_000c8b00 = piVar17;
                g_eparse_part_verts[iVar5 / 0x67] = (int *)piVar17;
                *piVar17 = local_1e0;
                DAT_000c8b00 = DAT_000c8b00 + 1;
                iVar5 = local_20c;
LAB_00021838:
                *DAT_000c8b00 = iVar5;
                DAT_000c8b00 = DAT_000c8b00 + 1;
                if ((int *)&DAT_000c8a90 < DAT_000c8b00) {
                  NKDbgPrintfW(s_Out_of_vertex_list_space_00084908);
                  goto LAB_0002263c;
                }
                g_model_parse_part_count = g_model_parse_part_count + 1;
                if (0x15e < g_model_parse_part_count) {
                  NKDbgPrintfW(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                }
                ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
              }
              else {
                if (1 < iVar5) {
                  if (iVar5 < 4) {
                    if (iVar5 == 2) {
                      (&DAT_000c9e3b)[iVar10] = 0;
                      (&DAT_000c9e3c)[iVar10] = 0;
                      (&DAT_000c9e3d)[iVar10] = 0;
                      puVar14 = (undefined1 *)0x0;
                      (&DAT_000c9e3e)[iVar10] = 0;
                    }
                    else {
                      ce_fscanf(pvVar_fh,&DAT_000848f4,&local_218,puVar16,pppppuVar21,puVar13);
                      NKDbgPrintfW(s_got_sphere__d_000848e4,local_218);
                      iVar4 = g_model_parse_part_count * 0x67;
                      puVar14 = &DAT_000c9dd8 + iVar4;
                      (&DAT_000c9e3b)[iVar4] = (char)local_218;
                      (&DAT_000c9e3c)[iVar4] = (char)((uint)local_218 >> 8);
                      (&DAT_000c9e3d)[iVar4] = (char)((uint)local_218 >> 0x10);
                      (&DAT_000c9e3e)[iVar4] = (char)((uint)local_218 >> 0x18);
                    }
                    iVar4 = ce_fscanf(pvVar_fh,&DAT_000849ac,&local_1f4,puVar14,pppppuVar21,puVar13)
                    ;
                    piVar17 = DAT_000c8b00;
                    iVar5 = g_model_parse_part_count * 0x67;
                    (&DAT_000c9ddc)[iVar5] = 1;
                    (&DAT_000c9ddd)[iVar5] = 0;
                    (&DAT_000c9dde)[iVar5] = 0;
                    (&DAT_000c9ddf)[iVar5] = 0;
                    *piVar17 = 1;
                    iVar5 = g_model_parse_part_count * 0x67;
                    DAT_000c8b00 = DAT_000c8b00 + 1;
                    g_eparse_part_verts[iVar5 / 0x67] = (int *)DAT_000c8b00;
                    iVar5 = local_1f4;
                    goto LAB_00021838;
                  }
                  if (iVar5 == 4) goto LAB_000218b8;
                  if (iVar5 == 5) {
                    piVar12 = &local_220;
                    pppppuVar21 = (undefined4 *****)&local_1d4;
                    iVar4 = ce_fscanf(pvVar_fh,s__d__d__d__d_00084924,&local_1fc,&local_228,
                                         pppppuVar21,piVar12);
                    piVar17 = DAT_000c8b00;
                    if (DAT_00084660 < local_228) {
                      DAT_00084660 = local_228;
                    }
                    iVar3 = -local_228;
                    if (iVar3 < DAT_0008465c) {
                      DAT_0008465c = iVar3;
                    }
                    if (DAT_00084670 < local_228) {
                      DAT_00084670 = local_228;
                    }
                    if (iVar3 < DAT_0008466c) {
                      DAT_0008466c = iVar3;
                    }
                    if (DAT_00084660 < local_220) {
                      DAT_00084660 = local_220;
                    }
                    iVar3 = -local_220;
                    if (iVar3 < DAT_0008465c) {
                      DAT_0008465c = iVar3;
                    }
                    if (DAT_00084670 < local_220) {
                      DAT_00084670 = local_220;
                    }
                    if (iVar3 < DAT_0008466c) {
                      DAT_0008466c = iVar3;
                    }
                    iVar3 = g_model_parse_part_count * 0x67;
                    (&DAT_000c9ddc)[iVar3] = 2;
                    (&DAT_000c9ddd)[iVar3] = 0;
                    (&DAT_000c9dde)[iVar3] = 0;
                    (&DAT_000c9ddf)[iVar3] = 0;
                    *piVar17 = 2;
                    iVar3 = g_model_parse_part_count * 0x67;
                    piVar17 = DAT_000c8b00 + 1;
                    DAT_000c8b00 = piVar17;
                    g_eparse_part_verts[iVar3 / 0x67] = (int *)piVar17;
                    *piVar17 = local_1fc;
                    DAT_000c8b00 = DAT_000c8b00 + 1;
                    *DAT_000c8b00 = (int)(uintptr_t)local_1d4;
                    iVar3 = g_model_parse_part_count;
                    piVar17 = DAT_000c8b00 + 1;
                    iVar5 = g_model_parse_part_count * 0x67;
                    DAT_000c8b00 = piVar17;
                    (&DAT_000c9e33)[iVar5] = (char)local_228;
                    (&DAT_000c9e34)[iVar5] = (char)((uint)local_228 >> 8);
                    (&DAT_000c9e35)[iVar5] = (char)((uint)local_228 >> 0x10);
                    (&DAT_000c9e36)[iVar5] = (char)((uint)local_228 >> 0x18);
                    (&DAT_000c9e37)[iVar5] = (char)local_220;
                    (&DAT_000c9e38)[iVar5] = (char)((uint)local_220 >> 8);
                    (&DAT_000c9e39)[iVar5] = (char)((uint)local_220 >> 0x10);
                    (&DAT_000c9e3a)[iVar5] = (char)((uint)local_220 >> 0x18);
                    if ((int *)&DAT_000c8a90 < piVar17) {
                      NKDbgPrintfW(s_Out_of_vertex_list_space_00084908);
                      goto LAB_0002263c;
                      iVar3 = g_model_parse_part_count;
                    }
                    g_model_parse_part_count = iVar3 + 1;
                    uVar7 = 0x15e;
                    if (0x15e < g_model_parse_part_count) {
                      NKDbgPrintfW(s_Too_many_polys_000848f8);
                      goto LAB_0002263c;
                      uVar7 = extraout_r3_00;
                    }
                    ce_fscanf(local_25c,&DAT_000849a8,local_260,uVar7,pppppuVar21,piVar12);
                    pvVar_fh = local_25c;
                    goto LAB_00021bec;
                  }
                }
                iVar4 = ce_fscanf(pvVar_fh,s_________c_000848d8,local_260,puVar16,pppppuVar21,
                                     puVar13);
              }
            }
LAB_00021bec:
            iVar5 = g_model_parse_part_count;
          } while (local_260[0] == ';');
          iVar10 = 0;
          out_buffer[5] = (char)((uint)g_model_parse_part_count >> 8);
          out_buffer[4] = (char)iVar5;
          out_buffer[6] = (char)((uint)iVar5 >> 0x10);
          out_buffer[7] = (char)((uint)iVar5 >> 0x18);
          iVar3 = g_model_parse_part_count;
          iVar5 = g_model_parse_part_count;
          piVar17 = piVar20;
          if (0 < g_model_parse_part_count) {
            do {
              if (((((char)piVar17[0x14] == 'A') && (DAT_000db480 == 0)) && (DAT_000db470 == 0)) &&
                 (iVar19 = piVar17[1], 2 < iVar19)) {
                NKDbgPrintfW(s_making_backside_of__d_____d_00084848,iVar10,iVar5);
                iVar6 = g_model_parse_part_count * 0x67;
                iVar5 = piVar17[2];
                (&DAT_000c9de0)[iVar6] = (char)iVar5;
                (&DAT_000c9de1)[iVar6] = (char)((uint)iVar5 >> 8);
                (&DAT_000c9de2)[iVar6] = (char)((uint)iVar5 >> 0x10);
                (&DAT_000c9de3)[iVar6] = (char)((uint)iVar5 >> 0x18);
                (&DAT_000c9ddc)[iVar6] = (char)iVar19;
                (&DAT_000c9ddd)[iVar6] = (char)((uint)iVar19 >> 8);
                (&DAT_000c9dde)[iVar6] = (char)((uint)iVar19 >> 0x10);
                (&DAT_000c9ddf)[iVar6] = (char)((uint)iVar19 >> 0x18);
                g_eparse_part_name[iVar6 / 0x67] = g_eparse_part_name[iVar10];
                uVar7 = *(undefined4 *)((char *)piVar17 + 0x36);
                (&DAT_000c9e0e)[iVar6] = (char)uVar7;
                (&DAT_000c9e0f)[iVar6] = (char)((uint)uVar7 >> 8);
                (&DAT_000c9e10)[iVar6] = (char)((uint)uVar7 >> 0x10);
                (&DAT_000c9e11)[iVar6] = (char)((uint)uVar7 >> 0x18);
                (&DAT_000c9e28)[iVar6] = (char)piVar17[0x14];
                (&DAT_000c9e26)[iVar6] = 0;
                piVar12 = g_eparse_part_verts[iVar10] + iVar19;
                *DAT_000c8b00 = iVar19;
                iVar6 = g_model_parse_part_count;
                piVar9 = DAT_000c8b00 + 1;
                iVar5 = g_model_parse_part_count * 0x67;
                DAT_000c8b00 = piVar9;
                g_eparse_part_verts[iVar5 / 0x67] = (int *)piVar9;
                for (; iVar19 != 0; iVar19 = iVar19 + -1) {
                  piVar12 = piVar12 + -1;
                  *piVar9 = *piVar12;
                  piVar9 = DAT_000c8b00 + 1;
                  DAT_000c8b00 = piVar9;
                  iVar6 = g_model_parse_part_count;
                }
                g_model_parse_part_count = iVar6 + 1;
                iVar5 = g_model_parse_part_count;
                if (0x15e < g_model_parse_part_count) {
                  NKDbgPrintfW(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                  iVar5 = g_model_parse_part_count;
                }
              }
              iVar10 = iVar10 + 1;
              piVar17 = (int *)((char *)piVar17 + 0x67);
            } while (iVar10 < iVar3);
          }
        }
        else if (DAT_000db480 == 0) {
LAB_0002226c:
          iVar4 = ce_strcmp(auStack_1c8,s_INTERSECTIONS_000847bc);
          if (iVar4 == 0) {
            do {
              iVar4 = ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_1d0,local_260);
              if (iVar4 == 2) {
                *(undefined4 *)(&DAT_000c8b08 + DAT_000db4d0 * 4) = local_1d0;
                DAT_000db4d0 = DAT_000db4d0 + 1;
              }
            } while (local_260[0] == ',');
          }
          else {
            iVar4 = ce_strcmp(auStack_1c8,s_EXTENDED_COLORS_000847ac);
            if (iVar4 == 0) {
              iVar5 = 0;
              piVar17 = piVar20;
              do {
                iVar4 = ce_fscanf(pvVar_fh,s__lx_1s_000847a4,&local_208,local_260);
                if (DAT_000db494 != 0) {
                  piVar12 = &g_model_known_ext_colors;
                  iVar10 = 0;
                  do {
                    if (local_208 == *piVar12) {
                      *(char *)(piVar17 + 2) = (char)iVar10;
                      *(char *)((char *)piVar17 + 9) = (char)((uint)iVar10 >> 8);
                      *(char *)((char *)piVar17 + 10) = (char)((uint)iVar10 >> 0x10);
                      *(char *)((char *)piVar17 + 0xb) = (char)((uint)iVar10 >> 0x18);
                      break;
                    }
                    iVar10 = iVar10 + 1;
                    piVar12 = piVar12 + 1;
                  } while (iVar10 < 0x20);
                  if (iVar10 == 0x20) {
                    NKDbgPrintfW(s_Error__extended_color_for_part___00084768,iVar5);
                    goto LAB_0002263c;
                  }
                  iVar5 = iVar5 + 1;
                  piVar17 = (int *)((char *)piVar17 + 0x67);
                }
              } while (local_260[0] == ',');
            }
            else {
              iVar4 = ce_strcmp(auStack_1c8,s_ANIMATE_00084760);
              /* BUG FIX: was an unconditional `goto LAB_00022604` (the generic "skip this
                 unrecognized block" tail) on ANY ANIMATE mismatch -- but CLUSTERS and NODES... */
              if (iVar4 != 0) {
                goto LAB_check_clusters;
              }
              piVar17 = &DAT_000d95d8;
              do {
                puVar13 = auStack_1ec;
                pppppuVar21 = (undefined4 *****)&local_1f8;
                iVar5 = 0;
                iVar4 = ce_fscanf(pvVar_fh,s__d__1s__d__d__1s_0008474c,&local_200,local_260,
                                     pppppuVar21,&local_1f0,puVar13);
                iVar3 = DAT_000db4e0;
                if ((iVar4 != 1) || (iVar4 = 1, local_260[0] != '}')) {
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d977c)[iVar4] = local_260[0];
                  (&DAT_000d9768)[iVar4] = (char)local_200;
                  (&DAT_000d9769)[iVar4] = (char)((uint)local_200 >> 8);
                  (&DAT_000d976a)[iVar4] = (char)((uint)local_200 >> 0x10);
                  (&DAT_000d976b)[iVar4] = (char)((uint)local_200 >> 0x18);
                  (&DAT_000d9774)[iVar4] = (char)(uintptr_t)local_1f8;
                  (&DAT_000d9775)[iVar4] = (char)((uint)(uintptr_t)local_1f8 >> 8);
                  (&DAT_000d9776)[iVar4] = (char)((uint)(uintptr_t)local_1f8 >> 0x10);
                  (&DAT_000d9777)[iVar4] = (char)((uint)(uintptr_t)local_1f8 >> 0x18);
                  (&DAT_000d9778)[iVar4] = (char)local_1f0;
                  (&DAT_000d9779)[iVar4] = (char)((uint)local_1f0 >> 8);
                  (&DAT_000d977a)[iVar4] = (char)((uint)local_1f0 >> 0x10);
                  (&DAT_000d977b)[iVar4] = (char)((uint)local_1f0 >> 0x18);
                  pppppuVar21 = (undefined4 *****)(intptr_t)local_1f8;
                  uVar7 = local_1f0;
                  NKDbgPrintfW(s_anim__d___d__c__d__d___00084734,iVar3,local_200,local_260,local_1f8
                               ,local_1f0);
                  pvVar_fh = local_25c;
                  iVar4 = DAT_000db4e0 * 0x15;
                  /* The original stored the frame-list pointer (piVar17, into DAT_000d95d8) in a
                     4-byte slot at DAT_000d9770 here; nothing in this port reads it back, and a
                     pointer cannot live in 4 bytes, so the store is dropped. */
                  do {
                    ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_1e8,local_260,pppppuVar21,uVar7,
                                 puVar13);
                    iVar5 = iVar5 + 1;
                    iVar10 = DAT_000db4e0 + 1;
                    *piVar17 = local_1e8;
                    iVar4 = local_1e8 * 0x2c;
                    piVar17 = piVar17 + 1;
                    (&DAT_000d2ad0)[iVar4] = (char)iVar10;
                    (&DAT_000d2ad1)[iVar4] = (char)((uint)iVar10 >> 8);
                    (&DAT_000d2ad2)[iVar4] = (char)((uint)iVar10 >> 0x10);
                    (&DAT_000d2ad3)[iVar4] = (char)((uint)iVar10 >> 0x18);
                    NKDbgPrintfW(&DAT_00084730);
                  } while (local_260[0] == ',');
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d976c)[iVar4] = (char)iVar5;
                  (&DAT_000d976d)[iVar4] = (char)((uint)iVar5 >> 8);
                  (&DAT_000d976e)[iVar4] = (char)((uint)iVar5 >> 0x10);
                  (&DAT_000d976f)[iVar4] = (char)((uint)iVar5 >> 0x18);
                  NKDbgPrintfW(s___d__00084728,iVar5);
                  DAT_000db4e0 = DAT_000db4e0 + 1;
                  iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
                  if (iVar4 != 1) break;
                }
                pvVar_fh = local_25c;
              } while (local_260[0] == ';');
            }
          }
        }
        else {
LAB_check_clusters:
          iVar4 = ce_strcmp(auStack_1c8,s_CLUSTERS_0008483c);
          if (iVar4 == 0) {
            puVar8 = (undefined4 *)&DAT_000c8ca0;
            do {
              cVar18 = '\0';
              iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
              puVar16 = local_258;
              if ((iVar4 != 1) || (iVar4 = 1, local_260[0] != '}')) {
                iVar4 = DAT_000db4d4 * 4;
                if (DAT_000db4d4 + g_model_parse_part_count < DAT_000db458) {
                  *(undefined **)(&DAT_000da868 + iVar4) = local_258;
                  iVar5 = ce_strlen(local_258);
                  local_258 = puVar16 + iVar5 + 1;
                }
                else {
                  *(undefined4 *)(&DAT_000da868 + iVar4) = 0;
                }
                *(undefined4 **)(&DAT_000dab90 + iVar4) = puVar8;
                puVar8 = puVar8 + 1;
                do {
                  ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_1d8,local_260);
                  cVar18 = cVar18 + '\x01';
                  *puVar8 = local_1d8;
                  puVar8 = puVar8 + 1;
                } while (local_260[0] == ',');
                **(char **)(&DAT_000dab90 + DAT_000db4d4 * 4) = cVar18;
                DAT_000db4d4 = DAT_000db4d4 + 1;
                iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
                if (iVar4 != 1) break;
              }
            } while (local_260[0] == ';');
          }
          else {
            iVar4 = ce_strcmp(auStack_1c8,s_NODES_00084834);
            /* BUG FIX: was `goto LAB_0002226c`, re-entering this same
               INTERSECTIONS/EXTENDED_COLORS/ANIMATE/CLUSTERS/NODES cascade from the top with the
               SAME already-mismatched token... */
            if ((iVar4 != 0) &&
               (iVar4 = ce_strcmp(auStack_1c8,s_SUPER_NODES_00084828), iVar4 != 0)) {
              pcVar2 = s________c_0008471c;
              goto LAB_00022604;
            }
            iVar4 = ce_strcmp(auStack_1c8,s_SUPER_NODES_00084828);
            iVar5 = -1;
            if (iVar4 != 0) {
              iVar5 = 0;
            }
            do {
              iVar4 = ce_fscanf(pvVar_fh,&DAT_00084820,&local_1e4);
              iVar10 = DAT_000db4d8;
              if (local_260[0] != '}') {
                (&DAT_000c9540)[DAT_000db4d8 * 0x16] = (char)local_1e4;
                if (local_1e4 == 0x4c) {
                  NKDbgPrintfW(s_leaf_00084818);
                  iVar4 = ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_22c,local_260);
                  NKDbgPrintfW(&DAT_00084814,local_22c);
                  iVar10 = DAT_000db4d8 * 0x16;
                  (&DAT_000c9542)[iVar10] = (char)local_22c;
                  (&DAT_000c9543)[iVar10] = (char)((uint)local_22c >> 8);
                  (&DAT_000c9544)[iVar10] = (char)((uint)local_22c >> 0x10);
                  (&DAT_000c9545)[iVar10] = (char)((uint)local_22c >> 0x18);
                  iVar10 = DAT_000db4d8;
                }
                else if (local_1e4 == 0x42) {
                  NKDbgPrintfW(s_branch_0008480c);
                  if (iVar5 == 0) {
                    iVar4 = ce_fscanf(pvVar_fh,s__1s__d__d__d_1s_000847e4,&local_234,&local_250,
                                         &local_238,&local_230,local_260);
                    local_240 = -1;
                    local_248 = 0xffffffff;
                  }
                  else {
                    iVar4 = ce_fscanf(pvVar_fh,s__1s__d__d__d__d__d_1s_000847f4,&local_234,
                                         &local_250,&local_248,&local_240,&local_238,&local_230,
                                         local_260);
                  }
                  pppppuVar21 = (undefined4 *****)(intptr_t)local_240;
                  NKDbgPrintfW(s__c__d__d__d__d__d___c__000847cc,local_234,local_250,local_248,
                               local_240,local_238,local_230,(int)local_260[0]);
                  iVar10 = DAT_000db4d8 * 0x16;
                  (&DAT_000c9541)[iVar10] = (undefined1)local_234;
                  (&DAT_000c9542)[iVar10] = (char)local_250;
                  (&DAT_000c9543)[iVar10] = (char)((uint)local_250 >> 8);
                  (&DAT_000c9544)[iVar10] = (char)((uint)local_250 >> 0x10);
                  (&DAT_000c9545)[iVar10] = (char)((uint)local_250 >> 0x18);
                  (&DAT_000c954e)[iVar10] = (char)local_248;
                  (&DAT_000c954f)[iVar10] = (char)((uint)local_248 >> 8);
                  (&DAT_000c9550)[iVar10] = (char)((uint)local_248 >> 0x10);
                  (&DAT_000c9551)[iVar10] = (char)((uint)local_248 >> 0x18);
                  (&DAT_000c9552)[iVar10] = (char)(uintptr_t)local_240;
                  (&DAT_000c9553)[iVar10] = (char)((uint)(uintptr_t)local_240 >> 8);
                  (&DAT_000c9554)[iVar10] = (char)((uint)(uintptr_t)local_240 >> 0x10);
                  (&DAT_000c9555)[iVar10] = (char)((uint)(uintptr_t)local_240 >> 0x18);
                  (&DAT_000c9546)[iVar10] = (char)local_238;
                  (&DAT_000c9547)[iVar10] = (char)((uint)local_238 >> 8);
                  (&DAT_000c9548)[iVar10] = (char)((uint)local_238 >> 0x10);
                  (&DAT_000c9549)[iVar10] = (char)((uint)local_238 >> 0x18);
                  (&DAT_000c954a)[iVar10] = (char)local_230;
                  (&DAT_000c954b)[iVar10] = (char)((uint)local_230 >> 8);
                  (&DAT_000c954c)[iVar10] = (char)((uint)local_230 >> 0x10);
                  (&DAT_000c954d)[iVar10] = (char)((uint)local_230 >> 0x18);
                  iVar10 = DAT_000db4d8;
                }
                DAT_000db4d8 = iVar10 + 1;
              }
            } while (local_260[0] == ';');
          }
        }
      }
    }
    if ((iVar4 == 0) || (local_260[0] != '}')) {
      goto LAB_0002263c;
    }
  }
  NKDbgPrintfW(s_unexpected_EOF___no_END_statemen_000846f8);
LAB_0002263c:
  /* ce_fclose is fclose-shaped, closing the handle ce_fopen (fopen) opened at the top of this
     function -- was called with iVar3... */
  ce_fclose(local_25c);
  iVar3 = g_model_parse_part_count;
  if ((DAT_000db494 != 0) && (iVar4 = 0, 0 < g_model_parse_part_count)) {
    do {
      if (*(int *)((char *)piVar20 + 0x36) != iVar4) {
        uVar7 = *(undefined4 *)(&DAT_000c9de0 + *(int *)((char *)piVar20 + 0x36) * 0x67);
        *(char *)(piVar20 + 2) = (char)uVar7;
        *(char *)((char *)piVar20 + 9) = (char)((uint)uVar7 >> 8);
        *(char *)((char *)piVar20 + 10) = (char)((uint)uVar7 >> 0x10);
        *(char *)((char *)piVar20 + 0xb) = (char)((uint)uVar7 >> 0x18);
      }
      iVar4 = iVar4 + 1;
      piVar20 = (int *)((char *)piVar20 + 0x67);
    } while (iVar4 < iVar3);
  }
}

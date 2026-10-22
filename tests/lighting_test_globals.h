#include "src/headers/uw.h"
extern char *DAT_00086df8, *DAT_0023be74, *DAT_0024fa2c, *DAT_0023cca0;
extern uw_object_hdr_t *g_scratch_object_ptr;
extern char *g_selected_object;
extern undefined1 DAT_00086da8;
extern uw_melee_type_props_t g_melee_type_props[16];
extern undefined1 DAT_0023b039_backing[4096];
extern undefined4 DAT_000b5638_backing[160];
extern char DAT_0023cca8_backing[1024];
extern unsigned char DAT_00085ac8_backing[16];
extern undefined4 DAT_0023bc98, DAT_002020d8;
extern char DAT_000872a0, DAT_000842b0, DAT_0023b830;
extern short DAT_00201b68, DAT_0025063c, DAT_0025064c, DAT_002506dc;
extern short g_visibility_max_ring_passes, DAT_00086b28, DAT_00086b24;
extern undefined2 DAT_000da47c, g_palette_rgb565_backing[32768];
extern char s__DATA_light_dat_000872c8[];
extern char s__DATA_mono_dat_000872b8[];
extern char s__DATA_shades_dat_000872a4[];
extern char player[256], stats[256], mappings[4096], stencil[16];
extern ushort lights[4][4], *slots[11];
extern byte light_records[32];
extern int rebuilds, message;
extern int g_ambient_bias_reduction;
#include <math.h>

#ifndef DAT_0023b039
#define DAT_0023b039 DAT_0023b039_backing[0]
#endif
#include <math.h>

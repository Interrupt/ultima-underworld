#include "src/headers/uw.h"
/* Real storage for babl.c scratch buffers lives in test_illustration_render.c
   (see movement_test_globals.h's comment for why these need fixtures now);
   this just makes them visible to illustration_render_functions.c too. */
extern char DAT_00085448_backing[];
#define DAT_00085448 DAT_00085448_backing[0]
extern char DAT_00101968_backing[];
#define DAT_00101968 DAT_00101968_backing[0]
extern ushort DAT_00101a6c, DAT_000853f8, DAT_000853fc, DAT_00085400;
extern const babl_render_op_fn PTR_FUN_00085408[16];
extern int DAT_00201b54, DAT_00201b4c, DAT_00201b58, DAT_00201b3c;
extern ushort DAT_00201b48;
extern undefined1 *DAT_00201b40, *DAT_00201b50;
extern short DAT_00201b44;
extern undefined1 DAT_00084a40_backing[];
#define DAT_00084a40 DAT_00084a40_backing[0]
extern int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
extern undefined4 DAT_00204868;

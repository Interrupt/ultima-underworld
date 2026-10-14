#include "src/headers/uw.h"
extern double g_tune_rotation_offset;
extern int g_tune_last_catalog;
extern short DAT_00189584;
extern undefined2 DAT_00189586;
extern undefined1 DAT_00086d60_backing[64];
#define DAT_00189570 DAT_00189570_backing[0]
#define DAT_00086c08 DAT_00086c08_backing[0]
#define DAT_00086c09 DAT_00086c08_backing[1]
#define DAT_00086c0a DAT_00086c08_backing[2]
#define DAT_00086c0b DAT_00086c08_backing[3]
#define DAT_00086ce0 DAT_00086ce0_backing[0]
#define DAT_00086ce4 DAT_00086ce0_backing[1]
#define DAT_00086ce8 DAT_00086ce0_backing[2]
#define DAT_00086cec DAT_00086ce0_backing[3]
#define DAT_00086cf0 DAT_00086ce0_backing[4]
#define DAT_00086cf4 DAT_00086ce0_backing[5]
#define DAT_00086cf8 DAT_00086ce0_backing[6]
#define DAT_00086cfc DAT_00086ce0_backing[7]
#define DAT_00086d60 DAT_00086d60_backing[0]

#define DAT_00086d68 (*(const undefined1 *)DAT_00086d68_region)
#define DAT_00086d69 (*(const undefined1 *)(DAT_00086d68_region + 1))

/* emit_catalog_object consults this for a DOS-decoded per-face colour. The
   fixture answers -1 for every face, which is exactly what the Pocket PC path
   sees at runtime -- so these tests passing unchanged is the check that the
   per-face colour deviation cannot affect that path. */
int uw_dos_model_face_colour(int dos_index, int part);

#include "src/headers/uw.h"
extern byte automap_cells[64 * 64];
#undef DAT_000b99d0
#define DAT_000b99d0 automap_cells[0]
extern byte *g_automap_tint_bitmap;
#define DAT_000842c0 (*(undefined1 *)DAT_000842c0_real_table)
extern short DAT_000bbef0, DAT_000ba9d0;
extern int DAT_000bbefc;
extern undefined2 DAT_000b99c0, DAT_000b99c8;
extern undefined4 DAT_000b99c4;
extern char DAT_000ba9d8_backing[32768];
#define DAT_000ba9d8 DAT_000ba9d8_backing[0]
#define DAT_000baa0a DAT_000ba9d8_backing[0x32]
#define DAT_000baa0b DAT_000ba9d8_backing[0x33]
#define DAT_000baa0c DAT_000ba9d8_backing[0x34]
#define DAT_000baa0d DAT_000ba9d8_backing[0x35]
extern char DAT_000b98b8_backing[32768];
extern undefined1 DAT_000b58b8_backing[8448];
#define DAT_000b98b8 DAT_000b98b8_backing[0]
#define DAT_000b98b9 DAT_000b98b8_backing[1]
#define DAT_000b58b8 DAT_000b58b8_backing[0]
extern short DAT_0020471c, DAT_00204748, DAT_00204784, DAT_002047a4;
extern short DAT_00204838, DAT_0020483c, DAT_002047dc, DAT_002047d8;
extern undefined2 DAT_000879b8_backing[32768];
#define DAT_000879b8 DAT_000879b8_backing[0]
extern char s__arc_tmp_000842b4[];
extern undefined DAT_000b78b8_backing[8192];
#define DAT_000b78b8 DAT_000b78b8_backing[0]

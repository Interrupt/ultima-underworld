#include "src/headers/uw.h"
/* These used to be plain (non-static) globals visible everywhere via
   uw.h; the code-cleanup-pass-2 global-reorganization made them
   file-local statics in chargen.c (its only real consumer), so the
   test's own fixture copies (in test_chargen.c) now need an explicit
   extern + alias here too for chargen_functions.c (the
   extracted-function translation unit) to see them. */
extern undefined1 DAT_000fb860_backing[];
#define DAT_000fb860 DAT_000fb860_backing[0]
#define DAT_000fb863 DAT_000fb860_backing[3]
extern char DAT_000fb8f0_backing[];
#define DAT_000fb8f0 DAT_000fb8f0_backing[0]

#define DAT_00086da8 DAT_00086da8_backing[0]
#define DAT_0010060d DAT_0010060c_backing[1]
#define DAT_0010060e DAT_0010060c_backing[2]
#define DAT_0010060f DAT_0010060c_backing[3]
extern byte DAT_0020330c, DAT_002046cc;
extern char DAT_00086db0, DAT_00086db1;
extern int DAT_00086db8_backing[256];
#define DAT_00086db8 DAT_00086db8_backing[0]
extern undefined4 DAT_0023bc9c, DAT_0023bc98, DAT_002020dc;

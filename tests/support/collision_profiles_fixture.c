#include "unity.h"
#include "src/headers/uw.h"

/* init_collision_response_profiles is the real function; the callbacks it installs
   are identified by address only, so empty stand-ins are enough here. */
undefined2 DAT_002048c0_backing[64];
undefined1 DAT_002048f0_backing[128], DAT_00204950_backing[128];
undefined DAT_00204920_backing[128];
undefined1 DAT_00204980_backing[32];
undefined2 DAT_00204990_backing[16], DAT_002049a0_backing[16], DAT_002049b0_backing[16];
int (*DAT_00204988)(ushort *), (*DAT_00204998)(ushort *), (*DAT_002049a8)(ushort *), (*DAT_002049b8)(ushort *);
int collision_response_default(ushort *flags) { (void)flags; return 0; }
int collision_response_alt_locomotion(ushort *flags) { (void)flags; return 0; }
int collision_response_mobile_object(ushort *flags) { (void)flags; return 0; }
int collision_response_other_locomotion(ushort *flags) { (void)flags; return 0; }

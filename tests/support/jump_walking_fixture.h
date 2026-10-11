#ifndef UW_TEST_JUMP_WALKING_FIXTURE_H
#define UW_TEST_JUMP_WALKING_FIXTURE_H
#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/input.h"
#include "src/headers/movement.h"

/* The pending-key slot (DAT_0023c448), the polled held-movement state, the real
   decode_movement_command and the jump key's dispatch. */
void jump_walking_fixture_reset(void);
#endif

#include "headers/options.h"
#include "headers/main.h"
#include <signal.h>
#include <execinfo.h>
#include <stdlib.h>
#include <unistd.h>

static code **g_atexit_handlers;      /* was DAT_0025090c: base of the handler array */
static code **g_atexit_handlers_end;  /* was DAT_00250908: next free slot */
void entry(int instance, int prev_instance, int command_line, int show_command)
{
  run_static_initializers();
  app_main_loop(instance, prev_instance, command_line, show_command);
  /* HACK: was a bare `terminate_process();` -- dropped argument, the same class of bug fixed
     repeatedly elsewhere in this file. */
  terminate_process(0);
}
// was FUN_00082328 -- entry's own pre-app_main_loop setup step. Originally walked linker-generated
// static-initializer section boundaries (e.g. __init_array_start/end) calling through them as
// function pointers.
void run_static_initializers()
{
}
// was FUN_00082358 -- generic "call every function pointer in
// [param_1,param_2)" helper, the mechanism run_static_initializers
// and terminate_process's own (dead) atexit-walk originally used.
void call_function_pointer_range(code **range_start, code **range_end)
{
  for (; range_start < range_end; range_start = range_start + 1) {
    if (*range_start != (code *)0x0) {
      (**range_start)();
    }
  }
}
// was FUN_00082388 -- entry's own post-app_main_loop teardown step, AND this program's real
// process-termination point: originally ran registered atexit-style handlers (dead code -- nothing
// ever registers any, see register_atexit_handler/register_default_atexit_ handler)...
void terminate_process(int exit_code)
{
  fprintf(stderr, "[exit] terminate_process: terminating (code %d)\n", exit_code);
  exit(exit_code);
}
// was FUN_00082448 -- registers an atexit-style handler: appends param_1 to a dynamically-grown
// array (DAT_00250908/DAT_0025090c), reallocating via LocalAlloc/34/35 (malloc/realloc/size-query
// style WinCE ordinals) when it's full.
int register_atexit_handler(code *handler)
{
  uint capacity_bytes = LocalSize(g_atexit_handlers);
  code **new_block;

  if (capacity_bytes < (uint)((char *)g_atexit_handlers_end + 4 - (char *)g_atexit_handlers)) {
    if (g_atexit_handlers == 0) {
      new_block = LocalAlloc(0, 0x10);
    }
    else {
      new_block = LocalReAlloc(g_atexit_handlers, LocalSize(g_atexit_handlers) + 0x10, 2);
    }
    if (new_block == 0) {
      return 0;
    }
    g_atexit_handlers_end = new_block + (g_atexit_handlers_end - g_atexit_handlers);
    g_atexit_handlers = new_block;
  }
  *g_atexit_handlers_end = handler;
  g_atexit_handlers_end = g_atexit_handlers_end + 1;
  return handler != 0;
}
// was FUN_000824f0 -- thin wrapper reporting whether register_atexit_handler succeeded (0) or
// failed (-1).
int register_default_atexit_handler(code *handler)
{
  if (register_atexit_handler(handler) == 0) {
    return 0xffffffff;
  }
  return 0;
}

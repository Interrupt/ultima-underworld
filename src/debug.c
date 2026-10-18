/* See debug.h. */
#include "headers/debug.h"
#include "headers/options.h"

#include "headers/platform_compat.h"
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

/* Every message is printed; there is no runtime level filter. */
static const DebugLevel g_min_level = TRACE;

static const char *level_name(DebugLevel level) {
    switch (level) {
        case TRACE: return "TRACE";
        case INFO:  return "INFO";
        case WARN:  return "WARN";
        case ERR:   return "ERR";
    }
    return "?";
}

void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {
    if (level < g_min_level) {
        return;
    }

    fprintf(stderr, "[%s] %s:%d ", level_name(level), file, line);

    va_list args;
    va_start(args, fmt);
    vfprintf(stderr, fmt, args);
    va_end(args);

    /* Level 0 (from DEBUG_impl's own frame) would just be whichever function contains the
       DEBUG(...) call site -- already covered by file:line above. */
    Dl_info caller_info;
    void *caller_addr = __builtin_return_address(1);
    if (caller_addr && dladdr(caller_addr, &caller_info) && caller_info.dli_sname) {
        fprintf(stderr, " (from %s)", caller_info.dli_sname);
    }

    size_t len = strlen(fmt);
    if (len == 0 || fmt[len - 1] != '\n') {
        fputc('\n', stderr);
    }
}

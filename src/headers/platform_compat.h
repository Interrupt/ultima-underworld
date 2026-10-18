#ifndef PLATFORM_COMPAT_H
#define PLATFORM_COMPAT_H

/* POSIX-only facilities the port uses, mapped to something sensible on Windows (mingw/Zig).
 * On POSIX targets this is just the standard headers. */

#ifdef _WIN32
#include <direct.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

/* mkdir(path, mode): Windows takes no mode. */
#define mkdir(path, mode) _mkdir(path)

/* localtime_r(time, tm): localtime_s takes the arguments the other way round. */
#define localtime_r(t, tm) (localtime_s((tm), (t)) == 0 ? (tm) : NULL)

/* dladdr is only used to name the caller in diagnostics; report "unknown" on Windows. */
typedef struct {
    const char *dli_sname;
} Dl_info;
static inline int dladdr(const void *addr, Dl_info *info) {
    (void)addr;
    info->dli_sname = NULL;
    return 0;
}

/* fmemopen(read-only): copy the buffer into an anonymous temp file. */
static inline FILE *uw_fmemopen(void *buf, size_t len, const char *mode) {
    (void)mode;
    FILE *f = tmpfile();
    if (f) {
        fwrite(buf, 1, len, f);
        rewind(f);
    }
    return f;
}
#define fmemopen uw_fmemopen

#else
#include <dlfcn.h>
#include <execinfo.h>
#include <sys/stat.h>
#include <unistd.h>
#endif

#endif

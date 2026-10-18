/* The game executable's entry point. Kept out of main.c so unit-test executables can link the whole
   game and provide their own main(). */
#include "headers/options.h"
#include "headers/main.h"
#include <signal.h>
#include "headers/platform_compat.h"
#include <stdio.h>

#ifndef _WIN32
/* Debug aid: print a real backtrace on a fatal signal without needing lldb attached. */
static void crash_backtrace_handler(int sig) {
    void *frames[32];
    int n = backtrace(frames, 32);
    fprintf(stderr, "\n[crash] fatal signal %d, backtrace:\n", sig);
    backtrace_symbols_fd(frames, n, 2);
    _exit(128 + sig);
}
#endif

int main(int argc, char **argv) {
    options_init(argc, argv);
    /* stderr is fully buffered (not line-buffered) once redirected to a file, which makes a live
       log look frozen even while the process is actively running -- force unbuffered so debug
       output shows up in real time. */
    setvbuf(stderr, NULL, _IONBF, 0);
#ifndef _WIN32
    signal(SIGSEGV, crash_backtrace_handler);
    signal(SIGBUS, crash_backtrace_handler);
    signal(SIGABRT, crash_backtrace_handler);
#endif
    entry(0, 0, 0, 0);
    return 0;
}

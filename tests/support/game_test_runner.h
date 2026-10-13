/* RUN_GAME_TEST(fn): like Unity's RUN_TEST, but runs the case in a forked child process so every
   case gets a pristine game. The game keeps its state in process-wide globals and cannot be reset
   (see src/headers/unit_test_hooks.h), and the parent never boots it, so each child starts clean.
   A crash in a case is reported as that case failing instead of killing the whole run.

       int main(void) { UNITY_BEGIN(); RUN_GAME_TEST(test_a); RUN_GAME_TEST(test_b); return UNITY_END(); }

   Set UW_TEST_NO_FORK=1 to run in-process, e.g. under lldb (then only the first case can boot a game).

   Cases share data/SAVE0 on disk, so run them one at a time (as this does; do not run suites in
   parallel against one data folder). */
#ifndef UW_GAME_TEST_RUNNER_H
#define UW_GAME_TEST_RUNNER_H
#include "unity.h"
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

#define RUN_GAME_TEST(func) uw_run_game_test(func, #func, __LINE__)

static inline void uw_run_game_test(void (*func)(void), const char *name, int line)
{
    fflush(NULL);
    /* UW_TEST_NO_FORK=1: run the case in this process (one case per run), so a debugger can follow it. */
    if (getenv("UW_TEST_NO_FORK")) {
        UnityDefaultTestRun(func, name, line);
        return;
    }
    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        Unity.NumberOfTests++;
        Unity.TestFailures++;
        return;
    }
    if (pid == 0) {
        UNITY_COUNTER_TYPE failures_before = Unity.TestFailures;
        UnityDefaultTestRun(func, name, line);
        fflush(NULL);
        _exit(Unity.TestFailures != failures_before);
    }
    int status = 0;
    waitpid(pid, &status, 0);
    Unity.NumberOfTests++;
    if (WIFEXITED(status) && WEXITSTATUS(status) == 0) return;
    Unity.TestFailures++;
    if (WIFSIGNALED(status))
        printf("%s:%d:%s:FAIL: crashed with signal %d\n", Unity.TestFile, line, name, WTERMSIG(status));
    else if (!WIFEXITED(status))
        printf("%s:%d:%s:FAIL: abnormal exit\n", Unity.TestFile, line, name);
    fflush(stdout);
}
#endif

#ifndef UW_UNITY_CONFIG_H
#define UW_UNITY_CONFIG_H

/* Lets a test executable run a subset of its cases: RUN_TEST(fn) only runs fn when
 * uw_unity_case_selected("fn") says so (see support/unity_case_filter.c). Only test sources get
 * this: the `unity` library target exports UW_UNITY_FILTER to its consumers, not to itself. */
#ifdef UW_UNITY_FILTER
int uw_unity_case_selected(const char *name);
void UnityDefaultTestRun(void (*func)(void), const char *name, const int line);
#define RUN_TEST(func)                                              \
    do {                                                            \
        if (uw_unity_case_selected(#func))                          \
            UnityDefaultTestRun(func, #func, __LINE__);             \
    } while (0)
#endif

#endif

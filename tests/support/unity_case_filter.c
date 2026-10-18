/* Case selection for Unity test executables.
 *
 *   UW_TEST_CASES=a,b,c   run only those cases (exact names)
 *   UW_TEST_LIST=1        run nothing; print "CASE <name>" for every case instead
 *
 * With neither set, every case runs. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int uw_unity_case_selected(const char *name)
{
    if (getenv("UW_TEST_LIST")) {
        printf("CASE %s\n", name);
        return 0;
    }
    const char *list = getenv("UW_TEST_CASES");
    if (!list)
        return 1;
    size_t length = strlen(name);
    for (const char *p = list; *p;) {
        const char *end = strchr(p, ',');
        size_t n = end ? (size_t)(end - p) : strlen(p);
        if (n == length && strncmp(p, name, n) == 0)
            return 1;
        if (!end)
            break;
        p = end + 1;
    }
    return 0;
}

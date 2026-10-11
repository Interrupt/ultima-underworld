/* Runtime options. Every tunable and debug switch lives in the one `g_opts` struct below, filled in at
   startup from the command line (options_init, called first thing in main). The full list, with
   types, defaults and help text, is the X-macro table in options_table.h; `--help` prints it.

   Command line:  --some-option            boolean on        --some-option=0   boolean off
                  --no-some-option         boolean off       --some-option=VALUE / --some-option VALUE
   A field is named after its option: --disable-3d-objects -> g_opts.disable_3d_objects, --light-mode -> g_opts.light_mode.

   For the existing scripts and habits, options_init also reads the legacy environment variable UW_<NAME>
   (UW_LIGHT_MODE=dos) for any option the command line did not set; the command line wins. That is the
   only place the game reads UW_* environment variables. */
#ifndef UW_OPTIONS_H
#define UW_OPTIONS_H
#include <limits.h>
#include <stdio.h>

/* "Not set" for INT options that have no meaningful default (test with UW_OPT_ISSET). */
#define UW_OPT_UNSET INT_MIN
#define UW_OPT_ISSET(v) ((v) != UW_OPT_UNSET)

#define UW_OPT_TYPE_BOOL int
#define UW_OPT_TYPE_INT int
#define UW_OPT_TYPE_FLOAT float
#define UW_OPT_TYPE_STR const char *

struct uw_options {
#define X(type, name, def, help) UW_OPT_TYPE_##type name;
#include "options_table.h"
#undef X
};

extern struct uw_options g_opts;

/* Set every option to its default, then apply legacy UW_* environment variables, then argv. Prints
   the problem and exits (status 2) on an unknown option or bad value; --help prints the table and
   exits (status 0). */
void options_init(int argc, char **argv);
/* Restore every option to its built-in default (no environment, no command line). */
void options_reset(void);
/* Set one option by name ("light-mode" or "light_mode"); value NULL means "on" for a BOOL. Returns 0, or
   -1 for an unknown option, -2 for a value that does not parse. Used by the parser and by tests. */
int options_set(const char *name, const char *value);
/* Put one option back to its built-in default. Returns 0 or -1 (unknown option). */
int options_unset(const char *name);
void options_print_help(FILE *out);
/* Introspection for the debug console. options_get: current value as text in buf; returns the option's
   type (0 bool, 1 int, 2 float, 3 string) or -1 for an unknown name. options_name_at: name of option i
   (NULL past the end) with its current value in buf. */
size_t options_count(void);
const char *options_name_at(size_t i, char *buf, size_t n);
int options_get(const char *name, char *buf, size_t n);

#endif

/* Runtime options: see headers/options.h. */
#include "headers/options.h"
#include <ctype.h>
#include <errno.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <strings.h>

struct uw_options g_opts = {
#define X(type, name, def, help) .name = def,
#include "headers/options_table.h"
#undef X
};

static const struct uw_options g_opts_defaults = {
#define X(type, name, def, help) .name = def,
#include "headers/options_table.h"
#undef X
};

enum { OPT_BOOL, OPT_INT, OPT_FLOAT, OPT_STR };
#define OPT_TYPE_BOOL OPT_BOOL
#define OPT_TYPE_INT OPT_INT
#define OPT_TYPE_FLOAT OPT_FLOAT
#define OPT_TYPE_STR OPT_STR

struct opt_desc {
  const char *name;   /* field name, underscores */
  int type;
  size_t offset;
  const char *help;
};

static const struct opt_desc g_opt_descs[] = {
#define X(type, name, def, help) { #name, OPT_TYPE_##type, offsetof(struct uw_options, name), help },
#include "headers/options_table.h"
#undef X
};
#define OPT_COUNT (sizeof g_opt_descs / sizeof g_opt_descs[0])

/* Compare a user-typed name ("light-mode"/"light_mode") with a field name. */
static int name_matches(const char *typed, const char *field) {
  for (; *typed && *field; typed++, field++) {
    int a = *typed == '-' ? '_' : tolower((unsigned char)*typed);
    if (a != *field) return 0;
  }
  return !*typed && !*field;
}

static const struct opt_desc *find_opt(const char *typed) {
  for (size_t i = 0; i < OPT_COUNT; i++)
    if (name_matches(typed, g_opt_descs[i].name)) return &g_opt_descs[i];
  return NULL;
}

static int parse_bool(const char *value, int *out) {
  if (!value) { *out = 1; return 0; }
  if (!*value || !strcasecmp(value, "0") || !strcasecmp(value, "false") || !strcasecmp(value, "no") ||
      !strcasecmp(value, "off")) { *out = 0; return 0; }
  *out = 1;
  return 0;
}

static int apply(const struct opt_desc *d, const char *value) {
  char *base = (char *)&g_opts + d->offset;
  switch (d->type) {
  case OPT_BOOL: {
    int b;
    parse_bool(value, &b);
    *(int *)base = b;
    return 0;
  }
  case OPT_INT: {
    char *end;
    long v;
    if (!value) { *(int *)base = 1; return 0; }
    errno = 0;
    v = strtol(value, &end, 0);
    if (end == value || *end || errno) return -2;
    *(int *)base = (int)v;
    return 0;
  }
  case OPT_FLOAT: {
    char *end;
    double v;
    if (!value) return -2;
    errno = 0;
    v = strtod(value, &end);
    if (end == value || *end || errno) return -2;
    *(float *)base = (float)v;
    return 0;
  }
  default: {
    char *copy;
    if (!value) return -2;
    copy = strdup(value);
    if (!copy) return -2;
    *(const char **)base = copy; /* options live for the whole run (or test); never freed */
    return 0;
  }
  }
}

int options_set(const char *name, const char *value) {
  const struct opt_desc *d = find_opt(name);
  if (!d) return -1;
  return apply(d, value);
}

int options_unset(const char *name) {
  const struct opt_desc *d = find_opt(name);
  if (!d) return -1;
  memcpy((char *)&g_opts + d->offset, (const char *)&g_opts_defaults + d->offset,
         d->type == OPT_FLOAT ? sizeof(float) : d->type == OPT_STR ? sizeof(const char *) : sizeof(int));
  return 0;
}

void options_reset(void) {
  g_opts = g_opts_defaults;
}

/* Current value of option i as text; returns its type (OPT_BOOL..OPT_STR, 0..3). */
static int format_value(const struct opt_desc *d, char *buf, size_t n) {
  const char *base = (const char *)&g_opts + d->offset;
  switch (d->type) {
  case OPT_BOOL: snprintf(buf, n, "%s", *(const int *)base ? "on" : "off"); break;
  case OPT_INT: snprintf(buf, n, "%d", *(const int *)base); break;
  case OPT_FLOAT: snprintf(buf, n, "%g", (double)*(const float *)base); break;
  default: {
    const char *v = *(const char *const *)base;
    snprintf(buf, n, "%s", v ? v : "(unset)");
  }
  }
  return d->type;
}

size_t options_count(void) { return OPT_COUNT; }

const char *options_name_at(size_t i, char *buf, size_t n) {
  if (i >= OPT_COUNT) return NULL;
  format_value(&g_opt_descs[i], buf, n);
  return g_opt_descs[i].name;
}

int options_get(const char *name, char *buf, size_t n) {
  const struct opt_desc *d = find_opt(name);
  if (!d) return -1;
  return format_value(d, buf, n);
}

void options_print_help(FILE *out) {
  fprintf(out, "Usage: uw_dbg [options]\n\nOptions (a leading --no- turns a boolean off; "
               "--name=VALUE or --name VALUE sets a value):\n");
  for (size_t i = 0; i < OPT_COUNT; i++) {
    const struct opt_desc *d = &g_opt_descs[i];
    char dashed[96];
    size_t n;
    for (n = 0; d->name[n] && n < sizeof dashed - 1; n++) dashed[n] = d->name[n] == '_' ? '-' : d->name[n];
    dashed[n] = 0;
    fprintf(out, "  --%s%s\n      %s\n", dashed,
            d->type == OPT_BOOL ? "" : d->type == OPT_STR ? "=TEXT" : d->type == OPT_FLOAT ? "=NUMBER" : "=N", d->help);
  }
  fprintf(out, "\nEach option can also be given as the environment variable UW_<NAME> (UW_LIGHT_MODE=dos); "
               "the command line wins.\n");
}

/* Legacy: UW_<NAME> environment variables, for existing scripts. The only place they are read. */
static void apply_environment(void) {
  for (size_t i = 0; i < OPT_COUNT; i++) {
    const struct opt_desc *d = &g_opt_descs[i];
    char env[128] = "UW_";
    size_t n = 3;
    const char *value;
    for (const char *p = d->name; *p && n < sizeof env - 1; p++) env[n++] = (char)toupper((unsigned char)*p);
    env[n] = 0;
    value = getenv(env);
    if (value && apply(d, value) != 0)
      fprintf(stderr, "[options] ignoring bad value '%s' for %s\n", value, env);
  }
}

void options_init(int argc, char **argv) {
  options_reset();
  apply_environment();
  for (int i = 1; i < argc; i++) {
    const char *arg = argv[i];
    const char *name;
    char *eq;
    char namebuf[96];
    const char *value = NULL;
    const struct opt_desc *d;
    int negate = 0, rc;
    if (!strcmp(arg, "--help") || !strcmp(arg, "-h")) {
      options_print_help(stdout);
      exit(0);
    }
    if (arg[0] != '-' || arg[1] != '-' || !arg[2]) {
      fprintf(stderr, "uw: unexpected argument '%s' (try --help)\n", arg);
      exit(2);
    }
    name = arg + 2;
    eq = strchr(name, '=');
    if (eq) {
      size_t len = (size_t)(eq - name);
      if (len >= sizeof namebuf) len = sizeof namebuf - 1;
      memcpy(namebuf, name, len);
      namebuf[len] = 0;
      name = namebuf;
      value = eq + 1;
    }
    d = find_opt(name);
    if (!d && !strncmp(name, "no-", 3) && !eq) {
      d = find_opt(name + 3);
      if (d && d->type == OPT_BOOL) negate = 1; else d = NULL;
    }
    if (!d) {
      fprintf(stderr, "uw: unknown option '%s' (try --help)\n", arg);
      exit(2);
    }
    if (!eq && !negate && d->type != OPT_BOOL && i + 1 < argc && strncmp(argv[i + 1], "--", 2) != 0) {
      if (d->type != OPT_INT) value = argv[++i]; /* "--light-mode dos" */
      else {
        char *end;
        (void)strtol(argv[i + 1], &end, 0);
        if (end != argv[i + 1] && !*end) value = argv[++i];
      }
    }
    rc = negate ? apply(d, "0") : apply(d, value);
    if (rc != 0) {
      fprintf(stderr, "uw: bad value '%s' for %s (try --help)\n", value ? value : "", arg);
      exit(2);
    }
  }
}

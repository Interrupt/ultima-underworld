/* Minimal immediate-mode debug GUI -- see headers/debug_ui.h for the usage contract. */
#include "headers/debug_ui.h"
#include "headers/options.h"
#include "headers/uw.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <strings.h>

/* g_text_use_palette_color/g_draw_color_index are already declared in
   uw.h; g_text_flat_color (uw.c:32, `undefined2`) isn't -- declare it
   here directly rather than adding it to uw.h for one caller. */
extern unsigned short g_text_flat_color;

#define DBGUI_MAX_FIELDS 32
#define DBGUI_ROW_H 10
#define DBGUI_PANEL_X 4
#define DBGUI_PANEL_Y 4
#define DBGUI_PANEL_W 140

typedef struct {
  char name[24];
  int is_int;
  int is_button;
  int is_toggle;
  int is_text;
  int is_toggle_action;
  double *dval;
  int *ival;
  void (*on_press)(void);
  double step;
  /* Snapshotted fresh every dbgui_field_text()/dbgui_field_toggle_
     action() call (unlike dbgui_field_toggle's own live *ival, these
     two field kinds have no persistent boolean/string debug_ui.c
     itself owns or re-reads -- the caller already resolved whatever
     value it wanted shown before calling, same as building the row
     text by hand would require anyway). toggle_display_value is only
     meaningful when is_toggle_action; text_value only when is_text. */
  char text_value[40];
  int toggle_display_value;
  /* Cached screen rect from the last dbgui_end(), for mouse hit-testing
     next frame (this frame's clicks arrive interleaved with drawing,
     so we test against where things were last actually drawn). */
  int row_y;
} DbgField;

static char g_title[48];
static DbgField g_fields[DBGUI_MAX_FIELDS];
static int g_field_count = 0;

static int g_visible = 0;
static int g_selected = 0;
static int g_editing = 0;
static char g_edit_buf[32];
static int g_edit_len = 0;
/* Row count of the panel currently drawn (0 = nothing drawn); a change triggers an invalidate in
   dbgui_draw. */
static int g_last_rows = 0;

/* Real pixel save/restore for the panel's own screen region, so closing it doesn't leave stale
   pixels behind -- see dbgui_toggle()'s own comment for why dirty_rect_union alone isn't enough... */
#define DBGUI_FB_STRIDE 320
#define DBGUI_FB_HEIGHT 240
#define DBGUI_SAVE_ROWS 12
#define DBGUI_SAVE_H (DBGUI_ROW_H * (DBGUI_SAVE_ROWS + 1) + 4)
static unsigned short g_saved_px[DBGUI_PANEL_W * DBGUI_SAVE_H];
static int g_saved_valid = 0;

static void dbgui_save_backing()
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int y;
  if (!fb) return;
  for (y = 0; y < DBGUI_SAVE_H; y++) {
    int fy = DBGUI_PANEL_Y + y;
    if (fy < 0 || fy >= DBGUI_FB_HEIGHT) continue;
    memcpy(&g_saved_px[y * DBGUI_PANEL_W], &fb[fy * DBGUI_FB_STRIDE + DBGUI_PANEL_X],
           DBGUI_PANEL_W * sizeof(unsigned short));
  }
  g_saved_valid = 1;
}

static void dbgui_restore_backing()
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int y;
  if (!fb || !g_saved_valid) return;
  for (y = 0; y < DBGUI_SAVE_H; y++) {
    int fy = DBGUI_PANEL_Y + y;
    if (fy < 0 || fy >= DBGUI_FB_HEIGHT) continue;
    memcpy(&fb[fy * DBGUI_FB_STRIDE + DBGUI_PANEL_X], &g_saved_px[y * DBGUI_PANEL_W],
           DBGUI_PANEL_W * sizeof(unsigned short));
  }
  /* dirty_rect_union takes (y0, y1, x0, x1), as bitmap.c's own callers pass it -- not (x0, x1, y0, y1). */
  dirty_rect_union(DBGUI_PANEL_Y, DBGUI_PANEL_Y + DBGUI_SAVE_H,
                    DBGUI_PANEL_X, DBGUI_PANEL_X + DBGUI_PANEL_W);
  g_saved_valid = 0;
}

/* Puts back the real game pixels behind the panel, then immediately
   re-saves them -- for switching the panel's own CONTENT mid-session
   (toggle panel <-> object inspector <-> texture inspector) while it
   stays open, not for closing it (dbgui_toggle already does exactly
   this restore/re-arm pair around a close/reopen). A content switch
   can shrink the panel (5-row door inspector -> 3-row texture
   inspector), and relying on the next draw's own fill to cover
   whatever the previous, taller content left behind depends on
   redraw/flush ordering elsewhere in the frame that this module
   doesn't control; stamping the known-correct real pixels back in
   directly, unconditionally, before the new content draws over them
   sidesteps that entirely regardless of what does or doesn't redraw
   this region afterward. Call this whenever the caller is about to
   switch content and the panel was already visible (not on a fresh
   open -- dbgui_toggle's own save already started it clean then). */
static void dbgui_con_close_redraw(void);

void dbgui_invalidate_region(void)
{
  dbgui_restore_backing();
  /* The saved pixels can be stale (the game redraws under the panel), so also have the game repaint
     the HUD for the old panel's area -- matters when the new content is smaller. */
  dbgui_con_close_redraw();
  dbgui_save_backing();
  /* The old panel's rows are gone from the framebuffer now, so dbgui_draw's fill must not keep
     covering max(old, new) rows -- that painted the old height as a gray block over the restored HUD. */
  g_last_rows = 0;
}

/* SDL_Keycode values duplicated here (not #include <SDL.h>) to keep
   this file decoupled from SDL -- these are SDL2's own stable public
   values, scancode-based for the non-ASCII ones (1<<30 | scancode). */
#define DBGUI_KEY_RETURN    13
#define DBGUI_KEY_ESCAPE    27
#define DBGUI_KEY_BACKSPACE 8
#define DBGUI_KEY_UP        0x40000052
#define DBGUI_KEY_DOWN      0x40000051
#define DBGUI_KEY_LEFT      0x40000050
#define DBGUI_KEY_RIGHT     0x4000004F
#define DBGUI_KEY_PAGEUP    0x4000004B
#define DBGUI_KEY_PAGEDOWN  0x4000004E

/* ---- Quake-style console -------------------------------------------------------------------
   Opened from the panel's "console" button. Same input ownership as the panel (dbgui_visible()
   stays true while it is open, so gx_stub.c keeps routing raw keys/text here), but drawn as a
   full-width drop-down with a scrollback log and an input line. Submitted lines go to whatever
   handler the owner registered with dbgui_console_set_handler -- demomode.c registers the demofile
   command executor, so the console accepts exactly the commands a demofile does. This file stays
   free of any dependency on that: it only knows "call the handler with a line". */
#define CON_W 320
#define CON_ROW_H 8                       /* tighter than the panel's DBGUI_ROW_H */
#define CON_ROWS 8                        /* log rows shown above the input row */
#define CON_H (CON_ROW_H * (CON_ROWS + 1) + 4)
#define CON_LOG_LINES 128
#define CON_LINE_MAX 120
#define CON_INPUT_MAX 120
#define CON_HIST_MAX 16

static int g_console_open = 0;
static char g_con_log[CON_LOG_LINES][CON_LINE_MAX];
static int g_con_log_count = 0;           /* total lines ever added, ring-indexed by % CON_LOG_LINES */
static int g_con_scroll = 0;              /* lines scrolled back from the newest */
static char g_con_input[CON_INPUT_MAX];
static int g_con_input_len = 0;
static char g_con_hist[CON_HIST_MAX][CON_INPUT_MAX];
static int g_con_hist_count = 0;
static int g_con_hist_pos = -1;           /* -1 = editing a fresh line */
static unsigned g_con_frame = 0;          /* caret blink */
static void (*g_con_handler)(const char *line) = 0;
static void (*g_con_close_hook)(void) = 0;
static unsigned short g_con_saved_px[CON_W * CON_H];
static int g_con_saved_valid = 0;

static void dbgui_con_save_backing()
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int y;
  if (!fb) return;
  for (y = 0; y < CON_H && y < DBGUI_FB_HEIGHT; y++)
    memcpy(&g_con_saved_px[y * CON_W], &fb[y * DBGUI_FB_STRIDE], CON_W * sizeof(unsigned short));
  g_con_saved_valid = 1;
}

static void dbgui_con_restore_backing()
{
  unsigned short *fb = (unsigned short *)g_uw_framebuffer;
  int y;
  if (!fb || !g_con_saved_valid) return;
  for (y = 0; y < CON_H && y < DBGUI_FB_HEIGHT; y++)
    memcpy(&fb[y * DBGUI_FB_STRIDE], &g_con_saved_px[y * CON_W], CON_W * sizeof(unsigned short));
  /* dirty_rect_union takes the portrait "hardware" frame (left, bottom, right, top) =
     (landscape y0, y1, x0, x1) -- the console spans the whole screen width. */
  dirty_rect_union(0, CON_H, 0, CON_W);
  g_con_saved_valid = 0;
}

void dbgui_console_set_handler(void (*handler)(const char *line))
{
  g_con_handler = handler;
}

void dbgui_console_set_close_hook(void (*hook)(void))
{
  g_con_close_hook = hook;
}

/* Debug-window redraw hook (registered by the owner via dbgui_console_set_close_hook): runs when
   the console closes or the panel switches content. The saved pixels were captured when the console opened, so anything the game redrew underneath
   since (the inventory panel above all) would come back stale or black -- let the game repaint the
   region it owns. */
static void dbgui_con_close_redraw(void)
{
  if (g_con_close_hook) g_con_close_hook();
}

static void dbgui_con_add_line(const char *s, size_t n)
{
  char *dst = g_con_log[g_con_log_count % CON_LOG_LINES];
  if (n > CON_LINE_MAX - 1) n = CON_LINE_MAX - 1;
  memcpy(dst, s, n);
  dst[n] = 0;
  g_con_log_count++;
  /* Keep a reader who scrolled back parked on the same text as new lines arrive. */
  if (g_con_scroll > 0 && g_con_scroll < CON_LOG_LINES - CON_ROWS) g_con_scroll++;
}

/* Splits on '\n' (a trailing newline does not add an empty line) and wraps anything longer than a
   log line, so callers can hand over printf-style output as is. */
void dbgui_console_print(const char *text)
{
  const char *p = text;
  if (!text) return;
  while (*p) {
    const char *nl = strchr(p, '\n');
    size_t n = nl ? (size_t)(nl - p) : strlen(p);
    while (n > CON_LINE_MAX - 1) {
      dbgui_con_add_line(p, CON_LINE_MAX - 1);
      p += CON_LINE_MAX - 1;
      n -= CON_LINE_MAX - 1;
    }
    dbgui_con_add_line(p, n);
    p += n;
    if (*p == '\n') p++;
  }
}

int dbgui_console_active(void) { return g_visible && g_console_open; }

void dbgui_console_open(void)
{
  if (!g_visible || g_console_open) return;
  /* Put the real pixels back under the small panel, then snapshot the larger console region. */
  dbgui_restore_backing();
  dbgui_con_save_backing();
  g_console_open = 1;
  g_editing = 0;
  if (g_con_log_count == 0)
    dbgui_console_print("UW1 debug console -- type HELP for commands, ESC for the panel");
}

/* Back to the small panel (ESC), keeping the panel open. */
static void dbgui_console_close_to_panel(void)
{
  if (!g_console_open) return;
  dbgui_con_restore_backing();
  g_console_open = 0;
  dbgui_con_close_redraw();
  dbgui_save_backing();
}

static void dbgui_con_submit(void)
{
  char line[CON_INPUT_MAX + 4];
  char *s = g_con_input;
  g_con_input[g_con_input_len] = 0;
  while (*s == ' ' || *s == '\t') s++;
  if (*s) {
    snprintf(line, sizeof(line), "> %s", s);
    dbgui_console_print(line);
    if (g_con_hist_count == 0 || strcmp(g_con_hist[(g_con_hist_count - 1) % CON_HIST_MAX], s) != 0) {
      strncpy(g_con_hist[g_con_hist_count % CON_HIST_MAX], s, CON_INPUT_MAX - 1);
      g_con_hist[g_con_hist_count % CON_HIST_MAX][CON_INPUT_MAX - 1] = 0;
      g_con_hist_count++;
    }
    if (strcasecmp(s, "CLEAR") == 0) {
      g_con_log_count = 0;
      g_con_scroll = 0;
    } else if (g_con_handler) {
      g_con_handler(s);
    } else {
      dbgui_console_print("no command handler registered");
    }
  }
  g_con_input_len = 0;
  g_con_input[0] = 0;
  g_con_hist_pos = -1;
  g_con_scroll = 0;
}

static void dbgui_con_set_input(const char *s)
{
  strncpy(g_con_input, s, CON_INPUT_MAX - 1);
  g_con_input[CON_INPUT_MAX - 1] = 0;
  g_con_input_len = (int)strlen(g_con_input);
}

/* Positive = back toward older lines. Clamped to what the log holds. */
void dbgui_console_scroll(int lines)
{
  int max_scroll = g_con_log_count < CON_LOG_LINES ? g_con_log_count : CON_LOG_LINES;
  max_scroll = max_scroll > CON_ROWS ? max_scroll - CON_ROWS : 0;
  g_con_scroll += lines;
  if (g_con_scroll > max_scroll) g_con_scroll = max_scroll;
  if (g_con_scroll < 0) g_con_scroll = 0;
}

static void dbgui_con_feed_key(int key)
{
  int shown = g_con_hist_count < CON_HIST_MAX ? g_con_hist_count : CON_HIST_MAX;
  int max_scroll = g_con_log_count < CON_LOG_LINES ? g_con_log_count : CON_LOG_LINES;
  max_scroll = max_scroll > CON_ROWS ? max_scroll - CON_ROWS : 0;
  if (key == DBGUI_KEY_RETURN) {
    dbgui_con_submit();
  } else if (key == DBGUI_KEY_ESCAPE) {
    dbgui_console_close_to_panel();
  } else if (key == DBGUI_KEY_BACKSPACE) {
    if (g_con_input_len > 0) g_con_input[--g_con_input_len] = 0;
  } else if (key == DBGUI_KEY_UP) {
    if (g_con_hist_pos + 1 < shown) {
      g_con_hist_pos++;
      dbgui_con_set_input(g_con_hist[(g_con_hist_count - 1 - g_con_hist_pos) % CON_HIST_MAX]);
    }
  } else if (key == DBGUI_KEY_DOWN) {
    if (g_con_hist_pos > 0) {
      g_con_hist_pos--;
      dbgui_con_set_input(g_con_hist[(g_con_hist_count - 1 - g_con_hist_pos) % CON_HIST_MAX]);
    } else if (g_con_hist_pos == 0) {
      g_con_hist_pos = -1;
      dbgui_con_set_input("");
    }
  } else if (key == DBGUI_KEY_PAGEUP) {
    g_con_scroll += CON_ROWS - 1;
    if (g_con_scroll > max_scroll) g_con_scroll = max_scroll;
  } else if (key == DBGUI_KEY_PAGEDOWN) {
    g_con_scroll -= CON_ROWS - 1;
    if (g_con_scroll < 0) g_con_scroll = 0;
  }
}

static void dbgui_con_draw()
{
  int x0 = 0, y0 = 0, x1 = CON_W, y1 = CON_H;
  int avail = g_con_log_count < CON_LOG_LINES ? g_con_log_count : CON_LOG_LINES;
  int newest = g_con_log_count - 1 - g_con_scroll;   /* absolute index of the bottom visible line */
  int r;

  /* Palette index 0 is real black (see the panel's selected-row highlight). */
  set_draw_color(0);
  rect_fill_or_save_restore(x0, y0, x1, y1);

  for (r = 0; r < CON_ROWS; r++) {
    int idx = newest - (CON_ROWS - 1 - r);
    char line[CON_LINE_MAX];
    int len;
    if (idx < 0 || g_con_log_count - idx > avail) continue;
    strncpy(line, g_con_log[idx % CON_LOG_LINES], sizeof(line) - 1);
    line[sizeof(line) - 1] = 0;
    len = (int)strlen(line);
    while (len > 0 && measure_text_width(line) > CON_W - 6) line[--len] = 0;
    draw_text_string(line, x0 + 3, y0 + 2 + r * CON_ROW_H);
  }

  {
    char in[CON_INPUT_MAX + 4];
    int len, skip = 0;
    g_con_frame++;
    snprintf(in, sizeof(in), "> %s%s", g_con_input, (g_con_frame / 16) & 1 ? "" : "_");
    /* Keep the tail (where typing happens) visible once the line outgrows the console width. */
    len = (int)strlen(in);
    while (len - skip > 2 && measure_text_width(in + skip) > CON_W - 6) skip++;
    draw_text_string(in + skip, x0 + 3, y1 - CON_ROW_H - 1);
  }
}

void dbgui_begin(const char *title)
{
  if (title) {
    strncpy(g_title, title, sizeof(g_title) - 1);
    g_title[sizeof(g_title) - 1] = 0;
  }
  g_field_count = 0;
}

/* Shared allocator for every field kind below: zeroes the whole struct
   (so a kind-specific constructor only has to set what it actually
   uses -- the repeated "zero every OTHER kind's fields by hand" shape
   this used to have was exactly how is_text almost shipped without
   dbgui_field_double/int/button/toggle clearing it) and stamps the
   name. Returns NULL once DBGUI_MAX_FIELDS is hit; every caller below
   already no-ops on NULL via the `if (!f) return;` guard. */
static DbgField *dbgui_new_field(const char *name)
{
  DbgField *f;
  if (g_field_count >= DBGUI_MAX_FIELDS) return 0;
  f = &g_fields[g_field_count++];
  memset(f, 0, sizeof(*f));
  strncpy(f->name, name, sizeof(f->name) - 1);
  f->name[sizeof(f->name) - 1] = 0;
  return f;
}

void dbgui_field_double(const char *name, double *value, double step)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->dval = value;
  f->step = step;
}

void dbgui_field_int(const char *name, int *value, int step)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_int = 1;
  f->ival = value;
  f->step = (double)step;
}

void dbgui_field_button(const char *name, void (*on_press)(void))
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_button = 1;
  f->on_press = on_press;
}

/* A read-only row, shown as "name: value" -- for displaying information
   (an object's id/type/position/...) that isn't a live editable
   setting. Selectable for keyboard-nav consistency (so arrowing past
   it doesn't skip a row), but RETURN/LEFT/RIGHT/click are all no-ops
   on it, same as a label. `value` is copied immediately (truncated to
   this field's own small buffer) -- callers that want a live-updating
   display just call this again next frame with a freshly formatted
   string, same as every other field kind being rebuilt each frame. */
void dbgui_field_text(const char *name, const char *value)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_text = 1;
  strncpy(f->text_value, value, sizeof(f->text_value) - 1);
  f->text_value[sizeof(f->text_value) - 1] = 0;
}

void dbgui_field_toggle(const char *name, int *value)
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_int = 1;
  f->is_toggle = 1;
  f->ival = value;
  f->step = 1;
}

/* A toggle-styled row ("name: ON"/"name: OFF", same click/RETURN/LEFT/
   RIGHT dispatch as dbgui_field_toggle) for a boolean that's really a
   COMPUTED property with a genuine action behind changing it, not a
   plain in-memory flag to flip -- e.g. a door's locked state: "locked"
   is re-derived fresh every frame from the door's own link chain, and
   the only real way to change it is to run the actual unlock action,
   not just flip a bit somewhere. `value` is the state to display THIS
   frame (the caller already computed it, same as dbgui_field_text's
   own value); on_toggle is called on activation and decides what (if
   anything) really happens -- if it does nothing, or the underlying
   state genuinely can't go the other way (there's no real "re-lock a
   door" action in this game to call, for instance), the row just shows
   the same value again next frame, same as any other field whose
   caller declines to change its bound value. */
void dbgui_field_toggle_action(const char *name, int value, void (*on_toggle)(void))
{
  DbgField *f = dbgui_new_field(name);
  if (!f) return;
  f->is_toggle_action = 1;
  f->toggle_display_value = value;
  f->on_press = on_toggle;
}

static double dbgui_field_get(const DbgField *f)
{
  return f->is_int ? (double)*f->ival : *f->dval;
}

static void dbgui_field_set(DbgField *f, double v)
{
  if (f->is_int) *f->ival = (int)v; else *f->dval = v;
}

void dbgui_end()
{
  /* Deliberately does NOT draw -- see dbgui_draw()'s own comment for why drawing has to happen
     later in the frame than this is called. */
  if (g_field_count == 0) return;
  if (g_selected >= g_field_count) g_selected = g_field_count - 1;
  if (g_selected < 0) g_selected = 0;
}

void dbgui_draw()
{
  /* Called once per frame from app_main_loop, AFTER main_loop_hud_flush() -- i.e. after the 3D view
     and every other HUD element for this frame have already drawn into the shared software
     framebuffer. */
  if (g_visible && g_console_open) {
    int _up = g_text_use_palette_color;
    unsigned short _fc = g_text_flat_color;
    g_text_use_palette_color = 0;
    g_text_flat_color = (unsigned short)0xffff;
    dbgui_con_draw();
    g_text_use_palette_color = _up;
    g_text_flat_color = _fc;
    return;
  }
  if (!g_visible || g_field_count == 0) return;

  /* The panel's height follows g_field_count, which can change at any time (the object inspector's
     row count differs per object type, panels switch, ...). When the drawn size differs from what
     was drawn last, put the real pixels back and have the game repaint the HUD under the old rect
     first, so nothing from the old size is left behind; then fill only this frame's own size.
     g_last_rows == 0 means nothing is currently drawn (fresh open / just invalidated). */
  if (g_last_rows != 0 && g_last_rows != g_field_count) dbgui_invalidate_region();
  int panel_h = DBGUI_ROW_H * (g_field_count + 1) + 4;
  int x0 = DBGUI_PANEL_X, y0 = DBGUI_PANEL_Y;
  int x1 = x0 + DBGUI_PANEL_W, y1 = y0 + panel_h;
  g_last_rows = g_field_count;


  /* Text color: draw_text_string does NOT use set_draw_color's palette index (confirmed by reading
     its own body, uw.c ~5826-5834) -- it honours g_text_flat_color (a direct RGB565 value) unless a
     caller separately sets g_text_use_palette_color=1 AND *g_draw_color_index. Saved/restored
     around this function (same pattern babl.c/game.c/saveload.c already use around their own
     g_text_use_palette_color changes) so the debug panel doesn't leak white flat-color text into
     whatever draws next -- confirmed live: opening the panel once left every later draw_text_string
     call (message scroll, HUD) drawing in flat white instead of its own real color. */
  int _saved_use_pal = g_text_use_palette_color;
  unsigned short _saved_flat_color = g_text_flat_color;
  g_text_use_palette_color = 0;
  g_text_flat_color = (unsigned short)0xffff;

  /* Panel/row fill colors ARE real palette indices (rect_fill_or_save_ restore's FILL path reads
     g_palette_rgb565[DAT_000a85c0] directly, graphics.c ~170-176) -- 0x1a is confirmed elsewhere in
     this file as a real, already-used UI panel background (chargen's own panels)... */
  set_draw_color(0x1a);
  rect_fill_or_save_restore(x0, y0, x1, y1);
  draw_text_string(g_title, x0 + 3, y0 + 2);

  int i;
  for (i = 0; i < g_field_count; i++) {
    DbgField *f = &g_fields[i];
    int ry = y0 + DBGUI_ROW_H * (i + 1) + 2;
    f->row_y = ry;
    if (i == g_selected) {
      /* Palette index 0 -- confirmed real black elsewhere in this file
         (g_transparent_screen_color's own comment: "framebuffer pixel value 0x0000, pure black"),
         unlike 0x1a/0x60 which are real but unconfirmed-by-eye colors this session was guessing at. */
      set_draw_color(0);
      rect_fill_or_save_restore(x0 + 1, ry - 1, x1 - 1, ry + DBGUI_ROW_H - 2);
    }
    char line[64];
    if (f->is_button) {
      snprintf(line, sizeof(line), "[ %s ]", f->name);
    } else if (f->is_text) {
      snprintf(line, sizeof(line), "%s: %s", f->name, f->text_value);
    } else if (f->is_toggle) {
      snprintf(line, sizeof(line), "%s: %s", f->name, *f->ival ? "ON" : "OFF");
    } else if (f->is_toggle_action) {
      snprintf(line, sizeof(line), "%s: %s", f->name, f->toggle_display_value ? "ON" : "OFF");
    } else if (g_editing && i == g_selected) {
      snprintf(line, sizeof(line), "%s: %s_", f->name, g_edit_buf);
    } else {
      snprintf(line, sizeof(line), "%s: %g", f->name, dbgui_field_get(f));
    }
    /* Clip to the panel's own real pixel width (measure_text_width is
       the same per-glyph metric draw_text_string itself uses -- a
       variable-width font, so a fixed character-count budget silently
       runs long or short depending on which letters show up). Without
       this, a row that overflows DBGUI_PANEL_W just draws straight
       through it into whatever's behind the panel (the 3D view, other
       HUD chrome) with no visible boundary -- confirmed live with the
       object inspector's "type: a_door" row, legible edge sitting well
       short of the full string before this fix. Toggle rows ("name:
       ON"/"OFF") have stayed short by convention and were never
       actually hitting this, but any row can in principle. */
    { int _maxw = (x1 - 3) - (x0 + 3);
      int _len = (int)strlen(line);
      while (_len > 0 && measure_text_width(line) > _maxw) {
        line[--_len] = 0;
      }
    }
    draw_text_string(line, x0 + 3, ry);
  }

  g_text_use_palette_color = _saved_use_pal;
  g_text_flat_color = _saved_flat_color;
}

int dbgui_visible(void) { return g_visible; }

void dbgui_toggle()
{
  int was_visible = g_visible;
  /* Backtick closes everything, console included. */
  if (g_console_open) {
    dbgui_con_restore_backing();
    g_console_open = 0;
    dbgui_con_close_redraw();
  }
  g_visible = !g_visible;
  g_editing = 0;
  /* Whatever height the last panel had is gone (closed: restored below; opening: fresh save), so the
     next draw's fill must start from its own row count, not max(old, new) -- else a small panel opened
     after a big inspector paints the big one's height as gray over the HUD. */
  g_last_rows = 0;
  /* Closing the panel stops it from drawing (dbgui_draw's own `if (!g_visible ...) return`), but
     the panel sits in the static golden-border UI chrome at the screen's top-left corner, outside
     the 3D viewport -- nothing else ever redraws that region... */
  if (g_visible && !was_visible) {
    dbgui_save_backing();
  } else if (!g_visible && was_visible) {
    dbgui_restore_backing();
  }
}

void dbgui_feed_mouse_down(int lx, int ly)
{
  if (!g_visible || g_console_open) return;
  int i;
  for (i = 0; i < g_field_count; i++) {
    DbgField *f = &g_fields[i];
    if (ly >= f->row_y - 1 && ly < f->row_y + DBGUI_ROW_H - 2 &&
        lx >= DBGUI_PANEL_X + 1 && lx < DBGUI_PANEL_X + DBGUI_PANEL_W - 1) {
      g_selected = i;
      if (f->is_button) {
        if (f->on_press) f->on_press();
        return;
      }
      if (f->is_text) return;
      if (f->is_toggle) {
        *f->ival = !*f->ival;
        return;
      }
      if (f->is_toggle_action) {
        if (f->on_press) f->on_press();
        return;
      }
      g_editing = 1;
      snprintf(g_edit_buf, sizeof(g_edit_buf), "%g", dbgui_field_get(f));
      g_edit_len = (int)strlen(g_edit_buf);
      return;
    }
  }
}

void dbgui_feed_key(int sdl_keycode)
{
  if (g_visible && g_console_open) {
    dbgui_con_feed_key(sdl_keycode);
    return;
  }
  if (!g_visible || g_field_count == 0) return;
  DbgField *f = &g_fields[g_selected];

  if (g_editing) {
    if (sdl_keycode == DBGUI_KEY_RETURN) {
      dbgui_field_set(f, atof(g_edit_buf));
      g_editing = 0;
    } else if (sdl_keycode == DBGUI_KEY_ESCAPE) {
      g_editing = 0;
    } else if (sdl_keycode == DBGUI_KEY_BACKSPACE) {
      if (g_edit_len > 0) g_edit_buf[--g_edit_len] = 0;
    }
    return;
  }

  if (sdl_keycode == DBGUI_KEY_UP) {
    int before = g_selected;
    g_selected = (g_selected - 1 + g_field_count) % g_field_count;
  } else if (sdl_keycode == DBGUI_KEY_DOWN) {
    int before = g_selected;
    g_selected = (g_selected + 1) % g_field_count;
  } else if (f->is_button) {
    if (sdl_keycode == DBGUI_KEY_RETURN && f->on_press) f->on_press();
  } else if (f->is_text) {
    /* read-only: UP/DOWN already handled above, everything else is a no-op */
  } else if (f->is_toggle) {
    if (sdl_keycode == DBGUI_KEY_RETURN || sdl_keycode == DBGUI_KEY_LEFT || sdl_keycode == DBGUI_KEY_RIGHT)
      *f->ival = !*f->ival;
  } else if (f->is_toggle_action) {
    if (sdl_keycode == DBGUI_KEY_RETURN || sdl_keycode == DBGUI_KEY_LEFT || sdl_keycode == DBGUI_KEY_RIGHT) {
      if (f->on_press) f->on_press();
    }
  } else if (sdl_keycode == DBGUI_KEY_LEFT) {
    dbgui_field_set(f, dbgui_field_get(f) - f->step);
  } else if (sdl_keycode == DBGUI_KEY_RIGHT) {
    dbgui_field_set(f, dbgui_field_get(f) + f->step);
  } else if (sdl_keycode == DBGUI_KEY_RETURN) {
    g_editing = 1;
    snprintf(g_edit_buf, sizeof(g_edit_buf), "%g", dbgui_field_get(f));
    g_edit_len = (int)strlen(g_edit_buf);
  }
}

void dbgui_test_reset(void)
{
  g_field_count = 0;
  g_selected = 0;
  g_editing = 0;
  g_edit_len = 0;
  g_visible = 0;
  g_saved_valid = 0;
  g_last_rows = 0;
  g_console_open = 0;
  g_con_saved_valid = 0;
  g_con_log_count = 0;
  g_con_scroll = 0;
  g_con_input_len = 0;
  g_con_input[0] = 0;
  g_con_hist_count = 0;
  g_con_hist_pos = -1;
  g_con_handler = 0;
}

int dbgui_test_row_x(void) { return DBGUI_PANEL_X + 1; }

int dbgui_test_row_y(int field_index)
{
  if (field_index < 0 || field_index >= g_field_count) return -1;
  return g_fields[field_index].row_y;
}

void dbgui_feed_text(const char *utf8)
{
  if (g_visible && g_console_open) {
    const char *q;
    for (q = utf8; *q; q++) {
      unsigned char c = (unsigned char)*q;
      /* Printable ASCII only; backtick is the close key, not text. */
      if (c >= 0x20 && c < 0x7f && c != '`' && g_con_input_len < CON_INPUT_MAX - 1) {
        g_con_input[g_con_input_len++] = (char)c;
        g_con_input[g_con_input_len] = 0;
        g_con_hist_pos = -1;
      }
    }
    return;
  }
  if (!g_visible || !g_editing || g_field_count == 0) return;
  const char *p;
  for (p = utf8; *p; p++) {
    char c = *p;
    if ((c >= '0' && c <= '9') || c == '-' || c == '.') {
      if (g_edit_len < (int)sizeof(g_edit_buf) - 1) {
        g_edit_buf[g_edit_len++] = c;
        g_edit_buf[g_edit_len] = 0;
      }
    }
  }
}

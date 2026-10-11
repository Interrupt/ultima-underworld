/* models_dos.c: decoding the DOS asset set's 3D models out of UW.EXE.
 *
 * Hermetic -- no DOS install needed. The suite assembles its own UW.EXE-shaped
 * file: the four-byte table signature, a 32-entry uint16 offset table, and
 * then one hand-built model per scenario, each exercising a different corner
 * of the bytecode. What is asserted is the .E script the decoder emits, which
 * is exactly what it hands the port's own parser.
 *
 * file_io.c caches UW_DATA_DIR on first use, so the whole suite shares one
 * synthetic executable, written before any file call.
 */

#include "unity.h"
#include "src/headers/options.h"
#include "src/headers/models_dos.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

/* ---- assembling a synthetic UW.EXE --------------------------------------- */

#define EXE_CAP 0x20000
static unsigned char g_exe[EXE_CAP];
static unsigned int g_exe_len;
static unsigned int g_table;   /* where the signature/table went */
static unsigned int g_base;    /* model offsets are relative to this */
static unsigned int g_next;    /* next free byte for model data */
static char g_dir[512];

static void w8(unsigned int at, unsigned int v) { g_exe[at] = (unsigned char)(v & 0xff); }
static void w16(unsigned int at, unsigned int v)
{
    g_exe[at] = (unsigned char)(v & 0xff);
    g_exe[at + 1] = (unsigned char)((v >> 8) & 0xff);
}
static void w32(unsigned int at, unsigned int v) { w16(at, v & 0xffff); w16(at + 2, v >> 16); }

/* Appends 16-bit words at g_next. */
static unsigned int emit16(const unsigned int *w, unsigned int n)
{
    unsigned int at = g_next;
    for (unsigned int i = 0; i < n; i++) w16(g_next + i * 2, w[i]);
    g_next += n * 2;
    return at;
}

/* Starts a model in slot `slot`: writes its header (radius, extents) and
   points the table entry at it. Returns the offset of its first node. */
static unsigned int model_begin(int slot, int radius)
{
    TEST_ASSERT_TRUE(g_next + 10 < EXE_CAP);
    TEST_ASSERT_TRUE(g_next >= g_base);
    w16(g_table + (unsigned)slot * 2, g_next - g_base);
    w32(g_next, (unsigned int)radius);
    w16(g_next + 4, 64); w16(g_next + 6, 64); w16(g_next + 8, 64);
    g_next += 10;
    return g_next;
}

/* A vertex number operand: the decoder shifts it right by 3. */
static unsigned int vn(unsigned int index) { return index << 3; }

/* A signed 8.8 fixed operand, as the raw 16-bit pattern. */
static unsigned int fx(int v) { return (unsigned int)(v & 0xffff); }

static void setup_once(void);
void setUp(void) { setup_once(); }
void tearDown(void) {}

/* ---- the scenarios ------------------------------------------------------- */
/* Slot numbers are chosen from 2..31: the signature forces the first two
   table entries to 0x4ab6/0x4006, so slots 0 and 1 cannot be used. */

enum {
    SLOT_OFFSET = 2,      /* model 2 is the bridge: gets the -16 x correction */
    SLOT_SIMPLE = 14,     /* absolute vertex run + one quad, no x correction */
    SLOT_NONPLANAR = 15,  /* a quad whose 4th vertex is far off the plane */
    SLOT_COLOUR = 16,     /* two faces, each with its own FACE_SHADE colour */
    SLOT_COLOUR_FAN = 17, /* a coloured non-planar quad: triangles inherit it */
    SLOT_EMPTY = 3,       /* radius 0 */
    SLOT_REL1 = 4,        /* one-axis relative vertices */
    SLOT_REL2 = 5,        /* two-axis relative vertices */
    SLOT_CEIL = 6,        /* vertex extended to the ceiling */
    SLOT_SORT = 7,        /* sort node: both branches AND the node's own tail */
    SLOT_BADOP = 8,       /* unknown opcode after a good face */
    SLOT_DEGEN = 9,       /* a two-vertex "face" */
    SLOT_SPARSE = 10,     /* sparse vertex slots, densely renumbered */
    SLOT_SINGLE = 11,     /* one absolute vertex op (0x007a) per vertex */
    SLOT_ZERO_RADIUS = 12, /* radius 0, but with real geometry behind it */
    SLOT_TEXQUAD = 13,    /* 0x00a0 textured quad: winding flips, origin stays */
    SLOT_WIDE = 18,       /* a FLAT hexagon: too wide for the port's record */
    SLOT_CONCAVE = 19     /* a flat 5-gon with a notch: a fan inverts part of it */
};

static void build_simple(void)
{
    model_begin(SLOT_SIMPLE, 100);
    /* 0x0082: run of absolute vertices -- count, first index, then x,y,z each */
    unsigned int w[] = {
        0x0082, 4, 0,
        fx(10), fx(20), fx(30),
        fx(40), fx(50), fx(60),
        fx(-10), fx(-20), fx(-30),
        fx(70), fx(80), fx(90),
        0x007e, 4, vn(0), vn(1), vn(2), vn(3),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* The same geometry as build_simple, but in DOS slot 2 -- the bridge, one of
   the two models whose DOS placement is corrected by -16 in x. */
static void build_offset(void)
{
    model_begin(SLOT_OFFSET, 100);
    unsigned int w[] = {
        0x0082, 4, 0,
        fx(10), fx(20), fx(30),
        fx(40), fx(50), fx(60),
        fx(-10), fx(-20), fx(-30),
        fx(70), fx(80), fx(90),
        0x007e, 4, vn(0), vn(1), vn(2), vn(3),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void build_rel1(void)
{
    model_begin(SLOT_REL1, 100);
    unsigned int w[] = {
        0x007a, fx(100), fx(200), fx(300), vn(0),   /* base vertex */
        0x0086, vn(0), fx(5),  vn(1),               /* +5 on X */
        0x0088, vn(0), fx(7),  vn(2),               /* +7 on Z */
        0x008a, vn(0), fx(9),  vn(3),               /* +9 on Y */
        0x007e, 4, vn(0), vn(1), vn(2), vn(3),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void build_rel2(void)
{
    model_begin(SLOT_REL2, 100);
    unsigned int w[] = {
        0x007a, fx(100), fx(200), fx(300), vn(0),
        0x0090, fx(1), fx(2), vn(0), vn(1),         /* +1 X, +2 Z */
        0x0092, fx(3), fx(4), vn(0), vn(2),         /* +3 X, +4 Y */
        0x0094, fx(5), fx(6), vn(0), vn(3),         /* +5 Y, +6 Z */
        0x007e, 4, vn(0), vn(1), vn(2), vn(3),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void build_ceil(void)
{
    model_begin(SLOT_CEIL, 100);
    unsigned int w[] = {
        0x007a, fx(11), fx(22), fx(33), vn(0),
        0x008c, vn(0), 0x0800, vn(1),               /* to the ceiling */
        0x0086, vn(0), fx(8), vn(2),
        0x007e, 3, vn(0), vn(1), vn(2),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* A sort node with a left list, a right list, and more nodes after it. The
   tail is the regression guard: a sort node does not end its list. */
static void build_sort(void)
{
    model_begin(SLOT_SORT, 100);
    unsigned int head[] = {
        0x007a, fx(0), fx(0), fx(0), vn(0),
        0x007a, fx(1), fx(0), fx(0), vn(1),
        0x007a, fx(0), fx(1), fx(0), vn(2),
        0x007a, fx(0), fx(0), fx(1), vn(3),
    };
    emit16(head, sizeof head / sizeof head[0]);

    /* 0x000c: four plane words, then left and right offsets. Each offset is
       relative to the byte AFTER its own field. */
    unsigned int node = g_next;
    g_next += 2 /*op*/ + 8 /*planes*/ + 4 /*two offsets*/;
    unsigned int tail_at = g_next;

    /* the node's own tail: one face, then end */
    unsigned int tail[] = { 0x007e, 3, vn(0), vn(1), vn(2), 0x0000 };
    emit16(tail, sizeof tail / sizeof tail[0]);

    unsigned int left_at = g_next;
    unsigned int left[] = { 0x007e, 3, vn(1), vn(2), vn(3), 0x0000 };
    emit16(left, sizeof left / sizeof left[0]);

    unsigned int right_at = g_next;
    unsigned int right[] = { 0x007e, 3, vn(0), vn(2), vn(3), 0x0000 };
    emit16(right, sizeof right / sizeof right[0]);

    w16(node, 0x000c);
    for (int i = 0; i < 4; i++) w16(node + 2 + (unsigned)i * 2, 0);
    unsigned int lf = node + 10, rf = node + 12;
    w16(lf, left_at - (lf + 2));
    w16(rf, right_at - (rf + 2));
    (void)tail_at;
}

static void build_badop(void)
{
    model_begin(SLOT_BADOP, 100);
    unsigned int w[] = {
        0x0082, 3, 0, fx(1), fx(2), fx(3), fx(4), fx(5), fx(6), fx(7), fx(8), fx(9),
        0x007e, 3, vn(0), vn(1), vn(2),
        0x1234,                                     /* not a real opcode */
        0x007e, 3, vn(0), vn(1), vn(2),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void build_degen(void)
{
    model_begin(SLOT_DEGEN, 100);
    unsigned int w[] = {
        0x0082, 3, 0, fx(1), fx(2), fx(3), fx(4), fx(5), fx(6), fx(7), fx(8), fx(9),
        0x007e, 2, vn(0), vn(1),                    /* not a polygon */
        0x007e, 3, vn(0), vn(1), vn(2),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* Vertices defined at scattered slots, and one defined but never used by a
   face: POINTS must come out dense and in face-reference order. */
static void build_sparse(void)
{
    model_begin(SLOT_SPARSE, 100);
    unsigned int w[] = {
        0x007a, fx(70), fx(0), fx(0), vn(70),
        0x007a, fx(10), fx(0), fx(0), vn(10),
        0x007a, fx(40), fx(0), fx(0), vn(40),
        0x007a, fx(99), fx(0), fx(0), vn(99),       /* never referenced */
        0x007e, 3, vn(70), vn(10), vn(40),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void build_single(void)
{
    model_begin(SLOT_SINGLE, 100);
    unsigned int w[] = {
        0x0078, vn(0), fx(5), fx(6), fx(7), 0,      /* origin, also a vertex */
        0x007a, fx(1), fx(2), fx(3), vn(1),
        0x007a, fx(4), fx(5), fx(6), vn(2),
        0x007e, 3, vn(0), vn(1), vn(2),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* A zero radius is the executable's own "slot unused" marker, and it has to
   be honoured even when the bytes after the header would decode fine --
   otherwise an unused slot yields whatever stale geometry it happens to
   overlap. SLOT_EMPTY cannot show this on its own: it points at zeroes, which
   also decode to no faces, so it passes either way. */
static void build_zero_radius(void)
{
    model_begin(SLOT_ZERO_RADIUS, 0);
    unsigned int w[] = {
        0x0082, 3, 0, fx(1), fx(2), fx(3), fx(4), fx(5), fx(6), fx(7), fx(8), fx(9),
        0x007e, 3, vn(0), vn(1), vn(2),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* A texture-mapped quad (0x00a0). Reversing a textured face would move a
   different corner to the front of the list, and the front of the list is the
   texture origin -- so these keep their first vertex and reverse only the
   rest. Without that the DOS texture maps came out rotated. */
static void build_texquad(void)
{
    model_begin(SLOT_TEXQUAD, 100);
    unsigned int w[] = {
        0x0082, 4, 0,
        fx(0),  fx(0), fx(0),
        fx(10), fx(0), fx(0),
        fx(10), fx(0), fx(10),
        fx(0),  fx(0), fx(10),
        0x00a0, 6, 0x0302, 0x0100,   /* four raw byte indices: 2,3,0,1 */
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* The port's renderer fills a polygon from a single normal off its first
   three vertices, so a face whose remaining vertices sit well off that plane
   renders stretched. This quad's fourth vertex is 60 units out (a tile is
   256), so it must come back as a fan of triangles. */
static void build_nonplanar(void)
{
    model_begin(SLOT_NONPLANAR, 100);
    unsigned int w[] = {
        0x0082, 4, 0,
        fx(0),   fx(0),  fx(0),
        fx(100), fx(0),  fx(0),
        fx(100), fx(0),  fx(100),
        fx(0),   fx(60), fx(100),
        0x007e, 4, vn(0), vn(1), vn(2), vn(3),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* 0x00bc (FACE_SHADE) sets the colour for the faces that follow it. Its
   operand is a data-segment offset: 0x2920 is auxiliary-palette entry 0 and
   each entry is two bytes on, so 0x2922 is entry 1. */
static void build_colour(void)
{
    model_begin(SLOT_COLOUR, 100);
    unsigned int w[] = {
        0x0082, 3, 0, fx(0), fx(0), fx(0), fx(10), fx(0), fx(0), fx(10), fx(0), fx(10),
        0x00bc, 0x2922, 0,                  /* -> entry 1 */
        0x007e, 3, vn(0), vn(1), vn(2),
        0x00bc, 0x2920, 0,                  /* -> entry 0 */
        0x007e, 3, vn(0), vn(2), vn(1),
        0x00bc, 0x2936, 0,                  /* -> entry 11: past any palette */
        0x007e, 3, vn(1), vn(2), vn(0),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* A perfectly flat six-vertex ring. The real models have these: model 0x0b
   (the shrine) carries a 24- and a 23-vertex one and the rocks each have a
   7-vertex base. They are planar, so flatness alone will not split them, and
   the port's face record only has room for 23 indices. */
static void build_wide(void)
{
    model_begin(SLOT_WIDE, 100);
    unsigned int w[] = {
        0x0082, 6, 0,
        fx(0),    fx(0), fx(0),
        fx(100),  fx(0), fx(0),
        fx(150),  fx(0), fx(86),
        fx(100),  fx(0), fx(172),
        fx(0),    fx(0), fx(172),
        fx(-50),  fx(0), fx(86),
        0x007e, 6, vn(0), vn(1), vn(2), vn(3), vn(4), vn(5),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

/* A flat five-vertex polygon with one reflex corner -- vertex 2 pokes inward,
   so it is concave but still a simple polygon in the plane y = 0. Triangle
   (0,2,3) of a fan from vertex 0 turns the opposite way to the polygon, which
   is exactly how the shrine's 24-vertex ring ended up with 9 of its 22
   triangles facing backwards. */
static void build_concave(void)
{
    model_begin(SLOT_CONCAVE, 100);
    unsigned int w[] = {
        0x0082, 5, 0,
        fx(0),   fx(0), fx(0),
        fx(100), fx(0), fx(0),
        fx(20),  fx(0), fx(50),          /* the notch */
        fx(100), fx(0), fx(100),
        fx(0),   fx(0), fx(100),
        0x007e, 5, vn(0), vn(1), vn(2), vn(3), vn(4),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void build_colour_fan(void)
{
    model_begin(SLOT_COLOUR_FAN, 100);
    unsigned int w[] = {
        0x0082, 4, 0,
        fx(0),   fx(0),  fx(0),
        fx(100), fx(0),  fx(0),
        fx(100), fx(0),  fx(100),
        fx(0),   fx(60), fx(100),
        0x00bc, 0x2922, 0,                  /* -> entry 1 */
        0x007e, 4, vn(0), vn(1), vn(2), vn(3),
        0x0000
    };
    emit16(w, sizeof w / sizeof w[0]);
}

static void setup_once(void)
{
    if (g_dir[0]) return;

    char tmpl[] = "/tmp/uw_models_dos_XXXXXX";
    TEST_ASSERT_NOT_NULL_MESSAGE(mkdtemp(tmpl), "mkdtemp");
    snprintf(g_dir, sizeof g_dir, "%s", tmpl);

    memset(g_exe, 0, sizeof g_exe);
    /* A little leading padding so the table is not at offset 0. */
    g_table = 0x40;
    static const unsigned char sig[4] = { 0xb6, 0x4a, 0x06, 0x40 };
    memcpy(g_exe + g_table, sig, 4);
    g_base = g_table + 0x8e;
    g_next = g_base + 0x10;

    /* Unused slots point at a zero-radius header, the executable's own
       "empty slot" marker. */
    unsigned int empty = g_base;        /* 16 zero bytes live here */
    for (int s = 2; s < 32; s++) w16(g_table + (unsigned)s * 2, empty - g_base);

    build_simple();
    build_offset();
    build_rel1();
    build_rel2();
    build_ceil();
    build_sort();
    build_badop();
    build_degen();
    build_sparse();
    build_single();
    build_zero_radius();
    build_texquad();
    build_nonplanar();
    build_colour();
    build_colour_fan();
    build_wide();
    build_concave();
    /* SLOT_EMPTY keeps its zero-radius default. */
    w8(0, 0);
    g_exe_len = g_next + 16;

    char path[700];
    snprintf(path, sizeof path, "%s/UW.EXE", g_dir);
    FILE *f = fopen(path, "wb");
    TEST_ASSERT_NOT_NULL_MESSAGE(f, path);
    TEST_ASSERT_EQUAL_UINT(g_exe_len, fwrite(g_exe, 1, g_exe_len, f));
    TEST_ASSERT_EQUAL_INT(0, fclose(f));

    TEST_ASSERT_EQUAL_INT_MESSAGE(0, options_set("data-dir", g_dir), "options_set data-dir");
}

/* ---- helpers ------------------------------------------------------------- */

static char g_script[64 * 1024];

static int script_of(int slot)
{
    return uw_dos_model_script(slot, g_script, sizeof g_script);
}

/* The POINTS block as a single flat string, "x,y,z;" per line. */
static const char *points_block(void)
{
    static char buf[8192];
    const char *p = strstr(g_script, "POINTS {\n");
    TEST_ASSERT_NOT_NULL(p);
    p += strlen("POINTS {\n");
    const char *e = strstr(p, "}\n");
    TEST_ASSERT_NOT_NULL(e);
    size_t n = (size_t)(e - p);
    TEST_ASSERT_TRUE(n < sizeof buf);
    memcpy(buf, p, n);
    buf[n] = '\0';
    return buf;
}

static int count_substr(const char *hay, const char *needle)
{
    int n = 0;
    for (const char *p = hay; (p = strstr(p, needle)) != NULL; p += strlen(needle)) n++;
    return n;
}

/* ---- tests --------------------------------------------------------------- */

static void test_a_dos_executable_is_recognised(void)
{
    TEST_ASSERT_TRUE_MESSAGE(uw_dos_models_available(),
        "the synthetic UW.EXE carries the table signature and should be recognised");
}

static void test_absolute_vertices_and_one_face(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_SIMPLE) > 0);
    /* The file's (x, y, z) is emitted as the port's (x, z, y). */
    TEST_ASSERT_EQUAL_STRING("10,30,20;\n40,60,50;\n-10,-30,-20;\n70,90,80;\n",
                             points_block());
    /* The decoder reverses each face's winding itself (the DOS corpus is wound
       opposite to the .E art), so a 0x007e face comes out back-to-front. */
    TEST_ASSERT_NOT_NULL(strstr(g_script, "0,N,0,FF04,(3,2,1,0);"));
    TEST_ASSERT_NOT_NULL(strstr(g_script, "END"));
}

/* Every tile-spanning DOS model is centred at +16 in x; the port re-centred
   its own door frame and bridge to 0 and its renderer was built against that
   pair, so those two DOS models are corrected by -16. Nothing else is. */
static void test_the_bridge_and_door_frame_are_corrected_by_sixteen(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_OFFSET) > 0);
    TEST_ASSERT_EQUAL_STRING_MESSAGE(
        "-6,30,20;\n24,60,50;\n-26,-30,-20;\n54,90,80;\n", points_block(),
        "DOS model 2 (the bridge) must have 16 subtracted from every x");

    /* Same geometry in an uncorrected slot comes out untouched, so the
       correction is per-model and not a blanket shift. */
    TEST_ASSERT_TRUE(script_of(SLOT_SIMPLE) > 0);
    TEST_ASSERT_EQUAL_STRING("10,30,20;\n40,60,50;\n-10,-30,-20;\n70,90,80;\n",
                             points_block());
}

static void test_an_empty_slot_yields_no_script(void)
{
    TEST_ASSERT_EQUAL_INT(0, script_of(SLOT_EMPTY));
    TEST_ASSERT_EQUAL_STRING("", g_script);
}

static void test_a_zero_radius_slot_is_skipped_even_with_geometry_behind_it(void)
{
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, script_of(SLOT_ZERO_RADIUS),
        "radius 0 marks the slot unused; what follows the header must not be decoded");
    TEST_ASSERT_EQUAL_STRING("", g_script);
}

static void test_out_of_range_slots_yield_no_script(void)
{
    TEST_ASSERT_EQUAL_INT(0, script_of(-1));
    TEST_ASSERT_EQUAL_INT(0, script_of(32));
}

/* 0x0086/0x0088/0x008a displace one axis each. Getting the axis mapping wrong
   is the single easiest way to produce plausible-looking but wrong models. */
static void test_one_axis_relative_vertices(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_REL1) > 0);
    /* base is file (100,200,300) -> emitted (100,300,200).
       +5 on X -> (105,300,200); +7 on Z -> (100,307,200); +9 on Y -> (100,300,209) */
    TEST_ASSERT_EQUAL_STRING("100,300,200;\n105,300,200;\n100,307,200;\n100,300,209;\n",
                             points_block());
}

static void test_two_axis_relative_vertices(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_REL2) > 0);
    /* base file (100,200,300) -> (100,300,200).
       0x0090 +1X +2Z -> file (101,200,302) -> (101,302,200)
       0x0092 +3X +4Y -> file (103,204,300) -> (103,300,204)
       0x0094 +5Y +6Z -> file (100,205,306) -> (100,306,205) */
    TEST_ASSERT_EQUAL_STRING("100,300,200;\n101,302,200;\n103,300,204;\n100,306,205;\n",
                             points_block());
}

/* 0x008c lifts a vertex to the ceiling. The port's own DFRAME.E expresses
   that as a literal 1024, so the DOS path must use the same number. */
static void test_ceiling_vertices_use_the_ports_own_height(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_CEIL) > 0);
    /* Base file (11,22,33) emits as (11,33,22). Z is the vertical axis, and
       it lands in the MIDDLE emitted column, so the ceiling vertex keeps file
       x and y and takes z = 1024 -> (11,1024,22). Putting the height in y
       instead is what made door frames extend sideways. */
    TEST_ASSERT_EQUAL_STRING("11,33,22;\n11,1024,22;\n19,33,22;\n", points_block());
}

/* The regression that cost the small boulder 24 of its 33 faces: a sort node
   splits into two sub-lists AND then continues with whatever follows it. */
static void test_a_sort_node_emits_both_branches_and_its_own_tail(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_SORT) > 0);
    TEST_ASSERT_EQUAL_INT_MESSAGE(3, count_substr(g_script, "0,N,"),
        "left branch, right branch and the nodes after the split must all be emitted");
    /* left = (1,2,3), right = (0,2,3), tail = (0,1,2) -- all four vertices used */
    TEST_ASSERT_EQUAL_INT(4, count_substr(points_block(), ";"));
}

static void test_an_unknown_opcode_keeps_what_came_before_it(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_BADOP) > 0);
    TEST_ASSERT_EQUAL_INT_MESSAGE(1, count_substr(g_script, "0,N,"),
        "the face before the bad opcode survives; the one after is unreachable");
}

static void test_faces_with_fewer_than_three_vertices_are_dropped(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_DEGEN) > 0);
    TEST_ASSERT_EQUAL_INT(1, count_substr(g_script, "0,N,"));
}

/* The bytecode's vertex slots are byte offsets into a scratch array the
   original reused, so they are sparse; .E needs them packed from zero. */
static void test_sparse_vertex_slots_are_renumbered_densely(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_SPARSE) > 0);
    /* referenced in face order 70, 10, 40 -> renumbered 0, 1, 2; slot 99 is
       defined but unreferenced and must not appear at all. */
    TEST_ASSERT_EQUAL_STRING("70,0,0;\n10,0,0;\n40,0,0;\n", points_block());
    TEST_ASSERT_NOT_NULL(strstr(g_script, "0,N,0,FF04,(2,1,0);"));
    TEST_ASSERT_NULL_MESSAGE(strstr(g_script, "99,0,0;"),
        "a vertex no face references must not be emitted");
}

static void test_the_origin_opcode_also_defines_a_vertex(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_SINGLE) > 0);
    TEST_ASSERT_EQUAL_STRING("5,7,6;\n1,3,2;\n4,6,5;\n", points_block());
}

static void test_a_textured_quad_keeps_its_texture_origin_first(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_TEXQUAD) > 0);
    /* The face's DOS order is 2,3,0,1 -- renumbered densely in reference
       order that is 0,1,2,3. A plain reversal would give (3,2,1,0) and move
       corner 3 to the front; keeping the first vertex gives (0,3,2,1): the
       same reversed winding, the same texture origin. */
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,0,FF04,(0,3,2,1);"), g_script);
    TEST_ASSERT_NULL_MESSAGE(strstr(g_script, "0,N,0,FF04,(3,2,1,0);"),
        "a textured quad must not be plainly reversed -- that rotates its texture");
}

static void test_a_non_planar_face_is_split_into_triangles(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_NONPLANAR) > 0);
    /* Emitted points are (file x, file z, file y), so the quad is
       (0,0,0) (100,0,0) (100,100,0) (0,100,60) -- the first three lie in the
       plane z=0 and the fourth is 60 off it. Reversed winding is 3,2,1,0, and
       a fan from its first vertex gives (3,2,1) then (3,1,0). */
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,0,FF04,(3,2,1);"), g_script);
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,1,FF04,(3,1,0);"), g_script);
    TEST_ASSERT_NULL_MESSAGE(strstr(g_script, "(3,2,1,0)"),
        "a non-planar quad must not be emitted whole");
}

/* The control for the test above: a planar quad stays one polygon, so the
   split is driven by flatness and is not applied to every quad. */
static void test_a_planar_face_stays_one_polygon(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_SIMPLE) > 0);
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,0,FF04,(3,2,1,0);"), g_script);
    TEST_ASSERT_EQUAL_INT_MESSAGE(1, count_substr(g_script, "0,N,"),
                                  "a planar quad is one part, not a fan");
}

/* A flat n-gon is split too, because the port's face record cannot hold one.
   Indices live at 0xc18 + part*0x60 with the count at 0xc14 + part*0x60, so
   the 24th index of a face lands exactly on the next face's count. The real
   shrine (model 0x0b) has a 24-vertex ring and used to corrupt the face after
   it into drawing triangles off into space. */
static void test_a_wide_flat_face_is_split_even_though_it_is_planar(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_WIDE) > 0);
    /* Reversed winding is 5,4,3,2,1,0, and ear clipping takes corners off it
       until a triangle is left: four triangles for six vertices. */
    /* Each piece keeps the ring's own winding. */
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,0,FF04,(0,5,4);"), g_script);
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,1,FF04,(0,4,3);"), g_script);
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,2,FF04,(0,3,2);"), g_script);
    TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "0,N,3,FF04,(2,1,0);"), g_script);
    TEST_ASSERT_EQUAL_INT_MESSAGE(4, count_substr(g_script, "0,N,"),
                                  "a flat hexagon is four triangles");
}

/* Every triangle a split produces must turn the same way as the face it came
   from, or it is drawn inside out. Ear clipping guarantees that on a concave
   polygon; a fan from one vertex does not. The face here lies in the plane
   where the third emitted coordinate is 0, so the turn direction is the sign
   of the 2D cross product of the first two coordinates. */
static void test_a_concave_face_splits_without_inverting_any_triangle(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_CONCAVE) > 0);

    int px[64], py[64], n_pts = 0;
    for (const char *p = points_block(); *p; ) {
        int x, y, z;
        if (sscanf(p, "%d,%d,%d;", &x, &y, &z) == 3) {
            TEST_ASSERT_TRUE(n_pts < 64);
            px[n_pts] = x; py[n_pts] = y; n_pts++;
        }
        const char *nl = strchr(p, '\n');
        if (!nl) break;
        p = nl + 1;
    }
    TEST_ASSERT_EQUAL_INT(5, n_pts);

    int seen = 0, sign = 0;
    for (const char *p = strstr(g_script, "0,N,"); p; p = strstr(p + 1, "0,N,")) {
        int a, b, c;
        const char *open = strchr(p, '(');
        TEST_ASSERT_NOT_NULL(open);
        TEST_ASSERT_EQUAL_INT_MESSAGE(3, sscanf(open, "(%d,%d,%d)", &a, &b, &c),
                                      "a split face must be triangles");
        long cross = (long)(px[b] - px[a]) * (py[c] - py[a])
                   - (long)(py[b] - py[a]) * (px[c] - px[a]);
        char msg[160];
        snprintf(msg, sizeof msg, "triangle (%d,%d,%d) turns the wrong way", a, b, c);
        TEST_ASSERT_NOT_EQUAL_INT_MESSAGE(0, cross, "a split must not be degenerate");
        int this_sign = cross > 0 ? 1 : -1;
        if (seen == 0) {
            sign = this_sign;
        } else {
            TEST_ASSERT_EQUAL_INT_MESSAGE(sign, this_sign, msg);
        }
        seen++;
    }
    TEST_ASSERT_EQUAL_INT_MESSAGE(3, seen, "a five-vertex face is three triangles");
}

/* Whatever the model, no emitted face may exceed four vertices: that is the
   widest the port's own art ever uses, and the widest its record and its
   four-vertex UV and shading paths handle. */
static void test_no_emitted_face_is_wider_than_a_quad(void)
{
    for (int slot = 0; slot < 32; slot++) {
        if (script_of(slot) <= 0) continue;
        for (const char *p = strstr(g_script, "0,N,"); p; p = strstr(p + 1, "0,N,")) {
            const char *open = strchr(p, '(');
            const char *close = open ? strchr(open, ')') : NULL;
            if (!open || !close) continue;
            int commas = 0;
            for (const char *q = open; q < close; q++) {
                if (*q == ',') commas++;
            }
            char msg[160];
            snprintf(msg, sizeof msg, "slot %d emitted a %d-vertex face: %.60s",
                     slot, commas + 1, p);
            TEST_ASSERT_TRUE_MESSAGE(commas + 1 <= 4, msg);
        }
    }
}

/* The DOS bytecode carries a colour per face; the port otherwise paints a
   whole model in one colour. */
static void test_each_face_keeps_its_own_colour(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_COLOUR) > 0);
    TEST_ASSERT_EQUAL_INT_MESSAGE(1, uw_dos_model_face_colour(SLOT_COLOUR, 0),
                                  "first face follows FACE_SHADE 0x2922 -> entry 1");
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, uw_dos_model_face_colour(SLOT_COLOUR, 1),
                                  "second face follows FACE_SHADE 0x2920 -> entry 0");
}

/* The decoder reports the index the data actually says, even when no palette
   could hold it -- the real bridge model has two such faces (index 11 on a
   one-colour model). Range-checking is the renderer's job, against the entry
   count in its own catalog table, which is what keeps an out-of-range index
   from reading past that record. */
static void test_an_out_of_range_colour_is_reported_truthfully(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_COLOUR) > 0);
    TEST_ASSERT_EQUAL_INT_MESSAGE(11, uw_dos_model_face_colour(SLOT_COLOUR, 2),
        "0x2936 is 11 entries past the palette base and must be reported as 11");
}

static void test_a_model_with_no_colour_operand_reports_none(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_SIMPLE) > 0);
    TEST_ASSERT_EQUAL_INT_MESSAGE(-1, uw_dos_model_face_colour(SLOT_SIMPLE, 0),
        "no colour operand must report -1 so the renderer keeps its own behaviour");
}

/* A non-planar face is split into triangles, and each piece has to keep the
   colour of the face it came from. */
static void test_split_triangles_inherit_the_face_colour(void)
{
    TEST_ASSERT_TRUE(script_of(SLOT_COLOUR_FAN) > 0);
    TEST_ASSERT_EQUAL_INT(2, count_substr(g_script, "0,N,"));
    TEST_ASSERT_EQUAL_INT(1, uw_dos_model_face_colour(SLOT_COLOUR_FAN, 0));
    TEST_ASSERT_EQUAL_INT(1, uw_dos_model_face_colour(SLOT_COLOUR_FAN, 1));
}

static void test_colour_queries_outside_a_decoded_model_report_none(void)
{
    TEST_ASSERT_EQUAL_INT(-1, uw_dos_model_face_colour(SLOT_COLOUR, -1));
    TEST_ASSERT_EQUAL_INT(-1, uw_dos_model_face_colour(SLOT_COLOUR, 999));
    TEST_ASSERT_EQUAL_INT(-1, uw_dos_model_face_colour(-1, 0));
    TEST_ASSERT_EQUAL_INT(-1, uw_dos_model_face_colour(32, 0));
    TEST_ASSERT_EQUAL_INT_MESSAGE(-1, uw_dos_model_face_colour(SLOT_EMPTY, 0),
                                  "an empty slot has no colours either");
}

/* Every emitted script has to be something parse_e_model_file will accept:
   the keywords it scans for, in order. */
static void test_every_script_is_shaped_like_a_dot_e_file(void)
{
    int seen = 0;
    for (int slot = 0; slot < 32; slot++) {
        if (script_of(slot) <= 0) continue;
        seen++;
        TEST_ASSERT_EQUAL_INT_MESSAGE(0, strncmp(g_script, "BEGIN \"", 7), g_script);
        TEST_ASSERT_NOT_NULL_MESSAGE(strstr(g_script, "VERSION {0}"), g_script);
        const char *pts = strstr(g_script, "POINTS {");
        const char *prt = strstr(g_script, "PARTS {");
        const char *end = strstr(g_script, "END");
        TEST_ASSERT_NOT_NULL_MESSAGE(pts, g_script);
        TEST_ASSERT_NOT_NULL_MESSAGE(prt, g_script);
        TEST_ASSERT_NOT_NULL_MESSAGE(end, g_script);
        TEST_ASSERT_TRUE_MESSAGE(pts < prt && prt < end, "blocks must be in .E order");
        /* No CR anywhere: the in-memory path skips the CRLF stripper. */
        TEST_ASSERT_NULL_MESSAGE(strchr(g_script, '\r'), "scripts must be LF-only");
    }
    TEST_ASSERT_EQUAL_INT_MESSAGE(16, seen, "every non-empty scenario slot should decode");
}

/* A buffer too small to hold the script must be refused, not half-filled. */
static void test_a_short_buffer_is_refused(void)
{
    char small[80];
    TEST_ASSERT_EQUAL_INT(0, uw_dos_model_script(SLOT_SIMPLE, small, sizeof small));
    TEST_ASSERT_EQUAL_STRING("", small);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_a_dos_executable_is_recognised);
    RUN_TEST(test_absolute_vertices_and_one_face);
    RUN_TEST(test_the_bridge_and_door_frame_are_corrected_by_sixteen);
    RUN_TEST(test_an_empty_slot_yields_no_script);
    RUN_TEST(test_a_zero_radius_slot_is_skipped_even_with_geometry_behind_it);
    RUN_TEST(test_out_of_range_slots_yield_no_script);
    RUN_TEST(test_one_axis_relative_vertices);
    RUN_TEST(test_two_axis_relative_vertices);
    RUN_TEST(test_ceiling_vertices_use_the_ports_own_height);
    RUN_TEST(test_a_sort_node_emits_both_branches_and_its_own_tail);
    RUN_TEST(test_an_unknown_opcode_keeps_what_came_before_it);
    RUN_TEST(test_faces_with_fewer_than_three_vertices_are_dropped);
    RUN_TEST(test_sparse_vertex_slots_are_renumbered_densely);
    RUN_TEST(test_the_origin_opcode_also_defines_a_vertex);
    RUN_TEST(test_a_textured_quad_keeps_its_texture_origin_first);
    RUN_TEST(test_a_non_planar_face_is_split_into_triangles);
    RUN_TEST(test_a_planar_face_stays_one_polygon);
    RUN_TEST(test_a_wide_flat_face_is_split_even_though_it_is_planar);
    RUN_TEST(test_a_concave_face_splits_without_inverting_any_triangle);
    RUN_TEST(test_no_emitted_face_is_wider_than_a_quad);
    RUN_TEST(test_each_face_keeps_its_own_colour);
    RUN_TEST(test_an_out_of_range_colour_is_reported_truthfully);
    RUN_TEST(test_a_model_with_no_colour_operand_reports_none);
    RUN_TEST(test_split_triangles_inherit_the_face_colour);
    RUN_TEST(test_colour_queries_outside_a_decoded_model_report_none);
    RUN_TEST(test_every_script_is_shaped_like_a_dot_e_file);
    RUN_TEST(test_a_short_buffer_is_refused);
    return UNITY_END();
}

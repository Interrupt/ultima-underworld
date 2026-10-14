/* Decoding the DOS asset set's 3D object models out of UW.EXE.
 *
 * ---- Where the models live -------------------------------------------------
 *
 * UW.EXE carries a table of 32 little-endian uint16 offsets. Its first four
 * bytes -- which are just the first two table entries -- are the constant
 * b6 4a 06 40 in every known UW1 build, so the table is found by scanning for
 * that signature rather than by a hardcoded file offset (uwadv carries three
 * different offsets for three UW1 builds plus one for the demo; all four have
 * the same signature, and in all four the models are based 0x8e bytes past
 * the table's start). Confirmed on the shipped 547248-byte UW.EXE dated
 * 1993-06-16: the signature occurs exactly once, at 0x4ccd0, which is one of
 * uwadv's three catalogued offsets.
 *
 * Model N then starts at `base + offsets[N]`, with a header of
 *
 *     int32   bounding radius, 24.8 fixed point; ZERO MEANS THE SLOT IS EMPTY
 *     int16   extents X, 8.8 fixed
 *     int16   extents Y
 *     int16   extents Z
 *     ...     the node list follows
 *
 * Several UW1 slots are legitimately empty: 0 (never used), 4 (the Lotus
 * Turbo Esprit easter egg), 0x15, and 0x1d-0x1f (the bed, blackrock gem and
 * shelf, which are UW2-only).
 *
 * ---- The bytecode ----------------------------------------------------------
 *
 * A node list is a sequence of 16-bit opcodes, each followed by a fixed
 * operand layout, terminated by opcode 0. Vertex coordinates are signed 8.8
 * fixed point, i.e. 256 units to a tile -- the very same units the port's own
 * .E files use, so they are emitted unscaled (see the evidence below).
 * Vertex *numbers* are uint16 byte offsets into an 8-bytes-per-vertex array,
 * so they are shifted right by 3 to get an index.
 *
 * Sort nodes (0x0006 and its axis-aligned variants) are a BSP split with two
 * sub-lists; each sub-list's offset is relative to the position immediately
 * after that offset field, so the two have bases two bytes apart. Both
 * branches are walked: without a camera there is nothing to sort against, and
 * the union of both halves is the model's full geometry.
 *
 * ---- Coordinates, and how this was verified --------------------------------
 *
 * The decoder was checked against the port's own DATA3D/<name>.E files,
 * which are the same models in ASCII. With the port's model slot i taken as DOS model
 * i+1 (the order load_3d_object_models uses), and with the file's (x, y, z)
 * emitted as (x, z, y), SIX models come out with every vertex identical to
 * the shipped .E file at 1:1 scale, no translation: the small boulder (20
 * points), the beam (8), both doors (8 each), the 64x64 texture map (4), and
 * the shrine, whose .E file has 101 points and matches all 101. Face counts
 * agree too where the .E is not triangulated differently -- beam 6/6, doors
 * 6/6, small boulder 32 against 33.
 *
 * That is enough to pin the axis order, the 8.8 scale, the vertex-number
 * shift and every relative-vertex opcode at once: the shrine alone exercises
 * 0x0086, 0x0088, 0x008a and 0x0090 (31, 20, 15 and 11 times respectively).
 * Two more are close rather than exact -- the bridge matches all 8 vertices
 * after a 16-unit translation, the arrow 17 of 21 -- and are not claimed as
 * confirmation.
 *
 * Most of the rest differ because the Pocket PC port re-authored that art,
 * not because the decode is wrong, and the vertex COUNTS still agree exactly
 * (table 88, chest 68, chair 36, barrel 32, door frame 20) while the
 * coordinates are a UNIFORM rescale: the large boulder 0.477x, the table
 * 0.556x, the barrel 0.667x, the chair 0.628x -- the same ratio on all three
 * axes. Two of the port's .E files are outright placeholders as well
 * (NITESTAN.E is byte-identical to TABLF3.E, GATE.E to DOOR.E). So with DOS
 * assets the models are the DOS art at DOS proportions, which is the point.
 *
 * ---- What is deliberately not implemented ---------------------------------
 *
 * Face planes (0x0058 and friends) carry a byte count to skip when the face
 * is turned away from the camera. Load-time decoding has no camera, so the
 * count is skipped over and every face is emitted; the port's renderer does
 * its own back-face work.
 *
 * Texture: the texture operands reference tmobj.gr and are not resolved here;
 * every face is emitted with the .E files' own ordinary flat colour marker,
 * FF04. The COLOUR operand is resolved, but out of band -- the script has no
 * way to say it -- via uw_dos_model_face_colour, which models.c reads per
 * face. See that function's comment for the auxiliary-palette mapping.
 *
 * ---- Draw order, and what is still wrong -----------------------------------
 *
 * The port has no depth buffer and does not sort a model's faces: they are
 * painted in the order the parts list gives, so that order IS the painter's
 * algorithm. It also never uses a BSP -- parse_e_model_file reads the .E
 * NODES block into DAT_000c9540 and nothing in the tree ever reads that table
 * back. The shipped .E files are consistent with that: measured across every
 * DATA3D/<name>.E, not one contains a branch node, only a single `L,0` leaf
 * (or no nodes at all), so the exporter had already flattened the tree away.
 *
 * This decoder flattens the DOS tree too -- left sub-list, right sub-list,
 * then the node's own tail -- which is NOT the order the .E files use. On the
 * small boulder, the one rock whose .E matches vertex for vertex, 31 of 33
 * faces are the same triangles but only ONE is at the same position in the
 * list. The visible result is that farther faces sometimes paint over nearer
 * ones. Reordering the sort node's three parts does not fix it: all six
 * permutations were measured against ROCKSMAL.E and score 0.77-0.80 by
 * adjacent-pair order, i.e. no better than what is here. A real fix has to
 * sort against the camera, which the original DOS engine did with the plane
 * data in each sort node (skipped here), and which would mean reordering at
 * draw time rather than at load time. */

#include "headers/models_dos.h"
#include "headers/debug.h"
#include "headers/file_io.h"

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* The port's .E parser stops at 600 points and 350 faces, but its per-model
 * output buffer is only 0x3c2c bytes: points are 12 bytes each from offset 8,
 * and the part records start at 0xc14, so these are the real ceilings. No DOS
 * model comes close -- the largest is the shrine at 80 vertices and 51 faces.
 *
 * DOS_MAX_FACE_VERTS is the largest face in the DOS data: the shrine's ankh
 * outline is a genuine, concave 24-gon. The port's part record holds a count
 * plus only 23 index slots (stride 0x60, count at 0xc14 + p*0x60, indices
 * from 0xc18), so a face's 24th index lands at 0xc18 + p*0x60 + 23*4, which
 * is exactly the NEXT record's count field.
 *
 * That does NOT corrupt the neighbour, though, and an earlier version of this
 * comment claiming it did was wrong: parse_e_model_file writes a part's
 * indices before its count and works through parts in ascending order, so the
 * next part's own count write restores the slot. Verified by scanning the
 * parsed shrine buffer with the split disabled -- every record reads back a
 * sane count except the 24-gon's own, which is legitimately 24.
 *
 * The real cost is at DRAW time: that face's 24th index IS the neighbouring
 * count field, so the polygon is drawn with one corner taken from a small
 * integer (3 or 4) used as a vertex number. One visibly wrong corner on that
 * face, not wreckage spread across the model.
 *
 *
 * An earlier version of this comment also claimed the port's own .E files
 * carry faces of up to 50 vertices (ROCKBIG.E, 40LOTUS.E). That was wrong,
 * and it is corrected here because it sent one debugging pass down the wrong
 * path. Measured across every shipped DATA3D/<name>.E: the widest face
 * anywhere is FIVE vertices (one in CHAIRSIM.E); ROCKBIG.E is 52 faces all of
 * which are triangles, and 40LOTUS.E is 6 quads. The 50 came from a scan that
 * matched the 50-entry CLUSTERS list rather than a PARTS line.
 *
 * So the renderer has only ever been handed quads and triangles, and the DOS
 * path is the first thing to give it anything wider. uw_dos_model_script
 * therefore splits every face wider than a QUAD, not merely those over 23.
 * Only the over-23 case is a correctness bug; 5..23 is split as well because
 * emit_catalog_object gives a face UVs and shading from its first FOUR
 * vertices only (it reads _face_rec + 4/8/0xc/0x10 and caps its shade loop at
 * _ci < 4), so a wider face is lit from a part of itself. Splitting keeps DOS
 * output inside the envelope the port's renderer was actually built against,
 * and gives the painter's-order sort in emit_catalog_object finer granularity
 * to work with. The cost is face count -- the boulder goes 61 -> 65 and the
 * shrine 51 -> 118 -- which is why that sort's silent 64-face cutoff had to
 * go; see its comment in models.c. */
#define DOS_MAX_VERTS 256
#define DOS_MAX_FACES 128
#define DOS_MAX_FACE_VERTS 24

/* Deepest sort-node nesting and most nodes we will walk, so a malformed or
 * misidentified table cannot spin or recurse without bound. */
#define DOS_MAX_DEPTH 32
#define DOS_MAX_NODES 20000

/* The .E files express a door frame's variable-height vertices as a literal
 * 1024 (DFRAME.E's Y range is 0..1024 where the DOS model uses the
 * "extend to ceiling" opcode), so the DOS path uses the port's own number
 * rather than inventing one. */
#define DOS_CEILING_Y 1024

static unsigned char *g_exe;          /* whole UW.EXE, or NULL */
static unsigned int g_exe_size;
static unsigned int g_table;          /* file offset of the 32-entry offset table */
static unsigned int g_base;           /* model offsets are relative to this */
static int g_looked_up;               /* 0 = not tried, 1 = tried */

typedef struct {
  int x, y, z;
  int to_ceiling;
} dos_vert;

typedef struct {
  int count;
  int idx[DOS_MAX_FACE_VERTS];
  /* Keep this face's first vertex first when reversing its winding, instead
     of letting it become the last. See emit_face_order below for why only
     some faces want that. */
  int keep_first;
  /* Index into the model's auxiliary palette, from the colour in force when
     this face was emitted. */
  int colour;
} dos_face;

typedef struct {
  dos_vert verts[DOS_MAX_VERTS];
  int vert_seen[DOS_MAX_VERTS];
  int high_vert;                      /* highest vertex index touched, + 1 */
  dos_face faces[DOS_MAX_FACES];
  int face_count;
  int nodes;                          /* budget consumed */
  int truncated;                      /* hit a limit, or an unknown opcode */
  int cur_colour;                     /* colour in force for the next face */
} dos_model;

/* Per-emitted-part colour index, by DOS model. -1 = none, which is what the
   Pocket PC path sees because nothing ever fills it there. */
static signed char g_face_colour[32][DOS_MAX_FACES];
static int g_face_colour_ready;

/* A Color operand is a data-segment offset into the model's auxiliary palette;
   UW1's base is 0x2920 and the entries are two bytes apart. Offsets that
   resolve outside the model's own palette are rejected by the caller, which is
   what happens to 0x0014's and 0x00ba's operands -- documented as a vertex
   pair and a setup pointer respectively, and they decode to 3 and 5 on
   single-colour models. Only 0x00bc and 0x00d4 are trusted here. */
static int colour_index(unsigned int raw)
{
  if (raw < 0x2920u) {
    return -1;
  }
  return (int)((raw - 0x2920u) >> 1);
}

/* ---- raw reads ------------------------------------------------------------ */

static int in_range(unsigned int at, unsigned int need)
{
  return g_exe && at <= g_exe_size && need <= g_exe_size - at;
}

static unsigned int rd_u16(unsigned int at)
{
  return (unsigned int)g_exe[at] | ((unsigned int)g_exe[at + 1] << 8);
}

static int rd_i16(unsigned int at)
{
  int v = (int)rd_u16(at);
  return v >= 0x8000 ? v - 0x10000 : v;
}

static int rd_i32(unsigned int at)
{
  unsigned int v = rd_u16(at) | (rd_u16(at + 2) << 16);
  return (int)v;
}

/* ---- finding the table ---------------------------------------------------- */

static void dos_models_open(void)
{
  if (g_looked_up) {
    return;
  }
  g_looked_up = 1;

  FILE *f = (FILE *)uw_file_fopen("\\UW.EXE", "rb");
  if (!f) {
    DEBUG(INFO, "[models] no DOS UW.EXE in the data directory -- using the DATA3D/<name>.E models\n");
    return;
  }
  if (fseek(f, 0, SEEK_END) != 0) {
    fclose(f);
    return;
  }
  long sz = ftell(f);
  if (sz <= 0 || sz > 8 * 1024 * 1024) {
    DEBUG(WARN, "[models] DOS UW.EXE has an implausible size (%ld bytes) -- ignoring it\n", sz);
    fclose(f);
    return;
  }
  rewind(f);
  unsigned char *buf = (unsigned char *)malloc((size_t)sz);
  if (!buf) {
    fclose(f);
    DEBUG(ERR, "[models] out of memory reading DOS UW.EXE\n");
    return;
  }
  size_t got = fread(buf, 1, (size_t)sz, f);
  fclose(f);
  if (got != (size_t)sz) {
    free(buf);
    DEBUG(WARN, "[models] short read on DOS UW.EXE (%zu of %ld bytes) -- ignoring it\n", got, sz);
    return;
  }

  /* The signature is the table's own first two entries, constant across every
     known UW1 build (and the demo). */
  static const unsigned char sig[4] = { 0xb6, 0x4a, 0x06, 0x40 };
  unsigned int found = 0;
  int hits = 0;
  for (unsigned int i = 0; i + 4 <= (unsigned int)sz; i++) {
    if (memcmp(buf + i, sig, 4) == 0) {
      if (!hits) found = i;
      hits++;
    }
  }
  if (!hits) {
    free(buf);
    DEBUG(INFO, "[models] %ld-byte UW.EXE has no built-in model table signature -- "
                "not a DOS Ultima Underworld 1 executable\n", sz);
    return;
  }
  if (hits > 1) {
    /* Never seen; if it happens, the first is as good a guess as any, but say so. */
    DEBUG(WARN, "[models] DOS UW.EXE has %d model-table signatures -- using the one at %#x\n",
          hits, found);
  }

  g_exe = buf;
  g_exe_size = (unsigned int)sz;
  g_table = found;
  g_base = found + 0x8e;

  if (!in_range(g_table, 64)) {
    DEBUG(WARN, "[models] DOS UW.EXE model table at %#x runs past the end of the file\n", g_table);
    uw_dos_models_release();
    return;
  }
  DEBUG(INFO, "[models] DOS UW.EXE built-in models: table at %#x, base at %#x\n", g_table, g_base);
}

int uw_dos_models_available(void)
{
  dos_models_open();
  return g_exe != NULL;
}

void uw_dos_models_release(void)
{
  free(g_exe);
  g_exe = NULL;
  g_exe_size = 0;
  g_table = g_base = 0;
  /* Cleared too, so a caller that releases and then asks again gets a fresh
     read rather than a permanent "unavailable". */
  g_looked_up = 0;
}

/* ---- the node walker ----------------------------------------------------- */

static void vert_set(dos_model *m, int n, int x, int y, int z, int to_ceiling)
{
  if (n < 0 || n >= DOS_MAX_VERTS) {
    m->truncated = 1;
    return;
  }
  m->verts[n].x = x;
  m->verts[n].y = y;
  m->verts[n].z = z;
  m->verts[n].to_ceiling = to_ceiling;
  m->vert_seen[n] = 1;
  if (n + 1 > m->high_vert) {
    m->high_vert = n + 1;
  }
}

static const dos_vert *vert_get(const dos_model *m, int n)
{
  static const dos_vert zero = { 0, 0, 0, 0 };
  if (n < 0 || n >= DOS_MAX_VERTS || !m->vert_seen[n]) {
    return &zero;
  }
  return &m->verts[n];
}

static void face_add(dos_model *m, const int *idx, int n, int keep_first)
{
  if (n < 3 || m->face_count >= DOS_MAX_FACES) {
    /* Under three vertices is not a polygon; the port's parser warns about
       those itself, so drop them rather than emit something it will reject. */
    if (n >= 3) m->truncated = 1;
    return;
  }
  if (n > DOS_MAX_FACE_VERTS) {
    n = DOS_MAX_FACE_VERTS;
    m->truncated = 1;
  }
  dos_face *f = &m->faces[m->face_count++];
  f->count = n;
  f->keep_first = keep_first;
  f->colour = m->cur_colour;
  for (int i = 0; i < n; i++) {
    f->idx[i] = idx[i];
  }
}

/* Reads a vertex number: a uint16 byte offset into an 8-bytes-per-vertex
   array, so the index is the top 13 bits. */
static int vertno(unsigned int at)
{
  return (int)(rd_u16(at) >> 3);
}

static void walk(dos_model *m, unsigned int at, int depth);

/* One relative-vertex opcode: dst = ref displaced along one axis. */
static void vert_offset1(dos_model *m, unsigned int p, int axis)
{
  int ref = vertno(p);
  int d = rd_i16(p + 2);
  int dst = vertno(p + 4);
  dos_vert v = *vert_get(m, ref);
  if (axis == 0) v.x += d;
  else if (axis == 1) v.y += d;
  else v.z += d;
  vert_set(m, dst, v.x, v.y, v.z, v.to_ceiling);
}

/* dst = ref displaced along two axes. */
static void vert_offset2(dos_model *m, unsigned int p, int a1, int a2)
{
  int d1 = rd_i16(p);
  int d2 = rd_i16(p + 2);
  int ref = vertno(p + 4);
  int dst = vertno(p + 6);
  dos_vert v = *vert_get(m, ref);
  int *c[3] = { &v.x, &v.y, &v.z };
  *c[a1] += d1;
  *c[a2] += d2;
  vert_set(m, dst, v.x, v.y, v.z, v.to_ceiling);
}

static void walk(dos_model *m, unsigned int at, int depth)
{
  if (depth > DOS_MAX_DEPTH) {
    m->truncated = 1;
    return;
  }
  for (;;) {
    if (++m->nodes > DOS_MAX_NODES || !in_range(at, 2)) {
      m->truncated = 1;
      return;
    }
    unsigned int op = rd_u16(at);
    unsigned int p = at + 2;           /* first operand byte */

    /* Every branch below must leave `at` on the next node, or return. */
    switch (op) {
    case 0x0000:                        /* end of list */
      return;

    case 0x007a:                        /* vertex, absolute */
      if (!in_range(p, 8)) { m->truncated = 1; return; }
      vert_set(m, vertno(p + 6), rd_i16(p), rd_i16(p + 2), rd_i16(p + 4), 0);
      at = p + 8;
      break;

    case 0x0082: {                      /* run of absolute vertices */
      if (!in_range(p, 4)) { m->truncated = 1; return; }
      int n = (int)rd_u16(p);
      int first = (int)rd_u16(p + 2);
      if (n < 0 || n > DOS_MAX_VERTS || !in_range(p + 4, (unsigned)n * 6)) {
        m->truncated = 1; return;
      }
      for (int i = 0; i < n; i++) {
        unsigned int q = p + 4 + (unsigned)i * 6;
        vert_set(m, first + i, rd_i16(q), rd_i16(q + 2), rd_i16(q + 4), 0);
      }
      at = p + 4 + (unsigned)n * 6;
      break;
    }

    case 0x0078:                        /* model origin, also a vertex */
      if (!in_range(p, 10)) { m->truncated = 1; return; }
      vert_set(m, vertno(p), rd_i16(p + 2), rd_i16(p + 4), rd_i16(p + 6), 0);
      at = p + 10;
      break;

    case 0x0086:                        /* vertex + dX */
    case 0x0088:                        /* vertex + dZ */
    case 0x008a:                        /* vertex + dY */
      if (!in_range(p, 6)) { m->truncated = 1; return; }
      vert_offset1(m, p, op == 0x0086 ? 0 : (op == 0x0088 ? 2 : 1));
      at = p + 6;
      break;

    case 0x0090:                        /* vertex + (dX, dZ) */
    case 0x0092:                        /* vertex + (dX, dY) */
    case 0x0094:                        /* vertex + (dY, dZ) */
      if (!in_range(p, 8)) { m->truncated = 1; return; }
      if (op == 0x0090)      vert_offset2(m, p, 0, 2);
      else if (op == 0x0092) vert_offset2(m, p, 0, 1);
      else                   vert_offset2(m, p, 1, 2);
      at = p + 8;
      break;

    case 0x008c: {                      /* vertex extended to the ceiling */
      if (!in_range(p, 6)) { m->truncated = 1; return; }
      int ref = vertno(p);
      int dst = vertno(p + 4);
      const dos_vert *v = vert_get(m, ref);
      /* Z is the vertical axis in the file, not Y. Proof rather than
         assumption: the shrine matches its .E file vertex for vertex and has
         no ceiling vertices at all, and its tall 0..221 range sits in the .E
         point's MIDDLE column -- which is where this file emits the DOS z.
         The pillar corroborates it from the other side: every one of its four
         non-ceiling vertices is at z = 0, i.e. on the floor, with only the
         ceiling ones meant to rise. Writing the ceiling height into y instead
         made door frames and pillars extend sideways. */
      vert_set(m, dst, v->x, v->y, DOS_CEILING_Y, 1);
      at = p + 6;
      break;
    }

    case 0x007e: {                      /* face, by vertex number */
      if (!in_range(p, 2)) { m->truncated = 1; return; }
      int n = (int)rd_u16(p);
      if (n < 0 || n > DOS_MAX_VERTS || !in_range(p + 2, (unsigned)n * 2)) {
        m->truncated = 1; return;
      }
      int idx[DOS_MAX_VERTS];
      for (int i = 0; i < n; i++) idx[i] = vertno(p + 2 + (unsigned)i * 2);
      face_add(m, idx, n, 0);
      at = p + 2 + (unsigned)n * 2;
      break;
    }

    case 0x00a0: {                      /* shorthand textured quad, byte indices */
      if (!in_range(p, 6)) { m->truncated = 1; return; }
      int idx[4];
      for (int i = 0; i < 4; i++) idx[i] = g_exe[p + 2 + i];
      face_add(m, idx, 4, 1);
      at = p + 6;
      break;
    }

    case 0x00a8: {                      /* textured face: texnum, then (vert, u, v) */
      if (!in_range(p, 4)) { m->truncated = 1; return; }
      int n = (int)rd_u16(p + 2);
      if (n < 0 || n > DOS_MAX_VERTS || !in_range(p + 4, (unsigned)n * 6)) {
        m->truncated = 1; return;
      }
      int idx[DOS_MAX_VERTS];
      for (int i = 0; i < n; i++) idx[i] = vertno(p + 4 + (unsigned)i * 6);
      face_add(m, idx, n, 0);
      at = p + 4 + (unsigned)n * 6;
      break;
    }

    case 0x00b4:                        /* face with texture coordinates */
    case 0x00ce: {
      if (!in_range(p, 2)) { m->truncated = 1; return; }
      int n = (int)rd_u16(p);
      if (n < 0 || n > DOS_MAX_VERTS || !in_range(p + 2, (unsigned)n * 6)) {
        m->truncated = 1; return;
      }
      int idx[DOS_MAX_VERTS];
      for (int i = 0; i < n; i++) idx[i] = vertno(p + 2 + (unsigned)i * 6);
      face_add(m, idx, n, 1);
      at = p + 2 + (unsigned)n * 6;
      break;
    }

    case 0x00d4: {                      /* per-vertex shading; also names a face */
      if (!in_range(p, 4)) { m->truncated = 1; return; }
      m->cur_colour = colour_index(rd_u16(p + 2));
      int n = (int)rd_u16(p);
      if (n < 0 || n > DOS_MAX_VERTS || !in_range(p + 4, (unsigned)n * 3)) {
        m->truncated = 1; return;
      }
      /* (vertex number, one shade byte) pairs, padded to an even length. */
      at = p + 4 + (unsigned)n * 3 + (unsigned)(n & 1);
      break;
    }

    case 0x0006:                        /* sort plane: two sub-lists */
    case 0x000c:
    case 0x000e:
    case 0x0010: {
      unsigned int planes = (op == 0x0006) ? 12u : 8u;
      if (!in_range(p, planes + 4)) { m->truncated = 1; return; }
      unsigned int lf = p + planes;              /* left offset field */
      unsigned int rf = lf + 2;                  /* right offset field */
      /* Each offset is relative to the byte after its own field, so the two
         bases differ by two. */
      walk(m, lf + 2 + rd_u16(lf), depth + 1);
      walk(m, rf + 2 + rd_u16(rf), depth + 1);
      /* A sort node does NOT end its list: parsing resumes at the byte after
         the right-offset field. Getting this wrong silently drops every node
         that follows a split at the same level -- it cost the small boulder
         24 of its 33 faces and the chest 21 of its 44, which is how it was
         caught (both counts now agree with the port's own .E file). */
      at = rf + 2;
      break;
    }

    case 0x0058:                        /* face plane, arbitrary */
      if (!in_range(p, 14)) { m->truncated = 1; return; }
      at = p + 14;
      break;

    case 0x005e:                        /* face plane, two axes */
    case 0x0060:
    case 0x0062:
      if (!in_range(p, 10)) { m->truncated = 1; return; }
      at = p + 10;
      break;

    case 0x0064:                        /* face plane, one axis */
    case 0x0066:
    case 0x0068:
      if (!in_range(p, 6)) { m->truncated = 1; return; }
      at = p + 6;
      break;

    case 0x0012:                        /* one-word nodes */
      if (!in_range(p, 2)) { m->truncated = 1; return; }
      at = p + 2;
      break;

    case 0x0014:                        /* colour definition */
    case 0x0016:
    case 0x004a:                        /* translate (doors) */
      if (!in_range(p, 6)) { m->truncated = 1; return; }
      at = p + 6;
      break;

    case 0x00bc:                        /* flat face shade: sets the face colour */
      if (!in_range(p, 4)) { m->truncated = 1; return; }
      m->cur_colour = colour_index(rd_u16(p));
      at = p + 4;
      break;

    case 0x00be:                        /* two shades */
      if (!in_range(p, 4)) { m->truncated = 1; return; }
      at = p + 4;
      break;

    case 0x0040:                        /* no-operand nodes */
    case 0x00d6:
      at = p;
      break;

    case 0x00ba: {                      /* door submodel: a backwards sub-list */
      if (!in_range(p, 4)) { m->truncated = 1; return; }
      unsigned int back = (unsigned int)((-(int)rd_u16(p + 2)) & 0xffff);
      unsigned int after = p + 4;
      if (back <= after) {
        walk(m, after - back, depth + 1);
      } else {
        m->truncated = 1;
      }
      at = after;
      break;
    }

    default:
      /* An unrecognised opcode means the operand stream is no longer being
         tracked, so there is nothing safe to skip to -- stop this list and
         keep whatever was decoded before it. */
      DEBUG(WARN, "[models] DOS model: unknown node %#06x at %#x -- stopping this list\n",
            op, at);
      m->truncated = 1;
      return;
    }
  }
}

/* ---- emitting a .E script ------------------------------------------------- */

/* Appends to `out`, tracking the write position; sets *pos past out_sz on
   overflow so the caller can detect it once at the end. */
static void emit(char *out, unsigned int out_sz, unsigned int *pos, const char *fmt, ...)
{
  if (*pos >= out_sz) {
    *pos = out_sz + 1;
    return;
  }
  va_list ap;
  va_start(ap, fmt);
  int n = vsnprintf(out + *pos, out_sz - *pos, fmt, ap);
  va_end(ap);
  if (n < 0 || (unsigned int)n >= out_sz - *pos) {
    *pos = out_sz + 1;
    return;
  }
  *pos += (unsigned int)n;
}

/* The emitted winding, which is where the DOS data and the port's .E art
   disagree. Every DOS face is wound opposite to the .E files, so each one is
   reversed -- without that, every DOS model renders inside out (confirmed
   live).

   Reversing a quad flips its facing AND moves a different corner to the front
   of the list, and for a textured face the front of the list is the texture
   origin, so a plain reversal rotates the texture. Which faces care is
   readable straight out of the DOS data:

     0x00ce carries explicit per-vertex texture coordinates, and for the 64x64
     texture map they put (u,v) = (0,0) on the face's FIRST vertex -- which is
     the very vertex the port's own TMAP64X64.E puts first. 0x00a0 is the same
     construct without the coordinates (the 16x16 texture map, used by the
     levers and switches). Both therefore keep their first vertex first and
     reverse only the rest: same flipped winding, same texture origin, and the
     result is byte-identical to the port's .E file.

     0x00a8's coordinates say the opposite: on both door faces the first
     vertex carries (1, 0.188), not the origin. There is nothing to preserve,
     so those take the plain reversal -- which is also what the doors and the
     gravestone were observed to render correctly with. */
static int emit_face_order(const dos_face *face, const int *mapped, int n, int *out)
{
  if (face->keep_first) {
    out[0] = mapped[0];
    for (int k = 1; k < n; k++) {
      out[k] = mapped[n - k];
    }
  } else {
    for (int k = 0; k < n; k++) {
      out[k] = mapped[n - 1 - k];
    }
  }
  return n;
}

/* Per-model X correction, in DOS model units, applied to the emitted vertices.
 
   Every tile-spanning model in UW.EXE is centred at +16 rather than 0: the
   door frame and the bridge both span -112..144, and so does the 64x64
   texture map. The port's art kept that for TMAP16X16.E and TMAP64X64.E but
   re-centred DFRAME.E and FBRIDGE.E to -128..128, and the port's renderer and
   placement were built against the re-centred pair -- with the raw DOS
   geometry a door frame sits 16 units off its own door leaf, which does match
   exactly. So those two are brought onto the port's placement.
 
   Deliberately a short explicit list and not a derived rule. The obvious rule
   -- "centre the model on the half-extent the 0x0078 ORIGIN opcode states" --
   is wrong: it would also recentre the door leaf (ORIGIN 64, vertices 0..128,
   where 0 is the hinge and the port's own comment says to keep it there) and
   the beam (ORIGIN 8, vertices 0..16), both of which already match their .E
   file exactly. Seven of the nine models that can be compared need no
   correction at all, so this is art-matching for two known models rather than
   a decode fix, and it is listed where it can be seen. */
static int dos_model_x_offset(int dos_index)
{
  switch (dos_index) {
  case 0x01:   /* door frame */
  case 0x02:   /* bridge */
    /* DOS is the port's placement + 16, so correct by -16. */
    return -16;
  default:
    return 0;
  }
}

/* Is this face flat enough to hand the port's renderer as one polygon?
 
   The renderer fills a face from a single normal taken off its first three
   vertices, so a polygon whose remaining vertices sit well off that plane
   renders as a stretched, flickering mess. The DOS data has a handful of
   those: the large boulder has three faces up to 55 units out of plane and
   the medium boulder one at 41 (a tile is 256 units), which is exactly the
   "faces stretching out to the sky" seen on rocks. The port's own art does
   not hit this because it ships those models pre-triangulated -- ROCKSMAL.E
   is 33 triangles where the DOS model is 32 polygons.
 
   Measured over every decoded model, the deviation is either under 2 units
   or over 14, so the threshold sits in a wide empty gap and no judgement call
   is being hidden in it. Notably the shrine's 47 multi-vertex faces -- its
   24-gon ankh outline included -- are planar to 0.35 units and stay whole.
 
   Compares squared to avoid a square root: dev > T becomes
   dot(n,v)^2 > T^2 * dot(n,n). */
static int face_is_planar(const int (*pts)[3], int n);

/* Split a face into triangles, as local 0..n-1 index triples in `tris`;
 * returns how many it wrote (n - 2 for a clean polygon).
 *
 * A fan from one vertex is only correct for a CONVEX polygon. The DOS data is
 * full of concave ones -- the shrine's 24- and 23-vertex rings, every rock's
 * base -- and fanning those emits triangles whose winding is opposite the
 * face's, so they face the wrong way and are culled or lit as backfaces. So
 * ear clipping: repeatedly take a corner that turns the same way as the
 * polygon and holds no other vertex, which keeps every triangle on the face's
 * own winding whether it is convex or not.
 *
 * A non-planar face has no single plane to clip in, so those keep the plain
 * fan -- they are split only to make each piece planar, not for shape. */
static int triangulate_face(const int (*pts)[3], int n, int tris[][3])
{
  if (n < 3) {
    return 0;
  }
  if (n == 3) {
    tris[0][0] = 0; tris[0][1] = 1; tris[0][2] = 2;
    return 1;
  }

  int fan_only = !face_is_planar(pts, n);

  /* Newell's normal, so the projection below keeps the polygon's winding. */
  double nx = 0.0, ny = 0.0, nz = 0.0;
  for (int k = 0; k < n; k++) {
    const int *a = pts[k];
    const int *b = pts[(k + 1) % n];
    nx += (double)(a[1] - b[1]) * (a[2] + b[2]);
    ny += (double)(a[2] - b[2]) * (a[0] + b[0]);
    nz += (double)(a[0] - b[0]) * (a[1] + b[1]);
  }

  /* Drop the dominant axis. The surviving pair is ordered so that the 2D
     winding matches the 3D winding seen from the +normal side. */
  int ax, ay;
  double adx = nx < 0 ? -nx : nx, ady = ny < 0 ? -ny : ny, adz = nz < 0 ? -nz : nz;
  if (adx >= ady && adx >= adz)      { ax = 1; ay = 2; }
  else if (ady >= adz)               { ax = 2; ay = 0; }
  else                               { ax = 0; ay = 1; }

  double px[DOS_MAX_FACE_VERTS], py[DOS_MAX_FACE_VERTS];
  for (int k = 0; k < n; k++) {
    px[k] = pts[k][ax];
    py[k] = pts[k][ay];
  }

  /* Twice the signed area gives the polygon's turn direction. */
  double area2 = 0.0;
  for (int k = 0; k < n; k++) {
    int j = (k + 1) % n;
    area2 += px[k] * py[j] - px[j] * py[k];
  }
  double sign = area2 < 0 ? -1.0 : 1.0;
  if (area2 == 0.0) {
    fan_only = 1;                     /* degenerate: nothing sensible to clip */
  }

  if (fan_only) {
    int count = 0;
    for (int k = 1; k + 1 < n; k++) {
      tris[count][0] = 0; tris[count][1] = k; tris[count][2] = k + 1;
      count++;
    }
    return count;
  }

  int live[DOS_MAX_FACE_VERTS];
  for (int k = 0; k < n; k++) {
    live[k] = k;
  }
  int remaining = n, count = 0, guard = 0;

  while (remaining > 3 && guard++ < DOS_MAX_FACE_VERTS * DOS_MAX_FACE_VERTS) {
    int clipped = 0;
    for (int i = 0; i < remaining; i++) {
      int ip = live[(i + remaining - 1) % remaining];
      int ic = live[i];
      int in = live[(i + 1) % remaining];
      double cross = (px[ic] - px[ip]) * (py[in] - py[ip])
                   - (py[ic] - py[ip]) * (px[in] - px[ip]);
      if (cross * sign <= 0.0) {
        continue;                     /* reflex corner, or collinear */
      }
      /* An ear may not swallow any other remaining vertex. */
      int blocked = 0;
      for (int j = 0; j < remaining && !blocked; j++) {
        int iv = live[j];
        if (iv == ip || iv == ic || iv == in) {
          continue;
        }
        double d0 = ((px[ic] - px[ip]) * (py[iv] - py[ip])
                   - (py[ic] - py[ip]) * (px[iv] - px[ip])) * sign;
        double d1 = ((px[in] - px[ic]) * (py[iv] - py[ic])
                   - (py[in] - py[ic]) * (px[iv] - px[ic])) * sign;
        double d2 = ((px[ip] - px[in]) * (py[iv] - py[in])
                   - (py[ip] - py[in]) * (px[iv] - px[in])) * sign;
        if (d0 >= 0.0 && d1 >= 0.0 && d2 >= 0.0) {
          blocked = 1;
        }
      }
      if (blocked) {
        continue;
      }
      tris[count][0] = ip; tris[count][1] = ic; tris[count][2] = in;
      count++;
      for (int j = i; j + 1 < remaining; j++) {
        live[j] = live[j + 1];
      }
      remaining--;
      clipped = 1;
      break;
    }
    if (!clipped) {
      break;                          /* self-intersecting: fan what is left */
    }
  }

  for (int k = 1; k + 1 < remaining; k++) {
    tris[count][0] = live[0]; tris[count][1] = live[k]; tris[count][2] = live[k + 1];
    count++;
  }
  return count;
}

static int face_is_planar(const int (*pts)[3], int n)
{
  if (n < 4) {
    return 1;                                   /* a triangle always is */
  }
  double nx = 0.0, ny = 0.0, nz = 0.0;
  for (int k = 1; k + 1 < n; k++) {
    double ax = pts[k][0] - pts[0][0], ay = pts[k][1] - pts[0][1], az = pts[k][2] - pts[0][2];
    double bx = pts[k + 1][0] - pts[0][0], by = pts[k + 1][1] - pts[0][1],
           bz = pts[k + 1][2] - pts[0][2];
    nx = ay * bz - az * by;
    ny = az * bx - ax * bz;
    nz = ax * by - ay * bx;
    if (nx * nx + ny * ny + nz * nz > 1e-6) {
      break;                                    /* first non-degenerate corner */
    }
  }
  double nn = nx * nx + ny * ny + nz * nz;
  if (nn <= 1e-6) {
    return 1;                                   /* degenerate: nothing to split */
  }
  const double tol = 2.0;
  for (int k = 1; k < n; k++) {
    double d = nx * (pts[k][0] - pts[0][0]) + ny * (pts[k][1] - pts[0][1])
             + nz * (pts[k][2] - pts[0][2]);
    if (d * d > tol * tol * nn) {
      return 0;
    }
  }
  return 1;
}

int uw_dos_model_script(int dos_index, char *out, unsigned int out_sz)
{
  if (!out || out_sz < 64 || dos_index < 0 || dos_index > 31) {
    return 0;
  }
  out[0] = '\0';
  if (!uw_dos_models_available()) {
    return 0;
  }

  unsigned int ent = g_table + (unsigned int)dos_index * 2;
  if (!in_range(ent, 2)) {
    return 0;
  }
  unsigned int start = g_base + rd_u16(ent);
  if (!in_range(start, 10)) {
    DEBUG(WARN, "[models] DOS model %d starts past the end of UW.EXE\n", dos_index);
    return 0;
  }
  int radius = rd_i32(start);
  if (radius <= 0) {
    /* A zero radius is the executable's own "slot unused" marker. */
    DEBUG(INFO, "[models] DOS model %d is an empty slot (radius %d)\n", dos_index, radius);
    return 0;
  }

  dos_model *m = (dos_model *)calloc(1, sizeof(*m));
  if (!m) {
    DEBUG(ERR, "[models] out of memory decoding DOS model %d\n", dos_index);
    return 0;
  }
  if (!g_face_colour_ready) {
    memset(g_face_colour, -1, sizeof g_face_colour);
    g_face_colour_ready = 1;
  }
  memset(g_face_colour[dos_index], -1, sizeof g_face_colour[dos_index]);
  m->cur_colour = -1;
  walk(m, start + 10, 0);

  if (m->face_count == 0 || m->high_vert < 3) {
    DEBUG(WARN, "[models] DOS model %d decoded to %d vertices and %d faces -- skipping\n",
          dos_index, m->high_vert, m->face_count);
    free(m);
    return 0;
  }

  /* Only vertices the faces actually reference are emitted, renumbered
     densely: the bytecode's vertex slots are sparse (they are byte offsets
     into a scratch array the original reused), and the .E format expects a
     packed POINTS list indexed from zero. */
  static int remap[DOS_MAX_VERTS];
  for (int i = 0; i < DOS_MAX_VERTS; i++) remap[i] = -1;
  int n_points = 0;
  for (int f = 0; f < m->face_count; f++) {
    for (int k = 0; k < m->faces[f].count; k++) {
      int v = m->faces[f].idx[k];
      if (v < 0 || v >= DOS_MAX_VERTS || !m->vert_seen[v]) {
        continue;
      }
      if (remap[v] < 0) {
        remap[v] = n_points++;
      }
    }
  }
  if (n_points < 3) {
    DEBUG(WARN, "[models] DOS model %d has no faces with known vertices -- skipping\n", dos_index);
    free(m);
    return 0;
  }

  unsigned int pos = 0;
  emit(out, out_sz, &pos, "BEGIN \"dos%02x\"\nVERSION {0}\n\nPOINTS {\n", dos_index);
  /* POINTS must come out in renumbered order, so invert the map once. */
  static int order[DOS_MAX_VERTS];
  for (int v = 0; v < DOS_MAX_VERTS; v++) {
    if (remap[v] >= 0) order[remap[v]] = v;
  }
  const int x_fix = dos_model_x_offset(dos_index);
  for (int i = 0; i < n_points; i++) {
    const dos_vert *p = &m->verts[order[i]];
    /* The file's (x, y, z) is the port's (x, z, y) -- see this file's own
       block comment for the models this was confirmed against. */
    emit(out, out_sz, &pos, "%d,%d,%d;\n", p->x + x_fix, p->z, p->y);
  }
  emit(out, out_sz, &pos, "}\n\nPARTS {\n");

  int parts = 0;
  for (int f = 0; f < m->face_count; f++) {
    const dos_face *face = &m->faces[f];
    int mapped[DOS_MAX_FACE_VERTS];
    int n = 0;
    for (int k = 0; k < face->count; k++) {
      int v = face->idx[k];
      if (v >= 0 && v < DOS_MAX_VERTS && remap[v] >= 0) {
        mapped[n++] = remap[v];
      }
    }
    if (n < 3) {
      continue;
    }
    int wound[DOS_MAX_FACE_VERTS];
    n = emit_face_order(face, mapped, n, wound);

    /* Planarity is judged on the emitted coordinates, so it matches exactly
       what the renderer will be given. */
    int coords[DOS_MAX_FACE_VERTS][3];
    for (int k = 0; k < n; k++) {
      const dos_vert *q = &m->verts[order[wound[k]]];
      coords[k][0] = q->x + x_fix;
      coords[k][1] = q->z;
      coords[k][2] = q->y;
    }

    /* Anything wider than a quad is split as well, however flat it is: the
       port's face record holds a count plus at most 23 vertex indices in its
       0x60-byte stride (count at 0xc14 + p*0x60, indices from 0xc18), so a
       24-vertex face writes its last index at 0xc18 + p*0x60 + 23*4 -- which
       is exactly where the NEXT record's count lives. The shrine does that:
       model 0x0b has a 24- and a 23-vertex ring. The parser restores the
       trampled count when it writes the next part's own (indices go in
       before counts, parts in ascending order), so nothing is corrupted --
       but at draw time that face's 24th index IS the neighbouring count
       field, so it draws one corner from a small integer used as a vertex
       number. Narrower n-gons avoid that entirely and are still split,
       because a face gets UVs and shading from its first four vertices only
       (emit_catalog_object reads _face_rec + 4/8/0xc/0x10 and caps its shade
       loop at _ci < 4); see this file's header comment.

       Splitting is what the port's own art already does: not one shipped .E
       face exceeds five vertices (ROCKBIG.E is 52 triangles where DOS model
       0x07 has a 7-vertex base ring), so the renderer has only ever been fed
       quads and triangles. Only the untextured FACE opcode (0x007e) produces
       wide faces -- checked across every model -- so no texture origin is
       disturbed by splitting them. */
    if (n <= 4 && face_is_planar((const int (*)[3])coords, n)) {
      if (parts >= DOS_MAX_FACES) { m->truncated = 1; break; }
      emit(out, out_sz, &pos, "0,N,%d,FF04,(", parts);
      for (int k = 0; k < n; k++) {
        emit(out, out_sz, &pos, "%s%d", k ? "," : "", wound[k]);
      }
      emit(out, out_sz, &pos, ");\n");
      g_face_colour[dos_index][parts] = (signed char)face->colour;
      parts++;
    } else {
      int tris[DOS_MAX_FACE_VERTS][3];
      int n_tris = triangulate_face((const int (*)[3])coords, n, tris);
      /* Every piece keeps the winding of the ring it came from. Reversing the
         wide ones instead was tried in play and looked worse, which fits:
         what is actually wrong with these models is the order they are drawn
         in, not which way they face. */
      for (int t = 0; t < n_tris; t++) {
        if (parts >= DOS_MAX_FACES) { m->truncated = 1; break; }
        emit(out, out_sz, &pos, "0,N,%d,FF04,(%d,%d,%d);\n",
             parts, wound[tris[t][0]], wound[tris[t][1]], wound[tris[t][2]]);
        /* Each triangle inherits the colour of the face it came from. */
        g_face_colour[dos_index][parts] = (signed char)face->colour;
        parts++;
      }
    }
  }
  emit(out, out_sz, &pos, "}\n\nEND\n");

  int ok = pos <= out_sz && parts > 0;
  if (!ok) {
    DEBUG(WARN, "[models] DOS model %d did not fit in a %u-byte script buffer\n",
          dos_index, out_sz);
    memset(g_face_colour[dos_index], -1, sizeof g_face_colour[dos_index]);
    out[0] = '\0';
    free(m);
    return 0;
  }
  DEBUG(INFO, "[models] DOS model %#04x: %d points, %d faces%s\n",
        dos_index, n_points, parts, m->truncated ? " (decode stopped early)" : "");
  free(m);
  return (int)pos;
}

int uw_dos_model_face_colour(int dos_index, int part)
{
  if (!g_face_colour_ready || dos_index < 0 || dos_index > 31
      || part < 0 || part >= DOS_MAX_FACES) {
    return -1;
  }
  return g_face_colour[dos_index][part];
}

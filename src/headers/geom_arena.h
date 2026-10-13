#ifndef HEADERS_GEOM_ARENA_H
#define HEADERS_GEOM_ARENA_H

/* The per-frame geometry arena's layout. Its own header because both tmap.h (the emitters) and 3d.h
   (the transform / clip pipeline, declared from the uw.h umbrella) need the type. */
#include <stddef.h>

/* Arena limits. The original binary had 512 vertices (x3 arrays) and 490 records in 64 KB; the
   vertex arrays are now larger, so the offsets after model_verts differ from the original. */
#define UW_ARENA_MAX_VERTS 600
#define UW_ARENA_MAX_RECORDS 490

/* The per-frame geometry arena: every visible tile's (and model's) vertices and faces, filled by
   process_visible_tile_cell / emit_catalog_object, then transformed and clipped by graphics.c's
   render pass (3d.c). Each vertex index addresses the same slot in all three vertex arrays; each
   record is a face (a quad for tiles, any polygon for models). The field offsets are the original
   binary's (0x0, 0x4, 0x8, 0x1808, 0x3008, 0x4808, 0x4814); the sizes are the UW_ARENA_MAX_*
   limits below. */
typedef struct { float x, y, z; } uw_vec3;
typedef struct {
  int vert_count;     /* +0x00 */
  int vert_idx[4];    /* +0x04  indices into the vertex arrays (a model polygon may use up to 23 and
                         run on into the fields below, as in the original) */
  int pad14;          /* +0x14 */
  int attr[3];        /* +0x18  copied through to the clipped render record */
  int uv[8];          /* +0x24  u,v pair per corner */
  int pad[2];         /* +0x44 */
  int tex[3];         /* +0x4c  texture page / size / flags handed to the rasteriser */
  int visible;        /* +0x58  translate_verts_to_camera_space sets 1 */
  int clipped;        /* +0x5c  and 0; near_clip_visible_tiles draws records that are visible and not clipped */
} uw_geom_record_t;
typedef struct {
  int vert_count;                                  /* +0x0000 */
  int rec_count;                                   /* +0x0004 */
  uw_vec3 model_verts[UW_ARENA_MAX_VERTS];         /* +0x0008  world position */
  uw_vec3 camera_verts[UW_ARENA_MAX_VERTS];        /* +0x1808  relative to the camera */
  uw_vec3 projected_verts[UW_ARENA_MAX_VERTS];     /* +0x3008  through the view matrix (z = depth) */
  uw_vec3 cam_offset;                              /* +0x4808 */
  uw_geom_record_t records[UW_ARENA_MAX_RECORDS];  /* +0x4814 */
} uw_geom_arena_t;
_Static_assert(sizeof(uw_geom_record_t) == 0x60, "geometry record is 0x60 bytes");
_Static_assert(offsetof(uw_geom_record_t, attr) == 0x18 && offsetof(uw_geom_record_t, uv) == 0x24 &&
               offsetof(uw_geom_record_t, tex) == 0x4c && offsetof(uw_geom_record_t, clipped) == 0x5c,
               "geometry record layout");
_Static_assert(UW_ARENA_MAX_VERTS != 512 ||
               (offsetof(uw_geom_arena_t, camera_verts) == 0x1808 &&
                offsetof(uw_geom_arena_t, projected_verts) == 0x3008 &&
                offsetof(uw_geom_arena_t, cam_offset) == 0x4808 &&
                offsetof(uw_geom_arena_t, records) == 0x4814), "geometry arena layout");
extern uw_geom_arena_t g_geom_arena;
#define UW_ARENA_OFF(member) offsetof(uw_geom_arena_t, member)
#define UW_REC_OFF(field) (offsetof(uw_geom_arena_t, records) + offsetof(uw_geom_record_t, field))

/* Accessors for the decompiler's byte-offset indexing: an arena vertex (record) is addressed by its
   byte offset, vertex * 0xc (record * 0x60). UW_BITS stores raw IEEE bits into a float member. */
#define UW_VERT_AT(array, byte_offset) ((uw_vec3 *)((char *)(array) + (byte_offset)))
#define UW_REC_AT(byte_offset) ((uw_geom_record_t *)((char *)g_geom_arena.records + (byte_offset)))
#define UW_BITS(float_member) (*(undefined4 *)&(float_member))

#endif

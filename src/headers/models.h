#ifndef HEADERS_MODELS_H
#define HEADERS_MODELS_H

/* Declarations for models.c: the 3D "catalog object" model-rendering pipeline -- animation-record
   ticking, emitting a catalog object (door, bridge, decal, sign) as real .E model geometry, and
   door animation-frame emission. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in
   babl.c (init_barter_ui) -- extern'd here so both translation units
   see the same storage. */
/* Globals defined in uw.c but also used by functions that now live in models.c (tick_anim_record,
   emit_catalog_object, emit_anim_object_frames) -- extern'd here so both translation units see the
   same storage. */
extern short DAT_000b4620;
extern char *DAT_00110fc0;
/* The 29 catalog 3D model buffers load_3d_object_models fills via
   parse_e_model_file, indexed by g_anim_model_slot -- see that array's
   own comment for the slot-order table. */
extern undefined DAT_00123ccc_backing[16384];
#define DAT_00123ccc DAT_00123ccc_backing[0]
extern undefined2 DAT_00189570_backing[16];
#define DAT_00189570 DAT_00189570_backing[0]
extern ushort DAT_0018957a;
extern int g_uw_debug_pick_diag;
extern int g_uw_3d_objects_enabled;
extern undefined1 DAT_00202520_backing[1024];
#define DAT_00202520 DAT_00202520_backing[0]
extern char * DAT_00110fc0;


void parse_e_model_file(char *path, byte *out_buffer, int flip_winding);

/* As parse_e_model_file, but reading an in-memory .E script instead of a
   file -- how the DOS asset set's models, which are bytecode inside UW.EXE
   rather than .E files, reach this parser. See src/models_dos.c. */
void parse_e_model_script(const char *script, byte *out_buffer, int flip_winding);
void *tick_anim_record(short catalog);
void apply_model_position_offset(char *model, int offset_x, int offset_y, int offset_z);
void scale_model_part_offsets(void *model_block, int scale_x, int scale_y, int scale_z);
void load_3d_object_models();
void emit_catalog_object(byte catalog, void *obj, char heading, short frame_or_texid);
void emit_anim_object_frames(uint door_type, ushort *obj);

#endif

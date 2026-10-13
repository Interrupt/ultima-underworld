/* Declarations for lights.c: the --extralights point lights and the per-pixel lighting of textured
   surfaces. Pulls in uw.h itself so this header is self-contained. */
#ifndef UW_LIGHTS_H
#define UW_LIGHTS_H
#include "uw.h"

/* Extra lights (--extralights): up to UW_MAX_EXTRA_LIGHTS small point lights (campfires, magic
   projectiles, ...) added to the player's light when pixels are shaded. World positions are in the
   3D vertex arrays' x / height / y order; `eye` is filled in by extra_lights_transform_to_eye in the
   span rasterizer's distance units. */
#define UW_MAX_EXTRA_LIGHTS 8
typedef struct {
  float world[3];
  float eye[3];
  float radius;    /* world units; 256 per tile */
  float intensity; /* peak brightness, 0..1 */
} uw_extra_light_t;
typedef struct {
  unsigned short first_id, last_id; /* object id range that is this kind of light */
  float radius, intensity, rise;
} uw_extra_light_source_t;
extern const uw_extra_light_source_t g_extra_light_sources[];
extern uw_extra_light_t g_extra_lights[UW_MAX_EXTRA_LIGHTS];
extern int g_extra_light_count;
extern int g_shade_rows_dirty; /* set when the shade table is reloaded */
void extra_lights_reset(void);
int extra_light_add(float world_x, float world_height, float world_y, float radius, float intensity);
void extra_lights_consider_object(unsigned int object_id, int world_x, int world_y, int world_z);
void extra_lights_transform_to_eye(void);
void light_depth_rounding_prepare(void);
int light_rounded_distance(int depth, double ray_x, double ray_y);
unsigned short shade_span_pixel(byte texel, int depth, double ray_x, double ray_y, int dither_offset,
                                bool dos_light_mode, bool fullbright_enabled);

#endif

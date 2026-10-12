/* Extra lights (--extralights): small point lights around campfires, glowing rocks, lit torches and
   magic projectiles, and the per-pixel lighting of textured surfaces (the player's light plus those
   lights). See lights.h. */
#include "headers/lights.h"
#include "headers/options.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>

/* ---- Extra lights (--extralights) --------------------------------------------------------------
   Small point lights around campfires, glowing rocks, lit torches on the floor and magic
   projectiles, lit with the same falloff the player's light uses. Lights are collected while the
   visible tiles are walked (extra_lights_consider_object, called for every visible object), moved
   into eye space once per frame (extra_lights_transform_to_eye), and then consulted for every
   textured pixel by shade_span_pixel. Only the first UW_MAX_EXTRA_LIGHTS are kept; later ones are
   dropped. */

/* Eye-space units: the span's depth is world_depth/1500*4096 (see raster_textured_span), so a light's
   eye-space position is scaled by this to compare against a pixel's distance in the same units. */
#define UW_EYE_TO_LIGHT_UNITS (4096.0 / 1500.0)

uw_extra_light_t g_extra_lights[UW_MAX_EXTRA_LIGHTS];
int g_extra_light_count;

void extra_lights_reset(void)
{
  g_extra_light_count = 0;
}

/* Add a light at a world position (the x / height / y order the 3D vertex arrays use), reaching
   `radius` world units with the given peak brightness (0..1). Returns 0 when the list is full and
   the light was dropped. */
int extra_light_add(float world_x, float world_height, float world_y, float radius, float intensity)
{
  uw_extra_light_t *light;
  if (g_extra_light_count >= UW_MAX_EXTRA_LIGHTS) return 0;
  light = &g_extra_lights[g_extra_light_count++];
  light->world[0] = world_x;
  light->world[1] = world_height;
  light->world[2] = world_y;
  light->radius = radius;
  light->intensity = intensity;
  light->eye[0] = light->eye[1] = light->eye[2] = 0.0f;
  return 1;
}

/* The objects that shed light: object id range, light radius (world units, 256 per tile), peak
   brightness, and how far above the object's base the light sits. */
const uw_extra_light_source_t g_extra_light_sources[] = {
  { 0x012a, 0x012a, 384.0f, 1.0f, 20.0f }, /* campfire */
  { 0x0129, 0x0129, 192.0f, 0.8f, 8.0f },  /* glowing rock */
  { 0x0094, 0x0094, 320.0f, 0.9f, 16.0f }, /* lit lantern */
  { 0x0095, 0x0095, 288.0f, 0.9f, 16.0f }, /* lit torch */
  { 0x0096, 0x0096, 192.0f, 0.7f, 8.0f },  /* lit candle */
  { 0x0014, 0x0014, 256.0f, 1.0f, 0.0f },  /* fireball */
  { 0x0015, 0x0015, 224.0f, 1.0f, 0.0f },  /* lightning bolt */
  { 0x0017, 0x0017, 160.0f, 0.9f, 0.0f },  /* magic missile */
  { 0x0120, 0x0120, 192.0f, 0.8f, 0.0f },  /* a spell */
  { 0x01c7, 0x01c7, 160.0f, 0.8f, 0.0f },  /* spell effect */
  { 0x007a, 0x007a, 192.0f, 0.7f, 24.0f }, /* wisp */
  { 0x0078, 0x0078, 256.0f, 0.9f, 32.0f }, /* fire elemental */
};
#define UW_EXTRA_LIGHT_SOURCE_COUNT (sizeof g_extra_light_sources / sizeof g_extra_light_sources[0])

/* Called for each visible object as the tiles are walked: if it is a light source and --extralights is
   on, add it to the list at its render-frame position (x, y, z as the billboard code sees them). */
void extra_lights_consider_object(unsigned int object_id, int world_x, int world_y, int world_z)
{
  unsigned int i;
  if (!g_opts.extralights) return;
  object_id &= 0x1ff;
  for (i = 0; i < UW_EXTRA_LIGHT_SOURCE_COUNT; i++) {
    if (object_id >= g_extra_light_sources[i].first_id && object_id <= g_extra_light_sources[i].last_id) {
      extra_light_add((float)world_x, (float)world_z + g_extra_light_sources[i].rise, (float)world_y,
                      g_extra_light_sources[i].radius, g_extra_light_sources[i].intensity);
      return;
    }
  }
}

/* Move every light's world position through the current view matrix, the way
   translate_verts_to_camera_space + project_verts_through_view_matrix do for vertices, and store it
   (and its radius) in the span's distance units. Call once per frame after build_view_matrix. */
void extra_lights_transform_to_eye(void)
{
  float m[16];
  float cam_offset[3];
  int i;
  static int reported_count = 0;
  if (g_opts.debug && g_extra_light_count != reported_count) {
    reported_count = g_extra_light_count;
    fprintf(stderr, "[extralights] %d light%s in view\n", g_extra_light_count, g_extra_light_count == 1 ? "" : "s");
  }
  if (g_extra_light_count == 0) return;
  memcpy(m, DAT_000c8ac0_mtx, sizeof m);
  memcpy(cam_offset, (char *)DAT_000a85d0_backing + 0x4808, sizeof cam_offset);
  for (i = 0; i < g_extra_light_count; i++) {
    uw_extra_light_t *light = &g_extra_lights[i];
    float a = light->world[0] + cam_offset[0];
    float b = light->world[1] + cam_offset[1];
    float c = light->world[2] + cam_offset[2];
    light->eye[0] = (float)((a * m[0] + b * m[4] + c * m[8] + m[12]) * UW_EYE_TO_LIGHT_UNITS);
    light->eye[1] = (float)((a * m[1] + b * m[5] + c * m[9] + m[13]) * UW_EYE_TO_LIGHT_UNITS);
    light->eye[2] = (float)((a * m[2] + b * m[6] + c * m[10] + m[14]) * UW_EYE_TO_LIGHT_UNITS);
  }
}

/* ARM mode takes its brightness from the DOS shade table so the two modes light the same: row r of
   LIGHT.DAT/MONO.DAT is a darker version of every palette colour, so its average luminance relative
   to row 0 is how bright the row is. Those 16 factors (4096 = full) give the brightness next to the
   player and, through a fit A * (1 - x/D)^k, the shade D at which the light reaches black rather than
   holding the table's darkest row. The falloff curves themselves (--light-mode smooth / linear) are functions of the
   true distance. Refitted after the table is (re)loaded (update_fullbright_palette_mask sets the flag). */
int g_shade_rows_dirty = 1;
static double g_shade_row_factor[16] = {0};
static double g_fit_a = 4096.0, g_fit_d = 16.0, g_fit_k = 1.0;

static int palette_luminance(int texel)
{
  unsigned int c = (unsigned short)(&g_palette_rgb565)[texel];
  unsigned int r = (c >> 11) & 31, g = (c >> 5) & 63, b = c & 31;
  return (int)(r * 8 * 77 + g * 4 * 150 + b * 8 * 29);
}

/* Least-squares fit of A, D and k to the row factors by grid search over D and k (A is closed form). */
static void fit_formula_to_rows(void)
{
  double best = 1e30, d, k;
  int row;
  for (d = 15.5; d <= 28.0; d += 0.25) {
    for (k = 0.4; k <= 4.0; k += 0.05) {
      double num = 0.0, den = 0.0, a, err = 0.0;
      for (row = 0; row < 16; row++) {
        double b = pow(1.0 - row / d, k);
        num += b * g_shade_row_factor[row];
        den += b * b;
      }
      a = num / den;
      if (a > 4096.0) a = 4096.0;
      for (row = 0; row < 16; row++) {
        double e = a * pow(1.0 - row / d, k) - g_shade_row_factor[row];
        err += e * e;
      }
      if (err < best) { best = err; g_fit_a = a; g_fit_d = d; g_fit_k = k; }
    }
  }
}

static void rebuild_shade_row_factors(void)
{
  long total[16];
  int row, texel;
  g_shade_rows_dirty = 0;
  for (row = 0; row < 16; row++) {
    total[row] = 0;
    for (texel = 1; texel < 256; texel++)
      total[row] += palette_luminance((byte)DAT_0024fa2c[row * 256 + texel]);
  }
  for (row = 0; row < 16; row++) {
    double f = total[0] > 0 ? (double)total[row] * 4096.0 / (double)total[0] : 4096.0;
    if (f > 4096.0) f = 4096.0;
    if (row > 0 && f > g_shade_row_factor[row - 1]) f = g_shade_row_factor[row - 1];
    g_shade_row_factor[row] = f;
  }
  fit_formula_to_rows();
}

/* The falloff curves (light modes "smooth", the default, and "linear") are textbook functions of the true distance from the player,
   in tiles. Both keep the near brightness of the level's start row and reach black at the shade D of the
   fit, converted back to tiles through the level's falloff and offset. */
static double light_max_distance_tiles(void)
{
  double falloff = DAT_0025063c < 1 ? 1 : DAT_0025063c;
  double m = (g_fit_d - DAT_0025064c - DAT_002506dc) * 2048.0 / falloff / 256.0;
  return m < 0.25 ? 0.25 : m;
}

static double near_start_factor(void)
{
  int init = DAT_0025064c;
  return g_shade_row_factor[init < 0 ? 0 : init > 15 ? 15 : init];
}

/* Mode "smooth" (default): (1 - s^2)^2 / (1 + F s^2), s = d / max distance, F = max distance / 1.3.
   The windowed attenuation from https://lisyarus.github.io/blog/posts/point-light-attenuation.html: it is 1 at
   the light, reaches exactly 0 at the maximum distance, and eases out there. */
static double windowed_factor(double d_tiles)
{
  double m = light_max_distance_tiles(), s, s2, w;
  if (d_tiles >= m) return 0.0;
  s = d_tiles / m;
  s2 = s * s;
  w = 1.0 - s2;
  return near_start_factor() * (w * w) / (1.0 + (m / 1.3) * s2);
}

/* Mode "linear": the DOS shade rows' brightness factors, interpolated linearly. Distance maps to a fractional shade row
   exactly as the DOS table does (max(0, world*F/2048 + offset) + start); the two nearest rows' factors are averaged
   by the fraction, and a final knot of zero at the fit's black shade D carries the last row down to black. Same near
   brightness and black distance as the other modes, following the table's own (near-linear) steps with no extra shaping. */
static double linear_factor(double d_tiles)
{
  const double far_scale = 1.23;
  double falloff = DAT_0025063c < 1 ? 1 : DAT_0025063c;
  double shade = d_tiles * 256.0 * falloff / 2048.0 + DAT_002506dc, lo_f, hi_f, t;
  int row;
  if (shade < 0.0) shade = 0.0;
  /* HACK: not original behaviour -- the averaged row brightnesses stay brighter than the DOS table's per-colour rows, which
     go black around shade 14.6 rather than at the fit's D (~18). Bring the whole falloff in by this factor (measured from
     the start shade) so the linear ramp ends where the DOS lighting does. */
  shade = shade * far_scale + DAT_0025064c;
  if (shade >= g_fit_d) return 0.0;
  row = (int)shade;
  t = shade - row;
  lo_f = g_shade_row_factor[row > 15 ? 15 : row];
  if (row >= 15) {
    /* Past the last table row: fall from its brightness to zero at D. */
    double span = g_fit_d - 15.0;
    return span <= 0.0 ? 0.0 : lo_f * (1.0 - (shade - 15.0) / span);
  }
  hi_f = g_shade_row_factor[row + 1];
  return lo_f + (hi_f - lo_f) * t;
}

/* Brightness factor (0..4096) at the span's radial distance, in 4096*w units (world units * 4096/1500).
   The light mode picks the curve; "dos" never gets here. */
static int dos_shade_factor(int light_distance)
{
  double tiles = light_distance * 1500.0 / 4096.0 / 256.0, f;
  if (g_shade_rows_dirty) rebuild_shade_row_factors();
  if (g_opts.light_mode && strcasecmp(g_opts.light_mode, "linear") == 0) f = linear_factor(tiles);
  else f = windowed_factor(tiles);
  return f > 4096.0 ? 4096 : (int)f;
}

/* HACK: not original behaviour -- the --light-depth-rounding option. The DOS renderer shades per vertex from
   the camera-space point (x, y, z): each coordinate is truncated with `sar ax,5` (32 world units), the three
   squares are summed in a 16-bit register (wrapping past ~8160 world units), and the distance is a 4-iteration
   Newton square root from 0x40 using integer `div` and `rcr` halving. Returns the light distance, in the same
   4096*w units as the exact one, that this arithmetic gives for the pixel at `depth` (4096*w) and the given
   ray offsets (reference: cimmerianpit/openabyss src/uw_shade.c uw_rast_vertex_shade, MIT). */
int light_rounded_distance(int depth, double ray_x, double ray_y)
{
  const double world_per_unit = 1500.0 / 4096.0;
  int coord[3], i;
  unsigned short sum = 0, root = 0x40;
  coord[0] = (int)(depth * ray_x * world_per_unit);
  coord[1] = (int)(depth * ray_y * world_per_unit);
  coord[2] = (int)(depth * world_per_unit);
  for (i = 0; i < 3; i++) {
    short a = (short)(coord[i] >> 5);
    sum = (unsigned short)(sum + (unsigned short)((int)a * a));
  }
  for (i = 0; i < 4; i++) {
    unsigned short q = (unsigned short)(sum / root);
    root = (unsigned short)(((unsigned int)root + q) >> 1);
  }
  return (int)(((long long)root * 32 * 4096 + 749) / 1500);
}

/* Light one textured pixel and return its RGB565 colour. `depth` is the span's 4096*w depth for the pixel;
   (ray_x, ray_y) is the pixel's offset from screen centre in focal-length units. With --extralights off
   (or an empty light list) this is exactly the player's light: the DOS shade table when `dos_light_mode`,
   otherwise the ARM RGB falloff, with the palette indices LIGHT.DAT leaves alone (lava, fire, magic)
   kept fullbright when `fullbright_enabled`. With lights in the list each one is evaluated the same
   way and the brightest result wins (DOS rows) or the contributions add (ARM falloff). */
unsigned short shade_span_pixel(byte texel, int depth, double ray_x, double ray_y, int dither_offset,
                                bool dos_light_mode, bool fullbright_enabled)
{
  int light_distance = (int)(depth * sqrt(1.0 + ray_x * ray_x + ray_y * ray_y));
  if (g_opts.light_depth_rounding) light_distance = light_rounded_distance(depth, ray_x, ray_y);
  bool use_extra = g_opts.extralights && g_extra_light_count > 0;
  double pixel[3];
  int i;

  if (use_extra) {
    pixel[0] = depth * ray_x;
    pixel[1] = -depth * ray_y;
    pixel[2] = depth;
  }
  /* Shading level 5 loads MONO.DAT instead of LIGHT.DAT (load_shading_level_config): the black and
     * white view. DOS mode gets it through its row lookups below; the ARM-style RGB scaling does not use the
     * table's rows, so map the texel through row 0 (full-brightness grey) first and scale that. */
  if (!dos_light_mode && DAT_000872a0 == 5 && DAT_0024fa2c) texel = (byte)DAT_0024fa2c[texel];
  if (dos_light_mode) {
    /* HACK: palette shading uses SHADES.DAT's selected light strength.
       tmap supplies w = world_depth/1500. Edge setup scales 1/w by
       16384, the span shifts it by 2, and 2^24 / that gives w*4096.
       Convert to world_distance/32, retaining an 8.8 shade fraction.
       DOS's span accumulators start at shade+0.5 +/-0.25, swapping
       on odd rows. Use those same 0x40/0xc0 thresholds here, anchored
       to screen x/y so clipping and triangle boundaries cannot shift
       the dither. Deliberate deviation: keep per-pixel radial lighting,
       rather than DOS's vertex shade/scanline gradient interpolation.
       Reference: cimmerianpit/openabyss, src/uw_shade.c (MIT). */
    int shade_fixed = (int)((int64_t)light_distance * 1500 * DAT_0025063c / 32768) +
                      (int)DAT_002506dc * 256;
    int row;
    if (shade_fixed < 0) shade_fixed = 0;
    shade_fixed += (int)DAT_0025064c * 256;
    shade_fixed += dither_offset;
    if (use_extra) {
      for (i = 0; i < g_extra_light_count; i++) {
        const uw_extra_light_t *light = &g_extra_lights[i];
        double dx = pixel[0] - light->eye[0], dy = pixel[1] - light->eye[1], dz = pixel[2] - light->eye[2];
        double reach = light->radius * UW_EYE_TO_LIGHT_UNITS;
        double d = sqrt(dx * dx + dy * dy + dz * dz);
        int light_shade;
        if (d >= reach) continue;
        /* Row 0 is full brightness: a light of intensity 1 is row 0 at its centre, and every light
           falls off linearly to row 15 at its radius. */
        light_shade = (int)((15.0 * (1.0 - light->intensity) + 15.0 * (d / reach) * light->intensity) * 256.0) +
                      dither_offset;
        if (light_shade < shade_fixed) shade_fixed = light_shade;
      }
    }
    row = shade_fixed >> 8;
    if (row < 0) row = 0;
    if (row > 15) row = 15;
    texel = ((byte *)DAT_0024fa2c)[row * 256 + texel];
    return (unsigned short)(&g_palette_rgb565)[texel];
  }
  else if (fullbright_enabled && g_fullbright_palette_mask[texel]) {
    return (unsigned short)(&g_palette_rgb565)[texel];
  }
  else {
    /* The DOS brightness and light distance as a smooth RGB scale (see dos_shade_factor). */
    unsigned int colour;
    int factor;
    int round;
    int red, green, blue;
    colour = (unsigned int)(unsigned short)(&g_palette_rgb565)[texel];
    factor = DAT_0024fa2c ? dos_shade_factor(light_distance) : 4096;
    if (use_extra) {
      /* Same falloff table, indexed by the distance to each light scaled so that the table's last
         entry lands on the light's radius; the contributions add up, capped at full brightness. */
      for (i = 0; i < g_extra_light_count; i++) {
        const uw_extra_light_t *light = &g_extra_lights[i];
        double dx = pixel[0] - light->eye[0], dy = pixel[1] - light->eye[1], dz = pixel[2] - light->eye[2];
        double reach = light->radius * UW_EYE_TO_LIGHT_UNITS;
        double d = sqrt(dx * dx + dy * dy + dz * dz);
        int light_index;
        if (d >= reach) continue;
        light_index = (int)(d * 160.0 / reach);
        if (light_index > 0x9f) light_index = 0x9f;
        factor += (int)((&DAT_000b5638)[light_index] * light->intensity);
      }
      if (factor > 4096) factor = 4096;
    }
    /* HACK: optionally dither the fractional RGB channels before their
       final 18-bit shift. This preserves the ARM falloff LUT and avoids
       creating another coarse shade-index step. Integer/full-bright
       channels stay unchanged, including the RGB565 upper bounds. */
    round = dither_offset * 1024;
    red = (((colour >> 11) & 31) * 64 * factor + round) >> 18;
    green = (((colour >> 5) & 63) * 64 * factor + round) >> 18;
    blue = ((colour & 31) * 64 * factor + round) >> 18;
    return (unsigned short)((red << 11) | (green << 5) | blue);
  }
}

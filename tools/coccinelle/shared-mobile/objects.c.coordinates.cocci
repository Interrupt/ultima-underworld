@settle_dropped_object_mobile_tile_x_scaled@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)mobile)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)mobile)->tile_x << 3)
|
- (((uw_mobile_object_t *)mobile)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)mobile)->tile_x << 3)
|
- (((uw_mobile_object_t *)mobile)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)mobile)->tile_x << 3)
|
- ((((uw_mobile_object_t *)mobile)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)mobile)->tile_x << 3)
)
...>
}

@settle_dropped_object_mobile_tile_y_scaled@
type R;
identifier F =~ "^\(settle_dropped_object\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)mobile)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)mobile)->tile_y << 3)
|
- (((uw_mobile_object_t *)mobile)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)mobile)->tile_y << 3)
|
- (((uw_mobile_object_t *)mobile)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)mobile)->tile_y << 3)
|
- ((((uw_mobile_object_t *)mobile)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)mobile)->tile_y << 3)
)
...>
}

@reallocate_object_to_arena_puVar2_tile_x_scaled@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar2)->tile_position & 0xfc00) >> 7
+ (((uw_mobile_object_t *)puVar2)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar2)->tile_position >> 7) & 0x1f8
+ (((uw_mobile_object_t *)puVar2)->tile_x << 3)
|
- (((uw_mobile_object_t *)puVar2)->tile_x << 10) >> 7
+ (((uw_mobile_object_t *)puVar2)->tile_x << 3)
|
- ((((uw_mobile_object_t *)puVar2)->tile_x << 10)) >> 7
+ (((uw_mobile_object_t *)puVar2)->tile_x << 3)
)
...>
}

@reallocate_object_to_arena_puVar2_tile_y_scaled@
type R;
identifier F =~ "^\(reallocate_object_to_arena\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- (((uw_mobile_object_t *)puVar2)->tile_position & 0x3f0) >> 1
+ (((uw_mobile_object_t *)puVar2)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar2)->tile_position >> 1) & 0x1f8
+ (((uw_mobile_object_t *)puVar2)->tile_y << 3)
|
- (((uw_mobile_object_t *)puVar2)->tile_y << 4) >> 1
+ (((uw_mobile_object_t *)puVar2)->tile_y << 3)
|
- ((((uw_mobile_object_t *)puVar2)->tile_y << 4)) >> 1
+ (((uw_mobile_object_t *)puVar2)->tile_y << 3)
)
...>
}

@arena_store_a85d8 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
|
- (&DAT_000a85d8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85da)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85db)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = V;
)

@arena_store_a85dc disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
|
- (&DAT_000a85dc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85de)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85df)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = V;
)

@arena_store_a85e0 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)((uint)V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
|
- (&DAT_000a85e0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000a85e2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000a85e3)[I] = (char)(V >> 0x18);
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = V;
)

@arena_store_acde4 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
|
- (&DAT_000acde4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acde6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acde7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_count = V;
)

@arena_store_acde8 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
|
- (&DAT_000acde8)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdea)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdeb)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[0] = V;
)

@arena_store_acdec disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
|
- (&DAT_000acdec)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdee)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdef)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[1] = V;
)

@arena_store_acdf0 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
|
- (&DAT_000acdf0)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf2)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf3)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[2] = V;
)

@arena_store_acdf4 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
|
- (&DAT_000acdf4)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdf6)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdf7)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->vert_idx[3] = V;
)

@arena_store_acdfc disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
|
- (&DAT_000acdfc)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000acdfe)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000acdff)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[0] = V;
)

@arena_store_ace00 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
|
- (&DAT_000ace00)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace02)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace03)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[1] = V;
)

@arena_store_ace04 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
|
- (&DAT_000ace04)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace06)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace07)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->attr[2] = V;
)

@arena_store_ace08 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
|
- (&DAT_000ace08)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[0] = V;
)

@arena_store_ace0c disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
|
- (&DAT_000ace0c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace0e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace0f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[1] = V;
)

@arena_store_ace10 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
|
- (&DAT_000ace10)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace12)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace13)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[2] = V;
)

@arena_store_ace14 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
|
- (&DAT_000ace14)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace16)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace17)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[3] = V;
)

@arena_store_ace18 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
|
- (&DAT_000ace18)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1a)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1b)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[4] = V;
)

@arena_store_ace1c disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
|
- (&DAT_000ace1c)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace1e)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace1f)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[5] = V;
)

@arena_store_ace20 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
|
- (&DAT_000ace20)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace22)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace23)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[6] = V;
)

@arena_store_ace24 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
|
- (&DAT_000ace24)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace26)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace27)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->uv[7] = V;
)

@arena_store_ace30 disable drop_cast, bitand_comm@
expression I, V;
typedef uint, ushort;
@@
(
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((uint)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)((ushort)V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)((uint)V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)((uint)V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
|
- (&DAT_000ace30)[I] = (char)V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = (char)(V >> 8);
  ... when != I
      when != V
- (&DAT_000ace32)[I] = (char)(V >> 0x10);
  ... when != I
      when != V
- (&DAT_000ace33)[I] = (char)(V >> 0x18);
+ UW_REC_AT(I)->tex[0] = V;
)

@arena_zero_a85d8 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000a85d8)[I] = V;
  ... when != I
      when != V
- (&DAT_000a85d9)[I] = 0;
  ... when != I
- (&DAT_000a85da)[I] = 0;
  ... when != I
- (&DAT_000a85db)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = (byte)V;

@arena_const_a85d8@
expression I;
constant C;
@@
- (&DAT_000a85d8)[I] = C;
  ... when != I
- (&DAT_000a85d9)[I] = 0;
  ... when != I
- (&DAT_000a85da)[I] = 0;
  ... when != I
- (&DAT_000a85db)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = C;

@arena_clear_a85d8@
expression I;
@@
- (&DAT_000a85d8)[I] = 0;
  ... when != I
- (&DAT_000a85d9)[I] = 0;
  ... when != I
- (&DAT_000a85da)[I] = 0;
  ... when != I
- (&DAT_000a85db)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->x) = 0;

@arena_zero_a85dc disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000a85dc)[I] = V;
  ... when != I
      when != V
- (&DAT_000a85dd)[I] = 0;
  ... when != I
- (&DAT_000a85de)[I] = 0;
  ... when != I
- (&DAT_000a85df)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = (byte)V;

@arena_const_a85dc@
expression I;
constant C;
@@
- (&DAT_000a85dc)[I] = C;
  ... when != I
- (&DAT_000a85dd)[I] = 0;
  ... when != I
- (&DAT_000a85de)[I] = 0;
  ... when != I
- (&DAT_000a85df)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = C;

@arena_clear_a85dc@
expression I;
@@
- (&DAT_000a85dc)[I] = 0;
  ... when != I
- (&DAT_000a85dd)[I] = 0;
  ... when != I
- (&DAT_000a85de)[I] = 0;
  ... when != I
- (&DAT_000a85df)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->y) = 0;

@arena_zero_a85e0 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000a85e0)[I] = V;
  ... when != I
      when != V
- (&DAT_000a85e1)[I] = 0;
  ... when != I
- (&DAT_000a85e2)[I] = 0;
  ... when != I
- (&DAT_000a85e3)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = (byte)V;

@arena_const_a85e0@
expression I;
constant C;
@@
- (&DAT_000a85e0)[I] = C;
  ... when != I
- (&DAT_000a85e1)[I] = 0;
  ... when != I
- (&DAT_000a85e2)[I] = 0;
  ... when != I
- (&DAT_000a85e3)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = C;

@arena_clear_a85e0@
expression I;
@@
- (&DAT_000a85e0)[I] = 0;
  ... when != I
- (&DAT_000a85e1)[I] = 0;
  ... when != I
- (&DAT_000a85e2)[I] = 0;
  ... when != I
- (&DAT_000a85e3)[I] = 0;
+ UW_BITS(UW_VERT_AT(g_geom_arena.model_verts, I)->z) = 0;

@arena_zero_acde4 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000acde4)[I] = V;
  ... when != I
      when != V
- (&DAT_000acde5)[I] = 0;
  ... when != I
- (&DAT_000acde6)[I] = 0;
  ... when != I
- (&DAT_000acde7)[I] = 0;
+ UW_REC_AT(I)->vert_count = (byte)V;

@arena_const_acde4@
expression I;
constant C;
@@
- (&DAT_000acde4)[I] = C;
  ... when != I
- (&DAT_000acde5)[I] = 0;
  ... when != I
- (&DAT_000acde6)[I] = 0;
  ... when != I
- (&DAT_000acde7)[I] = 0;
+ UW_REC_AT(I)->vert_count = C;

@arena_clear_acde4@
expression I;
@@
- (&DAT_000acde4)[I] = 0;
  ... when != I
- (&DAT_000acde5)[I] = 0;
  ... when != I
- (&DAT_000acde6)[I] = 0;
  ... when != I
- (&DAT_000acde7)[I] = 0;
+ UW_REC_AT(I)->vert_count = 0;

@arena_zero_acde8 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000acde8)[I] = V;
  ... when != I
      when != V
- (&DAT_000acde9)[I] = 0;
  ... when != I
- (&DAT_000acdea)[I] = 0;
  ... when != I
- (&DAT_000acdeb)[I] = 0;
+ UW_REC_AT(I)->vert_idx[0] = (byte)V;

@arena_const_acde8@
expression I;
constant C;
@@
- (&DAT_000acde8)[I] = C;
  ... when != I
- (&DAT_000acde9)[I] = 0;
  ... when != I
- (&DAT_000acdea)[I] = 0;
  ... when != I
- (&DAT_000acdeb)[I] = 0;
+ UW_REC_AT(I)->vert_idx[0] = C;

@arena_clear_acde8@
expression I;
@@
- (&DAT_000acde8)[I] = 0;
  ... when != I
- (&DAT_000acde9)[I] = 0;
  ... when != I
- (&DAT_000acdea)[I] = 0;
  ... when != I
- (&DAT_000acdeb)[I] = 0;
+ UW_REC_AT(I)->vert_idx[0] = 0;

@arena_zero_acdec disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000acdec)[I] = V;
  ... when != I
      when != V
- (&DAT_000acded)[I] = 0;
  ... when != I
- (&DAT_000acdee)[I] = 0;
  ... when != I
- (&DAT_000acdef)[I] = 0;
+ UW_REC_AT(I)->vert_idx[1] = (byte)V;

@arena_const_acdec@
expression I;
constant C;
@@
- (&DAT_000acdec)[I] = C;
  ... when != I
- (&DAT_000acded)[I] = 0;
  ... when != I
- (&DAT_000acdee)[I] = 0;
  ... when != I
- (&DAT_000acdef)[I] = 0;
+ UW_REC_AT(I)->vert_idx[1] = C;

@arena_clear_acdec@
expression I;
@@
- (&DAT_000acdec)[I] = 0;
  ... when != I
- (&DAT_000acded)[I] = 0;
  ... when != I
- (&DAT_000acdee)[I] = 0;
  ... when != I
- (&DAT_000acdef)[I] = 0;
+ UW_REC_AT(I)->vert_idx[1] = 0;

@arena_zero_acdf0 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000acdf0)[I] = V;
  ... when != I
      when != V
- (&DAT_000acdf1)[I] = 0;
  ... when != I
- (&DAT_000acdf2)[I] = 0;
  ... when != I
- (&DAT_000acdf3)[I] = 0;
+ UW_REC_AT(I)->vert_idx[2] = (byte)V;

@arena_const_acdf0@
expression I;
constant C;
@@
- (&DAT_000acdf0)[I] = C;
  ... when != I
- (&DAT_000acdf1)[I] = 0;
  ... when != I
- (&DAT_000acdf2)[I] = 0;
  ... when != I
- (&DAT_000acdf3)[I] = 0;
+ UW_REC_AT(I)->vert_idx[2] = C;

@arena_clear_acdf0@
expression I;
@@
- (&DAT_000acdf0)[I] = 0;
  ... when != I
- (&DAT_000acdf1)[I] = 0;
  ... when != I
- (&DAT_000acdf2)[I] = 0;
  ... when != I
- (&DAT_000acdf3)[I] = 0;
+ UW_REC_AT(I)->vert_idx[2] = 0;

@arena_zero_acdf4 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000acdf4)[I] = V;
  ... when != I
      when != V
- (&DAT_000acdf5)[I] = 0;
  ... when != I
- (&DAT_000acdf6)[I] = 0;
  ... when != I
- (&DAT_000acdf7)[I] = 0;
+ UW_REC_AT(I)->vert_idx[3] = (byte)V;

@arena_const_acdf4@
expression I;
constant C;
@@
- (&DAT_000acdf4)[I] = C;
  ... when != I
- (&DAT_000acdf5)[I] = 0;
  ... when != I
- (&DAT_000acdf6)[I] = 0;
  ... when != I
- (&DAT_000acdf7)[I] = 0;
+ UW_REC_AT(I)->vert_idx[3] = C;

@arena_clear_acdf4@
expression I;
@@
- (&DAT_000acdf4)[I] = 0;
  ... when != I
- (&DAT_000acdf5)[I] = 0;
  ... when != I
- (&DAT_000acdf6)[I] = 0;
  ... when != I
- (&DAT_000acdf7)[I] = 0;
+ UW_REC_AT(I)->vert_idx[3] = 0;

@arena_zero_acdfc disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000acdfc)[I] = V;
  ... when != I
      when != V
- (&DAT_000acdfd)[I] = 0;
  ... when != I
- (&DAT_000acdfe)[I] = 0;
  ... when != I
- (&DAT_000acdff)[I] = 0;
+ UW_REC_AT(I)->attr[0] = (byte)V;

@arena_const_acdfc@
expression I;
constant C;
@@
- (&DAT_000acdfc)[I] = C;
  ... when != I
- (&DAT_000acdfd)[I] = 0;
  ... when != I
- (&DAT_000acdfe)[I] = 0;
  ... when != I
- (&DAT_000acdff)[I] = 0;
+ UW_REC_AT(I)->attr[0] = C;

@arena_clear_acdfc@
expression I;
@@
- (&DAT_000acdfc)[I] = 0;
  ... when != I
- (&DAT_000acdfd)[I] = 0;
  ... when != I
- (&DAT_000acdfe)[I] = 0;
  ... when != I
- (&DAT_000acdff)[I] = 0;
+ UW_REC_AT(I)->attr[0] = 0;

@arena_zero_ace00 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace00)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace01)[I] = 0;
  ... when != I
- (&DAT_000ace02)[I] = 0;
  ... when != I
- (&DAT_000ace03)[I] = 0;
+ UW_REC_AT(I)->attr[1] = (byte)V;

@arena_const_ace00@
expression I;
constant C;
@@
- (&DAT_000ace00)[I] = C;
  ... when != I
- (&DAT_000ace01)[I] = 0;
  ... when != I
- (&DAT_000ace02)[I] = 0;
  ... when != I
- (&DAT_000ace03)[I] = 0;
+ UW_REC_AT(I)->attr[1] = C;

@arena_clear_ace00@
expression I;
@@
- (&DAT_000ace00)[I] = 0;
  ... when != I
- (&DAT_000ace01)[I] = 0;
  ... when != I
- (&DAT_000ace02)[I] = 0;
  ... when != I
- (&DAT_000ace03)[I] = 0;
+ UW_REC_AT(I)->attr[1] = 0;

@arena_zero_ace04 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace04)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace05)[I] = 0;
  ... when != I
- (&DAT_000ace06)[I] = 0;
  ... when != I
- (&DAT_000ace07)[I] = 0;
+ UW_REC_AT(I)->attr[2] = (byte)V;

@arena_const_ace04@
expression I;
constant C;
@@
- (&DAT_000ace04)[I] = C;
  ... when != I
- (&DAT_000ace05)[I] = 0;
  ... when != I
- (&DAT_000ace06)[I] = 0;
  ... when != I
- (&DAT_000ace07)[I] = 0;
+ UW_REC_AT(I)->attr[2] = C;

@arena_clear_ace04@
expression I;
@@
- (&DAT_000ace04)[I] = 0;
  ... when != I
- (&DAT_000ace05)[I] = 0;
  ... when != I
- (&DAT_000ace06)[I] = 0;
  ... when != I
- (&DAT_000ace07)[I] = 0;
+ UW_REC_AT(I)->attr[2] = 0;

@arena_zero_ace08 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace08)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace09)[I] = 0;
  ... when != I
- (&DAT_000ace0a)[I] = 0;
  ... when != I
- (&DAT_000ace0b)[I] = 0;
+ UW_REC_AT(I)->uv[0] = (byte)V;

@arena_const_ace08@
expression I;
constant C;
@@
- (&DAT_000ace08)[I] = C;
  ... when != I
- (&DAT_000ace09)[I] = 0;
  ... when != I
- (&DAT_000ace0a)[I] = 0;
  ... when != I
- (&DAT_000ace0b)[I] = 0;
+ UW_REC_AT(I)->uv[0] = C;

@arena_clear_ace08@
expression I;
@@
- (&DAT_000ace08)[I] = 0;
  ... when != I
- (&DAT_000ace09)[I] = 0;
  ... when != I
- (&DAT_000ace0a)[I] = 0;
  ... when != I
- (&DAT_000ace0b)[I] = 0;
+ UW_REC_AT(I)->uv[0] = 0;

@arena_zero_ace0c disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace0c)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace0d)[I] = 0;
  ... when != I
- (&DAT_000ace0e)[I] = 0;
  ... when != I
- (&DAT_000ace0f)[I] = 0;
+ UW_REC_AT(I)->uv[1] = (byte)V;

@arena_const_ace0c@
expression I;
constant C;
@@
- (&DAT_000ace0c)[I] = C;
  ... when != I
- (&DAT_000ace0d)[I] = 0;
  ... when != I
- (&DAT_000ace0e)[I] = 0;
  ... when != I
- (&DAT_000ace0f)[I] = 0;
+ UW_REC_AT(I)->uv[1] = C;

@arena_clear_ace0c@
expression I;
@@
- (&DAT_000ace0c)[I] = 0;
  ... when != I
- (&DAT_000ace0d)[I] = 0;
  ... when != I
- (&DAT_000ace0e)[I] = 0;
  ... when != I
- (&DAT_000ace0f)[I] = 0;
+ UW_REC_AT(I)->uv[1] = 0;

@arena_zero_ace10 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace10)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace11)[I] = 0;
  ... when != I
- (&DAT_000ace12)[I] = 0;
  ... when != I
- (&DAT_000ace13)[I] = 0;
+ UW_REC_AT(I)->uv[2] = (byte)V;

@arena_const_ace10@
expression I;
constant C;
@@
- (&DAT_000ace10)[I] = C;
  ... when != I
- (&DAT_000ace11)[I] = 0;
  ... when != I
- (&DAT_000ace12)[I] = 0;
  ... when != I
- (&DAT_000ace13)[I] = 0;
+ UW_REC_AT(I)->uv[2] = C;

@arena_clear_ace10@
expression I;
@@
- (&DAT_000ace10)[I] = 0;
  ... when != I
- (&DAT_000ace11)[I] = 0;
  ... when != I
- (&DAT_000ace12)[I] = 0;
  ... when != I
- (&DAT_000ace13)[I] = 0;
+ UW_REC_AT(I)->uv[2] = 0;

@arena_zero_ace14 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace14)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace15)[I] = 0;
  ... when != I
- (&DAT_000ace16)[I] = 0;
  ... when != I
- (&DAT_000ace17)[I] = 0;
+ UW_REC_AT(I)->uv[3] = (byte)V;

@arena_const_ace14@
expression I;
constant C;
@@
- (&DAT_000ace14)[I] = C;
  ... when != I
- (&DAT_000ace15)[I] = 0;
  ... when != I
- (&DAT_000ace16)[I] = 0;
  ... when != I
- (&DAT_000ace17)[I] = 0;
+ UW_REC_AT(I)->uv[3] = C;

@arena_clear_ace14@
expression I;
@@
- (&DAT_000ace14)[I] = 0;
  ... when != I
- (&DAT_000ace15)[I] = 0;
  ... when != I
- (&DAT_000ace16)[I] = 0;
  ... when != I
- (&DAT_000ace17)[I] = 0;
+ UW_REC_AT(I)->uv[3] = 0;

@arena_zero_ace18 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace18)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace19)[I] = 0;
  ... when != I
- (&DAT_000ace1a)[I] = 0;
  ... when != I
- (&DAT_000ace1b)[I] = 0;
+ UW_REC_AT(I)->uv[4] = (byte)V;

@arena_const_ace18@
expression I;
constant C;
@@
- (&DAT_000ace18)[I] = C;
  ... when != I
- (&DAT_000ace19)[I] = 0;
  ... when != I
- (&DAT_000ace1a)[I] = 0;
  ... when != I
- (&DAT_000ace1b)[I] = 0;
+ UW_REC_AT(I)->uv[4] = C;

@arena_clear_ace18@
expression I;
@@
- (&DAT_000ace18)[I] = 0;
  ... when != I
- (&DAT_000ace19)[I] = 0;
  ... when != I
- (&DAT_000ace1a)[I] = 0;
  ... when != I
- (&DAT_000ace1b)[I] = 0;
+ UW_REC_AT(I)->uv[4] = 0;

@arena_zero_ace1c disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace1c)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace1d)[I] = 0;
  ... when != I
- (&DAT_000ace1e)[I] = 0;
  ... when != I
- (&DAT_000ace1f)[I] = 0;
+ UW_REC_AT(I)->uv[5] = (byte)V;

@arena_const_ace1c@
expression I;
constant C;
@@
- (&DAT_000ace1c)[I] = C;
  ... when != I
- (&DAT_000ace1d)[I] = 0;
  ... when != I
- (&DAT_000ace1e)[I] = 0;
  ... when != I
- (&DAT_000ace1f)[I] = 0;
+ UW_REC_AT(I)->uv[5] = C;

@arena_clear_ace1c@
expression I;
@@
- (&DAT_000ace1c)[I] = 0;
  ... when != I
- (&DAT_000ace1d)[I] = 0;
  ... when != I
- (&DAT_000ace1e)[I] = 0;
  ... when != I
- (&DAT_000ace1f)[I] = 0;
+ UW_REC_AT(I)->uv[5] = 0;

@arena_zero_ace20 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace20)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace21)[I] = 0;
  ... when != I
- (&DAT_000ace22)[I] = 0;
  ... when != I
- (&DAT_000ace23)[I] = 0;
+ UW_REC_AT(I)->uv[6] = (byte)V;

@arena_const_ace20@
expression I;
constant C;
@@
- (&DAT_000ace20)[I] = C;
  ... when != I
- (&DAT_000ace21)[I] = 0;
  ... when != I
- (&DAT_000ace22)[I] = 0;
  ... when != I
- (&DAT_000ace23)[I] = 0;
+ UW_REC_AT(I)->uv[6] = C;

@arena_clear_ace20@
expression I;
@@
- (&DAT_000ace20)[I] = 0;
  ... when != I
- (&DAT_000ace21)[I] = 0;
  ... when != I
- (&DAT_000ace22)[I] = 0;
  ... when != I
- (&DAT_000ace23)[I] = 0;
+ UW_REC_AT(I)->uv[6] = 0;

@arena_zero_ace24 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace24)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace25)[I] = 0;
  ... when != I
- (&DAT_000ace26)[I] = 0;
  ... when != I
- (&DAT_000ace27)[I] = 0;
+ UW_REC_AT(I)->uv[7] = (byte)V;

@arena_const_ace24@
expression I;
constant C;
@@
- (&DAT_000ace24)[I] = C;
  ... when != I
- (&DAT_000ace25)[I] = 0;
  ... when != I
- (&DAT_000ace26)[I] = 0;
  ... when != I
- (&DAT_000ace27)[I] = 0;
+ UW_REC_AT(I)->uv[7] = C;

@arena_clear_ace24@
expression I;
@@
- (&DAT_000ace24)[I] = 0;
  ... when != I
- (&DAT_000ace25)[I] = 0;
  ... when != I
- (&DAT_000ace26)[I] = 0;
  ... when != I
- (&DAT_000ace27)[I] = 0;
+ UW_REC_AT(I)->uv[7] = 0;

@arena_zero_ace30 disable drop_cast@
expression I;
identifier V;
typedef byte;
@@
- (&DAT_000ace30)[I] = V;
  ... when != I
      when != V
- (&DAT_000ace31)[I] = 0;
  ... when != I
- (&DAT_000ace32)[I] = 0;
  ... when != I
- (&DAT_000ace33)[I] = 0;
+ UW_REC_AT(I)->tex[0] = (byte)V;

@arena_const_ace30@
expression I;
constant C;
@@
- (&DAT_000ace30)[I] = C;
  ... when != I
- (&DAT_000ace31)[I] = 0;
  ... when != I
- (&DAT_000ace32)[I] = 0;
  ... when != I
- (&DAT_000ace33)[I] = 0;
+ UW_REC_AT(I)->tex[0] = C;

@arena_clear_ace30@
expression I;
@@
- (&DAT_000ace30)[I] = 0;
  ... when != I
- (&DAT_000ace31)[I] = 0;
  ... when != I
- (&DAT_000ace32)[I] = 0;
  ... when != I
- (&DAT_000ace33)[I] = 0;
+ UW_REC_AT(I)->tex[0] = 0;

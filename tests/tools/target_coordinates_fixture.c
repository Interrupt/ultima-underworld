#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][40];
static uw_monster_type_props_t properties[2];
uw_monster_type_props_t g_monster_type_props[64];
uw_object_type_props_t g_object_type_props[512];
uw_mobile_object_t *DAT_0010190c;
uw_monster_type_props_t *DAT_00101404;
char *DAT_00101400;
byte DAT_00101918, DAT_001013f8;
char DAT_00101408, DAT_00101410;
byte DAT_00101420;
ushort DAT_00101910, DAT_0010141c, DAT_00101908, DAT_00101418, DAT_00101900;
short DAT_00101444, DAT_00101448;
uint DAT_00101728;
short DAT_00201b68;
static char player[128];
char *DAT_00086df8 = player;
static unsigned seed, mode, mutation, function, reference, calls[8], coverage[2][8];
static uint64_t events;
static int captured_z_delta;
static short resolved_slot;
static short has_target;
static int target_arg;
static byte outputs[2];
static uw_mobile_object_t *object(unsigned n) { return (uw_mobile_object_t *)(records[n] + 4); }
static void event(int value) { events = events * 31 + (uint)value; }
static void observe(unsigned kind)
{
    ++calls[kind]; ++coverage[mutation][kind]; event(kind);
    for (unsigned i=0;i<sizeof records;i++) event(((byte *)records)[i]);
    for (unsigned i=0;i<sizeof properties;i++) event(((byte *)properties)[i]);
    event(DAT_0010190c == object(1)); event(DAT_00101400 == (char *)object(1));
    event(DAT_00101404 == &properties[1]); event(DAT_00101900); event(DAT_00101728);
}
static void change(unsigned kind)
{
    if (!mutation) return;
    DAT_0010190c = object(DAT_0010190c == object(0));
    DAT_00101400 = (char *)object(DAT_00101400 == (char *)object(0));
    DAT_00101404 = &properties[DAT_00101404 == &properties[0]];
    DAT_0010190c->hdr.position_word ^= 0xa555;
    DAT_0010190c->hdr.type_flags ^= 0xc1a5;
    DAT_0010190c->goal_word ^= 0x5a5a;
    DAT_0010190c->motion_flags ^= 0x55;
    DAT_00101404->spell_flags ^= 0xfe;
    DAT_00101404->dexterity ^= 0xff;
    DAT_00101918 ^= 3; DAT_001013f8 ^= 1;
    if (kind == 4) DAT_00101900 = mode == 8 ? 64 : 1;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    assert(slot >= 0 && slot < 256);
    resolved_slot = slot;
    observe(1); event(slot); change(1);
    if (slot == 0 || (mode == 1 && function == 0)) return NULL;
    return &object(mode == 3 ? (DAT_0010190c == object(1)) : 1)->hdr;
}
int converted_refresh_npc_target_delta(void);
int reference_refresh_npc_target_delta(void);
int refresh_npc_target_delta(void)
{
    int result = reference ? reference_refresh_npc_target_delta() : converted_refresh_npc_target_delta();
    observe(2); event(result); change(2);
    return result;
}
int integer_sqrt(int value)
{
    captured_z_delta = ((uw_object_hdr_t *)DAT_00101400)->zpos - DAT_0010190c->hdr.zpos;
    observe(3); event(value); change(3);
    static const int results[8] = {0,1,2,15,32767,32768,65535,65536};
    return results[mode & 7];
}
divmod_result ordint_divmod(int divisor, int dividend)
{
    if (!calls[7]) assert(dividend == captured_z_delta * 4);
    else { assert(divisor == has_target); assert(dividend >= 0 && dividend <= 65535*3); }
    assert(divisor != 0); observe(7); event(divisor); event(dividend); change(7);
    return (divmod_result){dividend / divisor, dividend % divisor};
}
byte tile_is_no_magic(int x, int y)
{
    assert(x == DAT_00101918 && y == DAT_001013f8);
    observe(4); event(x); event(y); change(4);
    return mode == 7 || (mode == 8 && calls[4] == 2);
}
int check_fine_line_of_sight(uint x, uint y, uint z, short tx, short ty, short tz)
{
    uw_object_hdr_t *target = (uw_object_hdr_t *)DAT_00101400;
    assert(x == DAT_00101910 && y == DAT_0010141c);
    assert(tx == DAT_00101908 && ty == DAT_00101418);
    assert(z == (byte)g_object_type_props[DAT_0010190c->hdr.object_id].height + DAT_0010190c->hdr.zpos);
    assert(tz == (byte)g_object_type_props[target->object_id].height + target->zpos);
    observe(5); event(x); event(y); event(z); event(tx); event(ty); event(tz); change(5);
    return mode == 6 ? 0 : mode == 14 ? -1 : 65536;
}
int check_npc_target_alignment(int has)
{
    assert(has == 1); observe(6); event(has); change(6); return mode == 9 ? 0 : 1;
}
long ce_rand(void)
{
    observe(0); change(0);
    return mode == 10 ? 127 : mode == 11 ? 191 : mode == 14 ? -1 : mode == 15 ? 10 : 0;
}
int compute_movement_heading(int dx, int dy)
{
    /* Reuse service 2: only refresh or wander can call it in one execution. */
    observe(2); event(dx); event(dy); change(2);
    return mode == 14 ? -128 : mode == 15 ? 127 :
        (DAT_0010190c->hdr.heading + (mode == 4 ? 1 : mode == 5 ? 7 : 0)) & 7;
}
#include "target_coordinates_functions.c"

struct result {
    byte records[sizeof records], properties[sizeof properties], player[sizeof player], outputs[2];
    unsigned calls[8]; uint64_t events;
    int value, npc, target, props;
    uint state[16];
};
static void init(void)
{
    for (unsigned i=0;i<sizeof records;i++) ((byte *)records)[i] = seed * (i+1) + i*37;
    for (unsigned i=0;i<sizeof properties;i++) ((byte *)properties)[i] = seed + i*53;
    memset(player,0,sizeof player);
    for (unsigned i=0;i<2;i++) {
        object(i)->hdr.type_flags = seed ^ (i*0x5555);
        object(i)->hdr.position_word = seed ^ (i*0xa5a5);
        object(i)->tile_word = seed ^ (i*0x5a5a);
        object(i)->hit_points = mode == 2 && function == 0 ? 0 : (seed & 255) | 1;
        object(i)->npc_gtarg = (seed & 255) | (function == 1 ? 1 : 0);
        properties[i].awareness_ranges = mode == 1 ? 0xff : mode == 13 ? 0x44 : 0xf0;
        properties[i].spell_flags = mode == 10 ? 2 : 0xff;
        properties[i].dexterity = mode == 11 ? 0 : 0xff;
        properties[i].race_flags = 0x13;
    }
    DAT_0010190c = object(0); DAT_00101400 = (char *)object(1); DAT_00101404 = &properties[0];
    if (mode == 3) DAT_00101400 = (char *)object(0);
    DAT_00101918 = (seed >> 10) & 63; DAT_001013f8 = (seed >> 4) & 63;
    DAT_00101408 = DAT_00101918 + (mode == 12 ? 30 : mode == 1 ? 0 : 1);
    DAT_00101410 = DAT_001013f8;
    DAT_00101910 = DAT_00101918*8 + (seed & 7); DAT_0010141c = DAT_001013f8*8 + ((seed >> 3)&7);
    DAT_00101908 = (byte)DAT_00101408*8; DAT_00101418 = (byte)DAT_00101410*8;
    DAT_00101420 = seed; DAT_00101444 = seed; DAT_00101448 = seed ^ 0x55aa;
    DAT_00101900 = mode == 12 ? 64 : mode == 13 ? 16 : (seed & 15);
    DAT_00101728 = seed * 3; DAT_00201b68 = mode == 15 ? 7 : 1;
    player[0x60] = mode == 15 && (seed & 1) ? 0x20 : 0;
    has_target = mode == 2 ? 0 : mode == 3 ? -1 : (short)(seed | 1);
    target_arg = mode & 1;
    memset(calls,0,sizeof calls); events=0; outputs[0]=0xa5; outputs[1]=0x5a;
}
static struct result run(unsigned original)
{
    reference=original; init();
    uint initial_delta[] = {(byte)DAT_00101408,(byte)DAT_00101410,DAT_00101420,
        DAT_00101908,DAT_00101418,(ushort)DAT_00101444,(ushort)DAT_00101448,DAT_00101900,DAT_00101728};
    struct result r={0};
    if (function == 0) {
        r.value = original ? reference_refresh_npc_target_delta() : converted_refresh_npc_target_delta();
        if (r.value) {
            uw_mobile_object_t *t = (uw_mobile_object_t *)DAT_00101400;
            assert(DAT_00101408 == t->tile_x && DAT_00101410 == t->tile_y);
            assert(DAT_00101420 == t->hdr.zpos / 8);
            assert(DAT_00101908 == t->tile_x*8 + t->hdr.xpos);
            assert(DAT_00101418 == t->tile_y*8 + t->hdr.ypos);
            assert(DAT_00101444 == (short)(DAT_00101908-DAT_00101910));
            assert(DAT_00101448 == (short)(DAT_00101418-DAT_0010141c));
            int dx = DAT_00101908-DAT_00101910, dy=DAT_00101418-DAT_0010141c;
            assert(DAT_00101728 == (uint)(dx*dx+dy*dy));
            dx=t->tile_x-DAT_00101918; dy=t->tile_y-DAT_001013f8;
            assert(DAT_00101900 == (ushort)(dx*dx+dy*dy));
        } else {
            assert(mode == 1 || mode == 2 || resolved_slot == 0);
            uint unchanged[] = {(byte)DAT_00101408,(byte)DAT_00101410,DAT_00101420,
                DAT_00101908,DAT_00101418,(ushort)DAT_00101444,(ushort)DAT_00101448,DAT_00101900,DAT_00101728};
            assert(!memcmp(initial_delta,unchanged,sizeof unchanged));
        }
    } else if (function == 1) {
        r.value = original ? reference_compute_vertical_aim_offset(has_target,target_arg) : compute_vertical_aim_offset(has_target,target_arg);
        assert(calls[1] == 1 && calls[2] == 1 && calls[3] == 1);
    } else if (function == 2) {
        r.value = original ? reference_detect_npc_wander_proximity(outputs,outputs+1) : detect_npc_wander_proximity(outputs,outputs+1);
    } else if (function == 3) {
        r.value = original ? reference_try_npc_special_ability_ranged() : try_npc_special_ability_ranged();
    } else {
        r.value = original ? reference_try_npc_special_ability_alt() : try_npc_special_ability_alt();
    }
    memcpy(r.records,records,sizeof records); memcpy(r.properties,properties,sizeof properties);
    memcpy(r.player,player,sizeof player); memcpy(r.outputs,outputs,2); memcpy(r.calls,calls,sizeof calls);
    r.events=events; r.npc=DAT_0010190c==object(1); r.target=DAT_00101400 ? (DAT_00101400==(char *)object(1) ? 2 : 1) : 0;
    r.props=DAT_00101404==&properties[1];
    uint state[] = {DAT_00101918,DAT_001013f8,(byte)DAT_00101408,(byte)DAT_00101410,DAT_00101420,
        DAT_00101910,DAT_0010141c,DAT_00101908,DAT_00101418,DAT_00101900,(ushort)DAT_00101444,
        (ushort)DAT_00101448,DAT_00101728,(ushort)DAT_00201b68,(ushort)has_target,(uint)target_arg};
    memcpy(r.state,state,sizeof state); return r;
}
int main(void)
{
    for (unsigned i=0;i<512;i++) g_object_type_props[i].height = i*13 + (i>>8)*7;
    for (unsigned i=0;i<64;i++) g_monster_type_props[i].detection_ranges = i*37 + 0x11;
    unsigned total=0;
    for (function=0;function<5;function++) for (mutation=0;mutation<2;mutation++)
      for (mode=0;mode<16;mode++) for (seed=0;seed<65536;seed++) {
        struct result expected=run(1), actual=run(0);
        if (memcmp(&expected,&actual,sizeof expected)) {
            fprintf(stderr,"target mismatch: function %u mode %u mutation %u seed %u\n",function,mode,mutation,seed); return 1;
        }
        ++total;
      }
    for (unsigned m=0;m<2;m++) for (unsigned k=0;k<8;k++) assert(coverage[m][k]);
    printf("%u tracked-target cases preserve shared fields, height snapshots, sight arguments and callbacks\n",total);
}

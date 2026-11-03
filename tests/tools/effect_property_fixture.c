#include "src/headers/scheduler.h"
#include <assert.h>
#include <limits.h>

static _Alignas(8) byte records[2][40];
static char queues[2][24];
static byte source_bytes[8], *source_arg;
static uw_object_hdr_t *spawned, *resolved;
char *g_scheduler_table;
uw_mobile_object_t *g_player_object;
short DAT_0010144c, DAT_00101454;
char DAT_00101928;
static int DAT_002508fc;
static unsigned seed, mode, mutation, function, calls[8], coverage[2][8];
static uint64_t events;
static int type_arg, tile_x, tile_y, elapsed_arg, expected_catalog;
static short expected_height;
static unsigned prime_base, prime_z, before_z_write, pre_delay_type, pre_delay_owner;
static char expected_queues[2][24];
static int expected_dirty;
static uw_object_hdr_t *object(unsigned n) { return (uw_object_hdr_t *)(records[n]+4); }
static void event(int value) { events=events*31+(uint)value; }
static void observe(unsigned k)
{
    ++calls[k]; ++coverage[mutation][k]; event(k);
    for (unsigned i=0;i<sizeof records;i++) event(((byte *)records)[i]);
    for (unsigned i=0;i<sizeof queues;i++) event(((byte *)queues)[i]);
    for (unsigned i=0;i<sizeof source_bytes;i++) event(source_bytes[i]);
    event(g_scheduler_table==queues[1]); event((ushort)DAT_0010144c); event((ushort)DAT_00101454);
    event(DAT_00101928); event(DAT_002508fc);
}
static void change(unsigned k)
{
    if (!mutation) return;
    for (unsigned i=0;i<2;i++) {
        object(i)->type_flags^=0xa555; object(i)->position_word^=0x5aaa;
        object(i)->link_word^=0x3333;
    }
    g_scheduler_table=queues[1]; queues[1][(k*3)%24]^=0x55;
    DAT_0010144c^=0x55; DAT_00101454^=0xaa; DAT_00101928^=0x55;
    source_bytes[0]^=0xaa; g_player_object=(uw_mobile_object_t *)object(k&1);
}
uw_object_hdr_t *spawn_new_object(uint type,int region)
{
    assert(region==0);
    if (function==0) assert(type==(uint)type_arg);
    else assert(type>=0x152 && type<=0x156);
    observe(0); event(type); change(0);
    spawned=object(mode==3 ? 0 : 1);
    prime_base=(*source_arg>>4)*8; before_z_write=spawned->position_word;
    return spawned;
}
long ce_rand(void)
{
    observe(1); change(1);
    switch(mode&7) {
      case 0:return 0; case 1:return -1; case 2:return INT_MIN; case 3:return INT_MAX;
      case 4:return 65536; case 5:return -65536;
      default:return seed*17 + calls[1]*31;
    }
}
divmod_result ordint_divmod(int divisor,int dividend)
{
    assert(function==0 && divisor==(int)(128-prime_base));
    observe(2); event(divisor); event(dividend); change(2);
    int rem=dividend%divisor; prime_z=(prime_base+(char)rem)&127;
    before_z_write=spawned->position_word;
    return (divmod_result){dividend/divisor,rem};
}
int place_object_in_world(uint x,uint y,int z,void *obj,short radius,int skip)
{
    assert(function==1 && obj==spawned && x==(uint)(tile_x*8+3) && y==(uint)(tile_y*8+3));
    assert(z==110 && radius==0 && skip==0);
    assert(spawned->position_word==((before_z_write&0xff80)|110));
    observe(3); event(x); event(y); event(z); change(3); return mode==6 ? 0 : -1;
}
int object_ptr_in_arena(const uw_object_hdr_t *obj)
{
    assert(obj==spawned); observe(4); change(4); return mode==7 ? 0 : 65536;
}
uw_object_hdr_t *resolve_object_link(ushort *p)
{
    assert((void *)p==(void *)(queues[0]+(mode&3)*6));
    observe(5); change(5); resolved=object(seed&1); return mode==0 ? NULL : resolved;
}
int encode_object_slot_index(const uw_object_hdr_t *obj)
{
    assert(obj==resolved);
    unsigned link_byte=(byte)obj->link_word;
    expected_catalog=(link_byte&0x30)+(link_byte&15)+0x140;
    expected_height=(short)(obj->zpos-((link_byte&7)==6 ? 0 : 24));
    observe(6); change(6); return (short)(seed^0xaaaa);
}
int check_object_placement_clearance(short type,short ignore,short x,short y,short z,int mode_arg,byte limit)
{
    assert(type==expected_catalog && ignore==(short)(seed^0xaaaa));
    assert(x==(short)(resolved->xpos+DAT_0010144c*8) && y==(short)(resolved->ypos+DAT_00101454*8));
    assert(z==expected_height && mode_arg==1 && limit==8);
    observe(7); event(type); event(ignore); event(x); event(y); event(z); change(7);
    pre_delay_type=resolved->type_flags;
    pre_delay_owner=resolved->owner;
    return mode==1 || mode==2 ? mode : 0;
}
int scheduler_get_delay(void *obj)
{
    assert(obj==resolved);
    unsigned group=(unsigned)((int64_t)((pre_delay_type>>9)&7)-elapsed_arg-1)&15;
    assert(resolved->flags_res==(group&7) && resolved->enchanted==(group>>3));
    assert((resolved->type_flags&0xe1ff)==(pre_delay_type&0xe1ff));
    /* Service 2 is division in spell priming, delay here. */
    observe(2); change(2);
    static const int delays[8]={0,1,-1,32767,32768,65535,65536,-65536};
    int delay=delays[mode&7];
    memcpy(expected_queues,queues,sizeof queues); expected_dirty=DAT_002508fc;
    if ((short)delay>=0) {
        unsigned priority=(((pre_delay_type&0x1c0)==0x140 && (pre_delay_type&7)==6) ||
            ((pre_delay_type&0x1c0)==0x1c0 && (pre_delay_owner&7)==6)) ? 4 : 5;
        int next=(int)priority-delay+1;
        unsigned queue=g_scheduler_table==queues[1], offset=(mode&3)*6+2;
        expected_queues[queue][offset]=(char)next;
        expected_queues[queue][offset+1]=(char)((uint)next>>8);
        expected_dirty=1;
    }
    return delay;
}
#include "effect_property_functions.c"
struct result {
    byte records[sizeof records],queues[sizeof queues],source[sizeof source_bytes];
    unsigned calls[8]; uint64_t events; uint state[7]; int value,returned;
};
static struct result run(unsigned reference)
{
    for (unsigned i=0;i<sizeof records;i++) ((byte *)records)[i]=seed*(i+1)+i*37;
    for (unsigned i=0;i<sizeof queues;i++) ((byte *)queues)[i]=seed*13+i*29;
    for (unsigned i=0;i<sizeof source_bytes;i++) source_bytes[i]=seed+i*53;
    for (unsigned i=0;i<2;i++) {
        object(i)->type_flags=seed^(i*0xa5a5); object(i)->position_word=seed^(i*0x5555);
        object(i)->link_word=seed^(i*0x5a5a);
        if (mode==4 || mode==12) object(i)->object_id=0x146;
        if (mode==5 || mode==13) {object(i)->object_id=0x1c0; object(i)->owner=6;}
    }
    source_arg=mode==3 || mode==11 ? (byte *)object(0) : source_bytes;
    type_arg= mode==15 ? -1 : seed;
    tile_x=(short)seed; tile_y=mode==15 ? 65535 : -(short)seed;
    static const int elapsed[16]={0,1,-1,7,8,15,16,32767,-32768,65535,65536,-65536,4194303,-4194304,1048575,-1048576};
    elapsed_arg=elapsed[mode];
    DAT_0010144c=seed; DAT_00101454=seed^0xa5a5; DAT_00101928=seed;
    DAT_002508fc=seed&1; g_scheduler_table=queues[0]; g_player_object=(uw_mobile_object_t *)object(0);
    memset(calls,0,sizeof calls); events=0; spawned=NULL; resolved=NULL;
    struct result r={0};
    if (function==0) {
        void *p=reference ? reference_spawn_and_prime_spell_effect_object(type_arg,source_arg) : spawn_and_prime_spell_effect_object(type_arg,source_arg);
        assert(p==spawned); r.returned=spawned==object(1);
        assert(spawned->position_word==((before_z_write&0xff80)|prime_z));
        assert(calls[0]==1 && calls[1]==1 && calls[2]==1);
    } else if (function==1) {
        r.value=reference ? reference_spawn_random_variant_object_at_tile(tile_x,tile_y) : spawn_random_variant_object_at_tile(tile_x,tile_y);
        assert(r.value==1 && calls[0]==1 && calls[3]==1);
        assert(calls[1]==((mode==6 || mode==7) ? 1 : 5));
    } else {
        r.value=reference ? reference_scheduler_advance_effect(mode&3,elapsed_arg) : scheduler_advance_effect(mode&3,elapsed_arg);
        assert(calls[5]==1); assert(r.value==(mode==1 || mode==2));
        assert(calls[2]==(mode>2));
        if (calls[2]) {
            assert(!memcmp(queues,expected_queues,sizeof queues));
            assert(DAT_002508fc==expected_dirty);
        }
    }
    memcpy(r.records,records,sizeof records); memcpy(r.queues,queues,sizeof queues); memcpy(r.source,source_bytes,sizeof source_bytes);
    memcpy(r.calls,calls,sizeof calls); r.events=events;
    uint state[]={(ushort)DAT_0010144c,(ushort)DAT_00101454,(byte)DAT_00101928,(uint)DAT_002508fc,
        g_scheduler_table==queues[1],g_player_object==(uw_mobile_object_t *)object(1),spawned==object(1)};
    memcpy(r.state,state,sizeof state); return r;
}
int main(void)
{
    unsigned total=0;
    for (function=0;function<3;function++) for (mutation=0;mutation<2;mutation++)
      for (mode=0;mode<16;mode++) for (seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if (memcmp(&expected,&actual,sizeof expected)) {
            fprintf(stderr,"effect mismatch: function %u mutation %u mode %u seed %u\n",function,mutation,mode,seed);return 1;
        }
        ++total;
      }
    for (unsigned m=0;m<2;m++) for (unsigned k=0;k<8;k++) assert(coverage[m][k]);
    printf("%u effect cases preserve placement, four-bit scheduler arithmetic and callback captures\n",total);
}

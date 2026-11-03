#include "src/headers/uw.h"
#include "src/headers/options.h"
#include <assert.h>
#include <stdarg.h>

static _Alignas(8) byte records[5][40];
uw_mobile_object_t *DAT_0010190c, *g_player_object;
undefined4 DAT_00101924,DAT_00101560,DAT_001013fc,DAT_00101734_backing[1];
ushort DAT_00101414;
char *DAT_00101904;
undefined1 DAT_00101424,DAT_00101428_backing[4],DAT_00204880_backing[128];
undefined2 DAT_002048c0_backing[64];
#define DAT_002048c2 (*(undefined1 *)((char *)DAT_002048c0_backing+2))
#define _DAT_002048c2 (*(uint *)&DAT_002048c2)
static short DAT_002048d0;
static ushort DAT_002048c6,DAT_002048c8,collision_bits;
struct uw_options g_opts;
static unsigned seed,mode,mutation,function,calls[9],coverage[2][9];
static uint64_t events;
static uw_object_hdr_t *world_object,*linked_object;
static short *live_x,*live_y;
static ushort expected_status, post_schedule_goal;
static uw_mobile_object_t *npc(unsigned n) { return (uw_mobile_object_t *)(records[n]+4); }
static uw_object_hdr_t *object(unsigned n) { return &npc(n)->hdr; }
static unsigned index_of(const void *p) { for (unsigned i=0;i<5;i++) if (p==object(i))return i; assert(0);return 0; }
static void event(int v) { events=events*31+(uint)v; }
static void observe(unsigned k)
{
    ++calls[k];++coverage[mutation][k];event(k);
    for (unsigned i=0;i<sizeof records;i++) event(((byte *)records)[i]);
    event(DAT_0010190c==npc(1));event(g_player_object==npc(1));event(DAT_00101924);
    event(DAT_00101734);event(DAT_00101560);event(DAT_001013fc);
    if (live_x) {event(*live_x);event(*live_y);}
}
static void change(unsigned k)
{
    if (!mutation)return;
    DAT_0010190c=npc(DAT_0010190c==npc(0));g_player_object=npc(g_player_object==npc(0));
    DAT_0010190c->goal_word^=0xa555;DAT_0010190c->hdr.position_word^=0x5aaa;
    DAT_0010190c->attack_pitch^=0x55;
    DAT_00101924^=1;DAT_00101734^=1;
    if (live_x) {*live_x^=3;*live_y^=5;}
    if (linked_object && (k==5 || k==6)) {
        byte *p=(byte *)linked_object;p[13]^=0x5a;p[14]^=0xa5;
    }
}
int spawn_scheduled_effect_object(ushort *p,int group,int delay,byte off,short heading,short x,short y)
{
    assert((void *)p==(void *)DAT_0010190c && group==6 && delay==3 && off==0 && heading==0);
    assert(x==(char)(DAT_002048c0>>8) && y==(char)((ushort)_DAT_002048c2>>8));
    observe(0);event(x);event(y);change(0);post_schedule_goal=DAT_0010190c->goal_word;return -1;
}
void *find_nearby_door_in_candidates(byte *dx,byte *dy)
{
    assert(dx==&DAT_00101424 && dy==&DAT_00101428);observe(1);change(1);
    *dx=seed;*dy=seed>>8;return mode&1 ? NULL : object(2);
}
void *get_first_nearby_candidate_object(void) {observe(2);change(2);return object(3);}
static int capture_printf(FILE *stream,const char *format,...)
{
    assert(stream==stderr);
    assert(!strcmp(format,"[playerpos:%s] fine=(%d,%d)=world(%g,%g) obj_bytes tile=(%d,%d)\n"));
    va_list a;va_start(a,format);
    const char *label=va_arg(a,const char *);int x=va_arg(a,int),y=va_arg(a,int);
    double wx=va_arg(a,double),wy=va_arg(a,double);int tx=va_arg(a,int),ty=va_arg(a,int);va_end(a);
    assert(!strcmp(label,"audit") && x==DAT_00204880 && y==DAT_00204882);
    assert(wx==x/256.0 && wy==y/256.0);
    ushort tile;memcpy(&tile,(byte *)g_player_object+22,2);
    assert(tx==(tile>>10) && ty==((tile>>4)&63));
    observe(3);event(x);event(y);event(tx);event(ty);change(3);return 0;
}
uw_object_hdr_t *find_object_in_world(int cls,int sub,short quality,short *x,short *y)
{
    assert(cls==6 && sub==0 && quality==7);
    observe(4);event(*x);event(*y);live_x=x;live_y=y;
    unsigned n=calls[4]-1;
    if (n==3)return NULL;
    *x=(seed&63)+n;*y=(seed>>6)&63;world_object=object(n);return world_object;
}
uw_object_hdr_t *resolve_object_link(ushort *p)
{
    assert(p==&world_object->link_word);observe(5);event(index_of(world_object));
    linked_object=object(3+(calls[5]&1));change(5);return linked_object;
}
int object_ptr_in_arena(const uw_object_hdr_t *p)
{
    assert(p==linked_object);observe(6);change(6);
    memcpy(&expected_status,(byte *)linked_object+13,2);expected_status|=0x100;
    return mode==6 ? 0 : 65536;
}
int is_out_of_player_range(int present,short x,short y)
{
    assert(present==(int)(short)(seed^0xa5a5) && x==*live_x && y==*live_y);
    ushort actual;memcpy(&actual,(byte *)linked_object+13,2);assert(actual==expected_status);
    observe(7);event(present);event(x);event(y);change(7);return mode==7 ? 0 : -1;
}
int dispatch_trap_type_effect(ushort *p,int x,int y)
{
    assert((void *)p==world_object && x==*live_x && y==*live_y);
    observe(8);event(index_of(p));event(x);event(y);change(8);return 65536;
}
#define fprintf capture_printf
#include "consumer_view_functions.c"
#undef fprintf
struct result {
    byte records[sizeof records],candidates[5];ushort snapshot[64];
    unsigned calls[9];uint64_t events;uint globals[12];int value;
};
static struct result run(unsigned reference)
{
    for (unsigned i=0;i<sizeof records;i++) ((byte *)records)[i]=seed*(i+1)+i*37;
    for (unsigned i=0;i<5;i++) {
        npc(i)->goal_word=seed^(i*0xa5a5);npc(i)->tile_word=seed^(i*0x5555);object(i)->type_flags=seed^(i*0x5a5a);
        if (mode==1 || mode==6 || mode==7 || mode==8) {object(i)->flags_res=0;object(i)->enchanted=0;}
        if (mode==2) {object(i)->flags_res=0;object(i)->enchanted=1;}
        if (mode==3) {object(i)->flags_res=7;object(i)->enchanted=0;}
    }
    for (unsigned i=0;i<64;i++) DAT_002048c0_backing[i]=seed^(i*0x5353);
    DAT_00204880=(short)seed;DAT_00204882=(short)(seed^0xa5a5);
    DAT_0010190c=npc(0);g_player_object=npc(mode&1);DAT_00101904=(char *)object(4);
    DAT_00101924=mode&1;DAT_00101734=(mode>>1)&1;DAT_00101560=mode&1;DAT_001013fc=(mode>>2)&1;
    DAT_00101414=mode&4 ? seed : 0;DAT_002048d0=mode&8 ? 0 : (short)seed;
    DAT_002048c6=seed;DAT_002048c8=seed^0xaaaa;DAT_00101424=seed;
    for (unsigned i=0;i<4;i++) DAT_00101428_backing[i]=seed+i;
    collision_bits=mode==0 ? 0x10 : mode==1 ? 0x1000 : mode==2 ? 0x400 : mode==3 ? 0x100 : seed;
    g_opts.debug=(mode>>1)&1;events=0;memset(calls,0,sizeof calls);
    live_x=NULL;live_y=NULL;world_object=NULL;linked_object=NULL;
    struct result r={0};
    if (function==0) {
        r.value=reference ? reference_collision_response_default(&collision_bits) : collision_response_default(&collision_bits);
        if (calls[0]) {
            assert(DAT_0010190c->npc_animation_frame==3);
            assert((DAT_0010190c->goal_word&0xfff)==(post_schedule_goal&0xfff));
            assert((DAT_0010190c->attack_pitch&6)==0 && (DAT_0010190c->attack_pitch&1));
        }
    } else if (function==1) {
        if (reference)reference_debug_print_player_position("audit");else debug_print_player_position("audit");
        assert(calls[3]==(unsigned)g_opts.debug);
    } else {
        if (reference)reference_process_nearby_background_traps((short)(seed^0xa5a5));else process_nearby_background_traps((short)(seed^0xa5a5));
        assert(calls[4]==4);assert(calls[8]<=calls[7] && calls[7]<=calls[6] && calls[6]==calls[5]);
    }
    live_x=NULL;live_y=NULL;
    memcpy(r.records,records,sizeof records);memcpy(r.snapshot,DAT_002048c0_backing,sizeof r.snapshot);
    r.candidates[0]=DAT_00101424;memcpy(r.candidates+1,DAT_00101428_backing,4);
    memcpy(r.calls,calls,sizeof calls);r.events=events;
    uint globals[]={DAT_00101924,DAT_00101734,DAT_00101560,DAT_001013fc,DAT_0010190c==npc(1),g_player_object==npc(1),
        index_of(DAT_00101904),(ushort)DAT_002048d0,DAT_002048c6,DAT_002048c8,DAT_00101414,collision_bits};
    memcpy(r.globals,globals,sizeof globals);return r;
}
int main(void)
{
    unsigned total=0;
    for (function=0;function<3;function++)for (mutation=0;mutation<2;mutation++)
      for (mode=0;mode<16;mode++)for (seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if (memcmp(&expected,&actual,sizeof expected)) {
            fprintf(stderr,"consumer mismatch: function %u mutation %u mode %u seed %u\n",function,mutation,mode,seed);return 1;
        }
        total++;
      }
    for (unsigned m=0;m<2;m++)for (unsigned k=0;k<9;k++)assert(coverage[m][k]);
    printf("%u consumer cases preserve animation, coordinates, trap gates and callback state\n",total);
}

#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(8) byte records[4][40],alternate[24],tile[4];
uw_object_type_props_t g_object_type_props[512];
byte *DAT_00202c6c;
undefined1 DAT_00202c38_backing[1536];
unsigned char DAT_00086998_backing[16];
short DAT_0010144c,DAT_00101454;
static int DAT_002046d4,DAT_002046ec;
static unsigned seed,mode,scenario,force_flag,rng,builds,rand_calls,calls[10],coverage[2][10],scenarios[16];
static unsigned last_slot,local_ready,alternate_ready,last_kind,changed_flag_index;
static byte *local_pointer;
static uint64_t events;
static short tile_x,tile_y,restore_x,restore_y;
static unsigned pending_offset,pending_value;
static int pending_byte,pending_restore;
static uw_object_hdr_t *object(unsigned n){return (uw_object_hdr_t *)(records[n]+4);}
static unsigned read16(const byte *p){return p[0]|p[1]*256u;}
static void write16(byte *p,unsigned v){p[0]=v;p[1]=v>>8;}
static void event(int v){events=events*31+(uint)v;}
static void verify_pending(void){
    if(pending_byte){assert(((byte *)object(1))[pending_offset]==pending_value);pending_byte=0;}
    if(pending_restore){assert(DAT_0010144c==restore_x&&DAT_00101454==restore_y);pending_restore=0;}
}
static void remember_kind(void){
    last_kind=DAT_00202c6c==alternate;
    if(!last_kind)assert(DAT_00202c6c==local_pointer);
}
static void observe(unsigned k){
    verify_pending();calls[k]++;coverage[mode&1][k]++;event(k);
    for(unsigned j=0;j<sizeof records;j++)event(((byte *)records)[j]);
    for(unsigned j=0;j<16;j++)event(DAT_00086998_backing[j]);
    event(DAT_0010144c);event(DAT_00101454);event(DAT_002046d4);event(DAT_002046ec);
    remember_kind();event(last_kind);
    /* Never inspect an uninitialized scratch input or a dead stack buffer. */
    if((last_kind&&alternate_ready)||(!last_kind&&local_ready))
        for(unsigned j=0;j<24;j++)event(DAT_00202c6c[j]);
}
static void change(unsigned k){
    if(mode&1){
        for(unsigned n=0;n<4;n++)for(unsigned j=0;j<27;j++)records[n][j+4]^=(byte)(k*31+n*7+j*17+1);
        DAT_0010144c=(short)(seed^(k*0x1111));DAT_00101454=(short)((seed*3)^(k*0x1357));
    }
    if(k<=4){restore_x=DAT_0010144c;restore_y=DAT_00101454;}
    remember_kind();
}
int encode_object_slot_index(const uw_object_hdr_t *p){
    assert(p==object(0));if(!local_pointer)local_pointer=DAT_00202c6c;
    assert(DAT_00202c6c==local_pointer);observe(0);change(0);
    if(scenario==12&&calls[0]==2){changed_flag_index=object(0)->object_id;g_object_type_props[changed_flag_index].flags|=8;}
    last_slot=seed%1023+1;return last_slot;
}
void collision_build_height_field(uint radius){
    assert(radius==DAT_00202c6c[8]);
    const byte *p=(const byte *)object(0);unsigned pos=read16(p+2),id=read16(p)&511;
    assert(read16(DAT_00202c6c)==(unsigned)(tile_x*8+(pos>>13)));
    assert(read16(DAT_00202c6c+2)==(unsigned)(tile_y*8+((pos>>10)&7)));
    assert(read16(DAT_00202c6c+4)==(pos&127));assert(read16(DAT_00202c6c+10)==last_slot);
    assert(radius==g_object_type_props[id].collision_radius&&DAT_00202c6c[9]==g_object_type_props[id].height);
    observe(1);builds++;assert(builds<=2);
    /* Model the real helpers' defined outputs. Unused scratch bytes are fixture
       sentinels and are never read before this initialization. */
    for(unsigned j=6;j<24;j++)if(j<8||j>11)DAT_00202c6c[j]=j*11+seed;
    unsigned floor_flags=scenario==3?0x100:scenario==4?5:(scenario>=5&&scenario<=7)?6:scenario==8?8:0;
    write16(DAT_00202c6c+12,floor_flags);write16(DAT_00202c6c+14,0);
    DAT_00202c6c[16]=(scenario==1||scenario==12||scenario==15)?127:0;
    DAT_00202c6c[20]=DAT_00202c6c[21]=DAT_00202c6c[22]=0;
    if(DAT_00202c6c==alternate)alternate_ready=1;else local_ready=1;
    change(1);
}
void collision_height_envelope(int mode_arg,int collision){
    assert(collision==1);
    int expected_mode=((unsigned)DAT_00202c6c[8]+DAT_00202c6c[16]<read16(DAT_00202c6c+4)||builds>1)?0:1;
    assert(mode_arg==expected_mode);observe(2);event(mode_arg);change(2);
    if(mode&1){if(DAT_00202c6c!=alternate)memcpy(alternate,DAT_00202c6c,24);DAT_00202c6c=alternate;alternate_ready=1;}
    DAT_00202c6c[20]=0;remember_kind();
}
void sort_collision_candidates(void){
    observe(3);change(3);
    unsigned count=(scenario==9||scenario==10||scenario==15)?2:0;
    DAT_00202c6c[20]=count;DAT_00202c6c[21]=scenario==11;DAT_00202c6c[22]=count;
    for(unsigned n=0;n<2;n++){
        byte *row=DAT_00202c38_backing+n*6;
        row[0]=DAT_00202c6c[4]+(scenario==15);row[1]=row[0]+8;
        write16(row+2,((n+2)<<6)|(scenario==9?16:0));row[4]=n;row[5]=0;
    }
}
uw_object_hdr_t *resolve_object_link(ushort *link){
    ptrdiff_t offset=(byte *)link-DAT_00202c38_backing;
    assert(offset==2||offset==8);observe(4);event(offset);change(4);return object(2+(offset==8));
}
int resolve_damage_type_resistance(ushort *p,int damage,uint mask){
    assert((void *)p==object(0)&&damage==1&&mask==8);observe(5);change(5);return scenario==7;
}
void *tilemap_lookup(short x,short y){assert(x==tile_x&&y==tile_y);observe(6);event(x);event(y);change(6);return tile;}
ushort *discard_misplaced_object(void *link,ushort *p,int skip){
    assert(link==tile+2&&(void *)p==object(0)&&skip==0);observe(7);change(7);
    return seed%3==0?NULL:(ushort *)object(seed%3==1?0:3);
}
uw_object_hdr_t *reallocate_object_to_arena(ushort *p){
    assert((void *)p==object(0));assert(DAT_0010144c==tile_x&&DAT_00101454==tile_y);
    observe(8);change(8);pending_restore=1;
    if(scenario==13)DAT_002046d4=1;
    if(scenario==14&&!force_flag){assert(!DAT_002046d4);return NULL;}
    if(DAT_002046d4){pending_byte=1;pending_offset=19;pending_value=(((byte *)object(1))[19]&128)|3;}
    return object(1);
}
long ce_rand(void){
    observe(9);change(9);rng=rng*1664525u+1013904223u;rand_calls++;
    byte *p=(byte *)object(1);unsigned stage=rand_calls-(DAT_002046d4!=0);
    pending_byte=1;
    if(DAT_002046d4&&rand_calls==1){pending_offset=9;pending_value=(byte)((char)p[9]+((int)rng%9+12)*16);}
    else if(stage==1){pending_offset=19;pending_value=(p[19]&128)|(((byte)rng&3)+1);}
    else {assert(stage==2);pending_offset=20;pending_value=(p[20]&7)|((((byte)rng&3)+14)<<3);}
    return (long)(int)rng;
}
#include "settle_native_functions.c"
static void setup(unsigned s,unsigned m){
    seed=s;mode=m;scenario=m>>1;force_flag=seed&1;rng=seed;builds=rand_calls=0;events=0;
    pending_byte=pending_restore=0;local_pointer=NULL;local_ready=0;alternate_ready=1;last_kind=0;changed_flag_index=512;
    memset(calls,0,sizeof calls);memset(DAT_00202c38_backing,0,sizeof DAT_00202c38_backing);
    for(unsigned n=0;n<4;n++){
        for(unsigned j=0;j<40;j++)records[n][j]=seed*(j+1)+n*31+j*17;
        object(n)->type_flags=seed^(n*0x1234);object(n)->position_word=seed^(n*0x5a5a);
    }
    for(unsigned j=0;j<24;j++)alternate[j]=seed+j*17;
    for(unsigned j=0;j<16;j++)DAT_00086998_backing[j]=seed+j*19;
    for(unsigned id=0;id<512;id++){
        g_object_type_props[id].flags=scenario==0?10:2;
        g_object_type_props[id].collision_radius=(seed+id)&7;
        g_object_type_props[id].height=((seed+id)>>3)&7;
        g_object_type_props[id].quality_flags=scenario==5&&(id&1)?12:0;
    }
    tile_x=seed&63;tile_y=(seed>>6)&63;DAT_0010144c=(short)seed;DAT_00101454=(short)(seed^0x5a5a);
    restore_x=DAT_0010144c;restore_y=DAT_00101454;DAT_002046d4=DAT_002046ec=-1;DAT_00202c6c=NULL;
}
static uw_object_hdr_t *execute(int reference){
    uw_object_hdr_t *result=reference?reference_settle_dropped_object(object(0),tile_x,tile_y,force_flag):settle_dropped_object(object(0),tile_x,tile_y,force_flag);
    verify_pending();assert(result==NULL||result==object(0)||result==object(1)||result==object(3));return result;
}
int main(void){
    unsigned total=0;
    for(unsigned s=0;s<65536;s++)for(unsigned m=0;m<32;m++){
        setup(s,m);uw_object_hdr_t *actual=execute(0);
        byte saved[sizeof records],alt[24],backing[16],candidates[12];
        memcpy(saved,records,sizeof records);memcpy(alt,alternate,24);memcpy(backing,DAT_00086998_backing,16);memcpy(candidates,DAT_00202c38_backing,12);
        unsigned counts[10];memcpy(counts,calls,sizeof calls);uint64_t hash=events;
        unsigned random=rng,passes=builds,kind=last_kind,changed=changed_flag_index;
        short x=DAT_0010144c,y=DAT_00101454;int d4=DAT_002046d4,ec=DAT_002046ec;
        setup(s,m);assert(execute(1)==actual);assert(memcmp(saved,records,sizeof records)==0&&memcmp(alt,alternate,24)==0);
        assert(memcmp(backing,DAT_00086998_backing,16)==0&&memcmp(candidates,DAT_00202c38_backing,12)==0);
        assert(memcmp(counts,calls,sizeof calls)==0&&hash==events&&random==rng&&passes==builds&&kind==last_kind&&changed==changed_flag_index);
        assert(x==DAT_0010144c&&y==DAT_00101454&&d4==DAT_002046d4&&ec==DAT_002046ec);
        scenarios[m>>1]++;total++;
    }
    for(unsigned mutation=0;mutation<2;mutation++)for(unsigned k=0;k<10;k++)assert(coverage[mutation][k]>0);
    for(unsigned k=0;k<16;k++)assert(scenarios[k]>0);
    printf("%u complete settling comparisons, callback-time scratch observations and independent field checks passed\n",total);
}

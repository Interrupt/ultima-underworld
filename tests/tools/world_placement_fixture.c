#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(8) byte records[2][40],tile[4];
undefined4 DAT_00202c84;
static unsigned seed,mode,which,rng,attempts,calls[11],coverage[2][2][11];
static uint64_t events;
static uint start_x,start_y;
static short wanted_height,last_x,last_y;
static unsigned fallback_low,expected_position,expected_tile;
static int clearance_succeeded;
static uw_object_hdr_t *object(void){return (uw_object_hdr_t *)(records[0]+4);}
static unsigned read16(const byte *p){return p[0]|p[1]*256u;}
static void event(int value){events=events*31+(uint)value;}
static void observe(unsigned k){
    calls[k]++;coverage[mode&1][which][k]++;event(k);
    for(unsigned j=0;j<sizeof records;j++)event(((byte *)records)[j]);
    event(DAT_00202c84);event(rng);event(attempts);
}
static void change(unsigned k){
    if(mode&1){
        for(unsigned n=0;n<2;n++)for(unsigned j=0;j<27;j++)records[n][j+4]^=(byte)(k*29+n*11+j+1);
        DAT_00202c84^=1;
    }
    fallback_low=read16((byte *)object()+2)&1023;
}
long ce_rand(void){observe(0);change(0);rng=rng*1664525u+1013904223u;return (rng>>16)&32767;}
divmod_result ordint_divmod(int d,int n){assert(d>0);observe(1);event(d);event(n);change(1);return (divmod_result){n/d,n%d};}
int encode_object_slot_index(const uw_object_hdr_t *p){assert(p==object());observe(2);change(2);return seed^0x1a5;}
int check_object_placement_clearance(short id,short slot,short x,short y,short height,int check,byte step){
    assert(id==(read16((byte *)object())&511));assert(slot==(short)(seed^0x1a5));assert(height==wanted_height&&check==1&&step==0);
    observe(3);event(id);event(slot);event(x);event(y);event(height);change(3);attempts++;
    unsigned policy=(mode>>1)&3;
    clearance_succeeded=policy==0||(policy==1&&attempts==3);
    if(clearance_succeeded){last_x=x;last_y=y;}
    return clearance_succeeded;
}
void *tilemap_lookup(short x,short y){
    if(clearance_succeeded){assert(x==(last_x>>3)&&y==(last_y>>3));}
    else{
        assert(which==0&&attempts==24);assert(x==((short)start_x>>3)&&y==((short)start_y>>3));
        unsigned pos=read16((byte *)object()+2);
        assert((pos&1023)==fallback_low);
        assert((pos>>13)==(start_x&7)&&((pos>>10)&7)==(start_y&7));
    }
    observe(4);event(x);event(y);change(4);
    if(clearance_succeeded)expected_position=(read16((byte *)object()+2)&0x380)|((byte)wanted_height&127)|((last_x&7)<<13)|((last_y&7)<<10);
    else expected_position=read16((byte *)object()+2);
    return tile;
}
void object_list_append_tail(ushort *link,uw_object_hdr_t *p){
    assert(link==(ushort *)(tile+2)&&p==object());assert(read16((byte *)p+2)==expected_position);
    observe(5);change(5);
}
int object_ptr_in_arena(const uw_object_hdr_t *p){
    assert(p==object());observe(6);change(6);
    expected_tile=(read16((byte *)p+22)&15)|(((last_x&0x1f8)>>3)<<10)|(((last_y&0x1f8)>>3)<<4);
    return (mode&8)!=0;
}
uw_object_hdr_t *settle_dropped_object(void *p,short x,short y,int flag){
    assert(p==object()&&x==(last_x>>3)&&y==(last_y>>3)&&flag==1);observe(7);change(7);return NULL;
}
int roll_object_destroy_chance(short chance,void *p){assert(chance==10&&p==object());observe(8);change(8);return (mode&8)!=0;}
void unlink_and_free_object(ushort *link,uw_object_hdr_t *p){assert(!link&&p==object());observe(9);change(9);}
void object_list_insert_head(ushort *link,uw_object_hdr_t *p){assert(link==(ushort *)(tile+2)&&p==object());assert(read16((byte *)p+2)==expected_position);observe(10);change(10);}
#include "world_placement_functions.c"
static void setup(unsigned s,unsigned m,unsigned f){
    seed=s;mode=m;which=f;events=0;rng=seed;attempts=0;clearance_succeeded=0;memset(calls,0,sizeof calls);
    for(unsigned n=0;n<2;n++)for(unsigned j=0;j<40;j++)records[n][j]=seed*(j+1)+n*31+j*17;
    object()->type_flags=seed;object()->position_word=seed^0x5a5a;
    start_x=seed&511;start_y=(seed>>7)&511;wanted_height=(short)seed;DAT_00202c84=(seed>>1)&1;
    fallback_low=object()->position_word&1023;expected_tile=0;expected_position=0;
}
static int execute(int reference){
    int result;
    if(which==0)result=reference?reference_place_object_in_world(start_x,start_y,wanted_height,object(),seed&3,seed&1):place_object_in_world(start_x,start_y,wanted_height,object(),seed&3,seed&1);
    else result=reference?reference_find_object_placement((ushort *)object(),start_x,start_y,wanted_height,seed&3):find_object_placement((ushort *)object(),start_x,start_y,wanted_height,seed&3);
    if(clearance_succeeded&&(mode&8))assert(read16((byte *)object()+22)==expected_tile);
    return result;
}
int main(void){
    unsigned total=0;
    for(unsigned s=0;s<65536;s++)for(unsigned m=0;m<16;m++)for(unsigned f=0;f<2;f++){
        setup(s,m,f);int actual=execute(0);byte saved[sizeof records];memcpy(saved,records,sizeof records);
        unsigned counts[11];memcpy(counts,calls,sizeof calls);uint64_t hash=events;
        unsigned random=rng,tries=attempts,flag=DAT_00202c84;
        setup(s,m,f);assert(execute(1)==actual);assert(memcmp(saved,records,sizeof records)==0);
        assert(memcmp(counts,calls,sizeof calls)==0&&hash==events&&random==rng&&tries==attempts&&flag==DAT_00202c84);total++;
    }
    for(unsigned mutation=0;mutation<2;mutation++){
        for(unsigned k=0;k<11;k++)assert(coverage[mutation][0][k]>0);
        for(unsigned k=0;k<8;k++)assert(coverage[mutation][1][k]>0);
    }
    printf("%u complete world-placement comparisons passed\n",total);
}

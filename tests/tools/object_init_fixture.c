#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(8) byte arena[128],tile[4],expected[128];
char *DAT_002046c4=(char *)arena+40;
uw_object_type_props_t g_object_type_props[512];
static unsigned seed,mode,which,offset,selected,calls[2],coverage[2][2],quant_paths[2],burn_paths[3];
static uint asked_type;
static int asked_region;
static uint64_t events;
static uw_object_hdr_t *object(unsigned index){return (uw_object_hdr_t *)(arena+index*40+offset);}
static void write16(byte *p,unsigned value){p[0]=value;p[1]=value>>8;}
static void event(int value){events=events*31+(uint)value;}
static void observe(unsigned k){calls[k]++;coverage[mode&1][which]++;event(k);for(unsigned j=0;j<sizeof arena;j++)event(arena[j]);event(g_object_type_props[asked_type&511].flags);}
static void change(unsigned k){
    if(!(mode&1))return;
    for(unsigned j=0;j<sizeof arena;j++)arena[j]^=(byte)(k*37+j*17+1);
    g_object_type_props[asked_type&511].flags^=0xc0;
}
uw_object_hdr_t *alloc_object_slot(int region){
    assert(which==0&&region==asked_region);observe(0);event(region);change(0);memcpy(expected,arena,sizeof arena);
    if(mode&2)return NULL;
    byte *p=(byte *)object(selected);
    unsigned flags=g_object_type_props[asked_type&511].flags&0xc0;
    unsigned quant=flags==0||flags==0x80;
    quant_paths[quant]++;
    write16(expected+(p-arena),(asked_type&511)|(quant<<15));
    write16(expected+(p-arena)+2,0x6c00);
    write16(expected+(p-arena)+4,0x28);
    write16(expected+(p-arena)+6,quant?0x40:0);
    return (uw_object_hdr_t *)p;
}
ushort *discard_misplaced_object(void *link,ushort *p,int skip){
    assert(which==1&&link==tile+2&&(void *)p==object(selected)&&skip==0);
    assert((char *)p>=DAT_002046c4);observe(1);change(1);memcpy(expected,arena,sizeof arena);
    burn_paths[(mode&2)?1:2]++;return mode&2?NULL:(ushort *)object(2);
}
#include "object_init_functions.c"
static void setup(unsigned s,unsigned m,unsigned f){
    const uint tags[]={0,0x10000,0x80000000,0xffff0000};
    seed=s;mode=m;which=f;events=0;memset(calls,0,sizeof calls);
    offset=which==0?((mode&8)?1:2):((mode&8)?4:0);
    selected=which==0?((mode&4)?2:0):((mode&4)?1:0);
    for(unsigned j=0;j<sizeof arena;j++)arena[j]=seed*(j+1)+j*29;
    for(unsigned j=0;j<3;j++)for(unsigned word_offset=0;word_offset<8;word_offset+=2)write16((byte *)object(j)+word_offset,seed^(word_offset*0x1111));
    asked_type=((seed+mode*17)&511)|tags[(mode>>2)&3];asked_region=(mode&8)!=0;
    g_object_type_props[asked_type&511].flags=(seed>>7)^(mode*29);
    DAT_002046c4=(char *)arena+40;
    memcpy(expected,arena,sizeof arena);
    if(which==1&&(char *)object(selected)<DAT_002046c4){expected[selected*40+offset+8]=0;burn_paths[0]++;}
}
static int execute(int reference){
    if(which==0){
        uw_object_hdr_t *p=reference?reference_spawn_new_object(asked_type,asked_region):spawn_new_object(asked_type,asked_region);
        assert(p==((mode&2)?NULL:object(selected)));return p!=NULL;
    }
    return reference?reference_reset_burnt_out_item_state((char *)tile+2,object(selected)):reset_burnt_out_item_state((char *)tile+2,object(selected));
}
int main(void){
    unsigned total=0;
    for(unsigned s=0;s<65536;s++)for(unsigned m=0;m<16;m++)for(unsigned f=0;f<2;f++){
        setup(s,m,f);int actual=execute(0);assert(memcmp(arena,expected,sizeof arena)==0);
        byte saved[sizeof arena];memcpy(saved,arena,sizeof arena);uint64_t hash=events;unsigned counts[2];memcpy(counts,calls,sizeof calls);
        unsigned flags=g_object_type_props[asked_type&511].flags;
        setup(s,m,f);assert(execute(1)==actual);assert(memcmp(arena,expected,sizeof arena)==0);
        assert(memcmp(arena,saved,sizeof arena)==0&&hash==events&&memcmp(counts,calls,sizeof calls)==0);
        assert(flags==g_object_type_props[asked_type&511].flags);total++;
    }
    for(unsigned mutation=0;mutation<2;mutation++)for(unsigned f=0;f<2;f++)assert(coverage[mutation][f]>0);
    assert(quant_paths[0]>0&&quant_paths[1]>0);
    for(unsigned k=0;k<3;k++)assert(burn_paths[k]>0);
    printf("%u original/current object initialization and burnout calls agree with the independent byte oracle\n",total);
}

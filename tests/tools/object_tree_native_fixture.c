#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(8) byte records[6][40];
uw_object_type_props_t g_object_type_props[512];
short DAT_002046b0;
static unsigned seed,mode,which,step,calls[2],coverage[2][2],edges[2][2],visits;
static uint64_t events;
static int stopped;
static uw_object_hdr_t *object(unsigned n){return (uw_object_hdr_t *)(records[n]+4);}
static unsigned read16(const byte *p){return p[0]|p[1]*256u;}
static void write16(byte *p,unsigned v){p[0]=v;p[1]=v>>8;}
static int index_of(const void *p){if(!p)return -1;for(unsigned n=0;n<6;n++)if(p==object(n))return n;assert(0);return -1;}
static void event(int v){events=events*31+(uint)v;}
static void observe(unsigned k,int index){
    assert(!stopped);calls[k]++;coverage[mode&1][k]++;step++;event(k);event(index);
    for(unsigned j=0;j<sizeof records;j++)event(((byte *)records)[j]);event(DAT_002046b0);
}
static unsigned forward(unsigned n,unsigned salt){if(n==5||(salt&3)==0)return 0;return n+1+((salt>>2)%(5-n));}
static void change(unsigned k){
    if(!(mode&1))return;
    for(unsigned n=0;n<6;n++){
        byte *p=(byte *)object(n);
        write16(p,read16(p)^(step*0x1357+n*0x1234+k+1));
        write16(p+2,read16(p+2)^(step*37+n*53));
        write16(p+4,((read16(p+4)+step)&63)|(forward(n,seed+step*7+n+k)<<6));
        write16(p+6,((read16(p+6)+step*3)&63)|(forward(n,seed+step*11+n+k+3)<<6));
    }
    DAT_002046b0=(short)((seed+step*7+k)%280-5);
}
static int oracle(const void *ptr){
    const byte *p=ptr;unsigned flags=read16(p),word=read16(p+6);
    if(flags&0x2000)return 1;
    unsigned additional=0;
    if((flags&0x8000)&&!(word&0x8000)){unsigned quantity=word>>6;additional=quantity?(quantity-1)/2:0;}
    unsigned base=(g_object_type_props[flags&511].class_flags>>2)&15;
    return (int)(base+additional)>(int)DAT_002046b0;
}
int reference_object_exceeds_size_threshold(void *p);
static int callback_common(void *p,int reference){
    assert(++visits<=128);int index=index_of(p);observe(0,index);change(0);
    if(!p){event(-7);stopped=1;return -7;}
    int expected=oracle(p);
    int actual=reference?reference_object_exceeds_size_threshold(p):object_exceeds_size_threshold(p);
    assert(actual==expected);event(actual);
    int result=(mode&8)?actual:((mode&2)&&index==3?-9:0);
    event(result);if(result)stopped=1;return result;
}
static int callback_current(void *p){return callback_common(p,0);}
static int callback_reference(void *p){return callback_common(p,1);}
uw_object_hdr_t *resolve_object_link(ushort *link){
    ptrdiff_t delta=(byte *)link-(byte *)records;assert(delta>=0&&delta<(ptrdiff_t)sizeof records);
    unsigned node=delta/40,offset=delta%40;assert(offset==8||offset==10);
    unsigned slot=read16((byte *)link)>>6;assert(slot>node&&slot<6);
    observe(1,node);event(offset);event(slot);edges[mode&1][offset==10]++;change(1);
    return (mode&4)&&(seed&8)&&slot==5?NULL:object(slot);
}
#include "object_tree_native_functions.c"
static void setup(unsigned s,unsigned m,unsigned f){
    const short thresholds[]={-1,0,1,7,15,127,255,270};
    seed=s;mode=m;which=f;step=visits=0;events=0;stopped=0;memset(calls,0,sizeof calls);
    for(unsigned n=0;n<6;n++){
        for(unsigned j=0;j<40;j++)records[n][j]=seed*(j+1)+n*31+j*17;
        byte *p=(byte *)object(n);write16(p,seed^(n*0x1234));write16(p+2,seed^(n*0x5a5a));
        write16(p+4,(seed&63)|(forward(n,seed+n+mode)<<6));
        write16(p+6,((seed>>6)&63)|(forward(n,seed+n+mode+3)<<6));
    }
    if(which==1)write16((byte *)object(0)+6,((seed<<3)|(seed>>13))^(mode*0x1357));
    for(unsigned n=0;n<512;n++)g_object_type_props[n].class_flags=seed+n*7+mode*13;
    DAT_002046b0=thresholds[mode>>1];
}
static int execute(int reference){
    if(which==1){
        int expected=oracle(object(0));
        int result=reference?reference_object_exceeds_size_threshold(object(0)):object_exceeds_size_threshold(object(0));
        assert(result==expected);return result;
    }
    void *root=(mode&4)&&(seed&15)==0?NULL:object(0);
    return reference?reference_walk_object_tree(root,(int (*)())callback_reference):walk_object_tree(root,(int (*)())callback_current);
}
int main(void){
    unsigned total=0;
    for(unsigned s=0;s<65536;s++)for(unsigned m=0;m<16;m++)for(unsigned f=0;f<2;f++){
        setup(s,m,f);int actual=execute(0);byte saved[sizeof records];memcpy(saved,records,sizeof records);
        uint64_t hash=events;unsigned counts[2];memcpy(counts,calls,sizeof calls);
        unsigned steps=step,count=visits;short threshold=DAT_002046b0;int halt=stopped;
        setup(s,m,f);assert(execute(1)==actual);assert(memcmp(saved,records,sizeof records)==0);
        assert(hash==events&&memcmp(counts,calls,sizeof calls)==0&&steps==step&&count==visits&&threshold==DAT_002046b0&&halt==stopped);
        total++;
    }
    for(unsigned mutation=0;mutation<2;mutation++)for(unsigned k=0;k<2;k++){
        assert(coverage[mutation][k]>0);assert(edges[mutation][k]>0);
    }
    printf("%u complete object-tree/size comparisons and independent size checks passed\n",total);
}

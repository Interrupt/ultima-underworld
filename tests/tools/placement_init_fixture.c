#include "src/headers/uw.h"
#include <assert.h>
uw_object_type_props_t g_object_type_props[512];
char DAT_00101928;
static unsigned read16(const byte *p){return p[0]|p[1]*256u;}
static void write16(byte *p,unsigned value){p[0]=value;p[1]=value>>8;}
#include "placement_init_functions.c"
static void expected(byte *p,uint x,uint y,unsigned property_flags){
    unsigned flags=read16(p),position=read16(p+2),old_tile=read16(p+22);
    p[9]=((position>>7)&7)*32;
    p[24]&=0xe0;
    p[19]=(property_flags&8)?0:128;
    write16(p+22,(old_tile&15)|((y&63)<<4)|((x&63)<<10));
    p[10]=(p[10]&128)|(((unsigned char)DAT_00101928+1)&15);
    p[20]=0x82;
    write16(p,flags&0xbfff);
    p[8]=63;
    if((flags&0x1c0)!=0x40){
        write16(p+13,((y&255)<<8)+(((position>>10)&7)<<5)+15);
        write16(p+15,(position&127)*8);
        write16(p+11,((x&255)<<8)+((position>>13)<<5)+15);
        p[18]=0;
    }
}
int main(void){
    const uint boundaries[]={0,1,7,31,63,64,127,255,256,1023,1024,65535,65536,0x7fffffff,0x80000000,0xffffffff};
    unsigned total=0;
    for(unsigned seed=0;seed<65536;seed++)for(unsigned mode=0;mode<32;mode++){
        _Alignas(8) byte bytes[48],before[48],oracle[48];
        unsigned offset=(mode&16)?2:4;
        for(unsigned j=0;j<48;j++)bytes[j]=seed*(j+1)+mode*29+j*17;
        byte *p=bytes+offset;
        write16(p,seed^0x37a5^(mode*127));write16(p+2,seed);
        unsigned index=read16(p)&511;
        unsigned flags=(seed>>3)^(mode<<3);
        g_object_type_props[index].flags=flags;
        DAT_00101928=(char)(seed+mode*17);
        uint x=seed^boundaries[mode&15],y=(seed*65537u)^boundaries[(mode*7)&15];
        memcpy(before,bytes,sizeof bytes);memcpy(oracle,bytes,sizeof bytes);
        expected(oracle+offset,x,y,(byte)flags);
        compute_object_placement_fields(p,x,y);
        assert(memcmp(bytes,oracle,sizeof bytes)==0);
        memcpy(bytes,before,sizeof bytes);
        reference_compute_object_placement_fields(p,x,y);
        assert(memcmp(bytes,oracle,sizeof bytes)==0);
        assert(g_object_type_props[index].flags==(byte)flags);
        assert(DAT_00101928==(char)(seed+mode*17));
        total++;
    }
    printf("%u original/current placement initializations agree with the independent byte oracle\n",total);
}

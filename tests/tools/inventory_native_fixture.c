#include "src/headers/uw.h"
#include <assert.h>
static uw_object_hdr_t source_records[4], destination_records[4];
static _Alignas(2) byte input_link[2], output_link[2];
undefined2 g_save_record_count_backing[8192];
static unsigned seed,mode,direction,allocated,calls[7],coverage[2][2][7];
static uint64_t events;
static unsigned read16(const void *p) {const byte *b=p;return b[0]|b[1]*256u;}
static void event(unsigned value) {events=events*31+value;}
static void observe(unsigned kind) {
    calls[kind]++;coverage[direction][mode&1][kind]++;event(kind);
    const byte *parts[]={(byte *)source_records,(byte *)destination_records,input_link,output_link};
    unsigned sizes[]={sizeof source_records,sizeof destination_records,2,2};
    for(unsigned n=0;n<4;n++)for(unsigned j=0;j<sizes[n];j++)event(parts[n][j]);
    event(g_save_record_count);event(allocated);
}
static void change(unsigned kind) {
    if(!(mode&1))return;
    for(unsigned n=0;n<4;n++) {
        uw_object_hdr_t *objects[]={source_records+n,destination_records+n};
        for(unsigned j=0;j<2;j++) {
            objects[j]->object_id^=(kind*31+n+1)&511;
            objects[j]->position_word^=(seed+kind*17+n);
            objects[j]->quality^=(kind+n+1)&63;
            objects[j]->owner^=(kind*3+n+1)&63;
        }
    }
}
uw_object_hdr_t *resolve_object_link(ushort *link) {
    unsigned index=read16(link)>>6;assert(index<=4);observe(0);event(index);change(0);
    return index ? source_records+index-1:NULL;
}
void *alloc_save_record_slot(void) {
    assert(allocated<4);observe(1);change(1);g_save_record_count=seed+allocated+1;
    return destination_records+allocated++;
}
void encode_equipped_item_index(ushort *from,ushort *to) {
    assert((read16(to)>>6)==(g_save_record_count&1023));observe(2);event(read16(from));event(read16(to));change(2);
    if(mode&8) *(byte *)from &= 63, ((byte *)from)[1]=0;
}
void *save_record_slot_from_index(short index) {
    assert(index>=0&&index<=4);observe(3);event(index);change(3);
    return index ? source_records+index-1:NULL;
}
uw_object_hdr_t *alloc_object_slot(int region) {
    assert(region==0&&allocated<4);observe(4);change(4);return destination_records+allocated++;
}
int encode_object_slot_index(const uw_object_hdr_t *obj) {
    assert(obj>=destination_records&&obj<destination_records+4);observe(5);change(5);
    return (seed*47+(unsigned)(obj-destination_records)+257)&65535;
}
void decode_equipped_item_index(ushort *to,ushort *from) {
    observe(6);event(read16(to));event(read16(from));change(6);
    if(mode&8) *(byte *)from &= 63, ((byte *)from)[1]=0;
}
#include "inventory_native_functions.c"
static void setup(unsigned s,unsigned m,unsigned d) {
    seed=s;mode=m;direction=d;allocated=0;events=0;memset(calls,0,sizeof calls);
    for(unsigned n=0;n<4;n++) {
        byte *src=(byte *)(source_records+n),*dst=(byte *)(destination_records+n);
        for(unsigned j=0;j<8;j++){src[j]=seed*(j+1)+n*31;dst[j]=seed*(j+3)+n*53;}
        source_records[n].type_flags=seed;source_records[n].chain_word=seed&63;
        source_records[n].link_word=(seed>>6)&63;
        source_records[n].is_quant=1;
    }
    source_records[0].is_quant=(mode&2)!=0;source_records[0].link=3;source_records[0].next=2;
    source_records[2].is_quant=0;source_records[2].next=4;
    unsigned root=((mode&4)?0:1)<<6 | (seed&63);
    input_link[0]=root;input_link[1]=root>>8;output_link[0]=seed;output_link[1]=seed>>8;
    g_save_record_count=seed;
}
int main(void) {
    unsigned total=0;
    for(unsigned seed_value=0;seed_value<65536;seed_value++)for(unsigned m=0;m<16;m++)for(unsigned d=0;d<2;d++) {
        setup(seed_value,m,d);
        if(d)deserialize_inventory_link_chain(output_link,input_link);else serialize_inventory_link_chain(input_link,output_link);
        uw_object_hdr_t src[4],dst[4];memcpy(src,source_records,sizeof src);memcpy(dst,destination_records,sizeof dst);
        byte in[2],out[2];memcpy(in,input_link,2);memcpy(out,output_link,2);
        unsigned count=allocated,save_count=g_save_record_count,counts[7];memcpy(counts,calls,sizeof calls);uint64_t hash=events;
        setup(seed_value,m,d);
        if(d)reference_deserialize_inventory_link_chain(output_link,input_link);else reference_serialize_inventory_link_chain(input_link,output_link);
        assert(memcmp(src,source_records,sizeof src)==0&&memcmp(dst,destination_records,sizeof dst)==0);
        assert(memcmp(in,input_link,2)==0&&memcmp(out,output_link,2)==0);
        assert(count==allocated&&save_count==g_save_record_count&&hash==events&&memcmp(counts,calls,sizeof calls)==0);
        total++;
    }
    for(unsigned mutation=0;mutation<2;mutation++)for(unsigned k=0;k<7;k++)
        assert(coverage[k>=3][mutation][k]>0);
    printf("%u complete inventory walker comparisons passed\n",total);
}

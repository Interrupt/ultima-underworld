#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(4) byte records[4][40], trigger[8], tile[4];
static byte character[512];
char *DAT_00086df8 = (char *)character, *DAT_0024cff4;
ushort *DAT_0024cff0;
uw_mobile_object_t *g_player_object;
undefined4 DAT_00202c84;
undefined2 DAT_002020a0, DAT_002020a4;
char s_Look__it_s_a_text_trap_00087918[] = "text";
static unsigned seed, mode, operation, allocations;
static uint64_t events;
static uw_object_hdr_t *object(unsigned index)
{ return (uw_object_hdr_t *)(records[index] + 4); }
static void observe(unsigned kind, unsigned value)
{
    events = (events * 31 + kind) * 31 + value;
    for (unsigned j=0;j<sizeof records;++j) events=events*31+((byte *)records)[j];
    for (unsigned j=0;j<sizeof trigger;++j) events=events*31+trigger[j];
}
#include "trap_consumer_unused.c"
uint rand_below(int limit) { assert(limit==63); observe(1,limit); return 62; }
uw_object_hdr_t *resolve_object_link(ushort *word)
{
    assert((byte *)word == trigger + 6);
    observe(2,*word);
    if(operation==1 && mode&1) object(1)->type_flags ^= 0x5a5a;
    return object(operation==1 ? 1 : 0);
}
int check_object_area_for_spawn_block(ushort *p)
{ assert((void *)p==object(0)); observe(3,mode); return mode==4; }
int object_is_mobile(const uw_object_hdr_t *p)
{ assert(p==object(0)); observe(4,mode); return mode==1 || mode==7; }
uw_object_hdr_t *alloc_object_slot(int region)
{
    assert(allocations<2); assert(region==(allocations==0 && (mode==1 || mode==7)));
    ++allocations; observe(5,region);
    if(mode==2 || (mode==3 && allocations==2)) return NULL;
    return object(allocations==1 ? 1 : 3);
}
int place_object_in_world(uint x,uint y,int z,void *p,short radius,int skip)
{
    assert(p==object(1) && radius==4 && skip==0 && DAT_00202c84==1);
    observe(6,x); observe(7,y); observe(8,z);
    if(mode>=6) { object(1)->is_quant=0; object(1)->link=546; object(1)->owner ^= 31; }
    return mode!=5;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    observe(9,slot);
    if(operation==2) {
        assert(slot==(((uw_object_hdr_t *)trigger)->link & 511));
        if(mode&1) object(1)->position_word ^= 0xf00f;
        return object(1);
    }
    assert(slot==546); return object(2);
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p==object(1) || p==object(3)); observe(10,p==object(3));
    if(mode>=6 && p==object(3)) {
        object(1)->owner ^= 63;
        object(3)->next ^= 0x200; object(3)->link_word ^= 0xff80;
    }
    return p==object(3) ? 0x345 : 0x123;
}
uint scheduler_add_entry(uint link,int delay,byte offset,byte x,byte y)
{ assert(delay==-1 && offset==0); observe(11,link); observe(12,x); observe(13,y); return 1; }
void object_list_unlink(ushort *link,uw_object_hdr_t *p)
{ assert(operation==1 && (byte *)p==trigger); observe(14,*link); }
void free_object_slot(uw_object_hdr_t *p)
{ assert(operation==1 && (byte *)p==trigger); observe(15,0); }
void *tilemap_lookup(short x,short y)
{ assert(operation==1); observe(16,x); observe(17,y); return tile; }
void refresh_object_link_chain(void *link,void *p)
{ assert((byte *)link==tile+2 && p==object(1)); observe(18,0); }
int apply_area_terrain_effect(short x,int y,short wall,short height,short adjust,short floor,short width,short extent,short flag)
{
    assert(operation==2 && wall==255 && height==255 && floor==255 && width==0 && extent==0 && flag==0);
    observe(19,x); observe(20,y); observe(21,adjust); return 1;
}
#include "trap_consumer_functions.c"
static void initialize(void)
{
    for(unsigned j=0;j<sizeof records;++j) ((byte *)records)[j]=(seed>>(j&7))+j*31;
    for(unsigned j=0;j<sizeof trigger;++j) trigger[j]=seed>>((j&1)*8);
    for(unsigned j=0;j<sizeof tile;++j) tile[j]=seed>>((j&1)*8);
    memset(character,0x25,sizeof character);
    object(0)->type_flags=seed; object(0)->position_word=seed;
    object(0)->link=(seed&1) ? 546 : 0;
    object(1)->type_flags=seed; object(1)->position_word=seed;
    object(2)->type_flags=seed^0xffff; object(2)->chain_word=seed; object(2)->link_word=seed;
    ((uw_object_hdr_t *)trigger)->link_word=seed;
    allocations=0; events=0; DAT_00202c84=0;
}
static uint64_t finish(uint64_t hash)
{
    hash=hash*31+events;
    for(unsigned j=0;j<sizeof records;++j) hash=hash*31+((byte *)records)[j];
    for(unsigned j=0;j<sizeof trigger;++j) hash=hash*31+trigger[j];
    for(unsigned j=0;j<sizeof tile;++j) hash=hash*31+tile[j];
    return hash;
}
static uint64_t run_spawn(int (*fn)(ushort *,int,int))
{
    uint64_t hash=1; operation=0;
    for(seed=0;seed<65536;++seed) for(mode=0;mode<8;++mode) {
        initialize(); ((uw_object_hdr_t *)trigger)->object_id=0x187;
        ((uw_object_hdr_t *)trigger)->is_quant=0;
        ((uw_object_hdr_t *)trigger)->quality=0;
        if(mode==4) object(0)->object_id=0x43;
        assert(fn((ushort *)trigger,(int)seed-32768,(int)(seed*37)-65536)==2);
        assert(DAT_00202c84==0); hash=finish(hash);
    }
    return hash;
}
static uint64_t run_marker(void (*fn)(char *,char *))
{
    uint64_t hash=1; operation=1;
    for(seed=0;seed<65536;++seed) for(mode=0;mode<2;++mode) {
        initialize(); fn((char *)tile+2,(char *)trigger); hash=finish(hash);
    }
    return hash;
}
static uint64_t run_numeric(void (*fn)(int,char *,int,int))
{
    uint64_t hash=1; operation=2;
    for(seed=0;seed<65536;++seed) for(mode=0;mode<2;++mode) {
        initialize();
        fn((int)(seed&2047)-1024,(char *)trigger,(int)seed-32768,(int)(seed*37)-65536);
        hash=finish(hash);
    }
    return hash;
}
int main(void)
{
    assert(run_spawn(dispatch_trap_type_effect)==run_spawn(reference_dispatch_trap_type_effect));
    assert(run_marker(remove_trap_chain_marker)==run_marker(reference_remove_trap_chain_marker));
    assert(run_numeric(apply_quest_event_numeric_effect)==run_numeric(reference_apply_quest_event_numeric_effect));
    puts("786432 trap cases preserve clone/extension bytes, callbacks, links, counter wrap and quest values");
}

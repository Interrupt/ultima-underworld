#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[4][40], player[32], slots[64], metadata[2][40];
uw_mobile_object_t *g_player_object=(uw_mobile_object_t *)player;
char *g_backpack_slot_table=(char *)slots, *g_current_container_record;
undefined1 DAT_0023bca8_backing[256];
unsigned char g_backpack_slot_to_widget_backing[28];
ushort *DAT_002046b4=(ushort *)(player+6);
static unsigned seed, scenario, mutation, reference_run, reduction, allocations, callbacks;
static uint64_t events;
static short slot;
static ushort flag;
static uint amount;
static int filter_category,filter_subcategory,filter_quality;
ushort *reference_extract_matching_object_from_slot(int,int,int,short,ushort);
static uw_object_hdr_t *object(unsigned i)
{ return (uw_object_hdr_t *)(records[i]+4); }
static void observe(unsigned kind)
{
    events=events*31+kind; ++callbacks;
    for (unsigned i=0;i<sizeof records;++i) events=events*31+((byte *)records)[i];
    for (unsigned i=0;i<sizeof player;++i) events=events*31+player[i];
    for (unsigned i=0;i<sizeof slots;++i) events=events*31+slots[i];
    for (unsigned i=0;i<sizeof metadata;++i) events=events*31+((byte *)metadata)[i];
    events=events*31+(ushort)g_player_carry_weight;
}
static void argument(int value)
{ events=events*31+(uint)value; }
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    observe(1);
    if (p==object(0)) return 10;
    if (p==object(1)) return 20;
    if (p==object(2)) return 3;
    if (p==object(3)) return 4;
    assert(p==(uw_object_hdr_t *)player); return 1;
}
uw_object_hdr_t *resolve_object_link(ushort *link)
{
    observe(2); argument(*link);
    switch (*link>>6) {
    case 0: return NULL;
    case 10: return object(0);
    case 3: return object(2);
    case 4: return object(3);
    default: assert(0); return NULL;
    }
}
char *find_object_in_link_chain(int category, int subcategory, int quality, char **chain)
{
    assert(category==filter_category && subcategory==filter_subcategory && quality==filter_quality);
    observe(3); *chain=(char *)object(3);
    return scenario==5 ? NULL : (char *)object(0);
}
uw_object_hdr_t *find_object_by_encoded_slot_in_chain(ushort *link,int nested,int index)
{
    assert((byte *)link==player+6 && nested==1 && index==10);
    observe(4); return scenario==5 ? NULL : object(0);
}
uw_object_hdr_t *alloc_object_slot(int region)
{
    assert(region==0 && allocations==0); observe(5); ++allocations;
    if (mutation) {
        object(0)->type_flags^=0x6000; object(0)->position_word^=0xa5a5;
        object(0)->chain_word^=0x5555; object(0)->link_word^=0xaaaa;
    }
    return object(1);
}
void object_list_insert_head(ushort *link,uw_object_hdr_t *p)
{
    assert(link==&object(0)->chain_word && p==object(1)); observe(6);
    p->next=*link>>6; *link=(*link&63)|(20<<6);
    if (mutation) object(0)->position_word^=0x5a5a;
}
void object_list_unlink(ushort *link,uw_object_hdr_t *p)
{
    assert(p==object(0));
    assert((byte *)link==player+6 || link==&object(2)->link_word || link==&object(3)->link_word);
    observe(7); *link=(*link&63)|(p->next<<6);
}
uint calculate_object_weight(uw_object_hdr_t *p)
{ assert(p==object(0)); observe(8); return seed&127; }
void repopulate_container_grid_slots(void) { observe(9); }
void refresh_container_view(void) { observe(10); }
void redraw_inventory_widget(int widget) { observe(11); argument(widget); }
void refresh_player_equipment_effects(void) { observe(12); }
uw_unaligned_word_t *extract_and_refresh_slot_item(int category,int subcategory,int quality,short slot_,ushort flag_)
{
    assert(reduction && category==-1 && subcategory==-1 && quality==-1);
    assert(slot_==slot && flag_==(ushort)amount); observe(13);
    ushort *p=reference_run ? reference_extract_matching_object_from_slot(category,subcategory,quality,slot_,flag_)
        : extract_matching_object_from_slot(category,subcategory,quality,slot_,flag_);
    refresh_player_equipment_effects(); return p;
}
#include "stack_split_functions.c"

struct result {
    byte records[sizeof records],player[sizeof player],slots[sizeof slots],metadata[sizeof metadata];
    int value,carry;
    unsigned allocations,callbacks;
    uint64_t events;
};
static struct result run(unsigned reference)
{
    static const uint amounts[]={0,1,2,0xffff,0x10001,0xffffffff,511,512};
    reference_run=reference; allocations=callbacks=0; events=0;
    memset(records,0xa5,sizeof records); memset(player,0x5a,sizeof player);
    memset(slots,0,sizeof slots); memset(metadata,0,sizeof metadata);
    object(0)->type_flags=(seed&0x7fff)|(scenario==7 ? 0 : 0x8000);
    object(0)->position_word=seed^0x3333; object(0)->chain_word=seed^0x5555;
    object(0)->link_word=scenario==8 ? seed|0x8000 : seed;
    for (unsigned i=0;i<28;++i) g_backpack_slot_to_widget_backing[i]=(byte)(i+0x90);
    g_player_carry_weight=(short)seed;
    *(ushort *)(player+6)=10<<6;
    object(2)->link=10; object(3)->link=10;
    slot=scenario==2 ? 19 : scenario==3 ? 20 : 3;
    flag=scenario==1 ? 0 : scenario==9 ? 0xffff : 1;
    amount=amounts[seed&7];
    filter_category=filter_subcategory=filter_quality=-1;
    if (scenario==0 || scenario==9 || scenario==4 || scenario==5) {
        filter_category=object(0)->object_id>>6 &7;
        filter_subcategory=object(0)->object_id>>4 &3;
        filter_quality=object(0)->object_id &15;
    }
    if (scenario==1) {
        filter_subcategory=object(0)->object_id>>4 &3;
        filter_quality=object(0)->object_id &15;
    }
    if (scenario==4) filter_subcategory=99;
    if (scenario==5) filter_quality=99;
    if (scenario==8) filter_category=99;
    if (!reduction || scenario<4) *(ushort *)(slots+slot*2)=scenario==6 ? 0 : 10<<6;
    g_current_container_link=3<<6;
    g_current_container_record=scenario>=2 && scenario<=4 ? (char *)metadata[0] : NULL;
    *(ushort *)(metadata[0]+8)=3<<6;
    *(short *)(metadata[0]+10)=(short)seed;
    *(short *)(metadata[1]+10)=(short)(seed^0xaaaa);
    char *previous=(char *)metadata[1], *end=NULL;
    memcpy(metadata[0]+20,&previous,sizeof previous); memcpy(metadata[1]+20,&end,sizeof end);
    if (scenario==2 || scenario==3) *(ushort *)(slots+42)=10<<6;
    int value;
    if (reduction) value=reference ? reference_reduce_object_count((ushort *)object(0),amount) : reduce_object_count((ushort *)object(0),amount);
    else {
        ushort *p=reference ? reference_extract_matching_object_from_slot(filter_category,filter_subcategory,filter_quality,slot,flag)
            : extract_matching_object_from_slot(filter_category,filter_subcategory,filter_quality,slot,flag);
        assert(p==NULL || p==(ushort *)object(0)); value=p!=NULL;
    }
    struct result result={0};
    memcpy(result.records,records,sizeof records); memcpy(result.player,player,sizeof player);
    memcpy(result.slots,slots,sizeof slots); memcpy(result.metadata,metadata,sizeof metadata);
    result.value=value; result.carry=g_player_carry_weight;
    result.allocations=allocations; result.callbacks=callbacks; result.events=events;
    return result;
}
int main(void)
{
    for (reduction=0;reduction<2;++reduction) for (seed=0;seed<65536;++seed)
        for (scenario=0;scenario<10;++scenario) for (mutation=0;mutation<2;++mutation) {
            struct result old=run(1), current=run(0);
            assert(!memcmp(old.records,current.records,sizeof records));
            assert(!memcmp(old.player,current.player,sizeof player));
            assert(!memcmp(old.slots,current.slots,sizeof slots));
            assert(!memcmp(old.metadata,current.metadata,sizeof metadata));
            assert(old.value==current.value && old.carry==current.carry);
            assert(old.allocations==current.allocations && old.callbacks==current.callbacks && old.events==current.events);
        }
    puts("2621440 stack-split cases preserve quantities, clone bytes, slots, container weights, callbacks and returns");
    return 0;
}

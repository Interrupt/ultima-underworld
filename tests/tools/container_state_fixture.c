#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[5][24],ui_records[3][40];
static char slots[2][80];
char *g_backpack_slot_table,*g_open_container_list,*g_current_container_record;
unsigned char g_inventory_hotspot_table[0x17 * 0xe + 2],g_backpack_widget_to_slot_backing[0x17],g_backpack_slot_to_widget_backing[0x1c];
undefined4 DAT_002028e8_backing[32],DAT_00202938;
static undefined4 DAT_002028a0_backing[16];
#define DAT_002028a0 DAT_002028a0_backing[0]
undefined2 DAT_00201b60;
undefined1 g_active_hud_panel;
static unsigned seed,mode,mutation,function,calls[16],coverage[2][16];
static short slot_arg;
static uint64_t events;
static int final_phase;
static uw_object_hdr_t *final_object,*released_object;
static ushort final_type,released_type;
static uw_object_hdr_t *object(unsigned n) {return (uw_object_hdr_t *)(records[n]+4);}
static char *ui(unsigned n) {return (char *)(ui_records[n]+4);}
static void write_word(void *p,ushort v) {memcpy(p,&v,2);}
static ushort read_word(const void *p) {ushort v;memcpy(&v,p,2);return v;}
static int ui_index(const void *p) {if(!p)return -1;for(unsigned i=0;i<3;i++)if(p==ui(i))return i;assert(0);return 0;}
static void event(int v) {events=events*31+(uint)v;}
static void observe(unsigned k)
{
    ++calls[k];++coverage[mutation][k];event(k);
    for(unsigned i=0;i<sizeof records;i++)event(((byte *)records)[i]);
    event(g_backpack_slot_table==slots[1]);event(g_current_container_link);
    event(read_word(slots[0]+slot_arg*2));event(ui_index(g_open_container_list));event(ui_index(g_current_container_record));
    event(DAT_00202938);event(DAT_002028a0);
}
static void change(unsigned k)
{
    if(!mutation)return;
    g_backpack_slot_table=slots[1];
    object(4)->type_flags^=0xa55a;object(1)->position_word^=0x5aaa;
    slots[0][slot_arg*2]^=0x15; /* owner bits only: keep the saved equipped cursor live */
    g_inventory_hotspot_table[12*14+12]^=1;
    if(k==10 && mode==10) {g_open_container_list=ui(0);g_current_container_record=ui(0);}
    if(k==14) {g_current_container_link^=0x40;g_current_container_record=ui(2);}
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{
    assert((ushort)slot==(read_word(ui(0)+8)>>6));observe(1);event(slot);change(1);
    released_object=object(1);if(mutation)released_object->type_flags^=0x6a5a;
    released_type=released_object->type_flags;return released_object;
}
uw_object_hdr_t *resolve_object_link(ushort *p)
{
    observe(0);
    if(calls[0]==1) {
        assert((void *)p==(void *)(slots[0]+slot_arg*2));change(0);return object(0);
    }
    if(p==&g_current_container_link) {
        change(0);
        if(final_phase) {final_object=object(mode==11 ? 0 : 4);final_type=final_object->type_flags;return final_object;}
        return object(mode==11 ? 0 : 1);
    }
    if(p==&object(1)->link_word || p==&object(0)->link_word) {change(0);return mode==12 ? NULL : object(2);}
    for(unsigned i=2;i<5;i++)if(p==&object(i)->chain_word) {event(i);change(0);return i==4 ? NULL : object(i+1);}
    assert(0);return NULL;
}
void set_hud_status_value(byte slot,ushort v) {assert(slot==6&&v==1);observe(2);change(2);}
void decrement_cursor_hide_depth(void) {observe(3);change(3);}
void draw_sprite_by_id(int id,int x,int y,int w,short h) {assert(id==0x2097&&x==0xec&&y==0x51&&w==0x29&&h==0x54);observe(4);change(4);}
uint grtile_alloc_registered(uint w,uint h) {observe(5);event(w);event(h);change(5);return 100+calls[5];}
int capture_framebuffer_rect_to_grtile(uint key,int x,int y,int w,short h) {observe(6);event(key);event(x);event(y);event(w);event(h);change(6);return -1;}
int cursor_show_idle_tick(void) {observe(7);change(7);return 65536;}
void close_backpack_container(void) {observe(8);change(8);g_open_container_list=NULL;g_current_container_record=NULL;}
void free_open_container_chain(void) {observe(9);change(9);g_open_container_list=NULL;g_current_container_record=NULL;}
void *ce_malloc(unsigned size) {assert(size==28);observe(10);change(10);return mode==8 ? NULL : ui(1);}
void sum_container_weight(ushort *p,short *total)
{
    assert(p==&object(mode==11 ? 0 : 1)->link_word);
    assert((void *)total==(void *)(g_current_container_record+10));observe(11);change(11);*total=(short)(seed^0xaaaa);
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    observe(12);change(12);if(!p)return 0;
    for(unsigned i=2;i<5;i++)if(p==object(i))return i;
    assert(0);return 0;
}
void redraw_inventory_widget_range(int first,short last)
{
    if(first==12) {assert(last==19);final_phase=1;}
    else {assert(first==20&&last==20);assert(read_word(g_backpack_slot_table+DAT_00085c4c*2)==g_current_container_link);}
    observe(13);event(first);event(last);change(13);
}
void refresh_container_view(void)
{
    unsigned nibble=final_type&15;
    ushort expected=final_type+((nibble<12&&!(nibble&1)) ? 1 : 0);
    assert(final_object->type_flags==expected);
    observe(14);change(14);
}
void redraw_inventory_widget(int widget) {assert(widget<11);observe(15);event(widget);change(15);}
#include "container_state_functions.c"
struct result {
    byte records[sizeof records],ui[sizeof ui_records],slots[sizeof slots],hotspots[sizeof g_inventory_hotspot_table];
    byte widgets[sizeof g_backpack_widget_to_slot_backing],slot_widgets[sizeof g_backpack_slot_to_widget_backing];
    uint buffers[48],icon;unsigned calls[16];uint64_t events;int state[5];
};
static struct result run(unsigned reference)
{
    for(unsigned i=0;i<sizeof records;i++)((byte *)records)[i]=seed*(i+1)+i*37;
    for(unsigned i=0;i<5;i++) {object(i)->type_flags=seed^(i*0xa5a5);object(i)->chain_word=seed^(i*0x5555);object(i)->link_word=seed^(i*0x5a5a);}
    object(0)->type_flags=(seed&0xfe00)|0x80|(seed&15);
    if(mode==2)object(0)->object_id=0x100|(seed&15);
    if(mode==15)object(0)->object_id=0x8f;
    object(0)->link=2;object(1)->link=2;
    for(unsigned i=2;i<5;i++) {object(i)->next=i==4 ? 0 : i+1;object(i)->invisible=mode==13 || ((seed>>(i+3))&1);}
    for(unsigned i=0;i<sizeof ui_records;i++)((byte *)ui_records)[i]=seed+i*31;
    for(unsigned i=0;i<3;i++) {char *zero=NULL;memcpy(ui(i)+12,&zero,sizeof zero);memcpy(ui(i)+20,&zero,sizeof zero);}
    for(unsigned i=0;i<sizeof slots;i++)((byte *)slots)[i]=seed+i*53;
    static const short indices[16]={4,20,10,11,27,20,4,11,10,20,11,20,0,11,27,4};slot_arg=indices[mode];
    ushort root=(seed&63)|(1<<6);write_word(slots[0]+slot_arg*2,root);write_word(slots[1]+slot_arg*2,root);
    write_word(ui(0)+8,mode==3 ? root : root^0x40);
    g_backpack_slot_table=slots[0];
    g_open_container_list=mode==3||mode==5||mode==6 ? ui(0) : NULL;g_current_container_record=g_open_container_list;
    for(unsigned i=0;i<sizeof g_inventory_hotspot_table;i++)g_inventory_hotspot_table[i]=seed+i*17;
    for(unsigned i=0;i<sizeof g_backpack_widget_to_slot_backing;i++)g_backpack_widget_to_slot_backing[i]=seed+i;
    g_backpack_widget_to_slot_backing[20]=19;
    for(unsigned i=0;i<sizeof g_backpack_slot_to_widget_backing;i++)g_backpack_slot_to_widget_backing[i]=i%16;
    g_backpack_slot_to_widget_backing[slot_arg]=mode==14 ? (byte)-1 : mode&15;
    for(unsigned i=0;i<16;i++)DAT_002028a0_backing[i]=mode==7 ? seed+i+1 : i;
    for(unsigned i=0;i<32;i++)DAT_002028e8_backing[i]=seed+i*37;
    DAT_00202938=mode==9 ? seed+1 : 0;DAT_00201b60=mode&1 ? 4 : 1;g_active_hud_panel=(mode>>2)&1;
    memset(calls,0,sizeof calls);events=0;final_phase=0;final_object=NULL;released_object=NULL;
    struct result r={0};
    if(function==0) {
        if(reference)reference_release_container_reference(ui(0));else release_container_reference(ui(0));
        unsigned nibble=released_type&15;ushort expected=released_type-((nibble<12&&(nibble&1)) ? 1 : 0);
        assert(released_object->type_flags==expected && calls[1]==1);
    } else {
        if(reference)reference_open_backpack_container(slot_arg);else open_backpack_container(slot_arg);
        assert(calls[0]>=1);
        if(calls[14]) {assert(final_object && calls[11]==1);for(unsigned i=12;i<20;i++)assert(g_backpack_widget_to_slot_backing[i]==i+8);}
    }
    memcpy(r.records,records,sizeof records);memcpy(r.ui,ui_records,sizeof ui_records);memcpy(r.slots,slots,sizeof slots);
    memcpy(r.hotspots,g_inventory_hotspot_table,sizeof g_inventory_hotspot_table);
    memcpy(r.widgets,g_backpack_widget_to_slot_backing,sizeof g_backpack_widget_to_slot_backing);
    memcpy(r.slot_widgets,g_backpack_slot_to_widget_backing,sizeof g_backpack_slot_to_widget_backing);
    memcpy(r.buffers,DAT_002028a0_backing,sizeof DAT_002028a0_backing);memcpy(r.buffers+16,DAT_002028e8_backing,sizeof DAT_002028e8_backing);
    r.icon=DAT_00202938;memcpy(r.calls,calls,sizeof calls);r.events=events;
    int state[]={g_backpack_slot_table==slots[1],ui_index(g_open_container_list),ui_index(g_current_container_record),DAT_00201b60,g_active_hud_panel};
    memcpy(r.state,state,sizeof state);return r;
}
int main(void)
{
    unsigned total=0;
    for(function=0;function<2;function++)for(mutation=0;mutation<2;mutation++)
      for(mode=0;mode<16;mode++)for(seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if(memcmp(&expected,&actual,sizeof expected)) {fprintf(stderr,"container mismatch: function %u mutation %u mode %u seed %u\n",function,mutation,mode,seed);return 1;}
        ++total;
      }
    for(unsigned m=0;m<2;m++)for(unsigned k=0;k<16;k++) {if(!coverage[m][k])fprintf(stderr,"unreached callback: mutation %u service %u\n",m,k);assert(coverage[m][k]);}
    printf("%u container cases preserve guarded IDs, header flags, saved cursors and UI callback state\n",total);
}

#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][24],player[64];
static short counts[2][4],view_modes[8];
static uint included[2][4];
static undefined2 DAT_000bbfa8_backing[8];
#define DAT_000bbfa8 DAT_000bbfa8_backing[0]
static undefined1 DAT_000bc008;
char *g_selected_object,*DAT_00086df8=(char *)player;
short *DAT_00085a6c=view_modes;
undefined2 g_cursor_holding_state;
static unsigned seed,mode,mutation,calls[19],coverage[2][19],base;
static uint64_t events;
static ushort *escaped_side;
static short *escaped_slot;
static void **escaped_counts,**escaped_flags;
static int side_arg,slot_arg,skill_return,skill_side;
static byte merge_expected[8];
static uw_object_hdr_t *object(unsigned n) {return (uw_object_hdr_t *)(records[n]+4);}
static int index_of(const void *p) {if(!p)return -1;for(unsigned i=0;i<3;i++)if(p==object(i))return i;assert(0);return 0;}
static int array_of(const void *p) {if(p==counts[0]||p==included[0])return 0;if(p==counts[1]||p==included[1])return 1;assert(0);return 0;}
static void event(int v) {events=events*31+(uint)v;}
static void observe(unsigned k)
{
    ++calls[k];++coverage[mutation][k];event(k);
    for(unsigned i=0;i<sizeof records;i++)event(((byte *)records)[i]);
    for(unsigned i=0;i<8;i++) {event(((short *)counts)[i]);event(((uint *)included)[i]);event(DAT_000bbfa8_backing[i]);}
    event(index_of(g_selected_object));event(g_cursor_holding_state);event(view_modes[6]);
    if(escaped_slot) {event(*escaped_side);event(*escaped_slot);event(array_of(*escaped_counts));event(array_of(*escaped_flags));}
}
static void change(unsigned k)
{
    if(!mutation)return;
    for(unsigned i=0;i<3;i++) {
        object(i)->type_flags^=0x1000;object(i)->position_word^=0xa5a5;
        object(i)->owner^=0x2a;object(i)->quality^=0x15;
    }
    counts[0][seed&3]=1+(seed&1);counts[1][(seed>>2)&3]=2+(seed&1);
    player[0x29]^=0x55;
    if(escaped_slot && (k==9||k==10||k==11||k==15)) {
        *escaped_slot=(*escaped_slot+1)&3;*escaped_side^=1;
        *escaped_counts=counts[(seed+k)&1];*escaped_flags=included[(seed+k)&1];
    }
}
int wait_for_key_or_mouse_move(int poll) {assert(poll==1);observe(0);change(0);return base==9||base==10 ? 0 : 65536;}
uw_object_hdr_t *get_object_record_by_slot_index(short id) {assert(id>=1&&id<=4);observe(1);event(id);change(1);return object(0);}
byte *prompt_split_object_stack(byte *p)
{
    assert((void *)p==object(0));observe(2);change(2);
    return base==2 ? NULL : base==3 ? (byte *)object(0) : (byte *)object(1);
}
bool check_object_carry_weight(ushort *p)
{
    assert((void *)p==object(0));observe(3);change(3);
    object(0)->link=seed&1023;object(1)->link=(seed>>6)&1023;
    memcpy(merge_expected,object(0),8);
    unsigned sum=object(0)->link+object(1)->link;
    ushort link_word=object(0)->owner|((sum&1023)<<6);memcpy(merge_expected+6,&link_word,2);
    return base!=3&&base!=4&&base!=14;
}
void object_list_unlink(ushort *p,uw_object_hdr_t *obj)
{
    assert(p==&object(0)->chain_word && obj==object(1));
    assert(!memcmp(merge_expected,object(0),8));observe(4);change(4);g_selected_object=(char *)object(1);
}
void free_object_slot(uw_object_hdr_t *obj) {assert(obj==object(1));observe(5);change(5);}
void print_scroll_message_by_id(uint id) {assert(id==0xfc);observe(6);change(6);}
void object_list_insert_head(ushort *p,uw_object_hdr_t *obj) {assert(p==&object(0)->chain_word&&obj==object(1));observe(7);change(7);}
void pick_up_barter_slot_item(short slot,char *items,int remove_all)
{
    assert(slot==(short)slot_arg && (void *)items==counts[0]);observe(8);event(slot);event(remove_all);change(8);
    g_selected_object=base==6 ? NULL : (char *)object(2);
}
void redraw_barter_slot_icon(short side,short slot) {assert(slot>=0&&slot<4);observe(9);event(side);event(slot);change(9);}
void draw_hotspot_crosshair_marker(short side,short slot) {assert(slot>=0&&slot<4);observe(10);event(side);event(slot);change(10);}
void wait_for_click_release(int poll) {assert(poll==1);observe(11);change(11);}
void get_mouse_position(ushort *x,ushort *y) {observe(12);change(12);*x=seed;*y=seed^0xa5a5;}
int resolve_barter_slot_at_point(short x,short y,ushort *side,short *slot,void **items,void **flags)
{
    assert(x==(short)seed&&y==(short)(seed^0xa5a5));observe(13);change(13);
    escaped_side=side;escaped_slot=slot;escaped_counts=items;escaped_flags=flags;
    *side=1;*slot=(seed>>2)&3;*items=counts[1];*flags=included[1];
    if(base==13)g_selected_object=NULL;
    return base==7 ? (mode&16 ? 65536 : 0) : 1;
}
void handle_inventory_panel_click(short n) {assert(n==-1);observe(14);change(14);}
int roll_skill_check(int skill,int difficulty)
{
    assert(skill==player[0x29]&&(difficulty==15||difficulty==20));skill_side=difficulty==15;
    observe(15);event(skill);event(difficulty);change(15);
    skill_return=mode&16 ? (seed&1 ? 65537 : 32768) : (short)seed;return skill_return;
}
void dispatch_object_action(ushort *p,int action)
{
    assert((void *)p==object(0));assert(action==(skill_side ? skill_return+1 : (short)skill_return>0 ? 2 : 1));
    observe(16);event(action);change(16);
}
void place_item_in_barter_slot(int side,int slot,void *items) {assert(side!=0&&slot>=0&&slot<4);observe(17);event(side);event(slot);event(array_of(items));change(17);g_selected_object=NULL;}
void pop_cursor_icon(ushort n) {assert(n==3);observe(18);change(18);}
#include "barter_click_functions.c"
struct result {
    byte records[sizeof records],player[sizeof player];short counts[8],view[8];uint included[8];ushort icons[8];
    unsigned calls[19];uint64_t events;int state[3];
};
static struct result run(unsigned reference)
{
    base=mode&15;
    for(unsigned i=0;i<sizeof records;i++)((byte *)records)[i]=seed*(i+1)+i*37;
    for(unsigned i=0;i<sizeof player;i++)player[i]=seed+i*17;
    for(unsigned i=0;i<3;i++) {object(i)->type_flags=seed^(i*0xa5a5);object(i)->chain_word=seed^(i*0x5555);object(i)->link_word=seed^(i*0x5a5a);}
    object(0)->is_quant=base>=2&&base<=5 ? 1 : base==15;
    object(0)->link=base>=2&&base<=5 ? seed%510+2 : seed&1023;
    for(unsigned i=0;i<8;i++) {((short *)counts)[i]=1+i%4;((uint *)included)[i]=seed^(i*0xa5a5);DAT_000bbfa8_backing[i]=seed+i*37;view_modes[i]=seed+i;}
    slot_arg=(seed&3)+(mode&16 ? 65536 : 0);side_arg=(base==1||base==12||mode&16 ? 0 : 1)+(mode&16 ? 65536 : 0);
    if(base==0)counts[0][seed&3]=0;
    view_modes[6]=base==10 ? 1 : 0;DAT_000bc008=base==1 ? 0 : 1;
    g_selected_object=base==11||base==12 ? (char *)object(2) : NULL;g_cursor_holding_state=seed;
    escaped_side=NULL;escaped_slot=NULL;escaped_counts=NULL;escaped_flags=NULL;
    events=0;memset(calls,0,sizeof calls);
    if(reference)reference_handle_barter_slot_click(side_arg,slot_arg,counts[0],included[0]);else handle_barter_slot_click(side_arg,slot_arg,counts[0],included[0]);
    escaped_side=NULL;escaped_slot=NULL;escaped_counts=NULL;escaped_flags=NULL;
    if(base==4)assert(calls[4]==1&&calls[5]==1&&calls[6]==1);
    if(base==2)assert(!calls[3]);
    if(base==3)assert(!calls[4]&&!calls[5]);
    struct result r={0};memcpy(r.records,records,sizeof records);memcpy(r.player,player,sizeof player);memcpy(r.counts,counts,sizeof counts);
    memcpy(r.view,view_modes,sizeof view_modes);memcpy(r.included,included,sizeof included);memcpy(r.icons,DAT_000bbfa8_backing,sizeof r.icons);
    memcpy(r.calls,calls,sizeof calls);r.events=events;r.state[0]=index_of(g_selected_object);r.state[1]=g_cursor_holding_state;r.state[2]=DAT_000bc008;return r;
}
int main(void)
{
    unsigned total=0;
    for(mutation=0;mutation<2;mutation++)for(mode=0;mode<32;mode++)for(seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if(memcmp(&expected,&actual,sizeof expected)) {fprintf(stderr,"barter click mismatch: mutation %u mode %u seed %u\n",mutation,mode,seed);return 1;}
        ++total;
    }
    for(unsigned m=0;m<2;m++)for(unsigned k=0;k<19;k++) {if(!coverage[m][k])fprintf(stderr,"unreached callback: mutation %u service %u\n",m,k);assert(coverage[m][k]);}
    printf("%u barter click cases preserve quantity overflow, owners, UI cursors and callbacks\n",total);
}

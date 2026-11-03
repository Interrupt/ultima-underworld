#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[4][40],player[128];
ushort *g_interact_target;
uw_mobile_object_t *g_player_object;
char *DAT_00086df8=(char *)player,*DAT_002020b0;
short DAT_000858c4;
undefined2 g_cursor_holding_state;
static undefined4 DAT_002020ec;
static int DAT_002020e0;
static unsigned seed,mode,mutation,calls[16],coverage[2][16];
static uint64_t events;
static uw_object_hdr_t *split_result,*rollback_target;
static byte rollback_expected[8];
static int type_result;
static uw_object_hdr_t *object(unsigned n) {return (uw_object_hdr_t *)(records[n]+4);}
static uw_object_hdr_t *target(void) {return (uw_object_hdr_t *)g_interact_target;}
static unsigned index_of(const void *p) {for(unsigned i=0;i<4;i++)if(p==object(i))return i;assert(0);return 0;}
static void event(int v) {events=events*31+(uint)v;}
static void observe(unsigned k)
{
    ++calls[k];++coverage[mutation][k];event(k);
    for(unsigned i=0;i<sizeof records;i++)event(((byte *)records)[i]);
    event(index_of(g_interact_target));event(index_of(DAT_002020b0));event((ushort)DAT_000858c4);
    event(g_cursor_holding_state);event(DAT_002020ec);event(DAT_002020e0);event(player[0x5e]);
}
static void change(unsigned k)
{
    if(!mutation)return;
    if(k==0||k==1||k==2||k==8||k==11||k==12||k==13)g_interact_target=(ushort *)object(target()==object(0) ? 1 : 0);
    for(unsigned i=0;i<4;i++) {object(i)->type_flags^=0x2000;object(i)->position_word^=0xa5a5;object(i)->owner^=0x2a;}
    DAT_000858c4^=0x55;DAT_002020b0=(char *)object(k&1);player[0x5e]^=0x55;
}
int target_in_range(short range,void *actor,char *cue)
{
    assert(range==DAT_000858c4&&actor==(void *)g_interact_target&&cue==DAT_002020b0);
    observe(0);event(range);change(0);return mode==4 ? 0 : mode==5 ? 65537 : 1;
}
int target_line_of_sight(short cls,void *obj) {assert(cls==DAT_000858c4&&obj==(void *)g_interact_target);observe(1);event(cls);change(1);return mode==5 ? 1 : 0;}
int object_ptr_in_arena(const uw_object_hdr_t *obj) {assert(obj==target());observe(2);change(2);return mode==1 ? 0 : 65536;}
void interact_talk_npc(void) {assert((target()->object_id&0x1c0)==0x40);observe(3);change(3);}
void interact_use(void) {observe(4);change(4);}
ushort *use_object_on_target(ushort *actor,ushort *obj,int flag) {assert((void *)actor==g_player_object&&obj==g_interact_target&&flag==0);observe(5);change(5);return NULL;}
byte *prompt_split_object_stack(byte *p)
{
    assert((void *)p==g_interact_target);uw_object_hdr_t *incoming=target();observe(6);change(6);
    if(mode==14)g_interact_target=(ushort *)object(incoming==object(0) ? 1 : 0);
    split_result=mode==6 ? NULL : mode==7||mode==14 ? incoming : object(2);
    return (byte *)split_result;
}
void object_list_insert_head(ushort *p,uw_object_hdr_t *obj) {assert(p==&target()->chain_word&&obj==split_result&&obj!=target());observe(7);change(7);}
bool check_object_carry_weight(ushort *p)
{
    assert(p==g_interact_target);observe(8);change(8);
    if(mode==13)g_interact_target=(ushort *)split_result;
    if(mode==14)g_interact_target=(ushort *)object(split_result==object(0) ? 1 : 0);
    if(mode==15)g_interact_target=(ushort *)object(3);
    target()->link=seed&1023;if(split_result)split_result->link=(seed>>6)&1023;
    rollback_target=target();memcpy(rollback_expected,target(),8);
    if(split_result) {unsigned sum=target()->link+split_result->link;ushort packed=target()->owner|((sum&1023)<<6);memcpy(rollback_expected+6,&packed,2);}
    return mode==9||mode==11||mode==12;
}
void object_list_unlink(ushort *p,uw_object_hdr_t *obj)
{
    assert(p==&target()->chain_word&&obj==split_result&&obj!=target()&&target()==rollback_target);
    assert(!memcmp(target(),rollback_expected,8));observe(9);change(9);
}
void print_scroll_message_by_id(uint id) {observe(10);event(id);change(10);}
int object_or_contents_has_type(void *p,ushort type) {assert(p==(void *)g_interact_target&&type==0x126);observe(11);change(11);type_result=mode==9||seed&1;return type_result ? 65536 : 0;}
void emit_noise_alert(ushort *p,byte noise) {assert(p==g_interact_target&&noise==0);if(type_result)assert(!(player[0x5e]&15));observe(12);change(12);}
void finalize_object_pickup(void *p) {assert(p==(void *)g_interact_target);observe(13);change(13);}
void attach_picked_up_object_to_cursor(ushort *p) {assert(p==g_interact_target&&g_cursor_holding_state==1);observe(14);change(14);}
void wait_for_click_release(int poll) {assert(poll==1);observe(15);change(15);}
#include "interaction_stack_functions.c"
struct result {byte records[sizeof records],player[sizeof player];unsigned calls[16];uint64_t events;uint state[6];};
static struct result run(unsigned reference)
{
    for(unsigned i=0;i<sizeof records;i++)((byte *)records)[i]=seed*(i+1)+i*37;
    for(unsigned i=0;i<sizeof player;i++)player[i]=seed+i*17;
    for(unsigned i=0;i<4;i++) {
        object(i)->type_flags=seed^(i*0xa5a5);object(i)->chain_word=seed^(i*0x5555);object(i)->link_word=seed^(i*0x5a5a);
        if(mode>=6) {object(i)->is_quant=mode!=12;object(i)->link=seed%510+2;}
        if(mode==10)object(i)->link=512+(seed&511);
        if(mode==11)object(i)->link=1;
        if(mode==13)object(i)->link=0;
        if(mode==2)object(i)->object_id=0x1ca;
    }
    g_interact_target=(ushort *)object(0);g_player_object=(uw_mobile_object_t *)object(3);DAT_002020b0=(char *)object(1);
    DAT_000858c4=seed;DAT_002020ec=mode<4 ? 0 : 1;DAT_002020e0=mode<2 ? 1 : 0;g_cursor_holding_state=seed;
    events=0;memset(calls,0,sizeof calls);split_result=NULL;rollback_target=NULL;type_result=0;
    if(reference)reference_interact_default();else interact_default();
    assert(calls[0]==1&&calls[1]==1);
    if(mode==6)assert(calls[6]==1&&!calls[8]);
    if(mode==8||mode==14||mode==15)assert(calls[9]==1);
    if(mode==13)assert(!calls[9]);
    if(calls[14])assert(g_cursor_holding_state==1&&calls[12]==1&&calls[13]==1);
    struct result r={0};memcpy(r.records,records,sizeof records);memcpy(r.player,player,sizeof player);memcpy(r.calls,calls,sizeof calls);r.events=events;
    uint state[]={index_of(g_interact_target),index_of(DAT_002020b0),(ushort)DAT_000858c4,DAT_002020ec,DAT_002020e0,g_cursor_holding_state};memcpy(r.state,state,sizeof state);return r;
}
int main(void)
{
    unsigned total=0;
    for(mutation=0;mutation<2;mutation++)for(mode=0;mode<16;mode++)for(seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if(memcmp(&expected,&actual,sizeof expected)) {fprintf(stderr,"interaction stack mismatch: mutation %u mode %u seed %u\n",mutation,mode,seed);return 1;}
        ++total;
    }
    for(unsigned m=0;m<2;m++)for(unsigned k=0;k<16;k++) {if(!coverage[m][k])fprintf(stderr,"unreached callback: mutation %u service %u\n",m,k);assert(coverage[m][k]);}
    printf("%u interaction cases preserve target rebinding, quantity overflow and pickup callbacks\n",total);
}

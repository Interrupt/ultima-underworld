#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[5][24];
static ushort root_link, *last_cursor, **live_cursor;
static uw_object_hdr_t *found_object, *last_freed;
static ushort freed_owner, found_chain, found_type, triggered_type;
static byte actor[16];
uw_mobile_object_t *g_player_object;
undefined2 DAT_002020a0, DAT_002020a4;
static short DAT_0024cfd0, DAT_0024cfd8;
static unsigned seed, mode, mutation, function, calls[7], coverage[2][7];
static uint64_t events;
static short count_arg;
static uw_object_hdr_t *object(unsigned i) { return (uw_object_hdr_t *)(records[i]+4); }
static void event(int value) { events=events*31+(uint)value; }
static unsigned slot(const void *p)
{
    for (unsigned i=0;i<5;i++) if (p==object(i)) return i;
    assert(0); return 0;
}
static unsigned cursor(const ushort *p)
{
    if (p==&root_link) return 100;
    for (unsigned i=0;i<5;i++) {
        if (p==&object(i)->chain_word) return i*2;
        if (p==&object(i)->link_word) return i*2+1;
    }
    assert(0); return 0;
}
static void observe(unsigned k)
{
    ++calls[k]; ++coverage[mutation][k]; event(k);
    assert(calls[6]<32);
    for (unsigned i=0;i<sizeof records;i++) event(((byte *)records)[i]);
    event(root_link); event((ushort)DAT_0024cfd0); event((ushort)DAT_0024cfd8);
    event(DAT_002020a0); event(DAT_002020a4);
    if (live_cursor) event(cursor(*live_cursor));
}
static void change(unsigned k)
{
    if (!mutation) return;
    object(0)->type_flags ^= 0x5555; object(0)->position_word ^= 0xaaaa;
    g_player_object=(uw_mobile_object_t *)object((k+seed)%5);
    DAT_002020a0 ^= 0x5555; DAT_002020a4 ^= 0xaaaa;
    if (live_cursor && (k==2 || k==3 || k==1)) {
        *live_cursor=&object(2)->chain_word; last_cursor=*live_cursor;
    }
    if (k==0 || k==2 || k==3 || k==1) {
        found_object->type_flags ^= (seed&1) ? 0x6800 : 0x6a00;
        found_object->chain_word ^= (seed&2) ? 0xa580 : 0xa5a5;
        found_object->link_word ^= 0x5a5a;
    }
}
uw_object_hdr_t *find_object_in_chain(ushort **p, int recurse, int cls, int sub, short quality)
{
    assert(*p==&object(0)->link_word && recurse==0 && cls==4);
    assert(sub==(function==0 ? 0 : 2)); assert(quality==(function==0 ? 15 : 0));
    live_cursor=p; found_object=object(mode==3 ? 0 : 1);
    observe(0); event(cursor(*p)); change(0);
    *p = &object(2)->link_word; last_cursor=*p;
    found_chain=found_object->chain_word; found_type=found_object->type_flags;
    return mode==4 ? NULL : found_object;
}
uint rand_below(int limit)
{
    assert(limit==10); observe(1); event(limit); change(1);
    static const uint results[6]={0,3,4,9,0x80000000U,0xffffffffU};
    return results[mode%6];
}
int roll_skill_check(int skill, int difficulty)
{
    assert(skill==-(int)count_arg || (count_arg==-32768 && skill==-32768));
    assert(difficulty==found_object->zpos*3);
    observe(2); event(skill); event(difficulty); change(2);
    return mode==9 ? 65535 : mode==5 ? 65537 : mode==7 ? -1 : 1;
}
void trigger_object_trap_or_use_action(void *a, void *p, int action, int x, short y)
{
    assert(a==actor && p==object(0) && action==6);
    assert(x==DAT_002020a0 && (ushort)y==DAT_002020a4);
    observe(3); event(action); event(x); event(y); change(3); triggered_type=found_object->type_flags;
}
void object_list_unlink(ushort *p, uw_object_hdr_t *obj)
{
    if (function!=2) assert(p==last_cursor && obj==found_object);
    observe(4); event(cursor(p)); event(slot(obj)); change(4);
    if (mutation) {
        obj->owner=seed^0x2d; obj->is_quant=1;
        obj->object_id^=0x155;
    }
}
void free_object_slot(uw_object_hdr_t *obj)
{
    observe(5); event(slot(obj)); change(5);
    if (mutation) {
        obj->owner=seed^0x36; obj->link=seed^0x155;
        obj->type_flags^=0xa5a5; obj->quality=seed^0x2b;
        if (function==2 && mode==12 && slot(obj)==1) obj->next=4;
    }
    if (function==2) { last_freed=obj; freed_owner=obj->owner; }
}
uw_object_hdr_t *resolve_object_link(ushort *p)
{
    if (last_freed) {
        /* The post-release write must clear the newly written link, while
           preserving the owner supplied by free_object_slot. */
        assert(last_freed->link==0 && last_freed->owner==freed_owner); last_freed=NULL;
    }
    observe(6); event(cursor(p));
    unsigned next=*p>>6;
    /* The fixture graph has two levels and no cycles. */
    assert(next<=4); return next ? object(next) : NULL;
}
#include "linked_object_functions.c"

struct result {
    byte records[sizeof records], actor[sizeof actor];
    unsigned calls[7]; uint64_t events;
    int value, cursor, player;
    ushort root, tag, remaining, x, y;
};
static void init(void)
{
    for (unsigned i=0;i<sizeof records;i++) ((byte *)records)[i]=seed*(i+1)+i*31;
    for (unsigned i=0;i<sizeof actor;i++) actor[i]=seed+i*17;
    for (unsigned i=0;i<5;i++) {
        object(i)->type_flags=seed^(i*0x5555);
        object(i)->position_word=seed^(i*0xaaaa);
        object(i)->chain_word=seed^(i*0xa5a5);
        object(i)->link_word=seed^(i*0x5a5a);
    }
    root_link=(1<<6)|(seed&63); object(0)->is_quant=mode==1;
    object(0)->link=mode==2 ? 0 : 1;
    found_object=object(mode==3 ? 0 : 1);
    found_object->is_quant=0;
    found_object->flags_res=seed>>9;
    found_object->quality=mode==5 || mode==6 ? 0 : seed&63;
    if (function==0) {
        if (mode>=5 && mode<=9) found_object->flags_res|=1;
        found_object->zpos=mode==6 || mode==7 ? 14 : mode==8 ? 15 : seed&127;
        count_arg= mode==5 || mode==8 ? -1 : mode==6 ? -30 : mode==7 ? -31 :
            mode==9 ? -32768 : mode==10 ? 1 : mode==11 ? 32767 : mode==12 ? 0 : seed&511;
        found_object->link=mode==10 ? 0 : count_arg&511;
        object(0)->object_id= mode==13 ? 0x148 : mode==14 ? 0x89 : mode==15 ? 0x8a : 0x40;
    }
    if (function==1 && mode==6) found_object->flags_res|=4;
    DAT_0024cfd0= mode==15 ? (short)seed : seed&1023;
    DAT_0024cfd8=(short)seed;
    if (function==2) {
        object(1)->object_id=mode==2 ? 0x1a0|(seed&15) : 0x40;
        object(1)->is_quant=mode==1; object(1)->link=mode==2 ? DAT_0024cfd0&1023 : 3; object(1)->next=2;
        object(2)->object_id=0x1a0|(seed&15); object(2)->is_quant=1; object(2)->link=DAT_0024cfd0&1023; object(2)->next=0;
        object(3)->object_id=0x1a0|((seed>>4)&15); object(3)->is_quant=1; object(3)->link=DAT_0024cfd0&1023; object(3)->next=4;
        object(4)->object_id=mode==4 ? 0x40 : 0x1a0|((seed>>8)&15); object(4)->is_quant=1; object(4)->link=DAT_0024cfd0&1023; object(4)->next=0;
    }
    DAT_002020a0=seed; DAT_002020a4=seed^0xa5a5;
    g_player_object=(uw_mobile_object_t *)object(0);
    memset(calls,0,sizeof calls); events=0; last_freed=NULL; live_cursor=NULL; last_cursor=NULL;
}
static struct result run(unsigned reference)
{
    init(); struct result r={0};
    if (function==0) {
        r.value=reference ? reference_check_object_combination(actor,(ushort *)object(0),count_arg) :
            check_object_combination(actor,(ushort *)object(0),count_arg);
        assert(r.value>=0 && r.value<=4);
        if (r.value==2) assert(found_object->type_flags==(found_type|0x200) && !calls[3]);
        if (r.value==3) {
            assert(calls[3]==1);
            if (!calls[5]) assert(found_object->type_flags==(triggered_type&0xfdff));
        }
    } else if (function==1) {
        if (reference) reference_consume_linked_special_object_charge(object(0));
        else consume_linked_special_object_charge(object(0));
        if (calls[0] && mode!=4 && (found_type&0x800) && (found_chain&63)) {
            assert(found_object->quality==((found_chain-1)&63));
            assert((found_object->chain_word&0xffc0)==(found_chain&0xffc0));
        }
    } else {
        if (reference) reference_purge_tagged_objects_from_chain(&root_link);
        else purge_tagged_objects_from_chain(&root_link);
        assert(!last_freed); assert(calls[6]>=1);
        assert(DAT_0024cfd8==(short)((short)seed-calls[5]));
    }
    memcpy(r.records,records,sizeof records); memcpy(r.actor,actor,sizeof actor); memcpy(r.calls,calls,sizeof calls);
    r.events=events; r.cursor=last_cursor ? cursor(last_cursor) : -1;
    r.player=slot(g_player_object); r.root=root_link; r.tag=DAT_0024cfd0; r.remaining=DAT_0024cfd8;
    r.x=DAT_002020a0; r.y=DAT_002020a4; live_cursor=NULL;
    return r;
}
int main(void)
{
    unsigned total=0;
    for (function=0;function<3;function++) for (mutation=0;mutation<2;mutation++)
      for (mode=0;mode<16;mode++) for (seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if (memcmp(&expected,&actual,sizeof expected)) {
            fprintf(stderr,"linked-object mismatch: function %u mutation %u mode %u seed %u\n",function,mutation,mode,seed); return 1;
        }
        total++;
      }
    for (unsigned m=0;m<2;m++) for (unsigned k=0;k<7;k++) {
        if (!coverage[m][k]) fprintf(stderr,"unreached callback: mutation %u service %u\n",m,k);
        assert(coverage[m][k]);
    }
    printf("%u linked-object cases preserve flags, quality, release ordering and live cursors\n",total);
}

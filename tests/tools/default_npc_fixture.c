#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[4][40],player[224],tile[8];
static uw_monster_type_props_t properties[2];
uw_mobile_object_t *DAT_0010190c,*g_player_object;
uw_monster_type_props_t *DAT_00101404;
char *DAT_00086df8=(char *)player;
byte DAT_00101918,DAT_001013f8,DAT_0010192c,DAT_00101930;
undefined1 DAT_00101934;
char DAT_0010194c,DAT_000853d0,DAT_0010143c,DAT_0010173c;
int DAT_00101940,DAT_00101430;
ushort DAT_00101900,DAT_00101910,DAT_0010141c;
static undefined4 DAT_00101920;
static byte DAT_00101738,DAT_001018fc,DAT_00101434,DAT_00101458;
static unsigned seed,mode,mutation,calls[20],coverage[2][20];
static uint64_t events;
static ushort last_position;
static byte last_flags;
static uw_mobile_object_t *speed_target,*heading_target,*pitch_target;
static byte speed_before,pitch_before;
static int first_random,second_random,third_random;
static ushort third_goal;
static uw_mobile_object_t *npc(unsigned n) {return (uw_mobile_object_t *)(records[n]+4);}
static void event(int v) {events=events*31+(uint)v;}
static void observe(unsigned k)
{
    ++calls[k];++coverage[mutation][k];event(k);
    for(unsigned i=0;i<sizeof records;i++)event(((byte *)records)[i]);
    for(unsigned i=0;i<sizeof properties;i++)event(((byte *)properties)[i]);
    event(DAT_0010190c==npc(1));event(DAT_00101404==&properties[1]);event(g_player_object==npc(2));
    event(DAT_00101920);event(DAT_001018fc);event(DAT_00101458);event(DAT_00101434);event(DAT_00101430);
}
static void remember(void) {last_position=DAT_0010190c->hdr.position_word;last_flags=DAT_0010190c->heading_flags;}
static void change(unsigned k)
{
    if(mutation) {
        DAT_0010190c=npc(DAT_0010190c==npc(0));DAT_00101404=&properties[DAT_0010190c==npc(1)];
        DAT_0010190c->hdr.position_word^=0xa55a;DAT_0010190c->heading_flags^=0xa0;
        DAT_0010190c->goal_word^=0x5a50;DAT_0010190c->full_heading^=0x55;
        DAT_0010190c->attack_pitch^=0xaa;DAT_0010190c->motion_flags^=0x55;
        DAT_0010190c->npc_ai_flags^=0x30;
        DAT_001018fc+=k*17;DAT_00101458^=0x55;DAT_00101430^=1;
        DAT_00101404->spell_flags^=1;
    }
    remember();
}
int play_positional_sound_effect(uint id,short x,short y,uint v) {observe(0);event(id);event(x);event(y);event(v);change(0);return -1;}
void npc_set_goal(byte goal,uint target) {observe(1);event(goal);event(target);change(1);DAT_0010190c->npc_goal=goal;DAT_0010190c->npc_gtarg=target;remember();}
void npc_set_walk_target(byte x,uint y,byte z) {observe(2);event(x);event(y);event(z);change(2);DAT_0010190c->npc_target_tile_x=x;DAT_0010190c->npc_target_tile_y=y;remember();}
uw_object_hdr_t *get_object_record_by_slot_index(short n)
{
    assert(n==(char)DAT_0010190c->damage_source);observe(3);event(n);change(3);
    return n<0 || mode==4 ? NULL : &npc(3)->hdr;
}
int refresh_npc_target_delta(void)
{
    if(mode==1 && DAT_0010190c->damage_source==1)assert(DAT_0010190c->npc_gtarg==1);
    observe(4);change(4);return mode==4 || mode==8 ? 0 : 65536;
}
byte tile_is_no_magic(int x,int y) {assert(x==DAT_00101918&&y==DAT_001013f8);observe(5);event(x);event(y);change(5);return mode==5;}
int check_npc_morale_flee(uint maxhp,uint hp,uint margin,uint damage)
{
    assert(maxhp==DAT_00101404->max_hp&&hp==DAT_0010190c->npc_hp&&margin==(DAT_00101404->morale_flags&15)&&damage==DAT_0010190c->recent_damage);
    observe(6);event(maxhp);event(hp);event(margin);event(damage);change(6);return mode&1;
}
void *tilemap_lookup(short x,short y) {assert(x==DAT_0010143c&&y==DAT_0010173c);observe(7);event(x);event(y);change(7);tile[0]^=0x55;return tile;}
void npc_walk_toward_tile(uint x,char y,byte h) {assert(x==(uint)(int)DAT_0010143c&&y==DAT_0010173c&&h==((tile[0]>>4)&15));observe(8);event(x);event(y);event(h);change(8);}
#define HANDLER(name,k) void name(void) {observe(k);change(k);}
HANDLER(npc_idle_behavior_tick,9)
HANDLER(npc_combat_approach_tick,10)
HANDLER(npc_clear_special_goal,11)
HANDLER(npc_combat_engage_close_tick,12)
HANDLER(npc_combat_position_tick,13)
HANDLER(npc_notice_and_idle_tick,14)
HANDLER(npc_wander_return_home_tick,15)
HANDLER(npc_combat_engage_wide_tick,16)
HANDLER(npc_combat_disengage_tick,17)
HANDLER(npc_wander_return_home_exact_tick,18)
long ce_rand(void)
{
    if(calls[19]==1)assert(speed_target->motion_flags==((speed_before&0x80)|((first_random%2)&0x7f)));
    if(calls[19]==2)assert(heading_target->full_heading==(byte)(second_random%256));
    observe(19);change(19);
    int value=mode==7 ? -1 : mode==11 ? -2 : mode==15 ? -32768 : (short)(seed*37);
    if(calls[19]==1) {speed_target=DAT_0010190c;speed_before=speed_target->motion_flags;first_random=value;}
    if(calls[19]==2) {heading_target=DAT_0010190c;second_random=value;}
    if(calls[19]==3) {pitch_target=DAT_0010190c;pitch_before=pitch_target->attack_pitch;third_goal=pitch_target->goal_word;third_random=value;}
    return value;
}
#include "default_npc_functions.c"
struct result {
    byte records[sizeof records],properties[sizeof properties],player[sizeof player],tile[sizeof tile];
    uint state[22];unsigned calls[20];uint64_t events;
};
static struct result run(unsigned reference)
{
    for(unsigned i=0;i<sizeof records;i++)((byte *)records)[i]=seed*(i+1)+i*37;
    for(unsigned i=0;i<sizeof player;i++)player[i]=seed+i*31;
    for(unsigned i=0;i<sizeof tile;i++)tile[i]=seed+i;
    memset(properties,0,sizeof properties);
    for(unsigned i=0;i<2;i++) {
        properties[i].category=(seed%6)+1;properties[i].movement_flags=mode==0 ? 2 : 0;
        properties[i].race_flags=0x13;properties[i].awareness_ranges=0xff;
        properties[i].spell_flags=mode&1;properties[i].max_hp=seed;properties[i].morale_flags=seed&15;
    }
    for(unsigned i=0;i<4;i++) {
        npc(i)->goal_word=seed;npc(i)->hdr.position_word=seed^(i*0xa5a5);
        npc(i)->motion_flags=seed>>8;npc(i)->full_heading=seed;npc(i)->heading_flags=seed^0xaa;
        npc(i)->animation_flags=mode==9 ? 0 : 0x2c;npc(i)->npc_ai_flags=(seed&0x7f);
        if(mode==1)npc(i)->npc_ai_flags=0;
        npc(i)->damage_source=mode==1 ? 1 : mode==2 ? 2 : mode==3 ? 0x80 : mode==4 ? 3 : seed>>8;
    }
    npc(3)->npc_ai_flags=0x40; /* Preserve the unclassified source's exact byte test. */
    DAT_0010190c=npc(0);DAT_00101404=&properties[0];g_player_object=npc(2);
    DAT_00101918=seed&63;DAT_001013f8=(seed>>6)&63;DAT_0010192c=DAT_00101918;DAT_00101930=DAT_001013f8;
    DAT_00101934=seed;DAT_0010194c=2;DAT_000853d0=0x13;DAT_00101738=3;
    DAT_00101940=0;uint clock=mode==10 ? 1024 : 1;memcpy(player+0xce,&clock,4);
    DAT_0010143c=seed;DAT_0010173c=seed>>8;DAT_00101900=mode==6 ? 2 : 10;
    DAT_00101910=seed;DAT_0010141c=seed>>8;DAT_00101920=seed;
    DAT_001018fc=seed>>4;DAT_00101458=seed>>8;DAT_00101434=seed>>8;DAT_00101430=mode&1;
    events=0;memset(calls,0,sizeof calls);remember();
    if(reference)reference_npc_ai_default_tick();else npc_ai_default_tick();
    unsigned any_calls=0;for(unsigned k=0;k<20;k++)any_calls+=calls[k];
    if(!any_calls)last_flags&=0xdf;
    unsigned full=((last_position>>7)&7)*32+(last_flags&31);
    unsigned delta=(full-DAT_001018fc+256)&255;
    if(delta>31&&delta<225)full=(DAT_001018fc+(delta<128 ? 32 : 224))&255;
    assert(DAT_0010190c->hdr.position_word==((last_position&0xfc7f)|((full&0xe0)<<2)));
    assert(DAT_0010190c->heading_flags==((last_flags&0xe0)|(full&31)));
    if(calls[19]) {
        assert(calls[19]==3);
        assert(pitch_target->attack_pitch==((pitch_before&7)|((third_random%3+15)<<3)));
        assert(pitch_target->goal_word==((third_goal&0xfff)|((((third_goal>>12)+1)%4)<<12)));
    }
    struct result r={0};memcpy(r.records,records,sizeof records);memcpy(r.properties,properties,sizeof properties);
    memcpy(r.player,player,sizeof player);memcpy(r.tile,tile,sizeof tile);memcpy(r.calls,calls,sizeof calls);r.events=events;
    uint state[]={DAT_0010190c==npc(1),DAT_00101404==&properties[1],DAT_00101918,DAT_001013f8,DAT_0010192c,DAT_00101930,
        DAT_00101934,(byte)DAT_0010194c,(byte)DAT_000853d0,(byte)DAT_0010143c,(byte)DAT_0010173c,(uint)DAT_00101940,
        DAT_00101430,DAT_00101900,DAT_00101910,DAT_0010141c,DAT_00101920,DAT_00101738,DAT_001018fc,DAT_00101434,DAT_00101458,0};
    memcpy(r.state,state,sizeof state);return r;
}
int main(void)
{
    unsigned total=0;
    for(mutation=0;mutation<2;mutation++)for(mode=0;mode<16;mode++)for(seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if(memcmp(&expected,&actual,sizeof expected)) {fprintf(stderr,"default NPC mismatch: mutation %u mode %u seed %u\n",mutation,mode,seed);return 1;}
        ++total;
    }
    for(unsigned m=0;m<2;m++)for(unsigned k=0;k<20;k++) {if(!coverage[m][k])fprintf(stderr,"unreached callback: mutation %u service %u\n",m,k);assert(coverage[m][k]);}
    printf("%u default NPC cases preserve heading limits, signed random fields and live object state\n",total);
}

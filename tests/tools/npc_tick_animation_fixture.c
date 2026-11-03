#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[3][40],tile[8];
uw_mobile_object_t *DAT_0010190c;
uw_monster_type_props_t g_monster_type_props[64],*DAT_00101404;
uw_object_type_props_t g_object_type_props[512];
uw_ranged_type_props_t g_ranged_type_props[16];
undefined2 DAT_002048c0_backing[64],DAT_00204990_backing[16],DAT_002049b0_backing[16];
undefined1 DAT_002048f0_backing[128],DAT_00204950_backing[128],DAT_00204980_backing[32];
#define DAT_002048f0 DAT_002048f0_backing[0]
#define DAT_00204950 DAT_00204950_backing[0]
char *DAT_00101438;
void *DAT_0010172c;
undefined4 DAT_00101924,DAT_0010191c,DAT_001013fc,DAT_00101560,DAT_00101914,DAT_00101944,DAT_00101734_backing[1];
byte DAT_00101918,DAT_001013f8,DAT_0010140c;
char DAT_0010143c,DAT_0010173c;
short DAT_00101938,DAT_0010193c,DAT_0010144c,DAT_00101454,DAT_00202a3c;
ushort DAT_00101910,DAT_0010141c,DAT_00101414,DAT_000853b8;
int DAT_00101430;
static byte DAT_00101738,DAT_00101458,DAT_001018fc,DAT_00101434,DAT_00101730,attack_table[32];
#define DAT_000853d8 attack_table[0]
static unsigned seed,mode,mutation,calls[22],coverage[2][22];
static uint64_t events;
static ushort last_goal;
static byte last_movement,last_attack;
static uint random_value;
static uw_mobile_object_t *npc(unsigned n) {return (uw_mobile_object_t *)(records[n]+4);}
static void event(int v) {events=events*31+(uint)v;}
static int profile_index(const void *p)
{
    if(!p)return -1;if(p==DAT_00204980_backing)return 0;
    if(p==DAT_00204990_backing)return 1;if(p==DAT_002049b0_backing)return 2;assert(0);return 0;
}
static int snapshot_index(const void *p)
{
    if(!p)return -1;if(p==DAT_002048c0_backing)return 0;
    if(p==DAT_002048f0_backing)return 1;if(p==DAT_00204950_backing)return 2;assert(0);return 0;
}
static void observe(unsigned k)
{
    ++calls[k];++coverage[mutation][k];event(k);
    for(unsigned i=0;i<sizeof records;i++)event(((byte *)records)[i]);
    event(DAT_0010190c==npc(1));event(DAT_00101404 ? DAT_00101404-g_monster_type_props : -1);
    event(snapshot_index(DAT_0010172c));event(profile_index(DAT_00101438));
    event(DAT_00101918);event(DAT_001013f8);event(DAT_00101924);event(DAT_00101734);event(DAT_000853b8);
}
static void change(unsigned k)
{
    if(mutation) {
        DAT_0010190c=npc(DAT_0010190c==npc(0));
        DAT_0010190c->goal_word^=(k==6 || (k>=14&&k<=16) || k==21) ? 0xa555 : 0x5a0;
        DAT_0010190c->hdr.position_word^=0xa55a;
        DAT_0010190c->movement_flags^=0xb0;
        DAT_0010190c->attack_pitch^=3;
        DAT_0010190c->full_heading^=0x55;
        DAT_00101404=&g_monster_type_props[DAT_0010190c->hdr.object_id&63];
        DAT_00101404->poison_damage^=0x5a;
        if(DAT_00101438)DAT_00101438[k%8]^=0x20;
    }
    last_goal=DAT_0010190c->goal_word;last_movement=DAT_0010190c->movement_flags;last_attack=DAT_0010190c->attack_pitch;
}
int encode_object_slot_index(const uw_object_hdr_t *p) {assert((void *)p==DAT_0010190c);observe(0);change(0);return (short)(seed^0xaaaa);}
uw_object_hdr_t *get_object_record_by_slot_index(short n) {assert(n==1);observe(1);change(1);return &npc(mode==10 ? 1 : 2)->hdr;}
void build_object_placement_snapshot(ushort *p,byte *snapshot)
{
    assert((void *)p==DAT_0010190c && (void *)snapshot==DAT_0010172c);observe(2);
    memcpy(snapshot,p,27);change(2);
}
int build_collision_height_field_for_object(ushort *p) {assert((void *)p==DAT_0010190c);observe(3);change(3);return seed;}
int apply_placement_collision_sweep(void *p,void *flags) {assert(p==DAT_0010172c && flags==DAT_00101438);observe(4);((byte *)p)[40]^=0x55;change(4);return 1;}
int sync_object_tile_position(ushort *p,void *snapshot) {assert((void *)p==DAT_0010190c && snapshot==DAT_0010172c);observe(5);change(5);return 65536;}
void npc_ai_default_tick(void) {observe(6);change(6);}
int resolve_unique_npc_special_behavior(void *p,int kind) {assert(p==DAT_0010190c && kind==1);observe(7);change(7);return 0;}
void *tilemap_lookup(short x,short y) {assert(x==DAT_0010144c&&y==DAT_00101454);observe(8);event(x);event(y);change(8);return tile;}
void object_list_unlink(ushort *p,uw_object_hdr_t *obj) {assert((void *)p==tile+2 && (void *)obj==DAT_0010190c);observe(9);change(9);}
void spawn_creature_death_loot(ushort *p) {assert((void *)p==DAT_0010190c);observe(10);change(10);}
void drop_monster_loot(void *p,ushort gold,ushort item) {assert(p==DAT_0010190c && gold==(DAT_00101404->effects_flags>>5)&&item==((DAT_00101404->movement_flags>>2)&7));observe(11);event(gold);event(item);change(11);}
void drop_creature_inventory_on_death(void *p) {assert(p==DAT_0010190c);observe(12);change(12);}
void free_object_slot(uw_object_hdr_t *p) {assert((void *)p==DAT_0010190c);observe(13);change(13);}
int compute_vertical_aim_offset(short speed,int has) {observe(14);event(speed);event(has);change(14);return (short)(seed^0xa5a5);}
void spawn_npc_thrown_weapon(void *p,short subtype,short speed) {assert(p==DAT_0010190c && subtype>=0 && subtype<16 && speed==g_ranged_type_props[subtype].projectile_speed);observe(15);event(subtype);event(speed);change(15);}
void dispatch_tile_special_action(uint type,void *p,void *target) {assert(p==DAT_0010190c && !target);observe(16);event(type);change(16);}
byte get_current_music_track(void) {observe(17);change(17);return mode==7 ? (calls[17]==1 ? 5 : 8) : 1;}
void set_pending_music_track(byte t) {assert(t==6);observe(18);change(18);}
uint read_realtime_clock_units(void) {observe(19);change(19);return seed*37;}
long ce_rand(void) {observe(20);change(20);random_value=mode==7 ? 0xffffffff : seed*17;return (int)random_value;}
int resolve_npc_melee_attack(void *p,short value,byte strength,short style,short poison)
{
    assert(p==DAT_0010190c && value==(short)(random_value%9));
    assert(strength==attack_table[DAT_0010190c->npc_swing_charge*2]);
    assert(style==(DAT_0010190c->animation_flags&63)-1 && poison==(char)DAT_00101404->poison_damage);
    observe(21);event(value);event(strength);event(style);event(poison);change(21);return -1;
}
#include "npc_tick_animation_functions.c"
struct result {
    byte records[sizeof records],tile[sizeof tile],properties[sizeof g_monster_type_props],snapshots[384],profiles[96];
    uint globals[28];unsigned calls[22];uint64_t events;int value,profile,snapshot,npc,props;
};
static struct result run(unsigned reference)
{
    for(unsigned i=0;i<sizeof records;i++)((byte *)records)[i]=seed*(i+1)+i*37;
    for(unsigned i=0;i<sizeof tile;i++)tile[i]=seed+i;
    const byte states[16]={0,12,5,13,1,2,44,3,64,0,5,12,13,5,13,0xac};
    for(unsigned i=0;i<3;i++) {
        npc(i)->hdr.object_id=64+((seed+i*17)&63);npc(i)->goal_word=seed;
        npc(i)->hdr.position_word=seed^(i*0xa5a5);npc(i)->animation_flags=states[mode];
        npc(i)->npc_ai_flags=(seed&0xf3)|4;npc(i)->tile_word=seed;
        npc(i)->tile_x=mode==0&&i<2 ? 63 : i==2 ? 0 : 2;
        npc(i)->tile_y=mode==0&&i<2 ? 63 : i==2 ? 0 : 2;
        npc(i)->target_word=seed^0x5a5a;
        if(mode==8) {npc(i)->speed=0;npc(i)->attack_pitch=0x80|(seed&7);}
    }
    memset(g_monster_type_props,0,sizeof g_monster_type_props);
    for(unsigned i=0;i<64;i++) {
        g_monster_type_props[i].movement_flags=mode%3==0 ? 0x80 : mode%3==1 ? 0x40 : 0;
        g_monster_type_props[i].weapon_loot[0]=seed&31;g_monster_type_props[i].poison_damage=seed;
        g_monster_type_props[i].effects_flags=seed;
        for(unsigned j=0;j<3;j++)g_monster_type_props[i].spells[j]=seed+j;
        g_object_type_props[64+i].scale_flags=mode&4 ? 8 : 0;
    }
    for(unsigned i=0;i<128;i++) {((byte *)DAT_002048c0_backing)[i]=seed+i;DAT_002048f0_backing[i]=seed+i*17;DAT_00204950_backing[i]=seed+i*31;}
    for(unsigned i=0;i<32;i++) {DAT_00204980_backing[i]=seed+i;((byte *)DAT_00204990_backing)[i]=seed+i*7;((byte *)DAT_002049b0_backing)[i]=seed+i*13;attack_table[i]=i*7;}
    DAT_0010190c=npc(0);DAT_00101404=NULL;DAT_0010172c=NULL;DAT_00101438=NULL;
    DAT_00101918=seed;DAT_001013f8=seed>>8;DAT_0010140c=seed;DAT_0010143c=seed;DAT_0010173c=seed;
    DAT_00101938=DAT_0010193c=mode==0 ? 0 : 2;
    DAT_00101924=DAT_0010191c=DAT_001013fc=DAT_00101560=DAT_00101914=seed;DAT_00101734=seed;
    DAT_00101430=seed;DAT_00101944=seed;DAT_0010144c=seed;DAT_00101454=seed;DAT_00202a3c=seed;
    DAT_00101910=seed;DAT_0010141c=seed;DAT_00101414=seed;DAT_000853b8=seed;
    DAT_00101738=DAT_00101458=DAT_001018fc=DAT_00101434=DAT_00101730=seed;
    memset(calls,0,sizeof calls);events=0;struct result r={0};
    r.value=reference ? reference_npc_ai_tick() : npc_ai_tick();
    if(r.value) {
        unsigned far=1;for(unsigned k=2;k<22;k++)if(calls[k])far=0;
        unsigned phase=((last_movement&15)+(far ? 8 : (last_attack&7)))&15;
        assert(DAT_0010190c->movement_flags==((last_movement&0xf0)|phase));
        if(calls[15]||calls[16]||calls[21])assert(DAT_0010190c->goal_word==(last_goal&0xfff));
        else if(!far&&!calls[6])assert(DAT_0010190c->goal_word==((last_goal&0xfff)|((((last_goal>>12)+1)&15)<<12)));
    } else assert(calls[13]==1);
    memcpy(r.records,records,sizeof records);memcpy(r.tile,tile,sizeof tile);memcpy(r.properties,g_monster_type_props,sizeof g_monster_type_props);
    memcpy(r.snapshots,DAT_002048c0_backing,128);memcpy(r.snapshots+128,DAT_002048f0_backing,128);memcpy(r.snapshots+256,DAT_00204950_backing,128);
    memcpy(r.profiles,DAT_00204980_backing,32);memcpy(r.profiles+32,DAT_00204990_backing,32);memcpy(r.profiles+64,DAT_002049b0_backing,32);
    uint globals[]={DAT_00101924,DAT_0010191c,DAT_001013fc,DAT_00101560,DAT_00101914,DAT_00101944,DAT_00101734,
        DAT_00101918,DAT_001013f8,DAT_0010140c,(byte)DAT_0010143c,(byte)DAT_0010173c,(ushort)DAT_0010144c,(ushort)DAT_00101454,
        (ushort)DAT_00202a3c,DAT_00101910,DAT_0010141c,DAT_00101414,DAT_000853b8,DAT_00101738,DAT_00101458,DAT_001018fc,
        DAT_00101434,DAT_00101730,(uint)DAT_00101430,(ushort)DAT_00101938,(ushort)DAT_0010193c,random_value};
    memcpy(r.globals,globals,sizeof globals);memcpy(r.calls,calls,sizeof calls);r.events=events;r.profile=profile_index(DAT_00101438);r.snapshot=snapshot_index(DAT_0010172c);
    r.npc=DAT_0010190c==npc(1);r.props=DAT_00101404 ? DAT_00101404-g_monster_type_props : -1;return r;
}
int main(void)
{
    for(unsigned i=0;i<512;i++)g_object_type_props[i].height=i*13;
    for(unsigned i=0;i<16;i++)g_ranged_type_props[i].projectile_speed=i*17;
    unsigned total=0;
    for(mutation=0;mutation<2;mutation++)for(mode=0;mode<16;mode++)for(seed=0;seed<65536;seed++) {
        struct result expected=run(1),actual=run(0);
        if(memcmp(&expected,&actual,sizeof expected)) {fprintf(stderr,"NPC tick mismatch: mutation %u mode %u seed %u\n",mutation,mode,seed);return 1;}
        ++total;
    }
    for(unsigned m=0;m<2;m++)for(unsigned k=0;k<22;k++){if(!coverage[m][k])fprintf(stderr,"unreached callback: mutation %u service %u\n",m,k);assert(coverage[m][k]);}
    printf("%u NPC tick cases preserve frame wrapping, goal targets, phase and callback state\n",total);
}

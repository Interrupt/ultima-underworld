#include "src/headers/uw.h"
#include <assert.h>
#define DEBUG(...) ((void)0)
static _Alignas(8) byte records[4][40];
uw_mobile_object_t *g_player_object;
uw_object_type_props_t g_object_type_props[512];
undefined2 DAT_0023b848_backing[32];
undefined1 DAT_0023bb98_backing[256], DAT_00086e6c_backing[64];
byte DAT_0023b4a0;
char DAT_0023bb94;
int DAT_00087450, DAT_0008744c;
static _Alignas(2) byte sound_rows[256*5];
#define DAT_0023c2b0 sound_rows[0]
#define DAT_0023c2b1 sound_rows[1]
#define DAT_0023c2b2 sound_rows[2]
#define DAT_0023c2b3 sound_rows[3]
static unsigned seed,mode,which,calls[12],coverage[2][4][12];
static uint64_t events;
static short world_x,world_y;
static int expected_depth, expected_high, expected_phase, trap_applied,trap_refreshed,trap_unlocked;
static unsigned read16(const void *p) {const byte *b=p;return b[0]|b[1]*256u;}
static uw_object_hdr_t *object(unsigned n) {return (uw_object_hdr_t *)(records[n]+4);}
static void event(int v) {events=events*31+(uint)v;}
static void observe(unsigned k) {
    calls[k]++;coverage[mode&1][which][k]++;event(k);
    for(unsigned j=0;j<sizeof records;j++)event(((byte *)records)[j]);
    event(g_player_object== (uw_mobile_object_t *)object(1));
}
static void change(unsigned k) {
    if (!(mode&1))return;
    for(unsigned n=0;n<4;n++)for(unsigned j=0;j<27;j++) ((byte *)object(n))[j]^=(byte)(k*31+j*17+n+1);
    if(k&1)g_player_object=(uw_mobile_object_t *)object(g_player_object==(uw_mobile_object_t *)object(0)?1:0);
}
int integer_sqrt(int value) {
    const byte *p=(const byte *)g_player_object;
    int x=world_x-((read16(p+22)>>10)*8+((read16(p+2)>>13)&7));
    int y=world_y-(((read16(p+22)>>4)&63)*8+((read16(p+2)>>10)&7));
    assert((uint)value==(uint)(x*x+y*y));observe(0);event(value);change(0);
    return mode&2 ? 0 : (seed%61)+1;
}
divmod_result ordint_divmod(int d,int n) {assert(d!=0);observe(1);event(d);event(n);change(1);return(divmod_result){n/d,n%d};}
void heading_to_sine_cosine(uint h,short *s,short *c) {observe(2);event(h);*s=(short)seed;*c=(short)(seed^0xa55a);change(2);}
uint allocate_and_play_sound_channel(byte id,int module,int resource,byte note,uint flags,int extra) {
    observe(3);event(id);event(module);event(resource);event(note);event(flags);event(extra);change(3);return 0x80008080u+seed;
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot) {
    observe(4);event(slot);change(4);
    unsigned pos=read16((byte *)object(2)+2);
    int index=(short)(seed&7)*4;
    if ((((pos>>7)+DAT_0023b4a0*-2)&3)==0) {
        expected_depth=1;expected_high=(char)(&DAT_0023bb9a)[index];expected_phase=2;
    } else {
        expected_high=(char)(&DAT_0023bb99)[index];expected_phase=1;
        expected_depth=DAT_0023bb94==1 || (DAT_0023bb94!=2 && (g_current_view->view_x>>5)<expected_high);
    }
    return object(2);
}
void sprite_partition_step(int condition,short *out,short entry,short low,short high,short phase) {
    assert(condition==expected_depth && high==expected_high && phase==expected_phase);
    observe(5);event(condition);event(entry);event(low);event(high);event(phase);change(5);*out=high+condition+phase;
}
int object_ptr_in_arena(const uw_object_hdr_t *p) {assert(p==object(2));observe(6);change(6);return mode&2;}
uw_object_hdr_t *find_object_in_chain(ushort **cursor,int recurse,int cls,int sub,short quality) {
    assert(cursor && *cursor==(ushort *)((byte *)object(2)+6));assert(recurse==0&&cls==6&&sub==-1&&quality==-1);
    observe(7);change(7);return mode&2 ? NULL:object(3);
}
int apply_trap_or_link_effect(void *actor,void *obj,void *trap,int x,int y) {
    assert(actor==object(0)&&obj==object(2)&&trap==object(3));observe(8);event(x);event(y);trap_applied++;change(8);return -1;
}
void refresh_object_link_chain(void *link,void *trap) {assert(link==(byte *)object(2)+6&&trap==object(3));observe(9);trap_refreshed++;change(9);}
uint resolve_skill_gated_unlock_or_use(void *actor,void *obj,void *trap,ushort action) {
    assert(actor==object(0)&&obj==object(2)&&trap==object(3));observe(10);event(action);trap_unlocked++;change(10);return 0xffff;
}
#include "field_consumers.c"
static void setup(unsigned s,unsigned m,unsigned f) {
    seed=s;mode=m;which=f;events=0;memset(calls,0,sizeof calls);trap_applied=trap_refreshed=trap_unlocked=0;
    for(unsigned n=0;n<4;n++)for(unsigned j=0;j<40;j++)records[n][j]=s*(j+1)+n*31+j*17;
    for(unsigned n=0;n<4;n++) {object(n)->type_flags=s;object(n)->position_word=s;((uw_mobile_object_t *)object(n))->tile_word=s;}
    g_player_object=(uw_mobile_object_t *)object(0);
    for(unsigned j=0;j<512;j++)g_object_type_props[j].class_flags=(s+j)&3;
    for(unsigned j=0;j<sizeof sound_rows;j++)sound_rows[j]=j*37+s;
    for(unsigned j=0;j<256;j++)DAT_0023bb98_backing[j]=j*11+s;
    memset(DAT_00086e6c_backing,0,sizeof DAT_00086e6c_backing);g_current_view->view_x=(short)s;
    DAT_0023b4a0=s&7;DAT_0023bb94=(s>>3)&3;DAT_0023b848_backing[s&7]=s&255;
    DAT_00087450=(m&4)==0;DAT_0008744c=1;
    world_x=(short)((s*13)&1023);world_y=(short)((s*19)&1023);
}
static int execute(int reference) {
    switch(which) {
    case 0: return reference ? reference_play_positional_sound_effect(seed&255,world_x,world_y,seed) :play_positional_sound_effect(seed&255,world_x,world_y,seed);
    case 1: {short out=0x1234;if(reference)reference_sprite_partition_by_depth(seed&7,&out,seed);else sprite_partition_by_depth(seed&7,&out,seed);return out;}
    case 2: {
        int result=reference?reference_clear_object_temp_flag_callback((ushort *)object(2)):clear_object_temp_flag_callback((ushort *)object(2));
        return result;
    }
    case 3:
        if(reference)reference_trigger_object_trap_or_use_action(object(0),mode&4?NULL:object(2),mode&8?4:3,17,-19);
        else trigger_object_trap_or_use_action(object(0),mode&4?NULL:object(2),mode&8?4:3,17,-19);
        assert(trap_applied==trap_refreshed);return trap_applied+trap_unlocked;
    }
    abort();
}
int main(void) {
    unsigned total=0;
    for(unsigned s=0;s<65536;s++)for(unsigned m=0;m<16;m++)for(unsigned f=0;f<4;f++) {
        setup(s,m,f);int actual=execute(0);byte saved[sizeof records];memcpy(saved,records,sizeof records);
        unsigned counts[12];memcpy(counts,calls,sizeof calls);uint64_t hash=events;
        int player=g_player_object==(uw_mobile_object_t *)object(1);
        if(f==2 && !(m&1)) {
            unsigned cls=s&0x1c0;
            unsigned expected=!(m&2)&&cls!=0x140&&cls!=0x180&&g_object_type_props[s&511].class_flags!=2 ? s&0xfdff:s;
            assert(read16((byte *)object(2)+2)==expected);
            assert(read16(object(2))==s);
        }
        setup(s,m,f);assert(execute(1)==actual);assert(memcmp(saved,records,sizeof records)==0);
        assert(memcmp(counts,calls,sizeof calls)==0&&hash==events);
        assert(player==(g_player_object==(uw_mobile_object_t *)object(1)));total++;
    }
    const unsigned first[]={0,4,6,7},last[]={3,5,6,10};
    for(unsigned mutation=0;mutation<2;mutation++)for(unsigned k=0;k<4;k++)
        for(unsigned j=first[k];j<=last[k];j++)assert(coverage[mutation][k][j]>0);
    printf("%u complete field consumer comparisons passed\n",total);
}

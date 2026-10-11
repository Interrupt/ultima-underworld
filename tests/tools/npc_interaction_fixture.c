/* Independent byte expectations and service-boundary observations of real code. */
#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(4) byte arena[256], tile[4], stats[256];
char *DAT_00086df8 = (char *)stats;
uw_mobile_object_t *g_player_object = (uw_mobile_object_t *)arena;
uw_object_hdr_t *g_scratch_object_ptr;
uw_mobile_object_t *DAT_00100674;
ushort *DAT_00101958;
byte DAT_0010195c;
short DAT_00201b68;
undefined2 DAT_002020a0, DAT_002020a4;
uw_monster_type_props_t g_monster_type_props[64];
uw_object_type_props_t g_object_type_props[512];
static unsigned seed_value, scenario, kind, player_caster, variant_value;
static unsigned rng, random_calls, first_random, spawned, inserted, freed, talked, settled, message_id;
static unsigned projected_x, projected_y;
static byte spawned_bytes[27], initialized_bytes[27];
static uint64_t events;
static unsigned read16(const byte *p) { return p[0] + p[1] * 256u; }
static void write16(byte *p, unsigned v) { p[0] = v; p[1] = v >> 8; }
static void event(unsigned code) {
    events = events * 31 + code;
    for (unsigned j = 0; j < sizeof arena; ++j) events = events * 31 + arena[j];
}
long ce_rand(void) {
    rng = rng * 1664525u + 1013904223u;
    unsigned value = rng >> 16;
    if (!random_calls) first_random = value;
    ++random_calls; event(1); return value;
}
divmod_result ordint_divmod(int divisor, int dividend) { return (divmod_result){dividend/divisor, dividend%divisor}; }
void project_position_by_heading(int heading, short distance, void *x, void *y) {
    const byte *actor = arena + (player_caster ? 0 : 32);
    unsigned position = read16(actor + 2), tiles = read16(actor + 22);
    assert(read16(x) == ((tiles >> 10) * 8 + (position >> 13)));
    assert(read16(y) == (((tiles >> 4) & 63) * 8 + ((position >> 10) & 7)));
    int expected_heading = ((int)(actor[24] & 31) + (int)((position >> 2) & 0xe0) + (int)(first_random % 27) - 13) % 255;
    assert(heading == (expected_heading & 65535));
    assert(distance == (variant_value == 4 ? 12 : 9));
    event(100 + (unsigned)heading + distance * 65536u);
    projected_x = (seed_value & 63) * 8 + ((seed_value >> 6) & 7);
    projected_y = ((seed_value >> 3) & 63) * 8 + ((seed_value >> 9) & 7);
    write16(x, projected_x); write16(y, projected_y);
}
void *tilemap_lookup(short x, short y) { event(2 + (unsigned)(ushort)x * 65536u + (ushort)y); return kind == 0 && scenario == 1 ? NULL : tile; }
int create_scripted_trap_pair_at_tile(int x, int y, uint code) { assert(x == (int)(projected_x / 8) && y == (int)(projected_y / 8) && code == 9); event(3); return scenario & 1; }
int check_object_placement_clearance(short type, short ignore, short x, short y, short height, int mode, byte steps) {
    assert(x == projected_x && y == projected_y && height == (tile[0] >> 4) * 8);
    assert(ignore == 0 && mode == 1 && steps == 8); event(4 + (unsigned)(ushort)type); return scenario != 2;
}
uw_object_hdr_t *spawn_new_object(uint type, int region) {
    write16(arena + 64, (read16(arena + 64) & 0xfe00) | (type & 511));
    memcpy(spawned_bytes, arena + 64, 27); ++spawned;
    assert(region == (kind == 2 || variant_value == 4));
    event(5 + type * 256u + region); return (uw_object_hdr_t *)(arena + 64);
}
int init_monster_spawn_defaults(void) {
    assert(g_scratch_object_ptr == (uw_object_hdr_t *)(arena + 64));
    assert((read16(arena + 66) >> 13) == (projected_x & 7));
    assert(((read16(arena + 66) >> 10) & 7) == (projected_y & 7));
    event(6);
    for (unsigned j = 8; j < 27; ++j) arena[64 + j] = (seed_value >> (j & 7)) + j * 37;
    memcpy(initialized_bytes, arena + 64, 27);
    g_scratch_object_ptr = (uw_object_hdr_t *)(arena + 96); event(7); return 1;
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *object) {
    assert((byte *)link == tile + 2 && (byte *)object == arena + 64);
    byte expected[27]; memcpy(expected, variant_value == 4 ? initialized_bytes : spawned_bytes, 27);
    unsigned position = read16(spawned_bytes + 2);
    position = (position & 0x3ff) | ((projected_x & 7) << 13) | ((projected_y & 7) << 10);
    unsigned height = (tile[0] >> 4) * 8;
    if (variant_value == 4) {
        write16(expected + 22, (read16(expected + 22) & 15) | ((projected_y / 8) << 4) | ((projected_x / 8) << 10));
        if (seed_value & 1) height = (height + 128) / 2;
        if (player_caster) expected[25] |= 0x40;
        else {
            write16(expected + 13, read16(expected + 13) & 0x3fff); expected[25] |= 1;
            unsigned home = read16(arena + 22);
            write16(expected + 15, (read16(expected + 15) & 0xf000) | (home >> 10) | (((home >> 4) & 63) << 6));
        }
    } else write16(expected + 4, read16(expected + 4) | 63);
    write16(expected + 2, (position & 0xff80) | (height & 127));
    assert(memcmp(expected, arena + 64, 27) == 0);
    assert(g_scratch_object_ptr == (uw_object_hdr_t *)(arena + 192));
    ++inserted; event(8);
}
uw_object_hdr_t *settle_dropped_object(void *object, short x, short y, int force) {
    assert(object == arena + 64 && x == projected_x/8 && y == projected_y/8 && force == 1);
    ++settled; event(9); return object;
}
void print_scroll_message_by_id(uint id) { message_id = id; event(10 + id); }
int check_fine_line_of_sight(uint x, uint y, uint z, short sx, short sy, short sz) {
    event(11 + x + y * 31 + z * 131 + (unsigned)(ushort)sx * 17 + (ushort)sy * 23u + (ushort)sz * 37u);
    return scenario != 3;
}
int build_object_display_name(char *out, void *object, int article, int mode) {
    assert(object == arena + 128 && article == 1 && mode == 0);
    strcpy(out, "A creature"); event(12); return 1;
}
char *get_message_string(ushort id) { message_id = id; event(13 + id); return " hears noise."; }
char *ce_strcat(char *a, char *b) { return strcat(a,b); }
int message_scroll_print_wrapped(char *message) { assert(strcmp(message, "A creature hears noise.") == 0); event(14); return 0; }
void interact_talk_npc(void) {
    byte expected[27]; memcpy(expected, spawned_bytes, 27);
    expected[26] = 25; write16(expected + 13, read16(expected + 13) | 0xc000);
    write16(expected + 11, (read16(expected + 11) & 0xfff0) | 10);
    assert(memcmp(expected, arena + 64, 27) == 0);
    ++talked; g_scratch_object_ptr = (uw_object_hdr_t *)(arena + 96); event(15);
}
void free_object_slot(uw_object_hdr_t *object) { assert((byte *)object == arena + 64); ++freed; event(16); }
int babl_read_var_word(short index) {
    assert(1 <= index && index <= 3); event(17 + index);
    return index == 1 ? (int)(seed_value & 1) : index == 2 ? (int)seed_value : (int)((seed_value >> 8) & 3);
}
uw_object_hdr_t *resolve_object_link(ushort *link) {
    event(21 + (link == (ushort *)(tile + 2) ? 0 : 1));
    DAT_00100674 = (uw_mobile_object_t *)(arena + 96);
    if ((byte *)link == tile + 2) return (uw_object_hdr_t *)(arena + 128);
    if ((byte *)link == arena + 132) return (uw_object_hdr_t *)(arena + 160);
    assert((byte *)link == arena + 164); return NULL;
}

#include "interaction_functions.c"

static void setup(unsigned seed, unsigned mode, unsigned test, unsigned player, unsigned variant) {
    seed_value=seed; scenario=mode; kind=test; player_caster=player; variant_value=variant;
    rng=seed; random_calls=spawned=inserted=freed=talked=settled=message_id=0; events=0;
    unsigned state=seed+1;
    for (unsigned j=0; j<sizeof arena; ++j) { state=state*1664525u+1013904223u; arena[j]=state>>24; }
    memset(g_monster_type_props,0,sizeof g_monster_type_props); memset(g_object_type_props,0,sizeof g_object_type_props);
    for (unsigned j=0; j<64; ++j) { g_monster_type_props[j].max_hp=1; g_monster_type_props[j].movement_flags=seed&1?128:0; }
    memset(stats,0,sizeof stats); stats[0x2a]=2+(seed&7); stats[0x69]=(seed>>4)&3;
    tile[0]=seed; tile[1]=tile[2]=tile[3]=0; DAT_00201b68=1+(seed&3);
    g_scratch_object_ptr=(uw_object_hdr_t *)(arena+192);
    DAT_00100674=(uw_mobile_object_t *)(arena+32); DAT_00101958=(ushort *)(arena+32);
    DAT_002020a0=DAT_002020a4=20;
    DAT_0010195c=(byte[]){5,0x20,13,0x25}[seed&3];
    write16(arena+32,0x41); write16(arena+128,0x41); write16(arena+160,(seed&1)?0x42:0x41);
    write16(arena+34,seed); write16(arena+130,seed^0x3c00);
    write16(arena+141,seed); write16(arena+173,seed^0x5a5a);
    g_monster_type_props[1].race_flags = test==3 ? (seed>>8)&3 : (DAT_0010195c&31);
    if (mode==4) ++g_monster_type_props[1].race_flags;
    g_monster_type_props[1].awareness_ranges=0x70;
}

typedef struct { byte arena[256]; uint64_t events; unsigned rng,calls,scratch,speaker,result,message,spawned,inserted,freed,talked,settled; } result_t;
static result_t run(unsigned seed,unsigned mode,unsigned test,unsigned player,unsigned variant,int reference) {
    setup(seed,mode,test,player,variant); int returned=0; byte expected[256]; memcpy(expected,arena,sizeof arena);
    if (test==0) {
#ifdef REFERENCE_AVAILABLE
        if (reference) reference_cast_summon_or_spawn_effect(arena+(player?0:32),variant); else
#endif
        cast_summon_or_spawn_effect(arena+(player?0:32),variant);
        assert(spawned == (variant!=3 && mode!=1 && mode!=2)); assert(inserted==spawned);
        assert(settled==(spawned && variant!=4));
    } else if (test==1) {
        unsigned flags=arena[138], old=read16(arena+141), code=DAT_0010195c;
        int eligible=(g_monster_type_props[1].race_flags==(code&31)) && (!(flags&128)||(code&32)) && (code!=32||(flags&128)) && (code!=13||stats[0x69]<3) && mode!=3 && mode!=5;
        unsigned attitude=old>>14; if (attitude) --attitude;
        if (eligible) write16(expected+141,(old&0x3fff)|(attitude<<14));
#ifdef REFERENCE_AVAILABLE
        if (reference) returned=reference_alert_npc_to_noise_callback(mode==5?30:20,20,(ushort *)(arena+128)); else
#endif
        returned=alert_npc_to_noise_callback(mode==5?30:20,20,(ushort *)(arena+128));
        assert(returned==eligible && memcmp(expected,arena,sizeof arena)==0);
        if (eligible) assert(message_id==((attitude+0xe1)|0x200));
    } else if (test==2) {
#ifdef REFERENCE_AVAILABLE
        if (reference) reference_trigger_scripted_npc_conversation(); else
#endif
        trigger_scripted_npc_conversation();
        assert(spawned==1 && talked==1 && freed==1);
    } else {
        unsigned tiles=read16(arena+54), x=tiles>>10,y=(tiles>>4)&63,radius=seed&1;
        int traverses=(x+radius>=1 && y+radius>=1);
        for (unsigned offset=128;offset<=160;offset+=32)
            if (traverses && read16(arena+offset)==0x41 && !(arena[offset+10]&128) && g_monster_type_props[1].race_flags==((seed>>8)&3))
                write16(expected+offset+13,(read16(expected+offset+13)&0x3fff)|((seed&3)<<14));
        _Alignas(2) byte args[6]; write16(args,3);write16(args+2,2);write16(args+4,1);
#ifdef REFERENCE_AVAILABLE
        if (reference) reference_babl_builtin_set_race_attitude((char *)args+6); else
#endif
        babl_builtin_set_race_attitude((char *)args+6);
        assert(memcmp(expected,arena,sizeof arena)==0);
    }
    result_t out; memset(&out,0,sizeof out); memcpy(out.arena,arena,sizeof arena);
    out.events=events;out.rng=rng;out.calls=random_calls;out.scratch=(byte *)g_scratch_object_ptr-arena;
    out.speaker=(byte *)DAT_00100674-arena;out.result=returned;out.message=message_id;
    out.spawned=spawned;out.inserted=inserted;out.freed=freed;out.talked=talked;out.settled=settled;
    return out;
}
int main(void) {
    unsigned count=0;
    for (unsigned test=0;test<4;++test) for(unsigned seed=0;seed<(test==0?2048:65536);++seed)
        for(unsigned mode=0;mode<(test==0||test==1?6:test==3?2:1);++mode)
            for(unsigned player=0;player<(test==0?2:1);++player)
                for(unsigned variant=0;variant<(test==0?5:1);++variant) {
                    unsigned effective_mode = test==3 && mode ? 4 : mode;
                    result_t current=run(seed,effective_mode,test,player,variant,0);
#ifdef REFERENCE_AVAILABLE
                    result_t original=run(seed,effective_mode,test,player,variant,1);
                    assert(memcmp(&current,&original,sizeof current)==0);
#endif
                    ++count;
                }
    printf("NPC interactions: %u byte-oracle and service-boundary cases passed\n",count);
}

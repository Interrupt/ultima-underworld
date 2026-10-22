#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(4) byte arena[96], tiles[64*64*4], stats[256], expected[96];
uw_mobile_object_t *g_player_object;
_Alignas(4) undefined1 DAT_00204880_backing[128];
char *DAT_002029cc = (char *)tiles, *DAT_00086df8 = (char *)stats;
short DAT_00202080, DAT_00201c70, DAT_00202088;
undefined2 DAT_00201c78;
undefined4 DAT_000858a0;
static unsigned seed_value, scenario, changed_tile, frame_record, frame_ready, checked;
static uint64_t events;
static unsigned read16(const byte *p) { return p[0] | p[1]*256u; }
static void write16(byte *p, unsigned v) { p[0]=v; p[1]=v>>8; }
static void event(unsigned code) {
    events = events*31+code;
    for(unsigned j=0;j<sizeof arena;++j) events=events*31+arena[j];
    for(unsigned j=0;j<sizeof DAT_00204880_backing;++j) events=events*31+DAT_00204880_backing[j];
    events=events*31+(ushort)DAT_00201c70;
    events=events*31+DAT_00201c78;
    events=events*31+(ushort)DAT_00202080;
    events=events*31+((byte *)g_player_object-arena);
}
void object_list_unlink(ushort *link, uw_object_hdr_t *object) {
    assert((byte *)link >= tiles && (byte *)link < tiles+sizeof tiles);
    event(1); if(scenario&2) g_player_object=(uw_mobile_object_t *)(arena+32);
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *object) {
    assert((byte *)link >= tiles && (byte *)link < tiles+sizeof tiles);
    event(2); if(scenario&2) g_player_object=(uw_mobile_object_t *)(arena+64);
}
uint read_realtime_clock_units(void) {
    unsigned current=(byte *)g_player_object-arena;
    unsigned word=read16(expected+current+2);
    unsigned x=(ushort)DAT_00204880, y=(ushort)DAT_00204882, z=(ushort)DAT_00204884;
    write16(expected+current+2, (word&0x380) | ((x>>5&7)<<13) | ((y>>5&7)<<10) | (z>>3&127));
    if(changed_tile) write16(expected+current+22, (read16(expected+current+22)&15) | ((x>>8&63)<<10) | ((y>>8&63)<<4));
    assert(!memcmp(arena,expected,sizeof arena));
    event(3); if(scenario&4) g_player_object=(uw_mobile_object_t *)(arena+32);
    frame_record=(byte *)g_player_object-arena; frame_ready=1;
    return seed_value*37u;
}
static void check_post_clock(void) {
    assert(frame_ready);
    if(!checked) {
        unsigned word=read16(expected+frame_record+11);
        write16(expected+frame_record+11, (word&4095) | (((seed_value*37u>>6)&3)<<12));
        word=read16(expected+frame_record+2);
        write16(expected+frame_record+2, (word&0xfc7f) | (((ushort)DAT_00201c70>>13)<<7));
        expected[frame_record+24]=(expected[frame_record+24]&224) | (((ushort)DAT_00201c70>>8)&31);
        checked=1;
    }
    assert(!memcmp(arena,expected,sizeof arena));
}
int roll_skill_check(int skill,int difficulty) { check_post_clock(); event(100+skill+(uint)difficulty); return scenario&16?1:0; }
divmod_result ordint_divmod(int divisor,int dividend) { return (divmod_result){dividend/divisor,dividend%divisor}; }
int apply_typed_damage_to_object(uw_unaligned_word_t *target, uw_unaligned_word_t *attacker,int x,short y,byte damage,byte type) {
    check_post_clock(); assert((byte *)target==(byte *)g_player_object); event(200+damage); return 0;
}
int play_sound_effect_with_pan(uint sound,byte pan,uint volume) { check_post_clock(); event(300+sound+pan+volume); return 0; }
void set_locomotion_state(ushort mask,int flag) { check_post_clock(); event(400+mask+flag); }
#include "position_functions.c"
static uint64_t run(void (*function)(void)) {
    uint64_t hash=1;
    for(seed_value=0;seed_value<65536;++seed_value) {
      for(scenario=0;scenario<32;++scenario) {
        for(unsigned j=0;j<sizeof arena;++j) arena[j]=(seed_value>>(j&7))+j*31;
        for(unsigned j=0;j<sizeof DAT_00204880_backing;++j) DAT_00204880_backing[j]=(seed_value>>(j&7))+j*17;
        memcpy(expected,arena,sizeof arena);
        DAT_00204880=seed_value&0x3fff; DAT_00204882=(seed_value*17u)&0x3fff; DAT_00204884=seed_value;
        int tile=(DAT_00204880>>8)+(DAT_00204882>>8)*64;
        DAT_00202080=scenario&1?tile:(scenario&2?-1:(tile+1)%4096);
        changed_tile=DAT_00202080!=tile;
        DAT_00201c70=seed_value; DAT_00201c78=seed_value;
        _DAT_002048a1=seed_value^(scenario&8?0x5555:0);
        DAT_00202088=scenario&16?1:0;
        DAT_00204897=scenario&16?128:0;
        _DAT_002048a9=scenario&8?0x500:0;
        DAT_00204896=1; g_vertical_velocity=scenario&4?10:0;
        stats[0x32]=seed_value%30;
        g_player_object=(uw_mobile_object_t *)arena;
        DAT_000858a0=1;
        events=frame_ready=checked=0;
        function(); check_post_clock(); assert(DAT_000858a0==0);
        hash=hash*31+events;
        for(unsigned j=0;j<sizeof arena;++j) hash=hash*31+arena[j];
        for(unsigned j=0;j<sizeof DAT_00204880_backing;++j) hash=hash*31+DAT_00204880_backing[j];
        hash=hash*31+(ushort)DAT_00201c70; hash=hash*31+DAT_00201c78;
      }
    }
    return hash;
}
int main(void) {
    uint64_t hash=run(commit_player_move);
#ifdef REFERENCE_AVAILABLE
    assert(hash==run(reference_commit_player_move));
#endif
    printf("2,097,152 real movement cases preserve packed bytes and callback events: %llu\n",(unsigned long long)hash);
}

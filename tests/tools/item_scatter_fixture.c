#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(4) byte records[5][32], tile[4], player[32];
uw_mobile_object_t *g_player_object=(uw_mobile_object_t *)player;
char *g_selected_object;
undefined2 g_cursor_holding_state, DAT_002020a0, DAT_002020a4;
static unsigned seed, mode, mutation, attempts, placed, random_calls, discarded, messages, flags;
static uint64_t events;
static uw_object_hdr_t *object(unsigned i)
{ return (uw_object_hdr_t *)(records[i]+4); }
static void observe(unsigned kind)
{
    events=events*31+kind;
    for (unsigned i=0;i<sizeof records;++i) events=events*31+((byte *)records)[i];
    for (unsigned i=0;i<sizeof tile;++i) events=events*31+tile[i];
    for (unsigned i=0;i<sizeof player;++i) events=events*31+player[i];
    events=events*31+(g_selected_object!=NULL); events=events*31+g_cursor_holding_state;
}
void pop_cursor_icon(ushort flags_)
{
    assert(flags_==3); observe(1);
    g_selected_object=(char *)object(0); g_cursor_holding_state=0xaaaa;
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p==object(0)); observe(2);
    if (mutation) object(0)->type_flags ^= 0xfe00;
    return 257;
}
uw_object_hdr_t *find_object_by_encoded_slot_in_chain(ushort *link, int nested, int slot)
{
    assert((byte *)link==player+6 && nested==1 && slot==257);
    assert(g_selected_object==NULL && g_cursor_holding_state==0); observe(3);
    return mode==7 ? object(0) : NULL;
}
void print_scroll_message_by_id(uint id)
{ assert(id==0x84 || id==0x87); observe(4); events=events*31+id; ++messages; }
void *tilemap_lookup(short x, short y)
{
    assert(x==(short)DAT_002020a0 && y==(short)DAT_002020a4); observe(5);
    if (mutation) object(0)->position_word ^= 0xa5a5;
    return tile;
}
uint rand_below(int upper)
{
    assert(upper==2); observe(6); ++random_calls;
    if (mutation && attempts && attempts<=placed+1) {
        /* The next header copy and coordinate read use fresh source values;
           the clone type computation still uses the earlier captured ID. */
        object(0)->position_word ^= (ushort)(seed+random_calls*37);
        object(0)->chain_word ^= 0x5a5a;
        object(attempts)->type_flags ^= 0xfe00;
    }
    return (seed+random_calls)&1;
}
uw_object_hdr_t *spawn_new_object(uint type, int region)
{
    assert(type==1 && region==0 && attempts<4); observe(7); ++attempts;
    if (mode && mode<5 && mode==attempts) return NULL;
    if (mutation) object(0)->link_word ^= 0xffff;
    return object(attempts);
}
long ce_rand(void)
{
    observe(8);
    if (mutation) {
        object(attempts)->link_word ^= 0xaaaa;
        object(0)->position_word ^= 0x5555;
    }
    return seed;
}
int place_object_in_world(uint x, uint y, int z, void *p, short radius, int skip)
{
    assert(p==object(attempts) && radius==6 && skip==0);
    assert(x==object(0)->xpos+DAT_002020a0*8 && y==object(0)->ypos+DAT_002020a4*8);
    assert(z==object(0)->zpos); observe(9); ++placed;
    events=events*31+x; events=events*31+y; events=events*31+z;
    if (mutation) { object(0)->type_flags ^= 0x0080; object(attempts)->position_word ^= 0x3333; }
    return seed&1;
}
ushort *discard_misplaced_object(void *link, uw_unaligned_word_t *p, int skip)
{
    assert((byte *)link==tile+2 && p==(ushort *)object(0) && skip==1);
    observe(10); ++discarded; return p;
}
void set_pending_update_flags(ushort value)
{ assert(value==2); observe(11); flags|=value; }
#include "item_scatter_functions.c"

struct result {
    byte records[sizeof records], tile[sizeof tile], player[sizeof player];
    unsigned attempts, placed, random_calls, discarded, messages, flags;
    uint64_t events;
};
static struct result run(int reference)
{
    attempts=placed=random_calls=discarded=messages=flags=0; events=0;
    memset(records,0xa5,sizeof records); memset(tile,0x3c,sizeof tile); memset(player,0x5a,sizeof player);
    object(0)->type_flags=mode==10 ? seed : (seed&0xfe00)|(0x153+(seed&3));
    object(0)->position_word=seed; object(0)->chain_word=seed^0xaaaa; object(0)->link_word=seed^0x5555;
    g_selected_object=(char *)object(1); g_cursor_holding_state=(ushort)seed;
    DAT_002020a0=seed&63; DAT_002020a4=(seed>>6)&63;
    int clicked=mode==8 ? 0 : 1, confirmed=mode==9 ? 1 : 0;
    if (reference) reference_complete_use_item_scatter_spawn((short *)object(0),clicked,confirmed);
    else complete_use_item_scatter_spawn((short *)object(0),clicked,confirmed);
    assert(g_selected_object==NULL && g_cursor_holding_state==0);
    assert(attempts<=4 && placed<=attempts && discarded<=1 && (!discarded || flags==2));
    struct result result={0};
    memcpy(result.records,records,sizeof records); memcpy(result.tile,tile,sizeof tile); memcpy(result.player,player,sizeof player);
    result.attempts=attempts; result.placed=placed; result.random_calls=random_calls;
    result.discarded=discarded; result.messages=messages; result.flags=flags; result.events=events;
    return result;
}
int main(void)
{
    for (seed=0;seed<65536;++seed) for (mode=0;mode<11;++mode) for (mutation=0;mutation<2;++mutation) {
        struct result old=run(1), current=run(0);
        assert(!memcmp(old.records,current.records,sizeof records));
        assert(!memcmp(old.tile,current.tile,sizeof tile) && !memcmp(old.player,current.player,sizeof player));
        assert(old.attempts==current.attempts && old.placed==current.placed && old.random_calls==current.random_calls);
        assert(old.discarded==current.discarded && old.messages==current.messages && old.flags==current.flags && old.events==current.events);
    }
    puts("1441792 item-scatter cases preserve header copies, quantities, coordinates, callbacks and failed allocations");
    return 0;
}

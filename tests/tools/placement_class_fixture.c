/* Complete-function comparison with object mutations at every service boundary. */
#include "src/headers/uw.h"
#include <assert.h>
#define PLACEMENT_MUTATING 1
static _Alignas(8) byte arena[256];
char *DAT_002046c4 = (char *)arena + 128;
short DAT_0010144c, DAT_00101454;
uw_object_type_props_t g_object_type_props[512];
static ushort *current;
static unsigned mode, rng, calls;
static uint64_t events;
static void observe(unsigned kind) {
    events = events * 31 + kind;
    for (unsigned j=0;j<sizeof arena;j++) events=events*31+arena[j];
}
static void change(unsigned service) {
    if ((mode & (1u << service)) == 0) return;
    byte *p = (byte *)current;
    for (unsigned j=0;j<27;j++) p[j] ^= (byte)(j*37 + service*53 + 1);
}
int encode_object_slot_index(const uw_object_hdr_t *obj) {
    assert((const void *)obj == current); observe(0); change(0); calls++;
    return (int)((const byte *)obj-arena);
}
int physics_subtick_units(void) {observe(1);change(1);calls++;return mode & 8 ? 4 : 0;}
long ce_rand(void) {observe(2);change(2);calls++;rng=rng*1664525u+1013904223u;return rng>>16;}
#include "placement_functions.c"
static void setup(unsigned seed,unsigned m) {
    mode=m;rng=seed;calls=0;events=0;
    for(unsigned j=0;j<sizeof arena;j++) arena[j]=seed*(j+3)+j*29;
    current=(ushort *)(arena+((mode&16) ? 160 : 54));
    *current=(ushort)seed; current[1]=(ushort)(seed^0x5a5a);
    for(unsigned j=0;j<512;j++) {
        byte *p=(byte *)&g_object_type_props[j];
        for(unsigned k=0;k<sizeof g_object_type_props[j];k++)p[k]=(seed+j*13+k*7);
    }
    DAT_0010144c=seed&63;DAT_00101454=(seed>>6)&63;
    for(unsigned j=0;j<256;j++) {
        g_physics_vz_remainder[j].pitch=(((byte *)current)[20]>>3);
        g_physics_vz_remainder[j].remainder=(seed&127)-64;
    }
}
int main(void) {
    unsigned total=0;
    for(unsigned seed=0;seed<65536;seed++) for(unsigned m=0;m<32;m++) {
        byte actual[48],reference[48],saved[sizeof arena];
        for(unsigned j=0;j<48;j++)actual[j]=reference[j]=j*19+seed;
        setup(seed,m);build_object_placement_snapshot(current,actual);
        memcpy(saved,arena,sizeof arena);uint64_t hash=events;unsigned count=calls,random=rng;
        setup(seed,m);reference_build_object_placement_snapshot(current,reference);
        assert(memcmp(actual,reference,sizeof actual)==0);
        assert(memcmp(saved,arena,sizeof arena)==0);
        assert(hash==events && count==calls && random==rng);
        total++;
    }
    printf("%u complete placement comparisons with callback mutation passed\n",total);
}

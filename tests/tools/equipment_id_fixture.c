#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte records[2][48];
uw_mobile_object_t *g_player_object;
#include "equipment_id_blocks.c"

int main(void)
{
    unsigned total=0;
    for(unsigned offset=2;offset<=8;offset+=2)for(unsigned mode=0;mode<4;mode++)for(unsigned seed=0;seed<65536;seed++) {
        for(unsigned i=0;i<sizeof records;i++)((byte *)records)[i]=seed*(i+1)+i*37;
        unsigned target=mode==3;
        uw_object_hdr_t *p=(uw_object_hdr_t *)(records[target]+offset);
        p->type_flags=seed;
        g_player_object=mode==2 ? NULL : (uw_mobile_object_t *)(mode==1 ? records[1]+offset : (byte *)p);
        uw_mobile_object_t *saved_player=g_player_object;
        byte initial[sizeof records],expected[sizeof records],reference[sizeof records];
        memcpy(initial,records,sizeof records);memcpy(expected,records,sizeof records);
        bool writes=mode!=1&&mode!=2;
        ushort expected_type=writes ? (seed&0xfe00)|15 : seed;
        memcpy(expected+target*48+offset,&expected_type,2);
        ushort old_value=original_player_write(p);
        memcpy(reference,records,sizeof records);memcpy(records,initial,sizeof records);
        ushort new_value=converted_player_write(p);
        assert(old_value==new_value && new_value==(writes ? seed : 0xa55a));
        assert(!memcmp(reference,records,sizeof records) && !memcmp(expected,records,sizeof records));
        assert(g_player_object==saved_player);
        if(writes)assert(p->object_id==15 && (p->type_flags&0xfe00)==(seed&0xfe00));
        ++total;
    }
    printf("%u equipment ID block cases preserve full captures, header flags, aliases and neighboring bytes\n",total);
}

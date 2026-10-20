#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(8) byte records[3][40], tile_cells[16];
uw_mobile_object_t *g_player_object;
uw_object_type_props_t g_object_type_props[512];
char *DAT_002029cc=(char *)tile_cells;
short DAT_00202080,DAT_0010144c,DAT_00101454;
char s__SAVE0_lev_ark_000842fc[]="SAVE0/lev.ark";
static unsigned seed,mode,which,calls[15],coverage[2][2][15],expected_flags;
static uint64_t events;
static uw_object_hdr_t *object(unsigned n){return (uw_object_hdr_t *)(records[n]+4);}
static void event(int value){events=events*31+(uint)value;}
static void observe(unsigned k){
    calls[k]++;coverage[mode&1][which][k]++;event(k);
    for(unsigned j=0;j<sizeof records;j++)event(((byte *)records)[j]);
    event(g_player_object==(uw_mobile_object_t *)object(1));
    event(DAT_00202080);event(DAT_0010144c);event(DAT_00101454);
}
static void change(unsigned k){
    if(mode&1){
        for(unsigned n=0;n<3;n++)for(unsigned j=0;j<27;j++)((byte *)object(n))[j]^=(byte)(k*37+n*13+j+1);
        g_player_object=(uw_mobile_object_t *)object(g_player_object==(uw_mobile_object_t *)object(0)?1:0);
        DAT_0010144c=(seed+k)&63;DAT_00101454=(seed+k*3)&63;
    }
    if(which==0){
        if(k==0||k==1)DAT_00202080=mode&16?-1:(seed+k)&3;
        expected_flags=g_player_object->hdr.type_flags&0xfe3f;
    }
}
static unsigned fail_stage(void){return (mode>>1)%6;}
bool write_player_save_record(char *dir){assert(!dir);observe(0);change(0);return true;}
void free_player_inventory_chain(char *link){assert(link==(char *)&g_player_object->hdr.link_word);observe(1);change(1);}
void object_list_unlink(ushort *link,uw_object_hdr_t *obj){
    if(which==0){assert(link==(ushort *)(DAT_002029cc+DAT_00202080*4+2));assert(obj==&g_player_object->hdr);}
    else {assert(link==(ushort *)(tile_cells+2));assert(obj==object(0));}
    observe(2);change(2);
}
bool open_level_archive(void *handle,char *path){
    assert(path==s__SAVE0_lev_ark_000842fc);assert(DAT_00202080==-1);
    assert(g_player_object->hdr.type_flags==expected_flags);
    /* Open receives an uninitialized handle buffer and initializes all of it. */
    for(unsigned j=0;j<16;j++)((byte *)handle)[j]=seed+j*17;
    observe(3);change(3);return fail_stage()!=1;
}
static int archive_call(byte *handle,int level,unsigned k){
    observe(k);event(level);for(unsigned j=0;j<16;j++){event(handle[j]);handle[j]^=k*17+j;}
    change(k);return fail_stage()!=k-2;
}
int write_level_tilemap_to_archive(byte *handle,int level){return archive_call(handle,level,4);}
int write_level_quest_flags_to_archive(byte *handle,int level){return archive_call(handle,level,5);}
int save_automap_reveal_to_archive(byte *handle,int level){return archive_call(handle,level,6);}
byte close_level_archive(void *handle){observe(7);for(unsigned j=0;j<16;j++)event(((byte *)handle)[j]);change(7);return fail_stage()!=5;}
int load_player_save_record(char *dir){assert(!dir);observe(8);change(8);return -1;}
void *tilemap_lookup(short x,short y){assert(x==DAT_0010144c&&y==DAT_00101454);observe(9);event(x);event(y);change(9);return tile_cells;}
uw_object_hdr_t *alloc_object_slot(int region){assert(region==1);observe(10);change(10);return mode&2?NULL:object(2);}
void compute_object_placement_fields(void *obj,uint x,uint y){
    assert(obj==object(2));assert(x==(uint)(int)DAT_0010144c&&y==(uint)(int)DAT_00101454);
    observe(11);event(x);event(y);change(11);
}
void scheduler_relink_entry(void *dst,void *src){assert(dst==object(2)&&src==object(0));observe(12);change(12);}
void free_object_slot(uw_object_hdr_t *obj){assert(obj==object(0));observe(13);change(13);}
void object_list_insert_head(ushort *link,uw_object_hdr_t *obj){assert(link==(ushort *)(tile_cells+2)&&obj==object(2));observe(14);change(14);}
#include "save_relocation_functions.c"
static void setup(unsigned s,unsigned m,unsigned f){
    seed=s;mode=m;which=f;events=0;memset(calls,0,sizeof calls);
    for(unsigned n=0;n<3;n++)for(unsigned j=0;j<40;j++)records[n][j]=seed*(j+1)+n*31+j*17;
    for(unsigned n=0;n<3;n++){object(n)->type_flags=seed;object(n)->position_word=seed^0x5a5a;}
    for(unsigned n=0;n<512;n++)g_object_type_props[n].class_flags=(seed+n)&3;
    memset(tile_cells,0,sizeof tile_cells);g_player_object=(uw_mobile_object_t *)object(0);
    DAT_00202080=mode&16?-1:seed&3;DAT_0010144c=seed&63;DAT_00101454=(seed>>6)&63;
    expected_flags=g_player_object->hdr.type_flags&0xfe3f;
}
static int execute(int reference){
    if(which==0)return reference?reference_commit_level_to_save_slot((int)(short)seed):commit_level_to_save_slot((int)(short)seed);
    uw_object_hdr_t *result=reference?reference_reallocate_object_to_arena((ushort *)object(0)):reallocate_object_to_arena((ushort *)object(0));
    assert(!result||result==object(2));return result!=NULL;
}
int main(void){
    unsigned total=0;
    for(unsigned s=0;s<65536;s++)for(unsigned m=0;m<32;m++)for(unsigned f=0;f<2;f++){
        setup(s,m,f);int actual=execute(0);byte saved[sizeof records];memcpy(saved,records,sizeof records);
        if(f==1&&!(m&3)){
            assert(memcmp(object(0),object(2),8)==0);
            assert(((uw_mobile_object_t *)object(2))->hit_points==object(0)->quality);
        }
        unsigned counts[15];memcpy(counts,calls,sizeof calls);uint64_t hash=events;
        short tile=DAT_00202080,x=DAT_0010144c,y=DAT_00101454;
        int player=g_player_object==(uw_mobile_object_t *)object(1);
        setup(s,m,f);assert(execute(1)==actual);assert(memcmp(saved,records,sizeof records)==0);
        assert(memcmp(counts,calls,sizeof calls)==0&&hash==events);
        assert(tile==DAT_00202080&&x==DAT_0010144c&&y==DAT_00101454);
        assert(player==(g_player_object==(uw_mobile_object_t *)object(1)));total++;
    }
    for(unsigned mutation=0;mutation<2;mutation++){
        for(unsigned k=0;k<=8;k++)assert(coverage[mutation][0][k]>0);
        for(unsigned k=9;k<15;k++)assert(coverage[mutation][1][k]>0);
        assert(coverage[mutation][1][2]>0);
    }
    printf("%u complete save/relocation comparisons passed\n",total);
}

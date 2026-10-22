#include "game_fixture.h"
#include "unity.h"
#include "src/headers/uw.h"
#include <stdio.h>
#include <stdlib.h>
#include "throw_test_globals.h"
int uw_service_game_clock(uint64_t now_us);
void uw_reset_frame_pacing(void);
void movement_pacing_handler(void);
void tick_mobile_objects(char elapsed);
void thrown_count_steps(void);

/* Real throw, snapshot, physics sweep, tile relinking and landing.
   A flat floor and one optional wall are supplied at the map boundary. */
ushort arena[0x4000], held[4];
char character[256], game_mode[32];
int cursor_y, mobile_allocations, static_allocations, freed;
bool wall, bridge_fixture, real_angles;
byte bridge_heights[3];
int bridge_count;
ushort *thrown;
int thrown_steps, pacing_scheduler_ticks, pacing_movement_ticks, pacing_tick_flags_total;
int frame_number;
static byte active_mobile_list[1];
static int last_phase;
short fine(ushort *object, int offset)
{ short value; memcpy(&value, (byte *)object + offset, 2); return value; }
uw_object_hdr_t *alloc_object_slot(int mobile)
{
    if (mobile) { mobile_allocations++; return (uw_object_hdr_t *)((char *)arena + 0x4000 + 2 * 27); }
    static_allocations++;
    return (uw_object_hdr_t *)((char *)arena + 0x5b00 + 8);
}
void free_object_slot(uw_object_hdr_t *object)
{
    freed++;
    /* A stopped mobile record leaves the active mobile list, as in the real game. */
    if ((char *)object == (char *)arena + 0x4000 + 2 * 27) DAT_002046c8 = DAT_002046c0;
}
int encode_object_slot_index(const uw_object_hdr_t *object)
{
    return (char *)object < DAT_002046c4 ? ((char *)object-DAT_002046b8)/27
        : 256+((char *)object-DAT_002046c4)/8;
}
void *tilemap_lookup(short x, short y)
{ TEST_ASSERT_TRUE(x>=0 && x<64 && y>=0 && y<64); return (byte *)arena + (y*64+x)*4; }
uw_object_hdr_t *resolve_object_link(uw_link_word_t *head)
{
    unsigned slot=*head>>6;
    return !slot ? NULL : (uw_object_hdr_t *)(slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8);
}
uw_object_hdr_t *get_object_record_by_slot_index(short slot)
{ return (uw_object_hdr_t *)(slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8); }
void get_mouse_position(short *x, short *y) { *x=141; *y=cursor_y; }
long ce_rand(void) { return 0; }
void angle_to_screen_delta(uint heading, void *x_, void *y_)
{ short *x = (short *)x_; short *y = (short *)y_;
    if (real_angles) {
        /* The real table's convention: heading 0 faces +y, a quarter turn (0x4000) faces +x. */
        double angle = (ushort)heading * 6.283185307179586 / 65536.0;
        *x = (short)lround(sin(angle) * 32767.0);
        *y = (short)lround(cos(angle) * 32767.0);
        return;
    }
    /* Original fixed-point compass, cardinal headings used by this fixture. */
    switch ((ushort)heading) {
    case 0: *x=0; *y=32767; break;
    case 0x8000: *x=0; *y=-32768; break;
    case 0x4000: *x=-32768; *y=0; break;
    case 0xc000: *x=32767; *y=0; break;
    default: TEST_FAIL_MESSAGE("Unexpected non-cardinal heading");
    }
}
void collision_build_height_field(uint step_limit)
{
    DAT_002049d4 = wall && g_sweep_foot_pos[1]>=88 ? 0 : 4;
}
void collision_height_envelope(int mode, int collision)
{
    (void)mode;
    (void)collision;
    DAT_002049d6=0;
    DAT_002049d8=DAT_002049d9=wall && g_sweep_foot_pos[1]>=88 ? 128 : 0;
    DAT_002049dc=DAT_002049dd=DAT_002049de=0;
    if(bridge_fixture) {
        for(int i=0;i<bridge_count;i++) {
            byte *record=DAT_00202c38_backing+i*6;
            record[0]=bridge_heights[i]; /* top */
            record[1]=bridge_heights[i]-2; /* underside */
            *(ushort *)(record+2)=(300+i)<<6;
            *(short *)(record+4)=0; /* same tile */
            uw_unaligned_word_t *bridge=(uw_unaligned_word_t *)get_object_record_by_slot_index(300+i);
            bridge[0]=0x164;
            bridge[1]=bridge_heights[i]-2;
        }
        DAT_002049dc=bridge_count;
    }
}
void resolve_wall_slide_corner(void) { DAT_002049da=9; }
int check_object_drop_height(uw_unaligned_word_t *object, uw_unaligned_word_t *reference) { (void)object; (void)reference; return 1; }
int object_ptr_in_arena(const uw_object_hdr_t *object) { (void)object; return 1; }
int play_sound_effect_at_object(int sound_id, uw_unaligned_word_t *object, int volume_bias) { (void)sound_id; (void)object; (void)volume_bias; return 0; }
int play_sound_effect_with_pan(uint sound_id, byte pan, uint volume_bias) { (void)sound_id; (void)pan; (void)volume_bias; return 0; }
int apply_typed_damage_to_object(uw_unaligned_word_t *target, uw_unaligned_word_t *attacker, int tile_x, short tile_y, byte damage, byte damage_type) { (void)target; (void)attacker; (void)tile_x; (void)tile_y; (void)damage; (void)damage_type; return 0; }
int roll_object_destroy_chance(short base_chance, void *object) { (void)base_chance; (void)object; return 0; }
int spawn_scheduled_effect_object(uw_unaligned_word_t *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y) { (void)source_object; (void)effect_group; (void)delay; (void)animation_offset; (void)heading_adjust; (void)tile_x; (void)tile_y; return 0; }
void print_scroll_message_by_id(uint message_id) { (void)message_id;}
void set_pending_update_flags(ushort flags) { (void)flags;}
void spawn_effect_debris_burst(void *template, uint tile_x, int tile_y) { (void)template; (void)tile_x; (void)tile_y;}
void scheduler_relink_entry(void *new_object, void *old_object) { (void)new_object; (void)old_object;}
void set_ambient_bias_without_light(char light_level) { (void)light_level;}
int activate_area_hazard_object(uw_unaligned_word_t *hazard, uint tile_x, int tile_y, int damage) { (void)hazard; (void)tile_x; (void)tile_y; (void)damage; return 1; }
ushort *discard_misplaced_object(void *list, uw_unaligned_word_t *object, int destroy)
{
    if (!destroy) return object;
    object_list_unlink(list,(uw_object_hdr_t *)object);
    free_object_slot((uw_object_hdr_t *)object);
    return NULL;
}
uw_object_hdr_t *settle_dropped_object(void *object, short x, short y,
				       int mode) { return object; }
uw_object_hdr_t *reallocate_object_to_arena(uw_unaligned_word_t *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected reallocation during flight"); return NULL; }
void project_position_by_heading(int heading, short distance, void *x, void *y) { (void)heading; (void)distance; (void)x; (void)y; TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit) { (void)catalog_type; (void)ignore_slot; (void)position_x; (void)position_y; (void)height; (void)check_mode; (void)step_limit; return 1; }

int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile) { return 0; }
int resolve_collision_candidate_interaction(short contact, int slot)
{
    if(bridge_fixture && contact>=0) TEST_ASSERT_LESS_THAN_INT(bridge_count,contact);
    else TEST_ASSERT_EQUAL_INT(-1,contact);
    TEST_ASSERT_TRUE(slot==1 || slot==2);
    return 4;
}
void randomize_settled_snapshot_position(void *snapshot) { (void)snapshot;}
void object_list_append_tail(uw_link_word_t *link_field, uw_object_hdr_t *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias) { (void)sound_id; (void)world_x; (void)world_y; (void)volume_bias; return 0; }

bool apply_swim_wade_pose(ushort collision_mask) { (void)collision_mask; TEST_FAIL_MESSAGE("Unexpected water"); return false; }

/* The pieces of the real per-frame chain that are not part of the throw itself. */
void scheduler_tick(int elapsed) { (void)elapsed; pacing_scheduler_ticks++; }
int npc_ai_tick() { TEST_FAIL_MESSAGE("A thrown item is not an NPC"); return 0; }
void movement_tick(int elapsed, int tick_flags, int skip_npc_tick)
{
    (void)elapsed; (void)skip_npc_tick;
    pacing_movement_ticks++;
    pacing_tick_flags_total += (byte)tick_flags;
    /* The same gate the real movement_tick applies before the mobile object pass. */
    if (g_npc_tick_enabled != 0 && DAT_002020d0 == 0 && (short)tick_flags != 0)
        tick_mobile_objects(tick_flags);
}

void throw_fixture_reset(void)
{
    options_unset("player-no-bounce");
    memset(arena,0,sizeof arena); memset(held,0,sizeof held);
    memset(character,0,sizeof character); memset(game_mode,0,sizeof game_mode);
    memset(((byte *)g_object_type_props),0,sizeof g_object_type_props);
    memset(DAT_00204920_backing,0,sizeof DAT_00204920_backing);
    memset(DAT_00086998_backing,0,sizeof DAT_00086998_backing);
    memset(DAT_002049c8_backing,0,sizeof DAT_002049c8_backing);
    memset(DAT_002049a0_backing,0,sizeof DAT_002049a0_backing);
    DAT_00085a6c=(short *)game_mode; *(short *)(game_mode+16)=1;
    DAT_00086df8=character;
    DAT_002046b8=(char *)arena+0x4000; DAT_002046c4=(char *)arena+0x5b00;
    g_player_object = (uw_mobile_object_t *)(ushort *)(DAT_002046b8 + 27);
    ((ushort *)g_player_object)[0]=0x7f;
    ((ushort *)g_player_object)[1]=48 | (4<<13) | (4<<10);
    ((ushort *)g_player_object)[0xb]=(10<<10)|(10<<4);
    held[0]=0x80; held[2]=20;
    g_sweep_foot_pos=(short *)DAT_002049c8_backing;
    DAT_002049a8=collision_response_mobile_object;
    /* Use the real COMOBJ properties for the player and thrown sack. */
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
    DAT_000869a8_backing[0]=0; DAT_000869a8_backing[1]=0;
    DAT_000869a8_backing[4]=0; DAT_000869a8_backing[5]=0xc0;
    cursor_y=55; wall=bridge_fixture=real_angles=false; bridge_count=0;
    mobile_allocations=static_allocations=freed=0;
    thrown=NULL;
    thrown_steps=pacing_scheduler_ticks=pacing_movement_ticks=pacing_tick_flags_total=0;
    frame_number=0;
    active_mobile_list[0]=2; /* the thrown item's slot (launch() places it at arena slot 2) */
    DAT_002046c0=active_mobile_list; DAT_002046c8=active_mobile_list+1;
    g_npc_tick_enabled=1; DAT_002020d0=0; DAT_002020d4=0; DAT_000879ac=1;
    DAT_00201b64=DAT_00201c84=0; DAT_00201c90=0;
    DAT_0023bf54=0; DAT_0023bf58=0;
    DAT_00101928=DAT_00101948=0;
    uw_reset_frame_pacing();
    last_phase=0;
}
void throw_fixture_dispose(void) { options_unset("player-no-bounce"); options_unset("physics-fps"); }
void launch(void)
{
    TEST_ASSERT_EQUAL_UINT(1,drop_held_object_near_player(held,1));
    TEST_ASSERT_EQUAL_INT(1,mobile_allocations);
    TEST_ASSERT_EQUAL_INT(0,static_allocations);
    TEST_ASSERT_EQUAL_INT(1,freed); /* original inventory record */
    thrown=(ushort *)(DAT_002046b8+2*27);
    TEST_ASSERT_EQUAL_UINT16(0x80,thrown[0]&0x1ff);
}
void tick(void)
{ DAT_0010190c=(uw_mobile_object_t *)thrown; mobile_object_tick(); }

/* One main-loop pass per 60Hz game frame, as uw_pump_events() + dispatch_sticky_mode_handlers() run
   it: the game clock is serviced against a monotonic microsecond time (uw_service_game_clock), then
   the dungeon mode's always-sticky movement_pacing_handler bit (DAT_00085728) fires. */
void run_game_frame(void)
{
    frame_number++;
    uw_service_game_clock((uint64_t)frame_number * 1000000 / 60);
    movement_pacing_handler();
    DAT_00201c84 = 0;
    if (thrown && DAT_002046c8 != DAT_002046c0) thrown_count_steps();
}
/* Completed physics steps of the thrown item. Every successful mobile_object_tick advances the
   item's own tick phase (byte 0xa, low nibble) by its speed class (byte 0x14, low 3 bits) -- that is
   how tick_mobile_objects knows when the item has caught up with the game tick counter -- so the
   phase delta is an exact count of steps, however many sweep sub-steps each one subdivides into. */
void thrown_set_phase(int phase)
{
    ((byte *)thrown)[10] = (((byte *)thrown)[10] & 0xf0) | (phase & 0xf);
    last_phase = phase & 0xf;
}
void thrown_count_steps(void)
{
    int speed = ((byte *)thrown)[0x14] & 7, phase = ((byte *)thrown)[10] & 0xf;
    TEST_ASSERT_NOT_EQUAL_INT_MESSAGE(0, speed, "a speed class of 0 never advances its phase");
    thrown_steps += ((phase - last_phase) & 0xf) / speed;
    last_phase = phase;
}

#include "babl_vm_fixture.h"

/* These bytecode programs execute the production dispatcher and handlers.
   Expected values follow the ARM handlers at 0x1a1c8..0x1ae04. */
#define RUN_PROGRAM(...) do { const short code[] = {__VA_ARGS__}; babl_run(code, sizeof code / sizeof *code); } while (0)
void setUp(void) { babl_fixture_reset(); }
void tearDown(void) {}

static void test_opcode_add(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 1, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a+b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_multiply(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 2, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a*b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_subtract(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 3, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a-b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_divide(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 4, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(b ? a/b : -1), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_modulo(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 5, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(b ? a%b : -1), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_or(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 6, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(!!(a||b)), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_and(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 7, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(!!(a&&b)), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_greater(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 9, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a>b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_greater_equal(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 10, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a>=b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_less(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 11, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a<b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_less_equal(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 12, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a<=b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_equal(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 13, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a==b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_not_equal(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 14, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a!=b), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_array_index(void)
{
    const short inputs[] = {-32768, -17, -1, 0, 1, 5, 17, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++)
        for (unsigned j=0; j<sizeof inputs/sizeof *inputs; j++) {
            int a=inputs[i], b=inputs[j];
            RUN_PROGRAM(0x22, 0x16, a, 0x16, b, 33, 0x26);
            TEST_ASSERT_EQUAL_INT16((short)(a+b-1), babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
}

static void test_opcode_nops_and_exit(void)
{
    RUN_PROGRAM(0x22, 0, 0x22, 0x16, 23, 0x26);
    TEST_ASSERT_EQUAL_INT(23, babl_top());
    TEST_ASSERT_EQUAL_INT(5, babl_steps);
    TEST_ASSERT_EQUAL_INT(1, babl_saves);
    RUN_PROGRAM(0x22, 0x7fff);
    TEST_ASSERT_EQUAL_INT(2, babl_steps);
    TEST_ASSERT_EQUAL_INT(2, babl_saves);
    ((short *)DAT_000bbf80)[0] = 0;
    TEST_ASSERT_EQUAL_HEX32(0xffffffff, run_babl_bytecode_interpreter());
    TEST_ASSERT_EQUAL_INT(2, babl_saves);
}
static void test_opcode_not_and_negate(void)
{
    const short inputs[] = {-32768, -1, 0, 1, 32767};
    for (unsigned i=0; i<sizeof inputs/sizeof *inputs; i++) {
        RUN_PROGRAM(0x22, 0x16, inputs[i], 8, 0x26);
        TEST_ASSERT_EQUAL_INT(inputs[i] == 0, babl_top());
        RUN_PROGRAM(0x22, 0x16, inputs[i], 0x29, 0x26);
        TEST_ASSERT_EQUAL_INT16((short)-inputs[i], babl_top());
    }
}
static void test_opcode_absolute_and_relative_jumps(void)
{
    RUN_PROGRAM(0x22, 0xf, 5, 0x16, 99, 0x12, 3, 0x16, 88, 0x16, 42, 0x26);
    TEST_ASSERT_EQUAL_INT(42, babl_top());
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
}
static void test_opcode_conditional_branches(void)
{
    for (int opcode=0x10; opcode<=0x11; opcode++) {
        const short conditions[] = {-1, 0, 1};
        for (int i=0; i<3; i++) {
            RUN_PROGRAM(0x22, 0x16, conditions[i], opcode, 5,
                        0x16, 10, 0xf, 11, 0x16, 20, 0x26);
            int taken = opcode == 0x10 ? conditions[i] == 0 : conditions[i] != 0;
            TEST_ASSERT_EQUAL_INT(taken ? 20 : 10, babl_top());
            TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
        }
    }
}
static void test_opcode_backward_branch(void)
{
    babl_words[0] = 3;
    RUN_PROGRAM(0x22, 0x16, 0, 0x16, 0, 0x1f, 0x16, 1, 3, 0x20,
                0x16, 0, 0x1f, 0x11, -13, 0x15);
    TEST_ASSERT_EQUAL_INT(0, babl_words[0]);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf78);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf1c);
}
static void test_opcode_nested_call_and_return(void)
{
    RUN_PROGRAM(0x22, 0x13, 6, 0x16, 99, 0x26, 0x13, 10, 0x15, 0, 0x15);
    TEST_ASSERT_EQUAL_INT(99, babl_top());
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
    RUN_PROGRAM(0x22, 0x15);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf78);
    TEST_ASSERT_EQUAL_INT(2, babl_saves);
}
static void test_opcode_push_pop_swap(void)
{
    RUN_PROGRAM(0x22, 0x16, 123, 0x16, -456, 0x19, 0x18, 0x26);
    TEST_ASSERT_EQUAL_INT(-456, babl_top());
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
}
static void test_opcode_frame_and_variable_address(void)
{
    RUN_PROGRAM(0x22, 0x16, 7, 0x1a, 0x1c, 0x17, 3, 0x23,
                0x18, 0x1d, 0x1b, 0x18, 0x15);
    TEST_ASSERT_EQUAL_INT(69, DAT_000bbf1c); /* globals 64 + BP 2 + offset 3 */
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf78);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf2c);
}
static void test_opcode_reserve_and_release_stack(void)
{
    RUN_PROGRAM(0x22, 0x16, 4, 0x1e, 0x16, -2, 0x1e, 0x26);
    TEST_ASSERT_EQUAL_INT(2, DAT_000bbf78);
}
static void test_opcode_fetch_store_and_result_register(void)
{
    RUN_PROGRAM(0x22, 0x16, 3, 0x16, 127, 0x20, 0x16, 3, 0x1f,
                0x23, 0x18, 0x24, 0x26);
    TEST_ASSERT_EQUAL_INT(127, babl_words[3]);
    TEST_ASSERT_EQUAL_INT(127, babl_top());
    TEST_ASSERT_EQUAL_INT(127, DAT_000bbf1c);
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbf78);
}
static int native_calls;
static int native_sum(intptr_t top)
{
    native_calls++;
    TEST_ASSERT_EQUAL_PTR((short *)DAT_000bbf0c + 3, (void *)top);
    return ((short *)top)[-2] + ((short *)top)[-1];
}
static void test_opcode_builtin_call(void)
{
    native_calls = 0;
    babl_symbol(2, "sum", 7, 1, 0, 0x111);
    babl_register_builtin("sum", (void *)native_sum);
    RUN_PROGRAM(0x22, 0x16, -20, 0x16, 13, 0x16, 0, 0x14, 7, 0x26);
    TEST_ASSERT_EQUAL_INT(1, native_calls);
    TEST_ASSERT_EQUAL_INT(3, DAT_000bbf78); /* replaces reserved return slot */
    TEST_ASSERT_EQUAL_INT(-7, babl_top());
    TEST_ASSERT_EQUAL_INT(-7, DAT_000bbf1c);
    TEST_ASSERT_EQUAL_INT(7, DAT_000bbf08);
}
static void test_opcode_strings_and_output(void)
{
    for (int owned=0; owned<=1; owned++) {
        babl_expand_owned = owned;
        RUN_PROGRAM(0x22, 0x16, 1, 0x16, 2, 0x25, 0x26);
        TEST_ASSERT_EQUAL_INT(1, babl_top());
        RUN_PROGRAM(0x22, 0x16, 1, 0x16, 3, 0x25, 0x26);
        TEST_ASSERT_EQUAL_INT(0, babl_top());
        RUN_PROGRAM(0x22, 0x16, 1, 0x27, 0x16, 3, 0x28, 0x15);
        TEST_ASSERT_EQUAL_STRING("Hello", babl_speech);
        TEST_ASSERT_EQUAL_STRING("Goodbye", babl_reply);
        TEST_ASSERT_EQUAL_INT(0, DAT_000bbf78);
        TEST_ASSERT_EQUAL_INT(owned ? 6 : 0, babl_frees);
    }
}
static void test_variable_references_keep_native_pointer_width(void)
{
    TEST_ASSERT_EQUAL_PTR(&babl_words[4], (void *)babl_var_word_addr(4));
    *(short *)babl_var_word_addr(4) = -123;
    TEST_ASSERT_EQUAL_INT(-123, babl_read_var_word(4));
    babl_write_var_word(4, 42);
    TEST_ASSERT_EQUAL_INT(42, babl_words[4]);
    DAT_000bbf2c = 5;
    ((short *)DAT_000bbf0c)[3] = 789;
    TEST_ASSERT_EQUAL_INT(789, babl_read_frame_word(-2));
}
static void test_named_variables_and_defaults(void)
{
    babl_symbol(2, "npc_talkedto", 4, 1, 0x126, 0);
    babl_symbol(3, "events", 10, 3, 299, 0);
    babl_symbol(4, "names", 20, 2, 0x12a, 0);
    babl_symbol(5, "name", 30, 1, 0x128, 0);
    babl_words[4] = babl_words[10] = babl_words[11] = babl_words[12] = 9;
    babl_words[9] = babl_words[13] = 99;
    DAT_000bbf88 = 321;
    init_babl_variable_defaults();
    TEST_ASSERT_EQUAL_INT(0, babl_words[4]);
    TEST_ASSERT_EQUAL_INT(0, babl_words[12]);
    TEST_ASSERT_EQUAL_INT(321, babl_words[20]);
    TEST_ASSERT_EQUAL_INT(321, babl_words[21]);
    TEST_ASSERT_EQUAL_INT(321, babl_words[30]);
    short values[] = {1, 2, 3, 4}, readback[] = {-1, -1, -1, -1};
    babl_set_variable("events", (short *)values, 4);
    babl_get_variable("events", (short *)readback, 4);
    TEST_ASSERT_EQUAL_INT16_ARRAY(values, readback, 3);
    TEST_ASSERT_EQUAL_INT(-1, readback[3]);
    TEST_ASSERT_EQUAL_INT(99, babl_words[9]);
    TEST_ASSERT_EQUAL_INT(99, babl_words[13]);
    babl_set_variable("unknown", (short *)values, 1);
    babl_get_variable("unknown", (short *)readback, 1);
    TEST_ASSERT_EQUAL_INT(1, readback[0]);
}
static void set_quest(short index, short value)
{
    babl_words[2] = index; babl_words[3] = value;
    short args[] = {2, 3, 0};
    babl_builtin_set_quest((char *)(args + 2));
}
static int get_quest(short index)
{
    babl_words[2] = index;
    short args[] = {2, 0};
    return babl_builtin_get_quest((char *)(args + 1));
}
static void test_quest_flags_and_event_counters(void)
{
    for (int index=0; index<32; index++) {
        set_quest(index, 1);
        TEST_ASSERT_EQUAL_INT(1, get_quest(index));
    }
    for (int index=0; index<32; index++) {
        set_quest(index, 0);
        TEST_ASSERT_EQUAL_INT(0, get_quest(index));
        if (index < 31) TEST_ASSERT_EQUAL_INT(1, get_quest(index + 1));
    }
    for (int index=32; index<36; index++) {
        set_quest(index, 17 + index);
        TEST_ASSERT_EQUAL_INT(17 + index, get_quest(index));
    }
    TEST_ASSERT_EQUAL_INT(0, get_quest(-1));
    set_quest(-1, 1); set_quest(36, 1);
    DAT_00086df8[0x6d] = 77;
    TEST_ASSERT_EQUAL_INT(77, get_quest(36));
}
static int native_get_quest(intptr_t top) { return babl_builtin_get_quest((char *)top); }
static void test_event_changes_choose_expected_dialogue_branch(void)
{
    babl_symbol(2, "get_quest", 2, 1, 0, 0x111);
    babl_register_builtin("get_quest", (void *)native_get_quest);
    for (int state=0; state<2; state++) {
        set_quest(7, state);
        RUN_PROGRAM(0x22, 0x16, 2, 0x16, 0, 0x14, 2, 0x11, 7,
                    0x16, 1, 0x27, 0xf, 18, 0, 0x16, 3, 0x27, 0x18, 0x15);
        TEST_ASSERT_EQUAL_STRING(state ? "Goodbye" : "Hello", babl_speech);
        TEST_ASSERT_EQUAL_INT(0, DAT_000bbf78);
    }
}
static void test_filtered_menu_tracks_event_state_and_releases_wait(void)
{
    babl_words[10] = 4; babl_words[11] = 5; babl_words[12] = 0;
    babl_words[20] = 0; babl_words[21] = 1;
    short args[] = {20, 10, 0};
    TEST_ASSERT_EQUAL_INT(5, babl_fmenu((char *)(args + 2)));
    TEST_ASSERT_EQUAL_STRING("Leave", babl_reply);
    TEST_ASSERT_EQUAL_INT(0, DAT_0010078c);
    TEST_ASSERT_EQUAL_INT(0, DAT_00100790);
    TEST_ASSERT_EQUAL_INT(0, DAT_00250718);
    babl_words[20] = 1; babl_words[21] = 0;
    TEST_ASSERT_EQUAL_INT(4, babl_fmenu((char *)(args + 2)));
    TEST_ASSERT_EQUAL_STRING("Trade", babl_reply);
    TEST_ASSERT_EQUAL_INT(2, babl_frees);
}
static void test_menu_returns_choice_then_dialogue_continues(void)
{
    babl_symbol(2, "babl_menu", 2, 1, 0, 0x111);
    babl_register_builtin("babl_menu", (void *)babl_menu);
    babl_words[10] = 4; babl_words[11] = 5;
    RUN_PROGRAM(0x22, 0x16, 10, 0x16, 0, 0x14, 2, 0x18, 0x18,
                0x16, 3, 0x27, 0x15);
    TEST_ASSERT_EQUAL_STRING("Trade", babl_reply);
    TEST_ASSERT_EQUAL_STRING("Goodbye", babl_speech);
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbf1c); /* first entry's position; its string id is 4 */
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf78);
    TEST_ASSERT_EQUAL_INT(0, DAT_0010078c);
    TEST_ASSERT_EQUAL_INT(2, babl_frees);
}
static void test_barter_cleanup_returns_items_to_their_owners(void)
{
    for (int i=0; i<4; i++) {
        DAT_000bbfd0_backing[i] = i + 1;
        DAT_000bbfe8_backing[i] = i + 5;
    }
    end_barter_ui();
    TEST_ASSERT_EQUAL_INT(8, babl_drop_count);
    for (int i=0; i<4; i++) {
        TEST_ASSERT_EQUAL_PTR(babl_items[i+1], babl_dropped[i*2]);
        TEST_ASSERT_EQUAL_PTR(g_player_object, babl_drop_owner[i*2]);
        TEST_ASSERT_EQUAL_PTR(babl_items[i+5], babl_dropped[i*2+1]);
        TEST_ASSERT_EQUAL_PTR(DAT_00100674, babl_drop_owner[i*2+1]);
    }
}
static void test_barter_setup_uses_actual_npc_inventory_link(void)
{
    ((byte *)DAT_00100674)[14] = 0x10; /* loot already initialized */
    DAT_00100674->hdr.link_word = 1; /* byte offset 6 */
    babl_items[1][0] = 0x30; /* eligible item, nonzero value */
    *(short *)(((byte *)g_object_type_props) + 5 + 0x30 * 13) = 20;
    babl_builtin_setup_to_barter();
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbfe8_backing[0]);
    TEST_ASSERT_EQUAL_INT(0, DAT_00100674->hdr.link_word);
    TEST_ASSERT_EQUAL_INT(0, babl_loot_calls);
}

static void test_barter_preferences_use_word_arrays(void)
{
    babl_items[1][0] = 300;
    *(short *)(((byte *)g_object_type_props) + 5 + 300 * 13) = 20;
    babl_words[10] = 300; babl_words[11] = -1;
    babl_words[20] = -1;
    short args[] = {10, 20, 0};
    babl_builtin_set_likes_dislikes((char *)(args + 2));
    TEST_ASSERT_EQUAL_INT(1, (short)check_npc_item_preference(1));
    babl_words[10] = 1000 + (300 >> 4);
    TEST_ASSERT_EQUAL_INT(1, (short)check_npc_item_preference(1));
    babl_words[10] = -1;
    babl_words[20] = 300; babl_words[21] = -1;
    TEST_ASSERT_EQUAL_INT(-1, (short)check_npc_item_preference(1));
    babl_words[20] = -1;
    TEST_ASSERT_EQUAL_INT(0, (short)check_npc_item_preference(1));
}
static void test_declining_barter_restores_inventory_and_clears_slots(void)
{
    for (int i=0; i<4; i++) {
        DAT_000bbfe8_backing[i] = i+1;
        DAT_000bbff0_backing[i] = 1;
    }
    babl_builtin_do_decline();
    TEST_ASSERT_EQUAL_INT(4, DAT_00100674->hdr.link_word);
    for (int i=0; i<4; i++) {
        TEST_ASSERT_EQUAL_INT(0, DAT_000bbfe8_backing[i]);
        TEST_ASSERT_EQUAL_INT(0, DAT_000bbff0_backing[i]);
    }
    end_barter_ui();
    TEST_ASSERT_EQUAL_INT(0, babl_drop_count);
}
static void stage_offer(int player_value, int npc_value)
{
    DAT_000bbfd0_backing[0] = 1; DAT_000bbf98_backing[0] = 1;
    DAT_000bbfe8_backing[0] = 2; DAT_000bbff0_backing[0] = 1;
    (&DAT_000bbfb0)[0] = player_value;
    (&DAT_000bbfc8)[0] = npc_value;
    babl_items[1][0] = 0x30;
    *(short *)(((byte *)g_object_type_props) + 5 + 0x30 * 13) = 20;
    for (int i=0; i<5; i++) babl_words[10+i] = i+1;
}
static void test_accepted_offer_exits_barter_branch_and_continues_dialogue(void)
{
    stage_offer(100, 100);
    babl_symbol(2, "do_offer", 2, 1, 0, 0x111);
    babl_symbol(3, "end_barter", 3, 1, 0, 0x111);
    babl_register_builtin("do_offer", (void *)babl_builtin_do_offer);
    babl_register_builtin("end_barter", (void *)end_barter_ui);
    RUN_PROGRAM(0x22, 0x16, 10, 0x16, 11, 0x16, 12, 0x16, 13, 0x16, 14,
                0x16, 0, 0x14, 2, 0x10, 9, 0x14, 3,
                0x16, 3, 0x27, 0x1c, 0x16, -5, 0x1e, 0x15, 0x26);
    TEST_ASSERT_EQUAL_INT(1, DAT_000bc008);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbfd0_backing[0]);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bbf98_backing[0]);
    TEST_ASSERT_EQUAL_INT(1, DAT_00100674->hdr.link_word);
    TEST_ASSERT_EQUAL_INT(1, babl_drop_count);
    TEST_ASSERT_EQUAL_PTR(babl_items[2], babl_dropped[0]);
    TEST_ASSERT_EQUAL_STRING("Goodbye", babl_speech);
}
static void test_rejected_offer_remains_available_then_declines(void)
{
    stage_offer(50, 100);
    short args[] = {10, 11, 12, 13, 14, 0};
    TEST_ASSERT_EQUAL_INT(0, babl_builtin_do_offer((char *)(args+5)));
    TEST_ASSERT_EQUAL_INT(0, DAT_000bc008);
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbfd0_backing[0]);
    TEST_ASSERT_EQUAL_INT(2, DAT_000bbfe8_backing[0]);
    TEST_ASSERT_EQUAL_INT(9, DAT_000bc004);
    babl_builtin_do_decline();
    end_barter_ui();
    TEST_ASSERT_EQUAL_INT(1, babl_drop_count);
    TEST_ASSERT_EQUAL_PTR(g_player_object, babl_drop_owner[0]);
}
static void test_empty_offer_returns_failure_without_trading(void)
{
    stage_offer(100, 100);
    DAT_000bbf98_backing[0] = 0;
    short args[] = {10, 11, 12, 13, 14, 0};
    TEST_ASSERT_EQUAL_INT(0, babl_builtin_do_offer((char *)(args+5)));
    TEST_ASSERT_EQUAL_STRING("Leave", babl_speech);
    TEST_ASSERT_EQUAL_INT(0, DAT_000bc008);
    TEST_ASSERT_EQUAL_INT(0, DAT_00100674->hdr.link_word);
}

static void test_npc_events_survive_conversation_writeback_and_reentry(void)
{
    babl_bind_npc_variables();
    ((byte *)DAT_00100674)[8] = 25;
    ((byte *)DAT_00100674)[14] = 2 << 6;
    ((byte *)g_player_object)[8] = 30;
    DAT_00086df8[0x39] = 80;
    DAT_00086df8[0x37] = 15;
    sync_conv_vars_from_npc(DAT_00100674);
    TEST_ASSERT_EQUAL_INT(0, babl_named_word("npc_talkedto"));
    TEST_ASSERT_EQUAL_INT(2, babl_named_word("npc_attitude"));
    TEST_ASSERT_EQUAL_INT(25, babl_named_word("npc_hp"));
    TEST_ASSERT_EQUAL_INT(30, babl_named_word("play_hp"));
    short attitude = 1, experience = 10;
    babl_set_variable("npc_attitude", (short *)&attitude, 1);
    babl_set_variable("new_player_exp", (short *)&experience, 1);
    TEST_ASSERT_FALSE(sync_conv_vars_to_npc((char *)DAT_00100674));
    TEST_ASSERT_EQUAL_INT(10, babl_awarded_xp);
    TEST_ASSERT_EQUAL_INT(30, ((byte *)g_player_object)[8]);
    TEST_ASSERT_EQUAL_INT(80, DAT_00086df8[0x39]);
    TEST_ASSERT_EQUAL_INT(15, DAT_00086df8[0x37]);
    sync_conv_vars_from_npc(DAT_00100674);
    TEST_ASSERT_EQUAL_INT(1, babl_named_word("npc_talkedto"));
    TEST_ASSERT_EQUAL_INT(1, babl_named_word("npc_attitude"));
    TEST_ASSERT_EQUAL_INT(0, babl_named_word("new_player_exp"));
    /* Reseeding for a second conversation must not grant the old reward. */
    sync_conv_vars_to_npc((char *)DAT_00100674);
    TEST_ASSERT_EQUAL_INT(10, babl_awarded_xp);
}

static void test_menu_wait_ignores_invalid_selection_then_accepts_leave(void)
{
    babl_words[10] = 4; babl_words[11] = 5;
    babl_input_polls = 0; babl_invalid_first_choice = 1; babl_next_choice = 2;
    short args[] = {10, 0};
    /* babl_menu returns the chosen entry's 1-based position (not its string id, 5). */
    TEST_ASSERT_EQUAL_INT(2, babl_menu((char *)(args + 1)));
    TEST_ASSERT_EQUAL_INT(2, babl_input_polls);
    TEST_ASSERT_EQUAL_INT(0, DAT_0010078c);
    TEST_ASSERT_EQUAL_INT(0, DAT_00100790);
    TEST_ASSERT_EQUAL_INT(0, DAT_00250718);
    TEST_ASSERT_EQUAL_STRING("Leave", babl_reply);
    TEST_ASSERT_EQUAL_INT(2, babl_frees);
}

static void test_barter_cache_initialization_and_invalidation_reach_offer_values(void)
{
    (&DAT_000bbfb0)[0] = 42;
    (&DAT_000bbfc8)[0] = 42;
    g_monster_type_props[0].trade_patience = 4;
    init_barter_ui();
    TEST_ASSERT_EQUAL_INT(24, DAT_000bc024);
    for (int i=0; i<4; i++) {
        TEST_ASSERT_EQUAL_INT16(-1, (&DAT_000bbfb0)[i]);
        TEST_ASSERT_EQUAL_INT16(-1, (&DAT_000bbfc8)[i]);
    }
    DAT_000bbfd0_backing[0] = 1; DAT_000bbf98_backing[0] = 1;
    babl_items[1][0] = 0x30; babl_items[1][2] = 63;
    *(short *)(((byte *)g_object_type_props) + 5 + 0x30*13) = 20;
    TEST_ASSERT_EQUAL_INT(19, sum_barter_offer_value(1, &DAT_000bbfd0,
                          &DAT_000bbf98, &DAT_000bbfb0, 0));
    *(short *)(((byte *)g_object_type_props) + 5 + 0x30*13) = 40;
    TEST_ASSERT_EQUAL_INT(19, sum_barter_offer_value(1, &DAT_000bbfd0,
                          &DAT_000bbf98, &DAT_000bbfb0, 0)); /* cached */
    (&DAT_000bbfa8)[4] = 0xffff; /* invalidation performed when an item changes */
    TEST_ASSERT_EQUAL_INT(39, sum_barter_offer_value(1, &DAT_000bbfd0,
                          &DAT_000bbf98, &DAT_000bbfb0, 0));
}

static void test_barter_setup_replaces_staged_item_without_losing_inventory(void)
{
    ((byte *)DAT_00100674)[14] = 0x10;
    DAT_00100674->hdr.link_word = 1;
    DAT_000bbfe8_backing[0] = 2;
    babl_items[1][0] = 0x30;
    *(short *)(((byte *)g_object_type_props) + 5 + 0x30*13) = 20;
    babl_builtin_setup_to_barter();
    TEST_ASSERT_EQUAL_INT(1, DAT_000bbfe8_backing[0]);
    TEST_ASSERT_EQUAL_INT(2, DAT_00100674->hdr.link_word);
    TEST_ASSERT_EQUAL_INT(0, babl_items[2][2]);
    TEST_ASSERT_EQUAL_INT(0, babl_loot_calls);
}
static void test_every_opcode_was_executed(void)
{
    for (int opcode=0; opcode<42; opcode++) {
        char message[80];
        snprintf(message, sizeof message, "Opcode 0x%02x was not exercised", opcode);
        TEST_ASSERT_GREATER_THAN_UINT_MESSAGE(0, babl_coverage[opcode], message);
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_opcode_add);
    RUN_TEST(test_opcode_multiply);
    RUN_TEST(test_opcode_subtract);
    RUN_TEST(test_opcode_divide);
    RUN_TEST(test_opcode_modulo);
    RUN_TEST(test_opcode_or);
    RUN_TEST(test_opcode_and);
    RUN_TEST(test_opcode_greater);
    RUN_TEST(test_opcode_greater_equal);
    RUN_TEST(test_opcode_less);
    RUN_TEST(test_opcode_less_equal);
    RUN_TEST(test_opcode_equal);
    RUN_TEST(test_opcode_not_equal);
    RUN_TEST(test_opcode_array_index);
    RUN_TEST(test_opcode_nops_and_exit);
    RUN_TEST(test_opcode_not_and_negate);
    RUN_TEST(test_opcode_absolute_and_relative_jumps);
    RUN_TEST(test_opcode_conditional_branches);
    RUN_TEST(test_opcode_backward_branch);
    RUN_TEST(test_opcode_nested_call_and_return);
    RUN_TEST(test_opcode_push_pop_swap);
    RUN_TEST(test_opcode_frame_and_variable_address);
    RUN_TEST(test_opcode_reserve_and_release_stack);
    RUN_TEST(test_opcode_fetch_store_and_result_register);
    RUN_TEST(test_opcode_builtin_call);
    RUN_TEST(test_opcode_strings_and_output);
    RUN_TEST(test_variable_references_keep_native_pointer_width);
    RUN_TEST(test_named_variables_and_defaults);
    RUN_TEST(test_quest_flags_and_event_counters);
    RUN_TEST(test_event_changes_choose_expected_dialogue_branch);
    RUN_TEST(test_filtered_menu_tracks_event_state_and_releases_wait);
    RUN_TEST(test_menu_returns_choice_then_dialogue_continues);
    RUN_TEST(test_barter_cleanup_returns_items_to_their_owners);
    RUN_TEST(test_barter_setup_uses_actual_npc_inventory_link);
    RUN_TEST(test_barter_preferences_use_word_arrays);
    RUN_TEST(test_declining_barter_restores_inventory_and_clears_slots);
    RUN_TEST(test_accepted_offer_exits_barter_branch_and_continues_dialogue);
    RUN_TEST(test_rejected_offer_remains_available_then_declines);
    RUN_TEST(test_empty_offer_returns_failure_without_trading);
    RUN_TEST(test_npc_events_survive_conversation_writeback_and_reentry);
    RUN_TEST(test_menu_wait_ignores_invalid_selection_then_accepts_leave);
    RUN_TEST(test_barter_cache_initialization_and_invalidation_reach_offer_values);
    RUN_TEST(test_barter_setup_replaces_staged_item_without_losing_inventory);
    RUN_TEST(test_every_opcode_was_executed);
    return UNITY_END();
}

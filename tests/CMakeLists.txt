set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
add_compile_options(-Wno-pointer-sign)
# unity is a PUBLIC dependency of several diamond-shaped static test libraries; the duplicate is harmless.
add_link_options(-Wl,-no_warn_duplicate_libraries)
add_custom_target(unit_tests)
add_library(unity STATIC "${PROJECT_SOURCE_DIR}/third_party/unity/src/unity.c")
target_include_directories(unity PUBLIC "${PROJECT_SOURCE_DIR}/third_party/unity/src")
# The runtime options struct (g_opts) is used by most of the game code the suites extract.
add_library(uw_options STATIC "${PROJECT_SOURCE_DIR}/src/options.c")
target_include_directories(uw_options PUBLIC "${PROJECT_SOURCE_DIR}")
target_link_libraries(unity PUBLIC uw_options)

# Generate isolated test units from the original function bodies. Game
# functions stay in their existing files, and tests never keep code copies.
find_package(Python3 REQUIRED COMPONENTS Interpreter)
function(uw_extract_test_functions output)
  set(dependencies)
  foreach(entry IN LISTS ARGN)
    string(REGEX REPLACE ":.*$" "" source_file "${entry}")
    list(APPEND dependencies "${PROJECT_SOURCE_DIR}/${source_file}")
  endforeach()
  add_custom_command(OUTPUT "${output}"
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/extract_functions.py"
      --root "${PROJECT_SOURCE_DIR}" --output "${output}" ${ARGN}
    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/tools/extract_functions.py" ${dependencies}
    VERBATIM)
endfunction()

function(uw_configure_test_target target)
  target_include_directories(${target} PUBLIC "${PROJECT_SOURCE_DIR}")
  target_link_libraries(${target} PUBLIC unity)
endfunction()

# Compile a reusable group of game functions once, for any number of tests.
function(add_game_test_library name)
  set(source "${CMAKE_CURRENT_BINARY_DIR}/${name}_functions.c")
  uw_extract_test_functions("${source}" ${ARGN})
  add_library(${name} STATIC "${source}")
  uw_configure_test_target(${name})
endfunction()

function(add_fixture_game_unit_test name)
  add_game_test_library(uw_test_${name} ${ARGN})
  target_sources(uw_test_${name} PRIVATE support/${name}_fixture.c)
  target_include_directories(uw_test_${name} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
  target_link_libraries(uw_test_${name} PUBLIC uw_test_support)
  target_compile_definitions(uw_test_${name} PRIVATE
    UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
  target_compile_options(uw_test_${name} PUBLIC
    -include "${CMAKE_CURRENT_SOURCE_DIR}/${name}_test_globals.h")
  add_supported_game_unit_test(${name} uw_test_${name})
endfunction()

# A supported suite needs only its cases and the fixture library it uses.
function(add_supported_game_unit_test name)
  add_executable(test_${name} "${CMAKE_CURRENT_SOURCE_DIR}/test_${name}.c")
  uw_configure_test_target(test_${name})
  target_link_libraries(test_${name} PRIVATE ${ARGN})
  add_dependencies(unit_tests test_${name})
  add_test(NAME ${name} COMMAND test_${name})
endfunction()

add_game_test_library(uw_test_babl_objects
  src/babl.c:babl_builtin_x_obj_pos
  src/babl.c:babl_builtin_count_inv
  src/babl.c:babl_builtin_check_inv_quality
  src/babl.c:babl_builtin_set_inv_quality
  src/babl.c:babl_builtin_find_barter_total)
add_supported_game_unit_test(babl_objects uw_test_babl_objects)

# Keep service functions in separate archive members so suite-specific mocks
# override only their own boundary without pulling unrelated definitions.
add_game_test_library(uw_test_memory src/ordinal_stubs.c:ce_memset)
add_game_test_library(uw_test_string_append src/ordinal_stubs.c:ce_strcat)
add_game_test_library(uw_test_string_length src/ordinal_stubs.c:ce_strlen)
add_game_test_library(uw_test_character_rules src/chargen.c:init_new_character_record)
add_game_test_library(uw_test_player_stats src/player.c:recalculate_player_stats)
add_game_test_library(uw_test_archive_rules src/saveload.c:read_archive_entry)
target_compile_options(uw_test_archive_rules PRIVATE
  -include "${CMAKE_CURRENT_SOURCE_DIR}/support/game_fixture.h")
add_library(uw_test_support STATIC support/data_fixture.c)
uw_configure_test_target(uw_test_support)
target_link_libraries(uw_test_support PUBLIC uw_test_character_rules uw_test_player_stats uw_test_archive_rules
  uw_test_memory uw_test_string_append uw_test_string_length)
target_sources(uw_test_support PRIVATE support/game_fixture.c
  support/character_services.c support/character_storage.c
  support/archive_storage.c support/file_services.c support/random.c support/division.c
  "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c")
target_include_directories(uw_test_support PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_support PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_compile_options(uw_test_support PRIVATE
  -include "${CMAKE_CURRENT_SOURCE_DIR}/support/game_fixture.h")

add_game_test_library(uw_test_math src/math.c:step_value_toward_limit
  src/math.c:@DAT_00086260_backing src/math.c:%DAT_00086260 src/math.c:%DAT_00086264
  src/math.c:pack_angle_byte src/math.c:lookup_arctan_primary_range
  src/math.c:lookup_arctan_reciprocal_range src/math.c:compute_angle_from_slope)
add_supported_game_unit_test(math uw_test_math)

# debug_ui.c is this project's own hand-written support code (not pulled
# from the decompiled game sources), already cleanly encapsulated behind
# a small public API -- link it in directly rather than through
# uw_extract_test_functions, which exists for isolating one function out
# of a much larger original-game file.
add_library(uw_test_debug_ui STATIC
  "${PROJECT_SOURCE_DIR}/src/debug_ui.c" support/debug_ui_fixture.c)
uw_configure_test_target(uw_test_debug_ui)
add_supported_game_unit_test(debug_ui uw_test_debug_ui)

add_supported_game_unit_test(support uw_test_support)

add_fixture_game_unit_test(chargen
  src/player.c:write_player_status_block src/player.c:read_player_status_block
  src/player.c:@DAT_00086da8_backing
  src/player.c:reset_player_derived_state src/player.c:apply_equipped_item_effect
  src/object_actions.c:check_object_carry_weight
  src/player.c:compute_object_weight
  src/chargen.c:chargen_normalize_record_stride
  src/chargen.c:advance_skill_tree_node
  src/chargen.c:apply_confirmed_skill_picks
  src/chargen.c:reroll_attributes_for_class_race)
# test_chargen reads the real shipped data/DATA/CHRGEN.DAT to check the
# record-layout normalization, so the executable needs the path too (the
# fixture library's own copy of the define is PRIVATE).
target_compile_definitions(test_chargen PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_fixture_game_unit_test(new_game
  src/game.c:prepare_new_game src/game.c:start_game_with_current_character src/game.c:begin_gameplay
  src/level.c:load_level_object_table src/level.c:load_level
  src/game.c:set_game_mode
  src/ordinal_stubs.c:ce_wcscpy src/ordinal_stubs.c:CopyFileW
  src/ordinal_stubs.c:MultiByteToWideChar)
add_fixture_game_unit_test(teleport
  src/level.c:transition_to_level src/level.c:teleport_object_to_level_tile
  src/player.c:dungeon_view_anim_tick src/movement.c:movement_tick)
add_fixture_game_unit_test(audio
  src/audio.c:@DAT_00087414_backing src/audio.c:@DAT_000873e0_backing
  src/audio.c:@DAT_00087520_backing
  src/audio.c:play_music_track src/audio.c:advance_menu_music_track_elapsed
  src/audio.c:update_ingame_music_track src/audio.c:trigger_sound_sample_note
  src/audio.c:play_numbered_voice_sample src/audio.c:is_voice_sample_finished
  src/audio.c:stop_voice_sample
  src/audio.c:allocate_and_play_sound_channel
  src/audio.c:stop_current_audio_handle_dup
  src/audio.c:play_sound_effect_at_object
  src/combat.c:play_weapon_impact_sound
  src/ordinal_stubs.c:ce_memmove)

# The optional DOS-audio backend is hand-written platform code rather than
# extracted decompiled function bodies, so it is compiled directly instead
# of going through uw_extract_test_functions.
add_library(uw_test_dosmidi STATIC
  "${PROJECT_SOURCE_DIR}/src/platform_dosmidi.c"
  "${PROJECT_SOURCE_DIR}/src/debug.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_opl.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_adlib.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_ail.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_sound.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_blob.c"
  "${PROJECT_SOURCE_DIR}/src/file_io.c")
uw_configure_test_target(uw_test_dosmidi)
target_include_directories(uw_test_dosmidi PUBLIC
  "${PROJECT_SOURCE_DIR}/src"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss")
add_supported_game_unit_test(dosmidi uw_test_dosmidi)
add_game_test_library(uw_test_movement
  src/ai.c:@physics_vz_remainder src/ai.c:@g_physics_vz_remainder src/ai.c:@g_stat_physics_ticks src/ai.c:physics_subtick_units
  src/movement.c:@player_move_fraction src/movement.c:@g_player_move_fraction
  src/movement.c:sweep_kill_velocity src/movement.c:sweep_deflect_heading
  src/movement.c:sweep_slide_along_wall src/movement.c:sweep_apply_collision
  src/movement.c:collision_flags_to_locomotion_code src/movement.c:sweep_collision_flags
  src/collision.c:collision_corner_flags
  src/movement.c:reticle_object_pick src/movement.c:movement_sweep_setup
  src/movement.c:sweep_step_vertical src/movement.c:sweep_integrate_substep
  src/collision.c:collision_add_candidate_object
  src/collision.c:swap_collision_candidates src/collision.c:sort_collision_candidates
  src/combat.c:resolve_collision_candidate_interaction
  src/combat.c:apply_object_collision_scatter src/ai.c:build_object_placement_snapshot
  src/player.c:commit_player_move src/movement.c:sweep_init_position
  src/objects.c:resolve_object_link src/movement.c:find_nearby_door_in_candidates
  src/movement.c:get_first_nearby_candidate_object)
target_sources(uw_test_movement PRIVATE support/movement_fixture.c)
target_link_libraries(uw_test_movement PUBLIC uw_test_support)
target_compile_options(uw_test_movement PUBLIC
  -include "${CMAKE_CURRENT_SOURCE_DIR}/movement_test_globals.h")
add_supported_game_unit_test(movement uw_test_movement)
set(UW_COMBAT_TEST_FUNCTIONS
  src/player.c:@DAT_00086e87_backing src/player.c:@DAT_0008730c_backing
  src/player.c:grant_experience_points src/player.c:advance_character_level
  src/ordinal_stubs.c:orduint_divmod
  src/combat.c:find_nearest_hit_target src/combat.c:resolve_combat_hit_zone
  src/combat.c:compute_attack_relative_facing
  src/combat.c:process_melee_attack_swing src/combat.c:apply_melee_damage
  src/combat.c:apply_typed_damage_to_object src/combat.c:resolve_damage_type_resistance
  src/combat.c:apply_damage_to_object src/combat.c:award_monster_kill_experience
  src/ai.c:handle_monster_death src/ai.c:initiate_npc_death
  src/ai.c:resolve_unique_npc_special_behavior
  src/hud.c:set_hud_status_value src/hud.c:hud_panel_redraw_dispatch
  src/hud.c:hud_panel_wipe_transition_tick
  src/combat.c:resolve_melee_swing_hit src/combat.c:spawn_blood_splat_object
  src/combat.c:load_monster_combat_stats
  src/combat.c:apply_trap_type_damage_effect src/combat.c:apply_direct_object_hit
  src/combat.c:apply_object_durability_damage
  src/objects.c:apply_object_destruction_effect
  src/containers.c:discard_container_contents
  src/doors.c:close_door_object src/doors.c:schedule_door_open_animation)
add_fixture_game_unit_test(combat ${UW_COMBAT_TEST_FUNCTIONS})
# Reuse the combat fixture with real NPC attack, skill and dice calculations.
add_game_test_library(uw_test_npc_combat ${UW_COMBAT_TEST_FUNCTIONS}
  src/resources.c:load_armor_variant_tables
  src/resources.c:load_light_food_effect_tables
  src/objects.c:load_class7_variant_effect_table
  src/combat.c:resolve_npc_melee_attack src/combat.c:resolve_weapon_hit_skill_check
  src/player.c:roll_skill_check src/math.c:roll_dice_sum src/math.c:rand_below)
target_sources(uw_test_npc_combat PRIVATE support/combat_fixture.c)
target_include_directories(uw_test_npc_combat PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_link_libraries(uw_test_npc_combat PUBLIC uw_test_support)
target_compile_definitions(uw_test_npc_combat PRIVATE
  UW_TEST_NPC_COMBAT UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_compile_options(uw_test_npc_combat PUBLIC
  -include "${CMAKE_CURRENT_SOURCE_DIR}/combat_test_globals.h")
add_supported_game_unit_test(npc_combat uw_test_npc_combat)

add_fixture_game_unit_test(traps src/traps.c:dispatch_trap_type_effect
  src/traps.c:dispatch_quest_event_code src/traps.c:apply_quest_event_numeric_effect)
add_fixture_game_unit_test(hotspot_marker src/babl.c:draw_hotspot_crosshair_marker)
add_fixture_game_unit_test(noise
  src/ai.c:alert_npc_to_noise_callback src/ai.c:emit_noise_alert)
add_fixture_game_unit_test(keyboard
  src/input.c:handle_keyboard_message)
# Jumping while a movement key is held: the shared key latch and the jump key's dispatch.
add_fixture_game_unit_test(jump_walking
  src/input.c:@DAT_00086e70_backing src/input.c:%DAT_00086e70
  src/input.c:handle_keyboard_message src/input.c:move_command_dispatch
  src/input.c:set_held_movement_keys
  src/movement.c:@DAT_00087944 src/movement.c:@DAT_00087948
  src/movement.c:@DAT_0008794c src/movement.c:@DAT_00087950
  src/movement.c:uw_turn_rate_accel src/movement.c:decode_held_movement_keys
  src/movement.c:decode_movement_command)
target_link_libraries(uw_test_jump_walking PUBLIC uw_test_division)
add_fixture_game_unit_test(visibility_walk
  src/visibility.c:@DAT_00086af0_arr
  src/visibility.c:@DAT_00086af8_region
  src/math.c:@DAT_00085d48_sine
  src/math.c:@DAT_00085f50_cosine
  src/visibility.c:build_visibility_light_grid
  src/player.c:refresh_player_equipment_effects
  src/math.c:integer_sqrt
  src/visibility.c:seed_visibility_queue
  src/visibility.c:run_visibility_flood
  src/visibility.c:merge_adjacent_visibility_rays
  src/visibility.c:extend_visibility_ray_row
  src/visibility.c:advance_visibility_ray
  src/visibility.c:compute_visibility_ray_offset
  src/visibility.c:visibility_ray_step_forward
  src/visibility.c:visibility_ray_step_backward
  src/tmap.c:tilemap_lookup
  src/math.c:angle_to_screen_delta
  src/math.c:pack_angle_byte)
add_fixture_game_unit_test(illustrations
  src/object_actions.c:look_at_inscribed_object
  src/interact.c:trigger_terrain_discovery_illustration
  src/interact.c:trigger_inscription_illustration
  src/babl.c:record_illustration_discovery_and_display)
add_fixture_game_unit_test(illustration_render
  src/babl.c:render_babl_dialog_window src/babl.c:display_book_or_scroll_page
  src/babl.c:bubble_sort_indices_by_key_table src/babl.c:babl_render_tick
  src/babl.c:FUN_000362e8 src/babl.c:FUN_00036300
  src/babl.c:FUN_00036308 src/babl.c:FUN_00036394
  src/babl.c:FUN_000363f0 src/babl.c:FUN_00036404
  src/babl.c:FUN_00036418 src/babl.c:FUN_000365bc
  src/babl.c:FUN_000365fc src/babl.c:FUN_0003663c
  src/babl.c:FUN_00036698 src/babl.c:FUN_00036344
  src/babl.c:babl_render_op_show_code
  src/babl.c:decompress_rle_stream src/babl.c:pack_byte_into_word
  src/babl.c:read_rle_op_code src/babl.c:rle_op_handle_short_run
  src/babl.c:rle_op_copy_pairs_even src/babl.c:rle_op_copy_pairs_odd
  src/babl.c:rle_op_fill_doubled_byte_even src/babl.c:rle_op_fill_doubled_byte_odd
  src/babl.c:rle_op_finalize_length src/babl.c:rle_op_mark_stream_done
  src/audio.c:load_voice_sample_page src/audio.c:read_voice_sample_page_chunk
  src/ordinal_stubs.c:ordfloat_bits_to_float
  src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_int_to_float2 src/ordinal_stubs.c:ordfloat_mul
  src/ordinal_stubs.c:ordfloat_uint_to_float src/ordinal_stubs.c:ordfloat_int_to_float
  src/graphics.c:expand_pals_bytes
  src/graphics.c:convert_palette_bgrx_to_rgb
  src/graphics.c:build_rgb565_palette
  src/graphics.c:get_palette_brightness_bits
  src/graphics.c:bitmap_blit_to_framebuffer
  src/graphics.c:fade_in src/graphics.c:fade_out
  src/hud.c:flush_dirty_rect_to_display src/hud.c:dirty_rect_union
  src/hud.c:main_loop_hud_flush src/graphics.c:flush_dungeon_frame
  src/game.c:set_pending_update_flags
  src/game.c:@DAT_00085668_real_table
  src/gx_stub.c:@uw_present_state src/gx_stub.c:@g_present_state
  src/gx_stub.c:uw_begin_present_batch src/gx_stub.c:uw_end_present_batch
  src/gx_stub.c:gfx_finalizedraw
  src/gx_stub.c:uw_take_completed_frame
  src/gx_stub.c:uw_begin_modal_present src/gx_stub.c:uw_end_modal_present
  src/gx_stub.c:uw_suspend_present_batch src/gx_stub.c:uw_resume_present_batch
  src/gx_stub.c:uw_defer_present
  src/ordinal_stubs.c:GetFileSize
  src/input.c:wait_for_click_release src/input.c:next_input_event
  src/input.c:peek_input_event src/input.c:poll_input_event src/input.c:poll_mouse_event
  src/hud.c:poll_mouse_button_flags src/input.c:process_pending_keyboard_scan_code
  src/input.c:get_alternate_keyboard_scan_code)
add_fixture_game_unit_test(scheduler
  src/scheduler.c:scheduler_tick src/scheduler.c:scheduler_step_entry
  src/scheduler.c:scheduler_finish_entry src/scheduler.c:scheduler_despawn_entry
  src/scheduler.c:scheduler_add_entry src/scheduler.c:scheduler_remove_entry
  src/objects.c:object_list_unlink
  src/ai.c:@DAT_000853d8_backing
  src/ai.c:npc_ai_tick src/ai.c:initiate_npc_death src/ai.c:drop_monster_loot)
add_fixture_game_unit_test(inventory
  src/objects.c:find_object_by_encoded_slot_in_chain src/item_use.c:find_or_assign_object_widget
  src/object_actions.c:describe_special_object_property src/object_actions.c:print_object_flavor_text
  src/item_use.c:arm_use_item_on_player_prompt
  src/item_use.c:prompt_use_item_on_target
  src/item_use.c:complete_use_item_on_player
  src/game.c:handle_game_view_click
  src/containers.c:open_backpack_container src/containers.c:refresh_container_view
  src/containers.c:sum_container_weight src/inventory.c:redraw_lit_light_source_widgets)

add_fixture_game_unit_test(geometry
  src/3d.c:@DAT_000bc038_backing
  src/3d.c:near_clip_visible_tiles src/tmap.c:render_visible_tile_list
  src/3d.c:translate_verts_to_camera_space src/3d.c:project_verts_through_view_matrix
  src/3d.c:transform_points_by_matrix
  src/ordinal_stubs.c:ordfloat_bits_to_float src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_add src/ordinal_stubs.c:ordfloat_sub
  src/ordinal_stubs.c:ordfloat_mul src/ordinal_stubs.c:ordfloat_div
  src/ordinal_stubs.c:ordfloat_ge src/ordinal_stubs.c:ordfloat_uint_to_float
  src/ordinal_stubs.c:ordfloat_int_to_float2)

add_fixture_game_unit_test(spells
  src/hud.c:@DAT_00087530_backing
  src/hud.c:handle_cast_spell_click src/hud.c:cast_spell_from_rune_combo
  src/hud.c:report_spell_cast_failure
  src/spells.c:execute_spell_effect
  src/object_actions.c:reduce_item_quality_on_use
  src/spells.c:add_active_light_source src/tmap.c:tile_is_no_magic
  src/spells.c:complete_cast_spell_on_target
  src/spells.c:apply_targeted_spell_effect
  src/spells.c:spawn_object_near_actor
  src/game.c:handle_game_view_click
  src/item_use.c:compute_drop_aim_from_cursor
  src/objects.c:spawn_object_near_player
  src/objects.c:compute_object_placement_fields)

add_fixture_game_unit_test(automap
  src/automap.c:draw_automap_cell_edge src/automap.c:darken_pixel
  src/automap.c:@DAT_000842c0_real_table src/automap.c:draw_automap_cell
  src/automap.c:draw_automap_notes src/automap.c:save_automap_notes_to_archive
  src/automap.c:load_automap_notes_from_archive
  src/automap.c:enter_automap_screen src/automap.c:exit_automap_screen
  src/automap.c:handle_automap_note_click src/automap.c:pick_closer_note_label
  src/automap.c:debug_noop_overflow_hook
  src/saveload.c:open_level_archive src/saveload.c:close_level_archive
  src/saveload.c:write_archive_entry src/saveload.c:read_archive_entry
  src/winfile_wrappers.c:open_existing_file_rw src/winfile_wrappers.c:open_file_for_read
  src/winfile_wrappers.c:write_file_handle src/winfile_wrappers.c:close_file_handle
  src/ordinal_stubs.c:ce_strrchr src/ordinal_stubs.c:ce_memmove
  src/ordinal_stubs.c:ce_malloc src/ordinal_stubs.c:LocalFree
  src/ordinal_stubs.c:CloseHandle src/ordinal_stubs.c:GetFileSize
  src/ordinal_stubs.c:orduint_divmod
  src/ordinal_stubs.c:ce_toupper
  src/hud.c:draw_idle_mouse_cursor src/hud.c:save_cursor_background
  src/hud.c:erase_cursor_icon src/hud.c:decrement_cursor_hide_depth
  src/hud.c:cursor_show_idle_tick
  src/hud.c:warp_mouse_cursor src/hud.c:get_mouse_position
  src/graphics.c:rect_fill_or_save_restore src/graphics.c:set_draw_color)
target_sources(uw_test_automap PRIVATE support/automap_storage_fixture.c)

add_fixture_game_unit_test(weapon_ready
  src/hud.c:@DAT_000870d8 src/hud.c:@DAT_000870dc
  src/weapon_swing.c:@DAT_000870e0 src/weapon_swing.c:@DAT_000870e4
  src/weapon_swing.c:@DAT_000870e8
  src/weapon_swing.c:request_weapon_swing_graphic
  src/item_use.c:attach_picked_up_object_to_cursor
  src/item_use.c:@g_weapon_overlay_enabled
  src/hud.c:cursor_mode_button_click src/hud.c:set_hud_status_value
  src/item_use.c:ready_weapon src/item_use.c:unready_weapon
  src/inventory.c:toggle_weapon_ready
  src/weapon_swing.c:advance_action_animation_frame
  src/weapon_swing.c:weapon_swing_draw_tick)

# The weapon charge state machine (tick_weapon_swing_state) with a controlled clock and button.
add_fixture_game_unit_test(weapon_charge
  src/weapon_swing.c:@DAT_000870e4
  src/weapon_swing.c:@DAT_00084f0b_backing src/weapon_swing.c:%DAT_00084f0b
  src/combat.c:@DAT_00084eff_backing
  src/weapon_swing.c:tick_weapon_swing_state src/weapon_swing.c:reset_weapon_swing_state
  src/weapon_swing.c:update_weapon_ready_hud_icon)

add_fixture_game_unit_test(head_bob
  src/movement.c:@DAT_00086e38_backing src/movement.c:@DAT_00086e48_backing
  src/player.c:@DAT_00086e58_backing
  src/movement.c:movement_tick src/movement.c:apply_movement_tick
  src/player.c:trigger_view_transition src/player.c:update_current_view_from_subject
  src/3d.c:build_view_matrix src/3d.c:build_trig_tables
  src/3d.c:set_identity_matrix4x4 src/3d.c:multiply_matrix4x4
  src/ordinal_stubs.c:ordfloat_bits_to_float src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_negate src/ordinal_stubs.c:ordfloat_mul
  src/ordinal_stubs.c:ordfloat_add src/ordinal_stubs.c:ordfloat_int_to_float2
  src/ordinal_stubs.c:ordfloat_float_to_double src/ordinal_stubs.c:ordfloat_double_to_float
  src/ordinal_stubs.c:ordfloat_double_mul2 src/ordinal_stubs.c:ordfloat_cos
  src/ordinal_stubs.c:ordfloat_sin)

# Independent expectations are bytes exported from the original UU.exe,
# including documented host adaptations. Compile the actual declarations.
file(GLOB game_string_sources CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/*.c")
set(static_strings_source "${CMAKE_CURRENT_BINARY_DIR}/static_strings_generated.c")
add_custom_command(OUTPUT "${static_strings_source}"
  COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/generate_static_strings.py"
    --root "${PROJECT_SOURCE_DIR}"
    --audit "${CMAKE_CURRENT_SOURCE_DIR}/fixtures/static_strings.json"
    --output "${static_strings_source}"
  DEPENDS ${game_string_sources} "${CMAKE_CURRENT_SOURCE_DIR}/tools/generate_static_strings.py"
    "${CMAKE_CURRENT_SOURCE_DIR}/fixtures/static_strings.json"
  VERBATIM)
add_library(uw_test_static_strings STATIC "${static_strings_source}")
uw_configure_test_target(uw_test_static_strings)
target_include_directories(uw_test_static_strings PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
add_supported_game_unit_test(static_strings uw_test_static_strings)
add_supported_game_unit_test(options)

add_fixture_game_unit_test(scroll_messages
  src/hud.c:@s_Not_a_spell_00085a80 src/item_use.c:@DAT_000878ec_backing
  src/item_use.c:@s_on_what__000878e0 src/item_use.c:@s_UNNAMED_00084f24
  src/player.c:@DAT_0008730c_backing
  src/object_actions.c:@s_You_see_000858fc src/object_actions.c:@s_belonging_to_00085c90
  src/ai.c:@DAT_00084f20_backing
  src/ai.c:@s_named_00085d18
  src/babl.c:@DAT_00085240_backing src/babl.c:@DAT_00085244_backing src/babl.c:@DAT_00085248_backing
  src/hud.c:message_scroll_print_wrapped src/hud.c:msg_scroll_split_escape_segments
  src/hud.c:msg_scroll_split_newline_segments src/hud.c:msg_scroll_draw_wrapped_span
  src/hud.c:msg_scroll_wrap_split_line src/hud.c:print_not_a_spell_message
  src/item_use.c:prompt_use_item_on_target
  src/player.c:advance_character_level
  src/object_actions.c:dispatch_object_action src/object_actions.c:dispatch_object_action_dup
  src/ai.c:build_creature_look_text src/interact.c:describe_picked_terrain
  src/interact.c:resolve_picked_terrain_texture
  src/ordinal_stubs.c:ce_memmove src/ordinal_stubs.c:ce_strchr src/ordinal_stubs.c:ce_strrchr)
target_link_libraries(uw_test_scroll_messages PUBLIC uw_test_static_strings)

add_fixture_game_unit_test(door_models
  src/tmap.c:@DAT_00086d68_region src/tmap.c:resolve_billboard_corner_offset
  src/models.c:@DAT_00086c08_backing src/models.c:@DAT_00086ce0_backing
  src/models.c:emit_catalog_object src/models.c:apply_model_position_offset
  src/models.c:scale_model_part_offsets src/3d.c:build_euler_rotation_matrix
  src/3d.c:transform_points_by_matrix src/3d.c:set_identity_matrix4x4
  src/3d.c:multiply_matrix4x4 src/3d.c:copy_matrix4x4
  src/ordinal_stubs.c:ordfloat_bits_to_float src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_mul src/ordinal_stubs.c:ordfloat_add
  src/ordinal_stubs.c:ordfloat_negate src/ordinal_stubs.c:ordfloat_div
  src/ordinal_stubs.c:ordfloat_int_to_float2 src/ordinal_stubs.c:ordfloat_uint_to_float
  src/ordinal_stubs.c:ordfloat_gt src/ordinal_stubs.c:ordfloat_sub)

# Exercise the original conversation VM, menus, NPC sync and barter rules.
add_fixture_game_unit_test(babl_vm
  src/babl.c:@s_dungeon_level_000852b0
  src/babl.c:@s_game_days_0008528c
  src/babl.c:@s_game_mins_00085298
  src/babl.c:@s_game_time_000852a4
  src/babl.c:@s_new_player_exp_0008527c
  src/babl.c:@s_npc_arms_00085374
  src/babl.c:@s_npc_attitude_000845f8
  src/babl.c:@s_npc_goal_0008535c
  src/babl.c:@s_npc_gtarg_00085350
  src/babl.c:@s_npc_health_00085388
  src/babl.c:@s_npc_hp_00085380
  src/babl.c:@s_npc_hunger_00085394
  src/babl.c:@s_npc_level_00085334
  src/babl.c:@s_npc_name_00085310
  src/babl.c:@s_npc_power_00085368
  src/babl.c:@s_npc_talkedto_00085340
  src/babl.c:@s_npc_whoami_000853a0
  src/babl.c:@s_npc_xhome_00085328
  src/babl.c:@s_npc_yhome_0008531c
  src/babl.c:@s_play_arms_000852e4
  src/babl.c:@s_play_drawn_00085258
  src/babl.c:@s_play_health_000852f8
  src/babl.c:@s_play_hp_000852f0
  src/babl.c:@s_play_hunger_00085304
  src/babl.c:@s_play_level_000852c0
  src/babl.c:@s_play_mana_000852cc
  src/babl.c:@s_play_name_0008524c
  src/babl.c:@s_play_poison_00085264
  src/babl.c:@s_play_power_000852d8
  src/babl.c:@s_play_sex_00085270
  src/babl.c:@DAT_000845a8 src/babl.c:@s_respond_000845ac
  src/babl.c:run_babl_bytecode_interpreter
  src/babl.c:babl_op_add
  src/babl.c:babl_op_negate
  src/babl.c:babl_op_mul
  src/babl.c:babl_op_sub
  src/babl.c:babl_op_div
  src/babl.c:babl_op_mod
  src/babl.c:babl_op_or
  src/babl.c:babl_op_and
  src/babl.c:babl_op_gt
  src/babl.c:babl_op_ge
  src/babl.c:babl_op_lt
  src/babl.c:babl_op_le
  src/babl.c:babl_op_eq
  src/babl.c:babl_op_ne
  src/babl.c:babl_op_call
  src/babl.c:babl_op_push_var_raw
  src/babl.c:babl_op_combine_index
  src/babl.c:babl_op_set_var
  src/babl.c:babl_op_call_builtin
  src/babl.c:babl_op_string_eq
  src/babl.c:babl_op_say
  src/babl.c:babl_op_respond
  src/babl.c:babl_op_return
  src/babl.c:babl_read_var_word
  src/babl.c:babl_write_var_word
  src/babl.c:babl_read_frame_word
  src/babl.c:babl_var_word_addr
  src/babl.c:babl_set_variable
  src/babl.c:babl_get_variable
  src/babl.c:init_babl_variable_defaults
  src/babl.c:babl_register_builtin
  src/babl.c:sync_conv_vars_from_npc src/babl.c:sync_conv_vars_to_npc
  src/ordinal_stubs.c:orduint_divmod
  src/babl.c:babl_builtin_set_quest
  src/babl.c:babl_builtin_get_quest
  src/babl.c:babl_builtin_set_likes_dislikes
  src/babl.c:check_npc_item_preference
  src/babl.c:babl_builtin_do_offer
  src/babl.c:babl_builtin_do_decline
  src/babl.c:barter_offer_is_empty
  src/babl.c:sum_barter_offer_value
  src/babl.c:compute_barter_item_value
  src/babl.c:finalize_npc_barter_items
  src/babl.c:finalize_player_barter_items
  src/babl.c:init_barter_ui
  src/babl.c:end_barter_ui
  src/babl.c:babl_builtin_setup_to_barter
  src/babl.c:babl_menu
  src/babl.c:babl_fmenu
  src/babl.c:run_babl_menu_wait_loop
  src/babl.c:select_babl_menu_response
  src/ordinal_stubs.c:ce_strcmp src/ordinal_stubs.c:ce_tolower)

# Run complete CNV.ARK conversations: the real script loader, interpreter,
# menus, NPC/quest variable bridge and barter rules, driven through
# start_npc_conversation. Presentation, input and the unrelated object-world
# builtins are controlled at fixture boundaries.
add_fixture_game_unit_test(babl_conversation
  src/resources.c:get_message_string src/resources.c:decode_strings_pak_entry
  src/resources.c:walk_strings_pak_huffman_tree src/resources.c:read_strings_pak_bit
  src/interact.c:@s__DATA_cnv_ark_00084fc8
  src/babl.c:@DAT_00085230_backing src/babl.c:%DAT_00085230
  src/babl.c:@DAT_00085234_backing src/babl.c:%DAT_00085234
  src/babl.c:@DAT_0008523c_backing src/babl.c:%DAT_0008523c
  src/babl.c:@DAT_000845b8_backing src/babl.c:%DAT_000845b8 src/babl.c:%DAT_000845ba
  src/babl.c:%PTR_DAT_000845c8
  src/babl.c:@DAT_000845d8_backing src/babl.c:%DAT_000845d8 src/babl.c:%DAT_000845da
  src/babl.c:%DAT_000845e8
  src/babl.c:@DAT_000845a8
  src/babl.c:@s__SAVE0_bglobals_dat_00084538
  src/babl.c:@s__DATA_babglobs_dat_0008454c
  src/babl.c:@s_val_00084560
  src/babl.c:@s_length_00084564
  src/babl.c:@s_find_0008456c
  src/babl.c:@s_copy_00084574
  src/babl.c:@s_append_0008457c
  src/babl.c:@s_contains_00084584
  src/babl.c:@s_plural_00084590
  src/babl.c:@s_random_00084598
  src/babl.c:@s_compare_000845a0
  src/babl.c:@s_respond_000845ac
  src/babl.c:@s_npc_attitude_000845f8
  src/babl.c:@s_genhead_00084fd8
  src/babl.c:@s_charhead_00084fe0
  src/babl.c:@s_heads_00084fec
  src/babl.c:@s_converse_00084ff4
  src/babl.c:@s_take_id_from_npc_0008519c
  src/babl.c:@s_take_from_npc_000851b0
  src/babl.c:@s_find_inv_000851c0
  src/babl.c:@s_give_to_npc_000851cc
  src/babl.c:@s_show_inv_000851d8
  src/babl.c:@s_print_000851e4
  src/babl.c:@s_babl_ask_000851ec
  src/babl.c:@s_sex_000851f8
  src/babl.c:@s_set_quest_000851fc
  src/babl.c:@s_get_quest_00085208
  src/babl.c:@s_babl_fmenu_00085214
  src/babl.c:@s_babl_menu_00085220
  src/babl.c:@s_give_ptr_npc_00085000
  src/babl.c:@s_find_barter_total_00085010
  src/babl.c:@s_find_barter_00085024
  src/babl.c:@s_x_obj_pos_00085030
  src/babl.c:@s_x_obj_stuff_0008503c
  src/babl.c:@s_x_traps_00085048
  src/babl.c:@s_x_skills_00085050
  src/babl.c:@s_remove_talker_0008505c
  src/babl.c:@s_place_object_0008506c
  src/babl.c:@s_add_to_npc_inv_0008507c
  src/babl.c:@s_take_from_npc_inv_0008508c
  src/babl.c:@s_set_race_attitude_000850a0
  src/babl.c:@s_set_attitude_000850b4
  src/babl.c:@s_gronk_door_000850c4
  src/babl.c:@s_count_inv_000850d0
  src/babl.c:@s_set_inv_quality_000850dc
  src/babl.c:@s_check_inv_quality_000850ec
  src/babl.c:@s_do_inv_delete_00085100
  src/babl.c:@s_do_inv_create_00085110
  src/babl.c:@s_set_likes_dislikes_00085120
  src/babl.c:@s_pause_00085134
  src/babl.c:@s_setup_to_barter_0008513c
  src/babl.c:@s_end_barter_0008514c
  src/babl.c:@s_do_judgement_00085158
  src/babl.c:@s_do_decline_00085168
  src/babl.c:@s_do_demand_00085174
  src/babl.c:@s_do_offer_00085180
  src/babl.c:@s_identify_inv_0008518c
  src/babl.c:@s_npc_talkedto_00085340
  src/babl.c:@s_npc_gtarg_00085350
  src/babl.c:@s_npc_goal_0008535c
  src/babl.c:@s_npc_power_00085368
  src/babl.c:@s_npc_arms_00085374
  src/babl.c:@s_npc_hp_00085380
  src/babl.c:@s_npc_health_00085388
  src/babl.c:@s_npc_hunger_00085394
  src/babl.c:@s_npc_whoami_000853a0
  src/babl.c:@s_play_name_0008524c
  src/babl.c:@s_play_drawn_00085258
  src/babl.c:@s_play_poison_00085264
  src/babl.c:@s_play_sex_00085270
  src/babl.c:@s_new_player_exp_0008527c
  src/babl.c:@s_game_days_0008528c
  src/babl.c:@s_game_mins_00085298
  src/babl.c:@s_game_time_000852a4
  src/babl.c:@s_dungeon_level_000852b0
  src/babl.c:@s_play_level_000852c0
  src/babl.c:@s_play_mana_000852cc
  src/babl.c:@s_play_power_000852d8
  src/babl.c:@s_play_arms_000852e4
  src/babl.c:@s_play_hp_000852f0
  src/babl.c:@s_play_health_000852f8
  src/babl.c:@s_play_hunger_00085304
  src/babl.c:@s_npc_name_00085310
  src/babl.c:@s_npc_yhome_0008531c
  src/babl.c:@s_npc_xhome_00085328
  src/babl.c:@s_npc_level_00085334
  src/babl.c:babl_expand_string_refs src/babl.c:parse_babl_string_ref_expr src/babl.c:babl_resize
  src/resources.c:register_interned_string src/resources.c:overwrite_interned_string
  src/resources.c:reset_string_resource_page src/ordinal_stubs.c:ce_strchr src/ordinal_stubs.c:ce_strncpy src/text.c:@s_0123456789ABCDEF_00084a28 src/text.c:itoa_radix
  src/babl.c:start_npc_conversation src/babl.c:exit_talk_mode src/babl.c:load_npc_conversation_record src/babl.c:build_babl_symbol_table src/babl.c:babl_vm_load_script src/babl.c:load_npc_conversation_variables src/babl.c:save_npc_conversation_variables src/babl.c:init_conv_var_terminator_record src/babl.c:seed_conversation_globals_for_new_game src/babl.c:run_babl_bytecode_interpreter src/babl.c:babl_register_builtin src/babl.c:babl_set_variable src/babl.c:babl_get_variable src/babl.c:init_babl_variable_defaults src/babl.c:babl_var_word_addr src/babl.c:babl_read_var_word src/babl.c:babl_write_var_word src/babl.c:babl_read_frame_word src/babl.c:babl_builtin_default_handler src/babl.c:babl_op_add src/babl.c:babl_op_negate src/babl.c:babl_op_mul src/babl.c:babl_op_sub src/babl.c:babl_op_div src/babl.c:babl_op_mod src/babl.c:babl_op_or src/babl.c:babl_op_and src/babl.c:babl_op_gt src/babl.c:babl_op_ge src/babl.c:babl_op_lt src/babl.c:babl_op_le src/babl.c:babl_op_eq src/babl.c:babl_op_ne src/babl.c:babl_op_call src/babl.c:babl_op_return src/babl.c:babl_op_push_var_raw src/babl.c:babl_op_combine_index src/babl.c:babl_op_set_var src/babl.c:babl_op_call_builtin src/babl.c:babl_op_string_eq src/babl.c:babl_op_say src/babl.c:babl_op_respond src/babl.c:babl_builtin_compare src/babl.c:babl_builtin_random src/babl.c:babl_builtin_plural src/babl.c:babl_builtin_contains src/babl.c:babl_builtin_append src/babl.c:babl_builtin_copy src/babl.c:babl_builtin_find src/babl.c:babl_builtin_length src/babl.c:babl_builtin_val src/babl.c:babl_builtin_say src/babl.c:babl_builtin_respond src/babl.c:echo_selected_conversation_choice src/babl.c:babl_builtin_print src/babl.c:babl_builtin_pause src/babl.c:babl_builtin_get_quest src/babl.c:babl_builtin_set_quest src/babl.c:babl_builtin_sex src/babl.c:babl_builtin_do_offer src/babl.c:babl_builtin_do_demand src/babl.c:babl_builtin_do_decline src/babl.c:babl_builtin_do_judgement src/babl.c:babl_builtin_set_likes_dislikes src/babl.c:babl_builtin_setup_to_barter src/babl.c:babl_builtin_find_barter src/babl.c:babl_builtin_find_barter_total src/babl.c:babl_builtin_count_inv src/babl.c:babl_builtin_check_inv_quality src/babl.c:babl_builtin_set_inv_quality src/babl.c:babl_menu src/babl.c:babl_fmenu src/babl.c:run_babl_menu_wait_loop src/babl.c:select_babl_menu_response src/babl.c:sync_conv_vars_from_npc src/babl.c:sync_conv_vars_to_npc src/babl.c:check_npc_item_preference src/babl.c:barter_offer_is_empty src/babl.c:sum_barter_offer_value src/babl.c:compute_barter_item_value src/babl.c:finalize_npc_barter_items src/babl.c:finalize_player_barter_items src/babl.c:init_barter_ui src/babl.c:end_barter_ui src/babl.c:collect_included_player_barter_items src/babl.c:give_barter_item_by_item_id src/babl.c:add_item_to_npc_inventory src/babl.c:remove_item_from_npc_inventory_by_id
  src/ordinal_stubs.c:orduint_divmod src/ordinal_stubs.c:ce_strcmp src/ordinal_stubs.c:ce_tolower
  src/ordinal_stubs.c:ce_atoi src/ordinal_stubs.c:ce_memmove src/ordinal_stubs.c:ce_strstr
  src/ordinal_stubs.c:_strlwr src/ordinal_stubs.c:_isctype)

add_game_test_library(uw_test_cursor
  src/hud.c:uw_always_show_cursor src/hud.c:uw_composite_desktop_cursor
  src/hud.c:set_cursor_sprite_id
  src/hud.c:draw_idle_mouse_cursor src/hud.c:save_cursor_background
  src/hud.c:erase_cursor_icon src/hud.c:decrement_cursor_hide_depth
  src/hud.c:dirty_rect_union src/hud.c:dirty_rect_set
  src/3d.c:set_viewport_clip_rect
  src/gx_stub.c:@uw_frame_pacing src/gx_stub.c:@g_display_pacing
  src/gx_stub.c:@g_game_pacing src/gx_stub.c:uw_reset_frame_pacing
  src/gx_stub.c:uw_set_present_refresh_rate src/gx_stub.c:uw_claim_frame
  src/gx_stub.c:uw_present_frame_due src/gx_stub.c:uw_request_cursor_present
  src/gx_stub.c:uw_service_pending_present)
target_compile_options(uw_test_cursor PUBLIC
  -include "${CMAKE_CURRENT_SOURCE_DIR}/cursor_test_globals.h")
add_supported_game_unit_test(cursor uw_test_cursor)
target_compile_definitions(test_cursor PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_test(NAME cursor_stylus COMMAND test_cursor --stylus)
add_test(NAME cursor_enabled COMMAND test_cursor --enabled)
add_game_test_library(uw_test_introduction
  src/babl.c:babl_render_op_say
  src/babl.c:babl_render_op_wrap_message
  src/babl.c:babl_render_op_show_code
  src/ordinal_stubs.c:ce_memset
  src/ordinal_stubs.c:ce_strcat
  src/resources.c:get_message_string
  src/resources.c:decode_strings_pak_entry
  src/resources.c:walk_strings_pak_huffman_tree
  src/resources.c:read_strings_pak_bit
  src/ordinal_stubs.c:ce_strchr
  src/text.c:measure_text_width
  src/text.c:load_font_metrics)
target_sources(uw_test_introduction PRIVATE support/introduction_fixture.c)
target_include_directories(uw_test_introduction PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_introduction PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(introduction uw_test_introduction)
target_compile_definitions(test_introduction PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_introduction PRIVATE "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c")

add_game_test_library(uw_test_stair_transition
  src/level.c:transition_to_level
  src/level.c:teleport_object_to_level_tile
  src/player.c:dungeon_view_anim_tick
  src/objects.c:find_placement_via_tile_flood_fill
  src/player.c:sync_player_stats_to_hud
  src/doors.c:check_scheduled_object_level_match
  src/objects.c:find_object_in_world)
target_sources(uw_test_stair_transition PRIVATE support/stair_transition_fixture.c)
target_include_directories(uw_test_stair_transition PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_stair_transition PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(stair_transition uw_test_stair_transition)
target_compile_definitions(test_stair_transition PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

add_game_test_library(uw_test_npc_ai
  src/ai.c:@DAT_000853d8_backing
  src/ai.c:npc_ai_tick
  src/ai.c:npc_ai_default_tick
  src/ai.c:refresh_npc_target_delta
  src/ai.c:detect_npc_wander_proximity
  src/ai.c:compute_movement_heading
  src/ai.c:npc_wander_reposition
  src/ai.c:npc_walk_toward_tile
  src/ai.c:try_direct_line_walk
  src/ai.c:record_line_walk_step
  src/ai.c:pop_pending_path_cache_slot
  src/ai.c:compute_pathfind_search_radius
  src/ai.c:npc_notice_and_idle_tick
  src/ai.c:npc_set_goal
  src/ai.c:npc_set_walk_target
  src/combat.c:npc_combat_engage_close_tick
  src/combat.c:npc_combat_engage_wide_tick
  src/combat.c:try_npc_special_ability_alt
  src/combat.c:npc_combat_set_stance
  src/combat.c:load_monster_combat_stats)
target_sources(uw_test_npc_ai PRIVATE support/npc_ai_fixture.c)
target_include_directories(uw_test_npc_ai PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_npc_ai PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(npc_ai uw_test_npc_ai)
target_compile_definitions(test_npc_ai PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

add_game_test_library(uw_test_throw
  src/ai.c:@DAT_000868c0_backing
  src/ai.c:@physics_vz_remainder
  src/ai.c:@g_physics_vz_remainder src/ai.c:@g_stat_physics_ticks
  src/movement.c:@player_move_fraction
  src/movement.c:@g_player_move_fraction
  src/item_use.c:drop_held_object_near_player
  src/objects.c:spawn_object_near_player
  src/item_use.c:compute_drop_aim_from_cursor
  src/objects.c:compute_object_placement_fields
  src/ai.c:build_object_placement_snapshot
  src/collision.c:apply_placement_collision_sweep
  src/ai.c:mobile_object_tick
  src/ai.c:tick_mobile_objects
  src/ai.c:tick_physics_objects
  src/ai.c:physics_subtick_units
  src/ai.c:object_tick_is_due
  src/ai.c:@DAT_00101948
  src/movement.c:movement_pacing_handler
  src/movement.c:uw_frame_clock_ms
  src/gx_stub.c:@uw_frame_pacing
  src/gx_stub.c:@g_display_pacing
  src/gx_stub.c:@g_game_pacing
  src/gx_stub.c:uw_set_present_refresh_rate
  src/gx_stub.c:uw_reset_frame_pacing
  src/gx_stub.c:uw_claim_frame
  src/gx_stub.c:uw_service_game_clock
  src/ai.c:sync_object_tile_position
  src/input.c:set_locomotion_state
  src/input.c:apply_movement_mode_profile
  src/ai.c:settle_mobile_to_immobile
  src/movement.c:sweep_collision_flags
  src/movement.c:collision_flags_to_locomotion_code
  src/movement.c:collision_response_mobile_object
  src/collision.c:sort_collision_candidates
  src/collision.c:swap_collision_candidates
  src/objects.c:object_list_insert_head
  src/objects.c:object_list_unlink
  src/movement.c:movement_collision_sweep
  src/movement.c:movement_sweep_setup
  src/movement.c:sweep_init_position
  src/movement.c:reticle_object_pick
  src/movement.c:sweep_restart_remaining
  src/movement.c:sweep_kill_velocity
  src/movement.c:sweep_writeback_position
  src/movement.c:sweep_integrate_substep
  src/movement.c:sweep_deflect_heading
  src/movement.c:sweep_slide_along_wall
  src/movement.c:sweep_apply_knockback
  src/movement.c:sweep_land_on_surface
  src/movement.c:sweep_step_vertical
  src/movement.c:sweep_step
  src/movement.c:sweep_apply_collision)
target_sources(uw_test_throw PRIVATE support/throw_fixture.c)
target_include_directories(uw_test_throw PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_throw PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(throw uw_test_throw)
target_compile_definitions(test_throw PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_throw PRIVATE "${PROJECT_SOURCE_DIR}/src/debug.c")
add_supported_game_unit_test(player_move_direction uw_test_throw)
target_compile_definitions(test_player_move_direction PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_player_move_direction PRIVATE "${PROJECT_SOURCE_DIR}/src/debug.c")
add_supported_game_unit_test(throw_tick_rate uw_test_throw)
target_compile_definitions(test_throw_tick_rate PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_throw_tick_rate PRIVATE "${PROJECT_SOURCE_DIR}/src/debug.c")

add_game_test_library(uw_test_throw_cursor
  src/item_use.c:drop_held_object_near_player
  src/objects.c:spawn_object_near_player
  src/item_use.c:compute_drop_aim_from_cursor
  src/hud.c:get_mouse_position
  src/objects.c:compute_object_placement_fields
  src/object_actions.c:check_object_drop_height
  src/math.c:project_position_by_heading
  src/objects.c:object_list_insert_head)
target_sources(uw_test_throw_cursor PRIVATE support/throw_cursor_fixture.c)
target_include_directories(uw_test_throw_cursor PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_throw_cursor PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(throw_cursor uw_test_throw_cursor)
target_compile_definitions(test_throw_cursor PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_throw_cursor PRIVATE "${PROJECT_SOURCE_DIR}/src/debug.c")

add_game_test_library(uw_test_lighting
  src/item_use.c:use_light_source
  src/player.c:refresh_player_equipment_effects
  src/visibility.c:load_shading_level_config
  src/visibility.c:build_visibility_light_grid
  src/math.c:integer_sqrt
  src/lights.c:%UW_EYE_TO_LIGHT_UNITS src/lights.c:@g_extra_light_sources src/lights.c:%UW_EXTRA_LIGHT_SOURCE_COUNT
  src/lights.c:extra_light_add src/lights.c:extra_lights_reset src/lights.c:extra_lights_consider_object
  src/lights.c:@g_shade_rows_dirty src/lights.c:@g_shade_row_factor src/lights.c:@g_fit_a
  src/lights.c:palette_luminance src/lights.c:fit_formula_to_rows src/lights.c:rebuild_shade_row_factors
  src/lights.c:light_max_distance_tiles src/lights.c:near_start_factor
  src/lights.c:windowed_factor src/lights.c:linear_factor src/lights.c:dos_shade_factor
  src/lights.c:@light_round_frame
  src/lights.c:@g_light_round_frame
  src/lights.c:light_pass_prepare
  src/lights.c:light_rounded_distance
  src/lights.c:shade_span_pixel
  src/3d.c:raster_textured_span src/3d.c:update_fullbright_palette_mask
  src/graphics.c:build_shade_lut
  src/graphics.c:get_ambient_bias_reduction
  src/graphics.c:set_ambient_bias_with_light
  src/graphics.c:set_ambient_bias_without_light
  src/ordinal_stubs.c:ordfloat_bits_to_float
  src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_int_to_float2
  src/ordinal_stubs.c:ordfloat_mul
  src/ordinal_stubs.c:ordfloat_uint_to_float)
target_sources(uw_test_lighting PRIVATE support/lighting_fixture.c)
target_include_directories(uw_test_lighting PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_lighting PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(lighting uw_test_lighting)
target_compile_definitions(test_lighting PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_lighting PRIVATE "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c")

add_game_test_library(uw_test_critter_palette
  src/object_actions.c:resolve_critter_sprite_tier
  src/object_actions.c:decode_critter_sprite_page
  src/resources.c:decompress_gr_bitmap
  src/resources.c:merge_byte_into_word
  src/resources.c:select_gr_bitmap_remap_table
  src/resources.c:decode_gr_rle_stream
  src/bitmap.c:blit_sprite_row_remapped)
target_sources(uw_test_critter_palette PRIVATE support/critter_palette_fixture.c)
target_include_directories(uw_test_critter_palette PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_critter_palette PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(critter_palette uw_test_critter_palette)
target_compile_definitions(test_critter_palette PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

add_game_test_library(uw_test_creatures
  src/object_actions.c:resolve_critter_sprite_tier
  src/ai.c:spawn_creature_death_loot
  src/ai.c:spawn_creature_treasure_drop
  src/ai.c:spawn_creature_special_item_drop
  src/ai.c:spawn_creature_equipment_drop
  src/ai.c:spawn_creature_misc_item_drop
  src/ai.c:drop_monster_loot
  src/ai.c:drop_creature_inventory_on_death
  src/containers.c:empty_container_into_world
  src/objects.c:spawn_new_object
  src/objects.c:object_list_insert_head
  src/ai.c:spawn_npc_thrown_weapon
  src/objects.c:spawn_object_near_player
  src/objects.c:compute_object_placement_fields
  src/ai.c:settle_mobile_to_immobile)
target_sources(uw_test_creatures PRIVATE support/creatures_fixture.c)
target_include_directories(uw_test_creatures PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_creatures PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(creatures uw_test_creatures)
target_compile_definitions(test_creatures PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

add_game_test_library(uw_test_gx_pacing
  src/gx_stub.c:@uw_present_state
  src/gx_stub.c:@g_present_state
  src/gx_stub.c:uw_begin_present_batch
  src/gx_stub.c:uw_end_present_batch
  src/gx_stub.c:gfx_finalizedraw
  src/gx_stub.c:uw_take_completed_frame
  src/gx_stub.c:uw_defer_present
  src/gx_stub.c:@uw_frame_pacing
  src/gx_stub.c:@g_display_pacing
  src/gx_stub.c:@g_game_pacing
  src/gx_stub.c:uw_set_present_refresh_rate
  src/gx_stub.c:uw_reset_frame_pacing
  src/gx_stub.c:uw_claim_frame
  src/gx_stub.c:uw_request_cursor_present
  src/gx_stub.c:uw_record_completed_present
  src/gx_stub.c:uw_present_frame_due
  src/gx_stub.c:uw_service_pending_present
  src/gx_stub.c:uw_service_game_clock)
target_sources(uw_test_gx_pacing PRIVATE support/gx_pacing_fixture.c)
target_include_directories(uw_test_gx_pacing PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_gx_pacing PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(gx_pacing uw_test_gx_pacing)
target_compile_definitions(test_gx_pacing PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

add_game_test_library(uw_test_look_pacing
  src/gx_stub.c:poll_dungeon_movement_keys
  src/input.c:set_held_movement_keys
  src/gx_stub.c:@uw_frame_pacing
  src/gx_stub.c:@g_display_pacing
  src/gx_stub.c:@g_game_pacing
  src/gx_stub.c:uw_set_present_refresh_rate
  src/gx_stub.c:uw_reset_frame_pacing
  src/gx_stub.c:uw_claim_frame
  src/gx_stub.c:uw_present_frame_due
  src/gx_stub.c:uw_service_pending_present
  src/gx_stub.c:uw_service_game_clock)
target_sources(uw_test_look_pacing PRIVATE support/look_pacing_fixture.c)
target_include_directories(uw_test_look_pacing PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_look_pacing PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(look_pacing uw_test_look_pacing)
target_compile_definitions(test_look_pacing PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

add_game_test_library(uw_test_inventory_drag
  src/item_use.c:attach_picked_up_object_to_cursor
  src/input.c:wait_for_click_release
  src/movement.c:movement_pacing_handler
  src/hud.c:poll_keyboard_char_input
  src/hud.c:poll_mouse_button_flags
  src/hud.c:handle_mouse_button_message
  src/gx_stub.c:@uw_frame_pacing
  src/gx_stub.c:@g_display_pacing
  src/gx_stub.c:@g_game_pacing
  src/gx_stub.c:uw_set_present_refresh_rate
  src/gx_stub.c:uw_reset_frame_pacing
  src/gx_stub.c:uw_claim_frame
  src/gx_stub.c:uw_present_frame_due
  src/gx_stub.c:uw_service_pending_present
  src/gx_stub.c:uw_service_game_clock)
target_sources(uw_test_inventory_drag PRIVATE support/inventory_drag_fixture.c)
target_include_directories(uw_test_inventory_drag PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_inventory_drag PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(inventory_drag uw_test_inventory_drag)
target_compile_definitions(test_inventory_drag PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")

foreach(suite introduction stair_transition npc_ai throw throw_cursor lighting critter_palette creatures gx_pacing look_pacing inventory_drag)
  target_include_directories(uw_test_${suite} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
  target_compile_options(uw_test_${suite} PUBLIC -include "${CMAKE_CURRENT_SOURCE_DIR}/${suite}_test_globals.h")
endforeach()
# The look poller is static; compile its extracted body with its SDL fixture.
set_source_files_properties("${CMAKE_CURRENT_BINARY_DIR}/uw_test_look_pacing_functions.c"
  PROPERTIES HEADER_FILE_ONLY TRUE)
target_include_directories(uw_test_look_pacing PUBLIC ${SDL2_INCLUDE_DIRS} "${CMAKE_CURRENT_BINARY_DIR}")

# platform_voice.c's voice_source_load picks between the Pocket PC asset
# set's RIFF \SOUND\VOCnn.WAV and the DOS set's Creative \SOUND\nn.VOC for
# the same sample id. It is static and stays that way -- its real body is
# compiled into the fixture, the arrangement uw_test_look_pacing uses for
# its own static poller -- so this needs the real SDL, file_io.c and the
# vendored OpenAbyss VOC reader rather than stubs for any of them.
add_game_test_library(uw_test_voice
  src/platform_voice.c:@voice_source
  src/platform_voice.c:voice_source_load)
set_source_files_properties("${CMAKE_CURRENT_BINARY_DIR}/uw_test_voice_functions.c"
  PROPERTIES HEADER_FILE_ONLY TRUE)
target_sources(uw_test_voice PRIVATE support/voice_fixture.c
  "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_sound.c"
  "${PROJECT_SOURCE_DIR}/third_party/openabyss/uw_blob.c")
target_include_directories(uw_test_voice PUBLIC
  "${CMAKE_CURRENT_SOURCE_DIR}/support" "${CMAKE_CURRENT_BINARY_DIR}"
  ${SDL2_INCLUDE_DIRS} "${PROJECT_SOURCE_DIR}/third_party/openabyss")
target_link_directories(uw_test_voice PUBLIC ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_test_voice PUBLIC ${SDL2_LIBRARIES})
target_compile_definitions(uw_test_voice PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(voice uw_test_voice)

# models_dos.c decodes the DOS asset set's 3D models out of UW.EXE. The suite
# assembles its own UW.EXE-shaped file, so it needs no DOS install -- just the
# real models_dos.c, file_io.c and debug.c.
add_library(uw_test_models_dos STATIC
  "${PROJECT_SOURCE_DIR}/src/models_dos.c"
  "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c")
uw_configure_test_target(uw_test_models_dos)
add_supported_game_unit_test(models_dos uw_test_models_dos)

add_library(uw_test_division STATIC support/division.c)
uw_configure_test_target(uw_test_division)
foreach(suite npc_ai throw throw_cursor lighting creatures stair_transition inventory_drag)
  target_link_libraries(uw_test_${suite} PUBLIC uw_test_division)
endforeach()

target_sources(uw_test_throw PRIVATE support/throw_storage.c)
target_sources(uw_test_throw_cursor PRIVATE support/throw_storage.c)
add_game_test_library(uw_test_transitions
  src/babl.c:render_babl_dialog_window
  src/babl.c:display_book_or_scroll_page
  src/babl.c:bubble_sort_indices_by_key_table
  src/babl.c:babl_render_tick
  src/babl.c:FUN_000362e8
  src/babl.c:FUN_00036300
  src/babl.c:FUN_00036308
  src/babl.c:FUN_00036394
  src/babl.c:FUN_000363f0
  src/babl.c:FUN_00036404
  src/babl.c:FUN_00036418
  src/babl.c:FUN_000365bc
  src/babl.c:FUN_000365fc
  src/babl.c:FUN_0003663c
  src/babl.c:FUN_00036698
  src/babl.c:FUN_00036344
  src/babl.c:babl_render_op_show_code
  src/babl.c:decompress_rle_stream
  src/babl.c:pack_byte_into_word
  src/babl.c:read_rle_op_code
  src/babl.c:rle_op_handle_short_run
  src/babl.c:rle_op_copy_pairs_even
  src/babl.c:rle_op_copy_pairs_odd
  src/babl.c:rle_op_fill_doubled_byte_even
  src/babl.c:rle_op_fill_doubled_byte_odd
  src/babl.c:rle_op_finalize_length
  src/babl.c:rle_op_mark_stream_done
  src/audio.c:load_voice_sample_page
  src/audio.c:read_voice_sample_page_chunk
  src/ordinal_stubs.c:ordfloat_bits_to_float
  src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_int_to_float2
  src/ordinal_stubs.c:ordfloat_mul
  src/ordinal_stubs.c:ordfloat_uint_to_float
  src/ordinal_stubs.c:ordfloat_int_to_float
  src/graphics.c:expand_pals_bytes
  src/graphics.c:convert_palette_bgrx_to_rgb
  src/graphics.c:build_rgb565_palette
  src/graphics.c:get_palette_brightness_bits
  src/graphics.c:bitmap_blit_to_framebuffer
  src/graphics.c:fade_in
  src/graphics.c:fade_out
  src/chargen.c:chargen_normalize_record_stride
  src/chargen.c:run_character_generator
  src/level.c:enter_dungeon_view
  src/hud.c:run_pause_menu_modal_loop
  src/graphics.c:blit_fullscreen_bitmap_file
  src/hud.c:flush_dirty_rect_to_display
  src/hud.c:dirty_rect_union
  src/hud.c:main_loop_hud_flush
  src/graphics.c:flush_dungeon_frame
  src/hud.c:scroll_text_entry_prompt
  src/ordinal_stubs.c:ce_strlen
  src/game.c:set_pending_update_flags
  src/game.c:@DAT_00085668_real_table
  src/gx_stub.c:@uw_present_state
  src/gx_stub.c:@g_present_state
  src/gx_stub.c:uw_begin_present_batch
  src/gx_stub.c:uw_end_present_batch
  src/gx_stub.c:gfx_finalizedraw
  src/gx_stub.c:uw_take_completed_frame
  src/gx_stub.c:uw_suspend_present_batch
  src/gx_stub.c:uw_resume_present_batch
  src/gx_stub.c:uw_begin_modal_present
  src/gx_stub.c:uw_end_modal_present
  src/gx_stub.c:uw_defer_present
  src/ordinal_stubs.c:GetFileSize
  src/input.c:wait_for_click_release
  src/input.c:next_input_event
  src/input.c:peek_input_event
  src/input.c:poll_input_event
  src/input.c:poll_mouse_event
  src/hud.c:poll_mouse_button_flags
  src/input.c:process_pending_keyboard_scan_code
  src/input.c:get_alternate_keyboard_scan_code)
target_sources(uw_test_transitions PRIVATE support/transitions_fixture.c)
target_include_directories(uw_test_transitions PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_transitions PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(transitions uw_test_transitions)
target_compile_definitions(test_transitions PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_sources(test_transitions PRIVATE "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c")

add_game_test_library(uw_test_spell_runes
  src/hud.c:@DAT_00087530_backing
  src/hud.c:handle_cast_spell_click
  src/hud.c:cast_spell_from_rune_combo
  src/hud.c:report_spell_cast_failure
  src/hud.c:print_not_a_spell_message)
target_sources(uw_test_spell_runes PRIVATE support/spell_runes_fixture.c)
target_include_directories(uw_test_spell_runes PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_spell_runes PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
add_supported_game_unit_test(spell_runes uw_test_spell_runes)
target_compile_definitions(test_spell_runes PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
foreach(suite transitions spell_runes)
  target_include_directories(uw_test_${suite} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
  target_compile_options(uw_test_${suite} PUBLIC -include "${CMAKE_CURRENT_SOURCE_DIR}/${suite}_test_globals.h")
endforeach()

target_link_libraries(uw_test_spell_runes PUBLIC uw_test_division)

target_link_libraries(uw_test_transitions PUBLIC uw_test_division)

foreach(suite creatures critter_palette throw throw_cursor)
  target_link_libraries(uw_test_${suite} PUBLIC uw_test_support)
endforeach()

add_game_test_library(uw_test_spell_effects
  src/hud.c:@DAT_00087530_backing
  src/spells.c:@DAT_00087604_backing
  src/object_actions.c:@DAT_0008762c_backing
  src/traps.c:dispatch_trap_special_or_tile_action
  src/object_actions.c:dispatch_tile_special_action
  src/spells.c:cast_cone_damage_spell
  src/spells.c:cast_targeted_search_effect
  src/object_actions.c:scan_area_ahead_of_object
  src/spells.c:force_unlock_target_object
  src/spells.c:cast_single_tile_spell_effect
  src/spells.c:cast_area_spell_effect
  src/spells.c:trigger_type_flagged_trap_effect
  src/spells.c:trigger_tile_damage_trap_effect
  src/spells.c:morph_tile_object_state
  src/spells.c:trigger_permanent_object_state_effect
  src/spells.c:apply_tile_morph_variant_2
  src/spells.c:apply_tile_morph_variant_6
  src/spells.c:apply_tile_morph_variant_7
  src/object_actions.c:damage_all_objects_at_tile
  src/ai.c:@DAT_000853b0_backing
  src/ai.c:@DAT_000853c0_backing
  src/ai.c:@DAT_000853cc_backing
  src/ai.c:tile_pair_los_blocked
  src/ai.c:save_walk_path_to_cache_slot
  src/ai.c:advance_cached_path_step)
target_sources(uw_test_spell_effects PRIVATE support/spell_effects_fixture.c)
target_include_directories(uw_test_spell_effects PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_options(uw_test_spell_effects PUBLIC
  -include "${CMAKE_CURRENT_SOURCE_DIR}/support/spell_effects_fixture.h")
target_link_libraries(uw_test_spell_effects PUBLIC uw_test_support)
add_supported_game_unit_test(spell_effects uw_test_spell_effects)

# Audit fixes: test original constants and shared field views using actual game declarations.
set(restored_tables_source "${CMAKE_CURRENT_BINARY_DIR}/restored_tables_generated.c")
add_custom_command(OUTPUT "${restored_tables_source}"
  COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/generate_restored_tables.py"
    --root "${PROJECT_SOURCE_DIR}" --audit "${CMAKE_CURRENT_SOURCE_DIR}/fixtures/restored_tables.json"
    --output "${restored_tables_source}"
  DEPENDS tools/generate_restored_tables.py tools/extract_functions.py fixtures/restored_tables.json
    "${PROJECT_SOURCE_DIR}/src/audio.c" "${PROJECT_SOURCE_DIR}/src/babl.c"
    "${PROJECT_SOURCE_DIR}/src/graphics.c" "${PROJECT_SOURCE_DIR}/src/input.c"
    "${PROJECT_SOURCE_DIR}/src/player.c" "${PROJECT_SOURCE_DIR}/src/models.c"
    "${PROJECT_SOURCE_DIR}/src/traps.c" "${PROJECT_SOURCE_DIR}/src/math.c"
    "${PROJECT_SOURCE_DIR}/src/item_use.c" "${PROJECT_SOURCE_DIR}/src/game.c"
  VERBATIM)
add_library(uw_test_restored_tables STATIC "${restored_tables_source}" support/restored_tables_fixture.c)
uw_configure_test_target(uw_test_restored_tables)
target_include_directories(uw_test_restored_tables PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_link_libraries(uw_test_restored_tables PUBLIC uw_test_support)
add_supported_game_unit_test(restored_tables uw_test_restored_tables)

add_fixture_game_unit_test(special_use
  src/item_use.c:dispatch_use_special_item_by_type
  src/traps.c:dispatch_trap_special_or_tile_action
  src/object_actions.c:dispatch_tile_special_action
  src/spells.c:execute_spell_effect
  src/object_actions.c:resolve_object_variant_or_special_link
  src/objects.c:find_object_in_chain
  src/objects.c:resolve_object_link
  src/objects.c:encode_object_slot_index
  src/object_actions.c:scan_area_for_matching_objects
  src/object_actions.c:scan_area_ahead_of_object
  src/player.c:detect_unsafe_rest_object_callback
  src/player.c:check_rest_area_unsafe
  src/spells.c:apply_healing_effect
  src/player.c:restore_stat_capped
  src/tmap.c:tilemap_lookup)

add_fixture_game_unit_test(sleep
  src/item_use.c:dispatch_use_special_item_by_type
  src/player.c:handle_rest_action src/player.c:check_rest_area_unsafe
  src/player.c:detect_unsafe_rest_object_callback
  src/player.c:adjust_player_hp src/player.c:adjust_level7_hazard_value
  src/player.c:adjust_player_hunger src/player.c:restore_stat_capped
  src/player.c:decay_equipped_light_sources
  src/level.c:trigger_random_level_special_event
  src/weapon_swing.c:weapon_overlay_flash_hold
  src/weapon_swing.c:weapon_overlay_flash_restore
  src/traps.c:process_nearby_background_traps
  src/traps.c:is_out_of_player_range
  src/traps.c:dispatch_trap_type_effect
  src/traps.c:check_object_area_for_spawn_block
  src/traps.c:detect_spawn_blocking_object_callback
  src/objects.c:find_object_in_world src/objects.c:find_object_in_chain
  src/objects.c:object_ptr_in_arena
  src/objects.c:despawn_objects_outside_radius
  src/objects.c:should_destroy_linked_object src/ai.c:roll_object_destroy_chance
  src/objects.c:walk_object_tree src/objects.c:object_exceeds_size_threshold
  src/objects.c:resolve_object_link src/objects.c:get_object_record_by_slot_index
  src/objects.c:encode_object_slot_index src/objects.c:object_list_insert_head
  src/objects.c:object_list_unlink src/objects.c:unlink_and_free_object
  src/objects.c:free_object_slot src/objects.c:free_linked_object_recursive
  src/object_actions.c:scan_area_for_matching_objects
  src/object_actions.c:scan_area_ahead_of_object
  src/tmap.c:tilemap_lookup)
target_sources(uw_test_sleep PRIVATE support/special_use_fixture.c)
target_compile_definitions(uw_test_sleep PRIVATE UW_TEST_FULL_REST)

# These fixtures own very large globals (a whole level's tile map, visibility ring buffers, ...).
# As tentative (common) definitions ld caps their alignment and warns, so give them real storage.
foreach(suite new_game traps visibility_walk)
  target_compile_options(uw_test_${suite} PRIVATE -fno-common)
endforeach()

# Independent packing checks before object-pointer/field migrations.
add_supported_game_unit_test(object_layout)
# Coccinelle semantic-patch checks: they re-parse the whole of src/ with spatch
# and take minutes where the rest of the suite takes seconds (530s against 6s
# when measured on this tree). They are a tool for large type-conversion
# batches -- proving a field migration reached every access -- not something to
# pay for on an ordinary run, so they are OFF unless asked for:
#
#   cmake -S . -B build -DUW_SPATCH_TESTS=ON && ctest --test-dir build
#
option(UW_SPATCH_TESTS
  "Register the Coccinelle (spatch) semantic-patch tests. Slow; for large type-conversion batches." OFF)
if(UW_SPATCH_TESTS)
  find_program(UW_SPATCH_EXECUTABLE spatch)
  if(NOT UW_SPATCH_EXECUTABLE)
    message(FATAL_ERROR
      "UW_SPATCH_TESTS=ON but spatch was not found. Install Coccinelle (brew install coccinelle) "
      "or configure without -DUW_SPATCH_TESTS=ON.")
  endif()
  add_test(NAME object_semantic_patches
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_object_semantic_patches.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME named_struct_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_named_struct_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME partial_field_reads
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_partial_field_reads.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME named_struct_writes
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_named_struct_writes.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME packed_struct_stores
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_packed_struct_stores.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME packed_field_copies
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_packed_field_copies.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME npc_spawn_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_npc_spawn_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME npc_goal_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_npc_goal_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME player_position_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_player_position_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME player_reset_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_player_reset_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME position_sync_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_position_sync_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME shared_mobile_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_shared_mobile_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME mobile_consumer_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_mobile_consumer_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME npc_interaction_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_npc_interaction_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME projectile_spawn_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_projectile_spawn_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME projectile_lifecycle_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_projectile_lifecycle_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME void_object_headers
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_void_object_headers.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME npc_death_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_npc_death_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME inventory_record_words
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_inventory_record_words.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME trap_pair_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_trap_pair_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME trap_consumer_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_trap_consumer_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME debris_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_debris_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME scheduled_spawn_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_scheduled_spawn_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME item_scatter_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_item_scatter_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME stack_split_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_stack_split_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME durability_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_durability_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME light_decay_fields
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_light_decay_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME starvation_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_starvation_fields.py")
  add_test(NAME ranged_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_ranged_fields.py")
  add_test(NAME monster_loot_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_monster_loot_fields.py")
  add_test(NAME babl_stuff_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_babl_stuff_fields.py")
  add_test(NAME approach_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_approach_fields.py")
  add_test(NAME settle_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_settle_fields.py")
  add_test(NAME combat_position_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_combat_position_fields.py")
  add_test(NAME disengage_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_disengage_fields.py")
  add_test(NAME drop_height_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_drop_height_fields.py")
  add_test(NAME slot_fit_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_slot_fit_fields.py")
  add_test(NAME scheduler_finish_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_scheduler_finish_fields.py")
  add_test(NAME combat_stance_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_combat_stance_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME special_header_reads
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_special_header_reads.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME promoted_struct_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_promoted_struct_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  add_test(NAME light_use_fields
    COMMAND "${Python3_EXECUTABLE}" -B
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_light_use_fields.py"
      "${UW_SPATCH_EXECUTABLE}")
  find_program(UW_CLANG_EXECUTABLE clang)
  if(UW_CLANG_EXECUTABLE)
    add_test(NAME current_object_aliases
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_SOURCE_DIR}/tools/test_current_object_aliases.py"
        "${UW_SPATCH_EXECUTABLE}" "${UW_CLANG_EXECUTABLE}")
  endif()
endif()
add_game_test_library(uw_test_object_weight src/objects.c:calculate_object_weight)
add_supported_game_unit_test(object_weight uw_test_object_weight)
add_game_test_library(uw_test_object_core
  src/objects.c:spawn_new_object src/objects.c:resolve_object_link
  src/objects.c:find_object_in_chain src/objects.c:find_object_by_encoded_slot_in_chain
  src/objects.c:object_list_insert_head src/objects.c:object_list_append_tail
  src/objects.c:object_list_unlink src/containers.c:sum_container_weight
  src/item_use.c:objects_can_stack)
add_supported_game_unit_test(object_core uw_test_object_core uw_test_division)
add_game_test_library(uw_test_npc_state src/ai.c:npc_set_goal src/ai.c:npc_set_walk_target
  src/combat.c:npc_combat_disengage_tick src/combat.c:npc_combat_position_tick)
add_supported_game_unit_test(npc_state uw_test_npc_state)

# A cold save restore must work before any level archive seeds the free lists.
add_game_test_library(uw_test_save_inventory
  src/level.c:reset_level_object_arena
  src/objects.c:alloc_object_slot src/objects.c:encode_object_slot_index
  src/objects.c:resolve_object_link
  src/player.c:restore_player_save_record src/player.c:build_player_save_record
  src/inventory.c:deserialize_inventory_link_chain
  src/inventory.c:serialize_inventory_link_chain
  src/inventory.c:alloc_save_record_slot src/inventory.c:save_record_slot_from_index
  src/containers.c:encode_equipped_item_index src/containers.c:decode_equipped_item_index)
target_compile_options(uw_test_save_inventory PRIVATE
  -include "${CMAKE_CURRENT_SOURCE_DIR}/save_inventory_test_globals.h")
add_supported_game_unit_test(save_inventory uw_test_save_inventory uw_test_division)

# NPC collision-response profiles must be populated in the buffers the sweep actually reads.
add_fixture_game_unit_test(collision_profiles src/movement.c:init_collision_response_profiles)

# Real-game tests: the whole game (uw_game_objs) with a test-supplied main(), run headless through
# start_test_game (src/unit_test_hooks.c). These link no fixtures -- fixtures replace game code, these
# run it. Unity is linked without the options library because the game objects already define g_opts.
add_library(unity_bare STATIC "${PROJECT_SOURCE_DIR}/third_party/unity/src/unity.c")
target_include_directories(unity_bare PUBLIC "${PROJECT_SOURCE_DIR}/third_party/unity/src")
function(add_test_game_executable name)
  add_executable(test_${name} "${CMAKE_CURRENT_SOURCE_DIR}/test_${name}.c"
    $<TARGET_OBJECTS:uw_game_objs>)
  target_include_directories(test_${name} PRIVATE "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/support"
    ${SDL2_INCLUDE_DIRS} "${PROJECT_SOURCE_DIR}/third_party/hxcmod" "${PROJECT_SOURCE_DIR}/third_party/openabyss")
  target_link_directories(test_${name} PRIVATE ${SDL2_LIBRARY_DIRS})
  target_link_libraries(test_${name} PRIVATE unity_bare ${SDL2_LIBRARIES})
  add_dependencies(unit_tests test_${name})
  add_test(NAME ${name} COMMAND test_${name} WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}")
endfunction()
add_test_game_executable(game_hooks)
add_test_game_executable(teleport_game)
add_test_game_executable(new_game_game)
add_test_game_executable(traps_game)
add_test_game_executable(visibility_walk_game)
add_test_game_executable(npc_ai_game)
add_test_game_executable(movement_game)

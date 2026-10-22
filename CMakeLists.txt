cmake_minimum_required(VERSION 3.16)
project(uw1_decomp C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()
set(CMAKE_C_FLAGS_DEBUG "-g -O0")

# The decompiled code treats plain `char` as signed (Ghidra's meaning: `char` is signed, `byte` and
# `undefined1` are not) and compares chars with -1, sign-extends them and so on. Plain char is
# unsigned on ARM Linux, so pin it to signed everywhere to keep behaviour identical on every target.
add_compile_options(-fsigned-char)

# glibc hides dladdr/Dl_info (used by the debug helpers) unless _GNU_SOURCE is defined.
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  add_compile_definitions(_GNU_SOURCE)
endif()

# Directory the unit tests read game data from. Defaults to the real data/ folder; point it at a
# synthetic tree (tests/tools/make_synthetic_data.py) to run without the real game files.
set(UW_TEST_DATA_DIR "${PROJECT_SOURCE_DIR}/data" CACHE PATH "Game data directory used by the unit tests")

# The game uses libm (lround etc.); glibc needs it on the link line, macOS folds it into libc.
# link_libraries applies to every executable defined below, including those under tests/.
if(UNIX)
  link_libraries(m)
endif()

# GNU ld resolves static archives strictly left to right, and the unit-test archives reference each
# other in both directions (macOS's linker rescans on its own), so group the libraries on Linux.
# UW_LINK_GROUP_TEST exercises the same rule on other platforms, with the group flags dropped.
if(CMAKE_SYSTEM_NAME STREQUAL "Linux" OR UW_LINK_GROUP_TEST)
  if(UW_LINK_GROUP_TEST)
    set(uw_group_begin "")
    set(uw_group_end "")
  else()
    set(uw_group_begin "-Wl,--start-group")
    set(uw_group_end "-Wl,--end-group")
  endif()
  set(CMAKE_C_LINK_EXECUTABLE
    "<CMAKE_C_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> ${uw_group_begin} <LINK_LIBRARIES> ${uw_group_end}")
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(SDL2 REQUIRED sdl2)

# uw.c no longer exists: every function and global variable it held has
# been split out into matching src/*.c files (see struct-recovery-plan.md
# and the cleanup goal). Function declarations and the extern globals
# they own both live in the matching src/headers/*.h for the .c file
# that defines them; uw.h remains only for shared types/macros and the
# handful of globals with no single owning file.
set(UW_SOURCES
  src/graphics.c
  src/game.c
  src/chargen.c
  src/babl.c
  src/automap.c
  src/inventory.c
  src/combat.c
  src/bitmap.c
  src/3d.c
  src/lights.c
  src/player.c
  src/tmap.c
  src/objects.c
  src/hud.c
  src/ai.c
  src/containers.c
  src/interact.c
  src/traps.c
  src/scheduler.c
  src/resources.c
  src/item_use.c
  src/movement.c
  src/visibility.c
  src/saveload.c
  src/text.c
  src/collision.c
  src/input.c
  src/object_actions.c
  src/spells.c
  src/fullscreen_view.c
  src/weapon_swing.c
  src/level.c
  src/doors.c
  src/winfile_wrappers.c
  src/models_dos.c
  src/models.c
  src/math.c
  src/registration.c
  src/audio.c
  src/platform_music.c
  src/platform_sfx.c
  src/platform_voice.c
  src/platform_dosmidi.c
  src/main.c
  src/unit_test_hooks.c
  src/options.c
  src/gx_stub.c
  src/mouselook.c
  src/ordinal_stubs.c
  src/file_io.c
  src/demomode.c
  src/democapture.c
  src/debug.c
  src/debug_ui.c
  third_party/hxcmod/hxcmod.c
  # The authentic DOS audio path (--audio-mode=dos): OpenAbyss's
  # reverse-engineered ADLIB.ADV driver model, its voice layer and its OPL2.
  # MIT -- see third_party/openabyss/VENDORING.md.
  third_party/openabyss/uw_opl.c
  third_party/openabyss/uw_adlib.c
  third_party/openabyss/uw_ail.c
  third_party/openabyss/uw_sound.c
  third_party/openabyss/uw_blob.c
  src/debug_shim.c
)

# The whole game minus its main(), compiled once and shared by the game executable and the
# unit-test game harness (tests/CMakeLists.txt: add_test_game_executable), whose tests supply their own main().
add_library(uw_game_objs OBJECT ${UW_SOURCES})
target_include_directories(uw_game_objs PUBLIC ${SDL2_INCLUDE_DIRS} third_party/hxcmod third_party/openabyss)
target_compile_options(uw_game_objs PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -fno-common
)
target_compile_definitions(uw_game_objs PRIVATE UW_TEST_DATA_DIR="${UW_TEST_DATA_DIR}")

add_executable(uw_dbg src/program_main.c $<TARGET_OBJECTS:uw_game_objs>)

target_include_directories(uw_dbg PRIVATE ${SDL2_INCLUDE_DIRS} third_party/hxcmod third_party/openabyss)
target_link_directories(uw_dbg PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_dbg PRIVATE ${SDL2_LIBRARIES})
target_compile_options(uw_dbg PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -fno-common
)

set_target_properties(uw_dbg PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

# ASan-instrumented twin of uw_dbg, for run-regressions.sh (which uses this
# by default -- see its own comment) so the regression suite actually
# catches memory-safety bugs (confirmed real ones this way: a heap-buffer-
# overflow in blit_sprite_row_remapped) instead of silently reading/writing
# adjacent heap memory. Kept as a separate target rather than folding into
# uw_dbg itself so day-to-day interactive playtesting isn't slowed down by
# ASan's overhead.
add_executable(uw_asan src/program_main.c ${UW_SOURCES})

target_include_directories(uw_asan PRIVATE ${SDL2_INCLUDE_DIRS} third_party/hxcmod third_party/openabyss)
target_link_directories(uw_asan PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_asan PRIVATE ${SDL2_LIBRARIES})
target_compile_options(uw_asan PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -fno-common
  -fsanitize=address
  -fno-omit-frame-pointer
)
target_link_options(uw_asan PRIVATE -fsanitize=address)

set_target_properties(uw_asan PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(tests)
endif()

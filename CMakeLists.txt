cmake_minimum_required(VERSION 3.16)
project(uw1_decomp C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()
set(CMAKE_C_FLAGS_DEBUG "-g -O0")

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
  src/options.c
  src/gx_stub.c
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

add_executable(uw_dbg ${UW_SOURCES})

target_include_directories(uw_dbg PRIVATE ${SDL2_INCLUDE_DIRS} third_party/hxcmod third_party/openabyss)
target_link_directories(uw_dbg PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_dbg PRIVATE ${SDL2_LIBRARIES})
target_compile_options(uw_dbg PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -Wno-pointer-sign
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
add_executable(uw_asan ${UW_SOURCES})

target_include_directories(uw_asan PRIVATE ${SDL2_INCLUDE_DIRS} third_party/hxcmod third_party/openabyss)
target_link_directories(uw_asan PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_asan PRIVATE ${SDL2_LIBRARIES})
target_compile_options(uw_asan PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -Wno-pointer-sign
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

//! Zig build (Zig 0.16 and 0.17) for the UW1 PocketPC decomp port: an alternative to CMakeLists.txt that
//! cross-compiles the game (`uw_dbg`) for any target Zig supports.
//!
//!   zig build                                  native build, system SDL2 (pkg-config)
//!   zig build -Dtarget=x86_64-windows-gnu      cross build, SDL2 built from source
//!   zig build -Dtarget=x86_64-linux-gnu
//!   zig build -Dtarget=aarch64-macos
//!   zig build run -- --data-dir data           build and run
//!
//! SDL2 comes from the system when building for the host (override with
//! -Dsystem-sdl=false/true); otherwise it is built from the `sdl2` dependency
//! (allyourcodebase/SDL3, branch SDL2).
const std = @import("std");

// Keep in step with UW_SOURCES in CMakeLists.txt.
const uw_sources = [_][]const u8{
    "src/graphics.c",
    "src/game.c",
    "src/chargen.c",
    "src/babl.c",
    "src/automap.c",
    "src/inventory.c",
    "src/combat.c",
    "src/bitmap.c",
    "src/3d.c",
    "src/lights.c",
    "src/player.c",
    "src/tmap.c",
    "src/objects.c",
    "src/hud.c",
    "src/ai.c",
    "src/containers.c",
    "src/interact.c",
    "src/traps.c",
    "src/scheduler.c",
    "src/resources.c",
    "src/item_use.c",
    "src/movement.c",
    "src/visibility.c",
    "src/saveload.c",
    "src/text.c",
    "src/collision.c",
    "src/input.c",
    "src/object_actions.c",
    "src/spells.c",
    "src/fullscreen_view.c",
    "src/editor.c",
    "src/weapon_swing.c",
    "src/level.c",
    "src/doors.c",
    "src/winfile_wrappers.c",
    "src/models_dos.c",
    "src/models.c",
    "src/math.c",
    "src/registration.c",
    "src/audio.c",
    "src/platform_music.c",
    "src/platform_sfx.c",
    "src/platform_voice.c",
    "src/platform_dosmidi.c",
    "src/main.c",
    "src/unit_test_hooks.c",
    "src/options.c",
    "src/gx_stub.c",
    "src/mouselook.c",
    "src/ordinal_stubs.c",
    "src/file_io.c",
    "src/demomode.c",
    "src/democapture.c",
    "src/debug.c",
    "src/debug_ui.c",
    "third_party/hxcmod/hxcmod.c",
    // The authentic DOS audio path (--audio-mode=dos); MIT, see third_party/openabyss/VENDORING.md.
    "third_party/openabyss/uw_opl.c",
    "third_party/openabyss/uw_adlib.c",
    "third_party/openabyss/uw_ail.c",
    "third_party/openabyss/uw_sound.c",
    "third_party/openabyss/uw_blob.c",
    "src/debug_shim.c",
    "src/program_main.c",
};

const c_flags = [_][]const u8{
    "-std=gnu11",
    "-Wno-pointer-sign",
    // Decompiled code mixes pointer types freely; newer clang makes these hard errors on some targets.
    "-Wno-incompatible-pointer-types",
    "-Wno-int-conversion",
    "-Wno-int-to-pointer-cast",
    "-fno-common",
    // The decompiled code relies on behaviour UBSan would trap on; the CMake build does not enable it.
    "-fno-sanitize=undefined",
};

// SDL is always built optimised (no UBSan runtime needed). Zig 0.17 renamed the enum tags.
const sdl_optimize: std.builtin.OptimizeMode = if (@hasField(std.builtin.OptimizeMode, "fast")) .fast else .ReleaseFast;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const host = b.graph.host.result;
    const native = target.result.os.tag == host.os.tag and target.result.cpu.arch == host.cpu.arch;
    const system_sdl = b.option(bool, "system-sdl", "Link the system SDL2 instead of building it (default: only for native builds)") orelse native;

    const mod = b.createModule(.{
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .sanitize_c = .off,
    });
    // glibc hides dladdr/Dl_info and friends unless _GNU_SOURCE is defined.
    mod.addCMacro("_GNU_SOURCE", "1");
    mod.addIncludePath(b.path("third_party/hxcmod"));
    mod.addIncludePath(b.path("third_party/openabyss"));

    mod.addCSourceFiles(.{ .files = &uw_sources, .flags = &c_flags });

    if (target.result.os.tag != .windows) mod.linkSystemLibrary("m", .{});

    if (system_sdl) {
        mod.linkSystemLibrary("SDL2", .{});
    } else if (b.lazyDependency("sdl2", .{ .target = target, .optimize = sdl_optimize })) |dep| {
        const sdl = dep.artifact("SDL2");
        mod.linkLibrary(sdl);
        // The package installs its headers under SDL2/, but the game includes <SDL.h>.
        mod.addIncludePath(sdl.getEmittedIncludeTree().path(b, "SDL2"));
    }

    const exe = b.addExecutable(.{ .name = "uw_dbg", .root_module = mod });
    b.installArtifact(exe);

    const run = b.addRunArtifact(exe);
    run.step.dependOn(b.getInstallStep());
    // `zig build run -- args`: Zig 0.17 replaced b.args with addPassthruArgs().
    if (comptime @hasDecl(std.Build.Step.Run, "addPassthruArgs")) {
        run.addPassthruArgs();
    } else if (b.args) |args| {
        run.addArgs(args);
    }
    b.step("run", "Build and run the game").dependOn(&run.step);
}

# Grandaddy - an Ultima Underworld 1 PC port

<img width="752" height="540" alt="Screenshot 2026-10-17 at 6 04 16 PM" src="https://github.com/user-attachments/assets/70471383-e780-4f77-ad3c-966df844ab8f" />

Grandaddy is an Ultima Underworld 1 port, based off of a decompile of the PocketPC WinCE port of Ultima Underworld 1.

This was an upgraded version of the engine over the DOS version, having been upgraded to 32 bit and with a more advanced software renderer that fixed the warping issues the original had and added smoother lighting. The PocketPC port also seemed like a good option to use as it supported a touch screen mode, which could be good for mobile devices.

## Building

Requires `cmake`, `clang`, and SDL2 (`brew install cmake sdl2`).

```sh
./build.sh   # configures build/ via CMake and builds build/uw_dbg
./run.sh     # build.sh, then runs against the local data/ folder
```

Or drive CMake directly:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j
```

Or use Zig for building:

```
zig build run -- --data-dir data
```

## Running

The game needs its original data files. You can use either the DOS assets, or the WinCE assets.
Extract them into a directory laid out as:

```
UWDATA/
  UU.exe  gx.dll        (unused by this build, just artifacts of extraction)
  DATA/       *.GR *.DAT *.BYT *.SYS *.PAK *.ARK *.CFG *.TR *.CM
  DATA3D/     *.E
  SOUND/      SOUNDS.DAT  *.MOD  VOC*.wav
  CRIT/       CR*PAGE.N00/N01  ASSOC.ANM
  CUTS/       CS*.N0x
```

Then run with:

```sh
./uw --data-dir [data-path]
```

## Debug / Options

Use the '~' character to open a debug panel that allows you to open a console
and modify port options.

## Current status

Compiles, links, and runs against real game data. Has been tested all
the way through level one, more testing is ongoing.

This port also includes some quality of life features over the original game:

- 'F' key toggles into mouselook mode.
- 'G' key toggles a fullscreen mode, that hides most of the HUD.
- '~' key opens a debug panel, that includes a console that can run many debug commands. Run 'help' to see a list.

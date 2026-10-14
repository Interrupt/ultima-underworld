#!/bin/sh
# Run the demo_*.txt regression suite against build/uw_asan (an
# ASan-instrumented build -- see CMakeLists.txt's uw_asan target) and
# report which scripts crash. Mirrors the ad-hoc loop used throughout
# this session's playtesting/bug-fixing work.
#
# Runs under AddressSanitizer by default: a plain debug build only
# catches a crash when a bad read/write happens to hit unmapped memory,
# which silently misses plenty of real bugs (confirmed live -- ASan
# caught a heap-buffer-overflow in blit_sprite_row_remapped that never
# once crashed build/uw_dbg). Pass BIN=build/uw_dbg to fall back to the
# plain, faster, non-instrumented binary if you specifically want to
# skip ASan's overhead (e.g. iterating quickly on a known-unrelated
# script) -- ASan roughly doubles run time and memory use, and its
# reports abort the process on the FIRST error rather than continuing.
#
# Usage:
#   ./run-regressions.sh                  # run the default script list
#   ./run-regressions.sh foo.txt bar.txt  # run only these scripts instead
#
# Tweakable via env vars:
#   BUILD=0                 skip running build.sh first (default: 1, builds)
#   TIMEOUT=60               seconds to wait for a hung script before
#                            force-killing it -- each script's own actual
#                            run time is whatever it takes to finish; this
#                            is just a safety net, not a fixed delay
#   OUT_DIR=/tmp/regress_out directory for per-script logs
#   BIN=build/uw_asan        binary to run (build/uw_dbg for a plain,
#                            non-ASan build -- see above)
#   EXTRA_ARGS="--container-autoclose-on-drag-out --light-mode=dos"
#                            extra command-line options forwarded to the binary for every script
#   EXTRA_ENV="UW_LIGHT_MODE=dos"  legacy form of EXTRA_ARGS: extra env vars (space-separated
#                            KEY=VAL pairs) forwarded to the binary for every script
#   SDL_VIDEODRIVER=dummy    SDL video/audio drivers for the runs. Default to SDL's
#   SDL_AUDIODRIVER=dummy    headless "dummy" drivers so the suite never opens a real window,
#                            takes focus or plays sound; set them to empty (or e.g. cocoa /
#                            coreaudio) to watch a script run on screen.
#   ASAN_OPTIONS=detect_leaks=0   passed straight through to the ASan
#                            runtime. Off by default because
#                            LeakSanitizer isn't supported on this
#                            platform at all (confirmed live: with
#                            detect_leaks=1 the binary aborts on launch
#                            with "AddressSanitizer: detect_leaks is not
#                            supported on this platform" before running
#                            anything) -- this isn't tuning out noise
#                            from known benign leaks, ASan simply
#                            refuses to start otherwise here.
#
# All scripts are launched at once, each against its own (headless, see above) SDL window, and
# run concurrently rather than one at a time -- each uw_asan instance only
# ever touches its own window/log/demo file, and demomode's mouse
# injectors no longer warp the real OS cursor (see uw_inject_mouse_down's
# comment in gx_stub.c), so nothing about one run's input stomps on
# another's.
#
# Note: demo_automap.txt is deliberately excluded from the default list
# -- it's a 4000+ line tile-by-tile traversal that takes 5+ minutes,
# too slow for a routine regression check. Pass it explicitly as an
# argument if you want to run it anyway.

set -u
cd "$(dirname "$0")"

BUILD="${BUILD:-1}"
TIMEOUT="${TIMEOUT:-90}"
OUT_DIR="${OUT_DIR:-/tmp/regress_out}"
BIN="${BIN:-build/uw_asan}"
EXTRA_ENV="${EXTRA_ENV:-}"
EXTRA_ARGS="${EXTRA_ARGS:-}"
ASAN_OPTIONS="${ASAN_OPTIONS:-detect_leaks=0}"
# Headless by default. `${VAR-default}` (no colon) so an explicitly empty value means "SDL's own default".
SDL_VIDEODRIVER="${SDL_VIDEODRIVER-dummy}"
SDL_AUDIODRIVER="${SDL_AUDIODRIVER-dummy}"

DEFAULT_SCRIPTS="demo_critter_orbit_cardinal.txt demo_inventory_container_item_click_test.txt demo_inventory_container_torch_use_test.txt demo_inventory_dropback_test.txt demo_inventory_invalid_drop_test.txt demo_inventory_open_bag_test.txt demo_cast_all_spells.txt demo_summon_flood.txt demo_fullscreen_view.txt"

if [ "$#" -gt 0 ]; then
  SCRIPTS="$*"
else
  SCRIPTS="$DEFAULT_SCRIPTS"
fi

if [ "$BUILD" = "1" ]; then
  echo "Building..."
  ./build.sh
fi

mkdir -p "$OUT_DIR"

# Each concurrent run gets its own private data dir: the read-only asset
# dirs/files are symlinked (cheap, shared, never written to), but SAVE0-4
# are real per-script copies of the real SAVE1 template. Without this,
# every script here does its own "new game" (copies SAVE1 -> SAVE0), and
# with N scripts racing on the SAME real data/SAVE0 that's a genuine,
# pre-existing bug in this harness, not in the game -- confirmed live: it
# reliably corrupted/truncated SAVE0 under ASan's ~2x slowdown (which
# widens the race window enough to hit essentially every run), producing
# a pile of spurious "CRASH" verdicts (journey_onward_load_slot_menu
# reading a save mid-write by another process) that have nothing to do
# with any real game bug.
DATA_DIR_ROOT="${OUT_DIR}/data-isolated"
mkdir -p "$DATA_DIR_ROOT"
setup_isolated_data_dir() {
  script_name="$1"
  d="$DATA_DIR_ROOT/$script_name"
  rm -rf "$d"
  mkdir -p "$d"
  for ro in CRIT CUTS DATA DATA3D SOUND gx.dll UU.exe; do
    ln -s "$(pwd)/data/$ro" "$d/$ro"
  done
  # SAVE1 is the real template "new game" copies FROM -- needs real
  # content. SAVE0 (and the other slots) are left EMPTY: every script
  # here starts with its own full character-creation sequence, which
  # populates SAVE0 itself via the same copy-from-SAVE1 the game always
  # does; pre-seeding SAVE0 by copying SAVE1's raw template into it
  # directly (skipping character creation) produces a save the
  # "continue"/journey-onward path can't actually load, since that
  # template isn't a real post-chargen player.dat -- confirmed crashing
  # (SIGBUS in FUN_00044624) when tried.
  mkdir -p "$d/SAVE1"
  cp "$(pwd)/data/SAVE1/"* "$d/SAVE1/" 2>/dev/null
  mkdir -p "$d/SAVE0" "$d/SAVE2" "$d/SAVE3" "$d/SAVE4"
  echo "$d"
}

# Kick off every script at once, each in its own background runner
# subshell that does its own run+watchdog+wait+classify and drops the
# verdict in a per-script result file (rather than echoing directly,
# which would interleave garbled output across concurrently-finishing
# runs) -- then wait for all of them and report in a second, ordered
# pass below.
run_scripts=""
for s in $SCRIPTS; do
  if [ ! -f "$s" ]; then
    echo "SKIP (not found): $s"
    continue
  fi
  run_scripts="$run_scripts $s"
  log="$OUT_DIR/$s.log"
  result="$OUT_DIR/$s.result"
  rm -f "$result"
  script_data_dir="$(setup_isolated_data_dir "$s")"

  (
    # Run in the background (env, not eval -- env execs the binary in
    # place of itself rather than forking, so $! below is the real game
    # process's PID, not a wrapper shell's), race it against a watchdog
    # timer instead of a fixed sleep, then wait for whichever finishes
    # first. No `timeout` command needed, so this works on stock OSX.
    env ${SDL_VIDEODRIVER:+SDL_VIDEODRIVER="$SDL_VIDEODRIVER"} ${SDL_AUDIODRIVER:+SDL_AUDIODRIVER="$SDL_AUDIODRIVER"} $EXTRA_ENV ASAN_OPTIONS="$ASAN_OPTIONS" "./$BIN" --demo-delay-ms=100 --data-dir="$script_data_dir" --demo-file="$(pwd)/$s" --fast-sleep $EXTRA_ARGS >"$log" 2>&1 &
    pid=$!

    (
      sleep "$TIMEOUT"
      kill "$pid" 2>/dev/null
    ) &
    watchdog=$!

    wait "$pid" 2>/dev/null
    rc=$?
    kill "$watchdog" 2>/dev/null
    wait "$watchdog" 2>/dev/null

    # A shell reports a signal-terminated command's exit status as 128+signal.
    # Our watchdog's `kill` sends SIGTERM (143); some environments/OOM killers
    # use SIGKILL (137) -- either means the script hung and got force-killed
    # rather than finishing on its own.
    if [ "$rc" -eq 137 ] || [ "$rc" -eq 143 ]; then
      echo "TIMEOUT $rc" >"$result"
    elif grep -qi "fatal signal\|EXC_BAD_ACCESS\|SIGSEGV\|Segmentation fault\|ERROR: AddressSanitizer\|ERROR: LeakSanitizer" "$log"; then
      echo "CRASH $rc" >"$result"
    else
      echo "CLEAN $rc" >"$result"
    fi
  ) &
  echo "Started: $s (pid $!)"
done

wait

crash_count=0
timeout_count=0
total_count=0

for s in $run_scripts; do
  total_count=$((total_count + 1))
  log="$OUT_DIR/$s.log"
  result="$OUT_DIR/$s.result"
  read -r status rc <"$result"
  case "$status" in
    TIMEOUT)
      echo "TIMEOUT: $s (killed after ${TIMEOUT}s, see $log)"
      timeout_count=$((timeout_count + 1))
      ;;
    CRASH)
      echo "CRASH: $s (exit=$rc, see $log)"
      crash_count=$((crash_count + 1))
      ;;
    *)
      echo "clean: $s (exit=$rc)"
      ;;
  esac
done

echo ""
echo "$((total_count - crash_count - timeout_count))/$total_count clean"
[ "$crash_count" -eq 0 ] && [ "$timeout_count" -eq 0 ]

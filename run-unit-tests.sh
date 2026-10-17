#!/usr/bin/env bash
# Build and run the unit tests that do NOT need the real game data (data/ is not in the repo,
# so this is what CI can run). Tests listed in tests/needs-data.txt are skipped.
#
#   ./run-unit-tests.sh              data-free tests only
#   ./run-unit-tests.sh --with-data  every test (needs the game files in data/)
#
# BUILD_DIR overrides the build directory (default: build-tests).
set -euo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${BUILD_DIR:-$PROJECT_DIR/build-tests}"

with_data=0
[ "${1:-}" = "--with-data" ] && with_data=1

cmake -S "$PROJECT_DIR" -B "$BUILD_DIR" -DBUILD_TESTING=ON
cmake --build "$BUILD_DIR" --target unit_tests --parallel

args=(--test-dir "$BUILD_DIR" --output-on-failure --parallel 4 --no-tests=error)
if [ "$with_data" -eq 0 ]; then
  exclude="$(grep -v '^#' "$PROJECT_DIR/tests/needs-data.txt" | grep -v '^$' | paste -sd'|' -)"
  args+=(-E "^(${exclude})\$")
fi
ctest "${args[@]}"

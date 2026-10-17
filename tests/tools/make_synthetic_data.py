#!/usr/bin/env python3
"""Write a synthetic stand-in for the game's data/ directory.

Every file listed in tests/fixtures/data-files.txt ("path size" per line) is created zero-filled at
its real size (sparse, so it costs no disk), except DATA/LEV.ARK which gets a valid archive header
and level blocks so map-loading fixtures work. The unit tests that pass against this tree do not
depend on real game content; the ones that do are integration tests (see tests/unit-cases.txt).

Usage: make_synthetic_data.py OUTPUT_DIR
"""
import struct
import sys
from pathlib import Path

LEVEL_SIZE = 0x7C08          # one level block: tiles, objects, free lists, then the 0x7577 marker
LEVEL_MARKER_OFFSET = 0x7C06
LEVEL_COUNT = 9


def write_lev_ark(path: Path) -> None:
    header = 2 + 4 * LEVEL_COUNT
    blob = bytearray(struct.pack("<H", LEVEL_COUNT))
    for i in range(LEVEL_COUNT):
        blob += struct.pack("<I", header + i * LEVEL_SIZE)
    for _ in range(LEVEL_COUNT):
        block = bytearray(LEVEL_SIZE)
        struct.pack_into("<H", block, LEVEL_MARKER_OFFSET, 0x7577)
        blob += block
    path.write_bytes(bytes(blob))


def main() -> None:
    out = Path(sys.argv[1])
    manifest = Path(__file__).resolve().parent.parent / "fixtures" / "data-files.txt"
    for line in manifest.read_text().splitlines():
        if not line.strip():
            continue
        name, size = line.rsplit(" ", 1)
        target = out / name
        target.parent.mkdir(parents=True, exist_ok=True)
        with open(target, "wb") as f:
            f.truncate(int(size))
    write_lev_ark(out / "DATA" / "LEV.ARK")


if __name__ == "__main__":
    main()

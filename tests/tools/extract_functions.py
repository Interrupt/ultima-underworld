"""Build test translation units from exact function bodies in game sources.

No implementation copies are checked in: CMake regenerates these files when
an original source changes. Fixtures provide the isolated globals/services.
"""
import argparse
from pathlib import Path
import re


def extract(source, name):
    # @name selects an initialized object or named struct,
    # letting tests exercise its actual entries rather than fixture copies.
    if name.startswith("%"):
        definition = re.search(r"^#define\s+" + re.escape(name[1:]) + r"\b[^\n]*", source, re.MULTILINE)
        if definition is None:
            raise ValueError(f"Macro definition not found: {name[1:]}")
        return definition.group()
    is_array = name.startswith("@")
    if is_array:
        name = name[1:]
        pattern = r"^[ \t]*\w[^\n;]*\b" + re.escape(name) + r"[^\n;]*=\s*"
    else:
        pattern = r"^\w[^\n;]*\b" + re.escape(name) + r"\([^;]*?\)\s*(?=\{)"
    definition = re.search(
        pattern,
        source, re.MULTILINE,
    )
    if is_array:
        struct_definition = re.search(r"^struct\s+" + re.escape(name) + r"\s*(?=\{)",
                                      source, re.MULTILINE)
        if struct_definition is not None:
            definition = struct_definition
    if definition is None:
        raise ValueError(f"Function definition not found: {name}")
    # Initialized scalars (including original binary defaults) have no body.
    if is_array and source[definition.end():].lstrip()[0] != "{" and struct_definition is None:
        end = source.index(";", definition.end()) + 1
        return source[definition.start():end]
    opening = source.index("{", definition.end())
    tokens = re.compile(
        r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|[{}]'
    )
    depth = 0
    for token in tokens.finditer(source, opening):
        if token.group() == "{":
            depth += 1
        elif token.group() == "}":
            depth -= 1
            if depth == 0:
                end = source.index(";", token.end()) + 1 if is_array else token.end()
                return source[definition.start():end]
    raise ValueError(f"Unclosed function body: {name}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("functions", nargs="+",
                        help="source.c:function_name or source.c:@initialized_object or source.c:%%macro")
    args = parser.parse_args()
    chunks = ['/* Generated from original game sources; do not edit. */\n'
              '#include "src/headers/uw.h"\n#include "src/headers/debug.h"\n#include "src/headers/debug_ui.h"\n#include "src/headers/file_io.h"\n#include <dlfcn.h>\n#include <ctype.h>\n']
    for entry in args.functions:
        filename, name = entry.split(":", 1)
        source = (args.root / filename).read_text()
        # Keep compiler errors and Unity diagnostics tied to the original source.
        function = extract(source, name)
        line = source[:source.index(function)].count("\n") + 1
        chunks.append(f'#line {line} "{filename}"\n{function}\n')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n".join(chunks))


if __name__ == "__main__":
    main()

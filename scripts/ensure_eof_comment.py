#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Ensure EOF Vim comment in Lua files.

Copyright (c) 2025 Guennadi Maximov C. All Rights Reserved.

Usage: python3 ensure_eof_comment.py
"""
from argparse import ArgumentError, ArgumentParser, Namespace
from io import TextIOWrapper
from os import walk
from os.path import isdir, join
from sys import exit as Exit
from sys import stderr as STDERR
from sys import stdout as STDOUT
from typing import Any, Dict, List, NoReturn, Tuple, Union

COMMENTS: Dict[str, str] = {
    # C
    "c": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "h": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",

    # C++
    "cc": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "c++": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "cpp": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "C": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "hh": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "h++": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "hpp": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",
    "H": "/// vim:ts=2:sts=2:sw=2:et:ai:si:sta:",

    # Lua
    "lua": "-- vim:ts=4:sts=4:sw=4:et:ai:si:sta:",

    # Markdown
    "md": "<!--\nvim:ts=2:sts=2:sw=2:et:ai:si:sta:\n-->",
    "markdown": "<!--\nvim:ts=2:sts=2:sw=2:et:ai:si:sta:\n-->",

    # HTML
    "html": "<!--\nvim:ts=2:sts=2:sw=2:et:ai:si:sta:\n-->",
    "htm": "<!--\nvim:ts=2:sts=2:sw=2:et:ai:si:sta:\n-->",

    # CSS
    "css": "/* vim:ts=4:sts=4:sw=4:et:ai:si:sta: */",

    # Python
    "py": "# vim:ts=4:sts=4:sw=4:et:ai:si:sta:",
    "pyi": "# vim:ts=4:sts=4:sw=4:et:ai:si:sta:",

    # Shell
    "sh": "# vim:ts=4:sts=4:sw=4:et:ai:si:sta:",
    "bash": "# vim:ts=4:sts=4:sw=4:et:ai:si:sta:",
    "fish": "# vim:ts=4:sts=4:sw=4:et:ai:si:sta:",
    "zsh": "# vim:ts=4:sts=4:sw=4:et:ai:si:sta:",
}


def error(*msg, end: str = "\n", sep: str = " ", flush: bool = False) -> NoReturn:
    """Prints to stderr."""
    try:
        end = str(end)
    except KeyboardInterrupt:
        Exit(1)
    except Exception:
        end = "\n"

    try:
        sep = str(sep)
    except KeyboardInterrupt:
        Exit(1)
    except Exception:
        sep = " "

    try:
        flush = bool(flush)
    except KeyboardInterrupt:
        Exit(1)
    except Exception:
        flush = False

    print(*msg, end=end, sep=sep, flush=flush, file=STDERR)


def die(*msg, code: int = 0, end: str = "\n", sep: str = " ", flush: bool = False) -> NoReturn:
    """Kill program execution."""
    try:
        code = int(code)
    except Exception:
        code = 1

    try:
        end = str(end)
    except Exception:
        end = "\n"
        code = 1

    try:
        sep = str(sep)
    except Exception:
        sep = " "
        code = 1

    try:
        flush = bool(flush)
    except Exception:
        flush = False
        code = 1

    if msg and len(msg) > 0:
        if code == 0:
            print(*msg, end=end, sep=sep, flush=flush)
        else:
            error(*msg, end=end, sep=sep, flush=flush)

    Exit(code)


def bootstrap_paths(paths: Tuple[str], exts: Tuple[str]) -> Tuple[Tuple[str, str]]:
    """Bootstraps all the matching paths in current dir and below."""
    result = list()
    for path in paths:
        if not isdir(path):
            continue

        for root, dirs, files in walk(path):
            for file in files:
                for ext in exts:
                    if file.endswith(ext):
                        result.append((join(root, file), ext))

    return tuple(result)


def open_batch_paths(paths: Tuple[Tuple[str, str]]) -> Dict[str, Tuple[TextIOWrapper, str]]:
    """Return a list of TextIO objects given file path strings."""
    result = dict()
    for path in paths:
        try:
            result[path[0]] = (open(path[0], "r"), path[1])
        except KeyboardInterrupt:
            die("\nProgram interrupted!", code=1)  # Kills the program
        except FileNotFoundError:
            error(f"File `{path[0]}` is not available!")
        except Exception:
            error(f"Something went wrong while trying to open `{path[0]}`!")

    return result


def get_last_line(file: TextIOWrapper) -> str:
    """Returns the last line of a file."""
    result: str = file.read().split("\n")[-2]
    file.close()

    return result


def eof_comment_search(
        files: Dict[str, Tuple[TextIOWrapper, str]]
) -> Dict[str, Tuple[Tuple[TextIOWrapper, bool], str]]:
    """Searches through opened files."""
    result = dict()
    for path, file in files.items():
        last_line = get_last_line(file[0])
        comment = COMMENTS[file[1]]
        if last_line not in (COMMENTS[file[1]],):
            if last_line in ("-" + comment, comment.split(" "), "-" + "".join(comment.split(" "))):
                result[path] = ([open(path, "r"), True], file[1])
            else:
                result[path] = ([open(path, "a"), False], file[1])

    return result


def modify_file(file: TextIOWrapper, ext: str) -> str:
    """Modifies a file containing a bad EOF comment."""
    data = file.read().split("\n")
    data[-2] = COMMENTS[ext]
    data.insert(-2, "")  # Newline

    return "\n".join(data)


def append_eof_comment(files: Dict[str, Tuple[Tuple[TextIOWrapper, bool], str]]) -> NoReturn:
    """Append EOF comment to files missing it."""
    for path, file in files.items():
        txt = f"{COMMENTS[file[1]]}\n"
        if file[0][1]:
            txt = modify_file(file[0][0], file[1])
            file[0][0] = open(path, "w")

        file[0][0].write(txt)
        file[0][0].close()


def bootstrap_args(
        parser: ArgumentParser,
        specs: Tuple[Tuple[List[str], Dict[str, Any]]]
) -> Namespace:
    """Bootstraps the program arguments."""
    for spec in specs:
        parser.add_argument(*spec[0], **spec[1])

    try:
        namespace = parser.parse_args()
    except KeyboardInterrupt:
        die(code=130)
    except ArgumentError:
        parser.print_help(STDOUT)
        die(code=1)

    return namespace


def arg_parser_init() -> Tuple[ArgumentParser, Namespace]:
    """Generates the argparse namespace."""
    parser = ArgumentParser(
        prog="ensure_eof_comment.py",
        description="Checks for Vim EOF comments in all matching files in specific directories",
        exit_on_error=False
    )
    spec = [
        (
            ["directories"],
            {
                "nargs": "+",
                "help": "The target directories to be checked",
                "metavar": "/path/to/directory",
            },
        ),
        (
            ["-e", "--file-extensions"],
            {
                "required": True,
                "metavar": "EXT1[,EXT2[,EXT3[,...]]]",
                "help": "A comma-separated list of file extensions (e.g. \"lua,c,cpp,cc,c++\")",
                "dest": "exts",
            }
        ),
    ]

    return parser, bootstrap_args(parser, spec)


def main() -> int:
    """Execute main workflow."""
    parser, namespace = arg_parser_init()

    dirs: Tuple[str] = tuple(namespace.directories)
    exts: Tuple[str] = tuple(namespace.exts.split(","))

    files = open_batch_paths(bootstrap_paths(dirs, exts))
    if len(files) == 0:
        error("No matching files found!")
        return 1

    results = eof_comment_search(files)
    if len(results) > 0:
        append_eof_comment(results)

    return 0


if __name__ == "__main__":
    Exit(main())

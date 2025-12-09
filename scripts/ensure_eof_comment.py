#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Ensure EOF Vim comment in Lua files."""
from io import TextIOWrapper
from os import walk
from os.path import join
from sys import exit as Exit
from sys import stderr as STDERR
from typing import Dict, List, NoReturn, Tuple, Union

COMMENT: str = "-- vim:ts=4:sts=4:sw=4:et:ai:si:sta:"


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
    except KeyboardInterrupt:
        Exit(1)
    except Exception:
        code = 1

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

    if msg and len(msg) > 0 and code == 0:
        print(*msg, end=end, sep=sep, flush=flush)
    elif msg and len(msg) > 0:
        error(*msg, end=end, sep=sep, flush=flush)

    Exit(code)


def bootstrap_paths() -> Tuple[str]:
    """Bootstraps all the matching paths in current dir and below."""
    result = list()
    for root, dirs, files in walk("./lua"):
        for file in files:
            if file.endswith(".lua"):
                result.append(join(root, file))

    return tuple(result)


def open_batch_paths(paths: Tuple[str]) -> Dict[str, TextIOWrapper]:
    """Return a list of TextIO objects given file path strings."""
    result = dict()
    for path in paths:
        try:
            result[path] = open(path, "r")
        except KeyboardInterrupt:
            die("\nProgram interrupted!", code=1)
        except FileNotFoundError:
            error(f"File `{path}` is not available!")
        except Exception:
            error(f"Something went wrong while trying to open `{path}`!")

    return result


def get_last_line(file: TextIOWrapper) -> str:
    """Returns the last line of a file."""
    result: str = file.read().split("\n")[-2]
    file.close()

    return result


def eof_comment_search(
        files: Dict[str, TextIOWrapper]
) -> Dict[str, List[Union[TextIOWrapper, bool]]]:
    """Searches through opened files."""
    result = dict()
    for path, file in files.items():
        last_line = get_last_line(file)
        if last_line not in (COMMENT,):
            if last_line in ("-" + COMMENT, COMMENT.split(" "), "-" + "".join(COMMENT.split(" "))):
                result[path] = [open(path, "r"), True]
            else:
                result[path] = [open(path, "a"), False]

    return result


def modify_file(file: TextIOWrapper) -> str:
    """Modifies a file containing a bad EOF comment."""
    data = file.read().split("\n")
    data[-2] = COMMENT
    data.insert(-2, "")

    return "\n".join(data)


def append_eof_comment(files: Dict[str, List[Union[TextIOWrapper, bool]]]) -> NoReturn:
    """Append EOF comment to files missing it."""
    for path, file in files.items():
        txt = f"{COMMENT}\n"
        if file[1]:
            txt = modify_file(file[0])
            file[0] = open(path, "w")

        file[0].write(txt)
        file[0].close()


def main() -> int:
    """Execute main workflow."""
    files = open_batch_paths(bootstrap_paths())
    if len(files) == 0:
        error("No matching files found!")
        return 1

    results = eof_comment_search(files)
    if len(results) > 0:
        append_eof_comment(results)

    return 0


if __name__ == "__main__":
    Exit(main())

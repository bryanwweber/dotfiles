#!/usr/bin/env python
import argparse
import sys
from pathlib import Path

HERE = Path(__file__).parent
IGNORE = [".git", ".gitignore", __file__]


def main(argv):
    parser = argparse.ArgumentParser(
        description="Install dotfiles for a program.", prog="install-dotfiles"
    )
    parser.add_argument(
        "program",
        nargs="*",
        help=(
            "The program for which dotfiles will be installed. Must be a directory in"
            "this folder."
        ),
        type=Path,
    )
    parser.add_argument(
        "-a",
        "--all",
        action="store_true",
        help="Install all the dotfiles in this directory",
    )
    args = parser.parse_args(argv)

    def link_directory(directory: Path, link: Path):
        link_exists = link.exists()
        for item in directory.iterdir():
            if link_exists and not item.is_dir():
                raise ValueError("All items in an existing link must be folders.")
            link = link / item.relative_to(directory)
            if link.exists():
                print(f"'{link!s}' exists. Not overwriting")
                continue
            link.symlink_to(item)

    def install_dotfiles(program: Path):
        for item in program.iterdir():
            link = Path.home() / item.relative_to(program)
            if item.is_dir():
                link.mkdir(exist_ok=True)
                link_directory(item, link)
            elif item.is_file():
                if link.exists():
                    print(f"'{link!s}' exists. Not overwriting")
                    continue
                link.symlink_to(item)

    if args.all:
        programs = [p for p in HERE.iterdir() if p.is_dir() and p.name not in IGNORE]
    else:
        programs = []
        program: Path
        for program in args.program:
            if not (HERE / program).is_dir():
                raise FileNotFoundError(f"The program {program.name!r} does not exist")
            programs.append(program)

    for program in programs:
        print(f"Installing: '{program!s}'")
        install_dotfiles(HERE / program)


if __name__ == "__main__":
    main(sys.argv[1:])

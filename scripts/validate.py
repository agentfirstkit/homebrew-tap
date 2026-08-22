#!/usr/bin/env python3
"""Standalone structural gate for generated Agent-First Formula files."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FORMULA_DIR = ROOT / "Formula"
README = ROOT / "README.md"
TARGETS = {
    "aarch64-apple-darwin",
    "x86_64-apple-darwin",
    "aarch64-unknown-linux-gnu",
    "x86_64-unknown-linux-gnu",
}


def fail(message: str) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(1)


def main() -> int:
    formulas = sorted(FORMULA_DIR.glob("*.rb"))
    if not formulas:
        fail("no Formula files")
    readme = README.read_text(encoding="utf-8")
    if "<formula>" in readme:
        fail("README contains a shell-significant formula placeholder")

    for path in formulas:
        name = path.stem
        text = path.read_text(encoding="utf-8")
        description = re.search(r'^  desc "([^"]+)"$', text, re.MULTILINE)
        if not description or not 50 <= len(description.group(1)) <= 80:
            fail(f"{path}: desc must contain 50-80 characters")
        if description.group(1).endswith("."):
            fail(f"{path}: desc must not end with a full stop")
        # `brew audit --strict` refuses a `version` a formula's own URL already
        # carries, so the version is read off the downloads — which also makes
        # four URLs naming four different versions a failure here rather than a
        # formula that installs one platform's binary under another's number.
        if re.search(r'^  version "', text, re.MULTILINE):
            fail(f"{path}: `version` is redundant with the download URL and fails `brew audit --strict`")

        # Split each download on a target this tap actually supports rather
        # than on a pattern: a version may carry a pre-release suffix with its
        # own hyphens, and guessing where the version stops would either reject
        # a legitimate `-rc1` or read half a target triple as a version.
        stems = re.findall(rf'/{re.escape(name)}-v([^/"]+)\.(?:tar\.gz|zip)"', text)
        versions: set[str] = set()
        targets: set[str] = set()
        for stem in stems:
            target = next((value for value in TARGETS if stem.endswith(f"-{value}")), None)
            if target is None:
                fail(f"{path}: download `{stem}` names no supported target")
            versions.add(stem[: -len(target) - 1])
            targets.add(target)
        if len(versions) != 1:
            fail(f"{path}: downloads name {len(versions)} different versions: {sorted(versions)}")
        if targets != TARGETS:
            fail(f"{path}: platform inventory differs: {sorted(targets)}")
        hashes = re.findall(r'^\s+sha256 "([0-9a-f]+)"$', text, re.MULTILINE)
        if len(hashes) != len(TARGETS) or any(len(value) != 64 for value in hashes):
            fail(f"{path}: every platform needs one 64-hex SHA-256")

        test = text.split("  test do\n", 1)
        if len(test) != 2 or "  end\nend\n" not in test[1]:
            fail(f"{path}: missing test block")
        test_body = test[1].split("  end\nend\n", 1)[0]
        meaningful = [line for line in test_body.splitlines() if line.strip() and "--version" not in line]
        if not meaningful:
            fail(f"{path}: test only checks --version")
        command = f"brew install agentfirstkit/tap/{name}"
        if command not in readme:
            fail(f"README does not contain the concrete install command for {name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

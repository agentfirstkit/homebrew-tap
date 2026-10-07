#!/usr/bin/env python3
"""Standalone structural gate for generated Agent-First Formula files."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FORMULA_DIR = ROOT / "Formula"
README = ROOT / "README.md"
LEAF_TARGETS = {
    ("on_macos", "on_arm"): "aarch64-apple-darwin",
    ("on_macos", "on_intel"): "x86_64-apple-darwin",
    ("on_linux", "on_arm"): "aarch64-unknown-linux-gnu",
    ("on_linux", "on_intel"): "x86_64-unknown-linux-gnu",
}
TARGETS = set(LEAF_TARGETS.values())


def fail(message: str) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(1)


def validate_downloads(path: Path, text: str) -> None:
    """Scan the generated OS/architecture blocks without interpreting Ruby."""
    name = path.stem
    os_block: str | None = None
    leaf: tuple[str, str] | None = None
    seen_os: set[str] = set()
    downloads: dict[tuple[str, str], dict[str, str]] = {}
    versions: set[str] = set()
    in_method = False

    for line_number, line in enumerate(text.splitlines(), 1):
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            continue
        location = f"{path}:{line_number}"
        block = re.fullmatch(r"(\s*)(on_[a-z_]+) do", line)
        if block:
            indent, kind = block.groups()
            if kind in {"on_macos", "on_linux"}:
                if indent != "  " or os_block is not None or in_method:
                    fail(f"{location}: misplaced {kind} block")
                if kind in seen_os:
                    fail(f"{location}: duplicate {kind} block")
                seen_os.add(kind)
                os_block = kind
            elif kind in {"on_arm", "on_intel"}:
                if indent != "    " or os_block is None or leaf is not None:
                    fail(f"{location}: misplaced {kind} block")
                leaf = (os_block, kind)
                if leaf in downloads:
                    fail(f"{location}: duplicate {os_block}/{kind} leaf block")
                downloads[leaf] = {}
            else:
                fail(f"{location}: unsupported platform block {kind}")
            continue

        if os_block is not None and stripped == "end":
            if line == "    end" and leaf is not None:
                if set(downloads[leaf]) != {"url", "sha256"}:
                    fail(f"{location}: {leaf[0]}/{leaf[1]} needs exactly one url and sha256")
                leaf = None
            elif line == "  end" and leaf is None:
                os_block = None
            else:
                fail(f"{location}: misplaced platform block end")
            continue

        directive = re.match(r"\s*(url|sha256)\b", line)
        if directive:
            kind = directive.group(1)
            value = re.fullmatch(rf'      {kind} "([^"\n]+)"', line)
            if leaf is None or value is None:
                fail(f"{location}: {kind} must be inside an OS/architecture leaf block")
            if kind in downloads[leaf]:
                fail(f"{location}: duplicate {kind} in {leaf[0]}/{leaf[1]}")
            value = value.group(1)
            downloads[leaf][kind] = value
            if kind == "sha256":
                if not re.fullmatch(r"[0-9a-f]{64}", value):
                    fail(f"{location}: every leaf needs one 64-lowercase-hex SHA-256")
            else:
                # Match a supported target suffix instead of splitting on
                # hyphens, which also occur in pre-release version strings.
                stem = re.search(rf'/{re.escape(name)}-v([^/"]+)\.(?:tar\.gz|zip)$', value)
                if stem is None:
                    fail(f"{location}: download URL must name a {name} release archive")
                stem = stem.group(1)
                target = next((target for target in TARGETS if stem.endswith(f"-{target}")), None)
                if target != LEAF_TARGETS[leaf]:
                    fail(f"{location}: {leaf[0]}/{leaf[1]} URL must target {LEAF_TARGETS[leaf]}")
                versions.add(stem[: -len(target) - 1])
            continue

        if os_block is not None:
            fail(f"{location}: unexpected statement in platform block")
        # Generated Formula methods are outside the platform blocks. Remember
        # their root-level boundaries so an indented block cannot be moved
        # into install/test and still satisfy the download inventory.
        if re.match(r"^  (?:def\s|test do$)", line):
            in_method = True
        elif line == "  end":
            in_method = False

    if os_block is not None:
        fail(f"{path}: unclosed platform block")
    if set(downloads) != set(LEAF_TARGETS):
        fail(f"{path}: expected exactly the four OS/architecture leaf blocks")
    if len(versions) != 1:
        fail(f"{path}: downloads name {len(versions)} different versions: {sorted(versions)}")


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

        validate_downloads(path, text)

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

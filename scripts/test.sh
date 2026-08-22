#!/bin/bash
# Fixed standalone tap gate. Static checks are offline; install mode lets CI
# exercise Homebrew's own resolver, downloader, installer, and Formula tests.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="${1:-all}"
FORMULA_FILTER="${2:-}"

run_static() {
  local formula
  python3 "$ROOT/scripts/validate.py"
  for formula in "$ROOT"/Formula/*.rb; do
    ruby -c "$formula" >/dev/null
  done
}

# Homebrew refuses a formula given as a path outside a tap — `brew install
# ./Formula/afdata.rb` is rejected outright, which is what this checkout is.
# So the checkout is linked into Homebrew's own tap directory under the name it
# is published as, and every formula is then installed the way a user installs
# it: `agentfirstkit/tap/afdata`. That also makes the tap prefix in the README
# part of what is tested rather than an assumption.
TAP="agentfirstkit/tap"

tap_link() {
  local taps target
  taps="$(brew --repository)/Library/Taps/agentfirstkit"
  target="$taps/homebrew-tap"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "$TAP is already tapped here; this gate will not replace it." >&2
    echo "  run \`brew untap $TAP\` first, or run install mode in CI." >&2
    return 1
  fi
  mkdir -p "$taps"
  ln -sfn "$ROOT" "$target"
  printf '%s\n' "$target"
}

run_install() {
  local formula link status=0
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required for install mode" >&2
    return 1
  fi
  link="$(tap_link)" || return 1
  # Removed however this ends, so a failed install does not leave a link into a
  # working tree behind on a developer's machine.
  trap 'rm -f "$link"' EXIT

  if [ -n "$FORMULA_FILTER" ]; then
    formula="$ROOT/$FORMULA_FILTER"
    [ -f "$formula" ] || { echo "Formula not found: $FORMULA_FILTER" >&2; return 1; }
    install_formula "$(basename "$formula" .rb)" || status=$?
  else
    for formula in "$ROOT"/Formula/*.rb; do
      install_formula "$(basename "$formula" .rb)" || status=$?
    done
  fi
  return "$status"
}

install_formula() {
  local name="$1"
  local status=0
  if brew list --formula "$name" >/dev/null 2>&1; then
    echo "Refusing to alter an already-installed formula: $name" >&2
    return 1
  fi
  brew install --formula "$TAP/$name"
  brew test "$TAP/$name" || status=$?
  brew audit --strict "$TAP/$name" || status=$?
  # Always clean up a package this test installed, including after a failed
  # functional check; the preflight above ensures it never removes user state.
  brew uninstall --formula "$TAP/$name" || status=$?
  return "$status"
}

case "$MODE" in
  static) run_static ;;
  install) run_install ;;
  all) run_static; run_install ;;
  *) echo "usage: scripts/test.sh [static|install|all] [Formula/NAME.rb]" >&2; exit 2 ;;
esac

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

# Prints the link this call created, and nothing when it adopted one that was
# already there. What it prints is what gets removed on the way out, so a link
# this script did not make is never a link this script deletes.
tap_link() {
  local taps target existing root
  taps="$(brew --repository)/Library/Taps/agentfirstkit"
  target="$taps/homebrew-tap"
  root="$(cd -P "$ROOT" && pwd -P)"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "$TAP is already tapped here; this gate will not replace it." >&2
    echo "  run \`brew untap $TAP\` first, or run install mode in CI." >&2
    return 1
  fi
  if [ -L "$target" ] && [ -e "$target" ]; then
    # CI's setup-homebrew links the checkout in under this exact name before
    # this script runs, and removes it again in its own post step. Removing it
    # here made that step fail with "No such file or directory" on a run whose
    # every formula had installed, tested and audited cleanly — so the link is
    # adopted, and its owner keeps the job of taking it away.
    existing="$(cd -P "$target" 2>/dev/null && pwd -P)" || existing=""
    if [ "$existing" != "$root" ]; then
      echo "$TAP is already linked to ${existing:-an unreadable path}, not this" >&2
      echo "  checkout; refusing to retarget a link this gate does not own." >&2
      return 1
    fi
    return 0
  fi
  # A dangling link is this gate's own leftover from a run that died before its
  # cleanup, so replacing it is safe and it becomes ours again.
  mkdir -p "$taps"
  ln -sfn "$ROOT" "$target"
  printf '%s\n' "$target"
}

# The link this run created, if it got that far. Not a local inside
# `run_install`: the EXIT trap below runs when the shell exits, which is after
# that function has already returned and taken its locals with it — so a trap
# reading a local finds nothing, and under `set -u` that is a fatal error at the
# end of an otherwise successful run. Every install job failed exactly there,
# after installing, testing, auditing and uninstalling every formula.
TAP_LINK=""

# Removed however this ends, so a failed install does not leave a link into a
# working tree behind on a developer's machine. Guarded because the trap is
# armed for the whole script and static mode never sets it.
remove_tap_link() {
  if [ -n "${TAP_LINK:-}" ]; then
    rm -f "$TAP_LINK"
    TAP_LINK=""
  fi
}
trap remove_tap_link EXIT

run_install() {
  local formula status=0
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required for install mode" >&2
    return 1
  fi
  TAP_LINK="$(tap_link)" || return 1

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

#!/usr/bin/env bash
# Creates an empty `update` marker file in the user's home directory.
# Used to demonstrate that a bundled script can run automatically (via a hook)
# rather than being executed by Claude following SKILL.md instructions.
set -eu

home="${HOME:-${USERPROFILE:-}}"
if [ -z "$home" ]; then
  echo "create-update: could not determine home directory" >&2
  exit 1
fi

: > "$home/update"
echo "create-update: wrote $home/update"

#!/usr/bin/env bash
# Creates an empty `update` marker file in the user's home directory.
# Invoked automatically by the Codex SessionStart hook (see ../hooks.json).
set -eu

home="${HOME:-${USERPROFILE:-}}"
if [ -z "$home" ]; then
  echo "create-update: could not determine home directory" >&2
  exit 1
fi

: > "$home/update"
echo "create-update: wrote $home/update"

#!/usr/bin/env bash

set -euo pipefail

## INSPIRED BY XERO LITE TEAM HOOKS 
## CREATES A SYMLINK FOR ALL HOOKS STORED IN /hooks INTO YOUR LOCAL .git/hooks/ DIRECTORY
## https://github.com/xero-github/lite-ios/blob/master/scripts/setup-hooks.sh

SOURCE_HOOK_DIR="$(git rev-parse --show-toplevel)/scripts/hooks"
TARGET_HOOK_DIR="$(git rev-parse --git-path hooks)"

create_hook(){
  echo "Linking $1 hook"

  ln -sf "$SOURCE_HOOK_DIR/$1" "$TARGET_HOOK_DIR/$1"
}

hooks=(
  commit-msg
  pre-commit
  pre-push
)

for hook in ${hooks[@]}
do
  create_hook $hook
  chmod +x "$TARGET_HOOK_DIR/$hook"
  echo "$TARGET_HOOK_DIR/$hook"
done

#!/usr/bin/env bash
# Claude Code PostToolUse hook (Bash): after Claude makes a git commit that
# touches docs/, mirror the docs/ folder to s3://orgo-helper/docs/.
# The bucket is versioned, so files removed by --delete stay recoverable.
set -euo pipefail

BUCKET_URI="s3://orgo-helper/docs/"

cmd=$(jq -r '.tool_input.command // ""')
grep -qE '(^|[;&|[:space:]])git[[:space:]]+commit([[:space:]]|$)' <<<"$cmd" || exit 0

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"

# Only sync when the commit just made actually changed something under docs/.
git diff-tree --no-commit-id --name-only -r HEAD -- docs/ | grep -q . || exit 0

if out=$(aws s3 sync docs/ "$BUCKET_URI" --delete --only-show-errors --no-progress 2>&1); then
  jq -n --arg m "Synced docs/ to $BUCKET_URI" '{systemMessage: $m}'
else
  jq -n --arg m "docs/ sync to $BUCKET_URI failed: $out" '{systemMessage: $m}'
fi

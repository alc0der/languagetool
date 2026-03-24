#!/bin/bash
set -euo pipefail

TEMPLATES=$(grep '^### >>' .gitignore | sed 's/^### >>//')
MARKERS=$(grep '^### >>' .gitignore)
HEAD=$(awk '/^## generate:$/{exit} {print}' .gitignore)
# shellcheck disable=SC2086
GENERATED=$(gibo dump $TEMPLATES)

{
  printf '%s\n' "$HEAD"
  echo "## generate:"
  echo "$MARKERS"
  echo ""
  printf '%s\n' "$GENERATED"
} > .gitignore

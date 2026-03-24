#!/bin/bash
set -euo pipefail

TEMPLATES=$(grep '^# >>' .gitignore | sed 's/^# >>//')
HEAD=$(head -n 4 .gitignore)
# shellcheck disable=SC2086
GENERATED=$(gibo dump $TEMPLATES)
printf '%s\n\n%s\n' "$HEAD" "$GENERATED" > .gitignore

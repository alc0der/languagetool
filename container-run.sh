#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLT_LIBEXEC="${PLT_LIBEXEC:-$SCRIPT_DIR}"
PLT_DATA="${PLT_DATA:-$PLT_LIBEXEC}"

/usr/local/bin/container network create languagetool-net --internal 2>/dev/null || true

if /usr/local/bin/container list --all --quiet 2>/dev/null | grep -q '^languagetool$'; then
  /usr/local/bin/container start languagetool
else
  /usr/local/bin/container run -d \
    --name languagetool \
    --network languagetool-net \
    --memory 3G \
    -p 8010:8010 \
    -e Java_Xms=512m \
    -e Java_Xmx=2g \
    -e langtool_languageModel=/ngrams \
    -v "$PLT_DATA/ngrams":/ngrams:ro \
    docker.io/erikvl87/languagetool
fi

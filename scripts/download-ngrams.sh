#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PLT_DATA="${PLT_DATA:-$SCRIPT_DIR/..}"
NGRAMS_DIR="$PLT_DATA/ngrams"

if [ -d "$NGRAMS_DIR/en" ]; then
  echo "$NGRAMS_DIR/en already exists, skipping download"
  exit 0
fi

curl -L -o "$NGRAMS_DIR/ngrams-en.zip" https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip
unzip -o "$NGRAMS_DIR/ngrams-en.zip" -d "$NGRAMS_DIR/"
rm "$NGRAMS_DIR/ngrams-en.zip"

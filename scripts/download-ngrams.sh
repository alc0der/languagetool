#!/bin/bash
set -euo pipefail

if [ -d ngrams/en ]; then
  echo "ngrams/en already exists, skipping download"
  exit 0
fi

curl -L -o ngrams/ngrams-en.zip https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip
unzip -o ngrams/ngrams-en.zip -d ngrams/
rm ngrams/ngrams-en.zip

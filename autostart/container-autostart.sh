#!/bin/bash

# Wait for network to be ready
sleep 5

# Start the container system (the API server)
/usr/local/bin/container system start 2>/dev/null

# Give the server a moment to initialize
sleep 3

# Create an internal (host-only) network — no internet access
/usr/local/bin/container network create languagetool-net --internal 2>/dev/null || true

# LanguageTool
/usr/local/bin/container run -d \
  --name languagetool \
  --network languagetool-net \
  -p 8010:8010 \
  -e Java_Xms=512m \
  -e Java_Xmx=2g \
  -e langtool_languageModel=/ngrams \
  -v /Users/alc0der/code/alc0der/languagetool/ngrams:/ngrams:ro \
  docker.io/erikvl87/languagetool

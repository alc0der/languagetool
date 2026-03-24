container network create languagetool-net --internal 2>/dev/null || true

if container list --all --quiet 2>/dev/null | grep -q '^languagetool$'; then
  container start languagetool
else
  container run -d \
    --name languagetool \
    --network languagetool-net \
    -p 8010:8010 \
    -e Java_Xms=512m \
    -e Java_Xmx=2g \
    -e langtool_languageModel=/ngrams \
    -v $PWD/ngrams:/ngrams:ro \
    languagetool
fi


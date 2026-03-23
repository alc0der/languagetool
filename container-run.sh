container network create languagetool-net --internal 2>/dev/null || true

container run -d \
  --name languagetool \
  --network languagetool-net \
  -p 8010:8010 \
  -e Java_Xms=512m \
  -e Java_Xmx=2g \
  -e langtool_languageModel=/ngrams \
  -v /Users/alc0der/code/alc0der/languagetool/ngrams:/ngrams:ro \
  languagetool


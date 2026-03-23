container run -d \
  --name languagetool \
  -p 8010:8010 \
  -e Java_Xms=512m \
  -e Java_Xmx=2g \
  -e langtool_languageModel=/ngrams \
  -v /Users/alc0der/code/alc0der/languagetool/ngrams:/ngrams:ro \
  docker.io/erikvl87/languagetool


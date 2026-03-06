# LanguageTool

Self-hosted [LanguageTool](https://languagetool.org/) instance using the [erikvl87/languagetool](https://hub.docker.com/r/erikvl87/languagetool) container image.

## Running

### Option 1: Docker Compose

```sh
docker compose up -d
```

### Option 2: Container run script

```sh
./container-run.sh
```

Both options start LanguageTool on port **8010** with 512m–1g of Java heap and an optional ngrams volume mounted at `/ngrams`.

## Ngrams (optional)

Place ngram data files in the `ngrams/` directory to enable additional grammar checks. See the [LanguageTool ngram documentation](https://dev.languagetool.org/finding-errors-using-n-gram-data) for details.

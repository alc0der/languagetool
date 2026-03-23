# LanguageTool

Self-hosted [LanguageTool](https://languagetool.org/) instance using the [erikvl87/languagetool](https://hub.docker.com/r/erikvl87/languagetool) container image, running on Apple's native `container` CLI.

## Running

### Option 1: Compose

```sh
container-compose up -d
```

### Option 2: Container run script

```sh
./container-run.sh
```

Both options start LanguageTool on port **8010** with 512m–2g of Java heap and an optional ngrams volume mounted at `/ngrams`.

## Autostart on login (macOS)

A LaunchAgent can start LanguageTool automatically when you log in. This uses Apple's native `container` CLI (`/usr/local/bin/container`).

### Install

```sh
task autostart:install
```

This copies a startup script to `~/.local/bin/container-autostart.sh` and a LaunchAgent plist to `~/Library/LaunchAgents/`, then loads it.

### Uninstall

```sh
task autostart:uninstall
```

### Logs

Stdout and stderr are written to `/tmp/container-autostart.log` and `/tmp/container-autostart.err`.

## Ngrams (optional)

Place ngram data files in the `ngrams/` directory to enable additional grammar checks. See the [LanguageTool ngram documentation](https://dev.languagetool.org/finding-errors-using-n-gram-data) for details.

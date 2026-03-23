# LanguageTool

Self-hosted [LanguageTool](https://languagetool.org/) instance using the [erikvl87/languagetool](https://hub.docker.com/r/erikvl87/languagetool) container image, running on Apple's native `container` CLI.

## Running

```sh
npm run run
```

This builds the custom image (with spelling additions), creates the internal network, and starts LanguageTool on port **8010** with 512m–2g of Java heap and an optional ngrams volume mounted at `/ngrams`. The container runs on an internal (host-only) network with no internet access.

## Autostart on login (macOS)

A LaunchAgent can start LanguageTool automatically when you log in. This uses Apple's native `container` CLI (`/usr/local/bin/container`).

### Install

```sh
npm run autostart:install
```

This copies a startup script to `~/.local/bin/container-autostart.sh` and a LaunchAgent plist to `~/Library/LaunchAgents/`, then loads it.

### Uninstall

```sh
npm run autostart:uninstall
```

### Logs

Stdout and stderr are written to `/tmp/container-autostart.log` and `/tmp/container-autostart.err`.

## Ngrams (optional)

Place ngram data files in the `ngrams/` directory to enable additional grammar checks. See the [LanguageTool ngram documentation](https://dev.languagetool.org/finding-errors-using-n-gram-data) for details.

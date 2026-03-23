# Private LanguageTool

Self-hosted [LanguageTool](https://languagetool.org/) instance using the [erikvl87/languagetool](https://hub.docker.com/r/erikvl87/languagetool) container image, running on Apple's native `container` with no internet access.

## Features

- Private: runs LanguageTools in a native Apple Container that doesn't have access to the internet
- Beyond Simple: Enables advanced LanguageTool features that go beyond simple spell check
- Custom Dictionary: Syncs ignored words with tools like:
  - Obsidian LanguageTool

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

Download English ngram data to enable additional grammar checks:

```sh
npm run download-ngrams
```

This fetches the ngram dataset into the `ngrams/` directory, which is mounted read-only into the container at `/ngrams`. See the [LanguageTool ngram documentation](https://dev.languagetool.org/finding-errors-using-n-gram-data) for details.

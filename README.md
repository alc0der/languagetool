[![ShellCheck](https://github.com/alc0der/languagetool/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/alc0der/languagetool/actions/workflows/shellcheck.yml)

# Private LanguageTool

Self-hosted [LanguageTool](https://languagetool.org/) instance using the [erikvl87/languagetool](https://hub.docker.com/r/erikvl87/languagetool) container image, running on Apple's native `container` with no internet access.

## Features

- **Private**: runs LanguageTool in a native Apple Container that doesn't have access to the internet
- **Beyond Simple**: enables advanced LanguageTool features that go beyond simple spell check

## Privacy Claims

- The container runs in a network that has no internet access
- The image [erikvl87/languagetool](https://hub.docker.com/r/erikvl87/languagetool) is credible enough that it is mentioned in the official LanguageTool repo

## Architecture

![Architecture](./docs/architecture.svg)

The container runs on an [internal network](https://github.com/apple/container), which has no route to the internet. The only exposure is a port forward from `localhost:8010` into the container.

## Why Not Docker?

On macOS, Docker Desktop runs containers inside a Linux VM — an extra layer between your host and the container. Apple's native [container](https://github.com/apple/container) runtime uses the Apple Virtualization Framework directly, skipping the intermediate VM and daemon overhead.

| Docker Desktop on macOS | Apple Native Containers |
|:-:|:-:|
| ![Docker](./docs/docker.svg) | ![Native](./docs/native.svg) |

## Prerequisites

- macOS with [Apple container CLI](https://github.com/apple/container) (`/usr/local/bin/container`)

## Installation

### Homebrew (recommended)

```sh
brew install alc0der/plt/plt
plt download-ngrams   # optional, ~1.6 GB
brew services start plt
```

### Manual

Clone this repository, then:

```sh
task download-ngrams   # optional, ~1.6 GB
./bin/plt start
```

## Usage

LanguageTool runs at **http://localhost:8010**. Point any LanguageTool client to this URL.

For the desktop application, open **Settings > Advanced** and select *Other server*, then enter `http://localhost:8010/v2`:

![LanguageTool Advanced Settings](./docs/screenshots/LanguageTool%20Settings.png)

### CLI commands

| Command | Description |
|---|---|
| `plt start` | Start LanguageTool (detached) |
| `plt stop` | Stop LanguageTool |
| `plt uninstall` | Stop and remove the container and network |
| `plt status` | Show container status |
| `plt download-ngrams` | Download English ngram data (~1.6 GB) |

### Ngrams

Ngram data enables additional grammar checks beyond the default rule set. The download is optional but recommended. See the [LanguageTool ngram documentation](https://dev.languagetool.org/finding-errors-using-n-gram-data) for details.

## Uninstallation

### Homebrew

```sh
brew services stop plt
plt uninstall
brew uninstall plt
brew untap alc0der/plt
```

To also remove downloaded ngram data:

```sh
rm -rf "$(brew --prefix)/var/plt"
```

### Manual

```sh
plt uninstall
```

## Roadmap

- **Custom dictionary**: sync ignored words with tools like [Obsidian LanguageTool](https://github.com/Clemens-E/obsidian-languagetool-plugin)
- **Pre-built container image**: publish the image to a container registry (`ghcr.io`) so users can skip the `plt build` step entirely

## License

[MIT](LICENSE)

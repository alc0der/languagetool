#!/bin/bash
set -euo pipefail

mkdir -p ~/.local/bin
sed "s|__REPO_DIR__|$PWD|g" autostart/container-autostart.sh > ~/.local/bin/container-autostart.sh
chmod +x ~/.local/bin/container-autostart.sh
cp autostart/com.apple.container.autostart.plist ~/Library/LaunchAgents/com.apple.container.autostart.plist
launchctl unload ~/Library/LaunchAgents/com.apple.container.autostart.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.apple.container.autostart.plist

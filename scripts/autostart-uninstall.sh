#!/bin/bash
set -euo pipefail

launchctl unload ~/Library/LaunchAgents/com.apple.container.autostart.plist 2>/dev/null || true
rm -f ~/Library/LaunchAgents/com.apple.container.autostart.plist
rm -f ~/.local/bin/container-autostart.sh

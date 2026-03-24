#!/bin/bash
set -euo pipefail

# Write env file so the autostart script knows where files live
mkdir -p ~/.local/etc
cat > ~/.local/etc/plt.env <<EOF
PLT_LIBEXEC=$PWD
PLT_DATA=$PWD
EOF

# Install the autostart script and LaunchAgent
mkdir -p ~/.local/bin
cp autostart/container-autostart.sh ~/.local/bin/container-autostart.sh
chmod +x ~/.local/bin/container-autostart.sh
cp container-run.sh ~/.local/bin/container-run.sh
chmod +x ~/.local/bin/container-run.sh
cp autostart/com.apple.container.autostart.plist ~/Library/LaunchAgents/com.apple.container.autostart.plist
launchctl unload ~/Library/LaunchAgents/com.apple.container.autostart.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.apple.container.autostart.plist

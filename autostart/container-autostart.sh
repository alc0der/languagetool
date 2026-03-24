#!/bin/bash

# Source env vars (PLT_LIBEXEC, PLT_DATA) written by autostart-install.sh
if [ -f ~/.local/etc/plt.env ]; then
  # shellcheck source=/dev/null
  . ~/.local/etc/plt.env
  export PLT_LIBEXEC PLT_DATA
fi

# Wait for network to be ready
sleep 5

# Start the container system (the API server)
/usr/local/bin/container system start 2>/dev/null

# Give the server a moment to initialize
sleep 3

# Delegate to the relocatable container-run.sh
exec "${PLT_LIBEXEC:-$HOME/.local/bin}/container-run.sh"

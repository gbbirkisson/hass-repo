#!/usr/bin/with-contenv bashio
set -e

STARTUP_DIR="/config/claude/startup"

if [ -d "$STARTUP_DIR" ]; then
    bashio::log.info "Looking for startup scripts in $STARTUP_DIR..."

    # Enable nullglob so the loop doesn't run if no files match
    shopt -s nullglob

    for script in "$STARTUP_DIR"/*.sh; do
        if [ -f "$script" ]; then
            bashio::log.info "Sourcing startup script: $script"
            # Source the script to allow environment variable exports
            . "$script"
        fi
    done

    shopt -u nullglob
else
    bashio::log.debug "No startup directory found at $STARTUP_DIR"
fi


#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Initializing /data as HOME..."

# Ensure /data exists
mkdir -p /data

# If Claude was installed to /root/.claude during build, move it to /data/.claude
# so it is available in the persistent HOME.
if [ -d "/root/.claude" ] && [ ! -d "/data/.claude" ]; then
    bashio::log.info "Copying Claude installation to persistent home (/data/.claude)"
    cp -rp /root/.claude /data/
fi

# Create /config/claude directory for user projects
PROJECT_DIR="/config/claude"
if [ ! -d "$PROJECT_DIR" ]; then
    bashio::log.info "Creating project directory at $PROJECT_DIR"
    mkdir -p "$PROJECT_DIR"
fi


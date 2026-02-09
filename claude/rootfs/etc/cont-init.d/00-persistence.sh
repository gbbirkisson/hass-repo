#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Initializing /data as HOME..."

rm -rf /data/.local/share/claude /data/.local/bin/claude
mkdir -p /data/.local/share /data/.local/bin

rm /root/.local/bin/claude
mv -f /root/.local/share/claude /data/.local/share
ln $(realpath $(ls /data/.local/share/claude/versions/*)) /data/.local/bin/claude

# Create /config/claude directory for user projects
PROJECT_DIR="/config/claude"
if [ ! -d "$PROJECT_DIR" ]; then
    bashio::log.info "Creating project directory at $PROJECT_DIR"
    mkdir -p "$PROJECT_DIR"
fi

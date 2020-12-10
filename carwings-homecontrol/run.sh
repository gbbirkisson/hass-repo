#!/usr/bin/env bashio

set -e

cat <<EOF >/config.json
{
    "username": "$(bashio::config 'username')",
    "password": "$(bashio::config 'password')",
    "region": "$(bashio::config 'region')",
    "accessory_name": "$(bashio::config 'accessory_name')",
    "homekit_pin": "$(bashio::config 'homekit_pin')",
    "climate_update_interval": "$(bashio::config 'climate_update_interval')",
    "battery_update_interval": "$(bashio::config 'battery_update_interval')",
    "storage_path": "$(bashio::config 'storage_path')",
    "debug": $(bashio::config 'debug')
}
EOF

bashio::log.info "Starting carwings-homecontrol"
exec carwings-homecontrol -config /config.json

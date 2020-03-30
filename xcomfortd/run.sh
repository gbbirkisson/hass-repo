#!/bin/sh

set -e

err () { echo "$@" 1>&2; exit 1; }

check_env_var () {
    if [ $2 = "" ]; then
        err "Environmental variable $1 not set"
    fi
}

CONFIG_PATH=/config
PLUGIN_CONFIG_PATH=/data/options.json

# Setup MQTT
MQTT_CLIENT_ID="$(jq --raw-output '.mqtt-client-id' $PLUGIN_CONFIG_PATH)"
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_PORT=$(bashio::services mqtt "port")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

check_env_var MQTT_HOST ${MQTT_HOST}
check_env_var MQTT_PORT ${MQTT_PORT}
check_env_var MQTT_USER ${MQTT_USER}
check_env_var MQTT_PASSWORD ${MQTT_PASSWORD}

set -- xcomfortd --client-id ${MQTT_CLIENT_ID} --server "${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}:${MQTT_PORT}"

# Setup other parameters
DATAPOINTS_FILE="$(jq --raw-output '.datapoints-file' $PLUGIN_CONFIG_PATH)"
DEVICE_NUMBER="$(jq --raw-output '.device-number' $PLUGIN_CONFIG_PATH)"

set -- "$@" --device-number ${DEVICE_NUMBER} --file "${CONFIG_PATH}/${DATAPOINTS_FILE}"

echo "Starting xcomfortd ..."

exec "$@"
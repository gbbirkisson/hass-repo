#!/usr/bin/env bashio

set -e

CONFIG_PATH=/config

MQTT_CLIENT_ID="$(bashio::config 'mqtt_client_id')"
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
DATAPOINTS_FILE="$(bashio::config 'datapoints_file')"
DEVICE_NUMBER="$(bashio::config 'device_number')"

set -- "$@" --device-number ${DEVICE_NUMBER} --file "${CONFIG_PATH}/${DATAPOINTS_FILE}"

bashio::log.info "Starting xcomfortd ..."

exec "$@"
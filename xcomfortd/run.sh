#!/usr/bin/env bashio

set -e

CONFIG_PATH=/config

MQTT_CLIENT_ID="$(bashio::config 'mqtt_client_id')"
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_PORT=$(bashio::services mqtt "port")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")
DATAPOINTS_FILE="$(bashio::config 'datapoints_file')"
DEVICE_NUMBER="$(bashio::config 'device_number')"

set -- xcomfortd usb \
    --client-id ${MQTT_CLIENT_ID} \
    --server "tcp://${MQTT_USER}:${MQTT_PASSWORD}@${MQTT_HOST}:${MQTT_PORT}" \
    --device-number ${DEVICE_NUMBER} \
    --file "${CONFIG_PATH}/${DATAPOINTS_FILE}"

bashio::log.info "Starting $(xcomfortd --version)"
bashio::log.debug "$(echo $@ | sed s/${MQTT_USER}:${MQTT_PASSWORD}/*****/g)"

exec "$@"
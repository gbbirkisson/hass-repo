#!/bin/sh

set -e

CONFIG_PATH=/data/options.json

HOST="$(jq --raw-output '.mqtt_host' $CONFIG_PATH)"
USER="$(jq --raw-output '.mqtt_user' $CONFIG_PATH)"
PASS="$(jq --raw-output '.mqtt_pass' $CONFIG_PATH)"

echo "[Info] Starting gateway"

xcomfortd/xcomfortd -v -h $HOST -u $USER -P $PASS
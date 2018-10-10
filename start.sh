#!/usr/bin/env bash
set -e

echo "CouchPotato settings"
echo "===================="
echo
echo "  Config:     ${CONFIG:=/config/config.ini}"
echo

printf "Checking permissions... "
touch ${CONFIG}
echo "[DONE]"

CONFIG=${CONFIG:-/config/config.ini}
echo "Starting CouchPotato..."
/opt/couchpotato/CouchPotato.py --data_dir=$(dirname ${CONFIG}) --config_file=${CONFIG}

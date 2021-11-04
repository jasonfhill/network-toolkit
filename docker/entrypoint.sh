#!/usr/bin/env bash

#
# populate index with instance details
#

WEB_ROOT=/usr/share/nginx/html
HOSTNAME=$(hostname)

CONTAINER_IP=$(ip -j route get 1 | jq -r '.[0] .prefsrc')

echo "${HOSTNAME} - ${CONTAINER_IP}" > ${WEB_ROOT}/index.html

exec "$@"
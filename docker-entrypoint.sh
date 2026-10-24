#!/usr/bin/env sh
set -eu

echo -n "proxy-swagger: v"; cat version

envsubst '${API_URL},${SWAGGER_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"

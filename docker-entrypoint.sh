#!/usr/bin/env sh
set -eu

envsubst '${API_URL},${SWAGGER_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"

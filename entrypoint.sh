#!/bin/sh
set -e
PORT_VAL=${PORT:-8080}
UUID_VAL=${UUID:-8088e1b6-b22c-4532-8680-3b907209c707}
WS_PATH=${WS_PATH:-/ray}

sed -e "s/8080/$PORT_VAL/" \
    -e "s|8088e1b6-b22c-4532-8680-3b907209c707|$UUID_VAL|" \
    -e "s|/ray|$WS_PATH|" \
    /etc/xray/config-template.json > /etc/xray/config.json

echo "Starting xray on port $PORT_VAL, ws path $WS_PATH"
exec /usr/bin/xray run -c /etc/xray/config.json

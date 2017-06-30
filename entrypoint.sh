#!/bin/sh

BASE_FILE="/etc/prometheus/prometheus.original.yml"
DEST_FILE="/etc/prometheus/prometheus.yml"

test -f "$BASE_FILE" \
  && cat $BASE_FILE | envsubst > $DEST_FILE

exec /bin/prometheus \
  -config.file=/etc/prometheus/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/usr/share/prometheus/console_libraries \
  -web.console.templates=/usr/share/prometheus/consoles

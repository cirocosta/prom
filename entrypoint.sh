#!/bin/sh

BASE_FILE="/etc/prometheus/prometheus.env.yml"
DEST_FILE="/etc/prometheus/prometheus.yml"

if [ -f "$BASE_FILE" ]; then
  echo "INFO:
    Base file ($BASE_FILE) found.
    Going to substitute it with its counterpart having
    all environment variables substituted ($DEST_FILE)
    "
  cat $BASE_FILE | envsubst > $DEST_FILE

  echo "INFO:
    Done!
    
    Now starting prometheus.
    "
else
  echo "INFO:
    Base file ($BASE_FILE) not found.
    No environment variables are going to be substituted.
    "
fi

exec /bin/prometheus \
  -config.file=/etc/prometheus/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/usr/share/prometheus/console_libraries \
  -web.console.templates=/usr/share/prometheus/consoles

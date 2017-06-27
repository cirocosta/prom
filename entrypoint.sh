#!/bin/sh

BASE_FILE="/etc/prometheus/prometheus.original.yml"
DEST_FILE="/etc/prometheus/prometheus.yml"

test -f "$BASE_FILE" \
  && cat $BASE_FILE | envsubst > $DEST_FILE


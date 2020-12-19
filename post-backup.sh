#!/bin/sh

title="Restic Backup Report"
body="$(cat /var/log/backup-last.log)"

json=$( jq -n \
    --arg bdy "$body" \
    --arg ttl "$title" \
    '{body: $bdy, title: $ttl}' )

contentType="Content-Type: application/json"

curl -X POST -d "$json" -H $contentType "$APPRISEURL"


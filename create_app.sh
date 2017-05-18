#!/bin/bash

. $(dirname ${0})/nudge_api.sh

account_id="${1?account ID required}"
app_name="${2:-new application}"


payload=$(mktemp)
cat > ${payload} <<EOF
{
	"name": "${app_name}",
	"prod": false,
	"techno": "JAVA",
	"sla_active": false,
	"account_id": "${account_id}"
}
EOF

echo "-- create application --"
doRequest POST apps ${payload}

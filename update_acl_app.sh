#!/bin/bash

. $(dirname ${0})/nudge_api.sh

app_id="${1?app ID required}"
admin="${2?admin email required}"
guest="${3?guest email required}"

payload=$(mktemp)
cat > ${payload} <<EOF
{
	"${admin}": "admin",
	"${guest}": "guest"
}
EOF

echo "-- update application ACL --"
doRequest PUT apps/${app_id}/acl ${payload}

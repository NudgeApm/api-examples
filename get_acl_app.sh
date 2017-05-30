#!/bin/bash

. $(dirname ${0})/nudge_api.sh

app_id="${1?app ID required}"

echo "-- get application ACL --"
doRequest GET apps/${app_id}/acl

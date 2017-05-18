#!/bin/bash

. $(dirname ${0})/nudge_api.sh

echo "-- list applications --"
doRequest GET apps

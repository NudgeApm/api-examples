#!/bin/bash

. $(dirname ${0})/nudge_api.sh

echo "-- list accounts --"
doRequest GET accounts

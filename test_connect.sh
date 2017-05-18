#!/bin/bash

. $(dirname ${0})/nudge_api.sh

echo "-- get current user --"
doRequest GET users/current

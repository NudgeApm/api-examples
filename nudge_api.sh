#!/bin/bash

FORMAT_CMD="cat"
echo '{}' | python -m json.tool > /dev/null
if [ "0" -eq "${?}" ]; then
	FORMAT_CMD="python -m json.tool"
fi

set -o pipefail
set -u
set -e

NUDGE_URL="${NUDGE_URL:-https://monitor.nudge-apm.com/api}"

if [ "${NUDGE_TOKEN:-}" == "" ]; then
	echo "missing NUDGE_TOKEN variable"
	exit 1
fi



doRequest(){
	method=${1?missing http method}
	path=${2?missing path}
	payload=${3:-}
	payload_option=""
	if [ -f "${payload}" ]; then
		payload_option="--data @${payload}"
	fi

	response=$(mktemp)
	full_url="${NUDGE_URL}/${path}"
	curl -v \
		-H "Authorization: Bearer ${NUDGE_TOKEN}" \
		-H "Content-Type: application/json" \
		-X "${method}" \
		-w "\n%{http_code}" \
		${payload_option} \
		"${full_url}" \
		> ${response}
	status=$(cat ${response} | tail -1)
	json=$(cat ${response} | sed '$d')
	rm -f ${response}

	echo "request : ${method} ${full_url}"
	if [ -f "${payload}" ]; then
		cat "${payload}"
		rm -f "${payload}"
	fi
	echo "----"
	echo "response: ${status}"
	echo "${json}" | ${FORMAT_CMD}
}

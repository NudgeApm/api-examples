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

	response=$(mktemp)
	full_url="${NUDGE_URL}/${path}"
	curl -s \
		-H "Authorization: Bearer ${NUDGE_TOKEN}" \
		-X "${method}" \
		-w "\n%{http_code}" \
		"${full_url}" \
		> ${response}
	status=$(cat ${response} | tail -1)
	json=$(cat ${response} | sed '$d')

	echo "request : ${method} ${full_url}"
	echo "HTTP status : ${status}"
	echo "${json}" | ${FORMAT_CMD}
}

#!/bin/bash

. $(dirname ${0})/nudge_api.sh

echo "-- export transactions to CSV --"
app_id="${1?app ID required}"
from="${2:--1d}"

json_data=$(mktemp)
# note : we have to trim first 3 lines in order to have only JSON response
doRequest GET apps/${app_id}/transactions?from=${from} | \
	sed '1,3d' > ${json_data}

separator=";"

python - << EOF
import json	

with open('${json_data}') as json_file:
	data = json.load(json_file)

	print("${separator}".join(( "Name", "Time" , "Count", "Errors" )))
	for t in data['transactions']:
		m = t['summary']

		print("${separator}".join(( t['name'], str(m['time']) , str(m['count']), str(m['errors']) )))

EOF

rm ${json_data}

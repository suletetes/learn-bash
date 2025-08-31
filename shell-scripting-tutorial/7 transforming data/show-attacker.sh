#!/bin/bash

# count the number of failed logins by ip address.
# if there are any ips with over limit failures, display the count, ip, and location.

LIMIT='10'
LOG_FILE="${1}"


# make sure a file was supplied as an arguement.
if [[ ! -e "${LOG_FILE}" ]]
then
    echo "Cannot open log file: ${LOG_FILE}" >&2
    exit 1
fi
# display the csv header
echo 'Count,IP,Location'
# loop through the list of failed attempts and corresponding IP addresses

grep Failed syslog-sample | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
    # if no. of failed attempts is greater than the limit, display count, ip, and location
    if [[ "${COUNT}" -gt "${LIMIT}" ]] 
    then
        LOCATION=$(geoiplookup ${IP} | awk -F ', ' {print $2})
        echo "${COUNT},${IP},${LOCATION}"
    fi
done
exit 0
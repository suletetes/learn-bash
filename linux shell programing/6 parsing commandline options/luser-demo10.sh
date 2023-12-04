#!/bin/bash
# function log{
#     echo "You called the log function!"
# }

log(){
    local verbose="${1}"
    shift
    local message="${@}"
    if [[ "${verbose}" = 'true' ]]
    then
        echo "${message}"
    fi
}

# log 'true' 'Hello'
# verbose='true'
# log 'This is fun!'

verbosity='true'
log "${verbosity}" "hello!"
log "${verbosity}" "this is fun!"

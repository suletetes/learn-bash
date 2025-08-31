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
    logger -t luser-demo10.sh "${message}"
}

backup_file(){
    local file="${1}"
    # make sure file exists
    if [[ -f "${file}" ]]
    then
        local BACKUP_FILE="/var/tmp/$(basename ${file}).$(date +%F-%N)"
        log "Backing up ${file} to ${BACKUP_FILE}."
        
        # the exit status of the function will be the exit status of the cp command
        cp -p ${file} ${BACKUP_FILE}
    else
        # the file does not exist, so retturn a non zero exit status
        return 1
    fi
}

# log 'true' 'Hello'
# verbose='true'
# log 'This is fun!'

verbosity='true'
log "${verbosity}" "hello!"
log "${verbosity}" "this is fun!"

backup_file
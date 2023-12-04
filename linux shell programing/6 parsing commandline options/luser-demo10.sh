#!/bin/bash
# function log{
#     echo "You called the log function!"
# }

log(){
    local message="${@}"
    echo "${message}"
}

log 'Hello'
log 'This is fun!'
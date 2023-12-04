#!/bin/bash

#  this script demonstrates the case statement

if [[ "${1}" = 'start' ]]
then
    echo 'starting.'
elif [[ "${1}" = 'stop' ]]
then
    echo 'stopping.'
elif [[ "${1}" = 'status' ]]
then
    echo "status"
else
    echo 'supply a valid option' >&2
    exit 1
fi
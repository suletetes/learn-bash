#!/bin/bash

#display uuid
echo "your uid is ${UID}"

uid_to_test_for='1000'

if [[ "${UID}" -ne "${uid_to_test_for}" ]]
then
    echo "Your UID does not match ${uid_to_test_for}"
    exit 1
fi

# display username
user_name=$(id -un)

if [[ "${?}" -ne 0 ]]
then
    echo 'The id command did not execute successfully'
    exit 1
fi
echo "Your username is ${user_name}"

#!/bin/bash

# this script generates random password

usage(){
    echo "usage: ${0} [-vs] [-l length] >&2"
    echo 'Generate a random password'
    echo "-l lenght specify the password length"
    echo "-s append a special character to the password"
    echo "-v verbose output"
    exit 1
}


log(){
    
    local message="${@}"
    if [[ "${verbose}" = 'true' ]]
    then
        echo "generating password"
    fi
}

# set a default password length
LENGTH=48
while getopts vl:s OPTION
do
    case ${OPTION} in
        v)
            verbose='true'
            echo "Verbose mode on"
        ;;
        l)
            length="${OPTARG}"
        ;;
        s)
            USE_SPECIAL_CHARACTER='true'
        ;;
        ?)
            echo 'Invalid option' >&2
            exit 1
        ;;
    esac
done

log 'Generating a password'
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# append a special character if requested to do so
if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
then
    log 'Selecting a random special character.'
    SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
    PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

log 'Done'
log 'Here is the password'

# display password
echo "${PASSWORD}"

exit 0
#!/bin/bash

#  the script disables, deletes, and/or archives users on the local systme
usage(){
    # Display the usage and exit.
    echo "Usage: ${0} [-dra] user [usern]" >&2
    echo "Disable a local linux account" >&2
    echo " -d Deletes accounts instead of disabling them." >&2
    echo " -r Removes the home directory associated with the account(s)." >&2
    echo " -a creates the an archive of the home directory associated with the account(s)." >&2
    exit 1
}

# make sure the script is being executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then
    echo "Please run this script as root or sudo">&2
    exit 1
fi

# parse the options
while getopts dra OPTION
do
    case ${OPTION} in
    d) DELETE_USER='true' ;;
    r) REMOVE_OPTION='-r' ;;
    a) ARCHIVE='true' ;;
    ?) usage ;;
    esac
done
#!/bin/bash

#  this script deletes a user.

# run as root
if [ "${UID}" != "0" ]
then
    echo "please run with sudo or as root." >&2
    exit 1
fi

# assume the first arguement is user to delete.
USER="${1}"

# delete the user
userdel  ${USER}

# make sure the user got deleted
if [[ "${?}" -ne 0 ]]
then
    echo "The account ${USER} was not deleted.">&2
    exit 1
fi

# tell the user the account  was deleted
echo "User ${USER} has been deleted."

exit 0
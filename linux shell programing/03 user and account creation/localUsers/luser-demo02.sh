#!/bin/bash

# display the UID and username of the user executing this script.
# display if the user isthe root user or not

echo "Your UUID is ${UID}"

# display username

user_name=$(id -un)
# user_name=`id -un`

echo "your username name is ${user_name}"

# display if the user isthe root user or not
# if [[ "${UID}" -eq 0 ]]
if [[ "${UID}" == 0 ]]
then
    echo 'You are root'
else 
    echo 'You are not root'
fi

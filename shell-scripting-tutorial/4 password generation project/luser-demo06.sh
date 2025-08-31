#!/bin/bash

# display what user typed
echo "You executed this command: ${0}"

# display the path and filename of the script
echo "you used $(dirname ${0}) as the path to the $(basename ${0}) script."

# how many arguements they passed in
number_of_parameters="${#}"
echo "You supplied ${number_of_parameters} argument(s) on the commandline."

# make sure they at least supply one arguement.
if [[ "${number_of_parameters}" -lt 1 ]]
then
    echo "usage; ${0} user_name [user_name]..."
    exit 1
fi

# generate and display a password for each paramter
for user_name in "${@}"
do
    password=$(date +%s%n | sha256sum | head -c48)
    echo "$user_name's password is $password"
done
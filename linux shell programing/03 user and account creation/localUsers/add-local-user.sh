#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
    echo "Please run with sudo or as root"
    exit 1
fi
# get the username (login)
read -p 'Enter the username to create: ' user_name

#  get the real name 
read -p 'enter the name of the person or app that will be using this account: ' comment

# get the password
read -p 'enter the password to use for the account: ' password

# create account
useradd -c "${comment}" -m ${user_name}

if [[ "${?}" -ne 0 ]]
then
    echo 'The account could not be created.'
    exit 1
fi

# set password
echo ${password} } passwd --stdin ${user_name}
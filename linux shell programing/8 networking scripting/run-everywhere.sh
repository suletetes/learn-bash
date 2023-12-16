#!/bin/bash

#  a list of servers, one per line.
SERVER_LIST='servers'

# options for ssh command

SSH_OPTIONS='-o ConnectTimeout=2'


usage(){
    # display the usage and exit
    echo "usage: ${0} [-nsv] [-f FILE] command" >&2
    echo "executes command as a single command on every server" >&2
}
# make sure the script is not begin executed with suoeruse privileges
if [[ "${UID}" -eq 0 ]]
then
    echo "Do not execute this script as root. use the -s option instead." >&2
    usage
fi
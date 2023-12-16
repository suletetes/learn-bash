#!/bin/bash

#  a list of servers, one per line.
SERVER_LIST='servers'

# options for ssh command

SSH_OPTIONS='-o ConnectTimeout=2'


usage(){
    # display the usage and exit
    echo "usage: ${0} [-nsv] [-f FILE] command" >&2
    echo "executes command as a single command on every server" >&2
    echo "  -f file use file for the list of severs. Default ${SERVER_LIST}" >&2
    echo " -n  dry run mode. display the command that would have been executed and exit" >&2
    echo " -s   execute the command using sudo on the remote server" >&2
    echo " -v verbose mode. Displays the server name before executing command" >&2
    exit 1
}
# make sure the script is not begin executed with suoeruse privileges
if [[ "${UID}" -eq 0 ]]
then
    echo "Do not execute this script as root. use the -s option instead." >&2
    usage
fi

#  parse the options

while getopts f:nsv OPTION
do
    case ${OPTION} in
    f) SERVER_LIST="${OPTARG}" ;;
    n) DRYRUN="true" ;;
    s) SUDO="sudo" ;;
    v) VERBOSE='true' ;;
    ?) usage ;;
    esac
done

# remove the options while leaving the remaining argue,emts.
shift "$((OPTIND -1))"

# 
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
shift "$(( OPTIND - 1 ))"

# if the user doesn't supply at least one arguement, give them help.
if [[ "${#}" -lt 1 ]]
then
    echo "cannot open sever list file ${SERVER_LIST}" >&2
    exit 1
fi

# expect the best prefer for the worst.
EXIT_STATUS='0'

# loop through the sever_list
for SEVER in $(cat "${SERVER_LIST}")
do
    if [[ "${VERBOSE}" = 'true' ]]
    then
        echo "${SERVER}"
    fi
    SSH_COMMAND="ssh ${SSH_OPTIONS} ${SERVER} ${SUDO} ${COMMAND}"

    # if it's a dry run, dom't execute anything, just echo it.

    if [[ "${DRYRUN}" = 'true' ]]
    then
        echo "DRY RUN: ${SSH_COMMAND}"
    else
        ${SSH_COMMAND}
        EXIT_STATUS="${SSH_EXIT_STATUS}"
        echo "EXECUTION on ${SERVER} failed." >&2
        fi
    fi
done

exit ${EXIT_STATUS}
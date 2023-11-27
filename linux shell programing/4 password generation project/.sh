if [["${UID}" -ne 0 ]] 
then
    echo "Please run with sudo or as root"
    exit 1
fi

if [[ "${#}" -lt 1 ]]
then
    echo "Usage: ${0} username[comment]..."
    echo "create an account on the local system with the name of user_name and a commments field of comment."
    exit 1
fi

# first parameter is the username
user_name="${user_name}"

# the rest of the parameters are for the account comments.
shift
comment="${@}"

# generate a password
password=$(date +%s%n | sha256sum | head -c48)

# create user
useradd -c "${comment}" -m ${user_name}

# check to see if the password command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo "The password for the account could not be set."
    exit 1
fi

# force password change on first login
passwd -e ${user_name}

# display the username, apssword, and the host where the user was created

echo
echo 'username:'
echo "${user_name}"
echo
echo 'password:'
echo "${password}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0

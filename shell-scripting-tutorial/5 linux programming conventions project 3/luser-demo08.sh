#!/bin/bash

#  This script demonstrates I/O redirection
# redirect stdout to a file
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# redirect stdin to a file
read LINE < ${FILE}
echo "Line contains: ${LINE}"

# redirect stdout file, overwriting the file

head -n3 /etc/passwd > ${FILE}
echo
echo "Contents if ${FILE}:"
cat ${FILE}

# redirect stdout to a file, appending to the file
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}

# redirect stdin to a program, using FD 0
read LINE 0< ${FILE}
echo
echo "Line contains: ${LINE}"


# redirect stdout to a file using fd 1, overwriting the file
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of ${FILE}"
cat ${FILE}

# redirectt stderr to a file using fd 2.
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}

# redirect stdout and sterr  to a file
head -n3 /etc/passwd /fakefile &> ${FILE}
echo
echo "Contents of ${FILE}:"
echo ${FILE}

# redirect stdout and stderr through a pipe.
echo
head -n3 /etc/passwd /fakefile |& cat -n

# discard stderr
echo
echo "Discarding stderr"
head -n3 /etc/passwd /fakefile 2>/dev/null
# discard stdout and stderr
head -n3 /etc/passwd /fakefile &>/dev/null

# clean up
rm ${FILE} ${ERR_FILE} &> /dev/null
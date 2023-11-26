#!/bin/bash
password="${RANDOM}"
echo "${password}"


# three random numbers together
password="${RANDOM}${RANDOM}${RANDOM}"
echo "${password}"

password=$(date +%s)
echo "${password}"

# use nano seconds
password=$(date +%s%n)
echo "${password}"

# a better password

password=$(date +%s%n | sha256sum | head -c32)
echo "${password}"

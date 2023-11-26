#!/bin/bash
password="${RANDOM}"
echo "${password}"


# three random numbers together
password="${RANDOM}${RANDOM}${RANDOM}"
echo "${password}"

password=$(date +%s)
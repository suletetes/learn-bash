#!/bin/bash

#  this script shows the open network ports on a system.
#  use -4 as an arguement to limit tcpv4 ports

# if [[ "${}"]]
netstat -nutl ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
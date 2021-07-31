#!/bin/bash

# Get a list of the offending IP addresses
for z in $(grep "Invalid\|Failed" /var/log/auth.log | awk '{ print $13 }' | awk NF | sort | uniq)
    do
    # Get the number of times this IP has hit us
    hits=$(grep "Invalid\|Failed" /var/log/auth.log | grep $z | wc -l)
    # Check whether this IP was already blocked
    blocked=$(grep $z /etc/hosts.deny | wc -l)
    # If they hit us more than 3 times and are not already on the deny list
    if [ "$hits" -gt 3 -a "$blocked" -eq 0 ]; then
        echo "sshd : $z" >> /etc/hosts.deny
    fi
done

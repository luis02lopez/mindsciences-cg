#!/bin/bash

usage_last_minute=$(cat /proc/loadavg | awk '{print $3}'|cut -f 1 -d ".")
number_of_cores=$(nproc --all)
max_cpu_usage=$(( $number_of_cores*100 ))
slack_token="xoxp-23984754863-2348975623103"

if [[ $usage_last_minute > $max_cpu_usage ]]; then

    echo "Where are calling the Slack API here :) "

    curl --request POST https://slack.com/api/chat.postMessage --data @/mindsciences/slack-payload.json \
    --header "Content-Type: application/json" --header "Authorization: Bearer ${slack_token}"
fi

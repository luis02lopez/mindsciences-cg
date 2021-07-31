#!/bin/bash

#Start brute-force protection
rsyslogd > /dev/null 2>&1
echo "AuthenticationMethods password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes"  >> /etc/ssh/sshd_config
service ssh start
service fail2ban start

#Cron for constant CPU check

# Added a cronjob in a new crontab
echo "* * * * *  root bash /mindsciences/cpu-monitor.sh" > /etc/crontab 
# Registering the new crontab
crontab /etc/crontab
# Starting the cron
service cron start

exec "$@"
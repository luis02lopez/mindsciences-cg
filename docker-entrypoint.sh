#!/bin/bash

#Enable OS logging and SSH service
rsyslogd > /dev/null 2>&1
echo "AuthenticationMethods password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes"  >> /etc/ssh/sshd_config
service ssh start

#Cron for SSH brute-force protection per minute for high security
echo "* * * * *  root bash /mindsciences/ssh-protection.sh" >> /etc/crontab 

#Cron for constant CPU check
echo "* * * * *  root bash /mindsciences/cpu-monitor.sh" >> /etc/crontab 

# Registering the new crontab and start cron service
crontab /etc/crontab
service cron start

exec "$@"
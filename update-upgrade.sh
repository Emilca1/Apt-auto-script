#!/bin/bash

LOG_FILE="/var/log/auto-upgrade.log"  # You're log file, can also be the native rsyslog system

CRON_JOB="0 0 * * * /usr/local/bin/update-and-upgrade.sh >> $LOG_FILE 2>&1" # Cron job that run every day at midnight

# Add crontab if not already exist
(crontab -l | grep -F "$CRON_JOB") >/dev/null 2>&1
if [ $? -ne 0 ]; then
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron task added : $CRON_JOB" >> $LOG_FILE
fi

# Updating packages
echo "Packages update - $(date)" >> $LOG_FILE
apt update -y >> $LOG_FILE 2>&1

# full upgrading packages
echo "Packages upgrade" >> $LOG_FILE
apt full-upgrade -y >> $LOG_FILE 2>&1

# Clean old and useless packages
apt autoremove -y >> $LOG_FILE 2>&1
apt autoclean -y >> $LOG_FILE 2>&1

# Reboot if needed by a package
if [ -f /var/run/reboot-required ]; then
    echo "Reboot required - $(date)" >> $LOG_FILE
    /sbin/shutdown -r now
else
    echo "No reboot required - $(date)" >> $LOG_FILE
fi

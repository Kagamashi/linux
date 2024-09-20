#!/bin/bash

# CONFIGURING THE SYSTEM FOR COMMON TASKS
# chronyd, ntpd, logrotate


# Time Synchronization
# chronyd – A daemon for chrony, which is used for time synchronization
# Configuration file: /etc/chrony/chrony.conf

# Start and enable chronyd service
systemctl start chronyd             # Start the chronyd service
systemctl enable chronyd            # Enable chronyd to start on boot

# Check the status of chronyd service
systemctl status chronyd            # Show the current status of chronyd service

# ntpd – Network Time Protocol daemon for time synchronization
# Configuration file: /etc/ntp.conf

# Start and enable ntpd service
systemctl start ntpd                # Start the ntpd service
systemctl enable ntpd               # Enable ntpd to start on boot

# Check the status of ntpd service
systemctl status ntpd               # Show the current status of ntpd service

# Note: Only one time synchronization service should be used at a time. If both chronyd and ntpd are installed, disable one.


# Log Management and Rotation
# logrotate – Tool for rotating, compressing, and mailing system logs
# Configuration files: /etc/logrotate.conf, /etc/logrotate.d/

# Check the status of logrotate (run manually)
logrotate -d /etc/logrotate.conf   # Debug mode; show what logrotate would do without actually doing it

# Force logrotate to run (for testing)
logrotate -f /etc/logrotate.conf   # Force logrotate to rotate logs based on the configuration

# View logrotate status
# Logrotate logs are typically not kept by default. You can enable logging by adding:
#   - `create` directive in /etc/logrotate.conf
#   - Logging example:
#     /var/log/syslog {
#       weekly
#       rotate 4
#       create
#       postrotate
#         /usr/lib/rsyslog/rsyslog-rotate
#       endscript
#     }

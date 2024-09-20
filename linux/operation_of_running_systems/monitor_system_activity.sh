#!/bin/bash

# MANAGING PROCESSES AND MONITORING SYSTEM ACTIVITY
# kill, pkill, killall, journalctl, /var/log, cron, crontab, at

# Starting, Stopping, and Killing Processes
# kill – Send a Signal to a Process
echo "kill – Send a Signal to a Process"
echo "kill 1234                           # Send SIGTERM (terminate) signal to process with PID 1234"
echo "kill -9 1234                        # Send SIGKILL (force kill) signal to process with PID 1234"

# pkill – Kill Processes by Name
echo "pkill – Kill Processes by Name"
echo "pkill nginx                         # Send SIGTERM signal to all processes named 'nginx'"
echo "pkill -9 httpd                      # Send SIGKILL signal to all processes named 'httpd'"

# killall – Kill All Processes by Name
echo "killall – Kill All Processes by Name"
echo "killall nginx                       # Send SIGTERM signal to all processes named 'nginx'"
echo "killall -9 httpd                    # Send SIGKILL signal to all processes named 'httpd'"


# Checking System Logs
# journalctl – Query and Display Logs from Systemd Journal
echo "journalctl – Query and Display Logs from Systemd Journal"
echo "journalctl                           # Display all systemd journal logs"
echo "journalctl -u nginx                  # Display logs for the nginx service"
echo "journalctl --since \"2024-09-01\"    # Display logs since a specific date"
echo "journalctl --until \"2024-09-01 12:00\" # Display logs until a specific date and time"

# /var/log – System Log Files Directory
echo "/var/log – System Log Files Directory"
echo "ls /var/log                          # List all log files and directories in /var/log"
echo "cat /var/log/syslog                   # View system messages and logs (syslog)"
echo "cat /var/log/auth.log                 # View authentication logs (auth.log)"
echo "less /var/log/messages                # View general system messages (messages) with pagination"


# Understanding and Managing Scheduled Tasks
# cron (crontab) – Scheduled Tasks
echo "cron (crontab) – Scheduled Tasks"
echo "crontab -l                          # List the current user's cron jobs"
echo "crontab -e                          # Edit the current user's cron jobs"
echo "echo '0 5 * * * /path/to/command' | crontab -  # Add a cron job to run a command at 5 AM daily"

# at – Schedule One-Time Tasks
echo "at – Schedule One-Time Tasks"
echo "echo '/path/to/command' | at now + 5 minutes   # Schedule a command to run in 5 minutes"
echo "atq                                      # List all pending at jobs"
echo "atrm 1                                  # Remove the at job with ID 1"


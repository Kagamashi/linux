#!/bin/bash

# Cron is a time-based job scheduler in Unix-like operating systems.
# It allows users to schedule tasks (commands or scripts) to run automatically at specific intervals.

# - on most systems cron logs are written to syslog

# The configuration for cron jobs is stored in "crontab" files, and each user can have their own crontab file.

# Cron jobs syntax in the crontab file follows this pattern:
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 7) (Sunday is 0 or 7)
# │ │ │ │ │
# * * * * * command_to_execute

* * * * * /path/to/command.sh          # Runs the command every minute.
0 0 * * * /path/to/command.sh          # Runs the command daily at 00:00 (midnight).
30 14 * * * /path/to/command.sh        # Runs the command daily at 14:30 (2:30 PM).
0 0 * * 0 /path/to/command.sh          # Runs the command every Sunday at midnight.
*/5 * * * * /path/to/command.sh        # Runs the command every 5 minutes.
0 0 1 * * /path/to/command.sh          # Runs the command on the 1st of every month at midnight.
15 3 * * 1 /path/to/command.sh         # Runs the command every Monday at 03:15.
0 */6 * * * /path/to/command.sh        # Runs the command every 6 hours (at 00:00, 06:00, 12:00, and 18:00).

# * match all possible values (i.e. every hour)
# , match multiple values (i.e. 15,45)
# - range of values (i.e. 2-4)
# / specifies steps (i.e. */4)

# ----------------------
# CRONTAB COMMANDS
# ----------------------
crontab -l                            # Display the current user's cron jobs.
sudo crontab -l # See crontab of ROOT user
crontab -e                            # Edit the current user's crontab (opens in the default text editor).
crontab -r                            # Remove all cron jobs for the current user.
sudo crontab -e -u jane  # See crontab of specified user

# ----------------------
# SPECIAL KEYWORDS
# ----------------------

# Instead of numeric fields, you can use special strings for common scheduling patterns:
@reboot    /path/to/command.sh         # Runs the command at system startup (once at boot).
@daily     /path/to/command.sh         # Runs the command once every day at midnight.
@weekly    /path/to/command.sh         # Runs the command once every week (at midnight on Sunday).
@monthly   /path/to/command.sh         # Runs the command once a month (at midnight on the 1st of the month).
@yearly    /path/to/command.sh         # Runs the command once a year (at midnight on January 1st).

# ----------------------
# EXAMPLES
# ----------------------

# Example 1: Run a backup script every day at 2 AM
0 2 * * * /home/user/backup.sh

# Example 2: Send an email every Monday at 9 AM
0 9 * * 1 echo "Weekly Report" | mail -s "Report" user@example.com

# Example 3: Clear temporary files every day at midnight
0 0 * * * rm -rf /tmp/*

# Example 4: Run a script at 3 AM on the 15th of every month
0 3 15 * * /home/user/midmonth_script.sh

# Example 5: Run a system update every Sunday at 3 AM
0 3 * * 0 apt update && apt upgrade -y

# Example 6: Run a Python script every 10 minutes
*/10 * * * * /usr/bin/python3 /home/user/script.py

# ----------------------
# CRON LOGGING
# ----------------------

# By default, cron does not produce any output unless there is an error. To log output or errors, you can redirect it:
0 2 * * * /home/user/backup.sh >> /home/user/backup.log 2>&1   # Log both output and errors to "backup.log".

# To monitor cron logs, you can check the system log:
tail -f /var/log/syslog                            # On most systems, cron logs are written to "syslog".

# ----------------------
# ENVIRONMENT VARIABLES
# ----------------------

# You can define environment variables in your crontab:
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
MAILTO=user@example.com                            # Email any cron output to this address.
HOME=/home/user                                    # Set the home directory for commands.

# ----------------------
# ANACRON (FOR NON-DAILY TASKS)
# ----------------------

# Anacron is similar to cron but is used for systems that are not running 24/7.
# It ensures that missed jobs are executed when the system is next powered on.

# Configuration file: /etc/anacrontab
# Example format:
# period  delay  job-id  command
1         5      cron.daily  run-parts /etc/cron.daily   # Runs daily jobs with a 5-minute delay after startup.
7         10     cron.weekly run-parts /etc/cron.weekly  # Runs weekly jobs with a 10-minute delay.

# Anacron cannot schedule tasks more frequently than once per day.

# ----------------------
# SYSTEM-WIDE CRON FILES
# ----------------------

# System-wide cron jobs are stored in the following directories:
# /etc/crontab              # System-wide crontab file.
# /etc/cron.daily/          # Scripts to be run daily.
# /etc/cron.weekly/         # Scripts to be run weekly.
# /etc/cron.monthly/        # Scripts to be run monthly.
# /etc/cron.hourly/         # Scripts to be run hourly.

# The syntax of these files follows a similar format as user crontab files.

# ----------------------
# CRONTAB PERMISSIONS
# ----------------------

# Users may be restricted from using cron if their name appears in the "/etc/cron.deny" file.
# Conversely, if a user's name appears in "/etc/cron.allow", they are permitted to use cron, even if they are in "/etc/cron.deny".

# Example: Add user "john" to allow cron usage
echo "john" >> /etc/cron.allow

# ----------------------
# SCHEDULING JOBS WITH 'at'
# ----------------------

# The time can be specified in various formats:
at now + 1 minute                             # Run the job one minute from now.
at now + 2 hours                              # Run the job two hours from now.
at midnight                                   # Run the job at midnight today.
at noon                                       # Run the job at noon today.
at teatime                                    # Run the job at 4 PM today.
at 10:30                                      # Run the job at 10:30 AM today.
at 14:00                                      # Run the job at 2 PM today.

# You can also specify dates:
at 10:30 tomorrow                             # Run the job at 10:30 AM tomorrow.
at 10:30 next Friday                          # Run the job at 10:30 AM on the next Friday.
at 10:30 July 20                              # Run the job at 10:30 AM on July 20 of this year.
at 10:30 2024-12-31                           # Run the job at 10:30 AM on December 31, 2024.

# View scheduled jobs
atq                                          # Lists all pending jobs for the current user.
# Example output:
# 2  Thu Dec 30 10:30:00 2024 a user
# 3  Fri Jul 15 14:00:00 2024 a user

# Remove a scheduled job
atrm <job_number>                            # Remove the job with the specified job number.
atrm 2                                       # Removes job number 2 from the job queue.

# Example 1: Schedule a disk cleanup job to run at midnight
echo "rm -rf /tmp/*" | at midnight

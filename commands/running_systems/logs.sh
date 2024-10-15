#!/bin/bash

# Logs collected inside /var/log directory
grep -r 'ssh' /var/log/ # To find in what files ssh logs are stored
tail -F /var/log/secure # To see new log entries as soon as they appear (debugging)

last # Who logged last into the system
lastlog # Shows all users and last time they loggen in

systemctl status                        # Check the status of a service
journalctl                              # Query the systemd journal (logs)

# journalctl – Query the systemd journal (logs)
journalctl                              # Show all logs
journalctl -u <service_name>            # Show logs for a specific service
journalctl --since "2 hours ago"        # Show logs since a specific time
journalctl -f                           # Follow logs in real time (similar to tail -f)
journalctl --list-boots                 # List all boots and their corresponding log identifiers
journalctl -e # Open journal and go to the end of the output
journalctl -p # Show list of priority options: alert, crit, debug, emerg, err, info, notice, warning
journalctl -p info -g '^b' # g is for grep
journalctl -S 01:00 -U 02:00 # Logs recorded since specified time
journalctl -S '2024-10-10 10:10:55' # Logs recorded on specific date and time
journalctl -b 0 # Logs from current boot
journalctl -b 1 # Logs from previous boot

which sudo
journalctl /bin/sudo # View logs of specific command

#############

tail -f /var/log/syslog                 # Monitor logs in real time
grep                                      # Search logs or files for errors and issues

# tail -f – Monitor logs in real time
tail -f /var/log/syslog                  # Continuously display new log entries in syslog
tail -f /var/log/syslog | grep error      # Monitor syslog for lines containing "error"

# grep – Search logs or files for errors and issues
grep "error" /var/log/syslog             # Search for the term "error" in syslog
grep -i "warning" /var/log/syslog         # Search for "warning" (case insensitive)
grep -r "fatal" /path/to/directory        # Recursively search for "fatal" in files in a directory
grep -n "timeout" filename.txt            # Search for "timeout" and show line numbers

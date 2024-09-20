#!/bin/bash

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

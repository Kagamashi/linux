
# usually log files are stored in /var/log
# rsyslog is a daemon that permit logging of data from different types of systems in a central repository
#   * /etc/rsyslog.conf configuration file of rsyslog
#   * systemctl status rsyslog check execution status of rsyslog

grep -r 'ssh' /var/log/                   # to find in what files ssh logs are stored
grep "error" /var/log/syslog              # search for the term "error" in syslog
grep -i "warning" /var/log/syslog         # search for "warning" (case insensitive)
grep -r "fatal" /path/to/directory        # recursively search for "fatal" in files in a directory
grep -n "timeout" filename.txt            # search for "timeout" and show line numbers

last        # who logged last into the system
lastlog     # shows all users and last time they logged in

systemctl status                        # check the status of a service

journalctl                              # show all logs
journalctl -u <service_name>            # show logs for a specific service
journalctl --since "2 hours ago"        # show logs since a specific time
journalctl -f                           # follow logs in real time (similar to tail -f)
journalctl --list-boots                 # list all boots and their corresponding log identifiers
journalctl -e                           # open journal and go to the end of the output
journalctl -p                           # show list of priority options: alert, crit, debug, emerg, err, info, notice, warning
journalctl -p info -g '^b'              # g is for grep
journalctl -S 01:00 -U 02:00            # logs recorded since specified time
journalctl -S '2024-10-10 10:10:55'     # logs recorded on specific date and time
journalctl -b 0                         # logs from current boot
journalctl -b 1                         # logs from previous boot

tail -f /var/log/syslog                  # display log entries in real time
tail -f /var/log/syslog | grep error     # monitor syslog for lines containing "error"

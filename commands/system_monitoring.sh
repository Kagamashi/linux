
dmesg                                   # print or control the kernel ring buffer
journalctl                              # query and display logs from systemd
uptime                                  # tell how long the system has been running
vmstat                                  # report virtual memory statistics
iostat                                  # report I/O statistics

dmesg                                   # display the kernel ring buffer messages
dmesg | less                            # view dmesg output in a paginated format
dmesg --follow                          # continuously display new kernel messages

journalctl                              # show all logs from systemd journal
journalctl -u <service_name>            # show logs for a specific service
journalctl --since "1 hour ago"         # show logs from the last hour
journalctl -f                           # follow new log messages in real time

uptime                                  # display how long the system has been running, users, and load averages

vmstat                                  # display memory, processes, paging, block I/O, traps, and CPU activity
vmstat 5                                # report statistics every 5 seconds

iostat                                  # display CPU and I/O statistics
iostat -x 1                             # continuously report extended I/O statistics every second


dmesg                                   # Print or control the kernel ring buffer
journalctl                              # Query and display logs from systemd
uptime                                   # Tell how long the system has been running
vmstat                                   # Report virtual memory statistics
iostat                                   # Report I/O statistics

dmesg                                   # Display the kernel ring buffer messages
dmesg | less                            # View dmesg output in a paginated format
dmesg --follow                          # Continuously display new kernel messages

journalctl                              # Show all logs from systemd journal
journalctl -u <service_name>            # Show logs for a specific service
journalctl --since "1 hour ago"         # Show logs from the last hour
journalctl -f                           # Follow new log messages in real time

uptime                                   # Display how long the system has been running, users, and load averages

vmstat                                   # Display memory, processes, paging, block I/O, traps, and CPU activity
vmstat 5                                 # Report statistics every 5 seconds

iostat                                   # Display CPU and I/O statistics
iostat -x 1                              # Continuously report extended I/O statistics every second

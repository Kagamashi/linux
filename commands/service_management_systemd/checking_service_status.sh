#!/bin/bash

systemctl status                        # Check the status of a service
journalctl                              # Query the systemd journal (logs)

# systemctl status – Check the status of a service
systemctl status <service_name>        # Show the status of a specific service
systemctl status --no-pager <service_name> # Show status without paging

# journalctl – Query the systemd journal (logs)
journalctl                              # Show all logs
journalctl -u <service_name>            # Show logs for a specific service
journalctl --since "2 hours ago"        # Show logs since a specific time
journalctl -f                           # Follow logs in real time (similar to tail -f)
journalctl --list-boots                 # List all boots and their corresponding log identifiers

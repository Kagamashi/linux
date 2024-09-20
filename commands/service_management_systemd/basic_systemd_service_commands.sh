#!/bin/bash

systemctl                                 # Control the systemd system and service manager
systemctl start                           # Start a service
systemctl stop                            # Stop a service
systemctl restart                         # Restart a service
systemctl enable                          # Enable a service to start at boot
systemctl disable                         # Disable a service from starting at boot

# systemctl – Control the systemd system and service manager
systemctl status <service_name>          # Show the status of a specific service
systemctl list-units --type=service      # List all loaded services
systemctl is-active <service_name>       # Check if a specific service is active
systemctl is-enabled <service_name>      # Check if a service is enabled to start at boot

# Starting, stopping, and managing services
systemctl start <service_name>           # Start a specific service
systemctl stop <service_name>            # Stop a specific service
systemctl restart <service_name>         # Restart a specific service
systemctl enable <service_name>          # Enable a service to start at boot
systemctl disable <service_name>         # Disable a service from starting at boot

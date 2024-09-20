#!/bin/bash
systemctl reboot
shutdown
systemctl rescue

# systemctl reboot – Reboot the system
systemctl reboot                       # Reboot the system immediately
systemctl reboot --force               # Force a reboot without waiting for services to stop

# shutdown – Halt, power-off, or reboot the machine
shutdown now                           # Power off the machine immediately
shutdown -h now                        # Halt the machine immediately
shutdown -r now                        # Reboot the machine immediately
shutdown +5                            # Schedule a shutdown in 5 minutes
shutdown -c                            # Cancel a scheduled shutdown

# systemctl rescue – Enter rescue mode
systemctl rescue                       # Enter rescue mode (single-user mode)

#!/bin/bash
systemctl reboot
shutdown
systemctl rescue

# systemctl reboot – Reboot the system
systemctl reboot                       # Reboot the system immediately
systemctl reboot --force               # Force a reboot without waiting for services to stop
systemctl poweroff # Shutdown
systemctl poweroff --force


# shutdown – Halt, power-off, or reboot the machine
shutdown now                           # Power off the machine immediately
shutdown -h now                        # Halt the machine immediately
shutdown -r now                        # Reboot the machine immediately
shutdown +5                            # Schedule a shutdown in 5 minutes
shutdown -c                            # Cancel a scheduled shutdown
shutdown 02:00 # Shutdown at 2am
shutdown -r +15 # Reboot in 15 minutes
shutdown -r +1 'Scheduled restart to do an offline-backup of our database' # Wall message - this message will be shown to users when machine is going to be rebooted.


# systemctl rescue – Enter rescue mode
systemctl rescue                       # Enter rescue mode (single-user mode)

systemctl isolate graphucal.target # Change to graphical mode without changing the default value
systemctl isolate emergency.target # Load up as few programs as possible
systemctl isolate rescue.target # Few essentials services are going to be loaded and you are dropped into a root shell (create db backup, fix system settings..)


systemctl get-default
systemctl set-default multi-user.target

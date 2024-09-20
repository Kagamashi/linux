#!/bin/bash

# MANAGING STARTUP PROCESSES
# systemctl, service, chkconfig, update-rc.d, runlevel

# systemd – Modern Init System and Service Manager
# SysVinit – Traditional Init System

# systemctl – Service Manager for systemd
echo "systemctl – Service Manager for systemd"
echo "systemctl list-units --type=service        # List all active services and their status"
echo "systemctl status nginx                    # Show the status of the nginx service"
echo "systemctl start nginx                     # Start the nginx service"
echo "systemctl stop nginx                      # Stop the nginx service"
echo "systemctl restart nginx                   # Restart the nginx service"
echo "systemctl enable nginx                    # Enable the nginx service to start on boot"
echo "systemctl disable nginx                   # Disable the nginx service from starting on boot"
echo "systemctl list-dependencies multi-user.target # List dependencies of multi-user target"

# service – Service Manager for SysVinit (also works with systemd)
echo "service – Service Manager for SysVinit"
echo "service nginx status                     # Show the status of the nginx service"
echo "service --status-all                     # List the status of all SysVinit services (Debian/Ubuntu)"
echo "service nginx start                      # Start the nginx service"
echo "service nginx stop                       # Stop the nginx service"
echo "service nginx restart                    # Restart the nginx service"

# chkconfig – Manage System Services (SysVinit) (RHEL/CentOS)
echo "chkconfig – Manage System Services (SysVinit)"
echo "chkconfig --list                          # List all services and their runlevel settings"
echo "chkconfig httpd on                        # Enable httpd service at boot"
echo "chkconfig httpd off                       # Disable httpd service at boot"

# update-rc.d – Manage SysVinit Services (Debian/Ubuntu)
echo "update-rc.d – Manage SysVinit Services"
echo "update-rc.d nginx defaults                # Add nginx to the default runlevels"
echo "update-rc.d nginx remove                  # Remove nginx from the default runlevels"

# runlevel – Display Current Runlevel (SysVinit)
echo "runlevel – Display Current Runlevel"
echo "runlevel                                 # Display the current runlevel"

# systemctl get-default – Get Default Systemd Target
echo "systemctl get-default – Get Default Systemd Target"
echo "systemctl get-default                    # Show the default systemd target (runlevel)"

# systemctl set-default – Set Default Systemd Target
echo "systemctl set-default – Set Default Systemd Target"
echo "systemctl set-default multi-user.target # Set the default systemd target to multi-user"
echo "systemctl set-default graphical.target   # Set the default systemd target to graphical (GUI)"


# SERVICE in Linux is a program or daemon (background process) that runs in the background 
# to perform essential tasks like serving web pages, handling logins, etc.
# Services are typically managed by the init system, such as `systemd`, `SysVinit`, or `upstart`.

# Managing Services with systemd
# systemd is the most common init system used in modern Linux distributions (e.g., Ubuntu, Fedora).

systemctl                                 # Control the systemd system and service manager

# systemctl – Control the systemd system and service manager
systemctl status <service_name>          # Show the status of a specific service
systemctl list-units --type=service      # List all loaded services
systemctl is-active <service_name>       # Check if a specific service is active
systemctl is-enabled <service_name>      # Check if a service is enabled to start at boot

# LIFECYCLE
systemctl start <service_name>           # Start a specific service
systemctl stop <service_name>            # Stop a specific service
systemctl restart <service_name>         # Restart a specific service so it pick ups new settings (may interrupt other users)
systemctl reload <service_name>  # Restart but more gentle (no interruptions)
systemctl reload-or-restart <service_name> # Reaload and restart if reload is not supported by the app
systemctl enable <service_name>          # Enable a service to start at boot
systemctl is-enabled <service_name> # Checks if service is enabled
systemctl disable <service_name>         # Disable a service from starting at boot
systemctl mask <service> # Masked services cannot be enabled or started o
systemctl unmask <service>

# Useful systemctl Options:
# --now: Applies enable/disable actions immediately without requiring a reboot.

systemctl cat sshd.service #Shows informations about ssh daemon: ExecStart, ExecReload, Restart 
systemctl edit --full sshd.service #Edit service
systemctl revert sshd.service #Revert changes of service edit





# A unit file is a plain text that encodes information about a service, a socket, a device, amount point… etc.
# https://www.freedesktop.org/software/systemd/man/systemd.unit.html

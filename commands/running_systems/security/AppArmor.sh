#!/bin/bash

# AppArmor is another MAC (Mandatory Access Control) security module that restricts the actions of processes based on profiles.
# Profiles can be created for specific applications to define what they can access (files, network, etc.).

# Check if AppArmor is enabled
sudo aa-status                                 # Shows current status of AppArmor, including loaded profiles.

# AppArmor Modes:
# - **Enforcing**: The profiles are enforced, and violations are blocked.
# - **Complain**: Profiles are not enforced, but violations are logged for review (useful for testing).
# - **Disabled**: AppArmor is turned off for a specific profile.

# Enforce a profile
sudo aa-enforce /etc/apparmor.d/usr.bin.nginx  # Enforce the AppArmor profile for Nginx.

# Put a profile in complain mode
sudo aa-complain /etc/apparmor.d/usr.bin.nginx # Set Nginx profile to complain mode (logs violations, doesn't block).

# Create or Edit AppArmor Profiles
# AppArmor profiles are stored in `/etc/apparmor.d/`. Each file corresponds to a program and contains its security rules.
sudo nano /etc/apparmor.d/usr.bin.nginx        # Edit the AppArmor profile for Nginx.

# Reload AppArmor Profiles
sudo apparmor_parser -r /etc/apparmor.d/usr.bin.nginx   # Reload a specific profile after making changes.

# Enable or Disable AppArmor
sudo systemctl start apparmor                  # Enable and start AppArmor.
sudo systemctl stop apparmor                   # Stop and disable AppArmor.

# View Logs
# Violations or alerts from AppArmor are logged for auditing.
dmesg | grep -i apparmor                       # View AppArmor messages in the system logs.

# Example of a basic AppArmor Profile (for `/usr/bin/nginx`):
# The profile defines file access, network access, and other permissions.
# /etc/apparmor.d/usr.bin.nginx
/usr/bin/nginx {
  # Include the standard abstractions
  # Deny access to files and resources outside allowed areas
  deny /etc/shadow r,
  deny /etc/passwd r,
  
  # Allow network access
  network inet tcp,
  network inet udp,
}

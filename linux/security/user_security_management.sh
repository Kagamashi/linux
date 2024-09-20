#!/bin/bash

# USER SECURITY MANAGEMENT
# sudo, SSH


# Using sudo for Privilege Management
# Overview: sudo allows a permitted user to execute commands as the superuser or another user, as specified by the security policy.

# Check if a user is in the sudoers file
sudo -l                             # List the user's sudo privileges

# Edit the sudoers file
# Use visudo to safely edit the sudoers file to avoid syntax errors
visudo                               # Open the sudoers file in a safe editor

# Example sudoers file entries
# Grant sudo access to a user
# user_name ALL=(ALL) ALL              # User can execute any command as any user on any host

# Grant sudo access to a group
# %group_name ALL=(ALL) ALL           # Members of group_name can execute any command as any user on any host

# Allow a user to run specific commands without a password
# user_name ALL=(ALL) NOPASSWD: /usr/bin/command # User can run /usr/bin/command without being prompted for a password

# Check the sudoers file syntax for errors
visudo -c                            # Check the sudoers file for syntax errors

# Example of using sudo to execute a command
sudo <command>                       # Replace <command> with the command you want to run with elevated privileges (e.g., sudo apt update)

# Example of running a command as a different user
sudo -u <username> <command>         # Run a command as a different user (e.g., sudo -u postgres psql)

# Example of adding a user to the sudo group (on Debian-based systems)
usermod -aG sudo <username>         # Add <username> to the sudo group to grant sudo access

# Example of removing a user from the sudo group (on Debian-based systems)
deluser <username> sudo             # Remove <username> from the sudo group to revoke sudo access

# Example of adding a user to the wheel group (on RPM-based systems)
usermod -aG wheel <username>        # Add <username> to the wheel group to grant sudo access on RPM-based systems

# Example of removing a user from the wheel group (on RPM-based systems)
gpasswd -d <username> wheel         # Remove <username> from the wheel group to revoke sudo access on RPM-based systems



# Configuring SSH for Secure Access
# Overview: Secure Shell (SSH) is a protocol for secure remote login and other secure network services.

# Edit the SSH configuration file
# Configuration file: /etc/ssh/sshd_config

# Disable root login over SSH
# Edit the /etc/ssh/sshd_config file and set:
# PermitRootLogin no

# Disable password authentication and use key-based authentication
# Edit the /etc/ssh/sshd_config file and set:
# PasswordAuthentication no

# Allow only specific users to access via SSH
# Edit the /etc/ssh/sshd_config file and add:
# AllowUsers user1 user2

# Restart SSH service to apply changes
systemctl restart sshd              # Restart SSH service to apply configuration changes

# Generate SSH key pair for key-based authentication
ssh-keygen -t rsa -b 4096 -C "<email>"   # Generate a new SSH key pair (replace <email> with your email address)

# Copy the SSH public key to a remote server
ssh-copy-id user@remote_host         # Copy the SSH public key to the remote host (replace user and remote_host with appropriate values)

# Test SSH connection
ssh user@remote_host                 # Test SSH connection to ensure everything is set up correctly

#!/bin/bash

# ----------------------
# Enabling and Configuring Disk Quotas
# ----------------------

# Install quota package (if not already installed)
sudo apt install quota -y                # Ubuntu/Debian
sudo yum install quota -y                # CentOS/RHEL

# Enable quotas on a specific filesystem via /etc/fstab
echo "/dev/sda1 / ext4 defaults,usrquota,grpquota 0 1" | sudo tee -a /etc/fstab  # Enable user and group quotas for ext4 filesystem.

# Remount the filesystem to apply changes
sudo mount -o remount /                  # Remount the root filesystem (or any other with quotas enabled).

# Initialize the quota files
sudo quotacheck -cug /                   # Create and check quota files for user and group quotas on the root filesystem.

# Turn quotas on
sudo quotaon /                           # Enable quotas on the root filesystem (or any other specified filesystem).

# ----------------------
# Set and Manage Quotas for Users and Groups
# ----------------------

# Set quotas for a specific user (using edquota)
sudo edquota username                    # Edit quota for 'username' (opens a text editor).

# Set quotas for a specific group (using edquota)
sudo edquota -g groupname                # Edit quota for 'groupname' (opens a text editor).

# ----------------------
# Viewing and Managing Quotas
# ----------------------

# Check user quota usage
quota -u username                        # Display quota usage for 'username'.

# Check group quota usage
quota -g groupname                       # Display quota usage for 'groupname'.

# View quota report for all users
sudo repquota /                          # Report quota usage for users and groups on the root filesystem.

# Turn quotas off
sudo quotaoff /                          # Disable quotas on the root filesystem.


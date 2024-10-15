#!/bin/bash

# SELinux is a security architecture for Linux that allows administrators to define fine-grained access controls.
# It enforces security policies that restrict what a process can access and execute, beyond traditional file permissions.

# Check if SELinux is enabled
getenforce                                     # Displays whether SELinux is enforcing, permissive, or disabled.

# Set SELinux mode
sudo setenforce 0                              # Set SELinux to "permissive" mode (logs violations but doesn’t enforce rules).
sudo setenforce 1                              # Set SELinux to "enforcing" mode (actively enforces policies).

# Check SELinux status and mode
sestatus                                       # Provides detailed status of SELinux (enabled/disabled, enforcing/permissive, etc.).

# Modes of SELinux:
# - **Enforcing**: SELinux actively enforces policies and denies access when rules are violated.
# - **Permissive**: SELinux logs policy violations but does not enforce rules (useful for testing).
# - **Disabled**: SELinux is completely turned off.

# SELinux Contexts
# SELinux labels (or "contexts") are applied to files, processes, and ports to enforce policies.
# - A context has fields: `user:role:type:level`.
ls -Z                                          # Display the SELinux context (labels) of files and directories.
ps -eZ                                         # Display the SELinux context of running processes.

# Change SELinux Context
# You can change SELinux labels using the `chcon` command (only temporary, use policies for permanent changes).
sudo chcon -t httpd_sys_content_t /var/www/html/file.html   # Change the SELinux type context for a file.

# Managing SELinux Policies
# SELinux policies define the security rules enforced by SELinux, dictating what actions are allowed.
# - Targeted policies: Only a subset of processes are confined.
# - MLS policies: Multi-Level Security policies offer very strict control.

# List all SELinux booleans (features you can toggle on/off)
getsebool -a                                   # Lists all SELinux booleans and their current state.
sudo setsebool httpd_enable_homedirs on        # Enable a specific boolean for allowing HTTPD to serve home directories.

#!/bin/bash

# MANAGING SECURITY SETTINGS
# ufw, setenforce, getenforce, AppArmor, auditd, /var/log/audit


# Configuring Basic Security Measures
# UFW – Uncomplicated Firewall
# Overview: UFW is a user-friendly front-end for managing firewall rules.
# Start and enable UFW service
systemctl start ufw                 # Start the UFW service
systemctl enable ufw                # Enable UFW to start on boot

# Allow and deny services using UFW
ufw allow <port_number>             # Allow traffic on a specific port (e.g., ufw allow 22 for SSH)
ufw deny <port_number>              # Deny traffic on a specific port (e.g., ufw deny 80 for HTTP)

# Check UFW status and rules
ufw status                           # Show UFW status and rules

# SELinux – Security-Enhanced Linux
# Overview: SELinux is a security module for Linux that enforces access control policies.
# Check SELinux status
getenforce                           # Display the current mode of SELinux (Enforcing, Permissive, or Disabled)

# Set SELinux mode
setenforce <mode>                    # Set SELinux mode (e.g., setenforce 1 for Enforcing or setenforce 0 for Permissive)

# Check SELinux configuration
sestatus                             # Display detailed SELinux status and configuration

# AppArmor – Mandatory access control framework
# Overview: AppArmor is a Linux kernel security module that provides access control.
# Check AppArmor status
aa-status                            # Show the status of AppArmor profiles and their modes

# Enable or disable AppArmor profiles
aa-enforce <profile_name>            # Enforce a specific AppArmor profile
aa-complain <profile_name>           # Put a specific AppArmor profile into complain mode


# Auditing and Analyzing System Logs
# auditd – User-space component to manage and collect audit logs
# Overview: auditd is the audit daemon responsible for writing audit records to disk.
# Start and enable auditd service
systemctl start auditd               # Start the auditd service
systemctl enable auditd              # Enable auditd to start on boot

# Check auditd status
systemctl status auditd              # Show the current status of auditd service

# Analyze audit logs
# Logs are typically located in /var/log/audit/
# Example commands:
grep <search_term> /var/log/audit/audit.log   # Search audit logs for specific terms
ausearch -m <message_type>                  # Search audit logs for specific message types (e.g., ausearch -m AVC for access control violations)

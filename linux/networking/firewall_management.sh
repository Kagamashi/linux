#!/bin/bash

# FIREWALL MANAGEMENT
# iptables, nftables, firewall-cmd


# Configuring Firewalls with iptables
# iptables – User-space utility for configuring Linux kernel firewall
# View current iptables rules
iptables -L                            # List all current rules
iptables -L -v -n                      # List rules with verbose output and numeric addresses

# Add a rule to allow incoming SSH traffic
iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # Allow incoming SSH connections

# Add a rule to drop all incoming traffic except SSH
iptables -P INPUT DROP                 # Set default policy to DROP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # Allow incoming SSH connections

# Save iptables rules
iptables-save > /etc/iptables/rules.v4 # Save current rules to file


# Configuring Firewalls with nftables
# nftables – Modern firewall tool that replaces iptables
# List current nftables rules
nft list ruleset                       # Show all current nftables rules

# Create a table and chain in nftables
nft add table ip filter                # Create a new table 'filter' in the 'ip' family
nft add chain ip filter input { type filter hook input priority 0; }  # Add a new chain to the 'filter' table

# Add a rule to allow incoming SSH traffic
nft add rule ip filter input tcp dport 22 accept  # Allow incoming SSH connections

# Save nftables rules
nft list ruleset > /etc/nftables.conf # Save current rules to file


# Managing firewalld with firewall-cmd
# firewalld – A dynamic firewall manager for Linux
# Check the status of firewalld
firewall-cmd --state                   # Check if firewalld is running

# List all active zones
firewall-cmd --get-active-zones        # List active zones

# Add a rule to allow incoming SSH traffic in the public zone
firewall-cmd --zone=public --add-service=ssh --permanent  # Allow SSH connections permanently
firewall-cmd --reload                   # Reload firewall configuration to apply changes

# List all rules in the public zone
firewall-cmd --zone=public --list-all   # Show all rules in the public zone

# Remove a rule to deny incoming SSH traffic
firewall-cmd --zone=public --remove-service=ssh --permanent # Remove SSH rule permanently
firewall-cmd --reload                   # Reload firewall configuration to apply changes

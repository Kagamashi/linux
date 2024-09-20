#!/bin/bash

# TROUBLESHOOTING BOOT AND SYSTEM ISSUES
# single-user mode, rescue mode, journalctl, ping, traceroute, netstat, tcpdump


# Recovering from Boot Failures
# Single-User Mode
# Single-user mode is used for troubleshooting system issues. It boots into a minimal environment with root access.
# To enter single-user mode, you typically need to modify the bootloader configuration during startup.
# GRUB example: At the GRUB menu, press 'e' to edit the boot entry, add 'single' to the end of the kernel line, and press 'Ctrl-x' to boot.

# Rescue Mode
# Rescue mode provides a minimal environment to recover from system failures.
# To enter rescue mode, boot from a live CD or rescue media and select the rescue option.
# Alternatively, if using GRUB, you can append 'rescue' to the kernel line at the GRUB menu.


# Using System Logs and journalctl for Troubleshooting
# journalctl – Query and display logs from the journal
# View the entire system journal
journalctl                           # Display the entire system log

# View logs for a specific boot
journalctl -b                        # Show logs from the current boot
journalctl -b -1                     # Show logs from the previous boot

# Filter logs by a specific service
journalctl -u <service_name>         # Show logs for a specific service (e.g., journalctl -u sshd)

# View logs with a specific priority level (e.g., errors)
journalctl -p err                    # Show only logs with error priority


# Debugging Network Issues
# ping – Check the connectivity to a remote host
# Replace <host> with the target hostname or IP address
ping <host>                          # Send ICMP echo requests to <host> to check connectivity

# traceroute – Trace the path packets take to a remote host
# Replace <host> with the target hostname or IP address
traceroute <host>                    # Show the route taken by packets to <host>

# netstat – Network statistics
# Show all network connections and listening ports
netstat -tuln                        # Display active TCP/UDP connections and listening ports

# Show network interfaces and their status
netstat -i                           # Display network interface statistics

# tcpdump – Network packet analyzer
# Capture packets on a specific network interface
# Replace <interface> with the network interface to monitor (e.g., eth0)
tcpdump -i <interface>               # Capture packets on <interface>
tcpdump -i <interface> -n            # Capture packets and display IP addresses in numeric format

# Capture packets matching specific criteria
# Example: Capture HTTP traffic
tcpdump -i <interface> port 80       # Capture traffic on port 80 (HTTP)

#!/bin/bash

nmcli                                   # Command-line client for NetworkManager
nmtui                                   # Text user interface for NetworkManager
iwconfig                                # Configure wireless network interfaces
iptables                                # Administer IP packet filter rules

# nmcli – Command-line client for NetworkManager
nmcli device show                       # Show detailed information about all network devices
nmcli connection show                   # List all connections managed by NetworkManager
nmcli connection up <connection_name>   # Bring a connection up
nmcli connection down <connection_name> # Bring a connection down

# nmtui – Text user interface for NetworkManager
# To use nmtui, simply run the command:
# nmtui

# iwconfig – Configure wireless network interfaces
iwconfig                                # Show wireless interface configurations
iwconfig wlan0 essid "MyNetwork"        # Connect to a specific wireless network
iwconfig wlan0 key s:password           # Connect with a WEP key

# iptables – Administer IP packet filter rules
iptables -L                             # List all current iptables rules
iptables -A INPUT -s 192.168.1.100 -j ACCEPT  # Allow incoming traffic from a specific IP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # Allow incoming SSH connections
iptables -F                             # Flush all rules (use with caution)

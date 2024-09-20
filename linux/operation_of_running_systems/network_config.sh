#!/bin/bash

# NETWORK CONFIGURATION AND TROUBLESHOOTING
# ip addr, ifconfig, nmcli, nmtui, nslookup, dig, ping, traceroute, netstat, ss, ip route, route


# IP Configuration
# ip addr – Display IP Addresses and Network Interfaces
echo "ip addr – Display IP Addresses and Network Interfaces"
echo "ip addr show                          # Show all IP addresses and network interfaces"
echo "ip addr show eth0                     # Show IP addresses for the eth0 interface"
echo "ip addr add 192.168.1.100/24 dev eth0 # Add an IP address to the eth0 interface"
echo "ip addr del 192.168.1.100/24 dev eth0 # Remove an IP address from the eth0 interface"

# ifconfig – Configure Network Interfaces (Legacy)
echo "ifconfig – Configure Network Interfaces (Legacy)"
echo "ifconfig                               # Display network interfaces and their IP addresses"
echo "ifconfig eth0 192.168.1.100 netmask 255.255.255.0 # Assign IP address and netmask to eth0"
echo "ifconfig eth0 down                     # Disable the eth0 interface"
echo "ifconfig eth0 up                       # Enable the eth0 interface"

# nmcli – NetworkManager Command-Line Interface
echo "nmcli – NetworkManager Command-Line Interface"
echo "nmcli device status                   # Show the status of all network devices"
echo "nmcli connection show                 # Show all network connections"
echo "nmcli connection up id <connection_name> # Bring up a network connection by name"
echo "nmcli connection down id <connection_name> # Bring down a network connection by name"

# nmtui – NetworkManager Text User Interface
echo "nmtui – NetworkManager Text User Interface"
echo "nmtui                                  # Open the text-based NetworkManager interface"
echo "Use nmtui to manage connections, set IP addresses, and configure network settings"


# DNS Resolution
# nslookup – Query Internet Name Servers Interactively
echo "nslookup – Query Internet Name Servers Interactively"
echo "nslookup example.com                   # Look up the IP address of example.com"
echo "nslookup 8.8.8.8                       # Reverse lookup of IP address 8.8.8.8"
echo "nslookup -type=MX example.com          # Query mail exchange records for example.com"

# dig – DNS Lookup
echo "dig – DNS Lookup"
echo "dig example.com                        # Query DNS for A record of example.com"
echo "dig +short example.com                 # Short format output for A record of example.com"
echo "dig @8.8.8.8 example.com               # Query DNS server 8.8.8.8 for example.com"
echo "dig example.com ANY                    # Query all available DNS records for example.com"


# Troubleshooting
# ping – Check Network Connectivity
echo "ping – Check Network Connectivity"
echo "ping example.com                      # Send ICMP ECHO_REQUEST packets to example.com"
echo "ping -c 4 192.168.1.1                # Send 4 packets to IP address 192.168.1.1"

# traceroute – Trace Route to Network Host
echo "traceroute – Trace Route to Network Host"
echo "traceroute example.com                 # Trace the route to example.com"
echo "traceroute -n 192.168.1.1             # Trace route to IP address 192.168.1.1 (numeric output)"

# netstat – Network Statistics (Legacy)
echo "netstat – Network Statistics (Legacy)"
echo "netstat -tuln                          # Show listening ports and associated addresses (TCP/UDP)"
echo "netstat -a                             # Show all network connections and listening ports"
echo "netstat -rn                            # Show the routing table"

# ss – Utility to Investigate Sockets
echo "ss – Utility to Investigate Sockets"
echo "ss -tuln                             # Show all listening TCP and UDP sockets"
echo "ss -s                                 # Show summary statistics of network sockets"
echo "ss -p                                # Show processes using network sockets"

# ip route – Show or Manipulate the IP Routing Table
echo "ip route – Show or Manipulate the IP Routing Table"
echo "ip route show                         # Display the IP routing table"
echo "ip route add default via 192.168.1.1  # Add a default route via 192.168.1.1"
echo "ip route del default via 192.168.1.1  # Remove a default route via 192.168.1.1"

# route – Show or Modify the IP Routing Table (Legacy)
echo "route – Show or Modify the IP Routing Table (Legacy)"
echo "route -n                              # Display the IP routing table"
echo "route add default gw 192.168.1.1      # Add a default gateway"
echo "route del default gw 192.168.1.1      # Remove a default gateway"


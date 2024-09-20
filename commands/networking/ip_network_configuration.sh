#!/bin/bash

ip                                       # Show/manipulate routing, devices, policy routing, and tunnels
ifconfig                                 # Configure a network interface (deprecated by ip)
ping                                     # Send ICMP ECHO_REQUEST to network hosts
traceroute                               # Print the route packets take to the network host
netstat                                  # Network statistics
ss                                       # Utility to investigate sockets
ethtool                                  # Query or control network driver and hardware settings

# ip – Show/manipulate routing, devices, policy routing, and tunnels
ip addr                                  # Show all network interfaces and their addresses
ip link                                  # Show all network interfaces
ip route                                 # Show the routing table
ip addr add 192.168.1.10/24 dev eth0     # Add an IP address to an interface
ip link set eth0 up                      # Bring up the network interface

# ifconfig – Configure a network interface (deprecated)
ifconfig                                 # Show all network interfaces and their configurations
ifconfig eth0 192.168.1.10 netmask 255.255.255.0 # Assign an IP address to eth0

# ping – Send ICMP ECHO_REQUEST to network hosts
ping example.com                         # Send ICMP echo requests to example.com
ping -c 4 192.168.1.1                    # Send 4 pings to a specific IP address

# traceroute – Print the route packets take to the network host
traceroute example.com                   # Trace the route to example.com
traceroute -n 192.168.1.1                 # Trace the route without resolving hostnames

# netstat – Network statistics
netstat -tuln                            # Show listening ports and associated addresses
netstat -i                               # Show network interface statistics

# ss – Utility to investigate sockets
ss -tuln                                 # Show TCP and UDP listening sockets
ss -s                                    # Show summary statistics

# ethtool – Query or control network driver and hardware settings
ethtool eth0                             # Display information about the eth0 interface
ethtool -s eth0 speed 1000 duplex full   # Set the speed and duplex mode for eth0

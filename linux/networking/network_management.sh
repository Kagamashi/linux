#!/bin/bash

# BASIC IP CONFIGURATION AND SERVICES
# ifconfig, ip, dhclient, nmcli, /etc/network/interfaces, /etc/sysconfig/network-scripts/, hostnamectl, /etc/hosts


# Configuring Static and Dynamic IP Addresses
# ifconfig – Configure Network Interfaces (deprecated, use 'ip' instead)
ifconfig eth0 192.168.1.10 netmask 255.255.255.0 up   # Assign static IP to eth0

# ip – Modern tool for managing network interfaces
ip addr add 192.168.1.10/24 dev eth0                  # Assign static IP to eth0
ip link set dev eth0 up                              # Bring interface up
ip addr show eth0                                   # Show IP address configuration for eth0

# dhclient – Obtain IP Address via DHCP
dhclient eth0                                      # Request a dynamic IP address from a DHCP server

# nmcli – Network Manager Command Line Interface
nmcli con mod "System eth0" ipv4.addresses 192.168.1.10/24 # Set static IP for a connection
nmcli con up "System eth0"                          # Apply the changes and bring the connection up
nmcli d show eth0                                  # Show detailed information about the eth0 interface


# Managing Network Interfaces and Connections
# /etc/network/interfaces – Configuration file for network interfaces (Debian/Ubuntu)
# Example entry for static IP:
# auto eth0
# iface eth0 inet static
#     address 192.168.1.10
#     netmask 255.255.255.0
#     gateway 192.168.1.1

# /etc/sysconfig/network-scripts/ – Directory for network scripts (RedHat/CentOS)
# Example configuration file: ifcfg-eth0
# DEVICE=eth0
# BOOTPROTO=static
# IPADDR=192.168.1.10
# NETMASK=255.255.255.0
# ONBOOT=yes


# Managing Hostname
# hostnamectl – Command to query and change the system hostname
hostnamectl set-hostname my-new-hostname  # Set the system hostname to 'my-new-hostname'
hostnamectl status                         # Display the current hostname and other related settings

# /etc/hosts – Static table of hostnames and IP addresses
# Example entry:
# 127.0.0.1       localhost
# 192.168.1.10    my-hostname

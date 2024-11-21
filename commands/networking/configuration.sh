#!/bin/bash

# ----------------------
# IPv4 and IPv6 Addresses
# ----------------------

ip addr show                 # Display network interface addresses (IPv4/IPv6).
ip -4 addr show              # Display only IPv4 addresses.
ip -6 addr show              # Display only IPv6 addresses.

ip addr add 192.168.1.100/24 dev eth0   # Add an IPv4 address to an interface.
ip addr add 2001:db8::1/64 dev eth0     # Add an IPv6 address to an interface.

ip addr del 192.168.1.100/24 dev eth0   # Remove an IPv4 address from an interface.
ip addr del 2001:db8::1/64 dev eth0     # Remove an IPv6 address from an interface.

# ----------------------
# Network Masks, Gateways, DNS
# ----------------------

ip route show                # Show the routing table, including default gateway.
ip route add default via 192.168.1.1   # Add a default gateway (IPv4).
ip -6 route add default via 2001:db8::1 # Add a default gateway (IPv6).

cat /etc/resolv.conf         # Display DNS servers.
echo "nameserver 8.8.8.8" >> /etc/resolv.conf   # Add a DNS server (Google DNS).
resolvectl status            # Show DNS configuration with resolvectl.

# ----------------------
# Configuring Network Interfaces
# ----------------------

ifconfig                     # Show network interfaces (deprecated).
ip addr                      # Display network interfaces and addresses.
nmcli                        # NetworkManager CLI for managing connections.
nmtui                        # Text-based user interface for NetworkManager.

# Configure network interface (e.g., eth0) with static IP using nmcli
nmcli connection modify eth0 ipv4.method manual ipv4.addresses "192.168.1.100/24" ipv4.gateway "192.168.1.1" ipv4.dns "8.8.8.8"
nmcli connection up eth0     # Activate the connection.

# Configure network interfaces manually:
cat /etc/network/interfaces  # Ubuntu/Debian interface configuration.
cat /etc/sysconfig/network-scripts/ifcfg-eth0  # RHEL/CentOS interface configuration.

# Restart network services using systemctl
systemctl restart NetworkManager
systemctl restart networking  # For Ubuntu/Debian.

# ----------------------
# Routing
# ----------------------

ip route show                # Display routing table.
ip route add 192.168.2.0/24 via 192.168.1.1    # Add static route for a subnet.
ip route del 192.168.2.0/24 via 192.168.1.1    # Remove a static route.

route -n                     # Show kernel IP routing table (older command).

# ----------------------
# DNS Configuration
# ----------------------

cat /etc/resolv.conf         # View DNS servers and configuration.
resolvectl status            # Show detailed DNS configuration with resolvectl.

# DNS troubleshooting tools:
nslookup example.com         # Query DNS records for a domain.
dig example.com              # Perform detailed DNS lookup.
host example.com             # Simple DNS lookup.


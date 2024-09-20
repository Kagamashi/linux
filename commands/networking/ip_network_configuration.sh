ip         # Show/manipulate routing, devices, policy routing, and tunnels
ifconfig   # Configure a network interface (deprecated by ip)
ping       # Send ICMP ECHO_REQUEST to network hosts
traceroute # Print the route packets take to the network host
netstat    # Network statistics
ss         # Utility to investigate sockets
ethtool    # Query or control network driver and hardware settings


# ip – Modern tool for managing network interfaces
ip addr add 192.168.1.10/24 dev eth0                  # Assign static IP to eth0
ip link set dev eth0 up                              # Bring interface up
ip addr show eth0                                   # Show IP address configuration for eth0


# Configuring Static and Dynamic IP Addresses
# ifconfig – Configure Network Interfaces (deprecated, use 'ip' instead)
ifconfig eth0 192.168.1.10 netmask 255.255.255.0 up   # Assign static IP to eth0


ip                                       # show/manipulate routing, devices, policy routing, and tunnels
ifconfig                                 # configure a network interface (deprecated by ip)
ping                                     # send ICMP ECHO_REQUEST to network hosts
traceroute                               # print the route packets take to the network host
netstat                                  # network statistics
ss                                       # utility to investigate sockets
ethtool                                  # query or control network driver and hardware settings

ip addr                                  # show all network interfaces and their addresses
ip link                                  # show all network interfaces
ip route                                 # show the routing table
ip addr add 192.168.1.10/24 dev eth0     # add an IP address to an interface
ip link set eth0 up                      # bring up the network interface

ifconfig                                          # show all network interfaces and their configurations
ifconfig eth0 192.168.1.10 netmask 255.255.255.0  # assign an IP address to eth0

ping example.com                         # send ICMP echo requests to example.com
ping -c 4 192.168.1.1                    # send 4 pings to a specific IP address

traceroute example.com                   # trace the route to example.com
traceroute -n 192.168.1.1                # trace the route without resolving hostnames

netstat -tuln                            # show listening ports and associated addresses
netstat -i                               # show network interface statistics

ss -tuln                                 # show TCP and UDP listening sockets
ss -s                                    # show summary statistics

ethtool eth0                             # display information about the eth0 interface
ethtool -s eth0 speed 1000 duplex full   # set the speed and duplex mode for eth0

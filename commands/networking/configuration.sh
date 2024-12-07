
## IPv4 and IPv6 Addresses
ip addr show                 # display network interface addresses (IPv4/IPv6)
ip -4 addr show              # display only IPv4 addresses
ip -6 addr show              # display only IPv6 addresses

ip addr add 192.168.1.100/24 dev eth0   # add an IPv4 address to an interface
ip addr add 2001:db8::1/64 dev eth0     # add an IPv6 address to an interface

ip addr del 192.168.1.100/24 dev eth0   # remove an IPv4 address from an interface
ip addr del 2001:db8::1/64 dev eth0     # remove an IPv6 address from an interface


## Network Masks, Gateways, DNS
ip route show                           # show the routing table, including default gateway
ip route add default via 192.168.1.1    # add a default gateway (IPv4)
ip -6 route add default via 2001:db8::1 # add a default gateway (IPv6)

cat /etc/resolv.conf                          # display DNS servers
echo "nameserver 8.8.8.8" >> /etc/resolv.conf # add a DNS server (Google DNS)
resolvectl status                             # show DNS configuration with resolvectl


## Configuring Network Interfaces
ifconfig                     # show network interfaces (deprecated)
ip addr                      # display network interfaces and addresses
nmcli                        # MetworkManager CLI for managing connections
nmtui                        # text-based user interface for NetworkManager

# configure network interface (e.g., eth0) with static IP using nmcli
nmcli connection modify eth0 ipv4.method manual ipv4.addresses "192.168.1.100/24" ipv4.gateway "192.168.1.1" ipv4.dns "8.8.8.8"
nmcli connection up eth0                       # activate the connection

# configure network interfaces manually
cat /etc/network/interfaces                    # Ubuntu/Debian interface configuration
cat /etc/sysconfig/network-scripts/ifcfg-eth0  # RHEL/CentOS interface configuration

# Restart network services using systemctl
systemctl restart NetworkManager
systemctl restart networking                   # Ubuntu/Debian


## Routing
ip route show                                  # display routing table
ip route add 192.168.2.0/24 via 192.168.1.1    # add static route for a subnet
ip route del 192.168.2.0/24 via 192.168.1.1    # remove a static route

route -n                     # show kernel IP routing table (older command)


## DNS Configuration
cat /etc/resolv.conf         # view DNS servers and configuration
resolvectl status            # show detailed DNS configuration with resolvectl

# DNS troubleshooting tools
nslookup example.com         # query DNS records for a domain
dig example.com              # perform detailed DNS lookup
host example.com             # simple DNS lookup

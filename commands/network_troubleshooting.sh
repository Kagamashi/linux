
ping                                    # Check the connectivity to a host
traceroute                              # Trace the network path to a host
netstat                                 # Print network connections, routing tables
ss                                      # Utility to investigate sockets

ping example.com                        # Send ICMP echo requests to example.com
ping -c 4 192.168.1.1                  # Send 4 pings to a specific IP address
ping -i 0.5 example.com                 # Ping with a 0.5-second interval between requests

traceroute example.com                  # Trace the route packets take to example.com
traceroute -m 15 192.168.1.1            # Limit the max number of hops to 15

netstat -tuln                           # Show listening TCP and UDP ports
netstat -rn                              # Display the kernel routing table
netstat -a                               # Show all connections and listening ports

ss -tuln                                # Show TCP and UDP listening sockets
ss -s                                   # Show summary statistics for sockets
ss -p | grep LISTEN                      # Show processes listening on sockets

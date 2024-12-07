
ping                                    # check the connectivity to a host
traceroute                              # trace the network path to a host
netstat                                 # print network connections, routing tables
ss                                      # utility to investigate sockets

ping example.com                        # send ICMP echo requests to example.com
ping -c 4 192.168.1.1                   # send 4 pings to a specific IP address
ping -i 0.5 example.com                 # ping with a 0.5-second interval between requests

traceroute example.com                  # trace the route packets take to example.com
traceroute -m 15 192.168.1.1            # limit the max number of hops to 15

netstat -tuln                           # show listening TCP and UDP ports
netstat -rn                             # display the kernel routing table
netstat -a                              # show all connections and listening ports

ss -tuln                                # show TCP and UDP listening sockets
ss -s                                   # show summary statistics for sockets
ss -p | grep LISTEN                     # show processes listening on sockets


# print the route packets take to the network host

traceroute example.com                   # trace the route to example.com
traceroute -n 192.168.1.1                # trace the route without resolving hostnames

traceroute example.com                  # trace the route packets take to example.com
traceroute -m 15 192.168.1.1            # limit the max number of hops to 15

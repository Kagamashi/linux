dig # DNS lookup
nslookup # Query DNS name servers
host # DNS lookup utility


# dig – DNS Lookup
dig example.com                        # Query DNS for A record of example.com
dig +short example.com                 # Short format output for A record of example.com
dig @8.8.8.8 example.com               # Query DNS server 8.8.8.8 for example.com
dig example.com ANY                    # Query all available DNS records for example.com


# nslookup – Query Internet Name Servers Interactively
nslookup example.com                   # Look up the IP address of example.com
nslookup 8.8.8.8                       # Reverse lookup of IP address 8.8.8.8
nslookup -type=MX example.com          # Query mail exchange records for example.com
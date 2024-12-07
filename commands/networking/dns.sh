
dig                                     # DNS lookup
nslookup                                # query DNS name servers
host                                    # DNS lookup utility

dig example.com                         # perform a DNS lookup for example.com
dig +short example.com                  # get a concise answer (short format)
dig example.com ANY                     # query for all records of example.com
dig @8.8.8.8 example.com                # query using a specific DNS server (Google's DNS)

nslookup example.com                    # perform a DNS lookup for example.com
nslookup -type=MX example.com           # query for MX (Mail Exchange) records
nslookup 8.8.8.8                        # lookup the hostname for the given IP address

host example.com                        # perform a DNS lookup for example.com
host -a example.com                     # query all records for example.com
host 8.8.8.8                            # lookup the hostname for the given IP address

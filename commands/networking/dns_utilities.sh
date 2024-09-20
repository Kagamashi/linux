#!/bin/bash

dig                                     # DNS lookup
nslookup                                # Query DNS name servers
host                                    # DNS lookup utility

# dig – DNS lookup
dig example.com                         # Perform a DNS lookup for example.com
dig +short example.com                  # Get a concise answer (short format)
dig example.com ANY                     # Query for all records of example.com
dig @8.8.8.8 example.com                # Query using a specific DNS server (Google's DNS)

# nslookup – Query DNS name servers
nslookup example.com                    # Perform a DNS lookup for example.com
nslookup -type=MX example.com           # Query for MX (Mail Exchange) records
nslookup 8.8.8.8                        # Lookup the hostname for the given IP address

# host – DNS lookup utility
host example.com                        # Perform a DNS lookup for example.com
host -a example.com                     # Query all records for example.com
host 8.8.8.8                            # Lookup the hostname for the given IP address

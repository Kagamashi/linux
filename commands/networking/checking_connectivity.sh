#!/bin/bash

curl                                    # Transfer data from or to a server
wget                                    # Retrieve content from web servers

# curl – Transfer data from or to a server
curl https://example.com                # Fetch the content of a URL
curl -O https://example.com/file.txt    # Download a file and save it with the same name
curl -u username:password https://example.com # Fetch content using HTTP basic authentication
curl -X POST -d "param1=value1&param2=value2" https://example.com/api # Send POST data

# wget – Retrieve content from web servers
wget https://example.com                # Download the HTML content of a webpage
wget -O newfilename.html https://example.com # Save downloaded content with a specified filename
wget -r https://example.com             # Recursively download a website
wget --limit-rate=200k https://example.com # Limit download speed to 200KB/s

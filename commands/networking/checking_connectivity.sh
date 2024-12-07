
curl                                    # transfer data from or to a server
wget                                    # retrieve content from web servers

curl https://example.com                                              # fetch the content of a URL
curl -O https://example.com/file.txt                                  # download a file and save it with the same name
curl -u username:password https://example.com                         # fetch content using HTTP basic authentication
curl -X POST -d "param1=value1&param2=value2" https://example.com/api # send POST data

wget https://example.com                      # download the HTML content of a webpage
wget -O newfilename.html https://example.com  # save downloaded content with a specified filename
wget -r https://example.com                   # recursively download a website
wget --limit-rate=200k https://example.com    # limit download speed to 200KB/s

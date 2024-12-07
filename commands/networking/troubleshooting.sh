
## Basic Network Diagnostic Commands
ping 8.8.8.8                        # test connectivity to an IP address
ping example.com                    # test connectivity to a domain name

traceroute 8.8.8.8                  # trace the path to an IP address (shows hops)
traceroute example.com              # trace the path to a domain

netstat -tuln                       # display listening ports and active connections (deprecated)
ss -tuln                            # show listening sockets (newer tool than netstat)
ss -s                               # display summary of network connections

curl http://example.com             # fetch a web page or content from a URL
wget http://example.com             # download a file from a URL

telnet example.com 80               # test connectivity to a specific port using telnet (HTTP port)
nc -zv example.com 80               # test connectivity to a specific port using netcat (nc)


## Firewall Configuration
# iptables
sudo iptables -L                                    # list firewall rules (IPv4)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # allow SSH on port 22
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT  # allow HTTP on port 80
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT # allow HTTPS on port 443
sudo iptables -A INPUT -j DROP                      # block all other connections
sudo iptables-save                                  # save the firewall rules

# nftables (newer alternative to iptables)
sudo nft list ruleset                                    # list all rules in the nftables ruleset
sudo nft add rule inet filter input tcp dport 22 accept  # allow SSH on port 22
sudo nft add rule inet filter input tcp dport 80 accept  # allow HTTP on port 80
sudo nft add rule inet filter input tcp dport 443 accept # allow HTTPS on port 443
sudo nft add rule inet filter input drop                 # block all other connections

# firewalld
sudo firewall-cmd --list-all                      # list firewall rules for firewalld
sudo firewall-cmd --permanent --add-service=ssh   # allow SSH permanently
sudo firewall-cmd --permanent --add-service=http  # allow HTTP permanently
sudo firewall-cmd --permanent --add-service=https # allow HTTPS permanently
sudo firewall-cmd --reload                        # reload firewalld to apply changes


## Network Services (SSH, HTTP/HTTPS, FTP, DNS)
sudo systemctl status sshd          # check the status of the SSH service
sudo systemctl start sshd           # start the SSH service
sudo systemctl enable sshd          # enable SSH service to start on boot
sudo systemctl stop sshd            # stop the SSH service
sudo systemctl disable sshd         # disable SSH service from starting on boot

sudo systemctl status httpd         # check the status of the HTTP service (Apache)
sudo systemctl start httpd          # start the HTTP service
sudo systemctl enable httpd         # enable HTTP service to start on boot
sudo systemctl stop httpd           # stop the HTTP service
sudo systemctl disable httpd        # disable HTTP service from starting on boot

sudo systemctl status vsftpd        # check the status of the FTP service
sudo systemctl start vsftpd         # start the FTP service
sudo systemctl enable vsftpd        # enable FTP service to start on boot
sudo systemctl stop vsftpd          # stop the FTP service
sudo systemctl disable vsftpd       # disable FTP service from starting on boot

#!/bin/bash

# ----------------------
# Basic Network Diagnostic Commands
# ----------------------

ping 8.8.8.8                        # Test connectivity to an IP address.
ping example.com                    # Test connectivity to a domain name.

traceroute 8.8.8.8                  # Trace the path to an IP address (shows hops).
traceroute example.com              # Trace the path to a domain.

netstat -tuln                       # Display listening ports and active connections (deprecated).
ss -tuln                            # Show listening sockets (newer tool than netstat).
ss -s                               # Display summary of network connections.

curl http://example.com             # Fetch a web page or content from a URL.
wget http://example.com             # Download a file from a URL.

telnet example.com 80               # Test connectivity to a specific port using telnet (HTTP port).
nc -zv example.com 80               # Test connectivity to a specific port using netcat (nc).

# ----------------------
# Firewall Configuration
# ----------------------

# iptables
sudo iptables -L                    # List firewall rules (IPv4).
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # Allow SSH on port 22.
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT  # Allow HTTP on port 80.
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT # Allow HTTPS on port 443.
sudo iptables -A INPUT -j DROP      # Block all other connections.
sudo iptables-save                  # Save the firewall rules.

# nftables (newer alternative to iptables)
sudo nft list ruleset               # List all rules in the nftables ruleset.
sudo nft add rule inet filter input tcp dport 22 accept  # Allow SSH on port 22.
sudo nft add rule inet filter input tcp dport 80 accept  # Allow HTTP on port 80.
sudo nft add rule inet filter input tcp dport 443 accept # Allow HTTPS on port 443.
sudo nft add rule inet filter input drop  # Block all other connections.

# firewalld
sudo firewall-cmd --list-all        # List firewall rules for firewalld.
sudo firewall-cmd --permanent --add-service=ssh  # Allow SSH permanently.
sudo firewall-cmd --permanent --add-service=http # Allow HTTP permanently.
sudo firewall-cmd --permanent --add-service=https # Allow HTTPS permanently.
sudo firewall-cmd --reload          # Reload firewalld to apply changes.

# ----------------------
# Network Services (SSH, HTTP/HTTPS, FTP, DNS)
# ----------------------

sudo systemctl status sshd          # Check the status of the SSH service.
sudo systemctl start sshd           # Start the SSH service.
sudo systemctl enable sshd          # Enable SSH service to start on boot.
sudo systemctl stop sshd            # Stop the SSH service.
sudo systemctl disable sshd         # Disable SSH service from starting on boot.

sudo systemctl status httpd         # Check the status of the HTTP service (Apache).
sudo systemctl start httpd          # Start the HTTP service.
sudo systemctl enable httpd         # Enable HTTP service to start on boot.
sudo systemctl stop httpd           # Stop the HTTP service.
sudo systemctl disable httpd        # Disable HTTP service from starting on boot.

sudo systemctl status vsftpd        # Check the status of the FTP service.
sudo systemctl start vsftpd         # Start the FTP service.
sudo systemctl enable vsftpd        # Enable FTP service to start on boot.
sudo systemctl stop vsftpd          # Stop the FTP service.
sudo systemctl disable vsftpd       # Disable FTP service from starting on boot.

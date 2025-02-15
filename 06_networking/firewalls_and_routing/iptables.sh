
# administer IP packet filter rules

iptables -L                                   # list all current iptables rules
iptables -A INPUT -s 192.168.1.100 -j ACCEPT  # allow incoming traffic from a specific IP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT # allow incoming SSH connections
iptables -F                                   # flush all rules (use with caution)


## Firewall Configuration
# iptables
sudo iptables -L                                    # list firewall rules (IPv4)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT  # allow SSH on port 22
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT  # allow HTTP on port 80
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT # allow HTTPS on port 443
sudo iptables -A INPUT -j DROP                      # block all other connections
sudo iptables-save                                  # save the firewall rules

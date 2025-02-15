

# nftables (newer alternative to iptables)
sudo nft list ruleset                                    # list all rules in the nftables ruleset
sudo nft add rule inet filter input tcp dport 22 accept  # allow SSH on port 22
sudo nft add rule inet filter input tcp dport 80 accept  # allow HTTP on port 80
sudo nft add rule inet filter input tcp dport 443 accept # allow HTTPS on port 443
sudo nft add rule inet filter input drop                 # block all other connections

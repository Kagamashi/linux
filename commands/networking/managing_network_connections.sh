
nmcli                                   # command-line client for NetworkManager
nmtui                                   # text user interface for NetworkManager
iwconfig                                # configure wireless network interfaces
iptables                                # administer IP packet filter rules

nmcli device show                       # show detailed information about all network devices
nmcli connection show                   # list all connections managed by NetworkManager
nmcli connection up <connection_name>   # bring a connection up
nmcli connection down <connection_name> # bring a connection down

iwconfig                                # show wireless interface configurations
iwconfig wlan0 essid "MyNetwork"        # connect to a specific wireless network
iwconfig wlan0 key s:password           # connect with a WEP key

iptables -L                                   # list all current iptables rules
iptables -A INPUT -s 192.168.1.100 -j ACCEPT  # allow incoming traffic from a specific IP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT # allow incoming SSH connections
iptables -F                                   # flush all rules (use with caution)

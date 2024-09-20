nmcli # Command-line client for NetworkManager
nmtui # Text user interface for NetworkManager
iwconfig # Configure wireless network interfaces
iptables # Administer IP packet filter rules


# nmcli – Network Manager Command Line Interface
nmcli device status                   # Show the status of all network devices
nmcli connection show                 # Show all network connections
nmcli connection up id <connection_name> # Bring up a network connection by name
nmcli connection down id <connection_name> # Bring down a network connection by name
nmcli con mod "System eth0" ipv4.addresses 192.168.1.10/24 # Set static IP for a connection
nmcli con up "System eth0"                          # Apply the changes and bring the connection up
nmcli d show eth0                                  # Show detailed information about the eth0 interface



## Bonding and Teaming
# Install necessary packages for bonding (Ubuntu/Debian)
sudo apt install ifenslave -y

# Install necessary packages for bonding (CentOS/RHEL)
sudo yum install teamd -y

# Create bonding interface using nmcli
nmcli connection add type bond con-name bond0 ifname bond0 mode active-backup
nmcli connection modify bond0 ipv4.addresses "192.168.1.100/24" ipv4.gateway "192.168.1.1" ipv4.method manual
nmcli connection add type ethernet con-name slave1 ifname eth0 master bond0
nmcli connection add type ethernet con-name slave2 ifname eth1 master bond0
nmcli connection up bond0

# Configure bonding in /etc/network/interfaces (Ubuntu/Debian)
echo "
auto bond0
iface bond0 inet static
  address 192.168.1.100
  netmask 255.255.255.0
  gateway 192.168.1.1
  bond-mode active-backup
  bond-miimon 100
  bond-slaves eth0 eth1
" | sudo tee -a /etc/network/interfaces

# Configure bonding in ifcfg (CentOS/RHEL)
echo "
DEVICE=bond0
TYPE=Bond
BONDING_OPTS="mode=active-backup miimon=100"
IPADDR=192.168.1.100
PREFIX=24
GATEWAY=192.168.1.1
" | sudo tee /etc/sysconfig/network-scripts/ifcfg-bond0

# Bring up the bond
sudo ifup bond0


## Bridging
# Install bridge utilities
sudo apt install bridge-utils -y  # Ubuntu/Debian
sudo yum install bridge-utils -y  # CentOS/RHEL

# Create a bridge using brctl
sudo brctl addbr br0
sudo brctl addif br0 eth0
sudo ip addr add 192.168.1.200/24 dev br0
sudo ip link set br0 up

# Configure bridge in /etc/network/interfaces (Ubuntu/Debian)
echo "
auto br0
iface br0 inet static
  address 192.168.1.200
  netmask 255.255.255.0
  bridge_ports eth0
" | sudo tee -a /etc/network/interfaces

# Bring the bridge up
sudo ifup br0


## VLANs (Virtual LANs)
# Install vlan package (Ubuntu/Debian)
sudo apt install vlan -y

# Install vlan package (CentOS/RHEL)
sudo yum install vconfig -y

# Add VLAN to an interface using ip command
sudo ip link add link eth0 name eth0.100 type vlan id 100
sudo ip addr add 192.168.100.1/24 dev eth0.100
sudo ip link set eth0.100 up

# Add VLAN using vconfig (older method)
sudo vconfig add eth0 100
sudo ifconfig eth0.100 192.168.100.1 netmask 255.255.255.0 up

# Add VLAN configuration in /etc/network/interfaces (Ubuntu/Debian)
echo "
auto eth0.100
iface eth0.100 inet static
  address 192.168.100.1
  netmask 255.255.255.0
  vlan-raw-device eth0
" | sudo tee -a /etc/network/interfaces

# Bring the VLAN interface up
sudo ifup eth0.100

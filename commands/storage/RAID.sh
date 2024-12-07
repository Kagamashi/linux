
### Software RAID Setup using mdadm
# install mdadm package (Ubuntu/Debian)
sudo apt install mdadm -y

# install mdadm package (CentOS/RHEL)
sudo yum install mdadm -y

sudo mdadm --create /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb
sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb
sudo mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sda /dev/sdb /dev/sdc
sudo mdadm --create /dev/md0 --level=6 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd
sudo mdadm --create /dev/md0 --level=10 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd


### Managing RAID Arrays
# save RAID configuration
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf  # Debian-based systems
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm.conf        # RHEL-based systems

# assemble an existing RAID array
sudo mdadm --assemble /dev/md0 /dev/sda /dev/sdb

# stop a RAID array
sudo mdadm --stop /dev/md0

# remove a RAID array
sudo mdadm --remove /dev/md0

# add a new device to a RAID array
sudo mdadm --manage /dev/md0 --add /dev/sdc


### Monitoring RAID Arrays
cat /proc/mdstat
sudo mdadm --detail /dev/md0
watch cat /proc/mdstat  # continuously monitor RAID status

#!/bin/bash

# ----------------------
# Software RAID Setup using mdadm
# ----------------------

# Install mdadm package (Ubuntu/Debian)
sudo apt install mdadm -y

# Install mdadm package (CentOS/RHEL)
sudo yum install mdadm -y

# Create a RAID 0 array
sudo mdadm --create /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb

# Create a RAID 1 array
sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sda /dev/sdb

# Create a RAID 5 array
sudo mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sda /dev/sdb /dev/sdc

# Create a RAID 6 array
sudo mdadm --create /dev/md0 --level=6 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd

# Create a RAID 10 array
sudo mdadm --create /dev/md0 --level=10 --raid-devices=4 /dev/sda /dev/sdb /dev/sdc /dev/sdd

# ----------------------
# Managing RAID Arrays
# ----------------------

# Save RAID configuration
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf  # For Debian-based systems.
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm.conf        # For RHEL-based systems.

# Assemble an existing RAID array
sudo mdadm --assemble /dev/md0 /dev/sda /dev/sdb

# Stop a RAID array
sudo mdadm --stop /dev/md0

# Remove a RAID array
sudo mdadm --remove /dev/md0

# Add a new device to a RAID array
sudo mdadm --manage /dev/md0 --add /dev/sdc

# ----------------------
# Monitoring RAID Arrays
# ----------------------

# View RAID status
cat /proc/mdstat

# Detailed information about RAID arrays
sudo mdadm --detail /dev/md0

# Monitor RAID array rebuilding (if applicable)
watch cat /proc/mdstat  # Continuously monitor RAID status.

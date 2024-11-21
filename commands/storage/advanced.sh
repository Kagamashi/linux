#!/bin/bash

# ----------------------
# Automating Mounts with fstab
# ----------------------

# View the current /etc/fstab file
cat /etc/fstab

# Example entry in /etc/fstab to mount a partition automatically
echo "/dev/sda1 /mnt ext4 defaults 0 2" | sudo tee -a /etc/fstab  # Automatically mount /dev/sda1 at /mnt with default options.

# Example with specific options (read-only)
echo "/dev/sdb1 /mnt ext4 ro,noauto 0 2" | sudo tee -a /etc/fstab  # Read-only, no auto-mount at boot.

# Mount all filesystems listed in /etc/fstab
sudo mount -a

# ----------------------
# Swap Management
# ----------------------

# Check the current swap status
sudo swapon --show               # Display active swap areas.

# Create a swap file (e.g., 2GB swap file)
sudo fallocate -l 2G /swapfile   # Create a 2GB swap file.
sudo chmod 600 /swapfile         # Set the correct permissions.
sudo mkswap /swapfile            # Set up the swap space.
sudo swapon /swapfile            # Enable the swap file.

# Add the swap file to /etc/fstab for automatic activation at boot
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab

# Turn off swap
sudo swapoff /swapfile           # Disable the swap file.

# Remove swap from /etc/fstab if needed
sudo sed -i '/\/swapfile/d' /etc/fstab

# Modify swap settings with sysctl (e.g., adjusting swappiness)
sudo sysctl vm.swappiness=10     # Reduce swappiness (lower value means less aggressive swapping).
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf  # Make swappiness permanent.

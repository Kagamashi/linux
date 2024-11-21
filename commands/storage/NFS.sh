#!/bin/bash

# ----------------------
# NFS (Network File System)
# ----------------------

# Install NFS server (Ubuntu/Debian)
sudo apt update && sudo apt install nfs-kernel-server -y

# Install NFS server (CentOS/RHEL)
sudo yum install nfs-utils -y

# Configure NFS exports in /etc/exports
echo "/srv/nfs_share 192.168.1.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# Apply the NFS export configuration
sudo exportfs -a

# Start and enable NFS service (Ubuntu/Debian)
sudo systemctl start nfs-kernel-server
sudo systemctl enable nfs-kernel-server

# Start and enable NFS service (CentOS/RHEL)
sudo systemctl start nfs-server
sudo systemctl enable nfs-server

# Install NFS client (Ubuntu/Debian)
sudo apt install nfs-common -y

# Install NFS client (CentOS/RHEL)
sudo yum install nfs-utils -y

# Mount NFS share
sudo mount 192.168.1.100:/srv/nfs_share /mnt

# Add to /etc/fstab for automatic mounting at boot
echo "192.168.1.100:/srv/nfs_share /mnt nfs defaults 0 0" | sudo tee -a /etc/fstab

# ----------------------
# Samba (SMB/CIFS)
# ----------------------

# Install Samba (Ubuntu/Debian)
sudo apt install samba -y

# Install Samba (CentOS/RHEL)
sudo yum install samba samba-client samba-common -y

# Configure Samba share in /etc/samba/smb.conf
echo "
[sambashare]
   path = /srv/samba_share
   valid users = @sambashare
   guest ok = no
   writable = yes
   browsable = yes
" | sudo tee -a /etc/samba/smb.conf

# Create a directory to share and set permissions
sudo mkdir -p /srv/samba_share
sudo chown -R nobody:nogroup /srv/samba_share

# Add a Samba user and password
sudo smbpasswd -a your_username

# Create a Samba group and add users
sudo groupadd sambashare
sudo usermod -aG sambashare your_username

# Restart Samba service
sudo systemctl restart smbd
sudo systemctl enable smbd

# Check Samba status
sudo systemctl status smbd

# Access Samba share from Windows by navigating to \\192.168.1.100\sambashare

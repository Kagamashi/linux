
### NFS (Network File System)
# install NFS server (Ubuntu/Debian)
sudo apt update && sudo apt install nfs-kernel-server -y

# install NFS server (CentOS/RHEL)
sudo yum install nfs-utils -y

# configure NFS exports in /etc/exports
echo "/srv/nfs_share 192.168.1.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# apply the NFS export configuration
sudo exportfs -a

# start and enable NFS service (Ubuntu/Debian)
sudo systemctl start nfs-kernel-server
sudo systemctl enable nfs-kernel-server

# start and enable NFS service (CentOS/RHEL)
sudo systemctl start nfs-server
sudo systemctl enable nfs-server

# install NFS client (Ubuntu/Debian)
sudo apt install nfs-common -y

# install NFS client (CentOS/RHEL)
sudo yum install nfs-utils -y

# mount NFS share
sudo mount 192.168.1.100:/srv/nfs_share /mnt

# add to /etc/fstab for automatic mounting at boot
echo "192.168.1.100:/srv/nfs_share /mnt nfs defaults 0 0" | sudo tee -a /etc/fstab


### Samba (SMB/CIFS)
# install Samba (Ubuntu/Debian)
sudo apt install samba -y

# install Samba (CentOS/RHEL)
sudo yum install samba samba-client samba-common -y

# configure Samba share in /etc/samba/smb.conf
echo "
[sambashare]
   path = /srv/samba_share
   valid users = @sambashare
   guest ok = no
   writable = yes
   browsable = yes
" | sudo tee -a /etc/samba/smb.conf

# create a directory to share and set permissions
sudo mkdir -p /srv/samba_share
sudo chown -R nobody:nogroup /srv/samba_share

# add a Samba user and password
sudo smbpasswd -a your_username

# create a Samba group and add users
sudo groupadd sambashare
sudo usermod -aG sambashare your_username

# restart Samba service
sudo systemctl restart smbd
sudo systemctl enable smbd

# check Samba status
sudo systemctl status smbd

# Access Samba share from Windows by navigating to \\192.168.1.100\sambashare

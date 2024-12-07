
## Automating Mounts with fstab
# view the current /etc/fstab file
cat /etc/fstab

# example entry in /etc/fstab to mount a partition automatically
echo "/dev/sda1 /mnt ext4 defaults 0 2" | sudo tee -a /etc/fstab   # automatically mount /dev/sda1 at /mnt with default options

# example with specific options (read-only)
echo "/dev/sdb1 /mnt ext4 ro,noauto 0 2" | sudo tee -a /etc/fstab  # read-only, no auto-mount at boot

# mount all filesystems listed in /etc/fstab
sudo mount -a


## Swap Management
# check the current swap status
sudo swapon --show               # Display active swap areas.

# create a swap file (e.g., 2GB swap file)
sudo fallocate -l 2G /swapfile   # create a 2GB swap file
sudo chmod 600 /swapfile         # set the correct permissions
sudo mkswap /swapfile            # set up the swap space
sudo swapon /swapfile            # enable the swap file

# add the swap file to /etc/fstab for automatic activation at boot
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab

# turn off swap
sudo swapoff /swapfile           # disable the swap file

# remove swap from /etc/fstab if needed
sudo sed -i '/\/swapfile/d' /etc/fstab

# modify swap settings with sysctl (e.g., adjusting swappiness)
sudo sysctl vm.swappiness=10                            # reduce swappiness (lower value means less aggressive swapping)
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf  # make swappiness permanent

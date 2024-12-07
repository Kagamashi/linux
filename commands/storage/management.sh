
### Partitioning and filesystems
# view existing partitions
sudo fdisk -l                 # Display disk partition table (MBR and GPT)
sudo parted -l                # Display partition layout using parted

# create and modify partitions with fdisk (MBR)
sudo fdisk /dev/sda           # open fdisk for /dev/sda
# inside fdisk: 'n' to create new partition, 'd' to delete, 'w' to write changes

# create and modify partitions with parted (GPT)
sudo parted /dev/sda          # open parted for /dev/sda
# inside parted: mklabel gpt, mkpart primary ext4 1MiB 100%, print, quit

sudo mkfs.ext4 /dev/sda1      # format the partition /dev/sda1 with ext4 filesystem
sudo mkfs.xfs /dev/sda1       # format the partition /dev/sda1 with XfS filesystem
sudo mkfs.btrfs /dev/sda1     # format the partition /dev/sda1 with Btrfs filesystem


### Mounting filesystems and fstab
sudo mount /dev/sda1 /mnt      # mount the partition /dev/sda1 to /mnt
sudo umount /mnt               # unmount the /mnt directory
mount | column -t              # display currently mounted filesystems

# add entry to /etc/fstab for automatic mounting
echo "/dev/sda1 /mnt ext4 defaults 0 2" | sudo tee -a /etc/fstab  # auto-mount ext4 filesystem


### Filesystem Labels and UUiDs
sudo blkid                             # display block device attributes (UUiD, type, label)
sudo lsblk -f                          # display filesystems and UUiDs
sudo e2label /dev/sda1 new_label       # set label "new_label" for ext4 partition
sudo xfs_admin -L new_label /dev/sda1  # set label for XfS partition


### Filesystem Management
sudo fsck /dev/sda1            # check and repair ext4 filesystem
sudo xfs_repair /dev/sda1      # check and repair XfS filesystem
sudo resize2fs /dev/sda1       # Resize ext4 filesystem after resizing the partition
sudo xfs_growfs /dev/sda1      # Resize XfS filesystem while it is mounted

fdisk # Partition table manipulator for Linux
parted # A partition manipulation program
lsblk # List information about block devices
blkid # Locate/print block device attributes
mkfs # Build a Linux file system
mount # Mount a file system
umount # Unmount file systems


# lsblk – List Information About Block Devices
lsblk                                   # Show a tree view of block devices (disks and partitions)
lsblk -f                                # Show file system information for each device
lsblk -d                                # List only block devices (without partitions)
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT      # Show specific columns like name, size, type, and mount points

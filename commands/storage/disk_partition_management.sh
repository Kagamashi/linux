
fdisk                                   # partition table manipulator for Linux
parted                                  # partition manipulation program
lsblk                                   # list information about block devices
blkid                                   # locate/print block device attributes
mkfs                                    # build a Linux file system
mount                                   # mount a file system
umount                                  # unmount file systems

fdisk -l                                # list all partitions on all disks
fdisk /dev/sda                          # open fdisk for a specific disk (e.g., /dev/sda)

parted /dev/sda                         # open parted for a specific disk (e.g., /dev/sda)
parted /dev/sda print                   # print partition table of the specified disk

lsblk                                   # list all block devices
lsblk -f                                # list block devices with filesystem information

blkid                                   # show attributes of all block devices
blkid /dev/sda1                         # show attributes of a specific block device

mkfs.ext4 /dev/sda1                     # create an ext4 filesystem on /dev/sda1
mkfs.vfat /dev/sdb1                     # create a FAT32 filesystem on /dev/sdb1

mount /dev/sda1 /mnt                    # mount the filesystem on /dev/sda1 to /mnt
mount -o loop image.iso /mnt            # mount an ISO file

umount /mnt                             # unmount the filesystem mounted at /mnt
umount -a                               # unmount all mounted filesystems

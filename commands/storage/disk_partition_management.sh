#!/bin/bash

fdisk                                   # Partition table manipulator for Linux
parted                                  # A partition manipulation program
lsblk                                   # List information about block devices
blkid                                   # Locate/print block device attributes
mkfs                                    # Build a Linux file system
mount                                   # Mount a file system
umount                                  # Unmount file systems

# fdisk – Partition table manipulator for Linux
fdisk -l                                # List all partitions on all disks
fdisk /dev/sda                          # Open fdisk for a specific disk (e.g., /dev/sda)

# parted – A partition manipulation program
parted /dev/sda                         # Open parted for a specific disk (e.g., /dev/sda)
parted /dev/sda print                   # Print partition table of the specified disk

# lsblk – List information about block devices
lsblk                                   # List all block devices
lsblk -f                                # List block devices with filesystem information

# blkid – Locate/print block device attributes
blkid                                   # Show attributes of all block devices
blkid /dev/sda1                         # Show attributes of a specific block device

# mkfs – Build a Linux file system
mkfs.ext4 /dev/sda1                     # Create an ext4 filesystem on /dev/sda1
mkfs.vfat /dev/sdb1                     # Create a FAT32 filesystem on /dev/sdb1

# mount – Mount a file system
mount /dev/sda1 /mnt                    # Mount the filesystem on /dev/sda1 to /mnt
mount -o loop image.iso /mnt            # Mount an ISO file

# umount – Unmount file systems
umount /mnt                             # Unmount the filesystem mounted at /mnt
umount -a                               # Unmount all mounted filesystems

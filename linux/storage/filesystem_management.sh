#!/bin/bash

# FILE SYSTEM CREATION
# mkfs, tune2fs, e2fsck, resize2fs, xfs_growfs


# Filesystem Management
# mkfs – Create a Filesystem
mkfs.ext4 /dev/sdX1                   # Create an ext4 filesystem on partition /dev/sdX1
mkfs.xfs /dev/sdX1                    # Create an XFS filesystem on partition /dev/sdX1
mkfs.vfat /dev/sdX1                   # Create a FAT filesystem on partition /dev/sdX1

# tune2fs – Adjust Parameters of an ext2/ext3/ext4 Filesystem
tune2fs -l /dev/sdX1                  # List parameters of the filesystem on /dev/sdX1
tune2fs -m 1 /dev/sdX1                # Set reserved blocks percentage to 1% on /dev/sdX1

# e2fsck – Check a Linux Ext2/ext3/ext4 Filesystem
e2fsck -f /dev/sdX1                   # Force check the filesystem on /dev/sdX1
e2fsck -n /dev/sdX1                   # Check the filesystem without making changes


# Resizing Filesystems
# resize2fs – Resize an ext2/ext3/ext4 Filesystem
resize2fs /dev/sdX1                   # Automatically resize the filesystem on /dev/sdX1 to fit the partition size
resize2fs /dev/sdX1 20G               # Resize the filesystem on /dev/sdX1 to 20GB

# xfs_growfs – Increase the Size of an XFS Filesystem
xfs_growfs /dev/sdX1                  # Grow the XFS filesystem on /dev/sdX1 to use all available space
xfs_growfs -D 1000000 /dev/sdX1       # Grow the XFS filesystem on /dev/sdX1 by a specific number of bytes (e.g., 1,000,000 bytes)
